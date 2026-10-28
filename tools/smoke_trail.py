"""Traînée de fumée d'un avion (chunk SMOK d'un objet), animation d'illustration d'après SMOKE_SYSTEM.md.

L'avion vole en palier en virage régulier ; chaque image, comme SmokeTrail_Tick_3D57E et
Particles_SpawnAlongSegment_4D1C9 : point d'émission P (position + orientation · point du chunk SMOK),
position Q du même point à l'image précédente, N = longueur(Q − P) ÷ espacement du modèle particules de P
vers Q, vieillies de dt + k × dt ÷ N, aléa de dispersion cumulé à partir de la 3e. Puis mise à jour
(vie, taille, teinte, image ; mode T : particule supprimée après la dernière image), projection, compteur
de visibilité (supprimée après 2 images sans dessin) et dessin en mode 2 (table FADE[teinte + c]).

Approximations : mise à l'échelle des sprites au plus proche voisin ; particules triées avec l'avion
entier (plus loin que son centre : avant lui, sinon après) au lieu d'être triées avec chacune de ses faces.

Type de fumée : celui du chunk SMOK de l'objet (traînée allumée par Aircraft_OnCollision_9D910), ou avec
--chute le 8e champ du chunk JINF (octet 11, défaut 6) : avion abattu qui tombe (Aircraft_OnDestroyed_9D770
recopie ce champ dans le type de la traînée avant de l'allumer).

Usage : python3.13 tools/smoke_trail.py --donnees <DATA> [--chute] <objet.IFF> <sortie sans extension>
"""
import math
import os
import random
import struct
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import object_render as orr  # noqa: E402
import sc_data as d  # noqa: E402
import smoke_render as sr  # noqa: E402
from PIL import Image  # noqa: E402

DT = 1 / 15
SPEED = 150.0
TURN_RATE = math.radians(12.0)
FRAMES = 75


class Plane:
    """Avion en virage à plat, repère du jeu (c0 est, c1 nord, c2 haut)."""

    def __init__(self):
        self.pos = [0.0, 0.0, 1000.0]
        self.heading = 0.0

    def axes(self):
        s = math.sin(self.heading)
        c = math.cos(self.heading)
        right = (c, -s, 0.0)
        nose = (s, c, 0.0)
        up = (0.0, 0.0, 1.0)
        return right, nose, up

    def to_world(self, local):
        right, nose, up = self.axes()
        return tuple(self.pos[k] + local[0] * right[k] + local[1] * nose[k] + local[2] * up[k] for k in range(3))

    def to_local(self, world):
        right, nose, up = self.axes()
        rel = [world[k] - self.pos[k] for k in range(3)]
        return (orr.dot(rel, right), orr.dot(rel, nose), orr.dot(rel, up))

    def step(self, dt):
        self.heading += TURN_RATE * dt
        right, nose, up = self.axes()
        for k in range(3):
            self.pos[k] += nose[k] * SPEED * dt


def pick_shape(model, rng):
    if model['shapeA'] == 255:
        return None
    if model['chance'] == 100 or rng.randrange(100) < model['chance']:
        return model['shapeA']
    return model['shapeB']


def spawn_along(parts, model, p_now, q_prev, dt, rng):
    seg = [q_prev[k] - p_now[k] for k in range(3)]
    length = math.sqrt(sum(v * v for v in seg))
    n = int(length / model['spacing'])
    if n == 0 and length > 0:
        n = 1
    if n == 0:
        return
    step = [v / n for v in seg]
    pos = list(p_now)
    rate_size = (model['size1'] - model['size0']) / model['life']
    rate_shade = (model['shade1'] - model['shade0']) / model['life']
    for k in range(n):
        life = model['life'] - dt - k * dt / n
        if life <= 0:
            return
        p = sr.Particle()
        p.x = pos[0]
        p.y = pos[1]
        p.z = pos[2]
        p.life = life
        p.size = model['size0'] + k * rate_size * dt / n
        p.shade = model['shade0'] + k * rate_shade * dt / n
        p.frame = int(k * model['fps'] * dt / n)
        p.acc = 0.0
        p.seen = 2
        p.drawn = False
        p.shape = pick_shape(model, rng)
        parts.append(p)
        jitter = model['jitter']
        for a in range(3):
            pos[a] += step[a]
            if 0 < k < n - 1:
                pos[a] += rng.uniform(-jitter, jitter)


def update(parts, model, shapes, dt):
    alive = []
    for p in parts:
        p.life -= dt
        if p.life <= 0:
            continue
        if p.drawn:
            p.seen = 2
        else:
            p.seen -= 1
            if p.seen == 0:
                continue
        p.drawn = False
        if model['step'] != 0 and p.shape is not None:
            p.acc += model['fps'] * dt
            if p.acc > 1:
                p.acc -= 1
                last = len(d.shape_images(shapes[p.shape])) - 1
                nxt = p.frame + model['step']
                if model['mode'] == 'T' and (nxt > last or nxt < 0):
                    continue
                if model['mode'] == 'W':
                    nxt %= last + 1
                p.frame = max(0, min(last, nxt))
        p.size += (model['size1'] - model['size0']) / model['life'] * dt
        p.shade += (model['shade1'] - model['shade0']) / model['life'] * dt
        alive.append(p)
    return alive


def nearest_index(rgb, colour, cache):
    if colour not in cache:
        cache[colour] = sr.nearest(rgb, colour)
    return cache[colour]


def main():
    args = sys.argv[1:]
    falling = '--chute' in args
    if falling:
        args.remove('--chute')
    if len(args) != 2:
        raise SystemExit(__doc__)
    obj_path = args[0]
    out = args[1]
    models, shapes = sr.load_smoke_set(os.path.join(d.GAME, 'OBJECTS', 'SMOKESET.IFF'))
    smoke_type, point = sr.smok_chunk(obj_path)
    if falling:
        smoke_type = sr.jinf_smoke_type(obj_path)
    model = models[smoke_type]
    print('type de fumée', smoke_type, 'point', point, model)
    rgb = sr.palette_rgb()
    tables = sr.fade_tables()
    pal_path = os.path.join(d.GAME, 'PALETTE', 'PALETTE.IFF')
    model3d = orr.Model(obj_path)
    shading = orr.Shading(pal_path, 3, 5, (-10.0, -25.0, 100.0))
    # Caméra de poursuite fixe dans le repère de l'avion : vise 45 m derrière lui, 150° depuis le nez, 12° au-dessus.
    target = (model3d.centre[0], model3d.centre[1] - 45.0, model3d.centre[2])
    camera = orr.Camera(target, 150.0, 12.0, 95.0, 277.0)
    sky = nearest_index(rgb, (109, 145, 182), {})
    ground = nearest_index(rgb, (110, 100, 60), {})
    # œil 12° au-dessus de l'avion : l'horizon est 277 × tan(12°) pixels au-dessus du centre.
    horizon = int(orr.HEIGHT / 2 - 277.0 * math.tan(math.radians(12.0)))
    rng = random.Random(5)
    plane = Plane()
    parts = []
    previous = plane.to_world(point)
    cache = {}
    images = []
    warmup = int(model['life'] / DT) + 2
    for f in range(warmup + FRAMES):
        q_prev = previous
        plane.step(DT)
        p_now = plane.to_world(point)
        spawn_along(parts, model, p_now, q_prev, DT, rng)
        previous = p_now
        parts = update(parts, model, shapes, DT)
        canvas = orr.Canvas(sky)
        for i in range(horizon * orr.WIDTH, orr.WIDTH * orr.HEIGHT):
            canvas.px[i] = ground
        plane_depth = camera.to_camera(model3d.centre)[1]
        drawn = []
        for p in parts:
            local = plane.to_local((p.x, p.y, p.z))
            c = camera.to_camera(local)
            depth = c[1]
            if depth <= 1.0 or p.shape is None:
                continue
            sx, sy = camera.project(c)
            radius = p.size * camera.focal / depth
            if radius <= 153 / 256:
                continue
            drawn.append((depth, sx, sy, p))
        drawn.sort(key=lambda v: -v[0])
        far = [v for v in drawn if v[0] > plane_depth]
        near = [v for v in drawn if v[0] <= plane_depth]
        draw_particles(canvas, far, shapes, tables, model, rgb, cache)
        render_plane(canvas, model3d, shading, camera)
        draw_particles(canvas, near, shapes, tables, model, rgb, cache)
        if f >= warmup:
            images.append(to_image(canvas, shading).resize((640, 400), Image.NEAREST))
    images[0].save(out + '.gif', save_all=True, append_images=images[1:], duration=int(DT * 1000), loop=0)
    images[len(images) // 2].save(out + '.png')


def draw_particles(canvas, items, shapes, tables, model, rgb, cache):
    for i, px in enumerate(canvas.px):
        if isinstance(px, tuple):
            canvas.px[i] = nearest_index(rgb, tuple(px[1:4]), cache)
    for depth, sx, sy, p in items:
        sh = shapes[p.shape]
        frame = min(p.frame, len(d.shape_images(sh)) - 1)
        scale = p.size * 277.0 / (depth * sr.shape_half_size(sh))
        sr.draw_scaled(canvas.px, orr.WIDTH, orr.HEIGHT, sh, frame, sx, sy, scale, tables, int(p.shade),
                       model['first'], model['count'])
        p.drawn = True


def render_plane(canvas, model, shading, camera):
    level = model.levels[0][2]
    cam_v = [camera.to_camera(tuple(c / 256.0 for c in v)) for v in model.vertices]
    scr_v = [camera.project(c) for c in cam_v]
    eye_local = tuple(e * 256.0 for e in camera.eye)
    queue = []
    for fi in level:
        if fi >= len(model.faces):
            continue
        f = model.faces[fi]
        if not (f[7] & 1):
            if orr.dot(orr.sub(model.centroid[fi], eye_local), model.face_normal[fi]) >= 0:
                continue
        queue.append((max(cam_v[v][1] for v in f[1:4]), fi))
    queue.sort(reverse=True)
    for _, fi in queue:
        orr.draw_face(canvas, model, shading, fi, scr_v)


def to_image(canvas, shading):
    out = bytearray()
    for c in canvas.px:
        if isinstance(c, tuple):
            out += bytes(c[1:4])
        else:
            out += bytes(shading.rgb[3 * c:3 * c + 3])
    return Image.frombytes('RGB', (orr.WIDTH, orr.HEIGHT), bytes(out))


if __name__ == '__main__':
    main()
