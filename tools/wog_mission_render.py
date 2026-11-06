#!/usr/bin/env python3
"""Mission de Wings of Glory en 3D (page WebGL) : terrain de tools/wog_terrain_render.py + objets PART posés dessus.

Règles vérifiées dans GLORY.EXE (adresses de l'image chargée à 1000h, analysis/wings/README.md § 8.8) :
  - monde : chunk WRLD/FILE de la mission = MISSIONS\\<nom>.IFF, dont le chunk TERA nomme le terrain
    (TERRAIN\\<nom>.PAK ; lecteur de TERA en D420h) ;
  - zones : chunk FARE s'il existe, sinon AREA (13157h à 13187h) ; enregistrement = forme (1 octet), nom (32 octets),
    point de référence 3 × int32 24.8 (13FE4h), puis 'S' 1 int32, 'C' 2, 'B' 5, 'P' 5 + mot n + n × 2 int32
    (14208h à 14124h) ;
  - PART : enregistrements de 62 octets (14DC8h, 14888h), même découpage que Strike Commander ; l'index CAST
    (octets 0-1) n'est gardé que sur son octet bas ;
  - nom d'objet « plch » : avion du joueur ; mission lancée par OP2MISN.IFF : pup, camel, spadxiii, se5a, fokkdr1
    ou planex selon les bits 760 à 764 et 766 du déroulement ; mission lancée sans OP2MISN : camel (149E4h) ;
  - placement (F5C0h) : octet 28 = 0 : position = décalage + point de référence de la zone (aucune zone si l'index
    est 65535 : position absolue, E5C0h) ; octet 28 ≠ 0 : position = position du joueur + décalage tourné par
    l'orientation du joueur, altitude au moins 300 m (F887h), cap = cap du fichier + cap du joueur ;
    joueur = 1er PART dont le nom CAST est PLAYER (138D4h, 108E8h) ;
  - cap : rotation autour de la verticale de −cap (1815Ch) ; 0 = nord, 90 = est (sens des aiguilles d'une montre) ;
  - modèle : OBJECTS\\<nom>.IFF, FORM REAL/APPR/POLY : VERT 3 × int32 24.8 ; TRIS/FACE 8 octets (type, couleur,
    3 mots sommet), QUAD/FACE 10 octets ; MAPS 16 ou 20 octets (mot face, mot texture, 3 ou 4 × (u, v)), u et v
    bornés à largeur − 1 et hauteur − 1 (31B2Ch) ; texture n < nombre de TXMP = n-ième TXMP, sinon TXMA
    (n − nombre de TXMP) ; TXMP = nom 8 octets, largeur, hauteur (mots), pixels bruts (2917Ch) ; TXMA = idem + mot
    nombre d'images, images à la suite (seule la 1re est dessinée ici).
Pas relu dans le code : l'éclairage des objets (une lumière simple est utilisée ici), le sens de l'octet « type »
des faces, la transparence (l'indice 255 des textures est rendu transparent : option de la page).
Repère de la page : libRealSpace, Y-up en mètres (x = c0, y = c2, z = −c1).

Usage : python3 tools/wog_mission_render.py <DATA> MISN-1 --html misn1.html [--avion camel]
        (<DATA> = dossier DATA extrait de FLIGHTHD.TRE par tools/xtre_extract.py)
"""
import argparse
import base64
import colorsys
import json
import math
import os
import struct
import sys

import numpy as np

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import object_render as orr  # noqa: E402
import wog_terrain_render as wtr  # noqa: E402

AREA_EXTRA = {
    "S": 1,
    "C": 2,
    "B": 5,
}
MIN_RELATIVE_ALTITUDE = 300.0


def find_file(folder, name):
    wanted = name.upper()
    for entry in os.listdir(folder):
        if entry.upper() == wanted:
            return os.path.join(folder, entry)
    return None


def chunks(data):
    found = {}
    for where, tag, pos, size in orr.iff_chunks(data, 0, len(data)):
        found.setdefault(where + "/" + tag, data[pos:pos + size])
    return found


def read_areas(body):
    """Zones (14208h) ; valeurs en mètres. Tests d'appartenance (méthodes des zones, 109E0h à 10B2Ch) :
    S : distance au point de référence <= v0 ; C : altitude dans [réf, réf + v0], distance horizontale <= v1 ;
    B et P : c0 dans [réf − v1, réf + v0], c1 dans [réf − v3, réf + v2], altitude dans [réf, réf + v4] ;
    P en plus : point dans le polygone (points absolus, comptage des côtés croisés, pair = dehors)."""
    areas = []
    pos = 0
    while pos < len(body):
        shape = chr(body[pos])
        name = body[pos + 1:pos + 33].split(b"\0")[0].decode("latin1")
        c0, c1, c2 = struct.unpack_from("<3i", body, pos + 33)
        pos += 45
        points = []
        if shape in AREA_EXTRA:
            values = [v / 256.0 for v in struct.unpack_from("<%di" % AREA_EXTRA[shape], body, pos)]
            pos += 4 * AREA_EXTRA[shape]
        elif shape == "P":
            values = [v / 256.0 for v in struct.unpack_from("<5i", body, pos)]
            count = struct.unpack_from("<H", body, pos + 20)[0]
            for k in range(count):
                a, b = struct.unpack_from("<2i", body, pos + 22 + 8 * k)
                points.append((a / 256.0, b / 256.0))
            pos += 22 + 8 * count
        else:
            raise SystemExit("forme de zone inconnue : %r" % shape)
        areas.append({
            "shape": shape,
            "name": name,
            "ref": (c0 / 256.0, c1 / 256.0, c2 / 256.0),
            "values": values,
            "points": points,
        })
    return areas


def area_contains_flat(area, x, y):
    """Test d'appartenance du jeu, altitude non testée (plan horizontal seul)."""
    r = area["ref"]
    v = area["values"]
    if area["shape"] == "S":
        return (x - r[0]) ** 2 + (y - r[1]) ** 2 <= v[0] ** 2
    if area["shape"] == "C":
        return (x - r[0]) ** 2 + (y - r[1]) ** 2 <= v[1] ** 2
    if x > r[0] + v[0] or x < r[0] - v[1] or y > r[1] + v[2] or y < r[1] - v[3]:
        return False
    if area["shape"] == "B":
        return True
    crossings = 0
    pts = area["points"]
    for k in range(len(pts)):
        x0, y0 = pts[k]
        x1, y1 = pts[(k + 1) % len(pts)]
        if y0 > y1:
            x0, y0, x1, y1 = x1, y1, x0, y0
        if y0 <= y < y1:
            if x < x0 and x < x1:
                crossings += 1
            elif x0 != x1 and x - x0 < (x1 - x0) / (y1 - y0) * (y - y0):
                crossings += 1
    return crossings % 2 == 1


def read_programs(body):
    """PROG (14EBCh) : programme 0 au début du chunk, programme k après le k-ième mot nul (examiné tous les
    4 octets) ; instruction = mot opcode, mot argument, puis 9 + mot si argument supplémentaire (0E61Ch)."""
    words = struct.unpack("<%dh" % (len(body) // 2), body)
    programs = [[]]
    k = 0
    while k + 1 < len(words):
        if words[k] == 0:
            programs.append([])
            k += 2
            continue
        programs[-1].append((words[k], words[k + 1]))
        k += 2
        if k + 1 < len(words) and words[k] == 9:
            k += 2
    return programs


def read_scenes(bodies):
    """SCNE (14FACh) : en-tête de 24 octets (actif, zone, 3 scripts, octet 9, cap, 3 int32), puis mots = index PART."""
    scenes = []
    for body in bodies:
        count = (len(body) - 24) // 2
        scenes.append({
            "active": body[0],
            "area": struct.unpack_from("<H", body, 1)[0],
            "scripts": list(struct.unpack_from("<3H", body, 3)),
            "parts": list(struct.unpack_from("<%dH" % count, body, 24)),
        })
    return scenes


def read_parts(body, cast):
    parts = []
    for k in range(0, len(body) - len(body) % 62, 62):
        r = body[k:k + 62]
        index = r[0]
        parts.append({
            "cast": cast[index] if index < len(cast) else "?",
            "name": r[2:10].split(b"\0")[0].decode("latin1"),
            "area": struct.unpack_from("<H", r, 26)[0],
            "placement": r[28],
            "offset": tuple(v / 256.0 for v in struct.unpack_from("<3i", r, 29)),
            "heading": struct.unpack_from("<h", r, 41)[0],
            "speed": struct.unpack_from("<h", r, 43)[0],
            "team": r[45],
            "scripts": list(struct.unpack_from("<4H", r, 54)),
        })
    return parts


def axes(heading):
    """Lignes de la matrice après la rotation de −cap (1815Ch), en Z-up : côté, nez, haut."""
    a = math.radians(heading)
    return (
        (math.cos(a), -math.sin(a), 0.0),
        (math.sin(a), math.cos(a), 0.0),
        (0.0, 0.0, 1.0),
    )


def entry_point(area, start):
    """Hypothèse de rendu : le joueur va en ligne droite de son départ au point de référence de la zone ;
    point d'entrée = premier point de ce trajet (pas de 10 m) qui passe le test de la zone dans le plan."""
    dx = area["ref"][0] - start[0]
    dy = area["ref"][1] - start[1]
    length = math.hypot(dx, dy)
    heading = math.degrees(math.atan2(dx, dy)) % 360.0 if length > 0 else 0.0
    steps = int(length // 10.0)
    for k in range(steps + 1):
        x = start[0] + dx * k / max(steps, 1)
        y = start[1] + dy * k / max(steps, 1)
        if area_contains_flat(area, x, y):
            return (x, y, start[2]), heading
    return (area["ref"][0], area["ref"][1], start[2]), heading


def zoned_scene_of(index, parts, scenes, areas, programs, depth):
    """Scène à zone qui fait apparaître l'objet : sa liste (Scene_SpawnParts, 10DF8h), sinon un programme qui
    contient OP_ACTIVATE_OBJ index (opcode 144) lancé par une telle scène ou par un objet de cette scène."""
    for number, scene in enumerate(scenes):
        if index in scene["parts"] and scene["area"] < len(areas):
            return number, ""
    if depth > 3:
        return None
    for prog_number, program in enumerate(programs):
        if (144, index) not in program:
            continue
        for number, scene in enumerate(scenes):
            if prog_number in scene["scripts"] and scene["area"] < len(areas):
                return number, " (script %d de la scène, OP_ACTIVATE_OBJ)" % prog_number
        for owner, q in enumerate(parts):
            if prog_number in q["scripts"]:
                found = zoned_scene_of(owner, parts, scenes, areas, programs, depth + 1)
                if found is not None:
                    return found[0], " (script %d de l'objet %d, OP_ACTIVATE_OBJ)" % (prog_number, owner)
    return None


def place(parts, areas, scenes, programs):
    player = None
    for p in parts:
        if p["cast"].upper() == "PLAYER":
            player = p
            break
    for p in parts:
        if p["placement"] == 0:
            pos = list(p["offset"])
            if p["area"] < len(areas):
                for q in range(3):
                    pos[q] += areas[p["area"]]["ref"][q]
            p["pos"] = pos
            p["total_heading"] = p["heading"]
            p["rule"] = "zone %s" % areas[p["area"]]["name"] if p["area"] < len(areas) else "absolu"
    anchors = []
    for k, p in enumerate(parts):
        if p["placement"] == 0:
            continue
        if player is None or "pos" not in player:
            p["pos"] = None
            p["rule"] = "repère du joueur, joueur absent"
            continue
        origin = player["pos"]
        origin_heading = player["total_heading"]
        p["rule"] = "repère du joueur au départ (aucune scène à zone trouvée)"
        found = zoned_scene_of(k, parts, scenes, areas, programs, 0)
        if found is not None:
            number, why = found
            area = areas[scenes[number]["area"]]
            origin, origin_heading = entry_point(area, player["pos"])
            p["rule"] = "scène %d, entrée dans la zone %s%s" % (number, area["name"], why)
            anchor = (number, area["name"], origin, origin_heading)
            if anchor not in anchors:
                anchors.append(anchor)
        rows = axes(origin_heading)
        pos = list(origin)
        for q in range(3):
            for j in range(3):
                pos[q] += p["offset"][j] * rows[j][q]
        pos[2] = max(pos[2], MIN_RELATIVE_ALTITUDE)
        p["pos"] = pos
        p["total_heading"] = p["heading"] + origin_heading
    return player, anchors


def circle(cx, cy, z, radius, count=48):
    pts = []
    for k in range(count + 1):
        a = 2 * math.pi * k / count
        pts.append((cx + radius * math.cos(a), cy + radius * math.sin(a), z))
    return pts


def polyline(out, pts, colour):
    for k in range(len(pts) - 1):
        for q in (k, k + 1):
            x, y, z = pts[q]
            out += [x, z, -y, colour[0], colour[1], colour[2]]


def zone_lines(areas):
    """Segments (x, y, z en Y-up + couleur) dessinant chaque zone d'après ses dimensions de test."""
    out = []
    for k, area in enumerate(areas):
        hue = (k * 0.618) % 1.0
        colour = colorsys.hsv_to_rgb(hue, 0.8, 1.0)
        area["colour"] = "#%02x%02x%02x" % tuple(int(c * 255) for c in colour)
        r = area["ref"]
        v = area["values"]
        if area["shape"] == "S":
            polyline(out, circle(r[0], r[1], r[2], v[0]), colour)
            pts = []
            for j in range(49):
                a = 2 * math.pi * j / 48
                pts.append((r[0] + v[0] * math.cos(a), r[1], r[2] + v[0] * math.sin(a)))
            polyline(out, pts, colour)
            pts = []
            for j in range(49):
                a = 2 * math.pi * j / 48
                pts.append((r[0], r[1] + v[0] * math.cos(a), r[2] + v[0] * math.sin(a)))
            polyline(out, pts, colour)
            continue
        if area["shape"] == "C":
            bottom = circle(r[0], r[1], r[2], v[1])
            top = circle(r[0], r[1], r[2] + v[0], v[1])
            polyline(out, bottom, colour)
            polyline(out, top, colour)
            for j in range(0, 48, 6):
                polyline(out, [bottom[j], top[j]], colour)
            continue
        if area["shape"] == "B":
            ring = [(r[0] + v[0], r[1] + v[2]), (r[0] - v[1], r[1] + v[2]), (r[0] - v[1], r[1] - v[3]),
                    (r[0] + v[0], r[1] - v[3])]
        else:
            ring = list(area["points"])
        ring.append(ring[0])
        polyline(out, [(x, y, r[2]) for x, y in ring], colour)
        polyline(out, [(x, y, r[2] + v[4]) for x, y in ring], colour)
        for x, y in ring[:-1]:
            polyline(out, [(x, y, r[2]), (x, y, r[2] + v[4])], colour)
    return out


def read_model(path):
    data = open(path, "rb").read()
    vertices = []
    tris = []
    quads = []
    tri_maps = {}
    quad_maps = {}
    lod0 = None
    txmp = []
    txma = []
    for where, tag, pos, size in orr.iff_chunks(data, 0, len(data)):
        if "/APPR/POLY" not in where:
            continue
        body = data[pos:pos + size]
        if tag == "VERT":
            for k in range(0, size - size % 12, 12):
                vertices.append([v / 256.0 for v in struct.unpack_from("<3i", body, k)])
        elif tag == "FACE" and where.endswith("/TRIS"):
            for k in range(0, size - size % 8, 8):
                tris.append(struct.unpack_from("<BB3H", body, k))
        elif tag == "FACE" and where.endswith("/QUAD"):
            for k in range(0, size - size % 10, 10):
                quads.append(struct.unpack_from("<BB4H", body, k))
        elif tag == "MAPS" and where.endswith("/TRIS"):
            for k in range(0, size - size % 16, 16):
                m = struct.unpack_from("<8H", body, k)
                tri_maps[m[0]] = (m[1], m[2:8])
        elif tag == "MAPS" and where.endswith("/QUAD"):
            for k in range(0, size - size % 20, 20):
                m = struct.unpack_from("<10H", body, k)
                quad_maps[m[0]] = (m[1], m[2:10])
        elif tag == "LVL0" and where.endswith("/DETA") and lod0 is None:
            count = (size - 4) // 2
            lod0 = set(struct.unpack_from("<%dH" % count, body, 4))
        elif tag == "TXMP":
            w, h = struct.unpack_from("<2H", body, 8)
            txmp.append(np.frombuffer(body[12:12 + w * h], dtype=np.uint8).reshape(h, w))
        elif tag == "TXMA":
            w, h = struct.unpack_from("<2H", body, 8)
            txma.append(np.frombuffer(body[14:14 + w * h], dtype=np.uint8).reshape(h, w))
    textures = txmp + txma
    faces = []
    for k, (kind, colour, a, b, c) in enumerate(tris):
        faces.append((k, colour, (a, b, c), tri_maps.get(k)))
    for k, (kind, colour, a, b, c, d) in enumerate(quads):
        faces.append((len(tris) + k, colour, (a, b, c, d), quad_maps.get(k)))
    if lod0 is not None:
        faces = [f for f in faces if f[0] in lod0]
    return vertices, faces, textures


def pack_textures(models, palette):
    """Atlas RGBA des textures d'objets : rangées de hauteur fixe, 1 texel de marge, alpha 0 pour l'indice 255."""
    items = []
    for name, (_, _, textures) in models.items():
        for k, t in enumerate(textures):
            items.append((name, k, t))
    width = 1024
    x = 0
    y = 0
    row = 0
    places = {}
    for name, k, t in sorted(items, key=lambda i: -i[2].shape[0]):
        h, w = t.shape
        if x + w + 2 > width:
            x = 0
            y += row
            row = 0
        places[(name, k)] = (x + 1, y + 1, w, h)
        x += w + 2
        row = max(row, h + 2)
    height = 1
    while height < y + row:
        height *= 2
    atlas = np.zeros((height, width, 4), dtype=np.uint8)
    for name, k, t in items:
        px, py, w, h = places[(name, k)]
        rgb = palette[t]
        alpha = np.where(t == 255, 0, 255).astype(np.uint8)
        atlas[py:py + h, px:px + w, :3] = rgb
        atlas[py:py + h, px:px + w, 3] = alpha
    return atlas, places


def model_buffers(name, model, places, palette, atlas_size):
    """Triangles du modèle : position (x, y, z en Y-up), uv d'atlas, couleur, drapeau texture."""
    vertices, faces, textures = model
    aw, ah = atlas_size
    out = []
    for number, colour, corners, mapping in faces:
        rgb = [int(v) / 255.0 for v in palette[colour]]
        uv = None
        if mapping is not None and mapping[0] < len(textures):
            tex = mapping[0]
            px, py, w, h = places[(name, tex)]
            uv = []
            for q in range(len(corners)):
                u = min(mapping[1][2 * q], w - 1)
                v = min(mapping[1][2 * q + 1], h - 1)
                uv.append(((px + u + 0.5) / aw, (py + v + 0.5) / ah))
        tri_list = [(0, 1, 2)]
        if len(corners) == 4:
            tri_list.append((0, 2, 3))
        for t in tri_list:
            for q in t:
                v = vertices[corners[q]]
                out += [v[0], v[2], -v[1]]
                if uv is None:
                    out += [0.0, 0.0, rgb[0], rgb[1], rgb[2], 0.0]
                else:
                    out += [uv[q][0], uv[q][1], rgb[0], rgb[1], rgb[2], 1.0]
    return out


EXTRA = r"""
const OBJECTS = __OBJECTS__;
const MODELS = __MODELS__;
const OBJ_ATLAS = "data:image/png;base64,__OBJ_ATLAS__";
const LINES = __LINES__;
const MARKERS = __MARKERS__;
const ZONES = __ZONES__;
const SCENES = __SCENES__;

const lineVertex = `#version 300 es
in vec3 aPos;
in vec3 aColour;
uniform mat4 uView;
uniform mat4 uProj;
out vec3 vColour;
void main() {
  vColour = aColour;
  gl_Position = uProj * uView * vec4(aPos, 1.0);
}`;
const lineFragment = `#version 300 es
precision highp float;
in vec3 vColour;
out vec4 colour;
void main() {
  colour = vec4(vColour, 1.0);
}`;
const lineProgram = gl.createProgram();
gl.attachShader(lineProgram, compile(gl.VERTEX_SHADER, lineVertex));
gl.attachShader(lineProgram, compile(gl.FRAGMENT_SHADER, lineFragment));
gl.linkProgram(lineProgram);

function lineBuffer(values) {
  const array = new Float32Array(values);
  const vaoLines = gl.createVertexArray();
  gl.bindVertexArray(vaoLines);
  const buffer = gl.createBuffer();
  gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
  gl.bufferData(gl.ARRAY_BUFFER, array, gl.STATIC_DRAW);
  const position = gl.getAttribLocation(lineProgram, "aPos");
  gl.enableVertexAttribArray(position);
  gl.vertexAttribPointer(position, 3, gl.FLOAT, false, 24, 0);
  const tint = gl.getAttribLocation(lineProgram, "aColour");
  gl.enableVertexAttribArray(tint);
  gl.vertexAttribPointer(tint, 3, gl.FLOAT, false, 24, 12);
  gl.bindVertexArray(null);
  return { vao: vaoLines, count: array.length / 6 };
}
const zoneLines = lineBuffer(LINES);
const markerLines = lineBuffer(MARKERS);

function drawLines(projection, viewMatrix) {
  gl.useProgram(lineProgram);
  gl.uniformMatrix4fv(gl.getUniformLocation(lineProgram, "uProj"), false, projection);
  gl.uniformMatrix4fv(gl.getUniformLocation(lineProgram, "uView"), false, viewMatrix);
  if (document.getElementById("zones").checked && zoneLines.count > 0) {
    gl.bindVertexArray(zoneLines.vao);
    gl.drawArrays(gl.LINES, 0, zoneLines.count);
  }
  if (document.getElementById("entrees").checked && markerLines.count > 0) {
    gl.bindVertexArray(markerLines.vao);
    gl.drawArrays(gl.LINES, 0, markerLines.count);
  }
  gl.bindVertexArray(null);
}

function flyTo(x, y, z, size) {
  const d = Math.max(150, size * 1.6);
  camera.x = x - d * 0.7;
  camera.z = z + d * 0.7;
  camera.y = y + d * 0.6;
  camera.yaw = Math.PI / 4;
  camera.pitch = -0.45;
}

const zoneListing = document.getElementById("listeZones");
ZONES.forEach(function (zone) {
  const line = document.createElement("div");
  line.className = "objet";
  const swatch = document.createElement("span");
  swatch.textContent = "■ ";
  swatch.style.color = zone.colour;
  line.appendChild(swatch);
  line.appendChild(document.createTextNode(zone.label));
  line.addEventListener("click", function () {
    flyTo(zone.x, zone.y, zone.z, zone.size);
  });
  zoneListing.appendChild(line);
});

const sceneListing = document.getElementById("listeScenes");
SCENES.forEach(function (scene) {
  const title = document.createElement("div");
  const swatch = document.createElement("span");
  swatch.textContent = "■ ";
  swatch.style.color = scene.colour;
  title.appendChild(swatch);
  title.appendChild(document.createTextNode(scene.label));
  sceneListing.appendChild(title);
  scene.members.forEach(function (member) {
    const line = document.createElement("div");
    line.textContent = "    " + member;
    line.style.whiteSpace = "pre";
    line.style.opacity = "0.8";
    sceneListing.appendChild(line);
  });
});

const objVertex = `#version 300 es
in vec3 aPos;
in vec2 aUv;
in vec3 aColour;
in float aTextured;
uniform mat4 uView;
uniform mat4 uProj;
uniform mat4 uModel;
out vec2 vUv;
out vec3 vColour;
out float vTextured;
out vec3 vWorld;
void main() {
  vec4 w = uModel * vec4(aPos, 1.0);
  vWorld = w.xyz;
  vUv = aUv;
  vColour = aColour;
  vTextured = aTextured;
  gl_Position = uProj * uView * w;
}`;

const objFragment = `#version 300 es
precision highp float;
in vec2 vUv;
in vec3 vColour;
in float vTextured;
in vec3 vWorld;
uniform sampler2D uObjAtlas;
uniform int uAlpha;
uniform int uLight;
out vec4 colour;
void main() {
  vec4 c = vec4(vColour, 1.0);
  if (vTextured > 0.5) {
    c = texture(uObjAtlas, vUv);
    if (uAlpha == 1 && c.a < 0.5) {
      discard;
    }
  }
  if (uLight == 1) {
    vec3 n = normalize(cross(dFdx(vWorld), dFdy(vWorld)));
    float l = 0.55 + 0.45 * abs(dot(n, normalize(vec3(0.4, 0.8, 0.3))));
    c.rgb *= l;
  }
  colour = vec4(c.rgb, 1.0);
}`;

const objProgram = gl.createProgram();
gl.attachShader(objProgram, compile(gl.VERTEX_SHADER, objVertex));
gl.attachShader(objProgram, compile(gl.FRAGMENT_SHADER, objFragment));
gl.linkProgram(objProgram);
const objStride = 9;
const modelBuffers = {};
for (const name in MODELS) {
  const array = new Float32Array(MODELS[name]);
  const vaoModel = gl.createVertexArray();
  gl.bindVertexArray(vaoModel);
  const buffer = gl.createBuffer();
  gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
  gl.bufferData(gl.ARRAY_BUFFER, array, gl.STATIC_DRAW);
  const attributes = [["aPos", 3, 0], ["aUv", 2, 3], ["aColour", 3, 5], ["aTextured", 1, 8]];
  for (const [attr, size, offset] of attributes) {
    const loc = gl.getAttribLocation(objProgram, attr);
    gl.enableVertexAttribArray(loc);
    gl.vertexAttribPointer(loc, size, gl.FLOAT, false, objStride * 4, offset * 4);
  }
  modelBuffers[name] = { vao: vaoModel, count: array.length / objStride };
}
gl.bindVertexArray(null);

const objTexture = gl.createTexture();
const objImage = new Image();
objImage.onload = function () {
  gl.activeTexture(gl.TEXTURE1);
  gl.bindTexture(gl.TEXTURE_2D, objTexture);
  gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, objImage);
  gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
  gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
  gl.activeTexture(gl.TEXTURE0);
};
objImage.src = OBJ_ATLAS;

function modelMatrix(o, scale) {
  const a = o.heading * Math.PI / 180;
  const c = Math.cos(a) * scale;
  const s = Math.sin(a) * scale;
  // Sommet du modèle rangé en (c0, c2, -c1). Colonnes : c0 -> (cos, 0, sin) ; c2 -> y ; -c1 -> (-sin, 0, cos),
  // soit le nez (+c1) vers (sin, 0, -cos) : cap 0 = nord (-z), cap 90 = est (+x).
  return new Float32Array([c, 0, s, 0, 0, scale, 0, 0, -s, 0, c, 0, o.x, o.y, o.z, 1]);
}

const listing = document.getElementById("objets");
OBJECTS.forEach(function (o, k) {
  const line = document.createElement("div");
  line.className = "objet";
  line.textContent = o.label;
  line.addEventListener("click", function () {
    const d = 60 + 4 * o.radius;
    camera.x = o.x - d * 0.7;
    camera.z = o.z + d * 0.7;
    camera.y = o.y + d * 0.5;
    camera.yaw = Math.PI / 4;
    camera.pitch = -0.4;
  });
  listing.appendChild(line);
});

function drawExtra(projection, viewMatrix) {
  drawLines(projection, viewMatrix);
  gl.useProgram(objProgram);
  gl.activeTexture(gl.TEXTURE1);
  gl.bindTexture(gl.TEXTURE_2D, objTexture);
  gl.uniform1i(gl.getUniformLocation(objProgram, "uObjAtlas"), 1);
  gl.uniform1i(gl.getUniformLocation(objProgram, "uAlpha"), document.getElementById("alpha").checked ? 1 : 0);
  gl.uniform1i(gl.getUniformLocation(objProgram, "uLight"), document.getElementById("lumiere").checked ? 1 : 0);
  gl.uniformMatrix4fv(gl.getUniformLocation(objProgram, "uProj"), false, projection);
  gl.uniformMatrix4fv(gl.getUniformLocation(objProgram, "uView"), false, viewMatrix);
  const uModel = gl.getUniformLocation(objProgram, "uModel");
  const scale = Number(document.getElementById("echelle").value);
  gl.disable(gl.CULL_FACE);
  for (const o of OBJECTS) {
    const m = modelBuffers[o.model];
    if (m === undefined) {
      continue;
    }
    gl.uniformMatrix4fv(uModel, false, modelMatrix(o, scale));
    gl.bindVertexArray(m.vao);
    gl.drawArrays(gl.TRIANGLES, 0, m.count);
  }
  gl.bindVertexArray(null);
  gl.activeTexture(gl.TEXTURE0);
}
"""

PANEL = r"""<label><input type="checkbox" id="alpha" checked> indice 255 des textures d'objets transparent (supposé)</label>
<label><input type="checkbox" id="lumiere" checked> éclairage simple des objets (pas celui du jeu)</label>
<label>agrandir les objets × <select id="echelle"><option>1</option><option>5</option><option>20</option></select></label>
<label><input type="checkbox" id="zones" checked> zones (dimensions des tests du jeu)</label>
<label><input type="checkbox" id="entrees" checked> point d'entrée supposé du joueur dans une scène (blanc)</label>
<div style="margin-top:6px"><b>Zones</b> (clic : aller voir)</div>
<div id="listeZones" style="max-height:15vh; overflow:auto; font-family:monospace; font-size:12px"></div>
<div style="margin-top:6px"><b>Scènes</b> (objets PART qui apparaissent à l'entrée)</div>
<div id="listeScenes" style="max-height:18vh; overflow:auto; font-family:monospace; font-size:12px"></div>
<div style="margin-top:6px"><b>Objets PART</b> (clic : aller voir)</div>
<div id="objets" style="max-height:18vh; overflow:auto; font-family:monospace; font-size:12px"></div>
<style>.objet { cursor: pointer; white-space: nowrap; } .objet:hover { color: #ffd479; }</style>"""


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("donnees")
    ap.add_argument("mission")
    ap.add_argument("--html", required=True)
    ap.add_argument("--avion", default="camel")
    args = ap.parse_args()
    missions = os.path.join(args.donnees, "MISSIONS")
    mission_path = find_file(missions, args.mission + ".IFF")
    found = chunks(open(mission_path, "rb").read())
    world_name = found["/MISN/WRLD/FILE"].split(b"\0")[0].decode("latin1")
    world = chunks(open(find_file(missions, world_name + ".IFF"), "rb").read())
    tera = [v for k, v in world.items() if k.endswith("/TERA")][0].split(b"\0")[0].decode("latin1")
    terrain_path = find_file(os.path.join(args.donnees, "TERRAIN"), tera + ".PAK")
    area_body = found.get("/MISN/FARE", found.get("/MISN/AREA", b""))
    areas = read_areas(area_body)
    scene_bodies = []
    mission_data = open(mission_path, "rb").read()
    for where, tag, pos, size in orr.iff_chunks(mission_data, 0, len(mission_data)):
        if tag == "SCNE" and where.endswith("/PLAY"):
            scene_bodies.append(mission_data[pos:pos + size])
    scenes = read_scenes(scene_bodies)
    cast_body = found["/MISN/CAST"]
    cast = []
    for k in range(0, len(cast_body) - len(cast_body) % 9, 9):
        cast.append(cast_body[k:k + 8].split(b"\0")[0].decode("latin1"))
    parts = read_parts(found["/MISN/PART"], cast)
    programs = read_programs(found.get("/MISN/PROG", b""))
    player, anchors = place(parts, areas, scenes, programs)
    print("%s : monde %s, terrain %s, %d zones, %d objets" % (args.mission, world_name, tera, len(areas), len(parts)))

    palette = wtr.read_palette(os.path.join(args.donnees, "PALETTE", "PALETTE.IFF"))
    objects_dir = os.path.join(args.donnees, "OBJECTS")
    models = {}
    objects = []
    for p in parts:
        model = args.avion if p["name"].lower() == "plch" else p["name"]
        path = find_file(objects_dir, model + ".IFF")
        if path is not None and model.upper() not in models:
            models[model.upper()] = read_model(path)
        pos = p["pos"]
        label = "%-8s %-8s %s" % (p["cast"], model, p["rule"])
        print("  " + label, "" if pos is None else "x %.0f  y %.0f  z %.0f  cap %d" % (pos[0], pos[2], -pos[1], p["total_heading"] % 360))
        if pos is None or path is None:
            continue
        vertices = models[model.upper()][0]
        radius = max(math.sqrt(v[0] ** 2 + v[1] ** 2 + v[2] ** 2) for v in vertices) if vertices else 1.0
        objects.append({
            "model": model.upper(),
            "x": pos[0],
            "y": pos[2],
            "z": -pos[1],
            "heading": p["total_heading"],
            "radius": radius,
            "label": "%s %s" % (p["cast"], model),
        })
    atlas, places = pack_textures(models, palette)
    buffers = {}
    for name, model in models.items():
        buffers[name] = [round(v, 4) for v in model_buffers(name, model, places, palette, (atlas.shape[1], atlas.shape[0]))]

    raw = wtr.pak_entries(open(terrain_path, "rb").read())[1]
    grid = np.frombuffer(raw, dtype=np.uint8).reshape(wtr.SIDE, wtr.SIDE, 2)
    textures = wtr.read_textures(os.path.join(args.donnees, "TXM", "TXMPACK.PAK"))
    terrain_atlas, per_row, slots = wtr.build_atlas(grid, palette, textures)
    colours = {cls: [int(x) for x in palette[colour]] for cls, colour in wtr.CLASS_COLOUR.items()}
    start = player["pos"] if player is not None else (objects[0]["x"], -objects[0]["z"], objects[0]["y"])
    camera = {
        "x": start[0] - 250.0,
        "y": start[2] + 120.0,
        "z": -start[1] + 250.0,
        "yaw": math.pi / 4,
        "pitch": -0.3,
    }
    lines = zone_lines(areas)
    markers = []
    for number, name, origin, heading in anchors:
        a = math.radians(heading)
        nose = (origin[0] + 300 * math.sin(a), origin[1] + 300 * math.cos(a), origin[2] + 300)
        polyline(markers, [(origin[0], origin[1], 0.0), (origin[0], origin[1], origin[2] + 300), nose], (1.0, 1.0, 1.0))
    zone_list = []
    for k, area in enumerate(areas):
        zone_list.append({
            "label": "%d %s (%s)" % (k, area["name"], area["shape"]),
            "colour": area["colour"],
            "x": area["ref"][0],
            "y": area["ref"][2],
            "z": -area["ref"][1],
            "size": max(area["values"][:4]) if area["values"] else 100.0,
        })
    scene_list = []
    for k, scene in enumerate(scenes):
        zone = areas[scene["area"]]["name"] if scene["area"] < len(areas) else "sans zone"
        members = []
        for index in scene["parts"]:
            if index < len(parts):
                q = parts[index]
                members.append("%d %s %s" % (index, q["cast"], args.avion if q["name"].lower() == "plch" else q["name"]))
        scene_list.append({
            "label": "scène %d : %s%s" % (k, zone, "" if scene["active"] else " (inactive au départ)"),
            "colour": areas[scene["area"]]["colour"] if scene["area"] < len(areas) else "#ffffff",
            "members": members,
        })
    extra = EXTRA.replace("__OBJECTS__", json.dumps(objects))
    extra = extra.replace("__LINES__", json.dumps([round(v, 2) for v in lines], separators=(",", ":")))
    extra = extra.replace("__MARKERS__", json.dumps([round(v, 2) for v in markers], separators=(",", ":")))
    extra = extra.replace("__ZONES__", json.dumps(zone_list))
    extra = extra.replace("__SCENES__", json.dumps(scene_list))
    extra = extra.replace("__MODELS__", json.dumps(buffers, separators=(",", ":")))
    extra = extra.replace("__OBJ_ATLAS__", base64.b64encode(wtr.write_png(args.html + ".objets.png", atlas)).decode())
    title = "%s — %s" % (args.mission.upper(), found.get("/MISN/FNAM", b"").split(b"\0")[0].decode("latin1"))
    page = wtr.HTML.replace("__TITLE__", title)
    page = page.replace("__GRID__", base64.b64encode(raw).decode())
    page = page.replace("__ATLAS__", base64.b64encode(wtr.write_png(args.html + ".atlas.png", terrain_atlas)).decode())
    page = page.replace("__SLOTS__", json.dumps(slots))
    page = page.replace("__PER_ROW__", str(per_row))
    page = page.replace("__COLOURS__", json.dumps(colours))
    page = page.replace("__PANEL__", PANEL)
    page = page.replace("__CAMERA__", json.dumps(camera))
    page = page.replace("__EXTRA__", extra)
    open(args.html, "w", encoding="utf-8").write(page)
    print(args.html, len(page), "octets")


if __name__ == "__main__":
    main()
