# TOPTTST1.EXE (Tactical Operations) — cinématiques

`TOPTTST1.EXE` est le hors-vol de *Tactical Operations*, l'extension de Strike Commander : même rôle
qu'OPTEST.EXE (campagne, conversations, cinématiques…). On n'a pas de base IDA pour cet exécutable :
le listing `source/topttst1.asm` est reconstruit par `tools/vroomm_listing.py` (capstone) au format
d'IDA, pour que les outils de l'archive le lisent avec `--exe topt`. L'exécutable lui-même et les
données du jeu ne sont pas dans le dépôt.

## 1. L'exécutable

Même compilateur (Borland C++ 1991) et même gestionnaire d'overlays VROOMM qu'OPTEST.

- Image principale de 325 888 octets, segment de données au paragraphe 18 590.
- En-tête `FBOV` juste après l'image : 489 328 octets d'overlays, table de 273 segments (drapeau 1 =
  code, 3 = relais d'overlay, 0 et 4 = données ; plusieurs entrées pour un même segment).
- 64 relais (`stubNNN`), chacun avec son overlay (`ovrNNN`). L'en-tête d'un relais donne la position
  du code dans la zone d'overlays, sa taille et celle de ses relocations ; une entrée de relais fait
  5 octets : `INT 3Fh` puis la position de la fonction dans l'overlay.
- Dans un overlay, un mot de segment relogé ne contient pas un paragraphe mais **rang dans la table
  des segments × 8** (917 appels lointains sur 925 de l'overlay de `mid1` tombent ainsi sur un début
  de fonction, le dernier sur une entrée de relais).

Le listing place les overlays après l'image, chacun aligné sur 16 octets : les adresses `sub_XXXXX`
sont propres à ce listing.

## 2. Les cinématiques

Une par overlay, 14 overlays consécutifs (`mid1` en deux parties). Fichiers : pseudo-code
`midgames/<nom>.md`, arbre `midgames/<nom>.json`, fichier ANIM `midgames/iff/`.

| Cinématique | Fonction | Segment | Scènes | Fichier IFF | Comparaison avec OPTEST |
|---|---|---|---|---|---|
| `mid1` | `Midgame1_PlayPart1_69270` puis `Midgame1_PlayPart2_70290` | `ovr200`, `ovr201` | 23 | `MID_1.IFF`, 68 998 octets | identique |
| `to1mid1` | `MidgameTO1_Play_74C00` | `ovr202` | 12 | `TO1MID1.IFF`, 13 014 octets | nouvelle |
| `to1mid2` | `MidgameTO2_Play_7ACD0` | `ovr203` | 4 | `TO1MID2.IFF`, 7 952 octets | nouvelle (§ 4) |
| `to1mid3` | `MidgameTO3_Play_7C1D0` | `ovr204` | 1 | `TO1MID3.IFF`, 1 008 octets | nouvelle |
| `mid12` | `Midgame12_Play_7CCD0` | `ovr205` | 19 | `MID_12.IFF`, 11 840 octets | identique |
| `mid14` | `Midgame14_Play_829F0` | `ovr206` | 5 | `MID_14.IFF`, 6 272 octets | pas extraite d'OPTEST |
| `mid15` | `Midgame15_Play_85FE0` | `ovr207` | 17 | `MID_15.IFF`, 30 716 octets | identique |
| `mid16` | `Midgame16_Play_8E910` | `ovr208` | 3 | `MID_16.IFF`, 2 768 octets | identique |
| `mid17` | `Midgame17_Play_91BB0` | `ovr209` | 6 | `MID_17.IFF`, 5 850 octets | identique |
| `mid20` | `Midgame20_Play_974D0` | `ovr210` | 6 | `MID_20.IFF`, 11 336 octets | identique |
| `mid33` | `Midgame33_Play_9CBE0` | `ovr211` | 8 | `MID_33.IFF`, 6 048 octets | identique |
| `mid34` | `Midgame34_Play_A8070` | `ovr212` | 7 | `MID_34.IFF`, 5 894 octets | identique |
| `mid36` | `Midgame36_Play_AEDE0` | `ovr213` | 13 | `MID_36.IFF`, 24 868 octets | identique |

« identique » : le fichier IFF produit depuis `TOPTTST1.EXE` est identique octet pour octet à celui
produit depuis OPTEST.EXE (mêmes données, données de Tactical Operations par-dessus celles de Strike
Commander). Le contenu de ces cinématiques n'a donc pas changé ; leur code, si (§ 3). Pour `mid1`,
OPTEST demandait `--remplace pri=air` (exécutable modifié à la main) : `TOPTTST1.EXE` contient
directement « air ». `MID_1.IFF` n'est plus identique octet pour octet depuis la correction faite pour
`to1mid2` (un calque dont la ressource change est coupé en deux) : 0 instant différent sur 5 629 au
contrôle, avec l'ancien comme avec le nouveau fichier.

Contrôle par `tools/midgame_check.py` (fichier relu avec les règles du lecteur de libRealSpace, comparé
au rendu de référence) : 0 instant différent pour `to1mid1`, `to1mid2` (741 instants), `to1mid3`,
`mid14` et `mid1`.

`mid2`, `mid3` et `mid5` ne sont pas dans cet exécutable.

## 3. Ce qui a changé dans le code des cinématiques reprises

Le code se recouvre à 95–97 % (suites d'instructions) avec celui d'OPTEST. Différences vues dans les
pseudo-codes :

- après chaque ouverture de PAK, un appel de plus à une fonction pas encore nommée (`sub_435F1`, rôle
  non établi) ;
- le choix des sons et des musiques selon la carte son est un `switch` sur `byte_4CA58` (valeurs 1 à
  5), au lieu d'une suite de tests ; un nouveau PAK de musiques, `mmusic`, s'ajoute à `amusic` et
  `rmusic` ;
- `VoicePlayer_IsPlaying` existe en deux copies identiques (`VoicePlayer_IsPlaying_C83C` et
  `VoicePlayer_IsPlaying_CEB0`) ; `to1mid1` utilise la seconde.

## 4. `to1mid2` : images lues à la main dans `OBJECTS\EJECT.PAK`

Déroulement : avion au-dessus des collines (`to1mid2 0`), éclair et collines rougeoyantes
(`to1mid2 2`), premier diaporama d'`EJECT.PAK` sur le fond `to1mid2 6` (entrées 5, 6, 7 : verrière,
mains du pilote sur les poignées d'éjection), second diaporama sur le fond `to1mid2 7` (entrée 2,
casque du pilote, puis entrées 0 à 4), chute et explosion de l'avion (`to1mid2 4`), écran du générique.

Les images d'`EJECT.PAK` ne passent pas par la fonction de ressources du moteur :
`Path_BuildWithFolder_11166` (« OBJECTS », « EJECT », « .PAK »), ouverture du PAK, allocation d'un
tampon, puis `IndexedRecordReader_ReadEntryInto_43519` (lecteur, entrée, tampon). `midgame_iff.py`
relève le dossier et le nom du PAK, puis l'entrée lue dans chaque tampon ; le fichier ANIM désigne ces
images par `..\..\DATA\OBJECTS\EJECT.PAK`. Entre deux images du premier diaporama,
`Surface_SaveRect_392F6` et `Surface_RestoreRect_38CDA` remettent le fond (sens déduit de l'ordre des
appels).

Entrées 0 à 4 d'`EJECT.PAK` : l'octet de poids fort des positions d'images vaut 193.
`Shape_DrawSpans_38514` ne compare que le mot bas (`cmp [si+4], bx`) : cet octet est ignoré
(`sc_data.py`).

**Animations par différences** (`to1mid2 0`, `to1mid2 2`, `to1mid1 2`) : image 0 complète, images
suivantes réduites aux pixels qui changent. Le moteur n'efface pas l'image hors écran entre deux pas de
scène ; le format ANIM, si. Pour une telle animation dessinée en premier dans sa scène,
`midgame_iff.py` écrit à l'image k les images 0 à k dans l'ordre. C'est ce qui corrige aussi le début
presque noir de `to1mid1`. Ne s'applique à aucune cinématique reprise de Strike Commander.

## 5. Points ouverts

- **Générique de `to1mid2`** : texte littéral du segment de données pas écrit dans le fichier (comme
  « THE END » de `mid33`) ; écran tenu 300 tics de 60 Hz.
- **`to1mid1`** : aucune réplique n'est jouée dans le rejeu, alors que le jeu a un `TOMIDVOC.PAK`. À
  vérifier.
- **`mid14`** : un test d'état de séquence sonore (effets sonores seuls) est pris « séquence terminée »
  par `midgame_iff.py`, faute de son simulé.
- 3 fonctions du catalogue du moteur ne sont pas portées (`CRT_MemFamily_Extra1`,
  `MovingMaskLayer_Construct_B995`, `Struct_GetElementCountMinusOne_33352`) : aucun appel aligné, elles
  ne servent pas dans les cinématiques ci-dessus.

## 6. Commandes des scripts de déroulement (`Gameflow_RunScriptPairs_63B9`)

Interpréteur des scripts `EFCT` de `GAMEFLOW.IFF` et `GAMEFLO2.IFF` (la campagne de Tactical
Operations). Comparé à `Gameflow_RunScriptPairs_36CF` d'OPTEST (`GAMEFLOW_SYSTEM.md` § 5.2 et § 8) :
**46 commandes** (`cmp bx, 2Dh`), contre 39 sur la disquette de Strike Commander et 43 sur le CD.

- **Les commandes de `PLAY_CONV` à `PLAY_GAMEFLOW_TUNE` font la même chose** que sur la disquette (relu
  cas par cas). Tous les champs de la partie sont décalés d'un octet (`[+252]` → `[+253]`, drapeau n :
  `[+253 + n]` → `[+254 + n]`, etc.). Même liste de tests comptés pendant un saut, même `OR_GROUP`.
- **`IF_MISSION_SUCCESS`** fait une chose de plus : si le code de sortie du vol vaut 2 (`[+249]`) et que
  le drapeau 88 est posé (`[+342]`), la 7ᵉ valeur de `STAT` (`[+983]`) est mise à 1 :

  ```
  cmp byte ptr [si+0F9h], 2
  jnz short loc_6728
  cmp byte ptr [si+156h], 1
  jnz short loc_6728
  mov byte ptr [si+3D7h], 1
  ```
- **`SAVE_GAME`** sauvegarde ensuite dans `gensave.tm1` (et non `gensave.tmp`).
- **Compte rendu de vol** (`Gameflow_ReadMissionResult_50D85`) : 7 valeurs de `STAT` lues — succès,
  gain, puis 3ᵉ à 6ᵉ dans `[+984]` à `[+987]`, 7ᵉ dans `[+983]`.

| Valeur | Nom | `GAMEFLO2.IFF` | Effet dans Tactical Operations |
|---|---|---|---|
| 37 | `IF_RESULT_3` | 6 | test : `[+984]` ≠ 0 (3ᵉ valeur de `STAT`) |
| 38 | `PLAY_GAMEFLOW_TUNE` | 8 | morceau n de `gameflow.dat`, gardé en `[+988]` |
| 39 | `IF_RESULT_4` | 1 | test : `[+985]` ≠ 0 (4ᵉ valeur de `STAT`) |
| 40 | `IF_RESULT_5` | 0 | test : `[+986]` ≠ 0 (5ᵉ valeur de `STAT`) |
| 41 | `IF_RESULT_6` | 0 | test : `[+987]` ≠ 0 (6ᵉ valeur de `STAT`) |
| 42 | `IF_RESULT_7` (CD : `IF_LOADED_FLAG`) | 6 | test : `[+983]` ≠ 0 (7ᵉ valeur de `STAT`, ou 1 posé par `IF_MISSION_SUCCESS`) |
| 43 | `WEAPON_LOADOUT_ALT` (nom proposé) | 6 | **second écran d'armement** (`Gameflow_WeaponLoadoutAlt_58DEB`) ; test comme `WEAPON_LOADOUT` |
| 44 | `RESTORE_PILOT` (nom proposé) | 2 | remet le pilote n au tableau des victoires (`[+676 + n × 26]` = 1, n < 8) : inverse de `REMOVE_PILOT` |
| 45 | `SHOW_KILL_MARKS_ALT` (nom proposé) | 16 | **second écran des marques de victoires** (`Gameflow_ShowKillMarksAlt_56D57`), même condition que `SHOW_KILL_MARKS` |

`GAMEFLOW.IFF` de Tactical Operations est identique à celui de Strike Commander (aucune commande
au-delà de 38). Les commandes 39 à 45 ne servent que dans `GAMEFLO2.IFF`.

**Second écran d'armement (`WEAPON_LOADOUT_ALT`).** Même code que `WEAPON_LOADOUT`
(`Gameflow_WeaponLoadout_584A6`), avec ses propres plages de points d'emport
(`Gameflow_ApplyDefaultLoadoutAlt_58223`) :

| Arme | Points d'emport | Maximum par côté |
|---|---|---|
| 0 AIM-9J, 1 AIM-9M | 0 | 1 |
| 8 AIM-120 | 1 | 1 |
| autres | début 0, fin 255 | 0 |

Au départ en vol, l'écran d'armement ordinaire pose `[+6]` = 0 et le second `[+6]` = 1 (champ nouveau
par rapport à OPTEST ; son lecteur n'a pas été cherché). Dans `GAMEFLO2.IFF`, `WEAPON_LOADOUT_ALT` a
toujours l'argument 0 : chunk `LOAD` 0 = AIM-9M × 2, AIM-120 × 2. Les données l'emploient ainsi (mission
0) :

```
SELECT_MISSION 0
PLAY_CONV 5
WEAPON_LOADOUT_ALT 0
SET_FLAG 45
SET_FLAG 88
```

et la mission ordinaire voisine pose `CLEAR_FLAG 88` après `WEAPON_LOADOUT`. Au retour, le script de
mission choisit l'écran des marques d'après ce drapeau :

```
IF_NOT_FLAG 88
SHOW_KILL_MARKS 0
ELSE 0
SHOW_KILL_MARKS_ALT 0
ENDIF 0
```

**Second écran des marques (`SHOW_KILL_MARKS_ALT`).** Même code que `Gameflow_ShowKillMarks_5638A`,
avec en plus `GAMEFLOW\OPTSHPS2.PAK` et `GAMEFLOW\OPTPALS2.PAK` et d'autres entrées d'images.

## 7. Outils et commandes

```
python3 tools/vroomm_listing.py TOPTTST1.EXE source/topttst1.asm
python3 tools/build_function_index.py --exe topt
python3 tools/match_functions.py --from strike --to topt --write
python3 tools/match_functions.py --from optest --to topt --write
cd tools && python3 midgame_engine_port.py --from optest --to topt && cd ..
python3 tools/build_function_index.py --exe topt
python3 tools/annotate_segments.py --exe topt
python3 tools/midgame_extract.py --exe topt MidgameTO1_Play_74C00 --name to1mid1
python3 tools/midgame_iff.py analysis/topt/midgames/to1mid1.json TO1MID1.IFF --donnees <DATA>
python3 tools/midgame_render.py --donnees <DATA> --exe topt --nom to1mid1 --film to1mid1.gif
```

`<DATA>` : dossier `DATA` de Strike Commander avec celui de Tactical Operations par-dessus
(`tools/tre_extract.py` sur `BIGTRE.TRE` puis sur `TOBIGTRE.TRE`).

- `tools/vroomm_listing.py` : listing au format IDA. Fonctions trouvées par parcours des branchements
  (point d'entrée, entrées de relais, cibles d'appels, pointeurs lointains du segment de données), code
  mort après un `ret` décodé comme chez IDA, fin de fonction au dernier octet atteint, variables de
  pile `var_X` / `arg_X` (un accès qui tient dans une variable plus grande s'écrit `variable+décalage`),
  chaînes et tables passées après `push ds` en `offset`, tables de `switch` (par indice et par
  recherche).
- `tools/match_functions.py --from optest --to topt` : 247 fonctions identiques et 207 de même suite
  d'instructions reprises d'OPTEST (plus celles de STRIKE).
- `tools/midgame_engine_port.py` : porte `midgame_engine.json` d'OPTEST (90 fonctions sur 93, 17
  tables de méthodes sur 18) en alignant les 10 paires de cinématiques reprises : appels, constantes de
  tables de méthodes et variables globales aux mêmes positions. Écrit aussi les équivalents de noms
  (`equivalents`) qu'utilise `midgame_iff.py` pour traduire ses hypothèses (`word_4684B` →
  `word_4CA5B` : voix présente ; `byte_46848` → `byte_4CA58` : carte son ; `byte_495FC` →
  `byte_4F55C` ; `sub_6734` → `sub_993C` : fichier présent).
- `tools/midgame_extract.py` : un `switch` par table devient une suite de sauts conditionnels.
- `tools/midgame_iff.py` : PAK de musiques `mmusic` ; état de séquence sonore inconnu pris terminé
  (`mid14`) ; pour `to1mid2` : état de lecture d'un PAK pris sans erreur, PAK et entrées lus à la main,
  sauvegarde et restauration de l'écran, dessins directs visibles pendant une attente ; animations par
  différences ; calque coupé quand sa ressource change ; nom unique d'un dessin direct déjà affiché.
- `tools/midgame_extract.py` (suite) : une scène dont la zone de pile chevauche une autre est reprise
  de la 1re passe (`to1mid2`, scène 4).
- `tools/midgame_render.py` : option `--exe`.

Correction au passage dans le catalogue d'OPTEST : `Render_MeasureOrDrawTextString_32CD8` y portait
l'ancien nom de `Shape_DrawSpans_32CD8` ; une nouvelle extraction d'OPTEST aurait perdu les dessins
directs (`dessine_image`).
