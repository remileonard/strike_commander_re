/*
 * ail_adlib.h - Portage de la partie "voix OPL" du pilote AdLib d'AIL 2.0 (ADLIB.ADV),
 * c'est-a-dire l'equivalent de YAMAHA.INC (absent des sources publiques), lu dans
 * analysis/adlib_driver_source/adlib.asm. Les noms entre parentheses sont les routines
 * du pilote (sub_XXXX = offset dans ADLIB.ADV).
 *
 * 16 voix logiques -> 9 canaux OPL2, allocation par priorite (sub_2514).
 * Deux sortes de timbres :
 *   - timbre OPL simple, longueur 0x0E (sub_2617) ;
 *   - timbre TVFX a courbes (8 parametres : frequence, niveau mod/porteur, priorite,
 *     feedback, multiplicateur mod/porteur, forme d'onde), service a 60 Hz (sub_618/sub_552/sub_89F).
 */
#ifndef AIL_ADLIB_H
#define AIL_ADLIB_H
#include <stdint.h>

typedef void (*AdlWriteFn)(void *user, uint16_t reg, uint8_t val);

#define ADL_VOICES 16
#define ADL_OPL    9
#define ADL_CACHE  192

typedef struct {
    AdlWriteFn write; void *user;

    /* cache de timbres (0x1422 banque, 0x14E2 patch, 0x15A2 drapeaux, 0xFA2 horodatage) */
    uint8_t  c_bank[ADL_CACHE], c_patch[ADL_CACHE], c_flags[ADL_CACHE];
    uint32_t c_stamp[ADL_CACHE];
    uint8_t *c_data[ADL_CACHE];
    uint32_t stamp;

    /* par voix logique */
    uint8_t  v_state[ADL_VOICES];     /* 0x16D4 : 0 libre, 1 jouee, 2 relachement TVFX */
    uint8_t  v_type[ADL_VOICES];      /* 0x16E4 : 0 OPL simple, 1/2 TVFX */
    uint8_t  v_opl[ADL_VOICES];       /* 0x16F4 : canal OPL, 0xFF = aucun */
    uint8_t  v_chan[ADL_VOICES];      /* 0x1704 : canal MIDI */
    uint8_t  v_note[ADL_VOICES];      /* 0x1714 : note jouee */
    uint8_t  v_key[ADL_VOICES];       /* 0x1724 : note MIDI recue (pour le Note Off) */
    int8_t   v_transpose[ADL_VOICES]; /* 0x1734 */
    uint8_t  v_vel[ADL_VOICES];       /* 0x1744 */
    uint8_t  v_sustained[ADL_VOICES]; /* 0x1754 */
    uint8_t  v_dirty[ADL_VOICES];     /* 0x1764 */
    uint8_t  v_b0[ADL_VOICES];        /* 0x1774 : dernier B0 ecrit */
    uint8_t  v_keyon[ADL_VOICES];     /* 0x1784 : bits ajoutes a B0 (0x20 = key on) */
    uint8_t  v_conn[ADL_VOICES];      /* 0x1794 */
    uint8_t  v_ksl0[ADL_VOICES], v_ksl1[ADL_VOICES];       /* 0x17A4 / 0x17B4 */
    uint8_t  v_avekm0[ADL_VOICES], v_avekm1[ADL_VOICES];   /* 0x17C4 / 0x17D4 */
    uint8_t  v_ad0[ADL_VOICES], v_ad1[ADL_VOICES];         /* 0x17E4 / 0x17F4 */
    uint8_t  v_sr0[ADL_VOICES], v_sr1[ADL_VOICES];         /* 0x1804 / 0x1814 */
    uint8_t  v_velmask[ADL_VOICES];   /* 0x1824 : bit0 = mod, bit1 = porteur mis a l'echelle */
    const uint8_t *v_timbre[ADL_VOICES]; /* 0x1674 */
    uint16_t v_duration[ADL_VOICES];  /* 0x16B4 */
    uint16_t v_prio_eff[ADL_VOICES];  /* 0x197D */
    /* 8 parametres TVFX : curseur (+0), compteur (+0x20), valeur (+0x40), increment (+0x60) */
    uint16_t p_cur[8][ADL_VOICES], p_cnt[8][ADL_VOICES], p_val[8][ADL_VOICES], p_inc[8][ADL_VOICES];

    /* par canal MIDI */
    uint8_t  m_vol[16], m_pan[16], m_bend_l[16], m_bend_h[16], m_expr[16], m_mod[16];
    uint8_t  m_sustain[16], m_vprot[16], m_slot[16], m_bank[16], m_patch[16], m_nvoices[16];
    uint8_t  rhythm_slot[128];        /* 0x18E4 */
    /* par canal OPL */
    uint8_t  o_owner[ADL_OPL];        /* 0x1974 : canal MIDI proprietaire, 0xFF libre */
    uint16_t rr_next;                 /* 0x166F */

    uint16_t tick_tvfx, tick_prio;    /* 0x166A / 0x166C */
    uint8_t  lvl_toggle;              /* 0x166E */
} AdlDriver;

void adl_init(AdlDriver *d, AdlWriteFn write, void *user);   /* sub_1B47 + sub_1F4F */
void adl_shutdown(AdlDriver *d);
void adl_send(AdlDriver *d, int status, int d1, int d2);       /* send_MIDI_message, sub_28BE */
void adl_serve(AdlDriver *d);                                    /* serve_synth, sub_618 (120 Hz) */
int  adl_timbre_status(AdlDriver *d, int bank, int patch);       /* 0 si absent */
void adl_install_timbre(AdlDriver *d, int bank, int patch, const uint8_t *data); /* fn 0x9C */
int  adl_active_voices(const AdlDriver *d);
/* OUTIL DE TEST, absent du pilote : coupe toutes les voix (key off) et les libere.
 * Necessaire pour les TVFX dont la courbe de relachement tient le niveau : le pilote
 * ne libere une voix TVFX que lorsque ses deux niveaux passent sous 0x400. */
void adl_kill_all(AdlDriver *d);

#endif
