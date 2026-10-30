#!/bin/sh
# Compile les essais mission_areas_test, mission_part_test, mission_load_test et mission_relative_test contre libRealSpace (avec les fichiers de tools/mission_ref/librealspace/src copiés par-dessus).
# Demande SDL2, SDL2_ttf, SDL2_mixer, OpenGL, GLU et les en-têtes imgui et SimpleIni (paquets Debian ou Ubuntu).
# SDL_mixer_ext n'existe pas en paquet : un en-tête de substitution inclut SDL_mixer (vérification seulement).
# Usage : tools/mission_ref/build.sh <dossier libRealSpace> [dossier de sortie]
set -e
LIBRS="$1/src"
OUT="${2:-/tmp/mission_ref_build}"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$OUT/shim/SDL2"
echo '#include <SDL2/SDL_mixer.h>' > "$OUT/shim/SDL2/SDL_mixer_ext.h"
INC="-I$LIBRS -I$LIBRS/strike_commander -I$LIBRS/realspace -I$LIBRS/engine -I$LIBRS/commons -I$LIBRS/commons/Nuked-OPL3"
INC="$INC -I/usr/include/SDL2 -I/usr/include/imgui -I/usr/include/imgui/backends -I$OUT/shim"
FLAGS="-std=c++17 -O0 -w -DSI_NO_CONVERSION $INC"
# Vérification de compilation de tout le jeu (sans édition de liens).
for f in "$LIBRS"/strike_commander/*.cpp "$LIBRS"/executables/debugger/DebugStrike.cpp; do
    g++ $FLAGS -fsyntax-only "$f"
done
# Objets de realspace, commons et engine pour l'essai.
for f in "$LIBRS"/realspace/*.cpp "$LIBRS"/commons/*.cpp "$LIBRS"/engine/*.cpp; do
    g++ $FLAGS -c "$f" -o "$OUT/$(basename "$(dirname "$f")")_$(basename "$f" .cpp).o"
done
for f in "$LIBRS"/commons/pklib/*.c "$LIBRS"/commons/Nuked-OPL3/*.c; do
    gcc -w $INC -c "$f" -o "$OUT/c_$(basename "$f" .c).o"
done
# Symboles de l'interface (SimpleIni, imgui, SCState) non résolus : l'essai n'appelle que RSMission.
g++ $FLAGS "$HERE/mission_areas_test.cpp" "$OUT"/*.o -lGL -lGLU -lSDL2 -lSDL2_ttf -lSDL2_mixer \
    -Wl,--unresolved-symbols=ignore-all -o "$OUT/mission_areas_test"
g++ $FLAGS "$HERE/mission_part_test.cpp" "$OUT"/*.o -lGL -lGLU -lSDL2 -lSDL2_ttf -lSDL2_mixer \
    -Wl,--unresolved-symbols=ignore-all -o "$OUT/mission_part_test"
g++ $FLAGS "$HERE/mission_load_test.cpp" "$OUT"/*.o -lGL -lGLU -lSDL2 -lSDL2_ttf -lSDL2_mixer \
    -Wl,--unresolved-symbols=ignore-all -o "$OUT/mission_load_test"
# Placement dans le repère du joueur : SCMission::placeRelativeToPlayer, avec les objets de SCMission, SCMissionActors et SCPlane.
mkdir -p "$OUT/rel"
for f in SCMission SCMissionActors SCPlane; do
    g++ $FLAGS -c "$LIBRS/strike_commander/$f.cpp" -o "$OUT/rel/$f.o"
done
g++ $FLAGS "$HERE/mission_relative_test.cpp" "$OUT"/rel/*.o "$OUT"/*.o -lGL -lGLU -lSDL2 -lSDL2_ttf \
    -lSDL2_mixer -Wl,--unresolved-symbols=ignore-all -o "$OUT/mission_relative_test"
echo "$OUT/mission_areas_test"
echo "$OUT/mission_part_test"
echo "$OUT/mission_relative_test"
echo "$OUT/mission_load_test"
