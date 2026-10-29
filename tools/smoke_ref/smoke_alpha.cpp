// Fumées : textures RGBA précalculées au chargement, pour un dessin par mélange alpha
// (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA). analysis/SMOKE_SYSTEM.md § 5.3, § 5.4 et § 6.
//
// Dans le jeu, un pixel de niveau c (A <= c < A + B) d'une forme de fumée remplace la couleur déjà à
// l'écran par FADE[teinte + c - A][fond]. Chaque table FADE est approchée ici par un mélange :
// palette[FADE[k][c]] ≈ (1 - alpha) × palette[c] + alpha × cible. Le calcul est fait une fois ; à
// chaque image il ne reste qu'à choisir la texture de la particule (forme, image, teinte entière).
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <vector>

struct FadeBlend {
    float alpha;
    float r;
    float g;
    float b;
};

// palette : 768 octets RVB de 0 à 255 ; table : 256 octets d'une table FADE.
FadeBlend fitFadeTable(const uint8_t *palette, const uint8_t *table) {
    const int n = 256;
    double meanIn[3] = {
        0.0,
        0.0,
        0.0,
    };
    double meanDelta[3] = {
        0.0,
        0.0,
        0.0,
    };
    for (int c = 0; c < n; c++) {
        for (int ch = 0; ch < 3; ch++) {
            double in = palette[3 * c + ch];
            double out = palette[3 * table[c] + ch];
            meanIn[ch] += in / n;
            meanDelta[ch] += (out - in) / n;
        }
    }
    double num = 0.0;
    double den = 0.0;
    for (int c = 0; c < n; c++) {
        for (int ch = 0; ch < 3; ch++) {
            double in = palette[3 * c + ch];
            double out = palette[3 * table[c] + ch];
            double x = in - meanIn[ch];
            double y = out - in - meanDelta[ch];
            num += x * y;
            den += x * x;
        }
    }
    FadeBlend blend;
    blend.alpha = den > 0.0 ? static_cast<float>(-num / den) : 0.0f;
    float target[3];
    for (int ch = 0; ch < 3; ch++) {
        double b = meanDelta[ch] + blend.alpha * meanIn[ch];
        double t = std::fabs(blend.alpha) > 1e-6 ? b / blend.alpha : 0.0;
        if (t < 0.0) {
            t = 0.0;
        }
        if (t > 255.0) {
            t = 255.0;
        }
        target[ch] = static_cast<float>(t);
    }
    blend.r = target[0];
    blend.g = target[1];
    blend.b = target[2];
    if (blend.alpha < 0.0f) {
        blend.alpha = 0.0f;
    }
    if (blend.alpha > 1.0f) {
        blend.alpha = 1.0f;
    }
    return blend;
}

std::vector<FadeBlend> fitFadeTables(const uint8_t *palette, const uint8_t *fade, size_t fadeSize) {
    std::vector<FadeBlend> blends;
    for (size_t k = 0; k + 256 <= fadeSize; k += 256) {
        blends.push_back(fitFadeTable(palette, fade + k));
    }
    return blends;
}

// Une image de forme décodée : index de palette et masque (1 = pixel présent dans un segment de ligne).
struct ShapeImage {
    int width;
    int height;
    std::vector<uint8_t> pixels;
    std::vector<uint8_t> mask;
};

// Texture RGBA d'une image pour une teinte entière (partie entière de la teinte de la particule).
// first = A, count = B (octets 23 et 24 de l'INFO du modèle). Couleur hors de A … A + B - 1 : dessinée
// telle quelle (opaque) ; dans la plage : couleur et alpha de la table teinte + c - A ; table hors des
// tables FADE : pixel transparent (le jeu ne le dessine pas).
std::vector<uint8_t> buildSmokeTexture(const ShapeImage &image, const uint8_t *palette, const std::vector<FadeBlend> &blends,
                                       int shade, int first, int count) {
    std::vector<uint8_t> rgba(static_cast<size_t>(image.width) * image.height * 4, 0);
    for (int i = 0; i < image.width * image.height; i++) {
        if (!image.mask[i]) {
            continue;
        }
        int c = image.pixels[i];
        uint8_t *out = &rgba[4 * i];
        if (c < first || c >= first + count) {
            out[0] = palette[3 * c];
            out[1] = palette[3 * c + 1];
            out[2] = palette[3 * c + 2];
            out[3] = 255;
            continue;
        }
        int table = shade + c - first;
        if (table < 0 || table >= static_cast<int>(blends.size())) {
            continue;
        }
        const FadeBlend &blend = blends[table];
        out[0] = static_cast<uint8_t>(std::lround(blend.r));
        out[1] = static_cast<uint8_t>(std::lround(blend.g));
        out[2] = static_cast<uint8_t>(std::lround(blend.b));
        out[3] = static_cast<uint8_t>(std::lround(blend.alpha * 255.0f));
    }
    return rgba;
}

int main() {
    // Essai sans données : palette en dégradé de gris, table qui mène chaque couleur à mi-chemin du blanc.
    uint8_t palette[768];
    for (int c = 0; c < 256; c++) {
        palette[3 * c] = static_cast<uint8_t>(c);
        palette[3 * c + 1] = static_cast<uint8_t>(c);
        palette[3 * c + 2] = static_cast<uint8_t>(c);
    }
    uint8_t table[256];
    for (int c = 0; c < 256; c++) {
        table[c] = static_cast<uint8_t>((c + 255) / 2);
    }
    FadeBlend blend = fitFadeTable(palette, table);
    printf("alpha %.3f cible %.0f %.0f %.0f (attendu 0,5 et 255)\n", blend.alpha, blend.r, blend.g, blend.b);
    ShapeImage image;
    image.width = 2;
    image.height = 1;
    image.pixels = {
        1,
        240,
    };
    image.mask = {
        1,
        1,
    };
    std::vector<FadeBlend> blends(3, blend);
    std::vector<uint8_t> rgba = buildSmokeTexture(image, palette, blends, 1, 0, 3);
    printf("texel 0 : %d %d %d alpha %d ; texel 1 (opaque) : %d alpha %d\n", rgba[0], rgba[1], rgba[2], rgba[3], rgba[4], rgba[7]);
    return 0;
}
