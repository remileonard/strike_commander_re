#!/usr/bin/env python3
"""Carte d'une mission de Pacific Strike : terrain, zones AREA, points SPOT, objets PART, trajets des scripts.

Données : la mission est lue par tools/ps_mission_dump.py (positions en repère libRealSpace, mètres :
x = c0, y = c2 = altitude, z = −c1) ; le terrain TERRAIN\\<monde>.ZIP par tools/terrain_map.py (altitudes ELV,
1000 m entre deux sommets, carte centrée sur 0). Le nord est en haut de l'image, c'est −Z en libRealSpace
(constat : la région .TRI de la piste d'Ewa est en c1 = −36 819 à −35 220, l'objet RWAYS de PRLH-M1 en z = +36 670).

Usage : python3 tools/ps_mission_map.py PACIFIC.DAT PRLH-M1 dossier_sortie
        écrit <mission>_carte.png (vue d'ensemble), <mission>_terrain.png (vue de l'île) et <mission>_base.png
        (agrandissement de la base aérienne).
"""
import argparse
import math
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np  # noqa: E402
from PIL import Image  # noqa: E402
from PIL import ImageDraw  # noqa: E402
from PIL import ImageFont  # noqa: E402

import pkware_dcl  # noqa: E402
import ps_mission_dump as pmd  # noqa: E402
import sc_data  # noqa: E402
import terrain_map as tm  # noqa: E402
from tri_map import read_pak  # noqa: E402
from tri_map import read_region_ps  # noqa: E402

FONT = "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf"
FONT_BOLD = "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"

JAPAN = (200, 30, 30)
US = (25, 70, 190)
ZONE_COLOURS = [
    (255, 200, 40),
    (255, 120, 200),
    (120, 230, 255),
    (180, 255, 120),
]
PLAYER_ROUTE = (255, 255, 255)
SHIP_ROUTE = (40, 40, 40)


def font(size, bold=False):
    try:
        return ImageFont.truetype(FONT_BOLD if bold else FONT, size)
    except OSError:
        return ImageFont.load_default()


class Terrain:
    def __init__(self, archive, world):
        data, index = sc_data.tre_index(archive)
        off, size = index["DATA/TERRAIN/%s.ZIP" % world.upper()]
        pak = pkware_dcl.explode(data[off:off + size])
        top = read_pak(pak)
        cells = tm.read_elevations(pak, top, 1)
        self.grid = int(math.isqrt(len(cells)))
        n = cells[0][0]
        self.spacing = 20000 / n
        height, _ = tm.assemble(cells, self.grid)
        self.height = np.array(height, dtype=np.float32)
        self.half = self.grid * 20000 / 2
        start, end = top[4]
        tri = pak[start:end]
        self.runways = []
        for a, b in read_pak(tri):
            if b > a:
                self.runways.append(read_region_ps(tri, a, b))

    def sample(self, x, north):
        """Altitude interpolée ; ligne 0 de la grille = nord (+c1), colonne 0 = ouest."""
        fi = (self.half - north) / self.spacing
        fj = (x + self.half) / self.spacing
        side = self.height.shape[0]
        i0 = np.clip(np.floor(fi).astype(int), 0, side - 2)
        j0 = np.clip(np.floor(fj).astype(int), 0, side - 2)
        ti = np.clip(fi - i0, 0, 1)
        tj = np.clip(fj - j0, 0, 1)
        h = self.height
        top = h[i0, j0] * (1 - tj) + h[i0, j0 + 1] * tj
        bottom = h[i0 + 1, j0] * (1 - tj) + h[i0 + 1, j0 + 1] * tj
        return top * (1 - ti) + bottom * ti


class View:
    """Fenêtre de la carte : x de x0 à x1, nord (−z) de n0 à n1, en mètres."""

    def __init__(self, x0, x1, n0, n1, px_per_km):
        self.x0 = x0
        self.x1 = x1
        self.n0 = n0
        self.n1 = n1
        self.scale = px_per_km / 1000.0
        self.w = int((x1 - x0) * self.scale)
        self.h = int((n1 - n0) * self.scale)

    def px(self, x, z):
        north = -z
        return ((x - self.x0) * self.scale, (self.n1 - north) * self.scale)


def smooth(h, radius):
    """Moyenne glissante (deux passes par axe) : adoucit la grille de 1000 m pour la lecture de la carte."""
    if radius < 2:
        return h
    kernel = np.ones(radius, dtype=np.float32) / radius
    for _ in range(2):
        h = np.apply_along_axis(blur_line, 1, h, kernel, radius)
        h = np.apply_along_axis(blur_line, 0, h, kernel, radius)
    return h


def blur_line(line, kernel, radius):
    return np.convolve(np.pad(line, radius, mode="edge"), kernel, mode="same")[radius:-radius]


def terrain_image(terrain, view):
    xs = view.x0 + (np.arange(view.w) + 0.5) / view.scale
    ns = view.n1 - (np.arange(view.h) + 0.5) / view.scale
    xx, nn = np.meshgrid(xs, ns)
    h = smooth(terrain.sample(xx, nn), int(view.scale * 700))
    step = 1.0 / view.scale
    dx = (np.roll(h, -1, axis=1) - np.roll(h, 1, axis=1)) / (2 * step)
    dn = (np.roll(h, 1, axis=0) - np.roll(h, -1, axis=0)) / (2 * step)
    shade = np.clip(1.0 - 1.6 * (dx - dn), 0.45, 1.25)
    rgb = np.zeros((view.h, view.w, 3), dtype=np.float32)
    flat = h.ravel()
    colours = np.array([tm.hypso(v) for v in flat], dtype=np.float32).reshape(view.h, view.w, 3)
    land = h > 0
    rgb[:] = colours
    rgb[land] *= shade[land][:, None]
    return Image.fromarray(np.clip(rgb, 0, 255).astype(np.uint8))


def draw_runways(draw, terrain, view):
    for r in terrain.runways:
        pts = []
        for v in r["vertices"]:
            pts.append(view.px(v["x"], -v["z"]))
        xs = [p[0] for p in pts]
        ys = [p[1] for p in pts]
        draw.rectangle([min(xs), min(ys), max(xs), max(ys)], fill=(90, 90, 90), outline=(30, 30, 30))


def dashed_circle(draw, centre, radius, colour, width=3, dash=10):
    cx, cy = centre
    steps = max(24, int(2 * math.pi * radius / dash))
    for k in range(0, steps, 2):
        a0 = 2 * math.pi * k / steps
        a1 = 2 * math.pi * (k + 1) / steps
        draw.line([(cx + radius * math.cos(a0), cy + radius * math.sin(a0)),
                   (cx + radius * math.cos(a1), cy + radius * math.sin(a1))], fill=colour, width=width)


def arrow(draw, a, b, colour, width=3, head=12):
    draw.line([a, b], fill=colour, width=width)
    ang = math.atan2(b[1] - a[1], b[0] - a[0])
    p1 = (b[0] - head * math.cos(ang - 0.4), b[1] - head * math.sin(ang - 0.4))
    p2 = (b[0] - head * math.cos(ang + 0.4), b[1] - head * math.sin(ang + 0.4))
    draw.polygon([b, p1, p2], fill=colour)


def label(draw, xy, text, colour=(0, 0, 0), size=13, bold=False, anchor="la"):
    f = font(size, bold)
    x, y = xy
    for ox in (-1, 0, 1):
        for oy in (-1, 0, 1):
            if ox != 0 or oy != 0:
                draw.text((x + ox, y + oy), text, font=f, fill=(255, 255, 255), anchor=anchor)
    draw.text((x, y), text, font=f, fill=colour, anchor=anchor)


def kind(obj):
    name = obj["nom"]
    if name in ("BB", "DD"):
        return "navire"
    if name in ("VAL", "KATE", "KATETORP", "F4F3"):
        return "avion"
    if name.startswith("RWAY"):
        return "piste"
    return "bâtiment"


def heading_dir(cap):
    """Cap du fichier (0 = nord, en degrés, sens horaire) → direction à l'écran."""
    a = math.radians(cap)
    return math.sin(a), -math.cos(a)


def draw_object(draw, view, obj, size=7, text=True, text_size=12, offset=None):
    x, y = view.px(obj["monde"][0], obj["monde"][2])
    colour = JAPAN if obj["camp"] == 255 else US
    k = kind(obj)
    if k == "avion":
        dx, dy = heading_dir(obj["cap"])
        tip = (x + dx * size * 1.6, y + dy * size * 1.6)
        left = (x - dx * size + dy * size, y - dy * size - dx * size)
        right = (x - dx * size - dy * size, y - dy * size + dx * size)
        outline = (255, 255, 255) if obj["cast"] != "PLAYER" else (255, 230, 0)
        draw.polygon([tip, left, right], fill=colour, outline=outline)
        if obj["cast"] == "PLAYER":
            draw.ellipse([x - size * 2, y - size * 2, x + size * 2, y + size * 2], outline=(255, 230, 0), width=3)
    elif k == "navire":
        dx, dy = heading_dir(obj["cap"])
        length = size * 2.2
        wide = size * 0.7
        pts = [
            (x + dx * length, y + dy * length),
            (x + dy * wide, y - dx * wide),
            (x - dx * length + dy * wide, y - dy * length - dx * wide),
            (x - dx * length - dy * wide, y - dy * length + dx * wide),
            (x - dy * wide, y + dx * wide),
        ]
        draw.polygon(pts, fill=colour, outline=(255, 255, 255))
    elif k == "piste":
        return
    else:
        s = size * 0.8
        draw.rectangle([x - s, y - s, x + s, y + s], fill=colour, outline=(255, 255, 255))
    if text:
        dx = size + 3
        dy = -text_size // 2 - 1
        anchor = "la"
        if offset is not None:
            dx, dy, anchor = offset
        label(draw, (x + dx, y + dy), "n°%d %s" % (obj["numéro"], obj["nom"]), colour, text_size, False, anchor)


def spot_marker(draw, view, spot, name, colour=(0, 0, 0), left=False):
    x, y = view.px(spot["monde"][0], spot["monde"][2])
    s = 7
    draw.polygon([(x, y - s), (x + s, y), (x, y + s), (x - s, y)], fill=(255, 255, 255), outline=colour)
    if left:
        label(draw, (x - 10, y - 8), name, colour, 13, True, "ra")
    else:
        label(draw, (x + 9, y + 2), name, colour, 13, True)
    return x, y


def render_overview(m, terrain, out):
    view = View(-29000, 20000, -56000, -12000, 22)
    img = terrain_image(terrain, view)
    draw = ImageDraw.Draw(img)
    draw_runways(draw, terrain, view)
    scenes_by_zone = {}
    for s in m["scènes"]:
        scenes_by_zone[s["zone"]] = s["rang"]
    for z in m["zones"]:
        c = view.px(z["ref"][0], z["ref"][2])
        r = z["valeurs"][1] * view.scale
        colour = ZONE_COLOURS[z["rang"] % len(ZONE_COLOURS)]
        dashed_circle(draw, c, r, colour, 4)
        name = z["nom"]
        text = "zone %d « %s » — scène %s" % (z["rang"], name, scenes_by_zone.get(z["rang"], "?"))
        label(draw, (c[0], c[1] - r - 4), text, (0, 0, 0), 16, True, "md")
    spots = m["points"]
    # Trajet du joueur (programme 0) : décollage (SPOT 1), SPOT 4, SPOT 2, atterrissage (SPOT 2 et 1).
    route = [spots[1], spots[4], spots[2], spots[1]]
    pts = [view.px(s["monde"][0], s["monde"][2]) for s in route]
    for k in range(len(pts) - 1):
        a = pts[k]
        b = pts[k + 1]
        if k == 0:
            b = (b[0] - 12, b[1] - 18)
        if k == 1:
            a = (a[0] - 12, a[1] + 18)
        arrow(draw, a, b, PLAYER_ROUTE, 4, 16)
    # Trajet du cuirassé Nevada (programme 15) : SPOT 5 puis SPOT 6.
    nevada = [o for o in m["objets"] if o["numéro"] == 23][0]
    nev = view.px(nevada["monde"][0], nevada["monde"][2])
    s5 = view.px(spots[5]["monde"][0], spots[5]["monde"][2])
    s6 = view.px(spots[6]["monde"][0], spots[6]["monde"][2])
    arrow(draw, nev, s5, SHIP_ROUTE, 3, 12)
    arrow(draw, s5, s6, SHIP_ROUTE, 3, 12)
    # Torpilleurs : cible OP_SET_OBJ_DESTROY_TARGET 23 (le Nevada).
    for o in m["objets"]:
        if o["nom"] in ("KATE", "KATETORP") and o["numéro"] in (27, 28):
            p = view.px(o["monde"][0], o["monde"][2])
            arrow(draw, p, (nev[0] + 18, nev[1] - 6), JAPAN, 2, 10)
    for k in (2, 4, 5, 6):
        spot_marker(draw, view, spots[k], "SPOT %d" % k, (0, 0, 0), k == 2)
    # Étapes du plan de vol du joueur.
    p4 = pts[1]
    p2 = pts[2]
    label(draw, (p4[0] - 330, p4[1] - 40), "② SPOT 4 : « defend USS Nevada »", (0, 0, 0), 13, True)
    label(draw, ((p4[0] + p2[0]) / 2 - 40, (p4[1] + p2[1]) / 2 + 10), "③ SPOT 2 : « return to base »", (0, 0, 0), 13, True)
    label(draw, (16, pts[0][1] - 76), "① décollage (SPOT 1)", (0, 0, 0), 13, True)
    label(draw, (16, pts[0][1] - 58), "④ atterrissage (SPOT 2, 1) : « land »", (0, 0, 0), 13, True)
    groups = {
        "wing": [],
        "kate": [],
    }
    for o in m["objets"]:
        if kind(o) in ("bâtiment", "piste"):
            continue
        x = o["monde"][0]
        z = o["monde"][2]
        if -15000 <= x <= -12800 and 35050 <= z <= 37050:
            continue
        if o["nom"] == "F4F3" and o["numéro"] >= 40:
            draw_object(draw, view, o, 7, False)
            groups["wing"].append(o)
            continue
        if o["nom"] in ("KATE", "KATETORP"):
            draw_object(draw, view, o, 7, False)
            groups["kate"].append(o)
            continue
        offset = None
        if o["numéro"] == 3:
            offset = (0, -24, "la")
        if o["numéro"] == 4:
            offset = (0, 10, "la")
        if o["numéro"] == 27:
            offset = (-14, -20, "ra")
        if o["numéro"] == 28:
            offset = (-14, 4, "ra")
        draw_object(draw, view, o, 8, True, 13, offset)
    wing = groups["wing"]
    if wing:
        p = view.px(wing[-1]["monde"][0], wing[-1]["monde"][2])
        label(draw, (p[0] + 12, p[1] - 4), "n°40 à 47 F4F3 (blue2 à blue10)", US, 13)
    kate = groups["kate"]
    if kate:
        p = view.px(kate[-1]["monde"][0], kate[-1]["monde"][2])
        label(draw, (p[0] + 10, p[1] + 8), "n°27 à 35", JAPAN, 13)
        label(draw, (p[0] + 10, p[1] + 24), "KATE, KATETORP", JAPAN, 13)
    # Cadre de l'agrandissement de la base.
    a = view.px(-15000, 35050)
    b = view.px(-12800, 37050)
    draw.rectangle([a[0], a[1], b[0], b[1]], outline=(0, 0, 0), width=2)
    label(draw, (b[0] + 4, a[1] - 2), "base : voir l'agrandissement", (0, 0, 0), 12)
    # Rose des vents et échelle.
    label(draw, (view.w - 40, 16), "N (−Z)", (0, 0, 0), 15, True, "ma")
    arrow(draw, (view.w - 40, 80), (view.w - 40, 40), (0, 0, 0), 3, 12)
    x0 = 20
    y0 = view.h - 24
    km = 5
    draw.rectangle([x0, y0, x0 + km * 1000 * view.scale, y0 + 6], fill=(0, 0, 0))
    label(draw, (x0, y0 - 18), "%d km" % km, (0, 0, 0), 13, True)
    img.save(out)
    return out


def render_base(m, terrain, out):
    view = View(-15000, -12800, -37050, -35050, 400)
    img = terrain_image(terrain, view)
    draw = ImageDraw.Draw(img)
    draw_runways(draw, terrain, view)
    z = m["zones"][0]
    # Bout sud de la piste : objets serrés, étiquetés dans une colonne à gauche avec un trait de rappel.
    callouts = []
    for k in range(2):
        s = m["points"][k]
        spot_marker(draw, view, s, "", (0, 0, 0))
        callouts.append((view.px(s["monde"][0], s["monde"][2]), "SPOT %d" % k, (0, 0, 0)))
    for o in m["objets"]:
        x, y = view.px(o["monde"][0], o["monde"][2])
        if kind(o) == "piste":
            draw.line([(x - 26, y), (x + 26, y)], fill=(255, 255, 255), width=2)
            callouts.append(((x - 26, y), "n°%d %s" % (o["numéro"], o["nom"]), US))
            continue
        if not (0 <= x < view.w and 0 <= y < view.h):
            continue
        if o["nom"] == "F4F3":
            draw_object(draw, view, o, 9, False)
            name = "n°%d F4F3 %s" % (o["numéro"], o["cast"])
            callouts.append(((x, y), name, US))
            continue
        offset = None
        if o["numéro"] == 11:
            offset = (0, 12, "ma")
        draw_object(draw, view, o, 9, True, 13, offset)
    callouts.sort(key=lambda c: c[0][1])
    y = 548
    for (px, py), text, colour in callouts:
        label(draw, (40, y), text, colour, 13, True)
        draw.line([(215, y + 8), (px, py)], fill=(30, 30, 30), width=1)
        y += 19
    c = view.px(z["ref"][0], z["ref"][2])
    draw.line([(c[0] - 10, c[1]), (c[0] + 10, c[1])], fill=ZONE_COLOURS[0], width=3)
    draw.line([(c[0], c[1] - 10), (c[0], c[1] + 10)], fill=ZONE_COLOURS[0], width=3)
    label(draw, (c[0], c[1] - 28), "référence de la zone 0", (120, 80, 0), 12, False, "ma")
    label(draw, (view.w - 40, 16), "N (−Z)", (0, 0, 0), 15, True, "ma")
    arrow(draw, (view.w - 40, 80), (view.w - 40, 40), (0, 0, 0), 3, 12)
    x0 = view.w - 120
    y0 = view.h - 24
    draw.rectangle([x0, y0, x0 + 200 * view.scale, y0 + 6], fill=(0, 0, 0))
    label(draw, (x0, y0 - 18), "200 m", (0, 0, 0), 13, True)
    img.save(out)
    return out


def render_island(m, terrain, out):
    view = View(-60000, 60000, -75000, 25000, 6)
    img = terrain_image(terrain, view)
    draw = ImageDraw.Draw(img)
    a = view.px(-29000, 12000)
    b = view.px(20000, 56000)
    draw.rectangle([a[0], a[1], b[0], b[1]], outline=(0, 0, 0), width=3)
    label(draw, (a[0], b[1] + 4), "carte de la mission", (0, 0, 0), 14, True)
    label(draw, (view.w - 30, 12), "N (−Z)", (0, 0, 0), 14, True, "ma")
    arrow(draw, (view.w - 30, 66), (view.w - 30, 32), (0, 0, 0), 3, 10)
    img.save(out)
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("archive")
    ap.add_argument("mission")
    ap.add_argument("sortie")
    args = ap.parse_args()
    m = pmd.load(args.archive, args.mission)
    terrain = Terrain(args.archive, m["monde"])
    os.makedirs(args.sortie, exist_ok=True)
    base = os.path.join(args.sortie, args.mission.lower())
    print(render_island(m, terrain, base + "_terrain.png"))
    print(render_overview(m, terrain, base + "_carte.png"))
    print(render_base(m, terrain, base + "_base.png"))


if __name__ == "__main__":
    main()
