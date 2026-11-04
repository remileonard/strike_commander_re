"""Page HTML illustrée : panneau CONFIGURATION (ALT+O, STRIKE.EXE) et TRAINING MISSION (OPTEST.EXE).

Reprend analysis/OPTIONS_SCREEN.md et analysis/TRAINING_MISSION.md, avec les images de
analysis/options_images/ et analysis/training_images/ intégrées dans la page (base64).
La feuille de style est celle d'analysis/SMOKE_SYSTEM.html.

Usage : python3 tools/options_training_html.py   → écrit analysis/OPTIONS_TRAINING.html
"""
import base64
import html
import os

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'analysis')


def img(rel, caption, scroll=False):
    with open(os.path.join(ROOT, rel), 'rb') as f:
        data = base64.b64encode(f.read()).decode()
    tag = f'<img src="data:image/png;base64,{data}" alt="{html.escape(caption)}">'
    if scroll:
        tag = f'<div class="scroll">{tag}</div>'
    return f'<figure>{tag}<figcaption>{caption}</figcaption></figure>\n'


def table(head, rows, num=()):
    out = ['<div class="tablewrap"><table><thead><tr>']
    out += [f'<th>{h}</th>' for h in head]
    out.append('</tr></thead><tbody>')
    for r in rows:
        out.append('<tr>')
        for k, c in enumerate(r):
            cls = ' class="num"' if k in num else ''
            out.append(f'<td{cls}>{c}</td>')
        out.append('</tr>')
    out.append('</tbody></table></div>\n')
    return ''.join(out)


def card(ident, num, title, body):
    return f'<article class="card" id="{ident}">\n  <header><span class="id">{num}</span><h2>{title}</h2></header>\n{body}</article>\n'


def code(text):
    return f'<pre class="tpl">{html.escape(text)}</pre>\n'


def style():
    s = open(os.path.join(ROOT, 'SMOKE_SYSTEM.html'), encoding='utf-8').read()
    return s[s.index('<style>') + 7:s.index('</style>')]


def btn(rows):
    return table(['Bouton', 'Position', 'Taille', 'Images'], rows)


_X1 = table(['Touche', 'Code', 'Effet'], [
    ['ALT+O', '24', 'ouvre le panneau CONFIGURATION'],
    ['ALT+S', '31', 'effets sonores marche / arrêt'],
    ['ALT+J', '36', 'une fonction de manette, pour chaque manette présente (pas encore nommée)'],
    ['ALT+X', '45', '<code>Input_CalibrationHandler</code> ; s\'il rend vrai, fin demandée'],
    ['ALT+M', '50', 'musique marche / arrêt'],
], num=(1,))
_X2 = table(['Écran', 'Fichier d\'images', 'Images', 'Fonction'], [
    ['CONFIGURATION', '<code>FONTS\\MAINOPT.SHP</code>', '28', '<code>Options_ConfigurationScreen_90D20</code>'],
    ['DETAIL', '<code>FONTS\\DETLOPT.SHP</code>', '52', '<code>Options_DetailScreen_91D29</code>'],
    ['FLIGHT', '<code>FONTS\\FLITOPT.SHP</code>', '54', '<code>Options_FlightScreen_90097</code>'],
    ['GAMEPLAY', '<code>FONTS\\GAMEOPT.SHP</code>', '14', '<code>Options_GameplayScreen_92E60</code>'],
    ['COCKPIT', '<code>FONTS\\COCKOPT.SHP</code>', '24', '<code>Options_CockpitScreen_93295</code>'],
    ['CAMERAS', '<code>FONTS\\CAMROPT.SHP</code>', '19', '<code>Options_CamerasScreen_93BA5</code>'],
    ['AUDIO', '<code>FONTS\\AUDIOPT.SHP</code>', '16', '<code>Options_AudioScreen_9416A</code>'],
    ['EXIT GAME', '<code>FONTS\\RESTART.SHP</code>', '11', '<code>Options_ExitGameScreen_9277C</code>'],
], num=(2,))
_X3 = img('options_images/menus_alt_o.png', 'Les 8 écrans : images 0 et 1 et boutons à image fixe. Les jauges et les boutons à image choisie à l\'exécution ne sont pas dessinés.')
_X4 = img('options_images/mainopt.png', 'Panneau CONFIGURATION, images aux positions du code, sur fond noir.')
_X5 = table(['Bouton', 'Position', 'Taille', 'Images', 'Effet'], [
    ['DETAIL', '(36, 61)', '66 × 11', '2, 3', 'sous-écran DETAIL'],
    ['FLIGHT', '(106, 61)', '66 × 11', '8, 9', 'sous-écran FLIGHT'],
    ['GAMEPLAY', '(36, 74)', '66 × 11', '4, 5', 'sous-écran GAMEPLAY'],
    ['COCKPIT', '(106, 74)', '66 × 11', '10, 11', 'sous-écran COCKPIT'],
    ['CAMERAS', '(36, 87)', '66 × 11', '6, 7', 'sous-écran CAMERAS'],
    ['AUDIO', '(106, 87)', '66 × 11', '12, 13', 'sous-écran AUDIO'],
    ['ROOKIE', '(211, 61)', '66 × 11', '14, 15', 'réglages du niveau (<code>Options_PresetRookie_91B2C</code>)'],
    ['VETERAN', '(211, 74)', '66 × 11', '16, 17', 'réglages du niveau (<code>Options_PresetVeteran_91AE9</code>)'],
    ['ACE', '(211, 87)', '66 × 11', '18, 19', 'réglages du niveau (<code>Options_PresetAce_91AA6</code>)'],
    ['SAVE', '(18, 114)', '48 × 11', '20, 21', 'écrit <code>OPTIONS.CFG</code>'],
    ['DEFAULT', '(73, 114)', '59 × 11', '22, 23', 'relit <code>OPTDFLT.CFG</code>'],
    ['EXIT', '(139, 114)', '49 × 11', '24, 25', 'ferme le panneau'],
    ['EXIT GAME', '(211, 114)', '66 × 11', '26, 27', 'sous-écran EXIT GAME'],
])
_X6 = img('options_images/menu_detail.png', 'Sous-écran DETAIL : images 0, 1 et boutons.')
_X7 = btn([
    ['TERRAIN GOURAUD', '(22, 67)', '73 × 11', '2, 3'],
    ['TRANSITION', '(22, 80)', '73 × 11', '4, 5'],
    ['INTEREST', '(22, 93)', '73 × 11', '6, 7'],
    ['RIVERS', '(22, 106)', '73 × 11', '8, 9'],
    ['FIELDS', '(22, 119)', '73 × 11', '10, 11'],
    ['CITIES', '(22, 132)', '73 × 11', '12, 13'],
    ['RUNWAYS', '(22, 145)', '73 × 11', '14, 15'],
    ['OBJECTS GOURAUD', '(226, 67)', '73 × 11', '26, 27'],
    ['TEXTURE', '(226, 80)', '73 × 11', '28, 29'],
    ['EXIT', '(244, 132)', '38 × 11', '36, 37'],
])
_X8 = table(['Octet de la configuration', 'Image dessinée', 'Étendue dans le cadre (x ; y)'], [
    ['<code>[+90]</code> (toujours)', '39 si non nul, 38 sinon', '0 à 92 ; 0 à 71 (fond de terrain)'],
    ['<code>[+86]</code>', '40 si non nul', '0 à 23 ; 24 à 64'],
    ['<code>[+89]</code>', '41 si non nul', '49 à 85 ; 23 à 28'],
    ['<code>[+85]</code>', '42 si non nul', '15 à 39 ; 30 à 46'],
    ['<code>[+88]</code>', '43 si non nul', '73 à 92 ; 25 à 42'],
    ['<code>[+87]</code>', '44 si non nul', '2 à 92 ; 38 à 71'],
    ['<code>[+91]</code> (toujours)', '46 si non nul, 45 sinon', '27 à 80 ; 24 à 40'],
    ['<code>[+81]</code> (toujours)', '49 si non nul, 50 sinon', '21 à 61 ; 3 à 38 (avion)'],
    ['<code>[+82]</code> (toujours)', '48 et 51 si non nul, 47 sinon', '41 à 84 ; 29 à 62 (51 : 29 à 58 ; 3 à 36)'],
])
_X9 = img('options_images/detail_apercu.png', 'À gauche, tous les octets à zéro (38, 45, 50, 47) ; à droite, tous non nuls (39, 40 à 44, 46, 49, 48, 51).')
_X10 = table(['Écran', 'Position', 'Taille', 'Liste (d\'après le rendu)'], [
    ['FLIGHT', '(17, 66)', '89 × 65', 'FLIGHT CONTROL : KEYBOARD, MOUSE, JOYSTICK, F\'s PRO, THRUSTMASTER'],
    ['FLIGHT', '(212, 66)', '89 × 78', 'PANNING CONTROL : KEYBOARD, MOUSE, JOYSTICK, F\'s PRO, THRUSTMASTER, NONE'],
    ['GAMEPLAY', '(197, 74)', '66 × 39', 'ENEMY INTELLIGENCE : ROOKIE, VETERAN, ACE'],
    ['CAMERAS', '(53, 102)', '210 × 11', 'WINDOW SIZE : SMALL, MEDIUM, LARGE'],
    ['DETAIL', '(243, 93)', '40 × 11', 'probablement HI / LO (hypothèse)'],
    ['DETAIL', '(127, 159)', '68 × 11', 'probablement HAZING, FAR / NEAR (hypothèse)'],
])
_X11 = code("""Training_Run_597B2
  banque midgames\\rmusic.pak (amusic.pak si byte_46848 = 2)
  Training_InitSettings_598FC            réglages, altitude 5000 pieds
  Training_TypeScreen_5547D              écrans de réglage (§ 13 à 15)
  stock d'armes de la partie, [partie+252] = 11
  Gameflow_WeaponLoadout_51AB3           écran d'armement de la campagne
  Training_BuildInstantMission_58EEA     instant.iff (§ 17)
Gameflow_MainLoop_3D2E
  [partie+249] = 254, [partie+232] = 1   départ en vol, op2misn.iff avec « instant »""")
_X12 = table(['Fichier', 'Contenu employé'], [
    ['<code>GAMEFLOW\\OBJVIEW.PAK</code>', 'entrée 7 : palette ; entrée 6 : fond plein écran en (0, 0) ; entrée 1 : bandeau « TRAINING MISSION » en (4, 3)'],
    ['<code>GAMEFLOW\\TM.SHP</code>', '99 images : les panneaux et tous les boutons'],
    ['<code>GAMEFLOW\\BWFONT.SHP</code>', 'police'],
    ['<code>MISSIONS\\TEMPLATE.IFF</code>', 'mission modèle recopiée dans <code>instant.iff</code>'],
])
_X13 = img('training_images/tm_shp.png', 'Les 99 images de TM.SHP, avec leur numéro.', scroll=True)
_X14 = img('training_images/planche.png', 'Les 8 écrans. Texte en BWFONT.SHP avec un espacement supposé ; lettres absentes de la police laissées en blanc.')
_X15 = table(['Chunk', 'Ajout', 'Type'], [
    ['<code>AREA</code>', 'sphère « Destroy bogeys » (zone 13) : x = −66000, z = −128000, y = nombre de pieds recopié tel quel, rayon 45000', 'DOGFIGHT'],
    ['<code>FLAG</code>', 'un mot = nombre total d\'avions (FLAG[1])', 'les deux'],
    ['<code>CAST</code>', 'un nom par avion : rookie / veteran / ace, ou target', 'DOGFIGHT'],
    ['<code>PART</code> 0', 'joueur replacé : x = −73000, z = −128000, y = pieds × 256 / 839, cap 90', 'les deux'],
    ['<code>PART</code>', 'un objet par avion : x = −59000 + 500 × groupe, z = −(128000 + 300 × rang), même altitude, cap 270, camp 255, scripts mise à jour 1 ou 2, destruction 3', 'DOGFIGHT'],
    ['<code>FORM PLAY</code>', 'scène 14 : active, zone 13, objets = les avions ajoutés', 'DOGFIGHT'],
])
_X16 = code("""OP_MOVE_VALUE_TO_WORK_REGISTER 1
OP_SUB_WORK_FROM_FLAG 1
OP_MOVE_FLAG_TO_WORK_REGISTER 1
OP_CMP_WORK_WITH_VALUE 0
OP_BRANCH_IF_NOT_EQUAL 78
OP_SET_FLAG_TO_TRUE 0
OP_SET_LABEL 78""")

# ---------------------------------------------------------------- partie 1 : ALT+O
P1 = []
P1.append(card('alt-ouverture', '1', 'ALT+O : ouverture du panneau', f'''
<p>Les touches ALT du vol passent par <code>Input_AltKeyCommands_26F7E</code> (ALT enfoncé, sans MAJ ni CTRL).
ALT+O (code clavier 24) coupe les effets sonores et ouvre <code>Options_ConfigurationScreen_90D20</code> avec la
structure de configuration (DGROUP 21056, celle que SAVE écrit dans <code>OPTIONS.CFG</code>). Au retour, la musique
est relancée ou arrêtée si son interrupteur a changé.</p>
{_X1}
<p>Le panneau est dessiné par-dessus l'image figée du vol : l'écran est mis de côté à l'ouverture et recopié à
chaque tour avant le panneau. Aucune palette n'est chargée : c'est celle du vol (les rendus ci-dessous utilisent
<code>PALETTE\\PALETTE.IFF</code>).</p>
'''))

P1.append(card('alt-methode', '2', 'Méthode de dessin, commune aux 8 écrans', f'''
<ol class="steps">
<li>Image 0 du fichier <code>.SHP</code> de l'écran, en <b>(5, 4)</b> : bandeau « CONFIGURATION » (310 × 31).</li>
<li>Image 1, en <b>(5, 39)</b> : fond du panneau. <b>Elle contient déjà tous les libellés</b> (boutons, titres,
listes) dans leur aspect neutre.</li>
<li>Boutons : image normale, image enfoncée au clic. Chaque image de bouton porte aussi son libellé.</li>
<li>Jauges (listes à choix) et images choisies à l'exécution : § 6.</li>
</ol>
<p>Positions des boutons en coordonnées d'écran (320 × 200). Un bouton : rectangle (position, taille), image
normale, image enfoncée, valeur écrite au clic.</p>
{_X2}
{_X3}
'''))

P1.append(card('alt-principal', '3', 'Panneau principal (MAINOPT.SHP)', f'''
{_X4}
{_X5}
<p>Après un clic : ROOKIE, VETERAN, ACE appliquent leurs valeurs et le panneau reste ouvert ; un sous-écran, SAVE ou
DEFAULT ferment le panneau, jouent l'action, puis le panneau est reconstruit et rouvert ; EXIT ferme ; EXIT GAME
ferme si l'écran EXIT GAME le décide.</p>
'''))

P1.append(card('alt-detail', '4', 'DETAIL (DETLOPT.SHP)', f'''
{_X6}
{_X7}
<p>Cases HI / LO (3) et HAZING (5, entre FAR et NEAR) : images 16 à 25, de 13 × 12.</p>
<h3>L'aperçu central</h3>
<p>Dessiné par <code>Options_DetailPreview_Draw_91B70</code> dans la <b>zone vide au centre de l'image 1, de (114, 69)
à (206, 140)</b> (93 × 72). Les images 38 à 51 sont en coordonnées locales : chacune se dessine avec son origine en
<b>(114, 69)</b>, dans l'ordre du tableau, par-dessus les précédentes. Le choix dépend d'octets de la configuration :</p>
{_X8}
{_X9}
<p class="note">Quel bouton écrit quel octet n'est pas suivi (la logique des clics est laissée de côté).</p>
'''))

SUBS = [
    ('alt-flight', 'FLIGHT (FLITOPT.SHP)', 'options_images/menu_flight.png', [
        ['MIDAIR COLLISIONS', '(121, 62)', '—', '29, 30'],
        ['EASY LANDINGS', '(121, 81)', '—', '31, 32'],
        ['SHOW WEAPONS', '(121, 100)', '—', '33, 34'],
        ['STALLS', '(121, 119)', '—', '36, 37'],
        ['CALIBRATE JOYSTICK', '(93, 146)', '—', '40, 41 ; 42, 42 si l\'octet brut du bouton 0 de la manette est nul'],
        ['EXIT', '(131, 176)', '—', '38, 39'],
    ], 'Jauges : FLIGHT CONTROL en (17, 66), 89 × 65 ; PANNING CONTROL en (212, 66), 89 × 78. L\'image 42 porte « JOYSTICK CALIBRATION ».'),
    ('alt-gameplay', 'GAMEPLAY (GAMEOPT.SHP)', 'options_images/menu_gameplay.png', [
        ['UNLIMITED AMMO', '(48, 70)', '—', '2, 3'],
        ['EASY GUN HITS', '(48, 90)', '—', '4, 5'],
        ['EXIT', '(129, 122)', '—', '12, 13'],
    ], 'Jauge : ENEMY INTELLIGENCE en (197, 74), 66 × 39.'),
    ('alt-cockpit', 'COCKPIT (COCKOPT.SHP)', 'options_images/menu_cockpit.png', [
        ['LADDER', '(45, 62)', '111 × 11', '2, 3'],
        ['TAPES', '(45, 75)', '111 × 11', '4, 5'],
        ['AUTO TARGET', '(45, 88)', '111 × 11', '6, 7'],
        ['360 TARGET LOCK', '(45, 101)', '111 × 11', '8, 9'],
        ['SMART TARGETING', '(45, 114)', '111 × 11', '10, 11'],
        ['SUN GLARE', '(162, 62)', '111 × 11', '12, 13'],
        ['G EFFECTS', '(162, 75)', '111 × 11', '14, 15'],
        ['SMART RADAR', '(162, 88)', '111 × 11', '16, 17'],
        ['360 AA RADAR', '(162, 101)', '111 × 11', '18, 19'],
        ['SMART RAW SCOPE', '(162, 114)', '111 × 11', '20, 21'],
        ['EXIT', '(129, 142)', '—', '22, 23'],
    ], 'Libellés d\'après le rendu.'),
    ('alt-cameras', 'CAMERAS (CAMROPT.SHP)', 'options_images/menu_cameras.png', [
        ['AUTO SWITCHING', '(22, 60)', '—', '2, 3'],
        ['VICTIM VIEW', '(164, 60)', '—', '4, 5'],
        ['WEAPON CAMERA', '(22, 73)', '—', '6, 7'],
        ['TERRAIN IN GUN CAMERA', '(164, 73)', '—', '8, 9 ; 10, 10 si la valeur mémoire est inférieure à 40960'],
        ['EXIT', '(129, 124)', '—', '17, 18'],
    ], 'Jauge : WINDOW SIZE en (53, 102), 210 × 11. L\'image 10 est le libellé TERRAIN IN GUN CAMERA plus clair.'),
    ('alt-audio', 'AUDIO (AUDIOPT.SHP)', 'options_images/menu_audio.png', [
        ['MUSIC', '(88, 63)', '—', '2, 3 ; 4, 4 si <code>byte_70996</code> = 0'],
        ['SOUND FX', '(88, 76)', '—', '8, 9 ; 10, 10 si <code>byte_70996</code> = 0'],
        ['SPEECH', '(165, 63)', '—', '5, 6 ; 7, 7 si <code>word_70999</code> = 0'],
        ['DIGITAL FX', '(165, 76)', '—', '11, 12 ; 13, 13 si <code>word_70999</code> = 0'],
        ['EXIT', '(129, 101)', '—', '14, 15'],
    ], 'Les libellés MUSIC, SPEECH, SOUND FX, DIGITAL FX sont aussi dans l\'image 1.'),
    ('alt-exit', 'EXIT GAME (RESTART.SHP)', 'options_images/menu_exit_game.png', [
        ['RESTART', '(54, 80)', '—', '2, 3 (résultat 6)'],
        ['ABORT', '(126, 80)', '—', '4, 5 (résultat 4)'],
        ['CONTINUE', '(198, 80)', '—', '6, 7 (résultat 1, modes 0 et 3)'],
        ['élément vertical', '(290, 55)', '11 × 29', '8, 9 ; 10, 10 si le mode est non nul (le panneau principal passe 0)'],
    ], 'Résultat dans <code>byte_706AF</code>. L\'aspect de l\'élément vertical n\'est pas vérifié par rendu.'),
]
for k, (ident, title, image, rows, note) in enumerate(SUBS):
    P1.append(card(ident, str(5 + k), title, img(image, title + ' : images 0, 1 et boutons à image fixe.') + btn(rows)
                   + f'<p>{note}</p>\n'))

P1.append(card('alt-jauges', '11', 'Jauges et points ouverts', f'''
{_X10}
<p>Les libellés des listes sont dans l'image 1 ; la mise en évidence de l'élément choisi est dessinée par la jauge
(<code>GaugeWidget_DrawByMode_A39DC</code>, non lue). Le sens des drapeaux qui choisissent les images d'AUDIO, de
FLIGHT et de CAMERAS n'est pas établi. Référence : <code>analysis/OPTIONS_SCREEN.md</code>.</p>
'''))

# ---------------------------------------------------------------- partie 2 : TRAINING MISSION
P2 = []
P2.append(card('trn-ensemble', '12', 'TRAINING MISSION : enchaînement', f'''
<p>OPTEST.EXE, choix 3 du menu d'accueil (<code>Gameflow_MainMenu_4F1A7</code>), traité par
<code>Gameflow_MainLoop_3D2E</code> qui appelle <code>Training_Run_597B2</code>.</p>
{_X11}
<p>CANCEL, à n'importe quel écran, revient au menu sans vol. BACKUP revient à l'écran précédent et efface les textes
de cet écran (zones d'écran sauvegardées sous chaque texte).</p>
'''))

P2.append(card('trn-fichiers', '13', 'Fichiers et méthode de dessin', f'''
{_X12}
<p>Les entrées d'<code>OBJVIEW.PAK</code> ne sont pas compressées : l'octet haut de leur position vaut 224 ou 193,
la position est sur les 3 octets bas.</p>
<p>Le fond et le bandeau sont dessinés une fois, par le premier écran. Ensuite seul le <b>panneau du bas</b> change,
et des lignes de texte s'ajoutent au-dessus. Les positions des boutons sont <b>relatives au coin du panneau</b>.</p>
{_X13}
'''))

P2.append(card('trn-ecrans', '14', 'Les écrans', f'''
{_X14}
'''))

SCREENS = [
    ('1_type', 'Type de mission — Training_TypeScreen_5547D', 'Panneau en (6, 153), 308 × 42, image 0.', [
        ['SEARCH AND DESTROY', '(16, 9)', '136 × 12', '1, 2'],
        ['DOGFIGHT', '(155, 9)', '136 × 12', '3, 4'],
        ['CANCEL', '(155, 24)', '65 × 12', '5, 6'],
    ], 'DOGFIGHT écrit « Mission Briefing: Air Superiority » en (5, 43) et « Intercept and engage inbound bogeys: » en (5, 55).'),
    ('2_nombre', 'Nombre d\'avions du groupe — Training_GroupCountScreen_56366', 'Panneau en (6, 153), image 7.', [
        ['1', '(113, 9)', '14 × 12', '8, 9'],
        ['2', '(130, 9)', '14 × 12', '10, 11'],
        ['3', '(147, 9)', '14 × 12', '12, 13'],
        ['4', '(164, 9)', '14 × 12', '14, 15'],
        ['5', '(181, 9)', '14 × 12', '16, 17'],
        ['BACKUP', '(87, 24)', '65 × 12', '18, 19'],
        ['CANCEL', '(155, 24)', '65 × 12', '20, 21'],
    ], 'Le nombre est écrit en (20, 67 + 12 × groupe), groupe = 0, 1 ou 2.'),
    ('3_avion', 'Type d\'avion — Training_AircraftScreen_56B04', 'Panneau en (6, 116), 308 × 79, image 22 ; 16 boutons de 65 × 12 en colonnes x = 9, 77, 145, 235 et lignes y = 7, 20, 33, 46.', [
        ['F-15 / F-16 / F/A-18 / C-130', 'x = 9', '65 × 12', '23 / 25 / 27 / 29 (+1 enfoncée)'],
        ['F-22 / YF-23 / A-10 / E-3', 'x = 77', '65 × 12', '31 / 33 / 35 / 37'],
        ['TORNADO / MIRAGE 2000 / LEAR JET / BOEING 747', 'x = 145', '65 × 12', '39 / 41 / 43 / 45'],
        ['MIG-21 / MIG-29 / SU 27 / TU-95', 'x = 235', '65 × 12', '47 / 49 / 51 / 53'],
        ['BACKUP', '(87, 61)', '65 × 12', '55, 56'],
        ['CANCEL', '(155, 61)', '65 × 12', '57, 58'],
    ], 'Le nom est écrit en (30, 67 + 12 × groupe), suivi de « . » au 3e groupe. 3 groupes au plus.'),
    ('4_plus', 'Autre groupe ? — Training_MoreEnoughScreen_57FDA', 'Panneau en (6, 153), image 59.', [
        ['MORE', '(87, 9)', '65 × 12', '60, 61'],
        ['ENOUGH', '(155, 9)', '65 × 12', '62, 63'],
        ['BACKUP', '(87, 24)', '65 × 12', '64, 65'],
        ['CANCEL', '(155, 24)', '65 × 12', '66, 67'],
    ], 'MORE écrit « , » (après le 1er groupe) ou « , and » (après le 2e) ; ENOUGH écrit « . ».'),
    ('5_altitude', 'Altitude — Training_AltitudeScreen_55C92', '« Altitude: » en (5, 103). Panneau en (6, 153), image 68.', [
        ['5,000', '(19, 9)', '65 × 12', '69, 70'],
        ['15,000', '(87, 9)', '65 × 12', '71, 72'],
        ['25,000', '(155, 9)', '65 × 12', '73, 74'],
        ['35,000', '(223, 9)', '65 × 12', '75, 76'],
        ['BACKUP', '(87, 24)', '65 × 12', '77, 78'],
        ['CANCEL', '(155, 24)', '65 × 12', '79, 80'],
    ], 'Altitude en pieds = choix × 10000 − 5000, écrite avec « %ld feet. ».'),
    ('6_niveau', 'Niveau des pilotes — Training_PilotLevelScreen_584BD', '« Intelligence reports indicate » en (5, 115). Panneau en (6, 153), image 81.', [
        ['ROOKIE', '(54, 9)', '65 × 12', '82, 83'],
        ['VETERAN', '(122, 9)', '65 × 12', '84, 85'],
        ['ACE', '(190, 9)', '65 × 12', '86, 87'],
        ['BACKUP', '(87, 24)', '65 × 12', '88, 89'],
        ['CANCEL', '(155, 24)', '65 × 12', '90, 91'],
    ], 'Suivi de « rookie pilots. », « veteran pilots. » ou « ace pilots. ».'),
    ('7_accept', 'Validation — Training_AcceptScreen_58A9D', 'Panneau en (6, 153), image 92.', [
        ['ACCEPT', '(121, 9)', '65 × 12', '93, 94'],
        ['BACKUP', '(87, 24)', '65 × 12', '95, 96'],
        ['CANCEL', '(155, 24)', '65 × 12', '97, 98'],
    ], 'ACCEPT mène à l\'écran d\'armement.'),
    ('8_search_accept', 'SEARCH AND DESTROY — Training_SearchBriefing_58E74', '4 lignes en (5, 43), (5, 55), (5, 67), (5, 79), puis directement la validation (image 92). Aucun réglage.', [], ''),
]
body = ''
for name, title, intro, rows, note in SCREENS:
    body += f'<h3>{title}</h3>\n' + img(f'training_images/{name}.png', title) + f'<p>{intro}</p>\n'
    if rows:
        body += btn(rows)
    if note:
        body += f'<p>{note}</p>\n'
body += code("""Mission Briefing: Ground Attack
Search and destroy enemy targets at
pilot's discretion.  Refer to area
map for enemy positions.""")
P2.append(card('trn-detail', '15', 'Écran par écran', body))

P2.append(card('trn-avions', '16', 'Table des avions', table(
    ['N°', 'Nom affiché', 'Fichier objet', 'Emport', 'Drapeau'], [
        ['1', 'F-15', 'f-15', 'f15loada', '1'], ['2', 'F-16', 'f-16gray', 'f16loada', '1'],
        ['3', 'F/A-18', 'f-18', 'f18loada', '1'], ['4', 'C-130', 'c130des', '(vide)', '0'],
        ['5', 'F-22', 'f-22', 'f22load', '1'], ['6', 'YF-23', 'yf23', 'yf23load', '1'],
        ['7', 'A-10', 'a-10', '(vide)', '1'], ['8', 'E-3', 'awacs', '(vide)', '0'],
        ['9', 'Tornado', 'torncg', 'tornload', '1'], ['10', 'Mirage 2000', 'mirage', 'mirloada', '1'],
        ['11', 'Lear Jet', 'learjet', '(vide)', '0'], ['12', '747', '747', '(vide)', '0'],
        ['13', 'MiG-21', 'mig21', 'm21loada', '1'], ['14', 'MiG-29', 'mig29', 'm29loada', '1'],
        ['15', 'Su-27', 'su27', 'sumload', '1'], ['16', 'TU-95', 'tu-20', 'tu20load', '0'],
    ], num=(0, 4)) + '<p>Drapeau à 1 : pilote CAST au niveau choisi, programme de mise à jour 1 (attaquer le joueur), '
    'vitesse 200. À 0 : pilote « target », programme 2 (aller au point 18), vitesse 100. Deux dwords de la table '
    '(octets 6 à 13) ne sont pas lus par ce segment.</p>\n'))

P2.append(card('trn-mission', '17', 'La mission produite : instant.iff', f'''
<p><code>Training_BuildInstantMission_58EEA</code> recopie <code>MISSIONS\\TEMPLATE.IFF</code> (théâtre ARENA, 13 zones,
3 objets, 14 scènes) chunk par chunk dans <code>instant.iff</code> (répertoire courant), avec des ajouts.
Repère de libRealSpace, mètres.</p>
{_X15}
<p>Altitudes : 5000 pieds → 1525,6 m ; 15000 → 4576,9 m ; 25000 → 7628,1 m ; 35000 → 10679,4 m. Le premier avion
est à 14000 m du joueur sur l'axe x, cap opposé (libRealSpace : <code>yaw = 360 − cap</code>).</p>
<p>Programme 3 du modèle, joué à chaque destruction :</p>
{_X16}
<p>Stock d'armes posé avant l'écran d'armement : SWINDERJ 6, SWINDERM 6, AGM-65D 12, DURANDAL 12, MK20 24, MK82 24,
GBU-15G 4, POD 8, AMRAAM 6. <code>op2misn.iff</code> reçoit le nom de mission « instant » (et « arena », 21 à la place
des valeurs de <code>GAMEFLOW.IFF</code>).</p>
<p>Contrôle : <code>tools/instant_mission.py</code> reproduit la construction ; les fichiers produits sont lus sans
erreur par <code>RSMission</code> (version modifiée de <code>tools/mission_ref</code>). Référence complète :
<code>analysis/TRAINING_MISSION.md</code>.</p>
'''))

TOC = [('alt-ouverture', '1', 'ALT+O'), ('alt-methode', '2', 'Méthode de dessin'), ('alt-principal', '3', 'Panneau principal'),
       ('alt-detail', '4', 'DETAIL'), ('alt-flight', '5', 'FLIGHT'), ('alt-gameplay', '6', 'GAMEPLAY'),
       ('alt-cockpit', '7', 'COCKPIT'), ('alt-cameras', '8', 'CAMERAS'), ('alt-audio', '9', 'AUDIO'),
       ('alt-exit', '10', 'EXIT GAME'), ('alt-jauges', '11', 'Jauges, points ouverts'),
       ('trn-ensemble', '12', 'Training : enchaînement'), ('trn-fichiers', '13', 'Fichiers'),
       ('trn-ecrans', '14', 'Les écrans'), ('trn-detail', '15', 'Écran par écran'),
       ('trn-avions', '16', 'Table des avions'), ('trn-mission', '17', 'instant.iff')]


def main():
    toc = ''.join(f'    <li><a href="#{i}"><span>{n}</span><span>{t}</span></a></li>\n' for i, n, t in TOC)
    page = f'''<!doctype html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Options et entraînement</title>
<style>{style()}</style>
</head>
<body>
<div class="wrap">
<nav class="toc" aria-label="Sommaire">
  <h2>Sommaire</h2>
  <ol>
{toc}  </ol>
</nav>
<main>
<header class="top">
  <div class="eyebrow">STRIKE.EXE · OPTEST.EXE · écrans</div>
  <h1>Panneau CONFIGURATION (ALT+O) et TRAINING MISSION</h1>
  <p>Quelles images de quels fichiers, à quelles positions, pour construire chaque écran ; et, pour l'entraînement,
  la mission préparée pour STRIKE.EXE. Nombres en décimal, positions en pixels de l'écran 320 × 200, positions du
  monde en mètres dans le repère de libRealSpace (Y = altitude).</p>
  <ul class="chips">
    <li><b>8</b> écrans ALT+O</li>
    <li><b>8</b> écrans d'entraînement</li>
    <li><b>16</b> avions</li>
    <li><b>3</b> groupes au plus</li>
  </ul>
</header>
{''.join(P1)}{''.join(P2)}</main>
</div>
</body>
</html>
'''
    out = os.path.join(ROOT, 'OPTIONS_TRAINING.html')
    with open(out, 'w', encoding='utf-8') as f:
        f.write(page)
    print('écrit', out, len(page), 'octets')


if __name__ == '__main__':
    main()
