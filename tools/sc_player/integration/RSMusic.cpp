//
//  RSMusic.cpp
//  libRealSpace
//
//  Created by Fabien Sanglard on 12/30/2013.
//  Copyright (c) 2013 Fabien Sanglard. All rights reserved.
//

#include "precomp.h"

static MemMusic *copyMusic(const uint8_t *src, size_t size) {
    uint8_t *data = new uint8_t[size];
    memcpy(data, src, size);
    MemMusic *music = new MemMusic();
    music->data = data;
    music->size = size;
    return music;
}

static bool isForm(const PakEntry *e) {
    return e != NULL && e->size >= 4 && memcmp(e->data, "FORM", 4) == 0;
}

void RSMusic::init() {
    PakArchive *pak = new PakArchive();
    TreEntry *entry = assetManager.GetEntryByName("..\\..\\DATA\\MIDGAMES\\AMUSIC.PAK");
    if (entry == NULL) {
        printf("RSMusic::init: Could not find ..\\..\\DATA\\MIDGAMES\\AMUSIC.PAK\n");
        return;
    }
    pak->InitFromRAM("..\\..\\DATA\\MIDGAMES\\AMUSIC.PAK", entry->data, entry->size);

    for (size_t i = 0; i < pak->GetNumEntries(); i++) {
        PakEntry *e = pak->GetEntry(i);
        MemMusic *music = copyMusic(e->data, e->size);
        musics[0].push_back(music);
        midgames_musics[0].push_back(music);
    }
    TreEntry *gameflow = assetManager.GetEntryByName("..\\..\\DATA\\SOUND\\GAMEFLOW.ADL");
    if (gameflow == NULL) {
        printf("RSMusic::init: Could not find ..\\..\\DATA\\SOUND\\GAMEFLOW.ADL\n");
        return;
    }
    pak = new PakArchive();
    pak->InitFromRAM("..\\..\\DATA\\SOUND\\GAMEFLOW.ADL", gameflow->data, gameflow->size);
    for (size_t i = 0; i < pak->GetNumEntries(); i++) {
        PakEntry *e = pak->GetEntry(i);
        PakArchive *subpak = new PakArchive();
        subpak->InitFromRAM("..\\..\\DATA\\SOUND\\GAMEFLOW.ADL", e->data, e->size);
        if (i > 0) {
            for (size_t t = 0; t < gameflow_musics[0].size(); t++) {
                gameflow_musics[i].push_back(gameflow_musics[0][t]);
            }
        }
        for (size_t j = 0; j < subpak->GetNumEntries(); j++) {
            PakEntry *sub = subpak->GetEntry(j);
            if (sub->data[0] != 'F') {
                continue;
            }
            MemMusic *music = copyMusic(sub->data, sub->size);
            musics[1].push_back(music);
            gameflow_musics[i].push_back(music);
        }
    }

    loadCombat();
    loadSoundFx();

    TreEntry *lib = assetManager.GetEntryByName("..\\..\\DATA\\SOUND\\STRIKE.AD");
    if (lib == NULL) {
        // Sans bibliotheque, les sequences s'enchainent mais aucune note ne sonne.
        printf("RSMusic::init: Could not find ..\\..\\DATA\\SOUND\\STRIKE.AD (no timbre bank: music will be silent)\n");
    } else {
        timbre_data.assign(lib->data, lib->data + lib->size);
        timbres.set(timbre_data.data(), timbre_data.size());
    }
}

// COMBAT.ADL (verifie sur le vrai fichier) :
//   fichier : une entree par jeu de musique (le vrai fichier : 1)
//   jeu     : [0] = archive des pistes de liaison, [1..N] = pistes principales (FORM XDIR + CAT XMID)
// COMBAT.DAT, enregistrement 0 : longueurs de phrase, matrice de transition, entrees de liaison
//   (AudioQueue_LoadTrackTable_AACA6, AudioQueue_LoadTransitionTable_AAFA0).
void RSMusic::loadCombat() {
    TreEntry *dat = assetManager.GetEntryByName("..\\..\\DATA\\SOUND\\COMBAT.DAT");
    TreEntry *combat = assetManager.GetEntryByName("..\\..\\DATA\\SOUND\\COMBAT.ADL");
    if (combat == NULL || dat == NULL) {
        printf("RSMusic::init: Could not find ..\\..\\DATA\\SOUND\\COMBAT.ADL / COMBAT.DAT\n");
        return;
    }
    PakArchive *datpak = new PakArchive();
    datpak->InitFromRAM("..\\..\\DATA\\SOUND\\COMBAT.DAT", dat->data, dat->size);

    PakArchive *pak = new PakArchive();
    pak->InitFromRAM("..\\..\\DATA\\SOUND\\COMBAT.ADL", combat->data, combat->size);
    for (size_t i = 0; i < pak->GetNumEntries(); i++) {
        SCMusicSet set;
        PakEntry *rec = datpak->GetNumEntries() > 0
                            ? datpak->GetEntry(i < datpak->GetNumEntries() ? i : 0) : NULL;
        if (rec == NULL || !set.parseDat(rec->data, rec->size)) {
            printf("RSMusic::init: COMBAT.DAT: unexpected format\n");
        }
        PakEntry *e = pak->GetEntry(i);
        PakArchive *setpak = new PakArchive();
        setpak->InitFromRAM("..\\..\\DATA\\SOUND\\COMBAT.ADL", e->data, e->size);
        for (size_t j = 1; j < setpak->GetNumEntries(); j++) {          // pistes principales
            PakEntry *t = setpak->GetEntry(j);
            if (t == NULL) continue;
            set.tracks.emplace_back(t->data, t->data + t->size);
            MemMusic *music = copyMusic(t->data, t->size);
            musics[2].push_back(music);
            combat_musics[i].push_back(music);
        }
        if (setpak->GetNumEntries() > 0) {                              // pistes de liaison
            PakEntry *l = setpak->GetEntry(0);
            PakArchive *linkpak = new PakArchive();
            linkpak->InitFromRAM("..\\..\\DATA\\SOUND\\COMBAT.ADL", l->data, l->size);
            for (size_t k = 0; k < linkpak->GetNumEntries(); k++) {
                PakEntry *lt = linkpak->GetEntry(k);
                if (lt == NULL) set.linkTracks.emplace_back();
                else set.linkTracks.emplace_back(lt->data, lt->data + lt->size);
            }
        }
        if ((int)set.tracks.size() < set.trackCount) {
            printf("RSMusic::init: COMBAT.ADL set %zu: %zu tracks, COMBAT.DAT expects %d\n",
                   i, set.tracks.size(), set.trackCount);
        }
        combat_sets.push_back(std::move(set));
    }
}

// Ajoute a out chaque sequence XMIDI (entree commencant par "FORM") trouvee dans pak,
// en descendant dans les sous-archives.
void RSMusic::collectTracks(PakArchive *pak, const char *name, std::vector<MemMusic *> &out, int depth) {
    for (size_t j = 0; j < pak->GetNumEntries(); j++) {
        PakEntry *sub = pak->GetEntry(j);
        if (sub == NULL || sub->size == 0) continue;
        if (isForm(sub)) {
            out.push_back(copyMusic(sub->data, sub->size));
        } else if (depth < 4) {
            PakArchive *subpak = new PakArchive();
            subpak->InitFromRAM(name, sub->data, sub->size);
            collectTracks(subpak, name, out, depth + 1);
        }
    }
}

void RSMusic::loadSoundFx() {
    TreEntry *soundfx = assetManager.GetEntryByName("..\\..\\DATA\\SOUND\\SOUNDFX.ADL");
    if (soundfx == NULL) {
        printf("RSMusic::init: Could not find ..\\..\\DATA\\SOUND\\SOUNDFX.ADL\n");
        return;
    }
    PakArchive *pak = new PakArchive();
    pak->InitFromRAM("..\\..\\DATA\\SOUND\\SOUNDFX.ADL", soundfx->data, soundfx->size);
    for (size_t i = 0; i < pak->GetNumEntries(); i++) {
        PakEntry *e = pak->GetEntry(i);
        if (e == NULL || e->size == 0) continue;
        if (isForm(e)) {
            soundfx_musics[i].push_back(copyMusic(e->data, e->size));
            continue;
        }
        PakArchive *subpak = new PakArchive();
        subpak->InitFromRAM("..\\..\\DATA\\SOUND\\SOUNDFX.ADL", e->data, e->size);
        collectTracks(subpak, "..\\..\\DATA\\SOUND\\SOUNDFX.ADL", soundfx_musics[i], 0);
    }
}

void RSMusic::SwitchBank(uint8_t bank) {
    if (this->bank == bank) {
        return;
    }
    this->bank = bank;
}
MemMusic *RSMusic::GetMusic(uint32_t index) { 
    if (musics.find(bank) == musics.end()) {
        return NULL;
    }
    if (index >= musics[bank].size()) {
        return NULL;
    }
    return musics[bank][index]; 
}
