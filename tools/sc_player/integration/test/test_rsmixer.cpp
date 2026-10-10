#include "mixer/RSMixer.h"
#include <cstdio>
#include <algorithm>
#include <cstdlib>
void (*g_hook)(void *, Uint8 *, int) = nullptr;
void *g_hookArg = nullptr;
int main(int, char **argv) {
    AssetManager::instance().dir = argv[1];
    RSMixer &m = RSMixer::getInstance();
    m.init();
    RSMusic *mu = m.music;
    RSMusicSet *combat = mu->music_files["..\\..\\DATA\\SOUND\\COMBAT.ADL"][0];
    printf("COMBAT : %zu jeu(x), .dat %d : %d pistes, %zu liaisons, %zu entrees ; combat_musics[0] %zu ; soundfx_musics[0] %zu ; timbres %s\n",
           mu->music_files["..\\..\\DATA\\SOUND\\COMBAT.ADL"].size(), (int)combat->hasDat, combat->data.trackCount,
           combat->data.linkTracks.size(), combat->data.linkEntries.size(), mu->combat_musics[0].size(),
           mu->soundfx_musics[0].size(), mu->timbres.loaded() ? "oui" : "non");
    // un autre fichier avec .dat : meme structure, banque choisie par le consommateur
    std::vector<RSMusicSet *> other = mu->LoadMusicFile("..\\..\\DATA\\SOUND\\GAMEFLOW.ADL", "..\\..\\DATA\\SOUND\\COMBAT.DAT");
    std::vector<RSMusicSet *> nodat = mu->LoadMusicFile("..\\..\\DATA\\SOUND\\GAMEFLOW.ADL");
    printf("GAMEFLOW avec .dat : %d ; sans .dat : %d (%zu pistes)\n", (int)other[0]->hasDat, (int)nodat[0]->hasDat, nodat[0]->tracks.size());
    FILE *f = fopen(argv[2], "wb");
    struct {
        double t;
        int tune;
    } at[] = {
        { 12,
          0x10 },
        { 30,
          9 },
        { 45,
          0x13 },
        { 55,
          -1 }
    };
    mu->SetBank(5, other[0]); // jeu charge par LoadMusicFile, avec son .dat, dans une banque libre
    m.switchBank(5);
    m.playMusic(4);
    size_t next = 0;
    const int RATE = 44100;
    uint32_t total = 60 * RATE;
    int16_t buf[2048];
    for (uint32_t pos = 0; pos < total;) {
        double t = (double)pos / RATE;
        while (next < 4 && at[next].t <= t) {
            if (at[next].tune < 0) {
                m.stopMusic(true);
            } else {
                m.playMusic((uint32_t)at[next].tune);
            }
            next++;
        }
        int n = total - pos < 1024 ? total - pos : 1024;
        g_hook(g_hookArg, (Uint8 *)buf, n * 4);
        SCMusicEvent ev;
        while (m.pollMusicEvent(ev)) {
            printf("evenement %d piste %d depuis %d liaison %d\n", (int)ev.type, ev.track, ev.fromTrack, ev.link);
        }
        fwrite(buf, 4, n, f);
        pos += n;
        if (pos % (RATE * 10) < 1024) {
            printf("t=%.0f piste %d\n", t, (int)m.getMusicID());
        }
    }
    fclose(f);
    // piste isolee + effet
    m.switchBank(0); // banque sans .dat : piste jouee seule
    m.playMusic(mu->combat_musics[0][19], 1);
    int fx = m.playSoundFx(mu->soundfx_musics[0][10], 50);
    int pk = 0;
    for (int k = 0; k < 200; k++) {
        g_hook(g_hookArg, (Uint8 *)buf, 4096);
        for (int i = 0; i < 2048; i++) {
            pk = std::max(pk, abs((int)buf[i]));
        }
    }
    printf("crete piste isolee + effet : %d\n", pk);
    m.stopMusic();
    m.stopSoundFx(fx);
    pk = 0;
    for (int k = 0; k < 50; k++) {
        g_hook(g_hookArg, (Uint8 *)buf, 4096);
    }
    for (int k = 0; k < 20; k++) {
        g_hook(g_hookArg, (Uint8 *)buf, 4096);
        for (int i = 0; i < 2048; i++) {
            pk = std::max(pk, abs((int)buf[i]));
        }
    }
    printf("crete apres arret : %d\n", pk);
    printf("piste isolee : getMusicID %u, effet canal %d actif %d\n", m.getMusicID(), fx, (int)m.isSoundFxPlaying(fx));
    m.stopMusic();
    m.stopSoundFx(fx);
    SCMusicEvent ev;
    while (m.pollMusicEvent(ev)) {
        printf("evenement %d piste %d depuis %d liaison %d\n", (int)ev.type, ev.track, ev.fromTrack, ev.link);
    }
    return 0;
}
