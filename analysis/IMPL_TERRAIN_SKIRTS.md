# Jupes du terrain : continuer la carte au-delà des bords (à porter dans libRealSpace)

Rédigé le 2026-10-15, mis à jour pour le port. Repère Y-up, mètres.

Le document a deux parties :
- **Partie A — ce que fait le jeu** (§1 à §3) : la cellule du bord se répète au-delà de la carte. C'est
  le comportement de l'original, lu dans le code.
- **Partie B — l'habillage retenu** (§4 à §6), qui **n'existe pas dans le jeu** : lissage RVB des
  jupes, bruit qui reste dans les teintes de la carte, transition douce. C'est le résultat des essais
  faits avec Rémi dans `tools/terrain_3d.py` et la vue WebGL.
- Annexe : les variantes essayées puis écartées, et ce qui n'est pas établi.

Outils de référence (mêmes calculs, même bruit, mêmes résultats) :
- `python3 tools/terrain_3d.py data/ALASKA.PAK --skirt-smooth 8 --skirt-smooth-rgb --skirt-noise-rgb 60 --skirt-ramp 3`
  (touches J jupes, M lissage, C RVB, B bruit) ;
- vue WebGL `data/ALASKA_3d.html` (régénérée par `tools/terrain_viewer.py`) : section « Jupes : essais
  esthétiques », destination « coin nord-ouest ».

Captures (`data/`) : `ALASKA_3d_jupes.png` (jupes du jeu), `ALASKA_3d_jupes_rvb_bruit.png` et
`ALASKA_3d_jupes_rvb_bruit_sol.png` (habillage retenu, Pygame), `ALASKA_3d_web_jupes.png` (WebGL).

---

# Partie A — ce que fait le jeu

## 1. La règle

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
chaque raccord de répétition (le bord droit de la cellule touche son propre bord gauche).

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

## 2. La formule

Pour un indice global `g` (ligne ou colonne, entier, éventuellement négatif ou ≥ 18 × n) :

```
cellule(g)      = clamp(floor(g / n), 0, 17)
dansCellule(g)  = g mod n            (toujours dans [0, n − 1])
```

Le sommet affiché en (gLigne, gColonne) prend les données du sommet
`dansCellule(gColonne) + dansCellule(gLigne) × n` de la cellule `cellule(gLigne) × 18 + cellule(gColonne)`,
et sa position monde est celle de (gLigne, gColonne) : `gColonne × espacement − 180 000`, et de même
pour la ligne, avec l'espacement du niveau de détail (1000 m en ELV, 2000 m en MED, 4000 m en LOW).

Exemples (n = 20) : g = −1 → cellule 0, sommet 19 ; g = −20 → cellule 0, sommet 0 ;
g = 360 → cellule 17, sommet 0 ; g = 379 → cellule 17, sommet 19.

La règle porte sur des **indices de grille**, pas sur des coordonnées : elle s'applique telle quelle
à la convention de `RSArea` (lignes de cellules vers +z depuis −180 000), sans se soucier du signe
de l'axe.

## 3. Jupes du jeu dans `RSArea` / `SCRenderer`

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
// Grille de la jupe : indices globaux de lo à hi inclus, rangés dans skirtVertices[lod].
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

---

# Partie B — l'habillage retenu (PAS le jeu)

## 4. Le principe

Trois effets, appliqués **aux copies des sommets de la jupe, une fois au chargement**. Rien ne change
dans la carte elle-même, et la géométrie de la jupe reste celle du jeu (l'altitude n'est pas lissée
par défaut, voir §6).

1. **Transition douce.** Tout l'effet est pondéré par une rampe en S qui vaut 0 au bord de la carte
   et 1 à `rampCells` cellules (3 par défaut) :
   ```
   d     = distance hors carte, en sommets = max(0, −gLigne, gLigne − (côté − 1), −gColonne, gColonne − (côté − 1))
   x     = min(1, d / (rampCells × n))
   rampe = x² × (3 − 2x)
   ```
2. **Lissage RVB.** Chaque sommet hors carte prend la couleur moyenne d'un carré de (2r + 1)² sommets
   autour de lui, sur la grille répétée du jeu (§2), avec `r = round(R × rampe)` (R = 8 km, soit 8
   sommets en ELV). Le blanc de la neige et le vert de la forêt se mélangent ; la répétition disparaît.
3. **Bruit dans les teintes de la carte.** Pour ne pas obtenir un flou uniforme, chaque couleur de
   base présente dans le carré **glisse le long de sa propre gamme de palette** (`RANG`) d'un décalage
   d'éclairage bruité, puis les couleurs sont mélangées selon leur part. Toute couleur affichée est
   ainsi une teinte de la palette ou un mélange de teintes présentes autour.

Formule complète, pour un sommet hors carte avec r > 0 :

```
décalage = A × rampe × (0,65 × bruitValeur(x, z, 7 300 m) + 0,35 × bruitValeur(x + 5 000, z − 9 000, 31 000 m))
pour chaque couleur de base c :
    part_c      = (nombre de sommets de couleur c du carré) / (2r + 1)²
    éclairage_c = moyenne de l'éclairage des sommets de couleur c du carré
RVB = Σ_c part_c × palette[première_c + ((éclairage_c + décalage) × n_c + 128) >> 8]
```

- `x`, `z` = position monde du sommet **affiché** (gColonne × espacement, gLigne × espacement) : deux
  répétitions d'une même cellule reçoivent un bruit différent. Les périodes (7,3 km et 31 km) n'ont
  pas de rapport avec les 20 km d'une cellule. Le bruit est déterministe (hash entier).
- L'éclairage décalé est borné à [0, 255] avant le calcul de teinte ; `première_c` et `n_c` sont la
  première teinte et le nombre de teintes de la couleur c (chunk `RANG` de `PALETTE.IFF`).
- Sommets avec r = 0 (au ras du bord, quand R × rampe < 0,5) : on garde la copie du jeu, dessinée
  avec la règle du jeu. Dans les outils, le décalage du bruit y est aussi appliqué, mais il vaut au plus
  A / 16 (≈ 4 unités d'éclairage, moins d'une teinte) : on peut l'ignorer.

## 5. Réglages

| Réglage | Valeur de l'essai | Rôle |
|---|---|---|
| `skirtCells` | 4 (80 km) | largeur des jupes ; à régler sur la distance de vue |
| `rampCells` | 3 cellules (60 km) | largeur de la transition carte → jupe |
| `smoothMeters` | 8 000 m | rayon maximal du lissage (R = smoothMeters / espacement : 8 en ELV, 4 en MED, 2 en LOW) |
| `noiseAmplitude` (A) | 60 | amplitude du bruit, en unités de l'octet d'éclairage (40 à 80 conseillé) |
| périodes du bruit | 7 300 m et 31 000 m (poids 0,65 / 0,35) | taille des marbrures |

Avec `skirtCells` = 4 et `rampCells` = 3, la zone pleinement lissée ne fait qu'une cellule : avec
une jupe plus large, la transition se voit mieux.

## 6. Code pour `RSArea` / `SCRenderer`

Prérequis : `RSArea` garde la table `RANG` (première teinte et nombre de teintes par couleur de
base), nécessaire de toute façon pour corriger le calcul de teinte du renderer actuel. Ci-dessous,
`rangFirst[c]`, `rangCount[c]` et `rangSize` (nombre de couleurs de base, 7 pour `PALETTE.IFF`).

### 6.1 Outils : rampe, bruit, teinte, sommes cumulées

```cpp
// Distance hors carte, en sommets (0 dans la carte).
static int OutOfMap(int gRow, int gCol, int side) {
    int out = 0;
    out = std::max(out, -gRow);
    out = std::max(out, gRow - (side - 1));
    out = std::max(out, -gCol);
    out = std::max(out, gCol - (side - 1));
    return out;
}

// Rampe en S : 0 au bord de la carte, 1 à rampCells cellules.
static float SkirtRamp(int out, int perBlock, float rampCells) {
    float x = std::min(1.0f, (float)out / (rampCells * (float)perBlock));
    return x * x * (3.0f - 2.0f * x);
}

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

// Décalage d'éclairage du bruit pour le sommet affiché en (x, z) mètres.
static float SkirtLightShift(float x, float z, float amplitude, float ramp) {
    float n = 0.65f * ValueNoise(x, z, 7300.0f) + 0.35f * ValueNoise(x + 5000.0f, z - 9000.0f, 31000.0f);
    return amplitude * ramp * n;
}

// Teinte RVB (0..1) de la couleur de base c pour un éclairage lv, formule du jeu.
void RSArea::PaletteRgb(int c, float lv, float rgb[3]) {
    if (c < 0 || c >= rangSize) {
        c = 0;
    }
    int light = std::max(0, std::min(255, (int)lroundf(lv)));
    int tone = rangFirst[c] + ((light * rangCount[c] + 128) >> 8);
    tone = std::min(255, tone);
    Texel *t = Renderer.getPalette()->GetRGBColor(tone);
    rgb[0] = t->r / 255.0f;
    rgb[1] = t->g / 255.0f;
    rgb[2] = t->b / 255.0f;
}

// Table de sommes cumulées (width × width) : sat[(a + 1) * (width + 1) + (b + 1)] = somme des
// valeurs des lignes 0..a et colonnes 0..b.
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

### 6.2 Construction de la jupe habillée (une fois par niveau de détail)

La grille de travail déborde de R sommets au-delà de la jupe, pour que les carrés des sommets les
plus éloignés restent dedans. Les tables (deux par couleur de base) ne servent qu'à la construction :
elles peuvent être libérées ensuite.

```cpp
struct SkirtSettings {
    int cells;
    float rampCells;
    float smoothMeters;
    float noiseAmplitude;
};

struct SkirtGrid {
    int lo;
    int width;
    int side;
    std::vector<MapVertex> vertices;
    std::vector<uint8_t> smoothed;
};

void RSArea::BuildSkirt(int lod, const SkirtSettings &settings, SkirtGrid *grid) {
    int perBlock = GetAreaBlockByID(lod, 0)->sideSize;
    int side = perBlock * BLOCK_PER_MAP_SIDE;
    float spacing = (float)BLOCK_WIDTH / (float)perBlock;
    int radius = std::max(1, (int)lroundf(settings.smoothMeters / spacing));

    // Grille de travail : jupe + marge du rayon ; deux valeurs par couleur de base.
    int wlo = -settings.cells * perBlock - radius;
    int wwidth = side + 2 * (settings.cells * perBlock + radius);
    std::vector<std::vector<float>> isColour(rangSize, std::vector<float>(wwidth * wwidth, 0.0f));
    std::vector<std::vector<float>> lightOfColour(rangSize, std::vector<float>(wwidth * wwidth, 0.0f));
    for (int a = 0; a < wwidth; a++) {
        for (int b = 0; b < wwidth; b++) {
            MapVertex src = SkirtVertex(lod, wlo + a, wlo + b);
            int c = src.type;
            if (c < 0 || c >= rangSize) {
                c = 0;
            }
            isColour[c][a * wwidth + b] = 1.0f;
            lightOfColour[c][a * wwidth + b] = (float)src.flag;
        }
    }
    std::vector<std::vector<double>> satColour(rangSize);
    std::vector<std::vector<double>> satLight(rangSize);
    for (int c = 0; c < rangSize; c++) {
        satColour[c] = BuildSat(isColour[c], wwidth);
        satLight[c] = BuildSat(lightOfColour[c], wwidth);
    }

    // Jupe affichée : copies du jeu (§3), puis couleur habillée là où r > 0.
    grid->lo = -settings.cells * perBlock;
    grid->width = side + 2 * settings.cells * perBlock;
    grid->side = side;
    grid->vertices.resize(grid->width * grid->width);
    grid->smoothed.assign(grid->width * grid->width, 0);
    for (int gRow = grid->lo; gRow < grid->lo + grid->width; gRow++) {
        for (int gCol = grid->lo; gCol < grid->lo + grid->width; gCol++) {
            int index = (gRow - grid->lo) * grid->width + (gCol - grid->lo);
            MapVertex v = SkirtVertex(lod, gRow, gCol);
            int out = OutOfMap(gRow, gCol, side);
            if (out > 0) {
                float ramp = SkirtRamp(out, perBlock, settings.rampCells);
                int r = (int)lroundf((float)radius * ramp);
                if (r > 0) {
                    int a = gRow - wlo;
                    int b = gCol - wlo;
                    double area = (double)((2 * r + 1) * (2 * r + 1));
                    float shift = SkirtLightShift(gCol * spacing, gRow * spacing, settings.noiseAmplitude, ramp);
                    float rgb[3];
                    float mix[3];
                    mix[0] = 0.0f;
                    mix[1] = 0.0f;
                    mix[2] = 0.0f;
                    for (int c = 0; c < rangSize; c++) {
                        double count = BoxSum(satColour[c], wwidth, a, b, r);
                        if (count <= 0.0) {
                            continue;
                        }
                        float part = (float)(count / area);
                        float light = (float)(BoxSum(satLight[c], wwidth, a, b, r) / count);
                        PaletteRgb(c, light + shift, rgb);
                        mix[0] += part * rgb[0];
                        mix[1] += part * rgb[1];
                        mix[2] += part * rgb[2];
                    }
                    v.color[0] = mix[0];
                    v.color[1] = mix[1];
                    v.color[2] = mix[2];
                    grid->smoothed[index] = 1;
                }
            }
            grid->vertices[index] = v;
        }
    }
}
```

Mémoire de travail en ELV avec les réglages du §5 : grille de 536 × 536 sommets, 7 couleurs × 2
tables de `double` ≈ 32 Mo pendant la construction (libérés à la sortie de la fonction).

### 6.3 Rendu

Un sommet **lissé** porte déjà sa couleur finale (`color`) et doit être dessiné **tel quel**, sans la
règle « couleur du sommet le plus haut » de `renderColoredTriangle`. Un sommet **non lissé** garde la
règle du jeu. Un triangle peut mélanger les deux (dans la zone de transition) :

```cpp
// Triangle de jupe : couleur lissée pour les sommets lissés, règle du jeu pour les autres.
void SCRenderer::renderSkirtTriangle(RSArea *area, const SkirtGrid &grid, int k0, int k1, int k2) {
    int ks[3];
    ks[0] = k0;
    ks[1] = k1;
    ks[2] = k2;
    // Couleur de base du jeu : celle du sommet le plus haut (à égalité, le dernier).
    int top = ks[0];
    for (int q = 1; q < 3; q++) {
        if (grid.vertices[ks[q]].v.y >= grid.vertices[top].v.y) {
            top = ks[q];
        }
    }
    int baseColour = grid.vertices[top].type;
    for (int q = 0; q < 3; q++) {
        const MapVertex &v = grid.vertices[ks[q]];
        if (grid.smoothed[ks[q]]) {
            glColor3f(v.color[0], v.color[1], v.color[2]);
        } else {
            float rgb[3];
            area->PaletteRgb(baseColour, (float)v.flag, rgb);
            glColor3f(rgb[0], rgb[1], rgb[2]);
        }
        glVertex3f(v.v.x, v.v.y, v.v.z);
    }
}
```

Boucle de rendu des carrés hors carte, avec le même découpage que `renderQuad` (triangle bas :
courant, bas-droite, bas ; triangle haut : courant, droite, bas-droite) :

```cpp
for (int gRow = grid.lo; gRow < grid.lo + grid.width - 1; gRow++) {
    for (int gCol = grid.lo; gCol < grid.lo + grid.width - 1; gCol++) {
        bool inside = (gRow >= 0) && (gRow < grid.side - 1) && (gCol >= 0) && (gCol < grid.side - 1);
        if (inside) {
            continue;
        }
        int current = (gRow - grid.lo) * grid.width + (gCol - grid.lo);
        int right = current + 1;
        int bottom = current + grid.width;
        int bottomRight = bottom + 1;
        bool anySmoothed = grid.smoothed[current] || grid.smoothed[right] || grid.smoothed[bottom] ||
                           grid.smoothed[bottomRight];
        if (!anySmoothed) {
            // Carré entièrement « jeu » : chemin normal, textures comprises.
            MapVertex *base = (MapVertex *)grid.vertices.data();
            renderQuad(&base[current], &base[right], &base[bottomRight], &base[bottom], area);
            continue;
        }
        renderSkirtTriangle(area, grid, current, bottomRight, bottom);
        renderSkirtTriangle(area, grid, current, right, bottomRight);
    }
}
```

Remarques pour le rendu :
- **Comparaison des hauteurs** : le jeu compare les hauteurs brutes en **non signé** (§6.8 de
  `DATA_MODEL.md`) ; avec `v.y` en flottant, une hauteur négative ne passe pas devant les positives.
  Si `MapVertex` garde la hauteur brute, l'utiliser à la place pour être exact.
- **Textures** : les essais n'ont dessiné aucune texture sur les jupes. La proposition ci-dessus garde
  les textures (via `renderQuad`) sur les carrés entièrement « jeu », près du bord, et n'en met pas
  sur les carrés lissés, où une texture répétée trahirait la répétition. C'est un choix à valider
  à l'écran.
- **Ombrage plat** : en mode « face unie », prendre la moyenne RVB des 3 couleurs du triangle.
- **Visibilité** et **largeur** : mêmes remarques qu'au §3 (blocs virtuels par cellule répétée,
  `skirtCells` réglé sur la distance de vue).

---

# Annexe

## A.1 Option : lisser aussi l'altitude

Une table de sommes cumulées de plus sur la hauteur des sommets source donne la hauteur moyenne du
carré ; on la met dans `v.v.y` (× `HEIGH_MAP_SCALE`) des copies lissées. Constat de l'essai
(`--skirt-smooth-height`, case « lisser aussi l'altitude ») : vu de haut, la jupe devient une surface
douce ; vu de près, elle devient une plaine qui contraste avec le relief de la carte. Si on l'active,
la requête d'altitude hors carte (caméra, collisions) doit lire la même hauteur lissée, sinon un
avion peut traverser le sol affiché.

## A.2 Variantes essayées puis écartées

| Variante | Constat |
|---|---|
| Bruit sur l'octet d'éclairage seul (±4 teintes) | presque invisible : la répétition vient surtout des plaques de couleur et du relief |
| Échange forêt ↔ neige par plaques de bruit | casse le motif, mais bords en dents de scie (couleur changée par triangle) |
| Lissage de l'éclairage + couleur majoritaire | la répétition disparaît, mais les frontières de couleur restent nettes ; le lissage RVB est meilleur |
| Bruit RVB par canal (± A/3, puis ± A/12) | sort des teintes de la carte (reflets rose et violet) ; remplacé par le glissement le long des gammes |
| Rampe linéaire sur 1,5 cellule | frontière carte / jupe trop nette ; remplacée par la rampe en S sur 3 cellules |

Les options correspondantes restent dans `tools/terrain_3d.py` pour comparaison :
`--skirt-noise` (touche N), `--skirt-patches` (P), `--skirt-smooth` sans `--skirt-smooth-rgb` (M sans C).

## A.3 Non établi

- La requête d'altitude du jeu (`Terrain_QueryAltitudeAt`) hors carte : elle n'a pas été lue. Les
  outils appliquent la règle du §2 au sol sous la caméra.
- Les niveaux de détail MED et LOW : la règle du jeu est la même (n différent, lu dans
  `Terrain_BuildVertexWindow_3266E`), mais l'habillage n'a été essayé qu'en ELV.
