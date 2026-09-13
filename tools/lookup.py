#!/usr/bin/env python3
"""
lookup.py — consultation rapide de l'index de fonctions.

Trois modes d'usage :

1. Chercher une fonction par adresse ou par nom (recherche partielle,
   insensible à la casse) :
       python3 tools/lookup.py sub_51106
       python3 tools/lookup.py Expr_VM_Interpreter
       python3 tools/lookup.py --name "Expr_VM"          # substring dans new_name

2. Lister les fonctions d'un segment :
       python3 tools/lookup.py --segment ovr239

3. Afficher les N plus grosses fonctions encore marquées NON DÉTAILLÉE
   (candidates prioritaires pour une session d'approfondissement) :
       python3 tools/lookup.py --priority 20

Dans tous les cas, affiche : adresse, nom attribué, segment, plage de
lignes, taille, résumé, et la liste des appels sortants (avec leur nom
attribué si connu) — pratique pour comprendre le contexte d'une fonction
avant de la lire en détail avec dump_func.py.

Toutes les données viennent de analysis/function_index.json (généré par
build_function_index.py). Si strike.asm a été modifié depuis, relancer
build_function_index.py pour rafraîchir l'index.
"""
import json
import os
import sys


def find_index():
    for candidate in ('analysis/function_index.json',
                       '../analysis/function_index.json',
                       os.path.join(os.path.dirname(__file__), '..', 'analysis', 'function_index.json')):
        if os.path.exists(candidate):
            return candidate
    print("function_index.json introuvable (attendu dans analysis/).")
    sys.exit(1)


def load_index():
    with open(find_index(), encoding='utf-8') as f:
        return json.load(f)


def resolve_calls(calls, idx):
    out = []
    for c in calls:
        if c in idx:
            out.append(idx[c]['new_name'])
        else:
            out.append(c)
    return out


def print_entry(addr, info, idx):
    print(f"\n{'=' * 70}")
    print(f"Adresse IDA   : {addr}")
    print(f"Nom attribué  : {info['new_name']}")
    print(f"Segment       : {info['segment']}")
    print(f"Lignes        : {info['start_line']}-{info['end_line']}  "
          f"({info['lines']} lignes, type {info['type']})")
    print(f"Résumé        : {info['summary'] or '(aucun résumé)'}")
    calls = resolve_calls(info['calls'], idx)
    if calls:
        print(f"Appels ({len(calls)}) : {', '.join(calls[:15])}"
              + (' ...' if len(calls) > 15 else ''))
    print(f"\nPour lire le code :")
    print(f"  python3 tools/dump_func.py {info['start_line']} {info['end_line']}")


def main():
    idx = load_index()
    args = sys.argv[1:]

    if not args:
        print(__doc__)
        return

    if args[0] == '--priority':
        n = int(args[1]) if len(args) > 1 else 20
        undetailed = [
            (v['lines'], k, v) for k, v in idx.items()
            if 'NON DÉTAILLÉE' in v['summary'] or 'NON DETAILLEE' in v['summary']
        ]
        undetailed.sort(reverse=True)
        print(f"Top {n} fonctions NON DÉTAILLÉE par taille :\n")
        for lines, addr, info in undetailed[:n]:
            print(f"  {lines:5d}L  {addr:12s}  {info['new_name']:50s}  ({info['segment']})")
        return

    if args[0] == '--segment':
        if len(args) < 2:
            print("Usage: lookup.py --segment <nom>")
            return
        seg = args[1]
        matches = [(v['start_line'], k, v) for k, v in idx.items() if v['segment'] == seg]
        matches.sort()
        if not matches:
            print(f"Aucune fonction trouvée dans le segment '{seg}'.")
            return
        print(f"{len(matches)} fonctions dans {seg} :\n")
        for start, addr, info in matches:
            print(f"  {addr:12s}  {info['new_name']:50s}  {info['lines']:5d}L  "
                  f"(lignes {info['start_line']}-{info['end_line']})")
        return

    if args[0] == '--name':
        if len(args) < 2:
            print("Usage: lookup.py --name <sous-chaine>")
            return
        needle = args[1].lower()
        matches = [(k, v) for k, v in idx.items() if needle in v['new_name'].lower()]
        if not matches:
            print(f"Aucune fonction dont le nom contient '{args[1]}'.")
            return
        for addr, info in matches:
            print_entry(addr, info, idx)
        return

    # Recherche libre : adresse exacte, ou sous-chaîne de nom
    query = args[0]
    if query in idx:
        print_entry(query, idx[query], idx)
        return

    needle = query.lower()
    matches = [(k, v) for k, v in idx.items() if needle in v['new_name'].lower() or needle in k.lower()]
    if not matches:
        print(f"Aucune correspondance pour '{query}'.")
        return
    if len(matches) == 1:
        addr, info = matches[0]
        print_entry(addr, info, idx)
    else:
        print(f"{len(matches)} correspondances pour '{query}' :\n")
        for addr, info in matches[:30]:
            print(f"  {addr:12s}  {info['new_name']:50s}  ({info['segment']}, {info['lines']}L)")
        if len(matches) > 30:
            print(f"  ... et {len(matches) - 30} de plus. Affinez la recherche.")


if __name__ == '__main__':
    main()
