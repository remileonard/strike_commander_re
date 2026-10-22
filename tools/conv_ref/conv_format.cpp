// Test du format d'un script de conversation (CD avec voix / disquette) et lecture d'un texte
// sans heuristique : CONV_SYSTEM.md § 9.1. Remplacé par conv_parser.cpp (§ 9.3), qui fait le même test.
// ./conv_format v <export>/cd/*.bin   ./conv_format s <export>/disquette/*.bin
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <string>
#include <vector>

// Lecteur minimal d'un script de conversation, utilisé seulement pour choisir le format.
class ConvFormatProbe {
public:
    ConvFormatProbe(const uint8_t *data, size_t size, bool withVoice)
        : data(data), size(size), withVoice(withVoice) {
    }

    // Vrai si tout le script se lit dans ce format : commandes connues, champs complets.
    bool readsCleanly() {
        while (pos < size) {
            uint8_t op = data[pos];
            pos++;
            bool ok = false;
            if (op == 0x00) {
                ok = groupShot();
            } else if (op == 0x03) {
                ok = closeUp();
            } else if (op == 0x0C) {
                ok = skip(2);
            } else if (op == 0x0E) {
                ok = skip(2);
            } else if (op == 0x0F || op == 0x10) {
                ok = true;
            }
            if (!ok) {
                return false;
            }
        }
        return pos == size;
    }

private:
    const uint8_t *data;
    size_t size;
    bool withVoice;
    size_t pos{ 0 };

    bool skip(size_t count) {
        if (pos + count > size) {
            return false;
        }
        pos += count;
        return true;
    }

    bool string() {
        while (pos < size) {
            if (data[pos] == 0) {
                pos++;
                return true;
            }
            pos++;
        }
        return false;
    }

    // [voix] puis texte.
    bool text() {
        if (withVoice && !string()) {
            return false;
        }
        return string();
    }

    bool peekIs(uint8_t value) {
        return pos < size && data[pos] == value;
    }

    bool groupShot() {
        if (!skip(9)) {
            return false;
        }
        while (peekIs(0x01)) {
            if (!skip(1 + 9 + 4)) {
                return false;
            }
        }
        while (peekIs(0x02) || peekIs(0x0A)) {
            uint8_t op = data[pos];
            pos++;
            size_t fields = 1;
            if (op == 0x02) {
                fields = 9 + 4 + 1;
            }
            if (!skip(fields) || !text()) {
                return false;
            }
        }
        return true;
    }

    bool closeUp() {
        if (!skip(9 + 1 + 9 + 4) || !text() || !skip(1)) {
            return false;
        }
        while (peekIs(0x04) || peekIs(0x0A) || peekIs(0x0B)) {
            uint8_t op = data[pos];
            pos++;
            bool ok = false;
            if (op == 0x04) {
                ok = text();
            } else if (op == 0x0A) {
                ok = skip(1) && text();
            } else {
                ok = skip(2);
            }
            if (!ok) {
                return false;
            }
        }
        return true;
    }
};

enum class ConvFormat {
    Floppy,
    Cd,
    Unknown
};

// Choisi une fois, avant de parser le script.
ConvFormat detectConvFormat(const uint8_t *data, size_t size) {
    ConvFormatProbe cd(data, size, true);
    if (cd.readsCleanly()) {
        return ConvFormat::Cd;
    }
    ConvFormatProbe floppy(data, size, false);
    if (floppy.readsCleanly()) {
        return ConvFormat::Floppy;
    }
    return ConvFormat::Unknown;
}

// Lecture d'un texte une fois le format connu : [voix] si Cd, puis texte. Renvoie les octets lus.
size_t readConvText(const uint8_t *data, size_t avail, ConvFormat format, std::string &voice, std::string &text) {
    size_t used = 0;
    voice.clear();
    if (format == ConvFormat::Cd) {
        size_t length = strnlen(reinterpret_cast<const char *>(data), avail);
        voice.assign(reinterpret_cast<const char *>(data), length);
        used = length + 1;
    }
    size_t length = strnlen(reinterpret_cast<const char *>(data + used), avail - used);
    text.assign(reinterpret_cast<const char *>(data + used), length);
    used += length + 1;
    return used;
}

int main(int argc, char **argv) {
    int errors = 0;
    for (int i = 2; i < argc; i++) {
        FILE *f = std::fopen(argv[i], "rb");
        std::vector<uint8_t> buffer(1 << 16);
        size_t n = std::fread(buffer.data(), 1, buffer.size(), f);
        std::fclose(f);
        ConvFormat expected = ConvFormat::Floppy;
        if (argv[1][0] == 'v') {
            expected = ConvFormat::Cd;
        }
        if (detectConvFormat(buffer.data(), n) != expected) {
            std::printf("faux : %s\n", argv[i]);
            errors++;
        }
    }
    std::printf("%d erreur(s) sur %d scripts\n", errors, argc - 2);
    return errors;
}
