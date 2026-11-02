# Script extrait de `Midgame33_Play_9CBE0` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## Midgame33_Play_9CBE0

```
bp = sp                                                                                               ⟨277492⟩
v1 = 0                                                                                                ⟨277496⟩
CRT_Strcpy(&v374, 11352)                                                                              ⟨277500⟩
CRT_Strcpy(&v416, 11353)                                                                              ⟨277505⟩
CRT_Strcpy(&v460, 11354)                                                                              ⟨277510⟩
tableau_textes(tableau=textes1, nombre=18, longueur=200)                                              ⟨277521⟩
byte_4F55C = 0                                                                                        ⟨277523⟩
v19 = 0                                                                                               ⟨277524⟩
v20 = 0                                                                                               ⟨277525⟩
v21 = 0                                                                                               ⟨277526⟩
si word_4CA5B != 0 :
    v20 = 1                                                                                           ⟨277529⟩
v24 = word_4D36E                                                                                      ⟨277533⟩
v554 = 0                                                                                              ⟨277534⟩
TextFormat_ApplyStyleAttribute_357D1(&v554, v24)                                                      ⟨277539⟩
v568 = 0                                                                                              ⟨277541⟩
TextRenderer_ApplyFormatChange_3584E(&v568, 0)                                                        ⟨277550⟩
sub_3499B(&v28, &v568)                                                                                ⟨277556⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨277562⟩
v38 = 0                                                                                               ⟨277568⟩
sub_435F1(pak midgames)                                                                               ⟨277590⟩
si v20 != 0 :
    si sub_993C(chemin1) != 0 :
        pak mid33voc.ouvre(chemin1, 1)                                                                ⟨277621⟩
        sub_435F1(pak mid33voc)                                                                       ⟨277625⟩
    sinon :
        v20 = 0                                                                                       ⟨277630⟩
sinon :
    v20 = 0                                                                                           ⟨277630⟩
v48 = 0                                                                                               ⟨277633⟩
v43 = 0                                                                                               ⟨277635⟩
v42 = 0                                                                                               ⟨277636⟩
v50 = byte_4CA58                                                                                      ⟨277638⟩
si v50 - 1 <= 4 :
    si (v50 - 1)·2 == 0 ou ((v50 - 1)·2 != 2) et (((v50 - 1)·2 != 4) et (((v50 - 1)·2 != 6) et ((v50 - 1)·2 != 8))) :
        si sub_993C(chemin1) != 0 :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨277682⟩
            sub_435F1(pak rsoundfx)                                                                   ⟨277686⟩
            flux_iff(flux=flux1)                                                                      ⟨277700⟩
            v3215 = 256                                                                               ⟨277703⟩
            v3219 = 0                                                                                 ⟨277704⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨277712⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨277718⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨277724⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨277728⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨277730⟩
            di = 1                                                                                    ⟨277731⟩
            tant que di <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨277737⟩
                ds:26002[di·2] = iff_lit_mot(flux=flux1)                                              ⟨277741⟩
                di = di + 1                                                                           ⟨277742⟩
            iff_ferme_form(flux=flux1)                                                                ⟨277749⟩
            v21 = 1                                                                                   ⟨277751⟩
            iff_ferme_form(flux=flux1)                                                                ⟨277755⟩
        si sub_993C(chemin1) != 0 :
            v19 = 1                                                                                   ⟨277781⟩
            si v21 == 0 :
                word_4F048 = 90                                                                       ⟨277786⟩
    sinon :
        si sub_993C(chemin1) != 0 :
            si word_4CA5D != 0 :
                pak asoundfx.ouvre(chemin1, 1)                                                        ⟨277823⟩
                flux_iff(flux=flux1)                                                                  ⟨277837⟩
                v3215 = 256                                                                           ⟨277840⟩
                v3219 = 0                                                                             ⟨277841⟩
                flux1.ouvre(chemin1, 1)                                                               ⟨277849⟩
                iff_form(flux=flux1, balise='VOLU', x=0)                                              ⟨277855⟩
                iff_chunk(flux=flux1, balise='ADLB', x=1)                                             ⟨277861⟩
                iff_lit_mot(flux=flux1)                                                               ⟨277865⟩
                word_4F048 = iff_lit_mot(flux=flux1)                                                  ⟨277867⟩
                di = 1                                                                                ⟨277868⟩
                tant que di <= 106 :
                    iff_lit_mot(flux=flux1)                                                           ⟨277874⟩
                    ds:26002[di·2] = iff_lit_mot(flux=flux1)                                          ⟨277878⟩
                    di = di + 1                                                                       ⟨277879⟩
                iff_ferme_form(flux=flux1)                                                            ⟨277886⟩
                v21 = 1                                                                               ⟨277888⟩
                iff_ferme_form(flux=flux1)                                                            ⟨277892⟩
        si sub_993C(chemin1) != 0 :
            v19 = 1                                                                                   ⟨277935⟩
            si v21 == 0 :
                word_4F048 = 255                                                                      ⟨277940⟩
si v21 != 0 :
    v3152 = word_4D392                                                                                ⟨277953⟩
    word_4D392 = &v3154                                                                               ⟨277955⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨277964⟩
    charge(asoundfx 76)                                                                               ⟨277976⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 76, x=0)                                        ⟨277983⟩
    canal_arrête(canal=canal1)                                                                        ⟨277987⟩
    v282 = 0                                                                                          ⟨278006⟩
    canal_arrête(canal=canal1)                                                                        ⟨278009⟩
    sub_5C1C(&v3154, 2)                                                                               ⟨278014⟩
v938 = 436                                                                                            ⟨278018⟩
v936 = word_4D392                                                                                     ⟨278020⟩
word_4D392 = &v938                                                                                    ⟨278022⟩
v938 = 444                                                                                            ⟨278023⟩
v942 = 0                                                                                              ⟨278026⟩
si v19 != 0 :
    sub_435F1(pak mmusic)                                                                             ⟨278042⟩
    si v20 != 0 :
        v279 = 18                                                                                     ⟨278046⟩
    sinon :
        v279 = 17                                                                                     ⟨278050⟩
    charge(mmusic v279)                                                                               ⟨278061⟩
    canal_init(canal=canal2, pilote=word_4CA59)                                                       ⟨278066⟩
    canal_enregistre(canal=canal2, ressource=mmusic v279, x=0)                                        ⟨278073⟩
v951 = booléen                                                                                        ⟨278090⟩
v947 = booléen                                                                                        ⟨278091⟩
si v20 != 0 :
    voix_pilote(voix=voix1, pilote=word_4CA5B)                                                        ⟨278097⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨278114⟩
    v3215 = 256                                                                                       ⟨278117⟩
    v3219 = 0                                                                                         ⟨278118⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨278126⟩
    iff_form(flux=flux1, balise='MG33', x=0)                                                          ⟨278132⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨278138⟩
    di = 0                                                                                            ⟨278140⟩
    tant que di < 18 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨278148⟩
        v280 = v3198                                                                                  ⟨278151⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·di), taille=v280)                    ⟨278162⟩
        v3211 = v3194                                                                                 ⟨278165⟩
        di = di + 1                                                                                   ⟨278166⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨278173⟩
    si CRT_Strlen(arg_10) != 0 :
        CRT_Strcat(textes1[2], arg_10)                                                                ⟨278186⟩
        CRT_Strcat(textes1[2], 11358)                                                                 ⟨278194⟩
    sinon :
        si CRT_Strlen(arg_6) != 0 :
            CRT_Strcat(textes1[2], arg_6)                                                             ⟨278210⟩
            CRT_Strcat(textes1[2], 11358)                                                             ⟨278218⟩
        sinon :
            si CRT_Strlen(arg_8) != 0 :
                CRT_Strcat(textes1[2], arg_8)                                                         ⟨278234⟩
                CRT_Strcat(textes1[2], 11358)                                                         ⟨278242⟩
            sinon :
                CRT_Strcat(textes1[2], textes1[3])                                                    ⟨278258⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[8], 11355)                                                                 ⟨278273⟩
        CRT_Strcat(textes1[8], arg_6)                                                                 ⟨278281⟩
        CRT_Strcat(textes1[8], 11358)                                                                 ⟨278289⟩
    sinon :
        si CRT_Strlen(arg_8) != 0 :
            CRT_Strcat(textes1[8], 11355)                                                             ⟨278305⟩
            CRT_Strcat(textes1[8], arg_8)                                                             ⟨278313⟩
            CRT_Strcat(textes1[8], 11358)                                                             ⟨278321⟩
        sinon :
            si CRT_Strlen(arg_10) != 0 :
                CRT_Strcat(textes1[8], 11355)                                                         ⟨278337⟩
                CRT_Strcat(textes1[8], arg_10)                                                        ⟨278345⟩
                CRT_Strcat(textes1[8], 11358)                                                         ⟨278353⟩
            sinon :
                CRT_Strcat(textes1[8], 11358)                                                         ⟨278364⟩
    si CRT_Strlen(arg_10) != 0 :
        CRT_Strcat(textes1[16], arg_10)                                                               ⟨278379⟩
        CRT_Strcat(textes1[16], 11358)                                                                ⟨278387⟩
    sinon :
        si CRT_Strlen(arg_6) != 0 :
            CRT_Strcat(textes1[16], arg_6)                                                            ⟨278403⟩
            CRT_Strcat(textes1[16], 11358)                                                            ⟨278411⟩
        sinon :
            si CRT_Strlen(arg_8) != 0 :
                CRT_Strcat(textes1[16], arg_8)                                                        ⟨278427⟩
                CRT_Strcat(textes1[16], 11358)                                                        ⟨278435⟩
            sinon :
                CRT_Strcat(textes1[16], textes1[17])                                                  ⟨278451⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨278458⟩
si CRT_Strlen(arg_10) != 0 :
    CRT_Strcat(&v460, 11362)                                                                          ⟨278475⟩
    CRT_Strcat(&v460, arg_10)                                                                         ⟨278480⟩
    CRT_Strcat(&v460, 11362)                                                                          ⟨278485⟩
sinon :
    CRT_Strcat(&v460, 11362)                                                                          ⟨278493⟩
    CRT_Strcat(&v460, 11409)                                                                          ⟨278498⟩
    CRT_Strcat(&v460, 11362)                                                                          ⟨278503⟩
CRT_Strlen(arg_8)                                                                                     ⟨278508⟩
CRT_Strlen(arg_6)                                                                                     ⟨278512⟩
si (CRT_Strlen(arg_8) + CRT_Strlen(arg_6)) + 1 > 21 :
    v1 = 1                                                                                            ⟨278519⟩
si CRT_Strlen(arg_6) != 0 :
    CRT_Strcat(&v374, arg_6)                                                                          ⟨278530⟩
    si v1 != 0 :
        si CRT_Strlen(arg_8) == 0 :
            v1 = 0                                                                                    ⟨278539⟩
        sinon :
            CRT_Strcat(&v416, arg_8)                                                                  ⟨278546⟩
    sinon :
        CRT_Strcat(&v374, 11360)                                                                      ⟨278556⟩
        CRT_Strcat(&v374, arg_8)                                                                      ⟨278561⟩
sinon :
    v1 = 0                                                                                            ⟨278568⟩
    CRT_Strcat(&v374, arg_8)                                                                          ⟨278572⟩
si CRT_Strlen(&v374) == 0 :
    CRT_Strcat(&v374, 11417)                                                                          ⟨278585⟩
charge(midgames 42)                                                                                   ⟨278599⟩
charge(midgames 44)                                                                                   ⟨278611⟩
charge_convdata_type2("normal")                                                                       ⟨278621⟩
palette_depuis(pal2(convdata type 2 "normal"))                                                        ⟨278628⟩
charge(midgames 37)                                                                                   ⟨278640⟩
palette_depuis(pal3(midgames 37))                                                                     ⟨278647⟩
charge(midgames 43)                                                                                   ⟨278659⟩
palette_depuis(pal4(midgames 43))                                                                     ⟨278666⟩
charge(midgames 45)                                                                                   ⟨278678⟩
palette_depuis(pal5(midgames 45))                                                                     ⟨278685⟩
charge(midgames 40)                                                                                   ⟨278697⟩
palette_depuis(pal6(midgames 40))                                                                     ⟨278704⟩
charge(midgames 41)                                                                                   ⟨278716⟩
palette_depuis(pal7(midgames 41))                                                                     ⟨278723⟩
charge(midgames 29)                                                                                   ⟨278735⟩
charge(midgames 33)                                                                                   ⟨278747⟩
charge(midgames 34)                                                                                   ⟨278759⟩
charge(midgames 35)                                                                                   ⟨278771⟩
charge_convdata_type0("billy", drapeau=3)                                                             ⟨278781⟩
charge_convdata_type0("tex", drapeau=3)                                                               ⟨278791⟩
charge_convdata_type0("gwen", drapeau=3)                                                              ⟨278801⟩
charge_convdata_type0("miguel", drapeau=3)                                                            ⟨278811⟩
v256 = 0                                                                                              ⟨278813⟩
v252 = 2                                                                                              ⟨278814⟩
v251 = 0                                                                                              ⟨278815⟩
v250 = 0                                                                                              ⟨278816⟩
TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                       ⟨278830⟩
v258 = ?                                                                                              ⟨278832⟩
v260 = TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                ⟨278833⟩
v256 = v260                                                                                           ⟨278835⟩
v252 = 2                                                                                              ⟨278836⟩
v251 = 1                                                                                              ⟨278837⟩
v250 = 0                                                                                              ⟨278838⟩
GlyphObject_ConstructWithBuffer_36D56(&v3052, &v256)                                                  ⟨278843⟩
v3378 = 0                                                                                             ⟨278849⟩
v3376 = 152                                                                                           ⟨278850⟩
v3374 = 319                                                                                           ⟨278851⟩
v3372 = 199                                                                                           ⟨278852⟩
sub_30A1D(&v3086, word_4D36E, &v3052)                                                                 ⟨278855⟩
Widget_Method_DispatchC_37052(&v3086, 0)                                                              ⟨278860⟩
Widget_Method_Dispatch8_37030(&v3086, 200)                                                            ⟨278865⟩
v270 = 0                                                                                              ⟨278867⟩
v266 = 2                                                                                              ⟨278868⟩
v265 = 0                                                                                              ⟨278869⟩
v264 = 0                                                                                              ⟨278870⟩
TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                       ⟨278884⟩
v272 = ?                                                                                              ⟨278886⟩
v274 = TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                ⟨278887⟩
v270 = v274                                                                                           ⟨278889⟩
v266 = 2                                                                                              ⟨278890⟩
v265 = 1                                                                                              ⟨278891⟩
v264 = 0                                                                                              ⟨278892⟩
GlyphObject_ConstructWithBuffer_36D56(&v3110, &v270)                                                  ⟨278897⟩
v3378 = 94                                                                                            ⟨278904⟩
v3376 = 64                                                                                            ⟨278905⟩
v3374 = 135                                                                                           ⟨278906⟩
v3372 = 20                                                                                            ⟨278907⟩
sub_30A1D(&v3144, &v568, &v3110)                                                                      ⟨278910⟩
si byte_4F55C != 0 :
    v270 = 0                                                                                          ⟨278942⟩
    v265 = 0                                                                                          ⟨278943⟩
    v264 = 0                                                                                          ⟨278944⟩
    v256 = 0                                                                                          ⟨278969⟩
    v251 = 0                                                                                          ⟨278970⟩
    v250 = 0                                                                                          ⟨278971⟩
    v241 = 0                                                                                          ⟨278988⟩
    v240 = 0                                                                                          ⟨278989⟩
    v231 = 0                                                                                          ⟨279006⟩
    v230 = 0                                                                                          ⟨279007⟩
    v221 = 0                                                                                          ⟨279024⟩
    v220 = 0                                                                                          ⟨279025⟩
    v211 = 0                                                                                          ⟨279042⟩
    v210 = 0                                                                                          ⟨279043⟩
    v201 = 0                                                                                          ⟨279060⟩
    v200 = 0                                                                                          ⟨279061⟩
    v191 = 0                                                                                          ⟨279078⟩
    v190 = 0                                                                                          ⟨279079⟩
    v181 = 0                                                                                          ⟨279096⟩
    v180 = 0                                                                                          ⟨279097⟩
    v171 = 0                                                                                          ⟨279114⟩
    v170 = 0                                                                                          ⟨279115⟩
    v155 = 0                                                                                          ⟨279136⟩
    v154 = 0                                                                                          ⟨279137⟩
    v139 = 0                                                                                          ⟨279158⟩
    v138 = 0                                                                                          ⟨279159⟩
    v123 = 0                                                                                          ⟨279180⟩
    v122 = 0                                                                                          ⟨279181⟩
    v107 = 0                                                                                          ⟨279202⟩
    v106 = 0                                                                                          ⟨279203⟩
    v91 = 0                                                                                           ⟨279224⟩
    v90 = 0                                                                                           ⟨279225⟩
    v75 = 0                                                                                           ⟨279246⟩
    v74 = 0                                                                                           ⟨279247⟩
    v65 = 0                                                                                           ⟨279264⟩
    v64 = 0                                                                                           ⟨279265⟩
    v55 = 0                                                                                           ⟨279282⟩
    v54 = 0                                                                                           ⟨279283⟩
    voix_arrête(voix=voix1)                                                                           ⟨279287⟩
    v3012 = 0                                                                                         ⟨279304⟩
    v3007 = 0                                                                                         ⟨279305⟩
    v3006 = 0                                                                                         ⟨279306⟩
    canal_arrête(canal=canal2)                                                                        ⟨279309⟩
    sub_5C1C(&v938, 2)                                                                                ⟨279314⟩
    v43 = 0                                                                                           ⟨279337⟩
    v42 = 0                                                                                           ⟨279338⟩
    retour                                                                                            ⟨279373⟩
si v19 != 0 :
    v276 = word_4F048                                                                                 ⟨279379⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v940)                                         ⟨279386⟩
        sub_50F5(canal2.+0→4, v940, v276, 0)                                                          ⟨279393⟩

──── scène1 ────
scène1 = Scene_Create(cadence=6, palette=255, surface=&v554)                                          ⟨279404⟩
c1 = Layer(ressource=midgames 42, x=0, y=-80)                                                         ⟨279411⟩
c2 = Layer(ressource=midgames 33, x=0, y=0)                                                           ⟨279419⟩
c3 = Layer(ressource=midgames 34, x=0, y=0)                                                           ⟨279427⟩
c4 = Layer(ressource=midgames 35, x=0, y=0)                                                           ⟨279435⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨279445⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨279454⟩
ajoute c1 à scène1                                                                                    ⟨279459⟩
ajoute c2 à scène1                                                                                    ⟨279464⟩
ajoute c3 à scène1                                                                                    ⟨279469⟩
ajoute c4 à scène1                                                                                    ⟨279474⟩
fondu_disparition(palette=pal1, couleur=&v38, pas=0, premier=0, nombre=256)                           ⟨279487⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨279496⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨279505⟩
Scene_Tick(scène=scène1)                                                                              ⟨279509⟩
fondu_apparition(palette=pal1, couleur=&v38, pas=2, premier=0, nombre=256)                            ⟨279518⟩
si v20 != 0 :
    Scene_Tick(scène=scène1)                                                                          ⟨279527⟩
    charge(mid33voc 0)                                                                                ⟨279539⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 0)                                 ⟨279545⟩
    di = 0                                                                                            ⟨279547⟩
    tant que di < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨279553⟩
        di = di + 1                                                                                   ⟨279555⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨279563⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si touche_passer() != 0 : aller à loc_9E536                                                   ⟨279570⟩
        Scene_Tick(scène=scène1)                                                                      ⟨279576⟩
    loc_9E536:                                                                                        ⟨279587⟩
    di = 0                                                                                            ⟨279588⟩
    tant que di < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨279594⟩
        di = di + 1                                                                                   ⟨279596⟩
    voix_arrête(voix=voix1)                                                                           ⟨279603⟩
    v290 = 0                                                                                          ⟨279622⟩
sinon :
    Widget_Method_DispatchC_37052(&v3086, 0)                                                          ⟨279629⟩
    Widget_Method_Dispatch8_37030(&v3086, 12)                                                         ⟨279634⟩
    v14 = 53                                                                                          ⟨279636⟩
    si = scène1.compteur                                                                              ⟨279637⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨279646⟩
    tant que (scène1.compteur < v12) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨279650⟩
        si si + 3 == scène1.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[0])                             ⟨279658⟩
        si v12 - 1 == scène1.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨279669⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨279679⟩
            aller à loc_9E652                                                                         ⟨279681⟩
        Scene_Tick(scène=scène1)                                                                      ⟨279686⟩
    loc_9E652:                                                                                        ⟨279708⟩
    si byte_4F55C != 0 :
        Scene_Destruct(scène=scène1, drapeaux=0)                                                      ⟨279717⟩
        v270 = 0                                                                                      ⟨279743⟩
        v265 = 0                                                                                      ⟨279744⟩
        v264 = 0                                                                                      ⟨279745⟩
        v256 = 0                                                                                      ⟨279770⟩
        v251 = 0                                                                                      ⟨279771⟩
        v250 = 0                                                                                      ⟨279772⟩
        v241 = 0                                                                                      ⟨279789⟩
        v240 = 0                                                                                      ⟨279790⟩
        v231 = 0                                                                                      ⟨279807⟩
        v230 = 0                                                                                      ⟨279808⟩
        v221 = 0                                                                                      ⟨279825⟩
        v220 = 0                                                                                      ⟨279826⟩
        v211 = 0                                                                                      ⟨279843⟩
        v210 = 0                                                                                      ⟨279844⟩
        v201 = 0                                                                                      ⟨279861⟩
        v200 = 0                                                                                      ⟨279862⟩
        v191 = 0                                                                                      ⟨279879⟩
        v190 = 0                                                                                      ⟨279880⟩
        v181 = 0                                                                                      ⟨279897⟩
        v180 = 0                                                                                      ⟨279898⟩
        v171 = 0                                                                                      ⟨279915⟩
        v170 = 0                                                                                      ⟨279916⟩
        v155 = 0                                                                                      ⟨279937⟩
        v154 = 0                                                                                      ⟨279938⟩
        v139 = 0                                                                                      ⟨279959⟩
        v138 = 0                                                                                      ⟨279960⟩
        v123 = 0                                                                                      ⟨279981⟩
        v122 = 0                                                                                      ⟨279982⟩
        v107 = 0                                                                                      ⟨280003⟩
        v106 = 0                                                                                      ⟨280004⟩
        v91 = 0                                                                                       ⟨280025⟩
        v90 = 0                                                                                       ⟨280026⟩
        v75 = 0                                                                                       ⟨280047⟩
        v74 = 0                                                                                       ⟨280048⟩
        v65 = 0                                                                                       ⟨280065⟩
        v64 = 0                                                                                       ⟨280066⟩
        v55 = 0                                                                                       ⟨280083⟩
        v54 = 0                                                                                       ⟨280084⟩
        voix_arrête(voix=voix1)                                                                       ⟨280088⟩
        v3012 = 0                                                                                     ⟨280105⟩
        v3007 = 0                                                                                     ⟨280106⟩
        v3006 = 0                                                                                     ⟨280107⟩
        canal_arrête(canal=canal2)                                                                    ⟨280110⟩
        sub_5C1C(&v938, 2)                                                                            ⟨280115⟩
        v43 = 0                                                                                       ⟨280138⟩
        v42 = 0                                                                                       ⟨280139⟩
        retour                                                                                        ⟨280174⟩
    v14 = 61                                                                                          ⟨280177⟩
    si = scène1.compteur                                                                              ⟨280178⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨280187⟩
    tant que (scène1.compteur < v12) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨280191⟩
        si si + 1 == scène1.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[1])                             ⟨280201⟩
        si v12 - 1 == scène1.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨280212⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨280222⟩
            aller à loc_9ECE3                                                                         ⟨280224⟩
        Scene_Tick(scène=scène1)                                                                      ⟨280229⟩
loc_9ECE3:                                                                                            ⟨280251⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨280255⟩
si byte_4F55C != 0 :
    v270 = 0                                                                                          ⟨280286⟩
    v265 = 0                                                                                          ⟨280287⟩
    v264 = 0                                                                                          ⟨280288⟩
    v256 = 0                                                                                          ⟨280313⟩
    v251 = 0                                                                                          ⟨280314⟩
    v250 = 0                                                                                          ⟨280315⟩
    v241 = 0                                                                                          ⟨280332⟩
    v240 = 0                                                                                          ⟨280333⟩
    v231 = 0                                                                                          ⟨280350⟩
    v230 = 0                                                                                          ⟨280351⟩
    v221 = 0                                                                                          ⟨280368⟩
    v220 = 0                                                                                          ⟨280369⟩
    v211 = 0                                                                                          ⟨280386⟩
    v210 = 0                                                                                          ⟨280387⟩
    v201 = 0                                                                                          ⟨280404⟩
    v200 = 0                                                                                          ⟨280405⟩
    v191 = 0                                                                                          ⟨280422⟩
    v190 = 0                                                                                          ⟨280423⟩
    v181 = 0                                                                                          ⟨280440⟩
    v180 = 0                                                                                          ⟨280441⟩
    v171 = 0                                                                                          ⟨280458⟩
    v170 = 0                                                                                          ⟨280459⟩
    v155 = 0                                                                                          ⟨280480⟩
    v154 = 0                                                                                          ⟨280481⟩
    v139 = 0                                                                                          ⟨280502⟩
    v138 = 0                                                                                          ⟨280503⟩
    v123 = 0                                                                                          ⟨280524⟩
    v122 = 0                                                                                          ⟨280525⟩
    v107 = 0                                                                                          ⟨280546⟩
    v106 = 0                                                                                          ⟨280547⟩
    v91 = 0                                                                                           ⟨280568⟩
    v90 = 0                                                                                           ⟨280569⟩
    v75 = 0                                                                                           ⟨280590⟩
    v74 = 0                                                                                           ⟨280591⟩
    v65 = 0                                                                                           ⟨280608⟩
    v64 = 0                                                                                           ⟨280609⟩
    v55 = 0                                                                                           ⟨280626⟩
    v54 = 0                                                                                           ⟨280627⟩
    voix_arrête(voix=voix1)                                                                           ⟨280631⟩
    v3012 = 0                                                                                         ⟨280648⟩
    v3007 = 0                                                                                         ⟨280649⟩
    v3006 = 0                                                                                         ⟨280650⟩
    canal_arrête(canal=canal2)                                                                        ⟨280653⟩
    sub_5C1C(&v938, 2)                                                                                ⟨280658⟩
    v43 = 0                                                                                           ⟨280681⟩
    v42 = 0                                                                                           ⟨280682⟩
    retour                                                                                            ⟨280717⟩
charge(midgames 32)                                                                                   ⟨280730⟩
charge(midgames 39)                                                                                   ⟨280742⟩

──── scène2 ────
scène2 = Scene_Create(cadence=6, palette=255, surface=&v554)                                          ⟨280750⟩
c5 = Layer(ressource=midgames 32, x=0, y=0)                                                           ⟨280757⟩
si v1 != 0 :
    v302 = 0                                                                                          ⟨280762⟩
    v304 = 7                                                                                          ⟨280763⟩
    v306 = 14                                                                                         ⟨280764⟩
sinon :
    v302 = 4                                                                                          ⟨280768⟩
    v304 = 11                                                                                         ⟨280769⟩
    v306 = 0                                                                                          ⟨280770⟩
c6 = TextLayer(zone=&v3144, x=0, y=v302)                                                              ⟨280778⟩
c7 = TextLayer(zone=&v3144, x=0, y=v304)                                                              ⟨280786⟩
c8 = TextLayer(zone=&v3144, x=0, y=v306)                                                              ⟨280794⟩
ajoute c5 à scène2                                                                                    ⟨280800⟩
si v1 != 0 :
    texte_calque(calque=c6, texte=&v374)                                                              ⟨280807⟩
    texte_calque(calque=c7, texte=&v416)                                                              ⟨280812⟩
    texte_calque(calque=c8, texte=&v460)                                                              ⟨280817⟩
    ajoute c6 à scène2                                                                                ⟨280822⟩
    ajoute c7 à scène2                                                                                ⟨280827⟩
    ajoute c8 à scène2                                                                                ⟨280832⟩
sinon :
    texte_calque(calque=c6, texte=&v374)                                                              ⟨280840⟩
    texte_calque(calque=c7, texte=&v460)                                                              ⟨280845⟩
    ajoute c6 à scène2                                                                                ⟨280850⟩
    ajoute c7 à scène2                                                                                ⟨280855⟩
    c8.détruit(3)                                                                                     ⟨280863⟩
palette_copie(destination=pal1, source=pal7(midgames 41))                                             ⟨280875⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨280887⟩
si v20 != 0 :
    Scene_Tick(scène=scène2)                                                                          ⟨280896⟩
    charge(mid33voc 1)                                                                                ⟨280908⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 1)                                 ⟨280914⟩
    di = 0                                                                                            ⟨280916⟩
    tant que di < 2 :
        Scene_Tick(scène=scène2)                                                                      ⟨280922⟩
        di = di + 1                                                                                   ⟨280924⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨280932⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si touche_passer() != 0 : aller à loc_9F5A8                                                   ⟨280939⟩
        Scene_Tick(scène=scène2)                                                                      ⟨280945⟩
    loc_9F5A8:                                                                                        ⟨280956⟩
    voix_arrête(voix=voix1)                                                                           ⟨280959⟩
    si byte_4F55C != 0 :
        v316 = 0                                                                                      ⟨280983⟩
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨280987⟩
        v292 = 0                                                                                      ⟨281006⟩
        v282 = 0                                                                                      ⟨281024⟩
        v270 = 0                                                                                      ⟨281049⟩
        v265 = 0                                                                                      ⟨281050⟩
        v264 = 0                                                                                      ⟨281051⟩
        v256 = 0                                                                                      ⟨281076⟩
        v251 = 0                                                                                      ⟨281077⟩
        v250 = 0                                                                                      ⟨281078⟩
        v241 = 0                                                                                      ⟨281095⟩
        v240 = 0                                                                                      ⟨281096⟩
        v231 = 0                                                                                      ⟨281113⟩
        v230 = 0                                                                                      ⟨281114⟩
        v221 = 0                                                                                      ⟨281131⟩
        v220 = 0                                                                                      ⟨281132⟩
        v211 = 0                                                                                      ⟨281149⟩
        v210 = 0                                                                                      ⟨281150⟩
        v201 = 0                                                                                      ⟨281167⟩
        v200 = 0                                                                                      ⟨281168⟩
        v191 = 0                                                                                      ⟨281185⟩
        v190 = 0                                                                                      ⟨281186⟩
        v181 = 0                                                                                      ⟨281203⟩
        v180 = 0                                                                                      ⟨281204⟩
        v171 = 0                                                                                      ⟨281221⟩
        v170 = 0                                                                                      ⟨281222⟩
        v155 = 0                                                                                      ⟨281243⟩
        v154 = 0                                                                                      ⟨281244⟩
        v139 = 0                                                                                      ⟨281265⟩
        v138 = 0                                                                                      ⟨281266⟩
        v123 = 0                                                                                      ⟨281287⟩
        v122 = 0                                                                                      ⟨281288⟩
        v107 = 0                                                                                      ⟨281309⟩
        v106 = 0                                                                                      ⟨281310⟩
        v91 = 0                                                                                       ⟨281331⟩
        v90 = 0                                                                                       ⟨281332⟩
        v75 = 0                                                                                       ⟨281353⟩
        v74 = 0                                                                                       ⟨281354⟩
        v65 = 0                                                                                       ⟨281371⟩
        v64 = 0                                                                                       ⟨281372⟩
        v55 = 0                                                                                       ⟨281389⟩
        v54 = 0                                                                                       ⟨281390⟩
        voix_arrête(voix=voix1)                                                                       ⟨281394⟩
        v3012 = 0                                                                                     ⟨281411⟩
        v3007 = 0                                                                                     ⟨281412⟩
        v3006 = 0                                                                                     ⟨281413⟩
        canal_arrête(canal=canal2)                                                                    ⟨281416⟩
        sub_5C1C(&v938, 2)                                                                            ⟨281421⟩
        v43 = 0                                                                                       ⟨281444⟩
        v42 = 0                                                                                       ⟨281445⟩
        retour                                                                                        ⟨281480⟩
    di = 0                                                                                            ⟨281483⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨281489⟩
        di = di + 1                                                                                   ⟨281491⟩
    charge(mid33voc 2)                                                                                ⟨281506⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 2)                                 ⟨281512⟩
    di = 0                                                                                            ⟨281514⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨281520⟩
        di = di + 1                                                                                   ⟨281522⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨281530⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si touche_passer() != 0 : aller à loc_9FD15                                                   ⟨281537⟩
        Scene_Tick(scène=scène2)                                                                      ⟨281543⟩
    loc_9FD15:                                                                                        ⟨281554⟩
    di = 0                                                                                            ⟨281555⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨281561⟩
        di = di + 1                                                                                   ⟨281563⟩
    voix_arrête(voix=voix1)                                                                           ⟨281570⟩
    v326 = 0                                                                                          ⟨281589⟩
    v316 = 0                                                                                          ⟨281607⟩
sinon :
    Widget_Method_DispatchC_37052(objet1, 0)                                                          ⟨281614⟩
    Widget_Method_Dispatch8_37030(objet1, 254)                                                        ⟨281619⟩
    v14 = 66                                                                                          ⟨281621⟩
    si = scène2.compteur                                                                              ⟨281622⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨281631⟩
    tant que (scène2.compteur < v12) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨281635⟩
        si si + 3 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[2])                             ⟨281647⟩
        si v12 - 1 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨281658⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨281668⟩
            aller à loc_9FE79                                                                         ⟨281670⟩
        Scene_Tick(scène=scène2)                                                                      ⟨281675⟩
    loc_9FE79:                                                                                        ⟨281697⟩
    si byte_4F55C != 0 :
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨281706⟩
        v292 = 0                                                                                      ⟨281725⟩
        v282 = 0                                                                                      ⟨281743⟩
        v270 = 0                                                                                      ⟨281768⟩
        v265 = 0                                                                                      ⟨281769⟩
        v264 = 0                                                                                      ⟨281770⟩
        v256 = 0                                                                                      ⟨281795⟩
        v251 = 0                                                                                      ⟨281796⟩
        v250 = 0                                                                                      ⟨281797⟩
        v241 = 0                                                                                      ⟨281814⟩
        v240 = 0                                                                                      ⟨281815⟩
        v231 = 0                                                                                      ⟨281832⟩
        v230 = 0                                                                                      ⟨281833⟩
        v221 = 0                                                                                      ⟨281850⟩
        v220 = 0                                                                                      ⟨281851⟩
        v211 = 0                                                                                      ⟨281868⟩
        v210 = 0                                                                                      ⟨281869⟩
        v201 = 0                                                                                      ⟨281886⟩
        v200 = 0                                                                                      ⟨281887⟩
        v191 = 0                                                                                      ⟨281904⟩
        v190 = 0                                                                                      ⟨281905⟩
        v181 = 0                                                                                      ⟨281922⟩
        v180 = 0                                                                                      ⟨281923⟩
        v171 = 0                                                                                      ⟨281940⟩
        v170 = 0                                                                                      ⟨281941⟩
        v155 = 0                                                                                      ⟨281962⟩
        v154 = 0                                                                                      ⟨281963⟩
        v139 = 0                                                                                      ⟨281984⟩
        v138 = 0                                                                                      ⟨281985⟩
        v123 = 0                                                                                      ⟨282006⟩
        v122 = 0                                                                                      ⟨282007⟩
        v107 = 0                                                                                      ⟨282028⟩
        v106 = 0                                                                                      ⟨282029⟩
        v91 = 0                                                                                       ⟨282050⟩
        v90 = 0                                                                                       ⟨282051⟩
        v75 = 0                                                                                       ⟨282072⟩
        v74 = 0                                                                                       ⟨282073⟩
        v65 = 0                                                                                       ⟨282090⟩
        v64 = 0                                                                                       ⟨282091⟩
        v55 = 0                                                                                       ⟨282108⟩
        v54 = 0                                                                                       ⟨282109⟩
        voix_arrête(voix=voix1)                                                                       ⟨282113⟩
        v3012 = 0                                                                                     ⟨282130⟩
        v3007 = 0                                                                                     ⟨282131⟩
        v3006 = 0                                                                                     ⟨282132⟩
        canal_arrête(canal=canal2)                                                                    ⟨282135⟩
        sub_5C1C(&v938, 2)                                                                            ⟨282140⟩
        v43 = 0                                                                                       ⟨282163⟩
        v42 = 0                                                                                       ⟨282164⟩
        retour                                                                                        ⟨282199⟩
    v14 = 70                                                                                          ⟨282202⟩
    si = scène2.compteur                                                                              ⟨282203⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨282212⟩
    tant que (scène2.compteur < v12) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨282216⟩
        si si + 1 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[4])                             ⟨282228⟩
        si v12 - 1 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨282239⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨282249⟩
            aller à loc_A058D                                                                         ⟨282251⟩
        Scene_Tick(scène=scène2)                                                                      ⟨282256⟩
loc_A058D:                                                                                            ⟨282278⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨282282⟩
v292 = 0                                                                                              ⟨282301⟩
v282 = 0                                                                                              ⟨282319⟩
si byte_4F55C != 0 :
    v270 = 0                                                                                          ⟨282349⟩
    v265 = 0                                                                                          ⟨282350⟩
    v264 = 0                                                                                          ⟨282351⟩
    v256 = 0                                                                                          ⟨282376⟩
    v251 = 0                                                                                          ⟨282377⟩
    v250 = 0                                                                                          ⟨282378⟩
    v241 = 0                                                                                          ⟨282395⟩
    v240 = 0                                                                                          ⟨282396⟩
    v231 = 0                                                                                          ⟨282413⟩
    v230 = 0                                                                                          ⟨282414⟩
    v221 = 0                                                                                          ⟨282431⟩
    v220 = 0                                                                                          ⟨282432⟩
    v211 = 0                                                                                          ⟨282449⟩
    v210 = 0                                                                                          ⟨282450⟩
    v201 = 0                                                                                          ⟨282467⟩
    v200 = 0                                                                                          ⟨282468⟩
    v191 = 0                                                                                          ⟨282485⟩
    v190 = 0                                                                                          ⟨282486⟩
    v181 = 0                                                                                          ⟨282503⟩
    v180 = 0                                                                                          ⟨282504⟩
    v171 = 0                                                                                          ⟨282521⟩
    v170 = 0                                                                                          ⟨282522⟩
    v155 = 0                                                                                          ⟨282543⟩
    v154 = 0                                                                                          ⟨282544⟩
    v139 = 0                                                                                          ⟨282565⟩
    v138 = 0                                                                                          ⟨282566⟩
    v123 = 0                                                                                          ⟨282587⟩
    v122 = 0                                                                                          ⟨282588⟩
    v107 = 0                                                                                          ⟨282609⟩
    v106 = 0                                                                                          ⟨282610⟩
    v91 = 0                                                                                           ⟨282631⟩
    v90 = 0                                                                                           ⟨282632⟩
    v75 = 0                                                                                           ⟨282653⟩
    v74 = 0                                                                                           ⟨282654⟩
    v65 = 0                                                                                           ⟨282671⟩
    v64 = 0                                                                                           ⟨282672⟩
    v55 = 0                                                                                           ⟨282689⟩
    v54 = 0                                                                                           ⟨282690⟩
    voix_arrête(voix=voix1)                                                                           ⟨282694⟩
    v3012 = 0                                                                                         ⟨282711⟩
    v3007 = 0                                                                                         ⟨282712⟩
    v3006 = 0                                                                                         ⟨282713⟩
    canal_arrête(canal=canal2)                                                                        ⟨282716⟩
    sub_5C1C(&v938, 2)                                                                                ⟨282721⟩
    v43 = 0                                                                                           ⟨282744⟩
    v42 = 0                                                                                           ⟨282745⟩
    retour                                                                                            ⟨282780⟩

──── scène3 ────
scène3 = Scene_Create(cadence=9, palette=255, surface=&v554)                                          ⟨282789⟩
c9 = Layer(ressource=midgames 44, x=0, y=0)                                                           ⟨282796⟩
CRT_Rand()                                                                                            ⟨282800⟩
c10 = TalkingHead(ressource=convdata type 0 "tex", x=((CRT_Rand()·5) / 32768) + 158, y=128)           ⟨282811⟩
di = c10                                                                                              ⟨282813⟩
tête_image_de_base(tête=c10, image=19)                                                                ⟨282816⟩
ajoute c9 à scène3                                                                                    ⟨282821⟩
ajoute c10 à scène3                                                                                   ⟨282826⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨282835⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨282844⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨282856⟩
si v20 != 0 :
    Scene_Tick(scène=scène3)                                                                          ⟨282865⟩
    charge(mid33voc 3)                                                                                ⟨282877⟩
    tête_voix(tête=c10, ressource=mid33voc 3, cadence=9)                                              ⟨282883⟩
    v292 = 0                                                                                          ⟨282885⟩
    tant que tête_parle(tête=c10) != 0 :
        si v292 == 5 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨282893⟩
        si v292 == 6 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨282901⟩
        si v292 == 9 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨282909⟩
        si v292 == 10 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨282917⟩
        si v292 == 15 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨282925⟩
        si v292 == 16 :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨282933⟩
        si v292 == 19 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨282941⟩
        v292_avant = v292                                                                             ⟨282946⟩
        v292 = v292 + 1                                                                               ⟨282946⟩
        si v292_avant == 20 :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨282951⟩
        si touche_passer() != 0 : aller à loc_A0DFC                                                   ⟨282957⟩
        Scene_Tick(scène=scène3)                                                                      ⟨282963⟩
    loc_A0DFC:                                                                                        ⟨282974⟩
    si byte_4F55C != 0 :
        v290 = 0                                                                                      ⟨282995⟩
        v284 = 0                                                                                      ⟨282997⟩
        Scene_Destruct(scène=scène3, drapeaux=0)                                                      ⟨283001⟩
        v270 = 0                                                                                      ⟨283027⟩
        v265 = 0                                                                                      ⟨283028⟩
        v264 = 0                                                                                      ⟨283029⟩
        v256 = 0                                                                                      ⟨283054⟩
        v251 = 0                                                                                      ⟨283055⟩
        v250 = 0                                                                                      ⟨283056⟩
        v241 = 0                                                                                      ⟨283073⟩
        v240 = 0                                                                                      ⟨283074⟩
        v231 = 0                                                                                      ⟨283091⟩
        v230 = 0                                                                                      ⟨283092⟩
        v221 = 0                                                                                      ⟨283109⟩
        v220 = 0                                                                                      ⟨283110⟩
        v211 = 0                                                                                      ⟨283127⟩
        v210 = 0                                                                                      ⟨283128⟩
        v201 = 0                                                                                      ⟨283145⟩
        v200 = 0                                                                                      ⟨283146⟩
        v191 = 0                                                                                      ⟨283163⟩
        v190 = 0                                                                                      ⟨283164⟩
        v181 = 0                                                                                      ⟨283181⟩
        v180 = 0                                                                                      ⟨283182⟩
        v171 = 0                                                                                      ⟨283199⟩
        v170 = 0                                                                                      ⟨283200⟩
        v155 = 0                                                                                      ⟨283221⟩
        v154 = 0                                                                                      ⟨283222⟩
        v139 = 0                                                                                      ⟨283243⟩
        v138 = 0                                                                                      ⟨283244⟩
        v123 = 0                                                                                      ⟨283265⟩
        v122 = 0                                                                                      ⟨283266⟩
        v107 = 0                                                                                      ⟨283287⟩
        v106 = 0                                                                                      ⟨283288⟩
        v91 = 0                                                                                       ⟨283309⟩
        v90 = 0                                                                                       ⟨283310⟩
        v75 = 0                                                                                       ⟨283331⟩
        v74 = 0                                                                                       ⟨283332⟩
        v65 = 0                                                                                       ⟨283349⟩
        v64 = 0                                                                                       ⟨283350⟩
        v55 = 0                                                                                       ⟨283367⟩
        v54 = 0                                                                                       ⟨283368⟩
        voix_arrête(voix=voix1)                                                                       ⟨283372⟩
        v3012 = 0                                                                                     ⟨283389⟩
        v3007 = 0                                                                                     ⟨283390⟩
        v3006 = 0                                                                                     ⟨283391⟩
        canal_arrête(canal=canal2)                                                                    ⟨283394⟩
        sub_5C1C(&v938, 2)                                                                            ⟨283399⟩
        v43 = 0                                                                                       ⟨283422⟩
        v42 = 0                                                                                       ⟨283423⟩
        retour                                                                                        ⟨283458⟩
    tête_image_de_base(tête=c10, image=19)                                                            ⟨283463⟩
    v292 = 0                                                                                          ⟨283465⟩
    tant que v292 < 8 :
        Scene_Tick(scène=scène3)                                                                      ⟨283471⟩
        v292 = v292 + 1                                                                               ⟨283473⟩
    v290 = 0                                                                                          ⟨283493⟩
    v284 = 0                                                                                          ⟨283495⟩
sinon :
    v3066→0.méthode8(254)                                                                             ⟨283503⟩
    v14 = 48                                                                                          ⟨283505⟩
    si = scène3.compteur                                                                              ⟨283506⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨283515⟩
    tant que (scène3.compteur < v12) et (scène3.terminée == 0) :
        v282 = scène3.compteur                                                                        ⟨283520⟩
        si si + 3 == v282 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[5])                             ⟨283533⟩
        si si + 3 == v282 :
            tête_texte_de_lèvres(tête=c10, texte="btnwthtjbhzfalntme")                                ⟨283543⟩
        si si + 15 == v282 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨283553⟩
        si si + 16 == v282 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨283563⟩
        si si + 19 == v282 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨283573⟩
        si si + 20 == v282 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨283583⟩
        si v12 - 1 == v282 :
            sub_30AD0(objet1, 0)                                                                      ⟨283594⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨283604⟩
            aller à loc_A15D0                                                                         ⟨283606⟩
        Scene_Tick(scène=scène3)                                                                      ⟨283611⟩
    loc_A15D0:                                                                                        ⟨283634⟩
    si byte_4F55C != 0 :
        Scene_Destruct(scène=scène3, drapeaux=0)                                                      ⟨283643⟩
        v270 = 0                                                                                      ⟨283669⟩
        v265 = 0                                                                                      ⟨283670⟩
        v264 = 0                                                                                      ⟨283671⟩
        v256 = 0                                                                                      ⟨283696⟩
        v251 = 0                                                                                      ⟨283697⟩
        v250 = 0                                                                                      ⟨283698⟩
        v241 = 0                                                                                      ⟨283715⟩
        v240 = 0                                                                                      ⟨283716⟩
        v231 = 0                                                                                      ⟨283733⟩
        v230 = 0                                                                                      ⟨283734⟩
        v221 = 0                                                                                      ⟨283751⟩
        v220 = 0                                                                                      ⟨283752⟩
        v211 = 0                                                                                      ⟨283769⟩
        v210 = 0                                                                                      ⟨283770⟩
        v201 = 0                                                                                      ⟨283787⟩
        v200 = 0                                                                                      ⟨283788⟩
        v191 = 0                                                                                      ⟨283805⟩
        v190 = 0                                                                                      ⟨283806⟩
        v181 = 0                                                                                      ⟨283823⟩
        v180 = 0                                                                                      ⟨283824⟩
        v171 = 0                                                                                      ⟨283841⟩
        v170 = 0                                                                                      ⟨283842⟩
        v155 = 0                                                                                      ⟨283863⟩
        v154 = 0                                                                                      ⟨283864⟩
        v139 = 0                                                                                      ⟨283885⟩
        v138 = 0                                                                                      ⟨283886⟩
        v123 = 0                                                                                      ⟨283907⟩
        v122 = 0                                                                                      ⟨283908⟩
        v107 = 0                                                                                      ⟨283929⟩
        v106 = 0                                                                                      ⟨283930⟩
        v91 = 0                                                                                       ⟨283951⟩
        v90 = 0                                                                                       ⟨283952⟩
        v75 = 0                                                                                       ⟨283973⟩
        v74 = 0                                                                                       ⟨283974⟩
        v65 = 0                                                                                       ⟨283991⟩
        v64 = 0                                                                                       ⟨283992⟩
        v55 = 0                                                                                       ⟨284009⟩
        v54 = 0                                                                                       ⟨284010⟩
        voix_arrête(voix=voix1)                                                                       ⟨284014⟩
        v3012 = 0                                                                                     ⟨284031⟩
        v3007 = 0                                                                                     ⟨284032⟩
        v3006 = 0                                                                                     ⟨284033⟩
        canal_arrête(canal=canal2)                                                                    ⟨284036⟩
        sub_5C1C(&v938, 2)                                                                            ⟨284041⟩
        v43 = 0                                                                                       ⟨284064⟩
        v42 = 0                                                                                       ⟨284065⟩
        retour                                                                                        ⟨284100⟩
    v14 = 44                                                                                          ⟨284103⟩
    si = scène3.compteur                                                                              ⟨284104⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨284113⟩
    tant que (scène3.compteur < v12) et (scène3.terminée == 0) :
        v282 = scène3.compteur                                                                        ⟨284118⟩
        si si + 3 == v282 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[6])                             ⟨284131⟩
        si si + 3 == v282 :
            tête_texte_de_lèvres(tête=c10, texte="Itsjbivlwyzwntd")                                   ⟨284141⟩
        si si + 15 == v282 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨284151⟩
        si si + 16 == v282 :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨284161⟩
        si si + 19 == v282 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨284171⟩
        si si + 20 == v282 :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨284181⟩
        si v12 - 1 == v282 :
            sub_30AD0(objet1, 0)                                                                      ⟨284192⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨284202⟩
            aller à loc_A1CE5                                                                         ⟨284204⟩
        Scene_Tick(scène=scène3)                                                                      ⟨284209⟩
    loc_A1CE5:                                                                                        ⟨284232⟩
    si byte_4F55C != 0 :
        Scene_Destruct(scène=scène3, drapeaux=0)                                                      ⟨284241⟩
        v270 = 0                                                                                      ⟨284267⟩
        v265 = 0                                                                                      ⟨284268⟩
        v264 = 0                                                                                      ⟨284269⟩
        v256 = 0                                                                                      ⟨284294⟩
        v251 = 0                                                                                      ⟨284295⟩
        v250 = 0                                                                                      ⟨284296⟩
        v241 = 0                                                                                      ⟨284313⟩
        v240 = 0                                                                                      ⟨284314⟩
        v231 = 0                                                                                      ⟨284331⟩
        v230 = 0                                                                                      ⟨284332⟩
        v221 = 0                                                                                      ⟨284349⟩
        v220 = 0                                                                                      ⟨284350⟩
        v211 = 0                                                                                      ⟨284367⟩
        v210 = 0                                                                                      ⟨284368⟩
        v201 = 0                                                                                      ⟨284385⟩
        v200 = 0                                                                                      ⟨284386⟩
        v191 = 0                                                                                      ⟨284403⟩
        v190 = 0                                                                                      ⟨284404⟩
        v181 = 0                                                                                      ⟨284421⟩
        v180 = 0                                                                                      ⟨284422⟩
        v171 = 0                                                                                      ⟨284439⟩
        v170 = 0                                                                                      ⟨284440⟩
        v155 = 0                                                                                      ⟨284461⟩
        v154 = 0                                                                                      ⟨284462⟩
        v139 = 0                                                                                      ⟨284483⟩
        v138 = 0                                                                                      ⟨284484⟩
        v123 = 0                                                                                      ⟨284505⟩
        v122 = 0                                                                                      ⟨284506⟩
        v107 = 0                                                                                      ⟨284527⟩
        v106 = 0                                                                                      ⟨284528⟩
        v91 = 0                                                                                       ⟨284549⟩
        v90 = 0                                                                                       ⟨284550⟩
        v75 = 0                                                                                       ⟨284571⟩
        v74 = 0                                                                                       ⟨284572⟩
        v65 = 0                                                                                       ⟨284589⟩
        v64 = 0                                                                                       ⟨284590⟩
        v55 = 0                                                                                       ⟨284607⟩
        v54 = 0                                                                                       ⟨284608⟩
        voix_arrête(voix=voix1)                                                                       ⟨284612⟩
        v3012 = 0                                                                                     ⟨284629⟩
        v3007 = 0                                                                                     ⟨284630⟩
        v3006 = 0                                                                                     ⟨284631⟩
        canal_arrête(canal=canal2)                                                                    ⟨284634⟩
        sub_5C1C(&v938, 2)                                                                            ⟨284639⟩
        v43 = 0                                                                                       ⟨284662⟩
        v42 = 0                                                                                       ⟨284663⟩
        retour                                                                                        ⟨284698⟩
    v14 = 38                                                                                          ⟨284701⟩
    si = scène3.compteur                                                                              ⟨284702⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨284711⟩
    tant que (scène3.compteur < v12) et (scène3.terminée == 0) :
        v282 = scène3.compteur                                                                        ⟨284716⟩
        si si + 3 == v282 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[7])                             ⟨284729⟩
        si si + 3 == v282 :
            tête_texte_de_lèvres(tête=c10, texte="btnotlkths")                                        ⟨284739⟩
        si si + 15 == v282 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨284749⟩
        si si + 16 == v282 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨284759⟩
        si si + 19 == v282 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨284769⟩
        si si + 20 == v282 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨284779⟩
        si v12 - 1 == v282 :
            sub_30AD0(objet1, 0)                                                                      ⟨284790⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨284800⟩
            aller à loc_A23FA                                                                         ⟨284802⟩
        Scene_Tick(scène=scène3)                                                                      ⟨284807⟩
loc_A23FA:                                                                                            ⟨284830⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨284834⟩
si byte_4F55C != 0 :
    v270 = 0                                                                                          ⟨284865⟩
    v265 = 0                                                                                          ⟨284866⟩
    v264 = 0                                                                                          ⟨284867⟩
    v256 = 0                                                                                          ⟨284892⟩
    v251 = 0                                                                                          ⟨284893⟩
    v250 = 0                                                                                          ⟨284894⟩
    v241 = 0                                                                                          ⟨284911⟩
    v240 = 0                                                                                          ⟨284912⟩
    v231 = 0                                                                                          ⟨284929⟩
    v230 = 0                                                                                          ⟨284930⟩
    v221 = 0                                                                                          ⟨284947⟩
    v220 = 0                                                                                          ⟨284948⟩
    v211 = 0                                                                                          ⟨284965⟩
    v210 = 0                                                                                          ⟨284966⟩
    v201 = 0                                                                                          ⟨284983⟩
    v200 = 0                                                                                          ⟨284984⟩
    v191 = 0                                                                                          ⟨285001⟩
    v190 = 0                                                                                          ⟨285002⟩
    v181 = 0                                                                                          ⟨285019⟩
    v180 = 0                                                                                          ⟨285020⟩
    v171 = 0                                                                                          ⟨285037⟩
    v170 = 0                                                                                          ⟨285038⟩
    v155 = 0                                                                                          ⟨285059⟩
    v154 = 0                                                                                          ⟨285060⟩
    v139 = 0                                                                                          ⟨285081⟩
    v138 = 0                                                                                          ⟨285082⟩
    v123 = 0                                                                                          ⟨285103⟩
    v122 = 0                                                                                          ⟨285104⟩
    v107 = 0                                                                                          ⟨285125⟩
    v106 = 0                                                                                          ⟨285126⟩
    v91 = 0                                                                                           ⟨285147⟩
    v90 = 0                                                                                           ⟨285148⟩
    v75 = 0                                                                                           ⟨285169⟩
    v74 = 0                                                                                           ⟨285170⟩
    v65 = 0                                                                                           ⟨285187⟩
    v64 = 0                                                                                           ⟨285188⟩
    v55 = 0                                                                                           ⟨285205⟩
    v54 = 0                                                                                           ⟨285206⟩
    voix_arrête(voix=voix1)                                                                           ⟨285210⟩
    v3012 = 0                                                                                         ⟨285227⟩
    v3007 = 0                                                                                         ⟨285228⟩
    v3006 = 0                                                                                         ⟨285229⟩
    canal_arrête(canal=canal2)                                                                        ⟨285232⟩
    sub_5C1C(&v938, 2)                                                                                ⟨285237⟩
    v43 = 0                                                                                           ⟨285260⟩
    v42 = 0                                                                                           ⟨285261⟩
    retour                                                                                            ⟨285296⟩

──── scène4 ────
scène4 = Scene_Create(cadence=9, palette=255, surface=&v554)                                          ⟨285305⟩
c11 = Layer(ressource=midgames 42, x=0, y=-80)                                                        ⟨285312⟩
c12 = TalkingHead(ressource=convdata type 0 "gwen", x=164, y=128)                                     ⟨285320⟩
tête_image_de_base(tête=c12, image=31)                                                                ⟨285325⟩
ajoute c11 à scène4                                                                                   ⟨285330⟩
ajoute c12 à scène4                                                                                   ⟨285335⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨285344⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨285353⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨285365⟩
si v20 != 0 :
    Scene_Tick(scène=scène4)                                                                          ⟨285374⟩
    charge(mid33voc 4)                                                                                ⟨285386⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 4)                                 ⟨285392⟩
    di = 0                                                                                            ⟨285394⟩
    tant que di < 8 :
        Scene_Tick(scène=scène4)                                                                      ⟨285400⟩
        di = di + 1                                                                                   ⟨285402⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨285410⟩
    di = 0                                                                                            ⟨285412⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨285420⟩
        si di == 8 :
            tête_image_de_base(tête=c12, image=21)                                                    ⟨285428⟩
        di = di + 1                                                                                   ⟨285433⟩
        si di == 17 :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨285438⟩
        si touche_passer() != 0 : aller à loc_A2BA1                                                   ⟨285444⟩
        Scene_Tick(scène=scène4)                                                                      ⟨285450⟩
    loc_A2BA1:                                                                                        ⟨285461⟩
    di = 0                                                                                            ⟨285462⟩
    tant que di < 12 :
        Scene_Tick(scène=scène4)                                                                      ⟨285468⟩
        di = di + 1                                                                                   ⟨285470⟩
    voix_arrête(voix=voix1)                                                                           ⟨285477⟩
    v292 = 0                                                                                          ⟨285494⟩
    v286 = 0                                                                                          ⟨285496⟩
sinon :
    v3066→0.méthode8(254)                                                                             ⟨285504⟩
    v14 = 40                                                                                          ⟨285506⟩
    si = scène4.compteur                                                                              ⟨285507⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨285516⟩
    tant que (scène4.compteur < v12) et (scène4.terminée == 0) :
        di = scène4.compteur                                                                          ⟨285520⟩
        si si + 1 == scène4.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[8])                             ⟨285532⟩
        si si + 17 == scène4.compteur :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨285542⟩
        si si + 18 == scène4.compteur :
            tête_image_de_base(tête=c12, image=21)                                                    ⟨285552⟩
        si si + 27 == scène4.compteur :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨285562⟩
        si v12 - 1 == scène4.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨285573⟩
        si touche_passer() != 0 : aller à loc_A2CF3                                                   ⟨285579⟩
        Scene_Tick(scène=scène4)                                                                      ⟨285585⟩
loc_A2CF3:                                                                                            ⟨285608⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨285612⟩
si byte_4F55C != 0 :
    v270 = 0                                                                                          ⟨285643⟩
    v265 = 0                                                                                          ⟨285644⟩
    v264 = 0                                                                                          ⟨285645⟩
    v256 = 0                                                                                          ⟨285670⟩
    v251 = 0                                                                                          ⟨285671⟩
    v250 = 0                                                                                          ⟨285672⟩
    v241 = 0                                                                                          ⟨285689⟩
    v240 = 0                                                                                          ⟨285690⟩
    v231 = 0                                                                                          ⟨285707⟩
    v230 = 0                                                                                          ⟨285708⟩
    v221 = 0                                                                                          ⟨285725⟩
    v220 = 0                                                                                          ⟨285726⟩
    v211 = 0                                                                                          ⟨285743⟩
    v210 = 0                                                                                          ⟨285744⟩
    v201 = 0                                                                                          ⟨285761⟩
    v200 = 0                                                                                          ⟨285762⟩
    v191 = 0                                                                                          ⟨285779⟩
    v190 = 0                                                                                          ⟨285780⟩
    v181 = 0                                                                                          ⟨285797⟩
    v180 = 0                                                                                          ⟨285798⟩
    v171 = 0                                                                                          ⟨285815⟩
    v170 = 0                                                                                          ⟨285816⟩
    v155 = 0                                                                                          ⟨285837⟩
    v154 = 0                                                                                          ⟨285838⟩
    v139 = 0                                                                                          ⟨285859⟩
    v138 = 0                                                                                          ⟨285860⟩
    v123 = 0                                                                                          ⟨285881⟩
    v122 = 0                                                                                          ⟨285882⟩
    v107 = 0                                                                                          ⟨285903⟩
    v106 = 0                                                                                          ⟨285904⟩
    v91 = 0                                                                                           ⟨285925⟩
    v90 = 0                                                                                           ⟨285926⟩
    v75 = 0                                                                                           ⟨285947⟩
    v74 = 0                                                                                           ⟨285948⟩
    v65 = 0                                                                                           ⟨285965⟩
    v64 = 0                                                                                           ⟨285966⟩
    v55 = 0                                                                                           ⟨285983⟩
    v54 = 0                                                                                           ⟨285984⟩
    voix_arrête(voix=voix1)                                                                           ⟨285988⟩
    v3012 = 0                                                                                         ⟨286005⟩
    v3007 = 0                                                                                         ⟨286006⟩
    v3006 = 0                                                                                         ⟨286007⟩
    canal_arrête(canal=canal2)                                                                        ⟨286010⟩
    sub_5C1C(&v938, 2)                                                                                ⟨286015⟩
    v43 = 0                                                                                           ⟨286038⟩
    v42 = 0                                                                                           ⟨286039⟩
    retour                                                                                            ⟨286074⟩

──── scène5 ────
scène5 = Scene_Create(cadence=9, palette=255, surface=&v554)                                          ⟨286083⟩
c13 = Layer(ressource=midgames 44, x=0, y=0)                                                          ⟨286090⟩
c14 = TalkingHead(ressource=convdata type 0 "miguel", x=255, y=128)                                   ⟨286098⟩
c15 = TalkingHead(ressource=convdata type 0 "billy", x=95, y=128)                                     ⟨286106⟩
tête_image_de_base(tête=c15, image=19)                                                                ⟨286111⟩
tête_image_de_base(tête=c14, image=19)                                                                ⟨286115⟩
ajoute c13 à scène5                                                                                   ⟨286120⟩
ajoute c14 à scène5                                                                                   ⟨286125⟩
ajoute c15 à scène5                                                                                   ⟨286130⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨286139⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨286148⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨286160⟩
si v20 != 0 :
    Scene_Tick(scène=scène5)                                                                          ⟨286169⟩
    charge(mid33voc 5)                                                                                ⟨286181⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 5)                                 ⟨286187⟩
    di = 0                                                                                            ⟨286189⟩
    tant que di < 4 :
        Scene_Tick(scène=scène5)                                                                      ⟨286195⟩
        di = di + 1                                                                                   ⟨286197⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨286205⟩
    di = 0                                                                                            ⟨286207⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨286215⟩
        si di == 8 :
            tête_image_de_base(tête=c15, image=21)                                                    ⟨286223⟩
        si di == 9 :
            tête_image_de_base(tête=c15, image=-1)                                                    ⟨286231⟩
        si di == 16 :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨286239⟩
        si di == 18 :
            tête_image_de_base(tête=c15, image=21)                                                    ⟨286247⟩
        si di == 2 :
            tête_image_de_base(tête=c14, image=12)                                                    ⟨286255⟩
        si di == 3 :
            tête_image_de_base(tête=c14, image=21)                                                    ⟨286263⟩
        di = di + 1                                                                                   ⟨286268⟩
        si di == 22 :
            tête_image_de_base(tête=c14, image=12)                                                    ⟨286273⟩
        si touche_passer() != 0 : aller à loc_A3537                                                   ⟨286279⟩
        Scene_Tick(scène=scène5)                                                                      ⟨286285⟩
    loc_A3537:                                                                                        ⟨286297⟩
    voix_arrête(voix=voix1)                                                                           ⟨286300⟩
    si byte_4F55C != 0 :
        v294 = 0                                                                                      ⟨286322⟩
        Scene_Destruct(scène=scène5, drapeaux=0)                                                      ⟨286328⟩
        v270 = 0                                                                                      ⟨286354⟩
        v265 = 0                                                                                      ⟨286355⟩
        v264 = 0                                                                                      ⟨286356⟩
        v256 = 0                                                                                      ⟨286381⟩
        v251 = 0                                                                                      ⟨286382⟩
        v250 = 0                                                                                      ⟨286383⟩
        v241 = 0                                                                                      ⟨286400⟩
        v240 = 0                                                                                      ⟨286401⟩
        v231 = 0                                                                                      ⟨286418⟩
        v230 = 0                                                                                      ⟨286419⟩
        v221 = 0                                                                                      ⟨286436⟩
        v220 = 0                                                                                      ⟨286437⟩
        v211 = 0                                                                                      ⟨286454⟩
        v210 = 0                                                                                      ⟨286455⟩
        v201 = 0                                                                                      ⟨286472⟩
        v200 = 0                                                                                      ⟨286473⟩
        v191 = 0                                                                                      ⟨286490⟩
        v190 = 0                                                                                      ⟨286491⟩
        v181 = 0                                                                                      ⟨286508⟩
        v180 = 0                                                                                      ⟨286509⟩
        v171 = 0                                                                                      ⟨286526⟩
        v170 = 0                                                                                      ⟨286527⟩
        v155 = 0                                                                                      ⟨286548⟩
        v154 = 0                                                                                      ⟨286549⟩
        v139 = 0                                                                                      ⟨286570⟩
        v138 = 0                                                                                      ⟨286571⟩
        v123 = 0                                                                                      ⟨286592⟩
        v122 = 0                                                                                      ⟨286593⟩
        v107 = 0                                                                                      ⟨286614⟩
        v106 = 0                                                                                      ⟨286615⟩
        v91 = 0                                                                                       ⟨286636⟩
        v90 = 0                                                                                       ⟨286637⟩
        v75 = 0                                                                                       ⟨286658⟩
        v74 = 0                                                                                       ⟨286659⟩
        v65 = 0                                                                                       ⟨286676⟩
        v64 = 0                                                                                       ⟨286677⟩
        v55 = 0                                                                                       ⟨286694⟩
        v54 = 0                                                                                       ⟨286695⟩
        voix_arrête(voix=voix1)                                                                       ⟨286699⟩
        v3012 = 0                                                                                     ⟨286716⟩
        v3007 = 0                                                                                     ⟨286717⟩
        v3006 = 0                                                                                     ⟨286718⟩
        canal_arrête(canal=canal2)                                                                    ⟨286721⟩
        sub_5C1C(&v938, 2)                                                                            ⟨286726⟩
        v43 = 0                                                                                       ⟨286749⟩
        v42 = 0                                                                                       ⟨286750⟩
        retour                                                                                        ⟨286785⟩
    di = 0                                                                                            ⟨286788⟩
    tant que di < 8 :
        Scene_Tick(scène=scène5)                                                                      ⟨286794⟩
        di = di + 1                                                                                   ⟨286796⟩
    v294 = 0                                                                                          ⟨286816⟩
sinon :
    v3066→0.méthode8(254)                                                                             ⟨286826⟩
    v14 = 71                                                                                          ⟨286828⟩
    si = scène5.compteur                                                                              ⟨286829⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨286838⟩
    tant que (scène5.compteur < v12) et (scène5.terminée == 0) :
        di = scène5.compteur                                                                          ⟨286842⟩
        si si + 2 == scène5.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[9])                             ⟨286855⟩
        si si + 17 == scène5.compteur :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨286865⟩
        si si + 18 == scène5.compteur :
            tête_image_de_base(tête=c15, image=21)                                                    ⟨286875⟩
        si si + 19 == scène5.compteur :
            tête_image_de_base(tête=c15, image=-1)                                                    ⟨286885⟩
        si si + 26 == scène5.compteur :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨286895⟩
        si si + 28 == scène5.compteur :
            tête_image_de_base(tête=c15, image=21)                                                    ⟨286905⟩
        si si + 7 == scène5.compteur :
            tête_image_de_base(tête=c14, image=12)                                                    ⟨286915⟩
        si si + 8 == scène5.compteur :
            tête_image_de_base(tête=c14, image=21)                                                    ⟨286925⟩
        si si + 32 == scène5.compteur :
            tête_image_de_base(tête=c14, image=12)                                                    ⟨286935⟩
        si v12 - 1 == scène5.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨286946⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨286956⟩
            aller à loc_A3D45                                                                         ⟨286958⟩
        Scene_Tick(scène=scène5)                                                                      ⟨286963⟩
loc_A3D45:                                                                                            ⟨286986⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨286990⟩
si byte_4F55C != 0 :
    v270 = 0                                                                                          ⟨287021⟩
    v265 = 0                                                                                          ⟨287022⟩
    v264 = 0                                                                                          ⟨287023⟩
    v256 = 0                                                                                          ⟨287048⟩
    v251 = 0                                                                                          ⟨287049⟩
    v250 = 0                                                                                          ⟨287050⟩
    v241 = 0                                                                                          ⟨287067⟩
    v240 = 0                                                                                          ⟨287068⟩
    v231 = 0                                                                                          ⟨287085⟩
    v230 = 0                                                                                          ⟨287086⟩
    v221 = 0                                                                                          ⟨287103⟩
    v220 = 0                                                                                          ⟨287104⟩
    v211 = 0                                                                                          ⟨287121⟩
    v210 = 0                                                                                          ⟨287122⟩
    v201 = 0                                                                                          ⟨287139⟩
    v200 = 0                                                                                          ⟨287140⟩
    v191 = 0                                                                                          ⟨287157⟩
    v190 = 0                                                                                          ⟨287158⟩
    v181 = 0                                                                                          ⟨287175⟩
    v180 = 0                                                                                          ⟨287176⟩
    v171 = 0                                                                                          ⟨287193⟩
    v170 = 0                                                                                          ⟨287194⟩
    v155 = 0                                                                                          ⟨287215⟩
    v154 = 0                                                                                          ⟨287216⟩
    v139 = 0                                                                                          ⟨287237⟩
    v138 = 0                                                                                          ⟨287238⟩
    v123 = 0                                                                                          ⟨287259⟩
    v122 = 0                                                                                          ⟨287260⟩
    v107 = 0                                                                                          ⟨287281⟩
    v106 = 0                                                                                          ⟨287282⟩
    v91 = 0                                                                                           ⟨287303⟩
    v90 = 0                                                                                           ⟨287304⟩
    v75 = 0                                                                                           ⟨287325⟩
    v74 = 0                                                                                           ⟨287326⟩
    v65 = 0                                                                                           ⟨287343⟩
    v64 = 0                                                                                           ⟨287344⟩
    v55 = 0                                                                                           ⟨287361⟩
    v54 = 0                                                                                           ⟨287362⟩
    voix_arrête(voix=voix1)                                                                           ⟨287366⟩
    v3012 = 0                                                                                         ⟨287383⟩
    v3007 = 0                                                                                         ⟨287384⟩
    v3006 = 0                                                                                         ⟨287385⟩
    canal_arrête(canal=canal2)                                                                        ⟨287388⟩
    sub_5C1C(&v938, 2)                                                                                ⟨287393⟩
    v43 = 0                                                                                           ⟨287416⟩
    v42 = 0                                                                                           ⟨287417⟩
    retour                                                                                            ⟨287452⟩
charge(midgames 30)                                                                                   ⟨287465⟩

──── scène6 ────
scène6 = Scene_Create(cadence=6, palette=255, surface=&v554)                                          ⟨287473⟩
c16 = Layer(ressource=midgames 30, x=0, y=0)                                                          ⟨287480⟩
palette_alloue(palette=pal8, premier=0, nombre=256)                                                   ⟨287488⟩
palette_copie(destination=pal8, source=pal6(midgames 40))                                             ⟨287497⟩
palette_envoie_argument()                                                                             ⟨287499⟩
ajoute c16 à scène6                                                                                   ⟨287504⟩
si v20 != 0 :
    Scene_Tick(scène=scène6)                                                                          ⟨287513⟩
    charge(mid33voc 6)                                                                                ⟨287525⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 6)                                 ⟨287531⟩
    di = 0                                                                                            ⟨287533⟩
    tant que di < 4 :
        Scene_Tick(scène=scène6)                                                                      ⟨287539⟩
        di = di + 1                                                                                   ⟨287541⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨287549⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si touche_passer() != 0 : aller à loc_A4490                                                   ⟨287556⟩
        Scene_Tick(scène=scène6)                                                                      ⟨287562⟩
    loc_A4490:                                                                                        ⟨287573⟩
    voix_arrête(voix=voix1)                                                                           ⟨287576⟩
    si byte_4F55C != 0 :
        v294 = 0                                                                                      ⟨287600⟩
        Scene_Destruct(scène=scène6, drapeaux=0)                                                      ⟨287604⟩
        v282 = 0                                                                                      ⟨287623⟩
        v270 = 0                                                                                      ⟨287648⟩
        v265 = 0                                                                                      ⟨287649⟩
        v264 = 0                                                                                      ⟨287650⟩
        v256 = 0                                                                                      ⟨287675⟩
        v251 = 0                                                                                      ⟨287676⟩
        v250 = 0                                                                                      ⟨287677⟩
        v241 = 0                                                                                      ⟨287694⟩
        v240 = 0                                                                                      ⟨287695⟩
        v231 = 0                                                                                      ⟨287712⟩
        v230 = 0                                                                                      ⟨287713⟩
        v221 = 0                                                                                      ⟨287730⟩
        v220 = 0                                                                                      ⟨287731⟩
        v211 = 0                                                                                      ⟨287748⟩
        v210 = 0                                                                                      ⟨287749⟩
        v201 = 0                                                                                      ⟨287766⟩
        v200 = 0                                                                                      ⟨287767⟩
        v191 = 0                                                                                      ⟨287784⟩
        v190 = 0                                                                                      ⟨287785⟩
        v181 = 0                                                                                      ⟨287802⟩
        v180 = 0                                                                                      ⟨287803⟩
        v171 = 0                                                                                      ⟨287820⟩
        v170 = 0                                                                                      ⟨287821⟩
        v155 = 0                                                                                      ⟨287842⟩
        v154 = 0                                                                                      ⟨287843⟩
        v139 = 0                                                                                      ⟨287864⟩
        v138 = 0                                                                                      ⟨287865⟩
        v123 = 0                                                                                      ⟨287886⟩
        v122 = 0                                                                                      ⟨287887⟩
        v107 = 0                                                                                      ⟨287908⟩
        v106 = 0                                                                                      ⟨287909⟩
        v91 = 0                                                                                       ⟨287930⟩
        v90 = 0                                                                                       ⟨287931⟩
        v75 = 0                                                                                       ⟨287952⟩
        v74 = 0                                                                                       ⟨287953⟩
        v65 = 0                                                                                       ⟨287970⟩
        v64 = 0                                                                                       ⟨287971⟩
        v55 = 0                                                                                       ⟨287988⟩
        v54 = 0                                                                                       ⟨287989⟩
        voix_arrête(voix=voix1)                                                                       ⟨287993⟩
        v3012 = 0                                                                                     ⟨288010⟩
        v3007 = 0                                                                                     ⟨288011⟩
        v3006 = 0                                                                                     ⟨288012⟩
        canal_arrête(canal=canal2)                                                                    ⟨288015⟩
        sub_5C1C(&v938, 2)                                                                            ⟨288020⟩
        v43 = 0                                                                                       ⟨288043⟩
        v42 = 0                                                                                       ⟨288044⟩
        retour                                                                                        ⟨288079⟩
    di = 0                                                                                            ⟨288082⟩
    tant que di < 8 :
        Scene_Tick(scène=scène6)                                                                      ⟨288088⟩
        di = di + 1                                                                                   ⟨288090⟩
    v294 = 0                                                                                          ⟨288112⟩
sinon :
    Widget_Method_DispatchC_37052(objet1, 0)                                                          ⟨288119⟩
    Widget_Method_Dispatch8_37030(objet1, 79)                                                         ⟨288124⟩
    v14 = 56                                                                                          ⟨288126⟩
    si = scène6.compteur                                                                              ⟨288127⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨288136⟩
    tant que (scène6.compteur < v12) et (scène6.terminée == 0) :
        di = scène6.compteur                                                                          ⟨288140⟩
        si si + 3 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[10])                            ⟨288153⟩
        si v12 - 1 == scène6.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨288164⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨288174⟩
            aller à loc_A4C2F                                                                         ⟨288176⟩
        Scene_Tick(scène=scène6)                                                                      ⟨288181⟩
    loc_A4C2F:                                                                                        ⟨288204⟩
    si byte_4F55C != 0 :
        Scene_Destruct(scène=scène6, drapeaux=0)                                                      ⟨288213⟩
        v282 = 0                                                                                      ⟨288232⟩
        v270 = 0                                                                                      ⟨288257⟩
        v265 = 0                                                                                      ⟨288258⟩
        v264 = 0                                                                                      ⟨288259⟩
        v256 = 0                                                                                      ⟨288284⟩
        v251 = 0                                                                                      ⟨288285⟩
        v250 = 0                                                                                      ⟨288286⟩
        v241 = 0                                                                                      ⟨288303⟩
        v240 = 0                                                                                      ⟨288304⟩
        v231 = 0                                                                                      ⟨288321⟩
        v230 = 0                                                                                      ⟨288322⟩
        v221 = 0                                                                                      ⟨288339⟩
        v220 = 0                                                                                      ⟨288340⟩
        v211 = 0                                                                                      ⟨288357⟩
        v210 = 0                                                                                      ⟨288358⟩
        v201 = 0                                                                                      ⟨288375⟩
        v200 = 0                                                                                      ⟨288376⟩
        v191 = 0                                                                                      ⟨288393⟩
        v190 = 0                                                                                      ⟨288394⟩
        v181 = 0                                                                                      ⟨288411⟩
        v180 = 0                                                                                      ⟨288412⟩
        v171 = 0                                                                                      ⟨288429⟩
        v170 = 0                                                                                      ⟨288430⟩
        v155 = 0                                                                                      ⟨288451⟩
        v154 = 0                                                                                      ⟨288452⟩
        v139 = 0                                                                                      ⟨288473⟩
        v138 = 0                                                                                      ⟨288474⟩
        v123 = 0                                                                                      ⟨288495⟩
        v122 = 0                                                                                      ⟨288496⟩
        v107 = 0                                                                                      ⟨288517⟩
        v106 = 0                                                                                      ⟨288518⟩
        v91 = 0                                                                                       ⟨288539⟩
        v90 = 0                                                                                       ⟨288540⟩
        v75 = 0                                                                                       ⟨288561⟩
        v74 = 0                                                                                       ⟨288562⟩
        v65 = 0                                                                                       ⟨288579⟩
        v64 = 0                                                                                       ⟨288580⟩
        v55 = 0                                                                                       ⟨288597⟩
        v54 = 0                                                                                       ⟨288598⟩
        voix_arrête(voix=voix1)                                                                       ⟨288602⟩
        v3012 = 0                                                                                     ⟨288619⟩
        v3007 = 0                                                                                     ⟨288620⟩
        v3006 = 0                                                                                     ⟨288621⟩
        canal_arrête(canal=canal2)                                                                    ⟨288624⟩
        sub_5C1C(&v938, 2)                                                                            ⟨288629⟩
        v43 = 0                                                                                       ⟨288652⟩
        v42 = 0                                                                                       ⟨288653⟩
        retour                                                                                        ⟨288688⟩
    v14 = 60                                                                                          ⟨288691⟩
    si = scène6.compteur                                                                              ⟨288692⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨288701⟩
    tant que (scène6.compteur < v12) et (scène6.terminée == 0) :
        di = scène6.compteur                                                                          ⟨288705⟩
        si si + 1 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[11])                            ⟨288718⟩
        si v12 - 1 == scène6.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨288729⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨288739⟩
            aller à loc_A5309                                                                         ⟨288741⟩
        Scene_Tick(scène=scène6)                                                                      ⟨288746⟩
loc_A5309:                                                                                            ⟨288769⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨288773⟩
v282 = 0                                                                                              ⟨288792⟩
si byte_4F55C != 0 :
    v270 = 0                                                                                          ⟨288822⟩
    v265 = 0                                                                                          ⟨288823⟩
    v264 = 0                                                                                          ⟨288824⟩
    v256 = 0                                                                                          ⟨288849⟩
    v251 = 0                                                                                          ⟨288850⟩
    v250 = 0                                                                                          ⟨288851⟩
    v241 = 0                                                                                          ⟨288868⟩
    v240 = 0                                                                                          ⟨288869⟩
    v231 = 0                                                                                          ⟨288886⟩
    v230 = 0                                                                                          ⟨288887⟩
    v221 = 0                                                                                          ⟨288904⟩
    v220 = 0                                                                                          ⟨288905⟩
    v211 = 0                                                                                          ⟨288922⟩
    v210 = 0                                                                                          ⟨288923⟩
    v201 = 0                                                                                          ⟨288940⟩
    v200 = 0                                                                                          ⟨288941⟩
    v191 = 0                                                                                          ⟨288958⟩
    v190 = 0                                                                                          ⟨288959⟩
    v181 = 0                                                                                          ⟨288976⟩
    v180 = 0                                                                                          ⟨288977⟩
    v171 = 0                                                                                          ⟨288994⟩
    v170 = 0                                                                                          ⟨288995⟩
    v155 = 0                                                                                          ⟨289016⟩
    v154 = 0                                                                                          ⟨289017⟩
    v139 = 0                                                                                          ⟨289038⟩
    v138 = 0                                                                                          ⟨289039⟩
    v123 = 0                                                                                          ⟨289060⟩
    v122 = 0                                                                                          ⟨289061⟩
    v107 = 0                                                                                          ⟨289082⟩
    v106 = 0                                                                                          ⟨289083⟩
    v91 = 0                                                                                           ⟨289104⟩
    v90 = 0                                                                                           ⟨289105⟩
    v75 = 0                                                                                           ⟨289126⟩
    v74 = 0                                                                                           ⟨289127⟩
    v65 = 0                                                                                           ⟨289144⟩
    v64 = 0                                                                                           ⟨289145⟩
    v55 = 0                                                                                           ⟨289162⟩
    v54 = 0                                                                                           ⟨289163⟩
    voix_arrête(voix=voix1)                                                                           ⟨289167⟩
    v3012 = 0                                                                                         ⟨289184⟩
    v3007 = 0                                                                                         ⟨289185⟩
    v3006 = 0                                                                                         ⟨289186⟩
    canal_arrête(canal=canal2)                                                                        ⟨289189⟩
    sub_5C1C(&v938, 2)                                                                                ⟨289194⟩
    v43 = 0                                                                                           ⟨289217⟩
    v42 = 0                                                                                           ⟨289218⟩
    retour                                                                                            ⟨289253⟩

──── scène7 ────
scène7 = Scene_Create(cadence=9, palette=255, surface=&v554)                                          ⟨289262⟩
c17 = Layer(ressource=midgames 44, x=0, y=0)                                                          ⟨289269⟩
CRT_Rand()                                                                                            ⟨289273⟩
c18 = TalkingHead(ressource=convdata type 0 "tex", x=((CRT_Rand()·5) / 32768) + 158, y=128)           ⟨289284⟩
di = c18                                                                                              ⟨289286⟩
tête_image_de_base(tête=c18, image=19)                                                                ⟨289289⟩
ajoute c17 à scène7                                                                                   ⟨289294⟩
ajoute c18 à scène7                                                                                   ⟨289299⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨289308⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨289317⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨289329⟩
si v20 != 0 :
    Scene_Tick(scène=scène7)                                                                          ⟨289338⟩
    charge(mid33voc 7)                                                                                ⟨289350⟩
    tête_voix(tête=c18, ressource=mid33voc 7, cadence=9)                                              ⟨289356⟩
    v292 = 0                                                                                          ⟨289358⟩
    tant que v292 < 3 :
        Scene_Tick(scène=scène7)                                                                      ⟨289364⟩
        v292 = v292 + 1                                                                               ⟨289366⟩
    v292 = 0                                                                                          ⟨289371⟩
    tant que tête_parle(tête=c18) != 0 :
        si v292 == 5 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨289379⟩
        si v292 == 6 :
            tête_image_de_base(tête=c18, image=19)                                                    ⟨289387⟩
        si v292 == 9 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨289395⟩
        v292_avant = v292                                                                             ⟨289400⟩
        v292 = v292 + 1                                                                               ⟨289400⟩
        si v292_avant == 10 :
            tête_image_de_base(tête=c18, image=19)                                                    ⟨289405⟩
        si touche_passer() != 0 : aller à loc_A5B0D                                                   ⟨289411⟩
        Scene_Tick(scène=scène7)                                                                      ⟨289417⟩
    loc_A5B0D:                                                                                        ⟨289427⟩
    v292 = 0                                                                                          ⟨289428⟩
    tant que v292 < 2 :
        Scene_Tick(scène=scène7)                                                                      ⟨289434⟩
        v292 = v292 + 1                                                                               ⟨289436⟩
    v290 = 0                                                                                          ⟨289456⟩
    v284 = 0                                                                                          ⟨289458⟩
sinon :
    v3066→0.méthode8(254)                                                                             ⟨289466⟩
    v14 = 45                                                                                          ⟨289468⟩
    si = scène7.compteur                                                                              ⟨289469⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨289478⟩
    tant que (scène7.compteur < v12) et (scène7.terminée == 0) :
        v282 = scène7.compteur                                                                        ⟨289483⟩
        si si + 3 == v282 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[12])                            ⟨289496⟩
        si si + 3 == v282 :
            tête_texte_de_lèvres(tête=c18, texte="Thtsdalfe")                                         ⟨289506⟩
        si si + 15 == v282 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨289516⟩
        si si + 16 == v282 :
            tête_image_de_base(tête=c18, image=19)                                                    ⟨289526⟩
        si si + 19 == v282 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨289536⟩
        si si + 20 == v282 :
            tête_image_de_base(tête=c18, image=19)                                                    ⟨289546⟩
        si v282 == v12 :
            tête_image_de_base(tête=c18, image=-1)                                                    ⟨289555⟩
        si touche_passer() != 0 : aller à loc_A5C8C                                                   ⟨289561⟩
        Scene_Tick(scène=scène7)                                                                      ⟨289567⟩
    loc_A5C8C:                                                                                        ⟨289590⟩
    si byte_4F55C != 0 :
        Scene_Destruct(scène=scène7, drapeaux=0)                                                      ⟨289599⟩
        v270 = 0                                                                                      ⟨289625⟩
        v265 = 0                                                                                      ⟨289626⟩
        v264 = 0                                                                                      ⟨289627⟩
        v256 = 0                                                                                      ⟨289652⟩
        v251 = 0                                                                                      ⟨289653⟩
        v250 = 0                                                                                      ⟨289654⟩
        v241 = 0                                                                                      ⟨289671⟩
        v240 = 0                                                                                      ⟨289672⟩
        v231 = 0                                                                                      ⟨289689⟩
        v230 = 0                                                                                      ⟨289690⟩
        v221 = 0                                                                                      ⟨289707⟩
        v220 = 0                                                                                      ⟨289708⟩
        v211 = 0                                                                                      ⟨289725⟩
        v210 = 0                                                                                      ⟨289726⟩
        v201 = 0                                                                                      ⟨289743⟩
        v200 = 0                                                                                      ⟨289744⟩
        v191 = 0                                                                                      ⟨289761⟩
        v190 = 0                                                                                      ⟨289762⟩
        v181 = 0                                                                                      ⟨289779⟩
        v180 = 0                                                                                      ⟨289780⟩
        v171 = 0                                                                                      ⟨289797⟩
        v170 = 0                                                                                      ⟨289798⟩
        v155 = 0                                                                                      ⟨289819⟩
        v154 = 0                                                                                      ⟨289820⟩
        v139 = 0                                                                                      ⟨289841⟩
        v138 = 0                                                                                      ⟨289842⟩
        v123 = 0                                                                                      ⟨289863⟩
        v122 = 0                                                                                      ⟨289864⟩
        v107 = 0                                                                                      ⟨289885⟩
        v106 = 0                                                                                      ⟨289886⟩
        v91 = 0                                                                                       ⟨289907⟩
        v90 = 0                                                                                       ⟨289908⟩
        v75 = 0                                                                                       ⟨289929⟩
        v74 = 0                                                                                       ⟨289930⟩
        v65 = 0                                                                                       ⟨289947⟩
        v64 = 0                                                                                       ⟨289948⟩
        v55 = 0                                                                                       ⟨289965⟩
        v54 = 0                                                                                       ⟨289966⟩
        voix_arrête(voix=voix1)                                                                       ⟨289970⟩
        v3012 = 0                                                                                     ⟨289987⟩
        v3007 = 0                                                                                     ⟨289988⟩
        v3006 = 0                                                                                     ⟨289989⟩
        canal_arrête(canal=canal2)                                                                    ⟨289992⟩
        sub_5C1C(&v938, 2)                                                                            ⟨289997⟩
        v43 = 0                                                                                       ⟨290020⟩
        v42 = 0                                                                                       ⟨290021⟩
        retour                                                                                        ⟨290056⟩
    v14 = 40                                                                                          ⟨290059⟩
    si = scène7.compteur                                                                              ⟨290060⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨290069⟩
    tant que (scène7.compteur < v12) et (scène7.terminée == 0) :
        v282 = scène7.compteur                                                                        ⟨290074⟩
        si si + 3 == v282 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[13])                            ⟨290087⟩
        si si + 3 == v282 :
            tête_texte_de_lèvres(tête=c18, texte="ndeth")                                             ⟨290097⟩
        si si + 19 == v282 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨290107⟩
        si si + 20 == v282 :
            tête_image_de_base(tête=c18, image=19)                                                    ⟨290117⟩
        si v12 - 1 == v282 :
            sub_30AD0(objet1, 0)                                                                      ⟨290128⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨290138⟩
            aller à loc_A6375                                                                         ⟨290140⟩
        Scene_Tick(scène=scène7)                                                                      ⟨290145⟩
    loc_A6375:                                                                                        ⟨290168⟩
    si byte_4F55C != 0 :
        Scene_Destruct(scène=scène7, drapeaux=0)                                                      ⟨290177⟩
        v270 = 0                                                                                      ⟨290203⟩
        v265 = 0                                                                                      ⟨290204⟩
        v264 = 0                                                                                      ⟨290205⟩
        v256 = 0                                                                                      ⟨290230⟩
        v251 = 0                                                                                      ⟨290231⟩
        v250 = 0                                                                                      ⟨290232⟩
        v241 = 0                                                                                      ⟨290249⟩
        v240 = 0                                                                                      ⟨290250⟩
        v231 = 0                                                                                      ⟨290267⟩
        v230 = 0                                                                                      ⟨290268⟩
        v221 = 0                                                                                      ⟨290285⟩
        v220 = 0                                                                                      ⟨290286⟩
        v211 = 0                                                                                      ⟨290303⟩
        v210 = 0                                                                                      ⟨290304⟩
        v201 = 0                                                                                      ⟨290321⟩
        v200 = 0                                                                                      ⟨290322⟩
        v191 = 0                                                                                      ⟨290339⟩
        v190 = 0                                                                                      ⟨290340⟩
        v181 = 0                                                                                      ⟨290357⟩
        v180 = 0                                                                                      ⟨290358⟩
        v171 = 0                                                                                      ⟨290375⟩
        v170 = 0                                                                                      ⟨290376⟩
        v155 = 0                                                                                      ⟨290397⟩
        v154 = 0                                                                                      ⟨290398⟩
        v139 = 0                                                                                      ⟨290419⟩
        v138 = 0                                                                                      ⟨290420⟩
        v123 = 0                                                                                      ⟨290441⟩
        v122 = 0                                                                                      ⟨290442⟩
        v107 = 0                                                                                      ⟨290463⟩
        v106 = 0                                                                                      ⟨290464⟩
        v91 = 0                                                                                       ⟨290485⟩
        v90 = 0                                                                                       ⟨290486⟩
        v75 = 0                                                                                       ⟨290507⟩
        v74 = 0                                                                                       ⟨290508⟩
        v65 = 0                                                                                       ⟨290525⟩
        v64 = 0                                                                                       ⟨290526⟩
        v55 = 0                                                                                       ⟨290543⟩
        v54 = 0                                                                                       ⟨290544⟩
        voix_arrête(voix=voix1)                                                                       ⟨290548⟩
        v3012 = 0                                                                                     ⟨290565⟩
        v3007 = 0                                                                                     ⟨290566⟩
        v3006 = 0                                                                                     ⟨290567⟩
        canal_arrête(canal=canal2)                                                                    ⟨290570⟩
        sub_5C1C(&v938, 2)                                                                            ⟨290575⟩
        v43 = 0                                                                                       ⟨290598⟩
        v42 = 0                                                                                       ⟨290599⟩
        retour                                                                                        ⟨290634⟩
    v14 = 44                                                                                          ⟨290637⟩
    si = scène7.compteur                                                                              ⟨290638⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨290647⟩
    tant que (scène7.compteur < v12) et (scène7.terminée == 0) :
        v282 = scène7.compteur                                                                        ⟨290652⟩
        si si + 3 == v282 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[14])                            ⟨290665⟩
        si si + 3 == v282 :
            tête_texte_de_lèvres(tête=c18, texte="ofamrcnry")                                         ⟨290675⟩
        si si + 15 == v282 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨290685⟩
        si v12 - 1 == v282 :
            sub_30AD0(objet1, 0)                                                                      ⟨290696⟩
        si touche_passer() != 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨290706⟩
            aller à loc_A6A48                                                                         ⟨290708⟩
        Scene_Tick(scène=scène7)                                                                      ⟨290713⟩
loc_A6A48:                                                                                            ⟨290736⟩
Scene_Destruct(scène=scène7, drapeaux=0)                                                              ⟨290740⟩
si byte_4F55C != 0 :
    v270 = 0                                                                                          ⟨290771⟩
    v265 = 0                                                                                          ⟨290772⟩
    v264 = 0                                                                                          ⟨290773⟩
    v256 = 0                                                                                          ⟨290798⟩
    v251 = 0                                                                                          ⟨290799⟩
    v250 = 0                                                                                          ⟨290800⟩
    v241 = 0                                                                                          ⟨290817⟩
    v240 = 0                                                                                          ⟨290818⟩
    v231 = 0                                                                                          ⟨290835⟩
    v230 = 0                                                                                          ⟨290836⟩
    v221 = 0                                                                                          ⟨290853⟩
    v220 = 0                                                                                          ⟨290854⟩
    v211 = 0                                                                                          ⟨290871⟩
    v210 = 0                                                                                          ⟨290872⟩
    v201 = 0                                                                                          ⟨290889⟩
    v200 = 0                                                                                          ⟨290890⟩
    v191 = 0                                                                                          ⟨290907⟩
    v190 = 0                                                                                          ⟨290908⟩
    v181 = 0                                                                                          ⟨290925⟩
    v180 = 0                                                                                          ⟨290926⟩
    v171 = 0                                                                                          ⟨290943⟩
    v170 = 0                                                                                          ⟨290944⟩
    v155 = 0                                                                                          ⟨290965⟩
    v154 = 0                                                                                          ⟨290966⟩
    v139 = 0                                                                                          ⟨290987⟩
    v138 = 0                                                                                          ⟨290988⟩
    v123 = 0                                                                                          ⟨291009⟩
    v122 = 0                                                                                          ⟨291010⟩
    v107 = 0                                                                                          ⟨291031⟩
    v106 = 0                                                                                          ⟨291032⟩
    v91 = 0                                                                                           ⟨291053⟩
    v90 = 0                                                                                           ⟨291054⟩
    v75 = 0                                                                                           ⟨291075⟩
    v74 = 0                                                                                           ⟨291076⟩
    v65 = 0                                                                                           ⟨291093⟩
    v64 = 0                                                                                           ⟨291094⟩
    v55 = 0                                                                                           ⟨291111⟩
    v54 = 0                                                                                           ⟨291112⟩
    voix_arrête(voix=voix1)                                                                           ⟨291116⟩
    v3012 = 0                                                                                         ⟨291133⟩
    v3007 = 0                                                                                         ⟨291134⟩
    v3006 = 0                                                                                         ⟨291135⟩
    canal_arrête(canal=canal2)                                                                        ⟨291138⟩
    sub_5C1C(&v938, 2)                                                                                ⟨291143⟩
    v43 = 0                                                                                           ⟨291166⟩
    v42 = 0                                                                                           ⟨291167⟩
    retour                                                                                            ⟨291202⟩

──── scène8 ────
scène8 = Scene_Create(cadence=15, palette=255, surface=&v554)                                         ⟨291211⟩
c19 = Layer(ressource=midgames 42, x=0, y=-80)                                                        ⟨291218⟩
c20 = Layer(ressource=midgames 33, x=0, y=0)                                                          ⟨291226⟩
c21 = Layer(ressource=midgames 34, x=0, y=0)                                                          ⟨291234⟩
c22 = Layer(ressource=midgames 35, x=0, y=0)                                                          ⟨291242⟩
c23 = Layer(ressource=midgames 29, x=0, y=-24)                                                        ⟨291250⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨291260⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨291269⟩
ajoute c19 à scène8                                                                                   ⟨291274⟩
ajoute c23 à scène8                                                                                   ⟨291279⟩
ajoute c20 à scène8                                                                                   ⟨291284⟩
ajoute c21 à scène8                                                                                   ⟨291289⟩
ajoute c22 à scène8                                                                                   ⟨291294⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨291306⟩
Widget_Method_DispatchC_37052(objet1, 0)                                                              ⟨291311⟩
Widget_Method_Dispatch8_37030(objet1, 12)                                                             ⟨291316⟩
v290 = 0                                                                                              ⟨291318⟩
v292 = 0                                                                                              ⟨291319⟩
v294 = 1                                                                                              ⟨291320⟩
v12 = 135                                                                                             ⟨291323⟩
v3188 = 436                                                                                           ⟨291328⟩
v3186 = word_4D392                                                                                    ⟨291330⟩
word_4D392 = &v3188                                                                                   ⟨291332⟩
si v21 != 0 :
    charge(asoundfx 76)                                                                               ⟨291349⟩
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨291354⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 76, x=0)                                        ⟨291361⟩
    v310 = word_4F00C                                                                                 ⟨291364⟩
    v312 = 0                                                                                          ⟨291365⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3190)                                        ⟨291371⟩
        sub_50F5(canal3.+0→4, v3190, v310, v312)                                                      ⟨291378⟩
v316 = 0                                                                                              ⟨291386⟩
si v20 != 0 :
    Scene_Tick(scène=scène8)                                                                          ⟨291391⟩
    charge(mid33voc 8)                                                                                ⟨291399⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 8)                                 ⟨291405⟩
tant que (scène8.compteur < v12) et (scène8.terminée == 0) :
    di = scène8.compteur                                                                              ⟨291412⟩
    si scène8.compteur > 30 :
        si scène8.compteur < 120 :
            v324 = v294                                                                               ⟨291418⟩
            v294_avant = v294                                                                         ⟨291419⟩
            v294 = v294 + 1                                                                           ⟨291419⟩
            c23.image = v324                                                                          ⟨291422⟩
    si scène8.compteur == 90 :
        Scene_SetFps(scène=scène8, cadence=9)                                                         ⟨291430⟩
    si scène8.compteur == 120 :
        retire(parent=scène8, calque=c23)                                                             ⟨291439⟩
        c23.détruit(3)                                                                                ⟨291447⟩
    si mid33voc 0.+0 + 6 == scène8.compteur :
        si v20 == 0 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[15])                            ⟨291468⟩
    si mid33voc 0.+0 + 5 < scène8.compteur :
        si mid33voc 0.+0 + 10 > scène8.compteur :
            v326 = v290                                                                               ⟨291481⟩
            v290_avant = v290                                                                         ⟨291482⟩
            v290 = v290 + 1                                                                           ⟨291482⟩
            c21.image = v326                                                                          ⟨291485⟩
    si mid33voc 0.+0 + 13 < scène8.compteur :
        si mid33voc 0.+0 + 18 > scène8.compteur :
            v328 = v292                                                                               ⟨291497⟩
            v292_avant = v292                                                                         ⟨291498⟩
            v292 = v292 + 1                                                                           ⟨291498⟩
            c22.image = v328                                                                          ⟨291501⟩
    si midgames 39.+0 + 8 == scène8.compteur :
        si v20 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨291513⟩
    si midgames 39.+0 + 27 == scène8.compteur :
        si v20 == 0 :
            texte_formaté(zone=objet1, format=11543, a=4, b=160, c=textes1[16])                       ⟨291535⟩
    si midgames 39.+0 + 25 < scène8.compteur :
        si midgames 39.+0 + 30 > scène8.compteur :
            v290 = v290 - 1                                                                           ⟨291547⟩
            v330 = v290                                                                               ⟨291549⟩
            c21.image = v330                                                                          ⟨291552⟩
    si midgames 39.+0 + 32 < scène8.compteur :
        si midgames 39.+0 + 41 > scène8.compteur :
            si scène8.compteur & 1 != 0 :
                v292 = v292 - 1                                                                       ⟨291565⟩
                c22.image = v292                                                                      ⟨291570⟩
    si midgames 39.+0 + 60 == scène8.compteur :
        si v20 == 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨291584⟩
    si touche_passer() != 0 :
        si v20 == 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨291598⟩
        aller à loc_A74FB                                                                             ⟨291602⟩
    Scene_Tick(scène=scène8)                                                                          ⟨291607⟩
loc_A74FB:                                                                                            ⟨291630⟩
si v20 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨291635⟩
v316 = 0                                                                                              ⟨291656⟩
canal_arrête(canal=canal3)                                                                            ⟨291659⟩
sub_5C1C(&v3188, 2)                                                                                   ⟨291664⟩
v302 = 0                                                                                              ⟨291683⟩
Scene_Destruct(scène=scène8, drapeaux=0)                                                              ⟨291687⟩
fondu_disparition(palette=pal1, couleur=&v38, pas=2, premier=0, nombre=256)                           ⟨291696⟩
v282 = 0                                                                                              ⟨291701⟩
v292 = 0                                                                                              ⟨291705⟩
flux_iff(flux=flux2)                                                                                  ⟨291718⟩
flux2.ouvre(chemin1, 1)                                                                               ⟨291730⟩
iff_form(flux=flux2, balise=dword_4B706, x=0)                                                         ⟨291736⟩
iff_form(flux=flux2, balise=dword_4B70B, x=0)                                                         ⟨291742⟩
iff_chunk(flux=flux2, balise=dword_4B710, x=0)                                                        ⟨291748⟩
v314 = v3248                                                                                          ⟨291751⟩
Memory_TypedFreeWrapper_32871(27668, v314, 2, 0, 1)                                                   ⟨291757⟩
v316 = ?                                                                                              ⟨291759⟩
v318 = Memory_TypedFreeWrapper_32871(27668, v314, 2, 0, 1)                                            ⟨291760⟩
v293 = 1                                                                                              ⟨291764⟩
v292 = 0                                                                                              ⟨291765⟩
ResourceRecord_ReadDwordFieldB_42B12(flux2, données(v318))                                            ⟨291780⟩
v3261 = v3244                                                                                         ⟨291783⟩
iff_ferme(flux=flux2)                                                                                 ⟨291786⟩
iff_form(flux=flux2, balise=dword_4B715, x=0)                                                         ⟨291792⟩
iff_chunk(flux=flux2, balise=dword_4B71A, x=0)                                                        ⟨291798⟩
Memory_TypedFreeWrapper_32871(27668, v3248, 2, 0, 1)                                                  ⟨291807⟩
v324 = ?                                                                                              ⟨291809⟩
v326 = Memory_TypedFreeWrapper_32871(27668, v3248, 2, 0, 1)                                           ⟨291810⟩
v283 = 1                                                                                              ⟨291814⟩
v282 = 0                                                                                              ⟨291815⟩
v282 = v3248                                                                                          ⟨291817⟩
ResourceRecord_ReadDwordFieldB_42B12(flux2, données(v326))                                            ⟨291830⟩
iff_ferme_form(flux=flux2)                                                                            ⟨291834⟩
iff_ferme_form(flux=flux2)                                                                            ⟨291839⟩
palette_depuis(pal9(midgames 39))                                                                     ⟨291854⟩
palette_copie(destination=pal1, source=pal9(midgames 39))                                             ⟨291863⟩
palette_alloue(palette=pal10, premier=0, nombre=256)                                                  ⟨291869⟩
palette_remplit(palette=pal10, couleur=&v302, premier=v314, nombre=pal10.+0)                          ⟨291878⟩
palette_envoie(palette=pal10, pas=0)                                                                  ⟨291890⟩
GlyphObject_ConstructWithBuffer_36D56(&scène8+10, midgames 30)                                        ⟨291900⟩
zone_texte(zone=zone1, police=0)                                                                      ⟨291906⟩
v310 = word_4D36E                                                                                     ⟨291909⟩
TextFormat_ApplyStyleAttribute_357D1(canal3, v310)                                                    ⟨291913⟩
scène8.+6 = 2                                                                                         ⟨291917⟩
Widget_ComputeBoundsExtent_372DC(zone1, 160, 97)                                                      ⟨291922⟩
texte_formaté(zone=zone1, format=11583)                                                               ⟨291927⟩
fondu_apparition(palette=pal1, couleur=&v302, pas=2, premier=0, nombre=256)                           ⟨291936⟩
vide_entrées()                                                                                        ⟨291938⟩
v314_avant = v314                                                                                     ⟨291940⟩
v314 = booléen                                                                                        ⟨291940⟩
v318_avant = v318                                                                                     ⟨291941⟩
v318 = booléen                                                                                        ⟨291941⟩
v314 = 300                                                                                            ⟨291942⟩
tant que booléen == 0 :
    si v19 != 0 :
        si booléen == 0 :
            v319 = 1                                                                                  ⟨291977⟩
    si touche_passer() != 0 : aller à loc_A79BA                                                       ⟨291982⟩
si v319 != 0 : aller à loc_A794A                                                                      ⟨292001⟩
loc_A79BA:                                                                                            ⟨292003⟩
fondu_disparition(palette=pal1, couleur=&v302, pas=2, premier=0, nombre=256)                          ⟨292011⟩
v292 = 0                                                                                              ⟨292047⟩
v282 = 0                                                                                              ⟨292065⟩
v270 = 0                                                                                              ⟨292090⟩
v265 = 0                                                                                              ⟨292091⟩
v264 = 0                                                                                              ⟨292092⟩
v256 = 0                                                                                              ⟨292117⟩
v251 = 0                                                                                              ⟨292118⟩
v250 = 0                                                                                              ⟨292119⟩
v241 = 0                                                                                              ⟨292136⟩
v240 = 0                                                                                              ⟨292137⟩
v231 = 0                                                                                              ⟨292154⟩
v230 = 0                                                                                              ⟨292155⟩
v221 = 0                                                                                              ⟨292172⟩
v220 = 0                                                                                              ⟨292173⟩
v211 = 0                                                                                              ⟨292190⟩
v210 = 0                                                                                              ⟨292191⟩
v201 = 0                                                                                              ⟨292208⟩
v200 = 0                                                                                              ⟨292209⟩
v191 = 0                                                                                              ⟨292226⟩
v190 = 0                                                                                              ⟨292227⟩
v181 = 0                                                                                              ⟨292244⟩
v180 = 0                                                                                              ⟨292245⟩
v171 = 0                                                                                              ⟨292262⟩
v170 = 0                                                                                              ⟨292263⟩
v155 = 0                                                                                              ⟨292284⟩
v154 = 0                                                                                              ⟨292285⟩
v139 = 0                                                                                              ⟨292306⟩
v138 = 0                                                                                              ⟨292307⟩
v123 = 0                                                                                              ⟨292328⟩
v122 = 0                                                                                              ⟨292329⟩
v107 = 0                                                                                              ⟨292350⟩
v106 = 0                                                                                              ⟨292351⟩
v91 = 0                                                                                               ⟨292372⟩
v90 = 0                                                                                               ⟨292373⟩
v75 = 0                                                                                               ⟨292394⟩
v74 = 0                                                                                               ⟨292395⟩
v65 = 0                                                                                               ⟨292412⟩
v64 = 0                                                                                               ⟨292413⟩
v55 = 0                                                                                               ⟨292430⟩
v54 = 0                                                                                               ⟨292431⟩
voix_arrête(voix=voix1)                                                                               ⟨292435⟩
v3012 = 0                                                                                             ⟨292452⟩
v3007 = 0                                                                                             ⟨292453⟩
v3006 = 0                                                                                             ⟨292454⟩
canal_arrête(canal=canal2)                                                                            ⟨292457⟩
sub_5C1C(&v938, 2)                                                                                    ⟨292462⟩
v43 = 0                                                                                               ⟨292485⟩
v42 = 0                                                                                               ⟨292486⟩
retour                                                                                                ⟨292521⟩
```

## Tableaux du segment de données

