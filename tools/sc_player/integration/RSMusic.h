//
//  RSMusic.h
//  libRealSpace
//
//  Created by Fabien Sanglard on 12/30/2013.
//  Copyright (c) 2013 Fabien Sanglard. All rights reserved.
//
//  Chargement des musiques. COMBAT.ADL + COMBAT.DAT donnent un SCMusicSet (pistes principales,
//  pistes de liaison, matrice de transition) pour SCMusicSequencer ; STRIKE.AD est la
//  bibliotheque de timbres du pilote AdLib (OPL simples + TVFX).
//  Structures : strike_commander_re/analysis/MUSIC_SYSTEM.md 2.3 et 2.4.
//
#pragma once
#include "precomp.h"
#include "SCMusicSet.h"
#include <stdint.h>
#include <vector>
#include <unordered_map>

struct MemMusic {
    uint8_t *data;
    size_t size;
};

class RSMusic {
private:
    std::vector<MemMusic *> gameflow_music;
    AssetManager &assetManager = AssetManager::instance();
    std::vector<uint8_t> timbre_data;   // copie de STRIKE.AD (SCTimbreLibrary ne fait que pointer dessus)
    void loadCombat();
    void loadSoundFx();
    void collectTracks(PakArchive *pak, const char *name, std::vector<MemMusic *> &out, int depth);
public:
    uint8_t bank{0};
    std::unordered_map<uint8_t, std::vector<MemMusic *>> midgames_musics;
    std::unordered_map<uint8_t, std::vector<MemMusic *>> combat_musics;
    std::unordered_map<uint8_t, std::vector<MemMusic *>> gameflow_musics;
    std::unordered_map<uint8_t, std::vector<MemMusic *>> musics;
    std::unordered_map<uint8_t, std::vector<MemMusic *>> soundfx_musics;

    // Jeux de musique de COMBAT.ADL (le vrai fichier en contient un seul : combat_sets[0]).
    std::vector<SCMusicSet> combat_sets;
    // STRIKE.AD : "strike." + suffixe "AD" du pilote ADLIB.ADV (Music_LoadTimbreFromLibrary_5A577)
    SCTimbreLibrary timbres;

    void init();
    void SwitchBank(uint8_t bank);
    MemMusic *GetMusic(uint32_t index);
};
