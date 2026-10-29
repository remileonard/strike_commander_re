// Jeu de fumées : textures teintées par les tables FADE, prêtes pour SCRenderer::drawBillboard.
// Parties à ajouter à SCSmokeSet de libRealSpace (src/strike_commander/SCSmokeSet.h). analysis/IMPL_SMOKE.md § 3.
#pragma once
#include <cstdint>
#include <unordered_map>
#include <vector>

#include "../engine/Texture.h"
#include "RSSmokeSet.h"
#include "smoke_alpha.h"

class SCSmokeSet {
    std::unordered_map<uint64_t, Texture *> fade_textures; // clé : modèle, forme, image, teinte
    std::vector<uint8_t> palette_rgb;                      // 768 octets RVB de 0 à 255

    static uint64_t textureKey(int model, int shape, int image, int shade);
    Texture *buildTexture(const RSSmokeModel &m, RLEShape *rle, int shade);

public:
    RSSmokeSet *smoke_set{ nullptr };
    VGAPalette palette;
    std::vector<FadeBlend> fade_blends; // une couleur + alpha par table FADE

    ~SCSmokeSet();
    // smoke_set et palette déjà chargés ; palfade = contenu de PALETTE\PALFADE.IFF. Construit, pour chaque modèle
    // à formes, une texture par forme (A et B), image et teinte entière de sa vie.
    void initFadeTextures(uint8_t *palfade, size_t size);
    // Texture d'une particule : nullptr si elle n'existe pas (pas de forme, teinte hors de la plage du modèle).
    Texture *getTexture(int model, int shape, int image, int shade);
    size_t textureCount() const;
};
