// SCZone::isActive corrigé d'après le jeu (Gameflow_CheckSpriteRequirements_3604), GAMEFLOW_SYSTEM.md § 4.
// Les types ci-dessous ne servent qu'à compiler cet essai ; dans libRealSpace, seule la méthode est à reprendre.
#include <cstdint>
#include <cstdio>
#include <unordered_map>
#include <vector>

// Conditions du chunk REQU (GAMEFLOW_SYSTEM.md § 4.2)
enum RequCondition {
    REQUIRE_NOT_SET = 0,
    REQUIRE_SET = 1,
    OR_NOT_SET = 2,
    OR_SET = 3
};

struct REQU {
    uint8_t op;
    uint8_t value;
};

struct SPRT {
    std::vector<REQU *> *requ{ nullptr };
};

struct SCZone {
    SPRT *sprite{ nullptr };
    bool active{ true };
    bool isActive(std::unordered_map<uint8_t, bool> *requierd_flags);
};

bool SCZone::isActive(std::unordered_map<uint8_t, bool> *requierd_flags) {
    if (this->sprite == nullptr || this->sprite->requ == nullptr) {
        this->active = true;
        return this->active;
    }
    bool visible = true;
    bool skipNext = false;
    for (auto requ_flag : *this->sprite->requ) {
        // Un drapeau jamais posé vaut « non posé » (octet à 0 dans le jeu).
        bool flag = false;
        auto found = requierd_flags->find(requ_flag->value);
        if (found != requierd_flags->end()) {
            flag = found->second;
        }
        switch (requ_flag->op) {
        case REQUIRE_NOT_SET:
            if (flag && !skipNext) {
                visible = false;
            }
            skipNext = false;
            break;
        case REQUIRE_SET:
            if (!flag && !skipNext) {
                visible = false;
            }
            skipNext = false;
            break;
        case OR_NOT_SET:
            if (!flag) {
                skipNext = true;
            }
            break;
        case OR_SET:
            if (flag) {
                skipNext = true;
            }
            break;
        default:
            break;
        }
    }
    this->active = visible;
    return this->active;
}

int main() {
    REQU a;
    a.op = 1;
    a.value = 0;
    std::vector<REQU *> list = {
        &a,
    };
    SPRT sprite;
    sprite.requ = &list;
    SCZone zone;
    zone.sprite = &sprite;
    std::unordered_map<uint8_t, bool> flags;
    int errors = 0;
    // (1, 0) : caché tant que le drapeau 0 n'a jamais été posé
    if (zone.isActive(&flags)) {
        errors++;
    }
    flags[0] = true;
    if (!zone.isActive(&flags)) {
        errors++;
    }
    std::printf("%d erreur(s)\n", errors);
    return errors;
}
