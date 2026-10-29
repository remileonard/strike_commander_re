// Essai du code de référence des fumées sur les données du jeu (sans OpenGL).
// Usage : smoke_test SMOKESET.IFF PALETTE.IFF PALFADE.IFF [objet avion .IFF] [SMOKEGEN.IFF]
#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <vector>

#include "RLEShape.h"
#include "RSSmokeSet.h"
#include "SCSmokeEmitter.h"
#include "SCSmokeSet.h"
#include "smoke_alpha.h"

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

// Palette du chunk PALT de PALETTE.IFF : 4 octets, puis 256 × 3 valeurs de 0 à 63 (convertFrom6To8 de libRealSpace
// donne v × 255 / 63 à l'arrondi près).
static VGAPalette readPalette(const std::vector<uint8_t> &iff) {
    VGAPalette palette;
    for (size_t i = 12; i + 8 + 4 + 768 <= iff.size(); i++) {
        if (memcmp(&iff[i], "PALT", 4) == 0) {
            for (int c = 0; c < 256; c++) {
                Texel t;
                t.r = static_cast<uint8_t>(iff[i + 12 + 3 * c] * 255 / 63);
                t.g = static_cast<uint8_t>(iff[i + 12 + 3 * c + 1] * 255 / 63);
                t.b = static_cast<uint8_t>(iff[i + 12 + 3 * c + 2] * 255 / 63);
                t.a = 255;
                palette.SetColor(static_cast<uint8_t>(c), t);
            }
            break;
        }
    }
    return palette;
}

static void alphaSelfTest() {
    // Palette en dégradé de gris, table qui mène chaque couleur à mi-chemin du blanc.
    uint8_t palette[768];
    for (int c = 0; c < 256; c++) {
        palette[3 * c] = static_cast<uint8_t>(c);
        palette[3 * c + 1] = static_cast<uint8_t>(c);
        palette[3 * c + 2] = static_cast<uint8_t>(c);
    }
    uint8_t table[256];
    for (int c = 0; c < 256; c++) {
        table[c] = static_cast<uint8_t>((c + 255) / 2);
    }
    FadeBlend blend = fitFadeTable(palette, table);
    printf("essai alpha : %.3f cible %.0f (attendu 0,5 et 255)\n", blend.alpha, blend.r);
}

// Contenu d'un chunk IFF par son nom (taille grand-boutiste après le nom), pour l'essai seulement.
static bool findChunk(std::vector<uint8_t> &file, const char *name, uint8_t **data, size_t *size, size_t from = 0) {
    for (size_t i = from; i + 8 <= file.size(); i++) {
        if (memcmp(&file[i], name, 4) == 0) {
            size_t n = (static_cast<size_t>(file[i + 4]) << 24) | (static_cast<size_t>(file[i + 5]) << 16) |
                       (static_cast<size_t>(file[i + 6]) << 8) | file[i + 7];
            if (i + 8 + n <= file.size()) {
                *data = &file[i + 8];
                *size = n;
                return true;
            }
        }
    }
    return false;
}

static void simulate(const RSSmokeSet &set, SCSmokeSet &smokeSet, int model, const char *label) {
    SCSmokeEmitter smoke;
    smoke.init(&set, model, 5);
    const float dt = 1.0f / 15.0f;
    const float speed = 150.0f;
    // Avion en palier vers −Z (nord), traînée au point du chunk SMOK du F-16 : 14 m derrière le centre.
    Vector3D position = {
        0.0f,
        1000.0f,
        0.0f
    };
    Vector3D velocity = {
        0.0f,
        0.0f,
        -speed
    };
    printf("%s (modèle %d) :", label, model);
    for (int frame = 0; frame < 45; frame++) {
        position = position + velocity * dt;
        Vector3D emission = position + Vector3D(0.0f, 0.0f, 14.0f);
        smoke.emitTrail(emission, velocity, dt);
        smoke.update(dt);
        if (frame % 5 == 4) {
            printf(" %zu", smoke.getParticles().size());
        }
    }
    std::vector<SCSmokeSprite> sprites;
    smoke.sprites(smokeSet, position + Vector3D(70.0f, 0.0f, 0.0f), sprites);
    printf(" particules ; %zu sprites, du plus loin (%.0f m, côté %.1f m) au plus proche (%.0f m, côté %.1f m)\n",
           sprites.size(), sprites.front().distance, sprites.front().size, sprites.back().distance,
           sprites.back().size);
}

int main(int argc, char **argv) {
    alphaSelfTest();
    if (argc < 4) {
        printf("usage : %s SMOKESET.IFF PALETTE.IFF PALFADE.IFF [objet avion .IFF] [SMOKEGEN.IFF]\n", argv[0]);
        return 1;
    }
    std::vector<uint8_t> smokeFile = readFile(argv[1]);
    std::vector<uint8_t> paletteFile = readFile(argv[2]);
    std::vector<uint8_t> fadeFile = readFile(argv[3]);
    RSSmokeSet set;
    set.InitFromRam(smokeFile.data(), smokeFile.size());
    printf("INFO : %d modèles, %d formes, %d particules ; lus : %zu modèles, %zu formes\n", set.declaredModels,
           set.declaredShapes, set.maxParticles, set.models.size(), set.shapes.size());
    for (size_t i = 0; i < set.models.size(); i++) {
        const RSSmokeModel &m = set.models[i];
        printf("modèle %zu : rendu %d, espacement %.3f, taille %.3f à %.3f, vie %.3f, dispersion %.3f, teinte %.0f à "
               "%.0f, A %d, B %d, formes %d (%d %%) / %d, %c, %d images/s, pas %d\n",
               i, m.renderMode, m.spacing, m.sizeStart, m.sizeEnd, m.life, m.jitter, m.shadeStart, m.shadeEnd,
               m.translucentFirst, m.translucentCount, m.shapeA, m.chanceA, m.shapeB, m.animMode, m.framesPerSecond,
               m.frameStep);
    }
    for (size_t i = 0; i < set.shapes.size(); i++) {
        const RSSmokeShape &s = set.shapes[i];
        size_t present = 0;
        for (auto rle : s.images) {
            int w = rle->GetWidth();
            int h = rle->GetHeight();
            std::vector<uint8_t> buffer(static_cast<size_t>(w) * h, 255);
            Point2D origin = {
                0,
                0
            };
            rle->SetPosition(&origin);
            rle->buffer_size.x = w;
            rle->buffer_size.y = h;
            size_t read = 0;
            rle->Expand(buffer.data(), &read);
            for (uint8_t c : buffer) {
                if (c != 255) {
                    present++;
                }
            }
        }
        printf("forme %zu : %zu octets, %zu images, demi-taille %d, %zu pixels\n", i, s.data.size(), s.images.size(),
               s.halfSize, present);
    }
    SCSmokeSet smokeSet;
    smokeSet.smoke_set = &set;
    smokeSet.palette = readPalette(paletteFile);
    smokeSet.initFadeTextures(fadeFile.data(), fadeFile.size());
    const std::vector<FadeBlend> &blends = smokeSet.fade_blends;
    printf("%zu tables FADE\n", blends.size());
    int shown[4] = {
        0,
        16,
        31,
        42,
    };
    for (int t : shown) {
        if (t < static_cast<int>(blends.size())) {
            printf("table %d : alpha %.3f, cible %.0f %.0f %.0f\n", t, blends[t].alpha, blends[t].r, blends[t].g,
                   blends[t].b);
        }
    }
    printf("%zu textures précalculées\n", smokeSet.textureCount());
    simulate(set, smokeSet, 3, "traînée en vol");
    simulate(set, smokeSet, 6, "chute");
    simulate(set, smokeSet, 0, "missile");
    Vector3D local = {
        -14.0f,
        0.0f,
        0.0f
    };
    Vector3D origin = {
        0.0f,
        0.0f,
        0.0f
    };
    Vector3D orientation = {
        0.0f,
        0.0f,
        0.0f
    };
    Vector3D w = smokeEmissionPoint(origin, orientation, local);
    printf("point SMOK du F-16 (x = -14 en repère objet), sans rotation : %.1f %.1f %.1f\n", w.x, w.y, w.z);
    orientation.x = 3.14159265f / 2.0f;
    w = smokeEmissionPoint(origin, orientation, local);
    printf("même point, rotation de 90 degrés autour de Y : %.1f %.1f %.1f\n", w.x, w.y, w.z);
    if (argc > 4) {
        std::vector<uint8_t> object = readFile(argv[4]);
        uint8_t *chunk = nullptr;
        size_t size = 0;
        if (findChunk(object, "SMOK", &chunk, &size)) {
            RSObjectSmoke trail = readObjectSmoke(chunk, size);
            printf("chunk SMOK de l'objet : modèle %d, point x %.1f y %.1f z %.1f (repère des sommets VERT)\n", trail.type,
                   trail.x, trail.y, trail.z);
        }
        uint8_t fall = 6;
        if (findChunk(object, "JINF", &chunk, &size)) {
            fall = readJinfFallSmoke(chunk, size);
        }
        printf("fumée de chute (JINF) : modèle %d\n", fall);
    }
    if (argc > 5) {
        std::vector<uint8_t> generatorFile = readFile(argv[5]);
        uint8_t *chunk = nullptr;
        size_t size = 0;
        // Le chunk INFO du FORM SMKG (le fichier a d'autres chunks INFO avant et après).
        size_t form = 0;
        while (form + 4 <= generatorFile.size() && memcmp(&generatorFile[form], "SMKG", 4) != 0) {
            form++;
        }
        if (findChunk(generatorFile, "INFO", &chunk, &size, form)) {
            RSSmokeGeneratorInfo info = readSmokeGeneratorInfo(chunk, size);
            printf("SMKG : modèle %d, durée %.1f s, montée %.1f m/s, intervalle %.3f s, chance %d, suppression %d\n",
                   info.type, info.duration, info.rise, info.interval, info.chance, info.removeAtEnd);
            SCSmokeEmitter smoke;
            smoke.init(&set, info.type, 5);
            SCSmokeGenerator generator;
            generator.init(info, true);
            Vector3D ground = {
                0.0f,
                0.0f,
                0.0f
            };
            const float dt = 1.0f / 15.0f;
            float top = 0.0f;
            for (int frame = 0; frame < 150; frame++) {
                generator.tick(smoke, ground, dt);
                smoke.update(dt);
            }
            for (const auto &p : smoke.getParticles()) {
                top = (std::max)(top, p.position.y);
            }
            printf("SMKG après 10 s : %zu particules, la plus haute à %.0f m\n", smoke.getParticles().size(), top);
        }
    }
    return 0;
}
