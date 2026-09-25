# Corrections à apporter à l'IA du portage (`SCAIBrain`, `SCMissionActors`, `SCPilot`) — document de travail

*Rédigé le 2026-09-25 à partir des lectures de l'assembleur de STRIKE.EXE des 2026-09-20 à 25.
Destiné à une session Claude Code qui travaille **dans le dépôt libRealSpace** : tout ce qu'il
faut pour coder est ici. Les citations d'assembleur servent à la traçabilité ; les références
complètes sont dans `strike_commander_re/analysis/` : `NOTE_ATTAQUE_SOL.md`,
`AI_TICK_CALL_GRAPH.md` (sections citées), `PHYSICS.md` §9.*

## 0. À lire avant de coder

- **Fichiers** : `src/strike_commander/SCAIBrain.cpp/.h`, `SCMissionActors.cpp`, `SCPilot`, et
  `SCJetpPlane` pour le pilote automatique (voir `IMPL_SCJETPPLANE_CORRECTIONS.md` §1, **à faire
  avant le §2 ci-dessous**).
- **Unités** : flottants, valeurs réelles (m, m/s, degrés, s). Axes : jeu Z-up, libRealSpace Y-up
  (`x = c0`, `y = c2` altitude, `z = c1`). Le cap du jeu vaut `atan2(c0, c1)` = `atan2(x, z)`.
- **Cadence** : le cerveau tourne à 25 Hz (choix de Rémi). C'est aussi la cadence maximale de
  l'original, qui attend activement au-delà de 25 images/s : les réglages de l'original
  s'appliquent tels quels au tick de 0,04 s. Ne pas reproduire le défaut de l'original sur
  machine trop rapide.
- **Ne pas casser ce qui est validé en jeu** : ciblage, choix d'arme, tir au canon, poursuite par
  écarts d'angle, esquive. Chaque correction est locale ; une correction = un commit ; les `printf`
  de diagnostic restent en place.

Ordre conseillé : §1 et §2 (le bombardement ne marche pas sans eux), puis §3 à §6, puis §7.

---

## 1. [P1] Attaque au sol : condition inversée entre les phases 0 et 1

**Où.** `SCAIBrain::updateGroundAttack`, ligne 771 :
```cpp
} else if (horizontal_distance > 8000.0f || !aligned) {   // FAUX
```
**Original** (`GroundAttack_Phase01_Approach_77282`, `cmp [bp+var_4], 1F4000h` puis
`cmp [bp+var_16], 0AA00h`) : phase 1 quand l'avion est **loin (> 8000 m) OU aligné (> 170°)**.
**Correction** : `|| aligned`.

**Effet attendu** : l'avion ne tourne plus en rond à ~5000 m entre les phases 0 et 1.

---

## 2. [P1] Attaque au sol : phases 2 et 3 au pilote automatique physique

**Pourquoi.** La tolérance de largage d'une bombe est d'environ 30 m en distance horizontale. En
phase 3, le portage pilote par écarts d'attitude avec une zone morte de 2° (ligne 788) : à
5000 m, 2° font ~175 m d'écart latéral, l'impact prédit ne passe jamais à moins de 30 m. L'original
confie l'avion à un pilote automatique cinématique qui aligne exactement le nez.

**Original.**
- **Phase 2** (`GroundAttack_Phase2_EngageAutopilot_775B1`, un seul tick) : point visé
  `P = cible + (0, 1000, 0)` ; vitesse voulue `W = normalise(P − position) × 100 m/s` ; drapeau
  « point atteint » remis à 0 ; pilote automatique activé (`JDYN+0x68 = 0`) ; phase 3.
- **Phase 3** (`GroundAttack_Phase3_WeaponRelease_776FB`) : si la cible est mobile, `P` et `W` sont
  recalculés à chaque tick. Sans tir, si le pilote automatique a posé « point atteint », retour en
  **phase 0**.
- **Phases 0, 1 et 4** : pilote automatique coupé à chaque tick.

**Correction** (avec l'API du document physique) :
```cpp
// phase 2
Vector3D P = target_position + Vector3D(0, 1000, 0);
Vector3D W = (P - own_position); W.Normalize(); W = W * 100.0f;
owner->plane->engageAutopilot(P, W);     // SCJetpPlane
ground_phase = 3;
// phase 3 : pas de SetAttitudeError ; si cible mobile : engageAutopilot rappelé avec P et W recalculés
//           (sans remettre l'état du cercle à 0 : seulement P, W et le drapeau)
if (!fired && owner->plane->autopilotReached()) ground_phase = 0;
// phases 0, 1, 4 : owner->plane->disengageAutopilot();
```
Le test de repli actuel « `angle < 90°` → phase 0 » (ligne 820) devient inutile : le garder en
secours seulement si Rémi le souhaite.

**Tir des bombes** (inchangé, conforme) : `raté ≤ 20 + |vitesse| × dt + (150 si (rand() & 15) > AG)`,
`raté` = distance **horizontale** impact prédit ↔ cible. Garder la simulation de trajectoire du
portage pour l'impact : la formule de l'original (`BombModel_PredictImpact_41311`) a un point non
résolu.

**Test d'acceptation.** Mission d'attaque au sol avec MK-82 : l'IA atteint la phase 3, largue
(log `bomb released … miss=… tolerance=…` avec `miss ≤ tolerance`), passe en phase 4, puis
termine ou repart pour une nouvelle passe.

---

## 3. [P2] Attaque au sol : écarts mineurs

| Portage (ligne) | Original | Correction |
|---|---|---|
| Passage en phase 2 quand l'écart de cap < 5° (768) | **ailes à plat** : commande de roulis 0° (zone morte 5°) puis passage quand `|roulis| < 5°` | tester `|roll| < 5°` après avoir commandé les ailes à plat |
| — | phase 1, `a > 169°`, avion **plus de 2000 m au-dessus de `P`** : **piqué à −40°** | ajouter |
| palier si `a > 169°` et `hd > 9000` (déjà là) | idem, tangage 0°, zone morte 5° | conforme |
| vitesse plein gaz `target_speed = -60` (756, 789) | vitesse de **croisière du profil** (`JDYN+0x84`, 3ᵉ des 3 vitesses IA du chunk JDYN) ; cran 5 en approche, cran 3 au passage en phase 2 | utiliser la vitesse de croisière |
| phase 4 : cabré +5°, zone morte 2° (754-755) | cabré +5°, **zone morte 5°**, vitesse de croisière | zone morte 5° |
| choix d'arme : AGM-65D, GBU-15, MK-20, MK-82, LAU-3 (680) | ordre : AGM-65D, GBU-15, MK-20, MK-82, **identifiant 7**, LAU-3 | ajouter l'identifiant 7 |
| seules MK-20/MK-82 gérées, sinon « old code takes over » (795) | LAU-3 : tir **3 s** après l'entrée en phase 3 ; GBU-15 : tir si `nez · direction(cible) > cos(v_rot × t)`, `t = distance / vitesse du lanceur`, `v_rot` = word `+0x61` du chunk `DATA` du modèle ; AGM-65D : **test non lu** | porter LAU-3 et GBU-15 ; garder l'ancien code pour l'AGM-65D |
| garde anti-sol : pas de piqué sous 1000 m (785) | **absente** de l'original | décision de Rémi (sécurité du portage) |
| — | minuteur de 2 s en phases 0 et 1 : à échéance l'attaque se termine et redémarre au tick suivant | sans effet visible (les phases 0/1 se recalculent) : ignorable |

Condition d'engagement (`GroundAttack_CanEngage_77000`) : cible au sol (`target_type == 2`) et une
arme d'identifiant 3 à 8 chargée (**le canon ne compte pas**).

---

## 4. [P2] Verrouillage des missiles (`testMissileLock`, ligne 614)

**Original** (`AI_TICK_CALL_GRAPH.md`, « Le tir de missile » et « Qui écrit les octets de
signature ») :
1. Suivi : tant que l'objet suivi par le point d'emport n'est pas la cible, demande de suivi, pas
   de tir. Le portage le fait déjà (`lock_target`). **Aucune limite du nombre de missiles en l'air.**
2. Verrouillage : `WeaponStation_TestTargetLock` → `Targeting_SelectAndPrioritize`, selon
   `weapon_aspec` du `WDAT` :
   - candidat `c` = objet retenu dans le cône et la portée du chercheur
     (`Targeting_FilterByWeaponType`, **non lue** : garder le cône et la portée actuels du portage) ;
   - `c` nul → pas de tir ; `c` = cible → on garde ;
   - `c` ≠ cible (un leurre, un autre avion) : si sa signature dépasse le seuil de l'aspec, il **vole
     la piste** avec 3 chances sur 10 (5 sur 10 dans un cas particulier non élucidé) ;
   - **aspec 1 (AIM-9J) uniquement** : on ne garde la cible que si
     `dot(v_référence, v_cible) ≥ 0` (vitesses à 90° au plus : **de dos seulement**).
     `v_référence` = vitesse de l'objet de référence du chercheur : avant le tir, l'objet `+0x0D` du
     point d'emport (vraisemblablement le porteur) ; en vol, le missile.

| aspec | armes | seuil de vol de piste |
|---|---|---|
| 1 | AIM-9J | signature calculée > 210, et aspect arrière obligatoire |
| 2 | AIM-9M | signature calculée ≥ 245 |
| 4 | AIM-120, SA-2, SA-6 | 2ᵉ octet `SIGN` ≥ 245 |
| 5, 6 | AGM-65D, GBU-15 | garde la cible ou rien |

**Signature d'un avion pour les aspecs 1 et 2** (`Aircraft_ComputeSeekerSignature_3E2F1`) :
```
dos  = dot(v_référence, v_cible) > 0
sig  = 10 + |v_cible| / 602 × (dos ? 100 : 50)
if (cran de gaz de la cible > 5) sig += (dos ? 100 : 50)      // post-combustion
sig  = (int)sig & 0xFF                                          // repasse par 0 au-delà de 255 (défaut d'origine)
```
L'octet `SIGN` du modèle ne sert que sans objet de référence.

**Leurres (`DECY`)** : signature = `S0 × temps restant / durée de vie` (décroît jusqu'à 0) ; l'aspec 4
lit S1 sans décroissance.

**Correction minimale** : ajouter le test d'aspect arrière de l'AIM-9J dans `testMissileLock`.
Le vol de piste par les leurres vient ensuite, avec les leurres eux-mêmes.

---

## 5. [P2] Esquive de missile (`reactToMissile`)

**Original** (`AI_MissileEvasionReaction_9A77`) :
- agit tant que l'état « missile en approche » est posé et que le missile me vise encore ; **pas de
  minuteur de maintien** (le portage garde 25 ticks, ligne 943 : à vérifier contre le rythme de
  réévaluation du ciblage avant de le retirer) ;
- vecteur vers le missile dont la composante **verticale** est remplacée selon l'altitude et un
  seuil `dword_7203D` : trop bas, on monte (`2 × seuil − altitude`), sinon on descend
  (`seuil − altitude`). **Le seuil n'est pas encore lu** : garder l'esquive horizontale en attendant ;
- bande 1 (proche) : composante verticale annulée, virage perpendiculaire du côté qui demande le
  moins de rotation ; bande 2 : perpendiculaire en gardant le changement d'altitude ; bande 3 :
  **fuite** (les trois composantes inversées) ; bande 0 : rien ;
- manette : **vitesse maximale** du profil (`JDYN+0x80`) si le guidage a agi, sinon vitesse de
  croisière (`JDYN+0x84`). Le portage met toujours plein gaz (ligne 969) ;
- si le missile vient du joueur et que je suis ami : message radio `0x0E` (plainte de tir ami).

Correction possible dès maintenant : la manette et le message radio. Le reste attend le seuil.

---

## 6. [P2] Qualité de solution au canon (`computeFireSolutionQuality`)

**Original** (`AI_ComputeFireSolutionQuality_91DF`, erreur de visée) :
```
D = position cible − ma position ;  W = vitesse de MON ARME (pas l'axe du nez)
erreur = √( (cap(D) − cap(W))² + (élévation(D) − élévation(W))² )     // angles monde, en degrés
```
Trois écarts avec `forward.AngleBetween(delta)` : angles monde (cap/élévation) et non angle 3D ;
vecteur de l'arme et non nez ; **la différence de cap n'est pas ramenée à ±180°** (défaut de
l'original : cible plein sud, caps 179° et −179° → erreur 358°, qualité 0). Écart faible en
pratique près du vol horizontal ; à porter seulement si Rémi veut la fidélité complète.
La tolérance `arctan(champ +0x20 de la cible / distance)` : le sens « vitesse de la cible » n'est
pas relu.

---

## 7. [P3] Commandes bas niveau de l'original — pour l'« option B » de `SCPilot`

L'original ne commande **ni cap ni altitude** : il commande un **angle de roulis** et un **angle de
tangage**, avec zone morte, en écrivant les axes du manche (les mêmes que le joueur).

- `AI_RollToAngleCmd_8104(roulis_voulu, zone_morte)` → `AI_RollController_7E56` : écart ramené à
  ±180° ; si `|écart| > zone morte`, `JDYN_RollStickFromError_4B09D` convertit l'écart en valeur de
  manche latéral (lue le 2026-09-25, voir ci-dessous). (0°, 5°) = ailes à plat ; (180°, 5°) = sur le dos.
- `AI_PitchToAngleCmd_7E18(tangage_voulu, zone_morte)` → `AI_PitchController_7B20`, écart `e` :
  - `|e| ≤ zone morte` : manche 0, ailes à plat ;
  - `e < −15°`, ou sur le dos (`|roulis| > 90°`) et `e < 0` : **passer sur le dos** (roulis 180°)
    et, seulement une fois `|roulis| > 165°`, **tirer** : manche normalisé `s = max(1, |e|/15)`
    (toujours au moins la pleine butée) ;
  - sinon : ailes à plat et, seulement une fois `|roulis| < 15°`, `s = e/15` pour `e < 15°`,
    `s = 1` au-delà (négatif = pousser, pour `−15° < e < 0`) ;
  - `s` passe ensuite par `AI_ClampPitchStick_5305` (lue le 2026-09-25) : borné à ±`L`, avec
    `L = 9 · max(compétence, 8) / G` (compétence = `entité+0xB0`, `G` = facteur de charge max
    `JDYN+0x67`), sur l'échelle du manche de l'original où **16 = butée** ; sur un axe `[−1, 1]`,
    borner à `±min(1, L/16)`. Exemple : compétence 8, G = 9 → L = 8 → la moitié de la butée.
  Les piqués de plus de 15° se font donc **sur le dos, en tirant**.
- Tourner vers une direction : `AI_GuidanceCmd_FromOwnPos` → `AI_GuidanceSolution_Major` (loi
  ci-dessous, **relue le 2026-09-25**) → `AI_CombatDecision_Major` → commandes de roulis/tangage.

### Loi de pilotage vers une direction (`AI_GuidanceSolution_Major`, relue)

Repère libRealSpace (Y = haut). `D` = direction voulue, `R` = direction de référence (vitesse de
l'avion). `floor` = altitude du terrain + `deck` (`entité+0xE5` du pilote). Angles en degrés.
```cpp
float h = wrap180(headingOf(D) - headingOf(R));             // cap = atan2(x, z) (asm : atan2(c0, c1))
float p = nosePitch();
float e = (fabsf(h) >= 90.0f) ? 0.0f : elevationOf(D);      // cible derrière : virage à plat
bool corrected = false;
if (altitude <= floor && e < p) {                           // sous le plancher : remonter
    e = std::min(80.0f, 80.0f * (floor - altitude) / deck); corrected = true;
} else {
    float m = 0.0f;                                         // piqué maximal permis
    float n = plane->max_g;                                 // avion+0x67
    if (n >= 2.0f) {
        float r = speed * speed / (9.8f * n / 2.0f);        // rayon de ressource
        float above = altitude - floor;
        m = (r <= 0.0f || above >= r) ? -90.0f : -acosDeg((r - above) / r);
    }
    if (e < m)                    { e = m;      corrected = true; }
    else if (p < -45.0f && e < p) { e = -45.0f; corrected = true; }
    else if (p >= 45.0f && e > p) { e = 45.0f;  corrected = true; }
}
if (corrected) { float lh = horizontalLength(D); D.y = sinDeg(e) * lh; D.normalize(); }
float v = wrap180(elevationOf(D) - elevationOf(R));
float r;
if (h >= 90.0f)       r = 90.0f - roll()  - (v > 0 ? v : 0);
else if (h <= -90.0f) r = -90.0f - roll() + (v > 0 ? v : 0);
else { Vector3D L = toBodyFrame(D); r = atan2Deg(L.x, L.y); }   // roulis qui met D dans le plan de portance
r = wrap180(r);
combatDecision(h, v, r);                                    // AI_CombatDecision_Major
```
### Du triplet d'écarts au manche (`AI_CombatDecision_Major`, relue le 2026-09-25)

L'ancien résumé (« écart < 20° : rien ») était faux. Échelle du manche : 16 = butée (en `[−1, 1]` :
diviser par 16). `pitchStick` positif = tirer.
```cpp
// h = écart de cap, v = écart d'élévation, r = écart de roulis (degrés), sortie des 3 axes remis à 0
bool SCAIBrain::combatDecision(float h, float v, float r) {
    pitchStick = rollStick = 0;
    if (tooSlow()) { throttle = 10; v = std::min(v, 10.0f); h = std::min(h, 10.0f); } // borne haute seulement
    if (stalled)   { noseHighRecovery(); return false; }                               // ID15
    if (h == 0 && v == 0) { rollToAngle(0, 2); return true; }                          // aligné : seul « true »
    float a = sqrtf(h*h + v*v);
    if (a > 20.0f && v > -10.0f) {                    // gros écart : incliner, puis tirer à fond
        bankError(r, 2);
        if (fabsf(r) < 20.0f) { throttle = 10; pitchStick = clampPitch(16.0f); }
        return false;
    }
    float w = wrap180(roll() + r);                    // inclinaison qui alignerait
    if (fabsf(w) > 145.0f) {                          // cible juste sous le nez : ne pas passer sur le dos
        float s = std::max(-16.0f, -16.0f * (v/10.0f) * (v/10.0f));
        if (rollToAngle(0, 5)) pitchStick = clampPitch(s);                              // ailes à plat, pousser
        return false;
    }
    float k = (a/20.0f) * (a/20.0f) * jdyn.turn_rate_max / 270.0f;                   // JDYN+0x71
    float s = 16.0f * k;
    if (s >= 16.0f) { throttle = 10; s = 16.0f; }
    float t = r * k; if (fabsf(t) > fabsf(r)) t = r;
    if (bankError(t, 5)) pitchStick = clampPitch(s);   // tirer seulement une fois incliné
    return false;
}
// bankError(e, zm) = AI_BankErrorCmd_7F34 : inclinaison visée roll()+e bornée à ±maxBank
//   (maxBank = 90° × G/6 si G < 6, sinon 90°) ; si |e| > zm : rollStick = rollStickFromError(e, dt),
//   retourne false ; sinon true.
// clampPitch(x) = AI_ClampPitchStick_5305 : ±9·max(compétence, 8)/G.
```
Le pilote vise donc en **inclinant d'abord puis en tirant** (jamais de manche à pousser sauf cible
juste sous le nez) ; la force de la ressource croît avec le carré de l'écart (`(a/20)²`), la pleine
butée est atteinte au-delà de 20° d'écart. Les pilotes peu compétents et les avions à fort G tirent
moins fort ; les avions sous 6 G s'inclinent moins (`90° × G/6`).

### De l'écart de roulis au manche latéral (`JDYN_RollStickFromError_4B09D`, lue le 2026-09-25)

L'IA ne met pas un gain proportionnel : elle demande le **taux de roulis qui permet d'arriver pile
sur l'angle en freinant à l'accélération maximale**, puis l'exprime en fraction du taux maximal.
```cpp
// e = écart de roulis (degrés), dt = durée du tick (s)
float SCAIBrain::rollStickFromError(float e, float dt) {
    float A    = jdyn.roll_accel;                 // JDYN+0x47, deg/s² (champ JDYN n°7)
    float wmax = maxRollRate();                   // Aero_MaxRollRate_4AF35, deg/s
    if (wmax == 0.0f) return 0.0f;
    float w = sqrtf(A*dt*A*dt + 2.0f*A*fabsf(e)) - A*dt;   // taux voulu, >= 0
    w = std::min(w, wmax);
    return copysignf(16.0f * w / wmax, e);        // 16 = butée ; en [-1, 1] : w / wmax
}
float SCAIBrain::maxRollRate() {
    float w = jdyn.roll_rate_max;                 // JDYN+0x71, deg/s
    float flow  = sqrtf(alpha*alpha + beta*beta); // incidence et dérapage, degrés
    float onset = jdyn.stall_angle - 5.0f;        // JDYN+0x4B - 5°
    if (flow > onset) w /= (flow - onset + 1.0f); // chute du taux de roulis près du décrochage
    if (flags75_tristate == 2) w *= 0.6f;         // bits 7-8 de flags_75 (rôle non identifié)
    if (airspeed < jdyn.field_0x59) w *= airspeed / jdyn.field_0x59;   // JDYN+0x59, voir note
    return w;
}
```
Le taux de roulis **actuel n'entre pas** dans le calcul : l'original calcule bien
`w − taux courant`, mais jette le résultat (`sub eax, [si]` puis `mov [bp+var_5C], eax`, jamais
relu). À reproduire tel quel pour la fidélité. La commande de tangage (`AI_PitchController_7B20`)
n'utilise **pas** cette fonction.

**Note `JDYN+0x59`** : documenté ailleurs comme « plafond de l'effet de sol » (altitude). Ici il est
comparé à la **vitesse** (`mov eax, [si+59h] / cmp eax, [bp+var_4]`, `var_4` = norme du vecteur
vitesse) ; et dans `Aero_ApplyGroundEffect` il est comparé, au sol, à une composante de la vitesse
air (`var_18`, sortie de `Physics_ResolveWindVectorCached_4643B`), pas à une altitude. Ce serait
donc une **vitesse de référence d'efficacité des gouvernes** (sous elle, au sol, le nez reste
plaqué : tangage −20). À confirmer avec la valeur du champ n°17 dans tes fichiers `JDYN`.


---

## 8. [P2] Dégâts : deux bugs dans `SCMissionActors::hasBeenHit`

Même correction que `IMPL_SCJETPPLANE_CORRECTIONS.md` §6 (vers les lignes 1054 et 1460) : `i`
jamais incrémenté dans la boucle des sous-systèmes, et soustraction sur un `uint16_t` qui boucle à
~65535. Sans elle, aucun dégât n'atteint les composants.

---

## 8bis. [P2, structurant] Placer le combat et le tournoi sous `GOAL`, comme l'original

Référence : `AI_TICK_CALL_GRAPH.md`, « `GOAL` et tournoi `MVRS` » (relu le 2026-09-25).

**Écart actuel.** `SCAIBrain::tick()` fait le ciblage, le tir, puis `runGoalSelectors()`, puis
l'esquive et la poursuite **en dehors** de `GOAL` ; la valeur `GOAL` 4 ne fait rien (`continue`).
Conséquences : un pilote dont le fichier dit « 4 » ne combat pas sans ordre de script (la poursuite
exige un ordre détruire/défendre), et l'ordre des gestionnaires du fichier n'arbitre pas entre
navigation et combat.

**Structure de l'original, à reproduire :**
```
tick :
  réactions (niveau entité+0x27F) ; alerte de menace → abandon + nœud ID 4
  si comportement en cours : le faire tourner, fin
  GOAL (ordre du fichier, premier qui agit) :
     2 → executeGoalAction : détruire/défendre → combatStep(false) ; cible sol de mission → attaque au sol
     3 → errance
     4 → combatStep(false)
     5 → ailier
combatStep(sol_autorisé) :                     // AI_BehaviorStateMachine_WeightedOptionSelector_9D05
  esquive ; ciblage
  pas de cible aérienne : esquive, ou attaque au sol (si cible sol et sol_autorisé), sinon return false
  tir + poursuite (si niveau ≤ 1) : s'il y a tir ou qualité de solution > 0 → abandonner la manœuvre en cours, return true
  manœuvre en cours → la faire tourner, return true
  tournoi MVRS → appliquer le gagnant (il devient la manœuvre en cours), return true
```
Il faut pour cela une **pile de comportements** (en cours / précédent) avec trois opérations :
empiler, terminer (restaure le précédent), abandonner (vide). L'attaque au sol actuelle en est un
cas particulier.

**Tant que les manœuvres `MVRS` ne sont pas portées**, le tournoi peut rester vide : `combatStep`
se réduit alors au tir et à la poursuite actuels. Le gain immédiat est la place du combat dans la
liste `GOAL`. Déplacement à faire en plusieurs commits, validés en jeu un par un.

## 8ter. [P2] Réactions : niveau de réaction, entrée en combat contre un attaquant, moral (`GOAL` 5)

Références : `AI_SYSTEM.md` §4.4 et `AI_TICK_CALL_GRAPH.md`, « `GOAL` et tournoi `MVRS` » §2-3
(relus le 2026-09-25). Répliques de Billy (`data/BILLY.IFF`) citées pour les tests.

### A. Niveau de réaction (`entité+0x27F`) — sur `SCAIBrain`

```cpp
enum ReactionLevel : uint8_t { REACT_NONE = 0, REACT_ENGAGED = 1, REACT_MISSILE = 2,
                               REACT_NEW_TARGET = 3, REACT_GROUND_AVOID = 4, REACT_STALL_RECOVERY = 5 };
// 4/5 : réflexes de pilotage (§8quinquies), PAS des attentes d'atterrissage/décollage (corrigé 2026-09-25)
uint8_t reaction_level{REACT_NONE};
```
Chaque réaction ne s'exécute que si `reaction_level ≤ son niveau` (esquive : `== 2`). Le **tir et la
poursuite** n'ont lieu que si `reaction_level ≤ 1` (à ajouter comme garde dans `updateFireControl`
et `updatePursuit`, ou dans `combatStep` du §8bis). L'actuel `threat_state == 2` est ce niveau 2 :
le fusionner avec `reaction_level`.

### B. Entrée en combat contre un attaquant (`AI_EngageAttackerReaction_E246`)

**À appeler** dans `tick()`, après l'esquive et avant `runGoalSelectors()`, si rien n'a réagi et
`reaction_level ≤ 1` :
```cpp
bool SCAIBrain::engageAttackerReaction() {
    if (just_hit || retarget_timer_expired) this->acquireBestThreat(false);   // bit 7 de +0x28D / minuteur +0x174
    if (reaction_level == REACT_ENGAGED) reaction_level = REACT_NONE;
    if (air_target == nullptr || reaction_level != REACT_NONE) return false;

    Vector3D to_target = air_target->plane->position - owner->plane->position;
    float nose_vs_target_nose = owner->plane->forward.AngleBetween(air_target->plane->forward);  // a
    float nose_vs_direction   = owner->plane->forward.AngleBetween(to_target);                   // b
    bool on_my_six = nose_vs_direction > 150.0f && nose_vs_target_nose < 30.0f
                  && to_target.Length() < intel.distanceThreshold1800;          // NUMS dword_7201C = 1800
    if (!just_hit && !on_my_six) return false;
    reaction_level = REACT_ENGAGED;

    if (owner->current_command == OP_SET_OBJ_FOLLOW_ALLY && leader_state == 0) {   // +0x149
        bool leader_is_player = owner->leader == player;                          // +0x145
        if (!leader_is_player && air_target->brain_target() != owner) return false; // l'attaquant doit me viser
        leader_state = 3;
        owner->target = air_target;                                               // cible de mission +0x137
        if (leader_is_player) owner->setMessage(0x12);                            // « This one's all mine. »
        return false;                                                             // l'original ne prend pas la main ici
    }
    if (owner->current_command != OP_SET_OBJ_FOLLOW_ALLY && model_class >= 9) {   // modèle +0x52
        abortRunningNavigation();                                                 // nœud ID 21
        return this->combatStep(false);                                           // §8bis
    }
    if (no_running_behavior && (no_command || command == FLY_TO_POINT || command == RETURN_TO_BASE)) {
        this->tryWanderRandom();                                                  // + drapeau « point atteint »
    }
    return false;
}
```
- Les angles de l'original sont des écarts d'angle (`Angle_DeltaNormalized_A`) ; `AngleBetween`
  (angle 3D) est l'approximation raisonnable.
- « Touché » : poser `just_hit` dans `SCMissionActors::hasBeenHit` (le portage a déjà `attacker`) et
  l'effacer après le tick.
- `model_class` (octet `+0x52` du modèle, seuil 9) : correspondance avec les données non établie ;
  en attendant, considérer tous les avions de combat comme éligibles.
- Cela remplace le réflexe actuel `followAlly()` → `destroyTarget(attacker)` (ligne ~610 de
  `SCMissionActors.cpp`), qui engage l'attaquant immédiatement et sans condition.

**Test.** Ailier en formation, un MiG se place dans ses six heures à moins de 1800 : l'ailier annonce
« This one's all mine. » et le prend pour cible. Même chose s'il est touché.

### C. Réaction au moral (`GOAL` 5, `Goal_MoraleReaction_878F`)

**Écart actuel.** `tryActiveWingman()` exécute les ordres radio du joueur (`override_progs`) sous la
valeur 5. Dans l'original, la valeur 5 est la **réaction au moral** ; les ordres radio passent
ailleurs (`AI_MessageDispatcher`, non détaillée). **Garder l'exécution des ordres radio**, mais la
sortir de `runGoalSelectors()` (en tête de `tick()`), et implémenter la valeur 5 ainsi :

```cpp
int SCAIBrain::computeMorale() {                    // AI_ComputeMorale_CD4A, une fois par tick
    int s = 100;
    if (has_damaged_component) s -= 100;             // Roster_SumAttributeB non nul : sens à confirmer côté données
    s += (int)(51.0f * fuel / fuel_capacity) - 50;
    if (!canHoldOrder()) s -= 50;                    // détruire : pas d'arme adaptée ; défendre : pas de cible ou pas d'arme air-air
    int enemies_alive = count_alive(other_team), own_losses = count_destroyed(my_team);
    if (enemies_alive > 0 && my_team != NEUTRAL) s += -8 * enemies_alive - 32 * own_losses;
    if (reaction_level != REACT_NONE) s -= 50;
    int LY = atrb.LY;
    s += LY < 3 ? 0 : LY < 6 ? 15 : LY < 12 ? 30 : LY < 15 ? 50 : 75;
    if (enemies_alive > 0 && s >= 80) s = 79;
    if (LY > 9 && s < 25) s = 25;
    if (LY <= 0) s = 0;
    return s < 25 ? 5 : s < 50 ? 4 : s < 80 ? 3 : 2;   // 5 panique … 2 bon
}
bool SCAIBrain::isDisciplined() {                   // AI_MoraleDisciplineCheck_CA93, réévalué toutes les 3 s
    static const int adj[4] = {+7, +4, -3, -5};      // moral 2, 3, 4, 5
    return atrb.FL + adj[morale - 2] > 7;
}
bool SCAIBrain::moraleReaction() {                  // toutes les 5 s au plus, sinon false
    bool player_side = owner->team_id == player_team;
    bool leader_is_player = owner->leader == player;
    if (morale >= 4) {
        if (!player_side) { owner->setMessage(8); fleeToExit(); return true; }             // « I'm outta here! »
        if (leader_is_player && !isDisciplined() && following()) {
            if (threat == player && !enemies_active) {                                        // le joueur lui tire dessus
                air_target = player; leader_state = 1; combatStep(false);
                owner->setMessage(0x20); return true;                                         // « Do you feel lucky? … »
            }
            if (leader_state != 2) { owner->setMessage(8); leader_state = 2; leaveFight(); return true; }
            return false;
        }
        if (leader_is_player && (reaction_level == 1 || reaction_level == 2)) owner->setMessage(6); // « … give me a hand here? »
        return false;
    }
    if (player_side && leader_is_player && !isDisciplined() && leader_state != 1 && leader_state != 2
        && following() && enemies_active) {
        owner->setMessage(0x12);                                                               // « This one's all mine. »
        leader_state = 1; objective_locked = true; owner->target = player; /* Goal_TransferToWingman → combat libre (état 1) */
        return true;
    }
    return false;
}
```
- `fleeToExit()` / `leaveFight()` : ordre « aller à un point » (fuite) ou « suivre » gardé (ailier),
  ordre verrouillé contre le script, comportement en cours abandonné, navigation vers un point
  1000 m plus haut. **Le point exact n'est pas tracé** (objet global `word_706A0`) : en attendant,
  la base de départ ou le point de sortie de la mission.
- `enemies_active` : `byte_6E4CD`, « un avion du camp adverse a réfléchi au cycle radio précédent »
  (déduction) ; en attendant, « au moins un ennemi en vie à portée radar ».
- Avec Billy (`LY = 13`, `FL = 15`) : score plancher 25, donc moral 4 au pire (jamais 5), et
  `FL + ajustement` vaut au moins 15 − 3 = 12 > 7 : il est **toujours discipliné**. **Billy ne fuit
  pas et ne prend pas d'initiative par le moral**. Ses 0x12 viennent de l'entrée en combat (B). Tester le moral avec un
  profil à `LY` et `FL` bas.

**Comment ces réactions s'expriment : pas de faux `PROG`.** Dans l'original, la réaction écrit
l'objectif de l'entité (comme le ferait le script), le **verrouille** contre le script (bit 5 de
`+0x28B` : `Goal_SetObjective_A307` saute alors son `switch`) et change l'**état de l'ailier**
(`+0x149`). C'est **`GOAL` 2** qui l'exécute ensuite (`Goal_ExecuteAction_A8AC` ; `0xA5` partage
la branche de `0xA4`, `Goal_ReturnToBase` vers le point rangé en `+0x11F`). Transposé :
```cpp
uint8_t leader_state{0};        // +0x149 : 0 formation, 1 combat libre, 2 a quitté, 3 cible précise
bool    objective_locked{false};// bit 5 de +0x28B — SCProg::setObjective doit l'ignorer quand vrai
Vector3D brain_destination;     // +0x11F, pour l'ordre « aller à un point » posé par le cerveau
```
et dans `executeGoalAction()`, pour l'ordre « suivre » (d'après `Goal_SelectTransition`) :
```cpp
followAlly(...);                                        // Goal_FollowAllyExec : vol en formation
switch (leader_state) {
  case 0: objective_locked = false;
          if (player_attacker_on_six && leader_is_player && isDisciplined()) {
              leader_state = 3; engage_target = player_attacker; objective_locked = true;
              owner->setMessage(0x10);                  // « You've got one on your tail, Commander! »
          }
          break;
  case 1: combatStep(true); break;                      // combat libre autour du leader (ordre 0xAC)
  case 2: objective_locked = true; flyTo(brain_destination); break;   // a quitté le combat
  case 3: objective_locked = true;
          if (engage_target est au sol) startGroundAttack(engage_target);
          else combatStep(false);                       // Escort_LeaderSuccession non relue : approximation
          break;
}
```
`player_attacker_on_six` : ennemi dans les six heures du joueur (`word_722EE`, déduit de la
réplique `0x10` ; mêmes critères que l'entrée en combat, vus depuis le joueur).

**Ordre dans `tick()`** : ordres radio du joueur → esquive (niveau 2) → entrée en combat contre un
attaquant (B) → comportement en cours → `GOAL` (dont 5 = moral, 2 = ordre, 4 = combat, 3 = errance).

**Test.** Profil à faible `LY` et `FL`, camp adverse, après plusieurs pertes : le MiG annonce 8 et
part. Ailier du joueur à faible `LY`/`FL` sur qui le joueur tire, sans autre ennemi : il annonce
0x20 et attaque le joueur.

## 8quater. [P2] Navigation vers un point : l'original utilise le pilote automatique physique

Relu le 2026-09-25 (`AI_TICK_CALL_GRAPH.md`, « Le vrai nœud ID 21 »). `AI_NavSolutionToPoint`
écrit le point et la vitesse voulue (direction × vitesse de croisière) dans le bloc de commandes,
puis applique le nœud ID 21 : **nez remis à l'horizontale** (commande de tangage 0°, zone morte 5°),
puis, dès que le tangage est sous 15°, **pilote automatique physique** jusqu'au point
(`IMPL_SCJETPPLANE_CORRECTIONS.md` §1 : virages à 20°/s, montée/descente à 50 m/s au plus,
plancher terrain + 250 m). Même chemin pour la fuite au moral et pour l'ailier qui a quitté le
combat. Dans le portage, les ordres de navigation passent par `SCPilot` (manche) : une fois le mode
pilote automatique de `SCJetpPlane` disponible, ils peuvent l'utiliser. Le combat, lui, reste aux
commandes de manche.

**Manœuvres `MVRS` 8 à 12** : rien à porter. Leurs scores valent toujours 0 et le tournoi les
exclut ; les ID 9 à 12 sont vides. L'ID 8 contient une manœuvre complète (« se caler derrière la
cible ») qui n'est jamais choisie : à ne pas activer si le but est la fidélité.

## 8quinquies. [P2] Les manœuvres `MVRS` : actions confirmées, et deux réflexes à ajouter

Relu le 2026-09-25 (`AI_TICK_CALL_GRAPH.md`, « Les actions confirmées des manœuvres `MVRS` »).
« Trop lent » = décroché ou vitesse indiquée ≤ vitesse minimale de manœuvre ; « trop bas » =
altitude < terrain + 4 × `deck`. Vitesse indiquée = `|v| · √(ρ(alt)/ρ0)`.

### A. Deux réflexes qui passent avant le reste (niveaux 4 et 5)

À appeler dans `tick()` quand aucun comportement n'est en cours (ordre : 5 puis 4), chacun seulement
si `reaction_level ≤` son niveau, et **seulement sans cible et pilote automatique coupé** :
```cpp
// 5 : récupération nez haut / décrochage (ID15), minuteur 2 s
bool needStall = stalled || (indicatedAirspeed <= jdyn.min_speed && nosePitch() > 30.0f);
//     tick : si ejectDecision(1) -> fin ; si nez <= 0 et pas décroché lent -> fin ;
//            si nosePitch() > 60 && stalled -> manette ralenti ; sinon plein gaz et, hors décrochage,
//            pitchTo(-30, zone morte 10)
// 4 : évitement du sol (ID14)
bool needGround = heightAboveGround < ground_clear * (1 + sinDeg(roll()/2)/2)   // entité+0xE1
               || (altitude < floor && verticalSpeed < 0);
//     tick : si ejectDecision(2) -> fin ; si montée et altitude > floor -> pitchTo(+30), plein gaz, fin ;
//            sinon manette cran 1 si nez bas et vitesse > mini, sinon plein gaz ; pitchTo(+30, zone morte 10)
```
Éjection (`AI_EjectDecision_50FF`) : dommages > 80 %, ou décroché (mode 2), ou décroché et sous le
plancher (mode 1) → éjection, réplique 9 (« She's breaking up. Ejecting! ») pour un ailier ami.

### B. Répertoire du tournoi (rôle réel de chaque identifiant)

| ID | Manœuvre | À porter |
|---|---|---|
| 1 | Réacquisition par jambes de 1 s | 1re jambe à ±30° côté cible, puis −60° à chaque jambe, toujours du même côté (bug d'origine), max 4 jambes, fin si cible < 60° du nez |
| 2 | Dégagement | manche latéral à fond du côté du manche actuel (au hasard si neutre), manche tiré à fond |
| 3 | Manœuvre d'énergie | piqué si trop lent, chandelle si trop bas, sinon au hasard ; assiette 5° + 40° × (TH/16)² ; 4 s |
| 4 | Virage défensif (sur alerte de menace) | plein gaz, inclinaison 90° (60° si trop bas) côté cible, tirer ; fin après 90° de cap |
| 5 | Montée verticale + retournement | reprise de vitesse, +90°, roulis vers la cible, tirer jusqu'à 45° ; 5 s |
| 6 | Split-S | monter jusqu'à plancher + 2000, dos, −90°, roulis vers la cible, tirer jusqu'à −45° ; 5 s |
| 7 | Poursuite | interception, point d'anticipation (cible + vitesse × 4 s) quand proche |
| 13 | Prise d'altitude à longue distance | seulement si la cible est à plus de 17 700 et sous le plafond `JDYN+0x86` ; cap sur la cible, chandelle `30° + 30° × (v − croisière)/v_min` (≤ 60°) |
| 16 | Reprendre de la vitesse | vitesse max, assiette +5° jusqu'à (croisière + mini)/2 ; 1,5 s |

## 9. Questions ouvertes (côté rétro-ingénierie, ne pas deviner)

1. ~~Loi de pilotage~~ : complète (§7, relue le 2026-09-25). Reste le rôle des bits 7-8 de `flags_75` (état à 3 valeurs qui réduit le taux de roulis à 60 %) et la nature exacte de `JDYN+0x59`.
2. `Targeting_FilterByWeaponType` : cône et portée exacts du chercheur — §4.
3. Test de verrouillage de l'AGM-65D (méthode `+0x14` du modèle `MISS`, fonction pas encore nommée).
4. ~~Seuil `dword_7203D`~~ : c'est le plancher du pilote, altitude du terrain + `entité+0xE5` (§8quinquies).
5. `BombModel_PredictImpact_41311` : hauteur de chute passée par l'appelant — §2.
6. Champ `+0x13` du nœud d'attaque au sol (bloque l'engagement s'il est non nul).
