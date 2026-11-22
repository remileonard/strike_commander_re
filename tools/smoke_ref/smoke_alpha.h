// Fumées : approximation des tables FADE par un mélange alpha et textures RGBA précalculées.
// analysis/SMOKE_SYSTEM.md § 6.1 ; mêmes calculs que tools/smoke_fade_fit.py.
#pragma once
#include <cstddef>
#include <cstdint>
#include <vector>

struct FadeBlend {
    float alpha;
    float r;
    float g;
    float b;
};

// Une image de forme décodée : index de palette et masque (1 = pixel présent dans un segment de ligne).
struct ShapeImage {
    int width;
    int height;
    std::vector<uint8_t> pixels;
    std::vector<uint8_t> mask;
};

FadeBlend fitFadeTable(const uint8_t *palette, const uint8_t *table);
std::vector<FadeBlend> fitFadeTables(const uint8_t *palette, const uint8_t *fade, size_t fadeSize);
std::vector<uint8_t> buildSmokeTexture(const ShapeImage &image, const uint8_t *palette, const std::vector<FadeBlend> &blends,
                                       int shade, int first, int count);
