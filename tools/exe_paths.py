"""
exe_paths.py — chemins des fichiers d'analyse pour chaque exécutable de l'archive.

L'archive couvre deux exécutables du jeu :
  - strike : STRIKE.EXE, la simulation (source/strike.asm, analysis/)
  - optest : OPTEST.EXE, tout le hors-vol — campagne, conversations,
             cinématiques, briefings, options (source/optest.asm, analysis/optest/)

Chaque outil accepte `--exe <nom>` (défaut : strike). Les adresses IDA
(`sub_XXXXX`) sont propres à chaque exécutable : une même adresse ne désigne
pas la même fonction dans les deux.
"""
import os

ROOT = os.path.normpath(os.path.join(os.path.dirname(__file__), '..'))

EXES = {
    'strike': {
        'asm': os.path.join(ROOT, 'source', 'strike.asm'),
        'analysis': os.path.join(ROOT, 'analysis'),
    },
    'optest': {
        'asm': os.path.join(ROOT, 'source', 'optest.asm'),
        'analysis': os.path.join(ROOT, 'analysis', 'optest'),
    },
}


def paths(exe):
    if exe not in EXES:
        raise SystemExit(f"Exécutable inconnu '{exe}' (connus : {', '.join(EXES)}).")
    base = EXES[exe]
    analysis = base['analysis']
    return {
        'asm': base['asm'],
        'analysis': analysis,
        'known_functions': os.path.join(analysis, 'known_functions.json'),
        'function_index': os.path.join(analysis, 'function_index.json'),
        'segment_boundaries': os.path.join(analysis, 'segment_boundaries.json'),
        'annotated_segments': os.path.join(analysis, 'annotated_segments'),
    }


def pop_exe_arg(argv):
    """Retire `--exe <nom>` de la liste d'arguments ; renvoie (nom, arguments restants)."""
    args = list(argv)
    exe = 'strike'
    if '--exe' in args:
        i = args.index('--exe')
        if i + 1 >= len(args):
            raise SystemExit("--exe attend un nom d'exécutable (strike, optest).")
        exe = args[i + 1]
        del args[i:i + 2]
    return exe, args
