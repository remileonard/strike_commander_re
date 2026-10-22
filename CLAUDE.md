# Strike Commander (STRIKE.EXE) — Archive de rétro-ingénierie

Ce document est le point d'entrée pour comprendre cette archive et lancer
une session ciblée de décodage sur une fonction ou un sous-système
particulier. Il est volontairement concis — les détails complets sont dans
les autres fichiers de `analysis/`, référencés au fil du texte.

## ⚠️⚠️ Règles de travail avec Rémi (instructions FORTES, à appliquer à chaque réponse)

**1. Parler avec les noms résolus, jamais avec les adresses.**
Rémi ne lit pas l'assembleur et n'a pas en tête les adresses. Quand tu
désignes une fonction, donne **son nom résolu de `known_functions.json`**
(ex. `EntityTracker_ApplySelection`), pas `sub_23CCC`, `loc_5ACC` ou un offset
hexadécimal. Lui-même te passe des noms de fonctions : réponds avec **les
mêmes noms**, pour que vous parliez la même langue.
- L'adresse, si elle est utile, vient **après** le nom et entre parenthèses,
  une seule fois. Jamais seule.
- Une fonction **sans nom résolu** : dis-le explicitement ("fonction pas
  encore nommée") et décris ce qu'elle fait en une phrase, puis propose un
  nom. Ne la balade pas sous son adresse nue dans une liste ou un résumé.
- Écris pour quelqu'un qui doit comprendre sans ouvrir un autre fichier :
  phrases courtes, rôle avant le détail technique, pas de suite d'offsets ou
  d'instructions comme seule explication.

**2. Ne jamais chercher dans `source/strike.asm` : utiliser
`analysis/annotated_segments/`.**
Toutes les recherches (grep d'un motif comme `call dword ptr [bx+0Ch]`, lecture
d'une fonction, recherche d'appelants) se font dans les fichiers
`analysis/annotated_segments/*_annotated.asm`, où les labels sont déjà
renommés avec les noms de `known_functions.json`. C'est ce qui garantit que
tes résultats sont directement lisibles par Rémi.
- Pour chercher un motif partout : `grep` sur `annotated_segments/*.asm`
  (les résultats portent déjà les noms résolus).
- `source/strike.asm` uniquement si l'information n'existe réellement pas dans
  le fichier annoté, et **dis-le à Rémi** en expliquant pourquoi. Ne pas y
  basculer par commodité.
- Si un segment annoté manque ou semble incomplet : régénérer avec
  `tools/annotate_segments.py`, ne pas contourner.
- Même règle pour OPTEST.EXE : lire `analysis/optest/annotated_segments/`, pas
  `source/optest.asm` (outils avec `--exe optest`, voir « OPTEST.EXE » plus bas).

*(Rappel d'incident : une session a mené toute une investigation dans
`strike.asm` et rendu des résultats en `sub_XXXXX`, obligeant Rémi à
rechercher chaque nom dans `known_functions.json`. À ne pas reproduire.)*

**3. Style du code C++ écrit pour Rémi** (`tools/sc_player`, code destiné à libRealSpace) :
- `if`, `for`, `while`, `do` **toujours avec des accolades**, accolade ouvrante sur la ligne de
  l'instruction (`if (valeur == 1) {` … `}`) ;
- **une seule instruction par ligne**, y compris les déclarations (`int a;` puis `int b;`, jamais `int a, b;`) ;
- une liste d'initialisation de plus d'une valeur (tableau, enum…) : **une valeur par ligne**.

Après chaque modification : `clang-format --style=file:tools/sc_player/.clang-format -i <fichiers>`
puis `python3 tools/sc_player/tools/style_check.py <fichiers>` (doit ne rien signaler ;
`--fix` découpe les déclarations multiples et les listes).

**4. Parler à Rémi dans SON repère et SES unités : Y-up, en mètres.**
Pour Rémi, **X et Z = plan horizontal (Z = profondeur), Y = altitude** (repère libRealSpace).
L'assembleur est en Z-up (3ᵉ composante = altitude) : c'est à toi de traduire, jamais à lui.
- Tout ce que tu écris pour Rémi (axes, champs de fichier, formules, tests) se nomme en Y-up :
  « altitude = Y », « distance dans le plan X/Z », « le 2ᵉ i32 du fichier est Z, le 3ᵉ est Y ».
- Pour un champ de fichier, indique la conversion à la lecture (`libRS.x = c0`, `libRS.y = c2`,
  `libRS.z = −c1`, voir « Pourquoi Z est inversé » plus bas) ; les composantes Z-up ne restent que
  dans les citations d'assembleur.
- Les distances du monde sont en **mètres** (après ÷ 256), **jamais en pieds**, même si un
  ancien document d'`analysis/` dit « ft » ou « pieds ».

**5. N'écrire que ce qui a été constaté.**
Dans les documents (`DATA_MODEL.html`, `.md`, résumés de `known_functions.json`) comme dans les
réponses, ne pas affirmer une absence (« jamais lu », « jamais utilisé », « aucun lecteur ») ni
une interprétation qui n'a pas été vue dans le code ou dans nos échanges. Un champ dont on n'a vu
que le chargement s'écrit « rangé en mémoire par le chargeur ; rôle non établi ». Une recherche
de motifs qui ne trouve rien ne prouve pas une absence.

**6. Séparer le format des fichiers du code C++.**
`DATA_MODEL.html` décrit la représentation physique des données : un fichier objet contient UN
seul FORM de classe (`JETP`, `GUID`, `ARMG`…), décrit par ses propres chunks. Ne jamais y
transposer la hiérarchie des classes C++ (« le lecteur de JETP appelle celui de GUID ») ni les
conditions que le programme impose au chargement (erreurs, priorités de recherche, refus) : cela
induit en erreur quand on ouvre les fichiers. Le comportement du code va dans
`known_functions.json` et les documents de comportement.

**7. Pas de possessifs pour parler du portage.**
Dire « libRealSpace », « le portage », « `SCRenderer` », « le code de libRealSpace » — **jamais**
« ton code », « ton portage », « ton renderer », « ta fonction », « tes passes », ni dans les
réponses ni dans les documents.

## Contexte du projet

Rémi rétro-ingénierie *Strike Commander* (1993, Origin Systems, simulateur
de combat aérien DOS) à partir d'un désassemblage IDA complet
(`strike.asm`, 371 062 lignes) et de son fichier map (`strike.map`). Le
but est de documenter **toutes les fonctions du binaire** pour corriger et
améliorer un port C++ existant appelé **libRealSpace**, en comparant le
comportement réel du jeu original.

**Qui est Rémi, et comment le croire.** Rémi travaille sur ce reverse
engineering **depuis 2 ans**. Il **ne lit pas l'assembleur** — sa méthode
est l'analyse des **données** (fichiers du jeu) et la reproduction du
comportement. Il a déjà **un jeu fonctionnel** : ~90 % du code est
reproduit dans libRealSpace. Ce qu'il cherche ici, ce sont les **derniers
% de détails** cachés dans l'assembleur (offsets exacts, endianness,
champs, ordre de lecture) pour un portage **fidèle**.
Conséquences directes :
- Quand Rémi affirme un fait (« ce fichier est rendu », « c'est un objet
  pas du terrain », « mon parseur affiche les pistes »), c'est de la
  **vérité vérifiée côté données**, pas de l'intuition. **Ne jamais la
  contredire avec des hypothèses tirées d'un dump binaire.**
- Si tu ne trouves pas la fonction / le mécanisme qu'il décrit, **c'est
  que tu cherches mal** — pas que ça n'existe pas. Continue à tracer.
- Ton apport, c'est l'assembleur : cite la **ligne exacte** (`mov`,
  `imul`, `call`, `shl`) qui prouve un offset, un stride, une taille de
  champ. Pas de correction proposée sans cette citation.

**Faits établis (ne pas remettre en question sans preuve nouvelle) :**
- **`STRIKE.EXE` ne contient que la SIMULATION** : aucun écran de briefing ni menu de mission dans
  ce binaire. Briefings et menus vivent dans un binaire **séparé, `OPTEST.EXE`** (fait donné par
  Rémi), désassemblé depuis le 2026-10-17 dans `source/optest.asm` (voir « OPTEST.EXE » plus bas).
  Une fonction de `STRIKE.EXE` qui ressemble à de l'UI de menu ou de
  briefing est à réinterpréter comme une séquence jouée dans le simulateur (vue d'établissement,
  décollage, mise en formation…).
- **Le son passe par la bibliothèque AIL 2.0 de Miles Design** : seg161 = `AIL.ASM` compilé
  (fonctions renommées d'après les noms officiels, ex. `AIL_start_sequence_603CC`), sources
  publiques dans `analysis/ail_sources/`. La musique est du XMIDI joué **par le pilote**
  (`ADLIB.ADV` contient l'interpréteur `XMIDI.ASM`). Voir `analysis/MUSIC_SYSTEM.md` §1.
- Le jeu est écrit en **Borland C++**, compilé pour DOS 16 bits (segments
  `far`/`near`, conventions d'appel Borland classiques).
- Il utilise le gestionnaire d'overlay propriétaire de Borland,
  **VROOMM** (cf. `github.com/NancySadkov/devroomm`), pour charger/décharger
  dynamiquement des segments de code au-delà de la limite mémoire DOS.
- Le format de fichier de ressources du jeu est de type **IFF**
  (FORM/CHUNK/PACK), confirmé en toutes lettres par des chaînes de debug
  embarquées. Un décodeur **LZW** compresse certaines ressources.
- Axes du monde 3D. La position (et la vitesse) d'un objet physique est un
  vecteur de **3× i32 en virgule fixe 24.8**, aux offsets objet
  `+0x08 / +0x0C / +0x10`. La **3ᵉ composante (`+0x10`) est l'altitude**
  (`< 0` = sous le sol = crash ; prouvé par `Physics_AllocGroundConstraintVector`
  `sub_466BC` : `cmp dword ptr [si+10h],0 / jl` → branche « sous le sol », après
  un `Terrain_QueryAltitudeAt`). Les composantes 0 et 1 (`+0x08`, `+0x0C`) sont le
  plan horizontal (`+0x08` = X). **Référence secondaire corrigée (session
  2026-09-05)** : la citation précédente (`Aero_ExtractRollMoment sub_48F8E`)
  était fausse — cette fonction (relue intégralement) ne touche à aucun offset
  d'objet `+0x08`, seulement un buffer de pile local (`var_10+8`, sortie de
  `Aero_ComputeForcesMain_4791E`). Le fait lui-même (`+0x08=X`) reste valable,
  porté uniquement par la citation `Physics_AllocGroundConstraintVector` ;
  une vraie seconde source reste à retrouver si nécessaire.
  **Convention de nommage :** côté ASM/jeu on est en **Z-up** — composantes
  `(X, Y, Z)` avec **Z = altitude**. libRealSpace est en **Y-up** — `(X, Y, Z)`
  avec **Y = altitude** : le portage **échange les composantes 1 et 2 et inverse Z**
  (`libRS.x = asm.c0`, `libRS.y = asm.c2`, `libRS.z = −asm.c1`).
  **Pourquoi Z est inversé (essayé et annulé le 2026-10-16) :** le jeu est en repère direct
  (c0 = est, c1 = nord, c2 = haut). Échanger seulement c1 et c2 donne un repère **indirect** ;
  or la caméra de libRealSpace (`Camera::CalcViewMatrix`, OpenGL standard), les rotations de
  l'avion (`rotateM`, nez en −Z) et les modèles sont en repère direct → **image en miroir**
  (est/ouest inversés), qu'aucune correction de cap ne rattrape. Le `−` sur c1 est donc la
  conversion de repère, pas une rustine : il se fait **une seule fois, à la lecture** (terrain,
  pistes `.TRI`, objets posés, positions de mission), et le nord est vers −Z. Le seul autre
  endroit où il se voit est le cap lu dans un fichier : `yaw = 360 − cap` (miroir de l'angle).
  Toute autre compensation de signe sur Z dans le code est un bug de lecture, pas la convention.
  Ne jamais assumer roulis/tangage/lacet sur un axe sans vérification explicite
  dans le code — erreur déjà commise une fois.

## État de la couverture

**Les 3449 fonctions `proc far`/`proc near` de `strike.asm` sont
documentées à 100%**, plus 234 points d'entrée supplémentaires
(labels référencés par vtable ou saut direct, sans bloc `proc`/`endp`
explicite) — 3683 entrées au total dans `analysis/known_functions.json`.

Cette couverture a été **vérifiée par comparaison directe** entre la
liste de toutes les déclarations `proc far/near` du fichier et les clés de
`known_functions.json` — pas par une simple différence arithmétique. Une
précédente affirmation de couverture complète s'était révélée fausse (90
segments nommés `ovrNNN`, 561 fonctions, avaient été silencieusement
ratés par un script d'extraction trop restrictif). **Si tu dois vérifier
la couverture après une modification, relance
`tools/build_function_index.py` : il signale toute fonction sans entrée.**

**Important à comprendre : "documenté" ne veut pas dire "compris en
détail".** Une grande partie des fonctions (~390, souvent les plus grosses
et les plus intéressantes) sont documentées avec un **résumé de haut
niveau basé sur leur signature et leurs appels sortants**, marquées
`⚠️ NON DÉTAILLÉE` dans leur résumé — leur corps n'a **pas** été lu ligne
par ligne. C'est précisément le travail que ce genre de session ciblée
doit accomplir. Voir `analysis/PRIORITY_TARGETS.md` pour la liste triée
par taille.

## OPTEST.EXE (hors-vol)

Second exécutable du jeu, ajouté le 2026-10-17 : `source/optest.asm` (358 861 lignes,
CP437 comme `strike.asm`) et `source/optest.map` (noms IDA seulement, aucun vrai symbole).
Nom interne `OPTTEST.EXE`, lancé par `SC.EXE`. Même compilateur (Borland C++ 1991) et même
gestionnaire d'overlays VROOMM que `STRIKE.EXE` : 171 segments `seg`, 63 `ovr`, 63 `stub`,
1 882 fonctions `proc`.

Contenu repéré par les chaînes et les chunks IFF (fonctions pas encore lues) :
campagne (`gameflow.iff` : `WNGS`, `WING`, `PILT`, `ORDR`), conversations (`convdata.iff`,
`faces.iff`), cinématiques `midgames` (les 11 plus grosses fonctions, une par cinématique,
ovr196 à ovr208), comptabilité (`CASH`), briefings, sauvegarde, options et configuration,
visionneuse d'objets 3D (`objview.pak`), générique et score final.

- **`optest.asm` vient d'un exécutable modifié par Rémi** (octets édités à la main) : les noms de
  visage de mid1 (dseg 7900 et 7988) y valent « pri », **« air » à l'origine** (valeur utilisée par
  `MID_1.IFF` de libRealSpace). Toujours documenter la valeur d'origine ; une valeur lue dans
  `optest.asm` qui contredit les données du jeu peut venir d'une telle modification.
- **Les adresses `sub_XXXXX` sont propres à chaque exécutable** : `sub_5AA4E` d'OPTEST n'a rien à
  voir avec une adresse voisine de STRIKE. Toujours dire de quel exécutable on parle.
- Analyse dans **`analysis/optest/`** : `known_functions.json`, `function_index.json`,
  `segment_boundaries.json`, `annotated_segments/`, `strike_matches.json`.
- Tous les outils de consultation et de génération prennent **`--exe optest`** (défaut `strike`),
  chemins dans `tools/exe_paths.py`.
- **Noms repris de STRIKE.EXE** par `tools/match_functions.py --write` : 567 fonctions dont le
  code est identique (412) ou de même suite d'instructions avec des adresses de données
  différentes (155, « à vérifier »), appels sortants contrôlés. Leur résumé commence par
  « Reprise de STRIKE.EXE » : il décrit la fonction de STRIKE ; appelants et contexte sont à
  revérifier dans OPTEST. Les candidats non tranchés (plusieurs fonctions identiques, ex. familles
  de destructeurs) et les rejets relus à la main sont dans `strike_matches.json`.
- **Couverture : 635 fonctions `proc` sur 1 882** (566 reprises + 69 lues), plus 20 labels de
  tables de méthodes ; `build_function_index.py --exe optest` signale les autres. Les labels de
  méthodes sans référence externe sur leur propre ligne sont listés dans
  `FORCE_INCLUDE_LABELS_OPTEST` (`annotate_segments.py`).
- **Lu (2026-10-17) : moteur des cinématiques** (scène, calques, cadence à 60 Hz, palettes et
  fondus, touches, canaux son), les 12 types de calques (dont la tête parlante synchronisée sur
  les lèvres, `TalkingHead_*`) et la cinématique mid1 (`Midgame1_PlayPart1_5FCF0`,
  `Midgame1_PlayPart2_671C0`). Une entrée écrite à la main n'est jamais
  écrasée par `match_functions.py` (seules les entrées « Reprise de » sont régénérées).

## Structure de l'archive

```
strike_commander_re/
├── CLAUDE.md                        ce fichier
├── source/
│   ├── strike.asm                   désassemblage IDA complet (371 062 lignes)
│   ├── strike.map                   fichier map du linker
│   ├── optest.asm                   désassemblage IDA d'OPTEST.EXE (358 861 lignes)
│   └── optest.map                   fichier map d'OPTEST.EXE
├── analysis/
│   ├── optest/                      analyse d'OPTEST.EXE : mêmes fichiers que ci-dessous
│   │                                  (known_functions, index, annotated_segments)
│   │                                  + strike_matches.json — voir « OPTEST.EXE »
│   ├── known_functions.json         ⭐ la base de connaissance : 3683 entrées
│   │                                  {adresse: {new_name, segment, summary}}
│   ├── function_index.json          ⭐ index enrichi et interrogeable :
│   │                                  known_functions.json + segment, lignes,
│   │                                  taille, appels sortants — pour chacune
│   │                                  des 3449 fonctions proc
│   ├── segment_boundaries.json      bornes ligne_debut/ligne_fin des 461
│   │                                  segments (seg/stub/ovr) de strike.asm
│   ├── annotated_segments/          ⭐⭐ LES 462 SEGMENTS ANNOTÉS ET
│   │                                  RENOMMÉS — dans chaque fichier, tous
│   │                                  les labels documentés (sub_XXXXX,
│   │                                  loc_XXXXX) sont remplacés par leur
│   │                                  nom attribué partout où ils
│   │                                  apparaissent : déclaration, appels,
│   │                                  sauts, commentaires XREF. Un bloc de
│   │                                  résumé précède chaque fonction. Se
│   │                                  lit directement comme du code
│   │                                  compréhensible, sans avoir à
│   │                                  croiser un fichier séparé. Point de
│   │                                  départ recommandé pour explorer un
│   │                                  segment.
│   ├── PRIORITY_TARGETS.md          les ~390 fonctions NON DÉTAILLÉE,
│   │                                  triées par taille décroissante —
│   │                                  point de départ pour choisir une cible
│   ├── DATA_MODEL.md                modèle de données décodé (assets, missions,
│   │                                  physique §6.2, caméras §6.6b) — cité en détail
│   ├── DATA_MODEL.html              version lisible (HTML) du modèle de données :
│   │                                  fichiers, IFF, objets, profils, mission, monde
│   ├── PHYSICS.md                   modèle de vol / dynamique de l'avion
│   ├── IMPL_SCJETPPLANE_CORRECTIONS.md  corrections à porter dans libRealSpace : physique
│   ├── IMPL_SCAIBRAIN_CORRECTIONS.md    corrections à porter dans libRealSpace : IA
│   ├── IMPL_TERRAIN_SKIRTS.md       à porter : jupes du terrain hors carte (cellule du bord répétée)
│   ├── OBJECT_RENDER.md             rendu des objets 3D (FORM POLY) : niveaux de détail, rejet, tri,
│   │                                  éclairage par type de face, textures — lu 2026-10-16
│   ├── IMPL_OBJECT_RENDER.md        à porter dans SCRenderer : gammes RANG, éclairage par type de face,
│   │                                  normales, textures, brouillard, LOD — C++ vérifié à la compilation
│   ├── optest_cd/                   OPTTEST.EXE du CD-ROM (sans IDA, exe_disasm.py) : listings des
│   │                                  conversations avec voix — CONV_SYSTEM.md § 8
│   ├── CONV_SYSTEM.md               conversations d'OPTEST : format de CONV.PAK (commandes 00h–10h),
│   │                                  CONVDATA.IFF, codes $ des textes ; voix de la version CD-ROM
│   │                                  (§ 8) ; consignes et détection voix/texte pour libRealSpace (§ 7, § 9)
│   ├── GAMEFLOW_SYSTEM.md           déroulement de la campagne (OPTEST) : GAMEFLOW.IFF, boucle principale,
│   │                                  scènes et REQU, les 39 commandes des scripts EFCT (43 sur CD), compte rendu
│   │                                  de vol misn2op.iff, écarts avec SCGameFlow de libRealSpace
│   ├── MIDGAME_SYSTEM.md            cinématiques d'OPTEST (moteur de scène, calques, déplacements,
│   │                                  suites d'images, bouches, fondus) ; mid1 en exemple ; rapport
│   │                                  avec SCAnimationArchive de libRealSpace
│   ├── MID1_PLANS.md                MID_1.IFF produit par l'outil : plans, règles de conversion,
│   │                                  hypothèses et limites
│   ├── MUSIC_SYSTEM.md              ⭐ système musical (AIL/XMIDI, combat.dat/.adl,
│   │                                  transitions, déclencheurs, effets sonores, voix)
│   ├── ADLIB_DRIVER.md              pilote AdLib OPL2 (ADLIB.ADV) — registres, tables
│   ├── ail_sources/                 sources publiques AIL 2.0 (AIL.ASM, AIL.INC, XMIDI.ASM)
│   ├── adlib_driver_source/         ADLIB.ADV + son désassemblage
│   ├── sample_dat_files/            COMBAT.DAT réel + décodage JSON
│   ├── sample_prof_files/           fichiers PROF d'exemple (Billy, Stern, Gwen, Hammer, C-130…)
│   ├── CAMERA_SYSTEM.md             ⭐ référence caméra : format COMP, parsing
│   │                                  WRLD/CAMR, caméra de suivi (F2) — pour
│   │                                  l'implémentation du système de caméra
│   ├── README.md                    récit des découvertes structurelles
│   │                                  majeures, avec justification et
│   │                                  citations de code — la référence pour
│   │                                  comprendre CE QUI a déjà été trouvé
│   └── SESSION_LOG.md               journal chronologique détaillé de la
│                                      session précédente (segment par
│                                      segment) — utile pour retrouver le
│                                      raisonnement exact d'une décision de
│                                      nommage passée, sinon secondaire
└── tools/
    ├── exe_paths.py                 chemins par exécutable ; tous les outils ci-dessous
    │                                  prennent --exe optest (défaut strike)
    ├── conv_dump.py                 lecteur des scripts de conversation (CONV.PAK) → texte ;
    │                                  conv_scene.py : rendu d'une scène de groupe → PNG
    ├── conv_ref/                    conversations, code de référence : parseur C++ (boucle de premier niveau,
    │                                  sous-parseurs, erreurs), test de format, lèvres et clignement, rejeu de la
    │                                  détection de libRealSpace, export des deux formats — README.md, CONV_SYSTEM § 9
    ├── midgame_extract.py           cinématiques d'OPTEST : pseudo-code (.md) et arbre (.json)
    ├── midgame_iff.py               rejoue le .json d'une cinématique et écrit le MID_*.IFF
    │                                  (format ANIM version 2 de libRealSpace) — MID1_PLANS.md
    ├── midgame_render.py            rendu de référence d'une cinématique avec les données du jeu
    │                                  (GIF ; --donnees <DATA>) ; sc_data.py : PAK, LZW, palettes, images
    ├── tre_extract.py               extrait BIGTRE.TRE (données du jeu, jamais dans le dépôt)
    ├── midgame_check.py             lecteur de contrôle d'un MID_*.IFF, comparé au rendu de référence
    │                                  (règles = spécification de SCAnimationPlayer, MID1_PLANS.md)
    ├── exe_disasm.py                désassemble un EXE DOS sans IDA (capstone) : OPTTEST.EXE du CD-ROM,
    │                                  chaînes du DGROUP et appels annotés — CONV_SYSTEM.md § 8
    ├── match_functions.py           retrouve dans OPTEST les fonctions identiques à
    │                                  celles de STRIKE et reprend leurs noms (--write)
    ├── extract_segment.py           liste les fonctions d'un segment donné
    ├── dump_func.py                 affiche une plage de lignes de strike.asm
    ├── lookup.py                    ⭐ consultation rapide : cherche une
    │                                  fonction par adresse/nom, liste un
    │                                  segment, ou affiche les cibles
    │                                  prioritaires
    ├── build_function_index.py      reconstruit function_index.json à
    │                                  partir de strike.asm +
    │                                  known_functions.json
    ├── sc_player/                   ⭐ lecteur de la musique du jeu (C++ + SDL2/ImGui) :
    │                                  séquenceur du jeu, XMIDI et pilote AdLib portés
    │                                  depuis le code ; voir tools/sc_player/README.md
    ├── tri_map.py                   lecteur .TRI (d'après DATA_MODEL.html seul) → vue SVG
    ├── terrain_map.py               lecteur <théâtre>.PAK (PAK, LZW, altitudes) → relief PNG
    ├── terrain_viewer.py (+ .html)  visionneuse interactive du terrain (zoom, pistes, objets) ;
    │                                  terrain_3d.py : vue 3D Pygame + PyOpenGL, rendu du jeu, jupes hors carte (--skirt) ;
    │                                  vue 3D WebGL <nom>_3d.html générée avec la visionneuse ;
    │                                  données d'essai dans data/ (ALASKA.PAK, ALASKA.TRI…)
    ├── object_render.py             rendu logiciel d'un objet .IFF comme le jeu (OBJECT_RENDER.md) → PNG
    ├── object_viewer.py (+ .html)   même rendu en WebGL : page autonome <objet>_viewer.html (orbite, LOD, options)
    └── annotate_segments.py         ⭐ régénère analysis/annotated_segments/
                                       à partir de strike.asm +
                                       known_functions.json — à relancer
                                       après toute mise à jour de
                                       known_functions.json pour que les
                                       fichiers annotés restent à jour
```

## Démarrage rapide

Tous les outils s'exécutent avec `python3`, sans dépendance externe.
Lancer depuis la racine de l'archive (`strike_commander_re/`) :

```bash
# Ouvrir un segment déjà annoté ET renommé (les sub_XXXXX apparaissent
# directement sous leur nom descriptif, y compris dans les appels et les
# commentaires XREF) dans n'importe quel éditeur de texte — c'est le
# point de départ le plus confortable pour explorer une zone
less analysis/annotated_segments/ovr239_annotated.asm

# Voir les fonctions prioritaires (plus grosses, non détaillées)
python3 tools/lookup.py --priority 20

# Chercher une fonction par nom ou adresse
python3 tools/lookup.py Expr_VM_Interpreter
python3 tools/lookup.py sub_7B035

# Lister toutes les fonctions d'un segment
python3 tools/lookup.py --segment seg114

# Lire le code source d'une fonction (bornes données par lookup.py) —
# version non annotée, ligne à ligne
python3 tools/dump_func.py 161842 163718

# Lister les fonctions d'un segment directement depuis strike.asm
# (utile si le segment est trop récent pour être dans l'index, ou pour
# une vérification croisée)
python3 tools/extract_segment.py ovr239

# Même chose pour OPTEST.EXE : ajouter --exe optest
less analysis/optest/annotated_segments/ovr191_annotated.asm
python3 tools/lookup.py --exe optest --segment ovr191
python3 tools/build_function_index.py --exe optest
python3 tools/annotate_segments.py --exe optest
```

`lookup.py` résout aussi les adresses appelées par une fonction vers leur
nom attribué quand il existe — pratique pour comprendre le contexte d'une
grosse fonction avant de la lire en détail.

**Attention** : `annotated_segments/` est une vue de lecture, pas la
source de vérité. Les numéros de ligne dans `function_index.json` et
`PRIORITY_TARGETS.md` correspondent à `source/strike.asm` (non renommé,
non modifié) — c'est toujours ce fichier qu'utilisent `dump_func.py`,
`extract_segment.py` et `lookup.py`. Pour retrouver une fonction dans son
fichier de segment annoté, chercher son **nom attribué** avec `grep` ou la
recherche de l'éditeur plutôt que par numéro de ligne.

## ⚠️ Règle de lecture (obligatoire) : segments annotés d'abord

Pour **toute** lecture de code, utiliser en priorité
`analysis/annotated_segments/<segment>_annotated.asm`. C'est le format prévu
pour être lu : labels renommés partout (déclarations, appels, sauts,
commentaires XREF) et bloc de résumé avant chaque fonction.

- `source/strike.asm` n'est un **recours de dernier ressort** que si
  l'information n'est réellement pas dans le fichier annoté (ex. vérifier un
  octet exact d'un opcode que l'annotation n'a pas commenté).
- `source/strike.asm` est encodé en **DOS CP437**, pas UTF-8. Le lire en UTF-8
  fait planter `awk`/`grep -P`/Python. Si tu dois vraiment l'ouvrir en script,
  `encoding="cp437"` (ou `latin-1`). Les fichiers annotés, eux, sont propres.
- Si un `<segment>_annotated.asm` **manque ou paraît incomplet**, ce n'est pas
  une raison de basculer sur `strike.asm` : c'est le signe qu'une session
  précédente (ou toi) n'a pas terminé le travail d'annotation. Régénère avec
  `python3 tools/annotate_segments.py`, et si le segment reste absent,
  complète `known_functions.json` puis relance — ne contourne pas.
- Les stubs VROOMM (`sub_6Cxxx` etc.) sont résolus dans les fichiers annotés
  vers leur cible réelle (`jmp sub_XXXXX`) : pour suivre une délégation
  d'overlay, ouvrir le `_annotated.asm` du segment cible, pas `strike.asm`.

## ⚠️ Méthode de recherche : suivre la donnée jusqu'au bout

Pour trouver « où telle donnée est lue/écrite/rendue », on **trace le flot
d'appels**, on ne cherche pas au hasard. Erreur déjà commise : conclure
« ce n'est pas fait / code mort » après avoir lu quelques fonctions —
alors que la bonne fonction était derrière un stub non remonté
(`.TRI` : trouvé via `Model_RenderMain` → stub `sub_6BD30` → `sub_99120`,
après avoir perdu du temps sur le pipeline terrain).

Règles :
1. **Ne jamais conclure « pas implémenté / dead code ».** Si Rémi dit que
   c'est dans le jeu, c'est dans le jeu. Une branche qui ne donne rien
   veut dire *cette* branche, pas *le mécanisme*.
2. **Résoudre CHAQUE `call` / `jmp` indirect.** Les stubs VROOMM
   (`sub_6Bxxx`/`sub_6Cxxx` → `jmp sub_XXXXX`) se résolvent dans
   `strike.asm` (`grep -A1 '^sub_XXXX\s\+proc'`) ou dans les résumés
   `known_functions.json`. Un `call dword ptr [bx+N]` = appel de vtable :
   remonter le type de l'objet et lister ses méthodes.
3. **Chercher par constantes révélatrices**, pas par nom de concept :
   tag FourCC (`push large 0xXXXXXXXX`), taille de struct (`push NNh` avant
   un `malloc`), stride de record (`imul ax, NNh`, `shl ax, K`), chaîne de
   debug (`aXxx` en opérande).
4. **Remonter ET descendre** : `; CODE XREF:` en tête de fonction donne
   les appelants ; les `call` internes donnent les appelés. Le parseur
   d'un format est souvent appelé depuis le *rendu* ou le *chargeur de
   plus haut niveau*, pas là où on l'attend.
5. **Trace complète attendue** : point d'entrée → … → fonction cible,
   avec le nom de chaque maillon. Si un maillon manque, c'est là qu'il
   faut creuser, pas ailleurs.

## Comment lancer une session de décodage ciblée

1. **Choisir une cible.** Consulter `analysis/PRIORITY_TARGETS.md` ou
   `python3 tools/lookup.py --priority N`. Les toutes premières lignes
   (fonctions de plusieurs centaines à plusieurs milliers de lignes) sont
   les meilleures candidates — elles ont un impact large et n'ont jamais
   été lues.
2. **Rassembler le contexte.** `python3 tools/lookup.py <adresse>` donne
   le résumé existant et la liste des appels sortants déjà nommés — ça
   donne souvent de bons indices sur le rôle de la fonction avant même de
   lire son code.
3. **Lire le code en détail**, ligne par ligne, **dans le fichier
   `analysis/annotated_segments/<segment>_annotated.asm`** (voir la règle de
   lecture ci-dessus) ; `dump_func.py` sur `strike.asm` seulement en dernier
   recours. Ne pas se contenter de repérer les motifs déjà vus (allocation,
   appel de telle fonction connue) — c'est le travail déjà fait pour
   l'inventoriage rapide. Une session dédiée doit comprendre le *pourquoi*,
   pas seulement le *quoi*.
3bis. **Chercher le contexte dans `README.md`** si le sous-système est déjà
   partiellement documenté (rechercher le nom de segment ou le thème —
   ex. "IFF", "VROOMM", "Expr_VM", "AudioQueue").
4. **Mettre à jour `known_functions.json`** avec un résumé enrichi une
   fois la fonction comprise — retirer la mention `NON DÉTAILLÉE` et
   documenter le rôle exact. Respecter le format existant :
   ```json
   "sub_XXXXX": {
     "new_name": "Categorie_RoleCourtEnAnglaisOuFrancais_ADRESSE",
     "segment": "segNNN",
     "summary": "far/near, description précise du rôle, avec citations de code si utile pour justifier."
   }
   ```
5. **Relancer `build_function_index.py` et `annotate_segments.py`** après
   modification de `known_functions.json`, pour que l'index et les
   segments annotés reflètent les nouveaux résumés.
6. **Documenter toute découverte structurelle** (nouveau sous-système,
   nouveau format de données, lien inattendu entre deux zones du code)
   dans `README.md`, dans le même style que les sections « Découverte
   majeure » existantes — avec citations de code à l'appui, pas
   d'affirmation non sourcée.

## Convention de nommage

`Categorie_RoleCourtEtDescriptif_ADRESSE` — l'adresse (ex. `_51106`) est
**toujours conservée en suffixe** pour la traçabilité, même après
renommage. Exemples : `AI_ThrottleController_6250`,
`Expr_VM_Interpreter_51106`, `Player_ShotDownSequence_7B035`.

## Pièges méthodologiques déjà rencontrés (à ne pas répéter)

- **Ne jamais fusionner ou supprimer deux fonctions qui se ressemblent**
  sans avoir vérifié qu'elles sont identiques *byte pour byte*. Le système
  d'overlay VROOMM duplique structurellement du code entre segments (des
  familles entières de destructeurs quasi identiques existent réellement,
  générées par le compilateur pour chaque classe d'une hiérarchie) — ce
  n'est pas une erreur d'extraction, c'est le binaire réel.
- **Ne jamais assumer un axe (roulis/tangage/lacet, ou toute convention
  géométrique) sans le vérifier explicitement dans le code.** Erreur déjà
  commise une fois sur la confusion roulis/tangage.
- **La couverture "100%" concerne les déclarations `proc`, pas la
  compréhension.** Ne pas confondre "toutes les fonctions ont une entrée
  JSON" avec "toutes les fonctions sont comprises" — voir
  `PRIORITY_TARGETS.md`.
- **Vérifier par script, pas par calcul mental**, toute affirmation de
  couverture (voir l'incident des segments `ovrNNN` ci-dessus) — utiliser
  `build_function_index.py` qui compare directement contre les
  déclarations `proc` du fichier source.
- Deux styles de fonctions coexistent dans `strike.asm` : des blocs
  explicites `proc far/near ... endp`, et de simples labels (souvent
  `loc_XXXXX`) référencés depuis un autre segment (méthodes de vtable,
  points d'entrée de stubs VROOMM) qui sont de vraies fonctions sans bloc
  `proc` formel. `extract_segment.py` détecte les deux cas.
- **Sinus et cosinus : les noms historiques étaient INVERSÉS** (prouvé 2026-09-24 par la
  table `seg213` : l'octet i est cos(i/4°) en 24.8, 1,0 = 256). L'ex-`Math_Sin_5483F` est un **cosinus**
  (`Math_CosDeg_5483F`), l'ex-`Math_Cos_54876` est un **sinus** (`Math_SinDeg_54876`) ; même
  chose pour les versions brutes (`Math_CosRaw_580A7`, `Math_SinRaw_58063`). Tout résumé ou
  document écrit avant cette date qui déduit un « sin » ou un « cos » de ces noms est à relire
  (les résumés concernés portent un ⚠️). **Les arcs sont inversés aussi** : l'ex-`Math_ArcSin*`
  est un arc cosinus (`Math_AcosDeg_5493E`, `Math_AcosRaw_581E3`, `Math_AcosOfRatio_54A0E`),
  l'ex-`Math_ArcCos*` un arc sinus (`Math_AsinDeg_549A6`, `Math_AsinRaw_581A0`,
  `Math_AsinOfRatio_54A76`) ; l'arc tangente (`Math_ArcTan_Raw_58223`, table tan) est juste.
  L'ex-`Math_AngleBetweenVectors_552E1` ne prend qu'UN vecteur : c'est son angle d'élévation
  (`Math_ElevationAngle_552E1`). Relu : la loi de charge (`Aero_ComputeAoACommand_48862`)
  utilise bien cos(tangage) — l'ancien résultat était juste par deux erreurs qui s'annulaient.
- **libRealSpace calcule en FLOTTANTS, pas en 24.8.** Le 24.8 n'est que le format interne de
  l'original. Ce qu'on écrit pour Rémi (formules, constantes, champs de fichier) se donne en
  **valeurs réelles** (degrés, distances, secondes, 1,0 et pas 0x100), avec pour chaque champ de
  fichier la conversion à la lecture : un dword utilisé tel quel dans un calcul en virgule fixe
  → **÷ 256** ; un word/octet converti par `<< 8` dans le code → **entier tel quel**. Côté
  assembleur, ne pas confondre les échelles : `shl 8` / `sar 8` / `imul`+`shrd 8` / `0x100` =
  virgule fixe ; `/ 0x8000` après `CRT_Rand` = échelle de `rand()`
  (`Math_RandomScale_54DF4(n)` = entier 0..n−1). Ne jamais écrire « valeur·256 » dans une
  formule destinée au portage.
- **Quand Rémi localise un bug ou exclut une piste**, c'est une contrainte
  dure, pas une hypothèse à confirmer parmi d'autres. « c'est dans le code
  que tu viens d'écrire », « ce n'est pas le dt », « c'est un signe dans
  les angles », « tu te trompes d'axe » : il a raison ~à chaque fois (méthode
  empirique, il vérifie avant de parler). → relire **d'abord** le code
  exact qu'il désigne, ligne par ligne, avant d'ouvrir un autre système ;
  ne pas instrumenter/ré-expliquer une piste qu'il a fermée ; ne pas
  « écarter des possibilités » en explorant des sous-systèmes non
  familiers. Debug = pleine résolution sur ce qu'il pointe (pas
  d'échantillonnage/skip de frames). Incident 2026-08-30 : jitter caméra
  STARTCAM annoncé « c'est tes maths, pas le dt » → 4 tours perdus à
  sonder `DesktopTimer`/`GameEngine` ; le bug était une annulation
  catastrophique float32 dans `refreshOutputs` (`Camera::lookAt` avec un
  point de visée à 1 unité aux coordonnées monde ~1e5).

## Sous-systèmes majeurs déjà identifiés (résumé — détails dans README.md)

| Sous-système | Segments clés | Points d'entrée notables |
|---|---|---|
| VROOMM (overlay manager Borland) | seg000, seg212, table de stubs seg216-429 | `VROOMM_MainEntry_68B2F` |
| VM à bytecode (Expr_VM) | seg114 | `Expr_VM_Interpreter_51106` (209 opcodes, **jamais lu en détail**) |
| Mémoire paginée / EMS | seg127-138 | `MemoryManager` (nom confirmé par chaînes de debug) |
| Format de ressources IFF + LZW | seg193-197 | `ResourceRecord_*`, `LZW_Decompress_66068` |
| Bibliothèque son AIL 2.0 (minuteries, pilotes, API) | seg161 | `AIL_API_timer_ISR_5FBBE`, `AIL_call_driver_5FBA6` |
| Musique (XMIDI, transitions, déclencheurs) | seg121-125, seg458 | `Music_RequestTune_5A984`, `Music_TuneTransitionResolve_595C2` |
| Système clavier (bas niveau → file d'événements) | seg202-203, seg211 | `Keyboard_BIOSInterceptHandler_681BC` |
| Système souris | seg210 | `Mouse_EventCallback_68109` |
| Segment de données global (vtables + 378 chaînes debug) | seg339 | — (pas de fonctions, uniquement données) |
| Chargeur de mission | seg455 | `MissionLoader_LoadEntitiesMain_A767F` |
| Cluster AudioQueue (file audio/messages indexée) | seg458-461 | `AudioQueue_ProcessMain_AA84E` |
| IA de manœuvre/ciblage | ovr230-232 | `AI_ManeuverSolutionMain_781D0` (**jamais lu en détail**) |
| Séquences avion abattu / éjection (ex-« base d'entités de mission ») | ovr239-240 | `Player_ShotDownSequence_7B035` (**la plus grosse fonction du fichier**, rôle tracé, corps jamais lu en détail), `Player_EjectSequence_7D31A` |

Pour le récit complet de chaque découverte (avec justification), voir les
sections « ⭐ Découverte majeure » de `analysis/README.md`, numérotées de 1
à 12 dans l'ordre chronologique de découverte.

## Questions ouvertes (candidates pour prochaines sessions)

1. `Expr_VM_Interpreter_51106` — jamais lu en détail malgré son rôle
   transversal central (HUD, IA, UI, mission passent tous par cette VM).
2. `Player_ShotDownSequence_7B035` (3103 lignes, ovr239) — la
   plus grosse fonction du fichier : séquence jouée quand l'avion du joueur est
   détruit (charge `EJECT.PAK`, piste 0x0B ; voir `MUSIC_SYSTEM.md` §5.4). Corps à lire.
3. `AI_ManeuverSolutionMain_781D0` (2373 lignes, ovr232) — cœur probable
   du calcul de manœuvre de combat aérien.
4. ~~Contenu du cluster AudioQueue~~ : catalogue musical **et** son numérisé VOC ; système son entièrement décrit dans `MUSIC_SYSTEM.md` (questions restantes : §8).
5. **Tick physique de l'avion : tranché** — c'est **`PhysicsTicks`**
   (seg103, ~0x4A85B ; slot Update des vtables de la classe `JDYN`, appelé par
   4 thunks seg082). `FlightPhysics_TickCandidate_4F4EE` (seg109) est le tick
   des 3 classes `DYNM` simples (missile/bombe). Détail (poussée, carburant,
   autopilote, entrées) : `analysis/DATA_MODEL.md §6.2`. **Modèle de vol
   décodé** (`DATA_MODEL.md §6.2`) — bilan **en repère corps** (c0 envergure,
   c1 nez, c2 normale), transformé corps→monde par `Physics_IntegratePosition` :
   `accel = (poussée + portance+latéral + traînée)/masse + gravité` ;
   poussée = `(0, jdyn[0x28], 0)` ; **portance explicite**
   `Aero_ComputeLiftAndSideForce` (`sub_4812B`, ex-`DetectControlSaturation`) =
   `k·α_eff·q·n̂(0,−v.c2,v.c1)`, `α_eff = α(`Aero_FlowAngle_AoA`) + calage aile
   `jdyn[0x4C]` (+ volets `jdyn[0x4D]`), borné `jdyn[0x4B]` = décrochage ;
   `q = ½·v²·coeff(vitesse-air)` via table 1-D lerp `Aero_ResolveAeroCoeffTable`
   (`sub_46DA3`) ; traînée `Aero_ComputeDragWithFeedback` (`sub_48400`) ;
   moments = asservissement `±2·√(q'·err)` rate-limité, zone morte |err| < 0,21875° ; gains de dégâts et mode pilote automatique : `PHYSICS.md` §5.9 et §9 ; corrections du portage : `analysis/IMPL_SCJETPPLANE_CORRECTIONS.md`
   (`Aero_ComputeForcesMain`). **Pas de trim pilote** (accès direct axes).
   `jdyn[0x4C]/0x4D` = constantes de cellule (calage/volets), pas des trims.
   `FlightControl_ComputeMomentA/B/C` renommés `Aero_FlowAngle_AoA/Sideslip` /
   `Aero_DynamicPressure` ; `Vector_TransformHelperB_559BB` = **normalisation**,
   pas une rotation. **Tranché (2026-09-26)** : vtable JDYN (`0x228A`, base `seg339`
   corrigée `0x6D0B0` → `0x6F33A`) : `+0x34` = `JDYN_UpdateDamageGains_494DD`,
   `+0x3C` = `JDYN_TotalMass_47FF8` = **masse à vide `DYNM` + carburant + emport**
   (diviseur des forces et `X` de la loi de charge) ; 3 u8 du chunk `THRS` = fractions
   MIL / lapse / coupure ; `JDYN +0x80..0x8B` = paramètres IA, `+0x8A` jamais lu.
6. ~~Rôle de la souris~~ **tranché** : contrôle de la vue 3D du cockpit
   (pas le pilotage), mutuellement exclusif avec les axes de vol via
   `word_71200`. Voir `DATA_MODEL.md §6.2`.
7. Consommation de la file d'événements clavier par la boucle de jeu
   (l'écriture est tracée, pas la lecture) — inclut le dispatcher de la
   manette des gaz (`+`/`-`, `1`…`0`, MIL/AFT), hors `Player_MainUpdate`.
