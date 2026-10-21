# Script extrait de `sub_81470` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## sub_81470

```
bp = sp                                                                                               ⟨250596⟩
tableau_textes(tableau=textes1, nombre=29, longueur=200)                                              ⟨250606⟩
byte_495FC = 0                                                                                        ⟨250608⟩
v9 = 0                                                                                                ⟨250609⟩
v10 = 0                                                                                               ⟨250610⟩
v11 = 0                                                                                               ⟨250611⟩
si word_4684B != 0 :
    v10 = 1                                                                                           ⟨250614⟩
v14 = word_46F46                                                                                      ⟨250618⟩
v368 = 0                                                                                              ⟨250619⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v368, v14)                                                      ⟨250624⟩
v382 = 0                                                                                              ⟨250626⟩
TextRenderer_ApplyFormatChange_2EA21(&v382, 0)                                                        ⟨250635⟩
SmallObject_RegisterInList_2CB40(&v18, &v382)                                                         ⟨250641⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨250647⟩
v28 = 0                                                                                               ⟨250653⟩
si v10 != 0 :
    si sub_6734(chemin1) == 0 : aller à loc_815CE                                                     ⟨250695⟩
    pak mid12voc.ouvre(chemin1, 1)                                                                    ⟨250702⟩
sinon :
    v10 = 0                                                                                           ⟨250709⟩
v38 = 0                                                                                               ⟨250712⟩
v33 = 0                                                                                               ⟨250714⟩
v32 = 0                                                                                               ⟨250715⟩
v40 = byte_46848                                                                                      ⟨250717⟩
si v40 != 1 :
    si v40 == 2 : aller à loc_81788                                                                   ⟨250727⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨250763⟩
        flux_iff(flux=flux1)                                                                          ⟨250777⟩
        v2971 = 256                                                                                   ⟨250780⟩
        v2975 = 0                                                                                     ⟨250781⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨250789⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨250795⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨250801⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨250805⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨250807⟩
        v222 = 1                                                                                      ⟨250808⟩
        tant que v222 <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨250815⟩
            ds:24192[v222·2] = iff_lit_mot(flux=flux1)                                                ⟨250819⟩
            v222_avant = v222·2                                                                       ⟨250820⟩
            v222 = v222 + 1                                                                           ⟨250820⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨250827⟩
        v11 = 1                                                                                       ⟨250829⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨250833⟩
    si sub_6734(chemin1) != 0 :
        v9 = 1                                                                                        ⟨250859⟩
        si v11 == 0 :
            word_48F76 = 90                                                                           ⟨250864⟩
    aller à loc_818FD                                                                                 ⟨250868⟩
    loc_81788:                                                                                        ⟨250871⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨250899⟩
        flux_iff(flux=flux1)                                                                          ⟨250913⟩
        v2971 = 256                                                                                   ⟨250916⟩
        v2975 = 0                                                                                     ⟨250917⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨250925⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨250931⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨250937⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨250941⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨250943⟩
        v222 = 1                                                                                      ⟨250944⟩
        tant que v222 <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨250951⟩
            ds:24192[v222·2] = iff_lit_mot(flux=flux1)                                                ⟨250955⟩
            v222_avant = v222·2                                                                       ⟨250956⟩
            v222 = v222 + 1                                                                           ⟨250956⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨250963⟩
        v11 = 1                                                                                       ⟨250965⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨250969⟩
    si sub_6734(chemin1) != 0 :
        v9 = 1                                                                                        ⟨250995⟩
        si v11 == 0 :
            word_48F76 = 255                                                                          ⟨251000⟩
loc_818FD:                                                                                            ⟨251006⟩
v42 = word_45174                                                                                      ⟨251009⟩
si v11 != 0 :
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨251025⟩
    v222 = 0                                                                                          ⟨251027⟩
    tant que v222 < 2 :
        charge(asoundfx (v222 + &v42)→0)                                                              ⟨251047⟩
        canal_enregistre(canal=canal1, ressource=asoundfx (v222 + &v42)→0, x=0)                       ⟨251054⟩
        canal_arrête(canal=canal1)                                                                    ⟨251058⟩
        v226 = 0                                                                                      ⟨251078⟩
        v222 = v222 + 1                                                                               ⟨251079⟩
    canal_arrête(canal=canal1)                                                                        ⟨251090⟩
    v2910 = 0                                                                                         ⟨251108⟩
v752 = 0                                                                                              ⟨251113⟩
v747 = 0                                                                                              ⟨251115⟩
v746 = 0                                                                                              ⟨251116⟩
v756 = 0                                                                                              ⟨251117⟩
si v9 != 0 :
    si v10 != 0 :
        v221 = 7                                                                                      ⟨251130⟩
    sinon :
        v221 = 6                                                                                      ⟨251135⟩
    charge(amusic v221)                                                                               ⟨251146⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨251151⟩
    canal_enregistre(canal=canal2, ressource=amusic v221, x=0)                                        ⟨251158⟩
v765 = booléen                                                                                        ⟨251175⟩
v761 = booléen                                                                                        ⟨251176⟩
si v10 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨251186⟩
    flux_iff(flux=flux1)                                                                              ⟨251200⟩
    v2971 = 256                                                                                       ⟨251203⟩
    v2975 = 0                                                                                         ⟨251204⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨251212⟩
    iff_form(flux=flux1, balise='MG12', x=0)                                                          ⟨251218⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨251224⟩
    v222 = 0                                                                                          ⟨251226⟩
    tant que v222 < 2 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨251235⟩
        v224 = v2954                                                                                  ⟨251238⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·v222), taille=v224)                  ⟨251249⟩
        v2967 = v2950                                                                                 ⟨251252⟩
        v222 = v222 + 1                                                                               ⟨251253⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨251260⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨251265⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨251288⟩
    v2971 = 256                                                                                       ⟨251291⟩
    v2975 = 0                                                                                         ⟨251292⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨251300⟩
    iff_form(flux=flux1, balise='MG12', x=0)                                                          ⟨251306⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨251312⟩
    v222 = 0                                                                                          ⟨251314⟩
    tant que v222 < 29 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨251323⟩
        v224 = v2954                                                                                  ⟨251326⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·v222), taille=v224)                  ⟨251337⟩
        v2967 = v2950                                                                                 ⟨251340⟩
        v222 = v222 + 1                                                                               ⟨251341⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨251348⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[22], arg_6)                                                                ⟨251362⟩
        CRT_Strcat(textes1[22], 8534)                                                                 ⟨251371⟩
        CRT_Strcat(textes1[22], textes1[23])                                                          ⟨251385⟩
    sinon :
        si CRT_Strlen(arg_8) != 0 :
            CRT_Strcat(textes1[22], arg_8)                                                            ⟨251403⟩
            CRT_Strcat(textes1[22], 8534)                                                             ⟨251412⟩
            CRT_Strcat(textes1[22], textes1[23])                                                      ⟨251426⟩
        sinon :
            si CRT_Strlen(arg_10) != 0 :
                CRT_Strcat(textes1[22], arg_10)                                                       ⟨251444⟩
                CRT_Strcat(textes1[22], 8534)                                                         ⟨251453⟩
                CRT_Strcat(textes1[22], textes1[23])                                                  ⟨251467⟩
            sinon :
                CRT_Strcat(textes1[22], textes1[23])                                                  ⟨251485⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨251493⟩
charge(mid12 4)                                                                                       ⟨251512⟩
charge(mid12 3)                                                                                       ⟨251524⟩
charge(mid12 5)                                                                                       ⟨251536⟩
charge(mid12 8)                                                                                       ⟨251548⟩
charge(mid12 9)                                                                                       ⟨251560⟩
charge(mid12 6)                                                                                       ⟨251572⟩
charge_convdata_type2("normal")                                                                       ⟨251582⟩
palette_depuis(pal2(convdata type 2 "normal"))                                                        ⟨251589⟩
charge(mid12 21)                                                                                      ⟨251601⟩
palette_depuis(pal3(mid12 21))                                                                        ⟨251608⟩
charge(mid12 20)                                                                                      ⟨251620⟩
palette_depuis(pal4(mid12 20))                                                                        ⟨251627⟩
charge(mid12 22)                                                                                      ⟨251639⟩
palette_depuis(pal5(mid12 22))                                                                        ⟨251646⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨251656⟩
charge_convdata_type0("walt", drapeau=3)                                                              ⟨251666⟩
v196 = 0                                                                                              ⟨251668⟩
v192 = 2                                                                                              ⟨251669⟩
v191 = 0                                                                                              ⟨251670⟩
v190 = 0                                                                                              ⟨251671⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨251685⟩
v198 = ?                                                                                              ⟨251687⟩
v200 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                ⟨251688⟩
v196 = v200                                                                                           ⟨251690⟩
v192 = 2                                                                                              ⟨251691⟩
v191 = 1                                                                                              ⟨251692⟩
v190 = 0                                                                                              ⟨251693⟩
GlyphObject_ConstructWithBuffer_311CF(&v2866, &v196)                                                  ⟨251698⟩
v210 = word_46F46                                                                                     ⟨251705⟩
zone_texte(zone=zone1, police=&v2866)                                                                 ⟨251711⟩
v212 = 152                                                                                            ⟨251715⟩
v214 = 319                                                                                            ⟨251717⟩
v216 = 199                                                                                            ⟨251719⟩
v2875 = 0                                                                                             ⟨251721⟩
v2873 = v212                                                                                          ⟨251723⟩
v2871 = v214                                                                                          ⟨251725⟩
v2869 = v216                                                                                          ⟨251727⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨251731⟩
Widget_Method_Dispatch8_314A9(zone1, 200)                                                             ⟨251736⟩
si byte_495FC == 0 :
    si v9 != 0 :
        v218 = word_48F76                                                                             ⟨251747⟩
        si canal2.+0 != 0 :
            AIL_start_sequence(pilote=canal2.+0→4, séquence=v754)                                     ⟨251754⟩
            AIL_set_relative_volume_30C66(canal2.+0→4, v754, v218, 0)                                 ⟨251761⟩
    charge(mid12 1)                                                                                   ⟨251777⟩
    charge(mid12 18)                                                                                  ⟨251789⟩
    palette_depuis(pal6(mid12 18))                                                                    ⟨251796⟩

    ──── scène1 ────
    scène1 = Scene_Create(cadence=10, palette=255, surface=&v368)                                     ⟨251804⟩
    c1 = Layer(ressource=mid12 1)                                                                     ⟨251809⟩
    palette_copie(destination=pal1, source=pal6(mid12 18))                                            ⟨251819⟩
    ajoute c1 à scène1                                                                                ⟨251824⟩
    fondu_disparition(palette=pal1, couleur=&v28, pas=0, premier=0, nombre=256)                       ⟨251837⟩
    palette_copie(destination=pal1, source=pal6(mid12 18))                                            ⟨251846⟩
    Scene_Tick(scène=scène1)                                                                          ⟨251850⟩
    fondu_apparition(palette=pal1, couleur=&v28, pas=2, premier=0, nombre=256)                        ⟨251859⟩
    Widget_Method_DispatchC_314CB(zone1, 0)                                                           ⟨251864⟩
    Widget_Method_Dispatch8_314A9(zone1, 239)                                                         ⟨251869⟩
    tant que (scène1.compteur < 29) et (scène1.terminée == 0) :
        v250 = scène1.compteur                                                                        ⟨251876⟩
        si v250 == 8 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[0])                              ⟨251882⟩
        si v250 == 28 :
            v2946 = 4540                                                                              ⟨251888⟩
            v2946 = 4552                                                                              ⟨251889⟩
            v2946 = 4568                                                                              ⟨251890⟩
            v2946 = 4584                                                                              ⟨251891⟩
            v2946 = 4604                                                                              ⟨251892⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)        ⟨251902⟩
        Scene_Tick(scène=scène1)                                                                      ⟨251934⟩
    tant que (scène1.compteur < 55) et (scène1.terminée == 0) :
        v250 = scène1.compteur                                                                        ⟨251965⟩
        si v250 == 32 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[1])                              ⟨251973⟩
        si v250 == 53 :
            v2946 = 4540                                                                              ⟨251979⟩
            v2946 = 4552                                                                              ⟨251980⟩
            v2946 = 4568                                                                              ⟨251981⟩
            v2946 = 4584                                                                              ⟨251982⟩
            v2946 = 4604                                                                              ⟨251983⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)        ⟨251993⟩
        Scene_Tick(scène=scène1)                                                                      ⟨252025⟩
    fondu_disparition(palette=pal1, couleur=&v28, pas=0, premier=0, nombre=256)                       ⟨252058⟩
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨252063⟩
    r16(mid12 18).+0 = 0                                                                              ⟨252086⟩
    v224 = 0                                                                                          ⟨252107⟩
    si byte_495FC == 0 :
        v224 = 0                                                                                      ⟨252117⟩
        charge(mid12 7)                                                                               ⟨252124⟩

        ──── scène2 ────
        scène2 = Scene_Create(cadence=9, palette=255, surface=&v368)                                  ⟨252132⟩
        c2 = Layer(ressource=mid12 5, x=0, y=0)                                                       ⟨252139⟩
        c3 = ScaledImageLayer(ressource=mid12 6, x=44, y=17, angle=0, échelle=200, octet=0, image=0)  ⟨252151⟩
        c4 = ScaledImageLayer(ressource=mid12 7, x=44, y=17, angle=0, échelle=200, octet=0, image=0)  ⟨252163⟩
        palette_copie(destination=pal1, source=pal5(mid12 22))                                        ⟨252173⟩
        ajoute c2 à scène2                                                                            ⟨252178⟩
        ajoute c3 à scène2                                                                            ⟨252183⟩
        ajoute c4 à scène2                                                                            ⟨252188⟩
        palette_envoie(palette=pal1, pas=0)                                                           ⟨252200⟩
        v238 = 0                                                                                      ⟨252202⟩
        tant que (scène2.compteur < 42) et (scène2.terminée == 0) :
            r16(mid12 18).+0 = scène2.compteur                                                        ⟨252208⟩
            si mid12 10.+0 > 7 :
                si mid12 10.+0 < 13 :
                    v242 = v238                                                                       ⟨252214⟩
                    v238_avant = v238                                                                 ⟨252215⟩
                    v238 = v238 + 1                                                                   ⟨252215⟩
                    c4.image = v242                                                                   ⟨252218⟩
            si mid12 10.+0 > 24 :
                si mid12 10.+0 < 28 :
                    v238 = v238 - 1                                                                   ⟨252226⟩
                    v244 = v238                                                                       ⟨252228⟩
                    c4.image = v244                                                                   ⟨252231⟩
            si mid12 10.+0 > 28 :
                si mid12 10.+0 < 32 :
                    si mid12 10.+0 & 1 != 0 :
                        v238 = v238 - 1                                                               ⟨252241⟩
                        pal6(mid12 18).+0 = v238                                                      ⟨252243⟩
                        c4.image = pal6(mid12 19).+0                                                  ⟨252246⟩
            Scene_Tick(scène=scène2)                                                                  ⟨252262⟩
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨252291⟩
        v224 = 0                                                                                      ⟨252311⟩
        si byte_495FC == 0 :
            v224 = 0                                                                                  ⟨252321⟩
            charge(mid12 15)                                                                          ⟨252328⟩
            r16(mid12 18).+0 = 0                                                                      ⟨252330⟩
            v234 = 0                                                                                  ⟨252333⟩
            charge(mid12 14)                                                                          ⟨252340⟩
            charge(mid12 24)                                                                          ⟨252352⟩
            palette_depuis(pal7(mid12 24))                                                            ⟨252359⟩

            ──── scène3 ────
            scène3 = Scene_Create(cadence=10, palette=255, surface=&v368)                             ⟨252367⟩
            c5 = Layer(ressource=mid12 3, x=0, y=0)                                                   ⟨252374⟩
            c6 = Layer(ressource=mid12 15, x=0, y=0)                                                  ⟨252382⟩
            c7 = ImageLayer(ressource=mid12 14, x=215, y=10, image=0)                                 ⟨252391⟩
            ajoute c5 à scène3                                                                        ⟨252397⟩
            ajoute c6 à scène3                                                                        ⟨252402⟩
            ajoute c7 à scène3                                                                        ⟨252407⟩
            palette_copie(destination=pal1, source=pal4(mid12 20))                                    ⟨252416⟩
            palette_copie(destination=pal1, source=pal7(mid12 24))                                    ⟨252425⟩
            palette_envoie(palette=pal1, pas=0)                                                       ⟨252437⟩
            si v10 != 0 :
                Scene_Tick(scène=scène3)                                                              ⟨252447⟩
                charge(mid12voc 5)                                                                    ⟨252459⟩
                voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid12voc 5)                     ⟨252465⟩
                v274 = 0                                                                              ⟨252467⟩
                tant que v274 < 8 :
                    si v274 > 1 :
                        si v274 < 7 :
                            c7.méthode24(v274 - 13, 0)                                                ⟨252483⟩
                    Scene_Tick(scène=scène3)                                                          ⟨252490⟩
                    v274 = v274 + 1                                                                   ⟨252492⟩
                voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                       ⟨252500⟩
                tant que voix_en_cours(voix=voix1) != 0 :
                    Scene_Tick(scène=scène3)                                                          ⟨252518⟩
                voix_arrête(voix=voix1)                                                               ⟨252532⟩
                v266 = 0                                                                              ⟨252552⟩
            sinon :
                Widget_Method_DispatchC_314CB(zone1, 0)                                               ⟨252560⟩
                Widget_Method_Dispatch8_314A9(zone1, 254)                                             ⟨252565⟩
                v4 = 32                                                                               ⟨252567⟩
                si = scène3.compteur                                                                  ⟨252568⟩
                tant que (scène3.compteur < si + ((v4·70) / 100)) et (scène3.terminée == 0) :
                    v264 = scène3.compteur                                                            ⟨252583⟩
                    si v264 > 1 :
                        si v264 < 7 :
                            c7.méthode24(v264 - 13, 0)                                                ⟨252595⟩
                    si v264 == 8 :
                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[2])                  ⟨252609⟩
                    si (si + ((v4·70) / 100)) - 1 == v264 :
                        v2946 = 4540                                                                  ⟨252617⟩
                        v2946 = 4552                                                                  ⟨252618⟩
                        v2946 = 4568                                                                  ⟨252619⟩
                        v2946 = 4584                                                                  ⟨252620⟩
                        v2946 = 4604                                                                  ⟨252621⟩
                        Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨252631⟩
                    Scene_Tick(scène=scène3)                                                          ⟨252663⟩
            Scene_Destruct(scène=scène3, drapeaux=0)                                                  ⟨252692⟩
            v244 = 0                                                                                  ⟨252717⟩
            r16(mid12 14).+0 = 0                                                                      ⟨252734⟩
            v234 = 0                                                                                  ⟨252736⟩
            v224 = 0                                                                                  ⟨252755⟩
            si byte_495FC == 0 :
                v224 = 0                                                                              ⟨252765⟩
                charge(mid12 2)                                                                       ⟨252772⟩
                r16(mid12 14).+0 = 0                                                                  ⟨252774⟩
                v234 = 0                                                                              ⟨252777⟩
                charge(mid12 19)                                                                      ⟨252784⟩
                palette_depuis(pal6(mid12 19))                                                        ⟨252791⟩

                ──── scène4 ────
                scène4 = Scene_Create(cadence=12, palette=255, surface=&v368)                         ⟨252799⟩
                c8 = Layer(ressource=mid12 3, x=0, y=0)                                               ⟨252806⟩
                c9 = Layer(ressource=mid12 2, x=-10, y=0)                                             ⟨252814⟩
                ajoute c8 à scène4                                                                    ⟨252820⟩
                ajoute c9 à scène4                                                                    ⟨252825⟩
                palette_copie(destination=pal1, source=pal4(mid12 20))                                ⟨252834⟩
                palette_copie(destination=pal1, source=pal6(mid12 19))                                ⟨252843⟩
                palette_envoie(palette=pal1, pas=0)                                                   ⟨252855⟩
                si v10 != 0 :
                    Scene_Tick(scène=scène4)                                                          ⟨252861⟩
                    v252 = 0                                                                          ⟨252863⟩
                    tant que v252 < 20 :
                        Scene_Tick(scène=scène4)                                                      ⟨252870⟩
                        v252 = v252 + 1                                                               ⟨252872⟩
                sinon :
                    Widget_Method_DispatchC_314CB(zone1, 0)                                           ⟨252884⟩
                    Widget_Method_Dispatch8_314A9(zone1, 128)                                         ⟨252889⟩
                    v4 = 26                                                                           ⟨252891⟩
                    si = scène4.compteur                                                              ⟨252892⟩
                    tant que (scène4.compteur < si + ((v4·70) / 100)) et (scène4.terminée == 0) :
                        v252 = scène4.compteur                                                        ⟨252907⟩
                        si si + 2 == v252 :
                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[3])              ⟨252920⟩
                        si (si + ((v4·70) / 100)) - 1 == v252 :
                            v2946 = 4540                                                              ⟨252928⟩
                            v2946 = 4552                                                              ⟨252929⟩
                            v2946 = 4568                                                              ⟨252930⟩
                            v2946 = 4584                                                              ⟨252931⟩
                            v2946 = 4604                                                              ⟨252932⟩
                            Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨252942⟩
                        Scene_Tick(scène=scène4)                                                      ⟨252974⟩
                Scene_Destruct(scène=scène4, drapeaux=0)                                              ⟨253003⟩
                r16(mid12 19).+0 = 0                                                                  ⟨253026⟩
                v234 = 0                                                                              ⟨253028⟩
                v224 = 0                                                                              ⟨253047⟩
                si byte_495FC == 0 :

                    ──── scène5 ────
                    scène5 = Scene_Create(cadence=9, palette=255, surface=&v368)                      ⟨253060⟩
                    c10 = Layer(ressource=mid12 4, x=0, y=0)                                          ⟨253067⟩
                    CRT_Rand()                                                                        ⟨253071⟩
                    c11 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨253082⟩
                    ajoute c10 à scène5                                                               ⟨253088⟩
                    ajoute c11 à scène5                                                               ⟨253093⟩
                    palette_copie(destination=pal1, source=pal3(mid12 21))                            ⟨253102⟩
                    palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))            ⟨253111⟩
                    palette_envoie(palette=pal1, pas=0)                                               ⟨253123⟩
                    si v10 != 0 :
                        Scene_Tick(scène=scène5)                                                      ⟨253133⟩
                        charge(mid12voc 6)                                                            ⟨253145⟩
                        tête_voix(tête=c11, ressource=mid12voc 6, cadence=9)                          ⟨253151⟩
                        v236 = 0                                                                      ⟨253153⟩
                        tant que v236 < 3 :
                            Scene_Tick(scène=scène5)                                                  ⟨253160⟩
                            v236 = v236 + 1                                                           ⟨253162⟩
                        tant que tête_parle(tête=c11) != 0 :
                            Scene_Tick(scène=scène5)                                                  ⟨253183⟩
                        tête_image_de_base(tête=c11, image=22)                                        ⟨253196⟩
                        charge(mid12voc 7)                                                            ⟨253208⟩
                        tête_voix(tête=c11, ressource=mid12voc 7, cadence=9)                          ⟨253214⟩
                        v236 = 0                                                                      ⟨253216⟩
                        tant que v236 < 2 :
                            Scene_Tick(scène=scène5)                                                  ⟨253223⟩
                            v236 = v236 + 1                                                           ⟨253225⟩
                        tant que tête_parle(tête=c11) != 0 :
                            Scene_Tick(scène=scène5)                                                  ⟨253246⟩
                        v236 = 0                                                                      ⟨253257⟩
                        tant que v236 < 2 :
                            Scene_Tick(scène=scène5)                                                  ⟨253264⟩
                            v236 = v236 + 1                                                           ⟨253266⟩
                        tête_image_de_base(tête=c11, image=25)                                        ⟨253273⟩
                        charge(mid12voc 8)                                                            ⟨253285⟩
                        tête_voix(tête=c11, ressource=mid12voc 8, cadence=9)                          ⟨253291⟩
                        v236 = 0                                                                      ⟨253293⟩
                        tant que v236 < 2 :
                            Scene_Tick(scène=scène5)                                                  ⟨253300⟩
                            v236 = v236 + 1                                                           ⟨253302⟩
                        tant que tête_parle(tête=c11) != 0 :
                            Scene_Tick(scène=scène5)                                                  ⟨253323⟩
                        v236 = 0                                                                      ⟨253334⟩
                        tant que v236 < 4 :
                            Scene_Tick(scène=scène5)                                                  ⟨253341⟩
                            v236 = v236 + 1                                                           ⟨253343⟩
                        r16(mid12 19).+0 = 0                                                          ⟨253385⟩
                        v228 = 0                                                                      ⟨253404⟩
                    sinon :
                        v2880→0.méthode8(224)                                                         ⟨253413⟩
                        v4 = 35                                                                       ⟨253415⟩
                        si = scène5.compteur                                                          ⟨253416⟩
                        tant que (scène5.compteur < si + ((v4·70) / 100)) et (scène5.terminée == 0) :
                            v226 = scène5.compteur                                                    ⟨253431⟩
                            si si + 5 == v226 :
                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[4])          ⟨253443⟩
                            si si + 5 == v226 :
                                tête_texte_de_lèvres(tête=c11, texte="naitcndb")                      ⟨253453⟩
                            si (si + ((v4·70) / 100)) - 1 == v226 :
                                v2946 = 4540                                                          ⟨253461⟩
                                v2946 = 4552                                                          ⟨253462⟩
                                v2946 = 4568                                                          ⟨253463⟩
                                v2946 = 4584                                                          ⟨253464⟩
                                v2946 = 4604                                                          ⟨253465⟩
                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨253475⟩
                            Scene_Tick(scène=scène5)                                                  ⟨253507⟩
                        v4_avant = si + ((v4·70) / 100)                                               ⟨253533⟩
                        v4 = 46                                                                       ⟨253533⟩
                        si = scène5.compteur                                                          ⟨253534⟩
                        tant que (scène5.compteur < si + ((v4·70) / 100)) et (scène5.terminée == 0) :
                            v226 = scène5.compteur                                                    ⟨253549⟩
                            si si + 2 == v226 :
                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[5])          ⟨253562⟩
                            si si + 2 == v226 :
                                tête_texte_de_lèvres(tête=c11, texte="aftralweevamntoeechothr")       ⟨253572⟩
                            si si + 2 == v226 :
                                tête_image_de_base(tête=c11, image=22)                                ⟨253582⟩
                            si (si + ((v4·70) / 100)) - 1 == v226 :
                                v2946 = 4540                                                          ⟨253590⟩
                                v2946 = 4552                                                          ⟨253591⟩
                                v2946 = 4568                                                          ⟨253592⟩
                                v2946 = 4584                                                          ⟨253593⟩
                                v2946 = 4604                                                          ⟨253594⟩
                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨253604⟩
                            Scene_Tick(scène=scène5)                                                  ⟨253636⟩
                        v4_avant = si + ((v4·70) / 100)                                               ⟨253662⟩
                        v4 = 60                                                                       ⟨253662⟩
                        si = scène5.compteur                                                          ⟨253663⟩
                        tant que (scène5.compteur < si + ((v4·70) / 100)) et (scène5.terminée == 0) :
                            v226 = scène5.compteur                                                    ⟨253678⟩
                            si si + 1 == v226 :
                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])          ⟨253691⟩
                            si si + 1 == v226 :
                                tête_texte_de_lèvres(tête=c11, texte="uwdnthnkovlevga wthtpaeguzs")   ⟨253701⟩
                            si (si + ((v4·70) / 100)) - 1 == v226 :
                                v2946 = 4540                                                          ⟨253709⟩
                                v2946 = 4552                                                          ⟨253710⟩
                                v2946 = 4568                                                          ⟨253711⟩
                                v2946 = 4584                                                          ⟨253712⟩
                                v2946 = 4604                                                          ⟨253713⟩
                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨253723⟩
                            si (si + ((v4·70) / 100)) - 15 == v226 :
                                tête_image_de_base(tête=c11, image=25)                                ⟨253733⟩
                            Scene_Tick(scène=scène5)                                                  ⟨253765⟩
                    Scene_Destruct(scène=scène5, drapeaux=0)                                          ⟨253794⟩
                    si byte_495FC == 0 :

                        ──── scène6 ────
                        scène6 = Scene_Create(cadence=9, palette=255, surface=&v368)                  ⟨253808⟩
                        c12 = Layer(ressource=mid12 3, x=0, y=0)                                      ⟨253815⟩
                        CRT_Rand()                                                                    ⟨253819⟩
                        c13 = TalkingHead(ressource=convdata type 0 "walt", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨253830⟩
                        ajoute c12 à scène6                                                           ⟨253836⟩
                        ajoute c13 à scène6                                                           ⟨253841⟩
                        palette_copie(destination=pal1, source=pal4(mid12 20))                        ⟨253850⟩
                        palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))        ⟨253859⟩
                        palette_envoie(palette=pal1, pas=0)                                           ⟨253871⟩
                        si v10 != 0 :
                            Scene_Tick(scène=scène6)                                                  ⟨253881⟩
                            v228 = 0                                                                  ⟨253886⟩
                            charge(mid12voc 0)                                                        ⟨253893⟩
                            tête_voix(tête=c13, ressource=mid12voc 0, cadence=9)                      ⟨253899⟩
                            v236 = 0                                                                  ⟨253901⟩
                            tant que v236 < 3 :
                                Scene_Tick(scène=scène6)                                              ⟨253908⟩
                                v236 = v236 + 1                                                       ⟨253910⟩
                            v236 = 0                                                                  ⟨253915⟩
                            tant que tête_parle(tête=c13) != 0 :
                                si v236 == 10 :
                                    tête_image_de_base(tête=c13, image=16)                            ⟨253924⟩
                                si v236 == 13 :
                                    tête_image_de_base(tête=c13, image=-1)                            ⟨253932⟩
                                si v236 == 23 :
                                    tête_image_de_base(tête=c13, image=21)                            ⟨253940⟩
                                v236_avant = v236                                                     ⟨253945⟩
                                v236 = v236 + 1                                                       ⟨253945⟩
                                si v236_avant == 26 :
                                    tête_image_de_base(tête=c13, image=-1)                            ⟨253950⟩
                                Scene_Tick(scène=scène6)                                              ⟨253966⟩
                            tête_image_de_base(tête=c13, image=27)                                    ⟨253982⟩
                            v236 = 0                                                                  ⟨253984⟩
                            tant que v236 < 6 :
                                Scene_Tick(scène=scène6)                                              ⟨253991⟩
                                v236 = v236 + 1                                                       ⟨253993⟩
                            v228 = 0                                                                  ⟨254016⟩
                        sinon :
                            v2880→0.méthode8(183)                                                     ⟨254025⟩
                            v4 = 40                                                                   ⟨254027⟩
                            si = scène6.compteur                                                      ⟨254028⟩
                            tant que (scène6.compteur < si + ((v4·70) / 100)) et (scène6.terminée == 0) :
                                v226 = scène6.compteur                                                ⟨254043⟩
                                si si + 3 == v226 :
                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[7])      ⟨254056⟩
                                si si + 3 == v226 :
                                    tête_texte_de_lèvres(tête=c13, texte="nokrznta ah")               ⟨254066⟩
                                si si + 10 == v226 :
                                    tête_image_de_base(tête=c13, image=16)                            ⟨254076⟩
                                si si + 13 == v226 :
                                    tête_image_de_base(tête=c13, image=-1)                            ⟨254086⟩
                                si (si + ((v4·70) / 100)) - 2 == v226 :
                                    v2946 = 4540                                                      ⟨254094⟩
                                    v2946 = 4552                                                      ⟨254095⟩
                                    v2946 = 4568                                                      ⟨254096⟩
                                    v2946 = 4584                                                      ⟨254097⟩
                                    v2946 = 4604                                                      ⟨254098⟩
                                    Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨254108⟩
                                Scene_Tick(scène=scène6)                                              ⟨254140⟩
                            v4_avant = si + ((v4·70) / 100)                                           ⟨254166⟩
                            v4 = 30                                                                   ⟨254166⟩
                            si = scène6.compteur                                                      ⟨254167⟩
                            tant que (scène6.compteur < si + ((v4·70) / 100)) et (scène6.terminée == 0) :
                                v226 = scène6.compteur                                                ⟨254182⟩
                                si si + 1 == v226 :
                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])      ⟨254194⟩
                                si si + 1 == v226 :
                                    tête_texte_de_lèvres(tête=c13, texte="imjsta ah")                 ⟨254204⟩
                                si si + 10 == v226 :
                                    tête_image_de_base(tête=c13, image=21)                            ⟨254214⟩
                                si si + 13 == v226 :
                                    tête_image_de_base(tête=c13, image=-1)                            ⟨254224⟩
                                si (si + ((v4·70) / 100)) - 1 == v226 :
                                    v2946 = 4540                                                      ⟨254232⟩
                                    v2946 = 4552                                                      ⟨254233⟩
                                    v2946 = 4568                                                      ⟨254234⟩
                                    v2946 = 4584                                                      ⟨254235⟩
                                    v2946 = 4604                                                      ⟨254236⟩
                                    Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨254246⟩
                                Scene_Tick(scène=scène6)                                              ⟨254278⟩
                            v4_avant = si + ((v4·70) / 100)                                           ⟨254304⟩
                            v4 = 50                                                                   ⟨254304⟩
                            si = scène6.compteur                                                      ⟨254305⟩
                            tant que (scène6.compteur < si + ((v4·70) / 100)) et (scène6.terminée == 0) :
                                v226 = scène6.compteur                                                ⟨254320⟩
                                si si + 1 == v226 :
                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[9])      ⟨254333⟩
                                si si + 1 == v226 :
                                    tête_texte_de_lèvres(tête=c13, texte="sktglkchzfmikpnd")          ⟨254343⟩
                                si (si + ((v4·70) / 100)) - 6 == v226 :
                                    tête_image_de_base(tête=c13, image=27)                            ⟨254353⟩
                                si (si + ((v4·70) / 100)) - 1 == v226 :
                                    v2946 = 4540                                                      ⟨254361⟩
                                    v2946 = 4552                                                      ⟨254362⟩
                                    v2946 = 4568                                                      ⟨254363⟩
                                    v2946 = 4584                                                      ⟨254364⟩
                                    v2946 = 4604                                                      ⟨254365⟩
                                    Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨254375⟩
                                Scene_Tick(scène=scène6)                                              ⟨254407⟩
                        Scene_Destruct(scène=scène6, drapeaux=0)                                      ⟨254436⟩
                        si byte_495FC == 0 :
                            charge(mid12 0)                                                           ⟨254454⟩
                            charge(mid12 17)                                                          ⟨254466⟩
                            palette_depuis(pal8(mid12 17))                                            ⟨254473⟩

                            ──── scène7 ────
                            scène7 = Scene_Create(cadence=9, palette=255, surface=&v368)              ⟨254481⟩
                            c14 = Layer(ressource=mid12 0)                                            ⟨254486⟩
                            c15 = Layer(ressource=mid12 4, x=0, y=0)                                  ⟨254494⟩
                            CRT_Rand()                                                                ⟨254498⟩
                            c16 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨254509⟩
                            ajoute c15 à scène7                                                       ⟨254515⟩
                            ajoute c16 à scène7                                                       ⟨254520⟩
                            tête_image_de_base(tête=c16, image=23)                                    ⟨254524⟩
                            palette_copie(destination=pal1, source=pal3(mid12 21))                    ⟨254533⟩
                            palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))    ⟨254542⟩
                            palette_envoie(palette=pal1, pas=0)                                       ⟨254554⟩
                            si v10 != 0 :
                                Scene_Tick(scène=scène7)                                              ⟨254564⟩
                                charge(mid12voc 9)                                                    ⟨254576⟩
                                tête_voix(tête=c16, ressource=mid12voc 9, cadence=9)                  ⟨254582⟩
                                v264 = 0                                                              ⟨254584⟩
                                tant que v264 < 3 :
                                    Scene_Tick(scène=scène7)                                          ⟨254591⟩
                                    v264 = v264 + 1                                                   ⟨254593⟩
                                tant que tête_parle(tête=c16) != 0 :
                                    Scene_Tick(scène=scène7)                                          ⟨254614⟩
                                tête_image_de_base(tête=c16, image=19)                                ⟨254627⟩
                                v264 = 0                                                              ⟨254629⟩
                                tant que v264 < 6 :
                                    Scene_Tick(scène=scène7)                                          ⟨254636⟩
                                    v264 = v264 + 1                                                   ⟨254638⟩
                                ajoute c14 à scène7                                                   ⟨254646⟩
                                palette_copie(destination=pal1, source=pal8(mid12 17))                ⟨254655⟩
                                palette_envoie(palette=pal1, pas=0)                                   ⟨254667⟩
                                scène7.compteur = 0                                                   ⟨254669⟩
                                tant que (scène7.compteur < 12) et (scène7.terminée == 0) :
                                    Scene_Tick(scène=scène7)                                          ⟨254686⟩
                            sinon :
                                v2880→0.méthode8(224)                                                 ⟨254736⟩
                                v4 = 23                                                               ⟨254738⟩
                                si = scène7.compteur                                                  ⟨254739⟩
                                tant que (scène7.compteur < si + ((v4·70) / 100)) et (scène7.terminée == 0) :
                                    v254 = scène7.compteur                                            ⟨254754⟩
                                    si si + 3 == v254 :
                                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[10])  ⟨254767⟩
                                    si si + 3 == v254 :
                                        tête_texte_de_lèvres(tête=c16, texte="wdyrlgaga")             ⟨254777⟩
                                    si si + 7 == v254 :
                                        tête_image_de_base(tête=c16, image=19)                        ⟨254787⟩
                                    Scene_Tick(scène=scène7)                                          ⟨254803⟩
                                ajoute c14 à scène7                                                   ⟨254832⟩
                                palette_copie(destination=pal1, source=pal8(mid12 17))                ⟨254841⟩
                                palette_envoie(palette=pal1, pas=0)                                   ⟨254853⟩
                                Widget_Method_DispatchC_314CB(zone1, 0)                               ⟨254858⟩
                                Widget_Method_Dispatch8_314A9(zone1, 80)                              ⟨254863⟩
                                v4_avant = si + ((v4·70) / 100)                                       ⟨254865⟩
                                v4 = 20                                                               ⟨254865⟩
                                si = scène7.compteur                                                  ⟨254866⟩
                                tant que (scène7.compteur < si + ((v4·70) / 100)) et (scène7.terminée == 0) :
                                    v254 = scène7.compteur                                            ⟨254881⟩
                                    si v254 == si :
                                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[10])  ⟨254892⟩
                                    si (si + ((v4·70) / 100)) - 1 == v254 :
                                        v2946 = 4540                                                  ⟨254900⟩
                                        v2946 = 4552                                                  ⟨254901⟩
                                        v2946 = 4568                                                  ⟨254902⟩
                                        v2946 = 4584                                                  ⟨254903⟩
                                        v2946 = 4604                                                  ⟨254904⟩
                                        Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨254914⟩
                                    Scene_Tick(scène=scène7)                                          ⟨254946⟩
                            Scene_Destruct(scène=scène7, drapeaux=0)                                  ⟨254975⟩
                            r16(mid12 17).+0 = 0                                                      ⟨254998⟩
                            v224 = 0                                                                  ⟨255019⟩
                            si byte_495FC == 0 :

                                ──── scène8 ────
                                scène8 = Scene_Create(cadence=9, palette=255, surface=&v368)          ⟨255032⟩
                                c17 = Layer(ressource=mid12 3, x=0, y=0)                              ⟨255039⟩
                                CRT_Rand()                                                            ⟨255043⟩
                                c18 = TalkingHead(ressource=convdata type 0 "walt", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨255054⟩
                                tête_image_de_base(tête=c18, image=27)                                ⟨255059⟩
                                ajoute c17 à scène8                                                   ⟨255064⟩
                                ajoute c18 à scène8                                                   ⟨255069⟩
                                palette_copie(destination=pal1, source=pal4(mid12 20))                ⟨255078⟩
                                palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨255087⟩
                                palette_envoie(palette=pal1, pas=0)                                   ⟨255099⟩
                                si v10 != 0 :
                                    scène8.compteur = 0                                               ⟨255107⟩
                                    tant que (scène8.compteur < 12) et (scène8.terminée == 0) :
                                        v226 = scène8.compteur                                        ⟨255113⟩
                                        si v226 == 2 :
                                            tête_image_de_base(tête=c18, image=21)                    ⟨255118⟩
                                        si v226 == 11 :
                                            tête_image_de_base(tête=c18, image=-1)                    ⟨255126⟩
                                        Scene_Tick(scène=scène8)                                      ⟨255132⟩
                                    charge(mid12voc 1)                                                ⟨255163⟩
                                    tête_voix(tête=c18, ressource=mid12voc 1, cadence=9)              ⟨255169⟩
                                    v236 = 0                                                          ⟨255171⟩
                                    tant que v236 < 3 :
                                        Scene_Tick(scène=scène8)                                      ⟨255178⟩
                                        v236 = v236 + 1                                               ⟨255180⟩
                                    tant que tête_parle(tête=c18) != 0 :
                                        Scene_Tick(scène=scène8)                                      ⟨255217⟩
                                    v236 = 0                                                          ⟨255228⟩
                                    tant que v236 < 6 :
                                        Scene_Tick(scène=scène8)                                      ⟨255235⟩
                                        v236 = v236 + 1                                               ⟨255237⟩
                                    v228 = 0                                                          ⟨255260⟩
                                sinon :
                                    v2880→0.méthode8(183)                                             ⟨255269⟩
                                    tant que (scène8.compteur < 12) et (scène8.terminée == 0) :
                                        v226 = scène8.compteur                                        ⟨255276⟩
                                        si v226 == 2 :
                                            tête_image_de_base(tête=c18, image=21)                    ⟨255281⟩
                                        si v226 == 11 :
                                            tête_image_de_base(tête=c18, image=-1)                    ⟨255289⟩
                                        Scene_Tick(scène=scène8)                                      ⟨255295⟩
                                    v4 = 44                                                           ⟨255316⟩
                                    si = scène8.compteur                                              ⟨255317⟩
                                    tant que (scène8.compteur < si + ((v4·70) / 100)) et (scène8.terminée == 0) :
                                        v226 = scène8.compteur                                        ⟨255332⟩
                                        si si + 1 == v226 :
                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[11])  ⟨255345⟩
                                        si si + 1 == v226 :
                                            tête_texte_de_lèvres(tête=c18, texte="okyokyilkmklna")    ⟨255355⟩
                                        si (si + ((v4·70) / 100)) - 1 == v226 :
                                            v2946 = 4540                                              ⟨255363⟩
                                            v2946 = 4552                                              ⟨255364⟩
                                            v2946 = 4568                                              ⟨255365⟩
                                            v2946 = 4584                                              ⟨255366⟩
                                            v2946 = 4604                                              ⟨255367⟩
                                            Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨255377⟩
                                        Scene_Tick(scène=scène8)                                      ⟨255409⟩
                                    v4_avant = si + ((v4·70) / 100)                                   ⟨255435⟩
                                    v4 = 25                                                           ⟨255435⟩
                                    si = scène8.compteur                                              ⟨255436⟩
                                    tant que (scène8.compteur < si + ((v4·70) / 100)) et (scène8.terminée == 0) :
                                        v226 = scène8.compteur                                        ⟨255451⟩
                                        si si + 1 == v226 :
                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[12])  ⟨255464⟩
                                        si si + 1 == v226 :
                                            tête_texte_de_lèvres(tête=c18, texte="ulfdotaeewe")       ⟨255474⟩
                                        si (si + ((v4·70) / 100)) - 1 == v226 :
                                            v2946 = 4540                                              ⟨255482⟩
                                            v2946 = 4552                                              ⟨255483⟩
                                            v2946 = 4568                                              ⟨255484⟩
                                            v2946 = 4584                                              ⟨255485⟩
                                            v2946 = 4604                                              ⟨255486⟩
                                            Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨255496⟩
                                        Scene_Tick(scène=scène8)                                      ⟨255528⟩
                                    v4_avant = si + ((v4·70) / 100)                                   ⟨255554⟩
                                    v4 = 20                                                           ⟨255554⟩
                                    si = scène8.compteur                                              ⟨255555⟩
                                    tant que (scène8.compteur < si + ((v4·70) / 100)) et (scène8.terminée == 0) :
                                        v226 = scène8.compteur                                        ⟨255570⟩
                                        si si + 1 == v226 :
                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[13])  ⟨255583⟩
                                        si si + 1 == v226 :
                                            tête_texte_de_lèvres(tête=c18, texte="evchly")            ⟨255593⟩
                                        si (si + ((v4·70) / 100)) - 1 == v226 :
                                            v2946 = 4540                                              ⟨255601⟩
                                            v2946 = 4552                                              ⟨255602⟩
                                            v2946 = 4568                                              ⟨255603⟩
                                            v2946 = 4584                                              ⟨255604⟩
                                            v2946 = 4604                                              ⟨255605⟩
                                            Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨255615⟩
                                        Scene_Tick(scène=scène8)                                      ⟨255647⟩
                                    tant que (scène8.compteur < 8) et (scène8.terminée == 0) :
                                        Scene_Tick(scène=scène8)                                      ⟨255679⟩
                                Scene_Destruct(scène=scène8, drapeaux=0)                              ⟨255705⟩
                                si byte_495FC == 0 :

                                    ──── scène9 ────
                                    scène9 = Scene_Create(cadence=9, palette=255, surface=&v368)      ⟨255719⟩
                                    c19 = Layer(ressource=mid12 5, x=0, y=0)                          ⟨255726⟩
                                    c20 = ScaledImageLayer(ressource=mid12 6, x=44, y=17, angle=0, échelle=200, octet=0, image=0)  ⟨255738⟩
                                    c21 = ScaledImageLayer(ressource=mid12 9, x=50, y=35, angle=0, échelle=160, octet=0, image=0)  ⟨255750⟩
                                    c22 = ScaledImageLayer(ressource=mid12 8, x=50, y=35, angle=0, échelle=160, octet=0, image=2)  ⟨255762⟩
                                    ajoute c19 à scène9                                               ⟨255768⟩
                                    ajoute c20 à scène9                                               ⟨255773⟩
                                    ajoute c22 à scène9                                               ⟨255778⟩
                                    ajoute c21 à scène9                                               ⟨255783⟩
                                    palette_copie(destination=pal1, source=pal5(mid12 22))            ⟨255792⟩
                                    palette_envoie(palette=pal1, pas=0)                               ⟨255804⟩
                                    si v10 != 0 :
                                        Scene_Tick(scène=scène9)                                      ⟨255814⟩
                                        charge(mid12voc 2)                                            ⟨255826⟩
                                        voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid12voc 2)  ⟨255832⟩
                                        r16(mid12 17).+0 = 0                                          ⟨255834⟩
                                        tant que mid12 10.+0 < 4 :
                                            Scene_Tick(scène=scène9)                                  ⟨255841⟩
                                            r16(mid12 17).+0 = mid12 10.+0 + 1                        ⟨255843⟩
                                        voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)               ⟨255851⟩
                                        r16(mid12 17).+0 = 0                                          ⟨255853⟩
                                        tant que voix_en_cours(voix=voix1) != 0 :
                                            si mid12 10.+0 == 8 :
                                                c22.image = 2                                         ⟨255861⟩
                                            r16(mid12 17).+0 = mid12 10.+0 + 1                        ⟨255865⟩
                                            si mid12 10.+0 == 12 :
                                                c22.image = 3                                         ⟨255869⟩
                                            Scene_Tick(scène=scène9)                                  ⟨255884⟩
                                        r16(mid12 17).+0 = 0                                          ⟨255896⟩
                                        tant que mid12 10.+0 < 4 :
                                            Scene_Tick(scène=scène9)                                  ⟨255903⟩
                                            r16(mid12 17).+0 = mid12 10.+0 + 1                        ⟨255905⟩
                                        charge(mid12voc 10)                                           ⟨255920⟩
                                        voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid12voc 10)  ⟨255926⟩
                                        voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)               ⟨255931⟩
                                        tant que voix_en_cours(voix=voix1) != 0 :
                                            Scene_Tick(scène=scène9)                                  ⟨255949⟩
                                        r16(mid12 17).+0 = 0                                          ⟨255961⟩
                                        tant que mid12 10.+0 < 2 :
                                            Scene_Tick(scène=scène9)                                  ⟨255968⟩
                                            r16(mid12 17).+0 = mid12 10.+0 + 1                        ⟨255970⟩
                                        voix_arrête(voix=voix1)                                       ⟨255977⟩
                                        v244 = 0                                                      ⟨255997⟩
                                    sinon :
                                        Widget_Method_DispatchC_314CB(zone1, 0)                       ⟨256024⟩
                                        Widget_Method_Dispatch8_314A9(zone1, 39)                      ⟨256029⟩
                                        v4 = 44                                                       ⟨256031⟩
                                        si = scène9.compteur                                          ⟨256032⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 3 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[14])  ⟨256060⟩
                                            si si + 8 == scène9.compteur :
                                                c22.image = 2                                         ⟨256069⟩
                                            si si + 12 == scène9.compteur :
                                                c22.image = 3                                         ⟨256077⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                v2946 = 4540                                          ⟨256084⟩
                                                v2946 = 4552                                          ⟨256085⟩
                                                v2946 = 4568                                          ⟨256086⟩
                                                v2946 = 4584                                          ⟨256087⟩
                                                v2946 = 4604                                          ⟨256088⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨256098⟩
                                            Scene_Tick(scène=scène9)                                  ⟨256130⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨256156⟩
                                        v4 = 30                                                       ⟨256156⟩
                                        si = scène9.compteur                                          ⟨256157⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 1 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[15])  ⟨256185⟩
                                            si si + 8 == scène9.compteur :
                                                c22.image = 2                                         ⟨256194⟩
                                            si si + 12 == scène9.compteur :
                                                c22.image = 3                                         ⟨256202⟩
                                            si (si + ((v4·70) / 100)) - 5 == scène9.compteur :
                                                v2946 = 4540                                          ⟨256209⟩
                                                v2946 = 4552                                          ⟨256210⟩
                                                v2946 = 4568                                          ⟨256211⟩
                                                v2946 = 4584                                          ⟨256212⟩
                                                v2946 = 4604                                          ⟨256213⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨256223⟩
                                            Scene_Tick(scène=scène9)                                  ⟨256255⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨256281⟩
                                        v4 = 57                                                       ⟨256281⟩
                                        si = scène9.compteur                                          ⟨256282⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 1 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[16])  ⟨256309⟩
                                            si si + 8 == scène9.compteur :
                                                c22.image = 4                                         ⟨256318⟩
                                            si si + 12 == scène9.compteur :
                                                c22.image = 3                                         ⟨256326⟩
                                            si si + 28 == scène9.compteur :
                                                c22.image = 2                                         ⟨256334⟩
                                            si si + 34 == scène9.compteur :
                                                c22.image = 4                                         ⟨256342⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                v2946 = 4540                                          ⟨256349⟩
                                                v2946 = 4552                                          ⟨256350⟩
                                                v2946 = 4568                                          ⟨256351⟩
                                                v2946 = 4584                                          ⟨256352⟩
                                                v2946 = 4604                                          ⟨256353⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨256363⟩
                                            Scene_Tick(scène=scène9)                                  ⟨256395⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨256421⟩
                                        v4 = 40                                                       ⟨256421⟩
                                        si = scène9.compteur                                          ⟨256422⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 1 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[17])  ⟨256450⟩
                                            si si + 8 == scène9.compteur :
                                                c22.image = 2                                         ⟨256459⟩
                                            si si + 12 == scène9.compteur :
                                                c22.image = 3                                         ⟨256467⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                v2946 = 4540                                          ⟨256474⟩
                                                v2946 = 4552                                          ⟨256475⟩
                                                v2946 = 4568                                          ⟨256476⟩
                                                v2946 = 4584                                          ⟨256477⟩
                                                v2946 = 4604                                          ⟨256478⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨256488⟩
                                            Scene_Tick(scène=scène9)                                  ⟨256520⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨256546⟩
                                        v4 = 25                                                       ⟨256546⟩
                                        si = scène9.compteur                                          ⟨256547⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 1 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[18])  ⟨256575⟩
                                            si si + 8 == scène9.compteur :
                                                c22.image = 4                                         ⟨256584⟩
                                            si si + 12 == scène9.compteur :
                                                c22.image = 2                                         ⟨256592⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                v2946 = 4540                                          ⟨256599⟩
                                                v2946 = 4552                                          ⟨256600⟩
                                                v2946 = 4568                                          ⟨256601⟩
                                                v2946 = 4584                                          ⟨256602⟩
                                                v2946 = 4604                                          ⟨256603⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨256613⟩
                                            Scene_Tick(scène=scène9)                                  ⟨256645⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨256671⟩
                                        v4 = 18                                                       ⟨256671⟩
                                        si = scène9.compteur                                          ⟨256672⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            Scene_Tick(scène=scène9)                                  ⟨256688⟩
                                        Widget_Method_Dispatch8_314A9(zone1, 14)                      ⟨256712⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨256714⟩
                                        v4 = 65                                                       ⟨256714⟩
                                        si = scène9.compteur                                          ⟨256715⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 2 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[19])  ⟨256743⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                v2946 = 4540                                          ⟨256751⟩
                                                v2946 = 4552                                          ⟨256752⟩
                                                v2946 = 4568                                          ⟨256753⟩
                                                v2946 = 4584                                          ⟨256754⟩
                                                v2946 = 4604                                          ⟨256755⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨256765⟩
                                            Scene_Tick(scène=scène9)                                  ⟨256797⟩
                                        v4_avant = si + ((v4·70) / 100)                               ⟨256823⟩
                                        v4 = 45                                                       ⟨256823⟩
                                        si = scène9.compteur                                          ⟨256824⟩
                                        tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
                                            si si + 2 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[20])  ⟨256852⟩
                                            si (si + ((v4·70) / 100)) - 2 == scène9.compteur :
                                                v2946 = 4540                                          ⟨256860⟩
                                                v2946 = 4552                                          ⟨256861⟩
                                                v2946 = 4568                                          ⟨256862⟩
                                                v2946 = 4584                                          ⟨256863⟩
                                                v2946 = 4604                                          ⟨256864⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨256874⟩
                                            Scene_Tick(scène=scène9)                                  ⟨256906⟩
                                    Scene_Destruct(scène=scène9, drapeaux=0)                          ⟨256935⟩
                                    si byte_495FC == 0 :

                                        ──── scène10 ────
                                        scène10 = Scene_Create(cadence=9, palette=255, surface=&v368)  ⟨256949⟩
                                        c23 = Layer(ressource=mid12 4, x=0, y=0)                      ⟨256956⟩
                                        CRT_Rand()                                                    ⟨256960⟩
                                        c24 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨256971⟩
                                        ajoute c23 à scène10                                          ⟨256977⟩
                                        ajoute c24 à scène10                                          ⟨256982⟩
                                        palette_copie(destination=pal1, source=pal3(mid12 21))        ⟨256991⟩
                                        palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨257000⟩
                                        palette_envoie(palette=pal1, pas=0)                           ⟨257012⟩
                                        si v10 != 0 :
                                            Scene_Tick(scène=scène10)                                 ⟨257022⟩
                                            charge(mid12voc 11)                                       ⟨257034⟩
                                            tête_voix(tête=c24, ressource=mid12voc 11, cadence=9)     ⟨257040⟩
                                            v236 = 0                                                  ⟨257042⟩
                                            tant que v236 < 2 :
                                                Scene_Tick(scène=scène10)                             ⟨257049⟩
                                                v236 = v236 + 1                                       ⟨257051⟩
                                            tant que tête_parle(tête=c24) != 0 :
                                                Scene_Tick(scène=scène10)                             ⟨257072⟩
                                            v236 = 0                                                  ⟨257083⟩
                                            tant que v236 < 3 :
                                                Scene_Tick(scène=scène10)                             ⟨257090⟩
                                                v236 = v236 + 1                                       ⟨257092⟩
                                            v228 = 0                                                  ⟨257115⟩
                                        sinon :
                                            v2880→0.méthode8(224)                                     ⟨257124⟩
                                            v4 = 85                                                   ⟨257126⟩
                                            si = scène10.compteur                                     ⟨257127⟩
                                            tant que (scène10.compteur < si + ((v4·70) / 100)) et (scène10.terminée == 0) :
                                                v226 = scène10.compteur                               ⟨257142⟩
                                                si si + 3 == v226 :
                                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[21])  ⟨257155⟩
                                                si si + 3 == v226 :
                                                    tête_texte_de_lèvres(tête=c24, texte="fwdgzrondiznbl tawydtstlwtdbrzwlbrnd")  ⟨257165⟩
                                                si (si + ((v4·70) / 100)) - 1 == v226 :
                                                    v2946 = 4540                                      ⟨257173⟩
                                                    v2946 = 4552                                      ⟨257174⟩
                                                    v2946 = 4568                                      ⟨257175⟩
                                                    v2946 = 4584                                      ⟨257176⟩
                                                    v2946 = 4604                                      ⟨257177⟩
                                                    Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨257187⟩
                                                Scene_Tick(scène=scène10)                             ⟨257219⟩
                                        Scene_Destruct(scène=scène10, drapeaux=0)                     ⟨257248⟩
                                        si byte_495FC == 0 :

                                            ──── scène11 ────
                                            scène11 = Scene_Create(cadence=9, palette=255, surface=&v368)  ⟨257262⟩
                                            c25 = Layer(ressource=mid12 3, x=0, y=0)                  ⟨257269⟩
                                            CRT_Rand()                                                ⟨257273⟩
                                            c26 = TalkingHead(ressource=convdata type 0 "walt", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨257284⟩
                                            ajoute c25 à scène11                                      ⟨257290⟩
                                            ajoute c26 à scène11                                      ⟨257295⟩
                                            palette_copie(destination=pal1, source=pal4(mid12 20))    ⟨257304⟩
                                            palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨257313⟩
                                            palette_envoie(palette=pal1, pas=0)                       ⟨257325⟩
                                            si v10 != 0 :
                                                scène11.compteur = 0                                  ⟨257333⟩
                                                tant que (scène11.compteur < 4) et (scène11.terminée == 0) :
                                                    Scene_Tick(scène=scène11)                         ⟨257340⟩
                                                v228 = 0                                              ⟨257364⟩
                                                charge(mid12voc 3)                                    ⟨257371⟩
                                                tête_voix(tête=c26, ressource=mid12voc 3, cadence=9)  ⟨257377⟩
                                                v236 = 0                                              ⟨257379⟩
                                                tant que v236 < 3 :
                                                    Scene_Tick(scène=scène11)                         ⟨257386⟩
                                                    v236 = v236 + 1                                   ⟨257388⟩
                                                tant que tête_parle(tête=c26) != 0 :
                                                    Scene_Tick(scène=scène11)                         ⟨257425⟩
                                                tête_image_de_base(tête=c26, image=27)                ⟨257438⟩
                                                v236 = 0                                              ⟨257440⟩
                                                tant que v236 < 6 :
                                                    Scene_Tick(scène=scène11)                         ⟨257447⟩
                                                    v236 = v236 + 1                                   ⟨257449⟩
                                                v228 = 0                                              ⟨257472⟩
                                            sinon :
                                                v2880→0.méthode8(183)                                 ⟨257481⟩
                                                v4 = 84                                               ⟨257483⟩
                                                si = scène11.compteur                                 ⟨257484⟩
                                                tant que (scène11.compteur < si + ((v4·70) / 100)) et (scène11.terminée == 0) :
                                                    v226 = scène11.compteur                           ⟨257499⟩
                                                    si si + 3 == v226 :
                                                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[22])  ⟨257512⟩
                                                    si si + 3 == v226 :
                                                        tête_texte_de_lèvres(tête=c26, texte="hyltsntltbznsgtnthawyofrnshp")  ⟨257522⟩
                                                    si si + 6 == v226 :
                                                        tête_image_de_base(tête=c26, image=-1)        ⟨257532⟩
                                                    si (si + ((v4·70) / 100)) - 8 == v226 :
                                                        tête_image_de_base(tête=c26, image=27)        ⟨257542⟩
                                                    si (si + ((v4·70) / 100)) - 2 == v226 :
                                                        v2946 = 4540                                  ⟨257550⟩
                                                        v2946 = 4552                                  ⟨257551⟩
                                                        v2946 = 4568                                  ⟨257552⟩
                                                        v2946 = 4584                                  ⟨257553⟩
                                                        v2946 = 4604                                  ⟨257554⟩
                                                        Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨257564⟩
                                                    Scene_Tick(scène=scène11)                         ⟨257596⟩
                                            Scene_Destruct(scène=scène11, drapeaux=0)                 ⟨257625⟩
                                            si byte_495FC == 0 :

                                                ──── scène12 ────
                                                scène12 = Scene_Create(cadence=9, palette=255, surface=&v368)  ⟨257639⟩
                                                c27 = Layer(ressource=mid12 4, x=0, y=0)              ⟨257646⟩
                                                CRT_Rand()                                            ⟨257650⟩
                                                c28 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨257661⟩
                                                ajoute c27 à scène12                                  ⟨257667⟩
                                                ajoute c28 à scène12                                  ⟨257672⟩
                                                palette_copie(destination=pal1, source=pal3(mid12 21))  ⟨257681⟩
                                                palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨257690⟩
                                                palette_envoie(palette=pal1, pas=0)                   ⟨257702⟩
                                                si v10 != 0 :
                                                    Scene_Tick(scène=scène12)                         ⟨257712⟩
                                                    v228 = 0                                          ⟨257717⟩
                                                    charge(mid12voc 12)                               ⟨257724⟩
                                                    tête_voix(tête=c28, ressource=mid12voc 12, cadence=9)  ⟨257730⟩
                                                    v236 = 0                                          ⟨257732⟩
                                                    tant que v236 < 2 :
                                                        Scene_Tick(scène=scène12)                     ⟨257739⟩
                                                        v236 = v236 + 1                               ⟨257741⟩
                                                    tant que tête_parle(tête=c28) != 0 :
                                                        Scene_Tick(scène=scène12)                     ⟨257762⟩
                                                    v236 = 0                                          ⟨257773⟩
                                                    tant que v236 < 3 :
                                                        Scene_Tick(scène=scène12)                     ⟨257780⟩
                                                        v236 = v236 + 1                               ⟨257782⟩
                                                    v228 = 0                                          ⟨257805⟩
                                                sinon :
                                                    v2880→0.méthode8(224)                             ⟨257814⟩
                                                    v4 = 66                                           ⟨257816⟩
                                                    si = scène12.compteur                             ⟨257817⟩
                                                    tant que (scène12.compteur < si + ((v4·70) / 100)) et (scène12.terminée == 0) :
                                                        v226 = scène12.compteur                       ⟨257832⟩
                                                        si si + 3 == v226 :
                                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[24])  ⟨257845⟩
                                                        si si + 3 == v226 :
                                                            tête_texte_de_lèvres(tête=c28, texte="ltsntltyrhdgtnthawyovabuletpame")  ⟨257855⟩
                                                        si (si + ((v4·70) / 100)) - 2 == v226 :
                                                            v2946 = 4540                              ⟨257863⟩
                                                            v2946 = 4552                              ⟨257864⟩
                                                            v2946 = 4568                              ⟨257865⟩
                                                            v2946 = 4584                              ⟨257866⟩
                                                            v2946 = 4604                              ⟨257867⟩
                                                            Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨257877⟩
                                                        Scene_Tick(scène=scène12)                     ⟨257909⟩
                                                Scene_Destruct(scène=scène12, drapeaux=0)             ⟨257938⟩
                                                si byte_495FC == 0 :

                                                    ──── scène13 ────
                                                    scène13 = Scene_Create(cadence=9, palette=255, surface=&v368)  ⟨257952⟩
                                                    c29 = Layer(ressource=mid12 3, x=0, y=0)          ⟨257959⟩
                                                    CRT_Rand()                                        ⟨257963⟩
                                                    c30 = TalkingHead(ressource=convdata type 0 "walt", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨257974⟩
                                                    ajoute c29 à scène13                              ⟨257980⟩
                                                    ajoute c30 à scène13                              ⟨257985⟩
                                                    palette_copie(destination=pal1, source=pal4(mid12 20))  ⟨257994⟩
                                                    palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨258003⟩
                                                    palette_envoie(palette=pal1, pas=0)               ⟨258015⟩
                                                    si v10 != 0 :
                                                        Scene_Tick(scène=scène13)                     ⟨258025⟩
                                                        v228 = 0                                      ⟨258030⟩
                                                        charge(mid12voc 4)                            ⟨258037⟩
                                                        tête_voix(tête=c30, ressource=mid12voc 4, cadence=9)  ⟨258043⟩
                                                        v236 = 0                                      ⟨258045⟩
                                                        tant que v236 < 3 :
                                                            Scene_Tick(scène=scène13)                 ⟨258052⟩
                                                            v236 = v236 + 1                           ⟨258054⟩
                                                        tant que tête_parle(tête=c30) != 0 :
                                                            Scene_Tick(scène=scène13)                 ⟨258091⟩
                                                        tête_image_de_base(tête=c30, image=28)        ⟨258104⟩
                                                        v236 = 0                                      ⟨258106⟩
                                                        tant que v236 < 6 :
                                                            Scene_Tick(scène=scène13)                 ⟨258113⟩
                                                            v236 = v236 + 1                           ⟨258115⟩
                                                        v228 = 0                                      ⟨258138⟩
                                                    sinon :
                                                        v2880→0.méthode8(183)                         ⟨258147⟩
                                                        v4 = 53                                       ⟨258149⟩
                                                        si = scène13.compteur                         ⟨258150⟩
                                                        tant que (scène13.compteur < si + ((v4·70) / 100)) et (scène13.terminée == 0) :
                                                            v226 = scène13.compteur                   ⟨258165⟩
                                                            si si + 3 == v226 :
                                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[25])  ⟨258178⟩
                                                            si si + 3 == v226 :
                                                                tête_texte_de_lèvres(tête=c30, texte="okokmwyotofmylghr")  ⟨258188⟩
                                                            si (si + ((v4·70) / 100)) - 1 == v226 :
                                                                v2946 = 4540                          ⟨258196⟩
                                                                v2946 = 4552                          ⟨258197⟩
                                                                v2946 = 4568                          ⟨258198⟩
                                                                v2946 = 4584                          ⟨258199⟩
                                                                v2946 = 4604                          ⟨258200⟩
                                                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨258210⟩
                                                            Scene_Tick(scène=scène13)                 ⟨258242⟩
                                                        v4_avant = si + ((v4·70) / 100)               ⟨258268⟩
                                                        v4 = 42                                       ⟨258268⟩
                                                        si = scène13.compteur                         ⟨258269⟩
                                                        tant que (scène13.compteur < si + ((v4·70) / 100)) et (scène13.terminée == 0) :
                                                            v226 = scène13.compteur                   ⟨258284⟩
                                                            si si + 1 == v226 :
                                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[26])  ⟨258297⟩
                                                            si si + 1 == v226 :
                                                                tête_texte_de_lèvres(tête=c30, texte="oabutkacke")  ⟨258307⟩
                                                            si (si + ((v4·70) / 100)) - 8 == v226 :
                                                                tête_image_de_base(tête=c30, image=28)  ⟨258317⟩
                                                            si (si + ((v4·70) / 100)) - 8 == v226 :
                                                                v2946 = 4540                          ⟨258325⟩
                                                                v2946 = 4552                          ⟨258326⟩
                                                                v2946 = 4568                          ⟨258327⟩
                                                                v2946 = 4584                          ⟨258328⟩
                                                                v2946 = 4604                          ⟨258329⟩
                                                                Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨258339⟩
                                                            Scene_Tick(scène=scène13)                 ⟨258371⟩
                                                    Scene_Destruct(scène=scène13, drapeaux=0)         ⟨258400⟩
                                                    si byte_495FC == 0 :

                                                        ──── scène14 ────
                                                        scène14 = Scene_Create(cadence=9, palette=255, surface=&v368)  ⟨258414⟩
                                                        c31 = Layer(ressource=mid12 4, x=0, y=0)      ⟨258421⟩
                                                        CRT_Rand()                                    ⟨258425⟩
                                                        c32 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨258436⟩
                                                        ajoute c31 à scène14                          ⟨258442⟩
                                                        ajoute c32 à scène14                          ⟨258447⟩
                                                        palette_copie(destination=pal1, source=pal3(mid12 21))  ⟨258456⟩
                                                        palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨258465⟩
                                                        palette_envoie(palette=pal1, pas=0)           ⟨258477⟩
                                                        si v10 != 0 :
                                                            Scene_Tick(scène=scène14)                 ⟨258487⟩
                                                            v228 = 0                                  ⟨258492⟩
                                                            charge(mid12voc 13)                       ⟨258499⟩
                                                            tête_voix(tête=c32, ressource=mid12voc 13, cadence=9)  ⟨258505⟩
                                                            v236 = 0                                  ⟨258507⟩
                                                            tant que v236 < 2 :
                                                                Scene_Tick(scène=scène14)             ⟨258514⟩
                                                                v236 = v236 + 1                       ⟨258516⟩
                                                            tant que tête_parle(tête=c32) != 0 :
                                                                Scene_Tick(scène=scène14)             ⟨258537⟩
                                                            tête_image_de_base(tête=c32, image=33)    ⟨258550⟩
                                                            v236 = 0                                  ⟨258552⟩
                                                            tant que v236 < 3 :
                                                                Scene_Tick(scène=scène14)             ⟨258559⟩
                                                                v236 = v236 + 1                       ⟨258561⟩
                                                            v228 = 0                                  ⟨258584⟩
                                                        sinon :
                                                            v2880→0.méthode8(224)                     ⟨258593⟩
                                                            v4 = 19                                   ⟨258595⟩
                                                            si = scène14.compteur                     ⟨258596⟩
                                                            tant que (scène14.compteur < si + ((v4·70) / 100)) et (scène14.terminée == 0) :
                                                                v226 = scène14.compteur               ⟨258611⟩
                                                                si si + 3 == v226 :
                                                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[27])  ⟨258624⟩
                                                                si si + 3 == v226 :
                                                                    tête_texte_de_lèvres(tête=c32, texte="achk")  ⟨258634⟩
                                                                si (si + ((v4·70) / 100)) - 1 == v226 :
                                                                    v2946 = 4540                      ⟨258642⟩
                                                                    v2946 = 4552                      ⟨258643⟩
                                                                    v2946 = 4568                      ⟨258644⟩
                                                                    v2946 = 4584                      ⟨258645⟩
                                                                    v2946 = 4604                      ⟨258646⟩
                                                                    Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨258656⟩
                                                                Scene_Tick(scène=scène14)             ⟨258688⟩
                                                            tête_image_de_base(tête=c32, image=33)    ⟨258716⟩
                                                            v4_avant = si + ((v4·70) / 100)           ⟨258718⟩
                                                            v4 = 21                                   ⟨258718⟩
                                                            si = scène14.compteur                     ⟨258719⟩
                                                            tant que (scène14.compteur < si + ((v4·70) / 100)) et (scène14.terminée == 0) :
                                                                v226 = scène14.compteur               ⟨258734⟩
                                                                si si + 1 == v226 :
                                                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[28])  ⟨258747⟩
                                                                si si + 1 == v226 :
                                                                    tête_texte_de_lèvres(tête=c32, texte="sur")  ⟨258757⟩
                                                                si (si + ((v4·70) / 100)) - 2 == v226 :
                                                                    v2946 = 4540                      ⟨258765⟩
                                                                    v2946 = 4552                      ⟨258766⟩
                                                                    v2946 = 4568                      ⟨258767⟩
                                                                    v2946 = 4584                      ⟨258768⟩
                                                                    v2946 = 4604                      ⟨258769⟩
                                                                    Primitive_SetRectColorAndDraw_2CBE5(&v2946, v2875, v2873, v2871, v2869, 0, &v2898)  ⟨258779⟩
                                                                Scene_Tick(scène=scène14)             ⟨258811⟩
                                                        Scene_Destruct(scène=scène14, drapeaux=0)     ⟨258840⟩
                                                        si byte_495FC == 0 :

                                                            ──── scène15 ────
                                                            scène15 = Scene_Create(cadence=10, palette=255, surface=&v368)  ⟨258854⟩
                                                            charge(mid12 12)                          ⟨258866⟩
                                                            r16(mid12 17).+0 = 0                      ⟨258868⟩
                                                            charge(mid12 10)                          ⟨258878⟩
                                                            v244 = 0                                  ⟨258883⟩
                                                            charge(mid12 11)                          ⟨258890⟩
                                                            charge(mid12 23)                          ⟨258902⟩
                                                            palette_depuis(pal9(mid12 23))            ⟨258909⟩
                                                            c33 = Layer(ressource=mid12 10, x=0, y=0)  ⟨258916⟩
                                                            c34 = Layer(ressource=mid12 12, x=-30, y=0)  ⟨258924⟩
                                                            c35 = Layer(ressource=mid12 11, x=0, y=0)  ⟨258932⟩
                                                            ajoute c33 à scène15                      ⟨258938⟩
                                                            ajoute c34 à scène15                      ⟨258943⟩
                                                            ajoute c35 à scène15                      ⟨258948⟩
                                                            palette_copie(destination=pal1, source=pal9(mid12 23))  ⟨258957⟩
                                                            palette_envoie(palette=pal1, pas=0)       ⟨258969⟩
                                                            c34.méthode24(0, 10)                      ⟨258976⟩
                                                            tant que (scène15.compteur < 18) et (scène15.terminée == 0) :
                                                                v274 = scène15.compteur               ⟨258983⟩
                                                                si v274 < 3 :
                                                                    c34.méthode24(10, 1)              ⟨258991⟩
                                                                si v274 == 4 :
                                                                    Scene_SetFps(scène=scène15, cadence=20)  ⟨259000⟩
                                                                si v274 > 8 :
                                                                    c34.méthode24(-12, -1)            ⟨259011⟩
                                                                Scene_Tick(scène=scène15)             ⟨259027⟩
                                                            v254 = 0                                  ⟨259076⟩
                                                            v244 = 0                                  ⟨259095⟩
                                                            r16(mid12 10).+0 = 0                      ⟨259112⟩
                                                            v224 = 0                                  ⟨259133⟩
                                                            Scene_Destruct(scène=scène15, drapeaux=0)  ⟨259137⟩
                                                            si byte_495FC == 0 :
                                                                v224 = 0                              ⟨259148⟩
                                                                charge(mid12 13)                      ⟨259155⟩

                                                                ──── scène16 ────
                                                                scène16 = Scene_Create(cadence=10, palette=255, surface=&v368)  ⟨259163⟩
                                                                c36 = Layer(ressource=mid12 13, x=-2, y=0)  ⟨259170⟩
                                                                c37 = Layer(ressource=mid12 4, x=0, y=0)  ⟨259178⟩
                                                                c38 = TalkingHead(ressource=convdata type 0 "air", x=160, y=128)  ⟨259186⟩
                                                                ajoute c37 à scène16                  ⟨259192⟩
                                                                ajoute c38 à scène16                  ⟨259197⟩
                                                                ajoute c36 à scène16                  ⟨259202⟩
                                                                palette_copie(destination=pal1, source=pal3(mid12 21))  ⟨259211⟩
                                                                palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨259220⟩
                                                                palette_envoie(palette=pal1, pas=0)   ⟨259232⟩
                                                                si v11 != 0 :
                                                                    charge(asoundfx 45)               ⟨259252⟩
                                                                    canal_init(canal=canal3, pilote=word_46849)  ⟨259257⟩
                                                                    canal_enregistre(canal=canal3, ressource=asoundfx 45, x=0)  ⟨259264⟩
                                                                tête_image_de_base(tête=c38, image=14)  ⟨259270⟩
                                                                tant que (scène16.compteur < 9) et (scène16.terminée == 0) :
                                                                    v248 = scène16.compteur           ⟨259277⟩
                                                                    si v248 == 4 :
                                                                        si v11 != 0 :
                                                                            v252 = 0                  ⟨259284⟩
                                                                            si canal3.+0 != 0 :
                                                                                AIL_start_sequence(pilote=canal3.+0→4, séquence=v2946)  ⟨259290⟩
                                                                                AIL_set_relative_volume_30C66(canal3.+0→4, v2946, word_48EFC, v252)  ⟨259297⟩
                                                                    si v248 == 5 :
                                                                        c36.image = 1                 ⟨259306⟩
                                                                    si v248 == 6 :
                                                                        c36.image = 0                 ⟨259312⟩
                                                                    si v248 == 6 :
                                                                        tête_image_de_base(tête=c38, image=12)  ⟨259319⟩
                                                                    si v248 == 7 :
                                                                        tête_image_de_base(tête=c38, image=-1)  ⟨259327⟩
                                                                    si v248 == 7 :
                                                                        tête_image_de_base(tête=c38, image=14)  ⟨259335⟩
                                                                    Scene_Tick(scène=scène16)         ⟨259351⟩
                                                                canal_arrête(canal=canal3)            ⟨259379⟩
                                                                v2944 = 0                             ⟨259397⟩
                                                                v2939 = 0                             ⟨259398⟩
                                                                v2938 = 0                             ⟨259399⟩
                                                                r16(mid12 10).+0 = 0                  ⟨259418⟩
                                                                Scene_Destruct(scène=scène16, drapeaux=0)  ⟨259422⟩
                                                                v224 = 0                              ⟨259442⟩
                                                                si byte_495FC == 0 :

                                                                    ──── scène17 ────
                                                                    scène17 = Scene_Create(cadence=10, palette=255, surface=&v368)  ⟨259455⟩
                                                                    c39 = Layer(ressource=mid12 5, x=0, y=0)  ⟨259462⟩
                                                                    c40 = ScaledImageLayer(ressource=mid12 6, x=44, y=17, angle=0, échelle=200, octet=0, image=0)  ⟨259474⟩
                                                                    c41 = ScaledImageLayer(ressource=mid12 9, x=50, y=35, angle=0, échelle=160, octet=0, image=0)  ⟨259486⟩
                                                                    c42 = ScaledImageLayer(ressource=mid12 8, x=50, y=35, angle=0, échelle=160, octet=0, image=13)  ⟨259498⟩
                                                                    ajoute c39 à scène17              ⟨259504⟩
                                                                    ajoute c40 à scène17              ⟨259509⟩
                                                                    ajoute c42 à scène17              ⟨259514⟩
                                                                    ajoute c41 à scène17              ⟨259519⟩
                                                                    palette_copie(destination=pal1, source=pal5(mid12 22))  ⟨259528⟩
                                                                    palette_envoie(palette=pal1, pas=0)  ⟨259540⟩
                                                                    v2944 = 0                         ⟨259546⟩
                                                                    v2940 = 2                         ⟨259547⟩
                                                                    v2939 = 0                         ⟨259548⟩
                                                                    v2938 = 0                         ⟨259549⟩
                                                                    v2946 = -1                        ⟨259551⟩
                                                                    si v11 != 0 :
                                                                        charge(asoundfx 90)           ⟨259560⟩
                                                                        canal_init(canal=canal3, pilote=word_46849)  ⟨259565⟩
                                                                        canal_enregistre(canal=canal3, ressource=asoundfx 90, x=0)  ⟨259572⟩
                                                                    Widget_Method_DispatchC_314CB(zone1, 0)  ⟨259579⟩
                                                                    Widget_Method_Dispatch8_314A9(zone1, 39)  ⟨259584⟩
                                                                    r16(mid12 10).+0 = 13             ⟨259586⟩
                                                                    c42.image = 0                     ⟨259588⟩
                                                                    tant que (scène17.compteur < 57) et (scène17.terminée == 0) :
                                                                        v242 = scène17.compteur       ⟨259594⟩
                                                                        si v242 == 29 :
                                                                            si v11 != 0 :
                                                                                v244 = word_48F56     ⟨259600⟩
                                                                                si canal3.+0 != 0 :
                                                                                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v2946)  ⟨259607⟩
                                                                                    AIL_set_relative_volume_30C66(canal3.+0→4, v2946, v244, asoundfx 45.+0)  ⟨259614⟩
                                                                        si v242 > 0 :
                                                                            si v242 < 44 :
                                                                                v248 = mid12 10.+0    ⟨259625⟩
                                                                                r16(mid12 10).+0 = mid12 10.+0 + 1  ⟨259626⟩
                                                                                c42.image = v248      ⟨259629⟩
                                                                        si v242 == 32 :
                                                                            c40.image = 1             ⟨259636⟩
                                                                        si v242 == 34 :
                                                                            c40.image = 2             ⟨259642⟩
                                                                        Scene_Tick(scène=scène17)     ⟨259657⟩
                                                                    canal_arrête(canal=canal3)        ⟨259685⟩
                                                                    v2944 = 0                         ⟨259703⟩
                                                                    v2939 = 0                         ⟨259704⟩
                                                                    v2938 = 0                         ⟨259705⟩
                                                                    Scene_Destruct(scène=scène17, drapeaux=0)  ⟨259728⟩
                                                                    si byte_495FC == 0 :

                                                                        ──── scène18 ────
                                                                        scène18 = Scene_Create(cadence=10, palette=255, surface=&v368)  ⟨259742⟩
                                                                        c43 = Layer(ressource=mid12 4, x=0, y=0)  ⟨259749⟩
                                                                        CRT_Rand()                    ⟨259753⟩
                                                                        c44 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)  ⟨259764⟩
                                                                        ajoute c43 à scène18          ⟨259770⟩
                                                                        ajoute c44 à scène18          ⟨259775⟩
                                                                        palette_copie(destination=pal1, source=pal3(mid12 21))  ⟨259784⟩
                                                                        palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))  ⟨259793⟩
                                                                        palette_envoie(palette=pal1, pas=0)  ⟨259805⟩
                                                                        tête_image_de_base(tête=c44, image=31)  ⟨259809⟩
                                                                        tête_image_de_base(tête=c44, image=19)  ⟨259813⟩
                                                                        tant que (scène18.compteur < 20) et (scène18.terminée == 0) :
                                                                            v226 = scène18.compteur   ⟨259820⟩
                                                                            si v226 == 2 :
                                                                                tête_image_de_base(tête=c44, image=12)  ⟨259825⟩
                                                                            si v226 == 3 :
                                                                                tête_image_de_base(tête=c44, image=19)  ⟨259833⟩
                                                                            si v226 == 12 :
                                                                                tête_image_de_base(tête=c44, image=12)  ⟨259841⟩
                                                                            si v226 == 13 :
                                                                                tête_image_de_base(tête=c44, image=19)  ⟨259849⟩
                                                                            Scene_Tick(scène=scène18)  ⟨259865⟩
                                                                        Scene_Destruct(scène=scène18, drapeaux=0)  ⟨259894⟩
                                                                        si byte_495FC == 0 :

                                                                            ──── scène19 ────
                                                                            scène19 = Scene_Create(cadence=10, palette=255, surface=&v368)  ⟨259908⟩
                                                                            charge(mid12 16)          ⟨259920⟩
                                                                            c45 = Layer(ressource=mid12 16, x=0, y=0)  ⟨259927⟩
                                                                            charge(mid12 25)          ⟨259940⟩
                                                                            palette_depuis(pal10(mid12 25))  ⟨259947⟩
                                                                            ajoute c45 à scène19      ⟨259952⟩
                                                                            palette_copie(destination=pal1, source=pal10(mid12 25))  ⟨259961⟩
                                                                            palette_envoie(palette=pal1, pas=0)  ⟨259973⟩
                                                                            v4 = 30                   ⟨259975⟩
                                                                            si = scène19.compteur     ⟨259976⟩
                                                                            tant que (scène19.compteur < si + ((v4·70) / 100)) et (scène19.terminée == 0) :
                                                                                Scene_Tick(scène=scène19)  ⟨260002⟩
                                                                            fondu_disparition(palette=pal1, couleur=&v28, pas=2, premier=0, nombre=256)  ⟨260032⟩
                                                                            v237 = 0                  ⟨260056⟩
                                                                            v236 = 0                  ⟨260057⟩
                                                                            v224 = 0                  ⟨260076⟩
                                                                            Scene_Destruct(scène=scène19, drapeaux=0)  ⟨260080⟩
v196 = 0                                                                                              ⟨260110⟩
v191 = 0                                                                                              ⟨260111⟩
v190 = 0                                                                                              ⟨260112⟩
v181 = 0                                                                                              ⟨260130⟩
v180 = 0                                                                                              ⟨260131⟩
v171 = 0                                                                                              ⟨260149⟩
v170 = 0                                                                                              ⟨260150⟩
v155 = 0                                                                                              ⟨260173⟩
v154 = 0                                                                                              ⟨260174⟩
v139 = 0                                                                                              ⟨260197⟩
v138 = 0                                                                                              ⟨260198⟩
v123 = 0                                                                                              ⟨260221⟩
v122 = 0                                                                                              ⟨260222⟩
v107 = 0                                                                                              ⟨260245⟩
v106 = 0                                                                                              ⟨260246⟩
v97 = 0                                                                                               ⟨260264⟩
v96 = 0                                                                                               ⟨260265⟩
v87 = 0                                                                                               ⟨260283⟩
v86 = 0                                                                                               ⟨260284⟩
v77 = 0                                                                                               ⟨260302⟩
v76 = 0                                                                                               ⟨260303⟩
v67 = 0                                                                                               ⟨260321⟩
v66 = 0                                                                                               ⟨260322⟩
v57 = 0                                                                                               ⟨260340⟩
v56 = 0                                                                                               ⟨260341⟩
v47 = 0                                                                                               ⟨260359⟩
v46 = 0                                                                                               ⟨260360⟩
voix_arrête(voix=voix1)                                                                               ⟨260364⟩
v2826 = 0                                                                                             ⟨260382⟩
v2821 = 0                                                                                             ⟨260383⟩
v2820 = 0                                                                                             ⟨260384⟩
canal_arrête(canal=canal2)                                                                            ⟨260387⟩
v752 = 0                                                                                              ⟨260405⟩
v747 = 0                                                                                              ⟨260406⟩
v746 = 0                                                                                              ⟨260407⟩
v33 = 0                                                                                               ⟨260430⟩
v32 = 0                                                                                               ⟨260431⟩
retour                                                                                                ⟨260468⟩
```

## Tableaux du segment de données

