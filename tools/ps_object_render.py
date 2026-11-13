#!/usr/bin/env python3
"""Rendu d'un objet 3D de Pacific Strike (OBJECTS\\<nom>.IFF) avec le moteur de tools/object_render.py.

Format constaté sur les données (OBJECTS\\CORSAIR.IFF), PAS relu dans PACIFIC.EXE :
  - FORM APPR / FORM POLY : VERT = sommets, 3 × i32 (÷ 256), comme Strike Commander ;
  - FORM TRIS : FACE = 8 octets par triangle (type, couleur, 3 × mot sommet) ;
               MAPS = 16 octets par face texturée (mot face, mot texture, 3 × (mot u, mot v)) ;
  - FORM QUAD : FACE = 10 octets (type, couleur, 4 × mot sommet) ; MAPS = 20 octets (face, texture, 4 × (u, v)) ;
  - FORM LINE : FACE = 6 octets (type, couleur, 2 × mot sommet) ; non dessinés ici ;
  - FORM DETA : LVLn = u32 distance, puis numéros de face ; faces numérotées triangles, puis quadrilatères,
    puis traits ; les listes ne se recouvrent pas (chaque niveau est un modèle complet) ;
  - FORM TXMS : TXMP = nom (8 octets), largeur, hauteur (mots), un mot (2B50h partout), puis un flux PKWARE
    DCL de largeur × (hauteur ÷ 2) octets : une ligne sur deux, chaque ligne dessinée deux fois. TXMA (animée) :
    nom, largeur, hauteur, nombre d'images, 4 octets, puis le flux ; seule la 1re image est décodée ici ;
  - ATTR : 9 octets par face, dans l'ordre des faces : mot numéro, lettre de forme (T, Q, L), masque de niveau de
    détail (1, 2, 4 : mêmes effectifs que LVL0 à LVL2), octet 4 = 0 ou 1 (24 faces), pris ici pour le drapeau
    « double face » (rôle supposé), 4 octets à 0.
Les types de face sont dessinés avec les règles de Strike Commander (object_render.py). Un quadrilatère est coupé
en deux triangles (a, b, c) et (a, c, d).

Usage : python3 tools/ps_object_render.py <OBJECTS/CORSAIR.IFF> --palette <PALETTE/PALETTE.IFF> -o corsair.png
        [--lod 0] [--yaw 35] [--pitch 20] [--dist 0] [--scale 3]
"""

import argparse
import math
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import object_render as orr  # noqa: E402
import pkware_dcl  # noqa: E402


def read_texture(body, animated):
    name = body[0:8].split(b"\0")[0].decode("latin1")
    w, h = struct.unpack_from("<2H", body, 8)
    start = 18 if animated else 14
    half = pkware_dcl.explode(body[start:])
    rows = h // 2
    pixels = bytearray()
    for y in range(h):
        r = min(y // 2, rows - 1)
        pixels += half[r * w:(r + 1) * w]
    return (name, w, h, bytes(pixels))


class PSModel(orr.Model):
    """Même interface que object_render.Model, lue dans le format de Pacific Strike."""

    def __init__(self, path, data=None):
        """path : fichier objet ; data : son contenu déjà lu (alors path ne sert pas)."""
        if data is None:
            data = open(path, "rb").read()
        self.vertices = []
        self.faces = []
        self.levels = []
        self.textures = []
        self.uv = {}
        tris = []
        quads = []
        lines = 0
        tri_maps = {}
        quad_maps = {}
        levels = []
        attr = {}
        for where, tag, pos, size in orr.iff_chunks(data, 0, len(data)):
            if "/APPR/POLY" not in where:
                continue
            body = data[pos:pos + size]
            if tag == "VERT":
                for k in range(0, size - size % 12, 12):
                    self.vertices.append(struct.unpack_from("<3i", body, k))
            elif tag == "FACE" and where.endswith("/TRIS"):
                for k in range(0, size - size % 8, 8):
                    tris.append(struct.unpack_from("<BB3H", body, k))
            elif tag == "FACE" and where.endswith("/QUAD"):
                for k in range(0, size - size % 10, 10):
                    quads.append(struct.unpack_from("<BB4H", body, k))
            elif tag == "FACE" and where.endswith("/LINE"):
                lines += size // 6
            elif tag == "MAPS" and where.endswith("/TRIS"):
                for k in range(0, size - size % 16, 16):
                    m = struct.unpack_from("<8H", body, k)
                    tri_maps[m[0]] = (m[1], m[2:8])
            elif tag == "MAPS" and where.endswith("/QUAD"):
                for k in range(0, size - size % 20, 20):
                    m = struct.unpack_from("<10H", body, k)
                    quad_maps[m[0]] = (m[1], m[2:10])
            elif tag.startswith("LVL") and where.endswith("/DETA"):
                distance = struct.unpack_from("<I", body, 0)[0]
                count = (size - 4) // 2
                levels.append((int(tag[3]), distance, list(struct.unpack_from("<%dH" % count, body, 4))))
            elif tag == "ATTR":
                for k in range(0, size - size % 9, 9):
                    attr[struct.unpack_from("<H", body, k)[0]] = body[k + 4]
            elif tag in ("TXMP", "TXMA"):
                self.textures.append(read_texture(body, tag == "TXMA"))
        # Numéro de face du fichier -> triangles du modèle.
        mapping = {}
        for k, (kind, colour, a, b, c) in enumerate(tris):
            mapping[k] = [len(self.faces)]
            self.faces.append((kind, a, b, c, colour, 0, 0, attr.get(k, 0)))
            if k in tri_maps:
                tex, uv = tri_maps[k]
                self.uv[len(self.faces) - 1] = (tex, uv)
        for k, (kind, colour, a, b, c, d) in enumerate(quads):
            number = len(tris) + k
            mapping[number] = [len(self.faces), len(self.faces) + 1]
            self.faces.append((kind, a, b, c, colour, 0, 0, attr.get(number, 0)))
            self.faces.append((kind, a, c, d, colour, 0, 0, attr.get(number, 0)))
            if k in quad_maps:
                tex, uv = quad_maps[k]
                self.uv[len(self.faces) - 2] = (tex, (uv[0], uv[1], uv[2], uv[3], uv[4], uv[5]))
                self.uv[len(self.faces) - 1] = (tex, (uv[0], uv[1], uv[4], uv[5], uv[6], uv[7]))
        for lod, distance, numbers in sorted(levels):
            faces = []
            for n in numbers:
                faces += mapping.get(n, [])
            self.levels.append((lod, distance, faces))
        if not self.levels:
            self.levels = [(0, 0, list(range(len(self.faces))))]
        self.face_normal = []
        self.centroid = []
        normals = [[0.0, 0.0, 0.0] for _ in self.vertices]
        for f in self.faces:
            p0 = self.vertices[f[1]]
            p1 = self.vertices[f[2]]
            p2 = self.vertices[f[3]]
            n = orr.normalize(orr.cross(orr.sub(p0, p2), orr.sub(p0, p1)))
            self.face_normal.append(n)
            self.centroid.append(tuple((p0[q] + p1[q] + p2[q]) / 3.0 for q in range(3)))
            for v in f[1:4]:
                for q in range(3):
                    normals[v][q] += n[q]
        self.vertex_normal = [orr.normalize(n) for n in normals]
        used = sorted({v for lv in self.levels[:1] for fi in lv[2] for v in self.faces[fi][1:4]})
        pts = [self.vertices[v] for v in used] or self.vertices
        lo = [min(v[q] for v in pts) for q in range(3)]
        hi = [max(v[q] for v in pts) for q in range(3)]
        self.centre = tuple((lo[q] + hi[q]) / 2.0 / 256.0 for q in range(3))
        self.radius = max(math.sqrt(sum((v[q] / 256.0 - self.centre[q]) ** 2 for q in range(3))) for v in pts)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("iff")
    ap.add_argument("-o", "--out", default="object.png")
    ap.add_argument("--palette", required=True)
    ap.add_argument("--lod", type=int, default=0)
    ap.add_argument("--yaw", type=float, default=35.0)
    ap.add_argument("--pitch", type=float, default=20.0)
    ap.add_argument("--dist", type=float, default=0.0)
    ap.add_argument("--focal", type=float, default=277.0)
    ap.add_argument("--scale", type=int, default=3)
    ap.add_argument("--background", type=int, default=0)
    args = ap.parse_args()
    model = PSModel(args.iff)
    shading = orr.Shading(args.palette, 3, 5, (-10.0, -25.0, 100.0))
    dist = args.dist or model.radius * 2.6
    camera = orr.Camera(model.centre, args.yaw, args.pitch, dist, args.focal)
    canvas = orr.render(model, shading, camera, args.lod, args.background)
    orr.write_png(args.out, orr.to_rgb(canvas, shading, args.scale))
    print(f"{args.out} : {len(model.vertices)} sommets, {len(model.faces)} triangles, "
          f"{len(model.textures)} textures, niveaux {[(lv[0], lv[1], len(lv[2])) for lv in model.levels]}")


if __name__ == "__main__":
    main()
