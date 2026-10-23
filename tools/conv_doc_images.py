"""Images de analysis/CONV_SYSTEM.html, composées avec les données du jeu selon CONV_SYSTEM.md.

Gros plan (commande CLOSEUP) : éléments du décor (FORM BACK) dans l'ordre, puis le visage en (x, y) :
image 0, image de base, bouche, image 1, image 34 (TalkingHead_DrawDressed_9E5E). Palette = palettes
du décor puis FCPL « normal ». Image hors écran 320 × 200, lignes 0 à 127 à l'écran à partir de la
ligne 24. Bouche et clignement : règles de « Yeux et bouches » (TalkingHead_Advance_9F5A).
Le texte du bas est écrit avec la police de PIL : la police du jeu n'est pas reproduite.

Usage :
  python3 tools/conv_doc_images.py --donnees <BIGTRE.TRE ou DATA> <dossier de sortie>
      écrit les images dans le dossier
  python3 tools/conv_doc_images.py --embarquer <page.html>
      met dans la page chaque image désignée par data-file (src = data:…base64), pour que la page
      s'affiche seule, sans serveur ni dossier d'images à côté
"""
import base64
import os
import random
import re
import sys

def embed(page):
    """Remplace le src de chaque <img data-file="…"> par l'image elle-même, en base64."""
    folder = os.path.dirname(page)
    kinds = {
        '.png': 'image/png',
        '.gif': 'image/gif',
    }

    def inline(match):
        tag = match.group(0)
        name = re.search(r'data-file="([^"]+)"', tag).group(1)
        with open(os.path.join(folder, name), 'rb') as f:
            data = base64.b64encode(f.read()).decode()
        uri = f'data:{kinds[os.path.splitext(name)[1]]};base64,{data}'
        return re.sub(r'src="[^"]*"', f'src="{uri}"', tag)

    with open(page, encoding='utf-8') as f:
        html = f.read()
    html = re.sub(r'<img [^>]*data-file="[^"]+"[^>]*>', inline, html)
    with open(page, 'w', encoding='utf-8') as f:
        f.write(html)


if len(sys.argv) == 3 and sys.argv[1] == '--embarquer':
    # Pas besoin des données du jeu : sortie avant les imports qui les lisent.
    embed(sys.argv[2])
    sys.exit(0)

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

import conv_dump as cd  # noqa: E402
import conv_faces as cf  # noqa: E402
import conv_scene as cs  # noqa: E402
import sc_data as d  # noqa: E402
from PIL import Image  # noqa: E402
from PIL import ImageDraw  # noqa: E402

CLOSEUP_LIPS = '06891599098769362999252999'
GROUP_LIPS = '04302500000340143000353000'
WHOLE = (0, 0, 319, 199)
FONT_PATH = '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf'


def font(size):
    """Police des légendes (accents) ; police de PIL si DejaVu est absente."""
    try:
        from PIL import ImageFont
        return ImageFont.truetype(FONT_PATH, size)
    except OSError:
        return None


def closeup_records(entry):
    return [rec for _, kind, rec in cd.parse(d.pak_entry(cs.pak('CONV'), entry)) if kind.startswith('03')]


def background(name, pal, offscreen, lower_last=0):
    elements = cs.BACKS[name]
    for k, (source, image, palette, y) in enumerate(elements):
        shapes, palettes = ('OPTSHPS', 'OPTPALS') if source == 1 else ('CONVSHPS', 'CONVPALS')
        cs.apply_palette(pal, d.pak_entry(cs.pak(palettes), palette))
        if k == len(elements) - 1:
            y += lower_last
        d.draw_image(offscreen, 320, 200, d.pak_entry(cs.pak(shapes), image), 0, 0, y, WHOLE)


def closeup_frame(rec, base, mouth, text=None, full=False):
    """Écran 320 × 200 du gros plan ; base, mouth = -1 pour aucune image."""
    pal = [0] * 768
    offscreen = bytearray(320 * 200)
    lower = 24 if full else 0
    background(rec['décor'], pal, offscreen, lower)
    cs.apply_palette(pal, d.pak_entry(cs.pak('CONVPALS'), cs.TABLES['FCPL']['normal']))
    shape = cf.face_shape(rec['visage'])
    images = [0]
    if base >= 0:
        images.append(base)
    if mouth >= 0:
        images.append(mouth)
    images += [1, 34]
    for index in images:
        d.draw_image(offscreen, 320, 200, shape, index, rec['x'], rec['y'] + lower, WHOLE)
    if full:
        screen = offscreen
    else:
        screen = bytearray(320 * 200)
        for row in range(128):
            screen[(24 + row) * 320:(25 + row) * 320] = offscreen[row * 320:(row + 1) * 320]
    rgb = bytes(min(255, v * 255 // 63) for v in pal)
    im = Image.frombytes('P', (320, 200), bytes(screen))
    im.putpalette(rgb)
    im = im.convert('RGB')
    if text:
        draw = ImageDraw.Draw(im)
        colour = tuple(rgb[3 * rec['couleur']:3 * rec['couleur'] + 3])
        for n, line in enumerate(wrap(text)):
            width = draw.textlength(line, font=font(11))
            draw.text(((320 - width) / 2, 156 + 15 * n), line, fill=colour, font=font(11))
    return im


def wrap(text):
    """Lignes de 30 caractères au plus, coupées aux espaces (Conv_DrawText_59F54)."""
    lines = []
    line = ''
    for word in text.split():
        if line and len(line) + 1 + len(word) > 30:
            lines.append(line)
            line = word
        else:
            line = word if not line else line + ' ' + word
    if line:
        lines.append(line)
    return lines


def closeup_mouths(text):
    """Bouche de chaque lecture du gros plan, avec la lettre lue (TalkingHead_Advance_9F5A)."""
    s = text.lower()
    i = 0
    out = []
    while i < len(s):
        c = s[i]
        i += 1
        nxt = s[i] if i < len(s) else '\0'
        mouth = -1
        label = c
        if c == 'e':
            if not ('a' <= nxt <= 'z'):
                c = nxt
                label = 'e' + nxt
                i += 1
            elif nxt == 'r':
                mouth = 6
                label = 'er'
                i += 1
        elif c == 'h':
            label = 'h' + nxt
            i += 1
        elif c in 'tc' and nxt == 'h':
            mouth = 9 if c == 't' else 6
            label = c + 'h'
            i += 1
        if mouth == -1 and 'a' <= c <= 'z':
            mouth = int(CLOSEUP_LIPS[ord(c) - ord('a')]) + 2
        out.append((label, mouth))
    return out


def x2(im):
    return im.resize((im.width * 2, im.height * 2), Image.NEAREST)


def labelled_strip(cells, scale=2, columns=None):
    """cells = [(texte, image)] en grille, légende au-dessus de chaque image."""
    columns = columns or len(cells)
    rows = (len(cells) + columns - 1) // columns
    w = cells[0][1].width * scale
    h = cells[0][1].height * scale
    out = Image.new('RGB', (w * columns, (h + 18) * rows), (24, 28, 27))
    draw = ImageDraw.Draw(out)
    for k, (label, im) in enumerate(cells):
        x = (k % columns) * w
        y = (k // columns) * (h + 18)
        out.paste(im.resize((w, h), Image.NEAREST), (x, y + 18))
        draw.text((x + 4, y + 2), label, fill=(240, 220, 120), font=font(12))
    return out


def face_cell(face, images, pal):
    return cf.cell(cf.face_shape(face), images, pal)


def write_all(out):
    os.makedirs(out, exist_ok=True)
    join = os.path.join
    # Scènes de groupe : hangar (entrée 12, scènes 0 et 1), briefing (entrée 59, scène 0).
    cs.render(12, 0, join(out, 'scene_hangar.png'))
    cs.render(12, 1, join(out, 'scene_hangar_stern.png'))
    cs.render(59, 0, join(out, 'scene_brief.png'))
    cs.render(30, 0, join(out, 'scene_bureau.png'))
    # Gros plans de l'entrée 12 (Miguel, Air) et de l'entrée 62 (Farnsworth).
    hangar = closeup_records(12)
    x2(closeup_frame(hangar[0], -1, -1, hangar[0]['texte'])).save(join(out, 'closeup_air.png'))
    x2(closeup_frame(hangar[1], 25, 3, hangar[1]['texte'])).save(join(out, 'closeup_miguel.png'))
    x2(closeup_frame(hangar[2], 31, -1, hangar[2]['texte'])).save(join(out, 'closeup_virgil.png'))
    far = closeup_records(62)
    x2(closeup_frame(far[3], 14, 8, far[3]['texte'])).save(join(out, 'closeup_far.png'))
    question = far[9]
    x2(closeup_frame(question, 53, -1, None, full=True)).save(join(out, 'closeup_accept.png'))
    # Couches du gros plan de Billy, ajoutées une à une.
    pal = cf.palette()
    steps = [
        ('image 0 : tête', [0]),
        ('+ image 25 : base', [0, 25]),
        ('+ bouche 3', [0, 25, 3]),
        ('+ image 1', [0, 25, 3, 1]),
        ('+ image 34 : habits', [0, 25, 3, 1, 34]),
    ]
    labelled_strip([(label, face_cell('billy', images, pal)) for label, images in steps]).save(
        join(out, 'layers_billy.png'))
    layers_air = [
        ('image 0', [0]),
        ('image 25', [25]),
        ('bouche 3', [3]),
        ('image 1', [1]),
        ('image 34', [34]),
        ('ensemble', [0, 25, 3, 1, 34]),
    ]
    labelled_strip([(label, face_cell('air', images, pal)) for label, images in layers_air]).save(
        join(out, 'layers_air.png'))
    # Bouches 2 à 11 et clignement (12).
    mouths = [(f'bouche {m}', face_cell('billy', [0, m, 1, 34], pal)) for m in range(2, 12)]
    labelled_strip(mouths).save(join(out, 'mouths_billy.png'))
    eyes = [(f'image {v}', face_cell('billy', [0, v, 1, 34], pal)) for v in [12, 13, 14, 16, 17, 18, 19, 20, 21]]
    labelled_strip(eyes).save(join(out, 'eyes_billy.png'))
    brows = [(f'image {v}', face_cell('billy', [0, v, 1, 34], pal)) for v in [22, 23, 24, 25, 27, 28, 31]]
    labelled_strip(brows).save(join(out, 'brows_billy.png'))
    # Lecture d'un mot : « Danger is our business. »
    word = closeup_mouths('Danger is our business.')
    cells = []
    for label, m in word:
        im = face_cell('virgil', [0, 25] + ([m] if m >= 0 else []) + [1, 34], pal)
        label = label.replace(' ', '␣')
        caption = f'{label} → {m}' if m >= 0 else f'{label} → aucune'
        cells.append((caption, im.crop((25, 45, 95, 115))))
    labelled_strip(cells, 2, 8).save(join(out, 'lips_word.png'))
    # Planches et comparaison, outil conv_faces.
    cf.write_sheets('billy', join(out, 'billy'))
    cf.write_sheets('far', join(out, 'far'))
    cf.write_compare('billy', join(out, 'billy_jeu_librs.png'))
    # Animation d'une réplique (Miguel, entrée 12) : une image par lecture, 10 par seconde, clignement
    # tiré à chaque image (graine fixe), puis 40 images d'attente.
    rec = hangar[1]
    rng = random.Random(4)
    frames = []
    for _, mouth in closeup_mouths(rec['texte']) + [('', -1)] * 40:
        base = rec['image']
        if base <= 20 and rng.randrange(30) == 0:
            base = 12
        frames.append(closeup_frame(rec, base, mouth, rec['texte']))
    frames[0].save(join(out, 'closeup_miguel.gif'), save_all=True, append_images=frames[1:], duration=100, loop=0)


if __name__ == '__main__':
    if len(sys.argv) == 2:
        write_all(sys.argv[1])
    else:
        raise SystemExit(__doc__)
