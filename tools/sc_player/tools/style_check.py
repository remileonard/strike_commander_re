#!/usr/bin/env python3
"""Regles de style C++ de sc_player (voir .clang-format) que clang-format n'applique pas :
  1. une seule declaration de variable par instruction : 'int a, b;' -> 'int a;' + 'int b;'
  2. une liste d'initialisation de plus d'une valeur : une valeur par ligne.
Usage :
  python3 tools/style_check.py --fix FICHIERS...   corrige (a faire suivre de clang-format)
  python3 tools/style_check.py FICHIERS...         verifie seulement ; code 1 si ecart
La verification signale aussi les if/for/while sans accolades et les lignes a plusieurs
instructions, au cas ou clang-format n'aurait pas ete passe.
"""
import re
import sys

KEYWORDS = {'return', 'case', 'else', 'do', 'delete', 'throw', 'using', 'typedef', 'goto', 'new',
            'sizeof', 'template', 'for', 'if', 'while', 'switch', 'co_return', 'default', 'public',
            'private', 'protected', 'operator', 'friend', 'enum', 'struct', 'class', 'union'}
OPEN = {'(': ')', '[': ']', '{': '}'}
CLOSE = {')', ']', '}'}


def code_mask(text):
    """Renvoie une copie ou commentaires, chaines et caracteres sont remplaces par des espaces
    (meme longueur), pour analyser la structure sans se tromper."""
    out = list(text)
    i, n = 0, len(text)
    while i < n:
        c = text[i]
        if text.startswith('//', i):
            j = text.find('\n', i)
            j = n if j < 0 else j
            for k in range(i, j):
                out[k] = ' '
            i = j
        elif text.startswith('/*', i):
            j = text.find('*/', i + 2)
            j = n if j < 0 else j + 2
            for k in range(i, j):
                if text[k] != '\n':
                    out[k] = ' '
            i = j
        elif c in '"\'':
            j = i + 1
            while j < n and text[j] != c:
                j += 2 if text[j] == '\\' else 1
            for k in range(i + 1, min(j, n)):
                out[k] = ' '
            i = j + 1
        elif c == '#':
            # directive du preprocesseur : laissee telle quelle
            j = text.find('\n', i)
            j = n if j < 0 else j
            for k in range(i, j):
                out[k] = ' '
            i = j
        else:
            i += 1
    return ''.join(out)


def top_level_commas(masked, start, end):
    """Positions des virgules de profondeur 0 entre start et end (exclus)."""
    depth = 0
    angle = 0
    res = []
    for i in range(start, end):
        c = masked[i]
        if c in OPEN:
            depth += 1
        elif c in CLOSE:
            depth -= 1
        elif c == '<' and depth == 0 and re.match(r'[\w:]', masked[i - 1:i] or ' '):
            angle += 1          # parametre de template : std::map<a, b>
        elif c == '>' and angle > 0 and depth == 0:
            angle -= 1
        elif c == ',' and depth == 0 and angle == 0:
            res.append(i)
    return res


def matching(masked, i):
    """Indice de l'accolade/parenthese fermante correspondant a masked[i]."""
    depth = 0
    for j in range(i, len(masked)):
        if masked[j] in OPEN:
            depth += 1
        elif masked[j] in CLOSE:
            depth -= 1
            if depth == 0:
                return j
    return -1


def is_init_brace(masked, i):
    """L'accolade en i ouvre-t-elle une liste d'initialisation (et pas un bloc de code) ?"""
    k = i - 1
    while k >= 0 and masked[k] in ' \t\n':
        k -= 1
    if k < 0:
        return False
    prev = masked[k]
    if prev in '=,(:[]{':
        if prev == ':':
            # 'case X:' ou 'public:' ou liste d'initialisation de constructeur : pas une liste
            line = masked[masked.rfind('\n', 0, k) + 1:k + 1]
            return bool(re.search(r'\bfor\s*\(.*:$', line))
        if prev == '{':
            return is_init_brace(masked, k)
        if prev == ']':
            return True
        return True
    if re.match(r'\w', prev):
        # 'type nom{...}' (initialisation) ; 'return {...}'
        j = k
        while j >= 0 and re.match(r'\w', masked[j]):
            j -= 1
        word = masked[j + 1:k + 1]
        if word in ('return',):
            return True
        if word in ('else', 'do', 'try', 'namespace', 'struct', 'class', 'enum', 'union', 'const',
                    'override', 'noexcept', 'mutable'):
            return False
        # nom de type d'un struct/enum/classe : 'struct X {' ou 'enum X : T {'
        line = masked[masked.rfind('\n', 0, k) + 1:k + 1]
        if re.search(r'\b(struct|class|enum|union|namespace)\b', line):
            return False
        return True
    return False


def expand_lists(text):
    """Met une valeur par ligne dans chaque liste d'initialisation de plus d'une valeur."""
    changed = True
    while changed:
        changed = False
        masked = code_mask(text)
        for i, c in enumerate(masked):
            if c != '{' or not is_init_brace(masked, i):
                continue
            j = matching(masked, i)
            if j < 0:
                continue
            commas = top_level_commas(masked, i + 1, j)
            inner = masked[i + 1:j]
            if not commas:
                continue
            # elements
            bounds = [i + 1] + [p + 1 for p in commas] + [j]
            elems = []
            for a, b in zip(bounds[:-1], bounds[1:]):
                e = text[a:b - 1] if b != j else text[a:b]
                elems.append(e.strip())
            if elems and elems[-1] == '':
                elems = elems[:-1]          # virgule finale
            # deja une valeur par ligne ?
            ok = '\n' in text[i:j]
            if ok:
                for p in commas:
                    rest = text[p + 1:text.find('\n', p) if text.find('\n', p) >= 0 else len(text)]
                    if code_mask(rest).strip():
                        ok = False
                        break
                # (la premiere valeur peut suivre l'accolade ouvrante, comme le fait clang-format)
            if ok:
                continue
            indent = re.match(r'[ \t]*', text[text.rfind('\n', 0, i) + 1:]).group(0)
            sub = indent + '    '
            new = '{\n' + ',\n'.join(sub + e for e in elems) + '\n' + indent + '}'
            text = text[:i] + new + text[j + 1:]
            changed = True
            break
    return text


DECL_RE = re.compile(r'^(\s*)(.*?);(\s*(//.*|/\*.*\*/)?)$')


def split_declarations(text):
    """'T a = 1, *b;' -> 'T a = 1;' + 'T *b;' (une ligne = une instruction, apres clang-format)."""
    out = []
    prev_end = ';'                              # fin de la ligne de code precedente
    for line, mline in zip(text.split('\n'), code_mask(text).split('\n')):
        m = DECL_RE.match(line)
        continuation = prev_end not in ';{}:'
        if mline.strip():
            prev_end = mline.rstrip()[-1]
        if not m or continuation or line.lstrip().startswith(('#', '//', '/*', '*')):
            out.append(line)
            continue
        if any(mline.count(o) != mline.count(c) for o, c in OPEN.items()):
            out.append(line)                    # instruction sur plusieurs lignes
            continue
        indent, stmt, trail = m.group(1), m.group(2), m.group(3) or ''
        mstmt = code_mask(stmt)
        if mstmt.count(';'):
            out.append(line)
            continue
        commas = top_level_commas(mstmt, 0, len(mstmt))
        if not commas:
            out.append(line)
            continue
        # le type : tout ce qui precede le premier declarateur
        first = stmt[:commas[0]]
        stop = re.search(r'[=\[({]', code_mask(first))
        head = first[:stop.start()] if stop else first
        hm = re.match(r'^(.*?)([*&\s]*)([A-Za-z_]\w*)\s*$', head)
        if not hm:
            out.append(line)
            continue
        type_part = hm.group(1).strip()
        if not type_part or type_part.split()[0] in KEYWORDS or re.search(r'[=()\[\]{}+\-/%!?|^]', type_part):
            out.append(line)
            continue
        if not re.match(r'^[\w:<>,\s*&]+$', type_part):
            out.append(line)
            continue
        if '(' in code_mask(stmt[:commas[0]]) and not stop:
            out.append(line)
            continue
        decls = [stmt[len(type_part):commas[0]].strip()]
        bounds = commas + [len(stmt)]
        for a, b in zip(bounds[:-1], bounds[1:]):
            decls.append(stmt[a + 1:b].strip())
        if any(not re.match(r'^[*&\s]*[A-Za-z_]\w*', d) for d in decls):
            out.append(line)
            continue
        for k, d in enumerate(decls):
            sep = '' if d.startswith(('*', '&')) else ' '
            out.append(indent + type_part + sep + d + ';' + (trail if k == 0 else ''))
    return '\n'.join(out)


def check(path, text):
    """Ecarts restants, sous forme de messages."""
    problems = []
    masked = code_mask(text)
    lines = text.split('\n')
    mlines = masked.split('\n')
    for no, (l, ml) in enumerate(zip(lines, mlines), 1):
        s = ml.strip()
        if not s:
            continue
        if s.count('(') != s.count(')'):
            continue                        # condition sur plusieurs lignes
        if re.match(r'^(if|for|while|else if)\b', s) or s.startswith('} else if') or re.match(r'^(}\s*)?else\b', s):
            body = s
            if not body.endswith('{') and not body.endswith('{}') and not re.match(r'^(}\s*)?while\s*\(.*\);$', s):
                if not re.search(r'\{\s*$', s) and not s.endswith(')') and not s.endswith('&&') and not s.endswith('||'):
                    problems.append('%s:%d: controle sans accolade ouvrante en fin de ligne' % (path, no))
        # plusieurs instructions sur une ligne (hors en-tete de for)
        if not re.match(r'^for\s*\(', s) and s.count(';') > 1:
            problems.append('%s:%d: plusieurs instructions sur une ligne' % (path, no))
        if re.search(r'\{[^{}]*;', s) and not re.match(r'^for\s*\(', s):
            problems.append('%s:%d: bloc sur une seule ligne' % (path, no))
    if split_declarations(text) != text:
        for no, (a, b) in enumerate(zip(text.split('\n'), split_declarations(text).split('\n')), 1):
            if a != b:
                problems.append('%s:%d: plusieurs declarations dans une instruction' % (path, no))
                break
    if expand_lists(text) != text:
        problems.append('%s: liste d\'initialisation a plusieurs valeurs sur une ligne' % path)
    return problems


def main():
    args = sys.argv[1:]
    fix = '--fix' in args
    files = [a for a in args if a != '--fix']
    bad = 0
    for f in files:
        text = open(f, encoding='utf-8').read()
        if fix:
            new = expand_lists(split_declarations(text))
            if new != text:
                open(f, 'w', encoding='utf-8').write(new)
        else:
            for p in check(f, text):
                print(p)
                bad = 1
    return bad


if __name__ == '__main__':
    sys.exit(main())
