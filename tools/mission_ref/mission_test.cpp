// Essai de la lecture des zones et des scènes sur les fichiers de mission du jeu.
// Usage : mission_test MISSIONS/MISN-1A.IFF [autres missions…]
#include <cstdio>
#include <cstring>
#include <functional>
#include <string>
#include <unordered_map>
#include <vector>

#include "../commons/IFFSaxLexer.h"
#include "RSMissionAreas.h"
#include "SCMissionScenes.h"

typedef std::unordered_map<std::string, std::function<void(uint8_t *data, size_t size)>> IFFHandlers;

struct LoadedMission {
    uint16_t version{ 0 };
    std::vector<AREA *> areas;
    std::vector<MISN_SCEN *> scenes;
};

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

// Même découpage que RSMission::InitFromRam : FORM MISN, chunks VERS et AREA, FORM PLAY et ses SCNE.
static void load(std::vector<uint8_t> &file, LoadedMission &m) {
    IFFSaxLexer lexer;
    IFFHandlers root;
    root["MISN"] = [&m](uint8_t *data, size_t size) {
        IFFSaxLexer inner;
        IFFHandlers chunks;
        chunks["VERS"] = [&m](uint8_t *d, size_t n) {
            if (n >= 2) {
                m.version = static_cast<uint16_t>(d[0] | d[1] << 8);
            }
        };
        chunks["AREA"] = [&m](uint8_t *d, size_t n) {
            m.areas = readAreas(d, n);
        };
        chunks["PLAY"] = [&m](uint8_t *d, size_t n) {
            IFFSaxLexer play;
            IFFHandlers scenes;
            scenes["SCNE"] = [&m](uint8_t *s, size_t k) {
                MISN_SCEN *scene = readScene(s, k);
                if (scene != nullptr) {
                    m.scenes.push_back(scene);
                }
            };
            play.InitFromRAM(d, n, scenes);
        };
        inner.InitFromRAM(data, size, chunks);
    };
    lexer.InitFromRAM(file.data(), file.size(), root);
}

static const char *kindName(SCSceneEvent::Kind kind) {
    if (kind == SCSceneEvent::ACTIVATE) {
        return "activation";
    }
    if (kind == SCSceneEvent::UPDATE) {
        return "on_update";
    }
    return "on_leaving";
}

static void printEvents(const char *when, std::vector<SCSceneEvent> &events) {
    for (const auto &e : events) {
        printf("  %-28s scène %d : %s (script %d)\n", when, e.scene, kindName(e.kind), e.prog);
    }
    events.clear();
}

int main(int argc, char **argv) {
    int missions = 0;
    int refused = 0;
    int areaCount = 0;
    int insideOwn = 0;
    int withoutGlobal = 0;
    for (int a = 1; a < argc; a++) {
        std::vector<uint8_t> file = readFile(argv[a]);
        LoadedMission m;
        load(file, m);
        if (m.version < MISSION_MIN_VERSION) {
            refused++;
            continue;
        }
        missions++;
        for (auto area : m.areas) {
            areaCount++;
            // Juste au-dessus du point de référence : dans la zone pour les trois formes.
            Vector3D probe = area->position + Vector3D(0.0f, 1.0f, 0.0f);
            if (area->contains(probe)) {
                insideOwn++;
            }
        }
        if (findGlobalScene(m.scenes, m.areas) < 0) {
            withoutGlobal++;
        }
        const char *base = strrchr(argv[a], '/');
        base = base ? base + 1 : argv[a];
        if (strcmp(base, "MISN-1A.IFF") != 0) {
            continue;
        }
        printf("%s : version %d, %zu zones, %zu scènes\n", base, m.version, m.areas.size(), m.scenes.size());
        for (size_t i = 0; i < m.areas.size(); i++) {
            AREA *z = m.areas[i];
            printf("  zone %zu %c « %s » : x %.0f y %.0f z %.0f, rayon %.0f, hauteur %.0f, étendues E %.0f O %.0f N %.0f "
                   "S %.0f, largeur %u × %u\n",
                   i, z->AreaType, z->AreaName, z->position.x, z->position.y, z->position.z, z->radius, z->height,
                   z->east, z->west, z->north, z->south, z->AreaWidth, z->AreaHeight);
        }
        for (size_t i = 0; i < m.scenes.size(); i++) {
            MISN_SCEN *s = m.scenes[i];
            printf("  scène %zu : active %d, zone %d, scripts %d / %d / %d, octet 9 = %d, mot 10 = %d, objets", i,
                   s->is_active, s->area_id, s->on_is_activated, s->on_update, s->on_leaving, s->field_9, s->field_10);
            for (auto c : s->cast) {
                printf(" %d", c);
            }
            printf("\n");
        }
        // Vol simulé : départ sur la base (zone 0), passage dans l'espace interdit (zone 1), retour.
        SCSceneTracker tracker;
        std::vector<SCSceneEvent> events;
        Vector3D base0 = m.areas[0]->position + Vector3D(0.0f, 10.0f, 0.0f);
        Vector3D zone1 = m.areas[1]->position + Vector3D(0.0f, 3000.0f, 0.0f);
        tracker.start(m.scenes, m.areas, base0, events);
        printEvents("chargement (sur la base)", events);
        tracker.tick(m.scenes, m.areas, base0, events);
        printEvents("image 1 (sur la base)", events);
        tracker.tick(m.scenes, m.areas, zone1, events);
        printEvents("image 2 (zone 1)", events);
        tracker.tick(m.scenes, m.areas, base0, events);
        printEvents("image 3 (retour)", events);
        tracker.finish(m.scenes, events);
        printEvents("fin de mission", events);
    }
    printf("%d missions lues, %d refusées (version < %d) ; %d zones, %d contiennent le point juste au-dessus de leur "
           "référence ; %d missions sans scène globale\n",
           missions, refused, MISSION_MIN_VERSION, areaCount, insideOwn, withoutGlobal);
    return 0;
}
