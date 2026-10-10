#!/usr/bin/env python3
"""Fabrique un jeu de donnees SYNTHETIQUE pour tester sc_player sans les fichiers du jeu.
  COMBAT.DAT : copie du vrai fichier (analysis/sample_dat_files/COMBAT.DAT)
  COMBAT.ADL : meme structure que le vrai fichier (fichier -> jeu -> liaisons / pistes),
               pistes XMIDI fabriquees (certaines compressees en LZW)
  STRIKE.AD  : bibliotheque de timbres (format Global Timbre Library) avec timbres OPL simples
               et un timbre TVFX
Ces musiques ne sont PAS celles du jeu : elles servent seulement a verifier la mecanique
(archive, LZW, XMIDI, mesures, transitions, pilote)."""
import struct, sys, os, shutil
out = sys.argv[1]
here = os.path.dirname(os.path.abspath(__file__))
os.makedirs(out, exist_ok=True)
shutil.copy(os.path.join(here, '../../../analysis/sample_dat_files/COMBAT.DAT'), os.path.join(out, 'COMBAT.DAT'))

def vln(n):
    b = [n & 0x7F]; n >>= 7
    while n: b.insert(0, 0x80 | (n & 0x7F)); n >>= 7
    return bytes(b)

def interval(n):
    r = b''
    while n > 0x7F: r += b'\x7f'; n -= 0x7F
    return r + (bytes([n]) if n else b'')

def chunk(tag, data):
    d = tag + struct.pack('>I', len(data)) + data
    return d + (b'\0' if len(data) & 1 else b'')

def xmid(notes, bars, tempo_us=500000, timbres=((0, 0), (1, 0))):
    """notes : liste de (canal, note) jouees en noires sur `bars` mesures de 4/4."""
    q = int(round(120 * tempo_us / 1e6))           # intervalles de 1/120 s par noire
    ev = b'\xff\x58\x04\x04\x02\x18\x08' + b'\xff\x51\x03' + tempo_us.to_bytes(3, 'big')
    for ch, (patch, bank) in enumerate(timbres, start=1):
        ev += bytes([0xB0 | ch, 0x72, bank, 0xC0 | ch, patch, 0xB0 | ch, 7, 110])
    for i in range(bars * 4):
        ch, n = notes[i % len(notes)]
        ev += bytes([0x90 | ch, n, 100]) + vln(q - 4)
        if i % 4 == 0: ev += bytes([0x91 + 1, n - 24, 90]) + vln(4 * q - 8)   # basse canal 2
        ev += interval(q)
    ev += b'\xff\x2f\x00'
    timb = struct.pack('<H', len(timbres)) + b''.join(bytes([p, b]) for p, b in timbres)
    form = b'XMID' + chunk(b'TIMB', timb) + chunk(b'EVNT', ev)
    xdir = chunk(b'FORM', b'XDIR' + chunk(b'INFO', struct.pack('<H', 1)))
    return xdir + chunk(b'CAT ', b'XMID' + chunk(b'FORM', form))

def lzw(data):
    """Encodeur compatible LZW_Decompress_66068 : code 256 en tete, 9->12 bits, LSB d'abord."""
    codes, d, nxt, w = [256], {bytes([i]): i for i in range(256)}, 258, b''
    for c in data:
        wc = w + bytes([c])
        if wc in d: w = wc; continue
        codes.append(d[w])
        if nxt < 4096: d[wc] = nxt; nxt += 1
        w = bytes([c])
    if w: codes.append(d[w])
    codes.append(257)
    bits, nbits, out, dec_next = 0, 0, bytearray(), 258
    for i, code in enumerate(codes):
        if code == 256: width, dec_next, k = 9, 258, 0
        else:
            width = 9
            nx = dec_next
            while nx >= (1 << width) and width < 12: width += 1
        bits |= code << nbits; nbits += width
        while nbits >= 8: out.append(bits & 0xFF); bits >>= 8; nbits -= 8
        if code not in (256, 257):
            if k > 0 and dec_next <= 4096: dec_next += 1
            k += 1
    if nbits: out.append(bits & 0xFF)
    return bytes(out)

def archive(records, compress=()):
    n = len(records)
    off = 4 + 4 * n
    idx, body = [], b''
    for i, r in enumerate(records):
        if i in compress: data, flags = struct.pack('<I', len(r)) + lzw(r), 0x00
        else: data, flags = r, 0xE0
        idx.append((off + len(body)) | (flags << 24)); body += data
    total = off + len(body)
    return struct.pack('<I', total) + b''.join(struct.pack('<I', e) for e in idx) + body

scales = [60, 62, 64, 65, 67, 69, 71, 72]
tracks = []
for t in range(22):
    base = 48 + (t * 5) % 24
    notes = [(1, base + scales[(i * (t + 1)) % 8] - 60 + 12) for i in range(8)]
    bars = 2 if 0x10 <= t <= 0x12 else 8
    tracks.append(xmid(notes, bars, timbres=((t % 4, 0), (4, 0))))
links = [xmid([(1, 72 + i % 12), (1, 76 + i % 12)], 1, timbres=((2, 0), (4, 0))) for i in range(22)]
links_ar = archive(links, compress={0, 5})                  # archive des pistes de liaison
music_set = archive([links_ar] + tracks, compress={1, 2, 5})  # le jeu : 0 = liaisons, 1..N = pistes
adl = archive([music_set])                                  # le fichier : 1 entree
open(os.path.join(out, 'COMBAT.ADL'), 'wb').write(adl)

def bnk(transpose, mod, car, fbc):
    # longueur 0x0E, transposition, puis AVEKM KSL/TL AD SR WS (mod), FB/C, AVEKM KSL/TL AD SR WS (porteur)
    return struct.pack('<H', 0x0E) + bytes([transpose & 0xFF, mod[0], mod[1], mod[2], mod[3], mod[4], fbc,
                                            car[0], car[1], car[2], car[3], car[4]])
timbres = {
    (0, 0): bnk(0, (0x21, 0x1A, 0xF2, 0x52, 0), (0x21, 0x00, 0xF4, 0x55, 0), 0x0C),
    (1, 0): bnk(0, (0x31, 0x16, 0xC2, 0x33, 1), (0x21, 0x00, 0xC5, 0x34, 0), 0x0A),
    (2, 0): bnk(12, (0x01, 0x22, 0xF5, 0x45, 0), (0x01, 0x00, 0xF6, 0x46, 0), 0x08),
    (4, 0): bnk(0, (0x01, 0x10, 0xF0, 0x77, 0), (0x01, 0x00, 0xF0, 0x77, 0), 0x01),
}
# timbre TVFX (type 1) pour le patch 3 : courbes simples (tenue puis decroissance)
def tvfx():
    hdr_len = 0x36
    curves = []
    def curve(keyon, release):
        curves.append((keyon, release))
    hold = lambda val: [0xFFFF, val, 0x7FFF, 0]
    decay = [0x100, 0xFF00, 0x7FFF, 0]           # descend jusqu a 0 : la voix est liberee
    # ordre des champs : freq, lvl0, lvl1, prio, fb, mult0, mult1, wave
    init = [0x2000, 0xF000, 0xFC00, 0x4000, 0x6000, 0x1000, 0x1000, 0x0000]
    body = b''
    offs = []
    for p in range(8):
        k = hold(init[p]) if p not in (1, 2) else [0xFFFF, init[p], 0x7FFF, 0]
        r = decay if p in (1, 2) else [0x7FFF, 0]
        ko = hdr_len + len(body); body += struct.pack('<%dH' % len(k), *k)
        ro = hdr_len + len(body); body += struct.pack('<%dH' % len(r), *r)
        offs.append((ko - 2, ro - 2))
    h = bytearray(hdr_len)
    total = hdr_len + len(body)
    struct.pack_into('<H', h, 0, total); h[2] = 0; h[3] = 1; struct.pack_into('<H', h, 4, 0xFFFF)
    fields = [(0x06, 0x08, 0x0A), (0x0C, 0x0E, 0x10), (0x12, 0x14, 0x16), (0x18, 0x1A, 0x1C),
              (0x1E, 0x20, 0x22), (0x24, 0x26, 0x28), (0x2A, 0x2C, 0x2E), (0x30, 0x32, 0x34)]
    for p, (fi, fk, fr) in enumerate(fields):
        struct.pack_into('<HHH', h, fi, init[p], offs[p][0], offs[p][1])
    return bytes(h) + body
timbres[(3, 0)] = tvfx()
entries, data = b'', b''
base = 6 * (len(timbres) + 1)
for (patch, bank), t in timbres.items():
    entries += bytes([patch, bank]) + struct.pack('<I', base + len(data)); data += t
entries += bytes([0, 0xFF, 0, 0, 0, 0])
open(os.path.join(out, 'STRIKE.AD'), 'wb').write(entries + data)
print('donnees de test ecrites dans', out)
