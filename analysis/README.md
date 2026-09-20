# STRIKE.EXE — Analyse fonctions — État des lieux

**3449/3449 fonctions `proc` du fichier sont documentées — couverture
réellement complète, vérifiée par comparaison directe avec la liste de
toutes les déclarations `proc far/near` de `strike.asm`** (et non plus une
estimation). `known_functions.json` contient 3683 entrées au total : les
3449 fonctions `proc` plus 234 points d'entrée `loc_`/thunks documentés en
plus (référencés par vtable ou saut direct, non comptés comme « candidats »
mais réels dans le binaire).
**Couverture complète du fichier en ordre : seg000 → seg461 (fin du
fichier `strike.asm`).** 327 fonctions restantes sont des variantes
répétitives flaguées « non détaillée » à l'intérieur de segments déjà
couverts (constructeurs de composants, fonctions de chargement IFF,
grosses fonctions de rendu/logique non tracées ligne à ligne).
Couverture : **seg000 → seg215** en ordre fichier détaillé, plus
**l'intégralité de la table de stubs VROOMM (122 segments, seg216 à
seg429/stub227-315) extraite en masse** — voir la section dédiée
ci-dessous. Reste seg339 (données) et seg430-461 (32 segments de code) à
couvrir.

> **Voir aussi `analysis/DATA_MODEL.md`** — pile de chargement des données
> (E/S DOS → FileStream → StreamReader → navigateur IFF `ResourceRecord` →
> chargeurs d'assets) et modèle de données : format conteneur IFF/RealSpace
> (FORM/CAT/CHUNK/PACK, tailles big-endian, LZW), tables de tags de chunk pour
> les modèles 3D (`OBJT`), le modèle de vol (`DYNM`/`JDYN`), les missions
> (`MISN`/`WRLD`), et correspondance fichier → format → structure.

## ⚠️ Corrections critiques post-livraison (voir CLAUDE.md pour le détail complet)

Deux fonctions ont été mal caractérisées dans une session précédente sur la base d'une
évaluation superficielle (nom hérité, pattern de structure non vérifié) plutôt qu'une
lecture ligne à ligne, corrigée depuis :
- **`sub_3314`** : `Flight_PhysicsTick_JDYN` → **`Targeting_AcquireBestThreat`**
  (sélecteur de cible/menace générique, pas un tick physique)
- **`sub_49C2E`** : `JDYN_PhysicsTickMain` → **`Guidance_HomingVelocityUpdate`**
  (moteur de pilotage automatique/homing cinématique — écrit directement cap et vitesse
  sur l'objet, pas un intégrateur physique par force/masse)

Ces corrections sont appliquées à `known_functions.json` et aux `.asm` de cette livraison.

**Physique de l'avion — RÉSOLUE (session ultérieure, détail complet : `DATA_MODEL.md` §6.2).**
Le tick est **`PhysicsTicks`** (seg103, ~0x4A85B ; slot Update de la vtable `JDYN`,
4 thunks seg082) — `FlightPhysics_TickCandidate_4F4EE` (seg109) est celui des classes
`DYNM` simples (missile/bombe). Le bilan de forces est **en repère corps**
(c0 envergure, c1 nez, c2 normale), transformé corps→monde par
`Physics_IntegratePosition` :
`accel = (poussée(0,jdyn[0x28],0) + portance + force_latérale + traînée)/masse + gravité`.
Trois fonctions étaient **mal nommées** (nom hérité non vérifié), corrigées ligne à ligne :
- `Aero_DetectControlSaturation` (`sub_4812B`) → **`Aero_ComputeLiftAndSideForce`** : ce
  n'est pas une « détection », c'est **le générateur de portance** :
  `L = jdyn[0x61]·k·α_eff·q · n̂(0,−v.c2,v.c1)`, avec `α_eff = α + calage_aile(jdyn[0x4C])
  [+ volets(jdyn[0x4D])]`, borné par `jdyn[0x4B]` (décrochage). `flags_75` bit6 = simple
  effet de bord (alerte départ, difficulté élevée).
- `Aero_ComputeMomentsWithFeedback` (`sub_48400`) → **`Aero_ComputeDragWithFeedback`** :
  vecteur de **traînée** `−v̂_corps·[q·(jdyn[0x5D]·α² + (jdyn[0x5D]≫3)·β² + drag_flags75)]`.
- `FlightControl_ComputeMomentA/B/C` (`sub_469FE`/`46AB5`/`46D13`) → **`Aero_FlowAngle_AoA`
  / `Aero_FlowAngle_Sideslip` / `Aero_DynamicPressure`** : ce ne sont pas des moments mais
  les **angles d'écoulement** (α, β, depuis la vitesse en repère corps) et la **pression
  dynamique** `q = ½v²·coeff(vitesse-air)`, ce coeff venant d'une **table 1-D à
  interpolation linéaire** (`Aero_ResolveAeroCoeffTable` `sub_46DA3`, ex-`ResolveNamedParam`).
- `Vector_TransformHelperB_559BB` → **`Vector_Normalize3D`** : c'est une normalisation, pas
  une rotation.

**Corollaires** : la portance dépend de α et q (pas du roulis — le roulis n'agit que via
la transformation corps→monde qui incline le vecteur portance) ; `jdyn[0x4C]`/`jdyn[0x4D]`
ne sont **pas des trims pilote** (le jeu est en accès direct sur les axes) mais des
constantes de cellule (calage d'aile, incrément volets) ; `jdyn[0x7C]` = **facteur de
charge / G-mètre** (`−accel_corps.c2`), pas l'accélération verticale monde.
**Restent ouverts** : la ligne exacte des overrides `vtable[+0x3C]` (masse ≈ chunk `DYNM`)
et `vtable[+0x34]` (intégration position) dans la vtable `JDYN` primaire ; l'usage des
3 u8 du chunk `THRS` ; `JDYN +0x80..+0x8B`.

| Segment | Fonctions | Thème dominant |
|---|---|---|
| seg000 | 119/119 | Runtime C Borland (overlay manager, heap, printf/scanf, stdio, strings, path) |
| seg001 | 2/2 | Premier code jeu : test de proximité, tick physique de vol (JDYN) |
| seg003 | 33/33 | Cœur IA de vol/combat : capteurs cachés, alerte menace, lois de contrôle |
| seg004 | 17/17 | Think IA top-level, tests de compétence pilote, scan radar |
| seg005 | 6/6 | Système de GOAL (vérification + exécution) |
| seg006 | 13/13 | Chatter radio complet, succession de leader/formation |
| seg007 | 5/5 | Acquisition de cible, clairance radio décollage/atterrissage |
| seg008 | 3/3 | Physique et guidage de missile |
| seg009 | 5/5 | Contrôleur d'altitude, reset d'état de vol |
| seg010 | 5/5 | Encodage HUD, sous-objets attachés |
| seg011 | 2/2 | `Player_MainUpdate` (2015 lignes, non détaillée) |
| seg012 | 1/1 | Init programme (vidéo/police/arguments) |
| seg013 | 5/5 | Moteur de texte "machine à écrire" (briefings) |
| seg015 | 7/7 | UI cockpit/radar (portrait pilote, suivi cible, alerte missile) |
| seg017 | 4/4 | Framework UI — notification de listes d'enfants |
| seg018 | 1/1 | `Radar_Project3DToScreen` (896 lignes, non détaillée) |
| seg019 | 3/3 | Cadrans analogiques (aiguilles/graduations) |
| seg020 | 1/1 | Défilement/cadrage de vue (carte/radar) |
| seg022 | 3/3 | **Moteur audio 3D** (pan stéréo, Doppler) |
| seg023 | 11/11 | Framework UI — conteneurs à enfants, clipping rectangulaire |
| seg024 | 3/3 | Framework UI — suite notifications |
| seg025 | 13/13 | Framework UI — bitset, grille, accesseurs de classe |
| seg026 | 4/4 | **Classe C++ String** (constructeurs, assignation) |
| seg028 | 9/9 | Widgets liste/tooltip |
| seg029 | 12/12 | **Lexer/parseur/compilateur du format script IA (PROF/_AI_)** |
| seg030 | 2/2 | Zoom carte/radar |
| seg031 | 17/17 | File de messages radio (timers/slots), texte de dialogue, audio de briefing |
| seg032 | 2/2 | Marqueurs graphiques de liste UI |
| seg035 | 2/2 | Vidéo bas niveau (clear texte, registre CRTC / effet shake écran) |
| seg036 | 4/4 | **Gestionnaire de mémoire étendue EMS** (streaming audio/animations) |
| seg037 | 4/4 | **Cœur du moteur de rendu 3D/polygonal** (4 fonctions énormes, 566-849L) |
| seg038 | 1/1 | Destructeur de handle générique |
| seg039 | 36/36 | **Bibliothèque de conteneurs C++** (listes, dictionnaire clé→valeur, GC, itérateur du monde) |
| seg040 | 4/4 | Triggers d'événements de mission (proximité, difficulté, état joueur) |
| seg041 | 24/24 | **Journal de mission / kneeboard** (entrées, rendu par type, sélection) |
| seg042 | 7/7 | Système de keyframe/animation (position, vitesse, easing) |
| seg044 | 1/1 | Primitive de dessin/remplissage avec table de couleurs |
| seg045 | 1/1 | Primitive de tracé de ligne (Bresenham + clipping) |
| seg046 | 7/7 | **Rasterizer de triangle texturé/ombré** (edge setup, interpolation) |
| seg047 | 4/4 | Config/calibration, lecture PIT haute précision (source du delta-temps physique) |
| seg048 | 6/6 | `TextRenderer_Main` (1158L, moteur de texte principal) + calibration CPU |
| seg049 | 11/11 | Lecture axes joystick/souris avec deadzone |
| seg050 | 1/1 | Init structure contrôleur/axe |
| seg051 | 2/2 | Pipeline de flags du chatter radio (init + décalage historique) |
| seg052 | 1/1 | Destructeur générique C++ |
| seg053 | 3/3 | Destructeurs/constructeurs de descripteur générique |
| seg054 | 1/1 | Résolution de valeur d'easing pour keyframe |
| seg055 | 21/21 | **Préparation géométrique de face triangulaire** (arêtes, normales, centroïde, teintes de dommage) |
| seg056 | 4/4 | Widgets liste (destruction en masse, libellés numérotés) |
| seg057 | 6/6 | **Résolution des chemins de fichiers de données** (`Path_ResolveDataFile`) |
| seg058 | 12/12 | Produit scalaire normale·direction (backface culling), barres de progression |
| seg059 | 5/5 | Setup d'arête/segment (analogue linéaire du setup de face triangulaire) |
| seg060 | 7/7 | **Système de dommages structurels** (sélection pondérée, timer, réinitialisation, positions HUD) |
| seg061 | 6/6 | Constructeurs/destructeurs de widgets composites (libellé, enfants, ancrage 3D) |
| seg062 | 2/2 | Icône/indicateur HUD, résolution par table triée |
| seg065 | 7/7 | **Caméra/viewport** (copie d'état, transformation, clipping frustum near/far) |
| seg066 | 13/13 | Palette VGA, mipmapping de texture, contrôleur de transition pan caméra/HUD |
| seg067 | 3/3 | Moteur générique d'interpolation par table triée avec cache |
| seg068 | 4/4 | Test de rejet bounding-box, aire signée 2D, projection de sommets |
| seg069 | 1/1 | **`Render_ObjectPipelineMain` (2623L)** — pipeline principal de rendu d'objets 3D |
| seg070 | 7/7 | Orchestration du rendu de modèles 3D (avions, sous-composants) |
| seg071 | 6/6 | **Rendu de terrain** : heightfield, tuile texture, LOD adaptatif |
| seg072 | 9/9 | Cache de tuiles de terrain (allocation heightmap, éviction LOD) |
| seg073 | 8/8 | Streaming de secteurs terrain (index, chargement à la demande) |
| seg074 | 1/1 | **`sub_345D6` (2938L)** — pipeline principal de rendu du terrain |
| seg075 | 1/1 | Dispatcher rasterizer plat/perspective (confirme le rôle du seg037) |
| seg076 | 7/7 | Picking/sélection de pièce de modèle 3D |
| seg077 | 8/8 | Coordination LOD terrain entre patches adjacents |
| seg078 | 15/15 | **Physique de corps rigides pour débris** (forces, couples, gravité) |
| seg079 | 9/9 | Génération de débris (chargement modèle, cache, instanciation) |
| seg080 | 11/11 | Effets visuels d'explosion (particules, boule de feu) |
| seg081 | 10/10 | **Registre de pointeurs faibles (`SetReference`)** |
| seg082 | 1/1 | **`JDYN_LoadChunk` (577L)** — chargeur du chunk physique JDYN |
| seg083 | 1/1 | **`IFF_LoadModelMain` (1699L)** — chargeur principal de modèles IFF |
| seg084 | 5/5 | Constructeurs de la classe de base des objets du monde |
| seg085 | 18/18 | **Caméra externe/chasse** (attachement point de montage, suivi cible secondaire) |
| seg086 | 5/5 | Destructeurs composés du système de caméra externe |
| seg087 | 3/3 | Commande de pilotage bas niveau (lien avec sub_49242), cadran d'instrument |
| seg088 | 11/11 | **Moteur HUD/viseur** (2 fonctions ~2000L) + gestion d'armement + chaff/flare |
| seg089 | 7/7 | Physique et audio 3D des leurres chaff/flare déployés |
| seg090 | 3/3 | Déclenchement de sons 3D positionnels (portée d'écoute) |
| seg091 | 8/8 | **Verrouillage/acquisition de cible** pour le tir (fenêtre angulaire réticule) |
| seg092 | 1/1 | Génération probabiliste d'effet visuel périodique (fumée/traînée) |
| seg093 | 6/6 | Système de roster de pilotes (recherche par nom, stats agrégées) |
| seg094 | 16/16 | **Détection de collision par grille spatiale** (broad+narrow phase) |
| seg097 | 5/5 | Guidage terminal de missile (portée, plan d'impact, fuze de proximité) |
| seg098 | 1/1 | Duplicat overlay caméra externe |
| seg099 | 2/2 | Composant caméra externe (variante copie de statut) |
| seg100 | 2/2 | Wrapper chargeur IFF angle + duplicat overlay caméra |
| seg101 | 7/7 | Intégrateur physique, contrainte de hauteur sol (terrain↔physique) |
| seg102 | 23/23 | **Calcul aérodynamique JDYN** : moments de contrôle, coefficients avec saturation |
| seg103 | 21/21 | **Tick physique JDYN principal** (1422L) + `flags_75` (aérofrein/train/volets) + guidage `sub_49242` |
| seg104 | 2/2 | Chargeur du chunk IFF INFO (métadonnées modèle) |
| seg105 | 3/3 | Config caméra/débris divers |
| seg106 | 9/9 | Émetteur de particules — buffer circulaire (fumée/traînée) |
| seg107 | 8/8 | Émetteur de particules — construction, attachement, jitter, dérive vent |
| seg108 | 2/2 | Détection de changement sur groupe de paramètres de calibration |
| seg109 | 11/11 | Stubs de classe (vtable), destructeurs scalar-deleting, trigger d'effet à retardement, **candidat tick physique avion** (appelle `Aero_ComputeForcesMain`), famille de constructeurs composites probablement dupliqués |
| seg110 | 9/9 (+2 non résolues) | Classe minuteur générique complète (Set/SetRelative/Tick + variantes far-ptr + variante à pulsations de clignotement HUD) |
| seg111 | 2/2 | Cyclage de trame d'animation (texture animée), utilisé par le terrain streaming (seg077) |
| seg112 | 7/7 | Sous-système écran/dialogue UI complet (machine à états 645L, lecture/application de formulaire numérique, init/close), globales cluster 0x70447-0x72Bxx |
| seg113 | 2/2 | Rendu direct VGA (segment 0xA000) pour le même écran UI que seg112 |
| seg114 | 63/63 | **Découverte majeure : VM à bytecode générique (`Expr_VM_Interpreter_51106`, 209 opcodes) + système de nœuds à valeurs calculées (`Expr_Node_*`/`GeomNode_*`), utilisé par le HUD, l'IA ET l'UI — voir section dédiée** |
| seg115 | 18/18 | **Bibliothèque trigonométrique complète** (sin/cos/tan/asin/acos/atan/atan2/sqrt/carré, normalisation d'angle, constantes, aléatoire) — socle du cluster IA/HUD/UI |
| seg116 | 62/62 (+11 non résolues) | Cluster géométrie/ciblage/matrices de rotation : `Targeting_AcquireBestThreat` (bearing/élévation), construction de matrices d'orientation par axe, transformation vectorielle, helpers `Damage_SimulationTick` |
| seg117 | 16/16 (+3 non résolues) | **Implémentations brutes des primitives trigonométriques/vectorielles** (sin/cos/tan/asin/acos/atan/sqrt/longueur de vecteur/produit matrice×vecteur) — appelées par tout le cluster seg115-116 |
| seg118 | 1/1 | Construction de table de hachage/dispatch (rôle exact non détaillé) |
| seg119 | 3/3 | Tracé de ligne pointillée/dégradée avec clipping (rendu 3D) |
| seg120 | 2/2 | Rendu de glyphes bitmap (métriques + blitter de runs de pixels), lié au moteur de texte |
| seg121 | 12/12 | Boîte de ciblage HUD (armement) + **découverte : gestionnaire d'interruption matérielle 8259A** pilotant un séquenceur à créneaux |
| seg122 | 7/7 | Suite du cluster boîte de ciblage HUD/séquenceur à minuterie |
| seg123 | 3/3 | Cœur du séquenceur à créneaux (avancer/libérer un emplacement actif — probable contre-mesures ou file de messages) |
| seg124 | 4/4 (+1 non résolue) | Gestionnaire de champ de saisie de texte (`TextRenderer_Main`), placement/validation d'objets texte |
| seg125 | 21/21 | Suite du cluster armement HUD/séquenceur + destructeurs d'objets texte |
| seg126 | 9/9 | Système de registre (résolution/insertion de nœuds), lié au rendu de texte et à l'UI |
| seg127 | 13/13 | **Découverte majeure : sous-système de mémoire paginée par blocs de 16 Ko** (`PagedMemory_*`), avec détection de pilote propriétaire via `int 15h`/1209h |
| seg128 | 16/16 | Classe C++ complète (constructeurs/destructeurs/méthodes virtuelles) encapsulant le système de mémoire paginée et les objets texte paginés |
| seg129 | 15/15 | Classe sœur du système de mémoire paginée (type de ressource distinct, même motif vtable) |
| seg130 | 4/4 | Famille de destructeurs composés (probables duplicats, non vérifiés) pour le cluster objets-texte |
| seg131 | 17/17 | **Gestionnaire de mémoire typée central** (`Memory_TypedFree_5C7B6`, désallocateur générique utilisé dans des dizaines de segments ; table de 7 allocateurs par tag de classe) |
| seg132 | 3/3 | Helpers du gestionnaire de mémoire typée, libération de glyphe en cache (`TextRenderer_Main`) |
| seg133 | 1/1 | Peuplement du tableau d'allocateurs (12 emplacements configurés) |
| seg134 | 12/12 | Classe sœur du cluster mémoire paginée (multi-héritage, tags vtable multiples) |
| seg135 | 1/1 | Construction de chaîne de texte formatée (étiquette d'écran/HUD) |
| seg136 | 1/1 | Validation détaillée de bloc de tas (partie du runtime bas niveau) |
| seg137 | 7/7 | **Runtime Borland bas niveau** : vérification de dépassement de pile, allocateur/désallocateur de tas avec fusion de blocs libres |
| seg138 | 11/11 | Implémentation bas niveau de la classe PagedResourceB (lecture/écriture/init/libération) |
| seg139 | 2/2 | Enregistrement/retrait d'objets dans une liste globale (carte/radar) |
| seg140 | 1/1 | Singleton d'état de formatage de texte (`TextRenderer_Main`) |
| seg141 | 22/22 | Classe « objet mis en cache avec position » (constructeurs/destructeurs/méthodes de transformation), liée au rendu de texte/UI |
| seg142 | 2/2 | Encodage de caractères pour le moteur de texte |
| seg143 | 11/11 | Gestion des attributs/styles de formatage de texte (`TextRenderer_Main`) |
| seg144 | 1/1 | Encodage conditionnel de caractère (texte) |
| seg145 | 2/2 | Génération/validation de table d'index linéaire pour les styles de texte |
| seg146 | 1/1 | Calcul de largeur maximale de ligne de texte multi-lignes |
| seg147 | 1/1 | Calcul de hauteur maximale de ligne de texte multi-lignes |
| seg148 | 1/1 | Calcul de boîte englobante de glyphe (métriques de police) |
| seg149 | 1/1 | Détection matérielle du port CRT (BIOS Data Area, CGA/mono) |
| seg150 | 1/1 | Changement de mode vidéo si nécessaire (int 10h) |
| seg151 | 6/6 | Classe « surface d'affichage » (construction/clonage), liée à un mode vidéo |
| seg152 | 6/6 | Primitives de gestion de membre (clear/free, allocate/copy), constructeur/destructeur de la classe surface d'affichage |
| seg153 | 8/8 | Classe « police/style de texte » (constructeur/destructeur/combinaison de flags gras-italique-souligné-barré), utilisée par `TextRenderer_Main` |
| seg154 | 3/3 | **Découverte : gestionnaire d'exception matérielle** (décodage d'instruction fautive) lié à l'initialisation de la mémoire paginée, installé via `int 15h`/1209h |
| seg155 | 5/5 | Impression de texte/caractères à l'écran bas niveau, utilisée par le gestionnaire d'exception |
| seg156 | 11/11 | Classe liste doublement chaînée générique (insertion tête/queue/avant/après, retrait, tri, comptage) |
| seg157 | 4/4 | Point de synchronisation d'affichage (`DisplayContext_CommitFrame`) utilisé par de nombreuses classes du cluster mémoire paginée/texte |
| seg158 | 4/4 | Rafraîchissement global des instances `PagedResourceC` lors d'un changement de style |
| seg159 | 8/8 | Seconde classe liste chaînée (structure de nœud distincte du seg156) |
| seg160 | 3/3 | **Découverte : gestionnaire d'erreur fatale/assertion du runtime**, appelé notamment par `Render_TerrainPipelineMain` |
| seg161 | 53/53 | **⭐ DÉCOUVERTE MAJEURE : registre de modules à créneaux temporisés (`ModuleRegistry_*`) — détourne IRQ0, reprogramme le PIT 8253, dispatch dynamique par table d'opcodes** — voir section dédiée |
| seg162 | 15/15 | Classe « objet glyphe » avec buffer de rendu et mesure de caractères |
| seg163 | 18/18 | Classe widget avec calcul de bornes/layout, plus grosse fonction non détaillée du segment (331L) |
| seg164 | 1/1 | Calcul d'intersection de rectangles (clip UI) |
| seg165 | 1/1 | Remplissage de région rectangulaire |
| seg166 | 1/1 | Calcul/copie de région de recouvrement entre deux rectangles (blit) |
| seg167 | 1/1 | Tracé d'ellipse/cercle rempli (algorithme type Bresenham), 481L non détaillée |
| seg168 | 1/1 | Clipping et tracé de ligne contre un rectangle de bornage, 428L non détaillée |
| seg169 | 1/1 | Tracé de contour d'ellipse (variante non remplie), 454L non détaillée |
| seg170 | 1/1 | Remplissage de rectangle clippé — primitive 2D de base, 342L non détaillée |
| seg171 | 1/1 | Tracé de pixel unique avec clipping |
| seg172 | 1/1 | Tracé de ligne horizontale clippée, 201L non détaillée |
| seg173 | 1/1 | Rendu de chaîne de texte complète, 496L non détaillée |
| seg174 | 1/1 | Mesure/rendu de chaîne de texte (variante), 457L non détaillée |
| seg175 | 1/1 | Rendu de sprite/icône mis à l'échelle, partagé carte/particules, 675L non détaillée |
| seg176 | 1/1 | Accesseur générique de nombre d'éléments d'un tableau |
| seg177 | 1/1 | Rendu/mesure de texte pour objets mis en cache (variante A), 215L non détaillée |
| seg178 | 1/1 | Calcul de région rectangulaire pour blit avec clipping, 194L non détaillée |
| seg179 | 1/1 | **Rendu de sprite avec rotation, 736L — plus grosse fonction du cluster 2D, non détaillée** |
| seg180 | 1/1 | Rendu/mesure de texte pour objets mis en cache (variante B), 255L non détaillée |
| seg181 | 1/1 | Calcul de région rectangulaire pour blit (variante), 166L non détaillée |
| seg182 | 1/1 | Intersection de rectangles pour blit (variante), 136L non détaillée |
| seg183 | 1/1 | Clipping et tracé de ligne (variante), 369L non détaillée |
| seg184 | 1/1 | Création de fichier DOS avec gestion de reprise sur erreur |
| seg185 | 4/4 | **E/S fichier DOS avec support « gros fichier » via mémoire paginée** (lecture/écriture, seuil configurable) |
| seg186 | 2/2 | Ouverture/fermeture de fichier DOS avec retry configurable |
| seg187 | 1/1 | Positionnement de fichier DOS (LSEEK) avec retry configurable |
| seg188 | 7/7 | Accesseurs de champs typés (byte/word/dword) par handle |
| seg189 | 9/9 | Classe « flux de fichier » (FileStream) complète : construction, lecture par blocs, position |
| seg190 | 33/33 | **Classe « lecteur de flux tamponné » (StreamReader) complète — cœur de lecture typée par handle, utilisée par TextRenderer et de nombreux sous-systèmes divers** |
| seg191 | 9/9 | Registre global de flux ouverts + parseur de valeur/chaîne formatée sur StreamReader |
| seg192 | 7/7 | Méthodes virtuelles complètes de FileStream (Read/Write/Seek/Open/Close/GetSize) |
| seg193 | 34/34 | **Format d'enregistrement structuré (ResourceRecord) — lecture de champs typés séquentiels au-dessus de StreamReader, probable lien avec IFF/JDYN** |
| seg194 | 15/15 | Suite du cluster ResourceRecord : écriture de champs, pont lecture/écriture, recherche/correspondance de sous-enregistrements (351L non détaillée) |
| seg195 | 6/6 | **Écriture typée StreamReader** (pendant de la lecture typée seg190) avec croissance dynamique de tampon |
| seg196 | 13/13 | Classe « lecteur d'enregistrement indexé » (IndexedRecordReader) au-dessus de StreamReader |
| seg197 | 3/3 | **⭐ Décodeur LZW complet** (lecture de codes à largeur variable, table dynamique 9→12 bits) |
| seg198 | 2/2 | Chargement/sauvegarde de ressource via StreamReader (`TextRenderer_Main`) |
| seg199 | 3/3 | **Lecture matérielle du joystick** (port 0x201, mesure RC des 4 axes + boutons) |
| seg200 | 15/15 | Gestionnaire de callbacks joystick (chaîne liée, singleton, notification de valeur) |
| seg201 | 12/12 | Objets « option de configuration » avec formatage/affichage de valeur |
| seg202 | 12/12 | **⭐ DÉCOUVERTE : cœur du système clavier bas niveau** — traitement des scan-codes, modificateurs, file d'événements circulaire |
| seg203 | 13/13 | Liaison entrée (bouton joystick ↔ action) et infrastructure d'installation du gestionnaire clavier |
| seg204 | 14/14 | Objet de défilement de texte animé, avec enregistrement de gestionnaire de tic |
| seg205 | 14/14 | **Lecture de valeurs d'entrée calibrées (référencées par Player_MainUpdate) et verrouillage du curseur souris (int 33h)** |
| seg206 | 1/1 | Constructeur de variante d'objet défilement de texte |
| seg207 | 11/11 | Objet chronomètre, enregistré comme module dans le registre à créneaux temporisés (seg161) |
| seg208 | 25/25 | Système complet de calibration joystick (échantillonnage, zone morte, interpolation) — plusieurs fonctions référencées directement par Player_MainUpdate |
| seg209 | 14/14 | Suite du cluster objet défilement de texte (démarrage/arrêt d'animation) |
| seg210 | 1/1 | **⭐ Gestionnaire d'événement souris (callback int 33h) — alimente les mêmes globales que les axes calibrés lus par Player_MainUpdate** |
| seg211 | 3/3 | **⭐ Point d'installation matériel réel du gestionnaire clavier** (interception BIOS int 15h/4Fh, clôture la découverte seg202-203) |
| seg212 | 30/30 | **Le loader VROOMM lui-même** (parsing d'en-tête MZ, table de relogement, patch de trampolines JMP/INT) |
| seg213-215 | 0/0 | Segments de données uniquement (tables de remplissage), pas de fonctions |
| seg216 | — | Segment de données pur (table de vtables/pointeurs, 1974 lignes), référencé par des centaines d'entrées comme `DATA XREF: seg216:...` — pas de fonctions à documenter |
| seg217-226 | — | **N'existent pas** : la numérotation IDA saute directement de seg216 à stub227 |
| stub227-seg429 | **1006/1006** | **⭐⭐ Table de stubs VROOMM complète (122 segments) — extraite en masse par script, voir section dédiée** |
| seg339 | — | **⭐⭐ Segment de données global du runtime (DGROUP/BSS, 0x6D0B0-0x72F58, ~24 Ko) — 378 chaînes de debug embarquées confirmant des dizaines d'hypothèses de toute la session, voir section dédiée** |
| seg430-431 | 4/4 | Notification de listeners pour le système de trigger temporisé (implémentation d'overlay du seg109) |
| seg432 | 39/39 | **Système de composants de dommages/état du joueur (PlayerComponent)** — chargement IFF, spawn/trigger temporisé, géométrie |
| seg433-435 | 58/58 | Suite du cluster PlayerComponent — constructeurs de variantes, calcul de réponse à l'impact |
| seg436-440 | 20/20 | Suite du cluster PlayerComponent (constructeurs de variantes), plus un widget HUD d'angle d'approche (`HUD_RenderApproachAngleWidget_A0E3F`) |
| seg441 | 2/2 | Sauvegarde/chargement de partie (SaveGame), via le cluster fichier DOS complet |
| seg442 | 57/57 | **Module écran de palette/couleur** (PaletteScreen) — manipulation directe du DAC VGA, courbes/dégradés personnalisés |
| seg443 | 6/6 | Pont entre le module palette et le cluster widget générique (seg163) |
| seg444 | 57/57 | **Module widget jauge/indicateur** (GaugeWidget) — liste chaînée, 5 modes de rendu |
| seg445 | 4/4 | Suite du widget jauge : dessin avec étiquette, détection de survol/clic |
| seg446 | 20/20 | Widget d'information (InfoWidget) — accesseurs/mesure-rendu de texte, réutilise le verrou d'ownership du seg442 |
| seg447 | 6/6 | Suite du cluster PlayerComponent (chargement IFF) |
| seg448 | 28/28 | Grande famille de constructeurs de variantes PlayerComponent (jusqu'à 3 sous-objets composites) |
| seg449 | 10/10 | Suite PlayerComponent — chargement massif de propriétés visuelles/matériau (jusqu'à 30 champs) |
| seg450 | 10/10 | **Chargement et formatage de texte de mission (dialogue/briefing) depuis le format IFF compressé** |
| seg451-452 | 9/9 | Suite PlayerComponent, calcul de paliers d'interpolation/animation |
| seg453 | 5/5 | Constructeur de la classe liée au trigger temporisé (tag 32F6h, cf. seg109), spawn d'objets |
| seg454 | 15/15 | Système de cycle de texte/dialogue (TextCycler), sélection aléatoire d'entrées |
| seg455 | 13/13 | **⭐ Chargeur de mission (MissionLoader) — lié à l'écran de mission planning du seg112, spawn d'entités** |
| seg456 | 18/18 | Chargeur de scénario de mission (MissionScenario), lié au système Expr_VM/Node (seg114) |
| seg457 | 46/46 | Gestionnaire de slots de valeurs pour le système Expr/GeomNode |
| seg458-461 | 27/27 | **⭐⭐ Cluster `sub_ABxxx` (AudioQueue) — résout la question ouverte du consommateur du registre de modules (seg161), probable file de messages radio/audio indexée** |

**Fichier entièrement couvert.**
| seg441-461 | 0/~ | 21 segments de code restants, à couvrir |
| seg211 | 3/3 | **⭐ Point d'installation matériel réel du gestionnaire clavier** (interception BIOS int 15h/4Fh, clôture la découverte seg202-203) |
| seg212 | 30/30 | **Chargeur d'exécutable/overlay DOS personnalisé** (parsing d'en-tête MZ, table de relogement, patch de trampolines JMP/INT) |
| seg213 | 0/0 | Segment de données uniquement (table de remplissage 0xFF, pas de fonctions) |
| seg214 | 0/0 | Segment de données uniquement (table de remplissage 0x00, pas de fonctions) |
| seg215 | 0/0 | Segment vide |

## Fichiers

- **known_functions.json** — base cumulative : pour chaque `sub_XXXX` d'origine,
  le nouveau nom proposé, le segment, et le résumé mécanique (français).
- **name_mapping.json** — mapping simple `ancien_nom -> nouveau_nom`.
- **segXXX_annotated.asm** (28 fichiers) — désassemblage IDA d'origine avec les
  `sub_XXXX` remplacés par `NouveauNom_XXXX` (adresse conservée en suffixe),
  un fichier par segment couvert, lisible directement sans IDA.

## Convention de nommage

`Categorie_RoleCourt_ADRESSE`, ex. `AI_ThrottleController_6250`,
`Goal_IsComplete_A6D3`, `Radio_PlayMessage_CB45`. L'adresse d'origine reste en
suffixe pour recoupement avec strike.map et les futures sessions.

## Découvertes majeures de cette session

1. **Système de GOAL complet** (seg005/006) : `Goal_IsComplete` + `Goal_ExecuteAction`
   dispatchent sur le même switch 11 cas (code d'état `+0x11D`), avec handlers
   concrets par type (wander, waypoints, RTB, formation).
2. **Chatter radio** (seg006/031) : gatekeeper anti-répétition (`Radio_CanPlayMessage`),
   lecteur de message (`Radio_PlayMessage`), file de slots actifs avec timers
   (`RadioQueue_*`, max 8 messages concurrents).
3. **Physique/guidage de missile** (seg008) : tick dédié + détonateur de proximité,
   partage le seuil `dword_7201C` avec les alertes de menace du seg003.
4. **Statistiques pilote** (seg004) : 4 attributs (`+0xB0/B1/B6/B7`) pilotant des
   tests de compétence façon jet de dé — base du système de difficulté IA.
5. **Moteur audio 3D** (seg022) : calcul de pan stéréo et effet Doppler à partir
   de la position/vitesse relative source-auditeur.
6. **Lexer/parseur du format script IA** (seg029) : correspond très probablement
   au parseur PROF/_AI_ déjà documenté dans le projet — tokenizer, avance/recul,
   résolution de symboles/constantes, et un compilateur à switch 10 cas qui émet
   du bytecode par type de token.
7. **Classe C++ String** (seg026) et **framework UI complet** (seg017/023/024/025/028) :
   conteneurs à enfants notifiés par vtable (init/update/draw), bitset, grille,
   tooltips, accesseurs générés par le compilateur Borland C++.
8. **Gestionnaire de mémoire étendue EMS** (seg035/036) : allocation/mapping de
   pages EMS pour streamer l'audio de briefing/dialogue au-delà de 640K. Corrige
   une hypothèse de la session précédente : `RadioQueue_ExpireTimer_1EFFE` (seg031)
   n'appelle pas un "déclenchement de son" mais un **changement de page EMS**
   (`EMS_MapPage_2075B`).
9. **Moteur de rendu 3D/polygonal** (seg037) : 4 fonctions massives (566-849 lignes)
   avec stub d'alignement de pile généré par le compilateur (arguments 32-bit) et
   rasterisation avec clipping style Cohen-Sutherland — cœur probable du rendu
   terrain/mesh du jeu, non détaillé (voir tableau ci-dessous).
10. **Bibliothèque de conteneurs C++ génériques** (seg039) : listes chaînées,
    dictionnaire clé→valeur (recherche/insertion/suppression par clé courte),
    garbage collector périodique, et surtout `World_IterateObjects_224DA` —
    la fonction d'itération centrale de tous les objets du monde de jeu (avions,
    missiles, entités), référencée par des dizaines de fonctions IA déjà
    documentées dans les sessions précédentes.
11. **Journal de mission / kneeboard complet** (seg040/041) : déclenché par des
    triggers scriptés (proximité, difficulté, état du joueur), avec constructeurs
    d'entrées liées à un objet ou en texte libre, moteur de rendu à 20 cas selon
    le type d'événement, recherche/sélection par identifiant, et nettoyage
    automatique quand une cible référencée est détruite.
12. **Système de keyframe/animation et caméra scriptée** (seg042/054) : position,
    vitesse et easing d'interpolation, probablement lié aux séquences de caméra
    cinématique (tags `CAMR`/`ATCH` repérés dans `Cinematic_LoadCameraDef_23E7D`).
13. **Cœur du moteur de rendu 3D complet, de bout en bout** : primitives bas
    niveau (pixel/ligne, seg044/045) → edge-setup et rasterizer de triangle
    (seg046) → préparation géométrique des faces (arêtes, normales, centroïdes,
    teintes de dommage, seg055/059) → backface culling par produit scalaire
    (seg058). `Render_TriangleRasterizer_26A60` et les 4 fonctions du seg037
    (566-849 lignes) en sont le cœur.
14. **`PIT_ReadHighPrecision_27144`** (seg047) : lecture haute précision du timer
    PIT, appelée directement par le tick physique de vol — c'est la source du
    delta-temps du moteur physique.
15. **`CPU_SpeedCalibration_27E61`** (seg048) : routine de calibration de vitesse
    processeur au démarrage (boucles chronométrées via le PIT) — directement
    pertinente pour le problème de difficulté IA dépendante du matériel déjà
    noté dans le projet.
16. **`TextRenderer_Main_27477`** (seg048, 1158 lignes) : la plus grosse fonction
    identifiée à ce jour, candidate très forte pour le moteur de rendu de texte
    principal du jeu (menus, briefings, HUD), utilisant le système de police
    SM-FONT chargé au démarrage.
17. **`Path_ResolveDataFile_2B06C`** (seg057) : fonction centrale de résolution
    des chemins de fichiers de données (`..\..\DATA\<sous-dossier>\<nom>`),
    déjà croisée dans le chargement de la police et du pack audio "Betty".
18. **Système de dommages structurels complet** (seg060) : sélection pondérée
    du composant en panne selon une table de probabilités liée à la difficulté,
    timer de vérification périodique, réinitialisation des flags, résolution
    des positions sur le diagramme de dommages du cockpit — le calcul par tick
    (`Damage_SimulationTick_2BF6C`, 1019 lignes) reste à approfondir.
19. **Caméra/viewport** (seg065/066) : copie d'état caméra, transformation d'un
    point dans l'espace caméra (avec ou sans parent), test de clipping du
    frustum (near/far + bords écran), gestion du rectangle de clipping, et
    contrôleurs de transition douce (pan azimut/élévation) pilotant le cockpit —
    cohérent avec les définitions de caméra scriptée (tags `CAMR`) du seg041.
20. **Pipeline de rendu 3D complet, du sommet au pixel** (seg067-077) : moteur
    d'interpolation générique (partagé keyframe/mipmap), `Render_ObjectPipelineMain`
    (seg069, 2623 lignes) et `sub_345D6` (seg074, 2938 lignes) — les deux plus
    grosses fonctions de la base, respectivement pipelines principaux de rendu
    d'objets et de terrain — orchestration de modèles, système complet de rendu
    de terrain (heightfield, tuiles, streaming par secteur, LOD adaptatif entre
    patches), et système de picking/sélection de pièce de modèle.
21. **Physique et effets de destruction** (seg078-080) : simulation de corps
    rigides pour les débris (accumulation de forces/couples, gravité, transfert
    récursif vers un parent, collision), génération de débris avec cache de
    modèles, et effets visuels d'explosion (particules, sphère de boule de feu
    "BIGSPHER") — complète la chaîne dommages structurels (seg060) → physique →
    rendu visuel.
22. **`SetReference` — le registre de pointeurs faibles du moteur** (seg081) :
    `sub_3A44E`, référencée des centaines de fois dans tout le code IA/GOAL
    depuis le début de l'analyse mais jamais élucidée jusqu'ici, s'avère être
    la fonction centrale d'assignation sécurisée de pointeurs vers des objets
    destructibles, avec nettoyage automatique coordonné avec le garbage
    collector des conteneurs (seg039).
23. **Chargeurs IFF/JDYN** (seg082-084) : `JDYN_LoadChunk` (577 lignes) charge
    le chunk physique JDYN déjà documenté dans le projet ; `IFF_LoadModelMain`
    (1699 lignes) est le point d'entrée principal du chargement de tout modèle
    3D (`OBJECTS\*.IFF`) ; et la classe de base des objets du monde combine
    corps physique + rendu + UI.
24. **Caméra externe/chasse** (seg085/086/098/099/100) : système complet de
    caméras de poursuite typiques des simulateurs de vol — attachement à un
    point de montage ou suivi orienté vers une cible secondaire, avec
    plusieurs duplicats identifiés par l'overlay VROOMM (`sub_45C0D`,
    `sub_46164` sont des copies exactes de `Camera_InitAttachedWithTarget`).
25. **Moteur HUD/viseur et gestion d'armement** (seg087-091) : deux fonctions
    massives (`HUD_RenderSymbologyMain`, 1882L, et `HUD_RenderSymbologyAlt`,
    2016L) forment le rendu de la symbologie du viseur ; complétées par la
    résolution des stations d'armement (hardpoints), le largage de
    contre-mesures chaff/flare (avec physique et audio 3D dédiés), et le
    système de verrouillage/acquisition de cible (fenêtre angulaire du
    réticule, priorisation par type d'arme).
26. **Détection de collision par grille spatiale** (seg094) : découverte
    majeure — grille 8×8 centrée sur le joueur, réinitialisée et repeuplée
    chaque frame (`CollisionGrid_InitAroundPlayer`), avec une passe broad-phase
    (`CollisionGrid_BroadPhaseScan`) puis narrow-phase filtrée par catégorie
    (`Collision_NarrowPhaseTest`), orchestrée par `Collision_MainLoop`.
27. **Guidage terminal de missile** (seg097) : portée de recherche/acquisition
    (seuil 3200 unités), calcul du plan d'impact avec la cible verrouillée,
    et déclenchement de la fuze de proximité (seuil 64 unités) — complète
    directement la physique de missile déjà documentée en seg008.
28. **Système de roster de pilotes** (seg093) : recherche par nom et
    statistiques agrégées (probable total de victoires/rang), lié à la
    gestion de campagne/escadrille.
29. **Cœur complet du moteur physique de vol JDYN** (seg101-103) — *voir la
    section « Physique de l'avion — RÉSOLUE » en tête de fichier et
    `DATA_MODEL.md` §6.2 pour l'analyse à jour.* Tick = **`PhysicsTicks`**
    (seg103, ~0x4A85B), PAS `Guidance_HomingVelocityUpdate_49C2E` (ex-mal-nommé
    `JDYN_PhysicsTickMain`, qui est le pilote automatique/homing). Bilan de
    forces en repère corps : poussée sur l'axe nez, **portance explicite**
    (`Aero_ComputeLiftAndSideForce`, `L = k·α_eff·q`), traînée
    (`Aero_ComputeDragWithFeedback`), gravité ; intégrateur d'Euler
    (`Physics_IntegratePosition`, transform corps→monde) ; asservissement
    d'attitude en `±2·√(q'·err)` (`Aero_ComputeForcesMain`) ; contrainte de
    hauteur sol (`Physics_ApplyGroundHeightConstraint`).
    `Pilot_SteeringCommandToTarget` (`sub_49242`) = loi de guidage vers cible.
30. **`flags_75` — bits confirmés par le porteur du projet** : bit0 = aérofrein
    sorti, bit2 = train d'atterrissage sorti (tous deux → traînée additionnelle
    `jdyn[0x37]`/`jdyn[0x3B]`) ; bit1 = volets sortis → ajoute `jdyn[0x4D]`
    (incrément de portance des volets) à l'incidence effective `α_eff` dans
    `Aero_ComputeAoAWithTrim`. bit5 = physique « gelée » (forces annulées sauf
    gravité) ; bit6 = alerte départ (dépassement de `jdyn[0x4B]` = α décrochage,
    difficulté élevée, joueur).
31. **Système d'émetteur de particules complet** (seg106/107) : buffer
    circulaire avec insertion/retrait/allocation, construction et attachement
    à un point du modèle, calcul de position de spawn avec jitter aléatoire,
    dérive de vent, résolution de couleur RGB — utilisé pour fumée/traînées,
    y compris depuis le moteur HUD (probable effet visuel sur le réticule).

## ⭐ Découverte majeure de cette session : VM à bytecode transversale (seg109-114+)

En remontant `Player_MainUpdate` (`sub_13100`) et `HUD_RenderSymbologyMain`
(`sub_3E744`) pour la question ouverte de la physique du joueur, l'analyse de
seg109-114 a mis au jour un **sous-système générique inattendu, partagé par
au moins trois systèmes du jeu (HUD, IA de vol seg004, UI seg112-113)** :

- **`Expr_VM_Interpreter_51106`** (seg114, 1877 lignes) : interpréteur de
  bytecode avec **switch à 209 opcodes** (table de sauts `off_51CA8`), pile
  de valeurs, et un mécanisme d'appel de fonctions natives
  (`Expr_VM_CallNativeFunction_52513`, table de descripteurs 9 octets/entrée).
- **Nœuds à valeurs calculées (`Expr_Node_*`)** : chaque nœud porte un ou
  plusieurs champs dont la valeur est soit mise en cache, soit recalculée à
  la demande via un bit "dirty" (`Expr_Node_RecomputeIfDirty_524B4`,
  `Expr_Node_ForceRecompute_5247D`) en exécutant un bytecode associé
  (`Expr_VM_Execute_51E7E`) — motif classique de graphe de dépendances
  "façon tableur".
- **`GeomNode_SumOffsetsUpChain_50EEB`** : cumule des offsets de position
  (X/Y/Z) en remontant une chaîne de nœuds parents — calcul de position
  résolue dans une hiérarchie d'attache.
- **Hiérarchie de formes de collision (`HitShape_*`)** : Sphere/Box/Radial2D
  avec stubs de tag de classe (motif vtable identique à seg109), pour tester
  si un point tombe dans une région.
- **Preuves d'usage transversal, à confirmer par lecture approfondie** :
  - `Player_ResolveAttachPointN_5305A` est appelée **directement par
    `Player_MainUpdate`** (2 sites d'appel) — candidat pour la résolution de
    points d'attache/hardpoints de l'avion du joueur.
  - `HUD_ResolveNodePosition_547B1` est appelée **directement par
    `HUD_RenderSymbologyMain`** — positionnement d'éléments de symbologie.
  - `AI_ResolveNodePosition_54274` est référencée **depuis seg004** (cœur IA
    de vol/combat) — résolution de position de référence pour l'IA.
  - `UIScreen_ConstructWidgetBinding_536F7` relie widgets et champs calculés,
    et appelle directement `UIScreen_StateMachineMain_4FBF1` (seg112).

**Hypothèse de travail (non confirmée)** : ce système serait un moteur de
"nœuds de scène/attache à valeur calculée" générique du moteur RealSpace,
utilisé aussi bien pour positionner un symbole HUD, un point de calcul IA,
qu'un widget d'écran — plutôt qu'un système propre à un seul sous-système.
**`Expr_VM_Interpreter_51106` n'a été lu qu'en mode rapide (repérage du
switch, pas des 209 cas un par un)** — c'est désormais la priorité n°1 pour
une session dédiée, avant `sub_345D6`/`Render_ObjectPipelineMain`.

## ⭐ Découverte majeure (2) : sous-système de mémoire paginée (seg124-128)

En poursuivant l'inventaire depuis le cluster séquenceur (seg121-123),
seg124-128 ont révélé un **second sous-système structurel important** : un
gestionnaire de mémoire paginée par blocs de 16 Ko, avec sa propre détection
matérielle et sa propre classe C++ d'encapsulation.

- **Détection de pilote propriétaire** (`PagedMemory_DetectDriverSignatureA/B_5B7F1/5B802`,
  seg127) : utilise `int 15h` fonction 1209h avec des signatures `"sm"`/`"SM"`
  — probablement un TSR maison détectant sa propre présence (le nom du jeu
  suggère un lien avec "Strike Commander").
- **Traduction d'adresse paginée** (`PagedMemory_ResolveAddress_5BBCC`,
  seg127) : découpe une adresse en page (`shr 14`) et décalage (`and 0x3FFF`,
  soit des pages de 16 Ko), avec repli sur la mémoire conventionnelle si le
  pilote étendu n'est pas détecté.
- **Classe C++ complète** (seg128) encapsulant le système avec constructeurs,
  destructeurs, méthodes virtuelles Read/Write/Init/Query — au moins deux
  classes sœurs/dérivées identifiées (tags vtable différents).
- **Lien avec le rendu de texte** : `PagedMemory_ReadTextResource_5C14E` et
  `Registry_LookupForTextRenderer_5B5D9` sont référencées directement par
  `TextRenderer_Main` (sub_27477, seg048) — **hypothèse de travail** : ce
  système sert à stocker les textes/dialogues de mission au-delà des 640 Ko
  de mémoire conventionnelle DOS, chargés à la demande depuis de la mémoire
  étendue/expansée.

**Non vérifié en détail** : le rôle exact des données stockées (dialogues de
mission ? textes de briefing ? tables de traduction ?) reste hypothétique —
`PagedMemory_ReadFormattedString_5BE40` (279L) serait la meilleure candidate
pour confirmer par une lecture approfondie.

## ⭐ Découverte majeure (3) : gestionnaire de mémoire typée central (seg129-133)

En continuant sur seg129-133, l'inventaire a mis au jour le **désallocateur
générique utilisé dans toute la base de code** :

- **`Memory_TypedFree_5C7B6`** (seg131) : référencé dans des dizaines de
  segments à travers tout le projet (le xref le plus dense observé jusqu'ici),
  fonctionne comme un « operator delete » générique — reçoit un tag de type,
  une taille, et un octet d'indice d'allocateur (0-6), résout l'allocateur
  correspondant dans une table indexée par tag (`cs:5C38h`) et dispatche vers
  sa méthode de libération virtuelle.
- **`Memory_ValidateAllocatorIndex_5C9A6`** : fonction de garde vérifiant la
  validité de l'index avant tout accès (lève une erreur sinon).
- **`Memory_AllocatorTableConstructor_5C9D3`** (seg131) construit la table de
  7 allocateurs typés (dont une instance du système de mémoire paginée de
  seg129) ; **`Memory_AllocatorTable_PopulateSlots_5CB99`** (seg133) peuple
  ensuite un second tableau de 6 emplacements.
- **seg129-130** documentent une classe sœur du système de mémoire paginée
  (seg127-128) pour un type de ressource distinct, et une famille de
  destructeurs composés partagés par le cluster objets-texte.

**Hypothèse de travail** : ce gestionnaire de mémoire typée est le "cœur"
d'allocation générique du moteur RealSpace, dont le système de mémoire
paginée (découverte précédente) n'est qu'un des 7 allocateurs enregistrés.
Non vérifié : la nature exacte des 6 autres allocateurs de la table.

## Découverte complémentaire : runtime Borland bas niveau (seg137)

seg137 documente deux fonctions du **runtime C/C++ standard de Borland**
(pas spécifiques au jeu) : `Runtime_StackOverflowCheck_5D22B` (vérification
de dépassement de pile, appelée par l'allocateur générique `sub_658`) et
`Heap_FreeAndCoalesce_5D30E` (désallocateur de tas bas niveau avec fusion de
blocs libres adjacents, appelé par les fonctions `sub_338`/`sub_346`
omniprésentes dans toute la base). Ces deux fonctions confirment que
`sub_658`/`sub_338`/`sub_346`, rencontrées dans presque tous les segments
précédents, sont bien les primitives `malloc`/`free` du runtime, distinctes
du gestionnaire de mémoire typée (`Memory_TypedFree_5C7B6`) qui les utilise
en interne pour ses propres structures.

## Découverte complémentaire (2) : gestionnaire d'exception matérielle (seg154)

En documentant la fin du cluster mémoire paginée, seg154 a révélé un
**gestionnaire d'exception CPU** (`PagedMemory_ExceptionHandler_5EEDD`) :
installé via `int 15h`/1209h avec signature `"SF"` (même mécanisme que la
détection de pilote du seg127), il décode l'instruction fautive (recherche
du préfixe opérande 0x66 et des opcodes 0xF6/0xF7, groupe DIV/IDIV/TEST) —
probable gestionnaire de division par zéro ou d'opcode invalide déclenché
par l'accès à la mémoire paginée. Il est appelé depuis
`PagedMemory_InitSubsystem_5BB0D` (seg127), confirmant le lien. seg155
documente les primitives d'impression texte bas niveau qu'il utilise
probablement pour afficher un message de diagnostic. **Non vérifié en
détail** : le mécanisme exact de l'exception (pourquoi une division ou un
opcode invalide serait déclenché) reste hypothétique.

## Découverte complémentaire (3) : gestionnaire d'erreur fatale du runtime (seg160)

`Runtime_FatalErrorHandler_5F700` (seg160) est le gestionnaire
d'assertion/erreur fatale du jeu, référencé dans des dizaines de fonctions
à travers toute la base — y compris directement depuis
`Render_TerrainPipelineMain` (sub_345D6, seg074, la plus grosse fonction du
projet). Il résout le nom de la classe fautive via le gestionnaire de
mémoire typée (tag 5C44h), imprime un diagnostic à l'écran, puis termine
probablement le programme. Ceci confirme que le moteur dispose d'un système
d'assertions internes cohérent avec les autres découvertes runtime
(vérification de dépassement de pile, gestionnaire d'exception matérielle).

## ⭐ Découverte majeure (4) : registre de modules à créneaux temporisés (seg161)

En documentant seg161, l'inventaire a mis au jour un **framework complet de
callbacks temporisés matériels**, jusqu'ici invisible derrière les
« fonctions `sub_603xx` non documentées » signalées dans les sessions
précédentes (cluster séquenceur seg121-123) :

- **`ModuleRegistry_HookTimerIRQ_5FCCA`** détourne le vecteur d'interruption
  matérielle **IRQ0 (INT 8, minuteur)** : sauvegarde l'ancien vecteur, en
  installe un nouveau pointant vers `ModuleRegistry_TimerISR_5FBBE`.
- **`ModuleRegistry_ProgramPITFrequency_5FD3A`** reprogramme directement la
  puce **8253/8254 (PIT)** (ports 0x43/0x40) pour changer la cadence du
  tic matériel — `ModuleRegistry_SetTickRateHz_5FD5D` convertit une
  fréquence en Hz vers le diviseur approprié.
- **`ModuleRegistry_RegisterModule_5FF08`** / **`UnregisterModule_5FFBD`**
  gèrent une **table de 16 emplacements** ; chaque module enregistré fournit
  un pointeur de gestionnaire (far ptr) et une cadence. Au premier
  enregistrement, le système s'initialise et détourne IRQ0 ; au dernier
  désenregistrement, il restaure tout.
- **`ModuleRegistry_TimerISR_5FBBE`** (le corps de l'ISR installée) : à
  chaque tic matériel, parcourt les 16 emplacements actifs, accumule le
  temps écoulé, et **appelle le gestionnaire enregistré** dès que le seuil
  configuré est atteint — avec garde de réentrance, pile privée, et un
  auto-test d'intégrité (chaîne magique "Test") qui déclenche un `int 3`
  (trap debugger) en cas de corruption détectée.
- **`ModuleRegistry_DispatchTrampoline_5FBA6`** est le point d'entrée commun
  d'une **vingtaine de « thunks d'opcode »** dispersés dans des dizaines de
  segments (dont les `sub_603xx` du cluster séquenceur, mais aussi des
  fonctions du `TextRenderer_InputFieldHandler`, seg124, et du cluster
  `sub_ABxxx` pas encore couvert) : chaque thunk pose un identifiant
  d'opcode dans AX puis saute au trampoline, qui réécrit l'adresse de
  retour de l'appelant pour rediriger l'exécution vers un gestionnaire
  enregistré — un **mécanisme de hook/plugin transparent**.

**Ceci résout une question ouverte de longue date** : les fonctions
`sub_603xx` appelées massivement par `Sequencer_AdvanceActiveSlot_59F1D`,
`Sequencer_ProcessQueue_59FF5` et `Sequencer_ValidatePlacement_5A62A`
(seg121-124) sont maintenant identifiées comme des **thunks d'opcode** vers
ce même registre de modules — le séquenceur de contre-mesures/messages
n'est donc probablement pas un système autonome mais un **module de plus
enregistré dans ce framework temporisé générique**, aux côtés du
`TextRenderer_InputFieldHandler` et d'autres consommateurs.

**Non vérifié en détail** : `ModuleRegistry_TimerISR_5FBBE` (89 lignes) n'a
été lue qu'une fois, sans trace exhaustive de chaque branche ; le cluster
`sub_ABxxx` qui utilise aussi ce système reste à couvrir.

## ⭐ Découverte majeure (5) : décodeur LZW (seg197)

En documentant le cluster IndexedRecordReader (seg196), l'inventaire a mis
au jour un **décodeur LZW complet** (`LZW_Decompress_66068`, seg197) :

- Initialise une largeur de code à 9 bits, une table de 512 entrées
  (2^9), et le premier code libre à 258 (256 codes de base + code
  « clear » 256 + code « fin » 257) — paramétrage LZW classique
  (comparable au format GIF).
- `LZW_ReadCode_65FCE` extrait les codes à largeur variable depuis un flux
  de bits packés (décalage/masquage sur des compteurs de position).
- Appelée directement par `IndexedRecordReader_ReadIndexTable_65B73`
  (seg196), qui charge la table d'index du format d'enregistrement
  structuré ResourceRecord découvert au lot précédent.

**Conclusion probable (non confirmée en détail)** : les grosses ressources
du format ResourceRecord (textures ? modèles ? données de mission ?)
peuvent être stockées compressées en LZW. Aucune lecture exhaustive du
décodeur n'a été faite — les 258 premiers codes correspondant peut-être à
des symboles à un octet (0-255) plus les deux codes de contrôle, mais la
table de correspondance dictionnaire n'a pas été tracée en détail.

## ⭐ Découverte majeure (6) : le système clavier, enfin localisé (seg202-203)

Après plusieurs sessions où « trouver la lecture clavier » figurait comme
priorité ouverte, seg202 en documente le cœur :

- **`Keyboard_ProcessScanCode_66AC4`** : reçoit un scan-code, compose un
  octet de modificateurs (Shift si code≥0x80, plus Verr.Num/Verr.Maj/Ctrl/
  Alt via des globales dédiées), consulte une table de gestionnaires par
  scan-code (256 entrées) et pousse l'événement dans une file circulaire.
- **`Keyboard_PushEventToQueue_66C9D`** : implémentation classique de file
  circulaire (compteur, index d'écriture, retour à zéro).
- **`Keyboard_InitSystem_66C34`** : configure le pointeur et la capacité de
  la file, puis installe `Keyboard_ProcessScanCode_66AC4` comme gestionnaire
  pour les 255 scan-codes possibles.

seg203 documente l'infrastructure d'enregistrement (masque de gestionnaires,
allocation/libération) ainsi qu'un système de **liaison bouton-joystick ↔
action** qui réutilise le gestionnaire de callbacks joystick du seg200 — le
clavier et le joystick partagent donc une partie de leur infrastructure de
liaison d'entrée.

**Non vérifié en détail** : le lien exact entre cette file d'événements et
la boucle de jeu principale (où sont consommés ces événements) n'a pas été
tracé — seule l'écriture dans la file est confirmée, pas la lecture.

## ⭐ Découverte majeure (7) : la souris comme entrée de jeu, et généralisation du registre de modules (seg206-210)

En documentant le cluster de calibration joystick (seg208), l'inventaire a
mis au jour deux confirmations importantes :

- **`Mouse_EventCallback_68109`** (seg210) : un gestionnaire d'événement
  souris de style callback `int 33h`, avec préambule en code machine brut
  et bascule sur pile privée (même style que les gestionnaires d'exception/
  interruption déjà rencontrés, seg154/seg161). Il stocke les coordonnées
  reçues dans `word_72E68`/`word_72E6A` et pose `word_71200 = 1`.
  **Correction (fait vérifié côté données, session ultérieure)** : ce ne sont
  PAS des axes de pilotage. `word_72E68/6A` est une **paire partagée gardée
  par `word_71200`** : en vol (`== 0`) elle porte les axes joystick / touches
  curseur lus par `Player_MainUpdate` (tangage `÷3`, roulis `÷0x0A`) ; en mode
  souris (`== 1`) elle porte les coords souris pour la **vue 3D du cockpit**
  (chemin `Cockpit_ProcessInputFrame` / `Mouse_InitAndRead`). Les deux sont
  **mutuellement exclusifs** — `Input_GetCalibrated{X,Y}Value` plante
  volontairement (`Runtime_FatalErrorHandler`, tag 4100h) si `word_71200 != 0`.
  Voir `DATA_MODEL.md §6.2` (« Entrées joueur → état → physique »).
- **`Stopwatch_RegisterTickModule_67611`** (seg207) : un objet chronomètre
  générique qui s'enregistre dans le **registre de modules à créneaux
  temporisés du seg161** — généralisant la découverte initiale (jusqu'ici
  associée principalement au séquenceur de contre-mesures) à un usage plus
  large de minuterie applicative.

**Non vérifié en détail** : le point d'installation exact du callback
souris (`int 33h` fonction 0Ch, typiquement) n'a pas été localisé — seul le
corps du gestionnaire est confirmé. **Rôle souris tranché** : contrôle de la
**vue 3D du cockpit** (pas le pilotage, pas la visée), mutuellement exclusif
avec les axes de vol via `word_71200`.

## ⭐ Découverte majeure (8) : point d'accroche clavier réel, et loader VROOMM identifié en clair (seg211-212)

**seg211 clôt la découverte du système clavier** (seg202-203, session
précédente) : `Keyboard_BIOSInterceptHandler_681BC` est le point
d'installation matériel réel — un gestionnaire d'interception BIOS
(`int 15h` fonction 4Fh, "keyboard intercept", appelée par la routine
d'interruption INT 9 du BIOS pour chaque scan-code). Il bascule sur une
pile privée puis appelle `word_7160C` — exactement le pointeur installé
par `Keyboard_SetHandlerPointer_66EE7` (seg203), qui pointe vers
`Keyboard_ProcessScanCode_66AC4` (seg202). La chaîne complète
matériel→gestionnaire→file d'événements est maintenant confirmée de bout
en bout (seule la consommation côté boucle de jeu reste à tracer).

**seg212 (30 fonctions) est le chargeur d'overlay VROOMM lui-même**
(Borland, cf. `github.com/NancySadkov/devroomm` déjà référencé pour
seg000) : recherche et ouverture du fichier "strike.exe" (chaîne
embarquée), lecture et interprétation d'en-tête MZ
(`VROOMM_ComputeSizeFromHeader_689F1`, arithmétique standard
pages/paragraphes), parcours de la table de relogement, déplacement de
l'image en mémoire, et **patch direct de trampolines** — écriture
d'instructions machine `JMP FAR` (0xEA) et `INT` (0xCD) à des offsets
calculés dans l'image chargée (`VROOMM_PatchFarJumpTable_6887B`/`688D7`,
`VROOMM_PatchIntTrampoline_688F5`) : c'est exactement le mécanisme par
lequel VROOMM réécrit les points d'entrée des segments d'overlay pour les
rediriger vers le gestionnaire d'overlay au lieu du code original. Toutes les fonctions du segment sont nommées `VROOMM_*` dans
known_functions.json.

## ⭐⭐ Découverte majeure (11) : le système de composants de dommages/état du joueur (seg430-435)

Premier code réel après la traversée de la table de stubs VROOMM (122
segments) et du segment global seg339, seg430-435 forment un cluster
cohérent d'environ 100 fonctions consacré à la **gestion des composants de
l'avion du joueur** (dommages, état, configuration), chargés depuis le
format IFF/ResourceRecord déjà documenté (seg193-194) :

- **`WeaponId_ToTypeMask_9DE60`** (seg432, anciennement `PlayerComponent_IndexToFlagMask`) convertit un identifiant d'arme (0-12) en masque de bit ; correction du 2026-09-20 : ce ne sont pas des composants de dommages, les 13 cas sont les 13 `weapon_id` (voir `AI_TICK_CALL_GRAPH.md`, masques d'armes).
- Une famille de **constructeurs de variantes** (`PlayerComponentVariantA`
  à `N`) suit un motif récurrent : allocation, initialisation de deux
  classes de base, initialisation de sous-objets composites (`sub_6CACA`
  et apparentés, motif déjà documenté en seg109), enregistrement dans un
  conteneur.
- **`TimedTrigger_SpawnAndBindGeometry_9E289`** (419L) relie explicitement
  ce cluster au système de trigger temporisé du seg109
  (`Trigger_TimedRangedSpawnOnce_4F351`) : instanciation d'objet, référence
  faible (`SetReference`, `sub_3A44E`), ajout à liste membre — c'est très
  probablement **l'implémentation d'overlay réelle** vers laquelle
  pointaient les stubs fixes du seg109/seg430-431.
- **`PlayerComponent_ComputeImpactResponse_A089D`** (202L, seg435) combine
  géométrie de formation, direction de missile et transformation
  matricielle — probable calcul de réponse d'un composant à un impact.

Une trentaine de fonctions restent flaguées « non détaillée » (grandes
tailles, motifs répétitifs de constructeurs de variantes) — candidates
pour une passe dédiée si le détail exact de chaque type de composant/
variante doit être établi.

## ⭐⭐⭐ Découverte majeure (10) : seg339, le segment global — confirmation massive par les chaînes de debug

seg339 est le segment de données global du runtime Borland (DGROUP/BSS),
couvrant l'adresse 0x6D0B0 à 0x72F58 (~24 Ko) — c'est le segment qui
contient TOUTES les variables globales (`word_XXXXX`, `dword_XXXXX`,
`byte_XXXXX`) référencées par nom dans les 2678 fonctions déjà
documentées à travers toute la session. Il contient aussi **378 chaînes
de caractères en clair**, embarquées par le compilateur Borland C++
(messages d'erreur, textes de debug, chemins de fichiers, noms de
ressources). Ces chaînes proviennent du code source original et
confirment, avec certitude et non plus par hypothèse, un grand nombre de
découvertes de cette session :

**Mémoire typée / EMS (confirme seg127, seg131) :** la classe s'appelle
littéralement **`MemoryManager`** (« Illegal re-instantiation of
MemoryManger », « Illegal re-initialization of Far/Near memory »). Les 7
allocateurs enregistrés sont bien des **« handlers »** (« handler %d
attached with %ld bytes available », « handler %d off »). Rapport de tas
détaillé : « Current state of EMS heap », « Current state of heap »,
« Free block #%02d at %04X:0000, size = %ld », « Total bytes free/
allocated », « Invalid pointer free », « Far Heap Allocation error
#%04X ».

**Format IFF confirmé en toutes lettres (confirme seg193-194, seg196-197) :**
« Form=%4s », « Chunk=%4s », « NumPacks=%ld », « CurPack=%ld »,
« PackSize=%ld », « PackBase=%ld », « PackLoc=%ld », extension de
fichier « .iff » — le format `ResourceRecord` est très exactement un
FORM/CHUNK IFF avec des « packs » compressés (liés au décodeur LZW
découvert en seg197).

**FileStream (confirme seg189) :** champs de debug « Filename=%s »,
« Length=%ld », « Position=%ld », « Mode=%s » (CREATE/READ/APPEND) —
correspondent exactement aux champs de la classe déjà documentée.

**Clavier/souris (confirme seg202-203, seg210-211) :** messages « keyboard
stack overflow » et « mouse stack overflow » — les files d'événements des
deux gestionnaires d'entrée disposent bien d'une détection de dépassement
documentée.

**Gestionnaire d'erreur fatale (confirme seg160) :** le texte utilisateur
final exact est retrouvé : « Strike Commander has encountered an Error
that it cannot recover from... » suivi d'une invite à contacter Origin
Customer Service avec un « Error Code: %X-%X ».

**Runtime Borland (confirme seg137) :** les 3 messages classiques du
runtime C sont présents tels quels : « Null pointer assignment »,
« Divide error », « Abnormal program termination », plus « print scanf :
floating point formats not linked » (stub de liaison Borland classique).

**Pipeline terrain/rendu — noms de fichiers source retrouvés :** les
messages d'erreur mémoire embarquent littéralement des noms de fichiers
C++ d'origine : « No mem for vertices and triangles in MAPGRI-I.CPP »,
« No mem for DrawTerrainTriangles », « Terrain Vertex overrun - mem
trashed! », « No far mem for element list. », « No mem for fade
palettes. » — confirme et documente en clair le module source du pipeline
terrain (`Render_TerrainPipelineMain`, seg074).

**Contenu de jeu confirmé :**
- Armement (noms complets et codes courts) : AIM-9M, AIM-9J, AIM-120,
  AGM-65D, LAU3, MK20, MK82, Durandal, GBU-15, Vulcan / codes SWDM, SWDJ,
  MVRK, LAU3, MK20, MK82, DRDL, GB15, A120, 20MM.
- Régimes moteur : MIL 0-5 (militaire), AFT 1-5 (post-combustion).
- Modes HUD : NAV, I-R, CCIP, CCRP, E-O, STRF, SRM, MRM, DGFT ; modes
  radar : AIR, AIR 360, GND, GND 360, STT.
- Composants de dommages (confirme `Damage_SimulationTick`, seg060) :
  RUDDER, ELEVATOR, AILERON, LWING, RWING, ENGINE, LANDGEAR, FLAPS.
- Pièces d'objet 3D/hardpoints : FUSELAGE, LWING, RWING, LOWEJECT, CHAFF,
  FLARE, HARDPT#, POD, GUN, BIGSPHER.
- Écrans d'options (confirme le cluster ConfigOption seg201/208) :
  fichiers `.shp` — joycalib, mouse, flitopt, mainopt, detlopt, restart,
  gameopt, cockopt, camropt, audiopt.
- États de fin de mission : « YOU HAVE EJECTED. », « YOU HAVE DIED. »,
  « YOU HAVE LANDED. ».
- Caméras : Chase Plane, External View, Target View, Victim View, Weapon
  Camera.
- Debug IA embarqué : « AI: SELECT: %d, pCOLL: %d, gCOLL %d, STL: %d
  MORE: %d, EVAL: %d, UseWeapon: %d » — confirme les catégories de
  décision IA (sélection de cible, collision proche/lointaine, etc.).
- Debug moteur/perf : « FPS = %s Primitives:%d Objs:%d... »,
  « Time Compression %dx », « game paused », « Time Burst ».
- Pilotes audio : roland, adlib, pas (Pro Audio Spectrum), fichiers
  `.adl`/`.rol`, « No mem for XMIDI state table. ».
- Confirmation du tag de debug déjà noté : **« SCSCSCFY! »** retrouvé tel
  quel (cf. `TextObject_CloseAndLog_5A856`, seg124).
- Chemins de données : `..\..\data\cockpits\`, `..\..\DATA\`,
  `..\..\data\airdens.tbl`, fichier de config `sc.cfg`.

**Ce segment n'a pas de fonctions** (pure zone de données) — aucune entrée
`known_functions.json` n'y est rattachée directement, mais plusieurs
entrées existantes ont été mises à jour pour intégrer ces confirmations
(`sub_5C7B6`, `sub_5CFF8`, `sub_5F700`, `sub_66C9D`,
`unnamed_seg210_mouseisr`, `unnamed_seg194_search`, `sub_64DB3`).

## ⭐⭐ Découverte majeure (9) : la table de stubs VROOMM, plus de la moitié du projet

En documentant seg216, la structure du fichier a radicalement changé : la
numérotation saute de seg216 directement à `stub227`, et le format de
segment devient une structure de données VROOMM strictement répétitive,
documentée en clair par les commentaires d'IDA :

```
stru_XXXXX  db 0CDh, 3Fh   ; int_code   (l'instruction INT 3Fh du stub)
            dw 0           ; memswap
            dd <offset>    ; fileoff    (position dans strike.exe)
            dw <taille>    ; codesize
            dw <taille>    ; relsize    (table de relogement)
            dw <n>         ; nentries   (nombre de points d'entrée)
            dw seg seg000  ; prevstub   (chaîné vers le VROOMM manager)
            db 16 dup(0)   ; workarea
```

Suivie de `nentries` thunks, chacun de la forme `sub_XXXX proc far / jmp
sub_YYYYY / endp` — un point d'entrée fixe qui redirige vers le code
d'overlay actuellement chargé en mémoire à l'adresse cible.

**122 segments** suivent ce format (nommés `stub227` à `stub315` puis, la
numérotation IDA reprenant le préfixe `seg`, jusqu'à `seg429`), pour un
total de **1006 fonctions thunk** — soit près d'un tiers de tout le
projet (3449 fonctions candidates). Ce motif étant 100% mécanique et
identique à chaque occurrence, ces 1006 entrées ont été **extraites par
script** plutôt que lues manuellement une par une : chaque entrée dans
`known_functions.json` porte le nom `VROOMM_StubThunk_<adresse>` et
documente sa cible (`jmp sub_YYYYY`) ainsi que les métadonnées de swap de
son segment (fileoff, codesize, nentries).

**Fait établi, pas une hypothèse** : ceci confirme et rend visible en clair
le fonctionnement du gestionnaire d'overlay VROOMM de Borland déjà
documenté depuis seg000 — chaque stub est un point d'entrée stable que le
code appelant utilise sans jamais savoir si le code cible est actuellement
chargé ou swappé ; le manager VROOMM (seg000/seg212) est responsable de
charger le bon overlay et de patcher ces jmp vers la bonne adresse
mémoire avant l'exécution.

seg339, le segment de données massif (13000 lignes) référencé par
des milliers d'entrées comme source de vtables et tables de pointeurs à
travers toute la base, n'a pas été énuméré individuellement (ce n'est pas
du code exécutable).

## ⭐⭐ Découverte majeure (12) : résolution du cluster `sub_ABxxx` (AudioQueue) — fichier entièrement couvert

En atteignant seg458, l'inventaire a enfin résolu une question ouverte
depuis plusieurs sessions : quel module consomme le registre de modules à
créneaux temporisés du seg161 en dehors du séquenceur de contre-mesures
(seg121-123) ?

- **`AudioQueue_RegisterTickModule_AA810`** référence explicitement
  `Interrupt_TimerISR_5940B` (seg121) via le mécanisme Stopwatch (seg207,
  tag 5DC2h) — confirmant l'enregistrement direct dans le minuteur
  matériel.
- **`AudioQueue_ActivateSlotOpcode_AB16F`** et
  **`AudioQueue_DeactivateSlotOpcode_AB1AF`** appellent directement les
  thunks d'opcode `ModuleRegistry_Opcode_AB_603D2`/`_AD_603D8` (seg161).
- **`AudioQueue_ProcessSequencerSlots_AB1EF`** appelle
  `Sequencer_AdvanceActiveSlot_59F1D` (seg123) — le séquenceur générique
  découvert dès le début de la traversée des segments de fin de fichier.
- Le cluster combine massivement `IndexedRecordReader` (seg196) et
  `StreamReader` (seg190) pour lire des plages d'octets variables dans
  des enregistrements indexés, et un appel à `sub_1069` avec un pointeur
  de callback et une constante mémoire (0xC0000) suggérant une
  installation de callback DMA/audio.

**Hypothèse de travail (motif cohérent, non confirmée en détail)** : ce
cluster est une file de lecture de clips audio ou de messages
indexés — probablement le système de « chatter radio » déjà mentionné
dans les notes du projet, ou un système de lecture de voix
d'avertissement (« Betty », confirmée dans les chaînes du seg339). Les
fonctions ont été nommées `AudioQueue_*` en conséquence, mais le contenu
exact (audio vs texte) n'a pas été confirmé par lecture exhaustive.

**Avec seg461, le fichier `strike.asm` est intégralement couvert en ordre
de segment.** 327 fonctions sur 3449 restent des variantes répétitives
flaguées « non détaillée » à l'intérieur de segments déjà caractérisés
(essentiellement des familles de constructeurs de composants très
similaires et des fonctions de chargement IFF non tracées ligne à ligne).

## ⭐⭐⭐ Correction de méthodologie et couverture des segments `ovr` (561 fonctions)

Une première affirmation de « couverture complète » (seg000→seg461) s'est
révélée **incorrecte** : entre seg339 (données) et seg430, il existait une
**troisième famille de segments nommée `ovrNNN`** (90 segments, `ovr227` à
`ovr316`, lignes 254288-335248) que le script d'extraction en masse des
stubs VROOMM n'avait jamais détectée — il ne cherchait que les préfixes
`seg` et `stub`. Ces 90 segments contiennent **561 vraies fonctions**
(constructeurs, calculs, chargeurs — pas des thunks mécaniques), soit plus
de 16 % du total du fichier.

**Méthode de vérification** : plutôt que d'estimer, la couverture a été
vérifiée en comparant directement l'ensemble des 3449 déclarations
`proc far`/`proc near` du fichier `strike.asm` contre les clés de
`known_functions.json`. Cette méthode a été utilisée pour confirmer la
correction et sera la référence pour toute affirmation de couverture
future.

**Contenu des segments `ovr`** — cohérent avec tous les sous-systèmes déjà
identifiés, avec quelques ajouts :

- **IA de combat** : `AI_ManeuverSolutionMain_781D0` (2373 lignes),
  `MissionRecord_LoadEntityDatabase_7B035` (3103 lignes — la plus grosse
  fonction de tout le fichier), calculs de solution de ciblage/guidage.
- **Symboles HUD** : grande famille de constructeurs et de fonctions de
  rendu avec test de clipping caméra (`HUDSymbol_*`), incluant plusieurs
  familles de duplicats confirmés byte-pour-byte (motif VROOMM classique).
- **Chargement de mission/scénario** : `AircraftComponent_*`,
  `MissionRecord_*`, `MissionText_*` — dont `MissionText_DrawTypewriterSynced_975CC`
  qui confirme un système d'affichage de sous-titres synchronisé
  audio/vidéo (`AV_SyncComputeOffset`, `Text_TypewriterDrawChar`).
- **Terrain** : `Terrain_ComputeVisibilityAndAltitude_98CF0`,
  chargement de cartes d'élévation, gestion de tuiles.
- **Débris/particules** : système complet de simulation physique de
  débris (`Debris_ComputeTorque`, `Debris_SpawnOrchestrator`,
  `Particle_ListFreeAll`).
- **Caméra** : famille de constructeurs (`Camera_ConstructWithSecondaryTarget`,
  `Camera_ConstructAttachedWithTarget`, etc.).
- **Chargeurs de ressources génériques** : famille de 7 grosses fonctions
  quasi identiques (`ResourceFile_LoadTypeA` à `G`, 470-1400 lignes
  chacune) pour différents types de fichiers.
- **`Gauge_ComputeAndRenderNeedle_9D910`** (577 lignes), dernière fonction
  du fichier avant les tables de stubs suivantes, relie explicitement le
  terrain, une jauge d'instrument et la VM d'expression (`Expr_VM_Execute_51E7E`).

**Non vérifié en détail** : une centaine de grosses fonctions (200-3103
lignes) ont été nommées et caractérisées par leurs appels sans lecture
exhaustive ligne à ligne, cohérent avec la méthodologie d'inventaire
rapide déjà appliquée au reste du projet — plusieurs dizaines de familles
de duplicats probables (constructeurs/destructeurs quasi identiques) n'ont
pas toutes été vérifiées byte-pour-byte individuellement, seul un
échantillon représentatif l'a été.

## Fonctions volumineuses non détaillées (candidates pour passes dédiées)

| Fonction | Lignes | Segment | Hypothèse |
|---|---|---|---|
| `Player_MainUpdate_13100` | 2015 | seg011 | Traitement principal avion du joueur |
| `Radar_Project3DToScreen_16988` | 896 | seg018 | Projection 3D→écran radar/HUD |
| `Formation_GuidanceSolution_D081` | 944 | seg006 | Guidage de formation (followAlly) |
| `AI_ManeuverSolution_91DF` | 559 | seg004 | Solution de manœuvre/guidage |
| `AI_GuidanceSolution_Major_702A` | 651 | seg003 | Guidage complexe (lead pursuit) |
| `AI_ManeuverSolution_Major_6977` | 616 | seg003 | Solution de manœuvre/tir |
| `AI_CombatDecision_Major_75F8` | 603 | seg003 | Décision de combat IA |
| `Flight_PhysicsTick_JDYN_3314` | 1347 | seg001 | Tick physique de vol (JDYN) |
| `AI_RollRateController_7B20` | 384 | seg003 | Contrôleur de roulis |
| `AI_FlightControl_Cluster_7F34` | 245 | seg003 | Contrôle de vol IA |
| `AI_BehaviorSelector_8D30` | 313 | seg004 | Sélection de comportement IA |
| `AI_BehaviorStateMachine_9D05` | 353 | seg004 | Machine à états de comportement |
| `Widget_MainHandler_1C6C6` | 297 | seg028 | Gestionnaire de widget composite |
| `Render_MeshPrimitive_216F6` | 849 | seg037 | Rendu mesh 3D (le plus paramétré) |
| `Render_MeshPrimitive_21085` | 815 | seg037 | Rendu mesh 3D |
| `Render_PolygonPrimitive_20C58` | 588 | seg037 | Remplissage polygone (variante) |
| `Render_PolygonPrimitive_20848` | 566 | seg037 | Remplissage/tracé polygone avec clipping |
| `WorldObjects_Cluster_22795` | 380 | seg039 | Cluster conteneur/monde de jeu |
| `WorldObjects_Cluster_22A7D` | 188 | seg039 | Cluster conteneur/monde de jeu |
| `WorldObjects_PurgeExpired_221F2` | 167 | seg039 | Garbage collector du conteneur |
| `TextRenderer_Main_27477` | 1158 | seg048 | **Moteur de rendu de texte principal (la plus grosse fonction à ce jour)** |
| `Cinematic_SplineCompute_242AE` | 940 | seg042 | Calcul de trajectoire/interpolation caméra scriptée |
| `Render_TriangleRasterizer_26A60` | 570 | seg046 | Point d'entrée du rasterizer de triangle |
| `Render_PlotPixelClippedColorMap_258A8` | 443 | seg044 | Primitive de dessin avec table de couleurs |
| `Kneeboard_RenderEntry_23593` | 265 | seg041 | Rendu à 20 cas des entrées du journal de mission |
| `Cinematic_LoadCameraDef_23E7D` | 338 | seg041 | Chargement de définition de caméra scriptée |
| `Mission_TriggerEvaluator_22F53` | 381 | seg040 | Évaluateur de déclencheur d'événement de mission |
| `Render_LineClipped_25BA4` | 328 | seg045 | Tracé de ligne avec clipping (Bresenham) |
| `Input_CalibrationHandler_27F9E` | 478 | seg048 | Calibration de périphérique d'entrée |
| `Damage_SimulationTick_2BF6C` | 1019 | seg060 | Calcul par tick du système de dommages structurels |
| `Camera_ComputeViewMatrix_2E2AC` | 469 | seg065 | Calcul de la matrice de transformation caméra |
| `Render_ObjectPipelineMain_2FEE2` | 2623 | seg069 | **Pipeline principal de rendu d'objets 3D** |
| `Render_TerrainPipelineMain_345D6` | 2938 | seg074 | **Pipeline principal de rendu du terrain (la plus grosse fonction)** |
| `IFF_LoadModelMain_3B876` | 1699 | seg083 | Chargeur principal de modèles IFF 3D |
| `JDYN_LoadChunk_3A49C` | 577 | seg082 | Chargeur du chunk physique JDYN |
| `Terrain_StreamingMain_33D4E` | 869 | seg073 | Streaming de secteurs de terrain |
| `Effect_RenderVolumetric_39B29` | 589 | seg080 | Rendu d'effet visuel complexe |
| `Picking_ComputeDetailed_37069` | 557 | seg076 | Calcul détaillé de picking/surbrillance |
| `Model_RenderMain_31E87` | 611 | seg070 | Orchestration du rendu d'un modèle 3D |
| `Terrain_ComputeLODMesh_32A6E` | 610 | seg071 | Calcul de mesh de terrain adaptatif (LOD) |
| `HUD_RenderSymbologyAlt_3F8C0` | 2016 | seg088 | **Second moteur de rendu de symbologie HUD** |
| `HUD_RenderSymbologyMain_3E744` | 1882 | seg087 | **Moteur de rendu de symbologie HUD/viseur principal** |
| `Collision_ComputeConnectionVector_441DC` | 427 | seg094 | Calcul de vecteur de connexion entre objets |
| `Camera_ChaseComputeMain_3D57E` | 437 | seg085 | Calcul complet de la caméra de poursuite |
| `Audio3D_ComputeDistanceParams_41BEF` | 380 | seg089 | Paramètres audio 3D (distance, Doppler) |
| `Collision_MainLoop_44F08` | 309 | seg094 | Boucle principale de test de collision |
| `Effect_SpawnPeriodicAtAttach_43936` | 312 | seg092 | Génération probabiliste d'effet visuel |
| `WeaponStation_ResolveStateA_40A33` | 397 | seg088 | Résolution de l'état des stations d'armement |
| `Targeting_SelectAndPrioritize_43107` | 327 | seg091 | Sélecteur/verrouilleur de cible principal |
| `JDYN_PhysicsTickMain_49C2E` | 1422 | seg103 | **⚠️ RENOMMÉE `Guidance_HomingVelocityUpdate` — voir CLAUDE.md, ce n'est pas un tick physique, lecture complète effectuée** |
| `PhysicsTicks` | ~350 | seg103 (~0x4A85B) | **★ LU — LE tick de la dynamique avion (classe `JDYN`). Détection sol, reset caches aéro, manette gaz→poussée→`[si+0x28]`, conso carburant + flameout, volets/aérofrein/train, autopilote si `[si+0x68]≠0xFF`, sinon `Aero_SumLinearForces` (forces linéaires, repère corps) + `Aero_ControlOrchestrator` (moments) + intégrations. Détail : DATA_MODEL.md §6.2.** |
| `Aero_ComputeForcesMain_4791E` | 649 | seg102 | **LU — solveur d'asservissement d'attitude : `moment = ±2·√(q'·err)` rate-limité, nul si err ≥ 56° (décrochage de contrôle)** |
| `Aero_ComputeLiftAndSideForce_4812B` | 333 | seg103 | **LU — ex-`DetectControlSaturation` (nom trompeur) : GÉNÉRATEUR DE PORTANCE + force latérale. `L = jdyn[0x61]·k·α_eff·q·n̂(0,−v.c2,v.c1)`. `flags_75` bit6 = effet de bord (alerte départ)** |
| `JDYN_HighLevelPhysicsCalc_4B09D` | 328 | seg103 | Calcul physique de haut niveau intégrant JDYN |
| `Aero_ComputeDragWithFeedback_48400` | 248 | seg103 | **LU — ex-`ComputeMomentsWithFeedback` : VECTEUR DE TRAÎNÉE `−v̂_corps·[q·(0x5D·α² + (0x5D≫3)·β² + drag_flags75)]`** |
| `Aero_ComputeCoeffSaturating_4730F` | 234 | seg102 | Coefficient aérodynamique non-linéaire avec saturation |
| `ChaseCamera_RenderEffect_4D1C9` | 450 | seg106 | Effet visuel lié à la caméra de poursuite |
| `Aero_ComputeControlFlags75Bit5B_48862` | 375 | seg103 | Calcul contrôle dépendant de `flags_75` bit5 |
| `ParticleEmitter_PeriodicUpdate_4C413` | 351 | seg106 | Mise à jour périodique d'émetteur de particules |
| `FlightPhysics_TickCandidate_4F4EE` | 58 | seg109 | **RÉSOLU — tick des 3 classes `DYNM` simples (missile/bombe), PAS de l'avion (= `PhysicsTicks`). Divise par la masse via `vtable[0x10]`.** |
| `UIScreen_StateMachineMain_4FBF1` | 645 | seg112 | Machine à états d'un écran/dialogue UI (formulaire numérique) |
| `UIScreen_ApplyFormFields_500F6` | 360 | seg112 | Lecture/validation de champs numériques du même écran |
| `UIScreen_RenderGraphVGA_509EE` | 439 | seg113 | Rendu direct VGA (0xA000) pour le même écran |
| `UIScreen_ComputeDerivedFields_503EB` | 294 | seg112 | Calcul multi-champs dérivés du même écran |
| `Expr_VM_Interpreter_51106` | 1877 | seg114 | **⭐ PRIORITÉ #1 — VM à bytecode, 209 opcodes, sous-jacente à HUD/IA/UI** |
| `Expr_VM_CallNativeFunction_52513` | 685 | seg114 | Marshalling d'arguments + appel de fonction native (opcode VM) |
| `UIScreen_BuildWidgetTree_53A94` | 476 | seg114 | Construction d'arborescence de widgets |
| `UIScreen_BuildWidgetTree_Recurse_53D92` | 395 | seg114 | Sous-routine récursive de construction d'arborescence |
| `GeomNode_BuildOrRefreshCluster_51EDC` | 547 | seg114 | Orchestrateur de rafraîchissement de nœuds |
| `UIScreen_RenderOrLayoutList_54503` | 321 | seg114 | Rendu/layout de liste d'écran |
| `UIScreen_Construct_53896` | 254 | seg114 | Construction complète d'un écran (point d'entrée probable) |
| `UIScreen_ConstructWidgetBinding_536F7` | 242 | seg114 | Liaison widget ↔ champs calculés, appelle la state machine UI |
| `Expr_Node_ConstructAndAttach_53363` | 217 | seg114 | Construction/attachement de nœud |
| `Expr_Node_EvaluateVisibility_53586` | 207 | seg114 | Évaluation de visibilité/portée d'un nœud |
| `Expr_Node_AllocateTriple_543CA` | 166 | seg114 | Triple allocation (hors cluster identifié) |
| `AI_ComputeApproachAngles_553CF` | 209 | seg116 | Calcul d'angles d'approche/manœuvre (IA) |
| `Damage_ComputeMainHelper_56559` | 288 | seg116 | Calcul principal de propagation de dommages |
| `Targeting_ComputeBearingElevation_55B1A` | 134 | seg116 | Gisement/élévation vers une cible |
| `AI_ComputeGeometrySolution_57C67` | 143 | seg116 | Solution géométrique IA (cœur seg002) |
| `GeomHelper_QuadrantComputeLoop_UNRESOLVED` | 348 | seg116 | Calcul répété sur 4 quadrants/coins (adresse non résolue) |
| `Parser_BuildHashIndex_588E8` | 123 | seg118 | Construction de table de hachage/dispatch |
| `Render_DitheredLineMain_58B97` | 298 | seg119 | Tracé de ligne pointillée/dégradée (rendu 3D) |
| `Interrupt_TimerDispatch_59436` | 234 | seg121 | Dispatch de l'ISR minuteur matériel (4 cas) |
| `Interrupt_TimerCase_595C2` | 208 | seg121 | Cas du séquenceur piloté par le minuteur |
| `Weapon_HUDBox_ComputeGeometry_58F42` | 143 | seg121 | Géométrie de boîte de ciblage HUD |
| `Weapon_HUDBox_DrawElementC_590E0` | 190 | seg121 | Élément de dessin de boîte de ciblage HUD |
| `Weapon_HUDBox_UpdateGeometryAndTimer_59B10` | 239 | seg122 | Mise à jour géométrie+minuterie de la boîte HUD |
| `Weapon_HUDBox_MasterUpdate_59CFA` | 311 | seg122 | **Pilote principal du cluster HUD armement/séquenceur** |
| `Sequencer_ProcessQueue_59FF5` | 135 | seg123 | Traitement de la file du séquenceur à créneaux |
| `TextRenderer_InputFieldHandler_5A0F3` | 493 | seg124 | Gestionnaire de champ de saisie/édition de texte |
| `TextRenderer_BuildInputWidget_UNRESOLVED` | 189 | seg124 | Constructeur de widget de saisie (adresse non résolue) |
| `TextObjectCluster_DestructAll_5ABD1` | 190 | seg125 | Destructeur global du cluster objets-texte |
| `Registry_BuildOrUpdateEntry_5B036` | 219 | seg126 | Construction/mise à jour d'entrée de registre |
| `Registry_MainOperation_5B26B` | 175 | seg126 | Opération principale de registre |
| `Registry_LookupForUIScreen_5B6FC` | 117 | seg126 | Lookup registre pour l'écran UI |
| `PagedMemory_ReadFormattedString_5BE40` | 279 | seg127 | **Lecture de chaîne formatée depuis la mémoire paginée — clé pour confirmer l'hypothèse dialogues/textes** |
| `PagedMemory_InitSubsystem_5BB0D` | 94 | seg127 | Initialisation du sous-système de mémoire paginée |
| `Memory_AllocatorTable_PopulateSlots_5CB99` | 152 | seg133 | Peuplement du tableau d'allocateurs |
| `TextFormat_BuildLabelString_5CE0B` | 276 | seg135 | Construction de chaîne de texte formatée |
| `Heap_ValidateBlockDetailed_5CFF8` | 190 | seg136 | Validation détaillée de bloc de tas |
| `CachedObject_BuildAndTransform_5DEC9` | 131 | seg141 | Construction/transformation d'objet mis en cache |
| `CachedObject_ConstructThunkVariant_UNRESOLVED` | 127 | seg141 | Constructeur multi-héritage (adresse non résolue) |
| `TextRenderer_ApplyFormatChange_5E34D` | 110 | seg143 | Application de changement de format de texte |
| `PagedMemory_ExceptionHandler_5EEDD` | 156 | seg154 | **Gestionnaire d'exception matérielle — décodage d'instruction fautive** |
| `Video_PrintFormattedMessage_UNRESOLVED` | 132 | seg155 | Impression de message de diagnostic formaté (adresse non résolue) |
| `DisplaySurface_CloneOrResize_5E89E` | 111 | seg151 | Clonage/redimensionnement de surface d'affichage |
| `FontStyle_ApplyVariantA_UNRESOLVED` | 166 | seg153 | Application de style de police (adresse non résolue) |
| `Runtime_FatalErrorHandler_5F700` | 75 | seg160 | **Gestionnaire d'erreur fatale/assertion, appelé depuis le pipeline terrain** |
| `ModuleRegistry_TimerISR_5FBBE` | 89 | seg161 | **ISR du minuteur matériel — cœur du registre de modules** |
| `Widget_RenderComplexLayout_60BA6` | 331 | seg163 | Rendu de layout complexe de widget |
| `GlyphObject_LayoutAndRenderAll_60E60` | 131 | seg163 | Layout/rendu de tous les glyphes d'un widget |
| `Widget_UpdateLayoutAndBounds_60B1D` | 103 | seg163 | Mise à jour layout/bornes de widget |
| `ModuleRegistry_ConfigureModuleExtended_60254` | 100 | seg161 | Configuration étendue d'un module enregistré |
| `Render_DrawFilledEllipse_6106E` | 481 | seg167 | Tracé d'ellipse/cercle rempli |
| `Render_DrawEllipseOutline_61612` | 454 | seg169 | Tracé de contour d'ellipse |
| `Render_ClipAndDrawLine_613B0` | 428 | seg168 | Clipping et tracé de ligne |
| `Render_FillClippedRect_61960` | 342 | seg170 | Remplissage de rectangle clippé (primitive de base) |
| `Render_DrawScaledSprite_621A2` | 675 | seg175 | **Rendu de sprite/icône mis à l'échelle, partagé carte/radar et particules — aucune lecture de détail** |
| `Render_DrawRotatedScaledSprite_62800` | 736 | seg179 | **⭐ Plus grosse fonction du cluster rendu 2D — variante avec rotation, partagée avec l'émetteur de particules** |
| `Render_DrawOrMeasureTextVariantB_62BFE` | 255 | seg180 | Rendu/mesure de texte (variante B, objets mis en cache) |
| `Render_DrawOrMeasureTextVariant_625E2` | 215 | seg177 | Rendu/mesure de texte (variante A, objets mis en cache) |
| `Render_BlitClippedRegion_6271A` | 194 | seg178 | Calcul de région pour blit avec clipping |
| `Render_ClipAndDrawLineVariant_62EC8` | 369 | seg183 | Clipping et tracé de ligne (variante) |
| `Render_BlitClippedRegionVariant_62D36` | 166 | seg181 | Calcul de région pour blit (variante) |
| `File_ReadOrDelegateToPaged_630E7` | 188 | seg185 | Lecture fichier avec délégation mémoire paginée |
| `StreamReader_ReadBlock_63C61` | 115 | seg190 | Cœur de lecture par blocs du flux tamponné |
| `StreamReader_ConstructAndBind_63B23` | 99 | seg190 | Construction/liaison de flux (référencée par le cœur IA) |
| `ResourceRecord_FindOrCreateMatching_UNRESOLVED` | 351 | seg194 | **Recherche/correspondance de sous-enregistrement — probable cœur du chargeur de ressources structurées** |
| `StreamReader_WriteWithGrowth_65795` | 289 | seg195 | Écriture avec croissance automatique de tampon |
| `sub_64217` (StreamReader_ParseFormattedString) | 148 | seg191 | Parseur de valeur/chaîne formatée sur StreamReader |
| `loc_6552E` (StreamReader_Method_GrowBuffer) | 160 | seg195 | Croissance dynamique du tampon interne |
| `LZW_Decompress_66068` | 185 | seg197 | **Décodeur LZW complet** |
| `TextRenderer_LoadResourceFile_661AF` | 126 | seg198 | Chargement de fichier ressource |
| `IndexedRecordReader_ReadIndexTable_65B73` | 129 | seg196 | Chargement de la table d'index (appelle le décodeur LZW) |
| `Keyboard_ProcessScanCode_66AC4` | ~180 | seg202 | **Traitement bas niveau des scan-codes clavier** |
| `InputBinding_InitAndRegister_66E02` | 155 | seg203 | Enregistrement de liaison entrée-action |
| `Mouse_EventCallback_68109` | 122 | seg210 | **Gestionnaire d'événement souris (callback int 33h)** |
| `VROOMM_LocateAndValidate_68254` | 224 | seg212 | Localisation/validation du fichier exécutable |
| `VROOMM_ReadHeader_6844A` | 88 | seg212 | Lecture d'en-tête MZ |
| `VROOMM_MainEntry_68B2F` | 80 | seg212 | Point d'entrée principal du chargeur |
| `VROOMM_ApplyRelocationsMain_687E8` | 85 | seg212 | Application de la table de relogement |
| `VROOMM_FinalizeAndJump_UNRESOLVED` | 173 | seg212 | Finalisation du chargement (adresse non résolue) |
| `Joystick_InterpolateCalibrationPercent_67CB8` | 138 | seg208 | Interpolation de calibration en pourcentage |
| `Joystick_ApplyDeadzoneAndScaleB_679E2` | 136 | seg208 | Application de zone morte/échelle (axe B) |
| `ConfigOption_ApplyAndDisplayB_6698F` | 131 | seg201 | Affichage d'option de configuration |
| `Render_DrawTextString_61CD2` | 496 | seg173 | Rendu de chaîne de texte complète |
| `Render_MeasureOrDrawTextString_61F52` | 457 | seg174 | Mesure/rendu de chaîne de texte (variante) |
| `Render_DrawHorizontalLineClipped_61B8E` | 201 | seg172 | Tracé de ligne horizontale clippée |
| `PaletteScreen_BuildCustomGradient_A1626` | 537 | seg442 | Construction d'un dégradé de couleur personnalisé (22 entrées + courbe) |
| `PaletteScreen_UpdateWidgetMain_A21AF` | 419 | seg442 | Point d'entrée principal de mise à jour du widget palette |
| `GaugeWidget_FormatDisplayValue_A3CF6` | 227 | seg444 | Formatage/affichage de la valeur du widget jauge |
| `GaugeWidget_RenderModeDispatch_A3EA5` | 251 | seg444 | Dispatch de rendu (allocation/blit) |
| `GaugeWidget_RenderModeDispatch_A40B0` | 167 | seg444 | **Switch à 5 modes de rendu de jauge** |
| `PaletteScreen_DrawCurveWithLabelB_A2671` | 298 | seg442 | Dessin de courbe avec étiquette (variante) |
| `PaletteScreen_DrawCurveWithLabel_A24C7` | 294 | seg442 | Dessin de courbe avec étiquette |
| `PaletteScreen_DrawWidgetBorderA_A1CE1` | 273 | seg442 | Dessin de bordure de widget |
| `PaletteScreen_DrawWidgetBorderB_A1E6D` | 268 | seg442 | Dessin de bordure de widget (variante) |
| `GaugeWidget_DrawWithLabel_A4388` | 155 | seg445 | Dessin du widget jauge avec étiquette |
| `PaletteScreen_AcquireOwnership_A1240` (rappel) | — | seg442 | Verrou d'exclusion mutuelle, appelé par ~50 fonctions du module |
| `MissionText_LoadAndFormatFromIFF_A636C` | 392 | seg450 | **Chargement/formatage de texte de mission depuis IFF — probable dialogue/briefing** |
| `PlayerComponent_LoadFieldsMassive_A5D18` | 239 | seg449 | Chargement massif de ~30 champs (propriétés visuelles/matériau) |
| `PlayerComponent_LoadFieldsWithRetryF_A4BE1` | 132 | seg448 | Chargement combinant IFF et flux de fichier |
| `PlayerComponentVariantAG_ConstructAndInit_A54C8` | 152 | seg448 | Plus grosse variante de constructeur du cluster |
| `TextLabel_LoadFieldsExtended_A61D0` | 226 | seg450 | Chargement étendu de champs de texte IFF |
| `MissionScenario_LoadMainRecord_A8331` | 775 | seg456 | **⭐ Plus grosse fonction du reste du fichier — chargement du bloc principal d'un scénario/mission** |
| `MissionScenario_ResolveAndBindExpressions_A8F22` | 492 | seg456 | Résolution/liaison des expressions calculées d'un scénario |
| `MissionLoader_LoadEntitiesMain_A767F` | 239 | seg455 | **Chargement des entités de mission, lié à seg112** |
| `MissionLoader_SpawnEntity_A7B1E` | 199 | seg455 | Spawn d'une entité de mission depuis les données chargées |
| `MissionScenario_LoadFromIFF_A8C44` | 356 | seg456 | Chargement d'un scénario depuis le format IFF |
| `AudioQueue_ProcessMain_AA84E` | 552 | seg458 | Orchestrateur principal du cluster AudioQueue |
| `AudioQueue_LoadAndPlayEntry_AB592` | 247 | seg459 | Cycle complet de chargement/lecture d'une entrée audio |
| `AudioQueue_MainProcessEntry_ABBEF` | 254 | seg461 | Point d'entrée principal de traitement (dernière fonction du fichier) |
| `AudioQueue_ReleaseAllSlots_AB2BD` | 188 | seg458 | Nettoyage complet de la file audio/message |
| `MissionLoader_LoadFormation_A78F5` | 134 | seg455 | Chargement d'une formation d'unités de mission |
| `MissionLoader_LoadPosition_A7A10` | 145 | seg455 | Chargement de coordonnées d'une entité de mission |

## Prochaine étape

Continuer en ordre fichier avec **seg166+**, en fusionnant à chaque fois dans
`known_functions.json`. Priorité immédiate : couvrir le cluster `sub_ABxxx`
(référencé comme consommateur du registre de modules seg161, adresses
autour de 0xAB000-0xABFFF, probablement seg170+) pour confirmer l'hypothèse
que le séquenceur de contre-mesures n'est qu'un module parmi d'autres. Les
fonctions listées ci-dessus restent les candidats prioritaires pour des
sessions d'analyse dédiées et approfondies — elles couvrent les deux
pipelines de rendu principaux (objets et terrain), le chargeur de modèles
IFF, le chargeur JDYN, le rendu de texte, le rendu HUD, la simulation de
dommages structurels, le calcul de collision, le cœur complet du modèle de
vol JDYN, la VM à bytecode transversale (seg114), la bibliothèque
mathématique (seg115-117), les sous-systèmes mémoire paginée/typée
(seg127-138), le runtime bas niveau (dépassement de pile, tas, exception
matérielle, erreur fatale — seg137/154/160), et désormais le registre de
modules à créneaux temporisés (seg161).
