// Fumée portée par un objet (l'acteur) : ses particules, sans limite de nombre, créées, animées et dessinées
// d'après un modèle du jeu de fumées RSSmokeSet, partagé par tous les objets. Remplace SCSmokeSet de libRealSpace.
// analysis/IMPL_SMOKE.md § 4. Repère de libRealSpace (Y = altitude), mètres, secondes.
#pragma once
#include <cstdint>
#include <random>
#include <vector>

#include "../commons/Matrix.h"
#include "RSSmokeSet.h"

class Texture;

struct SCSmokeParticle {
    Vector3D position;
    Vector3D velocity;   // m/s ; nulle pour une traînée, (0, montée, 0) pour un générateur SMKG
    float size{ 0.0f };  // m (rayon)
    float life{ 0.0f };  // s restantes
    float shade{ 0.0f }; // partie entière = numéro de table FADE
    float frameAccumulator{ 0.0f };
    int shape{ -1 }; // -1 = aucune forme
    int frame{ 0 };  // rang dans SCRI s'il existe, sinon numéro d'image de la forme
};

// Ce qu'il faut pour un appel de SCRenderer::drawBillboard(position, texture, size).
struct SCSmokeSprite {
    Vector3D position;
    Texture *texture{ nullptr };
    float size{ 0.0f };     // m, côté du carré
    float distance{ 0.0f }; // m, de la caméra
};

class SCSmokeSet {
    RSSmokeSet *set{ nullptr };
    int model{ 0 };
    int step{ 0 }; // pas d'animation : les modes R et S le changent pour toutes les particules du modèle
    std::vector<SCSmokeParticle> particles;
    std::mt19937 rng;
    // Générateur posé (objet SMKG, SmokeGen_Tick_4C057).
    RSSmokeGeneratorInfo generator;
    float generatorRemaining{ 0.0f };
    float generatorCountdown{ 0.0f };
    bool generatorActive{ false };

    float jitter(float amount);
    int pickShape();
    int lastFrame(const SCSmokeParticle &p) const;
    int imageOf(const SCSmokeParticle &p) const;
    SCSmokeParticle create();

public:
    // smokeSet : le jeu de fumées chargé une fois (textures construites) et partagé par tous les objets.
    void init(RSSmokeSet *smokeSet, int smokeModel, uint32_t seed);
    // Change de modèle (par exemple la fumée de chute du JINF) ; les particules déjà créées continuent avec le
    // nouveau modèle.
    void setModel(int smokeModel);
    int getModel() const;

    // Une particule à la position donnée (+ dispersion du modèle), vitesse donnée (Particle_SpawnWithColor).
    void spawn(Vector3D position, Vector3D velocity);
    // Particules de P (point d'émission de cette image) vers Q (même point à l'image précédente), une tous les
    // « espacement » m, vieillies le long du segment (Particles_SpawnAlongSegment_4D1C9).
    void spawnAlongSegment(Vector3D p, Vector3D q, float dt);
    // Traînée : Q = P − vitesse de l'objet × dt (SmokeTrail_Tick_3D57E).
    void emitTrail(Vector3D emissionPoint, Vector3D objectVelocity, float dt);
    // Générateur SMKG : prend le modèle de son INFO ; emitGenerator le fait émettre à chaque image et renvoie
    // false quand l'objet doit être supprimé (fin de l'émission et removeAtEnd ≠ 0).
    void startGenerator(const RSSmokeGeneratorInfo &info, bool startsActive);
    bool emitGenerator(Vector3D position, float dt);

    // Vie, image d'animation, taille, teinte, position (Particle_UpdateLifeSizeShadeFrame_4C413,
    // Particle_IntegrateVelocity).
    void update(float dt);
    // Dessin : une entrée par particule qui a une texture, de la plus loin à la plus proche de la caméra, puis
    // drawSmokeBillboard pour chacune.
    void sprites(Vector3D camera, std::vector<SCSmokeSprite> &out) const;
    void render(Vector3D camera) const;

    const std::vector<SCSmokeParticle> &getParticles() const;
    void clear();
};

// Appel de dessin d'un sprite. Dans libRealSpace : Renderer.drawBillboard(position, texture, size) ; dans les
// essais : une copie de SCRenderer::drawBillboard (smoke_render_test.cpp) ou un compteur (smoke_test.cpp).
void drawSmokeBillboard(Vector3D position, Texture *texture, float size);

// Point d'émission d'un chunk SMOK dans le monde, avec la matrice que SCRenderer::drawModel et
// drawModelWithChilds appliquent au modèle (translation, puis rotations autour de Y, Z, X). localPoint : point
// du chunk SMOK converti comme les sommets du chunk VERT du même objet (readObjectSmoke).
Vector3D smokeEmissionPoint(Vector3D position, Vector3D orientation, Vector3D localPoint);
