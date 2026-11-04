# Script extrait de `Midgame20_Play_974D0` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## Midgame20_Play_974D0

```
bp = sp                                                                                               ⟨270011⟩
tableau_textes(tableau=textes1, nombre=9, longueur=200)                                               ⟨270020⟩
v11 = 0                                                                                               ⟨270022⟩
v12 = 0                                                                                               ⟨270023⟩
v13 = 0                                                                                               ⟨270024⟩
si word_4CA5B != 0 :
    v12 = 1                                                                                           ⟨270027⟩
v16 = word_4D36E                                                                                      ⟨270031⟩
v516 = 0                                                                                              ⟨270032⟩
TextFormat_ApplyStyleAttribute_357D1(&v516, v16)                                                      ⟨270037⟩
v530 = 0                                                                                              ⟨270039⟩
TextRenderer_ApplyFormatChange_3584E(&v530, 0)                                                        ⟨270048⟩
sub_3499B(&v20, &v530)                                                                                ⟨270054⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨270060⟩
v30 = 0                                                                                               ⟨270062⟩
v40 = 0                                                                                               ⟨270069⟩
v36 = 2                                                                                               ⟨270070⟩
v35 = 0                                                                                               ⟨270071⟩
v34 = 0                                                                                               ⟨270072⟩
TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                       ⟨270086⟩
v42 = ?                                                                                               ⟨270088⟩
v44 = TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                 ⟨270089⟩
v40 = v44                                                                                             ⟨270091⟩
v36 = 2                                                                                               ⟨270092⟩
v35 = 1                                                                                               ⟨270093⟩
v34 = 0                                                                                               ⟨270094⟩
GlyphObject_ConstructWithBuffer_36D56(&v554, &v40)                                                    ⟨270099⟩
sub_30A1D(&v588, word_4D36E, &v554)                                                                   ⟨270111⟩
Widget_Method_DispatchC_37052(&v588, 0)                                                               ⟨270116⟩
sub_435F1(pak optshps)                                                                                ⟨270137⟩
sub_435F1(pak optpals)                                                                                ⟨270158⟩
sub_435F1(pak mid20)                                                                                  ⟨270179⟩
sub_435F1(pak midgames)                                                                               ⟨270200⟩
charge(midgames 19)                                                                                   ⟨270212⟩
charge(midgames 20)                                                                                   ⟨270224⟩
charge(midgames 21)                                                                                   ⟨270236⟩
charge(optshps 116)                                                                                   ⟨270252⟩
charge(optshps 44)                                                                                    ⟨270260⟩
charge(midgames 6)                                                                                    ⟨270272⟩
palette_depuis(pal2(midgames 6))                                                                      ⟨270279⟩
v122 = 0                                                                                              ⟨270283⟩
v128 = 0                                                                                              ⟨270285⟩
v134 = 0                                                                                              ⟨270287⟩
charge(optpals 21)                                                                                    ⟨270299⟩
palette_depuis(pal3(optpals 21))                                                                      ⟨270305⟩
charge(optpals 24)                                                                                    ⟨270317⟩
palette_depuis(pal4(optpals 24))                                                                      ⟨270323⟩
charge(midgames 22)                                                                                   ⟨270335⟩
palette_depuis(pal5(midgames 22))                                                                     ⟨270341⟩
charge_convdata_type2("normal")                                                                       ⟨270351⟩
palette_depuis(pal6(convdata type 2 "normal"))                                                        ⟨270357⟩
v334 = 0                                                                                              ⟨270374⟩
v328 = 0                                                                                              ⟨270376⟩
v318 = 0                                                                                              ⟨270394⟩
v308 = 0                                                                                              ⟨270412⟩
v299 = 0                                                                                              ⟨270429⟩
v298 = 0                                                                                              ⟨270430⟩
si v12 != 0 :
    si sub_993C(chemin1) != 0 :
        pak mid20voc.ouvre(chemin1, 1)                                                                ⟨270460⟩
        sub_435F1(pak mid20voc)                                                                       ⟨270464⟩
    sinon :
        v12 = 0                                                                                       ⟨270469⟩
sinon :
    v12 = 0                                                                                           ⟨270469⟩
v144 = 0                                                                                              ⟨270472⟩
v139 = 0                                                                                              ⟨270474⟩
v138 = 0                                                                                              ⟨270475⟩
v146 = byte_4CA58                                                                                     ⟨270477⟩
si v146 - 1 <= 4 :
    si (v146 - 1)·2 == 0 ou ((v146 - 1)·2 != 2) et (((v146 - 1)·2 != 4) et (((v146 - 1)·2 != 6) et ((v146 - 1)·2 != 8))) :
        si sub_993C(chemin1) != 0 :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨270521⟩
            sub_435F1(pak rsoundfx)                                                                   ⟨270525⟩
            flux_iff(flux=flux1)                                                                      ⟨270539⟩
            v3479 = 256                                                                               ⟨270542⟩
            v3483 = 0                                                                                 ⟨270543⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨270551⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨270557⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨270563⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨270567⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨270569⟩
            si = 1                                                                                    ⟨270570⟩
            tant que si <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨270576⟩
                ds:26002[si·2] = iff_lit_mot(flux=flux1)                                              ⟨270580⟩
                si = si + 1                                                                           ⟨270581⟩
            iff_ferme_form(flux=flux1)                                                                ⟨270588⟩
            v13 = 1                                                                                   ⟨270590⟩
            iff_ferme_form(flux=flux1)                                                                ⟨270594⟩
        si sub_993C(chemin1) != 0 :
            v11 = 1                                                                                   ⟨270620⟩
            si v13 == 0 :
                word_4F048 = 90                                                                       ⟨270625⟩
    sinon :
        si sub_993C(chemin1) != 0 :
            si word_4CA5D != 0 :
                pak asoundfx.ouvre(chemin1, 1)                                                        ⟨270662⟩
                sub_435F1(pak asoundfx)                                                               ⟨270666⟩
                flux_iff(flux=flux1)                                                                  ⟨270680⟩
                v3479 = 256                                                                           ⟨270683⟩
                v3483 = 0                                                                             ⟨270684⟩
                flux1.ouvre(chemin1, 1)                                                               ⟨270692⟩
                iff_form(flux=flux1, balise='VOLU', x=0)                                              ⟨270698⟩
                iff_chunk(flux=flux1, balise='ADLB', x=1)                                             ⟨270704⟩
                iff_lit_mot(flux=flux1)                                                               ⟨270708⟩
                word_4F048 = iff_lit_mot(flux=flux1)                                                  ⟨270710⟩
                si = 1                                                                                ⟨270711⟩
                tant que si <= 106 :
                    iff_lit_mot(flux=flux1)                                                           ⟨270717⟩
                    ds:26002[si·2] = iff_lit_mot(flux=flux1)                                          ⟨270721⟩
                    si = si + 1                                                                       ⟨270722⟩
                iff_ferme_form(flux=flux1)                                                            ⟨270729⟩
                v13 = 1                                                                               ⟨270731⟩
                iff_ferme_form(flux=flux1)                                                            ⟨270735⟩
        si sub_993C(chemin1) != 0 :
            v11 = 1                                                                                   ⟨270778⟩
            si v13 == 0 :
                word_4F048 = 255                                                                      ⟨270783⟩
si v13 != 0 :
    v3416 = word_4D392                                                                                ⟨270798⟩
    word_4D392 = &v3418                                                                               ⟨270800⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨270809⟩
    si = 0                                                                                            ⟨270811⟩
    tant que si < 4 :
        v300 = 2                                                                                      ⟨270816⟩
        v299 = 0                                                                                      ⟨270817⟩
        v298 = 0                                                                                      ⟨270818⟩
        charge(asoundfx v150[si])                                                                     ⟨270827⟩
        canal_enregistre(canal=canal1, ressource=asoundfx v150[si], x=0)                              ⟨270834⟩
        canal_arrête(canal=canal1)                                                                    ⟨270838⟩
        v299 = 0                                                                                      ⟨270856⟩
        v298 = 0                                                                                      ⟨270857⟩
        si = si + 1                                                                                   ⟨270858⟩
    canal_arrête(canal=canal1)                                                                        ⟨270868⟩
    sub_5C1C(&v3418, 2)                                                                               ⟨270873⟩
v1318 = 436                                                                                           ⟨270877⟩
v1316 = word_4D392                                                                                    ⟨270879⟩
word_4D392 = &v1318                                                                                   ⟨270881⟩
v1318 = 444                                                                                           ⟨270882⟩
v1322 = 0                                                                                             ⟨270885⟩
si v11 != 0 :
    sub_435F1(pak mmusic)                                                                             ⟨270901⟩
    si v12 != 0 :
        v295 = 16                                                                                     ⟨270905⟩
    sinon :
        v295 = 15                                                                                     ⟨270909⟩
    charge(mmusic v295)                                                                               ⟨270920⟩
    canal_init(canal=canal2, pilote=word_4CA59)                                                       ⟨270925⟩
    canal_enregistre(canal=canal2, ressource=mmusic v295, x=0)                                        ⟨270932⟩
v1331 = booléen                                                                                       ⟨270949⟩
v1327 = booléen                                                                                       ⟨270950⟩
si v12 != 0 :
    voix_pilote(voix=voix1, pilote=word_4CA5B)                                                        ⟨270956⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨270973⟩
    v3479 = 256                                                                                       ⟨270976⟩
    v3483 = 0                                                                                         ⟨270977⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨270985⟩
    iff_form(flux=flux1, balise='MG20', x=0)                                                          ⟨270991⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨270997⟩
    si = 0                                                                                            ⟨270999⟩
    tant que si < 9 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨271007⟩
        di = 0                                                                                        ⟨271009⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·si), taille=0)                       ⟨271020⟩
        si = si + 1                                                                                   ⟨271024⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨271031⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[0], arg_6)                                                                 ⟨271040⟩
        CRT_Strcat(textes1[0], textes1[2])                                                            ⟨271048⟩
    sinon :
        si CRT_Strlen(arg_10) != 0 :
            CRT_Strcat(textes1[0], arg_10)                                                            ⟨271060⟩
            CRT_Strcat(textes1[0], textes1[2])                                                        ⟨271068⟩
        sinon :
            si CRT_Strlen(arg_8) != 0 :
                CRT_Strcat(textes1[0], arg_8)                                                         ⟨271080⟩
                CRT_Strcat(textes1[0], textes1[2])                                                    ⟨271088⟩
            sinon :
                CRT_Strcat(textes1[0], textes1[1])                                                    ⟨271097⟩
                CRT_Strcat(textes1[0], textes1[2])                                                    ⟨271105⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨271112⟩
si byte_4F55C != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨271129⟩
    v3392 = 0                                                                                         ⟨271146⟩
    v3387 = 0                                                                                         ⟨271147⟩
    v3386 = 0                                                                                         ⟨271148⟩
    canal_arrête(canal=canal2)                                                                        ⟨271151⟩
    sub_5C1C(&v1318, 2)                                                                               ⟨271156⟩
    v139 = 0                                                                                          ⟨271179⟩
    v138 = 0                                                                                          ⟨271180⟩
    v99 = 0                                                                                           ⟨271222⟩
    v98 = 0                                                                                           ⟨271223⟩
    v89 = 0                                                                                           ⟨271240⟩
    v88 = 0                                                                                           ⟨271241⟩
    v79 = 0                                                                                           ⟨271258⟩
    v78 = 0                                                                                           ⟨271259⟩
    v69 = 0                                                                                           ⟨271276⟩
    v68 = 0                                                                                           ⟨271277⟩
    v59 = 0                                                                                           ⟨271294⟩
    v58 = 0                                                                                           ⟨271295⟩
    v49 = 0                                                                                           ⟨271312⟩
    v48 = 0                                                                                           ⟨271313⟩
    v40 = 0                                                                                           ⟨271358⟩
    v35 = 0                                                                                           ⟨271359⟩
    v34 = 0                                                                                           ⟨271360⟩
    retour                                                                                            ⟨271385⟩
si v11 != 0 :
    v152 = word_4F048                                                                                 ⟨271391⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v1320)                                        ⟨271398⟩
        sub_50F5(canal2.+0→4, v1320, v152, 0)                                                         ⟨271405⟩
vide_entrées()                                                                                        ⟨271414⟩
v300 = 2                                                                                              ⟨271416⟩
v299 = 0                                                                                              ⟨271417⟩
v298 = 0                                                                                              ⟨271418⟩
charge(mid20 7)                                                                                       ⟨271425⟩
v308 = 0                                                                                              ⟨271430⟩
charge(mid20 6)                                                                                       ⟨271437⟩
v318 = 0                                                                                              ⟨271442⟩
charge(mid20 16)                                                                                      ⟨271449⟩
palette_depuis(pal7(mid20 16))                                                                        ⟨271456⟩
charge(mid20 10)                                                                                      ⟨271468⟩
charge(mid20 11)                                                                                      ⟨271480⟩
charge(mid20 12)                                                                                      ⟨271492⟩
c1 = Layer(ressource=mid20 10, x=0, y=-2)                                                             ⟨271499⟩
di = c1                                                                                               ⟨271501⟩
c2 = Layer(ressource=mid20 11, x=0, y=-2)                                                             ⟨271507⟩
c3 = Layer(ressource=mid20 12, x=0, y=-2)                                                             ⟨271515⟩

──── scène1 ────
scène1 = Scene_Create(cadence=12, palette=255, surface=&v516)                                         ⟨271524⟩
palette_copie(destination=pal1, source=pal3(optpals 21))                                              ⟨271533⟩
palette_copie(destination=pal1, source=pal5(midgames 22))                                             ⟨271542⟩
palette_copie(destination=pal1, source=pal7(mid20 16))                                                ⟨271551⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨271559⟩
c4 = Layer(ressource=optshps 116, x=0, y=0)                                                           ⟨271566⟩
c5 = Layer(ressource=midgames 20, x=0, y=5)                                                           ⟨271574⟩
ajoute c4 à scène1                                                                                    ⟨271580⟩
ajoute c5 à scène1                                                                                    ⟨271585⟩
v378 = 0                                                                                              ⟨271587⟩
v374 = 2                                                                                              ⟨271588⟩
v373 = 0                                                                                              ⟨271589⟩
v372 = 0                                                                                              ⟨271590⟩
v3452 = 436                                                                                           ⟨271591⟩
v3450 = word_4D392                                                                                    ⟨271593⟩
word_4D392 = &v3452                                                                                   ⟨271595⟩
v3452 = 444                                                                                           ⟨271596⟩
v3448 = 0                                                                                             ⟨271597⟩
v3444 = 0                                                                                             ⟨271598⟩
v3456 = 0                                                                                             ⟨271599⟩
v3454 = -1                                                                                            ⟨271600⟩
v388 = 0                                                                                              ⟨271601⟩
v383 = 0                                                                                              ⟨271603⟩
v382 = 0                                                                                              ⟨271604⟩
v3466 = 436                                                                                           ⟨271605⟩
v3464 = word_4D392                                                                                    ⟨271607⟩
word_4D392 = &v3466                                                                                   ⟨271609⟩
v3466 = 444                                                                                           ⟨271610⟩
v3470 = 0                                                                                             ⟨271613⟩
si v13 != 0 :
    charge(asoundfx 42)                                                                               ⟨271626⟩
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨271631⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 42, x=0)                                        ⟨271638⟩
    v390 = word_4EFC8                                                                                 ⟨271641⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3454)                                        ⟨271648⟩
        sub_50F5(canal3.+0→4, v3454, v390, 0)                                                         ⟨271655⟩
    charge(asoundfx 58)                                                                               ⟨271666⟩
    canal_init(canal=canal4, pilote=word_4CA5D)                                                       ⟨271671⟩
    canal_enregistre(canal=canal4, ressource=asoundfx 58, x=0)                                        ⟨271678⟩
si byte_4F55C != 0 :
    canal_arrête(canal=canal4)                                                                        ⟨271689⟩
    sub_5C1C(&v3466, 2)                                                                               ⟨271694⟩
    v383 = 0                                                                                          ⟨271712⟩
    v382 = 0                                                                                          ⟨271713⟩
    canal_arrête(canal=canal3)                                                                        ⟨271716⟩
    sub_5C1C(&v3452, 2)                                                                               ⟨271721⟩
    v372 = 0                                                                                          ⟨271740⟩
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨271744⟩
    v355 = 0                                                                                          ⟨271762⟩
    v354 = 0                                                                                          ⟨271763⟩
    v344 = 0                                                                                          ⟨271781⟩
    v334 = 0                                                                                          ⟨271799⟩
    v318 = 0                                                                                          ⟨271821⟩
    v308 = 0                                                                                          ⟨271839⟩
    v299 = 0                                                                                          ⟨271856⟩
    v298 = 0                                                                                          ⟨271857⟩
    voix_arrête(voix=voix1)                                                                           ⟨271861⟩
    v3392 = 0                                                                                         ⟨271878⟩
    v3387 = 0                                                                                         ⟨271879⟩
    v3386 = 0                                                                                         ⟨271880⟩
    canal_arrête(canal=canal2)                                                                        ⟨271883⟩
    sub_5C1C(&v1318, 2)                                                                               ⟨271888⟩
    v139 = 0                                                                                          ⟨271911⟩
    v138 = 0                                                                                          ⟨271912⟩
    v99 = 0                                                                                           ⟨271954⟩
    v98 = 0                                                                                           ⟨271955⟩
    v89 = 0                                                                                           ⟨271972⟩
    v88 = 0                                                                                           ⟨271973⟩
    v79 = 0                                                                                           ⟨271990⟩
    v78 = 0                                                                                           ⟨271991⟩
    v69 = 0                                                                                           ⟨272008⟩
    v68 = 0                                                                                           ⟨272009⟩
    v59 = 0                                                                                           ⟨272026⟩
    v58 = 0                                                                                           ⟨272027⟩
    v49 = 0                                                                                           ⟨272044⟩
    v48 = 0                                                                                           ⟨272045⟩
    v40 = 0                                                                                           ⟨272090⟩
    v35 = 0                                                                                           ⟨272091⟩
    v34 = 0                                                                                           ⟨272092⟩
    retour                                                                                            ⟨272117⟩
vide_entrées()                                                                                        ⟨272120⟩
scène1.terminée = 0                                                                                   ⟨272121⟩
vide_entrées()                                                                                        ⟨272122⟩
c6 = Layer(ressource=mid20 7, x=1, y=-2)                                                              ⟨272128⟩
c7 = Layer(ressource=mid20 6, x=0, y=0)                                                               ⟨272136⟩
ajoute c1 à scène1                                                                                    ⟨272142⟩
ajoute c6 à scène1                                                                                    ⟨272147⟩
c8 = MovingLayer(ressource=midgames 19, x=0, y=173, image=1)                                          ⟨272161⟩
c8.vx = 0                                                                                             ⟨272168⟩
c8.vy = 0                                                                                             ⟨272170⟩
c8.vx = 0                                                                                             ⟨272172⟩
c8.vy = -2                                                                                            ⟨272174⟩
ajoute c8 à scène1                                                                                    ⟨272186⟩
c9 = MovingLayer(ressource=midgames 19, x=0, y=250, image=2)                                          ⟨272200⟩
c9.vx = 0                                                                                             ⟨272207⟩
c9.vy = 0                                                                                             ⟨272209⟩
c9.vx = 0                                                                                             ⟨272211⟩
c9.vy = -4                                                                                            ⟨272213⟩
ajoute c9 à scène1                                                                                    ⟨272225⟩
v406 = 0                                                                                              ⟨272227⟩
v408 = 0                                                                                              ⟨272228⟩
tant que (scène1.compteur < 98) et (scène1.terminée == 0) :
    si = scène1.compteur                                                                              ⟨272232⟩
    si scène1.compteur == 30 :
        ajoute c7 à scène1                                                                            ⟨272238⟩
    si scène1.compteur < 43 :
        v410 = scène1.compteur                                                                        ⟨272244⟩
        c6.image = v410                                                                               ⟨272247⟩
    si scène1.compteur > 10 :
        si scène1.compteur < 50 :
            si scène1.compteur & 1 != 0 :
                déplace(calque=c4, dx=0, dy=-1)                                                       ⟨272261⟩
    si scène1.compteur < 50 :
        si scène1.compteur & 1 != 0 :
            déplace(calque=c5, dx=0, dy=-1)                                                           ⟨272274⟩
    si scène1.compteur == 54 :
        retire(parent=scène1, calque=c1)                                                              ⟨272286⟩
        c1.détruit(3)                                                                                 ⟨272293⟩
        retire(parent=scène1, calque=c8)                                                              ⟨272301⟩
        retire(parent=scène1, calque=c9)                                                              ⟨272306⟩
        ajoute c2 à scène1                                                                            ⟨272311⟩
        ajoute c3 à scène1                                                                            ⟨272316⟩
        ajoute c8 à scène1                                                                            ⟨272321⟩
        ajoute c9 à scène1                                                                            ⟨272326⟩
    si scène1.compteur > 16 :
        si scène1.compteur < 54 :
            v412 = v408                                                                               ⟨272335⟩
            v408_avant = v408                                                                         ⟨272336⟩
            v408 = v408 + 1                                                                           ⟨272336⟩
            c1.image = v412                                                                           ⟨272338⟩
    si scène1.compteur > 54 :
        si v406 > 4 :
            v406 = 0                                                                                  ⟨272345⟩
            déplace(calque=c2, dx=-1, dy=0)                                                           ⟨272351⟩
            déplace(calque=c3, dx=1, dy=0)                                                            ⟨272358⟩
        v414 = v406                                                                                   ⟨272363⟩
        c2.image = v414                                                                               ⟨272366⟩
        v416 = v406                                                                                   ⟨272368⟩
        v406_avant = v406                                                                             ⟨272369⟩
        v406 = v406 + 1                                                                               ⟨272369⟩
        c3.image = v416                                                                               ⟨272372⟩
    si scène1.compteur > 41 :
        si scène1.compteur < 99 :
            v418 = scène1.compteur - 42                                                               ⟨272381⟩
            c7.image = v418                                                                           ⟨272384⟩
    si scène1.compteur == 49 :
        si v13 != 0 :
            v420 = word_4EFE8                                                                         ⟨272392⟩
            si canal4.+0 != 0 :
                AIL_start_sequence(pilote=canal4.+0→4, séquence=v3468)                                ⟨272399⟩
                sub_50F5(canal4.+0→4, v3468, v420, 0)                                                 ⟨272406⟩
    si scène1.compteur == 50 :
        c8.vx = 0                                                                                     ⟨272414⟩
        c8.vy = 0                                                                                     ⟨272416⟩
        c9.vx = 0                                                                                     ⟨272418⟩
        c9.vy = 0                                                                                     ⟨272420⟩
    Scene_Tick(scène=scène1)                                                                          ⟨272432⟩
canal_arrête(canal=canal4)                                                                            ⟨272461⟩
sub_5C1C(&v3466, 2)                                                                                   ⟨272466⟩
v383 = 0                                                                                              ⟨272484⟩
v382 = 0                                                                                              ⟨272485⟩
canal_arrête(canal=canal3)                                                                            ⟨272488⟩
sub_5C1C(&v3452, 2)                                                                                   ⟨272493⟩
v372 = 0                                                                                              ⟨272512⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨272516⟩
v355 = 0                                                                                              ⟨272534⟩
v354 = 0                                                                                              ⟨272535⟩
v344 = 0                                                                                              ⟨272553⟩
v334 = 0                                                                                              ⟨272571⟩
v318 = 0                                                                                              ⟨272593⟩
v308 = 0                                                                                              ⟨272611⟩
v299 = 0                                                                                              ⟨272628⟩
v298 = 0                                                                                              ⟨272629⟩
vide_entrées()                                                                                        ⟨272630⟩
si byte_4F55C != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨272639⟩
    v3392 = 0                                                                                         ⟨272656⟩
    v3387 = 0                                                                                         ⟨272657⟩
    v3386 = 0                                                                                         ⟨272658⟩
    canal_arrête(canal=canal2)                                                                        ⟨272661⟩
    sub_5C1C(&v1318, 2)                                                                               ⟨272666⟩
    v139 = 0                                                                                          ⟨272689⟩
    v138 = 0                                                                                          ⟨272690⟩
    v99 = 0                                                                                           ⟨272732⟩
    v98 = 0                                                                                           ⟨272733⟩
    v89 = 0                                                                                           ⟨272750⟩
    v88 = 0                                                                                           ⟨272751⟩
    v79 = 0                                                                                           ⟨272768⟩
    v78 = 0                                                                                           ⟨272769⟩
    v69 = 0                                                                                           ⟨272786⟩
    v68 = 0                                                                                           ⟨272787⟩
    v59 = 0                                                                                           ⟨272804⟩
    v58 = 0                                                                                           ⟨272805⟩
    v49 = 0                                                                                           ⟨272822⟩
    v48 = 0                                                                                           ⟨272823⟩
    v40 = 0                                                                                           ⟨272868⟩
    v35 = 0                                                                                           ⟨272869⟩
    v34 = 0                                                                                           ⟨272870⟩
    retour                                                                                            ⟨272895⟩
charge(midgames 4)                                                                                    ⟨272908⟩

──── scène2 ────
scène2 = Scene_Create(cadence=9, palette=255, surface=&v516)                                          ⟨272916⟩
v300 = 2                                                                                              ⟨272919⟩
v299 = 0                                                                                              ⟨272920⟩
v298 = 0                                                                                              ⟨272921⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨272926⟩
palette_copie(destination=pal1, source=pal3(optpals 21))                                              ⟨272935⟩
palette_copie(destination=pal1, source=pal2(midgames 6))                                              ⟨272944⟩
palette_copie(destination=pal1, source=pal6(convdata type 2 "normal"))                                ⟨272953⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨272961⟩
c10 = Layer(ressource=optshps 116, x=0, y=-63)                                                        ⟨272968⟩
ajoute c10 à scène2                                                                                   ⟨272974⟩
c11 = Layer(ressource=midgames 4, x=0, y=0)                                                           ⟨272981⟩
ajoute c11 à scène2                                                                                   ⟨272987⟩
c12 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)                               ⟨272994⟩
di = c12                                                                                              ⟨272996⟩
ajoute c12 à scène2                                                                                   ⟨273000⟩
tête_image_de_base(tête=c12, image=27)                                                                ⟨273004⟩
charge(midgames 0)                                                                                    ⟨273016⟩
c13 = ToggleLayer(ressource=midgames 0, x=160, y=129, sens=1)                                         ⟨273024⟩
ajoute c13 à scène2                                                                                   ⟨273030⟩
v3452 = 436                                                                                           ⟨273036⟩
v3450 = word_4D392                                                                                    ⟨273038⟩
word_4D392 = &v3452                                                                                   ⟨273040⟩
v3452 = 444                                                                                           ⟨273041⟩
v3448 = 0                                                                                             ⟨273042⟩
v3444 = 0                                                                                             ⟨273043⟩
v3454 = -1                                                                                            ⟨273045⟩
si v13 != 0 :
    charge(asoundfx 5)                                                                                ⟨273057⟩
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨273062⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 5, x=0)                                         ⟨273069⟩
    v332 = word_4EF7E                                                                                 ⟨273072⟩
    v334 = 0                                                                                          ⟨273073⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3454)                                        ⟨273079⟩
        sub_50F5(canal3.+0→4, v3454, v332, v334)                                                      ⟨273086⟩
si = 0                                                                                                ⟨273091⟩
v336 = 1                                                                                              ⟨273092⟩
tant que (scène2.compteur < 25) et (scène2.terminée == 0) :
    si si == 0 :
        CRT_Rand()                                                                                    ⟨273098⟩
        si (CRT_Rand()·7) / 32768 == 0 :
            si = -1                                                                                   ⟨273106⟩
        sinon :
            si si == -1 :
                si = 1                                                                                ⟨273112⟩
            sinon :
                si si == 1 :
                    si = 0                                                                            ⟨273118⟩
    sinon :
        si si == -1 :
            si = 1                                                                                    ⟨273112⟩
        sinon :
            si si == 1 :
                si = 0                                                                                ⟨273118⟩
    déplace(calque=c11, dx=0, dy=si)                                                                  ⟨273126⟩
    déplace(calque=c12, dx=0, dy=si)                                                                  ⟨273132⟩
    déplace(calque=c13, dx=0, dy=si)                                                                  ⟨273139⟩
    v336 = v336 + si                                                                                  ⟨273141⟩
    Scene_Tick(scène=scène2)                                                                          ⟨273151⟩
canal_arrête(canal=canal3)                                                                            ⟨273176⟩
sub_5C1C(&v3452, 2)                                                                                   ⟨273181⟩
v318 = 0                                                                                              ⟨273216⟩
v312 = 0                                                                                              ⟨273218⟩
v299 = 0                                                                                              ⟨273235⟩
v298 = 0                                                                                              ⟨273236⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨273240⟩
si byte_4F55C != 0 :
    v159 = 0                                                                                          ⟨273263⟩
    v158 = 0                                                                                          ⟨273264⟩
    voix_arrête(voix=voix1)                                                                           ⟨273268⟩
    v3392 = 0                                                                                         ⟨273285⟩
    v3387 = 0                                                                                         ⟨273286⟩
    v3386 = 0                                                                                         ⟨273287⟩
    canal_arrête(canal=canal2)                                                                        ⟨273290⟩
    sub_5C1C(&v1318, 2)                                                                               ⟨273295⟩
    v139 = 0                                                                                          ⟨273318⟩
    v138 = 0                                                                                          ⟨273319⟩
    v99 = 0                                                                                           ⟨273361⟩
    v98 = 0                                                                                           ⟨273362⟩
    v89 = 0                                                                                           ⟨273379⟩
    v88 = 0                                                                                           ⟨273380⟩
    v79 = 0                                                                                           ⟨273397⟩
    v78 = 0                                                                                           ⟨273398⟩
    v69 = 0                                                                                           ⟨273415⟩
    v68 = 0                                                                                           ⟨273416⟩
    v59 = 0                                                                                           ⟨273433⟩
    v58 = 0                                                                                           ⟨273434⟩
    v49 = 0                                                                                           ⟨273451⟩
    v48 = 0                                                                                           ⟨273452⟩
    v40 = 0                                                                                           ⟨273497⟩
    v35 = 0                                                                                           ⟨273498⟩
    v34 = 0                                                                                           ⟨273499⟩
    retour                                                                                            ⟨273524⟩

──── scène3 ────
scène3 = Scene_Create(cadence=15, palette=255, surface=&v516)                                         ⟨273533⟩
v300 = 2                                                                                              ⟨273536⟩
v299 = 0                                                                                              ⟨273537⟩
v298 = 0                                                                                              ⟨273538⟩
charge(mid20 1)                                                                                       ⟨273545⟩
charge(mid20 5)                                                                                       ⟨273557⟩
charge(mid20 14)                                                                                      ⟨273569⟩
palette_depuis(pal8(mid20 14))                                                                        ⟨273576⟩
palette_copie(destination=pal1, source=pal5(midgames 22))                                             ⟨273585⟩
palette_copie(destination=pal1, source=pal4(optpals 24))                                              ⟨273594⟩
palette_copie(destination=pal1, source=pal8(mid20 14))                                                ⟨273603⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨273615⟩
c14 = Layer(ressource=optshps 116, x=0, y=-48)                                                        ⟨273622⟩
c15 = Layer(ressource=midgames 20, x=0, y=0)                                                          ⟨273630⟩
ajoute c15 à c14                                                                                      ⟨273635⟩
ajoute c14 à scène3                                                                                   ⟨273640⟩
c16 = Layer(ressource=optshps 44, x=0, y=0)                                                           ⟨273647⟩
ajoute c16 à scène3                                                                                   ⟨273653⟩
c17 = ImageLayer(ressource=midgames 19, x=0, y=90, image=1)                                           ⟨273661⟩
ajoute c17 à scène3                                                                                   ⟨273667⟩
c18 = ImageLayer(ressource=midgames 19, x=0, y=50, image=2)                                           ⟨273675⟩
ajoute c18 à scène3                                                                                   ⟨273681⟩
c19 = Layer(ressource=mid20 5, x=0, y=0)                                                              ⟨273688⟩
ajoute c19 à scène3                                                                                   ⟨273694⟩
c20 = OverlayImageLayer(ressource=mid20 1, x=0, y=0, image=0)                                         ⟨273702⟩
di = c20                                                                                              ⟨273704⟩
ajoute c20 à scène3                                                                                   ⟨273708⟩
c20.image = 1                                                                                         ⟨273710⟩
si = 0                                                                                                ⟨273711⟩
tant que (scène3.compteur < 16) et (scène3.terminée == 0) :
    CRT_Rand()                                                                                        ⟨273715⟩
    v344 = ((CRT_Rand()·3) / 32768) + 1                                                               ⟨273722⟩
    c20.image = v344                                                                                  ⟨273724⟩
    v346 = si                                                                                         ⟨273725⟩
    si = si + 1                                                                                       ⟨273726⟩
    c19.image = v346                                                                                  ⟨273729⟩
    si si + 1 > 5 :
        si = 0                                                                                        ⟨273732⟩
    Scene_Tick(scène=scène3)                                                                          ⟨273744⟩
v318 = 0                                                                                              ⟨273787⟩
v308 = 0                                                                                              ⟨273805⟩
v299 = 0                                                                                              ⟨273822⟩
v298 = 0                                                                                              ⟨273823⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨273827⟩
si byte_4F55C != 0 :
    v159 = 0                                                                                          ⟨273850⟩
    v158 = 0                                                                                          ⟨273851⟩
    voix_arrête(voix=voix1)                                                                           ⟨273855⟩
    v3392 = 0                                                                                         ⟨273872⟩
    v3387 = 0                                                                                         ⟨273873⟩
    v3386 = 0                                                                                         ⟨273874⟩
    canal_arrête(canal=canal2)                                                                        ⟨273877⟩
    sub_5C1C(&v1318, 2)                                                                               ⟨273882⟩
    v139 = 0                                                                                          ⟨273905⟩
    v138 = 0                                                                                          ⟨273906⟩
    v99 = 0                                                                                           ⟨273948⟩
    v98 = 0                                                                                           ⟨273949⟩
    v89 = 0                                                                                           ⟨273966⟩
    v88 = 0                                                                                           ⟨273967⟩
    v79 = 0                                                                                           ⟨273984⟩
    v78 = 0                                                                                           ⟨273985⟩
    v69 = 0                                                                                           ⟨274002⟩
    v68 = 0                                                                                           ⟨274003⟩
    v59 = 0                                                                                           ⟨274020⟩
    v58 = 0                                                                                           ⟨274021⟩
    v49 = 0                                                                                           ⟨274038⟩
    v48 = 0                                                                                           ⟨274039⟩
    v40 = 0                                                                                           ⟨274084⟩
    v35 = 0                                                                                           ⟨274085⟩
    v34 = 0                                                                                           ⟨274086⟩
    retour                                                                                            ⟨274111⟩
charge(midgames 23)                                                                                   ⟨274124⟩
palette_depuis(pal9(midgames 23))                                                                     ⟨274131⟩
charge(mid20 17)                                                                                      ⟨274143⟩
palette_depuis(pal10(mid20 17))                                                                       ⟨274150⟩
charge(mid20 13)                                                                                      ⟨274162⟩
palette_depuis(pal11(mid20 13))                                                                       ⟨274169⟩
charge(midgames 24)                                                                                   ⟨274181⟩
charge(mid20 0)                                                                                       ⟨274193⟩
charge(mid20 8)                                                                                       ⟨274205⟩
v300 = 2                                                                                              ⟨274208⟩
v299 = 0                                                                                              ⟨274209⟩
v298 = 0                                                                                              ⟨274210⟩

──── scène4 ────
scène4 = Scene_Create(cadence=9, palette=255, surface=&v516)                                          ⟨274217⟩
c21 = Layer(ressource=optshps 116, x=0, y=-25)                                                        ⟨274224⟩
c22 = Layer(ressource=midgames 20, x=0, y=1)                                                          ⟨274232⟩
ajoute c22 à c21                                                                                      ⟨274237⟩
ajoute c21 à scène4                                                                                   ⟨274242⟩
c23 = Layer(ressource=midgames 24, x=0, y=-20)                                                        ⟨274249⟩
ajoute c23 à scène4                                                                                   ⟨274255⟩
c24 = ImageLayer(ressource=mid20 0, x=0, y=5, image=3)                                                ⟨274263⟩
ajoute c24 à scène4                                                                                   ⟨274269⟩
c25 = Layer(ressource=mid20 8, x=0, y=-8)                                                             ⟨274276⟩
ajoute c25 à scène4                                                                                   ⟨274282⟩
palette_copie(destination=pal1, source=pal9(midgames 23))                                             ⟨274291⟩
palette_copie(destination=pal1, source=pal11(mid20 13))                                               ⟨274300⟩
palette_copie(destination=pal1, source=pal10(mid20 17))                                               ⟨274309⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨274321⟩
v316 = 3                                                                                              ⟨274323⟩
di = -1                                                                                               ⟨274324⟩
v318 = 1                                                                                              ⟨274325⟩
tant que (scène4.compteur < 40) et (scène4.terminée == 0) :
    si = scène4.compteur                                                                              ⟨274329⟩
    si scène4.compteur == 1 :
        v320 = v318                                                                                   ⟨274333⟩
        v318_avant = v318                                                                             ⟨274334⟩
        v318 = v318 + 1                                                                               ⟨274334⟩
        c25.image = v320                                                                              ⟨274337⟩
    si scène4.compteur > 10 :
        si scène4.compteur & 1 != 0 :
            v322 = v318                                                                               ⟨274345⟩
            v318_avant = v318                                                                         ⟨274346⟩
            v318 = v318 + 1                                                                           ⟨274346⟩
            c25.image = v322                                                                          ⟨274349⟩
    v316 = v316 + di                                                                                  ⟨274352⟩
    si v316 < 0 :
        v316 = 0                                                                                      ⟨274355⟩
    c24.image = v316                                                                                  ⟨274362⟩
    si scène4.compteur == 2 :
        di = 1                                                                                        ⟨274365⟩
    si scène4.compteur == 3 :
        di = -1                                                                                       ⟨274370⟩
    si scène4.compteur == 4 :
        di = 1                                                                                        ⟨274375⟩
    si scène4.compteur == 5 :
        di = -1                                                                                       ⟨274380⟩
    si scène4.compteur == 7 :
        di = 1                                                                                        ⟨274385⟩
    si scène4.compteur == 9 :
        di = -1                                                                                       ⟨274390⟩
    si scène4.compteur == 10 :
        di = 1                                                                                        ⟨274395⟩
    si scène4.compteur == 12 :
        di = 0                                                                                        ⟨274400⟩
    si scène4.compteur == 16 :
        di = 1                                                                                        ⟨274405⟩
    si scène4.compteur == 20 :
        di = 0                                                                                        ⟨274410⟩
    Scene_Tick(scène=scène4)                                                                          ⟨274422⟩
v316 = 6                                                                                              ⟨274445⟩
v6 = 22                                                                                               ⟨274446⟩
v2 = scène4.compteur                                                                                  ⟨274448⟩
di = v2 + ((v6·70) / 100)                                                                             ⟨274457⟩
tant que (scène4.compteur < v2 + ((v6·70) / 100)) et (scène4.terminée == 0) :
    si = scène4.compteur                                                                              ⟨274461⟩
    si scène4.compteur & 1 != 0 :
        si v318 < 33 :
            v320 = v318                                                                               ⟨274467⟩
            v318_avant = v318                                                                         ⟨274468⟩
            v318 = v318 + 1                                                                           ⟨274468⟩
            c25.image = v320                                                                          ⟨274471⟩
    v322 = v316                                                                                       ⟨274475⟩
    v316_avant = v316                                                                                 ⟨274476⟩
    v316 = v316 + 1                                                                                   ⟨274476⟩
    c24.image = v322                                                                                  ⟨274479⟩
    si v316 > 13 :
        v316 = 13                                                                                     ⟨274482⟩
    si (v2 + ((v6·70) / 100)) - 2 == scène4.compteur :
        sub_30AD0(&v588, 0)                                                                           ⟨274492⟩
    Scene_Tick(scène=scène4)                                                                          ⟨274510⟩
si v12 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨274537⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨274544⟩
v299 = 0                                                                                              ⟨274562⟩
v298 = 0                                                                                              ⟨274563⟩
si byte_4F55C != 0 :
    v237 = 0                                                                                          ⟨274585⟩
    v236 = 0                                                                                          ⟨274586⟩
    v227 = 0                                                                                          ⟨274603⟩
    v226 = 0                                                                                          ⟨274604⟩
    v217 = 0                                                                                          ⟨274621⟩
    v216 = 0                                                                                          ⟨274622⟩
    v201 = 0                                                                                          ⟨274643⟩
    v200 = 0                                                                                          ⟨274644⟩
    v185 = 0                                                                                          ⟨274665⟩
    v184 = 0                                                                                          ⟨274666⟩
    v169 = 0                                                                                          ⟨274687⟩
    v168 = 0                                                                                          ⟨274688⟩
    v159 = 0                                                                                          ⟨274705⟩
    v158 = 0                                                                                          ⟨274706⟩
    voix_arrête(voix=voix1)                                                                           ⟨274710⟩
    v3392 = 0                                                                                         ⟨274727⟩
    v3387 = 0                                                                                         ⟨274728⟩
    v3386 = 0                                                                                         ⟨274729⟩
    canal_arrête(canal=canal2)                                                                        ⟨274732⟩
    sub_5C1C(&v1318, 2)                                                                               ⟨274737⟩
    v139 = 0                                                                                          ⟨274760⟩
    v138 = 0                                                                                          ⟨274761⟩
    v99 = 0                                                                                           ⟨274803⟩
    v98 = 0                                                                                           ⟨274804⟩
    v89 = 0                                                                                           ⟨274821⟩
    v88 = 0                                                                                           ⟨274822⟩
    v79 = 0                                                                                           ⟨274839⟩
    v78 = 0                                                                                           ⟨274840⟩
    v69 = 0                                                                                           ⟨274857⟩
    v68 = 0                                                                                           ⟨274858⟩
    v59 = 0                                                                                           ⟨274875⟩
    v58 = 0                                                                                           ⟨274876⟩
    v49 = 0                                                                                           ⟨274893⟩
    v48 = 0                                                                                           ⟨274894⟩
    v40 = 0                                                                                           ⟨274939⟩
    v35 = 0                                                                                           ⟨274940⟩
    v34 = 0                                                                                           ⟨274941⟩
    retour                                                                                            ⟨274966⟩

──── scène5 ────
scène5 = Scene_Create(cadence=9, palette=255, surface=&v516)                                          ⟨274975⟩
v300 = 2                                                                                              ⟨274978⟩
v299 = 0                                                                                              ⟨274979⟩
v298 = 0                                                                                              ⟨274980⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨274985⟩
palette_copie(destination=pal1, source=pal3(optpals 21))                                              ⟨274994⟩
palette_copie(destination=pal1, source=pal2(midgames 6))                                              ⟨275003⟩
palette_copie(destination=pal1, source=pal6(convdata type 2 "normal"))                                ⟨275012⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨275024⟩
c26 = Layer(ressource=optshps 116, x=0, y=-63)                                                        ⟨275031⟩
ajoute c26 à scène5                                                                                   ⟨275037⟩
c27 = Layer(ressource=midgames 4, x=0, y=0)                                                           ⟨275044⟩
ajoute c27 à scène5                                                                                   ⟨275050⟩
c28 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)                               ⟨275057⟩
di = c28                                                                                              ⟨275059⟩
ajoute c28 à scène5                                                                                   ⟨275063⟩
tête_image_de_base(tête=c28, image=25)                                                                ⟨275067⟩
Widget_Method_DispatchC_37052(&v588, 0)                                                               ⟨275072⟩
Widget_Method_Dispatch8_37030(&v588, 127)                                                             ⟨275077⟩
c29 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)                             ⟨275085⟩
ajoute c29 à scène5                                                                                   ⟨275091⟩
v3452 = 436                                                                                           ⟨275097⟩
v3450 = word_4D392                                                                                    ⟨275099⟩
word_4D392 = &v3452                                                                                   ⟨275101⟩
v3452 = 444                                                                                           ⟨275102⟩
v3448 = 0                                                                                             ⟨275103⟩
v3444 = 0                                                                                             ⟨275104⟩
v3454 = -1                                                                                            ⟨275106⟩
si v13 != 0 :
    charge(asoundfx 5)                                                                                ⟨275118⟩
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨275123⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 5, x=0)                                         ⟨275130⟩
    v322 = word_4EF7E                                                                                 ⟨275133⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3454)                                        ⟨275140⟩
        sub_50F5(canal3.+0→4, v3454, v322, mid20 14.+0)                                               ⟨275147⟩
si = 0                                                                                                ⟨275152⟩
v326 = 1                                                                                              ⟨275153⟩
si v12 != 0 :
    Scene_Tick(scène=scène5)                                                                          ⟨275161⟩
    charge(mid20voc 0)                                                                                ⟨275173⟩
    tête_voix(tête=c28, ressource=mid20voc 0, cadence=9)                                              ⟨275179⟩
    v338 = 0                                                                                          ⟨275181⟩
    tant que v338 < 3 :
        Scene_Tick(scène=scène5)                                                                      ⟨275187⟩
        v338 = v338 + 1                                                                               ⟨275189⟩
    tant que tête_parle(tête=c28) != 0 :
        si si == 0 :
            CRT_Rand()                                                                                ⟨275199⟩
            si (CRT_Rand()·7) / 32768 == 0 :
                si = -1                                                                               ⟨275207⟩
            sinon :
                si si == -1 :
                    si = 1                                                                            ⟨275213⟩
                sinon :
                    si si == 1 :
                        si = 0                                                                        ⟨275219⟩
        sinon :
            si si == -1 :
                si = 1                                                                                ⟨275213⟩
            sinon :
                si si == 1 :
                    si = 0                                                                            ⟨275219⟩
        déplace(calque=c27, dx=0, dy=si)                                                              ⟨275227⟩
        déplace(calque=c28, dx=0, dy=si)                                                              ⟨275233⟩
        déplace(calque=c29, dx=0, dy=si)                                                              ⟨275240⟩
        Scene_Tick(scène=scène5)                                                                      ⟨275251⟩
    v338 = 0                                                                                          ⟨275263⟩
    tant que v338 < 10 :
        si si == 0 :
            CRT_Rand()                                                                                ⟨275269⟩
            si (CRT_Rand()·7) / 32768 == 0 :
                si = -1                                                                               ⟨275277⟩
            sinon :
                si si == -1 :
                    si = 1                                                                            ⟨275283⟩
                sinon :
                    si si == 1 :
                        si = 0                                                                        ⟨275289⟩
        sinon :
            si si == -1 :
                si = 1                                                                                ⟨275283⟩
            sinon :
                si si == 1 :
                    si = 0                                                                            ⟨275289⟩
        déplace(calque=c27, dx=0, dy=si)                                                              ⟨275297⟩
        déplace(calque=c28, dx=0, dy=si)                                                              ⟨275303⟩
        déplace(calque=c29, dx=0, dy=si)                                                              ⟨275310⟩
        Scene_Tick(scène=scène5)                                                                      ⟨275321⟩
        v338 = v338 + 1                                                                               ⟨275323⟩
    v336 = 0                                                                                          ⟨275346⟩
    pal8(mid20 14).+0 = 0                                                                             ⟨275348⟩
sinon :
    v6 = 58                                                                                           ⟨275352⟩
    v2 = scène5.compteur                                                                              ⟨275354⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨275363⟩
    tant que (scène5.compteur < v4) et (scène5.terminée == 0) :
        v328 = scène5.compteur                                                                        ⟨275368⟩
        si si == 0 :
            CRT_Rand()                                                                                ⟨275371⟩
            si (CRT_Rand()·7) / 32768 == 0 :
                si = -1                                                                               ⟨275379⟩
            sinon :
                si si == -1 :
                    si = 1                                                                            ⟨275385⟩
                sinon :
                    si si == 1 :
                        si = 0                                                                        ⟨275391⟩
        sinon :
            si si == -1 :
                si = 1                                                                                ⟨275385⟩
            sinon :
                si si == 1 :
                    si = 0                                                                            ⟨275391⟩
        déplace(calque=c27, dx=0, dy=si)                                                              ⟨275399⟩
        déplace(calque=c28, dx=0, dy=si)                                                              ⟨275405⟩
        déplace(calque=c29, dx=0, dy=si)                                                              ⟨275412⟩
        v326 = v326 + si                                                                              ⟨275414⟩
        si v2 + 6 == v328 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[5])                             ⟨275427⟩
        si v2 + 6 == v328 :
            tête_texte_de_lèvres(tête=c28, texte="Yualwzwndmetokelmymzjakl")                          ⟨275437⟩
        si v4 - 1 == v328 :
            sub_30AD0(objet1, 0)                                                                      ⟨275448⟩
        Scene_Tick(scène=scène5)                                                                      ⟨275466⟩
    v6 = 55                                                                                           ⟨275490⟩
    v2 = scène5.compteur                                                                              ⟨275492⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨275501⟩
    tant que (scène5.compteur < v4) et (scène5.terminée == 0) :
        v328 = scène5.compteur                                                                        ⟨275506⟩
        si si == 0 :
            CRT_Rand()                                                                                ⟨275509⟩
            si (CRT_Rand()·7) / 32768 == 0 :
                si = -1                                                                               ⟨275517⟩
            sinon :
                si si == -1 :
                    si = 1                                                                            ⟨275523⟩
                sinon :
                    si si == 1 :
                        si = 0                                                                        ⟨275529⟩
        sinon :
            si si == -1 :
                si = 1                                                                                ⟨275523⟩
            sinon :
                si si == 1 :
                    si = 0                                                                            ⟨275529⟩
        déplace(calque=c27, dx=0, dy=si)                                                              ⟨275537⟩
        déplace(calque=c28, dx=0, dy=si)                                                              ⟨275543⟩
        déplace(calque=c29, dx=0, dy=si)                                                              ⟨275550⟩
        v326 = v326 + si                                                                              ⟨275552⟩
        si v2 + 10 == v328 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[6])                             ⟨275565⟩
        si v2 + 10 == v328 :
            tête_texte_de_lèvres(tête=c28, texte="Yralkyimntjorkdofklhr")                             ⟨275575⟩
        si v2 + 8 == v328 :
            tête_image_de_base(tête=c28, image=14)                                                    ⟨275585⟩
        si v4 - 1 == v328 :
            sub_30AD0(objet1, 0)                                                                      ⟨275596⟩
        Scene_Tick(scène=scène5)                                                                      ⟨275614⟩
canal_arrête(canal=canal3)                                                                            ⟨275640⟩
sub_5C1C(&v3452, 2)                                                                                   ⟨275645⟩
v299 = 0                                                                                              ⟨275681⟩
v298 = 0                                                                                              ⟨275682⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨275686⟩
si byte_4F55C != 0 :
    v237 = 0                                                                                          ⟨275709⟩
    v236 = 0                                                                                          ⟨275710⟩
    v227 = 0                                                                                          ⟨275727⟩
    v226 = 0                                                                                          ⟨275728⟩
    v217 = 0                                                                                          ⟨275745⟩
    v216 = 0                                                                                          ⟨275746⟩
    v201 = 0                                                                                          ⟨275767⟩
    v200 = 0                                                                                          ⟨275768⟩
    v185 = 0                                                                                          ⟨275789⟩
    v184 = 0                                                                                          ⟨275790⟩
    v169 = 0                                                                                          ⟨275811⟩
    v168 = 0                                                                                          ⟨275812⟩
    v159 = 0                                                                                          ⟨275829⟩
    v158 = 0                                                                                          ⟨275830⟩
    voix_arrête(voix=voix1)                                                                           ⟨275834⟩
    v3392 = 0                                                                                         ⟨275851⟩
    v3387 = 0                                                                                         ⟨275852⟩
    v3386 = 0                                                                                         ⟨275853⟩
    canal_arrête(canal=canal2)                                                                        ⟨275856⟩
    sub_5C1C(&v1318, 2)                                                                               ⟨275861⟩
    v139 = 0                                                                                          ⟨275884⟩
    v138 = 0                                                                                          ⟨275885⟩
    v99 = 0                                                                                           ⟨275927⟩
    v98 = 0                                                                                           ⟨275928⟩
    v89 = 0                                                                                           ⟨275945⟩
    v88 = 0                                                                                           ⟨275946⟩
    v79 = 0                                                                                           ⟨275963⟩
    v78 = 0                                                                                           ⟨275964⟩
    v69 = 0                                                                                           ⟨275981⟩
    v68 = 0                                                                                           ⟨275982⟩
    v59 = 0                                                                                           ⟨275999⟩
    v58 = 0                                                                                           ⟨276000⟩
    v49 = 0                                                                                           ⟨276017⟩
    v48 = 0                                                                                           ⟨276018⟩
    v40 = 0                                                                                           ⟨276063⟩
    v35 = 0                                                                                           ⟨276064⟩
    v34 = 0                                                                                           ⟨276065⟩
    retour                                                                                            ⟨276090⟩
charge(mid20 18)                                                                                      ⟨276113⟩
palette_depuis(pal12(mid20 18))                                                                       ⟨276120⟩
charge(mid20 15)                                                                                      ⟨276132⟩
palette_depuis(pal13(mid20 15))                                                                       ⟨276139⟩
charge(mid20 2)                                                                                       ⟨276151⟩
charge(mid20 3)                                                                                       ⟨276163⟩
v300 = 2                                                                                              ⟨276166⟩
v299 = 0                                                                                              ⟨276167⟩
v298 = 0                                                                                              ⟨276168⟩
charge(mid20 4)                                                                                       ⟨276175⟩

──── scène6 ────
scène6 = Scene_Create(cadence=20, palette=255, surface=&v516)                                         ⟨276183⟩
palette_copie(destination=pal1, source=pal5(midgames 22))                                             ⟨276192⟩
palette_copie(destination=pal1, source=pal4(optpals 24))                                              ⟨276201⟩
palette_copie(destination=pal1, source=pal13(mid20 15))                                               ⟨276210⟩
palette_copie(destination=pal1, source=pal12(mid20 18))                                               ⟨276219⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨276231⟩
c30 = Layer(ressource=optshps 116, x=0, y=-35)                                                        ⟨276238⟩
ajoute c30 à scène6                                                                                   ⟨276244⟩
c31 = Layer(ressource=midgames 20, x=0, y=-35)                                                        ⟨276251⟩
ajoute c31 à scène6                                                                                   ⟨276257⟩
c32 = Layer(ressource=optshps 44, x=0, y=-75)                                                         ⟨276264⟩
ajoute c32 à scène6                                                                                   ⟨276270⟩
c33 = ImageLayer(ressource=midgames 19, x=0, y=56, image=2)                                           ⟨276278⟩
ajoute c33 à scène6                                                                                   ⟨276284⟩
c34 = Layer(ressource=mid20 4, x=0, y=6)                                                              ⟨276291⟩
ajoute c34 à scène6                                                                                   ⟨276297⟩
c35 = Layer(ressource=mid20 2, x=-20, y=-2)                                                           ⟨276304⟩
ajoute c35 à scène6                                                                                   ⟨276310⟩
c36 = Layer(ressource=mid20 3, x=-20, y=-2)                                                           ⟨276317⟩
ajoute c36 à scène6                                                                                   ⟨276323⟩
charge(mid20 9)                                                                                       ⟨276335⟩
c37 = Layer(ressource=mid20 9, x=0, y=-70)                                                            ⟨276342⟩
ajoute c37 à scène6                                                                                   ⟨276348⟩
c37.image = 0                                                                                         ⟨276351⟩
c36.image = 0                                                                                         ⟨276353⟩
di = 0                                                                                                ⟨276354⟩
v332 = 0                                                                                              ⟨276355⟩
v334 = 0                                                                                              ⟨276356⟩
v336 = 0                                                                                              ⟨276357⟩
Scene_Tick(scène=scène6)                                                                              ⟨276360⟩
v3452 = 436                                                                                           ⟨276366⟩
v3450 = word_4D392                                                                                    ⟨276368⟩
word_4D392 = &v3452                                                                                   ⟨276370⟩
v3452 = 444                                                                                           ⟨276371⟩
v3448 = 0                                                                                             ⟨276372⟩
v3444 = 0                                                                                             ⟨276373⟩
v3454 = -1                                                                                            ⟨276375⟩
si v13 != 0 :
    charge(asoundfx 105)                                                                              ⟨276387⟩
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨276392⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 105, x=0)                                       ⟨276399⟩
    v348 = word_4F046                                                                                 ⟨276402⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3454)                                        ⟨276409⟩
        sub_50F5(canal3.+0→4, v3454, v348, mid20 11.+0)                                               ⟨276416⟩
v356 = 2                                                                                              ⟨276422⟩
v355 = 0                                                                                              ⟨276423⟩
v354 = 0                                                                                              ⟨276424⟩
si v12 != 0 :
    charge(mid20voc 1)                                                                                ⟨276433⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid20voc 1)                                 ⟨276439⟩
Widget_Method_DispatchC_37052(objet1, 0)                                                              ⟨276446⟩
Widget_Method_Dispatch8_37030(objet1, 212)                                                            ⟨276451⟩
tant que (scène6.compteur < 186) et (scène6.terminée == 0) :
    si = scène6.compteur                                                                              ⟨276456⟩
    v362 = v332                                                                                       ⟨276458⟩
    v332_avant = v332                                                                                 ⟨276459⟩
    v332 = v332 + 1                                                                                   ⟨276459⟩
    c37.image = v362                                                                                  ⟨276462⟩
    si scène6.compteur < 40 :
        déplace(calque=c37, dx=0, dy=1)                                                               ⟨276470⟩
    si scène6.compteur > 40 :
        si scène6.compteur < 60 :
            si scène6.compteur & 1 != 0 :
                déplace(calque=c37, dx=0, dy=1)                                                       ⟨276485⟩
    si scène6.compteur == 20 :
        si v12 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨276496⟩
    si scène6.compteur == 20 :
        si v12 == 0 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[8])                             ⟨276513⟩
    si scène6.compteur == 60 :
        si v12 == 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨276526⟩
    si scène6.compteur > 0 :
        si scène6.compteur < 5 :
            v364 = di                                                                                 ⟨276534⟩
            di = di + 1                                                                               ⟨276535⟩
            c36.image = v364                                                                          ⟨276538⟩
    si scène6.compteur > 5 :
        si scène6.compteur < 15 :
            v366 = v334                                                                               ⟨276546⟩
            v334_avant = v334                                                                         ⟨276547⟩
            v334 = v334 + 1                                                                           ⟨276547⟩
            c35.image = v366                                                                          ⟨276550⟩
    si scène6.compteur > 19 :
        si scène6.compteur < 51 :
            si scène6.compteur & 1 != 0 :
                v368 = di                                                                             ⟨276559⟩
                di = di + 1                                                                           ⟨276560⟩
                c36.image = v368                                                                      ⟨276563⟩
    si scène6.compteur > 51 :
        si scène6.compteur < 61 :
            si scène6.compteur & 1 != 0 :
                v370 = di                                                                             ⟨276572⟩
                di = di - 1                                                                           ⟨276573⟩
                c36.image = v370                                                                      ⟨276576⟩
    si scène6.compteur > 61 :
        si scène6.compteur < 71 :
            si scène6.compteur & 1 != 0 :
                v372 = di                                                                             ⟨276585⟩
                di = di + 1                                                                           ⟨276586⟩
                c36.image = v372                                                                      ⟨276589⟩
    si scène6.compteur > 45 :
        si scène6.compteur < 55 :
            v374 = v336                                                                               ⟨276597⟩
            v336_avant = v336                                                                         ⟨276598⟩
            v336 = v336 + 1                                                                           ⟨276598⟩
            c35.image = v374                                                                          ⟨276601⟩
    si scène6.compteur == 87 :
        di = di - 2                                                                                   ⟨276606⟩
    si scène6.compteur == 110 :
        v376 = di                                                                                     ⟨276611⟩
        di = di + 1                                                                                   ⟨276612⟩
        c36.image = v376                                                                              ⟨276615⟩
    si scène6.compteur == 141 :
        di = di - 1                                                                                   ⟨276621⟩
        c36.image = di                                                                                ⟨276624⟩
    Scene_Tick(scène=scène6)                                                                          ⟨276647⟩
si v12 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨276674⟩
scène6.compteur = 0                                                                                   ⟨276678⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=2, premier=0, nombre=256)                           ⟨276686⟩
v355 = 0                                                                                              ⟨276704⟩
v354 = 0                                                                                              ⟨276705⟩
canal_arrête(canal=canal3)                                                                            ⟨276708⟩
sub_5C1C(&v3452, 2)                                                                                   ⟨276713⟩
v322 = 0                                                                                              ⟨276750⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨276754⟩
v299 = 0                                                                                              ⟨276772⟩
v298 = 0                                                                                              ⟨276773⟩
v289 = 0                                                                                              ⟨276790⟩
v288 = 0                                                                                              ⟨276791⟩
v279 = 0                                                                                              ⟨276808⟩
v278 = 0                                                                                              ⟨276809⟩
v263 = 0                                                                                              ⟨276830⟩
v262 = 0                                                                                              ⟨276831⟩
v247 = 0                                                                                              ⟨276852⟩
v246 = 0                                                                                              ⟨276853⟩
v237 = 0                                                                                              ⟨276870⟩
v236 = 0                                                                                              ⟨276871⟩
v227 = 0                                                                                              ⟨276888⟩
v226 = 0                                                                                              ⟨276889⟩
v217 = 0                                                                                              ⟨276906⟩
v216 = 0                                                                                              ⟨276907⟩
v201 = 0                                                                                              ⟨276928⟩
v200 = 0                                                                                              ⟨276929⟩
v185 = 0                                                                                              ⟨276950⟩
v184 = 0                                                                                              ⟨276951⟩
v169 = 0                                                                                              ⟨276972⟩
v168 = 0                                                                                              ⟨276973⟩
v159 = 0                                                                                              ⟨276990⟩
v158 = 0                                                                                              ⟨276991⟩
voix_arrête(voix=voix1)                                                                               ⟨276995⟩
v3392 = 0                                                                                             ⟨277012⟩
v3387 = 0                                                                                             ⟨277013⟩
v3386 = 0                                                                                             ⟨277014⟩
canal_arrête(canal=canal2)                                                                            ⟨277017⟩
sub_5C1C(&v1318, 2)                                                                                   ⟨277022⟩
v139 = 0                                                                                              ⟨277045⟩
v138 = 0                                                                                              ⟨277046⟩
v99 = 0                                                                                               ⟨277088⟩
v98 = 0                                                                                               ⟨277089⟩
v89 = 0                                                                                               ⟨277106⟩
v88 = 0                                                                                               ⟨277107⟩
v79 = 0                                                                                               ⟨277124⟩
v78 = 0                                                                                               ⟨277125⟩
v69 = 0                                                                                               ⟨277142⟩
v68 = 0                                                                                               ⟨277143⟩
v59 = 0                                                                                               ⟨277160⟩
v58 = 0                                                                                               ⟨277161⟩
v49 = 0                                                                                               ⟨277178⟩
v48 = 0                                                                                               ⟨277179⟩
v40 = 0                                                                                               ⟨277224⟩
v35 = 0                                                                                               ⟨277225⟩
v34 = 0                                                                                               ⟨277226⟩
retour                                                                                                ⟨277251⟩
```

## Tableaux du segment de données

