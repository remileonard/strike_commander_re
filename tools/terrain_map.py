#!/usr/bin/env python3
"""Lit un terrain DATA\\<théâtre>.PAK (ex. data/ALASKA.PAK) et dessine la carte en PNG.

Écrit à partir de analysis/DATA_MODEL.html (« Le conteneur IFF » : archive PAK et LZW ;
« Le terrain » : sommet d'altitude, ATRI, région .TRI), sans consulter l'assembleur.
Ce que la doc ne disait pas et qui a été constaté sur ALASKA.PAK est marqué « Constat ».

Image produite : à gauche le relief (couleur = altitude Y, ombrage calculé), pistes du .TRI
en rouge ; à droite le champ « éclairage » des sommets tel quel, en niveaux de gris.
Vue de dessus : X vers la droite, Z vers le haut.

Usage : python3 tools/terrain_map.py data/ALASKA.PAK [-o carte.png] [--level elv|med|low]
"""

import argparse
import math
import os
import struct
import sys
import zlib

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from tri_map import read_pak, read_region  # noqa: E402


def lzw(data):
    """LZW de la doc : codes de 9 à 12 bits, 256 symboles, 256 = remise à zéro, 257 = fin,
    premier code libre 258 (comme le GIF). Constat : bits lus du poids faible vers le fort
    (ordre GIF) ; la largeur passe à n+1 bits quand la table atteint 2^n entrées."""
    out = bytearray()
    pos = 0
    width = 9
    table = [bytes([i]) for i in range(256)] + [b"", b""]
    prev = None
    nbits = len(data) * 8
    while pos + width <= nbits:
        chunk = int.from_bytes(data[pos >> 3:(pos >> 3) + 3].ljust(3, b"\0"), "little")
        code = (chunk >> (pos & 7)) & ((1 << width) - 1)
        pos += width
        if code == 256:
            table = table[:258]
            width = 9
            prev = None
            continue
        if code == 257:
            return bytes(out)
        if code < len(table):
            entry = table[code]
        elif code == len(table) and prev is not None:
            entry = prev + prev[:1]
        else:
            raise ValueError(f"code LZW invalide {code}")
        out += entry
        if prev is not None and len(table) < 4096:
            table.append(prev + entry[:1])
        prev = entry
        if len(table) >= (1 << width) and width < 12:
            width += 1
    raise ValueError("flux LZW sans code de fin")


def unpack_entry(pak, k, start, end):
    """Constat : les 3 bits de poids fort de l'adresse valent 111 pour une entrée stockée
    telle quelle, 001 pour une entrée compressée ; une entrée compressée commence par sa
    taille décompressée (uint32), suivie du flux LZW."""
    flags = struct.unpack_from("<I", pak, 4 + 4 * k)[0] >> 29
    raw = pak[start:end]
    if flags == 0b001:
        size = struct.unpack_from("<I", raw, 0)[0]
        out = lzw(raw[4:])
        if len(out) != size:
            raise ValueError(f"entrée {k} : {len(out)} octets décompressés, {size} annoncés")
        return out
    return raw


def read_elevations(data, top, index):
    """Une ressource d'altitude : constat, c'est un PAK de 324 entrées (une par cellule),
    chacune n × n sommets de 6 octets (doc : hauteur int16, éclairage, couleur, texture 1,
    texture 2). Constat : sommet k = ligne k ÷ n, colonne k mod n, lignes de +Z vers −Z,
    colonnes vers +X — même sens que la grille des cellules."""
    start, end = top[index]
    pak = data[start:end]
    cells = []
    for k, (a, b) in enumerate(read_pak(pak)):
        raw = unpack_entry(pak, k, a, b)
        n = int(math.isqrt(len(raw) // 6))
        verts = [struct.unpack_from("<hBBBB", raw, 6 * i) for i in range(n * n)]
        cells.append((n, verts))
    return cells


def assemble(cells, grid):
    n = cells[0][0]
    side = grid * n
    height = [[0] * side for _ in range(side)]
    light = [[0] * side for _ in range(side)]
    for c, (_, verts) in enumerate(cells):
        row, col = divmod(c, grid)
        for k, (h, l, _colour, _t1, _t2) in enumerate(verts):
            i, j = divmod(k, n)
            height[row * n + i][col * n + j] = h
            light[row * n + i][col * n + j] = l
    return height, light


# --- image -------------------------------------------------------------------------------

STOPS = [(0, (40, 90, 160)), (1, (70, 140, 80)), (600, (120, 160, 80)), (1500, (170, 150, 100)),
         (2500, (140, 110, 90)), (3200, (235, 235, 235))]


def hypso(h):
    if h <= 0:
        return STOPS[0][1]
    for (h0, c0), (h1, c1) in zip(STOPS, STOPS[1:]):
        if h <= h1:
            t = (h - h0) / (h1 - h0)
            return tuple(int(a + (b - a) * t) for a, b in zip(c0, c1))
    return STOPS[-1][1]


def write_png(path, pixels):
    h = len(pixels)
    w = len(pixels[0])
    raw = b"".join(b"\0" + bytes(v for px in row for v in px) for row in pixels)

    def chunk(tag, body):
        return struct.pack(">I", len(body)) + tag + body + struct.pack(">I", zlib.crc32(tag + body))

    with open(path, "wb") as f:
        f.write(b"\x89PNG\r\n\x1a\n")
        f.write(chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 2, 0, 0, 0)))
        f.write(chunk(b"IDAT", zlib.compress(raw, 9)))
        f.write(chunk(b"IEND", b""))


def render(height, light, spacing, runways, grid, cell_size, scale):
    side = len(height)
    gap = 16
    img_w = side * scale * 2 + gap
    img = [[(250, 250, 247)] * img_w for _ in range(side * scale)]
    for i in range(side):
        for j in range(side):
            h = height[i][j]
            # Ombrage : lumière venant du nord-ouest de l'image.
            dx = (height[i][min(j + 1, side - 1)] - height[i][max(j - 1, 0)]) / (2 * spacing)
            dz = (height[min(i + 1, side - 1)][j] - height[max(i - 1, 0)][j]) / (2 * spacing)
            shade = max(0.35, min(1.25, 1.0 - 1.6 * (dx + dz)))
            c = tuple(min(255, int(v * shade)) for v in hypso(h))
            g = light[i][j]
            for a in range(scale):
                for b in range(scale):
                    img[i * scale + a][j * scale + b] = c
                    img[i * scale + a][side * scale + gap + j * scale + b] = (g, g, g)
    # Grille des cellules (relief).
    n = side // grid
    for q in range(1, grid):
        t = q * n * scale
        for u in range(side * scale):
            img[t][u] = tuple(int(v * 0.8) for v in img[t][u])
            img[u][t] = tuple(int(v * 0.8) for v in img[u][t])
    # Pistes : on marque les pixels couverts par chaque région .TRI.
    half = grid * cell_size / 2
    px_per_m = scale / spacing
    for r in runways:
        xs = [v["x"] for v in r["vertices"]]
        zs = [v["z"] for v in r["vertices"]]
        x0 = int((min(xs) + half) * px_per_m) - 1
        x1 = int((max(xs) + half) * px_per_m) + 1
        y0 = int((half - max(zs)) * px_per_m) - 1
        y1 = int((half - min(zs)) * px_per_m) + 1
        for y in range(max(0, y0), min(side * scale, y1 + 1)):
            for x in range(max(0, x0), min(side * scale, x1 + 1)):
                img[y][x] = (220, 30, 30)
    return img


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("pak")
    ap.add_argument("-o", "--output", default=None)
    ap.add_argument("--level", choices=["elv", "med", "low"], default="elv")
    ap.add_argument("--scale", type=int, default=2, help="pixels par sommet")
    args = ap.parse_args()

    data = open(args.pak, "rb").read()
    top = read_pak(data)
    print(f"{args.pak} : {len(data)} octets, PAK de {len(top)} ressources")
    # Constat sur ALASKA.PAK : ordre des ressources = TERA, ELV, MED, LOW, TRI, puis un PAK
    # de 324 listes d'objets, puis 324 uint16 (un par cellule).
    index = {"elv": 1, "med": 2, "low": 3}[args.level]
    cells = read_elevations(data, top, index)
    grid = int(math.isqrt(len(cells)))
    n = cells[0][0]
    cell_size = 20000                               # ATRI / ELEV de ALASKA.PAK
    spacing = cell_size / n
    height, light = assemble(cells, grid)
    flat = [h for row in height for h in row]
    print(f"  {args.level} : {grid}×{grid} cellules de {n}×{n} sommets, espacement {spacing:g} m, "
          f"altitude {min(flat)}..{max(flat)} m")

    start, end = top[4]
    tri = data[start:end]
    runways = []
    for a, b in read_pak(tri):
        if b > a:
            r = read_region(tri, a, b)
            runways.append(r)
            V = r["vertices"]
            cx = sum(v["x"] for v in V) / len(V)
            cz = sum(v["z"] for v in V) / len(V)
            j = int((cx + grid * cell_size / 2) / spacing)
            i = int((grid * cell_size / 2 - cz) / spacing)
            print(f"  piste à Y = {V[0]['y']:.0f} m ; sol sous son centre : {height[i][j]} m")

    img = render(height, light, spacing, runways, grid, cell_size, args.scale)
    out = args.output or os.path.splitext(args.pak)[0] + f"_{args.level}.png"
    write_png(out, img)
    print(f"image : {out}")


if __name__ == "__main__":
    main()
