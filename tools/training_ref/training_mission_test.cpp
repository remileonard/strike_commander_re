// Essai de RSMission::addTraining (fichiers modifiés de tools/training_ref/librealspace/src) : pour chaque cas, la
// mission construite en mémoire (TEMPLATE.IFF lu par RSMission, puis addTraining) est comparée, champ par champ, à la
// lecture par RSMission du INSTANT.IFF que tools/instant_mission.py écrit comme Training_BuildInstantMission_58EEA.
// Usage : training_mission_test <TEMPLATE.IFF> <cas.txt>
// Une ligne de cas.txt : fichier type altitude niveau n0 avion0 n1 avion1 n2 avion2 (avions de 0 à 15).
#include <cmath>
#include <cstdio>
#include <cstring>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

#include "RSMission.h"

static std::vector<uint8_t> readFile(const std::string &path) {
    std::vector<uint8_t> data;
    FILE *f = fopen(path.c_str(), "rb");
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

static int errors = 0;

static void check(bool ok, const std::string &what) {
    if (!ok) {
        errors++;
        printf("  écart : %s\n", what.c_str());
    }
}

// ByteStream::ReadFixedFloatLE divise la partie fractionnaire d'un 24.8 par 255, au lieu de 256 : une position lue dans
// un fichier peut s'écarter de 255 / 65280 m (3,9 mm) au plus de la valeur exacte que calcule addTraining.
static bool same(float a, float b) {
    return std::fabs(a - b) < 0.004f;
}

static void comparePositions(const Vector3D &a, const Vector3D &b, const std::string &what) {
    check(same(a.x, b.x) && same(a.y, b.y) && same(a.z, b.z), what);
}

static void compare(MISN &built, MISN &read, const std::string &name) {
    check(built.areas.size() == read.areas.size(), name + " : nombre de zones");
    for (size_t i = 0; i < built.areas.size() && i < read.areas.size(); i++) {
        AREA *a = built.areas[i];
        AREA *b = read.areas[i];
        std::string z = name + " zone " + std::to_string(i);
        check(a->id == b->id && a->AreaType == b->AreaType, z + " : id, forme");
        check(strncmp(a->AreaName, b->AreaName, 32) == 0, z + " : nom");
        comparePositions(a->position, b->position, z + " : position");
        check(same(a->radius, b->radius), z + " : rayon");
        check(a->AreaWidth == b->AreaWidth && a->AreaHeight == b->AreaHeight, z + " : AreaWidth, AreaHeight");
    }
    check(built.flags == read.flags, name + " : FLAG");
    check(built.casting.size() == read.casting.size(), name + " : nombre de CAST");
    for (size_t i = 0; i < built.casting.size() && i < read.casting.size(); i++) {
        check(built.casting[i]->actor == read.casting[i]->actor, name + " : CAST " + std::to_string(i));
    }
    check(built.parts.size() == read.parts.size(), name + " : nombre de PART");
    for (size_t i = 0; i < built.parts.size() && i < read.parts.size(); i++) {
        MISN_PART *a = built.parts[i];
        MISN_PART *b = read.parts[i];
        std::string p = name + " PART " + std::to_string(i);
        check(a->id == b->id, p + " : id");
        check(a->member_name == b->member_name, p + " : type " + a->member_name + " / " + b->member_name);
        check(a->member_name_destroyed == b->member_name_destroyed, p + " : type détruit");
        check(a->weapon_load == b->weapon_load, p + " : emport");
        check(a->area_id == b->area_id && a->placement == b->placement, p + " : zone, placement");
        comparePositions(a->position, b->position, p + " : position");
        comparePositions(a->relative_position, b->relative_position, p + " : position relative");
        check(a->azymuth == b->azymuth && a->relative_azymuth == b->relative_azymuth, p + " : cap");
        check(a->speed == b->speed && a->team == b->team, p + " : vitesse, camp");
        check(a->follow_ally == b->follow_ally && a->unknown_byte_47 == b->unknown_byte_47, p + " : octets 46, 47");
        check(a->formation_side == b->formation_side && a->formation_ahead == b->formation_ahead &&
                  a->formation_up == b->formation_up,
              p + " : formation");
        check(a->progs_id == b->progs_id, p + " : scripts");
        check(a->on_is_activated == b->on_is_activated && a->on_mission_update == b->on_mission_update &&
                  a->on_is_destroyed == b->on_is_destroyed && a->on_missions_init == b->on_missions_init,
              p + " : scripts nommés");
    }
    check(built.scenes.size() == read.scenes.size(), name + " : nombre de SCNE");
    for (size_t i = 0; i < built.scenes.size() && i < read.scenes.size(); i++) {
        MISN_SCEN *a = built.scenes[i];
        MISN_SCEN *b = read.scenes[i];
        std::string s = name + " SCNE " + std::to_string(i);
        check(a->is_active == b->is_active && a->area_id == b->area_id, s + " : active, zone");
        check(a->progs_id == b->progs_id, s + " : scripts");
        check(a->on_is_activated == b->on_is_activated && a->on_mission_update == b->on_mission_update &&
                  a->on_leaving == b->on_leaving,
              s + " : scripts nommés");
        check(a->has_arrival_point == b->has_arrival_point && a->arrival_heading == b->arrival_heading, s + " : arrivée");
        comparePositions(a->arrival_position, b->arrival_position, s + " : point d'arrivée");
        check(a->cast == b->cast, s + " : objets");
    }
    check(built.prog.size() == read.prog.size(), name + " : nombre de PROG");
    check(built.team == read.team, name + " : TEAM");
    check(built.load.size() == read.load.size(), name + " : LOAD");
    check(built.spots.size() == read.spots.size(), name + " : SPOT");
    check(built.world_filename == read.world_filename, name + " : monde");
}

int main(int argc, char **argv) {
    if (argc < 3) {
        printf("Usage : training_mission_test <TEMPLATE.IFF> <cas.txt>\n");
        return 1;
    }
    std::vector<uint8_t> templ = readFile(argv[1]);
    std::ifstream cases(argv[2]);
    std::string row;
    int count = 0;
    while (std::getline(cases, row)) {
        if (row.empty()) {
            continue;
        }
        std::istringstream fields(row);
        std::string file;
        int type = 0;
        int feet = 0;
        int level = 0;
        fields >> file >> type >> feet >> level;
        MISN_TRAINING training;
        training.type = (uint8_t)type;
        training.altitude_feet = feet;
        training.pilot_level = (uint8_t)level;
        for (int g = 0; g < 3; g++) {
            int n = 0;
            int plane = 0;
            fields >> n >> plane;
            training.group_count[g] = (uint8_t)n;
            training.group_plane[g] = (uint8_t)plane;
        }
        std::vector<uint8_t> templCopy = templ;
        RSMission built;
        built.InitFromRAM(templCopy.data(), templCopy.size());
        built.addTraining(training);
        std::vector<uint8_t> instant = readFile(file);
        RSMission read;
        read.InitFromRAM(instant.data(), instant.size());
        int before = errors;
        compare(built.mission_data, read.mission_data, file);
        printf("%s : %s (%zu objets PART, %zu zones, %zu scènes)\n", file.c_str(), errors == before ? "identique" : "ÉCARTS",
               built.mission_data.parts.size(), built.mission_data.areas.size(), built.mission_data.scenes.size());
        count++;
    }
    printf("%d cas, %d écarts\n", count, errors);
    return errors == 0 ? 0 : 1;
}
