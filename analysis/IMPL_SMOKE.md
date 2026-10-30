# Fumées : proposition d'implémentation dans libRealSpace

Rédigé le 2026-10-29, revu le même jour avec Rémi. Repère de libRealSpace (Y = altitude), mètres, secondes,
nombres en décimal. Ce que fait le jeu, fonction par fonction : `SMOKE_SYSTEM.md`. Ici : un module fumée qui
**emploie les données du jeu** (modèles, formes, tables `FADE`) sans reprendre la mécanique d'origine (réserve
commune de particules, tri commun avec les faces) ; son intégration dans le jeu reste libre.

Le code de référence (`tools/smoke_ref/`) est **compilé contre les sources de libRealSpace** (dépôt
`remileonard/libRealSpace`, commit `c5fa505` du 2026-10-27) : `ByteStream`, `IFFSaxLexer`, `LZBuffer`,
`PakArchive`, `RLEShape`, `Vector3D`, `Matrix`, `Texture`, `VGAPalette`. Il est au style du projet
(`clang-format`, `tools/sc_player/tools/style_check.py`) et compile sans avertissement avec `g++ -Wall -Wextra`.

| Fichier | Rôle | Place proposée dans libRealSpace |
|---|---|---|
| `RSSmokeSet.h`, `RSSmokeSet.cpp` | les données, comme `RSEntity` : lecture de `SMOKESET.IFF`, de `PALFADE.IFF` et des chunks `SMOK`, `JINF`, `SMKG` des objets ; textures teintées par les tables `FADE` | remplace `src/realspace/RSSmokeSet.*` |
| `SCSmokeSet.h`, `SCSmokeSet.cpp` | l'acteur, porté par un objet : ses particules, émission (traînée, générateur `SMKG`), mise à jour, dessin ; point d'émission | remplace `src/strike_commander/SCSmokeSet.*` |
| `smoke_alpha.h`, `smoke_alpha.cpp` | table `FADE` approchée par couleur + alpha, texture RVBA d'une image | nouveau, `src/realspace/` |
| `smoke_test.cpp`, `smoke_render_test.cpp`, `texture_stub.cpp`, `build.sh` | essais sur les données | reste dans ce dépôt |

---

## 1. Ce qui existe dans libRealSpace (constaté au commit `c5fa505`)

- **`RSSmokeSet`** (`src/realspace/RSSmokeSet.cpp`) : lit les formes (`FORM SHAP`) dans des `RSImageSet` ;
  `parseSMOK_INFO`, `parseSMOK_TYPE_SMOK_INFO` et `parseSMOK_TYPE_SMOK_ANIM` sont vides. Les modèles de fumée
  ne sont donc pas lus.
- **`RSEntity`** : `parseREAL_OBJT_MISS_SMOK` et `parseREAL_OBJT_JETP_SMOK` sont vides ;
  `parseREAL_OBJT_JETP_JINF` lit les 6 premiers octets (classe de combat) et pas la fumée de chute (octet 11) ;
  `parseREAL_OBJT_SMKG` pose seulement `entity_type`. `RSWorld::parseWRLD_SMOK` est vide.
- **`SCSmokeSet`** (`src/strike_commander/SCSmokeSet.cpp`) : textures RVBA tirées des formes avec la palette :
  couleur 255 et gris (211, 211, 211) rendus transparents, sans table `FADE`. Les textures de la traînée des
  missiles sont générées par programme (`generateMissileSmokeTextures`), pas lues dans les données.
  `palette.GetRGBColor()` renvoie un pointeur dans la palette, et la boucle y écrit `rgba->a = 0` : la copie
  de palette de `SCSmokeSet` est modifiée au passage.
- **`SCPlane`** : chaque avion crée son propre `SCSmokeSet` (`new SCSmokeSet()` puis `init()`, `SCPlane.cpp`
  ligne 661), donc relit `SMOKESET.IFF`. Avion détruit : `smoke_positions` reçoit la position de l'avion à
  chaque mise à jour ; `RenderSmoke` choisit une forme par une table fixe (`anim_map`), et dessine par
  `SCRenderer::drawBillboard(pos, tex, 10, alpha)` : taille fixe, alpha décroissant le long de la traînée,
  filtre `GL_LINEAR`, test alpha à 0,1, panneau tourné vers la position de la caméra.
- **`SCSimulatedObject`** (missiles) : même principe, 20 positions au plus, textures générées.

Ce qui manque pour retrouver le jeu : les 9 modèles de fumée (espacement, taille, vie, teinte, formes,
animation), les tables `FADE`, la répartition des particules le long du segment parcouru, le compteur de
visibilité, le tri commun des particules et l'échelle des sprites.

## 2. Lecture des données (`RSSmokeSet`)

`RSSmokeSet` lit tout le fichier (`SMOKE_SYSTEM.md` § 2) :
- `INFO` de la racine : nombres de modèles, de formes, de particules au plus (`maxParticles`, 120) ;
- `FORM TYPE` : chaque `FORM SMOK` ajoute un `RSSmokeModel` (`INFO` de 25 octets, `ANIM` de 8, `SCRI`), chaque
  `FORM SHAP` une `RSSmokeShape`. **Numéro de modèle = rang parmi les `FORM SMOK`**, numéro de forme = rang
  parmi les `FORM SHAP` ;
- valeurs réelles : `int32` ÷ 256 (espacement, tailles, vie, dispersion), octets tels quels (teintes, A, B) ;
  dispersion limitée aux 16 bits bas (au plus 127,99 m) ;
- forme : chunk `SHAP` décompressé s'il commence par `LZ` (données CD) avec `LZBuffer::DecodeLZW` ; images
  en `RLEShape` par `PakArchive`, comme le faisait `RSSmokeSet` ; **demi-taille** = (plus grande hauteur +
  plus grande largeur) ÷ 4, calculée sur les 4 `int16` d'étendue de chaque image (largeur = droite + gauche
  + 1, hauteur = haut + bas + 1).

`loadFadeTables` lit le chunk `FADE` de `PALETTE\PALFADE.IFF` (`FORM FTBL`) : 44 tables de 256 octets. Le
chunk `TABL` de `PALETTE.IFF` nomme ce fichier (« palfade ») ; le canyon a les mêmes tables
(`CANYNFAD.IFF`).

Chunks des objets, mêmes fichiers :

```cpp
RSObjectSmoke readObjectSmoke(uint8_t *data, size_t size);              // chunk SMOK : modèle + point
uint8_t readJinfFallSmoke(uint8_t *data, size_t size);                  // JINF octet 11, 6 sans JINF
RSSmokeGeneratorInfo readSmokeGeneratorInfo(uint8_t *data, size_t size); // INFO d'un SMKG, 16 octets
```

**Point du chunk `SMOK`** : il est en repère de l'objet. Pour qu'il suive le modèle dessiné, il est converti
**comme les sommets du chunk `VERT` du même objet** dans `RSEntity::parseREAL_APPR_POLY_VERT`, qui range
`z = c0`, `x = c1`, `y = c2`. Le point du F-16 (c1 = −14 m) devient `x = −14` : 14 m derrière le centre,
puisque l'axe du nez du jeu (c1) devient x dans cette conversion.

Branchement dans `RSEntity` (à écrire dans libRealSpace ; les deux champs sont à ajouter à `RSEntity.h`) :

```cpp
// RSEntity.h
RSObjectSmoke smoke;      // chunk SMOK (MISS, JETP)
uint8_t fall_smoke{6};    // chunk JINF, octet 11 : modèle de la traînée d'un avion abattu

// RSEntity.cpp
void RSEntity::parseREAL_OBJT_MISS_SMOK(uint8_t *data, size_t size) {
    this->smoke = readObjectSmoke(data, size);
}
void RSEntity::parseREAL_OBJT_JETP_SMOK(uint8_t *data, size_t size) {
    this->smoke = readObjectSmoke(data, size);
}
// dans parseREAL_OBJT_JETP_JINF, après la lecture actuelle :
this->fall_smoke = readJinfFallSmoke(data, size);
```

Pour `SMKG`, `parseREAL_OBJT_SMKG` reçoit le `FORM SMKG` : son chunk `INFO` se lit avec
`readSmokeGeneratorInfo` (sous-lecteur `IFFSaxLexer` avec `handlers["INFO"]`, comme les autres classes).

## 3. Textures teintées (`RSSmokeSet`)

Comme `RSEntity` porte ses textures, `RSSmokeSet` porte celles des fumées. Il est **chargé une fois et partagé**
par tous les objets qui fument : qui le garde (`AssetManager`, la mission, un membre statique) est un choix de
libRealSpace.

```cpp
std::vector<FadeBlend> fade_blends;                                  // une couleur + alpha par table FADE
void buildTextures(VGAPalette *palette, uint8_t *palfade, size_t size);  // après InitFromRam
Texture *getTexture(int model, int shape, int image, int shade);
```

`buildTextures` :
1. lit les 44 tables de `PALETTE\PALFADE.IFF` et approche chacune par une couleur et un alpha (`fitFadeTables`,
   `SMOKE_SYSTEM.md` § 6.1) ;
2. pour chaque modèle à formes, ses formes A et B, chaque image et chaque teinte entière de sa vie, construit
   un `Texture` RVBA (`buildSmokeTexture`) : couleur hors de A … A + B − 1 opaque (le feu de la forme 3),
   couleur dans la plage = couleur et alpha de la table teinte + c − A, pas de pixel = transparent.
   **1 195 textures** avec `SMOKESET.IFF` ;
3. chaque texture est **carrée et centrée sur le point d'accroche de l'image** (le point de la particule),
   lignes rangées de bas en haut, pour `SCRenderer::drawBillboard` tel qu'il est : son carré a
   `glTexCoord2f(0, 0)` en bas à gauche, donc la 1re ligne de `data` en bas.

La palette est celle que l'actuel `SCSmokeSet::init` charge (`PALETTE.IFF`, `VGAPalette`). La traînée des
missiles (modèle 0, teintes 6 à 0 : tables qui éclaircissent) sort alors des données, comme les autres.

## 4. L'acteur porté par l'objet (`SCSmokeSet`)

Chaque objet porte un `SCSmokeSet` et ses particules, **sans limite de nombre** (pas de réserve commune). Tous
pointent vers le même `RSSmokeSet`.

```cpp
void init(RSSmokeSet *smokeSet, int smokeModel, uint32_t seed);
void setModel(int smokeModel);                                    // ex. fumée de chute du JINF
void spawn(Vector3D position, Vector3D velocity);                 // une particule
void spawnAlongSegment(Vector3D p, Vector3D q, float dt);         // traînée de P vers Q
void emitTrail(Vector3D emissionPoint, Vector3D objectVelocity, float dt);  // Q = P − vitesse × dt
void startGenerator(const RSSmokeGeneratorInfo &info, bool startsActive);   // objet SMKG
bool emitGenerator(Vector3D position, float dt);                  // false : l'objet doit être supprimé
void update(float dt);
void render(Vector3D camera) const;
void sprites(Vector3D camera, std::vector<SCSmokeSprite> &out) const;  // la liste que render dessine
```

Émission (même logique que le jeu, `SMOKE_SYSTEM.md` § 3) :
- **traînée** répartie le long du segment parcouru pendant l'image : N = longueur ÷ espacement (au moins 1),
  particule k vieillie de dt + k × dt ÷ N, taille et teinte avancées d'autant, image = partie entière de
  k × images/s × dt ÷ N, dispersion cumulée à partir de la 3e particule. La traînée reste continue à toute
  vitesse ;
- **générateur `SMKG`** : une particule toutes les « intervalle » secondes, vitesse (0, montée, 0), pendant
  « durée » secondes ; `startGenerator` prend le modèle de son `INFO` ;
- **choix de la forme** : A avec la chance du modèle, sinon B.

Mise à jour : taille et teinte linéaires du début à la fin de la vie ; image d'animation d'un pas au plus par
mise à jour, modes `R`, `S`, `T` (particule supprimée après la dernière image), `W` ; position += vitesse × dt.

Dessin : `render` trie les particules qui ont une texture de la plus loin à la plus proche de la caméra et
appelle pour chacune `drawSmokeBillboard(position, texture, côté)`, avec côté = côté de la texture × taille ÷
demi-taille de la forme (un pixel d'image = taille ÷ demi-taille mètres, échelle des sprites du jeu). Dans
libRealSpace, cette fonction est l'appel de `SCRenderer` :

```cpp
void drawSmokeBillboard(Vector3D position, Texture *texture, float size) {
    Renderer.drawBillboard(position, texture, size);
}
```

Elle est à part pour que les essais compilent sans `SCRenderer` ; l'appel peut aussi être écrit directement dans
`SCSmokeSet::render`.

`smokeEmissionPoint(position, orientation, point)` (dans `SCSmokeSet.h`) place le point du chunk `SMOK` avec la
même matrice que `SCRenderer::drawModel`.

Modèles nommés par les données (`SMOKE_SYSTEM.md` § 2.6) : chunk `SMOK` des missiles 0 (`M261` : 8), des
avions 3 ; `JINF` des avions 6 (chute) ; `SMKG` 4 (navires, pétrolier, `SMOKEGEN`), 7 (véhicules), 0 (`DABRMS-G`).

## 5. Ce que `drawBillboard` change au rendu

Constaté dans `SCRenderer::drawBillboard` (commit `c5fa505`) ; à garder ou à régler selon le rendu voulu :
- `glAlphaFunc(GL_GREATER, 0.1f)` : les pixels d'alpha ≤ 0,1 sont jetés. Tables concernées : 0 à 2 et 16 à 17
  (alpha 0,022 à 0,089), c'est-à-dire la fin de vie des traînées de missile et la densité la plus faible des
  autres. Le jeu les dessine (effet très léger) ;
- `GL_LINEAR` : les pixels transparents de la texture ont une couleur noire (0, 0, 0, 0) ; au bord des taches
  le filtre mélange vers le noir. Le jeu agrandit au plus proche voisin ;
- le test de profondeur est actif et `glDepthMask` n'est pas coupé : chaque carré écrit la profondeur. Le tri
  de `render` règle l'ordre à l'intérieur d'un objet ; entre deux objets, ou avec des faces
  transparentes dessinées après, l'ordre de dessin compte ;
- le carré est tourné vers la position de la caméra (pas vers son plan) ; le jeu dessine ses sprites à plat
  sur l'écran.

## 6. Écarts avec le jeu

- **Teinte** : mélange alpha au lieu de la table `FADE` appliquée au fond (précalcul plutôt que calcul par
  image). Tables qui assombrissent (16 à 31) bien approchées ; celles qui éclaircissent (5 à 12) le moins
  (`SMOKE_SYSTEM.md` § 6.1).
- **Pas de réserve commune ni de compteur de visibilité** : chaque objet garde ses particules jusqu'à la fin de
  leur vie (le jeu en a 120 au plus pour tout le monde, et supprime celles qui ne sont pas dessinées pendant 2
  images).
- **Pas de tri commun avec les faces** : `drawBillboard` et le tampon de profondeur.
- **Tirages** : `std::mt19937` ; mêmes lois (uniforme sur ± dispersion, chance sur 100).
- **Mode 0 (disque)** : pas de texture, rien n'est dessiné ; aucun modèle des données ne l'emploie.

## 7. Essais

```bash
tools/smoke_ref/build.sh <libRealSpace> /tmp/smoke_ref_build
/tmp/smoke_ref_build/smoke_test DATA/OBJECTS/SMOKESET.IFF DATA/PALETTE/PALETTE.IFF DATA/PALETTE/PALFADE.IFF \
    data/F-16DES.IFF DATA/OBJECTS/SMOKEGEN.IFF
/tmp/smoke_ref_build/smoke_render_test DATA/OBJECTS/SMOKESET.IFF DATA/PALETTE/PALETTE.IFF DATA/PALETTE/PALFADE.IFF 6 chute.ppm
```

`smoke_render_test` demande OSMesa (paquet `libosmesa6-dev`). Résultats avec les données CD (formes `LZ`) et
disquette (formes non compressées), identiques :
- 9 modèles, 5 formes, 120 particules ; les 9 modèles égaux au tableau de `SMOKE_SYSTEM.md` § 2.6 ;
- formes : 3, 12, 10, 11 et 11 images, demi-tailles 24, 39, 39, 27 et 46 ; nombre de pixels décodés par
  `RLEShape` égal à celui du décodeur Python (`tools/sc_data.py`) : 5 004, 12 319, 14 787, 11 522, 30 669 ;
- tables : 44, alpha et cible égaux à `smoke_fade_fit.py` (table 0 : 0,022 et (255, 255, 249) ; table 31 :
  0,832 et (22, 20, 13)) ;
- 1 195 textures (une série par modèle) ;
- F-16 à 150 m/s, 15 images/s : traînée (modèle 3) stable à 22 particules, chute (modèle 6) à 11, missile
  (modèle 0) à 16 ; vue de côté à 70 m, côté des carrés de 3 m (particule neuve) à 12,8 m (modèle 3) ;
- chunk `SMOK` du F-16 : modèle 3, point x = −14 ; `JINF` : modèle 6 ;
- `SMOKEGEN.IFF` : modèle 4, 60 s, 14 m/s, 0,297 s, suppression à la fin ; après 10 s, 13 particules, la plus
  haute à 56 m.

`smoke_render_test` dessine avec une copie de `SCRenderer::drawBillboard` (mêmes états : test alpha à 0,1,
`GL_LINEAR`, profondeur) : `analysis/smoke_images/billboard_trails.png`, avion à 100 m/s vu de côté, fond ciel,
de haut en bas modèle 6 (chute), 3 (traînée), 0 (missile).
