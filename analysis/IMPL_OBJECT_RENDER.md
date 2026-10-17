# Rendu des objets 3D : ce qu'il faut porter dans `SCRenderer` (libRealSpace)

Rédigé le 2026-10-16. Repère Y-up de libRealSpace (`x = c0`, `y = c2`, `z = −c1`), mètres.

Ce document complète `OBJECT_RENDER.md`, qui décrit ce que fait le jeu, fonction par fonction.
Ici : **quoi changer dans `SCRenderer::drawModel`** et ses passes, avec le C++ prêt à copier.
Le code est au style du projet. Il a été compilé avec `g++ -Wall -Wextra` contre des types
simulés (`Vector3D`, `Texel`, `VGAPalette`, `Triangle`, `RSEntity` réduits aux champs utilisés), et
il est passé par `clang-format` et `tools/sc_player/tools/style_check.py`.

Les choix de rendu de la partie B ont été essayés dans la visionneuse
`data/F-16DES_viewer.html`, générée par `python3 tools/object_viewer.py data/<OBJET>.IFF`.
Elle propose les modes « jeu », « entre-deux », « tout éclairé », « SCRenderer » et « OpenGL
GL_LIGHTING », les réglages de textures et le brouillard. La planche `data/F-16DES_modes.png`
compare les rendus « jeu », « entre-deux » et « SCRenderer ».

**Choix retenu pour l'implémentation (2026-10-16, révisé le même jour par Rémi) : le mode « tout
éclairé »**, c'est-à-dire `COLOUR_ALL_LIT` de la §6 (mode `all` de la visionneuse) :
- **toutes les faces éclairées par sommet**, quel que soit leur type : intensité de la normale de
  sommet ; pour une face double vue de dos, normale de face inversée ; lumière directionnelle du
  `LGHT` ;
- la teinte **continue en RVB le long de la gamme RANG** (`shadeAlongRamp`), au lieu de l'index entier ;
- les textures (types 6, 7, 8) en **`GL_MODULATE`** : texel × intensité du sommet, donnée par
  `glColor4f(i, i, i, 1)`, **type 6 compris** ; textures coupées : le type 6 prend la couleur de son
  1er texel, assombrie le long de la gamme comme une face ;
- type 2 (translucide) : inchangé, passe transparente.

Ce mode n'est pas celui du jeu (qui n'éclaire pas les faces 1, 5, 6 et éclaire 4, 7 par face) : c'est
un choix de rendu. Les modes `COLOUR_GAME` et `COLOUR_HYBRID` (mode intermédiaire, choisi d'abord)
restent dans le code pour comparer.

Correspondance des champs avec libRealSpace :

| `VTRI` (8 octets) | `Triangle` | Sens |
|---|---|---|
| octet 0 | `property` | type de face, 0 à 9 |
| octets 1 à 3 | `ids[0..2]` | sommets |
| octet 4 | `color` | couleur, teinte à pleine lumière |
| octet 7, bit 0 | `flags[2] == 1` | face double |

---

# Partie A — les écarts entre `SCRenderer` et le jeu

| Point | `SCRenderer` aujourd'hui | Jeu | Section |
|---|---|---|---|
| Couleur éclairée | RVB de la palette × lambert : tend vers le noir | descend la **gamme RANG** de la couleur : la teinte change (le gris 62 du F-16 devient sable) | §2, §6 |
| Faces éclairées | toutes | selon le type : 1, 5, 6 jamais ; 4, 7 par face ; 3, 8 par sommet | §4, §6 |
| Lumière | ponctuelle (`lightEye − vEye`), ambiante 0,4 | **directionnelle** (1re lumière de `WRLD/LGHT`), parts ambiante / diffuse du `LGHT` (0,37 / 0,62 avec MISSION.IFF) | §3 |
| Face double | `fabs(N·L)` : éclairée des deux côtés | normale **inversée** si la face est vue de dos | §5, §6 |
| Normales de sommet | faces du LOD seul, après `FixEntityWinding` | toutes les faces du fichier, sans réorientation | §5 |
| Sens des faces | `FixEntityWinding` puis `glFrontFace(GL_CW)` | les données sont déjà orientées : `GL_CW` suffit, sans réorienter | §5 |
| Textures | `GL_MODULATE` par lambert, `GL_LINEAR`, seuil alpha 0,1 | remappage par une table `FADE` selon l'intensité (fichier absent) ; texel `0xFF` transparent | §7 |
| Brouillard | aucun | l'index glisse vers le gris 192 de sa gamme, 32 paliers | §8 |
| Niveau de détail | `object_detail` fixé | choisi par la distance (`LVLn`) | §9 |

La normale de face de `SCRenderer` est déjà la bonne. `AccumulateFaceNormal` calcule `(V0 − V1) × (V2 − V1)`, ce qui
est exactement `(V0 − V2) × (V0 − V1)` du jeu (`Face_ComputeNormal_2931E`) développé autrement.

---

# Partie B — le code

## 2. Gammes RANG

Il faut garder les 3 premiers `uint16` de chaque enregistrement de 13 octets du chunk `RANG` de
`PALETTE.IFF` : première teinte, nombre de teintes, et 3e champ (fin de la gamme, c'est aussi la
teinte de brouillard). Une couleur appartient à une gamme si `first ≤ colour ≤ first + span`,
**bornes comprises**.

Deux façons d'assombrir sont proposées :
- `shadeIndex` : l'index entier du jeu, exact ;
- `shadeAlongRamp` : la même règle, mais continue en RVB. La teinte glisse entre deux couleurs
  voisines de la gamme. C'est le compromis retenu dans la visionneuse : la nuance du jeu avec la
  douceur du RVB.

```cpp
// Les 3 premiers uint16 de chaque enregistrement de 13 octets du chunk RANG.
struct RangRamp {
    int first;
    int count;
    int span;
};

// Table_LookupByRange_2E975 : première gamme telle que first <= colour <= first + span.
int rampOf(const std::vector<RangRamp> &ramps, int colour) {
    for (size_t k = 0; k < ramps.size(); k++) {
        if (ramps[k].first <= colour && colour <= ramps[k].first + ramps[k].span) {
            return (int)k;
        }
    }
    return -1;
}

// Palette_ShadeIndexWithFog_2F24E sans brouillard : index de palette du jeu.
// intensity255 = intensité entière 0..255 du jeu.
int shadeIndex(const std::vector<RangRamp> &ramps, int colour, int intensity255) {
    int r = rampOf(ramps, colour);
    if (r < 0) {
        return colour;
    }
    int n = colour - ramps[r].first;
    if (n == 0) {
        n = ramps[r].count;
    }
    return ramps[r].first + ((intensity255 * n + 0x80) >> 8);
}

// Variante continue en RVB : on glisse entre deux teintes voisines de la gamme.
// intensity = 0..1 ; 1 donne la couleur elle-même, 0 la première teinte de la gamme.
Vector3D shadeAlongRamp(const std::vector<RangRamp> &ramps, VGAPalette &palette, int colour, float intensity) {
    Vector3D rgb;
    int r = rampOf(ramps, colour);
    if (r < 0) {
        const Texel *c = palette.GetRGBColor(colour);
        rgb.x = c->r / 255.0f * intensity;
        rgb.y = c->g / 255.0f * intensity;
        rgb.z = c->b / 255.0f * intensity;
        return rgb;
    }
    int first = ramps[r].first;
    int n = colour - first;
    if (n == 0) {
        n = ramps[r].count;
    }
    float t = intensity * n;
    int k0 = (int)t;
    if (k0 > n - 1) {
        k0 = n - 1;
    }
    float f = t - k0;
    const Texel *a = palette.GetRGBColor(first + k0);
    const Texel *b = palette.GetRGBColor(first + k0 + 1);
    rgb.x = (a->r + (b->r - a->r) * f) / 255.0f;
    rgb.y = (a->g + (b->g - a->g) * f) / 255.0f;
    rgb.z = (a->b + (b->b - a->b) * f) / 255.0f;
    return rgb;
}
```

## 3. Lumière du monde et intensité

`makeObjectLight` prend les valeurs du chunk `LGHT` du monde. Le jeu n'utilise que la **première**
lumière (`LightSet_FaceIntensity_2B54A`). La direction est fixe dans le monde : à chaque objet, elle
est repassée dans le repère de l'objet (`Matrix_WorldToLocal_58768`). Les normales s'utilisent
alors telles quelles, sans les transformer.

Dans `SCRenderer::drawModel`, avec `MV` (`glGetFloatv(GL_MODELVIEW_MATRIX)`) et `V`
(`camera.getViewMatrix()->ToGL()`), `worldDirToObject` donne la lumière dans le repère de l'objet et
`eyeInObject` donne la position de l'œil dans ce même repère. Ces deux fonctions supposent une
matrice sans échelle : avec le `glScalef` de la tuyère, renormaliser.

```cpp
static float dot3(const Vector3D &a, const Vector3D &b) {
    return a.x * b.x + a.y * b.y + a.z * b.z;
}

static Vector3D normalize3(Vector3D v) {
    float l = std::sqrt(dot3(v, v));
    if (l > 0.0f) {
        v.x /= l;
        v.y /= l;
        v.z /= l;
    }
    return v;
}

struct ObjectLight {
    Vector3D dirWorld; // vers la lumière, repère libRS, normalisée
    float ambient;     // poids ambiant / total  (0,37 avec MISSION.IFF)
    float share;       // poids lumière / total  (0,62)
};

// LGHT : uint16 poids ambiant, uint16 pourcentage, puis par lumière uint16 poids et 3 int16 direction
// (ordre fichier c0, c1, c2 ; libRS x = c0, y = c2, z = -c1). Seule la 1re lumière éclaire.
ObjectLight makeObjectLight(int ambientWeight, int lightWeight, int c0, int c1, int c2) {
    ObjectLight l;
    float total = (float)(ambientWeight + lightWeight);
    l.ambient = ambientWeight / total;
    l.share = lightWeight / total;
    Vector3D d;
    d.x = (float)c0;
    d.y = (float)c2;
    d.z = (float)-c1;
    l.dirWorld = normalize3(d);
    return l;
}

// La lumière dans le repère de l'objet : transposée de la rotation de l'objet appliquée à la
// direction monde (Matrix_WorldToLocal_58768). rot = les 3 axes de l'objet en lignes (repère libRS).
Vector3D lightInObject(const ObjectLight &light, const float rot[3][3]) {
    Vector3D d;
    d.x = rot[0][0] * light.dirWorld.x + rot[0][1] * light.dirWorld.y + rot[0][2] * light.dirWorld.z;
    d.y = rot[1][0] * light.dirWorld.x + rot[1][1] * light.dirWorld.y + rot[1][2] * light.dirWorld.z;
    d.z = rot[2][0] * light.dirWorld.x + rot[2][1] * light.dirWorld.y + rot[2][2] * light.dirWorld.z;
    return normalize3(d);
}

// Dans SCRenderer::drawModel : MV = glGetFloatv(GL_MODELVIEW_MATRIX), V = matrice de vue de la caméra
// (column-major, sans échelle). Direction monde -> repère de l'objet : d_objet = MV3^T . (V3 . d_monde).
Vector3D worldDirToObject(const float MV[16], const float V[16], const Vector3D &dWorld) {
    Vector3D e;
    e.x = V[0] * dWorld.x + V[4] * dWorld.y + V[8] * dWorld.z;
    e.y = V[1] * dWorld.x + V[5] * dWorld.y + V[9] * dWorld.z;
    e.z = V[2] * dWorld.x + V[6] * dWorld.y + V[10] * dWorld.z;
    Vector3D d;
    d.x = MV[0] * e.x + MV[1] * e.y + MV[2] * e.z;
    d.y = MV[4] * e.x + MV[5] * e.y + MV[6] * e.z;
    d.z = MV[8] * e.x + MV[9] * e.y + MV[10] * e.z;
    return normalize3(d);
}

// Position de l'œil dans le repère de l'objet : -MV3^T . t, t = translation de MV.
Vector3D eyeInObject(const float MV[16]) {
    Vector3D p;
    p.x = -(MV[0] * MV[12] + MV[1] * MV[13] + MV[2] * MV[14]);
    p.y = -(MV[4] * MV[12] + MV[5] * MV[13] + MV[6] * MV[14]);
    p.z = -(MV[8] * MV[12] + MV[9] * MV[13] + MV[10] * MV[14]);
    return p;
}

// LightSet_FaceIntensity_2B54A : ambiante + max(0, L.N) x part, bornée à 1.
float objectIntensity(const ObjectLight &light, const Vector3D &lightLocal, const Vector3D &normal) {
    float d = dot3(lightLocal, normal);
    if (d < 0.0f) {
        d = 0.0f;
    }
    float i = light.ambient + d * light.share;
    if (i > 1.0f) {
        i = 1.0f;
    }
    return i;
}
```

## 4. Éclairage selon le type de face

`faceIsTextureOnly` remplace le test `property == 6 || property == 9` de la passe couleur, et
`faceHasTextureOverlay` désigne les faces dont la texture se dessine par-dessus la couleur (passe
texture en `GL_EQUAL`). Le type 9 n'est pas lu dans le code du jeu : il est classé ici avec un
éclairage par face, d'après sa table de méthodes, qui a la même méthode d'éclairage que les
types 4 et 7.

```cpp
enum FaceLighting {
    FACE_UNLIT,
    FACE_PER_FACE,
    FACE_PER_VERTEX
};

FaceLighting faceLightingOfType(int type) {
    if (type == 3 || type == 8) {
        return FACE_PER_VERTEX;
    }
    if (type == 4 || type == 7 || type == 9) {
        return FACE_PER_FACE;
    }
    return FACE_UNLIT; // 0, 1, 2, 5, 6 et au-delà de 9
}

// Une face qui porte une texture dessinée par-dessus sa couleur (passe texture en GL_EQUAL).
bool faceHasTextureOverlay(int type) {
    return type == 7 || type == 8;
}

// Une face dont seule la texture est dessinée (pas de passe couleur quand les textures sont actives).
bool faceIsTextureOnly(int type) {
    return type == 6;
}
```

## 5. Normales et sens des faces

À faire **une fois au chargement** (`SCRenderer::prepare`) :
- **retirer `FixEntityWinding`**. Avec l'ordre des sommets du fichier, une face vue de devant tourne
  dans le sens horaire à l'écran. Les `glFrontFace(GL_CW)` + `glCullFace(GL_BACK)` de `SCRenderer` rejettent alors
  exactement les faces que rejette le jeu (`FaceElement_CullAndProject_24EE2`), vérifié dans la
  visionneuse : 70 faces sur 135 dans les deux cas, vue 3/4 avant. L'heuristique « centre de la
  face − centre de l'objet » peut retourner à tort des faces d'une forme creuse (verrière, entrées
  d'air) ;
- **remplacer `ComputeVertexNormalsForLOD` par `objectVertexNormals`**, calculé une seule fois. Dans
  le jeu, toutes les faces du fichier comptent, pas seulement celles du niveau de détail dessiné ;
  la normale d'un sommet ne change donc pas d'un LOD à l'autre.

`faceSeenFromFront` sert aux faces doubles, qui ne sont pas rejetées et dont la normale
d'éclairage s'inverse vues de dos.

```cpp
// Normale de face du jeu (Face_ComputeNormal_2931E) : (V0 - V2) x (V0 - V1), normalisée.
// Identique à AccumulateFaceNormal de SCRenderer : (V0 - V1) x (V2 - V1).
Vector3D faceNormal(const Vector3D &v0, const Vector3D &v1, const Vector3D &v2) {
    Vector3D a;
    a.x = v0.x - v2.x;
    a.y = v0.y - v2.y;
    a.z = v0.z - v2.z;
    Vector3D b;
    b.x = v0.x - v1.x;
    b.y = v0.y - v1.y;
    b.z = v0.z - v1.z;
    Vector3D n;
    n.x = a.y * b.z - a.z * b.y;
    n.y = a.z * b.x - a.x * b.z;
    n.z = a.x * b.y - a.y * b.x;
    return normalize3(n);
}

// Normales de sommet du jeu (Face_SetupGeometry_294C0 puis Poly_LoadFromIFF_96321) : somme des
// normales de face de TOUTES les faces du fichier, pas seulement celles du LOD, puis normalisée.
// À calculer une fois au chargement, après la lecture de VTRI, sans réorienter les faces.
std::vector<Vector3D> objectVertexNormals(const RSEntity *obj) {
    std::vector<Vector3D> normals(obj->vertices.size());
    for (size_t k = 0; k < normals.size(); k++) {
        normals[k].x = 0.0f;
        normals[k].y = 0.0f;
        normals[k].z = 0.0f;
    }
    for (size_t t = 0; t < obj->triangles.size(); t++) {
        const Triangle &tri = obj->triangles[t];
        Vector3D n = faceNormal(obj->vertices[tri.ids[0]], obj->vertices[tri.ids[1]], obj->vertices[tri.ids[2]]);
        for (int j = 0; j < 3; j++) {
            normals[tri.ids[j]].x += n.x;
            normals[tri.ids[j]].y += n.y;
            normals[tri.ids[j]].z += n.z;
        }
    }
    for (size_t k = 0; k < normals.size(); k++) {
        normals[k] = normalize3(normals[k]);
    }
    return normals;
}

// Face double (octet 7 bit 0 = Triangle::flags[2]) vue de dos : la normale d'éclairage est
// inversée (Face_LightFlat_29A7D). eyeLocal = position de l'œil dans le repère de l'objet.
bool faceSeenFromFront(const Vector3D &v0, const Vector3D &v1, const Vector3D &v2, const Vector3D &n,
                       const Vector3D &eyeLocal) {
    Vector3D c;
    c.x = (v0.x + v1.x + v2.x) / 3.0f - eyeLocal.x;
    c.y = (v0.y + v1.y + v2.y) / 3.0f - eyeLocal.y;
    c.z = (v0.z + v1.z + v2.z) / 3.0f - eyeLocal.z;
    return dot3(c, n) < 0.0f;
}
```

## 6. Couleur d'un sommet dans la passe couleur

`faceVertexColour` regroupe les §2 à §5. Trois modes :
- `COLOUR_GAME` : les index du jeu, exacts ;
- `COLOUR_HYBRID` : les règles du jeu, teinte continue (mode « entre-deux » de la visionneuse) ;
- `COLOUR_ALL_LIT` : toutes les faces éclairées par sommet, teinte continue (mode « tout éclairé ») — **mode retenu**.

```cpp
enum ObjectColourMode {
    COLOUR_GAME,   // index entier du jeu
    COLOUR_HYBRID, // règles du jeu, teinte continue
    COLOUR_ALL_LIT // toutes les faces éclairées par sommet, teinte continue
};

struct ObjectShadingContext {
    std::vector<RangRamp> ramps;
    ObjectLight light;
    Vector3D lightLocal;
    Vector3D eyeLocal;
    ObjectColourMode mode;
};

// Couleur RVB (0..1) du sommet j de la face tri.
Vector3D faceVertexColour(const ObjectShadingContext &ctx, VGAPalette &palette, const RSEntity *obj,
                          const std::vector<Vector3D> &vertexNormals, const Triangle &tri, int j) {
    const Vector3D &v0 = obj->vertices[tri.ids[0]];
    const Vector3D &v1 = obj->vertices[tri.ids[1]];
    const Vector3D &v2 = obj->vertices[tri.ids[2]];
    Vector3D n = faceNormal(v0, v1, v2);
    bool twoSided = tri.flags[2] == 1;
    bool front = faceSeenFromFront(v0, v1, v2, n, ctx.eyeLocal);
    Vector3D nv = vertexNormals[tri.ids[j]];
    if (twoSided && !front) {
        n.x = -n.x;
        n.y = -n.y;
        n.z = -n.z;
        nv = n;
    }
    FaceLighting lighting = faceLightingOfType(tri.property);
    if (ctx.mode == COLOUR_ALL_LIT) {
        lighting = FACE_PER_VERTEX;
    }
    float intensity = 1.0f;
    if (lighting == FACE_PER_FACE) {
        intensity = objectIntensity(ctx.light, ctx.lightLocal, n);
    }
    if (lighting == FACE_PER_VERTEX) {
        intensity = objectIntensity(ctx.light, ctx.lightLocal, nv);
    }
    if (lighting == FACE_UNLIT) {
        const Texel *c = palette.GetRGBColor(tri.color);
        Vector3D rgb;
        rgb.x = c->r / 255.0f;
        rgb.y = c->g / 255.0f;
        rgb.z = c->b / 255.0f;
        return rgb;
    }
    if (ctx.mode == COLOUR_GAME) {
        int index = shadeIndex(ctx.ramps, tri.color, (int)(intensity * 255.0f));
        const Texel *c = palette.GetRGBColor(index);
        Vector3D rgb;
        rgb.x = c->r / 255.0f;
        rgb.y = c->g / 255.0f;
        rgb.z = c->b / 255.0f;
        return rgb;
    }
    return shadeAlongRamp(ctx.ramps, palette, tri.color, intensity);
}
```

Dans `drawModel`, avant les passes :

```cpp
ObjectShadingContext shadingCtx;
shadingCtx.ramps = this->ramps; // lu une fois depuis PALETTE.IFF
shadingCtx.light = this->objectLight; // makeObjectLight(...) depuis WRLD/LGHT
shadingCtx.lightLocal = worldDirToObject(MV, V, shadingCtx.light.dirWorld);
shadingCtx.eyeLocal = eyeInObject(MV);
shadingCtx.mode = COLOUR_ALL_LIT; // mode retenu
```

Dans `drawModelColorPass`, la boucle des 3 sommets devient :

```cpp
for (int j = 0; j < 3; j++) {
    Vector3D vLocal = object->vertices[triangle->ids[j]];
    Vector3D rgb = faceVertexColour(shadingCtx, palette, object, objectNormals, *triangle, j);
    glColor4f(rgb.x, rgb.y, rgb.z, alpha);
    glVertex3f(vLocal.x, vLocal.y, vLocal.z);
}
```

`objectNormals` est le résultat de `objectVertexNormals`, calculé au chargement. Le test
`if (triangle->property == 6 && this->show_textured)` devient `faceIsTextureOnly(triangle->property)`.
Quand les textures sont coupées, le jeu dessine les faces de type 6 avec la couleur de leur 1er
texel.

## 7. Textures

Dans la passe texture :
- **Combinaison retenue : `GL_MODULATE`** (choix du 2026-10-16), comme aujourd'hui dans
  `drawModelTexturePass`. Par sommet, `glColor4f(i, i, i, 1)` avec, en mode retenu `COLOUR_ALL_LIT`,
  **l'intensité du sommet pour les types 6, 7 et 8** (normale de face inversée pour une face double
  vue de dos) — au lieu du lambert actuel. En `COLOUR_HYBRID` : face (type 7), sommet (type 8),
  1 (type 6, non éclairé).
- Variante écartée, gardée pour mémoire : **`GL_INTERPOLATE` vers une teinte d'ombre**. On appelle
  `setupTextureInterpolate()`, puis par sommet
  `glColor4f(ombre.x, ombre.y, ombre.z, intensité)`, avec `ombre = textureShadowColour(...)` (1re
  teinte de la gamme de la couleur de fond) et l'intensité du sommet ou de la face selon le type
  (§4). À pleine lumière, on obtient le texel exact. C'est une approximation des tables `FADE` du
  jeu, qu'on n'a pas.
- **`glAlphaFunc(GL_GREATER, 0.5f)`** au lieu de 0,1 avec `GL_LINEAR` : 0,1 grossit les zones
  opaques d'un demi-texel.
- **`bleedTransparentTexels`** sur le tableau RVBA avant `glTexImage2D` : sinon `GL_LINEAR` fait
  baver la couleur 255 en liseré.
- **Mipmaps** (`GL_GENERATE_MIPMAP` puis `GL_LINEAR_MIPMAP_LINEAR`) contre le scintillement de loin.
- `glTexEnvi` est un état de l'unité de texture, pas de l'objet texture : le `GL_COMBINE` de
  `createTextureInGPU` reste actif après la création, jusqu'au prochain `glTexEnvi`.

```cpp
// GL_INTERPOLATE : RVB = texel x I + ombre x (1 - I), alpha = alpha de la texture.
// Par sommet : glColor4f(ombre.r, ombre.g, ombre.b, intensité).
void setupTextureInterpolate() {
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_COMBINE);
    glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_RGB, GL_INTERPOLATE);
    glTexEnvi(GL_TEXTURE_ENV, GL_SOURCE0_RGB, GL_TEXTURE);
    glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_RGB, GL_SRC_COLOR);
    glTexEnvi(GL_TEXTURE_ENV, GL_SOURCE1_RGB, GL_PRIMARY_COLOR);
    glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_RGB, GL_SRC_COLOR);
    glTexEnvi(GL_TEXTURE_ENV, GL_SOURCE2_RGB, GL_PRIMARY_COLOR);
    glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND2_RGB, GL_SRC_ALPHA);
    glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_ALPHA, GL_REPLACE);
    glTexEnvi(GL_TEXTURE_ENV, GL_SOURCE0_ALPHA, GL_TEXTURE);
    glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_ALPHA, GL_SRC_ALPHA);
}

// Teinte d'ombre d'une face texturée : première teinte de la gamme de sa couleur de fond.
Vector3D textureShadowColour(const std::vector<RangRamp> &ramps, VGAPalette &palette, int faceColour) {
    Vector3D rgb;
    rgb.x = 0.0f;
    rgb.y = 0.0f;
    rgb.z = 0.0f;
    int r = rampOf(ramps, faceColour);
    if (r < 0) {
        return rgb;
    }
    const Texel *c = palette.GetRGBColor(ramps[r].first);
    rgb.x = c->r / 255.0f;
    rgb.y = c->g / 255.0f;
    rgb.z = c->b / 255.0f;
    return rgb;
}

// Avant glTexImage2D : le RVB des texels transparents (alpha 0) prend la moyenne de leurs voisins
// opaques, en 3 passes, pour que GL_LINEAR ne fasse pas baver la couleur 255 sur les bords.
void bleedTransparentTexels(uint8_t *rgba, int w, int h) {
    std::vector<uint8_t> filled((size_t)(w * h));
    for (int k = 0; k < w * h; k++) {
        filled[k] = rgba[4 * k + 3] != 0 ? 1 : 0;
    }
    for (int pass = 0; pass < 3; pass++) {
        std::vector<uint8_t> src(rgba, rgba + 4 * w * h);
        std::vector<uint8_t> done = filled;
        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) {
                if (done[y * w + x]) {
                    continue;
                }
                int r = 0;
                int g = 0;
                int b = 0;
                int n = 0;
                for (int dy = -1; dy <= 1; dy++) {
                    for (int dx = -1; dx <= 1; dx++) {
                        int xx = x + dx;
                        int yy = y + dy;
                        if (xx < 0 || yy < 0 || xx >= w || yy >= h) {
                            continue;
                        }
                        if (!done[yy * w + xx]) {
                            continue;
                        }
                        const uint8_t *q = &src[4 * (yy * w + xx)];
                        r += q[0];
                        g += q[1];
                        b += q[2];
                        n++;
                    }
                }
                if (n > 0) {
                    uint8_t *p = &rgba[4 * (y * w + x)];
                    p[0] = (uint8_t)(r / n);
                    p[1] = (uint8_t)(g / n);
                    p[2] = (uint8_t)(b / n);
                    filled[y * w + x] = 1;
                }
            }
        }
    }
}
```

## 8. Brouillard

Dans le jeu, le brouillard fait glisser l'index vers la fin de la gamme : un gris (192, 192, 192)
pour les 7 gammes de `PALETTE.IFF`. Il le fait en 32 paliers, sur des distances qui dépendent de
la hauteur de la caméra au-dessus du sol (`OBJECT_RENDER.md` §3bis). En pipeline fixe, l'équivalent
le plus proche est `glFog` linéaire vers ce gris. Les distances sont dans le chunk `D_HZ` de
`PALETTE\PALFADE.IFF`, absent du dépôt : `start` et `end` restent des réglages. Le même brouillard
s'applique au terrain : même fonction de teinte dans le jeu.

```cpp
// Couleur = teinte de brouillard des gammes (première + span : gris 192 dans PALETTE.IFF).
// start / end : les vraies valeurs sont dans le chunk D_HZ de PALETTE\PALFADE.IFF (absent).
void setupObjectFog(const std::vector<RangRamp> &ramps, VGAPalette &palette, float start, float end) {
    int k = 63;
    if (ramps.size() > 1) {
        k = ramps[1].first + ramps[1].span;
    }
    const Texel *c = palette.GetRGBColor(k);
    float colour[4];
    colour[0] = c->r / 255.0f;
    colour[1] = c->g / 255.0f;
    colour[2] = c->b / 255.0f;
    colour[3] = 1.0f;
    glEnable(GL_FOG);
    glFogi(GL_FOG_MODE, GL_LINEAR);
    glFogfv(GL_FOG_COLOR, colour);
    glFogf(GL_FOG_START, start);
    glFogf(GL_FOG_END, end);
}
```

## 9. Niveau de détail par la distance

`depth` est la profondeur du centre de l'objet dans le repère de la caméra (`−` z œil).
`projScale` est l'échelle de projection en pixels. Dans libRealSpace, c'est la moitié de la hauteur
de l'écran divisée par `tan(fovy / 2)`. Le jeu prend le plus grand `LVLi` dont la distance est
inférieure ou égale à `profondeur × 179,2 ÷ échelle`. `minLevel` est l'option de détail du joueur :
c'est l'option `object_detail`, qui devient un niveau minimal au lieu d'un niveau fixe.

```cpp
// depth = profondeur du centre de l'objet (m) ; projScale = échelle de projection (pixels) ;
// lodDistances[i] = distance du chunk LVLi (0 si absent) ; minLevel = option de détail.
int selectObjectLod(const std::vector<uint32_t> &lodDistances, float depth, float projScale, int minLevel) {
    float threshold = std::floor(depth) * 179.2f / projScale;
    for (int i = 7; i >= 1; i--) {
        if (i >= (int)lodDistances.size()) {
            continue;
        }
        if (lodDistances[i] == 0) {
            continue;
        }
        if ((float)lodDistances[i] <= threshold) {
            return i;
        }
        if (minLevel >= i) {
            return i;
        }
    }
    return 0;
}
```

---

# Annexe

## Ce que le pipeline fixe ne reproduit pas, et qu'on laisse

- **Interpolation affine** des textures et des dégradés : le jeu interpole à l'écran, sans
  correction de perspective. Invisible sur de petits objets ; OpenGL fait mieux.
- **Gouraud sur l'index** de palette : le jeu interpole l'index, puis lit la couleur. En RVB, la
  différence ne se voit quasiment pas.
- **Tri des faces sans tampon de profondeur** : le tampon de profondeur de `SCRenderer` fait mieux. La visionneuse
  offre les deux (« Ordre de dessin »), et ils donnent presque la même image sur le F-16.

## Ce qui attend des données

- Tables `FADE` (assombrissement des texels et des couleurs hors gamme, brouillard des faces non
  éclairées) et `D_HZ` (distances du brouillard) : `DATA\PALETTE\PALFADE.IFF`.
- Tables de translucidité des faces de type 2 (`dword_72528`) : origine non tracée. La visionneuse
  mélange à 50 % ; le `GL_ONE, GL_ONE` additif de `SCRenderer` donne une verrière plus claire.

## Non établi

- Type 9, `FORM LINS` / `VLIN`, `FORM SPRS` / `VSPR`, textures animées `TXMA` et `AINF`.
- Sens exact du tri de la file de faces du jeu (supposé du plus loin au plus proche).
- Valeur de l'échelle de projection du jeu en vol.
