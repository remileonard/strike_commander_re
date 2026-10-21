"""Lecteur de contrôle d'un MID_*.IFF (format ANIM version 2 écrit par tools/midgame_iff.py).

Il ne lit que le fichier .IFF et les données du jeu (images, palettes, voix), jamais la simulation
de midgame_iff.py, puis compare chaque image au rendu de référence de tools/midgame_render.py.
Les règles appliquées ici sont la signification voulue de chaque champ : elles servent de
spécification pour SCAnimationPlayer. Voir MID1_PLANS.md, « Lecteur de contrôle ».

Usage : python3 tools/midgame_check.py --donnees <DATA> MID_1.IFF [dossier_sortie]
"""
import os
import struct
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

from PIL import Image  # noqa: E402

import midgame_render as ref  # noqa: E402
from sc_data import GAME, draw_image, pak_entry, palette_block, shape_images  # noqa: E402

W = 320
H = 200
BAND = (0, 24, 319, 151)
NO_IMAGE = 255
# Ancrage des visages (même hypothèse que midgame_iff.py) : position écrite = position du jeu,
# sans le décalage de 24, moins (160, 128).
FACE_ANCHOR = (160, 128)
BAND_TOP = 24


# ---------------------------------------------------------------------- lecture du fichier

def iff_chunks(d, o, e):
    while o + 8 <= e:
        tag = d[o:o + 4].decode('ascii')
        n = struct.unpack('>I', d[o + 4:o + 8])[0]
        yield tag, o + 8, n
        o += 8 + n + (n & 1)


class Reader:
    def __init__(self, b, p=0):
        self.b = b
        self.p = p

    def u(self, fmt):
        v = struct.unpack_from('<' + fmt, self.b, self.p)
        self.p += struct.calcsize('<' + fmt)
        return v if len(v) > 1 else v[0]

    def text(self):
        n = self.u('H')
        s = self.b[self.p:self.p + n].decode('latin-1')
        self.p += n
        return s


def read_layer(d, o, n, kind):
    r = Reader(d[o:o + n])
    lay = {'kind': kind, 'archive': r.text(), 'name2': r.text()}
    lay['entry'], lay['f1'], lay['image'], lay['f3'] = r.u('HHHB')
    lay['x'], lay['y'], lay['x_end'], lay['y_end'], lay['vx'], lay['vy'] = r.u('hhhhhh')
    if kind == 'SPRI':
        lay['f4'], lay['loop'], lay['start_image'], lay['end_frame'] = r.u('BBhh')
    return lay


def read_anim(path):
    d = open(path, 'rb').read()
    assert d[:4] == b'FORM' and d[8:12] == b'ANIM'
    shots = []
    for tag, o, n in iff_chunks(d, 12, len(d)):
        if tag != 'SHOT':
            continue
        shot = {'layers': [], 'texts': [], 'palettes': [], 'sounds': []}
        for t2, o2, n2 in iff_chunks(d, o, o + n):
            if t2 == 'SHTP':
                (shot['nbframe'], shot['music'], shot['sound_code'], shot['fps'], shot['wait'], shot['keep'],
                 shot['fade'], shot['end_layer'], shot['full_screen'], shot['clear']) = \
                    struct.unpack_from('<iBHBBBBhBB', d, o2)
            elif t2 == 'PALS':
                r = Reader(d[o2:o2 + n2])
                for _ in range(r.u('H')):
                    shot['palettes'].append((r.text(), r.u('H')))
            elif t2 in ('BGND', 'SPRT'):
                cur = None
                for t3, o3, n3 in iff_chunks(d, o2, o2 + n2):
                    if t3 in ('BKGD', 'SPRI'):
                        cur = read_layer(d, o3, n3, t3)
                        shot['layers'].append(cur)
                    elif t3 == 'LAYR':
                        (cur['id'], _, cur['start'], cur['nb'], _, cur['has_clip'], l, t, rr, bb, cur['depth'],
                         _) = struct.unpack_from('<hhHHBBhhhhhB', d, o3)
                        cur['clip'] = (l, t, rr, bb) if cur['has_clip'] else None
                    elif t3 == 'SEQU':
                        k = struct.unpack_from('<H', d, o3)[0]
                        cur['sequ'] = list(d[o3 + 2:o3 + 2 + k])
                    elif t3 == 'PATH':
                        k = struct.unpack_from('<H', d, o3)[0]
                        cur['path'] = [struct.unpack_from('<hh', d, o3 + 2 + 4 * i) for i in range(k)]
            elif t2 == 'TEXT':
                for t3, o3, n3 in iff_chunks(d, o2, o2 + n2):
                    r = Reader(d[o3:o3 + n3])
                    key = r.text()
                    index, _, nb, _, y, _, _, colour, start, align = r.u('bbHhhhhBHB')
                    shot['texts'].append({'key': key, 'index': index, 'nb': nb, 'y': y, 'colour': colour,
                                          'start': start, 'align': align})
            elif t2 == 'SOND':
                r = Reader(d[o2:o2 + n2])
                archive = r.text()
                entry, frame = r.u('HH')
                shot['sounds'].append((archive, entry, frame))
        shots.append(shot)
    return shots


# ---------------------------------------------------------------------- données

def pak_file(archive):
    parts = archive.replace('\\', '/').split('/')
    return os.path.join(GAME, parts[-2], parts[-1])


def layer_shape(lay):
    if lay['archive'].startswith('FACE:'):
        return ref.face_shape(lay['archive'][5:])
    return pak_entry(pak_file(lay['archive']), lay['entry'])


def apply_palette(pal, archive, entry):
    if archive.startswith('FACEPAL:'):
        b = pak_entry(os.path.join(GAME, 'GAMEFLOW', 'CONVPALS.PAK'), ref.CONV['FCPL'][archive[8:]])
    else:
        b = pak_entry(pak_file(archive), entry)
    first, count, rgb = palette_block(b)
    pal[3 * first:3 * first + 3 * count] = rgb


def voice_seconds(archive, entry):
    return ref.voc_seconds(pak_entry(pak_file(archive), entry))


# ---------------------------------------------------------------------- lecture d'un plan

def sprite_last(lay, count):
    """Dernière image d'une animation : end_frame ≤ 0 → nombre d'images + end_frame (0 = l'image
    « nombre d'images », qui n'existe pas : l'animation disparaît, comme AnimLayer dans le jeu ;
    -1 = s'arrête sur sa dernière image) ; end_frame > 0 → cette image."""
    e = lay['end_frame']
    return count + e if e <= 0 else e


def layer_state(lay, f):
    """Image et position du calque à l'image f du plan, ou None s'il n'est pas affiché."""
    k = f - lay['start']
    if k < 0 or (lay['nb'] and k >= lay['nb']):
        return None
    x = lay['x']
    y = lay['y']
    if 'path' in lay:
        x, y = lay['path'][min(k, len(lay['path']) - 1)]
    if lay['kind'] == 'SPRI':
        count = len(shape_images(layer_shape(lay)))
        image = lay['start_image'] + k
        if lay['loop']:
            image = image % count
        else:
            image = min(image, sprite_last(lay, count))
    elif 'sequ' in lay:
        image = lay['sequ'][min(k, len(lay['sequ']) - 1)]
    else:
        image = lay['image']
    if image == NO_IMAGE:
        return None
    if lay['archive'].startswith('FACE:'):
        x += FACE_ANCHOR[0]
        y += FACE_ANCHOR[1] + BAND_TOP
    return image, x, y


def shot_length(shot):
    """Nombre d'images du plan : nbframe ; « attendre les sons » → jusqu'à la fin de la dernière
    réplique ; end_layer → jusqu'à ce que cette animation atteigne sa dernière image."""
    if shot['wait']:
        end = 0.0
        for archive, entry, frame in shot['sounds']:
            end = max(end, frame / shot['fps'] + voice_seconds(archive, entry))
        return max(1, int(-(-end * shot['fps'] // 1)))
    if shot['end_layer'] >= 0:
        lay = next(lay for lay in shot['layers'] if lay['id'] == shot['end_layer'])
        count = len(shape_images(layer_shape(lay)))
        return lay['start'] + sprite_last(lay, count) - lay['start_image']
    return shot['nbframe']


def play(shots):
    """Renvoie la liste des images (octets d'index, palette 0..63, durée en ms)."""
    pal = bytearray(768)
    screen = bytearray(W * H)
    out = []
    for shot in shots:
        if shot['clear'] or not shot['keep']:
            pal[:] = bytes(768)
        for archive, entry in shot['palettes']:
            apply_palette(pal, archive, entry)
        clip = (0, 0, W - 1, H - 1) if shot['full_screen'] else BAND
        layers = sorted(shot['layers'], key=lambda lay: lay['depth'])
        for f in range(shot_length(shot)):
            if not shot['full_screen']:
                screen[:] = bytes(W * H)
            for lay in layers:
                st = layer_state(lay, f)
                if st is None:
                    continue
                image, x, y = st
                c = clip
                if lay.get('clip'):
                    l, t, r, b = lay['clip']
                    c = (max(c[0], l), max(c[1], t), min(c[2], r), min(c[3], b))
                draw_image(screen, W, H, layer_shape(lay), image, x, y, c)
            out.append((bytes(screen), bytes(pal), 1000.0 / shot['fps'], shot))
    return out


# ---------------------------------------------------------------------- comparaison

def reference_frames():
    shots, _ = ref.run()
    pal = bytearray(768)
    screen = bytearray(W * H)
    out = []
    for s in shots:
        if s['clear']:
            pal[:] = bytes(768)
        for r in s['palettes']:
            if r:
                ref.apply_palette(pal, r)
        clip = (0, 0, W - 1, H - 1) if s['full_screen'] else BAND
        for items in s['frames']:
            if not s['full_screen']:
                screen[:] = bytes(W * H)
            ref.draw_items(screen, [it for it in items if it['kind'] != 'text'], clip)
            out.append((bytes(screen), bytes(pal), 1000.0 / s['fps']))
    return out


def timeline(frames):
    t = 0.0
    out = []
    for fr in frames:
        out.append((t, fr))
        t += fr[2]
    return out, t


def rgb(frame, pal):
    im = Image.frombytes('P', (W, H), frame)
    im.putpalette(bytes(min(255, v * 255 // 63) for v in pal))
    return im.convert('RGB')


def compare(check, refs, out_dir):
    """Compare à temps égal (pas de 1/60 s) : pixels différents, en couleurs réelles."""
    tc, total_c = timeline(check)
    tr, total_r = timeline(refs)
    print(f'durée : contrôle {total_c / 1000:.2f} s, référence {total_r / 1000:.2f} s')
    step = 1000.0 / 60
    ic = 0
    ir = 0
    worst = []
    t = 0.0
    while t < min(total_c, total_r):
        while ic + 1 < len(tc) and tc[ic + 1][0] <= t:
            ic += 1
        while ir + 1 < len(tr) and tr[ir + 1][0] <= t:
            ir += 1
        a = tc[ic][1]
        b = tr[ir][1]
        if a[0] != b[0] or a[1] != b[1]:
            ra = rgb(a[0], a[1]).tobytes()
            rb = rgb(b[0], b[1]).tobytes()
            diff = sum(1 for k in range(0, len(ra), 3) if ra[k:k + 3] != rb[k:k + 3])
            if diff:
                worst.append((t, diff, ic, ir))
        t += step
    print(f'instants comparés : {int(min(total_c, total_r) // step)}, différents : {len(worst)}')
    if out_dir and worst:
        os.makedirs(out_dir, exist_ok=True)
        shown = sorted(worst, key=lambda w: -w[1])[:12]
        for t, diff, ic, ir in sorted(shown):
            pair = Image.new('RGB', (W * 2 + 4, H), (255, 0, 0))
            pair.paste(rgb(*tc[ic][1][:2]), (0, 0))
            pair.paste(rgb(*tr[ir][1][:2]), (W + 4, 0))
            pair.save(os.path.join(out_dir, f'ecart_{t / 1000:06.2f}s_{diff}px.png'))
            print(f'  {t / 1000:6.2f} s : {diff} pixels différents (contrôle à gauche, référence à droite)')
    return worst


def main():
    args = sys.argv[1:]
    check = play(read_anim(args[0]))
    refs = reference_frames()
    compare(check, refs, args[1] if len(args) > 1 else None)


if __name__ == '__main__':
    main()
