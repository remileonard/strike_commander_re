/*
 * ail_adlib.c - Portage ligne a ligne de la partie voix du pilote ADLIB.ADV.
 * Les commentaires citent la routine et, quand c'est utile, l'instruction d'origine.
 */
#include "ail_adlib.h"
#include "adlib_tables.h"
#include <stdlib.h>
#include <string.h>

enum { P_FREQ, P_LVL0, P_LVL1, P_PRIO, P_FB, P_MULT0, P_MULT1, P_WAVE };

static uint16_t rw(const uint8_t *t, int off) { return (uint16_t)(t[off] | (t[off + 1] << 8)); }
static int16_t  s16(uint16_t v) { return (int16_t)v; }

static void wr_op(AdlDriver *d, int op, int reg, uint8_t val)   /* sub_19B4 -> sub_19EB */
{
    d->write(d->user, (uint16_t)(reg + ADL_OP_OFFSET[op]), val);
}
static void wr_ch(AdlDriver *d, int ch, int reg, uint8_t val)   /* sub_19D0 -> sub_19EB */
{
    d->write(d->user, (uint16_t)(reg + ADL_CH_OFFSET[ch]), val);
}

/* 'mul / shl ax,1 / mov al,ah / cmp al,1 / sbb al,0FFh' : (a*b)/128, +1 si non nul */
static uint8_t scale127(uint8_t a, uint8_t b)
{
    uint8_t r = (uint8_t)(((unsigned)a * b * 2u) >> 8);
    return r ? (uint8_t)(r + 1) : 0;
}

/* ---- sub_1B7A : recherche (banque, patch) dans le cache ---- */
static int cache_find(AdlDriver *d, int bank, int patch)
{
    for (int i = 0; i < ADL_CACHE; i++)
        if ((d->c_flags[i] & 0x80) && d->c_bank[i] == bank && d->c_patch[i] == patch) return i;
    return -1;
}

/* ---- sub_20B2 : ecrit les registres OPL marques "sales" pour la voix v ---- */
static void update_voice(AdlDriver *d, int v)
{
    int opl = d->v_opl[v];
    if (opl == 0xFF) return;
    uint8_t vol = 0;
    if (d->v_dirty[v] & 0x40) {
        int c = d->v_chan[v] & 0x0F;
        vol = scale127(d->m_vol[c], d->m_expr[c]);
        vol = scale127(vol, d->v_vel[v]);
    }
    int opm = ADL_OP_MOD[opl], opc = ADL_OP_CAR[opl];

    if (d->v_dirty[v] & 0x80) {          /* registre 0x20 */
        int vib = (d->m_mod[d->v_chan[v] & 0x0F] >= 0x40) ? 0x40 : 0;
        wr_op(d, opm, 0x20, (uint8_t)(((d->p_val[P_MULT0][v] >> 12) & 0x0F) | vib | d->v_avekm0[v]));
        wr_op(d, opc, 0x20, (uint8_t)(((d->p_val[P_MULT1][v] >> 12) & 0x0F) | vib | d->v_avekm1[v]));
        d->v_dirty[v] &= 0x7F;
    }
    if (d->v_dirty[v] & 0x40) {          /* registre 0x40 */
        uint8_t l = (uint8_t)(d->p_val[P_LVL0][v] >> 10);
        if (d->v_velmask[v] & 1) l = (uint8_t)((unsigned)l * vol / 127u);
        wr_op(d, opm, 0x40, (uint8_t)((~l & 0x3F) | d->v_ksl0[v]));
        l = (uint8_t)(d->p_val[P_LVL1][v] >> 10);
        if (d->v_velmask[v] & 2) l = (uint8_t)((unsigned)l * vol / 127u);
        wr_op(d, opc, 0x40, (uint8_t)((~l & 0x3F) | d->v_ksl1[v]));
        d->v_dirty[v] &= 0xBF;
    }
    if (d->v_dirty[v] & 0x20) {          /* registres 0x60 / 0x80 */
        wr_op(d, opm, 0x60, d->v_ad0[v]);
        wr_op(d, opc, 0x60, d->v_ad1[v]);
        wr_op(d, opm, 0x80, d->v_sr0[v]);
        wr_op(d, opc, 0x80, d->v_sr1[v]);
        d->v_dirty[v] &= 0xDF;
    }
    if (d->v_dirty[v] & 0x10) {          /* registre 0xE0 : octet bas -> porteur, haut -> mod */
        wr_op(d, opc, 0xE0, (uint8_t)(d->p_val[P_WAVE][v] & 0xFF));
        wr_op(d, opm, 0xE0, (uint8_t)(d->p_val[P_WAVE][v] >> 8));
        d->v_dirty[v] &= 0xEF;
    }
    if (d->v_dirty[v] & 0x08) {          /* registre 0xC0 */
        uint8_t ah = (uint8_t)((d->p_val[P_FB][v] >> 4) >> 8) & 0x0E;
        wr_ch(d, opl, 0xC0, (uint8_t)(ah | (d->v_conn[v] & 1)));
        d->v_dirty[v] &= 0xF7;
    }
    if (d->v_dirty[v] & 0x01) {          /* registres 0xA0 / 0xB0 */
        uint16_t f;
        if (d->v_type[v] == 2) {
            f = (uint16_t)(d->p_val[P_FREQ][v] >> 6);
        } else if (!(d->v_keyon[v] & 0x20)) {
            wr_ch(d, opl, 0xB0, (uint8_t)(d->v_b0[v] & 0xDF));
            d->v_dirty[v] &= 0xFE;
            return;
        } else {
            int c = d->v_chan[v];
            int16_t bend = (int16_t)((((int)d->m_bend_h[c] << 7) | d->m_bend_l[c]) - 0x2000);
            bend = (int16_t)(bend >> 5);
            int16_t ax = (int16_t)(bend * 12);                 /* 'mov cl,0Ch / imul cx' */
            int bx = d->v_note[v] + d->v_transpose[v] - 24;
            do bx += 12; while (bx < 0);
            bx += 12;
            do bx -= 12; while (bx > 0x5F);
            uint16_t u = (uint16_t)ax;
            u = (uint16_t)((u & 0x00FF) | ((((u >> 8) + bx) & 0xFF) << 8));   /* 'add ah, bl' */
            ax = (int16_t)(u + 8);
            ax = (int16_t)(ax >> 4);                            /* 'sar ax, 4' */
            ax = (int16_t)(ax - 0xC0);
            do ax = (int16_t)(ax + 0xC0); while (ax < 0);
            ax = (int16_t)(ax + 0xC0);
            do ax = (int16_t)(ax - 0xC0); while (ax > 0x5FF);
            int di = (uint16_t)ax >> 4;
            int idx = ADL_SEMITONE[di] * 16 + (ax & 0x0F);      /* (semi<<5)+((ax<<1)&1Fh) octets */
            uint16_t fn = ADL_FNUM[idx];
            int8_t blk = (int8_t)(ADL_OCTAVE[di] - 1);
            if ((int16_t)fn < 0) blk++;
            if (blk < 0) { blk++; fn = (uint16_t)((int16_t)fn >> 1); }
            f = (uint16_t)((fn & 0xFF) | ((uint16_t)((((fn >> 8) & 3) | (uint8_t)(blk << 2)) & 0xFF) << 8));
        }
        wr_ch(d, opl, 0xA0, (uint8_t)(f & 0xFF));
        d->v_b0[v] = (uint8_t)((f >> 8) | d->v_keyon[v]);
        wr_ch(d, opl, 0xB0, d->v_b0[v]);
        d->v_dirty[v] &= 0xFE;
    }
}

/* ---- sub_2047 : libere le canal OPL d'une voix (key off) ---- */
static void release_opl(AdlDriver *d, int v)
{
    if (d->v_opl[v] == 0xFF) return;
    d->v_keyon[v] &= 0xDF;
    d->v_dirty[v] |= 1;
    update_voice(d, v);
    d->m_nvoices[d->v_chan[v]]--;
    d->o_owner[d->v_opl[v]] = 0xFF;
    d->v_opl[v] = 0xFF;
    if (d->v_type[v] == 3 || d->v_type[v] == 0) d->v_state[v] = 0;
}

static void assign(AdlDriver *d, int v, int opl)
{
    d->v_opl[v] = (uint8_t)opl;
    d->m_nvoices[d->v_chan[v]]++;
    d->o_owner[opl] = d->v_chan[v];
    d->v_dirty[v] = 0xF9;
}

/* ---- sub_2514 : redistribue les canaux OPL selon la priorite (5 Hz) ---- */
static void reprioritize(AdlDriver *d)
{
    int count = 0;
    for (int v = 0; v < ADL_VOICES; v++) {
        if (!d->v_state[v]) continue;
        count++;
        int c = d->v_chan[v] & 0x0F;
        uint16_t p = (d->m_vprot[c] >= 0x40) ? 0xFFFF : d->p_val[P_PRIO][v];
        d->v_prio_eff[v] = (p < d->m_nvoices[c]) ? 0 : (uint16_t)(p - d->m_nvoices[c]);
    }
    while (count) {
        unsigned best = 0, worst = 0xFFFF;
        int bv = -1, wv = -1;
        for (int v = 0; v < ADL_VOICES; v++) {
            if (!d->v_state[v]) continue;
            unsigned p = d->v_prio_eff[v];
            if (d->v_opl[v] == 0xFF) { if (p >= best) { best = p; bv = v; } }
            else if (p <= worst) { worst = p; wv = v; }
        }
        if (best < worst || best == 0 || bv < 0 || wv < 0) return;
        int opl = d->v_opl[wv];
        release_opl(d, wv);
        assign(d, bv, opl);
        update_voice(d, bv);
        count--;
    }
}

/* ---- sub_501 : donne un canal OPL libre a une voix active qui n'en a pas ---- */
static void assign_free(AdlDriver *d)
{
    for (int v = 0; v < ADL_VOICES; v++) {
        if (!d->v_state[v] || d->v_opl[v] != 0xFF) continue;
        for (int o = 0; o < ADL_OPL; o++) {
            if (d->o_owner[o] != 0xFF) continue;
            assign(d, v, o);
            reprioritize(d);
            return;
        }
        return;
    }
}

/* ---- sub_1FEB : premier canal OPL libre en tourniquet, sinon priorites ---- */
static void alloc_opl(AdlDriver *d, int v)
{
    unsigned b = d->rr_next;
    for (int n = 0; n < ADL_OPL; n++) {
        b = (uint16_t)(b + 1);
        if (b == ADL_OPL) b = 0;
        d->rr_next = (uint16_t)b;
        if (d->o_owner[b] == 0xFF) {
            assign(d, v, (int)b);
            update_voice(d, v);
            return;
        }
    }
    reprioritize(d);
}

/* ---- sub_552 : avance la courbe TVFX du parametre p de la voix v ---- */
static void tvfx_next(AdlDriver *d, int v, int p)
{
    const uint8_t *t = d->v_timbre[v];
    for (int i = 0; i < 10; i++) {
        int c = d->p_cur[p][v];
        uint16_t ax = rw(t, c), dx = rw(t, c + 2);
        if (ax == 0) { d->p_cur[p][v] = (uint16_t)(c + dx); continue; }     /* saut relatif */
        d->p_cur[p][v] = (uint16_t)(c + 4);
        if (ax == 0xFFFF) { d->p_val[p][v] = dx; continue; }               /* valeur absolue */
        if (ax == 0xFFFE) {                                                /* fin : octet d'etat */
            switch (p) {
            case P_MULT0: d->v_avekm0[v] = (uint8_t)dx; break;
            case P_MULT1: d->v_avekm1[v] = (uint8_t)dx; break;
            case P_LVL0:  d->v_ksl0[v]   = (uint8_t)dx; break;
            case P_LVL1:  d->v_ksl1[v]   = (uint8_t)dx; break;
            case P_FREQ:
                d->v_keyon[v] = (uint8_t)(dx >> 8);
                if (d->v_type[v] == 1) d->v_keyon[v] &= 0xE0;
                break;
            case P_FB:    d->v_conn[v]   = (uint8_t)(dx >> 8); break;
            default: break;
            }
            continue;
        }
        d->p_cnt[p][v] = ax;                                               /* segment : duree, pas */
        d->p_inc[p][v] = dx;
        return;
    }
    d->p_inc[p][v] = 0;
    d->p_cnt[p][v] = 0xFFFF;
}

/* ---- sub_89F : (re)demarre un timbre TVFX ; state==2 -> phase de relachement ---- */
static void tvfx_start(AdlDriver *d, int v)
{
    const uint8_t *t = d->v_timbre[v];
    d->v_conn[v] = 0; d->v_ksl0[v] = 0; d->v_ksl1[v] = 0;
    d->v_avekm0[v] = 0x20; d->v_avekm1[v] = 0x20;
    uint8_t cl = 0x20;
    uint8_t type = t[3];
    if (type != 1) cl |= 8;
    d->v_type[v] = type;
    d->v_keyon[v] = cl;
    uint16_t ax = 0xFF0F, dx = 0xFF0F;
    if (rw(t, 8) + 2 != 0x36) {
        ax = rw(t, 0x36); dx = rw(t, 0x38);
        if (d->v_state[v] == 2) { ax = rw(t, 0x3A); dx = rw(t, 0x3C); }
    }
    d->v_ad0[v] = (uint8_t)(dx >> 8); d->v_sr0[v] = (uint8_t)dx;
    d->v_ad1[v] = (uint8_t)(ax >> 8); d->v_sr1[v] = (uint8_t)ax;
    if (d->v_state[v] != 2) {
        d->v_duration[v] = (type == 1) ? 0xFFFF : (uint16_t)(rw(t, 4) + 1);
        static const int init_off[8] = { 0x06, 0x0C, 0x12, 0x18, 0x1E, 0x24, 0x2A, 0x30 };
        for (int p = 0; p < 8; p++) {
            d->p_val[p][v] = rw(t, init_off[p]);
            d->p_cur[p][v] = (uint16_t)(rw(t, init_off[p] + 2) + 2);
        }
    } else {
        static const int rel_off[8] = { 0x0A, 0x10, 0x16, 0x1C, 0x22, 0x28, 0x2E, 0x34 };
        for (int p = 0; p < 8; p++) d->p_cur[p][v] = (uint16_t)(rw(t, rel_off[p]) + 2);
    }
    d->v_dirty[v] = 0xF9;
    for (int p = 0; p < 8; p++) { d->p_cnt[p][v] = 1; d->p_inc[p][v] = 0; }
}

/* ---- sub_2617 : charge un timbre OPL simple (longueur 0x0E) ---- */
static void bnk_start(AdlDriver *d, int v)
{
    const uint8_t *t = d->v_timbre[v];
    d->v_keyon[v] = 0x20;
    d->v_type[v] = 0;
    d->v_duration[v] = 0xFFFF;
    d->p_val[P_PRIO][v] = 0x7FFF;
    d->v_conn[v] = t[8] & 1;
    d->p_val[P_FB][v] = (uint16_t)(t[8] << 12);
    d->v_ksl0[v] = t[4] & 0xC0;
    d->p_val[P_LVL0][v] = (uint16_t)(((~t[4]) & 0x3F) << 10);
    d->v_ksl1[v] = t[0x0A] & 0xC0;
    d->p_val[P_LVL1][v] = (uint16_t)(((~t[0x0A]) & 0x3F) << 10);
    d->v_avekm0[v] = t[3] & 0xF0;
    d->p_val[P_MULT0][v] = (uint16_t)(t[3] << 12);
    d->v_avekm1[v] = t[9] & 0xF0;
    d->p_val[P_MULT1][v] = (uint16_t)(t[9] << 12);
    d->v_ad0[v] = t[5]; d->v_sr0[v] = t[6];
    d->v_ad1[v] = t[0x0B]; d->v_sr1[v] = t[0x0C];
    d->p_val[P_WAVE][v] = (uint16_t)(t[0x0D] | (t[7] << 8));
    d->v_velmask[v] = (uint8_t)(d->v_conn[v] | 2);
    d->v_dirty[v] = 0xF9;
}

/* ---- sub_277B : Note On ---- */
static void note_on(AdlDriver *d, int ch, int key, int vel)
{
    int slot = d->m_slot[ch];
    if (ch == 9) {
        slot = d->rhythm_slot[key];
        if (slot == 0xFF) {
            int s = cache_find(d, 0x7F, key);
            slot = (s < 0) ? 0xFF : s;
            d->rhythm_slot[key] = (uint8_t)slot;
        }
    }
    if (slot == 0xFF) return;
    const uint8_t *t = d->c_data[slot];
    d->c_stamp[slot] = ++d->stamp;
    int v;
    for (v = 0; v < ADL_VOICES; v++) if (!d->v_state[v]) break;
    if (v == ADL_VOICES) return;
    d->v_chan[v] = (uint8_t)ch;
    d->v_key[v] = (uint8_t)key;
    if (ch == 9) { d->v_note[v] = t[2]; d->v_transpose[v] = 0; }
    else         { d->v_note[v] = (uint8_t)key; d->v_transpose[v] = (int8_t)t[2]; }
    d->v_vel[v] = ADL_VELOCITY[(vel >> 3) & 0x0F];
    d->v_timbre[v] = t;
    d->v_state[v] = 1;
    d->v_sustained[v] = 0;
    uint16_t len = rw(t, 0);
    if (len == 0x19) { /* le pilote ne charge rien pour cette longueur */ }
    else if (len == 0x0E) bnk_start(d, v);
    else tvfx_start(d, v);
    d->v_opl[v] = 0xFF;
    alloc_opl(d, v);
}

/* ---- sub_270A : Note Off ---- */
static void note_off(AdlDriver *d, int ch, int key)
{
    for (int v = 0; v < ADL_VOICES; v++) {
        if (d->v_state[v] != 1 || d->v_key[v] != key || d->v_chan[v] != ch) continue;
        if (d->m_sustain[ch] >= 0x40) { d->v_sustained[v] = 1; continue; }
        if (d->v_type[v] == 3 || d->v_type[v] == 0) {
            release_opl(d, v);
            d->v_state[v] = 0;
            assign_free(d);
        } else {
            d->v_duration[v] = 1;
        }
    }
}

/* ---- sub_2883 : relache les notes tenues par la pedale ---- */
static void release_sustained(AdlDriver *d, int ch)
{
    for (int v = 0; v < ADL_VOICES; v++)
        if (d->v_state[v] && d->v_chan[v] == ch && d->v_sustained[v])
            note_off(d, ch, d->v_note[v]);
}

static void apply_dirty(AdlDriver *d, int ch, uint8_t bits)
{
    for (int v = 0; v < ADL_VOICES; v++)
        if (d->v_state[v] && d->v_chan[v] == ch) { d->v_dirty[v] |= bits; update_voice(d, v); }
}

void adl_send(AdlDriver *d, int status, int d1, int d2)
{
    int ch = status & 0x0F, op = status & 0xF0;
    d1 &= 0xFF; d2 &= 0xFF;
    switch (op) {
    case 0x90:
        if (ch < 1 || ch > 9) return;                 /* 'cmp di,1 / jb' ; 'cmp di,9 / ja' */
        if (d2 == 0) { note_off(d, ch, d1); return; }
        note_on(d, ch, d1, d2);
        return;
    case 0x80: note_off(d, ch, d1); return;
    case 0xE0:
        d->m_bend_l[ch] = (uint8_t)d1; d->m_bend_h[ch] = (uint8_t)d2;
        apply_dirty(d, ch, 0x01);
        return;
    case 0xC0: {
        d->m_patch[ch] = (uint8_t)d1;
        int s = cache_find(d, d->m_bank[ch], d1);
        d->m_slot[ch] = (uint8_t)(s < 0 ? 0xFF : s);
        return;
    }
    case 0xB0:
        switch (d1) {
        case 0x72: d->m_bank[ch] = (uint8_t)d2; return;
        case 0x70: d->m_vprot[ch] = (uint8_t)d2; return;
        case 0x71:
            if (d->m_slot[ch] != 0xFF) {
                uint8_t f = d->c_flags[d->m_slot[ch]] & 0xBF;
                if (d2 >= 0x40) f |= 0x40;
                d->c_flags[d->m_slot[ch]] = f;
            }
            return;
        case 0x01: d->m_mod[ch] = (uint8_t)d2;  apply_dirty(d, ch, 0x80); return;
        case 0x07: d->m_vol[ch] = (uint8_t)d2;  apply_dirty(d, ch, 0x40); return;
        case 0x0B: d->m_expr[ch] = (uint8_t)d2; apply_dirty(d, ch, 0x40); return;
        case 0x0A: d->m_pan[ch] = (uint8_t)d2;  apply_dirty(d, ch, 0x40); return;
        case 0x40:
            d->m_sustain[ch] = (uint8_t)d2;
            if (d2 < 0x40) release_sustained(d, ch);
            return;
        case 0x79:
            d->m_sustain[ch] = 0;
            release_sustained(d, ch);
            d->m_mod[ch] = 0; d->m_expr[ch] = 0x7F; d->m_bend_l[ch] = 0; d->m_bend_h[ch] = 0x40;
            apply_dirty(d, ch, 0xC1);
            return;
        case 0x7B:
            for (int v = 0; v < ADL_VOICES; v++)
                if (d->v_state[v] == 1 && d->v_chan[v] == ch) note_off(d, ch, d->v_note[v]);
            return;
        default: return;
        }
    default: return;
    }
}

void adl_serve(AdlDriver *d)
{
    d->tick_tvfx = (uint16_t)(d->tick_tvfx + 60);
    if (d->tick_tvfx >= 120) {
        d->tick_tvfx = (uint16_t)(d->tick_tvfx - 120);
        d->lvl_toggle ^= 0x40;
        for (int v = 0; v < ADL_VOICES; v++) {
            if (!d->v_state[v] || !d->v_type[v]) continue;
            static const struct { int p; uint8_t bit; } order[] = {
                { P_FREQ, 0x01 }, { P_FB, 0x08 }, { P_MULT0, 0x80 }, { P_MULT1, 0x80 } };
            for (int i = 0; i < 4; i++) {
                int p = order[i].p;
                if (d->p_inc[p][v]) { d->p_val[p][v] = (uint16_t)(d->p_val[p][v] + d->p_inc[p][v]); d->v_dirty[v] |= order[i].bit; }
                if (--d->p_cnt[p][v] == 0) { tvfx_next(d, v, p); d->v_dirty[v] |= order[i].bit; }
            }
            for (int p = P_LVL0; p <= P_LVL1; p++) {
                uint16_t inc = d->p_inc[p][v];
                if (inc) {
                    uint16_t old = d->p_val[p][v];
                    uint16_t nw = (uint16_t)(old + inc);
                    d->p_val[p][v] = nw;
                    /* en relachement, un debordement (changement de signe dans le sens du pas) ramene a 0 */
                    if (d->v_state[v] == 2 && s16((uint16_t)(nw ^ old)) < 0 && s16((uint16_t)(nw ^ inc)) >= 0)
                        d->p_val[p][v] = 0;
                    d->v_dirty[v] |= d->lvl_toggle;
                }
                if (--d->p_cnt[p][v] == 0) { tvfx_next(d, v, p); d->v_dirty[v] |= 0x40; }
            }
            if (d->p_inc[P_WAVE][v]) { d->p_val[P_WAVE][v] = (uint16_t)(d->p_val[P_WAVE][v] + d->p_inc[P_WAVE][v]); d->v_dirty[v] |= 0x10; }
            if (--d->p_cnt[P_WAVE][v] == 0) { tvfx_next(d, v, P_WAVE); d->v_dirty[v] |= 0x10; }
            d->p_val[P_PRIO][v] = (uint16_t)(d->p_val[P_PRIO][v] + d->p_inc[P_PRIO][v]);
            if (--d->p_cnt[P_PRIO][v] == 0) tvfx_next(d, v, P_PRIO);

            if (d->v_dirty[v] & 0xF9) update_voice(d, v);
            if (d->v_state[v] != 2) {
                if (--d->v_duration[v] == 0) { d->v_state[v] = 2; tvfx_start(d, v); }
            } else if (d->p_val[P_LVL0][v] < 0x400 && d->p_val[P_LVL1][v] < 0x400) {
                release_opl(d, v);
                d->v_state[v] = 0;
                assign_free(d);
            }
        }
    }
    d->tick_prio = (uint16_t)(d->tick_prio + 5);
    if (d->tick_prio >= 120) { d->tick_prio = (uint16_t)(d->tick_prio - 120); reprioritize(d); }
}

int adl_timbre_status(AdlDriver *d, int bank, int patch) { return cache_find(d, bank, patch) >= 0; }

/* fn 0x9C install_timbre + sub_1D21 (eviction de l'entree la plus ancienne non protegee) */
void adl_install_timbre(AdlDriver *d, int bank, int patch, const uint8_t *data)
{
    int slot = cache_find(d, bank, patch);
    if (slot < 0) {
        if (!data) return;
        for (slot = 0; slot < ADL_CACHE; slot++) if (!(d->c_flags[slot] & 0x80)) break;
        if (slot == ADL_CACHE) {
            int old = -1;
            for (int i = 0; i < ADL_CACHE; i++)
                if ((d->c_flags[i] & 0x80) && !(d->c_flags[i] & 0x40) && (old < 0 || d->c_stamp[i] < d->c_stamp[old])) old = i;
            if (old < 0) return;
            for (int v = 0; v < ADL_VOICES; v++)
                if (d->v_state[v] && d->v_timbre[v] == d->c_data[old]) { release_opl(d, v); d->v_state[v] = 0; }
            for (int c = 0; c < 16; c++) if (d->m_slot[c] == old) d->m_slot[c] = 0xFF;
            for (int k = 0; k < 128; k++) if (d->rhythm_slot[k] == old) d->rhythm_slot[k] = 0xFF;
            free(d->c_data[old]); d->c_data[old] = NULL; d->c_flags[old] = 0;
            slot = old;
        }
        uint16_t len = rw(data, 0);
        d->c_data[slot] = (uint8_t *)malloc(len < 0x40 ? 0x40 : len);
        memset(d->c_data[slot], 0, len < 0x40 ? 0x40 : len);
        memcpy(d->c_data[slot], data, len);
        d->c_bank[slot] = (uint8_t)bank; d->c_patch[slot] = (uint8_t)patch;
        d->c_flags[slot] = 0x80;
        d->c_stamp[slot] = ++d->stamp;
    }
    for (int c = 0; c < 16; c++)                        /* loc_1F1C */
        if (d->m_patch[c] == patch && d->m_bank[c] == bank) d->m_slot[c] = (uint8_t)slot;
}

void adl_init(AdlDriver *d, AdlWriteFn write, void *user)
{
    memset(d, 0, sizeof(*d));
    d->write = write; d->user = user;
    for (int r = 1; r <= 0xF5; r++) write(user, (uint16_t)r, ADL_INIT_REGS[r]);   /* sub_1B47 */
    for (int c = 0; c < 16; c++) { d->m_slot[c] = 0xFF; d->m_nvoices[c] = 0; d->m_patch[c] = 0xFF; d->m_bank[c] = 0; }
    for (int o = 0; o < ADL_OPL; o++) d->o_owner[o] = 0xFF;
    for (int v = 0; v < ADL_VOICES; v++) d->v_opl[v] = 0xFF;
    memset(d->rhythm_slot, 0xFF, sizeof(d->rhythm_slot));
    d->rr_next = 0xFFFF;
}

void adl_shutdown(AdlDriver *d)
{
    for (int i = 0; i < ADL_CACHE; i++) free(d->c_data[i]);
    memset(d->c_data, 0, sizeof(d->c_data));
}

void adl_kill_all(AdlDriver *d)
{
    for (int v = 0; v < ADL_VOICES; v++) {
        if (!d->v_state[v]) continue;
        release_opl(d, v);
        d->v_state[v] = 0;
    }
}

int adl_active_voices(const AdlDriver *d)
{
    int n = 0;
    for (int v = 0; v < ADL_VOICES; v++) if (d->v_state[v]) n++;
    return n;
}
