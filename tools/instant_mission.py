"""Mission d'entraînement (TRAINING MISSION) d'OPTEST.EXE : reproduit la construction d'INSTANT.IFF.

Code de référence lu dans OPTEST.EXE (analysis/TRAINING_MISSION.md) :
- Training_BuildInstantMission_58EEA : copie MISSIONS\\TEMPLATE.IFF chunk par chunk et ajoute les objets
  choisis (dogfight : une zone, les pilotes CAST, les avions PART, une scène SCNE ; les deux types : le
  joueur PART 0 replacé et un mot ajouté au chunk FLAG).
- table des 16 avions : DGROUP 2708 + 15 × n (nom, fichier objet, emport, deux dwords, drapeau).

Usage :
  python3 tools/instant_mission.py --donnees <DATA> --sortie INSTANT.IFF dogfight
          --groupe <nombre> <avion> [--groupe ...] --altitude <5000|15000|25000|35000> --niveau <rookie|veteran|ace>
  python3 tools/instant_mission.py --donnees <DATA> --sortie INSTANT.IFF search
  python3 tools/instant_mission.py --donnees <DATA> --liste-avions
  python3 tools/instant_mission.py --lire INSTANT.IFF      (contenu d'un fichier produit)

Les coordonnées écrites sont celles du jeu (Z-up, 24.8) ; --lire les affiche en mètres dans le repère de
libRealSpace (x = c0, y = c2, z = −c1).
"""
import os
import struct
import sys

# Table des avions de l'écran de choix (bouton n = entrée n), DGROUP 2708 + 15 × n :
# nom affiché, fichier objet (PART octets 2-9), emport (PART 18-25), deux dwords (rôle non établi),
# drapeau (1 : pilote CAST = niveau choisi, programme de mise à jour 1 ; 0 : « target », programme 2,
# vitesse 100 au lieu de 200).
AIRCRAFT = [
    ('F-15', 'f-15', 'f15loada', 29000, 11000, 1),
    ('F-16', 'f-16gray', 'f16loada', 34400, 11100, 1),
    ('F/A-18', 'f-18', 'f18loada', 33400, 9400, 1),
    ('C-130', 'c130des', '', 23400, 6900, 0),
    ('F-22', 'f-22', 'f22load', 46300, 15200, 1),
    ('YF-23', 'yf23', 'yf23load', 23400, 7800, 1),
    ('A-10', 'a-10', '', 31200, 10100, 1),
    ('E-3', 'awacs', '', 24500, 7200, 0),
    ('Tornado', 'torncg', 'tornload', 30700, 9400, 1),
    ('Mirage 2000', 'mirage', 'mirloada', 26000, 6500, 1),
    ('Lear Jet', 'learjet', '', 29500, 9000, 0),
    ('747', '747', '', 29400, 9100, 0),
    ('MiG-21', 'mig21', 'm21loada', 24100, 7000, 1),
    ('MiG-29', 'mig29', 'm29loada', 33500, 15300, 1),
    ('Su-27', 'su27', 'sumload', 29700, 12600, 1),
    ('TU-95', 'tu-20', 'tu20load', 26500, 8300, 0),
]
LEVELS = ['rookie', 'veteran', 'ace']
# Conversion des pieds affichés en unités du monde : dword_46456 = 839 / 256 (posé au démarrage, 22AA3).
FEET_PER_UNIT = 839


def chunks(data, start, end):
    """Liste des (tag, contenu, est_un_form, type_du_form) entre start et end."""
    out = []
    p = start
    while p + 8 <= end:
        tag = data[p:p + 4].decode('latin-1')
        n = struct.unpack('>I', data[p + 4:p + 8])[0]
        if tag == 'FORM':
            out.append((tag, data[p + 12:p + 8 + n], True, data[p + 8:p + 12].decode('latin-1')))
        else:
            out.append((tag, data[p + 8:p + 8 + n], False, None))
        p += 8 + n + (n & 1)
    return out


def chunk(tag, body):
    pad = b'\0' if len(body) & 1 else b''
    return tag.encode() + struct.pack('>I', len(body)) + body + pad


def form(kind, body):
    return b'FORM' + struct.pack('>I', len(body) + 4) + kind.encode() + body


def raw_chunk(entry):
    tag, body, is_form, kind = entry
    if is_form:
        return form(kind, body)
    return chunk(tag, body)


def pad8(text):
    return text.encode('latin-1')[:8].ljust(8, b'\0')


def altitude_units(feet):
    """PART : (pieds << 16) / 839 en 24.8 (idiv de Training_BuildInstantMission_58EEA)."""
    return (feet << 16) // FEET_PER_UNIT


def build(template, kind, groups, feet, level):
    """kind = 1 (DOGFIGHT) ou 2 (SEARCH AND DESTROY) ; groups = [(nombre, index avion 0-15)] (3 au plus)."""
    top = chunks(template, 0, len(template))
    assert top[0][0] == 'FORM' and top[0][3] == 'MISN'
    items = chunks(top[0][1], 0, len(top[0][1]))
    find = {}
    for it in items:
        key = it[3] if it[2] else it[0]
        find.setdefault(key, it)
    total = sum(n for n, _ in groups) if kind == 1 else 0
    out = b''
    # 1. chunks du modèle jusqu'à AREA (sub_3CBF6 : recopie jusqu'au tag donné)
    pos = 0
    while items[pos][0] != 'AREA':
        out += raw_chunk(items[pos])
        pos += 1
    # 2. AREA : zones du modèle, + zone sphérique « Destroy bogeys » (dogfight)
    area = find['AREA'][1]
    area_count = len(area) // 49
    if kind == 1:
        rec = b'S' + b'Destroy bogeys'.ljust(32, b'\0')
        rec += struct.pack('<iiii', -66000 * 256, 128000 * 256, feet << 8, 45000 * 256)
        area += rec
    out += chunk('AREA', area)
    pos += 1
    # 3. jusqu'à FLAG, puis FLAG : drapeaux du modèle + un mot = nombre total d'avions ([réglages+20])
    while items[pos][0] != 'FLAG':
        out += raw_chunk(items[pos])
        pos += 1
    out += chunk('FLAG', find['FLAG'][1] + struct.pack('<H', total))
    # 4. CAST : noms du modèle + un nom de 9 octets par avion (niveau ou « target »)
    cast = find['CAST'][1]
    cast_count = len(cast) // 9
    if kind == 1:
        for count, plane in groups:
            name = LEVELS[level] if AIRCRAFT[plane][5] else 'target'
            for _ in range(count):
                cast += name.encode().ljust(9, b'\0')
    out += chunk('CAST', cast)
    # 5. PART : 1er objet du modèle (le joueur) replacé, les autres recopiés, puis les avions (dogfight)
    part = bytearray(find['PART'][1])
    part_count = len(part) // 62
    struct.pack_into('<iii', part, 29, -73000 * 256, 128000 * 256, altitude_units(feet))
    struct.pack_into('<h', part, 41, 90)
    if kind == 1:
        cast_index = cast_count
        c0 = -59000 * 256
        c1 = 128000 * 256
        for count, plane in groups:
            name, obj, load, _, _, armed = AIRCRAFT[plane]
            for _ in range(count):
                rec = bytearray(62)
                struct.pack_into('<H', rec, 0, cast_index)
                rec[2:10] = pad8(obj)
                rec[18:26] = pad8(load)
                struct.pack_into('<H', rec, 26, 65535)
                rec[28] = 0
                struct.pack_into('<iii', rec, 29, c0, c1, altitude_units(feet))
                struct.pack_into('<hh', rec, 41, 270, 200 if armed else 100)
                rec[45] = 255
                rec[46] = 255
                rec[47] = 255
                struct.pack_into('<4H', rec, 54, 65535, 1 if armed else 2, 3, 65535)
                part += rec
                cast_index += 1
                c1 += 300 * 256
            c0 += 500 * 256
    out += chunk('PART', bytes(part))
    # 6. PROG et TEAM recopiés, FORM PLAY recopiée (+ une scène SCNE en dogfight), LOAD recopié
    out += chunk('PROG', find['PROG'][1])
    out += chunk('TEAM', find['TEAM'][1])
    play = find['PLAY'][1]
    if kind == 1:
        scne = bytearray(24)
        scne[0] = 1
        struct.pack_into('<4H', scne, 1, area_count, 65535, 65535, 65535)
        for k in range(total):
            scne += struct.pack('<H', part_count + k)
        play += chunk('SCNE', bytes(scne))
    out += form('PLAY', play)
    out += chunk('LOAD', find['LOAD'][1])
    return form('MISN', out)


def show(data):
    top = chunks(data, 0, len(data))
    items = chunks(top[0][1], 0, len(top[0][1]))
    for tag, body, is_form, kind in items:
        if is_form:
            subs = chunks(body, 0, len(body))
            print('FORM', kind, len(subs), 'chunks')
            continue
        print(tag, len(body), 'octets')
        if tag == 'AREA':
            for i in range(0, len(body), 49):
                r = body[i:i + 49]
                c = struct.unpack_from('<4i', r, 33)
                name = r[1:33].split(b'\0')[0].decode('latin-1')
                print(f'  zone {i // 49} {chr(r[0])} {name} : x {c[0] / 256:g} y {c[2] / 256:g} z {-c[1] / 256:g} taille {c[3] / 256:g}')
        if tag == 'CAST':
            print('  ', [body[i:i + 9].split(b'\0')[0].decode() for i in range(0, len(body), 9)])
        if tag == 'FLAG':
            print('  ', list(struct.unpack(f'<{len(body) // 2}H', body)))
        if tag == 'PART':
            for i in range(0, len(body), 62):
                r = body[i:i + 62]
                c = struct.unpack_from('<3i', r, 29)
                head, speed = struct.unpack_from('<hh', r, 41)
                obj = r[2:10].split(b'\0')[0].decode('latin-1')
                print(f'  objet {i // 62} {obj} : x {c[0] / 256:g} y {c[2] / 256:g} z {-c[1] / 256:g} cap {head} vitesse {speed} camp {r[45]} scripts {struct.unpack_from("<4H", r, 54)}')


def main():
    args = sys.argv[1:]
    if '--lire' in args:
        show(open(args[args.index('--lire') + 1], 'rb').read())
        return
    if '--liste-avions' in args:
        for k, a in enumerate(AIRCRAFT):
            print(k + 1, a)
        return
    data_dir = args[args.index('--donnees') + 1]
    sortie = args[args.index('--sortie') + 1]
    template = open(os.path.join(data_dir, 'MISSIONS', 'TEMPLATE.IFF'), 'rb').read()
    kind = 1 if 'dogfight' in args else 2
    groups = []
    for i, a in enumerate(args):
        if a == '--groupe':
            count = int(args[i + 1])
            name = args[i + 2]
            plane = next(k for k, x in enumerate(AIRCRAFT) if x[0].lower() == name.lower() or x[1] == name.lower())
            groups.append((count, plane))
    feet = int(args[args.index('--altitude') + 1]) if '--altitude' in args else 5000
    level = LEVELS.index(args[args.index('--niveau') + 1]) if '--niveau' in args else 0
    if kind == 1 and not 1 <= len(groups) <= 3:
        raise SystemExit('dogfight : 1 à 3 groupes')
    out = build(template, kind, groups, feet, level)
    open(sortie, 'wb').write(out)
    print('écrit', sortie, len(out), 'octets')
    show(out)


if __name__ == '__main__':
    main()
