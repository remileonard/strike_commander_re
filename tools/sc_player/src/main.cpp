/*
 * main.cpp - Lecteur de musique de Strike Commander.
 *
 * Chaine reproduite : sequenceur du jeu (20 Hz) -> interpreteur XMIDI du pilote (120 Hz)
 * -> partie voix du pilote AdLib -> registres OPL2 -> Nuked-OPL3.
 *
 * Fichiers lus (repertoire --sound, defaut : ./SOUND puis .) :
 *   COMBAT.DAT, COMBAT.ADL, STRIKE.AD (bibliotheque de timbres : "strike." + suffixe "AD"
 *   du pilote ADLIB.ADV).
 *
 * Usage :
 *   sc_player [--sound DIR] [--tune N]                      interface graphique
 *   sc_player [--sound DIR] --wav out.wav --seconds S [--tune N] [--at T:N ...]
 *       rendu sans fenetre ; --at 12.5:16 demande la piste 0x10 a t = 12,5 s ; --at 20:stop arrete avec fondu
 *   --screenshot fichier.bmp : enregistre la fenetre apres 2 s et quitte
 */
#include <SDL.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>
#include <cctype>
#include <sys/stat.h>
#include "imgui.h"
#include "imgui_impl_sdl2.h"
#include "imgui_impl_sdlrenderer2.h"
extern "C" {
#include "opl3.h"
#include "ail_adlib.h"
#include "ail_xmidi.h"
#include "sc_data.h"
#include "sc_music.h"
}

static const int RATE = 44100;

struct Engine {
    opl3_chip   chip;
    AdlDriver   adl;
    XmiDriver   xmi;
    ScMusicData data;
    ScMusic     music;
    double      acc_drv = 0, acc_game = 0;
    unsigned long long samples = 0;
};
static Engine g;

static void opl_write(void *, uint16_t reg, uint8_t val) { OPL3_WriteReg(&g.chip, reg, val); }

/* Avance la musique et produit n echantillons stereo 16 bits. */
static void render(int16_t *out, int n)
{
    const double drv_step = 120.0 / RATE, game_step = 20.0 / RATE;
    int done = 0;
    while (done < n) {
        double to_drv = (1.0 - g.acc_drv) / drv_step, to_game = (1.0 - g.acc_game) / game_step;
        int chunk = (int)(to_drv < to_game ? to_drv : to_game);
        if (chunk < 1) chunk = 1;
        if (chunk > n - done) chunk = n - done;
        OPL3_GenerateStream(&g.chip, out + 2 * done, (uint32_t)chunk);
        done += chunk;
        g.samples += (unsigned long long)chunk;
        g.acc_drv += chunk * drv_step;
        g.acc_game += chunk * game_step;
        if (g.acc_game >= 1.0) { g.acc_game -= 1.0; sc_music_tick(&g.music); }
        if (g.acc_drv >= 1.0) { g.acc_drv -= 1.0; xmi_serve(&g.xmi); }
    }
}

static void audio_cb(void *, Uint8 *stream, int len) { render((int16_t *)stream, len / 4); }

static bool exists(const std::string &p) { struct stat st; return stat(p.c_str(), &st) == 0; }

/* Cherche NAME dans DIR sans tenir compte de la casse (fichiers DOS). */
static std::string find_file(const std::string &dir, const char *name)
{
    std::string up = name, lo = name;
    for (auto &c : up) c = (char)toupper((unsigned char)c);
    for (auto &c : lo) c = (char)tolower((unsigned char)c);
    for (const std::string &n : { up, lo, std::string(name) }) {
        std::string p = dir + "/" + n;
        if (exists(p)) return p;
    }
    return dir + "/" + up;
}

static bool load(const std::string &dir_arg)
{
    std::vector<std::string> dirs;
    if (!dir_arg.empty()) dirs.push_back(dir_arg); else { dirs.push_back("SOUND"); dirs.push_back("sound"); dirs.push_back("."); }
    for (auto &d : dirs) {
        std::string dat = find_file(d, "COMBAT.DAT");
        if (!exists(dat)) continue;
        std::string adl = find_file(d, "COMBAT.ADL"), lib = find_file(d, "STRIKE.AD");
        if (sc_data_load(&g.data, dat.c_str(), adl.c_str(), lib.c_str()) != 0) return false;
        fprintf(stderr, "donnees : %s, %s, %s\n", dat.c_str(), adl.c_str(), lib.c_str());
        return true;
    }
    fprintf(stderr, "COMBAT.DAT introuvable (essayez --sound REPERTOIRE)\n");
    return false;
}

static void engine_init()
{
    OPL3_Reset(&g.chip, RATE);
    adl_init(&g.adl, opl_write, nullptr);
    xmi_init(&g.xmi, &g.adl);
    sc_music_init(&g.music, &g.xmi, &g.data);
}

static const char *tune_label(int t)
{
    switch (t) {
    case 4: return "combat aerien (avion ennemi proche)";
    case 5: return "ennemi dans les six heures";
    case 6: return "combat, joueur endommage >= 35 %";
    case 7: return "combat, joueur endommage >= 75 %";
    case 8: return "camera arme : missile du joueur";
    case 9: return "missile sur le joueur / avion qui l'attaque";
    case 0x0A: return "ejection volontaire (Ctrl+E)";
    case 0x0B: return "avion du joueur detruit";
    case 0x0C: return "fin de combat, condition de mission remplie";
    case 0x0D: return "fin de combat";
    case 0x0E: return "objet allie detruit (designe par la mission)";
    case 0x0F: return "objet allie detruit (autre)";
    case 0x10: return "ponctuation : avion abattu par le joueur";
    case 0x11: return "ponctuation : defense fixe / objet au sol";
    case 0x12: return "ponctuation : decor ORNT ou XMIT";
    case 0x13: return "menaces au sol seules";
    case 0x14: return "atterrissage";
    case 0x15: return "camera arme : bombe (pendant 0x13)";
    default: return "";
    }
}

static const char *state_label(int s)
{
    static const char *n[] = { "0 demarrage", "1 lecture", "2 attente de la barre", "3 liaison en cours" };
    return (s >= 0 && s < 4) ? n[s] : "?";
}

static int wav_mode(const char *path, double seconds, int tune, const std::vector<std::pair<double, int>> &at)
{
    FILE *f = fopen(path, "wb");
    if (!f) { fprintf(stderr, "impossible d'ecrire %s\n", path); return 1; }
    uint32_t total = (uint32_t)(seconds * RATE);
    uint32_t bytes = total * 4;
    uint8_t h[44] = { 'R','I','F','F' };
    auto w32 = [&](int o, uint32_t v) { h[o] = v & 255; h[o+1] = (v >> 8) & 255; h[o+2] = (v >> 16) & 255; h[o+3] = v >> 24; };
    auto w16 = [&](int o, uint16_t v) { h[o] = v & 255; h[o+1] = v >> 8; };
    w32(4, 36 + bytes); memcpy(h + 8, "WAVEfmt ", 8); w32(16, 16); w16(20, 1); w16(22, 2);
    w32(24, RATE); w32(28, RATE * 4); w16(32, 4); w16(34, 16); memcpy(h + 36, "data", 4); w32(40, bytes);
    fwrite(h, 1, 44, f);
    sc_music_request(&g.music, tune);
    std::vector<int16_t> buf(2 * 1024);
    size_t next = 0;
    int last_state = -1, last_cur = -1;
    for (uint32_t pos = 0; pos < total; ) {
        double t = (double)pos / RATE;
        while (next < at.size() && at[next].first <= t) {
            if (at[next].second < 0) { fprintf(stderr, "t=%6.2f s : arret avec fondu\n", t); sc_music_stop(&g.music, 1); }
            else { fprintf(stderr, "t=%6.2f s : demande de la piste 0x%02X\n", t, at[next].second); sc_music_request(&g.music, at[next].second); }
            next++;
        }
        int n = (int)std::min<uint32_t>(1024, total - pos);
        render(buf.data(), n);
        fwrite(buf.data(), 4, (size_t)n, f);
        pos += (uint32_t)n;
        if (g.music.state != last_state || g.music.current != last_cur) {
            fprintf(stderr, "t=%6.2f s : etat %s, piste 0x%02X, mesure %d, voix %d",
                    t, state_label(g.music.state), g.music.current, sc_music_measure(&g.music), adl_active_voices(&g.adl));
            if (g.music.last_matrix >= 0)
                fprintf(stderr, " (derniere resolution : entree %d, position %d, valeur 0x%02X)",
                        g.music.last_matrix, g.music.last_pos, g.music.last_value);
            fprintf(stderr, "\n");
            last_state = g.music.state; last_cur = g.music.current;
        }
    }
    fclose(f);
    fprintf(stderr, "%s ecrit (%.1f s)\n", path, seconds);
    return 0;
}

int main(int argc, char **argv)
{
    std::string dir, wav, shot;
    double seconds = 30;
    int tune = 4;
    std::vector<std::pair<double, int>> at;
    for (int i = 1; i < argc; i++) {
        std::string a = argv[i];
        if (a == "--sound" && i + 1 < argc) dir = argv[++i];
        else if (a == "--wav" && i + 1 < argc) wav = argv[++i];
        else if (a == "--screenshot" && i + 1 < argc) shot = argv[++i];
        else if (a == "--seconds" && i + 1 < argc) seconds = atof(argv[++i]);
        else if (a == "--tune" && i + 1 < argc) tune = (int)strtol(argv[++i], nullptr, 0);
        else if (a == "--at" && i + 1 < argc) {
            std::string s = argv[++i]; size_t c = s.find(':');
            if (c != std::string::npos) {
                std::string v = s.substr(c + 1);
                at.push_back({ atof(s.substr(0, c).c_str()), v == "stop" ? -1 : (int)strtol(v.c_str(), nullptr, 0) });
            }
        } else { fprintf(stderr, "option inconnue : %s\n", a.c_str()); return 2; }
    }
    if (!load(dir)) return 1;
    fprintf(stderr, "combat.dat : %d pistes, %d entrees de liaison ; combat.adl : %d pistes de liaison\n",
            g.data.track_count, g.data.link_entry_count, g.data.link_track_count);
    engine_init();
    if (!wav.empty()) return wav_mode(wav.c_str(), seconds, tune, at);

    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO) != 0) { fprintf(stderr, "SDL_Init : %s\n", SDL_GetError()); return 1; }
    SDL_Window *win = SDL_CreateWindow("Strike Commander - musique", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                                       900, 720, SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
    SDL_Renderer *ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO &io = ImGui::GetIO();
    ImGui::StyleColorsDark();
    ImGui_ImplSDL2_InitForSDLRenderer(win, ren);
    ImGui_ImplSDLRenderer2_Init(ren);

    SDL_AudioSpec want, have;
    SDL_zero(want);
    want.freq = RATE; want.format = AUDIO_S16SYS; want.channels = 2; want.samples = 1024; want.callback = audio_cb;
    SDL_AudioDeviceID dev = SDL_OpenAudioDevice(nullptr, 0, &want, &have, 0);
    if (!dev) fprintf(stderr, "SDL_OpenAudioDevice : %s\n", SDL_GetError());
    SDL_LockAudioDevice(dev);
    sc_music_request(&g.music, tune);
    SDL_UnlockAudioDevice(dev);
    SDL_PauseAudioDevice(dev, 0);

    bool running = true;
    int frame = 0;
    while (running) {
        SDL_Event ev;
        while (SDL_PollEvent(&ev)) { ImGui_ImplSDL2_ProcessEvent(&ev); if (ev.type == SDL_QUIT) running = false; }
        ImGui_ImplSDLRenderer2_NewFrame();
        ImGui_ImplSDL2_NewFrame();
        ImGui::NewFrame();
        ImGui::SetNextWindowPos(ImVec2(0, 0));
        ImGui::SetNextWindowSize(io.DisplaySize);
        ImGui::Begin("player", nullptr, ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_NoMove);

        SDL_LockAudioDevice(dev);
        ScMusic snap = g.music;
        int measure = sc_music_measure(&g.music);
        int beat = g.music.main_ch.handle >= 0 ? xmi_beat_count(&g.xmi, g.music.main_ch.handle) : 0;
        int voices = adl_active_voices(&g.adl);
        SDL_UnlockAudioDevice(dev);

        char req[16];
        if (snap.requested == 0xFFFF) snprintf(req, sizeof req, "arret"); else snprintf(req, sizeof req, "0x%02X", snap.requested);
        ImGui::Text("Piste courante 0x%02X   demandee %s   etat %s", snap.current, req, state_label(snap.state));
        ImGui::Text("Mesure %d, temps %d   voix actives %d / 16   piste de reprise 0x%02X   erreur %d",
                    measure, beat, voices, snap.resume_tune, snap.error);
        if (snap.last_matrix >= 0)
            ImGui::Text("Derniere resolution : entree de liaison %d, position %d, valeur 0x%02X -> %s",
                        snap.last_matrix == 0xFF ? -1 : snap.last_matrix, snap.last_pos, snap.last_value,
                        snap.last_value == 0 ? "bascule directe" :
                        (snap.last_link >= 0 ? ("piste de liaison " + std::to_string(snap.last_link)).c_str() : "refusee"));
        if (snap.state == 3) ImGui::TextColored(ImVec4(1, 0.8f, 0.3f, 1), "Liaison %d en cours", snap.link_ch.index);
        bool near = snap.enemy_near & 1;
        if (ImGui::Checkbox("Avion ennemi proche (choix de reprise apres la piste 8)", &near)) {
            SDL_LockAudioDevice(dev); g.music.enemy_near = near ? 1 : 0; SDL_UnlockAudioDevice(dev);
        }
        ImGui::Separator();
        ImGui::Text("Demander une piste (Music_RequestTune) : le changement attend la barre de mesure suivante.");
        for (int t = 0; t < g.data.track_count; t++) {
            char lbl[160];
            snprintf(lbl, sizeof lbl, "0x%02X  %s##t%d", t, tune_label(t), t);
            bool cur = (t == snap.current && snap.requested != 0xFFFF);
            if (cur) ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(0.2f, 0.5f, 0.2f, 1));
            if (ImGui::Button(lbl, ImVec2(430, 0))) { SDL_LockAudioDevice(dev); sc_music_request(&g.music, t); SDL_UnlockAudioDevice(dev); }
            if (cur) ImGui::PopStyleColor();
            if (t % 2 == 0) ImGui::SameLine();
        }
        ImGui::Separator();
        if (ImGui::Button("Arret avec fondu (1 s)", ImVec2(220, 30))) { SDL_LockAudioDevice(dev); sc_music_stop(&g.music, 1); SDL_UnlockAudioDevice(dev); }
        ImGui::SameLine();
        if (ImGui::Button("Arret immediat", ImVec2(220, 30))) { SDL_LockAudioDevice(dev); sc_music_stop(&g.music, 0); SDL_UnlockAudioDevice(dev); }
        ImGui::End();
        ImGui::Render();
        SDL_SetRenderDrawColor(ren, 20, 20, 25, 255);
        SDL_RenderClear(ren);
        ImGui_ImplSDLRenderer2_RenderDrawData(ImGui::GetDrawData(), ren);
        if (!shot.empty() && ++frame == 120) {           /* --screenshot : capture apres ~2 s */
            int w, h;
            SDL_GetRendererOutputSize(ren, &w, &h);
            SDL_Surface *sf = SDL_CreateRGBSurfaceWithFormat(0, w, h, 32, SDL_PIXELFORMAT_ARGB8888);
            SDL_RenderReadPixels(ren, nullptr, SDL_PIXELFORMAT_ARGB8888, sf->pixels, sf->pitch);
            SDL_SaveBMP(sf, shot.c_str());
            SDL_FreeSurface(sf);
            running = false;
        }
        SDL_RenderPresent(ren);
    }
    if (dev) SDL_CloseAudioDevice(dev);
    ImGui_ImplSDLRenderer2_Shutdown();
    ImGui_ImplSDL2_Shutdown();
    ImGui::DestroyContext();
    SDL_DestroyRenderer(ren);
    SDL_DestroyWindow(win);
    SDL_Quit();
    adl_shutdown(&g.adl);
    sc_data_free(&g.data);
    return 0;
}
