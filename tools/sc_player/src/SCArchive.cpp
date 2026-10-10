#include "SCArchive.h"
#include <cstdio>
#include <cstring>

static uint32_t rd32(const uint8_t *p) {
    return (uint32_t)p[0] | ((uint32_t)p[1] << 8) | ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24);
}

bool SCArchive::open(const uint8_t *b, size_t l) {
    buf = nullptr;
    len = 0;
    n = 0;
    if (l < 8) {
        return false;
    }
    uint32_t first = rd32(b + 4) & 0xFFFFFF;
    if (first < 8 || first > l) {
        return false;
    }
    uint32_t c = first / 4 - 1;
    if (4 + (size_t)c * 4 > l) {
        return false;
    }
    buf = b;
    len = l;
    n = c;
    return true;
}

bool SCArchive::record(uint32_t index, std::vector<uint8_t> &out) const {
    out.clear();
    if (index >= n) {
        return false;
    }
    uint32_t raw = rd32(buf + 4 + index * 4);
    uint32_t off = raw & 0xFFFFFF;
    uint8_t flags = (uint8_t)(raw >> 24);
    uint32_t end = (index + 1 < n) ? (rd32(buf + 4 + (index + 1) * 4) & 0xFFFFFF) : (uint32_t)len;
    if (off > end || end > len) {
        return false;
    }
    uint32_t size = end - off;

    if ((flags & 0xC0) == 0xC0) {
        out.assign(buf + off, buf + end);
        return true;
    }
    if ((flags & 0xC0) == 0) {
        if (size < 4) {
            return false;
        }
        uint32_t usize = rd32(buf + off);
        out.resize(usize);
        size_t got = lzwDecompress(buf + off + 4, size - 4, out.data(), usize);
        if (got != usize) {
            std::fprintf(stderr, "SCArchive : enregistrement %u : LZW a produit %zu octets sur %u\n", index, got, usize);
        }
        out.resize(got);
        return true;
    }
    std::fprintf(stderr, "SCArchive : enregistrement %u : drapeaux 0x%02X non geres\n", index, flags);
    return false;
}

// Port de LZW_Decompress_66068 / LZW_ReadCode_65FCE.
size_t SCArchive::lzwDecompress(const uint8_t *src, size_t srcLen, uint8_t *dst, size_t dstLen) {
    std::vector<uint16_t> prefix(4096 + 1);
    std::vector<uint8_t> suffix(4096 + 1);
    std::vector<uint8_t> stack(4097);
    size_t bitpos = 0;
    size_t out = 0;
    int width = 9;
    int maxcode = 0x200;
    int next = 0x102;
    // word_71103 (code precedent) : la routine du jeu ne traite le premier code en litteral
    // qu'apres un code 256 ; en debut de flux elle decode normalement (prev = 0).
    int prev = 0;
    bool afterClear = false;
    uint8_t first = 0;

    for (;;) {
        // lecture de 3 octets a bitpos/8, decalage de bitpos%8, masque de la largeur
        size_t byte = bitpos >> 3;
        if (byte >= srcLen) {
            break;
        }
        uint32_t v = src[byte];
        if (byte + 1 < srcLen) {
            v |= (uint32_t)src[byte + 1] << 8;
        }
        if (byte + 2 < srcLen) {
            v |= (uint32_t)src[byte + 2] << 16;
        }
        int code = (int)((v >> (bitpos & 7)) & ((1u << width) - 1));
        bitpos += (size_t)width;

        if (code == 0x101) {
            break; // fin
        }
        if (code == 0x100) { // remise a zero
            width = 9;
            maxcode = 0x200;
            next = 0x102;
            afterClear = true;
            continue;
        }
        if (afterClear) { // premier code apres remise a zero
            if (out < dstLen) {
                dst[out++] = (uint8_t)code;
            }
            prev = code;
            first = (uint8_t)code;
            afterClear = false;
            continue;
        }
        int sp = 0;
        int c = code;
        if (code >= next) { // cas KwKwK
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
            if (out < dstLen) {
                dst[out++] = ch;
            }
        }
        if (next <= 4096) {
            prefix[next] = (uint16_t)prev;
            suffix[next] = first;
            next++;
        }
        prev = code;
        if (next >= maxcode && width < 12) {
            width++;
            maxcode <<= 1;
        }
    }
    return out;
}
