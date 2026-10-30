// Essai de la lecture des zones et des scènes par RSMission de libRealSpace (version modifiée,
// patch tools/mission_ref/librealspace_zones_scenes.patch) sur les fichiers de mission du jeu.
// Usage : mission_areas_test MISSIONS/*.IFF
#include <cstdio>
#include <cstring>
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

int main(int argc, char **argv) {
    int missions = 0;
    int areas = 0;
    int inside = 0;
    int shapes[3] = {
        0,
        0,
        0
    };
    for (int a = 1; a < argc; a++) {
        std::vector<uint8_t> file = readFile(argv[a]);
        RSMission mission;
        mission.InitFromRAM(file.data(), file.size());
        missions++;
        for (auto area : mission.mission_data.areas) {
            areas++;
            if (area->AreaType == 'S') {
                shapes[0]++;
            } else if (area->AreaType == 'C') {
                shapes[1]++;
            } else if (area->AreaType == 'B') {
                shapes[2]++;
            }
            Vector3D probe = area->position;
            probe.y += 1.0f;
            if (area->contains(probe)) {
                inside++;
            }
        }
        const char *base = strrchr(argv[a], '/');
        base = base ? base + 1 : argv[a];
        if (strcmp(base, "MISN-1A.IFF") != 0) {
            continue;
        }
        printf("%s : %zu zones, %zu scènes\n", base, mission.mission_data.areas.size(),
               mission.mission_data.scenes.size());
        for (auto z : mission.mission_data.areas) {
            printf("  zone %d %c %-24s x %.0f y %.0f z %.0f  rayon %.0f hauteur %.0f  E %.0f O %.0f N %.0f S %.0f"
                   "  (AreaWidth %u, AreaHeight %u)\n",
                   z->id, z->AreaType, z->AreaName, z->position.x, z->position.y, z->position.z, z->radius, z->height,
                   z->east, z->west, z->north, z->south, z->AreaWidth, z->AreaHeight);
        }
        int i = 0;
        for (auto s : mission.mission_data.scenes) {
            printf("  scène %d : zone %d, activation %d, à chaque image %d, sortie %d\n", i, s->area_id,
                   s->on_is_activated, s->on_mission_update, s->on_leaving);
            i++;
        }
        // Zone 1, boîte « .RESTRICTED AIRSPACE » : 50 000 m vers l'est et vers le sud depuis sa référence.
        AREA *box = mission.mission_data.areas[1];
        Vector3D p = box->position;
        p.y += 3000.0f;
        Vector3D east = p;
        east.x += 40000.0f;
        Vector3D west = p;
        west.x -= 10000.0f;
        Vector3D south = p;
        south.z += 40000.0f;
        Vector3D north = p;
        north.z -= 10000.0f;
        printf("  boîte : 40 km à l'est %d, 10 km à l'ouest %d, 40 km au sud %d, 10 km au nord %d\n",
               box->contains(east), box->contains(west), box->contains(south), box->contains(north));
    }
    printf("%d fichiers, %d zones (%d sphères, %d cylindres, %d boîtes), %d contiennent le point 1 m au-dessus de leur "
           "référence\n",
           missions, areas, shapes[0], shapes[1], shapes[2], inside);
    return 0;
}
