#!/usr/bin/env python3
"""Fabrique un fichier ANIM (format version 2 de SCAnimationArchive, libRealSpace) à partir du JSON
produit par tools/midgame_extract.py.

L'outil rejoue l'arbre de la cinématique avec les règles du moteur de scène d'OPTEST (types de
calques, avance d'une image, lèvres, transition, tremblement) et enregistre chaque image : position et
image de chaque calque. Les boucles qui attendent la fin d'une réplique ou d'une animation deviennent
la condition de fin d'un plan.

    python3 tools/midgame_iff.py MIDn.json SORTIE.IFF [--remplace ancien=nouveau] [--hypothèse nom=valeur]

--remplace : nom de visage ou de chaîne à remplacer (valeur d'un exécutable modifié, ex. pri=air).
--hypothèse : valeur d'une variable du jeu (matériel, fichiers présents) ; voir HYPOTHESES.
"""
import json
import os
import random
import re
import struct
import sys

# Matériel supposé : voix numérisée présente, carte Roland ; Échap jamais pressée.
HYPOTHESES = {
    'word_4684B': 1,
    'byte_46848': 1,
    'byte_495FC': 0,
}
# Résultats d'appels non simulés.
CALL_RESULTS = {
    'sub_6734': 1,
    'touche_passer': 0,
}
MAX_OPEN_FRAMES = 600
DIRECT_FPS = 60

DIRS = {'opt': 'GAMEFLOW', 'mid': 'MIDGAMES', 'amu': 'MIDGAMES', 'rmu': 'MIDGAMES'}
NO_IMAGE = 255
FACE_ANCHOR = (160, 128)
# Les calques et les dessins hors écran sont faits dans une image de 320 × 200 dont la ligne 0 est
# recopiée à la ligne 24 de l'écran (Rect_BlitOverlapRegion_31FCA : source à partir de sa ligne du
# haut, 0, destination à partir de la sienne, 24). Les positions écrites sont des positions d'écran.
BAND_TOP = 24


def screen_offsets(data):
    # Surfaces écran : celles qui reçoivent la copie de l'image hors écran (destination de « présente »).
    found = set()

    def walk(v):
        if isinstance(v, dict):
            if v.get('op') == 'présente':
                for a in v.get('arguments', []):
                    if a.startswith('destination='):
                        o = data['objets'].get(a.split('=', 1)[1])
                        if o:
                            found.add(o.get('décalage'))
            for x in v.values():
                walk(x)
        elif isinstance(v, list):
            for x in v:
                walk(x)
    walk(data)
    return found


def archive_path(pak):
    name = pak.upper()
    folder = 'GAMEFLOW' if name.startswith('OPT') else 'MIDGAMES'
    return f'..\\..\\DATA\\{folder}\\{name}.PAK'


class Open(Exception):
    pass


class Marker:
    def __init__(self, kind, layer=None):
        self.kind = kind
        self.layer = layer


class Layer:
    def __init__(self, name, kind, res, x, y, image):
        self.name = name
        self.type = kind
        self.res = res
        self.x = x
        self.y = y
        self.image = image
        self.vx = 0
        self.vy = 0
        self.mode = 0
        self.lecture = 0
        self.sens = 0
        self.clip = None
        self.children = []
        self.forced = False
        self.base = -1
        self.shown = -1
        self.mouth = -1
        self.lips = ''
        self.cursor = 0
        self.blink = True
        self.jx = 0
        self.jy = 0


class Scene:
    def __init__(self, name, fps):
        self.name = name
        self.fps = fps
        self.counter = 0
        self.x = 0
        self.y = 0
        self.children = []
        self.terminated = 0


class Player:
    def __init__(self, data, replace, hypotheses):
        self.data = data
        self.objects = data['objets']
        self.tables = {t['nom']: t['mots'] for t in data.get('tableaux', [])}
        self.stack_tables = {}
        self.contents = {}
        self.replace = replace
        self.env = dict(HYPOTHESES)
        self.env.update(hypotheses)
        self.layers = {}
        self.scenes = {}
        self.voice_res = None
        self.channels = {}
        self.pending_pal = []
        self.pending = {'palettes': [], 'clear': False, 'fade': 0, 'music': None, 'sounds': []}
        self.shots = []
        self.shot = None
        self.force_new = False
        self.direct_items = []
        self.last_frame = []
        self.full_screen = False
        self.text_keys = {}
        self.form = None
        self.chunk_count = {}
        self.open_marker = None
        self.warnings = []
        # Facultatif, quand les données du jeu sont disponibles : nombre d'images d'une ressource
        # (Struct_GetElementCountMinusOne_33352) et durée d'une réplique en secondes. Sans elles,
        # les boucles qui attendent une fin sont simulées sur MAX_OPEN_FRAMES images.
        self.image_count = None
        self.voice_seconds = None
        self.clock = 0.0
        self.voice_end = 0.0
        self.screen_offsets = screen_offsets(data)

    # ------------------------------------------------------------------ valeurs
    def content(self, objname):
        o = self.objects.get(objname)
        if o is None:
            return None
        text = self.contents.get(objname, o.get('contenu'))
        if text:
            for old, new in self.replace.items():
                text = text.replace(f'"{old}"', f'"{new}"')
        return text

    def resource(self, v):
        if isinstance(v, dict) and 'objet' in v:
            return self.res_of_text(self.content(v['objet']))
        if isinstance(v, dict) and 'données' in v:
            inner = v['données']
            if isinstance(inner, dict) and 'champ' in inner:
                return self.res_of_text(self.content(inner['champ'][0]))
        return None

    def res_of_text(self, text):
        if not text:
            return None
        m = re.match(r'^convdata type 0 "(.*)"$', text)
        if m:
            return ('face', m.group(1))
        m = re.match(r'^(\w+) (\d+)$', text)
        if m:
            return ('pak', m.group(1), int(m.group(2)))
        return None

    def ev(self, v):
        if v is None:
            return None
        if isinstance(v, (int, float)):
            return int(v)
        if isinstance(v, str):
            return v
        if 'objet' in v:
            return ('obj', v['objet'])
        if 'local' in v:
            if v['local'] not in self.env:
                self.warn(f'variable {v["local"]} sans valeur, prise à 0')
                return 0
            return self.env[v['local']]
        if 'glob' in v:
            name = v['glob']
            if name in self.env:
                return self.env[name]
            return v.get('init')
        if 'champ' in v:
            return self.get_field(v['champ'][0], v['champ'][1])
        if 'chaîne' in v:
            return ('str', v['chaîne'])
        if 'adresse' in v:
            m = re.match(r'^v(\d+)$', v['adresse'])
            return ('addr', -int(m.group(1))) if m else None
        if 'déréf' in v:
            base = self.ev(v['déréf'])
            if isinstance(base, tuple) and base[0] == 'addr':
                return self.read_stack(base[1] + v['décalage'])
            return None
        if 'tab' in v:
            index = self.ev(v['index'])
            words = self.tables.get(v['tab'])
            if words is None or not isinstance(index, int):
                return None
            return words[index] if 0 <= index < len(words) else None
        if 'op' in v:
            a = self.ev(v['a'])
            b = self.ev(v['b'])
            op = v['op']
            if op == '+' and isinstance(a, tuple) and a[0] == 'addr' and isinstance(b, int):
                return ('addr', a[1] + b)
            if op == '+' and isinstance(b, tuple) and b[0] == 'addr' and isinstance(a, int):
                return ('addr', b[1] + a)
            if not isinstance(a, int) or not isinstance(b, int):
                return None
            if op == '+':
                return a + b
            if op == '-':
                return a - b
            if op == '*':
                return a * b
            if op == '/':
                return int(a / b) if b else None
            if op == '&':
                return a & b
            if op == '|':
                return a | b
            return None
        if 'neg' in v:
            a = self.ev(v['neg'])
            return -a if isinstance(a, int) else None
        if 'résultat' in v:
            return self.call_result(v['résultat'])
        return None

    def read_stack(self, offset):
        for start, words in self.stack_tables.items():
            if start <= offset < start + 2 * len(words):
                return words[(offset - start) // 2]
        self.warn(f'lecture de pile sans tableau : {offset}')
        return None

    def call_result(self, text):
        m = re.match(r'^animation_finie\(calque=(\w+)\)$', text)
        if m:
            n = self.count_of(self.layers[m.group(1)]) if m.group(1) in self.layers else None
            if n is not None:
                # AnimLayer_IsFinished_2E654 : image courante == nombre d'images.
                return 1 if self.layers[m.group(1)].image == n else 0
            return Marker('animation', m.group(1))
        if re.match(r'^(voix\d+\.finie\(\)|voix_finie .*)$', text):
            if self.voice_seconds:
                return 1 if self.clock >= self.voice_end else 0
            return Marker('voix')
        m = re.match(r'^(\w+)\.y_absolu\(\)$', text)
        if m and m.group(1) in self.layers:
            return self.absolute(self.layers[m.group(1)])[1]
        m = re.match(r'^(\w+)\.x_absolu\(\)$', text)
        if m and m.group(1) in self.layers:
            return self.absolute(self.layers[m.group(1)])[0]
        name = re.match(r'^([\w ]+?)\s*\(', text)
        if name and name.group(1).strip() in CALL_RESULTS:
            return CALL_RESULTS[name.group(1).strip()]
        self.warn(f'résultat d\'appel inconnu : {text}')
        return None

    def get_field(self, obj, field):
        if obj in self.layers:
            layer = self.layers[obj]
            return {'x': layer.x, 'y': layer.y, 'image': layer.image, 'vx': layer.vx, 'vy': layer.vy,
                    'mode': layer.mode, 'lecture': layer.lecture, 'sens': layer.sens}.get(field)
        if obj in self.scenes:
            scene = self.scenes[obj]
            return {'compteur': scene.counter, 'terminée': scene.terminated, 'x': scene.x, 'y': scene.y}.get(field)
        o = self.objects.get(obj)
        if o and o['genre'] == 'channel' and field == '+0':
            return 1 if obj in self.channels else 0
        return None

    def set_field(self, obj, field, value):
        if obj in self.layers:
            layer = self.layers[obj]
            if field in ('x', 'y', 'vx', 'vy', 'mode', 'lecture', 'sens'):
                setattr(layer, field, value)
            elif field == 'image':
                if layer.type in ANIMATED and value != layer.image:
                    layer.forced = True
                layer.image = value
            elif field.startswith('découpe_'):
                rect = list(layer.clip or (0, 0, 0, 0))
                rect[['découpe_gauche', 'découpe_haut', 'découpe_droite', 'découpe_bas'].index(field)] = value
                layer.clip = tuple(rect)
            return
        if obj in self.scenes:
            scene = self.scenes[obj]
            if field == 'compteur':
                scene.counter = value
            elif field == 'terminée':
                scene.terminated = value
            elif field in ('x', 'y'):
                setattr(scene, field, value)
            return
        o = self.objects.get(obj)
        if o and o['genre'] == 'surface' and field in ('gauche', 'haut', 'droite', 'bas'):
            self.env[f'{obj}.{field}'] = value

    def cond(self, c):
        if 'cmp' in c:
            a = self.ev(c['a'])
            b = self.ev(c['b'])
            for side in (a, b):
                if isinstance(side, Marker):
                    self.open_marker = side
                    return None
            if not isinstance(a, int) or not isinstance(b, int):
                return None
            return {'==': a == b, '!=': a != b, '<': a < b, '<=': a <= b, '>': a > b, '>=': a >= b}[c['cmp']]
        if 'non' in c:
            r = self.cond(c['non'])
            return None if r is None else not r
        if 'et' in c:
            rs = [self.cond(x) for x in c['et']]
            if False in rs:
                return False
            return None if None in rs else True
        if 'ou' in c:
            rs = [self.cond(x) for x in c['ou']]
            if True in rs:
                return True
            return None if None in rs else False
        if 'true' in c:
            return True
        if 'false' in c:
            return False
        return None

    def warn(self, text):
        if text not in self.warnings:
            self.warnings.append(text)

    # ------------------------------------------------------------------ exécution
    def run(self, nodes, start=0):
        i = start
        while i < len(nodes):
            r = self.exec_node(nodes[i])
            if r == 'return':
                return 'return'
            while isinstance(r, tuple):
                j = self.locate(nodes, r[1])
                if j is None:
                    return r
                if nodes[j]['t'] == 'label':
                    i = j
                    r = None
                    break
                r = self.resume(nodes[j], r[1])
                if r == 'return':
                    return 'return'
                i = j
            i += 1
        return None

    def contains(self, nodes, label):
        for n in nodes:
            if n['t'] == 'label' and n['nom'] == label:
                return True
            if n['t'] == 'si' and (self.contains(n['alors'], label) or self.contains(n['sinon'], label)):
                return True
        return False

    def locate(self, nodes, label):
        for j, n in enumerate(nodes):
            if n['t'] == 'label' and n['nom'] == label:
                return j
            if n['t'] == 'si' and (self.contains(n['alors'], label) or self.contains(n['sinon'], label)):
                return j
        return None

    def resume(self, node, label):
        branch = node['alors'] if self.contains(node['alors'], label) else node['sinon']
        j = self.locate(branch, label)
        if branch[j]['t'] == 'label':
            return self.run(branch, j + 1)
        r = self.resume(branch[j], label)
        if r == 'return' or isinstance(r, tuple):
            return r
        return self.run(branch, j + 1)

    def exec_node(self, n):
        t = n['t']
        if t == 'si':
            r = self.cond(n['cond'])
            if r is None:
                raise RuntimeError(f'condition indécidable ligne {n["ligne"]} : {json.dumps(n["cond"], ensure_ascii=False)}')
            return self.run(n['alors'] if r else n['sinon'])
        if t in ('tant_que', 'répéter'):
            return self.loop(n)
        if t == 'affecte':
            value = self.ev(n['valeur'])
            target = n['cible']
            if 'local' in target:
                self.env[target['local']] = value
            elif 'glob' in target:
                self.env[target['glob']] = value
            elif 'champ' in target:
                self.set_field(target['champ'][0], target['champ'][1], value)
            return None
        if t == 'scène':
            self.scenes[n['nom']] = Scene(n['nom'], int(n['cadence']))
            return None
        if t == 'calque':
            self.make_layer(n)
            return None
        if t == 'ajoute':
            child = self.layers.get(n['calque'])
            if child is None:
                return None
            parent = self.scenes.get(n['parent']) or self.layers.get(n['parent'])
            if parent is not None and child not in parent.children:
                parent.children.append(child)
            return None
        if t == 'op':
            return self.op(n['op'], n['args'], n)
        if t == 'appel':
            return self.call(n['nom'], n['args'], n)
        if t == 'tableau':
            self.tables[n['nom']] = n['mots']
            if n.get('décalage') is not None:
                self.stack_tables[n['décalage']] = n['mots']
            return None
        if t == 'suite':
            part = next(p for p in self.data['parties'] if p['fonction'] == n['fonction'])
            self.run(part['arbre'])
            return None
        if t == 'saut_si':
            r = self.cond(n['cond'])
            if r is None:
                raise RuntimeError(f'saut indécidable ligne {n["ligne"]} : {json.dumps(n["cond"], ensure_ascii=False)}')
            return ('goto', n['cible']) if r else None
        if t == 'saut':
            return ('goto', n['cible'])
        if t == 'retour':
            return 'return'
        return None

    def loop(self, n):
        count = 0
        do_first = n['t'] == 'répéter'
        opened = None
        while True:
            if not do_first:
                self.open_marker = None
                r = self.cond(n['cond'])
                if r is None and self.open_marker is not None and opened is None:
                    opened = self.open_marker
                    self.force_new = True
                    self.open_start = None
                if r is False:
                    break
                if r is None and self.open_marker is None:
                    raise RuntimeError(f'boucle indécidable ligne {n["ligne"]} : {json.dumps(n["cond"], ensure_ascii=False)}')
                if r is None and count >= MAX_OPEN_FRAMES:
                    break
            do_first = False
            r = self.run(n['corps'])
            if r == 'return' or isinstance(r, tuple):
                return r
            count += 1
            if count > 20000:
                raise RuntimeError(f'boucle sans fin ligne {n["ligne"]}')
        if opened is not None and self.shot is not None:
            self.shot['end'] = ('voix',) if opened.kind == 'voix' else ('animation', opened.layer)
            self.force_new = True
        return None

    def make_layer(self, n):
        args = n['args']
        kind = n['type']
        res = self.resource(args.get('ressource'))
        image = self.ev(args.get('image'))
        if kind in ('AnimLayer', 'LoopAnimLayer', 'Layer', 'ClippedMovingLayer', 'MovingLayer') and image is None:
            image = 0
        if kind == 'OverlayAnimLayer':
            image = 1
        layer = Layer(n['nom'], kind, res, self.ev(args.get('x')) or 0, self.ev(args.get('y')) or 0, image)
        if kind == 'ToggleLayer':
            layer.sens = self.ev(args.get('sens')) or 0
            layer.image = 0 if layer.sens else 13
        if kind in ('TalkingHead', 'TalkingHeadOverlay'):
            layer.image = None
        self.layers[n['nom']] = layer

    # ------------------------------------------------------------------ opérations
    def op(self, name, args, n):
        target = args.get('ressource') if isinstance(args.get('ressource'), dict) else None
        if name == 'charge' and target and 'objet' in target:
            self.contents[target['objet']] = f'{args["pak"]} {self.ev(args["entrée"])}'
        elif name == 'charge_convdata_type0' and target and 'objet' in target:
            self.contents[target['objet']] = f'convdata type 0 "{args["nom"]}"'
        elif name == 'charge_convdata_type2' and target and 'objet' in target:
            self.contents[target['objet']] = f'convdata type 2 "{args["nom"]}"'
        elif name == 'palette_depuis':
            pal = args['palette']['objet']
            src = args.get('ressource')
            if isinstance(src, dict) and 'objet' in src:
                self.contents[pal] = self.content(src['objet'])
        if name == 'Scene_Tick':
            self.tick(self.scenes[args['scène']['objet']])
        elif name == 'Scene_SetFps':
            self.scenes[args['scène']['objet']].fps = self.ev(args['cadence'])
        elif name == 'Scene_Destruct':
            self.force_new = True
        elif name == 'retire':
            parent = self.scenes.get(args['parent']['objet']) or self.layers.get(args['parent']['objet'])
            child = self.layers.get(args['calque']['objet'])
            if parent is not None and child in parent.children:
                parent.children.remove(child)
        elif name == 'palette_copie':
            if args.get('destination', {}).get('objet') == 'pal1':
                self.pending_pal.append(self.palette_ref(args['source']['objet']))
        elif name == 'palette_envoie':
            pal = args['palette']['objet']
            if pal == 'pal1':
                self.pending['palettes'] += self.pending_pal
            else:
                self.pending['palettes'].append(self.palette_ref(pal))
            self.pending_pal = []
        elif name == 'palette_remplit':
            self.pending['clear'] = True
            self.pending['palettes'] = []
            self.pending_pal = []
        elif name == 'fondu_apparition':
            self.pending['palettes'] += self.pending_pal
            self.pending_pal = []
            self.pending['fade'] = self.ev(args.get('pas')) or 1
            self.last_frame = list(self.direct_items)
            self.direct_items = []
            self.record('direct', DIRECT_FPS, self.last_frame)
            self.force_new = True
        elif name == 'fondu_disparition':
            self.warn('fondu de disparition non exprimé dans le format')
        elif name == 'tête_image_de_base':
            layer = self.layers[args['tête']['objet']]
            layer.base = self.ev(args['image'])
            layer.shown = layer.base
        elif name == 'tête_texte_de_lèvres':
            layer = self.layers[args['tête']['objet']]
            text = self.ev(args['texte'])
            layer.lips = (text[1] if isinstance(text, tuple) else '').lower()
            layer.cursor = 0
        elif name.startswith('voix_charge'):
            self.voice_res = self.resource(args['ressource'])
        elif name.startswith('voix_joue'):
            self.play_voice()
        elif name == 'canal_enregistre':
            self.channels[args['canal']['objet']] = self.resource(args['ressource'])
        elif name == 'AIL_start_sequence':
            channel = self.channel_of(args['pilote'])
            res = self.channels.get(channel)
            if res and res[1] in ('amusic', 'rmusic'):
                self.pending['music'] = res[2]
        elif name == 'AIL_stop_sequence':
            channel = self.channel_of(args['pilote'])
            res = self.channels.get(channel)
            if res and res[1] in ('amusic', 'rmusic'):
                self.pending['music'] = 254
        elif name == 'dessine_image':
            res = self.resource(args['données'])
            dy = self.surface_dy(args['surface'])
            it = self.item(f'img{len(self.direct_items)}', res, self.ev(args['image']), self.ev(args['x']),
                           self.ev(args['y']) + dy)
            it['dy'] = dy
            self.direct_items.append(it)
        elif name == 'texte_formaté':
            key, index = self.text_ref(args['c'])
            self.direct_items.append({'key': f'txt{len(self.direct_items)}', 'kind': 'text', 'text': (key, index),
                                      'y': self.ev(args['b']) + BAND_TOP, 'dy': BAND_TOP,
                                      'align': self.ev(args['a']), 'step': self.env.get('si')})
        elif name == 'présente':
            self.last_frame = list(self.direct_items)
            self.direct_items = []
        elif name == 'attend':
            chrono = self.objects[args['chronomètre']['objet']]
            duration = self.env.get(f'v{-(chrono["décalage"] + 4)}')
            if not isinstance(duration, int):
                raise RuntimeError(f'durée d\'attente inconnue ligne {n["ligne"]}')
            frozen = [dict(it, frozen=True) for it in self.last_frame]
            for _ in range(duration):
                self.record('direct', DIRECT_FPS, frozen)
        elif name == 'iff_form':
            balise = n['texte'][1].split("'")[1] if "'" in n['texte'][1] else None
            if balise and balise not in ('DATA',):
                self.form = balise
                self.chunk_count.setdefault(balise, 0)
        elif name == 'iff_chunk':
            if "'TEXT'" in n['texte'][1] and self.form:
                self.chunk_count[self.form] += 1
        elif name == 'iff_lit':
            array, index = self.array_element(args['destination'])
            if array and self.form:
                self.text_keys[(array, index)] = (self.form, self.chunk_count[self.form] - 1)
        return None

    def call(self, name, args, n):
        if name.endswith('.joue'):
            self.play_voice()
        elif name.startswith('UI_ApplyEncodingHelper_2EC65'):
            if not self.full_screen:
                self.full_screen = True
                # Ouverture du cadre : source et destination ont la même ligne du haut, pas de décalage.
                self.last_frame = [dict(it, y=it['y'] - it.get('dy', 0), dy=0) for it in self.direct_items]
                self.direct_items = []
                self.record('direct', DIRECT_FPS, self.last_frame)
        return None

    def play_voice(self):
        if self.voice_res is not None:
            self.pending['sounds'].append(self.voice_res[2])
            if self.voice_seconds:
                self.voice_end = self.clock + self.voice_seconds(self.voice_res)

    def count_of(self, layer):
        if self.image_count is None or layer.res is None:
            return None
        return self.image_count(layer.res)

    def channel_of(self, v):
        text = json.dumps(v, ensure_ascii=False)
        m = re.search(r'"(canal\d+)"', text)
        return m.group(1) if m else None

    def palette_ref(self, palname):
        text = self.content(palname)
        m = re.match(r'^convdata type 2 "(.*)"$', text or '')
        if m:
            return (f'FACEPAL:{m.group(1)}', 0)
        res = self.res_of_text(text)
        if res is None:
            self.warn(f'palette inconnue : {palname}')
            return None
        return (archive_path(res[1]), res[2])

    def array_element(self, v):
        text = json.dumps(v, ensure_ascii=False)
        m = re.search(r'"champ": \["(textes\d+)"', text)
        if not m:
            return None, None
        loc = re.search(r'"local": "(\w+)"', text)
        index = self.env.get(loc.group(1)) if loc else 0
        return m.group(1), index

    def text_ref(self, v):
        array, index = self.array_element(v)
        return self.text_keys.get((array, index), (None, None))

    # ------------------------------------------------------------------ moteur de scène
    def absolute(self, target):
        def walk(parent, x, y):
            for c in parent.children:
                if c is target:
                    return x + c.x + c.jx, y + c.y + c.jy
                r = walk(c, x + c.x + c.jx, y + c.y + c.jy)
                if r:
                    return r
            return None
        for scene in self.scenes.values():
            r = walk(scene, scene.x, scene.y)
            if r:
                return r
        return (target.x, target.y)

    def surface_dy(self, v):
        text = json.dumps(v, ensure_ascii=False)
        m = re.search(r'"objet": "(\w+)"', text)
        o = self.objects.get(m.group(1)) if m else None
        if o and o.get('décalage') in self.screen_offsets:
            return 0
        return BAND_TOP

    def item(self, key, res, image, x, y, clip=None, auto=False, loop=False, endrel=0):
        return {'key': key, 'kind': 'image', 'res': res, 'image': image, 'x': x, 'y': y, 'clip': clip,
                'auto': auto, 'loop': loop, 'endrel': endrel}

    def layer_items(self, layer, x, y, out):
        ax = x + layer.x + layer.jx
        ay = y + layer.y + layer.jy
        t = layer.type
        n = layer.name
        if t == 'AnimLayer':
            out.append(self.item(n, layer.res, layer.image, ax, ay, auto=not layer.forced))
        elif t == 'LoopAnimLayer':
            out.append(self.item(n, layer.res, layer.image, ax, ay, auto=not layer.forced, loop=layer.mode == 0,
                                 endrel=-1))
        elif t == 'OverlayImageLayer':
            out.append(self.item(n + ':fond', layer.res, 0, ax, ay))
            out.append(self.item(n, layer.res, layer.image, ax, ay))
        elif t == 'OverlayAnimLayer':
            out.append(self.item(n + ':fond', layer.res, 0, ax, ay))
            out.append(self.item(n, layer.res, layer.image, ax, ay, auto=not layer.forced, endrel=-1))
        elif t == 'TriggeredAnimLayer':
            out.append(self.item(n, layer.res, layer.image, ax, ay, auto=bool(layer.lecture) and not layer.forced,
                                 endrel=-1))
        elif t == 'ToggleLayer':
            s = layer.image
            under = 0 if s < 4 else (13 if s > 8 else None)
            out.append(self.item(n + ':fond', layer.res, under, ax, ay))
            out.append(self.item(n, layer.res, 1 if s == 12 else s, ax, ay))
            return
        elif t in ('TalkingHead', 'TalkingHeadOverlay'):
            out.append(self.item(n + ':tête', layer.res, 0, ax, ay))
            out.append(self.item(n + ':base', layer.res, layer.shown if layer.shown >= 0 else None, ax, ay))
            out.append(self.item(n + ':bouche', layer.res, layer.mouth if layer.mouth >= 0 else None, ax, ay))
            for c in layer.children:
                self.layer_items(c, ax, ay, out)
            if t == 'TalkingHeadOverlay':
                out.append(self.item(n + ':35', layer.res, 35, ax, ay))
                out.append(self.item(n + ':38', layer.res, 38, ax, ay))
            return
        elif t in ('ClippedMovingLayer', 'ClippedMovingImageLayer'):
            img = layer.image if layer.image is not None and layer.image >= 0 else None
            clip = layer.clip
            if clip:
                clip = (clip[0], clip[1] + BAND_TOP, clip[2], clip[3] + BAND_TOP)
            out.append(self.item(n, layer.res, img, ax, ay, clip=clip))
            return
        else:
            img = layer.image if layer.image is not None and layer.image >= 0 else None
            out.append(self.item(n, layer.res, img, ax, ay))
        for c in layer.children:
            self.layer_items(c, ax, ay, out)

    def advance(self, layer):
        t = layer.type
        if t in ('MovingLayer', 'ClippedMovingLayer', 'ClippedMovingImageLayer'):
            layer.x += layer.vx
            layer.y += layer.vy
        elif t == 'JitterImageLayer':
            rng = self.layer_rng(layer)
            for axis in ('jy', 'jx'):
                if rng.random() < 0.5:
                    step = rng.randint(0, 1)
                    setattr(layer, axis, getattr(layer, axis) + (step if rng.random() < 0.5 else -step))
        elif t == 'AnimLayer':
            # AnimLayer_Advance_2E607 : avance tant que l'image < nombre d'images ; elle s'arrête
            # donc sur l'image n, qui n'existe pas et n'est pas dessinée.
            n = self.count_of(layer)
            if n is None or layer.image < n:
                layer.image += 1
        elif t == 'LoopAnimLayer':
            n = self.count_of(layer)
            if layer.mode == 0:
                layer.image += 1
                if n is not None and layer.image == n:
                    layer.image = 0
            else:
                layer.image -= 1
        elif t == 'OverlayAnimLayer':
            n = self.count_of(layer)
            if n is None or layer.image < n - 1:
                layer.image += 1
        elif t == 'TriggeredAnimLayer':
            n = self.count_of(layer)
            if layer.lecture and (n is None or layer.image < n - 1):
                layer.image += 1
        elif t == 'ToggleLayer':
            layer.image = min(13, layer.image + 1) if layer.sens else max(0, layer.image - 1)
            return
        elif t in ('TalkingHead', 'TalkingHeadOverlay'):
            self.advance_head(layer)
        for c in layer.children:
            self.advance(c)

    def layer_rng(self, layer):
        # Un tirage par calque : le résultat ne dépend pas du nombre d'images simulées ailleurs.
        if not hasattr(layer, 'rng'):
            layer.rng = random.Random(layer.name)
        return layer.rng

    def advance_head(self, layer):
        layer.mouth = -1
        if layer.blink and self.layer_rng(layer).randrange(30) == 0 and layer.base <= 20:
            layer.shown = 12
        else:
            layer.shown = layer.base
        text = layer.lips
        if not text or layer.cursor >= len(text):
            return
        c = text[layer.cursor]
        layer.cursor += 1
        nxt = text[layer.cursor] if layer.cursor < len(text) else ''
        mouth = -1
        if c == 'h':
            layer.cursor += 1
        elif c == 'c' and nxt == 'h':
            mouth = 6
            layer.cursor += 1
        elif c == 'e':
            if not ('a' <= nxt <= 'z') if nxt else True:
                c = nxt
                layer.cursor += 1
            elif nxt == 'r':
                mouth = 6
                layer.cursor += 1
        elif c == 't' and nxt == 'h':
            mouth = 9
            layer.cursor += 1
        if mouth == -1 and c and 'a' <= c <= 'z':
            mouth = int('06891599098769362999252999'[ord(c) - 97]) + 2
        layer.mouth = mouth

    def tick(self, scene):
        if scene.terminated:
            return
        items = []
        for layer in scene.children:
            self.layer_items(layer, scene.x, scene.y + BAND_TOP, items)
        self.record(scene.name, scene.fps, items)
        self.last_frame = items
        for layer in scene.children:
            self.advance(layer)
        scene.counter += 1

    # ------------------------------------------------------------------ plans
    def record(self, source, fps, items):
        p = self.pending
        changed = p['palettes'] or p['clear'] or p['fade'] or p['music'] is not None
        s = self.shot
        if s is None or self.force_new or s['source'] != source or s['fps'] != fps or (changed and s['frames']) \
                or s['full_screen'] != self.full_screen:
            s = {'source': source, 'fps': fps, 'frames': [], 'sounds': [], 'palettes': [], 'clear': False,
                 'fade': 0, 'music': 255, 'end': None, 'full_screen': self.full_screen}
            self.shots.append(s)
            self.shot = s
            self.force_new = False
        if changed:
            s['palettes'] += [r for r in p['palettes'] if r is not None]
            s['clear'] = s['clear'] or p['clear']
            s['fade'] = p['fade'] or s['fade']
            if p['music'] is not None:
                s['music'] = p['music']
            p['palettes'] = []
            p['clear'] = False
            p['fade'] = 0
            p['music'] = None
        for entry in p['sounds']:
            s['sounds'].append((len(s['frames']), entry))
        p['sounds'] = []
        s['frames'].append(items)
        self.clock += 1.0 / fps


# ---------------------------------------------------------------------- écriture IFF

def chunk(tag, data):
    out = tag.encode('ascii') + struct.pack('>I', len(data)) + data
    if len(data) & 1:
        out += b'\0'
    return out


def text(s):
    b = s.encode('latin-1')
    return struct.pack('<H', len(b)) + b


def merged_order(frames):
    order = []
    for items in frames:
        prev = None
        for it in items:
            k = it['key']
            if k not in order:
                order.insert(order.index(prev) + 1 if prev is not None else 0, k)
            prev = k
    return order


def runs(frames, key):
    out = []
    start = None
    for i, items in enumerate(frames):
        present = any(it['key'] == key for it in items)
        if present and start is None:
            start = i
        if not present and start is not None:
            out.append((start, i))
            start = None
    if start is not None:
        out.append((start, len(frames)))
    return out


def layer_chunks(shot, key, start, stop, depth, layer_id):
    seq = [next(it for it in shot['frames'][i] if it['key'] == key) for i in range(start, stop)]
    first = seq[0]
    if first['kind'] == 'text':
        return None, None
    res = first['res']
    if res is None:
        return None, None
    positions = [(it['x'], it['y']) for it in seq]
    if res[0] == 'face':
        positions = [(x - FACE_ANCHOR[0], y - BAND_TOP - FACE_ANCHOR[1]) for x, y in positions]
        archive = 'FACE:' + res[1]
        entry = 0
    else:
        archive = archive_path(res[1])
        entry = res[2]
    constant_pos = all(p == positions[0] for p in positions)
    images = [it['image'] for it in seq]
    auto = all(it['auto'] for it in seq)
    clip = first['clip']
    nb_frames = 0 if stop == len(shot['frames']) else stop - start
    layr = struct.pack('<hhHHBBhhhhhB', layer_id, -1, start, nb_frames, 0, 1 if clip else 0,
                       *(clip if clip else (0, 0, 0, 0)), depth, 1)
    extra = chunk('LAYR', layr)
    if not auto and not all(v == images[0] for v in images):
        extra += chunk('SEQU', struct.pack('<H', len(images)) + bytes(NO_IMAGE if v is None else v for v in images))
    if not constant_pos:
        extra += chunk('PATH', struct.pack('<H', len(positions)) +
                       b''.join(struct.pack('<hh', x, y) for x, y in positions))
    pos = positions[0]
    head = text(archive) + text('')
    tail = struct.pack('<hhhhhh', pos[0], pos[1], pos[0], pos[1], 0, 0)
    if auto:
        end_frame = first['endrel']
        if first.get('frozen') and images[0] > 0:
            end_frame = images[0]
        data = head + struct.pack('<HHHB', entry, entry, 255, 1) + tail + struct.pack(
            '<BBhh', 0, 1 if first['loop'] else 0, images[0], end_frame)
        return 'sprite', chunk('SPRI', data) + extra
    image = images[0]
    data = head + struct.pack('<HHHB', entry, 255, NO_IMAGE if image is None else image, 1) + tail
    if image is None and all(v is None for v in images):
        return None, None
    return 'bg', chunk('BKGD', data) + extra


def shot_chunk(shot, first_shot):
    frames = shot['frames']
    order = merged_order(frames)
    bg = b''
    sprites = b''
    texts = b''
    ids = {}
    next_id = 0
    for depth, key in enumerate(order):
        for start, stop in runs(frames, key):
            sample = next(it for it in frames[start] if it['key'] == key)
            if sample['kind'] == 'text':
                tkey, index = sample['text']
                if tkey is None:
                    continue
                nb = 0 if stop == len(frames) else stop - start
                texts += chunk('TEXE', text(tkey) + struct.pack('<bbHhhhhBHB', index, 0, nb, 0, sample['y'], 0, 0,
                                                               15, start, sample['align'] or 0))
                continue
            kind, data = layer_chunks(shot, key, start, stop, depth, next_id)
            if kind is None:
                continue
            ids[key] = next_id
            next_id += 1
            if kind == 'sprite':
                sprites += data
            else:
                bg += data
    end_layer = -1
    nbframe = len(frames)
    wait = 0
    if shot['end'] and shot['end'][0] == 'voix':
        wait = 1
        nbframe = 1
    if shot['end'] and shot['end'][0] == 'animation':
        end_layer = ids.get(shot['end'][1], -1)
        nbframe = 1
    code = shot['sounds'][0][0] + 1 if shot['sounds'] else 0
    out = chunk('SHTP', struct.pack('<iBHBBBBhBB', nbframe, shot['music'], code, shot['fps'], wait,
                                    0 if first_shot or shot['clear'] else 1, shot['fade'], end_layer,
                                    1 if shot['full_screen'] else 0, 1 if shot['clear'] else 0))
    if shot['palettes']:
        out += chunk('PALS', struct.pack('<H', len(shot['palettes'])) +
                     b''.join(text(a) + struct.pack('<H', e) for a, e in shot['palettes']))
    if bg:
        out += chunk('BGND', bg)
    if sprites:
        out += chunk('SPRT', sprites)
    if texts:
        out += chunk('TEXT', texts)
    for frame, entry in shot['sounds']:
        out += chunk('SOND', text(archive_path('mid1voc')) + struct.pack('<HH', entry, frame))
    return chunk('SHOT', out)


def main():
    args = sys.argv[1:]
    replace = {}
    hypotheses = {}
    while '--remplace' in args:
        i = args.index('--remplace')
        old, new = args[i + 1].split('=')
        replace[old] = new
        del args[i:i + 2]
    while '--hypothèse' in args:
        i = args.index('--hypothèse')
        name, value = args[i + 1].split('=')
        hypotheses[name] = int(value)
        del args[i:i + 2]
    data_dir = None
    if '--donnees' in args:
        i = args.index('--donnees')
        data_dir = args[i + 1]
        del args[i:i + 2]
    source, destination = args
    data = json.load(open(source, encoding='utf-8'))
    player = Player(data, replace, hypotheses)
    if data_dir:
        # Avec les données du jeu : fin exacte des boucles d'attente (nombre d'images, durée des
        # répliques), donc état exact au début du plan suivant (voir MID1_PLANS.md).
        os.environ['SC_DATA'] = data_dir
        sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
        import midgame_render
        player.image_count = midgame_render.image_count
        player.voice_seconds = midgame_render.voice_seconds
    player.run(data['parties'][0]['arbre'])
    shots = [s for s in player.shots if s['frames']]
    content = b'ANIM' + chunk('HEAD', struct.pack('<II', len(shots), 2))
    content += b''.join(shot_chunk(s, i == 0) for i, s in enumerate(shots))
    open(destination, 'wb').write(b'FORM' + struct.pack('>I', len(content)) + content)
    for i, s in enumerate(shots):
        end = s['end'][0] if s['end'] else f'{len(s["frames"])} images'
        print(f'plan {i}: {s["source"]}, {s["fps"]} images/s, fin {end}, sons {s["sounds"]}, '
              f'palettes {len(s["palettes"])}, musique {s["music"]}')
    for w in player.warnings:
        print('attention :', w)


ANIMATED = ('AnimLayer', 'LoopAnimLayer', 'OverlayAnimLayer', 'TriggeredAnimLayer')

if __name__ == '__main__':
    main()
