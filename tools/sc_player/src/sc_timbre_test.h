/*
 * sc_timbre_test.h - Test des timbres de la bibliotheque (STRIKE.AD), en particulier TVFX.
 *
 * Joue un timbre directement par le pilote, comme le ferait une sequence XMIDI :
 * controleur 114 (banque), changement de programme (patch), Note On, puis Note Off.
 * Le timbre est installe dans le cache du pilote comme Music_InstallTimbre_5A62A.
 */
#ifndef SC_TIMBRE_TEST_H
#define SC_TIMBRE_TEST_H
#include "sc_data.h"
#include "ail_adlib.h"

enum { TIMBRE_OPL = 0, TIMBRE_TVFX_NOTE = 1, TIMBRE_TVFX_ABS = 2, TIMBRE_OTHER = 3 };

typedef struct {
    int bank, patch, length;
    int kind;              /* TIMBRE_* : longueur 0x0E = OPL simple ; sinon octet +3 = type TVFX */
    int duration;          /* TVFX : octet +4 (ticks a 60 Hz) ; 0xFFFF = jusqu'au Note Off */
    const uint8_t *data;
} ScTimbreInfo;

int  sc_timbre_list(const ScMusicData *d, ScTimbreInfo *out, int max);
void sc_timbre_play(AdlDriver *a, const ScTimbreInfo *t, int chan, int note, int vel);
void sc_timbre_stop(AdlDriver *a, int chan, int note);
const char *sc_timbre_kind_label(int kind);
#endif
