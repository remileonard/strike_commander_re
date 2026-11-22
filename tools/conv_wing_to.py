"""Écrans de choix de l'équipier de Tactical Operations (commandes 15, 16, 17 de CONV2.PAK).

Suit Conv_PlayScript_61E1C de TOPTTST1.EXE (analysis/topt/README.md § 7), même dessin que
CHOOSE_WINGMAN de Strike Commander (analysis/CONV_SYSTEM.md, tools/conv_doc_images.py) :
décor s_wing (1er élément descendu de 24 lignes), puis éléments de p_wing de CONVDAT2.IFF ; image
d'un élément > 92 lue dans CONVSHP2.PAK, sinon dans CONVSHPS.PAK (`cmp [bp+var_2], 5Ch` / `jbe`).

Éléments de p_wing dessinés (pilotes proposés = tous ceux de PILT, puis retraits) :
  15 : 0, puis 1 et 2 si le pilote 1, 2 est proposé, 4 à 6 si le pilote 3 à 5 est proposé (3 jamais) ;
  16 : 0, puis 1 à 5 si proposé, après retrait du 6e pilote de PILT et de Lyle (3) ;
  17 : 0, puis 1 à 5 si proposé.
Pilote survolé : image 1 de son élément par-dessus, libellé écrit à y = 175 (police de PIL).

Usage : python3 tools/conv_wing_to.py --donnees <DATA de Tactical Operations> <dossier de sortie>
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
import sc_data as d  # noqa: E402
from PIL import Image  # noqa: E402
from PIL import ImageDraw  # noqa: E402

WHOLE = (0, 0, 319, 199)
# Dernière image de CONVSHPS.PAK : au-delà, CONVSHP2.PAK.
LAST_CONVSHPS = 92

# Zones de la souris (pixels d'écran), dans l'ordre des tests ; pour chaque commande : libellé et
# élément de p_wing mis en évidence. Bornes : CONV_SYSTEM.md, tableau des zones.
ZONES = [
    (187, 232, 72, 191),
    (145, 187, 75, 197),
    (29, 75, 68, 195),
    (84, 132, 72, 193),
    (242, 281, 70, 199),
]
SCREENS = {
    15: [
        ('Select Billy', 1),
        ('Select Gwen', 2),
        ('Select Ari', 6),
        ('Select Miguel', 4),
        ('Select Tex', 5),
    ],
    16: [
        ('Select Billy', 1),
        ('Select Gwen', 2),
        ('Select Lyle', 3),
        ('Select Miguel', 4),
        ('Select Tex', 5),
    ],
    17: [
        ('Select Billy', 1),
        ('Select Gwen', 2),
        ('Select Lyle', 3),
        ('Select Miguel', 4),
        ('Select Tex', 5),
    ],
}


def gameflo2_pilt():
    """PILT de chaque escadre de GAMEFLO2.IFF : {escadre: [pilotes]}."""
    data = d.read(os.path.join(d.GAME, 'GAMEFLOW', 'GAMEFLO2.IFF'))
    wings = {}
    current = None

    def walk(o, e, inside):
        nonlocal current
        while o + 8 <= e:
            tag = data[o:o + 4]
            n = struct.unpack('>I', data[o + 4:o + 8])[0]
            if tag == b'FORM':
                walk(o + 12, o + 8 + n, inside or data[o + 8:o + 12] == b'WING')
            elif inside and tag == b'INFO':
                current = data[o + 8]
            elif inside and tag == b'PILT':
                wings[current] = list(data[o + 8:o + 8 + n])
            o += 8 + n + (n & 1)

    walk(0, len(data), False)
    return wings


def drawn_elements(command, pilt):
    proposed = [0] * 7
    for pilot in pilt:
        proposed[pilot] = 1
    if command == 15:
        return [0] + [k for k in (1, 2) if proposed[k]] + [k for k in (4, 5, 6) if proposed[k - 1]]
    if command == 16:
        if len(pilt) > 5:
            proposed[pilt[5]] = 0
        proposed[3] = 0
    return [0] + [k for k in range(1, 6) if proposed[k]]


def shape(image):
    name = 'CONVSHP2' if image > LAST_CONVSHPS else 'CONVSHPS'
    return d.pak_entry(cs.pak(name), image)


def screen(command, pilt, hovered):
    """Écran 320 × 200 ; hovered = rang de la zone survolée (−1 : aucune)."""
    pal = [0] * 768
    offscreen = bytearray(320 * 200)
    for k, (source, image, palette, y) in enumerate(cs.BACKS['s_wing']):
        shapes, palettes = ('OPTSHPS', 'OPTPALS') if source == 1 else ('CONVSHPS', 'CONVPALS')
        cs.apply_palette(pal, d.pak_entry(cs.pak(palettes), palette))
        if k == 0:
            y += 24
        d.draw_image(offscreen, 320, 200, d.pak_entry(cs.pak(shapes), image), 0, 0, y, WHOLE)
    pilots = cs.BACKS['p_wing']
    cs.apply_palette(pal, d.pak_entry(cs.pak('CONVPALS'), pilots[0][2]))
    elements = drawn_elements(command, pilt)
    label = ''
    lit = -1
    if hovered >= 0:
        label, lit = SCREENS[command][hovered]
        if lit not in elements:
            label = ''
            lit = -1
    for k in elements:
        _, image, _, y = pilots[k]
        d.draw_image(offscreen, 320, 200, shape(image), 0, 0, y, WHOLE)
        if k == lit:
            d.draw_image(offscreen, 320, 200, shape(image), 1, 0, y, WHOLE)
    rgb = bytes(min(255, v * 255 // 63) for v in pal)
    im = Image.frombytes('P', (320, 200), bytes(offscreen))
    im.putpalette(rgb)
    im = im.convert('RGB')
    if label:
        draw = ImageDraw.Draw(im)
        width = draw.textlength(label, font=di.font(11))
        draw.text(((320 - width) / 2, 175), label, fill=(255, 255, 255), font=di.font(11))
    return im


def main():
    if len(sys.argv) != 2:
        raise SystemExit(__doc__)
    out = sys.argv[1]
    os.makedirs(out, exist_ok=True)
    cs.CONVDATA = d.read(os.path.join(d.GAME, 'GAMEFLOW', 'CONVDAT2.IFF'))
    cs.BACKS, cs.TABLES = cs.convdata_tables()
    wings = gameflo2_pilt()
    # Escadre de la conversation qui emploie chaque commande dans CONV2.PAK (entrées 26, 17, 5).
    uses = {
        15: 4,
        16: 1,
        17: 4,
    }
    for command, wing in uses.items():
        pilt = wings[wing]
        cells = [(f'commande {command}, escadre {wing}', screen(command, pilt, -1))]
        for zone, (label, _) in enumerate(SCREENS[command]):
            im = screen(command, pilt, zone)
            if im.tobytes() != cells[0][1].tobytes():
                cells.append((label, im))
        for k, (label, im) in enumerate(cells):
            di.x2(im).save(os.path.join(out, f'to_wing_{command}_{k}.png'))
        di.labelled_strip(cells, 1, 3).save(os.path.join(out, f'to_wing_{command}.png'))
        print(command, 'escadre', wing, 'PILT', pilt, 'éléments', drawn_elements(command, pilt))


if __name__ == '__main__':
    main()
