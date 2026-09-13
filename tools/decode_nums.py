#!/usr/bin/env python3
"""
decode_nums.py — décode le fichier compagnon NUMS (FORM type "INTL",
chunks VERS+NUMS), distinct du format PROF.

Format confirmé par lecture de PilotProfile_LoadNUMSCompanionFile_73FB4
(voir known_functions.json et analysis/AI_SYSTEM.md §2) ET validé
empiriquement sur INTEL.IFF, le seul fichier réel du jeu connu à
contenir un chunk NUMS — probablement un fichier de CONSTANTES PARTAGÉES
chargé identiquement par tous les pilotes IA, pas une donnée par pilote
(à la différence de PROF).

Séquence exacte des 18 champs du chunk NUMS (65 octets, vérifiée
correspondre exactement à la longueur du chunk sur INTEL.IFF) :
    1 dword, 2 words, 13 dwords, 1 octet final (drapeau bit0)

Usage :
    python3 tools/decode_nums.py <fichier.iff>
    python3 tools/decode_nums.py analysis/sample_prof_files/INTEL.IFF
"""
import struct
import sys


FIELDS = [
    ("dword_72016 (global)", 4, 'd'),
    ("word_72014 (global)", 2, 'w'),
    ("word_7201A (global)", 2, 'w'),
    ("entité +0x14A — vecteur X", 4, 'd'),
    ("entité +0x14E — vecteur Y (altitude)", 4, 'd'),
    ("entité +0x152 — vecteur Z", 4, 'd'),
    ("entité +0x1A4", 4, 'd'),
    ("entité +0x1A8", 4, 'd'),
    ("entité +0x1AC", 4, 'd'),
    ("dword_7201C (global)", 4, 'd'),
    ("dword_72020 (global)", 4, 'd'),
    ("dword_72024 (global)", 4, 'd'),
    ("dword_72028 (global)", 4, 'd'),
    ("dword_7202C (global)", 4, 'd'),
    ("dword_72030 (global)", 4, 'd'),
    ("dword_72034 (global)", 4, 'd'),
    ("dword_6D184 (global)", 4, 'd'),
    ("octet final -> entité +0x28B bit0", 1, 'b'),
]


def read_chunk_header(data, pos):
    tag = data[pos:pos + 4]
    length = struct.unpack('>I', data[pos + 4:pos + 8])[0]
    return tag, length, pos + 8


def main():
    if len(sys.argv) != 2:
        print(__doc__)
        sys.exit(1)

    data = open(sys.argv[1], 'rb').read()
    print(f"Fichier : {sys.argv[1]} ({len(data)} octets)\n")

    tag, length, pos = read_chunk_header(data, 0)
    if tag != b'FORM':
        print(f"ATTENTION : ne commence pas par FORM (trouvé {tag!r})")
        return
    form_type = data[pos:pos + 4]
    pos += 4
    print(f"FORM {form_type.decode('latin-1')} ({length} octets déclarés, "
          f"{len(data)} octets fichier)")
    if form_type != b'INTL':
        print(f"ATTENTION : type de FORM inattendu (attendu INTL, trouvé "
              f"{form_type!r}) — ce n'est peut-être pas un fichier NUMS.\n")

    end = 8 + length
    nums_payload = None
    while pos < end:
        tag, sub_length, data_start = read_chunk_header(data, pos)
        content_end = data_start + sub_length
        if tag == b'VERS':
            ver = data[data_start] if sub_length == 1 else struct.unpack(
                '>H', data[data_start:data_start + 2])[0]
            print(f"VERS ({sub_length}o) = {ver}")
        elif tag == b'NUMS':
            nums_payload = data[data_start:content_end]
            print(f"NUMS ({sub_length}o) :")
        else:
            print(f"{tag!r} ({sub_length}o) — chunk inconnu, ignoré")
        pos = data_start + sub_length
        if pos % 2:
            pos += 1

    if nums_payload is None:
        print("\nAucun chunk NUMS trouvé dans ce fichier.")
        return

    print(f"  ({len(nums_payload)} octets bruts : {nums_payload.hex(' ')})\n")

    total_expected = sum(size for _, size, _ in FIELDS)
    if len(nums_payload) != total_expected:
        print(f"ATTENTION : longueur du chunk ({len(nums_payload)}o) différente "
              f"de la séquence de champs connue ({total_expected}o) — "
              f"le format peut varier selon la version, décodage possiblement "
              f"incorrect au-delà du premier écart.\n")

    p = 0
    for name, size, typ in FIELDS:
        if p + size > len(nums_payload):
            print(f"  {name:40s} — données insuffisantes, arrêt")
            break
        raw = nums_payload[p:p + size]
        if typ == 'd':
            val = struct.unpack('<i', raw)[0]
            print(f"  {name:40s} = {val:10d}  (24.8 fixe = {val/256:10.3f})")
        elif typ == 'w':
            val = struct.unpack('<h', raw)[0]
            print(f"  {name:40s} = {val:10d}  (24.8 fixe = {val/256:10.3f})")
        elif typ == 'b':
            print(f"  {name:40s} = 0x{raw[0]:02X}  (bit0 = {raw[0] & 1})")
        p += size

    if p < len(nums_payload):
        print(f"\n  {len(nums_payload) - p} octet(s) restant(s) non décodé(s) : "
              f"{nums_payload[p:].hex(' ')}")


if __name__ == '__main__':
    main()
