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
    areas = []
    pos = 0
    while pos < len(body):
        shape = chr(body[pos])
        name = body[pos + 1:pos + 33].split(b"\0")[0].decode("latin1")
        c0, c1, c2 = struct.unpack_from("<3i", body, pos + 33)
        pos += 45
        if shape in AREA_EXTRA:
            pos += 4 * AREA_EXTRA[shape]
        elif shape == "P":
            count = struct.unpack_from("<H", body, pos + 20)[0]
            pos += 22 + 8 * count
        else:
            raise SystemExit("forme de zone inconnue : %r" % shape)
        areas.append({
            "shape": shape,
            "name": name,
            "ref": (c0 / 256.0, c1 / 256.0, c2 / 256.0),
        })
    return areas


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


def place(parts, areas):
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
    for p in parts:
        if p["placement"] == 0:
            continue
        if player is None or "pos" not in player:
            p["pos"] = None
            p["rule"] = "repère du joueur, joueur absent"
            continue
        rows = axes(player["total_heading"])
        pos = list(player["pos"])
        for q in range(3):
            for k in range(3):
                pos[q] += p["offset"][k] * rows[k][q]
        pos[2] = max(pos[2], MIN_RELATIVE_ALTITUDE)
        p["pos"] = pos
        p["total_heading"] = p["heading"] + player["total_heading"]
        p["rule"] = "repère du joueur (départ)"
    return player


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
<div style="margin-top:6px"><b>Objets PART</b> (clic : aller voir)</div>
<div id="objets" style="max-height:40vh; overflow:auto; font-family:monospace; font-size:12px"></div>
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
    cast_body = found["/MISN/CAST"]
    cast = []
    for k in range(0, len(cast_body) - len(cast_body) % 9, 9):
        cast.append(cast_body[k:k + 8].split(b"\0")[0].decode("latin1"))
    parts = read_parts(found["/MISN/PART"], cast)
    player = place(parts, areas)
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
    start = player["pos"] if player is not None else objects[0]
    camera = {
        "x": start[0] - 250.0,
        "y": start[2] + 120.0,
        "z": -start[1] + 250.0,
        "yaw": math.pi / 4,
        "pitch": -0.3,
    }
    extra = EXTRA.replace("__OBJECTS__", json.dumps(objects))
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
