# Déroulement de la campagne (GAMEFLOW, OPTEST.EXE)

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
| `*.sav` | sauvegardes du joueur (commandes 10h et 11h) |

## 2. GAMEFLOW.IFF

Formes de premier niveau (relevées dans les données) :

| Forme | Contenu |
|---|---|
| `FORM GAME` | 49 × `FORM MISS` : `INFO`, `EFCT` (script de la mission), `FORM SCEN`* |
| `FORM SCEN` (dans une mission) | `INFO` (numéro de la scène), `FORM SPRT`* |
| `FORM SPRT` (dans une scène) | `INFO` (numéro du sprite), `EFCT` (script joué au clic), `REQU` (conditions de visibilité, facultatif) |
| `FORM WRLD` | `FORM MAPS`* : `INFO`, `SPED`, `DATA` (cartes de la commande 12h) |
| `FORM LOAD` | chunks `LOAD` : chargements d'armes par défaut (commande 16h) |
| `FORM MLST` | `DATA` (noms des fichiers de mission), `PRTL` |
| `FORM WNGS` | `FORM WING`* : `INFO`, `PILT`, `ORDR` (escadres, conversations 0Eh / 0Fh) |
| `FORM STAT` | `FORM CHNG`* : `INFO`, `CASH`, `OVER`, `WEAP`, `PILT` (changements, commande 22h) |

**Script `EFCT`** : suite de paires d'octets **(commande, argument)** ; longueur = taille du chunk.

**`REQU`** : suite de paires **(condition, numéro de drapeau)**, § 4.

**`LOAD`** (un chunk par chargement) : 1er octet = numéro du chargement, puis des paires
(arme, nombre).

**`CHNG`** : `INFO` = numéro du changement ; `CASH` et `OVER` = octet opération + dword valeur ;
`WEAP` = octet opération, octet arme, mot nombre (répété) ; `PILT` = octet opération, octet pilote,
octet compteur (0 ou 1), mot valeur (répété). Opérations : 0 = ajouter, 1 = retirer, 2 = remplacer.

## 3. Boucle principale (`Gameflow_MainLoop_3D2E`)

Machine à états sur l'octet **`[partie+0E8h]`** :

| Valeur | Posée par | Effet au tour suivant de la boucle |
|---|---|---|
| 0 | départ, fin de partie (1Dh) | menu d'accueil (`Gameflow_MainMenu_4F1A7`) |
| 1 | 03h, 0Eh, écran d'armement (16h) | **départ en vol** : sauvegarde `tmpsav.tmp` (`Gameflow_SaveTmpState_4BBA0`, sauf si `[+0F9h]` = FEh), écriture d'`op2misn.iff` (`Gameflow_WriteMissionOrder_4BBF7`), sortie d'OPTEST pour STRIKE.EXE. Au retour : compte rendu (§ 6) |
| 2 | 0Fh | **mission suivante** : mission courante `[+0FAh]` = `[+0FBh]` (posé par 0Dh), `[+0FBh]` = FFh |
| 3 | 11h, menu | chargement du fichier choisi (nom en `partie+93h`) |
| 4 | la boucle elle-même | **dans les scènes** |

Après le traitement de l'état : `[+0E8h]` = 4, puis

1. lecture du script de la mission courante `[+0FAh]` (`Gameflow_LoadMissionScript_4A440` : `MISS`
   / `INFO`, `EFCT`) et **exécution** (`Gameflow_RunScriptPairs_36CF`) — au début de chaque mission
   **et au retour de chaque vol** (sauf code de sortie 3, § 6) ; c'est ce qui permet au script de
   mission de réagir au résultat du vol ;
2. si `[+0E8h]` vaut alors 4 ou 2 : sauvegarde automatique `gensave.tmp` ;
3. tant que `[+0E8h]` = 4 : une scène (`Gameflow_PlayScene_3B0B`) ;
4. si `[+0E8h]` = 1 : départ en vol (ci-dessus).

**Une scène** (`Gameflow_PlayScene_3B0B`) : si `[+0E3h]` est posé (commande 01h), la scène
`[+0FCh]` est reconstruite (`Gameflow_BuildScene_4A60B`, visibilité des sprites par `REQU`) ; la
scène est affichée avec la musique `[+0E9h]`, le joueur clique un sprite, et le script `EFCT` de ce
sprite est exécuté.

## 4. Visibilité des sprites (`REQU`, `Gameflow_CheckSpriteRequirements_3604`)

Relu le 2026-10-22, dans la version disquette et dans la version CD (code identique, 05C4Bh dans
l'OPTTEST.EXE du CD).

### 4.1 Quand et avec quel effet

- `REQU` est évalué **à la construction de la scène** (`Gameflow_BuildScene_4A60B`, seul appel),
  c'est-à-dire quand la commande 01h a posé `[+0E3h]` (et au début de chaque mission).
- Un sprite dont les conditions échouent **n'est pas ajouté à la scène** (`sub_34F6` n'est pas
  appelé) : ni dessiné, ni cliquable. Un sprite sans `REQU` est toujours ajouté.
- Les drapeaux sont les octets `[partie+0FDh + n]`, posés par 06h, effacés par 07h. Un drapeau
  changé par le script d'un sprite ne change la visibilité qu'à la reconstruction suivante.

### 4.2 Les conditions

`REQU` = suite de paires (condition, n). Deux variables : `visible` (vrai au départ) et
`ignorer` (faux au départ).

| Condition | Effet | Données |
|---|---|---|
| 0 | si le drapeau n est posé et que `ignorer` est faux → `visible` = faux ; puis `ignorer` = faux | 276 |
| 1 | si le drapeau n n'est pas posé et que `ignorer` est faux → `visible` = faux ; puis `ignorer` = faux | 158 |
| 2 | si le drapeau n n'est **pas** posé → `ignorer` = vrai (sinon inchangé) | 14 |
| 3 | si le drapeau n est posé → `ignorer` = vrai (sinon inchangé) | 11 |
| autre | rien | 1 (valeur 9) |

En logique : toutes les conditions 0 / 1 sont liées par **ET** ; une condition 2 ou 3 ajoute un
**OU** à la condition 0 / 1 qui la suit :

- `(0, n)` = drapeau n non posé ; `(1, n)` = drapeau n posé ;
- `(2, a), X` = drapeau a non posé **ou** X ; `(3, a), X` = drapeau a posé **ou** X ;
- plusieurs 2 / 3 de suite s'additionnent : `(2, a), (2, b), X` = a non posé **ou** b non posé
  **ou** X ;
- seules les conditions 0 et 1 remettent `ignorer` à faux ; une condition 2 / 3 fausse ne l'efface
  pas ;
- une condition 2 / 3 en **dernière** position (ou suivie seulement de valeurs inconnues) n'a aucun
  effet.

### 4.3 Exemples des données

| Sprite | `REQU` | Visible si |
|---|---|---|
| mission 0, scène 11, sprite 3 | (0, 102) | drapeau 102 non posé ; son script pose 102 : il disparaît après la conversation 12 |
| mission 9, scène 1, sprite 8 | (3, 3) (1, 4) (0, 42) | (3 posé ou 4 posé) et 42 non posé |
| mission 9, scène 6, sprite 0 | (2, 42) (2, 43) (0, 44) | 42, 43 ou 44 non posé (caché quand les trois sont posés) |
| mission 12, scène 20, sprite 18 | (1, 42) (2, 43) (0, 44) | 42 posé et (43 non posé ou 44 non posé) |
| mission 23, scène 20, sprite 12 | (2, 201) (2, 202) (9, 203) | **toujours** : 9 est ignoré, les deux 2 n'ont plus de condition à faire ignorer |

Formes des 215 `REQU` des données (suite des conditions) : `0` × 59, `1` × 26, `1 0` × 24,
`0 0` × 17, `0 1` × 13, `1 1 1` × 9, `0 0 0 0 0` × 7, `3 1 0` × 6, … ; 2 ou 3 apparaissent dans
22 d'entre elles.

### 4.4 Code de référence

Fichier `tools/gameflow_ref/requ.cpp` (compilé, style du dépôt, avec un essai sur le sprite 8 de
la mission 9) :

```cpp
// Visibilité d'un sprite d'après son chunk REQU (Gameflow_CheckSpriteRequirements_3604).
// requ : paires (condition, numéro de drapeau) ; flags : drapeaux de la partie (06h / 07h).
bool spriteIsVisible(const uint8_t *requ, size_t size, const bool *flags) {
    bool visible = true;
    bool skipNext = false;
    for (size_t i = 0; i + 1 < size; i += 2) {
        uint8_t condition = requ[i];
        bool flag = flags[requ[i + 1]];
        switch (condition) {
        case 0:
            // caché si le drapeau est posé, sauf si la condition est ignorée
            if (flag && !skipNext) {
                visible = false;
            }
            skipNext = false;
            break;
        case 1:
            // caché si le drapeau n'est pas posé, sauf si la condition est ignorée
            if (!flag && !skipNext) {
                visible = false;
            }
            skipNext = false;
            break;
        case 2:
            // drapeau non posé : la prochaine condition 0 ou 1 est ignorée
            if (!flag) {
                skipNext = true;
            }
            break;
        case 3:
            // drapeau posé : la prochaine condition 0 ou 1 est ignorée
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
   « non posé ». Exemple : sprite 12 de la scène 11 de la mission 4, `REQU` = (1, 0), visible
   seulement quand le drapeau 0 est posé ; tant que le drapeau 0 n'a jamais été posé ni effacé,
   libRealSpace l'affiche et le jeu le cache. C'est la différence des 127 sprites ; elle disparaît
   si la map contient tous les drapeaux dès le début de la partie (non vérifié dans le code de
   libRealSpace fourni).
2. **Les « ou ».** `isActive` combine les termes de gauche à droite (`(P et ¬a) ou X` pour
   `P, (2, a), X`) alors que le jeu calcule `P et (¬a ou X)`. Grâce à l'arrêt anticipé
   (`if (!isActive && !nextOpIsOr) break;`), le résultat est le même sur toutes les données.
3. **Valeur inconnue après un 2 / 3.** Le seul cas des données : sprite 12 de la scène 20 de la
   mission 23, (2, 201) (2, 202) (9, 203). Le jeu l'affiche toujours ; `isActive` calcule
   « 201 non posé ou 202 non posé » et le **cache quand 201 et 202 sont posés** (le « ou » reste
   ouvert, le 9 est ignoré). Ce sprite porte le départ en vol de la mission 23 (`0C 20`,
   conversation 127, armement `16 12`).
4. **Moment de l'évaluation.** Dans le jeu, la visibilité n'est calculée qu'à la construction de
   la scène (§ 4.1). Où `isActive` est appelé dans libRealSpace n'est pas dans le code fourni :
   s'il l'est à chaque image, un sprite peut disparaître juste après son clic, alors que le jeu le
   garde jusqu'à la reconstruction de la scène.

**Correction proposée** : `tools/gameflow_ref/sczone_isactive.cpp` — la méthode
`SCZone::isActive` réécrite sur la règle du jeu (drapeau absent = non posé, 2 / 3 = « ignorer la
condition 0 / 1 suivante », valeur inconnue ignorée), même signature ; compilée avec des types
simulés et testée sur (1, 0).

`SCGameFlow::playEndMission` décide aussi de passer à la mission suivante d'après `REQU` (sprite
sans `REQU`, ou avec une condition 1). Dans le jeu, le passage à la mission suivante est fait par
les commandes 0Dh puis 0Fh du script (§ 5.2) ; aucun lien entre `REQU` et ce passage n'a été vu
dans le code lu.

## 5. Interpréteur des scripts (`Gameflow_RunScriptPairs_36CF`)

### 5.1 Blocs conditionnels

- Un **test** qui échoue pose l'état « saut » : les commandes suivantes sont sautées jusqu'à
  **1Eh** (« sinon » : l'état bascule) ou **1Fh** (fin de bloc : l'état saut est effacé).
- Un test qui réussit ne fait rien : il n'ouvre pas de niveau.
- Pendant un saut, chaque test rencontré (09h, 0Ah, 14h, 15h, 16h, 1Ch, 20h, 23h, 25h) ajoute un
  niveau, et 1Eh / 1Fh de ce niveau ne font que le refermer ; seuls 1Eh / 1Fh au niveau 0 agissent.
- Un test sans 1Fh saute **jusqu'à la fin du script** (cas de 16h dans les données).
- **21h n** (absent des données) : pendant les n commandes suivantes, chaque commande doit être un
  test (sinon erreur fatale « Faulty OR structure in gameflow file ») et elle est évaluée même si un
  test précédent a échoué. Le nom vient du message ; l'effet exact n'est pas celui d'un « ou »
  (un test qui échoue pose toujours l'état saut), à ne pas porter sans données qui l'utilisent.
- **1Dh** peut arrêter le script (fin de partie).

### 5.2 Les commandes

« Données » = nombre d'occurrences dans `GAMEFLOW.IFF` (MISS = script de mission, SPRT = script de
sprite). « libRealSpace » = nom dans le dump `gameflow_parsed.txt` (vide = non nommée).

| Cmd | libRealSpace | Données | Effet dans le jeu |
|---|---|---|---|
| 00h | PLAY CONV | 285 | conversation n (`Gameflow_PlayConversation_4AAAB`) |
| 01h | PLAY SCENE | 391 | scène courante `[+0FCh]` = n, `[+0E3h]` = 1 : la scène n est (re)construite après le script |
| 02h | PLAY MIDGAME | 12 | cinématique n (`Gameflow_PlayMidgame_4ABE0`) |
| 03h | FLY MISSION AND GOTO NEXT MISSION | 3 | mission à voler `[+0F9h]` = n et **départ en vol** (`[+0E8h]` = 1), sans écran d'armement |
| 04h | — | 43 (SPRT) | **rien** (dans les deux versions) |
| 05h | — | 0 | `[+0F9h]` = n (comme 0Ch) |
| 06h | SET TRUE | 204 | drapeau n posé |
| 07h | SET FALSE | 93 | drapeau n effacé |
| 08h | PLAY SHOT | 118 | plan fixe n d'`OPTIONS.IFF` (`ESTB` / `SHOT`, `Gameflow_PlayShot_4AD86`) |
| 09h | IF NOT | 17 | test : réussit si le drapeau n n'est pas posé |
| 0Ah | IF | 47 | test : réussit si le drapeau n est posé |
| 0Bh | — | 0 | rien |
| 0Ch | PLAY FLY MISSION | 48 (SPRT) | mission à voler `[+0F9h]` = n (le vol part de l'écran d'armement, 16h) |
| 0Dh | SET NEXT MISSION | 93 | mission suivante `[+0FBh]` = n |
| 0Eh | — | 0 | départ en vol (`[+0E8h]` = 1) |
| 0Fh | GOTO NEXT MISSION | 29 | passage à la mission suivante (`[+0E8h]` = 2) |
| 10h | SAVE GAME | 54 | choix d'un fichier (`Gameflow_SaveRequester_4D984`) ; s'il est donné, sauvegarde dans ce fichier puis dans `gensave.tmp` |
| 11h | LOAD GAME | 54 | choix d'un fichier (`Gameflow_LoadRequester_4DDDC`) ; s'il est donné, `[+0E8h]` = 3 |
| 12h | PLAY SHOW MAP | 12 | carte n (`WRLD` / `MAPS`, `Gameflow_ShowMap_542AC`) |
| 13h | LOOK AT KILLBOARD | 54 | tableau des victoires (`Gameflow_KillBoard_51049`) |
| 14h | IF MISSION ACCEPTED | 20 | test : réussit si la mission a été acceptée dans la dernière conversation (`[+35Bh]` ≠ 0) |
| 15h | IF MISSION REFUSED | 6 | test : réussit si elle a été refusée |
| 16h | — | 42 (SPRT) | **écran d'armement** (§ 5.3) ; test : réussit si le joueur part en vol |
| 17h | VIEW CATALOG | 43 | catalogue d'achat d'armes (`Gameflow_Catalog_52662`) |
| 18h | — | 11 (MISS) | **humeur musicale** du déroulement `[+0E9h]` = n (`Music_SetGameflowMood_28C73`) ; données : 0, 6, 8 |
| 19h | LOOK AT LEDGER | 54 | livre de comptes (`Gameflow_Ledger_53686`) |
| 1Ah | — | 27 (MISS) | si le joueur a eu des victoires pendant le vol (`[+0EDh]`, § 6) et n'est pas mort (`[+0F8h]` ≠ 2) : **marques de victoires peintes sur l'avion** (`OPTIONS.IFF` `MARK`, `Gameflow_ShowKillMarks_506AA`) |
| 1Bh | — | 2 (MISS) | **retire le pilote n** du tableau des victoires (`[+2A3h + n × 1Ah]` = 0 ; n < 8) ; données : 6, 7 |
| 1Ch | — | 0 | test qui réussit toujours (compté comme test pendant un saut, sans effet) |
| 1Dh | — | 12 (MISS) | **fin de partie** (`Gameflow_CheckLossConversations_50645`) : plus de 16 avions perdus au total → conversation 254 ; sinon argent < 0 → conversation 255 ; dans les deux cas retour au menu (`[+0E8h]` = 0) et arrêt du script |
| 1Eh | ELSE | 117 | sinon (§ 5.1) |
| 1Fh | ENDIF | 159 | fin de bloc (§ 5.1) |
| 20h | OTHER IF | 62 | test : réussit si la mission n de `MLST` a été volée **avec succès** (`[+1FDh + n]` = 1, § 6) |
| 21h | — | 0 | groupe de tests (§ 5.1) |
| 22h | APPLY CHANGES | 94 | applique le changement `CHNG` n (§ 5.4, `Gameflow_ApplyChange_50160`) |
| 23h | — | 0 | test : réussit si des avions ont été perdus pendant le dernier vol (`[+0EAh]` ≠ 0) |
| 24h | — | 27 (MISS) | si des avions ont été perdus pendant le dernier vol : humeur musicale 8, puis conversation **253** si le joueur est mort (`[+0F8h]` = 2), **252** sinon |
| 25h | — | 7 (MISS) | test : réussit si la 3ᵉ valeur de `STAT` du compte rendu (`[+3D6h]`, § 6) ≠ 0 |
| 26h | — | 18 (MISS) | **joue le morceau n** de `SOUND\gameflow.dat` (`Music_PlayGameflowTune_28CFC`), gardé en `[+3D7h]` (sauvegardé) ; données : 1 à 5 |

Valeurs au-delà de 26h : rien (disquette). Version CD : 27h à 2Ah, § 8.

### 5.3 Écran d'armement (16h, `Gameflow_WeaponLoadout_51AB3`)

- Chargement par défaut : le chunk `LOAD` dont le 1er octet vaut l'argument
  (`Gameflow_ApplyDefaultLoadout_51830`). Chaque paire (arme, nombre) : nombre borné par le stock,
  rendu pair, posé par paires (un par aile) sur les points d'emport, avec un maximum par côté selon
  l'arme : armes 0 et 1 → 1 ; 8 → 2 ; 7 → 2 ; 4 et 5 → 6 ; 6 → emport central ; autres → 3.
- Le joueur ajoute ou retire des armes (« Add %s (%d) », « Remove %s (%d) »).
- **Sprite 12 (0Ch) cliqué → départ en vol** : `[+0E8h]` = 1, `[+0EEh]` = 1, le test réussit et la
  suite du script est jouée. Autre sortie → le test échoue, la suite du script est sautée.
- Dans les données, 16h suit toujours un 0Ch, par exemple : `0C 00` (mission 0), `00 0B`
  (conversation 11), `16 01` (armement, chargement 1).

### 5.4 Changements `CHNG` (22h)

| Chunk | Champ modifié | Remarque |
|---|---|---|
| `CASH` | argent `[+27Bh]` (dword) | valeur du fichier telle quelle ; pas de borne |
| `OVER` | frais généraux `[+27Fh]` (dword) | pas de borne |
| `WEAP` | stock de l'arme `[+261h + 2 × arme]` | retrait borné à 0 |
| `PILT` | compteur 0 → `[+29Fh]`, 1 → `[+2A1h]` du pilote (table de 8 × 1Ah octets) | retrait borné à 0 |

## 6. Retour de vol : compte rendu `misn2op.iff` (`Gameflow_ReadMissionResult_4B544`)

Lu au retour de STRIKE.EXE (état 1). Chunks, dans l'ordre de lecture :

| Chunk | Effet |
|---|---|
| `EXIT` | **code de sortie** → `[+0F8h]` ; 5 → rien d'autre n'est lu |
| — | la partie est rechargée depuis `tmpsav.tmp` (état d'avant le vol) |
| `INFO` | nom de la mission volée |
| `WPNS` | armes restantes : paires (nombre, nom) → stock `[+261h]` (9 armes, noms de la table dseg 2C8h) |
| `JETS` | avions perdus pendant le vol → `[+0EAh]` ; total `[+3D4h]` += ; coût `[+287h]` = perdus × 500 |
| `STAT` | 8 mots écrits par STRIKE.EXE (`Mission_WriteResultReport_A8F22`) : les 8 **variables de résultat du script de la mission** (opcode 14h d'`Expr_VM_Interpreter_51106` dans STRIKE.EXE, remises à 0 au début de la mission). OPTEST disquette en lit 3 : 1ʳᵉ = **succès** ; 2ᵉ = gain, ajouté à l'argent `[+27Bh]` ; 3ᵉ → `[+3D6h]` (test 25h). La version CD en lit 6 (§ 8). Leur sens dépend donc de chaque mission |
| `KILL` | par pilote (nom) : deux compteurs ajoutés à `[+29Fh]` et `[+2A1h]` ; `[+0EDh]` = 1 si le joueur en a (commande 1Ah) |
| `DIED` | noms de personnages : ceux de la table dseg 0ED8h (DiBianca, Templeman, Isaac, Roberts, Baldwin, Yenawine, Savage) ont leur drapeau dseg 0EE6h remis à 0 (codes `$A`, `$B` des conversations) |
| `SCOR` | ajouté au score `[+3D8h]` |

Puis : la mission est cherchée par son nom dans `GAMEFLOW.IFF` / `MLST` / `DATA` ; son drapeau
`[+1FDh + index]` = **1 si succès, 2 sinon** (test 20h) ; l'argent est diminué du coût des avions
perdus.

Le code de sortie décide de la suite dans `Gameflow_MainLoop_3D2E` :

| Code | Effet constaté |
|---|---|
| 1, 5 | rien de particulier : le script de la mission est rejoué |
| 2 | cinématique 33 (le joueur est mort), puis menu |
| 3 | rechargement de `gensave.tmp`, le script de la mission n'est **pas** rejoué |
| 4 | menu (`[+0E7h]` = 2) |

Le sens exact des codes 1, 3, 4 et 5 côté STRIKE.EXE n'est pas établi ici.

### 6.1 Ce que les missions mettent dans `STAT` (lu le 2026-10-22)

Les 8 valeurs sont écrites par le script `PROG` de chaque fichier de mission (opcode 14h ; bytecode :
MISSION_SCRIPT_OPCODES.md, « Instructions de base du bytecode PROG »), presque toujours dans le
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

**Ce que GAMEFLOW.IFF en fait** (test 25h ; le script d'une mission est joué à l'entrée, donc avec le
compte rendu du vol précédent, puis après chacun de ses vols) :

| Script | Vol lu | Effet |
|---|---|---|
| MISS 12 (MISN-4c) | son propre vol (Learjet) | si drapeau 42 : changement 22 ; puis drapeau **71** = 3ᵉ valeur ≠ 0. Sprite 5 de la scène 29 visible si 42 et 71 |
| MISS 18 (MISN-6b / 6x) | MISN-6a (AWACS) | drapeau **214** ; sprite 12 de la scène 20 : 214 → vole **MISN-6b**, sinon **MISN-6x** ; sprite 2 de la scène 29 de MISS 19 selon 214 |
| MISS 26 (MISN-8b / 8x) | MISN-8a (AWACS) | drapeau **211** → **MISN-8b**, sinon **MISN-8x** ; sprite 5 de la scène 29 de MISS 27 selon 211 |
| MISS 30 (MISN-9a) | MISN-9aa (BRIGC10), puis son propre vol | mission suivante = 31 (MISN-9b) ; si la 3ᵉ valeur ≠ 0 : drapeau **215** et **passage immédiat à la mission suivante** (0Fh), MISN-9a n'est pas jouée |
| MISS 33 (MISN-10b / 10x) | MISN-10a | drapeau **213** → **MISN-10b**, sinon **MISN-10x** ; sprite 19 de la scène 29 de MISS 34 selon 213 |
| MISS 41 (MISN-12b) | son propre vol (RWYEXT18) | si drapeau 50 et 3ᵉ valeur ≠ 0 : changements 27 (argent remplacé par 0) et 7 (argent − 2000), puis 1Dh : argent < 0 → conversation 255, **fin de partie** |
| MISS 48 | MISN-15a | si MISN-15a (mission 41 de `MLST`) a réussi : cinématiques 20 et 36 ; sinon plans 15 et 3, puis : 3ᵉ valeur ≠ 0 → changements 27 et 7 et 1Dh ; sinon conversation 236, changements 27 et 7 et 1Dh |

## 7. libRealSpace (`SCGameFlow.cpp`) : ce qui manque ou diffère

Comparaison avec `SCGameFlow.cpp` (fourni le 2026-10-22) et le dump `gameflow_parsed.txt`. Les
valeurs numériques des constantes `EFECT_OPT_*` (fichier d'en-tête non fourni) sont à faire
correspondre avec le tableau du § 5.2.

**Commandes présentes dans les données et non nommées dans le dump** :

| Cmd | Données | À faire dans libRealSpace |
|---|---|---|
| 04h | 43 | rien (le jeu ne fait rien) |
| 16h | 42 | écran d'armement, chargement `LOAD` n ; **test** : la suite du script n'est jouée que si le joueur part en vol. libRealSpace ouvre l'écran d'armement après tout script qui contient 0Ch (`flymission`, `WeaponLoadoutScene`) : le chargement par défaut `LOAD` n et le saut de la suite en cas d'annulation sont à vérifier |
| 18h | 11 | humeur musicale n (probablement `EFECT_OPT_TUNE_MODIFIER` / `GameState.tune_modifier`) |
| 1Ah | 27 | marques de victoires sur l'avion (`OPTIONS.IFF` `MARK`), si le joueur a eu des victoires et n'est pas mort |
| 1Bh | 2 | retirer le pilote n du tableau des victoires |
| 1Dh | 12 | fin de partie : libRealSpace (`EFECT_OPT_CHECK_BALANCE` probable) ne teste que l'argent ; le jeu teste **d'abord plus de 16 avions perdus au total** (conversation 254), puis l'argent < 0 (255), et arrête le script |
| 24h | 27 | humeur musicale 8 et conversation 253 / 252 si des avions ont été perdus pendant le vol (libRealSpace joue 252 seulement depuis `runFrame`, quand le joueur s'est éjecté) |
| 25h | 7 | test sur la 3ᵉ valeur de `STAT` du compte rendu ; absent du dump. Il décide de MISN-6b / 6x, 8b / 8x, 10b / 10x, du saut de MISN-9a et d'une fin de partie après MISN-12b (§ 6.1) |
| 26h | 18 | jouer le morceau n de `gameflow.dat` |

**Différences sur des commandes nommées** :

- **Blocs conditionnels** : libRealSpace ouvre un niveau pour chaque test, réussi ou non ; le jeu
  n'en compte que pendant un saut (§ 5.1). Le résultat est le même pour des blocs bien formés. Le
  test 16h n'a pas de 1Fh dans les données : un test qui échoue saute jusqu'à la fin du script.
  Seuls 09h, 0Ah, 14h, 15h, 16h, 1Ch, 20h, 23h et 25h sont des tests.
- **22h** : le jeu borne à 0 les retraits d'armes et de victoires (`WEAP`, `PILT`) ; il applique
  `CASH` directement à l'argent, sans multiplier par 1000 ni passer par un argent « projeté ».
- **03h** part en vol **sans** écran d'armement ; **0Ch** ne fait que choisir la mission (le vol
  part de 16h).
- **20h** (« OTHER IF ») teste le résultat d'une mission de `MLST` (1 = succès, 2 = échec, 0 = pas
  volée).
- **Après chaque vol**, le jeu rejoue le **script de la mission** courante : les tests 20h, 23h, 25h
  et les commandes 1Ah, 1Dh, 24h des scripts de mission sont écrits pour ce moment.

## 8. Version CD-ROM (OPTTEST.EXE du CD)

Interpréteur en 05D00h environ (table cs:0617h, `cmp bx, 2Ah`) : **43 commandes** (00h à 2Ah).
00h à 24h font la même chose que sur disquette (relu cas par cas ; 04h et 0Bh ne font rien).
La structure de partie a 4 octets de plus à partir de `+3D6h` :

| Cmd | CD-ROM |
|---|---|
| 25h | test : `[+3D7h]` ≠ 0 (3ᵉ valeur de `STAT`) |
| 26h | morceau n de `gameflow.dat`, gardé en `[+3DBh]` |
| 27h | test : `[+3D8h]` ≠ 0 (4ᵉ valeur de `STAT`) |
| 28h | test : `[+3D9h]` ≠ 0 (5ᵉ valeur de `STAT`) |
| 29h | test : `[+3DAh]` ≠ 0 (6ᵉ valeur de `STAT`) |
| 2Ah | test : `[+3D6h]` ≠ 0 (rangé par le chargement d'une partie ; rôle non établi) |

La version CD lit **six** des huit valeurs de `STAT` (STRIKE.EXE en écrit toujours huit) : succès,
gain, puis quatre valeurs gardées sur un octet en `[+3D7h]` à `[+3DAh]`. Les commandes 27h à 2Ah n'apparaissent pas dans `GAMEFLOW.IFF` de
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
- Le rôle des deux compteurs de victoires (`[+29Fh]`, `[+2A1h]`) : air et sol probablement, non
  vérifié dans l'affichage du tableau.
