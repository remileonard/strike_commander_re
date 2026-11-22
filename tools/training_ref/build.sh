#!/bin/sh
# Mission d'entraînement dans libRealSpace : vérifie la compilation de tout le jeu avec les fichiers modifiés de
# tools/training_ref/librealspace/src copiés par-dessus une copie de libRealSpace, puis compile et lance l'essai.
# Demande SDL2, SDL2_ttf, SDL2_mixer, OpenGL, GLU et les en-têtes imgui et SimpleIni (paquets Debian ou Ubuntu).
# Usage : tools/training_ref/build.sh <dossier libRealSpace> <DATA du jeu> [dossier de travail]
#   <dossier libRealSpace> n'est pas modifié : il est recopié dans le dossier de travail.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$HERE/../.." && pwd)"
DATA="$2"
OUT="${3:-/tmp/training_ref_build}"
rm -rf "$OUT/librealspace"
mkdir -p "$OUT/shim/SDL2" "$OUT/obj" "$OUT/cas"
cp -r "$1/src" "$OUT/librealspace"
cp -r "$HERE/librealspace/src/." "$OUT/librealspace/"
LIBRS="$OUT/librealspace"
echo '#include <SDL2/SDL_mixer.h>' > "$OUT/shim/SDL2/SDL_mixer_ext.h"
INC="-I$LIBRS -I$LIBRS/strike_commander -I$LIBRS/realspace -I$LIBRS/engine -I$LIBRS/commons -I$LIBRS/commons/Nuked-OPL3"
INC="$INC -I/usr/include/SDL2 -I/usr/include/imgui -I/usr/include/imgui/backends -I$OUT/shim"
FLAGS="-std=c++17 -O0 -w -DSI_NO_CONVERSION $INC"
# Compilation de tout le jeu (sans édition de liens), dont la version « enhanced » qui dérive de SCTrainingMenu.
for f in "$LIBRS"/strike_commander/*.cpp "$LIBRS"/enhanced/*.cpp "$LIBRS"/executables/debugger/DebugStrike.cpp; do
    g++ $FLAGS -fsyntax-only "$f"
done
# Objets de realspace, commons et engine pour l'essai.
for f in "$LIBRS"/realspace/*.cpp "$LIBRS"/commons/*.cpp "$LIBRS"/engine/*.cpp; do
    g++ $FLAGS -c "$f" -o "$OUT/obj/$(basename "$(dirname "$f")")_$(basename "$f" .cpp).o"
done
for f in "$LIBRS"/commons/pklib/*.c "$LIBRS"/commons/Nuked-OPL3/*.c; do
    gcc -w $INC -c "$f" -o "$OUT/obj/c_$(basename "$f" .c).o"
done
g++ $FLAGS "$HERE/training_mission_test.cpp" "$OUT"/obj/*.o -lGL -lGLU -lSDL2 -lSDL2_ttf -lSDL2_mixer \
    -Wl,--unresolved-symbols=ignore-all -o "$OUT/training_mission_test"
# Cas d'essai : INSTANT.IFF écrits par tools/instant_mission.py (même construction que le jeu).
CASES="$OUT/cas/cas.txt"
: > "$CASES"
make_case() {
    name="$1"
    shift
    python3 "$ROOT/tools/instant_mission.py" --donnees "$DATA" --sortie "$OUT/cas/$name.IFF" "$@" > /dev/null
}
make_case search search
echo "$OUT/cas/search.IFF 2 5000 0 0 0 0 0 0 0" >> "$CASES"
make_case dog1 dogfight --groupe 1 f-15 --altitude 5000 --niveau rookie
echo "$OUT/cas/dog1.IFF 1 5000 0 1 0 0 0 0 0" >> "$CASES"
make_case dog2 dogfight --groupe 2 mig-29 --groupe 1 tu-95 --altitude 15000 --niveau ace
echo "$OUT/cas/dog2.IFF 1 15000 2 2 13 1 15 0 0" >> "$CASES"
make_case dog3 dogfight --groupe 5 su-27 --groupe 5 c-130 --groupe 5 a-10 --altitude 35000 --niveau veteran
echo "$OUT/cas/dog3.IFF 1 35000 1 5 14 5 3 5 6" >> "$CASES"
make_case dog4 dogfight --groupe 3 747 --groupe 4 yf-23 --altitude 25000 --niveau ace
echo "$OUT/cas/dog4.IFF 1 25000 2 3 11 4 5 0 0" >> "$CASES"
"$OUT/training_mission_test" "$DATA/MISSIONS/TEMPLATE.IFF" "$CASES"
