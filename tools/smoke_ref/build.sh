#!/bin/sh
# Compile le code de référence des fumées contre les sources de libRealSpace et l'essai sur les données.
# Usage : tools/smoke_ref/build.sh <dossier libRealSpace> [dossier de sortie]
set -e
LIBRS="$1/src"
OUT="${2:-/tmp/smoke_ref_build}"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$OUT"
FLAGS="-std=c++17 -O1 -Wall -Wextra -I$LIBRS/realspace -I$LIBRS/commons"
for f in commons/ByteStream commons/IFFSaxLexer commons/LZBuffer commons/md5 commons/Math commons/Matrix commons/PKWareDecompressor \
         realspace/Base realspace/PakArchive realspace/RLEShape; do
    g++ -std=c++17 -O1 -w -c "$LIBRS/$f.cpp" -o "$OUT/$(basename $f).o"
done
for f in RSSmokeSet SCSmokeParticles smoke_alpha; do
    g++ $FLAGS -c "$HERE/$f.cpp" -o "$OUT/$f.o"
done
for f in explode crc32; do
    gcc -O1 -w -c "$LIBRS/commons/pklib/$f.c" -o "$OUT/$f.o"
done
# Partie OpenGL : compilée seule (l'essai ne crée pas de contexte).
g++ $FLAGS -c "$HERE/SCSmokeRenderer.cpp" -o "$OUT/SCSmokeRenderer.o"
g++ $FLAGS "$HERE/smoke_test.cpp" "$OUT"/ByteStream.o "$OUT"/IFFSaxLexer.o "$OUT"/LZBuffer.o "$OUT"/md5.o \
    "$OUT"/Math.o "$OUT"/Matrix.o "$OUT"/PKWareDecompressor.o "$OUT"/Base.o "$OUT"/PakArchive.o "$OUT"/RLEShape.o "$OUT"/explode.o "$OUT"/crc32.o \
    "$OUT"/RSSmokeSet.o "$OUT"/SCSmokeParticles.o "$OUT"/smoke_alpha.o "$OUT"/SCSmokeRenderer.o -lGL -o "$OUT/smoke_test"
echo "$OUT/smoke_test"
# Essai du dessin, hors écran : demande OSMesa (paquet libosmesa6-dev sous Debian ou Ubuntu).
if [ -f /usr/include/GL/osmesa.h ]; then
    g++ $FLAGS "$HERE/smoke_render_test.cpp" "$OUT"/ByteStream.o "$OUT"/IFFSaxLexer.o "$OUT"/LZBuffer.o "$OUT"/md5.o \
        "$OUT"/Math.o "$OUT"/Matrix.o "$OUT"/PKWareDecompressor.o "$OUT"/Base.o "$OUT"/PakArchive.o "$OUT"/RLEShape.o "$OUT"/explode.o \
        "$OUT"/crc32.o "$OUT"/RSSmokeSet.o "$OUT"/SCSmokeParticles.o "$OUT"/smoke_alpha.o "$OUT"/SCSmokeRenderer.o \
        -lOSMesa -lGL -o "$OUT/smoke_render_test"
    echo "$OUT/smoke_render_test"
fi
