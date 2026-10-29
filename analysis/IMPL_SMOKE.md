# Fumées : proposition d'implémentation dans libRealSpace

Rédigé le 2026-10-29. Repère de libRealSpace (Y = altitude), mètres, secondes, nombres en décimal.
Ce que fait le jeu, fonction par fonction : `SMOKE_SYSTEM.md`. Ici : **quoi écrire dans libRealSpace**,
avec un code de référence complet dans `tools/smoke_ref/`.

Le code de référence est **compilé contre les sources de libRealSpace** (dépôt `remileonard/libRealSpace`,
commit `c5fa505` du 2026-10-27) : il emploie les vraies classes `ByteStream`, `IFFSaxLexer`, `LZBuffer`,
`PakArchive`, `RLEShape`, `Vector3D` et `Matrix`. Il est au style du projet (`clang-format`,
`tools/sc_player/tools/style_check.py`) et compile sans avertissement avec `g++ -Wall -Wextra`.
Deux essais tournent sur les données du jeu (§ 7), dont un rendu OpenGL hors écran.

| Fichier | Rôle | Place proposée dans libRealSpace |
|---|---|---|
| `RSSmokeSet.h`, `RSSmokeSet.cpp` | lecture de `SMOKESET.IFF`, de `PALFADE.IFF` et des chunks `SMOK`, `JINF`, `SMKG` des objets | remplace `src/realspace/RSSmokeSet.*` |
| `SCSmokeParticles.h`, `SCSmokeParticles.cpp` | particules : création, vie, animation, mouvement ; générateur posé `SMKG` ; point d'émission | nouveau, `src/strike_commander/` |
| `smoke_alpha.h`, `smoke_alpha.cpp` | tables `FADE` approchées par couleur + alpha, textures RVBA | nouveau, `src/strike_commander/` |
| `SCSmokeRenderer.h`, `SCSmokeRenderer.cpp` | textures précalculées, dessin OpenGL (pipeline fixe, comme `SCRenderer`) | nouveau, `src/engine/` ou `src/strike_commander/` |
| `smoke_test.cpp`, `smoke_render_test.cpp`, `build.sh` | essais sur les données | reste dans ce dépôt |

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

## 3. Particules (`SCSmokeParticles`)

Une réserve de `maxParticles` particules (120), partagée par tous les émetteurs, comme dans le jeu. Quand
elle est pleine, une demande de particule est ignorée.

```cpp
void spawn(int model, Vector3D position, Vector3D velocity);              // Particle_SpawnWithColor
void spawnAlongSegment(int model, Vector3D p, Vector3D q, float dt);      // Particles_SpawnAlongSegment_4D1C9
void emitTrail(int model, Vector3D emissionPoint, Vector3D objectVelocity, float dt);  // Q = P − vitesse × dt
void update(float dt);                                                    // vie, visibilité, image, taille, teinte, position
```

- **Traînée** (`SmokeTrail_Tick_3D57E`) : point d'émission P de l'image, Q = P − vitesse de l'objet × dt ;
  N = longueur ÷ espacement (au moins 1) ; particule k vieillie de dt + k × dt ÷ N, taille et teinte avancées
  d'autant, image = partie entière de k × images/s × dt ÷ N ; dispersion cumulée à partir de la 3e particule.
- **Générateur posé** (`SCSmokeGenerator`, `SmokeGen_Tick_4C057`) : une particule toutes les « intervalle »
  secondes, vitesse (0, montée, 0), pendant « durée » secondes ; `tick` renvoie `false` quand l'objet doit être
  supprimé.
- **Mise à jour** : vie −= dt ; compteur de visibilité (2 au départ, remis à 2 si la particule a été dessinée,
  sinon −1, supprimée à 0) ; image d'animation d'un pas au plus par mise à jour, modes `R`, `S`, `T`, `W`, le pas
  des modes `R` et `S` **partagé par toutes les particules du modèle** ; taille et teinte linéaires ;
  position += vitesse × dt.
- **Une mise à jour par image dessinée.** Le compteur de visibilité compte des mises à jour entre deux
  dessins : si la simulation fait plusieurs pas entre deux images, toutes les particules disparaissent au
  2e pas sans dessin. `update(dt)` est donc appelé une fois par image, avec la durée de l'image.

`smokeEmissionPoint(position, orientation, point)` donne le point d'émission dans le monde avec **la même
matrice que `SCRenderer::drawModel` et `drawModelWithChilds`** (translation, puis rotations autour de Y, Z, X,
`Matrix::translateM` et `Matrix::rotateM`).

Quel modèle pour quel émetteur (`SMOKE_SYSTEM.md` § 3.3) :

| Émetteur | Modèle |
|---|---|
| missile en vol | `entity->smoke.type` (0 pour `AGM-65D`, `AMRAAM`, `SWINDERJ`, `SWINDERM` ; 8 pour `M261`) |
| avion touché par un choc (`Aircraft_OnCollision_9D910`) | `entity->smoke.type` (3 pour les 20 avions) |
| avion IA abattu qui tombe (`Aircraft_OnDestroyed_9D770`) | `entity->fall_smoke` (6) ; explosion immédiate avec la chance du 5e champ du `JINF` (F-16 : 3 %) |
| générateur `SMKG` (épaves, `SMOKEGEN`) | type de son `INFO` (4 navires et pétrolier, 7 véhicules, 0 `DABRMS-G`) |

## 4. Dessin (`SCSmokeRenderer`)

**Au chargement** (`init`, sans OpenGL), puis `upload` (contexte actif) :
1. les 44 tables `FADE` sont approchées par une couleur et un alpha (`fitFadeTables`, `SMOKE_SYSTEM.md` § 6.1) ;
2. chaque image de forme est décodée par `RLEShape::Expand` dans un tampon largeur × hauteur (octet 255 = pas
   de pixel), point d'accroche en (gauche, haut) de l'image ;
3. pour chaque modèle à formes : formes A et B, chaque image, chaque teinte entière de la vie du modèle → une
   texture RVBA (`buildSmokeTexture`) : couleur hors de A … A + B − 1 opaque, couleur dans la plage = cible et
   alpha de la table teinte + c − A. Avec `SMOKESET.IFF` : **960 textures, 12 Mo**.

**Chaque image** (`render`), après les objets opaques, avec les matrices de la caméra chargées :
- matrices lues dans OpenGL (`GL_MODELVIEW_MATRIX`, `GL_PROJECTION_MATRIX`, `GL_VIEWPORT`) : pas de
  dépendance à `Camera` ;
- projection comme `Particle_ProjectToScreen_4C1EE` : profondeur au-delà du plan proche et en deçà de
  `maxDistance`, rayon à l'écran > 0,6 pixel d'un écran de 200 lignes (focale du jeu = `projection[5] × 100`) ;
- tri du plus loin au plus proche, ordre stable (`RenderList_RadixSortDescending_588E8`) ;
- rejet hors de la fenêtre sur r = échelle × demi-taille ; sinon la particule est marquée dessinée ;
- sprite : carré face à la caméra en repère œil, **un pixel d'image = échelle × profondeur ÷ focale mètres**,
  échelle = taille × focale ÷ (profondeur × demi-taille), bornée de 4/256 à 32 comme le jeu ; texture de
  (forme, image, partie entière de la teinte) ;
- état : `GL_BLEND` en `GL_SRC_ALPHA`, `GL_ONE_MINUS_SRC_ALPHA` ; test de profondeur sans écriture
  (`glDepthMask(GL_FALSE)`) ; pas de test alpha ni d'éclairage ; `GL_NEAREST`.

Le test de profondeur sans écriture est l'équivalent, avec un tampon de profondeur, du tri commun du jeu où les
particules et les faces sont dans la même liste (`SMOKE_SYSTEM.md` § 5.2) : une particule passe derrière ce
qui est plus proche qu'elle et devant le reste.

## 5. Branchement dans libRealSpace (proposition, non compilée)

**Un seul jeu de fumées.** `SCSmokeSet` (le singleton `getInstance()` existe déjà) devient le propriétaire :

```cpp
class SCSmokeSet {
    // …
public:
    RSSmokeSet set;
    SCSmokeParticles particles;
    SCSmokeRenderer renderer;
    void init();
};

void SCSmokeSet::init() {
    // OBJECTS\SMOKESET.IFF (nom du chunk WRLD/SMOK quand RSWorld le lira), PALETTE\PALETTE.IFF, PALETTE\PALFADE.IFF
    TreEntry *smk = Assets.GetEntryByName("..\\..\\DATA\\OBJECTS\\SMOKESET.IFF");
    set.InitFromRam(smk->data, smk->size);
    TreEntry *fadeEntry = Assets.GetEntryByName("..\\..\\DATA\\PALETTE\\PALFADE.IFF");
    std::vector<uint8_t> fade = loadFadeTables(fadeEntry->data, fadeEntry->size);
    std::vector<uint8_t> rgb;
    for (int i = 0; i < 256; i++) {
        Texel *t = this->palette.GetRGBColor(i);
        rgb.push_back(t->r);
        rgb.push_back(t->g);
        rgb.push_back(t->b);
    }
    renderer.init(set, rgb.data(), fade);
    particles.init(&set, 1993);
}
```

`renderer.upload()` est appelé une fois le contexte OpenGL prêt (avant la première image de vol), et
`renderer.release()` à la fermeture.

**Avion** (`SCPlane::Simulate`, à la place de `smoke_positions`) : vitesse = déplacement de la dernière mise à
jour × `tps` ; orientation = celle de `SCPlane::Render`.

```cpp
if (this->smoke_on) {
    Vector3D pos = {
        this->x,
        this->y,
        this->z
    };
    Vector3D orientation = {
        tenthOfDegreeToRad(this->yaw + 900),
        tenthOfDegreeToRad(this->pitch),
        -tenthOfDegreeToRad(this->roll)
    };
    RSObjectSmoke &smk = this->object->entity->smoke;
    Vector3D local = {
        smk.x,
        smk.y,
        smk.z
    };
    Vector3D velocity = {
        (this->x - this->last_px) * this->tps,
        (this->y - this->last_py) * this->tps,
        (this->z - this->last_pz) * this->tps
    };
    Vector3D emission = smokeEmissionPoint(pos, orientation, local);
    SCSmokeSet::getInstance().particles.emitTrail(this->smoke_type, emission, velocity, 1.0f / this->tps);
}
```

`smoke_on` et `smoke_type` sont deux champs à ajouter : `smoke_type = entity->smoke.type` à la création,
remplacé par `entity->fall_smoke` quand l'avion IA abattu tombe ; `smoke_on` posé au choc et à la chute.

**Missile** (`SCSimulatedObject::Simulate`, à la place de `smoke_positions`) : même appel avec
`obj->smoke.type`, la position `x, y, z`, l'orientation `{azimuthf, elevationf, 0}` de `SCSimulatedObject::Render`
et la vitesse `vx, vy, vz` × `tps`, tant que le moteur pousse (`no_thrust == false`).

**Générateurs `SMKG`** : un `SCSmokeGenerator` par objet de la mission dont l'entité est un `SMKG`, `tick`
à chaque image avec la position de l'objet.

**Image** (`SCStrike::runFrame`) : après les objets, les armes et les explosions, avant le cockpit :

```cpp
SCSmokeSet &smoke = SCSmokeSet::getInstance();
smoke.particles.update(frameSeconds);
smoke.renderer.render(smoke.particles, RENDER_DISTANCE);
```

`SCPlane::RenderSmoke`, `smoke_positions`, `smoke_anim_counters`, `generateMissileSmokeTextures` et l'appel
de `drawBillboard` pour la fumée ne servent plus.

## 6. Choix et écarts avec le jeu

- **Teinte** : mélange alpha au lieu de la table `FADE` appliquée au fond (choix de Rémi, précalcul plutôt que
  calcul par image). Les tables qui assombrissent (16 à 31, traînées 3 et 6) sont bien approchées ; celles qui
  éclaircissent (5 à 12, missiles) le moins (`SMOKE_SYSTEM.md` § 6.1).
- **Forme carrée** : le carré fait la même taille en mètres sur les deux axes. Le jeu met à l'échelle en pixels
  d'un écran 320 × 200, dont les pixels ne sont pas carrés à l'affichage ; ce rapport n'est pas reproduit pour
  les sprites. Pour le disque (mode 0, aucun modèle des données), le rayon vertical × 213/256 est gardé.
- **Distance maximale** : le jeu la lit dans `dword_72540`, valeur non relevée ; `render` la prend en
  paramètre.
- **Plan proche** : celui de la projection de libRealSpace (le jeu : `dword_721F6`).
- **Tirages** : `std::mt19937` au lieu du générateur du jeu ; mêmes lois (uniforme sur ± dispersion, chance
  sur 100).
- **Ordre dans l'image** : émissions (dans la simulation des objets), mise à jour, dessin. L'ordre exact des
  trois dans la boucle du jeu n'est pas relu (`SMOKE_SYSTEM.md` § 8).

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
- 960 textures, 12 055 Ko (même nombre que la visionneuse `object_viewer.html`) ;
- F-16 à 150 m/s, 15 images/s : traînée (modèle 3) stable à 22 particules, chute (modèle 6) à 11 ;
- chunk `SMOK` du F-16 : modèle 3, point x = −14 ; `JINF` : modèle 6 ;
- `SMOKEGEN.IFF` : modèle 4, 60 s, 14 m/s, 0,297 s, suppression à la fin ; après 10 s, 13 particules, la plus
  haute à 57 m.

Rendus OpenGL de `smoke_render_test` (640 × 400, avion à 100 m/s vu de côté, fond ciel) :
`analysis/smoke_images/gl_chute.png` (modèle 6) et `gl_trainee.png` (modèle 3).
