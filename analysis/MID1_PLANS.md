# mid1 au format d'animation de libRealSpace (version 2)

`libRealSpace/resources/MID_1.IFF` est produit à partir de l'analyse du code, sans reprise de
l'ancienne version du fichier :

```bash
python3 tools/midgame_extract.py --exe optest Midgame1_PlayPart1_5FCF0 --name mid1
python3 tools/midgame_iff.py analysis/optest/midgames/mid1.json ../libRealSpace/resources/MID_1.IFF --remplace pri=air --donnees BIGTRE.TRE [--sous-titres]
```

**Fichiers produits** (2026-10-21) : `analysis/optest/midgames/iff/MID_1.IFF`, `MID_2`, `MID_3`, `MID_5`,
`MID_12`, `MID_15`, `MID_16`, `MID_17`, `MID_20`, `MID_33`, `MID_34`, `MID_36`, tous avec `--sous-titres` (voix et sous-titres), `MID_1` avec `--remplace pri=air`. Ils ne
contiennent que des noms de PAK, des numéros d'entrée et des clés de texte, pas de données du jeu.

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
- **Visages** (`convdata`) : ressource `FACE:<nom>`, position écrite comme pour les autres calques.
- **Point d'ancrage** : la position d'un calque est celle du point d'ancrage de l'image (les x, y de
  ses lignes), pas le coin de son cadre. `SCAnimationPlayer` pose l'image en position −
  (`GetLeft()`, `GetTop()`) pour les fichiers en version 2.
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
  `CONVDATA.IFF`), dessinées à la position écrite comme les autres calques.
- **Position** : celle du point d'ancrage de l'image : chaque ligne de l'image est dessinée en
  position + (x, y) de la ligne.
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
  compteur (`var_188`, l'image 10 d'un calque est posée au 4ᵉ tour). Lu correctement depuis le
  2026-10-21 (règle « mot modifié sur place », voir « mid15 ») ;
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

### mid12

Fonction pas encore nommée `sub_81470` : `--nom mid12`. 23 plans, 86,8 s (88,6 s avec le fondu),
répliques et têtes en mode voix. Mécanismes nouveaux (2026-10-21) :
- **calque image à l'échelle** (`ScaledImageLayer_Construct_9391`, dessin
  `ScaledImageLayer_Draw_93E4` → `Render_DrawRotatedScaledShape_39A7A`) : un angle (degrés), une
  échelle en 1/256 et un octet dont le rôle n'est pas établi. mid12 : les silhouettes et les fûts des
  plans larges du hangar, angle 0, octet 0, échelle 200 (× 0,78) ou 160 (× 0,625), jamais modifiés
  ensuite. **Pas exprimé dans le format** : image écrite à sa taille d'origine, d'où 1 503 instants
  différents ; sans l'échelle, 0 écart. Le rendu de référence réduit au plus proche voisin autour du
  point d'origine de l'image ; les routines de dessin du jeu ne sont pas lues ;
- **calque fixe à l'origine** (`Layer_ConstructAtOrigin_2DE95`) : `Layer` en 0, 0 ;
- **borne de fin figée dans un registre** : la dernière scène calcule `compteur + durée` une fois
  avant la boucle (`mov di, dx`) ; l'extracteur fige désormais une telle valeur au moment de son
  calcul (sinon la boucle ne finit jamais). Cela corrige aussi les branches sans voix de mid2 et mid5
  (non jouées par l'outil ; leurs MID_*.IFF ne changent pas) ;
- couleur des sous-titres supposée 15, comme mid2 : sur certaines palettes elle sort sombre.

### mid15

Fonction pas encore nommée `sub_8B630` : `--nom mid15`. 19 plans, 76,1 s (77,9 s avec le fondu),
répliques et têtes en mode voix. Mécanismes nouveaux (2026-10-21) :
- **zoom animé** : `ScaledImageLayer_SetScale_94F4` change l'échelle d'un calque à l'échelle à
  chaque image. Premier plan : deux avions de 32 à 255 (× 0,125 à × 1), en se déplaçant.
  **Pas exprimé dans le format** (245 instants différents ; sans l'échelle, 0 écart) : c'est le
  plan où l'absence d'échelle se voit le plus ;
- **déplacement par la table de méthodes** : l'emplacement +18h de toutes les tables de calques est
  `Layer_MoveBy_2E29E` (vérifié sur les 16 tables) ; l'appel indirect est traité comme « déplace ».
  Tremblement des têtes et des cockpits (−1, 0, +1 pixel). Corrige aussi mid12 (5 déplacements qui
  étaient ignorés) ;
- **test « a et b » vers un même sinon** (`si di == 0 et tirage == 0 … sinon si …`) : le second
  test devient un si imbriqué qui reprend le même sinon ; l'ordre des tirages `CRT_Rand` est gardé.
  Corrige aussi des tests de mid1, mid2, mid5 et mid12 (sans changer leurs fichiers) ;
- **mot modifié sur place** (`inc`, `dec`, `add`, `sub`) dans la case de pile d'une ressource ou d'un
  son : une variable ordinaire, en lecture comme en écriture. Généralise la règle de mid5 ; corrige
  le compteur de la scène 2 de mid12 (écrit sous une ressource, relu sous une autre) et la limite
  connue de mid2 (compteur `var_188`, image 10 posée au 4ᵉ tour). MID_2 et MID_12 changent.

### mid16

Fonction pas encore nommée `sub_94A30` : `--nom mid16`. 5 plans, 39,7 s (41,4 s avec le fondu),
aucun mécanisme de dessin nouveau ; 0 écart avec le rendu de référence.

**Sous-titres : plusieurs textes pour une réplique** (2026-10-21, toutes les cinématiques). Sans
voix, le code affiche plus de textes qu'il ne joue de répliques avec voix (mid16, scène 2 : 8 textes
pour 7 répliques ; scène 3 : 3 pour 2). L'appariement se fait sur les données :
- dans l'ordre, chaque réplique reçoit une suite de textes consécutifs, choisie pour que la longueur
  des textes suive la durée de la voix (vitesse moyenne du groupe) ; une réplique de k textes doit
  contenir k − 1 silences (fenêtres de 50 ms sous 8 % du maximum, sur au moins 0,25 s), un silence
  manquant étant pénalisé ;
- dans une réplique, le texte suivant commence à la fin du silence le plus proche de sa position
  (proportion des caractères) ; sans silence, à cette position.
mid16 : réplique 0 = textes 0 (« Yeah, that damn Mendez... ») et 1 ; réplique 7 = textes 8
(« Operator? », 0,55 s, puis une pause) et 9 ; les autres, un texte chacune. Le code cherche aussi un
sous-titre affiché plus loin, dans un « si pas de voix » de la boucle commune (mid15, dernier plan).
Effet : 16 sous-titres au lieu de 10 dans mid2, 15 au lieu de 8 dans mid5, 25 au lieu de 11 dans
mid12, 27 au lieu de 14 dans mid15. C'est une reconstruction d'après les données, pas une règle du
jeu (avec voix, le jeu n'affiche aucun texte).

### mid17

Fonction pas encore nommée `sub_98210` : `--nom mid17`. 10 plans, 31,1 s, aucun mécanisme de dessin
nouveau ; 0 écart avec le rendu de référence.
- **Tirages réinitialisés sur l'heure** : `CRT_Srand_6F2(CRT_Time_85A(0))` (aussi dans mid2) ; les
  tirages du jeu changent à chaque partie, l'outil garde sa suite fixe.
- **Textes assemblés par le code** (sans voix) : texte 1 = texte 1 + indicatif du joueur (premier
  non vide des trois noms passés à la fonction, sinon texte 2 « Strike Leader ») + texte 3 ;
  texte 4 = texte 4 + nom (sinon texte 5 « Commander ») + « ? » (dseg 9555). Les répliques le
  confirment : réplique 2 = textes 0 et 1, réplique 0 = textes 4 (« Commander? », pause) et 6.
  **Pas exprimé dans le format** (un sous-titre désigne un texte de `MIDGAMES.IFF`) : le fichier
  affiche « ...this is » et le texte 4 seul (des espaces). Même limite pour le nom ajouté dans mid2
  (texte 0) et mid12 (texte 22, « Hey, »).

### mid20

Fonction pas encore nommée `sub_9E080` : `--nom mid20`. 6 plans, 33,8 s ; 0 écart avec le rendu de
référence. Mécanisme nouveau (2026-10-21) :
- **calque retiré puis rajouté** (`retire` puis `ajoute`) : il repasse au-dessus des autres. Scène 1,
  image 54 : les arbres (`midgames` 19, c8 et c9) sont retirés puis rajoutés après le parachute (c2,
  c3), qu'ils cachent ensuite. Le fichier garde un ordre de dessin (`depth`) fixe par calque : les
  images qui suivent le rajout forment un calque à part, à sa nouvelle profondeur. Change aussi
  MID_5 et MID_17 (même résultat à l'écran) ;
- textes de `MG20` : le code n'affiche que les textes 5, 6 et 8 (répliques 0 = textes 5 et 6,
  1 = texte 8) ; les textes 0 à 4 et 7 ne sont pas affichés par cette fonction ;
- extracteur : un saut qui suit un saut sans condition (code mort retiré) est supprimé.

### mid33 (générique de fin : enterrement)

Fonction pas encore nommée `sub_A3C30` : `--nom mid33`. 13 plans, 55,0 s (56,8 s avec les fondus) ;
0 écart avec le rendu de référence. C'est la cinématique de la mort du joueur (enterrement, textes
de `MG33`). Mécanismes nouveaux (2026-10-21) :
- **noms du joueur** : la fonction reçoit trois noms (`arg_6`, `arg_8`, `arg_10` : prénom, nom,
  indicatif d'après leur usage) et compose des textes avec (`CRT_Strcat`). Ils sont pris **vides** :
  le code prend alors ses textes par défaut (texte 2 + texte 3 « our brave Commander. », texte 16 +
  texte 17 « Commander. »…). Le lecteur suit la longueur des tampons locaux remplis (`CRT_Strlen`) ;
- **calque de texte** (`TextLayer_Construct_ACF1`, `TextLayer_SetText_ADB7`) : inscriptions de la
  croix, scène 2 : ligne 1 = prénom et nom (par défaut « Rest In Peace »), ligne 2 = nom seul si
  prénom + nom dépassent 21 caractères, ligne 3 = l'indicatif entre apostrophes (par défaut
  « 'UNLUCKY' »). **Pas exprimé dans le format** (texte libre) : la croix est écrite sans
  inscription ;
- **palette passée par valeur** (`Palette_UploadByValue_CBAB`, scène 6) : la palette `pal8`
  (`midgames` 40) est construite dans la zone d'arguments de la pile ; le lecteur envoie la dernière
  palette allouée ;
- **écran de fin « THE END »** : police lue dans un `FORM FONT`, texte littéral (dseg 10007) en
  (160, 97), palette `midgames` 39 ; attente de 300 tics de 60 Hz **et** de la fin de la musique
  (état AIL ≠ 2), touche = sortie. Écrit : 5 s de la dernière image (texte non exprimé, fin de
  musique non comptée) ; que le jeu efface ou non l'écran avant ce texte n'est pas établi.

### mid34 (enterrement de Stern)

Fonction pas encore nommée `sub_AFB90` : `--nom mid34`. 10 plans, 52,7 s (54,5 s avec les fondus) ;
0 écart avec le rendu de référence ; aucun mécanisme nouveau. Les inscriptions de la croix
(« CMDR. JAMES R. STERN ») font partie de l'image. Sous-titres : 11 textes pour 9 répliques
(répliques 7 = textes 7 et 8, 8 = textes 9 et 10). Deux cases de ressource lues dans la dernière
scène (`var_11C`, `var_11C+2`) sont mises à 0 avant la boucle et jamais modifiées : la valeur 0 prise
par le lecteur est la bonne (même cas dans mid33, `var_148`).

### mid36 (fin victorieuse)

Code sans bloc `proc` : l'étiquette `loc_B6FF0`, tout le segment ovr209 (lignes 328 570 à 337 854
d'`optest.asm`), atteinte par un saut du relais d'overlay `sub_42620`. `midgame_extract.py` accepte
désormais une étiquette : la fonction va de l'étiquette à la fin de son segment
(`--exe optest loc_B6FF0 --name mid36`). 19 plans, 80,7 s ; 0 écart avec le rendu de référence ;
aucun mécanisme de dessin nouveau.
- Textes assemblés avec le nom du joueur, comme mid17 : texte 2 + nom (sinon texte 3 « Commander »)
  + texte 4 ; texte 10 + nom + texte 11. Non exprimé : le fichier montre « All right, all right. I
  got to hand it to you, » et « ...but » seuls.
- Un calque de texte (scène 1, en (160, 160)) n'a jamais de texte posé : il ne dessine rien.
- Effets sonores préchargés depuis une table de 7 octets (`word_457D6`…) : sans effet sur l'image.

