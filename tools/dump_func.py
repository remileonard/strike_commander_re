#!/usr/bin/env python3
"""
dump_func.py — affiche une plage de lignes de strike.asm, numérotées.

Usage :
    python3 dump_func.py <ligne_debut> <ligne_fin>

Typiquement utilisé avec les numéros de ligne renvoyés par
extract_segment.py, ou directement avec start_line/end_line d'une entrée
de analysis/function_index.json.

Exemple :
    python3 tools/extract_segment.py seg114 | grep Expr_VM
    # -> sub_51106   205428   207305   1878
    python3 tools/dump_func.py 205428 205480
"""
import sys
import os

if len(sys.argv) != 3:
    print(__doc__)
    sys.exit(1)


def find_strike_asm():
    for candidate in ('strike.asm', '../source/strike.asm',
                       os.path.join(os.path.dirname(__file__), '..', 'source', 'strike.asm')):
        if os.path.exists(candidate):
            return candidate
    print("strike.asm introuvable. Lancer depuis la racine de l'archive, "
          "depuis source/, ou ajuster find_strike_asm().")
    sys.exit(1)


lines = open(find_strike_asm(), encoding='utf-8', errors='replace').readlines()
s, e = int(sys.argv[1]), int(sys.argv[2])
for i in range(s - 1, min(e, len(lines))):
    print(f"{i + 1}\t{lines[i]}", end='')
