#pragma once
#include <cstdint>
#include <cstddef>
#include <string>
#include <vector>
#include <map>
struct TreEntry { uint8_t *data; size_t size; };
class AssetManager {
public:
    static AssetManager &instance() { static AssetManager a; return a; }
    std::string dir; std::map<std::string, std::vector<uint8_t>> files; std::map<std::string, TreEntry> entries;
    TreEntry *GetEntryByName(const char *name);
};
