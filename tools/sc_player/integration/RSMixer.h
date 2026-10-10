//
//  RSMixer.h
//  libRealSpace
//
//  Created by Rémi LEONARD on 02/09/2024.
//  Copyright (c) 2013 Fabien Sanglard. All rights reserved.
//
//  Musique et effets XMIDI : chaine du jeu original, sans ADLMIDI ni banque WOPL.
//    SCMusicSequencer (20 Hz) -> AILXmidiDriver (120 Hz) -> AILAdlibDriver -> Nuked-OPL3,
//  rendue dans le flux de SDL_mixer par Mix_HookMusic. Les VOC restent sur les canaux SDL_mixer.
//
#pragma once
#include "../realspace/AssetManager.h"
#include "../realspace/RSMusic.h"
#include <SDL2/SDL_mixer_ext.h>
#include <mutex>
#include <vector>
#include "opl3.h"
#include "AILAdlibDriver.h"
#include "AILXmidiDriver.h"
#include "SCMusicSequencer.h"

class RSMixer {
    int initted;
    bool has_been_initialized{false};
    bool isplaying;
    uint32_t current_music{UINT32_MAX};
    int channel{0};
    uint8_t *voc_data{nullptr};

    // --- moteur musical (protege par engineMutex : le rendu tourne dans le fil audio) ---
    std::recursive_mutex engineMutex;
    opl3_chip chip;
    AILAdlibDriver adl;
    AILXmidiDriver xmi;
    SCMusicSequencer sequencer;
    int sampleRate{44100};
    uint16_t audioFormat{AUDIO_S16SYS};
    int audioChannels{2};
    double accDriver{0}, accGame{0};
    int musicVolume{MIX_MAX_VOLUME};
    int musicHandle{-1};          // piste isolee (playMusic) : handle XMIDI
    int loopsLeft{0};             // -1 = sans fin
    static const int SFX_CHANNELS = 5;   // objet effets du jeu : 5 canaux (MUSIC_SYSTEM.md 7.1)
    int sfxHandle[SFX_CHANNELS]{-1, -1, -1, -1, -1};
    std::vector<int16_t> mixBuffer;

    static void musicHook(void *udata, Uint8 *stream, int len);
    void render(int16_t *out, int frames);      // appele sous engineMutex
    void stopMusicLocked();
    void serveDriver();

public:
    RSMusic *music;
    bool shuttingDown = false;
    std::unordered_map<int, Mix_Chunk*> channelChunks;
    MemMusic* currentMusicMemPtr = nullptr;
    static RSMixer &getInstance() {
        static RSMixer instance;
        return instance;
    }
    RSMixer();
    ~RSMixer();
    void init();
    // Piste isolee (AMUSIC, GAMEFLOW...). loop : -1 = sans fin, n >= 1 = n fois (0 = une fois).
    void playMusic(uint32_t index, int loop=1);
    void playMusic(MemMusic *mus, int loop=1);
    void switchBank(uint8_t bank);
    void stopMusic();
    uint32_t getMusicID() { return this->current_music; };

    // Musique de combat (sequenceur du jeu sur COMBAT.ADL / COMBAT.DAT) :
    // Music_RequestTune_5A984. Le changement attend la barre de mesure suivante et passe par
    // une piste de liaison si COMBAT.DAT en donne une. set = jeu de COMBAT.ADL (0 en general).
    void requestCombatTune(int tune, int set = 0);
    // Music_StopWithFade_AB1EF (fade = fondu d'une seconde)
    void stopCombatMusic(bool fade = true);
    int  getCombatTune();                       // piste courante, -1 si arret
    // byte_7086A bit 0 : choix de la reprise apres la piste 8 (avion ennemi proche)
    void setEnemyNear(bool near);

    // Effets XMIDI (SOUNDFX.ADL) : 5 canaux comme le jeu. volume en pourcentage (0..100,
    // SoundFX_Play3D_59902 : 100 - distance/10). Renvoie le canal, -1 si aucun libre.
    int  playSoundFx(MemMusic *fx, int volume = 100);
    void setSoundFxVolume(int fxChannel, int volume);
    void stopSoundFx(int fxChannel);            // SoundFX_StopEffect_59A8A : Note Off seulement
    bool isSoundFxPlaying(int fxChannel);

    void stopSound();
    void stopSound(int chanl);
    void playSoundVoc(uint8_t *data, size_t vocSize);
    void playSoundVoc(uint8_t *data, size_t vocSize, int channel, int loop=0);
    void setVolume(int volume, int channel = -1);
    bool isSoundPlaying();
    bool isSoundPlaying(int chanl);
};
