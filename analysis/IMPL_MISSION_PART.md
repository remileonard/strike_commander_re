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
| 26-27 | uint16 | index de zone AREA, 65535 = aucune | `area_id` (255 = aucune) |
| 28 | uint8 | mode de placement : 0 = décalage depuis la zone, autre = repère de l'avion du joueur | **`placement`** (0 ou 1) |
| 29-40 | 3 × int32 24.8 | décalage, composantes c0, c1, c2 (÷ 256 = m) | `position` : x = c0, y = c2, z = −c1 |
| 41-42 | int16 | cap (degrés) | `azymuth` |
| 43-44 | int16 | **vitesse initiale**, m/s, le long du nez ; 0 = à l'arrêt | **`speed`** |
| 45 | uint8 | **camp** : 1 = allié, 255 = ennemi | **`team`** |
| 46 | uint8 | **allié par défaut** (index PART), 255 = aucun | **`follow_ally`** |
| 47 | uint8 | pas recopié par le chargeur ; rôle non établi | — |
| 48-53 | 3 × int16 | **poste en formation** (côté, avant, haut), m | **`formation_side`**, **`formation_ahead`**, **`formation_up`** |
| 54-61 | 4 × uint16 | scripts PROG : activation, mise à jour, destruction, début de mission | `on_is_activated` … `on_missions_init` |

Les anciens champs `unknown1`, `unknown2`, `unknown3` et `unknown_bytes` sont supprimés : chacun n'était qu'un
morceau mal découpé d'un champ maintenant nommé (§ 2.1). Leurs lecteurs lisent les champs nommés (§ 2.8).

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
| `realspace/RSMission.h` | champs nommés dans `MISN_PART`, décalage et cap tels que lus (`relative_position`, `relative_azymuth`) |
| `realspace/RSMission.cpp` | `parseMISN_PART` : lecture exacte, champs nommés |
| `strike_commander/SCMission.h` | déclaration de `placeRelativeToPlayer` |
| `strike_commander/SCMission.cpp` | `loadMission` : camp lu dans `team`, vitesse initiale et départ au sol, cap du joueur en dixièmes de degré ; nouvelle `placeRelativeToPlayer` |
| `strike_commander/SCMissionScene.cpp` | `activate` : départ au sol d'après la vitesse, placement dans le repère du joueur |
| `strike_commander/SCMissionActors.cpp` | `activateTarget` : départ au sol d'après la vitesse, placement dans le repère du joueur |
| `strike_commander/SCProg.cpp` | `OP_SET_OBJ_FOLLOW_ALLY` : allié par défaut et poste lus dans les champs nommés |
| `pacific_strike/PSMission.cpp` | `placement` et `team` au lieu de `unknown2` et `unknown_bytes[2]` (§ 2.8) |
| `executables/debugger/DebugStrike.cpp` | affichage des champs nommés au lieu des `unknown` (§ 2.8) |
| `realspace/RSMission.h`, `RSMission.cpp` | chunks `LOAD` et `CACH` (§ 5) |

### 2.1 `RSMission.h` — `MISN_PART`

Les champs `unknown1` (octet 27, partie haute de l'index de zone), `unknown2` (mode de placement, lu avec le
1er octet du décalage), `unknown3` (octet 40, octet de poids fort du décalage en altitude) et `unknown_bytes`
(octets 43 à 53) sont supprimés et remplacés par les champs nommés.
`relative_position` et `relative_azymuth` gardent le décalage et le cap du fichier : `position` et `azymuth` sont
réécrits à l'activation, et le placement dans le repère du joueur doit repartir des valeurs du fichier à chaque fois.

```cpp
struct MISN_PART {
    uint8_t id{0};
    std::string member_name;
	std::string member_name_destroyed;
	std::string weapon_load;
	uint8_t area_id{0};      
    Vector3D position{0, 0, 0};
    uint16_t azymuth{0};
    uint16_t roll{0};
    uint16_t pitch{0};
    std::vector<uint8_t> progs_id;
    
    uint8_t on_is_activated{255};
    uint8_t on_mission_update{255};
    uint8_t on_is_destroyed{255};
    uint8_t on_missions_init{255};

    // Champs lus par PartEntry_LoadAndResolveNames_A9E3C.
    uint8_t placement{0};       // octet 28 : 0 = décalage depuis la zone, 1 = repère de l'avion du joueur
    int16_t speed{0};           // octets 43-44 : vitesse initiale le long du nez, 0 = à l'arrêt
    uint8_t team{0};            // octet 45 : camp, 1 = allié, 255 = ennemi
    uint8_t follow_ally{255};   // octet 46 : allié par défaut (index PART), 255 = aucun ; OP_SET_OBJ_FOLLOW_ALLY 255 le désigne
    int16_t formation_side{0};  // octets 48-49 : poste en formation, m
    int16_t formation_ahead{0}; // octets 50-51
    int16_t formation_up{0};    // octets 52-53 ; l'octet 47 n'est pas recopié par le chargeur, rôle non établi
    // Décalage et cap tels que lus, jamais modifiés : le placement dans le repère du joueur repart d'eux à chaque activation.
    Vector3D relative_position;
    uint16_t relative_azymuth{0};

    RSEntity *entity{nullptr};
    bool alive{true};
};
```

### 2.2 `RSMission.cpp` — `parseMISN_PART`

Ce qui change par rapport à l'ancienne lecture :
- chaque enregistrement est lu dans son propre `ByteStream` de 62 octets ;
- l'index de zone est lu sur 16 bits (65535 → 255, comme avant) ;
- le décalage est lu en 3 × int32 ÷ 256. L'ancienne lecture commençait un octet trop loin (l'ancien `unknown2`
  prenait l'octet 29, premier octet de c0) et `ReadInt24LE` gardait les 3 octets suivants : elle donnait la partie
  entière des mètres pour x et z, et pour l'altitude les 16 bits bas de la partie entière. Sur les 72 missions,
  les deux lectures donnent les mêmes mètres entiers (essai, § 3) ; la nouvelle garde les fractions de mètre ;
- `placement` vaut 0 ou 1 : le jeu traite toute valeur non nulle de l'octet 28 comme « repère du joueur »
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

        // Index de zone sur 16 bits (PtrList_GetAt_53034) ; 65535 dans le fichier, 255 ici = aucune.
        uint16_t area_index = stream.ReadUShort();
        prt->area_id = area_index >= 255 ? 255 : (uint8_t) area_index;
        // Mode de placement : 0 = zone, toute autre valeur = repère du joueur (cmp byte ptr es:[bx+1Ch], 0).
        prt->placement = stream.ReadByte() != 0 ? 1 : 0;
        // Décalage : 3 int32 24.8 (÷ 256 = mètres), dans l'ordre c0, c1, c2 ; libRealSpace x = c0, y = c2, z = -c1.
        // Division en double : un int32 converti en float perd ses derniers bits au-delà de 65 km.
        float c0 = (float) (stream.ReadInt32LE() / 256.0);
        float c1 = (float) (stream.ReadInt32LE() / 256.0);
        float c2 = (float) (stream.ReadInt32LE() / 256.0);
        prt->position = Vector3D(c0 * BLOCK_COORD_SCALE, c2 * HEIGH_MAP_SCALE, -c1 * BLOCK_COORD_SCALE);
        prt->azymuth = stream.ReadUShort();
        prt->relative_position = prt->position;
        prt->relative_azymuth = prt->azymuth;

        prt->speed = stream.ReadShort();
        prt->team = stream.ReadByte();
        prt->follow_ally = stream.ReadByte();
        // Octet 47 : pas recopié par le chargeur, rôle non établi.
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
terrain (le recalage à moins de 10 m reste). Un objet de mode de placement non nul est placé par
`placeRelativeToPlayer` (§ 2.7), même dans la scène globale (sans zone) et même sans zone propre : le jeu teste le
mode avant tout (`cmp byte ptr es:[bx+1Ch], 0`). Avant, la position du joueur était ajoutée sans rotation, et
seulement si l'objet avait une zone.

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
                        // Le mode de placement ne dépend ni de la zone de l'objet ni de celle de la scène.
                        if (scene->area_id != -1 || actor->object->placement != 0) {
                            if (actor->object->placement != 0) {
                                // Repère de l'avion du joueur : décalage tourné, cap = cap du joueur + cap du fichier.
                                sc_mission->placeRelativeToPlayer(actor);
                            } else if (actor->object->area_id != 255) {
                                actor->object->position += sc_mission->mission->mission_data.areas[scene->area_id]->position;
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
train sorti. Mode de placement non nul : `placeRelativeToPlayer` (§ 2.7) au lieu de l'ajout de la position du
joueur ; mode 0 : la zone (ou le `SPOT` de la zone) comme avant.

```cpp
bool SCMissionActors::activateTarget(uint8_t arg) {
    for (auto actor: this->mission->actors) {
        if (actor->actor_id == arg && actor->is_active == false && actor->is_destroyed == false) {
            actor->is_active = true;
            actor->is_hidden = false;
            Vector3D correction = {0.0f, 0.0f, 0.0f};
            if (actor->object->placement != 0) {
                // Repère de l'avion du joueur : décalage tourné, cap = cap du joueur + cap du fichier.
                this->mission->placeRelativeToPlayer(actor);
            } else if (actor->object->area_id != 255) {
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

Seul ce cas de `SCProg::execute` change : il lit les champs nommés au lieu des octets 46 et 48 à 53 de l'ancien
`unknown_bytes`. Le comportement est le même.

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

### 2.7 `SCMission` — placement dans le repère du joueur

Ce que fait le jeu (`PartEntry_ResolveSpawnPositionAndActivate_51EDC`), quand le mode de placement n'est pas nul :

1. il copie la matrice d'orientation de l'avion du joueur (`Expr_Node_GetFocusedNode_543BA`, méthode `+0x3C`, copie
   par `AI_ComputeGeometryHelper_56E29`) ;
2. cap de l'objet = cap du nez du joueur + cap du fichier :
   ```
   call    Math_HeadingAngle_553CF   ; cap de la 2e ligne de la matrice (le nez)
   mov     ax, es:[bx+2Dh]           ; cap du fichier
   shl     eax, 8
   add     edx, eax
   ```
3. position = position du joueur (`Expr_Node_GetFocusedNode_543BA` `+0x12`) + chaque composante du décalage
   multipliée par une ligne de la matrice, trois fois de suite :
   ```
   mov     eax, es:[bx]          ; 1re composante du décalage (+0x21)
   mov     [bp+var_30], eax
   mov     eax, [bp+var_E8]      ; 1re ligne de la matrice, 1re composante
   mov     edx, [bp+var_30]
   imul    edx
   shrd    eax, edx, 8
   ...                           ; idem avec [bp+var_E4] et [bp+var_E0]
   add     [bp+var_94], eax      ; ajouté à la position du joueur (var_90, var_8C pour les deux autres)
   ```
   puis la 2e composante (`+0x25`) avec la 2e ligne (`var_DC`), la 3e (`+0x29`) avec la 3e ligne (`var_D0`).

Les lignes de la matrice du jeu sont les axes de l'avion : aile droite, nez, dessus (`PHYSICS.md` : « `c0` =
envergure (aile droite), `c1` = axe longitudinal »). Le décalage du fichier se lit donc : 1er int32 = vers l'aile
droite, 2e = vers le nez, 3e = vers le dessus de l'avion. Il suit le tangage et le roulis du joueur, pas seulement son
cap. L'objet, lui, apparaît à plat, avec le cap calculé.

Dans libRealSpace, la lecture du fichier donne déjà `x` = droite, `y` = dessus, `z` = −nez. Les lignes de la matrice
d'orientation d'un avion (`ptw`, construite par `SCJetpPlane` avec `yaw`, `pitch`, `roll`) sont droite, dessus et
arrière : le décalage lu s'applique donc tel quel, sans changement de signe. La matrice est reconstruite à partir de
`yaw`, `pitch` et `roll` du joueur, de la même façon que `SCJetpPlane` la construit, pour que le résultat soit juste
avant le premier tic de vol aussi (scènes activées par `startScenes` à la fin de `loadMission`).

Pour un avion, la fonction règle aussi `yaw` (`yaw = 360 − cap`, en dixièmes de degré) et refait la vitesse
initiale le long du nouveau nez.

Déclaration ajoutée dans `SCMission.h`, à côté de `startScenes` :

```cpp
void placeRelativeToPlayer(SCMissionActors *actor);
```

```cpp
// Objet de mode de placement non nul (PartEntry_ResolveSpawnPositionAndActivate_51EDC, cmp byte ptr es:[bx+1Ch], 0) :
// le décalage du fichier est exprimé dans le repère de l'avion du joueur. Le jeu ajoute à la position du joueur
// côté × aile droite + avant × nez + haut × dessus de l'avion (les trois lignes de sa matrice d'orientation), et le cap
// de l'objet vaut le cap du nez du joueur (Math_HeadingAngle_553CF) + le cap du fichier. L'objet reste à plat.
// Dans libRealSpace, le décalage lu (x = côté, y = haut, z = -avant) s'applique tel quel aux lignes de la matrice de
// l'avion (ligne 0 = droite, ligne 1 = haut, ligne 2 = arrière), construite comme SCJetpPlane la construit.
void SCMission::placeRelativeToPlayer(SCMissionActors *actor) {
    if (this->player == nullptr || this->player->plane == nullptr) {
        return;
    }
    SCPlane *player_plane = this->player->plane;
    MISN_PART *part = actor->object;
    Matrix orientation;
    orientation.Identity();
    orientation.rotateM(tenthOfDegreeToRad(player_plane->yaw), 0, 1, 0);
    orientation.rotateM(tenthOfDegreeToRad(player_plane->pitch), 1, 0, 0);
    orientation.rotateM(tenthOfDegreeToRad(player_plane->roll), 0, 0, 1);
    Vector3D offset = part->relative_position;
    Vector3D position = {
        player_plane->x,
        player_plane->y,
        player_plane->z
    };
    position.x += offset.x * orientation.v[0][0] + offset.y * orientation.v[1][0] + offset.z * orientation.v[2][0];
    position.y += offset.x * orientation.v[0][1] + offset.y * orientation.v[1][1] + offset.z * orientation.v[2][1];
    position.z += offset.x * orientation.v[0][2] + offset.y * orientation.v[1][2] + offset.z * orientation.v[2][2];
    part->position = position;

    // Cap du nez du joueur dans la convention des fichiers (degrés, depuis le nord vers l'est) : atan2(x, -z) du nez.
    float nose_x = -orientation.v[2][0];
    float nose_z = -orientation.v[2][2];
    float heading = radToDegree(atan2f(nose_x, -nose_z)) + (float) part->relative_azymuth;
    heading = fmodf(heading, 360.0f);
    if (heading < 0.0f) {
        heading += 360.0f;
    }
    part->azymuth = (uint16_t) roundf(heading) % 360;

    if (actor->plane != nullptr) {
        actor->plane->x = position.x;
        actor->plane->y = position.y;
        actor->plane->z = position.z;
        actor->plane->yaw = norm3600((360.0f - heading) * 10.0f);
        // Vitesse initiale le long du nouveau nez (AIAircraft_SpawnAndConditionalLoadProfile_53363).
        if (part->speed != 0) {
            float spawn_yaw = tenthOfDegreeToRad(actor->plane->yaw);
            float spawn_speed = (float) part->speed;
            actor->plane->velocity = Vector3D(-sinf(spawn_yaw) * spawn_speed, 0.0f, -cosf(spawn_yaw) * spawn_speed);
        }
        if (actor->pilot != nullptr) {
            actor->pilot->target_azimut = actor->plane->yaw / 10.0f;
        }
    }
}
```

**Cap du joueur au chargement.** Dans `loadMission`, la création de l'avion du joueur écrivait deux fois `yaw` :
d'abord en dixièmes de degré, puis en radians. La 2e affectation est retirée. `SCStrike` réécrit ensuite `yaw` en
dixièmes de degré, avec la même valeur. Sans ce retrait, les objets placés dans le repère du joueur par les scènes
du début de mission auraient pris un cap faux.

```cpp
                    // Cap en dixièmes de degré, comme SCStrike : le placement dans le repère du joueur le lit dès startScenes
                    // (l'ancienne 2e affectation, en radians, l'écrasait).
                    actor->plane->yaw = (360 - part->azymuth) * 10.0f;
                    actor->plane->simple_simulation = false;
```

### 2.8 Lecteurs des anciens champs `unknown`

`SCMission::loadMission`, position de l'avion du joueur (et la même ligne dans `PSMission.cpp` de Pacific Strike) :

```cpp
if (part->area_id != 255 && part->placement == 0) {
```

`PSMission.cpp`, camp :

```cpp
actor->team_id = part->team;
```

`DebugStrike.cpp`, fiche d'un objet de mission : les lignes `u1`, `u2`, `u3` et la liste `ub` sont remplacées par

```cpp
                    ImGui::Text("placement %d", part->placement);
                    ImGui::Text("x %.0f y %.0f z %.0f", part->position.x, part->position.y, part->position.z);
                    ImGui::Text("azymuth %d", part->azymuth);
                    ImGui::Text("Name %s", part->member_name.c_str());
                    ImGui::Text("Destroyed %s", part->member_name_destroyed.c_str());
                    ImGui::Text("speed %d", part->speed);
                    ImGui::Text("team %d", part->team);
                    ImGui::Text("follow ally %d", part->follow_ally);
                    ImGui::Text("formation %d %d %d", part->formation_side, part->formation_ahead, part->formation_up);
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

`tools/mission_ref/mission_relative_test.cpp` appelle `SCMission::placeRelativeToPlayer` avec un joueur à
(1000, 2000, 3000) :

```
cap nord, 500 m devant                       position (1000.00, 2000.00, 2500.00), cap 0 : ok
cap est, 500 m devant                        position (1500.00, 2000.00, 3000.00), cap 90 : ok
cap est, 200 m à droite                      position (1000.00, 2000.00, 3200.00), cap 90 : ok
cap sud, 300 m derrière, cap fichier 90      position (1000.00, 2000.00, 2700.00), cap 270 : ok
cap nord, tangage 45, 100 m devant           position (1000.00, 2070.71, 2929.29), cap 0 : ok
cap nord, roulis 90, 100 m au-dessus         position (900.00, 2000.00, 3000.00), cap 0 : ok
0 échec(s)
```

(Le roulis positif de libRealSpace penche le dessus de l'avion vers l'ouest quand il va au nord.)

Exemples : les `F-16DES` de MISN-10A sont à vitesse nulle à 1 625 m d'altitude, à côté de `STRIBASE`
(1 620 m) : au sol sur la base. Les `F-18` de MISN-10A et MISN-11A sont en repère du joueur, décalage nul en
altitude, à 300 m/s.

## 4. Points ouverts

- **Nez du joueur vertical** : le cap n'est alors pas défini ; `Math_HeadingAngle_553CF` renvoie la valeur
  spéciale 720. Ce que le jeu en fait ensuite n'a pas été lu ; `placeRelativeToPlayer` prend le cap donné par
  `atan2f`.
- **Train d'un avion en vol** : le jeu sort le train pour une vitesse nulle ; ce qu'il fait du train pour un avion
  qui part en vol n'a pas été lu. `SCPlane` sort le train à la création (`wheels = 1`) ; ce n'est pas modifié.
- **Ordre des axes du poste en formation** : `follow_slot` est construit (côté, avant, haut) comme avant ; l'usage
  de chaque composante dans le suivi n'a pas été revérifié.
- **Octet 47** : pas recopié par le chargeur, rôle non établi.

## 5. Chunks `LOAD` et `CACH`

Les deux fonctions de lecture étaient vides. Elles rangent maintenant les données dans `MISN` (`load`, `cache`) ;
rien ne les utilise encore.

**`LOAD`** — lu par `MissionScenario_LoadFieldGroup_A8225`, appelé par `MissionScenario_LoadMainRecord_A8331`
juste après `PLAY` (`push large 44414F4Ch`). Boucle jusqu'à la fin du chunk sur des enregistrements de 9 octets :

```
push    large 8
call    ResourceRecord_ReadFieldGroupA_64A19   ; nom, 8 octets
call    ResourceRecord_ReadFinalField_64B51    ; 1 octet
push    ax
...
call    IFF_LoadModelMain                      ; charge OBJECTS\<nom>.IFF
```

`IFF_LoadModelMain` range l'octet dans le modèle chargé (`mov al, [bp+arg_6]` / `mov es:[bx+2], al`) ; son rôle
n'est pas établi. Dans les fichiers : 0 dans 1 156 enregistrements ; 1 pour un F-16 dans `ARENAMIS`, `BASIC`,
`GAME`, `GAUNTLET`, `LAND` et `TEMPLATE` ; 83 dans `MISSION.IFF`, dont le `LOAD` de 16 octets est mal formé
(2e enregistrement tronqué : l'octet 83 est le « S » de `SWINDERJ`). Les noms sont des modèles chargés d'avance :
leurres (`FLARE`, `CHAFF`), explosions (`FUELEXP1`, `EXPLODE1`…), étincelles et débris (`GUNSPARK`, `GENDEB1`…).

**`CACH`** — format lu dans les fichiers seulement : le tag (`push large 48434143h`) n'apparaît dans aucun des deux
exécutables, ni le chunk dans le chargeur de mission ; le lecteur reste à trouver. Enregistrements de 10 octets :
nom de 8 octets, puis un uint16 (1 dans 1 801 enregistrements, 0 dans 15). Les noms sont des modèles d'`OBJECTS` :
véhicules et défenses (`T-72`, `ZSU-23`, `MOBSAMLN`…), leurs versions détruites (`DT-72`, `DZSU-23`…), bâtiments
(`HANGAR3`, `HANGAR3D`), avions et débris (`MIG29`, `DEBSU27`), obus (`23MM`, `30MMGAU`…).

| Chunk | Octets | Type | Champ |
|---|---|---|---|
| `LOAD` | 0-7 | char[8] | `MISN_LOAD::name` |
| `LOAD` | 8 | uint8 | `MISN_LOAD::flag` |
| `CACH` | 0-7 | char[8] | `MISN_CACH::name` |
| `CACH` | 8-9 | uint16 | `MISN_CACH::count` |

```cpp
// Chunk LOAD : enregistrements de 9 octets, lus jusqu'à la fin du chunk (MissionScenario_LoadFieldGroup_A8225).
// Chaque nom est chargé comme modèle (IFF_LoadModelMain : OBJECTS\<nom>.IFF) au chargement de la mission.
struct MISN_LOAD {
    std::string name; // octets 0-7 : nom du modèle
    uint8_t flag{0};  // octet 8 : rangé dans le modèle chargé (+2) ; rôle non établi (0 partout, sauf un F-16 à 1 dans 6 fichiers hors campagne)
};
// Chunk CACH : enregistrements de 10 octets. Format lu dans les fichiers ; aucun lecteur trouvé dans le jeu.
struct MISN_CACH {
    std::string name;   // octets 0-7 : nom d'un modèle d'OBJECTS
    uint16_t count{0};  // octets 8-9 : 1 (1 801 enregistrements) ou 0 (15) dans les missions ; rôle non établi
};
```

```cpp
void RSMission::parseMISN_LOAD(uint8_t *data, size_t size) {
    // Enregistrements de 9 octets ; des octets en trop à la fin (MISSION.IFF : 16 octets) sont ignorés.
    size_t count = size / 9;
    for (size_t i = 0; i < count; i++) {
        ByteStream stream(data + i * 9, 9);
        MISN_LOAD *load = new MISN_LOAD();
        load->name = stream.ReadString(8);
        std::transform(load->name.begin(), load->name.end(), load->name.begin(), ::toupper);
        load->flag = stream.ReadByte();
        this->mission_data.load.push_back(load);
    }
}
void RSMission::parseMISN_CACH(uint8_t *data, size_t size) {
    // Enregistrements de 10 octets.
    size_t count = size / 10;
    for (size_t i = 0; i < count; i++) {
        ByteStream stream(data + i * 10, 10);
        MISN_CACH *cache = new MISN_CACH();
        cache->name = stream.ReadString(8);
        std::transform(cache->name.begin(), cache->name.end(), cache->name.begin(), ::toupper);
        cache->count = stream.ReadUShort();
        this->mission_data.cache.push_back(cache);
    }
}
```

Essai (`tools/mission_ref/mission_load_test.cpp`, chaque enregistrement comparé aux octets du fichier) :

```
1163 enregistrements LOAD, 1816 enregistrements CACH, 0 erreurs
```

