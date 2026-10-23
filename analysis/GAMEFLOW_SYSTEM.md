# Déroulement de la campagne (GAMEFLOW, OPTEST.EXE)

> **Nombres en décimal** (arguments, champs `+n`). Les adresses de code citées sont aussi en
> décimal ; les fichiers annotés les écrivent en hexadécimal. Les commandes des scripts sont
> désignées par leur **nom** (table du § 5.2, qui donne aussi leur valeur) ; une suite de script
> s'écrit une instruction par ligne, avec son argument.

Lu le 2026-10-22 dans `analysis/optest/annotated_segments/` (seg002 : boucle et interpréteur ;
ovr184 à ovr189 : fonctions des commandes). Adresses de l'OPTEST.EXE **disquette**, sauf au § 8
(OPTTEST.EXE du CD-ROM, lu avec `tools/exe_disasm.py`). Comptes des données : `GAMEFLOW.IFF` de
`BIGTRE.TRE`, relus par un lecteur indépendant ; ils sont identiques au dump de libRealSpace
(`gameflow_parsed.txt`).

Les conversations lancées par le script sont décrites dans `CONV_SYSTEM.md`, les cinématiques dans
`MIDGAME_SYSTEM.md`.

## 1. Fichiers

| Fichier | Rôle |
|---|---|
| `GAMEFLOW\GAMEFLOW.IFF` | la campagne : missions, scènes, sprites et leurs scripts, cartes, chargements d'armes, liste des missions, escadres, changements |
| `GAMEFLOW\OPTIONS.IFF` | les décors des scènes (`OPTS` / `SCEN`), les plans fixes (`ESTB` / `SHOT`), les marques de victoires (`MARK`) |
| `misn2op.iff` | compte rendu de vol écrit par STRIKE.EXE, lu au retour (§ 6) |
| `op2misn.iff` | ordre de mission écrit pour STRIKE.EXE avant un vol (`MLST`, `DATA`, `PRTL`) |
| `gensave.tmp` | sauvegarde automatique (au début d'une mission, § 3) |
| `tmpsav.tmp` | état de la partie juste avant un vol, rechargé au retour (§ 6) |
| `*.sav` | sauvegardes du joueur (`SAVE_GAME`, `LOAD_GAME`) |

## 2. GAMEFLOW.IFF

Formes de premier niveau (relevées dans les données) :

| Forme | Contenu |
|---|---|
| `FORM GAME` | 49 × `FORM MISS` : `INFO`, `EFCT` (script de la mission), `FORM SCEN`* |
| `FORM SCEN` (dans une mission) | `INFO` (numéro de la scène), `FORM SPRT`* |
| `FORM SPRT` (dans une scène) | `INFO` (numéro du sprite), `EFCT` (script joué au clic), `REQU` (conditions de visibilité, facultatif) |
| `FORM WRLD` | `FORM MAPS`* : `INFO`, `SPED`, `DATA` (cartes de `SHOW_MAP`) |
| `FORM LOAD` | chunks `LOAD` : chargements d'armes par défaut (`WEAPON_LOADOUT`) |
| `FORM MLST` | `DATA` (noms des fichiers de mission), `PRTL` |
| `FORM WNGS` | `FORM WING`* : `INFO`, `PILT`, `ORDR` (escadres, commandes d'escadre et de choix d'équipier des conversations) |
| `FORM STAT` | `FORM CHNG`* : `INFO`, `CASH`, `OVER`, `WEAP`, `PILT` (changements, `APPLY_CHANGE`) |

**Script `EFCT`** : suite de paires d'octets **(commande, argument)** ; longueur = taille du chunk.

**`REQU`** : suite de paires **(condition, numéro de drapeau)**, § 4.

**`LOAD`** (un chunk par chargement) : 1er octet = numéro du chargement, puis des paires
(arme, nombre).

**`CHNG`** : `INFO` = numéro du changement ; `CASH` et `OVER` = octet opération + dword valeur ;
`WEAP` = octet opération, octet arme, mot nombre (répété) ; `PILT` = octet opération, octet pilote,
octet compteur (0 ou 1), mot valeur (répété). Opérations : 0 = ajouter, 1 = retirer, 2 = remplacer.
Les montants de `CASH` et `OVER` sont en **milliers** (libRealSpace les multiplie par 1000 pour
retrouver les vrais montants).

## 3. Boucle principale (`Gameflow_MainLoop_3D2E`)

Machine à états sur l'octet **`[partie+232]`** :

| Valeur | Posée par | Effet au tour suivant de la boucle |
|---|---|---|
| 0 | départ, fin de partie (`CHECK_GAME_OVER`) | menu d'accueil (`Gameflow_MainMenu_4F1A7`) |
| 1 | `FLY_MISSION_NOW`, `START_FLIGHT`, écran d'armement (`WEAPON_LOADOUT`) | **départ en vol** : sauf si `[+249]` = 254, `Gameflow_SaveTmpState_4BBA0` fait passer à la mission suivante (`[+250]` = `[+251]`, posé par `SET_NEXT_MISSION` ; `[+251]` = 255), retire de l'argent `[+635]` les frais généraux `[+639]` et les achats du catalogue `[+643]` (remis à 0), puis sauvegarde `tmpsav.tmp` ; écriture d'`op2misn.iff` (`Gameflow_WriteMissionOrder_4BBF7`), sortie d'OPTEST pour STRIKE.EXE. Au retour : compte rendu (§ 6) |
| 2 | `GOTO_NEXT_MISSION` | **mission suivante** : mission courante `[+250]` = `[+251]` (posé par `SET_NEXT_MISSION`), `[+251]` = 255 |
| 3 | `LOAD_GAME`, menu | chargement du fichier choisi (nom en `partie+147`) |
| 4 | la boucle elle-même | **dans les scènes** |

Après le traitement de l'état : `[+232]` = 4, puis

1. lecture du script de la mission courante `[+250]` (`Gameflow_LoadMissionScript_4A440` : `MISS`
   / `INFO`, `EFCT`) et **exécution** (`Gameflow_RunScriptPairs_36CF`) — au début de chaque mission
   **et au retour de chaque vol** (sauf code de sortie 3, § 6) ; comme le départ a déjà fait passer
   à la mission désignée par `SET_NEXT_MISSION`, c'est le script de **cette** mission qui lit le
   résultat du vol : la mission elle-même quand son script désigne son propre numéro (MISS 2 :
   `SET_NEXT_MISSION 2`), sinon la suivante (MISS 0 : `SET_NEXT_MISSION 1` ; le vol de MISN-1a est
   lu par le script de MISS 1, qui commence par `IF_MISSION_SUCCESS 0`). Après
   un chargement de partie (état 3) et un code de sortie 3, le script n'est pas joué ;
2. si `[+232]` vaut alors 4 ou 2 : sauvegarde automatique `gensave.tmp` ;
3. tant que `[+232]` = 4 : une scène (`Gameflow_PlayScene_3B0B`) ;
4. si `[+232]` = 1 : départ en vol (ci-dessus).

**Une scène** (`Gameflow_PlayScene_3B0B`) : si `[+227]` est posé (`PLAY_SCENE`), la scène
`[+252]` est reconstruite (`Gameflow_BuildScene_4A60B`, visibilité des sprites par `REQU`) ; la
scène est affichée avec la musique `[+233]`, le joueur clique un sprite, et le script `EFCT` de ce
sprite est exécuté.

## 4. Visibilité des sprites (`REQU`, `Gameflow_CheckSpriteRequirements_3604`)

Relu le 2026-10-22, dans la version disquette et dans la version CD (code identique, 23627 dans
l'OPTTEST.EXE du CD).

### 4.1 Quand et avec quel effet

- `REQU` est évalué **à la construction de la scène** (`Gameflow_BuildScene_4A60B`, seul appel),
  c'est-à-dire quand `PLAY_SCENE` a posé `[+227]` (et au début de chaque mission).
- Un sprite dont les conditions échouent **n'est pas ajouté à la scène** (`sub_34F6` n'est pas
  appelé) : ni dessiné, ni cliquable. Un sprite sans `REQU` est toujours ajouté.
- Les drapeaux sont les octets `[partie+253 + n]`, posés par `SET_FLAG`, effacés par `CLEAR_FLAG`. Un drapeau
  changé par le script d'un sprite ne change la visibilité qu'à la reconstruction suivante.

### 4.2 Les conditions

`REQU` = suite de paires (condition, n). Deux variables : `visible` (vrai au départ) et
`ignorer` (faux au départ). Noms utilisés dans ce document :

| Valeur | Nom | Effet | Données |
|---|---|---|---|
| 0 | `REQUIRE_NOT_SET` | si le drapeau n est posé et que `ignorer` est faux → `visible` = faux ; puis `ignorer` = faux | 276 |
| 1 | `REQUIRE_SET` | si le drapeau n n'est pas posé et que `ignorer` est faux → `visible` = faux ; puis `ignorer` = faux | 158 |
| 2 | `OR_NOT_SET` | si le drapeau n n'est **pas** posé → `ignorer` = vrai (sinon inchangé) | 14 |
| 3 | `OR_SET` | si le drapeau n est posé → `ignorer` = vrai (sinon inchangé) | 11 |
| autre | — | rien | 1 (valeur 9) |

En logique : toutes les conditions `REQUIRE_*` sont liées par **ET** ; une condition `OR_*` ajoute
un **OU** à la condition `REQUIRE_*` qui la suit :

- `REQUIRE_NOT_SET n` = drapeau n non posé ; `REQUIRE_SET n` = drapeau n posé ;
- `OR_NOT_SET a`, X = drapeau a non posé **ou** X ; `OR_SET a`, X = drapeau a posé **ou** X ;
- plusieurs `OR_*` de suite s'additionnent : `OR_NOT_SET a`, `OR_NOT_SET b`, X = a non posé **ou**
  b non posé **ou** X ;
- seules les conditions `REQUIRE_*` remettent `ignorer` à faux ; une condition `OR_*` fausse ne
  l'efface pas ;
- une condition `OR_*` en **dernière** position (ou suivie seulement de valeurs inconnues) n'a aucun
  effet.

### 4.3 Exemples des données

- **Mission 0, scène 11, sprite 3** : visible si le drapeau 102 n'est pas posé ; son script pose
  102, il disparaît donc après la conversation 12.

  ```
  REQUIRE_NOT_SET 102
  ```

- **Mission 9, scène 1, sprite 8** : visible si (3 posé ou 4 posé) et 42 non posé.

  ```
  OR_SET 3
  REQUIRE_SET 4
  REQUIRE_NOT_SET 42
  ```

- **Mission 9, scène 6, sprite 0** : visible si 42, 43 ou 44 n'est pas posé (caché quand les
  trois sont posés).

  ```
  OR_NOT_SET 42
  OR_NOT_SET 43
  REQUIRE_NOT_SET 44
  ```

- **Mission 12, scène 20, sprite 18** : visible si 42 est posé et (43 non posé ou 44 non posé).

  ```
  REQUIRE_SET 42
  OR_NOT_SET 43
  REQUIRE_NOT_SET 44
  ```

- **Mission 23, scène 20, sprite 12** : **toujours** visible : la valeur 9 est ignorée, les deux
  `OR_NOT_SET` n'ont plus de condition à faire ignorer.

  ```
  OR_NOT_SET 201
  OR_NOT_SET 202
  (valeur 9) 203
  ```

Formes des 215 `REQU` des données (suite des conditions) : `REQUIRE_NOT_SET` seul × 59,
`REQUIRE_SET` seul × 26, `REQUIRE_SET` + `REQUIRE_NOT_SET` × 24, deux `REQUIRE_NOT_SET` × 17,
`REQUIRE_NOT_SET` + `REQUIRE_SET` × 13, trois `REQUIRE_SET` × 9, cinq `REQUIRE_NOT_SET` × 7,
`OR_SET` + `REQUIRE_SET` + `REQUIRE_NOT_SET` × 6, … ; une condition `OR_*` apparaît dans 22 d'entre
elles.

### 4.4 Code de référence

Fichier `tools/gameflow_ref/requ.cpp` (compilé, style du dépôt, avec un essai sur le sprite 8 de
la mission 9) :

```cpp
// Conditions du chunk REQU (GAMEFLOW_SYSTEM.md § 4.2)
enum RequCondition {
    REQUIRE_NOT_SET = 0,
    REQUIRE_SET = 1,
    OR_NOT_SET = 2,
    OR_SET = 3
};

// Visibilité d'un sprite d'après son chunk REQU (Gameflow_CheckSpriteRequirements_3604).
// requ : paires (condition, numéro de drapeau) ; flags : drapeaux de la partie (SET_FLAG / CLEAR_FLAG).
bool spriteIsVisible(const uint8_t *requ, size_t size, const bool *flags) {
    bool visible = true;
    bool skipNext = false;
    for (size_t i = 0; i + 1 < size; i += 2) {
        uint8_t condition = requ[i];
        bool flag = flags[requ[i + 1]];
        switch (condition) {
        case REQUIRE_NOT_SET:
            // caché si le drapeau est posé, sauf si la condition est ignorée
            if (flag && !skipNext) {
                visible = false;
            }
            skipNext = false;
            break;
        case REQUIRE_SET:
            // caché si le drapeau n'est pas posé, sauf si la condition est ignorée
            if (!flag && !skipNext) {
                visible = false;
            }
            skipNext = false;
            break;
        case OR_NOT_SET:
            // drapeau non posé : la prochaine condition REQUIRE_* est ignorée
            if (!flag) {
                skipNext = true;
            }
            break;
        case OR_SET:
            // drapeau posé : la prochaine condition REQUIRE_* est ignorée
            if (flag) {
                skipNext = true;
            }
            break;
        default:
            // valeur inconnue : ignorée
            break;
        }
    }
    return visible;
}
```

### 4.5 Comparaison avec `SCZone::isActive` de libRealSpace (fourni le 2026-10-22)

Les deux règles ont été rejouées sur les 215 `REQU` des données, pour toutes les combinaisons des
drapeaux de chaque sprite.

| Cas | Sprites |
|---|---|
| même résultat dans tous les cas | 87 |
| même résultat si tous les drapeaux sont présents dans `requierd_flags`, différent sinon | 127 |
| différent même avec tous les drapeaux présents | 1 |

1. **Drapeau absent de `requierd_flags`.** `isActive` saute la condition quand le drapeau n'est
   pas dans la map (`find(...) == end()`). Dans le jeu, un drapeau jamais posé vaut 0, donc
   « non posé ». Exemple : sprite 12 de la scène 11 de la mission 4, `REQU` = `REQUIRE_SET 0`, visible
   seulement quand le drapeau 0 est posé ; tant que le drapeau 0 n'a jamais été posé ni effacé,
   libRealSpace l'affiche et le jeu le cache. C'est la différence des 127 sprites ; elle disparaît
   si la map contient tous les drapeaux dès le début de la partie (non vérifié dans le code de
   libRealSpace fourni).
2. **Les « ou ».** `isActive` combine les termes de gauche à droite (`(P et ¬a) ou X` pour
   P, `OR_NOT_SET a`, X) alors que le jeu calcule `P et (¬a ou X)`. Grâce à l'arrêt anticipé
   (`if (!isActive && !nextOpIsOr) break;`), le résultat est le même sur toutes les données.
3. **Valeur inconnue après un `OR_*`.** Le seul cas des données : sprite 12 de la scène 20 de la
   mission 23, dont le `REQU` est :

   ```
   OR_NOT_SET 201
   OR_NOT_SET 202
   (valeur 9) 203
   ```

   Le jeu l'affiche toujours ; `isActive` calcule « 201 non posé ou 202 non posé » et le **cache
   quand 201 et 202 sont posés** (le « ou » reste ouvert, la valeur 9 est ignorée). Ce sprite porte
   le départ en vol de la mission 23 :

   ```
   SELECT_MISSION 20
   PLAY_CONV 127
   WEAPON_LOADOUT 12
   ```
4. **Moment de l'évaluation.** Dans le jeu, la visibilité n'est calculée qu'à la construction de
   la scène (§ 4.1). Où `isActive` est appelé dans libRealSpace n'est pas dans le code fourni :
   s'il l'est à chaque image, un sprite peut disparaître juste après son clic, alors que le jeu le
   garde jusqu'à la reconstruction de la scène.

**Correction proposée** : `tools/gameflow_ref/sczone_isactive.cpp` — la méthode
`SCZone::isActive` réécrite sur la règle du jeu (drapeau absent = non posé, `OR_*` = « ignorer la
condition `REQUIRE_*` suivante », valeur inconnue ignorée), même signature ; compilée avec des types
simulés et testée sur `REQUIRE_SET 0`.

`SCGameFlow::playEndMission` décide aussi de passer à la mission suivante d'après `REQU` (sprite
sans `REQU`, ou avec une condition `REQUIRE_SET`). Dans le jeu, le passage à la mission suivante est fait par
`SET_NEXT_MISSION` puis `GOTO_NEXT_MISSION` (§ 5.2) ; aucun lien entre `REQU` et ce passage n'a été vu
dans le code lu.

## 5. Interpréteur des scripts (`Gameflow_RunScriptPairs_36CF`)

### 5.1 Blocs conditionnels

- Un **test** qui échoue pose l'état « saut » : les commandes suivantes sont sautées jusqu'à
  **`ELSE`** (l'état bascule) ou **`ENDIF`** (fin de bloc : l'état saut est effacé).
- Un test qui réussit ne fait rien : il n'ouvre pas de niveau.
- Pendant un saut, chaque test rencontré (`IF_NOT_FLAG`, `IF_FLAG`, `IF_MISSION_ACCEPTED`,
  `IF_MISSION_REFUSED`, `WEAPON_LOADOUT`, `IF_TRUE`, `IF_MISSION_SUCCESS`, `IF_PLANES_LOST`,
  `IF_RESULT_3`) ajoute un niveau, et `ELSE` / `ENDIF` de ce niveau ne font que le refermer ; seuls
  `ELSE` / `ENDIF` au niveau 0 agissent.
- Un test sans `ENDIF` saute **jusqu'à la fin du script** (cas de `WEAPON_LOADOUT` dans les données).
- **`OR_GROUP` n** (absent des données) : pendant les n commandes suivantes, chaque commande doit être un
  test (sinon erreur fatale « Faulty OR structure in gameflow file ») et elle est évaluée même si un
  test précédent a échoué. Le nom vient du message ; l'effet exact n'est pas celui d'un « ou »
  (un test qui échoue pose toujours l'état saut), à ne pas porter sans données qui l'utilisent.
- **`CHECK_GAME_OVER`** peut arrêter le script (fin de partie).

### 5.2 Les commandes

« Nom » = nom utilisé dans ce document, d'après l'effet dans le jeu (la constante de libRealSpace
est au § 7.1). « Données » = nombre d'occurrences dans `GAMEFLOW.IFF` (MISS = script de mission,
SPRT = script de sprite).

| Valeur | Nom | Données | Effet dans le jeu |
|---|---|---|---|
| 0 | `PLAY_CONV` | 285 | conversation n (`Gameflow_PlayConversation_4AAAB`) |
| 1 | `PLAY_SCENE` | 391 | scène courante `[+252]` = n, `[+227]` = 1 : la scène n est (re)construite après le script |
| 2 | `PLAY_MIDGAME` | 12 | cinématique n (`Gameflow_PlayMidgame_4ABE0`) |
| 3 | `FLY_MISSION_NOW` | 3 | mission à voler `[+249]` = n et **départ en vol** (`[+232]` = 1), sans écran d'armement |
| 4 | `NOP_4` | 43 (SPRT) | **rien** (dans les deux versions) |
| 5 | `SELECT_MISSION_ALT` | 0 | `[+249]` = n (comme `SELECT_MISSION`) |
| 6 | `SET_FLAG` | 204 | drapeau n posé |
| 7 | `CLEAR_FLAG` | 93 | drapeau n effacé |
| 8 | `PLAY_SHOT` | 118 | plan fixe n d'`OPTIONS.IFF` (`ESTB` / `SHOT`, `Gameflow_PlayShot_4AD86`) |
| 9 | `IF_NOT_FLAG` | 17 | test : réussit si le drapeau n n'est pas posé |
| 10 | `IF_FLAG` | 47 | test : réussit si le drapeau n est posé |
| 11 | `NOP_11` | 0 | rien |
| 12 | `SELECT_MISSION` | 48 (SPRT) | mission à voler `[+249]` = n (le vol part de l'écran d'armement, `WEAPON_LOADOUT`) |
| 13 | `SET_NEXT_MISSION` | 93 | mission suivante `[+251]` = n |
| 14 | `START_FLIGHT` | 0 | départ en vol (`[+232]` = 1) |
| 15 | `GOTO_NEXT_MISSION` | 29 | passage à la mission suivante (`[+232]` = 2) |
| 16 | `SAVE_GAME` | 54 | choix d'un fichier (`Gameflow_SaveRequester_4D984`) ; s'il est donné, sauvegarde dans ce fichier puis dans `gensave.tmp` |
| 17 | `LOAD_GAME` | 54 | choix d'un fichier (`Gameflow_LoadRequester_4DDDC`) ; s'il est donné, `[+232]` = 3 |
| 18 | `SHOW_MAP` | 12 | carte n (`WRLD` / `MAPS`, `Gameflow_ShowMap_542AC`) |
| 19 | `LOOK_AT_KILLBOARD` | 54 | tableau des victoires (`Gameflow_KillBoard_51049`) |
| 20 | `IF_MISSION_ACCEPTED` | 20 | test : réussit si la mission a été acceptée dans la dernière conversation (`[+859]` ≠ 0) |
| 21 | `IF_MISSION_REFUSED` | 6 | test : réussit si elle a été refusée |
| 22 | `WEAPON_LOADOUT` | 42 (SPRT) | **écran d'armement** (§ 5.3) ; test : réussit si le joueur part en vol |
| 23 | `VIEW_CATALOG` | 43 | catalogue d'achat d'armes (`Gameflow_Catalog_52662`) |
| 24 | `SET_MUSIC_MOOD` | 11 (MISS) | **humeur musicale** du déroulement `[+233]` = n (`Music_SetGameflowMood_28C73`) ; données : 0, 6, 8 |
| 25 | `LOOK_AT_LEDGER` | 54 | livre de comptes (`Gameflow_Ledger_53686`) |
| 26 | `SHOW_KILL_MARKS` | 27 (MISS) | si le joueur a eu des victoires pendant le vol (`[+237]`, § 6) et n'est pas mort (`[+248]` ≠ 2) : **marques de victoires peintes sur l'avion** (`OPTIONS.IFF` `MARK`, `Gameflow_ShowKillMarks_506AA`) |
| 27 | `REMOVE_PILOT` | 2 (MISS) | **retire le pilote n** du tableau des victoires (`[+675 + n × 26]` = 0 ; n < 8) ; données : 6, 7 |
| 28 | `IF_TRUE` | 0 | test qui réussit toujours (compté comme test pendant un saut, sans effet) |
| 29 | `CHECK_GAME_OVER` | 12 (MISS) | **fin de partie** (`Gameflow_CheckLossConversations_50645`) : plus de 16 avions perdus au total → conversation 254 ; sinon argent < 0 → conversation 255 ; dans les deux cas retour au menu (`[+232]` = 0) et arrêt du script |
| 30 | `ELSE` | 117 | sinon (§ 5.1) |
| 31 | `ENDIF` | 159 | fin de bloc (§ 5.1) |
| 32 | `IF_MISSION_SUCCESS` | 62 | test : réussit si la mission n de `MLST` a été volée **avec succès** (`[+509 + n]` = 1, § 6) |
| 33 | `OR_GROUP` | 0 | groupe de tests (§ 5.1) |
| 34 | `APPLY_CHANGE` | 94 | applique le changement `CHNG` n (§ 5.4, `Gameflow_ApplyChange_50160`) |
| 35 | `IF_PLANES_LOST` | 0 | test : réussit si des avions ont été perdus pendant le dernier vol (`[+234]` ≠ 0) |
| 36 | `PLANES_LOST_CONV` | 27 (MISS) | si des avions ont été perdus pendant le dernier vol : humeur musicale 8, puis conversation **253** si le joueur est mort (`[+248]` = 2), **252** sinon |
| 37 | `IF_RESULT_3` | 7 (MISS) | test : réussit si la 3ᵉ valeur de `STAT` du compte rendu (`[+982]`, § 6) ≠ 0 |
| 38 | `PLAY_GAMEFLOW_TUNE` | 18 (MISS) | **joue le morceau n** de `SOUND\gameflow.dat` (`Music_PlayGameflowTune_28CFC`), gardé en `[+983]` (sauvegardé) ; données : 1 à 5 |

Valeurs au-delà de 38 : rien (disquette). Version CD : quatre commandes de plus, § 8.

### 5.3 Écran d'armement (`WEAPON_LOADOUT`, `Gameflow_WeaponLoadout_51AB3`)

- Chargement par défaut : le chunk `LOAD` dont le 1er octet vaut l'argument
  (`Gameflow_ApplyDefaultLoadout_51830`). Chaque paire (arme, nombre) : nombre borné par le stock,
  rendu pair, posé par paires (un par aile) sur les points d'emport, avec un maximum par côté selon
  l'arme : armes 0 et 1 → 1 ; 8 → 2 ; 7 → 2 ; 4 et 5 → 6 ; 6 → emport central ; autres → 3.
- Le joueur ajoute ou retire des armes (« Add %s (%d) », « Remove %s (%d) »).
- **Sprite 12 cliqué → départ en vol** : `[+232]` = 1, `[+238]` = 1, le test réussit et la
  suite du script est jouée. Autre sortie → le test échoue, la suite du script est sautée.
- Dans les données, `WEAPON_LOADOUT` suit toujours un `SELECT_MISSION`, par exemple (mission 0,
  scène 20, sprite 12 ; chargement 1) :

  ```
  SELECT_MISSION 0
  PLAY_CONV 11
  WEAPON_LOADOUT 1
  ```

### 5.4 Changements `CHNG` (`APPLY_CHANGE`)

| Chunk | Champ modifié | Remarque |
|---|---|---|
| `CASH` | argent `[+635]` (dword) | en milliers ; valeur du fichier ajoutée telle quelle au compteur ; pas de borne |
| `OVER` | frais généraux `[+639]` (dword) | en milliers ; pas de borne |
| `WEAP` | stock de l'arme `[+609 + 2 × arme]` | retrait borné à 0 |
| `PILT` | compteur 0 → `[+671]`, 1 → `[+673]` du pilote (table de 8 × 26 octets) | retrait borné à 0 |

## 6. Retour de vol : compte rendu `misn2op.iff` (`Gameflow_ReadMissionResult_4B544`)

Lu au retour de STRIKE.EXE (état 1). Chunks, dans l'ordre de lecture :

| Chunk | Effet |
|---|---|
| `EXIT` | **code de sortie** → `[+248]` ; 5 → rien d'autre n'est lu |
| — | la partie est rechargée depuis `tmpsav.tmp` (état d'avant le vol) |
| `INFO` | nom de la mission volée |
| `WPNS` | armes restantes : paires (nombre, nom) → stock `[+609]` (9 armes, noms de la table dseg 712) |
| `JETS` | avions perdus pendant le vol → `[+234]` ; total `[+980]` += ; coût `[+647]` = perdus × 500 |
| `STAT` | 8 mots écrits par STRIKE.EXE (`Mission_WriteResultReport_A8F22`) : les 8 **variables de résultat du script de la mission** (instruction `OP_SAVE_VALUE_TO_GAMFLOW_REGISTER` d'`Expr_VM_Interpreter_51106` dans STRIKE.EXE, remises à 0 au début de la mission). OPTEST disquette en lit 3 : 1ʳᵉ = **succès** ; 2ᵉ = gain, ajouté à l'argent `[+635]` ; 3ᵉ → `[+982]` (`IF_RESULT_3`). La version CD en lit 6 (§ 8). Leur sens dépend donc de chaque mission |
| `KILL` | par pilote (nom) : deux compteurs ajoutés à `[+671]` et `[+673]` ; `[+237]` = 1 si le joueur en a (`SHOW_KILL_MARKS`) |
| `DIED` | noms de personnages : ceux de la table dseg 3800 (DiBianca, Templeman, Isaac, Roberts, Baldwin, Yenawine, Savage) ont leur drapeau dseg 3814 remis à 0 (codes `$A`, `$B` des conversations) |
| `SCOR` | ajouté au score `[+984]` |

Puis : la mission est cherchée par son nom dans `GAMEFLOW.IFF` / `MLST` / `DATA` ; son drapeau
`[+509 + index]` = **1 si succès, 2 sinon** (`IF_MISSION_SUCCESS`) ; l'argent est diminué du coût des avions
perdus.

Le code de sortie décide de la suite dans `Gameflow_MainLoop_3D2E` :

| Code | Effet constaté |
|---|---|
| 1, 5 | rien de particulier : le script de la mission est rejoué |
| 2 | cinématique 33 (le joueur est mort), puis menu |
| 3 | rechargement de `gensave.tmp`, le script de la mission n'est **pas** rejoué |
| 4 | menu (`[+231]` = 2) |

Le sens exact des codes 1, 3, 4 et 5 côté STRIKE.EXE n'est pas établi ici.

### 6.1 Ce que les missions mettent dans `STAT` (lu le 2026-10-22)

Les 8 valeurs sont écrites par le script `PROG` de chaque fichier de mission (instruction `OP_SAVE_VALUE_TO_GAMFLOW_REGISTER` ;
bytecode : MISSION_SCRIPT_OPCODES.md, « Instructions de base du bytecode PROG »), presque toujours dans le
programme de **mise à jour de la scène 0**, qui recopie des drapeaux `FLAG` de la mission. Outil :
`python3 tools/mission_prog.py --stat <DATA>/MISSIONS/MISN-*.IFF`.

- **1ʳᵉ valeur (succès)** et **2ᵉ (gain)** : écrites par les 46 fichiers `MISN-*.IFF` ; le gain
  est un calcul propre à chaque mission (ex. MISN-10A : (15 + FLAG[0] − 9 + FLAG[1]) × FLAG[4] ×
  100, où FLAG[4] est le succès).
- **3ᵉ valeur** : écrite par 8 missions seulement ; les autres la laissent à 0.

| Mission | 3ᵉ valeur = | Ce qui pose ce drapeau |
|---|---|---|
| MISN-4C | FLAG[5] | +1 à la destruction du LEARJET (objet 11, programme 7) |
| MISN-6A | FLAG[9] | = 1 à la destruction de l'AWACS (objet 14, programme 18) |
| MISN-8A | FLAG[2] | +1 à la destruction de l'AWACS (objet 21, programme 15) |
| MISN-9AA | FLAG[1] | = 1 à la destruction du BRIGC10 (objet 0, programme 14) |
| MISN-9A | FLAG[3] | +1 à chaque ABRAMS-G ou ZSU-23 détruit, une fois le compteur FLAG[4] ≥ 4 (ABRAMS-G = 2, ZSU-23 = 1 ; programmes 11, 12 → 2) |
| MISN-10A | FLAG[2] | **aucune instruction du script ne l'écrit** (lu aussi par le programme 6 : s'il vaut 1, les objets 5 à 8 ne sont pas activés) |
| MISN-12B | FLAG[1] | = 1 à la destruction de RWYEXT18 (objet 0, camp 1, programme 9) ; aussi recopié dans la 8ᵉ valeur |
| MISN-15A | FLAG[4] | = 1 quand le joueur quitte la scène 0 (programme 13, qui donne aussi le code de sortie 1) |

Le tableau FLAG part des valeurs du chunk `FLAG` (toutes à 0 dans MISN-10A). Je n'ai pas trouvé
dans STRIKE.EXE d'autre écriture dans ce tableau que les instructions du script : avec ces données,
la 3ᵉ valeur de MISN-10A reste à 0 (à confronter à ce que montre le jeu).

**Ce que GAMEFLOW.IFF en fait** (`IF_RESULT_3` ; le script d'une mission est joué à l'entrée, donc avec le
compte rendu du vol précédent, puis après chacun de ses vols) :

| Script | Vol lu | Effet |
|---|---|---|
| MISS 12 (MISN-4c) | son propre vol (Learjet) | si drapeau 42 : `APPLY_CHANGE 22` ; puis drapeau **71** = 3ᵉ valeur ≠ 0. Sprite 5 de la scène 29 visible si 42 et 71 |
| MISS 18 (MISN-6b / 6x) | MISN-6a (AWACS) | drapeau **214** ; sprite 12 de la scène 20 : 214 → vole **MISN-6b**, sinon **MISN-6x** ; sprite 2 de la scène 29 de MISS 19 selon 214 |
| MISS 26 (MISN-8b / 8x) | MISN-8a (AWACS) | drapeau **211** → **MISN-8b**, sinon **MISN-8x** ; sprite 5 de la scène 29 de MISS 27 selon 211 |
| MISS 30 (MISN-9a) | MISN-9aa (BRIGC10), puis son propre vol | mission suivante = 31 (MISN-9b) ; si la 3ᵉ valeur ≠ 0 : drapeau **215** et **passage immédiat à la mission suivante** (`GOTO_NEXT_MISSION`), MISN-9a n'est pas jouée |
| MISS 33 (MISN-10b / 10x) | MISN-10a | drapeau **213** → **MISN-10b**, sinon **MISN-10x** ; sprite 19 de la scène 29 de MISS 34 selon 213 |
| MISS 41 (MISN-12b) | son propre vol (RWYEXT18) | si drapeau 50 et 3ᵉ valeur ≠ 0 : argent remplacé par 0, puis − 2 000 milliers, puis **fin de partie** (conversation 255) ; script ci-dessous |
| MISS 48 | MISN-15a | si MISN-15a a réussi : cinématiques 20 et 36 ; sinon plans 15 et 3, puis la même fin de partie, précédée de la conversation 236 si la 3ᵉ valeur vaut 0 ; script ci-dessous |

Script de MISS 41 :

```
SHOW_KILL_MARKS
PLANES_LOST_CONV
IF_NOT_FLAG 200
    SET_FLAG 200
    APPLY_CHANGE 23
ENDIF
IF_MISSION_SUCCESS 35
    SET_FLAG 68
ENDIF
IF_FLAG 50
    IF_RESULT_3
        APPLY_CHANGE 27        argent remplacé par 0
        APPLY_CHANGE 7         argent − 2 000 milliers
        CHECK_GAME_OVER        argent < 0 → conversation 255, fin de partie
    ENDIF
ENDIF
SET_NEXT_MISSION 41
PLAY_SCENE 11
```

Script de MISS 48 :

```
IF_MISSION_SUCCESS 41    MISN-15a réussie
    PLAY_MIDGAME 20
    PLAY_MIDGAME 36
ELSE
    PLAY_SHOT 15
    PLAY_SHOT 3
    IF_RESULT_3
        APPLY_CHANGE 27
        APPLY_CHANGE 7
        CHECK_GAME_OVER
    ELSE
        PLAY_CONV 236
        APPLY_CHANGE 27
        APPLY_CHANGE 7
        CHECK_GAME_OVER
    ENDIF
ENDIF
```

## 7. libRealSpace (`SCGameFlow.cpp`) : écarts et corrections proposées

Relu le 2026-10-22 : `SCGameFlow.cpp` (921 lignes, fourni le même jour), comparé aux § 3 à 6 et
rejoué sur les scripts de `GAMEFLOW.IFF`, avec les valeurs de `GameFlowOpCode` de `SCenums.h`
(fourni le 2026-10-23). `GameState` et les scènes (`WeaponLoadoutScene`, `EndMissionScene`,
`SCStrike`) n'ont pas été fournis : ce qu'ils font n'est pas compté ici.

Tous les nombres de ce chapitre sont en décimal, comme dans `SCenums.h` et le dump
`gameflow_parsed.txt`.

### 7.1 Les constantes `GameFlowOpCode` face aux commandes du jeu

| Nom (valeur) | Constante de libRealSpace | Accord avec le jeu |
|---|---|---|
| `PLAY_CONV` (0) | `EFECT_OPT_CONV` | oui |
| `PLAY_SCENE` (1) | `EFECT_OPT_SCEN` | oui |
| `PLAY_MIDGAME` (2) | `EFECT_OPT_PLAY_MIDGAME` | oui |
| `FLY_MISSION_NOW` (3) | `EFECT_OPT_FLYM2` | non : le jeu part en vol **sans** écran d'armement (point 2) |
| `NOP_4` (4) | `EFECT_OPT_U2` | oui (pas de cas, rien à faire) |
| `SET_FLAG` (6) | `EFECT_OPT_SETFLAG_TRUE` | oui |
| `CLEAR_FLAG` (7) | `EFECT_OPT_SETFLAG_FALSE` | oui |
| `PLAY_SHOT` (8) | `EFECT_OPT_SHOT` | oui |
| `IF_NOT_FLAG` (9) | `EFECT_OPT_IF_NOT_FLAG` | oui |
| `IF_FLAG` (10) | `EFECT_OPT_IF_FLAG` | oui |
| `NOP_11` (11) | `EFFCT_OPT_U18` | oui (absent des données) |
| `SELECT_MISSION` (12) | `EFECT_OPT_FLYM` | en partie : le jeu ne fait que choisir la mission (point 2) |
| `SET_NEXT_MISSION` (13) | `EFECT_OPT_MIS2` | oui |
| `START_FLIGHT` (14) | `EFFCT_OPT_U20` | pas de cas (absent des données) |
| `GOTO_NEXT_MISSION` (15) | `EFECT_OPT_GO` | oui |
| `SAVE_GAME` (16) | `EFECT_OPT_SAVE_GAME` | oui |
| `LOAD_GAME` (17) | `EFECT_OPT_LOAD_GAME` | oui |
| `SHOW_MAP` (18) | `EFFCT_OPT_SHOW_MAP` | oui |
| `LOOK_AT_KILLBOARD` (19) | `EFECT_OPT_LOOK_AT_KILLBOARD` | oui |
| `IF_MISSION_ACCEPTED` (20) | `EFECT_OPT_MISS_ACCEPTED` | oui |
| `IF_MISSION_REFUSED` (21) | `EFECT_OPT_MISS_REJECTED` | oui |
| `WEAPON_LOADOUT` (22) | `EFECT_OPT_END_MISS` | non : écran d'armement **et test** (point 2) |
| `VIEW_CATALOG` (23) | `EFECT_OPT_VIEW_CATALOG` | oui |
| `SET_MUSIC_MOOD` (24) | `EFECT_OPT_U8` | pas de cas (point 7) |
| `LOOK_AT_LEDGER` (25) | `EFECT_OPT_LOOK_AT_LEDGER` | oui |
| `SHOW_KILL_MARKS` (26) | `EFECT_OPT_U10` | pas de cas (point 7) |
| `REMOVE_PILOT` (27) | `EFECT_OPT_U11` (et `EFECT_OPT_U16`, même valeur) | pas de cas (point 7) |
| `IF_TRUE` (28) | — | absent des données |
| `CHECK_GAME_OVER` (29) | `EFECT_OPT_CHECK_BALANCE` | en partie (point 5) |
| `ELSE` (30) | `EFECT_OPT_MISS_ELSE` | oui |
| `ENDIF` (31) | `EFECT_OPT_MISS_ENDIF` | oui |
| `IF_MISSION_SUCCESS` (32) | `EFFCT_OPT_IF_MISS_SUCCESS` | oui |
| `OR_GROUP` (33) | — | absent des données |
| `APPLY_CHANGE` (34) | `EFECT_OPT_APPLY_CHANGE` | en partie (point 4) |
| `IF_PLANES_LOST` (35) | `EFFCT_OPT_U17` | pas de cas (absent des données) |
| `PLANES_LOST_CONV` (36) | `EFECT_OPT_U14` | pas de cas (point 6) |
| `IF_RESULT_3` (37) | `EFECT_IF_LAST_MISS_SUCCESS` | non : le jeu teste la 3ᵉ valeur de `STAT` (point 1) |
| `PLAY_GAMEFLOW_TUNE` (38) | `EFECT_OPT_TUNE_MODIFIER` | en partie (point 7) |
| `IF_RESULT_5` (40, CD seulement) | `EFFCT_OPT_U19` | absent des données (§ 8) |

### 7.2 Ce qui est conforme au jeu

- **Mission après un vol.** `flyMission` pose `next_miss = GameState.mission_id` (valeur du dernier
  `SET_NEXT_MISSION`) et `runFrame` passe à cette mission, dont le script est joué. Le jeu fait la
  même chose au départ en vol (`Gameflow_SaveTmpState_4BBA0` : mission courante = mission suivante,
  § 3). Quand le script d'une mission désigne son propre numéro (`SET_NEXT_MISSION 2` dans MISS 2 ;
  11 missions sur 41 avec un vol), c'est son propre script qui est rejoué après le vol.
- **Chargement d'une partie** : le jeu ne rejoue pas le script de la mission (état 3, § 3) ;
  `loadGame` non plus (`runEffectAfterLoad` ne reprend que `PLAY_GAMEFLOW_TUNE`, que le jeu garde
  aussi dans la sauvegarde).
- **Blocs conditionnels** : même résultat que le jeu pour les blocs bien formés, tant que chaque
  test ouvre un niveau. `IF_TRUE`, `OR_GROUP` et `IF_PLANES_LOST` n'ont pas de cas, mais ils ne sont
  pas dans les données. Profondeur maximale dans les données : 3 (`MAX_IF_DEPTH` = 10 suffit).
- **`IF_MISSION_ACCEPTED` / `IF_MISSION_REFUSED`** : la conversation en attente est jouée avant le
  test, comme dans le jeu. La reprise (`currentOptCode`) repart avec des blocs vides ; sans effet
  sur les données (les 26 tests sont tous hors bloc).
- **`PLAY_SCENE`** construit la scène tout de suite au lieu de la fin du script : sans effet sur les
  données (c'est toujours la dernière commande de son script).
- **Montants en milliers** : `APPLY_CHANGE` multiplie `CASH` et `OVER` par 1000 pour avoir les vrais
  montants ; c'est voulu (unité des fichiers).
- `SET_FLAG`, `CLEAR_FLAG`, `IF_NOT_FLAG`, `IF_FLAG`, `SET_NEXT_MISSION`, `GOTO_NEXT_MISSION`,
  `SAVE_GAME`, `LOAD_GAME`, `SHOW_MAP`, `LOOK_AT_KILLBOARD`, `VIEW_CATALOG`, `LOOK_AT_LEDGER`,
  `IF_MISSION_SUCCESS` : même effet.

### 7.3 Écarts, du plus visible au moins visible

**1. `IF_RESULT_3` teste la 3ᵉ valeur de `STAT`, pas le succès.** Dans le jeu, le test réussit si
la 3ᵉ valeur du compte rendu est ≠ 0 ; c'est une variable propre à chaque mission (§ 6.1 : AWACS
abattu dans MISN-6a et 8a, BRIGC10 détruit dans 9aa…).
- `EFECT_IF_LAST_MISS_SUCCESS` teste le **succès** de la mission. MISN-6a réussie sans abattre
  l'AWACS → libRealSpace joue MISN-6b, le jeu MISN-6x. Même chose pour 8b / 8x et 10b / 10x.
  MISN-9a est sautée à chaque succès de MISN-9aa, et pas seulement quand le BRIGC10 est détruit.
- **Correction** : garder les 8 valeurs de `STAT` du dernier vol dans `GameState` (écrites par le
  script de la mission, instruction `OP_SAVE_VALUE_TO_GAMFLOW_REGISTER` de STRIKE.EXE,
  `MISSION_SCRIPT_OPCODES.md`) et tester la 3ᵉ. À corriger **en même temps** que `APPLY_CHANGE`
  (point 4) : avec un test sur le succès, MISN-12b réussit toujours (sa 1ʳᵉ valeur vaut toujours 1)
  et MISS 41 mettrait fin à la partie après chaque vol de MISN-12b dès que le drapeau 50 est posé.

**2. `WEAPON_LOADOUT` est un test.** Dans le jeu, `SELECT_MISSION` ne fait que choisir la mission ;
`WEAPON_LOADOUT` ouvre l'écran d'armement avec le chargement `LOAD` n, et **la suite du script
n'est jouée que si le joueur part en vol** (§ 5.3). libRealSpace ouvre l'écran d'armement à la fin
du script, après tout `SELECT_MISSION`, sans `LOAD` n, et joue la suite du script avant, même si le
joueur annule.
- 13 des 42 scripts de sprite qui contiennent `WEAPON_LOADOUT` ont des commandes après lui.
  Exemple, MISS 2, scène 20, sprite 12 :

  ```
  SELECT_MISSION 2
  PLAY_CONV 23
  WEAPON_LOADOUT 5
  SET_FLAG 40
  ```

  Si le joueur annule, le drapeau 40 est quand même posé, et le sprite 18 (`REQU` :
  `REQUIRE_SET 40`) apparaît sans que la mission ait été volée. Son script :

  ```
  PLAY_SHOT 13
  PLAY_SHOT 3
  SET_NEXT_MISSION 3
  GOTO_NEXT_MISSION
  ```

  MISS 26 : `APPLY_CHANGE 23` et `APPLY_CHANGE 29`, placés après `WEAPON_LOADOUT`, sont appliqués
  même sans vol.
- `flyOrReturnFromScene` part en vol pour tout sprite ≠ 20 ; dans le jeu, seul le sprite 12 fait
  partir.
- `FLY_MISSION_NOW` part en vol **sans** écran d'armement dans le jeu ; `EFECT_OPT_FLYM2` passe par
  le même chemin que `SELECT_MISSION` (3 occurrences).
- **Correction** : traiter `WEAPON_LOADOUT` comme `IF_MISSION_ACCEPTED` : suspendre le script
  (`currentOptCode`), ouvrir `WeaponLoadoutScene` avec `LOAD` n ; au départ (sprite 12), reprendre
  le script après `WEAPON_LOADOUT` puis partir en vol ; à l'annulation, test échoué : saut jusqu'au
  `ELSE` / `ENDIF`, ou jusqu'à la fin du script s'il n'y en a pas (cas de toutes les données).
- `EFECT_OPT_END_MISS` appelle `playEndMission`, qui pose `next_miss` d'après le `REQU` du sprite
  cliqué (sprite sans `REQU`, ou avec une condition `REQUIRE_SET`). Rien de tel dans le jeu (§ 4.5). Sur les
  données, c'est sans effet : `WEAPON_LOADOUT` suit toujours un `SELECT_MISSION` dans le même
  script, et la fin de `runEffect` remet `next_miss` à 0 avant d'ouvrir l'écran d'armement.

**3. Ordre des conversations, plans et cinématiques.** Le jeu joue chaque commande à son tour.
`runFrame` vide d'abord la file des plans (`PLAY_SHOT`, `SHOW_MAP`), puis celle des cinématiques
(`PLAY_MIDGAME`), puis celle des conversations (`PLAY_CONV`). 5 scripts sont joués dans un autre
ordre, par exemple :
- MISS 45, script de la mission ; dans libRealSpace, la cinématique 16 passe avant la conversation
  221 :

  ```
  PLAY_GAMEFLOW_TUNE 2
  SET_MUSIC_MOOD 0
  PLAY_CONV 221
  PLAY_MIDGAME 16
  SET_MUSIC_MOOD 0
  PLAY_CONV 222
  SET_NEXT_MISSION 46
  APPLY_CHANGE 20
  PLAY_SCENE 11
  ```

- MISS 21, scène 6, sprite 0 ; les plans 2 et 5 passent avant la cinématique 5 :

  ```
  PLAY_MIDGAME 5
  PLAY_SHOT 2
  PLAY_SHOT 5
  SET_FLAG 85
  PLAY_SCENE 11
  ```

- MISS 41, scène 13, sprite 16 ; la cinématique 12 passe avant les conversations 208 à 210 :

  ```
  IF_MISSION_SUCCESS 36
      PLAY_CONV 208
  ELSE
      PLAY_CONV 209
  ENDIF
  PLAY_CONV 210
  PLAY_MIDGAME 12
  SET_NEXT_MISSION 42
  APPLY_CHANGE 4
  APPLY_CHANGE 5
  GOTO_NEXT_MISSION
  ```

- MISS 8, scène 20, sprite 18 ; la cinématique 34 passe avant la conversation 54 :

  ```
  PLAY_SHOT 15
  PLAY_SHOT 3
  PLAY_MIDGAME 3
  SET_MUSIC_MOOD 8
  APPLY_CHANGE 7
  APPLY_CHANGE 24
  PLAY_CONV 54
  PLAY_MIDGAME 34
  GOTO_NEXT_MISSION
  ```

**Correction** : une seule file d'activités dans l'ordre du script.

**4. Changements `CHNG` (`APPLY_CHANGE`).** Le ×1000 est voulu (montants en milliers). Restent deux
écarts (§ 5.4) :
- **L'argent n'est pas touché.** libRealSpace applique `CASH` à `proj_cash` et ne recopie
  `proj_cash` dans `cash` que si `cash` vaut 0. Le jeu modifie directement l'argent. Conséquence :
  la fin de partie de MISS 41 et MISS 48 (`APPLY_CHANGE 27` = argent remplacé par 0,
  `APPLY_CHANGE 7` = argent − 2 000 milliers, puis `CHECK_GAME_OVER`) n'a jamais lieu dans
  libRealSpace.
- **Retraits non bornés.** Le jeu borne à 0 les retraits d'armes (`WEAP`) et de victoires
  (`PILT`) ; libRealSpace non.
- Le jeu range dans le même compteur le gain de mission (2ᵉ valeur de `STAT`) et le coût des
  avions perdus (500 par avion, § 6) : ces deux montants sont donc aussi en milliers, et le ×1000
  leur est à appliquer de la même façon.
- **Correction** : `tools/gameflow_ref/apply_change.cpp` (compilé, style du dépôt) : `applyChange`
  et `checkGameOver` d'après le jeu, avec l'essai de MISS 41 (argent −2 000 milliers → conversation
  255). Le fichier compte en milliers comme le jeu ; le ×1000 de libRealSpace se garde à la lecture.

**5. Fin de partie `CHECK_GAME_OVER`.** Le jeu teste d'abord **plus de 16 avions perdus au total**
(conversation 254), puis l'argent < 0 (255) ; dans les deux cas, le script s'arrête et le jeu revient
au menu. libRealSpace ne teste que l'argent ; `GAMOVER_NO_INSURANCE` (254) est défini mais n'est pas
utilisé dans `SCGameFlow.cpp`. 12 occurrences. Correction : `checkGameOver` du même fichier.

**6. Avions perdus : `PLANES_LOST_CONV` (27 scripts de mission).** Dans le jeu, si des avions ont
été perdus pendant le dernier vol : humeur musicale 8, puis conversation 253 si le joueur est mort
(`[+248]` = 2), 252 sinon. libRealSpace joue 252 depuis `runFrame`, seulement quand le joueur s'est
éjecté (`player_ejected`), et `LOST_WINGMAN_PLANE` (253) n'est pas utilisé dans `SCGameFlow.cpp`.
Les noms des constantes ne correspondent pas au jeu : 252 = des avions perdus, joueur vivant ;
253 = joueur mort. Correction : traiter `PLANES_LOST_CONV` (nombre d'avions perdus au dernier vol,
lu dans `JETS` de `misn2op.iff`), et retirer le cas `player_ejected` de `runFrame` pour ne pas jouer
la conversation deux fois.

**7. Musique et victoires.**

| Commande | Données | Effet dans le jeu | libRealSpace |
|---|---|---|---|
| `SET_MUSIC_MOOD` | 11 | humeur musicale du déroulement = n (`Music_SetGameflowMood_28C73`) ; valeurs 0, 6 et 8 | `EFECT_OPT_U8`, pas de cas |
| `SHOW_KILL_MARKS` | 27 | marques de victoires peintes sur l'avion (`OPTIONS.IFF` `MARK`), si le joueur a eu des victoires et n'est pas mort | `EFECT_OPT_U10`, pas de cas |
| `REMOVE_PILOT` | 2 | retire le pilote n du tableau des victoires | `EFECT_OPT_U11`, pas de cas |
| `PLAY_GAMEFLOW_TUNE` | 18 | joue tout de suite le morceau n (1 à 5) de `gameflow.dat` (`Music_PlayGameflowTune_28CFC`) et le garde dans la partie (sauvegardé) ; première commande de 14 des 18 scripts qui l'ont (`PLAY_GAMEFLOW_TUNE 1` dans MISS 0) | `GameState.tune_modifier = n` : ne joue rien, choisit la série de morceaux joués au clic d'un sprite (`clicked`) |

Pour `PLAY_GAMEFLOW_TUNE`, le jeu joue le morceau au moment de la commande ; la façon dont il choisit
ensuite la musique d'une scène à partir de l'humeur (`SET_MUSIC_MOOD`) n'a pas été lue ici. À
comparer avec `MUSIC_SYSTEM.md` avant de toucher au modèle `tune_modifier` de libRealSpace.

**8. Argent au départ en vol.** `Gameflow_SaveTmpState_4BBA0` retire de l'argent les frais généraux
(`[+639]`, chunk `OVER`) et les achats faits au catalogue depuis le dernier vol (`[+643]`, remis à
0), avant d'écrire `tmpsav.tmp`. Au retour, le coût des avions perdus est retiré (§ 6). Rien de cela
n'est dans `SCGameFlow.cpp` : à vérifier là où libRealSpace gère l'argent.

### 7.4 Ordre de correction suggéré

1. `WEAPON_LOADOUT` comme test (point 2) : c'est l'écart qui permet de sauter une mission.
2. `IF_RESULT_3` sur la 3ᵉ valeur de `STAT`, **et** `APPLY_CHANGE` / `CHECK_GAME_OVER` d'après le jeu
   (points 1, 4, 5), ensemble.
3. Une seule file d'activités (point 3).
4. `PLANES_LOST_CONV`, `SET_MUSIC_MOOD`, `SHOW_KILL_MARKS`, `REMOVE_PILOT`, argent au départ (points
   6 à 8).

## 8. Version CD-ROM (OPTTEST.EXE du CD)

Interpréteur en 23808 environ (table cs:1559, `cmp bx, 42`) : **43 commandes** (valeurs 0 à 42).
Les commandes de `PLAY_CONV` à `PLANES_LOST_CONV` font la même chose que sur disquette (relu cas
par cas ; `NOP_4` et `NOP_11` ne font rien).
La structure de partie a 4 octets de plus à partir de `+982` :

| Commande (valeur) | CD-ROM |
|---|---|
| `IF_RESULT_3` (37) | test : `[+983]` ≠ 0 (3ᵉ valeur de `STAT`) |
| `PLAY_GAMEFLOW_TUNE` (38) | morceau n de `gameflow.dat`, gardé en `[+987]` |
| `IF_RESULT_4` (39) | test : `[+984]` ≠ 0 (4ᵉ valeur de `STAT`) |
| `IF_RESULT_5` (40) | test : `[+985]` ≠ 0 (5ᵉ valeur de `STAT`) |
| `IF_RESULT_6` (41) | test : `[+986]` ≠ 0 (6ᵉ valeur de `STAT`) |
| `IF_LOADED_FLAG` (42) | test : `[+982]` ≠ 0 (rangé par le chargement d'une partie ; rôle non établi) |

La version CD lit **six** des huit valeurs de `STAT` (STRIKE.EXE en écrit toujours huit) : succès,
gain, puis quatre valeurs gardées sur un octet en `[+983]` à `[+986]`. Les commandes `IF_RESULT_4` à `IF_LOADED_FLAG` n'apparaissent pas dans `GAMEFLOW.IFF` de
`BIGTRE.TRE` ; elles ne sont pas dans la liste des tests comptés pendant un saut (même liste que la
disquette).

## 9. Points ouverts

- Les codes de sortie 1, 3, 4 et 5 de `misn2op.iff`, vus du côté de STRIKE.EXE.
- `PRTL` de `MLST` et le contenu exact d'`op2misn.iff` (`Gameflow_WriteMissionOrder_4BBF7`, lu en
  surface).
- Le menu d'accueil (`Gameflow_MainMenu_4F1A7`, choix 0 à 5) n'est lu qu'en surface.
- La 3ᵉ valeur de MISN-10A (FLAG[2]) : aucune instruction du script ne l'écrit (§ 6.1) ; à
  confronter au jeu (MISN-10b est-elle jouée après MISN-10a ?).
- MISN-9A, 9AA, 10A : la 8ᵉ valeur recopie un drapeau qu'aucune instruction n'écrit (FLAG[6],
  FLAG[3], FLAG[3]) ; OPTEST disquette ne lit pas la 8ᵉ valeur.
- Le rôle des deux compteurs de victoires (`[+671]`, `[+673]`) : air et sol probablement, non
  vérifié dans l'affichage du tableau.
