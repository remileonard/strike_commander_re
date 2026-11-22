#!/usr/bin/env python3
"""Rendu d'un terrain de Wings of Glory (TERRAIN\\MAPn.PAK, extrait de FLIGHTHD.TRE par tools/xtre_extract.py).

Constaté sur MAP2.PAK, PAS relu dans GLORY.EXE (rôles des octets non établis) :
  - PAK de 7 entrées : 0 = IFF FORM TERA (VERS, INFO, FORM BLOX : ELEV, ATRI, OBJS citant NEWMAP.ELV, .TRI, .OBJ ;
    FORM TXMS : INFO, MAPS = noms BEACH, GR2RTH, …, RUNWAY, ROAD, NOMAN, COAST…) ; 1 = grille de 360 × 360 cases
    de 2 octets ; 2 et 3 vides ; 4, 5, 6 non décodées ;
  - 1er octet d'une case : 2 bits bas (0, 1, 2) et bits 40h / 80h ; 2e octet : 255 = rien, autres valeurs = éléments
    en lignes (routes, rivières, tranchées… d'après les noms de MAPS ; correspondance non établie).
Image : couleur de fond = 2 bits bas, teinte = bits 40h / 80h, éléments du 2e octet par bande de valeurs.
Ligne 0 de la grille en haut de l'image (orientation non vérifiée).

Usage : python3 tools/wog_map_render.py MAP2.PAK -o map2.png [--echelle 2]
"""
import argparse
import struct
import zlib

BASE = {
    0: (40, 70, 120),
    1: (120, 150, 90),
    2: (150, 135, 95),
    3: (255, 255, 255),
}
SIDE = {
    0: (0.45, 0.45, 0.45),
    1: (0.85, 1.05, 0.85),
    2: (1.10, 1.00, 0.80),
    3: (1.0, 1.0, 1.0),
}
BANDS = [
    (0, 53, (230, 220, 160)),
    (54, 99, (90, 90, 90)),
    (100, 173, (60, 110, 220)),
    (174, 209, (200, 40, 40)),
    (210, 254, (30, 30, 30)),
]


def write_png(path, width, height, rgb):
    rows = []
    for y in range(height):
        rows.append(b"\0" + bytes(rgb[y * width * 3:(y + 1) * width * 3]))
    raw = b"".join(rows)

    def chunk(tag, data):
        body = tag + data
        return struct.pack(">I", len(data)) + body + struct.pack(">I", zlib.crc32(body) & 0xFFFFFFFF)

    header = struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0)
    png = b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", header) + chunk(b"IDAT", zlib.compress(raw, 9)) + chunk(b"IEND", b"")
    open(path, "wb").write(png)


def pak_entries(data):
    first = struct.unpack_from("<I", data, 4)[0] & 0xFFFFFF
    count = (first - 4) // 4
    offsets = []
    for k in range(count):
        offsets.append(struct.unpack_from("<I", data, 4 + 4 * k)[0] & 0xFFFFFF)
    offsets.append(len(data))
    entries = []
    for k in range(count):
        entries.append(data[offsets[k]:offsets[k + 1]])
    return entries


def cell_colour(b0, b1):
    if b1 != 255:
        for low, high, colour in BANDS:
            if low <= b1 <= high:
                return colour
    base = BASE[b0 & 3]
    side = SIDE[b0 >> 6]
    return tuple(min(255, int(base[q] * side[q])) for q in range(3))


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("pak")
    ap.add_argument("-o", "--out", default="map.png")
    ap.add_argument("--echelle", type=int, default=2)
    args = ap.parse_args()
    data = open(args.pak, "rb").read()
    grid = pak_entries(data)[1]
    side = int((len(grid) // 2) ** 0.5)
    scale = args.echelle
    width = side * scale
    rgb = bytearray(width * width * 3)
    for y in range(side):
        for x in range(side):
            k = 2 * (y * side + x)
            colour = cell_colour(grid[k], grid[k + 1])
            for dy in range(scale):
                for dx in range(scale):
                    p = 3 * ((y * scale + dy) * width + x * scale + dx)
                    rgb[p:p + 3] = bytes(colour)
    write_png(args.out, width, width, rgb)
    print("%s : grille %d × %d" % (args.out, side, side))


if __name__ == "__main__":
    main()
