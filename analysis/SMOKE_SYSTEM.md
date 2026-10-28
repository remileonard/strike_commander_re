# Fumées (STRIKE.EXE) : chargement et rendu

> Lu le 2026-10-28 dans `analysis/annotated_segments/` : seg450 (chargeur), seg455 (monde), seg106
> (particules), seg056 et seg118 (liste de primitives), seg044 (ellipse). Nombres en décimal ; repère
> de libRealSpace (Y = altitude) ; distances en mètres, durées en secondes. Le format des chunks est
> aussi dans `DATA_MODEL.md` (« Jeu de fumées ») ; ce document décrit ce que le programme en fait.
> Données vérifiées sur `SMOKESET.IFF`, `SMOKEGEN.IFF`, `PALETTE.IFF`, `PALFADE.IFF` et les objets des
> versions disquette et CD. Version illustrée : `SMOKE_SYSTEM.html`.

## 1. Vue d'ensemble

```
WRLD / chunk SMOK  « SMOKESET »
  └─ World_LoadSmokeSet_A7CA1 ── SmokeSet_LoadFromIFF_A636C ── OBJECTS\SMOKESET.IFF
        jeu de fumées (un par monde) : modèles de fumée, formes, réserve de particules

émetteurs, chaque image
  objet SMKG (générateur posé)  SmokeGen_Tick_4C057        → Particle_SpawnWithColor
  objet avec chunk SMOK (traînée) SmokeTrail_Tick_3D57E     → Particles_SpawnAlongSegment_4D1C9

jeu de fumées, chaque image
  SmokeSet_UpdateParticles_4CD9F       vie, taille, teinte, image d'animation
  SmokeSet_IntegrateParticles_4CE5A    position += vitesse × dt
  SmokeSet_CollectVisibleParticles_4CDEC  projection, ajout à la liste de primitives

liste de primitives (faces des objets, terrain, particules)
  RenderList_SortByDepth_2AE7C   tri du plus loin au plus proche
  RenderList_DrawAll_2AD65       méthode 0 de chaque élément → Particle_Draw_4C7ED pour une particule
```

Sans jeu de fumées chargé (`word_70483` = 0), ni les générateurs ni les traînées n'émettent.

## 2. Chargement

### 2.1 Quand et quel fichier

- Le chunk **`SMOK`** du `FORM WRLD` d'un monde contient un nom (`"SMOKESET"`).
  `World_LoadSmokeSet_A7CA1` le lit (`push large 4B4F4D53h`), crée l'objet jeu de fumées
  (51 octets) et appelle `SmokeSet_LoadFromIFF_A636C`. Le jeu est rangé dans `word_70483`, et ajouté
  à la liste des objets du monde qui reçoivent la méthode +4 à chaque image (§ 5.2).
- Fichier : `OBJECTS\<nom>.IFF` (`Path_ResolveDataFile` avec « OBJECTS » et « .IFF »).
- Racine **`FORM SMOK`** obligatoire, sinon erreur `B007h` (45063).

### 2.2 Ordre de lecture

1. Chunk **`INFO`** : trois `uint16` petit-boutistes (`ResourceRecord_ReadFieldGroupB_64A54`, 2 octets
   chacun) :
   - nombre de modèles de fumée → tableau de modèles de 42 octets ;
   - nombre de formes → tableau de formes de 12 octets ;
   - nombre maximal de particules → réserve de particules de 48 octets chacune, et tableau de pointeurs
     des particules actives.

   Un tableau vide (nombre 0) → erreur `B006h` (45062). Chaque particule de la réserve est remise à
   l'état d'un modèle de particule (`word_72A30`, 48 octets).
2. **`FORM TYPE`** : ses sous-FORM dans l'ordre du fichier :
   - `FORM SMOK` → `SmokeSet_LoadSmokeModel_A61D0` remplit le modèle suivant ;
   - `FORM SHAP` → `SmokeSet_LoadShape_A60AC` remplit la forme suivante.

   **Numéro d'un modèle = son rang parmi les `FORM SMOK`** ; numéro d'une forme = son rang parmi les
   `FORM SHAP`. Les deux suites peuvent être mêlées. Aucun contrôle vu entre le nombre de sous-FORM et
   les nombres de l'`INFO`.

### 2.3 Modèle de fumée (`FORM SMOK` dans `FORM TYPE`)

Chunk **`INFO`**, 25 octets lus d'un bloc (`push large 19h`). Conversion pour libRealSpace : un `int32`
est en 24.8, **÷ 256** ; un octet est un entier tel quel.

| Octet | Type | Rôle | Valeur pour libRealSpace |
|---|---|---|---|
| 0 | uint8 | mode de rendu : 0 disque, 1 sprite opaque, 2 sprite translucide (§ 5.3) | entier |
| 1 | int32 | espacement entre deux particules d'une traînée | m (÷ 256) |
| 5 | int32 | taille au début | m (÷ 256), demi-taille (rayon) |
| 9 | int32 | taille à la fin | m (÷ 256) |
| 13 | int32 | durée de vie | s (÷ 256) |
| 17 | int32 | dispersion de position à la création | m (÷ 256) ; seuls les 16 bits bas servent, donc au plus 127,99 m |
| 21 | uint8 | teinte au début | entier : numéro de table de remappage (§ 5.4) |
| 22 | uint8 | teinte à la fin | entier |
| 23 | uint8 | A : première couleur translucide d'une forme (mode 2) | entier |
| 24 | uint8 | B : nombre de couleurs translucides (mode 2) | entier |

Le chargeur calcule deux pentes par seconde : (taille fin − taille début) ÷ durée, et (teinte fin −
teinte début) ÷ durée. Taille et teinte évoluent donc **linéairement** du début à la fin de la vie.

Chunk **`ANIM`** (facultatif), 8 octets :

| Octet | Type | Rôle |
|---|---|---|
| 0 | uint8 | forme A (numéro de forme) |
| 1 | uint8 | chance de prendre A, en % (100 = toujours A) |
| 2 | uint8 | forme B |
| 3 | uint8 | mode d'animation : `R`, `S`, `T` ou `W` (§ 4.2) |
| 4 | int16 | images par seconde |
| 6 | int16 | pas : 1, −1, ou 0 = pas d'animation |

Sans `ANIM` : formes A et B = 255 (aucune forme), pas d'animation.

Chunk **`SCRI`** (facultatif) : n octets (n = taille du chunk) = ordre des images de la forme. Sans
`SCRI`, les images de la forme dans l'ordre.

> ⚠️ **Lecture de `SCRI` dans le jeu.** Le chargeur alloue un tampon de n octets (`CRT_Malloc16_Retry`,
> rangé en +37 du modèle) puis lit les octets avec pour destination **l'adresse du champ +37**
> (`mov ax, si` / `add ax, 25h` / `push ax` avant `ResourceRecord_ReadFieldGroupA_64A19`), pas le
> tampon. Les octets de `SCRI` remplacent donc le pointeur et les champs qui suivent (forme A, chance,
> forme B), et débordent sur le modèle suivant au-delà de 5 octets. Le dessin lit ensuite +37 comme
> pointeur vers la table d'images. **Sans effet sur les données** : `SMOKESET.IFF` n'a aucun chunk
> `SCRI` (§ 2.6). Pour libRealSpace, lire `SCRI` comme une table d'images ordinaire s'il en existe un.

### 2.4 Forme (`FORM SHAP` dans `FORM TYPE`)

Chunk **`SHAP`** obligatoire (sinon erreur `B005h`, 45061). Le STRIKE.EXE lu ici (version disquette) le
copie tel quel : c'est une forme RealSpace
(même format que les images de `CONVSHPS.PAK` : un `uint32`, puis la table des décalages d'images à
partir de l'octet 4, chaque image commençant par 4 `int16` d'étendue). Nombre d'images = 1er décalage
÷ 4 − 1 (`Shape_GetImageCount_625CC`).

Le chargeur calcule une **demi-taille** de la forme : (plus grande hauteur + plus grande largeur des
images) ÷ 4 (`Text_ComputeMaxLineHeight_5E706`, `Text_ComputeMaxLineWidth_5E6BF`, `sar ax, 2`). Elle
sert à l'échelle du sprite (§ 5.3).

**Formes compressées (données de la version CD).** Dans le `SMOKESET.IFF` de `BIGTRE.TRE` (CD-ROM), les 5
chunks `SHAP` sont compressés : `LZ` (2 octets), `uint32` petit-boutiste = taille décompressée, puis
des données LZW (le même LZW que les entrées des PAK ; `tools/terrain_map.py`, fonction `lzw`, les
décompresse à la taille annoncée). Le STRIKE.EXE disquette ne connaît pas ce cas (information de Rémi) :
le décodage est celui de la version CD, non lue ici. Pour libRealSpace : si le chunk commence par `LZ`,
décompresser, sinon prendre le chunk tel quel.

### 2.5 Structures pour libRealSpace (en flottants)

```cpp
struct SmokeModel {
    uint8_t renderMode;      // 0 disque, 1 sprite opaque, 2 sprite translucide
    float spacing;           // m
    float sizeStart;         // m (rayon)
    float sizeRate;          // m/s = (sizeEnd - sizeStart) / life
    float life;              // s
    float jitter;            // m
    float shadeStart;        // numéro de table
    float shadeRate;         // tables/s = (shadeEnd - shadeStart) / life
    uint8_t translucentFirst; // A
    uint8_t translucentCount; // B
    uint8_t shapeA;          // 255 = aucune
    uint8_t chanceA;         // %
    uint8_t shapeB;
    char animMode;           // 'R', 'S', 'T', 'W'
    int16_t framesPerSecond;
    int16_t frameStep;       // 1, -1, 0
    std::vector<uint8_t> frameOrder; // SCRI, vide si absent
};

struct SmokeShape {
    std::vector<uint8_t> shape; // forme RealSpace
    int halfSize;               // pixels : (hauteur max + largeur max) / 4
};
```

### 2.6 Le jeu de fumées des données (`OBJECTS\SMOKESET.IFF`)

Fichier disquette (118 904 octets, formes non compressées) et fichier CD (64 437 octets, formes `LZ`) :
même contenu une fois les formes décompressées. `INFO` : 9 modèles, 5 formes, 120 particules au plus. Aucun `SCRI`. Les 9 modèles sont en mode 2
(sprite translucide), avec A = 0 : les couleurs translucides d'une forme sont 0 à B − 1.

| Modèle | Espacement (m) | Taille début (m) | Taille fin (m) | Vie (s) | Dispersion (m) | Teinte début | Teinte fin | B | Forme A | Chance A (%) | Forme B | Animation | Images/s |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0 | 5 | 4 | 5 | 0,656 | 0,297 | 6 | 0 | 3 | 1 | 60 | 2 | `T` | 20 |
| 1 | 8 | 4 | 4 | 0,656 | 0,297 | 22 | 16 | 3 | 4 | 100 | 0 | `T` | 20 |
| 2 | 4 | 2 | 2 | 0,297 | 0,098 | 21 | 16 | 3 | 1 | 60 | 2 | `T` | 20 |
| 3 | 4 | 4 | 6 | 1 | 1,398 | 24 | 16 | 5 | 1 | 60 | 2 | `T` | 15 |
| 4 | 10 | 4 | 12 | 4,199 | 0,699 | 29 | 18 | 3 | 0 | 100 | 0 | `W` | 5 |
| 5 | 10 | 3 | 5 | 2,5 | 1,5 | 32 | 40 | 3 | 0 | 100 | 0 | `W` | 5 |
| 6 | 8 | 6 | 8 | 1,598 | 1,398 | 22 | 16 | 5 | 4 | 75 | 3 | `T` | 15 |
| 7 | 4 | 4 | 8 | 4,199 | 0,699 | 29 | 18 | 3 | 1 | 60 | 2 | `T` | 20 |
| 8 | 2 | 1 | 2 | 0,297 | 0,199 | 5 | 0 | 3 | 1 | 60 | 2 | `T` | 20 |

Pas d'animation = 1 pour tous.

Qui emploie quel modèle (chunks `SMOK`, `SMKG` et `JINF` des objets des données) :

| Modèle | Employé par |
|---|---|
| 0 | traînée des missiles (`AGM-65D`, `AMRAAM`, `SWINDERJ`, `SWINDERM`) ; générateur de l'épave `DABRMS-G` |
| 1 | aucun objet des données |
| 2 | aucun objet des données |
| 3 | traînée des 20 avions (chasseurs, `A-10`, `C130`, `747`, `AWACS`, `LEARJET`, `TU-20`) |
| 4 | générateurs des épaves de navires et de pétrolier (`DBOAT`, `DCARRIER`, `DDESTROY`, `DOILTANK`) et `SMOKEGEN` |
| 5 | aucun objet des données |
| 6 | traînée de chute des 20 avions (`JINF`) |
| 7 | générateurs des épaves de véhicules (`DBMP-2`, `DJEEP`, `DT-72`, `DTRUCK2`, `DZSU-23`, `DMOBSAM`, `DSPGUN`, `D40MMAA`) |
| 8 | traînée de `M261` |

Les objets `D…` sont les épaves posées à la destruction (chunk `DEST`). Un modèle qu'aucun objet ne nomme
peut être demandé directement par le code (appelant de seg104 non lu, § 8).

Formes (taille décompressée, nombre d'images) :

| Forme | Octets | Images |
|---|---|---|
| 0 | 2 919 | 3 |
| 1 | 30 765 | 12 |
| 2 | 24 632 | 10 |
| 3 | 17 079 | 11 |
| 4 | 42 809 | 11 |

### 2.7 Le générateur de l'objet `SMOKEGEN.IFF`

Objet de classe `SMKG` (même contenu dans les données disquette et CD, la texture compressée en `LZ` dans
la version CD) :
- `INFO` : modèle de fumée 4, durée d'émission 60 s, montée 14 m/s, une particule toutes les 0,297 s,
  chance 100, l'objet se supprime à la fin ;
- `DAMG` 200 ; apparence 3D : 24 sommets, 20 faces de type 6 (texture non éclairée), un cercle d'environ
  20 m de large et 12 m de haut ;
- texture animée `TXMA` : en-tête de 14 octets (8 octets nuls, `uint16` largeur 67, `uint16` hauteur 25,
  `uint16` 10 images), puis 10 images de 67 × 25 octets (16 750 octets, la taille du chunk moins
  l'en-tête) : un rideau de flammes. Le lecteur de `TXMA` n'a pas été lu ; ce découpage vient des
  tailles des données.

C'est donc un feu au sol (flammes animées) surmonté d'une colonne de fumée noire.

## 3. Émission

### 3.1 Générateur posé (`SMKG`)

Objet de classe `SMKG` (`SmokeGen_LoadFromIFF_A5F89`, chunk `INFO` dans `DATA_MODEL.md`).
`SmokeGen_Tick_4C057`, à chaque image, tant qu'il est actif :
- durée d'émission décomptée ; à la fin, l'objet est supprimé ou seulement arrêté (dernier octet de
  son `INFO`) ;
- compte à rebours −= dt ; à 0, il repart de l'intervalle et une particule est créée par
  `Particle_SpawnWithColor(jeu, type de fumée, position de l'objet, vitesse)`, avec **vitesse =
  (0, montée, 0)** dans le repère de libRealSpace : seule l'altitude reçoit la vitesse de montée de
  l'`INFO`.

`Particle_SpawnWithColor` :
- prend une particule libre de la réserve (`ParticlePool_AllocElement_4CFA0` ; rien si la réserve est
  pleine) et la remet à l'état du modèle (`Particle_InitFromSmokeModel_4C168`) : taille = taille au
  début, vie = durée de vie, teinte = teinte au début, vitesse nulle, image 0 ;
- position = position donnée + un aléa dans [−dispersion, +dispersion] sur chaque axe
  (`Math_RandomJitter_54E1C` × 3) ;
- vitesse = le vecteur donné (gardée en `int16` de 1/256 m/s : au plus 127,99 m/s par axe) ;
- forme : aucune si A = 255 ; A si la chance vaut 100 ; sinon A avec la chance donnée
  (`Math_RandomChance_54E4F`), B autrement ;
- la particule rejoint la liste des particules actives.

### 3.2 Traînée d'un objet (chunk `SMOK` de l'objet)

`SmokeTrail_Tick_3D57E` (voir `DATA_MODEL.md`) calcule chaque image le point d'émission courant P et sa
position à l'image précédente Q, puis appelle `Particles_SpawnAlongSegment_4D1C9(jeu, type, P, Q, dt)` :

- N = longueur(Q − P) ÷ espacement du modèle, partie entière ; au moins 1 si la longueur n'est pas
  nulle. Rien si N = 0.
- Particule k (k = 0 … N − 1), partant de P vers Q :
  - position : P pour k = 0 ; ensuite la position de la particule précédente + (Q − P) ÷ N, plus un
    aléa de dispersion sur chaque axe à partir de la 3e particule (pas d'aléa entre la 1re et la 2e) —
    les aléas s'additionnent d'une particule à l'autre ;
  - vie = durée de vie − dt − k × dt ÷ N ; si elle est ≤ 0, l'émission s'arrête là ;
  - taille = taille au début + k × pente de taille × dt ÷ N ;
  - teinte = teinte au début + k × pente de teinte × dt ÷ N ;
  - image d'animation = partie entière de k × images/s × dt ÷ N ;
  - forme choisie comme au § 3.1 ; vitesse nulle.

La traînée est donc continue quelle que soit la vitesse de l'objet, et les particules sont
« vieillies » le long du segment parcouru pendant l'image.

### 3.3 Quel modèle pour quelle traînée

Le type de fumée de la traînée est rangé dans l'instance de l'objet ; il dépend de ce qui l'allume :

| Cas | Fonction | Type de fumée |
|---|---|---|
| création de l'objet | `Camera_InitAttachedWithTarget_3DC3D` | celui du chunk `SMOK` de l'objet (la traînée reste éteinte) |
| choc (contact) | `Aircraft_OnCollision_9D910` | inchangé : celui du chunk `SMOK` |
| missile lancé | `SmokeTrail_EnableIfModelHasSmok_3D566` après `Missile_InitFlightTimer_A0455` | celui du chunk `SMOK` |
| avion IA abattu qui tombe | `Aircraft_OnDestroyed_9D770` | **8e champ du chunk `JINF`** (octet 11 ; 6 sans `JINF`), recopié avant d'allumer la traînée |

Avion IA abattu (`Aircraft_OnDestroyed_9D770`) : explosion immédiate avec la chance du 5e champ du `JINF`
(F-16 : 3 %), sinon chute avec la traînée du `JINF`.

Dans les données : chasseurs (F-16, F-15, F-18, MiG-29, Mirage…) chunk `SMOK` = modèle 3, point 14 m
derrière le centre ; missiles = modèle 0 ; le `JINF` de tous les avions regardés donne 6. Le modèle 3 mêle
les formes 1 et 2 (fumée grise) ; le **modèle 6** mêle la forme 4 (fumée noire, 75 %) et la forme 3
(boule de feu qui devient fumée) : c'est la traînée d'un avion abattu.

## 4. Vie d'une particule

### 4.0 Une particule en mémoire (48 octets)

| Octets | Contenu |
|---|---|
| 0 | table de méthodes (méthode 0 = `Particle_Draw_4C7ED`) |
| 2 | profondeur dans le repère de la caméra (clé de tri, § 5.1) |
| 6 | modèle de fumée |
| 8 | forme |
| 10, 14, 18 | position, 3 `int32` 24.8 (repère du jeu ; libRealSpace `x = c0`, `y = c2`, `z = −c1`) |
| 22, 24 | x, y à l'écran |
| 26, 28, 30 | vitesse, 3 `int16` en 1/256 m/s |
| 32 | taille (24.8) |
| 36 | vie restante (24.8, s) |
| 40 | teinte (24.8 ; partie entière = numéro de table) |
| 44 | drapeaux : bit 0 en service, bit 1 dessinée depuis la dernière mise à jour |
| 45 | compteur de visibilité (2 au départ) |
| 46 | image d'animation |
| 47 | accumulateur d'animation (1/256 d'image) |

### 4.1 Mise à jour (`Particle_UpdateLifeSizeShadeFrame_4C413`)

Pour chaque particule active, à chaque image :
1. vie −= dt ; ≤ 0 → particule supprimée.
2. **Compteur de visibilité** : si la particule a été dessinée depuis la dernière mise à jour
   (`Particle_Draw_4C7ED` pose un drapeau), compteur = 2 ; sinon compteur − 1, et à 0 la particule est
   supprimée. **Une particule qui n'est pas dessinée pendant 2 mises à jour disparaît** (hors champ,
   trop petite, trop loin, derrière la caméra).
3. Animation (modes de rendu 1 et 2, pas ≠ 0) : un accumulateur reçoit images/s × dt ; quand il dépasse
   1 image, l'image avance d'**un** pas (une seule fois par mise à jour), selon le mode (§ 4.2).
4. taille += pente de taille × dt ; teinte += pente de teinte × dt.

### 4.2 Modes d'animation

« Dernière » = nombre d'images de `SCRI` − 1, sinon nombre d'images de la forme − 1.

| Mode | Effet quand l'image suivante sort de 0 … dernière |
|---|---|
| `R` | aller-retour : à la dernière, le pas devient −1 ; à 0, il redevient 1. ⚠️ Le pas est changé **dans le modèle** : toutes les particules du modèle changent de sens ensemble |
| `S` | le pas du modèle passe à 0 : l'animation s'arrête (pour toutes les particules du modèle) |
| `T` | la particule est supprimée |
| `W` | boucle : après la dernière, 0 ; avant 0, la dernière |

`U` et `V` existent dans la table du code mais ne font rien.

### 4.3 Mouvement (`SmokeSet_IntegrateParticles_4CE5A`, `Particle_IntegrateVelocity`)

Position += vitesse × dt, si la vitesse n'est pas nulle. Aucune autre force vue dans ces fonctions
(pas de gravité ni de vent).

## 5. Rendu

### 5.1 Projection (`Particle_ProjectToScreen_4C1EE`, ex-`ParticleEmitter_ProximityTest`)

Chaque image, pour chaque particule active (`SmokeSet_CollectVisibleParticles_4CDEC`) :
1. position − position de la caméra, puis passage dans le repère de la caméra
   (`Matrix_WorldToLocal_58768`) : latéral, profondeur, haut.
2. Visible si :
   - profondeur > plan proche (`dword_721F6`) ;
   - profondeur ≤ distance maximale (`dword_72540`, en mètres entiers) ;
   - rayon projeté = taille × focale (`dword_72202`) ÷ profondeur > 0,6 pixel (153/256).
3. Écran : x = centre x (`word_721FE`) + latéral × focale ÷ profondeur ; y = centre y (`word_72200`) −
   haut × focale verticale (`dword_72206`) ÷ profondeur ; bornés à ±32000.
4. La profondeur est rangée dans la particule : c'est sa **clé de tri**.
5. Si visible, la particule est ajoutée à la **liste de primitives** (`dword_724AE`), tant qu'il reste
   de la place (`word_724AA`).

### 5.2 Tri et ordre de dessin

La liste de primitives est **commune** aux faces des objets 3D, au terrain et aux particules. Chaque
image (`TrackedObject_FrameStep_2DF0D`) :
1. la liste est vidée, puis remplie par les objets du monde (dont le jeu de fumées, par sa méthode +4) ;
2. `RenderList_SortByDepth_2AE7C` → `RenderList_RadixSortDescending_588E8` : tri par base sur la clé à
   +2 de chaque élément (la profondeur), 8 passes de 4 bits, 16 paniers de 1024 places, rassemblés du
   panier 15 au panier 0 : **du plus loin au plus proche**, ordre stable ;
3. `RenderList_DrawAll_2AD65` appelle la méthode 0 de chaque élément dans cet ordre : algorithme du
   peintre. Une particule se dessine par-dessus tout ce qui est plus loin qu'elle, et sous ce qui est plus
   proche, y compris les faces d'un avion.

Ce tri tranche aussi le point ouvert d'`OBJECT_RENDER.md` sur le sens du tri des faces.

### 5.3 Dessin (`Particle_Draw_4C7ED`)

Rayon projeté r = taille × focale ÷ profondeur (pixels). La particule est rejetée si le carré
(x ± r, y ± r) est entièrement hors de la fenêtre ; sinon elle est marquée « dessinée » (§ 4.1).

| Mode | Dessin |
|---|---|
| 0 disque | ellipse pleine (`Render_FillEllipseRemapped_258A8`) de centre (x, y), rayon horizontal r (partie entière), rayon vertical r × 0,832 (213/256 : correction du rapport des pixels 320 × 200) ; chaque pixel couvert devient `table[pixel de l'écran]`, table = table de la teinte (§ 5.4). Teinte < 0 : aucune table |
| 1 sprite opaque | échelle = taille × focale ÷ (profondeur × demi-taille de la forme), bornée de 0,016 à 32 ; image = `SCRI[image]` s'il existe, sinon l'image courante ; `Render_DrawRotatedScaledSprite_62800` : l'image dessinée telle quelle, à l'échelle, posée en (x, y) avec ses propres décalages. La teinte ne sert pas |
| 2 sprite translucide | même échelle et même image ; `Render_DrawScaledSprite_621A2` : un pixel de couleur c hors de A … A + B − 1 est dessiné tel quel ; un pixel de couleur c dans A … A + B − 1 devient `tables[teinte + (c − A)][pixel de l'écran]` |
| autre | rien |

Le rejet des modes 1 et 2 utilise r = échelle × demi-taille. La taille du modèle est donc un **rayon**
en mètres : pour un disque, le rayon du disque ; pour une forme, la demi-taille de son image.

### 5.4 Tables de remappage (`dword_72528`)

Suite de tables de 256 octets : la table n commence à n × 256. La table n donne, pour chaque couleur
déjà à l'écran, la couleur qui la remplace : c'est le même jeu de tables que les faces translucides des
objets (type de face 2, `OBJECT_RENDER.md`). La teinte d'une particule choisit la table (partie entière
de la teinte).

**Origine : le chunk `FADE` de `PALETTE\PALFADE.IFF`** (tracé le 2026-10-28). Le chunk `TABL` de
`PALETTE.IFF` nomme le fichier (« palfade ») ; `Palette_LoadFadeFile_98670` l'ouvre (`FORM FTBL`) et
`Palette_LoadFadeTables_989B8` range `FADE` dans l'objet palette, en +94 (bloc) et +98 (type) ; pour
l'objet palette global (`word_724CA`), ces champs sont `dword_72528` et `byte_7252C`, ceux que lit
`Particle_Draw_4C7ED`. Nombre de tables = taille ÷ 256.

Dans les données : 11 264 octets, **44 tables**. Effet de chaque table sur la palette :
- 0 à 15 : éclaircissent le fond, de presque rien (0) au gris clair (15) ;
- 16 à 31 : l'assombrissent, de presque rien (16) au presque noir (31) ;
- 32 à 41 : le teintent vers un gris-brun, de plus en plus fort ;
- 42 et 43 : teintes vers le jaune et vers le vert.

Les dix entrées du `FORM BILD` de `PALETTE.IFF` (couleur (50, 44, 33) de 0 à 63, de 9 % à 90 %) et la onzième
((63, 63, 0), 50 %) correspondent aux tables 32 à 42 ; aucune lecture de `BILD` n'a été vue dans STRIKE.EXE.
Les modèles de fumée vont de la teinte 0 à 40, plus le niveau 0 à 4 de la forme : de quoi rester dans les
44 tables. Les formes 0, 1, 2 et 4 n'ont que les couleurs 0, 1 et 2 (trois niveaux de densité : table
teinte, teinte + 1, teinte + 2) ; la forme 3 a en plus des couleurs opaques 235 à 239 (le feu).

## 6. Pour libRealSpace

- **Chargement** : un jeu par monde, d'après le nom du chunk `WRLD/SMOK` ; modèles et formes numérotés
  par leur rang dans `FORM TYPE` ; valeurs converties comme au § 2.3. Le numéro de « type de fumée » des
  objets (`SMKG`, chunk `SMOK` des objets) est un numéro de modèle.
- **Particule** : position (repère de libRealSpace : `x = c0`, `y = c2`, `z = −c1`), vitesse, taille,
  vie, teinte, image, forme, compteur de visibilité.
- **Ordre de dessin** : le jeu dessine les particules **dans le même tri** que les faces (§ 5.2). Avec un
  tampon de profondeur, l'équivalent est de dessiner les particules après les objets opaques, triées du
  plus loin au plus proche, en testant la profondeur sans l'écrire.
- **Teinte** : le jeu ne mélange pas des couleurs, il remplace chaque pixel du fond par une table. En
  OpenGL, il faut soit reproduire la table (rendu en indices de palette, ou texture de 256 × n tables
  appliquée au fond), soit l'approcher par un mélange : choix pour le portage.
- **Disque** : ellipse, pas cercle (rayon vertical × 0,832) si l'image est en 320 × 200.
- **Compteur de visibilité** (§ 4.1) : une particule hors champ disparaît après 2 images ; à reproduire
  pour avoir les mêmes traînées.
- **Mode `R` et `S`** : le pas est partagé par toutes les particules d'un modèle.

## 7. Outils et images

- `tools/smoke_render.py --donnees <DATA> <dossier>` : planche des formes (niveaux de densité en gris),
  planche des 44 tables `FADE`, colonne de fumée de `SMOKEGEN.IFF` (GIF). Pillow : `python3.13`.
- `tools/smoke_trail.py --donnees <DATA> [--chute] <objet.IFF> <sortie>` : traînée d'un avion en virage,
  modèle du chunk `SMOK` ou, avec `--chute`, celui du `JINF` (GIF).
- `tools/object_viewer.py <objet.IFF> --donnees <DATA>` : la visionneuse WebGL embarque les fumées
  (section « Fumée » : traînée `SMOK`, chute `JINF` ou n'importe quel modèle ; vitesse, virage, cadence) ;
  composition en index de palette avec les tables `FADE`. `data/F-16DES_viewer.html` est générée ainsi.
- Images : `analysis/smoke_images/` (`smoke_shapes.png`, `smoke_models.png` chaque modèle au fil de sa
  vie sur un ciel, `fade_tables.png`, `smokegen_txma.png`, `smokegen_column.gif`, `f16_trail.gif`
  modèle 3, `f16_chute.gif` modèle 6). `SMOKE_SYSTEM.html` les embarque.
- Sur l'index de ciel 240, les tables d'assombrissement passent par la rampe de l'eau (160 à 175) avant
  le gris : les reflets cyan des images viennent des tables, pas des outils.

Ces rendus sont des illustrations : mise à l'échelle des sprites au plus proche voisin
(`Render_DrawScaledSprite_621A2` non lue en détail), particules triées avec l'avion entier et non avec
chacune de ses faces.

## 8. Points ouverts

- Décodage des formes `LZ` par l'exécutable de la version CD (§ 2.4), non lu.
- Ordre, dans l'image, des méthodes +16 (mise à jour) et +20 (mouvement) par rapport à la projection :
  appelants non lus.
- Rôle de `ChaseCamera_ComputeGeometryHelper_5525B`, appelé avec l'aléa et la vitesse dans les deux
  fonctions d'émission (son résultat n'est pas réutilisé dans ce qui a été lu).
- Second appelant de `Particles_SpawnAlongSegment_4D1C9` dans seg104, non lu.
