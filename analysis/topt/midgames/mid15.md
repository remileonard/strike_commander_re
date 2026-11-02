# Script extrait de `sub_85FE0` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## sub_85FE0

```
bp = sp                                                                                               ⟨244510⟩
tableau_textes(tableau=textes1, nombre=26, longueur=200)                                              ⟨244522⟩
v15 = 0                                                                                               ⟨244524⟩
v16 = 0                                                                                               ⟨244525⟩
v17 = 0                                                                                               ⟨244526⟩
si word_4CA5B != 0 :
    v16 = 1                                                                                           ⟨244529⟩
v20 = word_4D36E                                                                                      ⟨244533⟩
v456 = 0                                                                                              ⟨244534⟩
TextFormat_ApplyStyleAttribute_357D1(&v456, v20)                                                      ⟨244539⟩
v470 = 0                                                                                              ⟨244541⟩
TextRenderer_ApplyFormatChange_3584E(&v470, 0)                                                        ⟨244550⟩
sub_3499B(&v24, &v470)                                                                                ⟨244556⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨244562⟩
v34 = 0                                                                                               ⟨244568⟩
sub_435F1(pak mid15)                                                                                  ⟨244590⟩
sub_435F1(pak midgames)                                                                               ⟨244611⟩
sub_435F1(pak optshps)                                                                                ⟨244632⟩
sub_435F1(pak optpals)                                                                                ⟨244653⟩
si v16 != 0 :
    si sub_993C(chemin1) != 0 :
        pak mid15voc.ouvre(chemin1, 1)                                                                ⟨244684⟩
        sub_435F1(pak mid15voc)                                                                       ⟨244688⟩
    sinon :
        v16 = 0                                                                                       ⟨244693⟩
sinon :
    v16 = 0                                                                                           ⟨244693⟩
v44 = 0                                                                                               ⟨244696⟩
v39 = 0                                                                                               ⟨244698⟩
v38 = 0                                                                                               ⟨244699⟩
v46 = byte_4CA58                                                                                      ⟨244701⟩
si v46 - 1 <= 4 :
    si (v46 - 1)·2 == 0 ou ((v46 - 1)·2 != 2) et (((v46 - 1)·2 != 4) et (((v46 - 1)·2 != 6) et ((v46 - 1)·2 != 8))) :
        si sub_993C(chemin1) != 0 :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨244745⟩
            sub_435F1(pak rsoundfx)                                                                   ⟨244749⟩
            flux_iff(flux=flux1)                                                                      ⟨244763⟩
            v3447 = 256                                                                               ⟨244766⟩
            v3451 = 0                                                                                 ⟨244767⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨244775⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨244781⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨244787⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨244791⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨244793⟩
            di = 1                                                                                    ⟨244794⟩
            tant que di <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨244800⟩
                ds:26002[di·2] = iff_lit_mot(flux=flux1)                                              ⟨244804⟩
                di = di + 1                                                                           ⟨244805⟩
            iff_ferme_form(flux=flux1)                                                                ⟨244812⟩
            v17 = 1                                                                                   ⟨244814⟩
            iff_ferme_form(flux=flux1)                                                                ⟨244818⟩
        si sub_993C(chemin1) != 0 :
            v15 = 1                                                                                   ⟨244844⟩
            si v17 == 0 :
                word_4F048 = 90                                                                       ⟨244849⟩
    sinon :
        si sub_993C(chemin1) != 0 :
            si word_4CA5D != 0 :
                pak asoundfx.ouvre(chemin1, 1)                                                        ⟨244886⟩
                sub_435F1(pak asoundfx)                                                               ⟨244890⟩
                flux_iff(flux=flux1)                                                                  ⟨244904⟩
                v3447 = 256                                                                           ⟨244907⟩
                v3451 = 0                                                                             ⟨244908⟩
                flux1.ouvre(chemin1, 1)                                                               ⟨244916⟩
                iff_form(flux=flux1, balise='VOLU', x=0)                                              ⟨244922⟩
                iff_chunk(flux=flux1, balise='ADLB', x=1)                                             ⟨244928⟩
                iff_lit_mot(flux=flux1)                                                               ⟨244932⟩
                word_4F048 = iff_lit_mot(flux=flux1)                                                  ⟨244934⟩
                di = 1                                                                                ⟨244935⟩
                tant que di <= 106 :
                    iff_lit_mot(flux=flux1)                                                           ⟨244941⟩
                    ds:26002[di·2] = iff_lit_mot(flux=flux1)                                          ⟨244945⟩
                    di = di + 1                                                                       ⟨244946⟩
                iff_ferme_form(flux=flux1)                                                            ⟨244953⟩
                v17 = 1                                                                               ⟨244955⟩
                iff_ferme_form(flux=flux1)                                                            ⟨244959⟩
        si sub_993C(chemin1) != 0 :
            v15 = 1                                                                                   ⟨245002⟩
            si v17 == 0 :
                word_4F048 = 255                                                                      ⟨245007⟩
v52 = word_4B2FC                                                                                      ⟨245014⟩
v50 = word_4B2FE                                                                                      ⟨245016⟩
v48 = byte_4B300                                                                                      ⟨245018⟩
si v17 != 0 :
    v3384 = word_4D392                                                                                ⟨245026⟩
    word_4D392 = &v3386                                                                               ⟨245028⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨245037⟩
    di = 0                                                                                            ⟨245039⟩
    tant que di < 5 :
        charge(asoundfx v52[di])                                                                      ⟨245055⟩
        canal_enregistre(canal=canal1, ressource=asoundfx v52[di], x=0)                               ⟨245062⟩
        canal_arrête(canal=canal1)                                                                    ⟨245066⟩
        v312 = 0                                                                                      ⟨245083⟩
        v306 = 0                                                                                      ⟨245085⟩
        di = di + 1                                                                                   ⟨245086⟩
    canal_arrête(canal=canal1)                                                                        ⟨245096⟩
    sub_5C1C(&v3386, 2)                                                                               ⟨245101⟩
v1200 = 436                                                                                           ⟨245105⟩
v1198 = word_4D392                                                                                    ⟨245107⟩
word_4D392 = &v1200                                                                                   ⟨245109⟩
v1200 = 444                                                                                           ⟨245110⟩
v1204 = 0                                                                                             ⟨245113⟩
si v15 != 0 :
    sub_435F1(pak mmusic)                                                                             ⟨245129⟩
    si v16 != 0 :
        v303 = 10                                                                                     ⟨245133⟩
    sinon :
        v303 = 9                                                                                      ⟨245137⟩
    charge(mmusic v303)                                                                               ⟨245148⟩
    canal_init(canal=canal2, pilote=word_4CA59)                                                       ⟨245153⟩
    canal_enregistre(canal=canal2, ressource=mmusic v303, x=0)                                        ⟨245160⟩
v1213 = booléen                                                                                       ⟨245177⟩
v1209 = booléen                                                                                       ⟨245178⟩
si v16 != 0 :
    voix_pilote(voix=voix1, pilote=word_4CA5B)                                                        ⟨245184⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨245201⟩
    v3447 = 256                                                                                       ⟨245204⟩
    v3451 = 0                                                                                         ⟨245205⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨245213⟩
    iff_form(flux=flux1, balise='MG15', x=0)                                                          ⟨245219⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨245225⟩
    di = 0                                                                                            ⟨245227⟩
    tant que di < 26 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨245235⟩
        v304 = v3430                                                                                  ⟨245238⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·di), taille=v304)                    ⟨245249⟩
        v3443 = v3426                                                                                 ⟨245252⟩
        di = di + 1                                                                                   ⟨245253⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨245260⟩
    si CRT_Strlen(arg_8) != 0 :
        CRT_Strcat(textes1[0], 10529)                                                                 ⟨245269⟩
        CRT_Strcat(textes1[0], arg_8)                                                                 ⟨245273⟩
        CRT_Strcat(textes1[0], 10536)                                                                 ⟨245277⟩
    sinon :
        si CRT_Strlen(arg_10) != 0 :
            CRT_Strcat(textes1[0], 10529)                                                             ⟨245289⟩
            CRT_Strcat(textes1[0], arg_10)                                                            ⟨245293⟩
            CRT_Strcat(textes1[0], 10536)                                                             ⟨245297⟩
        sinon :
            si CRT_Strlen(arg_6) != 0 :
                CRT_Strcat(textes1[0], 10529)                                                         ⟨245309⟩
                CRT_Strcat(textes1[0], arg_6)                                                         ⟨245313⟩
                CRT_Strcat(textes1[0], 10536)                                                         ⟨245317⟩
            sinon :
                CRT_Strcat(textes1[0], 10536)                                                         ⟨245324⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[17], 10529)                                                                ⟨245340⟩
        CRT_Strcat(textes1[17], arg_6)                                                                ⟨245349⟩
        CRT_Strcat(textes1[17], 10532)                                                                ⟨245358⟩
    sinon :
        si CRT_Strlen(arg_10) != 0 :
            CRT_Strcat(textes1[17], 10529)                                                            ⟨245375⟩
            CRT_Strcat(textes1[17], arg_10)                                                           ⟨245384⟩
            CRT_Strcat(textes1[17], 10532)                                                            ⟨245393⟩
        sinon :
            si CRT_Strlen(arg_8) != 0 :
                CRT_Strcat(textes1[17], 10529)                                                        ⟨245410⟩
                CRT_Strcat(textes1[17], arg_8)                                                        ⟨245419⟩
                CRT_Strcat(textes1[17], 10532)                                                        ⟨245428⟩
            sinon :
                CRT_Strcat(textes1[17], 10532)                                                        ⟨245440⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨245447⟩
charge(optshps 116)                                                                                   ⟨245466⟩
charge(mid15 5)                                                                                       ⟨245478⟩
charge(mid15 1)                                                                                       ⟨245490⟩
charge(mid15 4)                                                                                       ⟨245502⟩
charge(mid15 0)                                                                                       ⟨245514⟩
charge(mid15 8)                                                                                       ⟨245526⟩
charge(mid15 9)                                                                                       ⟨245538⟩
charge(mid15 3)                                                                                       ⟨245550⟩
charge(mid15 7)                                                                                       ⟨245562⟩
charge(midgames 4)                                                                                    ⟨245574⟩
charge(optpals 21)                                                                                    ⟨245586⟩
palette_depuis(pal2(optpals 21))                                                                      ⟨245593⟩
charge(mid15 15)                                                                                      ⟨245605⟩
palette_depuis(pal3(mid15 15))                                                                        ⟨245612⟩
charge(mid15 11)                                                                                      ⟨245624⟩
palette_depuis(pal4(mid15 11))                                                                        ⟨245631⟩
charge(mid15 13)                                                                                      ⟨245643⟩
palette_depuis(pal5(mid15 13))                                                                        ⟨245650⟩
charge(mid15 14)                                                                                      ⟨245662⟩
palette_depuis(pal6(mid15 14))                                                                        ⟨245669⟩
charge(midgames 6)                                                                                    ⟨245681⟩
palette_depuis(pal7(midgames 6))                                                                      ⟨245688⟩
charge_convdata_type2("normal")                                                                       ⟨245698⟩
palette_depuis(pal8(convdata type 2 "normal"))                                                        ⟨245705⟩
v274 = 0                                                                                              ⟨245707⟩
v270 = 2                                                                                              ⟨245708⟩
v269 = 0                                                                                              ⟨245709⟩
v268 = 0                                                                                              ⟨245710⟩
TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                       ⟨245724⟩
v276 = ?                                                                                              ⟨245726⟩
v278 = TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                ⟨245727⟩
v274 = v278                                                                                           ⟨245729⟩
v270 = 2                                                                                              ⟨245730⟩
v269 = 1                                                                                              ⟨245731⟩
v268 = 0                                                                                              ⟨245732⟩
GlyphObject_ConstructWithBuffer_36D56(&v3314, &v274)                                                  ⟨245737⟩
sub_30A1D(&v3348, word_4D36E, &v3314)                                                                 ⟨245749⟩
Widget_Method_DispatchC_37052(&v3348, 0)                                                              ⟨245754⟩
Widget_Method_Dispatch8_37030(&v3348, 200)                                                            ⟨245759⟩
v288 = 0                                                                                              ⟨245761⟩
v283 = 0                                                                                              ⟨245763⟩
v282 = 0                                                                                              ⟨245764⟩
v298 = 0                                                                                              ⟨245765⟩
v293 = 0                                                                                              ⟨245767⟩
v292 = 0                                                                                              ⟨245768⟩
v3358 = 436                                                                                           ⟨245769⟩
v3356 = word_4D392                                                                                    ⟨245771⟩
word_4D392 = &v3358                                                                                   ⟨245773⟩
v3358 = 444                                                                                           ⟨245774⟩
v3362 = 0                                                                                             ⟨245777⟩
v3372 = 436                                                                                           ⟨245779⟩
v3370 = word_4D392                                                                                    ⟨245781⟩
word_4D392 = &v3372                                                                                   ⟨245783⟩
v3372 = 444                                                                                           ⟨245784⟩
v3376 = 0                                                                                             ⟨245787⟩
si byte_4F55C == 0 :
    si v15 != 0 :
        v300 = word_4F048                                                                             ⟨245797⟩
        si canal2.+0 != 0 :
            AIL_start_sequence(pilote=canal2.+0→4, séquence=v1202)                                    ⟨245804⟩
            sub_50F5(canal2.+0→4, v1202, v300, 0)                                                     ⟨245811⟩

    ──── scène1 ────
    scène1 = Scene_Create(cadence=15, palette=255, surface=&v456)                                     ⟨245822⟩
    c1 = Layer(ressource=optshps 116, x=0, y=-24)                                                     ⟨245829⟩
    c2 = ScaledImageLayer(ressource=mid15 1, x=288, y=94, angle=0, échelle=32, octet=0, image=0)      ⟨245841⟩
    c3 = ScaledImageLayer(ressource=mid15 5, x=288, y=94, angle=0, échelle=32, octet=0, image=0)      ⟨245853⟩
    palette_copie(destination=pal1, source=pal4(mid15 11))                                            ⟨245863⟩
    palette_copie(destination=pal1, source=pal2(optpals 21))                                          ⟨245872⟩
    ajoute c1 à scène1                                                                                ⟨245877⟩
    fondu_disparition(palette=pal1, couleur=&v34, pas=0, premier=0, nombre=256)                       ⟨245890⟩
    palette_copie(destination=pal1, source=pal4(mid15 11))                                            ⟨245899⟩
    palette_copie(destination=pal1, source=pal2(optpals 21))                                          ⟨245908⟩
    v3420 = 436                                                                                       ⟨245914⟩
    v3418 = word_4D392                                                                                ⟨245916⟩
    word_4D392 = &v3420                                                                               ⟨245918⟩
    si v17 != 0 :
        charge(asoundfx 61)                                                                           ⟨245935⟩
        canal_init(canal=canal3, pilote=word_4CA5D)                                                   ⟨245940⟩
        canal_enregistre(canal=canal3, ressource=asoundfx 61, x=0)                                    ⟨245947⟩
        v320 = word_4EFEE                                                                             ⟨245950⟩
        v322 = 0                                                                                      ⟨245951⟩
        si canal3.+0 != 0 :
            AIL_start_sequence(pilote=canal3.+0→4, séquence=v3422)                                    ⟨245957⟩
            sub_50F5(canal3.+0→4, v3422, v320, v322)                                                  ⟨245964⟩
    Scene_Tick(scène=scène1)                                                                          ⟨245971⟩
    fondu_apparition(palette=pal1, couleur=&v34, pas=2, premier=0, nombre=256)                        ⟨245980⟩
    palette_envoie(palette=pal1, pas=0)                                                               ⟨245988⟩
    v324 = 32                                                                                         ⟨245990⟩
    v326 = 6                                                                                          ⟨245991⟩
    v328 = 32                                                                                         ⟨245992⟩
    v330 = 6                                                                                          ⟨245993⟩
    v332 = 0                                                                                          ⟨245994⟩
    v334 = 0                                                                                          ⟨245995⟩
    v336 = -8                                                                                         ⟨245996⟩
    v338 = -4                                                                                         ⟨245997⟩
    v340 = -8                                                                                         ⟨245998⟩
    v342 = -4                                                                                         ⟨245999⟩
    ajoute c3 à scène1                                                                                ⟨246003⟩
    ajoute c2 à scène1                                                                                ⟨246008⟩
    tant que (scène1.compteur < 62) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨246013⟩
        v344 = v332                                                                                   ⟨246015⟩
        c3.image = v344                                                                               ⟨246018⟩
        si scène1.compteur > 0 :
            si scène1.compteur < 38 :
                si scène1.compteur == 30 :
                    v326 = 5                                                                          ⟨246025⟩
                    v336 = -7                                                                         ⟨246026⟩
                    v338 = -3                                                                         ⟨246027⟩
                si scène1.compteur == 36 :
                    v326 = 4                                                                          ⟨246032⟩
                    v336 = -6                                                                         ⟨246033⟩
                    v338 = -2                                                                         ⟨246034⟩
                échelle(calque=c3, échelle=v324)                                                      ⟨246039⟩
                si scène1.compteur < 51 :
                    déplace(calque=c3, dx=v336, dy=v338)                                              ⟨246048⟩
                v324 = v324 + v326                                                                    ⟨246053⟩
                si v324 > 255 :
                    v324 = 255                                                                        ⟨246056⟩
        v332 = v332 + 1                                                                               ⟨246059⟩
        si v332 > 30 :
            v332_avant = v332                                                                         ⟨246063⟩
            v332 = 0                                                                                  ⟨246063⟩
        v346 = v334                                                                                   ⟨246067⟩
        c2.image = v346                                                                               ⟨246070⟩
        si scène1.compteur > -1 :
            si scène1.compteur < 37 :
                si scène1.compteur == 28 :
                    v330 = 5                                                                          ⟨246077⟩
                    v340 = -7                                                                         ⟨246078⟩
                    v342 = -3                                                                         ⟨246079⟩
                si scène1.compteur == 34 :
                    v330 = 4                                                                          ⟨246084⟩
                    v340 = -6                                                                         ⟨246085⟩
                    v342 = -2                                                                         ⟨246086⟩
                échelle(calque=c2, échelle=v328)                                                      ⟨246091⟩
                si scène1.compteur < 51 :
                    déplace(calque=c2, dx=v340, dy=v342)                                              ⟨246100⟩
                v328 = v328 + v330                                                                    ⟨246105⟩
                si v328 > 255 :
                    v328 = 255                                                                        ⟨246108⟩
        v334 = v334 + 1                                                                               ⟨246111⟩
        si v334 > 26 :
            v334_avant = v334                                                                         ⟨246115⟩
            v334 = 0                                                                                  ⟨246115⟩
        Scene_Tick(scène=scène1)                                                                      ⟨246127⟩
    canal_arrête(canal=canal3)                                                                        ⟨246152⟩
    sub_5C1C(&v3420, 2)                                                                               ⟨246157⟩
    v318 = 0                                                                                          ⟨246174⟩
    v312 = 0                                                                                          ⟨246176⟩
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨246180⟩
    si byte_4F55C == 0 :

        ──── scène2 ────
        scène2 = Scene_Create(cadence=10, palette=255, surface=&v456)                                 ⟨246193⟩
        c4 = Layer(ressource=optshps 116, x=0, y=-57)                                                 ⟨246200⟩
        charge_convdata_type0("janet", drapeau=3)                                                     ⟨246211⟩
        c5 = Layer(ressource=mid15 7, x=0, y=0)                                                       ⟨246218⟩
        c6 = TalkingHeadOverlay(ressource=convdata type 0 "janet", x=160, y=129)                      ⟨246226⟩
        c7 = ImageLayer(ressource=convdata type 0 "janet", x=160, y=128, image=51)                    ⟨246235⟩
        palette_copie(destination=pal1, source=pal2(optpals 21))                                      ⟨246245⟩
        palette_copie(destination=pal1, source=pal6(mid15 14))                                        ⟨246254⟩
        palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))                        ⟨246263⟩
        palette_envoie(palette=pal1, pas=0)                                                           ⟨246275⟩
        ajoute c4 à scène2                                                                            ⟨246280⟩
        ajoute c5 à scène2                                                                            ⟨246285⟩
        ajoute c6 à scène2                                                                            ⟨246290⟩
        ajoute c7 à scène2                                                                            ⟨246295⟩
        di = 0                                                                                        ⟨246297⟩
        si v17 != 0 :
            charge(asoundfx 24)                                                                       ⟨246309⟩
            canal_init(canal=canal4, pilote=word_4CA5D)                                               ⟨246314⟩
            canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)                                ⟨246321⟩
            v322 = word_4EFA4                                                                         ⟨246324⟩
            v324 = 0                                                                                  ⟨246325⟩
            si canal4.+0 != 0 :
                AIL_start_sequence(pilote=canal4.+0→4, séquence=v3360)                                ⟨246331⟩
                sub_50F5(canal4.+0→4, v3360, v322, v324)                                              ⟨246338⟩
        si v16 != 0 :
            Scene_Tick(scène=scène2)                                                                  ⟨246350⟩
            charge(mid15voc 0)                                                                        ⟨246362⟩
            tête_voix(tête=c6, ressource=mid15voc 0, cadence=9)                                       ⟨246368⟩
            v336 = 0                                                                                  ⟨246370⟩
            tant que v336 < 3 :
                Scene_Tick(scène=scène2)                                                              ⟨246376⟩
                v336 = v336 + 1                                                                       ⟨246378⟩
            tant que tête_parle(tête=c6) != 0 :
                si di == 0 :
                    CRT_Rand()                                                                        ⟨246388⟩
                    si (CRT_Rand()·7) / 32768 == 0 :
                        di = -1                                                                       ⟨246396⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨246402⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨246408⟩
                sinon :
                    si di == -1 :
                        di = 1                                                                        ⟨246402⟩
                    sinon :
                        si di == 1 :
                            di = 0                                                                    ⟨246408⟩
                déplace(calque=c5, dx=0, dy=di)                                                       ⟨246416⟩
                déplace(calque=c6, dx=0, dy=di)                                                       ⟨246423⟩
                déplace(calque=c7, dx=0, dy=di)                                                       ⟨246430⟩
                Scene_Tick(scène=scène2)                                                              ⟨246441⟩
            v336 = 0                                                                                  ⟨246453⟩
            tant que v336 < 8 :
                si di == 0 :
                    CRT_Rand()                                                                        ⟨246459⟩
                    si (CRT_Rand()·7) / 32768 == 0 :
                        di = -1                                                                       ⟨246467⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨246473⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨246479⟩
                sinon :
                    si di == -1 :
                        di = 1                                                                        ⟨246473⟩
                    sinon :
                        si di == 1 :
                            di = 0                                                                    ⟨246479⟩
                déplace(calque=c5, dx=0, dy=di)                                                       ⟨246487⟩
                déplace(calque=c6, dx=0, dy=di)                                                       ⟨246494⟩
                déplace(calque=c7, dx=0, dy=di)                                                       ⟨246501⟩
                Scene_Tick(scène=scène2)                                                              ⟨246512⟩
                v336 = v336 + 1                                                                       ⟨246514⟩
            v334 = 0                                                                                  ⟨246537⟩
            v328 = 0                                                                                  ⟨246539⟩
        sinon :
            Widget_Method_DispatchC_37052(&v3348, 0)                                                  ⟨246546⟩
            Widget_Method_Dispatch8_37030(&v3348, 127)                                                ⟨246551⟩
            v10 = 31                                                                                  ⟨246553⟩
            si = scène2.compteur                                                                      ⟨246554⟩
            v8 = si + ((v10·70) / 100)                                                                ⟨246563⟩
            tant que (scène2.compteur < v8) et (scène2.terminée == 0) :
                v326 = scène2.compteur                                                                ⟨246568⟩
                si di == 0 :
                    CRT_Rand()                                                                        ⟨246571⟩
                    si (CRT_Rand()·7) / 32768 == 0 :
                        di = -1                                                                       ⟨246579⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨246585⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨246591⟩
                sinon :
                    si di == -1 :
                        di = 1                                                                        ⟨246585⟩
                    sinon :
                        si di == 1 :
                            di = 0                                                                    ⟨246591⟩
                si si + 2 == v326 :
                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[0])                     ⟨246601⟩
                si si + 2 == v326 :
                    tête_texte_de_lèvres(tête=c6, texte="anetrubla")                                  ⟨246611⟩
                si v8 - 1 == v326 :
                    sub_30AD0(objet1, 0)                                                              ⟨246622⟩
                Scene_Tick(scène=scène2)                                                              ⟨246640⟩
        si v17 != 0 :
            canal_arrête(canal=canal4)                                                                ⟨246668⟩
        v314 = 0                                                                                      ⟨246687⟩
        v308 = 0                                                                                      ⟨246689⟩
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨246693⟩
        si byte_4F55C == 0 :

            ──── scène3 ────
            scène3 = Scene_Create(cadence=10, palette=255, surface=&v456)                             ⟨246706⟩
            c8 = Layer(ressource=optshps 116, x=0, y=-57)                                             ⟨246713⟩
            v314 = 0                                                                                  ⟨246716⟩
            v308 = 0                                                                                  ⟨246719⟩
            charge_convdata_type0("air", drapeau=3)                                                   ⟨246724⟩
            c9 = Layer(ressource=midgames 4, x=0, y=0)                                                ⟨246731⟩
            c10 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)                   ⟨246739⟩
            c11 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)                 ⟨246748⟩
            palette_copie(destination=pal1, source=pal2(optpals 21))                                  ⟨246758⟩
            palette_copie(destination=pal1, source=pal7(midgames 6))                                  ⟨246767⟩
            palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))                    ⟨246776⟩
            palette_envoie(palette=pal1, pas=0)                                                       ⟨246788⟩
            ajoute c8 à scène3                                                                        ⟨246793⟩
            ajoute c9 à scène3                                                                        ⟨246798⟩
            ajoute c10 à scène3                                                                       ⟨246803⟩
            ajoute c11 à scène3                                                                       ⟨246808⟩
            di = 0                                                                                    ⟨246810⟩
            si v17 != 0 :
                charge(asoundfx 5)                                                                    ⟨246822⟩
                canal_init(canal=canal5, pilote=word_4CA5D)                                           ⟨246827⟩
                canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)                             ⟨246834⟩
                v322 = word_4EF7E                                                                     ⟨246837⟩
                v324 = 0                                                                              ⟨246838⟩
                si canal5.+0 != 0 :
                    AIL_start_sequence(pilote=canal5.+0→4, séquence=v3374)                            ⟨246844⟩
                    sub_50F5(canal5.+0→4, v3374, v322, v324)                                          ⟨246851⟩
            si v16 != 0 :
                Scene_Tick(scène=scène3)                                                              ⟨246863⟩
                v334 = 0                                                                              ⟨246865⟩
                v328 = 0                                                                              ⟨246868⟩
                charge(mid15voc 8)                                                                    ⟨246875⟩
                tête_voix(tête=c10, ressource=mid15voc 8, cadence=9)                                  ⟨246881⟩
                v336 = 0                                                                              ⟨246883⟩
                tant que v336 < 3 :
                    Scene_Tick(scène=scène3)                                                          ⟨246889⟩
                    v336 = v336 + 1                                                                   ⟨246891⟩
                v336 = 0                                                                              ⟨246896⟩
                tant que tête_parle(tête=c10) != 0 :
                    v336_avant = v336                                                                 ⟨246901⟩
                    v336 = v336 + 1                                                                   ⟨246901⟩
                    si v336_avant == 7 :
                        tête_image_de_base(tête=c10, image=33)                                        ⟨246906⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨246912⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨246920⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨246926⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨246932⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨246926⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨246932⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨246940⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨246947⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨246954⟩
                    Scene_Tick(scène=scène3)                                                          ⟨246965⟩
                v336 = 0                                                                              ⟨246977⟩
                tant que v336 < 8 :
                    si v336 == 0 :
                        tête_image_de_base(tête=c10, image=27)                                        ⟨246985⟩
                    si v336 == 6 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨246993⟩
                    si v336 == 7 :
                        tête_image_de_base(tête=c10, image=31)                                        ⟨247001⟩
                    si v336 == 8 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨247009⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨247015⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨247023⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨247029⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨247035⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨247029⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨247035⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨247043⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨247050⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨247057⟩
                    Scene_Tick(scène=scène3)                                                          ⟨247068⟩
                    v336 = v336 + 1                                                                   ⟨247070⟩
                v336 = 0                                                                              ⟨247078⟩
                tant que v336 < 6 :
                    Scene_Tick(scène=scène3)                                                          ⟨247084⟩
                    v336 = v336 + 1                                                                   ⟨247086⟩
                charge(mid15voc 9)                                                                    ⟨247101⟩
                tête_voix(tête=c10, ressource=mid15voc 9, cadence=9)                                  ⟨247107⟩
                tant que tête_parle(tête=c10) != 0 :
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨247114⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨247122⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨247128⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨247134⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨247128⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨247134⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨247142⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨247149⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨247156⟩
                    Scene_Tick(scène=scène3)                                                          ⟨247167⟩
                v336 = 0                                                                              ⟨247179⟩
                tant que v336 < 10 :
                    si v336 == 6 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨247187⟩
                    si v336 == 8 :
                        tête_image_de_base(tête=c10, image=128)                                       ⟨247195⟩
                    si v336 == 9 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨247203⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨247209⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨247217⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨247223⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨247229⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨247223⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨247229⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨247237⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨247244⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨247251⟩
                    Scene_Tick(scène=scène3)                                                          ⟨247262⟩
                    v336 = v336 + 1                                                                   ⟨247264⟩
                charge(mid15voc 10)                                                                   ⟨247282⟩
                tête_voix(tête=c10, ressource=mid15voc 10, cadence=9)                                 ⟨247288⟩
                tant que tête_parle(tête=c10) != 0 :
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨247295⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨247303⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨247309⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨247315⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨247309⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨247315⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨247323⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨247330⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨247337⟩
                    Scene_Tick(scène=scène3)                                                          ⟨247348⟩
                v336 = 0                                                                              ⟨247360⟩
                tant que v336 < 8 :
                    si v336 == 5 :
                        tête_image_de_base(tête=c10, image=128)                                       ⟨247368⟩
                    si v336 == 6 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨247376⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨247382⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨247390⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨247396⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨247402⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨247396⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨247402⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨247410⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨247417⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨247424⟩
                    Scene_Tick(scène=scène3)                                                          ⟨247435⟩
                    v336 = v336 + 1                                                                   ⟨247437⟩
                v350 = 0                                                                              ⟨247462⟩
                v346 = 0                                                                              ⟨247478⟩
                v340 = 0                                                                              ⟨247480⟩
                v334 = 0                                                                              ⟨247496⟩
                v328 = 0                                                                              ⟨247498⟩
            sinon :
                Widget_Method_DispatchC_37052(objet1, 0)                                              ⟨247505⟩
                Widget_Method_Dispatch8_37030(objet1, 127)                                            ⟨247510⟩
                v10 = 77                                                                              ⟨247512⟩
                si = scène3.compteur                                                                  ⟨247513⟩
                v8 = si + ((v10·70) / 100)                                                            ⟨247522⟩
                tant que (scène3.compteur < v8) et (scène3.terminée == 0) :
                    v326 = scène3.compteur                                                            ⟨247527⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨247530⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨247538⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨247544⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨247550⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨247544⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨247550⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨247558⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨247565⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨247572⟩
                    si si + 2 == v326 :
                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[1])                 ⟨247583⟩
                    si si + 2 == v326 :
                        tête_texte_de_lèvres(tête=c10, texte="plnty")                                 ⟨247593⟩
                    si si + 7 == v326 :
                        tête_image_de_base(tête=c10, image=33)                                        ⟨247603⟩
                    si si + 12 == v326 :
                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[2])                 ⟨247618⟩
                    si si + 12 == v326 :
                        tête_texte_de_lèvres(tête=c10, texte="butntforme ")                           ⟨247628⟩
                    si si + 28 == v326 :
                        tête_image_de_base(tête=c10, image=27)                                        ⟨247638⟩
                    si v8 - 4 == v326 :
                        sub_30AD0(objet1, 0)                                                          ⟨247649⟩
                    si v8 - 8 == v326 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨247659⟩
                    si v8 - 7 == v326 :
                        tête_image_de_base(tête=c10, image=31)                                        ⟨247669⟩
                    si v8 - 6 == v326 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨247679⟩
                    Scene_Tick(scène=scène3)                                                          ⟨247697⟩
                v10 = 22                                                                              ⟨247721⟩
                si = scène3.compteur                                                                  ⟨247722⟩
                v8 = si + ((v10·70) / 100)                                                            ⟨247731⟩
                tant que (scène3.compteur < v8) et (scène3.terminée == 0) :
                    v326 = scène3.compteur                                                            ⟨247736⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨247739⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨247747⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨247753⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨247759⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨247753⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨247759⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨247767⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨247774⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨247781⟩
                    si si + 6 == v326 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨247789⟩
                    si si + 8 == v326 :
                        tête_image_de_base(tête=c10, image=128)                                       ⟨247799⟩
                    si si + 9 == v326 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨247809⟩
                    si si + 2 == v326 :
                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[3])                 ⟨247825⟩
                    si si + 2 == v326 :
                        tête_texte_de_lèvres(tête=c10, texte="wataminet")                             ⟨247835⟩
                    si v8 - 1 == v326 :
                        sub_30AD0(objet1, 0)                                                          ⟨247846⟩
                    Scene_Tick(scène=scène3)                                                          ⟨247864⟩
                v10 = 45                                                                              ⟨247888⟩
                si = scène3.compteur                                                                  ⟨247889⟩
                v8 = si + ((v10·70) / 100)                                                            ⟨247898⟩
                tant que (scène3.compteur < v8) et (scène3.terminée == 0) :
                    v326 = scène3.compteur                                                            ⟨247903⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨247906⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨247914⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨247920⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨247926⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨247920⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨247926⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨247934⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨247941⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨247948⟩
                    si si + 5 == v326 :
                        tête_image_de_base(tête=c10, image=128)                                       ⟨247956⟩
                    si si + 6 == v326 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨247966⟩
                    si si + 2 == v326 :
                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[4])                 ⟨247981⟩
                    si si + 2 == v326 :
                        tête_texte_de_lèvres(tête=c10, texte="miscndlvdajaklzbtnotobcloznonurpozitn")  ⟨247991⟩
                    si v8 - 1 == v326 :
                        sub_30AD0(objet1, 0)                                                          ⟨248002⟩
                    Scene_Tick(scène=scène3)                                                          ⟨248020⟩
            si v17 != 0 :
                canal_arrête(canal=canal5)                                                            ⟨248048⟩
            v314 = 0                                                                                  ⟨248067⟩
            v308 = 0                                                                                  ⟨248069⟩
            Scene_Destruct(scène=scène3, drapeaux=0)                                                  ⟨248073⟩
            si byte_4F55C == 0 :

                ──── scène4 ────
                scène4 = Scene_Create(cadence=10, palette=255, surface=&v456)                         ⟨248086⟩
                c12 = Layer(ressource=optshps 116, x=0, y=-57)                                        ⟨248093⟩
                c13 = Layer(ressource=mid15 8, x=0, y=-1)                                             ⟨248101⟩
                di = c13                                                                              ⟨248103⟩
                c14 = Layer(ressource=mid15 3, x=0, y=-1)                                             ⟨248109⟩
                c15 = OverlayImageLayer(ressource=mid15 0, x=0, y=-1, image=1)                        ⟨248118⟩
                palette_copie(destination=pal1, source=pal2(optpals 21))                              ⟨248128⟩
                palette_copie(destination=pal1, source=pal3(mid15 15))                                ⟨248137⟩
                ajoute c12 à scène4                                                                   ⟨248142⟩
                ajoute c13 à scène4                                                                   ⟨248147⟩
                ajoute c14 à scène4                                                                   ⟨248152⟩
                ajoute c15 à scène4                                                                   ⟨248157⟩
                palette_envoie(palette=pal1, pas=0)                                                   ⟨248169⟩
                Widget_Method_DispatchC_37052(objet1, 0)                                              ⟨248174⟩
                Widget_Method_Dispatch8_37030(objet1, 196)                                            ⟨248179⟩
                v310 = 0                                                                              ⟨248181⟩
                v312 = 3                                                                              ⟨248182⟩
                v314 = 2                                                                              ⟨248183⟩
                v316 = 2                                                                              ⟨248184⟩
                v318 = 0                                                                              ⟨248185⟩
                si v17 != 0 :
                    charge(asoundfx 5)                                                                ⟨248197⟩
                    canal_init(canal=canal5, pilote=word_4CA5D)                                       ⟨248202⟩
                    canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)                         ⟨248209⟩
                    v320 = word_4EF7E - 50                                                            ⟨248213⟩
                    v322 = 0                                                                          ⟨248214⟩
                    si canal5.+0 != 0 :
                        AIL_start_sequence(pilote=canal5.+0→4, séquence=v3374)                        ⟨248220⟩
                        sub_50F5(canal5.+0→4, v3374, v320, v322)                                      ⟨248227⟩
                si v16 != 0 :
                    Scene_Tick(scène=scène4)                                                          ⟨248239⟩
                    charge(mid15voc 11)                                                               ⟨248251⟩
                    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid15voc 11)                ⟨248257⟩
                    v334 = 0                                                                          ⟨248259⟩
                    tant que v334 < 4 :
                        Scene_Tick(scène=scène4)                                                      ⟨248265⟩
                        v334 = v334 + 1                                                               ⟨248267⟩
                    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                   ⟨248275⟩
                    v334 = 0                                                                          ⟨248277⟩
                    tant que voix_en_cours(voix=voix1) != 0 :
                        si v314 == v316 :
                            v334_avant = v334                                                         ⟨248285⟩
                            v334 = v334 + 1                                                           ⟨248285⟩
                            si v334_avant & 1 != 0 :
                                v336 = v312                                                           ⟨248289⟩
                                CRT_Rand()                                                            ⟨248290⟩
                                v316 = (CRT_Rand()·v336) / 32768                                      ⟨248297⟩
                            si v316 < v314 :
                                v310 = -1                                                             ⟨248303⟩
                            sinon :
                                si v316 == v314 :
                                    v310 = 0                                                          ⟨248310⟩
                                sinon :
                                    v310 = 1                                                          ⟨248314⟩
                        déplace(calque=c14, dx=0, dy=v310)                                            ⟨248322⟩
                        déplace(calque=c15, dx=0, dy=v310)                                            ⟨248329⟩
                        v318_avant = v318                                                             ⟨248332⟩
                        v318 = v318 + 1                                                               ⟨248332⟩
                        si v318_avant == 1 :
                            déplace(calque=c13, dx=-1, dy=0)                                          ⟨248339⟩
                        si v318 == 5 :
                            déplace(calque=c13, dx=0, dy=1)                                           ⟨248349⟩
                        si v318 == 8 :
                            v318 = 0                                                                  ⟨248355⟩
                        v314 = v314 + v310                                                            ⟨248359⟩
                        CRT_Rand()                                                                    ⟨248360⟩
                        v338 = (CRT_Rand()·3) / 32768                                                 ⟨248366⟩
                        c15.image = v338                                                              ⟨248369⟩
                        Scene_Tick(scène=scène4)                                                      ⟨248379⟩
                    c15.image = 0                                                                     ⟨248393⟩
                    v334 = 0                                                                          ⟨248394⟩
                    tant que v334 < 4 :
                        Scene_Tick(scène=scène4)                                                      ⟨248400⟩
                        v334 = v334 + 1                                                               ⟨248402⟩
                    voix_arrête(voix=voix1)                                                           ⟨248409⟩
                    v332 = 0                                                                          ⟨248426⟩
                    v326 = 0                                                                          ⟨248428⟩
                sinon :
                    v10 = 40                                                                          ⟨248432⟩
                    si = scène4.compteur                                                              ⟨248433⟩
                    v8 = si + ((v10·70) / 100)                                                        ⟨248442⟩
                    tant que (scène4.compteur < v8) et (scène4.terminée == 0) :
                        v324 = scène4.compteur                                                        ⟨248447⟩
                        si v314 == v316 :
                            si v324 & 1 != 0 :
                                v326 = v312                                                           ⟨248454⟩
                                CRT_Rand()                                                            ⟨248455⟩
                                v316 = (CRT_Rand()·v326) / 32768                                      ⟨248462⟩
                            si v316 < v314 :
                                v310 = -1                                                             ⟨248468⟩
                            sinon :
                                si v316 == v314 :
                                    v310 = 0                                                          ⟨248475⟩
                                sinon :
                                    v310 = 1                                                          ⟨248479⟩
                        déplace(calque=c14, dx=0, dy=v310)                                            ⟨248487⟩
                        déplace(calque=c15, dx=0, dy=v310)                                            ⟨248494⟩
                        v318_avant = v318                                                             ⟨248497⟩
                        v318 = v318 + 1                                                               ⟨248497⟩
                        si v318_avant == 1 :
                            déplace(calque=c13, dx=-1, dy=0)                                          ⟨248504⟩
                        si v318 == 5 :
                            déplace(calque=c13, dx=0, dy=1)                                           ⟨248514⟩
                        si v318 == 8 :
                            v318 = 0                                                                  ⟨248520⟩
                        v314 = v314 + v310                                                            ⟨248524⟩
                        si v324 == 2 :
                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[5])             ⟨248535⟩
                        si v324 > 2 :
                            si v324 < 20 :
                                CRT_Rand()                                                            ⟨248543⟩
                                v328 = (CRT_Rand()·3) / 32768                                         ⟨248549⟩
                                c15.image = v328                                                      ⟨248552⟩
                        si v8 - 1 == v324 :
                            sub_30AD0(objet1, 0)                                                      ⟨248562⟩
                        Scene_Tick(scène=scène4)                                                      ⟨248580⟩
                si v17 != 0 :
                    canal_arrête(canal=canal5)                                                        ⟨248608⟩
                Scene_Destruct(scène=scène4, drapeaux=0)                                              ⟨248615⟩
                si byte_4F55C == 0 :

                    ──── scène5 ────
                    scène5 = Scene_Create(cadence=10, palette=255, surface=&v456)                     ⟨248628⟩
                    c16 = Layer(ressource=optshps 116, x=0, y=-57)                                    ⟨248635⟩
                    v314 = 0                                                                          ⟨248638⟩
                    v308 = 0                                                                          ⟨248641⟩
                    charge_convdata_type0("janet", drapeau=3)                                         ⟨248646⟩
                    c17 = Layer(ressource=mid15 7, x=0, y=0)                                          ⟨248653⟩
                    c18 = TalkingHeadOverlay(ressource=convdata type 0 "janet", x=160, y=129)         ⟨248661⟩
                    c19 = ImageLayer(ressource=convdata type 0 "janet", x=160, y=129, image=51)       ⟨248670⟩
                    c18.+47 = 0                                                                       ⟨248674⟩
                    palette_copie(destination=pal1, source=pal2(optpals 21))                          ⟨248682⟩
                    palette_copie(destination=pal1, source=pal6(mid15 14))                            ⟨248691⟩
                    palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))            ⟨248700⟩
                    palette_envoie(palette=pal1, pas=0)                                               ⟨248712⟩
                    ajoute c16 à scène5                                                               ⟨248717⟩
                    ajoute c17 à scène5                                                               ⟨248722⟩
                    ajoute c18 à scène5                                                               ⟨248727⟩
                    ajoute c19 à scène5                                                               ⟨248732⟩
                    tête_image_de_base(tête=c18, image=33)                                            ⟨248736⟩
                    di = 0                                                                            ⟨248738⟩
                    si v17 != 0 :
                        charge(asoundfx 24)                                                           ⟨248750⟩
                        canal_init(canal=canal4, pilote=word_4CA5D)                                   ⟨248755⟩
                        canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)                    ⟨248762⟩
                        v322 = word_4EFA4                                                             ⟨248765⟩
                        v324 = 0                                                                      ⟨248766⟩
                        si canal4.+0 != 0 :
                            AIL_start_sequence(pilote=canal4.+0→4, séquence=v3360)                    ⟨248772⟩
                            sub_50F5(canal4.+0→4, v3360, v322, v324)                                  ⟨248779⟩
                    si v16 != 0 :
                        Scene_Tick(scène=scène5)                                                      ⟨248791⟩
                        v334 = 0                                                                      ⟨248793⟩
                        v328 = 0                                                                      ⟨248796⟩
                        charge(mid15voc 1)                                                            ⟨248803⟩
                        tête_voix(tête=c18, ressource=mid15voc 1, cadence=9)                          ⟨248809⟩
                        v336 = 0                                                                      ⟨248811⟩
                        tant que v336 < 3 :
                            Scene_Tick(scène=scène5)                                                  ⟨248817⟩
                            v336 = v336 + 1                                                           ⟨248819⟩
                        tant que tête_parle(tête=c18) != 0 :
                            si di == 0 :
                                CRT_Rand()                                                            ⟨248829⟩
                                si (CRT_Rand()·7) / 32768 == 0 :
                                    di = -1                                                           ⟨248837⟩
                                sinon :
                                    si di == -1 :
                                        di = 1                                                        ⟨248843⟩
                                    sinon :
                                        si di == 1 :
                                            di = 0                                                    ⟨248849⟩
                            sinon :
                                si di == -1 :
                                    di = 1                                                            ⟨248843⟩
                                sinon :
                                    si di == 1 :
                                        di = 0                                                        ⟨248849⟩
                            déplace(calque=c17, dx=0, dy=di)                                          ⟨248857⟩
                            déplace(calque=c18, dx=0, dy=di)                                          ⟨248864⟩
                            déplace(calque=c19, dx=0, dy=di)                                          ⟨248871⟩
                            Scene_Tick(scène=scène5)                                                  ⟨248882⟩
                        v336 = 0                                                                      ⟨248894⟩
                        tant que v336 < 4 :
                            si di == 0 :
                                CRT_Rand()                                                            ⟨248900⟩
                                si (CRT_Rand()·7) / 32768 == 0 :
                                    di = -1                                                           ⟨248908⟩
                                sinon :
                                    si di == -1 :
                                        di = 1                                                        ⟨248914⟩
                                    sinon :
                                        si di == 1 :
                                            di = 0                                                    ⟨248920⟩
                            sinon :
                                si di == -1 :
                                    di = 1                                                            ⟨248914⟩
                                sinon :
                                    si di == 1 :
                                        di = 0                                                        ⟨248920⟩
                            déplace(calque=c17, dx=0, dy=di)                                          ⟨248928⟩
                            déplace(calque=c18, dx=0, dy=di)                                          ⟨248935⟩
                            déplace(calque=c19, dx=0, dy=di)                                          ⟨248942⟩
                            Scene_Tick(scène=scène5)                                                  ⟨248953⟩
                            v336 = v336 + 1                                                           ⟨248955⟩
                        v334 = 0                                                                      ⟨248978⟩
                        v328 = 0                                                                      ⟨248980⟩
                    sinon :
                        Widget_Method_DispatchC_37052(objet1, 0)                                      ⟨248987⟩
                        Widget_Method_Dispatch8_37030(objet1, 127)                                    ⟨248992⟩
                        v10 = 70                                                                      ⟨248994⟩
                        si = scène5.compteur                                                          ⟨248995⟩
                        v8 = si + ((v10·70) / 100)                                                    ⟨249004⟩
                        tant que (scène5.compteur < v8) et (scène5.terminée == 0) :
                            v326 = scène5.compteur                                                    ⟨249009⟩
                            si di == 0 :
                                CRT_Rand()                                                            ⟨249012⟩
                                si (CRT_Rand()·7) / 32768 == 0 :
                                    di = -1                                                           ⟨249020⟩
                                sinon :
                                    si di == -1 :
                                        di = 1                                                        ⟨249026⟩
                                    sinon :
                                        si di == 1 :
                                            di = 0                                                    ⟨249032⟩
                            sinon :
                                si di == -1 :
                                    di = 1                                                            ⟨249026⟩
                                sinon :
                                    si di == 1 :
                                        di = 0                                                        ⟨249032⟩
                            déplace(calque=c17, dx=0, dy=di)                                          ⟨249040⟩
                            déplace(calque=c18, dx=0, dy=di)                                          ⟨249047⟩
                            déplace(calque=c19, dx=0, dy=di)                                          ⟨249054⟩
                            si si + 4 == v326 :
                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[6])         ⟨249068⟩
                            si si + 4 == v326 :
                                tête_texte_de_lèvres(tête=c18, texte="thtdpnshwrsnablyurwlngtbmlv")   ⟨249078⟩
                            si v8 - 1 == v326 :
                                sub_30AD0(objet1, 0)                                                  ⟨249089⟩
                            Scene_Tick(scène=scène5)                                                  ⟨249107⟩
                    si v17 != 0 :
                        canal_arrête(canal=canal4)                                                    ⟨249135⟩
                    v314 = 0                                                                          ⟨249154⟩
                    v308 = 0                                                                          ⟨249156⟩
                    Scene_Destruct(scène=scène5, drapeaux=0)                                          ⟨249160⟩
                    si byte_4F55C == 0 :

                        ──── scène6 ────
                        scène6 = Scene_Create(cadence=10, palette=255, surface=&v456)                 ⟨249173⟩
                        c20 = Layer(ressource=optshps 116, x=0, y=-57)                                ⟨249180⟩
                        v314 = 0                                                                      ⟨249183⟩
                        v308 = 0                                                                      ⟨249186⟩
                        charge_convdata_type0("air", drapeau=3)                                       ⟨249191⟩
                        c21 = Layer(ressource=midgames 4, x=0, y=0)                                   ⟨249198⟩
                        c22 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)       ⟨249206⟩
                        c23 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)     ⟨249215⟩
                        palette_copie(destination=pal1, source=pal2(optpals 21))                      ⟨249225⟩
                        palette_copie(destination=pal1, source=pal7(midgames 6))                      ⟨249234⟩
                        palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))        ⟨249243⟩
                        palette_envoie(palette=pal1, pas=0)                                           ⟨249255⟩
                        ajoute c20 à scène6                                                           ⟨249260⟩
                        ajoute c21 à scène6                                                           ⟨249265⟩
                        ajoute c22 à scène6                                                           ⟨249270⟩
                        ajoute c23 à scène6                                                           ⟨249275⟩
                        di = 0                                                                        ⟨249277⟩
                        si v17 != 0 :
                            charge(asoundfx 5)                                                        ⟨249289⟩
                            canal_init(canal=canal5, pilote=word_4CA5D)                               ⟨249294⟩
                            canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)                 ⟨249301⟩
                            v322 = word_4EF7E                                                         ⟨249304⟩
                            v324 = 0                                                                  ⟨249305⟩
                            si canal5.+0 != 0 :
                                AIL_start_sequence(pilote=canal5.+0→4, séquence=v3374)                ⟨249311⟩
                                sub_50F5(canal5.+0→4, v3374, v322, v324)                              ⟨249318⟩
                        v10 = 32                                                                      ⟨249323⟩
                        si = scène6.compteur                                                          ⟨249324⟩
                        v8 = si + ((v10·70) / 100)                                                    ⟨249333⟩
                        tant que (scène6.compteur < v8) et (scène6.terminée == 0) :
                            v326 = scène6.compteur                                                    ⟨249338⟩
                            si di == 0 :
                                CRT_Rand()                                                            ⟨249341⟩
                                si (CRT_Rand()·7) / 32768 == 0 :
                                    di = -1                                                           ⟨249349⟩
                                sinon :
                                    si di == -1 :
                                        di = 1                                                        ⟨249355⟩
                                    sinon :
                                        si di == 1 :
                                            di = 0                                                    ⟨249361⟩
                            sinon :
                                si di == -1 :
                                    di = 1                                                            ⟨249355⟩
                                sinon :
                                    si di == 1 :
                                        di = 0                                                        ⟨249361⟩
                            déplace(calque=c21, dx=0, dy=di)                                          ⟨249369⟩
                            déplace(calque=c22, dx=0, dy=di)                                          ⟨249376⟩
                            déplace(calque=c23, dx=0, dy=di)                                          ⟨249383⟩
                            si si + 5 == v326 :
                                tête_image_de_base(tête=c22, image=18)                                ⟨249391⟩
                            si si + 9 == v326 :
                                tête_image_de_base(tête=c22, image=25)                                ⟨249401⟩
                            si si + 11 == v326 :
                                tête_image_de_base(tête=c22, image=31)                                ⟨249411⟩
                            Scene_Tick(scène=scène6)                                                  ⟨249424⟩
                        si v17 != 0 :
                            canal_arrête(canal=canal5)                                                ⟨249452⟩
                        v314 = 0                                                                      ⟨249471⟩
                        v308 = 0                                                                      ⟨249473⟩
                        Scene_Destruct(scène=scène6, drapeaux=0)                                      ⟨249477⟩
                        si byte_4F55C == 0 :
                            v3386 = 436                                                               ⟨249488⟩
                            v3384 = word_4D392                                                        ⟨249490⟩
                            word_4D392 = &v3386                                                       ⟨249492⟩
                            si v17 != 0 :
                                charge(asoundfx 97)                                                   ⟨249509⟩
                                canal_init(canal=canal1, pilote=word_4CA5D)                           ⟨249514⟩
                                canal_enregistre(canal=canal1, ressource=asoundfx 97, x=0)            ⟨249521⟩
                                v314 = word_4F036                                                     ⟨249524⟩
                                v316 = 0                                                              ⟨249525⟩
                                si canal1.+0 != 0 :
                                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3388)            ⟨249531⟩
                                    sub_50F5(canal1.+0→4, v3388, v314, v316)                          ⟨249538⟩
                            charge(mid15 6)                                                           ⟨249553⟩
                            charge(mid15 10)                                                          ⟨249565⟩

                            ──── scène7 ────
                            scène7 = Scene_Create(cadence=10, palette=255, surface=&v456)             ⟨249573⟩
                            c24 = Layer(ressource=optshps 116, x=0, y=-24)                            ⟨249580⟩
                            c25 = Layer(ressource=mid15 1, x=0, y=-24)                                ⟨249588⟩
                            c26 = Layer(ressource=mid15 5, x=0, y=-24)                                ⟨249596⟩
                            c27 = Layer(ressource=mid15 6, x=0, y=-24)                                ⟨249604⟩
                            di = c27                                                                  ⟨249606⟩
                            c28 = Layer(ressource=mid15 10, x=0, y=-24)                               ⟨249612⟩
                            palette_copie(destination=pal1, source=pal4(mid15 11))                    ⟨249622⟩
                            palette_copie(destination=pal1, source=pal2(optpals 21))                  ⟨249631⟩
                            ajoute c24 à scène7                                                       ⟨249636⟩
                            ajoute c26 à scène7                                                       ⟨249641⟩
                            ajoute c25 à scène7                                                       ⟨249646⟩
                            ajoute c27 à scène7                                                       ⟨249651⟩
                            ajoute c28 à scène7                                                       ⟨249656⟩
                            palette_envoie(palette=pal1, pas=0)                                       ⟨249668⟩
                            Widget_Method_DispatchC_37052(objet1, 0)                                  ⟨249673⟩
                            Widget_Method_Dispatch8_37030(objet1, 254)                                ⟨249678⟩
                            v346 = 0                                                                  ⟨249680⟩
                            v348 = 0                                                                  ⟨249681⟩
                            v350 = 0                                                                  ⟨249682⟩
                            v352 = 0                                                                  ⟨249683⟩
                            v10 = 52                                                                  ⟨249684⟩
                            si = scène7.compteur                                                      ⟨249685⟩
                            v8 = si + ((v10·70) / 100)                                                ⟨249694⟩
                            tant que (scène7.compteur < v8) et (scène7.terminée == 0) :
                                v354 = scène7.compteur                                                ⟨249699⟩
                                c26.image = v346                                                      ⟨249704⟩
                                v346_avant = v346                                                     ⟨249705⟩
                                v346_avant = v346                                                     ⟨249705⟩
                                v346 = v346 + 1                                                       ⟨249705⟩
                                si v346 > 30 :
                                    v346_avant = v346                                                 ⟨249709⟩
                                    v346 = 0                                                          ⟨249709⟩
                                v358 = v348                                                           ⟨249713⟩
                                c25.image = v358                                                      ⟨249716⟩
                                v348 = v348 + 1                                                       ⟨249717⟩
                                si v348 > 26 :
                                    v348_avant = v348                                                 ⟨249721⟩
                                    v348 = 0                                                          ⟨249721⟩
                                si v8 - 35 < v354 :
                                    v350 = v350 + 1                                                   ⟨249728⟩
                                    si v350 > 27 :
                                        déplace(calque=c27, dx=-1, dy=0)                              ⟨249736⟩
                                        v350 = 27                                                     ⟨249738⟩
                                    v360 = v350                                                       ⟨249742⟩
                                    c27.image = v360                                                  ⟨249744⟩
                                si v8 - 23 < v354 :
                                    v352 = v352 + 1                                                   ⟨249751⟩
                                    si v352 > 15 :
                                        si v354 & 1 != 0 :
                                            déplace(calque=c28, dx=1, dy=0)                           ⟨249762⟩
                                        v352 = 15                                                     ⟨249766⟩
                                    v362 = v352                                                       ⟨249770⟩
                                    c28.image = v362                                                  ⟨249773⟩
                                si v8 - 1 == v354 :
                                    sub_30AD0(objet1, 0)                                              ⟨249783⟩
                                Scene_Tick(scène=scène7)                                              ⟨249801⟩
                            Scene_Destruct(scène=scène7, drapeaux=0)                                  ⟨249828⟩
                            v336 = 0                                                                  ⟨249845⟩
                            v330 = 0                                                                  ⟨249847⟩
                            v320 = 0                                                                  ⟨249865⟩
                            canal_arrête(canal=canal1)                                                ⟨249868⟩
                            sub_5C1C(&v3386, 2)                                                       ⟨249873⟩
                            v312 = 0                                                                  ⟨249890⟩
                            v306 = 0                                                                  ⟨249892⟩
                            si byte_4F55C == 0 :

                                ──── scène8 ────
                                scène8 = Scene_Create(cadence=10, palette=255, surface=&v456)         ⟨249904⟩
                                c29 = Layer(ressource=optshps 116, x=0, y=-57)                        ⟨249911⟩
                                v314 = 0                                                              ⟨249914⟩
                                v308 = 0                                                              ⟨249917⟩
                                charge_convdata_type0("janet", drapeau=3)                             ⟨249922⟩
                                c30 = Layer(ressource=mid15 7, x=0, y=0)                              ⟨249929⟩
                                c31 = TalkingHeadOverlay(ressource=convdata type 0 "janet", x=160, y=129)  ⟨249937⟩
                                c32 = ImageLayer(ressource=convdata type 0 "janet", x=160, y=129, image=51)  ⟨249946⟩
                                palette_copie(destination=pal1, source=pal2(optpals 21))              ⟨249956⟩
                                palette_copie(destination=pal1, source=pal6(mid15 14))                ⟨249965⟩
                                palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨249974⟩
                                palette_envoie(palette=pal1, pas=0)                                   ⟨249986⟩
                                ajoute c29 à scène8                                                   ⟨249991⟩
                                ajoute c30 à scène8                                                   ⟨249996⟩
                                ajoute c31 à scène8                                                   ⟨250001⟩
                                ajoute c32 à scène8                                                   ⟨250006⟩
                                tête_image_de_base(tête=c31, image=14)                                ⟨250010⟩
                                di = 0                                                                ⟨250012⟩
                                si v17 != 0 :
                                    charge(asoundfx 24)                                               ⟨250024⟩
                                    canal_init(canal=canal4, pilote=word_4CA5D)                       ⟨250029⟩
                                    canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)        ⟨250036⟩
                                    v322 = word_4EFA4                                                 ⟨250039⟩
                                    v324 = 0                                                          ⟨250040⟩
                                    si canal4.+0 != 0 :
                                        AIL_start_sequence(pilote=canal4.+0→4, séquence=v3360)        ⟨250046⟩
                                        sub_50F5(canal4.+0→4, v3360, v322, v324)                      ⟨250053⟩
                                si v16 != 0 :
                                    Scene_Tick(scène=scène8)                                          ⟨250065⟩
                                    charge(mid15voc 2)                                                ⟨250077⟩
                                    tête_voix(tête=c31, ressource=mid15voc 2, cadence=9)              ⟨250083⟩
                                    v336 = 0                                                          ⟨250085⟩
                                    tant que v336 < 3 :
                                        Scene_Tick(scène=scène8)                                      ⟨250091⟩
                                        v336 = v336 + 1                                               ⟨250093⟩
                                    tant que tête_parle(tête=c31) != 0 :
                                        si di == 0 :
                                            CRT_Rand()                                                ⟨250103⟩
                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                di = -1                                               ⟨250111⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨250117⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨250123⟩
                                        sinon :
                                            si di == -1 :
                                                di = 1                                                ⟨250117⟩
                                            sinon :
                                                si di == 1 :
                                                    di = 0                                            ⟨250123⟩
                                        déplace(calque=c30, dx=0, dy=di)                              ⟨250131⟩
                                        déplace(calque=c31, dx=0, dy=di)                              ⟨250138⟩
                                        déplace(calque=c32, dx=0, dy=di)                              ⟨250145⟩
                                        Scene_Tick(scène=scène8)                                      ⟨250156⟩
                                    v336 = 0                                                          ⟨250168⟩
                                    tant que v336 < 8 :
                                        si di == 0 :
                                            CRT_Rand()                                                ⟨250174⟩
                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                di = -1                                               ⟨250182⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨250188⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨250194⟩
                                        sinon :
                                            si di == -1 :
                                                di = 1                                                ⟨250188⟩
                                            sinon :
                                                si di == 1 :
                                                    di = 0                                            ⟨250194⟩
                                        déplace(calque=c30, dx=0, dy=di)                              ⟨250202⟩
                                        déplace(calque=c31, dx=0, dy=di)                              ⟨250209⟩
                                        déplace(calque=c32, dx=0, dy=di)                              ⟨250216⟩
                                        Scene_Tick(scène=scène8)                                      ⟨250227⟩
                                        v336 = v336 + 1                                               ⟨250229⟩
                                    v334 = 0                                                          ⟨250252⟩
                                    v328 = 0                                                          ⟨250254⟩
                                sinon :
                                    Widget_Method_DispatchC_37052(objet1, 0)                          ⟨250261⟩
                                    Widget_Method_Dispatch8_37030(objet1, 127)                        ⟨250266⟩
                                    v10 = 47                                                          ⟨250268⟩
                                    si = scène8.compteur                                              ⟨250269⟩
                                    v8 = si + ((v10·70) / 100)                                        ⟨250278⟩
                                    tant que (scène8.compteur < v8) et (scène8.terminée == 0) :
                                        si di == 0 :
                                            CRT_Rand()                                                ⟨250286⟩
                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                di = -1                                               ⟨250294⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨250300⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨250306⟩
                                        sinon :
                                            si di == -1 :
                                                di = 1                                                ⟨250300⟩
                                            sinon :
                                                si di == 1 :
                                                    di = 0                                            ⟨250306⟩
                                        déplace(calque=c30, dx=0, dy=di)                              ⟨250314⟩
                                        déplace(calque=c31, dx=0, dy=di)                              ⟨250321⟩
                                        déplace(calque=c32, dx=0, dy=di)                              ⟨250328⟩
                                        si si + 6 == scène8.compteur :
                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[7])  ⟨250342⟩
                                        si si + 2 == scène8.compteur :
                                            tête_texte_de_lèvres(tête=c31, texte="thchesisyrs")       ⟨250352⟩
                                        si v8 - 1 == scène8.compteur :
                                            sub_30AD0(objet1, 0)                                      ⟨250363⟩
                                        Scene_Tick(scène=scène8)                                      ⟨250381⟩
                                    v10 = 55                                                          ⟨250405⟩
                                    si = scène8.compteur                                              ⟨250406⟩
                                    v8 = si + ((v10·70) / 100)                                        ⟨250415⟩
                                    tant que (scène8.compteur < v8) et (scène8.terminée == 0) :
                                        si di == 0 :
                                            CRT_Rand()                                                ⟨250423⟩
                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                di = -1                                               ⟨250431⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨250437⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨250443⟩
                                        sinon :
                                            si di == -1 :
                                                di = 1                                                ⟨250437⟩
                                            sinon :
                                                si di == 1 :
                                                    di = 0                                            ⟨250443⟩
                                        déplace(calque=c30, dx=0, dy=di)                              ⟨250451⟩
                                        déplace(calque=c31, dx=0, dy=di)                              ⟨250458⟩
                                        déplace(calque=c32, dx=0, dy=di)                              ⟨250465⟩
                                        si si + 2 == scène8.compteur :
                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[8])  ⟨250478⟩
                                        si si + 2 == scène8.compteur :
                                            tête_texte_de_lèvres(tête=c31, texte="Ethrhdduestndldatourarstip")  ⟨250488⟩
                                        si v8 - 1 == scène8.compteur :
                                            sub_30AD0(objet1, 0)                                      ⟨250499⟩
                                        Scene_Tick(scène=scène8)                                      ⟨250517⟩
                                    v10 = 50                                                          ⟨250541⟩
                                    si = scène8.compteur                                              ⟨250542⟩
                                    v8 = si + ((v10·70) / 100)                                        ⟨250551⟩
                                    tant que (scène8.compteur < v8) et (scène8.terminée == 0) :
                                        si di == 0 :
                                            CRT_Rand()                                                ⟨250559⟩
                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                di = -1                                               ⟨250567⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨250573⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨250579⟩
                                        sinon :
                                            si di == -1 :
                                                di = 1                                                ⟨250573⟩
                                            sinon :
                                                si di == 1 :
                                                    di = 0                                            ⟨250579⟩
                                        si si + 2 == scène8.compteur :
                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[9])  ⟨250594⟩
                                        si si + 2 == scène8.compteur :
                                            tête_texte_de_lèvres(tête=c31, texte="orwlblwuotovdasky")  ⟨250604⟩
                                        si v8 - 1 == scène8.compteur :
                                            sub_30AD0(objet1, 0)                                      ⟨250615⟩
                                        Scene_Tick(scène=scène8)                                      ⟨250633⟩
                                si v17 != 0 :
                                    canal_arrête(canal=canal4)                                        ⟨250661⟩
                                v314 = 0                                                              ⟨250680⟩
                                v308 = 0                                                              ⟨250682⟩
                                Scene_Destruct(scène=scène8, drapeaux=0)                              ⟨250686⟩
                                si byte_4F55C == 0 :

                                    ──── scène9 ────
                                    scène9 = Scene_Create(cadence=10, palette=255, surface=&v456)     ⟨250699⟩
                                    c33 = Layer(ressource=optshps 116, x=0, y=-67)                    ⟨250706⟩
                                    v314 = 0                                                          ⟨250709⟩
                                    v308 = 0                                                          ⟨250712⟩
                                    charge_convdata_type0("air", drapeau=3)                           ⟨250717⟩
                                    c34 = Layer(ressource=midgames 4, x=0, y=0)                       ⟨250724⟩
                                    c35 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)  ⟨250732⟩
                                    c36 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)  ⟨250741⟩
                                    palette_copie(destination=pal1, source=pal2(optpals 21))          ⟨250751⟩
                                    palette_copie(destination=pal1, source=pal7(midgames 6))          ⟨250760⟩
                                    palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨250769⟩
                                    palette_envoie(palette=pal1, pas=0)                               ⟨250781⟩
                                    ajoute c33 à scène9                                               ⟨250786⟩
                                    ajoute c34 à scène9                                               ⟨250791⟩
                                    ajoute c35 à scène9                                               ⟨250796⟩
                                    ajoute c36 à scène9                                               ⟨250801⟩
                                    tête_image_de_base(tête=c35, image=25)                            ⟨250805⟩
                                    di = 0                                                            ⟨250807⟩
                                    si v17 != 0 :
                                        charge(asoundfx 5)                                            ⟨250819⟩
                                        canal_init(canal=canal5, pilote=word_4CA5D)                   ⟨250824⟩
                                        canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)     ⟨250831⟩
                                        v322 = word_4EF7E                                             ⟨250834⟩
                                        v324 = 0                                                      ⟨250835⟩
                                        si canal5.+0 != 0 :
                                            AIL_start_sequence(pilote=canal5.+0→4, séquence=v3374)    ⟨250841⟩
                                            sub_50F5(canal5.+0→4, v3374, v322, v324)                  ⟨250848⟩
                                    si v16 != 0 :
                                        Scene_Tick(scène=scène9)                                      ⟨250860⟩
                                        v334 = 0                                                      ⟨250862⟩
                                        v328 = 0                                                      ⟨250865⟩
                                        charge(mid15voc 12)                                           ⟨250872⟩
                                        tête_voix(tête=c35, ressource=mid15voc 12, cadence=9)         ⟨250878⟩
                                        v336 = 0                                                      ⟨250880⟩
                                        tant que v336 < 3 :
                                            Scene_Tick(scène=scène9)                                  ⟨250886⟩
                                            v336 = v336 + 1                                           ⟨250888⟩
                                        tant que tête_parle(tête=c35) != 0 :
                                            si di == 0 :
                                                CRT_Rand()                                            ⟨250898⟩
                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                    di = -1                                           ⟨250906⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨250912⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨250918⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨250912⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨250918⟩
                                            déplace(calque=c34, dx=0, dy=di)                          ⟨250926⟩
                                            déplace(calque=c35, dx=0, dy=di)                          ⟨250933⟩
                                            déplace(calque=c36, dx=0, dy=di)                          ⟨250940⟩
                                            Scene_Tick(scène=scène9)                                  ⟨250951⟩
                                        v336 = 0                                                      ⟨250963⟩
                                        tant que v336 < 8 :
                                            si di == 0 :
                                                CRT_Rand()                                            ⟨250969⟩
                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                    di = -1                                           ⟨250977⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨250983⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨250989⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨250983⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨250989⟩
                                            déplace(calque=c34, dx=0, dy=di)                          ⟨250997⟩
                                            déplace(calque=c35, dx=0, dy=di)                          ⟨251004⟩
                                            déplace(calque=c36, dx=0, dy=di)                          ⟨251011⟩
                                            Scene_Tick(scène=scène9)                                  ⟨251022⟩
                                            v336 = v336 + 1                                           ⟨251024⟩
                                        v334 = 0                                                      ⟨251047⟩
                                        v328 = 0                                                      ⟨251049⟩
                                    sinon :
                                        Widget_Method_DispatchC_37052(objet1, 0)                      ⟨251056⟩
                                        Widget_Method_Dispatch8_37030(objet1, 127)                    ⟨251061⟩
                                        v10 = 45                                                      ⟨251063⟩
                                        si = scène9.compteur                                          ⟨251064⟩
                                        v8 = si + ((v10·70) / 100)                                    ⟨251073⟩
                                        tant que (scène9.compteur < v8) et (scène9.terminée == 0) :
                                            si di == 0 :
                                                CRT_Rand()                                            ⟨251081⟩
                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                    di = -1                                           ⟨251089⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨251095⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨251101⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨251095⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨251101⟩
                                            déplace(calque=c34, dx=0, dy=di)                          ⟨251109⟩
                                            déplace(calque=c35, dx=0, dy=di)                          ⟨251116⟩
                                            déplace(calque=c36, dx=0, dy=di)                          ⟨251123⟩
                                            si si + 2 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[10])  ⟨251137⟩
                                            si si + 2 == scène9.compteur :
                                                tête_texte_de_lèvres(tête=c35, texte="watthelzgongonher")  ⟨251147⟩
                                            si v8 - 1 == scène9.compteur :
                                                sub_30AD0(objet1, 0)                                  ⟨251158⟩
                                            Scene_Tick(scène=scène9)                                  ⟨251176⟩
                                    si v17 != 0 :
                                        canal_arrête(canal=canal5)                                    ⟨251204⟩
                                    v314 = 0                                                          ⟨251223⟩
                                    v308 = 0                                                          ⟨251225⟩
                                    Scene_Destruct(scène=scène9, drapeaux=0)                          ⟨251229⟩
                                    si byte_4F55C == 0 :

                                        ──── scène10 ────
                                        scène10 = Scene_Create(cadence=10, palette=255, surface=&v456)  ⟨251242⟩
                                        c37 = Layer(ressource=optshps 116, x=0, y=-57)                ⟨251249⟩
                                        v314 = 0                                                      ⟨251252⟩
                                        v308 = 0                                                      ⟨251255⟩
                                        charge_convdata_type0("janet", drapeau=3)                     ⟨251260⟩
                                        c38 = Layer(ressource=mid15 7, x=0, y=0)                      ⟨251267⟩
                                        c39 = TalkingHeadOverlay(ressource=convdata type 0 "janet", x=160, y=129)  ⟨251275⟩
                                        c40 = ImageLayer(ressource=convdata type 0 "janet", x=160, y=129, image=51)  ⟨251284⟩
                                        c39.+47 = 0                                                   ⟨251288⟩
                                        palette_copie(destination=pal1, source=pal2(optpals 21))      ⟨251296⟩
                                        palette_copie(destination=pal1, source=pal6(mid15 14))        ⟨251305⟩
                                        palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨251314⟩
                                        palette_envoie(palette=pal1, pas=0)                           ⟨251326⟩
                                        ajoute c37 à scène10                                          ⟨251331⟩
                                        ajoute c38 à scène10                                          ⟨251336⟩
                                        ajoute c39 à scène10                                          ⟨251341⟩
                                        ajoute c40 à scène10                                          ⟨251346⟩
                                        di = 0                                                        ⟨251348⟩
                                        si v17 != 0 :
                                            charge(asoundfx 24)                                       ⟨251360⟩
                                            canal_init(canal=canal4, pilote=word_4CA5D)               ⟨251365⟩
                                            canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)  ⟨251372⟩
                                            v322 = word_4EFA4                                         ⟨251375⟩
                                            v324 = 0                                                  ⟨251376⟩
                                            si canal4.+0 != 0 :
                                                AIL_start_sequence(pilote=canal4.+0→4, séquence=v3360)  ⟨251382⟩
                                                sub_50F5(canal4.+0→4, v3360, v322, v324)              ⟨251389⟩
                                        si v16 != 0 :
                                            Scene_Tick(scène=scène10)                                 ⟨251401⟩
                                            v334 = 0                                                  ⟨251403⟩
                                            v328 = 0                                                  ⟨251406⟩
                                            charge(mid15voc 3)                                        ⟨251413⟩
                                            tête_voix(tête=c39, ressource=mid15voc 3, cadence=9)      ⟨251419⟩
                                            v336 = 0                                                  ⟨251421⟩
                                            tant que v336 < 3 :
                                                Scene_Tick(scène=scène10)                             ⟨251427⟩
                                                v336 = v336 + 1                                       ⟨251429⟩
                                            tant que tête_parle(tête=c39) != 0 :
                                                si di == 0 :
                                                    CRT_Rand()                                        ⟨251439⟩
                                                    si (CRT_Rand()·7) / 32768 == 0 :
                                                        di = -1                                       ⟨251447⟩
                                                    sinon :
                                                        si di == -1 :
                                                            di = 1                                    ⟨251453⟩
                                                        sinon :
                                                            si di == 1 :
                                                                di = 0                                ⟨251459⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨251453⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨251459⟩
                                                déplace(calque=c38, dx=0, dy=di)                      ⟨251467⟩
                                                déplace(calque=c39, dx=0, dy=di)                      ⟨251474⟩
                                                déplace(calque=c40, dx=0, dy=di)                      ⟨251481⟩
                                                Scene_Tick(scène=scène10)                             ⟨251492⟩
                                            v336 = 0                                                  ⟨251504⟩
                                            tant que v336 < 3 :
                                                si di == 0 :
                                                    CRT_Rand()                                        ⟨251510⟩
                                                    si (CRT_Rand()·7) / 32768 == 0 :
                                                        di = -1                                       ⟨251518⟩
                                                    sinon :
                                                        si di == -1 :
                                                            di = 1                                    ⟨251524⟩
                                                        sinon :
                                                            si di == 1 :
                                                                di = 0                                ⟨251530⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨251524⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨251530⟩
                                                déplace(calque=c38, dx=0, dy=di)                      ⟨251538⟩
                                                déplace(calque=c39, dx=0, dy=di)                      ⟨251545⟩
                                                déplace(calque=c40, dx=0, dy=di)                      ⟨251552⟩
                                                Scene_Tick(scène=scène10)                             ⟨251563⟩
                                                v336 = v336 + 1                                       ⟨251565⟩
                                            v334 = 0                                                  ⟨251588⟩
                                            v328 = 0                                                  ⟨251590⟩
                                        sinon :
                                            Widget_Method_DispatchC_37052(objet1, 0)                  ⟨251597⟩
                                            Widget_Method_Dispatch8_37030(objet1, 127)                ⟨251602⟩
                                            v10 = 60                                                  ⟨251604⟩
                                            si = scène10.compteur                                     ⟨251605⟩
                                            v8 = si + ((v10·70) / 100)                                ⟨251614⟩
                                            tant que (scène10.compteur < v8) et (scène10.terminée == 0) :
                                                si di == 0 :
                                                    CRT_Rand()                                        ⟨251622⟩
                                                    si (CRT_Rand()·7) / 32768 == 0 :
                                                        di = -1                                       ⟨251630⟩
                                                    sinon :
                                                        si di == -1 :
                                                            di = 1                                    ⟨251636⟩
                                                        sinon :
                                                            si di == 1 :
                                                                di = 0                                ⟨251642⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨251636⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨251642⟩
                                                déplace(calque=c38, dx=0, dy=di)                      ⟨251650⟩
                                                déplace(calque=c39, dx=0, dy=di)                      ⟨251657⟩
                                                déplace(calque=c40, dx=0, dy=di)                      ⟨251664⟩
                                                si si + 2 == scène10.compteur :
                                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[11])  ⟨251678⟩
                                                si si + 2 == scène10.compteur :
                                                    tête_texte_de_lèvres(tête=c39, texte="Itldjewasmllyerlrdrlngn")  ⟨251688⟩
                                                si v8 - 1 == scène10.compteur :
                                                    sub_30AD0(objet1, 0)                              ⟨251699⟩
                                                Scene_Tick(scène=scène10)                             ⟨251717⟩
                                            v10 = 58                                                  ⟨251741⟩
                                            si = scène10.compteur                                     ⟨251742⟩
                                            v8 = si + ((v10·70) / 100)                                ⟨251751⟩
                                            tant que (scène10.compteur < v8) et (scène10.terminée == 0) :
                                                si di == 0 :
                                                    CRT_Rand()                                        ⟨251759⟩
                                                    si (CRT_Rand()·7) / 32768 == 0 :
                                                        di = -1                                       ⟨251767⟩
                                                    sinon :
                                                        si di == -1 :
                                                            di = 1                                    ⟨251773⟩
                                                        sinon :
                                                            si di == 1 :
                                                                di = 0                                ⟨251779⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨251773⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨251779⟩
                                                déplace(calque=c38, dx=0, dy=di)                      ⟨251787⟩
                                                déplace(calque=c39, dx=0, dy=di)                      ⟨251794⟩
                                                déplace(calque=c40, dx=0, dy=di)                      ⟨251801⟩
                                                si si + 2 == scène10.compteur :
                                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[12])  ⟨251815⟩
                                                si si + 2 == scène10.compteur :
                                                    tête_texte_de_lèvres(tête=c39, texte="Idndlvdajaklz btnotobewthjeu")  ⟨251825⟩
                                                si v8 - 1 == scène10.compteur :
                                                    sub_30AD0(objet1, 0)                              ⟨251836⟩
                                                Scene_Tick(scène=scène10)                             ⟨251854⟩
                                            v10 = 90                                                  ⟨251878⟩
                                            si = scène10.compteur                                     ⟨251879⟩
                                            v8 = si + ((v10·70) / 100)                                ⟨251888⟩
                                            tant que (scène10.compteur < v8) et (scène10.terminée == 0) :
                                                si di == 0 :
                                                    CRT_Rand()                                        ⟨251896⟩
                                                    si (CRT_Rand()·7) / 32768 == 0 :
                                                        di = -1                                       ⟨251904⟩
                                                    sinon :
                                                        si di == -1 :
                                                            di = 1                                    ⟨251910⟩
                                                        sinon :
                                                            si di == 1 :
                                                                di = 0                                ⟨251916⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨251910⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨251916⟩
                                                déplace(calque=c38, dx=0, dy=di)                      ⟨251924⟩
                                                déplace(calque=c39, dx=0, dy=di)                      ⟨251931⟩
                                                déplace(calque=c40, dx=0, dy=di)                      ⟨251938⟩
                                                si si + 2 == scène10.compteur :
                                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[13])  ⟨251952⟩
                                                si si + 2 == scène10.compteur :
                                                    tête_texte_de_lèvres(tête=c39, texte="ilftbcsiwntoclctthtbutyagnstmndz")  ⟨251962⟩
                                                si v8 - 1 == scène10.compteur :
                                                    sub_30AD0(objet1, 0)                              ⟨251973⟩
                                                Scene_Tick(scène=scène10)                             ⟨251991⟩
                                        si v17 != 0 :
                                            canal_arrête(canal=canal4)                                ⟨252019⟩
                                        v314 = 0                                                      ⟨252038⟩
                                        v308 = 0                                                      ⟨252040⟩
                                        Scene_Destruct(scène=scène10, drapeaux=0)                     ⟨252044⟩
                                        si byte_4F55C == 0 :

                                            ──── scène11 ────
                                            scène11 = Scene_Create(cadence=10, palette=255, surface=&v456)  ⟨252057⟩
                                            c41 = Layer(ressource=optshps 116, x=0, y=-47)            ⟨252064⟩
                                            c42 = Layer(ressource=mid15 8, x=0, y=-1)                 ⟨252072⟩
                                            di = c42                                                  ⟨252074⟩
                                            c43 = Layer(ressource=mid15 3, x=0, y=-1)                 ⟨252080⟩
                                            c44 = OverlayImageLayer(ressource=mid15 0, x=0, y=-1, image=1)  ⟨252089⟩
                                            palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨252099⟩
                                            palette_copie(destination=pal1, source=pal3(mid15 15))    ⟨252108⟩
                                            ajoute c41 à scène11                                      ⟨252113⟩
                                            ajoute c42 à scène11                                      ⟨252118⟩
                                            ajoute c43 à scène11                                      ⟨252123⟩
                                            ajoute c44 à scène11                                      ⟨252128⟩
                                            palette_envoie(palette=pal1, pas=0)                       ⟨252140⟩
                                            v310 = 0                                                  ⟨252142⟩
                                            v312 = 3                                                  ⟨252143⟩
                                            v314 = 2                                                  ⟨252144⟩
                                            v316 = 2                                                  ⟨252145⟩
                                            v318 = 0                                                  ⟨252146⟩
                                            si v17 != 0 :
                                                charge(asoundfx 5)                                    ⟨252158⟩
                                                canal_init(canal=canal5, pilote=word_4CA5D)           ⟨252163⟩
                                                canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)  ⟨252170⟩
                                                v320 = word_4EF7E - 50                                ⟨252174⟩
                                                v322 = 0                                              ⟨252175⟩
                                                si canal5.+0 != 0 :
                                                    AIL_start_sequence(pilote=canal5.+0→4, séquence=v3374)  ⟨252181⟩
                                                    sub_50F5(canal5.+0→4, v3374, v320, v322)          ⟨252188⟩
                                            si v16 != 0 :
                                                Scene_Tick(scène=scène11)                             ⟨252200⟩
                                                charge(mid15voc 4)                                    ⟨252212⟩
                                                voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid15voc 4)  ⟨252218⟩
                                                v334 = 0                                              ⟨252220⟩
                                                tant que v334 < 4 :
                                                    Scene_Tick(scène=scène11)                         ⟨252226⟩
                                                    v334 = v334 + 1                                   ⟨252228⟩
                                                voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)       ⟨252236⟩
                                                v334 = 0                                              ⟨252238⟩
                                                tant que voix_en_cours(voix=voix1) != 0 :
                                                    si v314 == v316 :
                                                        v334_avant = v334                             ⟨252246⟩
                                                        v334 = v334 + 1                               ⟨252246⟩
                                                        si v334_avant & 1 != 0 :
                                                            v336 = v312                               ⟨252250⟩
                                                            CRT_Rand()                                ⟨252251⟩
                                                            v316 = (CRT_Rand()·v336) / 32768          ⟨252258⟩
                                                        si v316 < v314 :
                                                            v310 = -1                                 ⟨252264⟩
                                                        sinon :
                                                            si v316 == v314 :
                                                                v310 = 0                              ⟨252271⟩
                                                            sinon :
                                                                v310 = 1                              ⟨252275⟩
                                                    déplace(calque=c43, dx=0, dy=v310)                ⟨252283⟩
                                                    déplace(calque=c44, dx=0, dy=v310)                ⟨252290⟩
                                                    v318_avant = v318                                 ⟨252293⟩
                                                    v318 = v318 + 1                                   ⟨252293⟩
                                                    si v318_avant == 1 :
                                                        déplace(calque=c42, dx=-1, dy=0)              ⟨252300⟩
                                                    si v318 == 5 :
                                                        déplace(calque=c42, dx=0, dy=1)               ⟨252310⟩
                                                    si v318 == 8 :
                                                        v318 = 0                                      ⟨252316⟩
                                                    v314 = v314 + v310                                ⟨252320⟩
                                                    Scene_Tick(scène=scène11)                         ⟨252330⟩
                                                v334 = 0                                              ⟨252343⟩
                                                tant que v334 < 4 :
                                                    Scene_Tick(scène=scène11)                         ⟨252349⟩
                                                    v334 = v334 + 1                                   ⟨252351⟩
                                                voix_arrête(voix=voix1)                               ⟨252358⟩
                                                v332 = 0                                              ⟨252375⟩
                                            sinon :
                                                Widget_Method_DispatchC_37052(objet1, 0)              ⟨252384⟩
                                                Widget_Method_Dispatch8_37030(objet1, 197)            ⟨252389⟩
                                                v10 = 60                                              ⟨252391⟩
                                                si = scène11.compteur                                 ⟨252392⟩
                                                v8 = si + ((v10·70) / 100)                            ⟨252401⟩
                                                tant que (scène11.compteur < v8) et (scène11.terminée == 0) :
                                                    v324 = scène11.compteur                           ⟨252406⟩
                                                    si v314 == v316 :
                                                        si v324 & 1 != 0 :
                                                            CRT_Rand()                                ⟨252414⟩
                                                            v316 = (CRT_Rand()·v312) / 32768          ⟨252421⟩
                                                        si v316 < v314 :
                                                            v310 = -1                                 ⟨252427⟩
                                                        sinon :
                                                            si v316 == v314 :
                                                                v310 = 0                              ⟨252434⟩
                                                            sinon :
                                                                v310 = 1                              ⟨252438⟩
                                                    déplace(calque=c43, dx=0, dy=v310)                ⟨252446⟩
                                                    déplace(calque=c44, dx=0, dy=v310)                ⟨252453⟩
                                                    v318_avant = v318                                 ⟨252456⟩
                                                    v318 = v318 + 1                                   ⟨252456⟩
                                                    si v318_avant == 1 :
                                                        déplace(calque=c42, dx=-1, dy=0)              ⟨252463⟩
                                                    si v318 == 5 :
                                                        déplace(calque=c42, dx=0, dy=1)               ⟨252473⟩
                                                    si v318 == 8 :
                                                        v318 = 0                                      ⟨252479⟩
                                                    v314 = v314 + v310                                ⟨252483⟩
                                                    si si + 10 == v324 :
                                                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[14])  ⟨252496⟩
                                                    si v8 - 1 == v324 :
                                                        sub_30AD0(objet1, 0)                          ⟨252507⟩
                                                    Scene_Tick(scène=scène11)                         ⟨252525⟩
                                            si v17 != 0 :
                                                canal_arrête(canal=canal5)                            ⟨252553⟩
                                            Scene_Destruct(scène=scène11, drapeaux=0)                 ⟨252560⟩
                                            si byte_4F55C == 0 :

                                                ──── scène12 ────
                                                scène12 = Scene_Create(cadence=10, palette=255, surface=&v456)  ⟨252573⟩
                                                c45 = Layer(ressource=optshps 116, x=0, y=-67)        ⟨252580⟩
                                                v314 = 0                                              ⟨252583⟩
                                                v308 = 0                                              ⟨252586⟩
                                                charge_convdata_type0("air", drapeau=3)               ⟨252591⟩
                                                c46 = Layer(ressource=midgames 4, x=0, y=0)           ⟨252598⟩
                                                c47 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)  ⟨252606⟩
                                                c48 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)  ⟨252615⟩
                                                palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨252625⟩
                                                palette_copie(destination=pal1, source=pal7(midgames 6))  ⟨252634⟩
                                                palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨252643⟩
                                                palette_envoie(palette=pal1, pas=0)                   ⟨252655⟩
                                                ajoute c45 à scène12                                  ⟨252660⟩
                                                ajoute c46 à scène12                                  ⟨252665⟩
                                                ajoute c47 à scène12                                  ⟨252670⟩
                                                ajoute c48 à scène12                                  ⟨252675⟩
                                                tête_image_de_base(tête=c47, image=33)                ⟨252679⟩
                                                di = 0                                                ⟨252681⟩
                                                si v17 != 0 :
                                                    charge(asoundfx 5)                                ⟨252693⟩
                                                    canal_init(canal=canal5, pilote=word_4CA5D)       ⟨252698⟩
                                                    canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)  ⟨252705⟩
                                                    v322 = word_4EF7E                                 ⟨252708⟩
                                                    v324 = 0                                          ⟨252709⟩
                                                    si canal5.+0 != 0 :
                                                        AIL_start_sequence(pilote=canal5.+0→4, séquence=v3374)  ⟨252715⟩
                                                        sub_50F5(canal5.+0→4, v3374, v322, v324)      ⟨252722⟩
                                                si v16 != 0 :
                                                    Scene_Tick(scène=scène12)                         ⟨252734⟩
                                                    v334 = 0                                          ⟨252736⟩
                                                    v328 = 0                                          ⟨252739⟩
                                                    charge(mid15voc 13)                               ⟨252746⟩
                                                    tête_voix(tête=c47, ressource=mid15voc 13, cadence=9)  ⟨252752⟩
                                                    v336 = 0                                          ⟨252754⟩
                                                    tant que v336 < 3 :
                                                        Scene_Tick(scène=scène12)                     ⟨252760⟩
                                                        v336 = v336 + 1                               ⟨252762⟩
                                                    tant que tête_parle(tête=c47) != 0 :
                                                        si di == 0 :
                                                            CRT_Rand()                                ⟨252772⟩
                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                di = -1                               ⟨252780⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨252786⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨252792⟩
                                                        sinon :
                                                            si di == -1 :
                                                                di = 1                                ⟨252786⟩
                                                            sinon :
                                                                si di == 1 :
                                                                    di = 0                            ⟨252792⟩
                                                        déplace(calque=c46, dx=0, dy=di)              ⟨252800⟩
                                                        déplace(calque=c47, dx=0, dy=di)              ⟨252807⟩
                                                        déplace(calque=c48, dx=0, dy=di)              ⟨252814⟩
                                                        Scene_Tick(scène=scène12)                     ⟨252825⟩
                                                    v336 = 0                                          ⟨252837⟩
                                                    tant que v336 < 8 :
                                                        si di == 0 :
                                                            CRT_Rand()                                ⟨252843⟩
                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                di = -1                               ⟨252851⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨252857⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨252863⟩
                                                        sinon :
                                                            si di == -1 :
                                                                di = 1                                ⟨252857⟩
                                                            sinon :
                                                                si di == 1 :
                                                                    di = 0                            ⟨252863⟩
                                                        déplace(calque=c46, dx=0, dy=di)              ⟨252871⟩
                                                        déplace(calque=c47, dx=0, dy=di)              ⟨252878⟩
                                                        déplace(calque=c48, dx=0, dy=di)              ⟨252885⟩
                                                        Scene_Tick(scène=scène12)                     ⟨252896⟩
                                                        v336 = v336 + 1                               ⟨252898⟩
                                                    v334 = 0                                          ⟨252921⟩
                                                    v328 = 0                                          ⟨252923⟩
                                                sinon :
                                                    Widget_Method_DispatchC_37052(objet1, 0)          ⟨252930⟩
                                                    Widget_Method_Dispatch8_37030(objet1, 127)        ⟨252935⟩
                                                    v10 = 57                                          ⟨252937⟩
                                                    si = scène12.compteur                             ⟨252938⟩
                                                    v8 = si + ((v10·70) / 100)                        ⟨252947⟩
                                                    tant que (scène12.compteur < v8) et (scène12.terminée == 0) :
                                                        si di == 0 :
                                                            CRT_Rand()                                ⟨252955⟩
                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                di = -1                               ⟨252963⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨252969⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨252975⟩
                                                        sinon :
                                                            si di == -1 :
                                                                di = 1                                ⟨252969⟩
                                                            sinon :
                                                                si di == 1 :
                                                                    di = 0                            ⟨252975⟩
                                                        déplace(calque=c46, dx=0, dy=di)              ⟨252983⟩
                                                        déplace(calque=c47, dx=0, dy=di)              ⟨252990⟩
                                                        déplace(calque=c48, dx=0, dy=di)              ⟨252997⟩
                                                        si si + 3 == scène12.compteur :
                                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[15])  ⟨253011⟩
                                                        si si + 3 == scène12.compteur :
                                                            tête_texte_de_lèvres(tête=c47, texte="thtzhrdlyazmlyJant")  ⟨253021⟩
                                                        si v8 - 1 == scène12.compteur :
                                                            sub_30AD0(objet1, 0)                      ⟨253032⟩
                                                        Scene_Tick(scène=scène12)                     ⟨253050⟩
                                                si v17 != 0 :
                                                    canal_arrête(canal=canal5)                        ⟨253078⟩
                                                v314 = 0                                              ⟨253097⟩
                                                v308 = 0                                              ⟨253099⟩
                                                Scene_Destruct(scène=scène12, drapeaux=0)             ⟨253103⟩
                                                si byte_4F55C == 0 :

                                                    ──── scène13 ────
                                                    scène13 = Scene_Create(cadence=10, palette=255, surface=&v456)  ⟨253116⟩
                                                    c49 = Layer(ressource=optshps 116, x=0, y=-57)    ⟨253123⟩
                                                    v314 = 0                                          ⟨253126⟩
                                                    v308 = 0                                          ⟨253129⟩
                                                    charge_convdata_type0("janet", drapeau=3)         ⟨253134⟩
                                                    c50 = Layer(ressource=mid15 7, x=0, y=0)          ⟨253141⟩
                                                    c51 = TalkingHeadOverlay(ressource=convdata type 0 "janet", x=160, y=129)  ⟨253149⟩
                                                    c52 = ImageLayer(ressource=convdata type 0 "janet", x=160, y=129, image=51)  ⟨253158⟩
                                                    palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨253168⟩
                                                    palette_copie(destination=pal1, source=pal6(mid15 14))  ⟨253177⟩
                                                    palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨253186⟩
                                                    palette_envoie(palette=pal1, pas=0)               ⟨253198⟩
                                                    ajoute c49 à scène13                              ⟨253203⟩
                                                    ajoute c50 à scène13                              ⟨253208⟩
                                                    ajoute c51 à scène13                              ⟨253213⟩
                                                    ajoute c52 à scène13                              ⟨253218⟩
                                                    di = 0                                            ⟨253220⟩
                                                    si v17 != 0 :
                                                        charge(asoundfx 24)                           ⟨253232⟩
                                                        canal_init(canal=canal4, pilote=word_4CA5D)   ⟨253237⟩
                                                        canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)  ⟨253244⟩
                                                        v322 = word_4EFA4                             ⟨253247⟩
                                                        v324 = 0                                      ⟨253248⟩
                                                        si canal4.+0 != 0 :
                                                            AIL_start_sequence(pilote=canal4.+0→4, séquence=v3360)  ⟨253254⟩
                                                            sub_50F5(canal4.+0→4, v3360, v322, v324)  ⟨253261⟩
                                                    si v16 != 0 :
                                                        Scene_Tick(scène=scène13)                     ⟨253273⟩
                                                        v334 = 0                                      ⟨253275⟩
                                                        v328 = 0                                      ⟨253278⟩
                                                        charge(mid15voc 5)                            ⟨253285⟩
                                                        tête_voix(tête=c51, ressource=mid15voc 5, cadence=9)  ⟨253291⟩
                                                        v336 = 0                                      ⟨253293⟩
                                                        tant que v336 < 3 :
                                                            Scene_Tick(scène=scène13)                 ⟨253299⟩
                                                            v336 = v336 + 1                           ⟨253301⟩
                                                        tant que tête_parle(tête=c51) != 0 :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨253311⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨253319⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨253325⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨253331⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨253325⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨253331⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨253339⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨253346⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨253353⟩
                                                            Scene_Tick(scène=scène13)                 ⟨253364⟩
                                                        v336 = 0                                      ⟨253376⟩
                                                        tant que v336 < 8 :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨253382⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨253390⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨253396⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨253402⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨253396⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨253402⟩
                                                            Scene_Tick(scène=scène13)                 ⟨253414⟩
                                                            v336 = v336 + 1                           ⟨253416⟩
                                                        v346 = 0                                      ⟨253423⟩
                                                        v340 = 0                                      ⟨253426⟩
                                                        charge(mid15voc 6)                            ⟨253433⟩
                                                        tête_voix(tête=c51, ressource=mid15voc 6, cadence=9)  ⟨253439⟩
                                                        v336 = 0                                      ⟨253441⟩
                                                        tant que v336 < 3 :
                                                            Scene_Tick(scène=scène13)                 ⟨253447⟩
                                                            v336 = v336 + 1                           ⟨253449⟩
                                                        tant que tête_parle(tête=c51) != 0 :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨253459⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨253467⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨253473⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨253479⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨253473⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨253479⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨253487⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨253494⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨253501⟩
                                                            Scene_Tick(scène=scène13)                 ⟨253512⟩
                                                        v336 = 0                                      ⟨253524⟩
                                                        tant que v336 < 4 :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨253530⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨253538⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨253544⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨253550⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨253544⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨253550⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨253558⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨253565⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨253572⟩
                                                            Scene_Tick(scène=scène13)                 ⟨253583⟩
                                                            v336 = v336 + 1                           ⟨253585⟩
                                                        v346 = 0                                      ⟨253608⟩
                                                        v340 = 0                                      ⟨253610⟩
                                                        v334 = 0                                      ⟨253626⟩
                                                        v328 = 0                                      ⟨253628⟩
                                                    sinon :
                                                        Widget_Method_DispatchC_37052(objet1, 0)      ⟨253635⟩
                                                        Widget_Method_Dispatch8_37030(objet1, 127)    ⟨253640⟩
                                                        v10 = 68                                      ⟨253642⟩
                                                        si = scène13.compteur                         ⟨253643⟩
                                                        v8 = si + ((v10·70) / 100)                    ⟨253652⟩
                                                        tant que (scène13.compteur < v8) et (scène13.terminée == 0) :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨253660⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨253668⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨253674⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨253680⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨253674⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨253680⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨253688⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨253695⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨253702⟩
                                                            si si + 2 == scène13.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[16])  ⟨253715⟩
                                                            si si + 2 == scène13.compteur :
                                                                tête_texte_de_lèvres(tête=c51, texte="adowmylv uilhdduestndldatourarstip")  ⟨253725⟩
                                                            si si + 8 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=19)  ⟨253735⟩
                                                            si si + 12 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=-1)  ⟨253745⟩
                                                            si si + 15 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=19)  ⟨253755⟩
                                                            si si + 12 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=-1)  ⟨253765⟩
                                                            si v8 - 1 == scène13.compteur :
                                                                sub_30AD0(objet1, 0)                  ⟨253776⟩
                                                            Scene_Tick(scène=scène13)                 ⟨253794⟩
                                                        v10 = 33                                      ⟨253818⟩
                                                        si = scène13.compteur                         ⟨253819⟩
                                                        v8 = si + ((v10·70) / 100)                    ⟨253828⟩
                                                        tant que (scène13.compteur < v8) et (scène13.terminée == 0) :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨253836⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨253844⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨253850⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨253856⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨253850⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨253856⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨253864⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨253871⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨253878⟩
                                                            si si + 2 == scène13.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[17])  ⟨253892⟩
                                                            si si + 2 == scène13.compteur :
                                                                tête_texte_de_lèvres(tête=c51, texte="ndidolvyucarzn")  ⟨253902⟩
                                                            si si + 6 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=19)  ⟨253912⟩
                                                            si v8 - 1 == scène13.compteur :
                                                                sub_30AD0(objet1, 0)                  ⟨253923⟩
                                                            Scene_Tick(scène=scène13)                 ⟨253941⟩
                                                        v10 = 27                                      ⟨253965⟩
                                                        si = scène13.compteur                         ⟨253966⟩
                                                        v8 = si + ((v10·70) / 100)                    ⟨253975⟩
                                                        tant que (scène13.compteur < v8) et (scène13.terminée == 0) :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨253983⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨253991⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨253997⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨254003⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨253997⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨254003⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨254011⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨254018⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨254025⟩
                                                            si si + 2 == scène13.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[18])  ⟨254039⟩
                                                            si si + 2 == scène13.compteur :
                                                                tête_texte_de_lèvres(tête=c51, texte="nmyway")  ⟨254049⟩
                                                            si si + 10 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=-1)  ⟨254059⟩
                                                            si v8 - 1 == scène13.compteur :
                                                                sub_30AD0(objet1, 0)                  ⟨254070⟩
                                                            Scene_Tick(scène=scène13)                 ⟨254088⟩
                                                        v10 = 56                                      ⟨254112⟩
                                                        si = scène13.compteur                         ⟨254113⟩
                                                        v8 = si + ((v10·70) / 100)                    ⟨254122⟩
                                                        tant que (scène13.compteur < v8) et (scène13.terminée == 0) :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨254130⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨254138⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨254144⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨254150⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨254144⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨254150⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨254158⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨254165⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨254172⟩
                                                            si si + 2 == scène13.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[19])  ⟨254186⟩
                                                            si si + 2 == scène13.compteur :
                                                                tête_texte_de_lèvres(tête=c51, texte="btthzazbznsimsorry")  ⟨254196⟩
                                                            si si + 6 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=25)  ⟨254206⟩
                                                            si v8 - 1 == scène13.compteur :
                                                                sub_30AD0(objet1, 0)                  ⟨254217⟩
                                                            Scene_Tick(scène=scène13)                 ⟨254235⟩
                                                    si v17 != 0 :
                                                        canal_arrête(canal=canal4)                    ⟨254263⟩
                                                    v314 = 0                                          ⟨254282⟩
                                                    v308 = 0                                          ⟨254284⟩
                                                    Scene_Destruct(scène=scène13, drapeaux=0)         ⟨254288⟩
                                                    si byte_4F55C == 0 :

                                                        ──── scène14 ────
                                                        scène14 = Scene_Create(cadence=10, palette=255, surface=&v456)  ⟨254301⟩
                                                        c53 = Layer(ressource=optshps 116, x=0, y=-34)  ⟨254308⟩
                                                        c54 = Layer(ressource=mid15 9, x=3, y=1)      ⟨254316⟩
                                                        c55 = OverlayImageLayer(ressource=mid15 4, x=3, y=1, image=1)  ⟨254325⟩
                                                        palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨254335⟩
                                                        palette_copie(destination=pal1, source=pal3(mid15 15))  ⟨254344⟩
                                                        ajoute c53 à scène14                          ⟨254349⟩
                                                        ajoute c54 à scène14                          ⟨254354⟩
                                                        ajoute c55 à scène14                          ⟨254359⟩
                                                        palette_envoie(palette=pal1, pas=0)           ⟨254371⟩
                                                        di = 0                                        ⟨254373⟩
                                                        v310 = 3                                      ⟨254374⟩
                                                        v312 = 2                                      ⟨254375⟩
                                                        v314 = 2                                      ⟨254376⟩
                                                        si v17 != 0 :
                                                            charge(asoundfx 24)                       ⟨254388⟩
                                                            canal_init(canal=canal4, pilote=word_4CA5D)  ⟨254393⟩
                                                            canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)  ⟨254400⟩
                                                            v316 = word_4EFA4 - 50                    ⟨254404⟩
                                                            v318 = 0                                  ⟨254405⟩
                                                            si canal4.+0 != 0 :
                                                                AIL_start_sequence(pilote=canal4.+0→4, séquence=v3360)  ⟨254411⟩
                                                                sub_50F5(canal4.+0→4, v3360, v316, v318)  ⟨254418⟩
                                                        si v16 != 0 :
                                                            Scene_Tick(scène=scène14)                 ⟨254430⟩
                                                            charge(mid15voc 7)                        ⟨254442⟩
                                                            voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid15voc 7)  ⟨254448⟩
                                                            v330 = 0                                  ⟨254450⟩
                                                            tant que v330 < 4 :
                                                                Scene_Tick(scène=scène14)             ⟨254456⟩
                                                                v330 = v330 + 1                       ⟨254458⟩
                                                            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)  ⟨254466⟩
                                                            v330 = 0                                  ⟨254468⟩
                                                            tant que voix_en_cours(voix=voix1) != 0 :
                                                                si v312 == v314 :
                                                                    v330_avant = v330                 ⟨254476⟩
                                                                    v330 = v330 + 1                   ⟨254476⟩
                                                                    si v330_avant & 1 != 0 :
                                                                        v332 = v310                   ⟨254480⟩
                                                                        CRT_Rand()                    ⟨254481⟩
                                                                        v314 = (CRT_Rand()·v332) / 32768  ⟨254488⟩
                                                                    si v314 < v312 :
                                                                        di = -1                       ⟨254494⟩
                                                                    sinon :
                                                                        si v314 == v312 :
                                                                            di = 0                    ⟨254501⟩
                                                                        sinon :
                                                                            di = 1                    ⟨254505⟩
                                                                déplace(calque=c54, dx=0, dy=di)      ⟨254513⟩
                                                                déplace(calque=c55, dx=0, dy=di)      ⟨254520⟩
                                                                v312 = v312 + di                      ⟨254522⟩
                                                                CRT_Rand()                            ⟨254523⟩
                                                                v334 = (CRT_Rand()·3) / 32768         ⟨254529⟩
                                                                c55.image = v334                      ⟨254532⟩
                                                                Scene_Tick(scène=scène14)             ⟨254542⟩
                                                            c55.image = 0                             ⟨254556⟩
                                                            v330 = 0                                  ⟨254557⟩
                                                            tant que v330 < 4 :
                                                                Scene_Tick(scène=scène14)             ⟨254563⟩
                                                                v330 = v330 + 1                       ⟨254565⟩
                                                            voix_arrête(voix=voix1)                   ⟨254572⟩
                                                            v328 = 0                                  ⟨254589⟩
                                                            v322 = 0                                  ⟨254591⟩
                                                        sinon :
                                                            Widget_Method_DispatchC_37052(objet1, 0)  ⟨254598⟩
                                                            Widget_Method_Dispatch8_37030(objet1, 197)  ⟨254603⟩
                                                            v10 = 73                                  ⟨254605⟩
                                                            si = scène14.compteur                     ⟨254606⟩
                                                            v8 = si + ((v10·70) / 100)                ⟨254615⟩
                                                            tant que (scène14.compteur < v8) et (scène14.terminée == 0) :
                                                                v320 = scène14.compteur               ⟨254620⟩
                                                                si v312 == v314 :
                                                                    si v320 & 1 != 0 :
                                                                        v322 = v310                   ⟨254627⟩
                                                                        CRT_Rand()                    ⟨254628⟩
                                                                        v314 = (CRT_Rand()·v322) / 32768  ⟨254635⟩
                                                                    si v314 < v312 :
                                                                        di = -1                       ⟨254641⟩
                                                                    sinon :
                                                                        si v314 == v312 :
                                                                            di = 0                    ⟨254648⟩
                                                                        sinon :
                                                                            di = 1                    ⟨254652⟩
                                                                déplace(calque=c54, dx=0, dy=di)      ⟨254660⟩
                                                                déplace(calque=c55, dx=0, dy=di)      ⟨254667⟩
                                                                v312 = v312 + di                      ⟨254669⟩
                                                                si si + 4 == v320 :
                                                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[20])  ⟨254682⟩
                                                                si si + 2 < v320 :
                                                                    si si + 26 > v320 :
                                                                        CRT_Rand()                    ⟨254694⟩
                                                                        v324 = (CRT_Rand()·3) / 32768  ⟨254700⟩
                                                                        c55.image = v324              ⟨254703⟩
                                                                si v8 - 1 == v320 :
                                                                    sub_30AD0(objet1, 0)              ⟨254713⟩
                                                                Scene_Tick(scène=scène14)             ⟨254731⟩
                                                        si v17 != 0 :
                                                            canal_arrête(canal=canal4)                ⟨254759⟩
                                                        Scene_Destruct(scène=scène14, drapeaux=0)     ⟨254766⟩
                                                        si byte_4F55C == 0 :

                                                            ──── scène15 ────
                                                            scène15 = Scene_Create(cadence=10, palette=255, surface=&v456)  ⟨254779⟩
                                                            c56 = Layer(ressource=optshps 116, x=0, y=-47)  ⟨254786⟩
                                                            c57 = Layer(ressource=mid15 8, x=0, y=-1)  ⟨254794⟩
                                                            di = c57                                  ⟨254796⟩
                                                            c58 = Layer(ressource=mid15 3, x=0, y=-1)  ⟨254802⟩
                                                            c59 = OverlayImageLayer(ressource=mid15 0, x=0, y=-1, image=1)  ⟨254811⟩
                                                            palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨254821⟩
                                                            palette_copie(destination=pal1, source=pal3(mid15 15))  ⟨254830⟩
                                                            ajoute c56 à scène15                      ⟨254835⟩
                                                            ajoute c57 à scène15                      ⟨254840⟩
                                                            ajoute c58 à scène15                      ⟨254845⟩
                                                            ajoute c59 à scène15                      ⟨254850⟩
                                                            palette_envoie(palette=pal1, pas=0)       ⟨254862⟩
                                                            v310 = 0                                  ⟨254864⟩
                                                            v312 = 3                                  ⟨254865⟩
                                                            v314 = 2                                  ⟨254866⟩
                                                            v316 = 2                                  ⟨254867⟩
                                                            v318 = 0                                  ⟨254868⟩
                                                            si v17 != 0 :
                                                                charge(asoundfx 5)                    ⟨254880⟩
                                                                canal_init(canal=canal5, pilote=word_4CA5D)  ⟨254885⟩
                                                                canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)  ⟨254892⟩
                                                                v320 = word_4EF7E - 50                ⟨254896⟩
                                                                v322 = 0                              ⟨254897⟩
                                                                si canal5.+0 != 0 :
                                                                    AIL_start_sequence(pilote=canal5.+0→4, séquence=v3374)  ⟨254903⟩
                                                                    sub_50F5(canal5.+0→4, v3374, v320, v322)  ⟨254910⟩
                                                            si v16 != 0 :
                                                                Scene_Tick(scène=scène15)             ⟨254922⟩
                                                                v332 = 0                              ⟨254924⟩
                                                                charge(mid15voc 14)                   ⟨254934⟩
                                                                voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid15voc 14)  ⟨254940⟩
                                                                v334 = 0                              ⟨254942⟩
                                                                tant que v334 < 4 :
                                                                    Scene_Tick(scène=scène15)         ⟨254948⟩
                                                                    v334 = v334 + 1                   ⟨254950⟩
                                                                voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)  ⟨254958⟩
                                                                v334 = 0                              ⟨254960⟩
                                                                tant que voix_en_cours(voix=voix1) != 0 :
                                                                    si v314 == v316 :
                                                                        v334_avant = v334             ⟨254968⟩
                                                                        v334 = v334 + 1               ⟨254968⟩
                                                                        si v334_avant & 1 != 0 :
                                                                            v336 = v312               ⟨254972⟩
                                                                            CRT_Rand()                ⟨254973⟩
                                                                            v316 = (CRT_Rand()·v336) / 32768  ⟨254980⟩
                                                                        si v316 < v314 :
                                                                            v310 = -1                 ⟨254986⟩
                                                                        sinon :
                                                                            si v316 == v314 :
                                                                                v310 = 0              ⟨254993⟩
                                                                            sinon :
                                                                                v310 = 1              ⟨254997⟩
                                                                    déplace(calque=c58, dx=0, dy=v310)  ⟨255005⟩
                                                                    déplace(calque=c59, dx=0, dy=v310)  ⟨255012⟩
                                                                    v318_avant = v318                 ⟨255015⟩
                                                                    v318 = v318 + 1                   ⟨255015⟩
                                                                    si v318_avant == 1 :
                                                                        déplace(calque=c57, dx=-1, dy=0)  ⟨255022⟩
                                                                    si v318 == 5 :
                                                                        déplace(calque=c57, dx=0, dy=1)  ⟨255032⟩
                                                                    si v318 == 8 :
                                                                        v318 = 0                      ⟨255038⟩
                                                                    v314 = v314 + v310                ⟨255042⟩
                                                                    CRT_Rand()                        ⟨255043⟩
                                                                    v338 = (CRT_Rand()·3) / 32768     ⟨255049⟩
                                                                    c59.image = v338                  ⟨255052⟩
                                                                    Scene_Tick(scène=scène15)         ⟨255062⟩
                                                                c59.image = 0                         ⟨255076⟩
                                                                v334 = 0                              ⟨255077⟩
                                                                tant que v334 < 4 :
                                                                    Scene_Tick(scène=scène15)         ⟨255083⟩
                                                                    v334 = v334 + 1                   ⟨255085⟩
                                                                voix_arrête(voix=voix1)               ⟨255092⟩
                                                                v332 = 0                              ⟨255109⟩
                                                            sinon :
                                                                Widget_Method_DispatchC_37052(objet1, 0)  ⟨255118⟩
                                                                Widget_Method_Dispatch8_37030(objet1, 196)  ⟨255123⟩
                                                                v10 = 32                              ⟨255125⟩
                                                                si = scène15.compteur                 ⟨255126⟩
                                                                v8 = si + ((v10·70) / 100)            ⟨255135⟩
                                                                tant que (scène15.compteur < v8) et (scène15.terminée == 0) :
                                                                    v324 = scène15.compteur           ⟨255140⟩
                                                                    si v314 == v316 :
                                                                        si v324 & 1 != 0 :
                                                                            CRT_Rand()                ⟨255148⟩
                                                                            v316 = (CRT_Rand()·v312) / 32768  ⟨255155⟩
                                                                        si v316 < v314 :
                                                                            v310 = -1                 ⟨255161⟩
                                                                        sinon :
                                                                            si v316 == v314 :
                                                                                v310 = 0              ⟨255168⟩
                                                                            sinon :
                                                                                v310 = 1              ⟨255172⟩
                                                                    déplace(calque=c58, dx=0, dy=v310)  ⟨255180⟩
                                                                    déplace(calque=c59, dx=0, dy=v310)  ⟨255187⟩
                                                                    v318_avant = v318                 ⟨255190⟩
                                                                    v318 = v318 + 1                   ⟨255190⟩
                                                                    si v318_avant == 1 :
                                                                        déplace(calque=c57, dx=-1, dy=0)  ⟨255197⟩
                                                                    si v318 == 5 :
                                                                        déplace(calque=c57, dx=0, dy=1)  ⟨255207⟩
                                                                    si v318 == 8 :
                                                                        v318 = 0                      ⟨255213⟩
                                                                    v314 = v314 + v310                ⟨255217⟩
                                                                    si si + 5 == v324 :
                                                                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[21])  ⟨255230⟩
                                                                    si si + 2 < v324 :
                                                                        si si + 10 > v324 :
                                                                            CRT_Rand()                ⟨255242⟩
                                                                            v328 = (CRT_Rand()·3) / 32768  ⟨255248⟩
                                                                            c59.image = v328          ⟨255251⟩
                                                                    si v8 - 1 == v324 :
                                                                        sub_30AD0(objet1, 0)          ⟨255261⟩
                                                                    Scene_Tick(scène=scène15)         ⟨255279⟩
                                                                v10 = 47                              ⟨255303⟩
                                                                si = scène15.compteur                 ⟨255304⟩
                                                                v8 = si + ((v10·70) / 100)            ⟨255313⟩
                                                                tant que (scène15.compteur < v8) et (scène15.terminée == 0) :
                                                                    v324 = scène15.compteur           ⟨255318⟩
                                                                    si v314 == v316 :
                                                                        si v324 & 1 != 0 :
                                                                            CRT_Rand()                ⟨255326⟩
                                                                            v316 = (CRT_Rand()·v312) / 32768  ⟨255333⟩
                                                                        si v316 < v314 :
                                                                            v310 = -1                 ⟨255339⟩
                                                                        sinon :
                                                                            si v316 == v314 :
                                                                                v310 = 0              ⟨255346⟩
                                                                            sinon :
                                                                                v310 = 1              ⟨255350⟩
                                                                    déplace(calque=c58, dx=0, dy=v310)  ⟨255358⟩
                                                                    déplace(calque=c59, dx=0, dy=v310)  ⟨255365⟩
                                                                    v318_avant = v318                 ⟨255368⟩
                                                                    v318 = v318 + 1                   ⟨255368⟩
                                                                    si v318_avant == 1 :
                                                                        déplace(calque=c57, dx=1, dy=0)  ⟨255375⟩
                                                                    si v318 == 5 :
                                                                        déplace(calque=c57, dx=0, dy=-1)  ⟨255385⟩
                                                                    si v318 == 8 :
                                                                        v318 = 0                      ⟨255391⟩
                                                                    v314 = v314 + v310                ⟨255395⟩
                                                                    si si + 2 == v324 :
                                                                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[22])  ⟨255408⟩
                                                                    si si + 2 < v324 :
                                                                        si si + 26 > v324 :
                                                                            CRT_Rand()                ⟨255420⟩
                                                                            v328 = (CRT_Rand()·3) / 32768  ⟨255426⟩
                                                                            c59.image = v328          ⟨255429⟩
                                                                    si v8 - 1 == v324 :
                                                                        sub_30AD0(objet1, 0)          ⟨255439⟩
                                                                    Scene_Tick(scène=scène15)         ⟨255457⟩
                                                            si v17 != 0 :
                                                                canal_arrête(canal=canal5)            ⟨255485⟩
                                                            Scene_Destruct(scène=scène15, drapeaux=0)  ⟨255492⟩
                                                            si byte_4F55C == 0 :

                                                                ──── scène16 ────
                                                                scène16 = Scene_Create(cadence=10, palette=255, surface=&v456)  ⟨255505⟩
                                                                c60 = Layer(ressource=optshps 116, x=0, y=-67)  ⟨255512⟩
                                                                v314 = 0                              ⟨255515⟩
                                                                v308 = 0                              ⟨255518⟩
                                                                charge_convdata_type0("air", drapeau=3)  ⟨255523⟩
                                                                c61 = Layer(ressource=midgames 4, x=0, y=0)  ⟨255530⟩
                                                                c62 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)  ⟨255538⟩
                                                                c63 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)  ⟨255547⟩
                                                                charge(midgames 0)                    ⟨255560⟩
                                                                c64 = ToggleLayer(ressource=midgames 0, x=160, y=129, sens=0)  ⟨255568⟩
                                                                palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨255578⟩
                                                                palette_copie(destination=pal1, source=pal7(midgames 6))  ⟨255587⟩
                                                                palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨255596⟩
                                                                palette_envoie(palette=pal1, pas=0)   ⟨255608⟩
                                                                ajoute c60 à scène16                  ⟨255613⟩
                                                                ajoute c61 à scène16                  ⟨255618⟩
                                                                ajoute c62 à scène16                  ⟨255623⟩
                                                                ajoute c63 à scène16                  ⟨255628⟩
                                                                tête_image_de_base(tête=c62, image=14)  ⟨255632⟩
                                                                di = 0                                ⟨255634⟩
                                                                si v17 != 0 :
                                                                    charge(asoundfx 5)                ⟨255646⟩
                                                                    canal_init(canal=canal5, pilote=word_4CA5D)  ⟨255651⟩
                                                                    canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)  ⟨255658⟩
                                                                    v334 = word_4EF7E                 ⟨255661⟩
                                                                    v336 = 0                          ⟨255662⟩
                                                                    si canal5.+0 != 0 :
                                                                        AIL_start_sequence(pilote=canal5.+0→4, séquence=v3374)  ⟨255668⟩
                                                                        sub_50F5(canal5.+0→4, v3374, v334, v336)  ⟨255675⟩
                                                                si v16 != 0 :
                                                                    Scene_Tick(scène=scène16)         ⟨255687⟩
                                                                    v346 = 0                          ⟨255689⟩
                                                                    v340 = 0                          ⟨255692⟩
                                                                    charge(mid15voc 15)               ⟨255699⟩
                                                                    tête_voix(tête=c62, ressource=mid15voc 15, cadence=9)  ⟨255705⟩
                                                                    v348 = 0                          ⟨255707⟩
                                                                    tant que v348 < 3 :
                                                                        Scene_Tick(scène=scène16)     ⟨255713⟩
                                                                        v348 = v348 + 1               ⟨255715⟩
                                                                    tant que tête_parle(tête=c62) != 0 :
                                                                        si di == 0 :
                                                                            CRT_Rand()                ⟨255725⟩
                                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                                di = -1               ⟨255733⟩
                                                                            sinon :
                                                                                si di == -1 :
                                                                                    di = 1            ⟨255739⟩
                                                                                sinon :
                                                                                    si di == 1 :
                                                                                        di = 0        ⟨255745⟩
                                                                        sinon :
                                                                            si di == -1 :
                                                                                di = 1                ⟨255739⟩
                                                                            sinon :
                                                                                si di == 1 :
                                                                                    di = 0            ⟨255745⟩
                                                                        déplace(calque=c61, dx=0, dy=di)  ⟨255753⟩
                                                                        déplace(calque=c62, dx=0, dy=di)  ⟨255760⟩
                                                                        déplace(calque=c63, dx=0, dy=di)  ⟨255767⟩
                                                                        Scene_Tick(scène=scène16)     ⟨255778⟩
                                                                    v348 = 0                          ⟨255790⟩
                                                                    tant que v348 < 4 :
                                                                        si di == 0 :
                                                                            CRT_Rand()                ⟨255796⟩
                                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                                di = -1               ⟨255804⟩
                                                                            sinon :
                                                                                si di == -1 :
                                                                                    di = 1            ⟨255810⟩
                                                                                sinon :
                                                                                    si di == 1 :
                                                                                        di = 0        ⟨255816⟩
                                                                        sinon :
                                                                            si di == -1 :
                                                                                di = 1                ⟨255810⟩
                                                                            sinon :
                                                                                si di == 1 :
                                                                                    di = 0            ⟨255816⟩
                                                                        déplace(calque=c61, dx=0, dy=di)  ⟨255824⟩
                                                                        déplace(calque=c62, dx=0, dy=di)  ⟨255831⟩
                                                                        déplace(calque=c63, dx=0, dy=di)  ⟨255838⟩
                                                                        Scene_Tick(scène=scène16)     ⟨255849⟩
                                                                        v348 = v348 + 1               ⟨255851⟩
                                                                    v346 = 0                          ⟨255874⟩
                                                                    v340 = 0                          ⟨255876⟩
                                                                sinon :
                                                                    Widget_Method_DispatchC_37052(objet1, 0)  ⟨255883⟩
                                                                    Widget_Method_Dispatch8_37030(objet1, 127)  ⟨255888⟩
                                                                    v10 = 44                          ⟨255890⟩
                                                                    si = scène16.compteur             ⟨255891⟩
                                                                    v8 = si + ((v10·70) / 100)        ⟨255900⟩
                                                                    tant que (scène16.compteur < v8) et (scène16.terminée == 0) :
                                                                        v338 = scène16.compteur       ⟨255905⟩
                                                                        si di == 0 :
                                                                            CRT_Rand()                ⟨255908⟩
                                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                                di = -1               ⟨255916⟩
                                                                            sinon :
                                                                                si di == -1 :
                                                                                    di = 1            ⟨255922⟩
                                                                                sinon :
                                                                                    si di == 1 :
                                                                                        di = 0        ⟨255928⟩
                                                                        sinon :
                                                                            si di == -1 :
                                                                                di = 1                ⟨255922⟩
                                                                            sinon :
                                                                                si di == 1 :
                                                                                    di = 0            ⟨255928⟩
                                                                        déplace(calque=c61, dx=0, dy=di)  ⟨255936⟩
                                                                        déplace(calque=c62, dx=0, dy=di)  ⟨255943⟩
                                                                        déplace(calque=c63, dx=0, dy=di)  ⟨255950⟩
                                                                        si si + 2 == v338 :
                                                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[23])  ⟨255964⟩
                                                                        si si + 2 == v338 :
                                                                            tête_texte_de_lèvres(tête=c62, texte="btdevrynnoz")  ⟨255974⟩
                                                                        si v8 - 1 == v338 :
                                                                            sub_30AD0(objet1, 0)      ⟨255985⟩
                                                                        Scene_Tick(scène=scène16)     ⟨256003⟩
                                                                    v10 = 24                          ⟨256027⟩
                                                                    si = scène16.compteur             ⟨256028⟩
                                                                    v8 = si + ((v10·70) / 100)        ⟨256037⟩
                                                                    tant que (scène16.compteur < v8) et (scène16.terminée == 0) :
                                                                        v338 = scène16.compteur       ⟨256042⟩
                                                                        si di == 0 :
                                                                            CRT_Rand()                ⟨256045⟩
                                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                                di = -1               ⟨256053⟩
                                                                            sinon :
                                                                                si di == -1 :
                                                                                    di = 1            ⟨256059⟩
                                                                                sinon :
                                                                                    si di == 1 :
                                                                                        di = 0        ⟨256065⟩
                                                                        sinon :
                                                                            si di == -1 :
                                                                                di = 1                ⟨256059⟩
                                                                            sinon :
                                                                                si di == 1 :
                                                                                    di = 0            ⟨256065⟩
                                                                        déplace(calque=c61, dx=0, dy=di)  ⟨256073⟩
                                                                        déplace(calque=c62, dx=0, dy=di)  ⟨256080⟩
                                                                        déplace(calque=c63, dx=0, dy=di)  ⟨256087⟩
                                                                        si si + 2 == v338 :
                                                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[24])  ⟨256101⟩
                                                                        si si + 2 == v338 :
                                                                            tête_texte_de_lèvres(tête=c62, texte="brakngupizardtodo")  ⟨256111⟩
                                                                        Scene_Tick(scène=scène16)     ⟨256129⟩
                                                                di = -1                               ⟨256153⟩
                                                                déplace(calque=c61, dx=0, dy=-1)      ⟨256159⟩
                                                                déplace(calque=c62, dx=0, dy=-1)      ⟨256166⟩
                                                                déplace(calque=c64, dx=0, dy=-1)      ⟨256173⟩
                                                                scène16.compteur = 0                  ⟨256175⟩
                                                                ajoute c64 à scène16                  ⟨256179⟩
                                                                retire(parent=scène16, calque=c63)    ⟨256184⟩
                                                                c63.détruit(3)                        ⟨256192⟩
                                                                tant que (scène16.compteur < 15) et (scène16.terminée == 0) :
                                                                    si scène16.compteur == 1 :
                                                                        di = 1                        ⟨256202⟩
                                                                        déplace(calque=c61, dx=0, dy=1)  ⟨256208⟩
                                                                        déplace(calque=c62, dx=0, dy=1)  ⟨256215⟩
                                                                        déplace(calque=c64, dx=0, dy=1)  ⟨256222⟩
                                                                    Scene_Tick(scène=scène16)         ⟨256228⟩
                                                                si v17 != 0 :
                                                                    canal_arrête(canal=canal5)        ⟨256252⟩
                                                                v330 = 0                              ⟨256271⟩
                                                                v324 = 0                              ⟨256273⟩
                                                                v314 = 0                              ⟨256289⟩
                                                                v308 = 0                              ⟨256291⟩
                                                                Scene_Destruct(scène=scène16, drapeaux=0)  ⟨256295⟩
                                                                si byte_4F55C == 0 :
                                                                    v312 = 0                          ⟨256302⟩
                                                                    v306 = 0                          ⟨256305⟩
                                                                    charge(mid15 2)                   ⟨256312⟩
                                                                    charge(mid15 12)                  ⟨256324⟩
                                                                    palette_depuis(pal9(mid15 12))    ⟨256331⟩

                                                                    ──── scène17 ────
                                                                    scène17 = Scene_Create(cadence=15, palette=255, surface=&v456)  ⟨256339⟩
                                                                    c65 = Layer(ressource=optshps 116, x=0, y=-24)  ⟨256346⟩
                                                                    c66 = Layer(ressource=mid15 2, x=0, y=-24)  ⟨256354⟩
                                                                    palette_copie(destination=pal1, source=pal9(mid15 12))  ⟨256364⟩
                                                                    palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨256373⟩
                                                                    ajoute c65 à scène17              ⟨256378⟩
                                                                    ajoute c66 à scène17              ⟨256383⟩
                                                                    palette_envoie(palette=pal1, pas=0)  ⟨256395⟩
                                                                    di = 2                            ⟨256397⟩
                                                                    v334 = 1                          ⟨256398⟩
                                                                    v3420 = 436                       ⟨256403⟩
                                                                    v3418 = word_4D392                ⟨256405⟩
                                                                    word_4D392 = &v3420               ⟨256407⟩
                                                                    si v17 != 0 :
                                                                        charge(asoundfx 38)           ⟨256424⟩
                                                                        canal_init(canal=canal6, pilote=word_4CA5D)  ⟨256429⟩
                                                                        canal_enregistre(canal=canal6, ressource=asoundfx 38, x=0)  ⟨256436⟩
                                                                        v346 = word_4EFC0             ⟨256439⟩
                                                                        v348 = 0                      ⟨256440⟩
                                                                        si canal6.+0 != 0 :
                                                                            AIL_start_sequence(pilote=canal6.+0→4, séquence=v3422)  ⟨256446⟩
                                                                            sub_50F5(canal6.+0→4, v3422, v346, v348)  ⟨256453⟩
                                                                    si v16 != 0 :
                                                                        Scene_Tick(scène=scène17)     ⟨256466⟩
                                                                        charge(mid15voc 16)           ⟨256474⟩
                                                                        voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid15voc 16)  ⟨256480⟩
                                                                        voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)  ⟨256485⟩
                                                                    sinon :
                                                                        Widget_Method_DispatchC_37052(objet1, 0)  ⟨256493⟩
                                                                        Widget_Method_Dispatch8_37030(objet1, 248)  ⟨256498⟩
                                                                    tant que (scène17.compteur < 45) et (scène17.terminée == 0) :
                                                                        v360 = scène17.compteur       ⟨256506⟩
                                                                        v362 = di                     ⟨256507⟩
                                                                        c66.image = v362              ⟨256510⟩
                                                                        si v360 == 18 :
                                                                            si v16 == 0 :
                                                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[25])  ⟨256525⟩
                                                                        si v360 == 42 :
                                                                            si v16 == 0 :
                                                                                sub_30AD0(objet1, 0)  ⟨256538⟩
                                                                        si di <= 26 :
                                                                            di = di + v334            ⟨256544⟩
                                                                        sinon :
                                                                            si di == 29 :
                                                                                v334 = -1             ⟨256550⟩
                                                                            si di == 27 :
                                                                                v334 = 1              ⟨256555⟩
                                                                            si v360 & 1 != 0 :
                                                                                di = di + v334        ⟨256560⟩
                                                                        Scene_Tick(scène=scène17)     ⟨256577⟩
                                                                    voix_arrête(voix=voix1)           ⟨256602⟩
                                                                    v352 = 0                          ⟨256621⟩
                                                                    canal_arrête(canal=canal6)        ⟨256624⟩
                                                                    sub_5C1C(&v3420, 2)               ⟨256629⟩
                                                                    v338 = 0                          ⟨256648⟩
                                                                    Scene_Destruct(scène=scène17, drapeaux=0)  ⟨256652⟩
                                                                    v316 = 0                          ⟨256675⟩
                                                                    v312 = 0                          ⟨256691⟩
                                                                    v306 = 0                          ⟨256693⟩
canal_arrête(canal=canal5)                                                                            ⟨256698⟩
sub_5C1C(&v3372, 2)                                                                                   ⟨256703⟩
canal_arrête(canal=canal4)                                                                            ⟨256707⟩
sub_5C1C(&v3358, 2)                                                                                   ⟨256712⟩
v293 = 0                                                                                              ⟨256730⟩
v292 = 0                                                                                              ⟨256731⟩
v283 = 0                                                                                              ⟨256748⟩
v282 = 0                                                                                              ⟨256749⟩
v274 = 0                                                                                              ⟨256774⟩
v269 = 0                                                                                              ⟨256775⟩
v268 = 0                                                                                              ⟨256776⟩
v253 = 0                                                                                              ⟨256797⟩
v252 = 0                                                                                              ⟨256798⟩
v237 = 0                                                                                              ⟨256819⟩
v236 = 0                                                                                              ⟨256820⟩
v221 = 0                                                                                              ⟨256841⟩
v220 = 0                                                                                              ⟨256842⟩
v205 = 0                                                                                              ⟨256863⟩
v204 = 0                                                                                              ⟨256864⟩
v189 = 0                                                                                              ⟨256885⟩
v188 = 0                                                                                              ⟨256886⟩
v173 = 0                                                                                              ⟨256907⟩
v172 = 0                                                                                              ⟨256908⟩
v157 = 0                                                                                              ⟨256929⟩
v156 = 0                                                                                              ⟨256930⟩
v147 = 0                                                                                              ⟨256947⟩
v146 = 0                                                                                              ⟨256948⟩
v137 = 0                                                                                              ⟨256965⟩
v136 = 0                                                                                              ⟨256966⟩
v127 = 0                                                                                              ⟨256983⟩
v126 = 0                                                                                              ⟨256984⟩
v117 = 0                                                                                              ⟨257001⟩
v116 = 0                                                                                              ⟨257002⟩
v107 = 0                                                                                              ⟨257019⟩
v106 = 0                                                                                              ⟨257020⟩
v97 = 0                                                                                               ⟨257037⟩
v96 = 0                                                                                               ⟨257038⟩
v87 = 0                                                                                               ⟨257055⟩
v86 = 0                                                                                               ⟨257056⟩
v77 = 0                                                                                               ⟨257073⟩
v76 = 0                                                                                               ⟨257074⟩
v67 = 0                                                                                               ⟨257091⟩
v66 = 0                                                                                               ⟨257092⟩
v57 = 0                                                                                               ⟨257109⟩
v56 = 0                                                                                               ⟨257110⟩
voix_arrête(voix=voix1)                                                                               ⟨257114⟩
v3274 = 0                                                                                             ⟨257131⟩
v3269 = 0                                                                                             ⟨257132⟩
v3268 = 0                                                                                             ⟨257133⟩
canal_arrête(canal=canal2)                                                                            ⟨257136⟩
sub_5C1C(&v1200, 2)                                                                                   ⟨257141⟩
v39 = 0                                                                                               ⟨257164⟩
v38 = 0                                                                                               ⟨257165⟩
retour                                                                                                ⟨257215⟩
```

## Tableaux du segment de données

