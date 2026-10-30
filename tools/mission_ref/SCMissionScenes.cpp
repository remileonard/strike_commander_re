// Missions : choix de la scène courante et ordre des scripts de scène. analysis/IMPL_MISSION_AREAS.md § 4.
#include "SCMissionScenes.h"

int findGlobalScene(const std::vector<MISN_SCEN *> &scenes, const std::vector<AREA *> &areas) {
    for (size_t i = 0; i < scenes.size(); i++) {
        if (sceneArea(scenes[i], areas) == nullptr) {
            return static_cast<int>(i);
        }
    }
    return -1;
}

int findSceneAt(const std::vector<MISN_SCEN *> &scenes, const std::vector<AREA *> &areas, const Vector3D &point) {
    for (size_t i = 0; i < scenes.size(); i++) {
        if (scenes[i]->is_active == 0) {
            continue;
        }
        const AREA *area = sceneArea(scenes[i], areas);
        if (area == nullptr) {
            continue;
        }
        if (area->contains(point)) {
            return static_cast<int>(i);
        }
    }
    return -1;
}

// Scene_DetectAndActivateChange_532EA : si la scène trouvée n'est plus la même, on_leaving de l'ancienne
// (Scene_TriggerMissionUpdateEvent_53211, champ +16 du record), puis activation de la nouvelle
// (Scene_TriggerActivation_531CD : Scene_EnsureUnitsSpawned_530FF, puis champ +8).
void SCSceneTracker::change(const std::vector<MISN_SCEN *> &scenes, int found, std::vector<SCSceneEvent> &out) {
    if (found == current) {
        return;
    }
    if (current >= 0) {
        out.push_back({ SCSceneEvent::LEAVE,
                        current,
                        scenes[current]->on_leaving });
    }
    if (found >= 0) {
        out.push_back({ SCSceneEvent::ACTIVATE,
                        found,
                        scenes[found]->on_is_activated });
    }
    current = found;
}

void SCSceneTracker::start(const std::vector<MISN_SCEN *> &scenes, const std::vector<AREA *> &areas,
                           const Vector3D &player, std::vector<SCSceneEvent> &out) {
    global = findGlobalScene(scenes, areas);
    current = -1;
    if (global >= 0) {
        out.push_back({ SCSceneEvent::ACTIVATE,
                        global,
                        scenes[global]->on_is_activated });
    }
    change(scenes, findSceneAt(scenes, areas, player), out);
}

// MAIN_GAME_TICK : Scene_TriggerLeavingEvent_531F2 (champ +12 du record = on_update) sur la scène globale,
// Scene_DetectAndActivateChange_532EA, puis Scene_TriggerLeavingEvent_531F2 sur la scène courante.
void SCSceneTracker::tick(const std::vector<MISN_SCEN *> &scenes, const std::vector<AREA *> &areas,
                          const Vector3D &player, std::vector<SCSceneEvent> &out) {
    if (global >= 0) {
        out.push_back({ SCSceneEvent::UPDATE,
                        global,
                        scenes[global]->on_update });
    }
    change(scenes, findSceneAt(scenes, areas, player), out);
    if (current >= 0) {
        out.push_back({ SCSceneEvent::UPDATE,
                        current,
                        scenes[current]->on_update });
    }
}

// STRIKE_EXE_MAIN_LOOP, en sortie de boucle : champ +16 de la scène globale ; puis
// MissionScenario_RecomputeFields_A9382 : champ +16 de la scène courante et de la scène globale.
void SCSceneTracker::finish(const std::vector<MISN_SCEN *> &scenes, std::vector<SCSceneEvent> &out) {
    if (global >= 0) {
        out.push_back({ SCSceneEvent::LEAVE,
                        global,
                        scenes[global]->on_leaving });
    }
    if (current >= 0) {
        out.push_back({ SCSceneEvent::LEAVE,
                        current,
                        scenes[current]->on_leaving });
    }
}

int SCSceneTracker::globalScene() const {
    return global;
}

int SCSceneTracker::currentScene() const {
    return current;
}
