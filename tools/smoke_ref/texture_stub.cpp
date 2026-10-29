// Essais seulement : constructeur et destructeur de Texture sans SCRenderer (Texture.cpp de libRealSpace
// libère la texture dans la carte par SCRenderer::deleteTextureInGPU).
#include <cstdlib>

#include "../engine/Texture.h"

Texture::Texture()
    : data(nullptr), locFlag(DISK) {
}

Texture::~Texture() {
    if (data) {
        free(data);
    }
}
