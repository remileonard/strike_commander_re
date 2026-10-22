# Conversations (OPTEST.EXE)

Lu le 2026-10-22 dans `analysis/optest/annotated_segments/ovr191_annotated.asm` (interpréteur) et
`seg006_annotated.asm` (lecteurs d'enregistrements). Sauf au § 8, les adresses sont celles de
l'OPTEST.EXE **disquette** (sans voix). Le § 8 décrit l'OPTTEST.EXE du **CD-ROM** (avec voix), lu sans
IDA, avec ses propres adresses ; listings dans `analysis/optest_cd/`.
Outil : `tools/conv_dump.py --donnees <BIGTRE.TRE ou DATA> [entrée ...]` affiche les scripts.

## 1. Fichiers

| Fichier | Rôle |
|---|---|
| `GAMEFLOW\CONV.PAK` | les scripts : une entrée du PAK = une conversation (256 entrées, 15 vides) |
| `GAMEFLOW\CONVDATA.IFF` | noms → images et palettes : décors (`BCKS`/`BACK`), visages (`FACE`), figurants (`FIGR`, `PFIG`), palettes (`FCPL`, `FGPL`) |
| `GAMEFLOW\CONVSHPS.PAK`, `CONVPALS.PAK` | images et palettes des visages, figurants et décors |
| `GAMEFLOW\OPTSHPS.PAK`, `OPTPALS.PAK` | images et palettes partagées avec les menus (ciel, `optshps` 116) |
| `GAMEFLOW\GAMEFLOW.IFF` | escadres (`WNGS` / `WING` : `INFO`, `PILT`, `ORDR`), lues par la commande 0Eh |
| `VOCLIST.IFF` (version CD) | liste des fichiers de voix (`FORM LIST` : `SIZE`, `LIST`), test de présence des voix et préchargement (§ 8.3) |
| `f:<identifiant>.voc` (version CD) | une réplique parlée ; identifiant = la chaîne `[voix]` du script (§ 8.3) |

Chargement d'un script : `Conv_LoadScriptFromPak_59DAA` ouvre `..\..\data\gameflow\conv.pak`, lit
l'entrée numéro `[conv + 6Dh]` en mémoire telle quelle (aucune transformation) ; début `[conv]`,
curseur `[conv + 4]`, taille `[conv + 8]`.

## 2. Format d'un script

Suite de commandes. Chaque commande = 1 octet, puis ses champs. Entiers en petit-boutiste (LE).
« nom » = 9 octets, texte complété par des 0. « chaîne » = texte terminé par un 0.

**Deux formats : disquette et CD-ROM.** Le code de l'OPTEST.EXE disquette lit un seul texte par
réplique. Les données de `BIGTRE.TRE` (version CD) ont, devant **chaque** texte, une chaîne de plus :
l'identifiant de voix (`3gw009`, `1ai021`… ; chaîne vide quand la réplique n'a pas de voix, 56 fois).
L'OPTTEST.EXE du CD-ROM lit toujours cette chaîne (§ 8.1). Avec elle, les 241 scripts se lisent
sans reste et toutes les commandes trouvées sont connues ; sans elle, les 241 échouent. Les tableaux
ci-dessous notent `[voix]` : présent dans le format CD, absent du format disquette. Le reste du
format est identique dans les deux versions.

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
- Version du code qui lit `[voix]` : trouvée dans l'OPTTEST.EXE du CD-ROM, voir § 8.

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
- **Voix : deux formats de données à lire.** libRealSpace gère la voix (`runFrame` joue le VOC) et
  doit lire les données disquette (sans voix) comme celles du CD (avec voix). Choix retenu :
  déterminer le format du script **avant** de le parser, puis lire la voix seulement au format CD
  (§ 9.1) ; la détection texte par texte de `SetSentenceFromConv` est remplacée. Le comportement de
  la version avec voix (lecture, minutage, lèvres, texte) est au § 8.

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
- **Lèvres et voix.** Les §§ 7.1 à 7.7 décrivent la version disquette (lèvres sur le texte). La
  version CD-ROM, avec voix, est au § 8 : pour la voix, elle fait foi.

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
| autre | `do_not_add` | l'octet est sauté par le jeu ; aucun octet de ce genre dans les données des deux formats. **Choix pour libRealSpace : erreur de parsing** (§ 9.2). E0h n'est pas une commande |

La lecture du texte et de la voix : format déterminé avant le parsing, puis lecture sans heuristique
(§ 9.1, qui remplace la détection de `SetSentenceFromConv`).

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

Code de référence (compilé, style du dépôt, fichier `tools/conv_ref/conv_lips.cpp`) ; une lecture = une
image de scène, numéros du jeu :

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

## 8. Version CD-ROM : la voix (lu le 2026-10-22)

Source : `OPTTEST.EXE` de la version CD-ROM, fourni par Rémi **sans désassemblage IDA**. Lu avec
`tools/exe_disasm.py` (capstone) ; listings dans `analysis/optest_cd/` (voir son `README.md`). Les adresses ci-dessous sont des décalages dans l'image chargée
de **cet** exécutable (DGROUP = 4C25h) ; elles n'ont rien à voir avec celles de l'OPTEST.EXE
disquette. Aucune de ces fonctions n'a de nom : les noms proposés sont entre guillemets.

### 8.1 Lecture du script : pas de détection

Les lecteurs d'enregistrement de la version CD lisent **toujours** deux chaînes, la voix puis le
texte :
- 0Ah (lecteur en 0CC5Fh, « ConvRec_ReadNarration ») : octet couleur, chaîne → voix, chaîne → texte ;
- 03h (0C8F1h, « ConvRec_ReadLine ») : …, x, y, chaîne → voix, chaîne → texte, octet couleur ;
- 02h (0CB0Bh, « ConvRec_ReadTalk ») : nom, x, y, octet couleur, chaîne → voix, chaîne → texte.

Une voix « absente » est une **chaîne vide**. Dans les données : 56 textes ont une voix vide
(38 × 03h, 4 × 04h, 14 × 0Ah), les 2 338 autres en ont une (2 259 identifiants différents).

### 8.2 Quand la voix est jouée

Pour chaque réplique, l'interpréteur (« Conv_PlayScript », 07A9Fh) teste, dans cet ordre :
1. la chaîne de voix n'est pas vide (`strlen`) ;
2. un pilote de son numérisé est chargé (mot DGROUP:4031h ≠ 0 ; ce mot est remis à 0 quand les
   pilotes sont libérés, en 30747h et 30759h) ;
3. au début de la conversation, `VOCLIST.IFF` a été lu **et le premier fichier qu'il nomme
   existe** (résultat gardé en `[bp−28h]`). C'est le test de présence des voix : « VocList_Open »
   (04FC4h) renvoie le résultat de « File_Exists » (0CE05h) sur le premier nom de la liste, qui
   appelle 43055h (non lue) puis, si elle échoue, 02187h(nom, 0) (vraisemblablement `access`
   de la bibliothèque C) ; vrai si l'un des deux trouve le fichier.

Si les trois sont vrais : **voix**. Sinon : **texte**. Les deux ne sont jamais affichés ensemble :
avec voix, le texte n'est pas dessiné (l'appel au dessin du texte, 06FA5h, est sauté). Vu pour la
0Ah de premier niveau, la 02h (scène de groupe) et la 03h / 04h (gros plan).

### 8.3 Chargement du fichier

- **Nom du fichier** : `"f:"` + identifiant + `".voc"` (concaténation 13DFCh). Le `f:` fait partie du
  nom ; les noms de `VOCLIST.IFF` ont la même forme (`f:2ai431.voc`).
- **`VOCLIST.IFF`** (`FORM LIST`) : chunk `SIZE` = mot petit-boutiste, taille d'un nom (20 ; refusé
  au-delà de 80), puis chunk `LIST` = noms de cette taille, complétés par des 0 (2 438 noms,
  2 302 différents). Lecteur : « VocList_Open » (04FC4h).
- **Préchargement** (« speech double buffer ») : après avoir lancé une voix, le jeu avance dans
  `VOCLIST.IFF` jusqu'à ce nom, prend le nom suivant (« VocList_SeekAfter », 0509Fh) et le charge en
  mémoire par une tâche de fond (« VocList_StartPreload », 051A8h → 051F1h). À la voix suivante,
  si son nom est celui qui a été préchargé et que le chargement est fini (« VocList_IsPreloaded »,
  05334h), elle est jouée depuis la mémoire ; sinon le fichier est chargé directement. 15 voix des
  scripts ne sont pas dans `VOCLIST.IFF` : elles sont simplement chargées sans préchargement.
- **Lecture** : la voix est chargée dans le lecteur de voix de la tête ou de la figure (« Talking-
  Head_LoadVoice », 11203h, puis « TalkingHead_AttachVoiceLipSync », 11234h, cadence **10**), puis
  lancée (« TalkingHead_StartVoiceAndIsSpeaking », 111ACh, même rôle que
  `TalkingHead_StartVoiceAndIsSpeaking_9C64` de la version disquette).

### 8.4 Minutage et touches

| Cas | Durée de la réplique |
|---|---|
| avec voix | **jusqu'à la fin du son** (boucle tant que 111ACh est vrai) ; une image de scène par tour |
| sans voix, texte non vide | **50 images** de scène (5 s à 10 images par seconde) |
| sans voix, texte vide | 8 images |

- Espace (code 39h) ou Échap (code 01h) pendant la voix : le son est coupé et la réplique finit
  (« Input_CheckSkip », 148B7h). Sans voix, une touche termine la pause de 50 images.
- Échap pose en plus le drapeau DGROUP:69D4h : le texte n'est plus dessiné et la commande 0Ah de
  premier niveau termine la conversation (07B72h).
- Ces durées remplacent, dans la version CD, celles de la version disquette (§ 2 : fin des lèvres
  puis 40 images). La règle actuelle de libRealSpace (5 s sans voix, fin du son avec voix)
  correspond à la version CD.

### 8.5 Lèvres avec voix

- La bouche vient **du son**, avec le même calcul que la version disquette
  (`VoicePlayer_LoadWithLipSync_7D52`, `MIDGAME_SYSTEM.md` § 6.6) : mêmes seuils 95, 78, 65, 42, 25
  (0EEFDh à 0EF59h), mêmes bouches −1, 8, 3, 2, 10, 11, table de 512 valeurs au plus, une valeur par
  image de scène (cadence 10).
- **Gros plan** : filtre nouveau (« TalkingHead_GetVoiceMouth », 1116Eh) — si la bouche vaut 10 ou
  11 et que la précédente valait aussi 10 ou 11, elle devient −1 (bouche fermée). Le clignement et
  la lecture du texte sans voix sont ceux de la version disquette (avance 1148Eh, même table
  « 06891599… »).
- **Personnage de groupe** (avance 118F1h, méthode +1Ch de sa table 1FD7h) : la valeur du son est
  prise telle quelle, sans ce filtre. Son dessin (117C9h) fait l'image 0 puis l'image de la bouche
  si elle ≠ −1, sans contrôle de plage ; ses images de bouche sont 1 à 6, ce que donnent 8, 10 et
  11 au dessin n'a pas été vérifié.
- **Personnage de groupe sans voix : la bouche ne bouge pas** dans la version CD. L'avance en mode
  texte ne passe au caractère suivant que si le caractère courant **vaut 0**
  (`8A 07 3A 46 FC 75 2C` : `mov al, [bx]` / `cmp al, [bp−4]` / `jne`, avec `[bp−4]` = 0, copié de
  DGROUP:1D3Fh), alors que la version disquette range ce caractère (`mov [bp−4], al`). Le texte
  n'avance donc jamais et aucune bouche n'est choisie ; la scène ne l'attend pas (pause fixe de
  50 images, § 8.4).
- **En numéros libRealSpace** (+ 1) : bouches 9, 4, 3, 11, 12.

### 8.6 Scène de groupe (relue le 2026-10-22, 07EA8h à 087DEh)

Table des commandes de premier niveau (cs:39F9h, 00h à 12h) : 00h, 03h, 0Ch, 0Eh, 0Fh comme la
disquette ; **0Ah** = texte seul, avec voix (07B72h) ; 12h ne fait rien ; 10h est sautée comme une
commande inconnue.

Déroulement de la commande 00h :
1. Si Échap a été pressé (DGROUP:69D4h), fin de la conversation.
2. Scène à 10 images par seconde (3619Ah, même appel que `LayerGroup_Construct_2DC66`), zone de
   texte (0, 152)-(319, 199).
3. Lecture du nom de décor (0C8C8h), éléments du décor construits et ajoutés dans l'ordre de `BACK`
   (07537h puis 364CFh, `Layer_Construct` avec le y de l'élément), palette = palettes du décor puis
   `FGPL` « normal ».
4. **Toutes les 01h** qui suivent (08153h–08293h) : lecture (0CA81h : nom, x, y), figurant construit
   (120BBh, avec le dernier caractère du nom comme dans la disquette) et ajouté ; la `PFIG` du
   **premier** figurant s'ajoute à la palette.
5. **Pas de 02h** derrière les 01h : le décor et les figurants sont affichés (palette envoyée), puis
   7 attentes de 10 tics de l'horloge DGROUP:510Fh (une touche les coupe) ; fin de la commande.
6. **Chaque 02h, l'une après l'autre** (boucle 08337h–08705h, tant que l'octet suivant vaut 02h) :
   - lecture (0CB0Bh : nom, x, y, couleur, voix, texte) ;
   - **construction du personnage et ajout à la scène à ce moment-là** (1171Ch puis 360B8h) : il
     apparaît à sa première réplique et **reste affiché** jusqu'à la fin de la scène (aucun retrait
     dans la boucle ; la scène entière est détruite à la fin, 087B4h). Un même nom en deux 02h
     donne deux calques ;
   - s'il n'y avait aucun figurant, `FGPL` « normal » est recopiée à nouveau (pas de `PFIG`) ;
   - si le nom du décor diffère du précédent : zone de texte effacée, palette envoyée ;
   - une image de scène ; avant la **première** réplique seulement, 7 attentes de 10 tics ;
   - avec voix (§ 8.2) : la voix est chargée dans ce personnage et jouée, une image de scène par
     tour jusqu'à la fin du son ; **pas de texte** ;
   - sans voix : texte de lèvres posé (sans effet, § 8.5), couleur, **texte dessiné**, pause de
     50 images (8 si le texte est vide) ;
   - une touche coupe la réplique.
7. Après la dernière 02h (ou s'il n'y en a aucune, à l'étape 5) : libération des figures, du décor et
   de la scène. L'image reste à l'écran (rien ne l'efface).

Une 0Ah qui suit une scène de groupe n'est donc pas traitée par la scène : elle passe par la commande
0Ah de premier niveau (texte ou voix seuls) après la destruction de la scène.

Différences avec la version disquette (§ 2) :

| | Disquette | CD-ROM |
|---|---|---|
| personnages 02h | tous construits avant la première réplique, visibles dès le début | construits un par un, visibles à partir de leur réplique |
| bouche d'un 02h | lettre par lettre du texte | du son ; sans voix, immobile |
| durée d'une 02h | fin du texte de lèvres | fin du son ; sans voix 50 images (8 si vide) |
| 0Ah après les 02h | dans la scène, 40 images | commande de premier niveau, après la scène |
| attente au début | aucune | 7 × 10 tics avant la première réplique |

La cadence de l'horloge DGROUP:510Fh n'a pas été lue (les 10 tics ne sont pas convertis en secondes).

### 8.7 Pour libRealSpace

- Format déterminé avant le parsing (§ 9.1) ; au format CD, le jeu lit toujours la chaîne de voix,
  vide quand il n'y a pas de voix (§ 8.1) : une voix vide = réplique en texte.
- Avec voix : **pas de texte affiché** ; fin de réplique = fin du son. Sans voix : texte, 5 s
  (0,8 s si le texte est vide).
- Lèvres avec voix : calcul du son de `MIDGAME_SYSTEM.md` § 6.6 à la cadence 10, plus le filtre
  10/11 du gros plan. Sans voix : gros plan comme § 7.4 ; personnage de groupe immobile dans la
  version CD (§ 8.5), lettre par lettre dans la version disquette — choix à faire pour le portage.
- Scène de groupe de la version CD : chaque personnage 02h apparaît à sa première réplique et
  reste (§ 8.6) ; la structure de libRealSpace doit alors donner, pour chaque `ConvFrame`, les
  figures déjà apparues, pas toutes celles de la scène.
- `VOCLIST.IFF` sert au jeu de test de présence des voix (condition 3 du § 8.2) et au
  préchargement ; libRealSpace peut s'en passer pour charger les fichiers, l'équivalent du test
  étant « le fichier de voix existe ».

## 9. Détection voix / texte de libRealSpace : essai sur les données (2026-10-22)

`ConvFrame::SetSentenceFromConv` doit lire les deux formats (§ 2) : le format disquette (un texte)
et le format CD (voix puis texte). Elle décide **à chaque texte** :
1. lire une première chaîne ;
2. si l'octet qui suit vaut 80h ou plus, regarder l'octet d'après (« décalage 2 ») ;
3. si cet octet est une valeur de commande (`isNextFrameIsConv` : 00, 01, 02, 03, 04, 0A, 0B, 0C,
   0F, E0) → pas de voix, la première chaîne est le texte ;
4. sinon, s'il ne vaut ni FFh ni F4h → la première chaîne est la voix, la seconde le texte ; s'il vaut
   FFh ou F4h → pas de voix, et la fin est placée 4 octets plus loin. Cette branche a été ajoutée
   pour les conversations de *Pacific Strike*, de format voisin (information de Rémi).

**Essai** (`tools/conv_ref/librs_voice_detect.py`). La règle a été rejouée en Python sur chaque texte des 241 scripts, aux bonnes positions,
dans les deux formats. Format CD = `CONV.PAK` de `BIGTRE.TRE`. Format disquette = les mêmes scripts
**sans les chaînes de voix** (reconstruit, pas un vrai `CONV.PAK` disquette ; à confirmer sur les
données disquette).

| Format | Textes justes | Textes faux |
|---|---|---|
| disquette (reconstruit) | 2 394 / 2 394 | 0 |
| CD | 2 365 / 2 394 | **29** |

**Pourquoi elle marche sur la disquette.** Seulement grâce aux données :
- un texte de 02h, 04h ou 0Ah est toujours suivi d'une commande (pas de voix → juste) ;
- un texte de 03h est suivi de son **octet couleur**, qui n'est pas une commande ; la règle ne tombe
  juste que parce que **toutes** les couleurs de 03h des données valent 80h ou plus (branche
  « décalage 2 », 1 717 fois). Une couleur de 03h inférieure à 80h ferait prendre le texte pour une
  voix et décalerait toute la suite.

**Les 29 erreurs du format CD.** Toujours des 03h dont la voix **et** le texte sont vides (`00 00`
puis la couleur) : le 0 qui suit la voix vide est pris pour la commande 00h, la voix vide devient le
texte, et la lecture s'arrête un octet trop tôt. La couleur lue vaut alors 0, et l'octet couleur réel
est lu comme une commande inconnue, puis sauté (`do_not_add`) : la lecture se recale par chance.
Effet visible : aucun ici (texte vide), mais c'est un décalage du flux.

**Parties sans effet sur ces données.** La branche FFh / F4h (*Pacific Strike*) ne sert jamais
avec les données de *Strike Commander* (aucun des deux formats ne l'atteint). Retirer E0h de la liste des commandes et la branche FFh / F4h donne
exactement les mêmes résultats pour la détection.

**E0h.** Ce n'est pas une commande du jeu (aucune entrée E0h dans les tables de commandes, disquette
ou CD). Dans les données, E0h est **une couleur de texte** : la couleur la plus fréquente des 03h
(495 sur 1 717) et celle de 69 des 70 02h. Dans libRealSpace, `isNextFrameIsConv` sert à trois
endroits : la détection de voix (sans effet, ci-dessus) et les deux boucles de recherche de
`parse_GROUP_SHOT` et `parse_GROUP_SHOT_ADD_CHARACTER`. Simulées sur les 86 scènes de groupe et
les 184 figurants des deux formats, ces boucles s'arrêtent toujours sur l'octet qui suit
immédiatement, une vraie commande : E0h n'y est jamais atteint. Hypothèse pour ces boucles :
`PeekByte` renvoie l'octet qui suit la position courante, seule lecture pour laquelle le nom du
figurant tombe juste après `MoveForward(2)` (source de `ByteStream` non lue).

**Conclusion (avec Rémi) : E0h est un symptôme, pas une commande.** C'est la trace du décalage de
lecture causé par la détection voix / texte : sur une réplique dont la voix et le texte sont vides,
la lecture s'arrête un octet trop tôt et l'octet couleur qui suit — souvent E0h — est lu comme une
commande. E0h ne doit être traité comme une commande nulle part (à retirer de `isNextFrameIsConv`).
La cause se corrige par le format choisi avant le parsing (§ 9.1).

**Conclusion.** La règle est à la fois trop compliquée (deux branches inutiles) et fragile : elle
dépend de la valeur des couleurs et du contenu des textes, et se trompe déjà sur 29 répliques du CD.
Le format ne change pourtant pas d'un texte à l'autre : c'est **tout le script** qui est au format
disquette ou au format CD.

### 9.1 Choix retenu : tester le format avant de parser

Décision de Rémi : avant de parser une conversation, déterminer si elle est au format CD ou au format
disquette ; ensuite le parseur lit la voix si le format est CD, et ne la lit pas sinon. Plus aucune
devinette texte par texte.

- **Test** (`detectConvFormat`) : lire le script entier en supposant le format CD ; si toutes les
  commandes sont connues et que la lecture finit exactement à la fin du script → `Cd`. Sinon, même
  essai au format disquette → `Floppy`. Si aucun ne convient → `Unknown` (à signaler, ne pas
  parser au hasard).
- **Parsing** : le format est gardé par le parseur (par exemple un membre de `SCConvPlayer` posé dans
  `SetArchive`, avant la boucle `ReadNextFrame`) et passé aux `parse_*`. `SetSentenceFromConv` est
  remplacée par une lecture sans heuristique (`readConvText`) : une chaîne de voix si `Cd`, puis le
  texte ; la valeur renvoyée est le nombre d'octets lus, qui donne la position exacte du champ
  suivant (la couleur pour 03h). La séparation parseur / structure / lecteur est inchangée.
- `isNextFrameIsConv` n'est plus utile pour la voix ; ses autres usages dans le parseur
  (`parse_GROUP_SHOT`, `parse_GROUP_SHOT_ADD_CHARACTER`) sont à revoir à part (§ 7.1). E0h est à
  retirer de sa liste dans tous les cas.

**Essai** (C++ ci-dessous, fichier `tools/conv_ref/conv_format.cpp`, compilé, style du dépôt) : 241 / 241 scripts CD reconnus `Cd`, 241 / 241
scripts disquette (reconstruits) reconnus `Floppy`. Lu dans le mauvais format, chacun des 241 scripts,
dans les deux sens, contient au moins une commande inconnue : le test ne peut pas se tromper de
format sur ces données. Un script sans aucun texte se lit pareil dans les deux formats (réponse `Cd`,
sans conséquence).

**Pacific Strike.** Plutôt qu'une branche de plus dans la lecture de chaque texte, en faire un
troisième format (`ConvFormat::PacificStrike`) avec son propre lecteur de texte, choisi par le même
test avant le parsing. Son format n'est pas décrit ici (pas de données ni d'exécutable de *Pacific
Strike* dans cette archive) : le lecteur et le test sont à écrire d'après ses données.

```cpp
// Lecteur minimal d'un script de conversation, utilisé seulement pour choisir le format.
class ConvFormatProbe {
public:
    ConvFormatProbe(const uint8_t *data, size_t size, bool withVoice)
        : data(data), size(size), withVoice(withVoice) {
    }

    // Vrai si tout le script se lit dans ce format : commandes connues, champs complets.
    bool readsCleanly() {
        while (pos < size) {
            uint8_t op = data[pos];
            pos++;
            bool ok = false;
            if (op == 0x00) {
                ok = groupShot();
            } else if (op == 0x03) {
                ok = closeUp();
            } else if (op == 0x0C) {
                ok = skip(2);
            } else if (op == 0x0E) {
                ok = skip(2);
            } else if (op == 0x0F || op == 0x10) {
                ok = true;
            }
            if (!ok) {
                return false;
            }
        }
        return pos == size;
    }

private:
    const uint8_t *data;
    size_t size;
    bool withVoice;
    size_t pos{ 0 };

    bool skip(size_t count) {
        if (pos + count > size) {
            return false;
        }
        pos += count;
        return true;
    }

    bool string() {
        while (pos < size) {
            if (data[pos] == 0) {
                pos++;
                return true;
            }
            pos++;
        }
        return false;
    }

    // [voix] puis texte.
    bool text() {
        if (withVoice && !string()) {
            return false;
        }
        return string();
    }

    bool peekIs(uint8_t value) {
        return pos < size && data[pos] == value;
    }

    bool groupShot() {
        if (!skip(9)) {
            return false;
        }
        while (peekIs(0x01)) {
            if (!skip(1 + 9 + 4)) {
                return false;
            }
        }
        while (peekIs(0x02) || peekIs(0x0A)) {
            uint8_t op = data[pos];
            pos++;
            size_t fields = 1;
            if (op == 0x02) {
                fields = 9 + 4 + 1;
            }
            if (!skip(fields) || !text()) {
                return false;
            }
        }
        return true;
    }

    bool closeUp() {
        if (!skip(9 + 1 + 9 + 4) || !text() || !skip(1)) {
            return false;
        }
        while (peekIs(0x04) || peekIs(0x0A) || peekIs(0x0B)) {
            uint8_t op = data[pos];
            pos++;
            bool ok = false;
            if (op == 0x04) {
                ok = text();
            } else if (op == 0x0A) {
                ok = skip(1) && text();
            } else {
                ok = skip(2);
            }
            if (!ok) {
                return false;
            }
        }
        return true;
    }
};

enum class ConvFormat {
    Floppy,
    Cd,
    Unknown
};

// Choisi une fois, avant de parser le script.
ConvFormat detectConvFormat(const uint8_t *data, size_t size) {
    ConvFormatProbe cd(data, size, true);
    if (cd.readsCleanly()) {
        return ConvFormat::Cd;
    }
    ConvFormatProbe floppy(data, size, false);
    if (floppy.readsCleanly()) {
        return ConvFormat::Floppy;
    }
    return ConvFormat::Unknown;
}

// Lecture d'un texte une fois le format connu : [voix] si Cd, puis texte. Renvoie les octets lus.
size_t readConvText(const uint8_t *data, size_t avail, ConvFormat format, std::string &voice, std::string &text) {
    size_t used = 0;
    voice.clear();
    if (format == ConvFormat::Cd) {
        size_t length = strnlen(reinterpret_cast<const char *>(data), avail);
        voice.assign(reinterpret_cast<const char *>(data), length);
        used = length + 1;
    }
    size_t length = strnlen(reinterpret_cast<const char *>(data + used), avail - used);
    text.assign(reinterpret_cast<const char *>(data + used), length);
    used += length + 1;
    return used;
}
```

Champs sautés par le test (§ 2) : 00h = nom (9) ; 01h = nom (9) + x, y (4) ; 02h = nom (9) + x, y (4)
+ couleur (1) ; 0Ah = couleur (1) ; 03h = visage (9) + image (1) + décor (9) + x, y (4), texte,
couleur (1) ; 0Bh, 0Ch = mot (2) ; 0Eh = 2 octets ; 0Fh, 10h = rien.

`CONV.PAK` n'existant qu'en un format par version du jeu, le test peut aussi être fait une seule fois
pour toute l'archive (sur le premier script qui contient un texte).

### 9.2 Octet qui n'est pas une commande : erreur de parsing

Choix de Rémi : le parseur de libRealSpace s'arrête **en erreur** quand il lit, à la place d'une
commande, un octet qui n'en est pas une. Une lecture décalée se voit alors tout de suite, au lieu
d'être rattrapée par chance (cas de E0h).

- **Commandes valides de premier niveau** : 00h, 03h, 0Ch, 0Eh, 0Fh, et les deux commandes qui ne
  font rien, **10h** (disquette, table `off_5CE29`) et **12h** (CD, § 8.6). **0Ah** est aussi une
  commande de premier niveau dans la version CD (texte seul, 07B72h) ; aucune n'apparaît à ce niveau
  dans les données. Les sous-commandes (01h, 02h, 0Ah après 00h ; 04h, 0Ah, 0Bh après 03h) ne sont
  valides qu'à leur place (§ 2).
- **Écart avec le jeu, assumé** : les deux versions du jeu sautent un octet inconnu sans rien dire
  (branche par défaut de la table des commandes). Le choix d'une erreur ne change rien sur les
  données de *Strike Commander* : lus dans le bon format, les 241 scripts n'ont **aucun** octet
  inconnu (§ 4), dans les deux formats.
- **Fin du script** : la lecture doit finir exactement à la fin de l'entrée du PAK ; un champ ou une
  chaîne qui dépasse est aussi une erreur. C'est la même règle que le test de format
  (`ConvFormatProbe::readsCleanly`, § 9.1) : le parseur et le test peuvent partager le même
  lecteur.
- **Sauts 0Bh / 0Ch** : la destination doit être le début d'une commande ou la fin du script (vrai
  pour les 52 sauts des données, § 4).

### 9.3 Architecture proposée : une boucle de premier niveau, un sous-parseur par commande

Proposition de Rémi. Aujourd'hui, `SCConvPlayer::parseConv` traite au même niveau les commandes et
les sous-commandes (01h, 02h, 04h, 0Ah, 0Bh, 0Ch ont chacune leur `case`), et les `parse_*`
appellent eux-mêmes le parseur suivant ou cherchent la prochaine commande. C'est ce qui oblige aux
recherches (`isNextFrameIsConv`) et rend les erreurs invisibles.

Le jeu est construit autrement, dans les deux versions : l'interpréteur (`Conv_PlayScript_5AA4E`,
et 07A9Fh dans la version CD) n'a qu'une table de commandes de **premier niveau** ; chaque commande
lit ensuite **elle-même** ses sous-commandes, tant qu'elles se suivent (00h → 01h*, puis 02h / 0Ah* ;
03h → 04h / 0Ah / 0Bh*). La grammaire est donc :

```
script     := commande*
commande   := 00h décor figurant* réplique*          figurant := 01h nom x y
            | 03h gros_plan suite*                    réplique := 02h nom x y couleur texte
            | 0Ah couleur texte          (CD)                   | 0Ah couleur texte
            | 0Ch mot | 0Eh octet octet | 0Fh | 10h | 12h
gros_plan  := visage image décor x y texte couleur    suite    := 04h texte | 0Ah couleur texte | 0Bh mot
texte      := [voix] chaîne              ([voix] au format CD seulement, § 9.1)
```

**Parseur de référence** : `tools/conv_ref/conv_parser.cpp` (C++17, style du dépôt, sans
dépendance). Une boucle de premier niveau (`ConvScriptParser::parse`) appelle un sous-parseur par
commande (`parseGroupShot`, `parseCloseUp`, `parseNarration`, `parseJump`, `parseWing`) ; chaque
sous-parseur lit ses champs et ses sous-commandes, et renvoie faux en cas d'erreur. Le premier
échec arrête tout et donne la position et la raison (`ConvParseResult` : `ok`, `errorOffset`,
`error`). Erreurs détectées : octet qui n'est pas une commande, champ ou chaîne qui dépasse la fin
du script, saut 0Bh / 0Ch qui ne tombe ni sur une commande ni sur la fin (§ 9.2).

Le résultat est une liste plate d'enregistrements (`ConvRecord`, dans l'ordre du script, `level`
0 ou 1) : c'est la « structure » intermédiaire ; la construction des `ConvFrame` se fait ensuite à
partir d'elle, sans relire les octets. La séparation parseur / structure / lecteur est conservée
et même renforcée : plus aucun `parse_*` ne déplace le curseur pour un autre.

**Le même parseur sert de test de format** : format CD si `parse()` réussit avec `ConvFormat::Cd`,
sinon disquette si `parse()` réussit avec `ConvFormat::Floppy`, sinon erreur. `ConvFormatProbe`
(§ 9.1) n'est plus nécessaire.

**Essai** (`tools/conv_ref/export_scripts.py` puis `conv_parser`) :

| Données | Bon format | Mauvais format |
|---|---|---|
| 241 scripts CD | 0 erreur, 2 772 enregistrements | erreur pour les 241 |
| 241 scripts disquette reconstruits (voix retirées, sauts recalculés) | 0 erreur, 2 772 enregistrements | erreur pour les 241 |

2 772 = 86 × 00h + 184 × 01h + 70 × 02h + 32 × 0Ah + 1 717 × 03h + 575 × 04h + 26 × 0Bh + 26 × 0Ch +
28 × 0Eh + 28 × 0Fh, les mêmes comptes que `conv_dump.py` (§ 4).

**Pacific Strike** : un troisième `ConvFormat` se branche à deux endroits seulement, `readText`
(lecture d'un texte) et, si besoin, les commandes propres à ce jeu dans la boucle de premier niveau.

