# Ordres de mission — comment le script les exécute réellement

> **Nombres en décimal** (opcodes, arguments, champs `+n`). Les adresses de code citées sont aussi
> en décimal ; les fichiers annotés les écrivent en hexadécimal.

*Convention adoptée pour ce document : pseudocode C, pas d'assembleur
brut. Chaque fonction est désignée par son nom sémantique (voir
`known_functions.json`), jamais par sa seule adresse (`sub_XXXXX`) —
l'adresse est indiquée une fois, entre parenthèses, pour qui veut
retrouver le code source.*

*Terminologie corrigée en cours de session : ce qu'on appelait
`MissionObject` (structure de 85 octets) est en réalité une entrée du
chunk **`PART`** (participants/factions), confirmé par recoupement
avec `DATA_MODEL.md` et l'implémentation C de Rémi — renommé
`PartEntry` partout dans ce document.*

## Graphe d'appels — construit progressivement au fil des sessions

*Chaque nouvelle fonction lue en profondeur est ajoutée ici, pas
seulement décrite en texte — pour garder une vue d'ensemble de
l'architecture à mesure qu'elle se précise.*

```mermaid
flowchart TD
    Entry["EntryPoint_RuntimeInit"] --> InitVid["Program_InitVideoFontArgs<br/>(charge police/video/args, retourne — pas de boucle)"]
    InitVid --> MainLoopTop["STRIKE_EXE_MAIN_LOOP<br/>debut d'iteration"]

    MainLoopTop --> CockpitKey["MAIN_GAME_TICK"]
    MainLoopTop --> Recompute["MissionScenario_RecomputeFields<br/>(meme sequence, verifie a un autre moment)"]
    Recompute --> MissionUpdEvt
    Recompute -.->|"pose byte_706AF=5<br/>si checkpoint atteint"| MainLoopTop
    CockpitKey --> RefreshField["PartEntry_DispatchMissionUpdateTick"]
    RefreshField --> UpdateProp["Expr_Node_UpdateAndPropagate"]
    UpdateProp --> Adapter["Expr_VM_ExecuteSingleInstruction"]
    CockpitKey --> MainGameTick["CombatTarget_WeaponActionSubsystem<br/>(645 lignes — combat/cible/physique,<br/>UN sous-systeme parmi d'autres)"]
    CockpitKey --> SelChange["Scene_DetectAndActivateChange<br/>(appel direct verifie, ligne 167463)"]
    CockpitKey --> LeavingEvt["Scene_TriggerLeavingEvent<br/>(+12 on_leaving)"]
    SelChange -->|"scene changee (garantie suppl.)"| MissionUpdEvt["Scene_TriggerMissionUpdateEvent<br/>(+16 — en realite appelee CHAQUE FRAME<br/>via Recompute, sans garde)"]
    LeavingEvt --> Adapter
    MissionUpdEvt --> Adapter
    Adapter --> Interp["MissionScript_ExecutePROG<br/>(interprete, 209 cas)"]

    Interp -->|"~130 cas"| Plumb["Plomberie generique VM"]
    Interp -->|"ordre de mission"| Relay["MissionScript_DispatchOrderToNative"]
    Interp -->|"appel direct +1787"| Formation["PartEntry_ResolveSpawnPositionAndActivate"]

    Relay --> Native["MissionScript_CallNativeHandler"]
    Native -->|"garde echouee"| Fail(["retour 0"])
    Native -->|"garde OK"| Switch{"switch 31 cas<br/>par ordre"}
    Switch --> OrderImpl["Implementation de l'ordre<br/>(resout position/cible)"]
    OrderImpl --> Controller["controleur generique<br/>+82 -&gt; vtable+136<br/>ExecuteFlightCommand"]

    Formation -->|"rappel interne"| Trigger["Shared_TriggerExprInstruction"]
    Trigger --> Adapter
    Formation -->|"si +82 NUL"| Spawn["AIAircraft_SpawnAndConditionalLoadProfile"]
    Spawn -->|"PilotProfile_LoadFromPROF"| Profile["Profil MVRS/GOAL/ATRB<br/>(voir AI_SYSTEM.md)"]
    Spawn --> Controller

    SelChange --> TickGroup["Scene_TriggerActivation"]
    TickGroup --> Ensure["Scene_EnsureUnitsSpawned"]
    TickGroup --> Adapter
    Ensure --> Formation

    MainLoopTop -.->|"boucle : jmp au sommet<br/>tant que byte_706AF != 6"| MainLoopTop

    Alloc["PartEntry_AllocateArray<br/>(construction mission, UNE FOIS)"] --> Load["PartEntry_LoadAndResolveNames"]
    Load --> Reset["PartEntry_ResetState<br/>+82 = NUL au depart"]

    MainGameTick --> WPeriodic["WorldObjects_UpdateFrame_ResetCounters<br/>(sub_221C2, appelee par CombatTarget_WeaponActionSubsystem)"]
    WPeriodic --> WUpdAll["WorldObjects_UpdateAllAndRemoveDead<br/>(sub_221F2 : parcourt la liste 22979,<br/>slot +16 de chaque noeud, retire les morts)"]
    WUpdAll -->|"slot +16 de la classe<br/>de vtable 9752"| WUpdAI["WorldObject_UpdateWithAIEntity<br/>(sub_3D9FB)"]
    WUpdAI -->|"byte_6D558 = 0<br/>entite lue a +85, slot +12"| MasterTick["AIEntity_MasterTick<br/>(tick par frame ; prepare l'etat puis aiguille ;<br/>voir AI_TICK_CALL_GRAPH.md)"]
    Autopilot["byte_6D558 = 1<br/>(pilotage automatique,<br/>UIScript_ParseAndEvaluate)"] -.->|"suspend le tick IA"| WUpdAI
    Spawn -->|"WorldObjects_AddToList<br/>(liste 22979)"| WUpdAll
    Spawn -.->|"objet monde +85 = entite IA<br/>(probable : WorldObject_ConstructWithAIEntity)"| WUpdAI
    MasterTick --> TriggerBU["AI_TriggerBehaviorUpdate"]
    TriggerBU --> TopThink["AI_TopLevelThink"]
    TopThink --> React["réactions prioritaires<br/>(menace, escorte, dégâts)"]
    React -->|"aucune réaction"| ActiveObj["objet à entité+13<br/>(nature inconnue)"]
    ActiveObj -->|"nul, avion au sol"| GoalExec["Goal_ExecuteAction"]
    ActiveObj -->|"nul, avion en vol"| GoalSlots["emplacements GOAL du fichier<br/>(un gestionnaire par octet)"]
    GoalSlots -->|"2"| GoalExec
    GoalSlots -->|"3"| Wander["Goal_WanderRandom"]
    GoalSlots -->|"4"| Tournament["Tournoi MVRS"]
    GoalSlots -->|"5"| ActiveWingman["Goal_MoraleReaction_878F (GOAL=5)"]

    Profile -.->|"ecrit une fois,<br/>relu en boucle par l'autre arbre"| MasterTick
    Formation -.->|"entite+285 = 170/165<br/>(LIEN REEL, bidirectionnel)"| ActiveWingman
    ActiveWingman -.->|"peut aussi ECRIRE<br/>entite+285 elle-meme"| Formation
    ActiveWingman -->|"execute via le meme<br/>noeud ID=21 (entite+209)"| Controller

    classDef construction fill:#dbeafe,stroke:#3b82f6,stroke-width:2px,color:#1e293b
    classDef dispatch fill:#f3e8ff,stroke:#a855f7,stroke-width:2px,color:#1e293b
    classDef resolved fill:#dcfce7,stroke:#22c55e,stroke-width:2px,color:#1e293b
    classDef failure fill:#fee2e2,stroke:#ef4444,stroke-width:2px,color:#1e293b

    class Entry,InitVid,MainLoopTop,CockpitKey,RefreshField,UpdateProp,Alloc,Load,Reset construction
    class MainGameTick dispatch
    class Interp,Plumb,Relay,Native,Switch,OrderImpl,Formation,Trigger,Adapter,Ensure,TickGroup,SelChange,LeavingEvt,MissionUpdEvt,Recompute dispatch
    class Controller,Spawn,Profile,MasterTick,TriggerBU,TopThink,React,GoalSlots,Wander,GoalExec,Tournament,ActiveWingman,WPeriodic,WUpdAll,WUpdAI resolved
    class Autopilot dispatch
    class Fail failure
```

**Ce que ce graphe montre maintenant** : le contrôleur générique est
**résolu** (vert) — une entité avion/pilote IA complète, avec son
propre profil `MVRS`, créée à la demande par
`PartEntry_ResolveSpawnPositionAndActivate`. Cette dernière n'est pas un
système séparé : elle est appelée par l'interprète, et le **rappelle**
en interne (flèche pointillée) pour une sous-évaluation — un appel
récursif contrôlé sur la même structure, pas deux systèmes distincts
qui convergent par coïncidence.

**MISE À JOUR (2026-09-19, session avec Rémi) — la case `AIEntity_MasterTick`
n'est plus un « arbre séparé » sans parent.** Son appelant est maintenant
tracé depuis `MAIN_GAME_TICK` (nouvelles flèches vertes du graphe) :
`CombatTarget_WeaponActionSubsystem` → `WorldObjects_UpdateFrame_ResetCounters`
→ `WorldObjects_UpdateAllAndRemoveDead` (parcourt la liste chaînée de tag
22979, slot +16 de chaque nœud) → `WorldObject_UpdateWithAIEntity` (l'objet
monde lit l'entité IA à +85) → `AIEntity_MasterTick` (slot +12 de la
vtable de l'entité, uniquement si `byte_6D558`, le drapeau de pilotage
automatique, vaut 0). Le détail, les noms modifiés et ce qui reste non
résolu sont dans `AI_TICK_CALL_GRAPH.md`. Le lien avec la branche « spawn »
est le même objet : `AIAircraft_SpawnAndConditionalLoadProfile` ajoute
l'objet créé à la liste 22979 (`WorldObjects_AddToList`, ancien nom
`Expr_Node_RegisterListener`, qui n'enregistre aucun écouteur `Expr_VM`).
Les liens `AI_TriggerBehaviorUpdate` → `AI_TopLevelThink` → `Goal_ExecuteAction`
ci-dessous viennent des sessions précédentes et n'ont pas été relus lors de
cette mise à jour : le corps de `AIEntity_MasterTick` lui-même n'exécute ni
GOAL ni MVRS, il prépare l'état puis aiguille vers `Goal_FollowAllyExec` ou
`AI_TriggerBehaviorUpdate`.

**Mise à jour du même jour, après lecture de `AI_TopLevelThink`** : la
chaîne `AI_TopLevelThink` → `Goal_ExecuteAction` → tournoi →
`Goal_MoraleReaction_878F` dessinée ici auparavant était inexacte. Le
graphe ci-dessus montre maintenant la structure lue : réactions
prioritaires, puis l'objet à `entité+13`, puis `Goal_ExecuteAction`
direct si l'avion est au sol, sinon les gestionnaires du tableau `GOAL`
(2, 3, 4, 5). Détail et citations dans `AI_TICK_CALL_GRAPH.md`.

## CORRIGÉ : cette chaîne tourne en fait À CHAQUE FRAME — `STRIKE_EXE_MAIN_LOOP`
contient la boucle principale du jeu

*Rémi a signalé une erreur dans une conclusion précédente de ce
document (qui affirmait à tort que toute cette chaîne n'était que de
l'initialisation) : `Program_InitVideoFontArgs` n'est pas un simple
init isolé — c'est ce qui lance le jeu, et la boucle réelle vit plus
bas dans la chaîne. Vérifié par lecture complète des deux fonctions
concernées.*

```
EntryPoint_RuntimeInit
    Program_InitVideoFontArgs   (init police/video/args — SE TERMINE, pas de boucle ici)
        STRIKE_EXE_MAIN_LOOP_53896   <-- CONTIENT LA VRAIE BOUCLE (verifiee : jmp loc_538A1, "tant que byte_706AF != 6")
            MAIN_GAME_TICK_536F7   (appelee A CHAQUE ITERATION)
                PartEntry_DispatchMissionUpdateTick_52E51
                    Expr_Node_UpdateAndPropagate_52AC6
                        Expr_VM_ExecuteSingleInstruction_51E7E
                            Expr_VM_Interpreter_51106
                                PartEntry_ResolveSpawnPositionAndActivate_51EDC
                                    Shared_TriggerExprInstruction
```

## Autre vérification dans la même séquence, découverte par Rémi :
`MissionScenario_RecomputeFields`, appelée depuis `STRIKE_EXE_MAIN_LOOP`

> **Correction (2026-10-30, `IMPL_MISSION_AREAS.md` § 4).** L'appel est bien dans `STRIKE_EXE_MAIN_LOOP`, mais
> **après la sortie de la boucle de jeu**, pas à chaque itération. La boucle appelle `MAIN_GAME_TICK` puis revient
> à son début tant que `byte_706AF` vaut 0 (`call near ptr MAIN_GAME_TICK` … `cmp byte_706AF, 0` / `jnz short
> loc_539AB` / `jmp loc_538BA`). L'appel de `MissionScenario_RecomputeFields_A9382` (`call VROOMM_StubThunk_6CE5B`)
> se trouve après `loc_539AB`, juste avant `Music_Stop_5A9E6` et le retour : il n'a lieu qu'une fois, en fin de
> mission. Le champ +16 d'une scène (3e script du chunk `SCNE`) est donc lancé quand la scène cesse d'être courante
> et en fin de mission. Le script qui tourne à chaque image est le champ +12 (2e script), par `MAIN_GAME_TICK`
> (`Scene_RunUpdateScript_531F2`, ex-`Scene_TriggerLeavingEvent`). Noms corrigés :
> `Scene_RunLeavingScript_53211` (ex-`Scene_TriggerMissionUpdateEvent`), `Scene_FindByArea_532AD`,
> `Scene_LeaveMarkUnits_5317A`. Le texte ci-dessous est gardé tel qu'il avait été écrit.

*Trouvaille de Rémi : un second déclencheur de `Scene_TriggerMissionUpdateEvent`,
appelé juste après `MAIN_GAME_TICK` dans la même itération de la boucle
principale — pas une chaîne séparée, une vérification supplémentaire au
même passage.*

```c
void MissionScenario_RecomputeFields(MissionScenario *scenario)
{
    if (scenario->currentScene != 0)   // +80
        Scene_TriggerMissionUpdateEvent(scenario->currentScene);
    if (scenario->pendingScene != 0)    // +78
        Scene_TriggerMissionUpdateEvent(scenario->pendingScene);

    if (PositionMatchesGlobalCheckpoint()) {
        byte_706AF = 5;   // LE MEME OCTET QUI CONTROLE STRIKE_EXE_MAIN_LOOP !
    }

    MissionScenario_ResolveAndBindExpressions(scenario);   // ecrit MISN2OP.IFF
    sub_A8124(scenario);
    sub_6CDBE();
}
```

**Deux découvertes majeures** :

1. **`+78` et `+80` sur `MissionScenario` sont des pointeurs de
   `SceneRecord`** — corrige une documentation antérieure de
   `DATA_MODEL.md` qui les décrivait comme un "handle de nœud" et un
   "flag HOME". `+80` correspond exactement au champ rempli par
   `Scene_DetectAndActivateChange`.
2. **Cette fonction manipule directement `byte_706AF`** — l'octet qui
   contrôle la sortie de la boucle principale du jeu
   (`STRIKE_EXE_MAIN_LOOP`, `tant que byte_706AF != 6`). C'est un lien
   direct, jamais tracé jusqu'ici, entre la logique de scénario et le
   contrôle du jeu à son plus haut niveau. Elle appelle aussi la
   fonction d'écriture des résultats de fin de mission
   (`MissionScenario_ResolveAndBindExpressions` → `MISN2OP.IFF`).

**Appelée directement depuis `STRIKE_EXE_MAIN_LOOP`**, à la suite de
`MAIN_GAME_TICK` dans la **même séquence** de la même itération de la
boucle principale — pas un chemin parallèle, juste une vérification
faite à un autre moment de ce même passage.



*Question de Rémi : après `PART` (via `PROG`/opcode et via
`PartEntry_DispatchMissionUpdateTick`), où est le chemin équivalent
pour les scènes ?*

**Confirmé : pas une boucle sur toutes les scènes, mais une
vérification à chaque frame qui déclenche l'exécution quand la scène
active change.**

```
MAIN_GAME_TICK (chaque frame)
    Scene_DetectAndActivateChange (chaque frame)
        Scene_FindMatchingByAreaContainment -> resout la scene active courante
        si elle a change depuis le dernier appel :
            si une ancienne scene existait : declenche son +16 (on_mission_update)
            si une nouvelle scene existe :   Scene_TriggerActivation -> +8 (on_is_activated)
                                              + fait apparaitre ses unites (Scene_EnsureUnitsSpawned)
        sinon (scene inchangee) : rien ne se declenche
```

**Précision corrigée sur `on_mission_update` d'une scène** — d'abord
mal caractérisée, puis corrigée par Rémi : en ne regardant que l'appel
depuis `Scene_DetectAndActivateChange` (uniquement sur changement de
scène), on aurait pu croire que c'était un événement ponctuel. Mais
**`Scene_RunLeavingScript_53211` elle-même n'a aucune
garde** — c'est **`MissionScenario_RecomputeFields_A9382`**, appelée
sans condition à chaque frame, qui la déclenche tant que `+80`
(la scène active courante) reste non nul. **`on_mission_update` d'une
scène tourne donc bien en continu, une fois par frame, exactement
comme celui de `PART`** (voir `PartEntry_DispatchMissionUpdateTick`).

L'appel depuis `Scene_DetectAndActivateChange` (uniquement quand la
scène change) est une **garantie supplémentaire** — s'assurer que
l'ancienne scène reçoit un dernier appel avec sa propre référence,
juste avant que `+80` ne soit remplacé par la nouvelle — pas le
mécanisme principal.

Un troisième champ, `+12` (`on_leaving`), est déclenché séparément
par `Scene_RunUpdateScript_531F2` — appelé directement depuis `MAIN_GAME_TICK`, pas
depuis `Scene_DetectAndActivateChange`.



*Erreur de nommage identifiée en cherchant qui parcourt la liste des
`SCNE` (scènes de mission).*

En cherchant une boucle au pas `39` (39 octets, taille exacte d'un
enregistrement `SCNE`), on retrouve `Scene_FindMatchingByAreaContainment`
(`sub_53236`) :

```c
SceneRecord *Scene_FindMatchingByAreaContainment(PlayObject *play, uint16_t param)
{
    for (uint16_t i = 0; i < play->sceneCount; i++) {
        SceneRecord *scene = play->sceneArray + i * 39;
        if (scene->is_active && scene->areaHandle) {
            bool matches = (scene->areaHandle == 0)
                ? true
                : scene->areaHandle->vtable->TestContainment(param);
            if (matches) return scene;
        }
    }
    return NULL;
}
```

**Cette fonction est appelée par ce qu'on avait nommé à tort
`MissionFormation_HandleGroupSelectionChange`** — il n'y a jamais eu
de "formation" ou de "groupe" : le "groupe" détecté et activé, c'était
**la scène active courante**. Toute la chaîne a été renommée :

| Ancien nom (erroné) | Nouveau nom |
|---|---|
| `MissionFormation_HandleGroupSelectionChange` | `Scene_DetectAndActivateChange` |
| `MissionFormation_TickGroup` | `Scene_TriggerActivation` |
| `MissionFormation_EnsureAllSlotsFilled` | `Scene_EnsureUnitsSpawned` |

`Scene_EnsureUnitsSpawned` (`sub_530FF`) prend maintenant tout son
sens : son paramètre est très probablement **la scène elle-même**, et
`+20`/`+22` correspondent à la **liste d'unités** documentée en
queue du chunk `SCNE` (`DATA_MODEL.md` — liste de `u16`, index dans
`PART`) — elle s'assure que toutes les unités associées à la scène
existent bel et bien au moment où celle-ci s'active.

**Chaîne complète, maintenant cohérente** : le joueur/une entité se
déplace → `Scene_DetectAndActivateChange` détecte que la scène
correspondante a changé → `Scene_TriggerActivation` fait apparaître
les unités manquantes de la nouvelle scène (`Scene_EnsureUnitsSpawned`
→ `PartEntry_ResolveSpawnPositionAndActivate`) et déclenche l'exécution de
son script `on_is_activated`.

tableau des `PartEntry`

*Question de Rémi : quel est le type d'objet parcouru par cette
fonction ?*

Deux preuves convergentes permettent de trancher avec confiance :

1. **Le pas de la boucle est exactement `85` (85 octets)** — la
   taille exacte confirmée de `PartEntry` (`PartEntry_AllocateArray`)
2. **Le bit testé est le bit 0 de `+57`** — le même champ de statut
   manipulé par `PartEntry_ResetState`

```c
void PartEntry_DispatchMissionUpdateTick(PartEntry *partTable, uint16_t count)
{
    for (uint16_t i = 0; i < count; i++) {
        if (partTable[i].statusFlags & 1) {   // bit "on_mission_update actif"
            Expr_Node_UpdateAndPropagate(&partTable[i]);
        }
        partTable += 1;   // += 85 octets
    }
}
```

**C'est le vrai déclencheur, à chaque frame, de l'événement
`on_mission_update`** pour chaque participant de mission dont le bit
correspondant est actif — le point d'entrée de toute la chaîne qui
suit (`Expr_Node_UpdateAndPropagate` → `Expr_VM_ExecuteSingleInstruction`
→ `MissionScript_ExecutePROG`) et qui finit par exécuter le script
`on_mission_update` de ce participant (`PartEntry+70/72`).


(vérifiée en entier, 289 lignes) charge la police, configure la
vidéo, parse les arguments de ligne de commande, appelle
`STRIKE_EXE_MAIN_LOOP` **une seule fois**, puis se termine (`retf`) —
jusque-là, pas de boucle. Mais **`STRIKE_EXE_MAIN_LOOP` elle-même**
(vérifiée en entier, 254 lignes) contient une **vraie boucle** :
`loc_538A1` est une cible de saut arrière (`jmp loc_538A1` à la ligne
correspondant à `sub_53896+12B`), avec condition de sortie
`byte_706AF == 6`. **C'est la boucle principale du jeu** — elle
appelle `MAIN_GAME_TICK` à chaque itération, donc
tout ce qui en découle (jusqu'à `PartEntry_ResolveSpawnPositionAndActivate`
et au-delà) s'exécute **à chaque frame**, pas une seule fois.

**Conséquence** : toute la chaîne de gestion de formation/script de
mission qu'on a tracée en profondeur cette session **est bien exécutée
en continu pendant le jeu** — pas seulement à l'initialisation de la
mission. C'est très probablement **la vraie réponse** à la question
initiale ("que se passe-t-il à chaque frame pour la gestion de
mission ?"), pas une impasse comme on l'avait conclu à tort.

**Ce qui reste vrai malgré cette correction** : on n'a toujours pas
trouvé de lien direct par appel de fonction entre cette chaîne et
`AI_TopLevelThink`/`Goal_ExecuteAction` (les deux boucles tournent en
parallèle, chacune à chaque frame, sans s'appeler l'une l'autre) —
mais l'explication n'est plus "l'une est init, l'autre est
exécution" ; c'est que ce sont **deux boucles per-frame distinctes**
qui communiquent par état partagé sur l'entité, pas par appel direct.

**Pour continuer à comprendre l'exécution par frame de la mission
elle-même** (pas l'initialisation), il faut repartir de
`AIEntity_MasterTick` ou d'un point situé dans son propre arbre — pas
de la chaîne de formation/spawn documentée ci-dessus.

*Mise à jour 2026-09-19 : le point de départ est maintenant connu. Les deux
« boucles per-frame distinctes » partent bien toutes deux de `MAIN_GAME_TICK` :
l'une par `PartEntry_DispatchMissionUpdateTick` (script de mission, spawn),
l'autre par `CombatTarget_WeaponActionSubsystem` →
`WorldObjects_UpdateFrame_ResetCounters` → `WorldObjects_UpdateAllAndRemoveDead`
→ `WorldObject_UpdateWithAIEntity` → `AIEntity_MasterTick`. Elles communiquent
par l'objet monde et la liste 22979, pas par un appel direct. Voir
`AI_TICK_CALL_GRAPH.md`.*

## Découverte architecturale : ce n'est pas un système de mission, c'est
un moteur générique d'évaluation de nœuds

*Correction majeure : en cherchant tous les appelants de l'adaptateur
(pas un seul exemple), on découvre que ce système dépasse largement
les scripts de mission.*

**12 fonctions complètement différentes** appellent
`Expr_VM_ExecuteSingleInstruction`, couvrant des domaines sans aucun
rapport entre eux :

| Fonction appelante | Domaine |
|---|---|
| `Expr_Node_RecomputeIfDirty` | Graphe de nœuds générique |
| `Expr_Node_UpdateAndPropagate` | Graphe de nœuds générique |
| `Expr_Node_RecomputeFieldA/B/C` | Graphe de nœuds générique |
| `Expr_Node_EvaluateVisibility` | Graphe de nœuds générique |
| `STRIKE_EXE_MAIN_LOOP` | **Boucle principale du jeu** (corrigé — pas une simple interface) |
| `Weapon_HUDBox_UpdateAndRender` | HUD d'armement |
| `Landing_Phase3_TouchdownRoll_765B2` (ex-`AITargeting_ComputeOrientationExtended`) | Fin de l'atterrissage du joueur (entrée +64 du script, voir `MUSIC_SYSTEM.md` §5.4) |
| `UIScript_ParseAndEvaluate` | Script d'interface |
| `Collision_OnTerrainContact_9D910` (ex-`Gauge_ComputeAndRenderNeedle`) | Contact au sol accepté du joueur (entrée +64 du script) |
| `PartEntry_ResolveSpawnPositionAndActivate` | Mission (celui qu'on a tracé) |

**Conclusion** : `MissionScript_ExecutePROG` (l'interprète à 209 cas)
n'est pas un interprète de script de mission au sens strict — c'est
un **moteur générique d'évaluation de nœuds/expressions**, réutilisé
dans une grande partie du moteur du jeu (interface, jauges, HUD,
ciblage IA, ET scripts de mission). Les ordres de mission (`Take
off`, `Destroy target`...) ne sont qu'**un domaine parmi d'autres**
que ce moteur générique sait évaluer.

**Ça renforce fortement l'hypothèse notée précédemment** : les
identifiants `MVRS` (`1` à `21`) pourraient bien être des nœuds de ce
même graphe générique, pas de simples champs C indépendants — puisque
ce moteur gère déjà, de façon prouvée, plusieurs familles de nœuds
totalement différentes (interface, jauges, ciblage) sous une seule et
même infrastructure. À vérifier directement contre `AI_SYSTEM.md`.

---

## Fonction : `MissionScript_CallNativeHandler` (`sub_52513`, `seg114`)

**Rôle** : point d'aiguillage central pour tous les ordres de mission
sémantiques (Take off, Land, Destroy target, etc.). Vérifie d'abord
si l'exécution est possible, puis distingue l'ordre demandé, puis
délègue systématiquement l'exécution tactique réelle à un contrôleur
générique.

### Signature

```c
int16_t MissionScript_CallNativeHandler(
    PartEntry *missionObject,  // arg_0 (dword) — objet reference par [instruction+18]
    uint16_t opcode,                 // arg_4 (word)  — le code d'ordre, ex. ORDER_TAKE_OFF
    uint16_t param1,                 // arg_6 (word)  — [instruction+8]
    uint16_t param2                  // arg_8 (word)  — [instruction+10]
);
```

### Variables locales notables

| Nom dans ce document | Rôle |
|---|---|
| `resolvedPosition` | Position 3D calculée par le cas de l'ordre (x,y,z, virgule fixe 24.8) |
| `resolvedTargetObject` | Pointeur vers l'objet cible/allié résolu, si l'ordre en implique un |
| `skillValue` | Valeur de "compétence" transmise au contrôleur générique — copiée depuis `resolvedTargetObject->performanceStat` (le champ `+82` scalaire, issu du sous-chunk `TOFF`) si un objet a été résolu |

### Pseudocode

```c
int16_t MissionScript_CallNativeHandler(PartEntry *missionObject,
                                          uint16_t opcode,
                                          uint16_t param1,
                                          uint16_t param2)
{
    // --- Garde d'entree : determine si QUOI QUE CE SOIT s'execute ---
    if (missionObject->controller == NULL) {
        return 0;   // pas de controleur associe -> echec immediat
    }
    if ((missionObject->statusFlags & STATUS_BIT_BUSY) != 0) {
        return 0;   // objet indisponible -> echec immediat, quel que soit l'ordre
    }

    missionObject->completionFlag = 255;   // pose l'etat "ordre en cours"

    Vec3 resolvedPosition = {0};
    PartEntry *resolvedTargetObject = NULL;
    int skillValue = 0;

    switch (opcode) {
        case ORDER_TAKE_OFF:
            resolvedPosition = LookupNamedWaypoint(g_waypointTable, WAYPOINT_TAKEOFF_INDEX);
            break;

        case ORDER_LAND:
            resolvedPosition = LookupNamedWaypoint(g_waypointTable, param1);  // source differente de Take off
            break;

        case ORDER_FLY_TO_MISSION_POINT:
        case ORDER_FLY_TO_RELATIVE_POINT:      // partage le meme code (172)
            // resout DEUX positions successives (depart + arrivee ?)
            Vec3 posA = LookupNamedWaypoint(g_waypointTable, param2);
            Vec3 posB = LookupNamedWaypoint(g_waypointTable, missionObject->localPositionRef);
            resolvedPosition = posB;   // la seconde ecrase la premiere dans ce qu'on a lu
            break;

        case ORDER_DESTROY_TARGET:
            resolvedTargetObject = ResolveObjectById(g_objectTable, param1);
            if (resolvedTargetObject == NULL) return 0;
            resolvedPosition = GetCurrentPosition(resolvedTargetObject);  // repete a chaque appel, donc a jour
            break;

        case ORDER_DEFEND_TARGET:
            resolvedTargetObject = ResolveObjectById(g_objectTable, param1);
            if (resolvedTargetObject == NULL) return 0;
            resolvedPosition = GetCurrentPosition(resolvedTargetObject);
            // + une seconde resolution de position, non elucidee precisement
            break;

        case ORDER_DEFEND_AREA:
            resolvedPosition = LookupNamedWaypoint(g_waypointTable, param1);  // zone = coordonnee fixe
            break;

        case ORDER_FOLLOW_ALLY: {
            uint16_t allyId = (param1 == 255) ? missionObject->defaultAllyId : param1;
            resolvedTargetObject = ResolveObjectById(g_objectTable, allyId);
            if (resolvedTargetObject != NULL) {
                resolvedPosition = resolvedTargetObject->rawPosition;  // lecture directe, pas GetCurrentPosition
            }
            break;
        }

        // 163, 171, 177-181 : mecanismes proches (resolution d'objet
        // ou table de positions) mais nature tactique precise non
        // confirmee empiriquement — voir table plus bas

        default:
            return 0;
    }

    if (resolvedTargetObject != NULL) {
        skillValue = resolvedTargetObject->performanceStat;   // champ +82 scalaire (TOFF)
    }

    // --- Sortie commune : delegation a l'execution tactique reelle ---
    // AUCUN calcul de poursuite/tir ne vit ici ni dans aucun cas ci-dessus
    return missionObject->controller->vtable->ExecuteFlightCommand(
        resolvedPosition, skillValue, opcode, param2 /* duree ? */
    );   // [controller->vtable+136] — methode generique, PAS specifique au vol
          // (le meme slot est aussi appele par PartEntry_ResolveSpawnPositionAndActivate
          // avec un opcode different, 179 — confirme un dispatcheur
          // multi-usage, pas un controleur de vol dedie)
}
```

### Points de retour

| Condition | Valeur retournée |
|---|---|
| Pas de contrôleur associé à l'objet de mission | `0` |
| Objet marqué occupé/indisponible | `0` |
| Ordre non reconnu par le switch | `0` |
| Résolution d'objet cible échouée (Destroy/Defend target) | `0` |
| Succès | résultat de `ExecuteFlightCommand` (contrôleur générique) |

### Ce qui reste incertain

- **`ExecuteFlightCommand`** (`[vtable+136]`) — **RÉSOLU le 2026-09-19** : ce
  n'est pas une exécution tactique. Sur la classe d'objet monde `10172` elle
  transmet l'ordre à l'entité IA (`[si+85]`, slot `+16`), c'est-à-dire à
  `Goal_SetObjective_A307`, qui pose l'objectif (`entité+285`, cibles,
  positions) ; sur les classes `9892`, `9752`, `10032` c'est un no-op qui
  renvoie 0. Détail dans `AI_TICK_CALL_GRAPH.md`. *Ancien texte :* la méthode
  réellement responsable de l'exécution tactique n'avait pas été identifiée. Elle
  est générique (utilisée aussi par un système de rendu/géométrie
  sans rapport, avec un opcode différent), donc probablement un
  "bus de commande" d'entité plutôt qu'un contrôleur de vol dédié.
- Le champ `controller` (`+82` comme pointeur) — aucun site de
  construction retrouvé par recherche textuelle à ce stade.
- **Piège à ne pas refaire** : ce même décalage `+82` est aussi un
  champ **scalaire** (`performanceStat`, issu du sous-chunk `TOFF`)
  sur un objet totalement différent (la définition d'avion chargée
  au parsing `JETP`) — deux structures distinctes, même décalage.

---

## Fonction : `MissionScript_DispatchOrderToNative` (`loc_51C09`, `seg114`)

**Rôle** : relais partagé par presque tous les ordres du premier
switch (209 cas) — prépare les paramètres et appelle
`MissionScript_CallNativeHandler`, puis mémorise le résultat sur
l'instruction elle-même.

### Pseudocode

```c
void MissionScript_DispatchOrderToNative(ScriptInstruction *instr)
{
    instr->taskState = MissionScript_CallNativeHandler(
        instr->missionObjectRef,   // [instr+18]
        instr->opcode,               // [instr+6]
        instr->param1,                // [instr+8]
        instr->param2                 // [instr+10]
    );
    // instr->taskState ([instr+14]) devient l'etat "ordre en cours"
    // -> relu par IsOrderActive/IsOrderComplete (voir plus bas)
}
```

---

## Table des ordres — noms en référence principale

| Ordre | Mécanisme | Détail |
|---|---|---|
| **Take off** | Table de positions | `LookupNamedWaypoint` sur un index fixe |
| **Land** | Table de positions | Même table, source de paramètre différente |
| **Vol vers point de mission** | Table de positions (double) | Résout deux positions successives |
| **Destroy target** | Résolution d'objet | Position de la cible relue à jour à chaque appel |
| **Defend target** | Résolution d'objet (double) | Cible à défendre + une seconde résolution non élucidée |
| **Defend area** | Table de positions | Coordonnée fixe, pas d'objet suivi |
| **Follow ally** | Résolution d'objet + lecture directe | `255` = allié par défaut ; lit la position brute, pas via résolution différée |

### Ordres non identifiés dans la table externe de Rémi

| Code | Mécanisme | Hypothèse |
|---|---|---|
| `163` | Résolution d'objet + relecture d'une position "Take off" | Possible "escorter X puis continuer" |
| `171` | Copie directe de `completionFlag`, pas de résolution | Possible "vérifier si l'ordre précédent est terminé" |
| `177` | Table indexée, écrit un axe (Y ?) | Possible "définir l'altitude depuis une liste" |
| `178` | Même table, axe différent | Complément de `177` |
| `179` | Résolution d'objet | Variante de ciblage non déterminée |
| `180` | Table de positions | Variante de positionnement non déterminée |
| `181` | Résolution d'objet | Variante de ciblage non déterminée |

---

## Le mécanisme de suivi "ordre en cours / ordre terminé"

`ScriptInstruction->taskState` (`[instr+14]`) — un champ sur
l'**instruction elle-même**, pas une variable globale — porte cet
état. Deux opcodes dédiés le consultent :

```c
// "L'ordre en cours est-il actif ?"
bool IsOrderActive(ScriptInstruction *instr) {
    return instr->taskState != 0;
}

// "L'ordre en cours est-il termine ?"
bool IsOrderComplete(ScriptInstruction *instr) {
    return instr->taskState == 0;
}
```

**Point important** : ces tests servent à **l'auteur du script** pour
décider explicitement d'avancer au prochain ordre — ce n'est **pas**
un blocage automatique. La fonction qui avance la lecture du script
(`ScriptAdvanceToNextInstruction`, `sub_50F85`) ne vérifie jamais cet
état — rien n'empêche mécaniquement d'enchaîner deux ordres sans test
entre eux.

## Une trace unique de l'ordre en cours, pas une file

| Champ | Rôle |
|---|---|
| `entité+285` | Code de l'ordre en cours (consulté par `GOAL`/`Goal_ExecuteAction`) |
| `entité+84` | Drapeau d'état/achèvement (`completionFlag`, `255` = posé) |
| `entité+17` | Nœud construit à la demande (même mécanisme que `MVRS`) |
| `entité+311` | Référence de cible (ordres type "détruire/défendre") |
| `entité+287`/`+299` | Coordonnées de point de mission, partagées script/`GOAL` |

Si deux ordres s'enchaînent sans test explicite, le second **écrase**
l'état du premier dans ces mêmes champs.

## Script et `GOAL` : qui fait le vrai travail ?

**Le script résout une intention (position/cible) ; il n'exécute
aucune tactique lui-même.** Toute la logique de poursuite, d'approche
et de tir est déléguée à `ExecuteFlightCommand` — un point unique et
générique, identique pour tous les ordres, non encore identifié
précisément.

## RÉSOLU : le contrôleur `+82` est une entité avion/pilote IA
complète — le même objet que toute la documentation `MVRS`

*Trouvaille majeure qui referme la question ouverte, et relie
directement ce document à `AI_SYSTEM.md`.*

En lisant intégralement `sub_51EDC` (deux noms précédents erronés :
d'abord "GeomNode_BuildOrRefreshCluster" — supposait à tort un lien
avec la géométrie sur la seule foi des noms de ses callees —, puis
"MissionFormation_ComputeSlotAndSpawn" — trop spécifique, puisqu'elle
est aussi appelée depuis la chaîne des scènes) :

```c
// Extrait central, PartEntry_ResolveSpawnPositionAndActivate (sub_51EDC, seg114)
Vec3 spawnPosition = ComputeWeightedPositionOffset(partEntry);
                       // combine plusieurs points nommes ponderes
                       // (Formation_ComputeGeometryHelper, AI_ComputeApproachAngles —
                       // utile pour un ordre de formation, mais la fonction
                       // elle-meme est generique)

AircraftEntity *spawned = AIAircraft_SpawnAndConditionalLoadProfile(
    g_waypointTable, partEntry->localRef, spawnPosition
);

SetReference(&partEntry->controller, spawned);   // +82 assigne ICI
```

**`AIAircraft_SpawnAndConditionalLoadProfile` (`sub_53363`) est la
fabrique de l'entité avion/pilote elle-même** — la MÊME entité sur
laquelle repose toute la documentation `MVRS`/`ATRB`/`GOAL`
(`AI_SYSTEM.md`) :
- Détermine le type de contrôle (joueur/réseau/IA par comparaison de
  chaîne)
- Instancie l'entité, la positionne
- **Appelle `PilotProfile_LoadFromPROF` — la même fonction lue
  intégralement dans la session `MVRS`** — chargeant `GOAL`/`MVRS`/
  `ATRB`, mais **uniquement pour les avions IA/réseau, jamais pour le
  joueur**
- Enregistre l'entité comme auditeur du système `Expr_VM` (le même
  interprète à 209 cas documenté ici) **avant** le chargement du
  profil

**Conséquence directe** : `[+82 → vtable+136]`
(`ExecuteFlightCommand`) est une méthode de **cette même classe
d'entité avion/pilote** — pas un système séparé et mystérieux. Que ce
soit un ordre de script direct ou l'activation d'une scène, le
mécanisme **fait apparaître un avion IA complet avec son propre profil
de comportement**, puis lui délègue l'exécution du vol via cette
méthode.

**Piste ouverte, notée par une lecture antérieure de
`AIAircraft_SpawnAndConditionalLoadProfile`** : l'entité est
enregistrée comme auditeur `Expr_VM` **avant** le chargement de son
profil `MVRS` — ce qui suggère que les identifiants de nœuds `MVRS`
(`1` à `21`) pourraient correspondre à des identifiants de nœuds du
graphe `Expr_VM` plutôt qu'à de simples champs C indépendants. Non
vérifié — candidat pour une prochaine session, avec un lien direct
vers `AI_SYSTEM.md`.

## RÉSOLU : le lien entre script et `GOAL` — `entité+285` est un canal
bidirectionnel, pas un drapeau à sens unique

*Question empirique posée par Rémi : avec seulement `GOAL=1`, son
coéquipier décolle (premier ordre du script) mais ignore ensuite
l'ordre "Follow Leader" (monte simplement dans le ciel). *(Précisé par Rémi le 2026-09-25 : avec `GOAL = 5, 1`, l'avion décolle puis
ne fait plus rien — nez vers le ciel, plus de pilotage. La phrase qui se trouvait ici,
« avec `GOAL=1` et `GOAL=5` il suit immédiatement le joueur », était fausse.)*
Ça prouve qu'un vrai mécanisme relie script et `GOAL` — la conclusion
précédente ("le script délègue directement, sans passer par `GOAL`")
était incomplète.*

> **⚠️ Correction 2026-09-25.** Le pseudo-code et les « deux découvertes » ci-dessous sont faux :
> relue ligne à ligne, `Goal_MoraleReaction_878F` est une réaction au moral (fuite, abandon,
> retournement contre le joueur, rattachement au joueur), pas l'exécution du suivi. Voir
> `AI_SYSTEM.md` §4.4. Avec `GOAL = 5, 1`, l'avion décolle (ordre exécuté au sol par
> `Goal_ExecuteAction_A8AC`) puis ne fait plus rien en vol : le seul gestionnaire,
> `Goal_MoraleReaction_878F`, n'agit que sur le moral. Le suivi (`170`) demande la valeur `2`.

En lisant intégralement `Goal_MoraleReaction_878F` (l'option
de tournoi liée à `GOAL=5`) :

```c
// Extrait central de Goal_MoraleReaction_878F (GOAL=5)
void Goal_MoraleReaction_878F(Entity *self, Context *ctx)
{
    // ... conditions de garde (portee, delai anti-spam byte_6E4CD) ...

    if (self->currentOrder == ORDER_FOLLOW_ALLY) {   // entite+285 == 170
        // execute le suivi actif, continu, image par image
        RadioAnnounce(self, ...);
        self->flags_28B |= 32;
        currentOrder->vtable->ExecuteViaID21(self);   // entite+209 -> vtable+8
    }
    else if (/* cible verrouillee correspond a self->allyRef */) {
        // PEUT ELLE-MEME poser l'ordre :
        self->currentOrder = ORDER_FOLLOW_ALLY;         // entite+285 = 170
        SetReference(&self->allyRef, word_722E6);        // entite+325
        currentOrder->vtable->ExecuteViaID21(self);
    }
    else if (/* autre condition */) {
        self->currentOrder = ORDER_FLY_TO_MISSION_POINT;  // entite+285 = 165
        currentOrder->vtable->ExecuteViaID21(self);
    }
}
```

**Deux découvertes en une** :

1. **`entité+285` est un canal à double sens** : le script peut le
   poser (via `Goal_SetObjective`), et `Goal_MoraleReaction_878F`
   (`GOAL=5`) le **lit** pour décider d'agir — mais elle peut **aussi
   l'écrire elle-même**, avec le même vocabulaire de codes (`170`,
   `165`), selon ses propres observations (correspondance avec
   `word_722E6`, la cible/leader couramment sélectionné).

2. **Les deux chemins (script direct, et `GOAL=5`) convergent vers la
   même exécution finale** : l'appel à `entité+209 → vtable+8` — le
   nœud `MVRS` `ID=21` qu'on avait déjà identifié comme exécuteur de
   navigation caché, utilisé aussi bien par
   `PartEntry_ResolveSpawnPositionAndActivate` (côté script) que par cette
   fonction (côté `GOAL`).

**CORRIGÉ (2026-09-19, lecture de `AI_TopLevelThink`, voir
`AI_TICK_CALL_GRAPH.md`)** — l'explication initiale de ce paragraphe
(« aucune option du tournoi ne consulte `entité+285` ») était inexacte.
Ce qui explique l'observation :

1. **Le décollage s'exécute parce que l'avion est au sol.**
   `AI_TopLevelThink` appelle `Goal_ExecuteAction_A8AC` **directement**
   quand l'octet `+32` du sous-objet de l'avion (le drapeau « au sol »
   posé par `PhysicsTicks`) est non nul, sans consulter le tableau `GOAL`.
   Le script pose l'ordre `161` (décollage) et `Goal_ExecuteAction_A8AC`
   l'exécute, même avec `GOAL=1` seul.
2. **La valeur `1` du fichier `GOAL` est abandonnée au chargement**
   (`cmp [bp+var_8], 1 / jz` dans `PilotProfile_LoadFromPROF`) : le
   tableau est vide, aucun gestionnaire n'est associé.
3. **Une fois en vol**, `AI_TopLevelThink` ne parcourt plus que les
   emplacements du fichier. Avec un tableau vide rien ne s'exécute : le
   suivi (`Follow Ally`, `170`) n'est jamais traité, l'avion garde son
   dernier état. Avec `5`, `Goal_MoraleReaction_878F` est appelé
   et lit `entité+285`.

Le canal `entité+285` reste bidirectionnel (le script le pose,
`Goal_MoraleReaction_878F` le lit et peut l'écrire), mais le
choix entre « exécuté » et « ignoré » dépend d'abord du drapeau au sol
et du tableau `GOAL`, pas d'un test des options du tournoi.
`Goal_ExecuteAction_A8AC`, `Goal_WanderRandom_AD13`, le tournoi et
`Goal_MoraleReaction_878F` sont des gestionnaires alternatifs
choisis par l'octet du fichier, pas des étapes qui s'enchaînent.


- Confirmer `163`, `171`, `177`-`181` par observation empirique.
- Le mécanisme précis reliant le script à `Goal_SetObjective` (système
  à nœuds séparé, tag `288`) — jugé secondaire, le résultat
  fonctionnel (champs partagés) étant déjà confirmé.
- Les ~130 cas de plomberie générique du premier switch — hors
  périmètre "ordres de mission" sauf indication contraire.
- Vérifier l'hypothèse "identifiants `MVRS` = nœuds `Expr_VM`"
  ci-dessus contre ce qu'on a déjà établi dans `AI_SYSTEM.md`.

## Découverte architecturale : l'interprète est un utilitaire générique,
pas exclusif aux scripts de mission

En cherchant l'assignation du contrôleur, on a tracé la chaîne de
construction complète des objets de mission — et découvert au passage
que `MissionScript_ExecutePROG` (l'interprète à 209 cas) est appelé
**via un adaptateur générique**, pas uniquement depuis un vrai buffer
de script persistant :

```c
// Expr_VM_ExecuteSingleInstruction (sub_51E7E) — 48 lignes, lue integralement
int16_t Expr_VM_ExecuteSingleInstruction(uint16_t opcode,
                                           PartEntry *object,
                                           Vec3 position)
{
    if (object == NULL) return 0;

    // Construit une fausse instruction TEMPORAIRE sur sa propre pile —
    // pas dans un vrai buffer de script persistant
    ScriptInstruction fakeInstr = {0};
    fakeInstr.missionObjectRef = object;
    fakeInstr.positionOrParams = position;
    fakeInstr.opcode = opcode;

    return MissionScript_ExecutePROG(&fakeInstr);
}
```

**Cet adaptateur est aussi appelé par `PartEntry_ResolveSpawnPositionAndActivate_51EDC`
elle-même**, en interne, via `Shared_TriggerExprInstruction_5247D`
(renommée — le nom précédent, `GeomNode_TriggerExprInstruction`,
supposait à tort un lien avec la géométrie sur la seule foi du nom de
son appelante). **Ce n'est pas un second système sans rapport qui
converge par coïncidence** — `PartEntry_ResolveSpawnPositionAndActivate`
est elle-même appelée par l'interprète (`+1787`), et rappelle
l'interprète en interne pour une sous-évaluation, sur la **même**
structure à 85 octets (`+57`, `+58`). C'est un appel récursif
contrôlé, pas une convergence entre deux systèmes distincts.

**Conséquence** : la structure à 85 octets qu'on a tracée
(`PartEntry_AllocateArray_AA23D`) et son champ de statut
(`+57`/`+58`/`+82`/`+84`) forment probablement un patron
**générique de "nœud exécutable"**, réutilisé par plusieurs systèmes
du moteur (mission ET géométrie), pas une structure conçue
uniquement pour les ordres de mission — cohérent avec tout ce qu'on a
observé ailleurs dans ce binaire (destructeurs partagés, registre de
références faibles unique, etc.).

## Fonction : `PartEntry_AllocateArray` (`sub_AA23D`, `seg457`)

**Rôle** : construit le tableau complet des objets de mission au
chargement, un enregistrement de 85 octets par objet.

```c
void PartEntry_AllocateArray(ScriptHeader *header, PartEntry **outArray)
{
    int count = header->totalScriptBytes / 62;
    // (verification de coherence omise ici, presente dans le code reel)

    PartEntry *array = (PartEntry *)AllocateTyped(
        TAG_MISSION_OBJECT, count * sizeof(PartEntry) /* 85 = 85 octets/element */
    );
    *outArray = array;

    for (int i = 0; i < count; i++) {
        PartEntry_LoadAndResolveNames(header, &array[i]);
    }
}
```

## Fonction : `PartEntry_LoadAndResolveNames` (`sub_A9E3C`, `seg457`)

**Rôle** : initialise une entrée `PART` (participant/faction de la
mission — confirmé par recoupement avec `DATA_MODEL.md`) depuis les
données brutes du chunk. **Découverte majeure** : c'est ici que les 4
identifiants de script (`progs_id[0..3]` dans l'implémentation de
Rémi) sont résolus en pointeurs directs vers le `PROG` réel.

```c
void PartEntry_LoadAndResolveNames(MissionScenario *scenario, PartEntry *part)
{
    PartEntry_ResetState(part);   // +50, +57, +58, +82, +84

    uint8_t rawData[62];
    ReadFieldGroupA(chunk, rawData, 62);   // lecture brute du chunk PART
    part->flagA = rawData[0];                // +27

    part->nameA = ResolveNameAt(part, +9);    // +8  (role precis non elucide)
    part->nameB = ResolveNameAt(part, +18); // +17 (role precis non elucide)
    part->nameC = ResolveNameAt(part, +26); // +26 (role precis non elucide)

    part->position = LookupNamedWaypoint(scenario->areaTable, rawData[...]);
    // ecrit +28 a +55 (position + metadonnees associees, roles
    // precis de chaque sous-champ non tous elucides)

    // --- LES 4 progs_id, resolus en pointeurs directs vers PROG ---
    part->on_is_activated  = Expr_LookupNamedValue(scenario->progTable, rawData_id0); // +66/+68
    part->on_mission_update = Expr_LookupNamedValue(scenario->progTable, rawData_id1); // +70/+72
    part->on_is_destroyed   = Expr_LookupNamedValue(scenario->progTable, rawData_id2); // +74/+76
    part->on_missions_init  = Expr_LookupNamedValue(scenario->progTable, rawData_id3); // +78/+80

    part->field_0x3E = 0;
    part->field_0x40 = 0;
    // part->controller (+82) reste NUL — jamais assigne ici
}
```

**Correspondance confirmée avec l'implémentation de Rémi** :
```c
prt->on_is_activated   = prt->progs_id[0];   // -> PartEntry+66
prt->on_mission_update = prt->progs_id[1];   // -> PartEntry+70
prt->on_is_destroyed   = prt->progs_id[2];   // -> PartEntry+74
prt->on_missions_init  = prt->progs_id[3];   // -> PartEntry+78
```

Chaque champ est un **pointeur lointain déjà résolu** vers le script
réel dans `PROG` — pas l'identifiant brut conservé tel quel. La
résolution se fait **une fois**, au chargement de la mission, pas à
chaque déclenchement de l'événement.

**Point ouvert** : `+62`/`+64`, remis à zéro juste après les 4
`progs_id`, sont des candidats plausibles pour l'état d'exécution
courant (quel script actif, quelle instruction) — distinct de
`entité+285` qu'on avait tracé côté `GOAL`/entité complète. Le lien
exact entre ces deux champs (`PartEntry+62/64` vs `entité+285`)
reste à établir.

## Fonction : `PartEntry_ResetState` (`sub_A9DFD`, `seg457`)

**Rôle** : remet une entrée `PART` à son état de repos initial.

```c
void PartEntry_ResetState(PartEntry *obj)
{
    obj->aspectBits = 255;         // +50
    obj->extraData = 0;               // +58 (dword)
    obj->statusFlags &= ~63;        // +57, efface 6 bits (dont le bit "occupe")
    obj->controller = NULL;            // +82
    obj->completionFlag = 255;         // +84
}
```

## Le chunk `PROG` — chargé comme un bloc brut, pas pré-parsé

*Question de Rémi : comment est parsé le chunk `PROG` (celui que les
4 `progs_id` d'une `PartEntry` référencent) ?*

Réponse, par lecture complète de `ProgBuffer_LoadRawAndCountMarkers`
(`sub_AA31D`, le vrai lecteur confirmé par `DATA_MODEL.md`) :

```c
// ProgBuffer_ResetState (sub_AA2F4)
void ProgBuffer_ResetState(ProgBuffer *buf) {
    buf->markerCount = 0;   // +0
    buf->chunkSize = 0;      // +6
}

// ProgBuffer_ResetAndSetSize (sub_AA307)
void ProgBuffer_ResetAndSetSize(ProgBuffer *buf, uint16_t size) {
    ProgBuffer_ResetState(buf);
    buf->chunkSize = size;   // +6
}

// ProgBuffer_LoadRawAndCountMarkers (sub_AA31D) — LE VRAI LECTEUR
void ProgBuffer_LoadRawAndCountMarkers(ProgBuffer *buf, uint16_t chunkSize,
                                          MissionScenario *scenario)
{
    ProgBuffer_ResetAndSetSize(buf, chunkSize);

    buf->data = AllocateTyped(TAG_0x5C44, chunkSize);   // meme allocateur generique
    ReadFieldGroupA(chunk, buf->data, chunkSize);          // copie BRUTE, sans parsing

    buf->markerCount = 0;
    for (uint16_t i = 0; i < chunkSize; i += 2) {
        if (buf->data[i] == 0) {
            buf->markerCount++;   // compte les octets nuls a positions paires
        }
    }
}
```

**`PROG` n'est pas découpé en instructions à ce stade** — c'est chargé
comme **un seul bloc brut**, avec juste un comptage préliminaire des
octets nuls à positions paires. Le vrai découpage en instructions
(opcode, paramètres, état `[instr+14]`) n'a lieu qu'à l'exécution,
dans `MissionScript_ExecutePROG`.

**Confirmé** (voir section suivante) : ces mots nuls sont bien des
**séparateurs** entre plusieurs mini-programmes empaquetés dans le
même bloc — les 4 `progs_id` d'une `PartEntry` sont des **index
séquentiels** dans cette liste (pas des offsets), résolus par
`Expr_LookupNamedValue`/`ProgBuffer_FindSubProgramByIndex`.

**Structure du conteneur `ProgBuffer`** (confirmée) :

| Offset | Champ |
|---|---|
| `+0` | compteur de marqueurs (word) |
| `+2`/`+4` | pointeur lointain vers le tampon brut |
| `+6` | taille du chunk (word) |

## Comment les `progs_id` retrouvent leur script — le vrai découpage du bloc `PROG`

*Question de Rémi : comment ce bloc brut est-il découpé pour que la
résolution des `progs_id` d'une `PartEntry` fonctionne ?*

Réponse, par lecture complète de la chaîne `Expr_LookupNamedValue` →
`ProgBuffer_FindSubProgramByIndex` :

```c
// Expr_LookupNamedValue (sub_51E4A) — simple garde de bornes
void far *Expr_LookupNamedValue(ProgBuffer *buf, uint16_t rawId)
{
    if (rawId >= buf->markerCount) return NULL;
    return ProgBuffer_FindSubProgramByIndex(buf->data, rawId);
}

// ProgBuffer_FindSubProgramByIndex (sub_50E94) — LE VRAI DECOUPAGE
void far *ProgBuffer_FindSubProgramByIndex(void far *bufferBase, uint16_t index)
{
    uint16_t far *cursor = bufferBase;
    while (index != 0) {
        while (*cursor++ != 0) { /* avance jusqu'au prochain mot nul */ }
        index--;
    }
    return cursor;   // debut du sous-programme #index
}
```

**Le bloc `PROG` est une séquence de mini-programmes consécutifs,
chacun terminé par un mot nul (`0`, 2 octets)** — un format
classique d'enregistrements empaquetés à la suite, avec un séparateur
à taille fixe plutôt qu'un octet. Pour retrouver le script `#N`, on
saute par-dessus les `N` premiers séparateurs depuis le début du bloc.

**Ça confirme et remplace l'hypothèse précédente** ("offset différent
à l'intérieur du bloc") : ce sont bien des **index séquentiels dans la
liste des mini-programmes**, pas des offsets bruts. Le compteur posé
par `ProgBuffer_LoadRawAndCountMarkers` (`+0`) est donc le **nombre
total de mini-programmes empaquetés** dans le bloc `PROG` d'une
mission.

## Ce qui reste ouvert
 (`vtable+136`) — reste non identifiée
  précisément, mais on sait maintenant qu'elle coexiste avec le
  mécanisme `entité+285`/`GOAL=5` plutôt que de le remplacer ; les
  deux chemins convergent vers le nœud `ID=21` (`entité+209`).
- Confirmer `163`, `171`, `177`-`181` par observation empirique.
- Vérifier si **d'autres options du tournoi** (pas seulement `GOAL=5`)
  lisent/écrivent `entité+285` pour d'autres ordres du script
  (`Destroy target`, `Defend target`, etc.) — probable vu le motif
  confirmé sur `Follow Ally`.
- Vérifier l'hypothèse "identifiants `MVRS` = nœuds `Expr_VM`" notée
  plus haut, à la lumière de la découverte du canal `entité+285`.
- Les ~130 cas de plomberie générique du premier switch — hors
  périmètre "ordres de mission" sauf indication contraire.

## Opcodes 144 / 145 / 190 (2026-10-03)

- `144` : activation d'un objet de mission (`PartEntry_ResolveSpawnPositionAndActivate_51EDC`).
- `145` : **désactivation** (`PartEntry_Deactivate_5242A` : bit actif +57 effacé, compteurs
  d'objets actifs par camp décrémentés si le bit 1 de +57 est nul ; relu 2026-10-15 : l'instance est
  **retirée du monde et détruite** par `MissionObject_RemoveInstanceFromWorld_53337` →
  `WorldObjects_RemoveAndDelete_223C5`, sans explosion ni débris). Utilisé 56 fois dans MISSIONS.TRE ; ex. MISN-1A, le C-130
  (PROG 5) se désactive après son atterrissage (`SET_LABEL(52)` puis `145(8)`).
- `190` : **opcode de PROG** transmis à l'instance (slot +136), pas une désactivation. `Expr_VM_Interpreter_51106` vérifie que l'objet est
  actif puis passe par `MissionScript_CallNativeHandler_52513` (entrée 29 de la table : sortie commune)
  jusqu'à `Goal_SetObjective_A307`, cas par défaut : objectif 191, position de repli = la sienne.
  Utilisé 37 fois. libRealSpace l'appelait à tort `OP_DEACTIVATE_OBJ` (corrigé : `OP_SET_OBJ_BE`).

## Opcodes 182 à 185 : bits 4 et 5 de l'objet de mission (+57) (2026-10-03)

- `182` pose le bit 4, `183` l'efface. Bit 4 = **visible sur la carte de navigation** :
  seul lecteur `NavMap_DrawMissionObjects_7EDCA` (ex-`Render_DrawComplexShape`), qui ne trace que les objets
  ayant ce bit (couleur 230 camp ennemi, 199 joueur, 31 sinon). Le chargeur de mission le pose sur le
  joueur. MISN-1A : Stern `182(255)`, C-130 `182(255)` ; les MiG n'apparaissent pas. libRealSpace :
  `on_nav_map` (`OP_SHOW_ON_NAV_MAP` / `OP_HIDE_FROM_NAV_MAP`), lu par `SCNavMap`.
- `184` pose le bit 5, `185` l'efface. Argument 255 = l'objet qui exécute le script.
  Bit 5 = **accompagne le joueur au pilote automatique** : `Autopilot_JumpSequence_7A054` (ex-
  `UIScript_ParseAndEvaluate`) désactive, quand la zone change, tout objet de mission sans ce bit
  (`MissionScenario_QueryFieldWrapper_A7FF0` puis `PartEntry_Deactivate_5242A`). Le chargeur de mission
  le pose sur l'objet du joueur. MISN-1A : Stern `184(255)` et C-130 `184(8)` à l'activation, puis
  C-130 `185(255)` (PROG 5).
- Le chunk `TEAM` correspond presque toujours au joueur + les objets marqués `184`. libRealSpace :
  `friendlies` (initialisé depuis `TEAM`) ; `184` ajoute, `185` retire (`OP_JOIN_PLAYER_TEAM`,
  `OP_LEAVE_PLAYER_TEAM`). Les affichages (radar, carte, radio) bouclent aussi sur `friendlies` ; la
  façon dont le radar de l'original choisit ses contacts n'a pas été lue.

## Opcodes 165 et 166 selon la classe de l'objet (lu 2026-10-15)

`MissionScript_CallNativeHandler_52513` : 165 partage le cas de 164 (`loc_5265A`) : deux SPOT
résolus (`Mission_GetSpotWorldPosition_5305A`), SPOT[1er paramètre] et SPOT[2e paramètre] ; 166 va
directement à la sortie commune (aucune position, aucun objet). Puis slot +136 de l'instance, dont
la valeur de retour devient l'état « en cours » de l'instruction (0 = terminé).

Slot +136 par classe (relevé dans les vtables de seg339, entrée qui suit les dégâts de collision) :

| Classe | +136 | 165 | 166 |
|---|---|---|---|
| avion IA (10172) | `loc_3E419` → `Goal_SetObjective_A307` | objectif 165 : aller au SPOT ; terminé à moins de 500 m à l'horizontale | défaut : objectif 191, errance autour de sa position, jamais terminé |
| GRND (véhicule au sol) | `GroundObj_OnScriptOpcode_453E3` | rouler vers SPOT[1er param.] ; terminé (renvoie 0) à moins de 100 m à l'horizontale | état 166 rangé : le véhicule freine jusqu'à l'arrêt ; renvoie 1 |
| XMIT (émetteur, 21) | `Xmit_OnScriptOpcode_45B76` | rien ; renvoie 1 | rien ; renvoie 1 |
| SWPN | `SwpnInstance_OnOrder_43CBB` | rien ; renvoie 0 | rien ; renvoie 0 |
| autres (missile, bombe, objets…) | `loc_38342` (`xor ax,ax`) | rien ; renvoie 0 | rien ; renvoie 0 |

GRND en route (`GroundObj_Update_45883`, état 165), **par frame, sans dt** : vitesse +0,25 m/s
jusqu'à 12,5 m/s (`GroundObj_AccelerateToCruise_45675`), cap tourné de 1° vers le point
(`GroundObj_SteerTowardPoint_454A6`). Tout autre état : −0,25 m/s par frame jusqu'à l'arrêt
(`GroundObj_Decelerate_45797`). Le déplacement suit la pente du sol (`GroundObj_IntegrateMotion_458C8`).

## Instructions de base du bytecode PROG (lu 2026-10-22)

Lu dans `Expr_VM_Interpreter_51106` (seg114), cas par cas. Outil : `tools/mission_prog.py`
(désassemble un fichier de mission, `--stat` retrouve l'origine des variables de résultat).

**Encodage** (`Expr_VM_ReadNextToken_50F85`) : un octet d'instruction, un octet d'argument n ; si
l'octet suivant vaut 9, il est sauté et l'octet d'après est un 2ᵉ argument. Un programme se termine
par `OP_NOOP` (le n-ième programme du bloc = celui qui suit le n-ième `OP_NOOP`,
`ProgBuffer_FindSubProgramByIndex_50E94`).

**État d'une exécution** : le registre de travail `acc` (`[instr+12]`), le résultat du dernier ordre
natif (`[+14]`), le résultat de la dernière comparaison (`[+22]` : inférieur, égal ou supérieur).
**FLAG[n]** = mots du chunk `FLAG` de la mission (nombre `mission+72`, tableau `mission+74`) ;
lecture hors bornes = 0, écriture hors bornes ignorée. **STAT[n]** = 8 mots à `mission+161`
(n < 8), écrits dans `misn2op.iff` (`Mission_WriteResultReport_A8F22`, GAMEFLOW_SYSTEM.md § 6).

**Noms.** Ceux de l'enum `prog_op` de libRealSpace (`SCenums.h`, fourni le 2026-10-23) ; les
instructions absentes de l'enum ont un nom proposé dans le même style, marqué \*.

| Valeur | Nom | Effet dans le jeu |
|---|---|---|
| 0 | `OP_NOOP` | retour : fin du programme, ou retour d'appel (même code qu'`OP_EXIT_PROG`) |
| 1 | `OP_EXIT_PROG` | retour (même code qu'`OP_NOOP`) |
| 2 | `OP_EXEC_SUB_PROG` | appel du programme n |
| 3 | `OP_EXEC_SUB_PROG_WORK`\* | appel du programme numéro acc |
| 4 | `OP_STOP_SCRIPT`\* | arrêt du script |
| 8 | `OP_SET_LABEL` | étiquette n (cible des sauts) |
| 15 | `OP_SET_EXIT_CODE`\* | code de sortie de la mission = n (chunk `EXIT` de `misn2op.iff`) |
| 16 | `OP_MOVE_VALUE_TO_WORK_REGISTER` | acc = n |
| 17 | `OP_MOVE_FLAG_TO_WORK_REGISTER` | acc = FLAG[n] |
| 18 | `OP_SWAP_WORK_AND_FLAG`\* | échange acc et FLAG[n] |
| 19 | `OP_MOVE_RESULT_TO_WORK`\* | acc = résultat du dernier ordre natif |
| 20 | `OP_SAVE_VALUE_TO_GAMFLOW_REGISTER` | STAT[n] = acc |
| 21 | `OP_RANDOM_TO_WORK`\* | acc = hasard 0..n (`CRT_Rand`) |
| 32 | `OP_ADD_VALUE_TO_WORK`\* | acc += n |
| 33 | `OP_ADD_FLAG_TO_WORK`\* | acc += FLAG[n] |
| 34 | `OP_ADD_VALUE_TO_FLAG`\* | FLAG[n] += n (l'argument lui-même : `add ax, [di+8]`) |
| 35 | `OP_ADD_WORK_REGISTER_TO_FLAG` | FLAG[n] += acc |
| 36 | `OP_SUB_VALUE_FROM_WORK`\* | acc −= n |
| 37 | `OP_SUB_FLAG_FROM_WORK`\* | acc −= FLAG[n] |
| 38 | `OP_SUB_VALUE_FROM_FLAG`\* | FLAG[n] −= n (l'argument lui-même) |
| 39 | `OP_SUB_WORK_FROM_FLAG`\* | FLAG[n] −= acc |
| 40 | `OP_OR_VALUE_WITH_WORK`\* | acc \|= n |
| 41 | `OP_OR_FLAG_WITH_WORK`\* | acc \|= FLAG[n] |
| 42 | `OP_AND_VALUE_WITH_WORK`\* | acc &= n |
| 43 | `OP_AND_FLAG_WITH_WORK`\* | acc &= FLAG[n] |
| 44 | `OP_XOR_VALUE_WITH_WORK`\* | acc ^= n |
| 45 | `OP_XOR_FLAG_WITH_WORK`\* | acc ^= FLAG[n] |
| 46 | `OP_MUL_VALUE_WITH_WORK` | acc ×= n |
| 47 | `OP_MUL_FLAG_WITH_WORK`\* | acc ×= FLAG[n] |
| 48 | `OP_DIV_WORK_BY_VALUE`\* | acc /= n |
| 49 | `OP_DIV_WORK_BY_FLAG`\* | acc /= FLAG[n] |
| 64 | `OP_CMP_WORK_WITH_VALUE` | comparer acc à n |
| 65 | `OP_CMP_VALUE_WITH_WORK` | comparer n à acc |
| 66 | `OP_CMP_WORK_WITH_FLAG`\* | comparer acc à FLAG[n] |
| 67 | `OP_CMP_FLAG_WITH_WORK`\* | comparer FLAG[n] à acc |
| 68 | `OP_CMP_RESULT_WITH_VALUE`\* | comparer le résultat natif à n |
| 69 | `OP_TEST_FLAG` | comparer FLAG[n] à 1 |
| 70 | `OP_GOTO_IF_CURRENT_COMMAND_IN_PROGRESS` | aller à l'étiquette n si le résultat natif ≠ 0 |
| 71 | `OP_GOTO_IF_CURRENT_COMMAND_DONE`\* | aller à l'étiquette n si le résultat natif = 0 |
| 72 | `OP_BRANCH_IF_EQUAL` | aller à l'étiquette n si égal |
| 73 | `OP_BRANCH_IF_NOT_EQUAL` | aller à l'étiquette n si différent |
| 74 | `OP_BRANCH_IF_LESS` | aller à l'étiquette n si inférieur |
| 75 | `OP_BRANCH_IF_GREATER` | aller à l'étiquette n si supérieur |
| 76 | `OP_BRANCH_IF_LESS_EQUAL`\* | aller à l'étiquette n si inférieur ou égal |
| 77 | `OP_BRANCH_IF_GREATER_EQUAL`\* | aller à l'étiquette n si supérieur ou égal |
| 78 | `OP_BRANCH`\* | aller à n |
| 79 | `OP_EXECUTE_CALL` | aller à l'étiquette numéro acc (un **saut**, pas un appel) |
| 80 | `OP_MOVE_WORK_REGISTER_TO_FLAG` | FLAG[n] = acc |
| 81 | `OP_MOVE_RESULT_TO_FLAG`\* | FLAG[n] = résultat natif |
| 82 | `OP_SET_FLAG_TO_TRUE` | FLAG[n] = 1 |
| 83 | `OP_SET_FLAG_TO_FALSE` | FLAG[n] = 0 |
| 84 | `OP_TOGGLE_FLAG`\* | FLAG[n] ^= 1 |
| 85 | `OP_ADD_1_TO_FLAG` | FLAG[n] += 1 |
| 86 | `OP_REMOVE_1_TO_FLAG` | FLAG[n] −= 1 |
| 128 | `OP_ACTIVATE_SCENE` | objet ou scène de mission ; non relu ici |
| 129 | `OP_DEACTIVATE_SCENE` | objet ou scène de mission ; non relu ici |
| 144 | `OP_ACTIVATE_OBJ` | activation de l'objet de mission n (`PartEntry_ResolveSpawnPositionAndActivate_51EDC`, plus haut) |
| 145 | `OP_DEACTIVATE_OBJ` | désactivation de l'objet n (`PartEntry_Deactivate_5242A`, plus haut) |
| 146 | `OP_IF_TARGET_IN_AREA` | objet ou scène de mission ; non relu ici |
| 147 | `OP_IS_TARGET_ALIVE` | objet ou scène de mission ; non relu ici |
| 148 | `OP_INSTANT_DESTROY_TARGET` | objet ou scène de mission ; non relu ici |
| 149 | `OP_DIST_TO_TARGET` | objet ou scène de mission ; non relu ici |
| 151 | `OP_DIST_TO_SPOT` | objet ou scène de mission ; non relu ici |
| 152 | `OP_IS_TARGET_ACTIVE` | objet ou scène de mission ; non relu ici |
| 160 | `OP_SET_WAIT_FOR_SECONDS` | ordre natif (`MissionScript_CallNativeHandler_52513`) ; non relu en détail ici |
| 161 | `OP_SET_OBJ_TAKE_OFF` | ordre natif (`MissionScript_CallNativeHandler_52513`) ; non relu en détail ici |
| 162 | `OP_SET_OBJ_LAND` | ordre natif (`MissionScript_CallNativeHandler_52513`) ; non relu en détail ici |
| 165 | `OP_SET_OBJ_FLY_TO_WP` | aller au SPOT (plus haut, selon la classe) |
| 166 | `OP_SET_OBJ_FLY_TO_AREA` | selon la classe (plus haut) |
| 167 | `OP_SET_OBJ_DESTROY_TARGET` | ordre natif (`MissionScript_CallNativeHandler_52513`) ; non relu en détail ici |
| 168 | `OP_SET_OBJ_DEFEND_TARGET` | ordre natif (`MissionScript_CallNativeHandler_52513`) ; non relu en détail ici |
| 169 | `OP_SET_OBJ_DEFEND_AREA` | ordre natif (`MissionScript_CallNativeHandler_52513`) ; non relu en détail ici |
| 170 | `OP_SET_OBJ_FOLLOW_ALLY` | ordre natif (`MissionScript_CallNativeHandler_52513`) ; non relu en détail ici |
| 171 | `OP_SET_MESSAGE` | message radio n (`Radio_PlayMessage_CB45` pour un avion IA) |
| 182 | `OP_SHOW_ON_NAV_MAP` | pose le bit « visible sur la carte de navigation » (plus haut) |
| 183 | `OP_HIDE_FROM_NAV_MAP` | efface ce bit (plus haut) |
| 184 | `OP_JOIN_PLAYER_TEAM` | pose le bit « accompagne le joueur » (plus haut) |
| 185 | `OP_LEAVE_PLAYER_TEAM` | efface ce bit (plus haut) |
| 190 | `OP_PACIFY_TARGET` | ordre transmis à l'objet, objectif par défaut (plus haut) |
| 191 | `OP_SET_OBJ_PATROL_POSITION` | ordre natif (`MissionScript_CallNativeHandler_52513`) ; non relu en détail ici |
| 208 | `OP_SELECT_FLAG_208` | non lu ici |

- Les sauts cherchent l'étiquette **en avant** depuis l'instruction courante
  (`Expr_VM_FindCaseToken_50FDB`).
- Les valeurs absentes de la table de sauts du jeu (5–7, 9–14, 22–31, 50–63, 87–127…) ne font rien.
  51, 53, 56, 105 et 117 apparaissent pourtant dans des fichiers de mission (moins de 7 fois
  chacune).
- Les instructions qui écrivent FLAG : `OP_SWAP_WORK_AND_FLAG`, `OP_ADD_VALUE_TO_FLAG`,
  `OP_ADD_WORK_REGISTER_TO_FLAG`, `OP_SUB_VALUE_FROM_FLAG`, `OP_SUB_WORK_FROM_FLAG`, et de
  `OP_MOVE_WORK_REGISTER_TO_FLAG` à `OP_REMOVE_1_TO_FLAG`. Le chargeur de mission remplit le tableau
  depuis le chunk `FLAG` (`MissionScenario_LoadMainRecord_A8331`). Je n'ai pas trouvé d'autre
  écriture dans ce tableau (recherche : accès à `+72` / `+74` après une lecture de `word_706A0`,
  dans tous les segments annotés).
- `OP_SET_MESSAGE` (message radio n) passe n à la méthode +136 de l'objet (`Goal_SetObjective_A307` →
  `Radio_PlayMessage_CB45` pour un avion IA). Il n'écrit pas FLAG.

**Exemple, MISN-9A** : chaque ABRAMS-G détruit ajoute 2 à FLAG[4] (programme 11, deux
`OP_ADD_1_TO_FLAG`), chaque ZSU-23 ajoute 1 (programme 12) ; les deux appellent le programme 2
(`OP_EXEC_SUB_PROG`), qui fait `OP_ADD_1_TO_FLAG 3` une fois FLAG[4] ≥ 4. Le programme 4 (mise à jour
de la scène 0) recopie le tout dans les variables de résultat : STAT[0] = FLAG[2] (le BRIGC10
détruit), STAT[1] = (20 + FLAG[4]) × FLAG[2] × 100, STAT[2] = FLAG[3], STAT[7] = FLAG[6].

## Comparaison avec l'enum `prog_op` de libRealSpace (`SCenums.h`, fourni le 2026-10-23)

Seuls les noms et les valeurs de l'enum ont été vus, pas l'interpréteur de libRealSpace : « absent
de l'enum » ne dit pas comment libRealSpace traite l'instruction.

**Instructions des fichiers de mission absentes de l'enum** (comptées dans les 72 fichiers de
`MISSIONS`) :

| Instruction | Emplois | Fichiers (exemples) |
|---|---|---|
| `OP_ADD_FLAG_TO_WORK`\* | 24 | 21 fichiers, dont MISN-10A, 10B, 10X |
| `OP_MUL_FLAG_WITH_WORK`\* | 18 | 18 fichiers, dont MISN-10A, 10B, 10X, 11A |
| `OP_SUB_VALUE_FROM_WORK`\* | 11 | 10 fichiers, dont MISN-10A, 11B, 11X, 4B |
| `OP_SET_EXIT_CODE`\* | 2 | MISN-14B, 15A |
| `OP_BRANCH`\* | 3 | MISN-13B, 6D |
| `OP_SUB_FLAG_FROM_WORK`\* | 2 | MISN-6D, 7A |
| `OP_AND_FLAG_WITH_WORK`\* | 1 | MISN-15A |
| `OP_RANDOM_TO_WORK`\* | 1 | MISN-15A |
| `OP_ADD_VALUE_TO_WORK`\* | 1 | MISN-5C |
| `OP_SUB_WORK_FROM_FLAG`\* | 1 | TEMPLATE |
| `OP_CMP_WORK_WITH_FLAG`\* | 1 | LAND |
| valeur 51 (sans effet dans le jeu) | 2 | MISSION |
| valeur 53 (sans effet dans le jeu) | 6 | BASIC |
| valeur 56 (sans effet dans le jeu) | 6 | BASIC |
| valeur 105 (sans effet dans le jeu) | 1 | MISSION |
| valeur 117 (sans effet dans le jeu) | 1 | MISSION |
| ordre natif 153 (non lu en détail) | 6 | GAUNTLET |
| ordre natif 163 (non lu en détail) | 6 | BASIC |
| ordre natif 164 (non lu en détail) | 16 | ARENAMIS, GAME |
| ordre natif 172 (non lu en détail) | 2 | MISN-6D |
| ordre natif 177 (non lu en détail) | 1 | MISN-6X |
| ordre natif 178 (non lu en détail) | 2 | MISN-10D, 6X |
| ordre natif 179 (non lu en détail) | 1 | BASIC |
| ordre natif 181 (non lu en détail) | 3 | MISN-1A, 1B, 1C |

Les trois premières servent surtout à **calculer le gain** (2ᵉ valeur de `STAT`) dans le programme
de fin de mission. Exemple, MISN-10A : gain = (15 + FLAG[0] − 9 + FLAG[1]) × FLAG[4] × 100, écrit

```
OP_MOVE_VALUE_TO_WORK_REGISTER 15
OP_ADD_FLAG_TO_WORK 0
OP_SUB_VALUE_FROM_WORK 9
OP_ADD_FLAG_TO_WORK 1
OP_MUL_FLAG_WITH_WORK 4
OP_MUL_VALUE_WITH_WORK 100
OP_SAVE_VALUE_TO_GAMFLOW_REGISTER 1
```

Si l'une d'elles est ignorée, le gain renvoyé au déroulement est faux. Dans MISN-15A, la 1ʳᵉ valeur (succès) est calculée
avec `OP_AND_FLAG_WITH_WORK`.

**Noms de l'enum à rapprocher du jeu :**

- `OP_NOOP` : dans le jeu, c'est le **retour** (même code qu'`OP_EXIT_PROG`), et il sépare les
  programmes du chunk `PROG`.
- `OP_SPOT_DATA` : dans le jeu, ce n'est pas une instruction ; c'est la marque d'un 2ᵉ argument, lue
  avec l'instruction qui la précède (`Expr_VM_ReadNextToken_50F85`).
- `OP_EXECUTE_CALL` : dans le jeu, c'est un **saut** vers l'étiquette dont le numéro est acc, pas un
  appel (`Expr_VM_FindCaseToken_50FDB`, sans retour). Les appels de programme sont
  `OP_EXEC_SUB_PROG` et `OP_EXEC_SUB_PROG_WORK`\* (absent de l'enum et des données).
- `OP_TEST_FLAG` compare FLAG[n] à 1 ; `OP_GOTO_IF_CURRENT_COMMAND_IN_PROGRESS` saute si le résultat
  du dernier ordre natif ≠ 0 : conformes.
