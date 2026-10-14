#!/usr/bin/env python3
"""Génère une visionneuse interactive (une page HTML autonome) d'un terrain DATA\\<théâtre>.PAK.

Carte : zoom à la molette, déplacement à la souris (glisser), double-clic pour zoomer.
Panneau latéral : pistes (.TRI) et objets posés sur le terrain ; un clic centre la carte.
Calques : relief, champ « éclairage », champ « couleur », grille des cellules.

La lecture du PAK vient de tools/terrain_map.py et tools/tri_map.py (écrits d'après
analysis/DATA_MODEL.html). Les enregistrements d'objets (ressource n° 6) ne sont pas dans
la doc : leur disposition ci-dessous est un CONSTAT sur ALASKA.PAK.

Usage : python3 tools/terrain_viewer.py data/ALASKA.PAK [-o data/ALASKA_viewer.html]
"""

import argparse
import base64
import json
import math
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from terrain_map import assemble, read_elevations  # noqa: E402
from tri_map import read_pak, read_region  # noqa: E402

CELL_SIZE = 20000          # ATRI (taille d'une cellule) et ELEV de ALASKA.PAK


def read_objects(data, top, index):
    """Constat : PAK de 324 entrées (une par cellule) ; une entrée = uint16 nombre d'objets,
    puis des enregistrements de 70 octets : nom (13 octets), second nom (9 octets, pas
    toujours terminé par un zéro), X, Z, Y en float (int32 ÷ 256), puis 9 float formant une
    matrice 3 × 3 (1,0 = 256)."""
    start, end = top[index]
    pak = data[start:end]
    objects = []
    for cell, (a, b) in enumerate(read_pak(pak)):
        if b <= a:
            continue
        count = struct.unpack_from("<H", pak, a)[0]
        for k in range(count):
            r = pak[a + 2 + 70 * k:a + 2 + 70 * (k + 1)]
            name = r[0:13].split(b"\0")[0].decode("latin-1")
            name2 = r[13:22].split(b"\0")[0][:8].decode("latin-1")
            x, z, y = (v / 256 for v in struct.unpack_from("<3i", r, 22))
            m = [v / 256 for v in struct.unpack_from("<9i", r, 34)]
            objects.append({"name": name, "name2": name2, "cell": cell,
                            "x": x, "z": z, "y": y, "m": m})
    return objects


def read_palette(path):
    """DATA\\PALETTE.IFF (DATA_MODEL.html, « La palette ») : chunk PALT = 4 octets puis
    256 × (R, V, B) sur 0..63 ; chunk RANG = uint16 nombre, puis 13 octets par couleur de base
    (uint16 première teinte, uint16 nombre de teintes, uint16 décalage de brouillard, …)."""
    t = open(path, "rb").read()
    pal = None
    rang = []
    p = 12
    while p + 8 <= len(t):
        tag = t[p:p + 4]
        n = struct.unpack(">I", t[p + 4:p + 8])[0]
        body = t[p + 8:p + 8 + n]
        if tag == b"PALT":
            pal = [min(255, v * 4) for v in body[4:4 + 768]]
        elif tag == b"RANG":
            count = struct.unpack_from("<H", body, 0)[0]
            for k in range(count):
                first, shades, fog = struct.unpack_from("<3H", body, 2 + 13 * k)
                rang.append([first, shades, fog])
        if tag == b"FORM":
            p += 12
            continue
        p += 8 + n + (n & 1)
    return pal, rang


def read_runways(data, top, index):
    start, end = top[index]
    tri = data[start:end]
    runways = []
    for cell, (a, b) in enumerate(read_pak(tri)):
        if b <= a:
            continue
        r = read_region(tri, a, b)
        V = r["vertices"]
        runways.append({
            "cell": cell,
            "v": [[round(v["x"], 3), round(v["z"], 3)] for v in V],
            "light": [v["light"] for v in V],
            "y": V[0]["y"],
            "t": [[t["v"][0], t["v"][1], t["v"][2], t["colour"]] for t in r["triangles"]],
        })
    return runways


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("pak")
    ap.add_argument("-o", "--output", default=None)
    ap.add_argument("--palette", default=None, help="PALETTE.IFF (défaut : à côté du .PAK)")
    args = ap.parse_args()

    data = open(args.pak, "rb").read()
    top = read_pak(data)
    cells = read_elevations(data, top, 1)
    grid = int(math.isqrt(len(cells)))
    n = cells[0][0]
    height, light = assemble(cells, grid)
    colour = [[0] * (grid * n) for _ in range(grid * n)]
    textured = [[0] * (grid * n) for _ in range(grid * n)]
    for c, (_, verts) in enumerate(cells):
        row, col = divmod(c, grid)
        for k, v in enumerate(verts):
            i, j = divmod(k, n)
            colour[row * n + i][col * n + j] = v[2]
            textured[row * n + i][col * n + j] = 1 if (v[3] != 255 or v[4] != 255) else 0
    side = grid * n
    payload = {
        "name": os.path.basename(args.pak),
        "grid": grid,
        "side": side,
        "cellSize": CELL_SIZE,
        "spacing": CELL_SIZE / n,
        "height": base64.b64encode(struct.pack(f"<{side * side}h",
                                               *[h for row in height for h in row])).decode(),
        "light": base64.b64encode(bytes(v for row in light for v in row)).decode(),
        "colour": base64.b64encode(bytes(v for row in colour for v in row)).decode(),
        "textured": base64.b64encode(bytes(v for row in textured for v in row)).decode(),
        "runways": read_runways(data, top, 4),
        "objects": read_objects(data, top, 5),
    }
    pal_path = args.palette or os.path.join(os.path.dirname(args.pak), "PALETTE.IFF")
    if os.path.exists(pal_path):
        pal, rang = read_palette(pal_path)
        payload["palette"] = pal
        payload["rang"] = rang
        print(f"palette : {pal_path} ({len(rang)} couleurs de base)")
    else:
        print(f"pas de palette ({pal_path} absent) : calque « jeu » désactivé")
    here = os.path.dirname(os.path.abspath(__file__))
    template = open(os.path.join(here, "terrain_viewer.html")).read()
    page = template.replace("/*__DATA__*/null", json.dumps(payload, separators=(",", ":")))
    page = page.replace("__TITLE__", payload["name"])
    out = args.output or os.path.splitext(args.pak)[0] + "_viewer.html"
    with open(out, "w") as f:
        f.write(page)
    print(f"{out} : {len(payload['runways'])} pistes, {len(payload['objects'])} objets, "
          f"{len(page) // 1024} Ko")


if __name__ == "__main__":
    main()
