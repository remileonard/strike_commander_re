// Lèvres et clignement des conversations (OPTEST.EXE disquette), code de référence : CONV_SYSTEM.md
// « Yeux et bouches » et § 7.4. Numéros d'image du jeu (libRealSpace : + 1).
// g++ -std=c++17 -o conv_lips conv_lips.cpp && ./conv_lips
#include <cstdint>
#include <cstdlib>
#include <string>

// Numéros d'image du jeu ; libRealSpace ajoute 1 (image vide en tête de chaque jeu d'images).
static const char *kCloseUpLipTable = "06891599098769362999252999";
static const char *kGroupLipTable = "04302500000340143000353000";

struct LipReader {
    std::string text;
    size_t cursor{ 0 };
};

// Texte de lèvres : texte brut du script (codes $ non remplacés), mis en minuscules.
void setLipText(LipReader &reader, const std::string &scriptText) {
    reader.text = scriptText;
    for (auto &c : reader.text) {
        if (c >= 'A' && c <= 'Z') {
            c = static_cast<char>(c - 'A' + 'a');
        }
    }
    reader.cursor = 0;
}

bool isLipTextDone(const LipReader &reader) {
    return reader.cursor >= reader.text.size();
}

static char charAt(const LipReader &reader, size_t index) {
    if (index < reader.text.size()) {
        return reader.text[index];
    }
    return '\0';
}

// Gros plan (03h) : une lecture par image de scène (10 par seconde). Renvoie -1 = pas de bouche.
int advanceCloseUpMouth(LipReader &reader) {
    int mouth = -1;
    char c = charAt(reader, reader.cursor);
    if (c == '\0') {
        return -1;
    }
    reader.cursor++;
    char next = charAt(reader, reader.cursor);
    if (c == 'e') {
        if (next < 'a' || next > 'z') {
            c = next;
            reader.cursor++;
        } else if (next == 'r') {
            mouth = 6;
            reader.cursor++;
        }
    } else if (c == 'h') {
        reader.cursor++;
    } else if (c == 't') {
        if (next == 'h') {
            mouth = 9;
            reader.cursor++;
        }
    } else if (c == 'c') {
        if (next == 'h') {
            mouth = 6;
            reader.cursor++;
        }
    }
    if (mouth == -1 && c >= 'a' && c <= 'z') {
        mouth = kCloseUpLipTable[c - 'a'] - '0' + 2;
    }
    return mouth;
}

// Personnage qui parle d'une scène de groupe (02h) : un caractère par image, sans règle.
int advanceGroupMouth(LipReader &reader) {
    char c = charAt(reader, reader.cursor);
    if (c == '\0') {
        return -1;
    }
    reader.cursor++;
    if (c < 'a' || c > 'z') {
        return -1;
    }
    return kGroupLipTable[c - 'a'] - '0' + 1;
}

// Image des yeux du gros plan, tirée à chaque image de scène. baseFrame = -1 si l'octet vaut 255.
int closeUpEyeFrame(int baseFrame) {
    if (baseFrame > 20) {
        return baseFrame;
    }
    if (std::rand() % 30 == 0) {
        return 12;
    }
    return baseFrame;
}

int main() {
    LipReader r;
    setLipText(r, "There, the cheer.");
    int frames = 0;
    while (!isLipTextDone(r)) {
        advanceCloseUpMouth(r);
        frames++;
    }
    return frames > 0 ? 0 : 1;
}
