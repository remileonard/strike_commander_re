# Système de caméra — Strike Commander

Document de référence pour l'implémentation du système de caméra dans
libRealSpace. Consolide : le format d'instruction `COMP`, le parsing des
caméras depuis le chunk `WRLD/FORM CAMR`, et le mécanisme des caméras de
suivi (chase / vue externe).

Toutes les affirmations sont sourcées sur le désassembleur (`strike.asm`).
Sources détaillées : `DATA_MODEL.md` §6.6b / §6.6b-bis / §6.6b-ter,
`known_functions.json`. Fichiers de données décodés :
`MISSIONS\MAURITAN.IFF`, `data/MISSION.IFF`,
`F-16DES.REAL.OBJT.JETP.SMOK.DAT`, `F16-CKPT.CKPT.INFO.DAT` (§3bis).

**Sommaire** : §2 parsing `WRLD/FORM CAMR` · §3 objet entrée + vtables ·
§3bis table de vues cockpit · §4 chemin F2 (état) · §4bis **caméra orbitale
`loc_1493A` — modèle CHASE/ROTA/TARGET** · §5 script `COMP` (opcodes,
interpréteur, `STARTCAM`) · §6 conventions de portage · §7 activation ·
§8 fonctions/globales · §9 état & questions ouvertes.

---

## 1. Vue d'ensemble

Le jeu n'a pas d'« objet caméra » unique : il a un **registre de vues**
(la liste kneeboard `0x59CD`) qui contient des **entrées de caméra**
typées, chacune sachant se calculer elle-même. Une seule entrée est
**active** à la fois.

```
                       ┌─────────────────────────────────────────────┐
   WRLD / FORM CAMR ───►│ Cinematic_LoadCameraDef (sub_23E7D, seg041) │
   (chargé 1×/monde)    │  → 1 entrée de registre par sous-chunk       │
                       └───────────────┬─────────────────────────────┘
                                       │  liste 0x59CD (LinkedListB)
                                       ▼
   activation ────►  Kneeboard_ApplySelection (sub_23CCC)
   (F1..F7, TAKEOFF,   manager[+0x12] = entrée active  ==  word_72A8F
    AUTOPILT, script    manager[+0x11] = code d'état de la vue
    mission, END COMP)  entrée->vtable[+0x50][0x10]()   (start)
                                       │
                                       ▼  par frame (boucle de rendu)
   View_RenderFrame_2DF0D (loc_2DF0D, seg065) sur word_72A8F :
     ├─ word_72A8F->vtable[+0x50][0x20]()
     ├─ word_72A8F->vtable[+0x50][0x14]()   ← CALCULE la position/orientation, selon le type :
     │      CKPT / cockpit         → loc_1519E          (seg015 ; œil pilote, §3bis/§4.2)
     │      ROTA (et prob. CHASE/TARGET) → Camera_OrbitTrackCompute_1493A (seg014, §4bis)
     │      COMP (STARTCAM/…)      → AI_ManeuverSolutionMain_781D0        (ovr232, §5)
     └─ word_72A8F[+0x5C]->vtable[0x04]()   ← rendu via le rect viewport du chunk
```

> Le slot exact (`[0x14]` vs autre) de la vtable `+0x50` n'est pas résolu de
> façon fiable (fixups VROOMM) ; ce qui est sûr, c'est **quelle fonction**
> calcule quel type de vue.

**`word_72A8F`** = pointeur vers l'entrée active. Lu partout où le rendu /
le HUD a besoin de la position caméra (seg011 `Player_MainUpdate`, seg088
`HUD_RenderSymbologyMain`, seg079, seg107…). Position monde de la caméra =
`word_72A8F[+0x14/+0x18/+0x1C]` (i32, **fixed-point 24.8**, `/256` = pieds ;
la 3ᵉ composante `+0x1C` = altitude côté ASM).

> **Preuve du 24.8** : partout, `delta = entité[+0x12/+0x16/+0x1A] −
> caméra[+0x14/+0x18/+0x1C]` puis `Math_VectorLength3D_Raw_5828E` puis
> `sar eax, 8`. Les entités portent leur position en `+0x12`, l'entrée
> caméra a **2 octets de plus** avant (`+0x14`).

---

## 2. Chargement depuis `WRLD` — `FORM CAMR`

### 2.1 Chaîne d'appel

```
MissionLoader_LoadEntitiesMain_A767F           (parseur du FORM WRLD, seg455)
  └─ MissionLoader_LoadChunkA_A7C8E
       └─ Cinematic_LoadCameraDef (sub_23E7D, seg041, 338 L)
            args : (listeManager = 0x59CD, resourceRecord)
            ResourceRecord_SeekAndReadB('CAMR' = 0x524D4143) ; absent → return
```

Chargé **une seule fois par monde** (garde `byte_70446`). Le `FORM CAMR`
fait 882 o dans `MAURITAN.IFF` (offset fichier `0x18E`).

### 2.2 Sous-chunks reconnus (`record[+0x6D]`, dword LE) → code de type `var_4`

| FourCC | dword LE     | code | rôle                                            |
|--------|--------------|------|-------------------------------------------------|
| `STRT` | `0x54525453` | —    | string : **nom du jeu de caméras**, stocké `liste+6` |
| `CAMR` | `0x524D4143` | `0`  | (marqueur conteneur)                            |
| `ATCH` | `0x48435441` | `1`  | caméra attachée (voir §2.5)                     |
| `CHAS` | `0x53414843` | `3`  | **chase / poursuite** (F2)                      |
| `CKPT` | `0x54504B43` | `4`  | cockpit / première personne (F1)                |
| `CONT` | `0x544E4F43` | `6`  | (continue / libre)                             |
| `VICT` | `0x54434956` | `7`  | vue « victime » (avion touché)                  |
| `ROTA` | `0x41544F52` | `8`  | caméra rotative (orbite)                        |
| `TARG` | `0x47524154` | `9`  | vue cible (F7)                                  |
| `WEAP` | `0x50414557` | `0x0B` | vue arme / missile                            |
| `COMP` | `0x504D4F43` | `0x13` | **séquence scriptée** (STARTCAM/TAKEOFF/LANDING/AUTOPILT) |
| inconnu| —            | `0x14` | **ignoré**                                     |

`FIXD` (`0x44584946`) **n'est pas reconnu** → ignoré (présent seulement
dans le `MISSION.IFF` de dev, jamais dans les WRLD livrés).

### 2.3 Layout d'un sous-chunk `CAMR` simple (CHAS/CKPT/VICT/TARG/WEAP/ROTA)

En-tête commun, décodé sur `MAURITAN.IFF` (payload copié verbatim, longueur
`record[+0x72]`, taille de base **0x30 = 48 o**) :

```
+0x00  char[8]   nom interne     "CHASECAM" / "COCKPIT" / "VICTIM" / "AUTOTRAC" / "WEAPON" / "ROTATCAM"
+0x08  ...       slot look-at    CHAS : 14 o à 0    │ autres : 2 o à 0   (jamais renseigné dans les WRLD livrés)
+0x16  char[8]   sujet           entité porteuse, ex. "PLAYER"  (CKPT insère avant : char[8] art cockpit "F16-CKPT")
+0x1E  u32       farClip         50000 (0xC350)     — pieds ; le moteur applique <<8
+0x22  u16       fov             40 (0x28)          — le moteur applique <<8
+0x24  u32       nearClip        contient ~10 (0x0A) — l'ASM lit UN dword ici (pas pad + octet)
+0x28  u16 ×4    rect viewport   x, y, w, h   (0, 0, 319, 199) = (w-1, h-1)
+0x30  i32[]     (VICT / WEAP seulement) table d'offsets — voir §2.4
```

> `nearClip` est **un dword**. L'implémentation précédente (`ReadByte;
> ReadByte; MoveForward(6)`) était fausse — corrigée dans `RSWorld.cpp`
> (`readSimpleCamera`).

### 2.4 Queue étendue `VICT` / `WEAP` — table d'offsets 24.8

Après l'en-tête, une table `i32` de vecteurs de keyframe/boîte relatifs au
sujet, en **fixed-point 24.8** (`/256` = pieds). Exemple `WEAPON` (÷256) :

```
-10, 20, -30, -8, 1.5, [153], -4, [307], 0, -6, 10, 2.5, 20, 5, [153], 2.5, 6, 0.5, [-153], -0.5, 102
```

Les valeurs entre `[]` (octet bas non nul, ex. `0x99`=153, `0x66`=102)
sont de **petits params séparés** (angles / marqueurs), **pas** du 24.8.

### 2.5 `ATCH` — caméra attachée (dev uniquement)

`ATCH` n'apparaît **pas** dans les WRLD livrés (seulement dans le
`MISSION.IFF` de dev). Son payload y est : `20 o à 0` + `char[8]` nom du
sujet (`"AIRHEAD"` = nom interne du joueur chez les devs d'origine,
équivalent de `"PLAYER"` dans les missions livrées). **Pas de coordonnées.**

### 2.6 Ce que le loader stocke — entrée de registre (26 o)

Pour chaque tag reconnu, `Cinematic_LoadCameraDef` ajoute en **queue** de
la liste `0x59CD` (`LinkedListB_InsertAtTail_5F57F`) une entrée via
`Kneeboard_EntryConstruct{Text,Obj}` :

| off        | rôle                                                                  |
|------------|----------------------------------------------------------------------|
| `+0x04` u8 | **code de type** de caméra (table §2.2)                              |
| `+0x05` 8o | **ID / clé** = 8 premiers octets du payload (`COMP` : le nom `"TAKEOFF\0"` → sélection par nom ; `CKPT` : `obj[+0x53]`, `obj[+0x57]`) |
| `+0x0E` u16| réf objet instancié (`CKPT` seul, sinon 0)                          |
| `+0x10` fp | **payload brut** du chunk, copié verbatim (`ResourceRecord_ReadFieldGroupA`) |
| `+0x16` u32| longueur du payload                                                  |

**Le loader ne décode PAS les paramètres.** Seuls l'ID (8 o) et le tag
sont lus au chargement. Le payload (offsets 24.8, script `COMP`) n'est
consommé qu'à **l'activation** de l'entrée.

### 2.7 Correspondance C++ (libRealSpace, `RSWorld` / `RSCameraDef`)

```cpp
struct RSCameraDef {                 // caméra simple (CAMR)
    std::string          name;       // +0x00  "CHASECAM"/"COCKPIT"/...
    uint8_t              typeCode;   // code §2.2   (CHAS=3 CKPT=4 CONT=6 VICT=7 ROTA=8 TARG=9 WEAP=0x0B)
    std::string          subject;    // +0x16  "PLAYER"
    std::string          cockpitArt; // CKPT seul : "F16-CKPT"
    uint32_t             farClip;    // +0x1E  50000
    uint16_t             fov;        // +0x22  40
    uint32_t             nearClip;   // +0x24  dword (~10)
    uint16_t             viewX,viewY,viewW,viewH;  // +0x28  rect (0,0,319,199)
    std::vector<int32_t> params;     // VICT/WEAP : queue 24.8 (§2.4)
};
```

`RSWorld::parseWRLD_CAMR` dispatche les sous-chunks ; `readSimpleCamera`
lit l'en-tête ci-dessus (gap look-at = 14 o pour CHAS, 2 o sinon) ;
`parseWRLD_CAMR_CKPT` insère `cockpitArt` et n'a pas de rect viewport ;
`parseWRLD_CAMR_COMP` → `decodeCOMPSequence` (§5). Le `STRT` renseigne
`cameraSetName`.

---

## 3. Objet caméra runtime & vtable

L'entrée de registre CHAS/CKPT/… est un objet **0xBB o** construit par la
famille `Cinematic_CamEntryConstruct_*` (ovr246, ex-`HUDSymbol_ConstructVariant*`).

### 3.1 Constructeur (`sub_856F3`, CHAS ; `sub_859C7`, CKPT)

```
alloc 0xBB o → si
Formation_ComputeGeometryHelper_56D43(si+0x20)      ; matrice d'orientation 3×3 @ +0x20
[si+0x50] = 0x484   → String_ConstructEmpty(si+0x53)   ; ctor base A
           thunk 6BC0D
[si+0x50] = 0x67E   → String_ConstructEmpty(si+0x80)   ; ctor base B
[si+0x89] = 0
[si+0x50] = 0x79C                                       ; VTABLE FINALE (CHAS) — 0x778 pour CKPT
Formation_ComputeGeometryHelper_56D43(si+0x8B)      ; 2ᵉ matrice 3×3 @ +0x8B
CRT_MemFamily_Extra1(&buf, payload, 0x30)           ; copie 48 o du payload
HUDSymbol_ConstructAndInitAngleG_85790(si, &buf)    ; init des champs (voir §3.2)
```

**Le tag de vtable `+0x50` encode le type de caméra** :
`0x79C` = CHAS, `0x778` = CKPT (les autres types : à confirmer). Résolution
d'adresse : `vtable = 0x6D070 + tag` dans le segment de données seg339
(vérifié : `0x228A → 0x6F2FA`, `0x79C → 0x6D80C`).

### 3.2 Layout de l'objet entrée (extrait vérifié)

| off        | type      | rôle                                                             |
|------------|-----------|----------------------------------------------------------------|
| `+0x11`    | u8        | code d'état de la vue (posé par `manager[+0x11]` = retour de `vtable[0x14]`) |
| `+0x14/18/1C` | i32×3  | **position caméra monde** (24.8) — sortie                       |
| `+0x20`    | 3×3       | matrice d'orientation (lignes `+0x20` / `+0x2C` / `+0x38`)      |
| `+0x50`    | far ptr   | **vtable** (tag `0x79C` CHAS)                                    |
| `+0x53`    | char[8]   | nom interne de la caméra (`"CHASECAM"`)                         |
| `+0x5C`    | ptr       | **sous-objet viewport** (0x1E o ; init depuis le rect payload `+0x28..0x2F`) |
| `+0x60`    | dword     | **param** issu du chunk (= la queue `params` — seuil chase, §4) |
| `+0x80`    | char[8]   | nom de l'entité sujet (`"PLAYER"` / `"AIRHEAD"`)                |
| `+0x89`    | ptr       | **pointeur entité sujet** (résolu par nom à l'activation via `HUDSymbol_Helper14_853B0`) |
| `+0x8B`    | 3×3       | 2ᵉ matrice d'orientation                                        |

### 3.3 vtable `+0x50` (tag `0x79C`, base seg339 `0x6D80C`) — CHAS

| slot   | cible                        | rôle                                                    |
|--------|------------------------------|--------------------------------------------------------|
| `[0x00]` | `sub_85DCA`                | requête « activable ? » → AL (appelée par `ApplySelection`) |
| `[0x04]` | `sub_85DF5`                | désactive la vue précédente                            |
| `[0x08]` | `sub_8781A`                | —                                                     |
| `[0x0C]` | `loc_14FD7` (seg015)       | init / overlay de la vue externe (non détaillé)       |
| `[0x10]` | `sub_87457`                | start                                                 |
| **`[0x14]`** | **`loc_1519E` (seg015)** | **calcul position/orientation caméra + retour code d'état** |
| `[0x1C]` | `sub_85D22`                | —                                                     |
| `[0x20]` | `sub_85D95`                | (appelé par frame juste avant `[0x14]`)               |

> L'objet est **polymorphe** : c'est à la fois une ligne de journal
> kneeboard (slots texte hérités des bases `0x484` / `0x67E`) **et** le
> hook de vue externe (slots `[0x0C]` / `[0x14]` en seg015). Les anciens
> noms `HUDSymbol_Release*` / `TextScroll_*` des slots sont des devinettes
> — la partie caméra est le slot `[0x14]`.

### 3.4 vtable des entrées `COMP` (tag `0x460`, `off_6D510`)

L'objet `COMP` est **une autre classe** (0x102 o), partagée avec le
solveur de manœuvre de combat de l'IA. Constructeur
`AIManeuver_LoadFormationDataB_77FCA` (stub `6AC3E`). Slot `[0x10]` =
`AI_ManeuverSolutionMain_781D0` (l'interpréteur, §5).

---

## 3bis. Table des vues **cockpit** — `OBJECTS\<avion>.IFF` → `CKPT/INFO`

> Découvert 2026-09-07 en décodant `data/F16-CKPT.CKPT.INFO.DAT`.
> **C'est le système de vue INTRA-cockpit (F1 + regards), pas la chase F2.**
> Noté ici parce que c'est la structure que `loc_1519E` consomme, et qu'on
> l'a longtemps confondue avec la chase.

### Chargement — `Cockpit_LoadViewTable_86B53` (ovr249, ex-`MissionRecord_LoadFullDatabase`)

```
Path_Resolve("OBJECTS", <nom>, ".IFF")                     ; ex. OBJECTS\F16-CKPT.IFF
ResourceRecord_InitAndValidate_645CD(si+0x220, path, 'CKPT')
SeekAndRead('INFO')
ReadFinalField_64B51  →  [si+0x123] = count      (u8 : 5 pour le F-16)
ReadFinalField_64B51  →  [si+0x13F] = byte       (4)
alloc count * 0x1D                →  [si+0x133]
ReadFieldGroupA_64A19([si+0x133], count*0x1D)    ; lit la table brute
SeekAndRead('PART')  →  suite (instruments / MFD / …)
```

Le chunk `CKPT/INFO` = **en-tête 2 o (`count`, `byte`) + `count` records de
29 o**. `RSCockpit` (libRealSpace) charge déjà ce `CKPT/INFO` mais le garde
brut (`std::vector<uint8_t> INFO`) — non décodé.

### Layout d'un record (0x1D = 29 o)

| off | type | rôle |
|---|---|---|
| `+0x00` | u8 | **id** = scancode de la touche (`0xFF` = non lié) |
| `+0x01` | i16 | **FOV** |
| `+0x03` | i32 | `921` (constant sur le F-16 — near/clip ?) |
| `+0x07` | u16 | `160` / `130` |
| `+0x09` | u16 | varie (46 / 70 / 100 / 62) |
| `+0x0B` | i16 | angle de visée, rotation **X** (degrés) |
| `+0x0D` | i16 | angle de visée, rotation **Y** (degrés) |
| `+0x0F` | i16 | angle de visée, rotation **Z** (degrés ; Z-up ⇒ lacet) |
| `+0x11` | i32 | **offset œil pilote X** (24.8) |
| `+0x15` | i32 | **offset œil pilote Y** (24.8) |
| `+0x19` | i32 | **offset œil pilote Z** (24.8) |

### Table décodée — `F16-CKPT.CKPT.INFO` (5 records)

en-tête : `count = 5`, `byte = 4`.

| # | id | touche | FOV | angles (deg) | offset (24.8) |
|---|------|--------|-----|--------------|---------------|
| 0 | `0xFF` | — (défaut avant) | 40 | (0, 0, **0**) | (0, **7.875**, **1.5625**) |
| 1 | `0x3E` | **F4** — gauche | 40 | (0, 0, **−90**) | (0, 7.875, 1.5625) |
| 2 | `0x3D` | **F3** — droite | 40 | (0, 0, **+90**) | (0, 7.875, 1.5625) |
| 3 | `0x3F` | **F5** — arrière | 40 | (0, 0, **180**) | (0, 7.875, 1.5625) |
| 4 | `0xFF` | — (défaut zoom) | 30 | (0, 0, 0) | (0, 7.875, 1.5625) |

→ **offset identique pour les 5 = la position de l'œil du pilote** relative
à l'origine de l'avion : 0 latéral, **7.875 pieds vers l'avant**, **1.5625
pieds au-dessus**. Les records ne diffèrent que par la **direction de
regard** (angle `+0x0F` : 0 avant / ±90 côtés / 180 arrière) et le FOV.

### Application par frame — `Cockpit_ApplyViewRecord_84EC0` (ovr245)

```
record = [si+0x133] + index*0x1D
Matrix_BuildFullOrientation_575B2(si+0x143, record[+0x0B], record[+0x0D], record[+0x0F])
si[+0x167..0x16F] = record[+0x11 / +0x15 / +0x19]          ; offset œil
```

Puis `loc_1519E` / `loc_158D0` (§4.2) fait
`campos = avion.pos + rotate(si[+0x167], orient_avion)` et oriente la
caméra selon `si[+0x143]`. **C'est donc la formule de placement de l'œil
COCKPIT** (F1 + regards F3/F4/F5), pas la chase externe.

---

## 4. Caméra de suivi / vue externe — chemin `F2`

### 4.1 Chaîne d'activation (touche F2 = scancode `0x3C`)

```
Mission_TriggerEvaluator (seg040, sub_22F53)  switch(scancode - 0x3B)
   case 1  [loc_230D5] :
     Kneeboard_SelectByStateCode(0x59CD, 3)          (sub_23C82, seg041)
       si manager[+0x11] != 3 :
         Kneeboard_RenderByCode(mgr, 3)              → trouve l'entrée de code d'état 3
         Kneeboard_ApplySelection(mgr, entréeCHAS)   (sub_23CCC) :
           Cockpit_PanAzimuthUpdate(0x541A, {0x100})       ; transition pan douce
           si ancienne active : ancienne->vt50[0x04]()     ; désactive
           entréeCHAS->vt50[0x00]()  → AL                   ; « activable ? »
           si AL :
             manager[+0x12] = word_72A8F = entréeCHAS       ← LA VARIABLE
             manager[+0x11] = entréeCHAS->vt50[0x14]()      ← = code d'état 3
             entréeCHAS->vt50[0x10]()                       ; start
     si succès → affiche "Chase Plane" en haut de l'écran
```

Table des touches de vue (`Mission_TriggerEvaluator`, `off_23233`) :

| touche | scancode | case | `SelectByStateCode(0x59CD, …)` | libellé        |
|--------|----------|------|-------------------------------|----------------|
| F1     | `0x3B`   | 0    | `4`  (cockpit)                | —              |
| **F2** | `0x3C`   | 1    | **`3`  (chase)**              | "Chase Plane"  |
| F3     | `0x3D`   | 2    | — (`loc_2315C`, radar select) | —              |
| F6     | `0x40`   | 5    | `8`  (rota / external)        | "External View"|
| F7     | `0x41`   | 6    | `9`  (target)                | "Target View"  |

### 4.2 Calcul par frame — `loc_1519E`

> ⚠️ **Correction 2026-09-07.** `loc_1519E` + sa table `[si+0x133]` sont
> le **système de vue intra-cockpit** (§3bis) : `campos = œil_pilote +
> orient_avion`, regards F3/F4/F5. **Ce n'est PAS la chase F2.** Le lien
> « slot `[0x14]` de la vtable `0x79C` = chase » repose sur une résolution
> VROOMM non fiable et sur un décompte de slots contredit par le nombre
> d'arguments (`loc_1519E` prend 2 args, les sites d'appel n'en poussent
> qu'un). La chase externe F2 reste **non décodée**. Ce qui suit décrit le
> placement de l'œil cockpit, gardé pour référence.

`loc_1519E` (seg015). Args : `si` = contrôleur de vue cockpit (structure
seg015, > 0x220 o, table de vues en `+0x133`), `di` = l'entrée.

```
1. subject = di[+0x89]                                  ; l'avion (lié par nom "PLAYER")
   mass   = subject->vtable[0x3C]()                     ; scalaire (masse)

2. di[+0x14] = subject[+0x12]                           ; ┐ POSITION CAMÉRA = POSITION AVION
   di[+0x18] = subject[+0x16]                           ; │ copie directe, 24.8, aucun offset ici
   di[+0x1C] = subject[+0x1A]                           ; ┘ campos = pos_avion

3. si  si[+0x1BB] == 0  (pas de verrou cible)  →  jmp loc_15485   ; fin de la partie position

4. branche VERROU CIBLE  (si[+0x1BB] != 0  &&  subject[+0x5A][+0x0D] != 0) :
     ref   = subject[+0x5A]                             ; point/entité de référence
     D     = ref[+0x12..] - di[+0x14..]                 ; direction ref → caméra
     D     = normalize(D)                    (sub_55B04 / sub_5593A)
     s     = clamp( f(D, mass), -0x100, +0x100 )        ; scalaire borné ±1.0  (sub_5505B / sub_5493E)
     si  di[+0x60] > s_transformé  →  loc_15474         ; seuil du chunk : sous ce seuil, pas d'offset
     bornes  si[+0x183] / si[+0x185] / si[+0x187]  (i16 <<8)  gardent les composantes de D
     D     = D * 0x6400                                 ; PORTÉE = 100.0 unités (distance de recul chase)

5. LISSAGE DU « LAG »  (loc_156BA) :
     ref_fwd = si[+0x14F]                               ; vecteur avant courant de la vue
     tgt     = ref_fwd * 0x6400                         ; * 100.0
     step    = tgt - D
     si  |step| > 0x600  :  step = clamp_len(step, 0x600)   (UI_ApplyLineOfSightCheck_55A9E)
     D      += step                                     ; => pas MAX 0x600 = 6.0 unités / frame
   ⇒ le "lag" est un simple RATE-LIMIT par frame. Pas de force, pas de ressort amorti, pas d'EDO.

6. ORIENTATION  si[+0x143] (matrice 3×3) reconstruite depuis D  :
     Matrix_BuildFromAngle_56D72(si+0x143)
     Matrix_BuildAxisZ_572BC (si+0x143, si[+0x18B] <<8)     ; lacet
     Matrix_BuildAxisX_56EC3 (si+0x143, si[+0x189] <<8)     ; tangage
     sub_57660 (si+0x143)
   (même famille de fonctions que les scripts COMP, opcode 0x11)

7. INPUT — switch  word_72352  (= TYPE DE PÉRIPHÉRIQUE, pas la vue ; posé 1× à 2) :
     0 → Input_ProcessFrame_7A9E0        1 → Input_ReadMouseAndAxes_7AAF0
     3 → Input_ReadJoystickButtonsExtended_7ACD0   4 → Input_ReadJoystickAxisMax_7ADFC
   → pan joueur de la caméra, appliqué via AIManeuver_BuildRotationAndLookup_7A800 / _7A836 /
     AI_ApplyManeuverAngles_7A90A  (les mêmes helpers d'angle que l'IA)

8. "Eyes locked on target" / "Target tracking OFF"  — toggle si[+0x1BB] par scancode ; sous-mode.
9. Cockpit_ViewPanTransitionMain_15B67 (§4.6).
```

### 4.3 État — la chase F2 n'est PAS encore isolée

- Le vrai calcul de CHASE est **probablement `Camera_OrbitTrackCompute_1493A`**
  (§4bis) : orbite figée + distance fixe autour de l'avion, position lissée
  `+= diff/4` par frame. À **confirmer** (slot de vtable non résolu).
- Ce qu'on avait pris pour la chase (`loc_1519E` + table `si[+0x133]`) est
  le **placement de l'œil cockpit** (§3bis, §4.2). `campos = œil_pilote +
  orient_avion` ; le « 100.0 » (`0x6400`) et le clamp « 6.0/frame »
  (`0x600`) sont des params de sa **branche verrou-cible (padlock)**, pas
  de la chase.

> ⚠️ **Contradiction non résolue (2026-09-12).** `DATA_MODEL.md` §6.6b-ter
> (« 5ᵉ passe, chemin F2 RÉSOLU ») affirme au contraire que `loc_1519E` EST
> le slot `[0x14]` de la vtable CHAS (tag `0x79C`), avec une table de slots
> citée depuis `Cinematic_CamEntryConstruct_CHAS_856F3` (`[0x14]` =
> `loc_1519E`, sujet lié par nom `"PLAYER"`/`"AIRHEAD"` — cohérent avec CHAS,
> pas CKPT). Les deux affirmations n'ont pas été réconciliées : soit la
> correction ci-dessus est obsolète, soit la 5ᵉ passe a mal résolu le tag.
> Ce que la session du 2026-09-12 a vérifié en lisant `loc_1519E` **ligne à
> ligne** reste vrai quel que soit le type réel de la vtable propriétaire :
> `campos = sujet.position` (copie directe, aucun recul), et la branche
> verrou-cible qui suit (§4.6, « Eye on Target ») est **confirmée par Rémi**
> comme le mécanisme réel de la vue **« Eye on Target » (touche Y)**, une
> caméra **distincte** de CHASE (F2) et de TARGET (F7) — déjà implémentée
> côté C++, fonctionne bien, pas de portage à refaire. Reste ouvert : quelle
> vtable possède réellement `loc_1519E` (CHAS ou CKPT), et la vraie fonction
> de TARGET (F7, tag `0x6CF`, cf. §9).

### 4.4 `SMOK` — statut

Chunk `REAL/OBJT/JETP/SMOK` du modèle 3D avion (`JDYN_LoadAngleAndChunk_9D189`,
ovr310) : `entité[+0x39]` u8 (F-16 : 3) + vec3 `entité[+0x3A/+0x3E/+0x42]`
(F-16 : `(0, −3584, 0)` = `(0, −14, 0)` en 24.8).

- **L'objet caméra externe seg085 en tire des données** :
  `Camera_InitAttachedWithTarget_3DC3D` fait `cam[+0x54] = entité[+0x39]`
  (le compte SMOK).
- Mais le **vecteur** SMOK est consommé par `Emitter_UpdateFromEntitySMOKVec_3D57E`
  (appelé par `Camera_ExternalUpdate_3D9B4` / `Camera_LookAtSecondaryTarget_3D9FB`)
  qui calcule 2 points `cam.pos + ligne_orient·SMOK.y + mvt_mount` et
  **spawne N éléments** via `Elements_SpawnAlongSegment_4D1C9` (×`cam[+0x54]`).
  → **traînée moteur** ; il *lit* `cam.pos`, ne l'*écrit* pas.
- Donc l'intuition « SMOK réutilisé par la caméra » n'est pas absurde
  (le compte SMOK sert de param), mais le **vecteur** SMOK sert à la fumée,
  pas au placement.

### 4.5 Cluster caméra externe seg085/086/087 — `Camera_ComputeMountedPosition_3D31D`

Tick par frame (`seg087:0250`). `Vlin = cam[+0x51] ? mount[+8..+0x10] ×
dword_7045E/256 : 0` ; `cam[+0x12..] += Vlin` (**intègre** la vitesse du
mount, jamais de snap ni d'offset constant) ; puis rattrapage de cap
rate-limité (`θ = W.y × dword_70458/256`, rotation 2D, appliqué à
`cam->vtable[0x30]` et au mount). Une entrée avec `cam[+0x55]` (cible
secondaire) pilote l'orientation du mount via `Camera_LookAtSecondaryTarget_3D9FB` /
`Camera_ResolvePositionVelocity_3DDC4`.

> ⚠️ **Ce n'est PAS TARGET (F7)** (correction 2026-09-12) : le mécanisme
> "cible secondaire" de CE cluster (seg085/086/087) a été tracé en détail
> puis écarté — TARGET (F7, tag vtable `0x6CF`) est un objet séparé, pas
> encore identifié (§9), et le mécanisme réellement confirmé par Rémi pour
> une vue à cible verrouillée est celui de **§4.6 "Eye on Target" (touche
> Y)**, dans une fonction totalement différente (`sub_15B67`, seg015). La
> mention "TARGET" ci-dessus était une hypothèse non vérifiée d'une session
> antérieure.

**Ouvert** : `cam[+0x12]` démarre à 0 et n'est jamais posé en absolu →
offset relatif au mount, ou accumulateur de force (`Debris_BodyGetPosition`
le lit pourtant brut). Où l'offset de recul initial est posé. Identité du
mount `cam[+0x51]`. Ce cluster est probablement une **autre** caméra
(arme / missile / replay), pas CHASE/TARGET. Comparer avec `loc_1493A`
(§4bis) qui, lui, est propre et complet.

### 4.6 « Eye on Target » (touche Y) — `Cockpit_ViewPanTransitionMain_15B67`

**Confirmé par Rémi (2026-09-12)** comme le mécanisme réel de la vue « Eye
on Target » (touche **Y**), déjà implémentée côté C++ (fonctionne, pas de
portage à refaire) — documenté ici pour la traçabilité RE. Fonction lue
**intégralement ligne à ligne** ce même jour ; nom et résumé précédents
(`Cockpit_HudUpdateMain`, "mise à jour HUD par frame") étaient faux/devinés
par une passe rapide antérieure — corrigés dans `known_functions.json`.

Appelée une fois par frame juste après le calcul position/orientation de
`loc_1519E` (`loc_15485`, même `si` = contrôleur de vue, même `di` = sujet
avion). Après deux blocs sans rapport (garde de rentrée, animation de
zoom/transition MFD en 2 étapes, non détaillés), le bloc clé (gardé par
`byte_72365`) :

```
forward = si[+0x14F]                                   ; le vecteur avant de la vue (même champ que loc_1519E §4.2 pt.5)
obj     = subject->vtable[0x3C]()                       ; même appel que loc_1519E pt.1
forward = Math_ApplyRotationHelperB_58828(forward, obj)  ; rotation de forward par cet objet
bearing_elev = Targeting_ComputeBearingElevation_55B1A(0x5AA7, forward)
si  si[+0x1EC] >= bearing_elev  :                        ; seuil dépassé -> hors cadre
    value = si[+0x1F0] * bearing_elev + si[+0x1E8]
    Camera_PanTransitionExtended(0x541A, &value, si[+0x1E5], si[+0x1E6], si[+0x1E7])
    si[+0x1E4] = 1
sinon si  si[+0x1E4] != 0  :                             ; retour dans le cadre
    Cockpit_PanAzimuthUpdate(0x541A, &1.0)               ; retour neutre
    si[+0x1E4] = 0
```

Un bloc similaire suit (gardé par `byte_6E4CF`), avec une constante fixe
`0x4C` (76) à la place du calcul bearing/élévation — probable retour à une
position fixe, non approfondi.

**Ouvert** : sémantique exacte de `subject->vtable[0x34]()` (code d'état
comparé à 6, testé en tête de fonction — un commentaire antérieur devinait
« détruit », **aucune preuve**), de `subject->vtable[0x3C]()`,
`Targeting_ComputeBearingElevation_55B1A` et `Camera_PanTransitionExtended`
en détail, des stubs VROOMM `6B099`/`6B08F`/`6B094`/`6B080`/`6B085`. Pas
bloquant puisque la fonctionnalité est déjà portée et validée par Rémi.

---

## 4bis. Caméra orbitale / suivi — `Camera_OrbitTrackCompute_1493A` (seg014)

> Décodé 2026-09-07 sur la piste **ROTA** (suggestion de Rémi : « cam à
> position fixe qu'on fait tourner autour de la cible »). C'est du **seg014
> propre** (pas de labyrinthe VROOMM), entièrement lisible.
>
> **CONFIRMÉ pour CHASE** (pass seg339, 2026-09-07) : `loc_1493A` est à
> `seg339:07AC`, et le slot **immédiatement adjacent** `seg339:07B0` est
> `loc_14EB5` = un getter trivial `return AL = 3` (**3 = le code d'état
> CHASE**, cf. table des touches §4.1). Donc `loc_1493A` et « get-state → 3 »
> sont dans la **même vtable** = la vtable CHASE. La vue chase utilise
> bien ce calcul orbital.
> (De même `loc_14EF0` → 4 = COCKPIT ; `loc_14904` → 1.)
> TARGET/ROTA passent par la même géométrie, `subject` = la cible pour
> TARGET, orbite tournable pour ROTA.

`loc_1493A` = un slot de vtable des entrées caméra. `si` = l'objet entrée.

### Formule

```
subject   = si[+0x89]                                   ; entité regardée
R         = subject->vtable[0x3C]()                     ; matrice d'orientation du sujet
axe       = { R[+0x0C], R[+0x10], R[+0x14] }            ; rangée 1 de R
axe       = orbitMatrix(si[+0x8B]) · axe                ; si[+0x8B] = matrice d'orbite 3×3 accumulée
targetPos = subject.pos(+0x12) − si[+0xAF] · axe        ; si[+0xAF] = distance d'orbite (24.8)

; --- position lissée (LE « LAG ») ---
diff = targetPos − si[+0x14..]
si  |diff| > si[+0xB3] :  si[+0x14..] = targetPos − clampLen(diff, si[+0xB3])
sinon                 :  si[+0x14..] += diff / 4        ; ¼ du reste par frame  (0x400 → /4)

; --- orientation : la caméra regarde le sujet ---
look       = subject.pos − si[+0x14..]
si[+0x20]  = UI_ApplyLineOfSightAndTransform_57DAE(look)   ; matrice de visée
Camera_ComputeViewMatrix_2E2AC(si)

; --- entrées joueur ---
boutons joystick + Joystick_GetAxisMin/Max → deltas (dx, dy)
Matrix_BuildAxisZ_572BC(si[+0x8B], dx<<8)  ;  Matrix_BuildAxisX_56EC3(si[+0x8B], dy<<8)
   → accumulent la rotation dans la matrice d'orbite (bornée par si[+0x9B] / si[+0xAB])
zoom : byte_72DE3==1 → si[+0xAF] += dword_70448 (max si[+0xB3])
       byte_72DE2==1 → si[+0xAF] −= dword_70448 (min si[+0xB7])
```

### Init / reset — `Camera_OrbitReset_85878` (ovr246, slot vtable `[0x1C]`)

**Trouvé 2026-09-07.** C'est ici que les distances d'orbite sont posées —
et elles sont **dérivées de la taille du sujet**, pas constantes :

```
Matrix_BuildFromAngle_56D72(si+0x8B)          ; matrice d'orbite → IDENTITÉ
R = subject->vtable[0x3C]()                    ; orientation du sujet
si[+0x20] = seed(R)                            ; matrice de visée initiale

e = subject[+0x20]                             ; dword du WorldObject sujet
si[+0xB7]  = e          (distance MIN)
si[+0xAF]  = e * 2      (distance de RECUL par défaut)   ← LA VALEUR
si[+0xB3]  = e * 4      (distance MAX)
```

→ **le recul chase = `taille_avion × 2`**, zoom possible entre `×1` et `×4`.

`subject[+0x20]` = champ dword du sujet, posé par
`Debris_BodyAttachToSubpart_37C89` à `parent[+8][+0x10]` (déréférence du
far-ptr `parent[+8:+0x0A]`, offset `+0x10`). Le RE nomme provisoirement
WorldObject `+0x20` « masse-ish » (sommé à une magnitude de force dans
`Debris_ComputeNetForce`). **Source/valeur exacte non résolue.**

**Le chunk `INFO` de `REAL/OBJT` NE le porte PAS.** `IFF_LoadInfoChunk`
(`sub_4B90B`, seg104) ne lit que : `model[+0x37]` = **rayon de collision**
(word, défaut `0x14` = 20), `model[+0x39]`/`+0x3A` = flags. Ce rayon EST
recopié côté caméra (`model[+0x37] << 8` → `cam[+0x2E]`, via
`Decoy_AttachAndStartLifetime_9C90B`) mais à `+0x2E`, **pas `+0x20`**.
*(Correction 2026-09-24 : `Decoy_AttachAndStartLifetime_9C90B` est le rattachement de l'instance **leurre** `DECY` ; pour cette classe `model[+0x37]` est la durée de vie lue dans le chunk `DATA` par `DecoyModel_LoadDATALifetime_9C810`, et `+0x2E` est le temps restant. Voir `AI_TICK_CALL_GRAPH.md`, « Qui écrit les octets de signature ».)*

**Confirmé côté données (Rémi, 2026-09-12) : le chunk `INFO` de `REAL/OBJT`
est systématiquement vide dans les fichiers livrés** (donc le rayon de
collision `model[+0x37]` reste à sa valeur par défaut `0x14`=20, jamais
surchargé). `subject[+0x20]` **ne peut donc pas venir de ce champ IFF** —
c'est cohérent avec le fait qu'aucun `ResourceRecord_Read*` n'écrit
directement `+0x20` : cette taille est **calculée dynamiquement à partir
de la géométrie du modèle** au chargement (bounding box/sphère dérivée des
sommets), pas lue depuis une donnée figée. Ça confirme que
`boundingRadius(plane->objct)` côté port n'est pas une approximation de
repli mais l'équivalent fonctionnel direct du mécanisme original.

**Ce qui est EXACT (issu de l'ASM, à ne pas caler à l'œil) :**
- distance min = `taille × 1`
- distance de départ = `taille × 2`
- distance max = `taille × 4`
- au reset : matrice d'orbite = identité, orientation copiée de l'avion
- suivi de position lissé : `campos += (cible − campos) / 4` par frame (§4bis)

Seule la **base `taille`** (= `subject[+0x20]`) reste à qualifier
numériquement. Toutes les pistes convergent vers **une mesure de taille du
modèle** (le RE l'utilise comme échelle de force ; le rayon de collision
`model[+0x37]` joue le même rôle ailleurs). Valeur non extraite du binaire.

**Portage fidèle + robuste (recommandé)** : prendre la **taille de l'avion
suivi** comme base — rayon de la bounding-sphere (libRealSpace :
`entity->GetBoudingBpx()`), ou le rayon de collision du modèle si exposé —
et appliquer les ratios exacts :

```cpp
float size    = boundingRadius(plane);      // rayon englobant de l'avion
float dist    = size * 2.0f;                 // recul par défaut
float distMin = size * 1.0f;
float distMax = size * 4.0f;
// puis §4bis : campos glisse vers  plane.pos - dist*(orbit * planeRow1),
//              pas = (cible - campos) / 4 par frame ; caméra regarde plane.pos
```

C'est **fidèle** (ratios 1/2/4 exacts, lissage ÷4 exact, orbite identité au
départ) et **robuste** (s'adapte à chaque avion, pas de nombre magique
F-16). Reste optionnel : dump `REAL.OBJT.INFO` du F-16 (1er word = rayon de
collision) pour caler `size` au plus près de l'original.

Comme les chunks `CHAS`/`ROTA`/`TARG` sont byte-identiques et que ce reset
lit `subject[+0x20]`, **la distance est bien la même pour les 3 vues**
(dépend seulement de l'avion suivi), ce qui confirme l'intuition de Rémi.

### Champs de l'objet entrée (au-delà de §3.2)

| off | rôle |
|---|---|
| `+0x14/18/1C` | position caméra monde (lissée, 24.8) |
| `+0x20` | matrice de visée (regarde le sujet) |
| `+0x2C` | matrice de travail |
| `+0x89` | **sujet** (entité regardée) — `Camera_Entry_GetSubject_14859` le renvoie |
| `+0x8B` | **matrice d'orbite 3×3** — tournée par les entrées joueur |
| `+0x9B` / `+0xAB` | bornes d'angle d'orbite (lacet / tangage) |
| `+0xAF` | **distance d'orbite** (recul) |
| `+0xB3` / `+0xB7` | distance max / min (bornes de zoom) |

### Variante sans offset — `Camera_AttachedNoOffsetCompute_14867`

Slot voisin (seg339 `0x68E`) : `si[+0x14..] = subject[+0x12..]` (position
caméra = position sujet, **aucun offset**), orientation semée depuis
`subject->vtable[0x3C]()`. Vue « collée au sujet ».

### Portage libRealSpace — CHASE / ROTA / TARGET (un seul modèle)

```cpp
// état par vue
Matrix   orbit;        // = identité pour CHASE ; tournée par l'input pour ROTA
float    dist;         // recul (à caler ; F-16 : cf. record CKPT / valeur de mission)
Vector3D camPos;       // persistant entre frames

// par frame (dt réel) :
Vector3D axis   = orbit * subject.orientationRow1();          // rangée 1 de l'orientation sujet
Vector3D target = subject.position - axis * dist;
Vector3D diff   = target - camPos;
if (diff.Length() > distMax) { camPos = target - diff.limit(distMax); }
else                         { camPos += diff * (dt * 25.0f / 4.0f); }   // ¼/frame calibré 25 fps
Matrix orientation = lookAt(subject.position - camPos);
// ROTA : orbit = BuildAxisZ(dx) * BuildAxisX(dy) * orbit ;  dist ±= zoomStep (clamp distMin..distMax)
```

---

## 5. Caméras scriptées — chunk `COMP`

### 5.1 Format du chunk

Même en-tête `0x1C` o que les caméras simples, puis un **script de
keyframes à longueur variable**, terminé par l'octet `0xFE` + `char[8]` =
vue de reprise.

```
+0x00  char[8]   nom            "STARTCAM" / "TAKEOFF" / "LANDING" / "AUTOPILT"
+0x08  u16       flags
+0x0A  u32       farClip        50000        (le moteur : movsx puis <<8 pour param0/leadIn)
+0x0E  i16       param0
+0x10  i32       leadIn         (traité en 24.8 par le moteur)
+0x18  u16       viewW          319
+0x1A  u16       viewH          199
+0x1C  …         PROGRAMME      opcodes 1 o + opérandes i16/i32 LE signées
       … 0xFE  char[8]          FIN + nom de la vue suivante ("COCKPIT")
```

**Convention d'opérandes** : les opérandes de position/vecteur sont des
**entiers** dans le fichier ; le moteur fait `shl …,8` pour sa maths 24.8
interne (noté « `<<8` »). Les opérandes qui sont **stockées brutes** dans
un champ `+0x..` ensuite utilisé en 24.8 → « raw » (`/256` au décodage
côté port). Voir la colonne `fix[]` de `COMPShape`.

### 5.2 Jeu d'opcodes complet (`AI_ManeuverSolutionMain_781D0`, ovr232)

Interpréteur : switch 30 cas (`word_79C6F`, sauts `off_79CAB`).
Opcode inconnu → ignoré (avance de 1).

| op   | taille | opérandes             | effet                                                                   |
|------|--------|-----------------------|----------------------------------------------------------------------|
| `01` | 5      | `i32 a`               | `obj+A0 = a` (raw) ; **mode 1** (maintien temporisé)                 |
| `02` | 13     | `i32 x,y,z`           | **position absolue** → `obj+14/18/1C` (`<<8`)                        |
| `03` | 1      | —                     | reconstruit la matrice d'orientation (`obj+20`)                     |
| `04` | 11     | `i32 a ; i16 x,y,z`   | `obj+A0 = a` (raw) ; cible `obj+E4/E8/EC` (`<<8`) ; **mode 4**       |
| `05` | 7      | `i16 x,y,z`           | taux de rotation `obj+D8/DC/E0` (`<<8`)                             |
| `06` | 13     | `i32 a,b,c`           | vitesse `obj+C0/C4/C8` (raw)                                        |
| `07` | 9      | `char[8] nom`         | **lie l'entité de référence** `obj+92` par nom (`"PLAYER"`)          |
| `08` | 5      | `i32 a`               | `obj+A0 = a` (raw) ; **mode 8**                                     |
| `09` | 5      | `i32 a`               | `obj+BC = a` (raw)  — distance de recul                            |
| `0A` | 13     | `i32 x,y,z`           | position relative `obj+B0/B4/B8` (`<<8`)                           |
| `0B` | 5      | `i32 a`               | `obj+A0 = a` (raw) ; **mode 0xB**                                   |
| `0C` | 5      | `i32 a`               | `obj+BC = a` (raw) ; flags `obj+FF=0`, `obj+100=1`                  |
| `0D` | 13+N   | `i32 p,q,r` + octets jusqu'à `0x00`, puis `u8 flag` | `obj+A4/A0/A8` puis rampe division 24.8 → `obj+A8/AC` |
| `0E` | 13     | `i32 x,y,z`           | **position relative à l'entité liée** : `<<8`, tourné par orient(`obj+92`) + pos(`obj+92`) → `obj+14/18/1C` |
| `0F` | 5      | `i16 h ; i16 k`       | `obj+F0 = h` (raw) ; `obj+F2 = k` (`<<8`) ; angles d'approche → `obj+F6/FA` |
| `10` | 1      | —                     | si `obj+92` : **`obj+20 (orient. caméra) ← orient. de l'entité liée`** (`AI_ComputeGeometryHelper_56E29`) |
| `11` | 7      | `i16 a,b,c`           | **compose** des axes d'orientation sur `obj+20` (`Matrix_BuildAxisZ/X/Y_572BC/56EC3/570C5`, `<<8`) + `Matrix_ApplyToVectorY` |
| `12` | 13     | `i32 x,y,z`           | offset d'ancrage dans le repère entité `obj+94/98/9C` (raw)        |
| `13` | 1      | —                     | `obj+FF = 1 ; obj+100 = 0`                                          |
| `14` | 5      | `i32 s`               | `obj+C0/C4/C8 = lignes_orient(obj+2C) × s` (24.8)                   |
| `15` | 13     | `i32 x,y,z`           | `obj+CC/D0/D4` (raw)                                               |
| `16` | 5      | `i32 s`               | `obj+CC/D0/D4 = lignes_orient(obj+2C) × s` (24.8)                   |
| `17` | 5      | `i32 d`               | `obj+C0/C4/C8 = (chaque `<<8`) / d` (division 24.8)                 |
| `18` | 1      | —                     | si `obj+92` : `obj+C0/C4/C8 = vitesse(entité)` (`entité->vtable[0x4C]`) |
| `19` | 1      | —                     | si `obj+92` : tourne `obj+C0` par l'orientation de l'entité         |
| `1A` | 1      | —                     | si `obj+92` : tourne `obj+CC` par l'orientation de l'entité         |
| `1B` | 1      | —                     | `byte_70471 = 0 ; obj+101 = 1` (« interruptible » ; `STARTCAM`)     |
| `1C` | 1      | —                     | si `obj+92` : `obj+BC = ‖pos_entité − obj+14‖` (distance)          |
| `1D` | 17     | `i32 a,x,y,z`         | `obj+A0/E4/E8/EC` (raw) ; si `obj+92` : `obj+B0/B4/B8 = pos_entité − obj+14` ; **mode 0x1D** |
| `FE` | 9      | `char[8] vue`         | **FIN** ; `word_72A8C = Kneeboard_FindByID(0x59CD, vue)` → enchaîne sur la caméra nommée (`"COCKPIT"`) |

### 5.3 Champs de l'objet manœuvre/caméra COMP (0x102 o)

| off            | rôle                                                                    |
|----------------|----------------------------------------------------------------------|
| `+0x14/18/1C`  | position monde (24.8) — **sortie**                                   |
| `+0x20`        | matrice d'orientation 3×3 (lignes `+0x20`, `+0x2C`, `+0x38`)         |
| `+0x50/53/5C`  | vtable (`0x460`) / nom / sous-objet viewport (`0x44C`)               |
| `+0x80/84/86`  | script : base / kind / longueur                                     |
| `+0x8A:8C`     | **curseur vivant** (far ptr, persiste entre frames)                 |
| `+0x8E`        | compteur de temps écoulé (`+= dword_70458` / frame)                 |
| `+0x92`        | entité liée (weak ref ; opcode `07`)                                |
| `+0x94/98/9C`  | offset d'ancrage dans le repère entité (opcode `12`)                |
| `+0xA0`        | compteur du segment (`−= dword_70458` / frame sauf mode 1)          |
| `+0xA4/A8/AC`  | compteur / accumulateur / taux (opcode `0D`)                        |
| `+0xB0/B4/B8`  | position courante **relative à l'entité liée**                      |
| `+0xBC`        | **distance de recul** le long de l'axe avant                        |
| `+0xC0/C4/C8`  | vitesse linéaire (→ position via `dword_7045E`)                     |
| `+0xCC/D0/D4`  | accélération linéaire (→ vitesse via `dword_70458`)                 |
| `+0xD8/DC/E0`  | taux de rotation (→ orientation via `dword_70458`)                  |
| `+0xE4/E8/EC`  | vecteur cible du segment (opcodes `04`/`1D` ; orient. cible mode 4) |
| `+0xF0/F2/F6/FA`| angle d'approche : param / restant / accum Z / accum X (opcode `0F`) |
| `+0xFE`        | **mode** : `0xFF` = exécuter des opcodes ; `1/4/8/0xB/0x1D` = mouvement actif |
| `+0xFF/+0x100` | recalcul d'ancrage depuis `+0x94` / activation du chemin ancrage-visée |
| `+0x101`       | « interruptible » (opcode `1B` ; avec `byte_722D1 == 1` → fin forcée) |

### 5.4 Globales de temps

Calculées en seg112 depuis `dword_70454` (défaut `0x1900` = 6400 ; 2ᵉ
chemin `0xF00` = 3840) :

- `dword_70458 = (0x100 << 8) / dword_70454` = **pas de temps par frame**
  pour accel/rotation (~10 au défaut, ~17 sur le 2ᵉ chemin).
- `dword_7045E` = pas pour la vitesse linéaire (dérivé, un peu plus petit).
- `byte_722D1` = « sauter la cinématique ».
- `word_72A8C` = caméra suivante en file (posée par l'opcode `FE`).

### 5.5 Appel par frame — `AI_ManeuverSolutionMain(obj)` → `1` = en cours, `0` = terminé

1. **Abort** : `byte_722D1 == 1 && obj+0x101 != 0` → mode = `0xFF`.
2. **Dispatch sur `obj+0xFE`** :
   - **`1` — maintien temporisé** : fini quand `obj+0x8E ≥ obj+0xA0` → mode `0xFF`.
   - **`4` — rotation vers orientation cible** (`obj+0xE4..`) en `obj+0xA0` pas :
     erreur d'angle via `AI_ApplyAngleBetweenVectors` / `AI_ComputeGeometrySolution` /
     `AI_ApplyApproachAngles` ; si `< 0x200` (2.0°) → snap
     (`WorldObject_BuildOrientationMatrix`), mode `0xFF` ; sinon tourne de
     `erreur/A0 · dword_70458`.
   - **`8`** — pas de handler ; intégrateur générique seul.
   - **`0xB` — visée/poursuite d'un point** : `dir = obj+0xB0.. − pos` ;
     `ligne_orient(obj+0x2C) ← dir` (+ `dir/A0`/frame) ; `Targeting_LineOfSightCheck` ;
     `Matrix_ApplyToVectorY`.
   - **`0x1D` — déplacement sur segment** vers `rotate(obj+0xE4.., orient_entité)` :
     `pas = ((cible − obj+0xB0..)<<8)/obj+0xA0 · dword_70458` ; `obj+0xB0.. += pas` ;
     `pos_monde = obj+0xB0.. + pos_entité`. Snap + mode `0xFF` si `obj+0xA0 ≤ 0`
     ou pas d'entité.
   - `0xFF`/autre → étape 3.
3. **`mode == 0xFF`** → **boucle opcodes** jusqu'à un opcode posant un mode
   ≠ `0xFF`, ou `0xFE` (pose `word_72A8C`, renvoie **0**).
   **`mode != 0xFF`** → **intégrateur générique** (`loc_796B4`) :
   - `pos += vitesse(C0..) · dword_7045E`
   - `vitesse += accel(CC..) · dword_70458`
   - orientation ← reconstruite depuis `rot_rate(D8..) · dword_70458`
   - si `obj+0x100` : `obj+0xB0.. = rotate(obj+0x94.., orient_entité) + pos_entité`
   - `0D` : `obj+0xA8 += obj+0xAC·dt ; d = obj+0xA8·dword_7045E ; obj+0xA4 −= d ; obj+0xBC −= d`
   - `0F` : consomme `obj+0xF2`, accumule `obj+0xF6/FA`, reconstruit les axes
   - **`pos = obj+0xB0.. − ligne_orient(obj+0x2C..) · obj+0xBC`** (recul de `BC` derrière l'ancrage)
   - sinon (`obj+0x100==0`, `obj+0xFF`, entité) : `UI_ApplyLineOfSightAndTransform` → vise l'entité
   - `obj+0xA0 −= dword_70458` (sauf mode 1) ; `obj+0x8E += dword_70458`
   - `Camera_ComputeViewMatrix(obj)` ; renvoie **1**

### 5.6 Cycle de vie d'un segment

Les opcodes remplissent des champs **et** arment un mouvement (mode + cible
+ `obj+0xA0`). Le moteur exécute ce mode ~`obj+0xA0 / dword_70458` frames ;
le compteur expire → mode `0xFF` → reprise de la boucle opcodes au curseur
→ segment `1D` suivant / `FE`.

**Structure typique** (confirmée sur `MAURITAN.IFF`) :
`[07 "PLAYER"]` (lie le sujet) `[02|0E x y z]` (position abs/relative)
`[05|0A|11 …]` (vecteurs cible/vitesse/orientation) `[01|04|08|0B|1D …]`
(arme un segment) … `[FE "COCKPIT"]` (fin + vue suivante). `STARTCAM`
commence par `[1B]`.

### 5.7 `STARTCAM` décodé et vérifié

Plan d'ouverture de mission : la caméra balaie horizontalement autour de
l'avion puis plonge vers le cockpit. 11 instructions :

| # | opcode                    | opérandes        | rôle                                                                       |
|---|---------------------------|------------------|--------------------------------------------------------------------------|
| 0 | `1B` START_FLAG           | —                | marque « interruptible » (`obj+0x101`)                                    |
| 1 | `07` BIND_ENTITY          | `"PLAYER"`       | lie l'avion joueur (`obj+0x92`)                                          |
| 2 | `0E` SET_POS_REL_ENTITY   | `0, 2048, 384`   | position = pos_avion + rot(cap)·(2048 devant, 384 au-dessus) → 3/4 avant surélevé |
| 3 | `10` COMPUTE_GEOM         | —                | **orientation caméra `obj+0x20` ← orientation de l'avion** (copie)      |
| 4 | `11` SET_ORIENT_AXES      | `-30, 0, 180`    | **compose** (pas remplace) sur `obj+0x20` : pitch −30° + lacet +180° → la caméra fait face à l'avion. **Angles relatifs au cap semé en #3.** |
| 5 | `09` SET_DIST             | `160`            | `obj+0xBC = 160` ; active le chemin ancrage+recul. Pas d'opcode `12` → offset d'ancrage nul → **orbite rayon 160** autour de l'avion. |
| 6 | `0F` ARM_APPROACH_ANGLE   | `20, 180`        | consomme +180° de lacet à ~20/tick pendant le hold = **le balayage rotatif horizontal** |
| 7 | `01` ARM_HOLD             | `1536`           | durée du balayage (`obj+0xA0`, mode 1)                                  |
| 8 | `0D` DIV_SETUP            | `120, 1280, 0`   | flag 0 → `div_a8 = 120·256/1280 = 24` ; le décompte fait décroître `obj+0xBC` 160 → ~47 = **la rentrée / chute vers le cockpit** |
| 9 | `01` ARM_HOLD             | `2816`           | durée de la rentrée                                                     |
| 10| `FE` END                 | `"COCKPIT"`      | fin → enchaîne sur la caméra `COCKPIT`                                  |

**Points structurels confirmés par ce script :**
- (a) l'opcode `10` **sème** l'orientation caméra depuis l'entité liée, et
  l'opcode `11` **compose** son delta par-dessus (les `Matrix_BuildAxis*`
  lisent-recombinent-réécrivent `obj+0x20`, ils ne l'écrasent pas) → **les
  angles d'orientation d'un script sont relatifs au cap de l'entité**, pas
  absolus ;
- (b) `SET_DIST` sans `SET_ANCHOR_OFS` (opcode `12`) → ancrage sur la
  position même de l'entité, caméra en orbite à distance `obj+0xBC` ;
- (c) `ARM_APPROACH_ANGLE` = balayage angulaire progressif ;
- (d) `DIV_SETUP` (flag 0) = rampe linéaire qui grignote simultanément
  `obj+0xA4` et `obj+0xBC`.

### 5.8 Correspondance C++ (libRealSpace, `RSCameraCOMP` / `RSCameraSequence`)

```cpp
struct RSCameraSequence {
    std::string           name;         // +0x00
    uint16_t              flags;        // +0x08
    uint32_t              farClip;      // +0x0A
    int16_t               param0;       // +0x0E
    int32_t               leadIn;       // +0x10
    uint16_t              viewW, viewH; // +0x18 / +0x1A
    std::vector<COMPInstr> program;     // depuis +0x1C, fin = OP_IA_END
    std::string           handoffView; // 8 c après OP_IA_END
};
```

`COMPInstr::args[]` sont **converties en float au décodage** (pas au
runtime). `COMPShape::fix[slot]` = `true` si l'opérande est un 24.8 brut
(`/256` au décodage), `false` si l'ASM la décale `<<8` (déjà en unités) ou
si c'est un compteur. Décodeur : `decodeCOMPInstr` / `decodeCOMPSequence`.

---

## 6. Conventions de portage libRealSpace

### 6.1 Remap d'axes (ASM Z-up → libRealSpace Y-up)

L'ASM est en **Z-up** : composantes `(c0, c1, c2)` avec **`c2` = altitude**.
libRealSpace est en **Y-up** : `(x, y, z)` avec **`y` = altitude**.

```cpp
// opérande fichier (a0, a1, a2)  →  libRealSpace
v.x =  a0;
v.y =  a2;    // altitude
v.z = -a1;    // signe à confirmer sur cas réel

// angles (o0, o1, o2)  (degrés, ordre ASM = rot X, rot Y, rot Z)
angles.x =  o0;   // pitch
angles.y =  o2;   // yaw   (axe Z de l'ASM = altitude → lacet)
angles.z = -o1;   // roll
```

(cf. `SCCameraSequence::compToVec3` / `compAngles`.) Ne **jamais** assumer
roulis/tangage/lacet sur un axe sans vérification explicite dans le code.

### 6.2 Règle du 24.8

- Opérande sur laquelle l'ASM fait `shl eax, 8` → **entier déjà en unités**
  (pieds / degrés) : garder tel quel en float, **pas** de `/256`.
- Opérande stockée **brute** dans un champ `+0x..` ensuite utilisé avec de
  la maths 24.8 → **réel = brut / 256** : convertir **au décodage**, jamais
  au runtime.
- Les compteurs de durée (`obj+0xA0`, `obj+0x8E`, holds) : convertir en
  **secondes** au chargement (`/256`), cf. §6.3.

### 6.3 Pas de temps — une mise à jour par frame, pilotée par `dt`

L'original avance par tick fixe `dword_70458/256` s (calibré ~25 fps) :
`champ += taux · dword_70458/256` par tick, **un tick par frame**.

Port : **règle de trois** → ramener les taux « par seconde », puis
`champ += taux · dt` chaque frame. Les 256 s'annulent exactement (le
facteur se simplifie à 1 quand on est en float, échelle 1:1).

- **Pas d'interpolation de positions**, pas d'accumulateur de sous-pas,
  pas de fixed-timestep séparé. Une frame = un tick. « On reste bête. »
- `step_scale = dt` ; les compteurs sont en secondes (convertis au load).

### 6.4 Annulation catastrophique float32 (jitter)

Aux coordonnées monde ~`1e5`, l'ULP d'un float32 vaut ~`0.015`.
`Camera::lookAt` recalcule la direction par `position − lookAt` : un point
de visée à **1 unité** donne ~2 % d'erreur de direction → jitter par
frame.

**Fix** : projeter le point de visée **10000 unités** devant
(`out_aim = position + forward · 10000.0f`). L'erreur relative retombe à
~`1e-6`. (cf. `SCCameraSequence::refreshOutputs`.)

### 6.5 Matrices

- libRealSpace : `Matrix` 4×4, `transformPoint(v) = v · M`, `Multiply` =
  pré-multiplication.
- Pour que le lacet soit la rotation **extérieure** (tangage constant quel
  que soit le cap) : appliquer **Y (yaw) puis X (pitch) puis Z (roll)**
  (cf. `SCCameraSequence::buildOrientation`).
- Angles en **degrés** directement (l'ASM travaille en degrés `<<8`).

### 6.6 Contraintes de style (rappel)

Pas de lambda (`std::bind`) ; tout corps `if`/`for`/`while` entre `{}` ;
une instruction par ligne ; conversion 24.8 → float **au décodage**, pas
au runtime ; s'adapter à libRealSpace (Matrix 4×4, OpenGL Y-up).

---

## 7. Récapitulatif — activation d'une caméra

| déclencheur                    | mécanisme                                                                     |
|--------------------------------|----------------------------------------------------------------------------|
| **F1** (cockpit)               | `Mission_TriggerEvaluator` → `Kneeboard_SelectByStateCode(0x59CD, 4)`         |
| **F2** (chase)                 | idem → code `3` + libellé "Chase Plane" (§4.1)                              |
| **F6** (external)              | idem → code `8` + "External View"                                          |
| **F7** (target)                | idem → code `9` + "Target View"                                            |
| **TAKEOFF** (décollage)        | seg009, état de vol, `Kneeboard_SelectByID(0x59CD, "TAKEOFF")` quand `entité[+0x11] == word_722E6` |
| **AUTOPILT**                   | `UIScript_ParseAndEvaluate_7A054` (ovr233) → `SelectByID("AUTOPILT")` + `Camera_DetachParent(word_72A8F)` + reset `word_7046E`/`dword_70468`/`byte_7046C` |
| **script mission** (VM)        | `Expr_VM_OpcodeHelperA_53504`, opcode VM `+0xA38` : `Kneeboard_FindByID` + `Kneeboard_ApplySelection` |
| **fin de séquence COMP**       | opcode `FE` → `word_72A8C = Kneeboard_FindByID(0x59CD, "<vue>")` → enchaîne  |

Dans tous les cas, `Kneeboard_ApplySelection` (`sub_23CCC`) :
`manager[+0x12] = word_72A8F = entrée` ; `Cockpit_PanAzimuthUpdate` →
`Camera_PanTransitionController` (pan doux, seuil `0x100`) ;
`ancienne->vt50[0x04]()` (stop) ; `entrée->vt50[0x14]()` → `manager[+0x11]`
(code d'état) ; `entrée->vt50[0x10]()` (start).

---

## 8. Fonctions & globales clés

### Chargement

| adresse / nom                              | seg    | rôle                                        |
|--------------------------------------------|--------|--------------------------------------------|
| `Cinematic_LoadCameraDef` (`sub_23E7D`)    | seg041 | parseur du `FORM CAMR`                      |
| `MissionLoader_LoadEntitiesMain_A767F`     | seg455 | parseur du `FORM WRLD`                      |
| `MissionLoader_LoadChunkA_A7C8E`           | seg455 | appelle `Cinematic_LoadCameraDef`          |
| `Cinematic_CamEntryConstruct_CHAS_856F3`   | ovr246 | ctor entrée CHAS (vtable `0x79C`)          |
| `Cinematic_CamEntryConstruct_CKPT_859C7`   | ovr246 | ctor entrée CKPT (vtable `0x778`)          |
| `HUDSymbol_ConstructAndInitAngleG_85790`   | ovr246 | init des champs de l'entrée depuis payload  |
| `HUDSymbol_Helper14_853B0`                 | ovr246 | lie l'entité sujet par nom (`entrée+0x89`) |

### Registre / sélection

| adresse / nom                              | seg    | rôle                                        |
|--------------------------------------------|--------|--------------------------------------------|
| liste `0x59CD`                             | —      | registre des vues (LinkedListB)            |
| `Kneeboard_SelectByStateCode` (`sub_23C82`)| seg041 | sélection par code d'état (F-keys)          |
| `Kneeboard_SelectByID` (`sub_23C4F`)       | seg041 | sélection par nom 8 c (TAKEOFF/AUTOPILT/…) |
| `Kneeboard_FindByID`                       | seg041 | recherche par nom (opcode `FE`, VM)        |
| `Kneeboard_ApplySelection` (`sub_23CCC`)   | seg041 | applique la sélection, pilote la vtable    |
| `Mission_TriggerEvaluator` (`sub_22F53`)   | seg040 | dispatch clavier (F1..F7)                   |

### Calcul par frame

| adresse / nom                              | seg    | rôle                                        |
|--------------------------------------------|--------|--------------------------------------------|
| `View_RenderFrame_2DF0D` (`loc_2DF0D`)     | seg065 | tick de rendu de la vue active (`word_72A8F`) — présent dans TOUTES les vtables d'entrées caméra |
| `Camera_OrbitTrackCompute_1493A`           | seg014 | **orbite/suivi : ROTA, base probable de CHASE/TARGET** (§4bis) |
| `Camera_AttachedNoOffsetCompute_14867`     | seg014 | vue collée au sujet, sans offset (§4bis) |
| `Camera_Entry_GetSubject_14859`            | seg014 | getter trivial `return si[+0x89]` (sujet lié) |
| `loc_1519E`                                | seg015 | **placement de l'œil COCKPIT** (F1 + regards F3/F4/F5, §3bis) — PAS la chase |
| `Cockpit_ApplyViewRecord_84EC0`            | ovr245 | applique un record de la table de vues cockpit (§3bis) |
| `Cockpit_LoadViewTable_86B53`              | ovr249 | charge la table de vues cockpit (`OBJECTS\*.IFF CKPT/INFO`, §3bis) |
| `AI_ManeuverSolutionMain_781D0`            | ovr232 | **interpréteur COMP** (§5)       |
| `Camera_CopyState_2DE6D`                   | seg065 | snapshot d'état caméra                      |
| `Camera_UpdateViewportClip_2E6CB`          | seg065 | rect de clipping du viewport               |
| `Camera_ComputeViewMatrix_2E2AC`           | seg044 | construit la matrice de vue finale (fin de `loc_1493A`) |
| `Cockpit_PanAzimuthUpdate` / `Camera_PanTransitionController` | — | transition pan douce (seuil `0x100`) |
| `Matrix_BuildAxisZ/X/Y_572BC/56EC3/570C5`  | seg116 | composition d'axes (opcode `11` ; rotation d'orbite ROTA) |
| `AI_ComputeGeometryHelper_56E29`           | —      | copie de matrice 3×3 (opcode `10` ; `loc_14867`) |

### Constructeurs d'entrées caméra & tags de vtable `+0x50`

| type | ctor | seg | payload | tag `+0x50` final |
|------|------|-----|---------|-------------------|
| CHAS | `Cinematic_CamEntryConstruct_CHAS_856F3` | ovr246 | 0x30 o (§2.3) | `0x79C` |
| CKPT | `Cinematic_CamEntryConstruct_CKPT_859C7` | ovr246 | 0x24 o | `0x778` |
| TARG | `sub_847DB` (ex-`HUDSymbol_ConstructVariantI`) | ovr244 | 0x24 o (comme CHAS) | `0x6CF` |
| ROTA | `sub_83C4D` (ex-`HUDSymbol_ConstructVariantG`) | ovr244 | 0x24 o | `0x6A2` (vtable @ seg339 `0x6D712`) |
| COMP | `AIManeuver_LoadFormationDataB_77FCA` | ovr232 | script (§5) | `0x460` |

Base seg339 pour résoudre un tag : `vtable = 0x6D070 + tag` (vérifié `0x228A→0x6F2FA`, `0x6A2→0x6D712` ; **échoue** pour `0x6CF` → 0x6D73F impair, donc la relation n'est pas universelle — fixups VROOMM).

### Globales

| symbole        | rôle                                                                    |
|----------------|----------------------------------------------------------------------|
| `word_72A8F`   | **entrée de vue active** (= `manager[+0x12]`) ; position caméra `+0x14/18/1C` |
| `word_72A8C`   | vue suivante en file (posée par l'opcode `FE`)                       |
| `word_722E6`   | entité joueur courante (comparaisons `si == word_722E6`)             |
| `word_72A94`   | buffer texte des libellés de vue ("Chase Plane"…)                    |
| `byte_722D1`   | scancode courant / « sauter la cinématique »                        |
| `dword_70454`  | source du pas de temps (défaut `0x1900` = 6400)                     |
| `dword_70458`  | pas de temps par frame (accel/rotation) = `(0x100<<8)/dword_70454`  |
| `dword_7045E`  | pas de temps pour la vitesse linéaire (dérivé)                      |
| `word_72352`   | type de périphérique d'entrée (posé 1× à 2) — **pas** un sélecteur de vue |
| `word_72350`   | idem (config schéma de contrôle) — **pas** un sélecteur de vue      |

---

## 9. État & questions ouvertes

**Solide (cité, vérifié) :**
- Parsing `FORM CAMR` complet (§2), layout des sous-chunks, registre,
  activation (§4.1 / §7).
- Jeu d'opcodes `COMP` complet (§5.2), champs objet, interpréteur par
  frame, `STARTCAM` décodé et rejoué dans le port.
- Table de vues **cockpit** (`OBJECTS\*.IFF CKPT/INFO`) décodée sur le F-16
  (§3bis) : œil pilote `(0, 7.875, 1.5625)` pieds, directions F3/F4/F5.
- **Caméra orbitale `Camera_OrbitTrackCompute_1493A`** (§4bis, seg014
  propre) : `targetPos = subject.pos − distance · (orbitMat · rangée_orient)`,
  position lissée `+= diff/4` par frame, look-at sujet, orbite tournée par
  l'input. **Modèle probable de CHASE/TARGET.**
- Tags de vtable des entrées caméra (§8).

**À confirmer / approfondir :**
1. **CHASE = `loc_1493A` : CONFIRMÉ.** L'init des distances est trouvée :
   `Camera_OrbitReset_85878` (§4bis) pose `si[+0xAF] = subject[+0x20] × 2`
   (recul), `si[+0xB7] = subject[+0x20]` (min), `si[+0xB3] = subject[+0x20]
   × 4` (max). Reste à **identifier `subject[+0x20]`** (champ dword du
   WorldObject avion = `parent[+8][+0x10]` ; probable rayon englobant /
   taille) et sa **valeur pour le F-16**.
2. Signe de `z` dans le remap d'axes (`compToVec3`) — à valider sur un cas
   réel de trajectoire.
3. `loc_1493A` : `sub_58768` (transforme l'axe par `si+0x8B`) et
   `sub_2E08B` — sémantique exacte ; ordre des rangées de la matrice
   d'orientation du sujet (`R[+0x0C/+0x10/+0x14]` = quelle rangée ?).
4. Le cluster **seg085/086/087** (`Camera_ComputeMountedPosition_3D31D`,
   intégrateur `cam.pos += v_mount·dt`) : caméra distincte (arme / missile /
   replay ?) ou chemin alternatif ? `cam[+0x12]` n'est jamais posé en
   absolu (offset relatif au mount ? accumulateur de force ?).
5. `loc_1519E` branche « verrou cible » (padlock) : `subject[+0x5A]`
   (point de référence) et `di[+0x60]` (seuil) — non essentiels pour CHASE.
6. `AI_ManeuverSolutionMain_781D0` : opcodes `0x0D` (rampe) et `0x0F`
   (approche) — formules exactes à re-vérifier pour un rejeu parfait de
   TAKEOFF/LANDING.
7. **TARGET (F7) reste non identifiée.** Tag vtable confirmé `0x6CF`
   (constructeur `sub_847DB`, §8), mais résolution du tag vers sa vraie
   fonction (slot `[0x14]` équivalent à `loc_1519E`/`loc_1493A`) en échec —
   arithmétique `base+tag` invalide pour ce tag précis (§8). Ce **n'est
   pas** « Eye on Target » (§4.6, touche Y, confirmé par Rémi comme une
   caméra séparée) ni le cluster seg085/086/087 (§4.5, corrigé 2026-09-12 —
   probable arme/missile/replay). À rouvrir avec une autre technique
   (dépouillement de la table de fixup VROOMM du stub244, ou trace runtime
   côté Rémi si le jeu tourne sous débogueur).
