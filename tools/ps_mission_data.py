#!/usr/bin/env python3
"""Lecture d'une mission de Pacific Strike pour la visionneuse tools/ps_mission_viewer.py.

Archive : PACIFIC.DAT lu une fois (sc_data.tre_index). Mission : tools/ps_mission_dump.py, complétée ici par les
renvois (qui lance chaque programme, qui active chaque objet, emplois des points SPOT, variables écrites et lues,
liens des scripts d'un objet). Terrain : monde MISSIONS\\<monde>.IFF → chunk TERA → TERRAIN\\<nom>.ZIP, altitudes ELV
(tools/terrain_map.py) et pistes .TRI (tools/tri_map.py).

Repère libRealSpace, en mètres : x = c0, y = c2 (altitude), z = −c1 ; le nord est vers −Z.
"""
import math
import os
import sys
import threading

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np  # noqa: E402

import object_render as orr  # noqa: E402
import pkware_dcl  # noqa: E402
import ps_mission_dump as pmd  # noqa: E402
import sc_data  # noqa: E402
import terrain_map as tm  # noqa: E402
from tri_map import read_pak  # noqa: E402
from tri_map import read_region_ps  # noqa: E402

CELL_SIZE = 20000
PIXELS_PER_KM = 8

# Instructions de variable : celles qui écrivent la variable, celles qui la lisent.
VAR_WRITE = {18, 34, 35, 38, 39, 80, 81, 82, 83, 85, 86}
VAR_READ = {17, 18, 33, 34, 35, 37, 38, 39, 41, 43, 45, 47, 49, 66, 67, 69, 85, 86}
# Instructions dont un argument désigne un point SPOT (rang de l'argument) ou un objet (numéro, 255 = soi).
SPOT_ARGS = {
    161: [0],
    162: [0, 1],
    165: [0],
    151: [0],
}
OBJECT_ARGS = {
    144: [0],
    145: [0],
    147: [0],
    148: [0],
    149: [0],
    152: [0],
    167: [0],
    168: [0],
    170: [0],
    173: [0],
    184: [0],
    185: [0],
    190: [0],
}
# Points SPOT pris dans le repère d'un objet (README.md de Pacific, § 6 : 153, 154, 157) et point visé de 154.
LOCAL_SPOT_ARGS = {
    153: [1],
    154: [1],
    157: [2],
}
TARGET_SPOT_ARGS = {
    154: [3],
}
SCRIPT_SLOTS = [
    "activation",
    "mise à jour",
    "destruction",
    "début de mission",
]
SCENE_SLOTS = [
    "activation",
    "mise à jour",
    "sortie",
]


class Archive:
    def __init__(self, path):
        self.path = path
        self.tre = sc_data.tre_index(path)
        self.data, self.index = self.tre
        self.terrains = {}
        self.classes = {}
        self.lock = threading.Lock()

    def entry(self, key):
        off, size = self.index[key]
        return self.data[off:off + size]

    def missions(self):
        out = []
        for key in sorted(self.index):
            if not key.startswith("DATA/MISSIONS/"):
                continue
            body = self.entry(key)
            if body[8:12] != b"MISN":
                continue
            name = key[len("DATA/MISSIONS/"):-4]
            title = ""
            for where, tag, pos, size in orr.iff_chunks(body, 0, len(body)):
                if where == "/MISN" and tag == "NAME":
                    title = body[pos:pos + size].split(b"\0")[0].decode("latin1")
                    break
            out.append({"nom": name, "titre": title})
        return out

    def terrain_name(self, world):
        body = self.entry("DATA/MISSIONS/%s.IFF" % world.upper())
        for where, tag, pos, size in orr.iff_chunks(body, 0, len(body)):
            if tag == "TERA":
                return body[pos:pos + size].split(b"\0")[0].decode("latin1").upper()
        return world.upper()

    def terrain(self, name):
        with self.lock:
            if name not in self.terrains:
                self.terrains[name] = Terrain(self.entry("DATA/TERRAIN/%s.ZIP" % name))
            return self.terrains[name]

    def object_class(self, name):
        """FORM de classe de OBJECTS\\<nom>.IFF (JETP, SHIP, GRND…) et octet du chunk KIND."""
        if name in self.classes:
            return self.classes[name]
        found = ("", -1)
        key = "DATA/OBJECTS/%s.IFF" % name.upper()
        if key in self.index:
            body = self.entry(key)
            form = ""
            kind = -1
            for where, tag, pos, size in orr.iff_chunks(body, 0, len(body)):
                parts = where.split("/")
                if form == "" and len(parts) >= 4 and parts[1] == "REAL" and parts[2] == "OBJT":
                    form = parts[3]
                if tag == "KIND" and size > 0 and kind < 0:
                    kind = body[pos]
            found = (form, kind)
        self.classes[name] = found
        return found


class Terrain:
    def __init__(self, compressed):
        pak = pkware_dcl.explode(compressed)
        top = read_pak(pak)
        cells = tm.read_elevations(pak, top, 1)
        self.grid = int(math.isqrt(len(cells)))
        self.n = cells[0][0]
        self.spacing = CELL_SIZE / self.n
        height, _ = tm.assemble(cells, self.grid)
        self.height = np.array(height, dtype=np.float32)
        self.half = self.grid * CELL_SIZE / 2
        start, end = top[4]
        tri = pak[start:end]
        self.runways = []
        for a, b in read_pak(tri):
            if b > a:
                region = read_region_ps(tri, a, b)
                xs = [v["x"] for v in region["vertices"]]
                # Région .TRI : z du fichier = c1 (nord) ; en libRealSpace z = −c1.
                zs = [-v["z"] for v in region["vertices"]]
                self.runways.append({
                    "x0": min(xs),
                    "x1": max(xs),
                    "z0": min(zs),
                    "z1": max(zs),
                    "y": region["vertices"][0]["y"],
                })
        self._rgb = None

    def rgb(self):
        """Image du relief (tableau hauteur × largeur × 3), PIXELS_PER_KM pixels par km, ligne 0 au nord."""
        if self._rgb is None:
            self._rgb = self.render()
        return self._rgb

    def ground(self, x, z):
        """Altitude du sol (interpolation bilinéaire, sans lissage) au point (x, z) de libRealSpace."""
        fi = (self.half + z) / self.spacing
        fj = (x + self.half) / self.spacing
        side = self.height.shape[0]
        i0 = min(max(int(math.floor(fi)), 0), side - 2)
        j0 = min(max(int(math.floor(fj)), 0), side - 2)
        ti = min(max(fi - i0, 0.0), 1.0)
        tj = min(max(fj - j0, 0.0), 1.0)
        h = self.height
        top = h[i0, j0] * (1 - tj) + h[i0, j0 + 1] * tj
        bottom = h[i0 + 1, j0] * (1 - tj) + h[i0 + 1, j0 + 1] * tj
        return float(top * (1 - ti) + bottom * ti)

    def render(self):
        side = int(2 * self.half / 1000 * PIXELS_PER_KM)
        step = 2 * self.half / side
        coords = (np.arange(side) + 0.5) * step
        # ligne 0 de la grille = nord (c1 = +half), colonne 0 = ouest (x = −half)
        fi = coords / self.spacing
        fj = coords / self.spacing
        h = bilinear(self.height, fi, fj)
        h = box_blur(h, max(1, int(700 / step)))
        dx = (np.roll(h, -1, axis=1) - np.roll(h, 1, axis=1)) / (2 * step)
        dn = (np.roll(h, 1, axis=0) - np.roll(h, -1, axis=0)) / (2 * step)
        shade = np.clip(1.0 - 1.6 * (dx - dn), 0.45, 1.25)
        stops_h = np.array([s[0] for s in tm.STOPS], dtype=np.float32)
        rgb = np.zeros(h.shape + (3,), dtype=np.float32)
        for q in range(3):
            rgb[..., q] = np.interp(h, stops_h, np.array([s[1][q] for s in tm.STOPS], dtype=np.float32))
        land = h > 0
        sea = tm.STOPS[0][1]
        for q in range(3):
            channel = rgb[..., q]
            channel[~land] = sea[q]
            channel[land] *= shade[land]
        return np.clip(rgb, 0, 255).astype(np.uint8)


def bilinear(grid, fi, fj):
    side = grid.shape[0]
    i0 = np.clip(np.floor(fi).astype(int), 0, side - 2)
    j0 = np.clip(np.floor(fj).astype(int), 0, side - 2)
    ti = np.clip(fi - i0, 0, 1)[:, None]
    tj = np.clip(fj - j0, 0, 1)[None, :]
    a = grid[np.ix_(i0, j0)]
    b = grid[np.ix_(i0, j0 + 1)]
    c = grid[np.ix_(i0 + 1, j0)]
    d = grid[np.ix_(i0 + 1, j0 + 1)]
    top = a * (1 - tj) + b * tj
    bottom = c * (1 - tj) + d * tj
    return top * (1 - ti) + bottom * ti


def box_blur(h, radius):
    """Moyenne glissante de 2 × radius + 1 pixels, deux passes par axe (lecture de la carte seulement)."""
    for _ in range(2):
        for axis in (0, 1):
            padded = np.pad(h, [(radius + 1, radius) if a == axis else (0, 0) for a in (0, 1)], mode="edge")
            total = np.cumsum(padded, axis=axis, dtype=np.float64)
            if axis == 0:
                h = (total[2 * radius + 1:, :] - total[:-2 * radius - 1, :]) / (2 * radius + 1)
            else:
                h = (total[:, 2 * radius + 1:] - total[:, :-2 * radius - 1]) / (2 * radius + 1)
            h = h.astype(np.float32)
    return h


def describe(archive, name):
    m = pmd.load(archive.path, name, archive.tre)
    programs = m["programmes"]
    callers = {}
    for k in range(len(programs)):
        callers[k] = []
    for obj in m["objets"]:
        for slot, number in enumerate(obj["scripts"]):
            if number < len(programs):
                callers[number].append({"type": "objet", "numéro": obj["numéro"], "rôle": SCRIPT_SLOTS[slot]})
        form, kind = archive.object_class(obj["nom"])
        obj["classe"] = form
        obj["kind"] = kind
    for scene in m["scènes"]:
        for slot, number in enumerate(scene["scripts"]):
            if number < len(programs):
                callers[number].append({"type": "scène", "rang": scene["rang"], "rôle": SCENE_SLOTS[slot]})
    variables = {}
    for k, prog in enumerate(programs):
        for start, op, op_name, args in prog:
            if op == 2 and args[0] < len(programs):
                callers[args[0]].append({"type": "programme", "numéro": k, "rôle": "OP_EXEC_SUB_PROG"})
            if op in pmd.FLAG_OPS:
                entry = variables.setdefault(args[0], {"écrit": [], "lu": []})
                if op in VAR_WRITE and k not in entry["écrit"]:
                    entry["écrit"].append(k)
                if op in VAR_READ and k not in entry["lu"]:
                    entry["lu"].append(k)
    m["lancé_par"] = callers
    by_number = {}
    for obj in m["objets"]:
        by_number[obj["numéro"]] = obj
        obj["activé_par"] = []
        if obj["cast"] == "PLAYER":
            obj["activé_par"].append("le joueur")
    for scene in m["scènes"]:
        for rank in scene["objets"]:
            if rank < len(m["objets"]):
                m["objets"][rank]["activé_par"].append("scène %d" % scene["rang"])
    for spot in m["points"]:
        spot["emplois"] = []
    for k, prog in enumerate(programs):
        for start, op, op_name, args in prog:
            if op == 144 and args[0] in by_number:
                text = "programme %d" % k
                if text not in by_number[args[0]]["activé_par"]:
                    by_number[args[0]]["activé_par"].append(text)
            for table, role in ((SPOT_ARGS, "navigation"), (LOCAL_SPOT_ARGS, "repère d'un objet"), (TARGET_SPOT_ARGS, "point visé")):
                for rank in table.get(op, []):
                    if rank < len(args) and args[rank] < len(m["points"]):
                        m["points"][args[rank]]["emplois"].append({"instruction": op_name, "programme": k, "rôle": role})
    m["variables"] = [{"numéro": v, "écrit": e["écrit"], "lu": e["lu"]} for v, e in sorted(variables.items())]
    for obj in m["objets"]:
        obj["liens"] = links(obj, programs)
    m["terrain"] = archive.terrain_name(m["monde"])
    m["règles"] = {"spot": {str(k): v for k, v in SPOT_ARGS.items()}, "objet": {str(k): v for k, v in OBJECT_ARGS.items()}}
    return m


def links(obj, programs):
    """Points SPOT et objets désignés par les scripts de l'objet, en suivant OP_EXEC_SUB_PROG."""
    spots = []
    objects = []
    seen = set()
    todo = [n for n in obj["scripts"] if n < len(programs)]
    while todo:
        number = todo.pop()
        if number in seen:
            continue
        seen.add(number)
        for start, op, op_name, args in programs[number]:
            if op == 2 and args[0] < len(programs):
                todo.append(args[0])
            for rank in SPOT_ARGS.get(op, []):
                if rank < len(args):
                    spots.append({"point": args[rank], "instruction": op_name, "programme": number})
            for rank in OBJECT_ARGS.get(op, []):
                if rank < len(args):
                    target = obj["numéro"] if args[rank] == 255 else args[rank]
                    if target != obj["numéro"]:
                        objects.append({"numéro": target, "instruction": op_name, "programme": number})
    return {"points": spots, "objets": objects}
