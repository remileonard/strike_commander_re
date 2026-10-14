#!/usr/bin/env python3
"""Vue 3D d'un terrain DATA\\<théâtre>.PAK avec Pygame + PyOpenGL.

Rendu comme le jeu (Render_TerrainPipelineMain → Render_MeshPrimitive_21085, voir DATA_MODEL.md §6.8) :
couleurs de PALETTE.IFF ; couleur de base du triangle = celle du sommet le plus haut (comparaison
non signée) ; teinte du sommet = première + (éclairage × n + 128) ÷ 256 ; teinte interpolée sur
le triangle. Pas de tramage : la teinte est rendue en continu, en mélangeant les deux couleurs de
palette voisines (le jeu, limité à 256 couleurs, tramait en damier). Pistes (.TRI) : octet « couleur »
pris comme index de palette, face unie. Textures du sol non dessinées. La diagonale qui coupe
chaque carré n'est pas établie : touche G pour changer.

Dépendances : pip install pygame "PyOpenGL>=3.1.9" (pas besoin de numpy)

Usage : python3 tools/terrain_3d.py data/ALASKA.PAK [--palette data/PALETTE.IFF]

Commandes :
  souris (bouton gauche enfoncé) : regarder      molette : vitesse
  Z/W ou ↑ : avancer   S ou ↓ : reculer   Q/A ou ← , D ou → : de côté
  Espace : monter      Maj : descendre
  1, 2, 3… : aller à la piste n     O : objet suivant     Origine (Home) : vue d'ensemble
  G : diagonale « \\ » / « / »
  F12 : capture d'écran (PNG)      Échap : quitter
"""

import argparse
import array
import math
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from terrain_map import assemble, read_elevations  # noqa: E402
from terrain_viewer import read_objects, read_palette, read_runways  # noqa: E402
from tri_map import read_pak  # noqa: E402

import pygame  # noqa: E402
from OpenGL import GL  # noqa: E402

CELL_SIZE = 20000

VS = """#version 120
attribute vec3 aPos;
attribute float aShade;
uniform mat4 uMVP;
varying float vShade;
void main() {
    vShade = aShade;
    gl_Position = uMVP * vec4(aPos.x, aPos.y, aPos.z, 1.0);
}
"""

FS = """#version 120
varying float vShade;
uniform sampler2D uPal;
uniform float uSmooth;
vec4 pal(float idx) {
    return texture2D(uPal, vec2((clamp(idx, 0.0, 255.0) + 0.5) / 256.0, 0.5));
}
void main() {
    float base = floor(vShade);
    float t = (vShade - base) * uSmooth;
    gl_FragColor = mix(pal(base), pal(base + 1.0), t);
}
"""


# --- données ---------------------------------------------------------------------------------

class Terrain:
    def __init__(self, pak_path, palette_path):
        data = open(pak_path, "rb").read()
        top = read_pak(data)
        cells = read_elevations(data, top, 1)
        self.grid = int(math.isqrt(len(cells)))
        n = cells[0][0]
        self.n = self.grid * n
        self.spacing = CELL_SIZE / n
        self.half = self.grid * CELL_SIZE / 2
        height, light = assemble(cells, self.grid)
        colour = [[0] * self.n for _ in range(self.n)]
        for c, (_, verts) in enumerate(cells):
            row, col = divmod(c, self.grid)
            for k, v in enumerate(verts):
                i, j = divmod(k, n)
                colour[row * n + i][col * n + j] = v[2]
        self.h = [v for row in height for v in row]
        self.light = [v for row in light for v in row]
        self.colour = [v for row in colour for v in row]
        self.runways = read_runways(data, top, 4)
        self.objects = read_objects(data, top, 5)
        self.palette, self.rang = read_palette(palette_path)
        self.name = os.path.basename(pak_path)

    # Repère GL : x = X du fichier, y = altitude Y, z = −Z du fichier.
    def gl_x(self, j):
        return -self.half + j * self.spacing

    def gl_z(self, i):
        return -(self.half - i * self.spacing)

    def ground(self, x, z):
        fj = (x + self.half) / self.spacing
        fi = (z + self.half) / self.spacing
        j = max(0, min(self.n - 2, int(math.floor(fj))))
        i = max(0, min(self.n - 2, int(math.floor(fi))))
        u = max(0.0, min(1.0, fj - j))
        v = max(0.0, min(1.0, fi - i))
        h = self.h
        n = self.n
        top = h[i * n + j] * (1 - u) + h[i * n + j + 1] * u
        bottom = h[(i + 1) * n + j] * (1 - u) + h[(i + 1) * n + j + 1] * u
        return top * (1 - v) + bottom * v

    def terrain_mesh(self, slash):
        """2 triangles par carré, sommets non partagés : la couleur de base est propre au triangle."""
        n = self.n
        h = self.h
        light = self.light
        colour = self.colour
        rang = self.rang
        pos = array.array("f")
        shade = array.array("f")

        def tri(k0, k1, k2):
            kb = k0
            if (h[k1] & 0xFFFF) >= (h[kb] & 0xFFFF):
                kb = k1
            if (h[k2] & 0xFFFF) >= (h[kb] & 0xFFFF):
                kb = k2
            first, shades, _ = rang[colour[kb]] if colour[kb] < len(rang) else rang[0]
            for k in (k0, k1, k2):
                i, j = divmod(k, n)
                pos.extend((self.gl_x(j), h[k], self.gl_z(i)))
                shade.append(first + ((light[k] * shades + 128) >> 8))

        for i in range(n - 1):
            for j in range(n - 1):
                a = i * n + j
                b = a + 1
                c = a + n
                d = a + n + 1
                if not slash:
                    tri(a, b, d)
                    tri(a, d, c)
                else:
                    tri(a, b, c)
                    tri(d, c, b)
        return pos, shade

    def runway_mesh(self):
        pos = array.array("f")
        shade = array.array("f")
        for r in self.runways:
            for a, b, c, col in r["t"]:
                for k in (a, b, c):
                    x, z = r["v"][k]
                    pos.extend((x, r["y"], -z))
                    shade.append(min(col, 255))
        return pos, shade

    def marker_mesh(self):
        pos = array.array("f")
        shade = array.array("f")
        for o in self.objects:
            pos.extend((o["x"], o["y"], -o["z"], o["x"], o["y"] + 60, -o["z"]))
            shade.extend((55, 55))
        return pos, shade


# --- OpenGL ----------------------------------------------------------------------------------

def compile_program():
    def shader(kind, src):
        s = GL.glCreateShader(kind)
        GL.glShaderSource(s, src)
        GL.glCompileShader(s)
        if not GL.glGetShaderiv(s, GL.GL_COMPILE_STATUS):
            raise RuntimeError(GL.glGetShaderInfoLog(s).decode())
        return s

    prog = GL.glCreateProgram()
    GL.glAttachShader(prog, shader(GL.GL_VERTEX_SHADER, VS))
    GL.glAttachShader(prog, shader(GL.GL_FRAGMENT_SHADER, FS))
    GL.glBindAttribLocation(prog, 0, "aPos")
    GL.glBindAttribLocation(prog, 1, "aShade")
    GL.glLinkProgram(prog)
    if not GL.glGetProgramiv(prog, GL.GL_LINK_STATUS):
        raise RuntimeError(GL.glGetProgramInfoLog(prog).decode())
    return prog


class Mesh:
    def __init__(self, pos, shade):
        self.vbo_pos = GL.glGenBuffers(1)
        self.vbo_shade = GL.glGenBuffers(1)
        self.upload(pos, shade)

    def upload(self, pos, shade):
        GL.glBindBuffer(GL.GL_ARRAY_BUFFER, self.vbo_pos)
        GL.glBufferData(GL.GL_ARRAY_BUFFER, len(pos) * 4, pos.tobytes(), GL.GL_STATIC_DRAW)
        GL.glBindBuffer(GL.GL_ARRAY_BUFFER, self.vbo_shade)
        GL.glBufferData(GL.GL_ARRAY_BUFFER, len(shade) * 4, shade.tobytes(), GL.GL_STATIC_DRAW)
        self.count = len(shade)

    def draw(self, mode):
        GL.glBindBuffer(GL.GL_ARRAY_BUFFER, self.vbo_pos)
        GL.glEnableVertexAttribArray(0)
        GL.glVertexAttribPointer(0, 3, GL.GL_FLOAT, GL.GL_FALSE, 0, None)
        GL.glBindBuffer(GL.GL_ARRAY_BUFFER, self.vbo_shade)
        GL.glEnableVertexAttribArray(1)
        GL.glVertexAttribPointer(1, 1, GL.GL_FLOAT, GL.GL_FALSE, 0, None)
        GL.glDrawArrays(mode, 0, self.count)


def palette_texture(pal):
    tex = GL.glGenTextures(1)
    GL.glBindTexture(GL.GL_TEXTURE_2D, tex)
    rgba = bytearray()
    for k in range(256):
        rgba += bytes((pal[3 * k], pal[3 * k + 1], pal[3 * k + 2], 255))
    GL.glTexImage2D(GL.GL_TEXTURE_2D, 0, GL.GL_RGBA, 256, 1, 0, GL.GL_RGBA, GL.GL_UNSIGNED_BYTE, bytes(rgba))
    for p in (GL.GL_TEXTURE_MIN_FILTER, GL.GL_TEXTURE_MAG_FILTER):
        GL.glTexParameteri(GL.GL_TEXTURE_2D, p, GL.GL_NEAREST)
    for p in (GL.GL_TEXTURE_WRAP_S, GL.GL_TEXTURE_WRAP_T):
        GL.glTexParameteri(GL.GL_TEXTURE_2D, p, GL.GL_CLAMP_TO_EDGE)
    return tex


# --- matrices (colonnes d'abord, comme OpenGL) ------------------------------------------------

def perspective(fovy, aspect, near, far):
    t = 1 / math.tan(fovy / 2)
    return [t / aspect, 0, 0, 0,
            0, t, 0, 0,
            0, 0, (far + near) / (near - far), -1,
            0, 0, 2 * far * near / (near - far), 0]


def look(eye, fwd):
    f = normalize(fwd)
    s = normalize(cross(f, (0, 1, 0)))
    u = cross(s, f)
    return [s[0], u[0], -f[0], 0,
            s[1], u[1], -f[1], 0,
            s[2], u[2], -f[2], 0,
            -dot(s, eye), -dot(u, eye), dot(f, eye), 1]


def multiply(a, b):
    out = [0.0] * 16
    for c in range(4):
        for r in range(4):
            out[c * 4 + r] = sum(a[k * 4 + r] * b[c * 4 + k] for k in range(4))
    return out


def cross(a, b):
    return (a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0])


def dot(a, b):
    return a[0] * b[0] + a[1] * b[1] + a[2] * b[2]


def normalize(a):
    length = math.sqrt(dot(a, a)) or 1.0
    return (a[0] / length, a[1] / length, a[2] / length)


# --- caméra ----------------------------------------------------------------------------------

class Camera:
    def __init__(self):
        self.x = -139500.0
        self.y = 900.0
        self.z = 58600.0
        self.yaw = math.pi / 2          # 0 = vers +Z du fichier, π/2 = vers +X
        self.pitch = -0.12
        self.speed = 300.0

    def forward(self):
        cp = math.cos(self.pitch)
        return (cp * math.sin(self.yaw), math.sin(self.pitch), -cp * math.cos(self.yaw))

    def go_to(self, x, y, z, dist):
        self.x = x - dist
        self.z = z
        self.y = y + dist * 0.4
        self.yaw = math.pi / 2
        self.pitch = -0.38
        self.speed = max(100.0, dist / 4)


# --- programme -------------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("pak")
    ap.add_argument("--palette", default=None, help="PALETTE.IFF (défaut : à côté du .PAK)")
    ap.add_argument("--size", default="1280x800", help="taille de la fenêtre")
    ap.add_argument("--screenshot", default=None, help="rend une image dans ce PNG puis quitte")
    args = ap.parse_args()

    palette_path = args.palette or os.path.join(os.path.dirname(args.pak), "PALETTE.IFF")
    print("lecture du terrain…")
    world = Terrain(args.pak, palette_path)
    width, height = (int(v) for v in args.size.split("x"))

    pygame.init()
    pygame.display.set_mode((width, height), pygame.OPENGL | pygame.DOUBLEBUF | pygame.RESIZABLE)
    pygame.display.set_caption(f"{world.name} — 3D")
    font = pygame.font.SysFont("monospace", 14)

    prog = compile_program()
    GL.glUseProgram(prog)
    u_mvp = GL.glGetUniformLocation(prog, "uMVP")
    u_smooth = GL.glGetUniformLocation(prog, "uSmooth")
    GL.glUniform1i(GL.glGetUniformLocation(prog, "uPal"), 0)
    tex = palette_texture(world.palette)

    slash = False
    print("construction du maillage…")
    terrain = Mesh(*world.terrain_mesh(slash))
    runways = Mesh(*world.runway_mesh())
    markers = Mesh(*world.marker_mesh())

    cam = Camera()
    obj_index = -1
    dragging = False
    clock = pygame.time.Clock()
    running = True
    frames = 0

    def runway_centre(r):
        xs = [v[0] for v in r["v"]]
        zs = [v[1] for v in r["v"]]
        return (min(xs) + max(xs)) / 2, r["y"], -(min(zs) + max(zs)) / 2

    while running:
        dt = min(0.1, clock.tick(60) / 1000)
        for e in pygame.event.get():
            if e.type == pygame.QUIT:
                running = False
            elif e.type == pygame.VIDEORESIZE:
                width, height = e.w, e.h
            elif e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
                dragging = True
            elif e.type == pygame.MOUSEBUTTONUP and e.button == 1:
                dragging = False
            elif e.type == pygame.MOUSEMOTION and dragging:
                cam.yaw += e.rel[0] * 0.004
                cam.pitch = max(-1.55, min(1.55, cam.pitch - e.rel[1] * 0.004))
            elif e.type == pygame.MOUSEWHEEL:
                cam.speed = max(20.0, min(20000.0, cam.speed * math.exp(e.y * 0.2)))
            elif e.type == pygame.KEYDOWN:
                if e.key == pygame.K_ESCAPE:
                    running = False
                elif e.key == pygame.K_g:
                    slash = not slash
                    terrain.upload(*world.terrain_mesh(slash))
                elif e.key == pygame.K_HOME:
                    cam.x, cam.y, cam.z = 0.0, 120000.0, 260000.0
                    cam.yaw, cam.pitch, cam.speed = 0.0, -0.6, 5000.0
                elif e.key == pygame.K_o and world.objects:
                    obj_index = (obj_index + 1) % len(world.objects)
                    o = world.objects[obj_index]
                    cam.go_to(o["x"], o["y"], -o["z"], 400)
                elif pygame.K_1 <= e.key <= pygame.K_9:
                    k = e.key - pygame.K_1
                    if k < len(world.runways):
                        x, y, z = runway_centre(world.runways[k])
                        cam.go_to(x, y, z, 3000)
                elif e.key == pygame.K_F12:
                    save_png(width, height, "terrain_3d.png")

        keys = pygame.key.get_pressed()
        f = cam.forward()
        side = normalize(cross(f, (0, 1, 0)))
        step = cam.speed * dt

        def move(v, k):
            cam.x += v[0] * k
            cam.y += v[1] * k
            cam.z += v[2] * k

        if keys[pygame.K_w] or keys[pygame.K_z] or keys[pygame.K_UP]:
            move(f, step)
        if keys[pygame.K_s] or keys[pygame.K_DOWN]:
            move(f, -step)
        if keys[pygame.K_a] or keys[pygame.K_q] or keys[pygame.K_LEFT]:
            move(side, -step)
        if keys[pygame.K_d] or keys[pygame.K_RIGHT]:
            move(side, step)
        if keys[pygame.K_SPACE]:
            cam.y += step
        if keys[pygame.K_LSHIFT] or keys[pygame.K_RSHIFT]:
            cam.y -= step
        ground = world.ground(cam.x, cam.z)
        cam.y = max(cam.y, ground + 5)

        GL.glViewport(0, 0, width, height)
        GL.glClearColor(0.55, 0.66, 0.78, 1)
        GL.glClear(GL.GL_COLOR_BUFFER_BIT | GL.GL_DEPTH_BUFFER_BIT)
        GL.glEnable(GL.GL_DEPTH_TEST)
        GL.glUseProgram(prog)
        near = max(2.0, (cam.y - ground) * 0.05)
        mvp = multiply(perspective(math.radians(60), width / max(1, height), near, 600000.0),
                       look((cam.x, cam.y, cam.z), f))
        GL.glUniformMatrix4fv(u_mvp, 1, GL.GL_FALSE, mvp)
        GL.glActiveTexture(GL.GL_TEXTURE0)
        GL.glBindTexture(GL.GL_TEXTURE_2D, tex)
        GL.glUniform1f(u_smooth, 1.0)
        terrain.draw(GL.GL_TRIANGLES)
        GL.glUniform1f(u_smooth, 0.0)
        GL.glEnable(GL.GL_POLYGON_OFFSET_FILL)
        GL.glPolygonOffset(-2, -8)
        runways.draw(GL.GL_TRIANGLES)
        GL.glDisable(GL.GL_POLYGON_OFFSET_FILL)
        markers.draw(GL.GL_LINES)

        cap = math.degrees(cam.yaw) % 360
        lines = [f"X {cam.x:.0f} m   Z {-cam.z:.0f} m",
                 f"altitude Y {cam.y:.0f} m   sol {ground:.0f} m",
                 f"cap {cap:.0f}°   vitesse {cam.speed:.0f} m/s",
                 f"diagonale {'/' if slash else chr(92)}"]
        if obj_index >= 0:
            lines.append(f"objet : {world.objects[obj_index]['name']}")
        draw_hud(font, lines, height)
        pygame.display.flip()

        frames += 1
        if args.screenshot and frames == 3:
            save_png(width, height, args.screenshot)
            running = False
    pygame.quit()


def draw_hud(font, lines, height):
    GL.glUseProgram(0)
    GL.glDisable(GL.GL_DEPTH_TEST)
    y = height - 8
    for text in lines:
        surf = font.render(text, True, (240, 245, 240), (0, 0, 0))
        data = pygame.image.tostring(surf, "RGBA", True)
        y -= surf.get_height()
        GL.glWindowPos2d(8, y)
        GL.glDrawPixels(surf.get_width(), surf.get_height(), GL.GL_RGBA, GL.GL_UNSIGNED_BYTE, data)


def save_png(width, height, path):
    GL.glReadBuffer(GL.GL_BACK)
    data = GL.glReadPixels(0, 0, width, height, GL.GL_RGB, GL.GL_UNSIGNED_BYTE)
    surf = pygame.image.fromstring(bytes(data), (width, height), "RGB", True)
    pygame.image.save(surf, path)
    print(f"capture : {path}")


if __name__ == "__main__":
    main()
