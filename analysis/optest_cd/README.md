# OPTTEST.EXE de la version CD-ROM : listings des conversations

Désassemblage partiel, sans IDA, par `tools/exe_disasm.py` (capstone), de l'exécutable fourni par
Rémi (non inclus). Les adresses sont des décalages dans l'image chargée de **cet** exécutable
(DGROUP = 4C25h) : rien à voir avec celles de `source/optest.asm` (version disquette). Les fonctions
n'ont pas de nom ; les noms proposés sont dans `analysis/CONV_SYSTEM.md` § 8.

| Fichier | Contenu |
|---|---|
| `conv_interpreter_07A9F.txt` | début de l'interpréteur (« Conv_PlayScript ») : ouverture de `VOCLIST.IFF`, table des commandes, commande 0Ah avec voix ; fin de boucle (0A399h) |
| `conv_group_07EA8.txt` | commande 00h : scène de groupe (§ 8.6) |
| `conv_closeup_087DE.txt` | commande 03h et ses suites 04h / 0Ah / 0Bh : gros plan, voix ou texte |
| `conv_records_0C8C0.txt` | lecteurs d'enregistrements : nom, 03h, 01h, 02h, 0Ah (voix puis texte) |
| `voclist_04FC4.txt` | `VOCLIST.IFF` : ouverture, recherche, préchargement en tâche de fond |
| `file_exists_0CE05.txt` | test d'existence du premier fichier de voix |
| `input_checkskip_148B7.txt` | Espace / Échap (drapeau DGROUP:69D4h) |
| `voiceplayer_0E670.txt` | lecteur de voix : chargement VOC, table des bouches tirée du son (seuils 95, 78, 65, 42, 25) |
| `talkinghead_108A0.txt` | tête parlante et personnages de groupe : chargement de la voix, avance (texte / voix), dessin |

Régénérer : `python3 tools/exe_disasm.py <OPTTEST.EXE> <début hex> <fin hex>`.
