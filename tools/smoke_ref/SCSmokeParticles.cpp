// Particules de fumée. analysis/SMOKE_SYSTEM.md § 3 et § 4.
#include "SCSmokeParticles.h"

#include <cmath>

void SCSmokeParticles::init(const RSSmokeSet *smokeSet, uint32_t seed) {
    set = smokeSet;
    capacity = set->maxParticles;
    active.clear();
    active.reserve(capacity);
    modelStep.clear();
    for (const auto &m : set->models) {
        modelStep.push_back(m.frameStep);
    }
    rng.seed(seed);
}

void SCSmokeParticles::clear() {
    active.clear();
    modelStep.clear();
    for (const auto &m : set->models) {
        modelStep.push_back(m.frameStep);
    }
}

std::vector<SCSmokeParticle> &SCSmokeParticles::particles() {
    return active;
}

const RSSmokeModel &SCSmokeParticles::model(int index) const {
    return set->models[index];
}

const RSSmokeShape &SCSmokeParticles::shape(int index) const {
    return set->shapes[index];
}

// Math_RandomJitter_54E1C : aléa dans [−amount, +amount].
float SCSmokeParticles::jitter(float amount) {
    std::uniform_real_distribution<float> d(-amount, amount);
    return d(rng);
}

// Forme : aucune si A = 255 ; A si la chance vaut 100 ; sinon A avec la chance (Math_RandomChance_54E4F), B autrement.
int SCSmokeParticles::pickShape(const RSSmokeModel &m) {
    if (m.shapeA == 255) {
        return -1;
    }
    int chosen = m.shapeA;
    if (m.chanceA != 100) {
        std::uniform_int_distribution<int> d(0, 99);
        if (d(rng) >= m.chanceA) {
            chosen = m.shapeB;
        }
    }
    if (chosen == 255 || chosen >= static_cast<int>(set->shapes.size())) {
        return -1;
    }
    return chosen;
}

int SCSmokeParticles::lastFrame(const SCSmokeParticle &p) const {
    const RSSmokeModel &m = set->models[p.model];
    if (!m.frameOrder.empty()) {
        return static_cast<int>(m.frameOrder.size()) - 1;
    }
    if (p.shape < 0) {
        return 0;
    }
    return static_cast<int>(set->shapes[p.shape].images.size()) - 1;
}

int SCSmokeParticles::imageOf(const SCSmokeParticle &p) const {
    const RSSmokeModel &m = set->models[p.model];
    int frame = p.frame;
    if (!m.frameOrder.empty()) {
        frame = m.frameOrder[(std::min)(frame, static_cast<int>(m.frameOrder.size()) - 1)];
    }
    return frame;
}

// ParticlePool_AllocElement_4CFA0 puis Particle_InitFromSmokeModel_4C168 : rien si la réserve est pleine.
SCSmokeParticle *SCSmokeParticles::allocate(int model) {
    if (model < 0 || model >= static_cast<int>(set->models.size())) {
        return nullptr;
    }
    if (active.size() >= capacity) {
        return nullptr;
    }
    const RSSmokeModel &m = set->models[model];
    SCSmokeParticle p;
    p.model = model;
    p.size = m.sizeStart;
    p.life = m.life;
    p.shade = m.shadeStart;
    p.velocity = {
        0.0f,
        0.0f,
        0.0f
    };
    active.push_back(p);
    return &active.back();
}

void SCSmokeParticles::spawn(int model, Vector3D position, Vector3D velocity) {
    SCSmokeParticle *p = allocate(model);
    if (p == nullptr) {
        return;
    }
    const RSSmokeModel &m = set->models[model];
    p->position.x = position.x + jitter(m.jitter);
    p->position.y = position.y + jitter(m.jitter);
    p->position.z = position.z + jitter(m.jitter);
    // Vitesse gardée en int16 de 1/256 m/s par le jeu : au plus 127,99 m/s par axe.
    p->velocity = velocity;
    p->shape = pickShape(m);
}

void SCSmokeParticles::spawnAlongSegment(int model, Vector3D p, Vector3D q, float dt) {
    if (model < 0 || model >= static_cast<int>(set->models.size())) {
        return;
    }
    const RSSmokeModel &m = set->models[model];
    Vector3D segment = q - p;
    float length = segment.Length();
    int n = static_cast<int>(length / m.spacing);
    if (n == 0 && length > 0.0f) {
        n = 1;
    }
    if (n == 0) {
        return;
    }
    Vector3D step = segment * (1.0f / n);
    Vector3D position = p;
    for (int k = 0; k < n; k++) {
        float life = m.life - dt - k * dt / n;
        if (life <= 0.0f) {
            return;
        }
        SCSmokeParticle *particle = allocate(model);
        if (particle == nullptr) {
            return;
        }
        particle->position = position;
        particle->life = life;
        particle->size = m.sizeStart + k * m.sizeRate() * dt / n;
        particle->shade = m.shadeStart + k * m.shadeRate() * dt / n;
        particle->frame = static_cast<int>(k * m.framesPerSecond * dt / n);
        particle->shape = pickShape(m);
        position = position + step;
        // Aléa cumulé à partir de la 3e particule (pas d'aléa entre la 1re et la 2e).
        if (k > 0 && k < n - 1) {
            position.x += jitter(m.jitter);
            position.y += jitter(m.jitter);
            position.z += jitter(m.jitter);
        }
    }
}

void SCSmokeParticles::emitTrail(int model, Vector3D emissionPoint, Vector3D objectVelocity, float dt) {
    Vector3D previous = emissionPoint - objectVelocity * dt;
    spawnAlongSegment(model, emissionPoint, previous, dt);
}

// Particle_UpdateLifeSizeShadeFrame_4C413 puis Particle_IntegrateVelocity.
void SCSmokeParticles::update(float dt) {
    size_t kept = 0;
    for (size_t i = 0; i < active.size(); i++) {
        SCSmokeParticle &p = active[i];
        const RSSmokeModel &m = set->models[p.model];
        p.life -= dt;
        if (p.life <= 0.0f) {
            continue;
        }
        if (p.drawn) {
            p.visibility = 2;
        } else {
            p.visibility--;
            if (p.visibility == 0) {
                continue;
            }
        }
        p.drawn = false;
        int &step = modelStep[p.model];
        bool removed = false;
        if ((m.renderMode == 1 || m.renderMode == 2) && step != 0) {
            p.frameAccumulator += m.framesPerSecond * dt;
            // Un seul pas par mise à jour, quand l'accumulateur dépasse une image.
            if (p.frameAccumulator > 1.0f) {
                p.frameAccumulator -= 1.0f;
                int last = lastFrame(p);
                int next = p.frame + step;
                if (m.animMode == 'R') {
                    p.frame = next;
                    if (p.frame >= last) {
                        step = -1;
                        p.frame = last;
                    }
                    if (p.frame <= 0) {
                        step = 1;
                        p.frame = 0;
                    }
                } else if (m.animMode == 'S') {
                    if (next > last) {
                        step = 0;
                    } else {
                        p.frame = next;
                    }
                } else if (m.animMode == 'T') {
                    if (next > last || next < 0) {
                        removed = true;
                    } else {
                        p.frame = next;
                    }
                } else if (m.animMode == 'W') {
                    if (next > last) {
                        p.frame = 0;
                    } else if (next < 0) {
                        p.frame = last;
                    } else {
                        p.frame = next;
                    }
                }
            }
        }
        if (removed) {
            continue;
        }
        p.size += m.sizeRate() * dt;
        p.shade += m.shadeRate() * dt;
        p.position = p.position + p.velocity * dt;
        active[kept] = p;
        kept++;
    }
    active.resize(kept);
}

void SCSmokeGenerator::init(const RSSmokeGeneratorInfo &generatorInfo, bool startsActive) {
    info = generatorInfo;
    remaining = info.duration;
    countdown = info.interval;
    active = startsActive;
}

bool SCSmokeGenerator::tick(SCSmokeParticles &smoke, Vector3D position, float dt) {
    if (!active) {
        return true;
    }
    remaining -= dt;
    if (remaining <= 0.0f) {
        active = false;
        return info.removeAtEnd == 0;
    }
    countdown -= dt;
    if (countdown <= 0.0f) {
        countdown = info.interval;
        Vector3D velocity = {
            0.0f,
            info.rise,
            0.0f
        };
        smoke.spawn(info.type, position, velocity);
    }
    return true;
}

Vector3D smokeEmissionPoint(Vector3D position, Vector3D orientation, Vector3D localPoint) {
    Matrix m;
    m.Clear();
    m.Identity();
    m.translateM(position.x, position.y, position.z);
    m.rotateM(orientation.x, 0.0f, 1.0f, 0.0f);
    m.rotateM(orientation.y, 0.0f, 0.0f, 1.0f);
    m.rotateM(orientation.z, 1.0f, 0.0f, 0.0f);
    // Matrice d'OpenGL (glMultMatrixf(m.v)) : v[colonne][ligne].
    Vector3D world;
    world.x = m.v[0][0] * localPoint.x + m.v[1][0] * localPoint.y + m.v[2][0] * localPoint.z + m.v[3][0];
    world.y = m.v[0][1] * localPoint.x + m.v[1][1] * localPoint.y + m.v[2][1] * localPoint.z + m.v[3][1];
    world.z = m.v[0][2] * localPoint.x + m.v[1][2] * localPoint.y + m.v[2][2] * localPoint.z + m.v[3][2];
    return world;
}
