#!/usr/bin/env python3
"""
decode_prof.py — décode un fichier .IFF de profil pilote (chunk PROF)
et affiche sa structure complète, lisible.

Format confirmé par lecture du désassemblage (voir README.md, Découverte
majeure 14) ET validé empiriquement sur 4 fichiers réels du jeu
(BILLY.IFF, HAMMERA.IFF, GWEN.IFF, C-130.IFF — voir sample_prof_files/).

Format IFF standard : chaque chunk = tag ASCII 4 octets + longueur 4
octets (big-endian) + données (paddées à une longueur paire). FORM est un
chunk conteneur dont les 4 premiers octets de données sont un type,
suivi de sous-chunks.

Usage :
    python3 tools/decode_prof.py <fichier.iff>
    python3 tools/decode_prof.py analysis/sample_prof_files/BILLY.IFF
"""
import struct
import sys


def read_chunk_header(data, pos):
    tag = data[pos:pos + 4]
    length = struct.unpack('>I', data[pos + 4:pos + 8])[0]
    return tag, length, pos + 8


def read_cstring(data, pos):
    end = data.index(b'\x00', pos)
    return data[pos:end].decode('latin-1'), end + 1


def decode_radi(data, pos, end):
    print("  FORM RADI")
    while pos < end:
        tag, length, data_start = read_chunk_header(data, pos)
        content_end = data_start + length
        if tag == b'SPCH':
            val = data[data_start]
            print(f"    SPCH (1o) = 0x{val:02X} ({val})")
        elif tag == b'INFO':
            pid = struct.unpack('>H', data[data_start:data_start + 2])[0]
            name, p2 = read_cstring(data, data_start + 2)
            callsign, p3 = read_cstring(data, p2)
            print(f"    INFO : id=0x{pid:04X} ({pid}), nom=\"{name}\", indicatif=\"{callsign}\"")
        elif tag == b'OPTS':
            raw = data[data_start:content_end]
            letters = raw.decode('latin-1', 'replace')
            print(f"    OPTS ({length}o) : \"{letters}\" — questions/ordres radio disponibles "
                  f"(hex: {raw.hex(' ')})")
        elif tag == b'MSGS':
            print(f"    MSGS ({length}o) :")
            p = data_start
            while p < content_end:
                idx = data[p]
                msg, p = read_cstring(data, p + 1)
                print(f"      [0x{idx:02X}] {msg!r}")
        else:
            print(f"    {tag!r} ({length}o) — chunk inconnu, ignoré")
        pos = data_start + length
        if pos % 2:
            pos += 1  # padding IFF (chunks de longueur impaire)


def decode_ai(data, pos, end):
    print("  FORM _AI_")
    while pos < end:
        tag, length, data_start = read_chunk_header(data, pos)
        content_end = data_start + length
        if tag == b'AI\x00_':
            print(f"    \"AI\\0_\" marqueur ({length}o) — confirme un profil piloté par IA")
        elif tag == b'MVRS':
            n = length // 2
            print(f"    MVRS ({length}o, {n} entrées) :")
            for i in range(n):
                p = data_start + i * 2
                node_id = data[p]
                raw_val = data[p + 1]
                signed_val = raw_val - 256 if raw_val >= 128 else raw_val
                marker = "  <-- valeur non-nulle" if raw_val != 0 else ""
                print(f"      id=0x{node_id:02X} ({node_id:2d})  valeur=0x{raw_val:02X} "
                      f"(non signé={raw_val}, signé={signed_val}){marker}")
        elif tag == b'GOAL':
            raw = data[data_start:content_end]
            labels = {1: 'vide', 2: 'Goal_ExecuteAction (générique 0xA1-0xAC)',
                      3: 'Goal_WanderRandom', 4: 'AI_BehaviorStateMachine',
                      5: 'loc_878F (engagement, "coéquipier actif" ?)'}
            print(f"    GOAL ({length}o) : {list(raw)}")
            for i, b in enumerate(raw):
                print(f"      slot {i}: {b} -> {labels.get(b, 'inconnu')}")
        elif tag == b'ATRB':
            raw = data[data_start:content_end]
            print(f"    ATRB ({length}o, ordre fichier) : {list(raw)}")
            names = ['TH (Trigger Happy)', 'CN (Confidence)', 'VB (Verbosity)',
                     'LY (Loyalty)', 'FL (Flying)', 'AG (Air-to-Ground)',
                     'AA (Air-to-Air)', 'SM (Showmanship)', 'AR (Aggressiveness)']
            for i, b in enumerate(raw):
                label = names[i] if i < len(names) else '(sans nom, 10e octet)'
                print(f"      [{i}] {label} = {b}/16" if i < len(names) else f"      [{i}] {label} = {b}")
            zeros = sum(1 for b in raw if b == 0)
            print(f"      ({zeros}/{len(raw)} champs à zéro)")
        else:
            print(f"    {tag!r} ({length}o) — chunk inconnu, ignoré")
        pos = data_start + length
        if pos % 2:
            pos += 1


def main():
    if len(sys.argv) != 2:
        print(__doc__)
        sys.exit(1)

    data = open(sys.argv[1], 'rb').read()
    print(f"Fichier : {sys.argv[1]} ({len(data)} octets)\n")

    tag, length, pos = read_chunk_header(data, 0)
    if tag != b'FORM':
        print(f"ATTENTION : ne commence pas par FORM (trouvé {tag!r}) — format inattendu.")
        return
    form_type = data[pos:pos + 4]
    pos += 4
    print(f"FORM {form_type.decode('latin-1')} ({length} octets déclarés, "
          f"{len(data)} octets fichier)\n")

    end = 8 + length  # fin du FORM racine
    while pos < end:
        tag, sub_length, data_start = read_chunk_header(data, pos)
        content_end = data_start + sub_length
        if tag == b'VERS':
            ver = struct.unpack('>H', data[data_start:data_start + 2])[0]
            print(f"VERS ({sub_length}o) = {ver}")
        elif tag == b'FORM':
            inner_type = data[data_start:data_start + 4]
            inner_pos = data_start + 4
            inner_end = content_end
            if inner_type == b'RADI':
                decode_radi(data, inner_pos, inner_end)
            elif inner_type == b'_AI_':
                decode_ai(data, inner_pos, inner_end)
            else:
                print(f"FORM {inner_type!r} ({sub_length}o) — type inconnu, ignoré")
        else:
            print(f"{tag!r} ({sub_length}o) — chunk racine inconnu, ignoré")
        pos = data_start + sub_length
        if pos % 2:
            pos += 1


if __name__ == '__main__':
    main()
