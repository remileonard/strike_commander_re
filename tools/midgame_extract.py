#!/usr/bin/env python3
"""
midgame_extract.py — extrait le script d'une cinématique (« midgame ») d'OPTEST.EXE.

Une cinématique est une fonction C++ qui enchaîne des scènes en appelant le
moteur (scène, calques, palettes, sons ; voir analysis/MIDGAME_SYSTEM.md).
Cet outil exécute la fonction de façon symbolique, instruction par
instruction, et la réécrit en pseudo-code lisible :

  - chaque appel connu du moteur devient une opération avec ses arguments
    interprétés (ressource « mid1 11 », position, numéro d'image…) ;
  - les écritures dans les calques, la scène et les variables deviennent des
    affectations (« c12.x = T1.mot[2·compteur] + base ») ;
  - les boucles et les tests deviennent « tant que » et « si » ;
  - les tableaux copiés depuis le segment de données sont décodés ;
  - chaque ligne garde le numéro de la ligne source de l'assembleur.

Les valeurs sont celles de l'exécutable, sans correction. Ce qui n'est pas
reconnu est recopié tel quel (lignes « asm: »).

Le catalogue du moteur (signatures, tables de méthodes, champs) est dans
analysis/<exe>/midgame_engine.json, indexé par les noms de known_functions.json.

Usage (depuis la racine de l'archive) :
    python3 tools/midgame_extract.py --exe optest Midgame1_PlayPart1_5FCF0 --name mid1

Sorties : analysis/<exe>/midgames/<nom>.md (rapport) et <nom>.json (scènes,
calques, opérations, tableaux).
"""
import json
import os
import re
import sys

from exe_paths import paths, pop_exe_arg

LARGE_REGION = 64
SERVICE = ('res', 'palette', 'pak', 'path', 'stream', 'channel', 'voice', 'font', 'other', 'widget')
INIT_WINDOW = 24


# ---------------------------------------------------------------------------
# Lecture de l'assembleur

def load_source(exe):
    p = paths(exe)
    lines = open(p['asm'], encoding='cp437', errors='replace').read().split('\n')
    known = json.load(open(p['known_functions'], encoding='utf-8'))
    index = json.load(open(p['function_index'], encoding='utf-8'))
    engine = json.load(open(os.path.join(p['analysis'], 'midgame_engine.json'), encoding='utf-8'))
    return lines, known, index, engine


def build_renamer(known):
    subst = {k: v['new_name'] for k, v in known.items() if not k.startswith('unnamed_')}
    pattern = re.compile(r'\b(' + '|'.join(re.escape(k) for k in subst) + r')\b')
    return subst, pattern


def find_function(name, known, index):
    for addr, info in index.items():
        if addr == name or info['new_name'] == name:
            return addr, info
    raise SystemExit(f"Fonction '{name}' introuvable dans l'index.")


def parse_number(text):
    text = text.strip()
    negative = text.startswith('-')
    if negative:
        text = text[1:]
    if text.lower().endswith('h'):
        value = int(text[:-1], 16)
    else:
        value = int(text)
    return -value if negative else value


# ---------------------------------------------------------------------------
# Segment de données : chaînes et octets

class DataSegment:
    def __init__(self, lines, base):
        self.base = base
        self.bytes = {}
        self.label_addr = {}
        self.strings = {}
        start = next(i for i, l in enumerate(lines) if re.match(r'^dseg\s+segment', l))
        end = next(i for i in range(start, len(lines)) if re.match(r'^dseg\s+ends', lines[i]))
        address = None
        for line in lines[start + 1:end]:
            label = None
            m = re.match(r'^([A-Za-z_]\w*)(:?)\s*(.*)$', line)
            rest = line
            if m and not line[0].isspace():
                label = m.group(1)
                rest = '\t' + m.group(3)
                sm = re.search(r'_([0-9A-F]{5})$', label)
                if sm:
                    address = int(sm.group(1), 16)
            if address is None:
                continue
            if label:
                self.label_addr[label] = address
            data = self.parse_data(rest)
            if data is None:
                continue
            if label and label.startswith('a') and data and data[-1] == 0:
                self.strings[label] = bytes(data[:-1]).decode('cp437', errors='replace')
            for b in data:
                self.bytes[address] = b
                address += 1

    @staticmethod
    def split_operands(text):
        out = []
        cur = ''
        quoted = False
        depth = 0
        i = 0
        while i < len(text):
            c = text[i]
            if c == "'":
                if quoted and i + 1 < len(text) and text[i + 1] == "'":
                    cur += "''"
                    i += 2
                    continue
                quoted = not quoted
            if not quoted and c == ';':
                break
            if not quoted and c == '(':
                depth += 1
            if not quoted and c == ')':
                depth -= 1
            if c == ',' and not quoted and depth == 0:
                out.append(cur)
                cur = ''
            else:
                cur += c
            i += 1
        out.append(cur)
        return out

    def parse_data(self, text):
        mu = re.match(r'^\s+unicode\s+0,\s*<(.*)>\s*$', text)
        if mu:
            out = []
            for ch in mu.group(1):
                out.append(ch.encode('cp437', errors='replace')[0])
                out.append(0)
            return out
        m = re.match(r'^\s+(db|dw|dd)\s+(.*)$', text)
        if not m:
            return None
        size = {'db': 1, 'dw': 2, 'dd': 4}[m.group(1)]
        out = []
        for part in self.split_operands(m.group(2)):
            part = part.strip()
            if not part:
                continue
            if part.startswith("'"):
                out += list(part[1:-1].replace("''", "'").encode('cp437', errors='replace'))
                continue
            d = re.match(r'(\w+)\s+dup\s*\((.*)\)', part)
            if d:
                inner = d.group(2).strip()
                value = 0 if inner == '?' else parse_number(inner)
                for _ in range(parse_number(d.group(1))):
                    out += list((value & ((1 << (8 * size)) - 1)).to_bytes(size, 'little'))
                continue
            try:
                value = parse_number(part)
            except ValueError:
                value = 0
            out += list((value & ((1 << (8 * size)) - 1)).to_bytes(size, 'little'))
        return out

    def address_of(self, label):
        if label in self.label_addr:
            return self.label_addr[label]
        sm = re.search(r'_([0-9A-F]{5})$', label)
        if sm:
            return int(sm.group(1), 16)
        return None

    def words(self, address, count):
        out = []
        for k in range(count):
            lo = self.bytes.get(address + 2 * k, 0)
            hi = self.bytes.get(address + 2 * k + 1, 0)
            w = lo | (hi << 8)
            out.append(w - 65536 if w > 32767 else w)
        return out


# ---------------------------------------------------------------------------
# Valeurs symboliques

def const(n):
    return ('const', n)


def unknown(text=''):
    return ('unk', text)


def is_const(v):
    return v[0] == 'const'


def simplify(v):
    if v[0] != 'bin':
        return v
    op, a, b = v[1], simplify(v[2]), simplify(v[3])
    if is_const(a) and is_const(b):
        x, y = a[1], b[1]
        if op == '+':
            return const(x + y)
        if op == '-':
            return const(x - y)
        if op == '*':
            return const(x * y)
        if op == '/' and y:
            return const(int(x / y))
        if op == '&':
            return const(x & y)
    if op == '+' and is_const(b) and b[1] == 0:
        return a
    if op == '+' and is_const(a) and a[1] == 0:
        return b
    if op == '-' and is_const(b) and b[1] == 0:
        return a
    if op == '*' and is_const(b) and b[1] == 1:
        return a
    if op == '*' and is_const(b) and b[1] == -1:
        return ('neg', a)
    if op == '+' and is_const(b) and b[1] < 0:
        return ('bin', '-', a, const(-b[1]))
    if op == '+' and a[0] == 'bin' and a[1] == '+' and is_const(a[3]) and is_const(b):
        return simplify(('bin', '+', a[2], const(a[3][1] + b[1])))
    return ('bin', op, a, b)


# ---------------------------------------------------------------------------
# Objets (calques, scène, ressources, palettes…)

class Obj:
    def __init__(self, oid, kind, name):
        self.id = oid
        self.kind = kind
        self.name = name
        self.type = None
        self.raw = {}
        self.offset = None
        self.content = None
        self.info = {}
        self.stride = None


class Extractor:
    def __init__(self, exe, lines, known, index, engine):
        self.exe = exe
        self.lines = lines
        self.known = known
        self.index = index
        self.engine = engine
        self.funcs = engine['functions']
        self.vtables = {int(k): v for k, v in engine['vtables'].items()}
        self.secondary = set(engine.get('secondary_vtables', []))
        self.dseg = DataSegment(lines, engine['dseg_base'])
        self.subst, self.pattern = build_renamer(known)
        self.objects = {}
        self.counters = {}
        self.tables = []
        self.local_names = {}
        self.arg_names = {}

    # --- objets -----------------------------------------------------------
    def new_obj(self, kind, prefix):
        self.counters[prefix] = self.counters.get(prefix, 0) + 1
        self.next_id = getattr(self, 'next_id', 0) + 1
        oid = self.next_id
        obj = Obj(oid, kind, f'{prefix}{self.counters[prefix]}')
        self.objects[oid] = obj
        return obj

    def obj_label(self, obj):
        if obj.kind == 'res' and obj.content:
            return obj.content
        if obj.kind == 'palette' and obj.content:
            return f'{obj.name}({obj.content})'
        if obj.kind == 'pak' and obj.content:
            return f'pak {obj.content}'
        return obj.name

    # --- rendu ------------------------------------------------------------
    def render(self, v, top=True):
        k = v[0]
        if k == 'const':
            return str(v[1])
        if k == 'obj':
            return self.obj_label(self.objects[v[1]])
        if k == 'field' and v[2] == 2 and self.objects[v[1]].kind == 'array':
            return f'{self.objects[v[1]].name}[0]'
        if k == 'field':
            obj = self.objects[v[1]]
            return f'{self.obj_label(obj)}.{self.field_name(obj, v[2])}'
        if k == 'fieldaddr':
            obj = self.objects[v[1]]
            if obj.stride:
                return f'{obj.name}[{v[2] // obj.stride}]' if v[2] % obj.stride == 0 else f'&{obj.name}+{v[2]}'
            return f'&{obj.name}+{v[2]}'
        if k == 'local':
            return self.local_name(v[1])
        if k == 'addr':
            return f'&{self.local_name(v[1])}'
        if k == 'arg':
            return self.arg_names.get(v[1], f'arg_{v[1]}')
        if k == 'glob':
            return v[1]
        if k == 'str':
            text = self.dseg.strings.get(v[1])
            return f'"{text}"' if text is not None else v[1]
        if k == 'ret':
            return f'{v[1]}()'
        if k == 'reg':
            return v[1]
        if k == 'tab':
            table, index = v[1], v[2]
            return f'{table}.mot[{self.render(index)}]'
        if k == 'deref':
            return f'{self.render(v[1], False)}→{v[2]}'
        if k == 'bin' and v[1] == '+':
            for o, x in ((v[2], v[3]), (v[3], v[2])):
                if o[0] == 'field' and o[2] == 2 and self.objects[o[1]].kind == 'array':
                    if x[0] == 'field' and x[1] == o[1] and x[2] == 0:
                        return f'{self.objects[o[1]].name}[1]'
                    if x[0] == 'bin' and x[1] == '*' and x[2][0] == 'field' and x[2][1] == o[1] and x[2][2] == 0 and is_const(x[3]):
                        return f'{self.objects[o[1]].name}[{x[3][1]}]'
                    if x[0] == 'bin' and x[1] == '+' and x[2][0] == 'bin' and x[2][1] == '*' and x[3][0] == 'field' and x[3][1] == o[1]:
                        inner = x[2]
                        if inner[2][0] == 'field' and inner[2][2] == 0 and is_const(inner[3]):
                            return f'{self.objects[o[1]].name}[{inner[3][1] + 1}]'
            for o, x in ((v[2], v[3]), (v[3], v[2])):
                if o[0] == 'obj' and self.objects[o[1]].stride and x[0] == 'bin' and x[1] == '*' and is_const(x[3]) and x[3][1] == self.objects[o[1]].stride:
                    return f'{self.objects[o[1]].name}[{self.render(x[2])}]'
        if k == 'callres':
            return v[2]
        if k == 'neg':
            return f'-{self.render(v[1], False)}'
        if k == 'bin':
            a = self.render(v[2], False)
            b = self.render(v[3], False)
            op = {'*': '·'}.get(v[1], v[1])
            text = f'{a} {op} {b}' if v[1] not in ('*',) else f'{a}·{b}'
            return text if top else f'({text})'
        if k == 'bool':
            return 'booléen'
        if k == 'seg':
            return 'seg'
        if k == 'ptr':
            return f'données({self.render(v[1])})'
        return v[1] if len(v) > 1 and v[1] else '?'

    def field_name(self, obj, n):
        fields = self.engine['fields']
        table = None
        if obj.kind == 'scene':
            table = fields.get('scene', {})
        elif obj.kind == 'layer':
            table = dict(fields.get('layer', {}))
            table.update(fields.get(obj.type or '', {}))
        elif obj.kind == 'surface':
            table = fields.get('surface', {})
        if table and str(n) in table:
            return table[str(n)]
        return f'+{n}'

    def local_name(self, off):
        if off in self.local_names:
            return self.local_names[off]
        return f'v{-off}' if off < 0 else f'arg_{off}'

    def render_cond(self, c):
        k = c[0]
        if k == 'cmp':
            op, a, b = c[1], c[2], c[3]
            return f'{self.render(a)} {op} {self.render(b)}'
        if k == 'not':
            inner = c[1]
            if inner[0] == 'cmp':
                return self.render_cond(negate(inner))
            return f'non ({self.render_cond(inner)})'
        if k == 'or':
            return f'{self.render_cond(c[1])} ou {self.render_cond(c[2])}'
        if k == 'and':
            return f'({self.render_cond(c[1])}) et ({self.render_cond(c[2])})'
        if k == 'true':
            return 'vrai'
        if k == 'false':
            return 'faux'
        return '?'


NEGATE = {'==': '!=', '!=': '==', '<': '>=', '>=': '<', '>': '<=', '<=': '>'}


def negate(c):
    if c[0] == 'cmp':
        return ('cmp', NEGATE[c[1]], c[2], c[3])
    if c[0] == 'not':
        return c[1]
    return ('not', c)


JCC = {
    'jz': '==', 'je': '==', 'jnz': '!=', 'jne': '!=',
    'jl': '<', 'jnge': '<', 'jle': '<=', 'jng': '<=', 'jg': '>', 'jnle': '>', 'jge': '>=', 'jnl': '>=',
    'jb': '<', 'jc': '<', 'jnae': '<', 'jbe': '<=', 'jna': '<=', 'ja': '>', 'jnbe': '>',
    'jnb': '>=', 'jae': '>=', 'jnc': '>=',
}

REG16 = {'al': 'ax', 'ah': 'ax', 'bl': 'bx', 'bh': 'bx', 'cl': 'cx', 'ch': 'cx', 'dl': 'dx', 'dh': 'dx',
         'eax': 'ax', 'ebx': 'bx', 'ecx': 'cx', 'edx': 'dx', 'esi': 'si', 'edi': 'di'}
REGS = ['ax', 'bx', 'cx', 'dx', 'si', 'di', 'es']


def reg_of(text):
    t = text.strip().lower()
    t = REG16.get(t, t)
    return t if t in REGS else None


# ---------------------------------------------------------------------------
# Exécution symbolique d'une fonction

class FunctionRun:
    def __init__(self, ex, addr, info, arg_values, pass_regions):
        self.ex = ex
        self.addr = addr
        self.info = info
        self.arg_values = arg_values
        self.regions = pass_regions
        self.local_names = {}
        self.vars = {}
        self.stmts = []
        self.found_regions = {}
        self.region_end = {}
        self.found_ends = {}
        self.pass_no = 1 if not pass_regions else 2
        self.parse()

    # --- découpage --------------------------------------------------------
    def parse(self):
        ex = self.ex
        lo, hi = self.info['start_line'] - 1, self.info['end_line']
        self.instrs = []
        for n in range(lo, hi):
            raw = ex.lines[n]
            m = re.match(r'^(\w+)\s+=\s+(byte|word|dword)\s+ptr\s+(-?[0-9A-Fa-f]+h?)\s*$', raw)
            if m:
                self.vars[m.group(1)] = parse_number(m.group(3))
                continue
            text = ex.pattern.sub(lambda mm: ex.subst[mm.group(1)], raw)
            code = text.split(';')[0].rstrip()
            lm = re.match(r'^(\w+):\s*(.*)$', code)
            if lm:
                self.instrs.append(('label', lm.group(1), n + 1))
                code = '\t' + lm.group(2)
            if re.match(r'^\S+\s+(proc|endp)', code):
                continue
            s = code.strip()
            if not s:
                continue
            parts = s.split(None, 1)
            self.instrs.append(('ins', parts[0].lower(), parts[1] if len(parts) > 1 else '', n + 1, s))
        writes = {}
        taken = set()
        for ins in self.instrs:
            if ins[0] != 'ins':
                continue
            mn, ops = ins[1], ins[2]
            parts = [p.strip() for p in DataSegment.split_operands(ops)] if ops else []
            if mn == 'lea' and len(parts) == 2:
                o = self.operand(parts[1])
                if o[0] == 'mem' and o[1][0] == 'bp':
                    taken.add(o[1][1])
            if mn in ('mov', 'inc', 'dec', 'add', 'sub', 'and', 'or', 'xor', 'shl', 'shr', 'sar', 'neg', 'imul', 'pop') and parts:
                o = self.operand(parts[0])
                if o[0] == 'mem' and o[1][0] == 'bp':
                    src = self.operand(parts[1]) if mn == 'mov' and len(parts) > 1 else None
                    writes.setdefault(o[1][1], []).append(src)
        self.const_locals = {}
        for off, srcs in writes.items():
            if off in taken or len(srcs) != 1 or srcs[0] is None or srcs[0][0] != 'imm' or not is_const(srcs[0][1]):
                continue
            self.const_locals[off] = srcs[0][1]
        self.label_index = {}
        for i, ins in enumerate(self.instrs):
            if ins[0] == 'label':
                self.label_index[ins[1]] = i
        self.loop_variant = {}
        for j, ins in enumerate(self.instrs):
            if ins[0] != 'ins' or not ins[1].startswith('j'):
                continue
            target = self.jump_target(ins[2])
            if target in self.label_index and self.label_index[target] < j:
                i = self.label_index[target]
                regs = self.loop_variant.setdefault(target, set())
                for k in range(i, j + 1):
                    w = self.instrs[k]
                    if w[0] != 'ins':
                        continue
                    if w[1] in ('inc', 'dec', 'add', 'sub', 'shl', 'shr', 'sar', 'imul', 'neg', 'mov', 'xor', 'and', 'or', 'pop', 'lea'):
                        ops2 = [x.strip() for x in w[2].split(',')]
                        if w[1] in ('or', 'and') and len(ops2) == 2 and ops2[0] == ops2[1]:
                            continue
                        dst = reg_of(w[2].split(',')[0])
                        if dst and w[1] != 'mov':
                            regs.add(dst)
                        if dst and w[1] == 'mov':
                            src = w[2].split(',', 1)[1].strip() if ',' in w[2] else ''
                            if reg_of(src) == dst:
                                continue
                            regs.add(dst)
        self.loop_registers = set().union(*self.loop_variant.values()) if self.loop_variant else set()

    def continues_main_path(self, k0):
        """Vrai si, depuis k0, un chemin atteint une nouvelle scène (ou la suite) sans « retour »."""
        seen = set()
        todo = [k0 + 1]
        steps = 0
        while todo and steps < 20000:
            k = todo.pop()
            while k < len(self.instrs) and k not in seen:
                seen.add(k)
                steps += 1
                ins = self.instrs[k]
                if ins[0] == 'ins':
                    mn, ops = ins[1], ins[2]
                    if mn == 'call' and ('Scene_Create' in ops or 'Stub_' in ops):
                        return True
                    if mn in ('retf', 'retn', 'ret'):
                        break
                    if mn == 'jmp':
                        t = self.jump_target(ops)
                        if t in self.label_index:
                            k = self.label_index[t]
                            continue
                        break
                    if mn in JCC:
                        t = self.jump_target(ops)
                        if t in self.label_index:
                            todo.append(self.label_index[t])
                k += 1
        return False

    @staticmethod
    def jump_target(ops):
        t = ops.replace('short', '').replace('near ptr', '').replace('far ptr', '').strip()
        return t

    # --- opérandes ----------------------------------------------------------
    def bp_offset(self, inner):
        m = re.match(r'^bp([+-])(.+)$', inner.replace(' ', ''))
        if not m:
            return None
        sign, rest = m.group(1), m.group(2)
        total = 0
        for i, term in enumerate(re.split(r'(?=[+-])', rest)):
            if not term:
                continue
            s = 1
            if term[0] in '+-':
                s = -1 if term[0] == '-' else 1
                term = term[1:]
            if term in self.vars:
                total += s * self.vars[term]
            else:
                try:
                    total += s * parse_number(term)
                except ValueError:
                    return None
        return total if sign == '+' else -total

    def operand(self, text):
        """Renvoie ('reg', r) | ('imm', v) | ('mem', addr, size) | ('raw', text)."""
        t = text.strip()
        size = 2
        for prefix, sz in (('byte ptr', 1), ('word ptr', 2), ('dword ptr', 4), ('large', 4)):
            if t.startswith(prefix):
                size = sz
                t = t[len(prefix):].strip()
        r = reg_of(t)
        if r:
            if t.startswith('e'):
                size = 4
            if t in ('al', 'ah', 'bl', 'bh', 'cl', 'ch', 'dl', 'dh'):
                size = 1
            return ('reg', r, size, t)
        if re.match(r'^-?[0-9][0-9A-Fa-f]*h?$', t):
            n = parse_number(t)
            if 32768 <= n < 65536 and not getattr(self, 'wide', False):
                n -= 65536
            return ('imm', const(n))
        m = re.match(r'^offset\s+(\w+)$', t)
        if m:
            return ('imm', ('str', m.group(1)))
        if t in ('ds', 'ss', 'cs') or t.startswith('seg '):
            return ('imm', ('seg',))
        seg_override = None
        m = re.match(r'^(cs|ds|es|ss):(.*)$', t)
        if m:
            seg_override = m.group(1)
            t = m.group(2)
        m = re.match(r'^\[(.*)\]$', t)
        if m:
            inner = m.group(1).replace(' ', '')
            mi = re.match(r'^bp\+(si|di|bx)\+(.+)$', inner)
            if mi:
                off = self.bp_offset('bp+' + mi.group(2))
                if off is not None:
                    return ('mem', ('bpidx', off, mi.group(1)), size)
            off = self.bp_offset(inner)
            if off is not None and inner.startswith('bp'):
                return ('mem', ('bp', off), size)
            mm = re.match(r'^(bx|si|di)(?:\+(bx|si|di))?(?:([+-])(\w+))?$', inner)
            if mm:
                disp = 0
                if mm.group(4):
                    try:
                        disp = parse_number(mm.group(4))
                    except ValueError:
                        return ('raw', text)
                    if mm.group(3) == '-':
                        disp = -disp
                if mm.group(2):
                    return ('mem', ('regs', mm.group(1), mm.group(2), disp), size)
                return ('mem', ('reg', mm.group(1), disp), size)
            return ('raw', text)
        m = re.match(r'^([A-Za-z_]\w*)(?:\+(\w+))?$', t)
        if m and seg_override != 'cs':
            label = m.group(1)
            disp = parse_number(m.group(2)) if m.group(2) else 0
            return ('mem', ('glob', label, disp), size)
        m = re.match(r'^(-?[0-9][0-9A-Fa-f]*h?)$', t)
        if seg_override == 'ds' and m:
            return ('mem', ('dsoff', parse_number(m.group(1))), size)
        return ('raw', text)

    # --- état -------------------------------------------------------------
    def region_at(self, off, service=False):
        best = None
        for start, entries in self.regions.items():
            for when, size, oid in entries:
                end = self.region_end.get((start, when, oid))
                if end is not None and end <= self.k:
                    continue
                if when <= self.k and start <= off < start + size:
                    kind = self.ex.objects[oid].kind
                    if kind in SERVICE and off != start and not service:
                        continue
                    if best is None or when > best[0]:
                        best = (when, start, oid)
        if best:
            return best[1], best[2]
        return None

    def in_init_window(self, off):
        for start, entries in self.regions.items():
            for when, size, oid in entries:
                created = when + INIT_WINDOW
                if start <= off < start + size and self.k < created <= self.k + INIT_WINDOW:
                    return True
        return False

    def addr_value(self, off):
        hit = self.region_at(off, service=True)
        if hit and self.ex.objects[hit[1]].kind in SERVICE and off != hit[0]:
            hit = None
        if not hit:
            hit = self.region_at(off)
        if hit:
            start, oid = hit
            if off == start:
                return ('obj', oid)
            return ('fieldaddr', oid, off - start)
        return ('addr', off)

    def read_mem(self, addr, size):
        kind = addr[0]
        if kind == 'bp':
            off = addr[1]
            if off > 0:
                return self.arg_values.get(off, ('arg', off))
            if off in self.store:
                v = self.store[off]
                if v[0] != 'temp':
                    return v
                hit = self.region_at(off)
                if hit and hit[1] == v[2]:
                    return v[1]
            if off in self.const_locals and not self.region_at(off, service=True):
                return self.const_locals[off]
            hit = self.region_at(off)
            if hit:
                start, oid = hit
                return ('field', oid, off - start)
            return ('local', off)
        if kind == 'reg':
            base = self.regs.get(addr[1], unknown())
            return self.deref(base, addr[2])
        if kind == 'regs':
            a = self.regs.get(addr[1], unknown())
            b = self.regs.get(addr[2], unknown())
            return ('deref', simplify(('bin', '+', a, b)), addr[3])
        if kind == 'bpidx':
            idx = self.regs.get(addr[2], ('reg', addr[2]))
            return ('glob', f'{self.ex.local_name(addr[1])}[{self.ex.render(idx)}]')
        if kind == 'glob':
            if addr[2]:
                return ('glob', f'{addr[1]}+{addr[2]}')
            return ('glob', addr[1])
        if kind == 'dsoff':
            return ('glob', f'ds:{addr[1]}')
        return unknown()

    def deref(self, base, disp):
        if base[0] == 'obj':
            return ('field', base[1], disp)
        if base[0] == 'fieldaddr':
            return ('field', base[1], base[2] + disp)
        if base[0] == 'addr':
            return self.read_mem(('bp', base[1] + disp), 2)
        if base[0] == 'bin' and base[1] == '+':
            table = self.table_base(base)
            if table:
                name, delta, index = table
                return ('tab', name, simplify(('bin', '+', index, const((delta + disp) // 2))))
        if base[0] == 'bin' and base[1] == '+' and base[3][0] == 'const' and base[2][0] != 'const':
            return ('glob', f'ds:{base[3][1] + disp}[{self.ex.render(base[2])}]')
        if base[0] not in ('obj', 'fieldaddr', 'addr', 'arg') and disp >= 256:
            return ('glob', f'ds:{disp}[{self.ex.render(base)}]')
        return ('deref', base, disp)

    def table_base(self, v):
        """v = adresse locale + index·k : renvoie (table, décalage, index en mots)."""
        a, b = v[2], v[3]
        for addr, idx in ((a, b), (b, a)):
            if addr[0] in ('addr', 'fieldaddr', 'obj'):
                if addr[0] == 'addr':
                    off = addr[1]
                    hit = self.region_at(off)
                    if not hit:
                        continue
                    start, oid = hit
                    delta = off - start
                elif addr[0] == 'obj':
                    oid, delta = addr[1], 0
                else:
                    oid, delta = addr[1], addr[2]
                obj = self.ex.objects[oid]
                if obj.kind != 'table':
                    continue
                if idx[0] == 'bin' and idx[1] == '*' and is_const(idx[3]):
                    words = simplify(('bin', '*', idx[2], const(idx[3][1] // 2)))
                else:
                    words = simplify(('bin', '/', idx, const(2)))
                return obj.name, delta, words
        return None

    def value(self, op):
        if op[0] == 'reg':
            return self.regs.get(op[1], unknown(op[1]))
        if op[0] == 'imm':
            return op[1]
        if op[0] == 'mem':
            return self.read_mem(op[1], op[2])
        return unknown(op[1] if len(op) > 1 else '')

    # --- écriture ---------------------------------------------------------
    def write(self, op, val, line, src_text):
        if op[0] == 'reg':
            if op[3] == 'ah' and is_const(val) and val[1] == 0:
                return
            self.regs[op[1]] = val
            if op[1] in ('si', 'di') and op[3] == op[1] and op[1] in self.loop_registers:
                self.emit(('assign', op[1], val, line))
            return
        if op[0] != 'mem':
            self.emit(('asm', src_text, line))
            return
        addr = op[1]
        if addr[0] == 'bp':
            off = addr[1]
            if val[0] in ('obj', 'fieldaddr', 'ret', 'str', 'addr', 'ptr', 'seg'):
                self.store[off] = val
                return
            self.store.pop(off, None)
            if op[2] == 4 and val[0] == 'glob':
                self.store[off] = val
                self.store[off + 2] = ('glob', val[1] + '+2')
                return
            early = self.region_at(off)
            if early and self.ex.objects[early[1]].kind == 'scene' and str(off - early[0]) in self.ex.engine['fields'].get('scene', {}):
                self.write_field(early[1], off - early[0], val, line)
                return
            if is_const(val) and self.in_init_window(off):
                return
            # Remise à 0 ou 2 des octets ou mots doubles d'une poignée (ressource, palette…) : ignorée.
            # Un mot de 2 octets n'est pas un champ de poignée : c'est une variable dans la même case
            # de pile (mid2, compteur var_178 remis à 0 dans la case de mid2voc 6).
            if is_const(val) and val[1] in (0, 2) and op[2] != 2 and self.region_at(off, service=True) and self.ex.objects[self.region_at(off, service=True)[1]].kind in SERVICE:
                return
            hit = self.region_at(off)
            if hit:
                start, oid = hit
                if self.ex.objects[oid].kind in SERVICE:
                    if is_const(val):
                        return
                    self.store[off] = ('temp', val, oid)
                    return
                self.write_field(oid, off - start, val, line)
                return
            if off in self.const_locals:
                return
            name = self.ex.local_name_for(self, off)
            # Un registre qui contient encore l'ancienne valeur de la variable (mov ax, [v] / inc [v] /
            # mov [x], ax) la garde : on la copie avant l'écriture (mid2, image = compteur++).
            for r, rv in list(self.regs.items()):
                if mentions(rv, ('local', off)):
                    keep = f'{name}_avant'
                    self.emit(('assign', keep, rv, line))
                    self.regs[r] = ('glob', keep)
            for o2, sv in list(self.store.items()):
                if sv[0] == 'temp' and mentions(sv[1], ('local', off)):
                    keep = f'{name}_avant'
                    self.emit(('assign', keep, sv[1], line))
                    self.store[o2] = ('temp', ('glob', keep), sv[2])
            self.emit(('assign', name, val, line))
            return
        if addr[0] == 'reg':
            base = self.regs.get(addr[1], unknown())
            target = self.deref(base, addr[2])
            if target[0] == 'field':
                self.write_field(target[1], target[2], val, line)
                return
            self.emit(('assign', self.ex.render(target), val, line))
            return
        target = self.read_mem(addr, op[2])
        self.emit(('assign', self.ex.render(target), val, line))

    def write_field(self, oid, n, val, line):
        obj = self.ex.objects[oid]
        if n == 0 and is_const(val) and val[1] in self.ex.vtables:
            vt = self.ex.vtables[val[1]]
            if obj.kind in ('heap', 'layer') and vt not in ('scene',):
                obj.kind = 'layer'
                obj.type = vt
                if obj.name.startswith('h'):
                    self.ex.rename_layer(obj)
                for i in range(len(self.stmts) - 1, -1, -1):
                    st = self.stmts[i]
                    if st[0] == 'layer' and st[1] == obj.name:
                        self.stmts[i] = ('layer', st[1], vt, st[3], st[4])
                        break
            return
        if is_const(val) and val[1] in self.ex.secondary and n in (0, 10, 33):
            return
        if n == 10 and obj.kind in ('layer', 'heap', 'scene'):
            return
        if obj.kind in ('res', 'palette', 'pak', 'array', 'text', 'stream', 'path', 'other') and is_const(val):
            return
        if obj.kind in ('voice', 'channel', 'font', 'objarray', 'table') and is_const(val):
            return
        self.emit(('assign', f'{self.ex.obj_label(obj)}.{self.ex.field_name(obj, n)}', val, line))

    def emit(self, st):
        self.stmts.append(st)

    # --- appels -----------------------------------------------------------
    def args_from_stack(self, nwords):
        items = []
        words = 0
        while self.stack and words < nwords:
            v, w = self.stack.pop()
            items.append(v)
            words += w
        merged = []
        i = 0
        while i < len(items):
            v = items[i]
            if i + 1 < len(items) and items[i + 1] == ('seg',):
                merged.append(v)
                i += 2
                continue
            if v == ('seg',):
                i += 1
                continue
            merged.append(v)
            i += 1
        return merged

    def call(self, target, k, line):
        ex = self.ex
        nwords = 0
        nxt = self.instrs[k + 1] if k + 1 < len(self.instrs) else None
        if nxt and nxt[0] == 'ins' and nxt[1] == 'add' and nxt[2].replace(' ', '').startswith('sp,'):
            nwords = parse_number(nxt[2].split(',')[1]) // 2
        elif nxt and nxt[0] == 'ins' and nxt[1] == 'pop' and nxt[2].strip() == 'cx':
            nwords = 1
        spec = ex.funcs.get(target)
        if spec and 'callee_words' in spec:
            nwords = spec['callee_words']
        args = self.args_from_stack(nwords)
        saved_cx = self.regs.get('cx', unknown())
        for r in ('ax', 'bx', 'cx', 'dx', 'es'):
            self.regs[r] = unknown()
        self.regs['cx_before_call'] = saved_cx
        if spec is None:
            shown = [ex.render(a) for a in args]
            self.emit(('call', target, shown, list(args), line))
            self.regs['ax'] = ('callres', len(self.stmts) - 1, f'{target}({", ".join(shown)})')
            return
        self.regs_after_call = {}
        result = ex.apply(self, target, spec, args, line)
        self.regs['ax'] = result if result is not None else ('ret', spec['op'])
        self.regs.update(self.regs_after_call)

    def method_call(self, base, slot, k, line):
        nwords = 0
        nxt = self.instrs[k + 1] if k + 1 < len(self.instrs) else None
        if nxt and nxt[0] == 'ins' and nxt[1] == 'add' and nxt[2].replace(' ', '').startswith('sp,'):
            nwords = parse_number(nxt[2].split(',')[1]) // 2
        elif nxt and nxt[0] == 'ins' and nxt[1] == 'pop' and nxt[2].strip() == 'cx':
            nwords = 1
        args = self.args_from_stack(nwords)
        obj = None
        if base[0] == 'field' and base[2] == 0:
            obj = self.ex.objects[base[1]]
        name = f'méthode{slot}'
        if obj is not None:
            methods = self.ex.engine['methods']
            kind = {'voice': 'voice', 'layer': 'layer', 'heap': 'layer', 'font': 'font', 'pak': 'pak', 'stream': 'stream'}.get(obj.kind)
            if kind and str(slot) in methods.get(kind, {}):
                name = methods[kind][str(slot)]
            if obj.kind == 'pak' and slot == 20 and len(args) > 1:
                path = self.ex.path_of(self, args[1])
                if path:
                    obj.content = os.path.splitext(os.path.basename(path.replace('\\', '/')))[0].lower()
            label = self.ex.obj_label(obj)
        else:
            label = self.ex.render(base)
        shown = [self.ex.render(a) for a in args[1:]]
        for r in ('ax', 'bx', 'cx', 'dx', 'es'):
            self.regs[r] = unknown()
        self.emit(('call', f'{label}.{name}', shown, list(args[1:]), line))
        self.regs['ax'] = ('callres', len(self.stmts) - 1, f'{label}.{name}({", ".join(shown)})')

    # --- boucle principale ------------------------------------------------
    def run(self):
        self.regs = {}
        self.store = {}
        self.stack = []
        self.cmp = None
        self.pending = {}
        self.dead = False
        self.last_live = ({}, {})
        self.open_conditions = set()
        for k, ins in enumerate(self.instrs):
            self.k = k
            if ins[0] == 'label':
                self.open_conditions.discard(ins[1])
                self.at_label(ins[1])
                self.emit(('label', ins[1], ins[2]))
                continue
            if self.dead:
                continue
            _, mn, ops, line, text = ins
            try:
                self.step(k, mn, ops, line, text)
            except Exception as e:
                self.emit(('asm', f'{text}   (erreur outil : {e})', line))
        return self.stmts

    def snapshot(self):
        return (dict(self.regs), dict(self.store))

    def at_label(self, label):
        states = list(self.pending.pop(label, []))
        if not self.dead:
            states.append(self.snapshot())
        if not states:
            self.regs, self.store = dict(self.last_live[0]), dict(self.last_live[1])
        else:
            regs = {}
            for r in REGS:
                vals = [s[0].get(r) for s in states]
                if all(v == vals[0] for v in vals) and vals[0] is not None:
                    regs[r] = vals[0]
                elif r == 'ax' and ('bool',) in vals and all(v in (('bool',), const(0), const(1)) for v in vals):
                    regs[r] = ('bool',)
                else:
                    regs[r] = ('reg', r)
            store = {}
            keys = set(states[0][1].keys())
            for s in states[1:]:
                keys &= set(s[1].keys())
            for key in keys:
                vals = [s[1][key] for s in states]
                if all(v == vals[0] for v in vals):
                    store[key] = vals[0]
            self.regs, self.store = regs, store
        for r in self.loop_variant.get(label, ()):
            self.regs[r] = ('reg', r)
        self.dead = False
        self.stack = []

    def step(self, k, mn, ops, line, text):
        ex = self.ex
        parts = [p.strip() for p in DataSegment.split_operands(ops)] if ops else []
        # Destination sur 32 bits : une constante comme 8000h y vaut +32768, pas −32768.
        self.wide = bool(parts) and bool(re.match(r'^(e[a-d]x|e[sd]i|e[bs]p|dword ptr|large)\b', parts[0]))
        if mn in ('push',):
            op = self.operand(parts[0])
            v = self.value(op)
            words = 2 if (op[0] == 'mem' and op[2] == 4) or parts[0].startswith('large') else 1
            self.stack.append((v, words))
            return
        if mn == 'pop':
            if self.stack:
                v, _ = self.stack.pop()
            else:
                v = unknown()
            r = reg_of(parts[0])
            if r:
                self.regs[r] = v
            return
        if mn in ('mov', 'movzx', 'movsx'):
            dst = self.operand(parts[0])
            src = self.operand(parts[1])
            val = self.value(src)
            if dst[0] == 'mem' and src[0] == 'reg' and src[2] == 4:
                dst = ('mem', dst[1], 4)
            if dst[0] == 'reg' and dst[1] == 'ax' and is_const(val) and val[1] == 1:
                self.emit(('setax', 1, line))
            self.write(dst, val, line, text)
            nxt = self.instrs[k + 1] if k + 1 < len(self.instrs) else None
            if (dst[0] == 'reg' and dst[2] == 2 and dst[3] == dst[1] and is_const(val) and val[1] not in (0, 1)
                    and not (dst[1] in ('si', 'di') and dst[1] in self.loop_registers)
                    and nxt and (nxt[0] == 'label' or nxt[1] == 'jmp')):
                self.emit(('assign', dst[1], val, line))
            return
        if mn == 'lea':
            dst = self.operand(parts[0])
            src = self.operand(parts[1])
            if src[0] == 'mem' and src[1][0] == 'bp':
                self.regs[dst[1]] = self.addr_value(src[1][1])
            elif src[0] == 'mem' and src[1][0] == 'reg':
                base = self.regs.get(src[1][1], unknown())
                self.regs[dst[1]] = simplify(('bin', '+', base, const(src[1][2])))
            else:
                self.regs[dst[1]] = unknown(parts[1])
            return
        if mn == 'les':
            dst = self.operand(parts[0])
            src = self.operand(parts[1])
            self.regs[dst[1]] = ('ptr', self.value(src))
            return
        if mn == 'xor':
            dst = self.operand(parts[0])
            src = self.operand(parts[1])
            if dst == src and dst[0] == 'reg':
                if dst[1] == 'ax':
                    self.emit(('setax', 0, line))
                    self.regs['ax'] = ('bool',)
                else:
                    self.write(dst, const(0), line, text)
                return
            self.write(dst, simplify(('bin', '^', self.value(dst), self.value(src))), line, text)
            return
        if mn in ('add', 'sub', 'and', 'or', 'shl', 'shr', 'sar', 'adc', 'sbb'):
            dst = self.operand(parts[0])
            src = self.operand(parts[1])
            if mn == 'or' and dst == src:
                self.cmp = ('or', self.value(dst))
                return
            if mn in ('add', 'sub') and dst[0] == 'reg' and dst[1] == 'sp':
                return
            if parts[0] == 'sp':
                return
            a, b = self.value(dst), self.value(src)
            if mn == 'sub' and b[0] == 'sign':
                self.write(dst, ('adjust', a), line, text)
                return
            if mn == 'sar' and a[0] == 'adjust' and is_const(b) and b[1] == 1:
                self.write(dst, simplify(('bin', '/', a[1], const(2))), line, text)
                return
            if mn == 'shl' and is_const(b):
                val = simplify(('bin', '*', a, const(1 << b[1])))
            elif mn in ('shr', 'sar') and is_const(b):
                val = simplify(('bin', '/', a, const(1 << b[1])))
            else:
                sym = {'add': '+', 'sub': '-', 'and': '&', 'or': '|', 'adc': '+', 'sbb': '-'}.get(mn, mn)
                val = simplify(('bin', sym, a, b))
            if mn == 'and':
                self.cmp = ('test', a, b)
            self.write(dst, val, line, text)
            return
        if mn in ('inc', 'dec'):
            dst = self.operand(parts[0])
            val = simplify(('bin', '+' if mn == 'inc' else '-', self.value(dst), const(1)))
            self.write(dst, val, line, text)
            return
        if mn == 'neg':
            dst = self.operand(parts[0])
            self.write(dst, simplify(('bin', '*', self.value(dst), const(-1))), line, text)
            return
        if mn == 'cwd':
            self.regs['dx'] = ('sign', self.regs.get('ax', unknown()))
            return
        if mn == 'cbw' or mn == 'cdq':
            return
        if mn == 'imul':
            if len(parts) == 1:
                src = self.value(self.operand(parts[0]))
                self.regs['ax'] = simplify(('bin', '*', self.regs.get('ax', unknown()), src))
            elif len(parts) == 2:
                dst = self.operand(parts[0])
                self.write(dst, simplify(('bin', '*', self.value(dst), self.value(self.operand(parts[1])))), line, text)
            else:
                dst = self.operand(parts[0])
                self.write(dst, simplify(('bin', '*', self.value(self.operand(parts[1])), self.value(self.operand(parts[2])))), line, text)
            return
        if mn in ('div', 'idiv'):
            src = self.value(self.operand(parts[0]))
            self.regs['ax'] = simplify(('bin', '/', self.regs.get('ax', unknown()), src))
            return
        if mn == 'shld' or mn == 'shrd':
            return
        if mn == 'cmp':
            self.cmp = ('cmp', self.value(self.operand(parts[0])), self.value(self.operand(parts[1])))
            return
        if mn == 'test':
            self.cmp = ('test', self.value(self.operand(parts[0])), self.value(self.operand(parts[1])))
            return
        if mn == 'call':
            t = ops.replace('far ptr', '').replace('near ptr', '').strip()
            m = re.match(r'^dword ptr \[bx(?:\+(\w+))?\]$', t)
            if m:
                slot = parse_number(m.group(1)) if m.group(1) else 0
                self.method_call(self.regs.get('bx', unknown()), slot, k, line)
                return
            self.call(t, k, line)
            return
        if mn == 'jmp':
            target = self.jump_target(ops)
            if target == '$+2':
                return
            self.pending.setdefault(target, []).append(self.snapshot())
            self.last_live = self.snapshot()
            self.emit(('goto', target, line))
            self.dead = True
            return
        if mn in JCC:
            target = self.jump_target(ops)
            cond = self.condition(mn)
            if target in self.label_index and self.label_index[target] > k:
                self.open_conditions.add(target)
            self.pending.setdefault(target, []).append(self.snapshot())
            self.emit(('cgoto', cond, target, line))
            return
        if mn in ('retf', 'retn', 'ret', 'leave'):
            if mn != 'leave':
                self.emit(('return', line))
                self.dead = True
            return
        if mn == 'rep' and ops.strip().startswith('movs'):
            ex.rep_movs(self, line)
            return
        if mn in ('nop', 'cld', 'std', 'clc', 'stc'):
            return
        self.emit(('asm', text, line))

    def condition(self, mn):
        c = self.cmp
        op = JCC[mn]
        if c is None:
            return ('cmp', op, unknown('flags'), const(0))
        if c[0] == 'cmp':
            return ('cmp', op, c[1], c[2])
        if c[0] == 'or':
            return ('cmp', op if op in ('==', '!=') else op, c[1], const(0))
        if c[0] == 'test':
            if is_const(c[2]):
                return ('cmp', op, simplify(('bin', '&', c[1], c[2])), const(0))
            return ('cmp', op, c[1], const(0))
        return ('cmp', op, unknown('flags'), const(0))


# ---------------------------------------------------------------------------
# Sémantique des appels du moteur

def extractor_methods():
    pass


def apply(self, run, target, spec, args, line):
    op = spec['op']
    special = spec.get('special')
    roles = spec.get('args', [])
    named = dict(zip(roles, args))
    ending = None
    if spec.get('ends') and args:
        ending = args[0]
    elif spec.get('ends_arg'):
        ending = named.get(spec['ends_arg'])
    if ending is not None and run.continues_main_path(run.k):
        self.end_region(run, ending)
        for start, entries in run.found_regions.items():
            for when, size, oid in entries:
                if self.objects[oid].kind == 'table' and when <= run.k and (start, when, oid) not in run.found_ends:
                    run.found_ends[(start, when, oid)] = run.k
    shown = []
    for role, a in zip(roles, args):
        shown.append(f'{role}={self.render(a)}')
    for a in args[len(roles):]:
        shown.append(self.render(a))

    if special == 'path':
        dest = named.get('dest')
        text = ''.join(self.plain_string(a) for a in (named.get('dossier'), named.get('nom'), named.get('extension')) if a)
        oid = self.ensure_region(run, dest, 'path', 'chemin', 80)
        if oid:
            self.objects[oid].content = text
        return None
    if special == 'pak_open':
        oid = self.ensure_region(run, named.get('pak'), 'pak', 'pak', LARGE_REGION)
        path = self.path_of(run, named.get('chemin'))
        if oid and path:
            self.objects[oid].content = os.path.splitext(os.path.basename(path.replace('\\', '/')))[0].lower()
        return None
    if special == 'pak_new':
        self.ensure_region(run, named.get('pak'), 'pak', 'pak', LARGE_REGION)
        return None
    if special == 'load':
        pak = named.get('pak')
        res = named.get('ressource')
        oid = self.ensure_region(run, res, 'res', 'r', 10)
        pak_label = self.render(pak)
        if pak_label.startswith('pak '):
            pak_label = pak_label[4:]
        entry = self.render(named.get('entrée'))
        if oid:
            self.objects[oid].content = f'{pak_label} {entry}'
        run.emit(('op', op, [f'{pak_label} {entry}'], {'pak': pak_label, 'entrée': named.get('entrée'), 'ressource': ('obj', oid) if oid else None}, line))
        return None
    if special == 'load_name':
        oid = self.ensure_region(run, named.get('ressource'), 'res', 'r', 10)
        n = named.get('nom')
        name = self.render(n)
        if n is not None and is_const(n):
            text = self.string_at(self.dseg.base + n[1])
            if text is not None:
                name = f'"{text}"'
        if oid:
            self.objects[oid].content = f'convdata type 0 {name}'
        run.emit(('op', op, [name, f'drapeau={self.render(named.get("drapeau"))}'], {'nom': name.strip('"'), 'ressource': ('obj', oid) if oid else None}, line))
        return None
    if special == 'load_daynight':
        oid = self.ensure_region(run, named.get('ressource'), 'res', 'r', 10)
        night = named.get('nuit')
        label = 'night' if night and is_const(night) and night[1] else 'normal'
        if oid:
            self.objects[oid].content = f'convdata type 2 "{label}"'
        run.emit(('op', op, [f'"{label}"'], {'nom': label, 'ressource': ('obj', oid) if oid else None}, line))
        return None
    if special == 'palette_load':
        oid = self.ensure_region(run, named.get('palette'), 'palette', 'pal', 5)
        src = named.get('ressource')
        if oid:
            self.objects[oid].content = self.render(src)
        run.emit(('op', op, [self.render(named.get('palette'))], dict(named), line))
        return None
    if special == 'scene':
        objv = named.get('objet')
        oid = None
        if objv is not None and objv[0] in ('addr', 'obj'):
            off = objv[1] if objv[0] == 'addr' else None
            if run.pass_no == 1:
                if off is None:
                    for start, entries in run.found_regions.items():
                        for w, sz, o in entries:
                            if o == objv[1]:
                                off = start
                if off is not None:
                    obj = self.new_obj('scene', 'scène')
                    run.found_regions.setdefault(off, []).append((run.k, 33, obj.id))
                    oid = obj.id
            else:
                if off is None:
                    for start, entries in run.regions.items():
                        for w, sz, o in entries:
                            if o == objv[1]:
                                off = start
                hit = run.region_at(off) if off is not None else None
                if hit and hit[0] == off:
                    oid = hit[1]
        if oid:
            objv = ('obj', oid)
        run.emit(('scene', self.render(objv), self.render(named.get('cadence')), self.render(named.get('palette')), self.render(named.get('surface')), line))
        return ('obj', oid) if oid else None
    if special == 'add':
        run.emit(('add', self.render(named.get('parent')), self.render(named.get('calque')), line))
        return None
    if special == 'lock':
        run.regs_after_call = {'dx': ('seg',)}
        return ('ptr', named.get('bloc', unknown()))
    if special == 'memcpy':
        src, dst = args[0] if args else unknown(), args[1] if len(args) > 1 else unknown()
        size = run.regs.get('cx_before_call', unknown())
        self.copy_table(run, src, dst, size, line)
        return None
    if special == 'widget':
        oid = self.ensure_region(run, named.get('zone'), 'widget', 'zone', 40)
        run.emit(('op', op, [f'zone={self.render(named.get("zone"))}', f'police={self.render(named.get("police"))}'], dict(named), line))
        return None
    if special == 'objarray':
        size = named.get('taille')
        count = named.get('nombre')
        total = size[1] * count[1] if size and count and is_const(size) and is_const(count) else 2
        oid = self.ensure_region(run, named.get('tableau'), 'objarray', 'objets', total)
        if oid and is_const(size):
            self.objects[oid].stride = size[1]
            run.emit(('op', op, [f'{self.objects[oid].name} : {self.render(count)} objets de {size[1]} octets'], None, line))
        return None
    if special == 'follow':
        converted = []
        for a in args:
            if a[0] == 'addr':
                oid = None
                for start, entries in run.regions.items():
                    for when, size, o in entries:
                        if start == a[1] and when <= run.k:
                            oid = o
                if oid is None:
                    obj = self.new_obj('other', 'objet')
                    oid = obj.id
                converted.append(('obj', oid))
            else:
                converted.append(a)
        run.emit(('follow', spec['target'], converted, line))
        return None

    if 'ret' in spec and spec['ret'] == 'layer':
        first = args[0] if args else const(0)
        if first[0] == 'obj':
            obj = self.objects[first[1]]
        else:
            obj = self.new_obj('layer', 'c')
        obj.kind = 'layer'
        obj.type = spec['type']
        if obj.name.startswith('h'):
            self.rename_layer(obj)
        obj.info = {r: self.render(a) for r, a in named.items() if r != 'objet'}
        obj.raw = {r: a for r, a in named.items() if r != 'objet'}
        params = ', '.join(f'{r}={v}' for r, v in obj.info.items())
        run.emit(('layer', obj.name, obj.type, params, line))
        return ('obj', obj.id)
    if spec.get('ret') == 'heap':
        obj = self.new_obj('heap', 'h')
        obj.info['taille'] = self.render(named.get('taille', unknown()))
        return ('obj', obj.id)

    for role, a in named.items():
        kind = {'canal': 'channel', 'voix': 'voice', 'police': 'font', 'tableau': 'array', 'flux': 'stream',
                'chronomètre': 'other', 'événement': 'other', 'zone': 'other', 'surface': 'surface',
                'palette': 'palette', 'destination': 'palette', 'source': 'palette'}.get(role)
        if kind and a[0] == 'addr':
            size = {'palette': 5, 'channel': 14, 'voice': 40, 'array': 4, 'stream': 96, 'surface': 14, 'font': 40}.get(kind, 2)
            prefix = {'palette': 'pal', 'channel': 'canal', 'voice': 'voix', 'array': 'textes', 'stream': 'flux', 'surface': 'surface', 'font': 'police', 'other': 'objet'}[kind]
            self.ensure_region(run, a, kind, prefix, size)
    shown = []
    for role, a in zip(roles, args):
        if role in ('nom', 'texte') and is_const(a) and a[1] > 0:
            text = self.string_at(self.dseg.base + a[1])
            if text is not None:
                shown.append(f'{role}="{text}"')
                continue
        if role == 'balise' and is_const(a) and a[1] > 0:
            raw = a[1].to_bytes(4, 'little')
            if all(48 <= c <= 90 for c in raw):
                shown.append(f"{role}='{raw.decode()}'")
                continue
        shown.append(f'{role}={self.render(a)}')
    for a in args[len(roles):]:
        shown.append(self.render(a))
    if spec.get('hide'):
        run.emit(('hidden', op, line))
        return None
    if 'show' in spec:
        shown = [f'{role}={self.render(a)}' for role, a in zip(roles, args) if role in spec['show']]
    raw = dict(named)
    for role, a in named.items():
        if role in ('nom', 'texte') and is_const(a) and a[1] > 0:
            text = self.string_at(self.dseg.base + a[1])
            if text is not None:
                raw[role] = ('lit', text)
    run.emit(('op', op, shown, raw, line))
    if spec.get('ret') == 'value':
        return ('callres', len(run.stmts) - 1, f'{op}({", ".join(shown)})')
    return None


def ensure_region(self, run, v, kind, prefix, size):
    if v is None:
        return None
    if v[0] == 'obj':
        obj = self.objects[v[1]]
        if obj.kind in ('heap', 'other') and kind not in ('heap', 'other'):
            obj.kind = kind
        return v[1]
    if v[0] != 'addr':
        return None
    off = v[1]
    if off in run.regions:
        hit = run.region_at(off)
        if hit and hit[0] == off:
            return hit[1]
        return run.regions[off][-1][2]
    if off in run.found_regions:
        when, size0, oid = run.found_regions[off][-1]
        obj = self.objects[oid]
        if obj.kind == kind or kind == 'other':
            latest = None
            for start, entries in run.found_regions.items():
                for w, sz, o in entries:
                    if start <= off < start + sz and (latest is None or w > latest[0]):
                        latest = (w, o)
            if latest and latest[1] != oid:
                run.found_regions[off].append((max(0, run.k - INIT_WINDOW), size0, oid))
            return oid
    obj = self.new_obj(kind, prefix)
    obj.offset = off
    run.found_regions.setdefault(off, []).append((max(0, run.k - 24), size, obj.id))
    return obj.id


def end_region(self, run, v):
    off = None
    if v[0] == 'addr':
        off = v[1]
    elif v[0] == 'obj':
        for start, entries in run.found_regions.items():
            for when, size, oid in entries:
                if oid == v[1]:
                    off = start
    if off is None or off not in run.found_regions:
        return
    for when, size, oid in run.found_regions[off]:
        if when <= run.k and (off, when, oid) not in run.found_ends:
            run.found_ends[(off, when, oid)] = run.k


def nominal_size(kind, size):
    return {'scene': 33, 'res': 10, 'palette': 5}.get(kind, size)


def new_name(self, prefix):
    self.counters[prefix] = self.counters.get(prefix, 0) + 1
    return f'{prefix}{self.counters[prefix]}'


def string_at(self, address):
    out = []
    while len(out) < 300:
        b = self.dseg.bytes.get(address + len(out))
        if b is None:
            return None
        if b == 0:
            break
        if b < 32 or b > 126:
            return None
        out.append(b)
    return bytes(out).decode('cp437') if out else None


def plain_string(self, v):
    if v is None:
        return ''
    if v[0] == 'str':
        return self.dseg.strings.get(v[1], '')
    return ''


def path_of(self, run, v):
    if v is None:
        return None
    oid = None
    if v[0] == 'obj':
        oid = v[1]
    elif v[0] == 'addr':
        off = v[1]
        if off in run.regions:
            oid = run.regions[off][-1][2]
        elif off in run.found_regions:
            oid = run.found_regions[off][-1][2]
    if oid:
        return self.objects[oid].content
    return None


def rename_layer(self, obj):
    self.counters['c'] = self.counters.get('c', 0) + 1
    obj.name = f'c{self.counters["c"]}'


def copy_table(self, run, src, dst, size, line):
    if src[0] != 'str' or dst[0] not in ('addr', 'obj', 'fieldaddr'):
        run.emit(('op', 'copie_mémoire', [self.render(src), self.render(dst), f'taille={self.render(size)}'], None, line))
        return
    nbytes = size[1] if is_const(size) else 0
    address = self.dseg.address_of(src[1])
    self.add_table(run, dst, address, nbytes, src[1], line)


def rep_movs(self, run, line):
    si = run.regs.get('si', unknown())
    di = run.regs.get('di', unknown())
    cx = run.regs.get('cx', unknown())
    if is_const(si) and is_const(cx) and di[0] in ('addr', 'obj'):
        address = self.dseg.base + si[1]
        self.add_table(run, di, address, 2 * cx[1], f'ds:{si[1]}', line)
        return
    run.emit(('asm', 'rep movsw', line))


def add_table(self, run, dst, address, nbytes, source, line):
    if dst[0] == 'addr':
        oid = self.ensure_region(run, dst, 'table', 'T', nbytes)
    else:
        oid = dst[1]
    obj = self.objects[oid]
    obj.kind = 'table'
    words = self.dseg.words(address, nbytes // 2) if address is not None else []
    obj.info = {'source': source, 'adresse': address, 'octets': nbytes, 'mots': words}
    if not any(t['nom'] == obj.name for t in self.tables):
        self.tables.append({'nom': obj.name, 'source': source, 'octets': nbytes, 'mots': words, 'ligne': line})
    offset = dst[1] if dst[0] == 'addr' else obj.offset
    run.emit(('table', obj.name, source, nbytes, words, offset, line))


def local_name_for(self, run, off):
    return run.ex.render(('local', off))


for _f in (apply, ensure_region, end_region, new_name, string_at, plain_string, path_of, rename_layer, copy_table, rep_movs, add_table, local_name_for):
    setattr(Extractor, _f.__name__, _f)


# ---------------------------------------------------------------------------
# Nettoyage et structuration

def cond_callres(c, out):
    if c[0] == 'cmp':
        for x in (c[2], c[3]):
            if x[0] == 'callres':
                out.add(x[1])
    elif c[0] in ('or', 'and'):
        cond_callres(c[1], out)
        cond_callres(c[2], out)
    elif c[0] == 'not':
        cond_callres(c[1], out)


def peephole(stmts):
    used = set()
    for st in stmts:
        if st[0] == 'cgoto':
            cond_callres(st[1], used)
    stmts = [('hidden',) if i in used and st[0] in ('op', 'call') else st for i, st in enumerate(stmts)]
    s = [st for st in stmts if st[0] != 'hidden']
    changed = True
    while changed:
        changed = False
        # booléen matérialisé dans ax
        for k in range(len(s)):
            st = s[k]
            if st[0] != 'cgoto' or st[1][0] != 'cmp' or st[1][2] != ('bool',):
                continue
            if k < 6:
                continue
            seq = s[k - 6:k]
            if not (seq[0][0] == 'label' and seq[1][0] == 'setax' and seq[1][1] == 1 and seq[2][0] == 'goto'
                    and seq[3][0] == 'label' and seq[4][0] == 'setax' and seq[4][1] == 0 and seq[5][0] == 'label'
                    and seq[2][1] == seq[5][1]):
                continue
            l_true, l_false = seq[0][1], seq[3][1]
            j = k - 6
            run = []
            while j - 1 >= 0 and s[j - 1][0] == 'cgoto' and s[j - 1][2] in (l_true, l_false):
                run.insert(0, s[j - 1])
                j -= 1
            expr = ('true',)
            for cg in reversed(run):
                c = cg[1]
                if cg[2] == l_true:
                    expr = c if expr == ('true',) else ('or', c, expr)
                else:
                    nc = negate(c)
                    expr = nc if expr == ('true',) else ('and', nc, expr)
            jump_if_true = st[1][1] == '!='
            final = expr if jump_if_true else negate_any(expr)
            s[j:k + 1] = [('cgoto', final, st[2], st[3])]
            changed = True
            break
        if changed:
            continue
        # suite de tests vers L1 (qui suit) ou L2 (plus loin) : un seul test « sauter à L2 »
        for k in range(len(s)):
            if s[k][0] != 'cgoto':
                continue
            m = k
            while m < len(s) and s[m][0] == 'cgoto':
                m += 1
            if m - k < 2 or m >= len(s) or s[m][0] != 'label':
                continue
            l1 = s[m][1]
            targets = {st[2] for st in s[k:m]}
            others = targets - {l1}
            if len(others) != 1 or l1 not in targets:
                continue
            l2 = others.pop()
            e = ('false',)
            for cg in reversed(s[k:m]):
                if cg[2] == l2:
                    e = cg[1] if e == ('false',) else ('or', cg[1], e)
                else:
                    e = ('and', negate_any(cg[1]), e) if e != ('false',) else ('false',)
            if e == ('false',):
                continue
            s[k:m] = [('cgoto', e, l2, s[k][3])]
            changed = True
            break
        if changed:
            continue
        # test de pointeur nul après allocation
        for k, st in enumerate(s):
            if st[0] == 'cgoto' and st[1][0] == 'cmp' and st[1][2][0] == 'obj' and is_const(st[1][3]) and st[1][3][1] == 0:
                if st[1][1] == '==':
                    s.pop(k)
                else:
                    s[k] = ('goto', st[2], st[3])
                changed = True
                break
        if changed:
            continue
        # cgoto L ; goto M ; L:   →   cgoto (non c) M ; L:
        for k in range(len(s) - 2):
            a, b, c = s[k], s[k + 1], s[k + 2]
            if a[0] == 'cgoto' and b[0] == 'goto' and c[0] == 'label' and a[2] == c[1]:
                s[k:k + 2] = [('cgoto', negate_any(a[1]), b[1], a[3])]
                changed = True
                break
        if changed:
            continue
        # goto vers le label qui suit (seulement des labels entre)
        for k, st in enumerate(s):
            if st[0] in ('goto', 'cgoto'):
                target = st[1] if st[0] == 'goto' else st[2]
                j = k + 1
                while j < len(s) and s[j][0] == 'label':
                    if s[j][1] == target:
                        s.pop(k)
                        changed = True
                        break
                    j += 1
                if changed:
                    break
        if changed:
            continue
        # labels non référencés, setax inutiles
        refs = set()
        for st in s:
            if st[0] == 'goto':
                refs.add(st[1])
            elif st[0] == 'cgoto':
                refs.add(st[2])
        new = [st for st in s if not (st[0] == 'label' and st[1] not in refs) and st[0] != 'setax']
        if len(new) != len(s):
            s = new
            changed = True
    return s


def negate_any(c):
    if c[0] == 'cmp':
        return negate(c)
    if c[0] == 'not':
        return c[1]
    if c[0] == 'or':
        return ('and', negate_any(c[1]), negate_any(c[2]))
    if c[0] == 'and':
        return ('or', negate_any(c[1]), negate_any(c[2]))
    if c[0] == 'true':
        return ('false',)
    return ('not', c)


def structure(s, lo, hi, labels):
    """Transforme la liste plate en arbre : ('while', cond, corps), ('if', cond, alors, sinon)."""
    out = []
    i = lo
    while i < hi:
        st = s[i]
        if st[0] == 'goto' and i + 1 < hi and s[i + 1][0] == 'label':
            lc = st[1]
            lb = s[i + 1][1]
            if lc in labels and i + 1 < labels[lc] < hi:
                ic = labels[lc]
                j = ic + 1
                while j < hi and s[j][0] in ('assign',):
                    j += 1
                if j < hi and s[j][0] == 'cgoto' and s[j][2] == lb:
                    body = structure(s, i + 2, ic, labels)
                    out.append(('while', s[j][1], body, st[2]))
                    i = j + 1
                    continue
        if st[0] == 'label' and i + 1 < hi:
            lb = st[1]
            back = None
            for j in range(i + 1, hi):
                if s[j][0] == 'cgoto' and s[j][2] == lb:
                    back = j
                if s[j][0] == 'goto' and s[j][1] == lb:
                    back = j
            if back is not None and s[back][0] == 'cgoto':
                body = structure(s, i + 1, back, labels)
                out.append(('dowhile', s[back][1], body, st[2]))
                i = back + 1
                continue
        if st[0] == 'cgoto' and st[2] in labels and i < labels[st[2]] <= hi:
            il = labels[st[2]]
            then_hi = il
            else_part = []
            nxt = il
            if then_hi - 1 > i and s[then_hi - 1][0] == 'goto' and s[then_hi - 1][1] in labels:
                im = labels[s[then_hi - 1][1]]
                if il < im <= hi:
                    else_part = structure(s, il + 1, im, labels)
                    then_hi -= 1
                    nxt = im
            then_part = structure(s, i + 1, then_hi, labels)
            out.append(('if', negate_any(st[1]), then_part, else_part, st[3]))
            i = nxt
            continue
        out.append(st)
        i += 1
    return out


# ---------------------------------------------------------------------------
# Rapport

def render_tree(ex, nodes, depth, out):
    pad = '    ' * depth
    for n in nodes:
        k = n[0]
        if k == 'while' or k == 'dowhile':
            word = 'tant que' if k == 'while' else 'répéter, tant que'
            out.append(f'{pad}{word} {ex.render_cond(n[1])} :')
            render_tree(ex, n[2], depth + 1, out)
            continue
        if k == 'if':
            then_out = []
            else_out = []
            render_tree(ex, n[2], depth + 1, then_out)
            render_tree(ex, n[3], depth + 1, else_out)
            if not then_out and not else_out:
                continue
            if not then_out:
                out.append(f'{pad}si {ex.render_cond(negate_any(n[1]))} :')
                out.extend(else_out)
                continue
            out.append(f'{pad}si {ex.render_cond(n[1])} :')
            out.extend(then_out)
            if else_out:
                out.append(f'{pad}sinon :')
                out.extend(else_out)
            continue
        line = n[-1]
        text = None
        if k == 'op':
            text = f'{n[1]}({", ".join(n[2])})'
        elif k == 'call':
            text = f'{n[1]}({", ".join(n[2])})'
        elif k == 'layer':
            text = f'{n[1]} = {n[2]}({n[3]})'
        elif k == 'add':
            text = f'ajoute {n[2]} à {n[1]}'
        elif k == 'scene':
            out.append('')
            out.append(f'{pad}──── {n[1]} ────')
            text = f'{n[1]} = Scene_Create(cadence={n[2]}, palette={n[3]}, surface={n[4]})'
        elif k == 'assign':
            text = f'{n[1]} = {ex.render(n[2])}'
        elif k == 'table':
            text = f'{n[1]} = tableau de {n[3]} octets copié depuis {n[2]}'
        elif k == 'goto':
            text = f'aller à {n[1]}'
        elif k == 'cgoto':
            text = f'si {ex.render_cond(n[1])} : aller à {n[2]}'
        elif k == 'label':
            if n[1] not in ex.live_labels:
                continue
            text = f'{n[1]}:'
        elif k == 'return':
            text = 'retour'
        elif k == 'asm':
            text = f'asm: {n[1]}'
        elif k == 'follow':
            text = f'appel de {n[1]} (voir plus bas)'
        if text is None:
            continue
        out.append(f'{pad}{text}'.ljust(100) + f'  ⟨{line}⟩')


def is_scene_marker(n):
    return n[0] == 'scene'


def scene_summaries(ex, stmts, start_number):
    scenes = []
    current = None
    for st in stmts:
        if st[0] == 'scene':
            current = {'scène': start_number + len(scenes), 'objet': st[1], 'cadence': st[2], 'ligne': st[-1],
                       'calques': [], 'ajouts': [], 'opérations': []}
            scenes.append(current)
            continue
        if current is None:
            continue
        if st[0] == 'layer':
            current['calques'].append({'nom': st[1], 'type': st[2], 'paramètres': st[3], 'ligne': st[-1]})
        elif st[0] == 'add':
            current['ajouts'].append({'parent': st[1], 'calque': st[2], 'ligne': st[-1]})
        elif st[0] in ('op', 'call'):
            current['opérations'].append({'op': st[1], 'arguments': st[2], 'ligne': st[-1]})
    return scenes


def cap_regions(found):
    return {start: list(entries) for start, entries in found.items()}


def unreferenced_labels(nodes, refs):
    for n in nodes:
        if n[0] in ('while', 'dowhile'):
            unreferenced_labels(n[2], refs)
        elif n[0] == 'if':
            unreferenced_labels(n[2], refs)
            unreferenced_labels(n[3], refs)
        elif n[0] == 'goto':
            refs.add(n[1])
        elif n[0] == 'cgoto':
            refs.add(n[2])


# ---------------------------------------------------------------------------
# Export JSON de l'arbre (pour tools/midgame_iff.py)

GLOB_RE = re.compile(r'^(byte|word|dword)_([0-9A-F]+)(?:\+(\d+))?$')


def glob_init(ex, name):
    m = GLOB_RE.match(name)
    if not m:
        return None
    address = int(m.group(2), 16) + (int(m.group(3)) if m.group(3) else 0)
    lo = ex.dseg.bytes.get(address)
    if lo is None:
        return None
    if m.group(1) == 'byte':
        return lo
    hi = ex.dseg.bytes.get(address + 1, 0)
    v = lo | hi << 8
    return v - 65536 if v >= 32768 else v


def jv(ex, v):
    if v is None:
        return None
    if isinstance(v, (int, str)):
        return v
    if isinstance(v, dict):
        return {k: jv(ex, x) for k, x in v.items()}
    k = v[0]
    if k == 'const':
        return v[1]
    if k == 'obj':
        return {'objet': ex.objects[v[1]].name}
    if k == 'field':
        obj = ex.objects[v[1]]
        return {'champ': [obj.name, ex.field_name(obj, v[2])]}
    if k == 'fieldaddr':
        return {'adresse_champ': [ex.objects[v[1]].name, v[2]]}
    if k == 'local':
        return {'local': ex.local_name(v[1])}
    if k == 'addr':
        return {'adresse': ex.local_name(v[1])}
    if k == 'arg':
        return {'local': ex.arg_names.get(v[1], f'arg_{v[1]}')}
    if k == 'glob':
        return {'glob': v[1], 'init': glob_init(ex, v[1])}
    if k == 'str':
        text = ex.dseg.strings.get(v[1])
        return {'chaîne': text if text is not None else v[1]}
    if k == 'ret':
        return {'retour': v[1]}
    if k == 'reg':
        return {'local': v[1]}
    if k == 'tab':
        return {'tab': v[1], 'index': jv(ex, v[2])}
    if k == 'deref':
        return {'déréf': jv(ex, v[1]), 'décalage': v[2]}
    if k == 'bin':
        return {'op': v[1], 'a': jv(ex, v[2]), 'b': jv(ex, v[3])}
    if k == 'neg':
        return {'neg': jv(ex, v[1])}
    if k == 'callres':
        return {'résultat': v[2]}
    if k == 'ptr':
        return {'données': jv(ex, v[1])}
    if k == 'temp':
        return jv(ex, v[1])
    if k == 'lit':
        return {'chaîne': v[1]}
    return {'inconnu': ex.render(v)}


def cj(ex, c):
    k = c[0]
    if k == 'cmp':
        return {'cmp': c[1], 'a': jv(ex, c[2]), 'b': jv(ex, c[3])}
    if k == 'not':
        return {'non': cj(ex, c[1])}
    if k == 'or':
        return {'ou': [cj(ex, c[1]), cj(ex, c[2])]}
    if k == 'and':
        return {'et': [cj(ex, c[1]), cj(ex, c[2])]}
    return {k: True}


def mentions(v, target):
    if v == target:
        return True
    if isinstance(v, tuple):
        return any(mentions(x, target) for x in v if isinstance(x, tuple))
    return False


def target_json(text):
    if '.' in text:
        obj, field = text.split('.', 1)
        if '(' in obj:
            obj = obj.split('(')[0]
        return {'champ': [obj, field]}
    if GLOB_RE.match(text):
        return {'glob': text}
    return {'local': text}


def tree_json(ex, nodes):
    out = []
    for n in nodes:
        k = n[0]
        if k in ('while', 'dowhile'):
            out.append({'t': 'tant_que' if k == 'while' else 'répéter', 'cond': cj(ex, n[1]),
                        'corps': tree_json(ex, n[2]), 'ligne': n[3]})
        elif k == 'if':
            out.append({'t': 'si', 'cond': cj(ex, n[1]), 'alors': tree_json(ex, n[2]),
                        'sinon': tree_json(ex, n[3]), 'ligne': n[4]})
        elif k == 'op':
            out.append({'t': 'op', 'op': n[1], 'args': jv(ex, n[3]) if n[3] is not None else {}, 'texte': n[2],
                        'ligne': n[-1]})
        elif k == 'call':
            out.append({'t': 'appel', 'nom': n[1], 'args': [jv(ex, a) for a in (n[3] or [])], 'texte': n[2],
                        'ligne': n[-1]})
        elif k == 'layer':
            obj = next((o for o in ex.objects.values() if o.name == n[1]), None)
            out.append({'t': 'calque', 'nom': n[1], 'type': n[2],
                        'args': jv(ex, obj.raw) if obj is not None else {}, 'ligne': n[-1]})
        elif k == 'add':
            out.append({'t': 'ajoute', 'parent': n[1], 'calque': n[2], 'ligne': n[-1]})
        elif k == 'scene':
            out.append({'t': 'scène', 'nom': n[1], 'cadence': n[2], 'ligne': n[-1]})
        elif k == 'assign':
            out.append({'t': 'affecte', 'cible': target_json(n[1]), 'valeur': jv(ex, n[2]), 'ligne': n[-1]})
        elif k == 'table':
            out.append({'t': 'tableau', 'nom': n[1], 'source': n[2], 'octets': n[3], 'mots': n[4],
                        'décalage': n[5], 'ligne': n[-1]})
        elif k == 'follow':
            out.append({'t': 'suite', 'fonction': n[1], 'args': [jv(ex, a) for a in n[2]], 'ligne': n[-1]})
        elif k == 'goto':
            out.append({'t': 'saut', 'cible': n[1], 'ligne': n[-1]})
        elif k == 'cgoto':
            out.append({'t': 'saut_si', 'cond': cj(ex, n[1]), 'cible': n[2], 'ligne': n[-1]})
        elif k == 'label':
            out.append({'t': 'label', 'nom': n[1]})
        elif k == 'return':
            out.append({'t': 'retour', 'ligne': n[-1]})
        elif k == 'asm':
            out.append({'t': 'asm', 'texte': n[1], 'ligne': n[-1]})
    return out


def objects_json(ex):
    out = {}
    for o in ex.objects.values():
        out[o.name] = {'genre': o.kind, 'type': o.type, 'contenu': o.content, 'décalage': o.offset,
                       'pas': o.stride}
    return out


def main():
    exe, args = pop_exe_arg(sys.argv[1:])
    if not args:
        print(__doc__)
        return
    name = None
    if '--name' in args:
        i = args.index('--name')
        name = args[i + 1]
        del args[i:i + 2]
    func = args[0]
    lines, known, index, engine = load_source(exe)
    ex = Extractor(exe, lines, known, index, engine)
    out_dir = os.path.join(paths(exe)['analysis'], 'midgames')
    os.makedirs(out_dir, exist_ok=True)
    name = name or func

    report = [f'# Script extrait de `{func}` ({exe})', '',
              'Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.',
              'Valeurs de l\'exécutable, sans correction. ⟨n⟩ = ligne de `source/' + os.path.basename(paths(exe)['asm']) + '`.',
              'Lignes « asm: » = instructions non traduites.', '']
    data = {'fonction': func, 'exécutable': exe, 'parties': []}

    queue = [(func, {})]
    scene_number = 1
    while queue:
        fname, arg_values = queue.pop(0)
        addr, info = find_function(fname, known, index)
        counters_before = dict(ex.counters)
        objects_before = set(ex.objects)
        first = FunctionRun(ex, addr, info, arg_values, {})
        ex.local_names = first.local_names
        first.run()
        regions = cap_regions(first.found_regions)
        ends = dict(first.found_ends)
        keep = {oid for entries in regions.values() for _, _, oid in entries}
        for oid in list(ex.objects):
            if oid not in objects_before and oid not in keep:
                del ex.objects[oid]
        for prefix in ('c', 'h'):
            ex.counters[prefix] = counters_before.get(prefix, 0)
        second = FunctionRun(ex, addr, info, arg_values, regions)
        second.region_end = ends
        ex.local_names = second.local_names
        ex.arg_names = {}
        for off, v in arg_values.items():
            ex.arg_names[off] = ex.render(v)
        stmts = second.run()
        flat = peephole(stmts)
        labels = {st[1]: i for i, st in enumerate(flat) if st[0] == 'label'}
        tree = structure(flat, 0, len(flat), labels)
        ex.live_labels = set()
        unreferenced_labels(tree, ex.live_labels)
        report.append(f'## {info["new_name"]}')
        report.append('')
        report.append('```')
        body = []
        render_tree(ex, tree, 0, body)
        report.extend(body)
        report.append('```')
        report.append('')
        scenes = scene_summaries(ex, flat, scene_number)
        scene_number += len(scenes)
        data['parties'].append({'fonction': info['new_name'], 'scènes': scenes, 'pseudo_code': body,
                                'arbre': tree_json(ex, tree)})
        for st in flat:
            if st[0] == 'follow':
                callee = st[1]
                caller_args = st[2]
                mapping = {}
                for k, v in enumerate(caller_args):
                    mapping[6 + 2 * k] = v
                queue.append((callee, mapping))

    report.append('## Tableaux du segment de données')
    report.append('')
    for t in ex.tables:
        report.append(f'- **{t["nom"]}** : {t["octets"]} octets depuis `{t["source"]}` ⟨{t["ligne"]}⟩')
        words = t['mots']
        for k in range(0, len(words), 20):
            report.append('  `' + ' '.join(str(w) for w in words[k:k + 20]) + '`')
    data['tableaux'] = ex.tables
    data['objets'] = objects_json(ex)
    open(os.path.join(out_dir, f'{name}.md'), 'w', encoding='utf-8').write('\n'.join(report) + '\n')
    json.dump(data, open(os.path.join(out_dir, f'{name}.json'), 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
    print(f'{scene_number - 1} scènes ; rapport : {os.path.join(out_dir, name + ".md")}')


if __name__ == '__main__':
    main()
