#!/usr/bin/env python3
"""Lit un fichier terrain .TRI (ex. data/ALASKA.TRI) et dessine une vue de dessus en SVG.

Écrit UNIQUEMENT à partir de analysis/DATA_MODEL.html (sections « Le conteneur IFF »
→ archive PAK, et « Le terrain » → « Une région .TRI », « Sommet .TRI », « Triangle .TRI »),
sans consulter l'assembleur : le but est de valider la documentation sur un vrai fichier.

Repère : celui de la doc (Y-up) — X et Z = plan horizontal, Y = altitude. Un vecteur est
rangé X, puis Z, puis Y dans le fichier. Les « float » sont des int32 ÷ 256.

Usage : python3 tools/tri_map.py data/ALASKA.TRI [-o carte.svg] [--cells 18] [--cell-size 20000]
"""

import argparse
import struct
import sys

# --- lecture ------------------------------------------------------------------------------


def read_pak(data):
    """Archive PAK (doc §IFF) : uint32 taille du fichier, puis une adresse uint32 par
    sous-ressource (3 bits de poids fort à 1, hors adresse), puis les données.

    Constat sur ALASKA.TRI (pas dans la doc) : le nombre d'entrées n'est pas écrit ; la table
    s'arrête là où commencent les données, c'est-à-dire à la première adresse. Une entrée vide
    a la même adresse que la suivante (longueur 0)."""
    size = struct.unpack_from("<I", data, 0)[0]
    if size != len(data):
        print(f"attention : taille annoncée {size} ≠ taille du fichier {len(data)}", file=sys.stderr)
    first = struct.unpack_from("<I", data, 4)[0] & 0x1FFFFFFF
    count = (first - 4) // 4
    offsets = [struct.unpack_from("<I", data, 4 + 4 * i)[0] for i in range(count)]
    for raw in offsets:
        if raw >> 29 != 0b111:
            print(f"attention : adresse 0x{raw:08X} sans les 3 bits de poids fort", file=sys.stderr)
    offsets = [raw & 0x1FFFFFFF for raw in offsets]
    entries = []
    for i, start in enumerate(offsets):
        end = offsets[i + 1] if i + 1 < count else len(data)
        entries.append((start, end))
    return entries


def read_region(data, start, end):
    """Une région .TRI (doc §Le terrain)."""
    nv, nt, g, nl = struct.unpack_from("<4H", data, start)
    p = start + 8
    vertices = []
    for _ in range(nv):
        # Sommet .TRI (13 octets) : X, Z, Y en float (int32 ÷ 256), puis éclairage uint8.
        x, z, y = (v / 256 for v in struct.unpack_from("<3i", data, p))
        vertices.append({"x": x, "z": z, "y": y, "light": data[p + 12]})
        p += 13
    triangles = []
    for _ in range(nt):
        # Triangle .TRI (16 octets) : groupe uint8, 3 × sommet uint16, type uint8,
        # couleur uint16, puis 3 × (u, v) uint8.
        group, a, b, c, kind, colour = struct.unpack_from("<B3HBH", data, p)
        uv = tuple(data[p + 10:p + 16])
        triangles.append({"group": group, "v": (a, b, c), "type": kind, "colour": colour, "uv": uv})
        p += 16
    lists = struct.unpack_from(f"<{nl}H", data, p)
    p += 2 * nl
    grid = struct.unpack_from(f"<{g * g}H", data, p)
    p += 2 * g * g
    problems = []
    if p != end:
        problems.append(f"la région finit à {p}, l'entrée PAK à {end}")
    for t in triangles:
        if max(t["v"]) >= nv:
            problems.append(f"triangle vers un sommet inexistant {t['v']}")
            break
    return {"vertices": vertices, "triangles": triangles, "lists": lists, "grid": grid,
            "g": g, "problems": problems}


# --- dessin -------------------------------------------------------------------------------

# La palette du jeu (PALETTE.IFF) n'est pas dans le dépôt : les couleurs sont arbitraires,
# une teinte par numéro de « couleur », gris pour 255 (sans texture).
def colour_of(index, light):
    if index == 255:
        base = (150, 150, 150)
    else:
        hue = (index * 47) % 360
        base = hsv(hue, 0.55, 0.85)
    k = 0.45 + 0.55 * light / 255
    return "#%02x%02x%02x" % tuple(int(c * k) for c in base)


def hsv(h, s, v):
    c = v * s
    x = c * (1 - abs((h / 60) % 2 - 1))
    m = v - c
    r, g, b = [(c, x, 0), (x, c, 0), (0, c, x), (0, x, c), (x, 0, c), (c, 0, x)][int(h // 60) % 6]
    return tuple(int((u + m) * 255) for u in (r, g, b))


def draw_triangles(out, region, local):
    V = region["vertices"]
    for t in region["triangles"]:
        pts = [local(V[i]) for i in t["v"]]
        light = sum(V[i]["light"] for i in t["v"]) / 3
        fill = colour_of(t["colour"], light)
        out.append('<polygon points="%s" fill="%s" stroke="#000" stroke-width="0.1"/>' % (
            " ".join(f"{x:.2f},{y:.2f}" for x, y in pts), fill))


def svg_map(regions, cells, cell_size, title):
    half = cells * cell_size / 2
    size = 720                                   # côté de la vue d'ensemble, en px
    scale = size / (cells * cell_size)

    # Vue de dessus : X vers la droite, Z vers le haut de l'image.
    def to_px(x, z):
        return (x + half) * scale, (half - z) * scale

    out = []
    pad = 20
    panel_w = 560
    width = pad + size + pad + panel_w + pad
    height = max(pad + 30 + size + pad, pad + 30 + len(regions) * 260 + pad)
    out.append(f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" '
               f'viewBox="0 0 {width} {height}" font-family="sans-serif" font-size="12">')
    out.append(f'<rect width="{width}" height="{height}" fill="#fafaf7"/>')
    out.append(f'<text x="{pad}" y="{pad + 12}" font-size="16" font-weight="bold">{title}</text>')
    ox, oy = pad, pad + 30
    out.append(f'<g transform="translate({ox},{oy})">')
    out.append(f'<rect width="{size}" height="{size}" fill="#e8eee9" stroke="#555"/>')
    for i in range(1, cells):
        t = i * size / cells
        out.append(f'<line x1="{t}" y1="0" x2="{t}" y2="{size}" stroke="#c5cfc8"/>')
        out.append(f'<line x1="0" y1="{t}" x2="{size}" y2="{t}" stroke="#c5cfc8"/>')
    for r in regions:
        row, col = divmod(r["cell"], cells)
        cs = size / cells
        out.append(f'<rect x="{col * cs}" y="{row * cs}" width="{cs}" height="{cs}" '
                   f'fill="none" stroke="#c0392b" stroke-width="2"/>')
        xs = [v["x"] for v in r["vertices"]]
        zs = [v["z"] for v in r["vertices"]]
        x0, y0 = to_px(min(xs), max(zs))
        x1, y1 = to_px(max(xs), min(zs))
        out.append(f'<rect x="{x0 - 1}" y="{y0 - 1}" width="{x1 - x0 + 2}" height="{y1 - y0 + 2}" fill="#222"/>')
        out.append(f'<text x="{col * cs + 2}" y="{row * cs - 3}" fill="#c0392b">case {r["cell"]}</text>')
    out.append(f'<text x="{size / 2}" y="{size + 16}" text-anchor="middle">X →  '
               f'({cells} × {cells} cases de {cell_size / 1000:g} km)</text>')
    out.append(f'<text x="-14" y="{size / 2}" text-anchor="middle" transform="rotate(-90 -14 {size / 2})">Z →</text>')
    out.append('</g>')

    # Détail de chaque région, à l'échelle, grand axe à l'horizontale.
    px0 = pad + size + pad
    for k, r in enumerate(regions):
        V = r["vertices"]
        xs = [v["x"] for v in V]
        zs = [v["z"] for v in V]
        ys = [v["y"] for v in V]
        wx = max(xs) - min(xs)
        wz = max(zs) - min(zs)
        rotate = wz > wx                          # piste orientée selon Z : on la couche
        long_side = max(wx, wz)
        s = (panel_w - 20) / long_side
        top = pad + 30 + k * 260

        def local(v):
            if rotate:
                return (v["z"] - min(zs)) * s + 10, (v["x"] - min(xs)) * s + 30
            return (v["x"] - min(xs)) * s + 10, (max(zs) - v["z"]) * s + 30

        out.append(f'<g transform="translate({px0},{top})">')
        out.append(f'<text x="0" y="12" font-weight="bold">case {r["cell"]} (ligne {r["cell"] // cells}, '
                   f'colonne {r["cell"] % cells})</text>')
        out.append(f'<text x="0" y="26">{len(V)} sommets, {len(r["triangles"])} triangles · '
                   f'{wx:.0f} m (X) × {wz:.0f} m (Z) · altitude Y {min(ys):.0f}–{max(ys):.0f} m'
                   f'{" · tourné de 90°" if rotate else ""}</text>')
        draw_triangles(out, r, local)
        # Zoom sur le premier cinquième du grand axe, 5 fois plus grand.
        zoom = 5
        clip_id = f"clip{r['cell']}"
        short_px = (min(wx, wz) * s * zoom)
        out.append(f'<clipPath id="{clip_id}"><rect x="10" y="{50 + min(wx, wz) * s}" '
                   f'width="{panel_w - 20}" height="{short_px}"/></clipPath>')
        out.append(f'<text x="0" y="{46 + min(wx, wz) * s}">zoom × {zoom} sur les '
                   f'{long_side / zoom:.0f} premiers mètres</text>')
        out.append(f'<g clip-path="url(#{clip_id})"><g transform="translate(10,{50 + min(wx, wz) * s}) '
                   f'scale({zoom}) translate(-10,-30)">')
        draw_triangles(out, r, local)
        out.append('</g></g>')
        out.append('</g>')
    out.append('</svg>')
    return "\n".join(out)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("tri")
    ap.add_argument("-o", "--output", default=None)
    ap.add_argument("--cells", type=int, default=18, help="côté de la grille (ATRI : dimension)")
    ap.add_argument("--cell-size", type=float, default=20000, help="mètres (ATRI : taille d'une cellule)")
    args = ap.parse_args()

    data = open(args.tri, "rb").read()
    entries = read_pak(data)
    print(f"{args.tri} : {len(data)} octets, PAK de {len(entries)} entrées")
    if len(entries) != args.cells * args.cells:
        print(f"attention : {len(entries)} entrées ≠ {args.cells}² cases", file=sys.stderr)
    regions = []
    for cell, (start, end) in enumerate(entries):
        if end == start:
            continue
        r = read_region(data, start, end)
        r["cell"] = cell
        regions.append(r)
        V = r["vertices"]
        print(f"  case {cell:3d} : {len(V)} sommets, {len(r['triangles'])} triangles, grille {r['g']}×{r['g']}, "
              f"X {min(v['x'] for v in V):.0f}..{max(v['x'] for v in V):.0f}, "
              f"Z {min(v['z'] for v in V):.0f}..{max(v['z'] for v in V):.0f}, "
              f"Y {min(v['y'] for v in V):.0f}..{max(v['y'] for v in V):.0f}")
        for msg in r["problems"]:
            print(f"    PROBLÈME : {msg}")
        # Constat : la case du PAK correspond-elle à la position des sommets ?
        half = args.cells * args.cell_size / 2
        cx = sum(v["x"] for v in V) / len(V)
        cz = sum(v["z"] for v in V) / len(V)
        col = int((cx + half) // args.cell_size)
        row = int((half - cz) // args.cell_size)
        flag = "oui" if row * args.cells + col == cell else "NON"
        print(f"    centre ({cx:.0f}, {cz:.0f}) → ligne {row}, colonne {col} : correspond à la case ? {flag}")
    out = args.output or args.tri.rsplit(".", 1)[0] + "_map.svg"
    with open(out, "w") as f:
        f.write(svg_map(regions, args.cells, args.cell_size, args.tri.split("/")[-1]))
    print(f"image : {out}")


if __name__ == "__main__":
    main()
