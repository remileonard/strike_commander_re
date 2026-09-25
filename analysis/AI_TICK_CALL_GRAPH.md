# Graphe d'appels : du tick principal à `AIEntity_MasterTick`, et création des entités

*Établi avec Rémi (2026-09-19) en lisant uniquement `analysis/annotated_segments/`. Tous les noms sont les noms résolus de `known_functions.json`. Trait plein = lu dans le code ; trait pointillé = hypothèse ou lien non prouvé ; case grise = fonction non lue.*

## Le graphe

```mermaid
flowchart TD
    subgraph MAIN["Boucle principale"]
        LOOP["STRIKE_EXE_MAIN_LOOP"]
        TICK["MAIN_GAME_TICK"]
        FRAME["Frame_UpdateTimingAndNotifyTrackedObjects_500F6<br/>delta de temps dword_70458"]
        LOOP --> TICK
        LOOP --> FRAME
    end

    subgraph WORLD["Tick du monde - branche TICK"]
        COMBAT["CombatTarget_WeaponActionSubsystem"]
        RESET["WorldObjects_UpdateFrame_ResetCounters_221C2"]
        UPDALL["WorldObjects_UpdateAllAndRemoveDead_221F2<br/>parcourt la liste 0x59C3<br/>appelle le slot +0x10 de chaque nœud<br/>retire ceux qui renvoient 0"]
        UPD["WorldObject_UpdateWithAIEntity_3D9FB<br/>slot +0x10, vtable 0x2618"]
        ALIVE["WorldObject_IsAlive_3CBB7"]
        TESTALIVE["WorldObject_TestAliveAndUpdateChildren_3800A<br/>renvoie 1 si vivant"]
        MASTER["AIEntity_MasterTick_5ACC<br/>slot +0xC de la vtable 0x110<br/>entité pointée par +0x55"]
        SLOT8["slot +8 de l'entité : loc_4F85<br/>pas de nom, pas lu"]
        MOUNT["objet à +0x51<br/>slot +0x40, pas identifié"]
        EMIT["Emitter_UpdateFromEntitySMOKVec_3D57E<br/>pas lu"]
        CLEAR["AircraftStateBits_Clear_12806<br/>remet à zéro 3 octets de drapeaux<br/>aucun affichage"]
        FOLLOW["Goal_FollowAllyExec"]
        TRIGGER["AI_TriggerBehaviorUpdate<br/>c'est là que se trouve la décision<br/>pas lu"]
        BEHAV["fonction de comportement<br/>sans nom, pas lue"]
        PICK["Picking_ResolveSymbol<br/>autre appelant, pas lu"]

        TICK --> COMBAT
        COMBAT --> RESET
        RESET --> UPDALL
        PICK --> UPDALL
        UPDALL -->|"slot +0x10"| UPD
        UPD --> ALIVE
        ALIVE --> TESTALIVE
        TESTALIVE -->|"liste des sous-objets +0x1E"| UPDALL
        UPD -->|"byte_6D558 = 0"| MASTER
        UPD -->|"puis slot +8"| SLOT8
        SLOT8 --> MOUNT
        UPD --> EMIT
        MASTER --> CLEAR
        MASTER -->|"flags_75 bit5 et +0x28B bit3"| FOLLOW
        MASTER -->|"sinon"| TRIGGER
        TRIGGER -.->|"si +0x28B bit7"| BEHAV
        TOPTHINK["AI_TopLevelThink<br/>appelée par AI_TriggerBehaviorUpdate<br/>lue : début et fin, pas le milieu"]
        REACT["réactions prioritaires<br/>AI_MissileEvasionReaction_9A77<br/>AI_EngageAttackerReaction_E246<br/>avant tout objectif"]
        ACTIVEOBJ["objet à entité+0x0D<br/>si non nul : son slot +0xC<br/>GOAL et tournoi sautés<br/>nature de l'objet inconnue"]
        GROUND["avion au sol :<br/>Goal_ExecuteAction_A8AC direct<br/>tableau GOAL ignoré"]
        SLOTS["avion en vol : emplacements GOAL<br/>entité+0x1B0, 8 octets par emplacement<br/>jusqu'au premier qui renvoie non nul"]
        HANDLERS["gestionnaires choisis par l'octet du fichier<br/>2 Goal_ExecuteAction_A8AC<br/>3 Goal_WanderRandom<br/>4 AI_BehaviorStateMachine_WeightedOptionSelector_9D05<br/>5 Goal_MoraleReaction_878F<br/>1 : valeur abandonnée au chargement"]
        TRIGGER --> TOPTHINK
        TOPTHINK --> REACT
        REACT -->|"aucune réaction"| ACTIVEOBJ
        ACTIVEOBJ -->|"nul, avion au sol"| GROUND
        ACTIVEOBJ -->|"nul, avion en vol"| SLOTS
        SLOTS --> HANDLERS
        BSM["AI_BehaviorStateMachine_WeightedOptionSelector_9D05<br/>tournoi MVRS, exige une cible entité+0x287"]
        BSEL["AI_BehaviorSelector<br/>tir et guidage vers la cible<br/>renvoie 1 s'il a agi"]
        BSCORE["nœuds MVRS<br/>score [vtable+4], application [vtable+8]"]
        HANDLERS -->|"4"| BSM
        BSM -->|"+0x27F au plus 1"| BSEL
        BSM -->|"BSEL renvoie 0 et objet +0x0D nul"| BSCORE
    end

    subgraph AUTO["Pilotage automatique - byte_6D558"]
        UISCRIPT["UIScript_ParseAndEvaluate_7A054<br/>nom trompeur"]
        CMD["Pilot_LowLevelControlCommand<br/>Pilot_IssueControlCommand_79DA0<br/>ordres directs à l'avion"]
        CAM["EntityTracker_SelectByID<br/>entrée AUTOPILT"]
        FLAG["byte_6D558 = 1<br/>puis boucle imbriquée<br/>puis byte_6D558 = 0"]
        UISCRIPT --> CMD
        UISCRIPT --> CAM
        UISCRIPT --> FLAG
        FLAG -->|"1 : pas de MasterTick"| UPD
        FLAG --> COMBAT
    end

    subgraph SPAWN["Création des entités - branche SPAWN"]
        PART["PartEntry_DispatchMissionUpdateTick_52E51"]
        PROP["Expr_Node_UpdateAndPropagate_52AC6"]
        VMSINGLE["Expr_VM_ExecuteSingleInstruction_51E7E"]
        VM["Expr_VM_Interpreter_51106"]
        RESOLVE["PartEntry_ResolveSpawnPositionAndActivate_51EDC"]
        SPAWNFN["AIAircraft_SpawnAndConditionalLoadProfile_53363<br/>rôle 1 IA, 2 PLAYER, 3 NETWORK"]
        PROTO["ObjectPrototype_FindOrLoadAndInstantiate_38B70<br/>prototype par clé, rôle écrit à +0x34<br/>appelle le slot +4 du prototype"]
        CONSTR["WorldObject_ConstructWithAIEntity_9D2CC<br/>objet de 0x5A octets, vtable 0x2618<br/>écrit l'entité à +0x55"]
        CREATE["AIEntity_CreateByType_12B4E<br/>slot 0 de l'objet à +0x46 du prototype"]
        ECONSTR["AIEntity_Construct_74B43<br/>entité de 0x28E octets, vtable 0x110"]
        RESETBLK["AircraftStateBlock_Reset_12931<br/>bloc de 0x2B octets"]
        ADD["WorldObjects_AddToList_5334D"]
        APPIF["List_AppendIfNonNull_21F8D"]
        APPTAIL["List_AppendTail_22C23"]
        LOADW["WorldObject_LoadAIProfileViaEntity_9D4D2"]
        LOADG["AIAircraft_LoadProfileGuarded_73940"]
        PROF["PilotProfile_LoadFromPROF_VersionGate_8E351<br/>chunk PROF : GOAL, MVRS, ATRB"]

        TICK --> PART
        PART --> PROP
        PROP --> VMSINGLE
        VMSINGLE --> VM
        VM --> RESOLVE
        RESOLVE --> SPAWNFN
        SPAWNFN --> PROTO
        PROTO -.->|"probable"| CONSTR
        CONSTR -.->|"probable"| CREATE
        CREATE --> ECONSTR
        ECONSTR --> RESETBLK
        SPAWNFN --> ADD
        ADD --> APPIF
        APPIF --> APPTAIL
        SPAWNFN -->|"rôle différent de PLAYER"| LOADW
        LOADW -->|"entité lue à +0x55"| LOADG
        LOADG --> PROF
    end

    subgraph MISSION["Chargement de la mission"]
        MLOAD["MissionScenario_LoadMainRecord_A8331"]
        CAST["PLAY_LoadCASTTeamNames_A9956<br/>chunk CAST : 9 octets par entrée<br/>nom sur 8 octets + id"]
        WRLD["World_ParseWrldForm_A767F<br/>ajoute 2 objets à la liste 0x59C3"]
        MLOAD --> CAST
        MLOAD --> WRLD
        CAST -.->|"nom du PROF, lien non lu"| SPAWNFN
        WRLD --> APPIF
    end

    subgraph ORDERS["Ordres de mission - branche script"]
        EXEC["MissionScript_ExecutePROG"]
        RELAY["MissionScript_DispatchOrderToNative"]
        NATIVE["MissionScript_CallNativeHandler<br/>switch à 31 cas"]
        CTRL["controller, slot +0x88<br/>ExecuteFlightCommand"]
        VM --> EXEC
        EXEC --> RELAY
        RELAY --> NATIVE
        NATIVE --> CTRL
        SPAWNFN --> CTRL
        EFC["ExecuteFlightCommand, slot +0x88 de l'objet monde<br/>classe 0x27BC : loc_3E419, transmet à l'entité<br/>classes 0x26A4, 0x2618, 0x2730 : loc_38342, renvoie 0"]
        SETOBJ["Goal_SetObjective_A307<br/>slot +0x10 de l'entité, lue à +0x55<br/>pose entité+0x11D, cibles et positions"]
        CTRL --> EFC
        EFC -->|"entité +0x55, slot +0x10"| SETOBJ
        SETOBJ -->|"état entité+0x11D lu par"| HANDLERS
    end

    subgraph RENDER["Parcours de la liste des objets suivis - phase affichage"]
        NOTIFY18["TrackedObjects_CallSlot18OnActive_22F10<br/>liste 0x59CD, objets actifs"]
        FSTEP["TrackedObject_FrameStep_2DF0D<br/>slot +0x18 du sous-vtable à +0x50"]
        TOUCH["WorldObjects_CallSlot4OnAllThenRecompute_2214F"]
        SLOT4["WorldObjects_CallSlot4OnAll_22D6C<br/>slot +4 de tous les nœuds, rôle inconnu"]
        NOTIFYW["TrackedObject_NotifyWorldObjects_2DFE4<br/>slot +0x20"]
        WRAP["UIScreen_RenderGraphVGA_Wrapper_50E44"]
        SLOT1C["WorldObjects_CallSlot1COnActive_2217D<br/>slot +0x1C des nœuds actifs, rôle inconnu"]
        FRAME --> NOTIFY18
        NOTIFY18 -->|"slot +0x18"| FSTEP
        FSTEP --> TOUCH
        TOUCH --> SLOT4
        FSTEP -->|"slot +0x20"| NOTIFYW
        NOTIFYW --> WRAP
        WRAP --> SLOT1C
    end

    LIST[("liste chaînée, tag 0x59C3<br/>nœuds = objets monde<br/>vtable à +0, suivant à +2, actif à +5")]
    READERS["Lecteurs de la liste :<br/>AI_ScanForNewTarget, AI_RadarScanTarget<br/>Targeting_AcquireBestThreat<br/>Player_MainUpdate, Radar_ZoomIn ..."]
    APPTAIL --> LIST
    LIST --> UPDALL
    LIST --> SLOT1C
    LIST --> SLOT4
    LIST --> READERS

    UPD -.->|"entité liée +0x55"| ECONSTR
    CONSTR -.->|"écrit +0x55"| UPD

    classDef ok fill:#dcfce7,stroke:#22c55e,color:#1e293b
    classDef prob fill:#fef3c7,stroke:#f59e0b,color:#1e293b
    classDef unread fill:#e5e7eb,stroke:#6b7280,color:#1e293b
    classDef key fill:#dbeafe,stroke:#3b82f6,stroke-width:3px,color:#1e293b
    class LOOP,TICK,FRAME,COMBAT,RESET,UPDALL,UPD,ALIVE,TESTALIVE,MASTER,CLEAR,FOLLOW,SPAWNFN,PROTO,ECONSTR,RESETBLK,ADD,APPIF,APPTAIL,LOADW,LOADG,PROF,CAST,NOTIFY18,FSTEP,TOUCH,SLOT4,NOTIFYW,WRAP,SLOT1C,MLOAD,WRLD ok
    class TOPTHINK,REACT,GROUND,SLOTS,HANDLERS,EFC,SETOBJ,BSM,BSEL,BSCORE ok
    class CONSTR,CREATE,BEHAV,CAM,CMD,FLAG,UISCRIPT,ACTIVEOBJ prob
    class SLOT8,MOUNT,EMIT,TRIGGER,PICK unread
    class MASTER key
```

## Le chemin vers `AIEntity_MasterTick_5ACC` (lu, maillon par maillon)

| # | Appel | Où c'est lu |
|---|---|---|
| 1 | `STRIKE_EXE_MAIN_LOOP` → `MAIN_GAME_TICK` | déjà dans `MISSION_SCRIPT_OPCODES.md` |
| 2 | `MAIN_GAME_TICK` → `CombatTarget_WeaponActionSubsystem` | `seg114`, appel direct |
| 3 | `CombatTarget_WeaponActionSubsystem` → `WorldObjects_UpdateFrame_ResetCounters_221C2` (argument : tag 0x59C3) | `seg112` |
| 4 | `WorldObjects_UpdateFrame_ResetCounters_221C2` → `WorldObjects_UpdateAllAndRemoveDead_221F2` | `seg039` |
| 5 | `WorldObjects_UpdateAllAndRemoveDead_221F2` appelle le slot +0x10 de chaque nœud | `seg039` |
| 6 | Slot +0x10 de la classe de vtable 0x2618 = `WorldObject_UpdateWithAIEntity_3D9FB` | `seg339` (vtable), `seg085` |
| 7 | `WorldObject_UpdateWithAIEntity_3D9FB` lit le pointeur d'entité à +0x55 et appelle son slot +0xC = `AIEntity_MasterTick_5ACC` | `seg085`, `seg003` |

## `AI_TopLevelThink` : où se décident les objectifs (lu le 2026-09-19)

`AI_TopLevelThink` (`seg004`) est appelée par `AI_TriggerBehaviorUpdate` (référence de code `AI_TriggerBehaviorUpdate+35`). Ce n'est **pas** une simple boucle sur les emplacements `GOAL` : les objectifs viennent en dernier. Ordre réel, tel que lu (le milieu de la fonction, entre le test de menace et le point `loc_83F0`, n'a **pas** été lu en détail) :

1. **Début** : si `byte_6E4D7` est non nul et `entité+0xB0` ≥ 0xC (`TH` d'après `AI_SYSTEM.md` §1.5), appel de `Targeting_AcquireBestThreat`. Puis `AI_MessageDispatcher` et `Radio_CombatChatterDispatch`.
2. **Le traitement des menaces est sauté** (`jmp loc_83F0`) dans trois cas : `entité+0x11D` vaut `0xA1` (décollage) ou `0xA2` (atterrissage) ; l'avion est au sol (l'octet `+0x20` du sous-objet pointé par le premier champ de l'objet à `entité+0xB` non nul) ; `word_70466` ≤ 3. Sinon, `AI_IncomingThreatWarning` et la mise à jour de la chaîne de cibles (`+0x287` / `+0x289`).
3. **Réactions prioritaires, avant tout objectif** (`loc_83F0`) : si `entité+0x281` est non nul, alors `AI_MissileEvasionReaction_9A77` quand `entité+0x0D` est nul et `entité+0x27F` vaut 2, et `AI_QueryTargetField4B` dans les autres cas. Puis, si rien n'a réagi et `entité+0x27F` ≤ 1, `AI_EngageAttackerReaction_E246`. Si l'un des deux gestionnaires de réaction a réagi, **la fonction se termine ici**.
4. **Objet en cours** : si `entité+0x0D` (pointeur far) est non nul **et** `entité+0x27F` non nul, appel de `[vtable+0xC]` de cet objet, temps cumulé dans `word_704E6+0x5B56`, et **fin de la fonction** : ni `GOAL` ni tournoi. `AI_BehaviorStateMachine_WeightedOptionSelector_9D05` contient le même bloc (si `entité+0x0D` est non nul, pas de nouveau score).
5. **Objectifs** :
   - avion **au sol** (l'octet `+0x20` du sous-objet pointé par le premier champ de l'objet à `entité+0xB` non nul) : `Goal_ExecuteAction_A8AC(entité, 0)` **directement**, quel que soit le tableau `GOAL` ;
   - avion **en vol** : boucle sur les emplacements à `entité+0x1B0` (8 octets chacun), appel de chaque gestionnaire avec `(entité, 0)`, arrêt au premier qui renvoie non nul.
6. **Épilogue** non interprété : si `entité+0x280` non nul et `entité+0x10D` vaut `0x800` et bit 2 de `entité+0x28B` nul, décrémente `entité+0x280`, remet `entité+0x10D` à `0x800` et pose le bit 1 de `[[entité+0x7]+0x1B]`.

Citations : `cmp byte ptr [bx+20h], 0 / jz loc_84E9 / call Goal_ExecuteAction_A8AC` (au sol) ; `mov ax, si / shl ax, 3 / call dword ptr es:[bx+1B0h] / or al, al / jnz loc_850B` (boucle des emplacements) ; `cmp word ptr es:[bx+11Dh], 0A1h` puis `0A2h` (états décollage et atterrissage).

**Valeur `1` du fichier `GOAL`** : dans `PilotProfile_LoadFromPROF`, la boucle de lecture fait `cmp [bp+var_8], 1 / jz loc_73F62`, qui saute le rattachement du gestionnaire **et** l'incrément du compteur d'emplacements. La valeur `1` n'occupe donc aucun emplacement, et `GOAL=1` seul donne un tableau vide (terminé par le bloc `unk_6D188`).

**Ce que `entité+0x0D` n'est pas** : ce n'est pas le nœud `MVRS` gagnant lui-même. `Behavior_PopFinished_75612` y copie `nœud+4/+6` (`mov es:[bx+0Fh], ax / mov es:[bx+0Dh], dx` sur l'objet pointé par `nœud+8`, qui est l'entité), et `NotifiableRef_DetachTarget_75661` le remet à zéro. La règle de comportement est établie (un objet en cours passe avant tout), sa nature ne l'est pas.

## `GOAL` et tournoi `MVRS` : l'arbitrage complet (relu le 2026-09-25)

Relecture intégrale de `AI_TopLevelThink` (y compris son milieu, jamais lu),
`AI_BehaviorStateMachine_WeightedOptionSelector_9D05`, `AI_BehaviorSelector`, des trois
fonctions de pile de comportements (`ovr229`) et de la construction de la table du tournoi
(`PilotProfile_LoadFromPROF_73B4F`, `ovr228`).

### 1. Le comportement en cours est une pile (`entité+0x0D`)

| Fonction | Effet |
|---|---|
| `Behavior_PushRunning_756A4` | `nœud+4 = entité+0x0D` (garde le précédent), `entité+0x0D = nœud` |
| `Behavior_PopFinished_75612` | `entité+0x0D = nœud+4` (restaure le précédent), `entité+0x19 = identifiant du nœud` |
| `NotifiableRef_DetachTarget_75661` | **abandon** : `entité+0x0D = 0` (pas de restauration), `entité+0x19 = identifiant` |

**Presque toutes les méthodes d'application des nœuds `MVRS` s'empilent** (appels de
`Behavior_PushRunning_756A4` dans `MVRS_ID3_*`, `ID4`, `ID6`, `ID7`, `ID8`, `ID14b`, `ID15b`,
`ID16`, `ID19` (attaque au sol), `ID21`…), puis se dépilent elles-mêmes à la fin de leur manœuvre.
Le gagnant du tournoi n'agit donc pas un tick : il devient le comportement en cours et garde
l'avion jusqu'à ce qu'il se termine ou soit abandonné.

### 2. `entité+0x27F` est le niveau de la réaction active

Écrivains : `AI_EngageAttackerReaction_E246` → 1 (entrée en combat : touché, ou un avion dans mes six heures) ; `Targeting_AcquireBestThreat` → 2 (missile
gagnant) ; `AI_VisibilityTest` → 3 ; `Escort_WaitLandingClearance` → 4 ;
`Escort_WaitTakeoffClearance` → 5 ; remis à 0 par les mêmes et par `AI_ScanForNewTarget`,
`AI_EvalTargetAttribute`, `AI_MissileEvasionReaction_9A77`. Chaque réaction ne tourne que si
`+0x27F` ne dépasse pas son propre niveau : attente de décollage si ≤ 5, d'atterrissage si ≤ 4,
recherche de cible si ≤ 3, esquive si == 2, entrée en combat contre un attaquant et **tir/poursuite** si ≤ 1.

### 3. Ordre complet d'un tick (`AI_TopLevelThink`)

1. Ciblage éventuel (`byte_6E4D7` et `TH ≥ 12`), messages radio.
2. **Alerte de menace** (sauté en décollage/atterrissage, au sol, difficulté ≤ 3, bit 6 de
   `entité+0x28D` déjà posé, ou `+0x27F > 1`) : si `AI_IncomingThreatWarning` répond, la cible
   `+0x287` est reprise de `+0x289` si besoin, **le comportement en cours est abandonné**, et le
   nœud permanent **`ID=4`** (`entité+0xBD`) est appliqué directement, hors tournoi ; bit 6 de
   `+0x28D` posé (effacé quand plus rien n'est en cours).
3. Si rien n'est en cours : attente de décollage, d'atterrissage, recherche de nouvelle cible
   (selon `+0x27F`).
4. Réactions prioritaires : esquive de missile (`+0x281`, `+0x27F == 2`), entrée en combat contre un attaquant (`AI_EngageAttackerReaction_E246`).
   Si l'une agit : fin.
5. **Comportement en cours** (`+0x0D`) et `+0x27F` non nul : sa méthode `+0xC`, fin.
6. **`GOAL`** : au sol, `Goal_ExecuteAction_A8AC` directement ; en vol, les gestionnaires du
   fichier dans l'ordre, arrêt au premier qui agit.
7. Poursuite d'une rafale de canon si `AI_BehaviorSelector` n'a pas tourné ce tick (bit 2 de
   `+0x28B`).

### 4. Où se trouve le tournoi : à l'intérieur de `GOAL`

`AI_BehaviorStateMachine_WeightedOptionSelector_9D05(entité, nouvelle_cible_sol_autorisée)` n'est
appelée que par des gestionnaires `GOAL` : directement par la valeur **4** (argument 0), et par
`Goal_ExecuteAction_A8AC` (valeur **2**) pour les ordres « détruire » et « défendre »
(argument 0) et `0xAC` (argument 1). Ordre :
1. esquive de missile ;
2. ciblage ;
3. **sans cible aérienne** : esquive si menace missile, sinon attaque au sol si une cible sol est
   acquise et l'argument non nul, **sinon renvoie 0 : le gestionnaire `GOAL` suivant prend la
   main** (errance, navigation…) ;
4. **avec cible aérienne**, si `+0x27F ≤ 1` : `AI_BehaviorSelector` (tir et poursuite). **S'il
   agit, le comportement en cours est abandonné** (`NotifiableRef_DetachTarget_75661`) et la
   fonction renvoie 1 ;
5. sinon, comportement en cours : sa méthode `+0xC` ;
6. sinon, **tournoi** : le gagnant est appliqué (et s'empile).

**Quand `AI_BehaviorSelector` agit-il ?** Il renvoie 1 si le bit de tir est posé **ou** si la
qualité de solution de tir `si` est positive (`loc_8FAF` : `test bit 1 de +0x1B / or si, si / jle`),
et 0 sinon. `si > 0` demande une arme utilisable (masque non nul), une cible à moins de 90° du nez
et une qualité positive (base `10 − écart_nez × 10/35`, pénalités de distance et d'aspect croisé).
Cas non résolu : quand `AI_RadarScanTarget` répond, le saut direct à `loc_8FAF` teste `si` sans
qu'il ait été calculé dans la fonction.

**Conséquence** : le tournoi `MVRS` choisit **comment manœuvrer quand il y a une cible aérienne mais
pas de solution de tir** (cible derrière, hors portée, aspect défavorable, pas d'arme adaptée) ou
quand une réaction de niveau supérieur à 1 est active. Dès qu'une solution de tir apparaît, la
poursuite reprend la main et la manœuvre est abandonnée.

### 5. La table du tournoi contient toujours les 8 nœuds fixes

À la création (`ovr228`) : `mov word ptr es:[bx+200h], 8`. Les entrées 0 à 7 (5 octets : pointeur
du nœud + octet de poids signé, à partir de `+0x202`) sont les identifiants 20, 14, 15, 16, 21, 7,
19 et 4, **poids 0 par défaut**. Chacun est aussi rangé dans un champ dédié pour les appels directs
(`+0xC1` ID 20, `+0xC5` 14, `+0xC9` 15, `+0xCD` 16, `+0xD1` 21, `+0xD5` 7, `+0xD9` 19, `+0xBD` 4).
Dans la boucle de lecture du chunk `MVRS` (paires identifiant, poids), un identifiant fixe **écrit
seulement le poids de son entrée** (`+0x206`, `+0x20B`, `+0x210`, `+0x215`, `+0x21A`, `+0x21F`,
`+0x224`, `+0x229`) ; les autres créent une entrée de plus (`inc word ptr es:[bx+200h]`, 25
entrées au maximum). Les 8 nœuds fixes concourent donc toujours ; ceux dont le score vaut 0 (ID 20,
21) ne gagnent jamais. L'attaque au sol (ID 19, score 5) peut gagner le tournoi quand il y a à la
fois une cible aérienne sans solution de tir et une cible sol avec une arme air-sol.

Score d'une entrée : `score_du_nœud (≥ 1, sinon exclue) + poids_du_fichier ± 1`, meilleur au-dessus
de −1000 ; égalité : le premier garde la place (`jle`).

## Les identifiants `MVRS` 8 à 12, et la table des méthodes vérifiée (relu le 2026-09-25)

### Table des méthodes : adresse vérifiée, noms corrigés

Le nœud porte un tag (`nœud+0`) posé par `PilotProfile_ResolveNamedPropertyNode_742FC`
(`switch` indexé par identifiant − 1, `mov word ptr es:[bx], tag`). Ses méthodes sont à
**`0x6D0B0 + tag`** dans `seg339` : `+0` destructeur, `+4` score, `+8` application, `+0xC` tick.
Vérification : le tag `0x160` (ID 19) donne `GroundAttack_CanEngage_77000`,
`GroundAttack_Start_7709A`, `GroundAttack_PhaseDispatch_77215`. Plusieurs noms de fonctions
portaient un **identifiant décalé d'un cran** ; ils sont corrigés dans `known_functions.json`
(ancien nom rappelé dans chaque résumé) :

| ID | Tag | Score | Application | Tick |
|---|---|---|---|---|
| 1 | `0x2B4` | `MVRS_ID1_ScoreAngularGuarded_3E90` | `loc_EEA0` | `loc_F0C3` |
| 2 | `0x28C` | `MVRS_ID2_Score_3FCB` | `MVRS_ID2_ApplyBreakDirection_F2C8` | `loc_F3B6` |
| 3 | `0x278` | `MVRS_ID3_ScoreAngularSimple_4128` | `MVRS_ID3_ApplyGenericTimer_F6C2` | `MVRS_ID3_Tick_F72B` |
| 4 | `0x264` | `MVRS_ID4_ScoreAngularExtended_41DD` | `MVRS_ID4_ApplyInterceptSolution_FCE1` | `loc_FE39` |
| 5 | `0x250` | `MVRS_ID5_ScoreSubmodeManeuver_434E` | `MVRS_ID5_ApplySetTimer_100B6` | `MVRS_ID5_TickSubmodeSwitch_1011F` |
| 6 | `0x23C` | `MVRS_ID6_ScoreSensorGatedSubmode_45BE` | `MVRS_ID6_ApplySetTimer_1060A` | `loc_10673` |
| 7 | `0x228` | `MVRS_ID7_ScoreManeuverFuelGated_47D4` | `MVRS_ID7_ApplyFuelGatedTimer_10AF2` | `loc_10BD9` |
| 8 | `0x214` | `MVRS_ID8_ScoreAlwaysZero_49DA` | `MVRS_ID8_ApplyTrivialDelegate_1115D` | `MVRS_ID8_TickShadowTarget_111AE` |
| 9 | `0x200` | `MVRS_ID9_ScoreAlwaysZero_4A02` | `MVRS_ID9_ApplyEndsAtOnce_112F7` | `MVRS_ID9_TickEndsAtOnce_1130C` |
| 10 | `0x1EC` | `MVRS_ID10_ScoreAlwaysZero_4A2A` | `MVRS_ID10_ApplyEndsAtOnce_1131D` | `MVRS_ID10_TickEndsAtOnce_11332` |
| 11 | `0x1D8` | `MVRS_ID11_ScoreAlwaysZero_4A49` | `MVRS_ID11_ApplyEndsAtOnce_11343` | `MVRS_ID11_TickEndsAtOnce_11358` |
| 12 | `0x1C4` | `MVRS_ID12_ScoreAlwaysZero_4A71` | `MVRS_ID12_ApplyEndsAtOnce_11369` | `MVRS_ID12_TickEndsAtOnce_1137E` |
| 13 | `0x1B0` | `MVRS_ID13_ScoreScissorsRollaway_4A99` | `MVRS_ID13_ApplySetTimer_1138F` | `MVRS_ID13_TickManeuverSequence_113FD` |
| 14 | `0x19C` | `MVRS_ID14_ScoreIntercept_4CD1` | `MVRS_ID14_Apply_11763` | `loc_117B4` |
| 15 | `0x188` | `MVRS_ID15_ScoreThreatSensor_4E2A` | `MVRS_ID15_Apply_11809` | `loc_1186E` |
| 16 | `0x174` | `MVRS_ID16_ScoreFuelOrResource_4ECD` | `MVRS_ID16_ApplyReturnToBase_118C3` | `loc_1191D` |
| 19 | `0x160` | `GroundAttack_CanEngage_77000` | `GroundAttack_Start_7709A` | `GroundAttack_PhaseDispatch_77215` |
| 20 | `0x14C` | `MVRS_ID20_ScoreAlwaysZero_4F54` | `MVRS_ID20_ApplyStoreNavCommand_1195A` | `MVRS_ID20_TickApplyGuidance_11A04` |
| 21 | `0x138` | `MVRS_ID21_ScoreAlwaysZero_4F6A` | `MVRS_ID21_ApplyAutopilotNav_11AC4` | `MVRS_ID21_TickAutopilotNav_11B16` |

(Tag `0x2A0` = classe de base : score `MVRS_SharedContextSyncAndID2Score_EC22`.) Les tableaux
récapitulatifs de `AI_SYSTEM.md` §3.7 associaient déjà les bonnes adresses aux identifiants ; ce
sont les noms de fonctions qui étaient restés décalés.

### Ce que font les identifiants 8 à 12

- **Le score commun** `MVRS_SharedContextSyncAndID2Score_EC22`, appelé en tête de chaque score :
  marque le nœud évalué (`nœud+0x0C = 1`), lui donne la cible aérienne (`nœud+0x13`), une copie du
  vecteur de contexte (`nœud+0x15..0x1D`) et règle son **minuteur à 2 s** (`nœud+0x0D`, valeur
  posée par le tournoi dans le contexte).
- **Scores des ID 8 à 12 : toujours 0.** Chacun appelle le score commun, puis `xor dx, dx`, borne
  `dx` entre 0 et 9 (`cmp dx, 9 / jle … or dx, dx / jg … xor dx, dx`) et le renvoie ; l'ID 10 écrit
  directement `mov word ptr [bp-2], 0`. C'est la forme exacte des vrais scores (borne [0, 9]) **sans
  aucun terme** entre l'initialisation et la borne. Or le tournoi exclut une entrée de score nul
  avant d'ajouter le poids du fichier (`jz loc_9FBF`) : **ces nœuds ne peuvent pas gagner**, quel
  que soit leur poids.
- **ID 9 à 12 : coquilles vides.** Application = appel de son tick ; tick =
  `Behavior_PopFinished_75612` seul. Même s'ils gagnaient, ils se termineraient dans l'instant.
- **ID 8 : manœuvre complète, mais inaccessible.** Application : s'empile comme comportement en
  cours, coupe le pilote automatique, appelle son tick. Tick (`MVRS_ID8_TickShadowTarget_111AE`) :
  tant que la cible existe et que le minuteur (2 s) n'est pas écoulé, vise **la position de la
  cible + 100 dans l'axe de sa vitesse**, commande la vitesse d'interception avec une distance de
  `dword_7201C / 2 = 900`, et guide vers ce point (`AI_GuidanceCmd_FromOwnPos`, taux 10). C'est
  une manœuvre « se caler derrière la cible, dans son axe » : codée, mais son score ne rend jamais
  autre chose que 0.

### Aucun autre chemin ne les atteint (vérifié)

- Les étiquettes de ces fonctions n'ont qu'une référence : leur entrée dans la table `seg339`
  (`DATA XREF`), aucun appel direct.
- Aucun code ne parcourt la table du tournoi (`entité+0x200/+0x202`) en dehors du chargeur, du
  destructeur (`AIEntity_Destruct_74E1C`) et du tournoi.
- Aucune comparaison de l'identifiant d'un nœud (`nœud+0x21`) à 8, 9, 10, 11 ou 12 ; les seuls
  nœuds appelés directement sont les 8 nœuds fixes (champs `+0xBD` à `+0xD9`).
- Le poids du fichier n'est lu que par le tournoi.

### Pourquoi les profils les contiennent : ce qu'on peut dire

Dans **ce** binaire, les identifiants 8 à 12 n'ont aucun effet de jeu ; leur place dans les
fichiers `PROF` (Billy, Stern et Hammer listent 1 à 13, avec 0 pour 8 à 12 ; Gwen omet 8, 9, 10)
s'accorde avec un catalogue de manœuvres **prévu plus large que ce qui a été programmé** :
emplacements réservés dans la classe (constructeur, vtable, score borné), une manœuvre écrite
(ID 8) dont le score n'a jamais été rempli, et des données éditées pour le catalogue complet.
Deux points restent à vérifier par Rémi côté données : la version exacte de l'exécutable
(disquette, CD, *Tactical Operations*) par rapport à celle des fichiers `PROF`, et si un profil du
jeu donne une valeur non nulle à l'un de ces identifiants.

### Le vrai nœud ID 21 : navigation au pilote automatique physique

`MVRS_ID21_ApplyAutopilotNav_11AC4` / `MVRS_ID21_TickAutopilotNav_11B16` (score toujours 0,
appelé directement via `entité+0xD1`) : s'empile, remet à 0 le drapeau « point atteint » ; puis à
chaque tick, si le pilote automatique est coupé, **remet d'abord le nez à l'horizontale**
(`AI_PitchToAngleCmd_7E18(0°, 5°)`) et **active le pilote automatique** (`JDYN+0x68 = 0`) dès que
le tangage est sous 15° ; fin (pilote automatique coupé) au bout du minuteur ou quand le point est
atteint. Appelants : `AI_NavSolutionToPoint` (navigation de l'IA vers un point),
`Goal_MoraleReaction_878F` (fuite), `Goal_SelectTransition` (ailier qui a quitté le combat),
`PartEntry_ResolveSpawnPositionAndActivate_51EDC`. **Conséquence : dans l'original, l'IA rejoint
ses points de navigation au pilote automatique cinématique** (`PHYSICS.md` §9), pas par les
commandes de manche.

## `ExecuteFlightCommand` : le script pose l'objectif, il ne pilote pas (lu le 2026-09-19)

Chaîne lue : `MissionScript_CallNativeHandler_52513` empile `(contrôleur, opcode, compétence, pointeur de position, dword)` puis fait `les bx, es:[bx+52h] / mov bx, [bx] / call dword ptr [bx+88h]`. Le contrôleur (`PartEntry+0x52`) est l'objet renvoyé par `AIAircraft_SpawnAndConditionalLoadProfile_53363` (`mov ax, di ... retf`), c'est-à-dire l'objet monde créé par `ObjectPrototype_FindOrLoadAndInstantiate_38B70`.

Les objets monde forment une hiérarchie de classes (tables de `seg339`, base `0x6D0B0` + décalage de classe) : `0x26A4` → `0x2618` (entité IA à `+0x55`) → `0x2730` → `0x27BC`. Contenu du slot `+0x88` :

| Classe | `+0x88` | Effet |
|---|---|---|
| `0x26A4`, `0x2618`, `0x2730` | `loc_38342` (`xor ax, ax / retf`) | ne fait rien, renvoie 0 |
| `0x27BC` | `loc_3E419` (`seg087`) | `call dword ptr [bx+10h]` sur l'entité lue à `[si+55h]` |

Le slot `+0x10` de l'entité (table `0x110`) est **`Goal_SetObjective_A307`**. Elle reçoit `(entité, opcode, cible, pointeur de position, dword)`, écrit `entité+0x11D` (l'état d'objectif lu par `Goal_ExecuteAction_A8AC`) et les références de cible / positions, puis, dans sa queue commune (`loc_A641`) :
1. si l'état vaut `0xAA` (suivi) ou si le bit 3 de `entité+0x28B` est posé, appelle `Goal_FollowAllyExec` immédiatement ;
2. sauf si le bit 5 de `entité+0x28B` est posé, appelle `Goal_IsComplete` sur le nouvel état et **renvoie ce booléen**, qui remonte jusqu'à l'instruction de script (`taskState`).

Si le bit 5 de `entité+0x28B` est déjà posé à l'entrée (`shr ax, 5 / and ax, 1 / jz` puis `jmp loc_A641`), le `switch` est sauté : le nouvel ordre n'est pas enregistré.

**Conséquence** : la chaîne est script → `ExecuteFlightCommand` → `Goal_SetObjective_A307` (pose l'intention sur l'entité) ; l'exécution est ensuite faite par `AI_TopLevelThink` / `Goal_ExecuteAction_A8AC`. Rien dans ce chemin ne pilote l'avion. La complétion vue par le script est le résultat de `Goal_IsComplete_A6D3` évalué **au moment où l'ordre est (re)posé**, pas un booléen mémorisé par l'exécution.

## Le tournoi `MVRS` : conditions d'entrée, et `AI_BehaviorSelector` (lu le 2026-09-19)

Le scoring des nœuds `MVRS` n'est pas la première chose que fait `AI_BehaviorStateMachine_WeightedOptionSelector_9D05` (`seg004`, argument : l'entité et un octet `arg_4` passé par l'appelant, non interprété). Ordre lu :

1. **`AI_MissileEvasionReaction_9A77`** : si elle réagit, la fonction renvoie 1.
2. **Obtenir une cible.**
   - Avec `entité+0x287` non nul (l'objet cible courant : sa position est lue à `+0x12`, comme dans `AI_BehaviorSelector`) : si l'aéronef de cette cible a le bit 5 de `flags_75` posé, `Targeting_AcquireBestThreat` est rappelée et, sans résultat, la fonction renvoie 0.
   - Sans `+0x287` : si `+0x281` est non nul, ou si `+0x283` est non nul et `arg_4` non nul, un minuteur (`Timer_OneShotEvent_A288` sur `entité+0x174`) limite les rappels ; sinon `Targeting_AcquireBestThreat` est appelée directement. Sans résultat, renvoie 0.
3. **Branche sans cible** (`+0x287` nul après l'étape 2) : si `+0x281` est non nul, renvoie le résultat de `AI_MissileEvasionReaction_9A77` ; si `+0x283` est nul, ou `arg_4` nul, renvoie 0 ; sinon applique **directement** le nœud permanent à `entité+0xD9` (`call [vtable+8]`, sans passer par le tournoi) et renvoie 1.
4. **Branche avec cible** (`+0x287` non nul) : si `entité+0x27F` ≤ 1, appelle **`AI_BehaviorSelector`** ; s'il renvoie non nul, la fonction s'arrête (avec détachement de `entité+0x0D` si non nul, `NotifiableRef_DetachTarget_75661`) et renvoie 1.
5. Sinon : si `entité+0x0D` est non nul, appel de son `[vtable+0xC]` et fin ; **c'est seulement si `entité+0x0D` est nul que la boucle de score s'exécute**.

Boucle de score (`entité+0x202`, 5 octets par entrée, `entité+0x200` entrées), citations : `call dword ptr [bx+4]` (score, un octet), `call CRT_Rand / test ax, 1 / mov cx, 1` ou `mov cx, 0FFFFh` (bruit **±1**, jamais 0), `add dx, ax` avec l'octet signé `es:[bx+4]` (valeur du fichier), `cmp cx, di / jle` avec `di` initialisé à `0FC18h` (**−1000**). Un score nul exclut l'entrée avant le bruit ; un perdant voit son mot `+2` remis à 0 ; le gagnant reçoit `call dword ptr [bx+8]` (application), et la fonction renvoie 1. Le deuxième argument des scores est un petit contexte construit sur la pile : la cible `entité+0x287` et un pointeur vers une copie du vecteur de `entité+0x1A4`.

**`AI_BehaviorSelector` (313 lignes)** est le **tir et le guidage vers la cible courante**, pas un choix d'instinct. Sans `+0x287` elle renvoie 0. Sinon, dans l'ordre :
1. vecteur cible moins position propre (positions à `+0x12` de la cible et de l'objet lié `entité+0x102`) ; pose le bit 2 de `entité+0x28B` ;
2. efface les bits 6 et 1 de l'octet `+0x1B` du bloc d'état (`[[entité+0x7]+0x1B]`, le bloc de `AircraftStateBlock_Reset_12931` commun au joueur et à l'IA) ; le bit 1 est le bit de tir posé plus bas ;
3. `AI_RadarScanTarget` ; s'il renvoie non nul, fin ;
4. **rafale en cours** : si `entité+0x280` non nul et `entité+0x10D` vaut `0x800`, décrémente `+0x280`, pose le bit de tir, et saute au guidage ;
5. sinon `AI_SelectWeaponMask_9665` (résultat rangé à `+0x1A2`), `AI_ManeuverSolution_Major`, `AI_ComputeFireSolutionQuality_91DF` (résultat `si`, rangé à `+0x1A0`), puis `AI_FireWeaponTrigger`. Quand `+0x1A2` vaut `0x800` : `si` est ramené à 10 si `AI_ManeuverSolution_Major` a répondu non nul et `si` > 5 ; si `si` ≥ 2 et `Pilot_ReactionThreshold_B6(entité, si)` réussit, la longueur de rafale `+0x280` vaut `((rand & 3) + 4) * si / 10`, avec bit de tir si elle est supérieure à 1. Quand `+0x1A2` est différent de `0x800` et `si` > 0 : si `AI_FireWeaponTrigger` renvoie non nul et que l'objet suivi par l'arme sélectionnée (`[[entité+0x104]+0xD]`) est la cible, `WeaponStation_TestTargetLock` (nom trompeur) décide du bit de tir ; si ce n'est pas la cible, c'est le bit 6 qui est posé ;
6. si le bit de tir est posé : `+0x10D = +0x1A2`, message radio `0x20` (`Radio_PlayMessage`) si la cible est le joueur ;
7. **guidage** : sauf si `AI_ManeuverSolution_Major` a répondu non nul, appelle `AI_Sensor_WeaponVelocityCache` puis `AI_GuidanceSolution_Major` (poursuite vers la cible) ; renvoie 1 s'il a tiré ou guidé, 0 sinon.

Les temps sont cumulés dans `word_704E6+0x5B56` (objet en cours), `+0x5B60` (score) et `+0x5B6A` (`AI_BehaviorSelector`) : des compteurs de mesure de durée par composant, sans effet de jeu apparent.

**Conséquence** : tant qu'il y a une cible et que `entité+0x27F` ≤ 1, le tir et la poursuite sont faits par `AI_BehaviorSelector`, **avant** le tournoi. Le tournoi ne score que si cette fonction ne fait rien (renvoie 0) et qu'aucun objet n'est en cours à `entité+0x0D`. Le rôle de `entité+0x27F` est établi plus haut (« `GOAL` et tournoi `MVRS` », §2).

## Le choix de cible et le traitement des menaces : `Targeting_AcquireBestThreat` (lu le 2026-09-20)

`Targeting_AcquireBestThreat` (`seg001`, 1347 lignes, argument : l'entité et un octet `arg_4`) est **le sélecteur de cible et de menace** de l'IA. Ce n'est pas un tick physique (ancien nom faux). Appelée par `AI_TopLevelThink`, par `AI_BehaviorStateMachine_WeightedOptionSelector_9D05` et par une méthode de vtable de `seg339` (quand son argument `arg_2` est non nul). À chaque appel elle **note tous les objets du monde** et retient le meilleur. Les lectures du chronomètre PIT (`+0x5B2E`) ne servent qu'au profilage.

### Les catégories d'objet (résolues le 2026-09-20)

La fonction lit une **catégorie** par `call [vtable+8]` sur l'objet modèle du candidat. Cette méthode est, dans toutes les classes lues, un `mov al, <constante> ; retf`. La classe est fixée au chargement du fichier `OBJECTS\<nom>.IFF` par `IFF_LoadModelMain` (`seg083`) : elle teste les chunks dans un ordre fixe, **le premier présent** choisit la classe (taille allouée + suite d'écritures du mot de vtable, la dernière gagne).

| Chunk présent | Vtable finale (`seg339`) | Catégorie (`vtable+8`) | Rôle |
|---|---|---|---|
| `BOBJ` / `ORNT` (base) | `1B6F` | 0 | objet de base |
| `MOBL` | `2504` | 2 | non testée par la fonction |
| `OMOB` | `252C` | 3 | — |
| `GUID` | `24F0` | 4 | inconnu (seul `MISS` sert aux missiles dans le jeu, fait vérifié côté données) |
| `ARMG` | `24DC` | 5 | — |
| **`JETP`** | `24C8` | **6** | **avion à réaction** |
| `WEAP` | `2540` | 7 | — |
| **`MISS`** | `2498` | **8** | **missile** |
| `BOMB` / `DURD` | `2460` / `2444` | 9 | — |
| `PODR` | `247C` | 0x0A | — |
| `TRCR` | `255C` | 0x0D | — |
| `AFTB` | `2518` | 0x0E | — |
| `DECY` | `2430` | 0x10 | leurres (fait vérifié côté données) |
| **`SWPN`** | `241C` | **0x13** | **défenses fixes : AA, batteries, SAM, navires** (fait vérifié côté données : objets chargés et codés dans libRealSpace) |
| `GRND` | `2408` | 0x14 | — |
| `XMIT` | `24B4` | 0x15 | — |

Corrections : l'ancien commentaire de la fonction (« 2 = aéronef, 6 = missile, 8 = contre-mesure ») était **faux**. C'est 6 = avion, 8 = missile. Le mapping chunk → vtable finale est lu dans `IFF_LoadModelMain` (dernier `mov word ptr es:[bx], …` de chaque bloc). Que les objets du monde utilisent ces mêmes classes est très vraisemblable, mais n'est pas suivi jusqu'à `ObjectPrototype_FindOrLoadAndInstantiate_38B70`.

### Deux niveaux d'objets

Un candidat est un **nœud de la liste 0x59C3** (pointeur near, mot de vtable à `+0`, `call [vtable]` = résolution vers l'objet modèle far). Les champs sont sur deux objets :
- **nœud** : camp `+0x50`, pointeur `+0x51`, dword `+0x53`, référence `+0x55`, pointeur far `+0x5A` (dont `+0x0D`). `+0x55` dépend de la classe : pour un missile, il désigne visiblement sa cible.
- **objet modèle** (résolu) : `+0x11`, `+0x3E` (portée), `+0x4B` (masque), `+0x4E`, `+0x52` (octet de classe), et la catégorie par `vtable+8`.

Le nœud de mon avion est à `entité+0x102` (sa position, à `+0x12`, sert de point de départ).

### Entrée

1. Efface le bit `0x08` de `entité+0x28D` ; si `entité+0x27F` vaut 2, le remet à 0.
2. **Court-circuit** : si `byte_6E33B` est non nul (mis à 1 par `IFF_LoadModelMain`), `entité+0x287` reçoit `word_722E6` (le joueur), `+0x281` et `+0x283` sont vidés, et la fonction renvoie `word_722E6`.
3. Prépare : score initial **−5000** (`0EC78h`), deux poids issus de la copie `ATRB` (`+0xB0` = `TH`, `+0xB8` = `AR`) : `var_16 = (AR − TH) + 16` (multiplie le score A) et `var_18 = (TH − AR) + 16` (multiplie le score B), et **quatre tests d'arme chargée** par `WeaponStation_FindLoadedCompatible` sur `entité+0x104` : masques `1`, `3`, `0x700`, `0x83C`. Efface `entité+0x17A`.

### Qui est candidat

Chaque objet de la liste 0x59C3 est ignoré s'il est nul ou s'il s'agit de l'entité elle-même. Un objet est **candidat** si l'un de ces cas est vrai :

- **Missile (catégorie 8)** dont `nœud+0x55` est mon avion et dont `+0x4E` (objet modèle, `target_domain`) vaut 1 : un missile guidé anti-avion qui me vise.
- **Avion (catégorie 6) hostile**, si le propriétaire du nœud (`nœud+0x51`, méthode `vtable+0x48`) n'a pas le bit 5 de `flags_75`, et si ma propre classe (`+0x52`) est ≥ 6.
- **Objet hostile avec `+0x11` = 2**, seulement si `arg_4` est non nul **et** qu'une arme du masque `0x83C` est chargée.

**Hostile** = `nœud+0x50` du candidat est l'opposé (signe inversé) du mien.

### Deux notes par candidat

Le calcul produit un score **A** (`di`), un score **B** (`var_12`) et une **aptitude** `si`. Le score final est `var_16·A + var_18·B`. Les distances utilisent `Math_VectorLength3D_Raw` ; les angles d'aspect `Targeting_ComputeBearingElevation`. Les portées `dword_72020/24/28/2C/30` viennent de `NUMS` (24.8, comparées par `shl 8`).

**Objets à `+0x11` = 2** (dont les défenses fixes `SWPN`) :
- si le candidat est la cible de mission `entité+0x137` : `si +3`, `A +6` ;
- **catégorie 0x13 avec `nœud+0x53` > 0** : portée R = `objet+0x3E`. Hors de R : B = 0. Dans R : `B = 10·(1 − d/R) + 5` ; `+4` si aucune arme `0x83C` n'est chargée ;
- puis, avec `dword_72030` : hors portée, `si −4` ; dans la portée et l'angle < 45° : `si +5`, `A +6` ; entre 45° et 90° : `si +3`, `A +3` ; au-delà : rien.

**Autres objets** (missiles, avions) : un angle d'aspect > 90° du côté du candidat met B à 0.
- **Missile (8)**, seulement s'il est dans `dword_72024` (et dans `dword_7202C` quand le masque `+0x4B & 0x700` est nul) : `B += 16·(1 − d/R) + 24` ; `si += TH²/16 − 8` ; `si +4` si `entité+0x287` ou `+0x283` désigne l'objet renvoyé par `vtable+0x38` du nœud ; `si −4` si l'angle > 135° et le bit `0x02` de `entité+0x28B` est absent ; encore `si −4` si la géométrie (`Vector_NormalizeInPlace_5593A` (normalisation) puis `Math_DotProduct3D_5505B` (produit scalaire)) donne une valeur < −180 et que ce même bit est absent.
- **Avion (6)** : bandes d'angle (> 135°, > 90°, > 30°, sinon) qui ajoutent à `si`, `A` et `B` (de −4 à +8), une seconde géométrie < −180 (`si −4`), des bandes sur le second angle (80–100° : `A −5` ; 60–120° : `A −3`), puis des bandes de distance selon les armes chargées : au-delà de `dword_72024` `si −3`, `A −5` ; au-delà de `dword_72020` avec masque `0x700` `si −1`, `A +3` ; avec masque `3` : au-delà de `dword_7202C` `A −2`, `si −1`, en deçà de `dword_72028` `A −1`, `B +4` ; sans masque `1`, l'angle > 150° donne `A −3`, > 60° `A −1`.
- **Persistance (avions seulement)** : candidat = `entité+0x287` → `A +3`, `si +5` ; candidat = `+0x289` → `si +3`, `B +5` ; l'avion qui me vise déjà (`nœud+0x5A` → `+0x0D` = mon nœud) → `si +2`, `B +1` ; terme de classe comparant `objet+0x52` à `byte_72038` et à ma classe (B = 0 si `byte_72038` ≥ classe).
- **Tous** : bit `0x02` de `entité+0x28B` posé → `si +4` ; candidat = `entité+0x285` → `A +10`, `si +5`.

### Filtre de compétence et sélection

`Pilot_SkillCheck_B0(entité, si)` est **une porte** : un candidat qui échoue est ignoré. Lue le 2026-09-20 (31 lignes) : `seuil = (octet signé entité+0xB0, c'est-à-dire TH) + si` ; `tirage = (CRT_Rand & 0x0F) + 1` (1 à 16) ; **réussite si `tirage ≤ seuil`**. Un `seuil` ≤ 0 échoue toujours, un `seuil` ≥ 16 réussit toujours. Le tirage est refait à chaque candidat et à chaque appel. `Pilot_SkillCheck_B1`, `_B7` et l'homologue de `+0xB8` sont identiques sur `CN`, `SM` et `AR`. Pour un **missile** qui réussit, `entité+0x281` reçoit le candidat **tout de suite**, même s'il ne gagne pas. Le candidat dont le score final dépasse le meilleur (départ −5000) devient le meilleur.

### Résultat : trois champs, selon la catégorie du gagnant

| Gagnant | `+0x281` | `+0x283` | `+0x287` | `+0x27F` |
|---|---|---|---|---|
| **missile (8)** | le missile | vidé | vidé | **2** |
| objet à `+0x11` = 2 | inchangé | le gagnant | vidé | inchangé |
| autre (avion…) | inchangé | vidé | le gagnant | inchangé |

Sans gagnant, **rien n'est modifié** : la cible précédente persiste. La fonction renvoie le gagnant (0 si aucun).

### Ce que ça change pour le tick

- **Un missile qui me vise peut retirer la cible d'attaque.** S'il gagne, `+0x287` et `+0x283` sont vidés et `+0x27F` passe à 2. Pour ce tick : `AI_BehaviorStateMachine_WeightedOptionSelector_9D05` n'appelle pas `AI_BehaviorSelector` (il exige `+0x27F` ≤ 1) et, sans `+0x287`, ne score pas les instincts (renvoie 0, ou applique directement le nœud `+0xD9` si `+0x283` et `arg_4` sont non nuls). `+0x27F` est remis à 0 à l'appel suivant. **La fonction ne largue rien et ne détruit rien** : elle désigne la menace. La réaction défensive est ailleurs (non lue : lecteurs de `+0x281` et de `+0x27F == 2`).
- **L'attaque est aussi sélectionnée ici** : les avions hostiles et les défenses fixes en concurrence, avec persistance de la cible courante, pondérés par les traits `ATRB` et filtrés par la compétence.
- **La priorité des défenses fixes** dépend de leur portée `objet+0x3E` : elles comptent quand j'y entre.

### Les masques d'armes sont des ensembles d'identifiants d'arme (lu le 2026-09-20)

`Weapon_LoadWDATChunk_A0700` (chargeur du chunk `WDAT`) convertit le `weapon_id` du chunk en masque de bit par `WeaponId_ToTypeMask_9DE60` (`bit = id − 1`) et le range dans le mot `objet+0x4B` de l'arme. `WeaponStation_FindLoadedCompatible` teste ce masque sur chaque station d'armement chargée. Les quatre masques de `Targeting_AcquireBestThreat` sont donc des ensembles d'armes (identifiants confirmés par Rémi) :

| Masque | Bits | Armes |
|---|---|---|
| `1` | 0 | AIM-9J |
| `3` | 0, 1 | AIM-9J, AIM-9M (missiles infrarouge courte portée) |
| `0x700` | 8, 9, 10 | AIM-120, SA-2, SA-6 (missiles longue portée) |
| `0x83C` | 2, 3, 4, 5, 11 | AGM-65D, LAU-3, MK-20, MK-82, canon 20 mm (armes sol et canon) |
| `0xFC` | 2 à 7 | AGM-65D, LAU-3, MK-20, MK-82, Durandal, GBU-15 (armement sol) |

Le canon n'entre dans aucun masque air-air : pour un candidat avion, il n'est jamais testé. Pour un missile qui me vise, `objet+0x4B & 0x700` distingue les missiles longue portée (seuil `dword_72024` = 45000) des infrarouge (seuil `dword_7202C` = 17700).

### `objet+0x11` = `target_type` (lu le 2026-09-20)

`Debris_LoadFieldMix_9BA85` (`ovr302`, chargeur de la base de **tous** les objets modèle) lit le chunk **`TRGT`** (`push large 54475254h`) : son premier octet va dans `objet+0x11` (0 si le chunk est absent). C'est le champ `target_type` de `RSEntity` (que `parseREAL_OBJT_JETP_TRGT` remplit pour les `JETP`). Le même chargeur lit le chunk `SIGN` dans `objet+0x12`, `+0x13`, `+0x14` (3 octets : `RADAR_SIGN`).

Rapprochement avec le champ `WDAT` `+0x4E` (`target_domain`, voir la section des deux octets de classe) : la valeur 2 de `target_type` est celle des cibles qu'on attaque avec des armes qui ne sont pas des missiles anti-avion (canon, bombes, AGM-65D, GBU-15). Le test `+0x11 == 2` de `Targeting_AcquireBestThreat`, de `Goal_ExecuteAction` et de `MVRS_ID14_ScoreWeaponReadiness` signifie donc « cible sol ». Ces deux dernières exigent alors une arme du masque `0xFC`, et `Targeting_AcquireBestThreat` une arme du masque `0x83C`. Les masques d'armes (`WeaponStation_FindLoadedCompatible`) testent le mot `+0x0D` de chaque station d'armement (35 octets, quantité en `+0x13`) ; `WeaponStation_SelectForTarget` choisit la station dont `+0x0D` égale `objet+0x4B` de la cible.

### Restes non lus

`nœud vtable+0x38` et `+0x48`, le sens exact de la valeur 2 de `objet+0x11` (voir « `objet+0x11` = `target_type` » ci-dessus), `objet+0x4B`/`+0x4E`/`+0x52`, les bits de `entité+0x28B`, les champs `+0x281`/`+0x283`/`+0x285`/`+0x287`/`+0x289` côté lecteurs, la valeur de `arg_4`.

## Le tir : choix de l'arme, rafale, seuil de réaction (lu le 2026-09-20)

**Choix de l'arme — `AI_SelectWeaponMask_9665`** (ancien nom `AI_Cluster_9665`). Elle renvoie un masque de type d'arme (bit = `weapon_id` − 1), rangé dans `entité+0x1A2` ; 0 veut dire « aucune arme ». Sans cible aérienne, 0. Pour la cible (`air_target`), elle calcule la distance `d` et deux angles : `di`, l'écart entre mon nez et la cible ; `si`, l'écart entre le cap de la cible et la direction vers elle (0 = la cible me tourne le dos, 180 = face à face). Un « aspect croisé » vaut 40 < `si` < 140. Règles, dans l'ordre :
1. `di` ≥ 90° : aucune arme.
2. `d` < 1800 et canon (`0x800`, AIM ID 12) chargé : **le canon**.
3. `d` > 4000 (`range_medium`) et missile longue portée (`0x700`) chargé : **ce missile**.
4. Missile infrarouge (`0x3`) chargé et `d` < 17 700 (`range_long`) : **AIM-9J (`0x1`)** si l'aspect est croisé et que l'AIM-9J est chargé, sinon **AIM-9J ou AIM-9M (`0x3`)**.
5. Sinon aucune arme.
Les masques `0x1`, `0x3` et `0x700` ne sont testés que si le bit 0 de `entité+0x28B` est posé (valeur par défaut de `NUMS`). Si la cible est le joueur, `di` < 30, `si` < 30 et `d` < 17 700, elle pose aussi la référence globale `0x523A` sur mon nœud (« un IA est dans les six heures du joueur » : rôle non lu).

**Déclenchement — `AI_FireWeaponTrigger`** : efface le bit `0x08` de `entité+0x28D` et appelle `WeaponStation_ValidateReady` avec le chargement d'armes et le masque de `+0x1A2`. Cette fonction parcourt les points d'emport (stride `0x12`), retient le premier dont l'arme a un masque de type compatible et lance la routine d'engagement de ce point d'emport ; elle renvoie 1 si un point d'emport a été engagé.

**Seuil de réaction — `Pilot_ReactionThreshold_B6`** : test **sans hasard**. Il renvoie 1 si `2 × si` ≥ `AA` (trait air-air, `entité+0xB6`), avec `si` la qualité de solution de tir. Plus `AA` est élevé, plus le pilote attend une bonne solution avant de tirer ; un pilote faible tire dès qu'il a une solution médiocre.

**Rafale de canon** (`AI_BehaviorSelector`) : si le masque vaut `0x800`, `si` est ramené à 10 quand la manœuvre principale répond non nul et que `si` > 5. Si `si` ≥ 2 et que le seuil de réaction réussit, la longueur de rafale vaut `((rand & 3) + 4) × si / 10` (en appels de contrôle de tir, donc en 25<sup>e</sup> de seconde) ; le bit de tir est posé si elle dépasse 1. Elle est ensuite décrémentée à chaque appel.

**Ce que ça dit des traits** : ni `TH` ni `AR` n'interviennent dans le choix de l'arme, le seuil de réaction ou la rafale. Le trait qui décide du tir est **`AA`**. `TH` et `AR` agissent sur le choix de cible (`Targeting_AcquireBestThreat`).

**Qualité de solution de tir — `AI_ComputeFireSolutionQuality_91DF`** (ancien nom `AI_ManeuverSolution_91DF`). Elle renvoie un entier `si` de 0 à 10 pour la cible aérienne et l'arme choisie.
- Cible à 90° ou plus du nez : 0. Base : `10 − (écart_nez × 10) / 35`. Aspect croisé (cap de la cible entre 50° et 130° de la direction vers elle) : −4.
- **Canon** : 0 si `d` ≥ 1800 (`range_gun`). Sinon la valeur de base est **écrasée** par une qualité de visée : `erreur` est l'écart angulaire entre la direction vers la cible et le vecteur vitesse **de ma propre arme** (`AI_Sensor_WeaponVelocityCache`, ancien nom `AI_Sensor_TargetVelocityCache` faux ; c'est pratiquement l'écart entre mon nez et la cible) ; `tolérance = arctan(vitesse_cible / d)` ; `écart = erreur − tolérance` ; `si = 8 − 2·écart/tolérance` si l'écart est négatif (donc de 8 à 10), `si = 8 − 4·écart/tolérance` sinon ; puis −4 si l'aspect est croisé.
- **Missiles** : courte portée (masques 1, 2, 3) : `d` ≥ 17 700 : −10 ; `d` < 1800 : −3 (−10 si aspect croisé). Longue portée (0x100, 0x700) : `d` ≥ 45 000 : −10 ; `d` < 4000 : −3 (−10 si croisé). Autre masque : 0.
- Résultat borné à [0, 10]. C'est cette valeur qui est comparée à `2 × si ≥ AA` par `Pilot_ReactionThreshold_B6`.
- Non lus : `Math_ElevationAngle_552E1`, `Math_HeadingAngle_553CF` (la différence d'azimut et d'élévation est reproduite dans libRealSpace par l'angle entre mon nez et la direction vers la cible). L'unité de la vitesse de la cible (`nœud+0x20`) n'est pas établie : libRealSpace utilise `airspeed` (nœuds).

**Encore à lire pour le tir** : `AI_ManeuverSolution_Major`, la routine d'engagement du point d'emport (stub `6C434`), le contrôle de verrouillage des missiles (`WeaponStation_TestTargetLock`, nom trompeur) et la poursuite (`AI_Sensor_WeaponVelocityCache`, `AI_GuidanceSolution_Major`, `AI_RadarScanTarget`).

## `Goal_ExecuteAction` : le répartiteur qui relie l'ordre du script au comportement (lu le 2026-09-20)

`Goal_ExecuteAction_A8AC` lit l'objectif posé par le script (`entité+0x11D`) et **aiguille vers le bon comportement**. C'est elle qui fait le lien entre « détruire la cible » et le tir, la poursuite ou l'attaque au sol. Cas lus (les codes sont ceux de `prog_op`) :
- **`0xA7` détruire la cible** : si un objet est déjà en cours (`+0x0D`), elle l'applique et s'arrête. Sinon, elle résout la **cible de mission** (`+0x137`) ; si cette cible est du type sol (`+0x11 == 2`), elle passe par le **nœud permanent d'attaque au sol** (`+0xD9`) ; sinon (cible aérienne ou aucune) elle appelle **`AI_BehaviorStateMachine_WeightedOptionSelector_9D05` avec `arg_4` = 0**, c'est-à-dire le contrôle de tir, la poursuite et le tournoi.
- **`0xA8` défendre la cible** : navigation vers un point (`AI_NavSolutionToPoint`) ; si elle n'agit pas, `AI_BehaviorStateMachine_WeightedOptionSelector_9D05` (`arg_4` = 0) ; si elle n'agit pas non plus, `Goal_WanderRandom`.
- **`0xAC`** (code non nommé dans libRealSpace) : objet en cours, sinon `AI_BehaviorStateMachine_WeightedOptionSelector_9D05` avec `arg_4` = **1** ; s'il agit et qu'une cible sol a été acquise (`+0x283`), elle est **recopiée dans la cible de mission** (`+0x137`) ; sinon navigation.
- **`0xFFFF` (aucun objectif)** : navigation, puis `Goal_WanderRandom`.
- **`0xAA` suivre l'allié** : `Goal_SelectTransition`. **`0xA4`** : `Goal_ReturnToBase`. **`0xA1`, `0xA2`, `0xA5`, `0xA9`, `0xBF`** : non lus en détail (préparation d'un point, création d'un objet contrôleur pour `0xA1`/`0xA2`).

**Ce que ça établit** : l'ordre « détruire la cible » n'agit sur le combat aérien que par deux voies : la cible de mission entre comme **bonus de score** dans `Targeting_AcquireBestThreat` (l'IA peut donc tirer sur un autre avion mieux placé), et **le répartiteur route l'objectif vers le contrôle de tir** (`AI_BehaviorStateMachine_WeightedOptionSelector_9D05`). Le contrôle de tir n'est donc appelé ni seulement par le sélecteur `4` ni par le tournoi seul : `Goal_ExecuteAction` l'appelle aussi pour les ordres de combat. Un acteur sans `4` dans son `GOAL` mais avec `2` combat donc quand même. Pour une cible **sol**, l'ordre de mission est plus contraignant : le nœud d'attaque au sol est appliqué directement, sans passer par le ciblage.

**Le gestionnaire de tir et de tournoi, relu dans son ordre exact d'appels (2026-09-20)** — `AI_BehaviorStateMachine_WeightedOptionSelector_9D05(entité, arg_4)` :
- **`arg_4` est le drapeau « nouvelle cible autorisée »** : il est passé tel quel à `Targeting_AcquireBestThreat`. Valeurs vues : 0 depuis les cas « détruire la cible » et « défendre la cible » de `Goal_ExecuteAction` (donc pas de cible sol acquise seule), 1 depuis le cas `0xAC`.
- Ordre : (1) `AI_MissileEvasionReaction_9A77` ; (2) obtention de la cible : avec une cible aérienne dont l'aéronef de l'acteur suivi a le bit 5 de `flags_75`, `Targeting_AcquireBestThreat` est rappelée (sans résultat, retour 0) ; sans cible aérienne, elle est appelée directement ou limitée par `Timer_OneShotEvent_A288` (`entité+0x174`) quand une cible aérienne, une référence missile ou (une cible sol et `arg_4`) existe déjà ; (3) **sans cible aérienne** : si une **référence missile** est posée, **c'est `AI_MissileEvasionReaction_9A77` qui répond** (la réaction à un missile n'est donc pas dans le ciblage, mais dans ce gestionnaire de réactions prioritaires, appelé ici et en tête) ; sinon, si une cible sol est posée et `arg_4` non nul, le nœud d'attaque au sol est appliqué ; sinon retour 0 ; (4) **avec cible aérienne** : `AI_BehaviorSelector` (tir et poursuite) si `entité+0x27F` ≤ 1 ; s'il agit, retour 1 ; (5) sinon objet en cours, ou tournoi `MVRS`.

## La réaction à un missile : `AI_MissileEvasionReaction_9A77` (lue le 2026-09-20)

Ancien nom `AI_EscortPriorityReactionHandler_9A77`, faux : `entité+0x281` est la **menace missile** posée par `Targeting_AcquireBestThreat` (et non une référence d'escorte), et `entité+0x27F == 2` est l'état « missile en approche ». La fonction est la **manœuvre d'esquive** :
1. **Nettoyage** : si la référence missile est nulle ou si le missile n'a plus mon nœud pour cible, `+0x27F` et `+0x108` repassent à 0, la référence est vidée, retour 0. Elle n'agit que si `+0x27F == 2` avec une référence non nulle.
2. **Vecteur d'esquive** : vecteur vers le missile, dont la composante verticale est remplacée selon mon altitude et un seuil global (`dword_7203D`) : trop bas, on **monte** (`2 × seuil − altitude`) ; sinon on **descend** (`seuil − altitude`).
3. **Bande de distance du missile** (`AI_ClassifyDistanceBand`, sur le type d'arme du missile) :
   - **bande 1 (proche)** : composante verticale annulée, puis manœuvre **perpendiculaire** à la direction du missile (virage du côté qui demande le moins de rotation par rapport au cap actuel) ;
   - **bande 2 (moyenne)** : perpendiculaire en gardant le changement d'altitude ;
   - **bande 3 (loin)** : les trois composantes sont inversées et `+0x108` passe à 1 : **fuir** le missile ;
   - **bande 0** : aucune réaction, retour 0.
   Pour les bandes 1 et 2, si le missile vient du **joueur** et que mon camp est « ami », un message radio `0x0E` est envoyé au joueur (la fameuse plainte de tir ami), puis `AI_EvalTargetAttribute` (non lue).
4. **Exécution** : `AI_GuidanceCmd_FromOwnPos(entité, vecteur, 10)` (guidage vers ce vecteur) ; la manette est mise à la vitesse maximale de l'avion (`+0x80`) si le guidage renvoie non nul, sinon à la vitesse de croisière (`+0x84`) ; retour 1.
Elle n'utilise **ni leurres ni contre-mesures** : l'esquive est purement manœuvrière. Le rôle exact du seuil `dword_7203D` (calculé à chaque tick par `AIEntity_MasterTick_5ACC`) et de `AI_EvalTargetAttribute` reste à lire.

## La poursuite et l'esquive jusqu'au manche (chaîne déjà lue, rappel 2026-09-20)

La poursuite (`AI_BehaviorSelector`, étape guidage) et l'esquive (`AI_MissileEvasionReaction_9A77`) passent toutes deux par `AI_GuidanceCmd_FromOwnPos` (ou directement `AI_GuidanceSolution_Major`) avec **un vecteur de direction désiré**. La chaîne, lue lors d'une session précédente (`AI_SYSTEM.md` §4bis, `known_functions.json`) :
1. **`AI_GuidanceSolution_Major`** (géométrie et anticipation) : normalise le vecteur, calcule les deltas d'angle (cap et élévation) par rapport à mon avion avec gestion du repli à ±180°, limite l'inclinaison verticale (bornes de −90° et ±45°), prend en compte une garde d'altitude (`dword_7203D`), ma vitesse propre et la capacité de manœuvre de l'avion (`avion+0x67`), puis appelle la décision.
2. **`AI_CombatDecision_Major`** : remet à zéro les commandes partagées, limite les deltas à ±10° en « poursuite fine », puis choisit : écart total < 20° : aucune correction ; ≤ 145° : correction proportionnelle (`AI_RollToAngleCmd_8104`, taux 5) ; > 145° : correction extrême pondérée par le taux de roulis de l'avion (`avion+0x71`, bornée à 16°) ; repli : commande neutre.
3. **`AI_RollToAngleCmd_8104` / `AI_RollController_7E56`** : convertissent l'écart de cap en commande de roulis et de tangage et l'**écrivent dans le champ de commande que lit aussi le joueur** (entrée manche/souris). L'IA et le joueur alimentent donc le même point d'entrée de la physique `JDYN`. *(Corrigé 2026-09-24 : l'écart est un écart de roulis, pas de cap.)*

C'est le pendant, côté libRealSpace, du couple `SCPilot` (qui produit le manche) et de la physique de l'avion.

**Exécution finale, lue le 2026-09-20** : `AI_RollToAngleCmd_8104(entité, cap voulu, zone morte)` calcule `écart = cap voulu − cap courant` (`AI_Sensor_RollAngle_58F4`) et appelle `AI_RollController_7E56(entité, &écart, zone morte)`. Celle-ci remet à 0 la commande partagée avec le joueur, ramène l'écart à ±180°, et **seulement si l'écart dépasse la zone morte** (5° en correction normale, 2° en commande neutre) elle appelle `JDYN_HighLevelPhysicsCalc(avion, sortie, écart)` (le modèle de vol convertit l'écart en valeur de manche), négate la valeur et l'écrit comme entrée de manche. **L'IA de l'original ne tient donc aucune altitude** : elle commande le manche à partir d'écarts d'angle, avec une zone morte. C'est ce que fera l'option B dans `SCPilot`. **⚠️ Corrigé le 2026-09-24 : ce n'est pas un cap mais le ROULIS** (`AI_Sensor_RollAngle_58F4` appelle `Matrix_RollAngle_57C67`, et `AI_RollController_7E56` écrit l'axe de roulis du manche `+0x23`). Voir la section « L'attaque au sol ». La conclusion « aucune altitude tenue, commande par écarts d'angle avec zone morte » reste vraie, mais les angles commandés sont le roulis et le tangage, pas le cap.

## Le tir de missile : engagement, suivi et verrouillage (lu le 2026-09-20)

Pour un masque d'arme autre que le canon, si `si` > 0, `AI_BehaviorSelector` fait :
1. **`AI_FireWeaponTrigger`** : engage le premier point d'emport dont l'arme correspond au masque. Sans point d'emport engagé, rien.
2. **Suivi** : le point d'emport engagé porte un objet suivi (`+0x0D`). S'il n'est **pas** la cible aérienne, l'IA pose le bit 6 (`0x40`) de l'octet de commande du bloc d'état commun : « demande de suivi ». Le tir n'a pas lieu ce tick.
3. **Verrouillage** : s'il est déjà la cible, l'IA appelle **`WeaponStation_TestTargetLock`** (ancien nom `HUD_RenderReticleByWeaponType`) ; si elle renvoie non nul, le bit de tir est posé, sinon rien.

`WeaponStation_TestTargetLock` aiguille selon `weapon_aspec` (`+0x4F`) et appelle **`Targeting_SelectAndPrioritize`**, le modèle de chercheur. **Corrigé le 2026-09-24** (voir « Qui écrit les octets de signature ») : ce n'est pas un seuil que la cible doit franchir pour être verrouillée, c'est la décision de **garder la cible ou de la perdre au profit d'un autre candidat** (leurre, autre avion) : un candidat du cône dont la signature dépasse le seuil (210 pour l'aspec 1, 245 pour l'aspec 2 ; 2e octet `SIGN` ≥ 245 pour l'aspec 4) vole la piste avec une probabilité de 3/10 (5/10 si `vtable+0x38` du candidat vaut `word_722E6`). Il n'y a **aucun test sur le nombre de missiles déjà en l'air** : rien de tel dans ces fonctions. Le rythme entre deux missiles vient donc du suivi (il faut que l'objet suivi redevienne la cible) et du délai d'engagement du point d'emport.

## Faits établis

- **Pourquoi un coéquipier avec `GOAL=1` seul décolle mais ignore ensuite « Follow »** : au sol, `AI_TopLevelThink` appelle `Goal_ExecuteAction_A8AC` sans consulter le tableau `GOAL` ; le décollage s'exécute donc. Une fois en vol, le tableau est vide et aucun gestionnaire ne tourne, d'où l'absence de suivi. *(Corrigé 2026-09-25 : `Goal_MoraleReaction_878F`, la valeur `5`, est une réaction au moral et ne fait pas le suivi ; avec `GOAL = 5, 1`, l'avion décolle puis ne fait plus rien, vérifié en jeu par Rémi : le suivi exige la valeur `2`, voir `AI_SYSTEM.md` §4.4.)*
- **Liste 0x59C3** : liste chaînée d'objets monde (tête à +0xB de l'en-tête, suivant à +2 du nœud, drapeau actif à +5, pointeur de vtable à +0 de l'objet). Ses nœuds ne sont **pas** des entités IA : le slot +4 de la vtable IA (0x110) est un destructeur, alors que `WorldObjects_CallSlot4OnAll_22D6C` appelle le slot +4 de chaque nœud. L'objet du monde pointe vers son entité IA à +0x55.
- **`AIEntity_MasterTick_5ACC`** n'exécute ni GOAL ni MVRS : il prépare l'état (drapeaux, seuils `dword_7203D` / `dword_72039`, chronomètre +0x175, score de menace `word_6D3BC`) puis aiguille vers `Goal_FollowAllyExec` ou `AI_TriggerBehaviorUpdate`. La décision est dans cette dernière (non lue).
- **`byte_6D558`** : drapeau « pilotage automatique ». Mis à 1 et remis à 0 par `UIScript_ParseAndEvaluate_7A054` autour d'une boucle imbriquée. À 1, `WorldObject_UpdateWithAIEntity_3D9FB` n'appelle pas `AIEntity_MasterTick_5ACC`. Selon Rémi (connaissance du jeu) : en pilotage automatique le jeu est mis en pause, le joueur est téléporté vers la destination, le jeu repart, et la caméra change pendant ce temps.
- **Les nœuds de `WorldObjects_UpdateAllAndRemoveDead_221F2` sont mis à jour de façon hiérarchique** : `WorldObject_TestAliveAndUpdateChildren_3800A` met à jour la liste des sous-objets (+0x1E) avec la même fonction.
- **Le nom du PROF vient de la mission** (chunk `CAST`, 9 octets par entrée : nom sur 8 octets et un identifiant), pas du modèle d'avion (indication de Rémi).
- **Catégories d'objet** (`vtable+8` de la classe modèle, fixée par le chunk présent dans `OBJECTS\<nom>.IFF`) : table complète dans la section `Targeting_AcquireBestThreat`. `SWPN` modélise les défenses fixes (AA, batteries, SAM, navires) : fait vérifié côté données.
- **Le bloc de 0x2B octets** (`AircraftStateBlock_Reset_12931`, drapeaux +0x1B à +0x1D, un octet de code +0x1E, trois dwords +0x1F/+0x23/+0x27) est commun au joueur et à l'IA. Aucun affichage : les fonctions qui le manipulent s'appelaient à tort `HUD_*`.

## Noms modifiés (ancien → nouveau)

| Ancien | Nouveau |
|---|---|
| `Camera_LookAtSecondaryTarget_3D9FB` | `WorldObject_UpdateWithAIEntity_3D9FB` |
| `WorldObjects_PurgeExpired` | `WorldObjects_UpdateAllAndRemoveDead_221F2` |
| `WorldObjects_PeriodicGC` | `WorldObjects_UpdateFrame_ResetCounters_221C2` |
| `Camera_ConstructWithSecondaryTarget_9D2CC` | `WorldObject_ConstructWithAIEntity_9D2CC` |
| `Debris_TestDestroyedState` | `WorldObject_TestAliveAndUpdateChildren_3800A` |
| `WorldObject_IsDestroyed` | `WorldObject_IsAlive_3CBB7` (le nom d'origine était inversé) |
| `Container_KeyCompare` | `List_AppendTail_22C23` |
| `Container_KeyEquals` | `List_AppendIfNonNull_21F8D` |
| `Expr_Node_RegisterListener_5334D` | `WorldObjects_AddToList_5334D` |
| `Debris_LoadAndInstantiate` | `ObjectPrototype_FindOrLoadAndInstantiate_38B70` |
| `Camera_Helper4_9D4D2` | `WorldObject_LoadAIProfileViaEntity_9D4D2` |
| `UIScreen_ApplyFormFields_500F6` | `Frame_UpdateTimingAndNotifyTrackedObjects_500F6` |
| `WorldObjects_NotifyMissionTriggers` | `TrackedObjects_CallSlot18OnActive_22F10` |
| `Container_NotifyAllActive` | `WorldObjects_CallSlot1COnActive_2217D` |
| `Container_FindByKeyAlt` | `WorldObjects_CallSlot4OnAll_22D6C` |
| `Container_FindAndTouch` | `WorldObjects_CallSlot4OnAllThenRecompute_2214F` |
| `View_RenderFrame_2DF0D` | `TrackedObject_FrameStep_2DF0D` |
| `loc_2DFE4` (sans nom) | `TrackedObject_NotifyWorldObjects_2DFE4` |
| `HUD_EncodeInstruments` | `AircraftStateBits_Clear_12806` |
| `HUD_ResetPanel` | `AircraftStateBlock_Reset_12931` |
| `loc_12B4E` (sans nom) | `AIEntity_CreateByType_12B4E` |

## Corrections de conclusions antérieures

- `AIEntity_MasterTick_5ACC` n'est **pas** « le point d'entrée racine de toute la logique de décision IA » (ancien résumé) : c'est une préparation d'état suivie d'un aiguillage.
- `WorldObjects_AddToList_5334D` n'enregistre pas un écouteur `Expr_VM` : elle ajoute l'objet à la liste 0x59C3.
- Le passage de `AIEntity_Construct_74B43` par `AircraftStateBlock_Reset_12931` n'est pas un repli quand l'allocation échoue : c'est l'initialisation du bloc quand l'allocation réussit.
- `Debris_LoadAndInstantiate` ne sert pas qu'aux débris : c'est la fabrique de tous les objets de modèle, dont les avions IA.
- **Le graphe de `MISSION_SCRIPT_OPCODES.md` et `AI_SYSTEM.md` §4.2** faisaient de `AI_TopLevelThink` une simple boucle sur dix emplacements `GOAL` (enchaînement `AI_TopLevelThink` → `Goal_ExecuteAction` → tournoi → `Goal_MoraleReaction_878F`). C'est inexact : `Goal_ExecuteAction_A8AC`, `Goal_WanderRandom_AD13`, `AI_BehaviorStateMachine_WeightedOptionSelector_9D05` et `Goal_MoraleReaction_878F` sont des **gestionnaires alternatifs**, choisis par l'octet du fichier, et `AI_TopLevelThink` les précède de réactions prioritaires et d'un contournement au sol. Le cas spécial « drapeau générique sur l'aéronef lié » de `AI_SYSTEM.md` §4.2 est en fait le drapeau « au sol ».
- **`Targeting_AcquireBestThreat`** : l'ancien commentaire (« 2 = aéronef, 6 = missile, 8 = contre-mesure ») est faux. La catégorie vient du chunk IFF de l'objet (`IFF_LoadModelMain`, `vtable+8`) : **6 = `JETP` (avion), 8 = `MISS` (missile), 0x13 = `SWPN` (défenses fixes)**. Un objet de catégorie 8 qui pointe mon avion est un **missile en approche**, pas un leurre.
- Le tournoi **n'est pas « remporté »** quand un missile me vise : `Targeting_AcquireBestThreat` vide les cibles d'attaque et pose `+0x27F = 2` ; le tir et le tournoi sont court-circuités pour ce tick.
- L'explication du `GOAL=1` par « aucune option du tournoi ne consulte `entité+0x11D` » (`MISSION_SCRIPT_OPCODES.md`) est remplacée par le contournement au sol décrit plus haut.

## Non résolu

- `AI_TriggerBehaviorUpdate` (ce qu'elle fait avant d'appeler `AI_TopLevelThink`, et la fonction de comportement gardée par `+0x28B` bit 7). Le corps de `AI_TopLevelThink` entre le test de menace et `loc_83F0` n'est pas lu.
- La nature de l'objet à `entité+0x0D` et le contenu de `nœud+4` que `Behavior_PopFinished_75612` copie dedans.
- `AI_EvalTargetAttribute`, `AI_RadarScanTarget`, `AI_ManeuverSolution_Major`, `AI_Sensor_WeaponVelocityCache` (appelées par `AI_BehaviorSelector`, non relues ici) ; le rôle de `entité+0x27F` ; l'octet `arg_4` du tournoi ; le rôle des champs `entité+0x281/0x283/0x285/0x287/0x289` côté lecteurs (`Targeting_AcquireBestThreat` les écrit, voir sa section) ; le sens de `objet+0x11 == 2` ; la réaction défensive à un missile qui me vise (lecteurs de `+0x281` et de `+0x27F == 2`).
- Quelle classe d'objet monde est réellement celle des avions IA : seule la classe `0x27BC` transmet l'ordre à l'entité, les trois autres ont un `+0x88` qui ne fait rien. Ce n'est pas vérifié pour les prototypes d'avions.
- Le slot +8 de l'entité (`loc_4F85`, sans nom), l'objet à +0x51 et son slot +0x40, le rôle de l'octet +0x59 de l'objet monde.
- Le rôle des slots +4, +0x18, +0x1C et +0x20 appelés par la phase d'affichage sur la liste 0x59C3.
- Si `WorldObject_ConstructWithAIEntity_9D2CC` est bien le constructeur d'instance appelé par le slot +4 du prototype, et si l'objet à +0x46 du prototype appelle bien `AIEntity_CreateByType_12B4E`.
- Les autres classes qui écrivent un pointeur d'entité à +0x55 (`ovr311`, `ovr314`, `seg190`, entre autres).
- `Picking_ResolveSymbol`, troisième appelant de `WorldObjects_UpdateAllAndRemoveDead_221F2`.
- Comment le nom du PROF de `CAST` arrive jusqu'à `AIAircraft_SpawnAndConditionalLoadProfile_53363`.
- Ce qui remet l'IA en état d'être ticquée après le pilotage automatique, et l'état de GOAL à ce moment.

## Le chunk `SIGN` (RADAR_SIGN) : chargement et usage (lu 2026-09-20)

Chargement : `Debris_LoadFieldMix_9BA85` (ovr302) cherche `SIGN` (`4E474953h`) ; si présent, **3 lectures d'un octet** (`ResourceRecord_ReadFinalField_64B51`) vers modèle `+0x12`, `+0x13`, `+0x14` ; absent = 0, 0, 0. Nommons-les S0, S1, S2.

Copie à l'instance : `Debris_BodyAttachToSubpart` recopie S0 dans `instance+0x28` et S2 dans `instance+0x29`. S1 reste lu dans le modèle (`Debris_GetSubpartAttrib`).

Lecteurs (tous des octets 0-255 ; **table corrigée le 2026-09-24**, l'index des deux tables de sauts est `weapon_aspec − 1`) :
- S0 (`instance+0x28`) : méthode virtuelle `+0x7C` (défaut `WorldObject_GetSignatureByte0_381E5`), utilisée par les aspecs **1 (AIM-9J, seuil > 210)** et **2 (AIM-9M, seuil ≥ 245)**. Surchargée pour les avions (signature calculée) et pour les leurres (signature qui décroît) ;
- S1 (`modèle+0x13`) : `Debris_GetSubpartAttrib`, utilisé par l'aspec **4** (AIM-120, SA-2, SA-6 : seuil ≥ 245) dans les deux fonctions ;
- S2 (`instance+0x29`) : `Debris_GetStateFlag`, utilisé seulement par `WeaponStation_TestTargetLock` pour l'aspec **3** (aucune arme des fichiers `WDAT` ; l'aspec 3 de `Targeting_SelectAndPrioritize` est `Targeting_ReticleWindowTest`).

## Les deux octets de classe du chunk `WDAT` (fichiers RAW décodés, 2026-09-20)

`Weapon_LoadWDATChunk_A0700` lit, après `weapon_id`, un octet rangé à `+0x4D` puis un octet rangé à `+0x4E`, puis `weapon_aspec` (`+0x4F`). Les noms du parseur libRealSpace sont `weapon_category` (`+0x4D`) et `target_domain` (`+0x4E`, ex-`radar_type`). Valeurs lues dans les 11 fichiers `data/*.WDAT.DAT` :

| Arme | `weapon_id` | `+0x4D` (`weapon_category`) | `+0x4E` (`target_domain`) | `weapon_aspec` | target_range | cone | effective_range | `+0x5A` |
|---|---|---|---|---|---|---|---|---|
| 20MM (`TRCR`) | 12 | 0 | 2 | 0 | 10000 | 45 | 1000 | 0 |
| AIM-9M (`MISS`) | 1 | 1 | 1 | 2 | 17700 | 45 | 8000 | 256 |
| AIM-9J (`MISS`) | 2 | 1 | 1 | 1 | 14500 | 40 | 5000 | 256 |
| AIM-120 (`MISS`) | 9 | 2 | 1 | 4 | 74000 | 45 | 45000 | 256 |
| SA-2 (`MISS`) | 10 | 2 | 1 | 4 | 25000 | 60 | 0 | 3840 |
| SA-6 (`MISS`) | 11 | 2 | 1 | 4 | 30000 | 60 | 0 | 2560 |
| AGM-65D (`MISS`) | 3 | 3 | 2 | 5 | 6000 | 25 | 15000 | 256 |
| GBU-15 (`BOMB`) | 8 | 3 | 2 | 5 | 6000 | 25 | 0 | 256 |
| MK-20 (`BOMB`) | 5 | 4 | 2 | 0 | 0 | 45 | 40 | 256 |
| MK-82 (`BOMB`) | 6 | 4 | 2 | 0 | 0 | 0 | 40 | 256 |
| LAU-3 (`PODR`) | 4 | 7 | 2 | 0 | 0 | 45 | 0 | 25 |

- **`+0x4D` (`weapon_category`)** : famille du chercheur ou de l'arme : 0 canon, 1 IR (AIM-9), 2 radar (AIM-120, SA-2, SA-6), 3 guidée sol (AGM-65D, GBU-15), 4 bombe libre, 7 roquettes. Signification des valeurs 3, 4, 7 par déduction des armes concernées, non lue dans le code.
- **`+0x4E` (`target_domain`)** : vaut 1 pour les cinq missiles guidés qui visent un avion (AIM-9J/9M, AIM-120, SA-2, SA-6 : donc pas « lancé depuis un avion »), 2 pour toutes les autres (canon, roquettes, bombes, AGM-65D, GBU-15). Nom `air_only` / `other` = **inférence** ; l'assembleur ne teste que `== 1` (`Targeting_AcquireBestThreat` pour « missile qui me vise », `HUD_RenderSymbologyMain`, `seg092`), la valeur 2 n'est lue nulle part ; `WeaponStation_ResolveStateA` prend 1 par défaut si le point d'emport est vide. `other` ne signifie pas « n'attaque pas les avions » (le canon en fait partie).
- **Le missile et la bombe ne se distinguent pas par le `WDAT`** : AGM-65D (`MISS`) et GBU-15 (`BOMB`) ont exactement les mêmes octets de chercheur ; seule la classe IFF (catégorie d'objet 8 ou 9) diffère.
- **`weapon_aspec` 0** (canon, bombes libres, roquettes) sort de la table de sauts de `WeaponStation_TestTargetLock` et `Targeting_SelectAndPrioritize` (cas `default`) : pas de test de verrouillage. Les aspecs des missiles guidés : 1 (AIM-9J), 2 (AIM-9M), 4 (AIM-120, SA-2, SA-6), 5 (AGM-65D, GBU-15, cas non lu).
- Les ids des armes correspondent aux masques : `0x83C` = ids 3, 4, 5, 6, 12 ; `0x700` = ids 9, 10, 11 ; la GBU-15 (id 8) est dans `0xFC` mais pas dans `0x83C`.
- Le dernier champ (`+0x5A`) suit la famille d'arme (256, 3840, 2560, 25, 0) ; sens inconnu.

### La signature du 1er octet est calculée à l'exécution pour les avions (lu 2026-09-20)

Voir la section suivante, « Qui écrit les octets de signature » (relue et corrigée le 2026-09-24).

## Qui écrit les octets de signature (lu 2026-09-24)

**Réponse courte : personne ne les réécrit.** Le seul écrivain de `instance+0x28` / `+0x29` d'un objet monde est la copie faite au rattachement par `Debris_BodyAttachToSubpart` (`mov [si+28h], al` / `mov [si+29h], al`). Les autres écritures trouvées dans les segments annotés visent d'autres structures : dwords d'accumulateurs de force, champ d'un enregistrement de rendu, et une structure de chute libre en `seg089` (fonction pas encore nommée, appelante de `Flare_PhysicsTick`, qui écrit un dword en `+0x29`). `Flare_PhysicsTick` lui-même n'écrit que des dwords en `+0x08`, `+0x0C` et `+0x10`. La mention « `Flare_PhysicsTick` écrit `+0x28` » de la note précédente était un faux positif.

Le « 1er octet `SIGN` = 10 » ne bloque donc rien, pour deux raisons.

### 1. Pour un avion, la signature des aspecs 1 et 2 est calculée, pas lue

Le slot `+0x7C` de la classe d'objet piloté est `Aircraft_ComputeSeekerSignature_3E2F1`. Il est appelé avec (cible, objet de référence du chercheur : le missile en vol, ou l'objet `+0x0D` du point d'emport avant le tir). L'octet `SIGN` du modèle (`les bx,[si+0Eh] / mov al,es:[bx+12h]`) ne sert que **sans objet de référence**.

```
v   = |vitesse cible| · 256 / 0x25A00            // vitesse / 602, en 24.8
A   = Math_DotProduct3D_5505B(v_ref, v_cible) > 0 // même sens : chercheur dans le secteur arrière
sig = v · (A ? 100 : 50) + 10                    // imul eax,64h / imul eax,32h ; add 0A00h
si cran_gaz > 5 : sig += (A ? 100 : 50)          // cmp byte ptr es:[bx+1Eh],5 / jle ; add 6400h / 3200h
renvoie (sig >> 8) & 0xFF                        // sar eax,8 ; mov [bp-1Dh], al : repasse par 0 au-delà de 255
```

- **Le vecteur** vient de `vtable+0x4C` = `loc_3D246`, qui renvoie une copie de `[+0x51]+8` : la vitesse de l'objet (déjà établi dans `DATA_MODEL.md`, table « `entité->vtable[0x4C]` (vitesse entité) »).
- **`Math_DotProduct3D_5505B`** (ex-`Targeting_ComputeGeometryHelperA`) est un produit scalaire 24.8 : `imul` des trois paires, somme sur 64 bits, `shrd eax, edx, 8`.
- **L'octet `+0x1E` est le cran de manette des gaz (0 à 10), et `> 5` veut dire post-combustion.** Preuve : `WorldObject_UpdateWithAIEntity_3D9FB` prend le même enregistrement (`[si+55h] → vtable+8`) et le passe au corps `[si+51h] → vtable+0x40`. Dans la vtable `JDYN` de `seg339:0x2312` (adresse `0x6F3C2`), le slot `+0x40` (`0x6F402`) est le thunk `loc_3B669` (`add ax, 0FF72h`, soit `this − 0x8E`, puis `jmp far ptr PhysicsTicks`). `PhysicsTicks` lit `es:[bx+1Eh]` de son 2ᵉ argument comme cran, et bascule la consommation de carburant sur le facteur post-combustion avec **le même test** : `cmp byte ptr [bp-2Ch], 5 / jg` → `4Ch` au lieu de `33h`.
- Ordres de grandeur, à 602 de vitesse : de dos avec post-combustion = 210 ; de dos sans post-combustion = 110 ; de face ou de côté avec post-combustion = 110.

### 2. Le seuil n'est pas un seuil de verrouillage : c'est le vol de piste par un leurre

`Targeting_SelectAndPrioritize(arme, cible actuelle, référence, octet)` (table de sauts `off_43319`, index `weapon_aspec − 1`, **l'ancien résumé décalait les aspecs 2 à 4 d'un cran**) :

1. `c = Targeting_FilterByWeaponType(arme, référence)` : le candidat dans le cône et la portée du chercheur.
2. `c` nul → renvoie 0. `c` = cible actuelle → on la garde.
3. Sinon, poids `w = 3` (5 si `c->vtable+0x38 == word_722E6`). La signature de `c` est comparée au seuil : **au-dessus, `c` vole la piste si `Math_RandomScale_54DF4(10) < w`** (3 chances sur 10) ; en dessous, on garde la cible actuelle.
4. **Aspec 1 seulement (AIM-9J)** : quand on garde la cible, test d'aspect `Math_DotProduct3D_5505B(v_ref, v_cible) >= Math_CosDeg_5483F(0x5A00 = 90.0)` = cos 90° = 0 (les deux vitesses à 90° au plus), sinon renvoie 0. **L'AIM-9J ne tient que de dos.**

| aspec | armes (`WDAT`) | test de `Targeting_SelectAndPrioritize` | octet rangé par `WeaponStation_TestTargetLock` dans `+0x0F` |
|---|---|---|---|
| 1 | AIM-9J | `c->vtable+0x7C` > 210, puis aspect arrière obligatoire | `vtable+0x7C` |
| 2 | AIM-9M | `c->vtable+0x7C` ≥ 245, tous secteurs | `vtable+0x7C` |
| 3 | (aucune) | `Targeting_ReticleWindowTest` | `Debris_GetStateFlag` (S2) |
| 4 | AIM-120, SA-2, SA-6 | `Debris_GetSubpartAttrib(c)` (S1, lu dans le modèle) ≥ 245 | `Debris_GetSubpartAttrib` (S1) |
| 5, 6 | AGM-65D, GBU-15 | `Proximity_TestOriented` : garde la cible ou 0 | — |

Le guidage du missile en vol (`seg090`, fonction pas encore nommée) appelle la même fonction à chaque tick de son minuteur, avec (modèle d'arme `[si+0Eh]`, cible `[si+55h]`, **le missile lui-même**, `[si+63h]`), et range le résultat dans `missile+0x55`. **Un missile guidé peut donc être détourné en vol**, ou perdre sa cible (0).

### 3. Les leurres (`DECY`, catégorie 0x10) : une signature qui s'éteint

- Modèle : vtable `seg339` tag `0x2430`, slot `+8` = `DecoyModel_GetCategory_45190` (`mov al, 10h`). Chunk propre `DATA` (`41544144h`), lu par `DecoyModel_LoadDATALifetime_9C810` : 4 octets dans `modèle+0x37` = **durée de vie**. Chunk absent : erreur `0xC005`.
- Instance : `Decoy_ConstructInstance_9C85A` (0x34 octets, vtable finale tag `0x1C6A` = `0x6ED1A`), puis `Decoy_AttachAndStartLifetime_9C90B` : `+0x2E = (word modèle+0x37) << 8`, soit le temps restant. `Decoy_TickLifetime_451B5` fait `+0x2E -= dt` à chaque tick, et le leurre meurt sous 0.
- Signature : `Decoy_GetFadingSignature0_451F1` (slot `+0x7C`) = **S0 × temps restant / durée**, et `Decoy_GetFadingSignature1_45285` (slot `+0x8C`) fait de même avec S1. La chaleur décroît linéairement jusqu'à 0. Pour voler la piste d'un AIM-9J, un leurre doit donc être largué avec S0 > 210, et il cesse de pouvoir le faire quand `S0 × restant / durée` repasse sous 210.
- **L'aspec 4 (radar) lit S1 sans décroissance** : `Debris_GetSubpartAttrib` lit `modèle+0x13` directement, sans passer par le slot virtuel `+0x8C`. Le consommateur du slot `+0x8C` n'est pas tracé.
- `CAMERA_SYSTEM.md` voyait dans `Decoy_AttachAndStartLifetime_9C90B` une copie du rayon de collision vers la caméra. Pour un `DECY`, `modèle+0x37` est en réalité écrasé par le chunk `DATA`, et `+0x2E` est le temps restant du leurre.

**À vérifier côté données** : les octets `SIGN` et le dword `DATA` des fichiers `DECY` (fusée éclairante et paillettes, pièces `FLARE` / `CHAFF`).

**Non lus** : `Targeting_FilterByWeaponType` (quel candidat il rend quand plusieurs objets sont dans le cône), `vtable+0x38` et `word_722E6` (le « lanceur est le joueur » de la note précédente reste non prouvé), et l'identité de l'objet `+0x0D` du point d'emport (vraisemblablement le porteur, par analogie avec le missile en vol qui se passe lui-même).

## Le vol du missile guidé : chercheur, guidage, propulsion (lu 2026-09-24)

Les fonctions `Sound3D_*` de `seg090` étaient mal nommées : elles ne jouent aucun son, elles pilotent le missile. Renommées :

| Ancien nom | Nouveau nom | Rôle |
|---|---|---|
| (sans nom, `loc_42458`) | `Missile_UpdateSeekerAndFuse_42458` | mise à jour de l'objet missile : chercheur + allumeur |
| (sans nom, `loc_42A4E`) | `MissileBody_GuidanceTick_42A4E` | tick du corps physique : guidage puis vitesse |
| `Sound3D_ComputeSecondChannel` | `MissileBody_SteerToTarget_42738` | **loi de guidage** |
| `Sound3D_TriggerWithRange` | `MissileBody_BoostPhase_42632` | phase propulsée |
| `Sound3D_TriggerDirect` | `MissileBody_SetCruiseVelocity_42A1B` | vitesse de croisière |
| `PlayerComponent_LoadFieldGroupC_A04E3` | `DynMissile_LoadMISSChunk_A04E3` | chunk dynamique `MISS` du corps |
| `PlayerComponent_LoadFieldsWithRetryB_A0340` | `MissileModel_LoadDATAChunk_A0340` | chunk `DATA` du modèle missile |

### Chaîne d'appel

```
Missile_UpdateSeekerAndFuse_42458 (objet missile, catégorie 8)
 ├─ si minuteur +0x5A échu et chercheur actif (+0x61) :
 │     +0x55 = Targeting_SelectAndPrioritize(modèle +0x0E, +0x55, le missile, +0x63)
 │     corps+0x39 = (+0x55 ≠ 0)                        guidage actif / coupé
 ├─ Camera_ExternalUpdate_3D9B4 → corps->vtable+0x3C = MissileBody_GuidanceTick_42A4E
 │     corps+0x35 = missile+0x55                        (SetReference16, à chaque tick)
 │     si +0x35 et +0x39 : MissileBody_SteerToTarget_42738
 │     si +0x3A == 0      : MissileBody_BoostPhase_42632
 │     sinon, cible       : MissileBody_SetCruiseVelocity_42A1B
 │     sinon              : vol balistique (gravité dword_6FFD7·dt, nez aligné sur la vitesse)
 └─ allumeur : distance à la cible < modèle+0x63 << 8  → renvoie 0 (fin du missile)
```

Le corps (0x3C octets, vtable `0x1F66`) est construit par `JDYN_LoadChunkAndConstruct_3A49C` quand le chunk dynamique `MISS` est présent. Il est rempli par `DynMissile_LoadMISSChunk_A04E3`, qui lit 5 dwords :

| Champ du corps | Rôle |
|---|---|
| `+0x21` | vitesse angulaire maximale de guidage (degrés 24.8 par unité de temps, multipliée par `dt`) |
| `+0x25` | vitesse maximale = vitesse de croisière |
| `+0x29` | accélération de propulsion |
| `+0x2D`, `+0x31` | composantes latérale (c0) et normale (c2) de la vitesse de croisière |

Autres champs du corps : `+0x35` cible, `+0x37` lanceur, `+0x39` guidage actif, `+0x3A` propulsion terminée, `+0x3B` vitesse initiale déjà héritée.

### La loi de guidage (`MissileBody_SteerToTarget_42738`)

Poursuite avec anticipation, pilotée en **« bank-to-turn »** : roulis immédiat vers la cible, puis cabrage à vitesse angulaire bornée. Le repère est celui des lignes de la matrice d'orientation (c0 envergure, c1 nez, c2 normale, comme le modèle de vol).

```
D    = point_visé − position_missile ; dist = |D|
t    = min(dist / |v_missile|, 1.0)                      // 1.0 si v nulle
D   += v_cible · t                                       // anticipation (cible->vtable+0x4C)
L    = M · D                                             // Matrix_WorldToLocal_58768 : projection sur les 3 lignes
roulis = atan(L.c0 / L.c2), ±180° si L.c2 ≤ 0            // Math_ArcTan2_54B0A + correction 0B400h
M    = M ∘ Rot(c1, roulis)                               // Matrix_BuildAxisY_570C5 : SANS limite
L    = M · D
tangage = atan(L.c2 / L.c1), 180 − |tangage| si L.c1 < 0 // cible derrière
tangage = min(tangage, corps+0x21 · dt)                  // seul le côté positif est borné (la cible est côté +c2 après le roulis)
M    = M ∘ Rot(c0, tangage)                              // Matrix_BuildAxisX_56EC3
missile->vtable+0x40(M)                                  // nouvelle orientation
```

- **Point visé** (`MissileBody_GuidanceTick_42A4E`) : position `+0x12` de la cible. Si le `target_type` de la cible (modèle `+0x11`) vaut plus de 1, l'altitude est relevée de `(champ +0x10 du sous-objet modèle+0x08) >> 3`, soit 1/8 d'une dimension du modèle (sens exact du champ non établi).
- `Matrix_BuildAxisY_570C5` ne fait rien sous 0,22° (`0x38` en 24.8).
- **La vitesse suit le nez** : après le guidage, `MissileBody_BoostPhase_42632` et `MissileBody_SetCruiseVelocity_42A1B` recalculent la vitesse dans l'axe du missile. Il n'y a ni inertie ni aérodynamique : le missile va où il pointe.
- Unités : si les vitesses sont par seconde (l'accélération et la gravité sont multipliées par `dt`), l'anticipation est plafonnée à 1 seconde.

### Propulsion et vol libre

- **Départ** : au premier tick propulsé, la vitesse du missile = vitesse du lanceur.
- **Propulsion** (`+0x3A == 0`) : tant que `|v| < +0x25`, la vitesse est remise dans l'axe du nez et augmente de `+0x29 · dt`. La propulsion s'arrête quand la vitesse maximale est atteinte, **pas au bout d'une durée**.
- **Croisière** : vitesse = `(+0x2D, +0x25, +0x31)` dans le repère du missile, à chaque tick, tant qu'il a une cible.
- **Sans cible** (chercheur revenu à 0, ou jamais de cible) : la gravité s'ajoute à l'altitude de la vitesse, et le nez est réaligné sur la vitesse. Le missile tombe en balistique.
- **Dégagement du lanceur** : le bit 1 de `missile+4`, effacé au départ, est posé quand la distance au lanceur dépasse 4 × la somme des deux valeurs `+0x10` (celle du lanceur et celle du missile, lues dans leur sous-objet `modèle+0x08`).
- **Allumeur de proximité** : `Missile_UpdateSeekerAndFuse_42458` renvoie 0 quand la distance à la cible passe sous `modèle+0x63` (word du chunk `DATA` du modèle `MISS`, lu par `MissileModel_LoadDATAChunk_A0340`).

**À relever côté données** : les 5 dwords du chunk dynamique `MISS` et le chunk `DATA` des modèles `MISS` (AIM-9J/9M, AIM-120, SA-2, SA-6, AGM-65D).

### La bombe guidée (chunk dynamique `GBMB`) : même loi, vitesse constante (lu 2026-09-24)

Le soupçon était fondé : `GuidedBombBody_SteerToTarget_41BEF` n'a rien d'audio. C'est **une deuxième copie de la loi de guidage**, pour le corps construit par `JDYN_LoadChunkAndConstruct_3A49C` quand le chunk dynamique `GBMB` est présent (0x49 octets, vtable `0x1F16`, tick au slot `+0x3C`, comme le missile).

| Ancien nom | Nouveau nom | Rôle |
|---|---|---|
| (sans nom, `loc_41F2B`) | `GuidedBombBody_GuidanceTick_41F2B` | tick du corps : cible, lanceur, guidage ou chute |
| `Audio3D_ComputeDistanceParams` | `GuidedBombBody_SteerToTarget_41BEF` | **loi de guidage** |
| `Countermeasure_CacheDistance` | `GuidedBombBody_InheritLaunchSpeed_41B84` | vitesse héritée du lanceur, mise en cache |
| `PlayerComponent_LoadFieldGroup_9FDDE` | `DynGuidedBomb_LoadGBMBChunk_9FDDE` | chunk `GBMB` : 1 dword = vitesse angulaire max (`+0x18`) |
| `Countermeasure_ComputeTransform` | `WorldObject_AlignNoseOnVelocity_419E4` | aligne le nez sur la vitesse |

**`WorldObject_AlignNoseOnVelocity_419E4`, relue ligne par ligne (2026-09-24)** :
1. `v` = vitesse (`vtable+0x4C`) ;
2. `Vector_PrescaleBelow256_55B04(v)` : divise par 8 tant qu'une composante dépasse 256 (garde anti-débordement) ;
3. `Vector_NormalizeInPlace_5593A(v)` : `c = (c << 8) / |v|` (ex-`Targeting_LineOfSightCheck`, mal nommée) ;
4. copie de l'orientation (`vtable+0x3C` = `objet+0x2C`, 36 octets) ;
5. **ligne 1 (`+0x0C`) ← v** ;
6. `Matrix_OrthonormalizeKeepRow1_57660` : ligne 2 = ligne 0 × ligne 1, ligne 0 = ligne 1 × ligne 2 (`Vector_CrossProduct3D_550B7`), puis normalisation des trois lignes ;
7. `vtable+0x40` = recopie dans `objet+0x2C`.

Preuve que la ligne 1 est le nez : dans `MissileBody_BoostPhase_42632` et `MissileBody_SetCruiseVelocity_42A1B`, toute la vitesse est portée par la composante 1 du repère local (`Matrix_WorldToLocal_58768` = `M·v` par lignes, `Matrix_LocalToWorld_58828` = `Mᵀ·v` par colonnes, toutes deux lues).

**Identique au missile** : anticipation `t = min(dist / vitesse, 1)`, roulis immédiat `atan(c0/c2)` (±180° si c2 ≤ 0), cabrage `atan(c2/c1)` (180 − |b| si la cible est derrière) borné à `+0x18 · dt`, puis écriture de l'orientation.

**Différences** :
- **Vitesse constante** : à chaque tick guidé, vitesse = `(0, +0x1C, 0)` dans le repère de la bombe. `+0x1C` est la norme de la vitesse du lanceur, recopiée **une seule fois** au premier tick guidé (`GuidedBombBody_InheritLaunchSpeed_41B84`, drapeau `+0x24`). Tant qu'elle est guidée, la bombe ne subit ni propulsion, ni gravité, ni perte de vitesse.
- **Point visé** : la position `+0x12` de la cible, sans le relèvement d'altitude du missile.
- **Cabrage** : `Math_ArcTan_54ADE` après une division par c1 **sans garde**. Il y a une division par zéro si la cible est exactement à 90° du nez (c1 == 0) ; à reproduire avec une garde dans le portage.
- **Sans cible** : `FlightControl_ComputeAngularAccel` (somme des forces / masse, donc chute libre avec forces) puis `WorldObject_AlignNoseOnVelocity_419E4`.
- La cible est `objet+0x55` (recopiée dans `+0x20`) et le lanceur est `objet->vtable+0x38` (recopié dans `+0x22`). Cela confirme le sens « lanceur » de `vtable+0x38` pour cet objet.

**À vérifier côté données** : quels objets portent un chunk dynamique `GBMB` (vraisemblablement la GBU-15), et la valeur de son dword.

### Sinus et cosinus inversés, et fin de la relecture des matrices (lu 2026-09-24)

- `Matrix_OrthonormalizeKeepRow0_575DF` (ex-`Matrix_ApplyToVectorX`) : ligne 2 = ligne 0 × ligne 1, ligne 1 = ligne 2 × ligne 0, puis normalisation des trois lignes. Elle garde la ligne 0, c'est-à-dire l'axe de la rotation de `Matrix_BuildAxisX_56EC3`.
- `Matrix_BuildAxisY_570C5` : la ligne 1 est inchangée ; `ligne0' = c·ligne0 − s·ligne2`, `ligne2' = c·ligne2 + s·ligne0`, avec `c = Math_CosDeg_5483F(θ)` et `s = Math_SinDeg_54876(θ)`. C'est bien une rotation autour du nez : **le roulis est confirmé**.
- **Les noms étaient inversés.** `Math_Sin_Raw_580A7` travaille sur `|angle|` et renvoie 1,0 pour un angle nul ; `Math_Cos_Raw_58063` indexe la table à `90° − angle`. L'octet i de la table `seg213` est cos(i/4°) en 24.8, où 1,0 = 256 (221 à 30°, 181 à 45°, 127 à 60°, 0 à 90° ; l'angle nul, qui vaudrait 256, est traité à part). Renommées : `Math_CosDeg_5483F`, `Math_SinDeg_54876`, `Math_CosRaw_580A7`, `Math_SinRaw_58063`.
- **Conséquence pour le chercheur** : le test d'aspect de l'AIM-9J compare le produit scalaire des vitesses à `cos 90° = 0`, et non à 1,0. L'AIM-9J garde sa cible tant que les deux vitesses font un angle d'au plus 90°.

### Conversion des champs à la lecture des fichiers (précisé 2026-09-24)

libRealSpace calcule en flottants : la colonne de droite dit comment obtenir la valeur réelle à partir de la valeur brute du fichier. Toutes les formules de cette section sont écrites en valeurs réelles (degrés, unités de distance, secondes).

| Champ | Utilisation dans l'original | Valeur réelle à partir du fichier |
|---|---|---|
| chunk dynamique `MISS` (5 dwords : `+0x21` vitesse de rotation max en °/s, `+0x25` vitesse max, `+0x29` accélération, `+0x2D` et `+0x31` vitesses latérale et normale de croisière) | dword utilisé tel quel dans les calculs en virgule fixe | **dword ÷ 256** |
| chunk dynamique `GBMB` (1 dword, `+0x18` vitesse de rotation max en °/s) | idem | **dword ÷ 256** |
| chunk `DATA` du modèle `MISS`, word `+0x63` (rayon de l'allumeur) | word converti par `<< 8` | **word tel quel** (entier) |
| chunk `DATA` du leurre `DECY`, `modèle+0x37` (durée de vie) | lu en dword, utilisé en word converti par `<< 8` | **mot de poids faible tel quel** (entier, dans l'unité de `dt`) |
| chunk `SIGN` (3 octets) | octet comparé à 210 / 245 | **octet tel quel** (0 à 255) |
| `Math_RandomScale_54DF4(n)` | `rand() × n / 0x8000` | entier uniforme de 0 à n−1 (`/0x8000` = échelle de `rand`, pas une conversion) |

## L'attaque au sol (lue intégralement le 2026-09-24)

### Qui la déclenche et comment elle tourne

L'attaque au sol est un **nœud de comportement permanent** de l'entité (`entité+0xD9`). Il est construit une fois au chargement du pilote par `PilotProfile_ResolveNamedPropertyNode_742FC`, case `0x13` : 0x36 octets, vtable tag `0x160`, `nœud+0x22` = l'entité.

| Slot | Fonction | Rôle |
|---|---|---|
| `+4` | `GroundAttack_CanEngage_77000` | renvoie 5 si la cible est au sol et qu'une arme air-sol est chargée |
| `+8` | `GroundAttack_Start_7709A` | démarre l'attaque et empile le nœud comme comportement en cours |
| `+0xC` | `GroundAttack_PhaseDispatch_77215` | machine à états, appelée à chaque tick |
| `+0x10` | `MVRS_SharedDefaultTickNoOp_ED16` | vide |

1. **Déclenchement.**
   - `Goal_ExecuteAction_A8AC`, ordre « détruire la cible » (`0xA7`), si la cible de mission (`+0x137`) a `target_type == 2` : `+4`, puis `+8` si `+4` a réussi. Sinon, le répartiteur renvoie 0.
   - Même chose dans `AI_BehaviorStateMachine_WeightedOptionSelector_9D05` pour une cible sol acquise (`+0x283`) quand `arg_4` est non nul.
2. **Exécution.** `GroundAttack_Start_7709A` appelle `Behavior_PushRunning_756A4`, qui pose `entité+0x0D = nœud` (l'ancien comportement est gardé dans `nœud+4`). Tant que `entité+0x0D` est non nul, `Goal_ExecuteAction_A8AC` n'appelle **que** sa méthode `+0xC` (`loc_A938`).
3. **Fin.** `Behavior_PopFinished_75612` restaure le comportement précédent et note l'identifiant 0x13 dans `entité+0x19`.

**Conditions de `GroundAttack_CanEngage_77000`** : la cible est `+0x283`, sinon `+0x137`. Il faut `nœud+0x13 == 0` (sens non tracé), `target_type == 2` et `WeaponStation_FindLoadedCompatible(chargement, 0xFC)`. Le masque couvre les armes d'identifiant 3 à 8 (AGM-65D, LAU-3, MK-20, MK-82, l'identifiant 7, GBU-15), **pas le canon**.

### La machine à états (`nœud+0x26`)

Toutes les distances et altitudes sont en mètres, et le point visé est toujours **la cible relevée de 1000 m**.

**Phases 0 et 1, approche** (`GroundAttack_Phase01_Approach_77282`) :
- **Chaque tick** :
  - le minuteur `nœud+0x0D` (2 s, posé au démarrage) décroît de `dt` ; à 0, l'attaque se termine, puis redémarre au tick suivant avec les mêmes règles ;
  - pilote automatique physique coupé ; cran de gaz 5.
- **Mesures** :
  - `D = ma position − point visé`, `hd` = distance horizontale ;
  - `a = |angle horizontal entre le nez et D|` : `a` proche de 180° signifie que le nez pointe vers la cible.
- **Transitions** :
  - `a < 170°` et `hd < 5000` : phase 0 (trop près et mal aligné : on s'éloigne) ;
  - `a > 170°` et `hd < 5000` : **ailes à plat** (`AI_RollToAngleCmd_8104(0°, zone morte 5°)`) ; quand `|roulis| < 5°` : cran de gaz 3 et **phase 2** ;
  - sinon, `hd > 8000` ou `a > 170°` : phase 1.
- **Pilotage** :
  - direction `D` en phase 0 (s'éloigner), `−D` sinon (aller vers le point visé) : `AI_GuidanceCmd_FromOwnPos(entité, direction, 10)` ;
  - vitesse de croisière `JDYN+0x84` (`AI_ThrottleCmd_HUD`) ;
  - si `a > 169°` et `hd > 9000` : **palier** (`AI_PitchToAngleCmd_7E18(0°, 5°)`) ;
  - sinon, en phase 1, si `a > 169°` et que je suis **plus de 2000 m au-dessus du point visé** : **piqué à −40°**.

**Phase 2, passage au pilote automatique** (`GroundAttack_Phase2_EngageAutopilot_775B1`, un seul tick) :
- écrit le point visé (bloc de commandes `+0x02..+0x0A`) et `direction normalisée × 100` (`+0x0E..+0x16`) ;
- remet `+0x1A` à 0 ;
- `JDYN+0x68 = 0` : c'est désormais `Autopilot_FlyToPointKinematic_49C2E` qui pilote l'avion vers ce point, en cinématique (direction et vitesse imposées) ;
- passe en phase 3.

**Phase 3, choix de l'arme et largage** (`GroundAttack_Phase3_WeaponRelease_776FB`) :
- **Cible mobile** (bit 2 de `cible+4`) : point visé et direction recalculés à chaque tick.
- **Choix de l'arme**, une seule fois, par ordre de priorité :

| Ordre | Masque | Arme | Préparation |
|---|---|---|---|
| 1 | `0x04` | AGM-65D | le système d'armes suit la cible (`chargement+0x0D = cible`) |
| 2 | `0x80` | GBU-15 | idem |
| 3 | `0x10` | MK-20 | l'octet `+0x4D` du modèle d'arme vaut 4 |
| 4 | `0x20` | MK-82 | idem |
| 5 | `0x40` | identifiant 7 | l'octet `+0x4D` vaut 5 |
| 6 | `0x08` | LAU-3 | minuteur de 3 s ; le système d'armes suit la cible |

  Aucune arme : phase 6, fin.
- **Tir** : bit 1 de l'octet de commande (`bloc+0x1B |= 2`), le même que pour le tir air-air, puis phase 4.
  - **AGM-65D / GBU-15** : tir quand la méthode `+0x14` du modèle d'arme réussit. Pour la GBU-15, c'est `BombModel_TestGuidedLockCone_41735`. Pour l'AGM-65D (`MISS`, fonction pas encore nommée `loc_42F71`), la méthode **n'est pas lue**.
  - **LAU-3** : tir quand le minuteur de 3 s est écoulé.
  - **Bombes** : `I` = impact prédit (`BombModel_PredictImpact_41311`), `raté` = distance **horizontale** entre `I` et la cible. On tire si `raté ≤ 20 + |ma vitesse| × dt + (150 si (rand & 15) > AG)`.
- **Nouvelle passe** : sans tir, si `Autopilot_FlyToPointKinematic_49C2E` a posé `bloc+0x1A`, retour en **phase 0**. Ce drapeau est posé quand l'écart entre le cap de `W` (vitesse voulue) et le cap du nez est inférieur à 5°, et que la distance au point est inférieure à `20 × |W| × max(dt, 0,2)`, soit au moins 400 m à 100 m/s. La loi complète du pilote automatique est dans `NOTE_ATTAQUE_SOL.md`, §5.

**Phase 4, dégagement** (`GroundAttack_Phase4_PullUp_77171`) :
- mémorise l'arme larguée ;
- pilote automatique coupé, **cabré à +5°** (zone morte 5°), vitesse de croisière ;
- fin quand l'arme larguée n'existe plus.

### Les deux méthodes des modèles d'arme

- **`BombModel_TestGuidedLockCone_41735`** (méthode `+0x14` de `BOMB` / `DURD`, utilisée pour la GBU-15). Elle réussit si :
  - l'octet `modèle+0x5E` est non nul ;
  - `nez · direction(cible) > cos(modèle[+0x61] × t)`, avec `t = distance / vitesse du lanceur`.

  Le cône autorisé grandit avec le temps de vol. `+0x5E` et `+0x61` viennent du chunk `DATA` du modèle (`PlayerComponent_LoadFieldsWithRetry_9FAD0` : octets `+0x5E`, `+0x5F`, `+0x60`, word `+0x61`).
- **`BombModel_PredictImpact_41311`** (méthode `+0x18`). L'objet `+0x0D` du point d'emport lui est passé comme porteur : sa vitesse et sa position sont utilisées.
  - **Identifiant 7** : impact à **2500 m** (masque `0x40`) ou **3000 m** devant le porteur, dans la direction horizontale de sa vitesse, au niveau du terrain.
  - **MK-20 / MK-82** : `Z = altitude porteur − hauteur passée`, puis `t = (−vz − √(vz² − 2gZ)) / g`, avec `g = −9,8`, et une correction `t −= Z / (3 × (2000 − altitude porteur) + 290)`. L'impact est `position porteur + vitesse horizontale × t`, au niveau du terrain.
  - **Non résolu** : d'après l'appelant, `Z` vaut l'altitude de la cible et non la hauteur de chute. Soit le sens de l'objet `+0x0D` ou de la hauteur n'est pas celui que je crois, soit c'est un défaut de l'original. À vérifier en jeu avant de le porter.

### Correction importante : les commandes bas niveau de l'IA commandent le roulis et le tangage, pas le cap

| Ancien nom | Nouveau nom | Ce que fait le code |
|---|---|---|
| `AI_Sensor_HeadingNormalized` | `AI_Sensor_RollAngle_58F4` | roulis (`Matrix_RollAngle_57C67`), cache `+0xFA` |
| `AI_Sensor_SecondaryAngle` | `AI_Sensor_NosePitch_59A5` | tangage du nez (`Math_ElevationAngle_552E1`), cache `+0xF6` |
| `AI_TurnToHeadingCmd` | `AI_RollToAngleCmd_8104` | écart de roulis, puis contrôleur de roulis |
| `AI_PitchRollController_Heading` | `AI_RollController_7E56` | écrit l'axe de **roulis** du manche (`+0x23`) |
| `AI_TurnToBearingCmd` | `AI_PitchToAngleCmd_7E18` | écart de tangage, puis contrôleur de tangage |
| `AI_RollRateController` | `AI_PitchController_7B20` | écrit l'axe de **tangage** (`+0x1F`) ; pour piquer de plus de 15°, passe **sur le dos** (roulis 180°) et tire |

Le virage vers une direction passe par `AI_GuidanceCmd_FromOwnPos` → `AI_GuidanceSolution_Major` (lue par une session antérieure, avant la découverte de l'inversion des noms trigonométriques : **à relire**).
