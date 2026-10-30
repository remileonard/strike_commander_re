// Missions : lecture des zones (AREA) et des scènes (SCNE). analysis/IMPL_MISSION_AREAS.md.
#include "RSMissionAreas.h"

#include <algorithm>
#include <cctype>
#include <cmath>
#include <cstring>

#include "../commons/ByteStream.h"

// Coordonnée ou distance du fichier : int32 petit-boutiste en 24.8 (ResourceRecord_ReadFieldGroupC_64A7E).
static float readMetres(ByteStream &bs) {
    return static_cast<float>(bs.ReadInt32LE()) / 256.0f;
}

// Point du fichier (c0, c1, c2 ; c2 = altitude) dans le repère de libRealSpace.
static Vector3D readPoint(ByteStream &bs) {
    float c0 = readMetres(bs);
    float c1 = readMetres(bs);
    float c2 = readMetres(bs);
    return Vector3D(c0, c2, -c1);
}

bool AREA::contains(const Vector3D &point) const {
    if (AreaType == 'S') {
        Vector3D d = point - position;
        return d.Length() <= radius;
    }
    if (point.y < position.y || point.y > position.y + height) {
        return false;
    }
    if (AreaType == 'C') {
        float dx = point.x - position.x;
        float dz = point.z - position.z;
        return std::sqrt(dx * dx + dz * dz) <= radius;
    }
    if (AreaType == 'B') {
        float minX = 0.0f;
        float maxX = 0.0f;
        float minZ = 0.0f;
        float maxZ = 0.0f;
        boundsXZ(&minX, &maxX, &minZ, &maxZ);
        return point.x >= minX && point.x <= maxX && point.z >= minZ && point.z <= maxZ;
    }
    return false;
}

void AREA::boundsXZ(float *minX, float *maxX, float *minZ, float *maxZ) const {
    if (AreaType == 'B') {
        *minX = position.x - west;
        *maxX = position.x + east;
        *minZ = position.z - north;
        *maxZ = position.z + south;
        return;
    }
    *minX = position.x - radius;
    *maxX = position.x + radius;
    *minZ = position.z - radius;
    *maxZ = position.z + radius;
}

bool AREA::visibleOnMap() const {
    return AreaName[0] != '.';
}

std::vector<AREA *> readAreas(uint8_t *data, size_t size) {
    std::vector<AREA *> areas;
    size_t offset = 0;
    while (offset < size) {
        uint8_t shape = data[offset];
        size_t length = 0;
        if (shape == 'S') {
            length = 49;
        } else if (shape == 'C') {
            length = 53;
        } else if (shape == 'B') {
            length = 65;
        }
        // Lettre inconnue ou fin de chunk (octet de bourrage IFF) : arrêt.
        if (length == 0 || offset + length > size) {
            break;
        }
        ByteStream bs(data + offset, length);
        AREA *area = new AREA();
        area->id = static_cast<int>(areas.size()) + 1;
        area->AreaType = bs.ReadByte();
        for (int k = 0; k < 32; k++) {
            area->AreaName[k] = static_cast<char>(toupper(bs.ReadByte()));
        }
        area->AreaName[32] = '\0';
        area->position = readPoint(bs);
        if (shape == 'S') {
            area->radius = readMetres(bs);
        } else if (shape == 'C') {
            area->height = readMetres(bs);
            area->radius = readMetres(bs);
        } else {
            area->east = readMetres(bs);
            area->west = readMetres(bs);
            area->north = readMetres(bs);
            area->south = readMetres(bs);
            area->height = readMetres(bs);
        }
        float minX = 0.0f;
        float maxX = 0.0f;
        float minZ = 0.0f;
        float maxZ = 0.0f;
        area->boundsXZ(&minX, &maxX, &minZ, &maxZ);
        area->AreaWidth = static_cast<unsigned int>(maxX - minX);
        area->AreaHeight = static_cast<unsigned int>(maxZ - minZ);
        areas.push_back(area);
        offset += length;
    }
    return areas;
}

MISN_SCEN *readScene(uint8_t *data, size_t size) {
    if (size < 24) {
        return nullptr;
    }
    ByteStream bs(data, size);
    MISN_SCEN *scene = new MISN_SCEN();
    scene->is_active = bs.ReadByte();
    scene->area_id = bs.ReadShort();
    scene->on_is_activated = bs.ReadShort();
    scene->on_update = bs.ReadShort();
    scene->on_leaving = bs.ReadShort();
    scene->progs_id.push_back(scene->on_is_activated);
    scene->progs_id.push_back(scene->on_update);
    scene->progs_id.push_back(scene->on_leaving);
    scene->field_9 = bs.ReadByte();
    scene->field_10 = bs.ReadUShort();
    scene->field_12 = readPoint(bs);
    // (taille − 24) / 2 mots : un octet impair en fin de chunk n'est pas lu.
    size_t count = (size - 24) / 2;
    for (size_t i = 0; i < count; i++) {
        scene->cast.push_back(bs.ReadUShort());
    }
    return scene;
}

const AREA *sceneArea(const MISN_SCEN *scene, const std::vector<AREA *> &areas) {
    uint16_t index = static_cast<uint16_t>(scene->area_id);
    if (index >= areas.size()) {
        return nullptr;
    }
    return areas[index];
}
