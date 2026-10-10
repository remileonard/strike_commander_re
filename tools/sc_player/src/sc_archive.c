#include "sc_archive.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static uint32_t rd32(const uint8_t *p)
{
    return (uint32_t)p[0] | ((uint32_t)p[1] << 8) | ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24);
}

int sc_archive_open(ScArchive *a, const uint8_t *buf, size_t len)
{
    memset(a, 0, sizeof(*a));
    if (len < 8) return -1;
    uint32_t first = rd32(buf + 4) & 0xFFFFFF;
    if (first < 8 || first > len) return -1;
    a->buf = buf;
    a->len = len;
    a->count = first / 4 - 1;
    if (4 + (size_t)a->count * 4 > len) return -1;
    return 0;
}

uint8_t *sc_archive_record(const ScArchive *a, uint32_t index, size_t *out_len)
{
    *out_len = 0;
    if (index >= a->count) return NULL;
    uint32_t raw = rd32(a->buf + 4 + index * 4);
    uint32_t off = raw & 0xFFFFFF;
    uint8_t flags = (uint8_t)(raw >> 24);
    uint32_t end = (index + 1 < a->count) ? (rd32(a->buf + 4 + (index + 1) * 4) & 0xFFFFFF)
                                          : (uint32_t)a->len;
    if (off > end || end > a->len) return NULL;
    uint32_t size = end - off;

    if ((flags & 0xC0) == 0xC0) {
        uint8_t *out = (uint8_t *)malloc(size ? size : 1);
        if (!out) return NULL;
        memcpy(out, a->buf + off, size);
        *out_len = size;
        return out;
    }
    if ((flags & 0xC0) == 0) {
        if (size < 4) return NULL;
        uint32_t usize = rd32(a->buf + off);
        uint8_t *out = (uint8_t *)malloc(usize ? usize : 1);
        if (!out) return NULL;
        size_t n = sc_lzw_decompress(a->buf + off + 4, size - 4, out, usize);
        if (n != usize)
            fprintf(stderr, "sc_archive: enregistrement %u : LZW a produit %zu octets sur %u\n",
                    index, n, usize);
        *out_len = n;
        return out;
    }
    fprintf(stderr, "sc_archive: enregistrement %u : drapeaux 0x%02X non geres\n", index, flags);
    return NULL;
}

/* Port de LZW_Decompress_66068 / LZW_ReadCode_65FCE. */
size_t sc_lzw_decompress(const uint8_t *src, size_t src_len, uint8_t *dst, size_t dst_len)
{
    static uint16_t prefix[4096 + 1];
    static uint8_t  suffix[4096 + 1];
    uint8_t stack[4097];
    size_t bitpos = 0, out = 0;
    int width = 9, maxcode = 0x200, next = 0x102;
    /* word_71103 (code precedent) : la routine du jeu ne traite le premier code en litteral
     * qu'apres un code 256 ; en debut de flux elle decode normalement (prev = 0). */
    int prev = 0, after_clear = 0;
    uint8_t first = 0;

    for (;;) {
        /* lecture de 3 octets a bitpos/8, decalage de bitpos%8, masque de la largeur */
        size_t byte = bitpos >> 3;
        if (byte >= src_len) break;
        uint32_t v = src[byte];
        if (byte + 1 < src_len) v |= (uint32_t)src[byte + 1] << 8;
        if (byte + 2 < src_len) v |= (uint32_t)src[byte + 2] << 16;
        int code = (int)((v >> (bitpos & 7)) & ((1u << width) - 1));
        bitpos += (size_t)width;

        if (code == 0x101) break;                 /* fin */
        if (code == 0x100) {                      /* remise a zero */
            width = 9; maxcode = 0x200; next = 0x102; after_clear = 1;
            continue;
        }
        if (after_clear) {                        /* premier code apres remise a zero */
            if (out < dst_len) dst[out++] = (uint8_t)code;
            prev = code; first = (uint8_t)code; after_clear = 0;
            continue;
        }
        int sp = 0, c = code;
        if (code >= next) {                       /* cas KwKwK */
            stack[sp++] = first;
            c = prev;
        }
        while (c > 0xFF && sp < 4096) {
            stack[sp++] = suffix[c];
            c = prefix[c];
        }
        first = (uint8_t)c;
        stack[sp++] = first;
        while (sp > 0) {
            uint8_t ch = stack[--sp];
            if (out < dst_len) dst[out++] = ch;
        }
        if (next <= 4096) {
            prefix[next] = (uint16_t)prev;
            suffix[next] = first;
            next++;
        }
        prev = code;
        if (next >= maxcode && width < 12) { width++; maxcode <<= 1; }
    }
    return out;
}
