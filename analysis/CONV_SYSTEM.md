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
| 01h (répété) | nom de figure (9), x (mot), y (mot) | figurant posé dans le décor (`FORM FIGR`) ; le dernier caractère du nom est passé à la construction du calque (`sub_AB6B`, pas lue) |
| 02h (répété) | nom de figure (9), x, y, octet couleur, `[voix]`, chaîne | personnage qui parle, calque `sub_A207` (pas lu), lèvres synchronisées sur le texte |
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

## 6. Points ouverts

- Les 37 autres commandes du script de partie (`Gameflow_RunScriptPairs_36CF`) et le chunk de
  `GAMEFLOW.IFF` qui les contient.
- Ce qui pose les drapeaux dseg 0EE6h (choix de `$A`, `$B`).
- Version du code qui lit `[voix]` : pas dans cet OPTEST.EXE.
