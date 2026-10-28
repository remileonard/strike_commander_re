#!/usr/bin/env python3
"""Génère une page HTML autonome qui affiche un objet 3D (FORM POLY) en WebGL, avec les règles
du jeu (analysis/OBJECT_RENDER.md) : niveau de détail, rejet des faces vues de dos, tri du plus
loin au plus proche (pas de tampon de profondeur), teinte RANG choisie sur le CPU par face ou par
sommet selon le type de face, textures à texel 0xFF transparent, interpolation affine.

Même lecture et même éclairage que tools/object_render.py (rendu logiciel de référence).
La page contient les données ; elle s'ouvre directement dans un navigateur (pas de serveur).

Fumées (facultatif, SMOKE_SYSTEM.md) : avec --donnees <BIGTRE.TRE ou DATA>, la page embarque le jeu de
fumées (OBJECTS\SMOKESET.IFF), les tables FADE (PALETTE\PALFADE.IFF), le chunk SMOK de l'objet et le type de
fumée de chute (JINF), et dessine la traînée de l'objet en vol.

Usage : python3 tools/object_viewer.py data/F-16DES.IFF [-o data/F-16DES_viewer.html] [--donnees <DATA>]
"""

import argparse
import base64
import json
import os
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]

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


def b64(data):
    return base64.b64encode(bytes(data)).decode("ascii")


def smoke_data(iff):
    """Jeu de fumées, tables FADE, chunk SMOK (point en repère libRS) et type de chute de l'objet."""
    import sc_data as d
    import smoke_render as sr
    models, shapes = sr.load_smoke_set(os.path.join(d.GAME, "OBJECTS", "SMOKESET.IFF"))
    out_shapes = []
    for sh in shapes:
        images = []
        for k in range(len(d.shape_images(sh))):
            spans = list(d.image_spans(sh, k))
            if not spans:
                images.append([0, 0, 0, 0, "", ""])
                continue
            x0 = min(x for x, _, _ in spans)
            x1 = max(x + len(p) - 1 for x, _, p in spans)
            y0 = min(y for _, y, _ in spans)
            y1 = max(y for _, y, _ in spans)
            w = x1 - x0 + 1
            h = y1 - y0 + 1
            pix = bytearray(w * h)
            mask = bytearray(w * h)
            for x, y, p in spans:
                for j, c in enumerate(p):
                    pix[(y - y0) * w + x - x0 + j] = c
                    mask[(y - y0) * w + x - x0 + j] = 1
            images.append([w, h, x0, y0, b64(pix), b64(mask)])
        out_shapes.append({"half": sr.shape_half_size(sh), "images": images})
    smok = sr.smok_chunk(iff)
    return {
        "models": models,
        "shapes": out_shapes,
        "fade": b64(sr.fade_tables()),
        "smok": None if smok is None else {"type": smok[0], "point": [smok[1][0], smok[1][2], -smok[1][1]]},
        "fall": sr.jinf_smoke_type(iff),
    }


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("iff")
    ap.add_argument("-o", "--out", default=None)
    ap.add_argument("--palette", default=None, help="PALETTE.IFF (défaut : à côté du fichier objet)")
    ap.add_argument("--light", type=float, nargs=3, default=(-10.0, -25.0, 100.0), metavar=("C0", "C1", "C2"))
    ap.add_argument("--ambient-weight", type=int, default=3)
    ap.add_argument("--light-weight", type=int, default=5)
    ap.add_argument("--donnees", default=None, help="BIGTRE.TRE ou dossier DATA : ajoute les fumées")
    args = ap.parse_args()
    palette = args.palette or os.path.join(os.path.dirname(args.iff), "PALETTE.IFF")
    out = args.out or os.path.splitext(args.iff)[0] + "_viewer.html"
    data = build(args.iff, palette, args.ambient_weight, args.light_weight, tuple(args.light))
    data["smoke"] = smoke_data(args.iff) if args.donnees else None
    page = open(PAGE, encoding="utf-8").read()
    page = page.replace("/*DATA*/null", json.dumps(data, separators=(",", ":")))
    page = page.replace("__TITLE__", data["name"])
    with open(out, "w", encoding="utf-8") as f:
        f.write(page)
    print("écrit", out, "(%d o)" % len(page))


if __name__ == "__main__":
    main()
