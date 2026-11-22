# Introduction de la version CD-ROM (THEFLIC.FLX) : proposition pour libRealSpace

L'animation d'introduction de la version CD-ROM, `DATA\FLIC\THEFLIC.FLX`, est jouée par `MENU.EXE`
avant le menu qui choisit entre Strike Commander et Tactical Operations (`analysis/menu_cd/README.md`).
libRealSpace n'a aucune classe pour ce format : la proposition ajoute deux classes et ne touche aux
fichiers existants que pour les brancher.

- Format du fichier : `analysis/menu_cd/FLX_FORMAT.md`.
- Comportement du lecteur du jeu (cadence, sons, musique, fin) : `analysis/menu_cd/README.md` § 2.
- Fichiers complets, sous leur chemin dans libRealSpace : `tools/flic_ref/librealspace/src/`.
- Vérification : `tools/flic_ref/build.sh <dossier libRealSpace>` compile `RSFlic` et l'essai
  `flic_test`, puis vérifie que tout `strike_commander`, `RSFlic`, `RSMusic`, `RSMixer` et le `main.cpp`
  du jeu compilent avec les fichiers modifiés (libRealSpace `c5fa505`).
- Essai sur les données : `flic_test <THEFLIC.FLX>` décode les 943 images ; leurs empreintes sont
  identiques, image par image, à celles du décodeur de référence `tools/flx_render.py --empreintes`.

## 1. Ce qui change

| Fichier | Changement |
|---|---|
| `src/realspace/RSFlic.h`, `RSFlic.cpp` | **nouveau** : lecture du fichier et décodage des images (indices et palette) |
| `src/strike_commander/SCFlicPlayer.h`, `SCFlicPlayer.cpp` | **nouveau** : activité qui joue l'intro (cadence, sons, musique, touches) |
| `src/realspace/RSMusic.h` | accesseur `GetMidgamesPak()` (le PAK de musique de l'appareil choisit la version de la musique de l'intro) |
| `src/realspace/precomp.h` | `#include "RSFlic.h"` |
| `src/strike_commander/precomp.h` | `#include "SCFlicPlayer.h"` |
| `src/executables/sc/main.cpp` | l'intro est empilée en dernier, donc jouée en premier, quand le fichier existe |

Réutilisé tel quel : `PakArchive` (`FLIC.PAK`), `LZBuffer::DecodeLZW` (images clés, même LZW que les
PAK), `VGAPalette::ReadPatch` (la palette du fichier a le format des palettes du jeu), `RSMixer::playMusic`
(une entrée XMIDI complète, `FORM XDIR` puis `CAT XMID`), `RSMixer::playSoundVoc` (VOC), `RSVGA`
(écran 320 × 200 indexé), `IActivity` et `GameEngine::stopTopActivity`.

Pourquoi pas `RLEShape` : il lit le format d'image des PAK (fragments), pas le format par lignes des
images partielles de l'animation (`FLX_FORMAT.md` § 2.2, affichage 0).

## 2. RSFlic : le fichier et ses images

Données seulement, sans SDL ni OpenGL. `InitFromRAM` lit la table ; chaque `DecodeNextFrame` traite
les enregistrements jusqu'à la prochaine image et la dessine dans `screen` ; `palette` est la palette
courante, `paletteChanged` dit si une palette vient d'être lue, `frameCount` compte les images
dessinées (c'est le compteur qui déclenche les sons).

Points à noter :

- **Bandes noires** : après une palette, les lignes 0 à 23 et 176 à 199 prennent la couleur la plus
  proche du noir. Le jeu cherche cette couleur avec sa fonction de recherche de couleur ; la mesure de
  distance de cette fonction n'a pas été lue : `DarkestColor` prend la somme des carrés.
- **Images par lignes** : dessinées par-dessus l'image précédente ; `screen` garde donc l'image d'une
  fois sur l'autre.
- **LZW** : `LZBuffer::DecodeLZW` garde chaque résultat en cache (clé MD5) et en reste propriétaire :
  le pointeur rendu ne se libère pas.
- **Non traité** (absent du fichier) : compression 2, doublement des pixels de l'affichage 1.

### 2.1 RSFlic.h

```cpp
//
//  RSFlic.h
//  libRealSpace
//
//  Animation d'introduction de la version CD-ROM (DATA\FLIC\THEFLIC.FLX), décodée comme MENU.EXE.
//  Format : strike_commander_re/analysis/menu_cd/FLX_FORMAT.md
//
#pragma once
#include <cstddef>
#include <cstdint>
#include <vector>

#include "../commons/LZBuffer.h"
#include "../engine/Texture.h"

class RSFlic {
public:
    static const int WIDTH = 320;
    static const int HEIGHT = 200;

    // Image courante (indices de palette) et palette courante, telles que l'écran du jeu les montre.
    uint8_t screen[WIDTH * HEIGHT]{};
    VGAPalette palette;
    // Vrai quand la dernière image décodée suit une nouvelle palette (le jeu éteint l'écran pendant
    // le changement de palette et le rallume après le dessin de cette image).
    bool paletteChanged{ false };
    // Nombre d'images déjà dessinées (compteur des sons de MENU.EXE, mot DGROUP:2690).
    int frameCount{ 0 };

    RSFlic();
    ~RSFlic();
    // Lit l'en-tête et la table des enregistrements ; data doit rester valide pendant la lecture.
    bool InitFromRAM(uint8_t *data, size_t size);
    // Traite les enregistrements jusqu'à la prochaine image et la dessine ; false à la fin du fichier.
    bool DecodeNextFrame(void);
    size_t GetNumRecords(void) const;

private:
    struct FlicRecord {
        uint8_t *data;
        size_t size;
    };
    std::vector<FlicRecord> records;
    size_t next{ 0 };
    LZBuffer lzw;

    void ApplyPalette(const FlicRecord &rec);
    void DrawFrame(const FlicRecord &rec);
    void DecodeBlocks(const uint8_t *src, size_t size, int firstRow);
    void DrawRows(const uint8_t *src, size_t size);
    void CopyRows(const uint8_t *src, size_t size, int firstRow);
    uint8_t DarkestColor(void) const;
};
```

### 2.2 RSFlic.cpp

```cpp
//
//  RSFlic.cpp
//  libRealSpace
//
//  Animation d'introduction de la version CD-ROM (DATA\FLIC\THEFLIC.FLX), décodée comme MENU.EXE.
//  Format : strike_commander_re/analysis/menu_cd/FLX_FORMAT.md ; adresses = MENU.EXE du CD-ROM.
//
#include "RSFlic.h"

#include <cstdio>
#include <cstring>

#include "../commons/ByteStream.h"

static uint32_t ReadU32(const uint8_t *p) {
    return (uint32_t)p[0] | ((uint32_t)p[1] << 8) | ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24);
}

static uint16_t ReadU16(const uint8_t *p) {
    return (uint16_t)(p[0] | (p[1] << 8));
}

RSFlic::RSFlic() {
}

RSFlic::~RSFlic() {
}

// En-tête de 128 octets : nombre d'enregistrements (u32 en 84), taille du fichier (u32 en 92) ; puis la
// table des enregistrements, (position u32, taille u32) chacun (lecteur 10576 : `shl ax, 3`).
bool RSFlic::InitFromRAM(uint8_t *data, size_t size) {
    this->records.clear();
    this->next = 0;
    this->frameCount = 0;
    this->paletteChanged = false;
    memset(this->screen, 0, sizeof(this->screen));
    if (data == nullptr || size < 128) {
        return false;
    }
    uint32_t count = ReadU32(data + 84);
    if (128 + (size_t)count * 8 > size) {
        printf("RSFlic: table des enregistrements hors du fichier (%u)\n", count);
        return false;
    }
    for (uint32_t i = 0; i < count; i++) {
        uint32_t offset = ReadU32(data + 128 + 8 * i);
        uint32_t length = ReadU32(data + 128 + 8 * i + 4);
        if (length == 0 || (size_t)offset + length > size) {
            printf("RSFlic: enregistrement %u hors du fichier\n", i);
            return false;
        }
        FlicRecord rec;
        rec.data = data + offset;
        rec.size = length;
        this->records.push_back(rec);
    }
    return true;
}

size_t RSFlic::GetNumRecords(void) const {
    return this->records.size();
}

// Boucle de 61691 : un enregistrement de type 0 annonce une palette (l'enregistrement suivant), un
// enregistrement de type 1 est une image (60188).
bool RSFlic::DecodeNextFrame(void) {
    this->paletteChanged = false;
    while (this->next < this->records.size()) {
        const FlicRecord &rec = this->records[this->next];
        this->next++;
        if (rec.data[0] == 0) {
            if (this->next >= this->records.size()) {
                return false;
            }
            this->ApplyPalette(this->records[this->next]);
            this->next++;
            this->paletteChanged = true;
            continue;
        }
        this->DrawFrame(rec);
        this->frameCount++;
        return true;
    }
    return false;
}

// Palette au format des palettes du jeu : premier indice et nombre de couleurs (u16), puis RVB sur
// 6 bits. Puis les bandes du haut et du bas (lignes 0 à 23 et 176 à 199) prennent la couleur la plus
// proche du noir (62966 à 63031 : recherche 33267, puis remplissage des deux rectangles).
void RSFlic::ApplyPalette(const FlicRecord &rec) {
    ByteStream stream;
    stream.Set(rec.data, rec.size);
    this->palette.ReadPatch(&stream);
    uint8_t dark = this->DarkestColor();
    memset(this->screen, dark, WIDTH * 24);
    memset(this->screen + WIDTH * 176, dark, WIDTH * 24);
}

uint8_t RSFlic::DarkestColor(void) const {
    int best = 0;
    int bestDistance = 1 << 30;
    for (int i = 0; i < 256; i++) {
        const Texel &c = this->palette.colors[i];
        int distance = c.r * c.r + c.g * c.g + c.b * c.b;
        if (distance < bestDistance) {
            bestDistance = distance;
            best = i;
        }
    }
    return (uint8_t)best;
}

// En-tête d'image (16 octets) : octet 1 = compression (0 aucune, 1 LZW du jeu), octet 2 = affichage
// (0 lignes, 1 copie, 2 blocs de 4 × 4), octet 3 = première ligne (24 : image de 320 × 152 entre les
// bandes ; 0 : plein écran).
void RSFlic::DrawFrame(const FlicRecord &rec) {
    if (rec.size < 16) {
        return;
    }
    uint8_t compression = rec.data[1];
    uint8_t display = rec.data[2];
    int firstRow = rec.data[3];
    const uint8_t *body = rec.data + 16;
    size_t bodySize = rec.size - 16;
    if (compression == 1) {
        size_t uncompressed = 0;
        body = this->lzw.DecodeLZW(body, bodySize, uncompressed);
        bodySize = uncompressed;
    } else if (compression != 0) {
        printf("RSFlic: compression %d non traitée\n", compression);
        return;
    }
    if (firstRow * 2 >= HEIGHT) {
        return;
    }
    if (display == 0) {
        this->DrawRows(body, bodySize);
    } else if (display == 1) {
        if (rec.data[4] != 0) {
            printf("RSFlic: affichage 1 avec doublement des pixels non traité\n");
            return;
        }
        this->CopyRows(body, bodySize, firstRow);
    } else if (display == 2) {
        this->DecodeBlocks(body, bodySize, firstRow);
    }
}

// Affichage 1 (60875) : l'image décompressée recouvre les lignes firstRow à 199 - firstRow.
void RSFlic::CopyRows(const uint8_t *src, size_t size, int firstRow) {
    size_t count = (size_t)WIDTH * (HEIGHT - 2 * firstRow);
    if (count > size) {
        count = size;
    }
    memcpy(this->screen + WIDTH * firstRow, src, count);
}

// Affichage 2 (15350) : blocs de 4 × 4 pixels, 80 par ligne de blocs, (200 - 2 × firstRow) / 4 lignes
// de blocs. Le 1er octet du flux est l'octet d'échappement : rencontré au début d'un bloc, il fait
// basculer entre blocs codés et blocs bruts. Bloc codé : deux couleurs c0, c1 ; c0 = c1 → bloc uni ;
// sinon un masque de 16 bits (octet bas : lignes 0 et 1, octet haut : lignes 2 et 3, bit de poids fort
// d'abord ; 1 = c1). Bloc brut : 16 pixels, ligne par ligne.
void RSFlic::DecodeBlocks(const uint8_t *src, size_t size, int firstRow) {
    if (size < 1) {
        return;
    }
    uint8_t escape = src[0];
    size_t p = 1;
    bool coded = true;
    int blockRows = (HEIGHT - 2 * firstRow) / 4;
    for (int by = 0; by < blockRows; by++) {
        for (int bx = 0; bx < 80; bx++) {
            if (p >= size) {
                return;
            }
            if (src[p] == escape) {
                coded = !coded;
                p++;
            }
            uint8_t *dst = this->screen + (firstRow + 4 * by) * WIDTH + 4 * bx;
            if (!coded) {
                if (p + 16 > size) {
                    return;
                }
                for (int y = 0; y < 4; y++) {
                    memcpy(dst + y * WIDTH, src + p, 4);
                    p += 4;
                }
                continue;
            }
            if (p + 2 > size) {
                return;
            }
            uint8_t c0 = src[p];
            uint8_t c1 = src[p + 1];
            if (c0 == c1) {
                p += 2;
                for (int y = 0; y < 4; y++) {
                    memset(dst + y * WIDTH, c0, 4);
                }
                continue;
            }
            if (p + 4 > size) {
                return;
            }
            uint16_t mask = ReadU16(src + p + 2);
            p += 4;
            for (int y = 0; y < 4; y++) {
                int shift = (y < 2) ? 7 - 4 * y : 15 - 4 * (y - 2);
                for (int x = 0; x < 4; x++) {
                    int bit = (mask >> (shift - x)) & 1;
                    dst[y * WIDTH + x] = bit ? c1 : c0;
                }
            }
        }
    }
}

// Affichage 0 (65708) : image par lignes dessinée en (0, 0) par-dessus l'image précédente. En-tête :
// drapeaux u16, largeur, hauteur, x, y (i16) ; puis un décalage u16 par ligne, compté depuis sa propre
// position. Une ligne : paires (pixels sautés, compteur) jusqu'à épuiser la largeur. Drapeau 1 :
// compteur impair = suite de compteur / 2 pixels d'une couleur (octet suivant), pair = compteur / 2
// pixels bruts ; sans le drapeau : compteur pixels bruts.
void RSFlic::DrawRows(const uint8_t *src, size_t size) {
    if (size < 10) {
        return;
    }
    uint16_t flags = ReadU16(src);
    int16_t w = (int16_t)ReadU16(src + 2);
    int16_t h = (int16_t)ReadU16(src + 4);
    int16_t x0 = (int16_t)ReadU16(src + 6);
    int16_t y0 = (int16_t)ReadU16(src + 8);
    if ((size_t)10 + 2 * (size_t)h > size) {
        return;
    }
    for (int row = 0; row < h; row++) {
        size_t entry = 10 + 2 * (size_t)row;
        size_t p = entry + ReadU16(src + entry);
        int y = row - y0;
        int x = -x0;
        int left = w;
        while (p < size) {
            int skip = src[p];
            p++;
            left -= skip;
            if (left <= 0) {
                break;
            }
            x += skip;
            if (p >= size) {
                return;
            }
            int count = src[p];
            p++;
            int n = (flags & 1) ? count >> 1 : count;
            bool run = (flags & 1) && (count & 1);
            for (int k = 0; k < n; k++) {
                uint8_t color;
                if (run) {
                    color = src[p];
                } else {
                    if (p + k >= size) {
                        return;
                    }
                    color = src[p + k];
                }
                int px = x + k;
                if (px >= 0 && px < WIDTH && y >= 0 && y < HEIGHT) {
                    this->screen[y * WIDTH + px] = color;
                }
            }
            p += run ? 1 : n;
            x += n;
            left -= n;
            if (left <= 0) {
                break;
            }
        }
    }
}
```

## 3. SCFlicPlayer : l'activité

- **Cadence** : une image toutes les 475 unités de l'horloge du jeu, soit 78,8 ms (12,7 images par
  seconde), la valeur que `MENU.EXE` choisit sur une machine rapide ; l'écran est présenté à chaque
  passage dans `runFrame`.
- **Palette** : celle de `RSFlic`, envoyée avec l'image. Le jeu éteint l'écran pendant un changement de
  palette et le rallume après l'image suivante ; envoyer la palette avec l'image donne le même résultat.
- **Sons** : `FLIC.PAK` entrées 0 à 13, selon le nombre d'images dessinées (`README.md` § 2.3), sur un
  seul canal : chaque son remplace le précédent.
- **Musique** : `FLIC.PAK` 15 (AdLib, `AMUSIC.PAK`), 16 (MT-32, `RMUSIC.PAK`), 17 (General MIDI,
  `MMUSIC.PAK`) : la carte son de `MENU.EXE` choisit entre les trois mêmes PAK de musique que `RSMixer`.
  Lancée avant la première image, une seule fois.
- **Fin** : dernière image, ou Échap, Espace, Entrée, bouton Retour de la manette (le jeu s'arrête sur
  n'importe quelle touche) ; la musique et le son sont coupés.

### 3.1 SCFlicPlayer.h

```cpp
//
//  SCFlicPlayer.h
//  libRealSpace
//
//  Animation d'introduction de la version CD-ROM (DATA\FLIC\THEFLIC.FLX), jouée comme MENU.EXE :
//  cadence, musique et sons numérisés de DATA\FLIC\FLIC.PAK.
//  strike_commander_re/analysis/menu_cd/FLX_FORMAT.md, analysis/IMPL_FLIC_INTRO.md
//
#pragma once
#include "../realspace/RSFlic.h"

class SCFlicPlayer : public IActivity {
private:
    RSFlic flic;
    PakArchive flicPak;
    MemMusic music{};
    bool started{ false };
    bool finished{ false };
    double nextFrameMs{ 0.0 };

    void PlaySoundForFrame(int frame);
    void Finish(void);

public:
    // Le fichier n'existe que dans les données de la version CD-ROM.
    static bool IsAvailable(void);

    SCFlicPlayer();
    ~SCFlicPlayer();
    virtual void init(void);
    virtual void runFrame(void);
};
```

### 3.2 SCFlicPlayer.cpp

```cpp
//
//  SCFlicPlayer.cpp
//  libRealSpace
//
//  Animation d'introduction de la version CD-ROM (DATA\FLIC\THEFLIC.FLX), jouée comme MENU.EXE.
//  strike_commander_re/analysis/menu_cd/FLX_FORMAT.md, analysis/IMPL_FLIC_INTRO.md ; adresses = MENU.EXE.
//
#include "precomp.h"
#include "SCFlicPlayer.h"

static const char *FLIC_FILE = "..\\..\\DATA\\FLIC\\THEFLIC.FLX";
static const char *FLIC_PAK = "..\\..\\DATA\\FLIC\\FLIC.PAK";

// Durée d'une image : 475 unités de l'horloge de MENU.EXE (72633 : 198 périodes du compteur à
// 1 193 182 Hz par unité), valeur choisie par 62497 sur une machine rapide.
static const double FRAME_MS = 475.0 * 198.0 * 1000.0 / 1193182.0;

// Sons numérisés : nombre d'images déjà dessinées → entrée de FLIC.PAK, -1 sans son (table en 65299,
// cibles 63400 à 64290). Le jeu ne les joue qu'avec une carte de son numérisé.
static int SoundEntryForFrame(int frame) {
    switch (frame) {
    case 1:
        return 0;
    case 128:
        return 10;
    case 151:
        return 1;
    case 165:
        return 2;
    case 215:
        return 3;
    case 230:
        return 12;
    case 265:
        return 11;
    case 305:
        return 4;
    case 360:
        return 5;
    case 385:
        return 11;
    case 415:
        return 11;
    case 550:
        return 6;
    case 680:
        return 7;
    case 705:
        return 8;
    case 760:
        return 9;
    case 830:
        return 13;
    default:
        return -1;
    }
}

// Un seul son numérisé à la fois : chaque nouveau son remplace le précédent.
static const int FLIC_SOUND_CHANNEL = 0;

bool SCFlicPlayer::IsAvailable(void) {
    AssetManager &assets = AssetManager::getInstance();
    return assets.GetEntryByName(FLIC_FILE) != nullptr;
}

SCFlicPlayer::SCFlicPlayer() {
}

SCFlicPlayer::~SCFlicPlayer() {
}

void SCFlicPlayer::init(void) {
    TreEntry *flicEntry = Assets.GetEntryByName(FLIC_FILE);
    if (flicEntry == nullptr || !this->flic.InitFromRAM(flicEntry->data, flicEntry->size)) {
        printf("SCFlicPlayer: %s illisible\n", FLIC_FILE);
        this->finished = true;
        return;
    }
    TreEntry *pakEntry = Assets.GetEntryByName(FLIC_PAK);
    if (pakEntry != nullptr) {
        this->flicPak.InitFromRAM("FLIC.PAK", pakEntry->data, pakEntry->size);
    }
    // Musique de l'intro selon la carte son (62523) : même choix que les PAK de musique de RSMixer.
    // Entrées 15 à 17 pour une image de 500 unités ou moins, 18 à 20 au-delà (non employées ici).
    size_t musicEntry = 15;
    if (Mixer.music != nullptr) {
        const std::string &pak = Mixer.music->GetMidgamesPak();
        if (pak == "RMUSIC.PAK") {
            musicEntry = 16;
        } else if (pak == "MMUSIC.PAK") {
            musicEntry = 17;
        }
    }
    if (this->flicPak.IsReady() && musicEntry < this->flicPak.GetNumEntries()) {
        PakEntry *entry = this->flicPak.GetEntry(musicEntry);
        this->music.data = entry->data;
        this->music.size = entry->size;
    }
}

void SCFlicPlayer::PlaySoundForFrame(int frame) {
    if (!this->flicPak.IsReady()) {
        return;
    }
    int sound = SoundEntryForFrame(frame);
    if (sound < 0 || (size_t)sound >= this->flicPak.GetNumEntries()) {
        return;
    }
    PakEntry *entry = this->flicPak.GetEntry(sound);
    Mixer.stopSound(FLIC_SOUND_CHANNEL);
    Mixer.playSoundVoc(entry->data, entry->size, FLIC_SOUND_CHANNEL);
}

void SCFlicPlayer::Finish(void) {
    if (this->started) {
        Mixer.stopSound(FLIC_SOUND_CHANNEL);
        Mixer.stopMusic();
    }
    this->finished = true;
    Game->stopTopActivity();
}

// Boucle de 62722 : une touche arrête l'animation ; sinon une image toutes les 475 unités, son
// numérisé selon le nombre d'images dessinées, palette montrée avec l'image qui la suit.
void SCFlicPlayer::runFrame(void) {
    if (this->finished) {
        Game->stopTopActivity();
        return;
    }
    Keyboard *kb = Game->getKeyboard();
    if (kb != nullptr) {
        bool skip = kb->isActionJustPressed(InputAction::KEY_ESCAPE);
        skip = skip || kb->isActionJustPressed(InputAction::KEY_SPACE);
        skip = skip || kb->isActionJustPressed(InputAction::KEY_RETURN);
        skip = skip || kb->isActionJustPressed(InputAction::CONTROLLER_BUTTON_BACK);
        if (skip) {
            this->Finish();
            return;
        }
    }
    double now = (double)SDL_GetTicks();
    if (!this->started) {
        this->started = true;
        this->nextFrameMs = now;
        if (this->music.data != nullptr) {
            Mixer.playMusic(&this->music, 1);
        }
    }
    if (now >= this->nextFrameMs) {
        if (!this->flic.DecodeNextFrame()) {
            this->Finish();
            return;
        }
        this->PlaySoundForFrame(this->flic.frameCount);
        this->nextFrameMs += FRAME_MS;
        if (now - this->nextFrameMs > FRAME_MS) {
            this->nextFrameMs = now;
        }
    }
    VGA.activate();
    memcpy(VGA.getFrameBuffer()->framebuffer, this->flic.screen, sizeof(this->flic.screen));
    VGA.setPalette(&this->flic.palette);
    VGA.vSync();
}
```

## 4. Fichiers existants modifiés

### 4.1 RSMusic.h : `GetMidgamesPak`

Ajouté dans la partie publique de `RSMusic`, après `init()` ; `midgames_pak` est le 2ᵉ argument du
constructeur (`AMUSIC.PAK`, `RMUSIC.PAK` ou `MMUSIC.PAK` selon l'appareil, `RSMixer::init`).

```cpp
    // PAK des musiques de cinématiques de l'appareil (AMUSIC.PAK, RMUSIC.PAK ou MMUSIC.PAK) : il désigne
    // aussi la version de la musique de l'introduction de la version CD-ROM (SCFlicPlayer).
    const std::string &GetMidgamesPak() const {
        return midgames_pak;
    }
```

### 4.2 precomp.h

`src/realspace/precomp.h`, après `#include "SCAnimationArchive.h"` :

```cpp
    #include "RSFlic.h"
```

`src/strike_commander/precomp.h`, après `#include "SCAnimationPlayer.h"` :

```cpp
#include "SCFlicPlayer.h"
```

### 4.3 main.cpp du jeu : `main`

Le moteur joue l'activité du dessus de la pile : empilée en dernier, l'intro passe avant la cinématique
`mid1` et le menu. `IsAvailable` ne trouve le fichier que dans les données du CD-ROM. Fonction entière :

```cpp
int main(int argc, char* argv[]) {
    Config &config = Config::getInstance();
    config.load("./assets/config.ini");
    GameTimer::getInstance().setTimer(std::make_unique<DesktopTimer>());
    
    RSScreen::setInstance(std::make_unique<RSScreen>());
    GameEngine::setInstance(std::make_unique<GameEngine>());

    RSScreen &screen = RSScreen::instance();
    Loader& loader = Loader::getInstance();
    AssetManager& assets = AssetManager::getInstance();
    
    int width = config.getInt("Window", "width", 800);
    int height = config.getInt("Window", "height", 600);
    bool fullscreen = config.getBool("Window", "fullscreen", false);
    screen.init(width,height,fullscreen);
    width = screen.width;
    height = screen.height;
    config.setInt("Window", "width", width);
    config.setInt("Window", "height", height);
    screen.is_spfx_finished = false;
    while (!screen.is_spfx_finished) {
        screen.fxTurnOnTv();
        screen.refresh();
        SDL_PumpEvents();
    }
    assets.SetBase("./assets");
    loader.init();
    // Load all TREs and PAKs
    loader.startLoading([](Loader* loader) {
        AssetManager& assets = AssetManager::getInstance();
        loader->setProgress(0.0f);
        if (FLOPPY) {
            std::vector<std::string> treFiles = {
                "GAMEFLOW.TRE",
                "OBJECTS.TRE",
                "MISC.TRE",
                "SOUND.TRE",
                "MISSIONS.TRE",
                "TEXTURES.TRE"
            };
            assets.init(treFiles);
        } else {
            std::vector<std::string> cdTreFiles = {
                "BIGTRE.TRE",
                "LILTRE.TRE",
                "VOCLIST.TRE"
            };
            assets.ReadISOImage("./SC.DAT");
            assets.init(cdTreFiles);
        }
        loader->setProgress(50.0f);
        assets.intel_root_path = "..\\..\\DATA\\INTEL\\";
        assets.mission_root_path = "..\\..\\DATA\\MISSIONS\\";
        assets.object_root_path = "..\\..\\DATA\\OBJECTS\\";
        assets.sound_root_path = "..\\..\\DATA\\SOUND\\";
        assets.texture_root_path = "..\\..\\DATA\\TXM\\";
        assets.gameflow_root_path = "..\\..\\DATA\\GAMEFLOW\\";

        assets.gameflow_filename = assets.gameflow_root_path+"GAMEFLOW.IFF";
        assets.optshps_filename = assets.gameflow_root_path+"OPTSHPS.PAK";
        assets.optpals_filename = assets.gameflow_root_path+"OPTPALS.PAK";
        assets.optfont_filename = assets.gameflow_root_path+"OPTFONT.IFF";
        assets.navmap_filename = "..\\..\\DATA\\COCKPITS\\NAVMAP.IFF";
        assets.conv_pak_filename = assets.gameflow_root_path+"CONVSHPS.PAK";
        assets.option_filename = assets.gameflow_root_path+"OPTIONS.IFF";
        assets.conv_data_filename = assets.gameflow_root_path+"CONVDATA.IFF";
        assets.conv_pal_filename = assets.gameflow_root_path+"CONVPALS.PAK";
        assets.txm_filename = assets.texture_root_path+"TXMPACK.PAK";
        assets.acc_filename = assets.texture_root_path+"ACCPACK.PAK";
        assets.convpak_filename = assets.gameflow_root_path+"CONV.PAK";
        RSMixer::getInstance().init();
        loader->setProgress(60.0f);
        RSFontManager::getInstance().init();
        loader->setProgress(70.0f);
        // Load assets needed for Conversations (char and background)
        ConvAssetManager::getInstance().init();
        loader->setProgress(90.0f);
        RSSound::getInstance().init();
        loader->setProgress(100.0f);
    });
    while (!loader.isLoadingComplete()) {
        loader.runFrame();
        screen.refresh();
        SDL_PumpEvents();
    }
    GameEngine *game = &GameEngine::instance();
    game->init();
    //Add MainMenu activity on the game stack.
    SCMainMenu* main = new SCMainMenu();
    main->init();
    game->addActivity(main);
    SCAnimationPlayer *intro = new SCAnimationPlayer();
    intro->init();
    game->addActivity(intro);
    // Version CD-ROM : l'animation DATA\FLIC\THEFLIC.FLX passe avant tout le reste, comme dans MENU.EXE.
    if (SCFlicPlayer::IsAvailable()) {
        SCFlicPlayer *flic = new SCFlicPlayer();
        flic->init();
        game->addActivity(flic);
    }
    game->run();

    return EXIT_SUCCESS;
}
```

## 5. Points ouverts

- **Ordre sur le CD** : `MENU.EXE` joue l'animation puis son menu, et quitte avec un code qui dit quel jeu
  lancer. Si `mid1` est jouée ensuite au lancement de Strike Commander n'a pas été vérifié dans les
  exécutables du CD : la proposition garde l'ordre actuel de libRealSpace après l'intro.
- **Menu de choix du jeu** (`TOMENU.PAK`, codes de sortie 10 et 11) : non porté.
- **Cadence lente** (600 unités, musiques 18 à 20) : non employée ; le jeu ne la prend que sur une
  machine lente.
