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


# ---------------------------------------------------------------------- pseudo-code

# Sens des instructions d'après PSProg / SCProg de libRealSpace : la comparaison se lit dans l'ordre du nom
# (OP_CMP_WORK_WITH_VALUE n : WORK comparé à n), OP_TEST_FLAG pose « égal » si la variable est non nulle,
# OP_IS_SCENE_ACTIVE pose « égal » si la scène de la zone est active, OP_EXECUTE_CALL saute à l'étiquette égale à WORK.
BRANCH_RELATION = {
    72: "==",
    73: "!=",
    74: "<",
    75: ">",
    76: "<=",
    77: ">=",
}
NEGATION = {
    "==": "!=",
    "!=": "==",
    "<": ">=",
    ">": "<=",
    "<=": ">",
    ">=": "<",
}
COMPARE_OPS = {64, 65, 66, 67, 68, 69, 130, 146, 147, 152}
WORK_UPDATE = {
    32: ("+=", "valeur"),
    33: ("+=", "variable"),
    36: ("-=", "valeur"),
    37: ("-=", "variable"),
    40: ("|=", "valeur"),
    41: ("|=", "variable"),
    42: ("&=", "valeur"),
    43: ("&=", "variable"),
    44: ("^=", "valeur"),
    45: ("^=", "variable"),
    46: ("*=", "valeur"),
    47: ("*=", "variable"),
    48: ("/=", "valeur"),
    49: ("/=", "variable"),
}


def seg_text(text):
    return (text, None, None)


def seg_var(number):
    return ("var[%d]" % number, "variable", number)


def seg_object(mission, number):
    for obj in mission["objets"]:
        if obj["numéro"] == number:
            return ("n°%d %s" % (number, obj["nom"]), "objet", number)
    return ("n°%d" % number, "objet", number)


def seg_spot(number):
    return ("SPOT %d" % number, "point", number)


def call_segments(mission, op, name, args, owner):
    """OP_NOM(arguments) avec les objets, points et programmes désignés."""
    spot_args = SPOT_ARGS.get(op, []) + LOCAL_SPOT_ARGS.get(op, []) + TARGET_SPOT_ARGS.get(op, [])
    object_args = list(OBJECT_ARGS.get(op, []))
    if op in (153, 154):
        object_args = [0]
    if op == 157:
        object_args = [0, 1]
    segs = [seg_text(name + "(")]
    for rank, value in enumerate(args):
        if rank:
            segs.append(seg_text(", "))
        if rank in object_args:
            if value == 255:
                segs.append(seg_text("soi"))
            else:
                segs.append(seg_object(mission, value))
        elif rank in spot_args and value < len(mission["points"]):
            segs.append(seg_spot(value))
        else:
            segs.append(seg_text(str(value)))
    segs.append(seg_text(")"))
    return segs


def statement(mission, instruction, owner):
    """Une instruction sans saut → liste de segments (texte, type de lien, valeur) ; None = rien à écrire."""
    start, op, name, args = instruction
    a = args[0] if args else 0
    if op == 0 and a == 0:
        return None
    if op == 1:
        return [seg_text("return;")]
    if op == 2:
        return [seg_text("appeler "), ("programme %d" % a, "programme", a), seg_text(";")]
    if op == 16:
        return [seg_text("WORK = %d;" % a)]
    if op == 17:
        return [seg_text("WORK = "), seg_var(a), seg_text(";")]
    if op == 18:
        return [seg_text("échanger(WORK, "), seg_var(a), seg_text(");")]
    if op == 19:
        return [seg_text("WORK = résultat;")]
    if op in WORK_UPDATE:
        symbol, kind = WORK_UPDATE[op]
        if kind == "valeur":
            return [seg_text("WORK %s %d;" % (symbol, a))]
        return [seg_text("WORK %s " % symbol), seg_var(a), seg_text(";")]
    if op == 35:
        return [seg_var(a), seg_text(" += WORK;")]
    if op == 39:
        return [seg_var(a), seg_text(" -= WORK;")]
    if op == 80:
        return [seg_var(a), seg_text(" = WORK;")]
    if op == 81:
        return [seg_var(a), seg_text(" = résultat;")]
    if op == 82:
        return [seg_var(a), seg_text(" = 1;")]
    if op == 83:
        return [seg_var(a), seg_text(" = 0;")]
    if op == 85:
        return [seg_var(a), seg_text(" += 1;")]
    if op == 86:
        return [seg_var(a), seg_text(" -= 1;")]
    segs = call_segments(mission, op, name, args, owner)
    segs.append(seg_text(";"))
    return segs


def compare_state(mission, instruction):
    """État laissé par une instruction de comparaison : (A, B) pour une relation, ou un booléen pour « égal »."""
    start, op, name, args = instruction
    a = args[0] if args else 0
    if op == 64:
        return {"type": "relation", "a": [seg_text("WORK")], "b": [seg_text(str(a))]}
    if op == 65:
        return {"type": "relation", "a": [seg_text(str(a))], "b": [seg_text("WORK")]}
    if op == 66:
        return {"type": "relation", "a": [seg_text("WORK")], "b": [seg_var(a)]}
    if op == 67:
        return {"type": "relation", "a": [seg_var(a)], "b": [seg_text("WORK")]}
    if op == 68:
        return {"type": "relation", "a": [seg_text("résultat")], "b": [seg_text(str(a))]}
    if op == 69:
        return {"type": "égal", "vrai": [seg_var(a), seg_text(" != 0")], "faux": [seg_var(a), seg_text(" == 0")]}
    if op == 130:
        call = [seg_text("scène_active(zone %d)" % a)]
        return {"type": "égal", "vrai": call, "faux": [seg_text("!")] + call}
    call = call_segments(mission, op, name, args, None)
    return {"type": "égal", "vrai": call, "faux": [seg_text("!")] + call}


def branch_condition(state, op):
    """Condition du saut op (72 à 77) selon l'état de comparaison : {"type", ...} négociable."""
    relation = BRANCH_RELATION[op]
    if state is None:
        return {"type": "texte", "segs": [seg_text("bit « %s » de la dernière comparaison" % relation)], "neg": False}
    if state["type"] == "relation":
        return {"type": "relation", "a": state["a"], "op": relation, "b": state["b"]}
    if relation == "==":
        return {"type": "pair", "segs": state["vrai"], "autre": state["faux"]}
    if relation == "!=":
        return {"type": "pair", "segs": state["faux"], "autre": state["vrai"]}
    return {"type": "texte", "segs": [seg_text("bit « %s » après ")] + state["vrai"], "neg": False}


def negate(cond):
    if cond["type"] == "relation":
        return {"type": "relation", "a": cond["a"], "op": NEGATION[cond["op"]], "b": cond["b"]}
    if cond["type"] == "pair":
        return {"type": "pair", "segs": cond["autre"], "autre": cond["segs"]}
    return {"type": "texte", "segs": cond["segs"], "neg": not cond["neg"]}


def condition_segments(cond):
    if cond["type"] == "relation":
        return cond["a"] + [seg_text(" %s " % cond["op"])] + cond["b"]
    if cond["type"] == "pair":
        return cond["segs"]
    if cond["neg"]:
        return [seg_text("!(")] + cond["segs"] + [seg_text(")")]
    return cond["segs"]


def linear_items(mission, program, owner):
    """Instructions → éléments : étiquette, saut conditionnel, saut, instruction. Les comparaisons sont fondues dans
    les sauts qui les suivent ; l'état de comparaison est oublié à chaque étiquette (on peut y arriver d'ailleurs)."""
    items = []
    state = None
    for instruction in program:
        start, op, name, args = instruction
        a = args[0] if args else 0
        if op == 8:
            items.append({"t": "étiquette", "n": a})
            state = None
        elif op in COMPARE_OPS:
            state = compare_state(mission, instruction)
        elif op in BRANCH_RELATION:
            items.append({"t": "si", "cond": branch_condition(state, op), "n": a})
        elif op == 70:
            items.append({"t": "si", "cond": {"type": "pair", "segs": [seg_text("ordre_en_cours")], "autre": [seg_text("!ordre_en_cours")]}, "n": a})
        elif op == 71:
            items.append({"t": "si", "cond": {"type": "pair", "segs": [seg_text("!ordre_en_cours")], "autre": [seg_text("ordre_en_cours")]}, "n": a})
        elif op == 78:
            items.append({"t": "aller", "n": a})
        elif op == 79:
            items.append({"t": "instr", "segs": [seg_text("goto L(WORK);   // étiquette égale à WORK")]})
        else:
            segs = statement(mission, instruction, owner)
            if segs is not None:
                items.append({"t": "instr", "segs": segs})
    return items


def find_label(seq, number, start):
    for k in range(start, len(seq)):
        if seq[k]["t"] == "étiquette" and seq[k]["n"] == number:
            return k
    return None


def has_label(seq):
    for item in seq:
        if item["t"] == "étiquette":
            return True
    return False


def structure(seq, refs, keep_all):
    """Saut conditionnel vers une étiquette plus loin, sans étiquette entre les deux → bloc si ; bloc terminé par un
    saut vers une seconde étiquette plus loin → si / sinon (seulement si la première étiquette n'a pas d'autre appel)."""
    out = []
    i = 0
    while i < len(seq):
        item = seq[i]
        if item["t"] == "si":
            j = find_label(seq, item["n"], i + 1)
            if j is not None and j > i + 1 and not has_label(seq[i + 1:j]):
                body = seq[i + 1:j]
                last = body[-1]
                if last["t"] == "aller" and refs.get(item["n"], 0) == 1 and not keep_all:
                    k = find_label(seq, last["n"], j + 1)
                    if k is not None and k > j + 1 and not has_label(seq[j + 1:k]):
                        refs[item["n"]] -= 1
                        refs[last["n"]] -= 1
                        out.append({"t": "bloc", "cond": negate(item["cond"]), "alors": structure(body[:-1], refs, keep_all), "sinon": structure(seq[j + 1:k], refs, keep_all)})
                        i = k
                        continue
                refs[item["n"]] -= 1
                out.append({"t": "bloc", "cond": negate(item["cond"]), "alors": structure(body, refs, keep_all), "sinon": None})
                i = j
                continue
        out.append(item)
        i += 1
    return out


def render(nodes, refs, keep_all, depth, lines):
    for node in nodes:
        if node["t"] == "étiquette":
            if keep_all or refs.get(node["n"], 0) > 0:
                lines.append((max(depth - 1, 0), [seg_text("L%d:" % node["n"])]))
        elif node["t"] == "instr":
            lines.append((depth, node["segs"]))
        elif node["t"] == "aller":
            lines.append((depth, [seg_text("goto L%d;" % node["n"])]))
        elif node["t"] == "si":
            lines.append((depth, [seg_text("if (")] + condition_segments(node["cond"]) + [seg_text(") goto L%d;" % node["n"])]))
        elif node["t"] == "bloc":
            lines.append((depth, [seg_text("if (")] + condition_segments(node["cond"]) + [seg_text(") {")]))
            render(node["alors"], refs, keep_all, depth + 1, lines)
            if node["sinon"] is not None:
                lines.append((depth, [seg_text("} else {")]))
                render(node["sinon"], refs, keep_all, depth + 1, lines)
            lines.append((depth, [seg_text("}")]))


def pseudo_code(mission, number, owner=None):
    """Programme number → lignes (profondeur, segments). Un segment = (texte, type de lien ou None, valeur).
    WORK = registre de travail ; var[n] = variable n (mot en dessous de 256, bit au-delà) ; L65 = étiquette 65.
    Les étiquettes ne sont écrites que si un saut y mène encore ; toutes le sont si le programme fait
    OP_EXECUTE_CALL (saut calculé : n'importe quelle étiquette peut être visée)."""
    program = mission["programmes"][number]
    keep_all = any(op == 79 for start, op, name, args in program)
    items = linear_items(mission, program, owner)
    refs = {}
    for item in items:
        if item["t"] in ("si", "aller"):
            refs[item["n"]] = refs.get(item["n"], 0) + 1
    nodes = structure(items, refs, keep_all)
    lines = []
    render(nodes, refs, keep_all, 1, lines)
    return lines


def pseudo_text(mission, number, indent="    "):
    out = []
    for depth, segs in pseudo_code(mission, number):
        out.append(indent * depth + "".join(s[0] for s in segs))
    return "\n".join(out)


def main():
    import argparse
    ap = argparse.ArgumentParser(description="Pseudo-code des programmes d'une mission de Pacific Strike.")
    ap.add_argument("archive", help="PACIFIC.DAT")
    ap.add_argument("mission")
    ap.add_argument("programme", nargs="?", type=int, help="un seul programme (sinon tous)")
    args = ap.parse_args()
    archive = Archive(args.archive)
    m = describe(archive, args.mission)
    numbers = [args.programme] if args.programme is not None else range(len(m["programmes"]))
    for number in numbers:
        print("programme %d" % number)
        print(pseudo_text(m, number))
        print()


if __name__ == "__main__":
    main()
