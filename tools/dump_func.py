#!/usr/bin/env python3
"""
dump_func.py — affiche une plage de lignes de strike.asm, numérotées.

Usage :
    python3 dump_func.py <ligne_debut> <ligne_fin>
    python3 dump_func.py --exe optest <ligne_debut> <ligne_fin>   # optest.asm

Typiquement utilisé avec les numéros de ligne renvoyés par
extract_segment.py, ou directement avec start_line/end_line d'une entrée
de analysis/function_index.json.

Exemple :
    python3 tools/extract_segment.py seg114 | grep Expr_VM
    # -> sub_51106   205428   207305   1878
    python3 tools/dump_func.py 205428 205480
"""
import sys

from exe_paths import paths, pop_exe_arg

EXE, ARGS = pop_exe_arg(sys.argv[1:])
if len(ARGS) != 2:
    print(__doc__)
    sys.exit(1)

lines = open(paths(EXE)['asm'], encoding='utf-8', errors='replace').readlines()
s, e = int(ARGS[0]), int(ARGS[1])
for i in range(s - 1, min(e, len(lines))):
    print(f"{i + 1}\t{lines[i]}", end='')
