# sc_player — lecteur de la musique de Strike Commander

Reproduit la chaîne musicale du jeu, chaque étage étant porté depuis le code :

| Étage | Fréquence | Source portée | Fichier |
|---|---|---|---|
| Séquenceur du jeu : 4 états, transitions calées sur la barre de mesure, pistes de liaison, ponctuations | 20 Hz | `Music_SequencerTickISR_5940B`, `Music_TuneTransitionResolve_595C2`, `Music_TuneTransitionCommit_5974D`, `Music_ChannelRegisterSequence_59FF5`, `Music_InstallTimbre_5A62A`, `Music_StopWithFade_AB1EF` (seg121-125) | `src/sc_music.c` |
| Interpréteur XMIDI (file de notes, tempo, mesures, boucles FOR/NEXT, volume relatif) | 120 Hz | `XMIDI.ASM` d'AIL 2.0, avec les écarts de la version compilée dans `ADLIB.ADV` | `src/ail_xmidi.c` |
| Partie voix du pilote AdLib (16 voix → 9 canaux OPL2, priorités, timbres OPL simples et TVFX) | 120 Hz (TVFX à 60 Hz) | `ADLIB.ADV` lu dans `analysis/adlib_driver_source/adlib.asm` | `src/ail_adlib.c` |
| Tables du pilote (F-Number, octaves, vélocité, registres initiaux, contrôleurs par défaut) | — | extraites du binaire `ADLIB.ADV` | `src/adlib_tables.h` (généré) |
| Archive indexée + LZW | — | `IndexedRecordReader_*` (seg196), `LZW_Decompress_66068` (seg197) | `src/sc_archive.c` |
| Chargement de `COMBAT.DAT`, `COMBAT.ADL`, `STRIKE.AD` | — | `AudioQueue_LoadTrackTable_AACA6`, `AudioQueue_LoadTransitionTable_AAFA0`, `Music_LoadTimbreFromLibrary_5A577` | `src/sc_data.c` |

Le cœur (`sc_music_core` : tout `src/` sauf `main.cpp`) est en C, sans SDL ni ImGui.
C'est la partie à reprendre dans libRealSpace. Il suffit de lui fournir une fonction
d'écriture de registre OPL, puis d'appeler `xmi_serve()` à 120 Hz et `sc_music_tick()` à 20 Hz.

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

- L'écoute, comparée au jeu original, n'a pas encore été faite.
- Le pilote n'applique pas le volume aux voix TVFX : seul le timbre OPL simple fixe le masque
  `0x1824` (`sub_2617`). Le fondu d'arrêt ne baisse donc pas une voix TVFX. Le portage fait de même.
- Le jeu boucle sans fin si un timbre manque dans la bibliothèque. Le lecteur s'arrête et le signale.
