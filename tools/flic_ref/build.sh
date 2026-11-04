#!/bin/sh
# Compile RSFlic (tools/flic_ref/librealspace/src/realspace) contre les sources de libRealSpace et l'essai flic_test.
# Vérifie aussi que SCFlicPlayer.cpp compile avec les en-têtes du jeu (SDL2, OpenGL, imgui : comme tools/mission_ref).
# Usage : tools/flic_ref/build.sh <dossier libRealSpace> [dossier de sortie]
set -e
LIBRS="$1/src"
OUT="${2:-/tmp/flic_ref_build}"
HERE="$(cd "$(dirname "$0")" && pwd)"
NEW="$HERE/librealspace/src"
mkdir -p "$OUT"
FLAGS="-std=c++17 -O1 -Wall -Wextra -I$NEW/realspace -I$LIBRS/realspace -I$LIBRS/commons -I$LIBRS/engine"
for f in commons/ByteStream commons/LZBuffer commons/md5 commons/Quaternion commons/Matrix commons/Math; do
    g++ -std=c++17 -O1 -w -c "$LIBRS/$f.cpp" -o "$OUT/$(basename $f).o"
done
g++ $FLAGS -c "$NEW/realspace/RSFlic.cpp" -o "$OUT/RSFlic.o"
# VGAPalette::ReadPatch est dans engine/Texture.cpp ; engine_stub.cpp fournit les symboles du moteur qu'il demande.
g++ -std=c++17 -O1 -w -I$LIBRS/realspace -I$LIBRS/commons -I$LIBRS/engine -I/usr/include/SDL2 -c "$LIBRS/engine/Texture.cpp" -o "$OUT/Texture.o"
g++ -std=c++17 -O1 -w -I$LIBRS/realspace -I$LIBRS/commons -I$LIBRS/engine -I/usr/include/SDL2 -c "$HERE/engine_stub.cpp" -o "$OUT/engine_stub.o"
g++ $FLAGS "$HERE/flic_test.cpp" "$OUT/RSFlic.o" "$OUT/Texture.o" "$OUT/engine_stub.o" "$OUT/ByteStream.o" "$OUT/LZBuffer.o" "$OUT/md5.o" "$OUT/Quaternion.o" "$OUT/Matrix.o" "$OUT/Math.o" -o "$OUT/flic_test"
echo "$OUT/flic_test"
# Compilation seule de l'activité, avec la copie de libRealSpace où les fichiers de librealspace/src sont posés par-dessus.
TREE="$OUT/tree"
rm -rf "$TREE"
mkdir -p "$TREE"
cp -r "$LIBRS" "$TREE/src"
cp -r "$NEW/." "$TREE/src/"
mkdir -p "$OUT/shim/SDL2"
echo '#include <SDL2/SDL_mixer.h>' > "$OUT/shim/SDL2/SDL_mixer_ext.h"
INC="-I$TREE/src -I$TREE/src/strike_commander -I$TREE/src/realspace -I$TREE/src/engine -I$TREE/src/commons -I$TREE/src/commons/Nuked-OPL3"
INC="$INC -I/usr/include/SDL2 -I/usr/include/imgui -I/usr/include/imgui/backends -I$OUT/shim"
# Tout strike_commander (les deux precomp.h changent), RSFlic, RSMusic par ses utilisateurs, et main.cpp du jeu.
for f in "$TREE"/src/strike_commander/*.cpp "$TREE"/src/realspace/RSFlic.cpp "$TREE"/src/realspace/RSMusic.cpp \
         "$TREE"/src/engine/RSMixer.cpp "$TREE"/src/executables/sc/main.cpp; do
    g++ -std=c++17 -O0 -w -DSI_NO_CONVERSION $INC -fsyntax-only "$f"
done
echo "strike_commander, RSFlic, RSMusic, RSMixer et main.cpp du jeu compilent avec les fichiers modifiés"
