# Strike Commander — Musique, effets sonores et voix (AIL 2.0 / XMIDI)

Document de référence du son de `STRIKE.EXE`. Réécrit le 2026-10-06 en un seul texte cohérent, à
partir du travail de la session musique (archive handoff) et des relectures faites ensuite. Chaque
affirmation renvoie à une fonction relue ; ce qui n'a pas été relu est signalé.

Sources jointes : `analysis/ail_sources/` (`AIL.ASM`, `AIL.INC`, `XMIDI.ASM`, Miles Design 1991-1992),
`analysis/adlib_driver_source/` (`ADLIB.ADV` + désassemblage, voir `ADLIB_DRIVER.md`),
`analysis/sample_dat_files/` (`COMBAT.DAT` réel + décodage JSON).

---

## 1. Architecture en quatre couches

| Couche | Où | Rôle |
|---|---|---|
| **Pilote** | `ADLIB.ADV` (`.ROL` pour Roland) | Contient l'**interpréteur XMIDI** (shell `XMIDI.ASM` d'AIL) et la partie voix OPL2. Joue lui-même les séquences à 120 Hz. |
| **Bibliothèque AIL** | seg161 = `AIL.ASM` compilé | Minuteries, enregistrement du pilote, et un thunk par fonction pilote (`AIL_register_sequence_60396`, `AIL_start_sequence_603CC`…). |
| **Couche son du jeu** | seg123-124 | Canaux musicaux, chargement des séquences et des timbres (`Music_Channel*`, `Music_InstallTimbre_5A62A`). |
| **Logique du jeu** | seg121, seg122, seg125, seg458 | Choix des pistes, séquenceur à transitions, effets sonores 3D, voix. |

**Preuve que seg161 est `AIL.ASM`** : ses procédures sont dans l'ordre exact du source (`find_proc`,
`call_driver`, `API_timer`, `init_DDA_arrays`… `AIL_register_timer`, `AIL_set_timer_frequency` — qui
appelle `ul_divide(0xF4240, Hz)` comme le source —, `AIL_register_driver`, `AIL_init_driver`…), puis
chaque thunk fait `mov ax, N / jmp call_driver` avec `N` = numéro de fonction de `AIL.INC`, dans le
même ordre (`0x78, 0x79, 0x86, 0x7A, 0x7B, 0x85, 0x7C…0x84, 0x96…0x9F, 0xAA…0xC2`).

**Preuve que l'interpréteur XMIDI est dans le pilote** : `ADLIB.ADV` contient la recherche de séquence
de `XMIDI.ASM` (`cmp word ptr [si], 4F46h` = « FO », `cmp word ptr [si+8], 4D58h` = « XM »,
adlib.asm l. 8564) et l'en-tête `EVNT`. Le jeu ne lit jamais les notes : il donne au pilote un
pointeur sur la séquence XMI, la démarre, l'arrête, règle son volume et lit son numéro de mesure.

**Trois objets son**, chacun actif selon un drapeau :

| Objet | Drapeau | Rôle |
|---|---|---|
| `word_7099D` | `byte_7236B` | musique |
| `word_7099B` | `byte_7236C` | effets sonores (séquences XMIDI, §7) |
| `word_7099F` | `byte_7236D` | voix (sons numérisés VOC, §7) |

---

## 2. Fichiers de données

### 2.1 Noms et répertoires

`AudioQueue_ProcessMain_AA84E(musique, nom, numéro)` construit les chemins avec
`Path_ResolveDataFile("SOUND", nom, extension)` : **`SOUND` est un répertoire**, pas un chunk IFF.
- `SOUND\<nom>.dat` : toujours ouvert ;
- `SOUND\<nom>.adl` si `byte_70996 == 2` (AdLib), `SOUND\<nom>.rol` si `byte_70996 == 1` (Roland).

Le nom est passé par l'initialisation (offset `12C1h` du segment de données, très probablement la
chaîne `'combat'` de seg339 ; Rémi a trouvé `combat.dat` et `combat.adl` dans `data/sound/`). Le
`.dat` est lui-même une **archive indexée** : le paramètre `numéro` choisit l'enregistrement
(`0xFFFF` → enregistrement 0, sinon `numéro − 1`) ; `word_70865` mémorise le jeu chargé pour ne pas le
recharger.

### 2.2 Format d'archive indexée (générique au moteur)

`.dat` et `.adl`/`.rol` utilisent l'archive indexée du moteur (`IndexedRecordReader_*`, seg196, aussi
utilisée par les missions et le terrain — `DATA_MODEL.md` §5.4) : une table d'entrées de 32 bits =
**offset sur 24 bits + drapeaux sur 8 bits** (`IndexedRecordReader_ReadEntry_65DA9` sépare `eax >> 18h`
et `eax & 0FFFFFFh`) ; l'entrée `i` et l'entrée `i+1` délimitent l'enregistrement `i`. Quand les deux
bits `0xC0` des drapeaux sont posés, la taille est prise dans un autre champ
(`and ax, 0C0h / cmp ax, 0C0h` dans `AudioQueue_ProcessMain_AA84E`).

### 2.3 `combat.dat` (1701 octets, décodé et vérifié jusqu'au dernier octet)

```
[0:4)      1701                 premier dword de l'archive (fin des données)
[4:8)      08 00 00 E0          entrée d'index : enregistrement 0 à l'offset 8, drapeaux 0xE0
--- enregistrement 0 (un jeu de musique) ---
[8]        22                   nombre de pistes principales (word_7084C)
[9:53)     22 × (A, B)          par piste : A = longueur de phrase en mesures, B = position à
                                utiliser sur la dernière mesure (§4.3)
[53:537)   22 × 22 octets       matrice de transitions [piste courante][piste demandée] :
                                numéro d'entrée de liaison, 0xFF = aucune (dword_70861)
[537]      61                   nombre d'entrées de liaison (word_70850)
[538:1700) 61 × [L][L+1 octets] entrées de liaison (dword_7085D), indexées par la position dans
                                la phrase (§4.3)
[1700]     00
```

**Les entrées de liaison sont des numéros de pistes de liaison, pas des enveloppes.** Leur longueur
vaut exactement « longueur de phrase + 1 » de la piste de départ (piste 0 : phrase de 19 mesures,
entrées de 20 octets ; piste 2 : 39 et 40). L'octet `[0]` n'est jamais lu (la position vaut au moins
1). Chaque valeur : `0` = bascule directe, `1..N` = piste de liaison, **bit `0x80`** = garder la piste
principale pendant la liaison (ex. `0x82`, `0x98`), valeur supérieure au nombre de liaisons
(ex. `0xFF`) = changement refusé (§4.3).

### 2.4 `combat.adl` : trois niveaux d'archive

```
combat.adl (niveau 1)
├── entrée 0 → niveau 2
│   └── entrée 0 → niveau 3 : les word_7084E pistes de LIAISON (table word_70856, 10 o/descripteur)
├── entrée 1 → piste principale 0   ┐
├── …                               ├─ table word_70854, 12 o/descripteur
└── entrée N → piste principale N−1 ┘
```

- `AudioQueue_LoadTrackTable_AACA6` : lit le nombre de pistes et les deux octets `(A, B)` de chaque
  piste dans le `.dat`, charge chaque piste principale.
- `AudioQueue_LoadTransitionTable_AAFA0` : ouvre le niveau 3, `word_7084E` = son nombre d'entrées
  (borne testée par `Music_TuneTransitionResolve_595C2`), charge chaque piste de liaison.

```c
struct TrackDescriptor {      // word_70854[i], 12 octets — pistes principales
    void far* data;           // +0x0 données XMIDI chargées
    uint8_t   type;           // +0x4 3 = mémoire paginée (projetée avant usage)
    uint8_t   loaded;         // +0x5 1
    uint32_t  size;           // +0x6
    uint8_t   phrase_len;     // +0xA A de combat.dat
    uint8_t   phrase_last;    // +0xB B de combat.dat
};
struct TransitionDescriptor { // word_70856[i], 10 octets — pistes de liaison (sans A/B)
    void far* data; uint8_t type; uint8_t loaded; uint32_t size;
};
```

Les deux tables passent par une fonction d'allocation encore nommée `CRT_Doprnt_Dispatch` (nom
faux : ce n'est pas un `printf`, à renommer après lecture).

---

## 3. Initialisation et pilote

**Chargement du pilote** — `Sound_LoadDriverAndTimbreCache_5A0F3` (appelée par
`Program_InitVideoFontArgs`, au démarrage) : charge le fichier pilote depuis `SOUND` (nom + `.drv`),
`AIL_register_driver_6015A`, `AIL_describe_driver_60228`, `AIL_detect_device_6024E` (carte absente →
sortie), puis `AIL_default_timbre_cache_size_603A2` et `AIL_define_timbre_cache_603A8` (« No memory for
timbre cache. »). Elle charge et joue ensuite une séquence depuis `SOUND` en attendant sa fin
(`AIL_start_sequence_603CC`, `AIL_sequence_status_603DE`) — partie non relue en détail.

**Canaux musicaux** : deux structures fixes, `5BE3h` (piste **principale**) et `5BF5h` (piste de
**liaison**) : pilote, handle de séquence (−1 = aucun), table d'état XMIDI.
- `Music_ChannelInit_59F87` : alloue la table d'état (`AIL_state_table_size_60390`, « No mem for XMIDI
  state table. »).
- `Music_ChannelRegisterSequence_59FF5` : `AIL_register_sequence_60396`, puis demande chaque timbre
  manquant (`AIL_timbre_request_603AE`) et l'installe (`Music_InstallTimbre_5A62A` →
  `Music_LoadTimbreFromLibrary_5A577`, bibliothèque au format Global Timbre Library : entrées de
  6 octets `patch, banque, offset`, fin sur banque `0xFF`).
- `Music_ChannelStopSequence_59F1D` : arrêt (`AIL_stop_sequence_603D2`) et libération.
- `Music_InstallXMITimbres_UNRESOLVED` (bloc sans adresse résolue) : précharge les timbres d'un
  fichier XMI (`XDIR` / `INFO` / `CAT XMID` / `TIMB`).

**Musique** — dans `TextRenderer_Main` (seg048, si `byte_7236B`) : remise à zéro, les deux canaux
initialisés, le tick du séquenceur enregistré comme minuterie AIL (`AudioQueue_RegisterTickModule_AA810`
→ `Music_SequencerTickISR_5940B`), puis `AudioQueue_ProcessMain_AA84E(musique, nom, 0xFFFF)`.

---

## 4. Le séquenceur musical : changements calés sur les mesures

### 4.1 Le principe

Le jeu ne coupe jamais la musique n'importe où : il **demande** une piste (`word_70859`), et le tick
du séquenceur l'enchaîne **à la barre de mesure suivante**, directement ou par une **piste de liaison**
jouée sur le second canal, choisie selon la **position dans la phrase**.

`Music_RequestTune_5A984(piste)` est le seul point d'entrée : si `piste < word_7084C`,
`word_70859 = piste` ; sinon, hors valeur `0xFF`, erreur « Invalid tune requested: %d ».

### 4.2 Les quatre états du tick (`Music_SequencerTickDispatch_59436`, état `byte_70858`)

Le tick (minuterie AIL) ne fait rien si `word_70859 == 0xFFFF` (musique arrêtée). Il encadre ses
accès aux données par une sauvegarde / restauration du contexte EMS (`int 67h`, fonctions 47h/48h).

| État | Action |
|---|---|
| **0** démarrage | joue la piste demandée sur le canal principal, passe à 1 |
| **1** lecture | si une autre piste est demandée : note la mesure courante (`AIL_measure_count_60402`), passe à 2. Sinon, si la piste est terminée : redemande la piste mémorisée `word_7085B` |
| **2** attente de barre | si la demande a été annulée (piste demandée = piste courante) : retour à 1. Sinon attend que le **numéro de mesure change** (ou que la piste se termine), puis `Music_TuneTransitionResolve_595C2` |
| **3** liaison en cours | attend la fin de la piste de liaison, puis `Music_TuneTransitionCommit_5974D` |

### 4.3 Résolution — `Music_TuneTransitionResolve_595C2`

1. **Ponctuation demandée (`0x10` à `0x12`)** : mémorise la piste à reprendre ensuite dans `word_7085B` :
   `4` si la piste courante est `5` ; si elle est `8` : `4` s'il reste un avion ennemi proche, sinon
   `0x13` ; `0x13` si elle est `0x15` ; sinon la piste courante.
2. **Position dans la phrase** : `pos = (mesure mod A) + 1`, ou `B` si le reste est nul
   (`idiv bx / mov word_72C91, dx / inc`, sinon `[si+0Bh]`), avec `(A, B)` de la piste courante.
3. **Liaison** : `e = matrice[piste courante][piste demandée]` ; `e == 0xFF` → `v = 0` ; sinon
   `v = entrée_de_liaison[e][pos]`.
4. **Décision** :

| `v` | Effet |
|---|---|
| `0` | bascule directe : arrêt du canal principal, piste demandée démarrée dessus, état 1 |
| `1..word_7084E` (bit `0x80` retiré) | sans le bit `0x80` : le canal principal est arrêté tout de suite ; avec : il continue. La piste de liaison `v` démarre sur le second canal, état 3 |
| au-delà | changement refusé : erreur `byte_7084A = 2`, la demande est annulée (`word_70859 = piste courante`), état 1 |

### 4.4 Fin de liaison — `Music_TuneTransitionCommit_5974D`

Arrête le canal de liaison (et le principal s'il jouait encore), démarre la piste demandée sur le
canal principal. **Si c'est une ponctuation (`0x10` à `0x12`)**, la piste mémorisée `word_7085B` est
aussitôt redemandée : la ponctuation joue jusqu'à la barre suivante (ou sa fin), puis la musique
repart vers la piste mémorisée. Un seul niveau de mémoire : une seconde ponctuation écrase la première.

### 4.5 Arrêt, pause, reprise

`Music_Stop_5A9E6` → `Music_StopWithFade_AB1EF(fondu)` : demande `0xFFFF`, arrête la liaison ; si
fondu, `AIL_set_relative_volume_603F0(0, 1000 ms)` puis attente du volume nul ; arrête la piste
principale. `Music_StopAndResetCombat_AA831` fait de même et oublie l'état de combat (`byte_70869`,
`byte_7086A`). `Music_Pause_5A9BA` / `Music_Resume_5A9D0` → `AIL_stop_sequence_603D2` /
`AIL_resume_sequence_603D8` sur les deux canaux.

---

## 5. Quelle piste est demandée, et quand

### 5.1 Pendant le vol : `Music_CombatIntensitySelector_59302`

Appelé **une frame sur 16** par `Sound_FrameUpdate_5AB79` (`test word_70466, 0Fh`). Ne fait rien si le
joueur s'éjecte (`byte_6E4B8`) ou a été abattu (`byte_6E4B4`), si `byte_72A8E == 0x0B`, si la piste
courante est `0x14` (musique d'atterrissage, §5.4), ou si un changement est déjà en attente.

1. `Music_ScanNearbyEnemies_590E0` : objets du **camp adverse** (`+0x50 == 0xFF`) à moins de **18 520**
   du joueur — bit 0 = avion (catégorie 6, pilote non éjecté), bit 1 = défense fixe, objet au sol ou
   `XMIT` (catégories 0x13, 0x14, 0x15). Résultat gardé dans `byte_7086A`.
2. Aucun → **repli** (§5.2, mode 0).
3. Sinon `byte_70869 = 1` (« un combat a eu lieu ») et la **première règle vraie** choisit :

| Piste | Condition |
|---|---|
| **9** | un missile vise le joueur (`Music_IsMissileTargetingPlayer_58ED5`), ou un avion IA l'attaque de près (`word_722EE`, posé par `AI_SelectWeaponMask_9665` ; même signal que la réplique 0x10 « You've got one on your tail ») |
| **5** | un avion ennemi est dans ses six heures : à moins de 3 500 (× `dword_7044C`, facteur non identifié), son nez à moins de 45° du joueur, et derrière lui (`Music_AnyEnemyOnPlayerSix_59061`) |
| **7** | dégâts du joueur ≥ 75 % (`SommeB × 100 / SommeA` sur `word_722E6+0x5E`, même formule que `AI_EjectDecision_50FF`) |
| **6** | dégâts du joueur ≥ 35 % |
| **4** | un avion ennemi est proche |
| **0x13** | seules des défenses fixes / objets au sol ennemis sont proches |

### 5.2 Repli et fin de combat : `Music_SelectTuneCandidate_5923A`

- **Mode 1**, à la destruction d'un objet ennemi (`Music_OnObjectDestroyed_5AA49`) : nouveau scan sans
  l'objet détruit ; s'il y avait un avion ennemi proche et qu'il n'y en a plus → **0x13** ; s'il n'y a
  plus aucun ennemi alors qu'il y en avait → étape suivante.
- **Mode 0**, aucun ennemi (depuis §5.1) → étape suivante.
- **Étape** : exécute l'expression de la mission (`[word_706A0+0x4E]`) ; si `[word_706A0+0xA1]` et le
  motif `+0x68` sont vérifiés → **0x0C** ; sinon, si un combat a eu lieu → **0x0D**, une seule fois.

### 5.3 À la destruction d'un objet : `World_OnObjectDestroyed_53A94`

Gestionnaire appelé par les générateurs de débris (`Debris_SpawnOrchestrator`,
`Debris_SpawnOrchestratorVariant_9D770`), par l'éjection (`AI_EjectDecision_50FF`) et par
`Player_EjectSequence_7D31A`. La musique n'est concernée que pour les catégories 1
(`ORNT`, décor orienté : immeubles…), 6 (avion), 0x13 (défense fixe), 0x14 (objet au sol) et 0x15
(`XMIT`) (table `word_53D7E`), et rien ne se passe si le joueur est mort, si l'objet
détruit est le joueur, ou si c'est un avion dont le pilote s'est éjecté.
- **Objet ennemi** (camp `0xFF`) : `Music_OnObjectDestroyed_5AA49` (§5.2) ; s'il ne change rien et
  que **le joueur** est l'auteur → **ponctuation** `0x10` (avion), `0x11` (défense fixe ou objet au
  sol), `0x12` (autre : décor `ORNT` ou `XMIT`).
- **Objet allié** (camp `1`) : **0x0E** s'il s'agit de l'objet désigné par la mission (stub
  `VROOMM_StubThunk_6CE2E(word_706A0)`, non lu), sinon **0x0F**.

### 5.4 Autres demandes

| Piste | Où | Quand |
|---|---|---|
| `TUNE` de la mission (`byte_706A2`) | `STRIKE_EXE_MAIN_LOOP` | au démarrage de la mission (fait vérifié par Rémi en jeu) |
| 4 / 0x13 / `TUNE` | `Music_SelectStartTune_5AA02` (depuis `Cockpit_LoadAndDrawCalibration_8FDC0`) | si §5.1 ne choisit rien : ennemis proches → 4 si un combat a déjà eu lieu, sinon 0x13 ; aucun ennemi → `TUNE` |
| 0x0B | `Player_ShotDownSequence_7B035` | **avion du joueur détruit** : `STRIKE_EXE_MAIN_LOOP` lance la séquence quand `byte_6E4B4 != 0`, drapeau posé par `Debris_SpawnOrchestratorVariant_9D770` quand l'objet détruit est le joueur (`cmp word_722E6,di` / `mov byte_6E4B4,1`). La séquence charge `OBJECTS\EJECT.PAK` puis demande 0x0B (`push 0Bh`), sans condition |
| 0x0A | `Player_EjectSequence_7D31A` | **éjection volontaire du joueur** : `STRIKE_EXE_MAIN_LOOP` lance la séquence quand `byte_6E4B8 != 0`, drapeau posé par `Player_MainUpdate` sur Ctrl+E (touche de code 0x12 avec Ctrl, tables d'état clavier indice 0x1D) ou quand `byte_6E33B != 0`. Charge aussi `EJECT.PAK`, puis demande 0x0A (`push 0Ah`), sans condition |
| 0x14 | `Landing_TaxiPhase_765B2` | **atterrissage terminé** : fin de la phase sol de la séquence d'atterrissage (caméra « LANDING », `Landing_SequenceTick_75C18`), quand l'avion est le joueur (`mov byte ptr es:[bx+94h],1`, puis `cmp ax,word_722E6`) |
| 0x14 | `Collision_OnTerrainContact_9D910` | **le joueur touche le sol sans casse** (objet heurté = « TERRAIN », contact accepté), après plus de 100 images de mission (`cmp word_70466,64h / jbe` : `word_70466` est le compteur d'images, incrémenté dans `CombatTarget_WeaponActionSubsystem`), ce qui écarte le contact au départ sur la piste |
| 0x08 | `WeaponCam_LaunchPhase_80971` | **caméra arme sur un missile du joueur** : fin de la phase de lancement (`mov byte ptr [si+0A3h],1 / push 8`) |
| 0x15 | `WeaponCam_LaunchPhase_80971` | **caméra arme sur une bombe du joueur** (catégorie 9), **seulement si la piste courante est 0x13** (`cmp word_70859,13h / jz` → `push 15h`) ; sinon pas de changement |

Pour 0x14, les deux sites exécutent d'abord le gestionnaire du script de mission (`word_706A0+0x4E`,
entrée `+0x40`, via `Expr_VM_ExecuteSingleInstruction_51E7E`) ; la piste n'est demandée que si le script
n'a pas pris la main (`[word_706A0+0xA1] == 0`). Une mission peut donc remplacer la musique
d'atterrissage.

**Caméra arme.** Elle est lancée par `Mission_PlayerEventHandler`, appelé à chaque lancement d'arme
(3 appels dans `HUD_RenderSymbologyMain` juste après le bruit de tir `SoundFX_Play_5A8DC` et la
décrémentation du compteur de munitions, et 1 dans `TimedTrigger_SpawnAndBindGeometry_9E289`). Elle ne
démarre que si le tireur est le joueur, que l'arme est de catégorie 8 (missile) ou 9 (bombe), **et
que l'option « caméra automatique » est active** : c'est le champ `+0x11` testé par
`Mission_PlayerEventHandler` (fait donné par Rémi) ; les valeurs 0x0B et 7 bloquent la caméra
(`cmp byte ptr [si+11h],0Bh` / `cmp byte ptr [si+11h],7` → sortie). **Option désactivée = ni caméra
arme, ni pistes 0x08 / 0x15.** Elle
passe par `WeaponCam_Start_8285A` (arme suivie, lanceur, catégorie), puis `WeaponCam_Tick_82693` à chaque
image, dont la phase 0 est `WeaponCam_LaunchPhase_80971`.

### 5.5 Récapitulatif par numéro

| Piste | Signification établie par le code |
|---|---|
| 4 | combat aérien (avion ennemi proche) |
| 5 | ennemi dans les six heures du joueur |
| 6 / 7 | combat, joueur endommagé à 35 % / 75 % |
| 9 | missile sur le joueur, ou avion qui l'attaque |
| 0x0A | éjection volontaire du joueur (Ctrl+E) |
| 0x0B | avion du joueur détruit |
| 0x0C | fin de combat, condition de mission remplie |
| 0x0D | fin de combat (une fois) |
| 0x0E / 0x0F | objet allié détruit (désigné par la mission / autre) |
| 0x10 / 0x11 / 0x12 | ponctuation de victoire du joueur : avion / défense fixe ou objet au sol / décor (`ORNT`) ou `XMIT` |
| 0x13 | menaces au sol seules, ou dernier avion ennemi abattu |
| 0x14 | atterrissage du joueur (fin du roulage, ou contact au sol accepté), sauf si le script de mission prend la main |
| 0x15 | caméra arme sur une bombe du joueur, seulement pendant la piste 0x13 |
| 0x08 | caméra arme sur un missile du joueur |

---

## 6. Ce qu'il faut pour le portage

**Implémentation de référence : `tools/sc_player/`** (C, sans dépendance pour le cœur). Elle porte
le séquenceur du jeu (§4), l'interpréteur XMIDI du pilote, la partie voix OPL du pilote
(`ADLIB_DRIVER.md` §11) et l'archive avec LZW. Le mode `--wav` écrit chaque transition (mesure,
position, entrée de liaison) pour comparer avec libRealSpace.

- **Lecteur XMIDI + émulateur OPL2.** Le jeu n'examine aucune note. Le lecteur doit fournir :
  - le **numéro de mesure courant**, tel que le compte le pilote : il **part de 0** au démarrage
    de la piste, il est avancé avant les évènements de chaque intervalle, et la signature rythmique
    ne le modifie pas (`ADLIB_DRIVER.md` §11) ;
  - le statut de fin de piste ;
  - le volume relatif.
- **Deux canaux** : principal et liaison.
  - Machine à quatre états (§4.2), changement à la barre suivante.
  - Liaison choisie par `combat.dat` selon la position dans la phrase (§4.3).
  - Mémoire d'une piste pour les ponctuations (§4.4).
- **Règle de choix** du §5.1 toutes les 16 frames ; destruction d'objets (§5.3).
- **Fondu d'arrêt** : volume à 0 en 1 000 ms.
- **Timbres** : bibliothèque `SOUND/STRIKE.AD`, installée piste par piste d'après le chunk `TIMB`
  (`Music_ChannelRegisterSequence_59FF5`).
- **Archive** : nombre d'enregistrements = offset de l'entrée 0 / 4 − 1. Un enregistrement dont les
  drapeaux ont `0xC0` à zéro commence par sa taille décompressée (u32), suivie d'un flux LZW
  (`LZW_Decompress_66068` : codes de 9 à 12 bits lus du poids faible au poids fort, 256 = remise à
  zéro, 257 = fin). Le lecteur de l'archive handoff lisait le mauvais champ pour le nombre
  d'enregistrements et ignorait le LZW.

---

## 7. Effets sonores et voix

### 7.1 Effets sonores : des séquences XMIDI positionnées

Objet `word_7099B`, actif si `byte_7236C` ; joués par le même pilote que la musique.
- **5 canaux** à `+0x92` (pas `0x11`) : structure de canal + numéro d'effet (`+0xE`, `0x0F` = libre)
  + émetteur (`+0xF`) — `SoundFX_FindFreeChannel_598A6`, `SoundFX_IsPlaying_59AD7`,
  `SoundFX_StopEffect_59A8A`.
- **Volume selon la distance** (`SoundFX_Play3D_59902`, `SoundFX_UpdateVolume3D_599D3`) :
  `100 − d/10` sous 1 000, `5` entre 1 000 et 5 000, rien au-delà.
- **Passage d'avion** (`SoundFX_CheckFlyBy_59B10`) : effet **0x0B** quand un avion passe à moins de
  200 du point de vue avec un angle de croisement supérieur à 30°.
- **Son moteur** (`SoundFX_Tick_59CFA`) : effet **0x0D** pour l'avion vu, volume selon la distance et
  **pitch-bend** selon le cran de manette : l'original envoie l'octet bas puis l'octet haut de
  `0x4000 + (cran − 5) × 0x600` (message `0xE1`), soit en MIDI standard **MSB = 0x40 + 6 × (cran − 5)**,
  LSB = 0 (centre au cran 5).
- Façades : `SoundFX_Play_5A8DC`, `SoundFX_PlayOrUpdate_5A906`, `SoundFX_Stop_5A95E`,
  `SoundFX_StopAll_5AA95`, `SoundFX_Disable_5AA73`.

### 7.2 Voix

Objet `word_7099F`, actif si `byte_7236D`, sons numérisés VOC via `AIL_play_VOC_file_6034E` :
`Speech_LoadBank_5AAB2` (au chargement du `RADI` du profil), `Speech_PlayClip_5AAD7`,
`Speech_QueryStatus_5AB2C` (file radio), `Speech_StopPlayback_AB883`.

### 7.3 Ensemble

`Sound_FrameUpdate_5AB79` : chaque frame, effets (`SoundFX_Tick_59CFA`), voix, et musique une frame
sur 16. `Sound_StopAll_5A88F` : arrête musique (avec fondu), effets et voix.

---

## 8. Questions ouvertes

- Événements du §5.4 tracés (le champ `+0x11` de `Mission_PlayerEventHandler` est l'option
  « caméra automatique », fait donné par Rémi) ; restent : `byte_6E33B`
  (deuxième source de l'éjection) ; le drapeau `[+0x51]+0x20` et `byte_6E4D0` qui font accepter le
  contact au sol dans `Collision_OnTerrainContact_9D910`.
- `byte_72A8E == 0x0B` (verrou du §5.1) et l'objet désigné par la mission (`VROOMM_StubThunk_6CE2E`,
  §5.3).
- Facteur `dword_7044C` du test « dans les six heures ».
- Séquence jouée à la fin de `Sound_LoadDriverAndTimbreCache_5A0F3`.
- Autres numéros d'effets sonores (seuls 0x0B et 0x0D sont identifiés).
- Lecteur `tools/sc_player` : à valider sur les vrais `COMBAT.ADL` et `STRIKE.AD` (testé ici sur
  des données synthétiques uniquement).
- Renommer `CRT_Doprnt_Dispatch` après lecture.
- Côté pilote : voir `ADLIB_DRIVER.md` §10.

---

## 9. Historique des corrections (2026-10-06)

Points de la session musique corrigés à l'intégration, pour qui relirait un ancien texte :
- seg161 n'est pas un « registre de modules » générique mais `AIL.ASM` ; les `Sequencer_*` sont la
  couche musique (`Music_Channel*`).
- L'interpréteur XMIDI est dans le pilote ; l'hypothèse « parseur XMIDI absent du pilote » était fausse.
- Le « déclencheur missile » de la piste 0x13 (`AI_MissileThreatTrigger_A`) est la décision d'éjection
  `AI_EjectDecision_50FF` ; la musique réagit à la destruction d'objets (§5.3).
- Les pistes 0x10-0x12 sont des ponctuations de victoire, pas « l'ID d'un widget ».
- Le ratio d'intensité porte sur les dégâts du joueur (`word_722E6` = le joueur), pas sur une cible.
- `word_70466` est le **compteur d'images** de la mission (remis à 0 au chargement, `inc word_70466` dans
  `CombatTarget_WeaponActionSubsystem`), pas une « difficulté » comme le disent d'anciens résumés.
- Les fonctions qui demandent 0x0A, 0x0B, 0x14, 0x15 et 0x08 étaient mal nommées (`MissionRecord_*`,
  `AITargeting_*`, `Gauge_*`, `HUDSymbol_*`) : ce sont l'éjection, l'avion abattu, l'atterrissage, le
  contact au sol et la caméra arme (§5.4).
- Les `Weapon_HUDBox_*` étaient les tests de combat de la musique, les effets sonores et les façades.
- Les deux octets par piste de `combat.dat` sont la longueur de phrase et la position de dernière
  mesure ; les 61 entrées sont des numéros de liaison par position, pas des enveloppes ; l'en-tête
  `08 00 00 E0` est l'index de l'archive.
- `SOUND` est un répertoire, pas un chunk IFF ; `byte_72C90` est la piste courante, pas une
  « catégorie ».
- `Combat_TeamOpposedCheckAndDispatch_53A94` (ex-`UIScreen_BuildWidgetTree`) est le gestionnaire de
  destruction d'objet, renommé `World_OnObjectDestroyed_53A94`.
