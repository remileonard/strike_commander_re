# PHYSICS.md — Modèle de vol JETP, spécification pour `SCJetpPlane`

Document de synthèse de la session de décodage du modèle physique de vol
(`DATA_MODEL.md` §6.2 pour le détail ligne-à-ligne assembleur). Ce fichier
est la **spec d'implémentation** pour une classe **`SCJetpPlane : public
SCPlane`** dans libRealSpace, qui reproduit fidèlement l'algorithme
d'Origin **en unités SI**, à partir des seuls chunks `DYNM`/`ATMO`/`THRS`/
`STBL`/`JDYN` + les entrées pilote.

**`SCJetpPlane` est un objet neuf et indépendant** — il ne remplace ni ne
modifie `SCPlane` (modèle générique existant) ni `SCJdynPlane` (tentative
métrique existante de Rémi, basée sur des valeurs devinées faute d'avoir
eu ce document). Les trois coexistent pour permettre une **comparaison
directe** des modèles et choisir le meilleur en connaissance de cause.
Ce document ne touche à aucun fichier de libRealSpace.

Référence croisée : `/Users/remi/source/libRealSpace/src/strike_commander/SCPlane.h`
et `SCJdynPlane.h` (lus le 2026-09-05).

---

## 0. Constat sur `SCPlane` — un modèle générique, pas le modèle Origin

`SCPlane.h` implémente déjà une décomposition en méthodes virtuelles
(`processInput` → `computeThrust/Lift/Drag/Gravity` → `updateForces` →
`updateAcceleration` → `updateVelocity` → `updatePosition`) qui **colle
étonnamment bien** à la structure réelle de `PhysicsTicks` — bonne
nouvelle, `SCJetpPlane` n'a pas à réinventer le squelette, juste à
resurcharger ces virtuelles avec les vraies formules et les vraies
données.

Mais les **constantes et unités actuelles de `SCPlane` ne viennent pas du
binaire** :
- `G_ACC = 32.17f` (ft/s², impérial) — le jeu utilise `g = 9.8 m/s²` (voir §2).
- `ro[75]` (densité de l'air en **slugs/ft³**, tous les 1000 ft jusqu'à
  75 000 ft) — reconnaissable comme une table d'atmosphère standard
  généraliste (valeurs ISA classiques), **pas** `AIRDENS.TBL` du jeu (voir §6).
- Les paramètres `LmaxDEF/LminDEF/Fmax/Smax/ELEVF_CSTE/ROLLFF_CSTE/s/W/
  fuel_weight/Mthrust/b/ie_pi_AR/MIN_LIFT_SPEED` sont des **paramètres de
  constructeur codés en dur par avion**, pas lus d'un fichier.

`SCJetpPlane` doit remplacer ce constructeur à constantes fixes par un
**chargement depuis les 5 chunks IFF** de la FORM `DYNM` du `JETP`, en SI.

---

## 1. Les 5 chunks source (condensé — détail : `DATA_MODEL.md` §6.2)

```
JETP  (FORM, struct 0x6A)
 └─ DYNM  (FORM externe)
     ├─ DYNM  (chunk)  u32            → MASSE (kg)                         [err A001]
     ├─ ATMO  (chunk)  u32 (+bloc si dword_72A0A≠0) → id atmosphère        [err A002]
     ├─ THRS  (chunk)  u32 + u8×3     → POUSSÉE (N) + 3 params moteur      [err A003]
     ├─ STBL  (chunk)  u32            → coeff de stabilité / autorité pitch [err A004]
     └─ JDYN  (chunk)  28 champs (73o)→ enveloppe de vol                   [err A005]
```

Toutes les valeurs disque sont des **entiers 24.8** (÷256 pour obtenir la
valeur physique). Les booléens u8 le sont directement (pas de ÷256).

### 1.1 Table de conversion disque → SI

| Champ disque | → variable | Unité SI | Formule |
|---|---|---|---|
| `DYNM` (u32) | `mass` | kg | `raw / 256.0` |
| `THRS+0x00` (u32) | `thrust_max` | N | `raw / 256.0` |
| `THRS+0x04` (u8) | `mil_fraction` | — [0,1] | `raw / 256.0` |
| `THRS+0x05` (u8) | `ref_alt_fraction` | — [0,1] | `raw / 256.0` |
| `THRS+0x06` (u8) | `cutoff_alt_scale` | — | `raw` (entier, ×100 → mètres, voir §4.2) |
| `STBL` (u32) | `pitch_authority` | — | `raw / 256.0` (échelle sans dimension) |
| `JDYN #1` (u32, `+0x00`→`+0x69`) | `fuel_capacity` | kg | `raw / 256.0` |
| `JDYN #2` (u32, `+0x04`→`+0x33`) | `sfc` | kg·s⁻¹ par unité de poussée·cran | `raw / 256.0` |
| `JDYN #3` (u32, `+0x08`→`+0x37`) | `drag_airbrake` | — (coeff additif) | `raw / 256.0` |
| `JDYN #4` (u32, `+0x0C`→`+0x3B`) | `drag_gear` | — | `raw / 256.0` |
| `JDYN #5` (u32, `+0x10`→`+0x3F`) | `ground_moment_1` | — | `raw / 256.0` |
| `JDYN #6` (u32, `+0x14`→`+0x43`) | `ground_moment_2` | — | `raw / 256.0` |
| `JDYN #7` (u32, `+0x18`→`+0x47`) | `rate_limit` | deg/s (à confirmer) | `raw / 256.0` |
| `JDYN #8` (u32, `+0x1C`→`+0x71`) | `max_turn_rate` | deg/s | `raw / 256.0` |
| `JDYN #9` (u8, `+0x20`→`+0x4B`) | `stall_alpha` | ° | `raw` (déjà en degrés, cf. §2) |
| `JDYN #10` (u8, `+0x21`→`+0x4C`) | `wing_incidence` | ° | `raw` |
| `JDYN #11` (u8, `+0x22`→`+0x4D`) | `flap_lift_increment` | ° | `raw` |
| `JDYN #12` (u32, `+0x23`→`+0x4E`) | `envelope_vs_limit` | m/s (à confirmer) | `raw / 256.0` |
| `JDYN #13` (u32, `+0x27`→`+0x52`) | `envelope_speed_limit` | m/s | `raw / 256.0` |
| `JDYN #14` (u8, `+0x2B`→`+0x56`) | `envelope_bank_limit` | ° (à confirmer) | `raw` |
| `JDYN #15` (u8, `+0x2C`→`+0x57`) | `envelope_pitch_limit` → **`pitch_rate_limit_dps`** | °/s | `raw` — champ réel, chargé depuis la session du 2026-09-05, mais **actuellement inutilisé** dans le servo de tangage restauré (§5.7) qui réutilise `max_turn_rate` (#8) comme les deux autres axes ; à nettoyer ou retrouver un usage ASM confirmé (§8) |
| `JDYN #16` (u8, `+0x2D`→`+0x58`) | `envelope_pitch_margin` | ° (à confirmer) | `raw` |
| `JDYN #17` (u32, `+0x2E`→`+0x59`) | `ground_effect_ceiling` | m | `raw / 256.0` |
| `JDYN #18` (u32, `+0x32`→`+0x5D`) | `induced_drag_k` | — (= `1/(π·e·AR)`) | `raw / 256.0` |
| `JDYN #19` (u32, `+0x36`→`+0x61`) | `lift_gain` | — (rôle de `Clα·S`, sans unité S/b séparées) | `raw / 256.0` |
| `JDYN #20-22` (u8×3, `+0x3A..3C`→`+0x65..67`) | coeffs × gains globaux (=1.0 par défaut) | — | `raw / 256.0` |
| `JDYN #23-25` (u16×3, `+0x3D/3F/41`→`+0x80/82/84`) | **params IA** : vitesse poursuite max / min / croisière | — | 500 / 100 / 231 — DATA_MODEL §6.2 |
| `JDYN #26` (u32, `+0x43`→`+0x86`) | **param IA** : seuil de portée | — | 11005 |
| `JDYN #27-28` (u8×2, `+0x47/48`→`+0x8A/8B`) | **params IA** : décision de combat (`#28` = poids d'un score ; `#27` non localisé) | — | 3 / 2 |

**Ce qui manque pour un modèle « aire alaire / envergure » classique :**
`s` (surface alaire) et `b` (envergure) **n'existent dans aucun de ces 5
chunks**. Le jeu original **n'en a pas besoin** : `induced_drag_k` (=
`jdyn[0x5D]`) joue directement le rôle de `ie_pi_AR` = `1/(π·e·AR)`, et
`lift_gain` (= `jdyn[0x61]`) joue le rôle d'un `Clα` déjà mis à l'échelle
de la surface alaire. **`SCJetpPlane` n'a donc pas besoin de `s`/`b` en
paramètres** — voir §7.

---

## 2. Système d'unités & constantes globales

- **SI partout** : kg, N, m, m/s, m/s², s. Le fichier disque encode tout
  en fixe 24.8 (`valeur × 256`).
- **`g = 9.8 m/s²`** — trouvé en dur dans le binaire : `dword_6FFD7 =
  0xFFFFF634 = −2508` (24.8) `= −9.797 m/s²` (`strike.asm:144603`).
  Remplace `G_ACC = 32.17f` (ft/s², à supprimer de `SCJetpPlane`).
- **Les angles d'écoulement α (incidence) et β (dérapage) sont en
  DEGRÉS** dans le jeu original : `Cα = dword_707B2 = 0x394B = 57.29 =
  180/π` sert de facteur radians→degrés. **CORRECTION (session
  2026-09-05, relecture octet-près)** : le seuil de zone morte du servo
  d'attitude n'est PAS `0x3800=56°` comme affirmé ici précédemment — la
  comparaison réelle se fait contre `56` BRUT (pas `0x3800`, qui n'est
  qu'une valeur intermédiaire jamais relue ensuite dans la fonction —
  probable sous-produit d'une macro FIXED-point générique qui calcule
  systématiquement la forme mise à l'échelle, pas du code mort)
  face à une erreur exprimée en 24.8 (degré×256) : seuil réel
  **`56/256 = 0.21875°`**, une zone morte anti-bruit, pas 56°. Détail et
  citation exacte des lignes ASM : §5.7.
- **Repère corps** (sortie de la transformation monde→corps de la
  vitesse) : `c0` = envergure (aile droite), `c1` = axe longitudinal
  (nez, axe de poussée), `c2` = normale (portance, à travers la verrière).
  Conversion vers le repère `SCPlane`/libRealSpace (`forward = {0,0,-1}`,
  Y-up) : `local.x = c0`, `local.y = c2`, `local.z = -c1` (signe négatif
  car le nez ASM (`+c1`) correspond à l'avant local `-Z` de `SCPlane`).
- **`AIRDENS.TBL`** fournit `ρ(altitude)` (§6) — remplace `ro[75]`.
- **Gains globaux `dword_72A14..72A2C` = `1.0`** (posés par
  `sub_A5620`) — tous les facteurs multiplicatifs génériques du jeu sont
  neutres par défaut ; ignorables pour une repro fidèle standard.
- **Pas de trim pilote.** Le jeu est en accès direct sur les axes
  (clavier/joystick) : `elevator`/`rollers`/`rudder` de `SCPlane`
  correspondent directement à la commande brute, rate-limitée par
  `rate_limit` (`jdyn[0x47]`), sans intégrateur de trim séparé.

---

## 3. Séquence du tick (ordre exact, `PhysicsTicks`)

**Important** : l'ordre est **« intègre-puis-calcule »** — la position du
tick `n` est intégrée avec la vitesse du tick `n−1`, **avant** que les
nouvelles forces du tick `n` soient calculées. Ça correspond exactement à
l'ordre de déclaration des méthodes virtuelles dans `SCPlane.h`
(`updatePosition` déclarée **avant** `updateAcceleration`/`updateForces`) :

```
1. updatePosition()        position += velocity · dt            (avec la vitesse de la frame précédente)
2. processInput()          lit les axes, flags volets/train/aérofrein, manette
3. computeThrust()         → thrust_force, thrust_vector
4. computeLift()           → Cl, lift_force, lift_vector, ae (α) ; clamp au décrochage + départ franc joueur (§5.2)
5. computeDrag()           → Cd, drag_force, drag_vector
6. computeGravity()        → gravity_force, gravity_vector
7. updateForces()          F = thrust + lift(+latéral) + drag ; accel = F/mass + gravity_vector
8. updateAcceleration()    stocke acceleration, ax/ay/az
9. updateVelocity()        velocity += bodyToWorld(acceleration) · dt
   [contrainte sol si on_ground : projette la vitesse hors du plan sol, v_alt≥0, deadband]
10. checkStatus()          flameout si fuel≤0, crash si sous le sol
11. updatePlaneStatus()    anims (train/volets), takeoff/landed
```

Les moments de contrôle (asservissement d'attitude, §5) sont calculés en
parallèle du bloc 3-7 et intégrés dans l'orientation séparément (voir §5.4).

---

## 4. Poussée — `computeThrust()`

### 4.1 Courbe manette (`Aero_ThrottleThrustCurve`, ex-`ComputeCoeffSaturating`)

```cpp
// cran ∈ [0,10] : MIL = [0,5], PC (postcombustion) = [5,10] ; cran = -1 traité comme 0
float fThrottle(float cran) {
    if (cran <= 5.0f)
        return (cran / 5.0f) * mil_fraction;
    return mil_fraction + (1.0f - mil_fraction) * (cran - 5.0f) / 5.0f;
}
// 0 à cran 0, mil_fraction à cran 5 (MIL 100%), 1.0 à cran 10 (pleine PC)
```

### 4.2 Lapse avec l'altitude (PAS avec la vitesse-air — vérifié, même champ
que la densité de l'air §6)

```cpp
constexpr float HREF = 11000.0f;                 // m — altitude de référence (tropopause)
float hcut = cutoff_alt_scale * 100.0f;           // m — défaut 231 → 23100 m

float fLapse(float alt_m) {
    if (alt_m <= HREF)
        return 1.0f - (alt_m / HREF) * (1.0f - ref_alt_fraction);
    return ref_alt_fraction - ref_alt_fraction * (alt_m - HREF) / (hcut - HREF);
}
// 1.0 au niveau mer, ref_alt_fraction à 11 000 m, → 0 vers hcut
```

### 4.3 Assemblage

```cpp
void SCJetpPlane::computeThrust() {
    thrust_force = std::max(0.0f, thrust_max * fThrottle(throttle_setting) * fLapse(position.y /* altitude */));
    if (fuel <= 0.0f) thrust_force = 0.0f;                    // flameout
    thrust_vector = forward * thrust_force;                  // axe corps nez, PUR (pas de composante latérale/verticale)
}
```

`Mthrust` de `SCPlane` ↔ `thrust_max` (converti N). Le manette clavier
(`+`/`-`, `1`…`0`, MIL 0-5/PC 6-10) est un dispatcher **hors** de la
boucle de tick ASM tracée — à reproduire côté input, pas physique.

---

## 5. Aérodynamique

### 5.1 Angles d'écoulement (repère corps, degrés)

```cpp
Vector3D v_body = worldToBody(velocity);           // via l'orientation courante
float V = velocity.length();
float alpha = -RAD2DEG_57_29 * v_body.z_up /*c2*/ / V;   // ≈ -Cα·sin(incidence)
float beta  = -RAD2DEG_57_29 * v_body.span  /*c0*/ / V;
```
(`RAD2DEG_57_29 = 57.29578` — c'est littéralement `180/π`, pas une
coïncidence : préserver la précision de `dword_707B2` telle quelle, ou
utiliser `180.0/M_PI` en SI, résultat identique.)

### 5.2 Incidence effective + décrochage — `ae` / `Aero_ComputeLiftAndSideForce`

`Aero_ComputeAoAWithTrim_480CA` (seg103) donne l'AoA effectif ; la
**borne de décrochage** est appliquée juste après, dans
`Aero_ComputeLiftAndSideForce_4812B` (seg103, `loc_481C1`→`loc_48239`).
Le seuil est `stall_alpha = jdyn[0x4B]` (u8, °) et sert **aussi pour le
dérapage** `beta`.

```cpp
float ae_raw = alpha + wing_incidence + (flaps ? flap_lift_increment : 0.0f);

// (A) SATURATION — toujours active (loc_48211..loc_48239) : borne symétrique appliquée AVANT k_lift.
//     Au-delà de stall_alpha la portance PLAFONNE — elle ne s'effondre pas (pas de courbe post-décrochage).
ae = std::clamp(ae_raw, -stall_alpha, +stall_alpha);
bool side_stall = std::abs(beta) > stall_alpha;   // → coupe la force latérale (cf. §5.3, loc_482E7)

// (B) DÉPART FRANC — portance forcée à (0,0,0). Les 4 conditions, dans l'ordre du code
//     (loc_481C1 → chaîne de sauts vers loc_48211 = "sinon on retombe sur (A)") :
bool hard_stall =
       std::abs(ae_raw) > stall_alpha       // test sur l'AoA NON borné      (loc_481C1)
    && difficulty       > 10                // word_70466 (réalisme global)   (loc_481CF)
    && realism_option                       // byte_72354 != 0 (option de jeu, = 1 par défaut, init ovr266)
    && is_player;                           // handle == word_722E6 — JAMAIS les IA
wing_stall = hard_stall;   // flags_75 bit6 = (obj[+0x20] == 0) : drapeau d'alerte HUD/son, PAS un couple
```

`wing_incidence` (`jdyn[0x4C]`, toujours ajouté) et `flap_lift_increment`
(`jdyn[0x4D]`, seulement si volets sortis = `flags_75.bit1`) sont des
**constantes de cellule lues du fichier**, pas des trims pilote
(`ELEVF_CSTE`/`ROLLFF_CSTE` de `SCPlane` sont le bon *type* de champ mais
doivent être **chargés depuis JDYN**, pas codés en dur par sous-classe).

**Rien d'autre** : pas de terme de traînée de décrochage
(`Aero_ComputeDragWithFeedback` réutilise le même `ae` borné, sans ajout),
pas de buffet/oscillation dans la physique.

### 5.3 `computeLift()` — portance + force latérale (`Aero_ComputeLiftAndSideForce`)

```cpp
void SCJetpPlane::computeLift() {
    float q = 0.5f * airDensity(altitude) * V * V;              // §6

    float k_lift = lift_gain * q;                               // jdyn[0x61] · q  (dword_72A24 = 0x100 = 1.0)
    lift_force   = hard_stall ? 0.0f : k_lift * ae;             // (B) §5.2 : portance nulle en départ franc
    Vector3D dirLift = normalize(Vector3D{0, v_body.nose /*c1*/, -v_body.z_up /*c2*/}); // ⟂ vitesse, plan vertical
    lift_vector  = dirLift * lift_force;

    float k_side = (lift_gain * 0.25f) * q;                     // jdyn[0x61]>>2
    float side_force = side_stall ? 0.0f : k_side * beta;       // (A) §5.2 : coupée si |β| > stall_alpha
    Vector3D dirSide = normalize(Vector3D{v_body.nose, -v_body.span, 0});
    // side_vector ajouté séparément dans updateForces() — SCPlane n'a pas de champ dédié,
    // envisager un nouveau membre `side_vector` sur SCJetpPlane
}
```

**Repère** : composant perpendiculaire à la vitesse, dans le plan
vertical corps. Vaut `(0,0,±1)` (portance pure « vers le haut corps »)
**même à incidence nulle** — c'est pourquoi les volets (`flap_lift_increment`)
donnent de la portance sans changer l'assiette.

### 5.4 `computeDrag()` — traînée (`Aero_ComputeDragWithFeedback`)

```cpp
void SCJetpPlane::computeDrag() {
    float q = 0.5f * airDensity(altitude) * V * V;
    float dragFlags = 1.0f
        + (airbrake_deployed ? drag_airbrake : 0.0f)
        + (gear_deployed     ? drag_gear     : 0.0f);
    Cd = induced_drag_k * ae * ae
       + (induced_drag_k * 0.125f) * beta * beta
       + dragFlags;
    if (on_ground) {
        float groundTerm = ground_moment_1 + (airbrake_deployed ? ground_moment_2 : 0.0f);
        Cd += groundTerm * (std::abs(v_body.span) < 1.0f ? v_body.span : 1.0f);
    }
    drag_force = q * Cd;
    drag_vector = -normalize(v_body) * drag_force;             // opposé au flux, repère corps
}
```

`Cdp` (parasite) de `SCPlane` n'a **pas d'équivalent explicite dans
JDYN** — la base parasite du jeu est la constante fixe `1.0`, seulement
augmentée par `drag_airbrake`/`drag_gear`. Pas de champ « traînée de
cellule propre » séparé dans les données.

### 5.5 `computeGravity()`

```cpp
void SCJetpPlane::computeGravity() {
    gravity_vector = worldToBody(Vector3D{0, -G_SI, 0});   // G_SI = 9.8 ; Y = altitude (convention SCPlane)
    gravity_force  = mass * G_SI;                          // pour affichage / W équivalent si besoin
}
```
Ajoutée **après** la division par la masse dans `updateForces()` (déjà
une accélération, pas une force à diviser).

### 5.6 `updateForces()` — somme (`Aero_SumLinearForces_48639`)

```cpp
void SCJetpPlane::updateForces() {
    Vector3D F_body = thrust_vector + lift_vector + side_vector + drag_vector;
    acceleration = bodyToWorld(F_body) / mass + Vector3D{0, -G_SI, 0};
    g_load = -F_body.z_up /*c2*/ / mass / G_SI;   // facteur de charge (G-mètre), PAS l'accél verticale monde
}
```

### 5.7 Asservissement d'attitude ASM (`Aero_ControlOrchestrator` + `Aero_ComputeForcesMain`) — **NON câblé sur `pitch` dans le port (décision 2026-09-05)**

> **État au 2026-09-05, après plusieurs allers-retours :** le servo ASM
> `Aero_ComputeForcesMain` (asservissement √ sur `alpha`) a été rebranché
> sur `pitch` puis **re-débranché**. Motif définitif : `jdyn[+4]`
> (= `pitch_speed` côté ASM) est un **état interne de la physique**.
> `Aero_ComputeForcesMain` l'écrit et le relit pour son propre limiteur de
> taux (vérifié : lecture de `[si+4]` dans le bloc de clamp, seg102
> L2693/2720), mais **aucune trace ASM ne montre un tiers qui lit
> `jdyn[+4]` pour construire l'orientation visible de l'avion**. Le
> brancher directement sur l'angle `pitch` reproduit le bug de piqué du
> nez (dès qu'une portance génère une accélération verticale, `pitch`
> devient négatif → l'avion pique). Le raisonnement de l'ancienne analyse
> (`alpha = pitch − γ`, `pitch` gagne la course contre `γ` faute
> d'inertie) n'a jamais été invalidé par une preuve ASM.
>
> **Hypothèse de travail (Rémi, 2026-09-05), à confirmer dans le binaire :**
> dans le jeu d'origine, `pitch`/`roll`/`yaw` **ne sont pas portés par la
> struct JDYN** mais par l'**objet monde (entity)** qui représente
> l'avion — tourné par une **fonction générique polymorphe** partagée par
> tous les objets (une seule liste d'objets ⇒ un seul intégrateur de
> rotation). Candidate : `WorldObject_BuildOrientationMatrix_56E8A` /
> `Matrix_BuildAxisX/Y/Z_56EC3` (composition incrémentale sur une matrice
> persistante, déjà confirmée pour la caméra et l'IA). Indice côté
> données : `REAL`/`OBJT` contient des types polymorphes `JETP` / `GRND` /
> `RNWY`… La piste `vtable[+0x34]` de la vtable `JETP` a été tentée le
> 2026-09-05 : le calcul (`seg339` base `0x6D070` + tag `0x24C8`) tombe sur
> `loc_45BBB`, qui est un **stub trivial** (`mov al,15h / retf`, retourne
> une constante) — donc soit le tag `0x24C8` de `JETP` (hérité, non
> vérifié) est faux, soit `JETP` utilise une autre table. **Piste ouverte.**
>
> **Implémentation courante du port :** loi directe manche→vitesse de
> tangage (`pitch_speed += clamp(-elevator·pitch_rate_limit_dps −
> pitch_speed, ±rate_limit_dps·dt)`, borné `±pitch_rate_limit_dps`),
> placeholder qui vole sans piquer. Les acquis ASM ci-dessous
> (`var_30 = cos(pitch)`, seuil `0.21875°`, forme de la loi de charge)
> restent **documentés mais non câblés** tant que le vrai consommateur de
> `jdyn[+4]` n'est pas localisé.

---

Contenu ASM décodé (référence — **pas** le chemin actif du port pour `pitch`).
Découplé de la translation dans l'ASM. Pour chaque axe (tangage montré ;
lacet identique avec `beta`/`rudder`, cf. `Aero_ResetAccumulatorFlags75Bit5`
côté lacet — confirmé indépendant du roulis et de alpha, session 2026-09-05) :

```cpp
// Aero_ComputeControlFlags75Bit5B (seg103 L1143-1517, relu octet-pres) :
// var_38 = loadDemand + var_30, PAS juste loadDemand.
float loadDemand = (elevator < 0) ? (pitch_load_gain * elevator / 3.0f / 16.0f)
                                   : (pitch_load_gain * elevator / 16.0f);
// var_30 = sin(angle(vecteur avant du repere avion, axe Z monde)), signe
// inverse si la composante Z du vecteur "haut" est negative (avion sur le
// dos). Par l'identite sin(90-x)=cos(x), vaut ~cos(pitch) pres du vol
// horizontal - PAS un terme de virage/inclinaison comme suppose au premier
// passage.
float bankTerm = cosf(tenthOfDegreeToRad(pitch));
if (ptw.v[1][1] < 0.0f) bankTerm = -bankTerm;
float var_38 = loadDemand + bankTerm;

float incidencePerG = -(mass / (q * lift_gain)) * 1.5f * G_SI;
float boundA = var_38 * incidencePerG + baseline;      // baseline = -wing_incidence (- flap_lift_increment si volets)
float boundB = bankTerm * incidencePerG + baseline;
float pitchCommandDeg = std::clamp(0.0f, std::min(boundA, boundB), std::max(boundA, boundB));
pitchCommandDeg = std::clamp(pitchCommandDeg, -pitch_stick_gain, pitch_stick_gain);

float q_prime = q * stability_gain / 100.0f;              // STBL : jdyn[0x12]
float err = pitchCommandDeg - alpha;                      // consigne (loi de charge ci-dessus) - incidence actuelle
// SEUIL : 56 BRUT compare a err en 24.8 (degre*256) -> seuil reel 56/256 = 0.21875 deg.
if (std::abs(err) < 56.0f / 256.0f) err = 0.0f;
// CORRECTION 2026-09-05 (relecture octet-pres seg102 L2440-2652, seg112 L999-1045) :
// K = dword_70454, valeur de config clampee [2.0, 25.0] (0x200..0x1900), defaut 25.0.
// (K = 1/dt_asm (0x100 = 1.0, pas 256) ; ce N'EST PAS un delta-time. Une redaction anterieure de ce
//  doc l'avait pris a tort pour 1/dt puis "dt".)
constexpr float K = 25.0f;
float target = std::copysign(std::min(2.0f * std::sqrt(q_prime * std::abs(err)),
                                       K * std::abs(err)), err);   // loi sqrt bornee par K*|err|
float accel  = std::clamp((target - pitch_speed) * K, -3.0f * q_prime, 3.0f * q_prime); // deg/s^2
pitch_speed += accel * dt;                                   // ASM : accel*dword_70458 dans Physics_IntegrateSecondaryPosition
pitch_speed = std::clamp(pitch_speed, -max_turn_rate_dps, max_turn_rate_dps);
```

Ce bloc décrit fidèlement ce que l'ASM calcule et stocke dans `jdyn[+4]`.
Ce qui reste **non tracé**, c'est le consommateur de `jdyn[+4]` qui
produirait l'assiette visible — voir l'encadré en tête de section. Tant
que ce point n'est pas résolu, `SCJetpPlane` **ne câble pas** ce servo
sur `pitch` (loi directe à la place).

`pitch_rate_limit_dps` (`jdyn[0x57]`, champ 15, `envelope_pitch_limit`)
est **de nouveau utilisé** par la loi directe de tangage courante (borne
de vitesse dédiée) ; `max_turn_rate_dps` (`jdyn[0x71]`, champ 8) reste
utilisé pour roulis et lacet.

---

## 6. Densité de l'air — `AIRDENS.TBL` (remplace `ro[75]`)

Fichier `..\..\DATA\AIRDENS.TBL`, **121 × u32 LE**, décroissant
`1322 → 28`. Index = `altitude_m / 256` (une entrée par bande de 256 m,
0 à 30 720 m). Colle à `ρ ≈ 1.225 · exp(−h/8000)` à < 1 % près
(hauteur d'échelle ≈ 8 km).

```cpp
float SCJetpPlane::airDensity(float alt_m) {
    // reproduction exacte :
    alt_m = std::clamp(alt_m, 0.0f, 30702.0f);
    float idx_f = alt_m / 256.0f;
    int i = (int)idx_f;
    float frac = idx_f - i;
    float raw = std::lerp(AIRDENS_TABLE[i], AIRDENS_TABLE[i+1], frac);
    return 1.225f * raw / 1322.0f;          // normalisé niveau-mer = 1.225 kg/m³
    // OU, approximation fermée équivalente (sans table) :
    // return 1.225f * std::exp(-alt_m / 8000.0f);
}
```

`AIRDENS_TABLE[121]` = copie brute des u32 du fichier (valeurs dans
`AIRDENS.TBL`, décodées cette session — disponibles sur demande sous
forme de tableau C++ si utile).

**Sélection de table** : indexée par `dword_72A0A` (id d'atmosphère, lu
du chunk `ATMO`, global à la mission, `0` = table standard = celle
ci-dessus). Le bloc supplémentaire du chunk `ATMO` (quand `id≠0`) n'a pas
été décodé cette session — à date, `SCJetpPlane` peut se contenter de la
table par défaut.

---

## 7. Implications de conception pour `SCJetpPlane`

- **Constructeur** : remplacer
  `SCPlane(LmaxDEF, LminDEF, Fmax, Smax, ELEVF_CSTE, ROLLFF_CSTE, s, W, fuel_weight, Mthrust, b, ie_pi_AR, MIN_LIFT_SPEED, area, x, y, z)`
  par un chargement direct des 5 chunks (`DYNM`/`ATMO`/`THRS`/`STBL`/`JDYN`)
  depuis le `.IFF` de l'avion, via les classes IFF existantes
  (`ResourceRecord`/`IFFSaxLexer` — ne pas réinventer de parseur).
- **`s`, `b`, `ie_pi_AR` deviennent inutiles** : `ie_pi_AR` ← `induced_drag_k`
  (=`jdyn[0x5D]`) directement ; pas de notion séparée de surface/envergure
  dans le modèle Origin.
- **`LmaxDEF`/`LminDEF`** ← dérivés de `stall_alpha` (`jdyn[0x4B]`), qui
  est une borne **symétrique** sur `ae`, pas deux bornes indépendantes —
  simplification possible : `LmaxDEF = -LminDEF = stall_alpha`.
- **Décrochage** (§5.2) : la saturation `ae ∈ [±stall_alpha]` + coupure de
  force latérale si `|β| > stall_alpha` sont **toujours** actives et
  suffisent au comportement de décrochage. Le « départ franc » (portance
  nulle) demande en plus trois entrées à câbler côté port :
  `difficulty` (word_70466 > 10), une option de réalisme (byte_72354) et
  `is_player` — les IA n'y sont **jamais** soumises.
- **`Fmax`/`Smax`** (déflexion max volets/spoiler) ← rôle proche de
  `flap_lift_increment` (`jdyn[0x4D]`) mais **en incidence**, pas en angle
  de gouverne — à réconcilier selon ce que fait `tilt_factor` dans le
  reste du moteur.
- **`fuel`** ← `fuel_capacity`/`fuel` courant (`jdyn[0x69]`/`jdyn[0x6D]`),
  en kg, pas la plage `0-12800` actuelle.
- **`fuel_rate`** ← `sfc` (`jdyn[0x33]`).
- **`W` (poids, lbf)** : à remplacer par `mass` (kg) comme donnée
  primaire ; conserver `gravity_force = mass·g` seulement si du code
  aval en a besoin.
- **Nouveau champ à prévoir** : `side_vector` (force latérale de
  dérapage) — absent de `SCPlane`, nécessaire pour reproduire fidèlement
  `Aero_ComputeLiftAndSideForce`.
- **`mach`/`mcc`/`mratio`/`sos`/`updateSpeedOfSound()`** : **aucune trace
  trouvée dans l'assembleur du modèle de vol tracé cette session** — soit
  c'est un raffinement propre au port C++ (à garder tel quel, découplé de
  la fidélité ASM), soit ça vit dans le bloc `ATMO` non décodé. Ne pas
  supprimer sans vérification.
- **`azimuthf`/`elevationf`**, **`m_old_yaw`/`m_pitch_var`**,
  **`elevation_speedf`/`azimuth_speedf`** : rôle pas clairement rattaché
  au modèle de force/moment tracé (probablement vue/visée/lissage HUD) —
  **ne pas toucher sans plus d'investigation**, hors-scope de cette
  extraction.

---

## 8. Inconnues restantes (honnêtes, à ne pas deviner)

| Point | État |
|---|---|
| Diviseur de masse — ligne exacte de l'override `vtable[+0x3C]` sur l'objet JDYN | Bloqué en statique (stub no-op `loc_4692C` trouvé sur la vtable secondaire `0x228A`) ; **hypothèse retenue : `m` = chunk `DYNM`** (confirmée par Rémi comme cohérente avec la structure IFF) — à vérifier par trace DOSBox si besoin de certitude absolue |
| Bloc supplémentaire du chunk `ATMO` (quand `dword_72A0A≠0`) | Non décodé — la table de densité alternative éventuelle n'est pas dans `AIRDENS.TBL` |
| `JDYN +0x80..+0x8B` (6 champs, défauts 500/100/231/11005/3/2) | **RÉSOLU (session 2026-09-06), sauf `+0x8A`.** Params de l'IA de vol/combat, lus via `[pilotCtx+0x0B]` depuis seg002/seg003/ovr231, jamais par la physique du joueur. `+0x80`=vitesse IA max poursuite, `+0x82`=vitesse IA min, `+0x84`=vitesse croisière/manœuvre, `+0x86`=seuil de portée, `+0x8B`=poids d'un score de décision. `+0x8A` (déf. 3) : consommateur non localisé. Détail DATA_MODEL §6.2. |
| `jdyn[0x47]` (limite de taux) — unité exacte (°/s ? °/tick ?) | Pas confirmée numériquement |
| `Aero_ComputeControlFlags75Bit5C` (composante latérale du moment, table `jdyn[0x77]`) | Non détaillée |
| Dispatcher clavier de la manette des gaz (`+`/`-`, `1`…`0`) | Hors `Player_MainUpdate`, jamais localisé |
| `mach`/`sos`/`updateSpeedOfSound` | Aucune correspondance ASM trouvée dans le tick tracé |
| **Comment les vitesses angulaires physiques deviennent l'orientation VISIBLE** | **RÉSOLU, session 2026-09-05.** L'orientation n'est PAS un triplet d'angles d'Euler accumulés : c'est une **matrice persistante à `objet_monde+0x2C`**, tournée par petits incréments chaque frame. Fonction : `Matrix_BuildFullOrientation_575B2` (seg116) → `Matrix_BuildAxisX/Y/Z_56EC3` : chacun applique une rotation d'axe **incrémentale en place** sur les lignes de la matrice (`row1' = row1·sin + row2·cos`, `row2' = row2·sin − row1·cos`), no-op si `|angle| < 0.21875°`. Exposée en méthode vtable générique **`WorldObject_ComposeOrientation3Angles_3CAE3`** (`loc_3CAE3`, seg084) présente dans ~18 vtables d'objets du monde — l'objet monde qui **englobe** JDYN porte cette matrice. Les 3 angles passés = incréments = `vitesse_angulaire · dt`. `jdyn[+4/+8/+0xC]` sont donc bien les vitesses (état interne physique) ; le pont vers le visuel est ce compositeur matriciel, pas une lecture directe de `jdyn[+4]` comme angle. **Implémenté dans `SCJetpPlane::updatePosition()` le 2026-09-05** : `ptw` persistante, `ptw.rotateM(dPitch,X); .rotateM(dYaw,Y); .rotateM(dRoll,Z)` chaque tic ; `pitch/yaw/roll` re-dérivés de `ptw`. Reste non pin-pointé statiquement : le site d'appel per-frame exact (adressage seg339 ambigu, copies de vtables VROOMM) — mais le mécanisme est décodé sans ambiguïté. |
| `Matrix_RollAngle_57C67` / `Matrix_NosePitchAngle_57C3A` / `Math_DotProduct3D_5505B` / `Math_AcosOfRatio_54A0E` / `Math_VectorLength3D_Scaled_54F57` — terme géométrique (`var_30`) de `Aero_ComputeControlFlags75Bit5B` | **Tranchée, session 2026-09-05** — `var_30 = sin(angle(vecteur avant, axe Z monde))`, signe inversé si `up.z<0` (avion sur le dos) ; ≈`cos(pitch)` près du vol horizontal (identité `sin(90-x)=cos(x)`). PAS une compensation de virage/roulis. Citation exacte : `known_functions.json["sub_48862"]`, `DATA_MODEL.md` §PhysicsTicks. |
| `checkStatus()` de `SCJetpPlane` (portage, pas décodage ASM direct) : zone morte entre `groundlevel+0.5` et `groundlevel+1.0` où `on_ground` ne change jamais de valeur — observée en jeu (l'avion spawn avec ~0.9 m de marge, tombe dans cette zone) | **Constatée, pas corrigée** — reste un défaut réel de `checkStatus()`/`updateVelocity()` à traiter séparément |
| **Couplage roulis→lacet / mélange tangage-lacet à fort roulis** observé empiriquement en jeu | **Émerge naturellement du modèle, session 2026-09-05.** Deux sources, aucune n'est une « fonction de couplage » dédiée : (1) la **composition matricielle incrémentale** (ligne ci-dessus) : tourner en roulis puis appliquer un incrément de tangage produit, dans le monde, une rotation qui mélange cap et assiette — c'est le comportement gimbal correct d'une matrice tournée par petits pas en repère avion ; (2) la **portance** (alignée sur le "haut" corps) devient horizontale en repère monde à fort roulis → tirer le manche courbe la trajectoire latéralement. Les servos tangage/lacet/roulis eux-mêmes restent **découplés** (lois directes manche, `Aero_ResetAccumulatorFlags75Bit5` confirme : lacet = palonnier seul, pas de `beta`). ⚠️ Le servo de lacet du port était asservi sur `beta_deg` (= `−Cα·vx/V`) → l'avion tournait sur lui-même en continu : **corrigé le 2026-09-05**, lacet repassé en loi directe palonnier comme le roulis. |

---

*Document généré à partir de la session de décodage du modèle de vol
(seg101-103, seg447-449) — voir `DATA_MODEL.md` §6.2 pour chaque citation
de ligne assembleur exacte, et `known_functions.json` pour les résumés de
fonction individuels.*
