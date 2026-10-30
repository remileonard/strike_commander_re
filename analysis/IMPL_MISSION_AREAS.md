# Zones et scènes des missions : proposition de correction pour libRealSpace

Rédigé le 2026-10-30. Repère de libRealSpace (Y = altitude), mètres, nombres en décimal. Format complet des
chunks : `DATA_MODEL.md` § 6.6. Ici : **ce que libRealSpace lit mal, et le code pour le corriger**.

Même principe que `IMPL_SMOKE.md` : un code de référence (`tools/mission_ref/`), **compilé contre les sources de
libRealSpace** (commit `c5fa505` du 2026-10-27 : `ByteStream`, `IFFSaxLexer`, `Vector3D`), au style du projet
(`clang-format`, `style_check.py`), sans avertissement avec `g++ -Wall -Wextra`, et essayé sur les 49 missions
valables des données (§ 6). L'intégration dans le jeu reste libre.

| Fichier | Rôle | Place proposée dans libRealSpace |
|---|---|---|
| `RSMissionAreas.h`, `RSMissionAreas.cpp` | structures `AREA` et `MISN_SCEN`, lecture des chunks `AREA` et `SCNE`, test d'appartenance à une zone | `RSMission.h` / `RSMission.cpp` |
| `SCMissionScenes.h`, `SCMissionScenes.cpp` | scène globale, scène courante, ordre des scripts de scène | à côté de `SCMission` / `SCMissionScene` |
| `mission_test.cpp`, `build.sh` | essai sur les fichiers de mission | reste dans ce dépôt |

---

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
`SCStrike.cpp` ligne 792, `SCNavMap.cpp` lignes 477 à 481).

### 1.2 Lecture du chunk `SCNE` (`RSMission::parseMISN_PLAY_SCEN`)

Structure juste : actif, zone, 3 scripts, octet 9, puis 14 octets gardés dans `unknown_bytes`, puis la liste des
objets (octet bas seulement, suffisant : moins de 256 objets `PART`). Mais **les noms des 2e et 3e scripts sont
inversés** par rapport à leur emploi dans le jeu (§ 3) : `on_leaving` (2e) tourne à chaque image dans le jeu, et
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

## 2. Zone (`AREA`)

Format : `DATA_MODEL.md` § 6.6, « `AREA` → zones géographiques ». En-tête de 45 octets (forme, nom de 32 octets,
3 `int32` 24.8), puis selon la forme 1, 2 ou 5 `int32` 24.8. Enregistrements de 49, 53 ou 65 octets, sans compteur.

Lecture pour libRealSpace : toutes les valeurs ÷ 256, en mètres ; point `x = c0`, `y = c2`, `z = −c1`.

```cpp
struct AREA {
    int id;                  // rang + 1 (convention actuelle, gardée)
    unsigned char AreaType;  // 'S', 'C', 'B'
    char AreaName[33];
    Vector3D position;       // centre (S) ; centre du plancher (C, B)
    float radius;            // S, C
    float height;            // C, B : vers le haut depuis le plancher
    float east;              // B : vers +X
    float west;              // B : vers −X
    float north;             // B : vers −Z (c1 positif)
    float south;             // B : vers +Z
    unsigned int AreaWidth;  // taille totale le long de X (diamètre, ou largeur de la boîte)
    unsigned int AreaHeight; // taille totale le long de Z
    bool contains(const Vector3D &point) const;
    void boundsXZ(float *minX, float *maxX, float *minZ, float *maxZ) const;
    bool visibleOnMap() const;
};
```

**Test d'appartenance** (`AREA::contains`), bornes incluses, comme le jeu :
- sphère (`HitShape_Sphere_ContainsPoint_52E91`) : distance 3D au centre ≤ rayon ;
- cylindre (`HitShape_Radial2D_ContainsPoint_52F99`) : y entre le plancher et plancher + hauteur, distance dans le
  plan X/Z ≤ rayon ;
- boîte (`HitShape_Box_ContainsPoint_52F0F`) : x de X − ouest à X + est, z de Z − nord à Z + sud, y entre le
  plancher et plancher + hauteur. Citation : `mov eax, es:[bx+22h]` / `add eax, es:[bx+2Eh]` (est) ;
  `sub eax, es:[bx+32h]` (ouest) ; `add eax, es:[bx+36h]` et `sub eax, es:[bx+3Ah]` sur c1 (nord, sud) ;
  `add eax, es:[bx+3Eh]` sur l'altitude (hauteur).

`AreaWidth` et `AreaHeight` restent pour l'affichage (carte de navigation, outil de mise au point), mais avec un
sens fixe : la taille totale dans le plan X/Z. Une boîte n'est **pas centrée** sur son point de référence :
`boundsXZ` donne le rectangle réel.

`visibleOnMap()` : la carte de navigation du jeu ne trace pas les zones dont le nom commence par « . »
(`NavMap_DrawMissionObjects_7EDCA` : `cmp byte ptr es:[bx+2], 2Eh`) ; dans `MISN-1A`, c'est l'espace interdit.
Elle ne trace que les zones des scènes actives (`cmp byte ptr [di], 0`).

## 3. Scène (`SCNE`)

En-tête de 24 octets (`MissionScene_ParseRecord_AA3A5` : `push large 18h` / `ResourceRecord_ReadFieldGroupA_64A19`),
puis (taille − 24) ÷ 2 mots : les objets de la scène, index dans `PART`.

| Octets | Champ proposé | Emploi dans STRIKE.EXE |
|---|---|---|
| 0 | `is_active` | la scène peut être choisie (`Scene_FindMatchingByAreaContainment_53236` : `cmp byte ptr [di], 0`) ; l'opcode 0x80 la rend active |
| 1, 2 | `area_id` | index `AREA` ; −1 ou hors liste = pas de zone (`PtrList_GetAt_53034`) |
| 3, 4 | `on_is_activated` | quand la scène devient courante, après l'apparition de ses objets (`Scene_TriggerActivation_531CD`) |
| 5, 6 | `on_update` | **à chaque image**, pour la scène globale puis pour la scène courante (`MAIN_GAME_TICK` → `Scene_RunUpdateScript_531F2`) |
| 7, 8 | `on_leaving` | **quand la scène cesse d'être courante** (`Scene_DetectAndActivateChange_532EA` → `Scene_RunLeavingScript_53211`), **et en fin de mission** |
| 9 | `field_9` | rangé en mémoire par le chargeur ; rôle non établi (0 ou 1 dans les données) |
| 10, 11 | `field_10` | rangé en mémoire ; rôle non établi (0, 90, 135, 180 ou 270 dans les données) |
| 12 à 23 | `field_12` | 3 `int32` 24.8 rangés en mémoire ; lus comme un point (`x = c0`, `y = c2`, `z = −c1`) ; rôle non établi |
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

## 4. Scène globale, scène courante, ordre des scripts

`SCMissionScenes.h` (`SCSceneTracker`) reproduit cet ordre et renvoie une suite d'événements (`ACTIVATE`,
`UPDATE`, `LEAVE`, avec la scène et le script). libRealSpace les exécute : apparition des objets (`cast`) puis
script.

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
- **Chaque image** (`MAIN_GAME_TICK`) : `on_update` de la scène globale ; changement éventuel ; `on_update` de la
  scène courante.
- **Fin de mission** : `on_leaving` de la scène globale (son bilan), puis de la scène courante.

Vol simulé dans `MISN-1A` par l'essai (§ 6) : départ sur la base, passage dans l'espace interdit, retour :

```
chargement      scène 0 (globale) : activation
chargement      scène 1 (base)    : activation
image 1         scène 0 : on_update
image 1         scène 1 : on_update
image 2         scène 0 : on_update
image 2         scène 1 : on_leaving
image 2         scène 2 (espace interdit, 3 MiG-21) : activation
image 2         scène 2 : on_update
image 3         scène 0 : on_update
image 3         scène 2 : on_leaving
image 3         scène 1 : activation
image 3         scène 1 : on_update
fin de mission  scène 0 : on_leaving (programme 1, bilan)
fin de mission  scène 1 : on_leaving
```

## 5. Branchement proposé dans `RSMission`

Les structures `AREA` et `MISN_SCEN` de `RSMissionAreas.h` remplacent celles de `RSMission.h`. Les deux lecteurs
deviennent :

```cpp
void RSMission::parseMISN_AREA(uint8_t *data, size_t size) {
    this->mission_data.areas = readAreas(data, size);
}

void RSMission::parseMISN_PLAY_SCEN(uint8_t *data, size_t size) {
    MISN_SCEN *scene = readScene(data, size);
    if (scene != nullptr) {
        this->mission_data.scenes.push_back(scene);
    }
}
```

Ce qui change pour les lecteurs de ces structures :
- `MISN_SCEN::on_mission_update` disparaît. Le 2e script s'appelle `on_update`, et `on_leaving` désigne
  maintenant le **3e** script (octets 7 et 8). Lecteurs actuels : `SCMissionScene.cpp`, `DebugStrike.cpp`.
- `MISN_SCEN::cast` passe en `uint16_t`.
- `AREA::AreaWidth` et `AreaHeight` : taille totale dans le plan X/Z (avant : rayon pour une sphère, hauteur et
  rayon pour un cylindre). Pour une boîte, `boundsXZ` donne le rectangle réel.
- Appartenance : `AREA::contains(point)` au lieu du carré de `getAreaID` ; choix de la scène :
  `findSceneAt` ou `SCSceneTracker`.
- `AREA::id` garde sa valeur (rang + 1). L'index d'une zone dans le fichier est son rang dans
  `mission_data.areas`.

## 6. Essais

```bash
tools/mission_ref/build.sh <libRealSpace> /tmp/mission_ref_build
/tmp/mission_ref_build/mission_test DATA/MISSIONS/*.IFF
```

Sur les 72 fichiers de `MISSIONS` : 49 missions lues, 23 refusées par la version (chunk `VERS` absent ou < 1280,
comme le jeu : erreur 13970). 237 zones (189 sphères, 15 cylindres, 40 boîtes). Chaque zone contient le point situé
1 m au-dessus de son point de référence. Chaque mission a une scène globale.

Détail de `MISN-1A` (les valeurs lues) :

| Zone | Forme | Nom | Référence (X, Y, Z) | Tailles |
|---|---|---|---|---|
| 0 | sphère | STRIKE BASE | −70 000, 2 580, −130 000 | rayon 20 000 |
| 1 | boîte | .RESTRICTED AIRSPACE | −40 000, 3 395, 57 000 | est 50 000, ouest 0, nord 0, sud 50 000, hauteur 100 000 |
| 2 | cylindre | CARGO DESTINATION | 0, 4 100, 97 000 | rayon 5 000, hauteur 50 000 |
| 3 | sphère | NOUAKCHOTT | −127 000, 245, 55 000 | rayon 25 000 |
| 4 | sphère | RENDEZVOUS | −45 000, 4 000, −45 000 | rayon 25 000 |

## 7. Points ouverts

- **Octets 9 à 23 d'une scène** : rangés en mémoire, aucun lecteur trouvé dans les fonctions de scène lues.
- **Bit 3 des objets** : `Scene_LeaveMarkUnits_5317A` le pose sur les objets de la scène quittée qui ont un 4e
  script `PART` ; `Scene_EnsureUnitsSpawned_530FF` l'efface sur ceux déjà présents à l'activation. Rôle non établi.
- **Premier passage après le chargement** : `MissionScenario_LoadMainRecord_A8331` appelle
  `Scene_DetectAndActivateChange_532EA` avec une ancienne scène nulle (`push 0`) et ne range pas le résultat en
  `MissionScenario+80`. À la première image, la scène courante serait donc de nouveau vue comme nouvelle.
  `Scene_EnsureUnitsSpawned_530FF` ne recrée pas les objets déjà présents, mais le 1er script repasserait. Non
  vérifié en jeu ; `SCSceneTracker` ne l'active qu'une fois.
- **Fin de mission** : `STRIKE_EXE_MAIN_LOOP` lance le 3e script de la scène globale jusqu'à 3 fois, entre des
  ajustements du score (`dword_706AB`), avant `MissionScenario_RecomputeFields_A9382`. `SCSceneTracker::finish` le
  lance une fois.
