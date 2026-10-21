# Script extrait de `sub_6B9C0` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## sub_6B9C0

```
bp = sp                                                                                               ⟨219943⟩
tableau_textes(tableau=textes1, nombre=16, longueur=200)                                              ⟨219955⟩
byte_495FC = 0                                                                                        ⟨219957⟩
v13 = 0                                                                                               ⟨219958⟩
v14 = 0                                                                                               ⟨219959⟩
v15 = 0                                                                                               ⟨219960⟩
si word_4684B != 0 :
    v14 = 1                                                                                           ⟨219963⟩
v18 = word_46F46                                                                                      ⟨219967⟩
v508 = 0                                                                                              ⟨219968⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v508, v18)                                                      ⟨219973⟩
v522 = 0                                                                                              ⟨219975⟩
TextRenderer_ApplyFormatChange_2EA21(&v522, 0)                                                        ⟨219984⟩
SmallObject_RegisterInList_2CB40(&v22, &v522)                                                         ⟨219990⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨219996⟩
v32 = 0                                                                                               ⟨220002⟩
v42 = 0                                                                                               ⟨220005⟩
v38 = 2                                                                                               ⟨220006⟩
v37 = 0                                                                                               ⟨220007⟩
v36 = 0                                                                                               ⟨220008⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨220022⟩
v44 = ?                                                                                               ⟨220024⟩
v46 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                 ⟨220025⟩
v42 = v46                                                                                             ⟨220027⟩
v38 = 2                                                                                               ⟨220028⟩
v37 = 1                                                                                               ⟨220029⟩
v36 = 0                                                                                               ⟨220030⟩
GlyphObject_ConstructWithBuffer_311CF(&v546, &v42)                                                    ⟨220035⟩
v56 = word_46F46                                                                                      ⟨220042⟩
zone_texte(zone=zone1, police=&v546)                                                                  ⟨220048⟩
v58 = 152                                                                                             ⟨220052⟩
v60 = 319                                                                                             ⟨220054⟩
v62 = 199                                                                                             ⟨220056⟩
v555 = 0                                                                                              ⟨220058⟩
v553 = v58                                                                                            ⟨220060⟩
v551 = v60                                                                                            ⟨220062⟩
v549 = v62                                                                                            ⟨220064⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨220068⟩
Widget_Method_Dispatch8_314A9(zone1, 200)                                                             ⟨220073⟩
si v14 != 0 :
    si sub_6734(chemin1) != 0 :
        pak mid2voc.ouvre(chemin1, 1)                                                                 ⟨220138⟩
    sinon :
        v14 = 0                                                                                       ⟨220145⟩
sinon :
    v14 = 0                                                                                           ⟨220145⟩
v72 = 0                                                                                               ⟨220148⟩
v67 = 0                                                                                               ⟨220150⟩
v66 = 0                                                                                               ⟨220151⟩
v74 = byte_46848                                                                                      ⟨220153⟩
si v74 != 1 :
    si v74 == 2 : aller à loc_6BE00                                                                   ⟨220163⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨220199⟩
        flux_iff(flux=flux1)                                                                          ⟨220213⟩
        v3287 = 256                                                                                   ⟨220216⟩
        v3291 = 0                                                                                     ⟨220217⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨220225⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨220231⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨220237⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨220241⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨220243⟩
        v368 = 1                                                                                      ⟨220244⟩
        tant que v368 <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨220251⟩
            ds:24192[v368·2] = iff_lit_mot(flux=flux1)                                                ⟨220255⟩
            v368_avant = v368·2                                                                       ⟨220256⟩
            v368 = v368 + 1                                                                           ⟨220256⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨220263⟩
        v15 = 1                                                                                       ⟨220265⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨220269⟩
    si sub_6734(chemin1) != 0 :
        v13 = 1                                                                                       ⟨220295⟩
        si v15 == 0 :
            word_48F76 = 90                                                                           ⟨220300⟩
    aller à loc_6BF75                                                                                 ⟨220304⟩
    loc_6BE00:                                                                                        ⟨220307⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨220335⟩
        flux_iff(flux=flux1)                                                                          ⟨220349⟩
        v3287 = 256                                                                                   ⟨220352⟩
        v3291 = 0                                                                                     ⟨220353⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨220361⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨220367⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨220373⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨220377⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨220379⟩
        v368 = 1                                                                                      ⟨220380⟩
        tant que v368 <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨220387⟩
            ds:24192[v368·2] = iff_lit_mot(flux=flux1)                                                ⟨220391⟩
            v368_avant = v368·2                                                                       ⟨220392⟩
            v368 = v368 + 1                                                                           ⟨220392⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨220399⟩
        v15 = 1                                                                                       ⟨220401⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨220405⟩
    si sub_6734(chemin1) != 0 :
        v13 = 1                                                                                       ⟨220431⟩
        si v15 == 0 :
            word_48F76 = 255                                                                          ⟨220436⟩
loc_6BF75:                                                                                            ⟨220442⟩
v1070 = 0                                                                                             ⟨220444⟩
v1065 = 0                                                                                             ⟨220446⟩
v1064 = 0                                                                                             ⟨220447⟩
v1074 = 0                                                                                             ⟨220448⟩
si v13 != 0 :
    si v14 != 0 :
        v367 = 2                                                                                      ⟨220461⟩
    sinon :
        v367 = 1                                                                                      ⟨220466⟩
    charge(amusic v367)                                                                               ⟨220477⟩
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨220482⟩
    canal_enregistre(canal=canal1, ressource=amusic v367, x=0)                                        ⟨220489⟩
v1083 = booléen                                                                                       ⟨220506⟩
v1079 = booléen                                                                                       ⟨220507⟩
si v14 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨220513⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨220531⟩
    v3287 = 256                                                                                       ⟨220534⟩
    v3291 = 0                                                                                         ⟨220535⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨220543⟩
    iff_form(flux=flux1, balise='MG02', x=0)                                                          ⟨220549⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨220555⟩
    v368 = 0                                                                                          ⟨220557⟩
    tant que v368 < 16 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨220566⟩
        v370 = v3270                                                                                  ⟨220569⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·v368), taille=v370)                  ⟨220580⟩
        v3283 = v3266                                                                                 ⟨220583⟩
        v368 = v368 + 1                                                                               ⟨220584⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨220591⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[0], 7994)                                                                  ⟨220604⟩
        v370 = 0                                                                                      ⟨220606⟩
        aller à loc_6C193                                                                             ⟨220607⟩
        répéter, tant que (40 - CRT_Strlen(arg_6)) - ((20 - CRT_Strlen(arg_6)) / 3) > v370 :
            CRT_Strcat(textes1[0], 7992)                                                              ⟨220613⟩
            v370 = v370 + 1                                                                           ⟨220615⟩
            loc_6C193:                                                                                ⟨220617⟩
            CRT_Strlen(arg_6)                                                                         ⟨220619⟩
            CRT_Strlen(arg_6)                                                                         ⟨220625⟩
        CRT_Strcat(textes1[0], arg_6)                                                                 ⟨220640⟩
        CRT_Strcat(textes1[0], 7996)                                                                  ⟨220644⟩
        v370 = 0                                                                                      ⟨220646⟩
        aller à loc_6C1FC                                                                             ⟨220647⟩
        répéter, tant que 20 - CRT_Strlen(arg_6) > v370 :
            CRT_Strcat(textes1[0], 7992)                                                              ⟨220653⟩
            v370 = v370 + 1                                                                           ⟨220655⟩
            loc_6C1FC:                                                                                ⟨220657⟩
            CRT_Strlen(arg_6)                                                                         ⟨220659⟩
    sinon :
        si CRT_Strlen(arg_8) != 0 :
            CRT_Strcat(textes1[0], 7994)                                                              ⟨220680⟩
            v370 = 0                                                                                  ⟨220682⟩
            aller à loc_6C24F                                                                         ⟨220683⟩
            répéter, tant que (40 - CRT_Strlen(arg_8)) - ((20 - CRT_Strlen(arg_8)) / 3) > v370 :
                CRT_Strcat(textes1[0], 7992)                                                          ⟨220689⟩
                v370 = v370 + 1                                                                       ⟨220691⟩
                loc_6C24F:                                                                            ⟨220693⟩
                CRT_Strlen(arg_8)                                                                     ⟨220695⟩
                CRT_Strlen(arg_8)                                                                     ⟨220701⟩
            CRT_Strcat(textes1[0], arg_8)                                                             ⟨220716⟩
            CRT_Strcat(textes1[0], 7996)                                                              ⟨220720⟩
            v370 = 0                                                                                  ⟨220722⟩
            aller à loc_6C2B8                                                                         ⟨220723⟩
            répéter, tant que 20 - CRT_Strlen(arg_8) > v370 :
                CRT_Strcat(textes1[0], 7992)                                                          ⟨220729⟩
                v370 = v370 + 1                                                                       ⟨220731⟩
                loc_6C2B8:                                                                            ⟨220733⟩
                CRT_Strlen(arg_8)                                                                     ⟨220735⟩
        sinon :
            si CRT_Strlen(arg_10) != 0 :
                CRT_Strcat(textes1[0], 7994)                                                          ⟨220756⟩
                v370 = 0                                                                              ⟨220758⟩
                aller à loc_6C30B                                                                     ⟨220759⟩
                répéter, tant que (40 - CRT_Strlen(arg_10)) - ((20 - CRT_Strlen(arg_10)) / 3) > v370 :
                    CRT_Strcat(textes1[0], 7992)                                                      ⟨220765⟩
                    v370 = v370 + 1                                                                   ⟨220767⟩
                    loc_6C30B:                                                                        ⟨220769⟩
                    CRT_Strlen(arg_10)                                                                ⟨220771⟩
                    CRT_Strlen(arg_10)                                                                ⟨220777⟩
                CRT_Strcat(textes1[0], arg_10)                                                        ⟨220792⟩
                CRT_Strcat(textes1[0], 7996)                                                          ⟨220796⟩
                v370 = 0                                                                              ⟨220798⟩
                aller à loc_6C374                                                                     ⟨220799⟩
                répéter, tant que 20 - CRT_Strlen(arg_10) > v370 :
                    CRT_Strcat(textes1[0], 7992)                                                      ⟨220805⟩
                    v370 = v370 + 1                                                                   ⟨220807⟩
                    loc_6C374:                                                                        ⟨220809⟩
                    CRT_Strlen(arg_10)                                                                ⟨220811⟩
            sinon :
                CRT_Strcat(textes1[0], 7996)                                                          ⟨220823⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨220831⟩
charge(midgames 12)                                                                                   ⟨220850⟩
charge(midgames 13)                                                                                   ⟨220862⟩
charge(midgames 18)                                                                                   ⟨220874⟩
charge(mid2 0)                                                                                        ⟨220886⟩
charge(mid2 1)                                                                                        ⟨220898⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨220908⟩
charge_convdata_type0("tex", drapeau=3)                                                               ⟨220918⟩
charge(mid2 3)                                                                                        ⟨220930⟩
charge(mid2 4)                                                                                        ⟨220942⟩
charge(mid2 2)                                                                                        ⟨220954⟩
charge(midgames 14)                                                                                   ⟨220966⟩
charge(midgames 15)                                                                                   ⟨220978⟩
charge(midgames 16)                                                                                   ⟨220990⟩
charge(midgames 17)                                                                                   ⟨221002⟩
charge(mid2 5)                                                                                        ⟨221014⟩
c1 = Layer(ressource=midgames 12, x=0, y=0)                                                           ⟨221021⟩
charge_convdata_type2("normal")                                                                       ⟨221032⟩
palette_depuis(pal2(convdata type 2 "normal"))                                                        ⟨221039⟩
charge(midgames 9)                                                                                    ⟨221051⟩
palette_depuis(pal3(midgames 9))                                                                      ⟨221058⟩
charge(midgames 10)                                                                                   ⟨221070⟩
palette_depuis(pal4(midgames 10))                                                                     ⟨221077⟩
charge(mid2 6)                                                                                        ⟨221089⟩
palette_depuis(pal5(mid2 6))                                                                          ⟨221096⟩
charge(mid2 7)                                                                                        ⟨221108⟩
palette_depuis(pal6(mid2 7))                                                                          ⟨221115⟩
charge(midgames 11)                                                                                   ⟨221127⟩
palette_depuis(pal7(midgames 11))                                                                     ⟨221134⟩
v332 = 0                                                                                              ⟨221136⟩
v327 = 0                                                                                              ⟨221138⟩
v326 = 0                                                                                              ⟨221139⟩
v342 = 0                                                                                              ⟨221140⟩
v337 = 0                                                                                              ⟨221142⟩
v336 = 0                                                                                              ⟨221143⟩
v352 = 0                                                                                              ⟨221144⟩
v347 = 0                                                                                              ⟨221146⟩
v346 = 0                                                                                              ⟨221147⟩
v362 = 0                                                                                              ⟨221148⟩
v357 = 0                                                                                              ⟨221150⟩
v356 = 0                                                                                              ⟨221151⟩
v3170 = 0                                                                                             ⟨221152⟩
v3165 = 0                                                                                             ⟨221154⟩
v3164 = 0                                                                                             ⟨221155⟩
v3174 = 0                                                                                             ⟨221156⟩
v3184 = 0                                                                                             ⟨221158⟩
v3179 = 0                                                                                             ⟨221160⟩
v3178 = 0                                                                                             ⟨221161⟩
v3188 = 0                                                                                             ⟨221162⟩
v3198 = 0                                                                                             ⟨221164⟩
v3193 = 0                                                                                             ⟨221166⟩
v3192 = 0                                                                                             ⟨221167⟩
v3202 = 0                                                                                             ⟨221168⟩
v3212 = 0                                                                                             ⟨221170⟩
v3207 = 0                                                                                             ⟨221172⟩
v3206 = 0                                                                                             ⟨221173⟩
v3216 = 0                                                                                             ⟨221174⟩
si v15 != 0 :
    charge(asoundfx 22)                                                                               ⟨221188⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨221193⟩
    canal_enregistre(canal=canal2, ressource=asoundfx 22, x=0)                                        ⟨221200⟩
    charge(asoundfx 16)                                                                               ⟨221208⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨221213⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 16, x=0)                                        ⟨221220⟩
    charge(asoundfx 17)                                                                               ⟨221228⟩
    canal_init(canal=canal4, pilote=word_46849)                                                       ⟨221233⟩
    canal_enregistre(canal=canal4, ressource=asoundfx 17, x=0)                                        ⟨221240⟩
    charge(asoundfx 41)                                                                               ⟨221248⟩
    canal_init(canal=canal5, pilote=word_46849)                                                       ⟨221253⟩
    canal_enregistre(canal=canal5, ressource=asoundfx 17, x=0)                                        ⟨221260⟩
si byte_495FC == 0 :
    si v13 != 0 :
        v364 = word_48F76                                                                             ⟨221273⟩
        si canal1.+0 != 0 :
            AIL_start_sequence(pilote=canal1.+0→4, séquence=v1072)                                    ⟨221280⟩
            AIL_set_relative_volume_30C66(canal1.+0→4, v1072, v364, 0)                                ⟨221287⟩

    ──── scène1 ────
    scène1 = Scene_Create(cadence=9, palette=255, surface=&v508)                                      ⟨221299⟩
    c2 = Layer(ressource=mid2 3, x=0, y=-23)                                                          ⟨221306⟩
    c3 = OverlayImageLayer(ressource=mid2 2, x=0, y=-23, image=1)                                     ⟨221315⟩
    c4 = Layer(ressource=mid2 4, x=0, y=-23)                                                          ⟨221323⟩
    c5 = Layer(ressource=midgames 14, x=0, y=-23)                                                     ⟨221331⟩
    c6 = Layer(ressource=midgames 15, x=0, y=-23)                                                     ⟨221339⟩
    palette_copie(destination=pal1, source=pal4(midgames 10))                                         ⟨221349⟩
    palette_copie(destination=pal1, source=pal3(midgames 9))                                          ⟨221358⟩
    palette_envoie(palette=pal1, pas=0)                                                               ⟨221370⟩
    ajoute c1 à scène1                                                                                ⟨221375⟩
    ajoute c2 à scène1                                                                                ⟨221380⟩
    ajoute c3 à scène1                                                                                ⟨221385⟩
    ajoute c4 à scène1                                                                                ⟨221390⟩
    ajoute c5 à scène1                                                                                ⟨221395⟩
    ajoute c6 à scène1                                                                                ⟨221400⟩
    si v14 != 0 :
        Scene_Tick(scène=scène1)                                                                      ⟨221410⟩
        charge(mid2voc 0)                                                                             ⟨221422⟩
        voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid2voc 0)                              ⟨221428⟩
        v392 = 0                                                                                      ⟨221430⟩
        tant que v392 < 4 :
            Scene_Tick(scène=scène1)                                                                  ⟨221437⟩
            v392 = v392 + 1                                                                           ⟨221439⟩
        voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                               ⟨221447⟩
        tant que voix_en_cours(voix=voix1) != 0 :
            CRT_Rand()                                                                                ⟨221453⟩
            v394 = (CRT_Rand()·6) / 32768                                                             ⟨221459⟩
            c6.image = v394                                                                           ⟨221462⟩
            Scene_Tick(scène=scène1)                                                                  ⟨221475⟩
        c6.image = 0                                                                                  ⟨221488⟩
        v392 = 0                                                                                      ⟨221489⟩
        tant que v392 < 4 :
            Scene_Tick(scène=scène1)                                                                  ⟨221496⟩
            v392 = v392 + 1                                                                           ⟨221498⟩
        voix_arrête(voix=voix1)                                                                       ⟨221505⟩
        v384 = 0                                                                                      ⟨221525⟩
    sinon :
        v560→0.méthode8(15)                                                                           ⟨221534⟩
        v8 = 43                                                                                       ⟨221536⟩
        si = scène1.compteur                                                                          ⟨221537⟩
        tant que (scène1.compteur < si + ((v8·70) / 100)) et (scène1.terminée == 0) :
            v382 = scène1.compteur                                                                    ⟨221552⟩
            si si + 5 < v382 :
                CRT_Rand()                                                                            ⟨221557⟩
                v384 = (CRT_Rand()·6) / 32768                                                         ⟨221563⟩
                c6.image = v384                                                                       ⟨221566⟩
            si si + 5 == v382 :
                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[0])                          ⟨221576⟩
            si (si + ((v8·70) / 100)) - 1 == v382 :
                c6.image = 0                                                                          ⟨221585⟩
            Scene_Tick(scène=scène1)                                                                  ⟨221616⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène1, drapeaux=0)                                                      ⟨221647⟩
    sinon :
        v378 = 0                                                                                      ⟨221653⟩
        v380 = 0                                                                                      ⟨221654⟩
        si v14 != 0 :
            Scene_Tick(scène=scène1)                                                                  ⟨221663⟩
            v384 = 0                                                                                  ⟨221668⟩
            charge(mid2voc 7)                                                                         ⟨221675⟩
            voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid2voc 7)                          ⟨221681⟩
            v392 = 0                                                                                  ⟨221683⟩
            tant que v392 < 4 :
                Scene_Tick(scène=scène1)                                                              ⟨221690⟩
                v392 = v392 + 1                                                                       ⟨221692⟩
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨221700⟩
            tant que voix_en_cours(voix=voix1) != 0 :
                CRT_Rand()                                                                            ⟨221706⟩
                v394 = ((CRT_Rand()·6) / 32768) + 1                                                   ⟨221713⟩
                c3.image = v394                                                                       ⟨221716⟩
                si v380 > 2 :
                    v380_avant = v380                                                                 ⟨221720⟩
                    v380 = v380 + 1                                                                   ⟨221720⟩
                    si v380_avant < 6 :
                        v396 = v378                                                                   ⟨221724⟩
                        v378_avant = v378                                                             ⟨221725⟩
                        v378 = v378 + 1                                                               ⟨221725⟩
                        c4.image = v396                                                               ⟨221728⟩
                Scene_Tick(scène=scène1)                                                              ⟨221744⟩
            c3.image = 1                                                                              ⟨221757⟩
            v392 = 0                                                                                  ⟨221758⟩
            tant que v392 < 4 :
                Scene_Tick(scène=scène1)                                                              ⟨221765⟩
                v392 = v392 + 1                                                                       ⟨221767⟩
            voix_arrête(voix=voix1)                                                                   ⟨221774⟩
            v384 = 0                                                                                  ⟨221794⟩
        sinon :
            v560→0.méthode8(35)                                                                       ⟨221803⟩
            v8 = 42                                                                                   ⟨221805⟩
            si = scène1.compteur                                                                      ⟨221806⟩
            tant que (scène1.compteur < si + ((v8·70) / 100)) et (scène1.terminée == 0) :
                v382 = scène1.compteur                                                                ⟨221821⟩
                si si + 2 < v382 :
                    si si + 6 > v382 :
                        v384 = v378                                                                   ⟨221831⟩
                        v378_avant = v378                                                             ⟨221832⟩
                        v378 = v378 + 1                                                               ⟨221832⟩
                        c4.image = v384                                                               ⟨221835⟩
                si si + 2 == v382 :
                    v3262 = 4540                                                                      ⟨221843⟩
                    v3262 = 4552                                                                      ⟨221844⟩
                    v3262 = 4568                                                                      ⟨221845⟩
                    v3262 = 4584                                                                      ⟨221846⟩
                    v3262 = 4604                                                                      ⟨221847⟩
                    Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)     ⟨221857⟩
                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[1])                      ⟨221864⟩
                CRT_Rand()                                                                            ⟨221868⟩
                v386 = ((CRT_Rand()·6) / 32768) + 1                                                   ⟨221875⟩
                c3.image = v386                                                                       ⟨221878⟩
                Scene_Tick(scène=scène1)                                                              ⟨221907⟩
        Scene_Destruct(scène=scène1, drapeaux=0)                                                      ⟨221936⟩
        si byte_495FC == 0 :

            ──── scène2 ────
            scène2 = Scene_Create(cadence=9, palette=255, surface=&v508)                              ⟨221950⟩
            c7 = Layer(ressource=mid2 1, x=0, y=0)                                                    ⟨221957⟩
            CRT_Rand()                                                                                ⟨221961⟩
            c8 = TalkingHead(ressource=convdata type 0 "tex", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨221972⟩
            tête_image_de_base(tête=c8, image=31)                                                     ⟨221977⟩
            ajoute c7 à scène2                                                                        ⟨221982⟩
            ajoute c8 à scène2                                                                        ⟨221987⟩
            palette_copie(destination=pal1, source=pal6(mid2 7))                                      ⟨221996⟩
            palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                    ⟨222005⟩
            palette_envoie(palette=pal1, pas=0)                                                       ⟨222017⟩
            si v14 != 0 :
                Scene_Tick(scène=scène2)                                                              ⟨222027⟩
                charge(mid2voc 1)                                                                     ⟨222039⟩
                tête_voix(tête=c8, ressource=mid2voc 1, cadence=9)                                    ⟨222045⟩
                v382 = 0                                                                              ⟨222047⟩
                tant que v382 < 3 :
                    Scene_Tick(scène=scène2)                                                          ⟨222054⟩
                    v382 = v382 + 1                                                                   ⟨222056⟩
                tant que tête_parle(tête=c8) != 0 :
                    Scene_Tick(scène=scène2)                                                          ⟨222077⟩
                v382 = 0                                                                              ⟨222088⟩
                tant que v382 < 2 :
                    Scene_Tick(scène=scène2)                                                          ⟨222095⟩
                    v382 = v382 + 1                                                                   ⟨222097⟩
                v380 = 0                                                                              ⟨222118⟩
                v374 = 0                                                                              ⟨222120⟩
            sinon :
                v560→0.méthode8(254)                                                                  ⟨222129⟩
                v8 = 57                                                                               ⟨222131⟩
                si = scène2.compteur                                                                  ⟨222132⟩
                tant que (scène2.compteur < si + ((v8·70) / 100)) et (scène2.terminée == 0) :
                    v372 = scène2.compteur                                                            ⟨222147⟩
                    si si + 2 == v372 :
                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[2])                  ⟨222159⟩
                    si si + 2 == v372 :
                        tête_texte_de_lèvres(tête=c8, texte="korzyudontnsfsddelza ")                  ⟨222169⟩
                    si (si + ((v8·70) / 100)) - 1 == v372 :
                        v3262 = 4540                                                                  ⟨222177⟩
                        v3262 = 4552                                                                  ⟨222178⟩
                        v3262 = 4568                                                                  ⟨222179⟩
                        v3262 = 4584                                                                  ⟨222180⟩
                        v3262 = 4604                                                                  ⟨222181⟩
                        Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨222191⟩
                    Scene_Tick(scène=scène2)                                                          ⟨222223⟩
            Scene_Destruct(scène=scène2, drapeaux=0)                                                  ⟨222252⟩
            si byte_495FC == 0 :

                ──── scène3 ────
                scène3 = Scene_Create(cadence=9, palette=255, surface=&v508)                          ⟨222266⟩
                c9 = Layer(ressource=mid2 0, x=0, y=0)                                                ⟨222273⟩
                CRT_Rand()                                                                            ⟨222277⟩
                c10 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨222288⟩
                tête_image_de_base(tête=c10, image=33)                                                ⟨222293⟩
                ajoute c9 à scène3                                                                    ⟨222298⟩
                ajoute c10 à scène3                                                                   ⟨222303⟩
                palette_copie(destination=pal1, source=pal5(mid2 6))                                  ⟨222312⟩
                palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                ⟨222321⟩
                palette_envoie(palette=pal1, pas=0)                                                   ⟨222333⟩
                si v14 != 0 :
                    Scene_Tick(scène=scène3)                                                          ⟨222343⟩
                    v380 = 0                                                                          ⟨222345⟩
                    v374 = 0                                                                          ⟨222348⟩
                    charge(mid2voc 8)                                                                 ⟨222355⟩
                    tête_voix(tête=c10, ressource=mid2voc 8, cadence=9)                               ⟨222361⟩
                    v382 = 0                                                                          ⟨222363⟩
                    tant que v382 < 3 :
                        Scene_Tick(scène=scène3)                                                      ⟨222370⟩
                        v382 = v382 + 1                                                               ⟨222372⟩
                    tant que tête_parle(tête=c10) != 0 :
                        Scene_Tick(scène=scène3)                                                      ⟨222393⟩
                    charge(mid2voc 9)                                                                 ⟨222414⟩
                    tête_voix(tête=c10, ressource=mid2voc 9, cadence=9)                               ⟨222420⟩
                    v382 = 0                                                                          ⟨222422⟩
                    tant que v382 < 4 :
                        Scene_Tick(scène=scène3)                                                      ⟨222429⟩
                        v382 = v382 + 1                                                               ⟨222431⟩
                    tant que tête_parle(tête=c10) != 0 :
                        Scene_Tick(scène=scène3)                                                      ⟨222452⟩
                    v382 = 0                                                                          ⟨222463⟩
                    tant que v382 < 4 :
                        Scene_Tick(scène=scène3)                                                      ⟨222470⟩
                        v382 = v382 + 1                                                               ⟨222472⟩
                    v386 = 0                                                                          ⟨222495⟩
                    v380 = 0                                                                          ⟨222512⟩
                    v374 = 0                                                                          ⟨222514⟩
                sinon :
                    v560→0.méthode8(224)                                                              ⟨222523⟩
                    v8 = 50                                                                           ⟨222525⟩
                    si = scène3.compteur                                                              ⟨222526⟩
                    tant que (scène3.compteur < si + ((v8·70) / 100)) et (scène3.terminée == 0) :
                        v372 = scène3.compteur                                                        ⟨222541⟩
                        si si + 2 == v372 :
                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[3])              ⟨222554⟩
                        si si + 2 == v372 :
                            tête_texte_de_lèvres(tête=c10, texte="aebelvnthchnfcmndtx")               ⟨222564⟩
                        si (si + ((v8·70) / 100)) - 1 == v372 :
                            v3262 = 4540                                                              ⟨222572⟩
                            v3262 = 4552                                                              ⟨222573⟩
                            v3262 = 4568                                                              ⟨222574⟩
                            v3262 = 4584                                                              ⟨222575⟩
                            v3262 = 4604                                                              ⟨222576⟩
                            Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨222586⟩
                        Scene_Tick(scène=scène3)                                                      ⟨222618⟩
                    si byte_495FC != 0 :
                        Scene_Destruct(scène=scène3, drapeaux=0)                                      ⟨222649⟩
                        aller à loc_70D3F                                                             ⟨222651⟩
                    v8_avant = si + ((v8·70) / 100)                                                   ⟨222655⟩
                    v8 = 53                                                                           ⟨222655⟩
                    si = scène3.compteur                                                              ⟨222656⟩
                    tant que (scène3.compteur < si + ((v8·70) / 100)) et (scène3.terminée == 0) :
                        v372 = scène3.compteur                                                        ⟨222671⟩
                        si si + 2 == v372 :
                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[4])              ⟨222683⟩
                        si si + 2 == v372 :
                            tête_texte_de_lèvres(tête=c10, texte="mybeyogttagethlot")                 ⟨222693⟩
                        si (si + ((v8·70) / 100)) - 1 == v372 :
                            v3262 = 4540                                                              ⟨222701⟩
                            v3262 = 4552                                                              ⟨222702⟩
                            v3262 = 4568                                                              ⟨222703⟩
                            v3262 = 4584                                                              ⟨222704⟩
                            v3262 = 4604                                                              ⟨222705⟩
                            Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨222715⟩
                        Scene_Tick(scène=scène3)                                                      ⟨222747⟩
                Scene_Destruct(scène=scène3, drapeaux=0)                                              ⟨222776⟩
                si byte_495FC == 0 :
                    v367 = 0                                                                          ⟨222784⟩

                    ──── scène4 ────
                    scène4 = Scene_Create(cadence=9, palette=255, surface=&v508)                      ⟨222791⟩
                    c11 = Layer(ressource=mid2 1, x=0, y=0)                                           ⟨222798⟩
                    CRT_Rand()                                                                        ⟨222802⟩
                    c12 = TalkingHead(ressource=convdata type 0 "tex", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨222813⟩
                    tête_image_de_base(tête=c12, image=31)                                            ⟨222818⟩
                    ajoute c11 à scène4                                                               ⟨222823⟩
                    ajoute c12 à scène4                                                               ⟨222828⟩
                    palette_copie(destination=pal1, source=pal6(mid2 7))                              ⟨222837⟩
                    palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))            ⟨222846⟩
                    palette_envoie(palette=pal1, pas=0)                                               ⟨222858⟩
                    si v14 != 0 :
                        Scene_Tick(scène=scène4)                                                      ⟨222868⟩
                        charge(mid2voc 2)                                                             ⟨222880⟩
                        tête_voix(tête=c12, ressource=mid2voc 2, cadence=9)                           ⟨222886⟩
                        v386 = 0                                                                      ⟨222888⟩
                        tant que v386 < 10 :
                            si v15 != 0 :
                                CRT_Rand()                                                            ⟨222899⟩
                                v370 = (CRT_Rand()·10) / 32768                                        ⟨222905⟩
                                si v370 > 6 :
                                    si v367 == 0 :
                                        v388 = word_48ECE                                             ⟨222913⟩
                                        si canal2.+0 != 0 :
                                            AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)    ⟨222920⟩
                                            AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v388, mid2voc 7.+0)  ⟨222927⟩
                                        v367 = 1                                                      ⟨222932⟩
                                    sinon :
                                        si v370 <= 6 :
                                            si v367 != 0 :
                                                si canal2.+0 != 0 :
                                                    AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨222947⟩
                                                v367 = 0                                              ⟨222952⟩
                                sinon :
                                    si v370 <= 6 :
                                        si v367 != 0 :
                                            si canal2.+0 != 0 :
                                                AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨222947⟩
                                            v367 = 0                                                  ⟨222952⟩
                            Scene_Tick(scène=scène4)                                                  ⟨222958⟩
                            v386 = v386 + 1                                                           ⟨222960⟩
                        si v15 != 0 :
                            si v367 != 0 :
                                si canal2.+0 != 0 :
                                    AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)             ⟨222978⟩
                        v386 = 0                                                                      ⟨222984⟩
                        tant que tête_parle(tête=c12) != 0 :
                            si v386 == 2 :
                                tête_image_de_base(tête=c12, image=25)                                ⟨222993⟩
                            si v386 == 2 :
                                si v15 != 0 :
                                    v392 = word_48ECE                                                 ⟨223002⟩
                                    v394 = 0                                                          ⟨223003⟩
                                    si canal2.+0 != 0 :
                                        AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)        ⟨223009⟩
                                        AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v392, v394)  ⟨223016⟩
                            v386_avant = v386                                                         ⟨223023⟩
                            v386 = v386 + 1                                                           ⟨223023⟩
                            si v386_avant == 8 :
                                tête_image_de_base(tête=c12, image=18)                                ⟨223028⟩
                            Scene_Tick(scène=scène4)                                                  ⟨223044⟩
                        v386 = 0                                                                      ⟨223058⟩
                        tant que v386 < 4 :
                            Scene_Tick(scène=scène4)                                                  ⟨223065⟩
                            v386 = v386 + 1                                                           ⟨223067⟩
                        v378 = 0                                                                      ⟨223090⟩
                    sinon :
                        v560→0.méthode8(254)                                                          ⟨223099⟩
                        v376 = 0                                                                      ⟨223101⟩
                        tant que v376 < 10 :
                            si v15 != 0 :
                                CRT_Rand()                                                            ⟨223112⟩
                                v370 = (CRT_Rand()·10) / 32768                                        ⟨223118⟩
                                si v370 > 6 :
                                    si v367 == 0 :
                                        v378 = word_48ECE                                             ⟨223126⟩
                                        v380 = 0                                                      ⟨223127⟩
                                        si canal2.+0 != 0 :
                                            AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)    ⟨223133⟩
                                            AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v378, v380)  ⟨223140⟩
                                        v367 = 1                                                      ⟨223145⟩
                                    sinon :
                                        si v370 <= 6 :
                                            si v367 != 0 :
                                                si canal2.+0 != 0 :
                                                    AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨223160⟩
                                                v367 = 0                                              ⟨223165⟩
                                sinon :
                                    si v370 <= 6 :
                                        si v367 != 0 :
                                            si canal2.+0 != 0 :
                                                AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨223160⟩
                                            v367 = 0                                                  ⟨223165⟩
                            Scene_Tick(scène=scène4)                                                  ⟨223171⟩
                            v376 = v376 + 1                                                           ⟨223173⟩
                        si v15 != 0 :
                            si v367 != 0 :
                                si canal2.+0 != 0 :
                                    AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)             ⟨223191⟩
                        v8 = 20                                                                       ⟨223197⟩
                        si = scène4.compteur                                                          ⟨223198⟩
                        tant que (scène4.compteur < si + ((v8·70) / 100)) et (scène4.terminée == 0) :
                            v382 = scène4.compteur                                                    ⟨223213⟩
                            si si + 2 == v382 :
                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[5])          ⟨223226⟩
                            si si + 2 == v382 :
                                si v15 != 0 :
                                    v386 = 0                                                          ⟨223238⟩
                                    si canal2.+0 != 0 :
                                        AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)        ⟨223244⟩
                                        AIL_set_relative_volume_30C66(canal2.+0→4, v3172, word_48ECE, v386)  ⟨223251⟩
                            si si + 2 == v382 :
                                tête_image_de_base(tête=c12, image=25)                                ⟨223263⟩
                            si si + 8 == v382 :
                                tête_image_de_base(tête=c12, image=18)                                ⟨223273⟩
                            si si + 2 == v382 :
                                tête_texte_de_lèvres(tête=c12, texte="hdon")                          ⟨223283⟩
                            si (si + ((v8·70) / 100)) - 1 == v382 :
                                v3262 = 4540                                                          ⟨223291⟩
                                v3262 = 4552                                                          ⟨223292⟩
                                v3262 = 4568                                                          ⟨223293⟩
                                v3262 = 4584                                                          ⟨223294⟩
                                v3262 = 4604                                                          ⟨223295⟩
                                Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨223305⟩
                            Scene_Tick(scène=scène4)                                                  ⟨223337⟩
                    Scene_Destruct(scène=scène4, drapeaux=0)                                          ⟨223366⟩
                    si byte_495FC == 0 :

                        ──── scène5 ────
                        scène5 = Scene_Create(cadence=9, palette=255, surface=&v508)                  ⟨223380⟩
                        c13 = Layer(ressource=midgames 12, x=0, y=0)                                  ⟨223387⟩
                        c14 = Layer(ressource=midgames 13, x=0, y=0)                                  ⟨223395⟩
                        c15 = Layer(ressource=mid2 3, x=0, y=-23)                                     ⟨223403⟩
                        c16 = OverlayImageLayer(ressource=mid2 2, x=0, y=-23, image=1)                ⟨223412⟩
                        c17 = Layer(ressource=mid2 4, x=0, y=-23)                                     ⟨223420⟩
                        c18 = Layer(ressource=midgames 14, x=0, y=-23)                                ⟨223428⟩
                        c19 = Layer(ressource=midgames 15, x=0, y=-23)                                ⟨223436⟩
                        c20 = Layer(ressource=midgames 16, x=0, y=-23)                                ⟨223444⟩
                        c21 = Layer(ressource=midgames 17, x=0, y=-23)                                ⟨223452⟩
                        ajoute c13 à scène5                                                           ⟨223458⟩
                        ajoute c14 à scène5                                                           ⟨223463⟩
                        ajoute c15 à scène5                                                           ⟨223468⟩
                        ajoute c16 à scène5                                                           ⟨223473⟩
                        ajoute c17 à scène5                                                           ⟨223478⟩
                        ajoute c18 à scène5                                                           ⟨223483⟩
                        ajoute c19 à scène5                                                           ⟨223488⟩
                        palette_copie(destination=pal1, source=pal4(midgames 10))                     ⟨223501⟩
                        palette_copie(destination=pal1, source=pal3(midgames 9))                      ⟨223510⟩
                        palette_envoie(palette=pal1, pas=0)                                           ⟨223518⟩
                        v560→0.méthode8(15)                                                           ⟨223524⟩
                        v386 = 2                                                                      ⟨223526⟩
                        v388 = v386                                                                   ⟨223528⟩
                        c17.image = v388                                                              ⟨223531⟩
                        si v14 != 0 :
                            Scene_Tick(scène=scène5)                                                  ⟨223540⟩
                            charge(mid2voc 3)                                                         ⟨223552⟩
                            voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid2voc 3)          ⟨223558⟩
                            v402 = 0                                                                  ⟨223560⟩
                            tant que v402 < 4 :
                                CRT_Rand()                                                            ⟨223565⟩
                                v404 = (CRT_Rand()·2) / 32768                                         ⟨223571⟩
                                c14.image = v404                                                      ⟨223574⟩
                                Scene_Tick(scène=scène5)                                              ⟨223577⟩
                                v402 = v402 + 1                                                       ⟨223579⟩
                            v402 = 0                                                                  ⟨223584⟩
                            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                           ⟨223588⟩
                            si v15 != 0 :
                                si canal2.+0 != 0 :
                                    AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)             ⟨223597⟩
                                v406 = word_48EC2                                                     ⟨223603⟩
                                v408 = 0                                                              ⟨223604⟩
                                si canal3.+0 != 0 :
                                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)            ⟨223610⟩
                                    AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v406, v408)     ⟨223617⟩
                            tant que voix_en_cours(voix=voix1) != 0 :
                                CRT_Rand()                                                            ⟨223627⟩
                                v410 = (CRT_Rand()·2) / 32768                                         ⟨223633⟩
                                c14.image = v410                                                      ⟨223636⟩
                                si v402 == 3 :
                                    retire(parent=scène5, calque=c18)                                 ⟨223642⟩
                                    retire(parent=scène5, calque=c19)                                 ⟨223647⟩
                                    c18.détruit(3)                                                    ⟨223655⟩
                                    c19.détruit(3)                                                    ⟨223666⟩
                                    ajoute c20 à scène5                                               ⟨223674⟩
                                    ajoute c21 à scène5                                               ⟨223679⟩
                                v402_avant = v402                                                     ⟨223684⟩
                                v402 = v402 + 1                                                       ⟨223684⟩
                                si v402_avant == 4 :
                                    c20.image = 1                                                     ⟨223688⟩
                                    c21.image = 1                                                     ⟨223690⟩
                                Scene_Tick(scène=scène5)                                              ⟨223705⟩
                            si v15 != 0 :
                                si canal3.+0 != 0 :
                                    AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)             ⟨223727⟩
                                v412 = word_48ECE                                                     ⟨223733⟩
                                si canal2.+0 != 0 :
                                    AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)            ⟨223740⟩
                                    AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v412, 0)        ⟨223747⟩
                            voix_arrête(voix=voix1)                                                   ⟨223755⟩
                            v394 = 0                                                                  ⟨223775⟩
                        sinon :
                            v8 = 38                                                                   ⟨223780⟩
                            si = scène5.compteur                                                      ⟨223781⟩
                            tant que (scène5.compteur < si + ((v8·70) / 100)) et (scène5.terminée == 0) :
                                v392 = scène5.compteur                                                ⟨223796⟩
                                CRT_Rand()                                                            ⟨223797⟩
                                v394 = (CRT_Rand()·2) / 32768                                         ⟨223803⟩
                                c14.image = v394                                                      ⟨223806⟩
                                si si + 2 == v392 :
                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])      ⟨223819⟩
                                si si + 3 == v392 :
                                    retire(parent=scène5, calque=c18)                                 ⟨223830⟩
                                    retire(parent=scène5, calque=c19)                                 ⟨223835⟩
                                    c18.détruit(3)                                                    ⟨223843⟩
                                    c19.détruit(3)                                                    ⟨223854⟩
                                    ajoute c20 à scène5                                               ⟨223862⟩
                                    ajoute c21 à scène5                                               ⟨223867⟩
                                si si + 4 == v392 :
                                    c20.image = 1                                                     ⟨223876⟩
                                    c21.image = 1                                                     ⟨223878⟩
                                si (si + ((v8·70) / 100)) - 5 == v392 :
                                    v3262 = 4540                                                      ⟨223885⟩
                                    v3262 = 4552                                                      ⟨223886⟩
                                    v3262 = 4568                                                      ⟨223887⟩
                                    v3262 = 4584                                                      ⟨223888⟩
                                    v3262 = 4604                                                      ⟨223889⟩
                                    Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨223899⟩
                                Scene_Tick(scène=scène5)                                              ⟨223931⟩
                            si byte_495FC != 0 :
                                Scene_Destruct(scène=scène5, drapeaux=0)                              ⟨223962⟩
                                aller à loc_70D3F                                                     ⟨223964⟩
                            v560→0.méthode8(167)                                                      ⟨223972⟩
                            v8_avant = si + ((v8·70) / 100)                                           ⟨223974⟩
                            v8 = 45                                                                   ⟨223974⟩
                            si = scène5.compteur                                                      ⟨223975⟩
                            tant que (scène5.compteur < si + ((v8·70) / 100)) et (scène5.terminée == 0) :
                                v392 = scène5.compteur                                                ⟨223990⟩
                                CRT_Rand()                                                            ⟨223991⟩
                                v394 = (CRT_Rand()·2) / 32768                                         ⟨223997⟩
                                c14.image = v394                                                      ⟨224000⟩
                                si si + 1 == v392 :
                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[7])      ⟨224017⟩
                                    si v15 != 0 :
                                        si canal2.+0 != 0 :
                                            AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)     ⟨224026⟩
                                        v396 = word_48EC2                                             ⟨224032⟩
                                        v398 = 0                                                      ⟨224033⟩
                                        si canal3.+0 != 0 :
                                            AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)    ⟨224039⟩
                                            AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v396, v398)  ⟨224046⟩
                                si (si + ((v8·70) / 100)) - 1 == v392 :
                                    v3262 = 4540                                                      ⟨224060⟩
                                    v3262 = 4552                                                      ⟨224061⟩
                                    v3262 = 4568                                                      ⟨224062⟩
                                    v3262 = 4584                                                      ⟨224063⟩
                                    v3262 = 4604                                                      ⟨224064⟩
                                    Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨224074⟩
                                    si v15 != 0 :
                                        si canal3.+0 != 0 :
                                            AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)     ⟨224083⟩
                                        v402 = 0                                                      ⟨224090⟩
                                        si canal2.+0 != 0 :
                                            AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)    ⟨224096⟩
                                            AIL_set_relative_volume_30C66(canal2.+0→4, v3172, word_48ECE, v402)  ⟨224103⟩
                                Scene_Tick(scène=scène5)                                              ⟨224137⟩
                        CRT_Rand()                                                                    ⟨224163⟩
                        c14.image = CRT_Rand() / 32768                                                ⟨224171⟩
                        si v14 != 0 :
                            v392 = 0                                                                  ⟨224178⟩
                            Scene_Tick(scène=scène5)                                                  ⟨224181⟩
                            charge(mid2voc 10)                                                        ⟨224193⟩
                            voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid2voc 10)         ⟨224199⟩
                            v404 = 0                                                                  ⟨224201⟩
                            tant que v404 < 2 :
                                Scene_Tick(scène=scène5)                                              ⟨224208⟩
                                v404 = v404 + 1                                                       ⟨224210⟩
                            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                           ⟨224218⟩
                            si v15 != 0 :
                                si canal2.+0 != 0 :
                                    AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)             ⟨224227⟩
                                v406 = word_48EC2                                                     ⟨224233⟩
                                v408 = 0                                                              ⟨224234⟩
                                si canal3.+0 != 0 :
                                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)            ⟨224240⟩
                                    AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v406, v408)     ⟨224247⟩
                            tant que voix_en_cours(voix=voix1) != 0 :
                                v392_avant = v392                                                     ⟨224258⟩
                                v392 = v392 + 1                                                       ⟨224258⟩
                                si v392_avant == 3 :
                                    c16.image = 10                                                    ⟨224262⟩
                                Scene_Tick(scène=scène5)                                              ⟨224277⟩
                            si v15 != 0 :
                                si canal3.+0 != 0 :
                                    AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)             ⟨224296⟩
                                v410 = word_48ECE                                                     ⟨224302⟩
                                v412 = 0                                                              ⟨224303⟩
                                si canal2.+0 != 0 :
                                    AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)            ⟨224309⟩
                                    AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v410, v412)     ⟨224316⟩
                            v404 = 0                                                                  ⟨224322⟩
                            tant que v404 < 4 :
                                Scene_Tick(scène=scène5)                                              ⟨224329⟩
                                v404 = v404 + 1                                                       ⟨224331⟩
                            voix_arrête(voix=voix1)                                                   ⟨224338⟩
                            v402 = 0                                                                  ⟨224356⟩
                            v396 = 0                                                                  ⟨224358⟩
                        sinon :
                            v560→0.méthode8(35)                                                       ⟨224367⟩
                            v8 = 40                                                                   ⟨224369⟩
                            si = scène5.compteur                                                      ⟨224370⟩
                            tant que (scène5.compteur < si + ((v8·70) / 100)) et (scène5.terminée == 0) :
                                v392 = scène5.compteur                                                ⟨224385⟩
                                si si + 2 < v392 :
                                    si si + 6 > v392 :
                                        v394 = v386                                                   ⟨224395⟩
                                        v386_avant = v386                                             ⟨224396⟩
                                        v386 = v386 - 1                                               ⟨224396⟩
                                        c17.image = v394                                              ⟨224399⟩
                                si si + 5 == v392 :
                                    c16.image = 10                                                    ⟨224408⟩
                                si si + 5 == v392 :
                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])      ⟨224422⟩
                                si (si + ((v8·70) / 100)) - 2 == v392 :
                                    v3262 = 4540                                                      ⟨224430⟩
                                    v3262 = 4552                                                      ⟨224431⟩
                                    v3262 = 4568                                                      ⟨224432⟩
                                    v3262 = 4584                                                      ⟨224433⟩
                                    v3262 = 4604                                                      ⟨224434⟩
                                    Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨224444⟩
                                Scene_Tick(scène=scène5)                                              ⟨224476⟩
                        Scene_Destruct(scène=scène5, drapeaux=0)                                      ⟨224505⟩
                        si byte_495FC == 0 :

                            ──── scène6 ────
                            scène6 = Scene_Create(cadence=20, palette=255, surface=&v508)             ⟨224519⟩
                            c22 = OverlayImageLayer(ressource=midgames 18, x=0, y=0, image=0)         ⟨224527⟩
                            ajoute c22 à scène6                                                       ⟨224533⟩
                            palette_copie(destination=pal1, source=pal7(midgames 11))                 ⟨224546⟩
                            palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))    ⟨224555⟩
                            palette_envoie(palette=pal1, pas=0)                                       ⟨224563⟩
                            v560→0.méthode8(167)                                                      ⟨224569⟩
                            c22.image = 0                                                             ⟨224572⟩
                            sub_85A(0)                                                                ⟨224574⟩
                            sub_6F2(sub_85A(0))                                                       ⟨224577⟩
                            v370 = 4                                                                  ⟨224579⟩
                            si v14 != 0 :
                                Scene_Tick(scène=scène6)                                              ⟨224588⟩
                                charge(mid2voc 4)                                                     ⟨224600⟩
                                voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid2voc 4)      ⟨224606⟩
                                v382 = 0                                                              ⟨224608⟩
                                tant que v382 < 4 :
                                    CRT_Rand()                                                        ⟨224613⟩
                                    c22.image = ((CRT_Rand()·6) / 32768) + 3                          ⟨224623⟩
                                    Scene_Tick(scène=scène6)                                          ⟨224626⟩
                                    v382 = v382 + 1                                                   ⟨224628⟩
                                voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                       ⟨224636⟩
                                si v15 != 0 :
                                    si canal2.+0 != 0 :
                                        AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)         ⟨224645⟩
                                    v386 = word_48EC2                                                 ⟨224651⟩
                                    v388 = 0                                                          ⟨224652⟩
                                    si canal3.+0 != 0 :
                                        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)        ⟨224658⟩
                                        AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v386, v388)  ⟨224665⟩
                                tant que voix_en_cours(voix=voix1) != 0 :
                                    CRT_Rand()                                                        ⟨224675⟩
                                    c22.image = ((CRT_Rand()·6) / 32768) + 3                          ⟨224685⟩
                                    Scene_Tick(scène=scène6)                                          ⟨224698⟩
                                si v15 != 0 :
                                    si canal3.+0 != 0 :
                                        AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)         ⟨224717⟩
                                    v392 = word_48ECE                                                 ⟨224723⟩
                                    v394 = 0                                                          ⟨224724⟩
                                    si canal2.+0 != 0 :
                                        AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)        ⟨224730⟩
                                        AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v392, v394)  ⟨224737⟩
                                v382 = 0                                                              ⟨224743⟩
                                tant que v382 < 5 :
                                    si v370 < 1 :
                                        v370 = 1                                                      ⟨224750⟩
                                    v396 = v370                                                       ⟨224754⟩
                                    v370_avant = v370                                                 ⟨224755⟩
                                    v370 = v370 - 1                                                   ⟨224755⟩
                                    c22.image = v396                                                  ⟨224758⟩
                                    Scene_Tick(scène=scène6)                                          ⟨224761⟩
                                    v382 = v382 + 1                                                   ⟨224763⟩
                                voix_arrête(voix=voix1)                                               ⟨224770⟩
                                v380 = 0                                                              ⟨224788⟩
                                v374 = 0                                                              ⟨224790⟩
                            sinon :
                                v8 = 86                                                               ⟨224795⟩
                                si = scène6.compteur                                                  ⟨224796⟩
                                tant que (scène6.compteur < si + ((v8·70) / 100)) et (scène6.terminée == 0) :
                                    v372 = scène6.compteur                                            ⟨224811⟩
                                    CRT_Rand()                                                        ⟨224812⟩
                                    v374 = ((CRT_Rand()·6) / 32768) + 3                               ⟨224819⟩
                                    c22.image = v374                                                  ⟨224822⟩
                                    si si + 12 == v372 :
                                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[9])  ⟨224839⟩
                                        si v15 != 0 :
                                            si canal2.+0 != 0 :
                                                AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨224848⟩
                                            v376 = word_48EC2                                         ⟨224854⟩
                                            v378 = 0                                                  ⟨224855⟩
                                            si canal3.+0 != 0 :
                                                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨224861⟩
                                                AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v376, v378)  ⟨224868⟩
                                    si (si + ((v8·70) / 100)) - 1 == v372 :
                                        v3262 = 4540                                                  ⟨224882⟩
                                        v3262 = 4552                                                  ⟨224883⟩
                                        v3262 = 4568                                                  ⟨224884⟩
                                        v3262 = 4584                                                  ⟨224885⟩
                                        v3262 = 4604                                                  ⟨224886⟩
                                        Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨224896⟩
                                        si v15 != 0 :
                                            si canal3.+0 != 0 :
                                                AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨224905⟩
                                            v380 = word_48ECE                                         ⟨224911⟩
                                            v382 = 0                                                  ⟨224912⟩
                                            si canal2.+0 != 0 :
                                                AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨224918⟩
                                                AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v380, v382)  ⟨224925⟩
                                    Scene_Tick(scène=scène6)                                          ⟨224959⟩
                                si byte_495FC != 0 :
                                    Scene_Destruct(scène=scène6, drapeaux=0)                          ⟨224990⟩
                                    aller à loc_70D3F                                                 ⟨224992⟩
                                v8_avant = si + ((v8·70) / 100)                                       ⟨224996⟩
                                v8 = 108                                                              ⟨224996⟩
                                si = scène6.compteur                                                  ⟨224997⟩
                                tant que (scène6.compteur < si + ((v8·70) / 100)) et (scène6.terminée == 0) :
                                    v372 = scène6.compteur                                            ⟨225012⟩
                                    CRT_Rand()                                                        ⟨225013⟩
                                    v374 = ((CRT_Rand()·6) / 32768) + 3                               ⟨225020⟩
                                    c22.image = v374                                                  ⟨225023⟩
                                    si si + 3 == v372 :
                                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[10])  ⟨225040⟩
                                        si v15 != 0 :
                                            si canal2.+0 != 0 :
                                                AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨225049⟩
                                            v376 = word_48EC2                                         ⟨225055⟩
                                            v378 = 0                                                  ⟨225056⟩
                                            si canal3.+0 != 0 :
                                                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨225062⟩
                                                AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v376, v378)  ⟨225069⟩
                                    si (si + ((v8·70) / 100)) - 1 == v372 :
                                        v3262 = 4540                                                  ⟨225083⟩
                                        v3262 = 4552                                                  ⟨225084⟩
                                        v3262 = 4568                                                  ⟨225085⟩
                                        v3262 = 4584                                                  ⟨225086⟩
                                        v3262 = 4604                                                  ⟨225087⟩
                                        Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨225097⟩
                                        si v15 != 0 :
                                            si canal3.+0 != 0 :
                                                AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨225106⟩
                                            v380 = word_48ECE                                         ⟨225112⟩
                                            v382 = 0                                                  ⟨225113⟩
                                            si canal2.+0 != 0 :
                                                AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨225119⟩
                                                AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v380, v382)  ⟨225126⟩
                                    Scene_Tick(scène=scène6)                                          ⟨225160⟩
                            Scene_Destruct(scène=scène6, drapeaux=0)                                  ⟨225189⟩
                            si byte_495FC == 0 :

                                ──── scène7 ────
                                scène7 = Scene_Create(cadence=9, palette=255, surface=&v508)          ⟨225203⟩
                                c23 = Layer(ressource=midgames 12, x=0, y=0)                          ⟨225210⟩
                                c24 = Layer(ressource=midgames 13, x=0, y=0)                          ⟨225218⟩
                                c25 = Layer(ressource=mid2 5, x=-15, y=0)                             ⟨225226⟩
                                c26 = Layer(ressource=midgames 16, x=0, y=-23)                        ⟨225234⟩
                                c27 = Layer(ressource=midgames 17, x=0, y=-23)                        ⟨225242⟩
                                ajoute c23 à scène7                                                   ⟨225248⟩
                                ajoute c24 à scène7                                                   ⟨225253⟩
                                ajoute c25 à scène7                                                   ⟨225258⟩
                                ajoute c26 à scène7                                                   ⟨225263⟩
                                ajoute c27 à scène7                                                   ⟨225268⟩
                                palette_copie(destination=pal1, source=pal4(midgames 10))             ⟨225281⟩
                                palette_copie(destination=pal1, source=pal3(midgames 9))              ⟨225290⟩
                                palette_envoie(palette=pal1, pas=0)                                   ⟨225298⟩
                                v560→0.méthode8(167)                                                  ⟨225304⟩
                                c26.image = 1                                                         ⟨225307⟩
                                c27.image = 1                                                         ⟨225309⟩
                                c25.image = 0                                                         ⟨225311⟩
                                si v14 != 0 :
                                    Scene_Tick(scène=scène7)                                          ⟨225320⟩
                                    charge(mid2voc 5)                                                 ⟨225332⟩
                                    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid2voc 5)  ⟨225338⟩
                                    v388 = 0                                                          ⟨225340⟩
                                    tant que v388 < 4 :
                                        CRT_Rand()                                                    ⟨225345⟩
                                        c24.image = (CRT_Rand()·2) / 32768                            ⟨225354⟩
                                        Scene_Tick(scène=scène7)                                      ⟨225357⟩
                                        v388 = v388 + 1                                               ⟨225359⟩
                                    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                   ⟨225367⟩
                                    si v15 != 0 :
                                        si canal2.+0 != 0 :
                                            AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)     ⟨225380⟩
                                        v392 = word_48EC2                                             ⟨225386⟩
                                        v394 = 0                                                      ⟨225387⟩
                                        si canal3.+0 != 0 :
                                            AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)    ⟨225393⟩
                                            AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v392, v394)  ⟨225400⟩
                                        v396 = word_48EC4                                             ⟨225406⟩
                                        v398 = 0                                                      ⟨225407⟩
                                        si canal4.+0 != 0 :
                                            AIL_start_sequence(pilote=canal4.+0→4, séquence=v3200)    ⟨225413⟩
                                            AIL_set_relative_volume_30C66(canal4.+0→4, v3200, v396, v398)  ⟨225420⟩
                                    tant que voix_en_cours(voix=voix1) != 0 :
                                        CRT_Rand()                                                    ⟨225430⟩
                                        c24.image = (CRT_Rand()·2) / 32768                            ⟨225439⟩
                                        Scene_Tick(scène=scène7)                                      ⟨225452⟩
                                    si v15 != 0 :
                                        v402 = word_48ECE                                             ⟨225467⟩
                                        v404 = 0                                                      ⟨225468⟩
                                        si canal2.+0 != 0 :
                                            AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)    ⟨225474⟩
                                            AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v402, v404)  ⟨225481⟩
                                        si canal3.+0 != 0 :
                                            AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)     ⟨225491⟩
                                        si canal4.+0 != 0 :
                                            AIL_stop_sequence(pilote=canal4.+0→4, séquence=v3200)     ⟨225501⟩
                                    v388 = 0                                                          ⟨225507⟩
                                    tant que v388 < 4 :
                                        Scene_Tick(scène=scène7)                                      ⟨225514⟩
                                        v388 = v388 + 1                                               ⟨225516⟩
                                    voix_arrête(voix=voix1)                                           ⟨225523⟩
                                    v386 = 0                                                          ⟨225541⟩
                                    v380 = 0                                                          ⟨225543⟩
                                sinon :
                                    v8 = 80                                                           ⟨225548⟩
                                    si = scène7.compteur                                              ⟨225549⟩
                                    tant que (scène7.compteur < si + ((v8·70) / 100)) et (scène7.terminée == 0) :
                                        v378 = scène7.compteur                                        ⟨225564⟩
                                        si si + 5 == v378 :
                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[11])  ⟨225581⟩
                                            si v15 != 0 :
                                                si canal2.+0 != 0 :
                                                    AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨225590⟩
                                                v380 = word_48EC2                                     ⟨225596⟩
                                                v382 = 0                                              ⟨225597⟩
                                                si canal3.+0 != 0 :
                                                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨225603⟩
                                                    AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v380, v382)  ⟨225610⟩
                                        si (si + ((v8·70) / 100)) - 1 == v378 :
                                            v3262 = 4540                                              ⟨225624⟩
                                            v3262 = 4552                                              ⟨225625⟩
                                            v3262 = 4568                                              ⟨225626⟩
                                            v3262 = 4584                                              ⟨225627⟩
                                            v3262 = 4604                                              ⟨225628⟩
                                            Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨225638⟩
                                            si v15 != 0 :
                                                si canal3.+0 != 0 :
                                                    AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨225647⟩
                                                v386 = 0                                              ⟨225654⟩
                                                si canal2.+0 != 0 :
                                                    AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨225660⟩
                                                    AIL_set_relative_volume_30C66(canal2.+0→4, v3172, word_48ECE, v386)  ⟨225667⟩
                                        si (si + ((v8·70) / 100)) - 3 > v378 :
                                            CRT_Rand()                                                ⟨225677⟩
                                            v388 = (CRT_Rand()·2) / 32768                             ⟨225683⟩
                                            c24.image = v388                                          ⟨225686⟩
                                        si (si + ((v8·70) / 100)) - 3 == v378 :
                                            c24.image = 0                                             ⟨225694⟩
                                        Scene_Tick(scène=scène7)                                      ⟨225727⟩
                                    si byte_495FC != 0 :
                                        Scene_Destruct(scène=scène7, drapeaux=0)                      ⟨225758⟩
                                        aller à loc_70D3F                                             ⟨225760⟩
                                    v8_avant = si + ((v8·70) / 100)                                   ⟨225764⟩
                                    v8 = 40                                                           ⟨225764⟩
                                    si = scène7.compteur                                              ⟨225765⟩
                                    tant que (scène7.compteur < si + ((v8·70) / 100)) et (scène7.terminée == 0) :
                                        v378 = scène7.compteur                                        ⟨225780⟩
                                        si si + 5 == v378 :
                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[12])  ⟨225797⟩
                                            si v15 != 0 :
                                                si canal2.+0 != 0 :
                                                    AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨225810⟩
                                                v380 = word_48EC2                                     ⟨225816⟩
                                                v382 = 0                                              ⟨225817⟩
                                                si canal3.+0 != 0 :
                                                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨225823⟩
                                                    AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v380, v382)  ⟨225830⟩
                                                v386 = 0                                              ⟨225837⟩
                                                si canal4.+0 != 0 :
                                                    AIL_start_sequence(pilote=canal4.+0→4, séquence=v3200)  ⟨225843⟩
                                                    AIL_set_relative_volume_30C66(canal4.+0→4, v3200, word_48EC4, v386)  ⟨225850⟩
                                        si (si + ((v8·70) / 100)) - 1 == v378 :
                                            v3262 = 4540                                              ⟨225864⟩
                                            v3262 = 4552                                              ⟨225865⟩
                                            v3262 = 4568                                              ⟨225866⟩
                                            v3262 = 4584                                              ⟨225867⟩
                                            v3262 = 4604                                              ⟨225868⟩
                                            Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨225878⟩
                                            si v15 != 0 :
                                                si canal3.+0 != 0 :
                                                    AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨225887⟩
                                                si canal4.+0 != 0 :
                                                    AIL_stop_sequence(pilote=canal4.+0→4, séquence=v3200)  ⟨225897⟩
                                                v388 = word_48ECE                                     ⟨225903⟩
                                                si canal2.+0 != 0 :
                                                    AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨225910⟩
                                                    AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v388, mid2voc 7.+0)  ⟨225917⟩
                                        si (si + ((v8·70) / 100)) - 3 > v378 :
                                            CRT_Rand()                                                ⟨225927⟩
                                            v392 = (CRT_Rand()·2) / 32768                             ⟨225933⟩
                                            c24.image = v392                                          ⟨225936⟩
                                        si (si + ((v8·70) / 100)) - 3 == v378 :
                                            c24.image = 0                                             ⟨225944⟩
                                        Scene_Tick(scène=scène7)                                      ⟨225977⟩
                                Scene_Destruct(scène=scène7, drapeaux=0)                              ⟨226006⟩
                                si byte_495FC == 0 :

                                    ──── scène8 ────
                                    scène8 = Scene_Create(cadence=20, palette=255, surface=&v508)     ⟨226020⟩
                                    c28 = OverlayImageLayer(ressource=midgames 18, x=0, y=0, image=0)  ⟨226028⟩
                                    ajoute c28 à scène8                                               ⟨226034⟩
                                    palette_copie(destination=pal1, source=pal7(midgames 11))         ⟨226047⟩
                                    palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨226056⟩
                                    palette_envoie(palette=pal1, pas=0)                               ⟨226064⟩
                                    v370 = 0                                                          ⟨226066⟩
                                    si v14 != 0 :
                                        v370 = 4                                                      ⟨226073⟩
                                        Scene_Tick(scène=scène8)                                      ⟨226076⟩
                                        charge(mid2voc 6)                                             ⟨226088⟩
                                        voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid2voc 6)  ⟨226094⟩
                                        v382 = 0                                                      ⟨226096⟩
                                        tant que v382 < 4 :
                                            CRT_Rand()                                                ⟨226101⟩
                                            c28.image = ((CRT_Rand()·6) / 32768) + 3                  ⟨226111⟩
                                            Scene_Tick(scène=scène8)                                  ⟨226114⟩
                                            v382 = v382 + 1                                           ⟨226116⟩
                                        voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)               ⟨226124⟩
                                        si v15 != 0 :
                                            si canal2.+0 != 0 :
                                                AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨226137⟩
                                            v386 = word_48EC2                                         ⟨226143⟩
                                            v388 = 0                                                  ⟨226144⟩
                                            si canal3.+0 != 0 :
                                                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨226150⟩
                                                AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v386, v388)  ⟨226157⟩
                                            v392 = 0                                                  ⟨226164⟩
                                            si canal4.+0 != 0 :
                                                AIL_start_sequence(pilote=canal4.+0→4, séquence=v3200)  ⟨226170⟩
                                                AIL_set_relative_volume_30C66(canal4.+0→4, v3200, word_48EC4, v392)  ⟨226177⟩
                                            v394 = word_48EC2 + 30                                    ⟨226184⟩
                                            si canal4.+0 != 0 :
                                                AIL_set_relative_volume_30C66(canal4.+0→4, v3200, v394, 5000)  ⟨226192⟩
                                        tant que voix_en_cours(voix=voix1) != 0 :
                                            CRT_Rand()                                                ⟨226202⟩
                                            v396 = ((CRT_Rand()·6) / 32768) + 3                       ⟨226209⟩
                                            c28.image = v396                                          ⟨226212⟩
                                            Scene_Tick(scène=scène8)                                  ⟨226241⟩
                                        si v15 != 0 :
                                            si canal3.+0 != 0 :
                                                AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨226267⟩
                                            si canal4.+0 != 0 :
                                                AIL_stop_sequence(pilote=canal4.+0→4, séquence=v3200)  ⟨226277⟩
                                            v398 = word_48EC2 + 40                                    ⟨226284⟩
                                            si canal2.+0 != 0 :
                                                AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨226291⟩
                                                AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v398, mid2voc 3.+0)  ⟨226298⟩
                                            si canal2.+0 != 0 :
                                                AIL_set_relative_volume_30C66(canal2.+0→4, v3172, 0, 1000)  ⟨226310⟩
                                        v370 = 6                                                      ⟨226316⟩
                                        v382 = 0                                                      ⟨226317⟩
                                        tant que v382 < 32 :
                                            si v370 < 1 :
                                                v370 = 1                                              ⟨226324⟩
                                            si v382 & 1 != 0 :
                                                v402 = v370                                           ⟨226330⟩
                                                v370_avant = v370                                     ⟨226331⟩
                                                v370 = v370 - 1                                       ⟨226331⟩
                                                c28.image = v402                                      ⟨226334⟩
                                            Scene_Tick(scène=scène8)                                  ⟨226339⟩
                                            v382 = v382 + 1                                           ⟨226341⟩
                                        voix_arrête(voix=voix1)                                       ⟨226348⟩
                                        v380 = 0                                                      ⟨226366⟩
                                        v374 = 0                                                      ⟨226368⟩
                                    sinon :
                                        v560→0.méthode8(167)                                          ⟨226377⟩
                                        v8 = 80                                                       ⟨226379⟩
                                        si = scène8.compteur                                          ⟨226380⟩
                                        tant que (scène8.compteur < si + ((v8·70) / 100)) et (scène8.terminée == 0) :
                                            v372 = scène8.compteur                                    ⟨226395⟩
                                            si si + 7 > v372 :
                                                v374 = v370                                           ⟨226401⟩
                                                v370_avant = v370                                     ⟨226402⟩
                                                v370 = v370 + 1                                       ⟨226402⟩
                                                c28.image = v374                                      ⟨226405⟩
                                            si si + 8 == v372 :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[13])  ⟨226424⟩
                                                si v15 != 0 :
                                                    si canal2.+0 != 0 :
                                                        AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨226437⟩
                                                    v376 = word_48EC2                                 ⟨226443⟩
                                                    v378 = 0                                          ⟨226444⟩
                                                    si canal3.+0 != 0 :
                                                        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨226450⟩
                                                        AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v376, v378)  ⟨226457⟩
                                                    v380 = word_48EC4 + 10                            ⟨226464⟩
                                                    v382 = 0                                          ⟨226465⟩
                                                    si canal4.+0 != 0 :
                                                        AIL_start_sequence(pilote=canal4.+0→4, séquence=v3200)  ⟨226471⟩
                                                        AIL_set_relative_volume_30C66(canal4.+0→4, v3200, v380, v382)  ⟨226478⟩
                                            si si + 1 < v372 :
                                                si (si + ((v8·70) / 100)) - 10 > v372 :
                                                    CRT_Rand()                                        ⟨226492⟩
                                                    c28.image = ((CRT_Rand()·6) / 32768) + 3          ⟨226502⟩
                                            si (si + ((v8·70) / 100)) - 10 <= v372 :
                                                si v370 < 1 :
                                                    v370 = 1                                          ⟨226512⟩
                                                v386 = v370                                           ⟨226516⟩
                                                v370_avant = v370                                     ⟨226517⟩
                                                v370 = v370 - 1                                       ⟨226517⟩
                                                c28.image = v386                                      ⟨226520⟩
                                            si (si + ((v8·70) / 100)) - 1 == v372 :
                                                v3262 = 4540                                          ⟨226531⟩
                                                v3262 = 4552                                          ⟨226532⟩
                                                v3262 = 4568                                          ⟨226533⟩
                                                v3262 = 4584                                          ⟨226534⟩
                                                v3262 = 4604                                          ⟨226535⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨226545⟩
                                                si v15 != 0 :
                                                    si canal3.+0 != 0 :
                                                        AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨226554⟩
                                                    si canal4.+0 != 0 :
                                                        AIL_stop_sequence(pilote=canal4.+0→4, séquence=v3200)  ⟨226564⟩
                                                    v388 = word_48ECE                                 ⟨226570⟩
                                                    si canal2.+0 != 0 :
                                                        AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨226577⟩
                                                        AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v388, mid2voc 7.+0)  ⟨226584⟩
                                            Scene_Tick(scène=scène8)                                  ⟨226618⟩
                                        si byte_495FC != 0 :
                                            Scene_Destruct(scène=scène8, drapeaux=0)                  ⟨226649⟩
                                            aller à loc_70D3F                                         ⟨226651⟩
                                        v370 = 0                                                      ⟨226655⟩
                                        v8_avant = si + ((v8·70) / 100)                               ⟨226656⟩
                                        v8 = 92                                                       ⟨226656⟩
                                        si = scène8.compteur                                          ⟨226657⟩
                                        tant que (scène8.compteur < si + ((v8·70) / 100)) et (scène8.terminée == 0) :
                                            v372 = scène8.compteur                                    ⟨226672⟩
                                            si si + 7 > v372 :
                                                v374 = v370                                           ⟨226678⟩
                                                v370_avant = v370                                     ⟨226679⟩
                                                v370 = v370 + 1                                       ⟨226679⟩
                                                c28.image = v374                                      ⟨226682⟩
                                            si si + 5 == v372 :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[14])  ⟨226701⟩
                                                si v15 != 0 :
                                                    si canal2.+0 != 0 :
                                                        AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨226714⟩
                                                    v376 = word_48EC2                                 ⟨226720⟩
                                                    v378 = 0                                          ⟨226721⟩
                                                    si canal3.+0 != 0 :
                                                        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨226727⟩
                                                        AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v376, v378)  ⟨226734⟩
                                                    v380 = word_48EC4 + 20                            ⟨226741⟩
                                                    v382 = 0                                          ⟨226742⟩
                                                    si canal4.+0 != 0 :
                                                        AIL_start_sequence(pilote=canal4.+0→4, séquence=v3200)  ⟨226748⟩
                                                        AIL_set_relative_volume_30C66(canal4.+0→4, v3200, v380, v382)  ⟨226755⟩
                                            si si + 1 < v372 :
                                                si (si + ((v8·70) / 100)) - 10 > v372 :
                                                    CRT_Rand()                                        ⟨226769⟩
                                                    c28.image = ((CRT_Rand()·6) / 32768) + 3          ⟨226779⟩
                                            si (si + ((v8·70) / 100)) - 10 <= v372 :
                                                si v370 < 1 :
                                                    v370 = 1                                          ⟨226789⟩
                                                v386 = v370                                           ⟨226793⟩
                                                v370_avant = v370                                     ⟨226794⟩
                                                v370 = v370 - 1                                       ⟨226794⟩
                                                c28.image = v386                                      ⟨226797⟩
                                            si (si + ((v8·70) / 100)) - 1 == v372 :
                                                v3262 = 4540                                          ⟨226808⟩
                                                v3262 = 4552                                          ⟨226809⟩
                                                v3262 = 4568                                          ⟨226810⟩
                                                v3262 = 4584                                          ⟨226811⟩
                                                v3262 = 4604                                          ⟨226812⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨226822⟩
                                                si v15 != 0 :
                                                    si canal3.+0 != 0 :
                                                        AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨226831⟩
                                                    si canal4.+0 != 0 :
                                                        AIL_stop_sequence(pilote=canal4.+0→4, séquence=v3200)  ⟨226841⟩
                                                    v388 = word_48ECE                                 ⟨226847⟩
                                                    si canal2.+0 != 0 :
                                                        AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨226854⟩
                                                        AIL_set_relative_volume_30C66(canal2.+0→4, v3172, v388, mid2voc 7.+0)  ⟨226861⟩
                                            Scene_Tick(scène=scène8)                                  ⟨226895⟩
                                        si byte_495FC != 0 :
                                            Scene_Destruct(scène=scène8, drapeaux=0)                  ⟨226926⟩
                                            aller à loc_70D3F                                         ⟨226928⟩
                                        v370 = 0                                                      ⟨226932⟩
                                        v8_avant = si + ((v8·70) / 100)                               ⟨226933⟩
                                        v8 = 110                                                      ⟨226933⟩
                                        si = scène8.compteur                                          ⟨226934⟩
                                        tant que (scène8.compteur < si + ((v8·70) / 100)) et (scène8.terminée == 0) :
                                            v372 = scène8.compteur                                    ⟨226949⟩
                                            si si + 7 > v372 :
                                                v374 = v370                                           ⟨226955⟩
                                                v370_avant = v370                                     ⟨226956⟩
                                                v370 = v370 + 1                                       ⟨226956⟩
                                                c28.image = v374                                      ⟨226959⟩
                                            si si + 13 == v372 :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[15])  ⟨226978⟩
                                                si v15 != 0 :
                                                    si canal2.+0 != 0 :
                                                        AIL_stop_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨226991⟩
                                                    v376 = word_48EC2                                 ⟨226997⟩
                                                    v378 = 0                                          ⟨226998⟩
                                                    si canal3.+0 != 0 :
                                                        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨227004⟩
                                                        AIL_set_relative_volume_30C66(canal3.+0→4, v3186, v376, v378)  ⟨227011⟩
                                                    v380 = word_48EC4 + 30                            ⟨227018⟩
                                                    v382 = 0                                          ⟨227019⟩
                                                    si canal4.+0 != 0 :
                                                        AIL_start_sequence(pilote=canal4.+0→4, séquence=v3200)  ⟨227025⟩
                                                        AIL_set_relative_volume_30C66(canal4.+0→4, v3200, v380, v382)  ⟨227032⟩
                                            si si + 1 < v372 :
                                                si (si + ((v8·70) / 100)) - 36 > v372 :
                                                    CRT_Rand()                                        ⟨227046⟩
                                                    c28.image = ((CRT_Rand()·6) / 32768) + 3          ⟨227056⟩
                                            si (si + ((v8·70) / 100)) - 36 < v372 :
                                                si (si + ((v8·70) / 100)) - 16 > v372 :
                                                    CRT_Rand()                                        ⟨227068⟩
                                                    v386 = ((CRT_Rand()·2) / 32768) + 7               ⟨227075⟩
                                                    c28.image = v386                                  ⟨227078⟩
                                            si (si + ((v8·70) / 100)) - 16 <= v372 :
                                                si v370 < 1 :
                                                    v370 = 1                                          ⟨227088⟩
                                                v388 = v370                                           ⟨227092⟩
                                                v370_avant = v370                                     ⟨227093⟩
                                                v370 = v370 - 1                                       ⟨227093⟩
                                                c28.image = v388                                      ⟨227096⟩
                                            si (si + ((v8·70) / 100)) - 5 == v372 :
                                                v3262 = 4540                                          ⟨227107⟩
                                                v3262 = 4552                                          ⟨227108⟩
                                                v3262 = 4568                                          ⟨227109⟩
                                                v3262 = 4584                                          ⟨227110⟩
                                                v3262 = 4604                                          ⟨227111⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v3262, v555, v553, v551, v549, 0, &v578)  ⟨227121⟩
                                                si v15 != 0 :
                                                    si canal3.+0 != 0 :
                                                        AIL_stop_sequence(pilote=canal3.+0→4, séquence=v3186)  ⟨227134⟩
                                                    si canal4.+0 != 0 :
                                                        AIL_stop_sequence(pilote=canal4.+0→4, séquence=v3200)  ⟨227144⟩
                                                    v392 = 0                                          ⟨227152⟩
                                                    si canal2.+0 != 0 :
                                                        AIL_start_sequence(pilote=canal2.+0→4, séquence=v3172)  ⟨227158⟩
                                                        AIL_set_relative_volume_30C66(canal2.+0→4, v3172, word_48EC2 + 40, v392)  ⟨227165⟩
                                                    si canal2.+0 != 0 :
                                                        AIL_set_relative_volume_30C66(canal2.+0→4, v3172, 0, 1000)  ⟨227177⟩
                                            Scene_Tick(scène=scène8)                                  ⟨227211⟩
                                    Scene_Destruct(scène=scène8, drapeaux=0)                          ⟨227240⟩
                                    si byte_495FC == 0 :

                                        ──── scène9 ────
                                        scène9 = Scene_Create(cadence=6, palette=255, surface=&v508)  ⟨227254⟩
                                        c29 = Layer(ressource=midgames 12, x=0, y=0)                  ⟨227261⟩
                                        c30 = Layer(ressource=mid2 5, x=-15, y=0)                     ⟨227269⟩
                                        c31 = Layer(ressource=midgames 16, x=0, y=-23)                ⟨227277⟩
                                        c32 = Layer(ressource=midgames 17, x=0, y=-23)                ⟨227285⟩
                                        ajoute c29 à scène9                                           ⟨227291⟩
                                        ajoute c30 à scène9                                           ⟨227296⟩
                                        ajoute c31 à scène9                                           ⟨227301⟩
                                        ajoute c32 à scène9                                           ⟨227306⟩
                                        palette_copie(destination=pal1, source=pal4(midgames 10))     ⟨227319⟩
                                        palette_copie(destination=pal1, source=pal3(midgames 9))      ⟨227328⟩
                                        palette_envoie(palette=pal1, pas=0)                           ⟨227336⟩
                                        c31.image = 1                                                 ⟨227339⟩
                                        c32.image = 1                                                 ⟨227341⟩
                                        tant que (scène9.compteur < 4) et (scène9.terminée == 0) :
                                            Scene_Tick(scène=scène9)                                  ⟨227348⟩
                                        v376 = 0                                                      ⟨227369⟩
                                        tant que (scène9.compteur < 11) et (scène9.terminée == 0) :
                                            si v376 < 2 :
                                                v378 = v376 + 2                                       ⟨227378⟩
                                                c32.image = v378                                      ⟨227381⟩
                                            v376 = v376 + 1                                           ⟨227384⟩
                                            Scene_Tick(scène=scène9)                                  ⟨227387⟩
                                        v376 = 0                                                      ⟨227408⟩
                                        tant que (scène9.compteur < 20) et (scène9.terminée == 0) :
                                            si v376 > 6 :
                                                v376 = 6                                              ⟨227415⟩
                                            si v376 == 5 :
                                                v380 = word_48EF4                                     ⟨227421⟩
                                                v382 = 0                                              ⟨227422⟩
                                                si canal5.+0 != 0 :
                                                    AIL_start_sequence(pilote=canal5.+0→4, séquence=v3214)  ⟨227428⟩
                                                    AIL_set_relative_volume_30C66(canal5.+0→4, v3214, v380, v382)  ⟨227435⟩
                                            v376_avant = v376                                         ⟨227443⟩
                                            v376_avant = v376                                         ⟨227443⟩
                                            v376 = v376 + 1                                           ⟨227443⟩
                                            c30.image = v376_avant                                    ⟨227446⟩
                                            si v376 == 10 :
                                                si v13 != 0 :
                                                    si canal1.+0 != 0 :
                                                        AIL_set_relative_volume_30C66(canal1.+0→4, v1072, 0, 2000)  ⟨227458⟩
                                            Scene_Tick(scène=scène9)                                  ⟨227466⟩
                                        Scene_Destruct(scène=scène9, drapeaux=0)                      ⟨227494⟩
                                        fondu_disparition(palette=pal1, couleur=&v32, pas=2, premier=0, nombre=256)  ⟨227503⟩
loc_70D3F:                                                                                            ⟨227506⟩
canal_arrête(canal=canal5)                                                                            ⟨227510⟩
v3212 = 0                                                                                             ⟨227528⟩
v3207 = 0                                                                                             ⟨227529⟩
v3206 = 0                                                                                             ⟨227530⟩
canal_arrête(canal=canal4)                                                                            ⟨227533⟩
v3198 = 0                                                                                             ⟨227551⟩
v3193 = 0                                                                                             ⟨227552⟩
v3192 = 0                                                                                             ⟨227553⟩
canal_arrête(canal=canal3)                                                                            ⟨227556⟩
v3184 = 0                                                                                             ⟨227574⟩
v3179 = 0                                                                                             ⟨227575⟩
v3178 = 0                                                                                             ⟨227576⟩
canal_arrête(canal=canal2)                                                                            ⟨227579⟩
v3170 = 0                                                                                             ⟨227597⟩
v3165 = 0                                                                                             ⟨227598⟩
v3164 = 0                                                                                             ⟨227599⟩
v357 = 0                                                                                              ⟨227617⟩
v356 = 0                                                                                              ⟨227618⟩
v347 = 0                                                                                              ⟨227636⟩
v346 = 0                                                                                              ⟨227637⟩
v337 = 0                                                                                              ⟨227655⟩
v336 = 0                                                                                              ⟨227656⟩
v327 = 0                                                                                              ⟨227674⟩
v326 = 0                                                                                              ⟨227675⟩
v311 = 0                                                                                              ⟨227698⟩
v310 = 0                                                                                              ⟨227699⟩
v295 = 0                                                                                              ⟨227722⟩
v294 = 0                                                                                              ⟨227723⟩
v279 = 0                                                                                              ⟨227746⟩
v278 = 0                                                                                              ⟨227747⟩
v263 = 0                                                                                              ⟨227770⟩
v262 = 0                                                                                              ⟨227771⟩
v247 = 0                                                                                              ⟨227794⟩
v246 = 0                                                                                              ⟨227795⟩
v231 = 0                                                                                              ⟨227818⟩
v230 = 0                                                                                              ⟨227819⟩
v219 = 0                                                                                              ⟨227837⟩
v218 = 0                                                                                              ⟨227838⟩
v209 = 0                                                                                              ⟨227856⟩
v208 = 0                                                                                              ⟨227857⟩
v199 = 0                                                                                              ⟨227875⟩
v198 = 0                                                                                              ⟨227876⟩
v189 = 0                                                                                              ⟨227894⟩
v188 = 0                                                                                              ⟨227895⟩
v179 = 0                                                                                              ⟨227913⟩
v178 = 0                                                                                              ⟨227914⟩
v169 = 0                                                                                              ⟨227932⟩
v168 = 0                                                                                              ⟨227933⟩
v159 = 0                                                                                              ⟨227951⟩
v158 = 0                                                                                              ⟨227952⟩
v149 = 0                                                                                              ⟨227970⟩
v148 = 0                                                                                              ⟨227971⟩
v139 = 0                                                                                              ⟨227989⟩
v138 = 0                                                                                              ⟨227990⟩
v129 = 0                                                                                              ⟨228008⟩
v128 = 0                                                                                              ⟨228009⟩
v119 = 0                                                                                              ⟨228027⟩
v118 = 0                                                                                              ⟨228028⟩
v109 = 0                                                                                              ⟨228046⟩
v108 = 0                                                                                              ⟨228047⟩
v99 = 0                                                                                               ⟨228065⟩
v98 = 0                                                                                               ⟨228066⟩
v89 = 0                                                                                               ⟨228084⟩
v88 = 0                                                                                               ⟨228085⟩
v79 = 0                                                                                               ⟨228103⟩
v78 = 0                                                                                               ⟨228104⟩
voix_arrête(voix=voix1)                                                                               ⟨228108⟩
v3144 = 0                                                                                             ⟨228126⟩
v3139 = 0                                                                                             ⟨228127⟩
v3138 = 0                                                                                             ⟨228128⟩
canal_arrête(canal=canal1)                                                                            ⟨228131⟩
v1070 = 0                                                                                             ⟨228149⟩
v1065 = 0                                                                                             ⟨228150⟩
v1064 = 0                                                                                             ⟨228151⟩
v67 = 0                                                                                               ⟨228174⟩
v66 = 0                                                                                               ⟨228175⟩
v42 = 0                                                                                               ⟨228216⟩
v37 = 0                                                                                               ⟨228217⟩
v36 = 0                                                                                               ⟨228218⟩
retour                                                                                                ⟨228245⟩
```

## Tableaux du segment de données

