//
//  SCArchive.h - Archive indexee du jeu (IndexedRecordReader, seg196) + LZW (seg197).
//  Propre au lecteur autonome : dans libRealSpace, c'est PakArchive qui joue ce role.
//
//  Format, d'apres IndexedRecordReader_Method_ComputeCount_65B26,
//  IndexedRecordReader_ReadEntry_65DA9 et IndexedRecordReader_AdvanceIndex_65E2C :
//    dword 0          : taille totale (non utilisee pour le comptage)
//    dword 1 + i      : entree i = offset (24 bits bas) | drapeaux (8 bits hauts)
//                       ('sar eax,18h' / 'and eax,0FFFFFFh')
//    nombre d'entrees = offset de l'entree 0 / 4 - 1   ('idiv ebx(4) / dec ax')
//    taille d'un enregistrement = offset suivant - offset ; le dernier finit en fin de flux.
//    drapeaux & 0xC0 == 0xC0 : donnees brutes.
//    drapeaux & 0xC0 == 0    : 4 octets = taille decompressee, puis flux LZW
//                              (IndexedRecordReader_ReadIndexTable_65B73 -> LZW_Decompress_66068).
//
#pragma once
#include <cstdint>
#include <cstddef>
#include <vector>

class SCArchive {
public:
    bool open(const uint8_t *buf, size_t len);
    uint32_t count() const {
        return n;
    }
    // Enregistrement decompresse ; false si erreur.
    bool record(uint32_t index, std::vector<uint8_t> &out) const;

    // Decodeur LZW du jeu : codes 9 a 12 bits lus poids faible d'abord, 256 = remise a zero,
    // 257 = fin, premier code libre 258. Renvoie le nombre d'octets ecrits.
    static size_t lzwDecompress(const uint8_t *src, size_t srcLen, uint8_t *dst, size_t dstLen);

private:
    const uint8_t *buf = nullptr;
    size_t len = 0;
    uint32_t n = 0;
};
