# TRAINING MISSION dans libRealSpace : implémentation proposée

Rédigé le 2026-11-04. Comportement du jeu : `TRAINING_MISSION.md` (OPTEST.EXE, ovr190). Repère de libRealSpace
(Y = altitude), mètres, nombres en décimal.

**Le livrable : les fichiers de libRealSpace complets, déjà modifiés**, dans `tools/training_ref/librealspace/src/`
(base : commit `80e360a` du 2026-11-01), et le code entier de chaque changement au § 3. `tools/training_ref/build.sh`
recopie une copie de libRealSpace, pose ces fichiers par-dessus, compile tout le jeu (dont `enhanced/`, qui dérive de
`SCTrainingMenu`) et lance l'essai du § 4.

## 1. Principe : pas de fichier `instant.iff`

Dans le jeu, OPTEST.EXE et STRIKE.EXE sont deux programmes : OPTEST écrit `instant.iff`, STRIKE le lit. libRealSpace est
un seul programme : la mission est construite **en mémoire**.

1. `SCTrainingMenu` affiche les écrans et remplit les réglages (`MISN_TRAINING`, l'équivalent des 42 octets de
   `Training_InitSettings_598FC`).
2. À ACCEPT, les réglages sont rangés dans `SCState` (`training_active`, `training`), comme le jeu les garde dans la
   structure de partie (`[partie+249]` = 254), puis le vol part sur `MISSIONS\TEMPLATE.IFF`, comme avant.
3. `SCMission::loadMission` lit le modèle (`RSMission::InitFromRAM`) puis, si `training_active` est posé, appelle
   `RSMission::addTraining`, **avant** la création des scènes et des acteurs.
4. `RSMission::addTraining` fait dans `mission_data` les ajouts que `Training_BuildInstantMission_58EEA` fait dans le
   fichier (zone, `FLAG[1]`, pilotes `CAST`, joueur replacé, avions `PART`, scène `SCNE`), avec les conversions de
   lecture de `parseMISN_*`. Le reste de `loadMission` crée les avions comme pour toute mission (profil
   `INTEL\ACE.IFF`…, cerveau d'IA, scripts du modèle).
5. Au retour du vol, `SCTrainingMenu::focus` efface `training_active` et revient au premier écran.

**Pourquoi `SCState` et pas un argument de `SCStrike::setMission` (changement par rapport à la proposition) :**
`setMission` passe par `SCStrike::createMission`, redéfinie dans `PSStrike`, `EnhancedStrike` et `DebugStrike`. Un
argument de plus aurait obligé à modifier ces trois classes et `SCMission` (constructeur). Avec `SCState`, **`SCStrike`
n'est pas modifié**, et la version « enhanced » (`EnhancedTrainingMenu::OnSearchAndDestroy` → `EnhancedStrike`)
fonctionne sans changement.

## 2. Les fichiers modifiés

| Fichier | Changement |
|---|---|
| `realspace/RSMission.h` | `MISN_TRAINING_PLANE`, `MISN_TRAINING` ; dans `RSMission` : `training_planes`, `addTraining` |
| `realspace/RSMission.cpp` | `RSMission::training_planes` (table des 16 avions), `RSMission::addTraining` |
| `strike_commander/SCState.h` | `training_active`, `training` |
| `strike_commander/SCMission.cpp` | `SCMission::loadMission` : appel d'`addTraining` après la lecture |
| `engine/FrameBuffer.cpp` | `FrameBuffer::textGlyphAdvance` : espace de la largeur d'un « A » si la police n'a pas de tiret |
| `strike_commander/SCTrainingMenu.h`, `.cpp` | les 7 écrans, les textes, BACKUP, le départ en vol |

`OnSearchAndDestroy` garde son nom et son rôle de départ en vol, pour les deux types (le vol est toujours
`TEMPLATE.IFF`) : `EnhancedTrainingMenu` le redéfinit. `OnDogFight`, privée et appelée par aucun bouton, est retirée.

### 2.1 Choix et écarts avec le jeu

- **Positions** : bandeau en (4, 3) et panneau en (6, 153), comme le jeu (`Training_TypeScreen_5547D` : `push 3` /
  `push 4` avant `Shape_DrawSpans_32CD8` ; `WidgetPanel_Construct_DAEB` avec x = 6, y = 153). L'ancien code les plaçait
  en (4, 0) et (6, 150). Les images de `TM.SHP` et d'`OBJVIEW.PAK` ont leurs décalages gauche et haut à 0 : la position
  du jeu s'applique telle quelle à `RLEShape`. Les rectangles des boutons sont ceux du jeu (136 × 12, 65 × 12, 14 × 12)
  au lieu de 130 × 15 et 60 × 15.
- **Clic** : un bouton ne fait que noter la valeur choisie ; `runFrame` l'applique après `checkButtons`, car l'écran
  suivant remplace les boutons (les détruire pendant `onAction` serait une erreur).
- **BACKUP** : dans le jeu, chaque écran est appelé par le précédent et rend 0 ; `Training_EraseLastText_55C7B` efface
  les textes du choix annulé. Ici, chaque choix empile l'état d'avant (écran, réglages, groupe, nombre de textes) ;
  BACKUP le rétablit. L'affichage obtenu est le même.
- **Texte** : `FrameBuffer::printText`, une fois par ligne, avec `GAMEFLOW\BWFONT.SHP` (chargée par l'écran : absente de
  `RSFontManager`). Cette police n'a pas d'image pour l'espace ni pour le tiret ; `textGlyphAdvance` prenait la largeur
  du tiret pour l'espace, donc 0 : l'espace prend maintenant la largeur d'un « A » quand le tiret est vide. Couleur 0 :
  les lettres gardent leurs couleurs (0 et 1 de la palette d'`OBJVIEW.PAK`, noir et gris clair). Le jeu passe 255 à
  `PaletteScreen_DispatchWidgetLayoutB_11363`, dont le sens n'est pas lu.
- **Armement** : le jeu pose un stock fixe (`TRAINING_MISSION.md` § 7) puis ouvre l'écran d'armement de la campagne
  (`Gameflow_WeaponLoadout_51AB3`). Ce n'est pas repris : `WeaponLoadoutScene` est lancé par `SCGameFlow` avec une scène
  de `GAMEFLOW.IFF`. L'avion du joueur garde l'emport de son fichier (`player_loadout` à faux).
- **Retour de vol** : l'entraînement ne touche pas à la campagne (dans le jeu, `Gameflow_SaveTmpState_4BBA0` est sautée
  pour la mission 254). Ici, le vol est lancé par `SCTrainingMenu`, pas par `SCGameFlow` : le compte rendu n'est pas
  appliqué à la partie ; retour au premier écran d'entraînement.

## 3. Le code de chaque changement

### 3.1 `realspace/RSMission.h` — réglages, table des avions, `addTraining`

Ajouté avant `class RSMission` :

```cpp
// Mission d'entraînement (TRAINING MISSION d'OPTEST.EXE) : un avion de l'écran de choix, table du segment de données
// d'OPTEST lue par Training_AircraftScreen_56B04 et Training_BuildInstantMission_58EEA (15 octets par avion : nom affiché,
// fichier objet, emport, deux dwords non lus par ce code, drapeau). strike_commander_re/analysis/TRAINING_MISSION.md § 5.
struct MISN_TRAINING_PLANE {
    const char *name;
    const char *object;
    const char *loadout;
    // Drapeau : pilote CAST au niveau choisi, programme de mise à jour 1, vitesse 200 ; sinon « TARGET », programme 2,
    // vitesse 100.
    bool armed;
};

// Réglages des écrans d'entraînement (Training_InitSettings_598FC, 42 octets dans OPTEST).
struct MISN_TRAINING {
    // +40 : 1 = DOGFIGHT, 2 = SEARCH AND DESTROY.
    uint8_t type{0};
    // +12, +14, +16 : nombre d'avions des groupes 0, 1, 2.
    std::array<uint8_t, 3> group_count{};
    // +6, +8, +10 : type d'avion des groupes (rang dans RSMission::training_planes).
    std::array<uint8_t, 3> group_plane{};
    // +0 : altitude choisie, en pieds (5000 par défaut).
    int32_t altitude_feet{5000};
    // +18 : 0 = rookie, 1 = veteran, 2 = ace.
    uint8_t pilot_level{0};
};
```

Ajouté dans `class RSMission`, après `InitFromRAM` :

```cpp
    // Les 16 avions de l'écran de choix, dans l'ordre des boutons.
    static const MISN_TRAINING_PLANE training_planes[16];
    // Ajoute à mission_data, lue depuis MISSIONS\TEMPLATE.IFF, ce que Training_BuildInstantMission_58EEA ajoute au
    // modèle pour écrire instant.iff : le jeu n'a pas besoin du fichier pour voler la mission.
    void addTraining(const MISN_TRAINING &training);
```

### 3.2 `realspace/RSMission.cpp` — `RSMission::training_planes`

```cpp
// Table des avions de Training_AircraftScreen_56B04 (bouton n = entrée n − 1). Fichier objet et emport : mots 2 et 4 de
// chaque enregistrement de 15 octets, écrits ici en majuscules comme après la lecture d'un PART ; drapeau : octet 14
// (cmp byte ptr [bx+0AA2h], 0).
const MISN_TRAINING_PLANE RSMission::training_planes[16] = {
    {
        "F-15",
        "F-15",
        "F15LOADA",
        true,
    },
    {
        "F-16",
        "F-16GRAY",
        "F16LOADA",
        true,
    },
    {
        "F/A-18",
        "F-18",
        "F18LOADA",
        true,
    },
    {
        "C-130",
        "C130DES",
        "",
        false,
    },
    {
        "F-22",
        "F-22",
        "F22LOAD",
        true,
    },
    {
        "YF-23",
        "YF23",
        "YF23LOAD",
        true,
    },
    {
        "A-10",
        "A-10",
        "",
        true,
    },
    {
        "E-3",
        "AWACS",
        "",
        false,
    },
    {
        "Tornado",
        "TORNCG",
        "TORNLOAD",
        true,
    },
    {
        "Mirage 2000",
        "MIRAGE",
        "MIRLOADA",
        true,
    },
    {
        "Lear Jet",
        "LEARJET",
        "",
        false,
    },
    {
        "747",
        "747",
        "",
        false,
    },
    {
        "MiG-21",
        "MIG21",
        "M21LOADA",
        true,
    },
    {
        "MiG-29",
        "MIG29",
        "M29LOADA",
        true,
    },
    {
        "Su-27",
        "SU27",
        "SUMLOAD",
        true,
    },
    {
        "TU-95",
        "TU-20",
        "TU20LOAD",
        false,
    },
};
```

### 3.3 `realspace/RSMission.cpp` — `RSMission::addTraining` (nouvelle)

```cpp
// Training_BuildInstantMission_58EEA recopie MISSIONS\TEMPLATE.IFF dans instant.iff et y ajoute les objets choisis aux
// écrans. Ici, le modèle est déjà lu : les mêmes ajouts sont faits dans mission_data, avec les conversions de lecture des
// fonctions parseMISN_* (x = c0, y = c2, z = −c1). strike_commander_re/analysis/TRAINING_MISSION.md § 6.
void RSMission::addTraining(const MISN_TRAINING &training) {
    MISN &data = this->mission_data;
    bool dogfight = training.type == 1;
    size_t area_count = data.areas.size();
    size_t cast_count = data.casting.size();
    size_t part_count = data.parts.size();
    int total = 0;
    if (dogfight) {
        for (int g = 0; g < 3; g++) {
            total += training.group_count[g];
        }
    }
    // Altitude des avions : (pieds << 16) / 839 en 24.8 (`idiv` par dword_46456 = 839 / 256, pieds par mètre).
    int64_t altitude_raw = ((int64_t) training.altitude_feet * 65536) / 839;
    float altitude = (float) altitude_raw / 256.0f * HEIGH_MAP_SCALE;

    // AREA : zone sphérique « Destroy bogeys », la zone n° area_count. Son altitude est le nombre de pieds recopié tel
    // quel (`shl eax, 8` sur la valeur en pieds).
    if (dogfight) {
        AREA *zone = new AREA();
        zone->id = (int) area_count + 1;
        zone->AreaType = 'S';
        memset(zone->AreaName, 0, sizeof(zone->AreaName));
        strncpy(zone->AreaName, "DESTROY BOGEYS", 32);
        zone->position.x = -66000.0f * BLOCK_COORD_SCALE;
        zone->position.y = (float) training.altitude_feet * HEIGH_MAP_SCALE;
        zone->position.z = -128000.0f * BLOCK_COORD_SCALE;
        zone->radius = 45000.0f * BLOCK_COORD_SCALE;
        zone->AreaWidth = (unsigned int) zone->radius;
        zone->AreaHeight = zone->AreaWidth;
        data.areas.push_back(zone);
    }

    // FLAG : un mot ajouté = nombre total d'avions (FLAG[1], décompté par le programme 3 du modèle). Les deux types.
    data.flags.push_back((int16_t) total);

    // Le joueur, 1er objet du modèle : position et cap remplacés, le reste gardé. Les deux types.
    if (!data.parts.empty()) {
        MISN_PART *player_part = data.parts[0];
        player_part->position = Vector3D(-73000.0f * BLOCK_COORD_SCALE, altitude, -128000.0f * BLOCK_COORD_SCALE);
        player_part->azymuth = 90;
        player_part->relative_position = player_part->position;
        player_part->relative_azymuth = player_part->azymuth;
    }
    if (!dogfight) {
        return;
    }

    // CAST et PART : un pilote et un objet par avion, groupe après groupe. Le rang continue d'un groupe à l'autre.
    const char *levels[3] = {
        "ROOKIE",
        "VETERAN",
        "ACE",
    };
    int rank = 0;
    for (int g = 0; g < 3; g++) {
        const MISN_TRAINING_PLANE &plane = training_planes[training.group_plane[g] % 16];
        for (int k = 0; k < training.group_count[g]; k++) {
            CAST *cast = new CAST();
            cast->actor = plane.armed ? levels[training.pilot_level % 3] : "TARGET";
            cast->profile = nullptr;
            data.casting.push_back(cast);

            MISN_PART *part = new MISN_PART();
            part->id = (uint8_t) (cast_count + rank);
            part->member_name = plane.object;
            part->member_name_destroyed = "";
            part->weapon_load = plane.loadout;
            part->area_id = 255;
            part->placement = 0;
            part->position = Vector3D((-59000.0f + 500.0f * g) * BLOCK_COORD_SCALE, altitude,
                                      -(128000.0f + 300.0f * rank) * BLOCK_COORD_SCALE);
            part->azymuth = 270;
            part->relative_position = part->position;
            part->relative_azymuth = part->azymuth;
            part->speed = plane.armed ? 200 : 100;
            part->team = 255;
            part->follow_ally = 255;
            part->unknown_byte_47 = 255;
            part->formation_side = 0;
            part->formation_ahead = 0;
            part->formation_up = 0;
            part->progs_id.push_back(255);
            part->progs_id.push_back(plane.armed ? 1 : 2);
            part->progs_id.push_back(3);
            part->progs_id.push_back(255);
            part->on_is_activated = part->progs_id[0];
            part->on_mission_update = part->progs_id[1];
            part->on_is_destroyed = part->progs_id[2];
            part->on_missions_init = part->progs_id[3];
            part->entity = nullptr;
            data.parts.push_back(part);
            rank++;
        }
    }

    // SCNE : une scène active sur la zone ajoutée, sans script, qui contient les avions ajoutés.
    MISN_SCEN *scene = new MISN_SCEN();
    scene->is_active = 1;
    scene->area_id = (int16_t) area_count;
    for (int i = 0; i < 3; i++) {
        scene->progs_id.push_back(-1);
    }
    scene->on_is_activated = -1;
    scene->on_mission_update = -1;
    scene->on_leaving = -1;
    scene->has_arrival_point = false;
    scene->arrival_heading = 0;
    scene->arrival_position = Vector3D(0, 0, 0);
    for (int k = 0; k < total; k++) {
        scene->cast.push_back((uint16_t) (part_count + k));
    }
    data.scenes.push_back(scene);
}
```

### 3.4 `strike_commander/SCState.h` — réglages transmis au vol

Ajouté après `MissionReport mission_report;` :

```cpp
    // Mission d'entraînement : posée par SCTrainingMenu avant le vol, lue par SCMission::loadMission
    // (OPTEST : [partie+249] = 254, mission « instant »).
    bool training_active{false};
    MISN_TRAINING training;
```

### 3.5 `strike_commander/SCMission.cpp` — `SCMission::loadMission`

Seules les 5 lignes après `InitFromRAM` sont nouvelles ; la fonction entière :

```cpp
void SCMission::loadMission() {
    
    this->difficulty = Config::getInstance().getInt("Gameplay", "difficulty", 0);
    std::string miss_file_name = Assets.mission_root_path + this->mission_name; 
    std::transform(miss_file_name.begin(), miss_file_name.end(), miss_file_name.begin(), ::toupper);
    TreEntry *mission_tre = Assets.GetEntryByName(miss_file_name.c_str());
    this->mission = new RSMission();
    this->mission->InitFromRAM(mission_tre->data, mission_tre->size);
    // TRAINING MISSION : objets choisis aux écrans ajoutés au modèle avant la création des scènes et des acteurs
    // (Training_BuildInstantMission_58EEA d'OPTEST, qui les écrit dans instant.iff).
    if (GameState.training_active) {
        this->mission->addTraining(GameState.training);
    }

    TreEntry *intel_tre = Assets.GetEntryByName(Assets.intel_root_path + "INTEL.IFF");
    if (intel_tre != nullptr) {
        this->intel.InitFromRAM(intel_tre->data, intel_tre->size);
    }


    std::string area_filename = Assets.mission_root_path+this->mission->mission_data.world_filename + ".IFF";
    std::transform(area_filename.begin(), area_filename.end(), area_filename.begin(), ::toupper);   
    this->world = new RSWorld();
    TreEntry *treEntry = NULL;
    treEntry = Assets.GetEntryByName(area_filename.c_str());
    if (treEntry != NULL) {
        this->world->InitFromRAM(treEntry->data, treEntry->size);
    }
    if (this->world->has_light) {
        Renderer.setObjectLight(this->world->light_ambient_weight, this->world->light_weight,
                                this->world->light_direction[0], this->world->light_direction[1],
                                this->world->light_direction[2]);
    }
    std::string area_fn = this->world->tera+".PAK";
    std::transform(area_fn.begin(), area_fn.end(), area_fn.begin(), ::toupper);
    this->area = new RSArea();
    this->area->InitFromPAKFileName(area_fn.c_str());

    Renderer.InvalidateAABBCache();           // ou InvalidateAABBCache(oldArea);
    Renderer.PrecomputeAABBs(this->area, 0, 1);  // optionnel: pré-calc LOD 0-1

    for (auto &area_entity: this->area->objects) {
        area_entity.entity = LoadEntity(area_entity.name);
    }
    for (auto scene : this->mission->mission_data.scenes) {
        this->scenes.push_back(new SCMissionScene(this, scene));
    }
    int cpt_actor=0;
    for (auto part : mission->mission_data.parts) {
        int search_id = 0;
        if (part->entity == nullptr) {
            part->entity = LoadEntity(part->member_name);
        }
        for (auto cast : mission->mission_data.casting) {
            if (part->id == search_id) {
                SCMissionActors *actor = new SCMissionActors();
                if (cast->actor == "PLAYER") {
                    actor = new SCMissionActorsPlayer();
                    if (part->area_id != 255 && part->placement == 0) {
                        Vector3D correction = this->mission->mission_data.areas[part->area_id]->position;
                        part->position.x += correction.x;
                        part->position.y += correction.y;
                        part->position.z += correction.z;
                    }
                } else if (cast->actor == "STRIBASE") {
                    actor = new SCMissionActorsStrikeBase();
                } else if (part->entity != nullptr && part->entity->entity_type == EntityType::swpn) {
                    actor = new SCMissionActorsSwpn();
                }
                if (cast->actor == "TEAM0") {
                    cast->actor = GameState.wingman;
                }
                actor->team_id = part->team;
                actor->actor_name = cast->actor;
                actor->actor_id = part->id;
                actor->object = part;
                actor->creation_part = *part;
                actor->health = part->entity->health;
                actor->profile = this->LoadProfile(cast->actor);
                actor->mission = this;
                if (actor->object->on_is_activated != 255) {
                    for (auto op: *this->mission->mission_data.prog[actor->object->on_is_activated]) {
                        actor->on_is_activated.push_back(op);
                    }
                }
                if (actor->object->on_is_destroyed != 255) {
                    for (auto op: *this->mission->mission_data.prog[actor->object->on_is_destroyed]) {
                        actor->on_is_destroyed.push_back(op);
                    }
                }
                if (actor->object->on_missions_init != 255) {
                    for (auto op: *this->mission->mission_data.prog[actor->object->on_missions_init]) {
                        actor->on_mission_start.push_back(op);
                    }
                }
                if (actor->object->on_mission_update != 255) {
                    for (auto op: *this->mission->mission_data.prog[actor->object->on_mission_update]) {
                        actor->on_update.push_back(op);
                    }
                }
                
                if (actor->profile != nullptr && actor->profile->ai.isAI) {
                    actor->brain = new SCAIBrain(actor);
                    if (actor->profile->ai.goal.size() > 0) {
                        this->createAiPlane(actor);
                    }
                    this->actors.push_back(actor);
                } else if (actor->profile != nullptr && cast->actor == "PLAYER") {
                    /*actor->plane = new SCPlane(10.0f, -7.0f, 40.0f, 40.0f, 30.0f, 100.0f, 390.0f, 18000.0f, 8000.0f,
                                                23000.0f, 32.0f, .93f, 120, this->area, part->position.x,
                                                part->position.y, part->position.z);*/
                    BoudingBox *bb = actor->object->entity->GetBoudingBpx();
                    actor->plane = new SCJetpPlane(
                        actor->object->entity->jdyn->max_g,
                        -actor->object->entity->jdyn->max_g/2.0f,
                        40.0f,
                        60.0f,
                        (float) actor->object->entity->jdyn->pitch_rate_limit_dps/2.0f,
                        (float) actor->object->entity->jdyn->rate_limit_dps/2.0f,
                        actor->object->entity->wing_area,
                        (float) actor->object->entity->weight_in_kg,
                        (float) actor->object->entity->jdyn->fuel_capacity,
                        (float) actor->object->entity->thrust_in_newton,
                        sqrtf(actor->object->entity->wing_area / ((float)M_PI * 0.83f * actor->object->entity->jdyn->induced_drag_k)),
                        actor->object->entity->jdyn->induced_drag_k,
                        (int) actor->object->entity->jdyn->stall_speed_ms,
                        this->area,
                        part->position.x,
                        part->position.y,
                        part->position.z
                    );
                    for (auto &sys: actor->object->entity->sysm) {
                        for (auto &subsys: sys.second) {
                            actor->plane->system_health[sys.first][subsys.first] = subsys.second;
                        }
                    }
                    // Cap en dixièmes de degré, comme SCStrike : le placement dans le repère du joueur le lit dès startScenes
                    // (l'ancienne 2e affectation, en radians, l'écrasait).
                    actor->plane->yaw = (360 - part->azymuth) * 10.0f;
                    actor->plane->simple_simulation = false;
                    // PartEntry_ResolveSpawnPositionAndActivate_51EDC : PART +0x12 non vide = emport imposé
                    // (WeaponSys_LoadFromFile_9EFBE), pour le joueur comme pour les autres avions.
                    part->weapon_load.shrink_to_fit();
                    if (part->weapon_load.size() > 0) {
                        std::string weapon_path_name = Assets.object_root_path + part->weapon_load + ".IFF";
                        std::transform(weapon_path_name.begin(), weapon_path_name.end(), weapon_path_name.begin(),
                                       ::toupper);
                        TreEntry *weapon_entry = Assets.GetEntryByName(weapon_path_name.c_str());
                        part->entity->weaps.clear();
                        part->entity->weaps.shrink_to_fit();
                        part->entity->parseREAL_OBJT_JETP(weapon_entry->data, weapon_entry->size);
                        printf("MISSION: emport impose du joueur %s\n", part->weapon_load.c_str());
                    }
                    actor->plane->object = part;
                    actor->plane->InitLoadout();
                    actor->plane->pilot = actor;
                    this->actors.push_back(actor);
                    this->player = actor;
                    // MissionScenario_LoadMainRecord_A8331 : bits 4 et 5 de +0x39 poses sur l'objet du joueur
                    actor->on_nav_map = true;
                } else {
                    this->actors.push_back(actor);
                }
                cpt_actor++;
                break;
            }
            search_id++;
        }
    }
    for (auto area_actor: this->area->objects) {
        SCMissionActors *actor = new SCMissionActors();
        if (area_actor.entity != nullptr && area_actor.entity->entity_type == EntityType::swpn) {
            actor = new SCMissionActorsSwpn();
        }
        MISN_PART *part = new MISN_PART();
        part->id = cpt_actor++;
        part->member_name = area_actor.name;
        part->member_name_destroyed = area_actor.destroyedName;
        part->entity = area_actor.entity;
        part->position = area_actor.position;
        actor->actor_name = area_actor.name;
        actor->health = area_actor.entity->health;
        actor->plane = nullptr;
        actor->pilot = nullptr;
        actor->actor_id = part->id;
        actor->object = part;
        actor->profile = nullptr;
        actor->is_active = true;
        actor->is_hidden = false;
        actor->team_id = 255; // by default set it to enemy
        if (area_actor.entity == nullptr) {
            continue;
        }
        actor->mission = this;
        if (actor->object->entity->entity_type == EntityType::rnwy) {
            for (auto runway: this->area->objectOverlay) {
                Vector3D pos = actor->object->position;
                
                // Vérifier si la position de l'objet est à l'intérieur de la piste
                if (pos.x >= runway.lx && pos.x <= runway.hx && 
                    pos.z >= runway.ly && pos.z <= runway.hy) {
                    
                    // Calculer les dimensions de la piste
                    float width = std::abs(runway.lx - runway.hx); 
                    float length = std::abs(runway.ly - runway.hy);
                    
                    // Calculer l'orientation (angle) de la piste
                    float angle = std::atan2(runway.ly - runway.hy, 
                                            runway.lx - runway.hx);
                    
                    // Recalculer la bounding box
                    actor->object->entity->bb.min.x = -width / 2.0f;
                    actor->object->entity->bb.max.x = width / 2.0f;
                    actor->object->entity->bb.min.y = -5;
                    actor->object->entity->bb.max.y = 5;
                    actor->object->entity->bb.min.z = -length / 2.0f;
                    actor->object->entity->bb.max.z = length / 2.0f;
                    
                    // Appliquer l'orientation à l'objet
                    actor->object->azymuth = angle * 180.0f / M_PI;
                    
                    break;
                }
            }
        }
        this->actors.push_back(actor);
    }
    for (auto member: this->mission->mission_data.team) {
        MISN_PART *part = this->mission->mission_data.parts[member];
        int id = part->id;
        for (auto actor: this->actors) {
            if (actor->actor_id == id) {
                this->friendlies.push_back(actor);
            }
            if (actor->object == part) {
                this->team.push_back(actor);
            }
        }
    }
    for (auto enemis : this->actors) {
        if (std::find(this->friendlies.begin(), this->friendlies.end(), enemis) == this->friendlies.end()) {
            this->enemies.push_back(enemis);
        }
    }
    this->applyDifficulty();
    if (this->player->on_is_activated.size() > 0) {
        SCProg *p = new SCProg(this->player, this->player->on_is_activated, this, this->player->object->on_is_activated);
        p->execute();
    }
    if (this->player->on_mission_start.size() > 0 && this->player->prog_executed == false) {
        SCProg *p = new SCProg(this->player, this->player->on_mission_start, this, this->player->object->on_missions_init);
        p->execute();
        this->player->prog_executed = true;
    }
    for (auto spot: this->mission->mission_data.spots) {
        spot->origin = {spot->position.x, spot->position.y, spot->position.z};
        // AreaRelPos_ToWorld_50EEB : zone absente ou hors liste -> décalage absolu.
        if (spot->area_id >= 0 && (size_t) spot->area_id < this->mission->mission_data.areas.size()) {
            AREA *ar = this->mission->mission_data.areas[spot->area_id];
            spot->position += ar->position;
        }
    }

    if (this->player != nullptr && this->player->plane != nullptr) {
        this->camera_director->init(this->world, this->player);
    }
    this->startScenes();
}
```

### 3.6 `engine/FrameBuffer.cpp` — `FrameBuffer::textGlyphAdvance`

```cpp
int FrameBuffer::textGlyphAdvance(RSFont *font, char c) {
    RLEShape *shape = font->GetShapeForChar(c == ' ' ? '-' : c);
    // Police sans tiret (image vide, comme dans GAMEFLOW\BWFONT.SHP) : l'espace prend la largeur d'un « A ».
    if (c == ' ' && (shape == nullptr || shape->GetWidth() == 0)) {
        shape = font->GetShapeForChar('A');
    }
    if (shape == nullptr) {
        return 0;
    }
    return shape->rightDist;
}
```

### 3.7 `strike_commander/SCTrainingMenu.h` (entier)

```cpp
//
//  File.h
//  libRealSpace
//
//  Created by fabien sanglard on 1/28/2014.
//  Copyright (c) 2014 Fabien Sanglard. All rights reserved.
//
//  TRAINING MISSION (OPTEST.EXE, ovr190) : écrans de réglage, puis vol de MISSIONS\TEMPLATE.IFF complété par
//  RSMission::addTraining. strike_commander_re/analysis/TRAINING_MISSION.md.
//

#ifndef __libRealSpace__File__
#define __libRealSpace__File__

class SCTrainingMenu : public IActivity {

public:
    SCTrainingMenu();
    ~SCTrainingMenu();

    void init();
    void unFocus(void);
    void focus(void);
    void runFrame(void);

protected:
    virtual void OnSearchAndDestroy();

private:
    // Un écran = un panneau de TM.SHP et ses boutons (§ 3 du document).
    enum TrainingScreen {
        SCREEN_TYPE,
        SCREEN_COUNT,
        SCREEN_PLANE,
        SCREEN_MORE,
        SCREEN_ALTITUDE,
        SCREEN_LEVEL,
        SCREEN_ACCEPT
    };
    // Valeurs rendues par les boutons BACKUP et CANCEL (−1 et −2 dans le jeu).
    static const int CHOICE_BACKUP = -1;
    static const int CHOICE_CANCEL = -2;

    // Ligne de texte écrite au-dessus du panneau (Training_PrintText_55BDC).
    struct TrainingText {
        Point2D position;
        std::string text;
    };
    // État avant un choix : BACKUP le rétablit (efface les textes écrits depuis, comme Training_EraseLastText_55C7B).
    struct TrainingStep {
        TrainingScreen screen;
        MISN_TRAINING settings;
        int group;
        size_t text_count;
    };

    SCState &GameState = SCState::getInstance();
    RLEShape title;
    RLEShape background;
    RLEShape board;
    PakArchive tm_pack;
    RSFont *font{ nullptr };

    TrainingScreen screen{ SCREEN_TYPE };
    MISN_TRAINING settings;
    int group{ 0 };
    std::vector<TrainingText> texts;
    std::vector<TrainingStep> history;
    // Choix noté par un bouton, appliqué après checkButtons (les boutons sont remplacés à chaque écran).
    bool choice_pending{ false };
    int choice{ 0 };

    void OnExitTraining();
    void showScreen(TrainingScreen next);
    void addButton(Point2D panel, int x, int y, int width, int height, int image, int value);
    int addText(int x, int y, const std::string &text);
    int textWidth(const std::string &text);
    void applyChoice(int value);
    void pushStep();
    void backup();
    void startFlight();
};

#endif /* defined(__libRealSpace__File__) */
```

### 3.8 `strike_commander/SCTrainingMenu.cpp` (entier)

```cpp
//
//  File.cpp
//  libRealSpace
//
//  Created by fabien sanglard on 1/28/2014.
//  Copyright (c) 2014 Fabien Sanglard. All rights reserved.
//
//  TRAINING MISSION d'OPTEST.EXE (ovr190) : Training_TypeScreen_5547D et les écrans qu'il ouvre. Positions, images de
//  TM.SHP et textes : strike_commander_re/analysis/TRAINING_MISSION.md § 3.
//

#include "precomp.h"

// Panneau du bas (WidgetPanel_Construct_DAEB : 308 × 42 en (6, 153) ; écran du type d'avion : 308 × 79 en (6, 116)).
static const Point2D PANEL_LOW = {
    6,
    153,
};
static const Point2D PANEL_HIGH = {
    6,
    116,
};
// Espace entre deux lettres de FrameBuffer::printText (version à 4 arguments).
static const int TEXT_LETTER_GAP = 2;

SCTrainingMenu::SCTrainingMenu() {
    this->music_playing = false;
}

SCTrainingMenu::~SCTrainingMenu() {
    for (auto button : this->buttons) {
        delete button;
    }
    this->buttons.clear();
    if (this->font != nullptr) {
        delete this->font;
        this->font = nullptr;
    }
}

void SCTrainingMenu::focus(void) {
    this->focused = true;
    if (!this->music_playing) {
        Mixer.switchBank(0);
        Mixer.playMusic(28);
        this->music_playing = true;
    }
    // Retour d'un vol d'entraînement : la mission n'a plus à être complétée, les écrans repartent du début.
    if (GameState.training_active) {
        GameState.training_active = false;
        this->settings = MISN_TRAINING();
        this->group = 0;
        this->texts.clear();
        this->history.clear();
        this->showScreen(SCREEN_TYPE);
    }
}

void SCTrainingMenu::unFocus(void) {
    this->focused = false;
    if (this->music_playing) {
        Mixer.stopMusic();
        this->music_playing = false;
    }
}

// Départ du vol, pour les deux types : MISSIONS\TEMPLATE.IFF, complété par RSMission::addTraining dans
// SCMission::loadMission. Le nom est gardé : EnhancedTrainingMenu le redéfinit pour lancer EnhancedStrike.
void SCTrainingMenu::OnSearchAndDestroy() {
    SCStrike *strike = new SCStrike();
    strike->init();
    strike->setMission("TEMPLATE.IFF");
    Game->addActivity(strike);
}

void SCTrainingMenu::OnExitTraining(void) {
    GameState.training_active = false;
    Game->stopTopActivity();
}

void SCTrainingMenu::init() {

    TreEntry *objViewPAK = Assets.GetEntryByName("..\\..\\DATA\\GAMEFLOW\\OBJVIEW.PAK");
    PakArchive assets;
    assets.InitFromRAM("OBJVIEW.PAK", objViewPAK->data, objViewPAK->size);

    // OBJVIEW.PAK : entrée 7 = palette, 6 = fond plein écran en (0, 0), 1 = bandeau « TRAINING MISSION » en (4, 3)
    // (Training_TypeScreen_5547D : `push 3` / `push 4` avant Shape_DrawSpans_32CD8).
    ByteStream paletteReader;
    paletteReader.Set(assets.GetEntry(7)->data, assets.GetEntry(7)->size);
    this->palette.ReadPatch(&paletteReader);

    PakEntry *backgroundPakEntry = assets.GetEntry(6);
    PakArchive bgPack;
    bgPack.InitFromRAM("OBJVIEW.PAK: file 6", backgroundPakEntry->data, backgroundPakEntry->size);
    background.init(bgPack.GetEntry(0)->data, bgPack.GetEntry(0)->size);

    PakEntry *titlePackEntry = assets.GetEntry(1);
    PakArchive titlePack;
    titlePack.InitFromRAM("", titlePackEntry->data, titlePackEntry->size);
    title.init(titlePack.GetEntry(0)->data, titlePack.GetEntry(0)->size);
    Point2D positionTitle = {
        4,
        3,
    };
    title.SetPosition(&positionTitle);

    // TM.SHP : les panneaux et les boutons de tous les écrans.
    TreEntry *trButtonsEntry = Assets.GetEntryByName("..\\..\\DATA\\GAMEFLOW\\TM.SHP");
    this->tm_pack.InitFromRAM("TM.SHP", trButtonsEntry->data, trButtonsEntry->size);

    // BWFONT.SHP : police chargée par Training_TypeScreen_5547D (absente de RSFontManager).
    TreEntry *fontEntry = Assets.GetEntryByName("..\\..\\DATA\\GAMEFLOW\\BWFONT.SHP");
    if (fontEntry != nullptr) {
        PakArchive fontPack;
        fontPack.InitFromRAM("BWFONT.SHP", fontEntry->data, fontEntry->size);
        this->font = new RSFont();
        this->font->InitFromPAK(&fontPack);
    }

    this->showScreen(SCREEN_TYPE);
}

// Un bouton : rectangle relatif au panneau, image normale `image`, image enfoncée `image + 1` (toutes les paires de
// TM.SHP se suivent), valeur rendue au clic. Le clic ne fait que noter la valeur : runFrame l'applique après
// checkButtons, car l'écran suivant remplace les boutons.
void SCTrainingMenu::addButton(Point2D panel, int x, int y, int width, int height, int image, int value) {
    SCButton *button = new SCButton();
    Point2D position = {
        panel.x + x,
        panel.y + y,
    };
    Point2D dimension = {
        width,
        height,
    };
    button->initBehavior(
        [this, value]() {
            this->choice_pending = true;
            this->choice = value;
        },
        position, dimension);
    button->appearance[SCButton::APR_UP].InitWithPosition(this->tm_pack.GetEntry(image)->data,
                                                          this->tm_pack.GetEntry(image)->size, &position);
    button->appearance[SCButton::APR_DOWN].InitWithPosition(this->tm_pack.GetEntry(image + 1)->data,
                                                            this->tm_pack.GetEntry(image + 1)->size, &position);
    this->buttons.push_back(button);
}

// Panneau et boutons de chaque écran (positions et images de TRAINING_MISSION.md § 3).
void SCTrainingMenu::showScreen(TrainingScreen next) {
    for (auto button : this->buttons) {
        delete button;
    }
    this->buttons.clear();
    this->screen = next;
    Point2D panel = PANEL_LOW;
    int panelImage = 0;
    switch (next) {
    case SCREEN_TYPE:
        panelImage = 0;
        this->addButton(panel, 16, 9, 136, 12, 1, 2);
        this->addButton(panel, 155, 9, 136, 12, 3, 1);
        this->addButton(panel, 155, 24, 65, 12, 5, CHOICE_CANCEL);
        break;
    case SCREEN_COUNT:
        panelImage = 7;
        for (int n = 0; n < 5; n++) {
            this->addButton(panel, 113 + 17 * n, 9, 14, 12, 8 + 2 * n, n + 1);
        }
        this->addButton(panel, 87, 24, 65, 12, 18, CHOICE_BACKUP);
        this->addButton(panel, 155, 24, 65, 12, 20, CHOICE_CANCEL);
        break;
    case SCREEN_PLANE: {
        panel = PANEL_HIGH;
        panelImage = 22;
        const int columns[4] = {
            9,
            77,
            145,
            235,
        };
        for (int n = 0; n < 16; n++) {
            this->addButton(panel, columns[n / 4], 7 + 13 * (n % 4), 65, 12, 23 + 2 * n, n + 1);
        }
        this->addButton(panel, 87, 61, 65, 12, 55, CHOICE_BACKUP);
        this->addButton(panel, 155, 61, 65, 12, 57, CHOICE_CANCEL);
        break;
    }
    case SCREEN_MORE:
        panelImage = 59;
        this->addButton(panel, 87, 9, 65, 12, 60, 1);
        this->addButton(panel, 155, 9, 65, 12, 62, 2);
        this->addButton(panel, 87, 24, 65, 12, 64, CHOICE_BACKUP);
        this->addButton(panel, 155, 24, 65, 12, 66, CHOICE_CANCEL);
        break;
    case SCREEN_ALTITUDE:
        panelImage = 68;
        for (int n = 0; n < 4; n++) {
            this->addButton(panel, 19 + 68 * n, 9, 65, 12, 69 + 2 * n, n + 1);
        }
        this->addButton(panel, 87, 24, 65, 12, 77, CHOICE_BACKUP);
        this->addButton(panel, 155, 24, 65, 12, 79, CHOICE_CANCEL);
        break;
    case SCREEN_LEVEL:
        panelImage = 81;
        for (int n = 0; n < 3; n++) {
            this->addButton(panel, 54 + 68 * n, 9, 65, 12, 82 + 2 * n, n + 1);
        }
        this->addButton(panel, 87, 24, 65, 12, 88, CHOICE_BACKUP);
        this->addButton(panel, 155, 24, 65, 12, 90, CHOICE_CANCEL);
        break;
    case SCREEN_ACCEPT:
        panelImage = 92;
        this->addButton(panel, 121, 9, 65, 12, 93, 1);
        this->addButton(panel, 87, 24, 65, 12, 95, CHOICE_BACKUP);
        this->addButton(panel, 155, 24, 65, 12, 97, CHOICE_CANCEL);
        break;
    }
    PakEntry *entry = this->tm_pack.GetEntry(panelImage);
    this->board.init(entry->data, entry->size);
    this->board.SetPosition(&panel);
}

// Largeur d'un texte écrit par FrameBuffer::printText, espace qui suit compris : x du texte écrit à sa suite.
int SCTrainingMenu::textWidth(const std::string &text) {
    if (this->font == nullptr || text.empty()) {
        return 0;
    }
    return VGA.getFrameBuffer()->getJustifiedTextWidth(this->font, text, TEXT_LETTER_GAP) + TEXT_LETTER_GAP;
}

// Training_PrintText_55BDC : texte écrit en (x, y), coin haut gauche. Renvoie le x qui suit le texte.
int SCTrainingMenu::addText(int x, int y, const std::string &text) {
    TrainingText line;
    line.position = {
        x,
        y,
    };
    line.text = text;
    this->texts.push_back(line);
    return x + this->textWidth(text);
}

// État avant un choix : rétabli par BACKUP sur l'écran suivant.
void SCTrainingMenu::pushStep() {
    TrainingStep step;
    step.screen = this->screen;
    step.settings = this->settings;
    step.group = this->group;
    step.text_count = this->texts.size();
    this->history.push_back(step);
}

// BACKUP : retour à l'écran précédent, avec les réglages et les textes d'avant son choix (dans le jeu, chaque écran
// est appelé par le précédent et rend 0 ; Training_EraseLastText_55C7B efface les textes de ce choix).
void SCTrainingMenu::backup() {
    if (this->history.empty()) {
        return;
    }
    TrainingStep step = this->history.back();
    this->history.pop_back();
    this->settings = step.settings;
    this->group = step.group;
    this->texts.resize(step.text_count);
    this->showScreen(step.screen);
}

void SCTrainingMenu::startFlight() {
    GameState.training = this->settings;
    GameState.training_active = true;
    this->OnSearchAndDestroy();
}

void SCTrainingMenu::applyChoice(int value) {
    if (value == CHOICE_CANCEL) {
        this->OnExitTraining();
        return;
    }
    if (value == CHOICE_BACKUP) {
        this->backup();
        return;
    }
    const char *levels[3] = {
        "rookie",
        "veteran",
        "ace",
    };
    int line = 67 + 12 * this->group;
    switch (this->screen) {
    case SCREEN_TYPE:
        this->pushStep();
        this->settings = MISN_TRAINING();
        this->settings.type = (uint8_t)value;
        this->group = 0;
        if (value == 1) {
            // Training_DogfightBriefing_58E2A
            this->addText(5, 43, "Mission Briefing: Air Superiority");
            this->addText(5, 55, "Intercept and engage inbound bogeys:");
            this->showScreen(SCREEN_COUNT);
        } else {
            // Training_SearchBriefing_58E74 : aucun réglage, validation directe.
            this->addText(5, 43, "Mission Briefing: Ground Attack");
            this->addText(5, 55, "Search and destroy enemy targets at");
            this->addText(5, 67, "pilot's discretion.  Refer to area");
            this->addText(5, 79, "map for enemy positions.");
            this->showScreen(SCREEN_ACCEPT);
        }
        break;
    case SCREEN_COUNT:
        this->pushStep();
        this->settings.group_count[this->group] = (uint8_t)value;
        this->addText(20, line, std::to_string(value));
        this->showScreen(SCREEN_PLANE);
        break;
    case SCREEN_PLANE: {
        this->pushStep();
        this->settings.group_plane[this->group] = (uint8_t)(value - 1);
        std::string name = RSMission::training_planes[value - 1].name;
        if (this->group == 2) {
            name += ".";
        }
        this->addText(30, line, name);
        if (this->group < 2) {
            this->showScreen(SCREEN_MORE);
        } else {
            this->addText(5, 103, "Altitude: ");
            this->showScreen(SCREEN_ALTITUDE);
        }
        break;
    }
    case SCREEN_MORE: {
        this->pushStep();
        int x = 30 + this->textWidth(RSMission::training_planes[this->settings.group_plane[this->group]].name);
        if (value == 1) {
            // MORE : « , » après le 1er groupe, « , and » après le 2e.
            this->addText(x, line, this->group == 1 ? ", and" : ",");
            this->group++;
            this->showScreen(SCREEN_COUNT);
        } else {
            // ENOUGH
            this->addText(x, line, ".");
            this->addText(5, 103, "Altitude: ");
            this->showScreen(SCREEN_ALTITUDE);
        }
        break;
    }
    case SCREEN_ALTITUDE:
        this->pushStep();
        // Training_AltitudeScreen_55C92 : choix × 10000 − 5000 pieds.
        this->settings.altitude_feet = value * 10000 - 5000;
        this->addText(5 + this->textWidth("Altitude: "), 103,
                      std::to_string(this->settings.altitude_feet) + " feet.");
        this->addText(5, 115, "Intelligence reports indicate ");
        this->showScreen(SCREEN_LEVEL);
        break;
    case SCREEN_LEVEL:
        this->pushStep();
        this->settings.pilot_level = (uint8_t)(value - 1);
        this->addText(5 + this->textWidth("Intelligence reports indicate "), 115,
                      std::string(levels[value - 1]) + " pilots.");
        this->showScreen(SCREEN_ACCEPT);
        break;
    case SCREEN_ACCEPT:
        // ACCEPT. Dans le jeu suivent le stock d'armes fixe et l'écran d'armement de la campagne
        // (Gameflow_WeaponLoadout_51AB3), pas repris ici : l'avion garde l'emport de son fichier.
        this->startFlight();
        break;
    }
}

void SCTrainingMenu::runFrame(void) {
    checkButtons();
    if (this->choice_pending) {
        this->choice_pending = false;
        this->applyChoice(this->choice);
    }

    VGA.activate();
    VGA.getFrameBuffer()->clear();

    VGA.setPalette(&this->palette);

    VGA.getFrameBuffer()->drawShape(&background);
    VGA.getFrameBuffer()->drawShape(&title);
    VGA.getFrameBuffer()->drawShape(&board);

    // Couleur 0 : les lettres gardent leurs couleurs (0 et 1 de la palette d'OBJVIEW.PAK, noir et gris clair).
    if (this->font != nullptr) {
        for (auto &line : this->texts) {
            VGA.getFrameBuffer()->printText(this->font, line.position, line.text, 0);
        }
    }

    drawButtons();

    Mouse.draw();

    VGA.vSync();
}
```

## 4. Essai

`tools/training_ref/training_mission_test.cpp` construit chaque mission deux fois et compare les deux `mission_data`
champ par champ (zones, `FLAG`, `CAST`, `PART`, `SCNE`, nombre de `PROG`, `TEAM`, `LOAD`, `SPOT`, monde) :

- en mémoire : `TEMPLATE.IFF` lu par `RSMission::InitFromRAM`, puis `RSMission::addTraining` ;
- par fichier : le `INSTANT.IFF` écrit par `tools/instant_mission.py` (même construction que
  `Training_BuildInstantMission_58EEA`), lu par `RSMission::InitFromRAM`.

```
sh tools/training_ref/build.sh <dossier libRealSpace> <DATA du jeu> [dossier de travail]
```

Résultat sur les 5 cas du script (SEARCH AND DESTROY ; 1 F-15 à 5000 pieds ; 2 MiG-29 et 1 TU-95 à 15000 pieds ;
3 groupes de 5 avions à 35000 pieds ; 3 Boeing 747 et 4 YF-23 à 25000 pieds) :

```
search.IFF : identique (3 objets PART, 13 zones, 14 scènes)
dog1.IFF : identique (4 objets PART, 14 zones, 15 scènes)
dog2.IFF : identique (6 objets PART, 14 zones, 15 scènes)
dog3.IFF : identique (18 objets PART, 14 zones, 15 scènes)
dog4.IFF : identique (10 objets PART, 14 zones, 15 scènes)
5 cas, 0 écarts
```

Les positions sont comparées à 4 mm près : `ByteStream::ReadFixedFloatLE` divise la partie fractionnaire d'un 24.8 par
255 au lieu de 256 (`static_cast<float>(integer_value & 0x000000FF) / 255.0f`), alors qu'`addTraining` calcule la
valeur exacte. L'écart est au plus de 255 / 65280 m (3,9 mm) ; à 1 mm près, seul le cas à 25 000 pieds passait (partie
fractionnaire de l'altitude 0,125).

Tout le jeu compile avec ces fichiers (`strike_commander/*.cpp`, `enhanced/*.cpp`, `DebugStrike.cpp`). Les écrans
de `SCTrainingMenu` n'ont pas été essayés à l'écran : la session n'a pas de quoi lancer le jeu.

## 5. Points ouverts

- `ByteStream::ReadFixedFloatLE` (et `ReadFixedFloatBE`, `ReadFixedFloat16LE`) : ÷ 255 au lieu de ÷ 256 pour la partie
  fractionnaire d'un 24.8. Hors du sujet de l'entraînement, non modifié ici ; l'effet sur une position est de quelques
  millimètres.
- Écran d'armement et stock fixe de l'entraînement (§ 2.1).
- Sens de la couleur 255 passée par le jeu au dessin du texte, et espacement exact des lettres de `BWFONT.SHP`
  (dessin du texte d'OPTEST non lu).
- Altitude de la zone « Destroy bogeys » : le nombre de pieds tel quel, alors que celle des avions est convertie ; repris
  tel quel du jeu (`TRAINING_MISSION.md` § 6.3).
