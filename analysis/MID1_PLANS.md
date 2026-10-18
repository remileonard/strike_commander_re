# mid1 au format d'animation de libRealSpace (version 2)

`libRealSpace/resources/MID_1.IFF` est produit à partir de l'analyse du code, sans reprise de
l'ancienne version du fichier :

```bash
python3 tools/midgame_extract.py --exe optest Midgame1_PlayPart1_5FCF0 --name mid1
python3 tools/midgame_iff.py analysis/optest/midgames/mid1.json ../libRealSpace/resources/MID_1.IFF --remplace pri=air
```

1. `midgame_extract.py` écrit dans `mid1.json` l'arbre de la cinématique : boucles, tests,
   affectations, opérations du moteur avec leurs arguments, tableaux du segment de données et
   valeurs de départ des variables.
2. `midgame_iff.py` rejoue cet arbre avec les règles du moteur de scène (`MIDGAME_SYSTEM.md` § 3 à
   § 8) et enregistre chaque image : position à l'écran et image de chaque calque, sons, palettes,
   textes. Il découpe le tout en plans et écrit le fichier.

`--remplace pri=air` remet le nom de visage d'origine (« pri » dans `optest.asm`, octets modifiés
par Rémi).

## Ce que contient le fichier

38 plans. Les numéros de scène sont ceux de `MIDGAME_SYSTEM.md` § 9.

| Plan | Scène | Cadence | Fin | Contenu |
|---|---|---|---|---|
| 0 | préparation | 60 | 1 image | `optshps` 116 et `midgames` 20 en (0, 24), palette noire, palettes `optpals` 21, `midgames` 22, `optpals` 24, fondu d'apparition (pas 2), musique 0 |
| 1 | 1, phase 1 | 10 | 20 images | les deux fonds en (0, 0) |
| 2 | 1, phase 2 | 10 | fin de l'animation `mid1` 3 | réplique 7 aux images 0 et 15 (images 20 et 35 de la scène) |
| 3 | 2 | 60 | 1 334 images | les 4 titres `MG01` 0 à 3, centrés, y = 50 (35 pour le 2ᵉ), 196 images chacun, pauses de 100 images (250 après le 2ᵉ), palette `mid1` 59 |
| 4 | 3, phase 1 | 20 | 68 images | montée : vitesses (0, -1) cumulées avec les parents |
| 5 | 3, phase 2 | 20 | fin de l'animation `mid1` 13 | réplique 8 à l'image 65 |
| 6 | 4 | 20 | 40 images | composition : suites d'images, trajectoire, rebond, découpes, réplique 9 |
| 7 | 5 | 20 | 20 images | plan tremblant |
| 8 | 6 | 20 | fin de l'animation `mid1` 22 | réplique 8 |
| 9 | 7 | 20 | 40 images | composition, cycles à chaque image, rebond depuis (170, 15), réplique 9 |
| 10 | 8, phase 1 | 10 | fin de la réplique 0 | bouche par parité du compteur |
| 11 | 8, phase 2 | 10 | 5 images | bouche à 0 |
| 12 | 9 | 10 | fin de la réplique 4 | tête parlante « air », texte de lèvres |
| 13 | 10 | 20 | 40 images | composition avec poursuite, réplique 10 |
| 14 | 11 | 15 | fin de l'animation `mid1` 24 | — |
| 15 | 12 | 20 | 41 images | `mid1` 16 puis 18 à l'image 20, réplique 11 à l'image 15 |
| 16 | 13 | 20 | fin de l'animation `mid1` 15 | réplique 12 à l'image 22 |
| 17 | 14 | 20 | 41 images | défilement, `mid1` 21 → 29 → 35 |
| 18 | 15 | 20 | 81 images | `mid1` 17 avec `mid1` 30 → 31 → 32, réplique 13 à l'image 48 |
| 19 | 16, phase 1 | 10 | fin de la réplique 1 | animation sur fond `mid1` 0 |
| 20 | 16, phase 2 | 10 | 10 images | — |
| 21 | 17 | 20 | 20 images | plan tremblant |
| 22 | 18 | 10 | 20 images | « air » image de base 27 sans lèvres, transition `midgames` 0 |
| 23 | 19 | 10 | 20 images | animation sur fond `mid1` 10, image forcée à 9 dès l'image 9 |
| 24 | 20 | 20 | 30 images | — |
| 25 | 21 | 10 | fin de la réplique 2 | bouche 13 + parité |
| 26 | 22, phase 1 | 20 | 5 images | — |
| 27 | 22, phase 2 | 20 | fin de la réplique 5 | bouche par parité |
| 28 | 23, phase 1 | 10 | fin de la réplique 3 | bouche 13 + parité |
| 29 | 23, phase 2 | 10 | 5 images | bouche à 13 |
| 30 | 24, phase 1 | 20 | 5 images | — |
| 31 | 24, phase 2 | 20 | fin de la réplique 6 | bouche par parité |
| 32 | 25, phases 1 et 2 | 20 | 46 images | y de la scène de -50 à -25, groupe 19 en (0, 1), `mid1` 33 → 34 à l'image 30 |
| 33 | 25, phase 3 | 20 | fin de l'animation `mid1` 34 | — |
| 34 | 25 | 20 | 1 image | après le retrait de `mid1` 34 |
| 35 | 25, phase 4 | 20 | 31 images | palette `mid1` 46, arrêt de la musique, réplique 13, `mid1` 9 → 14 à l'image 20 |
| 36 | attente | 60 | 120 images | dernière image figée (120 tics) |
| 37 | ouverture du cadre | 60 | 1 image | plein écran, sans bandes |

## Règles de conversion

- **Un plan** par suite d'images enregistrées sans changement : même scène, même cadence, pas de
  nouvelle palette, pas de boucle d'attente. Une remise à 0 du compteur ne coupe pas le plan
  (scène 25, phases 1 et 2). Les titres, l'attente et l'ouverture du cadre ne passent pas par le
  moteur de scène : plans à 60 images par seconde, une image par tic.
- **Boucle qui attend la fin d'une réplique** : plan avec « attendre la fin des sons ». **Boucle qui
  attend la fin d'une animation** : plan qui finit avec cette animation (`end_layer`). L'outil simule
  ces boucles sur 600 images au plus pour avoir les suites d'images des autres calques.
- **Calques** : position à l'écran (parents et y de la scène compris) ; trajectoire `PATH` si elle
  change. Images en numéros du jeu (`game_numbering`), le player ajoutant le décalage de
  `RSImageSet`. Les animations (`AnimLayer`, en boucle, sur fond, à déclencher) sont des sprites
  animés par le player ; une image écrite par le code devient une suite d'images `SEQU`. Les
  calques à plusieurs images (image sur fond, transition, tête parlante) sont découpés en un calque
  par image, dans l'ordre de dessin du jeu (`depth`).
- **Visages** (`convdata`) : ressource `FACE:<nom>`. `ConvAssetManager` place les images de visage
  en (0, 24) au lieu de leur point d'ancrage ; la position écrite est celle du jeu moins (160, 128),
  le point où le jeu dessine les têtes. Hypothèse, à vérifier à l'écran.
- **Palettes** : la liste composée par le code avant chaque envoi, appliquée dans l'ordre (`PALS`),
  par-dessus la palette du plan précédent ; « normal » de `convdata` est `FACEPAL:normal`.

## Hypothèses et limites

- Matériel supposé : voix numérisée présente (`word_4684B` = 1), carte Roland (`byte_46848` = 1),
  Échap jamais pressée. Seule la version avec voix est produite : les sous-titres `SPOK` et les
  effets de remplacement ne sont pas dans le fichier.
- **Titres** : le jeu remplit le texte d'un motif de `mid1` 60 qui se décale à chaque étape
  (apparition et disparition en 16 étapes). Ce n'est pas exprimé : le texte est affiché d'un bloc,
  en couleur 15 (valeur choisie, pas lue dans le jeu). Le rectangle de la zone des titres
  (`word_46F44`) n'a pas été lu : le centrage est fait sur 320 pixels et le y est compté depuis le
  haut de l'écran.
- **Tremblement** : marche aléatoire calculée une fois par l'outil (graine fixe).
- **Animation qui continue après une boucle d'attente** : son image de départ dans le plan suivant
  est calculée sur 600 images simulées ; le player la ramène à la dernière image de l'animation.
- **Préparation** : le code dessine les deux fonds en (0, 24) avant le fondu, puis la scène 1 les
  dessine en (0, 0). Le fichier reproduit ce décalage de 24 pixels tel quel.
- Non exportés : `Speech_LoadBank_28D24` (`rmusic.pak` / `amusic.pak`, 23) à la fin de la scène 25,
  rôle non établi ; le rectangle de couleur 0 de la scène 23 (`Primitive_SetRectColorAndDraw_2CBE5`),
  dessiné sur la bande noire du bas.
