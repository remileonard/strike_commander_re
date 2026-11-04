//
//  File.cpp
//  libRealSpace
//
//  Created by fabien sanglard on 1/28/2014.
//  Copyright (c) 2014 Fabien Sanglard. All rights reserved.
//
//  TRAINING MISSION d'OPTEST.EXE (ovr190) : Training_TypeScreen_5547D et les écrans qu'il ouvre. Positions, images de
//  TM.SHP et textes : strike_commander_re/analysis/TRAINING_MISSION.md § 3.
//

#include "precomp.h"

// Panneau du bas (WidgetPanel_Construct_DAEB : 308 × 42 en (6, 153) ; écran du type d'avion : 308 × 79 en (6, 116)).
static const Point2D PANEL_LOW = {
    6,
    153,
};
static const Point2D PANEL_HIGH = {
    6,
    116,
};
// Espace entre deux lettres de FrameBuffer::printText (version à 4 arguments).
static const int TEXT_LETTER_GAP = 2;
// Stock d'armes de l'entraînement, posé par Training_Run_597B2 avant l'écran d'armement ([partie+609 + 2 × arme]), dans
// l'ordre des armes d'OPTEST (optest_weapon_ids) : SWINDERJ, SWINDERM, AGM-65D, DURANDAL, MK20, MK82, GBU-15G, POD, AMRAAM.
static const int16_t TRAINING_STOCK[9] = {
    6,
    6,
    12,
    12,
    24,
    24,
    4,
    8,
    6,
};
// Écran d'armement : écran 15 d'OPTIONS.IFF, scène 11 ([partie+252] = 11 posé par Training_Run_597B2), chargement par
// défaut 0 de GAMEFLOW.IFF (argument 0 de Gameflow_WeaponLoadout_51AB3), départ par le sprite 12.
static const uint8_t LOADOUT_OPTIONS_SCREEN = 15;
static const uint8_t LOADOUT_SCENE = 11;
static const uint8_t LOADOUT_DEFAULT_LOAD = 0;
static const uint8_t LOADOUT_SPRITE_FLY = 12;

SCTrainingMenu::SCTrainingMenu() {
    this->music_playing = false;
}

SCTrainingMenu::~SCTrainingMenu() {
    this->closeLoadout();
    for (auto button : this->buttons) {
        delete button;
    }
    this->buttons.clear();
    if (this->font != nullptr) {
        delete this->font;
        this->font = nullptr;
    }
}

void SCTrainingMenu::focus(void) {
    this->focused = true;
    if (!this->music_playing) {
        Mixer.switchBank(0);
        Mixer.playMusic(28);
        this->music_playing = true;
    }
    // Retour d'un vol d'entraînement : la mission n'a plus à être complétée, les écrans repartent du début.
    if (GameState.training_active) {
        GameState.training_active = false;
        this->restoreInventory();
        this->settings = MISN_TRAINING();
        this->group = 0;
        this->texts.clear();
        this->history.clear();
        this->showScreen(SCREEN_TYPE);
    }
}

void SCTrainingMenu::unFocus(void) {
    this->focused = false;
    if (this->music_playing) {
        Mixer.stopMusic();
        this->music_playing = false;
    }
}

// Départ du vol, pour les deux types : MISSIONS\TEMPLATE.IFF, complété par RSMission::addTraining dans
// SCMission::loadMission. Le nom est gardé : EnhancedTrainingMenu le redéfinit pour lancer EnhancedStrike.
void SCTrainingMenu::OnSearchAndDestroy() {
    SCStrike *strike = new SCStrike();
    strike->init();
    strike->player_loadout = this->player_loadout_pending;
    strike->setMission("TEMPLATE.IFF");
    Game->addActivity(strike);
}

void SCTrainingMenu::OnExitTraining(void) {
    GameState.training_active = false;
    this->restoreInventory();
    Game->stopTopActivity();
}

void SCTrainingMenu::init() {

    TreEntry *objViewPAK = Assets.GetEntryByName("..\\..\\DATA\\GAMEFLOW\\OBJVIEW.PAK");
    PakArchive assets;
    assets.InitFromRAM("OBJVIEW.PAK", objViewPAK->data, objViewPAK->size);

    // OBJVIEW.PAK : entrée 7 = palette, 6 = fond plein écran en (0, 0), 1 = bandeau « TRAINING MISSION » en (4, 3)
    // (Training_TypeScreen_5547D : `push 3` / `push 4` avant Shape_DrawSpans_32CD8).
    ByteStream paletteReader;
    paletteReader.Set(assets.GetEntry(7)->data, assets.GetEntry(7)->size);
    this->palette.ReadPatch(&paletteReader);

    PakEntry *backgroundPakEntry = assets.GetEntry(6);
    PakArchive bgPack;
    bgPack.InitFromRAM("OBJVIEW.PAK: file 6", backgroundPakEntry->data, backgroundPakEntry->size);
    background.init(bgPack.GetEntry(0)->data, bgPack.GetEntry(0)->size);

    PakEntry *titlePackEntry = assets.GetEntry(1);
    PakArchive titlePack;
    titlePack.InitFromRAM("", titlePackEntry->data, titlePackEntry->size);
    title.init(titlePack.GetEntry(0)->data, titlePack.GetEntry(0)->size);
    Point2D positionTitle = {
        4,
        3,
    };
    title.SetPosition(&positionTitle);

    // TM.SHP : les panneaux et les boutons de tous les écrans.
    TreEntry *trButtonsEntry = Assets.GetEntryByName("..\\..\\DATA\\GAMEFLOW\\TM.SHP");
    this->tm_pack.InitFromRAM("TM.SHP", trButtonsEntry->data, trButtonsEntry->size);

    // BWFONT.SHP : police chargée par Training_TypeScreen_5547D (absente de RSFontManager).
    TreEntry *fontEntry = Assets.GetEntryByName("..\\..\\DATA\\GAMEFLOW\\BWFONT.SHP");
    if (fontEntry != nullptr) {
        PakArchive fontPack;
        fontPack.InitFromRAM("BWFONT.SHP", fontEntry->data, fontEntry->size);
        this->font = new RSFont();
        this->font->InitFromPAK(&fontPack);
    }

    this->showScreen(SCREEN_TYPE);
}

// Un bouton : rectangle relatif au panneau, image normale `image`, image enfoncée `image + 1` (toutes les paires de
// TM.SHP se suivent), valeur rendue au clic. Le clic ne fait que noter la valeur : runFrame l'applique après
// checkButtons, car l'écran suivant remplace les boutons.
void SCTrainingMenu::addButton(Point2D panel, int x, int y, int width, int height, int image, int value) {
    SCButton *button = new SCButton();
    Point2D position = {
        panel.x + x,
        panel.y + y,
    };
    Point2D dimension = {
        width,
        height,
    };
    button->initBehavior(
        [this, value]() {
            this->choice_pending = true;
            this->choice = value;
        },
        position, dimension);
    button->appearance[SCButton::APR_UP].InitWithPosition(this->tm_pack.GetEntry(image)->data,
                                                          this->tm_pack.GetEntry(image)->size, &position);
    button->appearance[SCButton::APR_DOWN].InitWithPosition(this->tm_pack.GetEntry(image + 1)->data,
                                                            this->tm_pack.GetEntry(image + 1)->size, &position);
    this->buttons.push_back(button);
}

// Panneau et boutons de chaque écran (positions et images de TRAINING_MISSION.md § 3).
void SCTrainingMenu::showScreen(TrainingScreen next) {
    for (auto button : this->buttons) {
        delete button;
    }
    this->buttons.clear();
    this->screen = next;
    Point2D panel = PANEL_LOW;
    int panelImage = 0;
    switch (next) {
    case SCREEN_TYPE:
        panelImage = 0;
        this->addButton(panel, 16, 9, 136, 12, 1, 2);
        this->addButton(panel, 155, 9, 136, 12, 3, 1);
        this->addButton(panel, 155, 24, 65, 12, 5, CHOICE_CANCEL);
        break;
    case SCREEN_COUNT:
        panelImage = 7;
        for (int n = 0; n < 5; n++) {
            this->addButton(panel, 113 + 17 * n, 9, 14, 12, 8 + 2 * n, n + 1);
        }
        this->addButton(panel, 87, 24, 65, 12, 18, CHOICE_BACKUP);
        this->addButton(panel, 155, 24, 65, 12, 20, CHOICE_CANCEL);
        break;
    case SCREEN_PLANE: {
        panel = PANEL_HIGH;
        panelImage = 22;
        const int columns[4] = {
            9,
            77,
            145,
            235,
        };
        for (int n = 0; n < 16; n++) {
            this->addButton(panel, columns[n / 4], 7 + 13 * (n % 4), 65, 12, 23 + 2 * n, n + 1);
        }
        this->addButton(panel, 87, 61, 65, 12, 55, CHOICE_BACKUP);
        this->addButton(panel, 155, 61, 65, 12, 57, CHOICE_CANCEL);
        break;
    }
    case SCREEN_MORE:
        panelImage = 59;
        this->addButton(panel, 87, 9, 65, 12, 60, 1);
        this->addButton(panel, 155, 9, 65, 12, 62, 2);
        this->addButton(panel, 87, 24, 65, 12, 64, CHOICE_BACKUP);
        this->addButton(panel, 155, 24, 65, 12, 66, CHOICE_CANCEL);
        break;
    case SCREEN_ALTITUDE:
        panelImage = 68;
        for (int n = 0; n < 4; n++) {
            this->addButton(panel, 19 + 68 * n, 9, 65, 12, 69 + 2 * n, n + 1);
        }
        this->addButton(panel, 87, 24, 65, 12, 77, CHOICE_BACKUP);
        this->addButton(panel, 155, 24, 65, 12, 79, CHOICE_CANCEL);
        break;
    case SCREEN_LEVEL:
        panelImage = 81;
        for (int n = 0; n < 3; n++) {
            this->addButton(panel, 54 + 68 * n, 9, 65, 12, 82 + 2 * n, n + 1);
        }
        this->addButton(panel, 87, 24, 65, 12, 88, CHOICE_BACKUP);
        this->addButton(panel, 155, 24, 65, 12, 90, CHOICE_CANCEL);
        break;
    case SCREEN_ACCEPT:
        panelImage = 92;
        this->addButton(panel, 121, 9, 65, 12, 93, 1);
        this->addButton(panel, 87, 24, 65, 12, 95, CHOICE_BACKUP);
        this->addButton(panel, 155, 24, 65, 12, 97, CHOICE_CANCEL);
        break;
    }
    PakEntry *entry = this->tm_pack.GetEntry(panelImage);
    this->board.init(entry->data, entry->size);
    this->board.SetPosition(&panel);
}

// Largeur d'un texte écrit par FrameBuffer::printText, espace qui suit compris : x du texte écrit à sa suite.
int SCTrainingMenu::textWidth(const std::string &text) {
    if (this->font == nullptr || text.empty()) {
        return 0;
    }
    return VGA.getFrameBuffer()->getJustifiedTextWidth(this->font, text, TEXT_LETTER_GAP) + TEXT_LETTER_GAP;
}

// Training_PrintText_55BDC : texte écrit en (x, y), coin haut gauche. Renvoie le x qui suit le texte.
int SCTrainingMenu::addText(int x, int y, const std::string &text) {
    TrainingText line;
    line.position = {
        x,
        y,
    };
    line.text = text;
    this->texts.push_back(line);
    return x + this->textWidth(text);
}

// État avant un choix : rétabli par BACKUP sur l'écran suivant.
void SCTrainingMenu::pushStep() {
    TrainingStep step;
    step.screen = this->screen;
    step.settings = this->settings;
    step.group = this->group;
    step.text_count = this->texts.size();
    this->history.push_back(step);
}

// BACKUP : retour à l'écran précédent, avec les réglages et les textes d'avant son choix (dans le jeu, chaque écran
// est appelé par le précédent et rend 0 ; Training_EraseLastText_55C7B efface les textes de ce choix).
void SCTrainingMenu::backup() {
    if (this->history.empty()) {
        return;
    }
    TrainingStep step = this->history.back();
    this->history.pop_back();
    this->settings = step.settings;
    this->group = step.group;
    this->texts.resize(step.text_count);
    this->showScreen(step.screen);
}

void SCTrainingMenu::startFlight(bool with_loadout) {
    GameState.training = this->settings;
    GameState.training_active = true;
    this->player_loadout_pending = with_loadout;
    this->OnSearchAndDestroy();
}

void SCTrainingMenu::restoreInventory() {
    if (!this->inventory_saved) {
        return;
    }
    GameState.weapon_inventory = this->saved_inventory;
    this->saved_inventory.clear();
    this->inventory_saved = false;
}

// ACCEPT : stock de l'entraînement puis écran d'armement de la campagne (WeaponLoadoutScene, comme SCGameFlow pour la
// commande WEAPON_LOADOUT), avec la scène 11 et le chargement par défaut 0.
bool SCTrainingMenu::openLoadout() {
    if (!this->options_loaded) {
        TreEntry *optionIFF = Assets.GetEntryByName(Assets.option_filename);
        TreEntry *gameflowIFF = Assets.GetEntryByName(Assets.gameflow_filename);
        TreEntry *optShapEntry = Assets.GetEntryByName(Assets.optshps_filename);
        TreEntry *optPalettesEntry = Assets.GetEntryByName(Assets.optpals_filename);
        if (optionIFF == nullptr || gameflowIFF == nullptr || optShapEntry == nullptr || optPalettesEntry == nullptr) {
            return false;
        }
        this->options.InitFromRam(optionIFF->data, optionIFF->size);
        this->gameflow.InitFromRam(gameflowIFF->data, gameflowIFF->size);
        this->opt_shps.InitFromRAM("OPTSHPS.PAK", optShapEntry->data, optShapEntry->size);
        this->opt_pals.InitFromRAM("OPTPALS.PAK", optPalettesEntry->data, optPalettesEntry->size);
        this->options_loaded = true;
    }
    if (this->options.opts.find(LOADOUT_OPTIONS_SCREEN) == this->options.opts.end()) {
        return false;
    }
    if (!this->inventory_saved) {
        this->saved_inventory = GameState.weapon_inventory;
        this->inventory_saved = true;
    }
    GameState.weapon_inventory.clear();
    for (int i = 0; i < 9; i++) {
        GameState.weapon_inventory[optest_weapon_ids[i]] = TRAINING_STOCK[i];
    }
    this->loadout_scene.info.ID = LOADOUT_SCENE;
    this->loadout_scene.info.UNKOWN = 0;
    this->loadout_scene.requ = nullptr;
    this->loadout = new WeaponLoadoutScene(&this->opt_shps, &this->opt_pals);
    this->loadout->keep_music = true;
    this->zones = this->loadout->init(
        &this->loadout_scene, this->options.opts[LOADOUT_OPTIONS_SCREEN],
        std::bind(&SCTrainingMenu::onLoadoutClick, this, std::placeholders::_1, std::placeholders::_2));
    if (this->zones == nullptr) {
        this->closeLoadout();
        return false;
    }
    this->loadout->applyDefaultLoadout(this->gameflow.game.load, LOADOUT_DEFAULT_LOAD);
    return true;
}

void SCTrainingMenu::closeLoadout() {
    if (this->loadout != nullptr) {
        delete this->loadout;
        this->loadout = nullptr;
    }
    this->zones = nullptr;
    this->zone_pending = false;
}

// Clic sur une zone de l'écran d'armement : noté, appliqué par runFrame (les zones appartiennent à la scène).
void SCTrainingMenu::onLoadoutClick(std::vector<EFCT *> *script, uint8_t id) {
    this->zone_pending = true;
    this->zone_choice = id;
}

void SCTrainingMenu::applyChoice(int value) {
    if (value == CHOICE_CANCEL) {
        this->OnExitTraining();
        return;
    }
    if (value == CHOICE_BACKUP) {
        this->backup();
        return;
    }
    const char *levels[3] = {
        "rookie",
        "veteran",
        "ace",
    };
    int line = 67 + 12 * this->group;
    switch (this->screen) {
    case SCREEN_TYPE:
        this->pushStep();
        this->settings = MISN_TRAINING();
        this->settings.type = (uint8_t)value;
        this->group = 0;
        if (value == 1) {
            // Training_DogfightBriefing_58E2A
            this->addText(5, 43, "Mission Briefing: Air Superiority");
            this->addText(5, 55, "Intercept and engage inbound bogeys:");
            this->showScreen(SCREEN_COUNT);
        } else {
            // Training_SearchBriefing_58E74 : aucun réglage, validation directe.
            this->addText(5, 43, "Mission Briefing: Ground Attack");
            this->addText(5, 55, "Search and destroy enemy targets at");
            this->addText(5, 67, "pilot's discretion.  Refer to area");
            this->addText(5, 79, "map for enemy positions.");
            this->showScreen(SCREEN_ACCEPT);
        }
        break;
    case SCREEN_COUNT:
        this->pushStep();
        this->settings.group_count[this->group] = (uint8_t)value;
        this->addText(20, line, std::to_string(value));
        this->showScreen(SCREEN_PLANE);
        break;
    case SCREEN_PLANE: {
        this->pushStep();
        this->settings.group_plane[this->group] = (uint8_t)(value - 1);
        std::string name = RSMission::training_planes[value - 1].name;
        if (this->group == 2) {
            name += ".";
        }
        this->addText(30, line, name);
        if (this->group < 2) {
            this->showScreen(SCREEN_MORE);
        } else {
            this->addText(5, 103, "Altitude: ");
            this->showScreen(SCREEN_ALTITUDE);
        }
        break;
    }
    case SCREEN_MORE: {
        this->pushStep();
        int x = 30 + this->textWidth(RSMission::training_planes[this->settings.group_plane[this->group]].name);
        if (value == 1) {
            // MORE : « , » après le 1er groupe, « , and » après le 2e.
            this->addText(x, line, this->group == 1 ? ", and" : ",");
            this->group++;
            this->showScreen(SCREEN_COUNT);
        } else {
            // ENOUGH
            this->addText(x, line, ".");
            this->addText(5, 103, "Altitude: ");
            this->showScreen(SCREEN_ALTITUDE);
        }
        break;
    }
    case SCREEN_ALTITUDE:
        this->pushStep();
        // Training_AltitudeScreen_55C92 : choix × 10000 − 5000 pieds.
        this->settings.altitude_feet = value * 10000 - 5000;
        this->addText(5 + this->textWidth("Altitude: "), 103,
                      std::to_string(this->settings.altitude_feet) + " feet.");
        this->addText(5, 115, "Intelligence reports indicate ");
        this->showScreen(SCREEN_LEVEL);
        break;
    case SCREEN_LEVEL:
        this->pushStep();
        this->settings.pilot_level = (uint8_t)(value - 1);
        this->addText(5 + this->textWidth("Intelligence reports indicate "), 115,
                      std::string(levels[value - 1]) + " pilots.");
        this->showScreen(SCREEN_ACCEPT);
        break;
    case SCREEN_ACCEPT:
        // ACCEPT : écran d'armement ; sans OPTIONS.IFF, départ direct avec l'emport du fichier de l'avion.
        if (!this->openLoadout()) {
            this->startFlight(false);
        }
        break;
    }
}

void SCTrainingMenu::runFrame(void) {
    // Écran d'armement (comme SCGameFlow::runFrame pour une scène). Sprite 12 : départ en vol avec l'emport choisi ;
    // autre sprite : Gameflow_WeaponLoadout_51AB3 rend 0, l'entraînement s'arrête (retour au menu).
    if (this->loadout != nullptr) {
        VGA.activate();
        VGA.getFrameBuffer()->fillWithColor(0);
        this->loadout->Render();
        this->checkZones(this->zones);
        Mouse.draw();
        VGA.vSync();
        if (this->zone_pending) {
            uint8_t id = this->zone_choice;
            this->closeLoadout();
            if (id == LOADOUT_SPRITE_FLY) {
                this->startFlight(true);
            } else {
                this->OnExitTraining();
            }
        }
        return;
    }
    checkButtons();
    if (this->choice_pending) {
        this->choice_pending = false;
        this->applyChoice(this->choice);
    }

    VGA.activate();
    VGA.getFrameBuffer()->clear();

    VGA.setPalette(&this->palette);

    VGA.getFrameBuffer()->drawShape(&background);
    VGA.getFrameBuffer()->drawShape(&title);
    VGA.getFrameBuffer()->drawShape(&board);

    // Couleur 0 : les lettres gardent leurs couleurs (0 et 1 de la palette d'OBJVIEW.PAK, noir et gris clair).
    if (this->font != nullptr) {
        for (auto &line : this->texts) {
            VGA.getFrameBuffer()->printText(this->font, line.position, line.text, 0);
        }
    }

    drawButtons();

    Mouse.draw();

    VGA.vSync();
}
