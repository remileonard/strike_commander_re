#!/usr/bin/env python3
"""Conversations de Wings of Glory (GAMEFLOW\\CONV.PAK, CONVF.PAK, CONVG.PAK de WOGDATA1.TRE) : lecture et test.

Règles de lecture relevées dans WINGS_OF.EXE (analysis/wings/README.md § 5) :
  - Conv_PlayScript_14F62 ouvre gameflow\\conv.pak et joue l'entrée n ; il lit une commande (1 octet) tant que
    le pointeur n'a pas atteint la fin de l'entrée (début + taille <= pointeur : fin, loc_16739) ;
  - aiguillage sur 20 valeurs (cmp bx, 13h) :
      0  GROUP_SHOT           décor (9 octets, ConvRec_ReadName_18AAF), puis tant que l'octet suivant vaut 1 :
                              GROUP_SHOT_ADD_CHARACTER = figure (9), x (mot), y (mot) (ConvRec_ReadFigure_18C04)
      18 GROUP_SHOT_WWI       même lecture que 0 ; chaque figure n'est pas cherchée dans CONVDATA.IFF : son nom perd
                              son dernier caractère (mov byte ptr [bx-1], 0), le reste est converti en nombre
                              (CRT_Atol_22B1) = numéro d'entrée de GAMEFLOW\WWISHPS.PAK (« 210 » → entrée 21)
      3  CLOSEUP              ConvRec_ReadCloseup_18AD6 : visage (9), image (1), décor (9), x (mot), y (mot),
                              texte (terminé par 0), couleur (1) ; puis, tant que l'octet suivant vaut 19 ou 4 et
                              que l'entrée n'est pas finie : CLOSEUP_SAME / CLOSEUP_CONTINUATION = texte seul
      10 SHOW_TEXT            couleur (1), texte (ConvRec_ReadText_18D3D)
      12 JUMP                 mot n (ConvRec_ReadNumber_18DDA), puis le pointeur avance de n octets
      16 NOP_16               rien
      4, 19 rencontrés seuls  message « CONT or SAME out of place! » ; autre valeur : « Got lost while running
                              the conversation! » ; le jeu continue avec l'octet suivant.
  - mots en petit-boutiste ; noms de 9 octets (8 caractères et un 0).

Usage : python3 tools/wog_conv_dump.py WOGDATA1.TRE [--pak CONV.PAK] [--entree n]   (texte d'une entrée)
        python3 tools/wog_conv_dump.py WOGDATA1.TRE --test                         (test de toutes les entrées)
"""
import argparse
import collections
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

NAMES = {
    0: "GROUP_SHOT",
    1: "GROUP_SHOT_ADD_CHARACTER",
    3: "CLOSEUP",
    4: "CLOSEUP_CONTINUATION",
    10: "SHOW_TEXT",
    12: "JUMP",
    16: "NOP_16",
    18: "GROUP_SHOT_WWI",
    19: "CLOSEUP_SAME",
}


class ParseError(Exception):
    pass


class Reader:
    def __init__(self, data):
        self.data = data
        self.pos = 0

    def ended(self):
        return self.pos >= len(self.data)

    def byte(self):
        if self.pos >= len(self.data):
            raise ParseError("lecture après la fin de l'entrée (octet %d)" % self.pos)
        value = self.data[self.pos]
        self.pos += 1
        return value

    def peek(self):
        if self.pos >= len(self.data):
            return None
        return self.data[self.pos]

    def word(self):
        low = self.byte()
        high = self.byte()
        return low | (high << 8)

    def name(self):
        raw = bytes(self.byte() for _ in range(9))
        return raw.split(b"\0")[0].decode("latin1")

    def text(self):
        end = self.data.find(b"\0", self.pos)
        if end < 0:
            raise ParseError("texte sans 0 final (octet %d)" % self.pos)
        value = self.data[self.pos:end].decode("cp437")
        self.pos = end + 1
        return value


def wwi_entry(name):
    """Conv_PlayScript_14F62, plan GROUP_SHOT_WWI : dernier caractère retiré, puis atol (chiffres en tête, 0 sinon)."""
    digits = ""
    for c in name[:-1].lstrip():
        if not c.isdigit():
            break
        digits += c
    return int(digits) if digits else 0


def parse(data):
    """Rend la liste des commandes et la liste des anomalies (comme le jeu : on continue après une anomalie)."""
    r = Reader(data)
    commands = []
    problems = []
    while not r.ended():
        at = r.pos
        code = r.byte()
        if code in (0, 18):
            backdrop = r.name()
            commands.append((at, code, {"décor": backdrop}))
            while r.peek() == 1:
                sub = r.pos
                r.byte()
                figure = {"figure": r.name(), "x": r.word(), "y": r.word()}
                if code == 18:
                    figure["entrée WWISHPS"] = wwi_entry(figure["figure"])
                commands.append((sub, 1, figure))
        elif code == 3:
            fields = {"visage": r.name(), "image": r.byte(), "décor": r.name(), "x": r.word(), "y": r.word()}
            fields["texte"] = r.text()
            fields["couleur"] = r.byte()
            commands.append((at, 3, fields))
            while not r.ended() and r.peek() in (4, 19):
                sub = r.pos
                follow = r.byte()
                commands.append((sub, follow, {"texte": r.text()}))
        elif code == 10:
            colour = r.byte()
            commands.append((at, 10, {"couleur": colour, "texte": r.text()}))
        elif code == 12:
            n = r.word()
            commands.append((at, 12, {"n": n}))
            r.pos += n
        elif code == 16:
            commands.append((at, 16, {}))
        elif code in (4, 19):
            problems.append("octet %d : %s hors d'un CLOSEUP" % (at, NAMES[code]))
        else:
            problems.append("octet %d : commande inconnue %d" % (at, code))
    if r.pos != len(data):
        problems.append("fin à l'octet %d pour une entrée de %d octets" % (r.pos, len(data)))
    return commands, problems


def use_archive(archive):
    os.environ["SC_DATA"] = archive
    import sc_data
    sc_data.GAME = archive
    return sc_data


def load(archive, pak):
    sc_data = use_archive(archive)
    path = os.path.join(archive, "GAMEFLOW", pak)
    data, entries = sc_data.pak_entries(path)
    out = []
    for flag, start, end in entries:
        out.append(data[start:end])
    return out


def convdata_names(archive):
    sc_data = use_archive(archive)
    import object_render as orr
    data = sc_data.read(os.path.join(archive, "GAMEFLOW", "CONVDATA.IFF"))
    names = collections.defaultdict(set)
    for where, tag, pos, size in orr.iff_chunks(data, 0, len(data)):
        if tag == "DATA" and where in ("/FACE", "/FIGR"):
            names[where[1:]].add(data[pos:pos + 8].split(b"\0")[0].decode("latin1").lower())
        if tag == "INFO" and where == "/BCKS/BACK":
            names["BACK"].add(data[pos:pos + size].split(b"\0")[0].decode("latin1").lower())
    return names


def show(commands):
    for at, code, fields in commands:
        indent = "    " if code in (1, 4, 19) else ""
        text = ", ".join("%s %s" % (k, repr(v) if isinstance(v, str) else v) for k, v in fields.items())
        print("%5d  %s%s %s" % (at, indent, NAMES[code], text))


def test(archive):
    names = convdata_names(archive)
    wwi = load(archive, "WWISHPS.PAK")
    failures = 0
    for pak in ("CONV.PAK", "CONVF.PAK", "CONVG.PAK"):
        entries = load(archive, pak)
        counts = collections.Counter()
        missing = collections.Counter()
        wwi_used = set()
        figr_cited = 0
        empty = 0
        bad = 0
        for k, data in enumerate(entries):
            if len(data) == 0:
                empty += 1
                continue
            commands, problems = parse(data)
            if problems:
                bad += 1
                for p in problems:
                    print("  %s entrée %d : %s" % (pak, k, p))
            for at, code, fields in commands:
                counts[NAMES[code]] += 1
                if code == 3 and fields["visage"].lower() not in names["FACE"]:
                    missing["visage " + fields["visage"]] += 1
                if code == 1 and "entrée WWISHPS" in fields:
                    n = fields["entrée WWISHPS"]
                    if n >= len(wwi) or len(wwi[n]) == 0:
                        missing["entrée de WWISHPS.PAK %d (figure %s)" % (n, fields["figure"])] += 1
                    else:
                        wwi_used.add(n)
                elif code == 1:
                    figr_cited += 1
                    if fields["figure"].lower() not in names["FIGR"]:
                        missing["figure " + fields["figure"]] += 1
                if code in (0, 18) and fields["décor"].lower() not in names["BACK"]:
                    missing["décor " + fields["décor"]] += 1
        failures += bad
        print("%s : %d entrées, %d vides, %d lues jusqu'au dernier octet sans anomalie, %d avec anomalie"
              % (pak, len(entries), empty, len(entries) - empty - bad, bad))
        print("  commandes : " + ", ".join("%s %d" % (n, c) for n, c in sorted(counts.items())))
        print("  plans GROUP_SHOT_WWI : entrées de WWISHPS.PAK employées %s (sur %d)" % (sorted(wwi_used), len(wwi)))
        if missing:
            print("  noms absents de CONVDATA.IFF : " + ", ".join("%s (%d)" % kv for kv in sorted(missing.items())))
        else:
            print("  tous les noms se retrouvent : visages (FACE), figures (FIGR, %d citées), décors de plan de groupe (BACK), entrées de WWISHPS.PAK" % figr_cited)
    return failures


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("archive", help="WOGDATA1.TRE ou dossier DATA")
    ap.add_argument("--pak", default="CONV.PAK")
    ap.add_argument("--entree", type=int, default=0)
    ap.add_argument("--test", action="store_true")
    args = ap.parse_args()
    if args.test:
        sys.exit(1 if test(args.archive) else 0)
    entries = load(args.archive, args.pak)
    commands, problems = parse(entries[args.entree])
    show(commands)
    for p in problems:
        print("ANOMALIE : " + p)


if __name__ == "__main__":
    main()
