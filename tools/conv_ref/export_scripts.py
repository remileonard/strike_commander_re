"""Écrit les scripts de CONV.PAK dans les deux formats, pour tester conv_parser.cpp.

  <sortie>/cd/NNN.bin         entrée NNN telle quelle (format CD : [voix] devant chaque texte)
  <sortie>/disquette/NNN.bin  même script sans les chaînes de voix, sauts 0Bh / 0Ch recalculés
                              (format disquette reconstruit, pas un vrai CONV.PAK disquette)

Usage : python3 tools/conv_ref/export_scripts.py --donnees <BIGTRE.TRE ou DATA> <sortie>
Puis :  g++ -std=c++17 -o conv_parser tools/conv_ref/conv_parser.cpp
        ./conv_parser v <sortie>/cd/*.bin
        ./conv_parser s <sortie>/disquette/*.bin
"""
import bisect
import os
import struct
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))

from conv_dump import Script, parse  # noqa: E402
from sc_data import GAME, pak_entries, pak_entry  # noqa: E402


def voice_strings(data):
    """(début, longueur avec le 0) de chaque chaîne de voix, format CD."""
    s = Script(data, True)
    out = []

    def text():
        start = s.p
        voice = s.string()
        out.append((start, len(voice.encode('latin-1')) + 1))
        s.string()

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
                text()
        elif op == 0x03:
            s.name()
            s.byte()
            s.name()
            s.sword()
            s.sword()
            text()
            s.byte()
            while s.peek() in (0x04, 0x0A, 0x0B):
                k = s.byte()
                if k == 0x04:
                    text()
                elif k == 0x0A:
                    s.byte()
                    text()
                else:
                    s.word()
        elif op in (0x0C, 0x0E):
            s.p += 2
    return out


def strip_voice(data):
    cuts = voice_strings(data)
    starts = [c[0] for c in cuts]

    def moved(x):
        n = bisect.bisect_left(starts, x)
        return x - sum(length for _, length in cuts[:n])

    out = bytearray(data)
    for at, kind, rec in parse(data, True):
        if 'vers' in rec:
            struct.pack_into('<H', out, at + 1, moved(rec['vers']) - moved(at + 3))
    result = bytearray()
    last = 0
    for start, length in cuts:
        result += out[last:start]
        last = start + length
    result += out[last:]
    return bytes(result)


def main():
    if len(sys.argv) != 2:
        raise SystemExit(__doc__)
    base = sys.argv[1]
    for sub in ('cd', 'disquette'):
        os.makedirs(os.path.join(base, sub), exist_ok=True)
    path = os.path.join(GAME, 'GAMEFLOW', 'CONV.PAK')
    count = 0
    for k in range(len(pak_entries(path)[1])):
        data = pak_entry(path, k)
        if not data:
            continue
        open(os.path.join(base, 'cd', f'{k:03d}.bin'), 'wb').write(data)
        open(os.path.join(base, 'disquette', f'{k:03d}.bin'), 'wb').write(strip_voice(data))
        count += 1
    print(f'{count} scripts écrits dans {base}')


if __name__ == '__main__':
    main()
