#!/bin/sh
# Compile RSMusic + RSMixer avec des substituts (AssetManager, PakArchive, SDL_mixer_ext) et
# compare la sortie du crochet audio au WAV de sc_player (meme scenario, doit etre identique).
# Usage : integration/test/run.sh REPERTOIRE_SOUND SC_PLAYER_BUILD
#   REPERTOIRE_SOUND : COMBAT.ADL, COMBAT.DAT, STRIKE.AD du jeu
set -e
HERE=$(cd "$(dirname "$0")" && pwd); P=$HERE/../..
SND=$1; BUILD=$2; T=$(mktemp -d)
mkdir -p $T/realspace $T/mixer
cp $HERE/stubs/*.h $HERE/stubs/*.cpp $P/integration/RSMusic.* $T/realspace/
cp $P/integration/RSMixer.* $T/mixer/
cp $HERE/test_rsmixer.cpp $T/
gcc -O2 -c $P/third_party/Nuked-OPL3/opl3.c -o $T/opl3.o
g++ -std=c++17 -O2 -Wall -Wextra -I$T -I$T/realspace -I$HERE/stubs -I$P/librealspace -I$P/src -I$P/third_party/Nuked-OPL3 \
    $(sdl2-config --cflags) $T/test_rsmixer.cpp $T/realspace/RSMusic.cpp $T/realspace/AssetManager.cpp $T/mixer/RSMixer.cpp \
    $P/src/SCArchive.cpp $P/librealspace/*.cpp $T/opl3.o $(sdl2-config --libs) -o $T/test
$T/test "$SND" $T/out.raw | tee $T/test.log
# Evenements attendus (types : 0 TRANSITION_STARTED, 1 TRACK_STARTED, 2 TRACK_FINISHED, 3 MUSIC_STOPPED)
cat > $T/want.txt <<'W'
evenement 1 piste 4 depuis -1 liaison -1
evenement 0 piste 16 depuis 4 liaison 19
evenement 1 piste 16 depuis 4 liaison -1
evenement 2 piste 16 depuis -1 liaison -1
evenement 1 piste 9 depuis 16 liaison -1
evenement 1 piste 19 depuis 9 liaison -1
evenement 3 piste 19 depuis -1 liaison -1
evenement 1 piste -1 depuis -1 liaison -1
evenement 3 piste -1 depuis -1 liaison -1
W
ev=0
if grep '^evenement' $T/test.log | cmp -s - $T/want.txt; then echo "OK   evenements de RSMixer"; else echo "ECHEC evenements de RSMixer"; ev=1; fi
"$BUILD/sc_player" --sound "$SND" --wav $T/ref.wav --seconds 60 --tune 4 --at 12:0x10 --at 30:9 --at 45:0x13 --at 55:stop 2>/dev/null
tail -c +45 $T/ref.wav > $T/ref.raw
if cmp -s $T/out.raw $T/ref.raw; then echo "OK   RSMixer identique a sc_player"; r=0; else echo "ECHEC RSMixer differe de sc_player"; r=1; fi
rm -rf $T; [ $ev = 0 ] || r=1; exit $r
