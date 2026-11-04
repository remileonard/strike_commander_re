# THEFLIC.FLX : l'animation d'introduction de la version CD-ROM

Format lu dans le lecteur de `MENU.EXE` (adresses en décimal, décalages dans l'image chargée de
`MENU.EXE`) et vérifié sur `DATA\FLIC\THEFLIC.FLX` de `BIGTRE.TRE` (8 998 900 octets) : les 981
enregistrements se lisent sans reste, et deux décodeurs écrits d'après ce document (Python
`tools/flx_render.py`, C++ `RSFlic` de `tools/flic_ref`) donnent les mêmes 943 images.

Ce n'est pas un FLIC d'Autodesk (pas de signature `AF11h` / `AF12h`) : c'est un format propre au jeu.
Entiers en petit-boutiste.

## 1. En-tête et table des enregistrements

| Position | Taille | Contenu |
|---|---|---|
| 0 | 82 | octets de valeur 26 (rôle non établi) |
| 82 | 2 | 0 |
| 84 | 4 | **nombre d'enregistrements** (981) |
| 88 | 4 | 205 (rôle non établi) |
| 92 | 4 | taille du fichier (8 998 900) |
| 96 | 32 | 0 |
| 128 | 8 × nombre | **table** : pour chaque enregistrement, position (u32) puis taille (u32) |

Le lecteur prend l'enregistrement i à la position et avec la taille de l'entrée i de la table (66934 :
`shl ax, 3` sur le numéro d'enregistrement, puis les deux dwords). Dans le fichier, les enregistrements
se suivent à partir de la fin de la table (position 7 976).

## 2. Enregistrements

Le 1er octet donne le type.

| Type | Taille | Contenu | Nombre |
|---|---|---|---|
| 0 | 1 | annonce : l'enregistrement suivant est une palette | 19 |
| — | 772 | **palette** (l'enregistrement qui suit une annonce) | 19 |
| 1 | variable | **image** | 943 |

### 2.1 Palette

Format des palettes du jeu (le même que les palettes des PAK) :

| Position | Taille | Contenu |
|---|---|---|
| 0 | 2 | premier indice (0) |
| 2 | 2 | nombre de couleurs (256) |
| 4 | 3 × nombre | rouge, vert, bleu sur 6 bits (0 à 63) |

Le premier octet de la palette vaut 0, comme le type d'une annonce : c'est l'annonce qui dit que
l'enregistrement est une palette.

### 2.2 Image

En-tête de 16 octets, puis les données de l'image :

| Octet | Contenu |
|---|---|
| 0 | type (1) |
| 1 | **compression** : 0 aucune, 1 LZW (le même que les PAK du jeu) |
| 2 | **affichage** : 0 image par lignes, 1 image brute, 2 blocs de 4 × 4 pixels |
| 3 | **première ligne** : 24 = image de 320 × 152 entre deux bandes de 24 lignes ; 0 = plein écran 320 × 200 |
| 4 | 0 dans les données (affichage 1 : une valeur non nulle demande un doublement des pixels en largeur, 60875, que le fichier n'emploie pas) |
| 5 à 15 | 0 |

Combinaisons présentes :

| Compression | Affichage | Première ligne | Images | Taille des enregistrements |
|---|---|---|---|---|
| 1 | 1 | 24 | 28 | 7 579 à 28 875 |
| 1 | 1 | 0 | 4 | 16 937 à 23 806 |
| 0 | 2 | 24 | 514 | 9 799 à 17 810 |
| 0 | 2 | 0 | 23 | 13 371 à 22 353 |
| 0 | 0 | 0 | 374 | 432 à 11 541 |

Le code connaît aussi une compression 2 (différence avec deux images précédentes, 17660), absente du
fichier.

#### Affichage 1 : image brute

Données (après décompression LZW) : `320 × (200 − 2 × première ligne)` octets, une ligne après l'autre,
à partir de la première ligne. Avec la première ligne à 24 : 48 640 octets.

#### Affichage 2 : blocs de 4 × 4 pixels (15350)

L'image est découpée en blocs de 4 × 4 pixels, 80 par ligne de blocs, `(200 − 2 × première ligne) / 4`
lignes de blocs (38 avec la première ligne à 24), de gauche à droite puis de haut en bas. Toute l'image
est codée : aucun bloc n'est sauté.

1. Le **1er octet** des données est l'**octet d'échappement**.
2. Au début de chaque bloc, si l'octet lu vaut l'octet d'échappement, il est consommé et le mode
   bascule entre **bloc codé** et **bloc brut** (départ en bloc codé).
3. Bloc codé : deux couleurs c0 et c1 (un octet chacune).
   - c0 = c1 : bloc uni, de cette couleur (2 octets en tout) ;
   - sinon un masque de 16 bits suit (4 octets en tout). Octet bas du masque : lignes 0 et 1 du bloc ;
     octet haut : lignes 2 et 3 ; bit de poids fort d'abord, 4 bits par ligne, de gauche à droite.
     Bit à 1 → c1, bit à 0 → c0.
4. Bloc brut : 16 octets, les 4 pixels de la ligne 0, puis ceux des lignes 1, 2 et 3.

#### Affichage 0 : image par lignes (65708)

Image dessinée en (0, 0) **par-dessus l'image précédente** : seuls les pixels qu'elle donne changent.

| Position | Taille | Contenu |
|---|---|---|
| 0 | 2 | drapeaux (1 dans les données) |
| 2 | 2 | largeur (320) |
| 4 | 2 | hauteur (200) |
| 6 | 2 | x (0) |
| 8 | 2 | y (0) |
| 10 | 2 × hauteur | pour chaque ligne, position de ses données, comptée depuis l'emplacement de cette entrée |

Une ligne : une suite de paires (pixels sautés, compteur), jusqu'à épuiser la largeur. Après les pixels
sautés, si la largeur est épuisée, la ligne est finie.
- Drapeau 1 posé : compteur impair → `compteur / 2` pixels de la couleur donnée par l'octet suivant ;
  compteur pair → `compteur / 2` pixels bruts.
- Drapeau 1 absent : `compteur` pixels bruts.

## 3. Suite des enregistrements

Chaque palette est suivie d'une image brute (affichage 1) qui remplit toute la zone de l'image (on trouve
aussi des images brutes ailleurs : 32 en tout pour 19 palettes) ; viennent ensuite des images en blocs (affichage 2) ou par lignes (affichage 0). Les images en blocs couvrent toute
la zone et se suffisent ; les images par lignes ne font que modifier l'image précédente.

## 4. FLIC.PAK

`DATA\FLIC\FLIC.PAK`, 21 entrées, lues par le même lecteur :

| Entrées | Contenu |
|---|---|
| 0 à 14 | sons numérisés, fichiers `Creative Voice File` (VOC) |
| 15, 16, 17 | musique XMIDI (`FORM XDIR`, puis `CAT XMID`) : AdLib, Roland, autres cartes |
| 18, 19, 20 | musique XMIDI, mêmes cartes, version jouée quand l'image dure plus de 500 unités d'horloge |

Le choix d'une entrée selon la carte son et la cadence est un comportement du lecteur : `README.md`
§ « Lecture de l'animation ».
