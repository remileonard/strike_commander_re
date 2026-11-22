#!/usr/bin/env python3
"""Archives XTRE de Wings of Glory (FLIGHTHD.TRE, FLIGHTCD.TRE), lues par GLORY.EXE (lignes « @ » de WG.CFG).

Format (constaté dans GLORY.EXE et sur les fichiers, analysis/wings/README.md § 8) :
  en-tête, 6 × u32 : 'XTRE', 0, début de l'index des hachages, fin de cet index,
                     début de la table des fichiers, début des données (= taille de tout l'index) ;
  index des hachages : enregistrements de 8 octets (hachage u32, position u32 de l'enregistrement du fichier,
                       0FFFFFFFFh = case vide), rangés en arbre binaire dans un tableau : la case i (à partir de 1)
                       a pour fils 2i (hachage plus petit) et 2i + 1 (plus grand), comparaison sans signe ;
  table des fichiers : enregistrements de 8 octets (position u32 dans l'archive, puis u32 = taille décompressée
                       sur les 30 bits bas, bit 31 et bit 30 = mode de stockage) ; la longueur stockée est la
                       position suivante moins celle-ci (fin de l'archive pour le dernier) ;
  modes : 0 = en clair ; 2 (bit 31) = LZW (codes de 9 à 12 bits, 256 = remise à zéro, 257 = fin) ;
          3 (bits 31 et 30) = compression LZ77 à 4 formes de commande (lz_decode).

Hachage d'un nom (fonction de GLORY.EXE à l'offset 91CD6h de l'image) : chemin complet en majuscules,
ex. « ..\\..\\DATA\\TERRAIN\\MAP2.PAK » ; h = 0 ; pour chaque octet c : h = rol(h, 3) + c (32 bits).

Les noms ne sont pas dans l'archive : on les retrouve en hachant des noms connus (--noms : archives TRE à
noms en clair comme WOGDATA1.TRE, ou fichiers texte d'un nom par ligne).

Usage : python3 tools/xtre_extract.py FLIGHTHD.TRE [--noms WOGDATA1.TRE ...] [--extraire DOSSIER]
"""
import argparse
import os
import struct
import sys


def name_hash(name):
    h = 0
    for c in name.upper().encode("latin1"):
        h = ((h << 3) | (h >> 29)) & 0xFFFFFFFF
        h = (h + c) & 0xFFFFFFFF
    return h


def lzw_decode(src, size):
    out = bytearray()
    pos = 0
    nbits = 9
    limit = 0x200
    nxt = 0x102
    table = {}
    prev = None
    total = len(src) * 8
    while len(out) < size and pos + nbits <= total:
        byte = pos >> 3
        v = src[byte]
        if byte + 1 < len(src):
            v |= src[byte + 1] << 8
        if byte + 2 < len(src):
            v |= src[byte + 2] << 16
        code = (v >> (pos & 7)) & ((1 << nbits) - 1)
        pos += nbits
        if code == 0x101:
            break
        if code == 0x100:
            nbits = 9
            limit = 0x200
            nxt = 0x102
            table = {}
            prev = None
            continue
        if code < 0x100:
            s = bytes([code])
        elif code in table:
            s = table[code]
        elif code == nxt and prev is not None:
            s = prev + prev[:1]
        else:
            raise ValueError("code LZW inattendu %d" % code)
        out += s
        if prev is not None:
            table[nxt] = prev + s[:1]
            nxt += 1
            if nxt >= limit and nbits < 12:
                nbits += 1
                limit <<= 1
        prev = s
    return bytes(out)


def lz_decode(src, size):
    """Mode 3 (GLORY.EXE, fonction à l'offset 932FCh de l'image) : suite de commandes, octet de tête b0.
    0xxxxxxx b1             : b0 & 3 octets copiés, puis copie de ((b0 & 1Ch) >> 2) + 3 octets
                              depuis ((b0 & 60h) << 3) + b1 + 1 octets en arrière ;
    10xxxxxx b1 b2          : b1 >> 6 octets copiés, puis (b0 & 3Fh) + 4 octets depuis ((b1 & 3Fh) << 8) + b2 + 1 ;
    110xxxxx b1 b2 b3       : b0 & 3 octets copiés, puis ((b0 & 0Ch) << 6) + b3 + 5 octets
                              depuis ((b0 & 10h) << 12) + (b1 << 8) + b2 + 1 ;
    111xxxxx                : ((b0 & 1Fh) << 2) + 4 octets copiés ; si ce nombre dépasse 112 : b0 & 3 octets
                              copiés et fin."""
    out = bytearray()
    i = 0
    n = len(src)
    while i < n and len(out) < size:
        b0 = src[i]
        if b0 & 0x80 == 0:
            b1 = src[i + 1]
            i += 2
            lit = b0 & 3
            out += src[i:i + lit]
            i += lit
            dist = ((b0 & 0x60) << 3) + b1 + 1
            count = ((b0 & 0x1C) >> 2) + 3
        elif b0 & 0x40 == 0:
            b1 = src[i + 1]
            b2 = src[i + 2]
            i += 3
            lit = b1 >> 6
            out += src[i:i + lit]
            i += lit
            dist = ((b1 & 0x3F) << 8) + b2 + 1
            count = (b0 & 0x3F) + 4
        elif b0 & 0x20 == 0:
            b1 = src[i + 1]
            b2 = src[i + 2]
            b3 = src[i + 3]
            i += 4
            lit = b0 & 3
            out += src[i:i + lit]
            i += lit
            dist = ((b0 & 0x10) << 12) + (b1 << 8) + b2 + 1
            count = ((b0 & 0x0C) << 6) + b3 + 5
        else:
            i += 1
            lit = ((b0 & 0x1F) << 2) + 4
            if lit > 0x70:
                lit = b0 & 3
                out += src[i:i + lit]
                break
            out += src[i:i + lit]
            i += lit
            continue
        start = len(out) - dist
        for k in range(count):
            out.append(out[start + k])
    return bytes(out)


def read_xtre(data):
    magic, zero, hash_start, hash_end, files_start, data_start = struct.unpack_from("<4s5I", data, 0)
    if magic != b"XTRE":
        raise SystemExit("pas une archive XTRE")
    hashes = {}
    for k in range((hash_end - hash_start) // 8):
        h, p = struct.unpack_from("<II", data, hash_start + 8 * k)
        if p != 0xFFFFFFFF:
            hashes[p] = h
    records = []
    count = (data_start - files_start) // 8
    for k in range(count):
        position, word = struct.unpack_from("<II", data, files_start + 8 * k)
        records.append((files_start + 8 * k, position, word))
    files = []
    for k, (where, position, word) in enumerate(records):
        end = records[k + 1][1] if k + 1 < len(records) else len(data)
        files.append({
            "hash": hashes.get(where),
            "position": position,
            "stored": end - position,
            "size": word & 0x3FFFFFFF,
            "mode": word >> 30,
        })
    return files


def old_tre_names(path):
    data = open(path, "rb").read()
    if data[:4] == b"XTRE":
        return []
    count = struct.unpack_from("<I", data, 0)[0]
    names = []
    for k in range(count):
        o = 8 + 74 * k
        names.append(data[o + 1:o + 66].split(b"\0")[0].decode("latin1"))
    return names


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("archive")
    ap.add_argument("--noms", nargs="*", default=[])
    ap.add_argument("--extraire")
    args = ap.parse_args()
    known = set()
    for path in args.noms:
        if path.lower().endswith(".tre") or path.lower().endswith(".dat"):
            known |= set(old_tre_names(path))
        else:
            known |= set(line.strip() for line in open(path, encoding="latin1") if line.strip())
    folders = set(n.rsplit("\\", 1)[0] for n in known if "\\" in n)
    bases = set(n.rsplit("\\", 1)[-1] for n in known)
    candidates = set(known)
    for folder in folders:
        for base in bases:
            candidates.add(folder + "\\" + base)
    by_hash = {}
    for n in candidates:
        by_hash.setdefault(name_hash(n), n.upper())
    data = open(args.archive, "rb").read()
    files = read_xtre(data)
    named = 0
    for f in files:
        f["name"] = by_hash.get(f["hash"])
        if f["name"]:
            named += 1
        print("%08X  mode %d  %8d -> %8d  %s" % (f["hash"] if f["hash"] is not None else 0, f["mode"], f["stored"], f["size"],
                                                 f["name"] or "?"))
    print("%d fichiers, %d noms retrouvés" % (len(files), named), file=sys.stderr)
    if args.extraire:
        for f in files:
            raw = data[f["position"]:f["position"] + f["stored"]]
            if f["mode"] == 0:
                body = raw
                ext = ""
            elif f["mode"] == 2:
                body = lzw_decode(raw, f["size"])
                ext = ""
            else:
                body = lz_decode(raw, f["size"])
                ext = ""
            if f["name"]:
                rel = f["name"].replace("..\\", "").replace("\\", "/")
            elif f["hash"] is not None:
                rel = "INCONNU/%08X" % f["hash"]
            else:
                rel = "SANS_HACHAGE/%08X" % f["position"]
            path = os.path.normpath(os.path.join(args.extraire, rel + ext))
            if not path.startswith(os.path.abspath(args.extraire)) and not path.startswith(args.extraire):
                raise SystemExit("chemin refusé : " + path)
            os.makedirs(os.path.dirname(path), exist_ok=True)
            open(path, "wb").write(body)


if __name__ == "__main__":
    main()
