#!/usr/bin/env python3
"""Lecture d'une mission de Pacific Strike (MISSIONS\\<nom>.IFF de PACIFIC.DAT) : zones, points, objets, scènes et
programmes, avec les règles de PACIFIC.EXE (analysis/pacific/README.md § 6.4 à 6.7).

- AREA : forme (1 octet), nom (32), point de référence 3 × int32 24.8, puis S : 1 int32, C : 2, B : 5 (comme Strike
  Commander) ;
- SPOT : 14 octets, mot zone (65535 = aucune) puis 3 × int32 24.8, décalage depuis le point de la zone ;
- CAST : noms de 9 octets ; PART : 62 octets (IMPL_MISSION_PART.md § 1), scripts sur 2 octets (règle 7) ;
- SCNE : en-tête de 24 octets (enabled, zone, 3 scripts, octet 9, cap, 3 int32), puis mots = rangs dans PART ;
- PROG : programme n après le n-ième mot nul ; instruction = numéro, argument, jusqu'à 3 × (9, argument) ;
  22 instructions de drapeau : octet haut du numéro puis 5 (règles 2, 4, 5).
Repère libRealSpace : x = c0, y = c2 (altitude), z = −c1, en mètres.

Usage : python3 tools/ps_mission_dump.py PACIFIC.DAT PRLH-M1 [--json sortie.json]
"""
import argparse
import json
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import object_render as orr  # noqa: E402
import sc_data  # noqa: E402

NAMES = {
    0: "OP_NOOP",
    1: "OP_EXIT_PROG",
    2: "OP_EXEC_SUB_PROG",
    3: "OP_EXEC_SUB_PROG_WORK",
    4: "OP_STOP_SCRIPT",
    5: "OP_NOOP_5",
    8: "OP_SET_LABEL",
    15: "OP_SET_EXIT_CODE",
    16: "OP_MOVE_VALUE_TO_WORK_REGISTER",
    17: "OP_MOVE_FLAG_TO_WORK_REGISTER",
    18: "OP_SWAP_WORK_AND_FLAG",
    19: "OP_MOVE_RESULT_TO_WORK",
    20: "OP_SAVE_VALUE_TO_GAMFLOW_REGISTER",
    21: "OP_RANDOM_TO_WORK",
    32: "OP_ADD_VALUE_TO_WORK",
    33: "OP_ADD_FLAG_TO_WORK",
    34: "OP_ADD_VALUE_TO_FLAG",
    35: "OP_ADD_WORK_REGISTER_TO_FLAG",
    36: "OP_SUB_VALUE_FROM_WORK",
    37: "OP_SUB_FLAG_FROM_WORK",
    38: "OP_SUB_VALUE_FROM_FLAG",
    39: "OP_SUB_WORK_FROM_FLAG",
    40: "OP_OR_VALUE_WITH_WORK",
    41: "OP_OR_FLAG_WITH_WORK",
    42: "OP_AND_VALUE_WITH_WORK",
    43: "OP_AND_FLAG_WITH_WORK",
    44: "OP_XOR_VALUE_WITH_WORK",
    45: "OP_XOR_FLAG_WITH_WORK",
    46: "OP_MUL_VALUE_WITH_WORK",
    47: "OP_MUL_FLAG_WITH_WORK",
    48: "OP_DIV_WORK_BY_VALUE",
    49: "OP_DIV_WORK_BY_FLAG",
    64: "OP_CMP_WORK_WITH_VALUE",
    65: "OP_CMP_VALUE_WITH_WORK",
    66: "OP_CMP_WORK_WITH_FLAG",
    67: "OP_CMP_FLAG_WITH_WORK",
    68: "OP_CMP_RESULT_WITH_VALUE",
    69: "OP_TEST_FLAG",
    70: "OP_GOTO_IF_CURRENT_COMMAND_IN_PROGRESS",
    71: "OP_GOTO_IF_CURRENT_COMMAND_DONE",
    72: "OP_BRANCH_IF_EQUAL",
    73: "OP_BRANCH_IF_NOT_EQUAL",
    74: "OP_BRANCH_IF_LESS",
    75: "OP_BRANCH_IF_GREATER",
    76: "OP_BRANCH_IF_LESS_EQUAL",
    77: "OP_BRANCH_IF_GREATER_EQUAL",
    78: "OP_BRANCH",
    79: "OP_EXECUTE_CALL",
    80: "OP_MOVE_WORK_REGISTER_TO_FLAG",
    81: "OP_MOVE_RESULT_TO_FLAG",
    82: "OP_SET_FLAG_TO_TRUE",
    83: "OP_SET_FLAG_TO_FALSE",
    84: "OP_TOGGLE_FLAG",
    85: "OP_ADD_1_TO_FLAG",
    86: "OP_REMOVE_1_TO_FLAG",
    112: "OP_ORDER_FRIENDLY_OF_TYPE",
    128: "OP_ENABLE_SCENE",
    129: "OP_DISABLE_SCENE",
    130: "OP_IS_SCENE_ENABLED",
    144: "OP_ACTIVATE_OBJ",
    145: "OP_DEACTIVATE_OBJ",
    146: "OP_IF_TARGET_IN_AREA",
    147: "OP_IS_TARGET_ALIVE",
    148: "OP_INSTANT_DESTROY_TARGET",
    149: "OP_DIST_TO_TARGET",
    151: "OP_DIST_TO_SPOT",
    152: "OP_IS_TARGET_ACTIVE",
    153: "OP_SPAWN_EFFECT_ON_OBJ",
    154: "OP_FIRE_AT_SPOT",
    155: "OP_SPAWN_AT_SPOT",
    156: "OP_DETACH_CARRIED",
    157: "OP_LAUNCH_FROM_OBJ",
    160: "OP_SET_WAIT_FOR_SECONDS",
    161: "OP_SET_OBJ_TAKE_OFF",
    162: "OP_SET_OBJ_LAND",
    165: "OP_SET_OBJ_FLY_TO_WP",
    166: "OP_SET_OBJ_FLY_TO_AREA",
    167: "OP_SET_OBJ_DESTROY_TARGET",
    168: "OP_SET_OBJ_DEFEND_TARGET",
    169: "OP_SET_OBJ_DEFEND_AREA",
    170: "OP_SET_OBJ_FOLLOW_ALLY",
    171: "OP_SET_MESSAGE",
    173: "OP_SET_OBJ_DESTROY_TARGET_B",
    174: "OP_ATTACK_RANDOM_ENEMY_OF_TYPE",
    175: "OP_DIVE_ON_RANDOM_ENEMY_OF_TYPE",
    182: "OP_SHOW_ON_NAV_MAP",
    183: "OP_HIDE_FROM_NAV_MAP",
    184: "OP_JOIN_PLAYER_TEAM",
    185: "OP_LEAVE_PLAYER_TEAM",
    190: "OP_PACIFY_TARGET",
    191: "OP_SET_OBJ_PATROL_POSITION",
    193: "OP_ORDER_OBJ_AND_SPOT",
    208: "OP_SELECT_FLAG_208",
}
FLAG_OPS = {17, 18, 33, 34, 35, 37, 38, 39, 41, 43, 45, 47, 49, 66, 67, 69, 80, 81, 82, 83, 85, 86}
AREA_EXTRA = {"S": 1, "C": 2, "B": 5}


def libRS(c0, c1, c2):
    return [c0 / 256.0, c2 / 256.0, -c1 / 256.0]


def read_mission(archive, name, tre=None):
    """tre : (data, index) de sc_data.tre_index déjà lu, pour ne pas relire l'archive à chaque mission."""
    if tre is None:
        tre = sc_data.tre_index(archive)
    data, index = tre
    off, size = index["DATA/MISSIONS/%s.IFF" % name.upper()]
    m = data[off:off + size]
    chunks = []
    for where, tag, pos, length in orr.iff_chunks(m, 0, len(m)):
        chunks.append((where, tag, m[pos:pos + length]))
    return chunks


def first(chunks, path):
    for where, tag, body in chunks:
        if where + "/" + tag == path:
            return body
    return b""


def parse_areas(body):
    areas = []
    pos = 0
    while pos < len(body):
        shape = chr(body[pos])
        name = body[pos + 1:pos + 33].split(b"\0")[0].decode("latin1")
        ref = libRS(*struct.unpack_from("<3i", body, pos + 33))
        count = AREA_EXTRA.get(shape, 0)
        values = [v / 256.0 for v in struct.unpack_from("<%di" % count, body, pos + 45)]
        areas.append({"rang": len(areas), "forme": shape, "nom": name, "ref": ref, "valeurs": values})
        pos += 45 + 4 * count
    return areas


def parse_spots(body, areas):
    spots = []
    for k in range(0, len(body) - len(body) % 14, 14):
        area = struct.unpack_from("<H", body, k)[0]
        offset = libRS(*struct.unpack_from("<3i", body, k + 2))
        world = list(offset)
        if area < len(areas):
            world = [offset[q] + areas[area]["ref"][q] for q in range(3)]
        spots.append({"rang": k // 14, "zone": area, "décalage": offset, "monde": world})
    return spots


def parse_parts(body, cast, areas):
    parts = []
    for k in range(0, len(body) - len(body) % 62, 62):
        r = body[k:k + 62]
        number = struct.unpack_from("<H", r, 0)[0]
        area = struct.unpack_from("<H", r, 26)[0]
        offset = libRS(*struct.unpack_from("<3i", r, 29))
        placement = r[28]
        world = list(offset)
        if placement == 0 and area < len(areas):
            world = [offset[q] + areas[area]["ref"][q] for q in range(3)]
        parts.append({
            "rang": k // 62,
            "numéro": number,
            "cast": cast[number & 255] if (number & 255) < len(cast) else "?",
            "nom": r[2:10].split(b"\0")[0].decode("latin1"),
            "détruit": r[10:18].split(b"\0")[0].decode("latin1"),
            "emport": r[18:26].split(b"\0")[0].decode("latin1"),
            "zone": area,
            "placement": placement,
            "décalage": offset,
            "monde": world,
            "cap": struct.unpack_from("<h", r, 41)[0],
            "vitesse": struct.unpack_from("<h", r, 43)[0],
            "camp": r[45],
            "allié": r[46],
            "formation": list(struct.unpack_from("<3h", r, 48)),
            "scripts": list(struct.unpack_from("<4H", r, 54)),
        })
    return parts


def parse_scenes(bodies):
    scenes = []
    for body in bodies:
        count = (len(body) - 24) // 2
        scenes.append({
            "rang": len(scenes),
            "enabled": body[0],
            "zone": struct.unpack_from("<H", body, 1)[0],
            "scripts": list(struct.unpack_from("<3H", body, 3)),
            "arrivée": body[9],
            "cap_arrivée": struct.unpack_from("<h", body, 10)[0],
            "point_arrivée": libRS(*struct.unpack_from("<3i", body, 12)),
            "objets": list(struct.unpack_from("<%dH" % count, body, 24)),
        })
    return scenes


def parse_programs(body):
    """Programmes avec leurs instructions : (octet, numéro, nom, arguments)."""
    programs = [[]]
    i = 0
    while i + 1 < len(body):
        start = i
        op = body[i]
        args = [body[i + 1]]
        i += 2
        if op == 0 and args[0] == 0:
            programs[-1].append((start, 0, "OP_NOOP", [0]))
            programs.append([])
            continue
        extras = 0
        while extras < 3 and i + 1 < len(body) and body[i] == 9:
            args.append(body[i + 1])
            i += 2
            extras += 1
        if op in FLAG_OPS and i + 1 < len(body):
            args[0] = args[0] | (body[i] << 8)
            i += 2
        programs[-1].append((start, op, NAMES.get(op, "OP_%d" % op), args))
    if not programs[-1]:
        programs.pop()
    return programs


def load(archive, name, tre=None):
    chunks = read_mission(archive, name, tre)
    areas = parse_areas(first(chunks, "/MISN/AREA"))
    cast_body = first(chunks, "/MISN/CAST")
    cast = [cast_body[k:k + 8].split(b"\0")[0].decode("latin1") for k in range(0, len(cast_body) - len(cast_body) % 9, 9)]
    msgs = [s.decode("latin1") for s in first(chunks, "/MISN/MSGS").split(b"\0")[:-1]]
    load_body = first(chunks, "/MISN/LOAD")
    loads = [load_body[k:k + 8].split(b"\0")[0].decode("latin1") for k in range(0, len(load_body) - len(load_body) % 9, 9)]
    team_body = first(chunks, "/MISN/TEAM")
    team = list(struct.unpack_from("<%dH" % (len(team_body) // 2), team_body, 0))
    scenes = parse_scenes([body for where, tag, body in chunks if tag == "SCNE"])
    return {
        "nom": first(chunks, "/MISN/NAME").split(b"\0")[0].decode("latin1"),
        "monde": first(chunks, "/MISN/WRLD/FILE").split(b"\0")[0].decode("latin1"),
        "musique": first(chunks, "/MISN/TUNE")[0] if first(chunks, "/MISN/TUNE") else None,
        "zones": areas,
        "points": parse_spots(first(chunks, "/MISN/SPOT"), areas),
        "cast": cast,
        "objets": parse_parts(first(chunks, "/MISN/PART"), cast, areas),
        "scènes": scenes,
        "messages": msgs,
        "load": loads,
        "team": team,
        "programmes": parse_programs(first(chunks, "/MISN/PROG")),
    }


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("archive")
    ap.add_argument("mission")
    ap.add_argument("--json")
    args = ap.parse_args()
    m = load(args.archive, args.mission)
    print("%s « %s », monde %s, musique %s" % (args.mission, m["nom"], m["monde"], m["musique"]))
    for a in m["zones"]:
        print("zone %d %s %s réf %s valeurs %s" % (a["rang"], a["forme"], a["nom"], [round(v) for v in a["ref"]], a["valeurs"]))
    for s in m["points"]:
        print("point %d zone %d monde %s" % (s["rang"], s["zone"], [round(v) for v in s["monde"]]))
    for p in m["objets"]:
        print("objet rang %d n° %d %-8s %-8s zone %d plac %d monde %s cap %d vit %d camp %d scripts %s" % (
            p["rang"], p["numéro"], p["cast"], p["nom"], p["zone"], p["placement"], [round(v) for v in p["monde"]],
            p["cap"], p["vitesse"], p["camp"], p["scripts"]))
    for s in m["scènes"]:
        print("scène", s)
    print("messages", m["messages"])
    print("team", m["team"], "load", m["load"])
    for n, prog in enumerate(m["programmes"]):
        print("programme %d" % n)
        for start, op, name, a in prog:
            print("  %4d  %s %s" % (start, name, ", ".join(str(v) for v in a)))
    if args.json:
        json.dump(m, open(args.json, "w", encoding="utf-8"), ensure_ascii=False, indent=1)


if __name__ == "__main__":
    main()
