#!/usr/bin/env python3
"""Rendu logiciel d'un objet 3D (FORM APPR / FORM POLY) comme le fait STRIKE.EXE.

Reproduit le chemin lu dans l'assembleur le 2026-10-16 (voir analysis/OBJECT_RENDER.md) :
  - choix du niveau de détail (FORM DETA, LVLn) par la distance ;
  - rejet des faces vues de dos (sauf face double, octet 7 de VTRI) ;
  - tri des faces par profondeur du sommet le plus lointain, dessin du plus loin au plus proche ;
  - projection en perspective, textures affines (u = colonne, v = ligne, texel 0xFF transparent) ;
  - ombrage selon le type de face (octet 0 de VTRI) : 1/5 couleur unie non éclairée, 4 couleur
    éclairée par face, 3 et 8 éclairage par sommet (Gouraud), 6 texture non éclairée, 7 couleur
    éclairée + texture éclairée, 8 Gouraud + texture éclairée, 2 face translucide, 0 contour.

Approximations (données absentes du dépôt, marquées « APPROX » dans le code) :
  - tables d'assombrissement FADE du fichier « palfade » (couleurs hors des gammes RANG) ;
  - tables de translucidité (dword_72528) des faces de type 2 ;
  - échelle de projection du jeu (dword_72202) : réglable par --focal.
Le brouillard n'est pas reproduit.

Repère : les calculs suivent le jeu (Z-up : c0 = droite de l'avion, c1 = nez, c2 = haut).
Les angles de vue sont donnés pour Rémi : --yaw = cap d'où l'on regarde (0 = devant l'avion,
90 = à sa droite), --pitch = hauteur de l'œil (degrés, positif = au-dessus).

Usage : python3 tools/object_render.py data/F-16DES.IFF -o f16.png [--lod 0] [--yaw 35]
        [--pitch 20] [--dist 30] [--sheet]
"""

import argparse
import math
import os
import struct
import sys
import zlib

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from terrain_viewer import read_palette  # noqa: E402

WIDTH = 320
HEIGHT = 200


def iff_chunks(data, start, end, path=""):
    """Parcourt un IFF (tailles big-endian) et rend (chemin, tag, début, taille)."""
    pos = start
    while pos + 8 <= end:
        tag = data[pos:pos + 4].decode("latin1")
        size = struct.unpack(">I", data[pos + 4:pos + 8])[0]
        if tag in ("FORM", "CAT ", "LIST"):
            kind = data[pos + 8:pos + 12].decode("latin1")
            yield path, "FORM:" + kind, pos + 12, size - 4
            for item in iff_chunks(data, pos + 12, pos + 8 + size, path + "/" + kind):
                yield item
        else:
            yield path, tag, pos + 8, size
        pos += 8 + size + (size & 1)


class Model:
    """Apparence FORM POLY d'un fichier objet (formats : analysis/OBJECT_RENDER.md §1)."""

    def __init__(self, path):
        data = open(path, "rb").read()
        self.vertices = []
        self.faces = []
        self.levels = []
        self.textures = []
        self.uv = {}
        for where, tag, pos, size in iff_chunks(data, 0, len(data)):
            if "/APPR/POLY" not in where and tag != "FORM:POLY":
                continue
            body = data[pos:pos + size]
            if tag == "VERT":
                for k in range(0, size - size % 12, 12):
                    self.vertices.append(struct.unpack_from("<3i", body, k))
            elif tag == "VTRI":
                for k in range(0, size - size % 8, 8):
                    self.faces.append(tuple(body[k:k + 8]))
            elif tag.startswith("LVL") and where.endswith("/DETA"):
                distance = struct.unpack_from("<I", body, 0)[0]
                count = (size - 4) // 2
                faces = list(struct.unpack_from("<%dH" % count, body, 4))
                self.levels.append((int(tag[3]), distance, faces))
            elif tag == "TXMP":
                name = body[0:8].split(b"\0")[0].decode("latin1")
                w, h = struct.unpack_from("<2H", body, 8)
                self.textures.append((name, w, h, body[12:12 + w * h]))
            elif tag == "UVXY":
                for k in range(0, size - size % 8, 8):
                    face = body[k]
                    texture = body[k + 1]
                    self.uv[face] = (texture, tuple(body[k + 2:k + 8]))
        self.levels.sort()
        if not self.levels:
            self.levels = [(0, 0, list(range(len(self.faces))))]
        self.face_normal = []
        self.centroid = []
        normals = [[0.0, 0.0, 0.0] for _ in self.vertices]
        for f in self.faces:
            p0 = self.vertices[f[1]]
            p1 = self.vertices[f[2]]
            p2 = self.vertices[f[3]]
            # Mesh_ComputeEdgeVectors : N = (V0 − V2) × (V0 − V1), normalisée.
            a = sub(p0, p2)
            b = sub(p0, p1)
            n = normalize(cross(a, b))
            self.face_normal.append(n)
            self.centroid.append(tuple((p0[q] + p1[q] + p2[q]) / 3.0 for q in range(3)))
            # Mesh_FaceSetup : la normale de la face s'ajoute à celle de ses 3 sommets.
            for v in f[1:4]:
                for q in range(3):
                    normals[v][q] += n[q]
        self.vertex_normal = [normalize(n) for n in normals]
        lo = [min(v[q] for v in self.vertices) for q in range(3)]
        hi = [max(v[q] for v in self.vertices) for q in range(3)]
        self.centre = tuple((lo[q] + hi[q]) / 2.0 / 256.0 for q in range(3))
        self.radius = max(math.sqrt(sum((v[q] / 256.0 - self.centre[q]) ** 2 for q in range(3)))
                          for v in self.vertices)


def sub(a, b):
    return (a[0] - b[0], a[1] - b[1], a[2] - b[2])


def cross(a, b):
    return (a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0])


def dot(a, b):
    return a[0] * b[0] + a[1] * b[1] + a[2] * b[2]


def normalize(a):
    n = math.sqrt(dot(a, a))
    if n == 0:
        return (0.0, 0.0, 0.0)
    return (a[0] / n, a[1] / n, a[2] / n)


class Shading:
    """Palette, gammes RANG et éclairage (WRLD/LGHT, DATA_MODEL.md §6.8ter)."""

    def __init__(self, palette_path, ambient_weight, light_weight, light_dir):
        self.rgb, self.rang = read_palette(palette_path)
        total = ambient_weight + light_weight
        self.ambient = ambient_weight * 255 // total
        self.share = light_weight * 255 // total
        self.light = normalize(light_dir)

    def intensity(self, normal):
        """LightSet_FaceIntensity_2B54A : ambiante + max(0, A·N) × part de la 1re lumière."""
        d = dot(self.light, normal)
        v = self.ambient
        if d > 0:
            v += int(d * self.share)
        return min(255, v)

    def ramp_of(self, colour):
        """Table_LookupByRange : 1re gamme RANG telle que première ≤ couleur ≤ première + 3e champ
        (`cmp [bx+6],di / jg` puis `add ax,[bx+0Dh] / cmp ax,di / jl`), ou None."""
        for k, (first, _, span) in enumerate(self.rang):
            if first <= colour <= first + span:
                return k
        return None

    def shade(self, ramp, intensity, override):
        """Palette_ShadeIndexWithFog_2F24E sans brouillard : première teinte + (I × n + 128) >> 8,
        n = surcharge (décalage de la couleur dans sa gamme) si ≠ 0, sinon nombre de teintes."""
        first, count, _ = self.rang[ramp]
        n = override if override else count
        return first + ((intensity * n + 0x80) >> 8)

    def table_level(self, intensity):
        """Interp_ResolveNormalizedIndex sans brouillard (16 niveaux) : 0 = couleur inchangée,
        k > 0 = k-ième table d'assombrissement FADE."""
        level = ((intensity * 17 + 0x80) >> 8) - 1
        return 16 - max(0, level)

    def darken(self, colour, steps):
        """APPROX : la table FADE (fichier « palfade ») n'est pas dans le dépôt. Couleur d'une gamme
        RANG : on l'ombre dans sa gamme comme une face (intensité = 255 − 16 × steps) ; sinon
        couleur de la palette la plus proche de RVB × (1 − steps / 17)."""
        if steps <= 0:
            return colour
        ramp = self.ramp_of(colour)
        if ramp is not None:
            return self.shade(ramp, max(0, 255 - 16 * steps), colour - self.rang[ramp][0])
        f = 1.0 - steps / 17.0
        r = self.rgb[3 * colour] * f
        g = self.rgb[3 * colour + 1] * f
        b = self.rgb[3 * colour + 2] * f
        best = colour
        best_d = 1e9
        for k in range(1, 255):
            d = (self.rgb[3 * k] - r) ** 2 + (self.rgb[3 * k + 1] - g) ** 2 + (self.rgb[3 * k + 2] - b) ** 2
            if d < best_d:
                best_d = d
                best = k
        return best

    def lit_flat(self, colour, intensity, missing_ramp_is_zero=False):
        """Couleur d'une face éclairée (types 4, 7, 8) : gamme RANG si la couleur y est,
        sinon table d'assombrissement (types 4 et 7) ou gamme 0 (type 8, Render_DamageTintResolveAlt2)."""
        ramp = self.ramp_of(colour)
        if ramp is None:
            if missing_ramp_is_zero:
                return self.shade(0, intensity, 0)
            return self.darken(colour, self.table_level(intensity))
        return self.shade(ramp, intensity, colour - self.rang[ramp][0])


class Camera:
    def __init__(self, target, yaw, pitch, dist, focal):
        y = math.radians(yaw)
        p = math.radians(pitch)
        # yaw mesuré depuis le nez (+c1) vers la droite (+c0) ; pitch vers le haut (+c2).
        eye = (target[0] + dist * math.cos(p) * math.sin(y),
               target[1] + dist * math.cos(p) * math.cos(y),
               target[2] + dist * math.sin(p))
        self.eye = eye
        self.fwd = normalize(sub(target, eye))
        self.right = normalize(cross(self.fwd, (0.0, 0.0, 1.0)))
        self.up = cross(self.right, self.fwd)
        self.focal = focal

    def to_camera(self, p):
        d = sub(p, self.eye)
        return (dot(self.right, d), dot(self.fwd, d), dot(self.up, d))

    def project(self, c):
        x, d, y = c
        if d < 0.1:
            d = 0.1
        return (WIDTH / 2.0 + x * self.focal / d, HEIGHT / 2.0 - y * self.focal / d)


class Canvas:
    def __init__(self, background):
        self.px = [background] * (WIDTH * HEIGHT)

    def triangle(self, pts, attrs, shader):
        """Remplissage par lignes, attributs interpolés linéairement à l'écran (affine),
        comme Render_PolygonPrimitive_20848 / Render_MeshPrimitive_21085 / Render_MeshPrimitive_216F6."""
        (x0, y0), (x1, y1), (x2, y2) = pts
        area = (x1 - x0) * (y2 - y0) - (x2 - x0) * (y1 - y0)
        if area == 0:
            return
        ymin = max(0, int(math.ceil(min(y0, y1, y2) - 0.5)))
        ymax = min(HEIGHT - 1, int(math.floor(max(y0, y1, y2) - 0.5)))
        xmin_all = max(0, int(math.ceil(min(x0, x1, x2) - 0.5)))
        xmax_all = min(WIDTH - 1, int(math.floor(max(x0, x1, x2) - 0.5)))
        if ymin > ymax or xmin_all > xmax_all:
            return
        inv = 1.0 / area
        for yy in range(ymin, ymax + 1):
            py = yy + 0.5
            xs = []
            for (ax, ay), (bx, by) in (((x0, y0), (x1, y1)), ((x1, y1), (x2, y2)), ((x2, y2), (x0, y0))):
                if (ay <= py < by) or (by <= py < ay):
                    xs.append(ax + (py - ay) * (bx - ax) / (by - ay))
            if len(xs) < 2:
                continue
            xa = max(xmin_all, int(math.ceil(min(xs) - 0.5)))
            xb = min(xmax_all, int(math.floor(max(xs) - 0.5)))
            row = yy * WIDTH
            for xx in range(xa, xb + 1):
                px = xx + 0.5
                w1 = ((px - x0) * (y2 - y0) - (x2 - x0) * (py - y0)) * inv
                w2 = ((x1 - x0) * (py - y0) - (px - x0) * (y1 - y0)) * inv
                w0 = 1.0 - w1 - w2
                a = [w0 * attrs[0][q] + w1 * attrs[1][q] + w2 * attrs[2][q] for q in range(len(attrs[0]))]
                c = shader(a, self.px[row + xx])
                if c is not None:
                    self.px[row + xx] = c


def texture_sampler(texture, remap):
    name, w, h, pixels = texture

    def sample(a, under):
        u = int(a[0]) % w
        v = int(a[1]) % h
        t = pixels[v * w + u]
        if t == 0xFF:
            return None
        return remap(t)
    return sample


def render(model, shading, camera, lod, background):
    canvas = Canvas(background)
    level = [lv for lv in model.levels if lv[0] == lod]
    faces = level[0][2] if level else model.levels[0][2]
    cam_v = [camera.to_camera(tuple(c / 256.0 for c in v)) for v in model.vertices]
    scr_v = [camera.project(c) for c in cam_v]
    eye_local = tuple(e * 256.0 for e in camera.eye)
    queue = []
    for fi in faces:
        if fi >= len(model.faces):
            continue
        f = model.faces[fi]
        n = model.face_normal[fi]
        # loc_24EE2 : face simple vue de dos ((centre − œil) · N ≥ 0) → non dessinée.
        if not (f[7] & 1):
            if dot(sub(model.centroid[fi], eye_local), n) >= 0:
                continue
        key = max(cam_v[v][1] for v in f[1:4])
        queue.append((key, fi))
    queue.sort(reverse=True)
    for _, fi in queue:
        draw_face(canvas, model, shading, fi, scr_v)
    return canvas


def draw_face(canvas, model, shading, fi, scr_v):
    f = model.faces[fi]
    kind = f[0]
    colour = f[4]
    pts = [scr_v[v] for v in f[1:4]]
    n = model.face_normal[fi]
    if f[7] & 1:
        # Mesh_FacePrepareIndirect : face double vue de dos (sens des sommets à l'écran) → normale inversée.
        (ax, ay), (bx, by), (cx, cy) = pts
        if (bx - ax) * (cy - by) - (by - ay) * (cx - bx) < 0:
            n = (-n[0], -n[1], -n[2])
    face_i = shading.intensity(n)
    flat = [(0.0,), (0.0,), (0.0,)]
    tex = model.uv.get(fi)
    uv_attrs = None
    texture = None
    if tex is not None and tex[0] < len(model.textures):
        texture = model.textures[tex[0]]
        t = tex[1]
        uv_attrs = [(t[0] + 0.5, t[1] + 0.5), (t[2] + 0.5, t[3] + 0.5), (t[4] + 0.5, t[5] + 0.5)]
    if kind == 0:
        # loc_2978F : contour de la face (3 segments). Rendu ici en triangle plein fin : non traité.
        return
    if kind in (1, 5):
        canvas.triangle(pts, flat, lambda a, under: colour)
    elif kind == 2:
        # APPROX : table de translucidité dword_72528 + couleur × 256 absente → mélange 50 %.
        rgb = shading.rgb

        def glass(a, under):
            r = (rgb[3 * under] + rgb[3 * colour]) // 2
            g = (rgb[3 * under + 1] + rgb[3 * colour + 1]) // 2
            b = (rgb[3 * under + 2] + rgb[3 * colour + 2]) // 2
            return ("rgb", r, g, b)
        canvas.triangle(pts, flat, glass)
    elif kind == 4:
        c = shading.lit_flat(colour, face_i)
        canvas.triangle(pts, flat, lambda a, under: c)
    elif kind in (3, 8):
        ramp = shading.ramp_of(colour)
        if ramp is None:
            ramp = 0
            override = 0
        else:
            override = colour - shading.rang[ramp][0]
        vi = [shading.intensity(model.vertex_normal[v]) for v in f[1:4]]
        idx = [(float(shading.shade(ramp, i, override)),) for i in vi]
        canvas.triangle(pts, idx, lambda a, under: int(a[0]))
        if kind == 8 and texture is not None:
            steps = shading.table_level(sum(vi) // 3)
            canvas.triangle(pts, uv_attrs, texture_sampler(texture, lambda t: shading.darken(t, steps)))
    elif kind == 6:
        if texture is not None:
            canvas.triangle(pts, uv_attrs, texture_sampler(texture, lambda t: t))
    elif kind == 7:
        c = shading.lit_flat(colour, face_i)
        canvas.triangle(pts, flat, lambda a, under: c)
        if texture is not None:
            steps = shading.table_level(face_i)
            canvas.triangle(pts, uv_attrs, texture_sampler(texture, lambda t: shading.darken(t, steps)))
    else:
        canvas.triangle(pts, flat, lambda a, under: colour)


def to_rgb(canvas, shading, scale):
    rows = []
    for y in range(HEIGHT):
        row = []
        for x in range(WIDTH):
            c = canvas.px[y * WIDTH + x]
            if isinstance(c, tuple):
                rgb = c[1:4]
            else:
                rgb = tuple(shading.rgb[3 * c + q] for q in range(3))
            row.extend([rgb] * scale)
        for _ in range(scale):
            rows.append(row)
    return rows


def write_png(path, rows):
    h = len(rows)
    w = len(rows[0])
    raw = b"".join(b"\0" + bytes(v for px in row for v in px) for row in rows)

    def chunk(tag, body):
        return struct.pack(">I", len(body)) + tag + body + struct.pack(">I", zlib.crc32(tag + body))

    with open(path, "wb") as f:
        f.write(b"\x89PNG\r\n\x1a\n")
        f.write(chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 2, 0, 0, 0)))
        f.write(chunk(b"IDAT", zlib.compress(raw, 9)))
        f.write(chunk(b"IEND", b""))


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("iff")
    ap.add_argument("-o", "--out", default="object.png")
    ap.add_argument("--palette", default=None, help="PALETTE.IFF (défaut : à côté du fichier objet)")
    ap.add_argument("--lod", type=int, default=0, help="niveau de détail LVLn (0 = le plus détaillé)")
    ap.add_argument("--yaw", type=float, default=35.0)
    ap.add_argument("--pitch", type=float, default=20.0)
    ap.add_argument("--dist", type=float, default=0.0, help="distance de l'œil en m (0 = auto)")
    ap.add_argument("--focal", type=float, default=277.0, help="échelle de projection en pixels")
    ap.add_argument("--scale", type=int, default=3, help="agrandissement de l'image 320×200 (planche : 1)")
    ap.add_argument("--sheet", action="store_true", help="planche : 4 vues × 4 niveaux de détail")
    ap.add_argument("--background", type=int, default=0)
    # WRLD/LGHT de data/MISSION.IFF : ambiante 3, une lumière de poids 5, direction (−10, −25, 100).
    ap.add_argument("--light", type=float, nargs=3, default=(-10.0, -25.0, 100.0), metavar=("C0", "C1", "C2"))
    ap.add_argument("--ambient-weight", type=int, default=3)
    ap.add_argument("--light-weight", type=int, default=5)
    args = ap.parse_args()

    palette = args.palette or os.path.join(os.path.dirname(args.iff), "PALETTE.IFF")
    model = Model(args.iff)
    shading = Shading(palette, args.ambient_weight, args.light_weight, args.light)
    dist = args.dist or model.radius * 2.2
    print("%d sommets, %d faces, niveaux %s, %d textures" % (
        len(model.vertices), len(model.faces),
        ", ".join("LVL%d (%d m, %d faces)" % (k, d, len(f)) for k, d, f in model.levels),
        len(model.textures)))
    if args.sheet and args.scale == 3:
        args.scale = 1
    if not args.sheet:
        cam = Camera(model.centre, args.yaw, args.pitch, dist, args.focal)
        canvas = render(model, shading, cam, args.lod, args.background)
        write_png(args.out, to_rgb(canvas, shading, args.scale))
        return
    views = [(35.0, 20.0), (145.0, 15.0), (90.0, 0.0), (0.0, 89.0)]
    levels = [k for k, _, _ in model.levels]
    tiles = []
    for k in levels:
        line = []
        for yaw, pitch in views:
            cam = Camera(model.centre, yaw, pitch, dist, args.focal)
            line.append(to_rgb(render(model, shading, cam, k, args.background), shading, 1))
        tiles.append(line)
    rows = []
    for line in tiles:
        for y in range(HEIGHT):
            row = []
            for t in line:
                row.extend(t[y])
            rows.append(row)
    scaled = []
    for row in rows:
        big = []
        for px in row:
            big.extend([px] * args.scale)
        for _ in range(args.scale):
            scaled.append(big)
    write_png(args.out, scaled)


if __name__ == "__main__":
    main()
