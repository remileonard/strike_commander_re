"""Fumées de STRIKE.EXE : planches et rendu d'illustration, d'après analysis/SMOKE_SYSTEM.md.

Données : OBJECTS\\SMOKESET.IFF (formes compressées LZ de la version CD acceptées), OBJECTS\\SMOKEGEN.IFF,
PALETTE\\PALETTE.IFF (chunk PALT) et PALETTE\\PALFADE.IFF (chunk FADE : 44 tables de 256 octets).

Le rendu suit Particle_SpawnWithColor, Particle_UpdateLifeSizeShadeFrame_4C413, Particle_ProjectToScreen_4C1EE,
le tri du plus loin au plus proche et Particle_Draw_4C7ED (mode 2 : couleur c dans A … A + B − 1 →
FADE[teinte + c − A][fond]). La mise à l'échelle du sprite (Render_DrawScaledSprite_621A2, non lue en
détail) est faite ici au plus proche voisin, image posée par son point d'ancrage : rendu d'illustration.

Usage : python3.13 tools/smoke_render.py --donnees <BIGTRE.TRE ou DATA> <dossier de sortie>
"""
import os
import random
import struct
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sc_data as d  # noqa: E402
from terrain_map import lzw  # noqa: E402

try:
    from PIL import Image
    from PIL import ImageDraw
    from PIL import ImageFont
except ImportError:
    # Lecture seule des données (tools/object_viewer.py) : les planches demandent Pillow.
    Image = None
    ImageDraw = None
    ImageFont = None

FONT_PATH = '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf'
BACKGROUND = (60, 70, 80)


def font(size):
    try:
        return ImageFont.truetype(FONT_PATH, size)
    except OSError:
        return None


def chunks(data, start, end):
    """(tag, données, début, fin) des enfants d'un FORM ; un chunk qui commence par LZ est décompressé."""
    o = start
    while o + 8 <= end:
        tag = data[o:o + 4]
        n = struct.unpack('>I', data[o + 4:o + 8])[0]
        yield tag, data[o + 8:o + 8 + n], o + 8, o + 8 + n
        o += 8 + n + (n & 1)


def unpack_lz(chunk):
    """Chunk compressé de la version CD : 'LZ', uint32 taille décompressée, données LZW."""
    if chunk[:2] != b'LZ':
        return chunk
    size = struct.unpack_from('<I', chunk, 2)[0]
    out = lzw(chunk[6:])
    assert len(out) == size
    return out


def load_smoke_set(path):
    data = d.read(path)
    models = []
    shapes = []
    for tag, body, s, e in chunks(data, 12, len(data)):
        if tag != b'FORM' or body[:4] != b'TYPE':
            continue
        for tag2, body2, s2, e2 in chunks(data, s + 4, e):
            kind = body2[:4]
            if kind == b'SMOK':
                model = {'shapeA': 255, 'shapeB': 255, 'step': 0, 'fps': 0, 'mode': 'W', 'order': []}
                for tag3, c, _, _ in chunks(data, s2 + 4, e2):
                    if tag3 == b'INFO':
                        spacing, s0, s1, life, jitter = struct.unpack_from('<5i', c, 1)
                        model.update(render=c[0], spacing=spacing / 256, size0=s0 / 256, size1=s1 / 256,
                                     life=life / 256, jitter=(jitter & 0xFFFF) / 256, shade0=c[21],
                                     shade1=c[22], first=c[23], count=c[24])
                    elif tag3 == b'ANIM':
                        model.update(shapeA=c[0], chance=c[1], shapeB=c[2], mode=chr(c[3]),
                                     fps=struct.unpack_from('<h', c, 4)[0], step=struct.unpack_from('<h', c, 6)[0])
                    elif tag3 == b'SCRI':
                        model['order'] = list(c)
                models.append(model)
            elif kind == b'SHAP':
                for tag3, c, _, _ in chunks(data, s2 + 4, e2):
                    if tag3 == b'SHAP':
                        shapes.append(unpack_lz(c))
    return models, shapes


def smkg_info(path):
    data = d.read(path)
    i = data.find(b'SMKG')
    j = data.find(b'INFO', i)
    c = data[j + 8:j + 8 + struct.unpack('>I', data[j + 4:j + 8])[0]]
    duration, rise, interval = struct.unpack_from('<3i', c, 1)
    return {'type': c[0], 'duration': duration / 256, 'rise': rise / 256, 'interval': interval / 256,
            'chance': struct.unpack_from('<H', c, 13)[0], 'remove': c[15]}


def smok_chunk(path):
    """Chunk SMOK d'un objet : uint8 type de fumée, 3 int32 24.8 point d'émission (repère de l'objet, jeu)."""
    data = open(path, 'rb').read()
    i = data.find(b'SMOK')
    while i >= 0:
        n = struct.unpack('>I', data[i + 4:i + 8])[0]
        if n == 13 and data[i - 4:i] != b'FORM':
            x, y, z = struct.unpack_from('<3i', data, i + 9)
            return data[i + 8], (x / 256, y / 256, z / 256)
        i = data.find(b'SMOK', i + 1)
    return None


def jinf_smoke_type(path):
    """8e champ du chunk JINF (octet 11, uint8 → modèle +0x58) ; sans JINF : 6 (Aircraft_LoadEJECAndJINF_9D4F0)."""
    data = open(path, 'rb').read()
    i = data.find(b'JINF')
    if i < 0:
        return 6
    return data[i + 8 + 11]


def palette_rgb():
    data = d.read(os.path.join(d.GAME, 'PALETTE', 'PALETTE.IFF'))
    i = data.find(b'PALT', 12)
    raw = data[i + 12:i + 12 + 768]
    return bytes(min(255, v * 255 // 63) for v in raw)


def fade_tables():
    data = d.read(os.path.join(d.GAME, 'PALETTE', 'PALFADE.IFF'))
    i = data.find(b'FADE')
    n = struct.unpack('>I', data[i + 4:i + 8])[0]
    return data[i + 8:i + 8 + n]


def to_rgb(indexed, w, h, rgb):
    im = Image.frombytes('P', (w, h), bytes(indexed))
    im.putpalette(rgb)
    return im.convert('RGB')


def nearest(rgb, target):
    best = 0
    best_d = 1 << 30
    for c in range(256):
        dist = sum((rgb[3 * c + k] - target[k]) ** 2 for k in range(3))
        if dist < best_d:
            best = c
            best_d = dist
    return best


def shape_sheet(shapes, out):
    """Images des formes ; niveaux 0, 1, 2 (couleurs translucides) en gris, autres couleurs avec la palette."""
    rgb = bytearray(palette_rgb())
    rgb[765:768] = bytes(BACKGROUND)
    levels = [(220, 220, 220), (150, 150, 150), (90, 90, 90), (200, 120, 200), (120, 200, 200)]
    for c, col in enumerate(levels):
        rgb[3 * c:3 * c + 3] = bytes(col)
    cell = 72
    rows = []
    for k, sh in enumerate(shapes):
        count = len(d.shape_images(sh))
        row = Image.new('RGB', (cell * 12 + 90, cell + 4), BACKGROUND)
        ImageDraw.Draw(row).text((4, cell // 2 - 7), f'forme {k}', fill=(255, 255, 255), font=font(13))
        for j in range(count):
            buf = bytearray([255]) * (cell * cell)
            d.draw_image(buf, cell, cell, sh, j, cell // 2, cell // 2)
            row.paste(to_rgb(buf, cell, cell, bytes(rgb)), (90 + j * cell, 2))
        rows.append(row)
    sheet = Image.new('RGB', (rows[0].width, sum(r.height for r in rows)))
    y = 0
    for r in rows:
        sheet.paste(r, (0, y))
        y += r.height
    sheet.resize((sheet.width * 2, sheet.height * 2), Image.NEAREST).save(out)


def fade_sheet(out):
    """Chaque table FADE appliquée aux 256 couleurs de la palette (une ligne par table)."""
    rgb = palette_rgb()
    tables = fade_tables()
    count = len(tables) // 256
    w = 256 * 3 + 60
    im = Image.new('RGB', (w, (count + 1) * 10 + 4), BACKGROUND)
    draw = ImageDraw.Draw(im)
    for c in range(256):
        draw.rectangle((60 + 3 * c, 2, 62 + 3 * c, 9), fill=tuple(rgb[3 * c:3 * c + 3]))
    draw.text((4, 1), 'fond', fill=(255, 255, 255), font=font(9))
    for k in range(count):
        y = 12 + 10 * k
        draw.text((4, y - 1), f'table {k}', fill=(255, 255, 255), font=font(9))
        for c in range(256):
            m = tables[256 * k + c]
            draw.rectangle((60 + 3 * c, y, 62 + 3 * c, y + 7), fill=tuple(rgb[3 * m:3 * m + 3]))
    im.resize((im.width * 2, im.height * 2), Image.NEAREST).save(out)


class Particle:
    pass


def spawn(model, gen, rng):
    """Particle_SpawnWithColor : position = origine + aléa de dispersion, vitesse (0, montée, 0)."""
    p = Particle()
    p.x = rng.uniform(-model['jitter'], model['jitter'])
    p.y = rng.uniform(-model['jitter'], model['jitter'])
    p.z = rng.uniform(-model['jitter'], model['jitter'])
    p.vy = gen['rise']
    p.size = model['size0']
    p.life = model['life']
    p.shade = float(model['shade0'])
    p.frame = 0
    p.acc = 0.0
    if model['shapeA'] == 255:
        p.shape = None
    elif model['chance'] == 100 or rng.randrange(100) < model['chance']:
        p.shape = model['shapeA']
    else:
        p.shape = model['shapeB']
    return p


def update(parts, model, dt):
    """Particle_UpdateLifeSizeShadeFrame_4C413 puis Particle_IntegrateVelocity (mode W : boucle)."""
    alive = []
    for p in parts:
        p.life -= dt
        if p.life <= 0:
            continue
        if model['step'] != 0:
            p.acc += model['fps'] * dt
            if p.acc > 1:
                p.acc -= 1
                p.frame += model['step']
        p.size += (model['size1'] - model['size0']) / model['life'] * dt
        p.shade += (model['shade1'] - model['shade0']) / model['life'] * dt
        p.y += p.vy * dt
        alive.append(p)
    return alive


def render_column(models, shapes, gen, out, frames=60):
    """Colonne d'un générateur SMKG vue à 260 m, caméra à 30 m de haut, focale 277 pixels, 15 images/s."""
    rgb = palette_rgb()
    tables = fade_tables()
    sky = nearest(rgb, (90, 140, 210))
    ground = nearest(rgb, (110, 100, 60))
    w = 320
    h = 200
    horizon = 110
    focal = 277.0
    cam_dist = 260.0
    cam_height = 30.0
    model = models[gen['type']]
    rng = random.Random(3)
    dt = 1 / 15
    parts = []
    countdown = 0.0
    images = []
    warmup = int((model['life'] + 1) / dt)
    for f in range(warmup + frames):
        countdown -= dt
        if countdown <= 0:
            countdown = gen['interval']
            parts.append(spawn(model, gen, rng))
        parts = update(parts, model, dt)
        if f < warmup:
            continue
        screen = bytearray([sky]) * (w * horizon) + bytearray([ground]) * (w * (h - horizon))
        visible = []
        for p in parts:
            depth = cam_dist - p.z
            sx = 160 + p.x * focal / depth
            sy = horizon - (p.y - cam_height) * focal / depth
            visible.append((depth, sx, sy, p))
        visible.sort(key=lambda v: -v[0])
        for depth, sx, sy, p in visible:
            if p.shape is None:
                continue
            sh = shapes[p.shape]
            frame = p.frame % len(d.shape_images(sh))
            scale = p.size * focal / (depth * shape_half_size(sh))
            draw_scaled(screen, w, h, sh, frame, sx, sy, scale, tables, int(p.shade), model['first'], model['count'])
        images.append(to_rgb(screen, w, h, rgb).resize((640, 400), Image.NEAREST))
    images[0].save(out + '.gif', save_all=True, append_images=images[1:], duration=67, loop=0)
    images[-1].save(out + '.png')


def shape_half_size(sh):
    """(plus grande hauteur + plus grande largeur des images) ÷ 4 (SmokeSet_LoadShape_A60AC)."""
    widths = []
    heights = []
    for off in d.shape_images(sh):
        right, left, top, bottom = struct.unpack_from('<4h', sh, off)
        widths.append(right + left + 1)
        heights.append(top + bottom + 1)
    return (max(heights) + max(widths)) // 4


def draw_scaled(screen, w, h, sh, frame, cx, cy, scale, tables, shade, first, count):
    spans = list(d.image_spans(sh, frame))
    if not spans:
        return
    pixels = {}
    for x, y, pix in spans:
        for k, c in enumerate(pix):
            pixels[(x + k, y)] = c
    xs = [p[0] for p in pixels]
    ys = [p[1] for p in pixels]
    x0 = int(min(xs) * scale + cx)
    x1 = int(max(xs) * scale + cx) + 1
    y0 = int(min(ys) * scale + cy)
    y1 = int(max(ys) * scale + cy) + 1
    for py in range(max(0, y0), min(h, y1)):
        sy = int((py - cy) / scale) if scale else 0
        for px in range(max(0, x0), min(w, x1)):
            sx = int((px - cx) / scale) if scale else 0
            c = pixels.get((sx, sy))
            if c is None:
                continue
            at = py * w + px
            if first <= c < first + count:
                table = shade + c - first
                if 0 <= table < len(tables) // 256:
                    screen[at] = tables[256 * table + screen[at]]
            else:
                screen[at] = c


def model_sheet(models, shapes, out, samples=8, metres_px=4.0):
    """Chaque modèle sur le ciel, à 8 instants de sa vie (taille, teinte, image), 4 pixels par mètre."""
    rgb = palette_rgb()
    tables = fade_tables()
    sky = nearest(rgb, (109, 145, 182))
    cell = 120
    w = 150 + cell * samples
    h = cell * len(models) + 24
    screen = bytearray([sky]) * (w * h)
    labels = []
    for mi, m in enumerate(models):
        y = 24 + mi * cell + cell // 2
        labels.append((mi, y))
        if m['shapeA'] == 255:
            continue
        for k in range(samples):
            t = m['life'] * k / samples
            size = m['size0'] + (m['size1'] - m['size0']) * t / m['life']
            shade = int(m['shade0'] + (m['shade1'] - m['shade0']) * t / m['life'])
            shape = m['shapeA'] if k % 2 == 0 or m['chance'] == 100 else m['shapeB']
            sh = shapes[shape]
            count = len(d.shape_images(sh))
            frame = min(count - 1, int(t * m['fps'])) if m['mode'] == 'T' else int(t * m['fps']) % count
            scale = size * metres_px / shape_half_size(sh)
            draw_scaled(screen, w, h, sh, frame, 150 + k * cell + cell // 2, y, scale, tables, shade,
                        m['first'], m['count'])
    im = to_rgb(screen, w, h, rgb)
    draw = ImageDraw.Draw(im)
    for k in range(samples):
        draw.text((150 + k * cell + 4, 4), f't = {k}/{samples} vie', fill=(255, 255, 255), font=font(12))
    for mi, y in labels:
        m = models[mi]
        shapes_txt = 'forme ' + str(m['shapeA']) if m['chance'] == 100 else f"formes {m['shapeA']}/{m['shapeB']}"
        draw.text((6, y - 16), f'modèle {mi}', fill=(255, 255, 255), font=font(13))
        draw.text((6, y + 2), shapes_txt, fill=(230, 230, 230), font=font(11))
        draw.text((6, y + 16), f"teinte {m['shade0']}→{m['shade1']}", fill=(230, 230, 230), font=font(11))
    im.save(out)


def main():
    if len(sys.argv) != 2:
        raise SystemExit(__doc__)
    out = sys.argv[1]
    os.makedirs(out, exist_ok=True)
    models, shapes = load_smoke_set(os.path.join(d.GAME, 'OBJECTS', 'SMOKESET.IFF'))
    gen = smkg_info(os.path.join(d.GAME, 'OBJECTS', 'SMOKEGEN.IFF'))
    print(gen)
    shape_sheet(shapes, os.path.join(out, 'smoke_shapes.png'))
    fade_sheet(os.path.join(out, 'fade_tables.png'))
    model_sheet(models, shapes, os.path.join(out, 'smoke_models.png'))
    render_column(models, shapes, gen, os.path.join(out, 'smokegen_column'))


if __name__ == '__main__':
    main()
