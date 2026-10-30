// Essai de la lecture des enregistrements PART par RSMission::parseMISN_PART (version modifiée, fichiers de
// tools/mission_ref/librealspace/src) : chaque champ nommé est comparé aux octets du fichier, et la position à
// l'ancienne lecture (entiers de mètres, ReadInt24LE décalé d'un octet).
// Usage : mission_part_test MISSIONS/*.IFF
#include <cmath>
#include <cstdio>
#include <cstring>
#include <map>
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

static int16_t readLE16(const uint8_t *p) {
    return static_cast<int16_t>(p[0] | (p[1] << 8));
}

static int32_t readLE32(const uint8_t *p) {
    return static_cast<int32_t>(static_cast<uint32_t>(p[0]) | (static_cast<uint32_t>(p[1]) << 8) | (static_cast<uint32_t>(p[2]) << 16) |
                                (static_cast<uint32_t>(p[3]) << 24));
}

// Adresses des chunks PART du fichier, dans l'ordre.
static void findParts(const std::vector<uint8_t> &d, size_t start, size_t end, std::vector<std::pair<size_t, size_t>> &out) {
    size_t o = start;
    while (o + 8 <= end) {
        size_t n = readBE32(&d[o + 4]);
        if (memcmp(&d[o], "FORM", 4) == 0) {
            findParts(d, o + 12, o + 8 + n, out);
        } else if (memcmp(&d[o], "PART", 4) == 0) {
            out.push_back(std::make_pair(o + 8, n));
        }
        o += 8 + n + (n & 1);
    }
}

int main(int argc, char **argv) {
    int records = 0;
    int errors = 0;
    int oldMismatch = 0;
    std::map<int, int> placements;
    std::map<int, int> teams;
    int atRest = 0;
    int followers = 0;
    for (int a = 1; a < argc; a++) {
        std::vector<uint8_t> file = readFile(argv[a]);
        RSMission mission;
        mission.InitFromRAM(file.data(), file.size());
        std::vector<std::pair<size_t, size_t>> chunks;
        findParts(file, 12, file.size(), chunks);
        if (chunks.size() != 1) {
            printf("%s : %zu chunks PART\n", argv[a], chunks.size());
            continue;
        }
        size_t count = chunks[0].second / 62;
        if (count != mission.mission_data.parts.size()) {
            printf("%s : %zu enregistrements, %zu lus\n", argv[a], count, mission.mission_data.parts.size());
            errors++;
            continue;
        }
        for (size_t i = 0; i < count; i++) {
            const uint8_t *r = &file[chunks[0].first + 62 * i];
            MISN_PART *p = mission.mission_data.parts[i];
            records++;
            uint16_t area = static_cast<uint16_t>(r[26] | (r[27] << 8));
            bool ok = true;
            ok = ok && p->area_id == (area >= 255 ? 255 : area);
            ok = ok && p->placement == (r[28] != 0 ? 1 : 0);
            ok = ok && p->speed == readLE16(&r[43]);
            ok = ok && p->team == r[45];
            ok = ok && p->follow_ally == r[46];
            ok = ok && p->formation_side == readLE16(&r[48]);
            ok = ok && p->formation_ahead == readLE16(&r[50]);
            ok = ok && p->formation_up == readLE16(&r[52]);
            ok = ok && p->unknown_bytes.size() == 11 && memcmp(p->unknown_bytes.data(), &r[43], 11) == 0;
            ok = ok && p->on_is_activated == r[54] && p->on_missions_init == r[60];
            // Position : libRealSpace x = c0, y = c2, z = -c1, en mètres (÷ 256).
            float c0 = static_cast<float>(readLE32(&r[29]) / 256.0);
            float c1 = static_cast<float>(readLE32(&r[33]) / 256.0);
            float c2 = static_cast<float>(readLE32(&r[37]) / 256.0);
            ok = ok && p->position.x == c0 * BLOCK_COORD_SCALE && p->position.y == c2 * HEIGH_MAP_SCALE && p->position.z == -c1 * BLOCK_COORD_SCALE;
            if (!ok) {
                printf("%s PART %zu : champ différent\n", argv[a], i);
                errors++;
            }
            // Ancienne lecture : x = octets 30-32, z = octets 34-36 (entiers de mètres), y = octets 38-39.
            int32_t oldX = static_cast<int32_t>(static_cast<uint32_t>(r[30] | (r[31] << 8) | (r[32] << 16)) << 8) >> 8;
            int32_t oldZ = static_cast<int32_t>(static_cast<uint32_t>(r[34] | (r[35] << 8) | (r[36] << 16)) << 8) >> 8;
            int16_t oldY = readLE16(&r[38]);
            if (std::fabs(c0 - oldX) >= 1.0f || std::fabs(c1 - oldZ) >= 1.0f || (std::fabs(c2) < 32767.0f && std::fabs(c2 - oldY) >= 1.0f)) {
                printf("%s PART %zu : %.2f %.2f %.2f, ancienne lecture %d %d %d\n", argv[a], i, c0, c1, c2, oldX, oldZ, oldY);
                oldMismatch++;
            }
            placements[p->placement]++;
            teams[p->team]++;
            if (p->speed == 0) {
                atRest++;
            }
            if (p->follow_ally != 255) {
                followers++;
            }
        }
    }
    printf("%d enregistrements PART, %d erreurs\n", records, errors);
    printf("position : %d écarts d'au moins 1 m avec l'ancienne lecture\n", oldMismatch);
    for (auto &e : placements) {
        printf("placement %d : %d\n", e.first, e.second);
    }
    for (auto &e : teams) {
        printf("camp %d : %d\n", e.first, e.second);
    }
    printf("vitesse nulle : %d ; allié par défaut renseigné : %d\n", atRest, followers);
    return errors == 0 ? 0 : 1;
}
