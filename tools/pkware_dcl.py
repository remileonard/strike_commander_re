"""Décompression PKWARE DCL (« implode » / « explode ») : CONV.PAK et toutes les entrées des PAK de
PACIFIC.DAT (Pacific Strike). Algorithme de blast.c (zlib/contrib) ; libRealSpace : commons/pklib.
"""

# Longueurs et distances codées du format PKWARE DCL (mêmes tables que blast.c de zlib et pklib).
LITERAL_LENGTHS = [11, 124, 8, 7, 28, 7, 188, 13, 76, 4, 10, 8, 12, 10, 12, 10, 8, 23, 8, 9, 7, 6, 7, 8, 7,
                   6, 55, 8, 23, 24, 12, 11, 7, 9, 11, 12, 6, 7, 22, 5, 7, 24, 6, 11, 9, 6, 7, 22, 7, 11, 38,
                   7, 9, 8, 25, 11, 8, 11, 9, 12, 8, 12, 5, 38, 5, 38, 5, 11, 7, 5, 6, 21, 6, 10, 53, 8, 7,
                   24, 10, 27, 44, 253, 253, 253, 252, 252, 252, 13, 12, 45, 12, 45, 12, 61, 12, 45, 44,
                   173]
LENGTH_LENGTHS = [2, 35, 36, 53, 38, 23]
DISTANCE_LENGTHS = [2, 20, 53, 230, 247, 151, 248]
LENGTH_BASE = [3, 2, 4, 5, 6, 7, 8, 9, 10, 12, 16, 24, 40, 72, 136, 264]
LENGTH_EXTRA = [0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8]


def build_code(compact):
    """Table de Huffman (longueur de chaque symbole) à partir du format compact : octet = (répétitions − 1) × 16
    + longueur. Rend (nombre de codes par longueur, symboles triés)."""
    lengths = []
    for byte in compact:
        lengths += [byte & 15] * ((byte >> 4) + 1)
    count = [0] * 14
    for n in lengths:
        count[n] += 1
    offsets = [0] * 14
    for n in range(1, 13):
        offsets[n + 1] = offsets[n] + count[n]
    symbols = [0] * len(lengths)
    for symbol, n in enumerate(lengths):
        if n:
            symbols[offsets[n]] = symbol
            offsets[n] += 1
    return count, symbols


LITERALS = build_code(LITERAL_LENGTHS)
LENGTHS = build_code(LENGTH_LENGTHS)
DISTANCES = build_code(DISTANCE_LENGTHS)


class Bits:
    def __init__(self, data):
        self.data = data
        self.pos = 0
        self.buffer = 0
        self.count = 0

    def take(self, need):
        while self.count < need:
            self.buffer |= self.data[self.pos] << self.count
            self.pos += 1
            self.count += 8
        value = self.buffer & ((1 << need) - 1)
        self.buffer >>= need
        self.count -= need
        return value

    def decode(self, table):
        """Codes de Huffman écrits bits inversés (comme blast.c)."""
        count, symbols = table
        code = 0
        first = 0
        index = 0
        for n in range(1, 14):
            code |= self.take(1) ^ 1
            number = count[n]
            if code < first + number:
                return symbols[index + (code - first)]
            index += number
            first += number
            first <<= 1
            code <<= 1
        raise ValueError('code de Huffman invalide')


def explode(data):
    """Décompresse un flux PKWARE DCL : octet 0 = littéraux codés (1) ou bruts (0), octet 1 = taille du
    dictionnaire (4 à 6 bits de distance)."""
    bits = Bits(data)
    coded = bits.take(8)
    dict_bits = bits.take(8)
    if coded > 1 or dict_bits < 4 or dict_bits > 6:
        raise ValueError('en-tête PKWARE DCL invalide')
    out = bytearray()
    while True:
        if bits.take(1):
            symbol = bits.decode(LENGTHS)
            length = LENGTH_BASE[symbol] + bits.take(LENGTH_EXTRA[symbol])
            if length == 519:
                break
            extra = 2 if length == 2 else dict_bits
            distance = (bits.decode(DISTANCES) << extra) + bits.take(extra) + 1
            for _ in range(length):
                out.append(out[-distance])
        else:
            out.append(bits.decode(LITERALS) if coded else bits.take(8))
    return bytes(out)
