// Missions : choix de la scène courante et ordre des scripts de scène, comme STRIKE.EXE (MAIN_GAME_TICK,
// Scene_DetectAndActivateChange_532EA, Scene_FindMatchingByAreaContainment_53236). Sans dépendance au reste du
// jeu : renvoie la suite des événements, que libRealSpace exécute (scripts PROG, apparition des objets).
// analysis/IMPL_MISSION_AREAS.md § 4.
#pragma once
#include <cstdint>
#include <vector>

#include "RSMissionAreas.h"

struct SCSceneEvent {
    enum Kind {
        ACTIVATE, // faire apparaître les objets de la scène (cast) puis lancer on_is_activated
        UPDATE,   // lancer on_update
        LEAVE     // lancer on_leaving
    };
    Kind kind;
    int scene;    // index dans la liste des scènes
    int16_t prog; // script PROG à lancer, -1 = aucun
};

// Scène globale : la première scène sans zone (Expr_Node_Accessor_532AD appelée avec une zone nulle par
// MissionScenario_LoadMainRecord_A8331). -1 s'il n'y en a pas (le jeu s'arrête alors sur l'erreur 36889).
int findGlobalScene(const std::vector<MISN_SCEN *> &scenes, const std::vector<AREA *> &areas);
// Scène courante : la première scène, dans l'ordre du fichier, active et dont la zone contient le point.
// Les scènes sans zone ne sont jamais choisies ici. -1 si aucune.
int findSceneAt(const std::vector<MISN_SCEN *> &scenes, const std::vector<AREA *> &areas, const Vector3D &point);

class SCSceneTracker {
    int global{ -1 };
    int current{ -1 };

    void change(const std::vector<MISN_SCEN *> &scenes, int found, std::vector<SCSceneEvent> &out);

public:
    // Chargement de la mission : activation de la scène globale, puis de la scène qui contient le joueur.
    void start(const std::vector<MISN_SCEN *> &scenes, const std::vector<AREA *> &areas, const Vector3D &player,
               std::vector<SCSceneEvent> &out);
    // Une image (MAIN_GAME_TICK) : on_update de la scène globale ; changement de scène courante (on_leaving de
    // l'ancienne, activation de la nouvelle) ; on_update de la scène courante.
    void tick(const std::vector<MISN_SCEN *> &scenes, const std::vector<AREA *> &areas, const Vector3D &player,
              std::vector<SCSceneEvent> &out);
    // Fin de mission : on_leaving de la scène globale (le script qui écrit les résultats), puis de la scène
    // courante.
    void finish(const std::vector<MISN_SCEN *> &scenes, std::vector<SCSceneEvent> &out);
    int globalScene() const;
    int currentScene() const;
};
