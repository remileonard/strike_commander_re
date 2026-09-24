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

*(Rappel d'incident : une session a mené toute une investigation dans
`strike.asm` et rendu des résultats en `sub_XXXXX`, obligeant Rémi à
rechercher chaque nom dans `known_functions.json`. À ne pas reproduire.)*

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
  avec **Y = altitude** : le portage **échange les composantes 1 et 2**
  (`libRS.x = asm.c0`, `libRS.y = asm.c2`, `libRS.z = asm.c1`).
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

## Structure de l'archive

```
strike_commander_re/
├── CLAUDE.md                        ce fichier
├── source/
│   ├── strike.asm                   désassemblage IDA complet (371 062 lignes)
│   └── strike.map                   fichier map du linker
├── analysis/
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
│   ├── PHYSICS.md                   modèle de vol / dynamique de l'avion
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
    ├── extract_segment.py           liste les fonctions d'un segment donné
    ├── dump_func.py                 affiche une plage de lignes de strike.asm
    ├── lookup.py                    ⭐ consultation rapide : cherche une
    │                                  fonction par adresse/nom, liste un
    │                                  segment, ou affiche les cibles
    │                                  prioritaires
    ├── build_function_index.py      reconstruit function_index.json à
    │                                  partir de strike.asm +
    │                                  known_functions.json
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
`Expr_VM_Interpreter_51106`, `MissionRecord_LoadEntityDatabase_7B035`.

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
  table `seg213`, `table[i] = cos(i/4°)·256`). L'ex-`Math_Sin_5483F` est un **cosinus**
  (`Math_CosDeg_5483F`), l'ex-`Math_Cos_54876` est un **sinus** (`Math_SinDeg_54876`) ; même
  chose pour les versions brutes (`Math_CosRaw_580A7`, `Math_SinRaw_58063`). Tout résumé ou
  document écrit avant cette date qui déduit un « sin » ou un « cos » de ces noms est à relire
  (les résumés concernés portent un ⚠️) ; en particulier la loi de charge du modèle de vol
  (`Aero_ComputeControlFlags75Bit5B` : `var_30` est le **cosinus** de l'angle nez / Z monde,
  donc ≈ sin(tangage), et non ≈ cos(tangage)).
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
| Registre de modules à créneaux temporisés | seg161 | `ModuleRegistry_TimerISR_5FBBE` |
| Système clavier (bas niveau → file d'événements) | seg202-203, seg211 | `Keyboard_BIOSInterceptHandler_681BC` |
| Système souris | seg210 | `Mouse_EventCallback_68109` |
| Segment de données global (vtables + 378 chaînes debug) | seg339 | — (pas de fonctions, uniquement données) |
| Chargeur de mission | seg455 | `MissionLoader_LoadEntitiesMain_A767F` |
| Cluster AudioQueue (file audio/messages indexée) | seg458-461 | `AudioQueue_ProcessMain_AA84E` |
| IA de manœuvre/ciblage | ovr230-232 | `AI_ManeuverSolutionMain_781D0` (**jamais lu en détail**) |
| Base de données d'entités de mission | ovr239-240 | `MissionRecord_LoadEntityDatabase_7B035` (**la plus grosse fonction du fichier, jamais lue en détail**) |

Pour le récit complet de chaque découverte (avec justification), voir les
sections « ⭐ Découverte majeure » de `analysis/README.md`, numérotées de 1
à 12 dans l'ordre chronologique de découverte.

## Questions ouvertes (candidates pour prochaines sessions)

1. `Expr_VM_Interpreter_51106` — jamais lu en détail malgré son rôle
   transversal central (HUD, IA, UI, mission passent tous par cette VM).
2. `MissionRecord_LoadEntityDatabase_7B035` (3103 lignes, ovr239) — la
   plus grosse fonction du fichier.
3. `AI_ManeuverSolutionMain_781D0` (2373 lignes, ovr232) — cœur probable
   du calcul de manœuvre de combat aérien.
4. Contenu exact du cluster AudioQueue (seg458-461) : audio ou texte ?
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
   moments = asservissement `±2·√(q'·err)` rate-limité, nul si err ≥ 56°
   (`Aero_ComputeForcesMain`). **Pas de trim pilote** (accès direct axes).
   `jdyn[0x4C]/0x4D` = constantes de cellule (calage/volets), pas des trims.
   `FlightControl_ComputeMomentA/B/C` renommés `Aero_FlowAngle_AoA/Sideslip` /
   `Aero_DynamicPressure` ; `Vector_TransformHelperB_559BB` = **normalisation**,
   pas une rotation. **Reste** : ligne exacte des overrides vtable `+0x3C`
   (masse ≈ chunk `DYNM`) et `+0x34` (position) dans la vtable JDYN primaire ;
   3 u8 du chunk `THRS` (`+0x0E/0F/10`) ; `JDYN +0x80..0x8B`.
6. ~~Rôle de la souris~~ **tranché** : contrôle de la vue 3D du cockpit
   (pas le pilotage), mutuellement exclusif avec les axes de vol via
   `word_71200`. Voir `DATA_MODEL.md §6.2`.
7. Consommation de la file d'événements clavier par la boucle de jeu
   (l'écriture est tracée, pas la lecture) — inclut le dispatcher de la
   manette des gaz (`+`/`-`, `1`…`0`, MIL/AFT), hors `Player_MainUpdate`.
