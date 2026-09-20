# Spécification d'implémentation — le moteur d'IA de Strike Commander
dans libRealSpace

*Chaque fonction ci-dessous est une méthode réelle de `SCMissionActors`,
`SCMission`, `SCPilot` ou `RSProf`. Les algorithmes proviennent de la
rétro-ingénierie du binaire d'origine (`AI_SYSTEM.md`, référencé pour
qui veut retracer une formule jusqu'à sa source) — cette spécification
ne documente que ce qu'il faut écrire, pas l'état antérieur du code.*

---

## 0. Architecture — deux événements, deux fréquences

```mermaid
flowchart TD
    subgraph Frame["Chaque frame"]
        U["SCMission::update()"] -->|publie| MU["MissionUpdateEvent"]
        MU --> OMU["SCMissionActors::onMissionUpdate<br/>(override_progs, current_command,<br/>sequences de manoeuvre, pilot->FlyTo)"]
    end
    subgraph Throttle["Toutes les 1/25s (cadence de decision d'origine)"]
        U -->|accumulateur| AIR["AIRefreshEvent"]
        AIR --> OAR["SCMissionActors::onAIRefresh<br/>GOAL 3/4/5 + tournoi MVRS"]
    end
    OAR -.->|pose pilot->target_climb/<br/>target_speed/target_azimut| SP["SCPilot"]
    OMU -.->|consomme| SP
```

`onMissionUpdate` reste la cascade de priorité pour `GOAL` sélecteur
`2` (exécution de mission). `onAIRefresh` s'ajoute pour les
sélecteurs `3`/`4`/`5`, à la cadence de décision d'origine (~25 Hz)
plutôt que sur le framerate réel du port — sans ce throttle, un port
tournant à un framerate supérieur à 25 fps ferait tourner le tournoi
`MVRS` plus souvent que dans le binaire d'origine, donc plus de
tirages aléatoires par seconde réelle et une IA statistiquement plus
forte/réactive qu'à l'origine (défaut relevé dans `AI_SYSTEM.md` §6).

---

## 1. Chargement des données — `RSProf`

### 1.1 Hiérarchie des chunks

```
FORM "PROF"
├── VERS                       → parsePROF_VERS
├── FORM "RADI"                → parsePROF_RADI
│   ├── INFO/SPCH/OPTS/MSGS
│   └── ASKS                   → profil JOUEUR uniquement
└── FORM "_AI_"                → parsePROF__AI_
    ├── "AI\0_" → isAI=true, MVRS, GOAL, ATRB
```

### 1.2 `parsePROF__AI_MVRS`

```cpp
struct AI_STATE {
    uint8_t node_id;
    int8_t  value;
};

void RSProf::parsePROF__AI_MVRS(uint8_t *data, size_t size) {
    ByteStream stream;
    if (data == nullptr) { return; }
    stream.Set(data, size);
    while (stream.GetPosition() < data + size) {
        uint8_t id = stream.ReadByte();
        int8_t  value = (int8_t) stream.ReadByte();
        this->ai.mvrs.push_back(AI_STATE{id, value});
    }
}
```

### 1.3 `parsePROF__AI_ATRB`

```cpp
void RSProf::parsePROF__AI_ATRB(uint8_t *data, size_t size) {
    ByteStream stream;
    if (data == nullptr) { return; }
    if (size == 1) {
        this->ai.atrb.TH = 8;  this->ai.atrb.CN = 8;  this->ai.atrb.VB = 8;
        this->ai.atrb.LY = 8;  this->ai.atrb.FL = 10; this->ai.atrb.AG = 10;
        this->ai.atrb.AA = 10; this->ai.atrb.SM = 8;  this->ai.atrb.AR = 8;
        return;
    }
    stream.Set(data, size);
    this->ai.atrb.TH = stream.ReadByte(); this->ai.atrb.CN = stream.ReadByte();
    this->ai.atrb.VB = stream.ReadByte(); this->ai.atrb.LY = stream.ReadByte();
    this->ai.atrb.FL = stream.ReadByte(); this->ai.atrb.AG = stream.ReadByte();
    this->ai.atrb.AA = stream.ReadByte(); this->ai.atrb.SM = stream.ReadByte();
    this->ai.atrb.AR = stream.ReadByte();
}
```

### 1.4 `NUMS` — fichier compagnon (`INTEL.IFF`), sur `SCMission`

```cpp
struct NUMSConstants {
    float unusedA, unusedB;
    Vec3 formationOffset;
    Vec3 secondaryOffset;
    float distanceThreshold1800;
    float distanceThreshold15_625;
    float distanceThreshold175;     // seuil de detection (§3.2)
    float distanceThreshold7;
    float distanceThreshold69;      // sequence Scissors/Rollaway (§4)
    float distanceThresholdPriority;
    float distanceThreshold97;      // sequence Immelmann/Split S (§4)
    float baseSpeedReference;
};
NUMSConstants nums;

void SCMission::loadNums(uint8_t *data, size_t size) {
    IFFSaxLexer lexer;
    std::unordered_map<std::string, std::function<void(uint8_t*, size_t)>> handlers;
    handlers["INTL"] = [this](uint8_t *d, size_t s) {
        ByteStream stream; stream.Set(d, s);
        auto readFixed = [&]() { return (int32_t)stream.ReadLong() / 256.0f; };
        this->nums.unusedA = readFixed();
        this->nums.unusedB = (float)(int16_t)stream.ReadShort() / 256.0f;
        stream.ReadShort();
        this->nums.formationOffset = { readFixed(), readFixed(), readFixed() };
        this->nums.secondaryOffset = { readFixed(), readFixed(), readFixed() };
        this->nums.distanceThreshold1800     = readFixed();
        this->nums.distanceThreshold15_625   = readFixed();
        this->nums.distanceThreshold175      = readFixed();
        this->nums.distanceThreshold7        = readFixed();
        this->nums.distanceThreshold69       = readFixed();
        this->nums.distanceThresholdPriority = readFixed();
        this->nums.distanceThreshold97       = readFixed();
        this->nums.baseSpeedReference        = readFixed();
    };
    lexer.InitFromRAM(data, size, handlers);
}
```

### 1.5 `ATRB` — deux copies distinctes sur l'entité, pas une

*Correction majeure suite à une session de vérification approfondie
(`AI_SYSTEM.md` §6ter).* Il existe **deux copies séparées** d'`ATRB`
sur l'entité IA :

1. **Copie de réglage/chargement** (`entité+0x96` à `+0x9E`) — le
   tampon direct issu du fichier.
2. **Copie de consommation directe** (`entité+0xB0` à `+0xB8`) —
   celle que la logique de décision lit réellement, via une famille
   de fonctions de jet de compétence (jet aléatoire 1-16 comparé à
   `stat + modificateur`) :

```cpp
bool SCMissionActors::skillCheck(uint8_t statValue, int modifier) {
    int roll = (std::rand() % 16) + 1;
    return roll <= (int)statValue + modifier;
}
```

| Offset | Trait `ATRB` | Confirmé par |
|---|---|---|
| `+0xB0` | `TH` | jet de compétence, consulté par le tournoi |
| `+0xB1` | `CN` | jet de compétence |
| `+0xB2` | `VB` | `canPlayRadioMessage` (§5.2) |
| `+0xB3` | `LY` | sélection de registre de message contextuel |
| `+0xB4` | `FL` | condition de branche (`> 14`) dans le dispatcheur de message |
| `+0xB5` | `AG` | jet de compétence |
| `+0xB6` | `AA` | comparaison par division, appelée depuis le tournoi lui-même |
| `+0xB7` | `SM` | jet de compétence |
| `+0xB8` | `AR` | jet de compétence |

### 1.6 Remise à l'échelle de `FL`/`AG`/`AA` par la difficulté

Concerne uniquement la copie de réglage, distincte de la copie de
consommation directe ci-dessus :

```cpp
int difficulty_level{0};

void RescaleSkillByDifficulty(RSProf &profile, int difficultyLevel) {
    profile.ai.atrb.FL = (uint8_t)(profile.ai.atrb.FL >> difficultyLevel);
    profile.ai.atrb.AG = (uint8_t)(profile.ai.atrb.AG >> difficultyLevel);
    profile.ai.atrb.AA = (uint8_t)(profile.ai.atrb.AA >> difficultyLevel);
}
```

---

## 2. L'événement `AIRefresh`

### 2.1 Événement

```cpp
class AIRefreshEvent : public EventMessage {
public:
    SCMission *mission{nullptr};
};
```

### 2.2 `SCMission` — accumulateur

```cpp
float ai_refresh_accumulator{0.0f};
// Le jeu d'origine tourne le tournoi MVRS sans aucun throttling (AI_SYSTEM.md
// §6) : le rythme de décision de l'IA scale directement avec le framerate,
// qui visait ~25 fps sur le binaire DOS d'origine (meme reference que la
// caméra, cf. CAMERA_SYSTEM.md/DATA_MODEL.md). Ce n'est PAS un choix de
// stabilite arbitraire pour le port : sur un port qui tourne a un framerate
// different (souvent bien superieur a 25), laisser le tournoi tourner a
// chaque frame rendrait l'IA statistiquement plus forte/plus reactive
// qu'a l'origine (plus de tirages aleatoires par seconde reelle). Ce
// throttle remet explicitement l'IA a la cadence de decision d'origine.
static constexpr float AI_REFRESH_INTERVAL = 1.0f / 25.0f;

float dt = this->tps > 0 ? 1.0f / (float)this->tps : 1.0f / 30.0f;
this->ai_refresh_accumulator += dt;
if (this->ai_refresh_accumulator >= AI_REFRESH_INTERVAL) {
    this->ai_refresh_accumulator -= AI_REFRESH_INTERVAL;
    AIRefreshEvent ai_refresh_event;
    ai_refresh_event.mission = this;
    this->messageBus.publish(std::make_unique<AIRefreshEvent>(ai_refresh_event));
}
```

### 2.3 `SCMissionActors` — déclarations

**L'`enum` des identifiants `MVRS` a été entièrement revérifié** —
une session précédente contenait un décalage systématique sur
presque toutes les valeurs. Chaque identifiant a été confirmé par
lecture complète de sa fonction de score :

```cpp
enum class GoalSelector : uint8_t {
    Empty                = 1,
    ExecuteAction        = 2,
    WanderRandom         = 3,
    BehaviorStateMachine = 4,
    ActiveWingman        = 5,
};

enum class MVRSInstinct : uint8_t {
    None                   = 0,
    PursuitBase            = 1,  // angulaire complet, gagnant applique aussi GeometricUtility
    PursuitAlwaysTen       = 2,  // score toujours 10, application = rupture directionnelle
    PursuitSimple          = 3,  // angulaire simplifie, ajustement TH
    PursuitExtended        = 4,  // angulaire etendu, application = solution d'interception
    PursuitImmelmannSplitS = 5,  // declenche la sequence acrobatique a 8 phases
    PursuitSensorGated     = 6,  // garde de portee, sous-mode et sequence propres
    PursuitSkillGatedTH    = 7,  // garde flags_75 bit6 / TH, ecrit position d'interception
    // 8,9,10,11,12 : score nul dans le seul chemin de code lu a ce jour.
    // NE PAS traiter comme des coquilles vides / non implementes : la
    // recherche de leur vrai consommateur est incomplete, pas fermee
    // (voir AI_SYSTEM.md §3.7/§3.8, correction explicite suite a
    // desaccord de Remi). ID=21 ci-dessous a le meme profil (score nul
    // en tournoi) et s'est revele avoir un role reel confirme hors
    // tournoi (§4bis) : 8-12 doivent etre implementes des que leur role
    // reel est retrouve, pas laisses de cote sur la base du score seul.
    Unresolved8            = 8,
    Unresolved9            = 9,
    Unresolved10           = 10,
    Unresolved11           = 11,
    Unresolved12           = 12,
    ScissorsRollaway       = 13, // declenche la sequence acrobatique a 5 phases
    Intercept              = 14, // calcul trigonometrique complet, binaire 0/10
    ThreatSensor           = 15, // binaire 0/10
    ThGateBinary           = 16, // CORRIGE : binaire 0/1 sur TH<12 uniquement
    WeaponReady            = 19,
    GeometricUtility       = 20, // score nul en tournoi ; outil geometrique reel hors-tournoi (§3.6)
    NavCommandCarrier      = 21, // score nul en tournoi ; porteur reel de commande de navigation
                                  // hors-tournoi, consomme par AI_NavSolutionToPoint (AI_SYSTEM.md §4bis)
                                  // — anciennement nomme "Trivial", correction suite a cette decouverte
};

virtual bool tryActiveWingman();
virtual bool tryWanderRandom();
virtual void runMVRSTournament();

void onAIRefresh(const AIRefreshEvent &event);
void executeFireControlSolution();
void armWeaponEngagement();
int  selectBestWeapon();
int  weaponEffectiveRange(int hpt_id);
bool targetDetectedBySensor();
bool interceptTrajectoryFeasible();
float computeSensorSecondaryAngle();
void applyBreakDirection();
void applyPursuitTracking();
void applyGeometricUtility();
int  weaponFiringConeAngle(int hpt_id);
void tickManeuverSequence(float dt);
int  computeMVRSScore(MVRSInstinct id);
int  scoreAngularFamily(MVRSInstinct id);
int  scoreWeaponReady();
bool skillCheck(uint8_t statValue, int modifier);
void applyMVRSInstinct(MVRSInstinct id);

MVRSInstinct mvrs_current_winner{MVRSInstinct::None};
float mvrs_maneuver_timer{0.0f};
int mvrs_maneuver_phase{0};
bool mvrs_break_right{false};
bool threat_modulator_active{false};
bool weapon_task_busy{false};
SCMissionActors *weapon_engagement_target{nullptr};
float weapon_engagement_timer{0.0f};
```

### 2.4 `SCMissionActors::onEvent`

```cpp
void SCMissionActors::onEvent(const EventMessage &event) {
    if (auto eventData = dynamic_cast<const MissionEventActorHit*>(&event)) {
        this->onGettingHit(*eventData);
        return;
    }
    if (auto eventData = dynamic_cast<const MissionUpdateEvent*>(&event)) {
        this->onMissionUpdate(*eventData);
        return;
    }
    if (auto eventData = dynamic_cast<const AIRefreshEvent*>(&event)) {
        this->onAIRefresh(*eventData);
        return;
    }
}
```

### 2.5 `SCMissionActors::onAIRefresh`

*Note (2026-09-19) : ce pseudocode ne reflète pas l'ordre réel d'`AI_TopLevelThink` (réactions prioritaires, objet en cours, contournement au sol) — voir §2.9 et `AI_SYSTEM.md` §4.2.*

```cpp
void SCMissionActors::onAIRefresh(const AIRefreshEvent &event) {
    if (!this->is_active || this->is_destroyed) return;
    if (this->profile == nullptr || !this->profile->ai.isAI) return;
    if (this->plane == nullptr || this->pilot == nullptr) return;

    for (uint8_t rawSel : this->profile->ai.goal) {
        GoalSelector sel = (GoalSelector)rawSel;
        switch (sel) {
            case GoalSelector::ActiveWingman:
                if (this->tryActiveWingman()) return;
                break;
            case GoalSelector::WanderRandom:
                if (this->override_progs.empty() && this->on_update.empty()) {
                    if (this->tryWanderRandom()) return;
                }
                break;
            case GoalSelector::BehaviorStateMachine:
                this->runMVRSTournament();
                return;
            default:
                break;
        }
    }
}
```

### 2.6 `SCMissionActors::tryActiveWingman`

```cpp
bool SCMissionActors::tryActiveWingman() {
    if (this->mission->player == nullptr) return false;
    bool escortingPlayer = (this->current_target != 0
                            && this->target == this->mission->player);
    if (escortingPlayer) {
        this->override_progs.clear();
        this->override_progs.push_back({prog_op::OP_SET_OBJ_FOLLOW_ALLY,
                                         this->mission->player->actor_id});
        return true;
    }
    return false;
}
```

### 2.7 `SCMissionActors::tryWanderRandom`

```cpp
bool SCMissionActors::tryWanderRandom() {
    if (this->current_target != 0) return false;
    Vector3D wander;
    wander.x = this->plane->x + (float)(std::rand() % 20000 - 10000);
    wander.y = this->plane->y;
    wander.z = this->plane->z + (float)(std::rand() % 20000 - 10000);
    this->pilot->SetTargetWaypoint(wander);
    this->pilot->target_speed = -10;
    return true;
}
```

*Note (implémentation réelle, libRealSpace, 2026-09-13) : la version
effectivement livrée tire un `SPOT` existant de la mission au hasard
(`std::rand() % spots.size()`) et le pose via le mécanisme
`current_command`/`flyToWaypoint` déjà existant, plutôt qu'un point 3D
calculé à la volée — voir §2.8 ci-dessous pour le contexte plus large sur
comment `current_command` s'articule avec la boucle `GOAL`.*

**Lecture de `Goal_WanderRandom` (2026-09-20).**
1. Si l'objet en cours de l'entité IA existe, elle lui délègue (`vtable+0xC`) et renvoie vrai. Sa garde n'est donc **pas** « une cible d'attaque est engagée » mais « un objet est en cours » (nature encore inconnue).
2. Sinon elle tire deux valeurs `rand() % 20000 − 10000`, les prend comme direction horizontale, **normalise** ce vecteur et le multiplie par **30 000** : le point est à 30 000 unités dans une direction aléatoire (et non à ±10 000 comme dans l'exemple ci-dessus).
3. Altitude : celle du terrain sous le point, plus l'altitude de croisière lue dans l'entité (constante issue de `NUMS`), moins l'altitude actuelle, bornée à ±1000, ajoutée à la position courante.
4. Elle écrit le point (position visée) et la vitesse voulue (direction × vitesse de croisière `NUMS`) dans le bloc d'état commun au joueur et à l'IA, ainsi que dans les coordonnées de point de mission de l'entité, puis applique le nœud d'exécution du contrôleur (celui du chemin `ExecuteFlightCommand`) et renvoie vrai.
5. Un test sur deux octets de l'état (`+0x1A` nul et code `0x15` en `+0x19`) peut sauter la génération du point : rôle non lu.
6. Appelée par `Goal_ExecuteAction` (cas « aucun ordre ») et par `Formation_DamageReactionHandler`.

**Écart avec libRealSpace** : la version livrée tire un `SPOT` de la mission et non un point à 30 000 unités. Sa garde est `current_target != NO_TARGET` (cible de mission engagée).

**Correction du 2026-09-20 : `current_target` utilise `NO_TARGET = -1`.** Le joueur a l'identifiant 0. Avec 0 comme « pas de cible », un acteur ayant pour ordre de détruire le joueur gardait `current_target = 0` : la garde de `tryWanderRandom` ne le retenait pas, `tryWanderRandom` écrasait `current_command` et le waypoint posé par `destroyTarget`, et l'avion s'éloignait au lieu de combattre. Le sentinelle `-1` (constante `SCMissionActors::NO_TARGET`) corrige cela ; le combat contre le joueur est validé en jeu.

### 2.8 `SCMissionActors::executeGoalAction` (`GOAL_EXECUTE_ACTION`) —
navigation vs combat, un point encore ouvert

**Implémentation réelle, retenue après discussion avec Rémi (2026-09-13)** —
diffère de l'esprit du pseudo-code `onAIRefresh` ci-dessus (§2.5), qui
laissait `runMVRSTournament()` s'exécuter dès que le sélecteur `4` est
atteint. En pratique, `executeGoalAction()` (le sélecteur `2`,
`GOAL_EXECUTE_ACTION`) retraduit `current_command` en appel de méthode —
mais son retour n'est **pas** un simple `current_command != OP_NOOP` :

```cpp
bool SCMissionActors::executeGoalAction() {
    this->protectSelf();
    switch (this->current_command) {
        case OP_SET_WAIT_FOR_SECONDS:
        case OP_SET_OBJ_TAKE_OFF:
        case OP_SET_OBJ_LAND:
        case OP_SET_OBJ_FLY_TO_WP:
        case OP_SET_OBJ_FLY_TO_AREA:
        case OP_SET_OBJ_FOLLOW_ALLY:
            /* exécute la méthode correspondante, met à jour
               current_command_executed */
            return true;   // objectif de navigation pure : gagne le tick
        case OP_SET_OBJ_DESTROY_TARGET:
        case OP_SET_OBJ_DEFEND_TARGET:
        case OP_SET_OBJ_DEFEND_AREA:
            /* exécute quand même la méthode (l'avion continue de
               s'approcher/tirer sur la cible) */
            return false;  // objectif de combat : NE gagne PAS le tick
        default:
            return false;  // rien à faire
    }
}
```

**Pourquoi ce découpage** : `runGoalSelectors()` (§4bis de `AI_SYSTEM.md`
pour l'équivalent ASM, `AI_TopLevelThink`) s'arrête au premier sélecteur
qui « gagne » le tick. Dans **tous** les fichiers `PROF` échantillons
(Billy `[5,2,1,4,3]`, Hammer `[2,1,4,3]`, Gwen, cargo), le sélecteur `2`
précède toujours `4`. Si `2` gagnait le tick pour n'importe quel
`current_command` non vide (y compris `DESTROY_TARGET`, qui peut rester
actif très longtemps — tant que la cible n'est pas détruite), le tournoi
`MVRS` (sélecteur `4`) ne tournerait **jamais** en combat, exactement le
moment où il doit prendre la main pour la manœuvre tactique. En excluant
les trois objectifs de combat du « gain de tick » (tout en continuant à
les exécuter), `4` reste atteignable dans le même passage dès qu'il sera
câblé.

**Statut : hypothèse de travail, pas une certitude ASM.** `AI_SYSTEM.md`
§4.4 (`Goal_ActiveWingmanEngagement`, sélecteur `5`) montre qu'au moins un
sélecteur délègue lui-même à `AI_BehaviorStateMachine` en interne, en fin
de son propre traitement — ce qui suggère que l'articulation réelle entre
`Goal_ExecuteAction` et le tournoi `MVRS` n'est peut-être pas une simple
exclusion mutuelle au niveau de la boucle `GOAL`, mais une délégation
interne à certains native handlers. **À reconfirmer en ASM lors de la
session dédiée au tournoi `MVRS`** (§3 ci-dessous) avant de considérer ce
découpage comme définitif.

### 2.9 Ce que l'ASM fait autour de la boucle `GOAL` (non encore reproduit)

Source : `AI_SYSTEM.md` §4.2 corrigé, `AI_TICK_CALL_GRAPH.md` (citations). Ordre
réel de la décision IA, à chaque tick de l'entité :

1. **Réactions prioritaires** (menace, escorte, dégâts) : si l'une réagit, on
   s'arrête là — c'est le « protect self » qui passe avant « obey order ».
2. **Objet en cours** (`entité+0x0D`, nature inconnue) : s'il existe, il passe
   avant le tournoi et avant les objectifs.
3. **Avion au sol : `Goal_ExecuteAction` direct**, quel que soit le tableau
   `GOAL`. Avion en vol : parcours des emplacements du fichier.

Écarts actuels de libRealSpace par rapport à cet ordre :

| Règle ASM | État dans `runGoalSelectors()` |
|---|---|
| Au sol, `Goal_ExecuteAction` tourne sans consulter `GOAL` | **implémenté** (2026-09-19) : `runGoalSelectors()` appelle `executeGoalAction()` en tête si `plane->on_ground`, ce qui fait décoller un acteur dont `GOAL` ne contient que 1 |
| La valeur `1` n'occupe aucun emplacement | traitée comme `GOAL_EMPTY` et ignorée à la lecture de la boucle : équivalent, mais l'acteur reste un acteur « à `GOAL` » |
| Réactions prioritaires avant les objectifs | **absent** ; `protectSelf()` est un palliatif appelé dans `executeGoalAction()`, donc lié au sélecteur `2` |
| Objet en cours (`entité+0x0D`) avant `GOAL` | **absent**, nature de l'objet non établie |
| Gestionnaires appelés avec `(entité, 0)` | sans objet ici |

Le contournement au sol est reproduit : si `plane->on_ground`,
`runGoalSelectors()` appelle `executeGoalAction()` avant de parcourir
`profile->ai.goal`.

---

### 2.10 L'état du cerveau (`SCAIBrain`) — carte des champs de l'entité IA

L'acteur (`SCMissionActors`) joue le rôle du nœud du monde, le cerveau (`SCAIBrain`) celui de l'entité IA de l'original (le nœud du monde pointe vers elle). Ce tableau recense ce que l'entité IA porte, avec ce qui est établi. **Seuls les champs « connu » sont candidats à la déclaration dans `SCAIBrain.h`.** Les autres restent ici tant que leur rôle n'est pas lu.

Colonnes : **statut** = connu (lu dans l'ASM), partiel, inconnu ; **`SCAIBrain`** = déjà déclaré, à déclarer, ou non ; **équivalent** = ce que libRealSpace a déjà.

**Cibles et menaces**

| Champ (offset) | Rôle | Statut | `SCAIBrain` | Équivalent libRealSpace |
|---|---|---|---|---|
| cible aérienne (`+0x287`) | cible de combat normale : tir, poursuite, tournoi | connu | `air_target` (déclaré) | `SCMissionActors::target` (mélangé) |
| cible sol (`+0x283`) | cible traitée par le nœud permanent d'attaque au sol | connu | `ground_target` (déclaré) | — |
| missile qui me vise (`+0x281`) | menace missile désignée par le ciblage | connu | `missile_threat` (déclaré) | `weapon_shooted_at_me` |
| état de menace (`+0x27F`, 0 à 2) | 2 = un missile gagne le ciblage ce tick ; le rôle de 1 est inconnu | partiel | `threat_state` (déclaré) | — |
| référence de bonus A (`+0x285`) | donne A +10, aptitude +5 au candidat désigné ; écrivain inconnu | inconnu | non | — |
| référence de bonus B (`+0x289`) | donne aptitude +3, B +5 ; écrivain inconnu | inconnu | non | — |
| cible de mission (`+0x137`) | cible des ordres détruire / défendre posée par le script | connu | non (reste à l'acteur) | `current_target`, `target` |
| référence allié (`+0x145`) | allié suivi (`Goal_FollowAllyExec`) | connu | à déclarer plus tard | — |
| références faibles (`+0x10F`, `+0x147`) | rôle non établi | inconnu | non | — |

**Objectif et exécution**

| Champ (offset) | Rôle | Statut | `SCAIBrain` | Équivalent |
|---|---|---|---|---|
| objectif courant (`+0x11D`) | code d'état posé par `Goal_SetObjective_A307` | connu | à déclarer plus tard | `current_command` (acteur) |
| coordonnées de point de mission (`+0x11F`, `+0x12B`) | point cible, partagé script / `GOAL` | connu | à déclarer plus tard | `current_command_arg` (partiel) |
| objectif exécuté | inexistant identifié dans l'original | — | non | `current_command_executed` (propre à libRealSpace) |
| objet en cours (`+0x0D`) | référence notifiable ; sa nature est inconnue | inconnu | non | — |
| nœud permanent (`+0xD9`) | appliqué directement quand une cible sol est posée sans cible aérienne ; rôle non lu | partiel | non | — |
| nœuds spéciaux (`+0xC1` ID 20, `+0xD1` ID 21) | nœuds `MVRS` réutilisés hors tournoi | connu | non | — |

**Tir et poursuite** (lus dans `AI_BehaviorSelector_8D30`)

| Champ (offset) | Rôle | Statut | `SCAIBrain` | Équivalent |
|---|---|---|---|---|
| longueur de rafale restante (`+0x280`) | décrémentée à chaque tick de rafale | connu | à déclarer plus tard | — |
| état de tir (`+0x10D`, valeur `0x800`) | mémorise qu'une rafale est en cours | partiel | non | — |
| résultats de manœuvre (`+0x1A0`, `+0x1A2`) | sorties de `AI_ComputeFireSolutionQuality_91DF` et de `AI_SelectWeaponMask_9665` | partiel | non | — |
| drapeaux d'état (`+0x28B`, `+0x28D`) | bit 0x02 posé par le contrôle de tir ; bit 3 escorte ; bit 7 comportement déclenché ; `+0x28D` bit 0x08 effacé au début du ciblage | partiel | non | — |

**Traits, listes et minuteurs**

| Champ (offset) | Rôle | Statut | `SCAIBrain` | Équivalent |
|---|---|---|---|---|
| traits `ATRB` (`+0xB0` à `+0xB8`, copie de consommation) | `TH`, `CN`, `VB`, `LY`, `FL`, `AG`, `AA`, `SM`, `AR` | connu | non (lus par `owner->profile`) | `profile->ai.atrb` |
| tableau `GOAL` (`+0x1B0`, 8 octets par emplacement) | sélecteurs du profil | connu | non (lus par `owner->profile`) | `profile->ai.goal` |
| nœuds `MVRS` (`+0x200` compteur, `+0x202` tableau, 5 octets chacun) | tournoi | connu | non (lus par `owner->profile`) | `profile->ai.mvrs` |
| minuteur de rappel du ciblage (`+0x174`) | limite les rappels de `Targeting_AcquireBestThreat` du tournoi | connu | à déclarer plus tard | — |
| chronomètre (`+0x175`) | préparé par `AIEntity_MasterTick_5ACC` | partiel | non | — |
| rayon d'arrivée (`+0x139`), vitesse de croisière (`+0x141`), `+0x13D` | constantes issues de `NUMS` | connu | non | `NUMS` sur `SCMission` |
| décalage de formation (`+0x14A`, `+0x14E`, `+0x152`) | (300, 0, 0) en 24.8 | connu | non | `formation_pos_offset` (acteur) |
| vecteur (`+0x1A4`, `+0x1A8`, `+0x1AC`) | (0, −800, 0) ; sens inconnu | inconnu | non | — |

**Liens vers les autres objets**

| Champ (offset) | Rôle | Statut | `SCAIBrain` | Équivalent |
|---|---|---|---|---|
| nœud du monde lié (`+0x102`) | position et objet de mon avion | connu | non (`owner->object`) | `owner->object` |
| chargement d'armes (`+0x104`) | stations d'armement de 35 octets | connu | non | armes du `plane` / `RSEntity::weaps` |
| avion (`+0xB`) et bloc d'état (`+0x7`) | drapeaux de l'avion ; commandes communes joueur et IA | connu | non (`owner->plane`, `owner->pilot`) | `PlaneControlEvent` |
| pointeur vers l'objet portant le chargement d'armes (`+0x22`) | déduit de `MVRS_ID14_ScoreWeaponReadiness` | partiel | non | — |

**État d'avancement (2026-09-20)** : `SCAIBrain` (`SCAIBrain.h/.cpp`, dans `src/strike_commander/`) existe et est créé par `SCMission` pour tout acteur dont le profil est IA. La boucle `GOAL` (`runGoalSelectors`, `executeGoalAction`, `tryWanderRandom`, `tryActiveWingman`) y a été déplacée telle quelle ; `SCMissionActors::onAIRefresh` garde ses gardes puis appelle `brain->tick()`. Validé en jeu : compile, l'IA réagit comme avant. Les champs de ciblage sont déclarés mais pas encore utilisés ; l'état de l'objectif reste sur l'acteur.

**État d'avancement, tir et poursuite (2026-09-20)** : le tir (`updateFireControl`) et la poursuite (`updatePursuit`) sont pilotés par `SCAIBrain` (drapeaux `fire_control_enabled` et `pursuit_enabled`, actifs). Tir : masque d'arme, qualité de solution, seuil `2 × qualité ≥ AA`, rafale de canon `((rand & 3) + 4) × qualité / 10` ; `SCPilot::Fire` → `SCPlane::ShootDirect` (sans la précision `rand % 16 <= AA` ni la visée prédictive de l'ancien code). Poursuite : point d'anticipation (position de la cible plus sa vitesse déduite du déplacement entre deux ticks, sur `distance / ma vitesse` plafonné à 3 s), inclinaison bornée à ±45°, consigne à `SCPilot` (cap, altitude, vitesse) ; hors de la portée du canon le MiG accélère, dedans il égale la vitesse de la cible. `aim_trim` : correctif intégral qui compense l'erreur permanente de la boucle d'altitude de `SCPilot` (jusqu'à environ 300 unités selon l'avion) ; il disparaîtra avec l'option B (le pilote reçoit des écarts d'angle, pas une altitude). Validé sur logs : `STERN` abat un MiG au canon à environ 1777 avec une visée à 0,3° de la cible. Unités : `vz` est la vitesse par tick avec 50 ticks par seconde ; `vz = -6` correspond à environ 300 unités par seconde. Le tir de missile n'a pas de contrôle de verrouillage (non lu). Prochaine étape : l'esquive missile (`AI_MissileEvasionReaction_9A77`).

**Règle retenue** : le cerveau ne recopie pas ce que l'acteur, le profil ou le pilote portent déjà. Il lit ces données par `owner`. Il ne porte que l'état qui lui est propre (cibles, menace, et plus tard rafale et minuteurs). L'objectif courant migrera dans le cerveau quand la boucle `GOAL` y sera déplacée.

**Prochains champs candidats** (tous « connu ») : `+0x145` (allié), `+0x11D` avec ses coordonnées, `+0x280` (rafale), `+0x174` (minuteur). Ils se déclarent avec la couche qui les utilise, pas avant.

## 3. Le tournoi `MVRS`

### 3.1 `SCMissionActors::runMVRSTournament`

*Correction (2026-09-19) : le bruit de l'ASM est ±1, jamais 0 (`test ax, 1`). Ce pseudocode ne montre que la boucle de score ; les conditions d'entrée (cible `entité+0x287`, `AI_BehaviorSelector_8D30` avant le score, objet en cours à `entité+0x0D`) sont dans `AI_TICK_CALL_GRAPH.md`.*

```cpp
void SCMissionActors::runMVRSTournament() {
    if (this->profile->ai.mvrs.empty()) return;

    int best = INT_MIN;
    MVRSInstinct winner{};
    bool hasWinner = false;
    for (auto &e : this->profile->ai.mvrs) {
        MVRSInstinct id = (MVRSInstinct)e.node_id;
        int score = this->computeMVRSScore(id);
        score += e.value;
        score += (std::rand() & 1) ? 1 : -1;
        if (score > best) { best = score; winner = id; hasWinner = true; }
    }
    if (!hasWinner) return;
    this->mvrs_current_winner = winner;
    this->applyMVRSInstinct(winner);
}
```

### 3.2 `SCMissionActors::computeMVRSScore`

```cpp
int SCMissionActors::computeMVRSScore(MVRSInstinct id) {
    switch (id) {
        case MVRSInstinct::PursuitBase:
        case MVRSInstinct::PursuitAlwaysTen:
        case MVRSInstinct::PursuitSimple:
        case MVRSInstinct::PursuitExtended:
        case MVRSInstinct::PursuitImmelmannSplitS:
        case MVRSInstinct::PursuitSensorGated:
        case MVRSInstinct::PursuitSkillGatedTH:
        case MVRSInstinct::ScissorsRollaway:
            return this->scoreAngularFamily(id);
        case MVRSInstinct::Intercept:
            return this->interceptTrajectoryFeasible() ? 10 : 0;
        case MVRSInstinct::ThreatSensor:
            return this->targetDetectedBySensor() ? 10 : 0;
        case MVRSInstinct::ThGateBinary:
            // La fonction d'origine initialise sa variable de travail a
            // zero AVANT tout calcul, rendant tout plafonnement ulterieur
            // inatteignable. Le seul test qui compte est TH < 12 -> 0 ou 1.
            return (this->profile->ai.atrb.TH < 12) ? 1 : 0;
        case MVRSInstinct::WeaponReady:
            return this->scoreWeaponReady();
        case MVRSInstinct::Unresolved8:
        case MVRSInstinct::Unresolved9:
        case MVRSInstinct::Unresolved10:
        case MVRSInstinct::Unresolved11:
        case MVRSInstinct::Unresolved12:
            // TODO retrouver le vrai role avant implementation finale —
            // ne pas laisser a 0 par hypothese de "non implemente", voir
            // la note sur l'enum ci-dessus et AI_SYSTEM.md §3.7/§3.8.
            return 0;
        case MVRSInstinct::GeometricUtility:
        case MVRSInstinct::NavCommandCarrier:
            // Score nul dans le tournoi par conception confirmee (ce sont
            // des porteurs consommes directement hors tournoi, §3.6/§4bis) —
            // ce return 0 n'est pas une lacune, contrairement a 8-12 ci-dessus.
        default:
            return 0;
    }
}

int SCMissionActors::scoreAngularFamily(MVRSInstinct id) {
    if (this->target == nullptr || this->target->plane == nullptr) return 0;

    float pursuitAngle = this->computeSensorSecondaryAngle();

    int base = 5;
    if (id == MVRSInstinct::PursuitSensorGated) base = 3;
    if (id == MVRSInstinct::ScissorsRollaway || id == MVRSInstinct::PursuitSkillGatedTH) base = 1;

    int score = base;
    if (pursuitAngle < 90.0f) score -= 3;
    if (pursuitAngle < 45.0f) score -= 6;

    if (id == MVRSInstinct::PursuitSensorGated && !this->targetDetectedBySensor()) return 0;

    if (id == MVRSInstinct::PursuitSkillGatedTH
        && !this->skillCheck(this->profile->ai.atrb.TH, -7)) return 0;

    if (id == MVRSInstinct::ScissorsRollaway) {
        float fl = (float)this->profile->ai.atrb.FL;
        score += (int)((fl - 2) * (fl - 2) * 3.0f / 2.0f + 3.0f);
    }
    return std::max(0, std::min(9, score));
}

float SCMissionActors::computeSensorSecondaryAngle() {
    if (this->target == nullptr || this->target->plane == nullptr) return 180.0f;
    Vector3D toTarget = {this->target->plane->x - this->plane->x, 0.0f,
                          this->target->plane->z - this->plane->z};
    float bearingToTarget = atan2f(toTarget.z, toTarget.x) * 180.0f / (float)M_PI;
    float delta = bearingToTarget - this->plane->yaw / 10.0f;
    while (delta > 180.0f) delta -= 360.0f;
    while (delta < -180.0f) delta += 360.0f;
    return std::abs(delta);
}

bool SCMissionActors::targetDetectedBySensor() {
    if (this->threat_modulator_active) return true;
    if (this->target == nullptr) return false;
    float dist = (float)this->getDistanceToTarget(0);
    if (dist < this->mission->nums.distanceThreshold175) return true;
    return this->computeSensorSecondaryAngle() < 30.0f;
}

bool SCMissionActors::interceptTrajectoryFeasible() {
    if (this->target == nullptr || this->target->plane == nullptr) return false;
    if (!this->targetDetectedBySensor()) return false;

    Vector3D toTarget = {this->target->plane->x - this->plane->x, 0.0f,
                          this->target->plane->z - this->plane->z};
    Vector3D targetVel = {this->target->plane->speed_x, 0.0f, this->target->plane->speed_z};
    float targetSpeed = sqrtf(targetVel.x * targetVel.x + targetVel.z * targetVel.z);
    if (targetSpeed < 1.0f) return true;

    float mySpeed = (float)this->pilot->target_speed;
    if (mySpeed <= targetSpeed) return false;

    float distToTarget = sqrtf(toTarget.x * toTarget.x + toTarget.z * toTarget.z);
    if (distToTarget < 0.01f) return true;
    float cosAngle = (toTarget.x * targetVel.x + toTarget.z * targetVel.z)
                      / (distToTarget * targetSpeed);
    return cosAngle > -0.5f;
}

int SCMissionActors::scoreWeaponReady() {
    if (this->weapon_task_busy) return 0;
    if (this->current_target == 0 || this->target == nullptr) return 0;
    if (this->target->is_destroyed) return 0;
    if (this->target->plane->object_type != OBJECT_TYPE_AIRCRAFT) return 0;
    if (this->selectBestWeapon() < 0) return 0;
    return 5;
}

bool SCMissionActors::skillCheck(uint8_t statValue, int modifier) {
    int roll = (std::rand() % 16) + 1;
    return roll <= (int)statValue + modifier;
}
```

### 3.3 `SCMissionActors::applyMVRSInstinct`

```cpp
void SCMissionActors::applyMVRSInstinct(MVRSInstinct id) {
    switch (id) {
        case MVRSInstinct::PursuitBase:
            this->applyPursuitTracking();
            this->applyGeometricUtility();
            break;
        case MVRSInstinct::PursuitAlwaysTen:
            this->applyBreakDirection();
            break;
        case MVRSInstinct::PursuitSimple:
        case MVRSInstinct::PursuitExtended:
        case MVRSInstinct::PursuitSkillGatedTH:
            this->applyPursuitTracking();
            break;
        case MVRSInstinct::PursuitImmelmannSplitS:
            this->mvrs_maneuver_timer = 5.0f;
            this->mvrs_maneuver_phase = 1;
            break;
        case MVRSInstinct::PursuitSensorGated:
            this->mvrs_maneuver_timer = 6.0f;
            this->mvrs_maneuver_phase = 1;
            break;
        case MVRSInstinct::ScissorsRollaway:
            this->mvrs_maneuver_timer = 4.0f;
            this->mvrs_maneuver_phase = 1;
            break;
        case MVRSInstinct::WeaponReady:
            this->armWeaponEngagement();
            break;
        case MVRSInstinct::GeometricUtility:
            this->applyGeometricUtility();
            break;
        default:
            break;
    }
}

void SCMissionActors::applyPursuitTracking() {
    if (this->target == nullptr || this->target->plane == nullptr) return;
    Vector3D toTarget = {this->target->plane->x - this->plane->x,
                          this->target->plane->y - this->plane->y,
                          this->target->plane->z - this->plane->z};
    this->pilot->target_azimut = atan2f(toTarget.z, toTarget.x) * 180.0f / (float)M_PI;
    this->pilot->target_climb = (int)this->target->plane->y;
}

void SCMissionActors::applyGeometricUtility() {
    if (this->target == nullptr || this->target->plane == nullptr) return;
    float angle = this->computeSensorSecondaryAngle();
    if (angle >= 45.0f) {
        float dist = (float)this->getDistanceToTarget(0);
        if (dist < 256.0f) {
            // avertissement de proximite/collision — brancher sur §5
        }
    }
}

void SCMissionActors::armWeaponEngagement() {
    this->weapon_engagement_target = this->target;
    this->weapon_engagement_timer = 390.0f;
    this->executeFireControlSolution();
}

void SCMissionActors::applyBreakDirection() {
    float lateral = this->attack_pos_offset.x;
    if (lateral > 3.0f) this->mvrs_break_right = true;
    else if (lateral < -3.0f) this->mvrs_break_right = false;
    else this->mvrs_break_right = (std::rand() % 2) == 0;

    float breakAzimuth = this->plane->yaw / 10.0f + (this->mvrs_break_right ? 60.0f : -60.0f);
    this->pilot->target_azimut = breakAzimuth;
}
```

### 3.4 Ordre vs exécution — `destroyTarget` et la solution de tir

```cpp
bool SCMissionActors::destroyTarget(uint8_t arg) {
    SCMissionActors *newTarget = this->mission->getActorById(arg);
    if (newTarget == nullptr) return false;
    this->target = newTarget;
    this->current_target = arg;
    this->current_objective = prog_op::OP_SET_OBJ_DESTROY_TARGET;
    this->pilot->SetTargetWaypoint({this->target->plane->x,
                                     this->target->plane->y,
                                     this->target->plane->z});
    return false;
}

void SCMissionActors::executeFireControlSolution() {
    if (this->target == nullptr || this->target->plane == nullptr) return;

    int hpt_id = this->selectBestWeapon();
    if (hpt_id < 0) return;

    float dist = (float)this->getDistanceToTarget(0);
    if (dist > (float)this->weaponEffectiveRange(hpt_id)) return;

    if (this->computeSensorSecondaryAngle() > this->weaponFiringConeAngle(hpt_id)) return;

    if (this->skillCheck(this->profile->ai.atrb.TH, 0)) {
        this->plane->Shoot(hpt_id, this->target, this->mission);
    }
}

int SCMissionActors::weaponFiringConeAngle(int hpt_id) {
    auto &station = this->plane->weapon_stations[hpt_id];
    return station.is_gun ? 5 : 20;
}

int SCMissionActors::selectBestWeapon() {
    bool targetIsGround = (this->target->plane->object_type == OBJECT_TYPE_GROUND);
    int bestStation = -1;
    int bestAmmo = -1;
    for (int i = 0; i < this->plane->weapon_station_count; i++) {
        auto &station = this->plane->weapon_stations[i];
        if (station.ammo_remaining <= 0) continue;
        bool matches = targetIsGround ? station.is_air_to_ground : station.is_air_to_air;
        if (!matches) continue;
        if (station.ammo_remaining > bestAmmo) { bestAmmo = station.ammo_remaining; bestStation = i; }
    }
    return bestStation;
}

int SCMissionActors::weaponEffectiveRange(int hpt_id) {
    auto &station = this->plane->weapon_stations[hpt_id];
    bool targetIsGround = (this->target->plane->object_type == OBJECT_TYPE_GROUND);
    float skill = targetIsGround ? (float)this->profile->ai.atrb.AG : (float)this->profile->ai.atrb.AA;
    return station.base_effective_range + (int)(500.0f * skill / 16.0f);
}
```

---

### 3.5 Choix de cible et menaces (`Targeting_AcquireBestThreat`) — spécification lue dans l'ASM

Ce point conditionne le tournoi : il exige une cible, et c'est cette fonction qui la pose. Détail et citations : `AI_TICK_CALL_GRAPH.md`, section « Le choix de cible et le traitement des menaces ».

**Catégorie d'un objet** = chunk présent dans son `OBJECTS\<nom>.IFF` (le premier trouvé dans l'ordre `BOBJ, ORNT, TRCR, AFTB, MOBL, OMOB, GUID, ARMG, JETP, XMIT, WEAP, MISS, PODR, BOMB, DURD, DECY, SWPN, GRND, RNWY`) :

| Chunk | Catégorie | Rôle |
|---|---|---|
| `JETP` | 6 | avion à réaction |
| `MISS` | 8 | missile |
| `SWPN` | 0x13 | défenses fixes (AA, batterie, SAM, navire) |
| `WEAP` 7, `BOMB`/`DURD` 9, `PODR` 0x0A, `TRCR` 0x0D, `AFTB` 0x0E, `DECY` 0x10, `GRND` 0x14, `XMIT` 0x15, `MOBL` 2, `OMOB` 3, `GUID` 4, `ARMG` 5 | | non testées par la fonction |

**Correspondance avec `EntityType` (`RSEntity.h`, champ `entity_type` ; les identifiants sont propres à libRealSpace, seule la classe compte)** :

| Chunk IFF | Catégorie ASM | `EntityType` |
|---|---|---|
| `JETP` | 6 | `jet` |
| `MISS` | 8 | `missiles` |
| `SWPN` | 0x13 | `swpn` |
| `BOMB` / `DURD` | 9 | `bomb` |
| `TRCR` | 0x0D | `tracer` |
| `AFTB` | 0x0E | `aftb` |
| `PODR` | 0x0A | `podr` |
| `GRND` | 0x14 | `ground` |
| `ORNT` | 0 ? | `ornt` (objet de décor : immeuble, etc.) |
| `RNWY` | non lue | `rnwy` (piste de décollage) |
| `MOBL` / `OMOB` | 2 / 3 | `object_mobile` (non utilisés dans Strike Commander, laissés de côté) |

Le camp hostile de l'ASM (`+0x50` de signe opposé) correspond au `team_id` de libRealSpace. La portée `objet+0x3E` d'une défense fixe correspond vraisemblablement à `swpn_data->detection_range` ou `effective_range` (à confirmer côté données).

**Ordre de traitement** (à chaque appel, chaque acteur actif) :
1. `+0x27F == 2` → 0. Chercher parmi tous les objets du monde, sauf soi.
2. **Candidat** : missile dont la cible est moi ; avion hostile (camp de signe opposé) ; objet hostile « `+0x11 = 2` » seulement si l'appel autorise une nouvelle cible et qu'une arme air-air est chargée.
3. **Scores A, B et aptitude `si`** : bandes de distance (`NUMS` 72020/24/28/2C/30), angles d'aspect (30°, 45°, 60°, 90°, 135°), armes chargées (masques `1` = AIM-9J, `3` = AIM-9J ou AIM-9M, `0x700` = AIM-120, SA-2 ou SA-6, `0x83C` = AGM-65D, LAU-3, MK-20, MK-82 ou canon 20 mm ; bit = `weapon_id` − 1), persistance de la cible courante (+3/+5), bonus si l'avion me vise déjà.
4. **Porte** : `roll = (rand() & 15) + 1` ; le candidat est retenu si `roll <= TH + si` (`TH` = `ATRB[+0xB0]`, octet signé). Refait à chaque candidat, à chaque appel. Échec = candidat ignoré.
5. **Score final** `= (AR − TH + 16)·A + (TH − AR + 16)·B` (`AR` = `+0xB8`, `TH` = `+0xB0`) ; le meilleur part de −5000.
6. **Résultat** : avion → cible `+0x287` ; défense fixe → `+0x283` ; **missile qui me vise → `+0x281`, cibles vidées, `+0x27F = 2`**. Sans gagnant, rien n'est modifié.

**Lecture des traits (hypothèse de travail de Rémi)** : les poids `AR − TH + 16` et `TH − AR + 16` valent toujours 32 au total. Un pilote agressif favorise A (cibles bien placées devant lui, à portée) et se rapproche de sa cible ; un pilote gâchette facile favorise B (cibles qui le menacent) et tire vite. Le choix de cible est lu dans l'ASM ; « se rapprocher » et « tirer vite » sont à vérifier dans `AI_GuidanceSolution_Major`, `AI_FireWeaponTrigger` et `Pilot_ReactionThreshold_B6` (non lues).

**Cibles sol et missile qui me vise (implémentés le 2026-09-20 dans `SCAIBrain`)** :
- **Candidat sol** : `target_type == 2`, camp hostile, un armement sol chargé (masque `0x83C`), et `allow_new_target`. Score : cible de mission A +6 / aptitude +3 ; pour une défense fixe avec munitions, `B = 10·(1 − d/R) + 5` si `d ≤ R`, avec `R = swpn_data->effective_range` (le `+0x3E` de l'assembleur, confirmé par `SwpnModel_LoadDataChunk_A0A00`) ; au-delà de `range_ground` aptitude −4, sinon angle `ahead` < 45° : aptitude +5 et A +6, entre 45° et 90° : aptitude +3 et A +3. Un gagnant sol range `ground_target` et vide `air_target`.
- **Missile qui me vise** : seulement si sa cible est moi, son `entity_type` est `missiles` et son `target_domain` vaut 1 (l'assembleur teste `objet+0x4E == 1`, c'est le second octet de classe du chunk `WDAT`, 1 pour les missiles guidés anti-avion). Son angle d'approche `aims` (nez du missile contre la direction vers moi) doit être ≤ 90° et la distance inférieure à `range_far`. Missile longue portée (`weapon_id` AIM-120, SA-2, SA-6) : `B = 16·(1 − d/range_far) + 24` ; sinon il faut `d ≤ range_long` et `B = 16·(1 − d/range_long) + 24` ; aptitude += `TH²/16 − 8`, et −4 si `ahead` > 135° sans contrôle de tir. Un jet de dé réussi range le missile dans `missile_threat` même s'il ne gagne pas ; s'il gagne, `air_target` et `ground_target` sont vidés et `threat_state` passe à 2 (remis à 0 à l'appel suivant).
- **Pas implémenté** : le `+4` si l'avion visé est le lanceur du missile (le sens exact de la méthode `vtable+0x38` du nœud est inconnu), le test du cône arrière et le terme de classe.

**Articulation avec les ordres du script (lu le 2026-09-20)** : `Goal_SetObjective_A307` écrit, pour « détruire la cible » comme pour « défendre la cible », **uniquement la cible de mission** (`SetReference` sur son seul champ) ; elle n'écrit ni la cible aérienne ni la cible sol, qui sont remplies par le ciblage. Les deux mécanismes se croisent à trois endroits :
1. **Bonus de score** dans `Targeting_AcquireBestThreat` : candidat = cible de mission → cible sol : A +6 et aptitude +3 ; avion : A +2 et aptitude +4. Préférence, pas obligation.
2. **Tir** : `MVRS_ID14_ScoreWeaponReadiness` utilise la cible sol acquise, sinon la cible de mission.
3. **Exécution** : `Goal_ExecuteAction`, pour une cible de mission de type sol, applique directement le nœud permanent d'attaque au sol, sans passer par le ciblage.

**Cibles sol : jamais acquises seules depuis `AI_TopLevelThink`.** Ce chemin appelle le ciblage avec « nouvelle cible » à 0, et un candidat sol n'est retenu que si cet argument est non nul (un avion hostile n'en a pas besoin). L'IA acquiert donc seule des avions et des missiles ; les cibles sol viennent du script. Le tournoi passe un argument non nul dans certains cas, à vérifier.

**Pour l'implémentation** : la cible de mission reste ce que pose `setObjective` (`current_target`, `target` de l'acteur) ; elle entre dans `acquireBestThreat` comme bonus. `destroyTarget` garde la navigation vers la cible et son tir actuel tant que le contrôle de tir du cerveau n'existe pas. Ce qui relie l'ordre au combat (lu) : `Goal_ExecuteAction`, cas « détruire la cible », route vers `AI_BehaviorStateMachine_WeightedOptionSelector_9D05` (`arg_4` = 0) pour une cible aérienne et vers le nœud d'attaque au sol pour une cible sol ; voir `AI_TICK_CALL_GRAPH.md`. Pour l'air, rien d'autre que le bonus de score ne force le choix de la cible de mission.

**À retenir pour l'implémentation** :
- Un missile qui me vise **interrompt l'attaque** : plus de cible, pas de tir, pas de tournoi ce tick. La réaction défensive (leurres, virage) n'est pas dans cette fonction ; elle est à retrouver (lecteurs de `+0x281` et de `+0x27F == 2`).
- Les défenses fixes comptent quand l'avion est **dans leur portée** (`objet+0x3E`).
- Le tir n'est pas ici : il est fait par `AI_BehaviorSelector_8D30`, avant le tournoi (voir §3.1).
- `objet+0x11` est `RSEntity::target_type` (chunk `TRGT`, 1er octet) ; la valeur 2 = cible sol (cible qu'on attaque avec des armes non anti-avion). Il faut que ce champ soit lu pour toutes les classes (aujourd'hui seul `parseREAL_OBJT_JETP_TRGT` le remplit).
- Non lu : les lecteurs de `+0x281/+0x283/+0x285/+0x289`.

## 4. Séquences de manœuvre acrobatique

Trois déclencheurs distincts, chacun avec son propre minuteur :
`PursuitImmelmannSplitS` (ID=5, 5.0s, 8 phases), `ScissorsRollaway`
(ID=13, 4.0s, 5 phases), `PursuitSensorGated` (ID=6, 6.0s, séquence
propre non détaillée phase par phase).

### 4.1 Appel depuis `onMissionUpdate`

```cpp
if (this->mvrs_maneuver_phase > 0) {
    float dt = this->mission->tps > 0 ? 1.0f / this->mission->tps : 1.0f / 30.0f;
    this->tickManeuverSequence(dt);
}
```

### 4.2 `SCMissionActors::tickManeuverSequence`

```cpp
void SCMissionActors::tickManeuverSequence(float dt) {
    this->mvrs_maneuver_timer -= dt;

    if (this->mvrs_current_winner == MVRSInstinct::PursuitImmelmannSplitS) {
        switch (this->mvrs_maneuver_phase) {
            case 1:
                this->pilot->target_climb = (int)(this->plane->y + 2000.0f);
                this->mvrs_maneuver_phase = 2;
                break;
            case 2:
                this->pilot->targetRoll = -30.0f;
                this->mvrs_maneuver_phase = 3;
                break;
            case 3:
                this->pilot->targetRoll = 0.0f;
                this->mvrs_maneuver_phase = 4;
                break;
            case 4:
                this->pilot->targetRoll = 90.0f;
                this->mvrs_maneuver_phase = 0;
                break;
        }
    } else if (this->mvrs_current_winner == MVRSInstinct::ScissorsRollaway) {
        switch (this->mvrs_maneuver_phase) {
            case 1:
                this->pilot->targetRoll = 45.0f;
                this->mvrs_maneuver_phase = 2;
                break;
            case 2:
                this->pilot->targetRoll = 0.0f;
                this->mvrs_maneuver_phase = 0;
                break;
        }
    }
    if (this->mvrs_maneuver_timer <= 0.0f) {
        this->mvrs_maneuver_phase = 0;
    }
}
```

---

## 5. Radio — limiteur de fréquence et alerte de menace

### 5.1 Déclarations

```cpp
struct ThreatRecord {
    SCMissionActors *source{nullptr};
    bool locked{false};
    bool isMissile{false};
};
std::vector<ThreatRecord> tracked_threats;

int last_message_code{-1};
float last_message_timestamp{0.0f};
int follow_mode{0};

virtual bool canPlayRadioMessage(int category, int messageCode);
virtual void checkMissileThreatWarning();
```

### 5.2 `SCMissionActors::canPlayRadioMessage`

`entité+0xB2` est maintenant confirmé être `ATRB.VB` directement
(§1.5), plus une hypothèse thématique :

```cpp
bool SCMissionActors::canPlayRadioMessage(int category, int messageCode) {
    float elapsed = this->mission->elapsedTime - this->last_message_timestamp;
    int effective = (int)this->profile->ai.atrb.VB;
    if (category < 0 || category >= 6) effective = 16;

    if (messageCode == this->last_message_code && messageCode != -1 && effective > 3) {
        effective -= 3;
    }

    if (effective <= 0) return true;
    if (this->follow_mode == 2) return true;

    float threshold;
    if (effective >= 12)      threshold = 20.0f;
    else if (effective >= 8)  threshold = 40.0f;
    else if (effective >= 4)  threshold = 60.0f;
    else                      threshold = 80.0f;

    return elapsed > threshold;
}
```

### 5.3 `SCMissionActors::checkMissileThreatWarning`

```cpp
void SCMissionActors::checkMissileThreatWarning() {
    if (this->tracked_threats.empty()) return;

    int lockedCount = 0;
    for (auto &t : this->tracked_threats) if (t.locked) lockedCount++;
    int ratio = (lockedCount * 100) / (int)this->tracked_threats.size();
    if (ratio <= 80) return;

    bool threatensPlayer = false;
    bool isMissileType = false;
    for (auto &t : this->tracked_threats) {
        if (t.locked && t.source != nullptr && t.source == this->mission->player) {
            threatensPlayer = true;
            isMissileType = t.isMissile;
            break;
        }
    }
    if (!threatensPlayer) return;

    int code = isMissileType ? 9 : 10;
    if (this->canPlayRadioMessage(1, code)) {
        this->setMessage((uint8_t)code);
        this->last_message_code = code;
        this->last_message_timestamp = this->mission->elapsedTime;
    }
}
```

### 5.4 Appel depuis `onMissionUpdate`

```cpp
if (ai_actor->profile != nullptr && ai_actor->profile->ai.isAI) {
    ai_actor->checkMissileThreatWarning();
}
```

---

## 6. Ordre de construction suggéré

1. **Chargement** (§1) — valider avec les échantillons disponibles.
2. **`AIRefreshEvent`** (§2.1-2.4) sans logique de décision.
3. **`runMVRSTournament` limité à `WeaponReady`** (§3.1-3.2, §3.4).
4. **Reste du tournoi** (§3.2-3.3). `20` et `21` ont un score nul en
   tournoi par conception confirmée mais un rôle réel hors tournoi
   (outil géométrique / porteur de commande de navigation) — les
   implémenter à leur place réelle, pas dans le tournoi. **`8`-`12`
   restent à implémenter dès que leur rôle réel est retrouvé dans
   l'assembleur** (voir `AI_SYSTEM.md` §3.7/§3.8) — ne pas les laisser
   de côté sur la seule base d'un score nul observé dans le chemin lu
   à ce jour, cette lecture est incomplète.
5. **`tryActiveWingman`/`tryWanderRandom`** (§2.6-2.7).
6. **Séquences de manœuvre** (§4), `PursuitSensorGated` en dernier.
7. **`canPlayRadioMessage`/`checkMissileThreatWarning`** (§5).
8. **Vérifier `AI_REFRESH_INTERVAL` en jeu** (§2.2, `1/25s`) — c'est une
   remise à l'échelle sur la cadence de décision d'origine, pas une
   valeur à ajuster pour le confort ; ne pas l'augmenter/diminuer sans
   nouvelle donnée sur le framerate cible du binaire DOS.
