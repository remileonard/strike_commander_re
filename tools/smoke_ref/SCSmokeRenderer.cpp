// Fumées : textures précalculées et dessin. analysis/SMOKE_SYSTEM.md § 5 et § 6.1.
#include "SCSmokeRenderer.h"

#include <GL/gl.h>

#include <algorithm>
#include <cmath>

#include "RLEShape.h"

uint64_t SCSmokeRenderer::key(int shape, int image, int shade, const RSSmokeModel &m) {
    uint64_t k = static_cast<uint64_t>(shape & 0xFF);
    k = (k << 8) | static_cast<uint64_t>(image & 0xFF);
    if (m.renderMode == 1) {
        // Sprite opaque : la teinte ne sert pas, une seule texture par image.
        return (k << 32) | 1;
    }
    k = (k << 8) | static_cast<uint64_t>((shade + 128) & 0xFF);
    k = (k << 8) | m.translucentFirst;
    k = (k << 8) | m.translucentCount;
    return (k << 8) | 2;
}

void SCSmokeRenderer::init(const RSSmokeSet &set, const uint8_t *paletteRGB, const std::vector<uint8_t> &fade) {
    palette.assign(paletteRGB, paletteRGB + 768);
    blends = fitFadeTables(palette.data(), fade.data(), fade.size());
    // Images décodées par RLEShape : tampon de largeur × hauteur, point d'accroche en (gauche, haut),
    // octet 255 = pas de pixel.
    std::vector<std::vector<ShapeImage>> decoded;
    imageInfo.clear();
    for (const auto &shape : set.shapes) {
        std::vector<ShapeImage> images;
        std::vector<SCSmokeImageInfo> infos;
        for (auto rle : shape.images) {
            ShapeImage image;
            SCSmokeImageInfo info;
            info.width = (std::max)(0, static_cast<int>(rle->GetWidth()));
            info.height = (std::max)(0, static_cast<int>(rle->GetHeight()));
            info.left = rle->GetLeft();
            info.top = rle->GetTop();
            image.width = info.width;
            image.height = info.height;
            image.pixels.assign(static_cast<size_t>(info.width) * info.height, 255);
            if (!image.pixels.empty()) {
                Point2D origin = {
                    0,
                    0
                };
                rle->SetPosition(&origin);
                rle->buffer_size.x = info.width;
                rle->buffer_size.y = info.height;
                size_t read = 0;
                rle->Expand(image.pixels.data(), &read);
                rle->buffer_size.x = 320;
                rle->buffer_size.y = 200;
            }
            image.mask.resize(image.pixels.size());
            for (size_t i = 0; i < image.pixels.size(); i++) {
                image.mask[i] = image.pixels[i] != 255 ? 1 : 0;
            }
            images.push_back(image);
            infos.push_back(info);
        }
        decoded.push_back(images);
        imageInfo.push_back(infos);
    }
    // Pour chaque modèle à formes : formes A et B, chaque image, chaque teinte entière de sa vie.
    pixels.clear();
    textureBytes = 0;
    for (const auto &m : set.models) {
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
            if (shape == 255 || shape >= static_cast<int>(decoded.size())) {
                continue;
            }
            for (size_t image = 0; image < decoded[shape].size(); image++) {
                const ShapeImage &src = decoded[shape][image];
                if (src.pixels.empty()) {
                    continue;
                }
                for (int shade = low; shade <= high; shade++) {
                    uint64_t k = key(shape, static_cast<int>(image), shade, m);
                    if (pixels.count(k)) {
                        continue;
                    }
                    int first = m.translucentFirst;
                    int count = m.translucentCount;
                    if (m.renderMode == 1) {
                        // Mode 1 : toutes les couleurs opaques (aucune plage translucide).
                        count = 0;
                    }
                    pixels[k] = buildSmokeTexture(src, palette.data(), blends, shade, first, count);
                    textureBytes += pixels[k].size();
                }
            }
        }
    }
}

void SCSmokeRenderer::upload() {
    for (auto &entry : pixels) {
        uint64_t k = entry.first;
        // Clé : forme sur les bits 40 à 47, image sur les bits 32 à 39 (les deux modes).
        int shape = static_cast<int>((k >> 40) & 0xFF);
        int image = static_cast<int>((k >> 32) & 0xFF);
        const SCSmokeImageInfo &info = imageInfo[shape][image];
        GLuint id = 0;
        glGenTextures(1, &id);
        glBindTexture(GL_TEXTURE_2D, id);
        glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, info.width, info.height, 0, GL_RGBA, GL_UNSIGNED_BYTE, entry.second.data());
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
        // Au plus proche voisin, comme la mise à l'échelle du jeu.
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
        textures[k] = id;
    }
    pixels.clear();
}

void SCSmokeRenderer::release() {
    for (auto &entry : textures) {
        GLuint id = entry.second;
        glDeleteTextures(1, &id);
    }
    textures.clear();
}

size_t SCSmokeRenderer::textureCount() const {
    return (std::max)(pixels.size(), textures.size());
}

size_t SCSmokeRenderer::memoryBytes() const {
    return textureBytes;
}

const std::vector<FadeBlend> &SCSmokeRenderer::fadeBlends() const {
    return blends;
}

// Mode 0 : ellipse pleine, rayon horizontal = taille, rayon vertical = taille × 213/256 (rapport des pixels
// 320 × 200 du jeu), couleur et alpha de la table de la teinte.
void SCSmokeRenderer::drawDisk(const SCSmokeParticle &p, const float *eye) {
    int shade = static_cast<int>(std::floor(p.shade));
    if (shade < 0 || shade >= static_cast<int>(blends.size())) {
        return;
    }
    const FadeBlend &b = blends[shade];
    glDisable(GL_TEXTURE_2D);
    glColor4f(b.r / 255.0f, b.g / 255.0f, b.b / 255.0f, b.alpha);
    glBegin(GL_TRIANGLE_FAN);
    glVertex3f(eye[0], eye[1], eye[2]);
    for (int i = 0; i <= 24; i++) {
        float a = static_cast<float>(i) * 3.14159265f / 12.0f;
        glVertex3f(eye[0] + p.size * std::cos(a), eye[1] + p.size * 213.0f / 256.0f * std::sin(a), eye[2]);
    }
    glEnd();
}

// Modes 1 et 2 : carré face à la caméra (repère œil), un pixel d'image = metresPerPixel mètres.
void SCSmokeRenderer::drawSprite(const RSSmokeModel &m, int shape, int image, int shade, float metresPerPixel,
                                 const float *eye) {
    auto found = textures.find(key(shape, image, shade, m));
    if (found == textures.end()) {
        return;
    }
    const SCSmokeImageInfo &info = imageInfo[shape][image];
    float x0 = eye[0] - info.left * metresPerPixel;
    float x1 = eye[0] + (info.width - info.left) * metresPerPixel;
    float y0 = eye[1] + info.top * metresPerPixel; // ligne 0 de l'image en haut
    float y1 = eye[1] - (info.height - info.top) * metresPerPixel;
    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, found->second);
    glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
    glBegin(GL_QUADS);
    glTexCoord2f(0.0f, 0.0f);
    glVertex3f(x0, y0, eye[2]);
    glTexCoord2f(1.0f, 0.0f);
    glVertex3f(x1, y0, eye[2]);
    glTexCoord2f(1.0f, 1.0f);
    glVertex3f(x1, y1, eye[2]);
    glTexCoord2f(0.0f, 1.0f);
    glVertex3f(x0, y1, eye[2]);
    glEnd();
}

struct SmokeDrawItem {
    float depth;
    float eye[3];
    SCSmokeParticle *particle;
};

int SCSmokeRenderer::render(SCSmokeParticles &smoke, float maxDistance) {
    float view[16];
    float projection[16];
    GLint viewport[4];
    glGetFloatv(GL_MODELVIEW_MATRIX, view);
    glGetFloatv(GL_PROJECTION_MATRIX, projection);
    glGetIntegerv(GL_VIEWPORT, viewport);
    // Focale du jeu en pixels d'un écran de 200 lignes ; plan proche de la projection.
    float focal200 = projection[5] * 100.0f;
    float nearPlane = projection[14] / (projection[10] - 1.0f);
    float width = static_cast<float>(viewport[2]);
    float height = static_cast<float>(viewport[3]);
    float pixelsPer200 = height / 200.0f;

    // Particle_ProjectToScreen_4C1EE : repère de la caméra, profondeur, taille à l'écran.
    std::vector<SmokeDrawItem> items;
    for (auto &p : smoke.particles()) {
        SmokeDrawItem item;
        item.eye[0] = view[0] * p.position.x + view[4] * p.position.y + view[8] * p.position.z + view[12];
        item.eye[1] = view[1] * p.position.x + view[5] * p.position.y + view[9] * p.position.z + view[13];
        item.eye[2] = view[2] * p.position.x + view[6] * p.position.y + view[10] * p.position.z + view[14];
        item.depth = -item.eye[2];
        item.particle = &p;
        if (item.depth <= nearPlane || item.depth > maxDistance) {
            continue;
        }
        if (p.size * focal200 / item.depth <= 153.0f / 256.0f) {
            continue;
        }
        items.push_back(item);
    }
    // RenderList_RadixSortDescending_588E8 : du plus loin au plus proche, ordre stable.
    std::stable_sort(items.begin(), items.end(), [](const SmokeDrawItem &a, const SmokeDrawItem &b) {
        return a.depth > b.depth;
    });

    glMatrixMode(GL_MODELVIEW);
    glPushMatrix();
    glLoadIdentity();
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnable(GL_DEPTH_TEST);
    glDepthMask(GL_FALSE);
    glDisable(GL_ALPHA_TEST);
    glDisable(GL_CULL_FACE);
    glDisable(GL_LIGHTING);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    int drawn = 0;
    for (auto &item : items) {
        SCSmokeParticle &p = *item.particle;
        const RSSmokeModel &m = smoke.model(p.model);
        float sx = width / 2.0f + item.eye[0] * projection[0] * width / 2.0f / item.depth;
        float sy = height / 2.0f - item.eye[1] * projection[5] * height / 2.0f / item.depth;
        if (m.renderMode == 0) {
            float r = p.size * focal200 / item.depth * pixelsPer200;
            if (sx + r < 0.0f || sx - r >= width || sy + r < 0.0f || sy - r >= height) {
                continue;
            }
            p.drawn = true;
            drawn++;
            drawDisk(p, item.eye);
            continue;
        }
        if ((m.renderMode != 1 && m.renderMode != 2) || p.shape < 0) {
            continue;
        }
        const RSSmokeShape &shape = smoke.shape(p.shape);
        int image = smoke.imageOf(p);
        if (image < 0 || image >= static_cast<int>(shape.images.size())) {
            continue;
        }
        // Échelle du jeu, bornée de 4/256 à 32 ; rejet sur r = échelle × demi-taille.
        float scale = p.size * focal200 / (item.depth * shape.halfSize);
        scale = (std::min)(32.0f, (std::max)(4.0f / 256.0f, scale));
        float r = scale * shape.halfSize * pixelsPer200;
        if (sx + r < 0.0f || sx - r >= width || sy + r < 0.0f || sy - r >= height) {
            continue;
        }
        p.drawn = true;
        drawn++;
        int shade = static_cast<int>(std::floor(p.shade));
        drawSprite(m, p.shape, image, shade, scale * item.depth / focal200, item.eye);
    }
    glDisable(GL_TEXTURE_2D);
    glDepthMask(GL_TRUE);
    glDisable(GL_BLEND);
    glEnable(GL_CULL_FACE);
    glPopMatrix();
    return drawn;
}
