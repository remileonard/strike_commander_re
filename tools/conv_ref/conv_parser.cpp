// Parseur de référence des scripts de conversation (CONV.PAK) : une boucle de premier niveau,
// un sous-parseur par commande, erreur au premier octet invalide. CONV_SYSTEM.md § 9.2 et § 9.3.
// ./conv_parser v <export>/cd/*.bin   ./conv_parser s <export>/disquette/*.bin
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <set>
#include <string>
#include <vector>

enum class ConvFormat {
    Floppy,
    Cd,
    Unknown
};

// Un enregistrement du script, dans l'ordre de lecture. level 0 = commande de premier niveau,
// level 1 = sous-commande (01h, 02h, 0Ah après 00h ; 04h, 0Ah, 0Bh après 03h).
struct ConvRecord {
    size_t offset{ 0 };
    uint8_t op{ 0 };
    int level{ 0 };
    std::string name;
    std::string background;
    uint8_t baseFrame{ 0 };
    int16_t x{ 0 };
    int16_t y{ 0 };
    uint8_t color{ 0 };
    std::string voice;
    std::string text;
    uint16_t value{ 0 };
};

struct ConvParseResult {
    bool ok{ false };
    size_t errorOffset{ 0 };
    std::string error;
    std::vector<ConvRecord> records;
};

class ConvScriptParser {
public:
    ConvScriptParser(const uint8_t *data, size_t size, ConvFormat format)
        : data(data), size(size), format(format) {
    }

    // Boucle de premier niveau : chaque commande appelle son sous-parseur.
    ConvParseResult parse() {
        result = ConvParseResult();
        pos = 0;
        while (pos < size) {
            size_t at = pos;
            uint8_t op = data[pos];
            pos++;
            bool ok = false;
            switch (op) {
            case 0x00:
                ok = parseGroupShot(at);
                break;
            case 0x03:
                ok = parseCloseUp(at);
                break;
            case 0x0A:
                // Commande de premier niveau seulement dans la version CD (§ 8.6).
                if (format == ConvFormat::Cd) {
                    ok = parseNarration(at, 0);
                } else {
                    ok = fail(at, "octet qui n'est pas une commande");
                }
                break;
            case 0x0C:
                ok = parseJump(at, op, 0);
                break;
            case 0x0E:
                ok = parseWing(at);
                break;
            case 0x0F:
            case 0x10:
            case 0x12:
                ok = addSimple(at, op);
                break;
            default:
                ok = fail(at, "octet qui n'est pas une commande");
                break;
            }
            if (!ok) {
                return result;
            }
        }
        if (!checkJumps()) {
            return result;
        }
        result.ok = true;
        return result;
    }

private:
    const uint8_t *data;
    size_t size;
    ConvFormat format;
    size_t pos{ 0 };
    ConvParseResult result;

    bool fail(size_t at, const char *message) {
        result.ok = false;
        result.errorOffset = at;
        result.error = message;
        return false;
    }

    bool need(size_t count) {
        if (pos + count > size) {
            return fail(pos, "champ au-delà de la fin du script");
        }
        return true;
    }

    bool readByte(uint8_t &value) {
        if (!need(1)) {
            return false;
        }
        value = data[pos];
        pos++;
        return true;
    }

    bool readWord(uint16_t &value) {
        if (!need(2)) {
            return false;
        }
        value = static_cast<uint16_t>(data[pos] | (data[pos + 1] << 8));
        pos += 2;
        return true;
    }

    bool readSignedWord(int16_t &value) {
        uint16_t raw = 0;
        if (!readWord(raw)) {
            return false;
        }
        value = static_cast<int16_t>(raw);
        return true;
    }

    // Nom de 9 octets complété par des 0.
    bool readName(std::string &value) {
        if (!need(9)) {
            return false;
        }
        value.clear();
        for (size_t i = 0; i < 9 && data[pos + i] != 0; i++) {
            value.push_back(static_cast<char>(data[pos + i]));
        }
        pos += 9;
        return true;
    }

    bool readString(std::string &value) {
        value.clear();
        while (pos < size) {
            uint8_t c = data[pos];
            pos++;
            if (c == 0) {
                return true;
            }
            value.push_back(static_cast<char>(c));
        }
        return fail(pos, "chaîne sans 0 final");
    }

    // [voix] au format CD, puis texte.
    bool readText(ConvRecord &record) {
        if (format == ConvFormat::Cd && !readString(record.voice)) {
            return false;
        }
        return readString(record.text);
    }

    bool peekIs(uint8_t value) {
        return pos < size && data[pos] == value;
    }

    bool begin(ConvRecord &record, size_t at, uint8_t op, int level) {
        record.offset = at;
        record.op = op;
        record.level = level;
        return true;
    }

    bool addSimple(size_t at, uint8_t op) {
        ConvRecord record;
        begin(record, at, op, 0);
        result.records.push_back(record);
        return true;
    }

    bool parseJump(size_t at, uint8_t op, int level) {
        ConvRecord record;
        begin(record, at, op, level);
        if (!readWord(record.value)) {
            return false;
        }
        result.records.push_back(record);
        return true;
    }

    bool parseWing(size_t at) {
        ConvRecord record;
        begin(record, at, 0x0E, 0);
        uint8_t screen = 0;
        uint8_t wing = 0;
        if (!readByte(screen) || !readByte(wing)) {
            return false;
        }
        record.value = static_cast<uint16_t>(screen | (wing << 8));
        result.records.push_back(record);
        return true;
    }

    bool parseNarration(size_t at, int level) {
        ConvRecord record;
        begin(record, at, 0x0A, level);
        if (!readByte(record.color) || !readText(record)) {
            return false;
        }
        result.records.push_back(record);
        return true;
    }

    // 00h : décor, puis les 01h, puis les 02h / 0Ah.
    bool parseGroupShot(size_t at) {
        ConvRecord shot;
        begin(shot, at, 0x00, 0);
        if (!readName(shot.background)) {
            return false;
        }
        result.records.push_back(shot);
        while (peekIs(0x01)) {
            ConvRecord extra;
            begin(extra, pos, 0x01, 1);
            pos++;
            if (!readName(extra.name) || !readSignedWord(extra.x) || !readSignedWord(extra.y)) {
                return false;
            }
            result.records.push_back(extra);
        }
        while (peekIs(0x02) || peekIs(0x0A)) {
            size_t sub = pos;
            uint8_t op = data[pos];
            pos++;
            if (op == 0x0A) {
                if (!parseNarration(sub, 1)) {
                    return false;
                }
                continue;
            }
            ConvRecord talk;
            begin(talk, sub, 0x02, 1);
            if (!readName(talk.name) || !readSignedWord(talk.x) || !readSignedWord(talk.y) || !readByte(talk.color) ||
                !readText(talk)) {
                return false;
            }
            result.records.push_back(talk);
        }
        return true;
    }

    // 03h : visage, image de base, décor, x, y, texte, couleur ; puis les 04h / 0Ah / 0Bh.
    bool parseCloseUp(size_t at) {
        ConvRecord line;
        begin(line, at, 0x03, 0);
        if (!readName(line.name) || !readByte(line.baseFrame) || !readName(line.background) ||
            !readSignedWord(line.x) || !readSignedWord(line.y) || !readText(line) || !readByte(line.color)) {
            return false;
        }
        result.records.push_back(line);
        while (peekIs(0x04) || peekIs(0x0A) || peekIs(0x0B)) {
            size_t sub = pos;
            uint8_t op = data[pos];
            pos++;
            bool ok = false;
            if (op == 0x04) {
                ConvRecord next;
                begin(next, sub, 0x04, 1);
                ok = readText(next);
                if (ok) {
                    result.records.push_back(next);
                }
            } else if (op == 0x0A) {
                ok = parseNarration(sub, 1);
            } else {
                ok = parseJump(sub, 0x0B, 1);
            }
            if (!ok) {
                return false;
            }
        }
        return true;
    }

    // 0Bh / 0Ch : la destination (fin du mot + valeur) doit être une commande ou la fin du script.
    bool checkJumps() {
        std::set<size_t> starts;
        for (const auto &record : result.records) {
            starts.insert(record.offset);
        }
        for (const auto &record : result.records) {
            if (record.op != 0x0B && record.op != 0x0C) {
                continue;
            }
            size_t target = record.offset + 3 + record.value;
            if (target != size && starts.count(target) == 0) {
                return fail(record.offset, "saut hors d'une commande");
            }
        }
        return true;
    }
};

// Test du format, avant de lire la conversation : on regarde seulement son premier texte.
//
// Au format CD, ce premier texte commence par une chaîne de voix : vide, ou un identifiant de 1 à 8
// lettres ou chiffres (« 3gw009 », « Z1ai020 »), puis vient le texte. Au format disquette, la
// première chaîne est déjà le texte, qui contient des espaces ou de la ponctuation. Chaque
// hypothèse est aussi vérifiée sur les octets qui suivent : après le texte, le champ couleur
// (03h) puis une commande valide, ou la fin du script.
class ConvFormatDetector {
public:
    ConvFormatDetector(const uint8_t *data, size_t size)
        : data(data), size(size) {
    }

    ConvFormat detect() {
        size_t text = 0;
        uint8_t kind = 0;
        if (!findFirstText(text, kind)) {
            return ConvFormat::Unknown;
        }
        size_t firstEnd = 0;
        if (!stringEnd(text, firstEnd)) {
            return ConvFormat::Unknown;
        }
        bool floppy = followsText(firstEnd + 1, kind);
        bool cd = false;
        size_t secondEnd = 0;
        if (looksLikeVoice(text, firstEnd) && stringEnd(firstEnd + 1, secondEnd)) {
            cd = followsText(secondEnd + 1, kind);
        }
        if (cd && !floppy) {
            return ConvFormat::Cd;
        }
        if (floppy && !cd) {
            return ConvFormat::Floppy;
        }
        return ConvFormat::Unknown;
    }

private:
    const uint8_t *data;
    size_t size;

    // Saute les champs de taille fixe jusqu'au premier texte ; kind = commande qui le porte.
    bool findFirstText(size_t &text, uint8_t &kind) {
        size_t pos = 0;
        while (pos < size) {
            uint8_t op = data[pos];
            pos++;
            switch (op) {
            case 0x03:
                // visage (9), image (1), décor (9), x, y (4)
                text = pos + 23;
                kind = 0x03;
                return text < size;
            case 0x0A:
                // couleur (1)
                text = pos + 1;
                kind = 0x0A;
                return text < size;
            case 0x00:
                // décor (9), puis figurants 01h : nom (9), x, y (4)
                pos += 9;
                while (pos < size && data[pos] == 0x01) {
                    pos += 14;
                }
                if (pos < size && data[pos] == 0x02) {
                    // 02h, nom (9), x, y (4), couleur (1)
                    text = pos + 15;
                    kind = 0x02;
                    return text < size;
                }
                if (pos < size && data[pos] == 0x0A) {
                    text = pos + 2;
                    kind = 0x0A;
                    return text < size;
                }
                break;
            case 0x0C:
            case 0x0E:
                pos += 2;
                break;
            case 0x0F:
            case 0x10:
            case 0x12:
                break;
            default:
                return false;
            }
        }
        return false;
    }

    bool stringEnd(size_t start, size_t &end) {
        for (size_t i = start; i < size; i++) {
            if (data[i] == 0) {
                end = i;
                return true;
            }
        }
        return false;
    }

    // Identifiant de voix : chaîne vide, ou 1 à 8 lettres ou chiffres.
    bool looksLikeVoice(size_t start, size_t end) {
        if (end - start > 8) {
            return false;
        }
        for (size_t i = start; i < end; i++) {
            uint8_t c = data[i];
            bool digit = c >= '0' && c <= '9';
            bool letter = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
            if (!digit && !letter) {
                return false;
            }
        }
        return true;
    }

    static bool isTopLevel(uint8_t op) {
        switch (op) {
        case 0x00:
        case 0x03:
        case 0x0A:
        case 0x0C:
        case 0x0E:
        case 0x0F:
        case 0x10:
        case 0x12:
            return true;
        default:
            return false;
        }
    }

    // Ce qui doit suivre le texte d'une commande kind, à partir de pos.
    bool followsText(size_t pos, uint8_t kind) {
        if (kind == 0x03) {
            // couleur
            pos++;
        }
        if (pos == size) {
            return true;
        }
        if (pos > size) {
            return false;
        }
        uint8_t next = data[pos];
        if (isTopLevel(next)) {
            return true;
        }
        if (kind == 0x02) {
            return next == 0x02;
        }
        if (kind == 0x03) {
            return next == 0x04 || next == 0x0B;
        }
        return next == 0x02 || next == 0x04 || next == 0x0B;
    }
};

ConvFormat detectConvFormat(const uint8_t *data, size_t size) {
    ConvFormatDetector detector(data, size);
    return detector.detect();
}

// Test du format puis lecture, une seule fois, avec le lecteur du format trouvé.
ConvFormat parseConvScript(const uint8_t *data, size_t size, ConvParseResult &result) {
    ConvFormat format = detectConvFormat(data, size);
    if (format == ConvFormat::Unknown) {
        result = ConvParseResult();
        result.error = "format de conversation non reconnu";
        return format;
    }
    ConvScriptParser parser(data, size, format);
    result = parser.parse();
    return format;
}

int main(int argc, char **argv) {
    // argv[1] : v = fichiers au format CD, s = format disquette.
    int errors = 0;
    int records = 0;
    for (int i = 2; i < argc; i++) {
        FILE *f = std::fopen(argv[i], "rb");
        std::vector<uint8_t> buffer(1 << 16);
        size_t n = std::fread(buffer.data(), 1, buffer.size(), f);
        std::fclose(f);
        ConvFormat expected = ConvFormat::Floppy;
        if (argv[1][0] == 'v') {
            expected = ConvFormat::Cd;
        }
        ConvParseResult result;
        ConvFormat found = parseConvScript(buffer.data(), n, result);
        if (found == ConvFormat::Unknown || !result.ok) {
            std::printf("%s : erreur à %zu : %s\n", argv[i], result.errorOffset, result.error.c_str());
            errors++;
        } else if (found != expected) {
            std::printf("%s : mauvais format trouvé\n", argv[i]);
            errors++;
        }
        records += static_cast<int>(result.records.size());
    }
    std::printf("%d erreur(s), %d enregistrements, %d scripts\n", errors, records, argc - 2);
    return errors;
}
