// Fumées : textures RGBA précalculées au chargement et dessin des particules en OpenGL (pipeline fixe,
// comme SCRenderer). analysis/SMOKE_SYSTEM.md § 5 et § 6.1, analysis/IMPL_SMOKE.md § 4.
#pragma once
#include <cstdint>
#include <unordered_map>
#include <vector>

#include "SCSmokeParticles.h"
#include "smoke_alpha.h"

// Une image de forme : sa taille et son point d'accroche (le point de la particule), en pixels.
struct SCSmokeImageInfo {
    int width{ 0 };
    int height{ 0 };
    int left{ 0 }; // colonne du point d'accroche dans l'image
    int top{ 0 };  // ligne du point d'accroche dans l'image
};

class SCSmokeRenderer {
    std::vector<uint8_t> palette; // 768 octets RVB de 0 à 255
    std::vector<FadeBlend> blends;
    std::vector<std::vector<SCSmokeImageInfo>> imageInfo;      // [forme][image]
    std::unordered_map<uint64_t, std::vector<uint8_t>> pixels; // RVBA par clé de texture, avant envoi
    std::unordered_map<uint64_t, uint32_t> textures;           // identifiants OpenGL par clé de texture
    size_t textureBytes{ 0 };

    static uint64_t key(int shape, int image, int shade, const RSSmokeModel &m);
    void drawDisk(const SCSmokeParticle &p, const float *eye);
    void drawSprite(const RSSmokeModel &m, int shape, int image, int shade, float metresPerPixel, const float *eye);

public:
    // Sans OpenGL : décode les images, ajuste les tables FADE, construit les textures RVBA.
    void init(const RSSmokeSet &set, const uint8_t *paletteRGB, const std::vector<uint8_t> &fade);
    // Envoi des textures (contexte OpenGL actif), puis libération.
    void upload();
    void release();
    size_t textureCount() const;
    size_t memoryBytes() const;
    const std::vector<FadeBlend> &fadeBlends() const;

    // Dessin : à appeler avec les matrices de la caméra déjà chargées (GL_MODELVIEW = vue), après les objets
    // opaques. Marque les particules dessinées pour la mise à jour suivante. maxDistance en mètres.
    int render(SCSmokeParticles &smoke, float maxDistance);
};
