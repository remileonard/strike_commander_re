#!/usr/bin/env python3
"""
annotate_segments.py — génère des fichiers .asm annotés pour TOUS les
segments de strike.asm (seg/stub/ovr), en insérant au-dessus de chaque
fonction repérée un bloc de commentaire avec son nom attribué et son
résumé, tirés de analysis/known_functions.json.

Objectif : permettre de lire un segment directement dans un éditeur de
texte, avec le contexte de known_functions.json visible en ligne plutôt
que de devoir croiser deux fichiers séparés.

Remplace entièrement analysis/legacy_annotated_segments/ (qui ne couvrait
que seg000-seg108 et datait d'avant cette archive) par
analysis/annotated_segments/, qui couvre les 461 segments avec les noms
et résumés à jour.

Usage (depuis la racine de l'archive) :
    python3 tools/annotate_segments.py

Sortie : un fichier par segment dans analysis/annotated_segments/,
nommé <segment>_annotated.asm (ex. ovr239_annotated.asm).
"""
import re
import json
import os
import textwrap

ROOT = os.path.join(os.path.dirname(__file__), '..')
STRIKE_ASM = os.path.join(ROOT, 'source', 'strike.asm')
KNOWN_FUNCTIONS = os.path.join(ROOT, 'analysis', 'known_functions.json')
OUT_DIR = os.path.join(ROOT, 'analysis', 'annotated_segments')

LABEL_RE = re.compile(r'^(\S+):\s*(?:;\s*(.*))?$')
PROC_RE = re.compile(r'^(\S+)\s+proc\s+(near|far)')
ENDP_RE = re.compile(r'^(\S+)\s+endp')
SEG_RE = re.compile(r'^((?:seg|stub|ovr)\d+)\s+segment\b')
SEG_ENDS_RE = re.compile(r'^((?:seg|stub|ovr)\d+)\s+ends\b')


def find_segments(lines):
    segs = {}
    cur, start = None, None
    for i, l in enumerate(lines):
        m = SEG_RE.match(l)
        if m:
            if cur is not None:
                segs[cur] = (start, i - 1)
            cur, start = m.group(1), i
        m2 = SEG_ENDS_RE.match(l)
        if m2 and cur == m2.group(1):
            segs[cur] = (start, i)
            cur = None
    if cur is not None:
        segs[cur] = (start, len(lines) - 1)
    return segs


def is_external_entry(xref_comment, own_seg):
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


def extract_functions(lines, lo, hi, seg_name, force_labels=None):
    """Retourne une liste de (start_idx, label) pour toutes les fonctions
    repérées dans le segment (proc explicites + labels externes).

    force_labels : ensemble optionnel de labels à toujours traiter comme
    point de départ de fonction, même si l'heuristique is_external_entry
    ne les détecte pas automatiquement (cas où un label a été identifié
    comme fonction distincte par lecture manuelle du code plutôt que par
    le seul motif de commentaire XREF — ex. entrée de table de sauts sans
    commentaire, ou XREF en minuscule malgré un rôle de point d'entrée
    réel). Voir FORCE_INCLUDE_LABELS ci-dessous pour la liste actuelle."""
    force_labels = force_labels or set()
    funcs = []
    i = lo
    in_proc = False
    proc_start = None
    while i <= hi:
        l = lines[i]
        mproc = PROC_RE.match(l)
        mendp = ENDP_RE.match(l)
        mlabel = LABEL_RE.match(l)
        if mproc:
            funcs.append((i, mproc.group(1)))
            in_proc = True
            proc_start = mproc.group(1)
            i += 1
            continue
        if mendp and in_proc and mendp.group(1) == proc_start:
            in_proc = False
            i += 1
            continue
        if mlabel and not in_proc:
            label, comment = mlabel.group(1), mlabel.group(2)
            if label in force_labels or is_external_entry(comment, seg_name):
                funcs.append((i, label))
        i += 1
    return funcs


# Labels connus pour être de vraies fonctions documentées dans
# known_functions.json, mais que l'heuristique is_external_entry ne
# détecte pas automatiquement (commentaire XREF absent ou en minuscule).
# Découvert par comparaison directe entre known_functions.json et le
# résultat de extract_functions() — si known_functions.json grossit et
# que build_function_index.py ou ce script signale de nouveaux manques
# non préfixés par "unnamed_", ajouter les adresses concernées ici.
FORCE_INCLUDE_LABELS = {
    'loc_66AA4', 'loc_5C3C9', 'loc_66D91', 'loc_5C1C9',
    'loc_5C27E', 'loc_6672D', 'loc_65B66', 'loc_5CDD0',
    'loc_1642C',
}


def clean_markdown(text):
    """Retire la syntaxe markdown (gras, backticks) pour un rendu propre
    en commentaire de code source brut."""
    text = text.replace('**', '')
    text = text.replace('`', '')
    return text


def make_annotation_block(new_name, summary, width=96):
    """Construit un bloc de commentaire ASM à insérer au-dessus d'une
    fonction. Le nom n'est plus répété ici (il apparaît désormais
    directement sur la ligne proc/label elle-même, renommée) — seul le
    résumé est utile en complément."""
    if not summary:
        return ''
    lines = ['; ' + '=' * (width - 2)]
    cleaned = clean_markdown(summary)
    wrapped = textwrap.wrap(cleaned, width=width - 4) or ['']
    for w in wrapped:
        lines.append(f'; {w}')
    lines.append('; ' + '=' * (width - 2))
    return '\n'.join(lines) + '\n'


def build_substitution_pattern(known):
    """Construit le dictionnaire et le motif regex pour remplacer chaque
    label documenté (sub_XXXXX, loc_XXXXX...) par son nom attribué,
    partout où il apparaît dans le texte (déclaration, appels, sauts,
    références de données, commentaires XREF). Les clés synthétiques
    'unnamed_*' (blocs anonymes sans adresse IDA réelle) sont exclues :
    elles ne correspondent à aucun token du fichier source."""
    subst = {k: v['new_name'] for k, v in known.items() if not k.startswith('unnamed_')}
    if not subst:
        return subst, None
    pattern = re.compile(r'\b(' + '|'.join(re.escape(k) for k in subst) + r')\b')
    return subst, pattern


def rename_symbols(text, subst, pattern):
    if pattern is None:
        return text
    return pattern.sub(lambda m: subst[m.group(1)], text)


def main():
    lines = open(STRIKE_ASM, encoding='utf-8', errors='replace').readlines()
    known = json.load(open(KNOWN_FUNCTIONS, encoding='utf-8'))
    segs = find_segments(lines)
    subst, pattern = build_substitution_pattern(known)

    os.makedirs(OUT_DIR, exist_ok=True)
    # Nettoie les anciens fichiers annotés avant de régénérer
    for f in os.listdir(OUT_DIR):
        if f.endswith('_annotated.asm'):
            os.remove(os.path.join(OUT_DIR, f))

    total_annotated = 0
    total_segments = 0
    for seg_name, (lo, hi) in sorted(segs.items(), key=lambda kv: kv[1][0]):
        funcs = extract_functions(lines, lo, hi, seg_name, FORCE_INCLUDE_LABELS)
        # index start_idx -> label pour insertion rapide
        insert_at = {}
        for idx, label in funcs:
            if label in known:
                info = known[label]
                insert_at[idx] = make_annotation_block(
                    info.get('new_name', label), info.get('summary', ''))
                total_annotated += 1

        # Texte brut du segment, avec les labels documentés renommés
        # partout (déclaration, appels, sauts, XREF en commentaire...)
        segment_text = ''.join(lines[lo:hi + 1])
        segment_text = rename_symbols(segment_text, subst, pattern)
        renamed_lines = segment_text.splitlines(keepends=True)
        # Sécurité : le renommage ne doit jamais changer le nombre de
        # lignes (substitution de tokens, pas de texte multi-ligne) —
        # sinon les indices d'insertion calculés sur 'lines' d'origine
        # ne correspondraient plus.
        assert len(renamed_lines) == (hi - lo + 1), (
            f"Décalage de lignes détecté dans {seg_name} après renommage "
            f"({len(renamed_lines)} vs {hi - lo + 1} attendues) — ne pas "
            f"utiliser cette sortie tant que ce n'est pas corrigé.")

        out_path = os.path.join(OUT_DIR, f'{seg_name}_annotated.asm')
        with open(out_path, 'w', encoding='utf-8') as out:
            for offset, line in enumerate(renamed_lines):
                i = lo + offset
                if i in insert_at:
                    out.write(insert_at[i])
                out.write(line)
        total_segments += 1

    print(f"{total_segments} segments annotés, {total_annotated} blocs de "
          f"fonction annotés, écrits dans {OUT_DIR}")

    real_known = {k for k in known if not k.startswith('unnamed_')}
    unresolved = len(known) - len(real_known)
    gap = len(real_known) - total_annotated
    if gap > 0:
        print(f"⚠️  {gap} entrées de known_functions.json non annotées automatiquement "
              f"— si non nulles, ajouter les adresses concernées à FORCE_INCLUDE_LABELS.")
    if unresolved:
        print(f"({unresolved} entrées supplémentaires sont des blocs anonymes "
              f"'unnamed_*' sans adresse IDA résolue — non annotables par nature, "
              f"voir leur résumé dans known_functions.json pour leur position approximative.)")


if __name__ == '__main__':
    main()
