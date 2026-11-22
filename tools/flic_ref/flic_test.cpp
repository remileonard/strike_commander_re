// Essai de RSFlic (tools/flic_ref/librealspace/src/realspace) sur DATA\FLIC\THEFLIC.FLX : décode toutes les images et
// écrit une empreinte FNV-1a de chacune (indices de couleur de l'écran 320 × 200), comparable à
// tools/flx_render.py --empreintes. Option --ppm <dossier> <n> : écrit l'image n en PPM.
// Usage : flic_test <THEFLIC.FLX> [--ppm <dossier> <n>]
#include <cstdio>
#include <cstdlib>
#include <string>
#include <vector>

#include "RSFlic.h"

static std::vector<uint8_t> readFile(const char *path) {
    std::vector<uint8_t> data;
    FILE *f = fopen(path, "rb");
    if (f == nullptr) {
        return data;
    }
    fseek(f, 0, SEEK_END);
    data.resize(static_cast<size_t>(ftell(f)));
    fseek(f, 0, SEEK_SET);
    size_t read = fread(data.data(), 1, data.size(), f);
    data.resize(read);
    fclose(f);
    return data;
}

static uint32_t fnv(const uint8_t *p, size_t n) {
    uint32_t h = 2166136261u;
    for (size_t i = 0; i < n; i++) {
        h ^= p[i];
        h *= 16777619u;
    }
    return h;
}

static void writePpm(const std::string &path, RSFlic &flic) {
    FILE *f = fopen(path.c_str(), "wb");
    if (f == nullptr) {
        return;
    }
    fprintf(f, "P6\n320 200\n255\n");
    for (int i = 0; i < RSFlic::WIDTH * RSFlic::HEIGHT; i++) {
        const Texel &c = flic.palette.colors[flic.screen[i]];
        fputc(c.r, f);
        fputc(c.g, f);
        fputc(c.b, f);
    }
    fclose(f);
}

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("usage : flic_test <THEFLIC.FLX> [--ppm <dossier> <n>]\n");
        return 1;
    }
    std::vector<uint8_t> data = readFile(argv[1]);
    RSFlic flic;
    if (!flic.InitFromRAM(data.data(), data.size())) {
        printf("fichier illisible\n");
        return 1;
    }
    std::string ppmDir;
    int ppmFrame = -1;
    if (argc >= 5 && std::string(argv[2]) == "--ppm") {
        ppmDir = argv[3];
        ppmFrame = atoi(argv[4]);
    }
    int palettes = 0;
    while (flic.DecodeNextFrame()) {
        if (flic.paletteChanged) {
            palettes++;
        }
        printf("%d %08x\n", flic.frameCount, fnv(flic.screen, sizeof(flic.screen)));
        if (flic.frameCount == ppmFrame) {
            writePpm(ppmDir + "/flic_" + std::to_string(ppmFrame) + ".ppm", flic);
        }
    }
    fprintf(stderr, "%zu enregistrements, %d images, %d palettes\n", flic.GetNumRecords(), flic.frameCount, palettes);
    return 0;
}
