// Visibilité des sprites du déroulement (chunk REQU de GAMEFLOW.IFF) : GAMEFLOW_SYSTEM.md § 4.
// g++ -std=c++17 -o requ requ.cpp && ./requ
#include <cstddef>
#include <cstdint>
#include <cstdio>

// Visibilité d'un sprite d'après son chunk REQU (Gameflow_CheckSpriteRequirements_3604).
// requ : paires (condition, numéro de drapeau) ; flags : drapeaux de la partie (06h / 07h).
bool spriteIsVisible(const uint8_t *requ, size_t size, const bool *flags) {
    bool visible = true;
    bool skipNext = false;
    for (size_t i = 0; i + 1 < size; i += 2) {
        uint8_t condition = requ[i];
        bool flag = flags[requ[i + 1]];
        switch (condition) {
        case 0:
            // caché si le drapeau est posé, sauf si la condition est ignorée
            if (flag && !skipNext) {
                visible = false;
            }
            skipNext = false;
            break;
        case 1:
            // caché si le drapeau n'est pas posé, sauf si la condition est ignorée
            if (!flag && !skipNext) {
                visible = false;
            }
            skipNext = false;
            break;
        case 2:
            // drapeau non posé : la prochaine condition 0 ou 1 est ignorée
            if (!flag) {
                skipNext = true;
            }
            break;
        case 3:
            // drapeau posé : la prochaine condition 0 ou 1 est ignorée
            if (flag) {
                skipNext = true;
            }
            break;
        default:
            // valeur inconnue : ignorée
            break;
        }
    }
    return visible;
}

int main() {
    bool flags[256] = {};
    const uint8_t sprite8[] = {
        3,
        3,
        1,
        4,
        0,
        42,
    };
    int errors = 0;
    // (3,3)(1,4)(0,42) : visible si (drapeau 3 ou drapeau 4) et pas drapeau 42
    if (spriteIsVisible(sprite8, sizeof(sprite8), flags)) {
        errors++;
    }
    flags[3] = true;
    if (!spriteIsVisible(sprite8, sizeof(sprite8), flags)) {
        errors++;
    }
    flags[42] = true;
    if (spriteIsVisible(sprite8, sizeof(sprite8), flags)) {
        errors++;
    }
    std::printf("%d erreur(s)\n", errors);
    return errors;
}
