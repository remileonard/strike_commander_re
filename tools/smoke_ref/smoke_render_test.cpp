// Essai du dessin OpenGL des fumées, hors écran (OSMesa) : traînée d'un avion vue de côté, image PPM.
// Usage : smoke_render_test SMOKESET.IFF PALETTE.IFF PALFADE.IFF modèle sortie.ppm
#include <GL/gl.h>
#include <GL/osmesa.h>

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>

#include "RSSmokeSet.h"
#include "SCSmokeParticles.h"
#include "SCSmokeRenderer.h"

static std::vector<uint8_t> readFile(const char *path) {
    std::vector<uint8_t> data;
    FILE *f = fopen(path, "rb");
    if (f == nullptr) {
        return data;
    }
    fseek(f, 0, SEEK_END);
    data.resize(static_cast<size_t>(ftell(f)));
    fseek(f, 0, SEEK_SET);
    size_t read = fread(data.data(), 1, data.size(), f);
    data.resize(read);
    fclose(f);
    return data;
}

static std::vector<uint8_t> readPalette(const std::vector<uint8_t> &iff) {
    std::vector<uint8_t> rgb(768, 0);
    for (size_t i = 12; i + 8 + 4 + 768 <= iff.size(); i++) {
        if (memcmp(&iff[i], "PALT", 4) == 0) {
            for (int c = 0; c < 768; c++) {
                int v = iff[i + 12 + c] * 255 / 63;
                rgb[c] = static_cast<uint8_t>(v > 255 ? 255 : v);
            }
            break;
        }
    }
    return rgb;
}

// Matrice de vue (comme gluLookAt), chargée dans GL_MODELVIEW.
static void loadLookAt(Vector3D eye, Vector3D target) {
    Vector3D f = target - eye;
    f.Normalize();
    Vector3D up = {
        0.0f,
        1.0f,
        0.0f
    };
    Vector3D s = f.CrossProduct(&up);
    s.Normalize();
    Vector3D u = s.CrossProduct(&f);
    float m[16] = {
        s.x,
        u.x,
        -f.x,
        0.0f,
        s.y,
        u.y,
        -f.y,
        0.0f,
        s.z,
        u.z,
        -f.z,
        0.0f,
        0.0f,
        0.0f,
        0.0f,
        1.0f
    };
    glMatrixMode(GL_MODELVIEW);
    glLoadMatrixf(m);
    glTranslatef(-eye.x, -eye.y, -eye.z);
}

int main(int argc, char **argv) {
    if (argc < 6) {
        printf("usage : %s SMOKESET.IFF PALETTE.IFF PALFADE.IFF modèle sortie.ppm\n", argv[0]);
        return 1;
    }
    const int width = 640;
    const int height = 400;
    std::vector<uint8_t> image(static_cast<size_t>(width) * height * 4);
    OSMesaContext context = OSMesaCreateContextExt(OSMESA_RGBA, 24, 0, 0, nullptr);
    if (context == nullptr || !OSMesaMakeCurrent(context, image.data(), GL_UNSIGNED_BYTE, width, height)) {
        printf("pas de contexte OSMesa\n");
        return 1;
    }
    std::vector<uint8_t> smokeFile = readFile(argv[1]);
    std::vector<uint8_t> palette = readPalette(readFile(argv[2]));
    std::vector<uint8_t> fadeFile = readFile(argv[3]);
    int model = atoi(argv[4]);
    RSSmokeSet set;
    set.InitFromRam(smokeFile.data(), smokeFile.size());
    SCSmokeRenderer renderer;
    renderer.init(set, palette.data(), loadFadeTables(fadeFile.data(), fadeFile.size()));
    renderer.upload();
    SCSmokeParticles smoke;
    smoke.init(&set, 5);

    // Focale du jeu 277 pixels sur 200 lignes : fovy = 2 × atan(100 / 277).
    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    float nearPlane = 1.0f;
    float top = nearPlane * 100.0f / 277.0f;
    float right = top * width / height;
    glFrustum(-right, right, -top, top, nearPlane, 20000.0f);

    const float dt = 1.0f / 15.0f;
    Vector3D position = {
        0.0f,
        1000.0f,
        0.0f
    };
    Vector3D velocity = {
        0.0f,
        0.0f,
        -100.0f
    };
    int drawn = 0;
    for (int frame = 0; frame < 40; frame++) {
        position = position + velocity * dt;
        Vector3D emission = position + Vector3D(0.0f, 0.0f, 14.0f);
        smoke.emitTrail(model, emission, velocity, dt);
        smoke.update(dt);
        glClearColor(0.42f, 0.55f, 0.70f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        // Caméra de côté, un peu au-dessus, qui suit l'avion.
        loadLookAt(position + Vector3D(70.0f, 12.0f, 10.0f), position + Vector3D(0.0f, 0.0f, 40.0f));
        drawn = renderer.render(smoke, 20000.0f);
    }
    glFinish();
    printf("%zu particules, %d dessinées, %zu textures\n", smoke.particles().size(), drawn, renderer.textureCount());
    FILE *out = fopen(argv[5], "wb");
    fprintf(out, "P6\n%d %d\n255\n", width, height);
    for (int y = height - 1; y >= 0; y--) {
        for (int x = 0; x < width; x++) {
            fwrite(&image[4 * (static_cast<size_t>(y) * width + x)], 1, 3, out);
        }
    }
    fclose(out);
    renderer.release();
    OSMesaDestroyContext(context);
    return 0;
}
