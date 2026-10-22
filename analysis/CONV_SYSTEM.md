# Conversations (OPTEST.EXE)

Lu le 2026-10-22 dans `analysis/optest/annotated_segments/ovr191_annotated.asm` (interpréteur) et
`seg006_annotated.asm` (lecteurs d'enregistrements). Toutes les adresses sont celles d'OPTEST.EXE.
Outil : `tools/conv_dump.py --donnees <BIGTRE.TRE ou DATA> [entrée ...]` affiche les scripts.

## 1. Fichiers

| Fichier | Rôle |
|---|---|
| `GAMEFLOW\CONV.PAK` | les scripts : une entrée du PAK = une conversation (256 entrées, 15 vides) |
| `GAMEFLOW\CONVDATA.IFF` | noms → images et palettes : décors (`BCKS`/`BACK`), visages (`FACE`), figurants (`FIGR`, `PFIG`), palettes (`FCPL`, `FGPL`) |
| `GAMEFLOW\CONVSHPS.PAK`, `CONVPALS.PAK` | images et palettes des visages, figurants et décors |
| `GAMEFLOW\OPTSHPS.PAK`, `OPTPALS.PAK` | images et palettes partagées avec les menus (ciel, `optshps` 116) |
| `GAMEFLOW\GAMEFLOW.IFF` | escadres (`WNGS` / `WING` : `INFO`, `PILT`, `ORDR`), lues par la commande 0Eh |

Chargement d'un script : `Conv_LoadScriptFromPak_59DAA` ouvre `..\..\data\gameflow\conv.pak`, lit
l'entrée numéro `[conv + 6Dh]` en mémoire telle quelle (aucune transformation) ; début `[conv]`,
curseur `[conv + 4]`, taille `[conv + 8]`.

## 2. Format d'un script

Suite de commandes. Chaque commande = 1 octet, puis ses champs. Entiers en petit-boutiste (LE).
« nom » = 9 octets, texte complété par des 0. « chaîne » = texte terminé par un 0.

**Écart entre le code et les données.** Le code d'OPTEST.EXE (cette version) lit un seul texte par
réplique. Les données de `BIGTRE.TRE` ont, devant **chaque** texte, une chaîne de plus : un
identifiant de voix (`3gw009`, `1ai021`… ; chaîne vide quand la réplique est vide). Avec cette
chaîne, les 241 scripts se lisent sans reste et toutes les commandes trouvées sont connues ; sans
elle, 241 échouent. Les tableaux ci-dessous notent `[voix]` : présent dans les données, absent du
code lu. Cet OPTEST ne contient d'ailleurs aucun nom de fichier de voix de conversation (seuls les
`midNvoc` des cinématiques).

### Commandes de premier niveau (table `off_5CE29`, octets 00h à 10h)

| Octet | Commande | Champs |
|---|---|---|
| 00h | scène de groupe | nom du décor ; puis des 01h ; puis des 02h / 0Ah |
| 03h | réplique en gros plan | voir ci-dessous ; puis des 0Ah, 04h, 0Bh |
| 0Ch | saut | mot : nombre d'octets sautés, compté depuis la fin du mot |
| 0Eh | escadre | octet `écran` ; octet `escadre` |
| 0Fh | choix d'un équipier | aucun |
| 10h | (rien) | aucun |
| autre | sautée | l'octet seul est consommé (branche par défaut) |

Le script se lit jusqu'à la fin de l'entrée (pointeur ≥ début + taille).

### 03h — réplique en gros plan (`ConvRec_ReadLine_632E`)

| Champ | Taille | Rôle (d'après l'usage) |
|---|---|---|
| visage | nom (9) | `FORM FACE` de `CONVDATA.IFF` |
| image | 1 | image de base de la tête (`TalkingHead_SetBaseFrame_9D32`) ; 255 → −1 (`cbw`) = aucune |
| décor | nom (9) | `FORM BACK` de `CONVDATA.IFF` |
| x | mot | position de la tête (160, 130 ou 190 dans les données) |
| y | mot | position de la tête (128 dans les données) |
| [voix] | chaîne | identifiant de voix (données seulement) |
| texte | chaîne | sous-titre et texte de lèvres (`TalkingHead_SetLipText_9C4F`) |
| couleur | 1 | couleur du texte (méthode +10h de la police) |

Puis, autant de fois qu'ils se suivent :
- **0Ah** : octet couleur, `[voix]`, chaîne — texte affiché sans mouvement des lèvres, attente de
  20 images (lu par `ConvRec_ReadNarration_65E8`) ;
- **04h** : `[voix]`, chaîne — suite de la même réplique (même visage, même décor, même couleur ;
  `ConvRec_ReadLine_632E` ne relit que le texte quand l'en-tête est déjà lu) ;
- **0Bh** : mot — question « Accept Mission » / « Reject Mission » (`ConvRec_ReadAcceptSkip_6660`) :
  si le joueur refuse, le mot est ajouté au pointeur (la branche « accepter » est sautée).

### 00h — scène de groupe (`ConvRec_ReadName_6305`)

| Commande | Champs | Rôle |
|---|---|---|
| 00h | nom du décor (9) | plan large |
| 01h (répété) | nom de figure (9), x (mot), y (mot) | figurant posé dans le décor (`FORM FIGR`), calque `ConvFigure_ConstructExtra_AB6B` (voir plus bas) |
| 02h (répété) | nom de figure (9), x, y, octet couleur, `[voix]`, chaîne | personnage qui parle, calque `ConvFigure_ConstructSpeaking_A207` (voir plus bas), lèvres synchronisées sur le texte |
| 0Ah (répété, mêlé aux 02h) | octet couleur, `[voix]`, chaîne | texte sans personnage |

Les répliques 02h / 0Ah sont jouées dans l'ordre après la lecture de toute la scène ; une 02h
attend la fin de son texte de lèvres (`TalkingHead_IsLipTextDone_A0D5`), une 0Ah attend 40 images.

- **Figurant** (`ConvFigure_ConstructExtra_AB6B`) : image 0 de sa forme (`FIGR`) en (x, y). Si la
  forme a plus d'une image et que le dernier caractère du nom est au-delà de « 3 », il dessine en
  plus une image qui boucle de 1 à n − 1 (une image par image de scène). Les noms des données
  finissent tous par 1, 2 ou 3 : figurants fixes.
- **Personnage qui parle** (`ConvFigure_ConstructSpeaking_A207`, tête parlante à table 182Bh) :
  image 0 = corps, puis la bouche au même point. À chaque image, lettre suivante du texte ; bouche =
  chiffre de « 04302500000340143000353000 » pour les lettres a à z (dseg 15B1h) + 1, aucune hors des
  minuscules (ConvFigure_AdvanceSpeaking_A3E1).

### Scène de groupe : placement des figures (relu le 2026-10-22)

**Où l'on dessine.** Comme les cinématiques : `Conv_Init_59A20` réserve une image hors écran de
320 × 200 (`[conv + 1Ah]`, rectangle (0, 0)-(319, 199)), que la commande 00h met en surface de
dessin ; la scène (`LayerGroup_Construct_2DC66(scène, 10, 0, conv + 0Ch)`) recopie à l'écran
(`[conv + 0Ch]`, rectangle (0, 24)-(319, 151)) à chaque image (`LayerGroup_PlayFrame_2DD86`).
Donc : **x, y des figures sont dans l'image hors écran ; sa ligne 0 arrive à la ligne 24 de
l'écran ; seules les lignes 0 à 127 sont visibles** (la bande du bas, lignes 152 à 199, reçoit
les textes). La scène tourne à **10 images par seconde** ; « palette » 0 : l'image hors écran est
remise à la couleur 0 avant chaque image.

**Position.** Le calque est en (x, y) ; l'image y est dessinée avec ses propres décalages (les x, y
de ses lignes), comme tout calque. x et y sont des mots **signés** (`airwing1` en (0, −20)).
Les figures des écrans d'équipiers (`red1`, `billy2`, `gwen2`, `lyle2`, `miguel2`, `tex3`) ont
leurs coordonnées d'écran dans l'image et sont posées en (0, 0).

**Images d'une figure** (`FIGR` → `CONVSHPS.PAK`, relevé sur les données) :
- 7 images (`air1`, `janet1`, `tex1`, `stern1`, `miguel1`, `gwen1`, `lyle1`, `billy1`, `airwing1`) :
  image 0 = corps, images 1 à 6 = petites zones à la hauteur de la tête (bouches) ;
- 1 image (`air2`, `air3`, `tex2`, `stern2`, `virgil1`, `walt1`, `men1`, `tweedly1`, `red1`) ;
- 2 images (`billy2`, `gwen2`, `lyle2`, `miguel2`, `tex3`, écrans d'équipiers).

**Recherche par nom** (`ConvData_LookupByName_5A225`, nom → dernier octet du `DATA`) :
`FACE` et `FIGR` donnent une entrée de `CONVSHPS.PAK` ; `FCPL`, `FGPL`, `PFIG` une entrée de
`CONVPALS.PAK`.

**Ordre de dessin** : éléments du décor dans l'ordre du `BACK`, puis les 01h, puis les 02h, dans
l'ordre du script (`LayerGroup_Add_2DB84` ajoute en fin de liste). Les 02h sont toutes à l'écran dès
le début de la scène ; seules leurs lèvres bougent pendant leur réplique.

**Palette** (une seule pour toute la scène, 256 couleurs, composée dans cet ordre) :
1. la palette de chaque élément du décor ;
2. `FGPL` « normal » (`CONVPALS` 48) ;
3. la palette `PFIG` du **premier figurant (01h) seulement** ; sans figurant, rien de plus.
`PFIG` vaut 48 pour la plupart, 51 pour les figures des écrans d'équipiers : sur `s_wing`,
`air2` (48 dans `PFIG`) est dessiné avec la palette 51 de `red1`, premier figurant.
La palette n'est envoyée à la carte que si le décor diffère du précédent (`CRT_Strncmp_Like` sur le
nom gardé en `var_A`).

**Dessin d'une figure** :
- figurant (01h) : image 0 ; si la forme a plus d'une image et que le dernier caractère du nom
  est au-delà de « 3 », aussi une image qui boucle de 1 à n − 1 (aucun nom des données) ;
- personnage qui parle (02h) : image 0 puis la bouche (images 1 à 6) au même point ; bouche =
  chiffre de la table de lèvres pour la lettre courante + 1, aucune hors des minuscules.

**Durées** : une 02h dure le temps de son texte, une lettre par image (10 par seconde), sans attente
après ; une 0Ah dure 40 images. Une touche passe à la réplique suivante.

Contrôle : `tools/conv_scene.py --donnees <BIGTRE.TRE> <entrée> <n° de scène> <sortie.png>` compose
une scène de groupe selon ces règles (images 0 seulement) ; hangar (entrée 12), briefing
(`s_brief`, entrée 59) et équipiers (`s_wing`) sortent juste.

### Yeux et bouches (relu le 2026-10-22)

Deux mécanismes distincts : la **tête du gros plan** (03h) cligne des yeux et lit le texte avec des
règles de prononciation ; le **personnage qui parle d'une scène de groupe** (02h) ne cligne pas et
lit le texte lettre par lettre. Dans les deux cas, la bouche suit **le texte**, pas la voix : le
mode voix de la tête parlante (`TalkingHead_AttachVoice_9CF7`, utilisé par mid2) n'est appelé nulle
part dans `Conv_PlayScript_5AA4E`. La scène tourne à 10 images par seconde : une lettre = 0,1 s.

**Texte lu par les lèvres.** C'est le texte du script tel quel : `Conv_PlayScript_5AA4E` passe le
même pointeur à `Conv_DrawText_59F54` et à `TalkingHead_SetLipText_9C4F`, et `Conv_DrawText_59F54`
fait les remplacements sur une copie (`CRT_Strdup`). Les codes `$S`, `$N`… ne sont donc pas
remplacés pour les lèvres : « $S » donne une image sans bouche (« $ ») puis la bouche de « s ».
`TalkingHead_CopyLipText_97D8` met le texte en minuscules : les majuscules comptent comme des
lettres.

#### Gros plan (03h) : `TalkingHead_Construct_98F4`, avance `TalkingHead_Advance_9F5A`

**Dessin** (table de méthodes 1883h, `TalkingHead_DrawDressed_9E5E`), dans l'ordre, toutes à la
position de la tête :
1. image 0 du visage (la tête) ;
2. l'**image des yeux** : l'image de base, ou l'image 12 pendant un clignement ; rien si elle vaut −1 ;
3. la **bouche**, rien si elle vaut −1 ;
4. image 1 (coiffure), puis image 34 (habits ; valeur fixée à la construction, aucun autre
   écrivain vu).

**Image de base** = l'octet « image » de la 03h (`TalkingHead_SetBaseFrame_9D32`) ; 255 devient −1
(`cbw`) : pas d'image des yeux hors clignement. Pendant la question « Accept / Reject » (0Bh),
l'image de base passe à 53 (35h) et le texte de lèvres est une chaîne vide (dseg 1079h, juste avant
« Accept Mission ») : bouche fermée.

**Clignement**, tiré à chaque image de scène :
```
image des yeux = 12           si rand() × 30 / 32768 = 0 (une fois sur 30)
                                 et clignement permis (toujours 1 en conversation)
               = image de base sinon
si image de base > 20 : image des yeux = image de base (jamais de clignement)
```
Le tirage est refait à chaque image : un clignement dure en général une image (0,1 s), en moyenne
toutes les 3 s. Dans les données (1 717 × 03h), l'image de base vaut 13, 14, 16 à 20 ou 255 dans
774 répliques (clignement possible) et 21 à 31 dans les autres (yeux fixes).

**Bouche**, une lecture par image de scène, le curseur avance d'un caractère puis :
```
« e » + caractère qui n'est pas a..z : ce caractère est consommé aussi → pas de bouche
« e » + « r »   → bouche 6, « r » consommé
« t » + « h »   → bouche 9, « h » consommé
« c » + « h »   → bouche 6, « h » consommé
« h »           → le caractère suivant est consommé ; bouche de « h » (table)
autre a..z      → bouche = table (ci-dessous)
autre caractère → pas de bouche (−1)
fin du texte    → pas de bouche ; TalkingHead_IsLipTextDone_A0D5 devient vrai
```
La fin est testée par « caractère sous le curseur = 0 » (`TalkingHead_IsLipTextDone_A0D5`). Un
texte qui finirait par « e » ou « h » ferait sauter le 0 final ; aucun des 2 362 textes 02h / 03h /
04h des données ne finit ainsi.

Table (`word_445AC`, « 06891599098769362999252999 », chiffre + 2) :

| a | b | c | d | e | f | g | h | i | j | k | l | m | n | o | p | q | r | s | t | u | v | w | x | y | z |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 2 | 8 | 10 | 11 | 3 | 7 | 11 | 11 | 2 | 11 | 10 | 9 | 8 | 11 | 5 | 8 | 4 | 11 | 11 | 11 | 4 | 7 | 4 | 11 | 11 | 11 |

Les images de bouche d'un visage sont donc 2 à 11.

**Durée d'une réplique** : une image par lecture jusqu'à la fin du texte (les caractères consommés
par paire ne coûtent pas d'image), puis **40 images** (15 si le texte est vide) ; une 0Ah qui suit
un gros plan : 20 images, sans mouvement des lèvres. Une touche (`Input_CheckSkip_D24A`) coupe
l'attente.

#### Personnage qui parle (02h) : `ConvFigure_ConstructSpeaking_A207`, avance `ConvFigure_AdvanceSpeaking_A3E1`

- **Pas de clignement** : la méthode d'avance de cette figure n'a pas de tirage, et le dessin
  (`ConvFigure_DrawSpeaking_A2B7`) ne fait que l'image 0 (corps) puis la bouche.
- **Pas de règle de prononciation** : un caractère par image ; une lettre a..z donne
  bouche = chiffre de « 04302500000340143000353000 » (dseg 15B1h) + 1, tout autre caractère rien.

| a | b | c | d | e | f | g | h | i | j | k | l | m | n | o | p | q | r | s | t | u | v | w | x | y | z |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 5 | 4 | 1 | 3 | 6 | 1 | 1 | 1 | 1 | 1 | 4 | 5 | 1 | 2 | 5 | 4 | 1 | 1 | 1 | 4 | 6 | 4 | 1 | 1 | 1 |

- Une 02h dure une image par caractère du texte, sans attente après. Les autres personnages
  qui parlent de la scène restent affichés, image 0 seule.

**Palette du visage** : le seul appel de `ConvData_FindFacePalette_5A46F` (dans
`Conv_PlayScript_5AA4E`) passe 0 → toujours `FCPL` « normal » (`CONVPALS` 46) en conversation ;
« night » n'est pas demandé par ce code.

### 0Eh / 0Fh — escadre et équipiers

- **0Eh** (`ConvRec_ReadWing_66E0`) : cherche dans `GAMEFLOW.IFF`, `FORM WNGS`, la `FORM WING`
  dont l'`INFO` vaut `escadre` ; lit un type (0 à 3), la liste `PILT` (pilotes) et, pour les types
  1 et 2, `ORDR` (5 octets). Remplit les trois noms d'équipiers `$W`, `$L`, `$O` (table des noms
  dseg 0ECCh : « », Billy, Gwen, Lyle, Miguel, Tex ; table 0ED8h : DiBianca, Templeman, Isaac,
  Roberts, Baldwin, Yenawine, Savage, utilisée par `$A`, `$B`). L'octet `écran` est gardé pour 0Fh.
- **0Fh** : écran de choix d'un équipier : décor `s_wing` (`écran` = 0) ou `w_wing` (sinon), puis
  `p_wing` ; zones « Select Billy / Gwen / Lyle / Miguel / Tex » pour les pilotes de `PILT` ; le
  pilote choisi remplit `$W`, `$L`, `$O` comme 0Eh.

### Codes dans les textes (`Conv_DrawText_59F54`)

| Code | Remplacé par |
|---|---|
| `$S` | nom de famille du joueur (partie + 398h) |
| `$N` | prénom (partie + 3ACh) |
| `$C` | indicatif (partie + 3C0h) |
| `$W`, `$L`, `$O` | équipiers posés par 0Eh / 0Fh |
| `$A`, `$B` | table 0ED8h, indices `[conv + 6Bh]`, `[conv + 6Ch]` |
| `$P` | avions perdus pendant la mission (partie + 0EAh), suivi de « plane » / « planes » |
| `$T` | avions perdus au total (partie + 3D4h), même suffixe |
| `$` + autre | « $ » gardé |

Sens de `$S`, `$N`, `$C` : les trois chaînes sont passées aux cinématiques dans l'ordre prénom,
nom, indicatif (`Gameflow_PlayMidgame_4ABE0`), et mid33 grave « prénom nom » puis « 'indicatif' » sur
la croix (`MID1_PLANS.md`, mid33). Sens de `$P`, `$T` : conversations 252 à 255 ci-dessous.

Puis le texte est coupé aux espaces en lignes de 30 caractères au plus, dessinées à y = 4, 19, 34…
de la zone de texte (format « %Y%J%S »).

## 3. CONVDATA.IFF

- `FORM BCKS` → `FORM BACK` : `INFO` = nom (8 octets) ; `DATA` = suite d'éléments de 5 octets,
  dessinés dans l'ordre (`ConvData_LoadBackground_5A4E6`) :
  octet source (0 = `CONVSHPS`/`CONVPALS`, 1 = `OPTSHPS`/`OPTPALS`), octet image, octet palette,
  mot signé = position verticale du calque (`Layer_Construct_2DF9B(…, 0, y)`).
  Exemple : `str_s_ex` = `01 74 15 E8FF` → `optshps` 116 (le ciel), `optpals` 21, y = −24.
- `FORM FACE` : `DATA` de 9 octets = nom (8) + numéro d'image dans `CONVSHPS.PAK`.
- `FORM FIGR` / `PFIG` : nom (8) + numéro d'image / de palette des figurants.
- `FORM FCPL` (`normal`, `night`), `FGPL` (`normal`) : nom (8) + numéro de palette.

## 4. Vérification sur les données

`tools/conv_dump.py` sur `BIGTRE.TRE` : 241 scripts non vides, 0 commande inconnue ;
1 717 × 03h, 575 × 04h, 86 × 00h, 184 × 01h, 70 × 02h, 32 × 0Ah, 26 × 0Bh, 26 × 0Ch, 28 × 0Eh,
28 × 0Fh. Les 52 sauts (0Bh et 0Ch) tombent tous sur le début d'une commande. Exemple (entrée 62,
proposition de mission) : « Do you accept? » → 0Bh (refus : +159 octets) → branche « Good… » → 0Ch
(+78, jusqu'à la fin) → branche du refus « All right, but I'd reconsider… ».

## 5. Lancement d'une conversation

- Script de partie (`Gameflow_RunScriptPairs_36CF`, seg002) : suite de paires d'octets (commande,
  argument) ; **commande 0 = conversation numéro `argument`** (entrée de `CONV.PAK`), jouée par
  `Gameflow_PlayConversation_4AAAB` → `Conv_Construct_59B67` → `Conv_PlayScript_5AA4E`.
- Conversations lancées par le code :
  - **254** si les avions perdus au total dépassent 16 (« The insurance company has dropped our
    policy »), **255** si l'argent (dword partie + 27Bh) devient négatif
    (`Gameflow_CheckLossConversations_50645`) ;
  - commande 24h du script de partie, si des avions ont été perdus pendant la mission : **253** si
    partie + 0F8h = 2, **252** sinon (Miguel : « we lost $P that mission »).
- La réponse à 0Bh est rangée dans le premier octet du tampon `[conv + 2Ah]` (partie + 35Bh) :
  1 = « Accept Mission », 0 = refus.
- Le script de partie a des **blocs conditionnels** : une commande de test qui échoue fait sauter
  les commandes suivantes jusqu'à 1Eh (« sinon », bascule) ou 1Fh (fin de bloc), en comptant les
  tests imbriqués. Commandes de test relevées dans le code : 09h, 0Ah, 14h, 15h, 16h, 1Ch, 20h,
  23h, 25h. **14h** : bloc joué si la mission a été acceptée (partie + 35Bh ≠ 0) ; **15h** : bloc
  joué si elle a été refusée. C'est ainsi que la réponse à 0Bh choisit la suite (conversations,
  missions) dans le script de partie. 20h teste un drapeau (partie + 1FDh + argument). Les autres
  commandes du script de partie relèvent du déroulement de la campagne (GAMEFLOW), pas des
  conversations.

## 6. Points ouverts

- Ce qui pose les drapeaux dseg 0EE6h (choix de `$A`, `$B`).
- Version du code qui lit `[voix]` : pas dans cet OPTEST.EXE.

## 7. Corriger libRealSpace (consignes pour un agent)

Comparaison faite le 2026-10-22 avec `ConvAssetManager.cpp/.h` et `SCConvPlayer.cpp/.h` de
libRealSpace. Chaque point donne : où, ce que fait libRealSpace, ce que fait le jeu. Le détail du
comportement du jeu est dans les sections 2 à 5 ci-dessus ; ne rien corriger sans le relire.

### 7.0 Règles générales

- **Architecture à conserver.** libRealSpace lit d'abord tout le script et range chaque réplique
  dans une structure (`ConvFrame`, liste `conversation_frames`), puis le lecteur
  (`SCConvPlayer::runFrame`) ne lit que cette structure. Cette séparation est voulue : ne pas
  la remplacer par un interpréteur à la manière d'OPTEST. Chaque correction ci-dessous se fait soit
  dans le parseur (lire le bon champ et le ranger dans la structure), soit dans le lecteur (utiliser
  ce qui est rangé).
- **Voix : garder la détection actuelle.** L'OPTEST.EXE désassemblé est celui de la version
  disquette, qui ne lit pas l'identifiant de voix ; libRealSpace, lui, gère la voix
  (`SetSentenceFromConv` la détecte, `runFrame` joue le VOC). Ce code fonctionne et reste tel
  quel ; ce document ne dit rien de la façon dont la version avec voix minute les répliques.

- **Numéros d'image.** libRealSpace ajoute une image vide en tête de chaque jeu d'images
  (`RSImageSet`) : **numéro libRealSpace = numéro du jeu + 1** pour les visages (`FACE`) et les
  figures (`FIGR`). Ce document donne toujours les numéros du jeu. Les décors (`ParseBGLayer`) lisent
  l'image directement (`RLEShape`), sans ce décalage.
- **Repère d'écran.** Le jeu dessine décor, figures et visages dans une image hors écran de
  320 × 200 dont la ligne 0 arrive à la ligne **24** de l'écran ; seules les lignes 0 à 127 sont
  visibles (écran 24 à 151). Une position (x, y) lue dans un script ou dans `BACK` est donc à
  l'écran (x, y + 24), l'image gardant ses propres décalages. Les bandes noires 0–23 et 152–199 de
  libRealSpace correspondent.
- **Cadence.** Le jeu avance la scène à **10 images par seconde** ; toutes les durées ci-dessous
  sont en images de scène. libRealSpace expire une réplique au bout de 5 s ou à la fin de la voix
  (`CheckFrameExpired`).
- **Lèvres et voix.** Dans cet OPTEST.EXE, les lèvres suivent le texte (§ 7.4) ; les durées
  données ici sont celles de la version sans voix.

### 7.1 Lecture du script (`SCConvPlayer::parseConv`, `ConvFrame::parse_*`)

Format exact des enregistrements : § 2 (référence exécutable : `tools/conv_dump.py`). Champs mal
lus ou pas lus, à corriger dans les `parse_*` existants et à ranger dans `ConvFrame` :

| Commande | libRealSpace | Jeu |
|---|---|---|
| 00h | `parse_GROUP_SHOT` avance de 8, saute les 0 puis cherche une commande | nom de décor de 9 octets (8 caractères et un 0 au plus), puis la commande suivante |
| 01h | `parse_GROUP_SHOT_ADD_CHARACTER` : x, y par `ReadUShortBE` après 8 octets | nom (9), x **mot signé petit-boutiste**, y idem. La lecture actuelle tombe juste par hasard tant que 0 ≤ x < 256 ; `airwing1` est en (0, −20) |
| 02h | `parse_GROUP_SHOT_CHARACTER_TALK` ne lit pas x, y | nom (9), x (+9), y (+0Bh), mots signés ; couleur +0Dh, puis `[voix]`, texte |
| 03h | x lu comme un octet à +13h (130/160/190 → `FacePos`) | x, y = mots signés à +13h et +15h (y = 128 dans les données) ; le reste est juste |
| 0Bh | deux octets `noOffset`, `yesOffset` | **un mot** = octets à sauter si refus, compté depuis la fin du mot. Les 26 0Bh des données ont un saut < 256 et arrivent juste après un 0Ch : le découpage branche 1 / branche 2 actuel tombe juste |
| 0Ch | `parse_YESNOCHOICE_BRANCH2`, deux octets ignorés | saut sans condition d'**un mot** (fin de la branche « accepter ») |
| 0Eh | `topOffset`, `first_palette` | octet écran (0 = `s_wing`, sinon `w_wing`), octet numéro de `WING` dans `GAMEFLOW.IFF` ; remplit `$W`, `$L`, `$O` |
| 10h | non traité | ne fait rien |
| autre | `do_not_add` | l'octet est sauté |

La lecture du texte et de la voix (`SetSentenceFromConv`) reste celle de libRealSpace.

### 7.2 Scène de groupe (00h, 01h, 02h, 0Ah)

- **État de scène, pas état de figure.** `CharFigure` est partagé (`ConvAssetManager::figures`)
  et reçoit x, y ; tout le script étant lu d'avance (`SetArchive`), la dernière position lue gagne
  partout (`air1` a 5 positions différentes selon les scripts). Le parseur doit ranger la position
  dans la `ConvFrame` (par exemple une liste de couples figure + position), pas dans `CharFigure`.
- **Contenu de la scène.** Une 00h ouvre une scène : décor, puis toutes les 01h, puis toutes les
  02h, **dessinés dans cet ordre et tous visibles du début à la fin de la scène** (y compris
  pendant les 0Ah et les répliques des autres). Aujourd'hui, la `ConvFrame` d'une 02h ne contient
  que celui qui parle. Le parseur doit recopier dans chaque `ConvFrame` de la scène (02h et 0Ah)
  toutes les figures de la scène, avec leur position, et indiquer laquelle parle ; le lecteur
  dessine la liste.
- **Dessin.** libRealSpace dessine les images 0 et 1 de chaque figure qui en a plusieurs. Jeu :
  - figurant (01h) : image 0 seule ;
  - personnage qui parle (02h) : image 0, puis sa bouche (§ 7.4) **seulement pendant sa propre
    réplique** ; sinon image 0 seule ;
  - écran d'équipiers : figures posées en (0, 0), coordonnées dans l'image.
- **Palette** : palettes du décor, puis `FGPL` « normal » (`CONVPALS` 48, `parseFGPL_DATA` est
  vide dans libRealSpace), puis `PFIG` du **premier 01h** seulement. Envoyée à la carte seulement
  quand le nom du décor change.
- **Durées** : une 02h dure une image par caractère de son texte (fin du texte de lèvres), sans
  attente après ; une 0Ah dans une scène de groupe dure 40 images. Une touche passe à la suite.

### 7.3 Décor (`ConvAssetManager::ParseBGLayer`)

Chaque élément de `BACK DATA` fait 5 octets ; libRealSpace n'en lit que 3 et remplace la position
par la règle « y = 24 si la hauteur est inférieure à 199 ». Lire le 4ᵉ et le 5ᵉ octet comme un
**mot signé y** : l'élément est à l'écran en (0, y + 24), avec les décalages propres de l'image
(exemple : ciel `optshps` 116 de `str_s_ex`, y = −24 → haut de l'écran). Même chose pour les visages
(`parseFACE_DATA`, règle « hauteur inférieure à 198 ») : la position vient de la 03h, (x, y + 24).

### 7.4 Gros plan (03h, 04h, 0Ah) : dessin, yeux, bouche

Détail du jeu : « Yeux et bouches » (§ 2). À appliquer :

- **Dessin**, dans cet ordre, à la position de la 03h : image 0 (tête), image des yeux (si ≠ −1),
  bouche (si ≠ −1), image 1 (coiffure), image 34 (habits). En numéros libRealSpace : 1, yeux + 1,
  bouche + 1, 2, 35. Le jeu dessine **une seule** image des yeux : l'octet de la 03h (255 →
  aucune). Comparé à `faces_shape` (image des yeux attendue en numéro libRealSpace = octet + 1) :
  13, 16, 17, 18, 22, 23, 24, 25, 32 sont conformes ; à corriger : 14 (attendu 15, libRealSpace
  dessine 21 et 28), 19 (attendu 20, aucune), 20 (attendu 21, plus 28 en trop), 21 (attendu 22),
  26 (27), 27 (28), 28 (29), 29 (30), 31 (32). Valeurs présentes dans les données : 13, 14, 16 à
  25, 27, 28, 31 et 255.
- **Clignement** : remplacer l'image des yeux par l'image 12 (libRealSpace 13) une fois sur 30 à
  chaque image de scène, si l'octet de la 03h vaut 20 au plus ou 255. Absent des fichiers de
  libRealSpace lus.
- **Bouche** : libRealSpace fait tourner les images 3 à 12 sur l'horloge (`3 + (SDL_GetTicks() /
  100) % 10`). Jeu : une lecture du texte par image de scène, avec les règles « er », « th », « ch »,
  « h », « e » final ; bouches 2 à 11 (libRealSpace 3 à 12). Texte lu = texte brut du script, codes
  `$` non remplacés, en minuscules.
- **04h** garde visage, décor, couleur et image de base ; nouveau texte de lèvres.
- **Durées** : fin du texte de lèvres, puis 40 images (15 si le texte est vide). Une 0Ah après un
  gros plan : 20 images, texte affiché sans mouvement des lèvres.
- **Palette** : palettes du décor puis `FCPL` « normal » (`CONVPALS` 46), le seul appel vu
  (`ConvData_FindFacePalette_5A46F`) demande « normal » ; envoyée quand le décor change.

Code de référence (compilé, style du dépôt) ; une lecture = une image de scène, numéros du jeu :

```cpp
// Numéros d'image du jeu ; libRealSpace ajoute 1 (image vide en tête de chaque jeu d'images).
static const char *kCloseUpLipTable = "06891599098769362999252999";
static const char *kGroupLipTable = "04302500000340143000353000";

struct LipReader {
    std::string text;
    size_t cursor{ 0 };
};

// Texte de lèvres : texte brut du script (codes $ non remplacés), mis en minuscules.
void setLipText(LipReader &reader, const std::string &scriptText) {
    reader.text = scriptText;
    for (auto &c : reader.text) {
        if (c >= 'A' && c <= 'Z') {
            c = static_cast<char>(c - 'A' + 'a');
        }
    }
    reader.cursor = 0;
}

bool isLipTextDone(const LipReader &reader) {
    return reader.cursor >= reader.text.size();
}

static char charAt(const LipReader &reader, size_t index) {
    if (index < reader.text.size()) {
        return reader.text[index];
    }
    return '\0';
}

// Gros plan (03h) : une lecture par image de scène (10 par seconde). Renvoie -1 = pas de bouche.
int advanceCloseUpMouth(LipReader &reader) {
    int mouth = -1;
    char c = charAt(reader, reader.cursor);
    if (c == '\0') {
        return -1;
    }
    reader.cursor++;
    char next = charAt(reader, reader.cursor);
    if (c == 'e') {
        if (next < 'a' || next > 'z') {
            c = next;
            reader.cursor++;
        } else if (next == 'r') {
            mouth = 6;
            reader.cursor++;
        }
    } else if (c == 'h') {
        reader.cursor++;
    } else if (c == 't') {
        if (next == 'h') {
            mouth = 9;
            reader.cursor++;
        }
    } else if (c == 'c') {
        if (next == 'h') {
            mouth = 6;
            reader.cursor++;
        }
    }
    if (mouth == -1 && c >= 'a' && c <= 'z') {
        mouth = kCloseUpLipTable[c - 'a'] - '0' + 2;
    }
    return mouth;
}

// Personnage qui parle d'une scène de groupe (02h) : un caractère par image, sans règle.
int advanceGroupMouth(LipReader &reader) {
    char c = charAt(reader, reader.cursor);
    if (c == '\0') {
        return -1;
    }
    reader.cursor++;
    if (c < 'a' || c > 'z') {
        return -1;
    }
    return kGroupLipTable[c - 'a'] - '0' + 1;
}

// Image des yeux du gros plan, tirée à chaque image de scène. baseFrame = -1 si l'octet vaut 255.
int closeUpEyeFrame(int baseFrame) {
    if (baseFrame > 20) {
        return baseFrame;
    }
    if (std::rand() % 30 == 0) {
        return 12;
    }
    return baseFrame;
}
```

`std::rand() % 30 == 0` reproduit la probabilité du jeu (`CRT_Rand × 30 / 32768 = 0`, soit
1 093 / 32 768). Le jeu teste la fin par « caractère courant = 0 » ; un texte finissant par « e » ou
« h » ferait sauter ce 0 dans le jeu, aucun texte des données n'est dans ce cas.

### 7.5 Question « Accept / Reject » (0Bh)

- **Visage** : image de base fixée à **53** (libRealSpace 54, valeur déjà dessinée par
  `CONV_CONTRACT_CHOICE`, mais par-dessus la liste `faces_shape` : le jeu remplace l'image des
  yeux, il n'en ajoute pas une) ; texte de lèvres vide → pas de bouche ; le clignement ne joue pas
  (53 > 20).
- **Ouverture** : la tête et le dernier élément du décor (`var_56`) sont descendus de 24 lignes
  (méthode +18h, déplacement (0, 24)) et la scène passe en plein écran (0, 0)-(319, 199) ; les bandes noires s'ouvrent en 24 pas (haut : une ligne par pas, bas :
  deux lignes par pas). L'image reste au même endroit à l'écran ; elle est seulement découverte.
  Les bandes se referment de la même façon après la réponse.
- **Zone** : la souris dans **x 118 à 279, y 113 à 199** (écran) → « Accept Mission », partout
  ailleurs → « Reject Mission ». libRealSpace a deux zones, gauche (x 0–120) et droite
  (x 200–320). Le libellé correspondant est réécrit à **y = 175** à chaque tour de la boucle
  d'attente (tous les 3 tics de l'horloge `dword_47ABB`) ; la boucle s'arrête sur un événement
  d'entrée de type 2 (type non identifié dans ce code).
- **Effet** : réponse rangée pour la partie (`GameState.mission_accepted`, partie + 35Bh dans le
  jeu) ; si refus, le curseur du script avance du mot de la 0Bh. Le script de partie choisit la
  suite par ses tests 14h / 15h (§ 5).

### 7.6 Choix de l'équipier (0Eh, 0Fh)

- Décor `s_wing` ou `w_wing` selon l'octet écran de la 0Eh précédente ; libRealSpace prend
  toujours `s_wing`.
- Ne proposer que les pilotes de la liste `PILT` de la `WING` donnée par la 0Eh (libRealSpace
  propose toujours les 5). Libellés du jeu : « Select Billy », « Select Gwen », « Select Lyle »,
  « Select Miguel », « Select Tex ».
- L'ordre gauche → droite des zones de libRealSpace (Lyle, Miguel, Gwen, Billy, Tex) n'a pas été
  comparé aux positions des figures dans les images : à vérifier sur l'écran.

### 7.7 Texte (`SCConvPlayer::DrawText`, `SetSentenceFromConv`)

- **Remplacements** pour **chaque occurrence** (libRealSpace : première occurrence seulement).
  `$N` `$S` `$C` peuvent rester au parseur, comme aujourd'hui. `$W` `$L` `$O` dépendent du choix
  fait pendant la conversation (0Fh) : ils restent au lecteur (`DrawText`, où est déjà `$W`), ou le
  parseur range le texte brut dans `ConvFrame` et le lecteur remplace. Le texte de lèvres est le
  texte brut (§ 7.4) :

| Code | Valeur |
|---|---|
| `$S` / `$N` / `$C` | nom / prénom / indicatif du joueur |
| `$W`, `$L`, `$O` | les trois équipiers posés par 0Eh / 0Fh (§ 2) — `$L` et `$O` absents de libRealSpace |
| `$A`, `$B` | un nom de la table DiBianca, Templeman, Isaac, Roberts, Baldwin, Yenawine, Savage (choix : point ouvert) |
| `$P` | avions perdus pendant la mission, en décimal, + « plane », + « s » si la valeur ≠ 1 |
| `$T` | avions perdus au total, même forme |
| `$` + autre | « $ » gardé |

- **Mise en page** : lignes de **30 caractères au plus**, coupées aux espaces (libRealSpace : largeur
  en pixels de la police) ; lignes à l'écran **y = 156 + 15 × n** (libRealSpace : 165 + 13 × n). La
  position horizontale du jeu (format « %Y%J%S ») n'a pas été lue : garder le centrage de
  libRealSpace en attendant.
