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
    si sub_6734(chemin1) != 0 :
        pak mid33voc.ouvre(chemin1, 1)                                                                ⟨301965⟩
    sinon :
        v20 = 0                                                                                       ⟨301972⟩
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
        v3249 = 0                                                                                     ⟨302044⟩
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
        v3249 = 0                                                                                     ⟨302180⟩
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
    v312 = 0                                                                                          ⟨302329⟩
    canal_arrête(canal=canal1)                                                                        ⟨302332⟩
    v3184 = 0                                                                                         ⟨302350⟩
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
    v3249 = 0                                                                                         ⟨302446⟩
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
v3091 = 0                                                                                             ⟨303211⟩
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
    v241 = 0                                                                                          ⟨303367⟩
    v240 = 0                                                                                          ⟨303368⟩
    v231 = 0                                                                                          ⟨303386⟩
    v230 = 0                                                                                          ⟨303387⟩
    v221 = 0                                                                                          ⟨303405⟩
    v220 = 0                                                                                          ⟨303406⟩
    v211 = 0                                                                                          ⟨303424⟩
    v210 = 0                                                                                          ⟨303425⟩
    v201 = 0                                                                                          ⟨303443⟩
    v200 = 0                                                                                          ⟨303444⟩
    v191 = 0                                                                                          ⟨303462⟩
    v190 = 0                                                                                          ⟨303463⟩
    v181 = 0                                                                                          ⟨303481⟩
    v180 = 0                                                                                          ⟨303482⟩
    v171 = 0                                                                                          ⟨303500⟩
    v170 = 0                                                                                          ⟨303501⟩
    v155 = 0                                                                                          ⟨303524⟩
    v154 = 0                                                                                          ⟨303525⟩
    v139 = 0                                                                                          ⟨303548⟩
    v138 = 0                                                                                          ⟨303549⟩
    v123 = 0                                                                                          ⟨303572⟩
    v122 = 0                                                                                          ⟨303573⟩
    v107 = 0                                                                                          ⟨303596⟩
    v106 = 0                                                                                          ⟨303597⟩
    v91 = 0                                                                                           ⟨303620⟩
    v90 = 0                                                                                           ⟨303621⟩
    v75 = 0                                                                                           ⟨303644⟩
    v74 = 0                                                                                           ⟨303645⟩
    v65 = 0                                                                                           ⟨303663⟩
    v64 = 0                                                                                           ⟨303664⟩
    v55 = 0                                                                                           ⟨303682⟩
    v54 = 0                                                                                           ⟨303683⟩
    voix_arrête(voix=voix1)                                                                           ⟨303687⟩
    v3042 = 0                                                                                         ⟨303705⟩
    v3037 = 0                                                                                         ⟨303706⟩
    v3036 = 0                                                                                         ⟨303707⟩
    canal_arrête(canal=canal2)                                                                        ⟨303710⟩
    v968 = 0                                                                                          ⟨303728⟩
    v963 = 0                                                                                          ⟨303729⟩
    v962 = 0                                                                                          ⟨303730⟩
    v43 = 0                                                                                           ⟨303753⟩
    v42 = 0                                                                                           ⟨303754⟩
    retour                                                                                            ⟨303791⟩
si v19 != 0 :
    v306 = word_48F76                                                                                 ⟨303798⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v970)                                         ⟨303805⟩
        AIL_set_relative_volume_30C66(canal2.+0→4, v970, v306, 0)                                     ⟨303812⟩

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
    tant que voix_en_cours(voix=voix1) != 0 :
        si touche_passer() != 0 : aller à loc_A55F7                                                   ⟨303993⟩
        Scene_Tick(scène=scène1)                                                                      ⟨304000⟩
    loc_A55F7:                                                                                        ⟨304011⟩
    di = 0                                                                                            ⟨304012⟩
    tant que di < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨304019⟩
        di = di + 1                                                                                   ⟨304021⟩
    voix_arrête(voix=voix1)                                                                           ⟨304028⟩
    v320 = 0                                                                                          ⟨304048⟩
sinon :
    Widget_Method_DispatchC_314CB(zone1, 0)                                                           ⟨304056⟩
    Widget_Method_Dispatch8_314A9(zone1, 12)                                                          ⟨304061⟩
    v14 = 53                                                                                          ⟨304063⟩
    si = scène1.compteur                                                                              ⟨304064⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨304073⟩
    tant que (scène1.compteur < v12) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨304078⟩
        si si + 3 == scène1.compteur :
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
        v241 = 0                                                                                      ⟨304248⟩
        v240 = 0                                                                                      ⟨304249⟩
        v231 = 0                                                                                      ⟨304267⟩
        v230 = 0                                                                                      ⟨304268⟩
        v221 = 0                                                                                      ⟨304286⟩
        v220 = 0                                                                                      ⟨304287⟩
        v211 = 0                                                                                      ⟨304305⟩
        v210 = 0                                                                                      ⟨304306⟩
        v201 = 0                                                                                      ⟨304324⟩
        v200 = 0                                                                                      ⟨304325⟩
        v191 = 0                                                                                      ⟨304343⟩
        v190 = 0                                                                                      ⟨304344⟩
        v181 = 0                                                                                      ⟨304362⟩
        v180 = 0                                                                                      ⟨304363⟩
        v171 = 0                                                                                      ⟨304381⟩
        v170 = 0                                                                                      ⟨304382⟩
        v155 = 0                                                                                      ⟨304405⟩
        v154 = 0                                                                                      ⟨304406⟩
        v139 = 0                                                                                      ⟨304429⟩
        v138 = 0                                                                                      ⟨304430⟩
        v123 = 0                                                                                      ⟨304453⟩
        v122 = 0                                                                                      ⟨304454⟩
        v107 = 0                                                                                      ⟨304477⟩
        v106 = 0                                                                                      ⟨304478⟩
        v91 = 0                                                                                       ⟨304501⟩
        v90 = 0                                                                                       ⟨304502⟩
        v75 = 0                                                                                       ⟨304525⟩
        v74 = 0                                                                                       ⟨304526⟩
        v65 = 0                                                                                       ⟨304544⟩
        v64 = 0                                                                                       ⟨304545⟩
        v55 = 0                                                                                       ⟨304563⟩
        v54 = 0                                                                                       ⟨304564⟩
        voix_arrête(voix=voix1)                                                                       ⟨304568⟩
        v3042 = 0                                                                                     ⟨304586⟩
        v3037 = 0                                                                                     ⟨304587⟩
        v3036 = 0                                                                                     ⟨304588⟩
        canal_arrête(canal=canal2)                                                                    ⟨304591⟩
        v968 = 0                                                                                      ⟨304609⟩
        v963 = 0                                                                                      ⟨304610⟩
        v962 = 0                                                                                      ⟨304611⟩
        v43 = 0                                                                                       ⟨304634⟩
        v42 = 0                                                                                       ⟨304635⟩
        retour                                                                                        ⟨304672⟩
    v14 = 61                                                                                          ⟨304676⟩
    si = scène1.compteur                                                                              ⟨304677⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨304686⟩
    tant que (scène1.compteur < v12) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨304691⟩
        si si + 1 == scène1.compteur :
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
    v241 = 0                                                                                          ⟨304863⟩
    v240 = 0                                                                                          ⟨304864⟩
    v231 = 0                                                                                          ⟨304882⟩
    v230 = 0                                                                                          ⟨304883⟩
    v221 = 0                                                                                          ⟨304901⟩
    v220 = 0                                                                                          ⟨304902⟩
    v211 = 0                                                                                          ⟨304920⟩
    v210 = 0                                                                                          ⟨304921⟩
    v201 = 0                                                                                          ⟨304939⟩
    v200 = 0                                                                                          ⟨304940⟩
    v191 = 0                                                                                          ⟨304958⟩
    v190 = 0                                                                                          ⟨304959⟩
    v181 = 0                                                                                          ⟨304977⟩
    v180 = 0                                                                                          ⟨304978⟩
    v171 = 0                                                                                          ⟨304996⟩
    v170 = 0                                                                                          ⟨304997⟩
    v155 = 0                                                                                          ⟨305020⟩
    v154 = 0                                                                                          ⟨305021⟩
    v139 = 0                                                                                          ⟨305044⟩
    v138 = 0                                                                                          ⟨305045⟩
    v123 = 0                                                                                          ⟨305068⟩
    v122 = 0                                                                                          ⟨305069⟩
    v107 = 0                                                                                          ⟨305092⟩
    v106 = 0                                                                                          ⟨305093⟩
    v91 = 0                                                                                           ⟨305116⟩
    v90 = 0                                                                                           ⟨305117⟩
    v75 = 0                                                                                           ⟨305140⟩
    v74 = 0                                                                                           ⟨305141⟩
    v65 = 0                                                                                           ⟨305159⟩
    v64 = 0                                                                                           ⟨305160⟩
    v55 = 0                                                                                           ⟨305178⟩
    v54 = 0                                                                                           ⟨305179⟩
    voix_arrête(voix=voix1)                                                                           ⟨305183⟩
    v3042 = 0                                                                                         ⟨305201⟩
    v3037 = 0                                                                                         ⟨305202⟩
    v3036 = 0                                                                                         ⟨305203⟩
    canal_arrête(canal=canal2)                                                                        ⟨305206⟩
    v968 = 0                                                                                          ⟨305224⟩
    v963 = 0                                                                                          ⟨305225⟩
    v962 = 0                                                                                          ⟨305226⟩
    v43 = 0                                                                                           ⟨305249⟩
    v42 = 0                                                                                           ⟨305250⟩
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
c6 = TextLayer(zone=zone2, x=0, y=v332)                                                               ⟨305350⟩
c7 = TextLayer(zone=zone2, x=0, y=v334)                                                               ⟨305358⟩
c8 = TextLayer(zone=zone2, x=0, y=v336)                                                               ⟨305366⟩
ajoute c5 à scène2                                                                                    ⟨305372⟩
si v1 != 0 :
    texte_calque(calque=c6, texte=&v404)                                                              ⟨305379⟩
    texte_calque(calque=c7, texte=&v446)                                                              ⟨305384⟩
    texte_calque(calque=c8, texte=&v490)                                                              ⟨305389⟩
    ajoute c6 à scène2                                                                                ⟨305394⟩
    ajoute c7 à scène2                                                                                ⟨305399⟩
    ajoute c8 à scène2                                                                                ⟨305404⟩
sinon :
    texte_calque(calque=c6, texte=&v404)                                                              ⟨305413⟩
    texte_calque(calque=c7, texte=&v490)                                                              ⟨305418⟩
    ajoute c6 à scène2                                                                                ⟨305423⟩
    ajoute c7 à scène2                                                                                ⟨305428⟩
    c8.détruit(3)                                                                                     ⟨305436⟩
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
    tant que voix_en_cours(voix=voix1) != 0 :
        si touche_passer() != 0 : aller à loc_A67BD                                                   ⟨305516⟩
        Scene_Tick(scène=scène2)                                                                      ⟨305523⟩
    loc_A67BD:                                                                                        ⟨305534⟩
    voix_arrête(voix=voix1)                                                                           ⟨305537⟩
    si byte_495FC != 0 :
        v346 = 0                                                                                      ⟨305563⟩
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨305567⟩
        v322 = 0                                                                                      ⟨305587⟩
        v312 = 0                                                                                      ⟨305606⟩
        v286 = 0                                                                                      ⟨305632⟩
        v281 = 0                                                                                      ⟨305633⟩
        v280 = 0                                                                                      ⟨305634⟩
        v256 = 0                                                                                      ⟨305660⟩
        v251 = 0                                                                                      ⟨305661⟩
        v250 = 0                                                                                      ⟨305662⟩
        v241 = 0                                                                                      ⟨305680⟩
        v240 = 0                                                                                      ⟨305681⟩
        v231 = 0                                                                                      ⟨305699⟩
        v230 = 0                                                                                      ⟨305700⟩
        v221 = 0                                                                                      ⟨305718⟩
        v220 = 0                                                                                      ⟨305719⟩
        v211 = 0                                                                                      ⟨305737⟩
        v210 = 0                                                                                      ⟨305738⟩
        v201 = 0                                                                                      ⟨305756⟩
        v200 = 0                                                                                      ⟨305757⟩
        v191 = 0                                                                                      ⟨305775⟩
        v190 = 0                                                                                      ⟨305776⟩
        v181 = 0                                                                                      ⟨305794⟩
        v180 = 0                                                                                      ⟨305795⟩
        v171 = 0                                                                                      ⟨305813⟩
        v170 = 0                                                                                      ⟨305814⟩
        v155 = 0                                                                                      ⟨305837⟩
        v154 = 0                                                                                      ⟨305838⟩
        v139 = 0                                                                                      ⟨305861⟩
        v138 = 0                                                                                      ⟨305862⟩
        v123 = 0                                                                                      ⟨305885⟩
        v122 = 0                                                                                      ⟨305886⟩
        v107 = 0                                                                                      ⟨305909⟩
        v106 = 0                                                                                      ⟨305910⟩
        v91 = 0                                                                                       ⟨305933⟩
        v90 = 0                                                                                       ⟨305934⟩
        v75 = 0                                                                                       ⟨305957⟩
        v74 = 0                                                                                       ⟨305958⟩
        v65 = 0                                                                                       ⟨305976⟩
        v64 = 0                                                                                       ⟨305977⟩
        v55 = 0                                                                                       ⟨305995⟩
        v54 = 0                                                                                       ⟨305996⟩
        voix_arrête(voix=voix1)                                                                       ⟨306000⟩
        v3042 = 0                                                                                     ⟨306018⟩
        v3037 = 0                                                                                     ⟨306019⟩
        v3036 = 0                                                                                     ⟨306020⟩
        canal_arrête(canal=canal2)                                                                    ⟨306023⟩
        v968 = 0                                                                                      ⟨306041⟩
        v963 = 0                                                                                      ⟨306042⟩
        v962 = 0                                                                                      ⟨306043⟩
        v43 = 0                                                                                       ⟨306066⟩
        v42 = 0                                                                                       ⟨306067⟩
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
    tant que voix_en_cours(voix=voix1) != 0 :
        si touche_passer() != 0 : aller à loc_A6F6A                                                   ⟨306165⟩
        Scene_Tick(scène=scène2)                                                                      ⟨306172⟩
    loc_A6F6A:                                                                                        ⟨306183⟩
    di = 0                                                                                            ⟨306184⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨306191⟩
        di = di + 1                                                                                   ⟨306193⟩
    voix_arrête(voix=voix1)                                                                           ⟨306200⟩
    v356 = 0                                                                                          ⟨306220⟩
    v346 = 0                                                                                          ⟨306239⟩
sinon :
    Widget_Method_DispatchC_314CB(zone1, 0)                                                           ⟨306247⟩
    Widget_Method_Dispatch8_314A9(zone1, 254)                                                         ⟨306252⟩
    v14 = 66                                                                                          ⟨306254⟩
    si = scène2.compteur                                                                              ⟨306255⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨306264⟩
    tant que (scène2.compteur < v12) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨306269⟩
        si si + 3 == scène2.compteur :
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
        v322 = 0                                                                                      ⟨306388⟩
        v312 = 0                                                                                      ⟨306407⟩
        v286 = 0                                                                                      ⟨306433⟩
        v281 = 0                                                                                      ⟨306434⟩
        v280 = 0                                                                                      ⟨306435⟩
        v256 = 0                                                                                      ⟨306461⟩
        v251 = 0                                                                                      ⟨306462⟩
        v250 = 0                                                                                      ⟨306463⟩
        v241 = 0                                                                                      ⟨306481⟩
        v240 = 0                                                                                      ⟨306482⟩
        v231 = 0                                                                                      ⟨306500⟩
        v230 = 0                                                                                      ⟨306501⟩
        v221 = 0                                                                                      ⟨306519⟩
        v220 = 0                                                                                      ⟨306520⟩
        v211 = 0                                                                                      ⟨306538⟩
        v210 = 0                                                                                      ⟨306539⟩
        v201 = 0                                                                                      ⟨306557⟩
        v200 = 0                                                                                      ⟨306558⟩
        v191 = 0                                                                                      ⟨306576⟩
        v190 = 0                                                                                      ⟨306577⟩
        v181 = 0                                                                                      ⟨306595⟩
        v180 = 0                                                                                      ⟨306596⟩
        v171 = 0                                                                                      ⟨306614⟩
        v170 = 0                                                                                      ⟨306615⟩
        v155 = 0                                                                                      ⟨306638⟩
        v154 = 0                                                                                      ⟨306639⟩
        v139 = 0                                                                                      ⟨306662⟩
        v138 = 0                                                                                      ⟨306663⟩
        v123 = 0                                                                                      ⟨306686⟩
        v122 = 0                                                                                      ⟨306687⟩
        v107 = 0                                                                                      ⟨306710⟩
        v106 = 0                                                                                      ⟨306711⟩
        v91 = 0                                                                                       ⟨306734⟩
        v90 = 0                                                                                       ⟨306735⟩
        v75 = 0                                                                                       ⟨306758⟩
        v74 = 0                                                                                       ⟨306759⟩
        v65 = 0                                                                                       ⟨306777⟩
        v64 = 0                                                                                       ⟨306778⟩
        v55 = 0                                                                                       ⟨306796⟩
        v54 = 0                                                                                       ⟨306797⟩
        voix_arrête(voix=voix1)                                                                       ⟨306801⟩
        v3042 = 0                                                                                     ⟨306819⟩
        v3037 = 0                                                                                     ⟨306820⟩
        v3036 = 0                                                                                     ⟨306821⟩
        canal_arrête(canal=canal2)                                                                    ⟨306824⟩
        v968 = 0                                                                                      ⟨306842⟩
        v963 = 0                                                                                      ⟨306843⟩
        v962 = 0                                                                                      ⟨306844⟩
        v43 = 0                                                                                       ⟨306867⟩
        v42 = 0                                                                                       ⟨306868⟩
        retour                                                                                        ⟨306905⟩
    v14 = 70                                                                                          ⟨306909⟩
    si = scène2.compteur                                                                              ⟨306910⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨306919⟩
    tant que (scène2.compteur < v12) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨306924⟩
        si si + 1 == scène2.compteur :
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
v322 = 0                                                                                              ⟨307037⟩
v312 = 0                                                                                              ⟨307056⟩
si byte_495FC != 0 :
    v286 = 0                                                                                          ⟨307088⟩
    v281 = 0                                                                                          ⟨307089⟩
    v280 = 0                                                                                          ⟨307090⟩
    v256 = 0                                                                                          ⟨307116⟩
    v251 = 0                                                                                          ⟨307117⟩
    v250 = 0                                                                                          ⟨307118⟩
    v241 = 0                                                                                          ⟨307136⟩
    v240 = 0                                                                                          ⟨307137⟩
    v231 = 0                                                                                          ⟨307155⟩
    v230 = 0                                                                                          ⟨307156⟩
    v221 = 0                                                                                          ⟨307174⟩
    v220 = 0                                                                                          ⟨307175⟩
    v211 = 0                                                                                          ⟨307193⟩
    v210 = 0                                                                                          ⟨307194⟩
    v201 = 0                                                                                          ⟨307212⟩
    v200 = 0                                                                                          ⟨307213⟩
    v191 = 0                                                                                          ⟨307231⟩
    v190 = 0                                                                                          ⟨307232⟩
    v181 = 0                                                                                          ⟨307250⟩
    v180 = 0                                                                                          ⟨307251⟩
    v171 = 0                                                                                          ⟨307269⟩
    v170 = 0                                                                                          ⟨307270⟩
    v155 = 0                                                                                          ⟨307293⟩
    v154 = 0                                                                                          ⟨307294⟩
    v139 = 0                                                                                          ⟨307317⟩
    v138 = 0                                                                                          ⟨307318⟩
    v123 = 0                                                                                          ⟨307341⟩
    v122 = 0                                                                                          ⟨307342⟩
    v107 = 0                                                                                          ⟨307365⟩
    v106 = 0                                                                                          ⟨307366⟩
    v91 = 0                                                                                           ⟨307389⟩
    v90 = 0                                                                                           ⟨307390⟩
    v75 = 0                                                                                           ⟨307413⟩
    v74 = 0                                                                                           ⟨307414⟩
    v65 = 0                                                                                           ⟨307432⟩
    v64 = 0                                                                                           ⟨307433⟩
    v55 = 0                                                                                           ⟨307451⟩
    v54 = 0                                                                                           ⟨307452⟩
    voix_arrête(voix=voix1)                                                                           ⟨307456⟩
    v3042 = 0                                                                                         ⟨307474⟩
    v3037 = 0                                                                                         ⟨307475⟩
    v3036 = 0                                                                                         ⟨307476⟩
    canal_arrête(canal=canal2)                                                                        ⟨307479⟩
    v968 = 0                                                                                          ⟨307497⟩
    v963 = 0                                                                                          ⟨307498⟩
    v962 = 0                                                                                          ⟨307499⟩
    v43 = 0                                                                                           ⟨307522⟩
    v42 = 0                                                                                           ⟨307523⟩
    retour                                                                                            ⟨307560⟩

──── scène3 ────
scène3 = Scene_Create(cadence=9, palette=255, surface=&v584)                                          ⟨307570⟩
c9 = Layer(ressource=midgames 44, x=0, y=0)                                                           ⟨307577⟩
CRT_Rand()                                                                                            ⟨307581⟩
c10 = TalkingHead(ressource=convdata type 0 "tex", x=((CRT_Rand()·5) / 32768) + 158, y=128)           ⟨307592⟩
di = c10                                                                                              ⟨307594⟩
tête_image_de_base(tête=c10, image=19)                                                                ⟨307597⟩
ajoute c9 à scène3                                                                                    ⟨307602⟩
ajoute c10 à scène3                                                                                   ⟨307607⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨307616⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨307625⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨307637⟩
si v20 != 0 :
    Scene_Tick(scène=scène3)                                                                          ⟨307647⟩
    charge(mid33voc 3)                                                                                ⟨307659⟩
    tête_voix(tête=c10, ressource=mid33voc 3, cadence=9)                                              ⟨307665⟩
    v322 = 0                                                                                          ⟨307667⟩
    tant que tête_parle(tête=c10) != 0 :
        si v322 == 5 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨307676⟩
        si v322 == 6 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨307684⟩
        si v322 == 9 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨307692⟩
        si v322 == 10 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨307700⟩
        si v322 == 15 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨307708⟩
        si v322 == 16 :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨307716⟩
        si v322 == 19 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨307724⟩
        v322_avant = v322                                                                             ⟨307729⟩
        v322 = v322 + 1                                                                               ⟨307729⟩
        si v322_avant == 20 :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨307734⟩
        si touche_passer() != 0 : aller à loc_A81A5                                                   ⟨307740⟩
        Scene_Tick(scène=scène3)                                                                      ⟨307747⟩
    loc_A81A5:                                                                                        ⟨307759⟩
    si byte_495FC != 0 :
        v320 = 0                                                                                      ⟨307783⟩
        v314 = 0                                                                                      ⟨307785⟩
        Scene_Destruct(scène=scène3, drapeaux=0)                                                      ⟨307789⟩
        v286 = 0                                                                                      ⟨307816⟩
        v281 = 0                                                                                      ⟨307817⟩
        v280 = 0                                                                                      ⟨307818⟩
        v256 = 0                                                                                      ⟨307844⟩
        v251 = 0                                                                                      ⟨307845⟩
        v250 = 0                                                                                      ⟨307846⟩
        v241 = 0                                                                                      ⟨307864⟩
        v240 = 0                                                                                      ⟨307865⟩
        v231 = 0                                                                                      ⟨307883⟩
        v230 = 0                                                                                      ⟨307884⟩
        v221 = 0                                                                                      ⟨307902⟩
        v220 = 0                                                                                      ⟨307903⟩
        v211 = 0                                                                                      ⟨307921⟩
        v210 = 0                                                                                      ⟨307922⟩
        v201 = 0                                                                                      ⟨307940⟩
        v200 = 0                                                                                      ⟨307941⟩
        v191 = 0                                                                                      ⟨307959⟩
        v190 = 0                                                                                      ⟨307960⟩
        v181 = 0                                                                                      ⟨307978⟩
        v180 = 0                                                                                      ⟨307979⟩
        v171 = 0                                                                                      ⟨307997⟩
        v170 = 0                                                                                      ⟨307998⟩
        v155 = 0                                                                                      ⟨308021⟩
        v154 = 0                                                                                      ⟨308022⟩
        v139 = 0                                                                                      ⟨308045⟩
        v138 = 0                                                                                      ⟨308046⟩
        v123 = 0                                                                                      ⟨308069⟩
        v122 = 0                                                                                      ⟨308070⟩
        v107 = 0                                                                                      ⟨308093⟩
        v106 = 0                                                                                      ⟨308094⟩
        v91 = 0                                                                                       ⟨308117⟩
        v90 = 0                                                                                       ⟨308118⟩
        v75 = 0                                                                                       ⟨308141⟩
        v74 = 0                                                                                       ⟨308142⟩
        v65 = 0                                                                                       ⟨308160⟩
        v64 = 0                                                                                       ⟨308161⟩
        v55 = 0                                                                                       ⟨308179⟩
        v54 = 0                                                                                       ⟨308180⟩
        voix_arrête(voix=voix1)                                                                       ⟨308184⟩
        v3042 = 0                                                                                     ⟨308202⟩
        v3037 = 0                                                                                     ⟨308203⟩
        v3036 = 0                                                                                     ⟨308204⟩
        canal_arrête(canal=canal2)                                                                    ⟨308207⟩
        v968 = 0                                                                                      ⟨308225⟩
        v963 = 0                                                                                      ⟨308226⟩
        v962 = 0                                                                                      ⟨308227⟩
        v43 = 0                                                                                       ⟨308250⟩
        v42 = 0                                                                                       ⟨308251⟩
        retour                                                                                        ⟨308288⟩
    tête_image_de_base(tête=c10, image=19)                                                            ⟨308294⟩
    v322 = 0                                                                                          ⟨308296⟩
    tant que v322 < 8 :
        Scene_Tick(scène=scène3)                                                                      ⟨308303⟩
        v322 = v322 + 1                                                                               ⟨308305⟩
    v320 = 0                                                                                          ⟨308326⟩
    v314 = 0                                                                                          ⟨308328⟩
sinon :
    v3096→0.méthode8(254)                                                                             ⟨308337⟩
    v14 = 48                                                                                          ⟨308339⟩
    si = scène3.compteur                                                                              ⟨308340⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨308349⟩
    tant que (scène3.compteur < v12) et (scène3.terminée == 0) :
        v312 = scène3.compteur                                                                        ⟨308355⟩
        si si + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[5])                              ⟨308368⟩
        si si + 3 == v312 :
            tête_texte_de_lèvres(tête=c10, texte="btnwthtjbhzfalntme")                                ⟨308378⟩
        si si + 15 == v312 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨308388⟩
        si si + 16 == v312 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨308398⟩
        si si + 19 == v312 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨308408⟩
        si si + 20 == v312 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨308418⟩
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
        v241 = 0                                                                                      ⟨308580⟩
        v240 = 0                                                                                      ⟨308581⟩
        v231 = 0                                                                                      ⟨308599⟩
        v230 = 0                                                                                      ⟨308600⟩
        v221 = 0                                                                                      ⟨308618⟩
        v220 = 0                                                                                      ⟨308619⟩
        v211 = 0                                                                                      ⟨308637⟩
        v210 = 0                                                                                      ⟨308638⟩
        v201 = 0                                                                                      ⟨308656⟩
        v200 = 0                                                                                      ⟨308657⟩
        v191 = 0                                                                                      ⟨308675⟩
        v190 = 0                                                                                      ⟨308676⟩
        v181 = 0                                                                                      ⟨308694⟩
        v180 = 0                                                                                      ⟨308695⟩
        v171 = 0                                                                                      ⟨308713⟩
        v170 = 0                                                                                      ⟨308714⟩
        v155 = 0                                                                                      ⟨308737⟩
        v154 = 0                                                                                      ⟨308738⟩
        v139 = 0                                                                                      ⟨308761⟩
        v138 = 0                                                                                      ⟨308762⟩
        v123 = 0                                                                                      ⟨308785⟩
        v122 = 0                                                                                      ⟨308786⟩
        v107 = 0                                                                                      ⟨308809⟩
        v106 = 0                                                                                      ⟨308810⟩
        v91 = 0                                                                                       ⟨308833⟩
        v90 = 0                                                                                       ⟨308834⟩
        v75 = 0                                                                                       ⟨308857⟩
        v74 = 0                                                                                       ⟨308858⟩
        v65 = 0                                                                                       ⟨308876⟩
        v64 = 0                                                                                       ⟨308877⟩
        v55 = 0                                                                                       ⟨308895⟩
        v54 = 0                                                                                       ⟨308896⟩
        voix_arrête(voix=voix1)                                                                       ⟨308900⟩
        v3042 = 0                                                                                     ⟨308918⟩
        v3037 = 0                                                                                     ⟨308919⟩
        v3036 = 0                                                                                     ⟨308920⟩
        canal_arrête(canal=canal2)                                                                    ⟨308923⟩
        v968 = 0                                                                                      ⟨308941⟩
        v963 = 0                                                                                      ⟨308942⟩
        v962 = 0                                                                                      ⟨308943⟩
        v43 = 0                                                                                       ⟨308966⟩
        v42 = 0                                                                                       ⟨308967⟩
        retour                                                                                        ⟨309004⟩
    v14 = 44                                                                                          ⟨309008⟩
    si = scène3.compteur                                                                              ⟨309009⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨309018⟩
    tant que (scène3.compteur < v12) et (scène3.terminée == 0) :
        v312 = scène3.compteur                                                                        ⟨309024⟩
        si si + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])                              ⟨309037⟩
        si si + 3 == v312 :
            tête_texte_de_lèvres(tête=c10, texte="Itsjbivlwyzwntd")                                   ⟨309047⟩
        si si + 15 == v312 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨309057⟩
        si si + 16 == v312 :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨309067⟩
        si si + 19 == v312 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨309077⟩
        si si + 20 == v312 :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨309087⟩
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
        v241 = 0                                                                                      ⟨309249⟩
        v240 = 0                                                                                      ⟨309250⟩
        v231 = 0                                                                                      ⟨309268⟩
        v230 = 0                                                                                      ⟨309269⟩
        v221 = 0                                                                                      ⟨309287⟩
        v220 = 0                                                                                      ⟨309288⟩
        v211 = 0                                                                                      ⟨309306⟩
        v210 = 0                                                                                      ⟨309307⟩
        v201 = 0                                                                                      ⟨309325⟩
        v200 = 0                                                                                      ⟨309326⟩
        v191 = 0                                                                                      ⟨309344⟩
        v190 = 0                                                                                      ⟨309345⟩
        v181 = 0                                                                                      ⟨309363⟩
        v180 = 0                                                                                      ⟨309364⟩
        v171 = 0                                                                                      ⟨309382⟩
        v170 = 0                                                                                      ⟨309383⟩
        v155 = 0                                                                                      ⟨309406⟩
        v154 = 0                                                                                      ⟨309407⟩
        v139 = 0                                                                                      ⟨309430⟩
        v138 = 0                                                                                      ⟨309431⟩
        v123 = 0                                                                                      ⟨309454⟩
        v122 = 0                                                                                      ⟨309455⟩
        v107 = 0                                                                                      ⟨309478⟩
        v106 = 0                                                                                      ⟨309479⟩
        v91 = 0                                                                                       ⟨309502⟩
        v90 = 0                                                                                       ⟨309503⟩
        v75 = 0                                                                                       ⟨309526⟩
        v74 = 0                                                                                       ⟨309527⟩
        v65 = 0                                                                                       ⟨309545⟩
        v64 = 0                                                                                       ⟨309546⟩
        v55 = 0                                                                                       ⟨309564⟩
        v54 = 0                                                                                       ⟨309565⟩
        voix_arrête(voix=voix1)                                                                       ⟨309569⟩
        v3042 = 0                                                                                     ⟨309587⟩
        v3037 = 0                                                                                     ⟨309588⟩
        v3036 = 0                                                                                     ⟨309589⟩
        canal_arrête(canal=canal2)                                                                    ⟨309592⟩
        v968 = 0                                                                                      ⟨309610⟩
        v963 = 0                                                                                      ⟨309611⟩
        v962 = 0                                                                                      ⟨309612⟩
        v43 = 0                                                                                       ⟨309635⟩
        v42 = 0                                                                                       ⟨309636⟩
        retour                                                                                        ⟨309673⟩
    v14 = 38                                                                                          ⟨309677⟩
    si = scène3.compteur                                                                              ⟨309678⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨309687⟩
    tant que (scène3.compteur < v12) et (scène3.terminée == 0) :
        v312 = scène3.compteur                                                                        ⟨309693⟩
        si si + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[7])                              ⟨309706⟩
        si si + 3 == v312 :
            tête_texte_de_lèvres(tête=c10, texte="btnotlkths")                                        ⟨309716⟩
        si si + 15 == v312 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨309726⟩
        si si + 16 == v312 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨309736⟩
        si si + 19 == v312 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨309746⟩
        si si + 20 == v312 :
            tête_image_de_base(tête=c10, image=19)                                                    ⟨309756⟩
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
    v241 = 0                                                                                          ⟨309918⟩
    v240 = 0                                                                                          ⟨309919⟩
    v231 = 0                                                                                          ⟨309937⟩
    v230 = 0                                                                                          ⟨309938⟩
    v221 = 0                                                                                          ⟨309956⟩
    v220 = 0                                                                                          ⟨309957⟩
    v211 = 0                                                                                          ⟨309975⟩
    v210 = 0                                                                                          ⟨309976⟩
    v201 = 0                                                                                          ⟨309994⟩
    v200 = 0                                                                                          ⟨309995⟩
    v191 = 0                                                                                          ⟨310013⟩
    v190 = 0                                                                                          ⟨310014⟩
    v181 = 0                                                                                          ⟨310032⟩
    v180 = 0                                                                                          ⟨310033⟩
    v171 = 0                                                                                          ⟨310051⟩
    v170 = 0                                                                                          ⟨310052⟩
    v155 = 0                                                                                          ⟨310075⟩
    v154 = 0                                                                                          ⟨310076⟩
    v139 = 0                                                                                          ⟨310099⟩
    v138 = 0                                                                                          ⟨310100⟩
    v123 = 0                                                                                          ⟨310123⟩
    v122 = 0                                                                                          ⟨310124⟩
    v107 = 0                                                                                          ⟨310147⟩
    v106 = 0                                                                                          ⟨310148⟩
    v91 = 0                                                                                           ⟨310171⟩
    v90 = 0                                                                                           ⟨310172⟩
    v75 = 0                                                                                           ⟨310195⟩
    v74 = 0                                                                                           ⟨310196⟩
    v65 = 0                                                                                           ⟨310214⟩
    v64 = 0                                                                                           ⟨310215⟩
    v55 = 0                                                                                           ⟨310233⟩
    v54 = 0                                                                                           ⟨310234⟩
    voix_arrête(voix=voix1)                                                                           ⟨310238⟩
    v3042 = 0                                                                                         ⟨310256⟩
    v3037 = 0                                                                                         ⟨310257⟩
    v3036 = 0                                                                                         ⟨310258⟩
    canal_arrête(canal=canal2)                                                                        ⟨310261⟩
    v968 = 0                                                                                          ⟨310279⟩
    v963 = 0                                                                                          ⟨310280⟩
    v962 = 0                                                                                          ⟨310281⟩
    v43 = 0                                                                                           ⟨310304⟩
    v42 = 0                                                                                           ⟨310305⟩
    retour                                                                                            ⟨310342⟩

──── scène4 ────
scène4 = Scene_Create(cadence=9, palette=255, surface=&v584)                                          ⟨310352⟩
c11 = Layer(ressource=midgames 42, x=0, y=-80)                                                        ⟨310359⟩
c12 = TalkingHead(ressource=convdata type 0 "gwen", x=164, y=128)                                     ⟨310367⟩
tête_image_de_base(tête=c12, image=31)                                                                ⟨310372⟩
ajoute c11 à scène4                                                                                   ⟨310377⟩
ajoute c12 à scène4                                                                                   ⟨310382⟩
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
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨310470⟩
        si di == 8 :
            tête_image_de_base(tête=c12, image=21)                                                    ⟨310478⟩
        di = di + 1                                                                                   ⟨310483⟩
        si di == 17 :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨310488⟩
        si touche_passer() != 0 : aller à loc_AA17C                                                   ⟨310494⟩
        Scene_Tick(scène=scène4)                                                                      ⟨310501⟩
    loc_AA17C:                                                                                        ⟨310512⟩
    di = 0                                                                                            ⟨310513⟩
    tant que di < 12 :
        Scene_Tick(scène=scène4)                                                                      ⟨310520⟩
        di = di + 1                                                                                   ⟨310522⟩
    voix_arrête(voix=voix1)                                                                           ⟨310529⟩
    v322 = 0                                                                                          ⟨310547⟩
sinon :
    v3096→0.méthode8(254)                                                                             ⟨310558⟩
    v14 = 40                                                                                          ⟨310560⟩
    si = scène4.compteur                                                                              ⟨310561⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨310570⟩
    tant que (scène4.compteur < v12) et (scène4.terminée == 0) :
        di = scène4.compteur                                                                          ⟨310575⟩
        si si + 1 == scène4.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])                              ⟨310587⟩
        si si + 17 == scène4.compteur :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨310597⟩
        si si + 18 == scène4.compteur :
            tête_image_de_base(tête=c12, image=21)                                                    ⟨310607⟩
        si si + 27 == scène4.compteur :
            tête_image_de_base(tête=c12, image=12)                                                    ⟨310617⟩
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
    v241 = 0                                                                                          ⟨310763⟩
    v240 = 0                                                                                          ⟨310764⟩
    v231 = 0                                                                                          ⟨310782⟩
    v230 = 0                                                                                          ⟨310783⟩
    v221 = 0                                                                                          ⟨310801⟩
    v220 = 0                                                                                          ⟨310802⟩
    v211 = 0                                                                                          ⟨310820⟩
    v210 = 0                                                                                          ⟨310821⟩
    v201 = 0                                                                                          ⟨310839⟩
    v200 = 0                                                                                          ⟨310840⟩
    v191 = 0                                                                                          ⟨310858⟩
    v190 = 0                                                                                          ⟨310859⟩
    v181 = 0                                                                                          ⟨310877⟩
    v180 = 0                                                                                          ⟨310878⟩
    v171 = 0                                                                                          ⟨310896⟩
    v170 = 0                                                                                          ⟨310897⟩
    v155 = 0                                                                                          ⟨310920⟩
    v154 = 0                                                                                          ⟨310921⟩
    v139 = 0                                                                                          ⟨310944⟩
    v138 = 0                                                                                          ⟨310945⟩
    v123 = 0                                                                                          ⟨310968⟩
    v122 = 0                                                                                          ⟨310969⟩
    v107 = 0                                                                                          ⟨310992⟩
    v106 = 0                                                                                          ⟨310993⟩
    v91 = 0                                                                                           ⟨311016⟩
    v90 = 0                                                                                           ⟨311017⟩
    v75 = 0                                                                                           ⟨311040⟩
    v74 = 0                                                                                           ⟨311041⟩
    v65 = 0                                                                                           ⟨311059⟩
    v64 = 0                                                                                           ⟨311060⟩
    v55 = 0                                                                                           ⟨311078⟩
    v54 = 0                                                                                           ⟨311079⟩
    voix_arrête(voix=voix1)                                                                           ⟨311083⟩
    v3042 = 0                                                                                         ⟨311101⟩
    v3037 = 0                                                                                         ⟨311102⟩
    v3036 = 0                                                                                         ⟨311103⟩
    canal_arrête(canal=canal2)                                                                        ⟨311106⟩
    v968 = 0                                                                                          ⟨311124⟩
    v963 = 0                                                                                          ⟨311125⟩
    v962 = 0                                                                                          ⟨311126⟩
    v43 = 0                                                                                           ⟨311149⟩
    v42 = 0                                                                                           ⟨311150⟩
    retour                                                                                            ⟨311187⟩

──── scène5 ────
scène5 = Scene_Create(cadence=9, palette=255, surface=&v584)                                          ⟨311197⟩
c13 = Layer(ressource=midgames 44, x=0, y=0)                                                          ⟨311204⟩
c14 = TalkingHead(ressource=convdata type 0 "miguel", x=255, y=128)                                   ⟨311212⟩
c15 = TalkingHead(ressource=convdata type 0 "billy", x=95, y=128)                                     ⟨311220⟩
tête_image_de_base(tête=c15, image=19)                                                                ⟨311225⟩
tête_image_de_base(tête=c14, image=19)                                                                ⟨311229⟩
ajoute c13 à scène5                                                                                   ⟨311234⟩
ajoute c14 à scène5                                                                                   ⟨311239⟩
ajoute c15 à scène5                                                                                   ⟨311244⟩
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
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨311332⟩
        si di == 8 :
            tête_image_de_base(tête=c15, image=21)                                                    ⟨311340⟩
        si di == 9 :
            tête_image_de_base(tête=c15, image=-1)                                                    ⟨311348⟩
        si di == 16 :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨311356⟩
        si di == 18 :
            tête_image_de_base(tête=c15, image=21)                                                    ⟨311364⟩
        si di == 2 :
            tête_image_de_base(tête=c14, image=12)                                                    ⟨311372⟩
        si di == 3 :
            tête_image_de_base(tête=c14, image=21)                                                    ⟨311380⟩
        di = di + 1                                                                                   ⟨311385⟩
        si di == 22 :
            tête_image_de_base(tête=c14, image=12)                                                    ⟨311390⟩
        si touche_passer() != 0 : aller à loc_AAB85                                                   ⟨311396⟩
        Scene_Tick(scène=scène5)                                                                      ⟨311403⟩
    loc_AAB85:                                                                                        ⟨311416⟩
    voix_arrête(voix=voix1)                                                                           ⟨311420⟩
    si byte_495FC != 0 :
        v324 = 0                                                                                      ⟨311444⟩
        Scene_Destruct(scène=scène5, drapeaux=0)                                                      ⟨311450⟩
        v286 = 0                                                                                      ⟨311477⟩
        v281 = 0                                                                                      ⟨311478⟩
        v280 = 0                                                                                      ⟨311479⟩
        v256 = 0                                                                                      ⟨311505⟩
        v251 = 0                                                                                      ⟨311506⟩
        v250 = 0                                                                                      ⟨311507⟩
        v241 = 0                                                                                      ⟨311525⟩
        v240 = 0                                                                                      ⟨311526⟩
        v231 = 0                                                                                      ⟨311544⟩
        v230 = 0                                                                                      ⟨311545⟩
        v221 = 0                                                                                      ⟨311563⟩
        v220 = 0                                                                                      ⟨311564⟩
        v211 = 0                                                                                      ⟨311582⟩
        v210 = 0                                                                                      ⟨311583⟩
        v201 = 0                                                                                      ⟨311601⟩
        v200 = 0                                                                                      ⟨311602⟩
        v191 = 0                                                                                      ⟨311620⟩
        v190 = 0                                                                                      ⟨311621⟩
        v181 = 0                                                                                      ⟨311639⟩
        v180 = 0                                                                                      ⟨311640⟩
        v171 = 0                                                                                      ⟨311658⟩
        v170 = 0                                                                                      ⟨311659⟩
        v155 = 0                                                                                      ⟨311682⟩
        v154 = 0                                                                                      ⟨311683⟩
        v139 = 0                                                                                      ⟨311706⟩
        v138 = 0                                                                                      ⟨311707⟩
        v123 = 0                                                                                      ⟨311730⟩
        v122 = 0                                                                                      ⟨311731⟩
        v107 = 0                                                                                      ⟨311754⟩
        v106 = 0                                                                                      ⟨311755⟩
        v91 = 0                                                                                       ⟨311778⟩
        v90 = 0                                                                                       ⟨311779⟩
        v75 = 0                                                                                       ⟨311802⟩
        v74 = 0                                                                                       ⟨311803⟩
        v65 = 0                                                                                       ⟨311821⟩
        v64 = 0                                                                                       ⟨311822⟩
        v55 = 0                                                                                       ⟨311840⟩
        v54 = 0                                                                                       ⟨311841⟩
        voix_arrête(voix=voix1)                                                                       ⟨311845⟩
        v3042 = 0                                                                                     ⟨311863⟩
        v3037 = 0                                                                                     ⟨311864⟩
        v3036 = 0                                                                                     ⟨311865⟩
        canal_arrête(canal=canal2)                                                                    ⟨311868⟩
        v968 = 0                                                                                      ⟨311886⟩
        v963 = 0                                                                                      ⟨311887⟩
        v962 = 0                                                                                      ⟨311888⟩
        v43 = 0                                                                                       ⟨311911⟩
        v42 = 0                                                                                       ⟨311912⟩
        retour                                                                                        ⟨311949⟩
    di = 0                                                                                            ⟨311953⟩
    tant que di < 8 :
        Scene_Tick(scène=scène5)                                                                      ⟨311960⟩
        di = di + 1                                                                                   ⟨311962⟩
    v324 = 0                                                                                          ⟨311983⟩
sinon :
    v3096→0.méthode8(254)                                                                             ⟨311994⟩
    v14 = 71                                                                                          ⟨311996⟩
    si = scène5.compteur                                                                              ⟨311997⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨312006⟩
    tant que (scène5.compteur < v12) et (scène5.terminée == 0) :
        di = scène5.compteur                                                                          ⟨312011⟩
        si si + 2 == scène5.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[9])                              ⟨312024⟩
        si si + 17 == scène5.compteur :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨312034⟩
        si si + 18 == scène5.compteur :
            tête_image_de_base(tête=c15, image=21)                                                    ⟨312044⟩
        si si + 19 == scène5.compteur :
            tête_image_de_base(tête=c15, image=-1)                                                    ⟨312054⟩
        si si + 26 == scène5.compteur :
            tête_image_de_base(tête=c15, image=12)                                                    ⟨312064⟩
        si si + 28 == scène5.compteur :
            tête_image_de_base(tête=c15, image=21)                                                    ⟨312074⟩
        si si + 7 == scène5.compteur :
            tête_image_de_base(tête=c14, image=12)                                                    ⟨312084⟩
        si si + 8 == scène5.compteur :
            tête_image_de_base(tête=c14, image=21)                                                    ⟨312094⟩
        si si + 32 == scène5.compteur :
            tête_image_de_base(tête=c14, image=12)                                                    ⟨312104⟩
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
    v241 = 0                                                                                          ⟨312266⟩
    v240 = 0                                                                                          ⟨312267⟩
    v231 = 0                                                                                          ⟨312285⟩
    v230 = 0                                                                                          ⟨312286⟩
    v221 = 0                                                                                          ⟨312304⟩
    v220 = 0                                                                                          ⟨312305⟩
    v211 = 0                                                                                          ⟨312323⟩
    v210 = 0                                                                                          ⟨312324⟩
    v201 = 0                                                                                          ⟨312342⟩
    v200 = 0                                                                                          ⟨312343⟩
    v191 = 0                                                                                          ⟨312361⟩
    v190 = 0                                                                                          ⟨312362⟩
    v181 = 0                                                                                          ⟨312380⟩
    v180 = 0                                                                                          ⟨312381⟩
    v171 = 0                                                                                          ⟨312399⟩
    v170 = 0                                                                                          ⟨312400⟩
    v155 = 0                                                                                          ⟨312423⟩
    v154 = 0                                                                                          ⟨312424⟩
    v139 = 0                                                                                          ⟨312447⟩
    v138 = 0                                                                                          ⟨312448⟩
    v123 = 0                                                                                          ⟨312471⟩
    v122 = 0                                                                                          ⟨312472⟩
    v107 = 0                                                                                          ⟨312495⟩
    v106 = 0                                                                                          ⟨312496⟩
    v91 = 0                                                                                           ⟨312519⟩
    v90 = 0                                                                                           ⟨312520⟩
    v75 = 0                                                                                           ⟨312543⟩
    v74 = 0                                                                                           ⟨312544⟩
    v65 = 0                                                                                           ⟨312562⟩
    v64 = 0                                                                                           ⟨312563⟩
    v55 = 0                                                                                           ⟨312581⟩
    v54 = 0                                                                                           ⟨312582⟩
    voix_arrête(voix=voix1)                                                                           ⟨312586⟩
    v3042 = 0                                                                                         ⟨312604⟩
    v3037 = 0                                                                                         ⟨312605⟩
    v3036 = 0                                                                                         ⟨312606⟩
    canal_arrête(canal=canal2)                                                                        ⟨312609⟩
    v968 = 0                                                                                          ⟨312627⟩
    v963 = 0                                                                                          ⟨312628⟩
    v962 = 0                                                                                          ⟨312629⟩
    v43 = 0                                                                                           ⟨312652⟩
    v42 = 0                                                                                           ⟨312653⟩
    retour                                                                                            ⟨312690⟩
charge(midgames 30)                                                                                   ⟨312704⟩

──── scène6 ────
scène6 = Scene_Create(cadence=6, palette=255, surface=&v584)                                          ⟨312712⟩
c16 = Layer(ressource=midgames 30, x=0, y=0)                                                          ⟨312719⟩
palette_alloue(palette=pal8, premier=0, nombre=256)                                                   ⟨312727⟩
palette_copie(destination=pal8, source=pal6(midgames 40))                                             ⟨312736⟩
palette_envoie_argument()                                                                             ⟨312738⟩
ajoute c16 à scène6                                                                                   ⟨312743⟩
si v20 != 0 :
    Scene_Tick(scène=scène6)                                                                          ⟨312753⟩
    charge(mid33voc 6)                                                                                ⟨312765⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 6)                                 ⟨312771⟩
    di = 0                                                                                            ⟨312773⟩
    tant que di < 4 :
        Scene_Tick(scène=scène6)                                                                      ⟨312780⟩
        di = di + 1                                                                                   ⟨312782⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨312790⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si touche_passer() != 0 : aller à loc_ABBC4                                                   ⟨312798⟩
        Scene_Tick(scène=scène6)                                                                      ⟨312805⟩
    loc_ABBC4:                                                                                        ⟨312816⟩
    voix_arrête(voix=voix1)                                                                           ⟨312819⟩
    si byte_495FC != 0 :
        v324 = 0                                                                                      ⟨312845⟩
        Scene_Destruct(scène=scène6, drapeaux=0)                                                      ⟨312849⟩
        v312 = 0                                                                                      ⟨312869⟩
        v286 = 0                                                                                      ⟨312895⟩
        v281 = 0                                                                                      ⟨312896⟩
        v280 = 0                                                                                      ⟨312897⟩
        v256 = 0                                                                                      ⟨312923⟩
        v251 = 0                                                                                      ⟨312924⟩
        v250 = 0                                                                                      ⟨312925⟩
        v241 = 0                                                                                      ⟨312943⟩
        v240 = 0                                                                                      ⟨312944⟩
        v231 = 0                                                                                      ⟨312962⟩
        v230 = 0                                                                                      ⟨312963⟩
        v221 = 0                                                                                      ⟨312981⟩
        v220 = 0                                                                                      ⟨312982⟩
        v211 = 0                                                                                      ⟨313000⟩
        v210 = 0                                                                                      ⟨313001⟩
        v201 = 0                                                                                      ⟨313019⟩
        v200 = 0                                                                                      ⟨313020⟩
        v191 = 0                                                                                      ⟨313038⟩
        v190 = 0                                                                                      ⟨313039⟩
        v181 = 0                                                                                      ⟨313057⟩
        v180 = 0                                                                                      ⟨313058⟩
        v171 = 0                                                                                      ⟨313076⟩
        v170 = 0                                                                                      ⟨313077⟩
        v155 = 0                                                                                      ⟨313100⟩
        v154 = 0                                                                                      ⟨313101⟩
        v139 = 0                                                                                      ⟨313124⟩
        v138 = 0                                                                                      ⟨313125⟩
        v123 = 0                                                                                      ⟨313148⟩
        v122 = 0                                                                                      ⟨313149⟩
        v107 = 0                                                                                      ⟨313172⟩
        v106 = 0                                                                                      ⟨313173⟩
        v91 = 0                                                                                       ⟨313196⟩
        v90 = 0                                                                                       ⟨313197⟩
        v75 = 0                                                                                       ⟨313220⟩
        v74 = 0                                                                                       ⟨313221⟩
        v65 = 0                                                                                       ⟨313239⟩
        v64 = 0                                                                                       ⟨313240⟩
        v55 = 0                                                                                       ⟨313258⟩
        v54 = 0                                                                                       ⟨313259⟩
        voix_arrête(voix=voix1)                                                                       ⟨313263⟩
        v3042 = 0                                                                                     ⟨313281⟩
        v3037 = 0                                                                                     ⟨313282⟩
        v3036 = 0                                                                                     ⟨313283⟩
        canal_arrête(canal=canal2)                                                                    ⟨313286⟩
        v968 = 0                                                                                      ⟨313304⟩
        v963 = 0                                                                                      ⟨313305⟩
        v962 = 0                                                                                      ⟨313306⟩
        v43 = 0                                                                                       ⟨313329⟩
        v42 = 0                                                                                       ⟨313330⟩
        retour                                                                                        ⟨313367⟩
    di = 0                                                                                            ⟨313371⟩
    tant que di < 8 :
        Scene_Tick(scène=scène6)                                                                      ⟨313378⟩
        di = di + 1                                                                                   ⟨313380⟩
    v324 = 0                                                                                          ⟨313403⟩
sinon :
    Widget_Method_DispatchC_314CB(zone1, 0)                                                           ⟨313411⟩
    Widget_Method_Dispatch8_314A9(zone1, 79)                                                          ⟨313416⟩
    v14 = 56                                                                                          ⟨313418⟩
    si = scène6.compteur                                                                              ⟨313419⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨313428⟩
    tant que (scène6.compteur < v12) et (scène6.terminée == 0) :
        di = scène6.compteur                                                                          ⟨313433⟩
        si si + 3 == scène6.compteur :
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
        v312 = 0                                                                                      ⟨313553⟩
        v286 = 0                                                                                      ⟨313579⟩
        v281 = 0                                                                                      ⟨313580⟩
        v280 = 0                                                                                      ⟨313581⟩
        v256 = 0                                                                                      ⟨313607⟩
        v251 = 0                                                                                      ⟨313608⟩
        v250 = 0                                                                                      ⟨313609⟩
        v241 = 0                                                                                      ⟨313627⟩
        v240 = 0                                                                                      ⟨313628⟩
        v231 = 0                                                                                      ⟨313646⟩
        v230 = 0                                                                                      ⟨313647⟩
        v221 = 0                                                                                      ⟨313665⟩
        v220 = 0                                                                                      ⟨313666⟩
        v211 = 0                                                                                      ⟨313684⟩
        v210 = 0                                                                                      ⟨313685⟩
        v201 = 0                                                                                      ⟨313703⟩
        v200 = 0                                                                                      ⟨313704⟩
        v191 = 0                                                                                      ⟨313722⟩
        v190 = 0                                                                                      ⟨313723⟩
        v181 = 0                                                                                      ⟨313741⟩
        v180 = 0                                                                                      ⟨313742⟩
        v171 = 0                                                                                      ⟨313760⟩
        v170 = 0                                                                                      ⟨313761⟩
        v155 = 0                                                                                      ⟨313784⟩
        v154 = 0                                                                                      ⟨313785⟩
        v139 = 0                                                                                      ⟨313808⟩
        v138 = 0                                                                                      ⟨313809⟩
        v123 = 0                                                                                      ⟨313832⟩
        v122 = 0                                                                                      ⟨313833⟩
        v107 = 0                                                                                      ⟨313856⟩
        v106 = 0                                                                                      ⟨313857⟩
        v91 = 0                                                                                       ⟨313880⟩
        v90 = 0                                                                                       ⟨313881⟩
        v75 = 0                                                                                       ⟨313904⟩
        v74 = 0                                                                                       ⟨313905⟩
        v65 = 0                                                                                       ⟨313923⟩
        v64 = 0                                                                                       ⟨313924⟩
        v55 = 0                                                                                       ⟨313942⟩
        v54 = 0                                                                                       ⟨313943⟩
        voix_arrête(voix=voix1)                                                                       ⟨313947⟩
        v3042 = 0                                                                                     ⟨313965⟩
        v3037 = 0                                                                                     ⟨313966⟩
        v3036 = 0                                                                                     ⟨313967⟩
        canal_arrête(canal=canal2)                                                                    ⟨313970⟩
        v968 = 0                                                                                      ⟨313988⟩
        v963 = 0                                                                                      ⟨313989⟩
        v962 = 0                                                                                      ⟨313990⟩
        v43 = 0                                                                                       ⟨314013⟩
        v42 = 0                                                                                       ⟨314014⟩
        retour                                                                                        ⟨314051⟩
    v14 = 60                                                                                          ⟨314055⟩
    si = scène6.compteur                                                                              ⟨314056⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨314065⟩
    tant que (scène6.compteur < v12) et (scène6.terminée == 0) :
        di = scène6.compteur                                                                          ⟨314070⟩
        si si + 1 == scène6.compteur :
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
v312 = 0                                                                                              ⟨314184⟩
si byte_495FC != 0 :
    v286 = 0                                                                                          ⟨314216⟩
    v281 = 0                                                                                          ⟨314217⟩
    v280 = 0                                                                                          ⟨314218⟩
    v256 = 0                                                                                          ⟨314244⟩
    v251 = 0                                                                                          ⟨314245⟩
    v250 = 0                                                                                          ⟨314246⟩
    v241 = 0                                                                                          ⟨314264⟩
    v240 = 0                                                                                          ⟨314265⟩
    v231 = 0                                                                                          ⟨314283⟩
    v230 = 0                                                                                          ⟨314284⟩
    v221 = 0                                                                                          ⟨314302⟩
    v220 = 0                                                                                          ⟨314303⟩
    v211 = 0                                                                                          ⟨314321⟩
    v210 = 0                                                                                          ⟨314322⟩
    v201 = 0                                                                                          ⟨314340⟩
    v200 = 0                                                                                          ⟨314341⟩
    v191 = 0                                                                                          ⟨314359⟩
    v190 = 0                                                                                          ⟨314360⟩
    v181 = 0                                                                                          ⟨314378⟩
    v180 = 0                                                                                          ⟨314379⟩
    v171 = 0                                                                                          ⟨314397⟩
    v170 = 0                                                                                          ⟨314398⟩
    v155 = 0                                                                                          ⟨314421⟩
    v154 = 0                                                                                          ⟨314422⟩
    v139 = 0                                                                                          ⟨314445⟩
    v138 = 0                                                                                          ⟨314446⟩
    v123 = 0                                                                                          ⟨314469⟩
    v122 = 0                                                                                          ⟨314470⟩
    v107 = 0                                                                                          ⟨314493⟩
    v106 = 0                                                                                          ⟨314494⟩
    v91 = 0                                                                                           ⟨314517⟩
    v90 = 0                                                                                           ⟨314518⟩
    v75 = 0                                                                                           ⟨314541⟩
    v74 = 0                                                                                           ⟨314542⟩
    v65 = 0                                                                                           ⟨314560⟩
    v64 = 0                                                                                           ⟨314561⟩
    v55 = 0                                                                                           ⟨314579⟩
    v54 = 0                                                                                           ⟨314580⟩
    voix_arrête(voix=voix1)                                                                           ⟨314584⟩
    v3042 = 0                                                                                         ⟨314602⟩
    v3037 = 0                                                                                         ⟨314603⟩
    v3036 = 0                                                                                         ⟨314604⟩
    canal_arrête(canal=canal2)                                                                        ⟨314607⟩
    v968 = 0                                                                                          ⟨314625⟩
    v963 = 0                                                                                          ⟨314626⟩
    v962 = 0                                                                                          ⟨314627⟩
    v43 = 0                                                                                           ⟨314650⟩
    v42 = 0                                                                                           ⟨314651⟩
    retour                                                                                            ⟨314688⟩

──── scène7 ────
scène7 = Scene_Create(cadence=9, palette=255, surface=&v584)                                          ⟨314698⟩
c17 = Layer(ressource=midgames 44, x=0, y=0)                                                          ⟨314705⟩
CRT_Rand()                                                                                            ⟨314709⟩
c18 = TalkingHead(ressource=convdata type 0 "tex", x=((CRT_Rand()·5) / 32768) + 158, y=128)           ⟨314720⟩
di = c18                                                                                              ⟨314722⟩
tête_image_de_base(tête=c18, image=19)                                                                ⟨314725⟩
ajoute c17 à scène7                                                                                   ⟨314730⟩
ajoute c18 à scène7                                                                                   ⟨314735⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨314744⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨314753⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨314765⟩
si v20 != 0 :
    Scene_Tick(scène=scène7)                                                                          ⟨314775⟩
    charge(mid33voc 7)                                                                                ⟨314787⟩
    tête_voix(tête=c18, ressource=mid33voc 7, cadence=9)                                              ⟨314793⟩
    v322 = 0                                                                                          ⟨314795⟩
    tant que v322 < 3 :
        Scene_Tick(scène=scène7)                                                                      ⟨314802⟩
        v322 = v322 + 1                                                                               ⟨314804⟩
    v322 = 0                                                                                          ⟨314809⟩
    tant que tête_parle(tête=c18) != 0 :
        si v322 == 5 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨314818⟩
        si v322 == 6 :
            tête_image_de_base(tête=c18, image=19)                                                    ⟨314826⟩
        si v322 == 9 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨314834⟩
        v322_avant = v322                                                                             ⟨314839⟩
        v322 = v322 + 1                                                                               ⟨314839⟩
        si v322_avant == 10 :
            tête_image_de_base(tête=c18, image=19)                                                    ⟨314844⟩
        si touche_passer() != 0 : aller à loc_AD3CF                                                   ⟨314850⟩
        Scene_Tick(scène=scène7)                                                                      ⟨314857⟩
    loc_AD3CF:                                                                                        ⟨314867⟩
    v322 = 0                                                                                          ⟨314868⟩
    tant que v322 < 2 :
        Scene_Tick(scène=scène7)                                                                      ⟨314875⟩
        v322 = v322 + 1                                                                               ⟨314877⟩
    v320 = 0                                                                                          ⟨314898⟩
    v314 = 0                                                                                          ⟨314900⟩
sinon :
    v3096→0.méthode8(254)                                                                             ⟨314909⟩
    v14 = 45                                                                                          ⟨314911⟩
    si = scène7.compteur                                                                              ⟨314912⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨314921⟩
    tant que (scène7.compteur < v12) et (scène7.terminée == 0) :
        v312 = scène7.compteur                                                                        ⟨314927⟩
        si si + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[12])                             ⟨314940⟩
        si si + 3 == v312 :
            tête_texte_de_lèvres(tête=c18, texte="Thtsdalfe")                                         ⟨314950⟩
        si si + 15 == v312 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨314960⟩
        si si + 16 == v312 :
            tête_image_de_base(tête=c18, image=19)                                                    ⟨314970⟩
        si si + 19 == v312 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨314980⟩
        si si + 20 == v312 :
            tête_image_de_base(tête=c18, image=19)                                                    ⟨314990⟩
        si v312 == v12 :
            tête_image_de_base(tête=c18, image=-1)                                                    ⟨314999⟩
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
        v241 = 0                                                                                      ⟨315123⟩
        v240 = 0                                                                                      ⟨315124⟩
        v231 = 0                                                                                      ⟨315142⟩
        v230 = 0                                                                                      ⟨315143⟩
        v221 = 0                                                                                      ⟨315161⟩
        v220 = 0                                                                                      ⟨315162⟩
        v211 = 0                                                                                      ⟨315180⟩
        v210 = 0                                                                                      ⟨315181⟩
        v201 = 0                                                                                      ⟨315199⟩
        v200 = 0                                                                                      ⟨315200⟩
        v191 = 0                                                                                      ⟨315218⟩
        v190 = 0                                                                                      ⟨315219⟩
        v181 = 0                                                                                      ⟨315237⟩
        v180 = 0                                                                                      ⟨315238⟩
        v171 = 0                                                                                      ⟨315256⟩
        v170 = 0                                                                                      ⟨315257⟩
        v155 = 0                                                                                      ⟨315280⟩
        v154 = 0                                                                                      ⟨315281⟩
        v139 = 0                                                                                      ⟨315304⟩
        v138 = 0                                                                                      ⟨315305⟩
        v123 = 0                                                                                      ⟨315328⟩
        v122 = 0                                                                                      ⟨315329⟩
        v107 = 0                                                                                      ⟨315352⟩
        v106 = 0                                                                                      ⟨315353⟩
        v91 = 0                                                                                       ⟨315376⟩
        v90 = 0                                                                                       ⟨315377⟩
        v75 = 0                                                                                       ⟨315400⟩
        v74 = 0                                                                                       ⟨315401⟩
        v65 = 0                                                                                       ⟨315419⟩
        v64 = 0                                                                                       ⟨315420⟩
        v55 = 0                                                                                       ⟨315438⟩
        v54 = 0                                                                                       ⟨315439⟩
        voix_arrête(voix=voix1)                                                                       ⟨315443⟩
        v3042 = 0                                                                                     ⟨315461⟩
        v3037 = 0                                                                                     ⟨315462⟩
        v3036 = 0                                                                                     ⟨315463⟩
        canal_arrête(canal=canal2)                                                                    ⟨315466⟩
        v968 = 0                                                                                      ⟨315484⟩
        v963 = 0                                                                                      ⟨315485⟩
        v962 = 0                                                                                      ⟨315486⟩
        v43 = 0                                                                                       ⟨315509⟩
        v42 = 0                                                                                       ⟨315510⟩
        retour                                                                                        ⟨315547⟩
    v14 = 40                                                                                          ⟨315551⟩
    si = scène7.compteur                                                                              ⟨315552⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨315561⟩
    tant que (scène7.compteur < v12) et (scène7.terminée == 0) :
        v312 = scène7.compteur                                                                        ⟨315567⟩
        si si + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[13])                             ⟨315580⟩
        si si + 3 == v312 :
            tête_texte_de_lèvres(tête=c18, texte="ndeth")                                             ⟨315590⟩
        si si + 19 == v312 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨315600⟩
        si si + 20 == v312 :
            tête_image_de_base(tête=c18, image=19)                                                    ⟨315610⟩
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
        v241 = 0                                                                                      ⟨315772⟩
        v240 = 0                                                                                      ⟨315773⟩
        v231 = 0                                                                                      ⟨315791⟩
        v230 = 0                                                                                      ⟨315792⟩
        v221 = 0                                                                                      ⟨315810⟩
        v220 = 0                                                                                      ⟨315811⟩
        v211 = 0                                                                                      ⟨315829⟩
        v210 = 0                                                                                      ⟨315830⟩
        v201 = 0                                                                                      ⟨315848⟩
        v200 = 0                                                                                      ⟨315849⟩
        v191 = 0                                                                                      ⟨315867⟩
        v190 = 0                                                                                      ⟨315868⟩
        v181 = 0                                                                                      ⟨315886⟩
        v180 = 0                                                                                      ⟨315887⟩
        v171 = 0                                                                                      ⟨315905⟩
        v170 = 0                                                                                      ⟨315906⟩
        v155 = 0                                                                                      ⟨315929⟩
        v154 = 0                                                                                      ⟨315930⟩
        v139 = 0                                                                                      ⟨315953⟩
        v138 = 0                                                                                      ⟨315954⟩
        v123 = 0                                                                                      ⟨315977⟩
        v122 = 0                                                                                      ⟨315978⟩
        v107 = 0                                                                                      ⟨316001⟩
        v106 = 0                                                                                      ⟨316002⟩
        v91 = 0                                                                                       ⟨316025⟩
        v90 = 0                                                                                       ⟨316026⟩
        v75 = 0                                                                                       ⟨316049⟩
        v74 = 0                                                                                       ⟨316050⟩
        v65 = 0                                                                                       ⟨316068⟩
        v64 = 0                                                                                       ⟨316069⟩
        v55 = 0                                                                                       ⟨316087⟩
        v54 = 0                                                                                       ⟨316088⟩
        voix_arrête(voix=voix1)                                                                       ⟨316092⟩
        v3042 = 0                                                                                     ⟨316110⟩
        v3037 = 0                                                                                     ⟨316111⟩
        v3036 = 0                                                                                     ⟨316112⟩
        canal_arrête(canal=canal2)                                                                    ⟨316115⟩
        v968 = 0                                                                                      ⟨316133⟩
        v963 = 0                                                                                      ⟨316134⟩
        v962 = 0                                                                                      ⟨316135⟩
        v43 = 0                                                                                       ⟨316158⟩
        v42 = 0                                                                                       ⟨316159⟩
        retour                                                                                        ⟨316196⟩
    v14 = 44                                                                                          ⟨316200⟩
    si = scène7.compteur                                                                              ⟨316201⟩
    v12 = si + ((v14·70) / 100)                                                                       ⟨316210⟩
    tant que (scène7.compteur < v12) et (scène7.terminée == 0) :
        v312 = scène7.compteur                                                                        ⟨316216⟩
        si si + 3 == v312 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[14])                             ⟨316229⟩
        si si + 3 == v312 :
            tête_texte_de_lèvres(tête=c18, texte="ofamrcnry")                                         ⟨316239⟩
        si si + 15 == v312 :
            tête_image_de_base(tête=c18, image=12)                                                    ⟨316249⟩
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
    v241 = 0                                                                                          ⟨316411⟩
    v240 = 0                                                                                          ⟨316412⟩
    v231 = 0                                                                                          ⟨316430⟩
    v230 = 0                                                                                          ⟨316431⟩
    v221 = 0                                                                                          ⟨316449⟩
    v220 = 0                                                                                          ⟨316450⟩
    v211 = 0                                                                                          ⟨316468⟩
    v210 = 0                                                                                          ⟨316469⟩
    v201 = 0                                                                                          ⟨316487⟩
    v200 = 0                                                                                          ⟨316488⟩
    v191 = 0                                                                                          ⟨316506⟩
    v190 = 0                                                                                          ⟨316507⟩
    v181 = 0                                                                                          ⟨316525⟩
    v180 = 0                                                                                          ⟨316526⟩
    v171 = 0                                                                                          ⟨316544⟩
    v170 = 0                                                                                          ⟨316545⟩
    v155 = 0                                                                                          ⟨316568⟩
    v154 = 0                                                                                          ⟨316569⟩
    v139 = 0                                                                                          ⟨316592⟩
    v138 = 0                                                                                          ⟨316593⟩
    v123 = 0                                                                                          ⟨316616⟩
    v122 = 0                                                                                          ⟨316617⟩
    v107 = 0                                                                                          ⟨316640⟩
    v106 = 0                                                                                          ⟨316641⟩
    v91 = 0                                                                                           ⟨316664⟩
    v90 = 0                                                                                           ⟨316665⟩
    v75 = 0                                                                                           ⟨316688⟩
    v74 = 0                                                                                           ⟨316689⟩
    v65 = 0                                                                                           ⟨316707⟩
    v64 = 0                                                                                           ⟨316708⟩
    v55 = 0                                                                                           ⟨316726⟩
    v54 = 0                                                                                           ⟨316727⟩
    voix_arrête(voix=voix1)                                                                           ⟨316731⟩
    v3042 = 0                                                                                         ⟨316749⟩
    v3037 = 0                                                                                         ⟨316750⟩
    v3036 = 0                                                                                         ⟨316751⟩
    canal_arrête(canal=canal2)                                                                        ⟨316754⟩
    v968 = 0                                                                                          ⟨316772⟩
    v963 = 0                                                                                          ⟨316773⟩
    v962 = 0                                                                                          ⟨316774⟩
    v43 = 0                                                                                           ⟨316797⟩
    v42 = 0                                                                                           ⟨316798⟩
    retour                                                                                            ⟨316835⟩

──── scène8 ────
scène8 = Scene_Create(cadence=15, palette=255, surface=&v584)                                         ⟨316845⟩
c19 = Layer(ressource=midgames 42, x=0, y=-80)                                                        ⟨316852⟩
c20 = Layer(ressource=midgames 33, x=0, y=0)                                                          ⟨316860⟩
c21 = Layer(ressource=midgames 34, x=0, y=0)                                                          ⟨316868⟩
c22 = Layer(ressource=midgames 35, x=0, y=0)                                                          ⟨316876⟩
c23 = Layer(ressource=midgames 29, x=0, y=-24)                                                        ⟨316884⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨316894⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨316903⟩
ajoute c19 à scène8                                                                                   ⟨316908⟩
ajoute c23 à scène8                                                                                   ⟨316913⟩
ajoute c20 à scène8                                                                                   ⟨316918⟩
ajoute c21 à scène8                                                                                   ⟨316923⟩
ajoute c22 à scène8                                                                                   ⟨316928⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨316940⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨316945⟩
Widget_Method_Dispatch8_314A9(zone1, 12)                                                              ⟨316950⟩
v320 = 0                                                                                              ⟨316952⟩
v322 = 0                                                                                              ⟨316953⟩
v324 = 1                                                                                              ⟨316954⟩
v12 = 135                                                                                             ⟨316957⟩
si v21 != 0 :
    charge(asoundfx 76)                                                                               ⟨316980⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨316985⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 76, x=0)                                        ⟨316992⟩
    v340 = word_48F3A                                                                                 ⟨316995⟩
    v342 = 0                                                                                          ⟨316996⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3220)                                        ⟨317002⟩
        AIL_set_relative_volume_30C66(canal3.+0→4, v3220, v340, v342)                                 ⟨317009⟩
v346 = 0                                                                                              ⟨317018⟩
si v20 != 0 :
    Scene_Tick(scène=scène8)                                                                          ⟨317023⟩
    charge(mid33voc 8)                                                                                ⟨317031⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid33voc 8)                                 ⟨317037⟩
tant que (scène8.compteur < v12) et (scène8.terminée == 0) :
    di = scène8.compteur                                                                              ⟨317045⟩
    si scène8.compteur > 30 :
        si scène8.compteur < 120 :
            v354 = v324                                                                               ⟨317051⟩
            v324_avant = v324                                                                         ⟨317052⟩
            v324 = v324 + 1                                                                           ⟨317052⟩
            c23.image = v354                                                                          ⟨317055⟩
    si scène8.compteur == 90 :
        Scene_SetFps(scène=scène8, cadence=9)                                                         ⟨317064⟩
    si scène8.compteur == 120 :
        retire(parent=scène8, calque=c23)                                                             ⟨317073⟩
        c23.détruit(3)                                                                                ⟨317081⟩
    si mid33voc 0.+0 + 6 == scène8.compteur :
        si v20 == 0 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[15])                             ⟨317103⟩
    si mid33voc 0.+0 + 5 < scène8.compteur :
        si mid33voc 0.+0 + 10 > scène8.compteur :
            v356 = v320                                                                               ⟨317117⟩
            v320_avant = v320                                                                         ⟨317118⟩
            v320 = v320 + 1                                                                           ⟨317118⟩
            c21.image = v356                                                                          ⟨317121⟩
    si mid33voc 0.+0 + 13 < scène8.compteur :
        si mid33voc 0.+0 + 18 > scène8.compteur :
            v358 = v322                                                                               ⟨317134⟩
            v322_avant = v322                                                                         ⟨317135⟩
            v322 = v322 + 1                                                                           ⟨317135⟩
            c22.image = v358                                                                          ⟨317138⟩
    si midgames 39.+0 + 8 == scène8.compteur :
        si v20 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨317151⟩
    si midgames 39.+0 + 27 == scène8.compteur :
        si v20 == 0 :
            texte_formaté(zone=zone1, format=9967, a=4, b=160, c=textes1[16])                         ⟨317174⟩
    si midgames 39.+0 + 25 < scène8.compteur :
        si midgames 39.+0 + 30 > scène8.compteur :
            v320 = v320 - 1                                                                           ⟨317187⟩
            v360 = v320                                                                               ⟨317189⟩
            c21.image = v360                                                                          ⟨317192⟩
    si midgames 39.+0 + 32 < scène8.compteur :
        si midgames 39.+0 + 41 > scène8.compteur :
            si scène8.compteur & 1 != 0 :
                v322 = v322 - 1                                                                       ⟨317206⟩
                c22.image = v322                                                                      ⟨317211⟩
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
v346 = 0                                                                                              ⟨317326⟩
canal_arrête(canal=canal3)                                                                            ⟨317329⟩
v3218 = 0                                                                                             ⟨317347⟩
v3213 = 0                                                                                             ⟨317348⟩
v3212 = 0                                                                                             ⟨317349⟩
v332 = 0                                                                                              ⟨317368⟩
Scene_Destruct(scène=scène8, drapeaux=0)                                                              ⟨317372⟩
fondu_disparition(palette=pal1, couleur=&v38, pas=2, premier=0, nombre=256)                           ⟨317381⟩
v312 = 0                                                                                              ⟨317386⟩
v322 = 0                                                                                              ⟨317390⟩
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
v322 = 0                                                                                              ⟨317450⟩
ResourceRecord_ReadDwordFieldB_3C36F(flux2, données(v348))                                            ⟨317465⟩
v3291 = v3274                                                                                         ⟨317468⟩
iff_ferme(flux=flux2)                                                                                 ⟨317471⟩
iff_form(flux=flux2, balise=large [dword_4572D], x=0)                                                 ⟨317477⟩
iff_chunk(flux=flux2, balise=large [dword_45732], x=0)                                                ⟨317483⟩
Memory_TypedFreeWrapper_2B7E1(26138, v3278, 2, 0, 1)                                                  ⟨317492⟩
v354 = ?                                                                                              ⟨317494⟩
v356 = Memory_TypedFreeWrapper_2B7E1(26138, v3278, 2, 0, 1)                                           ⟨317495⟩
v313 = 1                                                                                              ⟨317499⟩
v312 = 0                                                                                              ⟨317500⟩
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
scène8.+6 = 2                                                                                         ⟨317603⟩
Widget_ComputeBoundsExtent_31755(zone3, 160, 97)                                                      ⟨317608⟩
texte_formaté(zone=zone3, format=10007)                                                               ⟨317613⟩
fondu_apparition(palette=pal1, couleur=&v332, pas=2, premier=0, nombre=256)                           ⟨317622⟩
vide_entrées()                                                                                        ⟨317624⟩
v344_avant = v344                                                                                     ⟨317626⟩
v344 = booléen                                                                                        ⟨317626⟩
v348_avant = v348                                                                                     ⟨317627⟩
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
v322 = 0                                                                                              ⟨317743⟩
v312 = 0                                                                                              ⟨317762⟩
v286 = 0                                                                                              ⟨317788⟩
v281 = 0                                                                                              ⟨317789⟩
v280 = 0                                                                                              ⟨317790⟩
v256 = 0                                                                                              ⟨317816⟩
v251 = 0                                                                                              ⟨317817⟩
v250 = 0                                                                                              ⟨317818⟩
v241 = 0                                                                                              ⟨317836⟩
v240 = 0                                                                                              ⟨317837⟩
v231 = 0                                                                                              ⟨317855⟩
v230 = 0                                                                                              ⟨317856⟩
v221 = 0                                                                                              ⟨317874⟩
v220 = 0                                                                                              ⟨317875⟩
v211 = 0                                                                                              ⟨317893⟩
v210 = 0                                                                                              ⟨317894⟩
v201 = 0                                                                                              ⟨317912⟩
v200 = 0                                                                                              ⟨317913⟩
v191 = 0                                                                                              ⟨317931⟩
v190 = 0                                                                                              ⟨317932⟩
v181 = 0                                                                                              ⟨317950⟩
v180 = 0                                                                                              ⟨317951⟩
v171 = 0                                                                                              ⟨317969⟩
v170 = 0                                                                                              ⟨317970⟩
v155 = 0                                                                                              ⟨317993⟩
v154 = 0                                                                                              ⟨317994⟩
v139 = 0                                                                                              ⟨318017⟩
v138 = 0                                                                                              ⟨318018⟩
v123 = 0                                                                                              ⟨318041⟩
v122 = 0                                                                                              ⟨318042⟩
v107 = 0                                                                                              ⟨318065⟩
v106 = 0                                                                                              ⟨318066⟩
v91 = 0                                                                                               ⟨318089⟩
v90 = 0                                                                                               ⟨318090⟩
v75 = 0                                                                                               ⟨318113⟩
v74 = 0                                                                                               ⟨318114⟩
v65 = 0                                                                                               ⟨318132⟩
v64 = 0                                                                                               ⟨318133⟩
v55 = 0                                                                                               ⟨318151⟩
v54 = 0                                                                                               ⟨318152⟩
voix_arrête(voix=voix1)                                                                               ⟨318156⟩
v3042 = 0                                                                                             ⟨318174⟩
v3037 = 0                                                                                             ⟨318175⟩
v3036 = 0                                                                                             ⟨318176⟩
canal_arrête(canal=canal2)                                                                            ⟨318179⟩
v968 = 0                                                                                              ⟨318197⟩
v963 = 0                                                                                              ⟨318198⟩
v962 = 0                                                                                              ⟨318199⟩
v43 = 0                                                                                               ⟨318222⟩
v42 = 0                                                                                               ⟨318223⟩
retour                                                                                                ⟨318260⟩
```

## Tableaux du segment de données

