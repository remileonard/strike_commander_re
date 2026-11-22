"""Lecteur de référence de l'animation d'introduction DATA\\FLIC\\THEFLIC.FLX (MENU.EXE du CD-ROM).

Format et règles lus dans MENU.EXE (analysis/menu_cd/FLX_FORMAT.md) :
- en-tête de 128 octets : nombre d'enregistrements (u32 en 84), taille du fichier (u32 en 92) ;
  puis une table de (position u32, taille u32) par enregistrement ;
- enregistrement de type 0 d'un octet : l'enregistrement suivant est une palette (format des
  palettes du jeu : premier indice, octet, nombre u16, RVB sur 6 bits) ;
- enregistrement de type 1 : image, en-tête de 16 octets (octet 1 = compression, octet 2 =
  affichage, octet 3 = première ligne), données à partir de l'octet 16.

Usage : python3 tools/flx_render.py --donnees <DATA> <sortie.gif> [première] [dernière] [pas]
        python3 tools/flx_render.py --donnees <DATA> --empreintes   (comparaison avec tools/flic_ref/flic_test)
        python3 tools/flx_render.py --donnees <DATA> --planche <sortie.png>
"""
import os
import struct
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

import sc_data as d  # noqa: E402
from PIL import Image  # noqa: E402
from terrain_map import lzw  # noqa: E402

WIDTH = 320
HEIGHT = 200
# Durée d'une image : 475 unités de 198 périodes du compteur (1 193 182 Hz) sur une machine rapide.
FRAME_SECONDS = 475 * 198 / 1193182


def records(data):
    count = struct.unpack_from('<I', data, 84)[0]
    for i in range(count):
        offset, size = struct.unpack_from('<II', data, 128 + 8 * i)
        yield data[offset:offset + size]


def decode_blocks(screen, src, first_row):
    """Affichage 2 : blocs de 4 × 4 pixels, 80 par ligne (MENU.EXE 15350)."""
    escape = src[0]
    p = 1
    coded = True
    rows = (HEIGHT - 2 * first_row) // 4
    for by in range(rows):
        for bx in range(80):
            if src[p] == escape:
                coded = not coded
                p += 1
            base = (first_row + 4 * by) * WIDTH + 4 * bx
            if coded:
                c0 = src[p]
                c1 = src[p + 1]
                if c0 == c1:
                    p += 2
                    for y in range(4):
                        screen[base + y * WIDTH:base + y * WIDTH + 4] = bytes([c0]) * 4
                    continue
                mask = src[p + 2] | (src[p + 3] << 8)
                p += 4
                # Lignes 0 et 1 : octet bas (bits de poids fort d'abord) ; lignes 2 et 3 : octet haut.
                bits = [(mask >> (7 - k)) & 1 for k in range(8)]
                bits += [(mask >> (15 - k)) & 1 for k in range(8)]
                for y in range(4):
                    for x in range(4):
                        screen[base + y * WIDTH + x] = c1 if bits[4 * y + x] else c0
            else:
                for y in range(4):
                    screen[base + y * WIDTH:base + y * WIDTH + 4] = src[p:p + 4]
                    p += 4


def draw_sprite(screen, src):
    """Affichage 0 : image du jeu par lignes (MENU.EXE 65708), dessinée sur l'image précédente."""
    flags, w, h, x0, y0 = struct.unpack_from('<Hhhhh', src, 0)
    for row in range(h):
        entry = 10 + 2 * row
        p = entry + struct.unpack_from('<H', src, entry)[0]
        x = -x0
        left = w
        while True:
            skip = src[p]
            p += 1
            left -= skip
            if left == 0:
                break
            x += skip
            count = src[p]
            p += 1
            at = (row - y0) * WIDTH + x
            if flags & 1:
                n = count >> 1
                if count & 1:
                    screen[at:at + n] = bytes([src[p]]) * n
                    p += 1
                else:
                    screen[at:at + n] = src[p:p + n]
                    p += n
            else:
                n = count
                screen[at:at + n] = src[p:p + n]
                p += n
            x += n
            left -= n
            if left == 0:
                break


def play(data):
    """Images successives (indices de palette, palette RVB 8 bits) ; une par image affichée."""
    screen = bytearray(WIDTH * HEIGHT)
    palette = bytes(768)
    it = records(data)
    for rec in it:
        if rec[0] == 0:
            block = next(it)
            first, count, rgb = d.palette_block(block)
            pal = bytearray(palette)
            pal[3 * first:3 * first + 3 * count] = bytes(min(255, v * 255 // 63) for v in rgb)
            palette = bytes(pal)
            # Bandes du haut et du bas (lignes 0 à 23 et 176 à 199) : couleur la plus proche du noir
            # (MENU.EXE 62966 à 63031).
            dark = min(range(256), key=lambda c: sum(v * v for v in palette[3 * c:3 * c + 3]))
            screen[0:24 * WIDTH] = bytes([dark]) * (24 * WIDTH)
            screen[176 * WIDTH:200 * WIDTH] = bytes([dark]) * (24 * WIDTH)
            continue
        compression = rec[1]
        display = rec[2]
        first_row = rec[3]
        body = rec[16:]
        if compression == 1:
            body = lzw(body)
        if display == 0:
            draw_sprite(screen, body)
        elif display == 1:
            n = WIDTH * (HEIGHT - 2 * first_row)
            screen[first_row * WIDTH:first_row * WIDTH + n] = body[:n]
        elif display == 2:
            decode_blocks(screen, body, first_row)
        yield bytes(screen), palette


def image(screen, palette):
    im = Image.frombytes('P', (WIDTH, HEIGHT), screen)
    im.putpalette(palette)
    return im.convert('RGB')


def main():
    path = os.path.join(d.GAME, 'FLIC', 'THEFLIC.FLX')
    data = d.read(path)
    args = sys.argv[1:]
    if args and args[0] == '--empreintes':
        # Empreinte FNV-1a des indices de chaque image, comme tools/flic_ref/flic_test.cpp.
        for k, (s, p) in enumerate(play(data)):
            h = 2166136261
            for b in s:
                h = ((h ^ b) * 16777619) & 0xFFFFFFFF
            print(f'{k + 1} {h:08x}')
        return
    if args and args[0] == '--planche':
        frames = [image(s, p) for s, p in play(data)]
        picks = frames[::max(1, len(frames) // 24)][:24]
        sheet = Image.new('RGB', (WIDTH * 4, HEIGHT * 6))
        for k, im in enumerate(picks):
            sheet.paste(im, ((k % 4) * WIDTH, (k // 4) * HEIGHT))
        sheet.save(args[1])
        print(len(frames), 'images')
        return
    first = int(args[1]) if len(args) > 1 else 0
    last = int(args[2]) if len(args) > 2 else 10 ** 9
    step = int(args[3]) if len(args) > 3 else 1
    frames = []
    for k, (s, p) in enumerate(play(data)):
        if first <= k <= last and (k - first) % step == 0:
            frames.append(image(s, p))
    frames[0].save(args[0], save_all=True, append_images=frames[1:], duration=int(1000 * FRAME_SECONDS * step), loop=0)
    print(len(frames), 'images')


if __name__ == '__main__':
    main()
