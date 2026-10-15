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
