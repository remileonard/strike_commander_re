#include "sc_data.h"
#include "sc_archive.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

uint8_t *sc_read_file(const char *path, size_t *len)
{
    FILE *f = fopen(path, "rb");
    if (!f) return NULL;
    fseek(f, 0, SEEK_END);
    long n = ftell(f);
    fseek(f, 0, SEEK_SET);
    uint8_t *b = (uint8_t *)malloc(n > 0 ? (size_t)n : 1);
    if (!b || fread(b, 1, (size_t)n, f) != (size_t)n) { fclose(f); free(b); return NULL; }
    fclose(f);
    *len = (size_t)n;
    return b;
}

static int parse_dat(ScMusicData *d, const uint8_t *r, size_t n)
{
    size_t p = 0;
    if (n < 1) return -1;
    d->track_count = r[p++];
    if (p + 2u * d->track_count > n) return -1;
    for (int i = 0; i < d->track_count; i++) {
        d->phrase_len[i]  = r[p++];
        d->phrase_last[i] = r[p++];
    }
    size_t m = (size_t)d->track_count * d->track_count;
    if (p + m + 1 > n) return -1;
    d->matrix = (uint8_t *)malloc(m);
    memcpy(d->matrix, r + p, m);
    p += m;
    d->link_entry_count = r[p++];
    for (int e = 0; e < d->link_entry_count; e++) {
        if (p >= n) return -1;
        int len = r[p++] + 1;
        if (p + (size_t)len > n) return -1;
        d->link_entry[e] = (uint8_t *)malloc((size_t)len);
        memcpy(d->link_entry[e], r + p, (size_t)len);
        d->link_entry_len[e] = len;
        p += (size_t)len;
    }
    return 0;
}

int sc_data_load(ScMusicData *d, const char *dat_path, const char *adl_path, const char *lib_path)
{
    memset(d, 0, sizeof(*d));
    size_t len;
    uint8_t *buf = sc_read_file(dat_path, &len);
    if (!buf) { fprintf(stderr, "impossible d'ouvrir %s\n", dat_path); return -1; }
    ScArchive a;
    size_t rl;
    uint8_t *rec = NULL;
    if (sc_archive_open(&a, buf, len) || !(rec = sc_archive_record(&a, 0, &rl)) || parse_dat(d, rec, rl)) {
        fprintf(stderr, "%s : format inattendu\n", dat_path);
        free(rec); free(buf); return -1;
    }
    free(rec); free(buf);

    buf = sc_read_file(adl_path, &len);
    if (!buf) { fprintf(stderr, "impossible d'ouvrir %s\n", adl_path); return -1; }
    /* Structure reelle (verifiee sur le COMBAT.ADL fourni par Remi) :
     *   fichier : archive a 1 entree = le jeu de musique (comme COMBAT.DAT)
     *   jeu     : entree 0 = archive des pistes de liaison, entrees 1..N = pistes principales */
    ScArchive l1, l2, l3;
    size_t s2, s3;
    uint8_t *r2 = NULL, *r3 = NULL;
    if (sc_archive_open(&l1, buf, len) || !(r2 = sc_archive_record(&l1, 0, &s2)) || sc_archive_open(&l2, r2, s2)) {
        fprintf(stderr, "%s : index invalide\n", adl_path); free(r2); free(buf); return -1;
    }
    if (l2.count < (uint32_t)d->track_count + 1)
        fprintf(stderr, "%s : %u enregistrements, %d pistes attendues + 1\n", adl_path, l2.count, d->track_count);
    d->tracks = (ScBlob *)calloc((size_t)d->track_count, sizeof(ScBlob));
    for (int i = 0; i < d->track_count; i++) {
        d->tracks[i].data = sc_archive_record(&l2, (uint32_t)i + 1, &d->tracks[i].size);
        if (!d->tracks[i].data) fprintf(stderr, "%s : piste %d absente\n", adl_path, i);
    }
    if ((r3 = sc_archive_record(&l2, 0, &s3)) && !sc_archive_open(&l3, r3, s3)) {
        d->link_track_count = (int)l3.count;
        d->link_tracks = (ScBlob *)calloc(l3.count ? l3.count : 1, sizeof(ScBlob));
        for (uint32_t i = 0; i < l3.count; i++)
            d->link_tracks[i].data = sc_archive_record(&l3, i, &d->link_tracks[i].size);
    } else {
        fprintf(stderr, "%s : archive des pistes de liaison illisible\n", adl_path);
    }
    free(r3); free(r2); free(buf);

    d->timbre_lib = sc_read_file(lib_path, &d->timbre_lib_size);
    if (!d->timbre_lib)   /* sans bibliotheque : les pistes se chargent et s'enchainent, mais aucun timbre -> silence */
        fprintf(stderr, "ATTENTION : %s introuvable (bibliotheque de timbres) : aucune note ne sonnera\n", lib_path);
    return 0;
}

void sc_data_free(ScMusicData *d)
{
    free(d->matrix);
    for (int e = 0; e < d->link_entry_count; e++) free(d->link_entry[e]);
    for (int i = 0; d->tracks && i < d->track_count; i++) free(d->tracks[i].data);
    for (int i = 0; d->link_tracks && i < d->link_track_count; i++) free(d->link_tracks[i].data);
    free(d->tracks); free(d->link_tracks); free(d->timbre_lib);
    memset(d, 0, sizeof(*d));
}

const uint8_t *sc_data_find_timbre(const ScMusicData *d, int bank, int patch)
{
    const uint8_t *p = d->timbre_lib;
    size_t n = d->timbre_lib_size;
    for (size_t o = 0; o + 6 <= n; o += 6) {
        if (p[o + 1] == 0xFF) break;
        if (p[o] == patch && p[o + 1] == bank) {
            uint32_t off = (uint32_t)p[o + 2] | ((uint32_t)p[o + 3] << 8) | ((uint32_t)p[o + 4] << 16) | ((uint32_t)p[o + 5] << 24);
            if (off + 2 > n) return NULL;
            uint16_t len = (uint16_t)(p[off] | (p[off + 1] << 8));
            if (off + len > n) return NULL;
            return p + off;
        }
    }
    return NULL;
}
