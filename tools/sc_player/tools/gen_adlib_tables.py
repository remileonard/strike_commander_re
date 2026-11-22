#!/usr/bin/env python3
"""Genere librealspace/AILAdlibTables.h a partir du binaire reel ADLIB.ADV (pilote AIL du jeu).
Usage : python3 gen_adlib_tables.py ADLIB.ADV librealspace/AILAdlibTables.h
Chaque table est copiee a son offset exact dans le binaire (offsets cites dans
analysis/ADLIB_DRIVER.md et dans le code du pilote, ex. 'mov ax, cs:[di+0AACh]')."""
import struct, sys
b = open(sys.argv[1], 'rb').read()
tables = [
    # nom, offset, nombre, type, usage dans le pilote
    ("ADL_FNUM",        0xAAC, 192, 'H', "F-Number, 12 demi-tons x 16 pas ('mov ax, cs:[di+0AACh]')"),
    ("ADL_OCTAVE",      0xC2C,  96, 'B', "octave + 1 par demi-ton 0..95 ('mov bl, cs:[di+0C2Ch]')"),
    ("ADL_SEMITONE",    0xC8C,  96, 'B', "demi-ton dans l'octave ('mov bl, cs:[di+0C8Ch]')"),
    ("ADL_INIT_REGS",   0xCEB, 246, 'B', "valeurs initiales des registres 0..0xF5 (sub_1B47)"),
    ("ADL_VELOCITY",    0xED6,  16, 'B', "velocite MIDI >> 3 -> niveau ('mov bx, 0ED6h / xlat')"),
    ("ADL_OP_MOD",      0xEE6,  18, 'B', "operateur modulateur par canal OPL"),
    ("ADL_OP_CAR",      0xEF8,  18, 'B', "operateur porteur par canal OPL"),
    ("ADL_OP_OFFSET",   0xF0A,  36, 'B', "offset de registre par operateur"),
    ("ADL_CH_OFFSET",   0xF52,  18, 'B', "offset de registre par canal OPL"),
    ("ADL_CTRL_LOGGED", 0x2AA7,  9, 'B', "controleurs XMIDI journalises"),
    ("ADL_CTRL_DEFAULT",0x2AB0,  9, 'B', "valeurs initiales de ces controleurs"),
    ("ADL_PRG_DEFAULT", 0x2AB9,  9, 'B', "programmes initiaux des canaux MIDI 1..9 (0xFF = aucun)"),
]
out = ["/* Genere par tools/gen_adlib_tables.py depuis ADLIB.ADV (pilote AdLib AIL de Strike Commander). Ne pas editer. */",
       "#ifndef AIL_ADLIB_TABLES_H", "#define AIL_ADLIB_TABLES_H", "#include <stdint.h>"]
for name, off, n, t, doc in tables:
    sz = struct.calcsize(t)
    vals = struct.unpack('<%d%s' % (n, t), b[off:off + n * sz])
    ctype = 'uint16_t' if t == 'H' else 'uint8_t'
    out.append("/* @0x%X : %s */" % (off, doc))
    out.append("static const %s %s[%d] = {" % (ctype, name, n))
    for i, v in enumerate(vals):                      # une valeur par ligne (style du projet)
        out.append("    %d%s" % (v, "," if i + 1 < n else ""))
    out.append("};")
out.append("#endif")
open(sys.argv[2], 'w').write("\n".join(out) + "\n")
