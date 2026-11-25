# Effets sonores de Strike Commander et de Pacific Strike : inventaire, synthèse et numérique, déclencheurs

Relevé le 2026-11-25 dans `STRIKE.EXE` et `PACIFIC.EXE`, à la demande de Rémi. La musique est décrite à part
(`MUSIC_SYSTEM.md`). Les fichiers de sons ne sont pas dans ce conteneur : leur contenu (durées, nombre d'entrées réel)
n'a pas été contrôlé ; tout ce qui suit vient du code.

Vocabulaire :
- **synthèse** : un effet est une courte séquence XMIDI jouée par le pilote AdLib ou Roland, comme la musique ;
- **numérique** : un son échantillonné (VOC) joué par le pilote numérique (Sound Blaster), comme les voix ;
- **distance** : distance au point de vue en mètres, passée par l'appelant. Synthèse : volume `100 − distance / 10`
  sous 1000 m, 5 de 1000 à 5000 m, rien au-delà. « Non positionné » = distance 0 (volume 100).
- **vue cockpit** : `byte_72A8E == 4` (Strike Commander), `byte_7CEF8 == 4` (Pacific Strike).

---

## 1. Ce qui diffère entre les deux jeux

| | Strike Commander | Pacific Strike |
|---|---|---|
| Effets synthétisés | `SOUND\soundfx.adl` (ou `.rol`), 14 séquences (0 à 13) | `SOUND\soundfx.adl` (ou `.rol`), 27 séquences (0 à 26) |
| Canaux synthétisés | 5 | 1 |
| Effets numériques | aucun | `..\..\DATA\SOUND\DSOUNDFX.PAK`, 50 entrées décrites en dur dans le code |
| Voix numériques | alarmes « Betty » du cockpit, radio (`INTEL\SPEECH\*.PAK`) | radio (même lecteur que les effets numériques) |
| Choix entre les deux | — | le numérique d'abord ; la synthèse si l'effet n'a pas d'échantillon (§ 3.3) |

Les **numéros d'effets ne sont pas les mêmes** dans les deux jeux : le canon est l'effet 2 dans Strike Commander, le 1
dans Pacific Strike ; le train qui rentre est le 4 dans l'un, le 5 dans l'autre (tableau du § 4).

---

## 2. Strike Commander

### 2.1 Chargement et lecture

- `AudioQueue_LoadAndPlayEntry_AB592` ouvre `SOUND\soundfx` (`.adl` si `byte_70996 == 2`, `.rol` si 1) et charge
  les **14 premières entrées** (`cmp di, 0Eh`), chacune enregistrée comme séquence XMIDI avec ses timbres.
- L'effet n est l'entrée n (`SoundFX_Play3D_59902` : `imul ax, 0Ah` sur le numéro d'effet).
- Façades : `SoundFX_Play_5A8DC` (une fois), `SoundFX_PlayOrUpdate_5A906` (son tenu : démarre ou ajuste le volume),
  `SoundFX_Stop_5A95E`. Toutes ne font rien si les effets sont coupés (`byte_7236C`, touche Alt+S dans
  `Input_AltKeyCommands_26F7E` ; Alt+M coupe la musique).

### 2.2 Les effets

| Effet | Déclencheur | Fonction | Distance |
|---|---|---|---|
| 0 | aucun appel trouvé par recherche de motifs | — | — |
| 1 | lancement d'une arme (deux des cas de l'aiguillage par catégorie) | `WeaponSystem_LaunchFromStation_3E744` | caméra |
| 2 | canon : son tenu par tireur tant que la gâchette tire (bit 800h de l'état du point d'emport), arrêté sinon | `WeaponSystem_FrameUpdate_3F8C0` | caméra |
| 3 | explosion d'un objet détruit (chunk `EXPL` de son modèle) | `Object_SpawnDestructionEffects_3863A` | caméra |
| 4 | train qui rentre (joueur, vue cockpit, après 5 images) | `Aircraft_Update_3DEFB` | non positionné |
| 5 | train qui sort (mêmes conditions) | `Aircraft_Update_3DEFB` | non positionné |
| 6 | tonalité de recherche du missile : arme choisie de mode 1 avec munitions, sans accrochage | `Cockpit_WarningsAndSeekerTone_15FD3` | non positionné |
| 7 | tonalité d'accrochage (même arme, cible accrochée) ; 6 et 7 s'excluent | `Cockpit_WarningsAndSeekerTone_15FD3` | non positionné |
| 8 | lâcher d'une bombe | `WeaponSystem_ReleaseBomb_9E289` | caméra |
| 9 | impact d'une arme sur le joueur, en vue cockpit | méthode d'impact des armes (`loc_4DECF`, seg107) | non positionné |
| 10 | impact d'une arme ailleurs | même méthode | caméra |
| 11 | passage d'un avion à moins de 200 m, croisement de plus de 30° | `SoundFX_CheckFlyBy_59B10` | caméra |
| 12 | toucher des roues du joueur sur le terrain (contact accepté), en vue cockpit | `Aircraft_OnCollision_9D910` | non positionné |
| 13 | moteur de l'avion suivi par la caméra, hauteur selon le cran de manette (`MUSIC_SYSTEM.md` § 7.1) ; **seulement si la musique est coupée** (`cmp byte_7236B` / `jz` dans `SoundFX_Tick_59CFA`) | `SoundFX_Tick_59CFA` | caméra |

Les tonalités 6 et 7 sont aussi arrêtées par `SoundFX_StopSeekerTones_15138` (ex-`Resource_InitTwoChannels`) et
`UI_ContainerLifecycle`.

### 2.3 Les sons numériques : la voix « Betty » et la radio

Il n'y a pas d'effet numérique. Deux sortes de voix passent par `Speech_PlayClip_5AAD7` (objet `word_7099F`, actif si
`byte_7236D`) :

- **Betty**, `..\..\data\cockpits\betty.pak`, entrée n (`Cockpit_LoadBettyPack`), **seulement en vue cockpit**.
  Chaque alarme ne parle qu'une fois tant que sa condition dure (un drapeau par alarme).

| Entrée | Condition (`Cockpit_WarningsAndSeekerTone_15FD3`) |
|---|---|
| 0 | bit 6 de l'octet +117 de la dynamique JDYN de l'avion (rôle de ce bit non établi) |
| 0 | carburant inférieur au huitième de la capacité |
| 1 | un missile vise le joueur (missile dont la cible, champ +85, est le joueur) |
| 2 | valeur rendue par `Physics_ApplyGroundHeightConstraint` supérieure à 4, après 2 images (condition non élucidée) |

- **Radio** : `Audio_LoadSpeechClip` lit `INTEL\SPEECH\<nom>.PAK` pour les messages radio, avec le texte.

---

## 3. Pacific Strike

### 3.1 Quatre objets son

| Objet | Option | Rôle |
|---|---|---|
| `word_79E6F` | `byte_7CB19` | musique |
| `word_79E6D` | `byte_7CB1A` | effets synthétisés (`soundfx`, 27 séquences ; `cmp di, 1Bh`) |
| `word_79E71` | `byte_7CB1B` | voix et lecteur numérique |
| `word_79E73` | `byte_7CB1C` | effets numériques (table du § 3.2) |

`byte_7CB1B` et `byte_7CB1C` sont mis à 1 ensemble quand un pilote numérique est chargé. `byte_7CB1D` choisit le moteur
numérique (§ 3.4) ; où il est réglé n'a pas été trouvé.

### 3.2 La table des sons numériques

`DigitalSFX_Construct_5AE86` écrit en dur une table de 50 entrées. Le **rang** d'une entrée est le numéro de
l'échantillon :
- rangs 0 à 3 : banque 0 de `DSOUNDFX.PAK`, entrée = rang ;
- rangs 4 à 49 : banque 1, entrée = rang − 4 (`DigitalSFX_Tick_5B206`).

Les **variantes** d'un même effet sont des entrées voisines ; une est tirée au hasard à chaque fois
(`DigitalSFX_PlayEffect_5B04F`). Une entrée « lointaine » ne sert qu'au-delà de 1000 m, les autres en deçà.

| Rang | Effet servi | Boucle | Variante |
|---|---|---|---|
| 0 | 9 | non | proche |
| 1 | 8 | non | proche |
| 2 | 0 | non | proche |
| 3 | 1 | non | proche |
| 4 | 26 | non | proche |
| 5 | 5 | non | proche |
| 6 | 6 | non | proche |
| 7 | 7 | non | proche |
| 8 | 11 | non | proche |
| 9 | 18 | non | proche |
| 10 | aucun | non | — |
| 11 | 20 | non | proche |
| 12 | 21 | non | proche |
| 13 | 2 | non | lointaine |
| 14 | 3 | non | lointaine |
| 15 | 4 | non | lointaine |
| 16 | 2 | non | lointaine |
| 17 | 3 | non | lointaine |
| 18 | 4 | non | lointaine |
| 19 | 19 | non | proche |
| 20 | 15 | non | proche |
| 21 | 16 | non | proche |
| 22 | aucun | non | — |
| 23 | 23 | non | proche |
| 24 | 24 | non | proche |
| 25 | 25 | oui | proche |
| 26 | 10 | non | proche |
| 27 | 12 | oui | moteur en cockpit, cran 0 |
| 28 | 12 | oui | cran 1 |
| 29 | 12 | oui | cran 2 |
| 30 | 12 | oui | cran 3 |
| 31 | 12 | oui | cran 4 |
| 32 | 12 | oui | cran 5 |
| 33 | 12 | oui | cran 6 |
| 34 | 12 | oui | cran 7 |
| 35 | 12 | oui | cran 8 |
| 36 | 12 | oui | cran 9 |
| 37 | 12 | oui | cran 10 |
| 38 | 13 | oui | moteur vu de l'extérieur, cran 0 |
| 39 | 13 | oui | cran 1 |
| 40 | 13 | oui | cran 2 |
| 41 | 13 | oui | cran 3 |
| 42 | 13 | oui | cran 4 |
| 43 | 13 | oui | cran 5 |
| 44 | 13 | oui | cran 6 |
| 45 | 13 | oui | cran 7 |
| 46 | 13 | oui | cran 8 |
| 47 | 13 | oui | cran 9 |
| 48 | aucun | oui | (cran 10 de l'extérieur, d'après le calcul du rang : 38 + cran) |
| 49 | 22 | oui | proche |

Les entrées des moteurs sont choisies par le cran (§ 3.4), pas par le tirage au hasard.

### 3.3 Le complément entre numérique et synthèse

**Jouer un effet** (`SoundFX_Play_5EB62`, `SoundFX_PlayOrUpdate_5EBFB` pour un son tenu) :
```
si les sons numériques sont actifs et que la version synthétisée ne joue pas déjà :
    essayer le numérique (DigitalSFX_PlayEffect_5B04F)
si le numérique n'a rien joué :
    jouer la version synthétisée, et arrêter le numérique de cet effet
sinon (son tenu) :
    arrêter la version synthétisée
```
Le numérique ne joue rien, et la synthèse prend le relais, quand :
- l'effet n'a pas d'échantillon : effets **14 et 17** (aucune entrée), et effets **2, 3, 4 à moins de 1000 m**
  (seulement des variantes lointaines) ;
- la mémoire libre est sous 3 000 000 octets (`word_7974E`, posé au démarrage) : seuls les rangs 0 à 3 restent
  (effets 9, 8, 0 et 1) ;
- une voix parle ;
- **un seul canal numérique** : un échantillon de rang plus grand que celui en cours est refusé. Le rang est la
  priorité : impacts (9, 8) et armes de bord (0, 1) passent avant tout le reste.

`SoundFX_Stop_5ECE8` arrête l'effet des deux côtés. Les sons en boucle (moteurs, effets 22 et 25) sont relancés par
`DigitalSFX_Tick_5B206` quand le canal se libère.

### 3.4 Moteur et passage d'avion (`Sound_FrameUpdate_5F28E`, à chaque image)

- **Passage d'avion** : uniquement en numérique, effet **10**. `SoundFX_CheckFlyBy_5F005` rend 1 (croisement de plus
  de 80°) ou 2 (de 30 à 80°) ; la distance passée vaut 750 ou 1500 m, ce qui choisit la variante proche ou lointaine
  (seule une variante proche existe : rang 26).
- **Moteur** de l'avion suivi par la caméra :
  - si `byte_7CB1D` : numérique (`DigitalSFX_EngineTick_5B434`), rang 27 + cran en vue cockpit (effet 12), 38 + cran de
    l'extérieur (effet 13) ; avec plus de 4 500 000 octets libres (`byte_76D44`), le cran entendu rejoint le vrai cran
    un pas à la fois. S'il joue, la version synthétisée de l'effet 13 est arrêtée ;
  - sinon, ou si le numérique ne joue pas : moteur synthétisé (`sub_5C90D`, fonction pas encore nommée dont le corps
    manque dans le listing ; nom proposé `SoundFX_EngineTick_5C90D`), **seulement musique coupée**, comme dans Strike
    Commander ;
  - `byte_7CB1D` à 0 : l'effet 13 est arrêté des deux côtés.

### 3.5 Les effets

| Effet | Numérique (rangs) | Déclencheur | Fonction | Distance |
|---|---|---|---|---|
| 0 | 2 | mitrailleuse de tourelle, son tenu : tourelle du joueur (le joueur comme émetteur) | `sub_4103C` (fonction pas encore nommée : commande de la tourelle par les axes du joueur, tir ; nom proposé `Turret_PlayerControl_4103C`) | 256 m |
| 0 | 2 | autre tourelle, selon l'arme | `sub_403A8` (fonction pas encore nommée : tourelle d'un objet ; nom proposé `Turret_Update_403A8`) | caméra |
| 1 | 3 | canon de l'avion, son tenu par tireur ; arrêté quand le tir cesse | `sub_3E640` (fonction pas encore nommée : mise à jour du système d'armes ; nom proposé `WeaponSystem_FrameUpdate_3E640`) | caméra |
| 2 | 13 et 16 (lointaines) | explosion d'un objet détruit, sur la terre ferme | `sub_372E4` (fonction pas encore nommée ; nom proposé `Object_SpawnDestructionEffects_372E4`) | caméra |
| 2 | 13 et 16 (lointaines) | explosion `EXPLODE1` | `sub_3AE6E` (fonction pas encore nommée ; nom proposé `Explosion_Spawn_3AE6E`) | caméra |
| 2 | 13 et 16 (lointaines) | impact d'une arme sur le terrain | `sub_3FCDE` (fonction pas encore nommée ; nom proposé `Weapon_TerrainImpact_3FCDE`) | caméra |
| 2 | 13 et 16 (lointaines) | objet d'effet créé par `OP_SPAWN_EFFECT_ON_OBJ` (éclair de tir `GUNSPARK`) | `MissionScript_SpawnEffectOnObj_537DF` | caméra |
| 3 | 14 et 17 (lointaines) | aucun appel trouvé par recherche de motifs | — | — |
| 4 | 15 et 18 (lointaines) | aucun appel trouvé par recherche de motifs | — | — |
| 5 | 5 | train qui rentre (joueur suivi par la caméra, après 5 images) | `Aircraft_Update_3D7AE` | non positionné |
| 6 | 6 | train qui sort | `Aircraft_Update_3D7AE` | non positionné |
| 7 | 7 | lâcher d'une bombe | `WeaponSystem_ReleaseBomb_3F391` | caméra |
| 8 | 1 | le joueur reçoit des dégâts | `Aircraft_ApplyHitDamage_3D019` | non positionné |
| 8 | 1 | impact d'une arme sur le joueur, en vue cockpit | `Weapon_OnImpact_4E3C0` | non positionné |
| 9 | 0 | un autre avion reçoit des dégâts | `Aircraft_ApplyHitDamage_3D019` | non positionné |
| 9 | 0 | impact d'une arme ailleurs | `Weapon_OnImpact_4E3C0` | caméra |
| 10 | 26 | passage d'avion (numérique seulement) | `Sound_FrameUpdate_5F28E` | 750 ou 1500 m |
| 11 | 8 | toucher des roues du joueur sur le terrain, train sorti, vue cockpit (pas sur le pont du porte-avions : cette branche sort avant) | `Aircraft_ContactWithObject_3CA69` | non positionné |
| 12 | 27 à 37 | moteur, vue cockpit (numérique seulement) | `DigitalSFX_EngineTick_5B434` | — |
| 13 | 38 à 47 | moteur, vue extérieure ; synthèse quand le numérique ne joue pas | `Sound_FrameUpdate_5F28E` | — |
| 14 | aucun | aucun appel trouvé par recherche de motifs | — | — |
| 15 | 20 | gerbe d'eau : traçante qui touche l'eau | `Tracer_OnImpact_4F13B` | caméra |
| 15 | 20 | gerbe d'eau : objet qui touche le terrain au-dessus de l'eau (avec son objet de gerbe) | `sub_B049F` (fonction pas encore nommée ; nom proposé `Object_WaterImpact_B049F`) | caméra |
| 16 | 21 | explosion sur l'eau | `sub_372E4` | caméra |
| 16 | 21 | objet qui heurte le terrain au-dessus de l'eau | `sub_44A8A` (fonction pas encore nommée ; nom proposé `Object_TerrainImpact_44A8A`) | caméra |
| 17 | aucun | aucun appel trouvé par recherche de motifs | — | — |
| 18 | 9 | volets (le joueur suivi par la caméra) | `PhysicsTicks_4A8F4` | non positionné |
| 19 | 19 | commande clavier du joueur en vue cockpit (trois touches de `sub_11FDC`) | `sub_11FDC` (fonction pas encore nommée : commandes du joueur ; nom proposé `Player_KeyCommands_11FDC`) | 1000 m |
| 20 | 11 | seulement arrêté (émetteur = l'avion) après des dégâts, quand un système d'arme est détruit ; jeu non trouvé | `sub_3F8AD` (fonction pas encore nommée) | — |
| 21 | 12 | impact d'une traçante hors de l'eau | `Tracer_OnImpact_4F13B` | caméra |
| 22 | 49 | aucun appel trouvé (son en boucle) | — | — |
| 23 | 23 | aucun appel trouvé | — | — |
| 24 | 24 | autre tourelle, selon l'arme (variante de l'effet 0) | `sub_403A8` | caméra |
| 25 | 25 | aucun appel trouvé (son en boucle) | — | — |
| 26 | 4 | départ d'une roquette | `WeaponSystem_LaunchRocket_3F657` | non positionné |

« Aucun appel trouvé » : rien parmi les appels des trois façades et de `DigitalSFX_PlayEffect_5B04F` ; un appel avec
un numéro calculé, comme celui de `sub_403A8`, peut avoir échappé à la recherche.

---

## 4. Le même événement dans les deux jeux

| Événement | Strike Commander | Pacific Strike |
|---|---|---|
| Canon de l'avion | 2 | 1 |
| Mitrailleuse de tourelle | — | 0, ou 24 |
| Lancement d'une arme autre que bombe et canon | 1 (deux cas de l'aiguillage) | 26 (roquette) |
| Lâcher d'une bombe | 8 | 7 |
| Explosion d'un objet | 3 | 2 (terre), 16 (eau) |
| Impact sur le joueur | 9 | 8 |
| Impact ailleurs | 10 | 9 |
| Impact de traçante | — | 21 (terre), 15 (eau) |
| Train qui rentre | 4 | 5 |
| Train qui sort | 5 | 6 |
| Volets | — | 18 |
| Toucher des roues | 12 | 11 |
| Passage d'avion | 11 (synthèse) | 10 (numérique seulement) |
| Moteur | 13 (synthèse, musique coupée) | 12 (cockpit) et 13 (extérieur), numérique par cran ; synthèse 13 musique coupée |
| Tonalités du missile | 6 et 7 | — |
| Alarmes vocales | Betty (numérique) | — |

---

## 5. Pour libRealSpace

- **Numéros propres à chaque jeu** : une table d'effets par jeu (Strike Commander : 14 ; Pacific Strike : 27), pas de
  numéros partagés.
- **Pacific Strike** : le numérique d'abord, la synthèse si l'effet n'a pas d'échantillon (§ 3.3) ; un seul canal
  numérique, priorité au plus petit rang ; variantes tirées au hasard, proche ou lointaine selon 1000 m ; moteur par
  cran (§ 3.4).
- **Moteur synthétisé** : dans les deux jeux, seulement musique coupée.
- Rien n'est écrit dans libRealSpace : ce document est un relevé.
