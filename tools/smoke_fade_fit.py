"""Approche chaque table FADE par un mélange alpha : palette[FADE[k][c]] ≈ (1 − a) × palette[c] + a × T.

Pour chaque table k : alpha a et couleur cible T (RVB 0 à 255) qui minimisent l'écart sur les 256
couleurs de la palette (moindres carrés, solution fermée). Sert au portage : la teinte d'une particule
de fumée (SMOKE_SYSTEM.md § 5.3) devient une couleur et un alpha ordinaires, calculés une fois au
chargement, et le mélange alpha de la carte graphique fait le reste.

Usage : python3 tools/smoke_fade_fit.py --donnees <BIGTRE.TRE ou DATA> [PALETTE.IFF PALFADE.IFF]
"""
import math
import os
import struct
import sys

if '--donnees' in sys.argv:
    _i = sys.argv.index('--donnees')
    os.environ['SC_DATA'] = sys.argv[_i + 1]
    del sys.argv[_i:_i + 2]

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sc_data as d  # noqa: E402


def chunk(data, tag, start=12):
    i = data.find(tag, start)
    n = struct.unpack('>I', data[i + 4:i + 8])[0]
    return data[i + 8:i + 8 + n]


def load(palette_name, fade_name):
    pal_iff = d.read(os.path.join(d.GAME, 'PALETTE', palette_name))
    raw = chunk(pal_iff, b'PALT')[4:4 + 768]
    rgb = [min(255, v * 255 // 63) for v in raw]
    fade = chunk(d.read(os.path.join(d.GAME, 'PALETTE', fade_name)), b'FADE', 0)
    return rgb, fade


def fit(rgb, table):
    """a, T et écarts (moyen, maximal) pour une table de 256 octets."""
    n = 256
    ins = [[rgb[3 * c + ch] for ch in range(3)] for c in range(n)]
    outs = [[rgb[3 * table[c] + ch] for ch in range(3)] for c in range(n)]
    num = 0.0
    den = 0.0
    means_in = [sum(v[ch] for v in ins) / n for ch in range(3)]
    means_d = [sum(outs[c][ch] - ins[c][ch] for c in range(n)) / n for ch in range(3)]
    for ch in range(3):
        for c in range(n):
            x = ins[c][ch] - means_in[ch]
            y = outs[c][ch] - ins[c][ch] - means_d[ch]
            num += x * y
            den += x * x
    a = -num / den if den else 0.0
    b = [means_d[ch] + a * means_in[ch] for ch in range(3)]
    target = [b[ch] / a if abs(a) > 1e-6 else 0.0 for ch in range(3)]
    errors = []
    for c in range(n):
        e = 0.0
        for ch in range(3):
            pred = (1 - a) * ins[c][ch] + a * target[ch]
            e += (pred - outs[c][ch]) ** 2
        errors.append(math.sqrt(e / 3))
    return a, target, sum(errors) / n, max(errors)


def main():
    names = sys.argv[1:] if len(sys.argv) == 3 else ['PALETTE.IFF', 'PALFADE.IFF']
    rgb, fade = load(names[0], names[1])
    print('table  alpha   couleur cible (R, V, B)   écart moyen  écart max')
    for k in range(len(fade) // 256):
        a, t, mean, worst = fit(rgb, fade[256 * k:256 * k + 256])
        col = ', '.join('%3d' % max(0, min(255, round(v))) for v in t)
        print('%5d  %5.3f   (%s)          %6.1f      %6.1f' % (k, a, col, mean, worst))


if __name__ == '__main__':
    main()
