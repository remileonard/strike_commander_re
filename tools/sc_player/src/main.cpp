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
 *   --screenshot fichier.bmp : enregistre la fenetre apres 2 s et quitte ; --timbre-tab : ouvre le test des timbres
 *   sc_player [--sound DIR] --timbre-wav out.wav [--bank N] [--all]
 *       test des timbres sans fenetre : joue a la suite chaque timbre TVFX de STRIKE.AD
 *       (--all : aussi les timbres OPL simples ; --bank : une seule banque)
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
}
#include "AILAdlibDriver.h"
#include "AILXmidiDriver.h"
#include "SCMusicSet.h"
#include "SCMusicSequencer.h"
#include "SCTimbreTest.h"
#include "SCArchive.h"

static const int RATE = 44100;

struct Engine {
    opl3_chip        chip;
    AILAdlibDriver   adl;
    AILXmidiDriver   xmi;
    SCMusicSet       set;
    std::vector<uint8_t> libData;
    SCTimbreLibrary  lib;
    SCMusicSequencer music;
    double      acc_drv = 0, acc_game = 0;
    unsigned long long samples = 0;
};
static Engine g;


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
        if (g.acc_game >= 1.0) { g.acc_game -= 1.0; g.music.tick(); }
        if (g.acc_drv >= 1.0) { g.acc_drv -= 1.0; g.xmi.serve(); }
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

static bool read_file(const std::string &path, std::vector<uint8_t> &out)
{
    FILE *f = fopen(path.c_str(), "rb");
    if (!f) return false;
    fseek(f, 0, SEEK_END);
    long n = ftell(f);
    fseek(f, 0, SEEK_SET);
    out.resize(n > 0 ? (size_t)n : 0);
    bool ok = fread(out.data(), 1, out.size(), f) == out.size();
    fclose(f);
    return ok;
}

/* Remplit g.set et g.lib. Structure reelle (verifiee sur le COMBAT.ADL fourni par Remi) :
 *   COMBAT.DAT : enregistrement 0 = longueurs de phrase, matrice, entrees de liaison
 *   COMBAT.ADL : fichier -> 1 entree = le jeu ; jeu : [0] archive des liaisons, [1..N] pistes */
static bool load_files(const std::string &dat, const std::string &adl, const std::string &libp)
{
    std::vector<uint8_t> buf, rec;
    SCArchive a;
    if (!read_file(dat, buf)) { fprintf(stderr, "impossible d'ouvrir %s\n", dat.c_str()); return false; }
    if (!a.open(buf.data(), buf.size()) || !a.record(0, rec) || !g.set.parseDat(rec.data(), rec.size())) {
        fprintf(stderr, "%s : format inattendu\n", dat.c_str()); return false;
    }
    if (!read_file(adl, buf)) { fprintf(stderr, "impossible d'ouvrir %s\n", adl.c_str()); return false; }
    SCArchive l1, l2, l3;
    std::vector<uint8_t> r2, r3;
    if (!l1.open(buf.data(), buf.size()) || !l1.record(0, r2) || !l2.open(r2.data(), r2.size())) {
        fprintf(stderr, "%s : index invalide\n", adl.c_str()); return false;
    }
    if (l2.count() < (uint32_t)g.set.trackCount + 1)
        fprintf(stderr, "%s : %u enregistrements, %d pistes attendues + 1\n", adl.c_str(), l2.count(), g.set.trackCount);
    g.set.tracks.assign((size_t)g.set.trackCount, {});
    for (int i = 0; i < g.set.trackCount; i++)
        if (!l2.record((uint32_t)i + 1, g.set.tracks[(size_t)i])) fprintf(stderr, "%s : piste %d absente\n", adl.c_str(), i);
    g.set.linkTracks.clear();
    if (l2.record(0, r3) && l3.open(r3.data(), r3.size())) {
        g.set.linkTracks.resize(l3.count());
        for (uint32_t i = 0; i < l3.count(); i++) l3.record(i, g.set.linkTracks[i]);
    } else {
        fprintf(stderr, "%s : archive des pistes de liaison illisible\n", adl.c_str());
    }
    if (read_file(libp, g.libData)) g.lib.set(g.libData.data(), g.libData.size());
    else   /* sans bibliotheque : les pistes se chargent et s'enchainent, mais aucun timbre -> silence */
        fprintf(stderr, "ATTENTION : %s introuvable (bibliotheque de timbres) : aucune note ne sonnera\n", libp.c_str());
    return true;
}

static bool load(const std::string &dir_arg)
{
    std::vector<std::string> dirs;
    if (!dir_arg.empty()) dirs.push_back(dir_arg); else { dirs.push_back("SOUND"); dirs.push_back("sound"); dirs.push_back("."); }
    for (auto &d : dirs) {
        std::string dat = find_file(d, "COMBAT.DAT");
        if (!exists(dat)) continue;
        std::string adl = find_file(d, "COMBAT.ADL"), lib = find_file(d, "STRIKE.AD");
        if (!load_files(dat, adl, lib)) return false;
        fprintf(stderr, "donnees : %s, %s, %s\n", dat.c_str(), adl.c_str(), lib.c_str());
        return true;
    }
    fprintf(stderr, "COMBAT.DAT introuvable (essayez --sound REPERTOIRE)\n");
    return false;
}

static void engine_init()
{
    OPL3_Reset(&g.chip, RATE);
    g.adl.init([](uint16_t reg, uint8_t val) { OPL3_WriteReg(&g.chip, reg, val); });
    g.xmi.init(&g.adl);
    g.music.init(&g.xmi, &g.lib);
    g.music.setMusicSet(&g.set);
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

static void wav_header(FILE *f, uint32_t total)
{
    uint32_t bytes = total * 4;
    uint8_t h[44] = { 'R','I','F','F' };
    auto w32 = [&](int o, uint32_t v) { h[o] = v & 255; h[o+1] = (v >> 8) & 255; h[o+2] = (v >> 16) & 255; h[o+3] = v >> 24; };
    auto w16 = [&](int o, uint16_t v) { h[o] = v & 255; h[o+1] = v >> 8; };
    w32(4, 36 + bytes); memcpy(h + 8, "WAVEfmt ", 8); w32(16, 16); w16(20, 1); w16(22, 2);
    w32(24, RATE); w32(28, RATE * 4); w16(32, 4); w16(34, 16); memcpy(h + 36, "data", 4); w32(40, bytes);
    fseek(f, 0, SEEK_SET);
    fwrite(h, 1, 44, f);
}

static int wav_mode(const char *path, double seconds, int tune, const std::vector<std::pair<double, int>> &at)
{
    FILE *f = fopen(path, "wb");
    if (!f) { fprintf(stderr, "impossible d'ecrire %s\n", path); return 1; }
    uint32_t total = (uint32_t)(seconds * RATE);
    wav_header(f, total);
    g.music.request(tune);
    std::vector<int16_t> buf(2 * 1024);
    size_t next = 0;
    int last_state = -1, last_cur = -1;
    for (uint32_t pos = 0; pos < total; ) {
        double t = (double)pos / RATE;
        while (next < at.size() && at[next].first <= t) {
            if (at[next].second < 0) { fprintf(stderr, "t=%6.2f s : arret avec fondu\n", t); g.music.stop(true); }
            else { fprintf(stderr, "t=%6.2f s : demande de la piste 0x%02X\n", t, at[next].second); g.music.request(at[next].second); }
            next++;
        }
        int n = (int)std::min<uint32_t>(1024, total - pos);
        render(buf.data(), n);
        fwrite(buf.data(), 4, (size_t)n, f);
        pos += (uint32_t)n;
        if (g.music.state != last_state || g.music.current != last_cur) {
            fprintf(stderr, "t=%6.2f s : etat %s, piste 0x%02X, mesure %d, voix %d",
                    t, state_label(g.music.state), g.music.current, g.music.measure(), g.adl.activeVoices());
            if (g.music.lastMatrix >= 0)
                fprintf(stderr, " (derniere resolution : entree %d, position %d, valeur 0x%02X)",
                        g.music.lastMatrix, g.music.lastPos, g.music.lastValue);
            fprintf(stderr, "\n");
            last_state = g.music.state; last_cur = g.music.current;
        }
    }
    fclose(f);
    fprintf(stderr, "%s ecrit (%.1f s)\n", path, seconds);
    return 0;
}

static const int TEST_CHAN = 8;      /* canal MIDI 9 : accepte par le pilote (1..9), pas le canal 10 des percussions */
static const int TEST_NOTE = 60;

static std::vector<SCTimbreInfo> timbre_list() { return SCTimbreTest::list(g.lib); }

/* --timbre-wav : chaque timbre joue jusqu'a la liberation de sa voix ; voir les commentaires de la boucle. */
static int timbre_wav_mode(const char *path, int bank, bool all)
{
    FILE *f = fopen(path, "wb");
    if (!f) { fprintf(stderr, "impossible d'ecrire %s\n", path); return 1; }
    wav_header(f, 0);
    std::vector<int16_t> buf(2 * 441);
    uint32_t total = 0;
    auto run = [&](double sec) { for (int k = 0; k < (int)(sec * 100); k++) { render(buf.data(), 441); fwrite(buf.data(), 4, 441, f); total += 441; } };
    for (const SCTimbreInfo &t : timbre_list()) {
        if (bank >= 0 && t.bank != bank) continue;
        if (!all && !t.isTvfx()) continue;
        fprintf(stderr, "t=%7.2f s : banque %3d patch %3d, %s, longueur %d", total / (double)RATE, t.bank, t.patch,
                SCTimbreTest::kindLabel(t.kind), t.length);
        if (t.isTvfx())
            fprintf(stderr, ", duree %s", t.duration == 0xFFFF ? "jusqu'au Note Off" : (std::to_string((t.duration + 1) / 60.0).substr(0, 4) + " s").c_str());
        fprintf(stderr, "\n");
        SCTimbreTest::play(g.adl, t, TEST_CHAN, TEST_NOTE, 127);
        /* TVFX a duree propre : il passe seul en relachement, pas de Note Off.
         * Timbre tenu (OPL simple, TVFX type 1, duree 0xFFFF) : Note Off a 1,5 s. */
        bool own = t.isTvfx() && t.duration != 0xFFFF;
        double own_len = own ? (t.duration + 1) / 60.0 : 0;
        double off_at = !own ? 1.5 : (own_len > 8.0 ? 8.0 : 1e9);   /* effet en boucle : Note Off a 8 s */
        double limit = (own && own_len <= 8.0 ? own_len : off_at) + 4.0;
        if (own && own_len > 8.0) fprintf(stderr, "            effet long (%.0f s) : Note Off a 8 s\n", own_len);
        double el = 0;
        bool off = false;
        while (el < limit) {
            run(0.05); el += 0.05;
            if (!off && el >= off_at) { SCTimbreTest::stop(g.adl, TEST_CHAN, TEST_NOTE); off = true; }
            if (g.adl.activeVoices() == 0) break;
        }
        if (g.adl.activeVoices()) {
            fprintf(stderr, "            voix toujours active apres %.1f s : relachement sans fin, coupee par le test\n", limit);
            g.adl.killAll();
        } else {
            fprintf(stderr, "            voix liberee a %.2f s\n", el);
        }
        run(0.3);
    }
    wav_header(f, total);
    fclose(f);
    fprintf(stderr, "%s ecrit (%.1f s)\n", path, total / (double)RATE);
    return 0;
}

int main(int argc, char **argv)
{
    std::string dir, wav, shot, timbre_wav;
    int test_bank = -1;
    bool test_all = false, open_timbre_tab = false;
    double seconds = 30;
    int tune = 4;
    std::vector<std::pair<double, int>> at;
    for (int i = 1; i < argc; i++) {
        std::string a = argv[i];
        if (a == "--sound" && i + 1 < argc) dir = argv[++i];
        else if (a == "--wav" && i + 1 < argc) wav = argv[++i];
        else if (a == "--screenshot" && i + 1 < argc) shot = argv[++i];
        else if (a == "--timbre-wav" && i + 1 < argc) timbre_wav = argv[++i];
        else if (a == "--bank" && i + 1 < argc) test_bank = (int)strtol(argv[++i], nullptr, 0);
        else if (a == "--all") test_all = true;
        else if (a == "--timbre-tab") open_timbre_tab = true;
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
            g.set.trackCount, (int)g.set.linkEntries.size(), (int)g.set.linkTracks.size());
    engine_init();
    if (!timbre_wav.empty()) return timbre_wav_mode(timbre_wav.c_str(), test_bank, test_all);
    if (!wav.empty()) return wav_mode(wav.c_str(), seconds, tune, at);
    std::vector<SCTimbreInfo> timbres = timbre_list();
    static bool tvfx_only = true;
    static int filt_bank = -1, test_note = TEST_NOTE, test_vel = 127, playing = -1;

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
    g.music.request(tune);
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

        if (ImGui::BeginTabBar("tabs")) {
        if (ImGui::BeginTabItem("Musique")) {
        SDL_LockAudioDevice(dev);
        SCMusicSequencer snap = g.music;
        int measure = g.music.measure();
        int beat = g.music.mainCh.handle >= 0 ? g.xmi.beatCount(g.music.mainCh.handle) : 0;
        int voices = g.adl.activeVoices();
        SDL_UnlockAudioDevice(dev);

        char req[16];
        if (snap.requested == 0xFFFF) snprintf(req, sizeof req, "arret"); else snprintf(req, sizeof req, "0x%02X", snap.requested);
        ImGui::Text("Piste courante 0x%02X   demandee %s   etat %s", snap.current, req, state_label(snap.state));
        ImGui::Text("Mesure %d, temps %d   voix actives %d / 16   piste de reprise 0x%02X   erreur %d",
                    measure, beat, voices, snap.resumeTune, snap.error);
        if (snap.lastMatrix >= 0)
            ImGui::Text("Derniere resolution : entree de liaison %d, position %d, valeur 0x%02X -> %s",
                        snap.lastMatrix == 0xFF ? -1 : snap.lastMatrix, snap.lastPos, snap.lastValue,
                        snap.lastValue == 0 ? "bascule directe" :
                        (snap.lastLink >= 0 ? ("piste de liaison " + std::to_string(snap.lastLink)).c_str() : "refusee"));
        if (snap.state == 3) ImGui::TextColored(ImVec4(1, 0.8f, 0.3f, 1), "Liaison %d en cours", snap.linkCh.index);
        bool near = snap.enemyNear & 1;
        if (ImGui::Checkbox("Avion ennemi proche (choix de reprise apres la piste 8)", &near)) {
            SDL_LockAudioDevice(dev); g.music.enemyNear = near ? 1 : 0; SDL_UnlockAudioDevice(dev);
        }
        ImGui::Separator();
        ImGui::Text("Demander une piste (Music_RequestTune) : le changement attend la barre de mesure suivante.");
        for (int t = 0; t < g.set.trackCount; t++) {
            char lbl[160];
            snprintf(lbl, sizeof lbl, "0x%02X  %s##t%d", t, tune_label(t), t);
            bool cur = (t == snap.current && snap.requested != 0xFFFF);
            if (cur) ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(0.2f, 0.5f, 0.2f, 1));
            if (ImGui::Button(lbl, ImVec2(430, 0))) { SDL_LockAudioDevice(dev); g.music.request(t); SDL_UnlockAudioDevice(dev); }
            if (cur) ImGui::PopStyleColor();
            if (t % 2 == 0) ImGui::SameLine();
        }
        ImGui::Separator();
        if (ImGui::Button("Arret avec fondu (1 s)", ImVec2(220, 30))) { SDL_LockAudioDevice(dev); g.music.stop(true); SDL_UnlockAudioDevice(dev); }
        ImGui::SameLine();
        if (ImGui::Button("Arret immediat", ImVec2(220, 30))) { SDL_LockAudioDevice(dev); g.music.stop(false); SDL_UnlockAudioDevice(dev); }
        ImGui::EndTabItem();
        }
        if (ImGui::BeginTabItem("Test des timbres (TVFX)", nullptr,
                                (open_timbre_tab && frame < 2) ? ImGuiTabItemFlags_SetSelected : 0)) {
            ImGui::TextWrapped("Joue un timbre de STRIKE.AD par le pilote, comme une sequence XMIDI : controleur 114 "
                               "(banque), programme (patch), Note On sur le canal MIDI %d. Les TVFX de type 2 ont une "
                               "frequence absolue (la note est ignoree) et une duree propre ; le type 1 et les timbres OPL "
                               "simples tiennent jusqu'au Note Off.", TEST_CHAN + 1);
            if (ImGui::Button("Arreter la musique")) { SDL_LockAudioDevice(dev); g.music.stop(false); SDL_UnlockAudioDevice(dev); }
            ImGui::SameLine();
            if (ImGui::Button("Silence total (outil de test)")) { SDL_LockAudioDevice(dev); g.adl.killAll(); playing = -1; SDL_UnlockAudioDevice(dev); }
            if (ImGui::IsItemHovered())
                ImGui::SetTooltip("N'existe pas dans le pilote : coupe toutes les voix. Certains TVFX ont une courbe de\n"
                                  "relachement qui tient le niveau ; le pilote ne les libere que sous 0x400.");
            ImGui::SameLine(); ImGui::Checkbox("TVFX seulement", &tvfx_only);
            ImGui::SameLine(); ImGui::SetNextItemWidth(120); ImGui::InputInt("banque (-1 = toutes)", &filt_bank);
            ImGui::SetNextItemWidth(200); ImGui::SliderInt("note", &test_note, 0, 127);
            ImGui::SameLine(); ImGui::SetNextItemWidth(200); ImGui::SliderInt("velocite", &test_vel, 1, 127);
            SDL_LockAudioDevice(dev);
            int nv = g.adl.activeVoices();
            std::string vinfo;
            for (int v = 0; v < AILAdlibDriver::VOICES; v++) {
                if (!g.adl.v_state[v]) continue;
                char b[96];
                snprintf(b, sizeof b, "[v%d %s can.MIDI %d OPL %d niv %d/%d] ", v, g.adl.v_state[v] == 2 ? "relache" : "joue",
                         g.adl.v_chan[v] + 1, g.adl.v_opl[v] == 0xFF ? -1 : g.adl.v_opl[v],
                         g.adl.p_val[1][v] >> 10, g.adl.p_val[2][v] >> 10);
                vinfo += b;
            }
            SDL_UnlockAudioDevice(dev);
            ImGui::TextWrapped("Voix actives : %d  %s", nv, vinfo.c_str());
            ImGui::Separator();
            /* liste deroulante des timbres retenus par les filtres */
            std::vector<int> shown;
            for (size_t i = 0; i < timbres.size(); i++) {
                const SCTimbreInfo &t = timbres[i];
                bool tv = t.isTvfx();
                if ((tvfx_only && !tv) || (filt_bank >= 0 && t.bank != filt_bank)) continue;
                shown.push_back((int)i);
            }
            auto label = [&](int i) {
                const SCTimbreInfo &t = timbres[(size_t)i];
                char b[96];
                if (t.isTvfx()) {
                    if (t.duration == 0xFFFF) snprintf(b, sizeof b, "banque %d  patch %3d  -  %s, jusqu'au Note Off", t.bank, t.patch, SCTimbreTest::kindLabel(t.kind));
                    else snprintf(b, sizeof b, "banque %d  patch %3d  -  %s, %.2f s", t.bank, t.patch, SCTimbreTest::kindLabel(t.kind), (t.duration + 1) / 60.0);
                } else snprintf(b, sizeof b, "banque %d  patch %3d  -  %s", t.bank, t.patch, SCTimbreTest::kindLabel(t.kind));
                return std::string(b);
            };
            static int sel = 0;
            if (sel >= (int)shown.size()) sel = shown.empty() ? 0 : (int)shown.size() - 1;
            auto play = [&](int k) {
                if (k < 0 || k >= (int)shown.size()) return;
                SDL_LockAudioDevice(dev);
                if (playing >= 0) SCTimbreTest::stop(g.adl, TEST_CHAN, playing);
                SCTimbreTest::play(g.adl, timbres[(size_t)shown[(size_t)k]], TEST_CHAN, test_note, test_vel);
                playing = test_note;
                SDL_UnlockAudioDevice(dev);
            };
            ImGui::Text("%d timbre(s)", (int)shown.size());
            ImGui::SetNextItemWidth(520);
            if (ImGui::BeginCombo("##timbre", shown.empty() ? "(aucun)" : label(shown[(size_t)sel]).c_str())) {
                for (int k = 0; k < (int)shown.size(); k++) {
                    bool is = (k == sel);
                    if (ImGui::Selectable(label(shown[(size_t)k]).c_str(), is)) sel = k;
                    if (is) ImGui::SetItemDefaultFocus();
                }
                ImGui::EndCombo();
            }
            ImGui::SameLine(); if (ImGui::Button("<")) { if (sel > 0) sel--; play(sel); }
            ImGui::SameLine(); if (ImGui::Button(">")) { if (sel + 1 < (int)shown.size()) sel++; play(sel); }
            if (ImGui::Button("Jouer", ImVec2(160, 32))) play(sel);
            ImGui::SameLine();
            if (ImGui::Button("Stop (Note Off)", ImVec2(160, 32)) && playing >= 0) {
                SDL_LockAudioDevice(dev); SCTimbreTest::stop(g.adl, TEST_CHAN, playing); playing = -1; SDL_UnlockAudioDevice(dev);
            }
            ImGui::TextDisabled("< et > passent au timbre precedent / suivant et le jouent.");
            ImGui::EndTabItem();
        }
        ImGui::EndTabBar();
        }
        ImGui::End();
        ImGui::Render();
        SDL_SetRenderDrawColor(ren, 20, 20, 25, 255);
        SDL_RenderClear(ren);
        ImGui_ImplSDLRenderer2_RenderDrawData(ImGui::GetDrawData(), ren);
        frame++;
        if (!shot.empty() && frame == 120) {             /* --screenshot : capture apres ~2 s */
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
    return 0;
}
