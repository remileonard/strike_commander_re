#!/usr/bin/env python3
"""
extract_segment.py — liste les fonctions d'un segment de strike.asm.

Gère les trois familles de segments rencontrées dans le fichier :
  - segNNN   : segments de code "normaux" (la majorité du fichier)
  - stubNNN  : tables de stubs VROOMM (thunks de saut fixe vers l'overlay)
  - ovrNNN   : segments de code d'overlay "purs" (entre seg339 et seg430,
               initialement ratés par l'extraction en masse des stubs —
               voir CLAUDE.md, section "Correction de couverture")

Deux styles de fonctions coexistent dans strike.asm :
  1. Fonctions explicites  : `sub_XXXXX proc far/near ... endp`
  2. Points d'entrée implicites : simples labels (`loc_XXXXX:` ou autre)
     référencés depuis un AUTRE segment (DATA XREF ou CODE XREF externe) —
     IDA ne les a pas entourés d'un vrai bloc proc/endp, mais ce sont bien
     des points d'entrée de fonction (souvent des méthodes de vtable).
     Ce script détecte aussi ces cas via is_external_entry().

Usage :
    python3 extract_segment.py <nom_segment>
    python3 extract_segment.py seg114
    python3 extract_segment.py ovr239
    python3 extract_segment.py stub227

Sortie : une ligne d'en-tête puis, par fonction repérée :
    <label>\t<ligne_debut>\t<ligne_fin>\t<nb_lignes>

Combine avec dump_func.py pour lire le corps d'une fonction précise :
    python3 dump_func.py <ligne_debut> <ligne_fin>
"""
import re
import sys


def load_asm(path=None):
    if path is None:
        import os
        for candidate in ('strike.asm', '../source/strike.asm',
                           os.path.join(os.path.dirname(__file__), '..', 'source', 'strike.asm')):
            if os.path.exists(candidate):
                path = candidate
                break
        else:
            raise FileNotFoundError(
                "strike.asm introuvable. Lancer depuis la racine de l'archive, "
                "depuis source/, ou passer le chemin explicitement.")
    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        return f.readlines()


def find_segments(lines):
    """Repère toutes les bornes de segments seg/stub/ovr.
    Tolère l'absence de 'ends' explicite (referme au segment suivant)."""
    segs = {}
    cur = None
    start = None
    for i, l in enumerate(lines):
        m = re.match(r'^((?:seg|stub|ovr)\d+)\s+segment\b', l)
        if m:
            if cur is not None:
                segs[cur] = (start, i - 1)
            cur = m.group(1)
            start = i
        m2 = re.match(r'^((?:seg|stub|ovr)\d+)\s+ends\b', l)
        if m2 and cur == m2.group(1):
            segs[cur] = (start, i)
            cur = None
    if cur is not None:
        segs[cur] = (start, len(lines) - 1)
    return segs


LABEL_RE = re.compile(r'^(\S+):\s*(?:;\s*(.*))?$')
PROC_RE = re.compile(r'^(\S+)\s+proc\s+(near|far)')
ENDP_RE = re.compile(r'^(\S+)\s+endp')


def is_external_entry(xref_comment, own_seg):
    """Un label sans bloc proc/endp est traité comme point d'entrée de
    fonction séparé s'il est référencé depuis un autre segment (DATA XREF,
    ou CODE XREF portant une lettre d'opérande majuscule = jmp/call direct
    plutôt qu'un simple saut interne)."""
    if xref_comment is None:
        return False
    if 'DATA XREF' in xref_comment:
        return True
    if 'CODE XREF' in xref_comment:
        for m in re.finditer(
            r'(seg\d+|stub\d+|ovr\d+|sub_[0-9A-Fa-f]+|loc_[0-9A-Fa-f]+):\S*?([a-zA-Z])(?=\s|$)',
            xref_comment,
        ):
            segref, letter = m.group(1), m.group(2)
            if re.match(r'^(seg|stub|ovr)\d+$', segref) and segref != own_seg:
                return True
            if letter.isupper():
                return True
    return False


def extract_functions(lines, lo, hi, seg_name):
    funcs = []
    cur_start = None
    cur_lines = []
    i = lo
    in_proc = False
    while i <= hi:
        l = lines[i]
        mproc = PROC_RE.match(l)
        mendp = ENDP_RE.match(l)
        mlabel = LABEL_RE.match(l)
        if mproc:
            if cur_lines:
                funcs.append((cur_start, i - 1, cur_lines))
            cur_start = i
            cur_lines = [(i, l)]
            in_proc = True
            i += 1
            continue
        if mendp and in_proc:
            cur_lines.append((i, l))
            funcs.append((cur_start, i, cur_lines))
            cur_lines = []
            cur_start = None
            in_proc = False
            i += 1
            continue
        if mlabel and not in_proc:
            label, comment = mlabel.group(1), mlabel.group(2)
            if is_external_entry(comment, seg_name):
                if cur_lines:
                    funcs.append((cur_start, i - 1, cur_lines))
                cur_start = i
                cur_lines = [(i, l)]
                i += 1
                continue
        if cur_start is None and not in_proc:
            cur_start = i
        cur_lines.append((i, l))
        i += 1
    if cur_lines:
        funcs.append((cur_start, hi, cur_lines))
    return funcs


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print(__doc__)
        sys.exit(1)
    asm = load_asm()
    segs = find_segments(asm)
    seg_name = sys.argv[1]
    if seg_name not in segs:
        print(f"Segment '{seg_name}' introuvable. Segments disponibles : "
              f"{len(segs)} au total (voir analysis/segment_boundaries.json).")
        sys.exit(1)
    lo, hi = segs[seg_name]
    funcs = extract_functions(asm, lo, hi, seg_name)
    print(f"# {seg_name}: lines {lo + 1}-{hi + 1}, {len(funcs)} functions")
    for s, e, body in funcs:
        first = body[0][1]
        m = LABEL_RE.match(first) or PROC_RE.match(first)
        label = m.group(1) if m else '?'
        print(f"{label}\t{s + 1}\t{e + 1}\t{e - s + 1}")
