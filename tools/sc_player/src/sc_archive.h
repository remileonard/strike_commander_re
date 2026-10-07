/*
 * sc_archive.h - Archive indexee du jeu (IndexedRecordReader, seg196) + LZW (seg197).
 *
 * Format, d'apres IndexedRecordReader_Method_ComputeCount_65B26,
 * IndexedRecordReader_ReadEntry_65DA9 et IndexedRecordReader_AdvanceIndex_65E2C :
 *   dword 0          : taille totale (non utilisee pour le comptage)
 *   dword 1 + i      : entree i = offset (24 bits bas) | drapeaux (8 bits hauts)
 *                      ('sar eax,18h' / 'and eax,0FFFFFFh')
 *   nombre d'entrees = offset de l'entree 0 / 4 - 1   ('idiv ebx(4) / dec ax')
 *   taille d'un enregistrement = offset suivant - offset ; le dernier finit en fin de flux.
 *   drapeaux & 0xC0 == 0xC0 : donnees brutes.
 *   drapeaux & 0xC0 == 0    : 4 octets = taille decompressee, puis flux LZW
 *                             (IndexedRecordReader_ReadIndexTable_65B73 -> LZW_Decompress_66068).
 */
#ifndef SC_ARCHIVE_H
#define SC_ARCHIVE_H
#include <stdint.h>
#include <stddef.h>

typedef struct {
    const uint8_t *buf;
    size_t         len;
    uint32_t       count;
} ScArchive;

/* 0 si OK */
int  sc_archive_open(ScArchive *a, const uint8_t *buf, size_t len);

/* Renvoie un buffer alloue (malloc) contenant l'enregistrement decompresse, NULL si erreur.
 * *out_len = taille. */
uint8_t *sc_archive_record(const ScArchive *a, uint32_t index, size_t *out_len);

/* Decodeur LZW du jeu : codes 9 a 12 bits lus poids faible d'abord, 256 = remise a zero,
 * 257 = fin, premier code libre 258. Renvoie le nombre d'octets ecrits. */
size_t sc_lzw_decompress(const uint8_t *src, size_t src_len, uint8_t *dst, size_t dst_len);

#endif
