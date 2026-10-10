#!/bin/sh
# Test de non-regression de sc_player sur donnees synthetiques (pas de fichiers du jeu requis).
# Usage : tests/run_tests.sh [repertoire_build]
set -e
HERE=$(cd "$(dirname "$0")" && pwd)
BUILD=${1:-$HERE/../build}
TMP=$(mktemp -d)
python3 "$HERE/make_test_data.py" "$TMP/data" > /dev/null
"$BUILD/sc_player" --sound "$TMP/data" --wav "$TMP/out.wav" --seconds 30 --tune 4 \
    --at 5:0x10 --at 14:9 --at 26:stop 2> "$TMP/log"
fail=0
check() { if grep -q "$1" "$TMP/log"; then echo "OK   $2"; else echo "ECHEC $2"; fail=1; fi; }
# 120 noires/min en 4/4 : demande a t=5 s (mesure 2), resolution a la barre suivante (t~6,05 s),
# position (2 mod 30)+1 = 3, entree de liaison 24 -> piste de liaison 0x13 (COMBAT.DAT reel).
check "etat 2 attente de la barre, piste 0x04, mesure 2"                     "demande mise en attente de la barre"
check "t=  6.0[0-9] s : etat 3 liaison en cours.*entree 24, position 3, valeur 0x13" "liaison 4 -> 0x10 a la position 3"
check "etat 1 lecture, piste 0x10"                                            "ponctuation 0x10 jouee apres la liaison"
check "etat 1 lecture, piste 0x04, .*entree 255"                              "retour a la piste de reprise 4"
check "etat 1 lecture, piste 0x09"                                            "bascule directe 4 -> 9"
python3 - "$TMP/out.wav" <<'PY' || fail=1
import array, sys
a = array.array('h', open(sys.argv[1], 'rb').read()[44:])
peak = lambda t0, t1: max(abs(x) for x in a[int(t0 * 44100) * 2:int(t1 * 44100) * 2])
ok = peak(1, 4) > 500 and peak(28, 30) < 100
print(("OK  " if ok else "ECHEC") + " son produit (crete %d), silence apres le fondu (crete %d)" % (peak(1, 4), peak(28, 30)))
sys.exit(0 if ok else 1)
PY
rm -rf "$TMP"
exit $fail
