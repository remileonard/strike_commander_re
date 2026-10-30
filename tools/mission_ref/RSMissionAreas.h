// Missions : lecture des zones (chunk AREA) et des scènes (chunks SCNE du FORM PLAY), d'après
// ExprSlot_ConstructMain_A974A et MissionScene_ParseRecord_AA3A5. Proposition pour RSMission.h de libRealSpace.
// analysis/IMPL_MISSION_AREAS.md, analysis/DATA_MODEL.md § 6.6. Repère de libRealSpace (Y = altitude), mètres.
#pragma once
#include <cstddef>
#include <cstdint>
#include <string>
#include <vector>

#include "../commons/Matrix.h"

// Une zone. Point de référence (position) : centre pour une sphère, centre du plancher pour un cylindre ou une
// boîte. Lecture : x = c0 ÷ 256, y = c2 ÷ 256, z = −c1 ÷ 256.
struct AREA {
    int id;                 // rang dans le chunk + 1 (convention actuelle de libRealSpace)
    unsigned char AreaType; // 'S' sphère, 'C' cylindre vertical, 'B' boîte alignée sur les axes
    char AreaName[33];      // 32 octets du fichier + zéro de fin
    Vector3D position;
    float radius{ 0.0f }; // 'S' et 'C' : m
    float height{ 0.0f }; // 'C' et 'B' : m, vers le haut depuis le plancher
    // 'B' : étendues depuis le point de référence, en m (fichier : +c0, −c0, +c1, −c1).
    float east{ 0.0f };  // vers +X
    float west{ 0.0f };  // vers −X
    float north{ 0.0f }; // vers −Z (c1 positif, le nord)
    float south{ 0.0f }; // vers +Z
    // Taille totale dans le plan X/Z, pour l'affichage (carte, mise au point) : diamètre, ou largeur de la boîte.
    unsigned int AreaWidth{ 0 };  // le long de X
    unsigned int AreaHeight{ 0 }; // le long de Z

    // Test d'appartenance du jeu, bornes incluses (HitShape_Sphere_ContainsPoint_52E91,
    // HitShape_Radial2D_ContainsPoint_52F99, HitShape_Box_ContainsPoint_52F0F).
    bool contains(const Vector3D &point) const;
    // Rectangle couvert dans le plan X/Z (la boîte n'est pas centrée sur son point de référence).
    void boundsXZ(float *minX, float *maxX, float *minZ, float *maxZ) const;
    // La carte de navigation ne trace pas les zones dont le nom commence par « . »
    // (NavMap_DrawMissionObjects_7EDCA : cmp byte ptr es:[bx+2], 2Eh).
    bool visibleOnMap() const;
};

// Une scène (chunk SCNE) : en-tête de 24 octets, puis la liste des objets de la scène.
struct MISN_SCEN {
    uint8_t is_active{ 0 }; // octet 0 : la scène peut être choisie (opcode 0x80 la rend active)
    int16_t area_id{ -1 };  // octets 1 et 2 : index dans AREA ; -1 ou hors liste = pas de zone (scène globale)
    // Les trois scripts PROG (-1 = aucun), dans l'ordre du fichier, nommés d'après leur appel dans STRIKE.EXE.
    int16_t on_is_activated{ -1 }; // octets 3 et 4 : quand la scène devient la scène courante
    int16_t on_update{ -1 };       // octets 5 et 6 : à chaque image, pour la scène globale et la scène courante
    int16_t on_leaving{ -1 };      // octets 7 et 8 : quand la scène cesse d'être courante, et en fin de mission
    std::vector<int16_t> progs_id; // les trois mêmes, dans l'ordre du fichier
    // Octets 9 à 23 : rangés en mémoire par le chargeur ; rôle non établi.
    uint8_t field_9{ 0 };
    uint16_t field_10{ 0 };     // valeurs des données : 0, 90, 135, 180, 270
    Vector3D field_12;          // 3 int32 24.8, lus comme une position : x = c0 ÷ 256, y = c2 ÷ 256, z = −c1 ÷ 256
    std::vector<uint16_t> cast; // objets de la scène : index dans PART (ordre du chunk)
};

// Contenu du chunk AREA : enregistrements collés, sans compteur ; la 1re lettre donne la forme et la taille
// (49, 53 ou 65 octets). Lettre inconnue : lecture arrêtée (le jeu s'arrête sur l'erreur 36877).
std::vector<AREA *> readAreas(uint8_t *data, size_t size);
// Contenu d'un chunk SCNE ; nullptr si le chunk fait moins de 24 octets.
MISN_SCEN *readScene(uint8_t *data, size_t size);
// Zone d'une scène, ou nullptr (PtrList_GetAt_53034 : index hors liste → pas de zone).
const AREA *sceneArea(const MISN_SCEN *scene, const std::vector<AREA *> &areas);

// Version minimale acceptée par le jeu (chunk VERS, MissionScenario_LoadMainRecord_A8331 : erreur 13970 en dessous).
const uint16_t MISSION_MIN_VERSION = 1280;
