#include "AssetManager.h"
#include <cstdio>
TreEntry *AssetManager::GetEntryByName(const char *name) {
    std::string n = name;
    n = n.substr(n.rfind('\\') + 1);
    std::string file = n;
    if (n == "AMUSIC.PAK" || n == "GAMEFLOW.ADL" || n == "SOUNDFX.ADL") {
        file = "COMBAT.ADL"; // substituts de test
    }
    if (!entries.count(n)) {
        FILE *f = fopen((dir + "/" + file).c_str(), "rb");
        if (!f) {
            return nullptr;
        }
        std::vector<uint8_t> b;
        int c;
        while ((c = fgetc(f)) != EOF) {
            b.push_back((uint8_t)c);
        }
        fclose(f);
        files[n] = b;
        entries[n] = {
            files[n].data(),
            files[n].size()
        };
    }
    return &entries[n];
}
