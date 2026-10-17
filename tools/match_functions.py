#!/usr/bin/env python3
"""
match_functions.py — retrouve dans un exécutable les fonctions déjà nommées
dans un autre (même compilateur, mêmes bibliothèques : IFF, mémoire, VROOMM,
AIL, CRT, widgets…), pour reprendre leurs noms.

Deux niveaux de correspondance, sur les fonctions `proc` d'au moins
MIN_INSTRUCTIONS instructions :
  - stricte  : mêmes instructions et mêmes opérandes, noms de labels ignorés
               (sub_/loc_/word_/… remplacés par un jeton) ;
  - approchée: même suite de mnémoniques, opérandes différents (en pratique
               des adresses de variables globales déplacées entre les deux
               exécutables) — à vérifier à la main.

Contrôle des appels : pour une paire acceptée, chaque appel sortant (stubs
VROOMM traversés jusqu'à la vraie fonction) dont la cible est elle-même
appariée doit viser la fonction appariée de l'autre côté ; une seule
contradiction rejette la paire. Ce contrôle sert aussi à départager une
fonction qui a plusieurs candidats identiques. On itère jusqu'à stabilité.

Fonctions courtes (au plus WEAK_INSTRUCTIONS instructions) sans appel
confirmé : acceptées seulement si une fonction voisine dans le fichier
(précédente ou suivante) est appariée à la voisine correspondante de l'autre
exécutable — un simple « setter » de variable globale coïncide sinon trop
facilement.

MANUAL_REJECT : paires approchées relues et rejetées (les opérandes qui
diffèrent changent le sens de la fonction).

Usage (depuis la racine de l'archive) :
    python3 tools/match_functions.py                 # strike -> optest, rapport seul
    python3 tools/match_functions.py --write         # + reprise des noms
    python3 tools/match_functions.py --from strike --to optest --write

Sorties (dossier d'analyse de l'exécutable cible) :
  - strike_matches.json : toutes les correspondances, acceptées ou non,
    avec leurs candidats, le nombre d'appels confirmés et d'opérandes différents ;
  - known_functions.json (avec --write) : une entrée par paire acceptée.
    Une entrée existante n'est remplacée que si elle a été écrite par cet
    outil (résumé commençant par AUTO_PREFIX) : le travail manuel est conservé.
Relancer ensuite build_function_index.py et annotate_segments.py avec --exe.
"""
import collections
import hashlib
import json
import os
import re
import sys

from exe_paths import paths

MIN_INSTRUCTIONS = 5
WEAK_INSTRUCTIONS = 8
AUTO_PREFIX = 'Reprise de '

MANUAL_REJECT = {
    ('optest', 'sub_2769'): 'constantes inversées : conversion en minuscules, pas en majuscules',
    ('optest', 'sub_59F42'): 'lit un autre champ de la structure',
    ('optest', 'sub_5D01A'): 'ajoute 3 et non 10',
    ('optest', 'sub_5D029'): 'ajoute 3 et non 10',
    ('optest', 'sub_5D038'): 'ajoute 3 et non 10',
    ('optest', 'sub_C3F07'): "dépile 2 octets d'arguments et non 4",
}

PROC_RE = re.compile(r'^(\S+)\s+proc\s+(far|near)')
SEG_RE = re.compile(r'^((?:seg|stub|ovr)\d+)\s+segment\b')
CALL_RE = re.compile(r'^call\s+(?:near ptr\s+|far ptr\s+)?((?:sub|loc|nullsub)_[0-9A-Fa-f]+)$')
JMP_RE = re.compile(r'^jmp\s+(?:near ptr\s+|far ptr\s+)?((?:sub|loc)_[0-9A-Fa-f]+)$')
LABEL_TOKEN_RE = re.compile(
    r'\b(?:sub|loc|locret|nullsub|unk|word|byte|dword|off|stru|seg\d+|ovr\d+|stub\d+|dseg)_?[0-9A-Fa-f]*\b'
    r'|\ba[A-Z]\w*')


def parse_procs(path):
    """Renvoie {nom: {segment, order, body (instructions normalisées), mnem, calls, raw}}."""
    procs = {}
    seg = None
    cur = None
    for line in open(path, encoding='utf-8', errors='replace'):
        m = SEG_RE.match(line)
        if m:
            seg = m.group(1)
        m = PROC_RE.match(line)
        if m:
            cur = {'segment': seg, 'order': len(procs), 'body': [], 'mnem': [], 'calls': [], 'raw': []}
            procs[m.group(1)] = cur
            name = m.group(1)
            continue
        if cur is None:
            continue
        if re.match(r'^' + re.escape(name) + r'\s+endp', line):
            cur = None
            continue
        code = line.split(';')[0].strip()
        if not code or code.endswith(':'):
            continue
        parts = code.split(None, 1)
        mnem = parts[0]
        if mnem in ('assume', 'public', 'align'):
            continue
        operands = re.sub(r'\s+', ' ', parts[1]) if len(parts) > 1 else ''
        raw = (mnem + ' ' + operands).strip()
        cur['raw'].append(raw)
        cur['mnem'].append(mnem)
        cur['body'].append(mnem + ' ' + LABEL_TOKEN_RE.sub('L', operands).replace(' ', ''))
        mc = CALL_RE.match(raw)
        if mc:
            cur['calls'].append(mc.group(1))
    return procs


def thunk_targets(procs):
    """Fonction réduite à un seul `jmp cible` (stub VROOMM) -> cible."""
    out = {}
    for name, p in procs.items():
        if len(p['raw']) == 1:
            m = JMP_RE.match(p['raw'][0])
            if m:
                out[name] = m.group(1)
    return out


def resolve(target, thunks):
    seen = set()
    while target in thunks and target not in seen:
        seen.add(target)
        target = thunks[target]
    return target


def digest(items):
    return hashlib.md5('\n'.join(items).encode()).hexdigest()


def base_name(strike_key, new_name):
    suffix = '_' + strike_key.split('_', 1)[-1]
    if new_name.upper().endswith(suffix.upper()):
        return new_name[:-len(suffix)], True
    return new_name, False


def call_check(dst_proc, src_proc, accepted, dst_thunks, src_thunks):
    """(appels confirmés, contradictions) pour une paire candidate."""
    confirmed = 0
    conflicts = 0
    for a, b in zip(dst_proc['calls'], src_proc['calls']):
        a = resolve(a, dst_thunks)
        b = resolve(b, src_thunks)
        if a in accepted:
            if accepted[a] == b:
                confirmed += 1
            else:
                conflicts += 1
    if len(dst_proc['calls']) != len(src_proc['calls']):
        conflicts += 1
    return confirmed, conflicts


def neighbour_confirmed(name, chosen, accepted, dst_order, src_order, dst, src):
    i = dst[name]['order']
    j = src[chosen]['order']
    for step in (-1, 1):
        if 0 <= i + step < len(dst_order) and 0 <= j + step < len(src_order):
            if accepted.get(dst_order[i + step]) == src_order[j + step]:
                return True
    return False


def main():
    args = sys.argv[1:]
    src_exe = 'strike'
    dst_exe = 'optest'
    if '--from' in args:
        src_exe = args[args.index('--from') + 1]
    if '--to' in args:
        dst_exe = args[args.index('--to') + 1]
    write = '--write' in args

    src_paths = paths(src_exe)
    dst_paths = paths(dst_exe)
    src = parse_procs(src_paths['asm'])
    dst = parse_procs(dst_paths['asm'])
    src_thunks = thunk_targets(src)
    dst_thunks = thunk_targets(dst)
    src_known = json.load(open(src_paths['known_functions'], encoding='utf-8'))
    src_order = sorted(src, key=lambda n: src[n]['order'])
    dst_order = sorted(dst, key=lambda n: dst[n]['order'])

    by_body = collections.defaultdict(list)
    by_mnem = collections.defaultdict(list)
    for name, p in src.items():
        if len(p['body']) >= MIN_INSTRUCTIONS and name in src_known:
            by_body[digest(p['body'])].append(name)
            by_mnem[digest(p['mnem'])].append(name)

    candidates = {}
    for name, p in dst.items():
        if len(p['body']) < MIN_INSTRUCTIONS or (dst_exe, name) in MANUAL_REJECT:
            continue
        strict = by_body.get(digest(p['body']))
        if strict:
            candidates[name] = ('stricte', strict)
            continue
        loose = by_mnem.get(digest(p['mnem']))
        if loose:
            candidates[name] = ('approchée', loose)

    # Acceptation itérative : d'abord les correspondances strictes uniques,
    # puis tout ce que le contrôle des appels permet de trancher.
    accepted = {}
    for _ in range(20):
        changed = False
        for name, (kind, cands) in candidates.items():
            consistent = []
            for c in cands:
                confirmed, conflicts = call_check(dst[name], src[c], accepted, dst_thunks, src_thunks)
                if conflicts == 0:
                    consistent.append((c, confirmed))
            choice = None
            if len(consistent) == 1 and (len(cands) == 1 or consistent[0][1] > 0):
                choice = consistent[0][0]
            elif len(consistent) > 1:
                bases = set(base_name(c, src_known[c]['new_name'])[0] for c, _ in consistent)
                if len(bases) == 1:
                    choice = consistent[0][0]
            if choice is not None and len(dst[name]['body']) <= WEAK_INSTRUCTIONS:
                confirmed = dict(consistent)[choice]
                if confirmed == 0 and not neighbour_confirmed(name, choice, accepted, dst_order, src_order, dst, src):
                    choice = None
            if accepted.get(name) != choice:
                if choice is None:
                    accepted.pop(name, None)
                else:
                    accepted[name] = choice
                changed = True
        if not changed:
            break

    report = {}
    for (exe, name), reason in MANUAL_REJECT.items():
        if exe == dst_exe:
            report[name] = {'segment': dst[name]['segment'], 'kind': 'rejetée', 'reason': reason, 'chosen': None}
    for name, (kind, cands) in sorted(candidates.items()):
        chosen = accepted.get(name)
        entry = {
            'segment': dst[name]['segment'],
            'kind': kind,
            'instructions': len(dst[name]['body']),
            'candidates': {c: src_known[c]['new_name'] for c in cands},
            'chosen': chosen,
        }
        if chosen:
            confirmed, conflicts = call_check(dst[name], src[chosen], accepted, dst_thunks, src_thunks)
            entry['calls_confirmed'] = confirmed
            entry['operand_diffs'] = sum(1 for x, y in zip(dst[name]['raw'], src[chosen]['raw'])
                                         if LABEL_TOKEN_RE.sub('L', x) != LABEL_TOKEN_RE.sub('L', y))
        report[name] = entry

    os.makedirs(dst_paths['analysis'], exist_ok=True)
    out_report = os.path.join(dst_paths['analysis'], f'{src_exe}_matches.json')
    json.dump(report, open(out_report, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)

    counts = collections.Counter((e['kind'], e['chosen'] is not None) for e in report.values())
    print(f"{len(dst)} fonctions proc dans {dst_exe}, {len(report)} avec au moins un candidat dans {src_exe}.")
    for kind in ('stricte', 'approchée', 'rejetée'):
        print(f"  {kind:9s} : {counts[(kind, True)]} acceptées, {counts[(kind, False)]} non tranchées")
    print(f"Rapport : {out_report}")

    if not write:
        return

    known_path = dst_paths['known_functions']
    known = json.load(open(known_path, encoding='utf-8')) if os.path.exists(known_path) else {}
    used_names = collections.Counter()
    for name, chosen in accepted.items():
        used_names[base_name(chosen, src_known[chosen]['new_name'])] += 1
    written = 0
    kept = 0
    src_label = f'{src_exe.upper()}.EXE'
    for name, chosen in sorted(accepted.items()):
        if name in known and not known[name].get('summary', '').startswith(AUTO_PREFIX):
            kept += 1
            continue
        src_name = src_known[chosen]['new_name']
        base, had_suffix = base_name(chosen, src_name)
        address = name.split('_', 1)[-1] if name.startswith('sub_') else ''
        if (had_suffix or used_names[(base, had_suffix)] > 1) and address:
            new_name = f'{base}_{address}'
        else:
            new_name = base
        entry = report[name]
        if entry['kind'] == 'stricte':
            how = 'code identique instruction par instruction'
        else:
            how = (f"même suite d'instructions, {entry['operand_diffs']} opérande(s) différent(s) "
                   f"(adresses de données ou constantes) — à vérifier")
        summary = (f"{AUTO_PREFIX}{src_label} : {how} à `{src_name}` ({chosen} de {src_label}). "
                   f"Résumé repris de {src_label} ; appelants et contexte à revérifier ici. — "
                   f"{src_known[chosen].get('summary', '')}")
        known[name] = {'new_name': new_name, 'segment': dst[name]['segment'], 'summary': summary}
        written += 1
    json.dump(known, open(known_path, 'w', encoding='utf-8'), ensure_ascii=False, indent=2)
    print(f"{known_path} : {written} entrées reprises, {kept} entrées manuelles conservées.")


if __name__ == '__main__':
    main()
