/*
 * sc_music.h - Sequenceur musical du jeu (seg121-125), porte d'apres le code :
 *   Music_RequestTune_5A984, Music_SequencerTickISR_5940B (20 Hz, 4 etats),
 *   Music_TuneTransitionResolve_595C2, Music_TuneTransitionCommit_5974D,
 *   Music_ChannelRegisterSequence_59FF5, Music_ChannelStopSequence_59F1D,
 *   Music_InstallTimbre_5A62A, Music_StopWithFade_AB1EF.
 * Voir analysis/MUSIC_SYSTEM.md section 4.
 */
#ifndef SC_MUSIC_H
#define SC_MUSIC_H
#include "ail_xmidi.h"
#include "sc_data.h"

typedef struct { int handle; int is_link; int index; } ScChannel;   /* 5BE3h / 5BF5h */

typedef struct {
    XmiDriver   *xmi;
    ScMusicData *data;
    ScChannel    main_ch, link_ch;
    int  requested;        /* word_70859 (0xFFFF = arret) */
    int  current;          /* byte_72C90 */
    int  state;            /* byte_70858 */
    int  resume_tune;      /* word_7085B */
    int  measure_at_req;   /* word_72C91 (mesure, puis position dans la phrase) */
    int  main_playing;     /* byte_72CA1 */
    int  enemy_near;       /* byte_7086A bit 0 (test 'avion ennemi proche' pour la piste 8) */
    int  error;            /* byte_7084A */
    int  fading;           /* arret avec fondu en cours */
    /* derniere resolution, pour l'affichage */
    int  last_matrix, last_pos, last_value, last_link;
} ScMusic;

void sc_music_init(ScMusic *m, XmiDriver *x, ScMusicData *d);
void sc_music_request(ScMusic *m, int tune);         /* Music_RequestTune_5A984 */
void sc_music_tick(ScMusic *m);                       /* ISR a 20 Hz */
void sc_music_stop(ScMusic *m, int fade);             /* Music_StopWithFade_AB1EF */
int  sc_music_measure(ScMusic *m);                    /* AIL_measure_count du canal principal */
#endif
