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

## 0bis. [P1] Les traits `ATRB` sur l'entité : l'ordre du fichier n'est pas l'ordre en mémoire (corrigé le 2026-09-25)

`PilotProfile_LoadATRB_12E47` range les 10 octets du fichier (ordre `TH, CN, VB, LY, FL, AG, AA,
SM, AR, 10e`) **dans le désordre** : profil `+0x97, +0x99, +0x98, +0x9A, +0x96, +0x9B, +0x9C, +0x9D,
+0x9E, +0x9F` (10e borné à 3). Le profil est le sous-objet à `entité+0x1A` (constructeur de
l'entité IA : `mov word ptr es:[bx+1Ah], 368h`, vtable dont le 1er slot est ce chargeur), donc
`entité+0xB0 + i` = profil `+0x96 + i` :

| Entité | Trait | Ancienne lecture (fausse) | Qui le lit (noms actuels) |
|---|---|---|---|
| `+0xB0` | **`FL` (Flying)** | `TH` | voir la liste ci-dessous — c'est le trait qui **pilote l'avion** |
| `+0xB1` | `TH` (Trigger Happy) | `CN` | `Pilot_SkillCheck_B1` (depuis `AI_WeaponRecoveryBusy_9027`) |
| `+0xB2` | `VB` (Verbosity) | `VB` | `Radio_CanPlayMessage` |
| `+0xB3` | **`CN` (Confidence)** | `LY` | `AI_ComputeMorale_CD4A` (paliers 3/6/12/15) |
| `+0xB4` | **`LY` (Loyalty)** | `FL` | `AI_MoraleDisciplineCheck_CA93` (tient son rôle si `LY` + moral > 7), `AI_MessageDispatcher` (> 14) |
| `+0xB5` | `AG` | `AG` | attaque au sol |
| `+0xB6` | `AA` | `AA` | `Pilot_ReactionThreshold_B6` (tir) |
| `+0xB7` | `SM` | `SM` | `Pilot_SkillCheck_B7` |
| `+0xB8` | `AR` | `AR` | poids du choix de cible |
| `+0xB9` | 10e octet (≤ 3) | — | — |

Même valeurs par défaut sans chunk : 10 pour `FL`, `AG`, `AA` ; 8 pour les autres ; 0 pour le 10e.
`FL`, `AG` et `AA` sont en plus décalés selon la difficulté (`PilotProfile_RescaleSkillByDifficulty_12FC9`).
Billy : `FL` = 15, `TH` = 10, `CN` = 14, `LY` = 13.

**À faire dans le portage** : garder la lecture du fichier dans l'ordre, mais faire lire à chaque
consommateur le **bon** trait. Tout code écrit d'après les anciens documents avec
`atrb.TH` là où l'original lit `+0xB0` doit lire `atrb.FL`, `CN` → `TH`, `LY` → `CN`, `FL` → `LY`.

### Le pilotage `FL` conduit l'avion

Tous les usages de `entité+0xB0` retrouvés :
- **Autorité au manche de tangage** : `±9·max(FL, 8)/G` (`AI_ClampPitchStick_5305`, posé par
  `AIAircraft_LoadProfileGuarded_73940`) — un `FL` faible tire moins fort (§7).
- **Garde au sol** `entité+0xE1 = min(9·max(FL, 8)/32, 5)` (même fonction), lue par l'évitement du
  sol (ID14).
- **Assiette des manœuvres d'énergie** (ID3) : `5° + 40° × (FL/16)²`.
- **Reprendre de la vitesse** (ID16) : score 1 seulement si `FL < 12` — seuls les pilotes moyens le font.
- **Vitesse de manœuvre** : `AI_ManeuverSpeedCmd_ED1E` divise la vitesse par 2 si
  `Pilot_SkillCheck_B0` réussit et que je suis plus lent que la cible.
- **Choix de cible** : `AI_TopLevelThink` n'appelle `Targeting_AcquireBestThreat(…, 0)` que si `FL ≥ 12`
  **et** `byte_6E4D7` (un missile air-air — WDAT `target_domain` = 1 — a été ajouté à la liste des objets du
  monde au cycle précédent : `byte_6E4C6` posé en seg088/seg092, décalé par `RadioFlags_ShiftHistory`) ; porte `(rand & 15) + 1 ≤ FL + si` par candidat ; poids
  `(AR − FL) + 16` et `(FL − AR) + 16` ; bonus `FL²/16 − 8` pour les missiles.
- **Alerte de menace** (`AI_IncomingThreatWarning`) : seuil `FL ≥ 13` puis jet de pilotage.
- Scores des manœuvres ID1, ID2, ID3, ID7 (jet avec modificateur −7) ; `AI_EvalTargetAttribute` ;
  `AI_WeaponRecoveryBusy_9027` (minuteur/portée).
- **Cadence de recherche de cible** (`entité+0x179`, tracé le 2026-09-25) : masque `M` = 15 si
  `FL < 4`, 7 si `FL < 11`, sinon 3 (`PilotProfile_LoadNUMSCompanionFile_73FB4`). Un pilote faible
  re-cherche sa cible **moins souvent** :

  | `FL` | Sans cible aérienne, sous menace missile ou avec cible sol (tournoi) | Entrée en combat contre un attaquant |
  |---|---|---|
  | 0–3 | toutes les 16 s | toutes les 8 s (et dès qu'il est touché) |
  | 4–10 | toutes les 8 s | toutes les 4 s |
  | 11–16 | toutes les 4 s | toutes les 2 s |

  ```cpp
  // entité : clock (s), mask M, deux fenêtres « une fois par période »
  clock += dt;                                           // départ décalé de 0,098 s par entité créée
  int t = (int)floorf(clock);
  bool slowWindow() { if (!slowFired && (t & M) == 0) { slowFired = true; return true; } return false; }
  bool fastWindow() { if (!fastFired && (t & (M >> 1)) == 0) { fastFired = true; return true; } return false; }
  // chaque tick (AIEntity_MasterTick_5ACC) : si la fenêtre s'est refermée, réarmer
  if (slowFired && (t & M) != 0) slowFired = false;
  if (fastFired && (t & (M >> 1)) != 0) fastFired = false;
  ```
  `slowWindow` : `AI_RetargetWindowSlow_A288` (tournoi, `AI_BehaviorStateMachine_WeightedOptionSelector_9D05`) ;
  `fastWindow` : `AI_RetargetWindowFast_A2BD` (`AI_EngageAttackerReaction_E246`). Avec une cible
  aérienne vivante, le tournoi ne re-cherche pas ; il re-cherche aussitôt si son pilote s'est éjecté
  (bit 5 de `flags_75`), et à chaque appel s'il n'a rien du tout.

  **Porté le 2026-09-28** (`SCAIBrain`) : `retargetSlowWindow` / `retargetFastWindow`, horloge décalée de
  0x19/256 s par cerveau créé (`SCMission::ai_clock_stagger`), masque fixé au constructeur ; trois appels
  distincts : début du tick (`aa_missile_launched_last` et FL ≥ 12, argument 0), début de `combatStep`
  (logique du tournoi, argument `ground_allowed`, arrêt si rien n'est trouvé), début de
  `engageAttackerReaction` (touché ou fenêtre rapide, argument 0). `acquireBestThreat` renvoie « un gagnant,
  missile compris ». 4e appel : `AIEntity_OnBehaviorEnded_A1DF`, fin normale d'un comportement sans comportement précédent (voir §14).

## 1. [P1] Attaque au sol : condition inversée entre les phases 0 et 1

**Où.** `SCAIBrain::updateGroundAttack`, ligne 771 :
```cpp
} else if (horizontal_distance > 8000.0f || !aligned) {   // FAUX
```
**Original** (`GroundAttack_Phase01_Approach_77282`, `cmp [bp+var_4], 1F4000h` puis
`cmp [bp+var_16], 0AA00h`) : phase 1 quand l'avion est **loin (> 8000 m) OU aligné (> 170°)**.
**Correction** : `|| aligned`.

**Effet attendu** : l'avion ne tourne plus en rond à ~5000 m entre les phases 0 et 1.

**Fait le 2026-09-25** (à valider en jeu). Entre 5000 et 8000 m, un avion non aligné garde sa phase
(hystérésis de l'original).

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

**Fait le 2026-09-25** (à valider en jeu). Le pilote automatique est dans **`SCPilot`** (tout le
pilotage au même endroit) : `engageAutopilot`, `setAutopilotTarget`, `disengageAutopilot`,
`autopilotActive`, `autopilotReached`. La loi tourne dans `SCPilot::FlyTo` (à chaque image, juste
après `plane->Simulate`) et envoie un `PlaneKinematicEvent` (vitesse monde en m/s, cap, tangage,
roulis en dixièmes de degré ; `engaged = false` rend la main). L'avion (`SCPlane`) n'a plus qu'un
mode cinématique sans décision : `SCJdynPlane` et `SCJetpPlane` sautent leur physique, appliquent
l'état reçu, avancent la position et convertissent la vitesse dans leur unité interne
(`syncKinematicVelocity`). Côté cerveau : la
phase 2 engage (un tick), la phase 3 ne donne plus d'écarts d'attitude, le repli `angle < 90°` est
remplacé par « point atteint » → phase 0 ; le pilote automatique est coupé au largage, en phases
0/1/4, sur arme non gérée, à toute interruption (`resetGroundAttack`, y compris pendant une
esquive). Le choix de l'arme reste fait en phase 3. Les missions créent toujours des `SCJdynPlane`.

**Essai du 2026-09-25 (STERN, MK-82)** : approche alignée, phase 1 → 3 à 5094 m ; en phase 3 l'écart
prévu décroît (785, 581, 367, 165 m) ; largage à `miss = 26 ≤ tolerance = 28`, une cible au sol
détruite ensuite. Vitesse de 436 à 201 m/s en phase 3 (vitesse voulue de 100 m/s, conforme). Reste à
observer : la sortie du pilote automatique et la phase 4.

**Essai 2 du 2026-09-25** : 2ᵉ largage réussi (`miss = 23 ≤ 32`) ; sortie du pilote automatique sans
saut (vitesse ~300 m/s, phase 4 cabrée sans à-coup). Cible au sol détruite désormais libérée par
`SCMissionActors::destroyTarget` (test `target->is_destroyed` ajouté ; avant, seules les cibles
avions l'étaient) ; le script enchaîne sur la cible suivante. **Nouveau défaut** sur la 2ᵉ cible,
arrivée de dos : en phase 1, l'écart de cap plafonne à ~22° sur 3 km (angle 157°) avec une consigne
de piqué de ~9° ; `SCPilot` en mode attitude incline (~55°) mais la consigne de piqué annule la
traction, l'avion ne tourne presque plus ; à 5000 m non aligné → phase 0, nouvelle boucle.
L'original, au-delà de 20° d'écart (et piqué voulu < 10°), incline puis tire à fond
(`AI_CombatDecision_Major`, §7).

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

**Fait le 2026-09-25 (modèle complet)** : `Targeting_FilterByWeaponType` et `Proximity_TestPoints` lus.
Candidat = l'objet de type 1 (avion) ou 4 (leurre) de **plus forte signature** parmi ceux à distance
`0 < d ≤ target_range` du porteur et à moins de **`tracking_cone` degrés** de son nez
(`dot ≥ cos(cone)` ; le portage testait à tort `90 − cone`). `SCAIBrain::seekerSelect` reproduit
`Targeting_SelectAndPrioritize` (garde ou vol de piste selon l'aspec, poids 5 si le candidat est le
joueur — lien `vtable+0x38 == word_722E6` non prouvé —, aspect arrière de l'AIM-9J sur la cible
gardée) ; tir si le chercheur garde la cible voulue. Non porté : leurres (aucun objet `DECY` dans le
monde du portage) et réévaluation du chercheur par le missile en vol (code du missile).
Ancienne note :
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

**Porté le 2026-09-25 dans `SCPilot`** (à valider en jeu, avions encore en `SCJdynPlane`) :
`SetGuidanceDirection` (`guidanceSolution` + `combatDecision`), `SetPitchCommand` (`pitchToAngle`),
`rollToAngle`, `bankError`, `rollStickFromError`, `clampPitch`. Sortie : manche normalisé [−1, 1]
dans `PlaneControlEvent` (`normalized_stick`), converti par l'avion (×160 pour `SCJdynPlane`,
direct pour `SCJetpPlane`). Conventions libRealSpace : cap « boussole » `−atan2(x, z)` (écart > 0 =
à droite), inclinaison > 0 = vers l'aile droite (`−signedRoll/10`), manche x > 0 = roulis à droite,
y > 0 = tirer. `deck` = 200 m (`entité+0xE5 = 0C800h`, `AIAircraft_LoadProfileGuarded_73940`).
Simplifications : vitesse indiquée = vitesse vraie ; `maxRollRate` sans la réduction près du
décrochage ni le cas `flags_75` ; décrochage = ancien anti-décrochage de `SCPilot`. Utilisé par la
poursuite (direction vers le point d'anticipation), l'attaque au sol (phases 0/1 : direction ;
palier > 9000 m et piqué −40° de l'original ; phase 4 : +5°), l'esquive (direction horizontale).
Le cerveau efface la commande au début de chaque tick (`ClearGuidance`).

**Écart assumé (décision de Rémi, 2026-09-25)** : en phase 0 de l'attaque au sol, la direction
d'éloignement est horizontale (composante verticale annulée). Avec le vecteur complet de l'original
(`moi − point visé`), l'IA montait à 45° jusqu'à ~15 km, puis ne parvenait plus à se réaligner en
piqué (bascule entre « ailes à plat, pousser » et « incliner puis tirer » autour du seuil de 145°).
Le 3ᵉ argument de `AI_GuidanceCmd_FromOwnPos` (10) n'est pas lu par `AI_CombatDecision_Major` :
il ne borne rien.

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
    `L = 9 · max(FL, 8) / G` (`FL` = trait Flying, `entité+0xB0`, `G` = facteur de charge max
    `JDYN+0x67`), sur l'échelle du manche de l'original où **16 = butée** ; sur un axe `[−1, 1]`,
    borner à `±min(1, L/16)`. Exemple : `FL` = 8, G = 9 → L = 8 → la moitié de la butée.
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
// clampPitch(x) = AI_ClampPitchStick_5305 : ±9·max(FL, 8)/G.
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

**Conséquences pour l'IA (2026-09-25)** :
- La conversion de l'IA est l'**inverse exact** de la loi de roulis de l'avion : l'IA calcule un
  taux voulu `w`, envoie `w / maxRollRate()` au manche, et l'avion rend `manche × maxRollRate()`.
  `rollStickFromError` doit donc appeler **la même** `maxRollRate()` que `SCJetpPlane`
  (`IMPL_SCJETPPLANE_CORRECTIONS.md` §8bis), sinon l'IA dépasse ou n'atteint pas ses angles.
  Le gain de dégâts aileron n'entre que côté avion : avec un aileron touché, l'IA roule moins vite
  qu'elle ne le demande (effet voulu de l'original).
- F-16 à 25 images/s (dt = 0,04 s, `A·dt` = 21,6 °/s) : écart 2° → 30 °/s (manche 0,11) ; 10° →
  85 °/s (0,31) ; manche à fond au-delà de ~78°. Utiliser le vrai `dt` du tick.
- Sous 50 m/s ou au-delà de 25° d'angle d'écoulement, le roulis est réduit : comme
  `combatDecision` ne tire qu'une fois l'inclinaison atteinte, l'IA **attend plus longtemps avant
  de tirer** — autolimitation naturelle près du décrochage.
- Autorité au manche `9·max(FL, 8)/G` sur 16 : en fraction de la butée,
  `0,5625·max(FL, 8)/G`. Si la loi de charge est proportionnelle au manche (butée =
  `JDYN` n°22 = G max, `PHYSICS.md` §5.7), le **facteur de charge maximal de l'IA vaut
  `0,5625 × max(FL, 8)` G quel que soit l'avion** (4,5 G à 8, 9 G à 16), borné par le G max.
- `K/270` (`JDYN+0x71`/270) vaut 1 pour le F-16 : un avion qui roule moins vite tire aussi moins
  fort pour le même écart.

**`JDYN+0x59` (champ n°17) = vitesse d'efficacité des gouvernes, confirmé** : 50 m/s pour le F-16
(`F-16DES.IFF`). Il est comparé à la vitesse (`mov eax, [si+59h] / cmp eax, [bp+var_4]`) et, dans
`Aero_ApplyGroundEffect`, à la vitesse air sur l'axe du nez ; ce n'est pas un plafond d'effet de
sol. Valeurs F-16 utiles ici : accélération de roulis `JDYN+0x47` = 540 °/s², taux de roulis max
`JDYN+0x71` = 270 °/s (le `K/270` de `combatDecision` vaut donc 1 pour le F-16), décrochage 30°,
G max 9 (→ inclinaison max 90°, autorité au manche `max(FL, 8)` sur 16).


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

**Étape 1 faite le 2026-09-25** (à valider en jeu) : `SCAIBrain::combatStep(sol_autorisé)` (tir +
poursuite si cible aérienne ; attaque au sol si autorisé et cible sol acquise ; sinon `false`) ;
`destroyTargetOrder` (ordre « détruire » du cerveau, d'après `Goal_ExecuteAction_A8AC` : cible sol de
mission → attaque au sol ; sinon `combatStep(false)` ; renvoie « a agi », et pose
`current_command_executed` quand la cible est détruite — booléen gardé par décision de Rémi) ;
`GOAL` 4 → `combatStep(false)`. `tick()` : ciblage (comme `AI_TopLevelThink`), réaction à un missile,
puis `GOAL`. Aiguillage unique `brain_orders_enabled` dans `executeGoalAction` ; tests `brain->…`
retirés de l'ancien `destroyTarget` (encore utilisé par « défendre » et, pour les armes sol non
portées, par l'ordre du cerveau). Écart : sans cible aérienne acquise, l'ordre « détruire » air ne
dirige plus l'avion vers la cible (l'original passe au `GOAL` suivant).

**Étape 2 faite le 2026-09-25** (à valider en jeu) : ordre « défendre la cible » dans le cerveau
(`defendTargetOrder`), d'après `Goal_SetObjective_A307` case 0xA8 (référence de navigation `+0x10F`
et cible de mission `+0x137` = l'objet défendu), `Goal_ExecuteAction_A8AC` case 0xA8
(`AI_NavSolutionToPoint`, sinon `combatStep(false)`, sinon errance) et `Goal_IsComplete` case 0xA8
(terminé quand l'objet défendu disparaît). Navigation : au-delà du rayon d'arrivée par défaut
(`entité+0x139 = 0x7530` = 30 000 m, écrit par le constructeur), nez remis à l'horizontale puis
pilote automatique de `SCPilot` vers l'objet à 250 m/s (`entité+0x141 = 0FA00h`). Errance : point à
30 000 m dans une direction aléatoire (`Goal_WanderRandom`), renouvelé à 2 km (seuil du portage),
suivi par la loi de pilotage. Le pilote automatique de navigation est coupé dès que la navigation
n'est plus demandée (autre ordre, esquive). Écart : l'objet défendu n'est pas copié dans
`owner->target` (bonus de ciblage de la cible de mission non reproduit pour cet ordre).

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
    if (just_hit || fastWindow()) this->acquireBestThreat(false);   // bit 7 de +0x28D / AI_RetargetWindowFast_A2BD (§0bis)
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

**A et B faits le 2026-09-25** (à valider en jeu) : `reaction_level` sur `SCAIBrain` (niveau 2 =
esquive en cours) ; tir et poursuite de `combatStep` seulement si niveau ≤ 1 ;
`engageAttackerReaction` appelée après l'esquive et avant `GOAL` (si elle agit, `GOAL` est sauté) ;
`just_hit` posé par `SCMissionActors::hasBeenHit`, effacé en fin de tick ; ordre « suivre » dans le
cerveau (`followAllyOrder` : vol en formation par `followAllyFormation`, l'ancien réflexe
`destroyTarget(attacker)` n'étant plus utilisé ; `leader_state` 3 → `combatStep(false)` jusqu'à la
destruction de l'avion engagé). Écarts : pas de fenêtre de re-ciblage rapide (le ciblage tourne à
chaque tick) ; tous les avions éligibles (classe de modèle ≥ 9 non établie) ; branche « errance »
réduite à la demande d'un nouveau point d'errance ; `leader_state` 0 → 3 sur attaquant dans les six
heures du joueur (réplique 0x10) non fait.

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
    int CN = atrb.CN;                               // +0xB3 = Confidence (corrigé 2026-09-25, §0bis)
    s += CN < 3 ? 0 : CN < 6 ? 15 : CN < 12 ? 30 : CN < 15 ? 50 : 75;
    if (enemies_alive > 0 && s >= 80) s = 79;
    if (CN > 9 && s < 25) s = 25;
    if (CN <= 0) s = 0;
    return s < 25 ? 5 : s < 50 ? 4 : s < 80 ? 3 : 2;   // 5 panique … 2 bon
}
bool SCAIBrain::isDisciplined() {                   // AI_MoraleDisciplineCheck_CA93, réévalué toutes les 3 s
    static const int adj[4] = {+7, +4, -3, -5};      // moral 2, 3, 4, 5
    return atrb.LY + adj[morale - 2] > 7;           // +0xB4 = Loyalty (corrigé 2026-09-25)
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
- Avec Billy (`CN = 14`, `LY = 13`) : score plancher 25, donc moral 4 au pire (jamais 5), et
  `LY + ajustement` vaut au moins 13 − 3 = 10 > 7 : il est **toujours discipliné**. **Billy ne fuit
  pas et ne prend pas d'initiative par le moral**. Ses 0x12 viennent de l'entrée en combat (B). Tester le moral avec un
  profil à `CN` et `LY` bas.

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

**Test.** Profil à faible `CN` et `LY`, camp adverse, après plusieurs pertes : le MiG annonce 8 et
part. Ailier du joueur à faible `CN`/`LY` sur qui le joueur tire, sans autre ennemi : il annonce
0x20 et attaque le joueur.

**C fait le 2026-09-25** (à valider en jeu) : `computeMorale` à chaque tick ; discipline réévaluée
toutes les 3 s ; `moraleReaction` sous `GOAL` 5, au plus toutes les 5 s ; ordres radio du joueur
(`tryActiveWingman`) sortis en tête de `tick()` ; `objective_locked` respecté par
`SCMissionActors::setObjective` ; états d'ailier 0 (formation, déverrouille), 1 (combat libre :
`combatStep(true)`, ou le joueur comme cible en cas de mutinerie), 2 (a quitté : navigation),
3 (cible précise). Choix du portage (points non tracés) : « composant endommagé » = une santé de
`system_health` sous sa valeur `SYSM` ; ennemis et pertes comptés sur les acteurs avec avion ;
`enemies_active` = un ennemi vivant à moins de `range_far` (45 km) ; « le joueur me tire dessus » =
dernier attaquant (`hasBeenHit`) = joueur ; destination de fuite et de retraite = point de départ
+ 1000 m (objet `word_706A0` non lu), rayon d'arrivée 2 km puis errance. Logs : `flees`,
`leaves the fight`, `turns on the player`, `engages on its own`.

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
| 3 | Manœuvre d'énergie | piqué si trop lent, chandelle si trop bas, sinon au hasard ; assiette 5° + 40° × (FL/16)² ; 4 s |
| 4 | Virage défensif (sur alerte de menace) | plein gaz, inclinaison 90° (60° si trop bas) côté cible, tirer ; fin après 90° de cap |
| 5 | Montée verticale + retournement | reprise de vitesse, +90°, roulis vers la cible, tirer jusqu'à 45° ; 5 s |
| 6 | Split-S | monter jusqu'à plancher + 2000, dos, −90°, roulis vers la cible, tirer jusqu'à −45° ; 5 s |
| 7 | Poursuite | interception, point d'anticipation (cible + vitesse × 4 s) quand proche |
| 13 | Prise d'altitude à longue distance | seulement si la cible est à plus de 17 700 et sous le plafond `JDYN+0x86` (F-16 : 10 973 m = 36 000 ft, entier tel quel) ; cap sur la cible, chandelle `30° + 30° × (v − croisière)/v_min` (≤ 60°) |
| 16 | Reprendre de la vitesse | vitesse max, assiette +5° jusqu'à (croisière + mini)/2 ; 1,5 s |

## 8sexies. État d'implémentation complet (2026-09-25, à valider en jeu)

Tout ce document est porté, sauf le §6 (qualité de solution au canon avec le vecteur de l'arme :
le calcul de `AI_Sensor_WeaponVelocityCache` n'est pas lu) et le GBU-15 / AGM-65D (données `DATA`
+0x61 non chargées ; l'ancien code prend la main).

- **Tournoi et manœuvres** (`SCAIManeuvers.cpp`, même classe `SCAIBrain`) : contexte de combat
  d'après `MVRS_BuildCombatContext_E5A4` (angles 3D = `Targeting_ComputeBearingElevation_55B1A`,
  projection = `Targeting_ComputeGeometryHelperB_5517F`) ; scores 1 à 7 transcrits ligne à ligne
  (branches mortes de l'original conservées dans le résultat), 13 à 16 et 19 d'après leurs résumés
  relus ; tournoi à 8 nœuds fixes + entrées du fichier (25 au plus), bruit ±1, plancher −1000 ;
  application et tick de 1 à 7, 13 à 16, 19 ; jambes ID20 ; éjection (`AI_EjectDecision_50FF`).
  `combatStep` : tir/poursuite seulement si le tir part ou si la qualité de solution est > 0 (sinon
  manœuvre en cours, sinon tournoi), comme `AI_BehaviorSelector`.
- **Réflexes** 14 (sol) et 15 (décrochage) en tête de tick, niveaux 4 et 5 ; **alerte de menace**
  → ID4 hors tournoi.
- **§0bis** : lecteurs de `+0xB0` corrigés (`FL` au lieu de `TH`) ; cadence de re-ciblage :
  `FL` ≥ 12 → chaque tick, sinon fenêtre lente `entité+0x179`, sans cible ou touché.
- **§3** : ailes à plat avant la phase 2, vitesse de croisière du profil, identifiant 7 dans l'ordre
  des armes, LAU-3 tiré 3 s après l'entrée en phase 3.
- **§4** : aspect arrière de l'AIM-9J (`dot(v_porteur, v_cible) ≥ 0`).
- **§5** : composante verticale de l'esquive sur le plancher, vitesse max du profil, plainte 0x0E.
- **§8quater** : les ordres « aller au point / à la zone » et l'errance volent au pilote
  automatique (le calcul d'arrivée reste l'ancien).
- Le tir n'a plus lieu hors du gestionnaire de combat (appel global retiré de `tick()`).

**Approximations du portage (points non tracés)** : classe de modèle (`+0x52`) des cibles
considérée > 6 pour tous les chasseurs ; vitesse indiquée par l'atmosphère standard ; loi de
manette de `AI_ThrottleController_6250` remplacée par un réglage à trois crans autour de la vitesse
voulue ; « avion » (`byte_720DF`) toujours vrai pour l'IA ; `AI_InterceptDispatcher` réduit au
guidage vers la cible ; alerte de menace (`AI_IncomingThreatWarning`, non détaillée) : ennemi qui
me vise à moins de 1800 m en rapprochement, `FL` ≥ 13 et jet de pilotage ; vecteur mémorisé du
dégagement (ID2) = `unknown_vector` du `NUMS` ; garde au sol `entité+0xE1` prise telle quelle
(≤ 5 m, déclenchement surtout par « sous le plancher en descente »).

## 9. Questions ouvertes (côté rétro-ingénierie, ne pas deviner)

1. ~~Loi de pilotage~~ : complète (§7, relue le 2026-09-25). Reste le rôle des bits 7-8 de `flags_75` (état à 3 valeurs qui réduit le taux de roulis à 60 %) et la nature exacte de `JDYN+0x59`.
2. `Targeting_FilterByWeaponType` : cône et portée exacts du chercheur — §4.
3. Test de verrouillage de l'AGM-65D (méthode `+0x14` du modèle `MISS`, fonction pas encore nommée).
4. ~~Seuil `dword_7203D`~~ : c'est le plancher du pilote, altitude du terrain + `entité+0xE5` (§8quinquies).
5. `BombModel_PredictImpact_41311` : hauteur de chute passée par l'appelant — §2.
6. Champ `+0x13` du nœud d'attaque au sol (bloque l'engagement s'il est non nul).

## 11. [P1] Décollage (`0xA1`) et atterrissage (`0xA2`) : chunks `TOFF` et `LAND` (relu le 2026-09-26)

Les deux ordres ne sont **pas** des manœuvres pilotées : ce sont deux **comportements** (objets à
vtable, comme les nœuds `MVRS`) créés par `Goal_ExecuteAction_A8AC`, poussés comme comportement en
cours (`Behavior_PushRunning_756A4`, tick par `AI_TopLevelThink` étape 4), et dont l'essentiel est
**cinématique** : l'avion est déplacé directement, la physique est rendue ou coupée à des moments précis.
Au sol, `AI_TopLevelThink` appelle `Goal_ExecuteAction_A8AC` sans regarder le `GOAL` : le décollage
s'exécute toujours.

### A. Chunk `TOFF` (`REAL/OBJT/JETP/TOFF`, 4 words, lu par `TakeoffBehavior_Start_11D03`)

| # | Champ | Défaut | Rôle |
|---|---|---|---|
| 0 | `roll_accel` | 20 | accélération au roulage, m/s² |
| 1 | `rotate_speed` | 150 | vitesse de fin de roulage, m/s |
| 2 | `climb_pitch` | 30 | assiette de montée, degrés |
| 3 | `pitch_gain` | 8 | gain de la tenue d'assiette (manche pleine butée = 16) |

### B. Décollage (`seg009`)

Au démarrage : fin immédiate si l'avion va déjà à plus de 10 m/s ; caméra `TAKEOFF` pour le joueur ;
cap de piste pris sur le nez de l'avion, **seulement s'il est axial** (0°, 90°, 180°, 270°) ; train sorti.
1. **Roulage cinématique** (`Takeoff_Phase0_GroundRoll_120E8`) : manche au neutre, plein PC (cran 10),
   avion en mode cinématique ; `vitesse = roll_accel × t`, la position avance de `vitesse × dt` sur l'axe
   de piste. Quand `vitesse > rotate_speed` : `JDYN_JumpToPoint_49242` rend l'avion à la physique à cette
   vitesse, nez à plat sur l'axe.
2. **Montée** (`Takeoff_Phase1_ClimbOut_12472`) : aérofrein rentré, plein PC, volets sortis ; tenue
   d'assiette `climb_pitch` (`AI_PitchAttitudeHold_126CC` : `manche = borne((consigne − assiette) ×
   pitch_gain / 8, ± pitch_gain)`, tronqué à l'entier) jusqu'à **300 m au-dessus du sol**, puis cran 5 (MIL).
3. **Train et volets rentrés** (`Takeoff_Phase2_GearFlapsUp_125C2`).
4. **Mise en palier** (`Takeoff_Phase3_LevelOff_125EC`) : MIL ; si l'assiette dépasse 17° : manche plein
   piqué (−16) ; sinon manche +8 et fin au tick suivant.

Complétion (`Goal_IsComplete`) : l'objet de type `0x11` reste en `entité+0x15`, donc l'ordre n'est pas
relancé.

### C. Chunk `LAND` (`REAL/OBJT/JETP/LAND`, lu par `LandingBehavior_Start_75746`)

| # | Type | Champ | Défaut | Rôle |
|---|---|---|---|---|
| 0 | word | `approach_speed` | 200 | vitesse d'approche et de toucher, m/s |
| 1 | dword | — | `0x64` brut | **jamais relu** |
| 2 | word | `aim_height` | 6 | hauteur du point visé au-dessus du point de toucher, m |
| 3 | word | `pitch_steps` | 20 | borne du compteur d'assiette (1°/tick) |

### D. Atterrissage (`ovr230`)

L'ordre résout **deux spots** (`MissionScript_CallNativeHandler_52513`) : le 2ᵉ opérande de
l'instruction donne le **point de toucher** (`entité+0x11F`), le 1ᵉʳ le **point d'approche**
(`entité+0x12B`) (`Goal_SetObjective_A307`). Au démarrage : **l'IA est téléportée au point
d'approche** ; le joueur est refusé si le composant `LANDGEAR` est endommagé (« Landing Gear Damaged »)
ou si `UIScreen_RenderOrLayoutList_54503` refuse (condition non tracée).
1. **Mise en place** (`Landing_Phase1_SetupApproach_75D51`) : cible = toucher + `aim_height` ; vitesse
   physique 0, mode cinématique, train sorti ; ailes et nez à plat sur l'axe de piste (axial) ;
   durée = distance / `approach_speed`. Joueur : d'abord replacé à 500 m avant le toucher
   (`Landing_PlacePlayerOnFinal_75AA6`), caméra `LANDING`.
2. **Approche** (`Landing_Phase2_Approach_76325`) : ligne droite départ → cible à `approach_speed` ;
   facteur de charge affiché 1,0 ; le nez tourne de +1° par tick tant que le compteur (−1 par tick) ne
   passe pas sous `pitch_steps`.
3. **Toucher et roulage** (`Landing_Phase3_TouchdownRoll_765B2`) : posé sur la cible, roule sur l'axe à
   `approach_speed` ; le nez revient de 1° par tick jusqu'à `pitch_steps / 6` ; puis orientation à plat
   (joueur : événement de script d'atterrissage).
4. **Freinage** (`Landing_Phase4_Braking_76C09`) : `vitesse = ent(approach_speed) − 2 × ent(t)`
   (secondes entières, par paliers), jusqu'à 0.
5. **Arrêt** (`Landing_Phase5_Stop_76E67`) : vitesse 0, posé sur le terrain, volets rentrés, moteur
   coupé (cran `0xFF`) ; joueur : drapeau « posé » (`byte_706AF`) ; IA : fin.

### E. Ce que fait le portage aujourd'hui

`SCMissionActors::takeOff` : montée pilotée de 1000 m (`target_climb`), terminée à 10 m près.
`SCMissionActors::land` : vol vers le spot, terminé à 2 km. `RSEntity::parseREAL_OBJT_JETP_TOFF` et
`..._LAND` sont vides. `SCProg` ne transmet qu'un argument à `OP_SET_OBJ_LAND` (l'original en utilise
deux). À porter avec le mode cinématique de `SCPlane` (`kinematic_mode`, déjà utilisé par le pilote
automatique) et `SCPilot` pour la tenue d'assiette.

### F. Fait le 2026-09-26 (syntaxe vérifiée, à valider en jeu)

- `RSEntity` lit `TOFF` (`takeoff_roll_accel`, `takeoff_rotate_speed`, `takeoff_climb_pitch`,
  `takeoff_pitch_gain`) et `LAND` (`landing_speed`, `landing_unused`, `landing_aim_height`,
  `landing_pitch_steps`), avec les valeurs par défaut de l'original.
- `SCProg` : l'ordre `OP_SET_OBJ_LAND` prend son 2ᵉ spot dans l'instruction `OP_SPOT_DATA` (opcode 9)
  qui le suit, comme `Expr_VM_ReadNextToken_50F85` → `SCMissionActors::current_command_arg2`
  (`0xFF` si absent : repli sur l'ancien `SCMissionActors::land`).
- `PlaneKinematicEvent` peut placer l'avion (`set_position`) ; `SCPilot` a un mode « opérations au
  sol » (`BeginGroundOps`, `CmdGroundControls`, `CmdKinematic`, `CmdPlaceAt`) qui court-circuite les
  automatismes de `FlyTo` (gaz coupés au sol, train rentré en vol, anti-décrochage).
- `SCAIBrain::takeoffOrder` et `SCAIBrain::landingOrder` (dans `SCAIBrain.cpp`) reproduisent les phases
  B et D. Comme dans `AI_TopLevelThink`, le comportement n'avance que par `executeGoalAction()` : au sol
  toujours, en vol seulement si le `GOAL` contient 2 (sinon l'avion garde son dernier manche, nez vers le
  ciel, observé par Rémi avec `GOAL = 5, 1`). Menaces sautées en `0xA1`/`0xA2` ; réflexes et esquive sautés
  tant qu'un comportement est en cours ; l'entrée en combat contre un attaquant reste active. Le cerveau
  tourne à 25 Hz : « 1° par tick » est repris tel quel.
- Tracé le 2026-09-26 (plus d'approximation) : spot absent → (0, 0, 0) (`Player_ResolveAttachPointN_5305A`) ;
  après décollage ou atterrissage, un nouvel ordre du même type est aussitôt accompli (l'objet reste en
  `entité+0x15` / `+0x11`) ; l'avion atterri reste en mode cinématique (`+0x59` jamais remis à 0).
- **Indéfini dans l'original** : sur une piste non axiale, le cap (`+0x58` / `+0x9F`) n'est jamais écrit et
  l'allocateur (`PagedResourceB_Write_5D555`) ne met pas la mémoire à zéro → valeur résiduelle du tas. Le
  portage suit l'axe du nez et l'écrit dans le log : **décision de Rémi à prendre**.
- **Convention de sol à trancher** : l'original pose l'avion arrêté à `terrain + Aircraft_GroundClearance_3E5A6`
  (4,81 m à plat, 3 points de contact), la même garde que `PhysicsTicks` utilise pour le drapeau « au sol ».
  `SCJetpPlane` met l'origine au niveau du terrain (contact à +0,5 m) ; l'atterrissage suit pour l'instant
  cette convention du portage. Porter la garde au sol concerne toute la physique au sol.

## 12. [P1] Vol en formation (ordre `0xAA`) — relu et porté le 2026-09-27

Chaîne : `Goal_ExecuteAction_A8AC` (`0xAA`) → `Goal_SelectTransition` → `Goal_FollowAllyExec` →
`Formation_GuidanceSolution` (+ `Goal_FollowAllyFormation` pour le poste). Hors formation :
`Goal_FollowWaypoints` (rejointe). Détail des formules dans les résumés de `known_functions.json`.

- **La formation est cinématique** : pendant qu'elle est tenue, l'objet monde de l'ailier a `+0x59 = 1`, que
  `WorldObject_UpdateWithAIEntity_3D9FB` traite comme « physique suspendue ». L'ailier reçoit sa vitesse et son
  orientation (nez du leader, roulis lissé sur 4 s) ; il reprend le cran de gaz du leader.
- **Entrée** : à moins de 4 × |poste| du poste, nez à moins de 15° de celui du leader. **Sortie** : au-delà.
- **Rejointe** : poursuite du leader (ID 7, le poste n'est pas relu) si le leader est à plus de 333 m du sol,
  sinon pilote automatique (ID 21) vers un point 1000 m au-dessus du leader.
- **Poste** : (côté, avant, haut) de l'entrée `PART` de l'ailier (mots 48/50/52, posés par l'ordre), ou `NUMS`
  par défaut ; poste fixe (300, −200, 50) m pour un ailier du camp du joueur sans adversaire actif, sauf voix 9.
- **Leader IA** : l'ailier engage la cible du leader en combat, ou le tireur d'un missile qui le vise.
- **Ennemi dans les six heures du joueur** (`word_722EE`) : détecté par l'ennemi lui-même (`AI_SelectWeaponMask_9665`),
  décalé d'un cycle (`RadioFlags_ShiftHistory`) ; un ailier discipliné en formation l'engage (radio `0x10`).

**Fait dans le portage** (syntaxe vérifiée, à valider en jeu) : `SCAIBrain::followAllyOrder` (réécrit),
`followAllyExec`, `formationGuidance`, `formationSlot`, `followWaypoints`, `escortQueryLeader`, `followLeader`,
`navigateWithVelocity` ; `SCProg` résout l'allié par défaut et le poste depuis `PART` ; `SCMission` décale la
détection « six heures » à chaque cycle IA ; `selectWeaponMask` la pose. Corrigé au passage : le minuteur de
l'ID 7 (`applyManeuver`) testait l'inverse de l'original.

**Choix délibéré** : pendant la formation, l'original appelle aussi `Goal_FollowWaypoints` ; ses commandes sont
sans effet puisque la physique est suspendue, mais elles laissent un comportement en cours (ID 7 ou ID 21), qui
bloque les réflexes et l'esquive. Le portage ne l'appelle pas pendant la formation (ses commandes passeraient par
le pilote automatique cinématique et écraseraient la formation) et compte la formation comme un comportement en
cours dans `tick()` ; la rejointe reprend dès la sortie.

**Non tracé / non porté** :
- `+0x15B = 0x12` (branche « six heures ») et `+0x160`/`+0x162` (horloge d'engagement de l'état 3) : rôle inconnu.
- `byte_6E33B` (étape 2 de `Goal_SelectTransition`) et `Escort_LeaderSuccession` (état 3 contre un avion).
- Carburant : l'original ne consomme pas pendant la physique suspendue ; `SCJetpPlane` consomme en mode cinématique.
- `Goal_SetObjective_A307` remet l'état d'ailier `+0x149` à 0 à chaque ordre `0xAA` ; le portage ne le fait pas
  tant que la réexécution des ordres par le script n'est pas tracée.

## §13 Ordres WAIT (0xA0), FLY_TO_WP (0xA5), FLY_TO_AREA (0xA6), DEFEND_AREA (0xA9) — tracés et portés (2026-09-27)

**Contexte de la VM** (`Expr_VM_ExecuteSingleInstruction_51E7E`) : contexte local sur la pile, recréé à chaque exécution
du script ; `taskState` (`[ctx+0x0E]`) démarre à 0. `0x46` saute si `taskState != 0`, `0x47` si `== 0`. L'opcode 2
empile dans le MÊME contexte (un sous-programme partage donc le `taskState`). Objet de mission `[ctx+0x12]` : la PART,
ou 0 pour les scripts de scène (`Scene_*`, appel avec `push large 0`).

**WAIT 0xA0** (`Expr_VM_Interpreter_51106`, loc_51C25) : `taskState = 1` ; minuteur = objet+0x3A (PART), ou le
global `dword_706B0` pour une scène (remis à 0 au tout premier WAIT, `byte_706B4`). Minuteur nul → chargé à
param1 secondes (`movsx`, `shl 8`), reste en cours ; sinon `-= dt` (`dword_70458`) ; `<= 0` → minuteur 0,
`taskState = 0`. Ne touche PAS l'ordre de l'entité (pas d'appel natif). `Shared_TriggerExprInstruction_5247D`
remet objet+0x3A à 0 à l'activation de la PART. Données : 19 WAIT dans des scripts IA/NULL, 6 dans des scripts de
scène (ex. `A0:60 46:65 94:19 08:65`), STRIBASE en enchaîne plusieurs. → à porter dans `SCProg` (pas dans le brain),
avec un minuteur par acteur et un minuteur de mission pour les scènes.

**FLY_TO_AREA 0xA6** : dans la table de la VM, 0xA6 → cas par défaut (loc_51C94) : **aucun effet**, `taskState`
inchangé. Données : les 48 usages sont dans les scripts du **joueur** uniquement.

**FLY_TO_WP 0xA5** : VM → `MissionScript_CallNativeHandler_52513` (même cas que 0xA4) → `Goal_SetObjective_A307` :
+0x11F = spot[param1] (position monde), +0x12B = spot[param2] (opcode 9 suivant ; absent → index 0xFFFF →
(0,0,0) par `Player_ResolveAttachPointN_5305A`). Données : les 121 usages sans opcode 9 sont tous du **joueur** ;
les 80 usages IA ont tous un opcode 9, dont le spot est un **vecteur vitesse** (zone 0xFFFF) : (0,100,0), (0,150,0),
(0,120,0), (100,0,0) m/s = vitesse ET cap d'arrivée voulus au point. Exécution `Goal_ReturnToBase` (sub_B331) :
comportement en cours → son tick ; sinon bloc de commandes P = +0x11F, drapeau atteint +0x1A = 0, W = +0x12B (0xA4/0xA5 ;
autres codes : direction vers P × +0x141), puis nœud ID21 (+0xD1). Fin (`Goal_IsComplete`) : distance
**horizontale** ≤ 500 m (`cmp 1F400h`, composante altitude mise à 0).

**Nœud ID21** (navigation au pilote automatique) : durée = scalaire du contexte : **2 s** (`0x200`) pour
`AI_NavSolutionToPoint` et `Goal_ReturnToBase`, **30 s** (`0x1E00`) pour `Goal_WanderRandom`. Fin quand minuteur < 0
ou 'point atteint'. S'empile comme comportement en cours ; tant qu'il tourne, `AI_NavSolutionToPoint` renvoie 0 sans
rien faire. L'abandon (`NotifiableRef_DetachTarget_75661`) appelle `AIEntity_OnBehaviorEnded_A1DF`, qui coupe le pilote
automatique (JDYN+0x68 = 0xFF) : couper la nav quand elle n'est plus demandée est donc conforme (corrigé 2026-09-28).

**DEFEND_AREA 0xA9** : Goal_SetObjective : +0x10F = nul, +0x111 = spot[param1]. `Goal_IsComplete` : « actif »
seulement si le camp adverse n'a plus d'unité vivante (camp 1 : `word_706A7 − word_706A9` ; sinon
`word_706A3 − word_706A5` ; A3/A7 = PART activées camp 1/0xFF, A5/A9 = détruites). Sinon `Goal_ExecuteAction`
renvoie 0 (GOAL suivant) et efface le verrou bit 5 de +0x28B. Actif (même code que DEFEND_TARGET 0xA8, loc_A9DB) :
camp 0xFF → `byte_6E4C5 = 1` (non tracé) ; `AI_NavSolutionToPoint` ; s'il ne navigue pas :
`AI_BehaviorStateMachine_WeightedOptionSelector_9D05(entité, 0)` ; s'il renvoie 0 : `Goal_WanderRandom`.
Données : 20 usages (PUNK*, camp 0xFF) → en pratique inactif tant que le joueur vit.

**`AI_NavSolutionToPoint`** (relu) : comportement en cours → renvoie 0. Point = position de +0x10F si non nul,
sinon +0x111 ; altitude du point = **terrain sous MON avion + +0x13D** ; d = distance 3D ; si `+0x139·256 < d` :
W = direction 3D normalisée × +0x141, bloc P/W, ID21 (2 s), renvoie 1 ; sinon 0. Valeurs initiales (ovr228) :
+0x111 = (0,0,1000 m), +0x139 = 30000 m (entier), +0x13D = 2000 m, +0x141 = 250 m/s ; modifiées par 0xAC/0xB1/0xB2
(1–2 usages chacun dans les données).

**`Goal_WanderRandom`** (relu ; = gestionnaire GOAL 3, `off_6D198`) : comportement en cours → son tick. Sinon, si
le dernier comportement terminé (+0x19) est l'ID21 (0x15) et que le point n'a pas été atteint (+0x1A == 0) : réapplique
l'ID21 avec le même bloc. Sinon : dir = normalise(rand()%20000 − 10000, rand()%20000 − 10000, 0) ; P = moi +
dir·30000 m, altitude = moi + borne(terrain sous moi + +0x13D − mon altitude, ±1000 m) ; W = dir × +0x141 ;
+0x11F = P ; ID21 **30 s**. Renvoie toujours 1. Le `tryWanderRandom` actuel du port (spot au hasard, force
FLY_TO_WP) et `wander()` (direction simple) ne correspondent pas à l'original.

**Portage (libRealSpace)** :
- `SCProg` : `task_state` par exécution (partagé avec un sous-programme), lu par 0x46 ; WAIT avec
  `SCMissionActors::wait_timer` (remis à 0 à l'activation) ou `SCMission::scene_wait_timer` (scripts de scène,
  `scene_script`) ; FLY_TO_WP lit l'opcode 9 suivant dans `current_command_arg2` ; 0xA6 ignoré pour l'IA
  (`SCMissionActors::setObjective`), le joueur garde son chemin.
- `SCAIBrain` : nœud ID21 = `applyNavigation` / `tickNavigation` (minuteur 2 s ou 30 s, fin sur 'point atteint'),
  écrit `pilot->target_waypoint` (affiché par DebugStrike) ; `behaviorRunning` / `tickBehavior` = entité+0x0D ;
  `navSolutionToPoint` ; `flyToWaypointOrder` (0xA5) ; `defendAreaOrder` (0xA9) et `defendTargetOrder` (0xA8)
  via `defendExec` ; `wander()` = `Goal_WanderRandom`, aussi gestionnaire GOAL 3 (`tryWanderRandom`) ;
  `Goal_FollowWaypoints` utilise le même nœud ID21.
- Non porté : `byte_6E4C5` (drapeau radio décalé par `RadioFlags_ShiftHistory` vers `byte_6E4D3`, posé par
  0xA7/0xA8/0xA9/0xAC en camp 0xFF) ; opcodes 0xAC/0xB1/0xB2 (rayon/altitude/vitesse de navigation).

## §14 Fin de comportement : `AIEntity_OnBehaviorEnded_A1DF` (lu et porté 2026-09-28)

Méthode +0x1C de l'entité IA, appelée par `Behavior_PopFinished_75612` (fin normale, argument 1, seulement si
aucun comportement précédent n'est à restaurer) et `NotifiableRef_DetachTarget_75661` (abandon, argument 0).
Effets, dans l'ordre : train rentré (flags_75 bit2 = 0) ; commandes volets/aérofrein recopiées de l'état
courant ; pilote automatique coupé (JDYN+0x68 = 0xFF) ; si argument : `Targeting_AcquireBestThreat(entité, 0)` ;
si mode formation (bit 3 de +0x28B) et niveau de réaction +0x27F non nul : `Goal_FollowAllyExec` ; physique
reprise (objet +0x59 = 0).

**Portage** : `SCAIBrain::onBehaviorEnded(bool finished)` (train rentré `CmdGearUp`, pilote automatique coupé,
recherche de cible si fin normale, `followAllyExec` en formation avec réaction, `CmdKinematic(false)` = physique
reprise). Le port n'a pas de pile de comportements : une fin normale est toujours « pile vide » (argument 1).
Appels : fin normale = navigation ID21 terminée (point atteint ou minuteur), fin naturelle d'une manœuvre
(`endManeuver(true)`), décollage/atterrissage terminé (`endGroundOp`), attaque au sol finie (arme larguée
disparue, plus d'arme : `resetGroundAttack(true)`) ; abandon = tous les autres `endManeuver(false)`,
`resetGroundAttack(false)` (si une attaque était en cours) et `stopNavigation` d'une navigation ID21. L'attaque
au sol lancée comme manœuvre 19 ne notifie qu'une fois, par `endManeuver`.

## §15 Structure de `SCAIBrain` (refonte du 2026-09-28)

- `tick()` = `AIEntity_MasterTick_5ACC` : `updateTimers()` puis, pilote non éjecté, `topLevelThink()` ; pilote
  éjecté : `followAllyExec` en mode formation, sinon abandon du comportement en cours (`AI_TriggerBehaviorUpdate`).
- `topLevelThink()` = `AI_TopLevelThink`, étapes du §3 d'AI_TICK_CALL_GRAPH.md : ciblage sur tir de missile,
  alerte de menace, réflexes (sans comportement en cours), réactions prioritaires (esquive, entrée en combat),
  comportement en cours pendant une réaction, puis GOAL (`runGoalSelectors` : 2 `executeGoalAction`,
  3 `wander`, 4 `combatStep`, 5 `moraleReaction`).
- Comportement en cours = pile `behaviors` (`entité+0x0D`) : `pushBehavior` (`Behavior_PushRunning_756A4`),
  `endBehavior(kind, true)` (`Behavior_PopFinished_75612`), `endBehavior(kind, false)` / `abandonBehavior`
  (`NotifiableRef_DetachTarget_75661`, pile vidée), `tickBehavior` (méthode +0xC du sommet). Types : manœuvre
  MVRS, navigation ID21, attaque au sol ID19, décollage, atterrissage. Plus aucun arrêt « non touché ce tick ».
- État regroupé : `RetargetClock retarget` (+0x174..0x179), `ManeuverState maneuver`, `NavigationState nav`
  (+0x10F..0x141, bloc ID21), `GroundAttackState ground` (ID19), `GroundOpsState ground_ops`,
  `FormationState formation`, `MoodState mood`.
- Fuites (`Goal_MoraleReaction_878F`) : navigation ID21 de 2 s, W = (250, 100, 0) (ennemi, puis `returnToBase`)
  ou (250, 0, 0) (ailier qui quitte le combat) ; plus de navigation continue.
- Ordres radio acceptés : exécutés dans `SCMissionActors::onAIRefresh`, avant le tick du cerveau.

## §16 DEFEND_TARGET et l'étape 3 de `AI_TopLevelThink` (2026-10-02)

- L'étape 3 n'est pas une recherche de cible : `AI_ScanCollisionThreats_DF99` parcourt tous les avions (amis compris)
  et `AI_CollisionCourseTest_DD21` détecte une collision (distance < 80 m, ou passage à moins de 80 m dans les 4 s) ;
  si oui, `AI_ProximityGeometricWarning_315B` (nœud ID20) et niveau de réaction 3. **Non porté** ; `REACT_NEW_TARGET`
  (= 3) est un nom faux (évitement de collision).
- DEFEND_TARGET (`Goal_ExecuteAction_A8AC`, 0xA8) n'a donc pas d'autre mécanisme que : navigation vers l'allié au-delà
  de 30 km, sinon combat (meilleure menace parmi tous les ennemis), sinon errance de 30 s. Aucune priorité pour
  l'attaquant de l'allié.
- Corrigé dans le port : `missile_threat` (+0x281) se vide quand le missile est retiré du monde
  (`SCMission::onWeaponRemoved`, appelé par SCPlane, SCJdynPlane, SCJetpPlane et les SWPN), comme une référence
  `SetReference` de l'original. Avant, il restait posé (pointeur invalide pour les missiles SAM détruits) et
  bridait la recherche de cible du combat à la fenêtre lente.

## §17 Ordres DESTROY/DEFEND, entrée en combat, ciblage, évitement de collision (porté 2026-10-02)

- `destroyTargetOrder` : cible aérienne → combat, puis **renvoie true** (Goal_ExecuteAction 0xA7 renvoie le
  résultat de `Goal_IsComplete`, pas celui du combat). Avant, un combat sans cible retenue laissait la main au GOAL
  suivant (errance de 30 s) : l'IA « perdait » sa cible de mission.
- `engageAttackerReaction` : 4b seulement pour un chasseur (`RSEntity::combat_class`, JINF +0x52 >= 9), abandon de
  la navigation ID21 au sommet de la pile, combat, renvoie true ; 4c (non chasseur, rien en cours, sans ordre ou
  FLY_TO_WP) : point « atteint », ordre verrouillé, errance.
- Ciblage : bonus dernier attaquant `last_attacker` (+0x289 : aptitude +3, B +5), cible désignée `engage_target`
  (+0x285 : A +10, aptitude +5 ; posée en 4a, état 3 du suivi), bit 1 de +0x28B `escort_leader_free` (posé sur le
  leader par `escortQueryLeader`, effacé en fin de tick ; remplace `fire_control_active`, jamais écrit).
- Évitement de collision (étape 3, niveau `REACT_COLLISION` = 3, ex-`REACT_NEW_TARGET`) : `scanCollisionThreats`
  / `collisionCourse` ; manœuvre 20 = jambe ID20 de 2 s, plein gaz, direction `-(a × b)` (a = moi − lui,
  b = sa vitesse × 4 s), repli (5, 5, 1000) asm. Les réflexes de l'étape 3 terminent le tick s'ils réagissent.
- Classe (porté) : un avion ne prend de cible aérienne que si sa classe est >= 6, et jamais un avion dont le pilote
  s'est éjecté ; score d'un avion candidat de classe c (la mienne m, référence 6) : c <= 6 → B = 0, sinon A et
  aptitude += (c − 2 <= m ? c − 6 : m − c).
- Non porté : règle de camp de l'original (candidat ennemi si son camp == −le mien : 1 contre 0xFF, et neutre (0)
  contre neutre) ; le port prend tout camp différent du sien.

## §18 Validation sur log MiG-21 / STERN / C-130 (2026-10-02)

- **Cible de mission posée trop tard** : `owner->target` (+0x137) n'était posé que par `destroyTargetOrder` (GOAL 2),
  après les recherches de cible des étapes 1 à 4 du tick ; la première cible aérienne était choisie sans le bonus
  de cible de mission, puis gardée. Corrigé : posé par `SCMissionActors::setObjective` dès l'ordre 0xA7/0xA8
  (`Goal_SetObjective_A307`) ; cible nulle = ordre terminé (Goal_IsComplete 0xA7).
- **Comportement en cours avant le combat dans l'ordre 0xA7 : conforme** (`cmp dword ptr es:[bx+0Dh], 0 / jmp
  loc_A938` avant `AI_BehaviorStateMachine_WeightedOptionSelector_9D05`) ; ID7 s'empile bien
  (`MVRS_ID7_ApplyFuelGatedTimer_10AF2` → `VROOMM_StubThunk_6AB4F` → `Behavior_PushRunning_756A4`). Le tir
  (`AI_BehaviorSelector`, un seul appelant : le combat) n'est donc testé qu'entre deux manœuvres.
- **Loi de manette** : `AI_ThrottleController_6250` portée (cran proportionnel à l'écart de vitesse) à la place des
  trois crans 10/2/5. Le cran −1 est borné à 0 par `SCPilot::CmdThrottle` (sens de −1 non tracé).
- **Porté** : `AI_InterceptDispatcher` (`interceptDispatcher`) avec `AI_InterceptSpeedControlLaw`
  (`interceptSpeed`, `referenceSpeed` = dword_72039) et `AI_GunSnapAim_6977` (`gunSnap` : l'avion est réorienté
  sur la cible quand l'erreur de visée est sous la fenêtre, à moins de 1800 m, si le jet AA réussit ; publié par
  `PlaneAttitudeEvent`) ; tick ID7 réécrit d'après `MVRS_ID7_TickPursuit_10BD9` (la manœuvre se termine quand le
  recalage a eu lieu → le combat tire ; angle du mode 2 = angle(D, vitesse cible), pas l'aspect).
- **Guidage** : `SCPilot::guidanceSolution` prend le **nez** comme référence (AI_GuidanceCmd_FromOwnPos, et
  AI_Sensor_WeaponVelocityCache = nez pour canon et missiles), plus la vitesse ; renvoie vrai si aligné.
- **Bug d'origine porté tel quel** : en mode bit 4 d'ID7, la position absolue mémorisée (cible + vitesse × 4 s) est
  passée comme direction de guidage.
- Ciblage : test « cible nettement sous moi » (avions et missiles) et bonus « le tireur du missile est ma cible »
  (aptitude +4) portés.

## §19 Ordres du script : pas de pile, un verrou (2026-10-03)

- `Expr_VM_Interpreter_51106` relit le script depuis le début à chaque frame (curseur remis à 0 par
  `Expr_VM_ExecuteSingleInstruction_51E7E`). Chaque `SET_OBJ_*` appelle `Goal_SetObjective_A307`, qui
  écrase l'ordre unique +0x11D. Exemple MISN-1A, Stern (PROG 3) : `FOLLOW_ALLY(joueur)` puis, selon les
  zones du joueur, `DEFEND_TARGET(C-130)` à chaque passe — voulu par la mission.
- Verrou = bit 5 de +0x28B : `Goal_SetObjective_A307` ne pose rien et renvoie 1 (en cours). Posé par
  `Goal_SelectTransition` (états d'ailier 2 et 3), `Goal_TransferToWingman`, `AI_MessageDispatcher`,
  `Goal_MoraleReaction_878F` ; effacé par `Goal_ExecuteAction_A8AC` en fin d'ordre.
- Retour = 1 si verrouillé, sinon `Goal_IsComplete_A6D3` du nouvel état ; c'est l'état lu par
  `GOTO_IF_CURRENT_COMMAND_IN_PROGRESS` (0x46). Port : `setObjective` renvoie ce booléen, `SCProg` l'utilise.
- 0xAA remet l'état d'ailier +0x149 à 0 ; queue commune : ordre ≠ 0xAA et formation tenue →
  `Goal_FollowAllyExec` (sortie de formation). Port : `SCAIBrain::onObjectiveSet`.
- +0x137 (cible de mission) n'est jamais réécrit par le combat (cible aérienne = +0x287). Supprimé du port :
  `owner->target = air_target` dans `combatStep`, la remise `actors[arg]` dans `destroyTargetOrder`,
  l'effacement de cible du cas DEFEND de `SCProg`.
- MISN-1A : MiG#5 → `DESTROY(C-130)` (puis joueur une fois le C-130 détruit), MiG#6 → `DESTROY(STERN)`,
  MiG#7 → `DESTROY(joueur)`.

## §20 `AI_BehaviorSelector` porté (2026-10-03)

- `SCAIBrain::behaviorSelector()` traduit `AI_BehaviorSelector` (détail dans `known_functions.json`) ;
  `SCAIBrain::weaponRecoveryBusy()` traduit `AI_WeaponRecoveryBusy_9027` (ex-`AI_RadarScanTarget`).
- `combatStep` (étape 4) abandonne le comportement en cours si le sélecteur agit (gâchette ou q > 0).
- Fin de `topLevelThink` : continuation de rafale de canon quand le sélecteur n'est pas passé ce tick
  (`loc_850B`, bit 2 de +0x28B effacé en tête de `AI_TriggerBehaviorUpdate`).
- Supprimés : `updateFireControl`, `updatePursuit` (poursuite anticipée inventée), le calcul d'arme et de
  qualité dans `updateTimers`. La poursuite est pure : `CmdGuidance(cible − moi)`, référence le nez.
- Bug de l'original porté : pendant le délai d'après tir, la qualité n'est pas calculée et le registre
  garde une valeur positive de l'appelant → l'IA continue la poursuite (q = 1 dans le port).
- Non porté : `byte_6E4C0` (missile tiré sur le joueur) et le message radio 0x20 sous `byte_6E33B`
  (globaux non tracés).
