# Wings of Glory (WINGS_OF.EXE)

Ajouté le 2026-11-05. Exécutable fourni par Rémi ; il n'est pas dans le dépôt (comme les données).

## 1. L'exécutable

- `WINGS_OF.EXE`, 603 888 octets. Borland C++ 1991, gestionnaire d'overlays VROOMM (en-tête `FBOV` après l'image),
  comme STRIKE.EXE, OPTEST.EXE et PACIFIC.EXE. Lancé par `WG` (« Please type WG to run Wings of Glory. »).
- Comme PACIFIC.EXE, **un seul exécutable pour le vol et le hors-vol** : on y trouve les noms `convdata.iff`,
  `faces.iff`, `convfont.shp`, `cvno%04d.pak` (voix des conversations), `bkglist.iff`, `instant.iff` (mission
  d'entraînement), `options.cfg`, `optdflt.cfg`, `wg.cfg`, et la liste des avions (Sopwith Pup, Sopwith Camel, SPAD XIII,
  Albatros D III, Albatros C III, Albatros D V, Fokker D VII, Fokker D VIII, Fokker Dr. I, Zeppelin L71).
- Listing au format IDA reconstruit par `tools/vroomm_listing.py` : `source/wings.asm` (330 segments dont 71
  overlays, 2 988 fonctions repérées). Tous les outils prennent `--exe wings` (`tools/exe_paths.py`).

## 2. Noms repris

`tools/match_functions.py --from <source> --to wings --write`, passé dans cet ordre : OPTEST.EXE, STRIKE.EXE, puis
PACIFIC.EXE en dernier (ses noms, plus récents et plus précis, l'emportent sur une même fonction). Résultat :
810 fonctions nommées sur 3 378 déclarations `proc` (719 reprises de PACIFIC.EXE, 83 de STRIKE.EXE, 8 d'OPTEST.EXE).
Ce sont surtout les bibliothèques communes (IFF, mémoire, son AIL, outils) ; le modèle de vol, la machine à scripts
de mission et le terrain n'ont pas été retrouvés par cette comparaison : leur code diffère, il est à lire.

Fichiers : `known_functions.json`, `function_index.json`, `segment_boundaries.json`, `annotated_segments/`,
`pacific_matches.json`, `strike_matches.json`, `optest_matches.json` (candidats non tranchés compris).

## 3. Accès aux fichiers et archives TRE (lu le 2026-11-05)

**Le lecteur d'archive TRE de `WINGS_OF.EXE` cherche les fichiers par leur NOM EN CLAIR, par dichotomie dans un index
trié ; aucun hachage n'a été vu dans ce code.** Les fonctions sont dans seg004 (nommées `Tre_*` dans
`known_functions.json`).

### 3.1 Monter une archive : fichier `WG.CFG`

Aucun nom d'archive n'est écrit dans l'exécutable : la liste des archives est lue dans un **fichier de
configuration**, `wg.cfg` par défaut.

- `sub_69F3D` (fonction pas encore nommée ; proposé : `Config_OpenArgumentFile_69F3D`) ouvre ce fichier avec le
  lecteur de flux. Le nom vient du segment de données (`mov di, 16E8h` → chaîne `wg.cfg`). Exception : s'il y a plus de
  2 arguments et que le 1er commence par les 4 octets `Fugi` (`cmp dword ptr [bx], 69677546h`), c'est le 2ᵉ argument
  qui donne le fichier. Fichier absent : message « Wings of Glory was unable to find %s. Refer to the Install Guide
  for more details. »
- La lecture des réglages (`sub_6A0EB`, fonction pas encore nommée) teste le premier caractère de chaque élément lu :
  `cmp ax, 3Dh` (`=`) mène à `Tre_OpenArchive_4BB2` avec le reste du texte. Une ligne `=FICHIER.TRE` monte donc
  l'archive `FICHIER.TRE`. Les autres premiers caractères sont `+` et `-` (autres réglages).
- **8 archives au plus** (table de 8 mots à `DS:5298h`, `cmp word_59E58, 8` dans `Tre_RegisterArchive_4863`).

Les noms des archives de Wings of Glory sont donc dans le `WG.CFG` écrit par l'installation, pas dans l'exécutable.

`Tre_OpenArchive_4BB2` :

```
ouvrir le fichier en lecture        StreamReader_ReadDispatch_5274A (mode 1)
ajouter l'archive à la table        Tre_RegisterArchive_4863
lire l'en-tête, 8 octets à 0        Tre_ReadHeader_49D1 : u32 nombre d'enregistrements, u32 (fin de l'index)
lire l'index juste après            Tre_LoadIndex_4B01 : nombre × 74 octets (imul eax, eax, 4Ah)
```

Messages d'erreur : « No memory for buffer! », « Error in treefile header! » (lecture de l'index trop courte).

### 3.2 Format de l'index (constaté dans le code)

En-tête de 8 octets, puis un enregistrement de **74 octets** par fichier :

| Octets | Contenu | Preuve |
|---|---|---|
| 0 | 1 octet (non lu par la recherche) | le nom est lu à partir de l'octet 1 (`add ax, 6Ah` pour un enregistrement copié en `+69h`) |
| 1 à 65 | nom du fichier, chaîne terminée par 0 | `CRT_StrICmp_2D03(nom, enregistrement + 1)` |
| 66 | u32 position du fichier dans l'archive | `mov eax, [si+0ABh]` (`0ABh − 69h = 66`) |
| 70 | u32 taille | `add eax, [si+0AFh]` (`0AFh − 69h = 70`) |

C'est le même format que `BIGTRE.TRE` de Strike Commander et `PACIFIC.DAT` (`tools/tre_extract.py`).

### 3.3 Chercher un fichier : `Tre_FindEntry_49FD`

1. Le chemin demandé est celui que construit le jeu : `..\..\DATA\<dossier>\<nom>.<ext>`, par
   `Path_BuildDataPath_1F0C4` / `Path_Concat3_1F089` (dossiers `..\..\data\gameflow\`, `..\..\data\cestalk\`,
   `..\..\data\fonts\`, `..\..\data\midgames\`, `..\..\data\missions\`, `..\..\data\noise\`, ou `OBJECTS`,
   `MISSIONS`, `COCKPITS`, `SOUND`…). Exemple : `..\..\data\gameflow\convdata.IFF`.
2. Il est mis en majuscules sur place (`CRT_StrUpr_2F35`, `a`..`z` seulement).
3. Dichotomie sur les enregistrements (`n` = nombre, `bas` = 0) :

```
tant que n > 0 :
    milieu = bas + (n / 2) × 74
    c = stricmp(nom cherché, nom de l'enregistrement du milieu)
    si c == 0 : trouvé
    si c < 0  : n = n / 2                       (moitié basse)
    si c > 0  : bas = milieu + 74 ; n = n − (n / 2 + 1)   (moitié haute)
```

   La comparaison (`CRT_StrICmp_2D03`) ignore la casse (`a`..`z` ramenés à `A`..`Z`) et compare les octets sans signe.
   L'index doit donc être **trié par nom** dans cet ordre.
4. Trouvé : le flux devient la tranche `[position, position + taille)` de l'archive (`sub_5252A`).

`Tre_OpenEntryByName_48C1` essaie les archives dans l'ordre où elles ont été montées et ne cherche jamais un nom qui
finit par `TRE` (comparaison des 3 derniers caractères avec la chaîne `TRE`).

### 3.4 Archive d'abord, disque ensuite

`StreamReader_OpenFromTreeOrDisk_526A2` : en lecture (`cmp byte ptr [si+4Ch], 1`), cherche d'abord dans les archives
(`Tre_OpenEntryByName_48C1`) ; pas trouvé, ou écriture : le chemin est ouvert sur le disque
(`FileHandle_OpenByPath_52BBB` → `Dos_Open_51BDA`, `mov ah, 3Dh / int 21h`, ou `Dos_Create_51BAE`, `mov ah, 3Ch`).
Les sauvegardes (`saved\`, `tapes\`) passent par le disque.

Un cache de fichiers en mémoire EMS (`EmsFileCache_FindOrAdd_53245`) compare aussi les noms en clair (`strncmp` sur
40 caractères).

### 3.5 Écart avec les données de Rémi

Rémi décrit des archives TRE dont l'index contient des **hachages des noms**. Ce `WINGS_OF.EXE` (603 888 octets) ne
peut pas les lire : sa recherche compare des noms. Pour trouver le hachage, il faut l'exécutable livré avec ces
archives (autre version du jeu). Recherches faites sans résultat ici : table de CRC 32 (octets `96h, 30h, 7, 77h`),
polynômes `0EDB88320h` / `4C11DB7h`.

## 4. Déroulement (scripts `EFCT` et conditions `REQU`) — lu le 2026-11-05

### 4.1 Variables

Une seule table de variables, lue et écrite par quatre fonctions de seg018 :

| Fonction | Rôle |
|---|---|
| `GameVar_Get_A40C` | lit la variable n |
| `GameVar_SetFlag_A455` | met la variable n à 1 |
| `GameVar_Clear_A4F0` | met la variable n à 0 |
| `GameVar_Set_A49C` | variable n = valeur |

Numéros 0 à 255 : des **mots** (table `word_5FD3C`, `shl ax, 1`). Numéros 256 et plus : des **bits**
(table `word_5FD40`, octet `(n − 256) / 8`, bit `(n − 256) mod 8`) ; écrire une valeur non nulle pose le bit.

### 4.2 Conditions `REQU` (`Gameflow_TestRequ_A911`)

Mêmes 4 conditions que Strike Commander (`GAMEFLOW_SYSTEM.md` § 4.2), mais **chaque entrée fait 3 octets** :
la condition (1 octet), puis le numéro sur un mot (`[bx+si+1] | [bx+si+2] << 8`, `add si, 3`).

| Valeur | Nom |
|---|---|
| 0 | `REQUIRE_NOT_SET` |
| 1 | `REQUIRE_SET` |
| 2 | `OR_NOT_SET` |
| 3 | `OR_SET` |
| autre | rien |

### 4.3 Scripts `EFCT` (`Gameflow_RunScript_A9C9`)

Lit la commande et deux octets a, b (`[script+i+1]`, `[script+i+2]`), et le mot `a | b << 8`. Pas de **2**
octets, **3** pour les commandes 0, 6, 7, 9, 10, 19, 50, 51 et 55 (`inc di` en `loc_AE4E`, puis `add di, 2`), y compris
quand elles sont sautées. `ELSE` (30), `ENDIF` (31) et `OR_GROUP` (33) sont traités avant la table ; la table compte
**59 commandes** (`cmp bx, 3Ah / jbe`, `jmp cs:off_AED6[bx]`).

Tests comptés pendant un saut (pour les `ENDIF` imbriqués) et seuls admis dans un groupe `OR_GROUP`
(« Faulty OR structure in gameflow file ») : 9, 10, 20, 21, 28, 32, 35, 37, 52, 53, 54.

**Registre.** Nouveauté par rapport à Pacific Strike : un mot de la partie, `[partie+282]` (`[si+11Ah]`), sert de
registre (commandes 50 à 55).

Noms : ceux de Pacific Strike quand l'effet est le même ; \* = nom proposé.

| Valeur | Nom | Argument | Effet constaté dans le code |
|---|---|---|---|
| 0 | `PLAY_CONV` | mot | conversation n (`Gameflow_PlayConversation_6719B` → `Conv_PlayScript_14F62`) |
| 1 | `PLAY_SCENE` | octet | scène `[partie+271]` = n, arrêt du script (`[partie+247]` = 1) |
| 2 | `PLAY_MIDGAME`\* | octet | `Gameflow_PlayMidgame_6741E`(n, registre) : n = 1 à 14 → cinématique `MIDGAMnn.PAK` (14 rejoue `MIDGAM03`), 15 → générique (`mycredit`) |
| 3 | `FLY_MISSION_NOW` | octet | mission `[partie+268]` = n, `[partie+252]` = 1 |
| 4 | `NOP_4` | octet | rien |
| 5 | `SELECT_MISSION_5`\* | octet | mission `[partie+268]` = n (même code que 12) |
| 6 | `SET_FLAG` | mot | `GameVar_SetFlag_A455`(n) |
| 7 | `CLEAR_FLAG` | mot | `GameVar_Clear_A4F0`(n) |
| 8 | `NOP_8` | octet | rien |
| 9 | `IF_NOT_FLAG` | mot | réussit si la variable n = 0 |
| 10 | `IF_FLAG` | mot | réussit si la variable n ≠ 0 |
| 11 | `QUIT_TO_DOS`\* | octet | message « You just chose CMD_quit_to_dos. » (`sub_9D78`) |
| 12 | `SELECT_MISSION` | octet | mission `[partie+268]` = n |
| 13 | `SET_NEXT_MISSION` | octet | `[partie+270]` = n |
| 14 | `START_FLIGHT` | octet | `[partie+252]` = 1 |
| 15 | `GOTO_NEXT_MISSION` | octet | `sub_13C38`(0) ; si `sub_D20A` rend une valeur non nulle, `Gameflow_PlayMidgame_6741E`(4, cette valeur) ; `[partie+252]` = 2 |
| 16 | `SAVE_GAME` | octet | choix d'un fichier (`sub_BA82`), sauvegarde dans `saved\` puis `gensave.tmp` (`sub_BBDF`) |
| 17 | `LOAD_GAME` | octet | choix d'un fichier (`sub_BE70`) ; s'il est donné, `[partie+252]` = 3 |
| 18 | `TRAVEL`\* | octet | `Gameflow_Map_D51A`(n) : chunks `MAPS`, `INFO`, `WRLD`, `DATA`, `SPED` |
| 19 | `LOOK_AT_KILLBOARD` | 2 octets a, b | `Gameflow_KillBoard_C6D9`(a, b) : `WWISHPS.PAK`, `WWIPALS.PAK`, police `BOARDFNT`, « Return to tent » / « Return to common room » |
| 20 | `IF_MISSION_ACCEPTED` | octet | réussit si `[partie+874]` ≠ 0 |
| 21 | `IF_MISSION_REFUSED` | octet | réussit si `[partie+874]` = 0 |
| 22 | — | — | erreur |
| 23 | `NOP_23` | octet | `sub_D174`, fonction vide |
| 24 | `SET_MUSIC`\* | octet | `Music_LoadTune_13AF4`(n) (`AMUSIC.PAK` / `RMUSIC.PAK` de `midgames`), puis lancement (`sub_13BB6`) |
| 25 | `CLEAR_FLAGS_760_764`\* | octet | efface les variables 760 à 764 (`sub_D17C`) |
| 26 | `SHOW_KILL_MARKS` | octet | si `[partie+256]` ≠ 0 et `[partie+267]` ≠ 2 : `sub_C6D1`, fonction vide |
| 27 | `CLEAR_SLOT`\* | octet | si n < 8 : mot `[partie+690+26×n]` = 0 |
| 28 | `IF_AT_MOST_658`\* | octet | réussit si n ≤ `[partie+658]` |
| 29 | `CLEAR_FLAGS_261_269`\* | octet | efface les variables 261 à 269 (`sub_D1B1`) |
| 30 | `ELSE` | octet | traité avant la table |
| 31 | `ENDIF` | octet | traité avant la table |
| 32 | `IF_MISSION_SUCCESS` | octet | réussit si l'octet `[partie+540+n]` = 1 |
| 33 | `OR_GROUP` | octet | traité avant la table : les n tests suivants forment un OU |
| 34 | `APPLY_CHANGE` | octet | `Gameflow_ApplyChange_C426`(n) : chunks `PILT`, `STAT`, `CHNG`, `INFO` |
| 35 | `IF_NEVER`\* | octet | échoue toujours (`cmp word ptr [si+0FDh], 0` puis `jmp short loc_AE41` sans condition) |
| 36 | `LOST_PLANE_WARNING`\* | octet | si `[partie+253]` ≠ 0 : message « CMD_lost_plane_warning » (`sub_9D78`) |
| 37 | `IF_BYTE_982`\* | octet | réussit si `[partie+982]` ≠ 0 |
| 38 | `NOP_38` | octet | rien |
| 39 à 43 | — | — | erreur (`push 12h` / `sub_9D78`) |
| 44 | `SET_SLOT`\* | octet | si n < 8 : mot `[partie+690+26×n]` = 1 |
| 45 à 49 | — | — | erreur |
| 50 | `LOAD_VARIABLE`\* | mot | registre = variable n (`GameVar_Get_A40C`) |
| 51 | `STORE_VARIABLE`\* | mot | variable n = registre (`GameVar_Set_A49C`) |
| 52 | `IF_REGISTER_GREATER`\* | octet | réussit si registre > n |
| 53 | `IF_REGISTER_EQUAL`\* | octet | réussit si registre = n |
| 54 | `IF_REGISTER_LESS`\* | octet | réussit si registre < n |
| 55 | `LOAD_CONSTANT`\* | mot | registre = n |
| 56 | `SET_SLOT_56`\* | octet | mot `[partie+690+26×n]` = 1 (sans borne) |
| 57 | `CLEAR_SLOT_57`\* | octet | mot `[partie+690+26×n]` = 0 (sans borne) |
| 58 | `SET_RANK`\* | octet | texte du grade en `[partie+965]` : 1 « 1st Lt. », 2 « Captain », 3 « Major », 4 « Lt. Colonel », autre « 2nd Lt. » |

Les lignes « erreur » ont été vues dans la table (`loc_AEAD`) ; les blocs `[partie+690+26×n]` (8 enregistrements de
26 octets) ne sont pas encore identifiés.

## 5. Conversations (`Conv_PlayScript_14F62`) — lu le 2026-11-05

Lit un octet de commande, `cmp bx, 13h / jbe` puis `jmp cs:off_16757[bx]` : **20 valeurs**, dont 8 utilisées.
Lecteurs des champs dans seg031.

| Valeur | Nom | Champs (dans l'ordre) | Lu par |
|---|---|---|---|
| 0 | `GROUP_SHOT` | décor (9) ; puis les commandes 1 qui suivent | `ConvRec_ReadName_18AAF` ; figures du chunk `FIGR` de `CONVDATA.IFF` |
| 1 | `GROUP_SHOT_ADD_CHARACTER` | figure (9), x (mot), y (mot) | `ConvRec_ReadFigure_18C04` (seulement derrière 0 ou 18) |
| 3 | `CLOSEUP` | visage (9), image (1), décor (9), x (mot), y (mot), texte, couleur (1) ; puis les commandes 19 et 4 qui suivent | `ConvRec_ReadCloseup_18AD6` |
| 4 | `CLOSEUP_CONTINUATION` | texte (seulement derrière 3) | `ConvRec_ReadCloseup_18AD6` (2ᵉ appel : texte seul) |
| 10 | `SHOW_TEXT` | couleur (1), texte | `ConvRec_ReadText_18D3D` |
| 12 | `JUMP`\* | n (mot) : le pointeur du script avance de n octets (`add [di+4], ax`) | `ConvRec_ReadNumber_18DDA` |
| 16 | `NOP_16` | aucun | — |
| 18 | `GROUP_SHOT_WWI`\* | décor (9) ; puis les commandes 1 qui suivent, figures prises dans `WWISHPS.PAK` | `ConvRec_ReadName_18AAF` |
| 19 | `CLOSEUP_SAME`\* | texte (seulement derrière 3) | `ConvRec_ReadCloseup_18AD6` |
| autre | — | « Got lost while running the conversation! » | — |

4 ou 19 rencontrés seuls : « CONT or SAME out of place! ».

Différences avec Pacific Strike :
- pas de 4 octets de voix après le texte ;
- pas de blocs conditionnels (`IF_FLAG`, `ELSE`, `ENDIF`) ;
- pas de commandant devant la carte (17) ;
- nouveaux : 18 (plan de groupe avec `WWISHPS.PAK`), 19 (suite du gros plan) et 12 (saut relatif).

## 6. Scripts de mission : pas dans `WINGS_OF.EXE`

`WINGS_OF.EXE` est le programme **hors vol** (comme `OPTEST.EXE` de Strike Commander) :

1. Quand un script `EFCT` lance un vol (`[partie+252]` = 1), la boucle du déroulement (`Gameflow_MainLoop_B155`) appelle
   `Gameflow_WriteOp2Misn_681AA`. Celle-ci écrit `op2misn.iff` (chunks `MLST`, `NAME`, `SNAM`, `RANK`, `INVN`).
2. La boucle rend son code, et le programme se termine par `CRT_Exit` (`sub_9DCA` →
   `PagedResourceC_RefreshAndFinalize_47E2A`).
3. Au retour, `Gameflow_ReadMisn2Op_67CD9` lit `misn2op.iff` (chunks `MLST`, `EXIT`, `INVN`, `JETS`, `KILL`).

Les étiquettes `PROG`, `PART`, `CAST` et `AREA` n'apparaissent que dans l'écriture de la mission d'entraînement
(`sub_12D3D`). Celle-ci recopie des chunks de `dogfight.iff`, `bombrun.iff` ou `gauntlet.iff` dans `instant.iff`,
sans les interpréter. Aucun aiguillage d'instructions de mission n'existe dans cet exécutable, et il ne contient
aucune étiquette du modèle de vol (`DYNM`, `JDYN`).

**Les instructions des scripts de mission sont dans l'exécutable du vol**, lancé ensuite par le lanceur `WG` ; il
n'a pas été fourni.

## 7. Le reste n'est pas lu

Aucune autre fonction propre à Wings of Glory n'a été lue. Les données du jeu n'ont pas été fournies.
