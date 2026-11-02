# Script extrait de `MidgameTO1_Play_74C00` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## MidgameTO1_Play_74C00

```
bp = sp                                                                                               ⟨219349⟩
v2 = word_4D36E                                                                                       ⟨219354⟩
v310 = 0                                                                                              ⟨219355⟩
TextFormat_ApplyStyleAttribute_357D1(&v310, v2)                                                       ⟨219360⟩
v324 = 0                                                                                              ⟨219362⟩
TextRenderer_ApplyFormatChange_3584E(&v324, 0)                                                        ⟨219371⟩
sub_3499B(&v6, &v324)                                                                                 ⟨219377⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨219383⟩
v306 = 0                                                                                              ⟨219385⟩
v304 = 24                                                                                             ⟨219386⟩
v302 = 319                                                                                            ⟨219387⟩
v300 = 151                                                                                            ⟨219388⟩
v16 = 0                                                                                               ⟨219389⟩
v17 = 0                                                                                               ⟨219392⟩
v350 = 4767                                                                                           ⟨219393⟩
v334 = 0                                                                                              ⟨219394⟩
v329 = 0                                                                                              ⟨219396⟩
v328 = 0                                                                                              ⟨219397⟩
v350 = 4783                                                                                           ⟨219399⟩
tableau_objets(objets1 : 10 objets de 10 octets)                                                      ⟨219407⟩
si word_4CA5B != 0 :
    v17 = 1                                                                                           ⟨219428⟩
si v17 != 0 :
    si = 0                                                                                            ⟨219450⟩
    tant que si < 10 :
        charge(tomidvoc si)                                                                           ⟨219464⟩
        si = si + 1                                                                                   ⟨219466⟩
    voix_pilote(voix=voix1, pilote=word_4CA5B)                                                        ⟨219474⟩
TextRenderer_LoadResourceFile_437A9(chemin1, 3)                                                       ⟨219496⟩
v30 = ?                                                                                               ⟨219498⟩
v32 = TextRenderer_LoadResourceFile_437A9(chemin1, 3)                                                 ⟨219499⟩
v28 = v32                                                                                             ⟨219501⟩
v23 = 1                                                                                               ⟨219503⟩
v22 = 0                                                                                               ⟨219504⟩
GlyphObject_ConstructWithBuffer_36D56(&v674, &v28)                                                    ⟨219509⟩
v1026 = 0                                                                                             ⟨219520⟩
v1024 = 152                                                                                           ⟨219522⟩
v1022 = 319                                                                                           ⟨219524⟩
v1020 = 199                                                                                           ⟨219526⟩
sub_30A1D(&v708, word_4D36E, &v674)                                                                   ⟨219529⟩
tableau_textes(tableau=textes1, nombre=16, longueur=300)                                              ⟨219536⟩
flux_iff(flux=flux1)                                                                                  ⟨219550⟩
v913 = 256                                                                                            ⟨219553⟩
v917 = 0                                                                                              ⟨219554⟩
flux1.ouvre(chemin1, 1)                                                                               ⟨219562⟩
iff_form(flux=flux1, balise='MG01', x=0)                                                              ⟨219568⟩
iff_form(flux=flux1, balise='SPOK', x=0)                                                              ⟨219574⟩
si = 0                                                                                                ⟨219576⟩
tant que si < 16 :
    iff_chunk(flux=flux1, balise='TEXT', x=1)                                                         ⟨219584⟩
    di = v896                                                                                         ⟨219586⟩
    si v896 > 300 :
        Runtime_FatalErrorHandler_36797(9918)                                                         ⟨219590⟩
    iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·si), taille=v896)                        ⟨219604⟩
    v909 = v892                                                                                       ⟨219607⟩
    si = si + 1                                                                                       ⟨219608⟩
iff_ferme_form(flux=flux1)                                                                            ⟨219615⟩
iff_ferme_form(flux=flux1)                                                                            ⟨219620⟩
v45 = 0                                                                                               ⟨219627⟩
v46 = 0                                                                                               ⟨219628⟩
v56 = 0                                                                                               ⟨219629⟩
v51 = 0                                                                                               ⟨219631⟩
v50 = 0                                                                                               ⟨219632⟩
v58 = byte_4CA58                                                                                      ⟨219634⟩
si v58 - 1 <= 4 :
    si (v58 - 1)·2 == 0 ou ((v58 - 1)·2 != 2) et (((v58 - 1)·2 != 4) et (((v58 - 1)·2 != 6) et ((v58 - 1)·2 != 8))) :
        si sub_993C(chemin1) != 0 :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨219678⟩
            flux_iff(flux=flux1)                                                                      ⟨219692⟩
            v913 = 256                                                                                ⟨219695⟩
            v917 = 0                                                                                  ⟨219696⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨219704⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨219710⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨219716⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨219720⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨219722⟩
            si = 1                                                                                    ⟨219723⟩
            tant que si <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨219729⟩
                ds:26002[si·2] = iff_lit_mot(flux=flux1)                                              ⟨219733⟩
                si = si + 1                                                                           ⟨219734⟩
            iff_ferme_form(flux=flux1)                                                                ⟨219741⟩
            v46 = 1                                                                                   ⟨219743⟩
            iff_ferme_form(flux=flux1)                                                                ⟨219747⟩
        si sub_993C(chemin1) != 0 :
            v45 = 1                                                                                   ⟨219773⟩
            si v46 == 0 :
                word_4F048 = 90                                                                       ⟨219778⟩
    sinon :
        si sub_993C(chemin1) != 0 :
            si word_4CA5D != 0 :
                pak asoundfx.ouvre(chemin1, 1)                                                        ⟨219815⟩
                flux_iff(flux=flux1)                                                                  ⟨219829⟩
                v913 = 256                                                                            ⟨219832⟩
                v917 = 0                                                                              ⟨219833⟩
                flux1.ouvre(chemin1, 1)                                                               ⟨219841⟩
                iff_form(flux=flux1, balise='VOLU', x=0)                                              ⟨219847⟩
                iff_chunk(flux=flux1, balise='ADLB', x=1)                                             ⟨219853⟩
                iff_lit_mot(flux=flux1)                                                               ⟨219857⟩
                word_4F048 = iff_lit_mot(flux=flux1)                                                  ⟨219859⟩
                si = 1                                                                                ⟨219860⟩
                tant que si <= 106 :
                    iff_lit_mot(flux=flux1)                                                           ⟨219866⟩
                    ds:26002[si·2] = iff_lit_mot(flux=flux1)                                          ⟨219870⟩
                    si = si + 1                                                                       ⟨219871⟩
                iff_ferme_form(flux=flux1)                                                            ⟨219878⟩
                v46 = 1                                                                               ⟨219880⟩
                iff_ferme_form(flux=flux1)                                                            ⟨219884⟩
        si sub_993C(chemin1) != 0 :
            v45 = 1                                                                                   ⟨219927⟩
            si v46 == 0 :
                word_4F048 = 255                                                                      ⟨219932⟩
v838 = 436                                                                                            ⟨219938⟩
v836 = word_4D392                                                                                     ⟨219940⟩
word_4D392 = &v838                                                                                    ⟨219942⟩
v838 = 444                                                                                            ⟨219943⟩
v842 = 0                                                                                              ⟨219946⟩
si v45 != 0 :
    si v17 != 0 :
        v245 = 22                                                                                     ⟨219959⟩
    sinon :
        v245 = 21                                                                                     ⟨219963⟩
    charge(mmusic v245)                                                                               ⟨219974⟩
    canal_init(canal=canal1, pilote=word_4CA59)                                                       ⟨219979⟩
    canal_enregistre(canal=canal1, ressource=mmusic v245, x=0)                                        ⟨219986⟩
si v45 != 0 :
    v60 = word_4F048                                                                                  ⟨219998⟩
    si canal1.+0 != 0 :
        AIL_start_sequence(pilote=canal1.+0→4, séquence=v840)                                         ⟨220005⟩
        sub_50F5(canal1.+0→4, v840, v60, 0)                                                           ⟨220012⟩
v850 = word_4D392                                                                                     ⟨220023⟩
word_4D392 = &v852                                                                                    ⟨220025⟩
si v46 != 0 :
    charge(asoundfx 62)                                                                               ⟨220039⟩
    canal_init(canal=canal2, pilote=word_4CA5D)                                                       ⟨220044⟩
    canal_enregistre(canal=canal2, ressource=asoundfx 62, x=0)                                        ⟨220051⟩
charge(to1mid1 2)                                                                                     ⟨220065⟩
charge(to1mid1 3)                                                                                     ⟨220077⟩
palette_depuis(pal2(to1mid1 3))                                                                       ⟨220084⟩

──── scène1 ────
scène1 = Scene_Create(cadence=20, palette=255, surface=&v310)                                         ⟨220092⟩
c1 = Layer(ressource=to1mid1 2, x=0, y=-35)                                                           ⟨220099⟩
di = c1                                                                                               ⟨220101⟩
palette_copie(destination=pal1, source=pal2(to1mid1 3))                                               ⟨220109⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨220121⟩
ajoute c1 à scène1                                                                                    ⟨220126⟩
si = 0                                                                                                ⟨220128⟩
tant que (scène1.compteur < 62) et (scène1.terminée == 0) :
    si v46 != 0 :
        si si == 13 :
            v282 = word_4EFF0                                                                         ⟨220137⟩
            v284 = 0                                                                                  ⟨220138⟩
            si canal2.+0 != 0 :
                AIL_start_sequence(pilote=canal2.+0→4, séquence=v854)                                 ⟨220144⟩
                sub_50F5(canal2.+0→4, v854, v282, v284)                                               ⟨220151⟩
    v286 = si                                                                                         ⟨220156⟩
    c1.image = v286                                                                                   ⟨220158⟩
    si = si + 1                                                                                       ⟨220159⟩
    Scene_Tick(scène=scène1)                                                                          ⟨220162⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨220188⟩
v268 = 0                                                                                              ⟨220211⟩
v258 = 0                                                                                              ⟨220229⟩
canal_arrête(canal=canal2)                                                                            ⟨220232⟩
sub_5C1C(&v852, 2)                                                                                    ⟨220237⟩
v248 = 0                                                                                              ⟨220256⟩
si byte_4F55C != 0 :
    canal_arrête(canal=canal1)                                                                        ⟨220264⟩
    sub_5C1C(&v838, 2)                                                                                ⟨220269⟩
    v51 = 0                                                                                           ⟨220292⟩
    v50 = 0                                                                                           ⟨220293⟩
    v28 = 0                                                                                           ⟨220323⟩
    v23 = 0                                                                                           ⟨220324⟩
    v22 = 0                                                                                           ⟨220325⟩
    CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                    ⟨220338⟩
    voix_arrête(voix=voix1)                                                                           ⟨220343⟩
    v334 = 0                                                                                          ⟨220360⟩
    v329 = 0                                                                                          ⟨220361⟩
    v328 = 0                                                                                          ⟨220362⟩
    retour                                                                                            ⟨220382⟩
charge(to1mid1 5)                                                                                     ⟨220395⟩
palette_depuis(pal3(to1mid1 5))                                                                       ⟨220402⟩
charge(to1mid1 6)                                                                                     ⟨220414⟩
charge(to1mid1 17)                                                                                    ⟨220426⟩
charge(to1mid1 4)                                                                                     ⟨220442⟩
charge(to1mid1 11)                                                                                    ⟨220454⟩
charge(to1mid1 12)                                                                                    ⟨220466⟩
v306 = 0                                                                                              ⟨220468⟩
v304 = 24                                                                                             ⟨220469⟩
v302 = 319                                                                                            ⟨220470⟩
v300 = 151                                                                                            ⟨220471⟩

──── scène2 ────
scène2 = Scene_Create(cadence=10, palette=255, surface=&v310)                                         ⟨220478⟩
v1026 = 0                                                                                             ⟨220485⟩
v1024 = 152                                                                                           ⟨220487⟩
v1022 = 319                                                                                           ⟨220489⟩
v1020 = 199                                                                                           ⟨220491⟩
sub_30A1D(&v910, word_4D36E, &v674)                                                                   ⟨220494⟩
palette_copie(destination=pal1, source=pal3(to1mid1 5))                                               ⟨220503⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨220515⟩
c2 = Layer(ressource=to1mid1 6, x=0, y=0)                                                             ⟨220522⟩
ajoute c2 à scène2                                                                                    ⟨220528⟩
c3 = JitterImageLayer(ressource=to1mid1 4, x=0, y=-47, image=0)                                       ⟨220536⟩
si = c3                                                                                               ⟨220538⟩
c4 = ImageLayer(ressource=to1mid1 11, x=-86, y=1, image=0)                                            ⟨220545⟩
c5 = ImageLayer(ressource=to1mid1 12, x=21, y=0, image=0)                                             ⟨220554⟩
ajoute c4 à c3                                                                                        ⟨220559⟩
ajoute c5 à c3                                                                                        ⟨220563⟩
ajoute c3 à scène2                                                                                    ⟨220568⟩
si v17 != 0 :
    sub_C8D7(voix1, objets1)                                                                          ⟨220576⟩
    sub_CB9D(voix1, -1)                                                                               ⟨220581⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène2)                                                                      ⟨220588⟩
sinon :
    police_couleur (sub_3139A, non lue)(police=police1, couleur=161)                                  ⟨220620⟩
    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[0])                                     ⟨220625⟩
    tant que (scène2.compteur < 30) et (scène2.terminée == 0) :
        Scene_Tick(scène=scène2)                                                                      ⟨220632⟩
si v17 != 0 :
    scène2.compteur = 0                                                                               ⟨220656⟩
    tant que (scène2.compteur < 10) et (scène2.terminée == 0) :
        Scene_Tick(scène=scène2)                                                                      ⟨220662⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨220691⟩
si byte_4F55C != 0 :
    v131 = 0                                                                                          ⟨220714⟩
    v130 = 0                                                                                          ⟨220715⟩
    v121 = 0                                                                                          ⟨220732⟩
    v120 = 0                                                                                          ⟨220733⟩
    v111 = 0                                                                                          ⟨220750⟩
    v110 = 0                                                                                          ⟨220751⟩
    v93 = 0                                                                                           ⟨220768⟩
    v92 = 0                                                                                           ⟨220769⟩
    v83 = 0                                                                                           ⟨220786⟩
    v82 = 0                                                                                           ⟨220787⟩
    v67 = 0                                                                                           ⟨220808⟩
    v66 = 0                                                                                           ⟨220809⟩
    canal_arrête(canal=canal1)                                                                        ⟨220812⟩
    sub_5C1C(&v838, 2)                                                                                ⟨220817⟩
    v51 = 0                                                                                           ⟨220840⟩
    v50 = 0                                                                                           ⟨220841⟩
    v28 = 0                                                                                           ⟨220871⟩
    v23 = 0                                                                                           ⟨220872⟩
    v22 = 0                                                                                           ⟨220873⟩
    CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                    ⟨220886⟩
    voix_arrête(voix=voix1)                                                                           ⟨220891⟩
    v334 = 0                                                                                          ⟨220908⟩
    v329 = 0                                                                                          ⟨220909⟩
    v328 = 0                                                                                          ⟨220910⟩
    retour                                                                                            ⟨220930⟩
charge(to1mid1 5)                                                                                     ⟨220943⟩
palette_depuis(pal4(to1mid1 5))                                                                       ⟨220950⟩
charge(to1mid1 7)                                                                                     ⟨220962⟩
charge(to1mid1 9)                                                                                     ⟨220974⟩
charge(to1mid1 10)                                                                                    ⟨220986⟩
v246 = 9962                                                                                           ⟨220992⟩
v248 = 9964                                                                                           ⟨220993⟩
v250 = 9966                                                                                           ⟨220994⟩

──── scène3 ────
scène3 = Scene_Create(cadence=10, palette=255, surface=&v310)                                         ⟨221001⟩
v1026 = 0                                                                                             ⟨221008⟩
v1024 = 152                                                                                           ⟨221010⟩
v1022 = 319                                                                                           ⟨221012⟩
v1020 = 199                                                                                           ⟨221014⟩
sub_30A1D(objet1, word_4D36E, police1)                                                                ⟨221017⟩
palette_copie(destination=pal1, source=pal4(to1mid1 5))                                               ⟨221026⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨221038⟩
c6 = Layer(ressource=to1mid1 17, x=0, y=0)                                                            ⟨221045⟩
ajoute c6 à scène3                                                                                    ⟨221051⟩
c7 = JitterImageLayer(ressource=to1mid1 7, x=0, y=-47, image=0)                                       ⟨221059⟩
si = c7                                                                                               ⟨221061⟩
c8 = ImageLayer(ressource=to1mid1 9, x=86, y=0, image=0)                                              ⟨221068⟩
c9 = ImageLayer(ressource=to1mid1 10, x=-20, y=0, image=0)                                            ⟨221077⟩
ajoute c8 à c7                                                                                        ⟨221082⟩
ajoute c9 à c7                                                                                        ⟨221086⟩
ajoute c7 à scène3                                                                                    ⟨221091⟩
si CRT_Strlen(arg_10) != 0 :
    CRT_Strcat(textes1[1], v248)                                                                      ⟨221102⟩
    CRT_Strcat(textes1[1], v246)                                                                      ⟨221108⟩
    CRT_Strcat(textes1[1], arg_10)                                                                    ⟨221114⟩
    CRT_Strcat(textes1[1], v250)                                                                      ⟨221120⟩
si v17 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨221128⟩
    sub_C8D7(voix1, objets1[1])                                                                       ⟨221134⟩
    sub_CB9D(voix1, -1)                                                                               ⟨221139⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène3)                                                                      ⟨221146⟩
sinon :
    police_couleur (sub_3139A, non lue)(police=police1, couleur=101)                                  ⟨221178⟩
    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[1])                                     ⟨221185⟩
    tant que (scène3.compteur < 30) et (scène3.terminée == 0) :
        Scene_Tick(scène=scène3)                                                                      ⟨221192⟩
si v17 != 0 :
    scène3.compteur = 0                                                                               ⟨221216⟩
    tant que (scène3.compteur < 10) et (scène3.terminée == 0) :
        Scene_Tick(scène=scène3)                                                                      ⟨221222⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨221251⟩
si byte_4F55C != 0 :
    v177 = 0                                                                                          ⟨221274⟩
    v176 = 0                                                                                          ⟨221275⟩
    v167 = 0                                                                                          ⟨221292⟩
    v166 = 0                                                                                          ⟨221293⟩
    v157 = 0                                                                                          ⟨221310⟩
    v156 = 0                                                                                          ⟨221311⟩
    v141 = 0                                                                                          ⟨221332⟩
    v140 = 0                                                                                          ⟨221333⟩
    v131 = 0                                                                                          ⟨221350⟩
    v130 = 0                                                                                          ⟨221351⟩
    v121 = 0                                                                                          ⟨221368⟩
    v120 = 0                                                                                          ⟨221369⟩
    v111 = 0                                                                                          ⟨221386⟩
    v110 = 0                                                                                          ⟨221387⟩
    v93 = 0                                                                                           ⟨221404⟩
    v92 = 0                                                                                           ⟨221405⟩
    v83 = 0                                                                                           ⟨221422⟩
    v82 = 0                                                                                           ⟨221423⟩
    v67 = 0                                                                                           ⟨221444⟩
    v66 = 0                                                                                           ⟨221445⟩
    canal_arrête(canal=canal1)                                                                        ⟨221448⟩
    sub_5C1C(&v838, 2)                                                                                ⟨221453⟩
    v51 = 0                                                                                           ⟨221476⟩
    v50 = 0                                                                                           ⟨221477⟩
    v28 = 0                                                                                           ⟨221507⟩
    v23 = 0                                                                                           ⟨221508⟩
    v22 = 0                                                                                           ⟨221509⟩
    CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                    ⟨221522⟩
    voix_arrête(voix=voix1)                                                                           ⟨221527⟩
    v334 = 0                                                                                          ⟨221544⟩
    v329 = 0                                                                                          ⟨221545⟩
    v328 = 0                                                                                          ⟨221546⟩
    retour                                                                                            ⟨221566⟩

──── scène4 ────
scène4 = Scene_Create(cadence=10, palette=255, surface=&v310)                                         ⟨221575⟩
v1026 = 0                                                                                             ⟨221582⟩
v1024 = 152                                                                                           ⟨221584⟩
v1022 = 319                                                                                           ⟨221586⟩
v1020 = 199                                                                                           ⟨221588⟩
sub_30A1D(objet1, word_4D36E, police1)                                                                ⟨221591⟩
palette_copie(destination=pal1, source=pal3(to1mid1 5))                                               ⟨221600⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨221612⟩
c10 = Layer(ressource=to1mid1 6, x=0, y=0)                                                            ⟨221619⟩
ajoute c10 à scène4                                                                                   ⟨221625⟩
c11 = JitterImageLayer(ressource=to1mid1 4, x=0, y=-47, image=0)                                      ⟨221633⟩
si = c11                                                                                              ⟨221635⟩
c12 = ImageLayer(ressource=to1mid1 11, x=-86, y=1, image=0)                                           ⟨221642⟩
c13 = ImageLayer(ressource=to1mid1 12, x=21, y=0, image=0)                                            ⟨221651⟩
ajoute c12 à c11                                                                                      ⟨221656⟩
ajoute c13 à c11                                                                                      ⟨221660⟩
ajoute c11 à scène4                                                                                   ⟨221665⟩
si v17 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨221671⟩
    sub_C8D7(voix1, objets1[2])                                                                       ⟨221677⟩
    sub_CB9D(voix1, -1)                                                                               ⟨221682⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène4)                                                                      ⟨221689⟩
sinon :
    police_couleur (sub_3139A, non lue)(police=police1, couleur=161)                                  ⟨221721⟩
    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[2])                                     ⟨221730⟩
    tant que (scène4.compteur < 30) et (scène4.terminée == 0) :
        Scene_Tick(scène=scène4)                                                                      ⟨221737⟩
si v17 != 0 :
    scène4.compteur = 0                                                                               ⟨221761⟩
    tant que (scène4.compteur < 10) et (scène4.terminée == 0) :
        Scene_Tick(scène=scène4)                                                                      ⟨221767⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨221796⟩
si byte_4F55C != 0 :
    v177 = 0                                                                                          ⟨221819⟩
    v176 = 0                                                                                          ⟨221820⟩
    v167 = 0                                                                                          ⟨221837⟩
    v166 = 0                                                                                          ⟨221838⟩
    v157 = 0                                                                                          ⟨221855⟩
    v156 = 0                                                                                          ⟨221856⟩
    v141 = 0                                                                                          ⟨221877⟩
    v140 = 0                                                                                          ⟨221878⟩
    v131 = 0                                                                                          ⟨221895⟩
    v130 = 0                                                                                          ⟨221896⟩
    v121 = 0                                                                                          ⟨221913⟩
    v120 = 0                                                                                          ⟨221914⟩
    v111 = 0                                                                                          ⟨221931⟩
    v110 = 0                                                                                          ⟨221932⟩
    v93 = 0                                                                                           ⟨221949⟩
    v92 = 0                                                                                           ⟨221950⟩
    v83 = 0                                                                                           ⟨221967⟩
    v82 = 0                                                                                           ⟨221968⟩
    v67 = 0                                                                                           ⟨221989⟩
    v66 = 0                                                                                           ⟨221990⟩
    canal_arrête(canal=canal1)                                                                        ⟨221993⟩
    sub_5C1C(&v838, 2)                                                                                ⟨221998⟩
    v51 = 0                                                                                           ⟨222021⟩
    v50 = 0                                                                                           ⟨222022⟩
    v28 = 0                                                                                           ⟨222052⟩
    v23 = 0                                                                                           ⟨222053⟩
    v22 = 0                                                                                           ⟨222054⟩
    CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                    ⟨222067⟩
    voix_arrête(voix=voix1)                                                                           ⟨222072⟩
    v334 = 0                                                                                          ⟨222089⟩
    v329 = 0                                                                                          ⟨222090⟩
    v328 = 0                                                                                          ⟨222091⟩
    retour                                                                                            ⟨222111⟩
charge(to1mid1 5)                                                                                     ⟨222124⟩
palette_depuis(pal5(to1mid1 5))                                                                       ⟨222131⟩
charge(to1mid1 8)                                                                                     ⟨222143⟩
charge(to1mid1 13)                                                                                    ⟨222155⟩
charge(to1mid1 14)                                                                                    ⟨222167⟩

──── scène5 ────
scène5 = Scene_Create(cadence=10, palette=255, surface=&v310)                                         ⟨222179⟩
v1026 = 0                                                                                             ⟨222186⟩
v1024 = 152                                                                                           ⟨222188⟩
v1022 = 319                                                                                           ⟨222190⟩
v1020 = 199                                                                                           ⟨222192⟩
sub_30A1D(objet1, word_4D36E, police1)                                                                ⟨222195⟩
palette_copie(destination=pal1, source=pal5(to1mid1 5))                                               ⟨222204⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨222216⟩
c14 = Layer(ressource=to1mid1 17, x=0, y=0)                                                           ⟨222223⟩
ajoute c14 à scène5                                                                                   ⟨222229⟩
c15 = JitterImageLayer(ressource=to1mid1 8, x=0, y=-55, image=0)                                      ⟨222237⟩
si = c15                                                                                              ⟨222239⟩
c16 = ImageLayer(ressource=to1mid1 13, x=-18, y=0, image=0)                                           ⟨222246⟩
c17 = ImageLayer(ressource=to1mid1 14, x=25, y=0, image=0)                                            ⟨222255⟩
ajoute c16 à c15                                                                                      ⟨222260⟩
ajoute c17 à c15                                                                                      ⟨222264⟩
ajoute c15 à scène5                                                                                   ⟨222269⟩
si v17 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨222275⟩
    sub_C8D7(voix1, objets1[3])                                                                       ⟨222281⟩
    sub_CB9D(voix1, -1)                                                                               ⟨222286⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène5)                                                                      ⟨222293⟩
sinon :
    police_couleur (sub_3139A, non lue)(police=police1, couleur=227)                                  ⟨222325⟩
    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[3])                                     ⟨222335⟩
    tant que (scène5.compteur < 30) et (scène5.terminée == 0) :
        Scene_Tick(scène=scène5)                                                                      ⟨222342⟩
si v17 != 0 :
    scène5.compteur = 0                                                                               ⟨222366⟩
    tant que (scène5.compteur < 10) et (scène5.terminée == 0) :
        Scene_Tick(scène=scène5)                                                                      ⟨222372⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨222401⟩
si byte_4F55C != 0 :
    v231 = 0                                                                                          ⟨222424⟩
    v230 = 0                                                                                          ⟨222425⟩
    v221 = 0                                                                                          ⟨222442⟩
    v220 = 0                                                                                          ⟨222443⟩
    v211 = 0                                                                                          ⟨222460⟩
    v210 = 0                                                                                          ⟨222461⟩
    v195 = 0                                                                                          ⟨222482⟩
    v194 = 0                                                                                          ⟨222483⟩
    v177 = 0                                                                                          ⟨222500⟩
    v176 = 0                                                                                          ⟨222501⟩
    v167 = 0                                                                                          ⟨222518⟩
    v166 = 0                                                                                          ⟨222519⟩
    v157 = 0                                                                                          ⟨222536⟩
    v156 = 0                                                                                          ⟨222537⟩
    v141 = 0                                                                                          ⟨222558⟩
    v140 = 0                                                                                          ⟨222559⟩
    v131 = 0                                                                                          ⟨222576⟩
    v130 = 0                                                                                          ⟨222577⟩
    v121 = 0                                                                                          ⟨222594⟩
    v120 = 0                                                                                          ⟨222595⟩
    v111 = 0                                                                                          ⟨222612⟩
    v110 = 0                                                                                          ⟨222613⟩
    v93 = 0                                                                                           ⟨222630⟩
    v92 = 0                                                                                           ⟨222631⟩
    v83 = 0                                                                                           ⟨222648⟩
    v82 = 0                                                                                           ⟨222649⟩
    v67 = 0                                                                                           ⟨222670⟩
    v66 = 0                                                                                           ⟨222671⟩
    canal_arrête(canal=canal1)                                                                        ⟨222674⟩
    sub_5C1C(&v838, 2)                                                                                ⟨222679⟩
    v51 = 0                                                                                           ⟨222702⟩
    v50 = 0                                                                                           ⟨222703⟩
    v28 = 0                                                                                           ⟨222733⟩
    v23 = 0                                                                                           ⟨222734⟩
    v22 = 0                                                                                           ⟨222735⟩
    CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                    ⟨222748⟩
    voix_arrête(voix=voix1)                                                                           ⟨222753⟩
    v334 = 0                                                                                          ⟨222770⟩
    v329 = 0                                                                                          ⟨222771⟩
    v328 = 0                                                                                          ⟨222772⟩
    retour                                                                                            ⟨222792⟩

──── scène6 ────
scène6 = Scene_Create(cadence=10, palette=255, surface=&v310)                                         ⟨222801⟩
v1026 = 0                                                                                             ⟨222808⟩
v1024 = 152                                                                                           ⟨222810⟩
v1022 = 319                                                                                           ⟨222812⟩
v1020 = 199                                                                                           ⟨222814⟩
sub_30A1D(objet1, word_4D36E, police1)                                                                ⟨222817⟩
palette_copie(destination=pal1, source=pal3(to1mid1 5))                                               ⟨222826⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨222838⟩
c18 = Layer(ressource=to1mid1 6, x=0, y=0)                                                            ⟨222845⟩
ajoute c18 à scène6                                                                                   ⟨222851⟩
c19 = JitterImageLayer(ressource=to1mid1 4, x=0, y=-47, image=0)                                      ⟨222859⟩
si = c19                                                                                              ⟨222861⟩
c20 = ImageLayer(ressource=to1mid1 11, x=-86, y=1, image=0)                                           ⟨222868⟩
c21 = ImageLayer(ressource=to1mid1 12, x=21, y=0, image=0)                                            ⟨222877⟩
ajoute c20 à c19                                                                                      ⟨222882⟩
ajoute c21 à c19                                                                                      ⟨222886⟩
ajoute c19 à scène6                                                                                   ⟨222891⟩
si v17 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨222897⟩
    sub_C8D7(voix1, objets1[4])                                                                       ⟨222903⟩
    sub_CB9D(voix1, -1)                                                                               ⟨222908⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène6)                                                                      ⟨222915⟩
sinon :
    police_couleur (sub_3139A, non lue)(police=police1, couleur=161)                                  ⟨222947⟩
    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[4])                                     ⟨222956⟩
    tant que (scène6.compteur < 30) et (scène6.terminée == 0) :
        Scene_Tick(scène=scène6)                                                                      ⟨222963⟩
si v17 != 0 :
    scène6.compteur = 0                                                                               ⟨222987⟩
    tant que (scène6.compteur < 10) et (scène6.terminée == 0) :
        Scene_Tick(scène=scène6)                                                                      ⟨222993⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨223022⟩
si byte_4F55C != 0 :
    v231 = 0                                                                                          ⟨223045⟩
    v230 = 0                                                                                          ⟨223046⟩
    v221 = 0                                                                                          ⟨223063⟩
    v220 = 0                                                                                          ⟨223064⟩
    v211 = 0                                                                                          ⟨223081⟩
    v210 = 0                                                                                          ⟨223082⟩
    v195 = 0                                                                                          ⟨223103⟩
    v194 = 0                                                                                          ⟨223104⟩
    v177 = 0                                                                                          ⟨223121⟩
    v176 = 0                                                                                          ⟨223122⟩
    v167 = 0                                                                                          ⟨223139⟩
    v166 = 0                                                                                          ⟨223140⟩
    v157 = 0                                                                                          ⟨223157⟩
    v156 = 0                                                                                          ⟨223158⟩
    v141 = 0                                                                                          ⟨223179⟩
    v140 = 0                                                                                          ⟨223180⟩
    v131 = 0                                                                                          ⟨223197⟩
    v130 = 0                                                                                          ⟨223198⟩
    v121 = 0                                                                                          ⟨223215⟩
    v120 = 0                                                                                          ⟨223216⟩
    v111 = 0                                                                                          ⟨223233⟩
    v110 = 0                                                                                          ⟨223234⟩
    v93 = 0                                                                                           ⟨223251⟩
    v92 = 0                                                                                           ⟨223252⟩
    v83 = 0                                                                                           ⟨223269⟩
    v82 = 0                                                                                           ⟨223270⟩
    v67 = 0                                                                                           ⟨223291⟩
    v66 = 0                                                                                           ⟨223292⟩
    canal_arrête(canal=canal1)                                                                        ⟨223295⟩
    sub_5C1C(&v838, 2)                                                                                ⟨223300⟩
    v51 = 0                                                                                           ⟨223323⟩
    v50 = 0                                                                                           ⟨223324⟩
    v28 = 0                                                                                           ⟨223354⟩
    v23 = 0                                                                                           ⟨223355⟩
    v22 = 0                                                                                           ⟨223356⟩
    CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                    ⟨223369⟩
    voix_arrête(voix=voix1)                                                                           ⟨223374⟩
    v334 = 0                                                                                          ⟨223391⟩
    v329 = 0                                                                                          ⟨223392⟩
    v328 = 0                                                                                          ⟨223393⟩
    retour                                                                                            ⟨223413⟩

──── scène7 ────
scène7 = Scene_Create(cadence=10, palette=255, surface=&v310)                                         ⟨223422⟩
v1026 = 0                                                                                             ⟨223429⟩
v1024 = 152                                                                                           ⟨223431⟩
v1022 = 319                                                                                           ⟨223433⟩
v1020 = 199                                                                                           ⟨223435⟩
sub_30A1D(objet1, word_4D36E, police1)                                                                ⟨223438⟩
palette_copie(destination=pal1, source=pal5(to1mid1 5))                                               ⟨223447⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨223459⟩
c22 = Layer(ressource=to1mid1 17, x=0, y=0)                                                           ⟨223466⟩
ajoute c22 à scène7                                                                                   ⟨223472⟩
c23 = JitterImageLayer(ressource=to1mid1 8, x=0, y=-55, image=0)                                      ⟨223480⟩
si = c23                                                                                              ⟨223482⟩
c24 = ImageLayer(ressource=to1mid1 13, x=-18, y=0, image=0)                                           ⟨223489⟩
c25 = ImageLayer(ressource=to1mid1 14, x=25, y=0, image=0)                                            ⟨223498⟩
ajoute c24 à c23                                                                                      ⟨223503⟩
ajoute c25 à c23                                                                                      ⟨223507⟩
ajoute c23 à scène7                                                                                   ⟨223512⟩
si v17 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨223518⟩
    sub_C8D7(voix1, objets1[5])                                                                       ⟨223524⟩
    sub_CB9D(voix1, -1)                                                                               ⟨223529⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène7)                                                                      ⟨223536⟩
sinon :
    police_couleur (sub_3139A, non lue)(police=police1, couleur=227)                                  ⟨223568⟩
    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[5])                                     ⟨223578⟩
    tant que (scène7.compteur < 30) et (scène7.terminée == 0) :
        Scene_Tick(scène=scène7)                                                                      ⟨223585⟩
scène7.compteur = 0                                                                                   ⟨223607⟩
si v17 != 0 :
    tant que (scène7.compteur < 10) et (scène7.terminée == 0) :
        Scene_Tick(scène=scène7)                                                                      ⟨223615⟩
    scène7.compteur = 0                                                                               ⟨223635⟩
si v17 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨223642⟩
    sub_C8D7(voix1, objets1[6])                                                                       ⟨223648⟩
    sub_CB9D(voix1, -1)                                                                               ⟨223653⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène7)                                                                      ⟨223660⟩
sinon :
    sub_30AD0(objet1, 0)                                                                              ⟨223692⟩
    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[6])                                     ⟨223702⟩
    tant que (scène7.compteur < 30) et (scène7.terminée == 0) :
        Scene_Tick(scène=scène7)                                                                      ⟨223709⟩
si v17 != 0 :
    scène7.compteur = 0                                                                               ⟨223733⟩
    tant que (scène7.compteur < 10) et (scène7.terminée == 0) :
        Scene_Tick(scène=scène7)                                                                      ⟨223739⟩
Scene_Destruct(scène=scène7, drapeaux=0)                                                              ⟨223768⟩
si byte_4F55C != 0 :
    v231 = 0                                                                                          ⟨223791⟩
    v230 = 0                                                                                          ⟨223792⟩
    v221 = 0                                                                                          ⟨223809⟩
    v220 = 0                                                                                          ⟨223810⟩
    v211 = 0                                                                                          ⟨223827⟩
    v210 = 0                                                                                          ⟨223828⟩
    v195 = 0                                                                                          ⟨223849⟩
    v194 = 0                                                                                          ⟨223850⟩
    v177 = 0                                                                                          ⟨223867⟩
    v176 = 0                                                                                          ⟨223868⟩
    v167 = 0                                                                                          ⟨223885⟩
    v166 = 0                                                                                          ⟨223886⟩
    v157 = 0                                                                                          ⟨223903⟩
    v156 = 0                                                                                          ⟨223904⟩
    v141 = 0                                                                                          ⟨223925⟩
    v140 = 0                                                                                          ⟨223926⟩
    v131 = 0                                                                                          ⟨223943⟩
    v130 = 0                                                                                          ⟨223944⟩
    v121 = 0                                                                                          ⟨223961⟩
    v120 = 0                                                                                          ⟨223962⟩
    v111 = 0                                                                                          ⟨223979⟩
    v110 = 0                                                                                          ⟨223980⟩
    v93 = 0                                                                                           ⟨223997⟩
    v92 = 0                                                                                           ⟨223998⟩
    v83 = 0                                                                                           ⟨224015⟩
    v82 = 0                                                                                           ⟨224016⟩
    v67 = 0                                                                                           ⟨224037⟩
    v66 = 0                                                                                           ⟨224038⟩
    canal_arrête(canal=canal1)                                                                        ⟨224041⟩
    sub_5C1C(&v838, 2)                                                                                ⟨224046⟩
    v51 = 0                                                                                           ⟨224069⟩
    v50 = 0                                                                                           ⟨224070⟩
    v28 = 0                                                                                           ⟨224100⟩
    v23 = 0                                                                                           ⟨224101⟩
    v22 = 0                                                                                           ⟨224102⟩
    CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                    ⟨224115⟩
    voix_arrête(voix=voix1)                                                                           ⟨224120⟩
    v334 = 0                                                                                          ⟨224137⟩
    v329 = 0                                                                                          ⟨224138⟩
    v328 = 0                                                                                          ⟨224139⟩
    retour                                                                                            ⟨224159⟩

──── scène8 ────
scène8 = Scene_Create(cadence=10, palette=255, surface=&v310)                                         ⟨224168⟩
v1026 = 0                                                                                             ⟨224175⟩
v1024 = 152                                                                                           ⟨224177⟩
v1022 = 319                                                                                           ⟨224179⟩
v1020 = 199                                                                                           ⟨224181⟩
sub_30A1D(objet1, word_4D36E, police1)                                                                ⟨224184⟩
palette_copie(destination=pal1, source=pal4(to1mid1 5))                                               ⟨224193⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨224205⟩
c26 = Layer(ressource=to1mid1 6, x=0, y=0)                                                            ⟨224212⟩
ajoute c26 à scène8                                                                                   ⟨224218⟩
c27 = JitterImageLayer(ressource=to1mid1 7, x=0, y=-47, image=0)                                      ⟨224226⟩
si = c27                                                                                              ⟨224228⟩
c28 = ImageLayer(ressource=to1mid1 9, x=86, y=0, image=0)                                             ⟨224235⟩
c29 = ImageLayer(ressource=to1mid1 10, x=-20, y=0, image=0)                                           ⟨224244⟩
ajoute c28 à c27                                                                                      ⟨224249⟩
ajoute c29 à c27                                                                                      ⟨224253⟩
ajoute c27 à scène8                                                                                   ⟨224258⟩
si v17 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨224264⟩
    sub_C8D7(voix1, objets1[7])                                                                       ⟨224270⟩
    sub_CB9D(voix1, -1)                                                                               ⟨224275⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène8)                                                                      ⟨224282⟩
sinon :
    police_couleur (sub_3139A, non lue)(police=police1, couleur=101)                                  ⟨224314⟩
    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[7])                                     ⟨224324⟩
    tant que (scène8.compteur < 30) et (scène8.terminée == 0) :
        Scene_Tick(scène=scène8)                                                                      ⟨224331⟩
si v17 != 0 :
    scène8.compteur = 0                                                                               ⟨224355⟩
    tant que (scène8.compteur < 10) et (scène8.terminée == 0) :
        Scene_Tick(scène=scène8)                                                                      ⟨224361⟩
Scene_Destruct(scène=scène8, drapeaux=0)                                                              ⟨224390⟩
si byte_4F55C != 0 :
    v231 = 0                                                                                          ⟨224413⟩
    v230 = 0                                                                                          ⟨224414⟩
    v221 = 0                                                                                          ⟨224431⟩
    v220 = 0                                                                                          ⟨224432⟩
    v211 = 0                                                                                          ⟨224449⟩
    v210 = 0                                                                                          ⟨224450⟩
    v195 = 0                                                                                          ⟨224471⟩
    v194 = 0                                                                                          ⟨224472⟩
    v177 = 0                                                                                          ⟨224489⟩
    v176 = 0                                                                                          ⟨224490⟩
    v167 = 0                                                                                          ⟨224507⟩
    v166 = 0                                                                                          ⟨224508⟩
    v157 = 0                                                                                          ⟨224525⟩
    v156 = 0                                                                                          ⟨224526⟩
    v141 = 0                                                                                          ⟨224547⟩
    v140 = 0                                                                                          ⟨224548⟩
    v131 = 0                                                                                          ⟨224565⟩
    v130 = 0                                                                                          ⟨224566⟩
    v121 = 0                                                                                          ⟨224583⟩
    v120 = 0                                                                                          ⟨224584⟩
    v111 = 0                                                                                          ⟨224601⟩
    v110 = 0                                                                                          ⟨224602⟩
    v93 = 0                                                                                           ⟨224619⟩
    v92 = 0                                                                                           ⟨224620⟩
    v83 = 0                                                                                           ⟨224637⟩
    v82 = 0                                                                                           ⟨224638⟩
    v67 = 0                                                                                           ⟨224659⟩
    v66 = 0                                                                                           ⟨224660⟩
    canal_arrête(canal=canal1)                                                                        ⟨224663⟩
    sub_5C1C(&v838, 2)                                                                                ⟨224668⟩
    v51 = 0                                                                                           ⟨224691⟩
    v50 = 0                                                                                           ⟨224692⟩
    v28 = 0                                                                                           ⟨224722⟩
    v23 = 0                                                                                           ⟨224723⟩
    v22 = 0                                                                                           ⟨224724⟩
    CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                    ⟨224737⟩
    voix_arrête(voix=voix1)                                                                           ⟨224742⟩
    v334 = 0                                                                                          ⟨224759⟩
    v329 = 0                                                                                          ⟨224760⟩
    v328 = 0                                                                                          ⟨224761⟩
    retour                                                                                            ⟨224781⟩

──── scène9 ────
scène9 = Scene_Create(cadence=10, palette=255, surface=&v310)                                         ⟨224790⟩
v1026 = 0                                                                                             ⟨224797⟩
v1024 = 152                                                                                           ⟨224799⟩
v1022 = 319                                                                                           ⟨224801⟩
v1020 = 199                                                                                           ⟨224803⟩
sub_30A1D(objet1, word_4D36E, police1)                                                                ⟨224806⟩
palette_copie(destination=pal1, source=pal3(to1mid1 5))                                               ⟨224815⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨224827⟩
c30 = Layer(ressource=to1mid1 17, x=0, y=0)                                                           ⟨224834⟩
ajoute c30 à scène9                                                                                   ⟨224840⟩
c31 = JitterImageLayer(ressource=to1mid1 4, x=0, y=-47, image=0)                                      ⟨224848⟩
si = c31                                                                                              ⟨224850⟩
c32 = ImageLayer(ressource=to1mid1 11, x=-86, y=1, image=0)                                           ⟨224857⟩
c33 = ImageLayer(ressource=to1mid1 12, x=21, y=0, image=0)                                            ⟨224866⟩
ajoute c32 à c31                                                                                      ⟨224871⟩
ajoute c33 à c31                                                                                      ⟨224875⟩
ajoute c31 à scène9                                                                                   ⟨224880⟩
si v17 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨224886⟩
    sub_C8D7(voix1, objets1[8])                                                                       ⟨224892⟩
    sub_CB9D(voix1, -1)                                                                               ⟨224897⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène9)                                                                      ⟨224904⟩
sinon :
    police_couleur (sub_3139A, non lue)(police=police1, couleur=161)                                  ⟨224936⟩
    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[8])                                     ⟨224945⟩
    tant que (scène9.compteur < 30) et (scène9.terminée == 0) :
        Scene_Tick(scène=scène9)                                                                      ⟨224952⟩
si v17 != 0 :
    scène9.compteur = 0                                                                               ⟨224976⟩
    tant que (scène9.compteur < 10) et (scène9.terminée == 0) :
        Scene_Tick(scène=scène9)                                                                      ⟨224982⟩
Scene_Destruct(scène=scène9, drapeaux=0)                                                              ⟨225011⟩
si byte_4F55C != 0 :
    v231 = 0                                                                                          ⟨225034⟩
    v230 = 0                                                                                          ⟨225035⟩
    v221 = 0                                                                                          ⟨225052⟩
    v220 = 0                                                                                          ⟨225053⟩
    v211 = 0                                                                                          ⟨225070⟩
    v210 = 0                                                                                          ⟨225071⟩
    v195 = 0                                                                                          ⟨225092⟩
    v194 = 0                                                                                          ⟨225093⟩
    v177 = 0                                                                                          ⟨225110⟩
    v176 = 0                                                                                          ⟨225111⟩
    v167 = 0                                                                                          ⟨225128⟩
    v166 = 0                                                                                          ⟨225129⟩
    v157 = 0                                                                                          ⟨225146⟩
    v156 = 0                                                                                          ⟨225147⟩
    v141 = 0                                                                                          ⟨225168⟩
    v140 = 0                                                                                          ⟨225169⟩
    v131 = 0                                                                                          ⟨225186⟩
    v130 = 0                                                                                          ⟨225187⟩
    v121 = 0                                                                                          ⟨225204⟩
    v120 = 0                                                                                          ⟨225205⟩
    v111 = 0                                                                                          ⟨225222⟩
    v110 = 0                                                                                          ⟨225223⟩
    v93 = 0                                                                                           ⟨225240⟩
    v92 = 0                                                                                           ⟨225241⟩
    v83 = 0                                                                                           ⟨225258⟩
    v82 = 0                                                                                           ⟨225259⟩
    v67 = 0                                                                                           ⟨225280⟩
    v66 = 0                                                                                           ⟨225281⟩
    canal_arrête(canal=canal1)                                                                        ⟨225284⟩
    sub_5C1C(&v838, 2)                                                                                ⟨225289⟩
    v51 = 0                                                                                           ⟨225312⟩
    v50 = 0                                                                                           ⟨225313⟩
    v28 = 0                                                                                           ⟨225343⟩
    v23 = 0                                                                                           ⟨225344⟩
    v22 = 0                                                                                           ⟨225345⟩
    CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                    ⟨225358⟩
    voix_arrête(voix=voix1)                                                                           ⟨225363⟩
    v334 = 0                                                                                          ⟨225380⟩
    v329 = 0                                                                                          ⟨225381⟩
    v328 = 0                                                                                          ⟨225382⟩
    retour                                                                                            ⟨225402⟩

──── scène10 ────
scène10 = Scene_Create(cadence=10, palette=255, surface=&v310)                                        ⟨225411⟩
v1026 = 0                                                                                             ⟨225418⟩
v1024 = 152                                                                                           ⟨225420⟩
v1022 = 319                                                                                           ⟨225422⟩
v1020 = 199                                                                                           ⟨225424⟩
sub_30A1D(objet1, word_4D36E, police1)                                                                ⟨225427⟩
palette_copie(destination=pal1, source=pal5(to1mid1 5))                                               ⟨225436⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨225448⟩
c34 = Layer(ressource=to1mid1 6, x=0, y=0)                                                            ⟨225455⟩
ajoute c34 à scène10                                                                                  ⟨225461⟩
c35 = JitterImageLayer(ressource=to1mid1 8, x=0, y=-55, image=0)                                      ⟨225469⟩
si = c35                                                                                              ⟨225471⟩
c36 = ImageLayer(ressource=to1mid1 13, x=-18, y=0, image=0)                                           ⟨225478⟩
c37 = ImageLayer(ressource=to1mid1 14, x=25, y=0, image=0)                                            ⟨225487⟩
ajoute c36 à c35                                                                                      ⟨225492⟩
ajoute c37 à c35                                                                                      ⟨225496⟩
ajoute c35 à scène10                                                                                  ⟨225501⟩
si v17 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨225507⟩
    sub_C8D7(voix1, objets1[9])                                                                       ⟨225513⟩
    sub_CB9D(voix1, -1)                                                                               ⟨225518⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène10)                                                                     ⟨225525⟩
sinon :
    police_couleur (sub_3139A, non lue)(police=police1, couleur=227)                                  ⟨225557⟩
    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[9])                                     ⟨225567⟩
    tant que (scène10.compteur < 30) et (scène10.terminée == 0) :
        Scene_Tick(scène=scène10)                                                                     ⟨225574⟩
si v17 != 0 :
    scène10.compteur = 0                                                                              ⟨225598⟩
    voix_arrête(voix=voix1)                                                                           ⟨225601⟩
    tant que (scène10.compteur < 10) et (scène10.terminée == 0) :
        Scene_Tick(scène=scène10)                                                                     ⟨225608⟩
Scene_Destruct(scène=scène10, drapeaux=0)                                                             ⟨225637⟩
si byte_4F55C != 0 :
    v231 = 0                                                                                          ⟨225660⟩
    v230 = 0                                                                                          ⟨225661⟩
    v221 = 0                                                                                          ⟨225678⟩
    v220 = 0                                                                                          ⟨225679⟩
    v211 = 0                                                                                          ⟨225696⟩
    v210 = 0                                                                                          ⟨225697⟩
    v195 = 0                                                                                          ⟨225718⟩
    v194 = 0                                                                                          ⟨225719⟩
    v177 = 0                                                                                          ⟨225736⟩
    v176 = 0                                                                                          ⟨225737⟩
    v167 = 0                                                                                          ⟨225754⟩
    v166 = 0                                                                                          ⟨225755⟩
    v157 = 0                                                                                          ⟨225772⟩
    v156 = 0                                                                                          ⟨225773⟩
    v141 = 0                                                                                          ⟨225794⟩
    v140 = 0                                                                                          ⟨225795⟩
    v131 = 0                                                                                          ⟨225812⟩
    v130 = 0                                                                                          ⟨225813⟩
    v121 = 0                                                                                          ⟨225830⟩
    v120 = 0                                                                                          ⟨225831⟩
    v111 = 0                                                                                          ⟨225848⟩
    v110 = 0                                                                                          ⟨225849⟩
    v93 = 0                                                                                           ⟨225866⟩
    v92 = 0                                                                                           ⟨225867⟩
    v83 = 0                                                                                           ⟨225884⟩
    v82 = 0                                                                                           ⟨225885⟩
    v67 = 0                                                                                           ⟨225906⟩
    v66 = 0                                                                                           ⟨225907⟩
    canal_arrête(canal=canal1)                                                                        ⟨225910⟩
    sub_5C1C(&v838, 2)                                                                                ⟨225915⟩
    v51 = 0                                                                                           ⟨225938⟩
    v50 = 0                                                                                           ⟨225939⟩
    v28 = 0                                                                                           ⟨225969⟩
    v23 = 0                                                                                           ⟨225970⟩
    v22 = 0                                                                                           ⟨225971⟩
    CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                    ⟨225984⟩
    voix_arrête(voix=voix1)                                                                           ⟨225989⟩
    v334 = 0                                                                                          ⟨226006⟩
    v329 = 0                                                                                          ⟨226007⟩
    v328 = 0                                                                                          ⟨226008⟩
    retour                                                                                            ⟨226028⟩
v248 = 0                                                                                              ⟨226034⟩
charge(to1mid1 1)                                                                                     ⟨226041⟩
palette_depuis(pal6(to1mid1 1))                                                                       ⟨226048⟩
v850 = word_4D392                                                                                     ⟨226056⟩
word_4D392 = &v852                                                                                    ⟨226058⟩
si v46 != 0 :
    charge(asoundfx 101)                                                                              ⟨226072⟩
    canal_init(canal=canal2, pilote=word_4CA5D)                                                       ⟨226077⟩
    canal_enregistre(canal=canal2, ressource=asoundfx 101, x=0)                                       ⟨226084⟩
charge(to1mid1 0)                                                                                     ⟨226098⟩

──── scène11 ────
scène11 = Scene_Create(cadence=20, palette=255, surface=&v310)                                        ⟨226106⟩
c38 = OverlayImageLayer(ressource=to1mid1 0, x=0, y=0, image=0)                                       ⟨226114⟩
di = c38                                                                                              ⟨226116⟩
palette_copie(destination=pal1, source=pal6(to1mid1 1))                                               ⟨226124⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨226136⟩
ajoute c38 à scène11                                                                                  ⟨226141⟩
si = 0                                                                                                ⟨226143⟩
tant que (scène11.compteur < 44) et (scène11.terminée == 0) :
    si (v46 != 0) et (si == 18 ou si == 23 ou si == 27) :
        v282 = word_4F03E                                                                             ⟨226158⟩
        v284 = 0                                                                                      ⟨226159⟩
        si canal2.+0 != 0 :
            AIL_start_sequence(pilote=canal2.+0→4, séquence=v854)                                     ⟨226165⟩
            sub_50F5(canal2.+0→4, v854, v282, v284)                                                   ⟨226172⟩
    v286 = si                                                                                         ⟨226177⟩
    c38.image = v286                                                                                  ⟨226179⟩
    si = si + 1                                                                                       ⟨226180⟩
    Scene_Tick(scène=scène11)                                                                         ⟨226183⟩
Scene_Destruct(scène=scène11, drapeaux=0)                                                             ⟨226209⟩
canal_arrête(canal=canal2)                                                                            ⟨226231⟩
sub_5C1C(&v852, 2)                                                                                    ⟨226236⟩
v248 = 0                                                                                              ⟨226277⟩
v248 = 0                                                                                              ⟨226281⟩
v852 = 436                                                                                            ⟨226282⟩
v850 = word_4D392                                                                                     ⟨226284⟩
word_4D392 = &v852                                                                                    ⟨226286⟩
v852 = 444                                                                                            ⟨226287⟩
v848 = 0                                                                                              ⟨226288⟩
v844 = 0                                                                                              ⟨226289⟩
v854 = -1                                                                                             ⟨226291⟩
si v46 != 0 :
    charge(asoundfx 101)                                                                              ⟨226300⟩
    canal_init(canal=canal2, pilote=word_4CA5D)                                                       ⟨226305⟩
    canal_enregistre(canal=canal2, ressource=asoundfx 101, x=0)                                       ⟨226312⟩
charge(to1mid1 15)                                                                                    ⟨226326⟩
charge(to1mid1 16)                                                                                    ⟨226338⟩
charge(to1mid1 1)                                                                                     ⟨226350⟩
palette_depuis(pal7(to1mid1 1))                                                                       ⟨226357⟩

──── scène12 ────
scène12 = Scene_Create(cadence=20, palette=255, surface=&v310)                                        ⟨226365⟩
si = c39                                                                                              ⟨226370⟩
c39 = MovingLayer(ressource=to1mid1 16, x=0, y=-176, image=0)                                         ⟨226379⟩
c39.vx = 0                                                                                            ⟨226383⟩
c39.vy = 0                                                                                            ⟨226384⟩
c39.vx = 0                                                                                            ⟨226385⟩
c39.vy = 0                                                                                            ⟨226386⟩
di = c40                                                                                              ⟨226398⟩
c40 = MovingLayer(ressource=to1mid1 15, x=0, y=0, image=0)                                            ⟨226407⟩
c40.vx = 0                                                                                            ⟨226411⟩
c40.vy = 0                                                                                            ⟨226412⟩
c40.vx = 0                                                                                            ⟨226413⟩
c40.vy = 0                                                                                            ⟨226414⟩
palette_copie(destination=pal1, source=pal7(to1mid1 1))                                               ⟨226430⟩
ajoute c39 à scène12                                                                                  ⟨226435⟩
ajoute c40 à scène12                                                                                  ⟨226441⟩
c40.vx = 0                                                                                            ⟨226444⟩
c40.vy = 1                                                                                            ⟨226446⟩
c39.vx = 0                                                                                            ⟨226448⟩
c39.vy = 1                                                                                            ⟨226450⟩
tant que c40.y_absolu() < 97 :
    Scene_Tick(scène=scène12)                                                                         ⟨226456⟩
c40.vx = 0                                                                                            ⟨226468⟩
c40.vy = 0                                                                                            ⟨226470⟩
c39.vx = 0                                                                                            ⟨226472⟩
c39.vy = 0                                                                                            ⟨226474⟩
scène12.compteur = 0                                                                                  ⟨226475⟩
Scene_SetFps(scène=scène12, cadence=10)                                                               ⟨226479⟩
police_couleur (sub_3139A, non lue)(police=police1, couleur=227)                                      ⟨226484⟩
sous_titre (sub_C8F5, non lue)(zone=objet2, texte=textes1[10])                                        ⟨226494⟩
tant que (scène12.compteur < 30) et (scène12.terminée == 0) :
    Scene_Tick(scène=scène12)                                                                         ⟨226501⟩
scène12.compteur = 0                                                                                  ⟨226521⟩
sub_30AD0(objet2, 0)                                                                                  ⟨226525⟩
sous_titre (sub_C8F5, non lue)(zone=objet2, texte=textes1[11])                                        ⟨226535⟩
tant que (scène12.compteur < 30) et (scène12.terminée == 0) :
    Scene_Tick(scène=scène12)                                                                         ⟨226542⟩
scène12.compteur = 0                                                                                  ⟨226562⟩
sub_30AD0(objet2, 0)                                                                                  ⟨226566⟩
sous_titre (sub_C8F5, non lue)(zone=objet2, texte=textes1[12])                                        ⟨226576⟩
tant que (scène12.compteur < 30) et (scène12.terminée == 0) :
    Scene_Tick(scène=scène12)                                                                         ⟨226583⟩
scène12.compteur = 0                                                                                  ⟨226603⟩
sub_30AD0(objet2, 0)                                                                                  ⟨226607⟩
sous_titre (sub_C8F5, non lue)(zone=objet2, texte=textes1[13])                                        ⟨226617⟩
tant que (scène12.compteur < 30) et (scène12.terminée == 0) :
    Scene_Tick(scène=scène12)                                                                         ⟨226624⟩
scène12.compteur = 0                                                                                  ⟨226644⟩
sub_30AD0(objet2, 0)                                                                                  ⟨226648⟩
sous_titre (sub_C8F5, non lue)(zone=objet2, texte=textes1[14])                                        ⟨226658⟩
tant que (scène12.compteur < 30) et (scène12.terminée == 0) :
    Scene_Tick(scène=scène12)                                                                         ⟨226665⟩
scène12.compteur = 0                                                                                  ⟨226685⟩
sub_30AD0(objet2, 0)                                                                                  ⟨226689⟩
sous_titre (sub_C8F5, non lue)(zone=objet2, texte=textes1[15])                                        ⟨226699⟩
tant que (scène12.compteur < 30) et (scène12.terminée == 0) :
    Scene_Tick(scène=scène12)                                                                         ⟨226706⟩
fondu_disparition(palette=pal1, couleur=&v16, pas=2, premier=0, nombre=256)                           ⟨226733⟩
Scene_Destruct(scène=scène12, drapeaux=0)                                                             ⟨226738⟩
v278 = 0                                                                                              ⟨226761⟩
v268 = 0                                                                                              ⟨226779⟩
v258 = 0                                                                                              ⟨226797⟩
canal_arrête(canal=canal2)                                                                            ⟨226800⟩
sub_5C1C(&v852, 2)                                                                                    ⟨226805⟩
v248 = 0                                                                                              ⟨226824⟩
si byte_4F55C != 0 :
    v231 = 0                                                                                          ⟨226846⟩
    v230 = 0                                                                                          ⟨226847⟩
    v221 = 0                                                                                          ⟨226864⟩
    v220 = 0                                                                                          ⟨226865⟩
    v211 = 0                                                                                          ⟨226882⟩
    v210 = 0                                                                                          ⟨226883⟩
    v195 = 0                                                                                          ⟨226904⟩
    v194 = 0                                                                                          ⟨226905⟩
    v177 = 0                                                                                          ⟨226922⟩
    v176 = 0                                                                                          ⟨226923⟩
    v167 = 0                                                                                          ⟨226940⟩
    v166 = 0                                                                                          ⟨226941⟩
    v157 = 0                                                                                          ⟨226958⟩
    v156 = 0                                                                                          ⟨226959⟩
    v141 = 0                                                                                          ⟨226980⟩
    v140 = 0                                                                                          ⟨226981⟩
    v131 = 0                                                                                          ⟨226998⟩
    v130 = 0                                                                                          ⟨226999⟩
    v121 = 0                                                                                          ⟨227016⟩
    v120 = 0                                                                                          ⟨227017⟩
    v111 = 0                                                                                          ⟨227034⟩
    v110 = 0                                                                                          ⟨227035⟩
    v93 = 0                                                                                           ⟨227052⟩
    v92 = 0                                                                                           ⟨227053⟩
    v83 = 0                                                                                           ⟨227070⟩
    v82 = 0                                                                                           ⟨227071⟩
    v67 = 0                                                                                           ⟨227092⟩
    v66 = 0                                                                                           ⟨227093⟩
    canal_arrête(canal=canal1)                                                                        ⟨227096⟩
    sub_5C1C(&v838, 2)                                                                                ⟨227101⟩
    v51 = 0                                                                                           ⟨227124⟩
    v50 = 0                                                                                           ⟨227125⟩
    v28 = 0                                                                                           ⟨227155⟩
    v23 = 0                                                                                           ⟨227156⟩
    v22 = 0                                                                                           ⟨227157⟩
    CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                    ⟨227170⟩
    voix_arrête(voix=voix1)                                                                           ⟨227175⟩
    v334 = 0                                                                                          ⟨227192⟩
    v329 = 0                                                                                          ⟨227193⟩
    v328 = 0                                                                                          ⟨227194⟩
    retour                                                                                            ⟨227214⟩
v231 = 0                                                                                              ⟨227233⟩
v230 = 0                                                                                              ⟨227234⟩
v221 = 0                                                                                              ⟨227251⟩
v220 = 0                                                                                              ⟨227252⟩
v211 = 0                                                                                              ⟨227269⟩
v210 = 0                                                                                              ⟨227270⟩
v195 = 0                                                                                              ⟨227291⟩
v194 = 0                                                                                              ⟨227292⟩
v177 = 0                                                                                              ⟨227309⟩
v176 = 0                                                                                              ⟨227310⟩
v167 = 0                                                                                              ⟨227327⟩
v166 = 0                                                                                              ⟨227328⟩
v157 = 0                                                                                              ⟨227345⟩
v156 = 0                                                                                              ⟨227346⟩
v141 = 0                                                                                              ⟨227367⟩
v140 = 0                                                                                              ⟨227368⟩
v131 = 0                                                                                              ⟨227385⟩
v130 = 0                                                                                              ⟨227386⟩
v121 = 0                                                                                              ⟨227403⟩
v120 = 0                                                                                              ⟨227404⟩
v111 = 0                                                                                              ⟨227421⟩
v110 = 0                                                                                              ⟨227422⟩
v93 = 0                                                                                               ⟨227439⟩
v92 = 0                                                                                               ⟨227440⟩
v83 = 0                                                                                               ⟨227457⟩
v82 = 0                                                                                               ⟨227458⟩
v67 = 0                                                                                               ⟨227479⟩
v66 = 0                                                                                               ⟨227480⟩
canal_arrête(canal=canal1)                                                                            ⟨227483⟩
sub_5C1C(&v838, 2)                                                                                    ⟨227488⟩
v51 = 0                                                                                               ⟨227511⟩
v50 = 0                                                                                               ⟨227512⟩
v28 = 0                                                                                               ⟨227542⟩
v23 = 0                                                                                               ⟨227543⟩
v22 = 0                                                                                               ⟨227544⟩
CRT_Doprnt_Core(objets1, 10, 10, 1, sub_479E0)                                                        ⟨227557⟩
voix_arrête(voix=voix1)                                                                               ⟨227562⟩
v334 = 0                                                                                              ⟨227579⟩
v329 = 0                                                                                              ⟨227580⟩
v328 = 0                                                                                              ⟨227581⟩
retour                                                                                                ⟨227601⟩
```

## Tableaux du segment de données

