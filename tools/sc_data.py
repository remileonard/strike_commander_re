"""Lecture des données de Strike Commander (PAK, LZW, palettes, images) pour tools/midgame_render.py.

Aucune donnée du jeu n'est dans le dépôt. Les données se donnent par la variable SC_DATA ou l'option
--donnees : soit l'archive BIGTRE.TRE du jeu, lue directement, soit le dossier DATA qu'elle contient
(extrait par tools/tre_extract.py). Les chemins s'écrivent toujours <SC_DATA>/<DOSSIER>/<FICHIER>."""
import os
import struct
import sys
import zlib

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from terrain_map import lzw  # noqa: E402

GAME = os.environ.get('SC_DATA', 'DATA')
_paks = {}
_tre = None


def tre_index(path):
    """Archive .TRE : uint32 nombre d'entrées, uint32 fin de table, puis 74 octets par entrée
    (octet 1, chemin de 65 octets terminé par 0, uint32 position, uint32 taille)."""
    d = open(path, 'rb').read()
    n = struct.unpack_from('<I', d, 0)[0]
    index = {}
    for i in range(n):
        o = 8 + 74 * i
        name = d[o + 1:o + 66].split(b'\0')[0].decode('ascii').upper()
        off, size = struct.unpack_from('<II', d, o + 66)
        index[name.replace('..\\', '').replace('\\', '/')] = (off, size)
    return d, index


def read(path):
    """Lit un fichier de données, dans l'archive .TRE si SC_DATA en est une."""
    global _tre
    if GAME.upper().endswith('.TRE'):
        if _tre is None:
            _tre = tre_index(GAME)
        rel = os.path.relpath(path, GAME).replace(os.sep, '/').upper()
        off, size = _tre[1]['DATA/' + rel]
        return _tre[0][off:off + size]
    return open(path, 'rb').read()


def pak_entries(path):
    if path not in _paks:
        d = read(path)
        first = struct.unpack_from('<I', d, 4)[0] & 0x1FFFFFFF
        count = (first - 4) // 4
        raw = [struct.unpack_from('<I', d, 4 + 4 * i)[0] for i in range(count)]
        offs = [r & 0x1FFFFFFF for r in raw]
        ents = []
        for i in range(count):
            end = offs[i + 1] if i + 1 < count else len(d)
            ents.append((raw[i] >> 29, offs[i], end))
        _paks[path] = (d, ents)
    return _paks[path]


import functools


@functools.lru_cache(maxsize=None)
def pak_entry(path, k):
    d, ents = pak_entries(path)
    flag, s, e = ents[k]
    raw = d[s:e]
    if flag == 0b001:
        size = struct.unpack_from('<I', raw, 0)[0]
        out = lzw(raw[4:])
        assert len(out) == size
        return out
    return raw


def palette_block(b):
    first = b[0]
    count = b[2] | (b[3] << 8)
    rgb = b[4:4 + 3 * count]
    return first, count, rgb


def shape_images(b):
    """Forme RealSpace : uint32 taille, puis table de uint32 (décalages des images)."""
    first = struct.unpack_from('<I', b, 4)[0]
    n = first // 4 - 1
    return [struct.unpack_from('<I', b, 4 + 4 * i)[0] for i in range(n)]


@functools.lru_cache(maxsize=None)
def image_spans(b, idx):
    """Lignes de l'image idx : uint16 n (0 = fin), int16 x, int16 y ; n pair : n/2 pixels bruts ;
    n impair : n/2 pixels en blocs (octet c : c/2 pixels, l'octet suivant répété si c impair)."""
    offs = shape_images(b)
    if idx is None or idx < 0 or idx >= len(offs):
        return ()
    p = offs[idx] + 8
    spans = []
    while True:
        n = struct.unpack_from('<H', b, p)[0]
        p += 2
        if n == 0:
            return tuple(spans)
        x, y = struct.unpack_from('<hh', b, p)
        p += 4
        if n & 1 == 0:
            pix = bytes(b[p:p + n // 2])
            p += n // 2
        else:
            pix = bytearray()
            left = n // 2
            while left > 0:
                c = b[p]
                p += 1
                k = c >> 1
                if c & 1:
                    pix += bytes([b[p]]) * k
                    p += 1
                else:
                    pix += b[p:p + k]
                    p += k
                left -= k
            pix = bytes(pix)
        spans.append((x, y, pix))


def draw_image(dst, w, h, b, idx, x0, y0, clip=None, translucent=None):
    """Dessine l'image idx de la forme b en (x0, y0) dans dst (bytearray w×h).
    translucent = (table, A, B) : pixel A <= c < A+B -> table[(c-A)*256 + fond]."""
    cl, ct, cr, cb = clip if clip else (0, 0, w - 1, h - 1)
    for x, y, pix in image_spans(b, idx):
        x += x0
        y += y0
        if y < ct or y > cb:
            continue
        a = max(x, cl)
        e = min(x + len(pix) - 1, cr)
        if a > e:
            continue
        seg = pix[a - x:e - x + 1]
        row = y * w
        if translucent:
            tab, A, B = translucent
            seg = bytes(tab[(c - A) * 256 + dst[row + a + i]] if A <= c < A + B else c for i, c in enumerate(seg))
        dst[row + a:row + e + 1] = seg


def write_png(path, w, h, indexed, pal):
    raw = bytearray()
    for y in range(h):
        raw.append(0)
        for x in range(w):
            c = indexed[y * w + x]
            raw += bytes(pal[3 * c:3 * c + 3])

    def chunk(t, body):
        return struct.pack('>I', len(body)) + t + body + struct.pack('>I', zlib.crc32(t + body) & 0xffffffff)
    png = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB', w, h, 8, 2, 0, 0, 0))
    png += chunk(b'IDAT', zlib.compress(bytes(raw), 6)) + chunk(b'IEND', b'')
    open(path, 'wb').write(png)
