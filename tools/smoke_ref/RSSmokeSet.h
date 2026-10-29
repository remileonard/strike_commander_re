// Jeu de fumées (OBJECTS\SMOKESET.IFF) : lecture complète. Proposition pour remplacer
// src/realspace/RSSmokeSet.h de libRealSpace. analysis/SMOKE_SYSTEM.md § 2, analysis/IMPL_SMOKE.md § 2.
#pragma once
#include <cstddef>
#include <cstdint>
#include <vector>

class RLEShape;

// Modèle de fumée : FORM SMOK de FORM TYPE (SmokeSet_LoadSmokeModel_A61D0). Valeurs réelles : les int32
// du fichier sont en 24.8 (÷ 256), les octets sont des entiers.
struct RSSmokeModel {
    uint8_t renderMode{ 0 };       // 0 disque, 1 sprite opaque, 2 sprite translucide
    float spacing{ 1.0f };         // m entre deux particules d'une traînée
    float sizeStart{ 0.0f };       // m (rayon)
    float sizeEnd{ 0.0f };         // m
    float life{ 1.0f };            // s
    float jitter{ 0.0f };          // m, dispersion de position à la création
    float shadeStart{ 0.0f };      // numéro de table FADE
    float shadeEnd{ 0.0f };        // numéro de table FADE
    uint8_t translucentFirst{ 0 }; // A : première couleur translucide d'une forme
    uint8_t translucentCount{ 0 }; // B : nombre de couleurs translucides
    uint8_t shapeA{ 255 };         // 255 = aucune forme
    uint8_t chanceA{ 100 };        // % de chance de prendre la forme A
    uint8_t shapeB{ 255 };
    char animMode{ 'T' }; // 'R', 'S', 'T', 'W'
    int16_t framesPerSecond{ 0 };
    int16_t frameStep{ 0 };          // 1, -1, 0 = pas d'animation
    std::vector<uint8_t> frameOrder; // chunk SCRI, vide s'il est absent

    float sizeRate() const;  // m/s
    float shadeRate() const; // tables/s
};

// Forme : FORM SHAP de FORM TYPE (SmokeSet_LoadShape_A60AC).
struct RSSmokeShape {
    std::vector<uint8_t> data; // forme RealSpace, décompressée si le chunk commençait par « LZ »
    std::vector<RLEShape *> images;
    int halfSize{ 1 }; // pixels : (plus grande hauteur + plus grande largeur) / 4
};

class RSSmokeSet {
    void parseSMOK(uint8_t *data, size_t size);
    void parseSMOK_INFO(uint8_t *data, size_t size);
    void parseSMOK_TYPE(uint8_t *data, size_t size);
    void parseSMOK_TYPE_SMOK(uint8_t *data, size_t size);
    void parseSMOK_TYPE_SMOK_INFO(uint8_t *data, size_t size);
    void parseSMOK_TYPE_SMOK_ANIM(uint8_t *data, size_t size);
    void parseSMOK_TYPE_SMOK_SCRI(uint8_t *data, size_t size);
    void parseSMOK_TYPE_SHAP(uint8_t *data, size_t size);
    void parseSMOK_TYPE_SHAP_SHAP(uint8_t *data, size_t size);

public:
    RSSmokeSet();
    ~RSSmokeSet();
    void InitFromRam(uint8_t *data, size_t size);

    // Chunk INFO de la racine : nombres annoncés (les tableaux suivent le rang des sous-FORM).
    uint16_t declaredModels{ 0 };
    uint16_t declaredShapes{ 0 };
    uint16_t maxParticles{ 0 };
    std::vector<RSSmokeModel> models; // numéro de modèle = rang parmi les FORM SMOK de FORM TYPE
    std::vector<RSSmokeShape> shapes; // numéro de forme = rang parmi les FORM SHAP de FORM TYPE
};

// Chunk SMOK d'un objet (MISS, JETP, OMOB…) : traînée de fumée (MobileObject_LoadDynamicsAndSmoke_9D189).
struct RSObjectSmoke {
    bool present{ false };
    uint8_t type{ 0 }; // numéro de modèle de fumée
    // Point d'émission en repère de l'objet, converti comme les sommets du chunk VERT
    // (RSEntity::parseREAL_APPR_POLY_VERT : x = c1, y = c2, z = c0), pour suivre le modèle dessiné.
    float x{ 0.0f };
    float y{ 0.0f };
    float z{ 0.0f };
};
RSObjectSmoke readObjectSmoke(uint8_t *data, size_t size);

// 8e champ du chunk JINF (octet 11) : modèle de fumée de la chute d'un avion abattu ; 6 sans JINF
// (Aircraft_LoadEJECAndJINF_9D4F0, Aircraft_OnDestroyed_9D770).
uint8_t readJinfFallSmoke(uint8_t *data, size_t size);

// Chunk INFO d'un objet SMKG, 16 octets (SmokeGen_LoadFromIFF_A5F89).
struct RSSmokeGeneratorInfo {
    uint8_t type{ 0 };        // numéro de modèle de fumée
    float duration{ 0.0f };   // s d'émission
    float rise{ 0.0f };       // m/s, vitesse de montée des particules (altitude seule)
    float interval{ 1.0f };   // s entre deux particules
    uint16_t chance{ 100 };   // chance d'être actif à la création (échelle 100)
    uint8_t removeAtEnd{ 0 }; // ≠ 0 : l'objet se supprime à la fin ; 0 : il s'arrête seulement
};
RSSmokeGeneratorInfo readSmokeGeneratorInfo(uint8_t *data, size_t size);

// Chunk FADE de PALETTE\PALFADE.IFF (FORM FTBL) : tables de 256 octets, la table n à n × 256.
std::vector<uint8_t> loadFadeTables(uint8_t *data, size_t size);
