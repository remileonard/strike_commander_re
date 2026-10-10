#include "sc_timbre_test.h"

int sc_timbre_list(const ScMusicData *d, ScTimbreInfo *out, int max)
{
    const uint8_t *p = d->timbre_lib;
    int n = 0;
    if (!p) return 0;
    for (size_t o = 0; o + 6 <= d->timbre_lib_size && n < max; o += 6) {
        if (p[o + 1] == 0xFF) break;                      /* fin de l'index : banque 0xFF */
        const uint8_t *t = sc_data_find_timbre(d, p[o + 1], p[o]);
        if (!t) continue;
        ScTimbreInfo *i = &out[n++];
        i->patch = p[o]; i->bank = p[o + 1];
        i->length = t[0] | (t[1] << 8);
        i->data = t;
        if (i->length == 0x0E) { i->kind = TIMBRE_OPL; i->duration = 0; }
        else if (i->length == 0x19) { i->kind = TIMBRE_OTHER; i->duration = 0; }
        else {
            i->kind = (t[3] == 1) ? TIMBRE_TVFX_NOTE : (t[3] == 2 ? TIMBRE_TVFX_ABS : TIMBRE_OTHER);
            i->duration = t[4] | (t[5] << 8);
        }
    }
    return n;
}

void sc_timbre_play(AdlDriver *a, const ScTimbreInfo *t, int chan, int note, int vel)
{
    adl_send(a, 0xB0 | chan, 114, t->bank);              /* PATCH_BANK_SEL */
    adl_install_timbre(a, t->bank, t->patch, t->data);
    adl_send(a, 0xC0 | chan, t->patch, 0);
    adl_send(a, 0x90 | chan, note, vel);
}

void sc_timbre_stop(AdlDriver *a, int chan, int note) { adl_send(a, 0x80 | chan, note, 0); }

const char *sc_timbre_kind_label(int kind)
{
    switch (kind) {
    case TIMBRE_OPL: return "OPL simple";
    case TIMBRE_TVFX_NOTE: return "TVFX 1 (hauteur = note)";
    case TIMBRE_TVFX_ABS: return "TVFX 2 (freq. absolue)";
    default: return "autre";
    }
}
