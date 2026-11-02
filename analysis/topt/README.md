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
| `mid1` | `Midgame1_PlayPart1_69270` puis `Midgame1_PlayPart2_70290` | `ovr200`, `ovr201` | 23 | `MID_1.IFF`, 40 912 octets | identique |
| `to1mid1` | `MidgameTO1_Play_74C00` | `ovr202` | 12 | `TO1MID1.IFF`, 7 402 octets | nouvelle |
| `to1mid2` | `MidgameTO2_Play_7ACD0` | `ovr203` | 4 | pas de fichier (§ 4) | nouvelle |
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
directement « air ».

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

## 4. Points ouverts

- **`to1mid2`** (générique de fin, « THE END », `credits`) : la cinématique ouvre elle-même
  `OBJECTS\EJECT.PAK`, se place sur une entrée (`IndexedRecordReader_AdvanceIndex_436B6`), alloue un
  tampon et y lit l'image (`sub_43519`), sans passer par la fonction de ressources du moteur.
  L'extracteur ne sait pas quelles images sont dessinées (`données(v48)`) : pas de fichier IFF. Ordre
  lu dans le pseudo-code : entrée 2 en plein écran, puis entrées 0 à 4 avec une attente entre chaque,
  puis entrées 5 à 7.
- **`to1mid1`** : aucune réplique n'est jouée dans le rejeu, alors que le jeu a un `TOMIDVOC.PAK` ;
  les premières images du rendu sont presque noires. À vérifier.
- **`mid14`** : un test d'état de séquence sonore (effets sonores seuls) est pris « séquence terminée »
  par `midgame_iff.py`, faute de son simulé.
- 3 fonctions du catalogue du moteur ne sont pas portées (`CRT_MemFamily_Extra1`,
  `MovingMaskLayer_Construct_B995`, `Struct_GetElementCountMinusOne_33352`) : aucun appel aligné, elles
  ne servent pas dans les cinématiques ci-dessus.

## 5. Outils et commandes

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
  (`mid14`) ; état de lecture d'un PAK pris sans erreur (`to1mid2`).
- `tools/midgame_render.py` : option `--exe`.

Correction au passage dans le catalogue d'OPTEST : `Render_MeasureOrDrawTextString_32CD8` y portait
l'ancien nom de `Shape_DrawSpans_32CD8` ; une nouvelle extraction d'OPTEST aurait perdu les dessins
directs (`dessine_image`).
