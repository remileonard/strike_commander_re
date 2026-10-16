#!/usr/bin/env python3
"""Génère une page HTML autonome qui affiche un objet 3D (FORM POLY) en WebGL, avec les règles
du jeu (analysis/OBJECT_RENDER.md) : niveau de détail, rejet des faces vues de dos, tri du plus
loin au plus proche (pas de tampon de profondeur), teinte RANG choisie sur le CPU par face ou par
sommet selon le type de face, textures à texel 0xFF transparent, interpolation affine.

Même lecture et même éclairage que tools/object_render.py (rendu logiciel de référence).
La page contient les données ; elle s'ouvre directement dans un navigateur (pas de serveur).

Usage : python3 tools/object_viewer.py data/F-16DES.IFF [-o data/F-16DES_viewer.html]
"""

import argparse
import base64
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from object_render import Model, Shading  # noqa: E402

PAGE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "object_viewer.html")


def build(iff, palette, ambient_weight, light_weight, light):
    model = Model(iff)
    shading = Shading(palette, ambient_weight, light_weight, light)
    # APPROX (tables FADE absentes, voir object_render.Shading.darken) : 17 lignes de 256 octets,
    # ligne k = couleur après k pas d'assombrissement ; ligne 0 = identité.
    remap = bytearray()
    for steps in range(17):
        for c in range(256):
            remap.append(shading.darken(c, steps) & 0xFF)
    data = {
        "name": os.path.basename(iff),
        "vertices": model.vertices,
        "faces": model.faces,
        "levels": model.levels,
        "textures": [[n, w, h, base64.b64encode(bytes(p)).decode("ascii")] for n, w, h, p in model.textures],
        "uv": {str(k): [v[0], list(v[1])] for k, v in model.uv.items()},
        "faceNormal": model.face_normal,
        "vertexNormal": model.vertex_normal,
        "centroid": model.centroid,
        "centre": model.centre,
        "radius": model.radius,
        "palette": shading.rgb,
        "rang": shading.rang,
        "remap": base64.b64encode(bytes(remap)).decode("ascii"),
        "light": {"ambientWeight": ambient_weight, "lightWeight": light_weight, "dir": list(light)},
    }
    return data


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("iff")
    ap.add_argument("-o", "--out", default=None)
    ap.add_argument("--palette", default=None, help="PALETTE.IFF (défaut : à côté du fichier objet)")
    ap.add_argument("--light", type=float, nargs=3, default=(-10.0, -25.0, 100.0), metavar=("C0", "C1", "C2"))
    ap.add_argument("--ambient-weight", type=int, default=3)
    ap.add_argument("--light-weight", type=int, default=5)
    args = ap.parse_args()
    palette = args.palette or os.path.join(os.path.dirname(args.iff), "PALETTE.IFF")
    out = args.out or os.path.splitext(args.iff)[0] + "_viewer.html"
    data = build(args.iff, palette, args.ambient_weight, args.light_weight, tuple(args.light))
    page = open(PAGE, encoding="utf-8").read()
    page = page.replace("/*DATA*/null", json.dumps(data, separators=(",", ":")))
    page = page.replace("__TITLE__", data["name"])
    with open(out, "w", encoding="utf-8") as f:
        f.write(page)
    print("écrit", out, "(%d o)" % len(page))


if __name__ == "__main__":
    main()
