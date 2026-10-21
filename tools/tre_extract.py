"""Extrait une archive .TRE du jeu (ex. BIGTRE.TRE) : uint32 nombre d'entrées, uint32 fin de table,
puis des entrées de 74 octets (octet 1, chemin 65 octets terminé par 0, uint32 position,
uint32 taille). Usage : python3 tools/tre_extract.py BIGTRE.TRE <dossier>"""
import struct, sys, os
src, dst = sys.argv[1], sys.argv[2]
d = open(src, 'rb').read()
n, table_end = struct.unpack_from('<II', d, 0)
bad = 0
for i in range(n):
    o = 8 + 74 * i
    name = d[o + 1:o + 66].split(b'\0')[0].decode('ascii')
    off, size = struct.unpack_from('<II', d, o + 66)
    if off + size > len(d):
        bad += 1
        continue
    rel = name.replace('..\\', '').replace('\\', '/')
    path = os.path.normpath(os.path.join(dst, rel))
    assert path.startswith(os.path.abspath(dst))
    os.makedirs(os.path.dirname(path), exist_ok=True)
    open(path, 'wb').write(d[off:off + size])
print(n, 'entrées, fin de table', hex(table_end), 'hors fichier', bad)
