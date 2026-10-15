# Jupes du terrain : continuer la carte au-delà des bords (à porter dans libRealSpace)

Rédigé le 2026-10-15. Repère Y-up, mètres. Comportement lu dans le code du jeu, reproduit et vérifié
visuellement dans `tools/terrain_3d.py` (option `--skirt`, touche J) et dans la vue WebGL
(`<nom>_3d.html`, case « jupes »).

## 1. Ce que fait le jeu

Le jeu ne dessine pas de bord : la fenêtre de sommets autour de l'observateur continue au-delà de
la grille de 18 × 18 cellules. Pour chaque sommet de cette fenêtre :

1. **cellule** = indice global du sommet ÷ n (n = sommets par cellule : 20 en ELV, 10 en MED,
   5 en LOW), arrondi **vers le bas** (aussi pour les indices négatifs) ;
2. la cellule est **bornée à [0, 17]**, en ligne et en colonne, indépendamment ;
3. **position dans la cellule** = indice global mod n, ramenée dans [0, n − 1], **non bornée** :
   elle repart à 0 à chaque passage de cellule ;
4. le sommet garde sa **vraie position monde** ; seules ses données (hauteur, éclairage, couleur,
   textures 1 et 2) sont celles du sommet (cellule bornée, position dans la cellule).

Résultat : la cellule du bord se **répète en entier** toutes les 20 km vers l'extérieur ; au-delà
d'un coin, la cellule de coin se répète dans les deux directions. Le relief n'est pas continu à
chaque raccord de répétition (le bord droit de la cellule touche son propre bord gauche) : c'est
le comportement du jeu.

Preuves (fonctions de `known_functions.json`) :
- `Terrain_BuildVertexWindow_3266E` (seg071) remplit la fenêtre :
  - division par n et arrondi vers le bas : `idiv word ptr [si+86h]` puis `or cx, cx / jge / dec [bp+var_2]` ;
  - bornage de la cellule : `cmp [bp+var_6], 0 / jge` (sinon 0) et
    `mov ax, [si+7] / cmp ax, [bp+var_6] / jg` (sinon `dec ax` = 17) ; idem pour la ligne ;
  - position dans la cellule : le reste de la division, `+ [si+86h]` s'il est négatif ;
  - pointeur du sommet : `(ligne bornée × 18 + colonne bornée)` dans la table des cellules, puis
    `(ligne dans la cellule × n + colonne dans la cellule) × 6` dans la cellule.
- `Terrain_ComputeLODMesh` (seg071) charge les cellules de la fenêtre avec le même bornage
  (`loc_32D0D` … `loc_32D46`) : une cellule hors carte n'est jamais demandée au fichier.

Non vérifié : la requête d'altitude (`Terrain_QueryAltitudeAt`) hors carte. Les outils appliquent
la même règle au sol sous la caméra ; ce n'est pas lu dans le code du jeu.

## 2. La formule

Pour un indice global `g` (ligne ou colonne, entier, éventuellement négatif ou ≥ 18 × n) :

```
cellule(g)      = clamp(floor(g / n), 0, 17)
dansCellule(g)  = g mod n            (toujours dans [0, n − 1])
```

Le sommet affiché en (gLigne, gColonne) prend les données du sommet
`dansCellule(gColonne) + dansCellule(gLigne) × n` de la cellule `cellule(gLigne) × 18 + cellule(gColonne)`,
et sa position monde est celle de (gLigne, gColonne) : `gColonne × espacement − 180 000`, et de même
pour la ligne, avec l'espacement du niveau de détail (1000 m en ELV).

Exemples (n = 20) : g = −1 → cellule 0, sommet 19 ; g = −20 → cellule 0, sommet 0 ;
g = 360 → cellule 17, sommet 0 ; g = 379 → cellule 17, sommet 19.

La règle porte sur des **indices de grille**, pas sur des coordonnées : elle s'applique telle quelle
à la convention de `RSArea` (lignes de cellules vers +z depuis −180 000), sans se soucier du signe
de l'axe.

## 3. Proposition pour `RSArea` / `SCRenderer`

Principe : construire une fois par niveau de détail, au chargement, une **copie** des sommets de la
zone hors carte (`MapVertex` avec la position recalculée et les données du sommet source), puis
dessiner ses carrés avec `renderQuad`, comme ceux d'un bloc. Les copies doivent rester en mémoire
pendant le rendu : `renderQuad` range des pointeurs de sommets dans `textureSortedVertex` pour la
passe texturée.

```cpp
// Division entière arrondie vers le bas (le / du C++ tronque vers zéro).
static int FloorDiv(int a, int b) {
    int q = a / b;
    if ((a % b != 0) && ((a < 0) != (b < 0))) {
        q = q - 1;
    }
    return q;
}

// Sommet source d'un indice global de ligne ou de colonne, comme Terrain_BuildVertexWindow_3266E.
struct GridSource {
    int block;
    int inBlock;
};

static GridSource SourceOf(int g, int perBlock, int blocksPerSide) {
    GridSource s;
    s.block = FloorDiv(g, perBlock);
    if (s.block < 0) {
        s.block = 0;
    }
    if (s.block > blocksPerSide - 1) {
        s.block = blocksPerSide - 1;
    }
    s.inBlock = g - FloorDiv(g, perBlock) * perBlock;
    return s;
}

// Copie du sommet affiché en (gRow, gCol) : données du sommet source, position du sommet affiché.
MapVertex RSArea::SkirtVertex(int lod, int gRow, int gCol) {
    AreaBlock *any = GetAreaBlockByID(lod, 0);
    int perBlock = any->sideSize;
    GridSource row = SourceOf(gRow, perBlock, BLOCK_PER_MAP_SIDE);
    GridSource col = SourceOf(gCol, perBlock, BLOCK_PER_MAP_SIDE);
    AreaBlock *block = GetAreaBlockByID(lod, row.block * BLOCK_PER_MAP_SIDE + col.block);
    MapVertex v = block->vertice[col.inBlock + row.inBlock * perBlock];
    float spacing = (float)BLOCK_WIDTH / (float)perBlock;
    v.v.x = gCol * spacing - BLOCK_WIDTH * BLOCK_PER_MAP_SIDE_DIV_2;
    v.v.z = gRow * spacing - BLOCK_WIDTH * BLOCK_PER_MAP_SIDE_DIV_2;
    return v;
}
```

Construction (une fois par niveau de détail), sur `skirtCells` cellules de large :

```cpp
// Grille étendue : indices globaux de lo à hi inclus, rangés dans skirtVertices[lod].
int perBlock = GetAreaBlockByID(lod, 0)->sideSize;
int side = perBlock * BLOCK_PER_MAP_SIDE;
int lo = -skirtCells * perBlock;
int hi = side - 1 + skirtCells * perBlock;
int width = hi - lo + 1;
skirtVertices[lod].resize(width * width);
for (int gRow = lo; gRow <= hi; gRow++) {
    for (int gCol = lo; gCol <= hi; gCol++) {
        skirtVertices[lod][(gRow - lo) * width + (gCol - lo)] = SkirtVertex(lod, gRow, gCol);
    }
}
```

Rendu, dans la même passe que les blocs (entre `glBegin(GL_TRIANGLES)` et `glEnd()`), en ne prenant
que les carrés **hors** de la carte (ceux de la carte sont déjà dessinés par `renderBlock`) :

```cpp
for (int gRow = lo; gRow < hi; gRow++) {
    for (int gCol = lo; gCol < hi; gCol++) {
        bool inside = (gRow >= 0) && (gRow < side - 1) && (gCol >= 0) && (gCol < side - 1);
        if (inside) {
            continue;
        }
        MapVertex *base = skirtVertices[lod].data();
        MapVertex *current = &base[(gRow - lo) * width + (gCol - lo)];
        MapVertex *right = &base[(gRow - lo) * width + (gCol + 1 - lo)];
        MapVertex *bottomRight = &base[(gRow + 1 - lo) * width + (gCol + 1 - lo)];
        MapVertex *bottom = &base[(gRow + 1 - lo) * width + (gCol - lo)];
        renderQuad(current, right, bottomRight, bottom, area);
    }
}
```

Points à garder en tête :
- **Carrés de raccord** : ceux qui touchent le bord de la carte (gRow = side − 1 ou gCol = side − 1,
  et les indices −1) sont « hors carte » au sens du test ci-dessus et sont donc pris par la jupe :
  ils relient la dernière rangée de la carte à la première copie répétée. `renderBlock` dessine déjà
  les raccords entre blocs à l'intérieur de la carte, il ne faut pas les doubler.
- **Textures** : les octets texture 1 et 2 viennent du sommet source, donc les textures se répètent
  aussi (le jeu lit l'enregistrement de 6 octets entier dans la cellule bornée).
- **Couleur d'un triangle** : la règle du sommet le plus haut s'applique telle quelle aux copies
  (voir `DATA_MODEL.md` §6.8, « Couleur affichée »).
- **Visibilité** : les carrés de la jupe n'ont pas de bloc ni d'AABB dans `computeBlockAABB` ; le plus
  simple est de les découper en « blocs virtuels » de perBlock × perBlock carrés (un par cellule
  répétée) et de leur appliquer le même test de distance et de frustum que `renderWorldSolid`.
- **Largeur** : le jeu n'a pas de largeur fixe, la jupe va aussi loin que sa fenêtre de vue. Pour le
  portage, `skirtCells` se règle sur la distance de vue (`max_view_distance` / 20 000, arrondi
  au-dessus).

## 4. Essai esthétique : casser la répétition sans toucher à la géométrie (PAS le jeu)

Ce qui suit n'existe pas dans le jeu : c'est une proposition, essayée dans `tools/terrain_3d.py`
(`--skirt-noise A`, touche N ; `--skirt-patches`, touche P). Captures : `data/ALASKA_3d_jupes.png`
(jupes du jeu) et `data/ALASKA_3d_jupes_bruit.png` (A = 90 et plaques).

Constat de l'essai : la répétition se voit surtout aux **plaques de couleur** (forêt / neige) et au
relief. Bruiter seulement l'éclairage (±4 teintes, A = 40) ne se remarque presque pas ; échanger la
couleur de base par plaques casse nettement le motif.

Deux réglages, appliqués aux **copies** de la jupe au moment de leur construction (rien ne change
dans la carte elle-même ni dans les positions) :

1. **Éclairage** : `éclairage' = clamp(éclairage + A × rampe × bruit(xMonde, zMonde), 0, 255)`, puis
   la teinte habituelle `première + (éclairage' × n + 128) >> 8`. La teinte reste dans la gamme de sa
   couleur de base.
   - bruit = `0,65 × bruitValeur(période 7,3 km) + 0,35 × bruitValeur(période 31 km)` : des périodes
     sans rapport avec les 20 km d'une cellule ;
   - rampe = `min(1, d / 30)` avec d = distance hors carte en sommets (1,5 cellule en ELV) : rien au
     bord de la carte, le raccord avec la vraie carte reste invisible.
2. **Plaques** : sur les sommets à plus d'une demi-cellule hors carte, si `bruitValeur(période 23 km)`
   dépasse 0,25, la couleur de base 4 (forêt) devient 6 (neige) et inversement. La mer (0) et les
   autres couleurs ne changent pas. Dans l'outil, le test est fait au premier sommet du triangle.

Le bruit dépend de la position monde du sommet **affiché** (gLigne, gColonne), pas du sommet source :
deux répétitions d'une même cellule reçoivent donc des valeurs différentes. Il est déterministe
(hash entier), les jupes sont les mêmes à chaque chargement.

```cpp
// Valeur pseudo-aléatoire déterministe dans [-1, 1] pour un nœud entier (i, j).
static float Hash01(int i, int j) {
    uint32_t h = (uint32_t)i * 374761393u + (uint32_t)j * 668265263u;
    h = (h ^ (h >> 13)) * 1274126177u;
    h = h ^ (h >> 16);
    return (float)(h & 0xFFFF) / 32767.5f - 1.0f;
}

// Bruit de valeur lisse : interpolation smoothstep entre des nœuds espacés de « period » mètres.
static float ValueNoise(float x, float z, float period) {
    float fx = x / period;
    float fz = z / period;
    int i0 = (int)floorf(fx);
    int j0 = (int)floorf(fz);
    float u = fx - (float)i0;
    float v = fz - (float)j0;
    u = u * u * (3.0f - 2.0f * u);
    v = v * v * (3.0f - 2.0f * v);
    float a = Hash01(i0, j0);
    float b = Hash01(i0 + 1, j0);
    float c = Hash01(i0, j0 + 1);
    float d = Hash01(i0 + 1, j0 + 1);
    float top = a * (1.0f - u) + b * u;
    float bottom = c * (1.0f - u) + d * u;
    return top * (1.0f - v) + bottom * v;
}

// À appeler dans SkirtVertex, sur la copie, avant de calculer sa couleur RVB.
// side = sommets par côté de la carte (360 en ELV) ; amplitude ≈ 40 à 90.
static void ApplySkirtNoise(MapVertex *v, int gRow, int gCol, int side, int perBlock, float spacing,
                            float amplitude, bool patches) {
    int out = 0;
    out = std::max(out, -gRow);
    out = std::max(out, gRow - (side - 1));
    out = std::max(out, -gCol);
    out = std::max(out, gCol - (side - 1));
    if (out == 0) {
        return;
    }
    float x = gCol * spacing;
    float z = gRow * spacing;
    float ramp = std::min(1.0f, (float)out / (1.5f * (float)perBlock));
    float n = 0.65f * ValueNoise(x, z, 7300.0f) + 0.35f * ValueNoise(x + 5000.0f, z - 9000.0f, 31000.0f);
    int light = (int)lroundf((float)v->flag + amplitude * ramp * n);
    light = std::max(0, std::min(255, light));
    v->flag = (uint8_t)light;
    if (patches && out >= perBlock / 2) {
        bool swap = ValueNoise(x - 3000.0f, z + 11000.0f, 23000.0f) > 0.25f;
        if (swap && v->type == 4) {
            v->type = 6;
        } else if (swap && v->type == 6) {
            v->type = 4;
        }
    }
}
```

`flag` et `type` sont les octets éclairage (+2) et couleur (+3) du sommet. Après l'appel, la couleur
RVB de la copie se calcule comme pour un sommet normal, avec la formule de teinte du jeu
(`DATA_MODEL.md` §6.8).

## 5. Essai esthétique : lissage moyen des jupes (PAS le jeu)

Autre proposition de Rémi, essayée dans `tools/terrain_3d.py` (`--skirt-smooth R`, touche M ;
`--skirt-smooth-height` pour lisser aussi l'altitude). Captures : `data/ALASKA_3d_jupes_lissage.png`
(vue de coin, R = 8, altitude lissée) et `data/ALASKA_3d_jupes_lissage_sol.png` (vue basse au nord).

Principe : chaque sommet hors carte prend la **moyenne** d'un carré de (2r + 1) × (2r + 1) sommets
de la grille étendue autour de lui (valeurs répétées du jeu, §2), avec un rayon qui grandit avec la
distance au bord :

```
d = distance hors carte, en sommets (0 dans la carte)
r = round(R × min(1, d / (1,5 × n)))        (n = sommets par cellule ; r = 0 au bord)
éclairage' = moyenne des éclairages du carré
couleur'   = couleur la plus fréquente du carré (une moyenne d'indices de couleur n'a pas de sens)
altitude'  = moyenne des altitudes du carré (option)
```

Constat de l'essai (ALASKA, R = 8, soit ±8 km) :
- la répétition disparaît : au-delà d'environ une cellule, les jupes deviennent une surface douce,
  avec de grandes plaques de couleur, qui prolonge le caractère du bord (neige au nord, mer au sud) ;
- le raccord avec la carte reste continu (r = 0 au bord) ;
- avec l'altitude lissée, le relief s'aplatit nettement : vu de près, la jupe devient une plaine,
  ce qui contraste avec le relief de la carte ; sans l'altitude, le relief répété reste, mais ses
  couleurs sont unies ;
- des bandes restent visibles perpendiculairement au bord : le long du bord, les cellules ne se
  répètent pas et diffèrent entre elles, la moyenne les adoucit sans les effacer ;
- l'outil garde l'altitude non lissée pour poser la caméra au-dessus du sol (`Terrain.ground`).

Calcul : des **tables de sommes cumulées** (une par grandeur, et une par couleur pour la couleur
majoritaire) donnent la somme d'un carré en 4 lectures, quel que soit r. Le calcul se fait une fois,
au chargement de la carte (2,6 s en Python pour 4 cellules de jupe ; négligeable en C++).

```cpp
// Table de sommes cumulées sur la grille étendue (width × width), valeurs lues avec SkirtVertex.
// sat[(a + 1) * (width + 1) + (b + 1)] = somme des valeurs des lignes 0..a et colonnes 0..b.
static std::vector<double> BuildSat(const std::vector<float> &values, int width) {
    std::vector<double> sat((width + 1) * (width + 1), 0.0);
    for (int a = 0; a < width; a++) {
        double row = 0.0;
        for (int b = 0; b < width; b++) {
            row += values[a * width + b];
            sat[(a + 1) * (width + 1) + (b + 1)] = sat[a * (width + 1) + (b + 1)] + row;
        }
    }
    return sat;
}

// Somme du carré de rayon r centré sur (a, b) ; le carré doit rester dans la grille.
static double BoxSum(const std::vector<double> &sat, int width, int a, int b, int r) {
    int a0 = a - r;
    int b0 = b - r;
    int a1 = a + r + 1;
    int b1 = b + r + 1;
    int w = width + 1;
    return sat[a1 * w + b1] - sat[a0 * w + b1] - sat[a1 * w + b0] + sat[a0 * w + b0];
}
```

La grille étendue doit déborder de R sommets au-delà de la jupe pour que les carrés des sommets les
plus éloignés restent dedans. Ensuite, pour chaque copie de sommet hors carte : `flag` = moyenne de
l'éclairage, `type` = couleur dont la somme d'indicateurs est la plus grande, et éventuellement
`v.y` = moyenne de l'altitude × `HEIGH_MAP_SCALE`, puis la couleur RVB comme pour un sommet normal.
Le lissage peut se combiner avec le bruit et les plaques de la section 4 (le lissage d'abord).
