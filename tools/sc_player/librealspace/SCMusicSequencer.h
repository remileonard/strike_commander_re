//
//  SCMusicSequencer.h
//  libRealSpace
//
//  Sequenceur musical du jeu (seg121-125), porte d'apres le code :
//    Music_RequestTune_5A984, Music_SequencerTickISR_5940B (20 Hz, 4 etats),
//    Music_TuneTransitionResolve_595C2, Music_TuneTransitionCommit_5974D,
//    Music_ChannelRegisterSequence_59FF5, Music_ChannelStopSequence_59F1D,
//    Music_InstallTimbre_5A62A, Music_StopWithFade_AB1EF.
//  Voir strike_commander_re/analysis/MUSIC_SYSTEM.md section 4.
//
#pragma once
#include "AILXmidiDriver.h"
#include "SCMusicSet.h"

class SCMusicSequencer {
public:
    struct Channel { int handle = -1; int isLink = 0; int index = 0; };   // 5BE3h / 5BF5h

    void init(AILXmidiDriver *xmi, const SCTimbreLibrary *lib);
    void setMusicSet(const SCMusicSet *set);     // jeu de pistes utilise (COMBAT, ...)
    void request(int tune);                      // Music_RequestTune_5A984
    void tick();                                 // a appeler a 20 Hz
    void stop(bool fade);                        // Music_StopWithFade_AB1EF
    int  measure();                              // AIL_measure_count du canal principal
    bool active() const { return requested != 0xFFFF || fading; }

    // Music_ChannelRegisterSequence_59FF5 : enregistre la sequence, installe ses timbres
    // (AIL_timbre_request -> Music_InstallTimbre_5A62A), puis AIL_start_sequence.
    // Renvoie le handle, ou -1. Utilisable aussi pour jouer une piste isolee.
    static int registerAndStart(AILXmidiDriver *xmi, const SCTimbreLibrary *lib,
                                const uint8_t *data, size_t size, int *error);

    // etat (public pour l'affichage)
    Channel mainCh, linkCh;
    int requested = 0xFFFF;   // word_70859 (0xFFFF = arret)
    int current = 0;          // byte_72C90
    int state = 0;            // byte_70858
    int resumeTune = 0;       // word_7085B
    int measureAtReq = 0;     // word_72C91 (mesure, puis position dans la phrase)
    int mainPlaying = 0;      // byte_72CA1
    int enemyNear = 0;        // byte_7086A bit 0 (choix de reprise apres la piste 8)
    int error = 0;            // byte_7084A
    bool fading = false;
    int lastMatrix = -1, lastPos = -1, lastValue = -1, lastLink = -1;

private:
    AILXmidiDriver *xmi = nullptr;
    const SCTimbreLibrary *lib = nullptr;
    const SCMusicSet *set = nullptr;
    void chanStop(Channel &c);
    void chanPlay(Channel &c, const std::vector<uint8_t> *b, int isLink, int index);
    const std::vector<uint8_t> *track(int i);
    bool seqDone(Channel &c);
    void resolve();
    void commit();
};
