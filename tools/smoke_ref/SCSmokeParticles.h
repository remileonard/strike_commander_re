// Particules de fumée : création, vie, animation, mouvement. Sans OpenGL. analysis/SMOKE_SYSTEM.md § 3 et § 4,
// analysis/IMPL_SMOKE.md § 3. Repère de libRealSpace (Y = altitude), mètres, secondes.
#pragma once
#include <cstdint>
#include <random>
#include <vector>

#include "../commons/Matrix.h"
#include "RSSmokeSet.h"

struct SCSmokeParticle {
    Vector3D position;
    Vector3D velocity;   // m/s ; nulle pour une traînée, (0, montée, 0) pour un générateur SMKG
    float size{ 0.0f };  // m (rayon)
    float life{ 0.0f };  // s restantes
    float shade{ 0.0f }; // partie entière = numéro de table FADE
    float frameAccumulator{ 0.0f };
    int model{ 0 };
    int shape{ -1 };     // -1 = aucune forme
    int frame{ 0 };      // rang dans SCRI s'il existe, sinon numéro d'image de la forme
    int visibility{ 2 }; // supprimée quand il tombe à 0 (2 mises à jour sans dessin)
    bool drawn{ false }; // posé par le dessin, lu par la mise à jour suivante
};

class SCSmokeParticles {
    const RSSmokeSet *set{ nullptr };
    std::vector<SCSmokeParticle> active;
    std::vector<int> modelStep; // pas d'animation par modèle : les modes R et S le changent pour tout le modèle
    size_t capacity{ 0 };
    std::mt19937 rng;

    float jitter(float amount);
    int pickShape(const RSSmokeModel &m);
    int lastFrame(const SCSmokeParticle &p) const;
    SCSmokeParticle *allocate(int model);

public:
    void init(const RSSmokeSet *smokeSet, uint32_t seed);
    void clear();

    // Particle_SpawnWithColor : une particule à la position donnée (+ dispersion), vitesse donnée.
    // Générateur SMKG : velocity = (0, montée, 0).
    void spawn(int model, Vector3D position, Vector3D velocity);
    // Particles_SpawnAlongSegment_4D1C9 : particules de P (point d'émission de cette image) vers Q (même
    // point à l'image précédente), une tous les « espacement » m, vieillies le long du segment.
    void spawnAlongSegment(int model, Vector3D p, Vector3D q, float dt);
    // SmokeTrail_Tick_3D57E : Q = P − vitesse de l'objet × dt.
    void emitTrail(int model, Vector3D emissionPoint, Vector3D objectVelocity, float dt);

    // SmokeSet_UpdateParticles_4CD9F puis SmokeSet_IntegrateParticles_4CE5A. À appeler une fois par image
    // dessinée : le compteur de visibilité compte des mises à jour entre deux dessins.
    void update(float dt);

    std::vector<SCSmokeParticle> &particles();
    const RSSmokeModel &model(int index) const;
    const RSSmokeShape &shape(int index) const;
    int imageOf(const SCSmokeParticle &p) const; // image de la forme à dessiner (SCRI appliqué)
};

// Générateur posé (objet SMKG) : SmokeGen_Tick_4C057.
class SCSmokeGenerator {
    RSSmokeGeneratorInfo info;
    float remaining{ 0.0f };
    float countdown{ 0.0f };
    bool active{ false };

public:
    void init(const RSSmokeGeneratorInfo &generatorInfo, bool startsActive);
    // Une image : renvoie false quand l'objet doit être supprimé (fin de l'émission et removeAtEnd ≠ 0).
    bool tick(SCSmokeParticles &smoke, Vector3D position, float dt);
};

// Point d'émission d'un chunk SMOK dans le monde, avec la matrice que SCRenderer::drawModelWithChilds
// applique au modèle (translation, puis rotations autour de Y, Z, X). localPoint : point du chunk SMOK
// converti comme les sommets du chunk VERT du même objet (RSEntity::parseREAL_APPR_POLY_VERT).
Vector3D smokeEmissionPoint(Vector3D position, Vector3D orientation, Vector3D localPoint);
