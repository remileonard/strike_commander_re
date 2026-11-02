# Script extrait de `sub_7CCD0` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## sub_7CCD0

```
bp = sp                                                                                               ⟨230844⟩
tableau_textes(tableau=textes1, nombre=29, longueur=200)                                              ⟨230854⟩
byte_4F55C = 0                                                                                        ⟨230856⟩
v9 = 0                                                                                                ⟨230857⟩
v10 = 0                                                                                               ⟨230858⟩
v11 = 0                                                                                               ⟨230859⟩
si word_4CA5B != 0 :
    v10 = 1                                                                                           ⟨230862⟩
v14 = word_4D36E                                                                                      ⟨230866⟩
v352 = 0                                                                                              ⟨230867⟩
TextFormat_ApplyStyleAttribute_357D1(&v352, v14)                                                      ⟨230872⟩
v366 = 0                                                                                              ⟨230874⟩
TextRenderer_ApplyFormatChange_3584E(&v366, 0)                                                        ⟨230883⟩
sub_3499B(&v18, &v366)                                                                                ⟨230889⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨230895⟩
v28 = 0                                                                                               ⟨230901⟩
sub_435F1(pak mid12)                                                                                  ⟨230923⟩
si v10 != 0 :
    si sub_993C(chemin1) != 0 :
        pak mid12voc.ouvre(chemin1, 1)                                                                ⟨230954⟩
        sub_435F1(pak mid12voc)                                                                       ⟨230958⟩
    sinon :
        v10 = 0                                                                                       ⟨230963⟩
sinon :
    v10 = 0                                                                                           ⟨230963⟩
v38 = 0                                                                                               ⟨230966⟩
v33 = 0                                                                                               ⟨230968⟩
v32 = 0                                                                                               ⟨230969⟩
v40 = byte_4CA58                                                                                      ⟨230971⟩
si v40 - 1 <= 4 :
    si (v40 - 1)·2 == 0 ou ((v40 - 1)·2 != 2) et (((v40 - 1)·2 != 4) et (((v40 - 1)·2 != 6) et ((v40 - 1)·2 != 8))) :
        si sub_993C(chemin1) != 0 :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨231015⟩
            sub_435F1(pak rsoundfx)                                                                   ⟨231019⟩
            flux_iff(flux=flux1)                                                                      ⟨231033⟩
            v2955 = 256                                                                               ⟨231036⟩
            v2959 = 0                                                                                 ⟨231037⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨231045⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨231051⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨231057⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨231061⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨231063⟩
            v206 = 1                                                                                  ⟨231064⟩
            tant que v206 <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨231070⟩
                ds:26002[v206·2] = iff_lit_mot(flux=flux1)                                            ⟨231074⟩
                v206_avant = v206·2                                                                   ⟨231075⟩
                v206 = v206 + 1                                                                       ⟨231075⟩
            iff_ferme_form(flux=flux1)                                                                ⟨231082⟩
            v11 = 1                                                                                   ⟨231084⟩
            iff_ferme_form(flux=flux1)                                                                ⟨231088⟩
        si sub_993C(chemin1) != 0 :
            v9 = 1                                                                                    ⟨231114⟩
            si v11 == 0 :
                word_4F048 = 90                                                                       ⟨231119⟩
    sinon :
        si sub_993C(chemin1) != 0 :
            si word_4CA5D != 0 :
                pak asoundfx.ouvre(chemin1, 1)                                                        ⟨231156⟩
                sub_435F1(pak asoundfx)                                                               ⟨231160⟩
                flux_iff(flux=flux1)                                                                  ⟨231174⟩
                v2955 = 256                                                                           ⟨231177⟩
                v2959 = 0                                                                             ⟨231178⟩
                flux1.ouvre(chemin1, 1)                                                               ⟨231186⟩
                iff_form(flux=flux1, balise='VOLU', x=0)                                              ⟨231192⟩
                iff_chunk(flux=flux1, balise='ADLB', x=1)                                             ⟨231198⟩
                iff_lit_mot(flux=flux1)                                                               ⟨231202⟩
                word_4F048 = iff_lit_mot(flux=flux1)                                                  ⟨231204⟩
                v206 = 1                                                                              ⟨231205⟩
                tant que v206 <= 106 :
                    iff_lit_mot(flux=flux1)                                                           ⟨231211⟩
                    ds:26002[v206·2] = iff_lit_mot(flux=flux1)                                        ⟨231215⟩
                    v206_avant = v206·2                                                               ⟨231216⟩
                    v206 = v206 + 1                                                                   ⟨231216⟩
                iff_ferme_form(flux=flux1)                                                            ⟨231223⟩
                v11 = 1                                                                               ⟨231225⟩
                iff_ferme_form(flux=flux1)                                                            ⟨231229⟩
        si sub_993C(chemin1) != 0 :
            v9 = 1                                                                                    ⟨231272⟩
            si v11 == 0 :
                word_4F048 = 255                                                                      ⟨231277⟩
v42 = word_4B15C                                                                                      ⟨231284⟩
si v11 != 0 :
    v2892 = word_4D392                                                                                ⟨231292⟩
    word_4D392 = &v2894                                                                               ⟨231294⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨231303⟩
    v206 = 0                                                                                          ⟨231305⟩
    tant que v206 < 2 :
        charge(asoundfx (v206 + &v42)→0)                                                              ⟨231324⟩
        canal_enregistre(canal=canal1, ressource=asoundfx (v206 + &v42)→0, x=0)                       ⟨231331⟩
        canal_arrête(canal=canal1)                                                                    ⟨231335⟩
        v210 = 0                                                                                      ⟨231354⟩
        v206 = v206 + 1                                                                               ⟨231355⟩
    canal_arrête(canal=canal1)                                                                        ⟨231365⟩
    sub_5C1C(&v2894, 2)                                                                               ⟨231370⟩
v736 = 436                                                                                            ⟨231374⟩
v734 = word_4D392                                                                                     ⟨231376⟩
word_4D392 = &v736                                                                                    ⟨231378⟩
v736 = 444                                                                                            ⟨231379⟩
v740 = 0                                                                                              ⟨231382⟩
si v9 != 0 :
    sub_435F1(pak mmusic)                                                                             ⟨231398⟩
    si v10 != 0 :
        v205 = 7                                                                                      ⟨231402⟩
    sinon :
        v205 = 6                                                                                      ⟨231406⟩
    charge(mmusic v205)                                                                               ⟨231417⟩
    canal_init(canal=canal2, pilote=word_4CA59)                                                       ⟨231422⟩
    canal_enregistre(canal=canal2, ressource=mmusic v205, x=0)                                        ⟨231429⟩
v749 = booléen                                                                                        ⟨231446⟩
v745 = booléen                                                                                        ⟨231447⟩
si v10 != 0 :
    voix_pilote(voix=voix1, pilote=word_4CA5B)                                                        ⟨231456⟩
    flux_iff(flux=flux1)                                                                              ⟨231470⟩
    v2955 = 256                                                                                       ⟨231473⟩
    v2959 = 0                                                                                         ⟨231474⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨231482⟩
    iff_form(flux=flux1, balise='MG12', x=0)                                                          ⟨231488⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨231494⟩
    v206 = 0                                                                                          ⟨231496⟩
    tant que v206 < 2 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨231504⟩
        v208 = v2938                                                                                  ⟨231507⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·v206), taille=v208)                  ⟨231518⟩
        v2951 = v2934                                                                                 ⟨231521⟩
        v206 = v206 + 1                                                                               ⟨231522⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨231529⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨231534⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨231556⟩
    v2955 = 256                                                                                       ⟨231559⟩
    v2959 = 0                                                                                         ⟨231560⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨231568⟩
    iff_form(flux=flux1, balise='MG12', x=0)                                                          ⟨231574⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨231580⟩
    v206 = 0                                                                                          ⟨231582⟩
    tant que v206 < 29 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨231590⟩
        v208 = v2938                                                                                  ⟨231593⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·v206), taille=v208)                  ⟨231604⟩
        v2951 = v2934                                                                                 ⟨231607⟩
        v206 = v206 + 1                                                                               ⟨231608⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨231615⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[22], arg_6)                                                                ⟨231629⟩
        CRT_Strcat(textes1[22], 10110)                                                                ⟨231638⟩
        CRT_Strcat(textes1[22], textes1[23])                                                          ⟨231652⟩
    sinon :
        si CRT_Strlen(arg_8) != 0 :
            CRT_Strcat(textes1[22], arg_8)                                                            ⟨231669⟩
            CRT_Strcat(textes1[22], 10110)                                                            ⟨231678⟩
            CRT_Strcat(textes1[22], textes1[23])                                                      ⟨231692⟩
        sinon :
            si CRT_Strlen(arg_10) != 0 :
                CRT_Strcat(textes1[22], arg_10)                                                       ⟨231709⟩
                CRT_Strcat(textes1[22], 10110)                                                        ⟨231718⟩
                CRT_Strcat(textes1[22], textes1[23])                                                  ⟨231732⟩
            sinon :
                CRT_Strcat(textes1[22], textes1[23])                                                  ⟨231749⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨231756⟩
charge(mid12 4)                                                                                       ⟨231775⟩
charge(mid12 3)                                                                                       ⟨231787⟩
charge(mid12 5)                                                                                       ⟨231799⟩
charge(mid12 8)                                                                                       ⟨231811⟩
charge(mid12 9)                                                                                       ⟨231823⟩
charge(mid12 6)                                                                                       ⟨231835⟩
charge_convdata_type2("normal")                                                                       ⟨231845⟩
palette_depuis(pal2(convdata type 2 "normal"))                                                        ⟨231852⟩
charge(mid12 21)                                                                                      ⟨231864⟩
palette_depuis(pal3(mid12 21))                                                                        ⟨231871⟩
charge(mid12 20)                                                                                      ⟨231883⟩
palette_depuis(pal4(mid12 20))                                                                        ⟨231890⟩
charge(mid12 22)                                                                                      ⟨231902⟩
palette_depuis(pal5(mid12 22))                                                                        ⟨231909⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨231919⟩
charge_convdata_type0("walt", drapeau=3)                                                              ⟨231929⟩
v196 = 0                                                                                              ⟨231931⟩
v192 = 2                                                                                              ⟨231932⟩
v191 = 0                                                                                              ⟨231933⟩
v190 = 0                                                                                              ⟨231934⟩
TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                       ⟨231948⟩
v198 = ?                                                                                              ⟨231950⟩
v200 = TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                ⟨231951⟩
v196 = v200                                                                                           ⟨231953⟩
v192 = 2                                                                                              ⟨231954⟩
v191 = 1                                                                                              ⟨231955⟩
v190 = 0                                                                                              ⟨231956⟩
GlyphObject_ConstructWithBuffer_36D56(&v2850, &v196)                                                  ⟨231961⟩
sub_30A1D(&v2884, word_4D36E, &v2850)                                                                 ⟨231973⟩
Widget_Method_DispatchC_37052(&v2884, 0)                                                              ⟨231978⟩
Widget_Method_Dispatch8_37030(&v2884, 200)                                                            ⟨231983⟩
si byte_4F55C == 0 :
    si v9 != 0 :
        v202 = word_4F048                                                                             ⟨231993⟩
        si canal2.+0 != 0 :
            AIL_start_sequence(pilote=canal2.+0→4, séquence=v738)                                     ⟨232000⟩
            sub_50F5(canal2.+0→4, v738, v202, 0)                                                      ⟨232007⟩
    charge(mid12 1)                                                                                   ⟨232022⟩
    charge(mid12 18)                                                                                  ⟨232034⟩
    palette_depuis(pal6(mid12 18))                                                                    ⟨232041⟩

    ──── scène1 ────
    scène1 = Scene_Create(cadence=10, palette=255, surface=&v352)                                     ⟨232049⟩
    c1 = Layer(ressource=mid12 1)                                                                     ⟨232054⟩
    palette_copie(destination=pal1, source=pal6(mid12 18))                                            ⟨232064⟩
    ajoute c1 à scène1                                                                                ⟨232069⟩
    fondu_disparition(palette=pal1, couleur=&v28, pas=0, premier=0, nombre=256)                       ⟨232082⟩
    palette_copie(destination=pal1, source=pal6(mid12 18))                                            ⟨232091⟩
    Scene_Tick(scène=scène1)                                                                          ⟨232095⟩
    fondu_apparition(palette=pal1, couleur=&v28, pas=2, premier=0, nombre=256)                        ⟨232104⟩
    Widget_Method_DispatchC_37052(objet1, 0)                                                          ⟨232109⟩
    Widget_Method_Dispatch8_37030(objet1, 239)                                                        ⟨232114⟩
    tant que (scène1.compteur < 29) et (scène1.terminée == 0) :
        v234 = scène1.compteur                                                                        ⟨232120⟩
        si v234 == 8 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[0])                             ⟨232126⟩
        si v234 == 28 :
            sub_30AD0(objet1, 0)                                                                      ⟨232135⟩
        Scene_Tick(scène=scène1)                                                                      ⟨232153⟩
    tant que (scène1.compteur < 55) et (scène1.terminée == 0) :
        v234 = scène1.compteur                                                                        ⟨232179⟩
        si v234 == 32 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[1])                             ⟨232187⟩
        si v234 == 53 :
            sub_30AD0(objet1, 0)                                                                      ⟨232196⟩
        Scene_Tick(scène=scène1)                                                                      ⟨232214⟩
    fondu_disparition(palette=pal1, couleur=&v28, pas=0, premier=0, nombre=256)                       ⟨232243⟩
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨232248⟩
    v224 = 0                                                                                          ⟨232269⟩
    v218 = 0                                                                                          ⟨232271⟩
    v208 = 0                                                                                          ⟨232289⟩
    si byte_4F55C == 0 :
        v208 = 0                                                                                      ⟨232298⟩
        charge(mid12 7)                                                                               ⟨232305⟩

        ──── scène2 ────
        scène2 = Scene_Create(cadence=9, palette=255, surface=&v352)                                  ⟨232313⟩
        c2 = Layer(ressource=mid12 5, x=0, y=0)                                                       ⟨232320⟩
        c3 = ScaledImageLayer(ressource=mid12 6, x=44, y=17, angle=0, échelle=200, octet=0, image=0)  ⟨232332⟩
        c4 = ScaledImageLayer(ressource=mid12 7, x=44, y=17, angle=0, échelle=200, octet=0, image=0)  ⟨232344⟩
        palette_copie(destination=pal1, source=pal5(mid12 22))                                        ⟨232354⟩
        ajoute c2 à scène2                                                                            ⟨232359⟩
        ajoute c3 à scène2                                                                            ⟨232364⟩
        ajoute c4 à scène2                                                                            ⟨232369⟩
        palette_envoie(palette=pal1, pas=0)                                                           ⟨232381⟩
        v222 = 0                                                                                      ⟨232383⟩
        tant que (scène2.compteur < 42) et (scène2.terminée == 0) :
            v224 = scène2.compteur                                                                    ⟨232388⟩
            si v224 > 7 :
                si v224 < 13 :
                    v226 = v222                                                                       ⟨232394⟩
                    v222_avant = v222                                                                 ⟨232395⟩
                    v222 = v222 + 1                                                                   ⟨232395⟩
                    c4.image = v226                                                                   ⟨232398⟩
            si v224 > 24 :
                si v224 < 28 :
                    v222 = v222 - 1                                                                   ⟨232405⟩
                    v228 = v222                                                                       ⟨232407⟩
                    c4.image = v228                                                                   ⟨232410⟩
            si v224 > 28 :
                si v224 < 32 :
                    si v224 & 1 != 0 :
                        v222 = v222 - 1                                                               ⟨232419⟩
                        pal6(mid12 18).+0 = v222                                                      ⟨232421⟩
                        c4.image = pal6(mid12 19).+0                                                  ⟨232424⟩
            Scene_Tick(scène=scène2)                                                                  ⟨232436⟩
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨232462⟩
        v208 = 0                                                                                      ⟨232481⟩
        si byte_4F55C == 0 :
            v208 = 0                                                                                  ⟨232490⟩
            charge(mid12 15)                                                                          ⟨232497⟩
            v224 = 0                                                                                  ⟨232499⟩
            v218 = 0                                                                                  ⟨232502⟩
            charge(mid12 14)                                                                          ⟨232509⟩
            charge(mid12 24)                                                                          ⟨232521⟩
            palette_depuis(pal7(mid12 24))                                                            ⟨232528⟩

            ──── scène3 ────
            scène3 = Scene_Create(cadence=10, palette=255, surface=&v352)                             ⟨232536⟩
            c5 = Layer(ressource=mid12 3, x=0, y=0)                                                   ⟨232543⟩
            c6 = Layer(ressource=mid12 15, x=0, y=0)                                                  ⟨232551⟩
            c7 = ImageLayer(ressource=mid12 14, x=215, y=10, image=0)                                 ⟨232560⟩
            ajoute c5 à scène3                                                                        ⟨232566⟩
            ajoute c6 à scène3                                                                        ⟨232571⟩
            ajoute c7 à scène3                                                                        ⟨232576⟩
            palette_copie(destination=pal1, source=pal4(mid12 20))                                    ⟨232585⟩
            palette_copie(destination=pal1, source=pal7(mid12 24))                                    ⟨232594⟩
            palette_envoie(palette=pal1, pas=0)                                                       ⟨232606⟩
            si v10 != 0 :
                Scene_Tick(scène=scène3)                                                              ⟨232615⟩
                charge(mid12voc 5)                                                                    ⟨232627⟩
                voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid12voc 5)                     ⟨232633⟩
                v258 = 0                                                                              ⟨232635⟩
                tant que v258 < 8 :
                    si v258 > 1 :
                        si v258 < 7 :
                            déplace(calque=c7, dx=v258 - 13, dy=0)                                    ⟨232650⟩
                    Scene_Tick(scène=scène3)                                                          ⟨232656⟩
                    v258 = v258 + 1                                                                   ⟨232658⟩
                voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                       ⟨232666⟩
                tant que voix_en_cours(voix=voix1) != 0 :
                    Scene_Tick(scène=scène3)                                                          ⟨232680⟩
                voix_arrête(voix=voix1)                                                               ⟨232694⟩
                v250 = 0                                                                              ⟨232713⟩
            sinon :
                Widget_Method_DispatchC_37052(objet1, 0)                                              ⟨232720⟩
                Widget_Method_Dispatch8_37030(objet1, 254)                                            ⟨232725⟩
                v4 = 32                                                                               ⟨232727⟩
                si = scène3.compteur                                                                  ⟨232728⟩
                tant que (scène3.compteur < si + ((v4·70) / 100)) et (scène3.terminée == 0) :
                    v248 = scène3.compteur                                                            ⟨232742⟩
                    si v248 > 1 :
                        si v248 < 7 :
                            déplace(calque=c7, dx=v248 - 13, dy=0)                                    ⟨232754⟩
                    si v248 == 8 :
                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[2])                 ⟨232767⟩
                    si (si + ((v4·70) / 100)) - 1 == v248 :
                        sub_30AD0(objet1, 0)                                                          ⟨232778⟩
                    Scene_Tick(scène=scène3)                                                          ⟨232796⟩
            Scene_Destruct(scène=scène3, drapeaux=0)                                                  ⟨232822⟩
            v228 = 0                                                                                  ⟨232845⟩
            v224 = 0                                                                                  ⟨232861⟩
            v218 = 0                                                                                  ⟨232863⟩
            v208 = 0                                                                                  ⟨232881⟩
            si byte_4F55C == 0 :
                v208 = 0                                                                              ⟨232890⟩
                charge(mid12 2)                                                                       ⟨232897⟩
                v224 = 0                                                                              ⟨232899⟩
                v218 = 0                                                                              ⟨232902⟩
                charge(mid12 19)                                                                      ⟨232909⟩
                palette_depuis(pal6(mid12 19))                                                        ⟨232916⟩

                ──── scène4 ────
                scène4 = Scene_Create(cadence=12, palette=255, surface=&v352)                         ⟨232924⟩
                c8 = Layer(ressource=mid12 3, x=0, y=0)                                               ⟨232931⟩
                c9 = Layer(ressource=mid12 2, x=-10, y=0)                                             ⟨232939⟩
                ajoute c8 à scène4                                                                    ⟨232945⟩
                ajoute c9 à scène4                                                                    ⟨232950⟩
                palette_copie(destination=pal1, source=pal4(mid12 20))                                ⟨232959⟩
                palette_copie(destination=pal1, source=pal6(mid12 19))                                ⟨232968⟩
                palette_envoie(palette=pal1, pas=0)                                                   ⟨232980⟩
                si v10 != 0 :
                    Scene_Tick(scène=scène4)                                                          ⟨232986⟩
                    v236 = 0                                                                          ⟨232988⟩
                    tant que v236 < 20 :
                        Scene_Tick(scène=scène4)                                                      ⟨232994⟩
                        v236 = v236 + 1                                                               ⟨232996⟩
                sinon :
                    Widget_Method_DispatchC_37052(objet1, 0)                                          ⟨233007⟩
                    Widget_Method_Dispatch8_37030(objet1, 128)                                        ⟨233012⟩
                    v4 = 26                                                                           ⟨233014⟩
                    si = scène4.compteur                                                              ⟨233015⟩
                    tant que (scène4.compteur < si + ((v4·70) / 100)) et (scène4.terminée == 0) :
                        v236 = scène4.compteur                                                        ⟨233029⟩
                        si si + 2 == v236 :
                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[3])             ⟨233042⟩
                        si (si + ((v4·70) / 100)) - 1 == v236 :
                            sub_30AD0(objet1, 0)                                                      ⟨233053⟩
                        Scene_Tick(scène=scène4)                                                      ⟨233071⟩
                Scene_Destruct(scène=scène4, drapeaux=0)                                              ⟨233097⟩
                v224 = 0                                                                              ⟨233118⟩
                v218 = 0                                                                              ⟨233120⟩
                v208 = 0                                                                              ⟨233138⟩
                si byte_4F55C == 0 :

                    ──── scène5 ────
                    scène5 = Scene_Create(cadence=9, palette=255, surface=&v352)                      ⟨233150⟩
                    c10 = Layer(ressource=mid12 4, x=0, y=0)                                          ⟨233157⟩
                    CRT_Rand()                                                                        ⟨233161⟩
                    c11 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨233172⟩
                    ajoute c10 à scène5                                                               ⟨233178⟩
                    ajoute c11 à scène5                                                               ⟨233183⟩
                    palette_copie(destination=pal1, source=pal3(mid12 21))                            ⟨233192⟩
                    palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))            ⟨233201⟩
                    palette_envoie(palette=pal1, pas=0)                                               ⟨233213⟩
                    si v10 != 0 :
                        Scene_Tick(scène=scène5)                                                      ⟨233222⟩
                        charge(mid12voc 6)                                                            ⟨233234⟩
                        tête_voix(tête=c11, ressource=mid12voc 6, cadence=9)                          ⟨233240⟩
                        v220 = 0                                                                      ⟨233242⟩
                        tant que v220 < 3 :
                            Scene_Tick(scène=scène5)                                                  ⟨233248⟩
                            v220 = v220 + 1                                                           ⟨233250⟩
                        tant que tête_parle(tête=c11) != 0 :
                            Scene_Tick(scène=scène5)                                                  ⟨233267⟩
                        tête_image_de_base(tête=c11, image=22)                                        ⟨233280⟩
                        charge(mid12voc 7)                                                            ⟨233292⟩
                        tête_voix(tête=c11, ressource=mid12voc 7, cadence=9)                          ⟨233298⟩
                        v220 = 0                                                                      ⟨233300⟩
                        tant que v220 < 2 :
                            Scene_Tick(scène=scène5)                                                  ⟨233306⟩
                            v220 = v220 + 1                                                           ⟨233308⟩
                        tant que tête_parle(tête=c11) != 0 :
                            Scene_Tick(scène=scène5)                                                  ⟨233325⟩
                        v220 = 0                                                                      ⟨233336⟩
                        tant que v220 < 2 :
                            Scene_Tick(scène=scène5)                                                  ⟨233342⟩
                            v220 = v220 + 1                                                           ⟨233344⟩
                        tête_image_de_base(tête=c11, image=25)                                        ⟨233351⟩
                        charge(mid12voc 8)                                                            ⟨233363⟩
                        tête_voix(tête=c11, ressource=mid12voc 8, cadence=9)                          ⟨233369⟩
                        v220 = 0                                                                      ⟨233371⟩
                        tant que v220 < 2 :
                            Scene_Tick(scène=scène5)                                                  ⟨233377⟩
                            v220 = v220 + 1                                                           ⟨233379⟩
                        tant que tête_parle(tête=c11) != 0 :
                            Scene_Tick(scène=scène5)                                                  ⟨233396⟩
                        v220 = 0                                                                      ⟨233407⟩
                        tant que v220 < 4 :
                            Scene_Tick(scène=scène5)                                                  ⟨233413⟩
                            v220 = v220 + 1                                                           ⟨233415⟩
                        v224 = 0                                                                      ⟨233455⟩
                        v212 = 0                                                                      ⟨233473⟩
                    sinon :
                        v2864→0.méthode8(224)                                                         ⟨233481⟩
                        v4 = 35                                                                       ⟨233483⟩
                        si = scène5.compteur                                                          ⟨233484⟩
                        tant que (scène5.compteur < si + ((v4·70) / 100)) et (scène5.terminée == 0) :
                            v210 = scène5.compteur                                                    ⟨233498⟩
                            si si + 5 == v210 :
                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[4])         ⟨233510⟩
                            si si + 5 == v210 :
                                tête_texte_de_lèvres(tête=c11, texte="naitcndb")                      ⟨233520⟩
                            si (si + ((v4·70) / 100)) - 1 == v210 :
                                sub_30AD0(objet1, 0)                                                  ⟨233531⟩
                            Scene_Tick(scène=scène5)                                                  ⟨233549⟩
                        v4_avant = si + ((v4·70) / 100)                                               ⟨233572⟩
                        v4 = 46                                                                       ⟨233572⟩
                        si = scène5.compteur                                                          ⟨233573⟩
                        tant que (scène5.compteur < si + ((v4·70) / 100)) et (scène5.terminée == 0) :
                            v210 = scène5.compteur                                                    ⟨233587⟩
                            si si + 2 == v210 :
                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[5])         ⟨233600⟩
                            si si + 2 == v210 :
                                tête_texte_de_lèvres(tête=c11, texte="aftralweevamntoeechothr")       ⟨233610⟩
                            si si + 2 == v210 :
                                tête_image_de_base(tête=c11, image=22)                                ⟨233620⟩
                            si (si + ((v4·70) / 100)) - 1 == v210 :
                                sub_30AD0(objet1, 0)                                                  ⟨233631⟩
                            Scene_Tick(scène=scène5)                                                  ⟨233649⟩
                        v4_avant = si + ((v4·70) / 100)                                               ⟨233672⟩
                        v4 = 60                                                                       ⟨233672⟩
                        si = scène5.compteur                                                          ⟨233673⟩
                        tant que (scène5.compteur < si + ((v4·70) / 100)) et (scène5.terminée == 0) :
                            v210 = scène5.compteur                                                    ⟨233687⟩
                            si si + 1 == v210 :
                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[6])         ⟨233700⟩
                            si si + 1 == v210 :
                                tête_texte_de_lèvres(tête=c11, texte="uwdnthnkovlevga wthtpaeguzs")   ⟨233710⟩
                            si (si + ((v4·70) / 100)) - 1 == v210 :
                                sub_30AD0(objet1, 0)                                                  ⟨233721⟩
                            si (si + ((v4·70) / 100)) - 15 == v210 :
                                tête_image_de_base(tête=c11, image=25)                                ⟨233731⟩
                            Scene_Tick(scène=scène5)                                                  ⟨233749⟩
                    Scene_Destruct(scène=scène5, drapeaux=0)                                          ⟨233775⟩
                    si byte_4F55C == 0 :

                        ──── scène6 ────
                        scène6 = Scene_Create(cadence=9, palette=255, surface=&v352)                  ⟨233788⟩
                        c12 = Layer(ressource=mid12 3, x=0, y=0)                                      ⟨233795⟩
                        CRT_Rand()                                                                    ⟨233799⟩
                        c13 = TalkingHead(ressource=convdata type 0 "walt", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨233810⟩
                        ajoute c12 à scène6                                                           ⟨233816⟩
                        ajoute c13 à scène6                                                           ⟨233821⟩
                        palette_copie(destination=pal1, source=pal4(mid12 20))                        ⟨233830⟩
                        palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))        ⟨233839⟩
                        palette_envoie(palette=pal1, pas=0)                                           ⟨233851⟩
                        si v10 != 0 :
                            Scene_Tick(scène=scène6)                                                  ⟨233860⟩
                            v212 = 0                                                                  ⟨233865⟩
                            charge(mid12voc 0)                                                        ⟨233872⟩
                            tête_voix(tête=c13, ressource=mid12voc 0, cadence=9)                      ⟨233878⟩
                            v220 = 0                                                                  ⟨233880⟩
                            tant que v220 < 3 :
                                Scene_Tick(scène=scène6)                                              ⟨233886⟩
                                v220 = v220 + 1                                                       ⟨233888⟩
                            v220 = 0                                                                  ⟨233893⟩
                            tant que tête_parle(tête=c13) != 0 :
                                si v220 == 10 :
                                    tête_image_de_base(tête=c13, image=16)                            ⟨233901⟩
                                si v220 == 13 :
                                    tête_image_de_base(tête=c13, image=-1)                            ⟨233909⟩
                                si v220 == 23 :
                                    tête_image_de_base(tête=c13, image=21)                            ⟨233917⟩
                                v220_avant = v220                                                     ⟨233922⟩
                                v220 = v220 + 1                                                       ⟨233922⟩
                                si v220_avant == 26 :
                                    tête_image_de_base(tête=c13, image=-1)                            ⟨233927⟩
                                Scene_Tick(scène=scène6)                                              ⟨233940⟩
                            tête_image_de_base(tête=c13, image=27)                                    ⟨233954⟩
                            v220 = 0                                                                  ⟨233956⟩
                            tant que v220 < 6 :
                                Scene_Tick(scène=scène6)                                              ⟨233962⟩
                                v220 = v220 + 1                                                       ⟨233964⟩
                            v212 = 0                                                                  ⟨233986⟩
                        sinon :
                            v2864→0.méthode8(183)                                                     ⟨233994⟩
                            v4 = 40                                                                   ⟨233996⟩
                            si = scène6.compteur                                                      ⟨233997⟩
                            tant que (scène6.compteur < si + ((v4·70) / 100)) et (scène6.terminée == 0) :
                                v210 = scène6.compteur                                                ⟨234011⟩
                                si si + 3 == v210 :
                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[7])     ⟨234024⟩
                                si si + 3 == v210 :
                                    tête_texte_de_lèvres(tête=c13, texte="nokrznta ah")               ⟨234034⟩
                                si si + 10 == v210 :
                                    tête_image_de_base(tête=c13, image=16)                            ⟨234044⟩
                                si si + 13 == v210 :
                                    tête_image_de_base(tête=c13, image=-1)                            ⟨234054⟩
                                si (si + ((v4·70) / 100)) - 2 == v210 :
                                    sub_30AD0(objet1, 0)                                              ⟨234065⟩
                                Scene_Tick(scène=scène6)                                              ⟨234083⟩
                            v4_avant = si + ((v4·70) / 100)                                           ⟨234106⟩
                            v4 = 30                                                                   ⟨234106⟩
                            si = scène6.compteur                                                      ⟨234107⟩
                            tant que (scène6.compteur < si + ((v4·70) / 100)) et (scène6.terminée == 0) :
                                v210 = scène6.compteur                                                ⟨234121⟩
                                si si + 1 == v210 :
                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[8])     ⟨234133⟩
                                si si + 1 == v210 :
                                    tête_texte_de_lèvres(tête=c13, texte="imjsta ah")                 ⟨234143⟩
                                si si + 10 == v210 :
                                    tête_image_de_base(tête=c13, image=21)                            ⟨234153⟩
                                si si + 13 == v210 :
                                    tête_image_de_base(tête=c13, image=-1)                            ⟨234163⟩
                                si (si + ((v4·70) / 100)) - 1 == v210 :
                                    sub_30AD0(objet1, 0)                                              ⟨234174⟩
                                Scene_Tick(scène=scène6)                                              ⟨234192⟩
                            v4_avant = si + ((v4·70) / 100)                                           ⟨234215⟩
                            v4 = 50                                                                   ⟨234215⟩
                            si = scène6.compteur                                                      ⟨234216⟩
                            tant que (scène6.compteur < si + ((v4·70) / 100)) et (scène6.terminée == 0) :
                                v210 = scène6.compteur                                                ⟨234230⟩
                                si si + 1 == v210 :
                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[9])     ⟨234243⟩
                                si si + 1 == v210 :
                                    tête_texte_de_lèvres(tête=c13, texte="sktglkchzfmikpnd")          ⟨234253⟩
                                si (si + ((v4·70) / 100)) - 6 == v210 :
                                    tête_image_de_base(tête=c13, image=27)                            ⟨234263⟩
                                si (si + ((v4·70) / 100)) - 1 == v210 :
                                    sub_30AD0(objet1, 0)                                              ⟨234274⟩
                                Scene_Tick(scène=scène6)                                              ⟨234292⟩
                        Scene_Destruct(scène=scène6, drapeaux=0)                                      ⟨234318⟩
                        si byte_4F55C == 0 :
                            charge(mid12 0)                                                           ⟨234335⟩
                            charge(mid12 17)                                                          ⟨234347⟩
                            palette_depuis(pal8(mid12 17))                                            ⟨234354⟩

                            ──── scène7 ────
                            scène7 = Scene_Create(cadence=9, palette=255, surface=&v352)              ⟨234362⟩
                            c14 = Layer(ressource=mid12 0)                                            ⟨234367⟩
                            c15 = Layer(ressource=mid12 4, x=0, y=0)                                  ⟨234375⟩
                            CRT_Rand()                                                                ⟨234379⟩
                            c16 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨234390⟩
                            ajoute c15 à scène7                                                       ⟨234396⟩
                            ajoute c16 à scène7                                                       ⟨234401⟩
                            tête_image_de_base(tête=c16, image=23)                                    ⟨234405⟩
                            palette_copie(destination=pal1, source=pal3(mid12 21))                    ⟨234414⟩
                            palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))    ⟨234423⟩
                            palette_envoie(palette=pal1, pas=0)                                       ⟨234435⟩
                            si v10 != 0 :
                                Scene_Tick(scène=scène7)                                              ⟨234444⟩
                                charge(mid12voc 9)                                                    ⟨234456⟩
                                tête_voix(tête=c16, ressource=mid12voc 9, cadence=9)                  ⟨234462⟩
                                v248 = 0                                                              ⟨234464⟩
                                tant que v248 < 3 :
                                    Scene_Tick(scène=scène7)                                          ⟨234470⟩
                                    v248 = v248 + 1                                                   ⟨234472⟩
                                tant que tête_parle(tête=c16) != 0 :
                                    Scene_Tick(scène=scène7)                                          ⟨234489⟩
                                tête_image_de_base(tête=c16, image=19)                                ⟨234502⟩
                                v248 = 0                                                              ⟨234504⟩
                                tant que v248 < 6 :
                                    Scene_Tick(scène=scène7)                                          ⟨234510⟩
                                    v248 = v248 + 1                                                   ⟨234512⟩
                                ajoute c14 à scène7                                                   ⟨234520⟩
                                palette_copie(destination=pal1, source=pal8(mid12 17))                ⟨234529⟩
                                palette_envoie(palette=pal1, pas=0)                                   ⟨234541⟩
                                scène7.compteur = 0                                                   ⟨234543⟩
                                tant que (scène7.compteur < 12) et (scène7.terminée == 0) :
                                    Scene_Tick(scène=scène7)                                          ⟨234556⟩
                            sinon :
                                v2864→0.méthode8(224)                                                 ⟨234603⟩
                                v4 = 23                                                               ⟨234605⟩
                                si = scène7.compteur                                                  ⟨234606⟩
                                tant que (scène7.compteur < si + ((v4·70) / 100)) et (scène7.terminée == 0) :
                                    v238 = scène7.compteur                                            ⟨234620⟩
                                    si si + 3 == v238 :
                                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[10])  ⟨234633⟩
                                    si si + 3 == v238 :
                                        tête_texte_de_lèvres(tête=c16, texte="wdyrlgaga")             ⟨234643⟩
                                    si si + 7 == v238 :
                                        tête_image_de_base(tête=c16, image=19)                        ⟨234653⟩
                                    Scene_Tick(scène=scène7)                                          ⟨234666⟩
                                ajoute c14 à scène7                                                   ⟨234692⟩
                                palette_copie(destination=pal1, source=pal8(mid12 17))                ⟨234701⟩
                                palette_envoie(palette=pal1, pas=0)                                   ⟨234713⟩
                                Widget_Method_DispatchC_37052(objet1, 0)                              ⟨234718⟩
                                Widget_Method_Dispatch8_37030(objet1, 80)                             ⟨234723⟩
                                v4_avant = si + ((v4·70) / 100)                                       ⟨234725⟩
                                v4 = 20                                                               ⟨234725⟩
                                si = scène7.compteur                                                  ⟨234726⟩
                                tant que (scène7.compteur < si + ((v4·70) / 100)) et (scène7.terminée == 0) :
                                    v238 = scène7.compteur                                            ⟨234740⟩
                                    si v238 == si :
                                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[10])  ⟨234751⟩
                                    si (si + ((v4·70) / 100)) - 1 == v238 :
                                        sub_30AD0(objet1, 0)                                          ⟨234762⟩
                                    Scene_Tick(scène=scène7)                                          ⟨234780⟩
                            Scene_Destruct(scène=scène7, drapeaux=0)                                  ⟨234806⟩
                            v224 = 0                                                                  ⟨234827⟩
                            v208 = 0                                                                  ⟨234847⟩
                            si byte_4F55C == 0 :

                                ──── scène8 ────
                                scène8 = Scene_Create(cadence=9, palette=255, surface=&v352)          ⟨234859⟩
                                c17 = Layer(ressource=mid12 3, x=0, y=0)                              ⟨234866⟩
                                CRT_Rand()                                                            ⟨234870⟩
                                c18 = TalkingHead(ressource=convdata type 0 "walt", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨234881⟩
                                tête_image_de_base(tête=c18, image=27)                                ⟨234886⟩
                                ajoute c17 à scène8                                                   ⟨234891⟩
                                ajoute c18 à scène8                                                   ⟨234896⟩
                                palette_copie(destination=pal1, source=pal4(mid12 20))                ⟨234905⟩
                                palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨234914⟩
                                palette_envoie(palette=pal1, pas=0)                                   ⟨234926⟩
                                si v10 != 0 :
                                    scène8.compteur = 0                                               ⟨234933⟩
                                    tant que (scène8.compteur < 12) et (scène8.terminée == 0) :
                                        v210 = scène8.compteur                                        ⟨234938⟩
                                        si v210 == 2 :
                                            tête_image_de_base(tête=c18, image=21)                    ⟨234943⟩
                                        si v210 == 11 :
                                            tête_image_de_base(tête=c18, image=-1)                    ⟨234951⟩
                                        Scene_Tick(scène=scène8)                                      ⟨234957⟩
                                    charge(mid12voc 1)                                                ⟨234987⟩
                                    tête_voix(tête=c18, ressource=mid12voc 1, cadence=9)              ⟨234993⟩
                                    v220 = 0                                                          ⟨234995⟩
                                    tant que v220 < 3 :
                                        Scene_Tick(scène=scène8)                                      ⟨235001⟩
                                        v220 = v220 + 1                                               ⟨235003⟩
                                    tant que tête_parle(tête=c18) != 0 :
                                        Scene_Tick(scène=scène8)                                      ⟨235025⟩
                                    v220 = 0                                                          ⟨235036⟩
                                    tant que v220 < 6 :
                                        Scene_Tick(scène=scène8)                                      ⟨235042⟩
                                        v220 = v220 + 1                                               ⟨235044⟩
                                    v212 = 0                                                          ⟨235066⟩
                                sinon :
                                    v2864→0.méthode8(183)                                             ⟨235074⟩
                                    tant que (scène8.compteur < 12) et (scène8.terminée == 0) :
                                        v210 = scène8.compteur                                        ⟨235080⟩
                                        si v210 == 2 :
                                            tête_image_de_base(tête=c18, image=21)                    ⟨235085⟩
                                        si v210 == 11 :
                                            tête_image_de_base(tête=c18, image=-1)                    ⟨235093⟩
                                        Scene_Tick(scène=scène8)                                      ⟨235099⟩
                                    v4 = 44                                                           ⟨235119⟩
                                    si = scène8.compteur                                              ⟨235120⟩
                                    tant que (scène8.compteur < si + ((v4·70) / 100)) et (scène8.terminée == 0) :
                                        v210 = scène8.compteur                                        ⟨235134⟩
                                        si si + 1 == v210 :
                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[11])  ⟨235147⟩
                                        si si + 1 == v210 :
                                            tête_texte_de_lèvres(tête=c18, texte="okyokyilkmklna")    ⟨235157⟩
                                        si (si + ((v4·70) / 100)) - 1 == v210 :
                                            sub_30AD0(objet1, 0)                                      ⟨235168⟩
                                        Scene_Tick(scène=scène8)                                      ⟨235186⟩
                                    v4_avant = si + ((v4·70) / 100)                                   ⟨235209⟩
                                    v4 = 25                                                           ⟨235209⟩
                                    si = scène8.compteur                                              ⟨235210⟩
                                    tant que (scène8.compteur < si + ((v4·70) / 100)) et (scène8.terminée == 0) :
                                        v210 = scène8.compteur                                        ⟨235224⟩
                                        si si + 1 == v210 :
                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[12])  ⟨235237⟩
                                        si si + 1 == v210 :
                                            tête_texte_de_lèvres(tête=c18, texte="ulfdotaeewe")       ⟨235247⟩
                                        si (si + ((v4·70) / 100)) - 1 == v210 :
                                            sub_30AD0(objet1, 0)                                      ⟨235258⟩
                                        Scene_Tick(scène=scène8)                                      ⟨235276⟩
                                    v4_avant = si + ((v4·70) / 100)                                   ⟨235299⟩
                                    v4 = 20                                                           ⟨235299⟩
                                    si = scène8.compteur                                              ⟨235300⟩
                                    tant que (scène8.compteur < si + ((v4·70) / 100)) et (scène8.terminée == 0) :
                                        v210 = scène8.compteur                                        ⟨235314⟩
                                        si si + 1 == v210 :
                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[13])  ⟨235327⟩
                                        si si + 1 == v210 :
                                            tête_texte_de_lèvres(tête=c18, texte="evchly")            ⟨235337⟩
                                        si (si + ((v4·70) / 100)) - 1 == v210 :
                                            sub_30AD0(objet1, 0)                                      ⟨235348⟩
                                        Scene_Tick(scène=scène8)                                      ⟨235366⟩
                                    tant que (scène8.compteur < 8) et (scène8.terminée == 0) :
                                        Scene_Tick(scène=scène8)                                      ⟨235394⟩
                                Scene_Destruct(scène=scène8, drapeaux=0)                              ⟨235419⟩
                                si byte_4F55C == 0 :

                                    ──── scène9 ────
                                    scène9 = Scene_Create(cadence=9, palette=255, surface=&v352)      ⟨235432⟩
                                    c19 = Layer(ressource=mid12 5, x=0, y=0)                          ⟨235439⟩
                                    c20 = ScaledImageLayer(ressource=mid12 6, x=44, y=17, angle=0, échelle=200, octet=0, image=0)  ⟨235451⟩
                                    c21 = ScaledImageLayer(ressource=mid12 9, x=50, y=35, angle=0, échelle=160, octet=0, image=0)  ⟨235463⟩
                                    c22 = ScaledImageLayer(ressource=mid12 8, x=50, y=35, angle=0, échelle=160, octet=0, image=2)  ⟨235475⟩
                                    ajoute c19 à scène9                                               ⟨235481⟩
                                    ajoute c20 à scène9                                               ⟨235486⟩
                                    ajoute c22 à scène9                                               ⟨235491⟩
                                    ajoute c21 à scène9                                               ⟨235496⟩
                                    palette_copie(destination=pal1, source=pal5(mid12 22))            ⟨235505⟩
                                    palette_envoie(palette=pal1, pas=0)                               ⟨235517⟩
                                    si v10 != 0 :
                                        Scene_Tick(scène=scène9)                                      ⟨235526⟩
                                        charge(mid12voc 2)                                            ⟨235538⟩
                                        voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid12voc 2)  ⟨235544⟩
                                        v224 = 0                                                      ⟨235546⟩
                                        tant que v224 < 4 :
                                            Scene_Tick(scène=scène9)                                  ⟨235552⟩
                                            v224 = v224 + 1                                           ⟨235554⟩
                                        voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)               ⟨235562⟩
                                        v224 = 0                                                      ⟨235564⟩
                                        tant que voix_en_cours(voix=voix1) != 0 :
                                            si v224 == 8 :
                                                c22.image = 2                                         ⟨235571⟩
                                            v224_avant = v224                                         ⟨235575⟩
                                            v224 = v224 + 1                                           ⟨235575⟩
                                            si v224_avant == 12 :
                                                c22.image = 3                                         ⟨235579⟩
                                            Scene_Tick(scène=scène9)                                  ⟨235591⟩
                                        v224 = 0                                                      ⟨235603⟩
                                        tant que v224 < 4 :
                                            Scene_Tick(scène=scène9)                                  ⟨235609⟩
                                            v224 = v224 + 1                                           ⟨235611⟩
                                        charge(mid12voc 10)                                           ⟨235626⟩
                                        voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid12voc 10)  ⟨235632⟩
                                        voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)               ⟨235637⟩
                                        tant que voix_en_cours(voix=voix1) != 0 :
                                            Scene_Tick(scène=scène9)                                  ⟨235651⟩
                                        v224 = 0                                                      ⟨235663⟩
                                        tant que v224 < 2 :
                                            Scene_Tick(scène=scène9)                                  ⟨235669⟩
                                            v224 = v224 + 1                                           ⟨235671⟩
                                        voix_arrête(voix=voix1)                                       ⟨235678⟩
                                        v228 = 0                                                      ⟨235697⟩
                                        v222 = 0                                                      ⟨235713⟩
                                    sinon :
                                        Widget_Method_DispatchC_37052(objet1, 0)                      ⟨235722⟩
                                        Widget_Method_Dispatch8_37030(objet1, 39)                     ⟨235727⟩
                                        v4 = 44                                                       ⟨235729⟩
                                        si = scène9.compteur                                          ⟨235730⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 3 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[14])  ⟨235757⟩
                                            si si + 8 == scène9.compteur :
                                                c22.image = 2                                         ⟨235766⟩
                                            si si + 12 == scène9.compteur :
                                                c22.image = 3                                         ⟨235774⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                sub_30AD0(objet1, 0)                                  ⟨235784⟩
                                            Scene_Tick(scène=scène9)                                  ⟨235802⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨235825⟩
                                        v4 = 30                                                       ⟨235825⟩
                                        si = scène9.compteur                                          ⟨235826⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 1 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[15])  ⟨235853⟩
                                            si si + 8 == scène9.compteur :
                                                c22.image = 2                                         ⟨235862⟩
                                            si si + 12 == scène9.compteur :
                                                c22.image = 3                                         ⟨235870⟩
                                            si (si + ((v4·70) / 100)) - 5 == scène9.compteur :
                                                sub_30AD0(objet1, 0)                                  ⟨235880⟩
                                            Scene_Tick(scène=scène9)                                  ⟨235898⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨235921⟩
                                        v4 = 57                                                       ⟨235921⟩
                                        si = scène9.compteur                                          ⟨235922⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 1 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[16])  ⟨235948⟩
                                            si si + 8 == scène9.compteur :
                                                c22.image = 4                                         ⟨235957⟩
                                            si si + 12 == scène9.compteur :
                                                c22.image = 3                                         ⟨235965⟩
                                            si si + 28 == scène9.compteur :
                                                c22.image = 2                                         ⟨235973⟩
                                            si si + 34 == scène9.compteur :
                                                c22.image = 4                                         ⟨235981⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                sub_30AD0(objet1, 0)                                  ⟨235991⟩
                                            Scene_Tick(scène=scène9)                                  ⟨236009⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨236032⟩
                                        v4 = 40                                                       ⟨236032⟩
                                        si = scène9.compteur                                          ⟨236033⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 1 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[17])  ⟨236060⟩
                                            si si + 8 == scène9.compteur :
                                                c22.image = 2                                         ⟨236069⟩
                                            si si + 12 == scène9.compteur :
                                                c22.image = 3                                         ⟨236077⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                sub_30AD0(objet1, 0)                                  ⟨236087⟩
                                            Scene_Tick(scène=scène9)                                  ⟨236105⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨236128⟩
                                        v4 = 25                                                       ⟨236128⟩
                                        si = scène9.compteur                                          ⟨236129⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 1 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[18])  ⟨236156⟩
                                            si si + 8 == scène9.compteur :
                                                c22.image = 4                                         ⟨236165⟩
                                            si si + 12 == scène9.compteur :
                                                c22.image = 2                                         ⟨236173⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                sub_30AD0(objet1, 0)                                  ⟨236183⟩
                                            Scene_Tick(scène=scène9)                                  ⟨236201⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨236224⟩
                                        v4 = 18                                                       ⟨236224⟩
                                        si = scène9.compteur                                          ⟨236225⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            Scene_Tick(scène=scène9)                                  ⟨236240⟩
                                        Widget_Method_Dispatch8_37030(objet1, 14)                     ⟨236263⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨236265⟩
                                        v4 = 65                                                       ⟨236265⟩
                                        si = scène9.compteur                                          ⟨236266⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 2 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[19])  ⟨236293⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                sub_30AD0(objet1, 0)                                  ⟨236304⟩
                                            Scene_Tick(scène=scène9)                                  ⟨236322⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨236345⟩
                                        v4 = 45                                                       ⟨236345⟩
                                        si = scène9.compteur                                          ⟨236346⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 2 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[20])  ⟨236373⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                sub_30AD0(objet1, 0)                                  ⟨236384⟩
                                            Scene_Tick(scène=scène9)                                  ⟨236402⟩
                                    Scene_Destruct(scène=scène9, drapeaux=0)                          ⟨236428⟩
                                    si byte_4F55C == 0 :

                                        ──── scène10 ────
                                        scène10 = Scene_Create(cadence=9, palette=255, surface=&v352)  ⟨236441⟩
                                        c23 = Layer(ressource=mid12 4, x=0, y=0)                      ⟨236448⟩
                                        CRT_Rand()                                                    ⟨236452⟩
                                        c24 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨236463⟩
                                        ajoute c23 à scène10                                          ⟨236469⟩
                                        ajoute c24 à scène10                                          ⟨236474⟩
                                        palette_copie(destination=pal1, source=pal3(mid12 21))        ⟨236483⟩
                                        palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨236492⟩
                                        palette_envoie(palette=pal1, pas=0)                           ⟨236504⟩
                                        si v10 != 0 :
                                            Scene_Tick(scène=scène10)                                 ⟨236513⟩
                                            charge(mid12voc 11)                                       ⟨236525⟩
                                            tête_voix(tête=c24, ressource=mid12voc 11, cadence=9)     ⟨236531⟩
                                            v220 = 0                                                  ⟨236533⟩
                                            tant que v220 < 2 :
                                                Scene_Tick(scène=scène10)                             ⟨236539⟩
                                                v220 = v220 + 1                                       ⟨236541⟩
                                            tant que tête_parle(tête=c24) != 0 :
                                                Scene_Tick(scène=scène10)                             ⟨236558⟩
                                            v220 = 0                                                  ⟨236569⟩
                                            tant que v220 < 3 :
                                                Scene_Tick(scène=scène10)                             ⟨236575⟩
                                                v220 = v220 + 1                                       ⟨236577⟩
                                            v212 = 0                                                  ⟨236599⟩
                                        sinon :
                                            v2864→0.méthode8(224)                                     ⟨236607⟩
                                            v4 = 85                                                   ⟨236609⟩
                                            si = scène10.compteur                                     ⟨236610⟩
                                            tant que (scène10.compteur < si + ((v4·70) / 100)) et (scène10.terminée == 0) :
                                                v210 = scène10.compteur                               ⟨236624⟩
                                                si si + 3 == v210 :
                                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[21])  ⟨236637⟩
                                                si si + 3 == v210 :
                                                    tête_texte_de_lèvres(tête=c24, texte="fwdgzrondiznbl tawydtstlwtdbrzwlbrnd")  ⟨236647⟩
                                                si (si + ((v4·70) / 100)) - 1 == v210 :
                                                    sub_30AD0(objet1, 0)                              ⟨236658⟩
                                                Scene_Tick(scène=scène10)                             ⟨236676⟩
                                        Scene_Destruct(scène=scène10, drapeaux=0)                     ⟨236702⟩
                                        si byte_4F55C == 0 :

                                            ──── scène11 ────
                                            scène11 = Scene_Create(cadence=9, palette=255, surface=&v352)  ⟨236715⟩
                                            c25 = Layer(ressource=mid12 3, x=0, y=0)                  ⟨236722⟩
                                            CRT_Rand()                                                ⟨236726⟩
                                            c26 = TalkingHead(ressource=convdata type 0 "walt", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨236737⟩
                                            ajoute c25 à scène11                                      ⟨236743⟩
                                            ajoute c26 à scène11                                      ⟨236748⟩
                                            palette_copie(destination=pal1, source=pal4(mid12 20))    ⟨236757⟩
                                            palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨236766⟩
                                            palette_envoie(palette=pal1, pas=0)                       ⟨236778⟩
                                            si v10 != 0 :
                                                scène11.compteur = 0                                  ⟨236785⟩
                                                tant que (scène11.compteur < 4) et (scène11.terminée == 0) :
                                                    Scene_Tick(scène=scène11)                         ⟨236791⟩
                                                v212 = 0                                              ⟨236814⟩
                                                charge(mid12voc 3)                                    ⟨236821⟩
                                                tête_voix(tête=c26, ressource=mid12voc 3, cadence=9)  ⟨236827⟩
                                                v220 = 0                                              ⟨236829⟩
                                                tant que v220 < 3 :
                                                    Scene_Tick(scène=scène11)                         ⟨236835⟩
                                                    v220 = v220 + 1                                   ⟨236837⟩
                                                tant que tête_parle(tête=c26) != 0 :
                                                    Scene_Tick(scène=scène11)                         ⟨236859⟩
                                                tête_image_de_base(tête=c26, image=27)                ⟨236872⟩
                                                v220 = 0                                              ⟨236874⟩
                                                tant que v220 < 6 :
                                                    Scene_Tick(scène=scène11)                         ⟨236880⟩
                                                    v220 = v220 + 1                                   ⟨236882⟩
                                                v212 = 0                                              ⟨236904⟩
                                            sinon :
                                                v2864→0.méthode8(183)                                 ⟨236912⟩
                                                v4 = 84                                               ⟨236914⟩
                                                si = scène11.compteur                                 ⟨236915⟩
                                                tant que (scène11.compteur < si + ((v4·70) / 100)) et (scène11.terminée == 0) :
                                                    v210 = scène11.compteur                           ⟨236929⟩
                                                    si si + 3 == v210 :
                                                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[22])  ⟨236942⟩
                                                    si si + 3 == v210 :
                                                        tête_texte_de_lèvres(tête=c26, texte="hyltsntltbznsgtnthawyofrnshp")  ⟨236952⟩
                                                    si si + 6 == v210 :
                                                        tête_image_de_base(tête=c26, image=-1)        ⟨236962⟩
                                                    si (si + ((v4·70) / 100)) - 8 == v210 :
                                                        tête_image_de_base(tête=c26, image=27)        ⟨236972⟩
                                                    si (si + ((v4·70) / 100)) - 2 == v210 :
                                                        sub_30AD0(objet1, 0)                          ⟨236983⟩
                                                    Scene_Tick(scène=scène11)                         ⟨237001⟩
                                            Scene_Destruct(scène=scène11, drapeaux=0)                 ⟨237027⟩
                                            si byte_4F55C == 0 :

                                                ──── scène12 ────
                                                scène12 = Scene_Create(cadence=9, palette=255, surface=&v352)  ⟨237040⟩
                                                c27 = Layer(ressource=mid12 4, x=0, y=0)              ⟨237047⟩
                                                CRT_Rand()                                            ⟨237051⟩
                                                c28 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨237062⟩
                                                ajoute c27 à scène12                                  ⟨237068⟩
                                                ajoute c28 à scène12                                  ⟨237073⟩
                                                palette_copie(destination=pal1, source=pal3(mid12 21))  ⟨237082⟩
                                                palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨237091⟩
                                                palette_envoie(palette=pal1, pas=0)                   ⟨237103⟩
                                                si v10 != 0 :
                                                    Scene_Tick(scène=scène12)                         ⟨237112⟩
                                                    v212 = 0                                          ⟨237117⟩
                                                    charge(mid12voc 12)                               ⟨237124⟩
                                                    tête_voix(tête=c28, ressource=mid12voc 12, cadence=9)  ⟨237130⟩
                                                    v220 = 0                                          ⟨237132⟩
                                                    tant que v220 < 2 :
                                                        Scene_Tick(scène=scène12)                     ⟨237138⟩
                                                        v220 = v220 + 1                               ⟨237140⟩
                                                    tant que tête_parle(tête=c28) != 0 :
                                                        Scene_Tick(scène=scène12)                     ⟨237157⟩
                                                    v220 = 0                                          ⟨237168⟩
                                                    tant que v220 < 3 :
                                                        Scene_Tick(scène=scène12)                     ⟨237174⟩
                                                        v220 = v220 + 1                               ⟨237176⟩
                                                    v212 = 0                                          ⟨237198⟩
                                                sinon :
                                                    v2864→0.méthode8(224)                             ⟨237206⟩
                                                    v4 = 66                                           ⟨237208⟩
                                                    si = scène12.compteur                             ⟨237209⟩
                                                    tant que (scène12.compteur < si + ((v4·70) / 100)) et (scène12.terminée == 0) :
                                                        v210 = scène12.compteur                       ⟨237223⟩
                                                        si si + 3 == v210 :
                                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[24])  ⟨237236⟩
                                                        si si + 3 == v210 :
                                                            tête_texte_de_lèvres(tête=c28, texte="ltsntltyrhdgtnthawyovabuletpame")  ⟨237246⟩
                                                        si (si + ((v4·70) / 100)) - 2 == v210 :
                                                            sub_30AD0(objet1, 0)                      ⟨237257⟩
                                                        Scene_Tick(scène=scène12)                     ⟨237275⟩
                                                Scene_Destruct(scène=scène12, drapeaux=0)             ⟨237301⟩
                                                si byte_4F55C == 0 :

                                                    ──── scène13 ────
                                                    scène13 = Scene_Create(cadence=9, palette=255, surface=&v352)  ⟨237314⟩
                                                    c29 = Layer(ressource=mid12 3, x=0, y=0)          ⟨237321⟩
                                                    CRT_Rand()                                        ⟨237325⟩
                                                    c30 = TalkingHead(ressource=convdata type 0 "walt", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨237336⟩
                                                    ajoute c29 à scène13                              ⟨237342⟩
                                                    ajoute c30 à scène13                              ⟨237347⟩
                                                    palette_copie(destination=pal1, source=pal4(mid12 20))  ⟨237356⟩
                                                    palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨237365⟩
                                                    palette_envoie(palette=pal1, pas=0)               ⟨237377⟩
                                                    si v10 != 0 :
                                                        Scene_Tick(scène=scène13)                     ⟨237386⟩
                                                        v212 = 0                                      ⟨237391⟩
                                                        charge(mid12voc 4)                            ⟨237398⟩
                                                        tête_voix(tête=c30, ressource=mid12voc 4, cadence=9)  ⟨237404⟩
                                                        v220 = 0                                      ⟨237406⟩
                                                        tant que v220 < 3 :
                                                            Scene_Tick(scène=scène13)                 ⟨237412⟩
                                                            v220 = v220 + 1                           ⟨237414⟩
                                                        tant que tête_parle(tête=c30) != 0 :
                                                            Scene_Tick(scène=scène13)                 ⟨237436⟩
                                                        tête_image_de_base(tête=c30, image=28)        ⟨237449⟩
                                                        v220 = 0                                      ⟨237451⟩
                                                        tant que v220 < 6 :
                                                            Scene_Tick(scène=scène13)                 ⟨237457⟩
                                                            v220 = v220 + 1                           ⟨237459⟩
                                                        v212 = 0                                      ⟨237481⟩
                                                    sinon :
                                                        v2864→0.méthode8(183)                         ⟨237489⟩
                                                        v4 = 53                                       ⟨237491⟩
                                                        si = scène13.compteur                         ⟨237492⟩
                                                        tant que (scène13.compteur < si + ((v4·70) / 100)) et (scène13.terminée == 0) :
                                                            v210 = scène13.compteur                   ⟨237506⟩
                                                            si si + 3 == v210 :
                                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[25])  ⟨237519⟩
                                                            si si + 3 == v210 :
                                                                tête_texte_de_lèvres(tête=c30, texte="okokmwyotofmylghr")  ⟨237529⟩
                                                            si (si + ((v4·70) / 100)) - 1 == v210 :
                                                                sub_30AD0(objet1, 0)                  ⟨237540⟩
                                                            Scene_Tick(scène=scène13)                 ⟨237558⟩
                                                        v4_avant = si + ((v4·70) / 100)               ⟨237581⟩
                                                        v4 = 42                                       ⟨237581⟩
                                                        si = scène13.compteur                         ⟨237582⟩
                                                        tant que (scène13.compteur < si + ((v4·70) / 100)) et (scène13.terminée == 0) :
                                                            v210 = scène13.compteur                   ⟨237596⟩
                                                            si si + 1 == v210 :
                                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[26])  ⟨237609⟩
                                                            si si + 1 == v210 :
                                                                tête_texte_de_lèvres(tête=c30, texte="oabutkacke")  ⟨237619⟩
                                                            si (si + ((v4·70) / 100)) - 8 == v210 :
                                                                tête_image_de_base(tête=c30, image=28)  ⟨237629⟩
                                                            si (si + ((v4·70) / 100)) - 8 == v210 :
                                                                sub_30AD0(objet1, 0)                  ⟨237640⟩
                                                            Scene_Tick(scène=scène13)                 ⟨237658⟩
                                                    Scene_Destruct(scène=scène13, drapeaux=0)         ⟨237684⟩
                                                    si byte_4F55C == 0 :

                                                        ──── scène14 ────
                                                        scène14 = Scene_Create(cadence=9, palette=255, surface=&v352)  ⟨237697⟩
                                                        c31 = Layer(ressource=mid12 4, x=0, y=0)      ⟨237704⟩
                                                        CRT_Rand()                                    ⟨237708⟩
                                                        c32 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨237719⟩
                                                        ajoute c31 à scène14                          ⟨237725⟩
                                                        ajoute c32 à scène14                          ⟨237730⟩
                                                        palette_copie(destination=pal1, source=pal3(mid12 21))  ⟨237739⟩
                                                        palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨237748⟩
                                                        palette_envoie(palette=pal1, pas=0)           ⟨237760⟩
                                                        si v10 != 0 :
                                                            Scene_Tick(scène=scène14)                 ⟨237769⟩
                                                            v212 = 0                                  ⟨237774⟩
                                                            charge(mid12voc 13)                       ⟨237781⟩
                                                            tête_voix(tête=c32, ressource=mid12voc 13, cadence=9)  ⟨237787⟩
                                                            v220 = 0                                  ⟨237789⟩
                                                            tant que v220 < 2 :
                                                                Scene_Tick(scène=scène14)             ⟨237795⟩
                                                                v220 = v220 + 1                       ⟨237797⟩
                                                            tant que tête_parle(tête=c32) != 0 :
                                                                Scene_Tick(scène=scène14)             ⟨237814⟩
                                                            tête_image_de_base(tête=c32, image=33)    ⟨237827⟩
                                                            v220 = 0                                  ⟨237829⟩
                                                            tant que v220 < 3 :
                                                                Scene_Tick(scène=scène14)             ⟨237835⟩
                                                                v220 = v220 + 1                       ⟨237837⟩
                                                            v212 = 0                                  ⟨237859⟩
                                                        sinon :
                                                            v2864→0.méthode8(224)                     ⟨237867⟩
                                                            v4 = 19                                   ⟨237869⟩
                                                            si = scène14.compteur                     ⟨237870⟩
                                                            tant que (scène14.compteur < si + ((v4·70) / 100)) et (scène14.terminée == 0) :
                                                                v210 = scène14.compteur               ⟨237884⟩
                                                                si si + 3 == v210 :
                                                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[27])  ⟨237897⟩
                                                                si si + 3 == v210 :
                                                                    tête_texte_de_lèvres(tête=c32, texte="achk")  ⟨237907⟩
                                                                si (si + ((v4·70) / 100)) - 1 == v210 :
                                                                    sub_30AD0(objet1, 0)              ⟨237918⟩
                                                                Scene_Tick(scène=scène14)             ⟨237936⟩
                                                            tête_image_de_base(tête=c32, image=33)    ⟨237961⟩
                                                            v4_avant = si + ((v4·70) / 100)           ⟨237963⟩
                                                            v4 = 21                                   ⟨237963⟩
                                                            si = scène14.compteur                     ⟨237964⟩
                                                            tant que (scène14.compteur < si + ((v4·70) / 100)) et (scène14.terminée == 0) :
                                                                v210 = scène14.compteur               ⟨237978⟩
                                                                si si + 1 == v210 :
                                                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[28])  ⟨237991⟩
                                                                si si + 1 == v210 :
                                                                    tête_texte_de_lèvres(tête=c32, texte="sur")  ⟨238001⟩
                                                                si (si + ((v4·70) / 100)) - 2 == v210 :
                                                                    sub_30AD0(objet1, 0)              ⟨238012⟩
                                                                Scene_Tick(scène=scène14)             ⟨238030⟩
                                                        Scene_Destruct(scène=scène14, drapeaux=0)     ⟨238056⟩
                                                        si byte_4F55C == 0 :

                                                            ──── scène15 ────
                                                            scène15 = Scene_Create(cadence=10, palette=255, surface=&v352)  ⟨238069⟩
                                                            charge(mid12 12)                          ⟨238081⟩
                                                            v224 = 0                                  ⟨238083⟩
                                                            charge(mid12 10)                          ⟨238093⟩
                                                            v228 = 0                                  ⟨238098⟩
                                                            charge(mid12 11)                          ⟨238105⟩
                                                            charge(mid12 23)                          ⟨238117⟩
                                                            palette_depuis(pal9(mid12 23))            ⟨238124⟩
                                                            c33 = Layer(ressource=mid12 10, x=0, y=0)  ⟨238131⟩
                                                            c34 = Layer(ressource=mid12 12, x=-30, y=0)  ⟨238139⟩
                                                            c35 = Layer(ressource=mid12 11, x=0, y=0)  ⟨238147⟩
                                                            ajoute c33 à scène15                      ⟨238153⟩
                                                            ajoute c34 à scène15                      ⟨238158⟩
                                                            ajoute c35 à scène15                      ⟨238163⟩
                                                            palette_copie(destination=pal1, source=pal9(mid12 23))  ⟨238172⟩
                                                            palette_envoie(palette=pal1, pas=0)       ⟨238184⟩
                                                            déplace(calque=c34, dx=0, dy=10)          ⟨238191⟩
                                                            tant que (scène15.compteur < 18) et (scène15.terminée == 0) :
                                                                v258 = scène15.compteur               ⟨238197⟩
                                                                si v258 < 3 :
                                                                    déplace(calque=c34, dx=10, dy=1)  ⟨238205⟩
                                                                si v258 == 4 :
                                                                    Scene_SetFps(scène=scène15, cadence=20)  ⟨238214⟩
                                                                si v258 > 8 :
                                                                    déplace(calque=c34, dx=-12, dy=-1)  ⟨238225⟩
                                                                Scene_Tick(scène=scène15)             ⟨238238⟩
                                                            v238 = 0                                  ⟨238282⟩
                                                            v228 = 0                                  ⟨238300⟩
                                                            v224 = 0                                  ⟨238316⟩
                                                            v208 = 0                                  ⟨238336⟩
                                                            Scene_Destruct(scène=scène15, drapeaux=0)  ⟨238340⟩
                                                            si byte_4F55C == 0 :
                                                                v208 = 0                              ⟨238350⟩
                                                                charge(mid12 13)                      ⟨238357⟩

                                                                ──── scène16 ────
                                                                scène16 = Scene_Create(cadence=10, palette=255, surface=&v352)  ⟨238365⟩
                                                                c36 = Layer(ressource=mid12 13, x=-2, y=0)  ⟨238372⟩
                                                                c37 = Layer(ressource=mid12 4, x=0, y=0)  ⟨238380⟩
                                                                c38 = TalkingHead(ressource=convdata type 0 "air", x=160, y=128)  ⟨238388⟩
                                                                ajoute c37 à scène16                  ⟨238394⟩
                                                                ajoute c38 à scène16                  ⟨238399⟩
                                                                ajoute c36 à scène16                  ⟨238404⟩
                                                                palette_copie(destination=pal1, source=pal3(mid12 21))  ⟨238413⟩
                                                                palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨238422⟩
                                                                palette_envoie(palette=pal1, pas=0)   ⟨238434⟩
                                                                v2926 = word_4D392                    ⟨238442⟩
                                                                word_4D392 = &v2928                   ⟨238444⟩
                                                                si v11 != 0 :
                                                                    charge(asoundfx 45)               ⟨238458⟩
                                                                    canal_init(canal=canal3, pilote=word_4CA5D)  ⟨238463⟩
                                                                    canal_enregistre(canal=canal3, ressource=asoundfx 45, x=0)  ⟨238470⟩
                                                                tête_image_de_base(tête=c38, image=14)  ⟨238476⟩
                                                                tant que (scène16.compteur < 9) et (scène16.terminée == 0) :
                                                                    v232 = scène16.compteur           ⟨238482⟩
                                                                    si v232 == 4 :
                                                                        si v11 != 0 :
                                                                            v236 = 0                  ⟨238489⟩
                                                                            si canal3.+0 != 0 :
                                                                                AIL_start_sequence(pilote=canal3.+0→4, séquence=v2930)  ⟨238495⟩
                                                                                sub_50F5(canal3.+0→4, v2930, word_4EFCE, v236)  ⟨238502⟩
                                                                    si v232 == 5 :
                                                                        c36.image = 1                 ⟨238510⟩
                                                                    si v232 == 6 :
                                                                        c36.image = 0                 ⟨238516⟩
                                                                    si v232 == 6 :
                                                                        tête_image_de_base(tête=c38, image=12)  ⟨238523⟩
                                                                    si v232 == 7 :
                                                                        tête_image_de_base(tête=c38, image=-1)  ⟨238531⟩
                                                                    si v232 == 7 :
                                                                        tête_image_de_base(tête=c38, image=14)  ⟨238539⟩
                                                                    Scene_Tick(scène=scène16)         ⟨238552⟩
                                                                canal_arrête(canal=canal3)            ⟨238577⟩
                                                                sub_5C1C(&v2928, 2)                   ⟨238582⟩
                                                                v224 = 0                              ⟨238601⟩
                                                                Scene_Destruct(scène=scène16, drapeaux=0)  ⟨238605⟩
                                                                v208 = 0                              ⟨238624⟩
                                                                si byte_4F55C == 0 :

                                                                    ──── scène17 ────
                                                                    scène17 = Scene_Create(cadence=10, palette=255, surface=&v352)  ⟨238636⟩
                                                                    c39 = Layer(ressource=mid12 5, x=0, y=0)  ⟨238643⟩
                                                                    c40 = ScaledImageLayer(ressource=mid12 6, x=44, y=17, angle=0, échelle=200, octet=0, image=0)  ⟨238655⟩
                                                                    c41 = ScaledImageLayer(ressource=mid12 9, x=50, y=35, angle=0, échelle=160, octet=0, image=0)  ⟨238667⟩
                                                                    c42 = ScaledImageLayer(ressource=mid12 8, x=50, y=35, angle=0, échelle=160, octet=0, image=13)  ⟨238679⟩
                                                                    ajoute c39 à scène17              ⟨238685⟩
                                                                    ajoute c40 à scène17              ⟨238690⟩
                                                                    ajoute c42 à scène17              ⟨238695⟩
                                                                    ajoute c41 à scène17              ⟨238700⟩
                                                                    palette_copie(destination=pal1, source=pal5(mid12 22))  ⟨238709⟩
                                                                    palette_envoie(palette=pal1, pas=0)  ⟨238721⟩
                                                                    v2928 = 436                       ⟨238727⟩
                                                                    v2926 = word_4D392                ⟨238729⟩
                                                                    word_4D392 = &v2928               ⟨238731⟩
                                                                    v2928 = 444                       ⟨238732⟩
                                                                    v2924 = 0                         ⟨238733⟩
                                                                    v2920 = 0                         ⟨238734⟩
                                                                    v2930 = -1                        ⟨238736⟩
                                                                    si v11 != 0 :
                                                                        charge(asoundfx 90)           ⟨238745⟩
                                                                        canal_init(canal=canal3, pilote=word_4CA5D)  ⟨238750⟩
                                                                        canal_enregistre(canal=canal3, ressource=asoundfx 90, x=0)  ⟨238757⟩
                                                                    Widget_Method_DispatchC_37052(objet1, 0)  ⟨238764⟩
                                                                    Widget_Method_Dispatch8_37030(objet1, 39)  ⟨238769⟩
                                                                    v224 = 13                         ⟨238771⟩
                                                                    c42.image = 0                     ⟨238773⟩
                                                                    tant que (scène17.compteur < 57) et (scène17.terminée == 0) :
                                                                        v226 = scène17.compteur       ⟨238778⟩
                                                                        si v226 == 29 :
                                                                            si v11 != 0 :
                                                                                v228 = word_4F028     ⟨238784⟩
                                                                                si canal3.+0 != 0 :
                                                                                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v2930)  ⟨238791⟩
                                                                                    sub_50F5(canal3.+0→4, v2930, v228, asoundfx 45.+0)  ⟨238798⟩
                                                                        si v226 > 0 :
                                                                            si v226 < 44 :
                                                                                v232 = v224           ⟨238808⟩
                                                                                v224_avant = v224     ⟨238809⟩
                                                                                v224 = v224 + 1       ⟨238809⟩
                                                                                c42.image = v232      ⟨238812⟩
                                                                        si v226 == 32 :
                                                                            c40.image = 1             ⟨238818⟩
                                                                        si v226 == 34 :
                                                                            c40.image = 2             ⟨238824⟩
                                                                        Scene_Tick(scène=scène17)     ⟨238836⟩
                                                                    canal_arrête(canal=canal3)        ⟨238861⟩
                                                                    sub_5C1C(&v2928, 2)               ⟨238866⟩
                                                                    v222 = 0                          ⟨238883⟩
                                                                    Scene_Destruct(scène=scène17, drapeaux=0)  ⟨238889⟩
                                                                    si byte_4F55C == 0 :

                                                                        ──── scène18 ────
                                                                        scène18 = Scene_Create(cadence=10, palette=255, surface=&v352)  ⟨238902⟩
                                                                        c43 = Layer(ressource=mid12 4, x=0, y=0)  ⟨238909⟩
                                                                        CRT_Rand()                    ⟨238913⟩
                                                                        c44 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨238924⟩
                                                                        ajoute c43 à scène18          ⟨238930⟩
                                                                        ajoute c44 à scène18          ⟨238935⟩
                                                                        palette_copie(destination=pal1, source=pal3(mid12 21))  ⟨238944⟩
                                                                        palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨238953⟩
                                                                        palette_envoie(palette=pal1, pas=0)  ⟨238965⟩
                                                                        tête_image_de_base(tête=c44, image=31)  ⟨238969⟩
                                                                        tête_image_de_base(tête=c44, image=19)  ⟨238973⟩
                                                                        tant que (scène18.compteur < 20) et (scène18.terminée == 0) :
                                                                            v210 = scène18.compteur   ⟨238979⟩
                                                                            si v210 == 2 :
                                                                                tête_image_de_base(tête=c44, image=12)  ⟨238984⟩
                                                                            si v210 == 3 :
                                                                                tête_image_de_base(tête=c44, image=19)  ⟨238992⟩
                                                                            si v210 == 12 :
                                                                                tête_image_de_base(tête=c44, image=12)  ⟨239000⟩
                                                                            si v210 == 13 :
                                                                                tête_image_de_base(tête=c44, image=19)  ⟨239008⟩
                                                                            Scene_Tick(scène=scène18)  ⟨239021⟩
                                                                        Scene_Destruct(scène=scène18, drapeaux=0)  ⟨239047⟩
                                                                        si byte_4F55C == 0 :

                                                                            ──── scène19 ────
                                                                            scène19 = Scene_Create(cadence=10, palette=255, surface=&v352)  ⟨239060⟩
                                                                            charge(mid12 16)          ⟨239072⟩
                                                                            c45 = Layer(ressource=mid12 16, x=0, y=0)  ⟨239079⟩
                                                                            charge(mid12 25)          ⟨239092⟩
                                                                            palette_depuis(pal10(mid12 25))  ⟨239099⟩
                                                                            ajoute c45 à scène19      ⟨239104⟩
                                                                            palette_copie(destination=pal1, source=pal10(mid12 25))  ⟨239113⟩
                                                                            palette_envoie(palette=pal1, pas=0)  ⟨239125⟩
                                                                            v4 = 30                   ⟨239127⟩
                                                                            si = scène19.compteur     ⟨239128⟩
                                                                            tant que (scène19.compteur < si + ((v4·70) / 100)) et (scène19.terminée == 0) :
                                                                                Scene_Tick(scène=scène19)  ⟨239150⟩
                                                                            fondu_disparition(palette=pal1, couleur=&v28, pas=2, premier=0, nombre=256)  ⟨239179⟩
                                                                            v220 = 0                  ⟨239202⟩
                                                                            v208 = 0                  ⟨239220⟩
                                                                            Scene_Destruct(scène=scène19, drapeaux=0)  ⟨239224⟩
v196 = 0                                                                                              ⟨239252⟩
v191 = 0                                                                                              ⟨239253⟩
v190 = 0                                                                                              ⟨239254⟩
v181 = 0                                                                                              ⟨239271⟩
v180 = 0                                                                                              ⟨239272⟩
v171 = 0                                                                                              ⟨239289⟩
v170 = 0                                                                                              ⟨239290⟩
v155 = 0                                                                                              ⟨239311⟩
v154 = 0                                                                                              ⟨239312⟩
v139 = 0                                                                                              ⟨239333⟩
v138 = 0                                                                                              ⟨239334⟩
v123 = 0                                                                                              ⟨239355⟩
v122 = 0                                                                                              ⟨239356⟩
v107 = 0                                                                                              ⟨239377⟩
v106 = 0                                                                                              ⟨239378⟩
v97 = 0                                                                                               ⟨239395⟩
v96 = 0                                                                                               ⟨239396⟩
v87 = 0                                                                                               ⟨239413⟩
v86 = 0                                                                                               ⟨239414⟩
v77 = 0                                                                                               ⟨239431⟩
v76 = 0                                                                                               ⟨239432⟩
v67 = 0                                                                                               ⟨239449⟩
v66 = 0                                                                                               ⟨239450⟩
v57 = 0                                                                                               ⟨239467⟩
v56 = 0                                                                                               ⟨239468⟩
v47 = 0                                                                                               ⟨239485⟩
v46 = 0                                                                                               ⟨239486⟩
voix_arrête(voix=voix1)                                                                               ⟨239490⟩
v2810 = 0                                                                                             ⟨239507⟩
v2805 = 0                                                                                             ⟨239508⟩
v2804 = 0                                                                                             ⟨239509⟩
canal_arrête(canal=canal2)                                                                            ⟨239512⟩
sub_5C1C(&v736, 2)                                                                                    ⟨239517⟩
v33 = 0                                                                                               ⟨239540⟩
v32 = 0                                                                                               ⟨239541⟩
retour                                                                                                ⟨239576⟩
```

## Tableaux du segment de données

