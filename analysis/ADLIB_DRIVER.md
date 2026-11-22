# Strike Commander — Pilote AIL AdLib (`ADLIB.ADV`)

Document de référence autonome sur le pilote son AdLib de la bibliothèque
AIL (Audio Interface Library, Miles Design, Inc., copyright 1991-1992),
utilisé par `Sound_LoadDriverAndTimbreCache_5A0F3` (voir `MUSIC_SYSTEM.md`
§3). Rédigé à partir du désassemblage fourni par Rémi (`adlib.asm`,
`adlib.map`) et du binaire réel (`ADLIB.ADV`, 16926 octets / 0x421E).

**Objectif** : fournir les éléments nécessaires à une réimplémentation
fidèle (SDL + émulateur OPL3, en mode compatibilité OPL2) du rendu audio
du jeu.

**Statut des affirmations** : *confirmé* (lu ligne à ligne et/ou vérifié
sur les octets réels du binaire) ou *hypothèse* (déduit du contexte, non
vérifié).

---

## 1. Vue d'ensemble

- Puce cible : **OPL2 simple puce** (pas OPL3) — un seul couple de ports
  d'E/S (adresse + donnée), aucune trace d'un second couple de ports
  (`0x38A`/`0x38B`) qui indiquerait une puce stéréo/OPL3.
- **9 canaux FM mélodiques** (configuration standard OPL2, pas de mode
  percussion rythmique activé par défaut — voir §5).
- Port de base **configurable** (passé en paramètre à l'initialisation,
  valeur usuelle 0x388/0x389 mais pas câblée en dur dans le pilote).
- Fréquence/octave calculées via **trois tables précalculées** intégrées
  au binaire (pas de calcul trigonométrique à l'exécution) — voir §4.
- Application des paramètres d'instrument pilotée par un **masque de
  bits "sale"** par canal (ne réécrit que les registres qui ont changé
  depuis le dernier tick) — voir §5.
- Moteur de rampes d'enveloppe logicielles par voix (8 paramètres
  interpolés en parallèle, indépendant du matériel OPL) — voir §8/§9.

---

## 2. Primitive bas niveau — `WriteOPL(registre, valeur)` (`sub_1A4B`)

*Confirmé, lu intégralement.*

```
WriteOPL(reg: byte, val: byte):
    out [word_F9C], reg      ; port adresse
    attendre 6 lectures de [word_F9C]   ; délai ~3.3µs (temps d'établissement adresse)
    out [word_F9A], val       ; port donnée
    attendre 42 (0x2A) lectures de [word_F9C]  ; délai ~23µs (temps d'écriture donnée)
```

`word_F9C` = port adresse, `word_F9A` = port donnée = port adresse + 1
(initialisés par `sub_199D(base_port)` : `word_F9C = base_port`,
`word_F9A = base_port + 1`). Conforme au protocole d'écriture OPL standard
(délais d'établissement documentés dans la référence AdLib/Yamaha YM3812).

Deux wrappers existent au-dessus de cette primitive, ajoutant un décalage
de registre selon une table par canal :
- `sub_19B4`/`sub_19D0` : ajoute un offset **par opérateur** (table à
  `0xF0A`/`0xF52` du binaire, voir §3) avant d'appeler `WriteOPL` —
  utilisé pour les registres à deux instances par canal (0x20, 0x40,
  0x60, 0x80, 0xE0).
- Un second variant ajoute un offset **par canal** (sans distinction
  d'opérateur) pour les registres 0xA0/0xB0/0xC0.

## 3. Tables d'offsets par canal/opérateur

*Confirmé, extrait directement du binaire.*

**Table d'offset opérateur** (`0xF0A`, utilisée pour 0x20/0x40/0x60/0x80/0xE0) :

```
00 01 02 03 04 05  08 09 0A 0B 0C 0D  10 11 12 13 ...
```

C'est la **table d'offsets opérateur AdLib standard** — les sauts de 6→8
et 14→16 reflètent l'agencement des registres OPL (3 groupes de 6
opérateurs consécutifs, canaux 0-2 puis 3-5 puis 6-8). Confirme les
**9 canaux FM standard**, aucune extension.

**Table d'offset canal** (`0xF52`, utilisée pour 0xA0/0xB0/0xC0) :

```
00 01 02 03 04 05 06 07 08  00 01 02 03 04 05 06 ...
```

Cycle 0-8 en continu — cohérent avec un pool de voix logiques
(potentiellement plus de 9) mappées vers les 9 canaux physiques.

**Table jumelle** (`0xF64`) : `00×9, 01×7...` — rôle non déterminé
(hypothèse : indicateur de groupe/banque, sans effet visible sur une
puce OPL2 simple ; possible reliquat de code partagé avec une variante
OPL3).

## 4. Conversion note → fréquence (registres 0xA0/0xB0)

*Confirmé — fonction lue intégralement (`sub_20B2`, portion « SetFrequency »), tables extraites du binaire réel.*

Trois tables consultées en séquence pour une note donnée :

| Table | Adresse | Format | Contenu |
|---|---|---|---|
| Demi-ton | `0xC8C` | octets | `0,1,2,...,11` en boucle — demi-ton dans l'octave (`note % 12`) |
| Octave/bloc | `0xC2C` | octets | `0×12, 1×12, 2×12, ...` — numéro d'octave (`note / 12`) |
| F-Number | `0xAAC`, 192×16 bits | mots 16 bits LE, 192 entrées (384 octets) | valeurs F-Number précalculées, **32 entrées par bloc d'octave** (pas 12 — résolution fine pour pitch-bend) |

Premières valeurs de la table F-Number : `690, 692, 695, 697, 700, 702,
705, 707, 710, 713, 715, 718, 720, 723, 726, 728, 731, 733, 736, 739,
741, 744, 747, 749, 752, 755, 758, 760, 763, 766, 769, 771, ...` —
progression régulière cohérente avec la formule standard AdLib :

```
F-Number = round(freq_Hz × 2^(20 - bloc) / 49716)
```

Algorithme de calcul (`sub_20B2`, extrait) :

```
di = (note >> 4) normalisé dans [0, 0x5FF] par ajustements successifs de ±0xC0
octave_idx = di >> 4
bloc = table_octave[octave_idx]           ; @0xC2C
index_fnum = bloc × 32 + ((note << 1) & 0x1F)
fnum = table_fnum[index_fnum]              ; @0xAAC, 16 bits

; Écriture registres :
reg[0xA0 + canal] = fnum & 0xFF                          ; F-Number bas
reg[0xB0 + canal] = (key_on << 5) | (bloc << 2) | (fnum >> 8 & 3)  ; key-on, bloc, F-Number haut
```

**Non confirmé** : le détail exact de la normalisation initiale de `note`
(cascade d'ajouts/soustractions de 0xC0) — semble gérer un encodage de
note sur une plage plus large que 0-127 (peut-être une représentation
signée permettant pitch-bend au-delà d'une octave), non entièrement
retracé.

## 5. Application d'instrument — masque de bits "sale" (`sub_20B2`, dispatch)

*Confirmé, lu intégralement.*

Un octet par canal (`cs:[si+0x1764]`, `si` = état du canal) sert de
**masque de bits "à mettre à jour"**. À chaque appel, la fonction teste
les bits un par un, écrit le(s) registre(s) correspondant(s) pour les
DEUX opérateurs (modulateur puis porteur) du canal, puis efface le bit
traité — évite de réécrire tous les registres à chaque tick.

| Bit testé | Registre(s) OPL | Contenu écrit |
|---|---|---|
| `0x80` | `0x20` (AM/VIB/EGT/KSR/Multi) | bit percussion (table `@0x1884`, indexée par `[si+0x1704]&0xF`) `\|` pitch haut `\|` donnée instrument |
| `0x40` | `0x40` (KSL/Total Level) | **mise à l'échelle vélocité** : `niveau × vélocité / 127` (via `mul`/`div 0x7F`), inversé, combiné aux bits KSL de l'instrument |
| `0x20` | `0x60` puis `0x80` (Attack/Decay, Sustain/Release) | directement depuis l'instrument |
| `0x10` | `0xE0` (forme d'onde, spécifique OPL2/YMF262 mode legacy) | directement depuis l'instrument |
| `0x08` | `0xC0` (Feedback/Connection) | algorithme/feedback de l'instrument `\|` bit de pitch |
| `0x01` (voir §4) | `0xA0`/`0xB0` (fréquence/octave/key-on) | calculé via les tables de §4 |

## 6. Structure d'instrument déduite

> **Confirmé et complété au §11** : le format réel suit l'ordre BNK des pilotes AIL (le tableau ci-dessous regroupe les champs par registre, pas dans l'ordre du fichier).

*Hypothèse forte — déduite des variables locales consommées par le
dispatch de §5 ; format cohérent avec le format **OP2** standard utilisé
par plusieurs pilotes AIL de cette génération (non comparé octet à octet
avec une bibliothèque d'instruments `.bnk`/OP2 externe cette session).*

```c
struct AdLibInstrument {
    uint8_t mod_char;             // reg 0x20 modulateur : AM|VIB|EGT|KSR|Multi
    uint8_t car_char;             // reg 0x20 porteur
    uint8_t mod_scale;            // reg 0x40 modulateur : KSL(2b) | TotalLevel(6b)
    uint8_t car_scale;            // reg 0x40 porteur
    uint8_t mod_attack_decay;     // reg 0x60 modulateur
    uint8_t car_attack_decay;     // reg 0x60 porteur
    uint8_t mod_sustain_release;  // reg 0x80 modulateur
    uint8_t car_sustain_release;  // reg 0x80 porteur
    uint8_t mod_waveform;         // reg 0xE0 modulateur
    uint8_t car_waveform;         // reg 0xE0 porteur
    uint8_t feedback_conn;        // reg 0xC0 : feedback(3b) | connection(1b)
};
```

## 7. Détection de carte (`sub_1A73`)

*Confirmé — algorithme AdLib textbook standard.*

```
WriteOPL(0x04, 0x60)          ; reset timer 1 et 2
WriteOPL(0x04, 0x80)
status_avant = ReadStatus() & 0xE0
WriteOPL(0x02, 0xFF)           ; charge le compteur timer 1
WriteOPL(0x04, 0x21)            ; démasque et démarre timer 1
attendre ~200 lectures de status (délai)
status_apres = ReadStatus() & 0xE0
WriteOPL(0x04, 0x60)              ; reset
WriteOPL(0x04, 0x80)
carte_présente = (status_avant == 0) ET (status_apres == 0xC0)
```

Confirme bit à bit l'algorithme publié dans l'AdLib Programmer's
Reference Guide — le pilote est fidèle à la référence officielle, pas
d'implémentation maison.

---

## 8. Moteur de rampes d'enveloppe par voix — `sub_618` (service périodique)

*Confirmé, lu intégralement.* C'est le point d'entrée périodique du
pilote (appelé par le hook installé via `word_2BE2`/`word_2BE4`/
`word_2BE6`, probablement câblé sur le timer/tick du jeu, cf.
`MUSIC_SYSTEM.md` §4 pour le séquenceur côté jeu).

Itère sur **16 emplacements de voix** (`si` = 0 à 15), ignore les
inactifs (`cs:[si+0x16D4]`/`cs:[si+0x16E4]` == 0), puis pour chaque voix
active fait progresser **8 rampes de paramètre en parallèle**, une par
groupe de registre déjà identifié en §5 :

| Rampe (offset base) | Bit "sale" posé | Registre visé |
|---|---|---|
| `+0x121/+0x141/+0x161` | `0x01` | `0xA0`/`0xB0` (pitch) |
| `+0x321/+0x341/+0x361` | `0x08` | `0xC0` (feedback/connexion) |
| `+0x3A1/+0x3C1/+0x3E1` | `0x80` | `0x20` opérateur A (AM/VIB/EGT/KSR/Multi) |
| `+0x421/+0x441/+0x461` | `0x80` | `0x20` opérateur B |
| `+0x1A1/+0x1C1/+0x1E1` | `0x40` | `0x40` opérateur A (volume, avec clamp anti-dépassement) |
| `+0x221/+0x241/+0x261` | `0x40` | `0x40` opérateur B (idem) |
| `+0x4A1/+0x4C1/+0x4E1` | `0x10` | `0xE0` (forme d'onde / modulation) |
| `+0x2A1/+0x2C1/+0x2E1` | — | (dernier groupe, dirty bit géré différemment) |

Chaque rampe : `valeur += pas` (accumulation), `compteur--` ; quand
`compteur==0`, appelle **`sub_552(voix, type)`** pour charger le
**prochain segment de rampe**, avec un code type par groupe (`0x101`,
`0x301`, `0x181`, `0x201`, `0x381`, `0x401`, `0x481`, `0x281`).

Une fois toutes les rampes traitées pour la voix : si au moins un bit
sale est posé (`test [si+0x1764], 0xF9`), appelle **`sub_20B2`** (§5)
pour écrire réellement les registres OPL modifiés.

Gère aussi une **machine à états de phase** par voix
(`cs:[si+0x16D4]`) : phase 0/1 = lecture normale ; quand un compteur
dédié (`cs:[di+0x16B4]`) atteint zéro, passe en phase 2 et appelle
`sub_89F` (probable déclenchement de la phase de relâchement/release) ;
si en phase 2 et que les deux niveaux de volume (opérateurs A et B) sont
tombés sous `0x400`, la voix est considérée éteinte : appelle
`sub_2047` (libération) puis `sub_501`, remet la phase à 0.

## 9. Lecteur de courbe d'enveloppe — `sub_552`

*Confirmé, lu intégralement.* Reçoit `(voix, type_paramètre)`. Ce n'est
**pas un parseur XMIDI** — c'est un **micro-interpréteur de courbe
d'enveloppe** propre à chaque (voix, paramètre), lisant des paires
`(pas: word, durée: word)` consécutives dans un flux de données dont la
base est `cs:[bx+0x1674]`/segment `cs:[bx+0x1694]` (probablement pointé
vers les données d'enveloppe de l'instrument au déclenchement de la
note) et dont la position courante est suivie par `cs:[bx+type_paramètre]` (curseur par paramètre).

```
lire (pas, durée) au curseur courant
si pas == 0 :                     ; marqueur "silence/attente"
    curseur += durée ; relire l'entrée suivante
sinon :
    curseur += 4
    si pas == 0xFFFF :             ; marqueur BOUCLE/SUSTAIN
        niveau_maintien = durée ; relire l'entrée suivante
    sinon si pas == 0xFFFE :         ; marqueur FIN DE COURBE
        selon type_paramètre :
            0x101 (pitch) → si voix en mode 1 (legato ?) : efface le bit
                             key-on du registre 0xB0 mis en cache — **NOTE OFF**
            0x181/0x201/0x301/0x381/0x401 → stocke un octet d'état par
                             paramètre (rôle exact non déterminé)
    sinon :                          ; segment normal
        pas_courant = pas ; durée_courante = durée ; RETOUR (la rampe reprend)
```

> ⚠️ **Corrigé le 2026-10-06 : le paragraphe suivant est faux.** Le pilote contient bien
> l'interpréteur XMIDI (shell `XMIDI.ASM` d'AIL 2.0, `analysis/ail_sources/XMIDI.ASM`) : recherche
> de séquence `cmp word ptr [si], 4F46h` / `cmp word ptr [si+8], 4D58h` (adlib.asm l. 8564), en-tête
> `EVNT` présent dans `ADLIB.ADV`, service périodique à 120 Hz. `sub_552` / `sub_618` sont la
> partie « voix OPL » (équivalent de `YAMAHA.INC`, absent des sources), appelée par cet
> interpréteur. Voir `MUSIC_SYSTEM.md` §1.

**Implication architecturale majeure** : le vrai parseur XMIDI (temps
delta, octets de statut MIDI, meta-événements, tempo) **n'est pas dans
ce pilote**. Son rôle se limite à : recevoir un déclenchement de note
(via une fonction d'entrée non encore localisée, type `PlayNote`),
pointer les 8 flux de courbes d'enveloppe de la voix vers les données de
l'instrument, puis jouer ces courbes de façon autonome tick après tick.

**Mise à jour (2026-10-06)** : `Music_InstallXMITimbres_UNRESOLVED` (côté jeu) ne fait que
précharger les timbres d'un fichier XMI ; les événements `EVNT` sont lus par l'interpréteur XMIDI de
ce pilote, qui appelle ensuite la partie voix OPL décrite ici. Voir `MUSIC_SYSTEM.md` §1 et §3.

---

## 10. Ce qui reste à tracer

- Repérer dans `adlib.asm` la frontière entre le shell `XMIDI.ASM` (comparable au source public) et
  la partie voix OPL propre à cette version (équivalent de `YAMAHA.INC`, absent des sources), pour ne
  documenter que cette dernière.
- Table `@0xF2E` (offset canal, variante liée à `0xF0A`) — trouvée à
  zéro sur les 16 premiers octets testés ; rôle exact et contenu complet
  non vérifiés.
- Rôle de la table `@0xF64` (jumelle de `0xF52`) — aucun effet identifié
  sur puce OPL2 simple.
- Normalisation initiale de la valeur `note` dans `sub_20B2` (cascade
  d'ajustements ±0xC0) — plage de valeurs et lien avec le pitch-bend non
  confirmés.
- Comparaison octet à octet de la structure d'instrument (§6) avec le
  format **OP2** public, pour confirmer l'ordre exact des champs et
  écarter une variante propriétaire AIL.
- Format exact des données d'enveloppe consommées par `sub_552` (§9) —
  d'où viennent-elles (bloc dans le fichier `.bnk`/instrument, ou dans
  `combat.dat`/`combat.adl` eux-mêmes ?), et rôle précis des octets
  d'état stockés sur marqueur de fin (`0x181`/`0x201`/`0x301`/`0x381`/
  `0x401`).
- Rôle de `sub_89F` (transition de phase, probable déclenchement du
  relâchement) et `sub_2047`/`sub_501` (libération de voix) — non lus
  cette session.
- Table `@0x1884` (bits percussion, indexée par `[si+0x1704]&0xF`) —
  contenu non extrait.
- ~~Lien avec les entrées de `combat.dat`~~ : réglé, ce sont des numéros de pistes de liaison
  indexés par la position dans la phrase, pas des courbes d'enveloppe (`MUSIC_SYSTEM.md` §2.3).

---

## 11. Partie voix lue intégralement (2026-10-07) — portée dans `tools/sc_player/librealspace/AILAdlibDriver.cpp`

Toute la partie « voix OPL » (`sub_501` à `sub_28BE`) a été lue et portée. C'est le **système TVFX
d'AIL 2.0** (équivalent de `YAMAHA.INC`). Les §6, §8 et §9 ci-dessus sont confirmés et complétés
comme suit.

**Table des fonctions du pilote** (en-tête du binaire : paires numéro AIL / offset). Les plus utiles :
`0x9C` install_timbre = `0x1E6C`, `0x9B` timbre_request = `0x1CC7`, `0xBA` send_cv_msg = `0x2A79`,
`0x67` serve = `0x35B1`, `0xB4` get_bar_count = `0x3D81`. Le descripteur suit la table : type 3
(XMIDI), suffixe `"AD"`, port 0x388, **service à 120 Hz** (`78 00`).

**Messages MIDI** (`sub_28BE`) :
- **Note On** : acceptée seulement sur les canaux MIDI 1 à 9 (0-based, `cmp di,1 / jb`,
  `cmp di,9 / ja`), donc les canaux 2 à 10. Le canal 9 (MIDI 10) est le canal des percussions :
  le timbre est cherché en banque `0x7F`, patch = numéro de note, et la note jouée est celle du
  timbre (octet +2).
- **Contrôleurs** :
  - 1 modulation (≥ 64 → bit vibrato), 7 volume, 11 expression, 10 panoramique (sans effet) ;
  - 64 sustain ; 114 banque ; 112 protection de voix ; 113 protection de timbre ;
  - 121 remise à zéro ; 123 toutes notes coupées.
- **Pitch-bend : ±12 demi-tons.** Calcul : `((MSB<<7|LSB) − 0x2000) >> 5`, puis `mov cl,0Ch / imul cx`.

**Volume d'un opérateur** (registre 0x40) : niveau = valeur du paramètre >> 10 (0..63).
- Mise à l'échelle par `vol·expr/128`, puis `·vélocité/128`, chacun arrondi à +1 s'il n'est pas nul.
- La vélocité passe par la table `0xED6` : `vel>>3` → 82..127.
- L'échelle ne s'applique qu'aux opérateurs dont le bit est posé dans le masque `0x1824`.
  **Seul le timbre OPL simple pose ce masque** (porteur toujours, modulateur si connexion additive).
  Les timbres TVFX ne sont donc pas affectés par le volume.

**Fréquence** :
1. Partir de note + transposition − 24, ramenée dans 0..95.
2. Ajouter le pitch-bend, en 1/256 de demi-ton (`add ah, bl`), puis `(x+8)>>4` (1/16 de demi-ton),
   ramené dans 0..0x5FF.
3. F-Number = table `0xAAC` [demi-ton·16 + pas] ; bloc = table `0xC2C`[n] − 1.
4. Une entrée négative de la table vaut « bloc + 1 ».

**Timbre OPL simple** (longueur 0x0E, `sub_2617`). Après la longueur (u16) :

| Octet | Contenu |
|---|---|
| +2 | transposition |
| +3 / +9 | AVEKM mod / porteur |
| +4 / +0A | KSL·TL mod / porteur |
| +5 / +0B | AD |
| +6 / +0C | SR |
| +7 / +0D | forme d'onde |
| +8 | FB·C |

C'est le format BNK habituel des pilotes AIL. Priorité de la voix : 0x7FFF.

**Timbre TVFX** (toute autre longueur sauf 0x19, que le pilote ignore ; `sub_89F`).

| Octet | Contenu |
|---|---|
| +3 | type : 1 = hauteur donnée par la note, 2 = fréquence absolue |
| +4 | durée en ticks à 60 Hz (+1) ; 0xFFFF pour le type 1, relâché par le Note Off |
| +6 … +34 | pour chacun des 8 paramètres : valeur initiale, offset de la courbe d'attaque, offset de la courbe de relâchement |
| +36 / +3A | AD·SR de l'attaque / du relâchement, si la courbe de fréquence ne commence pas à +0x36 |

- Ordre des 8 paramètres : fréquence, niveau mod, niveau porteur, priorité, feedback,
  multiplicateur mod, multiplicateur porteur, forme d'onde.
- Une courbe est une suite de paires (u16, u16) :
  - `(0, d)` : saut relatif ;
  - `(0xFFFF, v)` : valeur absolue ;
  - `(0xFFFE, o)` : octet d'état (KSL, AVEKM, bits de key-on ou de connexion, selon le paramètre) ;
  - `(n, pas)` : n ticks à `valeur += pas`.
- Une voix en relâchement est libérée quand ses deux niveaux passent sous 0x400.

**Allocation** :
- 16 voix logiques pour 9 canaux OPL.
- Un nouveau canal est pris en tourniquet (`sub_1FEB`).
- À 5 Hz, `sub_2514` donne les canaux aux voix de plus haute priorité. Priorité = paramètre de
  priorité, ou 0xFFFF si la protection de voix est active, moins le nombre de voix du canal MIDI.

**Interpréteur XMIDI compilé dans le pilote : écarts avec `XMIDI.ASM` 1.08** (importants pour les
transitions, qui lisent le compteur de mesures) :
- Au rembobinage (`sub_2DFA`), le **compteur de mesures part de 0** (et non de −1). La fraction de
  temps vaut `QUANT_TIME_16`, pour un 4/4 par défaut.
- La signature rythmique (`sub_3418`) ne remet pas le temps à zéro et n'incrémente pas la mesure.
- `get_bar_count` renvoie le compteur brut, sans anticipation.
- Le service avance le temps *avant* les évènements de l'intervalle.

**Cache de timbres** :
- 192 entrées (banque `0x1422`, patch `0x14E2`, drapeaux `0x15A2` : 0x80 = utilisé,
  0x40 = protégé), avec une éviction de l'entrée la plus ancienne (`sub_1D21`).
- Les registres initiaux (`0xCEB`, registres 1..0xF5) activent la sélection de forme d'onde
  (registre 1 = 0x20) et fixent 0xBD = 0xC0.
