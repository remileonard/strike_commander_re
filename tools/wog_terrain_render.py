#!/usr/bin/env python3
"""Terrain de Wings of Glory (TERRAIN\\MAPn.PAK) dessiné comme GLORY.EXE le pose (analysis/wings/README.md § 7.6).

Règles vérifiées dans GLORY.EXE (adresses du code, image chargée à 1000h) :
  - grille de 360 × 360 sommets de 2 octets = entrée 1 du PAK (Terrain_LoadElevationGrid_88DF0) ; pas de 1 000 m,
    colonne 0 à l'ouest (x = (colonne − 180) × 1 000), ligne 0 au nord (en libRealSpace z = (ligne − 180) × 1 000) ;
  - la case (ligne r, colonne c) a pour coins v0 = (r, c), v1 = (r, c + 1), v2 = (r + 1, c + 1), v3 = (r + 1, c) ;
    ses octets sont ceux de v0 (boucle de 8AF89h à 8B164h) ;
  - octet 1 = numéro de texture = entrée de TXM\\TXMPACK.PAK (chargeur 88C24h) ; 255 = aucune ; sans texture,
    texture de la classe (octet 0 & 0Fh) : 0 → textures 0 à 3 tour à tour ((accumulateur >> 6) & 3, 89414h),
    1 → 101, 2 → 100 (8B49Ah à 8B510h) ;
  - une texture entière par case ; coordonnées de texture des coins (en texels, 1,0 = 10000h ; 8B56Eh à 8B5C3h) :
    v0 = (1, 1), v1 = (l − 2, 1), v2 = (l − 2, h − 2), v3 = (1, h − 2) ; l, h = deux premiers mots de l'entrée
    (28F68h), pixels ensuite ligne par ligne ; donc u vers l'est, v vers le sud ;
  - de loin, sans texture : couleur de la classe, 0 → 183 (8 teintes), 1 → 110 (17), 2 → 74 (21) ; la teinte
    avance avec la profondeur entre deux seuils (8B2CCh) ; l'image « couleurs » montre la couleur de base.

Pas d'altitude : aucun octet de la grille n'est une hauteur dans le code lu ; le terrain est dessiné plat.

Usage : python3 tools/wog_terrain_render.py MAP2.PAK --txmpack TXMPACK.PAK --palette PALETTE.IFF
        [--couleurs map2_couleurs.png] [--textures map2_textures.png] [--html map2_3d.html]
"""
import argparse
import base64
import json
import struct
import zlib

import numpy as np

CLASS_COLOUR = {
    0: 183,
    1: 110,
    2: 74,
}
CLASS_TEXTURE = {
    1: 101,
    2: 100,
}
WATER_FRAMES = [
    0,
    1,
    2,
    3,
]
SLOT = 128
SIDE = 360


def pak_entries(data):
    first = struct.unpack_from("<I", data, 4)[0] & 0xFFFFFF
    count = (first - 4) // 4
    offsets = []
    for k in range(count):
        offsets.append(struct.unpack_from("<I", data, 4 + 4 * k)[0] & 0xFFFFFF)
    offsets.append(len(data))
    entries = []
    for k in range(count):
        entries.append(data[offsets[k]:offsets[k + 1]])
    return entries


def read_palette(path):
    data = open(path, "rb").read()
    pos = data.find(b"PALT", 12)
    body = data[pos + 8:]
    count = body[2] | (body[3] << 8)
    rgb = np.frombuffer(body[4:4 + 3 * count], dtype=np.uint8).reshape(count, 3).astype(np.uint16)
    return np.clip(rgb * 255 // 63, 0, 255).astype(np.uint8)


def read_textures(path):
    textures = {}
    for k, entry in enumerate(pak_entries(open(path, "rb").read())):
        if len(entry) < 4:
            continue
        width, height = struct.unpack_from("<HH", entry, 0)
        pixels = np.frombuffer(entry[4:4 + width * height], dtype=np.uint8).reshape(height, width)
        textures[k] = pixels
    return textures


def cell_texture(b0, b1):
    if b1 != 255:
        return b1
    cls = b0 & 0x0F
    if cls == 0:
        return -1
    return CLASS_TEXTURE.get(cls, -2)


def corner_window(pixels, size):
    """Partie de la texture couverte par la case : texels 1 à l − 2 et 1 à h − 2, rééchantillonnée en size × size
    (plus proche voisin)."""
    height, width = pixels.shape
    xs = 1 + (np.arange(size) + 0.5) * (width - 3) / size
    ys = 1 + (np.arange(size) + 0.5) * (height - 3) / size
    return pixels[ys.astype(int)][:, xs.astype(int)]


def write_png(path, rgb):
    height, width, _ = rgb.shape
    raw = b"".join(b"\0" + rgb[y].tobytes() for y in range(height))

    def chunk(tag, body):
        return struct.pack(">I", len(body)) + tag + body + struct.pack(">I", zlib.crc32(tag + body) & 0xFFFFFFFF)

    header = struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0)
    png = b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", header) + chunk(b"IDAT", zlib.compress(raw, 9)) + chunk(b"IEND", b"")
    open(path, "wb").write(png)
    return png


def render_colours(grid, palette, scale):
    b0 = grid[:, :, 0]
    index = np.zeros(b0.shape, dtype=np.uint8)
    for cls, colour in CLASS_COLOUR.items():
        index[(b0 & 0x0F) == cls] = colour
    rgb = palette[index]
    return np.repeat(np.repeat(rgb, scale, axis=0), scale, axis=1)


def render_textures(grid, palette, textures, size):
    cells = SIDE - 1
    out = np.zeros((cells * size, cells * size, 3), dtype=np.uint8)
    cache = {}
    for r in range(cells):
        for c in range(cells):
            t = cell_texture(grid[r, c, 0], grid[r, c, 1])
            if t == -1:
                t = WATER_FRAMES[0]
            if t not in cache:
                if t in textures:
                    cache[t] = palette[corner_window(textures[t], size)]
                else:
                    cache[t] = np.zeros((size, size, 3), dtype=np.uint8)
            out[r * size:(r + 1) * size, c * size:(c + 1) * size] = cache[t]
    return out


def build_atlas(grid, palette, textures):
    used = set()
    for r in range(SIDE - 1):
        for c in range(SIDE - 1):
            t = cell_texture(grid[r, c, 0], grid[r, c, 1])
            if t >= 0:
                used.add(int(t))
    used |= set(WATER_FRAMES)
    used = sorted(int(t) for t in used if int(t) in textures)
    per_row = int(np.ceil(np.sqrt(len(used))))
    atlas = np.zeros((per_row * SLOT, per_row * SLOT, 3), dtype=np.uint8)
    slots = {}
    for k, t in enumerate(used):
        pixels = textures[t]
        height, width = pixels.shape
        xs = ((np.arange(SLOT) + 0.5) * width / SLOT).astype(int)
        ys = ((np.arange(SLOT) + 0.5) * height / SLOT).astype(int)
        y0 = (k // per_row) * SLOT
        x0 = (k % per_row) * SLOT
        atlas[y0:y0 + SLOT, x0:x0 + SLOT] = palette[pixels[ys][:, xs]]
        slots[t] = {
            "slot": k,
            "w": width,
            "h": height,
        }
    return atlas, per_row, slots


HTML = r"""<!doctype html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>__TITLE__</title>
<style>
:root { --fond: #10141a; --texte: #e8e8e8; --panneau: rgba(16, 20, 26, 0.85); }
html, body { margin: 0; height: 100%; background: var(--fond); color: var(--texte); font: 13px system-ui, sans-serif; }
canvas { display: block; width: 100%; height: 100%; }
#aide { position: fixed; left: 12px; top: 12px; background: var(--panneau); padding: 10px 12px; border-radius: 6px; max-width: 360px; line-height: 1.45; }
#aide b { color: #fff; }
label { display: block; margin-top: 4px; }
#pos { margin-top: 6px; font-family: monospace; }
</style>
</head>
<body>
<canvas id="vue"></canvas>
<div id="aide">
<b>__TITLE__</b> — terrain plat, une texture par case de 1 km (règles de GLORY.EXE).<br>
Glisser : orienter · Z / S ou flèches : avancer / reculer · Q / D : côté · A / E : monter / descendre · Maj : vite<br>
<label><input type="checkbox" id="loin"> couleurs lointaines (couleur de base de la classe)</label>
<label><input type="checkbox" id="grille"> grille des cases</label>
<div id="pos"></div>
</div>
<script>
"use strict";
const GRID = "__GRID__";
const ATLAS = "data:image/png;base64,__ATLAS__";
const SLOTS = __SLOTS__;
const PER_ROW = __PER_ROW__;
const COLOURS = __COLOURS__;
const SIDE = 360;

function decodeGrid() {
  const text = atob(GRID);
  const bytes = new Uint8Array(text.length);
  for (let i = 0; i < text.length; i++) {
    bytes[i] = text.charCodeAt(i);
  }
  return bytes;
}

function cellTexture(b0, b1) {
  if (b1 !== 255) {
    return b1;
  }
  const cls = b0 & 15;
  if (cls === 0) {
    return -1;
  }
  if (cls === 1) {
    return 101;
  }
  if (cls === 2) {
    return 100;
  }
  return -2;
}

const canvas = document.getElementById("vue");
const gl = canvas.getContext("webgl2", { antialias: true });

const vertexSource = `#version 300 es
in vec2 aPos;
in vec2 aUv;
in vec4 aSlot;
in vec3 aColour;
uniform mat4 uView;
uniform mat4 uProj;
out vec2 vUv;
flat out vec4 vSlot;
out vec3 vColour;
out float vDepth;
void main() {
  vec4 p = uView * vec4(aPos.x, 0.0, aPos.y, 1.0);
  vDepth = -p.z;
  vUv = aUv;
  vSlot = aSlot;
  vColour = aColour;
  gl_Position = uProj * p;
}`;

const fragmentSource = `#version 300 es
precision highp float;
in vec2 vUv;
flat in vec4 vSlot;
in vec3 vColour;
in float vDepth;
uniform sampler2D uAtlas;
uniform float uPerRow;
uniform vec4 uWater;
uniform int uFar;
uniform int uGrid;
out vec4 colour;
void main() {
  vec3 c;
  if (uFar == 1) {
    c = vColour;
  } else {
    vec3 slot = vSlot.xyz;
    if (vSlot.w > 0.5) {
      slot = uWater.xyz;
    }
    vec2 texel = vec2(1.0) + vUv * (slot.yz - vec2(3.0));
    vec2 inSlot = texel / slot.yz;
    float sx = mod(slot.x, uPerRow);
    float sy = floor(slot.x / uPerRow);
    vec2 uv = (vec2(sx, sy) + inSlot) / uPerRow;
    c = texture(uAtlas, uv).rgb;
  }
  if (uGrid == 1) {
    vec2 e = min(vUv, 1.0 - vUv);
    if (min(e.x, e.y) < 0.015) {
      c = mix(c, vec3(0.0), 0.6);
    }
  }
  colour = vec4(c, 1.0);
}`;

function compile(type, source) {
  const shader = gl.createShader(type);
  gl.shaderSource(shader, source);
  gl.compileShader(shader);
  if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
    throw new Error(gl.getShaderInfoLog(shader));
  }
  return shader;
}

const program = gl.createProgram();
gl.attachShader(program, compile(gl.VERTEX_SHADER, vertexSource));
gl.attachShader(program, compile(gl.FRAGMENT_SHADER, fragmentSource));
gl.linkProgram(program);
gl.useProgram(program);

const grid = decodeGrid();
const cells = SIDE - 1;
const stride = 11;
const data = new Float32Array(cells * cells * 4 * stride);
const index = new Uint32Array(cells * cells * 6);
const corners = [[0, 0], [1, 0], [1, 1], [0, 1]];
let v = 0;
let n = 0;
for (let r = 0; r < cells; r++) {
  for (let c = 0; c < cells; c++) {
    const k = 2 * (r * SIDE + c);
    const b0 = grid[k];
    const b1 = grid[k + 1];
    const t = cellTexture(b0, b1);
    let slot = [0, 128, 128, 0];
    if (t === -1) {
      slot = [0, 128, 128, 1];
    } else if (SLOTS[t] !== undefined) {
      slot = [SLOTS[t].slot, SLOTS[t].w, SLOTS[t].h, 0];
    }
    const rgb = COLOURS[b0 & 15] || [0, 0, 0];
    const base = v / stride;
    for (const [du, dv] of corners) {
      data[v++] = (c + du - 180) * 1000;
      data[v++] = (r + dv - 180) * 1000;
      data[v++] = du;
      data[v++] = dv;
      data[v++] = slot[0];
      data[v++] = slot[1];
      data[v++] = slot[2];
      data[v++] = slot[3];
      data[v++] = rgb[0] / 255;
      data[v++] = rgb[1] / 255;
      data[v++] = rgb[2] / 255;
    }
    index[n++] = base;
    index[n++] = base + 1;
    index[n++] = base + 2;
    index[n++] = base;
    index[n++] = base + 2;
    index[n++] = base + 3;
  }
}

const vao = gl.createVertexArray();
gl.bindVertexArray(vao);
const vbo = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, vbo);
gl.bufferData(gl.ARRAY_BUFFER, data, gl.STATIC_DRAW);
const ibo = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibo);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, index, gl.STATIC_DRAW);
function attribute(name, size, offset) {
  const loc = gl.getAttribLocation(program, name);
  gl.enableVertexAttribArray(loc);
  gl.vertexAttribPointer(loc, size, gl.FLOAT, false, stride * 4, offset * 4);
}
attribute("aPos", 2, 0);
attribute("aUv", 2, 2);
attribute("aSlot", 4, 4);
attribute("aColour", 3, 8);

const atlasTexture = gl.createTexture();
const image = new Image();
image.onload = function () {
  gl.bindTexture(gl.TEXTURE_2D, atlasTexture);
  gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGB, gl.RGB, gl.UNSIGNED_BYTE, image);
  gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
  gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
  gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
  gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
};
image.src = ATLAS;

const uView = gl.getUniformLocation(program, "uView");
const uProj = gl.getUniformLocation(program, "uProj");
gl.uniform1i(gl.getUniformLocation(program, "uAtlas"), 0);
gl.uniform1f(gl.getUniformLocation(program, "uPerRow"), PER_ROW);
const uWater = gl.getUniformLocation(program, "uWater");
const uFar = gl.getUniformLocation(program, "uFar");
const uGrid = gl.getUniformLocation(program, "uGrid");

const camera = { x: -60000, y: 1500, z: -40000, yaw: 0.6, pitch: -0.25 };
const keys = {};
window.addEventListener("keydown", function (e) { keys[e.key.toLowerCase()] = true; });
window.addEventListener("keyup", function (e) { keys[e.key.toLowerCase()] = false; });
let dragging = false;
let lastX = 0;
let lastY = 0;
canvas.addEventListener("mousedown", function (e) { dragging = true; lastX = e.clientX; lastY = e.clientY; });
window.addEventListener("mouseup", function () { dragging = false; });
window.addEventListener("mousemove", function (e) {
  if (!dragging) {
    return;
  }
  camera.yaw += (e.clientX - lastX) * 0.004;
  camera.pitch = Math.max(-1.5, Math.min(1.5, camera.pitch - (e.clientY - lastY) * 0.004));
  lastX = e.clientX;
  lastY = e.clientY;
});

function perspective(fov, aspect, near, far) {
  const f = 1 / Math.tan(fov / 2);
  return new Float32Array([f / aspect, 0, 0, 0, 0, f, 0, 0, 0, 0, (far + near) / (near - far), -1, 0, 0, 2 * far * near / (near - far), 0]);
}

function view() {
  const cy = Math.cos(camera.yaw);
  const sy = Math.sin(camera.yaw);
  const cp = Math.cos(camera.pitch);
  const sp = Math.sin(camera.pitch);
  const f = [sy * cp, sp, -cy * cp];
  const r = [cy, 0, sy];
  const u = [r[1] * f[2] - r[2] * f[1], r[2] * f[0] - r[0] * f[2], r[0] * f[1] - r[1] * f[0]];
  const p = [camera.x, camera.y, camera.z];
  const dot = function (a, b) { return a[0] * b[0] + a[1] * b[1] + a[2] * b[2]; };
  return new Float32Array([r[0], u[0], -f[0], 0, r[1], u[1], -f[1], 0, r[2], u[2], -f[2], 0, -dot(r, p), -dot(u, p), dot(f, p), 1]);
}

let previous = performance.now();
let accumulator = 0;
function frame(now) {
  const dt = Math.min(0.1, (now - previous) / 1000);
  previous = now;
  const speed = (keys["shift"] ? 4000 : 600) * dt;
  const fx = Math.sin(camera.yaw);
  const fz = -Math.cos(camera.yaw);
  if (keys["z"] || keys["w"] || keys["arrowup"]) { camera.x += fx * speed; camera.z += fz * speed; }
  if (keys["s"] || keys["arrowdown"]) { camera.x -= fx * speed; camera.z -= fz * speed; }
  if (keys["d"] || keys["arrowright"]) { camera.x += -fz * speed; camera.z += fx * speed; }
  if (keys["q"] || keys["arrowleft"]) { camera.x -= -fz * speed; camera.z -= fx * speed; }
  if (keys["a"]) { camera.y += speed; }
  if (keys["e"]) { camera.y = Math.max(20, camera.y - speed); }
  accumulator += dt;
  const water = Math.floor(accumulator / 0.25) % 4;
  const ws = SLOTS[water];
  gl.uniform4f(uWater, ws.slot, ws.w, ws.h, 0);
  gl.uniform1i(uFar, document.getElementById("loin").checked ? 1 : 0);
  gl.uniform1i(uGrid, document.getElementById("grille").checked ? 1 : 0);
  const w = canvas.clientWidth * devicePixelRatio;
  const h = canvas.clientHeight * devicePixelRatio;
  if (canvas.width !== w || canvas.height !== h) {
    canvas.width = w;
    canvas.height = h;
  }
  gl.viewport(0, 0, w, h);
  gl.clearColor(0.55, 0.65, 0.8, 1);
  gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
  gl.enable(gl.DEPTH_TEST);
  gl.uniformMatrix4fv(uProj, false, perspective(1.0, w / h, 10, 400000));
  gl.uniformMatrix4fv(uView, false, view());
  gl.drawElements(gl.TRIANGLES, index.length, gl.UNSIGNED_INT, 0);
  const col = Math.floor(camera.x / 1000 + 180);
  const row = Math.floor(camera.z / 1000 + 180);
  document.getElementById("pos").textContent = "x " + Math.round(camera.x) + " m · z " + Math.round(camera.z) + " m · altitude " + Math.round(camera.y) + " m · case ligne " + row + ", colonne " + col;
  requestAnimationFrame(frame);
}
requestAnimationFrame(frame);
</script>
</body>
</html>
"""


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("pak")
    ap.add_argument("--txmpack", required=True)
    ap.add_argument("--palette", required=True)
    ap.add_argument("--couleurs")
    ap.add_argument("--textures")
    ap.add_argument("--taille-case", type=int, default=4)
    ap.add_argument("--html")
    ap.add_argument("--titre", default="MAP2")
    args = ap.parse_args()
    raw = pak_entries(open(args.pak, "rb").read())[1]
    grid = np.frombuffer(raw, dtype=np.uint8).reshape(SIDE, SIDE, 2)
    palette = read_palette(args.palette)
    textures = read_textures(args.txmpack)
    if args.couleurs:
        write_png(args.couleurs, render_colours(grid, palette, 2))
        print(args.couleurs)
    if args.textures:
        write_png(args.textures, render_textures(grid, palette, textures, args.taille_case))
        print(args.textures)
    if args.html:
        atlas, per_row, slots = build_atlas(grid, palette, textures)
        png = write_png(args.html + ".atlas.png", atlas)
        colours = {cls: [int(x) for x in palette[colour]] for cls, colour in CLASS_COLOUR.items()}
        page = HTML.replace("__TITLE__", args.titre)
        page = page.replace("__GRID__", base64.b64encode(raw).decode())
        page = page.replace("__ATLAS__", base64.b64encode(png).decode())
        page = page.replace("__SLOTS__", json.dumps(slots))
        page = page.replace("__PER_ROW__", str(per_row))
        page = page.replace("__COLOURS__", json.dumps(colours))
        open(args.html, "w", encoding="utf-8").write(page)
        print(args.html, len(page), "octets")


if __name__ == "__main__":
    main()
