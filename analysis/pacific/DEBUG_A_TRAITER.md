# Pacific Strike : points à traiter pour le débogage de libRealSpace

Relevés le 2026-11-13 en suivant la première mission, `PRLH-M1` (« Scramble ») ; description complète de la mission dans
`PACIFIC_MISSION_PRLH-M1.html`. Code lu : libRealSpace, branche `master` du 2026-11-11. Repère de libRealSpace
(Y = altitude, nord vers −Z), en mètres.

Chaque point donne : ce qui se passe dans libRealSpace, ce que fait le jeu (avec la fonction de l'exécutable quand elle
a été lue), l'effet sur `PRLH-M1`, et ce qu'il faut regarder au débogueur. Rien n'a encore été modifié dans le code.

## Sommaire

| N° | Point | Effet sur PRLH-M1 | Gravité |
|---|---|---|---|
| 1 | Avions placés dans une zone, simulés avant leur activation | VAL n°2 détruit au chargement, variable 1 faussée | haute |
| 2 | `OP_IS_SCENE_ACTIVE` absent de `PSProg` | torpilleurs n°30 et 31 jamais créés : mission impossible à gagner dans le cas courant | haute |
| 3 | Messages radio jamais affichés en Pacific Strike | aucun message radio (tour, Nevada, ailiers) | haute |
| 4 | Plancher de la zone 0 au-dessus de la piste | la scène 1 peut ne s'activer qu'au décollage | à vérifier |
| 5 | `activateTarget` place l'objet sur le premier `SPOT` de la zone | torpilleurs n°29 à 32 décalés | moyenne |
| 6 | Ordre des scripts de sortie en fin de mission | aucun dans PRLH-M1 | basse |
| 7 | Fin de mission | à lire dans PACIFIC.EXE | ouvert |
| 8 | Numéros des objets du terrain | aucun dans PRLH-M1 | basse |
| 9 | Profil ou fichier objet introuvable | silence ou plantage | à vérifier |

---

## 1. Avions placés dans une zone, simulés avant leur activation

**Constat (VAL n°2 détruit dès le chargement).**

1. `PSMission::createAiPlane` crée le `PSPlane` au chargement, à `part->position`. Pour un objet placé dans une zone,
   c'est encore le **décalage** : le centre de la zone n'est ajouté qu'à l'activation (`SCMissionScene::activate`,
   `SCMissionActors::activateTarget`). Décalage du VAL n°2 : (120, 150, −595).
2. Ce point est près du centre de la carte, au milieu d'Oahu : le sol y est à 733 m. `createAiPlane` pose l'avion
   « au sol » sans vitesse :
   ```cpp
   if (part->position.y < this->area->getY(part->position.x, part->position.z)) {
       actor->plane->on_ground = true;
   }
   ```
3. `SCMissionActors::onMissionUpdate` simule aussi les acteurs inactifs (test en commentaire) :
   ```cpp
   /*if (this->is_active == false) {
       return;
   }*/
   ```
4. `SCJetpPlane::checkStatus` : au sol, hors d'une piste → `crached = true`, `object->alive = 0`.
5. Image suivante : `is_destroyed = true`, événement de destruction, `SCMissionActors::onActorDestroyed` lance le
   programme 7 (script de destruction du VAL) :
   ```
   OP_ADD_1_TO_FLAG 1
   ```
6. À l'activation de la scène 1, l'avion est soit déplacé déjà crashé, soit recréé par `respawnActor` →
   `createAiPlane`, de nouveau au décalage sous le sol.

Altitudes (sol tiré des altitudes `ELV` de `TERRAIN\OAHU.ZIP`) :

| N° | Décalage (x, y, z) | Sol sous le décalage | Position réelle (x, y, z) | Sol sous la position réelle |
|---|---|---|---|---|
| 1 | (−900, 3550, −3350) | 638 | (−15150, 3672, 33350) | 238 |
| 2 | (120, 150, −595) | 733 | (−14130, 272, 36105) | 120 |
| 3 | (−10000, 3550, 0) | 735 | (−24250, 3672, 36700) | 43 |
| 4 | (−10500, 3000, −200) | 749 | (−24750, 3122, 36500) | 59 |
| 5 | (500, 3550, −1500) | 719 | (−13750, 3672, 35200) | 120 |
| 6 | (300, 2000, −1500) | 718 | (−13950, 2122, 35200) | 120 |

**Effets.**
- La variable 1 (bombardiers en piqué abattus) vaut 1 sans aucun tir : la condition de réussite « au moins un VAL
  abattu » est remplie d'office, et le premier VAL réellement abattu déclenche la vague de torpilleurs (programme 7 :
  variable 1 = 2 → variable 3 = 67), un VAL trop tôt.
- Les autres avions placés dans une zone (VAL n°1, 5 et 6, torpilleurs n°29 à 35) ne s'écrasent pas mais volent près
  du centre de la carte avant leur activation. Comme `onMissionUpdate` réécrit `object->position` avec la position
  simulée à chaque image, l'ajout `object->position += centre de la zone` de l'activation porte sur une position qui
  a déjà bougé. Les VAL n°5 et 6, activés au retour du joueur, sont les plus exposés.

**Dans le jeu.** L'objet du monde n'est créé qu'à l'activation, à sa position finale : dans STRIKE.EXE,
`PartEntry_ResolveSpawnPositionAndActivate_51EDC` appelle `AIAircraft_SpawnAndConditionalLoadProfile_53363`
seulement si le contrôleur de l'objet est encore nul, avec la position décalage + centre de la zone
(`AreaRelPos_ToWorld_50EEB`). Dans PACIFIC.EXE, l'équivalent `PartEntry_ResolveSpawnPositionAndActivate_5313D` crée
lui aussi l'objet du monde à cette étape (relu seulement pour le test du drapeau 260).

**Au débogueur.**
- `PSMission: objet 2 VAL (JAP-V), zone 0, placement 0, position (120.0, 150.0, -595.0)` au chargement ;
- `Actor's plane is destroyed` dans les premières images ;
- la variable 1 dans `GameState` juste après le chargement : elle doit valoir 0.

---

## 2. `OP_IS_SCENE_ACTIVE` absent de `PSProg`

**Constat.** L'instruction 130 n'a pas de méthode dans `PSProg` : `SCProg::execute` l'ignore sans message. Le bit de
comparaison garde sa valeur de départ (`PROG_CMP_UNSET`, posée par le constructeur de `SCProg`), donc
`OP_BRANCH_IF_NOT_EQUAL 90` saute toujours. Programme 9 (destruction d'un torpilleur) :
```
OP_SET_LABEL 2
OP_IS_SCENE_ACTIVE 1
OP_BRANCH_IF_NOT_EQUAL 90
OP_ACTIVATE_OBJ 30
OP_EXIT_PROG 0
OP_SET_LABEL 3
OP_IS_SCENE_ACTIVE 1
OP_BRANCH_IF_NOT_EQUAL 90
OP_ACTIVATE_OBJ 31
```

**Dans le jeu.** `Expr_VM_Interpreter_51F24`, instruction 130 : efface le bit « égal », cherche la scène de la zone
donnée (`PtrList_GetAt_54919`, `Scene_FindByArea_54B92`) et pose « égal » si l'octet 0 de la scène est non nul. Cet
octet est mis à 1 par `OP_ACTIVATE_SCENE` (instruction 128). Dans PRLH-M1, toutes les scènes l'ont à 1 dans le
fichier : le test réussit.
```
loc_5275F:
    mov     ax, [di+1Ah]
    and     ax, 2
    sub     [di+1Ah], ax
    ...
    call    near ptr Scene_FindByArea_54B92
    mov     si, ax
    cmp     byte ptr [si], 0
    jnz     short loc_5279B          ; → loc_52B14 : or word ptr [di+1Ah], 2
```

**Effet.** Le joueur va au Nevada dès le décollage : torpilleurs n°27 et 28 (programme 14), puis n°29 au premier
abattu, puis plus rien. La variable 0 reste à 3 ; il en faut 6 : le drapeau 401 (mission réussie) n'est jamais posé.

**Au débogueur.** Variable 0 au moment où le 2ᵉ torpilleur est abattu ; le n°30 doit apparaître.

---

## 3. Messages radio jamais affichés en Pacific Strike

**Constat.** `SCMissionActors::setMessage` ajoute le message à `mission->radio_messages`. Seul
`SCCockpit::RenderCommMessages` l'affiche, joue la voix et le retire de la liste ; il est appelé par
`SCCockpit::Render` et par `SCVirtualCockpit::renderComm` (lui-même appelé par `SCJetVirtualCockpit`).
`PSCockpit::Render` remplace `SCCockpit::Render` sans appeler `RenderCommMessages`, et `PSVirtualCockpit` ne l'appelle
pas : en Pacific Strike, les messages s'accumulent dans la liste sans texte ni voix.

**Effet.** Aucun message radio : tour d'Ewa (« It's war!  The Japs are attacking! » au bout de 5 secondes), Nevada,
ailiers.

**À prévoir.** `RenderCommMessages` dessine son fond avec `this->cockpit->PLAQ.shapes.GetShape(2)` ; en Pacific,
`cockpit` est un `PSCockpitDef` : vérifier ce que le fichier de cockpit fournit avant de brancher l'appel.

---

## 4. Plancher de la zone 0 au-dessus de la piste

**Constat.** `AREA::contains` teste d'abord l'altitude :
```cpp
if (point.y < this->position.y || point.y > this->position.y + this->height) {
    return false;
}
```
Plancher de la zone 0 : Y = 122 m. Joueur placé à 123 m ; la région `.TRI` de la piste est à 121 m. Si l'avion du
joueur repose sur la piste, il est sous le plancher, hors de toute scène : la scène 1 (et donc la tour n°10, les
bâtiments, les VAL n°1 et 2) ne s'active qu'au décollage.

**Dans le jeu.** Même test de plage d'altitude dans STRIKE.EXE (`IMPL_MISSION_AREAS.md`). Non relu dans PACIFIC.EXE,
ni l'altitude exacte de l'avion au sol dans le jeu.

**Au débogueur.** Y du joueur au sol, comparé à 122 ; journal `MISSION: scene courante, zone -1 -> 0`.

---

## 5. `activateTarget` place l'objet sur le premier `SPOT` de la zone

**Constat.** `SCMissionActors::activateTarget` ajoute au décalage la position du **premier `SPOT` de la zone** de
l'objet, et le centre de la zone seulement si la zone n'a pas de `SPOT`. `SCMissionScene::activate` ajoute, lui, le
centre de la zone.

**Dans le jeu.** Dans STRIKE.EXE, décalage + centre de la zone (`AreaRelPos_ToWorld_50EEB` sur `part+0x1D`).

**Effet.** Les torpilleurs n°29 à 32 (zone 1) sont activés par `OP_ACTIVATE_OBJ` ; le premier `SPOT` de la zone 1 est
le 4, à (7500, 2000, 35900), pour un centre en (5900, 0, 35900) : chacun apparaît 1600 m plus à l'est et 2000 m plus
haut.

| N° | Position du jeu (x, y, z) | Position de libRealSpace (x, y, z) |
|---|---|---|
| 29 | (12900, 2000, 35400) | (14500, 4000, 35400) |
| 30 | (12900, 1000, 35100) | (14500, 3000, 35100) |
| 31 | (12900, 1000, 34800) | (14500, 3000, 34800) |
| 32 | (12900, 1000, 35400) | (14500, 3000, 35400) |

Le point 1 s'y ajoute : l'objet a déjà volé avant l'activation.

---

## 6. Ordre des scripts de sortie en fin de mission

**Constat.** `SCMission::finishScenes` lance la scène globale, puis la scène courante.

**Dans le jeu.** Une fonction pas encore nommée de PACIFIC.EXE (`sub_BE97E`, ovr344, nom proposé
`MissionScenario_RunEndScripts_BE97E`) lance la scène courante, puis la scène globale :
```
push    word ptr [si+61h]
call    Scene_RunLeavingScript_54AF6
...
push    word ptr [si+5Fh]
call    Scene_RunLeavingScript_54AF6
```

**Effet.** Aucun dans PRLH-M1 (les scènes 1 à 3 n'ont pas de script de sortie) ; peut compter dans une mission où le
script de sortie de la scène courante écrit une variable que lit celui de la scène globale.

---

## 7. Fin de mission

**Constat.** libRealSpace termine la mission à l'atterrissage (`setExitCode(1)` dans `SCMission::update`) ou par la
touche de fin de mission (`SCStrike` : 2 si l'avion est écrasé, 1 sinon). `OP_SET_MESSAGE` 20, 21 et 22 ne terminent
la mission que pour un acteur `STRIBASE` (`SCMissionActorsStrikeBase::setMessage`) ; PRLH-M1 n'en a pas.

**Dans le jeu.** `OP_SET_EXIT_CODE` écrit l'octet `byte_79B9B`, lu par une grande fonction pas encore nommée
(`sub_8AA2E`, ovr245). Ce qui termine une mission de Pacific Strike (destruction du joueur, éjection, atterrissage
ailleurs qu'à la base) reste à lire.

---

## 8. Numéros des objets du terrain

**Constat.** `PSMission::loadMission` donne aux objets du terrain `actor_id` = nombre d'acteurs déjà créés : 47, 48…
dans PRLH-M1. Le numéro 47 est aussi celui de l'objet `PART` blue10 (rang 46). Une instruction qui vise l'objet n°47
peut trouver l'objet du terrain. Aucune dans PRLH-M1.

---

## 9. Profil ou fichier objet introuvable

**Constat.**
- `SCMissionActors::onMissionUpdate` sort avant le script de mise à jour si `profile == nullptr`
  (`SCMission::LoadProfile` rend `nullptr` et écrit `Unable to load profile <nom>`). Exemple : la tour n°10 a le
  profil `INTEL\XMIT-EWA.IFF`, présent dans PACIFIC.DAT.
- `SCMissionScene::activate` lit `actor->object->entity->entity_type` sans tester `entity` : un objet dont le fichier
  n'est pas trouvé (journal `PSMission: objet <n> <nom> sans fichier objet`) fait planter l'activation de sa scène.

**Au débogueur.** Rechercher ces deux messages dans le journal du chargement.

---

## Vérifié, pas d'écart

- `OP_EXEC_SUB_PROG 255` ne fait rien, dans libRealSpace (`SCProg::opExecSubProg`, numéro ≥ nombre de programmes)
  comme dans le jeu (`Expr_LookupNamedValue_530A7` : `cmp [si], dx` / `jbe` → pointeur nul).
- `OP_TEST_FLAG` pose « égal » si la variable est non nulle, dans `PSProg::opTestFlag` comme dans le jeu
  (`Expr_VM_Interpreter_51F24`, instruction 69 : `cmp word ptr [bp+var_8], 0` / `jz`).
- Choix de la scène courante : première scène active dont la zone contient le joueur, dans
  `SCMission::findSceneAt` comme dans `Scene_FindMatchingByAreaContainment_54B1B`.
- `OP_SET_WAIT_FOR_SECONDS` dans un script d'acteur : minuteur de l'acteur, réglé au premier passage puis décompté à
  chaque image (`SCProg::opSetWaitForSeconds`).
