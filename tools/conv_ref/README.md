# Conversations : code de référence pour libRealSpace

Tout est décrit dans `analysis/CONV_SYSTEM.md`. Aucune donnée du jeu ici : les scripts de test se
produisent à partir de `BIGTRE.TRE` (ou du dossier `DATA` extrait).

| Fichier | Rôle | Document |
|---|---|---|
| `export_scripts.py` | écrit chaque entrée de `CONV.PAK` au format CD (`cd/`) et au format disquette reconstruit (`disquette/` : voix retirées, sauts 0Bh / 0Ch recalculés) | § 9 |
| `librs_voice_detect.py` | rejoue la détection voix / texte de `SetSentenceFromConv` sur chaque texte et compte les erreurs (`--simplifiee` : sans E0h ni la branche FFh / F4h) | § 9 |
| `conv_format.cpp` | test du format avant le parsing (`detectConvFormat`) et lecture d'un texte sans heuristique (`readConvText`) | § 9.1 |
| `conv_parser.cpp` | parseur complet : boucle de premier niveau, sous-parseurs, erreurs ; `detectConvFormat` teste le format sur le premier texte (CD, disquette, inconnu), `parseConvScript` lit ensuite une seule fois | § 9.2 à 9.4 |
| `conv_lips.cpp` | bouche et clignement de la tête parlante, bouche des personnages de groupe | « Yeux et bouches », § 7.4 |

```bash
python3 tools/conv_ref/export_scripts.py --donnees <BIGTRE.TRE ou DATA> <sortie>
python3 tools/conv_ref/librs_voice_detect.py <sortie>
g++ -std=c++17 -o conv_parser tools/conv_ref/conv_parser.cpp
./conv_parser v <sortie>/cd/*.bin          # 0 erreur, 2 772 enregistrements, chaque script reconnu CD
./conv_parser s <sortie>/disquette/*.bin   # idem, chaque script reconnu au format disquette
```

Style : `clang-format --style=file:tools/sc_player/.clang-format` et
`tools/sc_player/tools/style_check.py` (règles de `CLAUDE.md`).
