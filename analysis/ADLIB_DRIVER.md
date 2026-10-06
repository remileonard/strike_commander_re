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
`MUSIC_SYSTEM.md` §8 pour le mécanisme d'enregistrement côté jeu).

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
> interpréteur. Voir `MUSIC_SYSTEM.md` §0.

**Implication architecturale majeure** : le vrai parseur XMIDI (temps
delta, octets de statut MIDI, meta-événements, tempo) **n'est pas dans
ce pilote**. Son rôle se limite à : recevoir un déclenchement de note
(via une fonction d'entrée non encore localisée, type `PlayNote`),
pointer les 8 flux de courbes d'enveloppe de la voix vers les données de
l'instrument, puis jouer ces courbes de façon autonome tick après tick.

**Mise à jour (Découverte 20 du README, `MUSIC_SYSTEM.md`)** : un vrai
parseur XMI au format IFF standard (`XDIR`/`INFO`/`XMID`/`TIMB`) a été
localisé côté `STRIKE.EXE` (seg124, fonction anonyme
`Music_InstallXMITimbres_UNRESOLVED`, appelée par
`Music_ChannelRegisterSequence_59FF5`) — confirmant que le séquenceur XMIDI vit
bien côté jeu. Cette fonction lit l'en-tête et la liste des timbres, mais
ne lit PAS le chunk `EVNT` — le lien exact entre ce parseur, le format
`combat.dat`/`combat.adl` (`MUSIC_SYSTEM.md` §7), et ce lecteur de courbe
reste à établir : hypothèse prioritaire, les événements `EVNT` (ou leur
équivalent) sont traduits en paires pas/durée au format `sub_552` quelque
part entre les deux.

---

## 10. Ce qui reste à tracer

- **Priorité** : établir le lien concret entre `Music_InstallXMITimbres_UNRESOLVED`
  (parseur d'en-tête XDIR/INFO/XMID/TIMB, côté jeu) et ce lecteur de
  courbe d'enveloppe (`sub_552`, côté pilote) — qui traduit les
  événements réels (notes, durées) de l'un vers l'autre ? Chercher un
  chunk `EVNT` non encore trouvé, ou une conversion effectuée ailleurs
  dans le cluster `Sequencer_*`.
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
- Lien concret entre ce pilote et le format `TrackDescriptor`/
  `TransitionDescriptor` de `combat.dat`/`combat.adl` documenté dans
  `MUSIC_SYSTEM.md` (§7.3, §7.5) : hypothèse à tester en premier — que
  les séquences préfixées par `0x01` dans les entrées de transition
  décodées SONT directement des données de courbe d'enveloppe au format
  `sub_552` (paires pas/durée) plutôt que des événements MIDI classiques.
