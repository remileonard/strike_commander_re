# Wings of Glory (WINGS_OF.EXE)

Ajouté le 2026-11-05. Exécutable fourni par Rémi ; il n'est pas dans le dépôt (comme les données).

## 1. L'exécutable

- `WINGS_OF.EXE`, 603 888 octets. Borland C++ 1991, gestionnaire d'overlays VROOMM (en-tête `FBOV` après l'image),
  comme STRIKE.EXE, OPTEST.EXE et PACIFIC.EXE. Lancé par `WG` (« Please type WG to run Wings of Glory. »).
- Comme PACIFIC.EXE, **un seul exécutable pour le vol et le hors-vol** : on y trouve les noms `convdata.iff`,
  `faces.iff`, `convfont.shp`, `cvno%04d.pak` (voix des conversations), `bkglist.iff`, `instant.iff` (mission
  d'entraînement), `options.cfg`, `optdflt.cfg`, `wg.cfg`, et la liste des avions (Sopwith Pup, Sopwith Camel, SPAD XIII,
  Albatros D III, Albatros C III, Albatros D V, Fokker D VII, Fokker D VIII, Fokker Dr. I, Zeppelin L71).
- Listing au format IDA reconstruit par `tools/vroomm_listing.py` : `source/wings.asm` (330 segments dont 71
  overlays, 2 988 fonctions repérées). Tous les outils prennent `--exe wings` (`tools/exe_paths.py`).

## 2. Noms repris

`tools/match_functions.py --from <source> --to wings --write`, passé dans cet ordre : OPTEST.EXE, STRIKE.EXE, puis
PACIFIC.EXE en dernier (ses noms, plus récents et plus précis, l'emportent sur une même fonction). Résultat :
810 fonctions nommées sur 3 378 déclarations `proc` (719 reprises de PACIFIC.EXE, 83 de STRIKE.EXE, 8 d'OPTEST.EXE).
Ce sont surtout les bibliothèques communes (IFF, mémoire, son AIL, outils) ; le modèle de vol, la machine à scripts
de mission et le terrain n'ont pas été retrouvés par cette comparaison : leur code diffère, il est à lire.

Fichiers : `known_functions.json`, `function_index.json`, `segment_boundaries.json`, `annotated_segments/`,
`pacific_matches.json`, `strike_matches.json`, `optest_matches.json` (candidats non tranchés compris).

## 3. Accès aux fichiers (lu le 2026-11-05)

Recherche du lecteur d'archive XTRE (noms de fichiers hachés, comparés à l'index de l'archive). **Dans ce
`WINGS_OF.EXE`, il n'a pas été trouvé** : chaque fichier de données est ouvert par DOS sous son chemin complet.

Chaîne constatée, du plus haut au plus bas :

1. Le chemin est construit par deux fonctions pas encore nommées de seg043 :
   - `sub_1F089` (proposé : `Path_Concat3_1F089`) : copie le dossier, puis ajoute le nom et l'extension ;
   - `sub_1F0C4` (proposé : `Path_BuildDataPath_1F0C4`) : si le nom contient déjà `\`, il est pris tel quel ; sinon
     `..\..\DATA\` + dossier + `\` + nom + extension.

   Les dossiers sont des chaînes du segment de données : `..\..\data\gameflow\`, `..\..\data\cestalk\`,
   `..\..\data\fonts\`, `..\..\data\midgames\`, `..\..\data\missions\`, `..\..\data\noise\`, ou un nom court
   (`OBJECTS`, `MISSIONS`, `COCKPITS`, `SOUND`) passé à `sub_1F0C4`.

   Exemple : la lecture de `convdata.iff` appelle `sub_1F089("..\..\data\gameflow\", "convdata", ".IFF")`.
2. Le lecteur de flux (`StreamReader_ConstructVariantA_52440`, table de méthodes à l'offset 2509 du segment de
   données) ouvre ce chemin par sa méthode d'ouverture (`StreamReader_ReadDispatch_5274A`, 6ᵉ entrée de la table).
   Celle-ci crée l'objet fichier bas niveau (constructeur `sub_51D61`, objet de 71 octets).
3. L'objet fichier ouvre le chemin tel quel par `sub_52BBB` (proposé : `FileHandle_OpenByPath_52BBB`). Selon le mode,
   celui-ci appelle :
   - `sub_51BDA` (proposé : `Dos_Open_51BDA`) : `mov ah, 3Dh / int 21h` ;
   - ou `sub_51BAE` (proposé : `Dos_Create_51BAE`) : `mov ah, 3Ch / int 21h`.
4. Entre les deux se trouve un cache de fichiers en mémoire EMS (`sub_51E78` lit à travers, `sub_53245` cherche une
   entrée par `strncmp` sur 40 caractères du nom ; actif seulement si la page EMS `word_5D974` est réservée).
   C'est une comparaison de noms en clair, pas un hachage.

Recherches faites sans résultat dans `source/wings.asm` :

- la signature `XTRE`, en dword (`45525458h`) comme en deux mots (`5458h`, `4552h`) ;
- une chaîne `.TRE` ou `tre` ;
- une table de CRC 32 (octets `96h, 30h, 7, 77h`) ou les polynômes `0EDB88320h` / `4C11DB7h`.

Les seuls `int 2Fh` sont la détection XMS (fonctions 4300h et 4310h, `sub_18E8A` et `sub_18EDF`).

Le préfixe `..\..\DATA\` est celui des noms stockés dans les archives TRE d'Origin, comme dans `BIGTRE.TRE` de
Strike Commander. Ce `WINGS_OF.EXE` construit donc bien les noms qu'une archive indexerait, mais il les ouvre par DOS
(fichiers isolés sur le disque). Le hachage XTRE est donc à chercher ailleurs, par exemple :

- dans une autre version de l'exécutable (version CD-ROM) ;
- ou dans un programme résident qui intercepte l'ouverture de fichier de DOS (le lanceur `WG` cité par le message
  « Please type WG to run Wings of Glory. »).

Rien de cela n'a été vu : c'est à vérifier avec ces fichiers.

## 4. Le reste n'est pas lu

Aucune autre fonction propre à Wings of Glory n'a été lue. Les données du jeu n'ont pas été fournies.
