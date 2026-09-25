# Corrections à apporter à `SCJetpPlane` (libRealSpace) — document de travail

*Rédigé le 2026-09-25 à partir de la relecture de l'assembleur de STRIKE.EXE. Destiné à une
session Claude Code qui travaille **dans le dépôt libRealSpace** et n'a pas forcément accès à
l'archive de rétro-ingénierie : tout ce qu'il faut pour coder est ici. Les citations
d'assembleur servent à la traçabilité ; la référence complète est
`strike_commander_re/analysis/PHYSICS.md` (§ indiqués entre crochets).*

## 0. À lire avant de coder

- **Fichiers concernés** : `src/strike_commander/SCJetpPlane.h`, `SCJetpPlane.cpp`, `SCPlane.h`
  (membre `system_health`), `SCMissionActors.cpp` (dégâts, §6) et, pour le pilote automatique,
  l'appelant IA (`SCAIBrain` / `SCPilot`).
- **Unités** : libRealSpace calcule en **flottants**, en valeurs réelles (m, m/s, degrés, g, kg,
  N, s). Aucune valeur de ce document n'est en virgule fixe.
- **Axes** : le jeu d'origine est Z-up (c0 = envergure/est, c1 = nez/nord, c2 = haut) ;
  libRealSpace est Y-up. Correspondance : `x = c0`, `y = c2` (altitude), `z = c1`. Le cap du jeu
  vaut `atan2(c0, c1)`, soit `atan2(x, z)` en libRealSpace.
- **Ne rien casser qui marche.** Rémi a validé en jeu : le sens des axes du manche, le servo de
  tangage actuel (vol stable manche au neutre), la composition incrémentale de `ptw`. Chaque
  correction ci-dessous est **locale** ; ne pas réécrire `processInput` en entier.
- Les `printf` de diagnostic de `processInput` et `loadFromEntity` s'exécutent à chaque tick ou
  chargement ; les laisser tels quels sauf demande de Rémi.

Ordre conseillé : P1 (§1, §2), puis P2 (§3 à §6), puis P3 (§7, §8). Une correction = un commit.

---

## 1. [P1] Mode pilote automatique — absent du portage [PHYSICS §9, NOTE_ATTAQUE_SOL §5]

**Pourquoi.** Dans l'original, l'IA en attaque au sol (phases 2 et 3) confie l'avion à un pilote
automatique **cinématique** qui impose directement cap et vitesse. Sans ce mode, l'IA du portage
n'arrive pas assez près de la cible pour larguer, puis tourne en rond entre les phases 0 et 1
(symptôme observé par Rémi).

**Comportement de l'original** (`PhysicsTicks`) :
```
cmp byte ptr [si+68h],0FFh / jz → vol normal        ; JDYN+0x68 = 0xFF : pilote automatique inactif
flags_75.bit5 posé → vol normal
call Autopilot_FlyToPointKinematic_49C2E ; jmp fin du tick
```
En mode pilote automatique : le moteur tourne (poussée, carburant, gains de dégâts), mais
**portance, traînée, somme des forces, servos et intégration de la vitesse sont sautés**. La
position et l'orientation restent intégrées normalement (`position += vitesse·dt`,
`orientation += Ω·dt`), et Ω est remise à zéro à chaque tick.

**API proposée** (dans `SCJetpPlane`) :
```cpp
public:
    void engageAutopilot(const Vector3D &target_point, const Vector3D &desired_velocity); // P et W
    void disengageAutopilot();
    bool autopilotActive() const { return ap_state != AP_OFF; }
    bool autopilotReached() const { return ap_reached; }      // équivalent du drapeau ctrl+0x1A
protected:
    enum { AP_OFF = -1, AP_CHOOSE = 0, AP_LEFT = 1, AP_RIGHT = 2 };
    int      ap_state{AP_OFF};                 // JDYN+0x68 : 0xFF=inactif, 0=à choisir, 1, 2
    Vector3D ap_P, ap_W;
    bool     ap_reached{false};
    float    ap_hspeed{0.0f};                  // vitesse horizontale courante
    void     simulateAutopilot(float dt);
```
`engageAutopilot` met `ap_state = AP_CHOOSE` et `ap_reached = false`. L'IA l'appelle en entrant en
phase 2 avec `P = cible + 1000 m d'altitude`, `W = normalise(P − position) × 100 m/s` ; elle le
coupe en sortant de la phase 3 (après largage ou quand `autopilotReached()` passe à vrai).

**Dans `Simulate()`** :
```cpp
if (autopilotActive()) {
    computeThrust();               // moteur + gains (§3) — la poussée n'est pas utilisée pour bouger
    burnFuel(dt);                  // §4
    simulateAutopilot(dt);         // écrit velocity, yaw/pitch/roll, met pitch/yaw/roll_speed à 0
    updatePosition();              // position += velocity·dt ; re-seed de ptw sur les angles écrits
    updatePlaneStatus();
    return;
}
```
`updatePosition()` détecte déjà une écriture externe de `pitch/yaw/roll` (`m_seed_*`) et
reconstruit `ptw` : c'est le bon mécanisme pour appliquer l'orientation imposée.

**Loi `simulateAutopilot(dt)`** (relue en entier, valeurs réelles). Constantes : virage 20°/s,
accélération 25 m/s², vitesse verticale max 50 m/s, plancher terrain + 250 m, `dtc = max(dt, 0,2 s)`.
Tout le calcul de cap se fait dans le plan horizontal (x, z), cap `h(v) = atan2(v.x, v.z)` en degrés.
```
|W|  = norme horizontale de W ;  ŵ = W horizontal normalisé
R    = |W| · 180 / (20 · π)                 // rayon de virage à 20°/s (≈ 286 m à 100 m/s)
r    = R − |W|·dt
perp = (ŵ.z, 0, −ŵ.x) · r                   // (c1, −c0) dans le jeu
C_D  = P + perp      C_G = P − perp         // centres « droit » (état 2) et « gauche » (état 1)
dG = |C_G − moi|, dD = |C_D − moi|           (distances horizontales)

si état == 0 (à choisir) :
    si (dG < dD et dG > r) ou (dD < r) : état = 1 (gauche)   sinon : état = 2 (droit)
C, d = centre et distance de l'état courant
e_nez = h(W) − h(nez)                                          // écart « sur le bord »
si d < R :                    écart = 0                        // dans le cercle : tout droit
sinon si d < R + |W|·dt :     écart = e_nez ;
                              si état 1 et écart > 0 : écart −= 360   // force le virage à gauche
                              si état 2 et écart < 0 : écart += 360   // force le virage à droite
sinon :                       cap_visé = h(C − moi) + asin(R/d)   (état 1)
                                       = h(C − moi) − asin(R/d)   (état 2)
                              écart = ramener_±180(ramener_±180(cap_visé) − h(nez))
écart = clamp(écart, ±20·dt)
yaw  += écart (tourne le nez horizontalement)
roulis visuel : cible ±10° du côté du virage si |écart_non_borné| > 10°, sinon 0°,
                atteinte à la vitesse max_turn_rate_dps (JDYN champ 8) · dt
tangage du nez : e = élévation(vitesse) − élévation(nez) ; si e == 0 : rien ;
                 f = min(1, 5·dt/|e|) ;  nez = normalise(nez + (nez_horizontal_normalisé − nez)·f)
                 (ramène le nez VERS L'HORIZONTALE, pas vers la vitesse ; Autopilot_NosePitchRelax_498B5)
altitude : plancher = terrain(x, z) + 250
           si P.y < plancher : P.y = plancher si y < plancher, sinon P.y = y
           dz = P.y − y ;  vy = dz si |dz| < 50, sinon ±50
vitesse horizontale : ap_hspeed rejoint |W| à 25 m/s² (égale |W| si l'écart est < 25·dt)
velocity = direction horizontale du nez · ap_hspeed + (0, vy, 0)      // ÉCRITE directement
pitch_speed = yaw_speed = roll_speed = 0
ap_reached = |ramener_±180(h(W) − h(nez))| < 5°  ET  |P − position| < 20·|W|·dtc   (≥ 400 m à 100 m/s)
```
Signe du cap : le cap du jeu croît de `c1` vers `c0` (de `+z` vers `+x` en libRealSpace).
Vérifier le sens de `yaw` dans libRealSpace (`forward = (0,0,−1)` tourné par `rotateM(yaw, Y)`)
et convertir : calculer `h(nez)` à partir de `forward` plutôt qu'à partir de `yaw` évite l'erreur.
La direction horizontale du nez utilisée pour `velocity` doit être celle **après** l'incrément de
cap du tick.

**Test d'acceptation.**
1. Avion à 3000 m, cible à 8 km devant, `W` vers la cible : l'avion va en ligne droite, `|vy| ≤ 50`,
   altitude jamais sous terrain + 250 m, `ap_reached` passe à vrai vers 400 m de `P`.
2. Même test avec `W` perpendiculaire à l'axe avion→cible : virage ≤ 20°/s, arrivée sur `P` avec
   le cap de `W`.
3. `pitch_speed`, `yaw_speed`, `roll_speed` restent à 0 pendant tout le mode ; à la sortie, le vol
   normal reprend sans saut de vitesse.
4. En attaque au sol : largage en phase 3 (la bombe part avant `ap_reached`).

---

## 2. [P1] Loi de charge : référence de départ A [PHYSICS §5.7]

**Où.** `SCJetpPlane::processInput()`, ligne `float pitchCommandDeg = this->alpha_deg;` et le
commentaire au-dessus (« AI_ComputeGeometrySolution_57C67 non décodé, approximé à 1 »).

**Original** (`Aero_ComputeAoACommand_48862`, ex-`Aero_ComputeControlFlags75Bit5B`) :
```
mov [bp+var_1A],0                            ; A = 0
flags_75.bit4 = 0          → A reste 0      ; bit 4 posé par défaut à la création
[objet+0x20] != 0 (au sol) → A reste 0
flags_75.bit6 (décrochage franc) → A reste 0
sinon A = α ; si α < 0 : A = α · |cos(roulis)|     ; Matrix_RollAngle_57C67 → Math_CosDeg_5483F → |·|
```
**Correction** :
```cpp
float pitchCommandDeg = 0.0f;
if (!this->on_ground && !this->wing_stall) {      // bit4 : toujours vrai dans le portage
    pitchCommandDeg = this->alpha_deg;
    if (pitchCommandDeg < 0.0f)
        pitchCommandDeg *= fabsf(cosf(tenthOfDegreeToRad(this->roll)));
}
```
(`wing_stall` est le drapeau de décrochage franc posé par `computeLift` ; voir §7 pour le décalage
d'un tick.) Vérifier que `this->roll` est bien l'angle de roulis en dixièmes de degré, comme
`this->pitch` dans `bankTerm`.

Le reste de la fonction est conforme à l'original et ne doit pas bouger : `d` (÷3 manche poussé),
`bankTerm = cos(tangage)` négatif sur le dos, `k = masse/q/lift_gain·1,5·g`, cibles T et B, règle
« on garde A s'il est entre T et B ».

**Test.** Au neutre en vol stabilisé : comportement inchangé. Au sol à l'arrêt : consigne = T
borné (inchangé en pratique, car T = B manche au neutre). En vol sur le dos, α < 0, roulis 180° :
|cos| = 1, inchangé ; à 90° de roulis avec α < 0 : A = 0.

---

## 3. [P2] Gains de dégâts [PHYSICS §5.9]

**Original.** `JDYN_UpdateDamageGains_494DD`, appelé en tête de chaque tick, calcule 7 gains :
pour chaque composant, `gain = (B − A) / B` (B = total de l'attribut B du composant, A = total de
l'attribut A). 1 = intact, 0 = détruit. Aucun gain n'est ignorable.

| Gain | Composant | Où l'appliquer dans `SCJetpPlane` | Formule |
|---|---|---|---|
| `g_engine` | `ENGINE` | `computeThrust` | cran ≤ `lround(10·g_engine)` (et réécrire la manette), poussée × `g_engine` |
| `g_fuel` | `FUEL` | consommation (§4) | × `(10 − 9·g_fuel)` |
| `g_wing` | `LWING` + `RWING` (un seul gain pour les deux) | `computeLift` | `k_lift = lift_gain · g_wing · q` ; **pas** sur `k_side` |
| `g_elevator` | `ELEVATOR` | `processInput`, borne finale | `clamp(cmd, ±pitch_stick_gain · g_elevator)` |
| `g_rudder` | `RUDDER` | `processInput`, lacet | `yawCommandDeg = rudder/10 · yaw_authority · g_rudder` |
| `g_aileron` | `AILERON` | `processInput`, roulis | `rollRateTarget` borné à `± max_turn_rate_dps · g_aileron` |

Citations : `mov edx,dword_72A2C / imul` (poussée), `imul eax,0Ah / add 80h / sar 8` (plafond du cran),
`mov edx,dword_72A24` à `loc_48239` (portance), `mov edx,dword_72A1C` (borne de la consigne
d'incidence), `mov edx,dword_72A18` (lacet), `mov edx,dword_72A20` sur `[si+71h]` (roulis),
`mov [bp-5Ah],0FFFFF700h / imul dword_72A14 / add 0A00h` (carburant).

**Mise en œuvre.** Ajouter `float g_fuel, g_rudder, g_elevator, g_aileron, g_wing, g_engine`
(défaut 1) et une méthode `updateDamageGains()` appelée en tête de `Simulate()`, qui lit
`system_health`. `system_health` est `map<système, map<sous-système, uint16_t>>` et ne stocke que
la santé courante : mémoriser la santé initiale de chaque entrée au chargement, puis
`gain = somme(courant) / somme(initial)` sur les entrées du composant (c'est `(B − A)/B` si
B = santé initiale et A = dégâts subis). **À valider avec Rémi** : les noms de systèmes réellement
présents dans `system_health` et leur correspondance avec `ENGINE`, `FUEL`, `LWING`, `RWING`,
`ELEVATOR`, `RUDDER`, `AILERON`. Un composant absent → gain 1.

**Test.** Tout intact : strictement aucun changement de vol. Moteur à 50 % : manette plafonnée à
5 (MIL), poussée ×0,5. Moteur détruit : cran 0, poussée 0. Gouverne de profondeur détruite :
consigne d'incidence nulle, l'avion ne répond plus au manche en tangage.

---

## 4. [P2] Consommation de carburant [PHYSICS §4.4]

**Où.** Fin de `Simulate()` (`burnFactor = (notch <= 5) ? 0.2f : 0.3f; …`).

**Original** (bloc manette de `PhysicsTicks`) :
```cpp
if (fuel_kg <= 0) { fuel_kg = 0; thrust_force = 0; /* pas de conso */ }
else {
    float f = (notch <= 5) ? notch * (51.0f/256.0f) : notch * (76.0f/256.0f);   // 0,199·cran / 0,297·cran
    float burn = (10.0f - 9.0f * g_fuel) * sfc;
    if (f > 0.0f) burn *= f;        // SAUTÉ au cran 0 : consommation = sfc (≈ celle du cran 5)
    fuel_kg -= burn * dt;
}
```
Écarts actuels : cran 0 → 0 dans le portage (au lieu de `sfc·dt`) ; facteurs 0,2/0,3 au lieu de
0,199/0,297 (mineur) ; pas de gain carburant. `notch` est le cran **après** plafonnement moteur (§3).

---

## 5. [P2] Direction au sol [PHYSICS §5.8]

**Où.** `processInput()`, fin du bloc lacet : `if (this->on_ground) { this->yaw_speed = 0.0f; }`.

**Original** (`PhysicsTicks`, après `Physics_IntegrateSecondaryPosition`) :
```
au sol ([objet+0x20] != 0)  ET  vitesse < 40 m/s (cmp 2800h) :
    Ω_lacet = −( manche_latéral · V ) / 4          ; [ctrl+0x23]/16 = manche normalisé ±1
```
C'est le **manche latéral** (`rollers`) qui oriente l'avion au roulage : à pleine butée et 20 m/s,
5°/s. Au-dessus de 40 m/s au sol, rien n'est imposé.

**Correction** :
```cpp
if (this->on_ground && V < 40.0f) {
    this->yaw_speed = SIGNE * this->rollers * V / 4.0f;   // SIGNE à déterminer, voir test
} else if (this->on_ground) {
    this->yaw_speed = 0.0f;   // comportement actuel conservé au-dessus de 40 m/s
}
```
Le signe dépend de deux conventions du portage (`rollers = −control_stick_x/refX` et la chiralité
du lacet, déjà inversée pour le servo) : le fixer par le test. Au-dessus de 40 m/s au sol, garder
le comportement actuel : l'original y laisse agir le servo de lacet, mais son éventuel blocage au
sol dans `Aero_ComputeForcesMain_4791E` n'a pas été vérifié.

**Test.** Au roulage à 20 m/s, manche à droite → le nez tourne à droite à 5°/s ; à l'arrêt, rien ;
à 45 m/s, plus d'effet.

---

## 6. [P2] Dégâts : deux bugs dans `SCMissionActors::hasBeenHit` (préalable au §3)

Constatés à la lecture de `SCMissionActors.cpp` (vers la ligne 1054, et le même bloc vers la
ligne 1460) :
1. Dans la boucle sur les sous-systèmes, **`i` n'est jamais incrémenté** : le coup n'est appliqué
   que si `sub_system_to_hit == 0`, sinon aucun sous-système n'est touché.
2. `sub_system.second` est un **`uint16_t`** : `sub_system.second -= damage` passe à ~65535 au lieu
   de devenir négatif, et le test `< 0` n'est jamais vrai. Écrire
   `sub_system.second = (sub_system.second > damage) ? sub_system.second - damage : 0;`.

Sans ces corrections, les gains du §3 resteront à 1 (ou sauteront au-dessus de 1).

---

## 7. [P3] Ordre de calcul : servo avant forces (décalage d'un tick)

Original, dans un même tick : **forces** (`Aero_SumLinearForces_48639`, qui calcule α, q et le
drapeau de décrochage) **puis servos** (`Aero_ControlOrchestrator_48FC2`) **puis intégration de
la vitesse**. Portage : `processInput()` (servos) s'exécute **avant** `computeLift()`, donc avec α,
q et `wing_stall` du tick précédent. Correction possible : sortir la partie servo de
`processInput()` dans une méthode `updateControlServos()` appelée après `updateForces()` et avant
`updateVelocity()`. Effet attendu faible ; à faire seulement si Rémi le souhaite, avec un test de
non-régression du vol stabilisé.

---

## 8. [P3] Commentaires périmés (sans effet sur le vol)

- `SCJetpPlane.h`, en tête de classe : « Pas d'état d'orientation matriciel … 3 accumulateurs
  scalaires INDÉPENDANTS » → faux depuis l'adoption de `ptw` persistante. Remplacer par : « L'état
  d'orientation est la matrice `ptw`, tournée chaque tick par `Ω·dt` (comme
  `WorldObject_IntegrateBodyMotion_3D31D` dans l'original) ; `pitch/yaw/roll` en sont dérivés. »
- `SCJetpPlane.cpp`, `updatePosition()` : « row1' = row1*sin + row2*cos ; row2' = row2*sin − row1*cos »
  → c'est une **rotation standard** (`ligne0' = c·ligne0 − s·ligne2`, `ligne2' = c·ligne2 + s·ligne0`,
  c = cos, s = sin) ; l'ancienne forme venait de noms sinus/cosinus inversés dans la base.
  Même commentaire : la méthode de l'objet monde qui fait l'intégration est
  `WorldObject_IntegrateBodyMotion_3D31D` (méthode `+0x14`), qui fait aussi `position += v·dt`.
- `processInput()` : « var_30 = sin(angle(vecteur avant, Z monde)) ~ cos(tangage) » → c'est
  **exactement** `cos(tangage du nez)` (le code est juste, seul le commentaire change).
- `processInput()` : les références à `Aero_ComputeControlFlags75Bit5B` → nouveau nom
  `Aero_ComputeAoACommand_48862`.
- `SERVO_K` : commentaire à préciser : dans l'original, K = fréquence de simulation = `1/dt`,
  plafonnée à 25 (le jeu attend activement au-delà de 25 images/s, `dt ∈ [0,04 ; 0,5] s`). Garder 25
  reproduit le jeu à sa cadence nominale ; la forme `rate += clamp(target − rate, ±3·q'·dt)` est
  déjà indépendante du pas de temps.
- `pitch_rate_limit_dps` (JDYN champ 15) : chargé mais inutilisé ; aucun lecteur trouvé dans le
  tick physique de l'original. Le laisser inutilisé.

---

## 9. Ce qui est conforme (ne pas toucher)

Courbe de manette et lapse d'altitude ; densité `AIRDENS.TBL` ; α/β en degrés ; incidence
effective bornée au décrochage et départ franc réservé au joueur ; portance et force latérale
(hors gain d'aile) ; traînée ; gravité 9,797 m/s² ; `bankTerm` et son signe sur le dos ; cibles T/B
et règle de sélection ; servo racine carrée avec zone morte 0,21875° et borne `±3·q'` ; bornes
`±max_turn_rate_dps` ; composition incrémentale de `ptw` ; absence volontaire du seuil de 0,21875°
sur les incréments de rotation (justifiée à haute fréquence d'image).

## 10. Questions ouvertes (ne pas deviner)

- La valeur `X` de la loi de charge (méthode `+0x3C` de l'objet) a la forme d'une masse : le
  portage utilise `mass_kg`, cohérent mais non prouvé.
- Sémantique exacte des attributs A et B des composants (§3) : à confirmer côté données.
- Roulis : la coupure sous 40 m/s et au sol de `rollLive` n'a pas été relue ligne à ligne dans
  l'original (`Aero_ComputeControlFlags75Bit5C`, partiellement lue).
