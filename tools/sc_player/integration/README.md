# RSMusic / RSMixer pour libRealSpace

Ce sont les versions de `RSMusic` et `RSMixer` de libRealSpace qui utilisent le moteur de
`../librealspace/`. **Leur API est identique à celle d'avant** ; quelques fonctions sont ajoutées.

## Installation

1. Copier `../librealspace/*` dans libRealSpace, ainsi que `third_party/Nuked-OPL3/opl3.c` et `opl3.h`
   (Nuked-OPL3 est en C ; `opl3.h` a ses propres gardes `extern "C"`).
2. Remplacer `realspace/RSMusic.*` et le `RSMixer.*` existant par ceux de ce répertoire.
3. Retirer `Mix_ADLMIDI_setCustomBankFile` et `assets/STRIKE.wopl` : ils ne servent plus.
   La banque d'instruments est maintenant `DATA\SOUND\STRIKE.AD`, celle du jeu.

## RSMusic : ce qui change

- **COMBAT.ADL** est chargé avec sa vraie structure, vérifiée sur le fichier :
  - le fichier a une entrée par jeu de musique (le vrai fichier en a 1) ;
  - dans le jeu, l'entrée [0] est l'archive des 25 pistes de liaison ;
  - les entrées [1..22] sont les pistes principales.
  
  `combat_sets[i]` est le `SCMusicSet` complet (pistes, liaisons, matrice de `COMBAT.DAT`).
  `combat_musics[i]` et `musics[2]` contiennent les 22 pistes principales, dans l'ordre des numéros de piste.
- Deux bugs de l'ancienne version sont corrigés :
  - `subpak->GetEntry(k)` était lu au lieu de `subsubpak->GetEntry(k)` ;
  - les entrées en `'F'` étaient sautées, alors que ce sont justement les pistes principales.
- **SOUNDFX.ADL** :
  - corrigé : l'archive était ouverte avec les données de COMBAT.ADL (`combat->data`) ;
  - je ne connais pas sa structure. Chaque entrée de premier niveau `i` donne
    `soundfx_musics[i]`, qui reçoit toutes les séquences `FORM` trouvées en descendant dans les
    sous-archives ;
  - les effets ne vont plus dans `musics[2]`.
- **STRIKE.AD** est chargé dans `timbres` (`SCTimbreLibrary`).
- AMUSIC.PAK et GAMEFLOW.ADL ne changent pas.

## RSMixer : ce qui change

- La musique ne passe plus par `Mix_PlayMusic` + ADLMIDI. Elle passe par `Mix_HookMusic` :
  - le séquenceur du jeu tourne à 20 Hz ;
  - le pilote XMIDI tourne à 120 Hz ;
  - la partie voix du pilote AdLib écrit dans Nuked-OPL3 ;
  - le son est rendu à la fréquence que renvoie `Mix_QuerySpec`. Les formats S16 et F32 sont gérés, en mono ou en stéréo.
- `setVolume(v, -1)` applique le gain dans le crochet, car `Mix_VolumeMusic` n'agit pas sur `Mix_HookMusic`.
- Les VOC (`playSoundVoc`, `stopSound`…) ne changent pas.
- Une seule musique joue à la fois : `playMusic` arrête la musique de combat, et l'inverse.
- `playMusic(mus, loop)` : -1 = sans fin, n = n fois. Les pistes principales bouclent d'elles-mêmes (FOR/NEXT XMIDI).
- Fonctions ajoutées :
  - `requestCombatTune(tune, set = 0)` : `Music_RequestTune_5A984`. Le changement attend la barre de mesure suivante, puis passe par la piste de liaison donnée par COMBAT.DAT.
  - `stopCombatMusic(fade = true)` : `Music_StopWithFade_AB1EF`.
  - `getCombatTune()` : piste de combat courante, -1 si arrêt.
  - `setEnemyNear(bool)` : choix de la piste de reprise après la piste 8.
  - `playSoundFx(mus, volume)`, `setSoundFxVolume`, `stopSoundFx`, `isSoundFxPlaying` :
    - effets XMIDI sur 5 canaux, comme le jeu (`SoundFX_FindFreeChannel_598A6`) ;
    - volume en pourcentage : le jeu donne `100 − distance/10` (`SoundFX_Play3D_59902`) ;
    - `stopSoundFx` n'envoie que des Note Off, comme `SoundFX_StopEffect_59A8A`.
- Le rendu tourne dans le fil audio. Toutes les fonctions prennent `engineMutex`.
- Le pilote gère 8 séquences : 1 piste isolée, 2 pour la musique de combat (piste principale et liaison), et 5 effets.

## Test

```sh
integration/test/run.sh /chemin/SOUND build
```

Le test compile `RSMusic` et `RSMixer` avec des substituts d'`AssetManager`, de `PakArchive` et de
`SDL_mixer_ext` (`test/stubs/`). Il appelle le crochet audio sur 60 s de musique de combat, avec les demandes
4 → 0x10 → 9 → 0x13 puis un arrêt avec fondu. Il compare ensuite le résultat au WAV de `sc_player`
dans le même scénario : **les deux sont identiques octet pour octet** sur les vrais fichiers (2026-10-10).
