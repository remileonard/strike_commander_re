# Script extrait de `sub_91BB0` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## sub_91BB0

```
bp = sp                                                                                               ⟨262328⟩
byte_4F55C = 0                                                                                        ⟨262333⟩
tableau_textes(tableau=textes1, nombre=10, longueur=200)                                              ⟨262339⟩
v11 = 0                                                                                               ⟨262341⟩
v12 = 0                                                                                               ⟨262342⟩
v13 = 0                                                                                               ⟨262343⟩
si word_4CA5B != 0 :
    v12 = 1                                                                                           ⟨262346⟩
v16 = word_4D36E                                                                                      ⟨262350⟩
v454 = 0                                                                                              ⟨262351⟩
TextFormat_ApplyStyleAttribute_357D1(&v454, v16)                                                      ⟨262356⟩
v468 = 0                                                                                              ⟨262358⟩
TextRenderer_ApplyFormatChange_3584E(&v468, 0)                                                        ⟨262367⟩
sub_3499B(&v20, &v468)                                                                                ⟨262373⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨262379⟩
v30 = 0                                                                                               ⟨262385⟩
sub_435F1(pak mid17)                                                                                  ⟨262407⟩
sub_435F1(pak midgames)                                                                               ⟨262428⟩
sub_435F1(pak optshps)                                                                                ⟨262449⟩
sub_435F1(pak optpals)                                                                                ⟨262470⟩
si v12 != 0 :
    si sub_993C(chemin1) != 0 :
        pak mid17voc.ouvre(chemin1, 1)                                                                ⟨262501⟩
        sub_435F1(pak mid17voc)                                                                       ⟨262505⟩
    sinon :
        v12 = 0                                                                                       ⟨262510⟩
sinon :
    v12 = 0                                                                                           ⟨262510⟩
v40 = 0                                                                                               ⟨262513⟩
v35 = 0                                                                                               ⟨262515⟩
v34 = 0                                                                                               ⟨262516⟩
v42 = byte_4CA58                                                                                      ⟨262518⟩
si v42 - 1 <= 4 :
    si (v42 - 1)·2 == 0 ou ((v42 - 1)·2 != 2) et (((v42 - 1)·2 != 4) et (((v42 - 1)·2 != 6) et ((v42 - 1)·2 != 8))) :
        si sub_993C(chemin1) != 0 :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨262562⟩
            sub_435F1(pak rsoundfx)                                                                   ⟨262566⟩
            flux_iff(flux=flux1)                                                                      ⟨262580⟩
            v3417 = 256                                                                               ⟨262583⟩
            v3421 = 0                                                                                 ⟨262584⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨262592⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨262598⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨262604⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨262608⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨262610⟩
            si = 1                                                                                    ⟨262611⟩
            tant que si <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨262617⟩
                ds:26002[si·2] = iff_lit_mot(flux=flux1)                                              ⟨262621⟩
                si = si + 1                                                                           ⟨262622⟩
            iff_ferme_form(flux=flux1)                                                                ⟨262629⟩
            v13 = 1                                                                                   ⟨262631⟩
            iff_ferme_form(flux=flux1)                                                                ⟨262635⟩
        si sub_993C(chemin1) != 0 :
            v11 = 1                                                                                   ⟨262661⟩
            si v13 == 0 :
                word_4F048 = 90                                                                       ⟨262666⟩
    sinon :
        si sub_993C(chemin1) != 0 :
            si word_4CA5D != 0 :
                pak asoundfx.ouvre(chemin1, 1)                                                        ⟨262703⟩
                sub_435F1(pak asoundfx)                                                               ⟨262707⟩
                flux_iff(flux=flux1)                                                                  ⟨262721⟩
                v3417 = 256                                                                           ⟨262724⟩
                v3421 = 0                                                                             ⟨262725⟩
                flux1.ouvre(chemin1, 1)                                                               ⟨262733⟩
                iff_form(flux=flux1, balise='VOLU', x=0)                                              ⟨262739⟩
                iff_chunk(flux=flux1, balise='ADLB', x=1)                                             ⟨262745⟩
                iff_lit_mot(flux=flux1)                                                               ⟨262749⟩
                word_4F048 = iff_lit_mot(flux=flux1)                                                  ⟨262751⟩
                si = 1                                                                                ⟨262752⟩
                tant que si <= 106 :
                    iff_lit_mot(flux=flux1)                                                           ⟨262758⟩
                    ds:26002[si·2] = iff_lit_mot(flux=flux1)                                          ⟨262762⟩
                    si = si + 1                                                                       ⟨262763⟩
                iff_ferme_form(flux=flux1)                                                            ⟨262770⟩
                v13 = 1                                                                               ⟨262772⟩
                iff_ferme_form(flux=flux1)                                                            ⟨262776⟩
        si sub_993C(chemin1) != 0 :
            v11 = 1                                                                                   ⟨262819⟩
            si v13 == 0 :
                word_4F048 = 255                                                                      ⟨262824⟩
v48 = word_4B556                                                                                      ⟨262831⟩
v46 = word_4B558                                                                                      ⟨262833⟩
v44 = byte_4B55A                                                                                      ⟨262835⟩
si v13 != 0 :
    v3354 = word_4D392                                                                                ⟨262843⟩
    word_4D392 = &v3356                                                                               ⟨262845⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨262854⟩
    si = 0                                                                                            ⟨262856⟩
    tant que si < 5 :
        charge(asoundfx v48[si])                                                                      ⟨262872⟩
        canal_enregistre(canal=canal1, ressource=asoundfx v48[si], x=0)                               ⟨262879⟩
        canal_arrête(canal=canal1)                                                                    ⟨262883⟩
        v212 = 0                                                                                      ⟨262902⟩
        si = si + 1                                                                                   ⟨262903⟩
    canal_arrête(canal=canal1)                                                                        ⟨262913⟩
    sub_5C1C(&v3356, 2)                                                                               ⟨262918⟩
v1198 = 436                                                                                           ⟨262922⟩
v1196 = word_4D392                                                                                    ⟨262924⟩
word_4D392 = &v1198                                                                                   ⟨262926⟩
v1198 = 444                                                                                           ⟨262927⟩
v1202 = 0                                                                                             ⟨262930⟩
si v11 != 0 :
    sub_435F1(pak mmusic)                                                                             ⟨262946⟩
    si v12 != 0 :
        v209 = 14                                                                                     ⟨262950⟩
    sinon :
        v209 = 13                                                                                     ⟨262954⟩
    charge(mmusic v209)                                                                               ⟨262965⟩
    canal_init(canal=canal2, pilote=word_4CA59)                                                       ⟨262970⟩
    canal_enregistre(canal=canal2, ressource=mmusic v209, x=0)                                        ⟨262977⟩
v1211 = booléen                                                                                       ⟨262994⟩
v1207 = booléen                                                                                       ⟨262995⟩
si v12 != 0 :
    voix_pilote(voix=voix1, pilote=word_4CA5B)                                                        ⟨263001⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨263018⟩
    v3417 = 256                                                                                       ⟨263021⟩
    v3421 = 0                                                                                         ⟨263022⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨263030⟩
    iff_form(flux=flux1, balise='MG17', x=0)                                                          ⟨263036⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨263042⟩
    si = 0                                                                                            ⟨263044⟩
    tant que si < 10 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨263052⟩
        v210 = v3400                                                                                  ⟨263055⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·si), taille=v210)                    ⟨263066⟩
        v3413 = v3396                                                                                 ⟨263069⟩
        si = si + 1                                                                                   ⟨263070⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨263077⟩
    si CRT_Strlen(arg_10) != 0 :
        CRT_Strcat(textes1[1], arg_10)                                                                ⟨263088⟩
        CRT_Strcat(textes1[1], textes1[3])                                                            ⟨263099⟩
    sinon :
        si CRT_Strlen(arg_8) != 0 :
            CRT_Strcat(textes1[1], arg_8)                                                             ⟨263113⟩
            CRT_Strcat(textes1[1], textes1[3])                                                        ⟨263124⟩
        sinon :
            si CRT_Strlen(arg_6) != 0 :
                CRT_Strcat(textes1[1], arg_6)                                                         ⟨263138⟩
                CRT_Strcat(textes1[1], textes1[3])                                                    ⟨263149⟩
            sinon :
                CRT_Strcat(textes1[1], textes1[2])                                                    ⟨263162⟩
                CRT_Strcat(textes1[1], textes1[3])                                                    ⟨263173⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[4], arg_6)                                                                 ⟨263188⟩
        CRT_Strcat(textes1[4], 11131)                                                                 ⟨263196⟩
    sinon :
        si CRT_Strlen(arg_8) != 0 :
            CRT_Strcat(textes1[4], arg_8)                                                             ⟨263212⟩
            CRT_Strcat(textes1[4], 11131)                                                             ⟨263220⟩
        sinon :
            si CRT_Strlen(arg_10) != 0 :
                CRT_Strcat(textes1[4], arg_10)                                                        ⟨263236⟩
                CRT_Strcat(textes1[4], 11131)                                                         ⟨263244⟩
            sinon :
                CRT_Strcat(textes1[4], textes1[5])                                                    ⟨263260⟩
                CRT_Strcat(textes1[4], 11131)                                                         ⟨263268⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨263275⟩
charge(optpals 21)                                                                                    ⟨263294⟩
palette_depuis(pal2(optpals 21))                                                                      ⟨263301⟩
charge(midgames 6)                                                                                    ⟨263313⟩
palette_depuis(pal3(midgames 6))                                                                      ⟨263320⟩
charge_convdata_type2("normal")                                                                       ⟨263330⟩
palette_depuis(pal4(convdata type 2 "normal"))                                                        ⟨263337⟩
v106 = 0                                                                                              ⟨263339⟩
v102 = 2                                                                                              ⟨263340⟩
v101 = 0                                                                                              ⟨263341⟩
v100 = 0                                                                                              ⟨263342⟩
TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                       ⟨263356⟩
v108 = ?                                                                                              ⟨263358⟩
v110 = TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                ⟨263359⟩
v106 = v110                                                                                           ⟨263361⟩
v102 = 2                                                                                              ⟨263362⟩
v101 = 1                                                                                              ⟨263363⟩
v100 = 0                                                                                              ⟨263364⟩
GlyphObject_ConstructWithBuffer_36D56(&v3312, &v106)                                                  ⟨263369⟩
sub_30A1D(&v3346, word_4D36E, &v3312)                                                                 ⟨263381⟩
Widget_Method_DispatchC_37052(&v3346, 0)                                                              ⟨263386⟩
Widget_Method_Dispatch8_37030(&v3346, 200)                                                            ⟨263391⟩
charge(mid17 3)                                                                                       ⟨263403⟩
charge(midgames 50)                                                                                   ⟨263415⟩
charge(mid17 4)                                                                                       ⟨263427⟩
charge(midgames 9)                                                                                    ⟨263439⟩
palette_depuis(pal5(midgames 9))                                                                      ⟨263446⟩
charge(midgames 10)                                                                                   ⟨263458⟩
palette_depuis(pal6(midgames 10))                                                                     ⟨263465⟩
charge(midgames 11)                                                                                   ⟨263477⟩
palette_depuis(pal7(midgames 11))                                                                     ⟨263484⟩
charge_convdata_type2("normal")                                                                       ⟨263494⟩
palette_depuis(pal8(convdata type 2 "normal"))                                                        ⟨263501⟩
si byte_4F55C != 0 :
    v193 = 0                                                                                          ⟨263528⟩
    v192 = 0                                                                                          ⟨263529⟩
    v177 = 0                                                                                          ⟨263550⟩
    v176 = 0                                                                                          ⟨263551⟩
    v161 = 0                                                                                          ⟨263572⟩
    v160 = 0                                                                                          ⟨263573⟩
    v145 = 0                                                                                          ⟨263594⟩
    v144 = 0                                                                                          ⟨263595⟩
    v135 = 0                                                                                          ⟨263612⟩
    v134 = 0                                                                                          ⟨263613⟩
    v125 = 0                                                                                          ⟨263630⟩
    v124 = 0                                                                                          ⟨263631⟩
    v115 = 0                                                                                          ⟨263648⟩
    v114 = 0                                                                                          ⟨263649⟩
    v106 = 0                                                                                          ⟨263674⟩
    v101 = 0                                                                                          ⟨263675⟩
    v100 = 0                                                                                          ⟨263676⟩
    v85 = 0                                                                                           ⟨263697⟩
    v84 = 0                                                                                           ⟨263698⟩
    v69 = 0                                                                                           ⟨263719⟩
    v68 = 0                                                                                           ⟨263720⟩
    v53 = 0                                                                                           ⟨263741⟩
    v52 = 0                                                                                           ⟨263742⟩
    voix_arrête(voix=voix1)                                                                           ⟨263746⟩
    v3272 = 0                                                                                         ⟨263763⟩
    v3267 = 0                                                                                         ⟨263764⟩
    v3266 = 0                                                                                         ⟨263765⟩
    canal_arrête(canal=canal2)                                                                        ⟨263768⟩
    sub_5C1C(&v1198, 2)                                                                               ⟨263773⟩
    v35 = 0                                                                                           ⟨263796⟩
    v34 = 0                                                                                           ⟨263797⟩
    retour                                                                                            ⟨263847⟩
si v11 != 0 :
    v206 = word_4F048                                                                                 ⟨263853⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v1200)                                        ⟨263860⟩
        sub_50F5(canal2.+0→4, v1200, v206, 0)                                                         ⟨263867⟩
v3356 = 436                                                                                           ⟨263877⟩
v3354 = word_4D392                                                                                    ⟨263879⟩
word_4D392 = &v3356                                                                                   ⟨263881⟩
v3356 = 444                                                                                           ⟨263882⟩
v3352 = 0                                                                                             ⟨263883⟩
v3348 = 0                                                                                             ⟨263884⟩
v3358 = -1                                                                                            ⟨263886⟩
si v13 != 0 :
    charge(asoundfx 22)                                                                               ⟨263895⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨263900⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 22, x=0)                                        ⟨263907⟩
charge(midgames 12)                                                                                   ⟨263921⟩
charge(midgames 13)                                                                                   ⟨263933⟩
charge(midgames 14)                                                                                   ⟨263945⟩
charge(midgames 15)                                                                                   ⟨263957⟩
charge(midgames 16)                                                                                   ⟨263969⟩
charge(midgames 17)                                                                                   ⟨263981⟩

──── scène1 ────
scène1 = Scene_Create(cadence=9, palette=255, surface=&v454)                                          ⟨263989⟩
c1 = Layer(ressource=midgames 12, x=0, y=0)                                                           ⟨263996⟩
c2 = Layer(ressource=midgames 13, x=0, y=0)                                                           ⟨264004⟩
si = c2                                                                                               ⟨264006⟩
c3 = Layer(ressource=midgames 14, x=0, y=-23)                                                         ⟨264012⟩
c4 = Layer(ressource=midgames 15, x=0, y=-23)                                                         ⟨264020⟩
c5 = Layer(ressource=midgames 16, x=0, y=-23)                                                         ⟨264028⟩
c6 = Layer(ressource=midgames 17, x=0, y=-23)                                                         ⟨264036⟩
ajoute c1 à scène1                                                                                    ⟨264042⟩
ajoute c2 à scène1                                                                                    ⟨264047⟩
ajoute c3 à scène1                                                                                    ⟨264052⟩
ajoute c4 à scène1                                                                                    ⟨264057⟩
palette_copie(destination=pal1, source=pal6(midgames 10))                                             ⟨264070⟩
palette_copie(destination=pal1, source=pal5(midgames 9))                                              ⟨264079⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨264087⟩
c2.image = 0                                                                                          ⟨264089⟩
tant que (scène1.compteur < 16) et (scène1.terminée == 0) :
    v292 = scène1.compteur                                                                            ⟨264094⟩
    si v292 == 6 :
        c2.image = 1                                                                                  ⟨264097⟩
        si v13 != 0 :
            v294 = word_4EFA0                                                                         ⟨264101⟩
            v296 = 0                                                                                  ⟨264102⟩
            si canal1.+0 != 0 :
                AIL_start_sequence(pilote=canal1.+0→4, séquence=v3358)                                ⟨264108⟩
                sub_50F5(canal1.+0→4, v3358, v294, v296)                                              ⟨264115⟩
    si v292 == 8 :
        c2.image = 0                                                                                  ⟨264122⟩
        si v13 != 0 :
            si canal1.+0 != 0 :
                AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3358)                                 ⟨264130⟩
    si v292 == 10 :
        c2.image = 1                                                                                  ⟨264137⟩
        si v13 != 0 :
            v298 = word_4EFA0                                                                         ⟨264141⟩
            v300 = 0                                                                                  ⟨264142⟩
            si canal1.+0 != 0 :
                AIL_start_sequence(pilote=canal1.+0→4, séquence=v3358)                                ⟨264148⟩
                sub_50F5(canal1.+0→4, v3358, v298, v300)                                              ⟨264155⟩
    si v292 == 11 :
        c2.image = 0                                                                                  ⟨264162⟩
        si v13 != 0 :
            si canal1.+0 != 0 :
                AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3358)                                 ⟨264170⟩
    si v292 == 13 :
        c2.image = 1                                                                                  ⟨264177⟩
        si v13 != 0 :
            v302 = word_4EFA0                                                                         ⟨264181⟩
            v304 = 0                                                                                  ⟨264182⟩
            si canal1.+0 != 0 :
                AIL_start_sequence(pilote=canal1.+0→4, séquence=v3358)                                ⟨264188⟩
                sub_50F5(canal1.+0→4, v3358, v302, v304)                                              ⟨264195⟩
    si v292 == 15 :
        c2.image = 0                                                                                  ⟨264202⟩
        si v13 != 0 :
            si canal1.+0 != 0 :
                AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3358)                                 ⟨264210⟩
    Scene_Tick(scène=scène1)                                                                          ⟨264217⟩
scène1.compteur = 0                                                                                   ⟨264240⟩
si v12 != 0 :
    Scene_Tick(scène=scène1)                                                                          ⟨264248⟩
    charge(mid17voc 2)                                                                                ⟨264260⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid17voc 2)                                 ⟨264266⟩
    v302 = 0                                                                                          ⟨264268⟩
    tant que v302 < 4 :
        CRT_Rand()                                                                                    ⟨264272⟩
        v304 = (CRT_Rand()·2) / 32768                                                                 ⟨264278⟩
        c2.image = v304                                                                               ⟨264280⟩
        Scene_Tick(scène=scène1)                                                                      ⟨264283⟩
        v302 = v302 + 1                                                                               ⟨264285⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨264293⟩
    v302 = 0                                                                                          ⟨264295⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        CRT_Rand()                                                                                    ⟨264299⟩
        v306 = (CRT_Rand()·2) / 32768                                                                 ⟨264305⟩
        c2.image = v306                                                                               ⟨264307⟩
        si v302 == 2 :
            si v13 != 0 :
                v308 = word_4EFA0                                                                     ⟨264313⟩
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3358)                            ⟨264320⟩
                    sub_50F5(canal1.+0→4, v3358, v308, 0)                                             ⟨264327⟩
        si v302 == 19 :
            retire(parent=scène1, calque=c3)                                                          ⟨264337⟩
            retire(parent=scène1, calque=c4)                                                          ⟨264342⟩
            ajoute c5 à scène1                                                                        ⟨264347⟩
            ajoute c6 à scène1                                                                        ⟨264352⟩
        v302_avant = v302                                                                             ⟨264357⟩
        v302 = v302 + 1                                                                               ⟨264357⟩
        si v302_avant == 10 :
            c5.image = 1                                                                              ⟨264361⟩
            c6.image = 1                                                                              ⟨264363⟩
        Scene_Tick(scène=scène1)                                                                      ⟨264375⟩
    si v13 != 0 :
        si canal1.+0 != 0 :
            AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3358)                                     ⟨264395⟩
    c2.image = 0                                                                                      ⟨264400⟩
    v302 = 0                                                                                          ⟨264401⟩
    tant que v302 < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨264407⟩
        v302 = v302 + 1                                                                               ⟨264409⟩
    charge(mid17voc 0)                                                                                ⟨264424⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid17voc 0)                                 ⟨264430⟩
    v302 = 0                                                                                          ⟨264432⟩
    tant que v302 < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨264438⟩
        v302 = v302 + 1                                                                               ⟨264440⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨264448⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        CRT_Rand()                                                                                    ⟨264453⟩
        v322 = ((CRT_Rand()·2) / 32768) + 1                                                           ⟨264460⟩
        c6.image = v322                                                                               ⟨264463⟩
        Scene_Tick(scène=scène1)                                                                      ⟨264473⟩
    v302 = 0                                                                                          ⟨264485⟩
    tant que v302 < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨264491⟩
        v302 = v302 + 1                                                                               ⟨264493⟩
    voix_arrête(voix=voix1)                                                                           ⟨264500⟩
    v314 = 0                                                                                          ⟨264519⟩
    v294 = 0                                                                                          ⟨264537⟩
sinon :
    v3326→0.méthode8(35)                                                                              ⟨264545⟩
    v6 = 62                                                                                           ⟨264547⟩
    v4 = scène1.compteur                                                                              ⟨264549⟩
    tant que (scène1.compteur < v4 + ((v6·70) / 100)) et (scène1.terminée == 0) :
        v292 = scène1.compteur                                                                        ⟨264563⟩
        si v4 + 10 == v292 :
            si v13 != 0 :
                v294 = word_4EFA0                                                                     ⟨264571⟩
                v296 = 0                                                                              ⟨264572⟩
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3358)                            ⟨264578⟩
                    sub_50F5(canal1.+0→4, v3358, v294, v296)                                          ⟨264585⟩
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[0])                             ⟨264593⟩
            c2.image = 1                                                                              ⟨264595⟩
        si v4 + 14 == v292 :
            retire(parent=scène1, calque=c3)                                                          ⟨264605⟩
            retire(parent=scène1, calque=c4)                                                          ⟨264610⟩
            ajoute c5 à scène1                                                                        ⟨264615⟩
            ajoute c6 à scène1                                                                        ⟨264620⟩
        si v4 + 15 == v292 :
            c5.image = 1                                                                              ⟨264629⟩
            c6.image = 1                                                                              ⟨264631⟩
        si (v4 + ((v6·70) / 100)) - 3 < v292 :
            c2.image = 0                                                                              ⟨264638⟩
        si (v4 + ((v6·70) / 100)) - 1 == v292 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3358)                             ⟨264652⟩
        si (v4 + ((v6·70) / 100)) - 1 == v292 :
            sub_30AD0(objet1, 0)                                                                      ⟨264664⟩
        Scene_Tick(scène=scène1)                                                                      ⟨264682⟩
    c3.détruit(3)                                                                                     ⟨264711⟩
    c4.détruit(3)                                                                                     ⟨264722⟩
    c2.image = 1                                                                                      ⟨264727⟩
    v6_avant = v4 + ((v6·70) / 100)                                                                   ⟨264728⟩
    v6 = 66                                                                                           ⟨264728⟩
    v4 = scène1.compteur                                                                              ⟨264730⟩
    tant que (scène1.compteur < v4 + ((v6·70) / 100)) et (scène1.terminée == 0) :
        v292 = scène1.compteur                                                                        ⟨264744⟩
        si v4 + 1 == v292 :
            si v13 != 0 :
                v294 = word_4EFA0                                                                     ⟨264752⟩
                v296 = 0                                                                              ⟨264753⟩
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3358)                            ⟨264759⟩
                    sub_50F5(canal1.+0→4, v3358, v294, v296)                                          ⟨264766⟩
        si v4 + 2 == v292 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[1])                             ⟨264780⟩
        si (v4 + ((v6·70) / 100)) - 3 < v292 :
            c2.image = 0                                                                              ⟨264788⟩
        si (v4 + ((v6·70) / 100)) - 2 == v292 :
            sub_30AD0(objet1, 0)                                                                      ⟨264798⟩
        si (v4 + ((v6·70) / 100)) - 1 == v292 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3358)                             ⟨264813⟩
        Scene_Tick(scène=scène1)                                                                      ⟨264832⟩
    v3326→0.méthode8(15)                                                                              ⟨264859⟩
    v6_avant = v4 + ((v6·70) / 100)                                                                   ⟨264861⟩
    v6 = 35                                                                                           ⟨264861⟩
    v4 = scène1.compteur                                                                              ⟨264863⟩
    tant que (scène1.compteur < v4 + ((v6·70) / 100)) et (scène1.terminée == 0) :
        v292 = scène1.compteur                                                                        ⟨264877⟩
        si v4 + 6 < v292 :
            CRT_Rand()                                                                                ⟨264882⟩
            v294 = ((CRT_Rand()·2) / 32768) + 1                                                       ⟨264889⟩
            c6.image = v294                                                                           ⟨264892⟩
        si v4 + 6 == v292 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[4])                             ⟨264906⟩
        si (v4 + ((v6·70) / 100)) - 1 == v292 :
            sub_30AD0(objet1, 0)                                                                      ⟨264917⟩
        si (v4 + ((v6·70) / 100)) - 6 < v292 :
            c6.image = 1                                                                              ⟨264926⟩
        Scene_Tick(scène=scène1)                                                                      ⟨264943⟩
    v6_avant = v4 + ((v6·70) / 100)                                                                   ⟨264966⟩
    v6 = 38                                                                                           ⟨264966⟩
    v4 = scène1.compteur                                                                              ⟨264968⟩
    tant que (scène1.compteur < v4 + ((v6·70) / 100)) et (scène1.terminée == 0) :
        v292 = scène1.compteur                                                                        ⟨264982⟩
        si v4 + 6 < v292 :
            CRT_Rand()                                                                                ⟨264987⟩
            v294 = ((CRT_Rand()·2) / 32768) + 1                                                       ⟨264994⟩
            c6.image = v294                                                                           ⟨264997⟩
        si v4 + 6 == v292 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[6])                             ⟨265012⟩
        si (v4 + ((v6·70) / 100)) - 6 < v292 :
            c6.image = 1                                                                              ⟨265021⟩
        si (v4 + ((v6·70) / 100)) - 2 == v292 :
            sub_30AD0(objet1, 0)                                                                      ⟨265031⟩
        Scene_Tick(scène=scène1)                                                                      ⟨265049⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨265075⟩
v274 = 0                                                                                              ⟨265094⟩
v264 = 0                                                                                              ⟨265112⟩
v254 = 0                                                                                              ⟨265130⟩
v250 = 0                                                                                              ⟨265146⟩
v244 = 0                                                                                              ⟨265148⟩
v234 = 0                                                                                              ⟨265166⟩
v230 = 0                                                                                              ⟨265182⟩
v224 = 0                                                                                              ⟨265184⟩
canal_arrête(canal=canal1)                                                                            ⟨265187⟩
sub_5C1C(&v3356, 2)                                                                                   ⟨265192⟩
v214 = 0                                                                                              ⟨265211⟩
si byte_4F55C != 0 :
    v193 = 0                                                                                          ⟨265237⟩
    v192 = 0                                                                                          ⟨265238⟩
    v177 = 0                                                                                          ⟨265259⟩
    v176 = 0                                                                                          ⟨265260⟩
    v161 = 0                                                                                          ⟨265281⟩
    v160 = 0                                                                                          ⟨265282⟩
    v145 = 0                                                                                          ⟨265303⟩
    v144 = 0                                                                                          ⟨265304⟩
    v135 = 0                                                                                          ⟨265321⟩
    v134 = 0                                                                                          ⟨265322⟩
    v125 = 0                                                                                          ⟨265339⟩
    v124 = 0                                                                                          ⟨265340⟩
    v115 = 0                                                                                          ⟨265357⟩
    v114 = 0                                                                                          ⟨265358⟩
    v106 = 0                                                                                          ⟨265383⟩
    v101 = 0                                                                                          ⟨265384⟩
    v100 = 0                                                                                          ⟨265385⟩
    v85 = 0                                                                                           ⟨265406⟩
    v84 = 0                                                                                           ⟨265407⟩
    v69 = 0                                                                                           ⟨265428⟩
    v68 = 0                                                                                           ⟨265429⟩
    v53 = 0                                                                                           ⟨265450⟩
    v52 = 0                                                                                           ⟨265451⟩
    voix_arrête(voix=voix1)                                                                           ⟨265455⟩
    v3272 = 0                                                                                         ⟨265472⟩
    v3267 = 0                                                                                         ⟨265473⟩
    v3266 = 0                                                                                         ⟨265474⟩
    canal_arrête(canal=canal2)                                                                        ⟨265477⟩
    sub_5C1C(&v1198, 2)                                                                               ⟨265482⟩
    v35 = 0                                                                                           ⟨265505⟩
    v34 = 0                                                                                           ⟨265506⟩
    retour                                                                                            ⟨265556⟩
v3356 = 436                                                                                           ⟨265563⟩
v3354 = word_4D392                                                                                    ⟨265565⟩
word_4D392 = &v3356                                                                                   ⟨265567⟩
v3356 = 444                                                                                           ⟨265568⟩
v3352 = 0                                                                                             ⟨265569⟩
v3348 = 0                                                                                             ⟨265570⟩
v3358 = -1                                                                                            ⟨265572⟩
si v13 != 0 :
    charge(asoundfx 22)                                                                               ⟨265581⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨265586⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 22, x=0)                                        ⟨265593⟩
charge(midgames 18)                                                                                   ⟨265607⟩

──── scène2 ────
scène2 = Scene_Create(cadence=20, palette=255, surface=&v454)                                         ⟨265615⟩
c7 = OverlayImageLayer(ressource=midgames 18, x=0, y=0, image=0)                                      ⟨265623⟩
si = c7                                                                                               ⟨265625⟩
ajoute c7 à scène2                                                                                    ⟨265629⟩
palette_copie(destination=pal1, source=pal7(midgames 11))                                             ⟨265642⟩
palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))                                ⟨265651⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨265659⟩
v3326→0.méthode8(224)                                                                                 ⟨265665⟩
c7.image = 0                                                                                          ⟨265667⟩
v230 = 0                                                                                              ⟨265668⟩
CRT_Time_F92(0)                                                                                       ⟨265670⟩
CRT_Srand_7E5(CRT_Time_F92(0))                                                                        ⟨265673⟩
v232 = 4                                                                                              ⟨265675⟩
si v12 != 0 :
    Scene_Tick(scène=scène2)                                                                          ⟨265683⟩
    charge(mid17voc 3)                                                                                ⟨265695⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid17voc 3)                                 ⟨265701⟩
    v244 = 0                                                                                          ⟨265703⟩
    tant que v244 < 4 :
        CRT_Rand()                                                                                    ⟨265707⟩
        v246 = ((CRT_Rand()·6) / 32768) + 3                                                           ⟨265714⟩
        c7.image = v246                                                                               ⟨265716⟩
        Scene_Tick(scène=scène2)                                                                      ⟨265719⟩
        v244 = v244 + 1                                                                               ⟨265721⟩
    si v13 != 0 :
        v248 = word_4EF94                                                                             ⟨265729⟩
        v250 = 0                                                                                      ⟨265730⟩
        si canal1.+0 != 0 :
            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3358)                                    ⟨265736⟩
            sub_50F5(canal1.+0→4, v3358, v248, v250)                                                  ⟨265743⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨265751⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        CRT_Rand()                                                                                    ⟨265756⟩
        v252 = ((CRT_Rand()·6) / 32768) + 3                                                           ⟨265763⟩
        c7.image = v252                                                                               ⟨265765⟩
        Scene_Tick(scène=scène2)                                                                      ⟨265775⟩
    si v13 != 0 :
        si canal1.+0 != 0 :
            AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3358)                                     ⟨265794⟩
    v244 = 0                                                                                          ⟨265799⟩
    tant que v244 < 5 :
        si v232 < 1 :
            v232 = 1                                                                                  ⟨265805⟩
        v254 = v232                                                                                   ⟨265809⟩
        v232_avant = v232                                                                             ⟨265810⟩
        v232 = v232 - 1                                                                               ⟨265810⟩
        c7.image = v254                                                                               ⟨265812⟩
        Scene_Tick(scène=scène2)                                                                      ⟨265815⟩
        v244 = v244 + 1                                                                               ⟨265817⟩
    voix_arrête(voix=voix1)                                                                           ⟨265824⟩
    v236 = 0                                                                                          ⟨265843⟩
sinon :
    v6 = 70                                                                                           ⟨265847⟩
    v4 = scène2.compteur                                                                              ⟨265849⟩
    tant que (scène2.compteur < v4 + ((v6·70) / 100)) et (scène2.terminée == 0) :
        v234 = scène2.compteur                                                                        ⟨265863⟩
        si (v4 + ((v6·70) / 100)) - 10 > v234 :
            CRT_Rand()                                                                                ⟨265868⟩
            v230 = ((CRT_Rand()·6) / 32768) + 3                                                       ⟨265875⟩
            v236 = v230                                                                               ⟨265877⟩
            c7.image = v236                                                                           ⟨265879⟩
        sinon :
            v230 = v230 - 1                                                                           ⟨265883⟩
            si v230 < 1 :
                v230_avant = v230                                                                     ⟨265887⟩
                v230 = 1                                                                              ⟨265887⟩
            v238 = v230                                                                               ⟨265891⟩
            c7.image = v238                                                                           ⟨265893⟩
        si v4 + 1 == v234 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3358)                            ⟨265910⟩
                    sub_50F5(canal1.+0→4, v3358, word_4EFA0, mid17voc 3.+0)                           ⟨265917⟩
        si v4 + 2 == v234 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[7])                             ⟨265934⟩
        si (v4 + ((v6·70) / 100)) - 2 == v234 :
            sub_30AD0(objet1, 0)                                                                      ⟨265945⟩
        si (v4 + ((v6·70) / 100)) - 1 == v234 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3358)                             ⟨265960⟩
        Scene_Tick(scène=scène2)                                                                      ⟨265979⟩
    v6_avant = v4 + ((v6·70) / 100)                                                                   ⟨266002⟩
    v6 = 82                                                                                           ⟨266002⟩
    v4 = scène2.compteur                                                                              ⟨266004⟩
    tant que (scène2.compteur < v4 + ((v6·70) / 100)) et (scène2.terminée == 0) :
        v234 = scène2.compteur                                                                        ⟨266018⟩
        si (v4 + ((v6·70) / 100)) - 10 > v234 :
            CRT_Rand()                                                                                ⟨266023⟩
            v230 = ((CRT_Rand()·6) / 32768) + 3                                                       ⟨266030⟩
            v236 = v230                                                                               ⟨266032⟩
            c7.image = v236                                                                           ⟨266034⟩
        sinon :
            v230 = v230 - 1                                                                           ⟨266038⟩
            si v230 < 1 :
                v230_avant = v230                                                                     ⟨266042⟩
                v230 = 1                                                                              ⟨266042⟩
            v238 = v230                                                                               ⟨266046⟩
            c7.image = v238                                                                           ⟨266048⟩
        si v4 + 1 == v234 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3358)                            ⟨266065⟩
                    sub_50F5(canal1.+0→4, v3358, word_4EFA0, mid17voc 3.+0)                           ⟨266072⟩
        si v4 + 2 == v234 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[8])                             ⟨266088⟩
        si (v4 + ((v6·70) / 100)) - 2 == v234 :
            sub_30AD0(objet1, 0)                                                                      ⟨266099⟩
        si (v4 + ((v6·70) / 100)) - 1 == v234 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3358)                             ⟨266114⟩
        Scene_Tick(scène=scène2)                                                                      ⟨266133⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=1, premier=0, nombre=256)                           ⟨266163⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨266168⟩
v222 = 0                                                                                              ⟨266187⟩
canal_arrête(canal=canal1)                                                                            ⟨266190⟩
sub_5C1C(&v3356, 2)                                                                                   ⟨266195⟩
v212 = 0                                                                                              ⟨266214⟩
si byte_4F55C != 0 :
    v193 = 0                                                                                          ⟨266240⟩
    v192 = 0                                                                                          ⟨266241⟩
    v177 = 0                                                                                          ⟨266262⟩
    v176 = 0                                                                                          ⟨266263⟩
    v161 = 0                                                                                          ⟨266284⟩
    v160 = 0                                                                                          ⟨266285⟩
    v145 = 0                                                                                          ⟨266306⟩
    v144 = 0                                                                                          ⟨266307⟩
    v135 = 0                                                                                          ⟨266324⟩
    v134 = 0                                                                                          ⟨266325⟩
    v125 = 0                                                                                          ⟨266342⟩
    v124 = 0                                                                                          ⟨266343⟩
    v115 = 0                                                                                          ⟨266360⟩
    v114 = 0                                                                                          ⟨266361⟩
    v106 = 0                                                                                          ⟨266386⟩
    v101 = 0                                                                                          ⟨266387⟩
    v100 = 0                                                                                          ⟨266388⟩
    v85 = 0                                                                                           ⟨266409⟩
    v84 = 0                                                                                           ⟨266410⟩
    v69 = 0                                                                                           ⟨266431⟩
    v68 = 0                                                                                           ⟨266432⟩
    v53 = 0                                                                                           ⟨266453⟩
    v52 = 0                                                                                           ⟨266454⟩
    voix_arrête(voix=voix1)                                                                           ⟨266458⟩
    v3272 = 0                                                                                         ⟨266475⟩
    v3267 = 0                                                                                         ⟨266476⟩
    v3266 = 0                                                                                         ⟨266477⟩
    canal_arrête(canal=canal2)                                                                        ⟨266480⟩
    sub_5C1C(&v1198, 2)                                                                               ⟨266485⟩
    v35 = 0                                                                                           ⟨266508⟩
    v34 = 0                                                                                           ⟨266509⟩
    retour                                                                                            ⟨266559⟩
v212 = 0                                                                                              ⟨266565⟩
v3356 = 436                                                                                           ⟨266566⟩
v3354 = word_4D392                                                                                    ⟨266568⟩
word_4D392 = &v3356                                                                                   ⟨266570⟩
v3356 = 444                                                                                           ⟨266571⟩
v3352 = 0                                                                                             ⟨266572⟩
v3348 = 0                                                                                             ⟨266573⟩
v3358 = -1                                                                                            ⟨266575⟩
si v13 != 0 :
    charge(asoundfx 7)                                                                                ⟨266587⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨266592⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 7, x=0)                                         ⟨266599⟩
    v222 = 0                                                                                          ⟨266603⟩
    si canal1.+0 != 0 :
        AIL_start_sequence(pilote=canal1.+0→4, séquence=v3358)                                        ⟨266609⟩
        sub_50F5(canal1.+0→4, v3358, word_4EF82, v222)                                                ⟨266616⟩
charge(mid17 10)                                                                                      ⟨266631⟩
palette_depuis(pal9(mid17 10))                                                                        ⟨266638⟩
charge(mid17 11)                                                                                      ⟨266650⟩
palette_depuis(pal10(mid17 11))                                                                       ⟨266657⟩

──── scène3 ────
scène3 = Scene_Create(cadence=15, palette=255, surface=&v454)                                         ⟨266665⟩
c8 = Layer(ressource=mid17 3, x=0, y=0)                                                               ⟨266672⟩
c9 = Layer(ressource=midgames 50, x=0, y=0)                                                           ⟨266680⟩
c10 = Layer(ressource=mid17 4, x=0, y=0)                                                              ⟨266688⟩
palette_copie(destination=pal1, source=pal9(mid17 10))                                                ⟨266698⟩
palette_copie(destination=pal1, source=pal10(mid17 11))                                               ⟨266707⟩
ajoute c8 à scène3                                                                                    ⟨266712⟩
ajoute c9 à scène3                                                                                    ⟨266717⟩
ajoute c10 à scène3                                                                                   ⟨266722⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨266734⟩
Widget_Method_DispatchC_37052(objet1, 0)                                                              ⟨266739⟩
Widget_Method_Dispatch8_37030(objet1, 248)                                                            ⟨266744⟩
v262 = 0                                                                                              ⟨266746⟩
si = 3                                                                                                ⟨266747⟩
tant que (scène3.compteur < 73) et (scène3.terminée == 0) :
    v264 = scène3.compteur                                                                            ⟨266752⟩
    si v264 < 51 :
        v266 = si                                                                                     ⟨266755⟩
        si = si + 1                                                                                   ⟨266756⟩
        c10.image = v266                                                                              ⟨266759⟩
    sinon :
        v268 = v262                                                                                   ⟨266764⟩
        v262_avant = v262                                                                             ⟨266765⟩
        v262 = v262 + 1                                                                               ⟨266765⟩
        c9.image = v268                                                                               ⟨266768⟩
        si = si + 1                                                                                   ⟨266770⟩
        c10.image = si                                                                                ⟨266773⟩
    Scene_Tick(scène=scène3)                                                                          ⟨266785⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨266814⟩
v232 = 0                                                                                              ⟨266857⟩
v226 = 0                                                                                              ⟨266859⟩
canal_arrête(canal=canal1)                                                                            ⟨266862⟩
sub_5C1C(&v3356, 2)                                                                                   ⟨266867⟩
v212 = 0                                                                                              ⟨266886⟩
si byte_4F55C != 0 :
    v193 = 0                                                                                          ⟨266912⟩
    v192 = 0                                                                                          ⟨266913⟩
    v177 = 0                                                                                          ⟨266934⟩
    v176 = 0                                                                                          ⟨266935⟩
    v161 = 0                                                                                          ⟨266956⟩
    v160 = 0                                                                                          ⟨266957⟩
    v145 = 0                                                                                          ⟨266978⟩
    v144 = 0                                                                                          ⟨266979⟩
    v135 = 0                                                                                          ⟨266996⟩
    v134 = 0                                                                                          ⟨266997⟩
    v125 = 0                                                                                          ⟨267014⟩
    v124 = 0                                                                                          ⟨267015⟩
    v115 = 0                                                                                          ⟨267032⟩
    v114 = 0                                                                                          ⟨267033⟩
    v106 = 0                                                                                          ⟨267058⟩
    v101 = 0                                                                                          ⟨267059⟩
    v100 = 0                                                                                          ⟨267060⟩
    v85 = 0                                                                                           ⟨267081⟩
    v84 = 0                                                                                           ⟨267082⟩
    v69 = 0                                                                                           ⟨267103⟩
    v68 = 0                                                                                           ⟨267104⟩
    v53 = 0                                                                                           ⟨267125⟩
    v52 = 0                                                                                           ⟨267126⟩
    voix_arrête(voix=voix1)                                                                           ⟨267130⟩
    v3272 = 0                                                                                         ⟨267147⟩
    v3267 = 0                                                                                         ⟨267148⟩
    v3266 = 0                                                                                         ⟨267149⟩
    canal_arrête(canal=canal2)                                                                        ⟨267152⟩
    sub_5C1C(&v1198, 2)                                                                               ⟨267157⟩
    v35 = 0                                                                                           ⟨267180⟩
    v34 = 0                                                                                           ⟨267181⟩
    retour                                                                                            ⟨267231⟩
v212 = 0                                                                                              ⟨267237⟩
v222 = 0                                                                                              ⟨267241⟩
v3356 = 436                                                                                           ⟨267242⟩
v3354 = word_4D392                                                                                    ⟨267244⟩
word_4D392 = &v3356                                                                                   ⟨267246⟩
v3356 = 444                                                                                           ⟨267247⟩
v3352 = 0                                                                                             ⟨267248⟩
v3348 = 0                                                                                             ⟨267249⟩
v3358 = -1                                                                                            ⟨267251⟩
v3370 = 436                                                                                           ⟨267252⟩
v3368 = word_4D392                                                                                    ⟨267254⟩
word_4D392 = &v3370                                                                                   ⟨267256⟩
v3370 = 444                                                                                           ⟨267257⟩
v3374 = 0                                                                                             ⟨267260⟩
si v13 != 0 :
    charge(asoundfx 93)                                                                               ⟨267273⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨267278⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 93, x=0)                                        ⟨267285⟩
    v230 = word_4F02E                                                                                 ⟨267288⟩
    v232 = 0                                                                                          ⟨267289⟩
    si canal1.+0 != 0 :
        AIL_start_sequence(pilote=canal1.+0→4, séquence=v3358)                                        ⟨267295⟩
        sub_50F5(canal1.+0→4, v3358, v230, v232)                                                      ⟨267302⟩
charge(mid17 1)                                                                                       ⟨267317⟩
charge(mid17 5)                                                                                       ⟨267329⟩
charge(midgames 47)                                                                                   ⟨267341⟩
palette_depuis(pal11(midgames 47))                                                                    ⟨267348⟩
charge(mid17 8)                                                                                       ⟨267360⟩
palette_depuis(pal12(mid17 8))                                                                        ⟨267367⟩

──── scène4 ────
scène4 = Scene_Create(cadence=15, palette=255, surface=&v454)                                         ⟨267375⟩
c11 = Layer(ressource=mid17 1, x=0, y=0)                                                              ⟨267382⟩
c12 = Layer(ressource=mid17 5, x=0, y=0)                                                              ⟨267390⟩
palette_copie(destination=pal1, source=pal12(mid17 8))                                                ⟨267400⟩
palette_copie(destination=pal1, source=pal11(midgames 47))                                            ⟨267409⟩
ajoute c11 à scène4                                                                                   ⟨267414⟩
ajoute c12 à scène4                                                                                   ⟨267419⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨267431⟩
Widget_Method_DispatchC_37052(objet1, 0)                                                              ⟨267436⟩
Widget_Method_Dispatch8_37030(objet1, 0)                                                              ⟨267441⟩
Scene_Tick(scène=scène4)                                                                              ⟨267445⟩
charge(midgames 48)                                                                                   ⟨267457⟩
charge(midgames 49)                                                                                   ⟨267469⟩
charge(mid17 7)                                                                                       ⟨267481⟩
charge(mid17 6)                                                                                       ⟨267493⟩
c13 = Layer(ressource=midgames 48, x=0, y=0)                                                          ⟨267500⟩
c14 = Layer(ressource=midgames 49, x=0, y=0)                                                          ⟨267508⟩
c15 = Layer(ressource=mid17 7, x=0, y=0)                                                              ⟨267516⟩
c16 = Layer(ressource=mid17 6, x=0, y=0)                                                              ⟨267524⟩
retire(parent=scène4, calque=c12)                                                                     ⟨267530⟩
ajoute c13 à scène4                                                                                   ⟨267535⟩
ajoute c15 à scène4                                                                                   ⟨267540⟩
ajoute c12 à scène4                                                                                   ⟨267545⟩
si = 0                                                                                                ⟨267547⟩
v338 = 0                                                                                              ⟨267548⟩
scène4.compteur = 0                                                                                   ⟨267549⟩
tant que (scène4.compteur < 83) et (scène4.terminée == 0) :
    v340 = scène4.compteur                                                                            ⟨267554⟩
    si v340 == 20 :
        Scene_SetFps(scène=scène4, cadence=13)                                                        ⟨267560⟩
    si v340 == 30 :
        Scene_SetFps(scène=scène4, cadence=11)                                                        ⟨267569⟩
    si v340 == 40 :
        Scene_SetFps(scène=scène4, cadence=9)                                                         ⟨267578⟩
    si v340 == 50 :
        Scene_SetFps(scène=scène4, cadence=7)                                                         ⟨267587⟩
    si v340 < 30 :
        v342 = si                                                                                     ⟨267593⟩
        si = si + 1                                                                                   ⟨267594⟩
        c13.image = v342                                                                              ⟨267597⟩
        v344 = v338                                                                                   ⟨267599⟩
        v338_avant = v338                                                                             ⟨267600⟩
        v338 = v338 + 1                                                                               ⟨267600⟩
        c15.image = v344                                                                              ⟨267603⟩
    sinon :
        si v340 == 30 :
            si = 0                                                                                    ⟨267612⟩
            retire(parent=scène4, calque=c13)                                                         ⟨267616⟩
            c13.détruit(3)                                                                            ⟨267624⟩
            retire(parent=scène4, calque=c12)                                                         ⟨267632⟩
            ajoute c14 à scène4                                                                       ⟨267637⟩
            ajoute c12 à scène4                                                                       ⟨267642⟩
            v346 = 0                                                                                  ⟨267644⟩
            si = 1                                                                                    ⟨267645⟩
            c14.image = v346                                                                          ⟨267648⟩
            v348 = v338                                                                               ⟨267650⟩
            v338_avant = v338                                                                         ⟨267651⟩
            v338 = v338 + 1                                                                           ⟨267651⟩
            c15.image = v348                                                                          ⟨267654⟩
        sinon :
            si v340 > 30 :
                si v340 < 50 :
                    v350 = si                                                                         ⟨267662⟩
                    si = si + 1                                                                       ⟨267663⟩
                    c14.image = v350                                                                  ⟨267666⟩
                    v352 = v338                                                                       ⟨267668⟩
                    v338_avant = v338                                                                 ⟨267669⟩
                    v338 = v338 + 1                                                                   ⟨267669⟩
                    c15.image = v352                                                                  ⟨267672⟩
                sinon :
                    si v340 == 50 :
                        si v13 != 0 :
                            charge(asoundfx 20)                                                       ⟨267692⟩
                            canal_init(canal=canal3, pilote=word_4CA5D)                               ⟨267697⟩
                            canal_enregistre(canal=canal3, ressource=asoundfx 20, x=0)                ⟨267704⟩
                            v354 = word_4EF9C                                                         ⟨267707⟩
                            si canal3.+0 != 0 :
                                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3372)                ⟨267714⟩
                                sub_50F5(canal3.+0→4, v3372, v354, 0)                                 ⟨267721⟩
                        si = 0                                                                        ⟨267726⟩
                        Scene_SetFps(scène=scène4, cadence=15)                                        ⟨267730⟩
                        ajoute c16 à scène4                                                           ⟨267735⟩
                        v358 = 0                                                                      ⟨267737⟩
                        si = 1                                                                        ⟨267738⟩
                        c16.image = v358                                                              ⟨267741⟩
                    sinon :
                        si v340 < 66 :
                            si v340 & 1 != 0 :
                                v360 = si                                                             ⟨267749⟩
                                si = si + 1                                                           ⟨267750⟩
                                c16.image = v360                                                      ⟨267753⟩
            sinon :
                si v340 == 50 :
                    si v13 != 0 :
                        charge(asoundfx 20)                                                           ⟨267692⟩
                        canal_init(canal=canal3, pilote=word_4CA5D)                                   ⟨267697⟩
                        canal_enregistre(canal=canal3, ressource=asoundfx 20, x=0)                    ⟨267704⟩
                        v354 = word_4EF9C                                                             ⟨267707⟩
                        si canal3.+0 != 0 :
                            AIL_start_sequence(pilote=canal3.+0→4, séquence=v3372)                    ⟨267714⟩
                            sub_50F5(canal3.+0→4, v3372, v354, 0)                                     ⟨267721⟩
                    si = 0                                                                            ⟨267726⟩
                    Scene_SetFps(scène=scène4, cadence=15)                                            ⟨267730⟩
                    ajoute c16 à scène4                                                               ⟨267735⟩
                    v358 = 0                                                                          ⟨267737⟩
                    si = 1                                                                            ⟨267738⟩
                    c16.image = v358                                                                  ⟨267741⟩
                sinon :
                    si v340 < 66 :
                        si v340 & 1 != 0 :
                            v360 = si                                                                 ⟨267749⟩
                            si = si + 1                                                               ⟨267750⟩
                            c16.image = v360                                                          ⟨267753⟩
    Scene_Tick(scène=scène4)                                                                          ⟨267765⟩
v323 = 0                                                                                              ⟨267804⟩
v322 = 0                                                                                              ⟨267805⟩
v312 = 0                                                                                              ⟨267823⟩
v302 = 0                                                                                              ⟨267841⟩
v292 = 0                                                                                              ⟨267859⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨267863⟩
v272 = 0                                                                                              ⟨267886⟩
v262 = 0                                                                                              ⟨267906⟩
v256 = 0                                                                                              ⟨267908⟩
v246 = 0                                                                                              ⟨267926⟩
v236 = 0                                                                                              ⟨267944⟩
canal_arrête(canal=canal3)                                                                            ⟨267947⟩
sub_5C1C(&v3370, 2)                                                                                   ⟨267952⟩
canal_arrête(canal=canal1)                                                                            ⟨267956⟩
sub_5C1C(&v3356, 2)                                                                                   ⟨267961⟩
v222 = 0                                                                                              ⟨267980⟩
v212 = 0                                                                                              ⟨267998⟩
si byte_4F55C != 0 :
    v193 = 0                                                                                          ⟨268024⟩
    v192 = 0                                                                                          ⟨268025⟩
    v177 = 0                                                                                          ⟨268046⟩
    v176 = 0                                                                                          ⟨268047⟩
    v161 = 0                                                                                          ⟨268068⟩
    v160 = 0                                                                                          ⟨268069⟩
    v145 = 0                                                                                          ⟨268090⟩
    v144 = 0                                                                                          ⟨268091⟩
    v135 = 0                                                                                          ⟨268108⟩
    v134 = 0                                                                                          ⟨268109⟩
    v125 = 0                                                                                          ⟨268126⟩
    v124 = 0                                                                                          ⟨268127⟩
    v115 = 0                                                                                          ⟨268144⟩
    v114 = 0                                                                                          ⟨268145⟩
    v106 = 0                                                                                          ⟨268170⟩
    v101 = 0                                                                                          ⟨268171⟩
    v100 = 0                                                                                          ⟨268172⟩
    v85 = 0                                                                                           ⟨268193⟩
    v84 = 0                                                                                           ⟨268194⟩
    v69 = 0                                                                                           ⟨268215⟩
    v68 = 0                                                                                           ⟨268216⟩
    v53 = 0                                                                                           ⟨268237⟩
    v52 = 0                                                                                           ⟨268238⟩
    voix_arrête(voix=voix1)                                                                           ⟨268242⟩
    v3272 = 0                                                                                         ⟨268259⟩
    v3267 = 0                                                                                         ⟨268260⟩
    v3266 = 0                                                                                         ⟨268261⟩
    canal_arrête(canal=canal2)                                                                        ⟨268264⟩
    sub_5C1C(&v1198, 2)                                                                               ⟨268269⟩
    v35 = 0                                                                                           ⟨268292⟩
    v34 = 0                                                                                           ⟨268293⟩
    retour                                                                                            ⟨268343⟩
v212 = 0                                                                                              ⟨268349⟩
charge(optshps 116)                                                                                   ⟨268356⟩
v222 = 0                                                                                              ⟨268361⟩
charge(midgames 4)                                                                                    ⟨268368⟩

──── scène5 ────
scène5 = Scene_Create(cadence=9, palette=255, surface=&v454)                                          ⟨268376⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨268386⟩
c17 = Layer(ressource=midgames 4, x=0, y=0)                                                           ⟨268393⟩
c18 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)                               ⟨268401⟩
si = c18                                                                                              ⟨268403⟩
c19 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)                             ⟨268410⟩
c20 = Layer(ressource=optshps 116, x=0, y=-64)                                                        ⟨268418⟩
palette_copie(destination=pal1, source=pal2(optpals 21))                                              ⟨268428⟩
palette_copie(destination=pal1, source=pal3(midgames 6))                                              ⟨268437⟩
palette_copie(destination=pal1, source=pal4(convdata type 2 "normal"))                                ⟨268446⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨268458⟩
ajoute c20 à scène5                                                                                   ⟨268463⟩
ajoute c17 à scène5                                                                                   ⟨268468⟩
ajoute c18 à scène5                                                                                   ⟨268473⟩
ajoute c19 à scène5                                                                                   ⟨268478⟩
Widget_Method_DispatchC_37052(objet1, 0)                                                              ⟨268483⟩
Widget_Method_Dispatch8_37030(objet1, 127)                                                            ⟨268488⟩
tête_image_de_base(tête=c18, image=-1)                                                                ⟨268492⟩
charge(midgames 0)                                                                                    ⟨268504⟩
c21 = ToggleLayer(ressource=midgames 0, x=160, y=128, sens=1)                                         ⟨268512⟩
ajoute c21 à scène5                                                                                   ⟨268518⟩
tant que (scène5.compteur < 15) et (scène5.terminée == 0) :
    v258 = scène5.compteur                                                                            ⟨268524⟩
    si v258 == 12 :
        tête_image_de_base(tête=c18, image=18)                                                        ⟨268529⟩
    Scene_Tick(scène=scène5)                                                                          ⟨268542⟩
v232 = 0                                                                                              ⟨268599⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨268603⟩
v222 = 0                                                                                              ⟨268622⟩
v212 = 0                                                                                              ⟨268640⟩
si byte_4F55C != 0 :
    v193 = 0                                                                                          ⟨268666⟩
    v192 = 0                                                                                          ⟨268667⟩
    v177 = 0                                                                                          ⟨268688⟩
    v176 = 0                                                                                          ⟨268689⟩
    v161 = 0                                                                                          ⟨268710⟩
    v160 = 0                                                                                          ⟨268711⟩
    v145 = 0                                                                                          ⟨268732⟩
    v144 = 0                                                                                          ⟨268733⟩
    v135 = 0                                                                                          ⟨268750⟩
    v134 = 0                                                                                          ⟨268751⟩
    v125 = 0                                                                                          ⟨268768⟩
    v124 = 0                                                                                          ⟨268769⟩
    v115 = 0                                                                                          ⟨268786⟩
    v114 = 0                                                                                          ⟨268787⟩
    v106 = 0                                                                                          ⟨268812⟩
    v101 = 0                                                                                          ⟨268813⟩
    v100 = 0                                                                                          ⟨268814⟩
    v85 = 0                                                                                           ⟨268835⟩
    v84 = 0                                                                                           ⟨268836⟩
    v69 = 0                                                                                           ⟨268857⟩
    v68 = 0                                                                                           ⟨268858⟩
    v53 = 0                                                                                           ⟨268879⟩
    v52 = 0                                                                                           ⟨268880⟩
    voix_arrête(voix=voix1)                                                                           ⟨268884⟩
    v3272 = 0                                                                                         ⟨268901⟩
    v3267 = 0                                                                                         ⟨268902⟩
    v3266 = 0                                                                                         ⟨268903⟩
    canal_arrête(canal=canal2)                                                                        ⟨268906⟩
    sub_5C1C(&v1198, 2)                                                                               ⟨268911⟩
    v35 = 0                                                                                           ⟨268934⟩
    v34 = 0                                                                                           ⟨268935⟩
    retour                                                                                            ⟨268985⟩
v212 = 0                                                                                              ⟨268991⟩
charge(mid17 2)                                                                                       ⟨268998⟩
v222 = 0                                                                                              ⟨269003⟩
charge(mid17 0)                                                                                       ⟨269010⟩
v232 = 0                                                                                              ⟨269015⟩
charge(mid17 9)                                                                                       ⟨269022⟩
palette_depuis(pal13(mid17 9))                                                                        ⟨269029⟩

──── scène6 ────
scène6 = Scene_Create(cadence=9, palette=255, surface=&v454)                                          ⟨269037⟩
c22 = OverlayImageLayer(ressource=mid17 0, x=5, y=0, image=0)                                         ⟨269045⟩
c23 = Layer(ressource=mid17 2, x=0, y=0)                                                              ⟨269053⟩
palette_copie(destination=pal1, source=pal13(mid17 9))                                                ⟨269063⟩
ajoute c23 à scène6                                                                                   ⟨269068⟩
ajoute c22 à scène6                                                                                   ⟨269073⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨269085⟩
Widget_Method_DispatchC_37052(objet1, 0)                                                              ⟨269090⟩
Widget_Method_Dispatch8_37030(objet1, 128)                                                            ⟨269095⟩
v250 = 1                                                                                              ⟨269097⟩
c22.image = v250                                                                                      ⟨269102⟩
si v12 != 0 :
    Scene_Tick(scène=scène6)                                                                          ⟨269110⟩
    si = 0                                                                                            ⟨269112⟩
    tant que si < 4 :
        Scene_Tick(scène=scène6)                                                                      ⟨269118⟩
        si = si + 1                                                                                   ⟨269120⟩
    v262 = 0                                                                                          ⟨269125⟩
    v256 = 0                                                                                          ⟨269128⟩
    charge(mid17voc 1)                                                                                ⟨269135⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid17voc 1)                                 ⟨269141⟩
    si = 0                                                                                            ⟨269143⟩
    tant que si < 4 :
        Scene_Tick(scène=scène6)                                                                      ⟨269149⟩
        si = si + 1                                                                                   ⟨269151⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨269159⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène6)                                                                      ⟨269173⟩
    si = 0                                                                                            ⟨269185⟩
    tant que si < 17 :
        si si > 4 :
            si si < 13 :
                v264 = v250                                                                           ⟨269194⟩
                v250_avant = v250                                                                     ⟨269195⟩
                v250_avant = v250                                                                     ⟨269195⟩
                v250 = v250 + 1                                                                       ⟨269195⟩
                c22.image = v264                                                                      ⟨269198⟩
        Scene_Tick(scène=scène6)                                                                      ⟨269203⟩
        si = si + 1                                                                                   ⟨269205⟩
    voix_arrête(voix=voix1)                                                                           ⟨269212⟩
    v262 = 0                                                                                          ⟨269229⟩
    v256 = 0                                                                                          ⟨269231⟩
sinon :
    v6 = 75                                                                                           ⟨269235⟩
    v4 = scène6.compteur                                                                              ⟨269237⟩
    tant que (scène6.compteur < v4 + ((v6·70) / 100)) et (scène6.terminée == 0) :
        si = scène6.compteur                                                                          ⟨269250⟩
        si v4 + 8 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[9])                             ⟨269263⟩
        si v4 + 24 < scène6.compteur :
            si v4 + 33 > scène6.compteur :
                v250_avant = v250                                                                     ⟨269277⟩
                v250_avant = v250                                                                     ⟨269277⟩
                v250_avant = v250                                                                     ⟨269277⟩
                v250 = v250 + 1                                                                       ⟨269277⟩
                c22.image = v250_avant                                                                ⟨269280⟩
        si (v4 + ((v6·70) / 100)) - 1 == scène6.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨269290⟩
        Scene_Tick(scène=scène6)                                                                      ⟨269308⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=2, premier=0, nombre=256)                           ⟨269338⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨269343⟩
v232 = 0                                                                                              ⟨269366⟩
v222 = 0                                                                                              ⟨269384⟩
v212 = 0                                                                                              ⟨269402⟩
v193 = 0                                                                                              ⟨269423⟩
v192 = 0                                                                                              ⟨269424⟩
v177 = 0                                                                                              ⟨269445⟩
v176 = 0                                                                                              ⟨269446⟩
v161 = 0                                                                                              ⟨269467⟩
v160 = 0                                                                                              ⟨269468⟩
v145 = 0                                                                                              ⟨269489⟩
v144 = 0                                                                                              ⟨269490⟩
v135 = 0                                                                                              ⟨269507⟩
v134 = 0                                                                                              ⟨269508⟩
v125 = 0                                                                                              ⟨269525⟩
v124 = 0                                                                                              ⟨269526⟩
v115 = 0                                                                                              ⟨269543⟩
v114 = 0                                                                                              ⟨269544⟩
v106 = 0                                                                                              ⟨269569⟩
v101 = 0                                                                                              ⟨269570⟩
v100 = 0                                                                                              ⟨269571⟩
v85 = 0                                                                                               ⟨269592⟩
v84 = 0                                                                                               ⟨269593⟩
v69 = 0                                                                                               ⟨269614⟩
v68 = 0                                                                                               ⟨269615⟩
v53 = 0                                                                                               ⟨269636⟩
v52 = 0                                                                                               ⟨269637⟩
voix_arrête(voix=voix1)                                                                               ⟨269641⟩
v3272 = 0                                                                                             ⟨269658⟩
v3267 = 0                                                                                             ⟨269659⟩
v3266 = 0                                                                                             ⟨269660⟩
canal_arrête(canal=canal2)                                                                            ⟨269663⟩
sub_5C1C(&v1198, 2)                                                                                   ⟨269668⟩
v35 = 0                                                                                               ⟨269691⟩
v34 = 0                                                                                               ⟨269692⟩
retour                                                                                                ⟨269742⟩
```

## Tableaux du segment de données

