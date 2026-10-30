# Zones et scènes des missions : correction proposée pour libRealSpace

Rédigé le 2026-10-30, refait le même jour sur les classes existantes. Repère de libRealSpace (Y = altitude),
mètres, nombres en décimal. Format complet des chunks : `DATA_MODEL.md` § 6.6.

**Le livrable est un patch sur libRealSpace** : `tools/mission_ref/librealspace_zones_scenes.patch` (`git diff`
sur le commit `c5fa505` du 2026-10-27, à appliquer avec `git apply`). Il modifie les classes qui existent —
`AREA`, `MISN_SCEN` et `RSMission` (lecture), `SCMission` et `SCMissionScene` (choix de la scène et scripts) —
en gardant leurs noms et leurs champs, et n'ajoute que ce qui manque. Tous les fichiers de `strike_commander/`,
`realspace/`, `engine/` et `DebugStrike.cpp` compilent avec le patch. L'essai `mission_areas_test.cpp` appelle le
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
`SCStrike.cpp` ligne 792, `SCNavMap.cpp` lignes 477 à 481). Le patch garde cette convention.

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

## 2. Le patch, fichier par fichier

### `RSMission.h` — `AREA` et `MISN_SCEN`

- `AREA` garde tous ses champs et reçoit les tailles exactes du fichier : `radius` (sphère, cylindre), `height`
  (cylindre, boîte, vers le haut depuis le plancher), `east`, `west`, `north`, `south` (boîte), en mètres. Et une
  méthode `bool contains(const Vector3D &point) const`.
- `AreaWidth` et `AreaHeight` gardent **les mêmes valeurs qu'avant** (sphère : rayon et rayon ; cylindre : hauteur et
  rayon ; boîte : étendue est et étendue sud), pour ne rien changer à la carte de navigation et à l'outil de mise au
  point. Seule différence : la hauteur d'un cylindre n'est plus tronquée à 16 bits.
- `MISN_SCEN` : mêmes champs ; les commentaires disent maintenant quand chaque script tourne.

### `RSMission.cpp` — lecture

- `parseMISN_AREA` réécrite : nom sur 32 octets, `ReadInt32LE() / 256.0f` pour chaque valeur, tailles lues selon la
  forme (sphère : rayon ; cylindre : hauteur puis rayon ; boîte : est, ouest, nord, sud, hauteur). Le pas de 49, 53
  ou 65 octets suit la forme ; une lettre inconnue arrête la lecture (le jeu s'arrête sur l'erreur 36877). `id`
  reste le rang + 1.
- `AREA::contains` : le test du jeu, bornes incluses (§ 3.1).
- `parseMISN_PLAY_SCEN` : seulement l'ordre des scripts. Le 2e script du fichier (octets 5 et 6) va dans
  `on_mission_update`, le 3e (octets 7 et 8) dans `on_leaving` ; c'était l'inverse (§ 4).

### `SCMissionScene` — les trois moments d'une scène

- `activate()` : l'ancien `onSceneActivated`, appelé directement. Même apparition des objets de la scène, puis le
  script d'activation.
- `runMissionUpdate()` et `runLeaving()` : lancent le 2e et le 3e script.
- `runProg(id)` : le lancement d'un script, écrit une seule fois au lieu de trois.
- La scène ne s'abonne plus au bus de messages : `SCMission` l'appelle dans l'ordre du jeu.

### `SCMission` — choix de la scène

- `global_scene`, `current_scene` : la scène globale et la scène courante.
- `findSceneAt(position)` : la première scène active, dans l'ordre du fichier, dont la zone contient le point.
- `startScenes()`, appelée à la fin de `loadMission` : active la scène globale, puis la scène où se trouve le joueur.
- Dans `update()`, la boucle qui publiait des activations est remplacée par l'ordre du jeu : `on_mission_update` de la
  scène globale ; si la scène courante change, `on_leaving` de l'ancienne puis `activate()` de la nouvelle ;
  `on_mission_update` de la scène courante.
- `finishScenes()`, appelée par `setExitCode` quand la mission se termine (une seule fois, avant `buildReport`) :
  `on_leaving` de la scène globale (le bilan, qui écrit les variables de résultat), puis de la scène courante.
- `getAreaID` : même règle qu'avant (la plus petite zone qui contient le point), mais le test est `contains` au lieu
  du carré de côté `AreaWidth` sans altitude. Elle sert encore à `SCMissionActors::ifTargetInSameArea` et à
  `DebugStrike`.

## 3. Ce que le patch change dans le jeu

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
tools/mission_ref/build.sh <libRealSpace avec le patch> /tmp/mission_ref_build
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
  vérifié en jeu ; le patch ne l'active qu'une fois.
- **Fin de mission** : `STRIKE_EXE_MAIN_LOOP` lance le 3e script de la scène globale jusqu'à 3 fois, entre des
  ajustements du score (`dword_706AB`), avant `MissionScenario_RecomputeFields_A9382`. `SCMission::finishScenes` le
  lance une fois.
