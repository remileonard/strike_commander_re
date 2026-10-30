# Objets de mission (chunk `PART`) : correction proposée pour libRealSpace

Ce document accompagne les fichiers de libRealSpace modifiés, rangés sous leur chemin d'origine dans
`tools/mission_ref/librealspace/src/` (avec les modifications des zones et des scènes, `IMPL_MISSION_AREAS.md`).
Il donne le sens des champs « inconnus » de `MISN_PART`, la lecture exacte de l'enregistrement, et ce que
libRealSpace en fait : vitesse initiale, camp, allié par défaut, poste en formation.
Repère de libRealSpace (Y = altitude), mètres, nombres en décimal.

## 1. L'enregistrement PART (62 octets)

Chargé par `PartEntry_AllocateArray_AA23D` puis `PartEntry_LoadAndResolveNames_A9E3C` ; utilisé à
l'activation par `PartEntry_ResolveSpawnPositionAndActivate_51EDC`.

| Octets | Type | Contenu | Champ libRealSpace |
|---|---|---|---|
| 0-1 | uint16 | index dans CAST | `id` |
| 2-9 | char[8] | type d'objet | `member_name` |
| 10-17 | char[8] | type une fois détruit | `member_name_destroyed` |
| 18-25 | char[8] | emport imposé (`OBJECTS\<nom>.IFF`, FORM WEAP) | `weapon_load` |
| 26-27 | uint16 | index de zone AREA, 65535 = aucune | `area_id` (255 = aucune) ; octet 27 dans `unknown1` |
| 28 | uint8 | mode de placement : 0 = décalage depuis la zone, autre = repère de l'avion du joueur | **`placement`** (0 ou 1) ; `unknown2` garde la même valeur |
| 29-40 | 3 × int32 24.8 | décalage, composantes c0, c1, c2 (÷ 256 = m) | `position` : x = c0, y = c2, z = −c1 ; octet 40 dans `unknown3` |
| 41-42 | int16 | cap (degrés) | `azymuth` |
| 43-44 | int16 | **vitesse initiale**, m/s, le long du nez ; 0 = à l'arrêt | **`speed`** |
| 45 | uint8 | **camp** : 1 = allié, 255 = ennemi | **`team`** |
| 46 | uint8 | **allié par défaut** (index PART), 255 = aucun | **`follow_ally`** |
| 47 | uint8 | pas recopié par le chargeur ; rôle non établi | — |
| 48-53 | 3 × int16 | **poste en formation** (côté, avant, haut), m | **`formation_side`**, **`formation_ahead`**, **`formation_up`** |
| 54-61 | 4 × uint16 | scripts PROG : activation, mise à jour, destruction, début de mission | `on_is_activated` … `on_missions_init` |

`unknown_bytes` garde les octets 43 à 53 tels quels : aucun lecteur actuel ne change.

### 1.1 Ce que le jeu fait de ces champs à l'activation

Tout se passe dans `PartEntry_ResolveSpawnPositionAndActivate_51EDC` (seg114), quand l'objet est créé :

- **Vitesse** : elle est passée à `AIAircraft_SpawnAndConditionalLoadProfile_53363`
  (`push word ptr es:[bx+2Fh]`), qui donne à l'objet la vitesse nez × vitesse, en m/s.
  Puis, pour un avion (catégorie 6) de vitesse nulle :
  ```
  cmp     al, 6
  cmp     word ptr es:[bx+2Fh], 0
  mov     [bx+20h], al        ; dynamique : au sol (1)
  or      byte ptr [bx+75h], 4 ; JDYN : train sorti
  ```
- **Camp** : recopié dans l'instance (`mov al, es:[bx+31h]` / `mov [bx+50h], al`), à la place du camp du
  modèle. Les compteurs d'objets apparus par camp ne comptent que 255 et 1 (`cmp byte ptr es:[bx+31h], 0FFh` /
  `cmp byte ptr es:[bx+31h], 1`).
- **Allié par défaut** : l'allié est cherché par son index (`Expr_LookupNamedValue_52DDB`), puis l'ordre
  natif 179 lui est passé (`push 0B3h` / `call dword ptr [bx+88h]`). Dans `Goal_SetObjective_A307`, le cas 179 :
  ```
  add     ax, 145h
  call    SetReference          ; chef = l'allié
  mov     byte ptr es:[bx+149h], 0
  jmp     short loc_A641
  ```
  Il range l'allié dans le **même champ que l'ordre `OP_SET_OBJ_FOLLOW_ALLY`** (le chef), mais **ne change pas
  l'ordre en cours** (`+0x11D` n'est pas écrit) et **ne pose pas le poste en formation** (`+0x14A` à `+0x152`,
  écrits seulement par `OP_SET_OBJ_FOLLOW_ALLY`). L'objet ne se met donc pas à suivre son allié à l'activation :
  il le connaît comme chef, et c'est un `OP_SET_OBJ_FOLLOW_ALLY` du script qui donne l'ordre de suivre.
  Ce champ chef est lu par beaucoup d'autres fonctions de l'IA (`Goal_FollowAllyFormation`,
  `Goal_TransferToWingman`, `Escort_LeaderSuccession`, `Formation_GuidanceSolution`…) ; leur usage quand l'ordre
  en cours n'est pas `OP_SET_OBJ_FOLLOW_ALLY` n'a pas été lu.

**Correction de ma réponse précédente** : j'avais écrit que l'ordre de suivre était donné à l'activation. C'est
faux : l'activation pose seulement le chef. libRealSpace n'a pas de champ « chef » distinct de l'ordre en cours ;
il retrouve l'allié par défaut dans `follow_ally` quand le script donne `OP_SET_OBJ_FOLLOW_ALLY` avec 255, ce qui
donne le même allié que le jeu. Rien n'est donc ajouté à l'activation pour l'allié.

## 2. Les fichiers modifiés et le code de chaque changement

| Fichier | Changement |
|---|---|
| `realspace/RSMission.h` | champs nommés dans `MISN_PART` |
| `realspace/RSMission.cpp` | `parseMISN_PART` : lecture exacte, champs nommés |
| `strike_commander/SCMission.cpp` | `loadMission` : camp lu dans `team`, vitesse initiale et départ au sol |
| `strike_commander/SCMissionScene.cpp` | `activate` : départ au sol d'après la vitesse |
| `strike_commander/SCMissionActors.cpp` | `activateTarget` : départ au sol d'après la vitesse |
| `strike_commander/SCProg.cpp` | `OP_SET_OBJ_FOLLOW_ALLY` : allié par défaut et poste lus dans les champs nommés |

### 2.1 `RSMission.h` — `MISN_PART`

Les anciens champs restent (le débogueur `DebugStrike` les affiche) ; les champs nommés s'ajoutent.

```cpp
struct MISN_PART {
    uint8_t id{0};
    std::string member_name;
	std::string member_name_destroyed;
	std::string weapon_load;
	uint8_t area_id{0};      
    uint8_t unknown1{0};
    int16_t unknown2{0};
    Vector3D position{0, 0, 0};
    uint8_t unknown3{0};
    uint16_t azymuth{0};
    uint16_t roll{0};
    uint16_t pitch{0};
    std::vector<uint8_t> progs_id;
    
    uint8_t on_is_activated{255};
    uint8_t on_mission_update{255};
    uint8_t on_is_destroyed{255};
    uint8_t on_missions_init{255};

    // Champs nommés (PartEntry_LoadAndResolveNames_A9E3C) ; unknown2 et unknown_bytes gardent les mêmes octets.
    uint8_t placement{0};       // octet 28 : 0 = décalage depuis la zone, 1 = repère de l'avion du joueur
    int16_t speed{0};           // octets 43-44 : vitesse initiale le long du nez, 0 = à l'arrêt
    uint8_t team{0};            // octet 45 : camp, 1 = allié, 255 = ennemi
    uint8_t follow_ally{255};   // octet 46 : allié par défaut (index PART), 255 = aucun ; OP_SET_OBJ_FOLLOW_ALLY 255 le désigne
    int16_t formation_side{0};  // octets 48-49 : poste en formation, m
    int16_t formation_ahead{0}; // octets 50-51
    int16_t formation_up{0};    // octets 52-53

    std::vector<uint8_t> unknown_bytes;
    RSEntity *entity{nullptr};
    bool alive{true};
};
```

### 2.2 `RSMission.cpp` — `parseMISN_PART`

Ce qui change par rapport à l'ancienne lecture :
- chaque enregistrement est lu dans son propre `ByteStream` de 62 octets ;
- l'index de zone est lu sur 16 bits (65535 → 255, comme avant) ;
- le décalage est lu en 3 × int32 ÷ 256. L'ancienne lecture commençait un octet trop loin (`unknown2` prenait
  l'octet 29, premier octet de c0) et `ReadInt24LE` gardait les 3 octets suivants : elle donnait la partie
  entière des mètres pour x et z, et pour l'altitude les 16 bits bas de la partie entière. Sur les 72 missions,
  les deux lectures donnent les mêmes mètres entiers (essai, § 3) ; la nouvelle garde les fractions de mètre ;
- `unknown2` vaut 0 ou 1 : le jeu traite toute valeur non nulle de l'octet 28 comme « repère du joueur »
  (`cmp byte ptr es:[bx+1Ch], 0`).

```cpp
// Chunk PART (PartEntry_AllocateArray_AA23D, PartEntry_LoadAndResolveNames_A9E3C) : enregistrements de 62 octets.
//   0  uint16  index CAST              26  uint16  index AREA (65535 = aucune)   45  uint8   camp
//   2  char[8] type d'objet            28  uint8   mode de placement             46  uint8   allié suivi
//  10  char[8] type une fois détruit   29  3 int32 24.8 : décalage X, Z, Y       47  uint8   non recopié
//  18  char[8] emport                  41  int16   cap (degrés)                  48  3 int16 poste en formation
//                                      43  int16   vitesse initiale              54  4 uint16 scripts PROG
void RSMission::parseMISN_PART(uint8_t *data, size_t size) {
    size_t numParts = size / 62;
    for (size_t i = 0; i < numParts; i++) {
        ByteStream stream(data + i * 62, 62);
        MISN_PART *prt = new MISN_PART();
        prt->id = (uint8_t) stream.ReadUShort();
        prt->member_name = stream.ReadString(8);
        std::transform(prt->member_name.begin(), prt->member_name.end(), prt->member_name.begin(), ::toupper);
        prt->member_name_destroyed = stream.ReadString(8);
        std::transform(prt->member_name_destroyed.begin(), prt->member_name_destroyed.end(), prt->member_name_destroyed.begin(), ::toupper);
        prt->weapon_load = stream.ReadString(8);
        std::transform(prt->weapon_load.begin(), prt->weapon_load.end(), prt->weapon_load.begin(), ::toupper);

        // Index de zone sur 16 bits (PtrList_GetAt_53034) ; 255 = aucune, comme avant.
        uint16_t area_index = stream.ReadUShort();
        prt->area_id = area_index >= 255 ? 255 : (uint8_t) area_index;
        prt->unknown1 = (uint8_t) (area_index >> 8);
        // Mode de placement : 0 = zone, toute autre valeur = repère du joueur (cmp byte ptr es:[bx+1Ch], 0).
        prt->placement = stream.ReadByte() != 0 ? 1 : 0;
        prt->unknown2 = prt->placement;
        // Décalage : 3 int32 24.8 (÷ 256 = mètres), dans l'ordre c0, c1, c2 ; libRealSpace x = c0, y = c2, z = -c1.
        // Division en double : un int32 converti en float perd ses derniers bits au-delà de 65 km.
        float c0 = (float) (stream.ReadInt32LE() / 256.0);
        float c1 = (float) (stream.ReadInt32LE() / 256.0);
        int32_t raw_c2 = stream.ReadInt32LE();
        float c2 = (float) (raw_c2 / 256.0);
        prt->unknown3 = (uint8_t) ((uint32_t) raw_c2 >> 24);
        prt->position = Vector3D(c0 * BLOCK_COORD_SCALE, c2 * HEIGH_MAP_SCALE, -c1 * BLOCK_COORD_SCALE);
        prt->azymuth = stream.ReadUShort();

        // unknown_bytes : les octets 43 à 53, gardés tels quels pour les lecteurs actuels.
        for (int k = 0; k < 11; k++) {
            prt->unknown_bytes.push_back(data[i * 62 + 43 + k]);
        }
        prt->speed = stream.ReadShort();
        prt->team = stream.ReadByte();
        prt->follow_ally = stream.ReadByte();
        stream.ReadByte();
        prt->formation_side = stream.ReadShort();
        prt->formation_ahead = stream.ReadShort();
        prt->formation_up = stream.ReadShort();

        for (int k = 0; k < 4; k++) {
            prt->progs_id.push_back(stream.ReadByte());
            stream.ReadByte();
        }
        prt->on_is_activated = prt->progs_id[0];
        prt->on_mission_update = prt->progs_id[1];
        prt->on_is_destroyed = prt->progs_id[2];
        prt->on_missions_init = prt->progs_id[3];
        prt->entity = nullptr;
        this->mission_data.parts.push_back(prt);
    }
}
```

### 2.3 `SCMission.cpp` — `loadMission`

Deux changements dans cette fonction ; le reste est inchangé (fichier complet dans l'archive).

Le camp :

```cpp
actor->team_id = part->team;
```

La création d'un avion piloté par l'IA, depuis la ligne `actor->plane->pilot = actor;` : avant, l'avion était
posé au sol s'il était à moins de 10 m du terrain, et partait sinon à la vitesse de croisière du modèle
(`ai_speed_cruise`). Maintenant, comme le jeu : vitesse nulle = au sol, train sorti ; sinon la vitesse du fichier
le long du nez. Le recalage sur le terrain à moins de 10 m et le cas « sous le terrain » sont gardés.

```cpp
// Vitesse initiale PART (octets 43-44, m/s) : un avion à 0 commence au sol, train sorti
// (PartEntry_ResolveSpawnPositionAndActivate_51EDC : catégorie 6 et vitesse nulle -> au sol, JDYN +0x75 |= 4).
if (abs(this->area->getY(part->position.x, part->position.z)-part->position.y) <= 10 ) {
    part->position.y = this->area->getY(part->position.x, part->position.z);
}
actor->plane->on_ground = part->speed == 0;
if (part->position.y < this->area->getY(part->position.x, part->position.z)) {
    actor->plane->on_ground = true;
}
if (actor->plane->on_ground) {
    if (actor->plane->GetWheel() == 0) {
        actor->plane->SetWheel();
    }
}
if (!actor->plane->on_ground) {
    actor->plane->SetThrottle(100);
    actor->pilot->target_climb = (int) (part->position.y);
    actor->plane->vz = -20;
    // Vitesse le long du nez (AIAircraft_SpawnAndConditionalLoadProfile_53363 : nez × vitesse).
    float spawn_yaw = tenthOfDegreeToRad(actor->plane->yaw);
    float spawn_speed = (float) part->speed;
    actor->plane->velocity = Vector3D(-sinf(spawn_yaw) * spawn_speed, 0.0f, -cosf(spawn_yaw) * spawn_speed);
    actor->pilot->target_azimut = actor->plane->azimuthf / 10.0f;
    actor->pilot->target_speed = -20;
} else {
    actor->plane->SetThrottle(0);
    actor->pilot->target_climb = 0;
    actor->plane->vz = 0;
    actor->pilot->target_azimut = actor->plane->azimuthf / 10.0f;
    actor->pilot->target_speed = 0;
}
actor->pilot->plane = actor->plane;
```

### 2.4 `SCMissionScene.cpp` — `activate`

Même règle quand la scène fait apparaître l'objet : `on_ground` vient de la vitesse, plus de la distance au
terrain (le recalage à moins de 10 m reste).

```cpp
void SCMissionScene::activate() {
    MISN_SCEN *scene = this->scene;
    RSMission *mission = this->mission->mission;
    SCMission *sc_mission = this->mission;
    for (auto cast: scene->cast) {
        int i=0;
        for (auto part: mission->mission_data.parts) {
            if (i == cast) {
                for (auto actor: sc_mission->actors) {
                    if (actor->actor_name == "PLAYER") {
                        continue;
                    }
                    if (actor->actor_id == part->id && actor->is_active == false) {
                        actor->is_active = true;
                        actor->is_hidden = false;
                        if (scene->area_id != -1) {
                            Vector3D correction;
                            if (actor->object->unknown2 == 0) {
                                correction = sc_mission->mission->mission_data.areas[scene->area_id]->position;
                            } else if (actor->object->unknown2 == 1) {
                                correction = {
                                    sc_mission->player->plane->x,
                                    sc_mission->player->plane->y,
                                    sc_mission->player->plane->z
                                };
                            }
                            if (actor->object->area_id != 255) {
                                actor->object->position += correction;
                            }
                            float ground_y = sc_mission->area->getY(actor->object->position.x, actor->object->position.z);
                            
                            if (actor->plane != nullptr) {
                                actor->plane->on_ground = false;
                                actor->plane->x = actor->object->position.x;
                                actor->plane->y = actor->object->position.y;
                                actor->plane->z = actor->object->position.z;
                                if (abs(ground_y - actor->object->position.y) <= 10 ) {
                                    actor->object->position.y = ground_y;
                                }
                                // Vitesse initiale nulle : au sol, train sorti (PartEntry_ResolveSpawnPositionAndActivate_51EDC).
                                actor->plane->on_ground = actor->object->speed == 0;
                                if (actor->plane->on_ground) {
                                    if (actor->plane->GetWheel() == 0) {
                                        actor->plane->SetWheel();
                                    }
                                }
                                if (actor->object->position.y < ground_y) {
                                    actor->plane->position.y += ground_y;
                                }
                            } else if (actor->object->position.y < ground_y) {
                                actor->object->position.y = ground_y;
                            }
                        }
                        
                        // Shared_TriggerExprInstruction_5247D : minuteur WAIT (+0x3A) remis a zero a l'activation
                        actor->wait_timer = 0.0f;
                        if (actor->on_is_activated.size() > 0) {
                            SCProg *p = new SCProg(actor, actor->on_is_activated, sc_mission, actor->object->on_is_activated);
                            p->execute();
                            delete p;
                        }
                        if (actor->object->entity->entity_type == EntityType::rnwy) {
                            for (auto runway: sc_mission->area->objectOverlay) {
                                Vector3D pos = actor->object->position;
                                
                                // Vérifier si la position de l'objet est à l'intérieur de la piste
                                if (pos.x >= runway.lx && pos.x <= runway.hx && 
                                    pos.z >= runway.ly && pos.z <= runway.hy) {
                                    
                                    // Calculer les dimensions de la piste
                                    float width = (float)std::abs(runway.lx - runway.hx); 
                                    float length = (float)std::abs(runway.ly - runway.hy);
                                    
                                    // Calculer l'orientation (angle) de la piste
                                    float angle = (float)std::atan2(runway.ly - runway.hy, 
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
                        break;
                    }
                }
                break;
            }
            i++;
        }
    }
    this->runProg(scene->on_is_activated);
    scene->has_been_activated = 1;
}
```

### 2.5 `SCMissionActors.cpp` — `activateTarget`

Même règle pour `OP_ACTIVATE_OBJ` : un avion de vitesse nulle reste au sol (ni consigne de montée ni `vz`),
train sorti.

```cpp
bool SCMissionActors::activateTarget(uint8_t arg) {
    for (auto actor: this->mission->actors) {
        if (actor->actor_id == arg && actor->is_active == false && actor->is_destroyed == false) {
            actor->is_active = true;
            actor->is_hidden = false;
            Vector3D correction = {0.0f, 0.0f, 0.0f};
            if (actor->object->area_id != 255 && actor->object->unknown2 == 0) {
                bool spot_found = false;
                for (auto spot: this->mission->mission->mission_data.spots) {
                    if (spot->area_id == actor->object->area_id) {
                        correction = spot->position;
                        spot_found = true;
                        break;
                    }
                }
                if (!spot_found) {
                    correction = this->mission->mission->mission_data.areas[actor->object->area_id]->position;
                }
            } else {
                correction = {
                    this->mission->player->plane->x,
                    this->mission->player->plane->y,
                    this->mission->player->plane->z
                };
            }
            if ((actor->object->area_id != 255) || (actor->object->area_id == 255 && actor->object->unknown2 == 1)) {
                actor->object->position += correction;
            }
            float ground_y = this->mission->area->getY(actor->object->position.x, actor->object->position.z);
            if (actor->object->position.y < ground_y) {
                actor->object->position.y = ground_y;
            } else {
                // Vitesse initiale nulle : l'avion reste au sol (PartEntry_ResolveSpawnPositionAndActivate_51EDC).
                if (actor->plane != nullptr && actor->object->speed != 0) {
                    actor->pilot->target_climb = (int) (actor->object->position.y);
                    actor->pilot->target_speed = -20;
                    actor->plane->vz = -20;
                }
            }
            if (actor->plane != nullptr) {
                if (actor->object->position.y <= ground_y) {
                    actor->object->position.y = ground_y+10.0f;
                    actor->plane->on_ground = true;
                } else {
                    actor->plane->on_ground = actor->object->speed == 0;
                }
                if (actor->plane->on_ground) {
                    if (actor->plane->GetWheel() == 0) {
                        actor->plane->SetWheel();
                    }
                }
                actor->plane->x = actor->object->position.x;
                actor->plane->y = actor->object->position.y;
                actor->plane->z = actor->object->position.z;
            }
            if (actor->plane == nullptr) {
                if (actor->object->position.y > ground_y) {
                    actor->object->position.y = ground_y+2.0f;
                } else if (actor->object->position.y < ground_y) {
                    actor->object->position.y = ground_y+2.0f;
                }
            }
            actor->wait_timer = 0.0f;
            if (actor->on_is_activated.size() > 0) {
                SCProg *p = new SCProg(actor, actor->on_is_activated, this->mission, actor->object->on_is_activated);
                p->execute();
            }
            if (actor->object->entity->entity_type == EntityType::rnwy) {
                for (auto runway: this->mission->area->objectOverlay) {
                    Vector3D pos = actor->object->position;
                    
                    // Vérifier si la position de l'objet est à l'intérieur de la piste
                    if (pos.x >= runway.lx && pos.x <= runway.hx && 
                        pos.z >= runway.ly && pos.z <= runway.hy) {
                        
                        // Calculer les dimensions de la piste
                        float width = (float)std::abs(runway.lx - runway.hx); 
                        float length = (float)std::abs(runway.ly - runway.hy);
                        
                        // Calculer l'orientation (angle) de la piste
                        float angle = (float)std::atan2(runway.ly - runway.hy, 
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
            return true;
        }
    }
    return false;
}
```

### 2.6 `SCProg.cpp` — `OP_SET_OBJ_FOLLOW_ALLY`

Seul ce cas de `SCProg::execute` change : il lit les champs nommés au lieu de `unknown_bytes[3]` et
`unknown_bytes[5..10]`. Le comportement est le même.

```cpp
case OP_SET_OBJ_FOLLOW_ALLY: {
    // MissionScript_CallNativeHandler_52513 cas 0xAA : 0xFF = allie par defaut (PART octet 46),
    // poste = mots PART 48/50/52 (cote, avant, haut)
    uint8_t leader_arg = (uint8_t) prog.arg;
    MISN_PART *part = this->actor->object;
    if (leader_arg == 0xFF && part != nullptr) {
        leader_arg = part->follow_ally;
    }
    this->task_state = this->actor->setObjective(OP_SET_OBJ_FOLLOW_ALLY, leader_arg) ? 1 : 0;
    if (part != nullptr && this->actor->current_command == OP_SET_OBJ_FOLLOW_ALLY && this->actor->current_command_arg == leader_arg) {
        this->actor->follow_slot = Vector3D((float) part->formation_side, (float) part->formation_ahead, (float) part->formation_up);
        this->actor->follow_slot_set = true;
    }
}
break;
```

## 3. Essai

`tools/mission_ref/mission_part_test.cpp` (compilé par `tools/mission_ref/build.sh`) lit chaque mission avec
`RSMission` modifié et compare chaque champ nommé aux octets du fichier :

```
1063 enregistrements PART, 0 erreurs
position : 2 écarts d'au moins 1 m avec l'ancienne lecture
placement 0 : 772
placement 1 : 291
camp 0 : 48
camp 1 : 271
camp 255 : 738
vitesse nulle : 626 ; allié par défaut renseigné : 190
```

Les 2 écarts de position et 6 valeurs de camp hors de 0, 1 et 255 viennent de `BASIC.IFF` et `GAME.IFF`, dont le
chunk PART n'a pas la mise en page de 62 octets (noms comme `16grayNO`, valeurs sans sens). Sur les autres
missions : aucun écart. Tous les fichiers de `strike_commander/` et le débogueur compilent ; l'essai des zones
(`mission_areas_test`) donne toujours 245 zones sur 245.

Exemples : les `F-16DES` de MISN-10A sont à vitesse nulle à 1 625 m d'altitude, à côté de `STRIBASE`
(1 620 m) : au sol sur la base. Les `F-18` de MISN-10A et MISN-11A sont en repère du joueur, décalage nul en
altitude, à 300 m/s.

## 4. Points ouverts

- **Rotation en repère du joueur** : avec le mode 1, le jeu tourne le décalage selon le cap du joueur, et le cap
  de l'objet devient cap du joueur + cap du fichier. libRealSpace ajoute la position du joueur sans rotation.
  Pas modifié ici.
- **Train d'un avion en vol** : le jeu sort le train pour une vitesse nulle ; ce qu'il fait du train pour un avion
  qui part en vol n'a pas été lu. `SCPlane` sort le train à la création (`wheels = 1`) ; ce n'est pas modifié.
- **Ordre des axes du poste en formation** : `follow_slot` est construit (côté, avant, haut) comme avant ; l'usage
  de chaque composante dans le suivi n'a pas été revérifié.
- **Octet 47** : pas recopié par le chargeur, rôle non établi.
