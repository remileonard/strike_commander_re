/*
 * sc_data.h - Donnees musicales du jeu : combat.dat, combat.adl, bibliotheque de timbres.
 *
 * combat.dat (enregistrement 0 de l'archive, MUSIC_SYSTEM.md 2.3) :
 *   u8 N ; N x (A, B) ; matrice N x N (0xFF = aucune) ; u8 E ; E x ([L] puis L+1 octets)
 * combat.adl (MUSIC_SYSTEM.md 2.4) :
 *   niveau 1 : entree 0 -> niveau 2 ; entrees 1..N -> pistes principales (XMIDI)
 *   niveau 2 : entree 0 -> niveau 3 ; niveau 3 : les pistes de liaison (XMIDI)
 * Bibliotheque de timbres (Music_LoadTimbreFromLibrary_5A577) : entrees de 6 octets
 *   (patch, banque, offset u32), fin sur banque 0xFF ; a l'offset : u16 longueur puis donnees.
 *   Nom : "strike." + suffixe du pilote ("AD" pour ADLIB.ADV), dans SOUND.
 */
#ifndef SC_DATA_H
#define SC_DATA_H
#include <stdint.h>
#include <stddef.h>

typedef struct { uint8_t *data; size_t size; } ScBlob;

typedef struct {
    /* combat.dat */
    int       track_count;           /* word_7084C */
    uint8_t   phrase_len[256];       /* TrackDescriptor +0xA (A) */
    uint8_t   phrase_last[256];      /* TrackDescriptor +0xB (B) */
    uint8_t  *matrix;                /* dword_70861 : [courante * N + demandee] */
    int       link_entry_count;
    uint8_t  *link_entry[256];       /* dword_7085D[e] : L+1 octets, indexes par la position */
    int       link_entry_len[256];
    /* combat.adl */
    ScBlob   *tracks;                /* [track_count]  word_70854 */
    int       link_track_count;      /* word_7084E */
    ScBlob   *link_tracks;           /* word_70856 */
    /* bibliotheque de timbres */
    uint8_t  *timbre_lib;
    size_t    timbre_lib_size;
} ScMusicData;

/* Charge les trois fichiers. Renvoie 0 si OK ; sinon -1 avec un message sur stderr. */
int  sc_data_load(ScMusicData *d, const char *dat_path, const char *adl_path, const char *lib_path);
void sc_data_free(ScMusicData *d);

/* Cherche (banque, patch) dans la bibliotheque : pointeur sur le timbre (commencant par sa
 * longueur u16) ou NULL. */
const uint8_t *sc_data_find_timbre(const ScMusicData *d, int bank, int patch);

uint8_t *sc_read_file(const char *path, size_t *len);
#endif
