# STRIKE.EXE Reverse-Engineering — Contexte pour reprise de session

## Contexte du projet

Rémi reverse-engineer *Strike Commander* (1993, Origin Systems) à partir d'un
désassemblage IDA (`strike.asm`, ~371K lignes, 3449 fonctions, 283 segments
CODE, `strike.map`). Objectif : documenter systématiquement toutes les
fonctions pour corriger/améliorer un port C++ existant, **libRealSpace**
(`RSProf.cpp`, `RSMission.cpp`, `SCMissionActors`), en croisant avec le code
réel du jeu. Rémi a une expertise poussée du jeu et de la toolchain Borland
C++.

## État au moment de cette archive

- **782 fonctions documentées sur 3449 (22.7%)**
- **Couverture continue et sans trou : seg000 → seg108** (segments vides
  comptabilisés comme couverts)
- Fichiers livrés dans cette archive : `README.md` (état des lieux détaillé,
  table complète par segment, liste des grosses fonctions non détaillées),
  `known_functions.json` (base complète : adresse → nom généré, segment,
  résumé), et les `.asm` annotés (noms résolus) pour tous les 97 segments
  non vides couverts à ce jour.

## Méthodologie stricte à respecter

- **Analyser un segment à la fois, dans l'ordre du fichier** (seg109, seg110,
  seg111...). Ne pas sauter de segments.
- **Un résumé d'une ligne par fonction** (mode rapide) ; pas d'interprétation
  approfondie sauf demande explicite.
- **Quand Rémi demande d'expliquer une fonction précise déjà identifiée, ce
  n'est plus le mode rapide** : il faut lire l'assembleur en détail, ligne
  par ligne, tracer les valeurs/constantes/branchements/appels, et ne pas se
  contenter d'une impression tirée des premières lignes ou du pattern
  général. L'identification en mode rapide est la première étape ; l'analyse
  approfondie à la demande est la deuxième étape, et elle doit être
  réellement approfondie, pas un résumé de surface reformulé.
- **Convention de nommage** : `Categorie_RoleCourt_ADRESSE` (ex.
  `AI_ThrottleController_6250`), le suffixe d'adresse est conservé pour la
  traçabilité.
- **`known_functions.json` et `README.md` sont régénérés intégralement à
  chaque mise à jour** (écrasés, pas versionnés).
- **Ne générer un état des lieux/récapitulatif que si Rémi le demande
  explicitement** — pas de rapport de statut spontané entre les segments.
- Les fichiers `.asm` annotés ne sont régénérés/livrés que sur demande
  explicite (ils sont coûteux) — sauf lors d'un point de sauvegarde complet
  comme celui-ci.
- Rémi peut demander plusieurs segments d'affilée en une seule instruction
  ("fait les segments 96 à 100") — dans ce cas, les traiter tous avant de
  s'arrêter, sans attendre une confirmation entre chaque segment.

## ⚠️ Règles absolues sur les axes et flags_75 (ERREURS DÉJÀ COMMISES — NE PAS RÉPÉTER)

- **Repère du jeu, donné par Rémi et à considérer comme acquis, ne jamais le
  revérifier ni le remettre en question** : X/Z sont les axes horizontaux,
  **Y est l'axe vertical** (Y = altitude, Y=0 = le sol, Y négatif = sous le
  sol = crash, car un avion ne vole pas sous le sol).
- **Ne jamais assumer roulis/tangage/lacet sur un axe donné sans preuve
  explicite dans le code** — une confusion roulis/tangage a déjà été commise
  par erreur dans une session précédente à cause d'une mauvaise supposition
  sur les axes. Rester prudent et dire "axe à confirmer" plutôt que d'inventer.
- **`flags_75` (offset +0x75 sur l'objet avion) — bits confirmés par Rémi** :
  - **bit0** = aérofrein (airbrake) sorti → contribue à une **traînée** (drag)
  - **bit2** = train d'atterrissage sorti → contribue à une **traînée** (drag)
  - **bit1** = volets (flaps) sortis → contribue au trim/coefficient de
    contrôle (axe précis non confirmé)
  - **CE NE SONT PAS des bits de boost moteur.** Une erreur d'interprétation
    en ce sens a été commise et corrigée dans le README/known_functions.json
    actuels (`Aero_ComputeDragFromFlags75_4805B`).
  - D'autres bits (5, 6) sont manipulés dans seg103 (`Aero_ComputeControl
    Flags75Bit5*`, `Aero_DetectControlSaturation`) mais leur rôle exact
    **reste hypothétique** — ne pas leur donner une interprétation ferme sans
    élément supplémentaire.

## Découvertes structurelles majeures à retenir

- **`SetReference` (`sub_3A44E`, seg081)** : mécanisme central de pointeurs
  faibles (weak references) du moteur, référencé des centaines de fois dans
  tout le code IA/GOAL. Un registre global (`WeakRef_*`) permet d'invalider
  automatiquement les pointeurs vers des objets détruits, coordonné avec le
  garbage collector des conteneurs (seg039, `WorldObjects_PurgeExpired`).
- **Chargeurs IFF** : `IFF_LoadModelMain` (`sub_3B876`, seg083, 1699L) est le
  point d'entrée principal du chargement de tout modèle 3D
  (`OBJECTS\*.IFF`) ; `JDYN_LoadChunk` (`sub_3A49C`, seg082, 577L) charge le
  chunk physique JDYN déjà documenté dans le projet ; `IFF_LoadInfoChunk`
  (seg104) charge les métadonnées (chunk INFO).
- **Pipeline de rendu 3D en deux moitiés** : `Render_ObjectPipelineMain`
  (`sub_2FEE2`, seg069, 2623L) pour les objets, et `sub_345D6` (seg074,
  2938L, la plus grosse fonction de toute la base) pour le terrain. Tous
  deux transforment/clippent puis soumettent au rasterizer (seg037, 4
  fonctions de 566-849L, dispatchées via `Render_DispatchFlatOrPerspective`
  du seg075).
- **Moteur physique JDYN** (seg101-103) : calcul complet des moments
  aérodynamiques avec coefficients non-linéaires et saturation (décrochage),
  orchestré par `Aero_ComputeForcesMain` (649L) et culminant dans
  `JDYN_PhysicsTickMain` (`sub_49C2E`, 1422L). `Pilot_SteeringCommandToTarget`
  (`sub_49242`, déjà en investigation avant cette session) est la fonction de
  commande de pilotage/guidage vers une cible.
- **Systèmes complets identifiés** : IA de vol/combat + GOAL (seg003-006),
  chatter radio (seg006/031/051), missile (seg008/097), damage/débris/effets
  (seg060/078-080/106-107), collision par grille spatiale (seg094), caméra
  externe/chasse (seg085/086/098-100), HUD/viseur/armement/contre-mesures
  (seg087-091), terrain streaming/LOD (seg071-073/077), roster de pilotes
  (seg093), journal de mission/kneeboard (seg040/041).

## Plus grosses fonctions non détaillées (priorité sessions dédiées)

| Fonction | Lignes | Segment |
|---|---|---|
| `sub_345D6` (pipeline rendu terrain) | 2938 | seg074 |
| `Render_ObjectPipelineMain_2FEE2` | 2623 | seg069 |
| `Player_MainUpdate_13100` | 2015 | seg011 |
| `HUD_RenderSymbologyAlt_3F8C0` | 2016 | seg088 |
| `HUD_RenderSymbologyMain_3E744` | 1882 | seg087 |
| `IFF_LoadModelMain_3B876` | 1699 | seg083 |
| `JDYN_PhysicsTickMain_49C2E` | 1422 | seg103 |
| `TextRenderer_Main_27477` | 1158 | seg048 |
| `Damage_SimulationTick_2BF6C` | 1019 | seg060 |
| 4 fonctions rasterizer seg037 | 566-849 | seg037 |

## Outillage disponible (à reconstruire dans la nouvelle session si besoin)

Les scripts/données de travail (`procs_full.pkl`, `segment_index.json`,
`known_functions_running.json`, `name_mapping.json`, `strike_utf8.asm`) sont
dans `/home/claude/work/` de la session précédente et **ne sont pas inclus
dans cette archive** (trop volumineux). Il faudra re-uploader `strike.asm`
et `strike.map`, ou repartir de `known_functions.json` (inclus ici) comme
base de connaissance cumulative et regénérer l'outillage Python pour
extraire les nouveaux segments (seg109+).

## ⚠️ Corrections critiques suite à lecture détaillée (cette session, après l'archive initiale)

Deux erreurs de nommage/caractérisation ont été commises dans les sessions précédentes en se fiant à une évaluation superficielle (nom hérité du binaire ou pattern de structure jamais vérifié) plutôt qu'à une lecture ligne à ligne. Elles ont été corrigées dans `known_functions.json`/`name_mapping.json` de travail, mais **le README.md et l'archive .asm de la précédente livraison contiennent encore les anciens noms erronés** :

- **`sub_3314`** : anciennement nommée `Flight_PhysicsTick_JDYN`. Lecture complète effectuée :
  ce n'est PAS un tick physique. C'est **`Targeting_AcquireBestThreat`** — un sélecteur de
  cible/menace générique qui itère sur tous les objets du monde (`World_IterateObjects`),
  calcule un score pondéré par les attributs de compétence pilote, la portée d'armement, la
  ligne de vue, et assigne le meilleur candidat via `SetReference` sur 3 champs (décoy/cible
  principale/menace). Utilisée par l'IA (`AI_BehaviorStateMachine`) et probablement le joueur.

- **`sub_49C2E`** : anciennement nommée `JDYN_PhysicsTickMain`. Lecture complète (100%,
  1422 lignes) effectuée : ce n'est PAS un intégrateur physique newtonien (pas de calcul
  force/masse/accélération). C'est **`Autopilot_FlyToPointKinematic_49C2E`** — un moteur de
  pilotage automatique/homing cinématique générique, prenant un objet cible en paramètre :
  calcule un point visé (direct ou anticipé), un écart de cap borné, **écrit directement**
  le nouveau cap et la nouvelle vitesse sur l'objet (pas de simulation de force), applique
  une contrainte de suivi de terrain, et **positionne un flag d'alerte sur l'objet cible**
  en fin de fonction si l'alignement est bon (signal de verrouillage — très évocateur d'un
  missile qui homing sur sa cible plutôt que du pilotage du joueur).

**Conséquence directe : la question "comment est calculée la physique de l'avion du joueur"
reste ouverte et non résolue avec certitude.** Les fonctions du seg102 (`Aero_ComputeForcesMain`,
calculs de moments/coefficients aérodynamiques) restent les meilleures candidates pour le
véritable modèle physique, mais elles n'ont été lues qu'en mode rapide (résumé de surface),
pas ligne à ligne — leur caractérisation doit être considérée comme non vérifiée au niveau
d'exigence appliqué à `sub_3314`/`sub_49C2E`. Le véritable point d'entrée du tick physique
de l'avion du joueur (position += vitesse × dt, avec force/masse) reste à identifier.

**Leçon à appliquer systématiquement** : ne jamais présenter une caractérisation de fonction
comme fiable sans l'avoir réellement lue en détail. Le mode rapide (résumé une ligne) sert
uniquement à l'inventaire — dès qu'une conclusion (nom de fonction, rôle exact, réponse à
une question précise de Rémi) s'appuie sur une fonction donnée, cette fonction doit être lue
intégralement avant d'affirmer quoi que ce soit sur son rôle.

## ⚠️ Règle sur les doublons apparents (overlay VROOMM ou autre)

**Ne jamais supprimer ni fusionner silencieusement une fonction jugée "doublon"
d'une autre.** Deux fonctions peuvent commencer de façon identique (même
prologue, mêmes premiers appels) et diverger ensuite — une comparaison
rapide du début du code ne suffit pas à conclure à l'identité. Chaque
fonction garde sa propre entrée dans `known_functions.json` avec sa propre
adresse, même si elle ressemble beaucoup à une autre repérée précédemment.
Si le mode rapide (inventaire) fait apparaître une ressemblance de surface,
la noter comme hypothèse ("probable duplicat de X, à vérifier") plutôt que
comme un fait ("duplicat identique à X") — et si Rémi demande une analyse
détaillée de l'une de ces fonctions, la comparer réellement instruction par
instruction avec celle dont elle est soupçonnée d'être la copie, sans
présumer le résultat.

**Cas concrets déjà marqués "duplicat" sur la seule base d'une lecture
rapide, à revérifier en détail avant de leur faire confiance** :
`sub_45C0D` (seg098) et `sub_46164` (seg100), actuellement décrites comme
identiques à `Camera_InitAttachedWithTarget` (`sub_3DC3D`, seg085) — cette
conclusion a été tirée avec la même méthode superficielle qui a produit les
erreurs corrigées sur `sub_3314`/`sub_49C2E` ci-dessus, donc elle n'a pas
plus de fiabilité tant qu'elle n'a pas été vérifiée ligne à ligne.

## Point en suspens signalé par Rémi : le pilotage au clavier

Rémi a signalé que l'avion du joueur peut aussi être piloté **au clavier**,
pas seulement au joystick/souris. Aucune fonction de lecture clavier n'a été
identifiée ni documentée dans les segments seg000→seg108 couverts par cette
session — c'est un angle mort à combler. Seules les fonctions de lecture
joystick/souris ont été trouvées (`Input_ReadAxis1Deadzone`,
`Input_ReadAxis2Deadzone`, `Input_ReadCombinedAxes`, seg049 ;
`Input_CalibrationHandler`, seg048). À rechercher en priorité dans les
prochains segments (seg109+), ou en repassant sur le framework UI
(seg017-028) déjà documenté trop génériquement — certaines fonctions
classées "notification" y gèrent peut-être des événements clavier sans que
ça ait été identifié comme tel. Chercher aussi du côté de `Player_MainUpdate`
(`sub_13100`, seg011, 2015L, jamais détaillée) qui est très probablement le
point d'entrée consommant à la fois joystick ET clavier.

## Prochaine étape immédiate

**Session en cours : seg109→seg123 traités.** Après la bibliothèque
mathématique (seg115-117, voir ci-dessus), seg119-123 ont révélé un nouveau
sous-système : un **gestionnaire d'interruption matérielle 8259A**
(`Interrupt_TimerISR_5940B`, seg121 — envoie l'EOI via `out 20h,al`) pilotant
un **séquenceur à créneaux en exclusion mutuelle**
(`Sequencer_AdvanceActiveSlot_59F1D`, seg123), lui-même piloté par un
cluster de « boîte de ciblage HUD » (`Weapon_HUDBox_*`, seg121-122) qui
réutilise le cluster géométrie/ciblage de seg116
(`Targeting_ComputeBearingElevation_55B1A`) et la VM d'expression de seg114
(`Expr_VM_Execute_51E7E`). **Hypothèse non confirmée** : séquenceur de
contre-mesures (leurres/paillettes) ou de file de messages radio — à
vérifier. Les fonctions `sub_603xx` qu'il appelle massivement ne sont pas
encore documentées (probablement dans seg124+). seg119-120 ont par ailleurs
révélé des primitives de rendu bas niveau (ligne pointillée avec clipping,
blitter de glyphes bitmap).

Priorités historiques toujours ouvertes (non retraitées cette session,
priorité donnée à l'inventaire comme demandé) :
1. **Identifier le véritable tick physique de l'avion du joueur** — lire en
   détail `Player_MainUpdate` (`sub_13100`, seg011, 2015L) et
   `Aero_ComputeForcesMain` (`sub_4791E`, seg102, 649L).
2. **Trouver la lecture clavier** (toujours pas localisée).
3. **Lire `Expr_VM_Interpreter_51106` en détail** (209 opcodes).
4. Élucider le cluster séquenceur/interruption matérielle (`sub_603xx`, non
   documenté — les fonctions attendues dans seg124+ ne l'étaient pas
   directement ; le séquenceur (seg123) reste piloté par des fonctions
   `sub_603xx` toujours non couvertes, potentiellement dans un segment
   ultérieur).

**Nouvelle découverte cette session (seg124-128) : sous-système de mémoire
paginée par blocs de 16 Ko** (`PagedMemory_*`, seg127-128), avec sa propre
détection matérielle (`int 15h`/1209h, signatures "sm"/"SM" — probable TSR
maison) et une classe C++ complète d'encapsulation (seg128, au moins 2
classes sœurs). Lien direct avec `TextRenderer_Main` (seg048) via
`PagedMemory_ReadTextResource_5C14E` et `Registry_LookupForTextRenderer_5B5D9`
— hypothèse non confirmée : stockage des textes/dialogues de mission
au-delà des 640 Ko conventionnels. `PagedMemory_ReadFormattedString_5BE40`
(279L, seg127) est la meilleure candidate pour vérifier cette hypothèse par
lecture approfondie. seg124-126 documentent également le cluster
« objets-texte »/« registre » qui s'appuie sur ce système paginé, et
confirment (via TextRenderer_InputFieldHandler_5A0F3, seg124) que ce cluster
alimente aussi le champ de saisie/édition de texte de `TextRenderer_Main`.

**Nouvelle découverte (seg129-133) : gestionnaire de mémoire typée
central.** `Memory_TypedFree_5C7B6` (seg131) est le désallocateur générique
("operator delete") référencé dans des dizaines de segments à travers toute
la base — le xref le plus dense observé jusqu'ici. Il dispatche vers l'une
de 7 allocateurs typés enregistrés dans une table indexée par tag
(`Memory_AllocatorTableConstructor_5C9D3`), dont une instance du système de
mémoire paginée découvert précédemment. `Memory_ValidateAllocatorIndex_5C9A6`
garde l'accès à cette table. Non vérifié : la nature exacte des 6 autres
allocateurs. seg129 documente une classe sœur du système paginé (autre type
de ressource), et seg130 une famille de destructeurs composés probablement
dupliqués (non vérifiés).

Puis continuer l'analyse en ordre fichier à partir de **seg134**.

**Nouvelle découverte (seg134-139) : runtime Borland bas niveau confirmé.**
seg137 documente `Runtime_StackOverflowCheck_5D22B` (vérification de
dépassement de pile, appelée par `sub_658`) et `Heap_FreeAndCoalesce_5D30E`
(désallocateur de tas avec fusion de blocs libres, appelé par
`sub_338`/`sub_346`) — ceci confirme que `sub_658`/`sub_338`/`sub_346`,
omniprésents dans presque tous les segments précédents, sont les primitives
`malloc`/`free` du runtime C/C++ standard, distinctes du gestionnaire de
mémoire typée (`Memory_TypedFree_5C7B6`, seg131) qui les utilise en interne.
seg134 documente une classe sœur supplémentaire du cluster mémoire paginée
(multi-héritage, plusieurs tags vtable posés successivement dans le même
constructeur — motif de construction Borland avec bases multiples).
seg138 documente l'implémentation bas niveau de la classe `PagedResourceB`
(seg129) : lecture/écriture/init/libération, avec un point d'accroche
(`Runtime_HeapFreeHook_5D937`) entre le tas générique et la libération de
ressources paginées.

Puis continuer l'analyse en ordre fichier à partir de **seg140**.

**seg140-145 : cluster « moteur de texte » (formatage/style/encodage).**
Ces segments documentent l'infrastructure de formatage de `TextRenderer_Main`
(sub_27477, seg048), qui l'appelle directement depuis presque tous ces
segments : un singleton d'état de formatage (`TextRenderer_GetOrInitFormatState_5D9FD`,
seg140), une classe « objet mis en cache avec position » (`CachedObject_*`,
seg141, 22 fonctions — constructeurs/destructeurs/méthodes de transformation
utilisant le gestionnaire de mémoire typée découvert en seg131), des
fonctions d'encodage de caractères (seg142/144), la gestion des
attributs/styles de texte (seg143), et la génération/validation de tables
d'index linéaires pour ces styles (seg145). Rien de structurellement neuf
par rapport aux découvertes précédentes — ce cluster relie et utilise les
sous-systèmes déjà identifiés (mémoire typée, mémoire paginée, cache
d'affichage).

Puis continuer l'analyse en ordre fichier à partir de **seg146**.

**seg146-150 : mesures de texte multi-lignes et détection vidéo bas
niveau.** `Text_ComputeMaxLineWidth_5E6BF`/`Text_ComputeMaxLineHeight_5E706`
(seg146-147) calculent les dimensions d'un bloc de texte multi-lignes en
accumulant, caractère par caractère, la boîte englobante retournée par
`Font_ComputeGlyphBoundingBox_5E74E` (seg148, table de métriques par
glyphe). `Video_ReadCRTCPortBase_5E7D6` (seg149) lit le port du contrôleur
CRT via la zone de données BIOS (segment 0x40, offset 0x63) — détection
matérielle CGA/mono classique. `Video_SetModeIfChanged_5E7EA` (seg150) est
référencée depuis la table d'allocateurs typés du seg131
(`Memory_TypedAllocDispatchE_5C916`) — indice que cette table sert en
réalité de registre de gestionnaires de ressources plus large que la seule
mémoire (au moins une entrée gère le mode vidéo, pas une allocation).

Puis continuer l'analyse en ordre fichier à partir de **seg151**.

**seg151-155 : classes « surface d'affichage » et « police/style », et
gestionnaire d'exception matérielle.** seg151-152 documentent une classe
« surface d'affichage » liée à un mode vidéo (constructeur/destructeur/
clonage), avec au passage une correction : `Member_ClearAndFree_5EA03` (très
référencée dans des dizaines de segments antérieurs comme « constructeur de
sous-objet ») est en réalité un **clear/reset** de membre (libère puis remet
à zéro), pas un constructeur — les entrées existantes utilisant cette
fonction restent correctes dans leur description factuelle des appels,
seule l'étiquette générique était trop optimiste. seg153 documente une
classe « police/style de texte » (gras/italique/souligné/barré, tag vtable
5C60h) utilisée directement par `TextRenderer_Main`.

**seg154 (découverte) : gestionnaire d'exception matérielle.**
`PagedMemory_ExceptionHandler_5EEDD`, installé via `int 15h`/1209h (même
mécanisme que la détection de pilote du seg127, signature "SF"), décode
l'instruction fautive (recherche du préfixe 0x66 et des opcodes 0xF6/0xF7 —
groupe DIV/IDIV/TEST) : probable gestionnaire de division par zéro ou
d'opcode invalide lié à l'accès à la mémoire paginée. Appelé depuis
`PagedMemory_InitSubsystem_5BB0D` (seg127), confirmant le lien direct.
seg155 documente les primitives d'impression texte bas niveau
probablement utilisées pour afficher un message de diagnostic en cas
d'exception. **Non vérifié** : le mécanisme exact déclenchant l'exception.

Puis continuer l'analyse en ordre fichier à partir de **seg156**.

**seg156-160 : listes chaînées génériques, synchronisation d'affichage, et
gestionnaire d'erreur fatale.** seg156 documente une classe liste
doublement chaînée générique complète (insertion tête/queue/avant/après,
retrait, tri, comptage) — utilitaire bas niveau du runtime, sans lien
direct apparent avec un sous-système précédent. seg157 révèle
`DisplayContext_CommitFrame_5F460`, un point de synchronisation d'affichage
référencé par de nombreux constructeurs du cluster mémoire paginée/texte
(bascule de mode vidéo + destruction du cache + double dispatch virtuel).
seg158 montre comment un changement de style de police déclenche un
rafraîchissement global de toutes les instances `PagedResourceC` (liste
chaînée globale du seg134). seg159 documente une seconde classe liste
chaînée (structure de nœud différente de celle du seg156, donc
probablement une classe C++ distincte plutôt qu'une réutilisation).

**seg160 (découverte) : gestionnaire d'erreur fatale/assertion.**
`Runtime_FatalErrorHandler_5F700` est référencé dans des dizaines de
fonctions à travers toute la base, y compris directement depuis
`Render_TerrainPipelineMain` (sub_345D6, seg074 — la plus grosse fonction
du projet). Il résout le nom de la classe fautive via le gestionnaire de
mémoire typée (tag 5C44h), imprime un diagnostic à l'écran puis termine
probablement le programme — confirmant un système d'assertions internes
cohérent avec les autres découvertes runtime de cette session
(dépassement de pile, exception matérielle).

Puis continuer l'analyse en ordre fichier à partir de **seg161**.

**seg161 (⭐ DÉCOUVERTE MAJEURE) : registre de modules à créneaux
temporisés.** Résout la question ouverte de longue date sur les fonctions
`sub_603xx` du cluster séquenceur (seg121-124). Le système :
détourne IRQ0 (`ModuleRegistry_HookTimerIRQ_5FCCA`), reprogramme le PIT
8253/8254 (`ModuleRegistry_ProgramPITFrequency_5FD3A`), gère une table de
16 modules enregistrés (`ModuleRegistry_RegisterModule_5FF08`), et son ISR
(`ModuleRegistry_TimerISR_5FBBE`, 89L, lue une seule fois — à approfondir)
appelle le gestionnaire de chaque module dès que son seuil de temps est
atteint. Une vingtaine de « thunks d'opcode » dispersés dans des dizaines
de segments (dont les `sub_603xx`, mais aussi seg124 et le cluster
`sub_ABxxx` pas encore couvert) sautent vers
`ModuleRegistry_DispatchTrampoline_5FBA6`, qui réécrit l'adresse de retour
de l'appelant pour rediriger vers le gestionnaire enregistré — mécanisme de
hook/plugin transparent. **Le séquenceur de contre-mesures/messages n'est
donc probablement qu'un module de plus dans ce framework générique**, pas
un système autonome. seg162-165 documentent des classes plus classiques :
objet glyphe avec buffer de rendu, widget avec layout/bornes (incluant
`Widget_RenderComplexLayout_60BA6`, 331L, non détaillée), intersection et
remplissage de rectangles.

**Priorité immédiate : couvrir le cluster `sub_ABxxx`** (référencé comme
consommateur du registre de modules, adresses ~0xAB000-0xABFFF, seg170+
probable) pour confirmer l'hypothèse ci-dessus.

Puis continuer l'analyse en ordre fichier à partir de **seg166**.

**seg166-170 : primitives de rendu 2D bas niveau (formes géométriques).**
Cluster cohérent de 5 grosses fonctions, chacune seule dans son segment :
blit de région rectangulaire (seg166), tracé d'ellipse remplie façon
Bresenham (seg167, 481L), clipping+tracé de ligne (seg168, 428L), tracé de
contour d'ellipse — probable variante non remplie de seg167, non vérifiée
(seg169, 454L), et `Render_FillClippedRect_61960` (seg170, 342L) qui sert
de primitive de remplissage commune aux deux fonctions d'ellipse en cas
dégénéré. Aucune n'a été lue en profondeur (juste assez pour identifier le
rôle) — ce sont des candidates pour une session dédiée si la précision
géométrique du rendu 2D doit être vérifiée. `sub_ABxxx` (priorité ci-dessus)
n'a pas encore été atteint — probablement plus loin, seg171+.

Puis continuer l'analyse en ordre fichier à partir de **seg171**.

**seg171-175 : suite des primitives de rendu 2D (texte et sprites).**
Continuation directe du cluster seg166-170, toujours une seule (grosse)
fonction par segment, toujours sans lecture de détail (juste le repérage du
rôle via signature/appelants) : pixel clippé (seg171), ligne horizontale
clippée 201L (seg172), rendu de chaîne de texte complète 496L — référencée
par `GlyphObject_ResolveAndCache_605CE`, seg162 (seg173), une variante
mesure/rendu de texte 457L de forme quasi identique (seg174), et
`Render_DrawScaledSprite_621A2` (seg175, 675L, la plus grosse de tout ce
lot, aucun appel externe, 10 arguments) référencée à la fois par le
zoom carte/radar (seg032) et l'émetteur de particules (seg106) — probable
primitive de sprite mis à l'échelle partagée entre sous-systèmes.
**`sub_ABxxx` (priorité identifiée en seg166-170) toujours pas atteint** —
ce cluster de primitives 2D semble être une zone dédiée entre le registre
de modules (seg161) et `sub_ABxxx`, à continuer de traverser en seg176+.

Puis continuer l'analyse en ordre fichier à partir de **seg176**.

**seg176-180 : fin (probable) du cluster de primitives de rendu 2D.**
Toujours un segment = une fonction, toujours sans lecture exhaustive.
`Struct_GetElementCountMinusOne_625CC` (seg176) est un simple accesseur
générique. seg177 et seg180 sont deux variantes quasi identiques de
rendu/mesure de texte pour le cluster `CachedObject` (seg141) — même motif
de vérification de capacité que `Render_MeasureOrDrawTextString_61F52`
(seg174), identité exacte non vérifiée. seg178 calcule une région de blit
(référencée par `sub_A40B0`, même appelant que `Rect_FillRegion_60F94`,
seg165). **seg179 (`Render_DrawRotatedScaledSprite_62800`, 736L) est la
plus grosse fonction rencontrée dans tout ce cluster** — structure de frame
quasi identique à `Render_DrawScaledSprite_621A2` (seg175) mais avec un
traitement d'angle (movsx 32 bits), référencée par seg063 ET l'émetteur de
particules (seg106) : probable variante « avec rotation » de la même
primitive de sprite.

**`sub_ABxxx` toujours pas atteint — et est en réalité beaucoup plus loin
que prévu : `sub_AB16F` se trouve dans seg458, pas dans les segments
proches.** Ce tronçon seg166-180 (15 segments, 15 fonctions, aucune lue en
détail) est probablement une simple zone de primitives de rendu bas niveau
sans rapport direct avec le registre de modules — la proximité numérique
« sub_AB » avec l'adresse mémoire n'implique pas une proximité de segment
IDA. Il faudra revenir sur l'hypothèse « séquenceur = module du registre »
en sautant directement vers seg458 plus tard plutôt qu'en continuant
l'inventaire séquentiel jusque-là (trop de segments intermédiaires).

Puis continuer l'analyse en ordre fichier à partir de **seg181**.

**seg181-184 : fin du cluster de primitives 2D, puis E/S fichier DOS.**
seg181-183 sont trois dernières variantes du même cluster de rendu 2D
(région de blit, intersection de rectangles, clipping de ligne) — toujours
sans lecture exhaustive. **seg184 marque un changement net de sujet** :
`File_CreateWithRetry_630BA` crée un fichier via `int 21h`/3Ch (DOS CREATE
FILE) avec un callback de reprise configurable en cas d'erreur — le
registre de modules et les primitives de rendu 2D semblent bien terminés à
ce point.

**seg185 : E/S fichier avec support « gros fichier » via mémoire paginée.**
Confirme un lien direct avec la découverte du seg127 :
`File_ReadOrDelegateToPaged_630E7`/`File_WriteOrDelegateToPaged_631E3`
vérifient si la taille demandée dépasse un seuil global (word_709D6) et
délèguent alors à `File_ReadViaPagedMemory_63294`/
`File_SeekAndWriteViaPagedMemory_63362`, qui utilisent `int 21h` (LSEEK)
combiné à `sub_5BC94`/`sub_5BBCC` (le système de mémoire paginée du
seg127) et `int 15h`. Ceci confirme l'hypothèse de travail du seg127 : le
système de mémoire paginée sert bien à charger des données volumineuses
(fichiers) au-delà d'un seuil, potentiellement les gros fichiers de
mission/textures/dialogues.

Puis continuer l'analyse en ordre fichier à partir de **seg186**.

**seg186-190 : classes de flux/lecteur de fichier complètes.** seg186-187
complètent la famille « opération DOS avec retry » (ouvrir/fermer/
positionner, seg184-187 au total). seg188 documente des accesseurs de
champs typés (byte/word/dword) par handle. **seg189 documente la classe
FileStream** (construction, ouverture, lecture par blocs avec position
courante, destructeur) — s'appuie sur `File_ReadOrDelegateToPaged_630E7`
(seg185), confirmant le lien avec le système de mémoire paginée.
**seg190 (33 fonctions) documente une classe « StreamReader » complète** —
un lecteur de flux tamponné avec position/capacité/tampon, dont la méthode
centrale `StreamReader_ReadTyped_63FA1` est référencée par les accesseurs
typés du seg188 et par de très nombreux sous-systèmes disparates (cœur du
jeu seg009, IA sub_33346, TextRenderer_Main directement, missile
sub_A713E, sub_99120...). C'est visiblement une couche de lecture
générique utilisée à travers tout le moteur, probablement au-dessus de
FileStream et/ou de la mémoire paginée — le lien exact entre StreamReader
et FileStream n'est pas confirmé (aucun appel direct StreamReader→FileStream
observé, mais les deux classes partagent le même style et la même zone
mémoire de globales 70Fxx-70FFx).

Puis continuer l'analyse en ordre fichier à partir de **seg191**.

**seg191-192 : registre de flux ouverts et méthodes FileStream complètes.**
seg191 documente une table globale de 8 flux ouverts (ajout/retrait) et un
parseur de valeur/chaîne formatée au-dessus de StreamReader
(`StreamReader_ParseFormattedString_64217`, 148L). seg192 complète la
classe FileStream (seg189) avec ses méthodes virtuelles Read/Write/Seek/
Open/Close/GetSize, chacune déléguant aux fonctions DOS-avec-retry
(seg184-187).

**seg193-194 (⭐ découverte) : format d'enregistrement structuré
(ResourceRecord).** Un système de lecture/écriture de champs typés
séquentiels construit au-dessus de StreamReader — position courante,
bornes d'enregistrement (début/fin avec alignement), lecture de charge
utile, recherche de sous-enregistrements par tag. Fonction centrale :
`ResourceRecord_ReadDwordAdvance_64B9B` (lecture séquentielle avec avance
de position). La plus grosse fonction du groupe,
`ResourceRecord_FindOrCreateMatching_UNRESOLVED` (351L, seg194, adresse non
résolue), effectue une recherche linéaire de sous-enregistrement par valeur
avec repli sur construction si absent — **motif classique d'un format de
type IFF/chunks** (cf. le chargeur de modèles IFF déjà connu). Lien non
confirmé avec ce chargeur IFF existant — à vérifier par une lecture croisée
si cela devient pertinent.

**seg195 : écriture typée StreamReader.** `StreamReader_WriteTyped_6568F`
est le pendant en écriture de `StreamReader_ReadTyped_63FA1` (seg190),
avec `StreamReader_WriteWithGrowth_65795` (289L, non détaillée) gérant le
cas de dépassement de capacité, et `StreamReader_Method_GrowBuffer_6552E`
(160L) doublant dynamiquement le tampon interne.

Puis continuer l'analyse en ordre fichier à partir de **seg196**.

**seg196 : classe IndexedRecordReader.** Un lecteur d'enregistrement indexé
construit au-dessus de StreamReader (compteur courant/total, position,
cache) — trois variantes de constructeur selon le mode d'ouverture
sous-jacent, méthode « clone » d'itérateur.

**seg197 (⭐ découverte) : décodeur LZW.** `LZW_Decompress_66068` initialise
un décodage LZW classique (9 bits initiaux, 512 entrées, premier code libre
258 = 256 + clear + fin), appelé directement par
`IndexedRecordReader_ReadIndexTable_65B73` (seg196) pour charger la table
d'index. **Hypothèse non confirmée** : les grosses ressources du format
ResourceRecord (seg193-194) peuvent être stockées compressées en LZW — le
lien exact avec un format de fichier connu (textures ? IFF ?) n'est pas
vérifié.

**seg198 : E/S de ressource via StreamReader**, référencé directement par
`TextRenderer_Main`.

**seg199 (découverte) : lecture matérielle du joystick.**
`Joystick_ReadAxesRaw_6634C` — boucle de mesure RC classique sur le port
0x201 (Game I/O port), mesurant le temps de décharge des 4 axes analogiques
et lisant les 4 boutons. Fonction dépendante de la vitesse CPU (d'où le
besoin du système de calibration mentionné dans les sessions précédentes).

**seg200 : gestionnaire de callbacks joystick.** Une chaîne liée de
callbacks (tags vtable 4072h/4082h) avec singleton gestionnaire, notifiant
une valeur à un pointeur d'écho optionnel à chaque mise à jour — probable
système d'abonnement pour les widgets d'options de calibration.
Curiosité notée sans l'creuser : `JoystickManager_InitSingleton_6663D`
réaffecte la variable globale `word_70EA8` (tête de liste `PagedResourceC`,
seg134) à une nouvelle valeur — possible réutilisation de variable entre
systèmes distincts, à vérifier si cela pose problème plus tard.

Puis continuer l'analyse en ordre fichier à partir de **seg201**.

**seg201 : objets « option de configuration ».** Formatage/affichage de
valeurs, motif similaire au cluster ConfigOption déjà vu ailleurs.

**seg202-203 (⭐ DÉCOUVERTE MAJEURE) : le système clavier, enfin localisé.**
Priorité ouverte depuis plusieurs sessions. `Keyboard_ProcessScanCode_66AC4`
(seg202) reçoit un scan-code, compose un octet de modificateurs (Shift si
code≥0x80, plus Verr.Num/Verr.Maj/Ctrl/Alt via des globales dédiées),
consulte une table de 256 gestionnaires par scan-code, et pousse
l'événement dans une file circulaire via `Keyboard_PushEventToQueue_66C9D`.
`Keyboard_InitSystem_66C34` installe ce gestionnaire pour les 255 scan-codes
possibles. seg203 documente l'infrastructure d'enregistrement et révèle que
le clavier et le joystick partagent une partie de leur système de liaison
bouton/touche ↔ action (réutilise `JoystickCallback_RegisterInChain_664D5`
et `JoystickCallback_FindOrTraverse_66573`, seg200). **Non vérifié** : je
n'ai confirmé que l'écriture dans la file d'événements côté clavier, pas où
ni comment la boucle de jeu principale la consomme en lecture — ce serait
la suite logique à chercher si la question refait surface.

**seg204 : défilement de texte animé**, avec enregistrement d'un gestionnaire
de tic périodique (motif proche du registre de modules temporisés, seg161,
mais utilisant une table à 4 emplacements distincte plutôt que la table à
16 emplacements du seg161).

**seg205 : entrées calibrées et souris.** `Input_GetCalibratedXValue_67481`
et `Input_GetCalibratedYValue_67499` sont référencées **directement par
`Player_MainUpdate`** (sub_13100) — pertinent si la question ouverte de la
physique/contrôles du joueur est reprise. Une fonction sans label utilise
`int 33h` (pilote souris DOS) pour verrouiller le curseur à sa position
courante (fonctions 3/7/8) — technique classique de blocage temporaire du
curseur, probablement pendant le pilotage à la souris ou un menu modal.

Puis continuer l'analyse en ordre fichier à partir de **seg206**.

**seg206 : variante d'objet défilement de texte** (TextScrollDisplayB),
réutilise l'état d'animation du seg205.

**seg207 : objet chronomètre.** `Stopwatch_RegisterTickModule_67611`
s'enregistre comme module dans le registre à créneaux temporisés du
seg161 (cadence 60 tics) — généralise cette découverte au-delà du seul
séquenceur de contre-mesures : c'est un mécanisme de minuterie applicative
générique, utilisé par plusieurs sous-systèmes indépendants.

**seg208 : système complet de calibration joystick.** Échantillonnage des
axes (Joystick_SampleAxesToTable_67910), application de zone morte et
d'échelle (Joystick_ApplyDeadzoneAndScale_6794D/B_679E2), interpolation en
pourcentage entre bornes min/max (Joystick_InterpolateCalibrationPercent_67CB8,
138L). Plusieurs fonctions (Joystick_TestButtonMasked_67B6C,
Joystick_GetAxisMin/Max_67BC9/67BD8) sont référencées **directement par
`Player_MainUpdate`**.

**seg209 : suite du cluster TextScrollDisplayB** (démarrage/arrêt
d'animation, méthodes vtable).

**seg210 (⭐ DÉCOUVERTE MAJEURE) : la souris comme entrée de jeu, confirmée.**
`Mouse_EventCallback_68109` est un gestionnaire de callback souris (style
`int 33h`, préambule en code machine brut, bascule sur pile privée — même
style que les gestionnaires d'exception/interruption du seg154/seg161). Il
stocke les coordonnées reçues dans `word_72E68`/`word_72E6A` — **exactement
les globales lues par `Input_GetCalibratedXValue_67481`/
`Input_GetCalibratedYValue_67499`** (seg205), référencées directement par
`Player_MainUpdate`. Confirme que la souris est une source d'entrée pour le
joueur, au même titre que le joystick. **Non vérifié** : le point
d'installation exact du callback (`int 33h` fonction 0Ch, typiquement) n'a
pas été localisé, et le lien précis avec le gameplay (visée libre ? menus
seulement ?) reste à déterminer par une lecture plus approfondie de
`Player_MainUpdate`.

**Priorités ouvertes mises à jour :**
1. Tick physique de l'avion du joueur — toujours pas confirmé
   (`FlightPhysics_TickCandidate_4F4EE`, seg109, non vérifié en détail).
2. Lecture clavier — **localisée** (seg202-203), mais la consommation des
   événements par la boucle de jeu reste à tracer.
3. `Expr_VM_Interpreter_51106` (209 opcodes, seg114) — toujours pas lu en
   détail.
4. **Nouveau** : rôle exact de la souris dans le gameplay — à vérifier si
   pertinent.

Puis continuer l'analyse en ordre fichier à partir de **seg211**.

**seg211 (clôture) : point d'accroche clavier réel.**
`Keyboard_BIOSInterceptHandler_681BC` est le gestionnaire d'interception
BIOS (`int 15h`/4Fh, appelée par l'INT 9 du BIOS à chaque scan-code) qui
bascule sur pile privée et appelle `word_7160C` — exactement le pointeur
installé par `Keyboard_SetHandlerPointer_66EE7` (seg203) vers
`Keyboard_ProcessScanCode_66AC4` (seg202). La chaîne matériel → gestionnaire
→ file d'événements est confirmée de bout en bout. Il reste à tracer la
consommation de la file côté boucle de jeu si cette question redevient
pertinente.

**seg212 (30 fonctions) est le loader VROOMM (Borland) lui-même.**
Le projet documente depuis seg000 un contexte Borland + overlays + VROOMM
(cf. github.com/NancySadkov/devroomm) ; seg212 en est l'implémentation en
clair : recherche/ouverture de "strike.exe", parsing d'en-tête MZ (calcul
de taille pages/paragraphes classique), parcours de table de relogement,
déplacement d'image en mémoire, et patch direct de trampolines (écriture
d'opcodes machine JMP FAR 0xEA et INT 0xCD dans l'image chargée) — c'est
exactement le mécanisme par lequel VROOMM réécrit les points d'entrée des
segments d'overlay. Toutes les fonctions du segment ont été renommées
`VROOMM_*` dans known_functions.json (`VROOMM_MainEntry_68B2F`,
`VROOMM_LocateAndValidate_68254`, etc.).

**seg213-215 : segments de données uniquement**, pas de fonctions (tables
de remplissage 0xFF/0x00, probablement des tables de correspondance ou
zones réservées référencées par seg216/seg339).

**Priorités ouvertes mises à jour :**
1. Tick physique de l'avion du joueur — toujours pas confirmé.
2. Lecture clavier — **entièrement tracée côté écriture** (matériel →
   gestionnaire → file), reste la consommation côté boucle de jeu.
3. `Expr_VM_Interpreter_51106` (209 opcodes, seg114) — toujours pas lu en
   détail.
4. Rôle exact de la souris dans le gameplay — toujours ouvert.

Puis continuer l'analyse en ordre fichier à partir de **seg216**.

**seg216-429 (⭐⭐ DÉCOUVERTE MAJEURE) : la table de stubs VROOMM,
extraite en masse.** seg216 est un segment de données pur (vtables/
pointeurs, référencé par des centaines d'entrées existantes comme
`DATA XREF: seg216:...`). Juste après, la numérotation IDA saute
directement de seg216 à `stub227` — **seg217 à seg226 n'existent pas**.
À partir de stub227, chaque segment (122 au total, jusqu'à seg429, la
numérotation repassant en préfixe `seg` après stub315) suit une structure
de données VROOMM strictement identique et documentée en clair par IDA
(struct `int_code`/`memswap`/`fileoff`/`codesize`/`relsize`/`nentries`/
`prevstub`/`workarea`, chaînée vers seg000 le VROOMM manager), suivie de
`nentries` thunks `jmp sub_YYYYY`. C'est le mécanisme par lequel VROOMM
fournit des points d'entrée stables vers du code d'overlay dont
l'emplacement mémoire réel change au fil du swap.

Ce motif étant purement mécanique, les **1006 thunks** ont été extraits et
documentés par script (`extract_stubs2.py`, conservé dans le répertoire de
travail) plutôt que lus manuellement — chaque entrée dans
`known_functions.json` est nommée `VROOMM_StubThunk_<adresse>` avec sa
cible et les métadonnées de swap de son segment. Ceci fait passer la
couverture de 1672 à **2678 fonctions (77.6%)** en une seule opération.

**seg339** (segment de données de 13000 lignes, contenant les vtables
référencées dans des milliers d'entrées à travers toute la base) n'a pas
été énuméré — ce n'est pas du code exécutable.

**Restant à couvrir : seg430 à seg461** (32 segments de code réel qui
reprennent après la table de stubs). C'est là que sub_AB16F et le cluster
`sub_ABxxx` identifié en session précédente comme consommateur du registre
de modules (seg161) doivent se trouver (confirmé : seg458 est dans cette
plage).

**seg339 traité (⭐⭐⭐ découverte majeure) : segment global du runtime,
confirmation massive par 378 chaînes de debug embarquées.** Pas de
fonctions (pure zone de données, DGROUP/BSS 0x6D0B0-0x72F58) mais une
mine de confirmations FACTUELLES (pas des hypothèses) pour toute la
session — détail complet dans README.md section « Découverte majeure
(10) ». Points clés à retenir pour la suite :
- La classe mémoire typée (seg131) s'appelle littéralement `MemoryManager`,
  ses 7 allocateurs sont des « handlers » EMS.
- Le format `ResourceRecord` (seg193-194) EST du IFF (FORM/CHUNK/PACK
  confirmés en toutes lettres), lié au décodeur LZW (seg197) via les
  « packs » compressés.
- `Render_TerrainPipelineMain` (seg074) vient du fichier source
  `MAPGRI-I.CPP` (nom de fichier C++ retrouvé dans un message d'erreur).
- Clavier/souris (seg202-203/210-211) ont une détection de dépassement de
  pile documentée (« keyboard/mouse stack overflow »).
- Contenu de jeu riche confirmé : armement complet, régimes moteur MIL/AFT,
  modes HUD/radar, composants de dommages (RUDDER/ELEVATOR/AILERON/...),
  écrans d'options (.shp), catégories de décision IA, pilotes audio
  (Roland/AdLib/Pro Audio Spectrum).

**seg430-435 traités (⭐⭐ découverte) : système de composants de
dommages/état du joueur (PlayerComponent).** ~100 fonctions cohérentes,
premier vrai code après la table de stubs VROOMM et seg339. Charge les
composants de l'avion (dommages, config) depuis le format IFF/
ResourceRecord (seg193-194). `PlayerComponent_IndexToFlagMask_9DE60`
convertit un index 0-12 en masque de bit, cohérent avec les 8 composants
de dommages confirmés en seg339 (RUDDER/ELEVATOR/AILERON/LWING/RWING/
ENGINE/LANDGEAR/FLAPS). Famille de constructeurs de variantes
(`PlayerComponentVariantA` à `N`) suivant un motif récurrent (alloc, 2
classes de base, sous-objets composites motif seg109, enregistrement
conteneur).

**Lien confirmé avec le système de trigger temporisé du seg109** :
`TimedTrigger_SpawnAndBindGeometry_9E289` (419L, seg432) utilise
exactement le même motif que `Trigger_TimedRangedSpawnOnce_4F351`
(instanciation, SetReference, ajout à liste membre) — probablement
l'implémentation d'overlay réelle vers laquelle pointent les stubs fixes.
`TimedTrigger_NotifySingleListener_9DD30`/`NotifyConditional_9DD81`/
`ReleaseIfInactive_9DDCF` (seg430) complètent ce système côté
notification de listeners.

Une trentaine de fonctions restent flaguées « non détaillée » (grandes
tailles, motifs de constructeurs répétitifs) — candidates pour passe
dédiée.

**Restant à couvrir : seg436 à seg461** (26 segments de code).

**seg436-440 traités : suite directe du cluster PlayerComponent.**
20 fonctions supplémentaires, même motif que seg432-435 (constructeurs de
variantes, chargement de champs IFF via ResourceRecord). Une exception
notable : `HUD_RenderApproachAngleWidget_A0E3F` (seg438, 188L) combine le
cluster de formatage de texte (seg143), le cluster widget (seg163) et
`Math_HeadingAngle_553CF` (seg116) — probable widget HUD affichant
un angle d'approche/aspect calculé, hors sujet du cluster PlayerComponent
environnant. Petite note en passant : `PlayerComponentVariantS_A1054`
(seg440) appelle `sub_45C0D`, la fonction déjà signalée dans les notes
méthodologiques du projet comme possible duplicat non vérifié (avec
`sub_46164` face à `sub_3DC3D`) — aucune action prise, juste noté au
passage.

**Restant à couvrir : seg441 à seg461** (21 segments de code).

**seg441-445 traités : deux modules d'écran UI complets.**

**seg441** : sauvegarde/chargement de partie (SaveGame_WriteFile_A10C0/
ReadFile_A1173), s'appuie sur le cluster fichier DOS complet (seg184-187,
avec support gros fichier via mémoire paginée seg127).

**seg442 (57 fonctions) : module écran de palette/couleur (PaletteScreen).**
Verrou d'exclusion mutuelle (`PaletteScreen_AcquireOwnership_A1240`/
`ReleaseOwnership_A125D`, appelé par ~50 fonctions du module — désactive
l'animation de défilement de texte pendant la possession). Primitives de
manipulation directe du DAC VGA (`int 10h`, fonctions 1010h/1012h/1015h/
1017h — lecture/écriture de registres de palette individuels ou en bloc).
Algorithme de courbe/interpolation (`PaletteScreen_ComputeCurvePoint_A1430`,
fonction la plus référencée du segment). `PaletteScreen_BuildCustomGradient_A1626`
(537L, la plus grosse fonction rencontrée dans toute la session) construit
un dégradé de couleur personnalisé à partir de 22 entrées explicites plus
une courbe de 23 points. Plusieurs grosses fonctions de dessin de
widget/bordure restent flaguées non détaillée.

**seg443** : pont entre PaletteScreen et le cluster widget générique
(seg163).

**seg444 (57 fonctions) : module widget jauge/indicateur (GaugeWidget).**
Système distinct de PaletteScreen mais réutilisant son verrou
d'ownership occasionnellement. Gestion de liste chaînée propre (motif
similaire à IndexedRecordReader, seg196). Famille de constructeurs de
variantes. `GaugeWidget_RenderModeDispatch_A40B0` (167L) a un switch à
**5 modes de rendu** — probablement les 5 styles d'affichage d'une jauge
(aiguille, barre, digital...), candidat prioritaire si le détail exact
doit être confirmé.

**seg445** : complète GaugeWidget avec dessin+étiquette et détection de
survol/clic sur une liste de zones cliquables (widget interactif).

**Non détaillé, candidats pour sessions dédiées** : une quinzaine de
grosses fonctions dans seg442/444 (dessin de bordures, dispatch de rendu)
ont été nommées et caractérisées par leurs appels sans lecture exhaustive
ligne par ligne, vu le volume de ce lot.

**Restant à couvrir : seg446 à seg461** (16 segments de code).

**seg446-450 traités.**

**seg446 (20 fonctions) : widget d'information (InfoWidget)**, réutilise
directement le verrou d'ownership du module PaletteScreen (seg442) —
accesseurs simples et mesure/rendu de texte.

**seg447-449 (44 fonctions) : suite massive du cluster PlayerComponent.**
seg448 documente une grande famille de constructeurs de variantes
(jusqu'à 3 sous-objets composites par variante, motif seg109). seg449
révèle un chargement massif de propriétés visuelles/matériau
(`PlayerComponent_LoadFieldsMassive_A5D18`, 239L, une trentaine de champs
IFF consécutifs) précédé d'une réinitialisation de flags/valeurs par
défaut en virgule fixe 8.8 (`PlayerComponent_ResetVisualStateDefaults_A5620`)
— probable définition complète de l'apparence d'un composant (couleur,
transparence, etc.).

**seg450 (10 fonctions) : chargement de texte de mission.**
`MissionText_LoadAndFormatFromIFF_A636C` (392L) combine construction de
StreamReader, recherche de sous-enregistrement IFF (même cluster que le
LZW, seg196-197) et mesure de texte multi-lignes (seg146-147) — probable
chargeur de dialogue/briefing de mission compressé. Non lu en détail
(392L, candidat pour session dédiée).

**Beaucoup de fonctions dans seg448-449 restent flaguées « non détaillée »**
(grande famille de constructeurs de variantes très similaires) — la
priorité a été donnée à couvrir l'ensemble du cluster plutôt qu'à tracer
exhaustivement chaque variante individuellement.

**Restant à couvrir : seg451 à seg461** (11 segments de code).

**seg451-461 traités — FICHIER `strike.asm` ENTIÈREMENT COUVERT EN ORDRE
DE SEGMENT (3122/3449 fonctions, 90.5%).**

**seg451-452 :** suite PlayerComponent, calcul de paliers d'interpolation
(échelles ×1/×1/4/×1/40 d'un intervalle — probable animation par étapes).

**seg453 :** `TriggerObject_Construct_A6D18` construit la classe dont le
destructeur est `Dtor_ScalarDeleting_4F316` (seg109, même tag vtable
32F6h) — bonne confirmation croisée entre début et fin de session.
`PlayerComponent_LoadDataChunk_A6CA0` confirme un tag de chunk IFF
générique "DATA" (0x41544144 en ASCII) en complément de FORM/CHUNK
(seg339).

**seg454 :** système de cycle de texte/dialogue (TextCycler) avec
sélection aléatoire d'entrées (`sub_70D` générateur aléatoire,
`Anim_AdvanceFrameCycle_4FB84` seg111).

**seg455 (⭐ découverte) : chargeur de mission (MissionLoader).**
`MissionLoader_LoadEntitiesMain_A767F` initialise EXACTEMENT les mêmes
globales que `UIScreen_InitDefaultParams_5066A` (seg112, tout début de
session) — relie le chargeur de mission à l'écran de mission planning.
`MissionLoader_SpawnEntity_A7B1E` instancie des entités via `sub_38B70`
(motif de spawn du seg109). Fonctions volumineuses (199-239L) non tracées
en détail.

**seg456 :** chargeur de scénario de mission (MissionScenario), lié au
système Expr_VM/GeomNode (seg114) via des appels répétés à
`Expr_LookupTableEntry85B_52D45`/`Expr_Node_LookupAndConvert_52D69`.
`MissionScenario_LoadMainRecord_A8331` (775L) est la plus grosse fonction
de tout le reste du fichier — non tracée en détail, candidate prioritaire
absolue si une session dédiée est menée sur cette zone.

**seg457 :** système de gestion de slots pour les valeurs Expr/GeomNode —
beaucoup de petites fonctions répétitives de type allocation/libération
typée (tag 5C44h) associées à la lecture de champs IFF.

**seg458-461 (⭐⭐ DÉCOUVERTE MAJEURE) : résolution du cluster `sub_ABxxx`
(AudioQueue).** Question ouverte depuis plusieurs sessions : quel module
consomme le registre de modules à créneaux temporisés du seg161 en dehors
du séquenceur de contre-mesures ? Réponse : `AudioQueue_RegisterTickModule_AA810`
référence explicitement `Interrupt_TimerISR_5940B` (seg121) via le
mécanisme Stopwatch (seg207). `AudioQueue_ActivateSlotOpcode_AB16F`/
`DeactivateSlotOpcode_AB1AF` appellent directement les thunks d'opcode du
registre (`ModuleRegistry_Opcode_AB_603D2`/`_AD_603D8`, seg161).
`AudioQueue_ProcessSequencerSlots_AB1EF` appelle
`Sequencer_AdvanceActiveSlot_59F1D` (seg123). Le cluster combine
massivement `IndexedRecordReader` (seg196) et `StreamReader` (seg190),
avec un signal (callback + constante mémoire 0xC0000 dans un appel à
sub_1069) évoquant une installation de callback DMA/audio. **Hypothèse de
travail non confirmée en détail** : file de lecture de clips audio/
messages indexés — probablement le système de "chatter radio" déjà
évoqué dans les notes du projet, ou lié aux messages vocaux "Betty"
confirmés dans les chaînes du seg339. Nommé `AudioQueue_*` en
conséquence ; le contenu exact (audio vs texte) reste à confirmer.

## Correction de couverture : les segments `ovr` (561 fonctions)

**L'affirmation initiale de couverture complète (seg000→seg461) était
incorrecte.** Entre seg339 (données) et seg430, 90 segments nommés
`ovrNNN` (`ovr227` à `ovr316`, lignes 254288-335248 de `strike.asm`)
contenant 561 vraies fonctions avaient été silencieusement ignorés par le
script d'extraction en masse de la table de stubs VROOMM (qui ne
détectait que les préfixes `seg`/`stub`, pas `ovr`).

**Vérification par la méthode correcte** : comparaison directe de
l'ensemble des déclarations `proc far`/`proc near` de `strike.asm`
(3449 au total, comptées par `grep -cP "^\S+\s+proc\s+(far|near)"`)
contre les clés de `known_functions.json`. C'est la méthode à utiliser
pour toute vérification de couverture future — ne pas se fier à une
simple différence arithmétique entre le nombre d'entrées et 3449, car
`known_functions.json` contient aussi des entrées `loc_`/synthétiques qui
ne sont pas des `proc` (234 actuellement).

**Traitement en mode balayage rapide** (sur demande explicite) : les 561
fonctions ont été documentées en s'appuyant fortement sur le contexte
déjà établi (noms de fonctions déjà connus apparaissant dans les listes
d'appels), avec un minimum de lectures manuelles complètes — seules
quelques fonctions clés par groupe thématique ont été lues en détail pour
confirmer le thème, le reste étant nommé par extrapolation du motif. Les
grosses fonctions (200-3103 lignes) sont flaguées « NON DÉTAILLÉE » sans
avoir été lues intégralement.

**Contenu confirmé** : IA de combat/manœuvre (`AI_ManeuverSolutionMain_781D0`,
2373L), chargement de base d'entités de mission
(`MissionRecord_LoadEntityDatabase_7B035`, 3103L — la plus grosse fonction
du fichier), famille de symboles HUD avec test de clipping caméra, système
de sous-titres synchronisés audio/vidéo (`AV_SyncComputeOffset`), terrain
(visibilité/altitude/tuiles), débris/particules (torque, spawn), caméra
(attachement/cible secondaire), et une famille de 7 gros chargeurs de
fichiers ressource quasi identiques (`ResourceFile_LoadTypeA` à `G`).
Plusieurs familles de duplicats VROOMM confirmés byte-pour-byte
(destructeurs scalar-deleting identiques).

**`known_functions.json` contient 3683 entrées** : les 3449 fonctions
`proc` du fichier + 234 points d'entrée `loc_`/thunks vtable documentés en
plus.

## État final de cette phase du projet

**Le fichier `strike.asm` a été parcouru intégralement, y compris les
segments `ovr227`-`ovr316` initialement ratés.** Les 3449 fonctions `proc`
du fichier sont documentées (100%, vérifié par comparaison directe des
déclarations `proc`), plus 234 points d'entrée `loc_`/thunks vtable en
complément (3683 entrées au total dans `known_functions.json`). Plusieurs
centaines de fonctions (dans seg432-461 et ovr227-316) restent des
variantes répétitives ou de grosses fonctions non tracées ligne à ligne,
flaguées « NON DÉTAILLÉE » — candidates pour des sessions d'approfondissement
si nécessaire, mais **plus aucune fonction n'est totalement absente du
corpus**.

**Priorités pour une éventuelle suite (sessions d'approfondissement,
plus d'inventaire à faire) :**
1. `Expr_VM_Interpreter_51106` (209 opcodes, seg114) — jamais lu en détail
   malgré son rôle central transversal (HUD/IA/UI/mission).
2. `MissionRecord_LoadEntityDatabase_7B035` (3103L, ovr239) — la plus
   grosse fonction de tout le fichier, jamais lue en détail.
3. `AI_ManeuverSolutionMain_781D0` (2373L, ovr232) — cœur probable du
   calcul de manœuvre de combat aérien IA, jamais lu en détail.
4. `MissionScenario_LoadMainRecord_A8331` (775L, seg456) — cœur probable
   du chargement de mission.
5. `AudioQueue_ProcessMain_AA84E`/`LoadAndPlayEntry_AB592`/
   `MainProcessEntry_ABBEF` (seg458-461) — confirmer le contenu exact
   (audio vs texte) du cluster AudioQueue.
6. `MissionText_DrawTypewriterSynced_975CC` (ovr287) — confirmer le
   mécanisme de synchronisation audio/vidéo des sous-titres.
7. Tick physique de l'avion du joueur — toujours pas confirmé
   (`FlightPhysics_TickCandidate_4F4EE`, seg109).
8. Rôle exact de la souris dans le gameplay (seg210) — toujours ouvert.
9. Consommation de la file d'événements clavier par la boucle de jeu
   (seg202-203) — écriture confirmée, lecture non tracée.
10. Les nombreuses grosses fonctions PlayerComponent/GaugeWidget/
    PaletteScreen/HUDSymbol/ResourceFile flaguées « non détaillée »
    (seg432-461, ovr227-316), si un inventaire plus fin de ces
    sous-systèmes est souhaité.

