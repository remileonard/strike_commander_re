# mid1 au format d'animation de libRealSpace (version 2)

`libRealSpace/resources/MID_1.IFF` est produit à partir de l'analyse du code, sans reprise de
l'ancienne version du fichier :

```bash
python3 tools/midgame_extract.py --exe optest Midgame1_PlayPart1_5FCF0 --name mid1
python3 tools/midgame_iff.py analysis/optest/midgames/mid1.json ../libRealSpace/resources/MID_1.IFF --remplace pri=air --donnees BIGTRE.TRE [--sous-titres]
```

1. `midgame_extract.py` écrit dans `mid1.json` l'arbre de la cinématique : boucles, tests,
   affectations, opérations du moteur avec leurs arguments, tableaux du segment de données et
   valeurs de départ des variables.
2. `midgame_iff.py` rejoue cet arbre avec les règles du moteur de scène (`MIDGAME_SYSTEM.md` § 3 à
   § 8) et enregistre chaque image : position à l'écran et image de chaque calque, sons, palettes,
   textes. Il découpe le tout en plans et écrit le fichier. Les données du jeu (`--donnees`,
   `BIGTRE.TRE` ou son dossier `DATA`, obligatoires) donnent le nombre d'images de chaque animation
   et la durée de chaque réplique (fichiers VOC) : la fin exacte des boucles d'attente.

`--remplace pri=air` remet le nom de visage d'origine (« pri » dans `optest.asm`, octets modifiés
par Rémi).

## Ce que contient le fichier

29 plans, 93,8 s. **Un plan = N images à une cadence donnée, sans autre condition de fin** (choix
du 2026-10-21) : la fin des boucles qui attendent une animation ou une réplique est calculée avec
les données du jeu. Les numéros de scène sont ceux de `MIDGAME_SYSTEM.md` § 9, la description de
chaque scène y est.

| Plan | Scène | Cadence | Images | Durée | Répliques (`mid1voc`) | Palettes | Musique |
|---|---|---|---|---|---|---|---|
| 0 | préparation | 60 | 1 | 0.02 s | — | 3 | musique 0 |
| 1 | 1 | 10 | 57 | 5.70 s | 7 à l'image 20, 7 à l'image 35 | 0 |  |
| 2 | 2 (titres) | 60 | 1334 | 22.23 s | — | 1 |  |
| 3 | 3 | 20 | 178 | 8.90 s | 8 à l'image 133 | 1 |  |
| 4 | 4 | 20 | 40 | 2.00 s | 9 à l'image 0 | 2 |  |
| 5 | 5 | 20 | 20 | 1.00 s | — | 2 |  |
| 6 | 6 | 20 | 51 | 2.55 s | 8 à l'image 0 | 3 |  |
| 7 | 7 | 20 | 40 | 2.00 s | 9 à l'image 0 | 2 |  |
| 8 | 8 | 10 | 25 | 2.50 s | 0 à l'image 0 | 2 |  |
| 9 | 9 | 10 | 16 | 1.60 s | 4 à l'image 0 | 2 |  |
| 10 | 10 | 20 | 40 | 2.00 s | 10 à l'image 0 | 3 |  |
| 11 | 11 | 15 | 6 | 0.40 s | — | 1 |  |
| 12 | 12 | 20 | 41 | 2.05 s | 11 à l'image 15 | 3 |  |
| 13 | 13 | 20 | 25 | 1.25 s | 12 à l'image 22 | 0 |  |
| 14 | 14 | 20 | 41 | 2.05 s | — | 0 |  |
| 15 | 15 | 20 | 81 | 4.05 s | 13 à l'image 48 | 0 |  |
| 16 | 16 | 10 | 22 | 2.20 s | 1 à l'image 0 | 2 |  |
| 17 | 17 | 20 | 20 | 1.00 s | — | 2 |  |
| 18 | 18 | 10 | 20 | 2.00 s | — | 2 |  |
| 19 | 19 | 10 | 20 | 2.00 s | — | 3 |  |
| 20 | 20 | 20 | 30 | 1.50 s | — | 1 |  |
| 21 | 21 | 10 | 14 | 1.40 s | 2 à l'image 0 | 2 |  |
| 22 | 22 | 20 | 37 | 1.85 s | 5 à l'image 5 | 2 |  |
| 23 | 23 | 10 | 20 | 2.00 s | 3 à l'image 0 | 2 |  |
| 24 | 24 | 20 | 88 | 4.40 s | 6 à l'image 5 | 2 |  |
| 25 | 25, phases 1 à 3 | 20 | 232 | 11.60 s | — | 3 |  |
| 26 | 25, phase 4 | 20 | 31 | 1.55 s | 13 à l'image 0 | 1 | arrêt de la musique |
| 27 | attente | 60 | 120 | 2.00 s | — | 0 |  |
| 28 | ouverture du cadre | 60 | 1 | 0.02 s | — | 0 |  |

## Règles de conversion

- **Un plan** par suite d'images enregistrées sans changement : même scène, même cadence, pas de
  nouvelle palette, pas de boucle d'attente. Une remise à 0 du compteur ne coupe pas le plan
  (scène 25, phases 1 et 2). Les titres, l'attente et l'ouverture du cadre ne passent pas par le
  moteur de scène : plans à 60 images par seconde, une image par tic.
- **Boucle qui attend la fin d'une réplique ou d'une animation** : simulée jusqu'à sa vraie fin
  (durée du VOC × cadence, ou image courante = nombre d'images) ; le plan reçoit ce nombre
  d'images. `SHTP` est toujours écrit avec « attendre les sons » = 0 et `end_layer` = −1.
- **Calques** : position à l'écran, soit la position du jeu + 24 en y (la ligne 0 de l'image hors
  écran est copiée à la ligne 24, `MIDGAME_SYSTEM.md` § 3.2), parents et y de la scène compris ; même
  décalage pour les découpes et les titres ; aucun pour ce qui est dessiné directement à l'écran
  (préparation) et pour l'ouverture du cadre ; trajectoire `PATH` si elle
  change. Images en numéros du jeu (`game_numbering`), le player ajoutant le décalage de
  `RSImageSet`. Les animations (`AnimLayer`, en boucle, sur fond, à déclencher) sont des sprites
  animés par le player ; une image écrite par le code devient une suite d'images `SEQU`. Les
  calques à plusieurs images (image sur fond, transition, tête parlante) sont découpés en un calque
  par image, dans l'ordre de dessin du jeu (`depth`).
- **Visages** (`convdata`) : ressource `FACE:<nom>`. `ConvAssetManager` place les images de visage
  en (0, 24) au lieu de leur point d'ancrage ; la position écrite est celle du jeu (sans le
  décalage de 24) moins (160, 128), le point où le jeu dessine les têtes. Hypothèse, à vérifier à l'écran.
- **Palettes** : la liste composée par le code avant chaque envoi, appliquée dans l'ordre (`PALS`),
  par-dessus la palette du plan précédent ; « normal » de `convdata` est `FACEPAL:normal`.

## Hypothèses et limites

- Matériel supposé : voix numérisée présente (`word_4684B` = 1), carte Roland (`byte_46848` = 1),
  Échap jamais pressée. Seule la version avec voix est produite : les sous-titres `SPOK` et les
  effets de remplacement ne sont pas dans le fichier.
- **Titres** : le jeu fait apparaître et disparaître le texte par translucidité, en 16 étapes de 3
  tics : les pixels de couleur 239 à 254 de la police `mid1` 27 sont mélangés au fond par les
  tables de `mid1` 60 (`MIDGAME_SYSTEM.md` § 9, scène 2). Ce n'est pas exprimé : le texte est
  affiché d'un bloc, en couleur 15 (valeur choisie, pas lue dans le jeu). Le texte est dessiné dans
  l'image hors écran de 320 pixels de large (`word_46F44` est la surface de dessin courante, pas un
  rectangle de titres) : centrage sur 320 pixels, y + 24 à l'écran.
- **Tremblement** : marche aléatoire calculée une fois par l'outil (graine fixe).
- **Animation arrivée au bout** : dans le jeu, une animation simple ne dessine plus rien après sa
  dernière image (`MIDGAME_SYSTEM.md` § 6.1) ; le fichier l'exprime par `end_frame` = 0 (voir
  « Lecteur de contrôle »).
- **Sous-titres** (option `--sous-titres`, variante voulue par Rémi : voix **et** texte, alors que
  le jeu affiche l'un ou l'autre). L'outil relève dans le code chaque « si voix présente : réplique k,
  sinon : couleur c, sous-titre `textes1[i]` » et affiche le texte `SPOK` i, en couleur c, de
  l'image où la réplique k part jusqu'à la fin de son VOC. mid1 : répliques 0, 1, 2, 3 → textes 0, 2,
  3, 5 en couleur 4 ; réplique 4 → texte 1 en couleur 224 ; répliques 5, 6 → textes 4, 6 en couleur
  114. Les répliques 7 à 13 n'ont pas de sous-titre dans le code. Supposé (mise en page de
  `sub_C8F5` non lue) : texte centré, haut à y = 158, dans la zone des sous-titres du jeu,
  (0, 152) – (319, 199) de l'écran. À retoucher dans l'éditeur si besoin.

## Rendu de référence avec les données du jeu

Les données ne sont pas dans le dépôt. Les outils lisent `BIGTRE.TRE` directement (ou le dossier
`DATA` extrait par `tools/tre_extract.py`) :

```bash
python3 tools/midgame_render.py --donnees BIGTRE.TRE [--sous-titres] --film mid1.gif 2
```

`midgame_render.py` rejoue la même simulation que `midgame_iff.py` (mêmes données : nombre d'images
des animations, durée des répliques) et dessine chaque image comme le jeu :
image hors écran copiée à la ligne 24, palettes partielles appliquées à leur plage, fondu
d'apparition, images des visages (`CONVSHPS.PAK`, numéro donné par le `FORM FACE` de
`CONVDATA.IFF`), titres translucides (police `mid1` 27, tables `mid1` 60). Résultat pour mid1 :
29 plans, 95,6 s avec le fondu d'apparition.

Avec `--sous-titres`, les textes `SPOK` sont dessinés comme les produit `midgame_iff.py --sous-titres`,
avec la police `fonts\convfont.shp` (pixels pleins de la couleur relevée dans le code), sur l'écran
dans la bande du bas : lignes coupées aux espaces à 300 pixels, centrées, interligne 10 (supposé).

Hypothèses du rendu, le code de mise en page du texte n'étant pas lu : chasse d'un caractère =
largeur de son image + 2, espace = 6 pixels, interligne 16, titre centré sur 320 pixels. Le son
n'est pas rendu.
- Non exportés : `Speech_LoadBank_28D24` (`rmusic.pak` / `amusic.pak`, 23) à la fin de la scène 25,
  rôle non établi ; le rectangle de couleur 0 de la scène 23 (`Primitive_SetRectColorAndDraw_2CBE5`),
  dessiné sur la bande noire du bas.

## Lecteur de contrôle (`tools/midgame_check.py`)

Il lit **seulement** le `MID_*.IFF` et les données du jeu, rejoue le fichier avec les règles
ci-dessous et compare chaque instant (pas de 1/60 s) au rendu de référence. Ces règles sont la
signification voulue des champs écrits par `midgame_iff.py` : la spécification pour
`SCAnimationPlayer`.

```bash
python3 tools/midgame_iff.py analysis/optest/midgames/mid1.json MID_1.IFF --remplace pri=air --donnees BIGTRE.TRE
python3 tools/midgame_check.py --donnees BIGTRE.TRE MID_1.IFF [dossier_des_écarts]
```

Règles du lecteur :
- **Plan (`SHTP`)** : `clear` = 1 ou `keep` = 0 → palette remise à 0 ; puis les palettes de `PALS`
  dans l'ordre, chacune **sur sa seule plage** (premier indice, nombre). `full_screen` = 0 → seule
  la bande (0, 24) – (319, 151) est visible, et l'écran est effacé à chaque image ; 1 → tout l'écran,
  sans effacement.
- **Durée d'un plan** : `nbframe` images, à `fps` images par seconde ; rien d'autre (`wait` = 0,
  `end_layer` = −1). Les répliques de `SOND` partent à leur image et ne changent pas la durée.
- **Calque (`LAYR`)** : affiché de l'image `start` du plan pendant `nb` images (0 = jusqu'à la fin) ;
  dessiné dans l'ordre de `depth`, découpé par son rectangle s'il en a un ; position = `PATH[k]`
  s'il existe (k = image depuis `start`, la dernière valeur est gardée), sinon (x, y).
- **Image fixe (`BKGD`)** : `SEQU[k]` s'il existe, sinon `image` ; 255 = rien.
- **Animation (`SPRI`)** : image = `start_image` + k ; en boucle : modulo le nombre d'images ;
  sinon bornée à la dernière image : `end_frame` ≤ 0 → nombre d'images + `end_frame` (0 = l'image
  « nombre d'images », qui n'existe pas : **l'animation disparaît**, comme dans le jeu ; -1 =
  s'arrête sur sa dernière image), `end_frame` > 0 → cette image.
- **Visages (`FACE:<nom>`)** : images de `CONVSHPS.PAK` (numéro donné par le `FORM FACE` de
  `CONVDATA.IFF`), dessinées à la position écrite + (160, 128 + 24).
- Coordonnées : celles de l'écran 320 × 200, (0, 0) en haut à gauche.

Résultat pour mid1 (2026-10-21) : **0 instant différent sur 5 629** (93,8 s). Avant que les données
soient obligatoires, les plans qui suivaient une attente de réplique différaient : la durée de
l'attente, inconnue, était simulée sur 600 images et le plan suivant partait d'un mauvais état.
- **Non comparés** : les titres (le format les affiche d'un bloc, en couleur 15, sans la
  translucidité) et le fondu d'apparition (même champ `fade` des deux côtés, rendu ni d'un côté ni
  de l'autre dans la comparaison).

## Autres cinématiques

Mêmes outils, en changeant le nom (`--nom` pour le rendu et le lecteur de contrôle). Pour mid2
(fonction pas encore nommée `sub_6B9C0`) :

```bash
python3 tools/midgame_extract.py --exe optest sub_6B9C0 --name mid2
python3 tools/midgame_iff.py analysis/optest/midgames/mid2.json ../libRealSpace/resources/MID_2.IFF --donnees BIGTRE.TRE [--sous-titres]
python3 tools/midgame_render.py --donnees BIGTRE.TRE --nom mid2 --film mid2.gif 2
python3 tools/midgame_check.py --donnees BIGTRE.TRE --nom mid2 MID_2.IFF
```

mid2 (2026-10-21) : 9 plans, 45,4 s, **0 instant différent** entre le fichier et le rendu de
référence (2 724 instants). Corrigé après relecture par Rémi (têtes sans coiffure ni habits,
personnage qui disparaissait au dernier plan) :
- têtes : images 1 et 34 ajoutées (`TalkingHead_DrawDressed_9E5E`) ;
- extracteur : une valeur gardée dans un registre ou une case temporaire est copiée avant que la
  variable soit modifiée (`image ← compteur` puis `compteur + 1` donnait l'image suivante, au-delà
  de la dernière : le personnage n'était plus dessiné) ; les remises à 0 d'un compteur sur 2
  octets dans la case d'une poignée de ressource ne sont plus jetées (attentes de 2 ou 3 images).

Limites :
- les tirages `CRT_Rand` (décalage de la tête de Tex de 0 à 4 pixels, effets sonores au hasard) sont
  faits une fois par l'outil, suite fixe ; le jeu tire à chaque partie ;
- les fondus de volume entre ambiances musicales (`AIL_set_relative_volume_30C66`) et les séquences
  musicales autres que la première ne sont pas exprimés ;
- dans la scène 5, la case de pile de la ressource `mid2voc` 9 est réutilisée par le code comme
  compteur (`var_188`, l'image 10 d'un calque est posée au 4ᵉ tour) : l'extracteur ne voit pas
  cette réutilisation, le compteur est lu comme 0 et l'image 10 n'est pas posée ;
- un fondu de disparition (fin de mid2) n'est pas exprimé dans le format.
- sous-titres (`--sous-titres`) : textes de `MG02`, lus par le code seulement sans voix (le tableau
  est retrouvé dans la branche que la simulation ne prend pas). Le code ne fixe pas leur couleur
  (couleur par défaut de la police, non lue) : 15 est écrit, valeur supposée. Le nom du joueur, que
  le code ajoute au texte 0, n'est pas ajouté.

### mid3

Fonction pas encore nommée `sub_71680` : `--nom mid3`, même suite de commandes que mid2. 6 plans,
23,5 s, pas de réplique. Mécanismes nouveaux, lus dans le code (2026-10-21) :
- **calque mobile sur fond** (`MovingOverlayLayer_Construct_A837`) : image 0 dessous, image
  courante dessus, vitesse donnée au constructeur ;
- **calque masque** (`MovingMaskLayer_Construct_B995`, table `MovingMaskLayer_SetTable_BA1C`) : la
  forme de l'image sert de masque, chaque pixel couvert devient table[couleur de l'écran]
  (`Render_DrawShapeAsRemapMask_33B9C`), table de 256 octets copiée de `mid3` 23 : ombre de l'avion.
  **Pas exprimé dans le format** : absent de MID_3.IFF, d'où les écarts avec le rendu de référence ;
- **défilement en boucle** : un décor sorti à gauche (x < −319) est replacé 640 pixels plus loin
  (`Layer_MoveBy_2E29E`) ;
- **reste de division** (`idiv`, reste dans `dx`) : image = compteur mod 3 toutes les 8 images.

### mid5

Fonction pas encore nommée `sub_768F0` : `--nom mid5`. 20 plans, 63,3 s (65,1 s avec le fondu),
répliques et têtes en mode voix comme mid2. Mécanismes nouveaux (2026-10-21) :
- **calque mobile à l'échelle** (`ScaledMovingLayer_Construct_9544`, dessin
  `Render_DrawRotatedScaledSprite_33586`) : deux échelles en 1/256 (pas de lecture du dessin =
  1000000h / échelle : 256 = taille d'origine, négatif = retourné) ; mid5 : les trois silhouettes qui
  s'enfuient, à 300 (× 1,17). **Pas exprimé dans le format** : l'image est écrite à sa taille
  d'origine, d'où 144 instants différents ; sans l'échelle, 0 écart. Le rendu de référence fait
  l'agrandissement au plus proche voisin autour du point d'origine de l'image ; les arrondis exacts de
  la fonction du jeu ne sont pas relus ;
- **compteur d'attente dans la case d'une palette** : la case de pile d'une palette sert de compteur
  (`var_10C`, attentes de 2 ou 3 images avant une réplique) ; l'extracteur la traite comme variable ;
- **compteur de la fuite dans la case d'une voix** : la boucle de la fuite des attaquants (scène 11 de
  l'outil, 60 images) remet à 0 puis incrémente (`inc`) le mot `var_13E+2`, qui est aussi la case de
  pile de la voix mid5voc 11. Ce compteur choisit l'image de course de chaque silhouette
  (`(compteur + 1) % 5`, `+ 4`, `+ 5`) et les images de l'explosion. Avant le 2026-10-21 l'extracteur
  le prenait pour un champ de la poignée et le lisait à 0 : les silhouettes restaient figées. Règle :
  un mot incrémenté ou décrémenté sur place dans une case de ressource est une variable ;
- effets sonores tirés dans une petite table (`asoundfx`), non exprimés.
