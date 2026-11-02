# Script extrait de `sub_829F0` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## sub_829F0

```
bp = sp                                                                                               ⟨239771⟩
byte_4F55C = 0                                                                                        ⟨239775⟩
v1 = 0                                                                                                ⟨239776⟩
v2 = 0                                                                                                ⟨239777⟩
v4 = word_4D36E                                                                                       ⟨239779⟩
v358 = 0                                                                                              ⟨239780⟩
TextFormat_ApplyStyleAttribute_357D1(&v358, v4)                                                       ⟨239785⟩
v372 = 0                                                                                              ⟨239787⟩
TextRenderer_ApplyFormatChange_3584E(&v372, 0)                                                        ⟨239796⟩
sub_3499B(&v8, &v372)                                                                                 ⟨239802⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨239808⟩
v18 = 0                                                                                               ⟨239814⟩
sub_435F1(pak mid14)                                                                                  ⟨239836⟩
sub_435F1(pak midgames)                                                                               ⟨239857⟩
sub_435F1(pak optshps)                                                                                ⟨239878⟩
sub_435F1(pak optpals)                                                                                ⟨239899⟩
v28 = 0                                                                                               ⟨239901⟩
v23 = 0                                                                                               ⟨239903⟩
v22 = 0                                                                                               ⟨239904⟩
v30 = byte_4CA58                                                                                      ⟨239906⟩
si v30 - 1 <= 4 :
    si (v30 - 1)·2 == 0 ou ((v30 - 1)·2 != 2) et (((v30 - 1)·2 != 4) et (((v30 - 1)·2 != 6) et ((v30 - 1)·2 != 8))) :
        si sub_993C(chemin1) != 0 :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨239950⟩
            sub_435F1(pak rsoundfx)                                                                   ⟨239954⟩
            flux_iff(flux=flux1)                                                                      ⟨239968⟩
            v1057 = 256                                                                               ⟨239971⟩
            v1061 = 0                                                                                 ⟨239972⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨239980⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨239986⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨239992⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨239996⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨239998⟩
            si = 1                                                                                    ⟨239999⟩
            tant que si <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨240005⟩
                ds:26002[si·2] = iff_lit_mot(flux=flux1)                                              ⟨240009⟩
                si = si + 1                                                                           ⟨240010⟩
            iff_ferme_form(flux=flux1)                                                                ⟨240017⟩
            v2 = 1                                                                                    ⟨240019⟩
            iff_ferme_form(flux=flux1)                                                                ⟨240023⟩
        si sub_993C(chemin1) != 0 :
            v1 = 1                                                                                    ⟨240049⟩
            si v2 == 0 :
                word_4F048 = 90                                                                       ⟨240054⟩
    sinon :
        si sub_993C(chemin1) != 0 :
            si word_4CA5D != 0 :
                pak asoundfx.ouvre(chemin1, 1)                                                        ⟨240091⟩
                sub_435F1(pak asoundfx)                                                               ⟨240095⟩
                flux_iff(flux=flux1)                                                                  ⟨240109⟩
                v1057 = 256                                                                           ⟨240112⟩
                v1061 = 0                                                                             ⟨240113⟩
                flux1.ouvre(chemin1, 1)                                                               ⟨240121⟩
                iff_form(flux=flux1, balise='VOLU', x=0)                                              ⟨240127⟩
                iff_chunk(flux=flux1, balise='ADLB', x=1)                                             ⟨240133⟩
                iff_lit_mot(flux=flux1)                                                               ⟨240137⟩
                word_4F048 = iff_lit_mot(flux=flux1)                                                  ⟨240139⟩
                si = 1                                                                                ⟨240140⟩
                tant que si <= 106 :
                    iff_lit_mot(flux=flux1)                                                           ⟨240146⟩
                    ds:26002[si·2] = iff_lit_mot(flux=flux1)                                          ⟨240150⟩
                    si = si + 1                                                                       ⟨240151⟩
                iff_ferme_form(flux=flux1)                                                            ⟨240158⟩
                v2 = 1                                                                                ⟨240160⟩
                iff_ferme_form(flux=flux1)                                                            ⟨240164⟩
        si sub_993C(chemin1) != 0 :
            v1 = 1                                                                                    ⟨240207⟩
            si v2 == 0 :
                word_4F048 = 255                                                                      ⟨240212⟩
v36 = word_4B2C4                                                                                      ⟨240219⟩
v34 = word_4B2C6                                                                                      ⟨240221⟩
v32 = word_4B2C8                                                                                      ⟨240223⟩
si v2 != 0 :
    v994 = word_4D392                                                                                 ⟨240231⟩
    word_4D392 = &v996                                                                                ⟨240233⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨240242⟩
    si = 0                                                                                            ⟨240244⟩
    tant que si < 6 :
        charge(asoundfx v36[si])                                                                      ⟨240260⟩
        canal_enregistre(canal=canal1, ressource=asoundfx v36[si], x=0)                               ⟨240267⟩
        canal_arrête(canal=canal1)                                                                    ⟨240271⟩
        v181 = 0                                                                                      ⟨240289⟩
        v180 = 0                                                                                      ⟨240290⟩
        si = si + 1                                                                                   ⟨240291⟩
    canal_arrête(canal=canal1)                                                                        ⟨240301⟩
    sub_5C1C(&v996, 2)                                                                                ⟨240306⟩
v982 = 436                                                                                            ⟨240310⟩
v980 = word_4D392                                                                                     ⟨240312⟩
word_4D392 = &v982                                                                                    ⟨240314⟩
v982 = 444                                                                                            ⟨240315⟩
v986 = 0                                                                                              ⟨240318⟩
si v1 != 0 :
    sub_435F1(pak mmusic)                                                                             ⟨240331⟩
    charge(mmusic 8)                                                                                  ⟨240339⟩
    canal_init(canal=canal2, pilote=word_4CA59)                                                       ⟨240344⟩
    canal_enregistre(canal=canal2, ressource=mmusic 8, x=0)                                           ⟨240351⟩
charge(optshps 116)                                                                                   ⟨240370⟩
charge(mid14 1)                                                                                       ⟨240382⟩
charge(mid14 4)                                                                                       ⟨240394⟩
charge(mid14 7)                                                                                       ⟨240406⟩
charge(optpals 21)                                                                                    ⟨240418⟩
palette_depuis(pal2(optpals 21))                                                                      ⟨240425⟩
charge(mid14 0)                                                                                       ⟨240437⟩
palette_depuis(pal3(mid14 0))                                                                         ⟨240444⟩
charge(mid14 13)                                                                                      ⟨240456⟩
palette_depuis(pal4(mid14 13))                                                                        ⟨240463⟩
charge(mid14 10)                                                                                      ⟨240475⟩
palette_depuis(pal5(mid14 10))                                                                        ⟨240482⟩
charge(mid14 3)                                                                                       ⟨240494⟩
palette_depuis(pal6(mid14 3))                                                                         ⟨240501⟩
charge(mid14 6)                                                                                       ⟨240513⟩
palette_depuis(pal7(mid14 6))                                                                         ⟨240520⟩
si byte_4F55C != 0 :
    v161 = 0                                                                                          ⟨240547⟩
    v160 = 0                                                                                          ⟨240548⟩
    v145 = 0                                                                                          ⟨240569⟩
    v144 = 0                                                                                          ⟨240570⟩
    v129 = 0                                                                                          ⟨240591⟩
    v128 = 0                                                                                          ⟨240592⟩
    v113 = 0                                                                                          ⟨240613⟩
    v112 = 0                                                                                          ⟨240614⟩
    v97 = 0                                                                                           ⟨240635⟩
    v96 = 0                                                                                           ⟨240636⟩
    v81 = 0                                                                                           ⟨240657⟩
    v80 = 0                                                                                           ⟨240658⟩
    v71 = 0                                                                                           ⟨240675⟩
    v70 = 0                                                                                           ⟨240676⟩
    v61 = 0                                                                                           ⟨240693⟩
    v60 = 0                                                                                           ⟨240694⟩
    v51 = 0                                                                                           ⟨240711⟩
    v50 = 0                                                                                           ⟨240712⟩
    v41 = 0                                                                                           ⟨240729⟩
    v40 = 0                                                                                           ⟨240730⟩
    canal_arrête(canal=canal2)                                                                        ⟨240733⟩
    sub_5C1C(&v982, 2)                                                                                ⟨240738⟩
    v23 = 0                                                                                           ⟨240761⟩
    v22 = 0                                                                                           ⟨240762⟩
    retour                                                                                            ⟨240802⟩
si v1 != 0 :
    v174 = word_4F048                                                                                 ⟨240808⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v984)                                         ⟨240815⟩
        sub_50F5(canal2.+0→4, v984, v174, 0)                                                          ⟨240822⟩
v182 = 2                                                                                              ⟨240828⟩
v181 = 0                                                                                              ⟨240829⟩
v180 = 0                                                                                              ⟨240830⟩
charge(mid14 2)                                                                                       ⟨240837⟩

──── scène1 ────
scène1 = Scene_Create(cadence=12, palette=255, surface=&v358)                                         ⟨240845⟩
c1 = Layer(ressource=optshps 116, x=0, y=-96)                                                         ⟨240852⟩
c2 = Layer(ressource=mid14 1, x=0, y=0)                                                               ⟨240860⟩
c3 = Layer(ressource=mid14 2, x=0, y=0)                                                               ⟨240868⟩
si = c3                                                                                               ⟨240870⟩
palette_copie(destination=pal1, source=pal2(optpals 21))                                              ⟨240878⟩
palette_copie(destination=pal1, source=pal3(mid14 0))                                                 ⟨240887⟩
ajoute c1 à scène1                                                                                    ⟨240892⟩
ajoute c2 à scène1                                                                                    ⟨240897⟩
ajoute c3 à scène1                                                                                    ⟨240902⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨240914⟩
v1030 = 436                                                                                           ⟨240920⟩
v1028 = word_4D392                                                                                    ⟨240922⟩
word_4D392 = &v1030                                                                                   ⟨240924⟩
si v2 != 0 :
    charge(asoundfx 81)                                                                               ⟨240941⟩
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨240946⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 81, x=0)                                        ⟨240953⟩
    v202 = word_4F016                                                                                 ⟨240956⟩
    v204 = 0                                                                                          ⟨240957⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v1032)                                        ⟨240963⟩
        sub_50F5(canal3.+0→4, v1032, v202, v204)                                                      ⟨240970⟩
Scene_Tick(scène=scène1)                                                                              ⟨240977⟩
v206 = 12                                                                                             ⟨240979⟩
tant que (scène1.compteur < 33) et (scène1.terminée == 0) :
    di = scène1.compteur                                                                              ⟨240983⟩
    si scène1.compteur < 29 :
        v208 = scène1.compteur                                                                        ⟨240986⟩
        c3.image = v208                                                                               ⟨240988⟩
    si scène1.compteur == 22 :
        v206 = v206 - 1                                                                               ⟨240993⟩
        Scene_SetFps(scène=scène1, cadence=v206)                                                      ⟨240998⟩
    si scène1.compteur == 24 :
        v206 = v206 - 1                                                                               ⟨241004⟩
        Scene_SetFps(scène=scène1, cadence=v206)                                                      ⟨241009⟩
    si scène1.compteur == 26 :
        v206 = v206 - 1                                                                               ⟨241015⟩
        Scene_SetFps(scène=scène1, cadence=v206)                                                      ⟨241020⟩
    si scène1.compteur == 28 :
        v206 = v206 - 1                                                                               ⟨241026⟩
        Scene_SetFps(scène=scène1, cadence=v206)                                                      ⟨241031⟩
    si scène1.compteur == 29 :
        c3.méthode24(28, 1)                                                                           ⟨241041⟩
    si scène1.compteur == 30 :
        c3.méthode24(35, 2)                                                                           ⟨241051⟩
    si scène1.compteur == 31 :
        c3.méthode24(45, 3)                                                                           ⟨241061⟩
    si scène1.compteur == 32 :
        retire(parent=scène1, calque=c3)                                                              ⟨241070⟩
        c3.détruit(3)                                                                                 ⟨241077⟩
    Scene_Tick(scène=scène1)                                                                          ⟨241091⟩
canal_arrête(canal=canal3)                                                                            ⟨241116⟩
sub_5C1C(&v1030, 2)                                                                                   ⟨241121⟩
v194 = 0                                                                                              ⟨241140⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨241144⟩
v181 = 0                                                                                              ⟨241162⟩
v180 = 0                                                                                              ⟨241163⟩
si byte_4F55C != 0 :
    v161 = 0                                                                                          ⟨241189⟩
    v160 = 0                                                                                          ⟨241190⟩
    v145 = 0                                                                                          ⟨241211⟩
    v144 = 0                                                                                          ⟨241212⟩
    v129 = 0                                                                                          ⟨241233⟩
    v128 = 0                                                                                          ⟨241234⟩
    v113 = 0                                                                                          ⟨241255⟩
    v112 = 0                                                                                          ⟨241256⟩
    v97 = 0                                                                                           ⟨241277⟩
    v96 = 0                                                                                           ⟨241278⟩
    v81 = 0                                                                                           ⟨241299⟩
    v80 = 0                                                                                           ⟨241300⟩
    v71 = 0                                                                                           ⟨241317⟩
    v70 = 0                                                                                           ⟨241318⟩
    v61 = 0                                                                                           ⟨241335⟩
    v60 = 0                                                                                           ⟨241336⟩
    v51 = 0                                                                                           ⟨241353⟩
    v50 = 0                                                                                           ⟨241354⟩
    v41 = 0                                                                                           ⟨241371⟩
    v40 = 0                                                                                           ⟨241372⟩
    canal_arrête(canal=canal2)                                                                        ⟨241375⟩
    sub_5C1C(&v982, 2)                                                                                ⟨241380⟩
    v23 = 0                                                                                           ⟨241403⟩
    v22 = 0                                                                                           ⟨241404⟩
    retour                                                                                            ⟨241444⟩
v182 = 2                                                                                              ⟨241448⟩
v181 = 0                                                                                              ⟨241449⟩
v180 = 0                                                                                              ⟨241450⟩
charge(mid14 12)                                                                                      ⟨241457⟩
charge(mid14 11)                                                                                      ⟨241469⟩

──── scène2 ────
scène2 = Scene_Create(cadence=10, palette=255, surface=&v358)                                         ⟨241477⟩
c4 = Layer(ressource=mid14 12, x=0, y=0)                                                              ⟨241484⟩
c5 = Layer(ressource=mid14 11, x=0, y=0)                                                              ⟨241492⟩
di = c5                                                                                               ⟨241494⟩
palette_copie(destination=pal1, source=pal4(mid14 13))                                                ⟨241502⟩
ajoute c4 à scène2                                                                                    ⟨241507⟩
ajoute c5 à scène2                                                                                    ⟨241512⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨241524⟩
v1030 = 436                                                                                           ⟨241530⟩
v1028 = word_4D392                                                                                    ⟨241532⟩
word_4D392 = &v1030                                                                                   ⟨241534⟩
v1030 = 444                                                                                           ⟨241535⟩
v1026 = 0                                                                                             ⟨241536⟩
v1022 = 0                                                                                             ⟨241537⟩
v1032 = -1                                                                                            ⟨241539⟩
si v2 != 0 :
    charge(asoundfx 45)                                                                               ⟨241548⟩
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨241553⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 45, x=0)                                        ⟨241560⟩
Scene_Tick(scène=scène2)                                                                              ⟨241566⟩
tant que (scène2.compteur < 32) et (scène2.terminée == 0) :
    si = scène2.compteur                                                                              ⟨241571⟩
    si scène2.compteur == 13 :
        si v2 != 0 :
            v210 = word_4EFCE                                                                         ⟨241577⟩
            v212 = 0                                                                                  ⟨241578⟩
            si canal3.+0 != 0 :
                AIL_start_sequence(pilote=canal3.+0→4, séquence=v1032)                                ⟨241584⟩
                sub_50F5(canal3.+0→4, v1032, v210, v212)                                              ⟨241591⟩
    si scène2.compteur == 18 :
        si v2 != 0 :
            v214 = word_4EFCE                                                                         ⟨241601⟩
            v216 = 0                                                                                  ⟨241602⟩
            si canal3.+0 != 0 :
                AIL_start_sequence(pilote=canal3.+0→4, séquence=v1032)                                ⟨241608⟩
                sub_50F5(canal3.+0→4, v1032, v214, v216)                                              ⟨241615⟩
    si scène2.compteur < 29 :
        v218 = scène2.compteur                                                                        ⟨241622⟩
        c5.image = v218                                                                               ⟨241624⟩
    Scene_Tick(scène=scène2)                                                                          ⟨241636⟩
canal_arrête(canal=canal3)                                                                            ⟨241661⟩
sub_5C1C(&v1030, 2)                                                                                   ⟨241666⟩
v202 = 0                                                                                              ⟨241685⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨241689⟩
v190 = 0                                                                                              ⟨241708⟩
v181 = 0                                                                                              ⟨241725⟩
v180 = 0                                                                                              ⟨241726⟩
si byte_4F55C != 0 :
    v161 = 0                                                                                          ⟨241752⟩
    v160 = 0                                                                                          ⟨241753⟩
    v145 = 0                                                                                          ⟨241774⟩
    v144 = 0                                                                                          ⟨241775⟩
    v129 = 0                                                                                          ⟨241796⟩
    v128 = 0                                                                                          ⟨241797⟩
    v113 = 0                                                                                          ⟨241818⟩
    v112 = 0                                                                                          ⟨241819⟩
    v97 = 0                                                                                           ⟨241840⟩
    v96 = 0                                                                                           ⟨241841⟩
    v81 = 0                                                                                           ⟨241862⟩
    v80 = 0                                                                                           ⟨241863⟩
    v71 = 0                                                                                           ⟨241880⟩
    v70 = 0                                                                                           ⟨241881⟩
    v61 = 0                                                                                           ⟨241898⟩
    v60 = 0                                                                                           ⟨241899⟩
    v51 = 0                                                                                           ⟨241916⟩
    v50 = 0                                                                                           ⟨241917⟩
    v41 = 0                                                                                           ⟨241934⟩
    v40 = 0                                                                                           ⟨241935⟩
    canal_arrête(canal=canal2)                                                                        ⟨241938⟩
    sub_5C1C(&v982, 2)                                                                                ⟨241943⟩
    v23 = 0                                                                                           ⟨241966⟩
    v22 = 0                                                                                           ⟨241967⟩
    retour                                                                                            ⟨242007⟩
v182 = 2                                                                                              ⟨242011⟩
v181 = 0                                                                                              ⟨242012⟩
v180 = 0                                                                                              ⟨242013⟩
charge(mid14 9)                                                                                       ⟨242020⟩

──── scène3 ────
scène3 = Scene_Create(cadence=10, palette=255, surface=&v358)                                         ⟨242028⟩
c6 = OverlayImageLayer(ressource=mid14 9, x=0, y=0, image=0)                                          ⟨242036⟩
di = c6                                                                                               ⟨242038⟩
palette_copie(destination=pal1, source=pal5(mid14 10))                                                ⟨242046⟩
ajoute c6 à scène3                                                                                    ⟨242051⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨242063⟩
v190 = 0                                                                                              ⟨242068⟩
v206 = 0                                                                                              ⟨242069⟩
v1030 = 436                                                                                           ⟨242073⟩
v1028 = word_4D392                                                                                    ⟨242075⟩
word_4D392 = &v1030                                                                                   ⟨242077⟩
v1030 = 444                                                                                           ⟨242078⟩
v1026 = 0                                                                                             ⟨242079⟩
v1022 = 0                                                                                             ⟨242080⟩
v1032 = -1                                                                                            ⟨242082⟩
v1042 = word_4D392                                                                                    ⟨242085⟩
word_4D392 = &v1044                                                                                   ⟨242087⟩
si v2 != 0 :
    charge(asoundfx 52)                                                                               ⟨242101⟩
    canal_init(canal=canal4, pilote=word_4CA5D)                                                       ⟨242106⟩
    canal_enregistre(canal=canal4, ressource=asoundfx 52, x=0)                                        ⟨242113⟩
    charge(asoundfx 46)                                                                               ⟨242121⟩
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨242126⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 46, x=0)                                        ⟨242133⟩
tant que (scène3.compteur < 10) et (scène3.terminée == 0) :
    Scene_Tick(scène=scène3)                                                                          ⟨242142⟩
si = 0                                                                                                ⟨242162⟩
si = 1                                                                                                ⟨242164⟩
c6.image = asoundfx 52.+0                                                                             ⟨242166⟩
tant que (scène3.compteur < 49) et (scène3.terminée == 0) :
    v210 = scène3.compteur                                                                            ⟨242171⟩
    si v210 == 9 :
        v212 = si                                                                                     ⟨242174⟩
        si = si + 1                                                                                   ⟨242175⟩
        c6.image = v212                                                                               ⟨242177⟩
    si v210 == 10 :
        si v2 != 0 :
            v214 = word_4EFD0                                                                         ⟨242185⟩
            v216 = 0                                                                                  ⟨242186⟩
            si canal3.+0 != 0 :
                AIL_start_sequence(pilote=canal3.+0→4, séquence=v1032)                                ⟨242192⟩
                sub_50F5(canal3.+0→4, v1032, v214, v216)                                              ⟨242199⟩
    si v210 == 10 :
        v218 = si                                                                                     ⟨242206⟩
        si = si + 1                                                                                   ⟨242207⟩
        c6.image = v218                                                                               ⟨242209⟩
    si v210 == 12 :
        v220 = si                                                                                     ⟨242214⟩
        si = si + 1                                                                                   ⟨242215⟩
        c6.image = v220                                                                               ⟨242217⟩
    si v210 == 14 :
        si v2 != 0 :
            v222 = word_4EFD0                                                                         ⟨242225⟩
            v224 = 0                                                                                  ⟨242226⟩
            si canal3.+0 != 0 :
                AIL_start_sequence(pilote=canal3.+0→4, séquence=v1032)                                ⟨242232⟩
                sub_50F5(canal3.+0→4, v1032, v222, v224)                                              ⟨242239⟩
    si v210 == 13 :
        v226 = si                                                                                     ⟨242246⟩
        si = si + 1                                                                                   ⟨242247⟩
        c6.image = v226                                                                               ⟨242249⟩
    si v210 == 14 :
        v228 = si                                                                                     ⟨242254⟩
        si = si + 1                                                                                   ⟨242255⟩
        c6.image = v228                                                                               ⟨242257⟩
    si v210 == 18 :
        v230 = si                                                                                     ⟨242262⟩
        si = si + 1                                                                                   ⟨242263⟩
        c6.image = v230                                                                               ⟨242265⟩
    si v210 == 19 :
        v232 = si                                                                                     ⟨242270⟩
        si = si + 1                                                                                   ⟨242271⟩
        c6.image = v232                                                                               ⟨242273⟩
    si v210 == 20 :
        v234 = si                                                                                     ⟨242278⟩
        si = si + 1                                                                                   ⟨242279⟩
        c6.image = v234                                                                               ⟨242281⟩
    si v210 == 21 :
        v236 = si                                                                                     ⟨242286⟩
        si = si + 1                                                                                   ⟨242287⟩
        c6.image = v236                                                                               ⟨242289⟩
    si v210 == 22 :
        v238 = si                                                                                     ⟨242294⟩
        si = si + 1                                                                                   ⟨242295⟩
        c6.image = v238                                                                               ⟨242297⟩
    si v210 == 23 :
        v240 = si                                                                                     ⟨242302⟩
        si = si + 1                                                                                   ⟨242303⟩
        c6.image = v240                                                                               ⟨242305⟩
    si v210 == 24 :
        v242 = si                                                                                     ⟨242310⟩
        si = si + 1                                                                                   ⟨242311⟩
        c6.image = v242                                                                               ⟨242313⟩
    si v210 == 25 :
        v244 = si                                                                                     ⟨242318⟩
        si = si + 1                                                                                   ⟨242319⟩
        c6.image = v244                                                                               ⟨242321⟩
    si v210 == 25 :
        si v2 != 0 :
            v246 = word_4EFDC                                                                         ⟨242329⟩
            si canal4.+0 != 0 :
                AIL_start_sequence(pilote=canal4.+0→4, séquence=v1046)                                ⟨242336⟩
                sub_50F5(canal4.+0→4, v1046, v246, 0)                                                 ⟨242343⟩
    si v210 == 26 :
        v250 = si                                                                                     ⟨242350⟩
        si = si - 1                                                                                   ⟨242351⟩
        c6.image = v250                                                                               ⟨242353⟩
    si v210 == 29 :
        v252 = si                                                                                     ⟨242358⟩
        si = si + 1                                                                                   ⟨242359⟩
        c6.image = v252                                                                               ⟨242361⟩
    si v210 == 32 :
        v254 = si                                                                                     ⟨242366⟩
        si = si - 1                                                                                   ⟨242367⟩
        c6.image = v254                                                                               ⟨242369⟩
    si v210 == 35 :
        v256 = si                                                                                     ⟨242374⟩
        si = si + 1                                                                                   ⟨242375⟩
        c6.image = v256                                                                               ⟨242377⟩
    si v210 == 38 :
        v258 = si                                                                                     ⟨242382⟩
        si = si - 1                                                                                   ⟨242383⟩
        c6.image = v258                                                                               ⟨242385⟩
    si v210 == 41 :
        v260 = si                                                                                     ⟨242390⟩
        si = si + 1                                                                                   ⟨242391⟩
        c6.image = v260                                                                               ⟨242393⟩
    si v210 == 44 :
        v262 = si                                                                                     ⟨242398⟩
        si = si - 1                                                                                   ⟨242399⟩
        c6.image = v262                                                                               ⟨242401⟩
    si v210 == 47 :
        v264 = si                                                                                     ⟨242406⟩
        si = si + 1                                                                                   ⟨242407⟩
        c6.image = v264                                                                               ⟨242409⟩
    Scene_Tick(scène=scène3)                                                                          ⟨242421⟩
canal_arrête(canal=canal3)                                                                            ⟨242446⟩
canal_arrête(canal=canal4)                                                                            ⟨242450⟩
canal_arrête(canal=canal4)                                                                            ⟨242454⟩
sub_5C1C(&v1044, 2)                                                                                   ⟨242459⟩
canal_arrête(canal=canal3)                                                                            ⟨242463⟩
sub_5C1C(&v1030, 2)                                                                                   ⟨242468⟩
v206 = 0                                                                                              ⟨242485⟩
v190 = 0                                                                                              ⟨242505⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨242509⟩
v181 = 0                                                                                              ⟨242527⟩
v180 = 0                                                                                              ⟨242528⟩
si byte_4F55C != 0 :
    v161 = 0                                                                                          ⟨242554⟩
    v160 = 0                                                                                          ⟨242555⟩
    v145 = 0                                                                                          ⟨242576⟩
    v144 = 0                                                                                          ⟨242577⟩
    v129 = 0                                                                                          ⟨242598⟩
    v128 = 0                                                                                          ⟨242599⟩
    v113 = 0                                                                                          ⟨242620⟩
    v112 = 0                                                                                          ⟨242621⟩
    v97 = 0                                                                                           ⟨242642⟩
    v96 = 0                                                                                           ⟨242643⟩
    v81 = 0                                                                                           ⟨242664⟩
    v80 = 0                                                                                           ⟨242665⟩
    v71 = 0                                                                                           ⟨242682⟩
    v70 = 0                                                                                           ⟨242683⟩
    v61 = 0                                                                                           ⟨242700⟩
    v60 = 0                                                                                           ⟨242701⟩
    v51 = 0                                                                                           ⟨242718⟩
    v50 = 0                                                                                           ⟨242719⟩
    v41 = 0                                                                                           ⟨242736⟩
    v40 = 0                                                                                           ⟨242737⟩
    canal_arrête(canal=canal2)                                                                        ⟨242740⟩
    sub_5C1C(&v982, 2)                                                                                ⟨242745⟩
    v23 = 0                                                                                           ⟨242768⟩
    v22 = 0                                                                                           ⟨242769⟩
    retour                                                                                            ⟨242809⟩
v182 = 2                                                                                              ⟨242813⟩
v181 = 0                                                                                              ⟨242814⟩
v180 = 0                                                                                              ⟨242815⟩
charge(mid14 5)                                                                                       ⟨242822⟩

──── scène4 ────
scène4 = Scene_Create(cadence=8, palette=255, surface=&v358)                                          ⟨242830⟩
c7 = Layer(ressource=mid14 4, x=0, y=0)                                                               ⟨242837⟩
c8 = Layer(ressource=mid14 5, x=0, y=0)                                                               ⟨242845⟩
di = c8                                                                                               ⟨242847⟩
palette_copie(destination=pal1, source=pal6(mid14 3))                                                 ⟨242855⟩
ajoute c7 à scène4                                                                                    ⟨242860⟩
ajoute c8 à scène4                                                                                    ⟨242865⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨242877⟩
v198 = 0                                                                                              ⟨242879⟩
v192 = 0                                                                                              ⟨242882⟩
v202 = 0                                                                                              ⟨242886⟩
v218 = 0                                                                                              ⟨242887⟩
v214 = 2                                                                                              ⟨242888⟩
v213 = 0                                                                                              ⟨242889⟩
v212 = 0                                                                                              ⟨242890⟩
v1030 = 436                                                                                           ⟨242891⟩
v1028 = word_4D392                                                                                    ⟨242893⟩
word_4D392 = &v1030                                                                                   ⟨242895⟩
v1030 = 444                                                                                           ⟨242896⟩
v1026 = 0                                                                                             ⟨242897⟩
v1022 = 0                                                                                             ⟨242898⟩
v1032 = -1                                                                                            ⟨242900⟩
v1044 = 436                                                                                           ⟨242901⟩
v1042 = word_4D392                                                                                    ⟨242903⟩
word_4D392 = &v1044                                                                                   ⟨242905⟩
v1044 = 444                                                                                           ⟨242906⟩
v1040 = 0                                                                                             ⟨242907⟩
v1036 = 0                                                                                             ⟨242908⟩
v1046 = -1                                                                                            ⟨242910⟩
v1058 = 436                                                                                           ⟨242911⟩
v1056 = word_4D392                                                                                    ⟨242913⟩
word_4D392 = &v1058                                                                                   ⟨242915⟩
v1058 = 444                                                                                           ⟨242916⟩
v1054 = 0                                                                                             ⟨242917⟩
v1050 = 0                                                                                             ⟨242918⟩
v1062 = 0                                                                                             ⟨242919⟩
v1060 = -1                                                                                            ⟨242920⟩
si v2 != 0 :
    charge(asoundfx 52)                                                                               ⟨242932⟩
    canal_init(canal=canal4, pilote=word_4CA5D)                                                       ⟨242937⟩
    canal_enregistre(canal=canal4, ressource=asoundfx 52, x=0)                                        ⟨242944⟩
    v220 = word_4EFDC - 120                                                                           ⟨242948⟩
    v222 = 0                                                                                          ⟨242949⟩
    si canal4.+0 != 0 :
        AIL_start_sequence(pilote=canal4.+0→4, séquence=v1046)                                        ⟨242955⟩
        sub_50F5(canal4.+0→4, v1046, v220, v222)                                                      ⟨242962⟩
tant que (scène4.compteur < 10) et (scène4.terminée == 0) :
    Scene_Tick(scène=scène4)                                                                          ⟨242972⟩
v223 = 0                                                                                              ⟨242992⟩
si v2 != 0 :
    charge(asoundfx 49)                                                                               ⟨243004⟩
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨243009⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 49, x=0)                                        ⟨243016⟩
    v226 = word_4EFD6                                                                                 ⟨243019⟩
    v228 = 0                                                                                          ⟨243020⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v1032)                                        ⟨243026⟩
        sub_50F5(canal3.+0→4, v1032, v226, v228)                                                      ⟨243033⟩
scène4.compteur = 0                                                                                   ⟨243038⟩
tant que (scène4.compteur < 41) et (scène4.terminée == 0) :
    si = scène4.compteur                                                                              ⟨243042⟩
    v230 = scène4.compteur                                                                            ⟨243043⟩
    c8.image = v230                                                                                   ⟨243045⟩
    si scène4.compteur == 5 :
        si v2 != 0 :
            v232 = word_4EFDC                                                                         ⟨243051⟩
            si canal4.+0 != 0 :
                sub_50F5(canal4.+0→4, v1046, v232, 4000)                                              ⟨243059⟩
    si v223 == 0 :
        si v2 != 0 :
            si booléen == 0 :
                v223 = 1                                                                              ⟨243104⟩
                canal_arrête(canal=canal3)                                                            ⟨243107⟩
                charge(asoundfx 82)                                                                   ⟨243115⟩
                canal_init(canal=canal5, pilote=word_4CA5D)                                           ⟨243120⟩
                canal_enregistre(canal=canal5, ressource=asoundfx 82, x=0)                            ⟨243127⟩
                v234 = word_4F018 - 30                                                                ⟨243131⟩
                v236 = 0                                                                              ⟨243132⟩
                si canal5.+0 != 0 :
                    AIL_start_sequence(pilote=canal5.+0→4, séquence=v1060)                            ⟨243138⟩
                    sub_50F5(canal5.+0→4, v1060, v234, v236)                                          ⟨243145⟩
    si scène4.compteur == 14 :
        si v2 != 0 :
            v238 = word_4F018                                                                         ⟨243155⟩
            si canal5.+0 != 0 :
                sub_50F5(canal5.+0→4, v1060, v238, 2000)                                              ⟨243163⟩
    Scene_Tick(scène=scène4)                                                                          ⟨243177⟩
fondu_disparition(palette=pal1, couleur=&v18, pas=0, premier=0, nombre=256)                           ⟨243207⟩
canal_arrête(canal=canal5)                                                                            ⟨243211⟩
sub_5C1C(&v1058, 2)                                                                                   ⟨243216⟩
canal_arrête(canal=canal4)                                                                            ⟨243220⟩
sub_5C1C(&v1044, 2)                                                                                   ⟨243225⟩
canal_arrête(canal=canal3)                                                                            ⟨243229⟩
sub_5C1C(&v1030, 2)                                                                                   ⟨243234⟩
v212 = 0                                                                                              ⟨243253⟩
v202 = 0                                                                                              ⟨243271⟩
v192 = 0                                                                                              ⟨243289⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨243293⟩
v181 = 0                                                                                              ⟨243311⟩
v180 = 0                                                                                              ⟨243312⟩
si byte_4F55C != 0 :
    v161 = 0                                                                                          ⟨243338⟩
    v160 = 0                                                                                          ⟨243339⟩
    v145 = 0                                                                                          ⟨243360⟩
    v144 = 0                                                                                          ⟨243361⟩
    v129 = 0                                                                                          ⟨243382⟩
    v128 = 0                                                                                          ⟨243383⟩
    v113 = 0                                                                                          ⟨243404⟩
    v112 = 0                                                                                          ⟨243405⟩
    v97 = 0                                                                                           ⟨243426⟩
    v96 = 0                                                                                           ⟨243427⟩
    v81 = 0                                                                                           ⟨243448⟩
    v80 = 0                                                                                           ⟨243449⟩
    v71 = 0                                                                                           ⟨243466⟩
    v70 = 0                                                                                           ⟨243467⟩
    v61 = 0                                                                                           ⟨243484⟩
    v60 = 0                                                                                           ⟨243485⟩
    v51 = 0                                                                                           ⟨243502⟩
    v50 = 0                                                                                           ⟨243503⟩
    v41 = 0                                                                                           ⟨243520⟩
    v40 = 0                                                                                           ⟨243521⟩
    canal_arrête(canal=canal2)                                                                        ⟨243524⟩
    sub_5C1C(&v982, 2)                                                                                ⟨243529⟩
    v23 = 0                                                                                           ⟨243552⟩
    v22 = 0                                                                                           ⟨243553⟩
    retour                                                                                            ⟨243593⟩
v182 = 2                                                                                              ⟨243597⟩
v181 = 0                                                                                              ⟨243598⟩
v180 = 0                                                                                              ⟨243599⟩
charge(mid14 8)                                                                                       ⟨243606⟩

──── scène5 ────
scène5 = Scene_Create(cadence=13, palette=255, surface=&v358)                                         ⟨243614⟩
c9 = Layer(ressource=optshps 116, x=0, y=-41)                                                         ⟨243621⟩
c10 = Layer(ressource=mid14 7, x=0, y=0)                                                              ⟨243629⟩
c11 = Layer(ressource=mid14 8, x=0, y=0)                                                              ⟨243637⟩
di = c11                                                                                              ⟨243639⟩
palette_copie(destination=pal1, source=pal7(mid14 6))                                                 ⟨243647⟩
palette_copie(destination=pal1, source=pal2(optpals 21))                                              ⟨243656⟩
ajoute c9 à scène5                                                                                    ⟨243661⟩
ajoute c10 à scène5                                                                                   ⟨243666⟩
ajoute c11 à scène5                                                                                   ⟨243671⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨243683⟩
v194 = 0                                                                                              ⟨243688⟩
v210 = 0                                                                                              ⟨243689⟩
v204 = 0                                                                                              ⟨243692⟩
v220 = 0                                                                                              ⟨243693⟩
v214 = 0                                                                                              ⟨243696⟩
v1030 = 436                                                                                           ⟨243697⟩
v1028 = word_4D392                                                                                    ⟨243699⟩
word_4D392 = &v1030                                                                                   ⟨243701⟩
v1030 = 444                                                                                           ⟨243702⟩
v1026 = 0                                                                                             ⟨243703⟩
v1022 = 0                                                                                             ⟨243704⟩
v1032 = -1                                                                                            ⟨243706⟩
v1044 = 436                                                                                           ⟨243707⟩
v1042 = word_4D392                                                                                    ⟨243709⟩
word_4D392 = &v1044                                                                                   ⟨243711⟩
v1044 = 444                                                                                           ⟨243712⟩
v1040 = 0                                                                                             ⟨243713⟩
v1036 = 0                                                                                             ⟨243714⟩
v1046 = -1                                                                                            ⟨243716⟩
v1058 = 436                                                                                           ⟨243717⟩
v1056 = word_4D392                                                                                    ⟨243719⟩
word_4D392 = &v1058                                                                                   ⟨243721⟩
v1058 = 444                                                                                           ⟨243722⟩
v1054 = 0                                                                                             ⟨243723⟩
v1050 = 0                                                                                             ⟨243724⟩
v1060 = -1                                                                                            ⟨243726⟩
si v2 != 0 :
    charge(asoundfx 52)                                                                               ⟨243738⟩
    canal_init(canal=canal4, pilote=word_4CA5D)                                                       ⟨243743⟩
    canal_enregistre(canal=canal4, ressource=asoundfx 52, x=0)                                        ⟨243750⟩
    v222 = word_4EFDC - 100                                                                           ⟨243754⟩
    v224 = 0                                                                                          ⟨243755⟩
    si canal4.+0 != 0 :
        AIL_start_sequence(pilote=canal4.+0→4, séquence=v1046)                                        ⟨243761⟩
        sub_50F5(canal4.+0→4, v1046, v222, v224)                                                      ⟨243768⟩
    charge(asoundfx 82)                                                                               ⟨243779⟩
    canal_init(canal=canal5, pilote=word_4CA5D)                                                       ⟨243784⟩
    canal_enregistre(canal=canal5, ressource=asoundfx 82, x=0)                                        ⟨243791⟩
    v226 = word_4F018                                                                                 ⟨243794⟩
    v228 = 0                                                                                          ⟨243795⟩
    si canal5.+0 != 0 :
        AIL_start_sequence(pilote=canal5.+0→4, séquence=v1060)                                        ⟨243801⟩
        sub_50F5(canal5.+0→4, v1060, v226, v228)                                                      ⟨243808⟩
v230 = 13                                                                                             ⟨243813⟩
tant que (scène5.compteur < 46) et (scène5.terminée == 0) :
    si = scène5.compteur                                                                              ⟨243817⟩
    si scène5.compteur < 40 :
        v232 = scène5.compteur                                                                        ⟨243820⟩
        c11.image = v232                                                                              ⟨243822⟩
    si scène5.compteur > 35 :
        v230 = v230 - 1                                                                               ⟨243827⟩
        Scene_SetFps(scène=scène5, cadence=v230)                                                      ⟨243832⟩
    Scene_Tick(scène=scène5)                                                                          ⟨243845⟩
fondu_disparition(palette=pal1, couleur=&v18, pas=2, premier=0, nombre=256)                           ⟨243874⟩
canal_arrête(canal=canal5)                                                                            ⟨243878⟩
sub_5C1C(&v1058, 2)                                                                                   ⟨243883⟩
canal_arrête(canal=canal4)                                                                            ⟨243887⟩
sub_5C1C(&v1044, 2)                                                                                   ⟨243892⟩
canal_arrête(canal=canal3)                                                                            ⟨243896⟩
sub_5C1C(&v1030, 2)                                                                                   ⟨243901⟩
v214 = 0                                                                                              ⟨243920⟩
v204 = 0                                                                                              ⟨243938⟩
v194 = 0                                                                                              ⟨243956⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨243960⟩
v181 = 0                                                                                              ⟨243978⟩
v180 = 0                                                                                              ⟨243979⟩
v161 = 0                                                                                              ⟨244000⟩
v160 = 0                                                                                              ⟨244001⟩
v145 = 0                                                                                              ⟨244022⟩
v144 = 0                                                                                              ⟨244023⟩
v129 = 0                                                                                              ⟨244044⟩
v128 = 0                                                                                              ⟨244045⟩
v113 = 0                                                                                              ⟨244066⟩
v112 = 0                                                                                              ⟨244067⟩
v97 = 0                                                                                               ⟨244088⟩
v96 = 0                                                                                               ⟨244089⟩
v81 = 0                                                                                               ⟨244110⟩
v80 = 0                                                                                               ⟨244111⟩
v71 = 0                                                                                               ⟨244128⟩
v70 = 0                                                                                               ⟨244129⟩
v61 = 0                                                                                               ⟨244146⟩
v60 = 0                                                                                               ⟨244147⟩
v51 = 0                                                                                               ⟨244164⟩
v50 = 0                                                                                               ⟨244165⟩
v41 = 0                                                                                               ⟨244182⟩
v40 = 0                                                                                               ⟨244183⟩
canal_arrête(canal=canal2)                                                                            ⟨244186⟩
sub_5C1C(&v982, 2)                                                                                    ⟨244191⟩
v23 = 0                                                                                               ⟨244214⟩
v22 = 0                                                                                               ⟨244215⟩
retour                                                                                                ⟨244255⟩
```

## Tableaux du segment de données

