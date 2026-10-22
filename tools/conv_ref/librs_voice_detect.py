"""Rejoue la détection voix / texte de libRealSpace (ConvFrame::SetSentenceFromConv) sur chaque texte.

Reproduit la règle telle qu'elle est écrite dans SCConvPlayer.cpp (CONV_SYSTEM.md § 9) et la compare
au contenu réel de chaque texte, dans les deux formats produits par export_scripts.py.

Usage : python3 tools/conv_ref/librs_voice_detect.py <sortie d'export_scripts.py> [--simplifiee]
  --simplifiee : même règle sans E0h dans la liste des commandes et sans la branche FFh / F4h
"""
import collections
import glob
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))

from conv_dump import Script  # noqa: E402

FULL_OPS = {0x00, 0x01, 0x02, 0x03, 0x04, 0x0A, 0x0B, 0x0C, 0x0F, 0xE0}
SIMPLE_OPS = FULL_OPS - {0xE0}


def cstr(data, p):
    end = data.find(b'\0', p)
    if end < 0:
        end = len(data)
    return data[p:end]


def librs_detect(data, pos, ops, pacific_branch):
    """pos = début de la première chaîne. Renvoie (voix ou None, texte, fin) comme SetSentenceFromConv."""
    sentence_p = pos
    sentence = cstr(data, sentence_p)
    end_p = pos + len(sentence) + 1
    shift = 1
    if end_p < len(data) and data[end_p] >= 0x80:
        end_p += 1
        shift = 2
    nb = data[end_p] if end_p < len(data) else 0
    voice = None
    sound_offset = 0
    if nb not in ops:
        sound_offset = len(sentence) + shift
        if not pacific_branch or nb not in (0xFF, 0xF4):
            voice = sentence
            sentence_p = end_p
            sentence = cstr(data, sentence_p)
        else:
            sound_offset = 4
    return voice, sentence, pos + sound_offset + len(sentence) + 1


def texts(data, with_voice):
    """(commande, début de la 1re chaîne, voix, texte, fin) de chaque texte, d'après le format exact."""
    s = Script(data, with_voice)
    out = []

    def text(kind):
        start = s.p
        voice, value = s.text()
        out.append((kind, start, voice, value, s.p))

    while s.p < len(s.b):
        op = s.byte()
        if op == 0x00:
            s.name()
            while s.peek() == 0x01:
                s.byte()
                s.name()
                s.sword()
                s.sword()
            while s.peek() in (0x02, 0x0A):
                if s.byte() == 0x02:
                    s.name()
                    s.sword()
                    s.sword()
                    s.byte()
                    text('02')
                else:
                    s.byte()
                    text('0A')
        elif op == 0x03:
            s.name()
            s.byte()
            s.name()
            s.sword()
            s.sword()
            text('03')
            s.byte()
            while s.peek() in (0x04, 0x0A, 0x0B):
                k = s.byte()
                if k == 0x04:
                    text('04')
                elif k == 0x0A:
                    s.byte()
                    text('0A')
                else:
                    s.word()
        elif op in (0x0C, 0x0E):
            s.p += 2
    return out


def main():
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    if len(args) != 1:
        raise SystemExit(__doc__)
    simplified = '--simplifiee' in sys.argv
    ops = SIMPLE_OPS if simplified else FULL_OPS
    for sub, with_voice in (('cd', True), ('disquette', False)):
        stats = collections.Counter()
        causes = collections.Counter()
        for path in sorted(glob.glob(os.path.join(args[0], sub, '*.bin'))):
            data = open(path, 'rb').read()
            for kind, pos, voice, text, end in texts(data, with_voice):
                got_voice, got_text, got_end = librs_detect(data, pos, ops, not simplified)
                got_voice = got_voice.decode('latin-1') if got_voice is not None else None
                expected = voice if with_voice else None
                good = got_voice == expected and got_text.decode('latin-1') == text and got_end == end
                stats[(kind, 'juste' if good else 'FAUX')] += 1
                if not good:
                    what = 'voix vide' if voice == '' else 'voix' if voice else 'sans voix'
                    if text == '':
                        what += ', texte vide'
                    causes[(kind, what, f'fin décalée de {got_end - end}')] += 1
        print(f'== format {sub}')
        for key, n in sorted(stats.items()):
            print(f'   {n:5d}  {key[0]}h {key[1]}')
        for key, n in causes.most_common():
            print(f'   erreurs : {n} × {key[0]}h, {key[1]}, {key[2]}')


if __name__ == '__main__':
    main()
