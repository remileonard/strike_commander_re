# Conversations (OPTEST.EXE)

> **Nombres en décimal** (arguments, champs `+n`). Les adresses de code citées sont aussi en
> décimal ; les fichiers annotés les écrivent en hexadécimal. Les commandes des scripts de
> conversation sont désignées par leur **nom** : celui de `SCConvPlayer.cpp` de libRealSpace quand
> il existe, sinon un nom proposé marqué \* (table du § 2, qui donne aussi les valeurs). Les
> commandes du script de partie portent les noms de `GAMEFLOW_SYSTEM.md` § 5.2.

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
| `GAMEFLOW\GAMEFLOW.IFF` | escadres (`WNGS` / `WING` : `INFO`, `PILT`, `ORDR`), lues par `SELECT_WING` |
| `VOCLIST.IFF` (version CD) | liste des fichiers de voix (`FORM LIST` : `SIZE`, `LIST`), test de présence des voix et préchargement (§ 8.3) |
| `f:<identifiant>.voc` (version CD) | une réplique parlée ; identifiant = la chaîne `[voix]` du script (§ 8.3) |

Chargement d'un script : `Conv_LoadScriptFromPak_59DAA` ouvre `..\..\data\gameflow\conv.pak`, lit
l'entrée numéro `[conv + 109]` en mémoire telle quelle (aucune transformation) ; début `[conv]`,
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

### Commandes de premier niveau (table `off_5CE29`, octets 0 à 16)

| Valeur | Nom | Commande | Champs |
|---|---|---|---|
| 0 | `GROUP_SHOT` | scène de groupe | nom du décor ; puis ses sous-commandes (figurants, puis répliques) |
| 3 | `CLOSEUP` | réplique en gros plan | voir ci-dessous ; puis ses sous-commandes |
| 12 | `YESNOCHOICE_BRANCH2` | saut | mot : nombre d'octets sautés, compté depuis la fin du mot |
| 14 | `SELECT_WING`\* (`UNKNOWN` dans libRealSpace) | escadre | octet `écran` ; octet `escadre` |
| 15 | `CHOOSE_WINGMAN` | choix d'un équipier | aucun |
| 16 | `NOP_16`\* | (rien) | aucun |
| autre | — | sautée | l'octet seul est consommé (branche par défaut) |

Sous-commandes, lues par la commande qui les précède :

| Valeur | Nom | Lue par |
|---|---|---|
| 1 | `GROUP_SHOT_ADD_CHARACTER` | `GROUP_SHOT` (figurant) |
| 2 | `GROUP_SHOT_CHARACTER_TALK` | `GROUP_SHOT` (personnage qui parle) |
| 4 | `CLOSEUP_CONTINUATION` | `CLOSEUP` |
| 10 | `SHOW_TEXT` | `GROUP_SHOT` et `CLOSEUP` ; aussi au premier niveau dans la version CD |
| 11 | `YESNOCHOICE_BRANCH1` | `CLOSEUP` |

Version CD seulement : `NOP_18`\* (18), au premier niveau, ne fait rien (§ 8.6).

Le script se lit jusqu'à la fin de l'entrée (pointeur ≥ début + taille).

### `CLOSEUP` — réplique en gros plan (`ConvRec_ReadLine_632E`)

| Champ | Taille | Rôle (d'après l'usage) |
|---|---|---|
| visage | nom (9) | `FORM FACE` de `CONVDATA.IFF` |
| image | 1 | image de base de la tête (`TalkingHead_SetBaseFrame_9D32`) ; 255 → −1 (`cbw`) = aucune |
| décor | nom (9) | `FORM BACK` de `CONVDATA.IFF` |
| x | mot | position de la tête (160, 130 ou 190 dans les données) |
| y | mot | position de la tête (128 dans les données) |
| [voix] | chaîne | identifiant de voix (données seulement) |
| texte | chaîne | sous-titre et texte de lèvres (`TalkingHead_SetLipText_9C4F`) |
| couleur | 1 | couleur du texte (méthode +16 de la police) |

Puis, autant de fois qu'ils se suivent :
- **`SHOW_TEXT`** : octet couleur, `[voix]`, chaîne — texte affiché sans mouvement des lèvres, attente de
  20 images (lu par `ConvRec_ReadNarration_65E8`) ;
- **`CLOSEUP_CONTINUATION`** : `[voix]`, chaîne — suite de la même réplique (même visage, même décor, même couleur ;
  `ConvRec_ReadLine_632E` ne relit que le texte quand l'en-tête est déjà lu) ;
- **`YESNOCHOICE_BRANCH1`** : mot — question « Accept Mission » / « Reject Mission » (`ConvRec_ReadAcceptSkip_6660`) :
  si le joueur refuse, le mot est ajouté au pointeur (la branche « accepter » est sautée).

### `GROUP_SHOT` — scène de groupe (`ConvRec_ReadName_6305`)

| Commande | Champs | Rôle |
|---|---|---|
| `GROUP_SHOT` | nom du décor (9) | plan large |
| `GROUP_SHOT_ADD_CHARACTER` (répété) | nom de figure (9), x (mot), y (mot) | figurant posé dans le décor (`FORM FIGR`), calque `ConvFigure_ConstructExtra_AB6B` (voir plus bas) |
| `GROUP_SHOT_CHARACTER_TALK` (répété) | nom de figure (9), x, y, octet couleur, `[voix]`, chaîne | personnage qui parle, calque `ConvFigure_ConstructSpeaking_A207` (voir plus bas), lèvres synchronisées sur le texte |
| `SHOW_TEXT` (répété, mêlé aux `GROUP_SHOT_CHARACTER_TALK`) | octet couleur, `[voix]`, chaîne | texte sans personnage |

Les répliques `GROUP_SHOT_CHARACTER_TALK` / `SHOW_TEXT` sont jouées dans l'ordre après la lecture de toute la scène ; une commande `GROUP_SHOT_CHARACTER_TALK`
attend la fin de son texte de lèvres (`TalkingHead_IsLipTextDone_A0D5`), une commande `SHOW_TEXT` attend 40 images.

- **Figurant** (`ConvFigure_ConstructExtra_AB6B`) : image 0 de sa forme (`FIGR`) en (x, y). Si la
  forme a plus d'une image et que le dernier caractère du nom est au-delà de « 3 », il dessine en
  plus une image qui boucle de 1 à n − 1 (une image par image de scène). Les noms des données
  finissent tous par 1, 2 ou 3 : figurants fixes.
- **Personnage qui parle** (`ConvFigure_ConstructSpeaking_A207`, tête parlante à table 6187) :
  image 0 = corps, puis la bouche au même point. À chaque image, lettre suivante du texte ; bouche =
  chiffre de « 04302500000340143000353000 » pour les lettres a à z (dseg 5553) + 1, aucune hors des
  minuscules (ConvFigure_AdvanceSpeaking_A3E1).

### Scène de groupe : placement des figures (relu le 2026-10-22)

**Où l'on dessine.** Comme les cinématiques : `Conv_Init_59A20` réserve une image hors écran de
320 × 200 (`[conv + 26]`, rectangle (0, 0)-(319, 199)), que la commande `GROUP_SHOT` met en surface de
dessin ; la scène (`LayerGroup_Construct_2DC66(scène, 10, 0, conv + 12)`) recopie à l'écran
(`[conv + 12]`, rectangle (0, 24)-(319, 151)) à chaque image (`LayerGroup_PlayFrame_2DD86`).
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

**Ordre de dessin** : éléments du décor dans l'ordre du `BACK`, puis les commandes `GROUP_SHOT_ADD_CHARACTER`, puis les commandes `GROUP_SHOT_CHARACTER_TALK`, dans
l'ordre du script (`LayerGroup_Add_2DB84` ajoute en fin de liste). Les commandes `GROUP_SHOT_CHARACTER_TALK` sont toutes à l'écran dès
le début de la scène ; seules leurs lèvres bougent pendant leur réplique.

**Palette** (une seule pour toute la scène, 256 couleurs, composée dans cet ordre) :
1. la palette de chaque élément du décor ;
2. `FGPL` « normal » (`CONVPALS` 48) ;
3. la palette `PFIG` du **premier figurant (`GROUP_SHOT_ADD_CHARACTER`) seulement** ; sans figurant, rien de plus.
`PFIG` vaut 48 pour la plupart, 51 pour les figures des écrans d'équipiers : sur `s_wing`,
`air2` (48 dans `PFIG`) est dessiné avec la palette 51 de `red1`, premier figurant.
La palette n'est envoyée à la carte que si le décor diffère du précédent (`CRT_Strncmp_Like` sur le
nom gardé en `var_A`).

**Dessin d'une figure** :
- figurant (`GROUP_SHOT_ADD_CHARACTER`) : image 0 ; si la forme a plus d'une image et que le dernier caractère du nom
  est au-delà de « 3 », aussi une image qui boucle de 1 à n − 1 (aucun nom des données) ;
- personnage qui parle (`GROUP_SHOT_CHARACTER_TALK`) : image 0 puis la bouche (images 1 à 6) au même point ; bouche =
  chiffre de la table de lèvres pour la lettre courante + 1, aucune hors des minuscules.

**Durées** : une commande `GROUP_SHOT_CHARACTER_TALK` dure le temps de son texte, une lettre par image (10 par seconde), sans attente
après ; une commande `SHOW_TEXT` dure 40 images. Une touche passe à la réplique suivante.

Contrôle : `tools/conv_scene.py --donnees <BIGTRE.TRE> <entrée> <n° de scène> <sortie.png>` compose
une scène de groupe selon ces règles (images 0 seulement) ; hangar (entrée 12), briefing
(`s_brief`, entrée 59) et équipiers (`s_wing`) sortent juste.

### Yeux et bouches (relu le 2026-10-22)

Deux mécanismes distincts : la **tête du gros plan** (3) cligne des yeux et lit le texte avec des
règles de prononciation ; le **personnage qui parle d'une scène de groupe** (2) ne cligne pas et
lit le texte lettre par lettre. Dans les deux cas, la bouche suit **le texte**, pas la voix : le
mode voix de la tête parlante (`TalkingHead_AttachVoice_9CF7`, utilisé par mid2) n'est appelé nulle
part dans `Conv_PlayScript_5AA4E`. La scène tourne à 10 images par seconde : une lettre = 0,1 s.

**Texte lu par les lèvres.** C'est le texte du script tel quel : `Conv_PlayScript_5AA4E` passe le
même pointeur à `Conv_DrawText_59F54` et à `TalkingHead_SetLipText_9C4F`, et `Conv_DrawText_59F54`
fait les remplacements sur une copie (`CRT_Strdup`). Les codes `$S`, `$N`… ne sont donc pas
remplacés pour les lèvres : « $S » donne une image sans bouche (« $ ») puis la bouche de « s ».
`TalkingHead_CopyLipText_97D8` met le texte en minuscules : les majuscules comptent comme des
lettres.

#### Gros plan (`CLOSEUP`) : `TalkingHead_Construct_98F4`, avance `TalkingHead_Advance_9F5A`

**Dessin** (table de méthodes 6275, `TalkingHead_DrawDressed_9E5E`), dans l'ordre, toutes à la
position de la tête :
1. image 0 du visage (la tête) ;
2. l'**image des yeux** : l'image de base, ou l'image 12 pendant un clignement ; rien si elle vaut −1 ;
3. la **bouche**, rien si elle vaut −1 ;
4. image 1 (coiffure), puis image 34 (habits ; valeur fixée à la construction, aucun autre
   écrivain vu).

**Image de base** = l'octet « image » de la commande `CLOSEUP` (`TalkingHead_SetBaseFrame_9D32`) ; 255 devient −1
(`cbw`) : pas d'image des yeux hors clignement. Pendant la question « Accept / Reject » (11),
l'image de base passe à 53 et le texte de lèvres est une chaîne vide (dseg 4217, juste avant
« Accept Mission ») : bouche fermée.

**Images d'un visage** (relu le 2026-10-23 ; planches : `tools/conv_faces.py`). Chaque `FACE` de
`CONVDATA.IFF` désigne une forme de `CONVSHPS.PAK` de 62 images. Côté code, l'octet « image » ne
sert qu'à choisir l'image de base :

- `Conv_PlayScript_5AA4E` : `mov al, byte ptr [bp+var_158]` / `cbw` / `call TalkingHead_SetBaseFrame_9D32` ;
  `TalkingHead_SetBaseFrame_9D32` range la valeur dans l'image de base et l'image affichée
  (`mov [si+846h], ax` / `mov [si+84Ch], ax`). Aucun autre usage de cet octet.
- La tête, la coiffure et les habits sont **fixes** : `TalkingHead_DrawAt_9D47` dessine l'image 0,
  `TalkingHead_DrawDressed_9E5E` l'image 1 (`push 1`) puis l'image du champ +2120, mis à 34 par
  `TalkingHead_Construct_98F4` (`mov word ptr [si+848h], 22h`). La composition du personnage ne
  dépend donc pas de l'octet « image ».

Contenu des images, relevé dans les données (dessin de chaque image et zone qu'elle couvre) :

| Images | Contenu |
|---|---|
| 0 | la tête (avec le haut du corps) |
| 1 | la coiffure ; présente pour `air`, `janet`, `lyle`, `men`, `pri`, `stern`, `tex` seulement |
| 2 à 11 | les bouches (table des lèvres ci-dessous) |
| 12 | les yeux fermés (clignement) |
| 13 à 21 | les yeux : regards différents |
| 22 à 25 | les sourcils et le haut des yeux : 22 et 25 sur toute la largeur (25 froncés), 23 sur la moitié gauche de l'image, 24 sur la moitié droite |
| 26 | une bouche de plus |
| 27 à 33 | des expressions qui couvrent les yeux et la bouche (27 sourire, 28 grand sourire, 31 sourcils et bouche…) |
| 34 | les habits, dessinés à chaque image du gros plan |
| 35, 36 | d'autres habits (non dessinés en conversation) |
| 37 | des lunettes de soleil (non dessinées en conversation) |
| 38, 39, 51 | casque, visière et un détail de visière ; `air`, `janet`, `lyle`, `men`, `pri`, `tex` |
| 53 | l'image de la question « Accept / Reject » (image de base fixée à 53) ; `beto`, `far`, `muh`, `walt`, `tweedly` |
| 59 à 61 | trois expressions de `far` seulement |

Les scripts n'utilisent que les yeux (13 à 21), les sourcils (22 à 25), trois expressions (27, 28,
31) et 255 (pas d'image). La règle du clignement va avec ce rangement : au-delà de 20, l'image de
base couvre les yeux, et l'image 12 l'effacerait.

**Visages incomplets.** Les scripts emploient les mêmes valeurs pour tous les visages, mais cinq
visages n'ont qu'une partie des images. Pour une valeur dont l'image est vide, le jeu ne dessine
rien de plus que la tête : le visage reste neutre, comme avec 255.

| Visage | Valeurs des scripts qui désignent une image vide |
|---|---|
| `far` | 17, 18, 19, 21, 22, 25, 31 |
| `muh` | 19, 21, 22, 24, 25 |
| `tweedly` | 14, 22, 23, 25 |
| `beto` | 21, 22, 24, 27 |
| `janet`, `pri` | 23 |
| `men`, `walt` | 24 |

Habits : l'image 34 est vide pour `beto`, `far`, `muh`, `virgil`, `walt`, `tweedly` et `goon`, dont
l'image 0 porte déjà les vêtements.

**Clignement**, tiré à chaque image de scène :
```
image des yeux = 12           si rand() × 30 / 32768 = 0 (une fois sur 30)
                                 et clignement permis (toujours 1 en conversation)
               = image de base sinon
si image de base > 20 : image des yeux = image de base (jamais de clignement)
```
Le tirage est refait à chaque image : un clignement dure en général une image (0,1 s), en moyenne
toutes les 3 s. Dans les données (1 717 `CLOSEUP`), l'image de base vaut 13, 14, 16 à 20 ou 255 dans
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
texte qui finirait par « e » ou « h » ferait sauter le 0 final ; aucun des 2 362 textes `GROUP_SHOT_CHARACTER_TALK` / `CLOSEUP` /
`CLOSEUP_CONTINUATION` des données ne finit ainsi.

Table (`word_445AC`, « 06891599098769362999252999 », chiffre + 2) :

| a | b | c | d | e | f | g | h | i | j | k | l | m | n | o | p | q | r | s | t | u | v | w | x | y | z |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 2 | 8 | 10 | 11 | 3 | 7 | 11 | 11 | 2 | 11 | 10 | 9 | 8 | 11 | 5 | 8 | 4 | 11 | 11 | 11 | 4 | 7 | 4 | 11 | 11 | 11 |

Les images de bouche d'un visage sont donc 2 à 11.

**Durée d'une réplique** : une image par lecture jusqu'à la fin du texte (les caractères consommés
par paire ne coûtent pas d'image), puis **40 images** (15 si le texte est vide) ; une commande `SHOW_TEXT` qui suit
un gros plan : 20 images, sans mouvement des lèvres. Une touche (`Input_CheckSkip_D24A`) coupe
l'attente.

#### Personnage qui parle (`GROUP_SHOT_CHARACTER_TALK`) : `ConvFigure_ConstructSpeaking_A207`, avance `ConvFigure_AdvanceSpeaking_A3E1`

- **Pas de clignement** : la méthode d'avance de cette figure n'a pas de tirage, et le dessin
  (`ConvFigure_DrawSpeaking_A2B7`) ne fait que l'image 0 (corps) puis la bouche.
- **Pas de règle de prononciation** : un caractère par image ; une lettre a..z donne
  bouche = chiffre de « 04302500000340143000353000 » (dseg 5553) + 1, tout autre caractère rien.

| a | b | c | d | e | f | g | h | i | j | k | l | m | n | o | p | q | r | s | t | u | v | w | x | y | z |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 5 | 4 | 1 | 3 | 6 | 1 | 1 | 1 | 1 | 1 | 4 | 5 | 1 | 2 | 5 | 4 | 1 | 1 | 1 | 4 | 6 | 4 | 1 | 1 | 1 |

- Une commande `GROUP_SHOT_CHARACTER_TALK` dure une image par caractère du texte, sans attente après. Les autres personnages
  qui parlent de la scène restent affichés, image 0 seule.

**Palette du visage** : le seul appel de `ConvData_FindFacePalette_5A46F` (dans
`Conv_PlayScript_5AA4E`) passe 0 → toujours `FCPL` « normal » (`CONVPALS` 46) en conversation ;
« night » n'est pas demandé par ce code.

### `SELECT_WING` / `CHOOSE_WINGMAN` — escadre et équipiers

- **`SELECT_WING`** (`ConvRec_ReadWing_66E0`) : cherche dans `GAMEFLOW.IFF`, `FORM WNGS`, la `FORM WING`
  dont l'`INFO` vaut `escadre` ; lit un type (0 à 3), la liste `PILT` (pilotes) et, pour les types
  1 et 2, `ORDR` (5 octets). Remplit les trois noms d'équipiers `$W`, `$L`, `$O` (table des noms
  dseg 3788 : « », Billy, Gwen, Lyle, Miguel, Tex ; table 3800 : DiBianca, Templeman, Isaac,
  Roberts, Baldwin, Yenawine, Savage, utilisée par `$A`, `$B`). L'octet `écran` est gardé pour `CHOOSE_WINGMAN`.
- **`CHOOSE_WINGMAN`** : écran de choix d'un équipier : décor `s_wing` (`écran` = 0) ou `w_wing` (sinon), puis
  `p_wing` ; zones « Select Billy / Gwen / Lyle / Miguel / Tex » pour les pilotes de `PILT` ; le
  pilote choisi remplit `$W`, `$L`, `$O` comme `SELECT_WING`.

### Codes dans les textes (`Conv_DrawText_59F54`)

| Code | Remplacé par |
|---|---|
| `$S` | nom de famille du joueur (partie + 920) |
| `$N` | prénom (partie + 940) |
| `$C` | indicatif (partie + 960) |
| `$W`, `$L`, `$O` | équipiers posés par `SELECT_WING` / `CHOOSE_WINGMAN` |
| `$A`, `$B` | table 3800, indices `[conv + 107]`, `[conv + 108]` |
| `$P` | avions perdus pendant la mission (partie + 234), suivi de « plane » / « planes » |
| `$T` | avions perdus au total (partie + 980), même suffixe |
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
1 717 `CLOSEUP`, 575 `CLOSEUP_CONTINUATION`, 86 `GROUP_SHOT`, 184 `GROUP_SHOT_ADD_CHARACTER`,
70 `GROUP_SHOT_CHARACTER_TALK`, 32 `SHOW_TEXT`, 26 `YESNOCHOICE_BRANCH1`, 26 `YESNOCHOICE_BRANCH2`,
28 `SELECT_WING`, 28 `CHOOSE_WINGMAN`. Les 52 sauts (`YESNOCHOICE_BRANCH1` et `YESNOCHOICE_BRANCH2`)
tombent tous sur le début d'une commande. Exemple (entrée 62, proposition de mission) :

```
YESNOCHOICE_BRANCH1 159    après « Do you accept? » ; refus : saute 159 octets
CLOSEUP                    branche « accepter » : « Good.  I'll contact Virgil… »
                           (suite de la branche « accepter »)
YESNOCHOICE_BRANCH2 78     saute 78 octets, jusqu'à la fin
CLOSEUP                    branche du refus : « All right, but I'd reconsider… »
```

## 5. Lancement d'une conversation

- Script de partie (`Gameflow_RunScriptPairs_36CF`, seg002) : suite de paires d'octets (commande,
  argument) ; **`PLAY_CONV` n = conversation numéro n** (entrée de `CONV.PAK`), jouée par
  `Gameflow_PlayConversation_4AAAB` → `Conv_Construct_59B67` → `Conv_PlayScript_5AA4E`.
- Conversations lancées par le code :
  - **254** si les avions perdus au total dépassent 16 (« The insurance company has dropped our
    policy »), **255** si l'argent (dword partie + 635) devient négatif
    (`Gameflow_CheckLossConversations_50645`) ;
  - `PLANES_LOST_CONV` du script de partie, si des avions ont été perdus pendant la mission : **253** si
    partie + 248 = 2, **252** sinon (Miguel : « we lost $P that mission »).
- La réponse à `YESNOCHOICE_BRANCH1` est rangée dans le premier octet du tampon `[conv + 42]` (partie + 859) :
  1 = « Accept Mission », 0 = refus.
- Le script de partie a des **blocs conditionnels** : une commande de test qui échoue fait sauter
  les commandes suivantes jusqu'à `ELSE` (bascule) ou `ENDIF` (fin de bloc), en comptant les
  tests imbriqués. Commandes de test relevées dans le code : `IF_NOT_FLAG`, `IF_FLAG`,
  `IF_MISSION_ACCEPTED`, `IF_MISSION_REFUSED`, `WEAPON_LOADOUT`, `IF_TRUE`, `IF_MISSION_SUCCESS`,
  `IF_PLANES_LOST`, `IF_RESULT_3`. **`IF_MISSION_ACCEPTED`** : bloc joué si la mission a été
  acceptée (partie + 859 ≠ 0) ; **`IF_MISSION_REFUSED`** : bloc joué si elle a été refusée. C'est
  ainsi que la réponse à `YESNOCHOICE_BRANCH1` choisit la suite (conversations, missions) dans le
  script de partie. `IF_MISSION_SUCCESS` teste un drapeau (partie + 509 + argument). Les autres
  commandes du script de partie relèvent du déroulement de la campagne : `GAMEFLOW_SYSTEM.md`.

## 6. Points ouverts

- Drapeaux dseg 3814 (choix de `$A`, `$B`) : le compte rendu de vol (`misn2op.iff`, chunk `DIED`)
  remet à 0 celui de chaque personnage mort (`GAMEFLOW_SYSTEM.md` § 6) ; ce qui les pose à 1 et le
  choix fait par `$A` / `$B` restent à lire.
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
| `GROUP_SHOT` | `parse_GROUP_SHOT` avance de 8, saute les 0 puis cherche une commande | nom de décor de 9 octets (8 caractères et un 0 au plus), puis la commande suivante |
| `GROUP_SHOT_ADD_CHARACTER` | `parse_GROUP_SHOT_ADD_CHARACTER` : x, y par `ReadUShortBE` après 8 octets | nom (9), x **mot signé petit-boutiste**, y idem. La lecture actuelle tombe juste par hasard tant que 0 ≤ x < 256 ; `airwing1` est en (0, −20) |
| `GROUP_SHOT_CHARACTER_TALK` | `parse_GROUP_SHOT_CHARACTER_TALK` ne lit pas x, y | nom (9), x (+9), y (+11), mots signés ; couleur +13, puis `[voix]`, texte |
| `CLOSEUP` | x lu comme un octet à +19 (130/160/190 → `FacePos`) | x, y = mots signés à +19 et +21 (y = 128 dans les données) ; le reste est juste |
| `YESNOCHOICE_BRANCH1` | deux octets `noOffset`, `yesOffset` | **un mot** = octets à sauter si refus, compté depuis la fin du mot. Les 26 commandes `YESNOCHOICE_BRANCH1` des données ont un saut < 256 et arrivent juste après une commande `YESNOCHOICE_BRANCH2` : le découpage branche 1 / branche 2 actuel tombe juste |
| `YESNOCHOICE_BRANCH2` | `parse_YESNOCHOICE_BRANCH2`, deux octets ignorés | saut sans condition d'**un mot** (fin de la branche « accepter ») |
| `SELECT_WING` | `topOffset`, `first_palette` | octet écran (0 = `s_wing`, sinon `w_wing`), octet numéro de `WING` dans `GAMEFLOW.IFF` ; remplit `$W`, `$L`, `$O` |
| `NOP_16` | non traité | ne fait rien |
| autre | `do_not_add` | l'octet est sauté par le jeu ; aucun octet de ce genre dans les données des deux formats. **Choix pour libRealSpace : erreur de parsing** (§ 9.2). 224 n'est pas une commande |

La lecture du texte et de la voix : format déterminé avant le parsing, puis lecture sans heuristique
(§ 9.1, qui remplace la détection de `SetSentenceFromConv`).

### 7.2 Scène de groupe (`GROUP_SHOT` et ses sous-commandes)

- **État de scène, pas état de figure.** `CharFigure` est partagé (`ConvAssetManager::figures`)
  et reçoit x, y ; tout le script étant lu d'avance (`SetArchive`), la dernière position lue gagne
  partout (`air1` a 5 positions différentes selon les scripts). Le parseur doit ranger la position
  dans la `ConvFrame` (par exemple une liste de couples figure + position), pas dans `CharFigure`.
- **Contenu de la scène.** Une commande `GROUP_SHOT` ouvre une scène : décor, puis toutes les commandes `GROUP_SHOT_ADD_CHARACTER`, puis toutes les
  commandes `GROUP_SHOT_CHARACTER_TALK`, **dessinés dans cet ordre et tous visibles du début à la fin de la scène** (y compris
  pendant les commandes `SHOW_TEXT` et les répliques des autres). Aujourd'hui, la `ConvFrame` d'une commande `GROUP_SHOT_CHARACTER_TALK` ne contient
  que celui qui parle. Le parseur doit recopier dans chaque `ConvFrame` de la scène (2 et 10)
  toutes les figures de la scène, avec leur position, et indiquer laquelle parle ; le lecteur
  dessine la liste.
- **Dessin.** libRealSpace dessine les images 0 et 1 de chaque figure qui en a plusieurs. Jeu :
  - figurant (`GROUP_SHOT_ADD_CHARACTER`) : image 0 seule ;
  - personnage qui parle (`GROUP_SHOT_CHARACTER_TALK`) : image 0, puis sa bouche (§ 7.4) **seulement pendant sa propre
    réplique** ; sinon image 0 seule ;
  - écran d'équipiers : figures posées en (0, 0), coordonnées dans l'image.
- **Palette** : palettes du décor, puis `FGPL` « normal » (`CONVPALS` 48, `parseFGPL_DATA` est
  vide dans libRealSpace), puis `PFIG` du **premier 1** seulement. Envoyée à la carte seulement
  quand le nom du décor change.
- **Durées** : une commande `GROUP_SHOT_CHARACTER_TALK` dure une image par caractère de son texte (fin du texte de lèvres), sans
  attente après ; une commande `SHOW_TEXT` dans une scène de groupe dure 40 images. Une touche passe à la suite.

### 7.3 Décor (`ConvAssetManager::ParseBGLayer`)

Chaque élément de `BACK DATA` fait 5 octets ; libRealSpace n'en lit que 3 et remplace la position
par la règle « y = 24 si la hauteur est inférieure à 199 ». Lire le 4ᵉ et le 5ᵉ octet comme un
**mot signé y** : l'élément est à l'écran en (0, y + 24), avec les décalages propres de l'image
(exemple : ciel `optshps` 116 de `str_s_ex`, y = −24 → haut de l'écran). Même chose pour les visages
(`parseFACE_DATA`, règle « hauteur inférieure à 198 ») : la position vient de la commande `CLOSEUP`, (x, y + 24).

### 7.4 Gros plan (`CLOSEUP`, `CLOSEUP_CONTINUATION`, `SHOW_TEXT`) : dessin, yeux, bouche

Détail du jeu : « Yeux et bouches » (§ 2). À appliquer :

- **Dessin**, dans cet ordre, à la position de la commande `CLOSEUP` : image 0 (tête), image des yeux (si ≠ −1),
  bouche (si ≠ −1), image 1 (coiffure), image 34 (habits). En numéros libRealSpace : 1, yeux + 1,
  bouche + 1, 2, 35. Le jeu dessine **une seule** image des yeux : l'octet de la commande `CLOSEUP` (255 →
  aucune). Comparé à `faces_shape` (image des yeux attendue en numéro libRealSpace = octet + 1) :
  13, 16, 17, 18, 22, 23, 24, 25, 32 sont conformes ; à corriger : 14 (attendu 15, libRealSpace
  dessine 21 et 28), 19 (attendu 20, aucune), 20 (attendu 21, plus 28 en trop), 21 (attendu 22),
  26 (27), 27 (28), 28 (29), 29 (30), 31 (32). Valeurs présentes dans les données : 13, 14, 16 à
  25, 27, 28, 31 et 255.
- **Clignement** : remplacer l'image des yeux par l'image 12 (libRealSpace 13) une fois sur 30 à
  chaque image de scène, si l'octet de la commande `CLOSEUP` vaut 20 au plus ou 255. Absent des fichiers de
  libRealSpace lus.
- **Bouche** : libRealSpace fait tourner les images 3 à 12 sur l'horloge (`3 + (SDL_GetTicks() /
  100) % 10`). Jeu : une lecture du texte par image de scène, avec les règles « er », « th », « ch »,
  « h », « e » final ; bouches 2 à 11 (libRealSpace 3 à 12). Texte lu = texte brut du script, codes
  `$` non remplacés, en minuscules.
- **`CLOSEUP_CONTINUATION`** garde visage, décor, couleur et image de base ; nouveau texte de lèvres.
- **Durées** : fin du texte de lèvres, puis 40 images (15 si le texte est vide). Une commande `SHOW_TEXT` après un
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

// Gros plan (3) : une lecture par image de scène (10 par seconde). Renvoie -1 = pas de bouche.
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

// Personnage qui parle d'une scène de groupe (2) : un caractère par image, sans règle.
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

### 7.5 Question « Accept / Reject » (`YESNOCHOICE_BRANCH1`)

- **Visage** : image de base fixée à **53** (libRealSpace 54, valeur déjà dessinée par
  `CONV_CONTRACT_CHOICE`, mais par-dessus la liste `faces_shape` : le jeu remplace l'image des
  yeux, il n'en ajoute pas une) ; texte de lèvres vide → pas de bouche ; le clignement ne joue pas
  (53 > 20).
- **Ouverture** : la tête et le dernier élément du décor (`var_56`) sont descendus de 24 lignes
  (méthode +24, déplacement (0, 24)) et la scène passe en plein écran (0, 0)-(319, 199) ; les bandes noires s'ouvrent en 24 pas (haut : une ligne par pas, bas :
  deux lignes par pas). L'image reste au même endroit à l'écran ; elle est seulement découverte.
  Les bandes se referment de la même façon après la réponse.
- **Zone** : la souris dans **x 118 à 279, y 113 à 199** (écran) → « Accept Mission », partout
  ailleurs → « Reject Mission ». libRealSpace a deux zones, gauche (x 0–120) et droite
  (x 200–320). Le libellé correspondant est réécrit à **y = 175** à chaque tour de la boucle
  d'attente (tous les 3 tics de l'horloge `dword_47ABB`) ; la boucle s'arrête sur un événement
  d'entrée de type 2 (type non identifié dans ce code).
- **Effet** : réponse rangée pour la partie (`GameState.mission_accepted`, partie + 859 dans le
  jeu) ; si refus, le curseur du script avance du mot de la commande `YESNOCHOICE_BRANCH1`. Le script de partie choisit la
  suite par ses tests `IF_MISSION_ACCEPTED` / `IF_MISSION_REFUSED` (§ 5).

### 7.6 Choix de l'équipier (`SELECT_WING`, `CHOOSE_WINGMAN`)

- Décor `s_wing` ou `w_wing` selon l'octet écran de la commande `SELECT_WING` précédente ; libRealSpace prend
  toujours `s_wing`.
- Ne proposer que les pilotes de la liste `PILT` de la `WING` donnée par la commande `SELECT_WING` (libRealSpace
  propose toujours les 5). Libellés du jeu : « Select Billy », « Select Gwen », « Select Lyle »,
  « Select Miguel », « Select Tex ».
- L'ordre gauche → droite des zones de libRealSpace (Lyle, Miguel, Gwen, Billy, Tex) n'a pas été
  comparé aux positions des figures dans les images : à vérifier sur l'écran.

### 7.7 Texte (`SCConvPlayer::DrawText`, `SetSentenceFromConv`)

- **Remplacements** pour **chaque occurrence** (libRealSpace : première occurrence seulement).
  `$N` `$S` `$C` peuvent rester au parseur, comme aujourd'hui. `$W` `$L` `$O` dépendent du choix
  fait pendant la conversation (15) : ils restent au lecteur (`DrawText`, où est déjà `$W`), ou le
  parseur range le texte brut dans `ConvFrame` et le lecteur remplace. Le texte de lèvres est le
  texte brut (§ 7.4) :

| Code | Valeur |
|---|---|
| `$S` / `$N` / `$C` | nom / prénom / indicatif du joueur |
| `$W`, `$L`, `$O` | les trois équipiers posés par `SELECT_WING` / `CHOOSE_WINGMAN` (§ 2) — `$L` et `$O` absents de libRealSpace |
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
de **cet** exécutable (DGROUP = 19493) ; elles n'ont rien à voir avec celles de l'OPTEST.EXE
disquette. Aucune de ces fonctions n'a de nom : les noms proposés sont entre guillemets.

### 8.1 Lecture du script : pas de détection

Les lecteurs d'enregistrement de la version CD lisent **toujours** deux chaînes, la voix puis le
texte :
- 10 (lecteur en 52319, « ConvRec_ReadNarration ») : octet couleur, chaîne → voix, chaîne → texte ;
- 3 (51441, « ConvRec_ReadLine ») : …, x, y, chaîne → voix, chaîne → texte, octet couleur ;
- 2 (51979, « ConvRec_ReadTalk ») : nom, x, y, octet couleur, chaîne → voix, chaîne → texte.

Une voix « absente » est une **chaîne vide**. Dans les données : 56 textes ont une voix vide
(38 `CLOSEUP`, 4 `CLOSEUP_CONTINUATION`, 14 `SHOW_TEXT`), les 2 338 autres en ont une (2 259 identifiants différents).

### 8.2 Quand la voix est jouée

Pour chaque réplique, l'interpréteur (« Conv_PlayScript », 31391) teste, dans cet ordre :
1. la chaîne de voix n'est pas vide (`strlen`) ;
2. un pilote de son numérisé est chargé (mot DGROUP:16433 ≠ 0 ; ce mot est remis à 0 quand les
   pilotes sont libérés, en 198471 et 198489) ;
3. au début de la conversation, `VOCLIST.IFF` a été lu **et le premier fichier qu'il nomme
   existe** (résultat gardé en `[bp−40]`). C'est le test de présence des voix : « VocList_Open »
   (20420) renvoie le résultat de « File_Exists » (52741) sur le premier nom de la liste, qui
   appelle 274517 (non lue) puis, si elle échoue, 8583(nom, 0) (vraisemblablement `access`
   de la bibliothèque C) ; vrai si l'un des deux trouve le fichier.

Si les trois sont vrais : **voix**. Sinon : **texte**. Les deux ne sont jamais affichés ensemble :
avec voix, le texte n'est pas dessiné (l'appel au dessin du texte, 28581, est sauté). Vu pour la
commande `SHOW_TEXT` de premier niveau, la commande `GROUP_SHOT_CHARACTER_TALK` (scène de groupe) et la commande `CLOSEUP` / `CLOSEUP_CONTINUATION` (gros plan).

### 8.3 Chargement du fichier

- **Nom du fichier** : `"f:"` + identifiant + `".voc"` (concaténation 81404). Le `f:` fait partie du
  nom ; les noms de `VOCLIST.IFF` ont la même forme (`f:2ai431.voc`).
- **`VOCLIST.IFF`** (`FORM LIST`) : chunk `SIZE` = mot petit-boutiste, taille d'un nom (20 ; refusé
  au-delà de 80), puis chunk `LIST` = noms de cette taille, complétés par des 0 (2 438 noms,
  2 302 différents). Lecteur : « VocList_Open » (20420).
- **Préchargement** (« speech double buffer ») : après avoir lancé une voix, le jeu avance dans
  `VOCLIST.IFF` jusqu'à ce nom, prend le nom suivant (« VocList_SeekAfter », 20639) et le charge en
  mémoire par une tâche de fond (« VocList_StartPreload », 20904 → 20977). À la voix suivante,
  si son nom est celui qui a été préchargé et que le chargement est fini (« VocList_IsPreloaded »,
  21300), elle est jouée depuis la mémoire ; sinon le fichier est chargé directement. 15 voix des
  scripts ne sont pas dans `VOCLIST.IFF` : elles sont simplement chargées sans préchargement.
- **Lecture** : la voix est chargée dans le lecteur de voix de la tête ou de la figure (« Talking-
  Head_LoadVoice », 70147, puis « TalkingHead_AttachVoiceLipSync », 70196, cadence **10**), puis
  lancée (« TalkingHead_StartVoiceAndIsSpeaking », 70060, même rôle que
  `TalkingHead_StartVoiceAndIsSpeaking_9C64` de la version disquette).

### 8.4 Minutage et touches

| Cas | Durée de la réplique |
|---|---|
| avec voix | **jusqu'à la fin du son** (boucle tant que 70060 est vrai) ; une image de scène par tour |
| sans voix, texte non vide | **50 images** de scène (5 s à 10 images par seconde) |
| sans voix, texte vide | 8 images |

- Espace (code 57) ou Échap (code 1) pendant la voix : le son est coupé et la réplique finit
  (« Input_CheckSkip », 84151). Sans voix, une touche termine la pause de 50 images.
- Échap pose en plus le drapeau DGROUP:27092 : le texte n'est plus dessiné et la commande `SHOW_TEXT` de
  premier niveau termine la conversation (31602).
- Ces durées remplacent, dans la version CD, celles de la version disquette (§ 2 : fin des lèvres
  puis 40 images). La règle actuelle de libRealSpace (5 s sans voix, fin du son avec voix)
  correspond à la version CD.

### 8.5 Lèvres avec voix

- La bouche vient **du son**, avec le même calcul que la version disquette
  (`VoicePlayer_LoadWithLipSync_7D52`, `MIDGAME_SYSTEM.md` § 6.6) : mêmes seuils 95, 78, 65, 42, 25
  (61181 à 61273), mêmes bouches −1, 8, 3, 2, 10, 11, table de 512 valeurs au plus, une valeur par
  image de scène (cadence 10).
- **Gros plan** : filtre nouveau (« TalkingHead_GetVoiceMouth », 69998) — si la bouche vaut 10 ou
  11 et que la précédente valait aussi 10 ou 11, elle devient −1 (bouche fermée). Le clignement et
  la lecture du texte sans voix sont ceux de la version disquette (avance 70798, même table
  « 06891599… »).
- **Personnage de groupe** (avance 71921, méthode +28 de sa table 8151) : la valeur du son est
  prise telle quelle, sans ce filtre. Son dessin (71625) fait l'image 0 puis l'image de la bouche
  si elle ≠ −1, sans contrôle de plage ; ses images de bouche sont 1 à 6, ce que donnent 8, 10 et
  11 au dessin n'a pas été vérifié.
- **Personnage de groupe sans voix : la bouche ne bouge pas** dans la version CD. L'avance en mode
  texte ne passe au caractère suivant que si le caractère courant **vaut 0**
  (`mov al, [bx]` / `cmp al, [bp−4]` / `jne`, avec `[bp−4]` = 0, copié de
  DGROUP:7487), alors que la version disquette range ce caractère (`mov [bp−4], al`). Le texte
  n'avance donc jamais et aucune bouche n'est choisie ; la scène ne l'attend pas (pause fixe de
  50 images, § 8.4).
- **En numéros libRealSpace** (+ 1) : bouches 9, 4, 3, 11, 12.

### 8.6 Scène de groupe (relue le 2026-10-22, 32424 à 34782)

Table des commandes de premier niveau (cs:14841, valeurs 0 à 18) : `GROUP_SHOT`, `CLOSEUP`,
`YESNOCHOICE_BRANCH2`, `SELECT_WING`, `CHOOSE_WINGMAN` comme la disquette ; **`SHOW_TEXT`** = texte
seul, avec voix (31602) ; `NOP_18` ne fait rien ; la valeur 16 est sautée comme une commande
inconnue.

Déroulement de la commande `GROUP_SHOT` :
1. Si Échap a été pressé (DGROUP:27092), fin de la conversation.
2. Scène à 10 images par seconde (221594, même appel que `LayerGroup_Construct_2DC66`), zone de
   texte (0, 152)-(319, 199).
3. Lecture du nom de décor (51400), éléments du décor construits et ajoutés dans l'ordre de `BACK`
   (30007 puis 222415, `Layer_Construct` avec le y de l'élément), palette = palettes du décor puis
   `FGPL` « normal ».
4. **Toutes les commandes `GROUP_SHOT_ADD_CHARACTER`** qui suivent (33107–33427) : lecture (51841 : nom, x, y), figurant construit
   (73915, avec le dernier caractère du nom comme dans la disquette) et ajouté ; la `PFIG` du
   **premier** figurant s'ajoute à la palette.
5. **Pas de commande `GROUP_SHOT_CHARACTER_TALK`** derrière les commandes `GROUP_SHOT_ADD_CHARACTER` : le décor et les figurants sont affichés (palette envoyée), puis
   7 attentes de 10 tics de l'horloge DGROUP:20751 (une touche les coupe) ; fin de la commande.
6. **Chaque commande `GROUP_SHOT_CHARACTER_TALK`, l'une après l'autre** (boucle 33591–34565, tant que l'octet suivant est un `GROUP_SHOT_CHARACTER_TALK`) :
   - lecture (51979 : nom, x, y, couleur, voix, texte) ;
   - **construction du personnage et ajout à la scène à ce moment-là** (71452 puis 221368) : il
     apparaît à sa première réplique et **reste affiché** jusqu'à la fin de la scène (aucun retrait
     dans la boucle ; la scène entière est détruite à la fin, 34740). Un même nom dans deux commandes `GROUP_SHOT_CHARACTER_TALK`
     donne deux calques ;
   - s'il n'y avait aucun figurant, `FGPL` « normal » est recopiée à nouveau (pas de `PFIG`) ;
   - si le nom du décor diffère du précédent : zone de texte effacée, palette envoyée ;
   - une image de scène ; avant la **première** réplique seulement, 7 attentes de 10 tics ;
   - avec voix (§ 8.2) : la voix est chargée dans ce personnage et jouée, une image de scène par
     tour jusqu'à la fin du son ; **pas de texte** ;
   - sans voix : texte de lèvres posé (sans effet, § 8.5), couleur, **texte dessiné**, pause de
     50 images (8 si le texte est vide) ;
   - une touche coupe la réplique.
7. Après la dernière commande `GROUP_SHOT_CHARACTER_TALK` (ou s'il n'y en a aucune, à l'étape 5) : libération des figures, du décor et
   de la scène. L'image reste à l'écran (rien ne l'efface).

Une commande `SHOW_TEXT` qui suit une scène de groupe n'est donc pas traitée par la scène : elle passe par la commande
10 de premier niveau (texte ou voix seuls) après la destruction de la scène.

Différences avec la version disquette (§ 2) :

| | Disquette | CD-ROM |
|---|---|---|
| personnages (`GROUP_SHOT_CHARACTER_TALK`) | tous construits avant la première réplique, visibles dès le début | construits un par un, visibles à partir de leur réplique |
| bouche d'une commande `GROUP_SHOT_CHARACTER_TALK` | lettre par lettre du texte | du son ; sans voix, immobile |
| durée d'une commande `GROUP_SHOT_CHARACTER_TALK` | fin du texte de lèvres | fin du son ; sans voix 50 images (8 si vide) |
| commande `SHOW_TEXT` après les commandes `GROUP_SHOT_CHARACTER_TALK` | dans la scène, 40 images | commande de premier niveau, après la scène |
| attente au début | aucune | 7 × 10 tics avant la première réplique |

La cadence de l'horloge DGROUP:20751 n'a pas été lue (les 10 tics ne sont pas convertis en secondes).

### 8.7 Pour libRealSpace

- Format déterminé avant le parsing (§ 9.1) ; au format CD, le jeu lit toujours la chaîne de voix,
  vide quand il n'y a pas de voix (§ 8.1) : une voix vide = réplique en texte.
- Avec voix : **pas de texte affiché** ; fin de réplique = fin du son. Sans voix : texte, 5 s
  (0,8 s si le texte est vide).
- Lèvres avec voix : calcul du son de `MIDGAME_SYSTEM.md` § 6.6 à la cadence 10, plus le filtre
  10/11 du gros plan. Sans voix : gros plan comme § 7.4 ; personnage de groupe immobile dans la
  version CD (§ 8.5), lettre par lettre dans la version disquette — choix à faire pour le portage.
- Scène de groupe de la version CD : chaque personnage (`GROUP_SHOT_CHARACTER_TALK`) apparaît à sa première réplique et
  reste (§ 8.6) ; la structure de libRealSpace doit alors donner, pour chaque `ConvFrame`, les
  figures déjà apparues, pas toutes celles de la scène.
- `VOCLIST.IFF` sert au jeu de test de présence des voix (condition 3 du § 8.2) et au
  préchargement ; libRealSpace peut s'en passer pour charger les fichiers, l'équivalent du test
  étant « le fichier de voix existe ».

## 9. Détection voix / texte de libRealSpace : essai sur les données (2026-10-22)

`ConvFrame::SetSentenceFromConv` doit lire les deux formats (§ 2) : le format disquette (un texte)
et le format CD (voix puis texte). Elle décide **à chaque texte** :
1. lire une première chaîne ;
2. si l'octet qui suit vaut 128 ou plus, regarder l'octet d'après (« décalage 2 ») ;
3. si cet octet est une valeur de commande (`isNextFrameIsConv` : 00, 01, 02, 03, 04, 0A, 0B, 0C,
   0F, E0) → pas de voix, la première chaîne est le texte ;
4. sinon, s'il ne vaut ni 255 ni 244 → la première chaîne est la voix, la seconde le texte ; s'il vaut
   255 ou 244 → pas de voix, et la fin est placée 4 octets plus loin. Cette branche a été ajoutée
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
- un texte de 2, 4 ou 10 est toujours suivi d'une commande (pas de voix → juste) ;
- un texte de `CLOSEUP` est suivi de son **octet couleur**, qui n'est pas une commande ; la règle ne tombe
  juste que parce que **toutes** les couleurs des commandes `CLOSEUP` des données valent 128 ou plus (branche
  « décalage 2 », 1 717 fois). Une couleur de commande `CLOSEUP` inférieure à 128 ferait prendre le texte pour une
  voix et décalerait toute la suite.

**Les 29 erreurs du format CD.** Toujours des commandes `CLOSEUP` dont la voix **et** le texte sont vides (`00 00`
puis la couleur) : le 0 qui suit la voix vide est pris pour la commande `GROUP_SHOT`, la voix vide devient le
texte, et la lecture s'arrête un octet trop tôt. La couleur lue vaut alors 0, et l'octet couleur réel
est lu comme une commande inconnue, puis sauté (`do_not_add`) : la lecture se recale par chance.
Effet visible : aucun ici (texte vide), mais c'est un décalage du flux.

**Parties sans effet sur ces données.** La branche 255 / 244 (*Pacific Strike*) ne sert jamais
avec les données de *Strike Commander* (aucun des deux formats ne l'atteint). Retirer 224 de la liste des commandes et la branche 255 / 244 donne
exactement les mêmes résultats pour la détection.

**224.** Ce n'est pas une commande du jeu (aucune entrée 224 dans les tables de commandes, disquette
ou CD). Dans les données, 224 est **une couleur de texte** : la couleur la plus fréquente des commandes `CLOSEUP`
(495 sur 1 717) et celle de 69 des 70 `GROUP_SHOT_CHARACTER_TALK`. Dans libRealSpace, `isNextFrameIsConv` sert à trois
endroits : la détection de voix (sans effet, ci-dessus) et les deux boucles de recherche de
`parse_GROUP_SHOT` et `parse_GROUP_SHOT_ADD_CHARACTER`. Simulées sur les 86 scènes de groupe et
les 184 figurants des deux formats, ces boucles s'arrêtent toujours sur l'octet qui suit
immédiatement, une vraie commande : 224 n'y est jamais atteint. Hypothèse pour ces boucles :
`PeekByte` renvoie l'octet qui suit la position courante, seule lecture pour laquelle le nom du
figurant tombe juste après `MoveForward(2)` (source de `ByteStream` non lue).

**Conclusion (avec Rémi) : 224 est un symptôme, pas une commande.** C'est la trace du décalage de
lecture causé par la détection voix / texte : sur une réplique dont la voix et le texte sont vides,
la lecture s'arrête un octet trop tôt et l'octet couleur qui suit — souvent 224 — est lu comme une
commande. 224 ne doit être traité comme une commande nulle part (à retirer de `isNextFrameIsConv`).
La cause se corrige par le format choisi avant le parsing (§ 9.1).

**Conclusion.** La règle est à la fois trop compliquée (deux branches inutiles) et fragile : elle
dépend de la valeur des couleurs et du contenu des textes, et se trompe déjà sur 29 répliques du CD.
Le format ne change pourtant pas d'un texte à l'autre : c'est **tout le script** qui est au format
disquette ou au format CD.

### 9.1 Choix retenu : tester le format avant de parser

Décision de Rémi : avant de lire une conversation, déterminer si elle est au format CD ou au format
disquette ; ensuite la lecture prend la voix si le format est CD, et ne la prend pas sinon. Plus
aucune devinette texte par texte.

- **Test** : sur le premier texte de la conversation seulement (§ 9.4). `Unknown` si aucun format ne
  convient : erreur, pas de lecture au hasard.
- **Lecture** : chaque texte est lu sans heuristique — une chaîne de voix si `Cd`, puis le texte ; la
  position du champ suivant (la couleur pour 3) est donc toujours exacte. La séparation parseur /
  structure / lecteur est inchangée.
- **Utilisation** : le format n'est pas passé au parseur ; c'est `ConvData::parse()` qui le détecte
  puis lit (§ 9.3) :

```cpp
ConvData *conv = new ConvData(data, size);
if (conv->parse() != 0) {
    printf("erreur");
}
```

- `isNextFrameIsConv` n'est plus utile pour la voix ; ses autres usages dans le parseur
  (`parse_GROUP_SHOT`, `parse_GROUP_SHOT_ADD_CHARACTER`) disparaissent avec la nouvelle architecture
  (§ 9.3). 224 est à retirer de sa liste dans tous les cas.

Premier essai abandonné (pour mémoire) : lire tout le script au format CD, puis au format disquette
si la lecture échoue. Juste sur les 241 scripts des deux formats, mais il lit la conversation deux
fois ; remplacé par le test du § 9.4.

### 9.2 Octet qui n'est pas une commande : erreur de parsing

Choix de Rémi : le parseur de libRealSpace s'arrête **en erreur** quand il lit, à la place d'une
commande, un octet qui n'en est pas une. Une lecture décalée se voit alors tout de suite, au lieu
d'être rattrapée par chance (cas de 224).

- **Commandes valides de premier niveau** : `GROUP_SHOT`, `CLOSEUP`, `YESNOCHOICE_BRANCH2`,
  `SELECT_WING`, `CHOOSE_WINGMAN`, et les deux commandes qui ne font rien, **`NOP_16`** (disquette,
  table `off_5CE29`) et **`NOP_18`** (CD, § 8.6). **`SHOW_TEXT`** est aussi une commande de premier
  niveau dans la version CD (texte seul, 31602) ; aucune n'apparaît à ce niveau dans les données.
  Les sous-commandes (`GROUP_SHOT_ADD_CHARACTER`, `GROUP_SHOT_CHARACTER_TALK`, `SHOW_TEXT` après
  `GROUP_SHOT` ; `CLOSEUP_CONTINUATION`, `SHOW_TEXT`, `YESNOCHOICE_BRANCH1` après `CLOSEUP`) ne sont
  valides qu'à leur place (§ 2).
- **Écart avec le jeu, assumé** : les deux versions du jeu sautent un octet inconnu sans rien dire
  (branche par défaut de la table des commandes). Le choix d'une erreur ne change rien sur les
  données de *Strike Commander* : lus dans le bon format, les 241 scripts n'ont **aucun** octet
  inconnu (§ 4), dans les deux formats.
- **Fin du script** : la lecture doit finir exactement à la fin de l'entrée du PAK ; un champ ou une
  chaîne qui dépasse est aussi une erreur.
- **Sauts `YESNOCHOICE_BRANCH1` / `YESNOCHOICE_BRANCH2`** : la destination doit être le début d'une commande ou la fin du script (vrai
  pour les 52 sauts des données, § 4).

### 9.3 Architecture proposée : une boucle de premier niveau, un sous-parseur par commande

Proposition de Rémi. Aujourd'hui, `SCConvPlayer::parseConv` traite au même niveau les commandes et
les sous-commandes (`GROUP_SHOT_ADD_CHARACTER`, `GROUP_SHOT_CHARACTER_TALK`, `CLOSEUP_CONTINUATION`,
`SHOW_TEXT`, `YESNOCHOICE_BRANCH1`, `YESNOCHOICE_BRANCH2` ont chacune leur `case`), et les `parse_*`
appellent eux-mêmes le parseur suivant ou cherchent la prochaine commande. C'est ce qui oblige aux
recherches (`isNextFrameIsConv`) et rend les erreurs invisibles.

Le jeu est construit autrement, dans les deux versions : l'interpréteur (`Conv_PlayScript_5AA4E`,
et 31391 dans la version CD) n'a qu'une table de commandes de **premier niveau** ; chaque commande
lit ensuite **elle-même** ses sous-commandes, tant qu'elles se suivent (`GROUP_SHOT` → des
`GROUP_SHOT_ADD_CHARACTER`, puis des `GROUP_SHOT_CHARACTER_TALK` / `SHOW_TEXT` ; `CLOSEUP` → des
`CLOSEUP_CONTINUATION` / `SHOW_TEXT` / `YESNOCHOICE_BRANCH1`). La grammaire est donc :

```
script     := commande*
commande   := GROUP_SHOT décor figurant* réplique*
            | CLOSEUP gros_plan suite*
            | SHOW_TEXT couleur texte                          (CD)
            | YESNOCHOICE_BRANCH2 mot
            | SELECT_WING octet octet
            | CHOOSE_WINGMAN | NOP_16 | NOP_18
figurant   := GROUP_SHOT_ADD_CHARACTER nom x y
réplique   := GROUP_SHOT_CHARACTER_TALK nom x y couleur texte
            | SHOW_TEXT couleur texte
gros_plan  := visage image décor x y texte couleur
suite      := CLOSEUP_CONTINUATION texte | SHOW_TEXT couleur texte | YESNOCHOICE_BRANCH1 mot
texte      := [voix] chaîne              ([voix] au format CD seulement, § 9.1)
```

**Parseur de référence** : `tools/conv_ref/conv_parser.cpp` (C++17, style du dépôt, sans
dépendance), classe **`ConvData`** :

```cpp
ConvData *conv = new ConvData(data, size);   // données et taille de l'entrée de CONV.PAK
if (conv->parse() != 0) {                    // 0 = pas d'erreur, sinon un ConvParseError
    printf("erreur");
}
conv->format();         // ConvFormat::Cd ou ConvFormat::Floppy
conv->records();        // les enregistrements, dans l'ordre du script
conv->errorOffset();    // en cas d'erreur : position dans le script
conv->errorMessage();   //                   et raison
```

`parse()` fait, dans l'ordre :
1. le **test du format** sur le premier texte (`detectFormat`, § 9.4) ; `Unknown` → code
   `UnknownFormat`, rien n'est lu ;
2. la **lecture, une seule fois**, dans ce format : une boucle de premier niveau (un `switch` sur la
   commande) appelle un sous-parseur par commande (`parseGroupShot`, `parseCloseUp`,
   `parseNarration`, `parseJump`, `parseWing`) ; chaque sous-parseur lit ses champs et ses
   sous-commandes, et renvoie faux en cas d'erreur ; le texte est lu par `readText` (voix si `Cd`) ;
3. le **contrôle des sauts** `YESNOCHOICE_BRANCH1` / `YESNOCHOICE_BRANCH2` (`checkJumps`).

Codes d'erreur (`ConvParseError`, valeur renvoyée par `parse()`) : 1 `UnknownFormat`, 2
`NotACommand` (octet qui n'est pas une commande), 3 `PastEnd` (champ au-delà de la fin du script),
4 `UnterminatedString` (chaîne sans 0 final), 5 `BadJump` (saut qui ne tombe ni sur une commande ni
sur la fin). Le premier échec arrête tout.

Le résultat est une liste plate d'enregistrements (`ConvRecord`, dans l'ordre du script, `level`
0 ou 1) : c'est la « structure » intermédiaire ; la construction des `ConvFrame` se fait ensuite à
partir d'elle, sans relire les octets. La séparation parseur / structure / lecteur est conservée
et même renforcée : plus aucun `parse_*` ne déplace le curseur pour un autre.

**Essai** (`tools/conv_ref/export_scripts.py` puis `conv_parser`) :

| Données | Format trouvé | Lecture |
|---|---|---|
| 241 scripts CD | `Cd` pour les 241 | 0 erreur, 2 772 enregistrements |
| 241 scripts disquette reconstruits (voix retirées, sauts recalculés) | `Floppy` pour les 241 | 0 erreur, 2 772 enregistrements |

Un script invalide donne le code `UnknownFormat`.

2 772 enregistrements = la somme des comptes par commande du § 4, les mêmes que `conv_dump.py`.

**Pacific Strike** : un troisième `ConvFormat` se branche à trois endroits seulement : son test dans
`detectFormat`, `readText` (lecture d'un texte) et, si besoin, ses commandes propres dans la boucle
de premier niveau.

### 9.4 Test du format : regarder le premier texte (`ConvData::detectFormat`)

Demande de Rémi : tester chaque conversation **avant** de la lire, pour choisir le lecteur CD ou le
lecteur disquette, sans la lire en entier. Le test (`ConvData::detectFormat`, `tools/conv_ref/conv_parser.cpp`)
ne regarde que le **premier texte** du script.

1. **Aller au premier texte** en sautant les champs de taille fixe : `CLOSEUP` → 23 octets ;
   `GROUP_SHOT` → décor (9), chaque `GROUP_SHOT_ADD_CHARACTER` (14), puis
   `GROUP_SHOT_CHARACTER_TALK` (15 octets jusqu'au texte) ou `SHOW_TEXT` (couleur) ; `SHOW_TEXT` →
   couleur ; `YESNOCHOICE_BRANCH2`, `SELECT_WING` → 2 octets ; `CHOOSE_WINGMAN`, `NOP_16`, `NOP_18`
   → rien. Aucune chaîne à lire avant ce premier texte, donc
   rien qui dépende du format.
2. **Hypothèse CD** : la première chaîne a la forme d'un identifiant de voix — **vide, ou 1 à 8
   lettres ou chiffres** — et, après la deuxième chaîne (le texte), on trouve ce qui doit suivre un
   texte.
3. **Hypothèse disquette** : après la première chaîne (le texte), on trouve ce qui doit suivre un
   texte.
4. « Ce qui doit suivre un texte » : pour 3, l'octet couleur puis une commande de premier niveau,
   4 ou 11 ; pour 2, une commande de premier niveau ou 2 ; pour 10, une commande de premier
   niveau, 2, 4 ou 11 ; ou la fin du script.
5. Une seule hypothèse vraie → ce format ; les deux ou aucune → `Unknown`.

**Pourquoi les deux critères.** Constaté sur les données :
- les identifiants de voix ont 7 caractères au plus, uniquement des lettres et des chiffres
  (`3gw009`, `Z1ai020`, `4VI170`, `2ai300a`…), et **aucun** des 2 394 textes n'a cette forme ;
- la vérification des octets seule ne suffit pas : sur 187 des 241 scripts disquette, la lecture
  « CD » retombe par hasard sur une commande valide (la « deuxième chaîne » part de l'octet
  couleur) ; c'est la forme de la première chaîne qui tranche ;
- la forme seule ne suffit pas non plus : le premier texte de 11 scripts CD a une voix **vide**, et
  un script CD (le seul) n'a que des voix vides ; pour eux, c'est la vérification des octets qui
  tranche (après la voix vide vient un texte, puis la couleur et une commande) ;
- chercher des « voix » n'importe où dans les octets bruts (un 0, 1 à 8 lettres ou chiffres, un 0,
  un caractère imprimable) se trompe : 25 scripts disquette en contiennent par hasard, et le script
  CD sans voix n'en contient pas.

**Essai** : 241 / 241 scripts CD → `Cd`, 241 / 241 scripts disquette (reconstruits) → `Floppy`, puis
lecture sans erreur. Le test lit au plus les deux premières chaînes du script et quelques octets.

**Limite** : un script disquette dont le **premier** texte serait un seul mot sans ponctuation, de 8
lettres ou chiffres au plus, et dont les octets suivants formeraient aussi une suite CD valide,
donnerait `Unknown` ou `Cd`. Aucun texte de ce genre dans les données.

