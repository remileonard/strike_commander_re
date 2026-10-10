#include "ail_xmidi.h"
#include "adlib_tables.h"
#include <string.h>

#define QUANT_TIME_16 0x208D5          /* 16 000 000 / 120 */
enum { C_PV = 0, C_MODUL = 16, C_PAN = 32, C_EXP = 48, C_SUS = 64, C_PBS = 80,
       C_LOCK = 96, C_PROT = 112, C_VPROT = 128 };

static uint32_t be32(const uint8_t *p) { return ((uint32_t)p[0] << 24) | ((uint32_t)p[1] << 16) | ((uint32_t)p[2] << 8) | p[3]; }
static int tag(const uint8_t *p, const char *t) { return memcmp(p, t, 4) == 0; }
static void send(XmiDriver *x, int st, int d1, int d2) { adl_send(x->adl, st, d1, d2); }

/* VLN XMIDI (7 bits par octet, bit 7 = suite) */
static uint32_t vln(const uint8_t *b, size_t len, size_t *pos)
{
    uint32_t v = 0;
    while (*pos < len) {
        uint8_t c = b[(*pos)++];
        v = (v << 7) | (c & 0x7F);
        if (!(c & 0x80)) break;
    }
    return v;
}

/* ---- find_seq : FORM XMID numero num dans un FORM XMID ou un CAT XMID ---- */
static long find_seq(const uint8_t *b, size_t len, int num)
{
    size_t p = 0;
    for (;;) {
        if (p + 12 > len) return -1;
        int is_cat = tag(b + p, "CAT "), is_form = tag(b + p, "FORM");
        if (!is_cat && !is_form) return -1;
        if (tag(b + p + 8, "XMID")) break;
        p += be32(b + p + 4) + 8;
    }
    if (tag(b + p, "FORM")) return num == 0 ? (long)p : -1;
    size_t end = p + 8 + be32(b + p + 4);
    if (end > len) end = len;
    p += 12;
    int n = 0;
    while (p + 12 <= end) {
        if (tag(b + p + 8, "XMID")) { if (n == num) return (long)p; n++; }
        p += be32(b + p + 4) + 8;
    }
    return -1;
}

/* ---- rewind_seq, version ADLIB.ADV (sub_2DFA) ---- */
static void rewind_seq(XmiSeq *s)
{
    for (int i = 0; i < XMI_FOR_NEST; i++) s->for_cnt[i] = -1;
    for (int c = 0; c < 16; c++) {
        s->chan_map[c] = (uint8_t)c;
        s->chan_program[c] = s->chan_pitch_l[c] = s->chan_pitch_h[c] = s->chan_indirect[c] = 0xFF;
    }
    memset(s->chan_controls, 0xFF, sizeof(s->chan_controls));
    memset(s->note_chan, 0xFF, sizeof(s->note_chan));
    s->interval_cnt = 0; s->note_count = 0;
    s->vol_percent = s->vol_target = 100;
    s->tempo_percent = s->tempo_target = 100;
    s->tempo_error = 0;
    s->beat_count = 0; s->measure_count = 0;
    s->time_fraction = QUANT_TIME_16;
    s->beat_fraction = QUANT_TIME_16;
    s->time_numerator = 4;
    s->time_per_beat = 0x7A1200;          /* 500 000 us/temps * 16 */
}

static void flush_channel_notes(XmiDriver *x, int chan)
{
    for (int h = 0; h < XMI_NSEQS; h++) {
        XmiSeq *s = &x->seq[h];
        if (!s->used || !s->note_count) continue;
        for (int i = 0; i < XMI_MAX_NOTES; i++) {
            if (s->note_chan[i] != chan) continue;
            s->note_chan[i] = 0xFF;
            int m = s->chan_map[chan];
            x->active_notes[m]--;
            send(x, 0x80 | m, s->note_num[i], 0);
            s->note_count--;
        }
    }
}

static void flush_note_queue(XmiDriver *x, XmiSeq *s)
{
    for (int i = 0; i < XMI_MAX_NOTES; i++) {
        if (s->note_chan[i] == 0xFF) continue;
        int m = s->chan_map[s->note_chan[i]];
        s->note_chan[i] = 0xFF;
        x->active_notes[m]--;
        send(x, 0x80 | m, s->note_num[i], 0);
    }
    s->note_count = 0;
}

static int lock_channel(XmiDriver *x)
{
    int best = -1;
    for (int mask = 0xC0;; mask = 0x80) {
        unsigned cl = 0xFFFF;
        for (int c = 8; c >= 1; c--) {
            if (x->lock_status[c] & mask) continue;
            if (x->active_notes[c] >= cl) continue;
            cl = x->active_notes[c]; best = c;
        }
        if (best >= 0 || mask == 0x80) break;
    }
    if (best < 0) return 0;
    send(x, 0xB0 | best, 64, 0);
    flush_channel_notes(x, best);
    x->active_notes[best] = 0;
    x->lock_status[best] |= 0x80;
    return best + 1;
}

static void release_channel(XmiDriver *x, int chan1)
{
    int c = chan1 - 1;
    if (c < 0 || c > 15 || !(x->lock_status[c] & 0x80)) return;
    x->lock_status[c] &= 0x7F;
    x->active_notes[c] = 0;
    send(x, 0xB0 | c, 64, 0);
    send(x, 0xB0 | c, 123, 0);
    for (int i = 0; i < 9; i++) {
        uint8_t v = x->global_controls[i * 16 + c];
        if (v != 0xFF) send(x, 0xB0 | c, ADL_CTRL_LOGGED[i], v);
    }
    if (x->global_program[c] != 0xFF) send(x, 0xC0 | c, x->global_program[c], 0);
    if (x->global_pitch_l[c] != 0xFF && x->global_pitch_h[c] != 0xFF)
        send(x, 0xE0 | c, x->global_pitch_l[c], x->global_pitch_h[c]);
}

static void reset_sequence(XmiDriver *x, XmiSeq *s)
{
    for (int c = 0; c < 16; c++) {
        if ((int8_t)s->chan_controls[C_SUS + c] >= 64) {
            x->global_controls[C_SUS + c] = 0;
            send(x, 0xB0 | c, 64, 0);
        }
        if ((int8_t)s->chan_controls[C_LOCK + c] >= 64) {
            flush_channel_notes(x, c);
            release_channel(x, s->chan_map[c] + 1);
            s->chan_map[c] = (uint8_t)c;
        }
        if ((int8_t)s->chan_controls[C_PROT + c] >= 64) x->lock_status[c] &= 0xBF;
        if ((int8_t)s->chan_controls[C_VPROT + c] >= 64) send(x, 0xB0 | c, 112, 0);
    }
}

static void xmidi_volume(XmiDriver *x, XmiSeq *s)          /* sub_311D */
{
    for (int c = 0; c < 16; c++) {
        uint8_t pv = s->chan_controls[C_PV + c];
        if (pv == 0xFF) continue;
        unsigned v = (unsigned)pv * (unsigned)s->vol_percent / 100u;
        if (v >= 127) v = 127;
        x->global_controls[C_PV + c] = (uint8_t)v;
        if (x->lock_status[c] & 0x80) continue;
        send(x, 0xB0 | s->chan_map[c], 7, (int)v);
    }
}

/* ---- XMIDI_control, version ADLIB.ADV (sub_317C) ---- */
static void xmidi_control(XmiDriver *x, XmiSeq *s, int chan, int con, int val)
{
    if (s->chan_indirect[chan] != 0xFF) s->chan_indirect[chan] = 0xFF;   /* table de controle : NULL dans le jeu */
    if (x->ctrl_hash[con] != 0xFF) {
        int i = x->ctrl_hash[con] + chan;
        x->global_controls[i] = (uint8_t)val;
        s->chan_controls[i] = (uint8_t)val;
    }
    switch (con) {
    case 7:
        if (s->vol_percent != 100) {
            unsigned v = (unsigned)val * (unsigned)s->vol_percent / 100u;
            if (v >= 127) v = 127;
            val = (int)v;
            x->global_controls[C_PV + chan] = (uint8_t)val;
        }
        break;
    case 118:                                   /* CLEAR_BEAT_BAR */
        s->beat_count = 0; s->measure_count = 0;
        s->beat_fraction = s->time_fraction;
        return;
    case 119: return;                           /* CALLBACK_TRIG : pas de fonction de rappel */
    case 116:                                   /* FOR_LOOP */
        for (int i = 0; i < XMI_FOR_NEST; i++)
            if (s->for_cnt[i] == -1) { s->for_cnt[i] = val; s->for_ptrs[i] = s->evnt_ptr; break; }
        return;
    case 117:                                   /* NEXT_LOOP */
        if (val < 64) return;
        for (int i = XMI_FOR_NEST - 1; i >= 0; i--) {
            if (s->for_cnt[i] == -1) continue;
            if (s->for_cnt[i] != 0 && --s->for_cnt[i] == 0) { s->for_cnt[i] = -1; return; }
            s->evnt_ptr = s->for_ptrs[i];
            return;
        }
        return;
    case 111:                                   /* CHAN_PROTECT */
        x->lock_status[chan] |= 0x40;
        if (val < 64) x->lock_status[chan] &= 0xBF;
        return;
    case 110:                                   /* CHAN_LOCK */
        if (val >= 64) {
            int c = lock_channel(x) - 1;
            s->chan_map[chan] = (uint8_t)(c == -1 ? chan : c);
        } else {
            flush_channel_notes(x, chan);
            release_channel(x, s->chan_map[chan] + 1);
            s->chan_map[chan] = (uint8_t)chan;
        }
        return;
    case 115: s->chan_indirect[chan] = (uint8_t)val; return;   /* INDIRECT_C_PFX */
    default: break;
    }
    if (x->lock_status[chan] & 0x80) return;
    send(x, 0xB0 | s->chan_map[chan], con, val);
}

static void restore_sequence(XmiDriver *x, XmiSeq *s)
{
    for (int c = 0; c < 16; c++) {
        uint8_t l = s->chan_controls[C_LOCK + c];
        if (l == 0xFF || (int8_t)l < 64) continue;
        int m = lock_channel(x) - 1;
        s->chan_map[c] = (uint8_t)(m == -1 ? c : m);
    }
    for (int i = 0; i < 9; i++) {
        int con = ADL_CTRL_LOGGED[i];
        if (con == 110) continue;
        for (int c = 0; c < 16; c++) {
            uint8_t v = s->chan_controls[i * 16 + c];
            if (v != 0xFF) xmidi_control(x, s, c, con, v);
        }
    }
    for (int c = 0; c < 16; c++) {
        if (s->chan_pitch_l[c] != 0xFF && s->chan_pitch_h[c] != 0xFF)
            send(x, 0xE0 | s->chan_map[c], s->chan_pitch_l[c], s->chan_pitch_h[c]);
        if (s->chan_program[c] != 0xFF) send(x, 0xC0 | s->chan_map[c], s->chan_program[c], 0);
    }
}

void xmi_init(XmiDriver *x, AdlDriver *adl)
{
    memset(x, 0, sizeof(*x));
    x->adl = adl;
    memset(x->global_controls, 0xFF, sizeof(x->global_controls));
    memset(x->global_program, 0xFF, sizeof(x->global_program));
    memset(x->global_pitch_l, 0xFF, sizeof(x->global_pitch_l));
    memset(x->global_pitch_h, 0xFF, sizeof(x->global_pitch_h));
    memset(x->ctrl_hash, 0xFF, sizeof(x->ctrl_hash));
    for (int i = 0; i < 9; i++) x->ctrl_hash[ADL_CTRL_LOGGED[i]] = (uint8_t)(i * 16);
    for (int i = 0; i < 9; i++) {                          /* valeurs initiales, canaux 1..9 */
        uint8_t v = ADL_CTRL_DEFAULT[i];
        if (v == 0xFF) continue;
        for (int c = 1; c <= 9; c++) {
            x->global_controls[i * 16 + c] = v;
            send(x, 0xB0 | c, ADL_CTRL_LOGGED[i], v);
        }
    }
    for (int c = 1; c <= 9; c++) {
        x->global_pitch_l[c] = 0; x->global_pitch_h[c] = 0x40;
        send(x, 0xE0 | c, 0, 0x40);
        uint8_t prg = ADL_PRG_DEFAULT[c - 1];
        if (prg != 0xFF) { x->global_program[c] = prg; send(x, 0xC0 | c, prg, 0); }
    }
}

int xmi_register(XmiDriver *x, const uint8_t *data, size_t len, int num)
{
    int h;
    for (h = 0; h < XMI_NSEQS; h++) if (!x->seq[h].used) break;
    if (h == XMI_NSEQS) return -1;
    long f = find_seq(data, len, num);
    if (f < 0) return -1;
    XmiSeq *s = &x->seq[h];
    memset(s, 0, sizeof(*s));
    s->base = data; s->len = len;
    size_t p = (size_t)f + 12;
    size_t end = (size_t)f + 8 + be32(data + f + 4);
    if (end > len) end = len;
    while (p + 8 <= end) {
        if (tag(data + p, "TIMB")) s->timb = p;
        else if (tag(data + p, "EVNT")) { s->evnt = p; break; }
        p += be32(data + p + 4) + 8;
    }
    if (!s->evnt) return -1;
    s->used = 1;
    s->status = SEQ_STOPPED;
    rewind_seq(s);
    return h;
}

void xmi_release(XmiDriver *x, int h)
{
    if (h < 0 || !x->seq[h].used) return;
    if (x->seq[h].status == SEQ_PLAYING) { x->seq[h].post_release = 1; return; }
    x->seq[h].used = 0;
}

void xmi_stop(XmiDriver *x, int h)
{
    if (h < 0 || !x->seq[h].used) return;
    XmiSeq *s = &x->seq[h];
    if (s->status != SEQ_PLAYING) return;
    flush_note_queue(x, s);
    reset_sequence(x, s);
    s->status = SEQ_STOPPED;
}

void xmi_start(XmiDriver *x, int h)
{
    if (h < 0 || !x->seq[h].used) return;
    XmiSeq *s = &x->seq[h];
    if (s->status == SEQ_PLAYING) xmi_stop(x, h);
    rewind_seq(s);
    s->evnt_ptr = s->evnt + 8;
    s->status = SEQ_PLAYING;
    s->seq_started = 1;
}

void xmi_resume(XmiDriver *x, int h)
{
    if (h < 0 || !x->seq[h].used) return;
    XmiSeq *s = &x->seq[h];
    if (s->status != SEQ_STOPPED || !s->seq_started) return;
    restore_sequence(x, s);
    s->status = SEQ_PLAYING;
}

int xmi_status(XmiDriver *x, int h) { return (h < 0 || !x->seq[h].used) ? -1 : x->seq[h].status; }
int xmi_bar_count(XmiDriver *x, int h) { return (h < 0 || !x->seq[h].used) ? -1 : x->seq[h].measure_count; }
int xmi_beat_count(XmiDriver *x, int h) { return (h < 0 || !x->seq[h].used) ? -1 : x->seq[h].beat_count; }
int xmi_rel_volume(XmiDriver *x, int h) { return (h < 0 || !x->seq[h].used) ? -1 : x->seq[h].vol_percent; }

void xmi_set_rel_volume(XmiDriver *x, int h, int vol, int ms)
{
    if (h < 0 || !x->seq[h].used) return;
    XmiSeq *s = &x->seq[h];
    s->vol_target = vol;
    if (ms == 0) { s->vol_percent = vol; xmidi_volume(x, s); return; }
    int delta = s->vol_target - s->vol_percent;
    if (delta < 0) delta = -delta;
    if (!delta) return;
    uint32_t period = (uint32_t)(10u * (unsigned)ms) / (uint32_t)delta;
    s->vol_period = period ? period : 1;
    s->vol_accum = 0;
}

/* get_request (fonction 0x9B, 0x1CC7) : premier timbre du chunk TIMB absent du cache */
int xmi_timbre_request(XmiDriver *x, int h)
{
    if (h < 0 || !x->seq[h].used || !x->seq[h].timb) return 0xFFFF;
    const uint8_t *t = x->seq[h].base + x->seq[h].timb;
    int n = t[8] | (t[9] << 8);
    for (int i = 0; i < n; i++) {
        int patch = t[10 + 2 * i], bank = t[11 + 2 * i];
        if (!adl_timbre_status(x->adl, bank, patch)) return (bank << 8) | patch;
    }
    return 0xFFFF;
}

/* ---- XMIDI_note_on (sub_3360) ---- */
static size_t note_on(XmiDriver *x, XmiSeq *s)
{
    const uint8_t *b = s->base;
    size_t p = s->evnt_ptr;
    int chan = b[p] & 0x0F, note = b[p + 1], vel = b[p + 2];
    size_t q = p + 3;
    uint32_t dur = vln(b, s->len, &q);
    size_t len = q - p;
    if (x->lock_status[chan] & 0x80) return len;
    int slot = 0;
    for (int i = 0; i < XMI_MAX_NOTES; i++) if (s->note_chan[i] == 0xFF) { slot = i; s->note_count++; break; }
    s->note_chan[slot] = (uint8_t)chan;
    s->note_num[slot] = (uint8_t)note;
    s->note_time[slot] = (int32_t)dur - 1;
    int m = s->chan_map[chan];
    x->active_notes[m]++;
    send(x, 0x90 | m, note, vel);
    return len;
}

/* ---- XMIDI_meta, version ADLIB.ADV (sub_3418) ---- */
static size_t meta(XmiDriver *x, XmiSeq *s, int h)
{
    const uint8_t *b = s->base;
    size_t p = s->evnt_ptr;
    int type = b[p + 1];
    size_t q = p + 2;
    uint32_t dlen = vln(b, s->len, &q);
    size_t ev_len = (q - p) + dlen;
    const uint8_t *d = b + q;
    if (type == 0x2F) {
        reset_sequence(x, s);
        s->status = SEQ_DONE;
        if (s->post_release) { s->used = 0; }
        (void)h;
    } else if (type == 0x58) {
        s->time_numerator = d[0];
        int cl = d[1] - 2;
        int32_t tf;
        if (cl >= 0) tf = QUANT_TIME_16 * (1 << cl);
        else tf = QUANT_TIME_16 >> (-cl);
        s->time_fraction = tf;
        s->beat_fraction = tf;
    } else if (type == 0x51) {
        uint32_t us = ((uint32_t)d[0] << 16) | ((uint32_t)d[1] << 8) | d[2];
        s->time_per_beat = (int32_t)(us << 4);
    }
    return ev_len;
}

static size_t sysex(XmiSeq *s)
{
    size_t p = s->evnt_ptr, q = p + 1;
    uint32_t n = vln(s->base, s->len, &q);
    return (q - p) + n;
}

static void grad(int *percent, int target, uint32_t *accum, uint32_t period)
{
    int up = *percent < target;
    uint32_t a = *accum + 83;                   /* QUANT_TIME / 100 */
    int cx = -1;
    for (;;) {
        cx++;
        *accum = a;
        if ((int32_t)(a - period) < 0) break;
        a -= period;
    }
    if (!cx) return;
    int v = up ? *percent + cx : *percent - cx;
    if (up ? v > target : v < target) v = target;
    *percent = v;
}

void xmi_serve(XmiDriver *x)
{
    for (int h = 0; h < XMI_NSEQS; h++) {
        XmiSeq *s = &x->seq[h];
        if (!s->used || s->status != SEQ_PLAYING) continue;
        x->current = h;
        int ax = s->tempo_error + s->tempo_percent;
        s->tempo_error = ax;
        ax -= 100;
        int done = 0;
        while (ax >= 0) {
            s->tempo_error = ax;
            int32_t bf = s->beat_fraction + s->time_fraction;
            if (bf >= s->time_per_beat) {
                bf -= s->time_per_beat;
                if (++s->beat_count >= s->time_numerator) { s->beat_count = 0; s->measure_count++; }
            }
            s->beat_fraction = bf;

            if (s->note_count) {
                for (int i = 0; i < XMI_MAX_NOTES && s->note_count; i++) {
                    if (s->note_chan[i] == 0xFF) continue;
                    if (--s->note_time[i] >= 0) continue;
                    int m = s->chan_map[s->note_chan[i]];
                    s->note_chan[i] = 0xFF;
                    x->active_notes[m]--;
                    send(x, 0x80 | m, s->note_num[i], 0);
                    s->note_count--;
                }
            }
            if (--s->interval_cnt <= 0) {
                for (;;) {
                    if (s->evnt_ptr >= s->len) { s->status = SEQ_DONE; break; }
                    const uint8_t *b = s->base;
                    size_t p = s->evnt_ptr;
                    int st = b[p];
                    if (st < 0x80) { s->evnt_ptr++; s->interval_cnt = st; break; }
                    int op = st & 0xF0, ch = st & 0x0F;
                    int d1 = (p + 1 < s->len) ? b[p + 1] : 0, d2 = (p + 2 < s->len) ? b[p + 2] : 0;
                    size_t sz;
                    if (op == 0xF0) sz = (ch == 0x0F) ? meta(x, s, h) : sysex(s);
                    else if (op == 0xE0) {
                        s->chan_pitch_l[ch] = (uint8_t)d1; s->chan_pitch_h[ch] = (uint8_t)d2;
                        x->global_pitch_l[ch] = (uint8_t)d1; x->global_pitch_h[ch] = (uint8_t)d2;
                        sz = 3;
                        if (!(x->lock_status[ch] & 0x80)) send(x, op | s->chan_map[ch], d1, d2);
                    } else if (op == 0xD0) {
                        sz = 2;
                        if (!(x->lock_status[ch] & 0x80)) send(x, op | s->chan_map[ch], d1, d2);
                    } else if (op == 0xC0) {
                        s->chan_program[ch] = (uint8_t)d1; x->global_program[ch] = (uint8_t)d1;
                        sz = 2;
                        if (!(x->lock_status[ch] & 0x80)) send(x, op | s->chan_map[ch], d1, d2);
                    } else if (op == 0xB0) { xmidi_control(x, s, ch, d1, d2); sz = 3; }
                    else if (op == 0xA0) {
                        sz = 3;
                        if (!(x->lock_status[ch] & 0x80)) send(x, op | s->chan_map[ch], d1, d2);
                    } else sz = note_on(x, s);
                    s->evnt_ptr += sz;
                    if (!s->used || s->status != SEQ_PLAYING) { done = 1; break; }
                }
                if (done) break;
            }
            ax = s->tempo_error - 100;
        }
        if (done) continue;
        if (s->tempo_percent != s->tempo_target)
            grad(&s->tempo_percent, s->tempo_target, &s->tempo_accum, s->tempo_period);
        if (s->vol_percent != s->vol_target) {
            grad(&s->vol_percent, s->vol_target, &s->vol_accum, s->vol_period);
            xmidi_volume(x, s);
        }
    }
    adl_serve(x->adl);
}
