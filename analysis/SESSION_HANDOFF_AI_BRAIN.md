# Reprise de session — migration de l'IA vers `SCAIBrain` (2026-09-20)

Document écrit avant compactage pour reprendre sans perdre le fil. À lire avec `CLAUDE.md` (règles de travail avec Rémi), `analysis/AI_TICK_CALL_GRAPH.md` (le détail de l'assembleur lu) et `analysis/AI_IMPLEMENTATION_GUIDE.md` (§2.10 et §3.5).

## 1. But et règles de travail

- **But** : rendre le port libRealSpace fidèle à `STRIKE.EXE` sur l'IA. Le nouveau code suit l'assembleur ; l'ancien (`destroyTarget` et autres) est de la colle, décommissionnée progressivement.
- **Principe** : le script pose l'intention, le cerveau l'interprète, le pilote l'exécute. Chaîne : script → `SCMissionActors::setObjective` → `SCAIBrain` (décide) → `SCPilot` (exécute) → `SCPlane`.
- **Règles de Rémi** (mémoire à jour dans `~/.claude/projects/.../memory/`) :
  - parler avec les **noms résolus** des fonctions, jamais des adresses ou offsets nus ;
  - lire l'assembleur dans `analysis/annotated_segments/`, jamais `source/strike.asm` ;
  - ses faits côté données font foi (ne pas les mettre en doute, ne pas écrire « selon Rémi ») ;
  - petits pas, proposer avant de coder les refontes, **jamais de big-bang** ; l'ancien code n'est retiré qu'après validation en jeu ;
  - **c'est à moi d'activer les drapeaux de test et de lui demander les logs** ;
  - conventions de code IA : fichiers préfixés `SC`, pas de nouveau dossier, **pas de lambda**, pas de commentaire superflu ;
  - fonctions mathématiques génériques sur vecteurs : dans `Vector3D` (`commons/Matrix.h`) ;
  - répondre en français.
- **Compilation** : je ne compile pas le projet entier. Je vérifie la syntaxe avec les commandes de `out/build/macos/compile_commands.json` (`-fsyntax-only`) ; Rémi compile et joue. Les fichiers sont pris par `GLOB` : relancer CMake après l'ajout d'un `.cpp`.

## 2. État du code libRealSpace (`/Users/remi/source/libRealSpace/src`)

### Nouveaux fichiers
- `strike_commander/SCAIBrain.h/.cpp` : le cerveau (voir §3).
- `realspace/RSIntel.h/.cpp` : charge `INTEL.IFF` (FORM `INTL`, chunks `VERS` et `NUMS`, style `RSProf`). Champs : `range_gun` (1800), `range_medium` (4000), `range_ground` (5000), `range_long` (17700), `range_far` (45000), `range_close` (1800), `formation_offset`, etc. Chargé dans `SCMission::loadMission` (membre `intel`).

### Fichiers modifiés
- `SCMissionActors.h/.cpp` : `SCAIBrain *brain` (créé par `SCMission` pour tout acteur au profil IA, supprimé dans le destructeur) ; `NO_TARGET = -1` (le joueur a l'`actor_id` 0) ; `onAIRefresh` appelle `brain->tick()` ; `destroyTarget` saute son tir aérien quand `brain->fire_control_enabled` et sa navigation (`SetTargetWaypoint`, `target_climb`, `target_speed`) quand `brain->pursuit_active`. La boucle `GOAL` (`runGoalSelectors`, `executeGoalAction`, `tryWanderRandom`, `tryActiveWingman`) a été déplacée dans `SCAIBrain`.
- `SCPlane.h/.cpp` : `Shoot` est scindé ; `ShootDirect` tire sans le jet `rand % 16 <= AA` ni la visée prédictive (`ShootWithPrediction`, l'ancien hack).
- `SCPilot.h/.cpp` : `Fire(masque, cible)` ; `SetAttitudeError(écart_cap, écart_tangage, zone_morte)` avec `attitude_mode` (écart de cap positif = virer à droite ; écart de tangage positif = cabrer ; `SetTargetWaypoint` remet le mode à faux).
- `commons/Matrix.h` : `Vector3D::AngleBetween`.
- `SCMission.h/.cpp` : membre `intel`, création du cerveau (avant le test sur les `GOAL`).
- `SCenums.h` : `enum GoalSelector`. `SCMissionEvent.h` : `AIRefreshEvent` (25 Hz, accumulateur dans `SCMission::update`).
- `precomp.h` (deux) : `#include "RSIntel.h"`.

## 3. Ce que fait `SCAIBrain` (`tick()`, 25 Hz)

Ordre : `acquireBestThreat(true)` → `selectWeaponMask` → `computeFireSolutionQuality` → `updateFireControl` → log → `runGoalSelectors` → `reactToMissile` → `updatePursuit` (si pas d'esquive).

- **Ciblage** (`acquireBestThreat`, d'après `Targeting_AcquireBestThreat`) : avions hostiles (`team_id` différent), cibles sol (`target_type == 2`, arme sol `0x83C` chargée), missile qui me vise (`weapon_shooted_at_me`, `target_domain == 1`, missile guidé anti-avion). Scores A et B, aptitude, porte du jet de dé `TH + aptitude`, score final `(AR − TH + 16)·A + (TH − AR + 16)·B`, départ −5000. Champs : `air_target`, `ground_target`, `missile_threat`, `threat_state` (2 = missile gagnant). Bonus de persistance et de cible de mission (`owner->target`). Non implémentés : cône arrière, terme de classe, deux références de bonus inconnues, `+4` si l'avion visé est le lanceur du missile.
- **Arme** (`selectWeaponMask`, d'après `AI_SelectWeaponMask_9665`) : cible à 90° ou plus du nez → aucune ; canon `0x800` sous `range_gun` ; missile longue portée `0x700` au-delà de `range_medium` ; AIM-9 `0x1`/`0x3` sous `range_long`. Les masques sont des ensembles de `weapon_id` (bit = id − 1) : `0x1` = id 1 (fichier `SWINDERM`, AIM-9M), `0x2` = id 2 (`SWINDERJ`, AIM-9J), `0x3` les deux, `0x700` AIM-120/SA-2/SA-6, `0x83C` AGM-65D/LAU-3/MK-20/MK-82/canon.
- **Qualité de solution** (`computeFireSolutionQuality`, d'après `AI_ComputeFireSolutionQuality_91DF`) : 0 à 10. Canon : erreur de visée (angle entre mon nez et la cible) comparée à une tolérance `arctan(vitesse cible par tick / distance)`. **Hypothèse à valider** : la vitesse est en unités par tick de cerveau (`|vz| × tps × 1/25`) ; l'unité de l'assembleur n'est pas établie.
- **Tir** (`updateFireControl`) : rafale de canon `((rand & 3) + 4) × qualité / 10`, seuil `2 × qualité ≥ AA`, missile si qualité > 0 avec un **délai de 75 ticks (provisoire, voir §5)**. `SCPilot::Fire` → `SCPlane::ShootDirect`.
- **Poursuite** (`updatePursuit`) : point d'anticipation (position cible + vitesse déduite du déplacement entre deux ticks × `distance / ma vitesse`, plafonné à 3 s), tangage ±45°, écarts bornés à ±10° sous `range_medium`, zone morte 0,5° sous `range_medium` (2° au-delà), sécurité sol (< 1000 : pas de piqué). Vitesse : plein gaz au-delà de `range_medium`, sinon vitesse de la cible avec +10 jusqu'à 60 % de `range_gun`. `pilot->target_waypoint` est mis à jour (le point d'anticipation) pour la carte tactique de `DebugStrike`. L'ancien chemin (waypoint, `aim_trim`, bornes d'altitude) reste sous `attitude_control_enabled = false`.
- **Esquive de missile** (`reactToMissile`, d'après `AI_MissileEvasionReaction_9A77`) : bande de distance du missile (`AI_ClassifyDistanceBand`), fuite (loin) ou virage perpendiculaire (proche et moyen), plein gaz, maintien 25 ticks. **Purement horizontale** (le seuil d'altitude `dword_7203D` n'est pas lu) ; pas de message radio « tir ami ».
- **Drapeaux** (tous `true`) : `fire_control_enabled`, `pursuit_enabled`, `attitude_control_enabled`, `evasion_enabled`.

## 4. Ce que Rémi a validé en jeu (par logs)

`STERN` abat un MiG au canon ; un MiG touche le joueur ; l'esquive fonctionne ; le pilotage en écarts d'angle « pilote super bien » ; les MiG tirent en rafales cohérentes. Problèmes vus puis traités : un MiG poursuivait sans tirer (garde anti-décalage, retirée) ; `STERN` tirait de trop loin à 1750 avec la visée 2,5° trop bas (tolérance de tir trop généreuse, zone morte trop grande, distance d'approche : corrigés, **non revalidés**) ; début de combat étrange (les MiG sont invoqués trop haut, mauvais cap et mauvaise vitesse : problème de scénario, hors IA). Le **dernier correctif** (tolérance par tick, approche à 60 % de la portée, zone morte 0,5°) attend le retour de Rémi : `STERN` détruit-il une cible, à quelle distance ?

**Logs à demander** : lignes `AI <nom>#<id> pursuit …` (avec `heading_err`, `pitch_err`, `nose_elev`, `los_elev`), `fire weapon=0x… quality=… burst=…`, `weapon_mask=… quality=…`, `evade band=… missile_d=… hold=…`.

## 5. Point en cours : le tir de missile

Lu dans l'assembleur (détail dans `AI_TICK_CALL_GRAPH.md`, « Le tir de missile ») : engagement d'un point d'emport (`AI_FireWeaponTrigger`) → si l'arme ne suit pas la cible, bit 6 de suivi et pas de tir → sinon test de verrouillage `WeaponStation_TestTargetLock` (renommé) → modèle de chercheur `Targeting_SelectAndPrioritize` (selon `weapon_aspec`, signature de la cible contre un seuil : 210 pour l'aspec 1, 245 pour l'aspec 3, tirage de poids 3 ou 5). **Aucun test sur le nombre de missiles en l'air** (confirmé par Rémi : `STERN` tire deux missiles d'affilée).

**À faire** : remplacer mon délai de 75 ticks par une machine à deux phases (suivi de quelques ticks, puis tir, puis remise à zéro du suivi), **version fidèle** (décidée : on code ce que dit l'assembleur, pas de version simplifiée).

**Réponses obtenues de Rémi (2026-09-20) :**
- `WDAT` en RAW (canon, 3 missiles air-air, SA-2, SA-6, AGM-65D, GBU-15, MK-20, MK-82, LAU-3) : tableau complet dans `AI_TICK_CALL_GRAPH.md`, section « Les deux octets de classe du chunk `WDAT` ». Noms du parseur : `weapon_category` (`+0x4D`, famille d'arme) et `target_domain` (`+0x4E`, 1 = missile guidé anti-avion, 2 = autre ; nom inféré). Le test de `scoreMissile` est `target_domain == 1`. L'ancien code (`SCMissionActors.cpp`, `switch` sur `weapon_category`) est à revoir par Rémi avec ces valeurs.
- Chunk `SIGN` en RAW : F-16DES = 10, 150, 20 ; MIG21 = 10, 125, 20. Chargement, copie et lecteurs : `AI_TICK_CALL_GRAPH.md`, section « Le chunk `SIGN` ». 1er octet (`instance+0x28`, méthode `+0x7C`) = aspec 1, seuil > 210 ; 3e octet (`instance+0x29`, `Debris_GetStateFlag`) = aspec 2 ; 2e octet (modèle `+0x13`, `Debris_GetSubpartAttrib`) = aspec 3 (seuil >= 245) et aspec 4.
- ~~**Constat gênant**~~ **Résolu le 2026-09-24** (`AI_TICK_CALL_GRAPH.md`, « Qui écrit les octets de signature ») : personne ne réécrit `instance+0x28/+0x29`. (1) Pour un avion, l'octet des aspecs 1 et 2 est **calculé** par `Aircraft_ComputeSeekerSignature_3E2F1` : `10 + vitesse/602 × (100 de dos, 50 sinon) + (100 de dos, 50 sinon) si cran de gaz > 5` (post-combustion, preuve par `PhysicsTicks`). (2) Le seuil 210/245 de `Targeting_SelectAndPrioritize` **n'est pas un seuil de verrouillage** : il décide si un **autre candidat** du cône (surtout un leurre `DECY`, dont la signature S0 × temps restant / durée s'éteint) vole la piste, avec 3 chances sur 10. L'AIM-9J exige en plus l'aspect arrière. **Correction** : la table des aspecs était décalée (aspec 2 = signature ≥ 245 tous secteurs, aspec 3 = fenêtre du réticule, aspec 4 = S1 ≥ 245).
- Non lus : `Targeting_FilterByWeaponType` (cône et portée du chercheur), `Targeting_ReticleWindowTest`, `Proximity_TestOriented`.
- Rémi veut que les valeurs de contrôle (aspec de chaque missile) soient affichées dans le débug, pas demandées.

**Vol du missile décodé (2026-09-24)** : `AI_TICK_CALL_GRAPH.md`, « Le vol du missile guidé ». Le chercheur est réévalué en vol, et la loi de guidage `MissileBody_SteerToTarget_42738` (ex-`Sound3D_ComputeSecondChannel`) fait une poursuite avec anticipation plafonnée à 1, en « bank-to-turn » : roulis immédiat, cabrage borné par le 1er dword du chunk dynamique `MISS`. La propulsion dure jusqu'à la vitesse maximale, et sans cible le missile tombe en balistique.

## 6. Reste à faire (ordre suggéré)

1. Missile : écrivains de `instance+0x28`/`+0x29` **trouvés** (aucun, voir §5). Reste : faire exposer `radar_sign[3]` par le parseur `SIGN`, coder `Aircraft_ComputeSeekerSignature` (cran de gaz > 5 = post-combustion) et le modèle de chercheur fidèle (garde ou vol de piste, aspect arrière de l'AIM-9J), puis les leurres `DECY` (chunk `DATA` = durée de vie ; valeurs `SIGN`/`DATA` des fichiers à relever).
2. Esquive verticale : lire le seuil `dword_7203D` (calculé par `AIEntity_MasterTick_5ACC`) et `AI_EvalTargetAttribute` ; message radio de plainte de tir ami (`Radio_PlayMessage` `0x0E`).
3. Attaque au sol : nœud permanent `+0xD9` (appliqué par `Goal_ExecuteAction` pour une cible de mission `+0x11 == 2`, et par le gestionnaire de tir si `arg_4` non nul), non lu.
4. `SCAIBrain::executeObjective()` (répartiteur d'après `Goal_ExecuteAction` : « détruire la cible » → gestionnaire de tir pour l'air, nœud sol pour le sol ; « défendre » → navigation puis gestionnaire puis errance) ; retrait progressif de l'ancien `destroyTarget` par responsabilité, après validation.
5. Tournoi `MVRS` (sélecteur 4 = `AI_BehaviorStateMachine_WeightedOptionSelector_9D05`) : conditions d'entrée lues (cible aérienne, `+0x27F ≤ 1`, objet en cours nul, bruit ±1, plancher −1000) ; instincts à porter un par un.
6. Retirer les `printf` de debug et l'`aim_trim` (ancien chemin) quand tout est validé ; calibrer la tolérance de tir avec des impacts réels.
7. Notes de doc à finir : `AI_TICK_CALL_GRAPH.md` a des sections « Non résolu » et « Faits établis » à relire en fin de chantier.

## 7. Découvertes structurelles de la session (toutes documentées)

- Catégories d'objet (`vtable+8`, fixées par le chunk IFF présent) : 6 `JETP` avion, 8 `MISS` missile, 0x13 `SWPN` défenses fixes ; `objet+0x11 == 2` est `target_type` (cible sol).
- Noms corrigés dans `known_functions.json` : `AI_SelectWeaponMask_9665` (ex-`AI_Cluster_9665`), `AI_ComputeFireSolutionQuality_91DF`, `AI_Sensor_WeaponVelocityCache` (vitesse de **mon arme**, pas de la cible), `AI_MissileEvasionReaction_9A77`, `WeaponStation_TestTargetLock`, `Weapon_LoadWDATChunk_A0700`, `WeaponId_ToTypeMask_9DE60`, `SwpnModel_LoadDataChunk_A0A00`, `Goal_WanderRandom` (lue : point à 30 000 unités dans une direction aléatoire), etc.
- `Goal_ExecuteAction` est le répartiteur objectif → comportement ; l'ordre « détruire la cible » n'agit sur l'air que par un bonus de score.
- Les IA de l'original ne tiennent aucune altitude : elles commandent le manche à partir d'écarts d'angle avec une zone morte (`AI_RollToAngleCmd_8104`, `AI_RollController_7E56`). **Corrigé 2026-09-24** : ces fonctions commandent le **roulis** (et `AI_PitchToAngleCmd_7E18` / `AI_PitchController_7B20` le tangage), pas le cap : voir `AI_TICK_CALL_GRAPH.md`, « L'attaque au sol ». Le seuil « 20° » de `AI_CombatDecision_Major` n'a pas été porté (sens incertain).
- `vz` est la vitesse par tick, avec 50 ticks par seconde (`vz = -6` ≈ 300 unités par seconde) ; les MiG plafonnent vers 300–500 unités par seconde.
