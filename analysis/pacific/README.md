# Pacific Strike (PACIFIC.EXE) — déroulement et conversations

Rédigé le 2026-11-05. Version illustrée : `PACIFIC_GAMEFLOW_CONV.html` (images dans `images/`, `tools/ps_doc_images.py`). Exécutable `PACIFIC.EXE` (1 001 792 octets) et données `PACIFIC.DAT` fournis par Rémi.
Ni l'un ni l'autre n'est dans le dépôt. Les nombres sont en décimal ; les commandes sont désignées par leur nom
(noms de Strike Commander, `GAMEFLOW_SYSTEM.md` § 5.2 et `CONV_SYSTEM.md` § 2, quand la commande fait la même
chose ; sinon nom proposé, marqué \*).

## 1. L'exécutable et les données

- **Un seul exécutable** pour le vol et le hors-vol (Strike Commander en a deux : `STRIKE.EXE` et `OPTEST.EXE`).
  Même compilateur (Borland C++ 1991) et mêmes overlays VROOMM : image de 551 680 octets, en-tête `FBOV` juste
  après.
- Listing reconstruit par `tools/vroomm_listing.py` (pas de base IDA) : `source/pacific.asm`, 588 segments dont
  176 overlays, 6 069 fonctions. Outils : `--exe pacific`.
- Noms repris par `tools/match_functions.py --write` : 1 077 fonctions identiques à celles de `STRIKE.EXE`
  (`strike_matches.json`), puis 423 à celles d'`OPTEST.EXE` (`optest_matches.json`) ; 1 138 entrées au total.
  Elles commencent par « Reprise de » : à revérifier dans Pacific Strike.
- `PACIFIC.DAT` est une archive TRE au même format que `BIGTRE.TRE` (`tools/tre_extract.py`) : 600 fichiers,
  dont `GAMEFLOW\GAMEFLOW.IFF`, `OPTIONS.IFF`, `CONV.PAK`, `CONVDATA.IFF`, `CONVSHPS.PAK`, `CONVPALS.PAK`.

## 2. Variables et drapeaux

Les scripts (déroulement et conversations) désignent par un même numéro sur 2 octets soit une variable, soit un
drapeau. Les quatre fonctions d'accès, pas encore nommées, sont dans seg126 :

| Fonction (proposée) | Rôle |
|---|---|
| `GameVar_Get_56414` | numéro < 256 : rend la variable (mot) ; numéro ≥ 256 : rend 1 si le bit (numéro − 256) est posé, sinon 0 |
| `GameVar_SetFlag_5646D` | variable = 1, ou bit posé |
| `GameVar_ClearFlag_56520` | variable = 0, ou bit effacé |
| `GameVar_Set_564BB` | (numéro, valeur) : variable = valeur ; pour un bit, posé si valeur ≠ 0 |

Preuve (`GameVar_Get_56414`) : `cmp si, 0FFh / jbe` → `shl ax, 1` et lecture du mot dans le tableau
`word_7D00A` ; sinon `sub si, 100h`, `shr ax, 3` (octet) et `and ax, 7` (bit) dans le tableau `word_7D00E`.

Dans les données, les drapeaux vont de 74 à 6 969. Variables vues dans le code : 81 et 86 (posées par
`SET_VARIABLE`\*), 82 et 83 (mois et année, § 3.3), 130 (mission mise de côté, § 3.3).

### 2.1 Une seule table pour le déroulement, les conversations et les missions

Les scripts de mission (`PROG`) lisent et écrivent **la même table** que le déroulement et les conversations.
L'interpréteur des scripts de mission (`Expr_VM_Interpreter_51F24`, seg125, à la place qu'occupe
`Expr_VM_Interpreter_51106` dans STRIKE.EXE, juste après `Expr_VM_PopValue_51EB4`, mêmes instructions) appelle
`GameVar_Get_56414` et `GameVar_Set_564BB` pour toutes les instructions de drapeau (`OP_MOVE_FLAG_TO_WORK_REGISTER`,
`OP_SET_FLAG_TO_TRUE`, `OP_SET_FLAG_TO_FALSE`, `OP_ADD_1_TO_FLAG`, `OP_TEST_FLAG`… : 22 instructions). Dans Strike
Commander, ces instructions travaillent sur le chunk `FLAG` de la mission (`MISSION_SCRIPT_OPCODES.md`), et la
mission ne transmet au déroulement que les 8 valeurs `STAT` de `misn2op.iff`.

- **Encodage** : une instruction de drapeau occupe 4 octets : instruction, numéro (2 octets, bas puis haut), puis
  l'octet 5 (vérifié : `cmp byte ptr es:[bx], 5`, sinon erreur). Les autres instructions gardent l'encodage de
  Strike Commander (instruction, argument, puis 9 et un argument de plus). Les 64 fichiers de `MISSIONS` se lisent
  ainsi sans erreur de séparateur.
- **Le chunk `FLAG` des 51 fichiers de mission (`*-M*.IFF`) est vide (0 octet).**

Ce que les données montrent (numéros écrits par les `PROG` des missions, lus ailleurs) :

| Numéros | Écrits par | Lus par |
|---|---|---|
| 401 à 431 | une mission chacun : 401 = `PRLH-M1`, 402 = `PRLH-M2` … 431 = `IJOK-M4` | les conversations (`IF_FLAG`\*) ; `SET_DATE`\* (drapeaux 401 à 400 + mission courante) ; le déroulement pour 406 |
| 432 | les missions de fin de campagne (`*-ML`) | ces mêmes missions |
| 433, 434 | `LOSE-M1A` à `LOSE-M1C`, `LOSE-M2A` à `LOSE-M2C` | les conversations ; 433 par le déroulement |
| 435, 436 | `ENDG-M1`, `ENDG-M2` | 435 par le déroulement |
| 440 à 458 | quelques missions | les conversations |
| variables 170 à 182 | toutes les missions | les conversations (170, 173 à 176) ; `SET_DATE`\* (soustraites) |
| variables 185 à 194 | toutes les missions | le déroulement (185) ; `SET_DATE`\* (ajoutées deux fois) |
| variable 31 | toutes les missions | le déroulement (`IF_NOT_FLAG`) |
| variable 195, 201, drapeau 500 | les missions | les conversations |

Dans le sens inverse, le déroulement pose des numéros que les missions lisent (variable 187) et que les conversations
lisent (74 à 79, 440, 2 158 à 2 160, 2 210).

Exemple, `PRLH-M1` : au début, `OP_SET_FLAG_TO_FALSE 401` ; plus loin :

```
OP_TEST_FLAG 1
OP_BRANCH_IF_NOT_EQUAL 90
OP_TEST_FLAG 195
OP_BRANCH_IF_EQUAL 90
OP_SET_FLAG_TO_TRUE 401
OP_SET_LABEL 90
```

Le drapeau 401 est posé si la variable 1 vaut 1 et la variable 195 ne vaut pas 1 ; les conversations qui suivent la
mission testent ce drapeau. Dans `CRLS-M1`, les programmes 46 à 49 mettent une des variables 173 à 176 à 2, retirent
1 à la variable 31 et ajoutent 1 à la variable 200 ; le rôle de ces variables n'est pas établi.

## 3. Déroulement (`GAMEFLOW.IFF`)

### 3.1 Structure du fichier

`FORM GAME` → 41 `FORM MISS` (`INFO`, `EFCT`, `FORM SCEN`*) ; `FORM SCEN` → `INFO`, `FORM SPRT`*, **`TUNE`**
(1 octet, nouveau, 170 scènes) ; `FORM SPRT` → `INFO`, `EFCT`, `REQU`. `FORM MLST` (`DATA`, `PRTL`) existe
toujours. `WRLD`, `LOAD`, `WNGS` et `STAT` ne sont pas dans le fichier.

Lecture des chunks : une fonction pas encore nommée (`sub_C73DD`, ovr359, proposé `Gameflow_LoadScene_C73DD`)
lit `SCEN`, `SPRT`, `REQU` et `EFCT` (`push large 55514552h` = « REQU », `push large 54434645h` = « EFCT »).

### 3.2 Conditions `REQU`

Suite de conditions de **3 octets** : 1 octet de condition, puis le numéro de drapeau sur 2 octets (bas, puis
haut). Strike Commander : 2 octets. Les 2 597 chunks des données se lisent sans reste ; seules les conditions
`REQUIRE_NOT_SET` (2 393) et `REQUIRE_SET` (4 447) y figurent.

### 3.3 Scripts `EFCT`

Interpréteur : une fonction pas encore nommée (`sub_604D4`, seg143), proposé **`Gameflow_RunScript_604D4`**,
l'équivalent de `Gameflow_RunScriptPairs_36CF` d'OPTEST. Même boucle et mêmes blocs conditionnels (`ELSE` 30,
`ENDIF` 31, `OR_GROUP` 33 lu avant la table). Table de 42 commandes (`cmp bx, 29h / jbe` puis
`jmp cs:off_60C85[bx]`).

**Longueur.** La commande lit toujours 3 octets : `[script+i]` (commande), `[script+i+1]` (`var_A`),
`[script+i+2]` (`var_B`), et le mot `var_A | var_B << 8` (`shl dx, 8 / add ax, dx` → `di`). Le pas est de 2
octets, **3 pour les commandes 0, 6, 7, 9, 10, 35 et 36** (`inc [bp+var_8]` en `loc_60AF9`, puis
`add [bp+var_8], 2`), y compris quand elles sont sautées (`cmp [bp+var_9], 6` … `24h` → `loc_60AF9`). Les
3 379 scripts des données se lisent avec cette règle sans reste.

| Valeur | Nom | Octets d'argument | Effet constaté dans le code |
|---|---|---|---|
| 0 | `PLAY_CONV` | 2 (mot) | conversation n (`Gameflow_PlayConversation_C781E`, puis `Conv_PlayScript_C2ED0`) ; `[partie+1248]` = 1 |
| 1 | `PLAY_SCENE` | 1 | scène `[partie+1265]` = n ; **arrêt du script** (`[bp+var_3]` = 1) ; `[partie+1248]` = 1 |
| 2 | `PLAY_ENDING`\* | 1 | `Gameflow_PlayEndingOrFuneral_C798D` : n de 1 à 5 → texte de fin `ENDTEXTn.IFF` (`Gameflow_PlayEndText_E3517`) ; autre n → cinématique `FUNERAL.PAK` (`Gameflow_PlayFuneral_E4EBB`) ; données : 0 (après la conversation de la mort du joueur), 1, 2, 4, 5 |
| 3 | `FLY_MISSION_NOW` | 1 | mission `[partie+1262]` = n, `[partie+1254]` = 1 |
| 4 | `NOP_4` | 1 | rien |
| 5 | `CAMPAIGN_RESULT`\* | 1 | selon la mission `[partie+1263]` (tranches 0 à 11, 12 à 17, 18 à 19, 20 à 23, 24 à 27), compte des variables et drapeaux et pose l'un des drapeaux 2 156, 2 220 à 2 226 ; argument non lu |
| 6 | `SET_FLAG` | 2 (mot) | `GameVar_SetFlag_5646D`(n) |
| 7 | `CLEAR_FLAG` | 2 (mot) | `GameVar_ClearFlag_56520`(n) |
| 8 | `PLAY_SHOT` | 1 | `Gameflow_PlayShot_C7A2C` : `OPTIONS.IFF`, chunks `ESTB`, `SHOT`, `TUNE`, `SHPS`, `PALS` |
| 9 | `IF_NOT_FLAG` | 2 (mot) | test : réussit si `GameVar_Get_56414`(n) = 0 |
| 10 | `IF_FLAG` | 2 (mot) | test : réussit si `GameVar_Get_56414`(n) ≠ 0 |
| 11 | `RETURN_TO_MENU`\* | 1 | `[partie+1254]` = 0, arrêt du script, `[partie+1248]` = 1 (`NOP_11` dans SC) |
| 12 | `SELECT_MISSION` | 1 | mission `[partie+1262]` = n |
| 13 | `SET_NEXT_MISSION` | 1 | `[partie+1264]` = n |
| 14 | `START_FLIGHT` | 1 | `[partie+1254]` = 1 |
| 15 | `GOTO_NEXT_MISSION` | 1 | `[partie+1254]` = 2 et **arrêt du script** |
| 16 | `SAVE_GAME` | 1 | choix d'un fichier (`sub_DEF72`), puis sauvegarde (`sub_CD720`, pas encore nommées) |
| 17 | `LOAD_GAME` | 1 | choix d'un fichier (`sub_DEEAD`) ; s'il est donné, `[partie+1254]` = 3 |
| 18 | `TRAVEL`\* | 1 | `Gameflow_Travel_D3E8B` : morceau 8 ; départ (`DEPART.PAK`, lieu `PLAC`[variable 86] et date `DATE`[variable 82], jour variable 81, année variable 83, chunks de `STRING.IFF`) ; carte n (`MAPDATA.IFF` : `FORM MAPS` d'`INFO` n, `LABL`, `LINE` ; `MIDMAP.PAK`, police `MAPFONT`) ; arrivée (`ARRIVE.PAK`) |
| 19 | `LOOK_AT_KILLBOARD` | 1 | `Gameflow_KillBoard_D47D0` : tableau `BLKBRD`, polices `BOARDFNT`, `CSMLGP` |
| 20 | `IF_MISSION_ACCEPTED` | 1 | test : réussit si `[partie+1630]` ≠ 0 |
| 21 | `IF_MISSION_REFUSED` | 1 | test : réussit si `[partie+1630]` = 0 |
| 22 | `LAUNCH_MISSION`\* | 1 | `Gameflow_LaunchMission_CAD9D` : chunk `FPLN` de `STRING.IFF` (fichiers d'avion) ; avion du joueur choisi par les drapeaux 2 100 à 2 106, 2 200, 2 201 (`Gameflow_ChooseAircraft_CAAF2`) ; mission réécrite dans `instant` ou `test` (`Gameflow_WriteInstantMission_CAEBB` : `MISN`, `CAST`, `CAMP`, `PROG`, `PART`, `TEAM`, `PLAY`, `LOAD`) ; `[partie+1254]` = 1 ; cinématique du pont (`sub_D9A80` : `BACKGRND`, `ELEVATOR`, image de l'avion). Argument non lu |
| 23 | `MEDIT_SCREEN`\* | 1 | `Gameflow_MeditScreen_E3D9D` : `MEDIT.PAK`, police `SM-FONT`, liste `MLST`, lecture d'un fichier de mission, carte `NAVMAP` ; rôle de l'écran non établi |
| 24 | `SET_MUSIC_MOOD` | 1 | `[partie+1255]` = n, puis `Music_SetPendingTune_5ED30`(n) |
| 25 | `SET_SCENE`\* | 1 | scène `[partie+1265]` = n, **sans** arrêt du script (`LOOK_AT_LEDGER` dans SC) |
| 26 | `SHOW_KILL_MARKS` | 1 | si `[partie+1259]` ≠ 0 et `[partie+1261]` ≠ 2 : `Gameflow_EmptyKillMarks_CA3D2`, fonction vide (`mov ax, [bp+arg_0] / retf`) |
| 27, 28 | — | — | erreur (`push 0DA18h` / `sub_1DDFE`) : `REMOVE_PILOT` et `IF_TRUE` n'existent plus |
| 29 | `SHOW_DOSSIER`\* | 1 | `Gameflow_ShowDossier_D3F00` : page n (1 à 8) de `DOSSIER.PAK` (8 entrées), police `FOPTIONS` ; dans les données, chaque sprite pose un drapeau de 2 180 à 2 187 puis ouvre la page 1 à 8 |
| 30, 31 | `ELSE`, `ENDIF` | 1 | traités avant la table |
| 32 | `IF_MISSION_SUCCESS` | 1 | test : réussit si l'octet `[partie+1266+n]` = 1 |
| 33 | — | — | erreur dans la table ; `OR_GROUP` est traité avant |
| 34 | `APPLY_CHANGE` | 1 | `Gameflow_ApplyChange_CA290` : chunks `STAT`, `CHNG`, `INFO` du fichier dont le chemin est en `[partie+1008]` ; absente des données |
| 35 | `SET_VARIABLE`\* | 2 (deux octets) | `GameVar_Set_564BB`(a, b) : variable a = b |
| 36 | `SET_DATE`\* | 2 (deux octets) | date à partir du mois a et de l'année b (§ 3.4) |
| 37 | `ADVANCE_MONTHS`\* | 1 | date + n mois (§ 3.4) |
| 38 | `SET_BYTE_1382`\* | 1 | `[partie+1382]` = n ; rôle non établi |
| 39 | — | — | erreur |
| 40 | `SAVE_MISSION_INDEX`\* | 1 | variable 130 = `[partie+1263]` |
| 41 | `RESTORE_MISSION_INDEX`\* | 1 | `[partie+1263]` = variable 130 |

Tests comptés pendant un saut (pour les `ENDIF` imbriqués) : 9, 10, 20, 21, 22, 28, 32 (même liste qu'OPTEST
sans 35 ni 37).

### 3.4 La date (commandes 36 et 37)

Variable 82 = mois, variable 83 = année. Les données écrivent `SET_DATE` avec l'année sur 2 chiffres
(42 à 45, donc 1942 à 1945), le mois avant :

```
SET_VARIABLE 81 16
SET_DATE 1 42
```

`SET_DATE a b` (`loc_60AFF`) : un total t est formé de b × 12 + a, augmenté d'un compte tiré des drapeaux 401 à
400 + `[partie+1263]` (rang pair : + 2 si le drapeau n'est pas posé ; rang impair : − 1 s'il est posé), des
variables 170 à 182 (soustraites) et 185 à 194 (ajoutées deux fois) ; t est au moins la date courante + 1 mois
(`cmp [bp+var_12], di / jge`). Puis année = t ÷ 12 et mois = t − année × 12. `ADVANCE_MONTHS n`
(`loc_60BF1`) : t = année × 12 + mois + n, même découpage.

## 4. Conversations (`CONV.PAK`)

### 4.1 Le fichier

283 entrées pleines, 31 vides (marque 7 dans la table du PAK). Chaque entrée pleine : 4 octets de taille, puis
un flux PKWARE DCL (« implode », octets `00 06`). libRealSpace décompresse déjà ce flux (`SCConvPlayer::SetID`,
`PKWareDecompressor`).

### 4.2 L'interpréteur

Fonction pas encore nommée `sub_C2ED0` (ovr351), proposé **`Conv_PlayScript_C2ED0`**, l'équivalent de
`Conv_PlayScript_5AA4E` d'OPTEST : lit un octet de commande, `cmp bx, 11h / jbe` puis `jmp cs:off_C4370[bx]`
(18 cas). Chaque commande remplit un enregistrement par une petite fonction de lecture (ovr355).

| Valeur | Nom | Champs (dans l'ordre) | Lu par (proposé) |
|---|---|---|---|
| 0 | `GROUP_SHOT` | décor (9) ; puis les commandes 1, 10 et 17 qui suivent | `ConvRec_ReadName_C5800` |
| 1 | `GROUP_SHOT_ADD_CHARACTER` | figure (9), x (mot), y (mot) | `ConvRec_ReadFigure_C59CE` |
| 3 | `CLOSEUP` | visage (9), image (1), décor (9), x (mot), y (mot), texte, couleur (1), voix (4) ; puis les commandes 10 qui suivent | `ConvRec_ReadCloseup_C5827` |
| 5 | `IF_FLAG`\* | numéro (mot) | `ConvRec_ReadNumber_C5BAE` |
| 10 | `SHOW_TEXT` | couleur (1), texte, voix (4) | `ConvRec_ReadText_C5B07` |
| 12 | `ELSE`\* | aucun | — |
| 13 | `ENDIF`\* | aucun | — |
| 16 | `NOP_16` | aucun | — |
| 17 | `GROUP_SHOT_COMMANDER`\* | n (mot), n numéros d'image (mot), x (mot), y (mot) | `ConvRec_ReadMarks_C5960` |
| autre | — | erreur (`push 9999h` / `sub_1DDFE`) | — |

Différences avec Strike Commander :

- **Pas d'identifiant de voix devant le texte** : le texte vient directement, terminé par 0.
- **4 octets après chaque texte**, lus comme deux mots (`[rec+15h]`, `[rec+17h]` pour `CLOSEUP`). Le code les
  passe ensemble (`push large [bp+var_CF]`) à la lecture d'une voix (chemin construit avec « strtspch ») si le
  premier mot ≠ 65 535 et que la parole est active (`byte_7CB1B`, `word_79E69`). Dans les données : 65 535 dans
  2 722 cas sur 2 731, 1 ou 2 dans les autres ; le second mot n'a pas de valeur suivie (restes de texte).
- **`CLOSEUP` lit les mêmes champs que Strike Commander** (visage, image, décor, x, y, texte, couleur). Les
  `SHOW_TEXT` (10) qui le suivent sont lus avec lui (`cmp byte ptr es:[bx], 0Ah` en `loc_C3EFF` et `loc_C3FE0`) ;
  il n'y en a pas dans les données. `CLOSEUP_CONTINUATION` (4), `YESNOCHOICE_BRANCH1` (11) et
  `GROUP_SHOT_CHARACTER_TALK` (2) tombent dans le cas d'erreur de la table.
- **Blocs conditionnels** : `IF_FLAG`\* n met `[bp+var_15]` = 1 si `GameVar_Get_56414`(n) = 0
  (`ConvRec_FlagNotSet_C5B91`) ; `ELSE`\* inverse `[bp+var_15]` ; `ENDIF`\* le remet à 0. Tant que `[bp+var_15]`
  est posé, `GROUP_SHOT` et `CLOSEUP` sont lus sans être affichés. Pas d'imbrication.
- **`GROUP_SHOT`** : le décor seul ; les figurants (1), les textes (10) et le commandant (17) qui suivent sont lus
  par la scène de groupe (`cmp ax, 11h`, `cmp ax, 0Ah` dans `loc_C304E`).
- **`GROUP_SHOT_COMMANDER`\* (17)** : le commandant devant une carte de briefing (`ph2map1`, `cs1map1`…), qui
  pointe la cible (x, y) avec sa baguette. Calque créé par `PointerLayer_Construct_62E1B` :
  - figure `yucmndr` si le drapeau 2 128 est posé, sinon `commndr` (`push 850h` / `GameVar_Get_56414`) ; ses images
    couvrent l'écran (en-tête 0 à 319 × 0 à 199) : image 0 = le commandant, 1 à 15 = le bras ;
  - les n mots = liste d'images, montrées dans l'ordre (`PointerLayer_Advance_62F57` avance d'une étape et reste sur
    la dernière) ;
  - `GAMEFLOW\PTR.IFF` (`FORM CPTR`, chunk `DATA`) : x, y (2 octets chacun) du point de la main pour chaque image,
    en coordonnées d'écran (`PointerLayer_LoadHandPoints_62F7E`, rangés en `[calque+35+4×image]`) ;
  - dessin (`PointerLayer_Draw_62EF2`), dans cet ordre : la baguette, trait de couleur 15
    (`PointerLayer_DrawStick_630DA`) depuis le point de la main de l'image courante, jusqu'à la cible à la dernière
    étape, sinon jusqu'au point de la main décalé de |point de la dernière image − cible|
    (`PointerLayer_StickOffset_6308B`) ; puis **l'image 0** (`sub_6A514` avec l'image 0 : le mot 0 laissé sur la
    pile par `push large 0` / `add sp, 0Ah`) ; puis l'image courante (`Layer_DrawAtOwnPos_66BEC`). À la dernière
    étape, y de la cible moins `[groupe+6]` (valeur non lue ; avec 0, la baguette de la conversation 4 tombe sur
    Kwajalein, cible (115, 70)).
- Plus de saut relatif (`YESNOCHOICE_BRANCH2`), d'escadre (`SELECT_WING`) ni de choix d'équipier
  (`CHOOSE_WINGMAN`) : 12, 14 et 15 sont des erreurs ou ont un autre sens.

Avec cette grammaire, les 283 conversations se lisent jusqu'au dernier octet.

## 5. Rapport avec libRealSpace

- `PSGameFlowParser::parseOpCode` : les longueurs sont celles du code pour 0, 6, 7, 9, 10, 35 et 36 (2 octets).
  Une commande absente de sa table n'est pas ajoutée à la liste (`continue`) et son argument n'est pas sauté :
  c'est le cas de 5, 11, 25, 37, 38, 40 et 41, présentes dans les données.
- `PSGameFlowParser::parseRequBytes` : 3 octets, comme le code.
- Commandes de conversation à ajouter : `IF_FLAG`\*, `ELSE`\*, `ENDIF`\*, `GROUP_SHOT_COMMANDER`\*.
- `PSConvPlayer::SetArchive` découpe les répliques en cherchant le mot 65 535 : le code lit chaque champ à sa place
  (tableau du § 4.2), et le mot 65 535 est le numéro de voix absent, pas une marque de fin.
