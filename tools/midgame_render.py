"""Rendu de référence d'une cinématique : rejoue la simulation de tools/midgame_iff.py (règles du
moteur de scène lues dans OPTEST.EXE), avec le nombre d'images des animations et la durée des
répliques lus dans les données, et dessine chaque image comme le jeu (image hors écran copiée à la
ligne 24, palettes partielles, titres translucides). Voir MID1_PLANS.md.

Usage : python3 tools/midgame_render.py --donnees <DATA> --film mid1.gif [échelle]
        python3 tools/midgame_render.py --donnees <DATA> <dossier> [plans...]   (un GIF par plan)"""
import importlib.util
import os
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]
import json

from PIL import Image

from sc_data import GAME, draw_image, pak_entry, palette_block, read

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
spec = importlib.util.spec_from_file_location('mg', f'{REPO}/tools/midgame_iff.py')
mg = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mg)

W = 320
H = 200
BAND = (0, 24, 319, 151)


def pak_path(name):
    folder = 'GAMEFLOW' if name.upper().startswith('OPT') else 'MIDGAMES'
    return os.path.join(GAME, folder, name.upper() + '.PAK')


def voc_seconds(b):
    """Fichier VOC : blocs (type u8, taille u24) ; type 1 = son (diviseur u8, codec u8, échantillons),
    type 2 = suite ; fréquence = 1 000 000 / (256 − diviseur)."""
    import struct
    p = struct.unpack_from('<H', b, 0x14)[0]
    rate = None
    samples = 0
    while p < len(b) and b[p] != 0:
        kind = b[p]
        size = b[p + 1] | (b[p + 2] << 8) | (b[p + 3] << 16)
        if kind == 1:
            rate = 1000000 / (256 - b[p + 4])
            samples += size - 2
        elif kind == 2:
            samples += size
        p += 4 + size
    return samples / rate


def voice_seconds(res):
    return voc_seconds(pak_entry(pak_path(res[1]), res[2]))


def image_count(res):
    from sc_data import shape_images
    shape = face_shape(res[1]) if res[0] == 'face' else pak_entry(pak_path(res[1]), res[2])
    return len(shape_images(shape))


def run(exact=True):
    data = json.load(open(f'{REPO}/analysis/optest/midgames/mid1.json', encoding='utf-8'))
    p = mg.Player(data, {'pri': 'air'}, {})
    if exact:
        p.image_count = image_count
        p.voice_seconds = voice_seconds
    p.run(data['parties'][0]['arbre'])
    return [s for s in p.shots if s['frames']], p


def convdata_lists():
    import struct
    d = read(os.path.join(GAME, 'GAMEFLOW', 'CONVDATA.IFF'))
    out = {}

    def walk(o, e, form):
        while o + 8 <= e:
            tag = d[o:o + 4]
            n = struct.unpack('>I', d[o + 4:o + 8])[0]
            if tag == b'FORM':
                walk(o + 12, o + 8 + n, d[o + 8:o + 12].decode())
            elif tag == b'DATA' and n == 9:
                out.setdefault(form, {})[d[o + 8:o + 16].split(b'\0')[0].decode()] = d[o + 16]
            o += 8 + n + (n & 1)
    walk(0, len(d), None)
    return out


CONV = convdata_lists()


def iff_texts(path):
    import struct
    d = read(path)
    out = {}

    def walk(o, e, form):
        while o + 8 <= e:
            tag = d[o:o + 4]
            n = struct.unpack('>I', d[o + 4:o + 8])[0]
            if tag == b'FORM':
                sub = d[o + 8:o + 12].decode()
                walk(o + 12, o + 8 + n, form if sub == 'DATA' else sub)
            elif tag == b'TEXT':
                out.setdefault(form, []).append(d[o + 8:o + 8 + n].split(b'\0')[0].decode('latin1'))
            o += 8 + n + (n & 1)
    walk(0, len(d), None)
    return out


TEXTS = iff_texts(os.path.join(GAME, 'MIDGAMES', 'MIDGAMES.IFF'))
# Mise en page des titres : hypothèses (le code de mise en page n'est pas lu) — chasse = largeur
# de l'image + 2, interligne 16, texte centré sur 320, y = haut de la première ligne.
ADVANCE_GAP = 2
LINE_HEIGHT = 16
SPACE_WIDTH = 6


def draw_title(screen, it, clip):
    import struct
    from sc_data import shape_images
    font = pak_entry(pak_path('mid1'), 27)
    offs = shape_images(font)
    table = pak_entry(pak_path('mid1'), 60)
    step = it.get('step') or 0
    form, index = it['text']
    lines = TEXTS[form][index].split('\n')
    for li, line in enumerate(lines):
        widths = [SPACE_WIDTH if c == ' ' else struct.unpack_from('<h', font, offs[ord(c)])[0] + ADVANCE_GAP for c in line]
        x = (W - sum(widths)) // 2
        y = it['y'] + 13 + li * LINE_HEIGHT
        for c, w in zip(line, widths):
            if c != ' ':
                draw_image(screen, W, H, font, ord(c), x, y, clip, (table[step * 4096:(step + 1) * 4096], 239, 16))
            x += w


def face_shape(name):
    return pak_entry(os.path.join(GAME, 'GAMEFLOW', 'CONVSHPS.PAK'), CONV['FACE'][name])


def apply_palette(pal, ref):
    archive, entry = ref
    if archive.startswith('FACEPAL:'):
        b = pak_entry(os.path.join(GAME, 'GAMEFLOW', 'CONVPALS.PAK'), CONV['FCPL'][archive[8:]])
        first, count, rgb = palette_block(b)
        pal[3 * first:3 * first + 3 * count] = rgb
        return True
    name = archive.split('\\')[-1][:-4]
    first, count, rgb = palette_block(pak_entry(pak_path(name), entry))
    for i in range(3 * count):
        pal[3 * first + i] = rgb[i]
    return True


def to_rgb(pal, scale=1.0):
    return bytes(min(255, int(v * 255 / 63 * scale + 0.5)) for v in pal)


def render(shots, out_dir, only=None):
    os.makedirs(out_dir, exist_ok=True)
    pal = bytearray(768)
    screen = bytearray(W * H)
    missing = set()
    for si, s in enumerate(shots):
        if s['clear']:
            pal[:] = bytes(768)
        for ref in s['palettes']:
            if ref and not apply_palette(pal, ref):
                missing.add(ref[0])
        frames = []
        for fi, items in enumerate(s['frames']):
            clip = (0, 0, W - 1, H - 1) if s['full_screen'] else BAND
            if not s['full_screen']:
                screen[:] = bytes(W * H)
            for it in items:
                if it['kind'] == 'text':
                    if it['text'][0] == 'MG01':
                        draw_title(screen, it, clip)
                    else:
                        missing.add('text')
                    continue
                if it['res'] is None or it['image'] is None:
                    continue
                res = it['res']
                shape = face_shape(res[1]) if res[0] == 'face' else pak_entry(pak_path(res[1]), res[2])
                c = clip
                if it.get('clip'):
                    l, t, r, b = it['clip']
                    c = (max(c[0], l), max(c[1], t), min(c[2], r), min(c[3], b))
                draw_image(screen, W, H, shape, it['image'], it['x'], it['y'], c)
            frames.append(bytes(screen))
        if only is not None and si not in only:
            continue
        rgb = to_rgb(pal)
        imgs = []
        for f in frames:
            im = Image.frombytes('P', (W, H), f)
            im.putpalette(rgb)
            imgs.append(im.resize((W * 2, H * 2), Image.NEAREST))
        dur = max(20, round(1000 / s['fps']))
        imgs[0].save(f'{out_dir}/plan{si:02d}.gif', save_all=True, append_images=imgs[1:], duration=dur, loop=0)
        print(f'plan {si:2d} {s["source"]:8s} {s["fps"]:2d} im/s {len(frames):4d} images')
    print('non rendu :', sorted(missing))


def movie(shots, path, scale=1):
    """Toute la cinématique dans un seul GIF, durée réelle de chaque image."""
    pal = bytearray(768)
    screen = bytearray(W * H)
    imgs = []
    durs = []
    for s in shots:
        if s['clear']:
            pal[:] = bytes(768)
        for ref in s['palettes']:
            if ref:
                apply_palette(pal, ref)
        rgb = to_rgb(pal)
        clip = (0, 0, W - 1, H - 1) if s['full_screen'] else BAND
        if s['fade'] and s['frames']:
            # Palette_FadeFromColor_2D165 : depuis le noir, autant d'étapes que le plus grand écart,
            # toutes les composantes arrivent ensemble, chaque étape tenue « pas » balayages (70 Hz).
            screen[:] = bytes(W * H)
            draw_items(screen, s['frames'][0], clip)
            steps = max(pal)
            for k in range(1, steps + 1):
                step_rgb = bytes(min(255, (v * k // steps) * 255 // 63) for v in pal)
                imgs.append((bytes(screen), step_rgb))
                durs.append(1000.0 * s['fade'] / 70)
        for items in s['frames']:
            if not s['full_screen']:
                screen[:] = bytes(W * H)
            draw_items(screen, items, clip)
            frame = bytes(screen)
            d = 1000.0 / s['fps']
            if imgs and imgs[-1][0] == frame and imgs[-1][1] == rgb:
                durs[-1] += d
                continue
            imgs.append((frame, rgb))
            durs.append(d)
    out = []
    for frame, rgb in imgs:
        im = Image.frombytes('P', (W, H), frame)
        im.putpalette(rgb)
        out.append(im.resize((W * scale, H * scale), Image.NEAREST) if scale != 1 else im)
    out[0].save(path, save_all=True, append_images=out[1:], duration=[max(20, round(d)) for d in durs], loop=0)
    print(path, len(out), 'images', round(sum(durs) / 1000, 1), 's')


def draw_items(screen, items, clip):
    for it in items:
        if it['kind'] == 'text':
            if it['text'][0] == 'MG01':
                draw_title(screen, it, clip)
            continue
        res = it['res']
        if res is None or it['image'] is None:
            continue
        shape = face_shape(res[1]) if res[0] == 'face' else pak_entry(pak_path(res[1]), res[2])
        c = clip
        if it.get('clip'):
            l, t, r, b = it['clip']
            c = (max(c[0], l), max(c[1], t), min(c[2], r), min(c[3], b))
        draw_image(screen, W, H, shape, it['image'], it['x'], it['y'], c)


if __name__ == '__main__':
    if sys.argv[1] == '--film':
        shots, _ = run()
        movie(shots, sys.argv[2], int(sys.argv[3]) if len(sys.argv) > 3 else 1)
        sys.exit(0)
    shots, _ = run()
    only = set(int(a) for a in sys.argv[2:]) if len(sys.argv) > 2 else None
    render(shots, sys.argv[1], only)
