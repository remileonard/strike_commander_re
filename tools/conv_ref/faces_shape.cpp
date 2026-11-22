// Table faces_shape de SCConvPlayer.cpp, valeurs corrigées d'après le jeu (CONV_SYSTEM.md § 2,
// « Images d'un visage », et § 7.4). Numéros libRealSpace = numéro d'image du jeu + 1.
// Pour chaque valeur de l'octet « image » de CLOSEUP : les images du gros plan, dans l'ordre du jeu
// (TalkingHead_DrawAt_9D47 puis TalkingHead_DrawDressed_9E5E) : tête, expression, bouche, coiffure,
// habits. kFaceMouthSlot marque la place de la bouche, qui change à chaque image de scène.
// Les types ci-dessous ne servent qu'à compiler cet essai ; dans libRealSpace, seule la table et la
// boucle de dessin sont à reprendre.
#include <cstdint>
#include <cstdio>
#include <unordered_map>
#include <vector>

// Place de la bouche dans la liste (pas un numéro d'image : un visage en a 62)
static const uint8_t kFaceMouthSlot = 255;

// Images fixes du gros plan, numéros libRealSpace
static const uint8_t kFaceHead = 1;
static const uint8_t kFaceHair = 2;
static const uint8_t kFaceClothes = 35;

std::unordered_map<uint8_t, std::vector<uint8_t>> faces_shape = {
    { 13,
      std::vector<uint8_t>{
          kFaceHead,
          14,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 14,
      std::vector<uint8_t>{
          kFaceHead,
          15,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 15,
      std::vector<uint8_t>{
          kFaceHead,
          16,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 16,
      std::vector<uint8_t>{
          kFaceHead,
          17,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 17,
      std::vector<uint8_t>{
          kFaceHead,
          18,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 18,
      std::vector<uint8_t>{
          kFaceHead,
          19,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 19,
      std::vector<uint8_t>{
          kFaceHead,
          20,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 20,
      std::vector<uint8_t>{
          kFaceHead,
          21,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 21,
      std::vector<uint8_t>{
          kFaceHead,
          22,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 22,
      std::vector<uint8_t>{
          kFaceHead,
          23,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 23,
      std::vector<uint8_t>{
          kFaceHead,
          24,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 24,
      std::vector<uint8_t>{
          kFaceHead,
          25,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 25,
      std::vector<uint8_t>{
          kFaceHead,
          26,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 26,
      std::vector<uint8_t>{
          kFaceHead,
          27,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 27,
      std::vector<uint8_t>{
          kFaceHead,
          28,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 28,
      std::vector<uint8_t>{
          kFaceHead,
          29,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 29,
      std::vector<uint8_t>{
          kFaceHead,
          30,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 30,
      std::vector<uint8_t>{
          kFaceHead,
          31,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 31,
      std::vector<uint8_t>{
          kFaceHead,
          32,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 32,
      std::vector<uint8_t>{
          kFaceHead,
          33,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 33,
      std::vector<uint8_t>{
          kFaceHead,
          34,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
    { 255,
      std::vector<uint8_t>{
          kFaceHead,
          kFaceMouthSlot,
          kFaceHair,
          kFaceClothes,
      } },
};

// Dessin d'un gros plan : la liste de la valeur, la bouche à sa place (mouth < 0 : pas de bouche).
// drawImage reçoit un numéro libRealSpace.
template <typename DrawImage>
void drawCloseUpFace(uint8_t expression, int16_t mouth, DrawImage drawImage) {
    auto found = faces_shape.find(expression);
    if (found == faces_shape.end()) {
        return;
    }
    for (uint8_t image : found->second) {
        if (image == kFaceMouthSlot) {
            if (mouth >= 0) {
                drawImage(static_cast<uint8_t>(mouth));
            }
            continue;
        }
        drawImage(image);
    }
}

int main() {
    // Octet 14 : tête, yeux 14 du jeu (15 libRealSpace), bouche 3, coiffure, habits
    drawCloseUpFace(14, 3, [](uint8_t image) {
        printf("%d ", image);
    });
    printf("(attendu 1 15 3 2 35)\n");
    return 0;
}
