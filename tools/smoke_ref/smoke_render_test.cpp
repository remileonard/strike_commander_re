// Essai du dessin des fumées, hors écran (OSMesa) : émetteur, textures de SCSmokeSet et dessin par une copie de
// SCRenderer::drawBillboard. Traînée d'un avion vue de côté, image PPM.
// Usage : smoke_render_test SMOKESET.IFF PALETTE.IFF PALFADE.IFF modèle sortie.ppm
#include <GL/gl.h>
#include <GL/osmesa.h>

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>

#include "RSSmokeSet.h"
#include "SCSmokeEmitter.h"
#include "SCSmokeSet.h"

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

static VGAPalette readPalette(const std::vector<uint8_t> &iff) {
    VGAPalette palette;
    for (size_t i = 12; i + 8 + 4 + 768 <= iff.size(); i++) {
        if (memcmp(&iff[i], "PALT", 4) == 0) {
            for (int c = 0; c < 256; c++) {
                Texel t;
                t.r = static_cast<uint8_t>(iff[i + 12 + 3 * c] * 255 / 63);
                t.g = static_cast<uint8_t>(iff[i + 12 + 3 * c + 1] * 255 / 63);
                t.b = static_cast<uint8_t>(iff[i + 12 + 3 * c + 2] * 255 / 63);
                t.a = 255;
                palette.SetColor(static_cast<uint8_t>(c), t);
            }
            break;
        }
    }
    return palette;
}

// Copie de SCRenderer::drawBillboard de libRealSpace (commit c5fa505), la position de la caméra en paramètre.
static void drawBillboard(Vector3D cameraPos, Vector3D pos, Texture *tex, float size, float alpha) {
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnable(GL_TEXTURE_2D);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    glEnable(GL_BLEND);
    glEnable(GL_ALPHA_TEST);
    glAlphaFunc(GL_GREATER, 0.1f);
    glDisable(GL_CULL_FACE);
    glEnable(GL_DEPTH_TEST);
    if (!tex->initialized) {
        GLuint id = 0;
        glGenTextures(1, &id);
        tex->id = id;
        glBindTexture(GL_TEXTURE_2D, tex->id);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, static_cast<GLsizei>(tex->width), static_cast<GLsizei>(tex->height), 0,
                     GL_RGBA, GL_UNSIGNED_BYTE, tex->data);
        tex->initialized = true;
    } else {
        glBindTexture(GL_TEXTURE_2D, tex->id);
    }
    Vector3D look = cameraPos - pos;
    look.Normalize();
    Vector3D globalUp = {
        0.0f,
        1.0f,
        0.0f
    };
    Vector3D right = globalUp.CrossProduct(&look);
    right.Normalize();
    Vector3D up = look.CrossProduct(&right);
    float half = size * 0.5f;
    Vector3D bottomLeft = pos - right * half - up * half;
    Vector3D bottomRight = pos + right * half - up * half;
    Vector3D topRight = pos + right * half + up * half;
    Vector3D topLeft = pos - right * half + up * half;
    glBegin(GL_QUADS);
    glColor4f(1.0f, 1.0f, 1.0f, alpha);
    glTexCoord2f(0.0f, 0.0f);
    glVertex3f(bottomLeft.x, bottomLeft.y, bottomLeft.z);
    glTexCoord2f(1.0f, 0.0f);
    glVertex3f(bottomRight.x, bottomRight.y, bottomRight.z);
    glTexCoord2f(1.0f, 1.0f);
    glVertex3f(topRight.x, topRight.y, topRight.z);
    glTexCoord2f(0.0f, 1.0f);
    glVertex3f(topLeft.x, topLeft.y, topLeft.z);
    glEnd();
    glDisable(GL_ALPHA_TEST);
    glDisable(GL_BLEND);
    glDisable(GL_TEXTURE_2D);
    glEnable(GL_CULL_FACE);
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
    std::vector<uint8_t> fadeFile = readFile(argv[3]);
    int model = atoi(argv[4]);
    RSSmokeSet set;
    set.InitFromRam(smokeFile.data(), smokeFile.size());
    SCSmokeSet smokeSet;
    smokeSet.smoke_set = &set;
    smokeSet.palette = readPalette(readFile(argv[2]));
    smokeSet.initFadeTextures(fadeFile.data(), fadeFile.size());
    SCSmokeEmitter emitter;
    emitter.init(&set, model, 5);

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
    size_t drawn = 0;
    for (int frame = 0; frame < 40; frame++) {
        position = position + velocity * dt;
        Vector3D emission = position + Vector3D(0.0f, 0.0f, 14.0f);
        emitter.emitTrail(emission, velocity, dt);
        emitter.update(dt);
        glClearColor(0.42f, 0.55f, 0.70f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        // Caméra de côté, un peu au-dessus, qui suit l'avion.
        Vector3D camera = position + Vector3D(70.0f, 12.0f, 10.0f);
        loadLookAt(camera, position + Vector3D(0.0f, 0.0f, 40.0f));
        std::vector<SCSmokeSprite> sprites;
        emitter.sprites(smokeSet, camera, sprites);
        for (const auto &sprite : sprites) {
            drawBillboard(camera, sprite.position, sprite.texture, sprite.size, 1.0f);
        }
        drawn = sprites.size();
    }
    glFinish();
    printf("%zu particules, %zu dessinées, %zu textures\n", emitter.getParticles().size(), drawn, smokeSet.textureCount());
    FILE *out = fopen(argv[5], "wb");
    fprintf(out, "P6\n%d %d\n255\n", width, height);
    for (int y = height - 1; y >= 0; y--) {
        for (int x = 0; x < width; x++) {
            fwrite(&image[4 * (static_cast<size_t>(y) * width + x)], 1, 3, out);
        }
    }
    fclose(out);
    OSMesaDestroyContext(context);
    return 0;
}
