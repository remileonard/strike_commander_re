// Essai de la lecture des chunks LOAD et CACH par RSMission::parseMISN_LOAD et parseMISN_CACH (version modifiée,
// fichiers de tools/mission_ref/librealspace/src) : chaque enregistrement lu est comparé aux octets du fichier.
// Usage : mission_load_test MISSIONS/*.IFF
#include <algorithm>
#include <cstdio>
#include <cstring>
#include <string>
#include <vector>

#include "RSMission.h"

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

// Adresse et taille du premier chunk de ce tag dans le fichier ; taille 0 s'il n'y en a pas.
static void findChunk(const std::vector<uint8_t> &d, size_t start, size_t end, const char *tag, size_t &offset, size_t &size) {
    size_t o = start;
    while (o + 8 <= end) {
        size_t n = readBE32(&d[o + 4]);
        if (memcmp(&d[o], "FORM", 4) == 0) {
            findChunk(d, o + 12, o + 8 + n, tag, offset, size);
        } else if (memcmp(&d[o], tag, 4) == 0 && size == 0) {
            offset = o + 8;
            size = n;
        }
        o += 8 + n + (n & 1);
    }
}

// Nom de 8 octets du fichier, sans les zéros, en majuscules.
static std::string fileName(const uint8_t *p) {
    std::string name;
    for (int k = 0; k < 8; k++) {
        if (p[k] != 0) {
            name += static_cast<char>(p[k]);
        }
    }
    std::transform(name.begin(), name.end(), name.begin(), ::toupper);
    return name;
}

int main(int argc, char **argv) {
    int loads = 0;
    int caches = 0;
    int errors = 0;
    for (int a = 1; a < argc; a++) {
        std::vector<uint8_t> file = readFile(argv[a]);
        RSMission mission;
        mission.InitFromRAM(file.data(), file.size());
        size_t offset = 0;
        size_t size = 0;
        findChunk(file, 12, file.size(), "LOAD", offset, size);
        if (mission.mission_data.load.size() != size / 9) {
            printf("%s : LOAD %zu enregistrements, %zu lus\n", argv[a], size / 9, mission.mission_data.load.size());
            errors++;
        } else {
            for (size_t i = 0; i < size / 9; i++) {
                const uint8_t *r = &file[offset + 9 * i];
                MISN_LOAD *load = mission.mission_data.load[i];
                if (load->name != fileName(r) || load->flag != r[8]) {
                    printf("%s : LOAD %zu différent\n", argv[a], i);
                    errors++;
                }
                loads++;
            }
        }
        offset = 0;
        size = 0;
        findChunk(file, 12, file.size(), "CACH", offset, size);
        if (mission.mission_data.cache.size() != size / 10) {
            printf("%s : CACH %zu enregistrements, %zu lus\n", argv[a], size / 10, mission.mission_data.cache.size());
            errors++;
        } else {
            for (size_t i = 0; i < size / 10; i++) {
                const uint8_t *r = &file[offset + 10 * i];
                MISN_CACH *cache = mission.mission_data.cache[i];
                if (cache->name != fileName(r) || cache->count != (r[8] | (r[9] << 8))) {
                    printf("%s : CACH %zu différent\n", argv[a], i);
                    errors++;
                }
                caches++;
            }
        }
    }
    printf("%d enregistrements LOAD, %d enregistrements CACH, %d erreurs\n", loads, caches, errors);
    return errors == 0 ? 0 : 1;
}
