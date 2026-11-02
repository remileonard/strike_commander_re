#!/usr/bin/env python3
"""
midgame_engine_port.py — porte le catalogue du moteur des cinématiques (midgame_engine.json) d'un
exécutable à un autre de la même famille, pour que tools/midgame_extract.py lise les cinématiques
du second. Écrit pour TOPTTST1.EXE (Tactical Operations), à partir d'OPTEST.EXE.

Principe : une cinématique reprise d'un exécutable à l'autre garde le même script, aux adresses
près. On aligne chaque paire de segments de cinématique (suites de mnémoniques, difflib) et, dans
les parties identiques :
  - chaque paire d'appels alignés est un vote « fonction source -> fonction cible » (relais VROOMM
    traversés des deux côtés) ;
  - chaque constante alignée qui est une table de méthodes du catalogue source est un vote
    « table source -> table cible ».
Une fonction du catalogue est portée :
  1. par le nom déjà repris par match_functions.py (même nom de base dans known_functions.json
     de la cible), sinon
  2. par le vote majoritaire, s'il réunit au moins MIN_SHARE des votes.
Les fonctions portées par vote reçoivent une entrée dans known_functions.json de la cible
(résumé « Reprise de … par position d'appel »), remplacée à chaque nouvelle exécution.

Les paires de segments sont trouvées seules : pour chaque segment de cinématique de la source
(ceux des fonctions du catalogue args_of et des cinématiques extraites), le segment overlay de la
cible le plus ressemblant.

Usage : python3 tools/midgame_engine_port.py --from optest --to topt
Sorties : analysis/<cible>/midgame_engine.json, analysis/<cible>/midgame_port.json (votes et
paires de segments), entrées ajoutées à analysis/<cible>/known_functions.json.
"""
import collections
import difflib
import json
import os
import re
import sys

from exe_paths import paths
from match_functions import AUTO_PREFIX, parse_procs, resolve, thunk_targets

MIN_SHARE = 0.7
SEG_RE = re.compile(r'^((?:seg|stub|ovr)\d+)\s+segment\b')
CALL_TARGET_RE = re.compile(r'^(?:near ptr |far ptr )?((?:sub|loc)_[0-9A-Fa-f]+)$')
GLOB_RE = re.compile(r'\b((?:byte|word|dword)_[0-9A-F]+)\b')
IMM_RE = re.compile(r'(?:^|, )(?:offset )?(-?[0-9][0-9A-Fa-f]*h?)$')


def segment_instructions(path):
    """{segment: [(mnémonique, opérandes)]} pour chaque ligne d'instruction."""
    out = collections.defaultdict(list)
    seg = None
    for line in open(path, encoding='cp437', errors='replace'):
        line = line.rstrip('\r\n')
        m = SEG_RE.match(line)
        if m:
            seg = m.group(1)
            continue
        if not line.startswith('\t'):
            continue
        code = line.split(';')[0].strip()
        if not code:
            continue
        parts = code.split(None, 1)
        if parts[0] in ('assume', 'public', 'align', 'db', 'dw', 'dd'):
            continue
        operands = re.sub(r'\s+', ' ', parts[1]) if len(parts) > 1 else ''
        out[seg].append((parts[0], operands))
    return out


def number(text):
    text = text.strip()
    if text.lower().endswith('h'):
        return int(text[:-1], 16)
    return int(text)


def base_name(name):
    return re.sub(r'_[0-9A-F]{3,6}$', '', name)


def main():
    args = sys.argv[1:]
    src_exe = args[args.index('--from') + 1] if '--from' in args else 'optest'
    dst_exe = args[args.index('--to') + 1] if '--to' in args else 'topt'
    sp = paths(src_exe)
    dp = paths(dst_exe)
    engine = json.load(open(os.path.join(sp['analysis'], 'midgame_engine.json'), encoding='utf-8'))
    src_known = json.load(open(sp['known_functions'], encoding='utf-8'))
    dst_known = json.load(open(dp['known_functions'], encoding='utf-8'))
    src_index = json.load(open(sp['function_index'], encoding='utf-8'))
    src_rev = {v['new_name']: k for k, v in src_known.items()}

    src_seg = segment_instructions(sp['asm'])
    dst_seg = segment_instructions(dp['asm'])
    src_procs = parse_procs(sp['asm'])
    dst_procs = parse_procs(dp['asm'])
    src_thunks = thunk_targets(src_procs)
    dst_thunks = thunk_targets(dst_procs)

    # Segments de cinématique de la source : ceux des cinématiques déjà extraites.
    midgame_dir = os.path.join(sp['analysis'], 'midgames')
    src_segments = []
    for f in sorted(os.listdir(midgame_dir)):
        if not f.endswith('.json'):
            continue
        data = json.load(open(os.path.join(midgame_dir, f), encoding='utf-8'))
        function = data.get('function') or data.get('fonction')
        if function:
            key = src_rev.get(function, function)
            seg = src_index.get(key, {}).get('segment')
            if seg and seg not in src_segments:
                src_segments.append(seg)
    for name in engine.get('args_of', {}):
        key = src_rev.get(name, name)
        seg = src_index.get(key, {}).get('segment')
        if seg and seg not in src_segments:
            src_segments.append(seg)

    # Paires de segments : le segment overlay de la cible le plus ressemblant.
    dst_ovr = [s for s in dst_seg if s and s.startswith('ovr')]
    pairs = {}
    for s in src_segments:
        a = [m for m, _ in src_seg[s]]
        quick = []
        for t in dst_ovr:
            b = [m for m, _ in dst_seg[t]]
            if abs(len(a) - len(b)) > 0.3 * len(a):
                continue
            quick.append((difflib.SequenceMatcher(None, a, b, autojunk=False).quick_ratio(), t))
        # Les trois meilleures estimations, départagées par la vraie ressemblance.
        best = None
        for _, t in sorted(quick, reverse=True)[:3]:
            exact = difflib.SequenceMatcher(None, a, [m for m, _ in dst_seg[t]], autojunk=False).ratio()
            if best is None or exact > best[0]:
                best = (exact, t)
        if best and best[0] >= 0.8:
            pairs[s] = (best[1], round(best[0], 3))

    vt_values = {int(k) for k in engine['vtables']} | set(engine.get('secondary_vtables', []))
    call_votes = collections.defaultdict(collections.Counter)
    vt_votes = collections.defaultdict(collections.Counter)
    glob_votes = collections.defaultdict(collections.Counter)
    for s, (t, _) in pairs.items():
        a = src_seg[s]
        b = dst_seg[t]
        sm = difflib.SequenceMatcher(None, [m for m, _ in a], [m for m, _ in b], autojunk=False)
        for tag, i1, i2, j1, j2 in sm.get_opcodes():
            if tag != 'equal':
                continue
            for (ma, oa), (mb, ob) in zip(a[i1:i2], b[j1:j2]):
                if ma == 'call':
                    ca = CALL_TARGET_RE.match(oa)
                    cb = CALL_TARGET_RE.match(ob)
                    if ca and cb:
                        call_votes[resolve(ca.group(1), src_thunks)][resolve(cb.group(1), dst_thunks)] += 1
                    continue
                ga = GLOB_RE.findall(oa)
                gb = GLOB_RE.findall(ob)
                if len(ga) == len(gb):
                    for x, y in zip(ga, gb):
                        glob_votes[x][y] += 1
                ia = IMM_RE.search(oa)
                ib = IMM_RE.search(ob)
                if ia and ib and ma == mb:
                    try:
                        va = number(ia.group(1))
                        vb = number(ib.group(1))
                    except ValueError:
                        continue
                    if va in vt_values:
                        vt_votes[va][vb] += 1

    # Nom de base -> adresse déjà reprise dans la cible.
    dst_by_base = collections.defaultdict(list)
    for k, v in dst_known.items():
        dst_by_base[base_name(v['new_name'])].append(k)

    def port_function(name):
        """(adresse cible, méthode) ou (None, raison)."""
        key = resolve(src_rev.get(name, name), src_thunks)
        known_name = src_known.get(key, {}).get('new_name')
        if known_name and not known_name.startswith('sub_'):
            cands = dst_by_base.get(base_name(known_name), [])
            if len(cands) == 1:
                return cands[0], 'nom repris'
        votes = call_votes.get(key)
        if votes:
            best, count = votes.most_common(1)[0]
            total = sum(votes.values())
            if count / total >= MIN_SHARE:
                return best, 'position d\'appel (%d sur %d)' % (count, total)
            return None, 'votes partagés %s' % dict(votes)
        return None, 'aucun appel aligné'

    names = set(engine['functions']) | set(engine.get('args_of', {}))
    for table in engine.get('method_functions', {}).values():
        names |= set(table.values())
    ported = {}
    report = {'pairs': pairs, 'functions': {}, 'vtables': {}}
    added = 0
    for name in sorted(names):
        target, how = port_function(name)
        report['functions'][name] = {'cible': target, 'méthode': how}
        if target is None:
            continue
        if target in dst_known and not dst_known[target]['summary'].startswith(AUTO_PREFIX + src_exe.upper()
                                                                                + '.EXE par position'):
            ported[name] = dst_known[target]['new_name']
            continue
        if how.startswith('position'):
            key = resolve(src_rev.get(name, name), src_thunks)
            src_name = src_known.get(key, {}).get('new_name', key)
            base = base_name(src_name) if not src_name.startswith('sub_') else 'MidgameEngine_' + key[4:]
            new_name = '%s_%s' % (base, target.split('_', 1)[1])
            seg = next((p['segment'] for n, p in dst_procs.items() if n == target), '')
            dst_known[target] = {
                'new_name': new_name,
                'segment': seg,
                'summary': '%s%s.EXE par position d\'appel dans les cinématiques : %s, à `%s` (%s de %s.EXE). Code '
                           'non comparé instruction par instruction. — %s' % (
                               AUTO_PREFIX, src_exe.upper(), how, src_name, key, src_exe.upper(),
                               src_known.get(key, {}).get('summary', '')),
            }
            added += 1
        ported[name] = dst_known[target]['new_name']

    # Tables de méthodes écrites par les fonctions portées (constructeurs) : mêmes votes, fonction par fonction.
    for name, dst_name in ported.items():
        key = resolve(src_rev.get(name, name), src_thunks)
        target = next((k for k, v in dst_known.items() if v['new_name'] == dst_name), None)
        if key not in src_procs or target not in dst_procs:
            continue
        a = src_procs[key]['raw']
        b = dst_procs[target]['raw']
        sm = difflib.SequenceMatcher(None, [x.split(' ')[0] for x in a], [x.split(' ')[0] for x in b], autojunk=False)
        for tag, i1, i2, j1, j2 in sm.get_opcodes():
            if tag != 'equal':
                continue
            for x, y in zip(a[i1:i2], b[j1:j2]):
                ia = IMM_RE.search(x)
                ib = IMM_RE.search(y)
                if ia and ib:
                    try:
                        va = number(ia.group(1))
                        vb = number(ib.group(1))
                    except ValueError:
                        continue
                    if va in vt_values:
                        vt_votes[va][vb] += 1

    # Nom de relais VROOMM dans la source (Stub_…) : il désigne le relais de la cible qui saute à la fonction
    # portée, pas la fonction elle-même (le script appelle le relais).
    for name in sorted(names):
        key = src_rev.get(name, name)
        if key not in src_thunks or name not in ported:
            continue
        real = next((k for k, v in dst_known.items() if v['new_name'] == ported[name]), None)
        stubs = [k for k, t in dst_thunks.items() if t == real]
        if len(stubs) != 1:
            continue
        stub = stubs[0]
        if stub not in dst_known or dst_known[stub]['summary'].startswith(AUTO_PREFIX):
            dst_known[stub] = {
                'new_name': '%s_%s' % (base_name(name), stub.split('_', 1)[1]),
                'segment': dst_procs[stub]['segment'],
                'summary': '%s%s.EXE : relais VROOMM de `%s`, comme `%s` de %s.EXE.' % (
                    AUTO_PREFIX, src_exe.upper(), ported[name], name, src_exe.upper()),
            }
        ported[name] = dst_known[stub]['new_name']
        report['functions'][name]['cible'] = stub

    def port_vtable(value):
        votes = vt_votes.get(value)
        if not votes:
            return None
        best, count = votes.most_common(1)[0]
        if count / sum(votes.values()) >= MIN_SHARE:
            return best
        return None

    out = json.loads(json.dumps(engine))
    out['_doc'] = engine['_doc'] + (' Porté de %s par tools/midgame_engine_port.py (noms et tables de méthodes de '
                                    '%s ; champs et méthodes repris tels quels).' % (src_exe, dst_exe))
    dst_lines = open(dp['asm'], encoding='cp437', errors='replace').read()
    m = re.search(r'^dseg\s+segment', dst_lines, re.M)
    first = re.search(r'^\w+_([0-9A-F]+)\s+db', dst_lines[m.end():], re.M)
    out['dseg_base'] = int(first.group(1), 16)
    out['functions'] = {ported[n]: spec for n, spec in engine['functions'].items() if n in ported}
    # Copies identiques d'une même fonction source dans la cible (match_functions.py) : même description.
    matches_path = os.path.join(dp['analysis'], '%s_matches.json' % src_exe)
    copies = collections.defaultdict(list)
    if os.path.exists(matches_path):
        for dst_name, entry in json.load(open(matches_path, encoding='utf-8')).items():
            if entry.get('chosen') and dst_name in dst_known:
                copies[entry['chosen']].append(dst_known[dst_name]['new_name'])
    for n, spec in engine['functions'].items():
        key = resolve(src_rev.get(n, n), src_thunks)
        for copy in copies.get(key, []):
            if copy not in out['functions']:
                out['functions'][copy] = spec
    for spec in out['functions'].values():
        for k, v in list(spec.items()):
            if isinstance(v, str) and v in ported:
                spec[k] = ported[v]
    out['args_of'] = {ported[n]: v for n, v in engine.get('args_of', {}).items() if n in ported}
    out['method_functions'] = {kind: {slot: ported[n] for slot, n in table.items() if n in ported}
                               for kind, table in engine.get('method_functions', {}).items()}
    vtables = {}
    for k, cls in engine['vtables'].items():
        v = port_vtable(int(k))
        report['vtables'][k] = v
        if v is not None:
            vtables[str(v)] = cls
    out['vtables'] = vtables
    out['secondary_vtables'] = sorted(v for v in (port_vtable(x) for x in engine.get('secondary_vtables', []))
                                      if v is not None)
    for x in engine.get('secondary_vtables', []):
        report['vtables'][str(x)] = port_vtable(x)

    # Équivalents des variables globales et des fonctions sans nom citées par les outils (hypothèses de
    # midgame_iff.py) : vote majoritaire aux mêmes positions.
    equivalents = {}
    for votes in (glob_votes, call_votes):
        for src_name, v in sorted(votes.items()):
            best, count = v.most_common(1)[0]
            if count / sum(v.values()) >= MIN_SHARE:
                equivalents[src_name] = dst_known.get(best, {}).get('new_name', best)
    for name, target in ported.items():
        equivalents.setdefault(name, target)
    # Paires acceptées par match_functions.py : nom de la source -> nom de la cible.
    if os.path.exists(matches_path):
        for dst_name, entry in json.load(open(matches_path, encoding='utf-8')).items():
            chosen = entry.get('chosen')
            if chosen and chosen in src_known and dst_name in dst_known:
                equivalents.setdefault(src_known[chosen]['new_name'], dst_known[dst_name]['new_name'])
    out['equivalents'] = equivalents
    json.dump(out, open(os.path.join(dp['analysis'], 'midgame_engine.json'), 'w', encoding='utf-8'),
              ensure_ascii=False, indent=1)
    json.dump(report, open(os.path.join(dp['analysis'], 'midgame_port.json'), 'w', encoding='utf-8'),
              ensure_ascii=False, indent=1)
    json.dump(dst_known, open(dp['known_functions'], 'w', encoding='utf-8'), ensure_ascii=False, indent=2)
    missing = [n for n in sorted(names) if n not in ported]
    print('%d paires de segments ; %d fonctions du catalogue sur %d portées (%d noms ajoutés) ; '
          '%d tables de méthodes sur %d' % (len(pairs), len(ported), len(names), added, len(vtables),
                                           len(engine['vtables'])))
    for n in missing:
        print('  non portée : %s (%s)' % (n, report['functions'][n]['méthode']))


if __name__ == '__main__':
    main()
