# Rendu des objets 3D (apparence `FORM POLY`) — lu le 2026-10-16

Ce document décrit **ce que fait le code** pour dessiner un objet (avion, véhicule, bâtiment).
Le format des chunks est dans `DATA_MODEL.md` (§ « Apparence 3D FORM POLY ») et dans
`DATA_MODEL.html`. L'outil `tools/object_render.py` reproduit ce chemin (rendu logiciel 320×200)
et a servi à produire `data/F-16DES_render.png` et `data/F-16DES_render_sheet.png`.
`tools/object_viewer.py` produit la même chose en WebGL dans une page autonome
(`data/F-16DES_viewer.html` : orbite à la souris, niveau de détail, options du jeu).

Repère : les formules sont écrites comme dans le jeu (Z-up : c0 = droite de l'objet, c1 = nez,
c2 = haut). Pour libRealSpace : `x = c0`, `y = c2`, `z = −c1`. Ce changement de repère est une
rotation (déterminant +1) : **les produits vectoriels et donc le sens des normales restent les
mêmes** quand on les calcule directement en coordonnées libRealSpace.

## 1. Chargement : de `VTRI` aux éléments de dessin

Chaîne : `Appearance_CreateFromIFF_94710` (trouve `FORM POLY`) → `Poly_LoadFromIFF_96321`
→ `Poly_SizeBuffers_95800` → `Poly_LoadVERT_96470` → `Poly_BuildFaceElements_94C80`
→ `Poly_LoadTRIS_95FD0` (`VTRI`, `TXMS`, `UVXY`) → `Poly_LoadDETA_96140`.

Chaque face de `VTRI` devient un **élément de dessin** : un petit objet C++ dont la table de
méthodes dépend de l'**octet 0 de la face (le type)**. `FaceElements_InitTemplates_2AC16` pose
les tables ; `Poly_LoadVTRI_94D40` choisit par un `switch` à 10 cas.

À la préparation de chaque face (`Face_SetupGeometry_294C0`, tous types) :
- **normale de la face** `N = (V0 − V2) × (V0 − V1)`, normalisée (`Face_ComputeNormal_2931E`) ;
- **centre** = moyenne des 3 sommets (`Face_ComputeCentroid_2941F`) ;
- **normale de sommet** : la normale de la face est ajoutée à celle de ses 3 sommets ; après le
  chargement, chaque normale de sommet est normalisée (`Poly_LoadFromIFF_96321`). Toutes les
  faces du fichier y contribuent, quels que soient leur type et leur niveau de détail ;
- drapeau **face double** = octet 7 & 1 ; un second drapeau = octet 5 & 1 (rôle non établi).

Couleur d'une face éclairée : la **gamme RANG** qui contient la couleur (`Table_LookupByRange_2E975`)
est cherchée à la préparation. Une gamme couvre les index `première` à `première + 3ᵉ champ`
**bornes comprises** (pas seulement `première + nombre − 1`). On garde le n° de gamme et le
**décalage** `couleur − première`.

## 2. Rendu d'une instance : `PolyInstance_Render_2BF6C`

1. **Lumière** : direction de la 1re lumière du jeu de lumières (`WRLD/LGHT`), passée dans le
   repère de l'objet (`Matrix_WorldToLocal_58768` avec la matrice de l'objet) puis normalisée.
   C'est le « vecteur A » de `LightSet_FaceIntensity_2B54A` qui restait non établi le 2026-10-14.
2. **Œil dans la sphère** (distance < rayon de l'objet, +20h) : l'objet n'est dessiné que si
   l'octet de `INFO` de `POLY` est ≠ 0 (0 pour le F-16).
3. **Hors champ** : rejet si l'objet sort des bords du champ de vue.
4. **Taille à l'écran** `t = rayon × échelle de projection ÷ profondeur` :
   - `t ≤ 0,1 pixel` : rien n'est dessiné ;
   - `t ≤ 1,2 pixel` : **un seul point** est dessiné, de la couleur rangée au chargement :
     première face de type 3, sa gamme ombrée à l'intensité 200 (0 = noir si l'objet n'a pas
     de face de type 3, ce qui est le cas du F-16) ;
   - sinon le maillage, ci-dessous.
5. **Niveau de détail** (`Poly_SelectDetailLevel_2BCA4`) : seuil = profondeur (m) × 179,2 ÷
   échelle de projection. On prend le **plus grand** `i` (de 7 à 1) dont la distance `LVLi` est
   non nulle et ≤ seuil. Sinon, si l'option de détail (`byte_6E8CE`) vaut au moins `i`, on prend
   aussi `i` (minimum imposé). Sinon niveau 0. Si l'échelle de projection valait 179,2 pixels,
   le seuil serait la profondeur elle-même.
6. Pour **chaque face de la liste du niveau** :
   - **visibilité** (`FaceElement_CullAndProject_24EE2`) : face simple et
     `(centre − œil) · N ≥ 0` → **face vue de dos, ignorée**. Face double : jamais ignorée ;
   - **transformation et projection** des sommets (une seule fois par image et par sommet) :
     `écran x = cx + x × fx ÷ profondeur`, `écran y = cy − haut × fy ÷ profondeur` ;
   - **éclairage** (méthode +20h, selon le type, §3) ;
   - **clé de tri** = la plus grande profondeur de ses 3 sommets (`FaceElement_DepthKey_2962D`),
     plus un décalage de ±4 m pour certains objets (objets à porteur, non détaillé) ;
   - la face entre dans la **file de primitives commune** (`dword_724AE`), partagée avec le terrain.
     Le tri de cette file n'a pas été lu dans cette session : l'outil dessine de la clé la plus
     grande à la plus petite (peintre).

## 3. Intensité et teinte

**Intensité** (`LightSet_FaceIntensity_2B54A`) : `I = ambiante + max(0, A · N) × part`, bornée à 255.
Avec le `LGHT` de `data/MISSION.IFF` (ambiante 3, une lumière de poids 5, direction (−10, −25, 100)) :
ambiante = 3 × 255 ÷ 8 = 95, part = 5 × 255 ÷ 8 = 159.

**Teinte d'une couleur de gamme** (`Palette_ShadeIndexWithFog_2F24E`, sans brouillard) :
```
teinte = première + ((I × n + 128) >> 8)
n = décalage de la couleur dans sa gamme si ≠ 0, sinon nombre de teintes de la gamme
```
La couleur donnée par le modélisateur est donc la teinte **à pleine lumière** ; `I = 0` donne la
première (la plus sombre) teinte de la gamme.

**Couleur hors gamme** (types 4 et 7) et **texels** (types 7 et 8) : remappage par une table de
256 octets choisie par l'intensité (`Palette_ShadeTableFor_2E8CD`) :
`niveau = ((I × 17 + 128) >> 8) − 1`, table n° `16 − niveau` (aucune table = inchangé à pleine
lumière). Les tables sont le chunk `FADE` du `FORM FTBL` du fichier nommé par `TABL` de
`PALETTE.IFF` (« palfade »), **absent du dépôt** : l'outil assombrit un texel de gamme dans sa gamme
comme une face (approximation).

## 3bis. Brouillard (lu le 2026-10-16)

Même formule pour le terrain et pour les objets (`Palette_ShadeIndexWithFog_2F24E`) : la teinte
éclairée glisse **en index** vers la teinte de brouillard de sa gamme, `première + 3ᵉ champ de RANG`
(le gris 192 pour les 7 gammes de `PALETTE.IFF`) :
```
teinte = teinte éclairée + arrondi((teinte de brouillard − teinte éclairée) × f)
f = 0 avant le 1er seuil, 1 après le dernier, sinon (rang du seuil franchi + 1) / 32
```
- Comme la gamme va du sombre au clair puis vers le gris, une teinte sombre **passe par des teintes
  plus claires de sa couleur** avant de devenir grise : ce n'est pas un mélange RVB vers le gris.
- Profondeur : celle du sommet pour un dégradé ; pour une face unie, la clé de tri (sommet le plus
  lointain). Faces non éclairées (types 0, 1, 5) et texels : table de brouillard `FADE` choisie par
  la profondeur (`Palette_FogRemapColour_29194`, `Palette_ShadeTableFor_2E8CD`).
- **Seuils** : 20 lignes de 32 distances, chunk `D_HZ` du fichier « palfade » (absent du dépôt). La
  ligne est choisie chaque image par la **hauteur de la caméra au-dessus du sol**, par tranche de
  512 m (`Terrain_UpdateLODPerFrame` : altitude caméra − `Terrain_HeightSample`, passée à
  `Palette_SelectFogRow_2EA80`).
- Les visionneuses (`tools/terrain_3d.html`, `tools/object_viewer.html`) prennent des paliers
  régulièrement espacés entre un début et une fin réglables ; en RVB, mélange vers la couleur du
  brouillard comme `glFog(GL_LINEAR)`.

## 4. Types de faces (octet 0 de `VTRI`)

| Type | Éclairage | Dessin | Fonctions |
|---|---|---|---|
| 0 | aucun (brouillard seul) | les 3 arêtes, couleur octet 4 | `FaceType0_Draw_2978F` |
| 1, 5 (et > 9) | **aucun** (brouillard seul) | triangle uni, couleur octet 4 | `FaceType1_Light_29760`, `FaceType1_Draw_29857` |
| 2 | aucun | **translucide** : chaque pixel de l'écran devient `table[pixel]`, table n° octet 4 de `dword_72528` | `FaceType2_Draw_29977` |
| 3 | par sommet (normales de sommet) | dégradé de Gouraud des teintes ; couleur hors gamme → gamme 0 | `FaceType3_LightVertices_29E95`, `FaceType3_Draw_2A006` |
| 4 | par face | triangle uni de la teinte | `FaceType4_Light_29D96`, `FaceType4_Draw_29C73` |
| 6 | aucun (brouillard seul) | texture seule ; texel 0xFF transparent | `FaceType6_Draw_2A1C2` |
| 7 | par face | triangle uni de la teinte, puis texture remappée par l'intensité de la face | `FaceType7_Light_2A3E0`, `FaceType7_Draw_2A3FD` |
| 8 | par sommet | dégradé de Gouraud (hors gamme → gamme 0), puis texture remappée par la moyenne des 3 intensités | `FaceType8_LightVertices_2A6A9`, `FaceType8_Draw_2A81A` |
| 9 | par face | non lu | — |

Sur `F-16DES.IFF` : 263 faces, types 5 (103), 4 (57), 8 (46), 2 (24), 7 (15), 6 (12), 1 (6) ;
toutes les couleurs sont dans une gamme RANG de `PALETTE.IFF`. Les faces de type 8 ont
une couleur de fond qui reste visible là où la texture est transparente : c'est ce qui donne les
taches du camouflage.

**Textures** (`Render_MeshPrimitive_216F6`) : coordonnées **affines** (interpolées linéairement à
l'écran, pas de correction de perspective). Texel = `pixels[v × largeur + u]` : `u` = 1er octet
de chaque paire de `UVXY` (colonne), `v` = 2e (ligne). `0xFF` = transparent (`cmp bl,0FFh / jz`).

**Options du joueur** :
- `byte_6E683 = 0` (textures coupées) : le type 6 devient un triangle uni de la couleur de son
  1er texel, les types 7 et 8 perdent la texture ;
- `byte_6E682 = 0` (Gouraud coupé) : les types 3 et 8 prennent la moyenne des 3 teintes ;
- `byte_6E684 ≠ 0` : fil de fer.

## 5. Pour le portage (pipeline fixe)

Le guide de portage détaillé, avec le C++, est `IMPL_OBJECT_RENDER.md`.

- Un sommet de modèle n'a qu'une position. **Normale de face** pour les types 4, 7 ; **normale de
  sommet** (somme normalisée des normales de face) pour les types 3, 8.
- Face double : pas de rejet ; pour l'éclairage, normale inversée si le triangle est vu de dos.
- L'éclairage n'est **pas** un éclairage OpenGL : c'est un **choix d'index** dans la gamme RANG.
  En pipeline fixe, calculer l'intensité sur le CPU (par face ou par sommet) puis la teinte, et
  donner la couleur RVB de cette teinte comme couleur de sommet.
- Types 1, 5, 6 : **non éclairés** (seul le brouillard les modifie).
- Types 7, 8 : couleur de fond dessinée d'abord, texture par-dessus avec transparence 0xFF.
- Ordre de dessin : le jeu trie les faces (peintre), sans tampon de profondeur.
- **Sens des faces** : avec la normale du jeu `N = (V0 − V2) × (V0 − V1)`, une face vue de devant a
  ses sommets dans le **sens horaire à l'écran**, dans le repère du jeu comme dans celui de
  libRealSpace (rotation). `glFrontFace(GL_CW)` + `glCullFace(GL_BACK)` rejette donc exactement les
  faces que rejette `FaceElement_CullAndProject_24EE2`, **sans réorienter les faces** ; vérifié dans
  `tools/object_viewer.html` (mêmes 70 faces sur 135 que le test du jeu, vue 3/4 avant du F-16).
  Les faces doubles (octet 7 bit 0) se dessinent sans rejet.
- `tools/object_viewer.html` suit la structure de `SCRenderer::drawModel` (passes couleur, texture,
  transparence ; `glColor` calculé sur le CPU ; `GL_MODULATE` ; test alpha pour le texel 0xFF) avec,
  au choix, le tri des faces du jeu ou le tampon de profondeur.

## Non établi

- Sens du tri de la file `dword_724AE` (supposé du plus loin au plus proche).
- Tables `FADE` (fichier « palfade ») et tables de translucidité `dword_72528` : absentes.
- Valeur de l'échelle de projection `dword_72202` en vol (l'outil prend 277 pixels).
- Type 9, `FORM LINS`/`VLIN`, `FORM SPRS`/`VSPR`, `TXMA`, animation de texture (`AINF`).
- Octet 5 bit 0 et octet 6 de `VTRI` (1, 2, 4, 8 observés sur le F-16).
