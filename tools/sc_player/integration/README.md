# RSMusic / RSMixer pour libRealSpace

Ce sont les versions de `RSMusic` et `RSMixer` de libRealSpace qui utilisent le moteur de
`../librealspace/`. **Leur API est identique à celle d'avant** ; quelques fonctions sont ajoutées.

## Installation

1. Copier `../librealspace/*` dans libRealSpace, ainsi que `third_party/Nuked-OPL3/opl3.c` et `opl3.h`
   (Nuked-OPL3 est en C ; `opl3.h` a ses propres gardes `extern "C"`).
2. Remplacer `realspace/RSMusic.*` et le `RSMixer.*` existant par ceux de ce répertoire.
3. Retirer `Mix_ADLMIDI_setCustomBankFile` et `assets/STRIKE.wopl` : ils ne servent plus.
   La banque d'instruments est maintenant `DATA\SOUND\STRIKE.AD`, celle du jeu.

## RSMusic : un utilitaire de chargement

`RSMusic` charge n'importe quel fichier de musique, **avec ou sans `.dat`** : c'est le consommateur
qui choisit. Le jeu construit lui aussi ses chemins ainsi : `SOUND\<nom>.dat` et `SOUND\<nom>.adl`, et
l'enregistrement `i` du `.dat` va avec l'entrée `i` du `.adl` (`AudioQueue_ProcessMain_AA84E`,
`analysis/MUSIC_SYSTEM.md` §2.1).

```cpp
// sans .dat : pistes jouees seules
std::vector<RSMusicSet *> sets = music->LoadMusicFile("..\\..\\DATA\\SOUND\\GAMEFLOW.ADL");
// avec .dat : transitions (pistes de liaison, matrice, longueurs de phrase)
std::vector<RSMusicSet *> sets = music->LoadMusicFile("..\\..\\DATA\\SOUND\\XXX.ADL",
                                                      "..\\..\\DATA\\SOUND\\XXX.DAT");
music->SetBank(5, sets[0]);   // la banque 5 sert ce jeu ; RSMixer::playMusic suit ses transitions
```

- **Structure lue** :
  - entrées de premier niveau qui sont des pistes (`FORM`) : un seul jeu, une piste par entrée
    (AMUSIC.PAK) ;
  - sinon, un jeu par entrée de premier niveau. Si son entrée 0 est une archive et les suivantes
    des pistes, c'est la structure de COMBAT.ADL : [0] pistes de liaison, [1..N] pistes principales.
    Sinon, toutes les séquences `FORM` trouvées dans ses sous-archives.
- **`RSMusicSet`** :
  - `tracks` : les pistes principales (`MemMusic`) ;
  - `data` : le `SCMusicSet` (pistes, liaisons, données du `.dat`) ;
  - `hasDat` : les transitions sont disponibles. Il faut un `.dat` lisible **et** la structure à
    pistes de liaison. Sinon un message le signale, et le jeu reste jouable sans transitions.
- **`SetBank(banque, jeu)`** : `GetMusic` sert les pistes du jeu ; `GetMusicSet` renvoie ses
  transitions si `hasDat`, ce qui fait passer `RSMixer::playMusic` par le séquenceur.
- **`music_files[nom]`** : les jeux déjà chargés, par nom de fichier.
- **`LoadTimbres(fichier)`** : la bibliothèque de timbres (STRIKE.AD).
- **`init()`** n'est plus que la configuration de Strike Commander. Chaque fichier y est déclaré
  avec ou sans `.dat` ; en ajouter un, c'est une ligne :
  - banque 0 : AMUSIC.PAK, sans `.dat` ;
  - banque 1 : GAMEFLOW.ADL, sans `.dat` (toutes ses pistes, comme avant) ;
  - banque 2 : COMBAT.ADL avec COMBAT.DAT ;
  - SOUNDFX.ADL, sans `.dat` (effets, `soundfx_musics`).
- Les tables existantes (`midgames_musics`, `gameflow_musics`, `combat_musics`, `soundfx_musics`,
  `musics`) sont remplies comme avant.
- Corrigés au passage : `subpak->GetEntry(k)` au lieu de `subsubpak->GetEntry(k)`, les pistes
  principales en `'F'` sautées dans COMBAT, et SOUNDFX.ADL ouvert avec les données de COMBAT.ADL.
- Les `PakArchive` sont créés par `new` et jamais libérés, comme dans la version d'origine : je ne
  sais pas si leur destructeur libère le tampon qu'on leur passe. Les pistes sont recopiées, donc les
  libérer ne poserait pas de problème si ce n'est pas le cas.

## RSMixer : ce qui change

- La musique ne passe plus par `Mix_PlayMusic` + ADLMIDI. Elle passe par `Mix_HookMusic` :
  - le séquenceur du jeu tourne à 20 Hz ;
  - le pilote XMIDI tourne à 120 Hz ;
  - la partie voix du pilote AdLib écrit dans Nuked-OPL3 ;
  - le son est rendu à la fréquence que renvoie `Mix_QuerySpec`. Les formats S16 et F32 sont gérés, en mono ou en stéréo.
- `setVolume(v, -1)` applique le gain dans le crochet, car `Mix_VolumeMusic` n'agit pas sur `Mix_HookMusic`.
- Les VOC (`playSoundVoc`, `stopSound`…) ne changent pas.
- **RSMixer ne connaît pas les évènements de combat.** Il joue la piste demandée, avec la
  transition du `.dat` si elle existe :
  - `playMusic(index)` dans une banque qui a un `.dat` (un jeu chargé avec son `.dat` et donné
    à la banque par `RSMusic::SetBank` ; dans `init()`, la banque 2 = COMBAT.ADL + COMBAT.DAT) : le changement attend la barre de mesure suivante, puis passe
    par la piste de liaison que donne COMBAT.DAT (`Music_RequestTune_5A984`). `loop` est ignoré :
    les pistes bouclent d'elles-mêmes (FOR/NEXT XMIDI) ;
  - `playMusic(index, loop)` dans une autre banque : la piste joue seule. -1 = sans fin, n = n fois ;
  - `playMusic(MemMusic*, loop)` : même règle, selon que la piste appartient ou non à une banque avec `.dat` ;
  - `stopMusic(fade = false)` : `fade` = fondu d'une seconde (`Music_StopWithFade_AB1EF`) ;
  - `getMusicID()` : la piste qui joue réellement, ou `UINT32_MAX` si elle s'est terminée (une
    ponctuation, par exemple) ou si la musique est arrêtée ;
  - rien d'autre que le `.dat` : pas de retour automatique après une ponctuation, pas d'« ennemi
    proche ». La mission demande elle-même la piste suivante.
  
  Choisir la piste selon la situation (ennemi proche, dégâts, éjection, reprise après une
  ponctuation…) reste le travail de la mission dans libRealSpace (`analysis/MUSIC_SYSTEM.md` §4.4 et §5).
- Une seule musique joue à la fois.
- **Évènements**, pour que le jeu réagisse (reconnaître une ponctuation, demander la piste
  suivante). `RSMixer` ne sait pas ce que représente une piste : il signale, la mission décide.
  - `bool pollMusicEvent(SCMusicEvent &e)` : à appeler dans la boucle de jeu, jusqu'à `false`.
    Le séquenceur tourne dans le fil audio, d'où la file plutôt qu'un rappel. Elle garde au plus
    64 évènements.
  - `TRANSITION_STARTED` : la barre est atteinte, la piste de liaison du `.dat` démarre
    (`track` = piste demandée, `fromTrack` = piste quittée, `link` = liaison, `measure` = mesure).
  - `TRACK_STARTED` : la piste demandée démarre (`fromTrack` = précédente, -1 au départ).
  - `TRACK_FINISHED` : une piste qui ne boucle pas vient de se terminer.
  - `MUSIC_STOPPED` : arrêt effectif (`stopMusic`, fin du fondu, ou autre musique lancée).
  - Une piste isolée (banque sans `.dat`) donne aussi `TRACK_STARTED`, `TRACK_FINISHED` et
    `MUSIC_STOPPED` (`track` = index dans la banque, -1 si inconnu).
  - État courant : `getMusicID()`, `getRequestedMusicID()`, `isInTransition()`, `getMeasure()`.

  Exemple : reprise après une ponctuation, comme le jeu (`analysis/MUSIC_SYSTEM.md` §4.4). Le jeu
  redemande la piste mémorisée **dès que la ponctuation démarre** : elle joue donc jusqu'à la barre
  suivante, ou jusqu'à sa fin si elle est plus courte.

  ```cpp
  // au moment de demander une ponctuation (0x10 a 0x12) :
  resumeTune = mixer.getMusicID();   // + cas 5 -> 4, 8 -> 4 ou 0x13, 0x15 -> 0x13 (mission)
  mixer.playMusic(0x10);

  // a chaque frame :
  SCMusicEvent e;
  while (mixer.pollMusicEvent(e)) {
      if (e.type == SCMusicEvent::TRACK_STARTED && e.track >= 0x10 && e.track <= 0x12) {
          mixer.playMusic(resumeTune);
      }
  }
  ```
- Effets XMIDI : `playSoundFx(mus, volume)`, `setSoundFxVolume`, `stopSoundFx`, `isSoundFxPlaying` :
  - 5 canaux, comme le jeu (`SoundFX_FindFreeChannel_598A6`) ;
  - volume en pourcentage : le jeu donne `100 − distance/10` (`SoundFX_Play3D_59902`) ;
  - `stopSoundFx` n'envoie que des Note Off, comme `SoundFX_StopEffect_59A8A`.
- Le rendu tourne dans le fil audio. Toutes les fonctions prennent `engineMutex`.
- Le pilote gère 8 séquences : 1 piste isolée, 2 pour le séquenceur (piste principale et liaison), et 5 effets.

## Test

```sh
integration/test/run.sh /chemin/SOUND build
```

Le test compile `RSMusic` et `RSMixer` avec des substituts d'`AssetManager`, de `PakArchive` et de
`SDL_mixer_ext` (`test/stubs/`). Il charge un fichier avec un `.dat` par `LoadMusicFile`, le donne à la banque 5 par `SetBank`,
appelle `playMusic` avec 4 → 0x10 → 9 → 0x13, puis `stopMusic(true)`, et fait tourner le crochet
audio sur 60 s. Il compare ensuite le résultat au WAV de `sc_player`
dans le même scénario : **les deux sont identiques octet pour octet** sur les vrais fichiers (2026-10-10).
