# Déroulement de la campagne (GAMEFLOW, OPTEST.EXE)

> **Nombres en décimal** (opcodes, arguments, champs `+n`). Les adresses de code citées sont aussi
> en décimal ; les fichiers annotés les écrivent en hexadécimal.

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
| `*.sav` | sauvegardes du joueur (commandes 16 et 17) |

## 2. GAMEFLOW.IFF

Formes de premier niveau (relevées dans les données) :

| Forme | Contenu |
|---|---|
| `FORM GAME` | 49 × `FORM MISS` : `INFO`, `EFCT` (script de la mission), `FORM SCEN`* |
| `FORM SCEN` (dans une mission) | `INFO` (numéro de la scène), `FORM SPRT`* |
| `FORM SPRT` (dans une scène) | `INFO` (numéro du sprite), `EFCT` (script joué au clic), `REQU` (conditions de visibilité, facultatif) |
| `FORM WRLD` | `FORM MAPS`* : `INFO`, `SPED`, `DATA` (cartes de la commande 18) |
| `FORM LOAD` | chunks `LOAD` : chargements d'armes par défaut (commande 22) |
| `FORM MLST` | `DATA` (noms des fichiers de mission), `PRTL` |
| `FORM WNGS` | `FORM WING`* : `INFO`, `PILT`, `ORDR` (escadres, conversations 14 / 15) |
| `FORM STAT` | `FORM CHNG`* : `INFO`, `CASH`, `OVER`, `WEAP`, `PILT` (changements, commande 34) |

**Script `EFCT`** : suite de paires d'octets **(commande, argument)** ; longueur = taille du chunk.

**`REQU`** : suite de paires **(condition, numéro de drapeau)**, § 4.

**`LOAD`** (un chunk par chargement) : 1er octet = numéro du chargement, puis des paires
(arme, nombre).

**`CHNG`** : `INFO` = numéro du changement ; `CASH` et `OVER` = octet opération + dword valeur ;
`WEAP` = octet opération, octet arme, mot nombre (répété) ; `PILT` = octet opération, octet pilote,
octet compteur (0 ou 1), mot valeur (répété). Opérations : 0 = ajouter, 1 = retirer, 2 = remplacer.

## 3. Boucle principale (`Gameflow_MainLoop_3D2E`)

Machine à états sur l'octet **`[partie+232]`** :

| Valeur | Posée par | Effet au tour suivant de la boucle |
|---|---|---|
| 0 | départ, fin de partie (29) | menu d'accueil (`Gameflow_MainMenu_4F1A7`) |
| 1 | 3, 14, écran d'armement (22) | **départ en vol** : sauf si `[+249]` = 254, `Gameflow_SaveTmpState_4BBA0` fait passer à la mission suivante (`[+250]` = `[+251]`, posé par 13 ; `[+251]` = 255), retire de l'argent `[+635]` les frais généraux `[+639]` et les achats du catalogue `[+643]` (remis à 0), puis sauvegarde `tmpsav.tmp` ; écriture d'`op2misn.iff` (`Gameflow_WriteMissionOrder_4BBF7`), sortie d'OPTEST pour STRIKE.EXE. Au retour : compte rendu (§ 6) |
| 2 | 15 | **mission suivante** : mission courante `[+250]` = `[+251]` (posé par 13), `[+251]` = 255 |
| 3 | 17, menu | chargement du fichier choisi (nom en `partie+147`) |
| 4 | la boucle elle-même | **dans les scènes** |

Après le traitement de l'état : `[+232]` = 4, puis

1. lecture du script de la mission courante `[+250]` (`Gameflow_LoadMissionScript_4A440` : `MISS`
   / `INFO`, `EFCT`) et **exécution** (`Gameflow_RunScriptPairs_36CF`) — au début de chaque mission
   **et au retour de chaque vol** (sauf code de sortie 3, § 6) ; comme le départ a déjà fait passer
   à la mission désignée par 13, c'est le script de **cette** mission qui lit le résultat du vol :
   la mission elle-même quand son script fait 13 vers son propre numéro (MISS 2 : (13, 2)), sinon
   la suivante (MISS 0 : (13, 1), le vol de MISN-1a est lu par le script de MISS 1, (32, 0)). Après
   un chargement de partie (état 3) et un code de sortie 3, le script n'est pas joué ;
2. si `[+232]` vaut alors 4 ou 2 : sauvegarde automatique `gensave.tmp` ;
3. tant que `[+232]` = 4 : une scène (`Gameflow_PlayScene_3B0B`) ;
4. si `[+232]` = 1 : départ en vol (ci-dessus).

**Une scène** (`Gameflow_PlayScene_3B0B`) : si `[+227]` est posé (commande 1), la scène
`[+252]` est reconstruite (`Gameflow_BuildScene_4A60B`, visibilité des sprites par `REQU`) ; la
scène est affichée avec la musique `[+233]`, le joueur clique un sprite, et le script `EFCT` de ce
sprite est exécuté.

## 4. Visibilité des sprites (`REQU`, `Gameflow_CheckSpriteRequirements_3604`)

Relu le 2026-10-22, dans la version disquette et dans la version CD (code identique, 23627 dans
l'OPTTEST.EXE du CD).

### 4.1 Quand et avec quel effet

- `REQU` est évalué **à la construction de la scène** (`Gameflow_BuildScene_4A60B`, seul appel),
  c'est-à-dire quand la commande 1 a posé `[+227]` (et au début de chaque mission).
- Un sprite dont les conditions échouent **n'est pas ajouté à la scène** (`sub_34F6` n'est pas
  appelé) : ni dessiné, ni cliquable. Un sprite sans `REQU` est toujours ajouté.
- Les drapeaux sont les octets `[partie+253 + n]`, posés par 6, effacés par 7. Un drapeau
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
// requ : paires (condition, numéro de drapeau) ; flags : drapeaux de la partie (6 / 7).
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
   ouvert, le 9 est ignoré). Ce sprite porte le départ en vol de la mission 23 ((12, 20),
   conversation 127, armement (22, 12)).
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
les commandes 13 puis 15 du script (§ 5.2) ; aucun lien entre `REQU` et ce passage n'a été vu
dans le code lu.

## 5. Interpréteur des scripts (`Gameflow_RunScriptPairs_36CF`)

### 5.1 Blocs conditionnels

- Un **test** qui échoue pose l'état « saut » : les commandes suivantes sont sautées jusqu'à
  **30** (« sinon » : l'état bascule) ou **31** (fin de bloc : l'état saut est effacé).
- Un test qui réussit ne fait rien : il n'ouvre pas de niveau.
- Pendant un saut, chaque test rencontré (9, 10, 20, 21, 22, 28, 32, 35, 37) ajoute un
  niveau, et 30 / 31 de ce niveau ne font que le refermer ; seuls 30 / 31 au niveau 0 agissent.
- Un test sans 31 saute **jusqu'à la fin du script** (cas de 22 dans les données).
- **33 n** (absent des données) : pendant les n commandes suivantes, chaque commande doit être un
  test (sinon erreur fatale « Faulty OR structure in gameflow file ») et elle est évaluée même si un
  test précédent a échoué. Le nom vient du message ; l'effet exact n'est pas celui d'un « ou »
  (un test qui échoue pose toujours l'état saut), à ne pas porter sans données qui l'utilisent.
- **29** peut arrêter le script (fin de partie).

### 5.2 Les commandes

« Données » = nombre d'occurrences dans `GAMEFLOW.IFF` (MISS = script de mission, SPRT = script de
sprite). « libRealSpace » = nom dans le dump `gameflow_parsed.txt` (vide = non nommée).

| Cmd | libRealSpace | Données | Effet dans le jeu |
|---|---|---|---|
| 0 | PLAY CONV | 285 | conversation n (`Gameflow_PlayConversation_4AAAB`) |
| 1 | PLAY SCENE | 391 | scène courante `[+252]` = n, `[+227]` = 1 : la scène n est (re)construite après le script |
| 2 | PLAY MIDGAME | 12 | cinématique n (`Gameflow_PlayMidgame_4ABE0`) |
| 3 | FLY MISSION AND GOTO NEXT MISSION | 3 | mission à voler `[+249]` = n et **départ en vol** (`[+232]` = 1), sans écran d'armement |
| 4 | — | 43 (SPRT) | **rien** (dans les deux versions) |
| 5 | — | 0 | `[+249]` = n (comme 12) |
| 6 | SET TRUE | 204 | drapeau n posé |
| 7 | SET FALSE | 93 | drapeau n effacé |
| 8 | PLAY SHOT | 118 | plan fixe n d'`OPTIONS.IFF` (`ESTB` / `SHOT`, `Gameflow_PlayShot_4AD86`) |
| 9 | IF NOT | 17 | test : réussit si le drapeau n n'est pas posé |
| 10 | IF | 47 | test : réussit si le drapeau n est posé |
| 11 | — | 0 | rien |
| 12 | PLAY FLY MISSION | 48 (SPRT) | mission à voler `[+249]` = n (le vol part de l'écran d'armement, 22) |
| 13 | SET NEXT MISSION | 93 | mission suivante `[+251]` = n |
| 14 | — | 0 | départ en vol (`[+232]` = 1) |
| 15 | GOTO NEXT MISSION | 29 | passage à la mission suivante (`[+232]` = 2) |
| 16 | SAVE GAME | 54 | choix d'un fichier (`Gameflow_SaveRequester_4D984`) ; s'il est donné, sauvegarde dans ce fichier puis dans `gensave.tmp` |
| 17 | LOAD GAME | 54 | choix d'un fichier (`Gameflow_LoadRequester_4DDDC`) ; s'il est donné, `[+232]` = 3 |
| 18 | PLAY SHOW MAP | 12 | carte n (`WRLD` / `MAPS`, `Gameflow_ShowMap_542AC`) |
| 19 | LOOK AT KILLBOARD | 54 | tableau des victoires (`Gameflow_KillBoard_51049`) |
| 20 | IF MISSION ACCEPTED | 20 | test : réussit si la mission a été acceptée dans la dernière conversation (`[+859]` ≠ 0) |
| 21 | IF MISSION REFUSED | 6 | test : réussit si elle a été refusée |
| 22 | — | 42 (SPRT) | **écran d'armement** (§ 5.3) ; test : réussit si le joueur part en vol |
| 23 | VIEW CATALOG | 43 | catalogue d'achat d'armes (`Gameflow_Catalog_52662`) |
| 24 | — | 11 (MISS) | **humeur musicale** du déroulement `[+233]` = n (`Music_SetGameflowMood_28C73`) ; données : 0, 6, 8 |
| 25 | LOOK AT LEDGER | 54 | livre de comptes (`Gameflow_Ledger_53686`) |
| 26 | — | 27 (MISS) | si le joueur a eu des victoires pendant le vol (`[+237]`, § 6) et n'est pas mort (`[+248]` ≠ 2) : **marques de victoires peintes sur l'avion** (`OPTIONS.IFF` `MARK`, `Gameflow_ShowKillMarks_506AA`) |
| 27 | — | 2 (MISS) | **retire le pilote n** du tableau des victoires (`[+675 + n × 26]` = 0 ; n < 8) ; données : 6, 7 |
| 28 | — | 0 | test qui réussit toujours (compté comme test pendant un saut, sans effet) |
| 29 | — | 12 (MISS) | **fin de partie** (`Gameflow_CheckLossConversations_50645`) : plus de 16 avions perdus au total → conversation 254 ; sinon argent < 0 → conversation 255 ; dans les deux cas retour au menu (`[+232]` = 0) et arrêt du script |
| 30 | ELSE | 117 | sinon (§ 5.1) |
| 31 | ENDIF | 159 | fin de bloc (§ 5.1) |
| 32 | OTHER IF | 62 | test : réussit si la mission n de `MLST` a été volée **avec succès** (`[+509 + n]` = 1, § 6) |
| 33 | — | 0 | groupe de tests (§ 5.1) |
| 34 | APPLY CHANGES | 94 | applique le changement `CHNG` n (§ 5.4, `Gameflow_ApplyChange_50160`) |
| 35 | — | 0 | test : réussit si des avions ont été perdus pendant le dernier vol (`[+234]` ≠ 0) |
| 36 | — | 27 (MISS) | si des avions ont été perdus pendant le dernier vol : humeur musicale 8, puis conversation **253** si le joueur est mort (`[+248]` = 2), **252** sinon |
| 37 | — | 7 (MISS) | test : réussit si la 3ᵉ valeur de `STAT` du compte rendu (`[+982]`, § 6) ≠ 0 |
| 38 | — | 18 (MISS) | **joue le morceau n** de `SOUND\gameflow.dat` (`Music_PlayGameflowTune_28CFC`), gardé en `[+983]` (sauvegardé) ; données : 1 à 5 |

Valeurs au-delà de 38 : rien (disquette). Version CD : 39 à 42, § 8.

### 5.3 Écran d'armement (22, `Gameflow_WeaponLoadout_51AB3`)

- Chargement par défaut : le chunk `LOAD` dont le 1er octet vaut l'argument
  (`Gameflow_ApplyDefaultLoadout_51830`). Chaque paire (arme, nombre) : nombre borné par le stock,
  rendu pair, posé par paires (un par aile) sur les points d'emport, avec un maximum par côté selon
  l'arme : armes 0 et 1 → 1 ; 8 → 2 ; 7 → 2 ; 4 et 5 → 6 ; 6 → emport central ; autres → 3.
- Le joueur ajoute ou retire des armes (« Add %s (%d) », « Remove %s (%d) »).
- **Sprite 12 cliqué → départ en vol** : `[+232]` = 1, `[+238]` = 1, le test réussit et la
  suite du script est jouée. Autre sortie → le test échoue, la suite du script est sautée.
- Dans les données, 22 suit toujours une commande 12, par exemple : (12, 0) (mission 0), (0, 11)
  (conversation 11), (22, 1) (armement, chargement 1).

### 5.4 Changements `CHNG` (34)

| Chunk | Champ modifié | Remarque |
|---|---|---|
| `CASH` | argent `[+635]` (dword) | valeur du fichier telle quelle ; pas de borne |
| `OVER` | frais généraux `[+639]` (dword) | pas de borne |
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
| `STAT` | 8 mots écrits par STRIKE.EXE (`Mission_WriteResultReport_A8F22`) : les 8 **variables de résultat du script de la mission** (opcode 20 d'`Expr_VM_Interpreter_51106` dans STRIKE.EXE, remises à 0 au début de la mission). OPTEST disquette en lit 3 : 1ʳᵉ = **succès** ; 2ᵉ = gain, ajouté à l'argent `[+635]` ; 3ᵉ → `[+982]` (test 37). La version CD en lit 6 (§ 8). Leur sens dépend donc de chaque mission |
| `KILL` | par pilote (nom) : deux compteurs ajoutés à `[+671]` et `[+673]` ; `[+237]` = 1 si le joueur en a (commande 26) |
| `DIED` | noms de personnages : ceux de la table dseg 3800 (DiBianca, Templeman, Isaac, Roberts, Baldwin, Yenawine, Savage) ont leur drapeau dseg 3814 remis à 0 (codes `$A`, `$B` des conversations) |
| `SCOR` | ajouté au score `[+984]` |

Puis : la mission est cherchée par son nom dans `GAMEFLOW.IFF` / `MLST` / `DATA` ; son drapeau
`[+509 + index]` = **1 si succès, 2 sinon** (test 32) ; l'argent est diminué du coût des avions
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

Les 8 valeurs sont écrites par le script `PROG` de chaque fichier de mission (opcode 20 ; bytecode :
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

**Ce que GAMEFLOW.IFF en fait** (test 37 ; le script d'une mission est joué à l'entrée, donc avec le
compte rendu du vol précédent, puis après chacun de ses vols) :

| Script | Vol lu | Effet |
|---|---|---|
| MISS 12 (MISN-4c) | son propre vol (Learjet) | si drapeau 42 : changement 22 ; puis drapeau **71** = 3ᵉ valeur ≠ 0. Sprite 5 de la scène 29 visible si 42 et 71 |
| MISS 18 (MISN-6b / 6x) | MISN-6a (AWACS) | drapeau **214** ; sprite 12 de la scène 20 : 214 → vole **MISN-6b**, sinon **MISN-6x** ; sprite 2 de la scène 29 de MISS 19 selon 214 |
| MISS 26 (MISN-8b / 8x) | MISN-8a (AWACS) | drapeau **211** → **MISN-8b**, sinon **MISN-8x** ; sprite 5 de la scène 29 de MISS 27 selon 211 |
| MISS 30 (MISN-9a) | MISN-9aa (BRIGC10), puis son propre vol | mission suivante = 31 (MISN-9b) ; si la 3ᵉ valeur ≠ 0 : drapeau **215** et **passage immédiat à la mission suivante** (15), MISN-9a n'est pas jouée |
| MISS 33 (MISN-10b / 10x) | MISN-10a | drapeau **213** → **MISN-10b**, sinon **MISN-10x** ; sprite 19 de la scène 29 de MISS 34 selon 213 |
| MISS 41 (MISN-12b) | son propre vol (RWYEXT18) | si drapeau 50 et 3ᵉ valeur ≠ 0 : changements 27 (argent remplacé par 0) et 7 (argent − 2000), puis 29 : argent < 0 → conversation 255, **fin de partie** |
| MISS 48 | MISN-15a | si MISN-15a (mission 41 de `MLST`) a réussi : cinématiques 20 et 36 ; sinon plans 15 et 3, puis : 3ᵉ valeur ≠ 0 → changements 27 et 7 et 29 ; sinon conversation 236, changements 27 et 7 et 29 |

## 7. libRealSpace (`SCGameFlow.cpp`) : écarts et corrections proposées

Relu le 2026-10-22 : `SCGameFlow.cpp` (921 lignes, fourni le même jour), comparé aux § 3 à 6 et
rejoué sur les scripts de `GAMEFLOW.IFF`, avec les valeurs de `GameFlowOpCode` de `SCenums.h`
(fourni le 2026-10-23). `GameState` et les scènes (`WeaponLoadoutScene`, `EndMissionScene`,
`SCStrike`) n'ont pas été fournis : ce qu'ils font n'est pas compté ici.

Tous les nombres de ce chapitre sont en décimal, comme dans `SCenums.h` et le dump
`gameflow_parsed.txt`.

### 7.1 Les constantes `GameFlowOpCode` face aux commandes du jeu

| Valeur | Constante de libRealSpace | Commande du jeu (§ 5.2) | Accord |
|---|---|---|---|
| 0 | `EFECT_OPT_CONV` | conversation n | oui |
| 1 | `EFECT_OPT_SCEN` | scène n | oui |
| 2 | `EFECT_OPT_PLAY_MIDGAME` | cinématique n | oui |
| 3 | `EFECT_OPT_FLYM2` | vol **sans** écran d'armement | non (point 2) |
| 4 | `EFECT_OPT_U2` | rien | oui (pas de cas, rien à faire) |
| 6 / 7 | `EFECT_OPT_SETFLAG_TRUE` / `_FALSE` | drapeau posé / effacé | oui |
| 8 | `EFECT_OPT_SHOT` | plan fixe n | oui |
| 9 / 10 | `EFECT_OPT_IF_NOT_FLAG` / `_IF_FLAG` | tests sur un drapeau | oui |
| 11 | `EFFCT_OPT_U18` | rien | oui (absent des données) |
| 12 | `EFECT_OPT_FLYM` | choisit la mission à voler | en partie (point 2) |
| 13 | `EFECT_OPT_MIS2` | mission suivante = n | oui |
| 14 | `EFFCT_OPT_U20` | départ en vol | sans cas (absent des données) |
| 15 | `EFECT_OPT_GO` | passage à la mission suivante | oui |
| 16 / 17 | `EFECT_OPT_SAVE_GAME` / `_LOAD_GAME` | sauvegarde / chargement | oui |
| 18 | `EFFCT_OPT_SHOW_MAP` | carte n | oui |
| 19 | `EFECT_OPT_LOOK_AT_KILLBOARD` | tableau des victoires | oui |
| 20 / 21 | `EFECT_OPT_MISS_ACCEPTED` / `_REJECTED` | tests sur la réponse à la conversation | oui |
| 22 | `EFECT_OPT_END_MISS` | **écran d'armement, et test** | non (point 2) |
| 23 | `EFECT_OPT_VIEW_CATALOG` | catalogue | oui |
| 24 | `EFECT_OPT_U8` | **humeur musicale** n | sans cas (point 7) |
| 25 | `EFECT_OPT_LOOK_AT_LEDGER` | livre de comptes | oui |
| 26 | `EFECT_OPT_U10` | marques de victoires sur l'avion | sans cas (point 7) |
| 27 | `EFECT_OPT_U11` et `EFECT_OPT_U16` | retire le pilote n du tableau | sans cas (point 7) ; deux constantes pour la même valeur |
| 28 | — | test qui réussit toujours | absent des données |
| 29 | `EFECT_OPT_CHECK_BALANCE` | fin de partie | en partie (point 5) |
| 30 / 31 | `EFECT_OPT_MISS_ELSE` / `_ENDIF` | sinon / fin de bloc | oui |
| 32 | `EFFCT_OPT_IF_MISS_SUCCESS` | test : mission n réussie | oui |
| 33 | — | groupe de tests | absent des données |
| 34 | `EFECT_OPT_APPLY_CHANGE` | changement `CHNG` n | non (point 4) |
| 35 | `EFFCT_OPT_U17` | test : avions perdus au dernier vol | sans cas (absent des données) |
| 36 | `EFECT_OPT_U14` | avions perdus : humeur 8 et conversation 252 / 253 | sans cas (point 6) |
| 37 | `EFECT_IF_LAST_MISS_SUCCESS` | **test sur la 3ᵉ valeur de `STAT`** | non (point 1) |
| 38 | `EFECT_OPT_TUNE_MODIFIER` | joue le morceau n de `gameflow.dat` | en partie (point 7) |
| 40 | `EFFCT_OPT_U19` | CD seulement : test sur la 5ᵉ valeur de `STAT` (§ 8) | absent des données |

### 7.2 Ce qui est conforme au jeu

- **Mission après un vol.** `flyMission` pose `next_miss = GameState.mission_id` (valeur du dernier
  13) et `runFrame` passe à cette mission, dont le script est joué. Le jeu fait la même chose au
  départ en vol (`Gameflow_SaveTmpState_4BBA0` : mission courante = mission suivante, § 3). Quand la
  mission courante se désigne elle-même ((13, 2) dans MISS 2, 11 missions sur 41 avec un vol), c'est
  son propre script qui est rejoué après le vol.
- **Chargement d'une partie** : le jeu ne rejoue pas le script de la mission (état 3, § 3) ;
  `loadGame` non plus (`runEffectAfterLoad` ne reprend que 38, gardé dans la sauvegarde du jeu
  aussi).
- **Blocs conditionnels** : même résultat que le jeu pour les blocs bien formés, tant que chaque
  test ouvre un niveau. Les tests 28, 33 et 35 n'ont pas de cas, mais ils ne sont pas dans les données. Profondeur maximale dans les données :
  3 (`MAX_IF_DEPTH` = 10 suffit).
- **20 / 21** : la conversation en attente est jouée avant le test, comme dans le jeu. La reprise
  (`currentOptCode`) repart avec des blocs vides ; sans effet sur les données (les 26 tests 20 / 21
  sont tous hors bloc).
- **1** construit la scène tout de suite au lieu de la fin du script : sans effet sur les données
  (1 est toujours la dernière commande de son script).
- 6, 7, 9, 10, 13, 15, 16, 17, 18, 19, 23, 25, 32 : même effet.

### 7.3 Écarts, du plus visible au moins visible

**1. Test 37 : la 3ᵉ valeur de `STAT`, pas le succès.** Dans le jeu, 37 réussit si la 3ᵉ valeur
du compte rendu est ≠ 0 ; c'est une variable propre à chaque mission (§ 6.1 : AWACS abattu dans
MISN-6a et 8a, BRIGC10 détruit dans 9aa…).
- `EFECT_IF_LAST_MISS_SUCCESS` teste le **succès** de la mission. MISN-6a réussie sans abattre
  l'AWACS → libRealSpace joue MISN-6b, le jeu MISN-6x. Même chose pour 8b / 8x et 10b / 10x.
  MISN-9a est sautée à chaque succès de MISN-9aa, et pas seulement quand le BRIGC10 est détruit.
- **Correction** : garder les 8 valeurs de `STAT` du dernier vol dans `GameState` (écrites par le
  script de la mission, opcode 20 de STRIKE.EXE, `MISSION_SCRIPT_OPCODES.md`) et faire de 37 un
  test sur la 3ᵉ. Ce test est à corriger **en même temps** que 34 (point 4) : avec un test sur le
  succès, MISN-12b réussit toujours (sa 1ʳᵉ valeur vaut toujours 1) et MISS 41 mettrait fin à la
  partie après chaque vol de MISN-12b dès que le drapeau 50 est posé.

**2. Écran d'armement 22 : c'est un test.** Dans le jeu, 12 ne fait que choisir la mission ; 22
ouvre l'écran d'armement avec le chargement `LOAD` n, et **la suite du script n'est jouée que si
le joueur part en vol** (§ 5.3). libRealSpace ouvre l'écran d'armement à la fin du script, après
toute commande 12, sans `LOAD` n, et joue la suite du script avant, même si le joueur annule.
- 13 des 42 scripts de sprite qui contiennent 22 ont des commandes après lui. Exemple, MISS 2, scène 20 : le sprite 12
  ((12, 2) (0, 23) (22, 5) (6, 40)) pose le drapeau 40 ; si le joueur annule, 40 est quand même posé et
  le sprite 18 (« mission suivante », `REQU` (1, 40), (13, 3) (15, 0)) apparaît sans que la mission ait
  été volée. MISS 26 : changements 23 et 29 appliqués même sans vol.
- `flyOrReturnFromScene` part en vol pour tout sprite ≠ 20 ; dans le jeu, seul le sprite 12 fait
  partir.
- 3 part en vol **sans** écran d'armement dans le jeu ; `EFECT_OPT_FLYM2` passe par le même
  chemin que 12 (3 occurrences).
- **Correction** : traiter 22 comme 20 : suspendre le script (`currentOptCode`), ouvrir
  `WeaponLoadoutScene` avec `LOAD` n ; au départ (sprite 12), reprendre le script après 22 puis
  partir en vol ; à l'annulation, test échoué : saut jusqu'au 30 / 31, ou jusqu'à la fin du script
  s'il n'y en a pas (cas de toutes les données).
- `EFECT_OPT_END_MISS` (22) appelle `playEndMission`, qui pose `next_miss` d'après le `REQU` du
  sprite cliqué (sprite sans `REQU`, ou avec une condition 1). Rien de tel dans le jeu (§ 4.5). Sur
  les données, c'est sans effet : 22 suit toujours un 12 dans le même script, et la fin de
  `runEffect` remet `next_miss` à 0 avant d'ouvrir l'écran d'armement.

**3. Ordre des conversations, plans et cinématiques.** Le jeu joue chaque commande à son tour.
`runFrame` vide d'abord la file des plans (8, 18), puis celle des cinématiques (2), puis celle
des conversations (0). 5 scripts sont joués dans un autre ordre, par exemple :
- MISS 45, script ((0, 221) (2, 16) (24, 0) (0, 222)) : la cinématique 16 passe avant la conversation 221 ;
- MISS 21, scène 6, sprite 0 ((2, 5) (8, 2) (8, 5)) : les plans 2 et 5 passent avant la cinématique 5 ;
- MISS 41, scène 13, sprite 16 ((0, 208) … (0, 210) (2, 12)) et MISS 8, scène 20, sprite 18
  ((8, 15) (8, 3) (2, 3) … (0, 54) (2, 34)).

Dans MISS 45, la commande 24 placée entre les deux conversations n'a pas de cas dans libRealSpace
(point 7).
**Correction** : une seule file d'activités dans l'ordre du script.

**4. Changements `CHNG` (34).** Le jeu applique la valeur du fichier telle quelle, directement sur
l'argent, et borne à 0 les retraits d'armes et de victoires (§ 5.4). libRealSpace multiplie `CASH`
et `OVER` par 1000, les applique à `proj_cash`, et ne recopie `proj_cash` dans `cash` que si `cash`
vaut 0. Les retraits `WEAP` et `PILT` ne sont pas bornés.
- Conséquence : la fin de partie de MISS 41 et MISS 48 (changement 27 = argent remplacé par 0,
  changement 7 = argent − 2000, puis 29) n'a jamais lieu dans libRealSpace, `cash` n'étant pas
  touché.
- Dans le jeu, la même unité sert au gain de mission (2ᵉ valeur de `STAT`), au coût des avions
  perdus (500 par avion, § 6) et aux changements. Si libRealSpace garde un facteur 1000, il est à
  appliquer aux trois.
- **Correction** : `tools/gameflow_ref/apply_change.cpp` (compilé, style du dépôt) : `applyChange`
  et `checkGameOver` d'après le jeu, avec l'essai de MISS 41 (argent −2000 → conversation 255).

**5. Fin de partie 29.** Le jeu teste d'abord **plus de 16 avions perdus au total**
(conversation 254), puis l'argent < 0 (255) ; dans les deux cas, le script s'arrête et le jeu
revient au menu. libRealSpace ne teste que l'argent ; `GAMOVER_NO_INSURANCE` (254) est défini mais n'est pas utilisé
dans `SCGameFlow.cpp`. 12 occurrences. Correction : `checkGameOver` du même fichier.

**6. Avions perdus : 36 (27 scripts de mission).** Dans le jeu, si des avions ont été perdus
pendant le dernier vol : humeur musicale 8, puis conversation 253 si le joueur est mort
(`[+248]` = 2), 252 sinon. libRealSpace joue 252 depuis `runFrame`, seulement quand le joueur
s'est éjecté (`player_ejected`), et `LOST_WINGMAN_PLANE` (253) n'est pas utilisé dans `SCGameFlow.cpp`. Les noms des
constantes ne correspondent pas au jeu : 252 = des avions perdus, joueur vivant ; 253 = joueur
mort. Correction : faire de 36 une commande (nombre d'avions perdus au dernier vol, lu dans
`JETS` de `misn2op.iff`), et retirer le cas `player_ejected` de `runFrame` pour ne pas jouer la
conversation deux fois.

**7. Musique et victoires : 24, 26, 27, 38.**

| Cmd | Données | Effet dans le jeu | libRealSpace |
|---|---|---|---|
| 24 | 11 | humeur musicale du déroulement = n (`Music_SetGameflowMood_28C73`) ; valeurs 0, 6 et 8 | `EFECT_OPT_U8`, pas de cas |
| 26 | 27 | marques de victoires peintes sur l'avion (`OPTIONS.IFF` `MARK`), si le joueur a eu des victoires et n'est pas mort | `EFECT_OPT_U10`, pas de cas |
| 27 | 2 | retire le pilote n du tableau des victoires | `EFECT_OPT_U11` / `U16`, pas de cas |
| 38 | 18 | joue tout de suite le morceau n (1 à 5) de `gameflow.dat` (`Music_PlayGameflowTune_28CFC`) et le garde dans la partie (sauvegardé) ; première commande de 14 des 18 scripts qui l'ont ((38, 1) dans MISS 0) | `GameState.tune_modifier = n` : ne joue rien, choisit la série de morceaux joués au clic d'un sprite (`clicked`) |

Pour 38, le jeu joue le morceau au moment de la commande ; la façon dont il choisit ensuite la
musique d'une scène à partir de l'humeur (24) n'a pas été lue ici. À comparer avec
`MUSIC_SYSTEM.md` avant de toucher au modèle `tune_modifier` de libRealSpace.

**8. Argent au départ en vol.** `Gameflow_SaveTmpState_4BBA0` retire de l'argent les frais généraux
(`[+639]`, chunk `OVER`) et les achats faits au catalogue depuis le dernier vol (`[+643]`, remis à
0), avant d'écrire `tmpsav.tmp`. Au retour, le coût des avions perdus est retiré (§ 6). Rien de cela
n'est dans `SCGameFlow.cpp` : à vérifier là où libRealSpace gère l'argent.

### 7.4 Ordre de correction suggéré

1. 22 comme test (point 2) : c'est l'écart qui permet de sauter une mission.
2. 37 avec la 3ᵉ valeur de `STAT` **et** 34 / 29 d'après le jeu (points 1, 4, 5), ensemble.
3. Une seule file d'activités (point 3).
4. 36, 24, 26, 27, argent au départ (points 6 à 8).

## 8. Version CD-ROM (OPTTEST.EXE du CD)

Interpréteur en 23808 environ (table cs:1559, `cmp bx, 42`) : **43 commandes** (0 à 42).
0 à 36 font la même chose que sur disquette (relu cas par cas ; 4 et 11 ne font rien).
La structure de partie a 4 octets de plus à partir de `+982` :

| Cmd | CD-ROM |
|---|---|
| 37 | test : `[+983]` ≠ 0 (3ᵉ valeur de `STAT`) |
| 38 | morceau n de `gameflow.dat`, gardé en `[+987]` |
| 39 | test : `[+984]` ≠ 0 (4ᵉ valeur de `STAT`) |
| 40 | test : `[+985]` ≠ 0 (5ᵉ valeur de `STAT`) |
| 41 | test : `[+986]` ≠ 0 (6ᵉ valeur de `STAT`) |
| 42 | test : `[+982]` ≠ 0 (rangé par le chargement d'une partie ; rôle non établi) |

La version CD lit **six** des huit valeurs de `STAT` (STRIKE.EXE en écrit toujours huit) : succès,
gain, puis quatre valeurs gardées sur un octet en `[+983]` à `[+986]`. Les commandes 39 à 42 n'apparaissent pas dans `GAMEFLOW.IFF` de
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
