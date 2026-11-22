"""Images des visages des conversations (FORM FACE de CONVDATA.IFF → forme de CONVSHPS.PAK).

Le gros plan (commande CLOSEUP) dessine, comme OPTEST.EXE (TalkingHead_DrawDressed_9E5E) :
image 0 (tête), image de base (octet « image » de la commande), bouche, image 1, image 34.
Voir analysis/CONV_SYSTEM.md, « Images d'un visage ».

Usage :
  python3 tools/conv_faces.py --donnees <BIGTRE.TRE ou DATA> --table
      tableau des images présentes de chaque visage, et valeurs « image » utilisées par les scripts
  python3 tools/conv_faces.py --donnees <BIGTRE.TRE ou DATA> <visage> <préfixe>
      <préfixe>_images.png : les 62 images du visage, une par case
      <préfixe>_compose.png : la composition du jeu pour chaque valeur « image » des scripts
  python3 tools/conv_faces.py --donnees <BIGTRE.TRE ou DATA> --compare <visage> <sortie.png>
      en haut le jeu, en bas la table faces_shape de libRealSpace (SCConvPlayer.cpp), sans bouche
"""
import collections
import os
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

import conv_dump as cd  # noqa: E402
import conv_scene as cs  # noqa: E402
import sc_data as d  # noqa: E402
from PIL import Image  # noqa: E402
from PIL import ImageDraw  # noqa: E402

IMAGE_COUNT = 62
CELL_W = 120
CELL_H = 130
LABEL_H = 12
ORIGIN_X = 60
ORIGIN_Y = 110


def face_shape(face):
    return d.pak_entry(cs.pak('CONVSHPS'), cs.TABLES['FACE'][face])


def used_values():
    """Valeurs de l'octet « image » des CLOSEUP, par visage."""
    used = collections.defaultdict(collections.Counter)
    count = len(d.pak_entries(cs.pak('CONV'))[1])
    for entry in range(count):
        for _, kind, rec in cd.parse(d.pak_entry(cs.pak('CONV'), entry)):
            if kind.startswith('03'):
                used[rec['visage']][rec['image']] += 1
    return used


def palette():
    """Palette d'essai : décor de gros plan mp1_cu, puis FCPL « normal »."""
    pal = [0] * 768
    for source, _, number, _ in cs.BACKS['mp1_cu']:
        pak_name = 'OPTPALS' if source == 1 else 'CONVPALS'
        cs.apply_palette(pal, d.pak_entry(cs.pak(pak_name), number))
    cs.apply_palette(pal, d.pak_entry(cs.pak('CONVPALS'), cs.TABLES['FCPL']['normal']))
    return bytes(min(255, v * 255 // 63) for v in pal)


def cell(shape, images, pal):
    buf = bytearray(CELL_W * CELL_H)
    for index in images:
        d.draw_image(buf, CELL_W, CELL_H, shape, index, ORIGIN_X, ORIGIN_Y)
    im = Image.frombytes('P', (CELL_W, CELL_H), bytes(buf))
    im.putpalette(pal)
    return im.convert('RGB')


def sheet(cells, columns):
    rows = (len(cells) + columns - 1) // columns
    out = Image.new('RGB', (CELL_W * columns, (CELL_H + LABEL_H) * rows), (40, 40, 40))
    draw = ImageDraw.Draw(out)
    for k, (label, im) in enumerate(cells):
        x = (k % columns) * CELL_W
        y = (k // columns) * (CELL_H + LABEL_H)
        out.paste(im, (x, y + LABEL_H))
        draw.text((x + 2, y), label, fill=(255, 255, 0))
    return out


# faces_shape de SCConvPlayer.cpp (numéros libRealSpace = numéro du jeu + 1)
LIBREALSPACE_FACES_SHAPE = {
    13: [1, 14, 2, 35],
    14: [1, 21, 28, 2, 35],
    16: [1, 17, 2, 35],
    17: [1, 18, 2, 35],
    18: [1, 19, 2, 35],
    19: [1, 2, 35],
    20: [1, 21, 28, 2, 35],
    21: [1, 21, 28, 2, 35],
    22: [1, 23, 2, 35],
    23: [1, 24, 2, 35],
    24: [1, 25, 2, 35],
    25: [1, 26, 2, 35],
    26: [1, 26, 2, 35],
    27: [1, 27, 2, 35],
    28: [1, 28, 2, 35],
    29: [1, 29, 2, 35],
    31: [1, 31, 2, 35],
    32: [1, 33, 2, 35],
    255: [1, 2, 35],
}


def write_compare(face, out):
    shape = face_shape(face)
    pal = palette()
    values = [v for v in sorted(used_values()[face]) if v != 255]
    cells = []
    for value in values:
        cells.append((f'{value} jeu', cell(shape, [0, value, 1, 34], pal)))
    for value in values:
        images = [i - 1 for i in LIBREALSPACE_FACES_SHAPE.get(value, [])]
        cells.append((f'{value} libRS', cell(shape, images, pal)))
    sheet(cells, len(values)).save(out)


def write_sheets(face, prefix):
    shape = face_shape(face)
    pal = palette()
    singles = [(str(i), cell(shape, [i], pal)) for i in range(IMAGE_COUNT)]
    sheet(singles, 8).save(prefix + '_images.png')
    composed = []
    for value in sorted(used_values()[face]):
        base = [] if value == 255 else [value]
        composed.append((f'image {value}', cell(shape, [0] + base + [1, 34], pal)))
    sheet(composed, 8).save(prefix + '_compose.png')


def print_table():
    used = used_values()
    for face in cs.TABLES['FACE']:
        shape = face_shape(face)
        present = [i for i in range(IMAGE_COUNT) if d.image_spans(shape, i)]
        values = dict(sorted(used.get(face, {}).items()))
        empty = [v for v in values if v != 255 and v not in present]
        print(f'{face}: images présentes {present}')
        print(f'    valeurs « image » des scripts {values}')
        if empty:
            print(f'    valeurs qui désignent une image vide : {empty}')


def main():
    args = sys.argv[1:]
    if args == ['--table']:
        print_table()
    elif len(args) == 3 and args[0] == '--compare':
        write_compare(args[1], args[2])
    elif len(args) == 2:
        write_sheets(args[0], args[1])
    else:
        raise SystemExit(__doc__)


if __name__ == '__main__':
    main()
