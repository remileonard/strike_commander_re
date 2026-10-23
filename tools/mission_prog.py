"""Lecteur des scripts PROG des fichiers de mission (MISSIONS/*.IFF) de STRIKE.EXE.

Désassemble le chunk PROG en programmes (séparés par l'instruction 00h), indique quel objet (PART)
ou quelle scène (SCNE) déclenche chaque programme, et retrouve d'où viennent les 8 variables de
résultat (STAT, opcode 14h) que STRIKE.EXE écrit dans misn2op.iff (GAMEFLOW_SYSTEM.md § 6.1).
Sémantique des opcodes : MISSION_SCRIPT_OPCODES.md, « Instructions de base du bytecode PROG ».

Usage :
  python3 tools/mission_prog.py <MISN-xx.IFF>...            programmes désassemblés
  python3 tools/mission_prog.py --stat <MISN-xx.IFF>...     origine des variables de résultat
"""
import collections
import os
import struct
import sys

# Instructions lues dans Expr_VM_Interpreter_51106 (seg114). n = argument, acc = [instr+0Ch].
OPS = {
    0x00: 'retour',
    0x01: 'retour',
    0x02: 'appel programme {n}',
    0x03: 'appel programme acc',
    0x04: 'arrêt du script',
    0x08: 'étiquette {n}',
    0x0F: 'code de sortie = {n}',
    0x10: 'acc = {n}',
    0x11: 'acc = FLAG[{n}]',
    0x12: 'échange acc et FLAG[{n}]',
    0x13: 'acc = résultat natif',
    0x14: 'STAT[{n}] = acc',
    0x15: 'acc = hasard 0..{n}',
    0x20: 'acc += {n}',
    0x21: 'acc += FLAG[{n}]',
    0x22: 'FLAG[{n}] += {n}',
    0x23: 'FLAG[{n}] += acc',
    0x24: 'acc -= {n}',
    0x25: 'acc -= FLAG[{n}]',
    0x26: 'FLAG[{n}] -= {n}',
    0x27: 'FLAG[{n}] -= acc',
    0x28: 'acc |= {n}',
    0x29: 'acc |= FLAG[{n}]',
    0x2A: 'acc &= {n}',
    0x2B: 'acc &= FLAG[{n}]',
    0x2C: 'acc ^= {n}',
    0x2D: 'acc ^= FLAG[{n}]',
    0x2E: 'acc *= {n}',
    0x2F: 'acc *= FLAG[{n}]',
    0x30: 'acc /= {n}',
    0x31: 'acc /= FLAG[{n}]',
    0x40: 'comparer acc à {n}',
    0x41: 'comparer {n} à acc',
    0x42: 'comparer acc à FLAG[{n}]',
    0x43: 'comparer FLAG[{n}] à acc',
    0x44: 'comparer résultat natif à {n}',
    0x45: 'comparer FLAG[{n}] à 1',
    0x46: 'si résultat natif != 0 : aller à {n}',
    0x47: 'si résultat natif == 0 : aller à {n}',
    0x48: 'si égal : aller à {n}',
    0x49: 'si différent : aller à {n}',
    0x4A: 'si inférieur : aller à {n}',
    0x4B: 'si supérieur : aller à {n}',
    0x4C: 'si inférieur ou égal : aller à {n}',
    0x4D: 'si supérieur ou égal : aller à {n}',
    0x4E: 'aller à {n}',
    0x4F: 'aller à l\'étiquette acc',
    0x50: 'FLAG[{n}] = acc',
    0x51: 'FLAG[{n}] = résultat natif',
    0x52: 'FLAG[{n}] = 1',
    0x53: 'FLAG[{n}] = 0',
    0x54: 'FLAG[{n}] ^= 1',
    0x55: 'FLAG[{n}] += 1',
    0x56: 'FLAG[{n}] -= 1',
    0x90: 'activer l\'objet {n}',
    0x91: 'désactiver l\'objet {n}',
    0xA1: 'ordre : décoller',
    0xA2: 'ordre : atterrir',
    0xA7: 'ordre : détruire l\'objet {n}',
    0xAA: 'ordre : suivre l\'allié {n}',
    0xAB: 'message radio {n}',
    0xB6: 'visible sur la carte',
    0xB7: 'invisible sur la carte',
    0xB8: 'accompagne le joueur',
    0xB9: 'n\'accompagne plus le joueur',
}

# Instructions qui écrivent FLAG[n] (toutes celles de l'interpréteur).
FLAG_WRITERS = {
    0x12,
    0x22,
    0x23,
    0x26,
    0x27,
    0x50,
    0x51,
    0x52,
    0x53,
    0x54,
    0x55,
    0x56,
}

PART_SIZE = 62
PART_HOOKS = (
    (0x36, 'activé'),
    (0x38, 'mise à jour'),
    (0x3A, 'détruit'),
    (0x3C, 'init'),
)
SCNE_HOOKS = (
    (3, 'scène activée'),
    (5, 'scène quittée'),
    (7, 'scène mise à jour'),
)


def read_chunks(data, pos, end, out):
    while pos + 8 <= end:
        tag = data[pos:pos + 4].decode('latin-1')
        size = struct.unpack('>I', data[pos + 4:pos + 8])[0]
        if tag in ('FORM', 'CAT ', 'LIST'):
            read_chunks(data, pos + 12, pos + 8 + size, out)
        else:
            out.setdefault(tag, []).append(data[pos + 8:pos + 8 + size])
        pos += 8 + size + (size & 1)


def instructions(prog):
    """(programme, position, opcode, argument, 2e argument ou None) ; Expr_VM_ReadNextToken_50F85."""
    out = []
    pos = 0
    number = 0
    while pos + 1 < len(prog):
        at = pos
        op = prog[pos]
        arg = prog[pos + 1]
        pos += 2
        arg2 = None
        if pos + 1 < len(prog) and prog[pos] == 9:
            arg2 = prog[pos + 1]
            pos += 2
        out.append((number, at, op, arg, arg2))
        if op == 0:
            number += 1
    return out


def hooks_of(chunks):
    hooks = collections.defaultdict(list)
    part = chunks.get('PART', [b''])[0]
    for index in range(len(part) // PART_SIZE):
        record = part[index * PART_SIZE:(index + 1) * PART_SIZE]
        name = record[2:10].split(b'\0')[0].decode('latin-1')
        for offset, label in PART_HOOKS:
            prog = struct.unpack('<H', record[offset:offset + 2])[0]
            if prog != 0xFFFF:
                hooks[prog].append(f'PART {index} {name} ({label})')
    for index, record in enumerate(chunks.get('SCNE', [])):
        for offset, label in SCNE_HOOKS:
            prog = struct.unpack('<h', record[offset:offset + 2])[0]
            if prog >= 0:
                hooks[prog].append(f'SCNE {index} ({label})')
    return hooks


def callers_of(instrs):
    callers = collections.defaultdict(set)
    for number, _, op, arg, _ in instrs:
        if op == 0x02:
            callers[arg].add(number)
    return callers


def describe(op, arg, arg2):
    text = OPS.get(op, f'natif {op}' if op >= 128 else f'{op} (sans effet lu)')
    text = text.replace('{n}', str(arg)) if '{n}' in text else f'{text} ({arg})'
    if arg2 is not None:
        text += f', {arg2}'
    return text


def triggers(prog, hooks, callers, seen=None):
    """Déclencheurs d'un programme : objets et scènes, directement ou via les appels 02h."""
    seen = seen if seen is not None else set()
    if prog in seen:
        return []
    seen.add(prog)
    out = list(hooks.get(prog, []))
    for caller in sorted(callers.get(prog, [])):
        out += [f'{t} → programme {caller}' for t in triggers(caller, hooks, callers, seen)]
    return out


def dump(path):
    chunks = {}
    data = open(path, 'rb').read()
    read_chunks(data, 0, len(data), chunks)
    instrs = instructions(chunks['PROG'][0])
    hooks = hooks_of(chunks)
    callers = callers_of(instrs)
    print(f'== {os.path.basename(path)}')
    current = None
    for number, at, op, arg, arg2 in instrs:
        if number != current:
            current = number
            where = hooks.get(number, []) + [f'appel depuis le programme {c}' for c in sorted(callers.get(number, []))]
            where = '; '.join(where) or '—'
            print(f'-- programme {number} (déclenché par : {where})')
        print(f'   {at:5d}  {op:3d} {arg:3d}   {describe(op, arg, arg2)}')


def stat_report(path):
    chunks = {}
    data = open(path, 'rb').read()
    read_chunks(data, 0, len(data), chunks)
    instrs = instructions(chunks['PROG'][0])
    hooks = hooks_of(chunks)
    callers = callers_of(instrs)
    print(f'== {os.path.basename(path)}')
    writes = [(k, ins) for k, ins in enumerate(instrs) if ins[2] == 0x14]
    if not writes:
        print('   aucune variable de résultat écrite (STAT reste à 0)')
        return
    for k, (number, _, _, index, _) in writes:
        back = k - 1
        while instrs[back][2] == 0x14:
            back -= 1
        source = instrs[back]
        trig = '; '.join(triggers(number, hooks, callers)) or 'aucun déclencheur trouvé'
        print(f'   STAT[{index}] ← {describe(source[2], source[3], source[4])}'
              f'   (programme {number} : {trig})')
        if source[2] in (0x11, 0x12, 0x21, 0x2F):
            flag = source[3]
            writers = []
            for wnum, _, wop, warg, warg2 in instrs:
                if wop in FLAG_WRITERS and warg == flag and (wnum, wop, warg, warg2) not in writers:
                    writers.append((wnum, wop, warg, warg2))
            if not writers:
                print(f'      FLAG[{flag}] : aucune instruction du script ne l\'écrit')
            for wnum, wop, warg, warg2 in writers:
                trig = '; '.join(triggers(wnum, hooks, callers)) or 'aucun déclencheur trouvé'
                print(f'      FLAG[{flag}] : {describe(wop, warg, warg2)} (programme {wnum} : {trig})')


def main():
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    if not args:
        raise SystemExit(__doc__)
    for path in args:
        if '--stat' in sys.argv:
            stat_report(path)
        else:
            dump(path)


if __name__ == '__main__':
    main()
