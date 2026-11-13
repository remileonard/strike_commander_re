# Outils du rapport de mission de Pacific Strike

Rédigé le 2026-11-13. Ces outils ont servi à produire `PACIFIC_MISSION_PRLH-M1.html` (première mission,
« Scramble ») et `DEBUG_A_TRAITER.md`. Ils lisent directement `PACIFIC.DAT` ; aucune donnée du jeu n'est dans le dépôt.

| Outil | Rôle | Sortie |
|---|---|---|
| `tools/ps_mission_dump.py` | lit un fichier de mission et désassemble ses programmes | texte, et JSON avec `--json` |
| `tools/ps_mission_map.py` | dessine la mission sur le terrain | 3 images PNG |
| `tools/conv_doc_images.py --embarquer` | intègre les images dans une page HTML (outil existant) | la page modifiée sur place |
| `tools/ps_mission_viewer.py` | application autonome (Tkinter) : carte et scripts de n'importe quelle mission | fenêtre (§ 4) |
| `tools/ps_mission_data.py` | lecture commune à la visionneuse : archive, terrain, renvois entre objets, scènes, programmes et variables | — |

Dépendances : Python 3, `numpy` et `PIL` (cartes seulement), police DejaVu (`/usr/share/fonts/truetype/dejavu/`) ;
modules du dépôt `sc_data`, `object_render`, `pkware_dcl`, `terrain_map`, `tri_map`.

Repère de toutes les sorties : libRealSpace, en mètres, **x = c0, y = c2 (altitude), z = −c1** ; le nord est vers −Z.

---

## 1. Chaîne de fabrication du rapport

```
python3 tools/ps_mission_dump.py PACIFIC.DAT PRLH-M1 --json prlh-m1.json > prlh-m1.txt
python3 tools/ps_mission_map.py PACIFIC.DAT PRLH-M1 dossier_images
cp dossier_images/prlh-m1_terrain.png analysis/pacific/images/ps_prlh-m1_terrain.png
cp dossier_images/prlh-m1_carte.png analysis/pacific/images/ps_prlh-m1_carte.png
cp dossier_images/prlh-m1_base.png analysis/pacific/images/ps_prlh-m1_base.png
python3 tools/conv_doc_images.py --embarquer analysis/pacific/PACIFIC_MISSION_PRLH-M1.html
```

1. `ps_mission_dump.py` donne tout le contenu de la mission : zones, points, objets, scènes, messages, programmes.
2. `ps_mission_map.py` dessine les trois cartes.
3. La page HTML est **écrite à la main** à partir du texte et du JSON : mise en page et feuille de style reprises de
   `PACIFIC_TERRAIN.html`, une carte (`article.card`) par partie. Les tableaux d'objets (§ 3) et d'objets des scènes
   (§ 4) ont été produits par de courts scripts Python lancés une fois sur le JSON (une ligne par objet), non gardés
   dans le dépôt.
4. Chaque image est référencée par `<img data-file="images/…" src="">` ; `conv_doc_images.py --embarquer` remplace le
   `src` par l'image en base64, pour que la page s'ouvre seule. **Le `src=""` est obligatoire** : l'outil remplace un
   `src` existant et n'en ajoute pas.

Ce qui vient d'ailleurs que les données :
- le comportement de libRealSpace (§ 8 et 9 de la page, `DEBUG_A_TRAITER.md`) : lecture du code de libRealSpace,
  branche `master` du 2026-11-11 ;
- le comportement du jeu : lecture de PACIFIC.EXE dans `analysis/pacific/annotated_segments/` ;
- les textes des messages radio : chunk `MSGS` des profils `INTEL\<nom>.IFF` (lus à la main, pas par ces outils).

---

## 2. `tools/ps_mission_dump.py`

### Usage

```
python3 tools/ps_mission_dump.py PACIFIC.DAT PRLH-M1
python3 tools/ps_mission_dump.py PACIFIC.DAT PRLH-M1 --json prlh-m1.json
```

Le premier argument est l'archive (`PACIFIC.DAT`), le second le nom de la mission, sans extension : l'outil lit
`DATA/MISSIONS/<NOM>.IFF`. Le texte va sur la sortie standard ; `--json` écrit en plus toute la mission dans un fichier.

### Lecture des chunks

| Chunk | Lecture |
|---|---|
| `AREA` | forme (1 octet : `S`, `C` ou `B`), nom (32 octets), point de référence 3 × int32 ÷ 256, puis 1 (`S`), 2 (`C`) ou 5 (`B`) int32 ÷ 256 |
| `SPOT` | 14 octets : mot de zone (65535 = aucune), décalage 3 × int32 ÷ 256 |
| `CAST` | noms de 9 octets |
| `PART` | 62 octets (`IMPL_MISSION_PART.md` § 1) |
| `SCNE` | en-tête de 24 octets, puis une liste de mots |
| `MSGS` | textes terminés par 0 |
| `LOAD` | noms de 9 octets |
| `TEAM` | mots |
| `PROG` | instructions ; un mot nul ferme un programme |
| `NAME`, `WRLD/FILE`, `TUNE` | nom, monde, musique |

Champs de `PART` rendus :

| Octets | Champ JSON | Contenu |
|---|---|---|
| 0-1 | `numéro` | octet 0 = rang dans `CAST` ; c'est le numéro qu'utilisent les scripts |
| 2-9 | `nom` | objet (`OBJECTS\<nom>.IFF`) |
| 10-17 | `détruit` | objet détruit |
| 18-25 | `emport` | emport imposé |
| 26-27 | `zone` | 65535 = aucune |
| 28 | `placement` | 0 = dans la zone |
| 29-40 | `décalage` | 3 × int32 ÷ 256 |
| 41-42 | `cap` | degrés |
| 43-44 | `vitesse` | valeur du fichier |
| 45 | `camp` | 1 = américain, 255 = japonais dans PRLH-M1 |
| 46 | `allié` | numéro de l'objet suivi, 255 = aucun |
| 48-53 | `formation` | 3 mots |
| 54-61 | `scripts` | 4 mots : activation, mise à jour, destruction, début de mission (65535 = aucun) |

Champs de `SCNE` rendus : `actif` (octet 0), `zone` (octets 1-2), `scripts` (activation, mise à jour, sortie),
`arrivée` (octet 9), `cap_arrivée`, `point_arrivée` (3 × int32 ÷ 256), `objets` (mots = **rangs** dans `PART`).
Le rôle de l'arrivée n'a pas été relu.

### Position dans le monde

Pour un point `SPOT` qui a une zone, et pour un objet `PART` placé dans une zone (`placement` 0, zone valide) :
**monde = décalage + point de référence de la zone**. Sinon, monde = décalage. Le JSON garde les deux (`décalage` et
`monde`).

### Programmes

Règles de lecture de PACIFIC.EXE (`README.md` § 6) :
- une instruction = 1 octet de numéro, 1 octet d'argument ;
- jusqu'à 3 arguments de plus, chacun précédé de l'octet 9 ;
- les 22 instructions de variable (17, 18, 33, 34, 35, 37, 38, 39, 41, 43, 45, 47, 49, 66, 67, 69, 80, 81, 82, 83, 85,
  86) prennent un octet de plus (octet haut du numéro de variable) puis l'octet 5 ;
- un mot nul ferme le programme en cours.

Chaque instruction est rendue avec son octet de départ dans le chunk, son numéro, son nom et ses arguments. Les noms
viennent de `SCenums.h` de libRealSpace et des noms proposés de `MISSION_SCRIPT_OPCODES.md` et du `README.md` de
Pacific (130 = `OP_IS_SCENE_ACTIVE`) ; une instruction sans nom s'écrit `OP_<numéro>`.

### Format JSON

```
{
 "nom", "monde", "musique",
 "zones":      [{"rang", "forme", "nom", "ref": [x, y, z], "valeurs": [...]}],
 "points":     [{"rang", "zone", "décalage": [x, y, z], "monde": [x, y, z]}],
 "cast":       ["NULL", "JAP-V", ...],
 "objets":     [{"rang", "numéro", "cast", "nom", "détruit", "emport", "zone", "placement",
                 "décalage", "monde", "cap", "vitesse", "camp", "allié", "formation", "scripts"}],
 "scènes":     [{"rang", "actif", "zone", "scripts", "arrivée", "cap_arrivée", "point_arrivée", "objets"}],
 "messages":   [...],
 "load":       [...],
 "team":       [...],
 "programmes": [[[octet, numéro, nom, [arguments]], ...], ...]
}
```

`valeurs` d'une zone : pour `C`, hauteur puis rayon ; pour `S`, rayon ; pour `B`, les 5 valeurs du fichier.

### Rang et numéro

Deux façons de désigner un objet coexistent dans les fichiers ; les sorties de l'outil gardent les deux :
- le **numéro** (octet 0 du `PART`) : `OP_ACTIVATE_OBJ`, `OP_SET_OBJ_DESTROY_TARGET`, `OP_SET_OBJ_FOLLOW_ALLY`… ;
- le **rang** (place dans `PART`) : listes d'objets des scènes, chunk `TEAM`.

---

## 3. `tools/ps_mission_map.py`

### Usage

```
python3 tools/ps_mission_map.py PACIFIC.DAT PRLH-M1 dossier_images
```

Écrit trois images dans le dossier :

| Fichier | Contenu | Échelle |
|---|---|---|
| `<mission>_terrain.png` | l'île et le cadre de la carte de mission | 6 pixels par km |
| `<mission>_carte.png` | zones, points, objets et trajets | 22 pixels par km |
| `<mission>_base.png` | agrandissement de la base aérienne | 400 pixels par km |

### Terrain

- Fichier `TERRAIN\<monde>.ZIP` (monde lu dans le chunk `WRLD/FILE`), décompressé par `pkware_dcl.explode`.
- Altitudes `ELV` (`terrain_map.read_elevations`, `terrain_map.assemble`) : 18 × 18 cellules de 20 × 20 sommets,
  1000 m entre deux sommets, carte centrée sur 0.
- Altitude d'un point : interpolation bilinéaire entre les 4 sommets voisins (`Terrain.sample`) ; ligne 0 de la grille
  au nord, colonne 0 à l'ouest.
- Pour la lecture seulement, le relief est lissé (moyenne glissante d'environ 700 m, deux passes par axe,
  fonction `smooth`), puis ombré ; les couleurs d'altitude sont celles de `terrain_map.hypso`.
- Pistes : régions `.TRI` du terrain (`tri_map.read_region_ps`), dessinées par leur rectangle englobant.

**Orientation.** Le nord est en haut, c'est −Z en libRealSpace. Constat sur PRLH-M1 : la région `.TRI` de la piste
d'Ewa est en c1 = −36 819 à −35 220, et l'objet `RWAYS` de la mission en z = +36 670 ; l'image du terrain montre
Pearl Harbor au sud d'Oahu.

### Ce que montre la carte

| Élément | Dessin |
|---|---|
| zone | cercle en tirets (rayon de la zone), étiquette « zone n « nom » — scène k » |
| point `SPOT` | losange blanc, étiquette « SPOT n » (points 2, 4, 5 et 6 sur la carte, 0 et 1 sur l'agrandissement) |
| avion | triangle orienté selon le cap (0 = nord, sens horaire) |
| navire | flèche orientée selon le cap |
| bâtiment | carré |
| couleur | rouge = camp 255, bleu = camp 1 |
| joueur | contour jaune et cercle |

### Parties propres à PRLH-M1

L'outil prend n'importe quelle mission pour le terrain, les zones et les objets, mais plusieurs éléments sont **écrits
pour PRLH-M1** et sont à adapter pour une autre mission :

| Élément | Valeur dans le code |
|---|---|
| plan de vol du joueur (flèches blanches, étapes ① à ④) | `SPOT` 1 → 4 → 2 → 1, d'après le programme 0 |
| route du Nevada (flèches noires) | objet n°23 → `SPOT` 5 → `SPOT` 6, d'après le programme 15 |
| cible des torpilleurs (flèches rouges) | n°27 et 28 → n°23, d'après le programme 10 |
| étiquettes groupées | F4F3 n°40 et plus (« n°40 à 47 »), KATE et KATETORP (« n°27 à 35 ») |
| décalages d'étiquettes | VAL n°3 et 4, HANGAR n°11 |
| fenêtre de la carte | x de −29 000 à 20 000, nord de −56 000 à −12 000 |
| fenêtre de l'agrandissement | x de −15 000 à −12 800, z de 35 050 à 37 050 |
| fenêtre de l'île | x de −60 000 à 60 000, nord de −75 000 à 25 000 |

Dans l'agrandissement, les objets serrés du bout de piste (`SPOT` 0 et 1, pistes `RWAY*`, les F4F3) sont étiquetés
dans une colonne à gauche, avec un trait de rappel.

### Classes et fonctions

| Nom | Rôle |
|---|---|
| `Terrain` | lit le terrain et les pistes ; `sample(x, nord)` rend l'altitude |
| `View` | fenêtre de la carte ; `px(x, z)` convertit une position libRealSpace en pixel |
| `terrain_image` | image du relief d'une fenêtre |
| `kind` | classe de dessin d'un objet (avion, navire, piste, bâtiment) d'après son nom |
| `draw_object` | dessine un objet et son étiquette |
| `spot_marker` | dessine un point `SPOT` |
| `render_island`, `render_overview`, `render_base` | les trois images |

---

## 4. `tools/ps_mission_viewer.py` : visionneuse des missions

Application autonome (fenêtre Tkinter, ni serveur ni navigateur). Elle ouvre `PACIFIC.DAT` en lecture seule et
montre n'importe laquelle des 51 missions.

### Lancer

```
python3 tools/ps_mission_viewer.py PACIFIC.DAT
python3 tools/ps_mission_viewer.py PACIFIC.DAT --mission MDWY-M1
python3 tools/ps_mission_viewer.py
```

Sans argument, `PACIFIC.DAT` se choisit par le menu **Fichier → Ouvrir PACIFIC.DAT…**. Mission par défaut : `PRLH-M1`.

Dépendances : `tkinter` (fourni avec Python sous Windows et macOS ; sous Linux, paquet `python3-tk`), `numpy`,
`PIL` avec `ImageTk` (sous Linux, paquet `python3-pil.imagetk`). Fichiers du dossier `tools/` utilisés :
`ps_mission_data.py`, `ps_mission_dump.py`, `sc_data.py`, `object_render.py`, `pkware_dcl.py`, `terrain_map.py`,
`tri_map.py`. Essayé avec Python 3.12 sous Linux.

### La fenêtre

| Zone | Contenu |
|---|---|
| barre du haut | choix de la mission (« nom — titre »), calques : relief, pistes, zones, points `SPOT`, objets, étiquettes, liens des scripts, objets jamais activés |
| liste de gauche | les objets, une ligne par objet : numéro, objet, `CAST`, camp |
| carte | terrain, pistes, zones, points, objets |
| onglet **Objet** | vue 3D du modèle (boutons ◀ ▶ : tourner de 45°), champs du `PART`, sol sous l'objet, profil `INTEL` (messages radio ; `GOAL`, `MVRS`, `ATRB` si le profil a un FORM `_AI_`), ce qui l'active, ses 4 scripts |
| onglet **Scènes** | une ligne par scène ; une scène choisie : ses objets (rang → numéro) et ses 3 scripts ; sa zone et ses objets sont surlignés sur la carte |
| onglet **Zones et points** | zones (forme, centre, valeurs) ; points `SPOT` avec position et emplois dans les programmes |
| onglet **Programmes** | un programme : qui le lance (objet et rôle du script, scène, `OP_EXEC_SUB_PROG`) et son désassemblage |
| onglet **Variables** | pour chaque variable : programmes qui l'écrivent, programmes qui la lisent |
| onglet **Mission** | nom, monde, terrain, musique, messages `MSGS`, objets de `LOAD`, équipe `TEAM` |
| barre du bas | sous le pointeur : x, z, altitude du sol (sans lissage), échelle |

Dans les textes, les renvois soulignés se cliquent : un objet (le choisit et centre la carte), un point (centre la
carte), un programme, une variable, une scène.

### Commandes de la carte

| Geste | Effet |
|---|---|
| molette | zoom autour du pointeur |
| glisser | déplacer |
| clic | choisir l'objet le plus proche (14 pixels au plus) |
| double-clic | revenir à la vue de toute la mission |

### Dessin

| Élément | Dessin |
|---|---|
| zone | cercle (`C`, `S`) ou rectangle (`B`) en tirets, étiquette « zone n « nom » — scène k » |
| point `SPOT` | losange blanc ; un point employé seulement dans le repère d'un objet (`OP_SPAWN_EFFECT_ON_OBJ`, `OP_FIRE_AT_SPOT` point de départ, `OP_LAUNCH_FROM_OBJ`) n'est pas dessiné |
| objet de classe `JETP` | triangle orienté selon le cap |
| objet de classe `SHIP` ou `CARR` | flèche orientée selon le cap |
| objet sans fichier objet (pistes `RWAY*`) | trait |
| autre objet | carré |
| couleur | rouge = camp 255, bleu = camp 1, gris = autre camp |
| objet cité par aucune scène ni `OP_ACTIVATE_OBJ` | contour seul (calque « Objets jamais activés ») |
| joueur | cercle jaune |
| objet choisi | cercle jaune épais et son nom |
| liens de l'objet choisi | traits blancs en tirets vers les points de navigation de ses scripts, dans l'ordre ; flèches orange vers les objets visés |

Liens tirés des scripts (en suivant `OP_EXEC_SUB_PROG`) :
- points : `OP_SET_OBJ_TAKE_OFF`, `OP_SET_OBJ_LAND` (deux points), `OP_SET_OBJ_FLY_TO_WP`, `OP_DIST_TO_SPOT` ;
- objets : `OP_ACTIVATE_OBJ`, `OP_DEACTIVATE_OBJ`, `OP_IS_TARGET_ALIVE`, `OP_INSTANT_DESTROY_TARGET`,
  `OP_DIST_TO_TARGET`, `OP_IS_TARGET_ACTIVE`, `OP_SET_OBJ_DESTROY_TARGET`, `OP_SET_OBJ_DEFEND_TARGET`,
  `OP_SET_OBJ_FOLLOW_ALLY`, `OP_SET_OBJ_DESTROY_TARGET_B`, `OP_JOIN_PLAYER_TEAM`, `OP_LEAVE_PLAYER_TEAM`,
  `OP_PACIFY_TARGET` (255 = l'objet lui-même, pas de lien).

Classe et `KIND` d'un objet : FORM de classe sous `REAL/OBJT` et premier octet du chunk `KIND` de
`OBJECTS\<nom>.IFF`. Un objet placé par rapport au joueur (`placement` non nul) n'est pas dessiné : sa position dépend
de l'avion du joueur.

### Vue 3D et profil d'IA

**Vue 3D.** Modèle de `OBJECTS\<nom>.IFF`, niveau de détail 0, vu à 20° au-dessus, depuis le cap choisi (35° au
départ, ± 45° par bouton). Lecture du format de Pacific : `tools/ps_object_render.py` (constaté sur les données, pas
relu dans PACIFIC.EXE) ; dessin : `tools/object_render.py` (règles de Strike Commander, lumière de `MISSION.IFF` de
Strike Commander). Palette : `PALETTE\PALETTE.IFF` de `PACIFIC.DAT`. Les textures sont dessinées ; le brouillard non ;
une texture animée (`TXMA`, l'hélice) n'est dessinée qu'avec sa première image.
Numérotation des faces (corrigée le 2026-11-13) : dans l'ordre des FORM du fichier, traits, puis triangles, puis
quadrilatères ; la forme de chaque numéro est lue dans `ATTR`. La première version prenait les triangles d'abord : les
listes `LVL` étaient décalées du nombre de traits, d'où des faces manquantes (aile gauche du F4F3, hélice).
Un objet sans fichier (pistes `RWAY*`) n'a pas de vue. Essai : les 82 noms d'objets des 51 missions se dessinent.

**Profil d'IA** (FORM `_AI_` de `INTEL\<CAST>.IFF`) :

| Chunk | Affichage |
|---|---|
| `GOAL` | les valeurs, dans l'ordre du fichier |
| `MVRS` | les paires (numéro de manœuvre, valeur signée) telles qu'elles sont dans le fichier ; leur sens n'a été relu que dans STRIKE.EXE (`AI_SYSTEM.md` § 3) |
| `ATRB` | les octets du fichier, avec leur rang ; rôle non relu dans PACIFIC.EXE |

### Pseudo-code des scripts

Choix **Scripts : pseudo-code / désassemblage** de la barre du haut ; il s'applique aux onglets Objet, Scènes et
Programmes. En ligne de commande :

```
python3 tools/ps_mission_data.py PACIFIC.DAT PRLH-M1        (tous les programmes)
python3 tools/ps_mission_data.py PACIFIC.DAT PRLH-M1 14     (le programme 14)
```

Notation :

| Écrit | Sens |
|---|---|
| `WORK` | registre de travail du script |
| `var[n]` | variable n (mot en dessous de 256, bit à partir de 256) |
| `LABEL_65:` | étiquette 65 (`OP_SET_LABEL 65`) |
| `goto LABEL_90;` | `OP_BRANCH 90`, ou saut conditionnel resté tel quel |
| `goto LABEL(WORK);` | `OP_EXECUTE_CALL` : saut à l'étiquette égale à `WORK` |
| `ordre_en_cours` | état de l'ordre en cours, testé par `OP_GOTO_IF_CURRENT_COMMAND_IN_PROGRESS` et `OP_GOTO_IF_CURRENT_COMMAND_DONE` |
| `scène_active(zone n)` | `OP_IS_SCENE_ACTIVE n` |
| `appeler programme n;` | `OP_EXEC_SUB_PROG n` |
| `return;` | `OP_EXIT_PROG` |
| `OP_NOM(arguments);` | toute autre instruction, arguments objet (`n°23 BB`), point (`SPOT 4`) ou nombre |

Règles de traduction (sens des instructions d'après `SCProg` et `PSProg` de libRealSpace) :
1. Une comparaison se fond dans le saut qui la suit. `OP_CMP_WORK_WITH_VALUE n` puis `OP_BRANCH_IF_LESS x` devient
   `if (WORK < n) goto LABEL_x;` : la comparaison se lit dans l'ordre du nom de l'instruction (`WORK` comparé à `n`).
   `OP_TEST_FLAG v` puis `OP_BRANCH_IF_EQUAL x` devient `if (var[v] != 0) goto LABEL_x;` (« égal » = variable non nulle).
   Une comparaison qui n'est suivie d'aucun saut n'est pas écrite (elle ne change que l'état de comparaison).
2. L'état de comparaison est oublié à chaque étiquette : un saut juste après une étiquette s'écrit avec le bit de la
   dernière comparaison, sans relation.
3. `if (c) goto LABEL_x; A… LABEL_x:` avec `LABEL_x` plus loin et aucune étiquette entre les deux devient `if (!c) { A… }`.
4. Si le bloc `A…` finit par `goto M;` vers une étiquette `LABEL_y` plus loin, sans étiquette entre `LABEL_x` et `LABEL_y`, et si
   aucun autre saut ne mène à `LABEL_x` : `if (!c) { A… } else { B… }`.
5. Une étiquette n'est écrite que si un saut y mène encore. Dans un programme qui fait `OP_EXECUTE_CALL`, toutes les
   étiquettes restent écrites : le saut est calculé, n'importe laquelle peut être visée.
6. Les blocs s'emboîtent : les règles 3 et 4 s'appliquent aussi à l'intérieur d'un bloc.

Le pseudo-code ne simplifie rien d'autre : `WORK = 66; var[6] = WORK;` reste en deux lignes, car `WORK` garde sa valeur pour
la suite du programme.

Exemple, programme 14 de PRLH-M1 (activation de la scène 2) :

```
    var[666] = 1;
    WORK = 66;
    var[6] = WORK;
    var[280] = 1;
    WORK = var[3];
    if (WORK <= 67) {
        OP_ACTIVATE_OBJ(n°27 KATE);
        OP_ACTIVATE_OBJ(n°28 KATETORP);
        WORK = 69;
        var[3] = WORK;
        WORK = 88;
        var[6] = WORK;
        return;
    }
    WORK = var[0];
    if (WORK != 3) {
        if (WORK == 2) goto LABEL_67;
        return;
    }
    OP_ACTIVATE_OBJ(n°31 KATETORP);
LABEL_67:
    OP_ACTIVATE_OBJ(n°30 KATETORP);
```

Textes des messages. Chaque `OP_SET_MESSAGE n` est suivi, en commentaire gris (pseudo-code et désassemblage), du
texte que libRealSpace afficherait :
- objet autre que le joueur : message n du chunk `RADI/MSGS` de son profil `INTEL\<CAST>.IFF`
  (`SCMissionActors::setMessage`) ;
- joueur, et scripts de scène (joués avec le joueur comme acteur dans libRealSpace) : texte n du chunk `MSGS` de la
  mission (`SCMissionActorsPlayer::setMessage`) ;
- programme affiché seul (onglet Programmes) : un texte par objet qui peut le jouer, en remontant
  `OP_EXEC_SUB_PROG` ;
- message absent : « (pas de message n dans INTEL\<CAST>.IFF) ». Exemple, PRLH-M1 : le programme 42 (destruction du
  Nevada) demande le message 21, absent de `INTEL\BB-NEV.IFF`.

Cette correspondance est celle de libRealSpace ; ce que fait `OP_SET_MESSAGE` dans PACIFIC.EXE (méthode de l'objet
appelée par `MissionScript_CallNativeHandler_53B0B`) n'a pas été lu. L'onglet Objet donne aussi le profil
complet : fichier, nom, indicatif, et tous ses messages, un par ligne.

Essai : les 2 918 programmes des 51 missions de `PACIFIC.DAT` se traduisent sans erreur.

### Limites

- Les positions dessinées sont celles du fichier (décalage + centre de la zone) : pas de simulation.
- Une instruction de variable compte comme « écriture » ou « lecture » d'après son nom ; `OP_ADD_1_TO_FLAG` et les
  autres opérations sur une variable comptent pour les deux.
- Le relief est lissé pour la lecture (comme les cartes du § 3) ; la barre du bas donne l'altitude sans lissage.

---

## 5. Limites connues

- Les noms d'instructions propres à Pacific Strike sont ceux du `README.md` de Pacific et de `PSProg` ; ceux marqués
  d'un astérisque dans la documentation sont des noms proposés.
- Le relief des cartes est lissé : il ne faut pas y lire une altitude exacte. Pour l'altitude du sol sous un point,
  utiliser `Terrain.sample` (sans lissage), comme pour le tableau du point 1 de `DEBUG_A_TRAITER.md`.
- `ps_mission_dump.py` ne vérifie pas les octets de fin d'un `PART` ni d'un en-tête `SCNE` qui n'ont pas de champ
  nommé ; leur rôle n'est pas établi.
