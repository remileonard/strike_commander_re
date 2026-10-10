#include "sc_music.h"
#include <stdio.h>

static void chan_stop(ScMusic *m, ScChannel *c)                 /* Music_ChannelStopSequence_59F1D */
{
    if (c->handle < 0) return;
    xmi_stop(m->xmi, c->handle);
    xmi_release(m->xmi, c->handle);
    c->handle = -1;
}

/* Music_InstallTimbre_5A62A : bibliotheque -> AIL_install_timbre ; absent -> byte_7084A = 4 */
static int install_timbre(ScMusic *m, int bank, int patch)
{
    if (adl_timbre_status(m->xmi->adl, bank, patch)) return 1;
    const uint8_t *t = sc_data_find_timbre(m->data, bank, patch);
    if (!t) {
        m->error = 4;
        fprintf(stderr, "timbre absent de la bibliotheque : banque %d, patch %d\n", bank, patch);
        return 0;
    }
    adl_install_timbre(m->xmi->adl, bank, patch, t);
    return 1;
}

/* Music_ChannelRegisterSequence_59FF5 + AIL_start_sequence */
static void chan_play(ScMusic *m, ScChannel *c, const ScBlob *b, int is_link, int index)
{
    c->is_link = is_link; c->index = index;
    if (!b || !b->data) { m->error = 3; return; }
    c->handle = xmi_register(m->xmi, b->data, b->size, 0);
    if (c->handle < 0) { m->error = 3; return; }
    /* boucle AIL_timbre_request -> Music_InstallTimbre jusqu'a 0xFFFF. Le jeu boucle sans fin
     * sur un timbre introuvable ; ici on s'arrete et on le signale. */
    for (int guard = 0; guard < 256; guard++) {
        int r = xmi_timbre_request(m->xmi, c->handle);
        if (r == 0xFFFF) break;
        if (!install_timbre(m, r >> 8, r & 0xFF)) break;
    }
    xmi_start(m->xmi, c->handle);
}

static const ScBlob *track(ScMusic *m, int i)
{
    return (i >= 0 && i < m->data->track_count) ? &m->data->tracks[i] : NULL;
}

void sc_music_init(ScMusic *m, XmiDriver *x, ScMusicData *d)
{
    m->xmi = x; m->data = d;
    m->main_ch.handle = m->link_ch.handle = -1;
    m->requested = 0xFFFF; m->current = 0; m->state = 0;
    m->resume_tune = 0; m->measure_at_req = 0; m->main_playing = 0;
    m->enemy_near = 0; m->error = 0; m->fading = 0;
    m->last_matrix = m->last_pos = m->last_value = m->last_link = -1;
}

void sc_music_request(ScMusic *m, int tune)
{
    if (tune < m->data->track_count) m->requested = tune;
    else if (tune != 0xFF) fprintf(stderr, "Invalid tune requested: %d\n", tune);
}

int sc_music_measure(ScMusic *m)
{
    return m->main_ch.handle >= 0 ? xmi_bar_count(m->xmi, m->main_ch.handle) : 0;
}

static int seq_done(ScMusic *m, ScChannel *c)
{
    return c->handle < 0 ? 1 : xmi_status(m->xmi, c->handle) == SEQ_DONE;
}

/* Music_TuneTransitionResolve_595C2 */
static void resolve(ScMusic *m)
{
    if (m->requested >= 0x10 && m->requested <= 0x12) {      /* ponctuation : piste de reprise */
        if (m->current == 5) m->resume_tune = 4;
        else if (m->current == 8) m->resume_tune = (m->enemy_near & 1) ? 4 : 0x13;
        else if (m->current == 0x15) m->resume_tune = 0x13;
        else m->resume_tune = m->current;
    }
    int A = m->data->phrase_len[m->current];
    int r = A ? (int)((int16_t)m->measure_at_req % A) : 0;    /* 'cwd / idiv bx' */
    m->measure_at_req = r ? r + 1 : m->data->phrase_last[m->current];
    uint8_t e = m->data->matrix[m->current * m->data->track_count + m->requested];
    uint8_t v = 0;
    if (e != 0xFF && e < m->data->link_entry_count && m->measure_at_req < m->data->link_entry_len[e])
        v = m->data->link_entry[e][m->measure_at_req];
    m->last_matrix = e; m->last_pos = m->measure_at_req; m->last_value = v; m->last_link = -1;

    if (v == 0) {                                             /* bascule directe */
        chan_stop(m, &m->main_ch);
        m->current = m->requested;
        chan_play(m, &m->main_ch, track(m, m->current), 0, m->current);
        m->main_playing = 1;
        m->state = 1;
        return;
    }
    if (v & 0x80) v &= 0x7F;                                  /* la piste principale continue */
    else { chan_stop(m, &m->main_ch); m->main_playing = 0; }
    if (v > m->data->link_track_count) {                      /* refus */
        m->error = 2;
        m->state = 1;
        m->requested = m->current;
        return;
    }
    m->last_link = v - 1;
    chan_play(m, &m->link_ch, &m->data->link_tracks[v - 1], 1, v - 1);
    m->state = 3;
}

/* Music_TuneTransitionCommit_5974D */
static void commit(ScMusic *m)
{
    chan_stop(m, &m->link_ch);
    if (m->main_playing == 1) chan_stop(m, &m->main_ch);
    m->current = m->requested & 0xFF;
    int di = m->current;
    chan_play(m, &m->main_ch, track(m, m->current), 0, m->current);
    m->main_playing = 1;
    if (di >= 0x10 && di <= 0x12) m->requested = m->resume_tune;
}

void sc_music_tick(ScMusic *m)
{
    if (m->fading) {                                          /* attente de la fin du fondu */
        if (m->main_ch.handle < 0 || xmi_rel_volume(m->xmi, m->main_ch.handle) == 0) {
            chan_stop(m, &m->main_ch);
            m->fading = 0;
        }
        return;
    }
    if (m->requested == 0xFFFF) return;
    switch (m->state) {
    case 0:
        m->current = m->requested & 0xFF;
        chan_play(m, &m->main_ch, track(m, m->current), 0, m->current);
        m->main_playing = 1;
        m->state = 1;
        break;
    case 1:
        if (m->current != m->requested) {
            m->measure_at_req = sc_music_measure(m);
            m->state = 2;
        } else if (seq_done(m, &m->main_ch)) {
            m->requested = m->resume_tune;
        }
        break;
    case 2:
        if (m->current == m->requested) { m->state = 1; break; }
        if (sc_music_measure(m) != m->measure_at_req || seq_done(m, &m->main_ch)) resolve(m);
        break;
    case 3:
        if (seq_done(m, &m->link_ch)) { commit(m); m->state = 1; }
        break;
    default:
        m->error = 1;
        break;
    }
}

void sc_music_stop(ScMusic *m, int fade)
{
    m->requested = 0xFFFF;
    m->state = 0;
    chan_stop(m, &m->link_ch);
    if (fade && m->main_ch.handle >= 0) {
        xmi_set_rel_volume(m->xmi, m->main_ch.handle, 0, 1000);
        m->fading = 1;
    } else {
        chan_stop(m, &m->main_ch);
    }
}
