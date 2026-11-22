#!/usr/bin/env python3
"""Images des conversations de Wings of Glory, composées comme WINGS_OF.EXE (analysis/wings/README.md § 5).

Règles relevées dans le code (Conv_PlayScript_14F62 et les fonctions qu'il appelle) :
  - décor (fonction pas encore nommée en 14A86, proposé ConvData_LoadBackground_14A86) : FORM BACK de
    GAMEFLOW\\CONVDATA.IFF dont INFO = nom du décor ; DATA = éléments de 5 octets (source, image, palette,
    mot y) ; source 0 = CONVSHPS.PAK / CONVPALS.PAK, source 1 = WWISHPS.PAK / WWIPALS.PAK ; chaque élément
    devient un calque en (0, y) (Layer_Construct_45F57) et sa palette est copiée dans celle de la scène
    (Palette_CopyInto_46D40), dans l'ordre des éléments ;
  - gros plan (CLOSEUP) : visage = forme de CONVSHPS.PAK dont le numéro est l'octet du nom dans FORM FACE
    (fonction pas encore nommée en 14825, type 0) ; palette « normal » de FORM FCPL (type 2) = entrée de
    CONVPALS.PAK, copiée après celles du décor ; le visage est dessiné en (x, y) de la commande par la
    fonction de dessin pas encore nommée en 1C860 (proposé TalkingHead_Draw_1C860) : image 0, puis l'image
    de base (octet « image » de la commande, TalkingHead_SetBaseFrame_1C84D) sauf si elle vaut 0 ou −1,
    puis la bouche sauf si elle vaut 0 ou −1 (0 à la construction : pas de bouche sur une image fixe) ;
  - plan GROUP_SHOT_WWI : décor, puis chaque figure = entrée (atol du nom sans son dernier caractère) de
    WWISHPS.PAK, calque en (x, y) de la commande ; aucune palette ajoutée pour les figures.
  - texte (CLOSEUP, CLOSEUP_CONTINUATION, CLOSEUP_SAME, SHOW_TEXT) : zone de (0, 152) à (319, 199)
    (mov [bp+var_2A], 98h / 13Fh / 0C7h, sub_59CE5) dans la police FONTS\CONVFONT.SHP, couleur = octet couleur ;
    mise en page (fonction pas encore nommée en 145D8, proposé Conv_DrawText_145D8) : codes $ remplacés, puis
    lignes de 30 caractères au plus (cmp dx, 1Eh), coupées au dernier espace à partir du 31ᵉ caractère, dessinées
    par Widget_RenderComplexLayoutWrapper_4923E avec « %Y%J%S », Y = 4, 19, 34… (add [bp+var_6], 0Fh) et J = 2
    (centré) ; dessin des caractères selon les règles du moteur de texte de Strike Commander (CONV_SYSTEM.md § 7,
    même fonction de mise en page reprise ici ; mesure des caractères non relue dans WINGS_OF.EXE) : largeur = 1er
    mot de l'en-tête de l'image + 1, espacement 2, espace = largeur du tiret, point d'ancrage à
    y + (hauteur de « A » au-dessus de son ancrage) + 1, segments remplis de la couleur (255 : couleurs propres).
Chaque image d'une forme est dessinée par ses segments de ligne (sc_data.draw_image). Image de 320 × 200.

Usage : python3 tools/wog_conv_render.py WOGDATA1.TRE CONV.PAK <conversation> <commande> sortie.png [--echelle 2]
        (commande = rang de la commande dans la conversation, comme l'affiche tools/wog_conv_dump.py)
"""
import argparse
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import object_render as orr  # noqa: E402
import wog_conv_dump as wcd  # noqa: E402

WIDTH = 320
HEIGHT = 200


class Scene:
    def __init__(self, archive):
        self.d = wcd.use_archive(archive)
        self.archive = archive
        data = self.d.read(self.path("CONVDATA.IFF"))
        self.backs = {}
        self.tables = {}
        name = None
        for where, tag, pos, size in orr.iff_chunks(data, 0, len(data)):
            body = data[pos:pos + size]
            if where == "/BCKS/BACK" and tag == "INFO":
                name = body.split(b"\0")[0].decode("latin1").lower()
            elif where == "/BCKS/BACK" and tag == "DATA":
                layers = []
                for k in range(0, size - size % 5, 5):
                    layers.append((body[k], body[k + 1], body[k + 2], struct.unpack_from("<h", body, k + 3)[0]))
                self.backs[name] = layers
            elif tag == "DATA" and where in ("/FACE", "/FIGR", "/FCPL", "/FGPL", "/PFIG"):
                table = self.tables.setdefault(where[1:], {})
                table[body[:8].split(b"\0")[0].decode("latin1").lower()] = body[8]

    def path(self, name):
        return os.path.join(self.archive, "GAMEFLOW", name)

    def entry(self, pak, n):
        return self.d.pak_entry(self.path(pak), n)

    def new(self):
        self.palette = bytearray(768)
        self.pixels = bytearray(WIDTH * HEIGHT)

    def apply_palette(self, block):
        first, count, rgb = self.d.palette_block(block)
        self.palette[3 * first:3 * first + 3 * count] = rgb[:3 * count]

    def draw(self, shape, image, x, y):
        self.d.draw_image(self.pixels, WIDTH, HEIGHT, shape, image, x, y, (0, 0, WIDTH - 1, HEIGHT - 1))

    def backdrop(self, name):
        for source, image, palette, y in self.backs[name.lower()]:
            shapes, palettes = ("WWISHPS.PAK", "WWIPALS.PAK") if source == 1 else ("CONVSHPS.PAK", "CONVPALS.PAK")
            self.apply_palette(self.entry(palettes, palette))
            self.draw(self.entry(shapes, image), 0, 0, y)

    def closeup(self, fields):
        self.new()
        self.backdrop(fields["décor"])
        self.apply_palette(self.entry("CONVPALS.PAK", self.tables["FCPL"]["normal"]))
        face = self.entry("CONVSHPS.PAK", self.tables["FACE"][fields["visage"].lower()])
        self.draw(face, 0, fields["x"], fields["y"])
        base = fields["image"]
        if base == 255:
            base = -1
        if base not in (0, -1):
            self.draw(face, base, fields["x"], fields["y"])

    def group(self, fields, figures):
        self.new()
        self.backdrop(fields["décor"])
        for figure in figures:
            if "entrée WWISHPS" in figure:
                self.draw(self.entry("WWISHPS.PAK", figure["entrée WWISHPS"]), 0, figure["x"], figure["y"])

    def text(self, text, colour):
        font = self.d.read(os.path.join(self.archive, "FONTS", "CONVFONT.SHP"))
        offsets = self.d.shape_images(font)

        def advance(c):
            if c == " ":
                c = "-"
            return struct.unpack_from("<h", font, offsets[ord(c)])[0] + 1

        def width(line):
            return sum(advance(c) for c in line) + 2 * (len(line) - 1)

        above = struct.unpack_from("<h", font, offsets[ord("A")] + 4)[0]
        lines = []
        rest = text
        while len(rest) > 0:
            if len(rest) > 30:
                cut = 30
                while cut > 0 and rest[cut] != " ":
                    cut -= 1
                lines.append(rest[:cut])
                rest = rest[cut + 1:]
            else:
                lines.append(rest)
                rest = ""
        left = 0
        top = 152
        box = 320
        for n, line in enumerate(lines):
            x = left + (box - width(line)) // 2
            y = top + 4 + 15 * n + above + 1
            for c in line:
                if c != " " and ord(c) < len(offsets):
                    for sx, sy, pix in self.d.image_spans(font, ord(c)):
                        yy = y + sy
                        if 0 <= yy < HEIGHT:
                            for i, v in enumerate(pix):
                                xx = x + sx + i
                                if 0 <= xx < WIDTH:
                                    self.pixels[yy * WIDTH + xx] = v if colour == 255 else colour
                x += advance(c) + 2

    def png(self, out, scale):
        rgb = bytearray()
        for value in self.pixels:
            for q in range(3):
                rgb.append(min(255, self.palette[3 * value + q] * 255 // 63))
        img = bytearray()
        for y in range(HEIGHT):
            row = rgb[y * WIDTH * 3:(y + 1) * WIDTH * 3]
            wide = bytearray()
            for x in range(WIDTH):
                wide += row[3 * x:3 * x + 3] * scale
            img += bytes(wide) * scale
        import numpy as np
        import wog_terrain_render as wtr
        wtr.write_png(out, np.frombuffer(bytes(img), dtype=np.uint8).reshape(HEIGHT * scale, WIDTH * scale, 3))


def render(archive, pak, conversation, index, out, scale):
    """Image de la commande index : le plan en cours (dernier CLOSEUP, GROUP_SHOT ou GROUP_SHOT_WWI jusqu'à
    elle) et, si la commande porte un texte, ce texte dans la zone du bas."""
    scene = Scene(archive)
    commands, problems = wcd.parse(wcd.load(archive, pak)[conversation])
    shot = None
    colour = 255
    for k in range(index + 1):
        at, code, fields = commands[k]
        if code in (0, 3, 18):
            shot = k
        if code == 3:
            colour = fields["couleur"]
    if shot is None:
        raise SystemExit("aucun plan avant la commande %d" % index)
    at, code, fields = commands[shot]
    if code == 3:
        scene.closeup(fields)
    else:
        figures = []
        for _, sub, f in commands[shot + 1:]:
            if sub != 1:
                break
            figures.append(f)
        scene.group(fields, figures)
    at, here, here_fields = commands[index]
    if here == 10:
        colour = here_fields["couleur"]
    if here in (3, 4, 10, 19):
        scene.text(here_fields["texte"], colour)
    scene.png(out, scale)
    return here, here_fields


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("archive")
    ap.add_argument("pak")
    ap.add_argument("conversation", type=int)
    ap.add_argument("commande", type=int)
    ap.add_argument("sortie")
    ap.add_argument("--echelle", type=int, default=2)
    args = ap.parse_args()
    code, fields = render(args.archive, args.pak, args.conversation, args.commande, args.sortie, args.echelle)
    print(args.sortie, wcd.NAMES[code], fields)


if __name__ == "__main__":
    main()
