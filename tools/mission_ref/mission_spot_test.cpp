// Essai de la lecture du chunk SPOT par RSMission::parseMISN_SPOT (version modifiée, fichiers de
// tools/mission_ref/librealspace/src) : chaque point est comparé aux octets du fichier, et à l'ancienne lecture
// (entiers de mètres, ReadInt24LE décalé d'un octet).
// Usage : mission_spot_test MISSIONS/*.IFF
#include <cmath>
#include <cstdio>
#include <cstring>
#include <vector>

#include "RSMission.h"
#include "block_def.h"

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

static uint32_t readBE32(const uint8_t *p) {
    return (static_cast<uint32_t>(p[0]) << 24) | (static_cast<uint32_t>(p[1]) << 16) | (static_cast<uint32_t>(p[2]) << 8) | p[3];
}

static int32_t readLE32(const uint8_t *p) {
    return static_cast<int32_t>(static_cast<uint32_t>(p[0]) | (static_cast<uint32_t>(p[1]) << 8) | (static_cast<uint32_t>(p[2]) << 16) |
                                (static_cast<uint32_t>(p[3]) << 24));
}

// Adresse et taille du premier chunk SPOT du fichier ; taille 0 s'il n'y en a pas.
static void findSpot(const std::vector<uint8_t> &d, size_t start, size_t end, size_t &offset, size_t &size) {
    size_t o = start;
    while (o + 8 <= end) {
        size_t n = readBE32(&d[o + 4]);
        if (memcmp(&d[o], "FORM", 4) == 0) {
            findSpot(d, o + 12, o + 8 + n, offset, size);
        } else if (memcmp(&d[o], "SPOT", 4) == 0 && size == 0) {
            offset = o + 8;
            size = n;
        }
        o += 8 + n + (n & 1);
    }
}

int main(int argc, char **argv) {
    int spots = 0;
    int errors = 0;
    int oldMismatch = 0;
    int withoutArea = 0;
    for (int a = 1; a < argc; a++) {
        std::vector<uint8_t> file = readFile(argv[a]);
        RSMission mission;
        mission.InitFromRAM(file.data(), file.size());
        size_t offset = 0;
        size_t size = 0;
        findSpot(file, 12, file.size(), offset, size);
        size_t count = size / 14;
        if (count != mission.mission_data.spots.size()) {
            printf("%s : %zu points, %zu lus\n", argv[a], count, mission.mission_data.spots.size());
            errors++;
            continue;
        }
        for (size_t i = 0; i < count; i++) {
            const uint8_t *r = &file[offset + 14 * i];
            SPOT *spot = mission.mission_data.spots[i];
            spots++;
            short area = static_cast<short>(r[0] | (r[1] << 8));
            float c0 = static_cast<float>(readLE32(&r[2]) / 256.0);
            float c1 = static_cast<float>(readLE32(&r[6]) / 256.0);
            float c2 = static_cast<float>(readLE32(&r[10]) / 256.0);
            bool ok = spot->area_id == area;
            ok = ok && spot->position.x == c0 * BLOCK_COORD_SCALE;
            ok = ok && spot->position.y == c2 * HEIGH_MAP_SCALE;
            ok = ok && spot->position.z == -c1 * BLOCK_COORD_SCALE;
            if (!ok) {
                printf("%s SPOT %zu : champ différent\n", argv[a], i);
                errors++;
            }
            if (area < 0 || static_cast<size_t>(area) >= mission.mission_data.areas.size()) {
                withoutArea++;
            }
            if (area >= 0 && static_cast<size_t>(area) >= mission.mission_data.areas.size()) {
                printf("%s SPOT %zu : zone %d hors de la liste (%zu zones)\n", argv[a], i, area, mission.mission_data.areas.size());
            }
            // Ancienne lecture : x = octets 3-5, z = octets 7-9 (entiers de mètres), y = octets 11-12.
            int32_t oldX = static_cast<int32_t>(static_cast<uint32_t>(r[3] | (r[4] << 8) | (r[5] << 16)) << 8) >> 8;
            int32_t oldZ = static_cast<int32_t>(static_cast<uint32_t>(r[7] | (r[8] << 8) | (r[9] << 16)) << 8) >> 8;
            int16_t oldY = static_cast<int16_t>(r[11] | (r[12] << 8));
            if (std::fabs(c0 - oldX) >= 1.0f || std::fabs(c1 - oldZ) >= 1.0f || (std::fabs(c2) < 32767.0f && std::fabs(c2 - oldY) >= 1.0f)) {
                printf("%s SPOT %zu : %.2f %.2f %.2f, ancienne lecture %d %d %d\n", argv[a], i, c0, c1, c2, oldX, oldZ, oldY);
                oldMismatch++;
            }
        }
    }
    printf("%d points SPOT, %d erreurs ; %d écarts d'au moins 1 m avec l'ancienne lecture ; %d sans zone\n", spots, errors, oldMismatch,
           withoutArea);
    return errors == 0 ? 0 : 1;
}
