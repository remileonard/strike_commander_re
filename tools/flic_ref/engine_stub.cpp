// Essai seulement : symboles du moteur dont Texture.cpp de libRealSpace a besoin à l'édition des liens
// (VGAPalette::ReadPatch est dans Texture.cpp, avec Texture qui libère sa texture par SCRenderer).
#include "../engine/Loader.h"
#include "../engine/SCRenderer.h"
#include "../realspace/AssetManager.h"

SCRenderer::SCRenderer() {
}

SCRenderer::~SCRenderer() {
}

void SCRenderer::deleteTextureInGPU(Texture *texture) {
    (void)texture;
}

AssetManager::~AssetManager() {
}

Loader::~Loader() {
}
