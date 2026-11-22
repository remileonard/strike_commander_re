// APPLY_CHANGE (CHNG) et contrôle de fin de partie CHECK_GAME_OVER d'après le jeu (Gameflow_ApplyChange_50160,
// Gameflow_CheckLossConversations_50645), GAMEFLOW_SYSTEM.md § 5.4 et § 7.
// Les types ci-dessous ne servent qu'à compiler cet essai ; dans libRealSpace, seules les fonctions sont à reprendre.
#include <cstdint>
#include <cstdio>
#include <vector>

// Opérations des chunks CASH, OVER, WEAP, PILT
enum ChangeOp {
    CHANGE_ADD = 0,
    CHANGE_REMOVE = 1,
    CHANGE_REPLACE = 2
};

struct ChangeValue {
    uint8_t op;
    int32_t value;
};

struct ChangeWeapon {
    uint8_t op;
    uint8_t weap_id;
    int32_t value;
};

struct ChangePilot {
    uint8_t op;
    uint8_t pilot_id;
    uint8_t air;
    int32_t value;
};

struct CHNG {
    ChangeValue *cash{ nullptr };
    ChangeValue *over{ nullptr };
    std::vector<ChangeWeapon *> *weap{ nullptr };
    std::vector<ChangePilot *> *pilt{ nullptr };
};

struct GameStateLike {
    int32_t cash{ 0 };
    int32_t over_head{ 0 };
    int32_t weapon_inventory[9]{};
    int32_t kill_board[8][2]{};
    int32_t planes_lost_total{ 0 };
};

// CASH et OVER : pas de borne. WEAP et PILT : un retrait ne descend pas sous 0.
static int32_t applyOp(int32_t current, uint8_t op, int32_t value, bool clampAtZero) {
    switch (op) {
    case CHANGE_ADD:
        return current + value;
    case CHANGE_REMOVE:
        if (clampAtZero && value > current) {
            return 0;
        }
        return current - value;
    case CHANGE_REPLACE:
        return value;
    default:
        return current;
    }
}

// Le jeu applique la valeur du fichier directement sur l'argent. Les montants sont en milliers, comme
// le gain de mission (2e valeur de STAT) et le coût des avions perdus (500 par avion) : le ×1000 de
// libRealSpace, qui donne les vrais montants, s'applique de la même façon aux trois.
void applyChange(GameStateLike *state, const CHNG *chng) {
    if (chng->cash != nullptr) {
        state->cash = applyOp(state->cash, chng->cash->op, chng->cash->value, false);
    }
    if (chng->over != nullptr) {
        state->over_head = applyOp(state->over_head, chng->over->op, chng->over->value, false);
    }
    if (chng->weap != nullptr) {
        for (auto weapon : *chng->weap) {
            int32_t *stock = &state->weapon_inventory[weapon->weap_id];
            *stock = applyOp(*stock, weapon->op, weapon->value, true);
        }
    }
    if (chng->pilt != nullptr) {
        for (auto pilot : *chng->pilt) {
            int32_t *counter = &state->kill_board[pilot->pilot_id][pilot->air];
            *counter = applyOp(*counter, pilot->op, pilot->value, true);
        }
    }
}

// CHECK_GAME_OVER : renvoie la conversation de fin de partie (254, 255) ou 0 si la partie continue.
// Dans le jeu, une fin de partie arrête aussi le script et ramène au menu.
uint8_t checkGameOver(const GameStateLike *state) {
    if (state->planes_lost_total > 16) {
        return 254;
    }
    if (state->cash < 0) {
        return 255;
    }
    return 0;
}

int main() {
    // MISS 41 après MISN-12b (piste détruite) : APPLY_CHANGE 27 (argent remplacé par 0), puis APPLY_CHANGE 7
    // (argent − 2000 milliers), puis CHECK_GAME_OVER. Montants en milliers.
    GameStateLike state;
    state.cash = 150000;
    ChangeValue replaceByZero;
    replaceByZero.op = CHANGE_REPLACE;
    replaceByZero.value = 0;
    ChangeValue remove2000;
    remove2000.op = CHANGE_REMOVE;
    remove2000.value = 2000;
    CHNG change27;
    change27.cash = &replaceByZero;
    CHNG change7;
    change7.cash = &remove2000;
    applyChange(&state, &change27);
    applyChange(&state, &change7);
    printf("argent %d milliers, conversation de fin %d (attendu -2000, 255)\n", state.cash, checkGameOver(&state));
    return 0;
}
