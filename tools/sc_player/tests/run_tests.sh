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
# Pas de retour automatique apres une ponctuation (logique de mission, pas du .dat) :
# 0x10 joue jusqu'au bout puis la demande suivante part de 0x10.
if [ "$(grep -c 'etat 1 lecture, piste 0x04' "$TMP/log")" = 1 ]; then echo "OK   pas de retour automatique a la piste 4"; else echo "ECHEC pas de retour automatique a la piste 4"; fail=1; fi
check "etat 2 attente de la barre, piste 0x10"                                "la piste 0x10 reste courante jusqu'a la demande suivante"
check "etat 1 lecture, piste 0x09, .*entree 255"                              "bascule directe 0x10 -> 9"
# Evenements du sequenceur, dans l'ordre (ce que le jeu lit avec RSMixer::pollMusicEvent)
python3 - "$TMP/log" <<'PY' || fail=1
import re, sys
got = [l.split('evenement ', 1)[1].strip() for l in open(sys.argv[1]) if 'evenement ' in l]
want = [r'TRACK_STARTED piste 0x04$',
        r'TRANSITION_STARTED piste 0x10 depuis 0x04, liaison 18, mesure 3$',
        r'TRACK_STARTED piste 0x10 depuis 0x04$',
        r'TRACK_FINISHED piste 0x10, mesure \d+$',
        r'TRACK_STARTED piste 0x09 depuis 0x10$',
        r'MUSIC_STOPPED piste 0x09$']
ok = len(got) == len(want) and all(re.match(w, g) for w, g in zip(want, got))
print(("OK  " if ok else "ECHEC") + " evenements : " + " / ".join(got))
sys.exit(0 if ok else 1)
PY
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
