#include "RSMixer.h"
#include <unordered_map>
#include <mutex>
#include <atomic>

static RSMixer* g_rsmixer_instance = nullptr;

namespace {
    std::mutex g_mixMutex;
}


static void ChannelFinishedCallback(int ch) {
    // Capture locale de l'instance pour éviter les accès à une instance détruite
    RSMixer* inst = g_rsmixer_instance;
    if (!inst || inst->shuttingDown) return;
    
    // Limiter la durée du verrouillage
    Mix_Chunk* chunkToFree = nullptr;
    {
        std::lock_guard<std::mutex> lock(g_mixMutex);
        auto it = inst->channelChunks.find(ch);
        if (it != inst->channelChunks.end()) {
            chunkToFree = it->second;
            inst->channelChunks.erase(it);
        }
    }
    
    // Libérer la ressource hors du mutex
    if (chunkToFree) {
        Mix_FreeChunk(chunkToFree);
    }
}

RSMixer::RSMixer() {
    this->shuttingDown = false;
    this->music = nullptr;
    g_rsmixer_instance = this;
}

void RSMixer::init() {
    if (this->has_been_initialized) return;
    this->has_been_initialized = true;
    this->initted = Mix_Init(0);
    if (Mix_OpenAudio(44100, MIX_DEFAULT_FORMAT, 2, 1024) < 0) {
        printf("Erreur d'initialisation audio: %s\n", Mix_GetError());
        return;
    }
    int freq = 44100, chans = 2;
    Uint16 fmt = AUDIO_S16SYS;
    if (Mix_QuerySpec(&freq, &fmt, &chans)) {
        this->sampleRate = freq;
        this->audioFormat = fmt;
        this->audioChannels = chans;
    }
    if (this->audioFormat != AUDIO_S16SYS && this->audioFormat != AUDIO_F32SYS) {
        printf("RSMixer: format audio 0x%04X non gere, musique muette\n", this->audioFormat);
    }
    this->music = new RSMusic();
    this->music->init();
    this->isplaying = false;
    {
        std::lock_guard<std::recursive_mutex> lock(engineMutex);
        OPL3_Reset(&chip, (uint32_t)this->sampleRate);
        adl.init([this](uint16_t reg, uint8_t val) { OPL3_WriteReg(&chip, reg, val); });
        xmi.init(&adl);
        sequencer.init(&xmi, &this->music->timbres);
        if (!this->music->combat_sets.empty()) sequencer.setMusicSet(&this->music->combat_sets[0]);
    }
    Mix_HookMusic(RSMixer::musicHook, this);
    Mix_ChannelFinished(ChannelFinishedCallback);
}

RSMixer::~RSMixer() {
    // Signaler arrêt avec un atomic bool serait préférable
    shuttingDown = true;

    // Plus de rendu musical : le crochet est retire avant tout le reste
    Mix_HookMusic(nullptr, nullptr);
    
    // Bloquer les opérations pendant la destruction
    std::lock_guard<std::mutex> lock(g_mixMutex);
    
    // Désenregistrer immédiatement le callback
    Mix_ChannelFinished(nullptr);
    
    // Stopper tous les canaux pour éviter callbacks tardifs
    Mix_HaltChannel(-1);
    
    // Nettoyer les ressources audio
    for (auto &kv : channelChunks) {
        if (kv.second) {
            Mix_FreeChunk(kv.second);
        }
    }
    channelChunks.clear();
    
    if (this->music) {
        delete this->music;
        this->music = nullptr;
    }
    
    // Plus personne ne doit utiliser l'instance
    if (g_rsmixer_instance == this) {
        g_rsmixer_instance = nullptr;
    }
    
    Mix_CloseAudio();
    Mix_Quit();
}

// ---------------------------------------------------------------------------------------
// Rendu : appele par SDL_mixer dans le fil audio, a la place de la lecture Mix_Music.
// ---------------------------------------------------------------------------------------

void RSMixer::musicHook(void *udata, Uint8 *stream, int len) {
    RSMixer *self = static_cast<RSMixer *>(udata);
    if (!self || self->shuttingDown) { memset(stream, 0, (size_t)len); return; }
    int sampleBytes = (self->audioFormat == AUDIO_F32SYS) ? 4 : 2;
    int frames = len / (sampleBytes * self->audioChannels);
    if (self->audioFormat != AUDIO_S16SYS && self->audioFormat != AUDIO_F32SYS) {
        memset(stream, 0, (size_t)len);
        return;
    }
    std::lock_guard<std::recursive_mutex> lock(self->engineMutex);
    self->mixBuffer.resize((size_t)frames * 2);
    self->render(self->mixBuffer.data(), frames);
    const int16_t *src = self->mixBuffer.data();
    const int vol = self->musicVolume;
    for (int f = 0; f < frames; f++) {
        int l = src[2 * f] * vol / MIX_MAX_VOLUME, r = src[2 * f + 1] * vol / MIX_MAX_VOLUME;
        if (self->audioFormat == AUDIO_S16SYS) {
            int16_t *out = reinterpret_cast<int16_t *>(stream) + f * self->audioChannels;
            if (self->audioChannels == 1) out[0] = (int16_t)((l + r) / 2);
            else { out[0] = (int16_t)l; out[1] = (int16_t)r; for (int c = 2; c < self->audioChannels; c++) out[c] = 0; }
        } else {
            float *out = reinterpret_cast<float *>(stream) + f * self->audioChannels;
            if (self->audioChannels == 1) out[0] = (l + r) / 65536.0f;
            else { out[0] = l / 32768.0f; out[1] = r / 32768.0f; for (int c = 2; c < self->audioChannels; c++) out[c] = 0; }
        }
    }
}

// Pas du pilote (120 Hz) : interpreteur XMIDI + voix, puis fin de piste isolee / bouclage.
void RSMixer::serveDriver() {
    xmi.serve();
    if (musicHandle >= 0 && xmi.status(musicHandle) == SEQ_DONE) {
        if (loopsLeft < 0 || loopsLeft > 1) {
            if (loopsLeft > 0) loopsLeft--;
            xmi.start(musicHandle);
        } else {
            xmi.release(musicHandle);
            musicHandle = -1;
            isplaying = false;
        }
    }
    for (int c = 0; c < SFX_CHANNELS; c++) {
        if (sfxHandle[c] >= 0 && xmi.status(sfxHandle[c]) == SEQ_DONE) {
            xmi.release(sfxHandle[c]);
            sfxHandle[c] = -1;
        }
    }
}

// Meme decoupage que le lecteur sc_player : le sequenceur a 20 Hz, le pilote a 120 Hz,
// les echantillons OPL entre deux pas.
void RSMixer::render(int16_t *out, int frames) {
    const double drvStep = 120.0 / sampleRate, gameStep = 20.0 / sampleRate;
    int done = 0;
    while (done < frames) {
        double toDrv = (1.0 - accDriver) / drvStep, toGame = (1.0 - accGame) / gameStep;
        int chunk = (int)(toDrv < toGame ? toDrv : toGame);
        if (chunk < 1) chunk = 1;
        if (chunk > frames - done) chunk = frames - done;
        OPL3_GenerateStream(&chip, out + 2 * done, (uint32_t)chunk);
        done += chunk;
        accDriver += chunk * drvStep;
        accGame += chunk * gameStep;
        if (accGame >= 1.0) { accGame -= 1.0; sequencer.tick(); }
        if (accDriver >= 1.0) { accDriver -= 1.0; serveDriver(); }
    }
}

// ---------------------------------------------------------------------------------------
// Pistes isolees
// ---------------------------------------------------------------------------------------

void RSMixer::stopMusicLocked() {
    if (musicHandle >= 0) {
        xmi.stop(musicHandle);
        xmi.release(musicHandle);
        musicHandle = -1;
    }
    this->isplaying = false;
}

void RSMixer::playMusic(uint32_t index, int loop) {
    if (this->isplaying && this->current_music == index) return;
    if (shuttingDown || !this->music) return;
    MemMusic *mus = this->music->GetMusic(index);
    if (mus == nullptr) {
        printf("No music found for index %d in bank %d\n", index, this->music->bank);
        return;
    }
    this->currentMusicMemPtr = nullptr;      // forcer le redemarrage
    this->playMusic(mus, loop);
    if (this->isplaying) this->current_music = index;
}

void RSMixer::playMusic(MemMusic *mus, int loop) {
    if (this->isplaying && this->currentMusicMemPtr == mus) return;
    std::lock_guard<std::recursive_mutex> lock(engineMutex);
    stopMusicLocked();
    sequencer.stop(false);                   // une seule musique a la fois, comme le jeu
    this->currentMusicMemPtr = mus;
    this->current_music = UINT32_MAX;
    if (!mus || shuttingDown || !this->music) return;
    int err = 0;
    musicHandle = SCMusicSequencer::registerAndStart(&xmi, &this->music->timbres, mus->data, mus->size, &err);
    if (musicHandle < 0) {
        printf("Error loading music (error %d)\n", err);
        return;
    }
    loopsLeft = loop < 0 ? -1 : (loop == 0 ? 1 : loop);
    this->isplaying = true;
}

void RSMixer::stopMusic() {
    if (shuttingDown) return;
    std::lock_guard<std::recursive_mutex> lock(engineMutex);
    stopMusicLocked();
    sequencer.stop(false);
    this->currentMusicMemPtr = nullptr;
    this->current_music = UINT32_MAX;
}

// ---------------------------------------------------------------------------------------
// Musique de combat
// ---------------------------------------------------------------------------------------

void RSMixer::requestCombatTune(int tune, int set) {
    if (shuttingDown || !this->music) return;
    if (set < 0 || set >= (int)this->music->combat_sets.size()) {
        printf("RSMixer: no combat music set %d\n", set);
        return;
    }
    std::lock_guard<std::recursive_mutex> lock(engineMutex);
    if (musicHandle >= 0) stopMusicLocked();
    this->currentMusicMemPtr = nullptr;
    this->current_music = UINT32_MAX;
    sequencer.setMusicSet(&this->music->combat_sets[(size_t)set]);   // arrete si le jeu change
    sequencer.request(tune);
}

void RSMixer::stopCombatMusic(bool fade) {
    if (shuttingDown) return;
    std::lock_guard<std::recursive_mutex> lock(engineMutex);
    sequencer.stop(fade);
}

int RSMixer::getCombatTune() {
    std::lock_guard<std::recursive_mutex> lock(engineMutex);
    return sequencer.requested == 0xFFFF ? -1 : sequencer.current;
}

void RSMixer::setEnemyNear(bool near) {
    std::lock_guard<std::recursive_mutex> lock(engineMutex);
    sequencer.enemyNear = near ? 1 : 0;
}

// ---------------------------------------------------------------------------------------
// Effets XMIDI
// ---------------------------------------------------------------------------------------

int RSMixer::playSoundFx(MemMusic *fx, int volume) {
    if (shuttingDown || !fx || !this->music) return -1;
    std::lock_guard<std::recursive_mutex> lock(engineMutex);
    int c = 0;
    while (c < SFX_CHANNELS && sfxHandle[c] >= 0) c++;     // SoundFX_FindFreeChannel_598A6
    if (c == SFX_CHANNELS) return -1;
    int err = 0;
    int h = SCMusicSequencer::registerAndStart(&xmi, &this->music->timbres, fx->data, fx->size, &err);
    if (h < 0) return -1;
    xmi.setRelVolume(h, volume, 0);
    sfxHandle[c] = h;
    return c;
}

void RSMixer::setSoundFxVolume(int fxChannel, int volume) {
    if (fxChannel < 0 || fxChannel >= SFX_CHANNELS) return;
    std::lock_guard<std::recursive_mutex> lock(engineMutex);
    if (sfxHandle[fxChannel] >= 0) xmi.setRelVolume(sfxHandle[fxChannel], volume, 0);
}

void RSMixer::stopSoundFx(int fxChannel) {
    if (fxChannel < 0 || fxChannel >= SFX_CHANNELS) return;
    std::lock_guard<std::recursive_mutex> lock(engineMutex);
    if (sfxHandle[fxChannel] >= 0) {
        xmi.stop(sfxHandle[fxChannel]);
        xmi.release(sfxHandle[fxChannel]);
        sfxHandle[fxChannel] = -1;
    }
}

bool RSMixer::isSoundFxPlaying(int fxChannel) {
    if (fxChannel < 0 || fxChannel >= SFX_CHANNELS) return false;
    std::lock_guard<std::recursive_mutex> lock(engineMutex);
    return sfxHandle[fxChannel] >= 0;
}

// ---------------------------------------------------------------------------------------
// VOC (inchange : canaux SDL_mixer)
// ---------------------------------------------------------------------------------------

void RSMixer::playSoundVoc(uint8_t *data, size_t vocSize) {
    if (shuttingDown || !data) return;
    
    // Ne pas stocker le pointeur data, faire une copie si nécessaire
    SDL_RWops* rw = SDL_RWFromConstMem(data, static_cast<int>(vocSize));
    if (!rw) {
        printf("Erreur création RWops: %s\n", SDL_GetError());
        return;
    }
    
    Mix_Chunk* chunk = Mix_LoadWAV_RW(rw, 1); // 1 = SDL_RWops sera automatiquement libéré
    if (!chunk) {
        printf("Erreur chargement VOC: %s\n", Mix_GetError());
        return;
    }
    
    int ch = Mix_PlayChannel(-1, chunk, 0);
    if (ch == -1) {
        printf("Erreur lecture son: %s\n", Mix_GetError());
        Mix_FreeChunk(chunk);
        return;
    }
    
    // Ajouter le chunk à la map avec protection mutex
    {
        std::lock_guard<std::mutex> lock(g_mixMutex);
        channelChunks[ch] = chunk;
    }
    
    channel = ch;
}

void RSMixer::playSoundVoc(uint8_t *data, size_t vocSize, int channel, int loop) {
    if (shuttingDown) return;
    // Ne pas stocker le pointeur data, faire une copie si nécessaire
    SDL_RWops* rw = SDL_RWFromConstMem(data, static_cast<int>(vocSize));
    if (!rw) {
        printf("Erreur création RWops: %s\n", SDL_GetError());
        return;
    }
    
    Mix_Chunk* chunk = Mix_LoadWAV_RW(rw, 1); // 1 = SDL_RWops sera automatiquement libéré
    if (!chunk) {
        printf("Erreur chargement VOC: %s\n", Mix_GetError());
        return;
    }
    int result = Mix_PlayChannel(channel, chunk, loop);
    if (result == -1) {
        printf("Error playing VOC sound on channel %d: %s\n", channel, Mix_GetError());
        Mix_FreeChunk(chunk);
        return;
    }
    // Ajouter le chunk à la map avec protection mutex
    {
        std::lock_guard<std::mutex> lock(g_mixMutex);
        channelChunks[channel] = chunk;
    }
}

void RSMixer::stopSound() {
    if (shuttingDown) return;
    Mix_HaltChannel(-1);
    std::lock_guard<std::mutex> lock(g_mixMutex);
    for (auto &kv : channelChunks) {
        if (kv.second) {
            Mix_FreeChunk(kv.second);
        }
    }
    channelChunks.clear();
}

void RSMixer::stopSound(int chanl) {
    if (shuttingDown) return;
    Mix_HaltChannel(chanl);
    std::lock_guard<std::mutex> lock(g_mixMutex);
    auto it = channelChunks.find(chanl);
    if (it != channelChunks.end()) {
        if (it->second) Mix_FreeChunk(it->second);
        channelChunks.erase(it);
    }
}

bool RSMixer::isSoundPlaying() {
    if (shuttingDown) return false;
    return Mix_Playing(channel) != 0;
}

bool RSMixer::isSoundPlaying(int chanl) {
    if (shuttingDown) return false;
    return Mix_Playing(chanl) != 0;
}
void RSMixer::setVolume(int volume, int channel) {
    if (channel == -1) {
        // Mix_VolumeMusic n'agit pas sur Mix_HookMusic : gain applique dans musicHook
        std::lock_guard<std::recursive_mutex> lock(engineMutex);
        musicVolume = volume < 0 ? 0 : (volume > MIX_MAX_VOLUME ? MIX_MAX_VOLUME : volume);
    } else {
        Mix_Volume(channel, volume);
    }
}
void RSMixer::switchBank(uint8_t bank) { 
    this->music->SwitchBank(bank);
}
