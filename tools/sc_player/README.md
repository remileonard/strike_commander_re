# sc_player — lecteur de la musique de Strike Commander

Reproduit la chaîne musicale du jeu, chaque étage étant porté depuis le code :

| Étage | Fréquence | Source portée | Fichier |
|---|---|---|---|
| Séquenceur du jeu : 4 états, transitions calées sur la barre de mesure, pistes de liaison, ponctuations | 20 Hz | `Music_SequencerTickISR_5940B`, `Music_TuneTransitionResolve_595C2`, `Music_TuneTransitionCommit_5974D`, `Music_ChannelRegisterSequence_59FF5`, `Music_InstallTimbre_5A62A`, `Music_StopWithFade_AB1EF` (seg121-125) | `librealspace/SCMusicSequencer.cpp` |
| Interpréteur XMIDI (file de notes, tempo, mesures, boucles FOR/NEXT, volume relatif) | 120 Hz | `XMIDI.ASM` d'AIL 2.0, avec les écarts de la version compilée dans `ADLIB.ADV` | `librealspace/AILXmidiDriver.cpp` |
| Partie voix du pilote AdLib (16 voix → 9 canaux OPL2, priorités, timbres OPL simples et TVFX) | 120 Hz (TVFX à 60 Hz) | `ADLIB.ADV` lu dans `analysis/adlib_driver_source/adlib.asm` | `librealspace/AILAdlibDriver.cpp` |
| Tables du pilote (F-Number, octaves, vélocité, registres initiaux, contrôleurs par défaut) | — | extraites du binaire `ADLIB.ADV` | `librealspace/AILAdlibTables.h` (généré par `tools/gen_adlib_tables.py`) |
| Données d'un jeu de musique (`COMBAT.DAT` + pistes de `COMBAT.ADL`) et bibliothèque de timbres `STRIKE.AD` | — | `AudioQueue_LoadTrackTable_AACA6`, `AudioQueue_LoadTransitionTable_AAFA0`, `Music_LoadTimbreFromLibrary_5A577` | `librealspace/SCMusicSet.cpp` |
| Constantes MIDI / XMIDI (types de message, contrôleurs avec les noms d'`AIL.INC`, évènements meta) | — | `analysis/ail_sources/AIL.INC` | `librealspace/AILMidi.h` |
| Test des timbres (liste, jouer, Note Off) | — | `Music_InstallTimbre_5A62A` | `librealspace/SCTimbreTest.cpp` |
| Archive indexée + LZW (lecteur autonome seulement) | — | `IndexedRecordReader_*` (seg196), `LZW_Decompress_66068` (seg197) | `src/SCArchive.cpp` |

Tout est en **C++17**. Seul l'émulateur Nuked-OPL3 (`third_party/`) reste en C.

- `librealspace/` (bibliothèque `sc_music_core`) ne dépend ni de SDL, ni d'ImGui, ni du format
  d'archive : **ce répertoire se copie tel quel dans libRealSpace**. On lui fournit une fonction
  d'écriture de registre OPL, puis on appelle `AILXmidiDriver::serve()` à 120 Hz et
  `SCMusicSequencer::tick()` à 20 Hz.
- `src/` est propre au lecteur autonome : `main.cpp` (interface, rendu WAV) et `SCArchive`
  (lecture des fichiers du jeu, rôle que tient `PakArchive` dans libRealSpace).

Le passage du C au C++ (2026-10-10) ne change pas le rendu. Sur les vrais fichiers, l'ancien et le
nouveau lecteur produisent des WAV **identiques octet pour octet** :
- 60 s de musique de combat, avec des demandes 4 → 0x10 → 9 → 0x13 puis un arrêt avec fondu ;
- les 87 TVFX joués l'un après l'autre (`--timbre-wav`).

## Utilisation dans libRealSpace

```cpp
#include "AILAdlibDriver.h"
#include "AILXmidiDriver.h"
#include "SCMusicSequencer.h"

opl3_chip chip;  AILAdlibDriver adl;  AILXmidiDriver xmi;  SCMusicSequencer seq;
SCMusicSet combat;  SCTimbreLibrary lib;

// chargement (avec PakArchive) :
//   COMBAT.DAT : enregistrement 0          -> combat.parseDat(data, size)
//   COMBAT.ADL : entree 0 du fichier = le jeu ; dans le jeu :
//                [0] archive des pistes de liaison -> combat.linkTracks
//                [1..N] pistes principales          -> combat.tracks
//   STRIKE.AD  : fichier entier (le buffer doit rester vivant) -> lib.set(data, size)

OPL3_Reset(&chip, rate);
adl.init([&](uint16_t reg, uint8_t val) { OPL3_WriteReg(&chip, reg, val); });
xmi.init(&adl);
seq.init(&xmi, &lib);
seq.setMusicSet(&combat);
seq.request(4);          // Music_RequestTune_5A984 ; seq.stop(true) = arret avec fondu

// dans le rappel audio (Mix_HookMusic avec SDL_mixer) : generer les echantillons avec
// OPL3_GenerateStream, en appelant xmi.serve() tous les rate/120 echantillons et
// seq.tick() tous les rate/20 (voir render() dans src/main.cpp).
// Piste isolee (GAMEFLOW, MIDGAMES, SOUNDFX) : SCMusicSequencer::registerAndStart(&xmi, &lib, data, size, &err).
```

Versions de `RSMusic` et `RSMixer` prêtes à intégrer : voir `integration/README.md`.

## Fichiers du jeu nécessaires

Dans le répertoire `SOUND` du jeu (le nom est cherché sans tenir compte de la casse) :

- `COMBAT.DAT` : longueur de phrase, matrice et entrées de liaison ;
- `COMBAT.ADL` : les pistes XMIDI, principales et de liaison ;
- `STRIKE.AD` : la bibliothèque de timbres. Son nom vient du code du jeu : `"strike"` + `"."` +
  le suffixe déclaré par le pilote, soit `"AD"` pour `ADLIB.ADV`.

## Compilation

```sh
mkdir build && cd build && cmake .. && make
```

Il faut SDL2 (paquet `libsdl2-dev`). ImGui et Nuked-OPL3 sont fournis dans `third_party/`.

## Utilisation

```sh
./build/sc_player --sound /chemin/du/jeu/SOUND             # interface graphique
./build/sc_player --sound SOUND --tune 0x13                # piste de départ
./build/sc_player --sound SOUND --wav out.wav --seconds 60 --tune 4 --at 10:0x10 --at 30:stop
```

- `--at T:N` demande la piste N à l'instant T. `--at T:stop` déclenche un arrêt avec fondu d'une seconde.
- En mode WAV, chaque changement d'état est écrit sur la sortie d'erreur, avec la mesure, la position
  dans la phrase et l'entrée de liaison utilisée.
- `--screenshot f.bmp` enregistre la fenêtre au bout de 2 s, puis quitte.

L'interface propose un bouton par piste, libellé avec l'événement du jeu qui la déclenche
(`analysis/MUSIC_SYSTEM.md` §5.5). Elle affiche l'état du séquenceur, la mesure, la piste de reprise
et la dernière résolution de liaison.

## Test des timbres (TVFX)

L'onglet « Test des timbres (TVFX) » propose une **liste déroulante** des timbres de `STRIKE.AD`.
Elle se filtre par banque, avec une case « TVFX seulement », cochée par défaut. On choisit un
timbre, puis :
- **Jouer** fait jouer le timbre par le pilote comme une séquence XMIDI, sur le canal MIDI 9 :
  contrôleur 114 (banque), programme (patch), puis Note On ;
- **Stop** envoie le Note Off ;
- **<** et **>** passent au timbre précédent ou suivant, et le jouent.

`--timbre-tab` ouvre directement cet onglet.

Mode sans fenêtre :

```sh
./build/sc_player --sound SOUND --timbre-wav tvfx.wav            # tous les TVFX, l'un après l'autre
./build/sc_player --sound SOUND --timbre-wav b65.wav --bank 65   # une seule banque
./build/sc_player --sound SOUND --timbre-wav tout.wav --all      # aussi les timbres OPL simples
```

Règles de lecture dans ce mode :
- un TVFX qui a sa propre durée joue en entier, sans Note Off ;
- un effet en boucle (durée supérieure à 8 s) reçoit un Note Off à 8 s ;
- un timbre tenu (OPL simple, ou TVFX de durée 0xFFFF) reçoit un Note Off à 1,5 s ;
- le journal indique quand chaque voix se libère.

Ce qu'on observe sur le vrai `STRIKE.AD` :
- **Les 87 TVFX sont tous en banque 65, tous de type 2** (fréquence absolue).
- **21 sont des effets en boucle**, d'une durée de 20 à 1 000 s.
- **86 se libèrent seuls.** Le pilote ne libère une voix TVFX que lorsque ses deux niveaux passent
  sous 0x400.
- **Le patch 0 ne se libère jamais.** Sa courbe de relâchement baisse le niveau une seule fois,
  puis le tient pour 65 532 ticks. Le jeu arrête un effet par `SoundFX_StopEffect_59A8A`, puis
  `Music_ChannelStopSequence_59F1D`, ce qui n'envoie que des Note Off. Ce timbre continue donc de
  sonner tant qu'une voix plus prioritaire ne lui prend pas son canal OPL.
- Le bouton « Silence total » coupe toutes les voix. **Il n'existe pas dans le pilote** :
  c'est un outil de test (`adl_kill_all`).

## Tests (sans les fichiers du jeu)

```sh
tests/run_tests.sh build
```

`tests/make_test_data.py` fabrique des données **synthétiques** :
- le vrai `COMBAT.DAT` ;
- un `COMBAT.ADL` à 3 niveaux, dont certains enregistrements sont compressés en LZW ;
- une bibliothèque de timbres contenant des timbres OPL simples et un timbre TVFX.

Le test vérifie quatre points :
- l'attente de la barre de mesure ;
- la position dans la phrase et la piste de liaison choisie (4 → 0x10 à la position 3 → liaison 0x13,
  d'après le vrai `COMBAT.DAT`) ;
- le retour à la piste de reprise après une ponctuation ;
- le fondu d'arrêt.

Ces musiques de test ne sont pas celles du jeu.

## Vérifié sur les vrais fichiers (2026-10-10)

- `COMBAT.ADL` : fichier → 1 jeu de musique → [0] archive des 25 liaisons, [1..22] pistes.
  Aucun enregistrement n'est compressé. Chaque piste est en FORM XDIR + CAT XMID.
- Les 47 séquences se lisent en entier :
  - les pistes principales bouclent ;
  - les ponctuations 0x10 à 0x12 durent de 3 à 5 s ;
  - les liaisons durent de 2,6 à 5,5 s.
- `STRIKE.AD` : 282 timbres. Aucun timbre ne manque pour les pistes testées.
  - 195 timbres OPL simples (longueur 0x0E).
  - 87 timbres TVFX, tous de type 2 (fréquence absolue).
  - Aucun timbre de longueur 0x19, que le pilote ignorerait.
- Transitions sur données réelles : 4 → 0x10 à la position 5, entrée 24, valeur 0x14,
  donc la liaison n° 19 est jouée, puis le retour à 4.

## Reste à comparer

- **Validé à l'oreille par Rémi (2026-10-10)** : rendu des musiques correct, y compris avec un autre jeu de musique chargé par `OPTEST.EXE`, et chargement de la banque TVFX correct.
- Le pilote n'applique pas le volume aux voix TVFX : seul le timbre OPL simple fixe le masque
  `0x1824` (`sub_2617`). Le fondu d'arrêt ne baisse donc pas une voix TVFX. Le portage fait de même.
- Le jeu boucle sans fin si un timbre manque dans la bibliothèque. Le lecteur s'arrête et le signale.
