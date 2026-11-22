"""Conversations de Pacific Strike (GAMEFLOW\\CONV.PAK de PACIFIC.DAT), d'après PACIFIC.EXE.

Une entrée pleine du PAK : uint32 taille, puis un flux PKWARE DCL (« implode », octets 00 06), décompressé
par sc_data.pak_entry (tools/pkware_dcl.py). Le script décompressé : une suite de commandes d'un octet suivies de leurs champs,
lues par Conv_PlayScript_C2ED0 et ses lecteurs ConvRec_* (analysis/pacific/README.md § 4).

Usage : python3 tools/ps_conv_dump.py --donnees <DATA de Pacific Strike> [entrée ...]
"""
import os
import struct
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

import sc_data  # noqa: E402

def entry(k):
    """Script décompressé de l'entrée k (b'' pour une entrée vide)."""
    path = os.path.join(sc_data.GAME, 'GAMEFLOW', 'CONV.PAK')
    _, entries = sc_data.pak_entries(path)
    if entries[k][0] == 7:
        return b''
    return sc_data.pak_entry(path, k)


def count():
    _, entries = sc_data.pak_entries(os.path.join(sc_data.GAME, 'GAMEFLOW', 'CONV.PAK'))
    return len(entries)


class Script:
    def __init__(self, data):
        self.b = data
        self.p = 0

    def byte(self):
        v = self.b[self.p]
        self.p += 1
        return v

    def word(self):
        v = struct.unpack_from('<H', self.b, self.p)[0]
        self.p += 2
        return v

    def sword(self):
        v = struct.unpack_from('<h', self.b, self.p)[0]
        self.p += 2
        return v

    def name(self):
        s = self.b[self.p:self.p + 9].split(b'\0')[0].decode('latin-1')
        self.p += 9
        return s

    def text(self):
        end = self.b.index(b'\0', self.p)
        s = self.b[self.p:end].decode('latin-1')
        self.p = end + 1
        return s


def parse(data):
    """Liste de (position, commande, champs). Commandes de Conv_PlayScript_C2ED0 (table off_C4370)."""
    s = Script(data)
    out = []
    while s.p < len(s.b):
        at = s.p
        op = s.byte()
        if op == 0:
            out.append((at, 'GROUP_SHOT', {'décor': s.name()}))
        elif op == 1:
            out.append((at, 'GROUP_SHOT_ADD_CHARACTER', {'figure': s.name(), 'x': s.sword(), 'y': s.sword()}))
        elif op == 3:
            rec = {'visage': s.name(), 'image': s.byte(), 'décor': s.name(), 'x': s.sword(), 'y': s.sword()}
            rec['texte'] = s.text()
            rec['couleur'] = s.byte()
            rec['voix'] = s.word()
            rec['mot_2'] = s.word()
            out.append((at, 'CLOSEUP', rec))
        elif op == 5:
            out.append((at, 'IF_FLAG', {'drapeau': s.word()}))
        elif op == 10:
            rec = {'couleur': s.byte()}
            rec['texte'] = s.text()
            rec['voix'] = s.word()
            rec['mot_2'] = s.word()
            out.append((at, 'SHOW_TEXT', rec))
        elif op == 12:
            out.append((at, 'ELSE', {}))
        elif op == 13:
            out.append((at, 'ENDIF', {}))
        elif op == 16:
            out.append((at, 'NOP_16', {}))
        elif op == 17:
            n = s.word()
            images = [s.word() for _ in range(n)]
            out.append((at, 'GROUP_SHOT_COMMANDER', {'images': images, 'x': s.sword(), 'y': s.sword()}))
        else:
            raise ValueError(f'commande {op} inconnue à l\'octet {at}')
    return out


def main():
    wanted = [int(a) for a in sys.argv[1:]] or range(count())
    for k in wanted:
        data = entry(k)
        if not data:
            continue
        print(f'=== entrée {k} ({len(data)} octets)')
        for at, kind, rec in parse(data):
            fields = ', '.join(f'{key}={value!r}' for key, value in rec.items())
            print(f'{at:7d}  {kind:26s} {fields}')


if __name__ == '__main__':
    main()
