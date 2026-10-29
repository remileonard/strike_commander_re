// Jeu de fumées : textures teintées par les tables FADE. analysis/SMOKE_SYSTEM.md § 5.3 et § 6.1.
#include "SCSmokeSet.h"

#include <algorithm>
#include <cmath>
#include <cstdlib>

#include "RLEShape.h"

SCSmokeSet::~SCSmokeSet() {
    for (auto &entry : fade_textures) {
        delete entry.second;
    }
}

uint64_t SCSmokeSet::textureKey(int model, int shape, int image, int shade) {
    uint64_t k = static_cast<uint64_t>(model & 0xFF);
    k = (k << 8) | static_cast<uint64_t>(shape & 0xFF);
    k = (k << 8) | static_cast<uint64_t>(image & 0xFF);
    return (k << 8) | static_cast<uint64_t>((shade + 128) & 0xFF);
}

// Texture carrée centrée sur le point d'accroche de l'image (le point de la particule), lignes de bas en haut
// comme les coordonnées de texture de drawBillboard (v = 0 en bas).
Texture *SCSmokeSet::buildTexture(const RSSmokeModel &m, RLEShape *rle, int shade) {
    ShapeImage image;
    image.width = (std::max)(0, static_cast<int>(rle->GetWidth()));
    image.height = (std::max)(0, static_cast<int>(rle->GetHeight()));
    if (image.width == 0 || image.height == 0) {
        return nullptr;
    }
    image.pixels.assign(static_cast<size_t>(image.width) * image.height, 255);
    Point2D origin = {
        0,
        0
    };
    rle->SetPosition(&origin);
    rle->buffer_size.x = image.width;
    rle->buffer_size.y = image.height;
    size_t read = 0;
    rle->Expand(image.pixels.data(), &read);
    rle->buffer_size.x = 320;
    rle->buffer_size.y = 200;
    image.mask.resize(image.pixels.size());
    for (size_t i = 0; i < image.pixels.size(); i++) {
        image.mask[i] = image.pixels[i] != 255 ? 1 : 0;
    }
    // Mode 1 (sprite opaque) : aucune couleur translucide.
    int count = m.renderMode == 1 ? 0 : m.translucentCount;
    std::vector<uint8_t> rgba = buildSmokeTexture(image, palette_rgb.data(), fade_blends, shade, m.translucentFirst, count);

    int left = rle->GetLeft();
    int top = rle->GetTop();
    int half = (std::max)((std::max)(left, image.width - left), (std::max)(top, image.height - top));
    int side = 2 * half;
    Texture *tex = new Texture();
    tex->width = static_cast<size_t>(side);
    tex->height = static_cast<size_t>(side);
    tex->initialized = false;
    tex->data = static_cast<uint8_t *>(calloc(static_cast<size_t>(side) * side * 4, 1));
    for (int y = 0; y < image.height; y++) {
        int row = side - 1 - (half - top + y);
        for (int x = 0; x < image.width; x++) {
            int col = half - left + x;
            const uint8_t *src = &rgba[4 * (static_cast<size_t>(y) * image.width + x)];
            uint8_t *dst = &tex->data[4 * (static_cast<size_t>(row) * side + col)];
            dst[0] = src[0];
            dst[1] = src[1];
            dst[2] = src[2];
            dst[3] = src[3];
        }
    }
    return tex;
}

void SCSmokeSet::initFadeTextures(uint8_t *palfade, size_t size) {
    // Palette en RVB de 0 à 255 (Texel de VGAPalette).
    palette_rgb.assign(768, 0);
    for (int c = 0; c < 256; c++) {
        Texel *t = palette.GetRGBColor(static_cast<uint8_t>(c));
        palette_rgb[3 * c] = t->r;
        palette_rgb[3 * c + 1] = t->g;
        palette_rgb[3 * c + 2] = t->b;
    }
    std::vector<uint8_t> fade = loadFadeTables(palfade, size);
    fade_blends = fitFadeTables(palette_rgb.data(), fade.data(), fade.size());
    for (size_t mi = 0; mi < smoke_set->models.size(); mi++) {
        const RSSmokeModel &m = smoke_set->models[mi];
        if (m.renderMode != 1 && m.renderMode != 2) {
            continue;
        }
        int low = static_cast<int>(std::floor((std::min)(m.shadeStart, m.shadeEnd)));
        int high = static_cast<int>(std::floor((std::max)(m.shadeStart, m.shadeEnd)));
        if (m.renderMode == 1) {
            low = 0;
            high = 0;
        }
        int candidates[2] = {
            m.shapeA,
            m.shapeB,
        };
        for (int shape : candidates) {
            if (shape == 255 || shape >= static_cast<int>(smoke_set->shapes.size())) {
                continue;
            }
            const RSSmokeShape &s = smoke_set->shapes[shape];
            for (size_t image = 0; image < s.images.size(); image++) {
                for (int shade = low; shade <= high; shade++) {
                    uint64_t k = textureKey(static_cast<int>(mi), shape, static_cast<int>(image), shade);
                    if (fade_textures.count(k)) {
                        continue;
                    }
                    Texture *tex = buildTexture(m, s.images[image], shade);
                    if (tex != nullptr) {
                        fade_textures[k] = tex;
                    }
                }
            }
        }
    }
}

Texture *SCSmokeSet::getTexture(int model, int shape, int image, int shade) {
    const RSSmokeModel &m = smoke_set->models[model];
    if (m.renderMode == 1) {
        shade = 0;
    }
    auto found = fade_textures.find(textureKey(model, shape, image, shade));
    if (found == fade_textures.end()) {
        return nullptr;
    }
    return found->second;
}

size_t SCSmokeSet::textureCount() const {
    return fade_textures.size();
}
