# Script extrait de `sub_A3C30` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## sub_A3C30

```
bp = sp                                                                                               ⟨301840⟩
v1 = 0                                                                                                ⟨301844⟩
CRT_Strcpy(&v404, 9776)                                                                               ⟨301848⟩
CRT_Strcpy(&v446, 9777)                                                                               ⟨301853⟩
CRT_Strcpy(&v490, 9778)                                                                               ⟨301858⟩
tableau_textes(tableau=textes1, nombre=18, longueur=200)                                              ⟨301869⟩
byte_495FC = 0                                                                                        ⟨301871⟩
v19 = 0                                                                                               ⟨301872⟩
v20 = 0                                                                                               ⟨301873⟩
v21 = 0                                                                                               ⟨301874⟩
si word_4684B != 0 :
    v20 = 1                                                                                           ⟨301877⟩
v24 = word_46F46                                                                                      ⟨301881⟩
v584 = 0                                                                                              ⟨301882⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v584, v24)                                                      ⟨301887⟩
v598 = 0                                                                                              ⟨301889⟩
TextRenderer_ApplyFormatChange_2EA21(&v598, 0)                                                        ⟨301898⟩
SmallObject_RegisterInList_2CB40(&v28, &v598)                                                         ⟨301904⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨301910⟩
v38 = 0                                                                                               ⟨301916⟩
si v20 != 0 :
    si sub_6734(chemin1) == 0 : aller à loc_A3DD1                                                     ⟨301958⟩
    pak mid33voc.ouvre(chemin1, 1)                                                                    ⟨301965⟩
sinon :
    v20 = 0                                                                                           ⟨301972⟩
v48 = 0                                                                                               ⟨301975⟩
v43 = 0                                                                                               ⟨301977⟩
v42 = 0                                                                                               ⟨301978⟩
v50 = byte_46848                                                                                      ⟨301980⟩
si v50 != 1 :
    si v50 == 2 : aller à loc_A3F81                                                                   ⟨301990⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨302026⟩
        flux_iff(flux=flux1)                                                                          ⟨302040⟩
        v3245 = 256                                                                                   ⟨302043⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨302052⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨302058⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨302064⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨302068⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨302070⟩
        di = 1                                                                                        ⟨302071⟩
        tant que di <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨302078⟩
            ds:24192[di·2] = iff_lit_mot(flux=flux1)                                                  ⟨302082⟩
            di = di + 1                                                                               ⟨302083⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨302090⟩
        v21 = 1                                                                                       ⟨302092⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨302096⟩
    si sub_6734(chemin1) != 0 :
        v19 = 1                                                                                       ⟨302122⟩
        si v21 == 0 :
            word_48F76 = 90                                                                           ⟨302127⟩
    aller à loc_A40EC                                                                                 ⟨302131⟩
    loc_A3F81:                                                                                        ⟨302134⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨302162⟩
        flux_iff(flux=flux1)                                                                          ⟨302176⟩
        v3245 = 256                                                                                   ⟨302179⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨302188⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨302194⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨302200⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨302204⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨302206⟩
        di = 1                                                                                        ⟨302207⟩
        tant que di <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨302214⟩
            ds:24192[di·2] = iff_lit_mot(flux=flux1)                                                  ⟨302218⟩
            di = di + 1                                                                               ⟨302219⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨302226⟩
        v21 = 1                                                                                       ⟨302228⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨302232⟩
    si sub_6734(chemin1) != 0 :
        v19 = 1                                                                                       ⟨302258⟩
        si v21 == 0 :
            word_48F76 = 255                                                                          ⟨302263⟩
loc_A40EC:                                                                                            ⟨302269⟩
si v21 != 0 :
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨302286⟩
    charge(asoundfx 76)                                                                               ⟨302298⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 76, x=0)                                        ⟨302305⟩
    canal_arrête(canal=canal1)                                                                        ⟨302309⟩
    canal_arrête(canal=canal1)                                                                        ⟨302332⟩
v968 = 0                                                                                              ⟨302355⟩
v963 = 0                                                                                              ⟨302357⟩
v962 = 0                                                                                              ⟨302358⟩
v972 = 0                                                                                              ⟨302359⟩
si v19 != 0 :
    si v20 != 0 :
        v309 = 18                                                                                     ⟨302372⟩
    sinon :
        v309 = 17                                                                                     ⟨302377⟩
    charge(amusic v309)                                                                               ⟨302388⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨302393⟩
    canal_enregistre(canal=canal2, ressource=amusic v309, x=0)                                        ⟨302400⟩
v981 = booléen                                                                                        ⟨302417⟩
v977 = booléen                                                                                        ⟨302418⟩
si v20 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨302424⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨302442⟩
    v3245 = 256                                                                                       ⟨302445⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨302454⟩
    iff_form(flux=flux1, balise='MG33', x=0)                                                          ⟨302460⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨302466⟩
    di = 0                                                                                            ⟨302468⟩
    tant que di < 18 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨302477⟩
        v310 = v3228                                                                                  ⟨302480⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·di), taille=v310)                    ⟨302491⟩
        v3241 = v3224                                                                                 ⟨302494⟩
        di = di + 1                                                                                   ⟨302495⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨302502⟩
    si CRT_Strlen(arg_10) != 0 :
        CRT_Strcat(textes1[2], arg_10)                                                                ⟨302515⟩
        CRT_Strcat(textes1[2], 9782)                                                                  ⟨302523⟩
    sinon :
        si CRT_Strlen(arg_6) != 0 :
            CRT_Strcat(textes1[2], arg_6)                                                             ⟨302540⟩
            CRT_Strcat(textes1[2], 9782)                                                              ⟨302548⟩
        sinon :
            si CRT_Strlen(arg_8) != 0 :
                CRT_Strcat(textes1[2], arg_8)                                                         ⟨302565⟩
                CRT_Strcat(textes1[2], 9782)                                                          ⟨302573⟩
            sinon :
                CRT_Strcat(textes1[2], textes1[3])                                                    ⟨302590⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[8], 9779)                                                                  ⟨302606⟩
        CRT_Strcat(textes1[8], arg_6)                                                                 ⟨302614⟩
        CRT_Strcat(textes1[8], 9782)                                                                  ⟨302622⟩
    sinon :
        si CRT_Strlen(arg_8) != 0 :
            CRT_Strcat(textes1[8], 9779)                                                              ⟨302639⟩
            CRT_Strcat(textes1[8], arg_8)                                                             ⟨302647⟩
            CRT_Strcat(textes1[8], 9782)                                                              ⟨302655⟩
        sinon :
            si CRT_Strlen(arg_10) != 0 :
                CRT_Strcat(textes1[8], 9779)                                                          ⟨302672⟩
                CRT_Strcat(textes1[8], arg_10)                                                        ⟨302680⟩
                CRT_Strcat(textes1[8], 9782)                                                          ⟨302688⟩
            sinon :
                CRT_Strcat(textes1[8], 9782)                                                          ⟨302700⟩
    si CRT_Strlen(arg_10) != 0 :
        CRT_Strcat(textes1[16], arg_10)                                                               ⟨302716⟩
        CRT_Strcat(textes1[16], 9782)                                                                 ⟨302724⟩
    sinon :
        si CRT_Strlen(arg_6) != 0 :
            CRT_Strcat(textes1[16], arg_6)                                                            ⟨302741⟩
            CRT_Strcat(textes1[16], 9782)                                                             ⟨302749⟩
        sinon :
            si CRT_Strlen(arg_8) != 0 :
                CRT_Strcat(textes1[16], arg_8)                                                        ⟨302766⟩
                CRT_Strcat(textes1[16], 9782)                                                         ⟨302774⟩
            sinon :
                CRT_Strcat(textes1[16], textes1[17])                                                  ⟨302791⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨302799⟩
si CRT_Strlen(arg_10) != 0 :
    CRT_Strcat(&v490, 9786)                                                                           ⟨302816⟩
    CRT_Strcat(&v490, arg_10)                                                                         ⟨302821⟩
    CRT_Strcat(&v490, 9786)                                                                           ⟨302826⟩
sinon :
    CRT_Strcat(&v490, 9786)                                                                           ⟨302835⟩
    CRT_Strcat(&v490, 9833)                                                                           ⟨302840⟩
    CRT_Strcat(&v490, 9786)                                                                           ⟨302845⟩
CRT_Strlen(arg_8)                                                                                     ⟨302850⟩
CRT_Strlen(arg_6)                                                                                     ⟨302854⟩
si (CRT_Strlen(arg_8) + CRT_Strlen(arg_6)) + 1 > 21 :
    v1 = 1                                                                                            ⟨302861⟩
si CRT_Strlen(arg_6) != 0 :
    CRT_Strcat(&v404, arg_6)                                                                          ⟨302872⟩
    si v1 != 0 :
        si CRT_Strlen(arg_8) == 0 :
            v1 = 0                                                                                    ⟨302881⟩
        sinon :
            CRT_Strcat(&v446, arg_8)                                                                  ⟨302889⟩
    sinon :
        CRT_Strcat(&v404, 9784)                                                                       ⟨302900⟩
        CRT_Strcat(&v404, arg_8)                                                                      ⟨302905⟩
sinon :
    v1 = 0                                                                                            ⟨302913⟩
    CRT_Strcat(&v404, arg_8)                                                                          ⟨302917⟩
si CRT_Strlen(&v404) == 0 :
    CRT_Strcat(&v404, 9841)                                                                           ⟨302930⟩
charge(midgames 42)                                                                                   ⟨302944⟩
charge(midgames 44)                                                                                   ⟨302956⟩
charge_convdata_type2("normal")                                                                       ⟨302966⟩
palette_depuis(pal2(convdata type 2 "normal"))                                                        ⟨302973⟩
charge(midgames 37)                                                                                   ⟨302985⟩
palette_depuis(pal3(midgames 37))                                                                     ⟨302992⟩
charge(midgames 43)                                                                                   ⟨303004⟩
palette_depuis(pal4(midgames 43))                                                                     ⟨303011⟩
charge(midgames 45)                                                                                   ⟨303023⟩
palette_depuis(pal5(midgames 45))                                                                     ⟨303030⟩
charge(midgames 40)                                                                                   ⟨303042⟩
palette_depuis(pal6(midgames 40))                                                                     ⟨303049⟩
charge(midgames 41)                                                                                   ⟨303061⟩
palette_depuis(pal7(midgames 41))                                                                     ⟨303068⟩
charge(midgames 29)                                                                                   ⟨303080⟩
charge(midgames 33)                                                                                   ⟨303092⟩
charge(midgames 34)                                                                                   ⟨303104⟩
charge(midgames 35)                                                                                   ⟨303116⟩
charge_convdata_type0("billy", drapeau=3)                                                             ⟨303126⟩
charge_convdata_type0("tex", drapeau=3)                                                               ⟨303136⟩
charge_convdata_type0("gwen", drapeau=3)                                                              ⟨303146⟩
charge_convdata_type0("miguel", drapeau=3)                                                            ⟨303156⟩
v256 = 0                                                                                              ⟨303158⟩
v252 = 2                                                                                              ⟨303159⟩
v251 = 0                                                                                              ⟨303160⟩
v250 = 0                                                                                              ⟨303161⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨303175⟩
v258 = ?                                                                                              ⟨303177⟩
v260 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                ⟨303178⟩
v256 = v260                                                                                           ⟨303180⟩
v252 = 2                                                                                              ⟨303181⟩
v251 = 1                                                                                              ⟨303182⟩
v250 = 0                                                                                              ⟨303183⟩
GlyphObject_ConstructWithBuffer_311CF(&v3082, &v256)                                                  ⟨303188⟩
v270 = word_46F46                                                                                     ⟨303195⟩
zone_texte(zone=zone1, police=&v3082)                                                                 ⟨303201⟩
v272 = 152                                                                                            ⟨303205⟩
v274 = 319                                                                                            ⟨303207⟩
v276 = 199                                                                                            ⟨303209⟩
v3089 = v272                                                                                          ⟨303213⟩
v3087 = v274                                                                                          ⟨303215⟩
v3085 = v276                                                                                          ⟨303217⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨303221⟩
Widget_Method_Dispatch8_314A9(zone1, 200)                                                             ⟨303226⟩
v286 = 0                                                                                              ⟨303228⟩
v282 = 2                                                                                              ⟨303229⟩
v281 = 0                                                                                              ⟨303230⟩
v280 = 0                                                                                              ⟨303231⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨303245⟩
v288 = ?                                                                                              ⟨303247⟩
v290 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                ⟨303248⟩
v286 = v290                                                                                           ⟨303250⟩
v282 = 2                                                                                              ⟨303251⟩
v281 = 1                                                                                              ⟨303252⟩
v280 = 0                                                                                              ⟨303253⟩
GlyphObject_ConstructWithBuffer_311CF(&v3140, &v286)                                                  ⟨303258⟩
zone_texte(zone=zone2, police=&v3140)                                                                 ⟨303270⟩
v300 = 64                                                                                             ⟨303274⟩
v302 = 135                                                                                            ⟨303276⟩
v304 = 20                                                                                             ⟨303278⟩
v3149 = 94                                                                                            ⟨303280⟩
v3147 = v300                                                                                          ⟨303282⟩
v3145 = v302                                                                                          ⟨303284⟩
v3143 = v304                                                                                          ⟨303286⟩
si byte_495FC != 0 :
    v286 = 0                                                                                          ⟨303319⟩
    v281 = 0                                                                                          ⟨303320⟩
    v280 = 0                                                                                          ⟨303321⟩
    v256 = 0                                                                                          ⟨303347⟩
    v251 = 0                                                                                          ⟨303348⟩
    v250 = 0                                                                                          ⟨303349⟩
    voix_arrête(voix=voix1)                                                                           ⟨303687⟩
    canal_arrête(canal=canal2)                                                                        ⟨303710⟩
    retour                                                                                            ⟨303791⟩
si v19 != 0 :
    v306 = word_48F76                                                                                 ⟨303798⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v970)                                         ⟨303805⟩
        sub_30C66(canal2.+0→4, v970, v306, 0)                                                         ⟨303812⟩

──── scène1 ────
scène1 = Scene_Create(cadence=6, palette=255, surface=&v584)                                          ⟨303824⟩
c1 = Layer(ressource=midgames 42, x=0, y=-80)                                                         ⟨303831⟩
c2 = Layer(ressource=midgames 33, x=0, y=0)                                                           ⟨303839⟩
c3 = Layer(ressource=midgames 34, x=0, y=0)                                                           ⟨303847⟩
c4 = Layer(ressource=midgames 35, x=0, y=0)                                                           ⟨303855⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨303865⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨303874⟩
ajoute c1 à scène1                                                                                    ⟨303879⟩
ajoute c2 à scène1                                                                                    ⟨303884⟩
ajoute c3 à scène1                                                                                    ⟨303889⟩
ajoute c4 à scène1                                                                                    ⟨303894⟩
fondu_disparition(palette=pal1, couleur=&v38, pas=0, premier=0, nombre=256)                           ⟨303907⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨303916⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨303925⟩
Scene_Tick(scène=scène1)                                                                              ⟨303929⟩
fondu_apparition(palette=pal1, couleur=&v38, pas=2, premier=0, nombre=256)                            ⟨303938⟩
si v20 != 0 :
    Scene_Tick(scène=scène1)                                                                          ⟨303948⟩
    charge(mid33voc 0)                                                                                ⟨303960⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 0)                                 ⟨303966⟩
    di = 0                                                                                            ⟨303968⟩
    tant que di < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨303975⟩
        di = di + 1                                                                                   ⟨303977⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨303985⟩
    tant que sub_8500(voix1) != 0 :
        si touche_passer() != 0 : aller à loc_A55F7                                                   ⟨303993⟩
        Scene_Tick(scène=scène1)                                                                      ⟨304000⟩
    loc_A55F7:                                                                                        ⟨304011⟩
    di = 0                                                                                            ⟨304012⟩
    tant que di < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨304019⟩
        di = di + 1                                                                                   ⟨304021⟩
    voix_arrête(voix=voix1)                                                                           ⟨304028⟩
sinon :
    Widget_Method_DispatchC_314CB(zone1, 0)                                                           ⟨304056⟩
    Widget_Method_Dispatch8_314A9(zone1, 12)                                                          ⟨304061⟩
    v14 = 53                                                                                          ⟨304063⟩
    v12 = scène1.compteur + ((v14·70) / 100)                                                          ⟨304073⟩
    tant que (scène1.compteur < v12) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨304078⟩
        si scène1.compteur + 3 == scène1.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[0])                              ⟨304086⟩
        si v12 - 1 == scène1.compteur :
            v3220 = 4540                                                                              ⟨304094⟩
            v3220 = 4552                                                                              ⟨304095⟩
            v3220 = 4568                                                                              ⟨304096⟩
            v3220 = 4584                                                                              ⟨304097⟩
            v3220 = 4604                                                                              ⟨304098⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨304108⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨304115⟩
            v3232 = 4552                                                                              ⟨304116⟩
            v3232 = 4568                                                                              ⟨304117⟩
            v3232 = 4584                                                                              ⟨304118⟩
            v3232 = 4604                                                                              ⟨304119⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨304129⟩
            aller à loc_A577D                                                                         ⟨304131⟩
        Scene_Tick(scène=scène1)                                                                      ⟨304137⟩
    loc_A577D:                                                                                        ⟨304162⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène1, drapeaux=0)                                                      ⟨304173⟩
        v286 = 0                                                                                      ⟨304200⟩
        v281 = 0                                                                                      ⟨304201⟩
        v280 = 0                                                                                      ⟨304202⟩
        v256 = 0                                                                                      ⟨304228⟩
        v251 = 0                                                                                      ⟨304229⟩
        v250 = 0                                                                                      ⟨304230⟩
        voix_arrête(voix=voix1)                                                                       ⟨304568⟩
        canal_arrête(canal=canal2)                                                                    ⟨304591⟩
        retour                                                                                        ⟨304672⟩
    v14 = 61                                                                                          ⟨304676⟩
    v12 = scène1.compteur + ((v14·70) / 100)                                                          ⟨304686⟩
    tant que (scène1.compteur < v12) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨304691⟩
        si scène1.compteur + 1 == scène1.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[1])                              ⟨304701⟩
        si v12 - 1 == scène1.compteur :
            v3220 = 4540                                                                              ⟨304709⟩
            v3220 = 4552                                                                              ⟨304710⟩
            v3220 = 4568                                                                              ⟨304711⟩
            v3220 = 4584                                                                              ⟨304712⟩
            v3220 = 4604                                                                              ⟨304713⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨304723⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨304730⟩
            v3232 = 4552                                                                              ⟨304731⟩
            v3232 = 4568                                                                              ⟨304732⟩
            v3232 = 4584                                                                              ⟨304733⟩
            v3232 = 4604                                                                              ⟨304734⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨304744⟩
            aller à loc_A5EB8                                                                         ⟨304746⟩
        Scene_Tick(scène=scène1)                                                                      ⟨304752⟩
loc_A5EB8:                                                                                            ⟨304777⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨304782⟩
si byte_495FC != 0 :
    v286 = 0                                                                                          ⟨304815⟩
    v281 = 0                                                                                          ⟨304816⟩
    v280 = 0                                                                                          ⟨304817⟩
    v256 = 0                                                                                          ⟨304843⟩
    v251 = 0                                                                                          ⟨304844⟩
    v250 = 0                                                                                          ⟨304845⟩
    voix_arrête(voix=voix1)                                                                           ⟨305183⟩
    canal_arrête(canal=canal2)                                                                        ⟨305206⟩
    retour                                                                                            ⟨305287⟩
charge(midgames 32)                                                                                   ⟨305301⟩
charge(midgames 39)                                                                                   ⟨305313⟩

──── scène2 ────
scène2 = Scene_Create(cadence=6, palette=255, surface=&v584)                                          ⟨305321⟩
c5 = Layer(ressource=midgames 32, x=0, y=0)                                                           ⟨305328⟩
si v1 != 0 :
    v332 = 0                                                                                          ⟨305333⟩
    v334 = 7                                                                                          ⟨305334⟩
    v336 = 14                                                                                         ⟨305335⟩
sinon :
    v332 = 4                                                                                          ⟨305340⟩
    v334 = 11                                                                                         ⟨305341⟩
    v336 = 0                                                                                          ⟨305342⟩
sub_ACF1(0, zone2, 0, v332)                                                                           ⟨305350⟩
v338 = sub_ACF1(0, zone2, 0, v332)                                                                    ⟨305352⟩
sub_ACF1(0, zone2, 0, v334)                                                                           ⟨305358⟩
v340 = sub_ACF1(0, zone2, 0, v334)                                                                    ⟨305360⟩
sub_ACF1(0, zone2, 0, v336)                                                                           ⟨305366⟩
v342 = sub_ACF1(0, zone2, 0, v336)                                                                    ⟨305368⟩
ajoute c5 à scène2                                                                                    ⟨305372⟩
si v1 != 0 :
    sub_ADB7(v338, &v404)                                                                             ⟨305379⟩
    sub_ADB7(v340, &v446)                                                                             ⟨305384⟩
    sub_ADB7(v342, &v490)                                                                             ⟨305389⟩
    ajoute v338 à scène2                                                                              ⟨305394⟩
    ajoute v340 à scène2                                                                              ⟨305399⟩
    ajoute v342 à scène2                                                                              ⟨305404⟩
sinon :
    sub_ADB7(v338, &v404)                                                                             ⟨305413⟩
    sub_ADB7(v340, &v490)                                                                             ⟨305418⟩
    ajoute v338 à scène2                                                                              ⟨305423⟩
    ajoute v340 à scène2                                                                              ⟨305428⟩
    si v342 != 0 :
        v342→0.méthode0(3)                                                                            ⟨305436⟩
palette_copie(destination=pal1, source=pal7(midgames 41))                                             ⟨305449⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨305461⟩
si v20 != 0 :
    Scene_Tick(scène=scène2)                                                                          ⟨305471⟩
    charge(mid33voc 1)                                                                                ⟨305483⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 1)                                 ⟨305489⟩
    di = 0                                                                                            ⟨305491⟩
    tant que di < 2 :
        Scene_Tick(scène=scène2)                                                                      ⟨305498⟩
        di = di + 1                                                                                   ⟨305500⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨305508⟩
    tant que sub_8500(voix1) != 0 :
        si touche_passer() != 0 : aller à loc_A67BD                                                   ⟨305516⟩
        Scene_Tick(scène=scène2)                                                                      ⟨305523⟩
    loc_A67BD:                                                                                        ⟨305534⟩
    voix_arrête(voix=voix1)                                                                           ⟨305537⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨305567⟩
        v286 = 0                                                                                      ⟨305632⟩
        v281 = 0                                                                                      ⟨305633⟩
        v280 = 0                                                                                      ⟨305634⟩
        v256 = 0                                                                                      ⟨305660⟩
        v251 = 0                                                                                      ⟨305661⟩
        v250 = 0                                                                                      ⟨305662⟩
        voix_arrête(voix=voix1)                                                                       ⟨306000⟩
        canal_arrête(canal=canal2)                                                                    ⟨306023⟩
        retour                                                                                        ⟨306104⟩
    di = 0                                                                                            ⟨306108⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨306115⟩
        di = di + 1                                                                                   ⟨306117⟩
    charge(mid33voc 2)                                                                                ⟨306132⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 2)                                 ⟨306138⟩
    di = 0                                                                                            ⟨306140⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨306147⟩
        di = di + 1                                                                                   ⟨306149⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨306157⟩
    tant que sub_8500(voix1) != 0 :
        si touche_passer() != 0 : aller à loc_A6F6A                                                   ⟨306165⟩
        Scene_Tick(scène=scène2)                                                                      ⟨306172⟩
    loc_A6F6A:                                                                                        ⟨306183⟩
    di = 0                                                                                            ⟨306184⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨306191⟩
        di = di + 1                                                                                   ⟨306193⟩
    voix_arrête(voix=voix1)                                                                           ⟨306200⟩
sinon :
    Widget_Method_DispatchC_314CB(zone1, 0)                                                           ⟨306247⟩
    Widget_Method_Dispatch8_314A9(zone1, 254)                                                         ⟨306252⟩
    v14 = 66                                                                                          ⟨306254⟩
    v12 = scène2.compteur + ((v14·70) / 100)                                                          ⟨306264⟩
    tant que (scène2.compteur < v12) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨306269⟩
        si scène2.compteur + 3 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[2])                              ⟨306281⟩
        si v12 - 1 == scène2.compteur :
            v3220 = 4540                                                                              ⟨306289⟩
            v3220 = 4552                                                                              ⟨306290⟩
            v3220 = 4568                                                                              ⟨306291⟩
            v3220 = 4584                                                                              ⟨306292⟩
            v3220 = 4604                                                                              ⟨306293⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨306303⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨306310⟩
            v3232 = 4552                                                                              ⟨306311⟩
            v3232 = 4568                                                                              ⟨306312⟩
            v3232 = 4584                                                                              ⟨306313⟩
            v3232 = 4604                                                                              ⟨306314⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨306324⟩
            aller à loc_A7138                                                                         ⟨306326⟩
        Scene_Tick(scène=scène2)                                                                      ⟨306332⟩
    loc_A7138:                                                                                        ⟨306357⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨306368⟩
        v286 = 0                                                                                      ⟨306433⟩
        v281 = 0                                                                                      ⟨306434⟩
        v280 = 0                                                                                      ⟨306435⟩
        v256 = 0                                                                                      ⟨306461⟩
        v251 = 0                                                                                      ⟨306462⟩
        v250 = 0                                                                                      ⟨306463⟩
        voix_arrête(voix=voix1)                                                                       ⟨306801⟩
        canal_arrête(canal=canal2)                                                                    ⟨306824⟩
        retour                                                                                        ⟨306905⟩
    v14 = 70                                                                                          ⟨306909⟩
    v12 = scène2.compteur + ((v14·70) / 100)                                                          ⟨306919⟩
    tant que (scène2.compteur < v12) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨306924⟩
        si scène2.compteur + 1 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[4])                              ⟨306936⟩
        si v12 - 1 == scène2.compteur :
            v3220 = 4540                                                                              ⟨306944⟩
            v3220 = 4552                                                                              ⟨306945⟩
            v3220 = 4568                                                                              ⟨306946⟩
            v3220 = 4584                                                                              ⟨306947⟩
            v3220 = 4604                                                                              ⟨306948⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨306958⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨306965⟩
            v3232 = 4552                                                                              ⟨306966⟩
            v3232 = 4568                                                                              ⟨306967⟩
            v3232 = 4584                                                                              ⟨306968⟩
            v3232 = 4604                                                                              ⟨306969⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨306979⟩
            aller à loc_A78F6                                                                         ⟨306981⟩
        Scene_Tick(scène=scène2)                                                                      ⟨306987⟩
loc_A78F6:                                                                                            ⟨307012⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨307017⟩
si byte_495FC != 0 :
    v286 = 0                                                                                          ⟨307088⟩
    v281 = 0                                                                                          ⟨307089⟩
    v280 = 0                                                                                          ⟨307090⟩
    v256 = 0                                                                                          ⟨307116⟩
    v251 = 0                                                                                          ⟨307117⟩
    v250 = 0                                                                                          ⟨307118⟩
    voix_arrête(voix=voix1)                                                                           ⟨307456⟩
    canal_arrête(canal=canal2)                                                                        ⟨307479⟩
    retour                                                                                            ⟨307560⟩

──── scène3 ────
scène3 = Scene_Create(cadence=9, palette=255, surface=&v584)                                          ⟨307570⟩
c6 = Layer(ressource=midgames 44, x=0, y=0)                                                           ⟨307577⟩
CRT_Rand()                                                                                            ⟨307581⟩
c7 = TalkingHead(ressource=convdata type 0 "tex", x=((CRT_Rand()·5) / -32768) + 158, y=128)           ⟨307592⟩
di = c7                                                                                               ⟨307594⟩
tête_image_de_base(tête=c7, image=19)                                                                 ⟨307597⟩
ajoute c6 à scène3                                                                                    ⟨307602⟩
ajoute c7 à scène3                                                                                    ⟨307607⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨307616⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨307625⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨307637⟩
si v20 != 0 :
    Scene_Tick(scène=scène3)                                                                          ⟨307647⟩
    charge(mid33voc 3)                                                                                ⟨307659⟩
    sub_9CF7(c7, mid33voc 3, 9)                                                                       ⟨307665⟩
    tant que sub_9C64(c7) != 0 :
        si v322 == 5 :
            tête_image_de_base(tête=c7, image=12)                                                     ⟨307676⟩
        si v322 == 6 :
            tête_image_de_base(tête=c7, image=19)                                                     ⟨307684⟩
        si v322 == 9 :
            tête_image_de_base(tête=c7, image=12)                                                     ⟨307692⟩
        si v322 == 10 :
            tête_image_de_base(tête=c7, image=19)                                                     ⟨307700⟩
        si v322 == 15 :
            tête_image_de_base(tête=c7, image=12)                                                     ⟨307708⟩
        si v322 == 16 :
            tête_image_de_base(tête=c7, image=-1)                                                     ⟨307716⟩
        si v322 == 19 :
            tête_image_de_base(tête=c7, image=12)                                                     ⟨307724⟩
        v322 = v322 + 1                                                                               ⟨307729⟩
        si v322 == 20 :
            tête_image_de_base(tête=c7, image=-1)                                                     ⟨307734⟩
        si touche_passer() != 0 : aller à loc_A81A5                                                   ⟨307740⟩
        Scene_Tick(scène=scène3)                                                                      ⟨307747⟩
    loc_A81A5:                                                                                        ⟨307759⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène3, drapeaux=0)                                                      ⟨307789⟩
        v286 = 0                                                                                      ⟨307816⟩
        v281 = 0                                                                                      ⟨307817⟩
        v280 = 0                                                                                      ⟨307818⟩
        v256 = 0                                                                                      ⟨307844⟩
        v251 = 0                                                                                      ⟨307845⟩
        v250 = 0                                                                                      ⟨307846⟩
        voix_arrête(voix=voix1)                                                                       ⟨308184⟩
        canal_arrête(canal=canal2)                                                                    ⟨308207⟩
        retour                                                                                        ⟨308288⟩
    tête_image_de_base(tête=c7, image=19)                                                             ⟨308294⟩
    tant que v322 < 8 :
        Scene_Tick(scène=scène3)                                                                      ⟨308303⟩
        v322 = v322 + 1                                                                               ⟨308305⟩
sinon :
    v3096→0.méthode8(254)                                                                             ⟨308337⟩
    v14 = 48                                                                                          ⟨308339⟩
    v12 = scène3.compteur + ((v14·70) / 100)                                                          ⟨308349⟩
    tant que (scène3.compteur < v12) et (scène3.terminée == 0) :
        v312 = scène3.compteur                                                                        ⟨308355⟩
        si scène3.compteur + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[5])                              ⟨308368⟩
        si scène3.compteur + 3 == v312 :
            tête_texte_de_lèvres(tête=c7, texte="btnwthtjbhzfalntme")                                 ⟨308378⟩
        si scène3.compteur + 15 == v312 :
            tête_image_de_base(tête=c7, image=12)                                                     ⟨308388⟩
        si scène3.compteur + 16 == v312 :
            tête_image_de_base(tête=c7, image=19)                                                     ⟨308398⟩
        si scène3.compteur + 19 == v312 :
            tête_image_de_base(tête=c7, image=12)                                                     ⟨308408⟩
        si scène3.compteur + 20 == v312 :
            tête_image_de_base(tête=c7, image=19)                                                     ⟨308418⟩
        si v12 - 1 == v312 :
            v3220 = 4540                                                                              ⟨308426⟩
            v3220 = 4552                                                                              ⟨308427⟩
            v3220 = 4568                                                                              ⟨308428⟩
            v3220 = 4584                                                                              ⟨308429⟩
            v3220 = 4604                                                                              ⟨308430⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨308440⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨308447⟩
            v3232 = 4552                                                                              ⟨308448⟩
            v3232 = 4568                                                                              ⟨308449⟩
            v3232 = 4584                                                                              ⟨308450⟩
            v3232 = 4604                                                                              ⟨308451⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨308461⟩
            aller à loc_A8A1F                                                                         ⟨308463⟩
        Scene_Tick(scène=scène3)                                                                      ⟨308469⟩
    loc_A8A1F:                                                                                        ⟨308494⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène3, drapeaux=0)                                                      ⟨308505⟩
        v286 = 0                                                                                      ⟨308532⟩
        v281 = 0                                                                                      ⟨308533⟩
        v280 = 0                                                                                      ⟨308534⟩
        v256 = 0                                                                                      ⟨308560⟩
        v251 = 0                                                                                      ⟨308561⟩
        v250 = 0                                                                                      ⟨308562⟩
        voix_arrête(voix=voix1)                                                                       ⟨308900⟩
        canal_arrête(canal=canal2)                                                                    ⟨308923⟩
        retour                                                                                        ⟨309004⟩
    v14 = 44                                                                                          ⟨309008⟩
    v12 = scène3.compteur + ((v14·70) / 100)                                                          ⟨309018⟩
    tant que (scène3.compteur < v12) et (scène3.terminée == 0) :
        v312 = scène3.compteur                                                                        ⟨309024⟩
        si scène3.compteur + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])                              ⟨309037⟩
        si scène3.compteur + 3 == v312 :
            tête_texte_de_lèvres(tête=c7, texte="Itsjbivlwyzwntd")                                    ⟨309047⟩
        si scène3.compteur + 15 == v312 :
            tête_image_de_base(tête=c7, image=12)                                                     ⟨309057⟩
        si scène3.compteur + 16 == v312 :
            tête_image_de_base(tête=c7, image=-1)                                                     ⟨309067⟩
        si scène3.compteur + 19 == v312 :
            tête_image_de_base(tête=c7, image=12)                                                     ⟨309077⟩
        si scène3.compteur + 20 == v312 :
            tête_image_de_base(tête=c7, image=-1)                                                     ⟨309087⟩
        si v12 - 1 == v312 :
            v3220 = 4540                                                                              ⟨309095⟩
            v3220 = 4552                                                                              ⟨309096⟩
            v3220 = 4568                                                                              ⟨309097⟩
            v3220 = 4584                                                                              ⟨309098⟩
            v3220 = 4604                                                                              ⟨309099⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨309109⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨309116⟩
            v3232 = 4552                                                                              ⟨309117⟩
            v3232 = 4568                                                                              ⟨309118⟩
            v3232 = 4584                                                                              ⟨309119⟩
            v3232 = 4604                                                                              ⟨309120⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨309130⟩
            aller à loc_A91DA                                                                         ⟨309132⟩
        Scene_Tick(scène=scène3)                                                                      ⟨309138⟩
    loc_A91DA:                                                                                        ⟨309163⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène3, drapeaux=0)                                                      ⟨309174⟩
        v286 = 0                                                                                      ⟨309201⟩
        v281 = 0                                                                                      ⟨309202⟩
        v280 = 0                                                                                      ⟨309203⟩
        v256 = 0                                                                                      ⟨309229⟩
        v251 = 0                                                                                      ⟨309230⟩
        v250 = 0                                                                                      ⟨309231⟩
        voix_arrête(voix=voix1)                                                                       ⟨309569⟩
        canal_arrête(canal=canal2)                                                                    ⟨309592⟩
        retour                                                                                        ⟨309673⟩
    v14 = 38                                                                                          ⟨309677⟩
    v12 = scène3.compteur + ((v14·70) / 100)                                                          ⟨309687⟩
    tant que (scène3.compteur < v12) et (scène3.terminée == 0) :
        v312 = scène3.compteur                                                                        ⟨309693⟩
        si scène3.compteur + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[7])                              ⟨309706⟩
        si scène3.compteur + 3 == v312 :
            tête_texte_de_lèvres(tête=c7, texte="btnotlkths")                                         ⟨309716⟩
        si scène3.compteur + 15 == v312 :
            tête_image_de_base(tête=c7, image=12)                                                     ⟨309726⟩
        si scène3.compteur + 16 == v312 :
            tête_image_de_base(tête=c7, image=19)                                                     ⟨309736⟩
        si scène3.compteur + 19 == v312 :
            tête_image_de_base(tête=c7, image=12)                                                     ⟨309746⟩
        si scène3.compteur + 20 == v312 :
            tête_image_de_base(tête=c7, image=19)                                                     ⟨309756⟩
        si v12 - 1 == v312 :
            v3220 = 4540                                                                              ⟨309764⟩
            v3220 = 4552                                                                              ⟨309765⟩
            v3220 = 4568                                                                              ⟨309766⟩
            v3220 = 4584                                                                              ⟨309767⟩
            v3220 = 4604                                                                              ⟨309768⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨309778⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨309785⟩
            v3232 = 4552                                                                              ⟨309786⟩
            v3232 = 4568                                                                              ⟨309787⟩
            v3232 = 4584                                                                              ⟨309788⟩
            v3232 = 4604                                                                              ⟨309789⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨309799⟩
            aller à loc_A9995                                                                         ⟨309801⟩
        Scene_Tick(scène=scène3)                                                                      ⟨309807⟩
loc_A9995:                                                                                            ⟨309832⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨309837⟩
si byte_495FC != 0 :
    v286 = 0                                                                                          ⟨309870⟩
    v281 = 0                                                                                          ⟨309871⟩
    v280 = 0                                                                                          ⟨309872⟩
    v256 = 0                                                                                          ⟨309898⟩
    v251 = 0                                                                                          ⟨309899⟩
    v250 = 0                                                                                          ⟨309900⟩
    voix_arrête(voix=voix1)                                                                           ⟨310238⟩
    canal_arrête(canal=canal2)                                                                        ⟨310261⟩
    retour                                                                                            ⟨310342⟩

──── scène4 ────
scène4 = Scene_Create(cadence=9, palette=255, surface=&v584)                                          ⟨310352⟩
c8 = Layer(ressource=midgames 42, x=0, y=-80)                                                         ⟨310359⟩
c9 = TalkingHead(ressource=convdata type 0 "gwen", x=164, y=128)                                      ⟨310367⟩
tête_image_de_base(tête=c9, image=31)                                                                 ⟨310372⟩
ajoute c8 à scène4                                                                                    ⟨310377⟩
ajoute c9 à scène4                                                                                    ⟨310382⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨310391⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨310400⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨310412⟩
si v20 != 0 :
    Scene_Tick(scène=scène4)                                                                          ⟨310422⟩
    charge(mid33voc 4)                                                                                ⟨310434⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 4)                                 ⟨310440⟩
    di = 0                                                                                            ⟨310442⟩
    tant que di < 8 :
        Scene_Tick(scène=scène4)                                                                      ⟨310449⟩
        di = di + 1                                                                                   ⟨310451⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨310459⟩
    di = 0                                                                                            ⟨310461⟩
    tant que sub_8500(voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c9, image=12)                                                     ⟨310470⟩
        si di == 8 :
            tête_image_de_base(tête=c9, image=21)                                                     ⟨310478⟩
        di = di + 1                                                                                   ⟨310483⟩
        si di == 17 :
            tête_image_de_base(tête=c9, image=12)                                                     ⟨310488⟩
        si touche_passer() != 0 : aller à loc_AA17C                                                   ⟨310494⟩
        Scene_Tick(scène=scène4)                                                                      ⟨310501⟩
    loc_AA17C:                                                                                        ⟨310512⟩
    di = 0                                                                                            ⟨310513⟩
    tant que di < 12 :
        Scene_Tick(scène=scène4)                                                                      ⟨310520⟩
        di = di + 1                                                                                   ⟨310522⟩
    voix_arrête(voix=voix1)                                                                           ⟨310529⟩
sinon :
    v3096→0.méthode8(254)                                                                             ⟨310558⟩
    v14 = 40                                                                                          ⟨310560⟩
    v12 = scène4.compteur + ((v14·70) / 100)                                                          ⟨310570⟩
    tant que (scène4.compteur < v12) et (scène4.terminée == 0) :
        di = scène4.compteur                                                                          ⟨310575⟩
        si scène4.compteur + 1 == scène4.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])                              ⟨310587⟩
        si scène4.compteur + 17 == scène4.compteur :
            tête_image_de_base(tête=c9, image=12)                                                     ⟨310597⟩
        si scène4.compteur + 18 == scène4.compteur :
            tête_image_de_base(tête=c9, image=21)                                                     ⟨310607⟩
        si scène4.compteur + 27 == scène4.compteur :
            tête_image_de_base(tête=c9, image=12)                                                     ⟨310617⟩
        si v12 - 1 == scène4.compteur :
            v3220 = 4540                                                                              ⟨310625⟩
            v3220 = 4552                                                                              ⟨310626⟩
            v3220 = 4568                                                                              ⟨310627⟩
            v3220 = 4584                                                                              ⟨310628⟩
            v3220 = 4604                                                                              ⟨310629⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨310639⟩
        si touche_passer() != 0 : aller à loc_AA301                                                   ⟨310645⟩
        Scene_Tick(scène=scène4)                                                                      ⟨310652⟩
loc_AA301:                                                                                            ⟨310677⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨310682⟩
si byte_495FC != 0 :
    v286 = 0                                                                                          ⟨310715⟩
    v281 = 0                                                                                          ⟨310716⟩
    v280 = 0                                                                                          ⟨310717⟩
    v256 = 0                                                                                          ⟨310743⟩
    v251 = 0                                                                                          ⟨310744⟩
    v250 = 0                                                                                          ⟨310745⟩
    voix_arrête(voix=voix1)                                                                           ⟨311083⟩
    canal_arrête(canal=canal2)                                                                        ⟨311106⟩
    retour                                                                                            ⟨311187⟩

──── scène5 ────
scène5 = Scene_Create(cadence=9, palette=255, surface=&v584)                                          ⟨311197⟩
c10 = Layer(ressource=midgames 44, x=0, y=0)                                                          ⟨311204⟩
c11 = TalkingHead(ressource=convdata type 0 "miguel", x=255, y=128)                                   ⟨311212⟩
c12 = TalkingHead(ressource=convdata type 0 "billy", x=95, y=128)                                     ⟨311220⟩
tête_image_de_base(tête=c12, image=19)                                                                ⟨311225⟩
tête_image_de_base(tête=c11, image=19)                                                                ⟨311229⟩
ajoute c10 à scène5                                                                                   ⟨311234⟩
ajoute c11 à scène5                                                                                   ⟨311239⟩
ajoute c12 à scène5                                                                                   ⟨311244⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨311253⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨311262⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨311274⟩
si v20 != 0 :
    Scene_Tick(scène=scène5)                                                                          ⟨311284⟩
    charge(mid33voc 5)                                                                                ⟨311296⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 5)                                 ⟨311302⟩
    di = 0                                                                                            ⟨311304⟩
    tant que di < 4 :
        Scene_Tick(scène=scène5)                                                                      ⟨311311⟩
        di = di + 1                                                                                   ⟨311313⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨311321⟩
    di = 0                                                                                            ⟨311323⟩
    tant que sub_8500(voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨311332⟩
        si di == 8 :
            tête_image_de_base(tête=c12, image=21)                                                    ⟨311340⟩
        si di == 9 :
            tête_image_de_base(tête=c12, image=-1)                                                    ⟨311348⟩
        si di == 16 :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨311356⟩
        si di == 18 :
            tête_image_de_base(tête=c12, image=21)                                                    ⟨311364⟩
        si di == 2 :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨311372⟩
        si di == 3 :
            tête_image_de_base(tête=c11, image=21)                                                    ⟨311380⟩
        di = di + 1                                                                                   ⟨311385⟩
        si di == 22 :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨311390⟩
        si touche_passer() != 0 : aller à loc_AAB85                                                   ⟨311396⟩
        Scene_Tick(scène=scène5)                                                                      ⟨311403⟩
    loc_AAB85:                                                                                        ⟨311416⟩
    voix_arrête(voix=voix1)                                                                           ⟨311420⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène5, drapeaux=0)                                                      ⟨311450⟩
        v286 = 0                                                                                      ⟨311477⟩
        v281 = 0                                                                                      ⟨311478⟩
        v280 = 0                                                                                      ⟨311479⟩
        v256 = 0                                                                                      ⟨311505⟩
        v251 = 0                                                                                      ⟨311506⟩
        v250 = 0                                                                                      ⟨311507⟩
        voix_arrête(voix=voix1)                                                                       ⟨311845⟩
        canal_arrête(canal=canal2)                                                                    ⟨311868⟩
        retour                                                                                        ⟨311949⟩
    di = 0                                                                                            ⟨311953⟩
    tant que di < 8 :
        Scene_Tick(scène=scène5)                                                                      ⟨311960⟩
        di = di + 1                                                                                   ⟨311962⟩
sinon :
    v3096→0.méthode8(254)                                                                             ⟨311994⟩
    v14 = 71                                                                                          ⟨311996⟩
    v12 = scène5.compteur + ((v14·70) / 100)                                                          ⟨312006⟩
    tant que (scène5.compteur < v12) et (scène5.terminée == 0) :
        di = scène5.compteur                                                                          ⟨312011⟩
        si scène5.compteur + 2 == scène5.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[9])                              ⟨312024⟩
        si scène5.compteur + 17 == scène5.compteur :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨312034⟩
        si scène5.compteur + 18 == scène5.compteur :
            tête_image_de_base(tête=c12, image=21)                                                    ⟨312044⟩
        si scène5.compteur + 19 == scène5.compteur :
            tête_image_de_base(tête=c12, image=-1)                                                    ⟨312054⟩
        si scène5.compteur + 26 == scène5.compteur :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨312064⟩
        si scène5.compteur + 28 == scène5.compteur :
            tête_image_de_base(tête=c12, image=21)                                                    ⟨312074⟩
        si scène5.compteur + 7 == scène5.compteur :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨312084⟩
        si scène5.compteur + 8 == scène5.compteur :
            tête_image_de_base(tête=c11, image=21)                                                    ⟨312094⟩
        si scène5.compteur + 32 == scène5.compteur :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨312104⟩
        si v12 - 1 == scène5.compteur :
            v3220 = 4540                                                                              ⟨312112⟩
            v3220 = 4552                                                                              ⟨312113⟩
            v3220 = 4568                                                                              ⟨312114⟩
            v3220 = 4584                                                                              ⟨312115⟩
            v3220 = 4604                                                                              ⟨312116⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨312126⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨312133⟩
            v3232 = 4552                                                                              ⟨312134⟩
            v3232 = 4568                                                                              ⟨312135⟩
            v3232 = 4584                                                                              ⟨312136⟩
            v3232 = 4604                                                                              ⟨312137⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨312147⟩
            aller à loc_AB439                                                                         ⟨312149⟩
        Scene_Tick(scène=scène5)                                                                      ⟨312155⟩
loc_AB439:                                                                                            ⟨312180⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨312185⟩
si byte_495FC != 0 :
    v286 = 0                                                                                          ⟨312218⟩
    v281 = 0                                                                                          ⟨312219⟩
    v280 = 0                                                                                          ⟨312220⟩
    v256 = 0                                                                                          ⟨312246⟩
    v251 = 0                                                                                          ⟨312247⟩
    v250 = 0                                                                                          ⟨312248⟩
    voix_arrête(voix=voix1)                                                                           ⟨312586⟩
    canal_arrête(canal=canal2)                                                                        ⟨312609⟩
    retour                                                                                            ⟨312690⟩
charge(midgames 30)                                                                                   ⟨312704⟩

──── scène6 ────
scène6 = Scene_Create(cadence=6, palette=255, surface=&v584)                                          ⟨312712⟩
c13 = Layer(ressource=midgames 30, x=0, y=0)                                                          ⟨312719⟩
palette_alloue(palette=pal8, premier=0, nombre=256)                                                   ⟨312727⟩
palette_copie(destination=pal8, source=pal6(midgames 40))                                             ⟨312736⟩
sub_CBAB()                                                                                            ⟨312738⟩
ajoute c13 à scène6                                                                                   ⟨312743⟩
si v20 != 0 :
    Scene_Tick(scène=scène6)                                                                          ⟨312753⟩
    charge(mid33voc 6)                                                                                ⟨312765⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 6)                                 ⟨312771⟩
    di = 0                                                                                            ⟨312773⟩
    tant que di < 4 :
        Scene_Tick(scène=scène6)                                                                      ⟨312780⟩
        di = di + 1                                                                                   ⟨312782⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨312790⟩
    tant que sub_8500(voix1) != 0 :
        si touche_passer() != 0 : aller à loc_ABBC4                                                   ⟨312798⟩
        Scene_Tick(scène=scène6)                                                                      ⟨312805⟩
    loc_ABBC4:                                                                                        ⟨312816⟩
    voix_arrête(voix=voix1)                                                                           ⟨312819⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène6, drapeaux=0)                                                      ⟨312849⟩
        v286 = 0                                                                                      ⟨312895⟩
        v281 = 0                                                                                      ⟨312896⟩
        v280 = 0                                                                                      ⟨312897⟩
        v256 = 0                                                                                      ⟨312923⟩
        v251 = 0                                                                                      ⟨312924⟩
        v250 = 0                                                                                      ⟨312925⟩
        voix_arrête(voix=voix1)                                                                       ⟨313263⟩
        canal_arrête(canal=canal2)                                                                    ⟨313286⟩
        retour                                                                                        ⟨313367⟩
    di = 0                                                                                            ⟨313371⟩
    tant que di < 8 :
        Scene_Tick(scène=scène6)                                                                      ⟨313378⟩
        di = di + 1                                                                                   ⟨313380⟩
sinon :
    Widget_Method_DispatchC_314CB(zone1, 0)                                                           ⟨313411⟩
    Widget_Method_Dispatch8_314A9(zone1, 79)                                                          ⟨313416⟩
    v14 = 56                                                                                          ⟨313418⟩
    v12 = scène6.compteur + ((v14·70) / 100)                                                          ⟨313428⟩
    tant que (scène6.compteur < v12) et (scène6.terminée == 0) :
        di = scène6.compteur                                                                          ⟨313433⟩
        si scène6.compteur + 3 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[10])                             ⟨313446⟩
        si v12 - 1 == scène6.compteur :
            v3220 = 4540                                                                              ⟨313454⟩
            v3220 = 4552                                                                              ⟨313455⟩
            v3220 = 4568                                                                              ⟨313456⟩
            v3220 = 4584                                                                              ⟨313457⟩
            v3220 = 4604                                                                              ⟨313458⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨313468⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨313475⟩
            v3232 = 4552                                                                              ⟨313476⟩
            v3232 = 4568                                                                              ⟨313477⟩
            v3232 = 4584                                                                              ⟨313478⟩
            v3232 = 4604                                                                              ⟨313479⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨313489⟩
            aller à loc_AC40A                                                                         ⟨313491⟩
        Scene_Tick(scène=scène6)                                                                      ⟨313497⟩
    loc_AC40A:                                                                                        ⟨313522⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène6, drapeaux=0)                                                      ⟨313533⟩
        v286 = 0                                                                                      ⟨313579⟩
        v281 = 0                                                                                      ⟨313580⟩
        v280 = 0                                                                                      ⟨313581⟩
        v256 = 0                                                                                      ⟨313607⟩
        v251 = 0                                                                                      ⟨313608⟩
        v250 = 0                                                                                      ⟨313609⟩
        voix_arrête(voix=voix1)                                                                       ⟨313947⟩
        canal_arrête(canal=canal2)                                                                    ⟨313970⟩
        retour                                                                                        ⟨314051⟩
    v14 = 60                                                                                          ⟨314055⟩
    v12 = scène6.compteur + ((v14·70) / 100)                                                          ⟨314065⟩
    tant que (scène6.compteur < v12) et (scène6.terminée == 0) :
        di = scène6.compteur                                                                          ⟨314070⟩
        si scène6.compteur + 1 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[11])                             ⟨314083⟩
        si v12 - 1 == scène6.compteur :
            v3220 = 4540                                                                              ⟨314091⟩
            v3220 = 4552                                                                              ⟨314092⟩
            v3220 = 4568                                                                              ⟨314093⟩
            v3220 = 4584                                                                              ⟨314094⟩
            v3220 = 4604                                                                              ⟨314095⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨314105⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨314112⟩
            v3232 = 4552                                                                              ⟨314113⟩
            v3232 = 4568                                                                              ⟨314114⟩
            v3232 = 4584                                                                              ⟨314115⟩
            v3232 = 4604                                                                              ⟨314116⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨314126⟩
            aller à loc_ACB8B                                                                         ⟨314128⟩
        Scene_Tick(scène=scène6)                                                                      ⟨314134⟩
loc_ACB8B:                                                                                            ⟨314159⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨314164⟩
si byte_495FC != 0 :
    v286 = 0                                                                                          ⟨314216⟩
    v281 = 0                                                                                          ⟨314217⟩
    v280 = 0                                                                                          ⟨314218⟩
    v256 = 0                                                                                          ⟨314244⟩
    v251 = 0                                                                                          ⟨314245⟩
    v250 = 0                                                                                          ⟨314246⟩
    voix_arrête(voix=voix1)                                                                           ⟨314584⟩
    canal_arrête(canal=canal2)                                                                        ⟨314607⟩
    retour                                                                                            ⟨314688⟩

──── scène7 ────
scène7 = Scene_Create(cadence=9, palette=255, surface=&v584)                                          ⟨314698⟩
c14 = Layer(ressource=midgames 44, x=0, y=0)                                                          ⟨314705⟩
CRT_Rand()                                                                                            ⟨314709⟩
c15 = TalkingHead(ressource=convdata type 0 "tex", x=((CRT_Rand()·5) / -32768) + 158, y=128)          ⟨314720⟩
di = c15                                                                                              ⟨314722⟩
tête_image_de_base(tête=c15, image=19)                                                                ⟨314725⟩
ajoute c14 à scène7                                                                                   ⟨314730⟩
ajoute c15 à scène7                                                                                   ⟨314735⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨314744⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨314753⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨314765⟩
si v20 != 0 :
    Scene_Tick(scène=scène7)                                                                          ⟨314775⟩
    charge(mid33voc 7)                                                                                ⟨314787⟩
    sub_9CF7(c15, mid33voc 7, 9)                                                                      ⟨314793⟩
    tant que mid33voc 4.+0 < 3 :
        Scene_Tick(scène=scène7)                                                                      ⟨314802⟩
    tant que sub_9C64(c15) != 0 :
        si mid33voc 4.+0 == 5 :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨314818⟩
        si mid33voc 4.+0 == 6 :
            tête_image_de_base(tête=c15, image=19)                                                    ⟨314826⟩
        si mid33voc 4.+0 == 9 :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨314834⟩
        si mid33voc 4.+0 == 10 :
            tête_image_de_base(tête=c15, image=19)                                                    ⟨314844⟩
        si touche_passer() != 0 : aller à loc_AD3CF                                                   ⟨314850⟩
        Scene_Tick(scène=scène7)                                                                      ⟨314857⟩
    loc_AD3CF:                                                                                        ⟨314867⟩
    tant que mid33voc 4.+0 < 2 :
        Scene_Tick(scène=scène7)                                                                      ⟨314875⟩
sinon :
    v3096→0.méthode8(254)                                                                             ⟨314909⟩
    v14 = 45                                                                                          ⟨314911⟩
    v12 = scène7.compteur + ((v14·70) / 100)                                                          ⟨314921⟩
    tant que (scène7.compteur < v12) et (scène7.terminée == 0) :
        v312 = scène7.compteur                                                                        ⟨314927⟩
        si scène7.compteur + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[12])                             ⟨314940⟩
        si scène7.compteur + 3 == v312 :
            tête_texte_de_lèvres(tête=c15, texte="Thtsdalfe")                                         ⟨314950⟩
        si scène7.compteur + 15 == v312 :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨314960⟩
        si scène7.compteur + 16 == v312 :
            tête_image_de_base(tête=c15, image=19)                                                    ⟨314970⟩
        si scène7.compteur + 19 == v312 :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨314980⟩
        si scène7.compteur + 20 == v312 :
            tête_image_de_base(tête=c15, image=19)                                                    ⟨314990⟩
        si v312 == v12 :
            tête_image_de_base(tête=c15, image=-1)                                                    ⟨314999⟩
        si touche_passer() != 0 : aller à loc_AD54E                                                   ⟨315005⟩
        Scene_Tick(scène=scène7)                                                                      ⟨315012⟩
    loc_AD54E:                                                                                        ⟨315037⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène7, drapeaux=0)                                                      ⟨315048⟩
        v286 = 0                                                                                      ⟨315075⟩
        v281 = 0                                                                                      ⟨315076⟩
        v280 = 0                                                                                      ⟨315077⟩
        v256 = 0                                                                                      ⟨315103⟩
        v251 = 0                                                                                      ⟨315104⟩
        v250 = 0                                                                                      ⟨315105⟩
        voix_arrête(voix=voix1)                                                                       ⟨315443⟩
        canal_arrête(canal=canal2)                                                                    ⟨315466⟩
        retour                                                                                        ⟨315547⟩
    v14 = 40                                                                                          ⟨315551⟩
    v12 = scène7.compteur + ((v14·70) / 100)                                                          ⟨315561⟩
    tant que (scène7.compteur < v12) et (scène7.terminée == 0) :
        v312 = scène7.compteur                                                                        ⟨315567⟩
        si scène7.compteur + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[13])                             ⟨315580⟩
        si scène7.compteur + 3 == v312 :
            tête_texte_de_lèvres(tête=c15, texte="ndeth")                                             ⟨315590⟩
        si scène7.compteur + 19 == v312 :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨315600⟩
        si scène7.compteur + 20 == v312 :
            tête_image_de_base(tête=c15, image=19)                                                    ⟨315610⟩
        si v12 - 1 == v312 :
            v3220 = 4540                                                                              ⟨315618⟩
            v3220 = 4552                                                                              ⟨315619⟩
            v3220 = 4568                                                                              ⟨315620⟩
            v3220 = 4584                                                                              ⟨315621⟩
            v3220 = 4604                                                                              ⟨315622⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨315632⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨315639⟩
            v3232 = 4552                                                                              ⟨315640⟩
            v3232 = 4568                                                                              ⟨315641⟩
            v3232 = 4584                                                                              ⟨315642⟩
            v3232 = 4604                                                                              ⟨315643⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨315653⟩
            aller à loc_ADCDD                                                                         ⟨315655⟩
        Scene_Tick(scène=scène7)                                                                      ⟨315661⟩
    loc_ADCDD:                                                                                        ⟨315686⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène7, drapeaux=0)                                                      ⟨315697⟩
        v286 = 0                                                                                      ⟨315724⟩
        v281 = 0                                                                                      ⟨315725⟩
        v280 = 0                                                                                      ⟨315726⟩
        v256 = 0                                                                                      ⟨315752⟩
        v251 = 0                                                                                      ⟨315753⟩
        v250 = 0                                                                                      ⟨315754⟩
        voix_arrête(voix=voix1)                                                                       ⟨316092⟩
        canal_arrête(canal=canal2)                                                                    ⟨316115⟩
        retour                                                                                        ⟨316196⟩
    v14 = 44                                                                                          ⟨316200⟩
    v12 = scène7.compteur + ((v14·70) / 100)                                                          ⟨316210⟩
    tant que (scène7.compteur < v12) et (scène7.terminée == 0) :
        v312 = scène7.compteur                                                                        ⟨316216⟩
        si scène7.compteur + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[14])                             ⟨316229⟩
        si scène7.compteur + 3 == v312 :
            tête_texte_de_lèvres(tête=c15, texte="ofamrcnry")                                         ⟨316239⟩
        si scène7.compteur + 15 == v312 :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨316249⟩
        si v12 - 1 == v312 :
            v3220 = 4540                                                                              ⟨316257⟩
            v3220 = 4552                                                                              ⟨316258⟩
            v3220 = 4568                                                                              ⟨316259⟩
            v3220 = 4584                                                                              ⟨316260⟩
            v3220 = 4604                                                                              ⟨316261⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3220, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨316271⟩
        si touche_passer() != 0 :
            v3232 = 4540                                                                              ⟨316278⟩
            v3232 = 4552                                                                              ⟨316279⟩
            v3232 = 4568                                                                              ⟨316280⟩
            v3232 = 4584                                                                              ⟨316281⟩
            v3232 = 4604                                                                              ⟨316282⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3232, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨316292⟩
            aller à loc_AE456                                                                         ⟨316294⟩
        Scene_Tick(scène=scène7)                                                                      ⟨316300⟩
loc_AE456:                                                                                            ⟨316325⟩
Scene_Destruct(scène=scène7, drapeaux=0)                                                              ⟨316330⟩
si byte_495FC != 0 :
    v286 = 0                                                                                          ⟨316363⟩
    v281 = 0                                                                                          ⟨316364⟩
    v280 = 0                                                                                          ⟨316365⟩
    v256 = 0                                                                                          ⟨316391⟩
    v251 = 0                                                                                          ⟨316392⟩
    v250 = 0                                                                                          ⟨316393⟩
    voix_arrête(voix=voix1)                                                                           ⟨316731⟩
    canal_arrête(canal=canal2)                                                                        ⟨316754⟩
    retour                                                                                            ⟨316835⟩

──── scène8 ────
scène8 = Scene_Create(cadence=15, palette=255, surface=&v584)                                         ⟨316845⟩
c16 = Layer(ressource=midgames 42, x=0, y=-80)                                                        ⟨316852⟩
c17 = Layer(ressource=midgames 33, x=0, y=0)                                                          ⟨316860⟩
c18 = Layer(ressource=midgames 34, x=0, y=0)                                                          ⟨316868⟩
c19 = Layer(ressource=midgames 35, x=0, y=0)                                                          ⟨316876⟩
c20 = Layer(ressource=midgames 29, x=0, y=-24)                                                        ⟨316884⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨316894⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨316903⟩
ajoute c16 à scène8                                                                                   ⟨316908⟩
ajoute c20 à scène8                                                                                   ⟨316913⟩
ajoute c17 à scène8                                                                                   ⟨316918⟩
ajoute c18 à scène8                                                                                   ⟨316923⟩
ajoute c19 à scène8                                                                                   ⟨316928⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨316940⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨316945⟩
Widget_Method_Dispatch8_314A9(zone1, 12)                                                              ⟨316950⟩
v12 = 135                                                                                             ⟨316957⟩
si v21 != 0 :
    charge(asoundfx 76)                                                                               ⟨316980⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨316985⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 76, x=0)                                        ⟨316992⟩
    v340 = word_48F3A                                                                                 ⟨316995⟩
    v342 = 0                                                                                          ⟨316996⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3220)                                        ⟨317002⟩
        sub_30C66(canal3.+0→4, v3220, v340, v342)                                                     ⟨317009⟩
si v20 != 0 :
    Scene_Tick(scène=scène8)                                                                          ⟨317023⟩
    charge(mid33voc 8)                                                                                ⟨317031⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 8)                                 ⟨317037⟩
tant que (scène8.compteur < v12) et (scène8.terminée == 0) :
    di = scène8.compteur                                                                              ⟨317045⟩
    si scène8.compteur > 30 :
        si scène8.compteur < 120 :
            v354 = mid33voc 5.+0                                                                      ⟨317051⟩
            c20.image = v354                                                                          ⟨317055⟩
    si scène8.compteur == 90 :
        Scene_SetFps(scène=scène8, cadence=9)                                                         ⟨317064⟩
    si scène8.compteur == 120 :
        retire(parent=scène8, calque=c20)                                                             ⟨317073⟩
        c20.détruit(3)                                                                                ⟨317081⟩
    si mid33voc 0.+0 + 6 == scène8.compteur :
        si v20 == 0 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[15])                             ⟨317103⟩
    si mid33voc 0.+0 + 5 < scène8.compteur :
        si mid33voc 0.+0 + 10 > scène8.compteur :
            v356 = mid33voc 7.+0                                                                      ⟨317117⟩
            c18.image = v356                                                                          ⟨317121⟩
    si mid33voc 0.+0 + 13 < scène8.compteur :
        si mid33voc 0.+0 + 18 > scène8.compteur :
            v358 = mid33voc 4.+0                                                                      ⟨317134⟩
            c19.image = v358                                                                          ⟨317138⟩
    si midgames 39.+0 + 8 == scène8.compteur :
        si v20 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨317151⟩
    si midgames 39.+0 + 27 == scène8.compteur :
        si v20 == 0 :
            texte_formaté(zone=zone1, format=9967, a=4, b=160, c=textes1[16])                         ⟨317174⟩
    si midgames 39.+0 + 25 < scène8.compteur :
        si midgames 39.+0 + 30 > scène8.compteur :
            v360 = mid33voc 7.+0 - 1                                                                  ⟨317189⟩
            c18.image = v360                                                                          ⟨317192⟩
    si midgames 39.+0 + 32 < scène8.compteur :
        si midgames 39.+0 + 41 > scène8.compteur :
            si scène8.compteur & 1 != 0 :
                c19.image = mid33voc 4.+0 - 1                                                         ⟨317211⟩
    si midgames 39.+0 + 60 == scène8.compteur :
        si v20 == 0 :
            v3234 = 4540                                                                              ⟨317223⟩
            v3234 = 4552                                                                              ⟨317224⟩
            v3234 = 4568                                                                              ⟨317225⟩
            v3234 = 4584                                                                              ⟨317226⟩
            v3234 = 4604                                                                              ⟨317227⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3234, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨317237⟩
    si touche_passer() != 0 :
        si v20 == 0 :
            v3246 = 4540                                                                              ⟨317249⟩
            v3246 = 4552                                                                              ⟨317250⟩
            v3246 = 4568                                                                              ⟨317251⟩
            v3246 = 4584                                                                              ⟨317252⟩
            v3246 = 4604                                                                              ⟨317253⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3246, v3091, v3089, v3087, v3085, 0, &v3114)        ⟨317263⟩
        aller à loc_AEFA3                                                                             ⟨317267⟩
    Scene_Tick(scène=scène8)                                                                          ⟨317273⟩
loc_AEFA3:                                                                                            ⟨317298⟩
si v20 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨317304⟩
canal_arrête(canal=canal3)                                                                            ⟨317329⟩
Scene_Destruct(scène=scène8, drapeaux=0)                                                              ⟨317372⟩
fondu_disparition(palette=pal1, couleur=&v38, pas=2, premier=0, nombre=256)                           ⟨317381⟩
flux_iff(flux=flux2)                                                                                  ⟨317403⟩
flux2.ouvre(chemin1, 1)                                                                               ⟨317415⟩
iff_form(flux=flux2, balise=large [dword_4571E], x=0)                                                 ⟨317421⟩
iff_form(flux=flux2, balise=large [dword_45723], x=0)                                                 ⟨317427⟩
iff_chunk(flux=flux2, balise=large [dword_45728], x=0)                                                ⟨317433⟩
v344 = v3278                                                                                          ⟨317436⟩
Memory_TypedFreeWrapper_2B7E1(26138, v344, 2, 0, 1)                                                   ⟨317442⟩
v346 = ?                                                                                              ⟨317444⟩
v348 = Memory_TypedFreeWrapper_2B7E1(26138, v344, 2, 0, 1)                                            ⟨317445⟩
v323 = 1                                                                                              ⟨317449⟩
ResourceRecord_ReadDwordFieldB_3C36F(flux2, données(v348))                                            ⟨317465⟩
v3291 = v3274                                                                                         ⟨317468⟩
iff_ferme(flux=flux2)                                                                                 ⟨317471⟩
iff_form(flux=flux2, balise=large [dword_4572D], x=0)                                                 ⟨317477⟩
iff_chunk(flux=flux2, balise=large [dword_45732], x=0)                                                ⟨317483⟩
Memory_TypedFreeWrapper_2B7E1(26138, v3278, 2, 0, 1)                                                  ⟨317492⟩
v354 = ?                                                                                              ⟨317494⟩
v356 = Memory_TypedFreeWrapper_2B7E1(26138, v3278, 2, 0, 1)                                           ⟨317495⟩
v313 = 1                                                                                              ⟨317499⟩
v312 = v3278                                                                                          ⟨317502⟩
ResourceRecord_ReadDwordFieldB_3C36F(flux2, données(v356))                                            ⟨317515⟩
iff_ferme_form(flux=flux2)                                                                            ⟨317519⟩
iff_ferme_form(flux=flux2)                                                                            ⟨317524⟩
palette_depuis(pal9(midgames 39))                                                                     ⟨317539⟩
palette_copie(destination=pal1, source=pal9(midgames 39))                                             ⟨317548⟩
palette_alloue(palette=pal10, premier=0, nombre=256)                                                  ⟨317554⟩
palette_remplit(palette=pal10, couleur=&v332, premier=v344, nombre=pal10.+0)                          ⟨317563⟩
palette_envoie(palette=pal10, pas=0)                                                                  ⟨317575⟩
GlyphObject_ConstructWithBuffer_311CF(&scène8+10, midgames 30)                                        ⟨317586⟩
zone_texte(zone=zone3, police=0)                                                                      ⟨317592⟩
v340 = word_46F46                                                                                     ⟨317595⟩
TextFormat_ApplyStyleAttribute_2E9A4(canal3, v340)                                                    ⟨317599⟩
Widget_ComputeBoundsExtent_31755(zone3, 160, 97)                                                      ⟨317608⟩
texte_formaté(zone=zone3, format=10007)                                                               ⟨317613⟩
fondu_apparition(palette=pal1, couleur=&v332, pas=2, premier=0, nombre=256)                           ⟨317622⟩
vide_entrées()                                                                                        ⟨317624⟩
v344 = booléen                                                                                        ⟨317626⟩
v348 = booléen                                                                                        ⟨317627⟩
v344 = 300                                                                                            ⟨317628⟩
tant que booléen == 0 :
    si v19 != 0 :
        si booléen == 0 :
            v349 = 1                                                                                  ⟨317667⟩
    si touche_passer() != 0 : aller à loc_AF494                                                       ⟨317673⟩
si v349 != 0 : aller à loc_AF424                                                                      ⟨317695⟩
loc_AF494:                                                                                            ⟨317697⟩
fondu_disparition(palette=pal1, couleur=&v332, pas=2, premier=0, nombre=256)                          ⟨317705⟩
v286 = 0                                                                                              ⟨317788⟩
v281 = 0                                                                                              ⟨317789⟩
v280 = 0                                                                                              ⟨317790⟩
v256 = 0                                                                                              ⟨317816⟩
v251 = 0                                                                                              ⟨317817⟩
v250 = 0                                                                                              ⟨317818⟩
voix_arrête(voix=voix1)                                                                               ⟨318156⟩
canal_arrête(canal=canal2)                                                                            ⟨318179⟩
retour                                                                                                ⟨318260⟩
```

## Tableaux du segment de données

