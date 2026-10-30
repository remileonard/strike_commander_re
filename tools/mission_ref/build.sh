#!/bin/sh
# Compile le code de référence des zones et scènes de mission contre les sources de libRealSpace, et l'essai.
# Usage : tools/mission_ref/build.sh <dossier libRealSpace> [dossier de sortie]
set -e
LIBRS="$1/src"
OUT="${2:-/tmp/mission_ref_build}"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$OUT"
FLAGS="-std=c++17 -O1 -Wall -Wextra -I$LIBRS/realspace -I$LIBRS/commons"
for f in commons/ByteStream commons/IFFSaxLexer commons/Math commons/Matrix realspace/Base; do
    g++ -std=c++17 -O1 -w -c "$LIBRS/$f.cpp" -o "$OUT/$(basename $f).o"
done
for f in RSMissionAreas SCMissionScenes; do
    g++ $FLAGS -c "$HERE/$f.cpp" -o "$OUT/$f.o"
done
g++ $FLAGS "$HERE/mission_test.cpp" "$OUT"/ByteStream.o "$OUT"/IFFSaxLexer.o "$OUT"/Math.o "$OUT"/Matrix.o \
    "$OUT"/Base.o "$OUT"/RSMissionAreas.o "$OUT"/SCMissionScenes.o -o "$OUT/mission_test"
echo "$OUT/mission_test"
