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

> **Mise à jour 2026-09-25 (relecture de l'assembleur, noms trigonométriques corrigés).**
> Ce qui change par rapport aux versions précédentes :
> - **Gains de dégâts** : `dword_72A14..72A2C` ne valent pas toujours 1,0. Ils sont recalculés à
>   chaque tick par `JDYN_UpdateDamageGains_494DD` à partir de l'état des composants
>   (moteur, gouvernes, ailes, réservoir). Ils modifient la poussée, le cran de manette maximum,
>   la consommation, la portance et les bornes des trois commandes (§5.9).
> - **Loi de charge** (`Aero_ComputeAoACommand_48862`, ex-`Aero_ComputeControlFlags75Bit5B`) :
>   relue en entier. Le terme de gravité est **exactement** cos(tangage). La référence de départ
>   vaut 0 au sol, en décrochage franc ou sans le bit 4 des drapeaux, et α·|cos(roulis)| quand α < 0
>   (§5.7).
> - **Ordre du tick** : la position n'est pas intégrée par `PhysicsTicks` mais par la méthode
>   `+0x14` de l'objet monde (`WorldObject_IntegrateBodyMotion_3D31D`). `Physics_IntegratePosition_46300`
>   intègre la **vitesse** (§3).
> - **Mode pilote automatique** : quand `JDYN+0x68 ≠ 0xFF`, `PhysicsTicks` saute toute l'aérodynamique
>   et appelle `Autopilot_FlyToPointKinematic_49C2E`, qui impose directement cap et vitesse (§9).
>   L'IA l'utilise en phases 2 et 3 de l'attaque au sol.
> - **Direction au sol** : au sol et sous 40 m/s, la vitesse de lacet est imposée par le manche
>   latéral (§5.8).
> - **Pas de temps** : `dt = 1 / fps de simulation`, borné à [0,04 s ; 0,5 s] ; le gain K du servo
>   vaut `1/dt` (25 à 25 images/s), ce n'est pas une constante (§2).
>
> Le document de travail pour corriger `SCJetpPlane` dans libRealSpace est
> `analysis/IMPL_SCJETPPLANE_CORRECTIONS.md`.

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

Règle de conversion : un **dword** utilisé tel quel dans un calcul en virgule fixe est en 24.8
→ **÷ 256**. Un **octet ou mot** que le code convertit par `<< 8` est un **entier tel quel**
(degrés, g…). Exception : les octets de `THRS` utilisés comme fractions (voir tableau).

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
| `JDYN #15` (u8, `+0x2C`→`+0x57`) | `envelope_pitch_limit` → **`pitch_rate_limit_dps`** | °/s ? | `raw` — champ réel, mais **aucun lecteur trouvé dans le tick physique** : le servo de tangage borne par `max_turn_rate` (#8) comme les deux autres axes (§5.7). Ne pas l'utiliser tant qu'un lecteur ASM n'est pas trouvé (§8) |
| `JDYN #16` (u8, `+0x2D`→`+0x58`) | `envelope_pitch_margin` | ° (à confirmer) | `raw` |
| `JDYN #17` (u32, `+0x2E`→`+0x59`) | **`control_speed`** (ex-`ground_effect_ceiling`, corrigé 2026-09-25) : **vitesse** d'efficacité des gouvernes — sous elle, taux de roulis max × `v/control_speed` (`Aero_MaxRollRate_4AF35`) et, au sol, nez plaqué (moment de tangage −20, `Aero_ApplyGroundEffect`, comparé à la vitesse air sur l'axe du nez). F-16 : **50** | m/s | `raw / 256.0` |
| `JDYN #18` (u32, `+0x32`→`+0x5D`) | `induced_drag_k` | — (= `1/(π·e·AR)`) | `raw / 256.0` |
| `JDYN #19` (u32, `+0x36`→`+0x61`) | `lift_gain` | — (rôle de `Clα·S`, sans unité S/b séparées) | `raw / 256.0` |
| `JDYN #20` (u8, `+0x3A`→`+0x65`) | `pitch_stick_gain` : **borne de la consigne d'incidence** | ° | `raw` (entier : le code fait `si[0x65] << 8`) ; multipliée par le gain de dégâts ELEVATOR (§5.7) |
| `JDYN #21` (u8, `+0x3B`→`+0x66`) | `yaw_authority` : **consigne de dérapage à pleine butée palonnier** | ° | `raw` (entier, `<< 8`) ; multipliée par le gain RUDDER (§5.8) |
| `JDYN #22` (u8, `+0x3C`→`+0x67`) | `pitch_load_gain` : **facteur de charge demandé à pleine butée manche** | g | `raw` (entier, `<< 8`, recopié en `+0x78`) |
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
- **Gains de dégâts `dword_72A14..72A2C`** — ⚠️ **corrigé 2026-09-25** : ils ne sont PAS
  toujours à 1,0 et ne sont pas ignorables. `JDYN_UpdateDamageGains_494DD` les remet à 1,0 puis
  les recalcule **à chaque tick** d'après l'état des composants de l'avion. Voir §5.9.
- **Pas de temps** (`Frame_UpdateTimingAndNotifyTrackedObjects_500F6`) : le jeu mesure ses images
  par seconde et **attend activement tant qu'il dépasse 25 images/s**. La fréquence de simulation
  `dword_70454` = fps / `dword_70468`, bornée à **[2 ; 25]** ; `dt = dword_70458 = 1 / dword_70454`,
  donc **entre 0,04 s et 0,5 s**. `dword_7045E`, le pas utilisé pour intégrer la position (§3), est
  toujours égal à `dword_70458`. Le « gain K = 25 » du servo (§5.7) est en réalité
  `dword_70454` = `1/dt` : il vaut 25 seulement à 25 images/s.
- **Pas de trim pilote.** Le jeu est en accès direct sur les axes
  (clavier/joystick) : `elevator`/`rollers`/`rudder` de `SCPlane`
  correspondent directement à la commande brute, rate-limitée par
  `rate_limit` (`jdyn[0x47]`), sans intégrateur de trim séparé.

---

## 3. Séquence du tick (ordre exact, `PhysicsTicks`) — réécrit 2026-09-25

`PhysicsTicks` (seg103, méthode Update de la classe JDYN) fait, dans cet ordre
(citations : `analysis/annotated_segments/seg103_annotated.asm`, bloc `PhysicsTicks:`) :

```
 0. JDYN_UpdateDamageGains_494DD            (mov bx,[si+2] / call dword ptr [bx+34h], 1re instruction utile)
                                            → les 7 gains de dégâts du tick (§5.9)
 1. (bloc non relu en détail cette session ; il remet notamment à 0 le drapeau « au sol » objet+0x20)
 2. Carburant nul ?  cmp dword ptr [si+6Dh],0 / jg   → sinon carburant = 0, poussée [si+28h] = 0, fin du bloc moteur
 3. Manette :  cran ← min(cran, arrondi(10 · gain_moteur))   RÉÉCRIT dans le bloc de commandes (+0x1E)
               poussée [si+28h] = Aero_ThrottleThrustCurve_4730F(cran) · gain_moteur
               carburant [si+6Dh] -= consommation (§4.4)
 4. PILOTE AUTOMATIQUE ?  cmp byte ptr [si+68h],0FFh / jz  et  flags_75.bit5 = 0
      → call Autopilot_FlyToPointKinematic_49C2E ; jmp loc_4AECA (= fin de PhysicsTicks)   (§9)
      Les étapes 5 à 9 sont alors TOUTES sautées.
 5. Aero_SumLinearForces_48639              → accélération linéaire (repère corps), écrite en objet+0x14/18/1C
 6. Aero_ControlOrchestrator_48FC2          → consignes et accélérations angulaires (§5.7, §5.8)
 7. Physics_IntegrateSecondaryPosition      → vitesse angulaire Ω (JDYN+4/+8/+0x0C) += accél. angulaire · dt
 8. Au sol ET vitesse < 40 m/s : Ω_lacet (JDYN+0x0C) imposée par le manche latéral (§5.8)
 9. Physics_IntegratePosition_46300(objet, objet+0x14)
                                            → VITESSE += corps→monde(accélération) · dt   (pas la position !)
10. (suite : contrainte au sol, non relue en détail cette session — voir DATA_MODEL.md §6.2)
```

**La position et l'orientation ne sont pas intégrées par `PhysicsTicks`.** C'est la méthode
`+0x14` de l'objet monde de l'avion (`loc_3E115` → `WorldObject_IntegrateBodyMotion_3D31D`), appelée
par la boucle des objets du monde, qui fait **dans les deux modes (normal et pilote automatique)** :

```
position    += vitesse · dt        (WorldObject_TranslateBy_37D54, pas dword_7045E = dt)
orientation += Ω · dt              (WorldObject_ComposeOrientationAngleArray_3CB0B → rotations incrémentales
                                    de la matrice persistante de l'objet, §8)
```

Correspondance avec les méthodes de `SCPlane` : `computeThrust` (étape 3), `computeLift/Drag/Gravity`
+ `updateForces` (étape 5), `processInput` pour les servos (étapes 6-8), `updateVelocity`
(étape 9), `updatePosition` (position + orientation). Le moment exact où la boucle des objets
appelle la méthode `+0x14` par rapport à `PhysicsTicks` n'a pas été épinglé : l'ancienne
affirmation « intègre-puis-calcule » n'est pas prouvée. Dans le portage, l'ordre
`updatePosition` puis forces (ou l'inverse) ne décale que d'un tick.

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
    if (fuel <= 0.0f) { fuel = 0.0f; thrust_force = 0.0f; return; }   // cmp [si+6Dh],0 / jg : ni poussée ni conso

    // Cran plafonné par le moteur endommagé (seg103, bloc manette de PhysicsTicks) :
    //   mov eax,dword_72A2C / imul eax,0Ah / add 80h / sar 8   → plafond = arrondi(10 · g_engine)
    //   cmp al,plafond / jle … / mov es:[bx+1Eh],al            → le cran plafonné est RÉÉCRIT dans la commande
    int cap = (int)std::lround(10.0f * g_engine);
    if (throttle_notch > cap) throttle_notch = cap;            // visible sur l'instrument de manette

    thrust_force = thrust_max * fThrottle(throttle_notch) * fLapse(altitude)   // Aero_ThrottleThrustCurve_4730F
                 * g_engine;                                   // mov edx,dword_72A2C / imul / shrd 8 sur [si+28h]
    thrust_vector = forward * thrust_force;                   // axe corps nez, PUR (pas de composante latérale/verticale)
}
```
Moteur intact : `g_engine = 1`, plafond 10, rien ne change. Moteur détruit : `g_engine = 0`,
cran forcé à 0, poussée nulle.

### 4.4 Consommation de carburant (bloc manette de `PhysicsTicks`, lu 2026-09-25)

```cpp
// facteur de cran : cran · 0,199 si cran ≤ 5 (mov dword ptr [bp-4Ch],33h), cran · 0,297 sinon ([bp-56h],4Ch)
float f = (notch <= 5) ? notch * (51.0f / 256.0f) : notch * (76.0f / 256.0f);
// fuite du réservoir : (10 − 9·g_fuel)   (mov [bp-5Ah],0FFFFF700h / imul dword_72A14 / add 0A00h)
float burn = (10.0f - 9.0f * g_fuel) * sfc;                // × jdyn[0x33]
if (f > 0.0f) burn *= f;                                   // cmp dword ptr [bp-42h],0 / jle : SAUTÉ si cran 0
fuel -= burn * dt;                                         // imul dword_70458 ; sub [si+6Dh]
```
Deux points à reproduire tels quels :
- **Au cran 0, la multiplication par le facteur de cran est sautée** : la consommation vaut
  alors `sfc · dt` (comme au cran 5), pas zéro.
- Réservoir intact (`g_fuel = 1`) : facteur 1. Réservoir détruit (`g_fuel = 0`) : ×10.

Le saut instantané vers un point (`JDYN_JumpToPoint_49242`, §9.3) consomme le carburant du trajet
avec le même facteur `(10 − 9·g_fuel)·sfc`, multiplié par la durée du trajet.

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

    float k_lift = lift_gain * g_wing * q;                      // jdyn[0x61] · dword_72A24 · q (loc_48239 : mov edx,dword_72A24 / imul)
                                                                // g_wing = gain de dégâts LWING+RWING (§5.9), 1 si ailes intactes
    lift_force   = hard_stall ? 0.0f : k_lift * ae;             // (B) §5.2 : portance nulle en départ franc
    Vector3D dirLift = normalize(Vector3D{0, v_body.nose /*c1*/, -v_body.z_up /*c2*/}); // ⟂ vitesse, plan vertical
    lift_vector  = dirLift * lift_force;

    float k_side = (lift_gain * 0.25f) * q;                     // jdyn[0x61]>>2 (mov eax,[si+61h] / sar eax,2) — SANS gain d'aile
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

### 5.7 Tangage : loi de charge + servo (`Aero_ComputeAoACommand_48862` + `Aero_ComputeForcesMain_4791E`) — réécrit 2026-09-25

> **Historique.** Les versions précédentes de cette section décrivaient un servo « non câblé »
> dans le portage et un terme géométrique « ≈ cos(tangage) par identité ». Les deux sont périmés :
> - le portage (`SCJetpPlane::processInput`) câble maintenant ce servo sur `pitch_speed`, et
>   l'orientation visible vient de la matrice persistante tournée par `Ω·dt` (§3, §8) ;
> - `Aero_ComputeAoACommand_48862` a été relue en entier le 2026-09-24 avec les vrais noms
>   sinus/cosinus : le terme vaut **exactement** cos(tangage du nez).

Le tangage est piloté en **incidence** : la loi de charge calcule une **consigne d'incidence**
(`si[0x16]`), et le servo fait tourner le nez pour que α la rejoigne.

**A. Consigne d'incidence — `Aero_ComputeAoACommand_48862`** (seg103, lue ligne à ligne ;
valeurs réelles, degrés et g) :

```cpp
float AoACommand() {
    float q = dynamic_pressure;                                   // Aero_DynamicPressure_46D13
    if (autopilot_bit5 || q < 1.0f) return 0.0f;                  // flags_75.bit5 ou q < 1 → si[0x16] = 0

    // (1) demande du manche : m ∈ [−1, +1], positif = manche tiré
    //     ASM : d = (si[0x67] << 8) · [ctrl+0x1F] / 16 ; ÷3 si [ctrl+0x1F] < 0 (manche poussé)
    float d = pitch_load_gain * m;                                // jdyn[0x67], en g
    if (m < 0) d /= 3.0f;

    // (2) référence de départ A (var_1A) — mov [bp+var_1A],0 puis 3 tests :
    float A = 0.0f;
    if (flags_75_bit4                                             // shr ax,4 / and 1 / jnz loc_48967
        && !on_ground                                             // mov al,[bx+20h] / or / jnz → reste 0
        && !hard_stall_bit6) {                                    // shr ax,6 / and 1 / jnz → reste 0
        A = alpha;                                                // Aero_FlowAngle_AoA_469FE (signé)
        if (A < 0) A *= fabsf(cosf(roll));                        // Matrix_RollAngle_57C67 → Math_CosDeg_5483F → |·|
    }

    // (3) calage : c = −calage_aile (− incrément volets si volets sortis, flags_75.bit1)
    float c = -wing_incidence - (flaps ? flap_lift_increment : 0.0f);   // jdyn[0x4C], jdyn[0x4D]

    // (4) terme de gravité : cosinus EXACT du tangage du nez, négatif sur le dos
    float g1 = cosf(nose_pitch);                                  // Matrix_NosePitchAngle_57C3A → Math_CosDeg_5483F
    if (up_vertical < 0) g1 = -g1;                                // M+0x20 < 0 : composante verticale de la normale

    // (5) incidence par g :  k = −(X / q / lift_gain) · 1,5 · g     (0x180 = 1,5 ; dword_6FFD7 = −9,8)
    //     X = [si+2]->vtable+0x3C : a la forme d'une masse (NON PROUVÉ, §8). Avec g = −9,8 le signe final est +.
    float k = (mass / q / lift_gain) * 1.5f * 9.8f;

    // (6) cibles
    float n = d + g1;                                             // facteur de charge demandé (cos θ au neutre)
    float T = c, B = c;
    if (n != 0.0f) { T = n * k + c; B = g1 * k + c; }

    // (7) sélection : on garde A s'il est entre T et B (bornes incluses), sinon A = T
    if (!(A >= std::min(T, B) && A <= std::max(T, B))) A = T;

    // (8) borne, avec le gain de dégâts ELEVATOR
    float L = pitch_stick_gain * g_elevator;                      // (si[0x65] << 8) · dword_72A1C
    return std::clamp(A, -L, L);                                  // → si[0x16]
}
```
Remarques :
- `|α|` est calculé (`var_A`) mais **jamais relu** ; `si[0x59]` n'est pas lu.
- Au neutre en vol (d = 0) : T = B = cos θ · k + c, soit l'incidence qui porte `cos θ` g. Si l'avion
  vole déjà à cette incidence, `A = α` est gardé → erreur nulle → le manche neutre est stable.
- **Au sol, en décrochage franc, ou sans le bit 4 : A = 0** (et non α). Le bit 4 est posé par défaut
  à la création (`flags_75 = bit4|bit7`).

**B. Servo — `Aero_ComputeForcesMain_4791E`** (seg102) :

```cpp
float q2  = q * stability_gain / 100.0f;                          // q' = q · STBL / 100
float err = AoACommand() - alpha;
if (fabsf(err) < 0.21875f) err = 0.0f;                            // seuil brut 56 face à une erreur 24.8 → 56/256 °
float K   = 1.0f / dt;                                            // dword_70454 (= 25 à 25 images/s)
float target = copysign(std::min(2.0f * sqrtf(q2 * fabsf(err)), K * fabsf(err)), err);
float accel  = std::clamp((target - pitch_speed) * K, -3.0f * q2, 3.0f * q2);   // °/s²
pitch_speed += accel * dt;                                        // Physics_IntegrateSecondaryPosition (× dword_70458)
pitch_speed  = std::clamp(pitch_speed, -max_turn_rate, max_turn_rate);          // jdyn[0x71]
```
Comme `K = 1/dt`, `(target − ω)·K·dt = target − ω` : sans la borne `±3q'`, la cible serait
atteinte en un tick. Forme équivalente, indépendante du pas de temps :
`pitch_speed += clamp(target − pitch_speed, ±3·q'·dt)`. Dans `min(2√(q'·|err|), K·|err|)`, K vaut
25 dans le jeu d'origine dès qu'il tourne à 25 images/s (son maximum) : garder **25** dans le
portage, même s'il tourne plus vite, reproduit le jeu à sa cadence nominale.

### 5.8 Roulis et lacet — gains de dégâts et direction au sol (lu 2026-09-25)

- **Roulis** (`Aero_ComputeControlFlags75Bit5C`, partiellement relue) : la consigne de vitesse de
  roulis est bornée à `± max_turn_rate · g_aileron` (`mov edx,dword_72A20 / imul` sur `[si+71h]`),
  puis `(consigne − ω_roulis)·K` est comparée à `rate_limit` (`[si+47h]`, accélération de roulis
  maximale, °/s²). Aileron détruit → plus de roulis.
  **Précisé le 2026-09-25** : la consigne ajoutée est `(manche/16) × Aero_MaxRollRate_4AF35`
  (`idiv 10h` puis `call Aero_MaxRollRate_4AF35 / imul`), et ce taux max n'est pas `[si+71h]`
  brut : il est divisé par `(angle − (α_décrochage − 5) + 1)` quand `√(α² + β²)` dépasse
  `α_décrochage − 5°`, multiplié par `v / control_speed` sous `control_speed` (JDYN #17), et par
  0,6 à l'état 2 des bits 7-8 de `flags_75`. F-16 (`F-16DES.IFF`) : `[si+71h]` = 270 °/s,
  `[si+47h]` = 540 °/s², `control_speed` = 50 m/s, décrochage 30° → réduction au-delà de 25°.
- **Lacet** (`Aero_ResetAccumulatorFlags75Bit5`) : consigne de dérapage =
  `yaw_authority · g_rudder · palonnier` (`si[0x66] << 8`, `imul dword_72A18`, × `[ctrl+0x27]/16`),
  puis même servo qu'en tangage avec `err = consigne − β`.
- **Direction au sol** (`PhysicsTicks`, juste après `Physics_IntegrateSecondaryPosition`) :
  ```
  cmp byte ptr [bx+20h],0 / jnz          → seulement au sol
  cmp vitesse,2800h / jge                → seulement si vitesse < 40 m/s
  Ω_lacet [si+0Ch] = −( [ctrl+0x23] / 16 · vitesse ) / 4
  ```
  soit **`yaw_speed = −manche_latéral · V / 4`** (°/s, V en m/s, manche ∈ [−1, 1]) : au roulage, c'est
  le **manche latéral** (et non le palonnier) qui oriente la roue avant. Cette valeur remplace celle
  du servo de lacet pour ce tick. Au-dessus de 40 m/s au sol, rien n'est imposé : le servo de lacet
  s'applique.

### 5.9 Gains de dégâts — `JDYN_UpdateDamageGains_494DD` (lu 2026-09-25)

Méthode `+0x34` de la vtable secondaire de JDYN, appelée **en tête de chaque `PhysicsTicks`**
(et par `JDYN_IsEngineDestroyed_47FCD`). Elle remet les 7 gains à 1,0, puis, pour chaque
composant présent dans la liste de composants de l'avion :

`gain = (B − A) / B`, avec `B` = somme de l'attribut B du composant (`Roster_SumFoundAttributeB`) et
`A` = somme de l'attribut A (`Roster_SumFoundAttributeA`). Le gain vaut 1 pour un composant intact
et descend vers 0 avec les dégâts. (Côté libRealSpace, ces attributs correspondent à ce que
`SCPlane::system_health` stocke par composant : à vérifier côté données.)

| Gain | Composant | Consommateur (ligne citée) | Effet |
|---|---|---|---|
| `g_fuel` (`dword_72A14`) | `FUEL` | bloc manette de `PhysicsTicks` ; `JDYN_JumpToPoint_49242` | consommation × `(10 − 9·g_fuel)` (§4.4) |
| `g_rudder` (`dword_72A18`) | `RUDDER` | `Aero_ResetAccumulatorFlags75Bit5` (`mov edx,dword_72A18`) | consigne de lacet × g (§5.8) |
| `g_elevator` (`dword_72A1C`) | `ELEVATOR` | `Aero_ComputeAoACommand_48862` (`mov edx,dword_72A1C`) | borne de la consigne d'incidence × g (§5.7) |
| `g_aileron` (`dword_72A20`) | `AILERON` | `Aero_ComputeControlFlags75Bit5C` (`mov edx,dword_72A20`) | vitesse de roulis max × g (§5.8) |
| `g_wing` (`dword_72A24`) | `LWING` + `RWING` | `Aero_ComputeLiftAndSideForce_4812B` (`loc_48239`) | portance × g (§5.3) — pas la force latérale |
| `dword_72A28` | copie de `dword_72A24` | aucun lecteur trouvé | — |
| `g_engine` (`dword_72A2C`) | `ENGINE` | bloc manette de `PhysicsTicks` ; `JDYN_IsEngineDestroyed_47FCD` | cran max = arrondi(10·g), poussée × g (§4.3) |

Aucun autre lecteur de ces variables n'existe dans les segments annotés (recherche
`grep dword_72A1[48C]\|dword_72A2[048C]` sur `annotated_segments/*.asm`).

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
| `Aero_ComputeControlFlags75Bit5C` (roulis, table `jdyn[0x77]`) | Partiellement lue (2026-09-25) : borne `± jdyn[0x71]·g_aileron`, limite d'accélération `jdyn[0x47]` (§5.8). Le reste (table `jdyn[0x77]`, gate à 40 m/s) n'est pas relu ligne à ligne. |
| Valeur `X` de la loi de charge (`[si+2]->vtable+0x3C`) | A la forme d'une masse (la portance vaut `lift_gain·α·q`), **non prouvé** — même question que la première ligne de ce tableau. |
| Attributs A et B des composants (gains de dégâts, §5.9) | Formule `(B − A)/B` lue ; la sémantique exacte (points de vie max / dégâts ?) et le lien avec `system_health` côté libRealSpace sont à confirmer côté données. |
| Instant d'appel de la méthode `+0x14` (position/orientation) par rapport à `PhysicsTicks` | Non épinglé (§3). |
| Dispatcher clavier de la manette des gaz (`+`/`-`, `1`…`0`) | Hors `Player_MainUpdate`, jamais localisé |
| `mach`/`sos`/`updateSpeedOfSound` | Aucune correspondance ASM trouvée dans le tick tracé |
| **Comment les vitesses angulaires physiques deviennent l'orientation VISIBLE** | **RÉSOLU, session 2026-09-05.** L'orientation n'est PAS un triplet d'angles d'Euler accumulés : c'est une **matrice persistante à `objet_monde+0x2C`**, tournée par petits incréments chaque frame. Fonction : `Matrix_BuildFullOrientation_575B2` (seg116) → `Matrix_BuildAxisX/Y/Z_56EC3` : chacun applique une rotation d'axe **incrémentale en place** sur les lignes de la matrice, no-op si `|angle| < 0.21875°`. ⚠️ Corrigé 2026-09-24 : c'est une **rotation standard** (pour l'axe Y relu, `Matrix_BuildAxisY_570C5` : ligne 1 inchangée, `ligne0' = c·ligne0 − s·ligne2`, `ligne2' = c·ligne2 + s·ligne0` avec c = cos, s = sin) ; l'ancienne forme « `row1·sin + row2·cos` » venait des noms sinus/cosinus inversés. Exposée en méthode vtable générique **`WorldObject_ComposeOrientation3Angles_3CAE3`** (`loc_3CAE3`, seg084) présente dans ~18 vtables d'objets du monde — l'objet monde qui **englobe** JDYN porte cette matrice. Les 3 angles passés = incréments = `vitesse_angulaire · dt`. `jdyn[+4/+8/+0xC]` sont donc bien les vitesses (état interne physique) ; le pont vers le visuel est ce compositeur matriciel, pas une lecture directe de `jdyn[+4]` comme angle. **Implémenté dans `SCJetpPlane::updatePosition()` le 2026-09-05** : `ptw` persistante, `ptw.rotateM(dPitch,X); .rotateM(dYaw,Y); .rotateM(dRoll,Z)` chaque tic ; `pitch/yaw/roll` re-dérivés de `ptw`. **Site d'appel épinglé le 2026-09-25** : méthode `+0x14` de l'objet monde de l'avion (`loc_3E115` → `WorldObject_IntegrateBodyMotion_3D31D` → `WorldObject_ComposeOrientationAngleArray_3CB0B`), qui fait aussi `position += vitesse·dt` (§3). |
| Terme de gravité (`var_30`) de `Aero_ComputeAoACommand_48862` | **Tranché, 2026-09-24** — `var_30 = cos(tangage du nez)` **exactement** (`Matrix_NosePitchAngle_57C3A` puis `Math_CosDeg_5483F`, vrai cosinus), signe inversé sur le dos. L'ancienne rédaction (« sin(angle avec Z) ≈ cos par identité ») était juste par deux erreurs qui s'annulaient. Détail §5.7. |
| `checkStatus()` de `SCJetpPlane` (portage, pas décodage ASM direct) : zone morte entre `groundlevel+0.5` et `groundlevel+1.0` où `on_ground` ne change jamais de valeur — observée en jeu (l'avion spawn avec ~0.9 m de marge, tombe dans cette zone) | **Constatée, pas corrigée** — reste un défaut réel de `checkStatus()`/`updateVelocity()` à traiter séparément |
| **Couplage roulis→lacet / mélange tangage-lacet à fort roulis** observé empiriquement en jeu | **Émerge naturellement du modèle, session 2026-09-05.** Deux sources, aucune n'est une « fonction de couplage » dédiée : (1) la **composition matricielle incrémentale** (ligne ci-dessus) : tourner en roulis puis appliquer un incrément de tangage produit, dans le monde, une rotation qui mélange cap et assiette — c'est le comportement gimbal correct d'une matrice tournée par petits pas en repère avion ; (2) la **portance** (alignée sur le "haut" corps) devient horizontale en repère monde à fort roulis → tirer le manche courbe la trajectoire latéralement. Les servos tangage/lacet/roulis eux-mêmes restent **découplés** (lois directes manche, `Aero_ResetAccumulatorFlags75Bit5` confirme : lacet = palonnier seul, pas de `beta`). ⚠️ Le servo de lacet du port était asservi sur `beta_deg` (= `−Cα·vx/V`) → l'avion tournait sur lui-même en continu : **corrigé le 2026-09-05**, lacet repassé en loi directe palonnier comme le roulis. |

---

## 9. Mode pilote automatique (`JDYN+0x68`) et saut vers un point — ajouté 2026-09-25

### 9.1 Bascule

Dans `PhysicsTicks`, juste après le bloc moteur :
```
cmp byte ptr [si+68h],0FFh / jz loc_4AC96          ; 0xFF = pas de pilote automatique → vol normal
test flags_75.bit5 / jnz loc_4AC96                  ; bit5 posé → vol normal
call Autopilot_FlyToPointKinematic_49C2E ; jmp loc_4AECA   ; → fin du tick
```
En mode pilote automatique, **aucune force et aucun moment** ne sont calculés : ni portance, ni
traînée, ni servo, ni intégration de la vitesse. Le moteur (poussée, carburant, gains) tourne
quand même (étapes 0-3 du §3). La position et l'orientation continuent d'être intégrées par la
méthode `+0x14` de l'objet monde.

`JDYN+0x68` sert à la fois d'interrupteur (0xFF = inactif) et de mémoire du cercle de virage
choisi (0 = à choisir, 1 = cercle C2, 2 = cercle C1).

### 9.2 Loi (`Autopilot_FlyToPointKinematic_49C2E`)

Relue intégralement ; description complète en valeurs réelles, avec pseudo-code libRealSpace, dans
`analysis/NOTE_ATTAQUE_SOL.md` §5. Résumé :
- entrées dans le bloc de commandes : `P = ctrl+0x02` (point visé), `W = ctrl+0x0E` (vitesse voulue) ;
- cap : virage à **20°/s** maximum, par cercles de rayon `R = |W|·180/(20π)` tangents à `P` ;
  roulis visuel ±10° (`Autopilot_BankForTurn_49A7C`) ;
- altitude : `vz = clamp(dz, ±50 m/s)`, plancher **terrain + 250 m** ;
- vitesse horizontale : rejoint `|W|` à **25 m/s²** ; **la vitesse est écrite directement** ;
- nez : ramené vers l'horizontale à 5°/s (`Autopilot_NosePitchRelax_498B5`) ;
- **vitesse angulaire Ω remise à zéro à chaque tick** (vecteur nul constant `dword_707F8..70800`) :
  la rotation vient uniquement de ce que la fonction écrit dans l'orientation ;
- drapeau « point atteint » `ctrl+0x1A = 1` quand l'écart de cap est < 5° et la distance < `20·|W|·max(dt, 0,2 s)`.

Utilisateur connu : l'IA en attaque au sol, phases 2 et 3 (`GroundAttack_Phase2_EngageAutopilot_775B1`).

### 9.3 Saut instantané vers un point (`JDYN_JumpToPoint_49242`, ex-`Pilot_SteeringCommandToTarget`)

Fonction distincte du mode ci-dessus (appelée par `FlightState_ResetHud` et
`Pilot_LowLevelControlCommand`) : elle **téléporte** l'avion.
- orientation reconstruite **à plat** sur le cap demandé ; vitesse = vitesse demandée le long du nez ;
- carburant consommé pour le trajet : `durée = distance / vitesse`, `burn = durée · (10 − 9·g_fuel) · sfc`,
  borné à 0 ;
- position = point visé ; vitesse angulaire = 0 ; volets rentrés si l'avion n'a pas de composant
  `FLAPS` ; aérofrein (`flags_75.bit0`) rentré ; drapeau « au sol » effacé ;
  poussée recalculée au **cran 4**.

---

*Document généré à partir de la session de décodage du modèle de vol
(seg101-103, seg447-449) — voir `DATA_MODEL.md` §6.2 pour chaque citation
de ligne assembleur exacte, et `known_functions.json` pour les résumés de
fonction individuels.*
