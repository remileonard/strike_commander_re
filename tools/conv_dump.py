"""Lecteur des scripts de conversation (GAMEFLOW\\CONV.PAK), d'après le code d'OPTEST.EXE.

Une entrée du PAK = un script : une suite de commandes d'un octet suivies de leurs champs.
Format décrit dans analysis/CONV_SYSTEM.md (interpréteur sub_5AA4E, lecteurs seg006).

Les données de BIGTRE.TRE ont un identifiant de voix (chaîne terminée par 0) devant chaque texte,
que le code d'OPTEST.EXE ne lit pas : option --sans-voix pour le format exact du code.

Usage : python3 tools/conv_dump.py --donnees <BIGTRE.TRE ou DATA> [--sans-voix] [entrée ...]
"""
import os
import struct
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

from sc_data import GAME, pak_entries, pak_entry  # noqa: E402


class Script:
    def __init__(self, data, voice):
        self.b = data
        self.p = 0
        self.voice = voice

    def byte(self):
        v = self.b[self.p]
        self.p += 1
        return v

    def word(self):
        v = struct.unpack_from('<H', self.b, self.p)[0]
        self.p += 2
        return v

    def name(self):
        # Nom de 9 octets, complété par des 0 (ConvRec_ReadName_6305).
        s = self.b[self.p:self.p + 9].split(b'\0')[0].decode('latin-1')
        self.p += 9
        return s

    def string(self):
        end = self.b.index(b'\0', self.p)
        s = self.b[self.p:end].decode('latin-1')
        self.p = end + 1
        return s

    def text(self):
        voice = self.string() if self.voice else None
        return voice, self.string()

    def peek(self):
        return self.b[self.p] if self.p < len(self.b) else None


def parse(data, voice=True):
    """Liste de (position, commande, champs) dans l'ordre du script."""
    s = Script(data, voice)
    out = []
    while s.p < len(s.b):
        at = s.p
        op = s.byte()
        if op == 0x00:
            # Scène de groupe : décor, figurants (01), puis répliques (02 avec personnage, 0A sans).
            out.append((at, '00 groupe', {'décor': s.name()}))
            while s.peek() == 0x01:
                at = s.p
                s.byte()
                out.append((at, '01 figurant', {'figure': s.name(), 'x': s.word(), 'y': s.word()}))
            while s.peek() in (0x02, 0x0A):
                at = s.p
                if s.byte() == 0x02:
                    rec = {'figure': s.name(), 'x': s.word(), 'y': s.word(), 'couleur': s.byte()}
                    rec['voix'], rec['texte'] = s.text()
                    out.append((at, '02 parle', rec))
                else:
                    rec = {'couleur': s.byte()}
                    rec['voix'], rec['texte'] = s.text()
                    out.append((at, '0A narration', rec))
        elif op == 0x03:
            rec = {'visage': s.name(), 'image': s.byte(), 'décor': s.name(), 'x': s.word(), 'y': s.word()}
            rec['voix'], rec['texte'] = s.text()
            rec['couleur'] = s.byte()
            out.append((at, '03 réplique', rec))
            while s.peek() in (0x04, 0x0A, 0x0B):
                at = s.p
                k = s.byte()
                if k == 0x04:
                    rec = {}
                    rec['voix'], rec['texte'] = s.text()
                    out.append((at, '04 suite', rec))
                elif k == 0x0A:
                    rec = {'couleur': s.byte()}
                    rec['voix'], rec['texte'] = s.text()
                    out.append((at, '0A texte', rec))
                else:
                    skip = s.word()
                    out.append((at, '0B accepter', {'refus_saute': skip, 'vers': s.p + skip}))
        elif op == 0x0C:
            skip = s.word()
            out.append((at, '0C saut', {'saute': skip, 'vers': s.p + skip}))
        elif op == 0x0E:
            out.append((at, '0E escadre', {'écran': s.byte(), 'escadre': s.byte()}))
        elif op == 0x0F:
            out.append((at, '0F choix équipier', {}))
        elif op == 0x10:
            out.append((at, '10', {}))
        else:
            # Commande inconnue : l'interpréteur saute l'octet (branche par défaut).
            out.append((at, f'{op:02X} inconnue', {}))
    return out


def main():
    args = sys.argv[1:]
    voice = True
    if '--sans-voix' in args:
        args.remove('--sans-voix')
        voice = False
    path = os.path.join(GAME, 'GAMEFLOW', 'CONV.PAK')
    count = len(pak_entries(path)[1])
    wanted = [int(a) for a in args] if args else range(count)
    for k in wanted:
        data = pak_entry(path, k)
        if not data:
            continue
        print(f'=== entrée {k} ({len(data)} octets)')
        for at, kind, rec in parse(data, voice):
            fields = ', '.join(f'{key}={value!r}' for key, value in rec.items())
            print(f'  {at:5d}  {kind:20s} {fields}')


if __name__ == '__main__':
    main()
