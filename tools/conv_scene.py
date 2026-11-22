"""Rendu d'une scène de groupe de conversation (commande 00h de CONV.PAK), comme OPTEST.EXE.

Suit Conv_PlayScript_5AA4E (analysis/CONV_SYSTEM.md, « Scène de groupe ») : éléments du décor
(FORM BACK), puis image 0 des figurants (01h) et des personnages qui parlent (02h) dans l'ordre du
script ; palette = palettes du décor, puis FGPL « normal », puis PFIG du premier figurant ; image
hors écran 320 × 200, lignes 0 à 127 recopiées à partir de la ligne 24 de l'écran.

Usage : python3 tools/conv_scene.py --donnees <BIGTRE.TRE ou DATA> <entrée> <n° de scène> <sortie.png>
"""
import os
import struct
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

import conv_dump as cd  # noqa: E402
import sc_data as d  # noqa: E402
from PIL import Image  # noqa: E402

G = d.GAME
CONVDATA = d.read(os.path.join(G, 'GAMEFLOW', 'CONVDATA.IFF'))


def chunks(o, e):
    while o + 8 <= e:
        tag = CONVDATA[o:o + 4]
        n = struct.unpack('>I', CONVDATA[o + 4:o + 8])[0]
        yield tag, o, n
        o += 8 + n + (n & 1)


def convdata_tables():
    """FORM BACK → éléments (source, image, palette, y) ; FACE, FIGR, PFIG, FCPL, FGPL → nom → numéro."""
    backs = {}
    tables = {}
    for _, o, n in chunks(0, len(CONVDATA)):
        kind = CONVDATA[o + 8:o + 12]
        if kind == b'BCKS':
            for _, o2, n2 in chunks(o + 12, o + 8 + n):
                name = None
                data = b''
                for tag, o3, n3 in chunks(o2 + 12, o2 + 8 + n2):
                    if tag == b'INFO':
                        name = CONVDATA[o3 + 8:o3 + 16].split(b'\0')[0].decode()
                    if tag == b'DATA':
                        data = CONVDATA[o3 + 8:o3 + 8 + n3]
                backs[name] = [(data[i], data[i + 1], data[i + 2], struct.unpack_from('<h', data, i + 3)[0])
                               for i in range(0, len(data), 5)]
        else:
            table = tables.setdefault(kind.decode(), {})
            for _, o2, n2 in chunks(o + 12, o + 8 + n):
                table[CONVDATA[o2 + 8:o2 + 16].split(b'\0')[0].decode()] = CONVDATA[o2 + 16]
    return backs, tables


BACKS, TABLES = convdata_tables()


def pak(name):
    return os.path.join(G, 'GAMEFLOW', name + '.PAK')


def apply_palette(pal, block):
    first, count, rgb = d.palette_block(block)
    pal[3 * first:3 * first + 3 * count] = rgb


def group_scenes(entry):
    groups = []
    for _, kind, rec in cd.parse(d.pak_entry(pak('CONV'), entry)):
        if kind.startswith('00'):
            groups.append({'décor': rec['décor'], 'figures': []})
        elif kind.startswith(('01', '02')) and groups:
            groups[-1]['figures'].append((kind[:2], rec['figure'], rec['x'], rec['y']))
    return groups


def render(entry, number, out):
    group = group_scenes(entry)[number]
    pal = bytearray(768)
    offscreen = bytearray(320 * 200)
    whole = (0, 0, 319, 199)
    # Décor : ConvData_LoadBackground_5A4E6, éléments dans l'ordre, chacun en (0, y).
    for source, image, palette, y in BACKS[group['décor']]:
        shapes, palettes = ('OPTSHPS', 'OPTPALS') if source == 1 else ('CONVSHPS', 'CONVPALS')
        apply_palette(pal, d.pak_entry(pak(palettes), palette))
        d.draw_image(offscreen, 320, 200, d.pak_entry(pak(shapes), image), 0, 0, y, whole)
    # Palette des figures : FGPL « normal », puis PFIG du premier figurant (01h) seulement.
    apply_palette(pal, d.pak_entry(pak('CONVPALS'), TABLES['FGPL']['normal']))
    extras = [f for f in group['figures'] if f[0] == '01']
    if extras:
        apply_palette(pal, d.pak_entry(pak('CONVPALS'), TABLES['PFIG'][extras[0][1]]))
    # Figures : image 0 (corps) en (x, y), dans l'ordre du script.
    for _, name, x, y in group['figures']:
        d.draw_image(offscreen, 320, 200, d.pak_entry(pak('CONVSHPS'), TABLES['FIGR'][name]), 0, x, y, whole)
    screen = bytearray(320 * 200)
    for row in range(128):
        screen[(24 + row) * 320:(25 + row) * 320] = offscreen[row * 320:(row + 1) * 320]
    im = Image.frombytes('P', (320, 200), bytes(screen))
    im.putpalette(bytes(min(255, v * 255 // 63) for v in pal))
    im.convert('RGB').resize((640, 400), Image.NEAREST).save(out)
    print(group)


if __name__ == '__main__':
    render(int(sys.argv[1]), int(sys.argv[2]), sys.argv[3])
