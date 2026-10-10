#pragma once
#include <cstdint>
#include <cstddef>
#include <vector>
#include "SCArchive.h"
struct PakEntry {
    uint8_t *data;
    size_t size;
};
class PakArchive {
    std::vector<std::vector<uint8_t>> recs;
    std::vector<PakEntry> ents;

public:
    void InitFromRAM(const char *, uint8_t *data, size_t size) {
        SCArchive a;
        if (!a.open(data, size)) {
            return;
        }
        recs.resize(a.count());
        ents.resize(a.count());
        for (uint32_t i = 0; i < a.count(); i++) {
            a.record(i, recs[i]);
            ents[i] = {
                recs[i].data(),
                recs[i].size()
            };
        }
    }
    size_t GetNumEntries() {
        return ents.size();
    }
    PakEntry *GetEntry(size_t i) {
        return i < ents.size() ? &ents[i] : nullptr;
    }
};
