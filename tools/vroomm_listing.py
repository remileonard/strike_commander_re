#!/usr/bin/env python3
"""
vroomm_listing.py — désassemble un exécutable DOS Borland à overlays VROOMM et l'écrit au format
d'un listing IDA, pour que les outils de l'archive (build_function_index, annotate_segments,
match_functions, midgame_extract…) le lisent comme strike.asm et optest.asm.

Écrit pour TOPTTST1.EXE (Tactical Operations), dont on n'a pas de base IDA.

Ce que l'outil reconstruit :
  - les segments de l'image : table des segments de VROOMM (en-tête FBOV après l'image),
    noms segNNN (code), stubNNN (relais d'overlay), dseg (DGROUP, lu dans le « mov dx, DGROUP »
    du point d'entrée) ;
  - les overlays : le code de chaque relais (champ fileoff, codesize, relsize de l'en-tête du
    relais) est placé après l'image, aligné sur 16 octets, sous le nom ovrNNN du relais ;
  - les relocations : celles de l'en-tête MZ pour l'image ; pour un overlay, les mots relogés
    valent (rang dans la table des segments) × 8 ;
  - les fonctions : parcours des branchements depuis le point d'entrée, les entrées des relais,
    les cibles d'appels et les pointeurs lointains relogés du segment de données (tables de
    méthodes), puis les prologues « push bp / mov bp, sp » restés hors parcours ;
  - l'écriture IDA : sub_/loc_ (adresse linéaire sur 5 chiffres), variables var_X / arg_X des
    fonctions à cadre bp, word_/byte_/dword_ du segment de données, push ds / push offset aXxx
    pour les chaînes, nombres en hexadécimal IDA (0C8h), mnémoniques d'IDA (jz, jnb…).

Ce qui n'est pas reconstruit : les tables de saut (switch) et les données au milieu du code,
écrites en db ; les commentaires XREF ; la fusion des variables de pile qui se recouvrent.

Dépendance : capstone (pip install capstone). L'exécutable n'est jamais dans le dépôt.

Usage : python3 tools/vroomm_listing.py TOPTTST1.EXE source/topttst1.asm
"""
import re
import struct
import sys

import capstone
from capstone import x86

STUB_HEADER = 32
STUB_ENTRY = 5

STRING_OPS = {
    'movsb',
    'movsw',
    'movsd',
    'stosb',
    'stosw',
    'stosd',
    'lodsb',
    'lodsw',
    'lodsd',
    'cmpsb',
    'cmpsw',
    'cmpsd',
    'scasb',
    'scasw',
    'scasd',
    'insb',
    'insw',
    'outsb',
    'outsw',
}

JCC = {
    'je': 'jz',
    'jne': 'jnz',
    'jae': 'jnb',
}


def hexa(value):
    """Nombre à la façon d'IDA : décimal sous 10, sinon hexadécimal suffixé h (0C8h)."""
    if value < 0:
        return '-' + hexa(-value)
    if value < 10:
        return str(value)
    text = '%X' % value
    if text[0] in 'ABCDEF':
        text = '0' + text
    return text + 'h'


def name_hex(value):
    return '%X' % value


class Segment:
    def __init__(self, name, kind, start, data):
        self.name = name
        self.kind = kind  # code, stub, ovr, data, dseg
        self.start = start
        self.data = data
        self.relocs = set()  # décalages (dans le segment) des mots de segment relogés
        self.stub_index = None

    @property
    def end(self):
        return self.start + len(self.data)


class Program:
    def __init__(self, path):
        d = open(path, 'rb').read()
        self.file = d
        npages = struct.unpack_from('<H', d, 4)[0]
        last = struct.unpack_from('<H', d, 2)[0]
        header = struct.unpack_from('<H', d, 8)[0] * 16
        image_end = (npages - 1) * 512 + (last or 512)
        self.image = d[header:image_end]
        nrel = struct.unpack_from('<H', d, 6)[0]
        reloc_table = struct.unpack_from('<H', d, 0x18)[0]
        self.image_relocs = set()
        for k in range(nrel):
            off, seg = struct.unpack_from('<HH', d, reloc_table + 4 * k)
            self.image_relocs.add(seg * 16 + off)
        entry_ip = struct.unpack_from('<H', d, 0x14)[0]
        entry_cs = struct.unpack_from('<H', d, 0x16)[0]
        self.entry = entry_cs * 16 + entry_ip
        if self.image[self.entry] != 0xBA:
            raise SystemExit("point d'entrée inattendu : pas de « mov dx, DGROUP »")
        self.dgroup = struct.unpack_from('<H', self.image, self.entry + 1)[0] * 16
        if d[image_end:image_end + 4] != b'FBOV':
            raise SystemExit("pas d'en-tête FBOV après l'image : pas d'overlays VROOMM")
        _, self.ovr_size, table, count = struct.unpack_from('<4sIIH', d, image_end)
        self.ovr_base = image_end + 16
        self.table = [struct.unpack_from('<HHHH', d, table + 8 * k) for k in range(count)]
        self.build_segments()

    # --- segments ---------------------------------------------------------
    def build_segments(self):
        paras = sorted(set(p for p, _, _, _ in self.table if p * 16 < len(self.image)))
        flags = {}
        for p, _, f, _ in self.table:
            flags.setdefault(p, set()).add(f)
        self.segments = []
        self.by_para = {}
        dseg_para = self.dgroup // 16
        bounds = [p for p in paras if p < dseg_para] + [dseg_para]
        number = 0
        for i, p in enumerate(bounds):
            start = p * 16
            end = bounds[i + 1] * 16 if i + 1 < len(bounds) else len(self.image)
            if p == dseg_para:
                seg = Segment('dseg', 'dseg', start, self.image[start:end])
            else:
                f = flags.get(p, set())
                data = self.image[start:end]
                if 3 in f and data[:2] == b'\xcd\x3f':
                    seg = Segment('stub%03d' % number, 'stub', start, data)
                elif 1 in f:
                    seg = Segment('seg%03d' % number, 'code', start, data)
                else:
                    seg = Segment('seg%03d' % number, 'data', start, data)
                number += 1
            self.segments.append(seg)
            self.by_para[p] = seg
        for off in self.image_relocs:
            seg = self.segment_at(off)
            if seg:
                seg.relocs.add(off - seg.start)
        # Overlays : un par relais, après l'image.
        address = (len(self.image) + 15) & ~15
        self.overlays = []
        for stub in [s for s in self.segments if s.kind == 'stub']:
            _, fileoff, codesize, relsize, nentries, _ = struct.unpack_from('<HIHHHH', stub.data, 2)
            stub.nentries = nentries
            if codesize == 0:
                stub.overlay = None
                continue
            start = self.ovr_base + fileoff
            code = self.file[start:start + codesize]
            rel = self.file[start + codesize:start + codesize + relsize]
            ovr = Segment('ovr' + stub.name[4:], 'ovr', address, code)
            ovr.relocs = set(struct.unpack_from('<%dH' % (relsize // 2), rel))
            ovr.stub = stub
            stub.overlay = ovr
            self.overlays.append(ovr)
            self.segments.append(ovr)
            address = (address + codesize + 15) & ~15
        self.segments.sort(key=lambda s: s.start)

    def segment_at(self, address):
        for s in self.segments:
            if s.start <= address < s.end:
                return s
        return None

    def far_target(self, seg, value):
        """Paragraphe de segment désigné par un mot relogé (image : paragraphe ; overlay : rang × 8)."""
        if seg.kind == 'ovr':
            if value % 8:
                return None
            k = value // 8
            if k >= len(self.table):
                return None
            value = self.table[k][0]
        return self.by_para.get(value)

    def stub_entry_target(self, stub, offset):
        """Adresse de la fonction d'overlay derrière une entrée de relais (INT 3Fh, mot de décalage)."""
        k = (offset - STUB_HEADER) // STUB_ENTRY
        if offset < STUB_HEADER or (offset - STUB_HEADER) % STUB_ENTRY or k >= stub.nentries or stub.overlay is None:
            return None
        pos = STUB_HEADER + STUB_ENTRY * k
        if stub.data[pos:pos + 2] != b'\xcd\x3f':
            return None
        return stub.overlay.start + struct.unpack_from('<H', stub.data, pos + 2)[0]


class Listing:
    def __init__(self, prog):
        self.p = prog
        self.md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_16)
        self.md.detail = True
        self.insns = {}  # adresse linéaire -> instruction capstone
        self.functions = {}  # adresse -> 'far' | 'near'
        self.labels = set()  # cibles de branchement
        self.data_refs = {}  # adresse dans dseg -> taille du premier accès
        self.offset_refs = set()  # adresses de dseg poussées comme offset
        self.thunks = {}  # adresse d'entrée de relais -> fonction d'overlay
        self.tables = {}  # adresse de table de switch -> (valeurs ou None, cibles linéaires)
        self.data = set()  # octets des tables de switch (jamais décodés comme code)
        self.switch_jumps = {}  # adresse du jmp indirect -> adresse de la table des cibles
        self.search_tables = {}  # segment -> [(table des valeurs, nombre de cas)] vus dans « mov cx / mov bx »

    # --- parcours ---------------------------------------------------------
    def decode(self, seg, offset):
        address = seg.start + offset
        if address in self.insns:
            return self.insns[address]
        code = seg.data[offset:offset + 16]
        for ins in self.md.disasm(code, offset, 1):
            self.insns[address] = ins
            return ins
        return None

    def far_call_target(self, seg, ins):
        """Cible linéaire d'un call/jmp ptr16:16, en traversant les relais d'overlay."""
        off, value = struct.unpack_from('<HH', ins.bytes, 1)
        if (ins.address + 3) in seg.relocs:
            target = self.p.far_target(seg, value)
        else:
            target = None
        if target is None:
            return None
        if target.kind == 'stub':
            if target.overlay is not None:
                self.thunks.setdefault(target.start + off, self.p.stub_entry_target(target, off))
            return target.start + off
        return target.start + off

    def explore(self, address, kind='far'):
        work = [(address, kind)]
        while work:
            address, kind = work.pop()
            seg = self.p.segment_at(address)
            if seg is None or seg.kind not in ('code', 'ovr'):
                continue
            if address not in self.functions:
                self.functions[address] = kind
            elif kind == 'far':
                self.functions[address] = 'far'
            todo = [(address - seg.start, [])]
            while todo:
                off, recent = todo.pop()
                recent = list(recent)
                while 0 <= off < len(seg.data):
                    lin = seg.start + off
                    if lin in self.insns or lin in self.data:
                        break
                    ins = self.decode(seg, off)
                    if ins is None:
                        break
                    recent.append(ins)
                    b0 = ins.bytes[0]
                    nxt = off + ins.size
                    mn = ins.mnemonic
                    if mn == 'lcall' and b0 == 0x9A:
                        t = self.far_call_target(seg, ins)
                        if t is not None:
                            # Appel d'une entrée de relais : la vraie fonction est dans l'overlay.
                            work.append((self.thunks.get(t) or t, 'far'))
                    elif mn == 'call' and ins.operands[0].type == x86.X86_OP_IMM:
                        work.append((seg.start + (ins.operands[0].imm & 0xFFFF), 'near'))
                    elif mn == 'ljmp' and b0 == 0xEA:
                        t = self.far_call_target(seg, ins)
                        if t is not None:
                            work.append((t, 'far'))
                        break
                    elif mn == 'jmp' and ins.operands and ins.operands[0].type == x86.X86_OP_MEM:
                        for t in self.switch_targets(seg, ins, recent):
                            self.labels.add(seg.start + t)
                            todo.append((t, []))
                        break
                    elif mn == 'mov' and ins.op_str.startswith('bx, ') and ins.operands[1].type == x86.X86_OP_IMM \
                            and len(recent) >= 2 and recent[-2].op_str.startswith('cx, ') \
                            and recent[-2].operands[1].type == x86.X86_OP_IMM:
                        # Switch par recherche : mov cx, N / mov bx, table des N valeurs (suivie des N cibles).
                        self.search_tables.setdefault(seg.name, []).append(
                            (ins.operands[1].imm & 0xFFFF, recent[-2].operands[1].imm & 0xFFFF))
                    elif mn.startswith('j') or mn.startswith('loop'):
                        if ins.operands and ins.operands[0].type == x86.X86_OP_IMM:
                            t = ins.operands[0].imm & 0xFFFF
                            self.labels.add(seg.start + t)
                            # L'historique suit le saut : le cmp d'un switch précède souvent un jbe.
                            todo.append((t, recent[-8:]))
                        if mn == 'jmp':
                            break
                    elif mn in ('ret', 'retf', 'iret', 'hlt'):
                        break
                    elif mn == 'int' and ins.operands and ins.operands[0].imm in (0x20,):
                        break
                    off = nxt

    def switch_targets(self, seg, ins, recent):
        """Cibles d'un saut indirect par table (switch de Borland), décalages dans le segment."""
        op = ins.operands[0]
        m = op.mem
        if m.segment != x86.X86_REG_CS or m.base != x86.X86_REG_BX or m.index or op.size != 2:
            return []
        disp = m.disp & 0xFFFF
        # Switch par indice : cmp bx, N (ou cmp reg, N puis mov bx, reg) / ja / shl bx, 1 / jmp cs:[bx+table].
        count = None
        for prev in reversed(recent[-8:-1]):
            if prev.mnemonic == 'cmp' and prev.operands[1].type == x86.X86_OP_IMM:
                count = (prev.operands[1].imm & 0xFFFF) + 1
                break
        if count is not None and 0 < count <= 256 and disp + 2 * count <= len(seg.data):
            values = None
            table = disp
        else:
            # Switch par recherche : la table des cibles suit celle des valeurs (jmp cs:[bx+2N]).
            found = [(t, n) for t, n in self.search_tables.get(seg.name, []) if 2 * n == disp]
            if not found:
                return []
            start, count = found[-1]
            if start + 4 * count > len(seg.data):
                return []
            values = [struct.unpack_from('<H', seg.data, start + 2 * k)[0] for k in range(count)]
            table = start + 2 * count
            self.tables[seg.start + start] = ('values', values)
            for a in range(seg.start + start, seg.start + start + 2 * count):
                self.data.add(a)
        targets = [struct.unpack_from('<H', seg.data, table + 2 * k)[0] for k in range(count)]
        if any(t >= len(seg.data) for t in targets):
            return []
        self.tables[seg.start + table] = ('targets', [seg.start + t for t in targets])
        for a in range(seg.start + table, seg.start + table + 2 * count):
            self.data.add(a)
        self.switch_jumps[seg.start + ins.address] = (seg.start + table, values is None)
        return targets

    def run(self):
        p = self.p
        self.explore(p.entry, 'near')
        self.functions[p.entry] = 'start'
        # Entrées des relais.
        for stub in [s for s in p.segments if s.kind == 'stub']:
            for k in range(getattr(stub, 'nentries', 0)):
                off = STUB_HEADER + STUB_ENTRY * k
                t = p.stub_entry_target(stub, off)
                if t is not None:
                    self.thunks[stub.start + off] = t
                    self.explore(t, 'far')
        # Pointeurs lointains relogés du segment de données (tables de méthodes, rappels).
        dseg = next(s for s in p.segments if s.kind == 'dseg')
        for r in sorted(dseg.relocs):
            if r < 2:
                continue
            off = struct.unpack_from('<H', dseg.data, r - 2)[0]
            target = p.far_target(dseg, struct.unpack_from('<H', dseg.data, r)[0])
            if target is None:
                continue
            if target.kind == 'stub':
                t = p.stub_entry_target(target, off)
                if t is not None:
                    self.thunks[target.start + off] = t
                    self.explore(t, 'far')
            elif target.kind == 'code' and off < len(target.data):
                self.explore(target.start + off, 'far')
        # Prologues restés hors parcours, jusqu'à stabilité.
        changed = True
        while changed:
            changed = False
            for seg in p.segments:
                if seg.kind not in ('code', 'ovr'):
                    continue
                off = 0
                while off < len(seg.data) - 3:
                    lin = seg.start + off
                    if lin in self.insns:
                        off += self.insns[lin].size
                        continue
                    if seg.data[off:off + 3] in (b'\x55\x8b\xec', b'\xc8\x00\x00') or seg.data[off] == 0xC8 and seg.data[off + 3] == 0:
                        if seg.data[off:off + 3] == b'\x55\x8b\xec' or seg.data[off] == 0xC8:
                            self.explore(lin, 'far')
                            changed = True
                            continue
                    off += 1
        # Fin de chaque fonction comme chez IDA : dernier octet atteint par le parcours depuis son entrée.
        self.reached = set(self.insns)
        # Code mort à l'intérieur des fonctions (après un ret, comme IDA) : décodé linéairement.
        self.fill_gaps()
        # Une fonction qui se termine par retf est lointaine.
        for address in list(self.functions):
            if self.functions[address] == 'near':
                for a in self.body(address):
                    ins = self.insns.get(a)
                    if ins and ins.mnemonic == 'retf':
                        self.functions[address] = 'far'
                        break
        self.collect_data_refs()

    def fill_gaps(self):
        for _ in range(4):
            added = False
            for seg in self.p.segments:
                if seg.kind not in ('code', 'ovr'):
                    continue
                starts = sorted(a for a in self.functions if seg.start <= a < seg.end)
                for i, start in enumerate(starts):
                    end = starts[i + 1] if i + 1 < len(starts) else seg.end
                    a = start
                    while a < end:
                        ins = self.insns.get(a)
                        if ins is not None:
                            a += ins.size
                            continue
                        if a in self.data:
                            a += 1
                            continue
                        # Trou : décodage linéaire tant que les instructions tiennent dans la fonction.
                        b = a
                        ok = True
                        while b < end and b not in self.insns and b not in self.data:
                            new = self.decode(seg, b - seg.start)
                            if new is None or b + new.size > end:
                                ok = False
                                break
                            b += new.size
                        if not ok or (b < end and b not in self.insns and b not in self.data):
                            # Décodage impossible ou à cheval : on laisse les octets en db.
                            c = a
                            while c < b:
                                ins2 = self.insns.pop(c, None)
                                c += ins2.size if ins2 else 1
                            a += 1
                            continue
                        c = a
                        while c < b:
                            ins2 = self.insns[c]
                            mn = ins2.mnemonic
                            if (mn.startswith('j') or mn.startswith('loop')) and ins2.operands \
                                    and ins2.operands[0].type == x86.X86_OP_IMM:
                                t = seg.start + (ins2.operands[0].imm & 0xFFFF)
                                self.labels.add(t)
                                if t not in self.insns:
                                    self.explore_inside(seg, t)
                            c += ins2.size
                        added = True
                        a = b
            if not added:
                break

    def explore_inside(self, seg, address):
        """Parcourt depuis une cible de saut sans en faire une fonction."""
        keep = dict(self.functions)
        self.explore(address, 'near')
        if address not in keep:
            self.functions.pop(address, None)

    def proc_end(self, seg, start, end):
        """Fin de la fonction (exclue) : après la dernière instruction atteinte par le parcours."""
        last = start
        for a in range(start, end):
            if a in self.reached:
                last = max(last, a + self.insns[a].size)
        return last if last > start else end

    def body(self, address):
        seg = self.p.segment_at(address)
        nexts = [a for a in self.functions if seg.start <= a < seg.end and a > address]
        end = min(nexts) if nexts else seg.end
        return [a for a in range(address, end) if a in self.insns]

    # --- références au segment de données ---------------------------------
    def collect_data_refs(self):
        for address, ins in self.insns.items():
            for op in ins.operands:
                if op.type == x86.X86_OP_MEM and op.mem.base == 0 and op.mem.index == 0:
                    if op.mem.segment in (0, x86.X86_REG_DS):
                        target = self.p.dgroup + (op.mem.disp & 0xFFFF)
                        self.data_refs.setdefault(target, op.size)

    def string_at(self, address):
        img = self.p.image
        end = img.find(b'\0', address)
        if end < 0 or end - address < 1 or end - address > 200:
            return None
        text = img[address:end]
        if all(32 <= c < 127 or c in (9, 10, 13) for c in text):
            return text.decode('latin-1')
        return None


def string_label(text, used):
    base = 'a' + ''.join(w[:1].upper() + w[1:] for w in re.split(r'[^A-Za-z0-9]+', text) if w)
    if base == 'a':
        base = 'a_'
    base = base[:20]
    name = base
    k = 1
    while name in used:
        name = '%s_%d' % (base, k)
        k += 1
    used.add(name)
    return name


class Writer:
    def __init__(self, listing):
        self.l = listing
        self.p = listing.p
        self.out = []
        self.data_labels = {}
        self.string_labels = {}
        self.make_data_labels()

    def make_data_labels(self):
        used = set()
        names = {1: 'byte', 2: 'word', 4: 'dword'}
        for address, size in sorted(self.l.data_refs.items()):
            self.data_labels[address] = '%s_%X' % (names.get(size, 'unk'), address)

    def emit(self, text=''):
        self.out.append(text)

    # --- opérandes --------------------------------------------------------
    def label_for(self, address):
        if address in self.l.functions:
            return 'start' if self.l.functions[address] == 'start' else 'sub_%X' % address
        if address in self.l.thunks:
            return 'sub_%X' % address
        return 'loc_%X' % address

    def mem(self, seg, ins, op, frame, has_reg_operand):
        m = op.mem
        regname = ins.reg_name
        size_names = {1: 'byte ptr ', 2: 'word ptr ', 4: 'dword ptr ', 8: 'qword ptr ', 6: 'fword ptr '}
        override = ''
        if m.segment:
            override = regname(m.segment) + ':'
        base = regname(m.base) if m.base else ''
        index = regname(m.index) if m.index else ''
        disp = m.disp
        prefix = '' if has_reg_operand else size_names.get(op.size, '')
        # Accès direct : étiquette du segment de données.
        if not base and not index:
            if not m.segment or m.segment == x86.X86_REG_DS:
                address = self.p.dgroup + (disp & 0xFFFF)
                label = self.data_labels.get(address)
                if label:
                    declared = {'byte': 1, 'word': 2, 'dword': 4}.get(label.split('_')[0], 0)
                    pre = size_names.get(op.size, '') if declared != op.size else ''
                    return pre + label
            return prefix + override + hexa(disp & 0xFFFF)
        # Variables de la fonction à cadre bp.
        if base == 'bp' and frame is not None and frame.bp and not override:
            name, declared = frame.ref(disp)
            pre = size_names.get(op.size, '') if declared != op.size else ''
            if index:
                return pre + '[bp+%s+%s]' % (index, name)
            return pre + '[bp+%s]' % name
        inner = base
        if index:
            inner = inner + '+' + index if inner else index
        if disp:
            if disp < 0:
                inner += '-' + hexa(-disp)
            else:
                inner += ('+' if inner else '') + hexa(disp)
        return prefix + override + '[' + inner + ']'

    def instruction(self, seg, ins, frame, prev):
        b = ins.bytes
        mn = ins.mnemonic
        prefix32 = 0x66 in b[:2]
        # Mnémoniques mal nommés par capstone en mode 16 bits.
        if b[0] == 0x99 or (b[0] == 0x66 and b[1] == 0x99):
            return 'cdq' if prefix32 else 'cwd'
        if b[0] == 0x98 or (b[0] == 0x66 and b[1] == 0x98):
            return 'cwde' if prefix32 else 'cbw'
        # Instructions de chaîne : IDA n'écrit pas leurs opérandes implicites (« rep movsw »).
        if mn.split()[-1] in STRING_OPS:
            return mn
        # Appels et sauts.
        if b[0] == 0x9A or (b[0] == 0xEA):
            t = self.l.far_call_target(seg, ins)
            word = 'call' if b[0] == 0x9A else 'jmp'
            if t is None:
                off, value = struct.unpack_from('<HH', b, 1)
                return '%s\tfar ptr %s:%s' % (word, hexa(value), hexa(off))
            return '%s\t%s' % (word, self.label_for(t))
        if mn in ('call', 'jmp') and ins.operands and ins.operands[0].type == x86.X86_OP_IMM:
            t = seg.start + (ins.operands[0].imm & 0xFFFF)
            if mn == 'call':
                if self.l.functions.get(t) == 'far':
                    return 'call\tnear ptr %s' % self.label_for(t)
                return 'call\t%s' % self.label_for(t)
            short = 'short ' if b[0] == 0xEB else ''
            return 'jmp\t%s%s' % (short, self.label_for(t))
        if (mn.startswith('j') or mn.startswith('loop')) and ins.operands and ins.operands[0].type == x86.X86_OP_IMM:
            t = seg.start + (ins.operands[0].imm & 0xFFFF)
            short = 'short ' if len(b) == 2 else ''
            return '%s\t%s%s' % (JCC.get(mn, mn), short, self.label_for(t))
        if mn in ('lcall', 'ljmp'):
            mn = mn[1:]
            op = ins.operands[0]
            return '%s\t%s' % (mn, 'dword ptr ' + self.mem(seg, ins, op, frame, True).replace('dword ptr ', ''))
        if mn == 'jmp' and seg.start + ins.address in self.l.switch_jumps:
            table, indexed = self.l.switch_jumps[seg.start + ins.address]
            if indexed:
                return 'jmp\tcs:off_%X[bx]\t; switch jump' % table
            return 'jmp\t%s ; switch jump' % self.mem(seg, ins, ins.operands[0], frame, False)
        if mn in ('call', 'jmp') and ins.operands[0].type == x86.X86_OP_MEM:
            return '%s\t%s' % (mn, 'word ptr ' + self.mem(seg, ins, ins.operands[0], frame, True).replace('word ptr ', ''))
        ops = []
        has_reg = any(op.type == x86.X86_OP_REG for op in ins.operands)
        if mn in ('movzx', 'movsx'):
            has_reg = False
        for i, op in enumerate(ins.operands):
            if op.type == x86.X86_OP_REG:
                ops.append(ins.reg_name(op.reg))
            elif op.type == x86.X86_OP_MEM:
                if mn in ('les', 'lds', 'lea', 'lfs', 'lgs', 'lss'):
                    ops.append(self.mem(seg, ins, op, frame, True))
                else:
                    ops.append(self.mem(seg, ins, op, frame, has_reg))
            elif op.type == x86.X86_OP_IMM:
                ops.append(self.immediate(seg, ins, op, i, prev))
        if mn == 'push' and prefix32 and ins.operands and ins.operands[0].type == x86.X86_OP_IMM:
            ops[0] = 'large ' + ops[0]
        if mn == 'push' and prefix32 and ins.operands and ins.operands[0].type == x86.X86_OP_MEM:
            ops[0] = 'large ' + ops[0].replace('dword ptr ', '')
        mn = JCC.get(mn, mn)
        return mn + ('\t' + ', '.join(ops) if ops else '')

    def immediate(self, seg, ins, op, i, prev):
        size = op.size or 2
        value = op.imm & ((1 << (8 * size)) - 1) if size < 8 else op.imm
        # Table des valeurs d'un switch par recherche : mov bx, offset word_X.
        if ins.mnemonic == 'mov' and size == 2 and (seg.start + value) in self.l.tables \
                and self.l.tables[seg.start + value][0] == 'values':
            return 'offset word_%X' % (seg.start + value)
        # Mot de segment relogé : seg <nom>.
        imm_pos = ins.address + ins.size - size
        if size == 2 and imm_pos in seg.relocs:
            target = self.p.far_target(seg, op.imm & 0xFFFF)
            if target is not None:
                return 'seg ' + target.name
        # push ds / push offset <chaîne> : pointeur lointain vers le segment de données.
        if ins.mnemonic == 'push' and size == 2 and prev is not None and prev.mnemonic == 'push' and prev.op_str == 'ds':
            address = self.p.dgroup + value
            label = self.string_labels.get(address) or self.data_labels.get(address)
            if label:
                return 'offset ' + label
        # push seg <relais> / push offset <fonction> : pointeur de fonction lointain.
        if ins.mnemonic == 'push' and size == 2 and prev is not None and prev.mnemonic == 'push' and prev.operands \
                and prev.operands[0].type == x86.X86_OP_IMM:
            ppos = prev.address + prev.size - 2
            if ppos in seg.relocs:
                target = self.p.far_target(seg, prev.operands[0].imm & 0xFFFF)
                if target is not None and target.kind in ('code', 'stub'):
                    return 'offset ' + self.label_for(target.start + value)
        return hexa(value)

    # --- émission ---------------------------------------------------------
    def find_strings(self):
        used = set()
        for address, ins in sorted(self.l.insns.items()):
            pass
        # Chaînes : valeurs poussées juste après push ds.
        seg_of = {}
        for seg in self.p.segments:
            if seg.kind in ('code', 'ovr'):
                prev = None
                for off in range(len(seg.data)):
                    ins = self.l.insns.get(seg.start + off)
                    if ins is None:
                        continue
                    if prev is not None and ins.mnemonic == 'push' and prev.mnemonic == 'push' and prev.op_str == 'ds' \
                            and ins.operands and ins.operands[0].type == x86.X86_OP_IMM:
                        address = self.p.dgroup + (ins.operands[0].imm & 0xFFFF)
                        if address not in self.string_labels:
                            text = self.l.string_at(address)
                            if text is not None:
                                self.string_labels[address] = string_label(text, used)
                            elif address not in self.data_labels:
                                # Autre donnée passée en pointeur lointain (table recopiée…) : unk_X, comme IDA.
                                self.data_labels[address] = 'unk_%X' % address
                    prev = ins

    def write(self, path):
        self.find_strings()
        e = self.emit
        e('; Listing reconstruit par tools/vroomm_listing.py (capstone), au format IDA.')
        e('; Pas de base IDA : noms sub_/loc_/word_ = adresses linéaires, overlays placés après l\'image.')
        e('')
        e('\t\t.386')
        e('\t\t.model large')
        for seg in self.p.segments:
            if seg.kind in ('code', 'ovr'):
                self.write_code(seg)
            elif seg.kind == 'stub':
                self.write_stub(seg)
            else:
                self.write_data(seg)
        e('\t\tend start')
        with open(path, 'w', encoding='cp437', errors='replace', newline='\n') as f:
            f.write('\n'.join(self.out) + '\n')

    def segment_header(self, seg, cls):
        e = self.emit
        e('')
        e('; ' + '=' * 70)
        e('')
        e('; Segment type:\t%s' % ('Pure data' if cls == 'DATA' else 'Pure code'))
        e("%s\t\tsegment\tpara public '%s' use16" % (seg.name, cls))
        e('\t\tassume cs:%s' % seg.name)
        e('\t\tassume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing')

    def write_data(self, seg):
        self.segment_header(seg, 'DATA')
        e = self.emit
        data = seg.data
        labels = {a - seg.start: n for a, n in self.data_labels.items() if seg.start <= a < seg.end}
        for a, n in self.string_labels.items():
            if seg.start <= a < seg.end:
                labels[a - seg.start] = n
        if 0 not in labels:
            labels[0] = 'byte_%X' % seg.start
        cuts = sorted(set(labels) | set(range(0, len(data), 16)))
        strings = {a - seg.start for a in self.string_labels if seg.start <= a < seg.end}
        i = 0
        while i < len(data):
            nxt = [c for c in cuts if c > i]
            end = nxt[0] if nxt else len(data)
            if i in strings:
                end = data.find(b'\0', i) + 1
            chunk = data[i:end]
            name = labels.get(i)
            if name is None and i % 64 == 0:
                name = 'byte_%X' % (seg.start + i)
            text = ', '.join(hexa(c) for c in chunk)
            e('%s\tdb %s' % (name or '\t', text))
            i = end
        e('%s\t\tends' % seg.name)

    def write_stub(self, seg):
        self.segment_header(seg, 'CODE')
        e = self.emit
        _, fileoff, codesize, relsize, nentries, prev = struct.unpack_from('<HIHHHH', seg.data, 2)
        e('stru_%05X\tdb 0CDh, 3Fh\t\t; int_code' % seg.start)
        e('\t\tdw 0\t\t\t; memswap')
        e('\t\tdd %s\t\t; fileoff' % hexa(fileoff))
        e('\t\tdw %s\t\t; codesize' % hexa(codesize))
        e('\t\tdw %s\t\t; relsize' % hexa(relsize))
        e('\t\tdw %s\t\t\t; nentries' % hexa(nentries))
        e('\t\tdw %s\t\t; prevstub' % hexa(prev))
        e('\t\tdb 10h dup(0)\t\t; workarea')
        for k in range(nentries):
            off = STUB_HEADER + STUB_ENTRY * k
            address = seg.start + off
            target = self.p.stub_entry_target(seg, off)
            name = 'sub_%X' % address
            e('')
            e('; ' + '-' * 70)
            e('')
            e('; Attributes: thunk')
            e('')
            e('%s\tproc far' % name)
            e('\t\tjmp\t%s' % (self.label_for(target) if target is not None else 'far ptr 0:0'))
            e('%s\tendp' % name)
        rest = STUB_HEADER + STUB_ENTRY * nentries
        if rest < len(seg.data):
            e('\t\tdb %s' % ', '.join(hexa(c) for c in seg.data[rest:rest + 64]) + (' ; ...' if len(seg.data) - rest > 64 else ''))
        e('%s\t\tends' % seg.name)

    def write_code(self, seg):
        self.segment_header(seg, 'OVERLAY' if seg.kind == 'ovr' else 'CODE')
        e = self.emit
        starts = sorted(a for a in self.l.functions if seg.start <= a < seg.end)
        bounds = starts + [seg.end]
        if not starts or starts[0] > seg.start:
            self.write_range(seg, seg.start, starts[0] if starts else seg.end, None, None)
        for i, start in enumerate(starts):
            end = bounds[i + 1]
            kind = self.l.functions[start]
            name = self.label_for(start)
            frame = Frame(self, seg, start, end, kind)
            e('')
            e('; ' + '-' * 70)
            e('')
            if frame.bp:
                e('; Attributes: bp-based frame')
                e('')
            if kind == 'start':
                e('\t\tpublic start')
            e('%s\t\tproc %s' % (name, 'near' if kind in ('near', 'start') else 'far'))
            if frame.bp and frame.names:
                e('')
                for disp in sorted(frame.names):
                    e('%s\t\t= %s ptr %s' % (frame.names[disp], {1: 'byte', 4: 'dword'}.get(frame.sizes[disp], 'word'),
                                            (' ' + hexa(disp)) if disp >= 0 else '-' + hexa(-disp)))
                e('')
            stop = self.l.proc_end(seg, start, end)
            self.write_range(seg, start, stop, frame, name)
            e('%s\t\tendp' % name)
            if stop < end:
                # Morceau atteint seulement depuis du code mort : hors du bloc proc, comme IDA.
                e('')
                e('; START OF FUNCTION CHUNK FOR %s' % name)
                self.write_range(seg, stop, end, frame, None, first_label=True)
                e('; END OF FUNCTION CHUNK FOR %s' % name)
        e('%s\t\tends' % seg.name)

    def write_range(self, seg, start, end, frame, name, first_label=False):
        e = self.emit
        a = start
        prev = None
        pending = []

        def flush():
            if pending:
                e('\t\tdb %s' % ', '.join(hexa(c) for c in pending))
                pending.clear()
        while a < end:
            if (a != start or first_label) and (a in self.l.labels or a in self.l.functions):
                flush()
                e('')
                e('%s:' % self.label_for(a))
            table = self.l.tables.get(a)
            if table is not None:
                flush()
                kind, items = table
                for k, item in enumerate(items):
                    if kind == 'values':
                        text = 'dw %s' % hexa(item)
                        label = 'word_%X' % a if k == 0 else ''
                    else:
                        text = 'dw offset %s' % self.label_for(item)
                        label = 'off_%X' % a if k == 0 else ''
                    e('%s\t%s' % (label or '\t', text))
                a += 2 * len(items)
                prev = None
                continue
            ins = self.l.insns.get(a)
            if ins is None or a + ins.size > end:
                pending.append(seg.data[a - seg.start])
                if len(pending) == 16:
                    flush()
                a += 1
                prev = None
                continue
            flush()
            e('\t\t' + self.instruction(seg, ins, frame, prev))
            prev = ins
            a += ins.size
        flush()


class Frame:
    """Variables de pile d'une fonction à cadre bp : var_X (déplacement négatif), arg_X (positif)."""

    def __init__(self, writer, seg, start, end, kind):
        self.names = {}
        self.sizes = {}
        self.alias = {}
        self.bp = False
        insns = [writer.l.insns[a] for a in range(start, end) if a in writer.l.insns]
        if len(insns) >= 2 and insns[0].mnemonic == 'push' and insns[0].op_str == 'bp' and insns[1].mnemonic == 'mov' \
                and insns[1].op_str == 'bp, sp':
            self.bp = True
        elif insns and insns[0].mnemonic == 'enter':
            self.bp = True
        self.args_base = 6 if kind == 'far' else 4
        if not self.bp:
            return
        # Taille de chaque déplacement : le plus grand accès (lea compte pour un mot, comme chez IDA).
        sizes = {}
        for ins in insns:
            for op in ins.operands:
                if op.type == x86.X86_OP_MEM and op.mem.base == x86.X86_REG_BP and not op.mem.segment:
                    size = 2 if ins.mnemonic == 'lea' else op.size
                    if size not in (1, 2, 4):
                        size = 2
                    sizes[op.mem.disp] = max(sizes.get(op.mem.disp, 0), size)
        # Un déplacement à l'intérieur d'une variable plus grande déjà déclarée devient variable+décalage.
        self.alias = {}
        end = None
        owner = None
        for disp in sorted(sizes):
            # Comme IDA : rattaché à la variable précédente seulement s'il y tient entièrement.
            if end is not None and disp < end and disp + sizes[disp] <= end:
                self.alias[disp] = (owner, disp - owner)
                continue
            self.names[disp] = self.var_name(disp)
            self.sizes[disp] = sizes[disp]
            owner = disp
            end = disp + sizes[disp]

    def var_name(self, disp):
        if disp < 0:
            return 'var_%s' % name_hex(-disp)
        if disp >= self.args_base:
            return 'arg_%s' % name_hex(disp - self.args_base)
        return 'saved_%s' % name_hex(disp)

    def ref(self, disp):
        """Texte de l'accès et taille de la variable déclarée."""
        if disp in self.alias:
            owner, delta = self.alias[disp]
            return '%s+%s' % (self.names[owner], hexa(delta)), self.sizes[owner]
        if disp not in self.names:
            self.names[disp] = self.var_name(disp)
            self.sizes[disp] = 2
        return self.names[disp], self.sizes[disp]


def main():
    if len(sys.argv) != 3:
        raise SystemExit(__doc__)
    prog = Program(sys.argv[1])
    listing = Listing(prog)
    listing.run()
    writer = Writer(listing)
    writer.write(sys.argv[2])
    nfun = len(listing.functions)
    print('%d segments (%d overlays), %d fonctions, %d instructions' % (len(prog.segments), len(prog.overlays), nfun,
                                                                       len(listing.insns)))


if __name__ == '__main__':
    main()
