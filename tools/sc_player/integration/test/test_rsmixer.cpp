#include "mixer/RSMixer.h"
#include <cstdio>
#include <algorithm>
#include <cstdlib>
void (*g_hook)(void *, Uint8 *, int) = nullptr; void *g_hookArg = nullptr;
int main(int, char **argv) {
    AssetManager::instance().dir = argv[1];
    RSMixer &m = RSMixer::getInstance();
    m.init();
    RSMusic *mu = m.music;
    printf("combat_sets %zu : %d pistes, %zu liaisons, %zu entrees ; combat_musics[0] %zu ; soundfx_musics[0] %zu ; timbres %s\n",
           mu->combat_sets.size(), mu->combat_sets[0].trackCount, mu->combat_sets[0].linkTracks.size(),
           mu->combat_sets[0].linkEntries.size(), mu->combat_musics[0].size(), mu->soundfx_musics[0].size(),
           mu->timbres.loaded() ? "oui" : "non");
    FILE *f = fopen(argv[2], "wb");
    struct { double t; int tune; } at[] = { {12, 0x10}, {30, 9}, {45, 0x13}, {55, -1} };
    m.requestCombatTune(4);
    size_t next = 0; const int RATE = 44100; uint32_t total = 60 * RATE;
    int16_t buf[2048];
    for (uint32_t pos = 0; pos < total; ) {
        double t = (double)pos / RATE;
        while (next < 4 && at[next].t <= t) { if (at[next].tune < 0) m.stopCombatMusic(true); else m.requestCombatTune(at[next].tune); next++; }
        int n = total - pos < 1024 ? total - pos : 1024;
        g_hook(g_hookArg, (Uint8 *)buf, n * 4);
        fwrite(buf, 4, n, f); pos += n;
        if (pos % (RATE * 10) < 1024) printf("t=%.0f combat tune %d\n", t, m.getCombatTune());
    }
    fclose(f);
    // piste isolee + effet
    m.playMusic(mu->combat_musics[0][19], 1);
    int fx = m.playSoundFx(mu->soundfx_musics[0][30], 50);
    int pk = 0; for (int k = 0; k < 200; k++) { g_hook(g_hookArg, (Uint8 *)buf, 4096); for (int i = 0; i < 2048; i++) pk = std::max(pk, abs((int)buf[i])); } printf("crete piste isolee + effet : %d\n", pk);
    m.stopMusic(); m.stopSoundFx(fx); m.stopCombatMusic(false); pk = 0; for (int k = 0; k < 50; k++) { g_hook(g_hookArg, (Uint8 *)buf, 4096); } for (int k = 0; k < 20; k++) { g_hook(g_hookArg, (Uint8 *)buf, 4096); for (int i = 0; i < 2048; i++) pk = std::max(pk, abs((int)buf[i])); } printf("crete apres arret : %d\n", pk);
    printf("piste isolee : getMusicID %u, effet canal %d actif %d\n", m.getMusicID(), fx, (int)m.isSoundFxPlaying(fx));
    m.stopMusic(); m.stopSoundFx(fx);
    return 0;
}
