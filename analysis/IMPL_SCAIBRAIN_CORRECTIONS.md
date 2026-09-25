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
  ±180° ; si `|écart| > zone morte`, `JDYN_HighLevelPhysicsCalc` convertit l'écart en valeur de
  manche latéral (**fonction non lue**). (0°, 5°) = ailes à plat ; (180°, 5°) = sur le dos.
- `AI_PitchToAngleCmd_7E18(tangage_voulu, zone_morte)` → `AI_PitchController_7B20`, écart `e` :
  - `|e| ≤ zone morte` : manche 0, ailes à plat ;
  - `e < −15°`, ou sur le dos (`|roulis| > 90°`) et `e < 0` : **passer sur le dos** (roulis 180°)
    et, seulement une fois `|roulis| > 165°`, **tirer** : manche normalisé `s = max(1, |e|/15)`
    (toujours au moins la pleine butée) ;
  - sinon : ailes à plat et, seulement une fois `|roulis| < 15°`, `s = e/15` pour `e < 15°`,
    `s = 1` au-delà (négatif = pousser, pour `−15° < e < 0`) ;
  - `s` passe ensuite par `Value_ClampSymmetric` (limite propre à l'avion, **non lue**) : en
    attendant, borner à `[−1, 1]`.
  Les piqués de plus de 15° se font donc **sur le dos, en tirant**.
- Tourner vers une direction : `AI_GuidanceCmd_FromOwnPos` → `AI_GuidanceSolution_Major` →
  `AI_CombatDecision_Major` (écart < 20° : rien ; ≤ 145° : correction proportionnelle ; > 145° :
  correction pondérée par le taux de roulis de l'avion, bornée à 16° ; repli : ailes à plat) →
  commande de roulis.

**Bloquant pour un portage fidèle** : `AI_GuidanceSolution_Major` a été lue avant la découverte de
l'inversion des noms sinus/cosinus et doit être relue ; `JDYN_HighLevelPhysicsCalc` n'a jamais été
lue. **Ne pas remplacer `SetAttitudeError` avant ces deux lectures** (côté rétro-ingénierie).

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
                               REACT_NEW_TARGET = 3, REACT_WAIT_LANDING = 4, REACT_WAIT_TAKEOFF = 5 };
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
        leader_state = 1; lockObjective(); owner->target = player; /* Goal_TransferToWingman */
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
- Avec Billy (`LY = 13`, `FL = 15`) : moral plancher 25 (jamais 5), et `FL + ajustement` reste
  au-dessus de 7 tant que le moral n'est pas 4 ou 5 : **Billy ne fuit pas et ne prend pas
  d'initiative par le moral**. Ses 0x12 viennent de l'entrée en combat (B). Tester le moral avec un
  profil à `LY` et `FL` bas.

**Ordre dans `tick()`** : ordres radio du joueur → esquive (niveau 2) → entrée en combat contre un
attaquant (B) → comportement en cours → `GOAL` (dont 5 = moral, 2 = ordre, 4 = combat, 3 = errance).

**Test.** Profil à faible `LY` et `FL`, camp adverse, après plusieurs pertes : le MiG annonce 8 et
part. Ailier du joueur à faible `LY`/`FL` sur qui le joueur tire, sans autre ennemi : il annonce
0x20 et attaque le joueur.

## 9. Questions ouvertes (côté rétro-ingénierie, ne pas deviner)

1. `AI_GuidanceSolution_Major` (relecture) et `JDYN_HighLevelPhysicsCalc` (lecture) — §7.
2. `Targeting_FilterByWeaponType` : cône et portée exacts du chercheur — §4.
3. Test de verrouillage de l'AGM-65D (méthode `+0x14` du modèle `MISS`, fonction pas encore nommée).
4. Seuil `dword_7203D` de l'esquive et de la poursuite — §5.
5. `BombModel_PredictImpact_41311` : hauteur de chute passée par l'appelant — §2.
6. Champ `+0x13` du nœud d'attaque au sol (bloque l'engagement s'il est non nul).
