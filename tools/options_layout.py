"""Inventaire des écrans du panneau CONFIGURATION (ALT+O) de STRIKE.EXE, lu dans les fichiers annotés.

Pour chaque écran (panneau principal et sous-écrans), relève dans le code de construction :
- les boutons (VROOMM_StubThunk_6C76C) : position, taille, paire d'images (normale, enfoncée) ;
- les jauges (VROOMM_StubThunk_6C9F0) : position, taille, valeur initiale ;
- les écritures d'images qui viennent d'un registre (choix d'image à l'exécution) : signalées « dynamique ».

Champs de la structure de bouton (décalages en décimal, relevés dans le code) :
- [di+28] et [di+46] (= 28h et 2Eh) : image normale et image enfoncée, avec valeur écrite en [di+44] ;
- [di+42] et [di+44] (= 2Ah et 2Ch) : image normale et image enfoncée, sans valeur ;
- argument de taille : mot bas = largeur, mot haut = hauteur ; argument de position : mot bas = x, mot haut = y.

Usage : python3 tools/options_layout.py [--json <fichier>] [--md <fichier>]
Lit analysis/annotated_segments/ ; écrit par défaut analysis/options_layout.json.
Voir analysis/OPTIONS_SCREEN.md.
"""
import glob
import json
import os
import re
import sys

ANN = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'analysis', 'annotated_segments')

SCREENS = [
    ('Options_ConfigurationScreen_90D20', 'CONFIGURATION (panneau principal)', 'MAINOPT'),
    ('Options_DetailScreen_91D29', 'DETAIL', 'DETLOPT'),
    ('Options_FlightScreen_90097', 'FLIGHT', 'FLITOPT'),
    ('Options_GameplayScreen_92E60', 'GAMEPLAY', 'GAMEOPT'),
    ('Options_CockpitScreen_93295', 'COCKPIT', 'COCKOPT'),
    ('Options_CamerasScreen_93BA5', 'CAMERAS', 'CAMROPT'),
    ('Options_AudioScreen_9416A', 'AUDIO', 'AUDIOPT'),
    ('Options_ExitGameScreen_9277C', 'EXIT GAME', 'RESTART'),
]

WIDGET_CALL = {
    'VROOMM_StubThunk_6C76C': 'bouton',
    'VROOMM_StubThunk_6C9F0': 'jauge',
}


def body(name):
    for path in sorted(glob.glob(os.path.join(ANN, '*_annotated.asm'))):
        with open(path, encoding='utf-8', errors='replace') as f:
            lines = f.read().split('\n')
        for i, line in enumerate(lines):
            if re.match(r'^' + name + r'\s+proc', line):
                out = []
                for line2 in lines[i:]:
                    out.append(line2)
                    if re.match(r'^' + name + r'\s+endp', line2):
                        break
                return out
    raise SystemExit('fonction introuvable : ' + name)


def value(text):
    text = text.strip()
    if text.endswith('h'):
        return int(text[:-1], 16)
    return int(text)


def split_size_pos(args):
    """args = [taille, position] ; renvoie (w, h), (x, y)."""
    size = value(args[0])
    pos = value(args[1])
    return ((size & 0xFFFF, size >> 16), (pos & 0xFFFF, pos >> 16))


def widgets(lines):
    out = []
    pushes = []
    current = None
    for i, line in enumerate(lines):
        if re.search(r'\bpush\b', line) and 'offset' not in line:
            m = re.search(r'push\s+(?:large\s+)?([0-9A-Fa-f]+h|\d+)\b', line)
            if m:
                pushes.append((i, m.group(1)))
        call = re.search(r'call\s+(?:near ptr\s+)?(VROOMM_StubThunk_6C76C|VROOMM_StubThunk_6C9F0)', line)
        if call:
            recent = [p for p in pushes if i - p[0] < 12]
            args = [v for _, v in recent]
            current = {'type': WIDGET_CALL[call.group(1)], 'ligne': i + 1, 'args': args[-3:], 'champs': {}}
            out.append(current)
            continue
        if current is None:
            continue
        for field in ('28h', '2Ah', '2Ch', '2Eh'):
            m = re.search(r'mov\s+(?:word ptr |byte ptr |dword ptr )?\[di\+' + field + r'\],\s*([0-9A-Fa-f]+h|\d+)\b', line)
            if m and field not in current['champs']:
                current['champs'][field] = m.group(1)
            m2 = re.search(r'mov\s+\[di\+' + field + r'\],\s*(ax|al|eax)\b', line)
            if m2:
                current.setdefault('registre', []).append(field)
    return out


def describe(widget):
    champs = widget['champs']
    res = {'type': widget['type'], 'ligne': widget['ligne']}
    if widget['type'] == 'bouton' and len(widget['args']) >= 2:
        (w, h), (x, y) = split_size_pos(widget['args'][-2:])
        res.update({'x': x, 'y': y, 'w': w, 'h': h})
    elif widget['type'] == 'jauge' and len(widget['args']) >= 2:
        (w, h), (x, y) = split_size_pos(widget['args'][-3:-1])
        res.update({'x': x, 'y': y, 'w': w, 'h': h, 'valeur_initiale': widget['args'][-1]})
    if widget['type'] == 'bouton':
        if '28h' in champs and '2Eh' in champs:
            # Variante « 28h / 2Eh » : [di+44] (2Ch) porte la valeur écrite au clic.
            res['image_normale'] = value(champs['28h'])
            res['image_enfoncee'] = value(champs['2Eh'])
            if '2Ch' in champs:
                res['valeur'] = value(champs['2Ch'])
        elif '2Ah' in champs and '2Ch' in champs:
            # Variante « 2Ah / 2Ch » : image normale et image enfoncée, sans valeur.
            res['image_normale'] = value(champs['2Ah'])
            res['image_enfoncee'] = value(champs['2Ch'])
        elif widget.get('registre'):
            res['image'] = 'dynamique (registre)'
        else:
            res['champs_bruts'] = champs
    return res


def main():
    args = sys.argv[1:]
    json_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'analysis', 'options_layout.json')
    if '--json' in args:
        json_path = args[args.index('--json') + 1]
    result = []
    for func, label, shp in SCREENS:
        lines = body(func)
        items = [describe(w) for w in widgets(lines)]
        result.append({'fonction': func, 'ecran': label, 'fichier_images': 'FONTS\\' + shp + '.SHP', 'widgets': items})
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(result, f, ensure_ascii=False, indent=2)
    for screen in result:
        print(screen['ecran'], len(screen['widgets']), 'widgets')
    print('écrit', json_path)


if __name__ == '__main__':
    main()
