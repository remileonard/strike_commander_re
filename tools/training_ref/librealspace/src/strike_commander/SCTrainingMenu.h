//
//  File.h
//  libRealSpace
//
//  Created by fabien sanglard on 1/28/2014.
//  Copyright (c) 2014 Fabien Sanglard. All rights reserved.
//
//  TRAINING MISSION (OPTEST.EXE, ovr190) : écrans de réglage, puis vol de MISSIONS\TEMPLATE.IFF complété par
//  RSMission::addTraining. strike_commander_re/analysis/TRAINING_MISSION.md.
//

#ifndef __libRealSpace__File__
#define __libRealSpace__File__

class SCTrainingMenu : public IActivity {

public:
    SCTrainingMenu();
    ~SCTrainingMenu();

    void init();
    void unFocus(void);
    void focus(void);
    void runFrame(void);

protected:
    virtual void OnSearchAndDestroy();

private:
    // Un écran = un panneau de TM.SHP et ses boutons (§ 3 du document).
    enum TrainingScreen {
        SCREEN_TYPE,
        SCREEN_COUNT,
        SCREEN_PLANE,
        SCREEN_MORE,
        SCREEN_ALTITUDE,
        SCREEN_LEVEL,
        SCREEN_ACCEPT
    };
    // Valeurs rendues par les boutons BACKUP et CANCEL (−1 et −2 dans le jeu).
    static const int CHOICE_BACKUP = -1;
    static const int CHOICE_CANCEL = -2;

    // Ligne de texte écrite au-dessus du panneau (Training_PrintText_55BDC).
    struct TrainingText {
        Point2D position;
        std::string text;
    };
    // État avant un choix : BACKUP le rétablit (efface les textes écrits depuis, comme Training_EraseLastText_55C7B).
    struct TrainingStep {
        TrainingScreen screen;
        MISN_TRAINING settings;
        int group;
        size_t text_count;
    };

    SCState &GameState = SCState::getInstance();
    RLEShape title;
    RLEShape background;
    RLEShape board;
    PakArchive tm_pack;
    RSFont *font{ nullptr };

    TrainingScreen screen{ SCREEN_TYPE };
    MISN_TRAINING settings;
    int group{ 0 };
    std::vector<TrainingText> texts;
    std::vector<TrainingStep> history;
    // Choix noté par un bouton, appliqué après checkButtons (les boutons sont remplacés à chaque écran).
    bool choice_pending{ false };
    int choice{ 0 };

    void OnExitTraining();
    void showScreen(TrainingScreen next);
    void addButton(Point2D panel, int x, int y, int width, int height, int image, int value);
    int addText(int x, int y, const std::string &text);
    int textWidth(const std::string &text);
    void applyChoice(int value);
    void pushStep();
    void backup();
    void startFlight();
};

#endif /* defined(__libRealSpace__File__) */
