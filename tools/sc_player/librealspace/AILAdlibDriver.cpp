//
//  AILAdlibDriver.cpp
//  libRealSpace
//
//  Portage ligne a ligne de la partie voix du pilote ADLIB.ADV (voir AILAdlibDriver.h).
//
#include "AILAdlibDriver.h"
#include "AILAdlibTables.h"
#include <cstring>

namespace {
enum { P_FREQ, P_LVL0, P_LVL1, P_PRIO, P_FB, P_MULT0, P_MULT1, P_WAVE };
const int ADL_VOICES = AILAdlibDriver::VOICES, ADL_OPL = AILAdlibDriver::OPL_CHANNELS, ADL_CACHE = AILAdlibDriver::CACHE;

uint16_t rw(const uint8_t *t, int off) { return (uint16_t)(t[off] | (t[off + 1] << 8)); }
int16_t  s16(uint16_t v) { return (int16_t)v; }

// 'mul / shl ax,1 / mov al,ah / cmp al,1 / sbb al,0FFh' : (a*b)/128, +1 si non nul
uint8_t scale127(uint8_t a, uint8_t b)
{
    uint8_t r = (uint8_t)(((unsigned)a * b * 2u) >> 8);
    return r ? (uint8_t)(r + 1) : 0;
}
}

void AILAdlibDriver::wrOp(int op, int reg, uint8_t val)   // sub_19B4 -> sub_19EB
{
    writeFn((uint16_t)(reg + ADL_OP_OFFSET[op]), val);
}
void AILAdlibDriver::wrCh(int ch, int reg, uint8_t val)   // sub_19D0 -> sub_19EB
{
    writeFn((uint16_t)(reg + ADL_CH_OFFSET[ch]), val);
}

/* ---- sub_1B7A : recherche (banque, patch) dans le cache ---- */
int AILAdlibDriver::cacheFind(int bank, int patch)
{
    for (int i = 0; i < ADL_CACHE; i++)
        if ((c_flags[i] & 0x80) && c_bank[i] == bank && c_patch[i] == patch) return i;
    return -1;
}

/* ---- sub_20B2 : ecrit les registres OPL marques "sales" pour la voix v ---- */
void AILAdlibDriver::updateVoice(int v)
{
    int opl = v_opl[v];
    if (opl == 0xFF) return;
    uint8_t vol = 0;
    if (v_dirty[v] & 0x40) {
        int c = v_chan[v] & 0x0F;
        vol = scale127(m_vol[c], m_expr[c]);
        vol = scale127(vol, v_vel[v]);
    }
    int opm = ADL_OP_MOD[opl], opc = ADL_OP_CAR[opl];

    if (v_dirty[v] & 0x80) {          /* registre 0x20 */
        int vib = (m_mod[v_chan[v] & 0x0F] >= 0x40) ? 0x40 : 0;
        wrOp(opm, 0x20, (uint8_t)(((p_val[P_MULT0][v] >> 12) & 0x0F) | vib | v_avekm0[v]));
        wrOp(opc, 0x20, (uint8_t)(((p_val[P_MULT1][v] >> 12) & 0x0F) | vib | v_avekm1[v]));
        v_dirty[v] &= 0x7F;
    }
    if (v_dirty[v] & 0x40) {          /* registre 0x40 */
        uint8_t l = (uint8_t)(p_val[P_LVL0][v] >> 10);
        if (v_velmask[v] & 1) l = (uint8_t)((unsigned)l * vol / 127u);
        wrOp(opm, 0x40, (uint8_t)((~l & 0x3F) | v_ksl0[v]));
        l = (uint8_t)(p_val[P_LVL1][v] >> 10);
        if (v_velmask[v] & 2) l = (uint8_t)((unsigned)l * vol / 127u);
        wrOp(opc, 0x40, (uint8_t)((~l & 0x3F) | v_ksl1[v]));
        v_dirty[v] &= 0xBF;
    }
    if (v_dirty[v] & 0x20) {          /* registres 0x60 / 0x80 */
        wrOp(opm, 0x60, v_ad0[v]);
        wrOp(opc, 0x60, v_ad1[v]);
        wrOp(opm, 0x80, v_sr0[v]);
        wrOp(opc, 0x80, v_sr1[v]);
        v_dirty[v] &= 0xDF;
    }
    if (v_dirty[v] & 0x10) {          /* registre 0xE0 : octet bas -> porteur, haut -> mod */
        wrOp(opc, 0xE0, (uint8_t)(p_val[P_WAVE][v] & 0xFF));
        wrOp(opm, 0xE0, (uint8_t)(p_val[P_WAVE][v] >> 8));
        v_dirty[v] &= 0xEF;
    }
    if (v_dirty[v] & 0x08) {          /* registre 0xC0 */
        uint8_t ah = (uint8_t)((p_val[P_FB][v] >> 4) >> 8) & 0x0E;
        wrCh(opl, 0xC0, (uint8_t)(ah | (v_conn[v] & 1)));
        v_dirty[v] &= 0xF7;
    }
    if (v_dirty[v] & 0x01) {          /* registres 0xA0 / 0xB0 */
        uint16_t f;
        if (v_type[v] == 2) {
            f = (uint16_t)(p_val[P_FREQ][v] >> 6);
        } else if (!(v_keyon[v] & 0x20)) {
            wrCh(opl, 0xB0, (uint8_t)(v_b0[v] & 0xDF));
            v_dirty[v] &= 0xFE;
            return;
        } else {
            int c = v_chan[v];
            int16_t bend = (int16_t)((((int)m_bend_h[c] << 7) | m_bend_l[c]) - 0x2000);
            bend = (int16_t)(bend >> 5);
            int16_t ax = (int16_t)(bend * 12);                 /* 'mov cl,0Ch / imul cx' */
            int bx = v_note[v] + v_transpose[v] - 24;
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
        wrCh(opl, 0xA0, (uint8_t)(f & 0xFF));
        v_b0[v] = (uint8_t)((f >> 8) | v_keyon[v]);
        wrCh(opl, 0xB0, v_b0[v]);
        v_dirty[v] &= 0xFE;
    }
}

/* ---- sub_2047 : libere le canal OPL d'une voix (key off) ---- */
void AILAdlibDriver::releaseOpl(int v)
{
    if (v_opl[v] == 0xFF) return;
    v_keyon[v] &= 0xDF;
    v_dirty[v] |= 1;
    updateVoice(v);
    m_nvoices[v_chan[v]]--;
    o_owner[v_opl[v]] = 0xFF;
    v_opl[v] = 0xFF;
    if (v_type[v] == 3 || v_type[v] == 0) v_state[v] = 0;
}

void AILAdlibDriver::assign(int v, int opl)
{
    v_opl[v] = (uint8_t)opl;
    m_nvoices[v_chan[v]]++;
    o_owner[opl] = v_chan[v];
    v_dirty[v] = 0xF9;
}

/* ---- sub_2514 : redistribue les canaux OPL selon la priorite (5 Hz) ---- */
void AILAdlibDriver::reprioritize()
{
    int count = 0;
    for (int v = 0; v < ADL_VOICES; v++) {
        if (!v_state[v]) continue;
        count++;
        int c = v_chan[v] & 0x0F;
        uint16_t p = (m_vprot[c] >= 0x40) ? 0xFFFF : p_val[P_PRIO][v];
        v_prio_eff[v] = (p < m_nvoices[c]) ? 0 : (uint16_t)(p - m_nvoices[c]);
    }
    while (count) {
        unsigned best = 0, worst = 0xFFFF;
        int bv = -1, wv = -1;
        for (int v = 0; v < ADL_VOICES; v++) {
            if (!v_state[v]) continue;
            unsigned p = v_prio_eff[v];
            if (v_opl[v] == 0xFF) { if (p >= best) { best = p; bv = v; } }
            else if (p <= worst) { worst = p; wv = v; }
        }
        if (best < worst || best == 0 || bv < 0 || wv < 0) return;
        int opl = v_opl[wv];
        releaseOpl(wv);
        assign(bv, opl);
        updateVoice(bv);
        count--;
    }
}

/* ---- sub_501 : donne un canal OPL libre a une voix active qui n'en a pas ---- */
void AILAdlibDriver::assignFree()
{
    for (int v = 0; v < ADL_VOICES; v++) {
        if (!v_state[v] || v_opl[v] != 0xFF) continue;
        for (int o = 0; o < ADL_OPL; o++) {
            if (o_owner[o] != 0xFF) continue;
            assign(v, o);
            reprioritize();
            return;
        }
        return;
    }
}

/* ---- sub_1FEB : premier canal OPL libre en tourniquet, sinon priorites ---- */
void AILAdlibDriver::allocOpl(int v)
{
    unsigned b = rr_next;
    for (int n = 0; n < ADL_OPL; n++) {
        b = (uint16_t)(b + 1);
        if (b == ADL_OPL) b = 0;
        rr_next = (uint16_t)b;
        if (o_owner[b] == 0xFF) {
            assign(v, (int)b);
            updateVoice(v);
            return;
        }
    }
    reprioritize();
}

/* ---- sub_552 : avance la courbe TVFX du parametre p de la voix v ---- */
void AILAdlibDriver::tvfxNext(int v, int p)
{
    const uint8_t *t = v_timbre[v];
    for (int i = 0; i < 10; i++) {
        int c = p_cur[p][v];
        uint16_t ax = rw(t, c), dx = rw(t, c + 2);
        if (ax == 0) { p_cur[p][v] = (uint16_t)(c + dx); continue; }     /* saut relatif */
        p_cur[p][v] = (uint16_t)(c + 4);
        if (ax == 0xFFFF) { p_val[p][v] = dx; continue; }               /* valeur absolue */
        if (ax == 0xFFFE) {                                                /* fin : octet d'etat */
            switch (p) {
            case P_MULT0: v_avekm0[v] = (uint8_t)dx; break;
            case P_MULT1: v_avekm1[v] = (uint8_t)dx; break;
            case P_LVL0:  v_ksl0[v]   = (uint8_t)dx; break;
            case P_LVL1:  v_ksl1[v]   = (uint8_t)dx; break;
            case P_FREQ:
                v_keyon[v] = (uint8_t)(dx >> 8);
                if (v_type[v] == 1) v_keyon[v] &= 0xE0;
                break;
            case P_FB:    v_conn[v]   = (uint8_t)(dx >> 8); break;
            default: break;
            }
            continue;
        }
        p_cnt[p][v] = ax;                                               /* segment : duree, pas */
        p_inc[p][v] = dx;
        return;
    }
    p_inc[p][v] = 0;
    p_cnt[p][v] = 0xFFFF;
}

/* ---- sub_89F : (re)demarre un timbre TVFX ; state==2 -> phase de relachement ---- */
void AILAdlibDriver::tvfxStart(int v)
{
    const uint8_t *t = v_timbre[v];
    v_conn[v] = 0; v_ksl0[v] = 0; v_ksl1[v] = 0;
    v_avekm0[v] = 0x20; v_avekm1[v] = 0x20;
    uint8_t cl = 0x20;
    uint8_t type = t[3];
    if (type != 1) cl |= 8;
    v_type[v] = type;
    v_keyon[v] = cl;
    uint16_t ax = 0xFF0F, dx = 0xFF0F;
    if (rw(t, 8) + 2 != 0x36) {
        ax = rw(t, 0x36); dx = rw(t, 0x38);
        if (v_state[v] == 2) { ax = rw(t, 0x3A); dx = rw(t, 0x3C); }
    }
    v_ad0[v] = (uint8_t)(dx >> 8); v_sr0[v] = (uint8_t)dx;
    v_ad1[v] = (uint8_t)(ax >> 8); v_sr1[v] = (uint8_t)ax;
    if (v_state[v] != 2) {
        v_duration[v] = (type == 1) ? 0xFFFF : (uint16_t)(rw(t, 4) + 1);
        static const int init_off[8] = { 0x06, 0x0C, 0x12, 0x18, 0x1E, 0x24, 0x2A, 0x30 };
        for (int p = 0; p < 8; p++) {
            p_val[p][v] = rw(t, init_off[p]);
            p_cur[p][v] = (uint16_t)(rw(t, init_off[p] + 2) + 2);
        }
    } else {
        static const int rel_off[8] = { 0x0A, 0x10, 0x16, 0x1C, 0x22, 0x28, 0x2E, 0x34 };
        for (int p = 0; p < 8; p++) p_cur[p][v] = (uint16_t)(rw(t, rel_off[p]) + 2);
    }
    v_dirty[v] = 0xF9;
    for (int p = 0; p < 8; p++) { p_cnt[p][v] = 1; p_inc[p][v] = 0; }
}

/* ---- sub_2617 : charge un timbre OPL simple (longueur 0x0E) ---- */
void AILAdlibDriver::bnkStart(int v)
{
    const uint8_t *t = v_timbre[v];
    v_keyon[v] = 0x20;
    v_type[v] = 0;
    v_duration[v] = 0xFFFF;
    p_val[P_PRIO][v] = 0x7FFF;
    v_conn[v] = t[8] & 1;
    p_val[P_FB][v] = (uint16_t)(t[8] << 12);
    v_ksl0[v] = t[4] & 0xC0;
    p_val[P_LVL0][v] = (uint16_t)(((~t[4]) & 0x3F) << 10);
    v_ksl1[v] = t[0x0A] & 0xC0;
    p_val[P_LVL1][v] = (uint16_t)(((~t[0x0A]) & 0x3F) << 10);
    v_avekm0[v] = t[3] & 0xF0;
    p_val[P_MULT0][v] = (uint16_t)(t[3] << 12);
    v_avekm1[v] = t[9] & 0xF0;
    p_val[P_MULT1][v] = (uint16_t)(t[9] << 12);
    v_ad0[v] = t[5]; v_sr0[v] = t[6];
    v_ad1[v] = t[0x0B]; v_sr1[v] = t[0x0C];
    p_val[P_WAVE][v] = (uint16_t)(t[0x0D] | (t[7] << 8));
    v_velmask[v] = (uint8_t)(v_conn[v] | 2);
    v_dirty[v] = 0xF9;
}

/* ---- sub_277B : Note On ---- */
void AILAdlibDriver::noteOn(int ch, int key, int vel)
{
    int slot = m_slot[ch];
    if (ch == 9) {
        slot = rhythm_slot[key];
        if (slot == 0xFF) {
            int s = cacheFind(0x7F, key);
            slot = (s < 0) ? 0xFF : s;
            rhythm_slot[key] = (uint8_t)slot;
        }
    }
    if (slot == 0xFF) return;
    const uint8_t *t = c_data[slot].data();
    c_stamp[slot] = ++stamp;
    int v;
    for (v = 0; v < ADL_VOICES; v++) if (!v_state[v]) break;
    if (v == ADL_VOICES) return;
    v_chan[v] = (uint8_t)ch;
    v_key[v] = (uint8_t)key;
    if (ch == 9) { v_note[v] = t[2]; v_transpose[v] = 0; }
    else         { v_note[v] = (uint8_t)key; v_transpose[v] = (int8_t)t[2]; }
    v_vel[v] = ADL_VELOCITY[(vel >> 3) & 0x0F];
    v_timbre[v] = t;
    v_state[v] = 1;
    v_sustained[v] = 0;
    uint16_t len = rw(t, 0);
    if (len == 0x19) { /* le pilote ne charge rien pour cette longueur */ }
    else if (len == 0x0E) bnkStart(v);
    else tvfxStart(v);
    v_opl[v] = 0xFF;
    allocOpl(v);
}

/* ---- sub_270A : Note Off ---- */
void AILAdlibDriver::noteOff(int ch, int key)
{
    for (int v = 0; v < ADL_VOICES; v++) {
        if (v_state[v] != 1 || v_key[v] != key || v_chan[v] != ch) continue;
        if (m_sustain[ch] >= 0x40) { v_sustained[v] = 1; continue; }
        if (v_type[v] == 3 || v_type[v] == 0) {
            releaseOpl(v);
            v_state[v] = 0;
            assignFree();
        } else {
            v_duration[v] = 1;
        }
    }
}

/* ---- sub_2883 : relache les notes tenues par la pedale ---- */
void AILAdlibDriver::releaseSustained(int ch)
{
    for (int v = 0; v < ADL_VOICES; v++)
        if (v_state[v] && v_chan[v] == ch && v_sustained[v])
            noteOff(ch, v_note[v]);
}

void AILAdlibDriver::applyDirty(int ch, uint8_t bits)
{
    for (int v = 0; v < ADL_VOICES; v++)
        if (v_state[v] && v_chan[v] == ch) { v_dirty[v] |= bits; updateVoice(v); }
}

void AILAdlibDriver::send(int status, int d1, int d2)
{
    int ch = status & 0x0F, op = status & 0xF0;
    d1 &= 0xFF; d2 &= 0xFF;
    switch (op) {
    case 0x90:
        if (ch < 1 || ch > 9) return;                 /* 'cmp di,1 / jb' ; 'cmp di,9 / ja' */
        if (d2 == 0) { noteOff(ch, d1); return; }
        noteOn(ch, d1, d2);
        return;
    case 0x80: noteOff(ch, d1); return;
    case 0xE0:
        m_bend_l[ch] = (uint8_t)d1; m_bend_h[ch] = (uint8_t)d2;
        applyDirty(ch, 0x01);
        return;
    case 0xC0: {
        m_patch[ch] = (uint8_t)d1;
        int s = cacheFind(m_bank[ch], d1);
        m_slot[ch] = (uint8_t)(s < 0 ? 0xFF : s);
        return;
    }
    case 0xB0:
        switch (d1) {
        case 0x72: m_bank[ch] = (uint8_t)d2; return;
        case 0x70: m_vprot[ch] = (uint8_t)d2; return;
        case 0x71:
            if (m_slot[ch] != 0xFF) {
                uint8_t f = c_flags[m_slot[ch]] & 0xBF;
                if (d2 >= 0x40) f |= 0x40;
                c_flags[m_slot[ch]] = f;
            }
            return;
        case 0x01: m_mod[ch] = (uint8_t)d2;  applyDirty(ch, 0x80); return;
        case 0x07: m_vol[ch] = (uint8_t)d2;  applyDirty(ch, 0x40); return;
        case 0x0B: m_expr[ch] = (uint8_t)d2; applyDirty(ch, 0x40); return;
        case 0x0A: m_pan[ch] = (uint8_t)d2;  applyDirty(ch, 0x40); return;
        case 0x40:
            m_sustain[ch] = (uint8_t)d2;
            if (d2 < 0x40) releaseSustained(ch);
            return;
        case 0x79:
            m_sustain[ch] = 0;
            releaseSustained(ch);
            m_mod[ch] = 0; m_expr[ch] = 0x7F; m_bend_l[ch] = 0; m_bend_h[ch] = 0x40;
            applyDirty(ch, 0xC1);
            return;
        case 0x7B:
            for (int v = 0; v < ADL_VOICES; v++)
                if (v_state[v] == 1 && v_chan[v] == ch) noteOff(ch, v_note[v]);
            return;
        default: return;
        }
    default: return;
    }
}

void AILAdlibDriver::serve()
{
    tick_tvfx = (uint16_t)(tick_tvfx + 60);
    if (tick_tvfx >= 120) {
        tick_tvfx = (uint16_t)(tick_tvfx - 120);
        lvl_toggle ^= 0x40;
        for (int v = 0; v < ADL_VOICES; v++) {
            if (!v_state[v] || !v_type[v]) continue;
            const struct { int p; uint8_t bit; } order[] = {
                { P_FREQ, 0x01 }, { P_FB, 0x08 }, { P_MULT0, 0x80 }, { P_MULT1, 0x80 } };
            for (int i = 0; i < 4; i++) {
                int p = order[i].p;
                if (p_inc[p][v]) { p_val[p][v] = (uint16_t)(p_val[p][v] + p_inc[p][v]); v_dirty[v] |= order[i].bit; }
                if (--p_cnt[p][v] == 0) { tvfxNext(v, p); v_dirty[v] |= order[i].bit; }
            }
            for (int p = P_LVL0; p <= P_LVL1; p++) {
                uint16_t inc = p_inc[p][v];
                if (inc) {
                    uint16_t old = p_val[p][v];
                    uint16_t nw = (uint16_t)(old + inc);
                    p_val[p][v] = nw;
                    /* en relachement, un debordement (changement de signe dans le sens du pas) ramene a 0 */
                    if (v_state[v] == 2 && s16((uint16_t)(nw ^ old)) < 0 && s16((uint16_t)(nw ^ inc)) >= 0)
                        p_val[p][v] = 0;
                    v_dirty[v] |= lvl_toggle;
                }
                if (--p_cnt[p][v] == 0) { tvfxNext(v, p); v_dirty[v] |= 0x40; }
            }
            if (p_inc[P_WAVE][v]) { p_val[P_WAVE][v] = (uint16_t)(p_val[P_WAVE][v] + p_inc[P_WAVE][v]); v_dirty[v] |= 0x10; }
            if (--p_cnt[P_WAVE][v] == 0) { tvfxNext(v, P_WAVE); v_dirty[v] |= 0x10; }
            p_val[P_PRIO][v] = (uint16_t)(p_val[P_PRIO][v] + p_inc[P_PRIO][v]);
            if (--p_cnt[P_PRIO][v] == 0) tvfxNext(v, P_PRIO);

            if (v_dirty[v] & 0xF9) updateVoice(v);
            if (v_state[v] != 2) {
                if (--v_duration[v] == 0) { v_state[v] = 2; tvfxStart(v); }
            } else if (p_val[P_LVL0][v] < 0x400 && p_val[P_LVL1][v] < 0x400) {
                releaseOpl(v);
                v_state[v] = 0;
                assignFree();
            }
        }
    }
    tick_prio = (uint16_t)(tick_prio + 5);
    if (tick_prio >= 120) { tick_prio = (uint16_t)(tick_prio - 120); reprioritize(); }
}


bool AILAdlibDriver::timbreStatus(int bank, int patch) { return cacheFind(bank, patch) >= 0; }

// fonction AIL 0x9C install_timbre + sub_1D21 (eviction de l'entree la plus ancienne non protegee)
void AILAdlibDriver::installTimbre(int bank, int patch, const uint8_t *data)
{
    int slot = cacheFind(bank, patch);
    if (slot < 0) {
        if (!data) return;
        for (slot = 0; slot < ADL_CACHE; slot++) if (!(c_flags[slot] & 0x80)) break;
        if (slot == ADL_CACHE) {
            int old = -1;
            for (int i = 0; i < ADL_CACHE; i++)
                if ((c_flags[i] & 0x80) && !(c_flags[i] & 0x40) && (old < 0 || c_stamp[i] < c_stamp[old])) old = i;
            if (old < 0) return;
            for (int v = 0; v < ADL_VOICES; v++)
                if (v_state[v] && v_timbre[v] == c_data[old].data()) { releaseOpl(v); v_state[v] = 0; }
            for (int c = 0; c < 16; c++) if (m_slot[c] == old) m_slot[c] = 0xFF;
            for (int k = 0; k < 128; k++) if (rhythm_slot[k] == old) rhythm_slot[k] = 0xFF;
            c_data[old].clear(); c_flags[old] = 0;
            slot = old;
        }
        uint16_t len = rw(data, 0);
        c_data[slot].assign(len < 0x40 ? 0x40 : len, 0);   // marge : les courbes lisent par mots
        std::memcpy(c_data[slot].data(), data, len);
        c_bank[slot] = (uint8_t)bank; c_patch[slot] = (uint8_t)patch;
        c_flags[slot] = 0x80;
        c_stamp[slot] = ++stamp;
    }
    for (int c = 0; c < 16; c++)                        // loc_1F1C
        if (m_patch[c] == patch && m_bank[c] == bank) m_slot[c] = (uint8_t)slot;
}

void AILAdlibDriver::init(WriteFn write)
{
    writeFn = write;
    std::memset(c_bank, 0, sizeof c_bank); std::memset(c_patch, 0, sizeof c_patch);
    std::memset(c_flags, 0, sizeof c_flags); std::memset(c_stamp, 0, sizeof c_stamp);
    for (auto &d : c_data) d.clear();
    stamp = 0;
    std::memset(v_state, 0, sizeof v_state); std::memset(v_type, 0, sizeof v_type);
    std::memset(v_chan, 0, sizeof v_chan); std::memset(v_note, 0, sizeof v_note);
    std::memset(v_key, 0, sizeof v_key); std::memset(v_transpose, 0, sizeof v_transpose);
    std::memset(v_vel, 0, sizeof v_vel); std::memset(v_sustained, 0, sizeof v_sustained);
    std::memset(v_dirty, 0, sizeof v_dirty); std::memset(v_b0, 0, sizeof v_b0);
    std::memset(v_keyon, 0, sizeof v_keyon); std::memset(v_conn, 0, sizeof v_conn);
    std::memset(v_ksl0, 0, sizeof v_ksl0); std::memset(v_ksl1, 0, sizeof v_ksl1);
    std::memset(v_avekm0, 0, sizeof v_avekm0); std::memset(v_avekm1, 0, sizeof v_avekm1);
    std::memset(v_ad0, 0, sizeof v_ad0); std::memset(v_ad1, 0, sizeof v_ad1);
    std::memset(v_sr0, 0, sizeof v_sr0); std::memset(v_sr1, 0, sizeof v_sr1);
    std::memset(v_velmask, 0, sizeof v_velmask);
    for (auto &t : v_timbre) t = nullptr;
    std::memset(v_duration, 0, sizeof v_duration); std::memset(v_prio_eff, 0, sizeof v_prio_eff);
    std::memset(p_cur, 0, sizeof p_cur); std::memset(p_cnt, 0, sizeof p_cnt);
    std::memset(p_val, 0, sizeof p_val); std::memset(p_inc, 0, sizeof p_inc);
    std::memset(m_vol, 0, sizeof m_vol); std::memset(m_pan, 0, sizeof m_pan);
    std::memset(m_bend_l, 0, sizeof m_bend_l); std::memset(m_bend_h, 0, sizeof m_bend_h);
    std::memset(m_expr, 0, sizeof m_expr); std::memset(m_mod, 0, sizeof m_mod);
    std::memset(m_sustain, 0, sizeof m_sustain); std::memset(m_vprot, 0, sizeof m_vprot);
    tick_tvfx = tick_prio = 0; lvl_toggle = 0;
    for (int r = 1; r <= 0xF5; r++) writeFn((uint16_t)r, ADL_INIT_REGS[r]);   // sub_1B47
    for (int c = 0; c < 16; c++) { m_slot[c] = 0xFF; m_nvoices[c] = 0; m_patch[c] = 0xFF; m_bank[c] = 0; }
    for (int o = 0; o < ADL_OPL; o++) o_owner[o] = 0xFF;
    for (int v = 0; v < ADL_VOICES; v++) v_opl[v] = 0xFF;
    std::memset(rhythm_slot, 0xFF, sizeof rhythm_slot);
    rr_next = 0xFFFF;
}

void AILAdlibDriver::killAll()
{
    for (int v = 0; v < ADL_VOICES; v++) {
        if (!v_state[v]) continue;
        releaseOpl(v);
        v_state[v] = 0;
    }
}

int AILAdlibDriver::activeVoices() const
{
    int n = 0;
    for (int v = 0; v < ADL_VOICES; v++) if (v_state[v]) n++;
    return n;
}
