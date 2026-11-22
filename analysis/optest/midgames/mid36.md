# Script extrait de `loc_B6FF0` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## loc_B6FF0

```
bp = sp                                                                                               ⟨328576⟩
tableau_textes(tableau=textes1, nombre=12, longueur=200)                                              ⟨328585⟩
byte_495FC = 0                                                                                        ⟨328587⟩
v7 = 0                                                                                                ⟨328588⟩
v8 = 0                                                                                                ⟨328589⟩
v9 = 0                                                                                                ⟨328590⟩
si word_4684B != 0 :
    v8 = 1                                                                                            ⟨328593⟩
v12 = word_46F46                                                                                      ⟨328597⟩
v534 = 0                                                                                              ⟨328598⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v534, v12)                                                      ⟨328603⟩
v548 = 0                                                                                              ⟨328605⟩
TextRenderer_ApplyFormatChange_2EA21(&v548, 0)                                                        ⟨328614⟩
SmallObject_RegisterInList_2CB40(&v16, &v548)                                                         ⟨328620⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨328626⟩
v26 = 0                                                                                               ⟨328632⟩
si v8 != 0 :
    si sub_6734(chemin1) != 0 :
        pak mid36voc.ouvre(chemin1, 1)                                                                ⟨328698⟩
    sinon :
        v8 = 0                                                                                        ⟨328704⟩
sinon :
    v8 = 0                                                                                            ⟨328704⟩
v36 = 0                                                                                               ⟨328707⟩
v31 = 0                                                                                               ⟨328709⟩
v30 = 0                                                                                               ⟨328710⟩
v38 = byte_46848                                                                                      ⟨328712⟩
si v38 != 1 :
    si v38 == 2 : aller à loc_B7330                                                                   ⟨328722⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨328758⟩
        flux_iff(flux=flux1)                                                                          ⟨328772⟩
        v3257 = 256                                                                                   ⟨328775⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨328784⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨328790⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨328796⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨328800⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨328802⟩
        v314 = 1                                                                                      ⟨328803⟩
        tant que v314 <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨328810⟩
            ds:24192[v314·2] = iff_lit_mot(flux=flux1)                                                ⟨328814⟩
            v314_avant = v314·2                                                                       ⟨328815⟩
            v314 = v314 + 1                                                                           ⟨328815⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨328822⟩
        v9 = 1                                                                                        ⟨328824⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨328828⟩
    si sub_6734(chemin1) != 0 :
        v7 = 1                                                                                        ⟨328854⟩
        si v9 == 0 :
            word_48F76 = 90                                                                           ⟨328859⟩
    aller à loc_B74A5                                                                                 ⟨328862⟩
    loc_B7330:                                                                                        ⟨328865⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨328893⟩
        flux_iff(flux=flux1)                                                                          ⟨328907⟩
        v3257 = 256                                                                                   ⟨328910⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨328919⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨328925⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨328931⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨328935⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨328937⟩
        v314 = 1                                                                                      ⟨328938⟩
        tant que v314 <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨328945⟩
            ds:24192[v314·2] = iff_lit_mot(flux=flux1)                                                ⟨328949⟩
            v314_avant = v314·2                                                                       ⟨328950⟩
            v314 = v314 + 1                                                                           ⟨328950⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨328957⟩
        v9 = 1                                                                                        ⟨328959⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨328963⟩
    si sub_6734(chemin1) != 0 :
        v7 = 1                                                                                        ⟨328989⟩
        si v9 == 0 :
            word_48F76 = 255                                                                          ⟨328994⟩
loc_B74A5:                                                                                            ⟨328999⟩
v46 = word_457D6                                                                                      ⟨329002⟩
v44 = word_457D8                                                                                      ⟨329004⟩
v42 = word_457DA                                                                                      ⟨329006⟩
v40 = byte_457DC                                                                                      ⟨329008⟩
si v9 != 0 :
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨329024⟩
    v314 = 0                                                                                          ⟨329026⟩
    tant que v314 < 7 :
        charge(asoundfx (v314 + &v46)→0)                                                              ⟨329046⟩
        canal_enregistre(canal=canal1, ressource=asoundfx (v314 + &v46)→0, x=0)                       ⟨329053⟩
        canal_arrête(canal=canal1)                                                                    ⟨329057⟩
        v314 = v314 + 1                                                                               ⟨329077⟩
    canal_arrête(canal=canal1)                                                                        ⟨329088⟩
v1038 = 0                                                                                             ⟨329110⟩
v1033 = 0                                                                                             ⟨329112⟩
v1032 = 0                                                                                             ⟨329113⟩
v1042 = 0                                                                                             ⟨329114⟩
si v7 != 0 :
    si v8 != 0 :
        v313 = 22                                                                                     ⟨329127⟩
    sinon :
        v313 = 21                                                                                     ⟨329132⟩
    charge(amusic v313)                                                                               ⟨329143⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨329148⟩
    canal_enregistre(canal=canal2, ressource=amusic v313, x=0)                                        ⟨329155⟩
v1051 = booléen                                                                                       ⟨329172⟩
v1047 = booléen                                                                                       ⟨329173⟩
si v8 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨329179⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨329197⟩
    v3257 = 256                                                                                       ⟨329200⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨329209⟩
    iff_form(flux=flux1, balise='MG36', x=0)                                                          ⟨329215⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨329221⟩
    v314 = 0                                                                                          ⟨329223⟩
    tant que v314 < 12 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨329232⟩
        v316 = v3240                                                                                  ⟨329235⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·v314), taille=v316)                  ⟨329246⟩
        v3253 = v3236                                                                                 ⟨329249⟩
        v314 = v314 + 1                                                                               ⟨329250⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨329257⟩
    si CRT_Strlen(arg_8) != 0 :
        CRT_Strcat(textes1[2], arg_8)                                                                 ⟨329270⟩
        CRT_Strcat(textes1[2], textes1[4])                                                            ⟨329282⟩
    sinon :
        si CRT_Strlen(arg_6) != 0 :
            CRT_Strcat(textes1[2], arg_6)                                                             ⟨329299⟩
            CRT_Strcat(textes1[2], textes1[4])                                                        ⟨329311⟩
        sinon :
            si CRT_Strlen(arg_10) != 0 :
                CRT_Strcat(textes1[2], arg_10)                                                        ⟨329328⟩
                CRT_Strcat(textes1[2], textes1[4])                                                    ⟨329340⟩
            sinon :
                CRT_Strcat(textes1[2], textes1[3])                                                    ⟨329357⟩
                CRT_Strcat(textes1[2], textes1[4])                                                    ⟨329369⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[10], arg_6)                                                                ⟨329385⟩
        CRT_Strcat(textes1[10], textes1[11])                                                          ⟨329399⟩
    sinon :
        si CRT_Strlen(arg_10) != 0 :
            CRT_Strcat(textes1[10], arg_10)                                                           ⟨329417⟩
            CRT_Strcat(textes1[10], textes1[11])                                                      ⟨329431⟩
        sinon :
            si CRT_Strlen(arg_8) != 0 :
                CRT_Strcat(textes1[10], arg_8)                                                        ⟨329449⟩
                CRT_Strcat(textes1[10], textes1[11])                                                  ⟨329463⟩
            sinon :
                CRT_Strcat(textes1[10], textes1[3])                                                   ⟨329481⟩
                CRT_Strcat(textes1[10], textes1[11])                                                  ⟨329495⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨329502⟩
charge(midgames 42)                                                                                   ⟨329521⟩
charge(midgames 44)                                                                                   ⟨329533⟩
charge(mid36 18)                                                                                      ⟨329545⟩
charge(mid36 0)                                                                                       ⟨329557⟩
charge(mid36 3)                                                                                       ⟨329569⟩
charge(midgames 43)                                                                                   ⟨329581⟩
palette_depuis(pal2(midgames 43))                                                                     ⟨329588⟩
charge(midgames 45)                                                                                   ⟨329600⟩
palette_depuis(pal3(midgames 45))                                                                     ⟨329607⟩
charge(mid36 36)                                                                                      ⟨329619⟩
palette_depuis(pal4(mid36 36))                                                                        ⟨329626⟩
charge(mid36 37)                                                                                      ⟨329638⟩
palette_depuis(pal5(mid36 37))                                                                        ⟨329645⟩
charge(mid36 30)                                                                                      ⟨329657⟩
palette_depuis(pal6(mid36 30))                                                                        ⟨329664⟩
charge(midgames 47)                                                                                   ⟨329676⟩
palette_depuis(pal7(midgames 47))                                                                     ⟨329683⟩
charge_convdata_type2("normal")                                                                       ⟨329693⟩
palette_depuis(pal8(convdata type 2 "normal"))                                                        ⟨329700⟩
charge_convdata_type0("tex", drapeau=3)                                                               ⟨329710⟩
charge_convdata_type0("billy", drapeau=3)                                                             ⟨329720⟩
charge_convdata_type0("miguel", drapeau=3)                                                            ⟨329730⟩
charge_convdata_type0("lyle", drapeau=3)                                                              ⟨329740⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨329750⟩
charge_convdata_type0("virgil", drapeau=3)                                                            ⟨329760⟩
charge_convdata_type0("gwen", drapeau=3)                                                              ⟨329770⟩
v288 = 0                                                                                              ⟨329772⟩
v284 = 2                                                                                              ⟨329773⟩
v283 = 0                                                                                              ⟨329774⟩
v282 = 0                                                                                              ⟨329775⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨329789⟩
v290 = ?                                                                                              ⟨329791⟩
v292 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                ⟨329792⟩
v288 = v292                                                                                           ⟨329794⟩
v284 = 2                                                                                              ⟨329795⟩
v283 = 1                                                                                              ⟨329796⟩
v282 = 0                                                                                              ⟨329797⟩
GlyphObject_ConstructWithBuffer_311CF(&v3152, &v288)                                                  ⟨329802⟩
v302 = word_46F46                                                                                     ⟨329809⟩
zone_texte(zone=zone1, police=&v3152)                                                                 ⟨329815⟩
v304 = 152                                                                                            ⟨329819⟩
v306 = 319                                                                                            ⟨329821⟩
v308 = 199                                                                                            ⟨329823⟩
v3161 = 0                                                                                             ⟨329825⟩
v3159 = v304                                                                                          ⟨329827⟩
v3157 = v306                                                                                          ⟨329829⟩
v3155 = v308                                                                                          ⟨329831⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨329835⟩
Widget_Method_Dispatch8_314A9(zone1, 200)                                                             ⟨329840⟩
si byte_495FC == 0 :
    si v7 != 0 :
        v310 = word_48F76                                                                             ⟨329851⟩
        si canal2.+0 != 0 :
            AIL_start_sequence(pilote=canal2.+0→4, séquence=v1040)                                    ⟨329858⟩
            AIL_set_relative_volume_30C66(canal2.+0→4, v1040, v310, 0)                                ⟨329865⟩
    v3198 = -1                                                                                        ⟨329879⟩
    si v9 != 0 :
        charge(asoundfx 62)                                                                           ⟨329892⟩
        canal_init(canal=canal1, pilote=word_46849)                                                   ⟨329897⟩
        canal_enregistre(canal=canal1, ressource=asoundfx 62, x=0)                                    ⟨329904⟩
        v326 = 0                                                                                      ⟨329908⟩
        si canal1.+0 != 0 :
            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3198)                                    ⟨329914⟩
            AIL_set_relative_volume_30C66(canal1.+0→4, v3198, word_48F1E, v326)                       ⟨329921⟩
    charge(mid36 4)                                                                                   ⟨329936⟩
    charge(mid36 5)                                                                                   ⟨329948⟩
    charge(mid36 32)                                                                                  ⟨329960⟩
    palette_depuis(pal9(mid36 32))                                                                    ⟨329967⟩

    ──── scène1 ────
    scène1 = Scene_Create(cadence=15, palette=255, surface=&v534)                                     ⟨329975⟩
    c1 = Layer(ressource=midgames 42, x=0, y=-80)                                                     ⟨329982⟩
    c2 = Layer(ressource=mid36 5, x=0, y=0)                                                           ⟨329990⟩
    c3 = Layer(ressource=mid36 4, x=0, y=0)                                                           ⟨329998⟩
    c4 = TextLayer(zone=zone1, x=160, y=160)                                                          ⟨330006⟩
    palette_copie(destination=pal1, source=pal9(mid36 32))                                            ⟨330016⟩
    ajoute c1 à scène1                                                                                ⟨330021⟩
    ajoute c3 à scène1                                                                                ⟨330026⟩
    ajoute c2 à scène1                                                                                ⟨330032⟩
    ajoute c4 à scène1                                                                                ⟨330037⟩
    palette_envoie(palette=pal1, pas=0)                                                               ⟨330049⟩
    v372 = 0                                                                                          ⟨330051⟩
    tant que (scène1.compteur < 31) et (scène1.terminée == 0) :
        v374 = v372                                                                                   ⟨330057⟩
        v372_avant = v372                                                                             ⟨330058⟩
        v372 = v372 + 1                                                                               ⟨330058⟩
        c2.image = v374                                                                               ⟨330061⟩
        Scene_Tick(scène=scène1)                                                                      ⟨330073⟩
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨330099⟩
    canal_arrête(canal=canal1)                                                                        ⟨330162⟩
    si byte_495FC == 0 :
        charge(mid36 11)                                                                              ⟨330216⟩
        charge(mid36 12)                                                                              ⟨330228⟩
        charge(mid36 14)                                                                              ⟨330240⟩
        charge(mid36 13)                                                                              ⟨330252⟩
        charge(mid36 15)                                                                              ⟨330264⟩
        charge(mid36 16)                                                                              ⟨330276⟩
        charge(mid36 35)                                                                              ⟨330288⟩
        palette_depuis(pal10(mid36 35))                                                               ⟨330295⟩
        charge(mid36 34)                                                                              ⟨330307⟩
        palette_depuis(pal11(mid36 34))                                                               ⟨330314⟩

        ──── scène2 ────
        scène2 = Scene_Create(cadence=6, palette=255, surface=&v534)                                  ⟨330322⟩
        c5 = Layer(ressource=mid36 16, x=0, y=0)                                                      ⟨330329⟩
        c6 = Layer(ressource=mid36 15, x=0, y=0)                                                      ⟨330337⟩
        c7 = Layer(ressource=mid36 11, x=0, y=0)                                                      ⟨330345⟩
        c8 = Layer(ressource=mid36 12, x=0, y=0)                                                      ⟨330353⟩
        c9 = Layer(ressource=mid36 14, x=0, y=0)                                                      ⟨330361⟩
        c10 = Layer(ressource=mid36 13, x=0, y=0)                                                     ⟨330369⟩
        palette_copie(destination=pal1, source=pal10(mid36 35))                                       ⟨330379⟩
        palette_copie(destination=pal1, source=pal11(mid36 34))                                       ⟨330388⟩
        ajoute c5 à scène2                                                                            ⟨330393⟩
        ajoute c6 à scène2                                                                            ⟨330398⟩
        ajoute c7 à scène2                                                                            ⟨330403⟩
        ajoute c8 à scène2                                                                            ⟨330408⟩
        ajoute c9 à scène2                                                                            ⟨330413⟩
        ajoute c10 à scène2                                                                           ⟨330418⟩
        palette_envoie(palette=pal1, pas=0)                                                           ⟨330430⟩
        v418 = 0                                                                                      ⟨330432⟩
        tant que (scène2.compteur < 12) et (scène2.terminée == 0) :
            v420 = scène2.compteur                                                                    ⟨330438⟩
            si v420 == 8 :
                c8.image = 1                                                                          ⟨330442⟩
            si v420 == 9 :
                c10.image = 1                                                                         ⟨330448⟩
            si v420 == 10 :
                c10.image = 2                                                                         ⟨330454⟩
            si v420 < 7 :
                v422 = v418                                                                           ⟨330460⟩
                v418_avant = v418                                                                     ⟨330461⟩
                v418 = v418 + 1                                                                       ⟨330461⟩
                c9.image = v422                                                                       ⟨330464⟩
                si v418 > 1 :
                    v418 = 0                                                                          ⟨330467⟩
            Scene_Tick(scène=scène2)                                                                  ⟨330481⟩
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨330509⟩
        si byte_495FC == 0 :
            si v9 != 0 :
                charge(asoundfx 62)                                                                   ⟨330693⟩
                canal_init(canal=canal1, pilote=word_46849)                                           ⟨330698⟩
                canal_enregistre(canal=canal1, ressource=asoundfx 62, x=0)                            ⟨330705⟩
                v326 = 0                                                                              ⟨330709⟩
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3198)                            ⟨330715⟩
                    AIL_set_relative_volume_30C66(canal1.+0→4, v3198, word_48F1E, v326)               ⟨330722⟩
            charge(mid36 7)                                                                           ⟨330737⟩
            charge(mid36 6)                                                                           ⟨330749⟩
            charge(mid36 33)                                                                          ⟨330761⟩
            palette_depuis(pal12(mid36 33))                                                           ⟨330768⟩

            ──── scène3 ────
            scène3 = Scene_Create(cadence=15, palette=255, surface=&v534)                             ⟨330776⟩
            c11 = Layer(ressource=mid36 7, x=0, y=0)                                                  ⟨330783⟩
            c12 = Layer(ressource=mid36 6, x=0, y=0)                                                  ⟨330791⟩
            palette_copie(destination=pal1, source=pal12(mid36 33))                                   ⟨330801⟩
            ajoute c11 à scène3                                                                       ⟨330806⟩
            ajoute c12 à scène3                                                                       ⟨330811⟩
            palette_envoie(palette=pal1, pas=0)                                                       ⟨330823⟩
            v368 = 8                                                                                  ⟨330825⟩
            tant que (scène3.compteur < 35) et (scène3.terminée == 0) :
                v370 = v368                                                                           ⟨330831⟩
                v368_avant = v368                                                                     ⟨330832⟩
                v368 = v368 + 1                                                                       ⟨330832⟩
                c12.image = v370                                                                      ⟨330835⟩
                si v368 == 41 :
                    retire(parent=scène3, calque=c12)                                                 ⟨330841⟩
                    c12.détruit(3)                                                                    ⟨330849⟩
                Scene_Tick(scène=scène3)                                                              ⟨330865⟩
            Scene_Destruct(scène=scène3, drapeaux=0)                                                  ⟨330891⟩
            canal_arrête(canal=canal1)                                                                ⟨330954⟩
            si byte_495FC == 0 :
                v3198 = -1                                                                            ⟨331007⟩
                si v9 != 0 :
                    charge(asoundfx 7)                                                                ⟨331020⟩
                    canal_init(canal=canal1, pilote=word_46849)                                       ⟨331025⟩
                    canal_enregistre(canal=canal1, ressource=asoundfx 7, x=0)                         ⟨331032⟩
                    v326 = 0                                                                          ⟨331036⟩
                    si canal1.+0 != 0 :
                        AIL_start_sequence(pilote=canal1.+0→4, séquence=v3198)                        ⟨331042⟩
                        AIL_set_relative_volume_30C66(canal1.+0→4, v3198, word_48EB0, v326)           ⟨331049⟩
                charge(mid36 2)                                                                       ⟨331064⟩
                charge(midgames 50)                                                                   ⟨331076⟩
                charge(mid36 1)                                                                       ⟨331088⟩
                charge(mid36 31)                                                                      ⟨331100⟩
                palette_depuis(pal13(mid36 31))                                                       ⟨331107⟩

                ──── scène4 ────
                scène4 = Scene_Create(cadence=15, palette=255, surface=&v534)                         ⟨331115⟩
                c13 = Layer(ressource=midgames 42, x=0, y=-80)                                        ⟨331122⟩
                c14 = Layer(ressource=mid36 2, x=0, y=0)                                              ⟨331130⟩
                c15 = Layer(ressource=midgames 50, x=0, y=12)                                         ⟨331138⟩
                c16 = Layer(ressource=mid36 1, x=0, y=0)                                              ⟨331146⟩
                c17 = Layer(ressource=mid36 1, x=44, y=-11)                                           ⟨331154⟩
                palette_copie(destination=pal1, source=pal13(mid36 31))                               ⟨331164⟩
                ajoute c13 à scène4                                                                   ⟨331169⟩
                ajoute c14 à scène4                                                                   ⟨331174⟩
                ajoute c15 à scène4                                                                   ⟨331179⟩
                ajoute c17 à scène4                                                                   ⟨331184⟩
                palette_envoie(palette=pal1, pas=0)                                                   ⟨331196⟩
                Widget_Method_DispatchC_314CB(zone1, 0)                                               ⟨331201⟩
                Widget_Method_Dispatch8_314A9(zone1, 0)                                               ⟨331206⟩
                c17.image = 3                                                                         ⟨331209⟩
                tant que (scène4.compteur < 10) et (scène4.terminée == 0) :
                    déplace(calque=c17, dx=-4, dy=1)                                                  ⟨331219⟩
                    Scene_Tick(scène=scène4)                                                          ⟨331232⟩
                retire(parent=scène4, calque=c17)                                                     ⟨331258⟩
                c17.détruit(3)                                                                        ⟨331266⟩
                ajoute c16 à scène4                                                                   ⟨331274⟩
                scène4.compteur = 0                                                                   ⟨331276⟩
                v384 = 0                                                                              ⟨331277⟩
                v386 = 3                                                                              ⟨331278⟩
                tant que (scène4.compteur < 73) et (scène4.terminée == 0) :
                    pal10(mid36 35).+0 = scène4.compteur                                              ⟨331284⟩
                    si pal10(mid36 35).+0 < 51 :
                        v390 = v386                                                                   ⟨331288⟩
                        v386_avant = v386                                                             ⟨331289⟩
                        v386 = v386 + 1                                                               ⟨331289⟩
                        c16.image = v390                                                              ⟨331292⟩
                    sinon :
                        v392 = v384                                                                   ⟨331298⟩
                        v384_avant = v384                                                             ⟨331299⟩
                        v384 = v384 + 1                                                               ⟨331299⟩
                        c15.image = v392                                                              ⟨331302⟩
                        v394 = v386                                                                   ⟨331304⟩
                        v386_avant = v386                                                             ⟨331305⟩
                        v386 = v386 + 1                                                               ⟨331305⟩
                        c16.image = v394                                                              ⟨331308⟩
                    Scene_Tick(scène=scène4)                                                          ⟨331322⟩
                Scene_Destruct(scène=scène4, drapeaux=0)                                              ⟨331354⟩
                canal_arrête(canal=canal1)                                                            ⟨331435⟩
                si byte_495FC == 0 :
                    v3198 = -1                                                                        ⟨331492⟩
                    v3210 = 0                                                                         ⟨331493⟩
                    v3205 = 0                                                                         ⟨331495⟩
                    v3204 = 0                                                                         ⟨331496⟩
                    v3214 = 0                                                                         ⟨331497⟩
                    si v9 != 0 :
                        charge(asoundfx 93)                                                           ⟨331511⟩
                        canal_init(canal=canal1, pilote=word_46849)                                   ⟨331516⟩
                        canal_enregistre(canal=canal1, ressource=asoundfx 93, x=0)                    ⟨331523⟩
                        v334 = word_48F5C                                                             ⟨331526⟩
                        si canal1.+0 != 0 :
                            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3198)                    ⟨331533⟩
                            AIL_set_relative_volume_30C66(canal1.+0→4, v3198, v334, mid36 2.+0)       ⟨331540⟩
                        charge(asoundfx 20)                                                           ⟨331551⟩
                        canal_init(canal=canal3, pilote=word_46849)                                   ⟨331556⟩
                        canal_enregistre(canal=canal3, ressource=asoundfx 20, x=0)                    ⟨331563⟩
                    charge(mid36 10)                                                                  ⟨331577⟩

                    ──── scène5 ────
                    scène5 = Scene_Create(cadence=15, palette=255, surface=&v534)                     ⟨331585⟩
                    c18 = Layer(ressource=midgames 42, x=0, y=-80)                                    ⟨331592⟩
                    c19 = Layer(ressource=mid36 0, x=0, y=0)                                          ⟨331600⟩
                    c20 = OverlayImageLayer(ressource=mid36 3, x=0, y=0, image=1)                     ⟨331609⟩
                    c21 = Layer(ressource=mid36 10, x=0, y=0)                                         ⟨331617⟩
                    palette_copie(destination=pal1, source=pal2(midgames 43))                         ⟨331627⟩
                    palette_copie(destination=pal1, source=pal6(mid36 30))                            ⟨331636⟩
                    palette_copie(destination=pal1, source=pal7(midgames 47))                         ⟨331645⟩
                    ajoute c18 à scène5                                                               ⟨331650⟩
                    ajoute c19 à scène5                                                               ⟨331655⟩
                    ajoute c20 à scène5                                                               ⟨331660⟩
                    ajoute c21 à scène5                                                               ⟨331665⟩
                    palette_envoie(palette=pal1, pas=0)                                               ⟨331677⟩
                    Scene_Tick(scène=scène5)                                                          ⟨331681⟩
                    charge(midgames 48)                                                               ⟨331693⟩
                    charge(midgames 49)                                                               ⟨331705⟩
                    charge(mid36 8)                                                                   ⟨331717⟩
                    charge(mid36 27)                                                                  ⟨331729⟩
                    c22 = Layer(ressource=midgames 48, x=0, y=0)                                      ⟨331736⟩
                    c23 = Layer(ressource=midgames 49, x=0, y=0)                                      ⟨331744⟩
                    c24 = Layer(ressource=mid36 8, x=0, y=0)                                          ⟨331752⟩
                    c25 = Layer(ressource=mid36 27, x=0, y=0)                                         ⟨331760⟩
                    scène5.compteur = 0                                                               ⟨331763⟩
                    retire(parent=scène5, calque=c20)                                                 ⟨331767⟩
                    retire(parent=scène5, calque=c21)                                                 ⟨331772⟩
                    ajoute c22 à scène5                                                               ⟨331777⟩
                    ajoute c24 à scène5                                                               ⟨331782⟩
                    ajoute c20 à scène5                                                               ⟨331787⟩
                    ajoute c21 à scène5                                                               ⟨331792⟩
                    v404 = 0                                                                          ⟨331794⟩
                    v406 = 0                                                                          ⟨331795⟩
                    tant que (scène5.compteur < 88) et (scène5.terminée == 0) :
                        v408 = scène5.compteur                                                        ⟨331801⟩
                        si v408 == 20 :
                            Scene_SetFps(scène=scène5, cadence=13)                                    ⟨331807⟩
                        si v408 == 30 :
                            Scene_SetFps(scène=scène5, cadence=11)                                    ⟨331816⟩
                        si v408 == 40 :
                            Scene_SetFps(scène=scène5, cadence=9)                                     ⟨331825⟩
                        si v408 == 50 :
                            Scene_SetFps(scène=scène5, cadence=7)                                     ⟨331834⟩
                        si v408 < 30 :
                            v410 = v404                                                               ⟨331841⟩
                            v404_avant = v404                                                         ⟨331842⟩
                            v404 = v404 + 1                                                           ⟨331842⟩
                            c22.image = v410                                                          ⟨331845⟩
                            v412 = v406                                                               ⟨331847⟩
                            v406_avant = v406                                                         ⟨331848⟩
                            v406 = v406 + 1                                                           ⟨331848⟩
                            c24.image = v412                                                          ⟨331851⟩
                        sinon :
                            si v408 == 30 :
                                v404 = 0                                                              ⟨331862⟩
                                retire(parent=scène5, calque=c22)                                     ⟨331866⟩
                                c22.détruit(3)                                                        ⟨331874⟩
                                retire(parent=scène5, calque=c20)                                     ⟨331882⟩
                                retire(parent=scène5, calque=c21)                                     ⟨331887⟩
                                ajoute c23 à scène5                                                   ⟨331892⟩
                                ajoute c20 à scène5                                                   ⟨331897⟩
                                ajoute c21 à scène5                                                   ⟨331902⟩
                                v414 = v404                                                           ⟨331905⟩
                                v404_avant = v404                                                     ⟨331906⟩
                                v404 = v404 + 1                                                       ⟨331906⟩
                                c23.image = v414                                                      ⟨331909⟩
                                v416 = v406                                                           ⟨331911⟩
                                v406_avant = v406                                                     ⟨331912⟩
                                v406 = v406 + 1                                                       ⟨331912⟩
                                c24.image = v416                                                      ⟨331915⟩
                            sinon :
                                si v408 > 30 :
                                    si v408 < 50 :
                                        v418 = v404                                                   ⟨331925⟩
                                        v404_avant = v404                                             ⟨331926⟩
                                        v404 = v404 + 1                                               ⟨331926⟩
                                        c23.image = v418                                              ⟨331929⟩
                                        v420 = v406                                                   ⟨331931⟩
                                        v406_avant = v406                                             ⟨331932⟩
                                        v406 = v406 + 1                                               ⟨331932⟩
                                        c24.image = v420                                              ⟨331935⟩
                                    sinon :
                                        si v408 == 60 :
                                            si v9 != 0 :
                                                charge(asoundfx 20)                                   ⟨331958⟩
                                                canal_init(canal=canal3, pilote=word_46849)           ⟨331963⟩
                                                canal_enregistre(canal=canal3, ressource=asoundfx 20, x=0)  ⟨331970⟩
                                                v422 = word_48ECA                                     ⟨331973⟩
                                                v424 = 0                                              ⟨331974⟩
                                                si canal3.+0 != 0 :
                                                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3212)  ⟨331980⟩
                                                    AIL_set_relative_volume_30C66(canal3.+0→4, v3212, v422, v424)  ⟨331987⟩
                                            v404 = 0                                                  ⟨331992⟩
                                            Scene_SetFps(scène=scène5, cadence=15)                    ⟨331996⟩
                                            ajoute c25 à scène5                                       ⟨332001⟩
                                            v426 = v404                                               ⟨332004⟩
                                            v404_avant = v404                                         ⟨332005⟩
                                            v404 = v404 + 1                                           ⟨332005⟩
                                            c25.image = v426                                          ⟨332008⟩
                                        sinon :
                                            si v408 > 60 :
                                                si v408 < 78 :
                                                    si v408 & 1 != 0 :
                                                        v428 = v404                                   ⟨332020⟩
                                                        v404_avant = v404                             ⟨332021⟩
                                                        v404 = v404 + 1                               ⟨332021⟩
                                                        c25.image = v428                              ⟨332024⟩
                                sinon :
                                    si v408 == 60 :
                                        si v9 != 0 :
                                            charge(asoundfx 20)                                       ⟨331958⟩
                                            canal_init(canal=canal3, pilote=word_46849)               ⟨331963⟩
                                            canal_enregistre(canal=canal3, ressource=asoundfx 20, x=0)  ⟨331970⟩
                                            v422 = word_48ECA                                         ⟨331973⟩
                                            v424 = 0                                                  ⟨331974⟩
                                            si canal3.+0 != 0 :
                                                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3212)  ⟨331980⟩
                                                AIL_set_relative_volume_30C66(canal3.+0→4, v3212, v422, v424)  ⟨331987⟩
                                        v404 = 0                                                      ⟨331992⟩
                                        Scene_SetFps(scène=scène5, cadence=15)                        ⟨331996⟩
                                        ajoute c25 à scène5                                           ⟨332001⟩
                                        v426 = v404                                                   ⟨332004⟩
                                        v404_avant = v404                                             ⟨332005⟩
                                        v404 = v404 + 1                                               ⟨332005⟩
                                        c25.image = v426                                              ⟨332008⟩
                                    sinon :
                                        si v408 > 60 :
                                            si v408 < 78 :
                                                si v408 & 1 != 0 :
                                                    v428 = v404                                       ⟨332020⟩
                                                    v404_avant = v404                                 ⟨332021⟩
                                                    v404 = v404 + 1                                   ⟨332021⟩
                                                    c25.image = v428                                  ⟨332024⟩
                        Scene_Tick(scène=scène5)                                                      ⟨332038⟩
                    Scene_Destruct(scène=scène5, drapeaux=0)                                          ⟨332138⟩
                    canal_arrête(canal=canal3)                                                        ⟨332160⟩
                    canal_arrête(canal=canal1)                                                        ⟨332182⟩
                    si byte_495FC == 0 :

                        ──── scène6 ────
                        scène6 = Scene_Create(cadence=10, palette=255, surface=&v534)                 ⟨332250⟩
                        charge(midgames 6)                                                            ⟨332262⟩
                        palette_depuis(pal14(midgames 6))                                             ⟨332269⟩
                        charge(midgames 4)                                                            ⟨332281⟩
                        c26 = Layer(ressource=midgames 42, x=0, y=-80)                                ⟨332288⟩
                        charge_convdata_type0("air", drapeau=2)                                       ⟨332299⟩
                        c27 = Layer(ressource=midgames 4, x=0, y=0)                                   ⟨332306⟩
                        c28 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)       ⟨332314⟩
                        c29 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)     ⟨332323⟩
                        palette_copie(destination=pal1, source=pal2(midgames 43))                     ⟨332333⟩
                        palette_copie(destination=pal1, source=pal6(mid36 30))                        ⟨332342⟩
                        palette_copie(destination=pal1, source=pal14(midgames 6))                     ⟨332351⟩
                        palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))        ⟨332360⟩
                        palette_envoie(palette=pal1, pas=0)                                           ⟨332372⟩
                        ajoute c26 à scène6                                                           ⟨332377⟩
                        ajoute c27 à scène6                                                           ⟨332382⟩
                        ajoute c28 à scène6                                                           ⟨332387⟩
                        ajoute c29 à scène6                                                           ⟨332392⟩
                        Widget_Method_DispatchC_314CB(zone1, 0)                                       ⟨332397⟩
                        Widget_Method_Dispatch8_314A9(zone1, 127)                                     ⟨332402⟩
                        charge(midgames 0)                                                            ⟨332414⟩
                        c30 = ToggleLayer(ressource=midgames 0, x=160, y=128, sens=1)                 ⟨332422⟩
                        ajoute c30 à scène6                                                           ⟨332428⟩
                        tant que (scène6.compteur < 15) et (scène6.terminée == 0) :
                            Scene_Tick(scène=scène6)                                                  ⟨332436⟩
                        scène6.compteur = 0                                                           ⟨332457⟩
                        tête_image_de_base(tête=c28, image=27)                                        ⟨332460⟩
                        tant que (scène6.compteur < 2) et (scène6.terminée == 0) :
                            Scene_Tick(scène=scène6)                                                  ⟨332468⟩
                        tête_image_de_base(tête=c28, image=28)                                        ⟨332491⟩
                        tant que (scène6.compteur < 10) et (scène6.terminée == 0) :
                            Scene_Tick(scène=scène6)                                                  ⟨332499⟩
                        Scene_Destruct(scène=scène6, drapeaux=0)                                      ⟨332600⟩
                        si byte_495FC == 0 :
                            charge(mid36 23)                                                          ⟨332618⟩
                            charge(mid36 22)                                                          ⟨332630⟩
                            charge(mid36 20)                                                          ⟨332642⟩
                            charge(mid36 26)                                                          ⟨332654⟩
                            charge(mid36 25)                                                          ⟨332666⟩
                            charge(mid36 21)                                                          ⟨332678⟩
                            charge(mid36 24)                                                          ⟨332690⟩

                            ──── scène7 ────
                            scène7 = Scene_Create(cadence=10, palette=255, surface=&v534)             ⟨332698⟩
                            c31 = Layer(ressource=midgames 44, x=0, y=0)                              ⟨332705⟩
                            c32 = Layer(ressource=mid36 18, x=0, y=0)                                 ⟨332713⟩
                            c33 = Layer(ressource=mid36 23, x=0, y=3)                                 ⟨332721⟩
                            c34 = OverlayImageLayer(ressource=mid36 22, x=113, y=3, image=0)          ⟨332730⟩
                            c35 = OverlayImageLayer(ressource=mid36 20, x=0, y=3, image=0)            ⟨332739⟩
                            c36 = OverlayImageLayer(ressource=mid36 25, x=0, y=3, image=0)            ⟨332748⟩
                            c37 = OverlayImageLayer(ressource=mid36 26, x=40, y=3, image=0)           ⟨332757⟩
                            c38 = OverlayImageLayer(ressource=mid36 21, x=0, y=3, image=0)            ⟨332766⟩
                            c39 = OverlayImageLayer(ressource=mid36 24, x=-140, y=3, image=0)         ⟨332775⟩
                            palette_copie(destination=pal1, source=pal4(mid36 36))                    ⟨332785⟩
                            palette_copie(destination=pal1, source=pal3(midgames 45))                 ⟨332794⟩
                            palette_copie(destination=pal1, source=pal5(mid36 37))                    ⟨332803⟩
                            ajoute c31 à scène7                                                       ⟨332808⟩
                            ajoute c32 à scène7                                                       ⟨332813⟩
                            ajoute c33 à scène7                                                       ⟨332818⟩
                            ajoute c39 à scène7                                                       ⟨332823⟩
                            ajoute c36 à scène7                                                       ⟨332828⟩
                            ajoute c35 à scène7                                                       ⟨332833⟩
                            ajoute c38 à scène7                                                       ⟨332838⟩
                            ajoute c37 à scène7                                                       ⟨332843⟩
                            ajoute c34 à scène7                                                       ⟨332848⟩
                            c34.image = 2                                                             ⟨332855⟩
                            c35.image = 2                                                             ⟨332857⟩
                            c36.image = 1                                                             ⟨332859⟩
                            c38.image = 9                                                             ⟨332861⟩
                            c37.image = 1                                                             ⟨332863⟩
                            c39.image = 1                                                             ⟨332865⟩
                            palette_envoie(palette=pal1, pas=0)                                       ⟨332872⟩
                            v402 = 1                                                                  ⟨332874⟩
                            v404 = 1                                                                  ⟨332875⟩
                            scène7.compteur = 0                                                       ⟨332876⟩
                            tant que (scène7.compteur < 30) et (scène7.terminée == 0) :
                                v406 = scène7.compteur                                                ⟨332882⟩
                                si v406 == 2 :
                                    v408 = v402                                                       ⟨332886⟩
                                    v402_avant = v402                                                 ⟨332887⟩
                                    v402 = v402 + 1                                                   ⟨332887⟩
                                    c35.image = v408                                                  ⟨332890⟩
                                si v406 > 1 :
                                    si v406 < 7 :
                                        v410 = v404                                                   ⟨332898⟩
                                        v404_avant = v404                                             ⟨332899⟩
                                        v404 = v404 + 1                                               ⟨332899⟩
                                        c38.image = v410                                              ⟨332902⟩
                                si v406 > 13 :
                                    si v406 < 16 :
                                        v412 = v404                                                   ⟨332910⟩
                                        v404_avant = v404                                             ⟨332911⟩
                                        v404 = v404 + 1                                               ⟨332911⟩
                                        c38.image = v412                                              ⟨332914⟩
                                si v406 == 17 :
                                    v414 = v402                                                       ⟨332920⟩
                                    c35.image = v414                                                  ⟨332923⟩
                                si v406 == 17 :
                                    c38.image = 2                                                     ⟨332929⟩
                                si v406 == 18 :
                                    c38.image = 1                                                     ⟨332935⟩
                                si v406 == 19 :
                                    c38.image = 9                                                     ⟨332941⟩
                                si v406 == 3 :
                                    c37.image = 2                                                     ⟨332947⟩
                                si v406 == 20 :
                                    c36.image = 2                                                     ⟨332953⟩
                                Scene_Tick(scène=scène7)                                              ⟨332967⟩
                            Scene_Destruct(scène=scène7, drapeaux=0)                                  ⟨332995⟩
                            si byte_495FC == 0 :

                                ──── scène8 ────
                                scène8 = Scene_Create(cadence=9, palette=255, surface=&v534)          ⟨333135⟩
                                c40 = Layer(ressource=midgames 44, x=0, y=0)                          ⟨333142⟩
                                c41 = Layer(ressource=mid36 18, x=0, y=0)                             ⟨333150⟩
                                c42 = TalkingHead(ressource=convdata type 0 "virgil", x=105, y=129)   ⟨333158⟩
                                c43 = TalkingHead(ressource=convdata type 0 "gwen", x=265, y=129)     ⟨333166⟩
                                c44 = TalkingHead(ressource=convdata type 0 "miguel", x=-45, y=129)   ⟨333174⟩
                                palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨333184⟩
                                palette_copie(destination=pal1, source=pal4(mid36 36))                ⟨333193⟩
                                palette_copie(destination=pal1, source=pal3(midgames 45))             ⟨333202⟩
                                ajoute c40 à scène8                                                   ⟨333207⟩
                                ajoute c41 à scène8                                                   ⟨333212⟩
                                ajoute c44 à scène8                                                   ⟨333217⟩
                                ajoute c42 à scène8                                                   ⟨333222⟩
                                ajoute c43 à scène8                                                   ⟨333227⟩
                                palette_envoie(palette=pal1, pas=0)                                   ⟨333239⟩
                                tête_image_de_base(tête=c42, image=33)                                ⟨333243⟩
                                tête_image_de_base(tête=c43, image=27)                                ⟨333247⟩
                                si v8 != 0 :
                                    Scene_Tick(scène=scène8)                                          ⟨333257⟩
                                    charge(mid36voc 0)                                                ⟨333269⟩
                                    tête_voix(tête=c42, ressource=mid36voc 0, cadence=9)              ⟨333275⟩
                                    v334 = 0                                                          ⟨333277⟩
                                    tant que v334 < 3 :
                                        Scene_Tick(scène=scène8)                                      ⟨333284⟩
                                        v334 = v334 + 1                                               ⟨333286⟩
                                    v334 = 0                                                          ⟨333291⟩
                                    tant que tête_parle(tête=c42) != 0 :
                                        si v334 == 5 :
                                            tête_image_de_base(tête=c43, image=-1)                    ⟨333300⟩
                                        si v334 == 6 :
                                            tête_image_de_base(tête=c43, image=25)                    ⟨333308⟩
                                        si v334 == 8 :
                                            tête_image_de_base(tête=c43, image=31)                    ⟨333316⟩
                                        v334_avant = v334                                             ⟨333321⟩
                                        v334 = v334 + 1                                               ⟨333321⟩
                                        si v334_avant == 12 :
                                            tête_image_de_base(tête=c43, image=18)                    ⟨333326⟩
                                        Scene_Tick(scène=scène8)                                      ⟨333341⟩
                                sinon :
                                    Widget_Method_DispatchC_314CB(zone1, 0)                           ⟨333379⟩
                                    Widget_Method_Dispatch8_314A9(zone1, 227)                         ⟨333384⟩
                                    v2 = 60                                                           ⟨333386⟩
                                    si = scène8.compteur                                              ⟨333387⟩
                                    tant que (scène8.compteur < si + ((v2·70) / 100)) et (scène8.terminée == 0) :
                                        si si + 2 == scène8.compteur :
                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[0])  ⟨333410⟩
                                        si si + 2 == scène8.compteur :
                                            tête_texte_de_lèvres(tête=c42, texte="ispslwntmtshlotmyfrmdlnrit")  ⟨333420⟩
                                        si si + 10 == scène8.compteur :
                                            tête_image_de_base(tête=c43, image=-1)                    ⟨333430⟩
                                        si si + 10 == scène8.compteur :
                                            tête_image_de_base(tête=c43, image=25)                    ⟨333440⟩
                                        si si + 13 == scène8.compteur :
                                            tête_image_de_base(tête=c43, image=31)                    ⟨333450⟩
                                        si (si + ((v2·70) / 100)) - 1 == scène8.compteur :
                                            v3232 = 4540                                              ⟨333458⟩
                                            v3232 = 4552                                              ⟨333459⟩
                                            v3232 = 4568                                              ⟨333460⟩
                                            v3232 = 4584                                              ⟨333461⟩
                                            v3232 = 4604                                              ⟨333462⟩
                                            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3161, v3159, v3157, v3155, 0, &v3184)  ⟨333472⟩
                                        Scene_Tick(scène=scène8)                                      ⟨333503⟩
                                si byte_495FC != 0 :
                                    Scene_Destruct(scène=scène8, drapeaux=0)                          ⟨333533⟩
                                sinon :
                                    si v8 != 0 :
                                        Scene_Tick(scène=scène8)                                      ⟨333547⟩
                                        charge(mid36voc 1)                                            ⟨333559⟩
                                        tête_voix(tête=c43, ressource=mid36voc 1, cadence=9)          ⟨333565⟩
                                        v334 = 0                                                      ⟨333567⟩
                                        tant que v334 < 3 :
                                            Scene_Tick(scène=scène8)                                  ⟨333574⟩
                                            v334 = v334 + 1                                           ⟨333576⟩
                                        v334 = 0                                                      ⟨333581⟩
                                        tant que tête_parle(tête=c43) != 0 :
                                            v334_avant = v334                                         ⟨333587⟩
                                            v334 = v334 + 1                                           ⟨333587⟩
                                            si v334_avant == 4 :
                                                tête_image_de_base(tête=c42, image=17)                ⟨333592⟩
                                            Scene_Tick(scène=scène8)                                  ⟨333607⟩
                                    sinon :
                                        Widget_Method_Dispatch8_314A9(zone1, 235)                     ⟨333643⟩
                                        v2 = 30                                                       ⟨333645⟩
                                        si = scène8.compteur                                          ⟨333646⟩
                                        tant que (scène8.compteur < si + ((v2·70) / 100)) et (scène8.terminée == 0) :
                                            si si + 1 == scène8.compteur :
                                                tête_image_de_base(tête=c43, image=18)                ⟨333668⟩
                                            si si + 1 == scène8.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[1])  ⟨333681⟩
                                            si si + 1 == scène8.compteur :
                                                tête_texte_de_lèvres(tête=c43, texte="Damitvrgl")     ⟨333691⟩
                                            si si + 2 == scène8.compteur :
                                                tête_image_de_base(tête=c42, image=17)                ⟨333701⟩
                                            si (si + ((v2·70) / 100)) - 1 == scène8.compteur :
                                                v3232 = 4540                                          ⟨333709⟩
                                                v3232 = 4552                                          ⟨333710⟩
                                                v3232 = 4568                                          ⟨333711⟩
                                                v3232 = 4584                                          ⟨333712⟩
                                                v3232 = 4604                                          ⟨333713⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3161, v3159, v3157, v3155, 0, &v3184)  ⟨333723⟩
                                            Scene_Tick(scène=scène8)                                  ⟨333754⟩
                                    si byte_495FC != 0 :
                                        Scene_Destruct(scène=scène8, drapeaux=0)                      ⟨333784⟩
                                    sinon :
                                        si v8 != 0 :
                                            Scene_Tick(scène=scène8)                                  ⟨333798⟩
                                            charge(mid36voc 2)                                        ⟨333810⟩
                                            tête_voix(tête=c42, ressource=mid36voc 2, cadence=9)      ⟨333816⟩
                                            v334 = 0                                                  ⟨333818⟩
                                            tant que v334 < 3 :
                                                Scene_Tick(scène=scène8)                              ⟨333825⟩
                                                v334 = v334 + 1                                       ⟨333827⟩
                                            v334 = 0                                                  ⟨333832⟩
                                            tant que tête_parle(tête=c42) != 0 :
                                                si v334 == 5 :
                                                    tête_image_de_base(tête=c42, image=-1)            ⟨333841⟩
                                                si v334 == 10 :
                                                    tête_image_de_base(tête=c43, image=-1)            ⟨333849⟩
                                                v334_avant = v334                                     ⟨333854⟩
                                                v334 = v334 + 1                                       ⟨333854⟩
                                                si v334_avant == 10 :
                                                    tête_image_de_base(tête=c43, image=27)            ⟨333859⟩
                                                Scene_Tick(scène=scène8)                              ⟨333874⟩
                                            tête_image_de_base(tête=c42, image=27)                    ⟨333887⟩
                                            v334 = 0                                                  ⟨333889⟩
                                            tant que v334 < 6 :
                                                Scene_Tick(scène=scène8)                              ⟨333896⟩
                                                v334 = v334 + 1                                       ⟨333898⟩
                                        sinon :
                                            Widget_Method_Dispatch8_314A9(zone1, 227)                 ⟨333928⟩
                                            v2 = 96                                                   ⟨333930⟩
                                            si = scène8.compteur                                      ⟨333931⟩
                                            tant que (scène8.compteur < si + ((v2·70) / 100)) et (scène8.terminée == 0) :
                                                si si + 8 == scène8.compteur :
                                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[2])  ⟨333958⟩
                                                si si + 8 == scène8.compteur :
                                                    tête_texte_de_lèvres(tête=c42, texte="alrtalrtigtohditoyucmdrydagdjb")  ⟨333968⟩
                                                si si + 20 == scène8.compteur :
                                                    tête_image_de_base(tête=c42, image=-1)            ⟨333978⟩
                                                si (si + ((v2·70) / 100)) - 5 == scène8.compteur :
                                                    tête_image_de_base(tête=c43, image=-1)            ⟨333988⟩
                                                si (si + ((v2·70) / 100)) - 5 == scène8.compteur :
                                                    tête_image_de_base(tête=c43, image=27)            ⟨333998⟩
                                                si (si + ((v2·70) / 100)) - 1 == scène8.compteur :
                                                    v3232 = 4540                                      ⟨334006⟩
                                                    v3232 = 4552                                      ⟨334007⟩
                                                    v3232 = 4568                                      ⟨334008⟩
                                                    v3232 = 4584                                      ⟨334009⟩
                                                    v3232 = 4604                                      ⟨334010⟩
                                                    Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3161, v3159, v3157, v3155, 0, &v3184)  ⟨334020⟩
                                                Scene_Tick(scène=scène8)                              ⟨334051⟩
                                            si byte_495FC != 0 :
                                                Scene_Destruct(scène=scène8, drapeaux=0)              ⟨334081⟩
                                                aller à loc_BD722                                     ⟨334083⟩
                                            v2_avant = si + ((v2·70) / 100)                           ⟨334087⟩
                                            v2 = 70                                                   ⟨334087⟩
                                            si = scène8.compteur                                      ⟨334088⟩
                                            tant que (scène8.compteur < si + ((v2·70) / 100)) et (scène8.terminée == 0) :
                                                si si + 1 == scène8.compteur :
                                                    tête_image_de_base(tête=c42, image=-1)            ⟨334110⟩
                                                si si + 1 == scène8.compteur :
                                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[5])  ⟨334126⟩
                                                si si + 1 == scène8.compteur :
                                                    tête_texte_de_lèvres(tête=c42, texte="stnwdbeprdrlprdnsorwe")  ⟨334136⟩
                                                si (si + ((v2·70) / 100)) - 4 == scène8.compteur :
                                                    tête_image_de_base(tête=c42, image=27)            ⟨334146⟩
                                                si (si + ((v2·70) / 100)) - 1 == scène8.compteur :
                                                    v3232 = 4540                                      ⟨334154⟩
                                                    v3232 = 4552                                      ⟨334155⟩
                                                    v3232 = 4568                                      ⟨334156⟩
                                                    v3232 = 4584                                      ⟨334157⟩
                                                    v3232 = 4604                                      ⟨334158⟩
                                                    Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3161, v3159, v3157, v3155, 0, &v3184)  ⟨334168⟩
                                                Scene_Tick(scène=scène8)                              ⟨334199⟩
                                        Scene_Destruct(scène=scène8, drapeaux=0)                      ⟨334227⟩
                                        si byte_495FC == 0 :

                                            ──── scène9 ────
                                            scène9 = Scene_Create(cadence=10, palette=255, surface=&v534)  ⟨334241⟩
                                            c45 = Layer(ressource=midgames 44, x=0, y=0)              ⟨334248⟩
                                            c46 = Layer(ressource=mid36 18, x=0, y=0)                 ⟨334256⟩
                                            c47 = TalkingHead(ressource=convdata type 0 "lyle", x=160, y=129)  ⟨334264⟩
                                            c48 = TalkingHead(ressource=convdata type 0 "billy", x=-30, y=129)  ⟨334272⟩
                                            c49 = TalkingHead(ressource=convdata type 0 "air", x=350, y=129)  ⟨334280⟩
                                            palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨334290⟩
                                            palette_copie(destination=pal1, source=pal4(mid36 36))    ⟨334299⟩
                                            palette_copie(destination=pal1, source=pal3(midgames 45))  ⟨334308⟩
                                            ajoute c45 à scène9                                       ⟨334313⟩
                                            ajoute c46 à scène9                                       ⟨334318⟩
                                            ajoute c48 à scène9                                       ⟨334323⟩
                                            ajoute c49 à scène9                                       ⟨334328⟩
                                            ajoute c47 à scène9                                       ⟨334333⟩
                                            palette_envoie(palette=pal1, pas=0)                       ⟨334345⟩
                                            si v8 != 0 :
                                                Scene_Tick(scène=scène9)                              ⟨334355⟩
                                                charge(mid36voc 3)                                    ⟨334367⟩
                                                tête_voix(tête=c47, ressource=mid36voc 3, cadence=9)  ⟨334373⟩
                                                v334 = 0                                              ⟨334375⟩
                                                tant que v334 < 3 :
                                                    Scene_Tick(scène=scène9)                          ⟨334382⟩
                                                    v334 = v334 + 1                                   ⟨334384⟩
                                                tant que tête_parle(tête=c47) != 0 :
                                                    Scene_Tick(scène=scène9)                          ⟨334404⟩
                                                tête_image_de_base(tête=c47, image=27)                ⟨334417⟩
                                                v334 = 0                                              ⟨334419⟩
                                                tant que v334 < 6 :
                                                    Scene_Tick(scène=scène9)                          ⟨334426⟩
                                                    v334 = v334 + 1                                   ⟨334428⟩
                                            sinon :
                                                Widget_Method_Dispatch8_314A9(zone1, 227)             ⟨334458⟩
                                                v2 = 64                                               ⟨334460⟩
                                                si = scène9.compteur                                  ⟨334461⟩
                                                tant que (scène9.compteur < si + ((v2·70) / 100)) et (scène9.terminée == 0) :
                                                    si si + 1 == scène9.compteur :
                                                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])  ⟨334489⟩
                                                    si si + 1 == scène9.compteur :
                                                        tête_texte_de_lèvres(tête=c47, texte="strnwldbeprudrlprudnsoarwe")  ⟨334499⟩
                                                    si (si + ((v2·70) / 100)) - 6 == scène9.compteur :
                                                        tête_image_de_base(tête=c47, image=27)        ⟨334509⟩
                                                    si (si + ((v2·70) / 100)) - 1 == scène9.compteur :
                                                        v3232 = 4540                                  ⟨334517⟩
                                                        v3232 = 4552                                  ⟨334518⟩
                                                        v3232 = 4568                                  ⟨334519⟩
                                                        v3232 = 4584                                  ⟨334520⟩
                                                        v3232 = 4604                                  ⟨334521⟩
                                                        Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3161, v3159, v3157, v3155, 0, &v3184)  ⟨334531⟩
                                                    Scene_Tick(scène=scène9)                          ⟨334562⟩
                                            Scene_Destruct(scène=scène9, drapeaux=0)                  ⟨334590⟩
                                            si byte_495FC == 0 :

                                                ──── scène10 ────
                                                scène10 = Scene_Create(cadence=10, palette=255, surface=&v534)  ⟨334604⟩
                                                c50 = Layer(ressource=midgames 44, x=0, y=0)          ⟨334611⟩
                                                c51 = Layer(ressource=mid36 18, x=0, y=0)             ⟨334619⟩
                                                c52 = TalkingHead(ressource=convdata type 0 "tex", x=200, y=129)  ⟨334627⟩
                                                c53 = TalkingHead(ressource=convdata type 0 "air", x=-30, y=129)  ⟨334635⟩
                                                palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨334645⟩
                                                palette_copie(destination=pal1, source=pal4(mid36 36))  ⟨334654⟩
                                                palette_copie(destination=pal1, source=pal3(midgames 45))  ⟨334663⟩
                                                ajoute c50 à scène10                                  ⟨334668⟩
                                                ajoute c51 à scène10                                  ⟨334673⟩
                                                ajoute c52 à scène10                                  ⟨334678⟩
                                                ajoute c53 à scène10                                  ⟨334683⟩
                                                palette_envoie(palette=pal1, pas=0)                   ⟨334695⟩
                                                tête_image_de_base(tête=c52, image=25)                ⟨334699⟩
                                                tête_image_de_base(tête=c52, image=31)                ⟨334703⟩
                                                si v8 != 0 :
                                                    Scene_Tick(scène=scène10)                         ⟨334713⟩
                                                    charge(mid36voc 4)                                ⟨334725⟩
                                                    tête_voix(tête=c52, ressource=mid36voc 4, cadence=9)  ⟨334731⟩
                                                    v332 = 0                                          ⟨334733⟩
                                                    tant que tête_parle(tête=c52) != 0 :
                                                        si v332 == 13 :
                                                            tête_image_de_base(tête=c52, image=-1)    ⟨334742⟩
                                                        v332_avant = v332                             ⟨334747⟩
                                                        v332 = v332 + 1                               ⟨334747⟩
                                                        si v332_avant == 14 :
                                                            tête_image_de_base(tête=c52, image=27)    ⟨334752⟩
                                                        Scene_Tick(scène=scène10)                     ⟨334767⟩
                                                    v332 = 0                                          ⟨334778⟩
                                                    tant que v332 < 10 :
                                                        Scene_Tick(scène=scène10)                     ⟨334785⟩
                                                        v332 = v332 + 1                               ⟨334787⟩
                                                sinon :
                                                    Widget_Method_Dispatch8_314A9(zone1, 254)         ⟨334817⟩
                                                    v2 = 56                                           ⟨334819⟩
                                                    si = scène10.compteur                             ⟨334820⟩
                                                    tant que (scène10.compteur < si + ((v2·70) / 100)) et (scène10.terminée == 0) :
                                                        si si + 1 == scène10.compteur :
                                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[7])  ⟨334848⟩
                                                        si si + 1 == scène10.compteur :
                                                            tête_texte_de_lèvres(tête=c52, texte="spkfryrslfvrgliatprd")  ⟨334858⟩
                                                        si (si + ((v2·70) / 100)) - 1 == scène10.compteur :
                                                            v3232 = 4540                              ⟨334866⟩
                                                            v3232 = 4552                              ⟨334867⟩
                                                            v3232 = 4568                              ⟨334868⟩
                                                            v3232 = 4584                              ⟨334869⟩
                                                            v3232 = 4604                              ⟨334870⟩
                                                            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3161, v3159, v3157, v3155, 0, &v3184)  ⟨334880⟩
                                                        Scene_Tick(scène=scène10)                     ⟨334911⟩
                                                    si byte_495FC != 0 :
                                                        Scene_Destruct(scène=scène10, drapeaux=0)     ⟨334941⟩
                                                        aller à loc_BD722                             ⟨334943⟩
                                                    v2_avant = si + ((v2·70) / 100)                   ⟨334947⟩
                                                    v2 = 80                                           ⟨334947⟩
                                                    si = scène10.compteur                             ⟨334948⟩
                                                    tant que (scène10.compteur < si + ((v2·70) / 100)) et (scène10.terminée == 0) :
                                                        si si + 1 == scène10.compteur :
                                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])  ⟨334975⟩
                                                        si si + 1 == scène10.compteur :
                                                            tête_texte_de_lèvres(tête=c52, texte="imjelosashl")  ⟨334985⟩
                                                        si si + 13 == scène10.compteur :
                                                            tête_image_de_base(tête=c52, image=-1)    ⟨334995⟩
                                                        si si + 14 == scène10.compteur :
                                                            tête_image_de_base(tête=c52, image=27)    ⟨335005⟩
                                                        si si + 15 == scène10.compteur :
                                                            tête_texte_de_lèvres(tête=c52, texte="ukdbtthasaliknsay")  ⟨335015⟩
                                                        si (si + ((v2·70) / 100)) - 1 == scène10.compteur :
                                                            v3232 = 4540                              ⟨335023⟩
                                                            v3232 = 4552                              ⟨335024⟩
                                                            v3232 = 4568                              ⟨335025⟩
                                                            v3232 = 4584                              ⟨335026⟩
                                                            v3232 = 4604                              ⟨335027⟩
                                                            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3161, v3159, v3157, v3155, 0, &v3184)  ⟨335037⟩
                                                        Scene_Tick(scène=scène10)                     ⟨335068⟩
                                                Scene_Destruct(scène=scène10, drapeaux=0)             ⟨335096⟩
                                                si byte_495FC == 0 :

                                                    ──── scène11 ────
                                                    scène11 = Scene_Create(cadence=9, palette=255, surface=&v534)  ⟨335110⟩
                                                    c54 = Layer(ressource=midgames 44, x=0, y=0)      ⟨335117⟩
                                                    c55 = Layer(ressource=mid36 18, x=0, y=0)         ⟨335125⟩
                                                    c56 = TalkingHead(ressource=convdata type 0 "virgil", x=-45, y=129)  ⟨335133⟩
                                                    c57 = TalkingHead(ressource=convdata type 0 "gwen", x=145, y=129)  ⟨335141⟩
                                                    c58 = TalkingHead(ressource=convdata type 0 "billy", x=310, y=129)  ⟨335149⟩
                                                    palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨335159⟩
                                                    palette_copie(destination=pal1, source=pal4(mid36 36))  ⟨335168⟩
                                                    palette_copie(destination=pal1, source=pal3(midgames 45))  ⟨335177⟩
                                                    ajoute c54 à scène11                              ⟨335182⟩
                                                    ajoute c55 à scène11                              ⟨335187⟩
                                                    ajoute c56 à scène11                              ⟨335192⟩
                                                    ajoute c58 à scène11                              ⟨335197⟩
                                                    ajoute c57 à scène11                              ⟨335202⟩
                                                    palette_envoie(palette=pal1, pas=0)               ⟨335214⟩
                                                    tête_image_de_base(tête=c56, image=27)            ⟨335218⟩
                                                    tête_image_de_base(tête=c58, image=27)            ⟨335222⟩
                                                    c57.+2130 = 0                                     ⟨335225⟩
                                                    si v8 != 0 :
                                                        Scene_Tick(scène=scène11)                     ⟨335234⟩
                                                        charge(mid36voc 5)                            ⟨335246⟩
                                                        tête_voix(tête=c57, ressource=mid36voc 5, cadence=9)  ⟨335252⟩
                                                        v334 = 0                                      ⟨335254⟩
                                                        tant que v334 < 3 :
                                                            Scene_Tick(scène=scène11)                 ⟨335261⟩
                                                            v334 = v334 + 1                           ⟨335263⟩
                                                        tant que tête_parle(tête=c57) != 0 :
                                                            Scene_Tick(scène=scène11)                 ⟨335283⟩
                                                        si byte_495FC != 0 :
                                                            si v327 == 0 : aller à loc_B81ED+2        ⟨335297⟩
                                                            Scene_Destruct(scène=scène11, drapeaux=0)  ⟨335305⟩
                                                            aller à loc_BD722                         ⟨335307⟩
                                                        v334 = 0                                      ⟨335311⟩
                                                        tant que v334 < 12 :
                                                            si v334 == 2 :
                                                                tête_image_de_base(tête=c57, image=27)  ⟨335320⟩
                                                            si v334 == 4 :
                                                                tête_image_de_base(tête=c57, image=15)  ⟨335328⟩
                                                            si v334 == 6 :
                                                                tête_image_de_base(tête=c57, image=-1)  ⟨335336⟩
                                                            Scene_Tick(scène=scène11)                 ⟨335342⟩
                                                            v334 = v334 + 1                           ⟨335344⟩
                                                        si byte_495FC != 0 :
                                                            si v327 == 0 : aller à loc_B81ED+2        ⟨335352⟩
                                                            Scene_Destruct(scène=scène11, drapeaux=0)  ⟨335360⟩
                                                            aller à loc_BD722                         ⟨335362⟩
                                                        charge(mid36voc 6)                            ⟨335376⟩
                                                        tête_voix(tête=c57, ressource=mid36voc 6, cadence=9)  ⟨335382⟩
                                                        tant que tête_parle(tête=c57) != 0 :
                                                            Scene_Tick(scène=scène11)                 ⟨335399⟩
                                                        tête_image_de_base(tête=c57, image=27)        ⟨335412⟩
                                                        v334 = 0                                      ⟨335414⟩
                                                        tant que v334 < 10 :
                                                            Scene_Tick(scène=scène11)                 ⟨335421⟩
                                                            v334 = v334 + 1                           ⟨335423⟩
                                                    sinon :
                                                        Widget_Method_Dispatch8_314A9(zone1, 235)     ⟨335471⟩
                                                        v2 = 30                                       ⟨335473⟩
                                                        si = scène11.compteur                         ⟨335474⟩
                                                        tant que (scène11.compteur < si + ((v2·70) / 100)) et (scène11.terminée == 0) :
                                                            si scène11.compteur == si :
                                                                tête_image_de_base(tête=c57, image=19)  ⟨335494⟩
                                                            si si + 1 == scène11.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[9])  ⟨335510⟩
                                                            si si + 1 == scène11.compteur :
                                                                tête_texte_de_lèvres(tête=c57, texte="ivnrbngdwdwrs")  ⟨335520⟩
                                                            si (si + ((v2·70) / 100)) - 1 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=-1)  ⟨335530⟩
                                                            si (si + ((v2·70) / 100)) - 1 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=27)  ⟨335540⟩
                                                            si (si + ((v2·70) / 100)) - 1 == scène11.compteur :
                                                                v3232 = 4540                          ⟨335548⟩
                                                                v3232 = 4552                          ⟨335549⟩
                                                                v3232 = 4568                          ⟨335550⟩
                                                                v3232 = 4584                          ⟨335551⟩
                                                                v3232 = 4604                          ⟨335552⟩
                                                                Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3161, v3159, v3157, v3155, 0, &v3184)  ⟨335562⟩
                                                            Scene_Tick(scène=scène11)                 ⟨335593⟩
                                                        si byte_495FC != 0 :
                                                            Scene_Destruct(scène=scène11, drapeaux=0)  ⟨335623⟩
                                                            aller à loc_BD722                         ⟨335625⟩
                                                        v2_avant = si + ((v2·70) / 100)               ⟨335629⟩
                                                        v2 = 50                                       ⟨335629⟩
                                                        si = scène11.compteur                         ⟨335630⟩
                                                        tant que (scène11.compteur < si + ((v2·70) / 100)) et (scène11.terminée == 0) :
                                                            si si + 1 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=-1)  ⟨335652⟩
                                                            si si + 1 == scène11.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[10])  ⟨335668⟩
                                                            si si + 1 == scène11.compteur :
                                                                tête_texte_de_lèvres(tête=c57, texte="btcmadr")  ⟨335678⟩
                                                            si si + 10 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=27)  ⟨335688⟩
                                                            si si + 12 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=15)  ⟨335698⟩
                                                            si si + 14 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=-1)  ⟨335708⟩
                                                            si si + 14 == scène11.compteur :
                                                                tête_texte_de_lèvres(tête=c57, texte="yorthabsta")  ⟨335718⟩
                                                            si (si + ((v2·70) / 100)) - 5 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=27)  ⟨335728⟩
                                                            si (si + ((v2·70) / 100)) - 1 == scène11.compteur :
                                                                v3232 = 4540                          ⟨335736⟩
                                                                v3232 = 4552                          ⟨335737⟩
                                                                v3232 = 4568                          ⟨335738⟩
                                                                v3232 = 4584                          ⟨335739⟩
                                                                v3232 = 4604                          ⟨335740⟩
                                                                Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3161, v3159, v3157, v3155, 0, &v3184)  ⟨335750⟩
                                                            Scene_Tick(scène=scène11)                 ⟨335781⟩
                                                    Scene_Destruct(scène=scène11, drapeaux=0)         ⟨335809⟩
                                                    si byte_495FC == 0 :
                                                        si v9 != 0 :
                                                            charge(asoundfx 25)                       ⟨335835⟩
                                                            canal_init(canal=canal1, pilote=word_46849)  ⟨335840⟩
                                                            canal_enregistre(canal=canal1, ressource=asoundfx 25, x=0)  ⟨335847⟩
                                                        charge(mid36 23)                              ⟨335861⟩
                                                        charge(mid36 22)                              ⟨335873⟩
                                                        charge(mid36 20)                              ⟨335885⟩
                                                        charge(mid36 26)                              ⟨335897⟩
                                                        charge(mid36 25)                              ⟨335909⟩
                                                        charge(mid36 21)                              ⟨335921⟩
                                                        charge(mid36 24)                              ⟨335933⟩

                                                        ──── scène12 ────
                                                        scène12 = Scene_Create(cadence=10, palette=255, surface=&v534)  ⟨335941⟩
                                                        c59 = Layer(ressource=midgames 44, x=0, y=0)  ⟨335948⟩
                                                        c60 = Layer(ressource=mid36 18, x=0, y=0)     ⟨335956⟩
                                                        c61 = Layer(ressource=mid36 23, x=0, y=3)     ⟨335964⟩
                                                        c62 = OverlayImageLayer(ressource=mid36 22, x=113, y=3, image=0)  ⟨335973⟩
                                                        c63 = OverlayImageLayer(ressource=mid36 20, x=0, y=3, image=0)  ⟨335982⟩
                                                        c64 = OverlayImageLayer(ressource=mid36 25, x=0, y=3, image=0)  ⟨335991⟩
                                                        c65 = OverlayImageLayer(ressource=mid36 26, x=40, y=3, image=0)  ⟨336000⟩
                                                        c66 = OverlayImageLayer(ressource=mid36 21, x=0, y=3, image=0)  ⟨336009⟩
                                                        c67 = OverlayImageLayer(ressource=mid36 24, x=-140, y=3, image=0)  ⟨336018⟩
                                                        palette_copie(destination=pal1, source=pal4(mid36 36))  ⟨336028⟩
                                                        palette_copie(destination=pal1, source=pal3(midgames 45))  ⟨336037⟩
                                                        palette_copie(destination=pal1, source=pal5(mid36 37))  ⟨336046⟩
                                                        ajoute c59 à scène12                          ⟨336051⟩
                                                        ajoute c60 à scène12                          ⟨336056⟩
                                                        ajoute c61 à scène12                          ⟨336061⟩
                                                        ajoute c67 à scène12                          ⟨336066⟩
                                                        ajoute c64 à scène12                          ⟨336071⟩
                                                        ajoute c63 à scène12                          ⟨336076⟩
                                                        ajoute c66 à scène12                          ⟨336081⟩
                                                        ajoute c65 à scène12                          ⟨336086⟩
                                                        ajoute c62 à scène12                          ⟨336091⟩
                                                        c62.image = 2                                 ⟨336098⟩
                                                        c63.image = 2                                 ⟨336100⟩
                                                        c64.image = 1                                 ⟨336102⟩
                                                        c66.image = 9                                 ⟨336104⟩
                                                        c65.image = 1                                 ⟨336106⟩
                                                        c67.image = 1                                 ⟨336108⟩
                                                        palette_envoie(palette=pal1, pas=0)           ⟨336115⟩
                                                        v412 = 3                                      ⟨336117⟩
                                                        v414 = 10                                     ⟨336118⟩
                                                        v416 = 8                                      ⟨336119⟩
                                                        v418 = 3                                      ⟨336120⟩
                                                        v420 = 3                                      ⟨336121⟩
                                                        v422 = 10                                     ⟨336122⟩
                                                        scène12.compteur = 0                          ⟨336123⟩
                                                        tant que (v422 + 25 > scène12.compteur) et (scène12.terminée == 0) :
                                                            v424 = scène12.compteur                   ⟨336129⟩
                                                            si v424 == 14 :
                                                                c65.image = 2                         ⟨336133⟩
                                                            si v424 == 16 :
                                                                c64.image = 2                         ⟨336139⟩
                                                            si v424 > 1 :
                                                                si v424 < v422 :
                                                                    CRT_Rand()                        ⟨336147⟩
                                                                    v426 = ((CRT_Rand()·2) / 32768) + 1  ⟨336154⟩
                                                                    c62.image = v426                  ⟨336157⟩
                                                            si v422 + 1 == v424 :
                                                                si v9 != 0 :
                                                                    v428 = word_48ED4                 ⟨336167⟩
                                                                    v430 = 0                          ⟨336168⟩
                                                                    si canal1.+0 != 0 :
                                                                        AIL_start_sequence(pilote=canal1.+0→4, séquence=v3198)  ⟨336174⟩
                                                                        AIL_set_relative_volume_30C66(canal1.+0→4, v3198, v428, v430)  ⟨336181⟩
                                                            si v422 - 1 < v424 :
                                                                si v422 + 7 > v424 :
                                                                    v432 = v420                       ⟨336195⟩
                                                                    v420_avant = v420                 ⟨336196⟩
                                                                    v420 = v420 + 1                   ⟨336196⟩
                                                                    c62.image = v432                  ⟨336199⟩
                                                            si v422 + 10 < v424 :
                                                                si v422 + 13 > v424 :
                                                                    v434 = v412                       ⟨336211⟩
                                                                    v412_avant = v412                 ⟨336212⟩
                                                                    v412 = v412 + 1                   ⟨336212⟩
                                                                    c63.image = v434                  ⟨336215⟩
                                                            si v422 + 12 < v424 :
                                                                si v422 + 15 > v424 :
                                                                    v436 = v414                       ⟨336227⟩
                                                                    v414_avant = v414                 ⟨336228⟩
                                                                    v414 = v414 + 1                   ⟨336228⟩
                                                                    c66.image = v436                  ⟨336231⟩
                                                            si v422 + 10 < v424 :
                                                                si v422 + 14 > v424 :
                                                                    v438 = v416                       ⟨336243⟩
                                                                    v416_avant = v416                 ⟨336244⟩
                                                                    v416 = v416 + 1                   ⟨336244⟩
                                                                    c67.image = v438                  ⟨336247⟩
                                                            si v422 + 9 < v424 :
                                                                si v422 + 13 > v424 :
                                                                    v440 = v418                       ⟨336259⟩
                                                                    v418_avant = v418                 ⟨336260⟩
                                                                    v418 = v418 + 1                   ⟨336260⟩
                                                                    c65.image = v440                  ⟨336263⟩
                                                            Scene_Tick(scène=scène12)                 ⟨336277⟩
                                                        Scene_Destruct(scène=scène12, drapeaux=0)     ⟨336307⟩
                                                        canal_arrête(canal=canal1)                    ⟨336437⟩
                                                        si byte_495FC == 0 :
                                                            v3198 = -1                                ⟨336490⟩
                                                            si v9 != 0 :
                                                                charge(asoundfx 33)                   ⟨336499⟩
                                                                canal_init(canal=canal1, pilote=word_46849)  ⟨336504⟩
                                                                canal_enregistre(canal=canal1, ressource=asoundfx 33, x=0)  ⟨336511⟩
                                                            charge(mid36 17)                          ⟨336525⟩
                                                            charge(mid36 29)                          ⟨336537⟩
                                                            charge(mid36 19)                          ⟨336549⟩
                                                            charge(mid36 28)                          ⟨336561⟩
                                                            charge(mid36 10)                          ⟨336573⟩
                                                            charge(mid36 9)                           ⟨336585⟩

                                                            ──── scène13 ────
                                                            scène13 = Scene_Create(cadence=9, palette=255, surface=&v534)  ⟨336593⟩
                                                            c68 = MovingLayer(ressource=midgames 42, x=0, y=-80)  ⟨336606⟩
                                                            c68.vx = 0                                ⟨336613⟩
                                                            c68.vy = 0                                ⟨336615⟩
                                                            c68.vx = 0                                ⟨336617⟩
                                                            c68.vy = 0                                ⟨336619⟩
                                                            c69 = MovingLayer(ressource=mid36 19, x=0, y=0)  ⟨336640⟩
                                                            c69.vx = 0                                ⟨336647⟩
                                                            c69.vy = 0                                ⟨336649⟩
                                                            c69.vx = 0                                ⟨336651⟩
                                                            c69.vy = 0                                ⟨336653⟩
                                                            c70 = MovingLayer(ressource=mid36 17, x=0, y=-80)  ⟨336674⟩
                                                            c70.vx = 0                                ⟨336681⟩
                                                            c70.vy = 0                                ⟨336683⟩
                                                            c70.vx = 0                                ⟨336685⟩
                                                            c70.vy = 0                                ⟨336687⟩
                                                            c71 = MovingLayer(ressource=mid36 28, x=0, y=0)  ⟨336708⟩
                                                            c71.vx = 0                                ⟨336715⟩
                                                            c71.vy = 0                                ⟨336717⟩
                                                            c71.vx = 0                                ⟨336719⟩
                                                            c71.vy = 0                                ⟨336721⟩
                                                            c72 = MovingLayer(ressource=mid36 29, x=0, y=0)  ⟨336742⟩
                                                            c72.vx = 0                                ⟨336749⟩
                                                            c72.vy = 0                                ⟨336751⟩
                                                            c72.vx = 0                                ⟨336753⟩
                                                            c72.vy = 0                                ⟨336755⟩
                                                            c73 = MovingLayer(ressource=mid36 9, x=0, y=0)  ⟨336776⟩
                                                            c73.vx = 0                                ⟨336783⟩
                                                            c73.vy = 0                                ⟨336785⟩
                                                            c73.vx = 0                                ⟨336787⟩
                                                            c73.vy = 0                                ⟨336789⟩
                                                            c74 = MovingOverlayLayer(ressource=mid36 3, x=0, y=0, vx=0, vy=0, image=2)  ⟨336807⟩
                                                            c75 = MovingLayer(ressource=mid36 10, x=0, y=0)  ⟨336821⟩
                                                            c75.vx = 0                                ⟨336828⟩
                                                            c75.vy = 0                                ⟨336830⟩
                                                            c75.vx = 0                                ⟨336832⟩
                                                            c75.vy = 0                                ⟨336834⟩
                                                            palette_copie(destination=pal1, source=pal2(midgames 43))  ⟨336851⟩
                                                            palette_copie(destination=pal1, source=pal6(mid36 30))  ⟨336860⟩
                                                            palette_copie(destination=pal1, source=pal7(midgames 47))  ⟨336869⟩
                                                            ajoute c68 à scène13                      ⟨336874⟩
                                                            ajoute c69 à scène13                      ⟨336879⟩
                                                            ajoute c71 à scène13                      ⟨336884⟩
                                                            ajoute c72 à scène13                      ⟨336889⟩
                                                            ajoute c73 à scène13                      ⟨336894⟩
                                                            ajoute c74 à scène13                      ⟨336899⟩
                                                            ajoute c75 à scène13                      ⟨336904⟩
                                                            ajoute c70 à scène13                      ⟨336909⟩
                                                            palette_envoie(palette=pal1, pas=0)       ⟨336921⟩
                                                            v414 = 0                                  ⟨336923⟩
                                                            v416 = 0                                  ⟨336924⟩
                                                            tant que (scène13.compteur < 185) et (scène13.terminée == 0) :
                                                                v418 = scène13.compteur               ⟨336930⟩
                                                                si v418 > 8 :
                                                                    si v418 < 14 :
                                                                        v420 = v416                   ⟨336936⟩
                                                                        v416_avant = v416             ⟨336937⟩
                                                                        v416 = v416 + 1               ⟨336937⟩
                                                                        c73.image = v420              ⟨336940⟩
                                                                si v418 == 20 :
                                                                    c68.vx = 0                        ⟨336950⟩
                                                                    c68.vy = 1                        ⟨336952⟩
                                                                    c69.vx = 0                        ⟨336954⟩
                                                                    c69.vy = 1                        ⟨336956⟩
                                                                    c70.vx = 0                        ⟨336958⟩
                                                                    c70.vy = 1                        ⟨336960⟩
                                                                    c71.vx = 0                        ⟨336962⟩
                                                                    c71.vy = 2                        ⟨336964⟩
                                                                    c72.vx = 0                        ⟨336966⟩
                                                                    c72.vy = 3                        ⟨336968⟩
                                                                    c73.vx = 0                        ⟨336970⟩
                                                                    c73.vy = 3                        ⟨336972⟩
                                                                    c74.vx = 0                        ⟨336974⟩
                                                                    c74.vy = 3                        ⟨336976⟩
                                                                    c75.vx = 0                        ⟨336978⟩
                                                                    c75.vy = 4                        ⟨336980⟩
                                                                si v418 == 100 :
                                                                    c68.vx = 0                        ⟨336986⟩
                                                                    c68.vy = 0                        ⟨336988⟩
                                                                    c69.vx = 0                        ⟨336990⟩
                                                                    c69.vy = 0                        ⟨336992⟩
                                                                    c70.vx = 0                        ⟨336994⟩
                                                                    c70.vy = 0                        ⟨336996⟩
                                                                    c71.vx = 0                        ⟨336998⟩
                                                                    c71.vy = 0                        ⟨337000⟩
                                                                si v418 == 80 :
                                                                    c72.vx = 0                        ⟨337006⟩
                                                                    c72.vy = 0                        ⟨337008⟩
                                                                    c73.vx = 0                        ⟨337010⟩
                                                                    c73.vy = 0                        ⟨337012⟩
                                                                si v418 == 60 :
                                                                    c74.vx = 0                        ⟨337018⟩
                                                                    c74.vy = 0                        ⟨337020⟩
                                                                    c75.vx = 0                        ⟨337022⟩
                                                                    c75.vy = 0                        ⟨337024⟩
                                                                si v414 == 82 :
                                                                    v414 = v414 + 1                   ⟨337029⟩
                                                                    retire(parent=scène13, calque=c70)  ⟨337033⟩
                                                                    c70.détruit(3)                    ⟨337041⟩
                                                                si v418 == 99 :
                                                                    Scene_SetFps(scène=scène13, cadence=12)  ⟨337051⟩
                                                                si v418 > 99 :
                                                                    si v414 < 82 :
                                                                        v422 = v414                   ⟨337060⟩
                                                                        v414_avant = v414             ⟨337061⟩
                                                                        v414 = v414 + 1               ⟨337061⟩
                                                                        c70.image = v422              ⟨337064⟩
                                                                si v418 == 108 :
                                                                    si v9 != 0 :
                                                                        v424 = word_48EE4             ⟨337072⟩
                                                                        v426 = 0                      ⟨337073⟩
                                                                        si canal1.+0 != 0 :
                                                                            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3198)  ⟨337079⟩
                                                                            AIL_set_relative_volume_30C66(canal1.+0→4, v3198, v424, v426)  ⟨337086⟩
                                                                si v418 == 118 :
                                                                    si v9 != 0 :
                                                                        v428 = word_48EE4             ⟨337096⟩
                                                                        v430 = 0                      ⟨337097⟩
                                                                        si canal1.+0 != 0 :
                                                                            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3198)  ⟨337103⟩
                                                                            AIL_set_relative_volume_30C66(canal1.+0→4, v3198, v428, v430)  ⟨337110⟩
                                                                si v414 == 75 :
                                                                    si v9 != 0 :
                                                                        v432 = word_48EE4 - 60        ⟨337121⟩
                                                                        v434 = 0                      ⟨337122⟩
                                                                        si canal1.+0 != 0 :
                                                                            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3198)  ⟨337128⟩
                                                                            AIL_set_relative_volume_30C66(canal1.+0→4, v3198, v432, v434)  ⟨337135⟩
                                                                Scene_Tick(scène=scène13)             ⟨337151⟩
                                                            Scene_Destruct(scène=scène13, drapeaux=0)  ⟨337179⟩
                                                            canal_arrête(canal=canal1)                ⟨337291⟩
                                                            fondu_disparition(palette=pal1, couleur=&v26, pas=2, premier=0, nombre=256)  ⟨337336⟩
loc_BD722:                                                                                            ⟨337339⟩
v288 = 0                                                                                              ⟨337364⟩
v283 = 0                                                                                              ⟨337365⟩
v282 = 0                                                                                              ⟨337366⟩
voix_arrête(voix=voix1)                                                                               ⟨337747⟩
canal_arrête(canal=canal2)                                                                            ⟨337769⟩
retour                                                                                                ⟨337853⟩
```

## Tableaux du segment de données

