// Jeu de fumées : lecture complète (SmokeSet_LoadFromIFF_A636C, SmokeSet_LoadSmokeModel_A61D0,
// SmokeSet_LoadShape_A60AC). analysis/SMOKE_SYSTEM.md § 2.
#include "RSSmokeSet.h"

#include <algorithm>
#include <cstring>
#include <functional>
#include <string>
#include <unordered_map>

#include "../commons/ByteStream.h"
#include "../commons/IFFSaxLexer.h"
#include "../commons/LZBuffer.h"
#include "PakArchive.h"
#include "RLEShape.h"

typedef std::unordered_map<std::string, std::function<void(uint8_t *data, size_t size)>> IFFHandlers;

float RSSmokeModel::sizeRate() const {
    return (sizeEnd - sizeStart) / life;
}

float RSSmokeModel::shadeRate() const {
    return (shadeEnd - shadeStart) / life;
}

RSSmokeSet::RSSmokeSet() {
}

RSSmokeSet::~RSSmokeSet() {
    for (auto &shape : shapes) {
        for (auto image : shape.images) {
            delete image;
        }
    }
}

void RSSmokeSet::InitFromRam(uint8_t *data, size_t size) {
    IFFSaxLexer lexer;
    IFFHandlers handlers;
    handlers["SMOK"] = std::bind(&RSSmokeSet::parseSMOK, this, std::placeholders::_1, std::placeholders::_2);
    lexer.InitFromRAM(data, size, handlers);
}

void RSSmokeSet::parseSMOK(uint8_t *data, size_t size) {
    IFFSaxLexer lexer;
    IFFHandlers handlers;
    handlers["INFO"] = std::bind(&RSSmokeSet::parseSMOK_INFO, this, std::placeholders::_1, std::placeholders::_2);
    handlers["TYPE"] = std::bind(&RSSmokeSet::parseSMOK_TYPE, this, std::placeholders::_1, std::placeholders::_2);
    lexer.InitFromRAM(data, size, handlers);
}

// Trois uint16 : modèles, formes, particules au plus (ResourceRecord_ReadFieldGroupB_64A54, 2 octets chacun).
void RSSmokeSet::parseSMOK_INFO(uint8_t *data, size_t size) {
    if (size < 6) {
        return;
    }
    ByteStream bs(data, size);
    declaredModels = bs.ReadUShort();
    declaredShapes = bs.ReadUShort();
    maxParticles = bs.ReadUShort();
}

// Sous-FORM dans l'ordre du fichier : SMOK = modèle suivant, SHAP = forme suivante (les deux suites peuvent
// être mêlées).
void RSSmokeSet::parseSMOK_TYPE(uint8_t *data, size_t size) {
    IFFSaxLexer lexer;
    IFFHandlers handlers;
    handlers["SMOK"] = std::bind(&RSSmokeSet::parseSMOK_TYPE_SMOK, this, std::placeholders::_1, std::placeholders::_2);
    handlers["SHAP"] = std::bind(&RSSmokeSet::parseSMOK_TYPE_SHAP, this, std::placeholders::_1, std::placeholders::_2);
    lexer.InitFromRAM(data, size, handlers);
}

void RSSmokeSet::parseSMOK_TYPE_SMOK(uint8_t *data, size_t size) {
    models.push_back(RSSmokeModel());
    IFFSaxLexer lexer;
    IFFHandlers handlers;
    handlers["INFO"] =
        std::bind(&RSSmokeSet::parseSMOK_TYPE_SMOK_INFO, this, std::placeholders::_1, std::placeholders::_2);
    handlers["ANIM"] =
        std::bind(&RSSmokeSet::parseSMOK_TYPE_SMOK_ANIM, this, std::placeholders::_1, std::placeholders::_2);
    handlers["SCRI"] =
        std::bind(&RSSmokeSet::parseSMOK_TYPE_SMOK_SCRI, this, std::placeholders::_1, std::placeholders::_2);
    lexer.InitFromRAM(data, size, handlers);
}

// 25 octets lus d'un bloc (push large 19h).
void RSSmokeSet::parseSMOK_TYPE_SMOK_INFO(uint8_t *data, size_t size) {
    if (size < 25) {
        return;
    }
    RSSmokeModel &m = models.back();
    ByteStream bs(data, size);
    m.renderMode = bs.ReadByte();
    m.spacing = bs.ReadInt32LE() / 256.0f;
    m.sizeStart = bs.ReadInt32LE() / 256.0f;
    m.sizeEnd = bs.ReadInt32LE() / 256.0f;
    m.life = bs.ReadInt32LE() / 256.0f;
    // Dispersion : seuls les 16 bits bas servent (Math_RandomJitter_54E1C prend un mot) : au plus 127,99 m.
    m.jitter = static_cast<int16_t>(bs.ReadInt32LE() & 0xFFFF) / 256.0f;
    m.shadeStart = bs.ReadByte();
    m.shadeEnd = bs.ReadByte();
    m.translucentFirst = bs.ReadByte();
    m.translucentCount = bs.ReadByte();
    if (m.life <= 0.0f) {
        m.life = 1.0f / 256.0f;
    }
}

// 8 octets : forme A, chance de A (%), forme B, mode R/S/T/W, images par seconde (int16), pas (int16).
void RSSmokeSet::parseSMOK_TYPE_SMOK_ANIM(uint8_t *data, size_t size) {
    if (size < 8) {
        return;
    }
    RSSmokeModel &m = models.back();
    ByteStream bs(data, size);
    m.shapeA = bs.ReadByte();
    m.chanceA = bs.ReadByte();
    m.shapeB = bs.ReadByte();
    m.animMode = static_cast<char>(bs.ReadByte());
    m.framesPerSecond = bs.ReadShort();
    m.frameStep = bs.ReadShort();
}

// Ordre des images. Le jeu écrit ces octets dans le modèle lui-même au lieu du tampon alloué
// (SMOKE_SYSTEM.md § 2.3) ; aucune donnée n'a de SCRI : lu ici comme une table d'images ordinaire.
void RSSmokeSet::parseSMOK_TYPE_SMOK_SCRI(uint8_t *data, size_t size) {
    RSSmokeModel &m = models.back();
    m.frameOrder.assign(data, data + size);
}

void RSSmokeSet::parseSMOK_TYPE_SHAP(uint8_t *data, size_t size) {
    IFFSaxLexer lexer;
    IFFHandlers handlers;
    handlers["SHAP"] =
        std::bind(&RSSmokeSet::parseSMOK_TYPE_SHAP_SHAP, this, std::placeholders::_1, std::placeholders::_2);
    lexer.InitFromRAM(data, size, handlers);
}

// Forme RealSpace : uint32, puis table des décalages d'images ; chaque image commence par 4 int16
// d'étendue (droite, gauche, haut, bas). Version CD : « LZ », uint32 taille, données LZW.
void RSSmokeSet::parseSMOK_TYPE_SHAP_SHAP(uint8_t *data, size_t size) {
    RSSmokeShape shape;
    if (size > 6 && data[0] == 'L' && data[1] == 'Z') {
        LZBuffer lz;
        size_t csize = 0;
        uint8_t *raw = lz.DecodeLZW(data + 6, size - 6, csize);
        shape.data.assign(raw, raw + csize);
    } else {
        shape.data.assign(data, data + size);
    }
    // Demi-taille (Text_ComputeMaxLineHeight_5E706, Text_ComputeMaxLineWidth_5E6BF, sar ax, 2).
    int maxWidth = 0;
    int maxHeight = 0;
    if (shape.data.size() >= 8) {
        ByteStream header(shape.data.data(), shape.data.size());
        header.ReadUInt32LE();
        uint32_t first = header.ReadUInt32LE();
        size_t count = first / 4 - 1;
        for (size_t i = 0; i < count; i++) {
            uint32_t offset = 0;
            memcpy(&offset, &shape.data[4 + 4 * i], 4);
            if (offset + 8 > shape.data.size()) {
                continue;
            }
            ByteStream bs(&shape.data[offset], 8);
            int right = bs.ReadShort();
            int left = bs.ReadShort();
            int top = bs.ReadShort();
            int bottom = bs.ReadShort();
            maxWidth = (std::max)(maxWidth, right + left + 1);
            maxHeight = (std::max)(maxHeight, top + bottom + 1);
        }
    }
    shape.halfSize = (std::max)(1, (maxHeight + maxWidth) / 4);
    shapes.push_back(std::move(shape));
    // Images : PakArchive et RLEShape gardent un pointeur dans data. Ce tampon ne bouge pas quand le tableau
    // shapes s'agrandit (le std::vector de chaque forme est déplacé, pas recopié).
    RSSmokeShape &stored = shapes.back();
    PakArchive pak;
    pak.InitFromRAM("SHAPE", stored.data.data(), stored.data.size());
    for (size_t i = 0; i < pak.GetNumEntries(); i++) {
        RLEShape *image = new RLEShape();
        image->init(pak.GetEntry(i)->data, pak.GetEntry(i)->size);
        Point2D origin = {
            0,
            0
        };
        image->SetPosition(&origin);
        stored.images.push_back(image);
    }
}

// uint8 type, puis 3 int32 24.8 : c0, c1 (axe du nez), c2 (repère du jeu, Z vers le haut).
RSObjectSmoke readObjectSmoke(uint8_t *data, size_t size) {
    RSObjectSmoke smoke;
    if (size < 13) {
        return smoke;
    }
    ByteStream bs(data, size);
    smoke.present = true;
    smoke.type = bs.ReadByte();
    float c0 = bs.ReadInt32LE() / 256.0f;
    float c1 = bs.ReadInt32LE() / 256.0f;
    float c2 = bs.ReadInt32LE() / 256.0f;
    smoke.x = c1;
    smoke.y = c2;
    smoke.z = c0;
    return smoke;
}

// uint8, uint16, uint16, uint8 (classe de combat), uint16, uint8, uint16, uint8 (fumée de chute), uint16.
uint8_t readJinfFallSmoke(uint8_t *data, size_t size) {
    if (size < 12) {
        return 6;
    }
    return data[11];
}

RSSmokeGeneratorInfo readSmokeGeneratorInfo(uint8_t *data, size_t size) {
    RSSmokeGeneratorInfo info;
    if (size < 16) {
        return info;
    }
    ByteStream bs(data, size);
    info.type = bs.ReadByte();
    info.duration = bs.ReadInt32LE() / 256.0f;
    info.rise = bs.ReadInt32LE() / 256.0f;
    info.interval = bs.ReadInt32LE() / 256.0f;
    info.chance = bs.ReadUShort();
    info.removeAtEnd = bs.ReadByte();
    return info;
}

std::vector<uint8_t> loadFadeTables(uint8_t *data, size_t size) {
    std::vector<uint8_t> tables;
    IFFSaxLexer lexer;
    IFFHandlers handlers;
    handlers["FTBL"] = [&tables](uint8_t *form, size_t formSize) {
        IFFSaxLexer inner;
        IFFHandlers chunks;
        chunks["FADE"] = [&tables](uint8_t *fade, size_t fadeSize) {
            tables.assign(fade, fade + fadeSize - fadeSize % 256);
        };
        inner.InitFromRAM(form, formSize, chunks);
    };
    lexer.InitFromRAM(data, size, handlers);
    return tables;
}
