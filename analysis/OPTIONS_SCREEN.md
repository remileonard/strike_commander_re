# Panneau CONFIGURATION du vol (ALT+O, STRIKE.EXE)

Lu le 2026-11-03 dans `analysis/annotated_segments/seg047_annotated.asm` (touches),
`ovr267_annotated.asm` (panneau) et `ovr266_annotated.asm` (dessin, sauvegarde). Les chaînes du
segment de données (noms de fichiers) ne sont pas dans les fichiers annotés : elles ont été lues dans
`source/strike.asm`, autour de `aMainopt`. Valeurs en décimal.

![Panneau CONFIGURATION](options_images/mainopt.png)

Image composée avec `FONTS\MAINOPT.SHP` aux positions du code, sur fond noir, avec
`PALETTE\PALETTE.IFF` : la fonction du panneau ne charge aucune palette ; dans le jeu, le panneau est
dessiné par-dessus l'image figée du vol.

## 1. De la touche au panneau : `Input_AltKeyCommands_26F7E`

Fonction des touches ALT du vol (ancien nom `Config_ReadCalibration`, faux), appelée par les boucles
de vol.

1. Si `byte_6E345` est posé, elle ne fait rien.
2. Elle lit l'événement clavier ; le code de la touche est dans `byte_722D1`.
3. Elle exige **ALT** enfoncé, **sans MAJ ni CTRL** (deux sources : les bits de l'événement
   `byte_722D3` quand `byte_722D0` = 1, sinon l'état des touches gauche et droite).
4. Aiguillage sur le code de la touche (codes clavier du PC) :

| Touche | Code | Effet |
|---|---|---|
| ALT+O | 24 | coupe les effets sonores, **ouvre le panneau CONFIGURATION** ; au retour, relance ou arrête la musique si son interrupteur a changé dans le panneau |
| ALT+S | 31 | effets sonores marche / arrêt |
| ALT+J | 36 | pour chaque manette présente (0 et 1), une fonction de manette pas encore nommée (relais `VROOMM_StubThunk_6B745`) |
| ALT+X | 45 | `Input_CalibrationHandler` ; s'il rend vrai, fin demandée (`byte_6E345` = 1) |
| ALT+M | 50 | musique marche / arrêt |

Ouverture du panneau (cas 24) :

```
mov     al, byte_7236B          ; musique active avant le panneau
mov     [bp+var_7], al
call    SoundFX_StopAll_5AA95
push    5240h                   ; structure de configuration (DGROUP 21056)
call    VROOMM_StubThunk_6B7F0  ; → Options_ConfigurationScreen_90D20
```

La structure de configuration (DGROUP 21056) est celle que le bouton SAVE écrit dans `OPTIONS.CFG`.

## 2. Le panneau : `Options_ConfigurationScreen_90D20`

Ancien nom `Cockpit_LoadAndInitFull_90D20`, faux : rien ne vient de `COCKPITS`.

### 2.1 Ouverture

- `Cockpit_PanAzimuthUpdate` sur l'objet DGROUP 21530 avec la valeur 256 (rôle non établi).
- **Image du vol mise de côté** : `UI_ApplyEncodingHelper_5E576` copie l'écran (`word_70E62`) dans un
  tampon (DGROUP 20886) ; le sens de la copie est déduit de l'ordre des arguments, qui s'inverse au
  dessin (fonction de copie non lue). Quand `byte_721F0` = 2, le code passe à la place par
  `EMS_MapPage` et des appels `int 15h` (AX = 4617) : rôle de ce mode non établi.

### 2.2 Construction (à chaque ouverture et retour de sous-écran)

- Charge `FONTS\MAINOPT.SHP` (chaînes « FONTS », « mainopt », « .shp ») : 28 images.
  - image 0 : bandeau du titre « CONFIGURATION » (310 × 31) ;
  - image 1 : panneau des boutons (310 × 99) ;
  - images 2 à 27 : les 13 boutons, chacun en image normale puis image enfoncée.
- Fenêtre (0, 0)-(319, 199), puis 13 boutons, chacun avec un rectangle, une image, une variable
  mise à 1 par un clic :

| Bouton | Position | Taille | Images | Effet |
|---|---|---|---|---|
| DETAIL | (36, 61) | 66 × 11 | 2, 3 | sous-écran `Options_DetailScreen_91D29` (`DETLOPT.SHP`) |
| FLIGHT | (106, 61) | 66 × 11 | 8, 9 | sous-écran `Options_FlightScreen_90097` (`FLITOPT.SHP`) |
| GAMEPLAY | (36, 74) | 66 × 11 | 4, 5 | sous-écran `Options_GameplayScreen_92E60` (`GAMEOPT.SHP`) |
| COCKPIT | (106, 74) | 66 × 11 | 10, 11 | sous-écran `Options_CockpitScreen_93295` (`COCKOPT.SHP`) |
| CAMERAS | (36, 87) | 66 × 11 | 6, 7 | sous-écran `Options_CamerasScreen_93BA5` (`CAMROPT.SHP`) |
| AUDIO | (106, 87) | 66 × 11 | 12, 13 | sous-écran `Options_AudioScreen_9416A` (`AUDIOPT.SHP`) |
| ROOKIE | (211, 61) | 66 × 11 | 14, 15 | réglages du niveau `Options_PresetRookie_91B2C` (§ 2.4) |
| VETERAN | (211, 74) | 66 × 11 | 16, 17 | réglages du niveau `Options_PresetVeteran_91AE9` |
| ACE | (211, 87) | 66 × 11 | 18, 19 | réglages du niveau `Options_PresetAce_91AA6` |
| SAVE | (18, 114) | 48 × 11 | 20, 21 | `Options_SaveConfig_8FB73` : écrit `OPTIONS.CFG` |
| DEFAULT | (73, 114) | 59 × 11 | 22, 23 | `Options_LoadDefaults_8FD2A` : relit `OPTDFLT.CFG` et applique |
| EXIT | (139, 114) | 49 × 11 | 24, 25 | ferme le panneau |
| EXIT GAME | (211, 114) | 66 × 11 | 26, 27 | sous-écran `Options_ExitGameScreen_9277C` (`RESTART.SHP`) ; son résultat décide la fermeture |

Création d'un bouton (le premier, DETAIL) :

```
push    large 0B0042h           ; taille : 66 × 11
push    large 3D0024h           ; position : (36, 61)
push    ax
call    VROOMM_StubThunk_6C76C
...
mov     word ptr [di+28h], 2    ; image normale
lea     ax, [bp+var_12+2]
mov     [di+2Ah], ax            ; variable mise à jour par le clic
mov     word ptr [di+2Ch], 1    ; valeur écrite
mov     word ptr [di+2Eh], 3    ; image enfoncée
```

### 2.3 Dessin et boucle

À chaque tour, `Options_DrawPanel_8FA4C` :
1. recopie l'image du vol mise de côté à l'ouverture ;
2. dessine l'image 0 en (5, 4) (`push large 40005h`) ;
3. dessine l'image 1 en (5, 39) (`push large 270005h`) ;

puis la fenêtre dessine les 13 boutons par-dessus.

La souris est lue avec `Input_GetCalibratedXValue_67481` (x divisé par 2 : la souris compte de 0 à
639) et `Input_GetCalibratedYValue_67499`.

Après un clic :
- ROOKIE, VETERAN, ACE : réglages appliqués, le panneau reste ouvert ;
- un sous-menu, SAVE ou DEFAULT : le panneau se ferme, l'action est jouée, puis le panneau est
  reconstruit (`MAINOPT.SHP` rechargé) et rouvert ;
- EXIT : fin ;
- EXIT GAME : fin si l'écran de `RESTART.SHP` le décide.

### 2.4 Niveaux ROOKIE, VETERAN, ACE

Chaque bouton écrit des valeurs fixes dans la structure de configuration ; le rôle de ces champs n'a
pas été établi (l'écran GAMEPLAY, qui les montre sans doute, n'est pas lu).

| Champ | ROOKIE | VETERAN | ACE |
|---|---|---|---|
| +100 | 0 | 1 | 1 |
| +101 | 1 | 1 | 0 |
| +102 | 0 | 1 | 1 |
| +104 | 1 | 0 | 0 |
| +105 | 1 | 1 | 0 |
| +106 | 1 | 1 | 0 |
| +107 | 1 | 0 | 0 |
| +108 | 1 | 0 | 0 |
| +109 | 1 | 1 | 0 |
| +110 | 1 | 0 | 0 |
| +111 (mot) | 2 | 1 | 0 |
| +115 | 1 | 1 | 0 |
| +116 | 0 | 1 | 1 |
| +117 | 0 | 1 | 1 |

### 2.5 Fermeture

`Cockpit_ReadControlsFrame_8F720` (applique les réglages : manettes, souris, et
`PilotProfile_RescaleSkillByDifficulty_12FC9` sur les objets du monde), `TextScrollDisplayB_ApplyHelperD_67F60`,
`Cockpit_ApplyEncodingWrapper_8FB2A`, puis `Kneeboard_ProcessSelected` (DGROUP 22989).

## 3. Points ouverts

- Les sept sous-écrans (`Options_*Screen_*`, 470 à 1 017 lignes chacun) ne sont pas lus.
- Rôle des champs écrits par ROOKIE, VETERAN, ACE.
- Mode `byte_721F0` = 2 (pages EMS et `int 15h` à l'ouverture et au dessin).
- Classe des boutons et de la fenêtre (relais `VROOMM_StubThunk_6C76C`, `6C969`, `6C95A`…) : les noms
  actuels de leurs cibles (`PaletteScreen_*`, `GaugeWidget_*`) viennent d'un inventaire rapide et ne
  correspondent pas à cet usage.

## 4. Sous-écran DETAIL : `Options_DetailScreen_91D29`

Lu le 2026-11-03 (`analysis/annotated_segments/ovr268_annotated.asm`). Fichier d'images
`FONTS\DETLOPT.SHP` (52 images). Image composée avec les images aux positions du code, sur fond noir :
`options_images/detlopt.png`.

![Sous-écran DETAIL](options_images/detlopt.png)

- **Titres et libellés des colonnes** (DETAIL, TERRAIN, OBJECTS, HAZING, HI, LO, FAR, NEAR) : dans
  l'image 1 ; le rendu, sans police, les montre.
- **Boutons** (paires normale / enfoncée) :

| Bouton | Position | Taille | Images |
|---|---|---|---|
| GOURAUD (terrain) | (22, 67) | 73 × 11 | 2, 3 |
| TRANSITION | (22, 80) | 73 × 11 | 4, 5 |
| INTEREST | (22, 93) | 73 × 11 | 6, 7 |
| RIVERS | (22, 106) | 73 × 11 | 8, 9 |
| FIELDS | (22, 119) | 73 × 11 | 10, 11 |
| CITIES | (22, 132) | 73 × 11 | 12, 13 |
| RUNWAYS | (22, 145) | 73 × 11 | 14, 15 |
| GOURAUD (objets) | (226, 67) | 73 × 11 | 26, 27 |
| TEXTURE | (226, 80) | 73 × 11 | 28, 29 |
| EXIT | (244, 132) | 38 × 11 | 24, 25 |

- **Cases** : les images 16 à 25 font 13 × 12 ; elles servent aux cases HI, LO (3 cases) et HAZING
  (5 cases, entre FAR et NEAR). Le code qui choisit quelle image de la paire montrer n'est pas lu.
- **Jauges** : deux widgets de jauge (`GaugeWidgetVariantD_ConstructAndInit_A4270`) aux positions
  (243, 93) et (127, 159). Leur rôle n'est pas établi.
- **Zone noire au centre** : sur le rendu, c'est l'emplacement de l'aperçu ; elle n'est pas une image
  du fichier. Le code qui la dessine n'est pas lu.
- **Dessin** : `Cockpit_ApplyFormatAndDraw_91B70` (nom actuel, non lu) appelle `TextRenderer_ApplyFormatChange_5E34D`,
  donc du texte peut être dessiné avec la police à cet endroit. Ce qu'elle écrit n'est pas établi.
