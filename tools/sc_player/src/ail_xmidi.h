/*
 * ail_xmidi.h - Interpreteur XMIDI du pilote ADLIB.ADV (shell XMIDI.ASM d'AIL 2.0).
 *
 * Porte d'apres analysis/ail_sources/XMIDI.ASM, avec les ecarts de la version compilee
 * dans ADLIB.ADV (lus dans adlib.asm) :
 *  - rewind (sub_2DFA) : compteur de mesures a 0 (et non -1), fraction de temps
 *    initialisee a QUANT_TIME_16 (4/4 par defaut) ;
 *  - signature rythmique (sub_3418) : ne remet pas le compteur de temps a 0 et
 *    n'incremente pas le compteur de mesures ;
 *  - CLEAR_BEAT_BAR (sub_317C) : fraction de temps = fraction par intervalle ;
 *  - service (0x35B1) : le temps est avance AVANT la file de notes et les evenements ;
 *  - get_bar_count / get_beat_count renvoient les compteurs bruts (pas d'anticipation).
 * Service a 120 Hz (QUANT_RATE, champ "service_rate" du descripteur du pilote).
 */
#ifndef AIL_XMIDI_H
#define AIL_XMIDI_H
#include <stdint.h>
#include <stddef.h>
#include "ail_adlib.h"

#define XMI_NSEQS     8
#define XMI_MAX_NOTES 32
#define XMI_FOR_NEST  4

enum { SEQ_STOPPED = 0, SEQ_PLAYING = 1, SEQ_DONE = 2 };

typedef struct {
    int used;
    const uint8_t *base; size_t len;          /* donnees XMIDI (FORM XMID) */
    size_t timb, evnt;                        /* offsets des chunks TIMB / EVNT (0 si absent) */
    size_t evnt_ptr;                          /* EVNT_ptr */
    int    seq_started, status, post_release;
    int    interval_cnt, note_count;
    int    vol_percent, vol_target; uint32_t vol_accum, vol_period;
    int    tempo_error, tempo_percent, tempo_target; uint32_t tempo_accum, tempo_period;
    int    beat_count, measure_count, time_numerator;
    int32_t time_fraction, beat_fraction, time_per_beat;
    size_t for_ptrs[XMI_FOR_NEST]; int for_cnt[XMI_FOR_NEST];
    uint8_t chan_map[16], chan_program[16], chan_pitch_l[16], chan_pitch_h[16], chan_indirect[16];
    uint8_t chan_controls[9 * 16];            /* ctrl_log : [controle*16 + canal] */
    uint8_t note_chan[XMI_MAX_NOTES], note_num[XMI_MAX_NOTES];
    int32_t note_time[XMI_MAX_NOTES];
} XmiSeq;

typedef struct {
    AdlDriver *adl;
    XmiSeq seq[XMI_NSEQS];
    int    current;
    uint8_t ctrl_hash[256];
    uint8_t global_controls[9 * 16], global_program[16], global_pitch_l[16], global_pitch_h[16];
    uint8_t active_notes[16], lock_status[16];
} XmiDriver;

void xmi_init(XmiDriver *x, AdlDriver *adl);                   /* init_driver */
int  xmi_register(XmiDriver *x, const uint8_t *data, size_t len, int num); /* register_seq, -1 si echec */
void xmi_release(XmiDriver *x, int h);
void xmi_start(XmiDriver *x, int h);
void xmi_stop(XmiDriver *x, int h);
void xmi_resume(XmiDriver *x, int h);
int  xmi_status(XmiDriver *x, int h);
int  xmi_bar_count(XmiDriver *x, int h);
int  xmi_beat_count(XmiDriver *x, int h);
void xmi_set_rel_volume(XmiDriver *x, int h, int vol, int ms);
int  xmi_rel_volume(XmiDriver *x, int h);
int  xmi_timbre_request(XmiDriver *x, int h);                  /* (banque<<8)|patch, ou 0xFFFF */
void xmi_serve(XmiDriver *x);                                  /* a appeler a 120 Hz */
#endif
