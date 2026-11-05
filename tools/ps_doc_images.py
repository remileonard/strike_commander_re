"""Images de analysis/pacific/PACIFIC_GAMEFLOW_CONV.html, composées avec les données de Pacific Strike.

Le placement suit les règles de Strike Commander (analysis/CONV_SYSTEM.md, tools/conv_doc_images.py) : éléments
du décor (FORM BACK de CONVDATA.IFF) dans l'ordre, visage par-dessus, image hors écran 320 × 200 dont les lignes
0 à 127 vont à l'écran à partir de la ligne 24. Scène de groupe : palettes du décor seules (la palette FGPL
« normal » de Strike Commander fausse les couleurs des décors de Pacific Strike). Ces règles n'ont pas été relues
dans PACIFIC.EXE.
Le texte est écrit avec la police de PIL, pas avec celle du jeu.

Le schéma de lecture des instructions des scripts de mission (ps_prog_encoding.png, README § 6.4) prend ses octets
dans les fichiers de mission (chunk PROG).

Usage : python3 tools/ps_doc_images.py --donnees <DATA de Pacific Strike> <dossier de sortie>
"""
import os
import struct
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

import conv_doc_images as di  # noqa: E402
import conv_scene as cs  # noqa: E402
import ps_conv_dump as pc  # noqa: E402
import sc_data as d  # noqa: E402
from PIL import Image  # noqa: E402
from PIL import ImageDraw  # noqa: E402

BRIEFING = 4


def to_screen(offscreen):
    screen = bytearray(320 * 200)
    for row in range(128):
        screen[(24 + row) * 320:(25 + row) * 320] = offscreen[row * 320:(row + 1) * 320]
    return screen


def image(screen, pal, text=None, colour=15):
    rgb = bytes(min(255, v * 255 // 63) for v in pal)
    im = Image.frombytes('P', (320, 200), bytes(screen))
    im.putpalette(rgb)
    im = im.convert('RGB')
    if text:
        draw = ImageDraw.Draw(im)
        fill = tuple(rgb[3 * colour:3 * colour + 3])
        for n, line in enumerate(di.wrap(text)):
            width = draw.textlength(line, font=di.font(11))
            draw.text(((320 - width) / 2, 156 + 15 * n), line, fill=fill, font=di.font(11))
    return im


def pointer_points():
    """GAMEFLOW\\PTR.IFF (FORM CPTR, chunk DATA) : pour chaque image de la figure, x et y (2 octets chacun) du
    point de la main, en coordonnées d'écran ; lu par sub_62F7E dans [calque+35+4×image]."""
    data = d.read(os.path.join(d.GAME, 'GAMEFLOW', 'PTR.IFF'))
    size = struct.unpack_from('>I', data, 16)[0]
    return [struct.unpack_from('<hh', data, 20 + 4 * k) for k in range(size // 4)]


def line(screen, x0, y0, x1, y1, colour):
    """Trait d'un pixel (sub_69F22 n'est pas lu en détail : tracé de Bresenham)."""
    dx = abs(x1 - x0)
    dy = -abs(y1 - y0)
    sx = 1 if x0 < x1 else -1
    sy = 1 if y0 < y1 else -1
    err = dx + dy
    while True:
        if 0 <= x0 < 320 and 0 <= y0 < 200:
            screen[y0 * 320 + x0] = colour
        if x0 == x1 and y0 == y1:
            return
        e2 = 2 * err
        if e2 >= dy:
            err += dy
            x0 += sx
        if e2 <= dx:
            err += dx
            y0 += sy


def group(back, text=None, commander=None, step=0):
    """Scène de groupe : décor (palettes du décor seules), puis le commandant de la commande 17.

    commander = (figure, images, x, y). Pour l'étape `step` de la liste `images`, comme la méthode de dessin du
    calque (sub_62EF2) : 1) la baguette, trait de couleur 15 (sub_630DA) depuis le point de la main de l'image
    courante (PTR.IFF) ; à la dernière étape jusqu'à la cible (x, y), avant elle jusqu'au point de la main décalé
    de l'écart entre le point de la dernière image et la cible (valeurs absolues, sub_6308B) ; 2) l'image 0 ;
    3) l'image courante. Les images de ces figures couvrent l'écran (en-tête 0 à 319 × 0 à 199) : dessinées en
    (0, 0). Le décalage vertical du groupe de calques retiré de y à la dernière étape est pris égal à 0."""
    pal = [0] * 768
    offscreen = bytearray(320 * 200)
    di.background(back, pal, offscreen)
    screen = to_screen(offscreen)
    if commander:
        name, images, x, y = commander
        shape = d.pak_entry(cs.pak('CONVSHPS'), cs.TABLES['FIGR'][name])
        points = pointer_points()
        current = images[step]
        hand_x, hand_y = points[current]
        last_x, last_y = points[images[-1]]
        if step == len(images) - 1:
            end_x = x
            end_y = y
        else:
            end_x = hand_x - abs(last_x - x)
            end_y = hand_y - abs(last_y - y)
        line(screen, hand_x, hand_y, end_x, end_y, 15)
        d.draw_image(screen, 320, 200, shape, 0, 0, 0, di.WHOLE)
        d.draw_image(screen, 320, 200, shape, current, 0, 0, di.WHOLE)
    return image(screen, pal, text)


# --- Schéma de lecture des instructions (README § 6.4) -----------------------------------------------------------

# Rôle d'un octet → (couleur de fond, étiquette sous la case)
ROLES = {
    'op': ((120, 160, 230), 'instruction'),
    'arg': ((140, 200, 140), 'argument'),
    'mark': ((200, 200, 200), 'marque 9'),
    'lo': ((140, 200, 140), 'octet bas'),
    'hi': ((240, 180, 110), 'octet haut'),
    'five': ((200, 200, 200), 'marque 5'),
    'end': ((235, 130, 130), 'fin'),
}

# (fichier de mission, position dans PROG, rôles des octets, titre, lecture)
EXAMPLES = [
    ('CRLS-M1.IFF', 6, ['op', 'arg'],
     'Instruction simple : 2 octets',
     'OP_SET_OBJ_FLY_TO_WP, argument 1 = 2'),
    ('CRLS-M1.IFF', 452, ['op', 'arg', 'mark', 'arg'],
     'Un argument de plus : la marque 9, puis l\'argument',
     'OP_SET_OBJ_FLY_TO_WP, arguments 6 et 8'),
    ('LYTG-M4.IFF', 496, ['op', 'arg', 'mark', 'arg', 'mark', 'arg', 'mark', 'arg'],
     'Trois arguments de plus (le maximum) ; le 2e argument vaut 9',
     'OP_FIRE_AT_SPOT*, arguments 15, 9, 0 et 13'),
    ('CRLS-M1.IFF', 24, ['op', 'lo', 'hi', 'five'],
     'Instruction de drapeau : numéro sur 2 octets, puis la marque 5',
     'OP_SET_FLAG_TO_FALSE, numéro 148 + 256 × 1 = 404'),
    ('CRLS-M1.IFF', 16, ['end', 'end'],
     'Mot nul : fin du programme',
     'OP_NOOP, argument 0 : le programme suivant commence après'),
]

CELL = 64
GAP = 6
LEFT = 24


def prog_chunk(name):
    data = d.read(os.path.join(d.GAME, 'MISSIONS', name))
    at = 12
    while at + 8 <= len(data):
        tag = data[at:at + 4]
        size = struct.unpack_from('>I', data, at + 4)[0]
        if tag == b'PROG':
            return data[at + 8:at + 8 + size]
        at += 8 + size + (size & 1)
    raise ValueError(name + ' : pas de chunk PROG')


def cells(draw, x, y, values, roles):
    small = di.font(11)
    big = di.font(18)
    for k, (value, role) in enumerate(zip(values, roles)):
        colour, label = ROLES[role]
        left = x + k * (CELL + GAP)
        draw.rectangle((left, y, left + CELL, y + 40), fill=colour, outline=(40, 40, 40))
        text = str(value)
        width = draw.textlength(text, font=big)
        draw.text((left + (CELL - width) / 2, y + 9), text, fill=(0, 0, 0), font=big)
        width = draw.textlength(label, font=small)
        draw.text((left + (CELL - width) / 2, y + 46), label, fill=(60, 60, 60), font=small)


def encoding_diagram():
    """Une ligne par exemple : les octets lus dans le fichier, colorés selon leur rôle."""
    row = 110
    width = LEFT + 8 * (CELL + GAP) + 420
    im = Image.new('RGB', (width, 20 + row * len(EXAMPLES)), (255, 255, 255))
    draw = ImageDraw.Draw(im)
    for n, (name, at, roles, title, reading) in enumerate(EXAMPLES):
        values = list(prog_chunk(name)[at:at + len(roles)])
        y = 14 + n * row
        draw.text((LEFT, y), title, fill=(0, 0, 0), font=di.font(14))
        cells(draw, LEFT, y + 26, values, roles)
        right = LEFT + 8 * (CELL + GAP) + 10
        draw.text((right, y + 30), reading, fill=(0, 0, 0), font=di.font(12))
        draw.text((right, y + 50), f'{name}, octet {at} de PROG', fill=(110, 110, 110), font=di.font(11))
    return im


def program_split_diagram():
    """Début du chunk PROG de CRLS-M1 : les instructions lues l'une après l'autre, et les programmes séparés par les
    mots nuls."""
    data = prog_chunk('CRLS-M1.IFF')
    groups = [
        (0, ['op', 'arg'], 'OP_SET_OBJ_TAKE_OFF'),
        (2, ['op', 'arg'], 'OP_SET_OBJ_FLY_TO_WP'),
        (4, ['op', 'arg'], 'OP_SET_MESSAGE'),
        (6, ['op', 'arg'], 'OP_SET_OBJ_FLY_TO_WP'),
        (8, ['op', 'arg'], 'OP_SET_MESSAGE'),
        (10, ['op', 'arg', 'mark', 'arg'], 'OP_ORDER_OBJ_AND_SPOT*'),
        (14, ['op', 'arg'], 'OP_SET_MESSAGE'),
        (16, ['end', 'end'], 'OP_NOOP'),
        (18, ['op', 'arg'], 'OP_MOVE_VALUE_TO_WORK_REGISTER'),
        (20, ['op', 'lo', 'hi', 'five'], 'OP_MOVE_WORK_REGISTER_TO_FLAG'),
        (24, ['op', 'lo', 'hi', 'five'], 'OP_SET_FLAG_TO_FALSE'),
    ]
    row = 34
    im = Image.new('RGB', (760, 70 + row * len(groups) + 40), (255, 255, 255))
    draw = ImageDraw.Draw(im)
    draw.text((LEFT, 12), 'CRLS-M1.IFF, début du chunk PROG, lu instruction par instruction', fill=(0, 0, 0),
              font=di.font(14))
    small = di.font(13)
    y = 44
    program = 0
    draw.text((LEFT, y), 'programme 0 (commence à l\'octet 0)', fill=(30, 30, 160), font=small)
    y += 26
    for at, roles, name in groups:
        draw.text((LEFT, y + 6), f'{at:3d}', fill=(110, 110, 110), font=small)
        for k, role in enumerate(roles):
            colour = ROLES[role][0]
            left = LEFT + 40 + k * 46
            draw.rectangle((left, y, left + 42, y + 26), fill=colour, outline=(40, 40, 40))
            text = str(data[at + k])
            width = draw.textlength(text, font=small)
            draw.text((left + (42 - width) / 2, y + 5), text, fill=(0, 0, 0), font=small)
        draw.text((LEFT + 40 + 4 * 46 + 12, y + 6), name, fill=(0, 0, 0), font=small)
        y += row
        if roles[0] == 'end':
            program += 1
            draw.line((LEFT, y - 3, 740, y - 3), fill=(200, 60, 60), width=2)
            draw.text((LEFT, y + 2), f'programme {program} (commence à l\'octet {at + 2})', fill=(30, 30, 160),
                      font=small)
            y += 26
    draw.text((LEFT, y + 4), '…', fill=(0, 0, 0), font=small)
    return im


def records(k):
    return pc.parse(pc.entry(k))


def write_all(out):
    os.makedirs(out, exist_ok=True)
    recs = records(BRIEFING)
    saved = []

    def save(im, name):
        di.x2(im).save(os.path.join(out, name))
        saved.append(name)

    # Schémas des scripts de mission : déjà dessinés en grand, pas d'agrandissement.
    for im, name in ((encoding_diagram(), 'ps_prog_encoding.png'), (program_split_diagram(), 'ps_prog_split.png')):
        im.save(os.path.join(out, name))
        saved.append(name)

    # Salle de briefing et premier texte.
    back = recs[0][2]['décor']
    save(group(back, recs[1][2]['texte']), 'ps_brief_group.png')
    # Gros plans du commandant et d'un pilote : même lecture que Strike Commander (image de base).
    for at, kind, rec in recs:
        if kind == 'CLOSEUP' and at in (375, 547):
            save(di.closeup_frame(rec, rec['image'] if rec['image'] != 255 else -1, -1, rec['texte']),
                 f'ps_closeup_{rec["visage"]}.png')
    # Cartes au tableau (ph2blk1 à ph2blk4) : décor seul, puis le texte qui suit.
    for k, (at, kind, rec) in enumerate(recs):
        if kind == 'GROUP_SHOT' and rec['décor'].startswith('ph2blk'):
            save(group(rec['décor'], recs[k + 1][2]['texte']), f'ps_{rec["décor"]}.png')
    # Commande 17 : le commandant devant la carte, suite d'images (GIF) et planche.
    for k, (at, kind, rec) in enumerate(recs):
        if kind == 'GROUP_SHOT_COMMANDER':
            back = recs[k - 1][2]['décor']
            text = recs[k + 1][2]['texte']
            for name in ('commndr', 'yucmndr'):
                frames = [di.x2(group(back, text, (name, rec['images'], rec['x'], rec['y']), k))
                          for k in range(len(rec['images']))]
                gif = f'ps_{back}_{name}_{at}.gif'
                frames[0].save(os.path.join(out, gif), save_all=True, append_images=frames[1:], duration=180,
                               loop=0)
                saved.append(gif)
    # Les deux figures du commandant, toutes leurs images (par-dessus l'image 0), sur la carte ph2map1 ; cible de la
    # baguette : celle du premier passage de la conversation 4.
    for name in ('commndr', 'yucmndr'):
        shape = d.pak_entry(cs.pak('CONVSHPS'), cs.TABLES['FIGR'][name])
        cells = []
        for f in range(len(d.shape_images(shape))):
            one = (name, [f], 115, 70)
            cells.append((f'image {f}', group('ph2map1', None, one, 0).crop((100, 50, 320, 160))))
        di.labelled_strip(cells, scale=1, columns=4).save(os.path.join(out, f'ps_figure_{name}.png'))
        saved.append(f'ps_figure_{name}.png')
    print('\n'.join(saved))


if __name__ == '__main__':
    write_all(sys.argv[1])
