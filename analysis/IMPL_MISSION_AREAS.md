# Zones et scènes des missions : correction proposée pour libRealSpace

Rédigé le 2026-10-30, refait le même jour sur les classes existantes. Repère de libRealSpace (Y = altitude),
mètres, nombres en décimal. Format complet des chunks : `DATA_MODEL.md` § 6.6.

**Le livrable : les fichiers de libRealSpace, complets et déjà modifiés**, dans `tools/mission_ref/librealspace/src/`
(base : commit `c5fa505` du 2026-10-27), et le code entier de chaque changement au § 2. Ils modifient les classes qui existent —
`AREA`, `MISN_SCEN` et `RSMission` (lecture), `SCMission` et `SCMissionScene` (choix de la scène et scripts) —
en gardant leurs noms et leurs champs, et n'ajoute que ce qui manque. Tous les fichiers de `strike_commander/`,
`realspace/`, `engine/` et `DebugStrike.cpp` compilent avec ces fichiers. L'essai `mission_areas_test.cpp` appelle le
vrai `RSMission::InitFromRAM` modifié sur les fichiers de mission (§ 6).

## 1. Ce que fait libRealSpace aujourd'hui (constaté au commit `c5fa505`)

### 1.1 Lecture du chunk `AREA` (`RSMission::parseMISN_AREA`)

Le nom est lu sur **33 octets** au lieu de 32, puis chaque coordonnée par `ReadInt24LE`, qui consomme 4 octets
et n'en garde que les 3 premiers. Le décalage d'un octet fait que ces 3 octets sont les 3 octets hauts de l'`int32`
24.8 : **la position est juste en mètres entiers**, par hasard. Les 237 zones des données n'ont aucune partie
fractionnaire, donc rien n'est perdu sur les données actuelles.

Les tailles, elles, sont lues avec des `ReadUShort` placés de façon à retomber sur les bons octets pour la sphère,
mais pas pour les deux autres formes :

| Forme | Fichier | `AreaWidth` lu par libRealSpace | `AreaHeight` lu par libRealSpace |
|---|---|---|---|
| sphère `S` | rayon | rayon | rayon |
| cylindre `C` | hauteur, puis rayon | **la hauteur** (tronquée à 16 bits : 100 000 m → 34 464) | **le rayon** |
| boîte `B` | étendues est, ouest, nord, sud, puis hauteur | **l'étendue est** | **l'étendue sud** ; ouest, nord et hauteur perdues |

26 boîtes sur 40 sont asymétriques. Exemple : zone 1 de `MISN-1A` (« .RESTRICTED AIRSPACE », celle qui déclenche
les 3 MiG-21) : 50 000 m vers l'est, 0 vers l'ouest, 0 vers le nord, 50 000 m vers le sud depuis son point de
référence. Le jeu la place en X de −40 000 à 10 000 et en Z de 57 000 à 107 000. libRealSpace la centre sur le
point de référence (X de −65 000 à −15 000, Z de 32 000 à 82 000) : seul un quart de la vraie zone est couvert.

`AREA::id` vaut le rang + 1. Les index du fichier (`SCNE`, `PART`, `SPOT`, `HOME`) partent de 0, d'où les `+ 1` et
`− 1` qu'on trouve chez les lecteurs (`SCMission.cpp` ligne 527, `SCMissionScene.cpp` ligne 16,
`SCStrike.cpp` ligne 792, `SCNavMap.cpp` lignes 477 à 481). Les fichiers modifiés gardent cette convention.

### 1.2 Lecture du chunk `SCNE` (`RSMission::parseMISN_PLAY_SCEN`)

Structure juste : actif, zone, 3 scripts, octet 9, puis 14 octets gardés dans `unknown_bytes`, puis la liste des
objets (octet bas seulement, suffisant : moins de 256 objets `PART`). Mais **les noms des 2e et 3e scripts sont
inversés** par rapport à leur emploi dans le jeu (§ 4) : `on_leaving` (2e) tourne à chaque image dans le jeu, et
`on_mission_update` (3e) quand la scène est quittée et en fin de mission.

### 1.3 Choix de la scène (`SCMission::getAreaID` et la boucle sur les scènes)

- `getAreaID` teste chaque zone comme un **carré** de côté `AreaWidth` centré sur le point de référence, **sans
  l'altitude**, et garde la **plus petite** zone qui contient le joueur.
- Le jeu teste la vraie forme (sphère en 3D, cylindre et boîte avec leur plage d'altitude) et prend la **première
  scène active, dans l'ordre du fichier**, dont la zone contient le joueur (§ 4). La plus petite zone n'a pas de
  rôle.
- Chaque image, `SCMission` publie une activation pour chaque scène active de la zone courante et pour les scènes
  globales. Le jeu n'active une scène que quand elle **devient** courante.

---

## 2. Les fichiers modifiés et le code de chaque changement

Les six fichiers de libRealSpace, complets et déjà modifiés, sont dans `tools/mission_ref/librealspace/src/`, sous
leur chemin d'origine : il suffit de les copier par-dessus ceux de libRealSpace (commit `c5fa505`).

| Fichier | Ce qui change |
|---|---|
| `realspace/RSMission.h` | `AREA` : tailles exactes et `contains` ; `MISN_SCEN` : commentaires des scripts |
| `realspace/RSMission.cpp` | `parseMISN_AREA` réécrite ; `AREA::contains` ajoutée ; `parseMISN_PLAY_SCEN` : ordre des scripts |
| `strike_commander/SCMissionScene.h` | `activate`, `runMissionUpdate`, `runLeaving`, `runProg` ; plus d'abonnement au bus de messages |
| `strike_commander/SCMissionScene.cpp` | les mêmes |
| `strike_commander/SCMission.h` | `global_scene`, `current_scene`, `findSceneAt`, `startScenes`, `finishScenes` |
| `strike_commander/SCMission.cpp` | choix de la scène dans `update`, `startScenes` à la fin de `loadMission`, `finishScenes` dans `setExitCode`, `getAreaID` avec `contains` |

### 2.1 `RSMission.h` — `AREA`

Tous les champs d'avant restent. `AreaWidth` et `AreaHeight` gardent les mêmes valeurs qu'avant (pour la carte de
navigation et l'outil de mise au point) ; seule différence, la hauteur d'un cylindre n'est plus tronquée à 16 bits.

```cpp
// Zone du chunk AREA (ExprSlot_ConstructMain_A974A). position : centre pour une sphère, centre du plancher pour
// un cylindre ou une boîte.
struct AREA {
    int id;
    unsigned char AreaType;
    char AreaName[33];
    Vector3D position;
    // Valeurs historiques, gardées pour l'affichage : sphère rayon / rayon, cylindre hauteur / rayon, boîte
    // étendue est / étendue sud.
    unsigned int AreaWidth;
    unsigned int AreaHeight;
    std::vector<uint8_t> unknown_bytes;
    float radius{0.0f}; // 'S', 'C'
    float height{0.0f}; // 'C', 'B' : vers le haut depuis le plancher
    float east{0.0f};   // 'B' : vers +X
    float west{0.0f};   // 'B' : vers -X
    float north{0.0f};  // 'B' : vers -Z
    float south{0.0f};  // 'B' : vers +Z
    // Test d'appartenance du jeu, bornes incluses (HitShape_Sphere_ContainsPoint_52E91,
    // HitShape_Radial2D_ContainsPoint_52F99, HitShape_Box_ContainsPoint_52F0F).
    bool contains(const Vector3D &point) const;
};
```

`MISN_SCEN` : mêmes champs, les commentaires disent quand chaque script tourne.

```cpp
struct MISN_SCEN {
    uint8_t is_active {0};
    uint8_t has_been_activated {0};
    int16_t area_id {0};
    std::vector<int16_t> progs_id;
    int16_t on_is_activated {-1};   // octets 3-4 : quand la scène devient la scène courante
    int16_t on_mission_update {-1}; // octets 5-6 : à chaque image (scène globale, scène courante)
    int16_t on_leaving {-1};        // octets 7-8 : quand la scène cesse d'être courante, et en fin de mission
    bool is_coord_on_area {false};
    std::vector<uint8_t> unknown_bytes;
    std::vector<uint8_t> cast;
};
```

### 2.2 `RSMission.cpp` — lecture du chunk `AREA`

Nom sur 32 octets ; chaque valeur est un `int32` 24.8, lu par `ReadInt32LE` et divisé par 256 ; tailles lues selon la
forme. `id` reste le rang + 1.

```cpp
// Chunk AREA (ExprSlot_ConstructMain_A974A) : enregistrements collés, sans compteur. Forme (1 octet), nom
// (32 octets), point de référence (3 int32 24.8), puis selon la forme : 'S' rayon ; 'C' hauteur, rayon ;
// 'B' étendues est, ouest, nord, sud, hauteur. 49, 53 ou 65 octets.
void RSMission::parseMISN_AREA(uint8_t *data, size_t size) {
    size_t offset = 0;
    int cpt = 0;
    while (offset < size) {
        unsigned char shape = data[offset];
        size_t length = 0;
        if (shape == 'S') {
            length = 49;
        } else if (shape == 'C') {
            length = 53;
        } else if (shape == 'B') {
            length = 65;
        }
        // Lettre inconnue (le jeu s'arrête sur l'erreur 36877) ou octet de bourrage en fin de chunk.
        if (length == 0 || offset + length > size) {
            if (length == 0 && offset + 1 < size) {
                printf("ERROR IN PARSING AREA\n");
            }
            break;
        }
        ByteStream stream(data + offset, length);
        AREA *tmparea = new AREA();
        tmparea->id = ++cpt;
        tmparea->AreaType = stream.ReadByte();
        for (int k = 0; k < 32; k++) {
            tmparea->AreaName[k] = stream.ReadByte();
        }
        tmparea->AreaName[32] = '\0';
        missionstrtoupper(tmparea->AreaName);
        // int32 24.8 : ÷ 256 = mètres ; repère libRealSpace x = c0, y = c2, z = -c1.
        float c0 = stream.ReadInt32LE() / 256.0f;
        float c1 = stream.ReadInt32LE() / 256.0f;
        float c2 = stream.ReadInt32LE() / 256.0f;
        tmparea->position.x = c0 * BLOCK_COORD_SCALE;
        tmparea->position.z = -c1 * BLOCK_COORD_SCALE;
        tmparea->position.y = c2 * HEIGH_MAP_SCALE;
        if (shape == 'S') {
            tmparea->radius = stream.ReadInt32LE() / 256.0f * BLOCK_COORD_SCALE;
            tmparea->AreaWidth = (unsigned int) tmparea->radius;
            tmparea->AreaHeight = tmparea->AreaWidth;
        } else if (shape == 'C') {
            tmparea->height = stream.ReadInt32LE() / 256.0f * HEIGH_MAP_SCALE;
            tmparea->radius = stream.ReadInt32LE() / 256.0f * BLOCK_COORD_SCALE;
            tmparea->AreaWidth = (unsigned int) tmparea->height;
            tmparea->AreaHeight = (unsigned int) tmparea->radius;
        } else {
            tmparea->east = stream.ReadInt32LE() / 256.0f * BLOCK_COORD_SCALE;
            tmparea->west = stream.ReadInt32LE() / 256.0f * BLOCK_COORD_SCALE;
            tmparea->north = stream.ReadInt32LE() / 256.0f * BLOCK_COORD_SCALE;
            tmparea->south = stream.ReadInt32LE() / 256.0f * BLOCK_COORD_SCALE;
            tmparea->height = stream.ReadInt32LE() / 256.0f * HEIGH_MAP_SCALE;
            tmparea->AreaWidth = (unsigned int) tmparea->east;
            tmparea->AreaHeight = (unsigned int) tmparea->south;
        }
        this->mission_data.areas.push_back(tmparea);
        offset += length;
    }
}
```

Test d'appartenance du jeu (§ 3.1) :

```cpp
// Bornes incluses. Sphère : distance 3D au centre. Cylindre : plage d'altitude et distance dans le plan X/Z.
// Boîte : x de X - ouest à X + est, z de Z - nord à Z + sud (le nord est vers -Z), plage d'altitude.
bool AREA::contains(const Vector3D &point) const {
    if (this->AreaType == 'S') {
        float dx = point.x - this->position.x;
        float dy = point.y - this->position.y;
        float dz = point.z - this->position.z;
        return std::sqrt(dx * dx + dy * dy + dz * dz) <= this->radius;
    }
    if (point.y < this->position.y || point.y > this->position.y + this->height) {
        return false;
    }
    if (this->AreaType == 'C') {
        float dx = point.x - this->position.x;
        float dz = point.z - this->position.z;
        return std::sqrt(dx * dx + dz * dz) <= this->radius;
    }
    if (this->AreaType == 'B') {
        return point.x >= this->position.x - this->west && point.x <= this->position.x + this->east &&
               point.z >= this->position.z - this->north && point.z <= this->position.z + this->south;
    }
    return false;
}
```

### 2.3 `RSMission.cpp` — lecture du chunk `SCNE`

Seul changement : le 2e script du fichier va dans `on_mission_update`, le 3e dans `on_leaving` (c'était l'inverse).

```cpp
void RSMission::parseMISN_PLAY_SCEN(uint8_t *data, size_t size) {
    MISN_SCEN *scen = new MISN_SCEN();
    ByteStream stream(data, size);
    scen->is_active = stream.ReadByte();
    scen->area_id = stream.ReadShort();
    int16_t prog_id = 0;
    for (int i = 0 ; i<3; i++) {
        prog_id = stream.ReadShort();
        scen->progs_id.push_back(prog_id);
    }
    // Ordre du fichier : activation, à chaque image (Scene_RunUpdateScript_531F2), sortie de scène et fin de
    // mission (Scene_RunLeavingScript_53211).
    scen->on_is_activated = scen->progs_id[0];
    scen->on_mission_update = scen->progs_id[1];
    scen->on_leaving = scen->progs_id[2];
    scen->is_coord_on_area = stream.ReadByte();
    for (int i = 0; i < 14; i++) {
        scen->unknown_bytes.push_back(stream.ReadByte());
    }
    size_t read = 24;
    while (read < size) {
        scen->cast.push_back(stream.ReadByte());
        stream.ReadByte();
        read+=2;
    }
    this->mission_data.scenes.push_back(scen);
}
```

### 2.4 `SCMissionScene` — les trois moments d'une scène

La scène ne s'abonne plus au bus de messages : `SCMission` appelle ces méthodes dans l'ordre du jeu.

```cpp
#pragma once

#include "precomp.h"

class SCMission;

class SCMissionScene {
private:
    void runProg(int16_t prog_id);
public:
    SCMissionScene(SCMission *mission, MISN_SCEN *scene);
    ~SCMissionScene();
    void activate();
    void runMissionUpdate();
    void runLeaving();
    SCMission *mission{nullptr};
    MISN_SCEN *scene{nullptr};
};
```

```cpp
// Lance un script PROG de la scène (-1 = aucun).
void SCMissionScene::runProg(int16_t prog_id) {
    if (prog_id < 0 || prog_id >= (int16_t) this->mission->mission->mission_data.prog.size()) {
        return;
    }
    std::vector<PROG> prog;
    for (auto prg: *this->mission->mission->mission_data.prog[prog_id]) {
        prog.push_back(prg);
    }
    SCProg *p = new SCProg(this->mission->player, prog, this->mission, prog_id);
    p->scene_script = true;
    p->execute();
    delete p;
}

// Scene_RunUpdateScript_531F2 : à chaque image, pour la scène globale et la scène courante (MAIN_GAME_TICK).
void SCMissionScene::runMissionUpdate() {
    this->runProg(this->scene->on_mission_update);
}

// Scene_RunLeavingScript_53211 : quand la scène cesse d'être courante, et en fin de mission.
void SCMissionScene::runLeaving() {
    this->runProg(this->scene->on_leaving);
}
```

`activate()` est l'ancien `onSceneActivated` : même apparition des objets. Changements : elle est appelée
directement ; son script repasse à chaque activation (le garde-fou `has_been_activated == 0` est retiré) ; elle ne
remet plus `is_active` à 0.

```cpp
// Scene_TriggerActivation_531CD : quand la scène devient la scène courante (ou au chargement pour la scène
// globale) : apparition des objets de la scène qui ne sont pas déjà là (Scene_EnsureUnitsSpawned_530FF), puis
// script d'activation. Le jeu relance ce script à chaque fois que la scène redevient courante.
void SCMissionScene::activate() {
    MISN_SCEN *scene = this->scene;
    RSMission *mission = this->mission->mission;
    SCMission *sc_mission = this->mission;
    for (auto cast: scene->cast) {
        // … inchangé : apparition des objets de la scène, comme l'ancien onSceneActivated …
    }
    this->runProg(scene->on_is_activated);
    scene->has_been_activated = 1;
}
```

```cpp
SCMissionScene::SCMissionScene(SCMission *mission, MISN_SCEN *scene) {
    this->mission = mission;
    this->scene = scene;
}
```

### 2.5 `SCMission` — choix de la scène

Dans `SCMission.h`, à côté de `scenes` :

```cpp
    SCMissionScene *global_scene{nullptr};  // MissionScenario+78 : première scène sans zone
    SCMissionScene *current_scene{nullptr}; // MissionScenario+80 : scène de la zone où est le joueur
```

et à côté de `getAreaID` :

```cpp
    SCMissionScene *findSceneAt(Vector3D position);
    void startScenes();
    void finishScenes();
```

Dans `update()`, à la place de la boucle qui publiait `MissionEventSceneActivated` pour les scènes de la zone :

```cpp
    // MAIN_GAME_TICK : script de mise à jour de la scène globale, changement de scène courante
    // (Scene_DetectAndActivateChange_532EA), script de mise à jour de la scène courante.
    if (this->global_scene != nullptr) {
        this->global_scene->runMissionUpdate();
    }
    Vector3D player_position = {
        this->player->plane->x,
        this->player->plane->y,
        this->player->plane->z
    };
    SCMissionScene *found = this->findSceneAt(player_position);
    if (found != this->current_scene) {
        if (this->current_scene != nullptr) {
            this->current_scene->runLeaving();
        }
        if (found != nullptr) {
            found->activate();
        }
        this->current_scene = found;
    }
    if (this->current_scene != nullptr) {
        this->current_scene->runMissionUpdate();
    }
```

`startScenes()` est appelée à la dernière ligne de `loadMission`, après la création des acteurs :

```cpp
// MissionScenario_LoadMainRecord_A8331 : la scène globale (Scene_FindByArea_532AD avec une zone nulle) est
// activée, puis la scène où se trouve le joueur.
void SCMission::startScenes() {
    std::vector<AREA *> &areas = this->mission->mission_data.areas;
    this->global_scene = nullptr;
    this->current_scene = nullptr;
    for (auto sc_scene: this->scenes) {
        if ((uint16_t) sc_scene->scene->area_id >= areas.size()) {
            this->global_scene = sc_scene;
            break;
        }
    }
    if (this->global_scene != nullptr) {
        this->global_scene->activate();
    }
    if (this->player != nullptr && this->player->plane != nullptr) {
        Vector3D player_position = {
            this->player->plane->x,
            this->player->plane->y,
            this->player->plane->z
        };
        this->current_scene = this->findSceneAt(player_position);
        if (this->current_scene != nullptr) {
            this->current_scene->activate();
        }
    }
}
```

```cpp
// Scene_FindMatchingByAreaContainment_53236 : première scène active, dans l'ordre du fichier, dont la zone
// contient le point. Une scène sans zone (index -1 ou hors liste) n'est jamais choisie ici.
SCMissionScene *SCMission::findSceneAt(Vector3D position) {
    std::vector<AREA *> &areas = this->mission->mission_data.areas;
    for (auto sc_scene: this->scenes) {
        MISN_SCEN *scene = sc_scene->scene;
        if (scene->is_active == 0) {
            continue;
        }
        uint16_t area_index = (uint16_t) scene->area_id;
        if (area_index >= areas.size()) {
            continue;
        }
        if (areas[area_index]->contains(position)) {
            return sc_scene;
        }
    }
    return nullptr;
}
```

Fin de mission : `setExitCode` appelle `finishScenes()` une seule fois, au passage à « mission terminée », donc avant
`buildReport` :

```cpp
// byte_706AF : une valeur non nulle termine la mission (STRIKE_EXE_MAIN_LOOP).
void SCMission::setExitCode(uint8_t code, const char *reason) {
    printf("MISSION: code de sortie %d (%s), precedent %d\n", code, reason, this->exit_code);
    this->exit_code = code;
    if (code != 0) {
        if (!this->mission_ended) {
            this->finishScenes();
        }
        this->mission_ended = true;
    }
}
```

```cpp
// Fin de mission (STRIKE_EXE_MAIN_LOOP en sortie de boucle, puis MissionScenario_RecomputeFields_A9382) : script de
// sortie de la scène globale (le bilan, qui écrit les variables de résultat), puis de la scène courante.
void SCMission::finishScenes() {
    if (this->global_scene != nullptr) {
        this->global_scene->runLeaving();
    }
    if (this->current_scene != nullptr && this->current_scene != this->global_scene) {
        this->current_scene->runLeaving();
    }
}
```

`getAreaID` garde sa règle (la plus petite zone qui contient le point), avec le vrai test au lieu du carré de côté
`AreaWidth` sans altitude. Elle sert encore à `SCMissionActors::ifTargetInSameArea` et à `DebugStrike`.

```cpp
uint8_t SCMission::getAreaID(Vector3D position) {
    uint8_t area_id = 255;
    float smallest_area_width = (std::numeric_limits<float>::max)();
    
    for (auto ar: this->mission->mission_data.areas) {
        if (ar->contains(position)) {
            if (area_id == 255 || ar->AreaWidth <= smallest_area_width) {
                smallest_area_width = ar->AreaWidth;
                area_id = ar->id;
            }
        }
    }
    
    return area_id;
}
```

## 3. Ce que ces changements modifient dans le jeu

- **Les zones ont leur vraie forme.** Une boîte couvre sa vraie surface, décentrée ; l'altitude compte pour les trois
  formes. Exemple : la zone 1 de `MISN-1A` (espace interdit, celle des 3 MiG-21) passe d'un quart de sa surface à
  toute sa surface.
- **Une scène s'active quand elle devient courante**, et à chaque fois qu'elle le redevient (son script d'activation
  repasse, ses objets déjà présents ne sont pas recréés). Avant : une seule fois, puis `is_active` était remis à 0.
- **`is_active` n'est plus remis à 0 par l'activation.** Seuls les scripts le changent (`OP_ACTIVATE_SCENE`,
  `OP_DEACTIVATE_SCENE`), comme dans le jeu. Conséquence à regarder : la vérification des zones du pilote automatique
  (`SCStrike.cpp`, « check collision with Areas ») ne prend que les zones de scènes actives ; elles le restent
  maintenant après leur activation.
- **Le bilan de fin de mission** (3e script de la scène globale) ne tourne plus à chaque image mais une fois, en fin
  de mission, avant `buildReport`.
- **Les scènes sans zone** autres que la première ne sont jamais activées, comme dans le jeu.
- Non touché : le dessin des boîtes sur la carte (`SCNavMap::showArea` les dessine centrées, avec `AreaWidth` et
  `AreaHeight`). Les champs exacts permettent de le corriger si on le souhaite.

### 3.1 Test d'appartenance (référence)

Le jeu (`HitShape_Sphere_ContainsPoint_52E91`, `HitShape_Radial2D_ContainsPoint_52F99`, `HitShape_Box_ContainsPoint_52F0F`),
bornes incluses :
- sphère : distance 3D au centre ≤ rayon ;
- cylindre : y entre le plancher et plancher + hauteur, distance dans le plan X/Z ≤ rayon ;
- boîte : x de X − ouest à X + est, z de Z − nord à Z + sud (le nord est vers −Z), y entre le plancher et plancher +
  hauteur. Citation : `mov eax, es:[bx+22h]` / `add eax, es:[bx+2Eh]` (est) ; `sub eax, es:[bx+32h]` (ouest) ;
  `add eax, es:[bx+36h]` et `sub eax, es:[bx+3Ah]` sur c1 (nord, sud) ; `add eax, es:[bx+3Eh]` sur l'altitude.

La carte de navigation du jeu ne trace pas les zones dont le nom commence par « . »
(`NavMap_DrawMissionObjects_7EDCA` : `cmp byte ptr es:[bx+2], 2Eh`), et seulement celles des scènes actives.

## 4. Les scripts d'une scène (référence)

En-tête de 24 octets (`MissionScene_ParseRecord_AA3A5` : `push large 18h` / `ResourceRecord_ReadFieldGroupA_64A19`),
puis (taille − 24) ÷ 2 mots : les objets de la scène, index dans `PART`.

| Octets | Champ de `MISN_SCEN` | Emploi dans STRIKE.EXE |
|---|---|---|
| 0 | `is_active` | la scène peut être choisie (`Scene_FindMatchingByAreaContainment_53236` : `cmp byte ptr [di], 0`) ; l'opcode 0x80 la rend active |
| 1, 2 | `area_id` | index `AREA` ; −1 ou hors liste = pas de zone (`PtrList_GetAt_53034`) |
| 3, 4 | `on_is_activated` | quand la scène devient courante, après l'apparition de ses objets (`Scene_TriggerActivation_531CD`) |
| 5, 6 | `on_mission_update` | **à chaque image**, pour la scène globale puis pour la scène courante (`MAIN_GAME_TICK` → `Scene_RunUpdateScript_531F2`) |
| 7, 8 | `on_leaving` | **quand la scène cesse d'être courante** (`Scene_DetectAndActivateChange_532EA` → `Scene_RunLeavingScript_53211`), **et en fin de mission** |
| 9 | `is_coord_on_area` | rangé en mémoire par le chargeur ; rôle non établi (0 ou 1 dans les données) |
| 10 à 23 | `unknown_bytes` | rangés en mémoire : un `uint16` (0, 90, 135, 180 ou 270 dans les données) puis 3 `int32` 24.8 ; rôle non établi |
| 24… | `cast` | `uint16` : objets de la scène (index `PART`) |

**Les noms des 2e et 3e scripts, et leur preuve.**
- Chaque image, `MAIN_GAME_TICK` lance le champ +12 du record (octets 5 et 6) sur la scène globale
  (`push word ptr [si+4Eh]` / `call near ptr Scene_RunUpdateScript_531F2`). Il cherche ensuite la scène courante
  (`call near ptr Scene_DetectAndActivateChange_532EA`), puis lance le même champ sur elle (`push word ptr
  [si+50h]` / `call near ptr Scene_RunUpdateScript_531F2`).
- Le champ +16 (octets 7 et 8) n'est lancé que par `Scene_RunLeavingScript_53211`. Celle-ci est appelée :
  - sur l'ancienne scène quand la scène courante change ;
  - par `MissionScenario_RecomputeFields_A9382`, qui n'est appelée qu'**après la sortie de la boucle de jeu**
    (`STRIKE_EXE_MAIN_LOOP` : `call VROOMM_StubThunk_6CE5B` après `loc_539AB`, juste avant `Music_Stop_5A9E6`).

  `STRIKE_EXE_MAIN_LOOP` lance aussi ce champ de la scène globale en sortie de boucle (`push large dword ptr
  [bx+10h]` / `call near ptr Expr_VM_ExecuteSingleInstruction_51E7E`).
- Données : dans `MISN-1A`, le 3e script de la scène globale (programme 1) ne fait qu'écrire les variables de
  résultat (`OP_SAVE_VALUE_TO_GAMFLOW_REGISTER` vers `STAT`) : c'est le bilan de fin de mission. Les 2e scripts des
  données (27) sont des tests protégés par un drapeau (`OP_TEST_FLAG`, `OP_SET_WAIT_FOR_SECONDS`,
  `OP_ACTIVATE_OBJ`, puis `OP_SET_FLAG_TO_TRUE`) : des scripts faits pour tourner à chaque image.

`known_functions.json` est corrigé en conséquence : `Scene_RunUpdateScript_531F2` (ex-`Scene_TriggerLeavingEvent`),
`Scene_RunLeavingScript_53211` (ex-`Scene_TriggerMissionUpdateEvent`), `Scene_FindByArea_532AD`
(ex-`Expr_Node_Accessor`), `Scene_LeaveMarkUnits_5317A` (ex-`Expr_Node_GetCachedValueB`). Le résumé de
`MissionScenario_RecomputeFields_A9382` disait « appelée à chaque frame » : elle n'est appelée qu'une fois, en fin de
mission.

## 5. Scène globale, scène courante, ordre des scripts (référence)

- **Scène globale** : la première scène **sans zone** (`area_id` −1 ou hors liste). Au chargement,
  `MissionScenario_LoadMainRecord_A8331` la cherche par `Scene_FindByArea_532AD` avec une zone nulle (`push large 0`),
  la range en `MissionScenario+78` (erreur 36889 si elle n'existe pas) et l'active (`Scene_TriggerActivation_531CD`) :
  ses objets apparaissent (dans `MISN-1A` : le joueur, la base, Stern) et son 1er script est lancé.
- **Scène courante** : la **première scène active, dans l'ordre du fichier, dont la zone contient la position du
  joueur** (`Scene_FindMatchingByAreaContainment_53236`). Les scènes sans zone n'y sont jamais choisies
  (`cmp dword ptr [di+4], 0` / `jz`). Position testée : celle de l'objet du joueur (`MissionScenario+84`), à défaut
  le vecteur global `dword_707F8`.
- **Changement** (`Scene_DetectAndActivateChange_532EA`) : si la scène trouvée n'est plus la même, le 3e script de
  l'ancienne (`on_leaving`), puis l'activation de la nouvelle (`Scene_EnsureUnitsSpawned_530FF` fait apparaître ses
  objets qui ne sont pas déjà là, puis 1er script). Aucune scène trouvée : il n'y a plus de scène courante.
- **Chaque image** (`MAIN_GAME_TICK`) : `on_mission_update` de la scène globale ; changement éventuel ; `on_mission_update` de la
  scène courante.
- **Fin de mission** : `on_leaving` de la scène globale (son bilan), puis de la scène courante.

Exemple, `MISN-1A` : départ sur la base, passage dans l'espace interdit, retour :

```
chargement      scène 0 (globale) : activation
chargement      scène 1 (base)    : activation
image 1         scène 0 : on_mission_update
image 1         scène 1 : on_mission_update
image 2         scène 0 : on_mission_update
image 2         scène 1 : on_leaving
image 2         scène 2 (espace interdit, 3 MiG-21) : activation
image 2         scène 2 : on_mission_update
image 3         scène 0 : on_mission_update
image 3         scène 2 : on_leaving
image 3         scène 1 : activation
image 3         scène 1 : on_mission_update
fin de mission  scène 0 : on_leaving (programme 1, bilan)
fin de mission  scène 1 : on_leaving
```

## 6. Essai

```bash
tools/mission_ref/build.sh <libRealSpace avec les fichiers modifiés> /tmp/mission_ref_build
/tmp/mission_ref_build/mission_areas_test DATA/MISSIONS/*.IFF
```

`build.sh` vérifie la compilation de tout `strike_commander/` et de `DebugStrike.cpp`, puis lie l'essai avec les
objets de `realspace/`, `commons/` et `engine/`. Paquets : SDL2, SDL2_ttf, SDL2_mixer, OpenGL, GLU, imgui, SimpleIni ;
`SDL_mixer_ext` n'existe pas en paquet, un en-tête de substitution inclut `SDL_mixer` (vérification seulement).

Résultat sur les 72 fichiers de `MISSIONS` : 245 zones (189 sphères, 15 cylindres, 41 boîtes), chacune contient le
point 1 m au-dessus de sa référence. `MISN-1A` :

| Zone | Forme | Nom | Référence (X, Y, Z) | Tailles |
|---|---|---|---|---|
| 1 | sphère | STRIKE BASE | −70 000, 2 580, −130 000 | rayon 20 000 |
| 2 | boîte | .RESTRICTED AIRSPACE | −40 000, 3 395, 57 000 | est 50 000, ouest 0, nord 0, sud 50 000, hauteur 100 000 |
| 3 | cylindre | CARGO DESTINATION | 0, 4 100, 97 000 | rayon 5 000, hauteur 50 000 |
| 4 | sphère | NOUAKCHOTT | −127 000, 245, 55 000 | rayon 25 000 |
| 5 | sphère | RENDEZVOUS | −45 000, 4 000, −45 000 | rayon 25 000 |

(`id` = rang + 1.) Boîte de la zone 2 : un point 40 km à l'est ou 40 km au sud de la référence est dedans ; 10 km à
l'ouest ou 10 km au nord, dehors. Scènes : la scène globale (0) a le bilan en 3e script (programme 1) ; la scène 4
a un 3e script (programme 4), la scène 5 un script d'activation (programme 14).

## 7. Points ouverts

- **Octets 9 à 23 d'une scène** : rangés en mémoire, aucun lecteur trouvé dans les fonctions de scène lues.
- **Bit 3 des objets** : `Scene_LeaveMarkUnits_5317A` le pose sur les objets de la scène quittée qui ont un 4e
  script `PART` ; `Scene_EnsureUnitsSpawned_530FF` l'efface sur ceux déjà présents à l'activation. Rôle non établi.
- **Premier passage après le chargement** : `MissionScenario_LoadMainRecord_A8331` appelle
  `Scene_DetectAndActivateChange_532EA` avec une ancienne scène nulle (`push 0`) et ne range pas le résultat en
  `MissionScenario+80`. À la première image, la scène courante serait donc de nouveau vue comme nouvelle.
  `Scene_EnsureUnitsSpawned_530FF` ne recrée pas les objets déjà présents, mais le 1er script repasserait. Non
  vérifié en jeu ; `SCMission::startScenes` ne l'active qu'une fois.
- **Fin de mission** : `STRIKE_EXE_MAIN_LOOP` lance le 3e script de la scène globale jusqu'à 3 fois, entre des
  ajustements du score (`dword_706AB`), avant `MissionScenario_RecomputeFields_A9382`. `SCMission::finishScenes` le
  lance une fois.
