# Script extrait de `sub_AFB90` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## sub_AFB90

```
bp = sp                                                                                               ⟨318470⟩
tableau_textes(tableau=textes1, nombre=11, longueur=200)                                              ⟨318479⟩
byte_495FC = 0                                                                                        ⟨318481⟩
v9 = 0                                                                                                ⟨318482⟩
v10 = 0                                                                                               ⟨318483⟩
v11 = 0                                                                                               ⟨318484⟩
si word_4684B != 0 :
    v10 = 1                                                                                           ⟨318487⟩
v14 = word_46F46                                                                                      ⟨318491⟩
v412 = 0                                                                                              ⟨318492⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v412, v14)                                                      ⟨318497⟩
v426 = 0                                                                                              ⟨318499⟩
TextRenderer_ApplyFormatChange_2EA21(&v426, 0)                                                        ⟨318508⟩
SmallObject_RegisterInList_2CB40(&v18, &v426)                                                         ⟨318514⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨318520⟩
v28 = 0                                                                                               ⟨318526⟩
si v10 != 0 :
    si sub_6734(chemin1) != 0 :
        pak mid34voc.ouvre(chemin1, 1)                                                                ⟨318575⟩
    sinon :
        v10 = 0                                                                                       ⟨318582⟩
sinon :
    v10 = 0                                                                                           ⟨318582⟩
v38 = 0                                                                                               ⟨318585⟩
v33 = 0                                                                                               ⟨318587⟩
v32 = 0                                                                                               ⟨318588⟩
v40 = byte_46848                                                                                      ⟨318590⟩
si v40 != 1 :
    si v40 == 2 : aller à loc_AFE99                                                                   ⟨318600⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨318636⟩
        flux_iff(flux=flux1)                                                                          ⟨318650⟩
        v3015 = 256                                                                                   ⟨318653⟩
        v3019 = 0                                                                                     ⟨318654⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨318662⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨318668⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨318674⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨318678⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨318680⟩
        di = 1                                                                                        ⟨318681⟩
        tant que di <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨318688⟩
            ds:24192[di·2] = iff_lit_mot(flux=flux1)                                                  ⟨318692⟩
            di = di + 1                                                                               ⟨318693⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨318700⟩
        v11 = 1                                                                                       ⟨318702⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨318706⟩
    si sub_6734(chemin1) != 0 :
        v9 = 1                                                                                        ⟨318732⟩
        si v11 == 0 :
            word_48F76 = 90                                                                           ⟨318737⟩
    aller à loc_B0004                                                                                 ⟨318741⟩
    loc_AFE99:                                                                                        ⟨318744⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨318772⟩
        flux_iff(flux=flux1)                                                                          ⟨318786⟩
        v3015 = 256                                                                                   ⟨318789⟩
        v3019 = 0                                                                                     ⟨318790⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨318798⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨318804⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨318810⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨318814⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨318816⟩
        di = 1                                                                                        ⟨318817⟩
        tant que di <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨318824⟩
            ds:24192[di·2] = iff_lit_mot(flux=flux1)                                                  ⟨318828⟩
            di = di + 1                                                                               ⟨318829⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨318836⟩
        v11 = 1                                                                                       ⟨318838⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨318842⟩
    si sub_6734(chemin1) != 0 :
        v9 = 1                                                                                        ⟨318868⟩
        si v11 == 0 :
            word_48F76 = 255                                                                          ⟨318873⟩
loc_B0004:                                                                                            ⟨318879⟩
si v11 != 0 :
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨318896⟩
    charge(asoundfx 76)                                                                               ⟨318908⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 76, x=0)                                        ⟨318915⟩
    canal_arrête(canal=canal1)                                                                        ⟨318919⟩
    v268 = 0                                                                                          ⟨318939⟩
    canal_arrête(canal=canal1)                                                                        ⟨318942⟩
    v2954 = 0                                                                                         ⟨318960⟩
v796 = 0                                                                                              ⟨318965⟩
v791 = 0                                                                                              ⟨318967⟩
v790 = 0                                                                                              ⟨318968⟩
v800 = 0                                                                                              ⟨318969⟩
si v9 != 0 :
    si v10 != 0 :
        v265 = 20                                                                                     ⟨318982⟩
    sinon :
        v265 = 19                                                                                     ⟨318987⟩
    charge(amusic v265)                                                                               ⟨318998⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨319003⟩
    canal_enregistre(canal=canal2, ressource=amusic v265, x=0)                                        ⟨319010⟩
v809 = booléen                                                                                        ⟨319027⟩
v805 = booléen                                                                                        ⟨319028⟩
si v10 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨319034⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨319052⟩
    v3015 = 256                                                                                       ⟨319055⟩
    v3019 = 0                                                                                         ⟨319056⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨319064⟩
    iff_form(flux=flux1, balise='MG34', x=0)                                                          ⟨319070⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨319076⟩
    di = 0                                                                                            ⟨319078⟩
    tant que di < 11 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨319087⟩
        v266 = v2998                                                                                  ⟨319090⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·di), taille=v266)                    ⟨319101⟩
        v3011 = v2994                                                                                 ⟨319104⟩
        di = di + 1                                                                                   ⟨319105⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨319112⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨319117⟩
charge(midgames 42)                                                                                   ⟨319136⟩
charge(midgames 44)                                                                                   ⟨319148⟩
charge_convdata_type2("normal")                                                                       ⟨319158⟩
palette_depuis(pal2(convdata type 2 "normal"))                                                        ⟨319165⟩
charge(midgames 37)                                                                                   ⟨319177⟩
palette_depuis(pal3(midgames 37))                                                                     ⟨319184⟩
charge(midgames 43)                                                                                   ⟨319196⟩
palette_depuis(pal4(midgames 43))                                                                     ⟨319203⟩
charge(midgames 45)                                                                                   ⟨319215⟩
palette_depuis(pal5(midgames 45))                                                                     ⟨319222⟩
charge(midgames 41)                                                                                   ⟨319234⟩
palette_depuis(pal6(midgames 41))                                                                     ⟨319241⟩
charge(midgames 29)                                                                                   ⟨319253⟩
charge(midgames 33)                                                                                   ⟨319265⟩
charge(midgames 34)                                                                                   ⟨319277⟩
charge(midgames 35)                                                                                   ⟨319289⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨319299⟩
charge_convdata_type0("lyle", drapeau=3)                                                              ⟨319309⟩
charge_convdata_type0("tex", drapeau=3)                                                               ⟨319319⟩
charge_convdata_type0("gwen", drapeau=3)                                                              ⟨319329⟩
charge_convdata_type0("miguel", drapeau=3)                                                            ⟨319339⟩
v240 = 0                                                                                              ⟨319341⟩
v236 = 2                                                                                              ⟨319342⟩
v235 = 0                                                                                              ⟨319343⟩
v234 = 0                                                                                              ⟨319344⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨319358⟩
v242 = ?                                                                                              ⟨319360⟩
v244 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                ⟨319361⟩
v240 = v244                                                                                           ⟨319363⟩
v236 = 2                                                                                              ⟨319364⟩
v235 = 1                                                                                              ⟨319365⟩
v234 = 0                                                                                              ⟨319366⟩
GlyphObject_ConstructWithBuffer_311CF(&v2910, &v240)                                                  ⟨319371⟩
v254 = word_46F46                                                                                     ⟨319378⟩
zone_texte(zone=zone1, police=&v2910)                                                                 ⟨319384⟩
v256 = 152                                                                                            ⟨319388⟩
v258 = 319                                                                                            ⟨319390⟩
v260 = 199                                                                                            ⟨319392⟩
v2919 = 0                                                                                             ⟨319394⟩
v2917 = v256                                                                                          ⟨319396⟩
v2915 = v258                                                                                          ⟨319398⟩
v2913 = v260                                                                                          ⟨319400⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨319404⟩
Widget_Method_Dispatch8_314A9(zone1, 200)                                                             ⟨319409⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨319442⟩
    v235 = 0                                                                                          ⟨319443⟩
    v234 = 0                                                                                          ⟨319444⟩
    v225 = 0                                                                                          ⟨319462⟩
    v224 = 0                                                                                          ⟨319463⟩
    v215 = 0                                                                                          ⟨319481⟩
    v214 = 0                                                                                          ⟨319482⟩
    v205 = 0                                                                                          ⟨319500⟩
    v204 = 0                                                                                          ⟨319501⟩
    v195 = 0                                                                                          ⟨319519⟩
    v194 = 0                                                                                          ⟨319520⟩
    v185 = 0                                                                                          ⟨319538⟩
    v184 = 0                                                                                          ⟨319539⟩
    v175 = 0                                                                                          ⟨319557⟩
    v174 = 0                                                                                          ⟨319558⟩
    v165 = 0                                                                                          ⟨319576⟩
    v164 = 0                                                                                          ⟨319577⟩
    v155 = 0                                                                                          ⟨319595⟩
    v154 = 0                                                                                          ⟨319596⟩
    v145 = 0                                                                                          ⟨319614⟩
    v144 = 0                                                                                          ⟨319615⟩
    v129 = 0                                                                                          ⟨319638⟩
    v128 = 0                                                                                          ⟨319639⟩
    v113 = 0                                                                                          ⟨319662⟩
    v112 = 0                                                                                          ⟨319663⟩
    v97 = 0                                                                                           ⟨319686⟩
    v96 = 0                                                                                           ⟨319687⟩
    v81 = 0                                                                                           ⟨319710⟩
    v80 = 0                                                                                           ⟨319711⟩
    v65 = 0                                                                                           ⟨319734⟩
    v64 = 0                                                                                           ⟨319735⟩
    v55 = 0                                                                                           ⟨319753⟩
    v54 = 0                                                                                           ⟨319754⟩
    v45 = 0                                                                                           ⟨319772⟩
    v44 = 0                                                                                           ⟨319773⟩
    voix_arrête(voix=voix1)                                                                           ⟨319777⟩
    v2870 = 0                                                                                         ⟨319795⟩
    v2865 = 0                                                                                         ⟨319796⟩
    v2864 = 0                                                                                         ⟨319797⟩
    canal_arrête(canal=canal2)                                                                        ⟨319800⟩
    v796 = 0                                                                                          ⟨319818⟩
    v791 = 0                                                                                          ⟨319819⟩
    v790 = 0                                                                                          ⟨319820⟩
    v33 = 0                                                                                           ⟨319843⟩
    v32 = 0                                                                                           ⟨319844⟩
    retour                                                                                            ⟨319881⟩
si v9 != 0 :
    v262 = word_48F76                                                                                 ⟨319888⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v798)                                         ⟨319895⟩
        AIL_set_relative_volume_30C66(canal2.+0→4, v798, v262, 0)                                     ⟨319902⟩

──── scène1 ────
scène1 = Scene_Create(cadence=6, palette=255, surface=&v412)                                          ⟨319914⟩
c1 = Layer(ressource=midgames 42, x=0, y=-80)                                                         ⟨319921⟩
c2 = Layer(ressource=midgames 33, x=0, y=0)                                                           ⟨319929⟩
c3 = Layer(ressource=midgames 34, x=0, y=0)                                                           ⟨319937⟩
c4 = Layer(ressource=midgames 35, x=0, y=0)                                                           ⟨319945⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨319955⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨319964⟩
ajoute c1 à scène1                                                                                    ⟨319969⟩
ajoute c2 à scène1                                                                                    ⟨319974⟩
ajoute c3 à scène1                                                                                    ⟨319979⟩
ajoute c4 à scène1                                                                                    ⟨319984⟩
fondu_disparition(palette=pal1, couleur=&v28, pas=0, premier=0, nombre=256)                           ⟨319997⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨320006⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨320015⟩
Scene_Tick(scène=scène1)                                                                              ⟨320019⟩
fondu_apparition(palette=pal1, couleur=&v28, pas=2, premier=0, nombre=256)                            ⟨320028⟩
si v10 != 0 :
    Scene_Tick(scène=scène1)                                                                          ⟨320038⟩
    charge(mid34voc 0)                                                                                ⟨320050⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 0)                                 ⟨320056⟩
    di = 0                                                                                            ⟨320058⟩
    tant que di < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨320065⟩
        di = di + 1                                                                                   ⟨320067⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨320075⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène1)                                                                      ⟨320093⟩
    di = 0                                                                                            ⟨320105⟩
    tant que di < 8 :
        Scene_Tick(scène=scène1)                                                                      ⟨320112⟩
        di = di + 1                                                                                   ⟨320114⟩
    charge(mid34voc 1)                                                                                ⟨320129⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 1)                                 ⟨320135⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨320140⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène1)                                                                      ⟨320158⟩
    di = 0                                                                                            ⟨320170⟩
    tant que di < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨320177⟩
        di = di + 1                                                                                   ⟨320179⟩
    voix_arrête(voix=voix1)                                                                           ⟨320186⟩
    v286 = 0                                                                                          ⟨320206⟩
sinon :
    Widget_Method_DispatchC_314CB(zone1, 0)                                                           ⟨320233⟩
    Widget_Method_Dispatch8_314A9(zone1, 233)                                                         ⟨320238⟩
    v4 = 50                                                                                           ⟨320240⟩
    si = scène1.compteur                                                                              ⟨320241⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨320250⟩
    tant que (scène1.compteur < v2) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨320255⟩
        si si + 3 == scène1.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[0])                              ⟨320263⟩
        si v2 - 1 == scène1.compteur :
            v2990 = 4540                                                                              ⟨320271⟩
            v2990 = 4552                                                                              ⟨320272⟩
            v2990 = 4568                                                                              ⟨320273⟩
            v2990 = 4584                                                                              ⟨320274⟩
            v2990 = 4604                                                                              ⟨320275⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨320285⟩
        Scene_Tick(scène=scène1)                                                                      ⟨320317⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène1, drapeaux=0)                                                      ⟨320353⟩
        v240 = 0                                                                                      ⟨320380⟩
        v235 = 0                                                                                      ⟨320381⟩
        v234 = 0                                                                                      ⟨320382⟩
        v225 = 0                                                                                      ⟨320400⟩
        v224 = 0                                                                                      ⟨320401⟩
        v215 = 0                                                                                      ⟨320419⟩
        v214 = 0                                                                                      ⟨320420⟩
        v205 = 0                                                                                      ⟨320438⟩
        v204 = 0                                                                                      ⟨320439⟩
        v195 = 0                                                                                      ⟨320457⟩
        v194 = 0                                                                                      ⟨320458⟩
        v185 = 0                                                                                      ⟨320476⟩
        v184 = 0                                                                                      ⟨320477⟩
        v175 = 0                                                                                      ⟨320495⟩
        v174 = 0                                                                                      ⟨320496⟩
        v165 = 0                                                                                      ⟨320514⟩
        v164 = 0                                                                                      ⟨320515⟩
        v155 = 0                                                                                      ⟨320533⟩
        v154 = 0                                                                                      ⟨320534⟩
        v145 = 0                                                                                      ⟨320552⟩
        v144 = 0                                                                                      ⟨320553⟩
        v129 = 0                                                                                      ⟨320576⟩
        v128 = 0                                                                                      ⟨320577⟩
        v113 = 0                                                                                      ⟨320600⟩
        v112 = 0                                                                                      ⟨320601⟩
        v97 = 0                                                                                       ⟨320624⟩
        v96 = 0                                                                                       ⟨320625⟩
        v81 = 0                                                                                       ⟨320648⟩
        v80 = 0                                                                                       ⟨320649⟩
        v65 = 0                                                                                       ⟨320672⟩
        v64 = 0                                                                                       ⟨320673⟩
        v55 = 0                                                                                       ⟨320691⟩
        v54 = 0                                                                                       ⟨320692⟩
        v45 = 0                                                                                       ⟨320710⟩
        v44 = 0                                                                                       ⟨320711⟩
        voix_arrête(voix=voix1)                                                                       ⟨320715⟩
        v2870 = 0                                                                                     ⟨320733⟩
        v2865 = 0                                                                                     ⟨320734⟩
        v2864 = 0                                                                                     ⟨320735⟩
        canal_arrête(canal=canal2)                                                                    ⟨320738⟩
        v796 = 0                                                                                      ⟨320756⟩
        v791 = 0                                                                                      ⟨320757⟩
        v790 = 0                                                                                      ⟨320758⟩
        v33 = 0                                                                                       ⟨320781⟩
        v32 = 0                                                                                       ⟨320782⟩
        retour                                                                                        ⟨320819⟩
    v4 = 38                                                                                           ⟨320823⟩
    si = scène1.compteur                                                                              ⟨320824⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨320833⟩
    tant que (scène1.compteur < v2) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨320838⟩
        si si + 1 == scène1.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[1])                              ⟨320848⟩
        si v2 - 1 == scène1.compteur :
            v2990 = 4540                                                                              ⟨320856⟩
            v2990 = 4552                                                                              ⟨320857⟩
            v2990 = 4568                                                                              ⟨320858⟩
            v2990 = 4584                                                                              ⟨320859⟩
            v2990 = 4604                                                                              ⟨320860⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨320870⟩
        Scene_Tick(scène=scène1)                                                                      ⟨320902⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨320932⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨320965⟩
    v235 = 0                                                                                          ⟨320966⟩
    v234 = 0                                                                                          ⟨320967⟩
    v225 = 0                                                                                          ⟨320985⟩
    v224 = 0                                                                                          ⟨320986⟩
    v215 = 0                                                                                          ⟨321004⟩
    v214 = 0                                                                                          ⟨321005⟩
    v205 = 0                                                                                          ⟨321023⟩
    v204 = 0                                                                                          ⟨321024⟩
    v195 = 0                                                                                          ⟨321042⟩
    v194 = 0                                                                                          ⟨321043⟩
    v185 = 0                                                                                          ⟨321061⟩
    v184 = 0                                                                                          ⟨321062⟩
    v175 = 0                                                                                          ⟨321080⟩
    v174 = 0                                                                                          ⟨321081⟩
    v165 = 0                                                                                          ⟨321099⟩
    v164 = 0                                                                                          ⟨321100⟩
    v155 = 0                                                                                          ⟨321118⟩
    v154 = 0                                                                                          ⟨321119⟩
    v145 = 0                                                                                          ⟨321137⟩
    v144 = 0                                                                                          ⟨321138⟩
    v129 = 0                                                                                          ⟨321161⟩
    v128 = 0                                                                                          ⟨321162⟩
    v113 = 0                                                                                          ⟨321185⟩
    v112 = 0                                                                                          ⟨321186⟩
    v97 = 0                                                                                           ⟨321209⟩
    v96 = 0                                                                                           ⟨321210⟩
    v81 = 0                                                                                           ⟨321233⟩
    v80 = 0                                                                                           ⟨321234⟩
    v65 = 0                                                                                           ⟨321257⟩
    v64 = 0                                                                                           ⟨321258⟩
    v55 = 0                                                                                           ⟨321276⟩
    v54 = 0                                                                                           ⟨321277⟩
    v45 = 0                                                                                           ⟨321295⟩
    v44 = 0                                                                                           ⟨321296⟩
    voix_arrête(voix=voix1)                                                                           ⟨321300⟩
    v2870 = 0                                                                                         ⟨321318⟩
    v2865 = 0                                                                                         ⟨321319⟩
    v2864 = 0                                                                                         ⟨321320⟩
    canal_arrête(canal=canal2)                                                                        ⟨321323⟩
    v796 = 0                                                                                          ⟨321341⟩
    v791 = 0                                                                                          ⟨321342⟩
    v790 = 0                                                                                          ⟨321343⟩
    v33 = 0                                                                                           ⟨321366⟩
    v32 = 0                                                                                           ⟨321367⟩
    retour                                                                                            ⟨321404⟩

──── scène2 ────
scène2 = Scene_Create(cadence=9, palette=255, surface=&v412)                                          ⟨321414⟩
c5 = Layer(ressource=midgames 44, x=0, y=0)                                                           ⟨321421⟩
CRT_Rand()                                                                                            ⟨321425⟩
c6 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)            ⟨321436⟩
tête_image_de_base(tête=c6, image=19)                                                                 ⟨321441⟩
ajoute c5 à scène2                                                                                    ⟨321446⟩
ajoute c6 à scène2                                                                                    ⟨321451⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨321460⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨321469⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨321481⟩
si v10 != 0 :
    Scene_Tick(scène=scène2)                                                                          ⟨321491⟩
    charge(mid34voc 2)                                                                                ⟨321503⟩
    tête_voix(tête=c6, ressource=mid34voc 2, cadence=9)                                               ⟨321509⟩
    di = 0                                                                                            ⟨321511⟩
    tant que di < 3 :
        Scene_Tick(scène=scène2)                                                                      ⟨321518⟩
        di = di + 1                                                                                   ⟨321520⟩
    di = 0                                                                                            ⟨321525⟩
    tant que tête_parle(tête=c6) != 0 :
        si di == 5 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨321534⟩
        si di == 6 :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨321542⟩
        si di == 9 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨321550⟩
        di = di + 1                                                                                   ⟨321555⟩
        si di == 10 :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨321560⟩
        Scene_Tick(scène=scène2)                                                                      ⟨321576⟩
    si byte_495FC != 0 :
        v278 = 0                                                                                      ⟨321609⟩
        v272 = 0                                                                                      ⟨321611⟩
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨321615⟩
        v240 = 0                                                                                      ⟨321642⟩
        v235 = 0                                                                                      ⟨321643⟩
        v234 = 0                                                                                      ⟨321644⟩
        v225 = 0                                                                                      ⟨321662⟩
        v224 = 0                                                                                      ⟨321663⟩
        v215 = 0                                                                                      ⟨321681⟩
        v214 = 0                                                                                      ⟨321682⟩
        v205 = 0                                                                                      ⟨321700⟩
        v204 = 0                                                                                      ⟨321701⟩
        v195 = 0                                                                                      ⟨321719⟩
        v194 = 0                                                                                      ⟨321720⟩
        v185 = 0                                                                                      ⟨321738⟩
        v184 = 0                                                                                      ⟨321739⟩
        v175 = 0                                                                                      ⟨321757⟩
        v174 = 0                                                                                      ⟨321758⟩
        v165 = 0                                                                                      ⟨321776⟩
        v164 = 0                                                                                      ⟨321777⟩
        v155 = 0                                                                                      ⟨321795⟩
        v154 = 0                                                                                      ⟨321796⟩
        v145 = 0                                                                                      ⟨321814⟩
        v144 = 0                                                                                      ⟨321815⟩
        v129 = 0                                                                                      ⟨321838⟩
        v128 = 0                                                                                      ⟨321839⟩
        v113 = 0                                                                                      ⟨321862⟩
        v112 = 0                                                                                      ⟨321863⟩
        v97 = 0                                                                                       ⟨321886⟩
        v96 = 0                                                                                       ⟨321887⟩
        v81 = 0                                                                                       ⟨321910⟩
        v80 = 0                                                                                       ⟨321911⟩
        v65 = 0                                                                                       ⟨321934⟩
        v64 = 0                                                                                       ⟨321935⟩
        v55 = 0                                                                                       ⟨321953⟩
        v54 = 0                                                                                       ⟨321954⟩
        v45 = 0                                                                                       ⟨321972⟩
        v44 = 0                                                                                       ⟨321973⟩
        voix_arrête(voix=voix1)                                                                       ⟨321977⟩
        v2870 = 0                                                                                     ⟨321995⟩
        v2865 = 0                                                                                     ⟨321996⟩
        v2864 = 0                                                                                     ⟨321997⟩
        canal_arrête(canal=canal2)                                                                    ⟨322000⟩
        v796 = 0                                                                                      ⟨322018⟩
        v791 = 0                                                                                      ⟨322019⟩
        v790 = 0                                                                                      ⟨322020⟩
        v33 = 0                                                                                       ⟨322043⟩
        v32 = 0                                                                                       ⟨322044⟩
        retour                                                                                        ⟨322081⟩
    charge(mid34voc 3)                                                                                ⟨322095⟩
    tête_voix(tête=c6, ressource=mid34voc 3, cadence=9)                                               ⟨322101⟩
    di = 0                                                                                            ⟨322103⟩
    tant que di < 14 :
        Scene_Tick(scène=scène2)                                                                      ⟨322110⟩
        di = di + 1                                                                                   ⟨322112⟩
    di = 0                                                                                            ⟨322117⟩
    tant que tête_parle(tête=c6) != 0 :
        si di == 5 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322126⟩
        si di == 6 :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨322134⟩
        si di == 9 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322142⟩
        di = di + 1                                                                                   ⟨322147⟩
        si di == 10 :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨322152⟩
        Scene_Tick(scène=scène2)                                                                      ⟨322168⟩
    di = 0                                                                                            ⟨322179⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨322186⟩
        di = di + 1                                                                                   ⟨322188⟩
    v278 = 0                                                                                          ⟨322228⟩
    v272 = 0                                                                                          ⟨322230⟩
sinon :
    v2924→0.méthode8(224)                                                                             ⟨322239⟩
    v4 = 86                                                                                           ⟨322241⟩
    si = scène2.compteur                                                                              ⟨322242⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨322251⟩
    tant que (scène2.compteur < v2) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨322256⟩
        si si + 3 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[2])                              ⟨322268⟩
        si si + 3 == scène2.compteur :
            tête_texte_de_lèvres(tête=c6, texte="lthoedptdthaclsinHwkJmstrnwsntavshusmn")             ⟨322278⟩
        si si + 15 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322288⟩
        si si + 16 == scène2.compteur :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨322298⟩
        si si + 19 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322308⟩
        si si + 20 == scène2.compteur :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨322318⟩
        si v2 - 1 == scène2.compteur :
            v2990 = 4540                                                                              ⟨322326⟩
            v2990 = 4552                                                                              ⟨322327⟩
            v2990 = 4568                                                                              ⟨322328⟩
            v2990 = 4584                                                                              ⟨322329⟩
            v2990 = 4604                                                                              ⟨322330⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨322340⟩
        Scene_Tick(scène=scène2)                                                                      ⟨322372⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨322408⟩
        v240 = 0                                                                                      ⟨322435⟩
        v235 = 0                                                                                      ⟨322436⟩
        v234 = 0                                                                                      ⟨322437⟩
        v225 = 0                                                                                      ⟨322455⟩
        v224 = 0                                                                                      ⟨322456⟩
        v215 = 0                                                                                      ⟨322474⟩
        v214 = 0                                                                                      ⟨322475⟩
        v205 = 0                                                                                      ⟨322493⟩
        v204 = 0                                                                                      ⟨322494⟩
        v195 = 0                                                                                      ⟨322512⟩
        v194 = 0                                                                                      ⟨322513⟩
        v185 = 0                                                                                      ⟨322531⟩
        v184 = 0                                                                                      ⟨322532⟩
        v175 = 0                                                                                      ⟨322550⟩
        v174 = 0                                                                                      ⟨322551⟩
        v165 = 0                                                                                      ⟨322569⟩
        v164 = 0                                                                                      ⟨322570⟩
        v155 = 0                                                                                      ⟨322588⟩
        v154 = 0                                                                                      ⟨322589⟩
        v145 = 0                                                                                      ⟨322607⟩
        v144 = 0                                                                                      ⟨322608⟩
        v129 = 0                                                                                      ⟨322631⟩
        v128 = 0                                                                                      ⟨322632⟩
        v113 = 0                                                                                      ⟨322655⟩
        v112 = 0                                                                                      ⟨322656⟩
        v97 = 0                                                                                       ⟨322679⟩
        v96 = 0                                                                                       ⟨322680⟩
        v81 = 0                                                                                       ⟨322703⟩
        v80 = 0                                                                                       ⟨322704⟩
        v65 = 0                                                                                       ⟨322727⟩
        v64 = 0                                                                                       ⟨322728⟩
        v55 = 0                                                                                       ⟨322746⟩
        v54 = 0                                                                                       ⟨322747⟩
        v45 = 0                                                                                       ⟨322765⟩
        v44 = 0                                                                                       ⟨322766⟩
        voix_arrête(voix=voix1)                                                                       ⟨322770⟩
        v2870 = 0                                                                                     ⟨322788⟩
        v2865 = 0                                                                                     ⟨322789⟩
        v2864 = 0                                                                                     ⟨322790⟩
        canal_arrête(canal=canal2)                                                                    ⟨322793⟩
        v796 = 0                                                                                      ⟨322811⟩
        v791 = 0                                                                                      ⟨322812⟩
        v790 = 0                                                                                      ⟨322813⟩
        v33 = 0                                                                                       ⟨322836⟩
        v32 = 0                                                                                       ⟨322837⟩
        retour                                                                                        ⟨322874⟩
    v4 = 60                                                                                           ⟨322878⟩
    si = scène2.compteur                                                                              ⟨322879⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨322888⟩
    tant que (scène2.compteur < v2) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨322893⟩
        si si + 3 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[3])                              ⟨322906⟩
        si si + 3 == scène2.compteur :
            tête_texte_de_lèvres(tête=c6, texte="dspithadngrsocupshnechosfrimslf")                    ⟨322916⟩
        si si + 15 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322926⟩
        si si + 16 == scène2.compteur :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨322936⟩
        si si + 19 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322946⟩
        si si + 20 == scène2.compteur :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨322956⟩
        si v2 - 1 == scène2.compteur :
            v2990 = 4540                                                                              ⟨322964⟩
            v2990 = 4552                                                                              ⟨322965⟩
            v2990 = 4568                                                                              ⟨322966⟩
            v2990 = 4584                                                                              ⟨322967⟩
            v2990 = 4604                                                                              ⟨322968⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨322978⟩
        Scene_Tick(scène=scène2)                                                                      ⟨323010⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨323040⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨323073⟩
    v235 = 0                                                                                          ⟨323074⟩
    v234 = 0                                                                                          ⟨323075⟩
    v225 = 0                                                                                          ⟨323093⟩
    v224 = 0                                                                                          ⟨323094⟩
    v215 = 0                                                                                          ⟨323112⟩
    v214 = 0                                                                                          ⟨323113⟩
    v205 = 0                                                                                          ⟨323131⟩
    v204 = 0                                                                                          ⟨323132⟩
    v195 = 0                                                                                          ⟨323150⟩
    v194 = 0                                                                                          ⟨323151⟩
    v185 = 0                                                                                          ⟨323169⟩
    v184 = 0                                                                                          ⟨323170⟩
    v175 = 0                                                                                          ⟨323188⟩
    v174 = 0                                                                                          ⟨323189⟩
    v165 = 0                                                                                          ⟨323207⟩
    v164 = 0                                                                                          ⟨323208⟩
    v155 = 0                                                                                          ⟨323226⟩
    v154 = 0                                                                                          ⟨323227⟩
    v145 = 0                                                                                          ⟨323245⟩
    v144 = 0                                                                                          ⟨323246⟩
    v129 = 0                                                                                          ⟨323269⟩
    v128 = 0                                                                                          ⟨323270⟩
    v113 = 0                                                                                          ⟨323293⟩
    v112 = 0                                                                                          ⟨323294⟩
    v97 = 0                                                                                           ⟨323317⟩
    v96 = 0                                                                                           ⟨323318⟩
    v81 = 0                                                                                           ⟨323341⟩
    v80 = 0                                                                                           ⟨323342⟩
    v65 = 0                                                                                           ⟨323365⟩
    v64 = 0                                                                                           ⟨323366⟩
    v55 = 0                                                                                           ⟨323384⟩
    v54 = 0                                                                                           ⟨323385⟩
    v45 = 0                                                                                           ⟨323403⟩
    v44 = 0                                                                                           ⟨323404⟩
    voix_arrête(voix=voix1)                                                                           ⟨323408⟩
    v2870 = 0                                                                                         ⟨323426⟩
    v2865 = 0                                                                                         ⟨323427⟩
    v2864 = 0                                                                                         ⟨323428⟩
    canal_arrête(canal=canal2)                                                                        ⟨323431⟩
    v796 = 0                                                                                          ⟨323449⟩
    v791 = 0                                                                                          ⟨323450⟩
    v790 = 0                                                                                          ⟨323451⟩
    v33 = 0                                                                                           ⟨323474⟩
    v32 = 0                                                                                           ⟨323475⟩
    retour                                                                                            ⟨323512⟩

──── scène3 ────
scène3 = Scene_Create(cadence=9, palette=255, surface=&v412)                                          ⟨323522⟩
c7 = Layer(ressource=midgames 42, x=0, y=-80)                                                         ⟨323529⟩
c8 = TalkingHead(ressource=convdata type 0 "lyle", x=164, y=128)                                      ⟨323537⟩
tête_image_de_base(tête=c8, image=31)                                                                 ⟨323542⟩
ajoute c7 à scène3                                                                                    ⟨323547⟩
ajoute c8 à scène3                                                                                    ⟨323552⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨323561⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨323570⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨323582⟩
si v10 != 0 :
    Scene_Tick(scène=scène3)                                                                          ⟨323592⟩
    v278 = 0                                                                                          ⟨323594⟩
    v272 = 0                                                                                          ⟨323597⟩
    charge(mid34voc 4)                                                                                ⟨323604⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 4)                                 ⟨323610⟩
    di = 0                                                                                            ⟨323612⟩
    tant que di < 4 :
        Scene_Tick(scène=scène3)                                                                      ⟨323619⟩
        di = di + 1                                                                                   ⟨323621⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨323629⟩
    di = 0                                                                                            ⟨323631⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨323640⟩
        si di == 8 :
            tête_image_de_base(tête=c8, image=21)                                                     ⟨323648⟩
        di = di + 1                                                                                   ⟨323653⟩
        si di == 17 :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨323658⟩
        Scene_Tick(scène=scène3)                                                                      ⟨323674⟩
    di = 0                                                                                            ⟨323686⟩
    tant que di < 8 :
        Scene_Tick(scène=scène3)                                                                      ⟨323693⟩
        di = di + 1                                                                                   ⟨323695⟩
    voix_arrête(voix=voix1)                                                                           ⟨323702⟩
    v278 = 0                                                                                          ⟨323720⟩
    v272 = 0                                                                                          ⟨323722⟩
sinon :
    v2924→0.méthode8(224)                                                                             ⟨323731⟩
    v4 = 91                                                                                           ⟨323733⟩
    si = scène3.compteur                                                                              ⟨323734⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨323743⟩
    tant que (scène3.compteur < v2) et (scène3.terminée == 0) :
        di = scène3.compteur                                                                          ⟨323748⟩
        si si + 3 == scène3.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[4])                              ⟨323760⟩
        si si + 17 == scène3.compteur :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨323770⟩
        si si + 18 == scène3.compteur :
            tête_image_de_base(tête=c8, image=21)                                                     ⟨323780⟩
        si si + 27 == scène3.compteur :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨323790⟩
        si v2 - 1 == scène3.compteur :
            v2990 = 4540                                                                              ⟨323798⟩
            v2990 = 4552                                                                              ⟨323799⟩
            v2990 = 4568                                                                              ⟨323800⟩
            v2990 = 4584                                                                              ⟨323801⟩
            v2990 = 4604                                                                              ⟨323802⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨323812⟩
        Scene_Tick(scène=scène3)                                                                      ⟨323844⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨323874⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨323907⟩
    v235 = 0                                                                                          ⟨323908⟩
    v234 = 0                                                                                          ⟨323909⟩
    v225 = 0                                                                                          ⟨323927⟩
    v224 = 0                                                                                          ⟨323928⟩
    v215 = 0                                                                                          ⟨323946⟩
    v214 = 0                                                                                          ⟨323947⟩
    v205 = 0                                                                                          ⟨323965⟩
    v204 = 0                                                                                          ⟨323966⟩
    v195 = 0                                                                                          ⟨323984⟩
    v194 = 0                                                                                          ⟨323985⟩
    v185 = 0                                                                                          ⟨324003⟩
    v184 = 0                                                                                          ⟨324004⟩
    v175 = 0                                                                                          ⟨324022⟩
    v174 = 0                                                                                          ⟨324023⟩
    v165 = 0                                                                                          ⟨324041⟩
    v164 = 0                                                                                          ⟨324042⟩
    v155 = 0                                                                                          ⟨324060⟩
    v154 = 0                                                                                          ⟨324061⟩
    v145 = 0                                                                                          ⟨324079⟩
    v144 = 0                                                                                          ⟨324080⟩
    v129 = 0                                                                                          ⟨324103⟩
    v128 = 0                                                                                          ⟨324104⟩
    v113 = 0                                                                                          ⟨324127⟩
    v112 = 0                                                                                          ⟨324128⟩
    v97 = 0                                                                                           ⟨324151⟩
    v96 = 0                                                                                           ⟨324152⟩
    v81 = 0                                                                                           ⟨324175⟩
    v80 = 0                                                                                           ⟨324176⟩
    v65 = 0                                                                                           ⟨324199⟩
    v64 = 0                                                                                           ⟨324200⟩
    v55 = 0                                                                                           ⟨324218⟩
    v54 = 0                                                                                           ⟨324219⟩
    v45 = 0                                                                                           ⟨324237⟩
    v44 = 0                                                                                           ⟨324238⟩
    voix_arrête(voix=voix1)                                                                           ⟨324242⟩
    v2870 = 0                                                                                         ⟨324260⟩
    v2865 = 0                                                                                         ⟨324261⟩
    v2864 = 0                                                                                         ⟨324262⟩
    canal_arrête(canal=canal2)                                                                        ⟨324265⟩
    v796 = 0                                                                                          ⟨324283⟩
    v791 = 0                                                                                          ⟨324284⟩
    v790 = 0                                                                                          ⟨324285⟩
    v33 = 0                                                                                           ⟨324308⟩
    v32 = 0                                                                                           ⟨324309⟩
    retour                                                                                            ⟨324346⟩

──── scène4 ────
scène4 = Scene_Create(cadence=9, palette=255, surface=&v412)                                          ⟨324356⟩
c9 = Layer(ressource=midgames 44, x=0, y=0)                                                           ⟨324363⟩
c10 = TalkingHead(ressource=convdata type 0 "miguel", x=255, y=128)                                   ⟨324371⟩
c11 = TalkingHead(ressource=convdata type 0 "gwen", x=95, y=128)                                      ⟨324379⟩
tête_image_de_base(tête=c10, image=19)                                                                ⟨324384⟩
tête_image_de_base(tête=c11, image=19)                                                                ⟨324388⟩
ajoute c9 à scène4                                                                                    ⟨324393⟩
ajoute c10 à scène4                                                                                   ⟨324398⟩
ajoute c11 à scène4                                                                                   ⟨324403⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨324412⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨324421⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨324433⟩
si v10 != 0 :
    Scene_Tick(scène=scène4)                                                                          ⟨324443⟩
    charge(mid34voc 5)                                                                                ⟨324455⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 5)                                 ⟨324461⟩
    di = 0                                                                                            ⟨324463⟩
    tant que di < 4 :
        Scene_Tick(scène=scène4)                                                                      ⟨324470⟩
        di = di + 1                                                                                   ⟨324472⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨324480⟩
    di = 0                                                                                            ⟨324482⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨324491⟩
        si di == 8 :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨324499⟩
        si di == 9 :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨324507⟩
        si di == 16 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨324515⟩
        si di == 18 :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨324523⟩
        si di == 2 :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨324531⟩
        si di == 3 :
            tête_image_de_base(tête=c11, image=21)                                                    ⟨324539⟩
        di = di + 1                                                                                   ⟨324544⟩
        si di == 22 :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨324549⟩
        Scene_Tick(scène=scène4)                                                                      ⟨324565⟩
    di = 0                                                                                            ⟨324580⟩
    tant que di < 8 :
        Scene_Tick(scène=scène4)                                                                      ⟨324587⟩
        di = di + 1                                                                                   ⟨324589⟩
    voix_arrête(voix=voix1)                                                                           ⟨324596⟩
sinon :
    v2924→0.méthode8(224)                                                                             ⟨324625⟩
    v4 = 91                                                                                           ⟨324627⟩
    si = scène4.compteur                                                                              ⟨324628⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨324637⟩
    tant que (scène4.compteur < v2) et (scène4.terminée == 0) :
        di = scène4.compteur                                                                          ⟨324642⟩
        si si + 3 == scène4.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[5])                              ⟨324655⟩
        si si + 17 == scène4.compteur :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨324665⟩
        si si + 18 == scène4.compteur :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨324675⟩
        si si + 19 == scène4.compteur :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨324685⟩
        si si + 26 == scène4.compteur :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨324695⟩
        si si + 28 == scène4.compteur :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨324705⟩
        si si + 7 == scène4.compteur :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨324715⟩
        si si + 8 == scène4.compteur :
            tête_image_de_base(tête=c11, image=21)                                                    ⟨324725⟩
        si si + 32 == scène4.compteur :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨324735⟩
        si v2 - 1 == scène4.compteur :
            v2990 = 4540                                                                              ⟨324743⟩
            v2990 = 4552                                                                              ⟨324744⟩
            v2990 = 4568                                                                              ⟨324745⟩
            v2990 = 4584                                                                              ⟨324746⟩
            v2990 = 4604                                                                              ⟨324747⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨324757⟩
        Scene_Tick(scène=scène4)                                                                      ⟨324789⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨324819⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨324852⟩
    v235 = 0                                                                                          ⟨324853⟩
    v234 = 0                                                                                          ⟨324854⟩
    v225 = 0                                                                                          ⟨324872⟩
    v224 = 0                                                                                          ⟨324873⟩
    v215 = 0                                                                                          ⟨324891⟩
    v214 = 0                                                                                          ⟨324892⟩
    v205 = 0                                                                                          ⟨324910⟩
    v204 = 0                                                                                          ⟨324911⟩
    v195 = 0                                                                                          ⟨324929⟩
    v194 = 0                                                                                          ⟨324930⟩
    v185 = 0                                                                                          ⟨324948⟩
    v184 = 0                                                                                          ⟨324949⟩
    v175 = 0                                                                                          ⟨324967⟩
    v174 = 0                                                                                          ⟨324968⟩
    v165 = 0                                                                                          ⟨324986⟩
    v164 = 0                                                                                          ⟨324987⟩
    v155 = 0                                                                                          ⟨325005⟩
    v154 = 0                                                                                          ⟨325006⟩
    v145 = 0                                                                                          ⟨325024⟩
    v144 = 0                                                                                          ⟨325025⟩
    v129 = 0                                                                                          ⟨325048⟩
    v128 = 0                                                                                          ⟨325049⟩
    v113 = 0                                                                                          ⟨325072⟩
    v112 = 0                                                                                          ⟨325073⟩
    v97 = 0                                                                                           ⟨325096⟩
    v96 = 0                                                                                           ⟨325097⟩
    v81 = 0                                                                                           ⟨325120⟩
    v80 = 0                                                                                           ⟨325121⟩
    v65 = 0                                                                                           ⟨325144⟩
    v64 = 0                                                                                           ⟨325145⟩
    v55 = 0                                                                                           ⟨325163⟩
    v54 = 0                                                                                           ⟨325164⟩
    v45 = 0                                                                                           ⟨325182⟩
    v44 = 0                                                                                           ⟨325183⟩
    voix_arrête(voix=voix1)                                                                           ⟨325187⟩
    v2870 = 0                                                                                         ⟨325205⟩
    v2865 = 0                                                                                         ⟨325206⟩
    v2864 = 0                                                                                         ⟨325207⟩
    canal_arrête(canal=canal2)                                                                        ⟨325210⟩
    v796 = 0                                                                                          ⟨325228⟩
    v791 = 0                                                                                          ⟨325229⟩
    v790 = 0                                                                                          ⟨325230⟩
    v33 = 0                                                                                           ⟨325253⟩
    v32 = 0                                                                                           ⟨325254⟩
    retour                                                                                            ⟨325291⟩

──── scène5 ────
scène5 = Scene_Create(cadence=9, palette=255, surface=&v412)                                          ⟨325301⟩
c12 = Layer(ressource=midgames 42, x=0, y=-30)                                                        ⟨325308⟩
c13 = TalkingHead(ressource=convdata type 0 "tex", x=163, y=128)                                      ⟨325316⟩
tête_image_de_base(tête=c13, image=25)                                                                ⟨325321⟩
ajoute c12 à scène5                                                                                   ⟨325326⟩
ajoute c13 à scène5                                                                                   ⟨325331⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨325340⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨325349⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨325361⟩
si v10 != 0 :
    Scene_Tick(scène=scène5)                                                                          ⟨325371⟩
    charge(mid34voc 6)                                                                                ⟨325383⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 6)                                 ⟨325389⟩
    di = 0                                                                                            ⟨325391⟩
    tant que di < 4 :
        Scene_Tick(scène=scène5)                                                                      ⟨325398⟩
        di = di + 1                                                                                   ⟨325400⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨325408⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène5)                                                                      ⟨325426⟩
    di = 0                                                                                            ⟨325438⟩
    tant que di < 8 :
        Scene_Tick(scène=scène5)                                                                      ⟨325445⟩
        di = di + 1                                                                                   ⟨325447⟩
    voix_arrête(voix=voix1)                                                                           ⟨325454⟩
    v278 = 0                                                                                          ⟨325472⟩
    v272 = 0                                                                                          ⟨325474⟩
sinon :
    v2924→0.méthode8(224)                                                                             ⟨325483⟩
    v4 = 80                                                                                           ⟨325485⟩
    si = scène5.compteur                                                                              ⟨325486⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨325495⟩
    tant que (scène5.compteur < v2) et (scène5.terminée == 0) :
        di = scène5.compteur                                                                          ⟨325500⟩
        si si + 3 == scène5.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])                              ⟨325513⟩
        si v2 - 1 == scène5.compteur :
            v2990 = 4540                                                                              ⟨325521⟩
            v2990 = 4552                                                                              ⟨325522⟩
            v2990 = 4568                                                                              ⟨325523⟩
            v2990 = 4584                                                                              ⟨325524⟩
            v2990 = 4604                                                                              ⟨325525⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨325535⟩
        Scene_Tick(scène=scène5)                                                                      ⟨325567⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨325597⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨325630⟩
    v235 = 0                                                                                          ⟨325631⟩
    v234 = 0                                                                                          ⟨325632⟩
    v225 = 0                                                                                          ⟨325650⟩
    v224 = 0                                                                                          ⟨325651⟩
    v215 = 0                                                                                          ⟨325669⟩
    v214 = 0                                                                                          ⟨325670⟩
    v205 = 0                                                                                          ⟨325688⟩
    v204 = 0                                                                                          ⟨325689⟩
    v195 = 0                                                                                          ⟨325707⟩
    v194 = 0                                                                                          ⟨325708⟩
    v185 = 0                                                                                          ⟨325726⟩
    v184 = 0                                                                                          ⟨325727⟩
    v175 = 0                                                                                          ⟨325745⟩
    v174 = 0                                                                                          ⟨325746⟩
    v165 = 0                                                                                          ⟨325764⟩
    v164 = 0                                                                                          ⟨325765⟩
    v155 = 0                                                                                          ⟨325783⟩
    v154 = 0                                                                                          ⟨325784⟩
    v145 = 0                                                                                          ⟨325802⟩
    v144 = 0                                                                                          ⟨325803⟩
    v129 = 0                                                                                          ⟨325826⟩
    v128 = 0                                                                                          ⟨325827⟩
    v113 = 0                                                                                          ⟨325850⟩
    v112 = 0                                                                                          ⟨325851⟩
    v97 = 0                                                                                           ⟨325874⟩
    v96 = 0                                                                                           ⟨325875⟩
    v81 = 0                                                                                           ⟨325898⟩
    v80 = 0                                                                                           ⟨325899⟩
    v65 = 0                                                                                           ⟨325922⟩
    v64 = 0                                                                                           ⟨325923⟩
    v55 = 0                                                                                           ⟨325941⟩
    v54 = 0                                                                                           ⟨325942⟩
    v45 = 0                                                                                           ⟨325960⟩
    v44 = 0                                                                                           ⟨325961⟩
    voix_arrête(voix=voix1)                                                                           ⟨325965⟩
    v2870 = 0                                                                                         ⟨325983⟩
    v2865 = 0                                                                                         ⟨325984⟩
    v2864 = 0                                                                                         ⟨325985⟩
    canal_arrête(canal=canal2)                                                                        ⟨325988⟩
    v796 = 0                                                                                          ⟨326006⟩
    v791 = 0                                                                                          ⟨326007⟩
    v790 = 0                                                                                          ⟨326008⟩
    v33 = 0                                                                                           ⟨326031⟩
    v32 = 0                                                                                           ⟨326032⟩
    retour                                                                                            ⟨326069⟩
charge(midgames 32)                                                                                   ⟨326083⟩
charge(midgames 26)                                                                                   ⟨326095⟩

──── scène6 ────
scène6 = Scene_Create(cadence=6, palette=255, surface=&v412)                                          ⟨326103⟩
c14 = Layer(ressource=midgames 32, x=0, y=0)                                                          ⟨326110⟩
c15 = Layer(ressource=midgames 26, x=0, y=0)                                                          ⟨326118⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨326124⟩
Widget_Method_Dispatch8_314A9(zone1, 253)                                                             ⟨326129⟩
ajoute c14 à scène6                                                                                   ⟨326134⟩
ajoute c15 à scène6                                                                                   ⟨326139⟩
palette_copie(destination=pal1, source=pal6(midgames 41))                                             ⟨326148⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨326160⟩
si v10 != 0 :
    Scene_Tick(scène=scène6)                                                                          ⟨326170⟩
    charge(mid34voc 7)                                                                                ⟨326182⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 7)                                 ⟨326188⟩
    di = 0                                                                                            ⟨326190⟩
    tant que di < 8 :
        Scene_Tick(scène=scène6)                                                                      ⟨326197⟩
        di = di + 1                                                                                   ⟨326199⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨326207⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène6)                                                                      ⟨326225⟩
    v308 = 0                                                                                          ⟨326237⟩
    v304 = 2                                                                                          ⟨326238⟩
    v303 = 0                                                                                          ⟨326239⟩
    v302 = 0                                                                                          ⟨326240⟩
    di = 0                                                                                            ⟨326241⟩
    tant que di < 8 :
        Scene_Tick(scène=scène6)                                                                      ⟨326248⟩
        di = di + 1                                                                                   ⟨326250⟩
    voix_arrête(voix=voix1)                                                                           ⟨326257⟩
    v308 = 0                                                                                          ⟨326275⟩
    v303 = 0                                                                                          ⟨326276⟩
    v302 = 0                                                                                          ⟨326277⟩
sinon :
    v4 = 40                                                                                           ⟨326301⟩
    si = scène6.compteur                                                                              ⟨326302⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨326311⟩
    tant que (scène6.compteur < v2) et (scène6.terminée == 0) :
        di = scène6.compteur                                                                          ⟨326316⟩
        si si + 3 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[7])                              ⟨326329⟩
        si v2 - 1 == scène6.compteur :
            v2990 = 4540                                                                              ⟨326337⟩
            v2990 = 4552                                                                              ⟨326338⟩
            v2990 = 4568                                                                              ⟨326339⟩
            v2990 = 4584                                                                              ⟨326340⟩
            v2990 = 4604                                                                              ⟨326341⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨326351⟩
        Scene_Tick(scène=scène6)                                                                      ⟨326383⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène6, drapeaux=0)                                                      ⟨326419⟩
        v278 = 0                                                                                      ⟨326439⟩
        v268 = 0                                                                                      ⟨326458⟩
        v240 = 0                                                                                      ⟨326484⟩
        v235 = 0                                                                                      ⟨326485⟩
        v234 = 0                                                                                      ⟨326486⟩
        v225 = 0                                                                                      ⟨326504⟩
        v224 = 0                                                                                      ⟨326505⟩
        v215 = 0                                                                                      ⟨326523⟩
        v214 = 0                                                                                      ⟨326524⟩
        v205 = 0                                                                                      ⟨326542⟩
        v204 = 0                                                                                      ⟨326543⟩
        v195 = 0                                                                                      ⟨326561⟩
        v194 = 0                                                                                      ⟨326562⟩
        v185 = 0                                                                                      ⟨326580⟩
        v184 = 0                                                                                      ⟨326581⟩
        v175 = 0                                                                                      ⟨326599⟩
        v174 = 0                                                                                      ⟨326600⟩
        v165 = 0                                                                                      ⟨326618⟩
        v164 = 0                                                                                      ⟨326619⟩
        v155 = 0                                                                                      ⟨326637⟩
        v154 = 0                                                                                      ⟨326638⟩
        v145 = 0                                                                                      ⟨326656⟩
        v144 = 0                                                                                      ⟨326657⟩
        v129 = 0                                                                                      ⟨326680⟩
        v128 = 0                                                                                      ⟨326681⟩
        v113 = 0                                                                                      ⟨326704⟩
        v112 = 0                                                                                      ⟨326705⟩
        v97 = 0                                                                                       ⟨326728⟩
        v96 = 0                                                                                       ⟨326729⟩
        v81 = 0                                                                                       ⟨326752⟩
        v80 = 0                                                                                       ⟨326753⟩
        v65 = 0                                                                                       ⟨326776⟩
        v64 = 0                                                                                       ⟨326777⟩
        v55 = 0                                                                                       ⟨326795⟩
        v54 = 0                                                                                       ⟨326796⟩
        v45 = 0                                                                                       ⟨326814⟩
        v44 = 0                                                                                       ⟨326815⟩
        voix_arrête(voix=voix1)                                                                       ⟨326819⟩
        v2870 = 0                                                                                     ⟨326837⟩
        v2865 = 0                                                                                     ⟨326838⟩
        v2864 = 0                                                                                     ⟨326839⟩
        canal_arrête(canal=canal2)                                                                    ⟨326842⟩
        v796 = 0                                                                                      ⟨326860⟩
        v791 = 0                                                                                      ⟨326861⟩
        v790 = 0                                                                                      ⟨326862⟩
        v33 = 0                                                                                       ⟨326885⟩
        v32 = 0                                                                                       ⟨326886⟩
        retour                                                                                        ⟨326923⟩
    v4 = 82                                                                                           ⟨326927⟩
    si = scène6.compteur                                                                              ⟨326928⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨326937⟩
    tant que (scène6.compteur < v2) et (scène6.terminée == 0) :
        di = scène6.compteur                                                                          ⟨326942⟩
        si si + 1 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])                              ⟨326954⟩
        si v2 - 1 == scène6.compteur :
            v2990 = 4540                                                                              ⟨326962⟩
            v2990 = 4552                                                                              ⟨326963⟩
            v2990 = 4568                                                                              ⟨326964⟩
            v2990 = 4584                                                                              ⟨326965⟩
            v2990 = 4604                                                                              ⟨326966⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨326976⟩
        Scene_Tick(scène=scène6)                                                                      ⟨327008⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨327038⟩
v278 = 0                                                                                              ⟨327058⟩
v268 = 0                                                                                              ⟨327077⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨327109⟩
    v235 = 0                                                                                          ⟨327110⟩
    v234 = 0                                                                                          ⟨327111⟩
    v225 = 0                                                                                          ⟨327129⟩
    v224 = 0                                                                                          ⟨327130⟩
    v215 = 0                                                                                          ⟨327148⟩
    v214 = 0                                                                                          ⟨327149⟩
    v205 = 0                                                                                          ⟨327167⟩
    v204 = 0                                                                                          ⟨327168⟩
    v195 = 0                                                                                          ⟨327186⟩
    v194 = 0                                                                                          ⟨327187⟩
    v185 = 0                                                                                          ⟨327205⟩
    v184 = 0                                                                                          ⟨327206⟩
    v175 = 0                                                                                          ⟨327224⟩
    v174 = 0                                                                                          ⟨327225⟩
    v165 = 0                                                                                          ⟨327243⟩
    v164 = 0                                                                                          ⟨327244⟩
    v155 = 0                                                                                          ⟨327262⟩
    v154 = 0                                                                                          ⟨327263⟩
    v145 = 0                                                                                          ⟨327281⟩
    v144 = 0                                                                                          ⟨327282⟩
    v129 = 0                                                                                          ⟨327305⟩
    v128 = 0                                                                                          ⟨327306⟩
    v113 = 0                                                                                          ⟨327329⟩
    v112 = 0                                                                                          ⟨327330⟩
    v97 = 0                                                                                           ⟨327353⟩
    v96 = 0                                                                                           ⟨327354⟩
    v81 = 0                                                                                           ⟨327377⟩
    v80 = 0                                                                                           ⟨327378⟩
    v65 = 0                                                                                           ⟨327401⟩
    v64 = 0                                                                                           ⟨327402⟩
    v55 = 0                                                                                           ⟨327420⟩
    v54 = 0                                                                                           ⟨327421⟩
    v45 = 0                                                                                           ⟨327439⟩
    v44 = 0                                                                                           ⟨327440⟩
    voix_arrête(voix=voix1)                                                                           ⟨327444⟩
    v2870 = 0                                                                                         ⟨327462⟩
    v2865 = 0                                                                                         ⟨327463⟩
    v2864 = 0                                                                                         ⟨327464⟩
    canal_arrête(canal=canal2)                                                                        ⟨327467⟩
    v796 = 0                                                                                          ⟨327485⟩
    v791 = 0                                                                                          ⟨327486⟩
    v790 = 0                                                                                          ⟨327487⟩
    v33 = 0                                                                                           ⟨327510⟩
    v32 = 0                                                                                           ⟨327511⟩
    retour                                                                                            ⟨327548⟩

──── scène7 ────
scène7 = Scene_Create(cadence=15, palette=255, surface=&v412)                                         ⟨327558⟩
c16 = Layer(ressource=midgames 42, x=0, y=-80)                                                        ⟨327565⟩
c17 = Layer(ressource=midgames 33, x=0, y=0)                                                          ⟨327573⟩
c18 = Layer(ressource=midgames 34, x=0, y=0)                                                          ⟨327581⟩
c19 = Layer(ressource=midgames 35, x=0, y=0)                                                          ⟨327589⟩
c20 = Layer(ressource=midgames 29, x=0, y=-24)                                                        ⟨327597⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨327607⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨327616⟩
ajoute c16 à scène7                                                                                   ⟨327621⟩
ajoute c20 à scène7                                                                                   ⟨327626⟩
ajoute c17 à scène7                                                                                   ⟨327631⟩
ajoute c18 à scène7                                                                                   ⟨327636⟩
ajoute c19 à scène7                                                                                   ⟨327641⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨327653⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨327658⟩
Widget_Method_Dispatch8_314A9(zone1, 233)                                                             ⟨327663⟩
v276 = 0                                                                                              ⟨327665⟩
v278 = 0                                                                                              ⟨327666⟩
v280 = 1                                                                                              ⟨327667⟩
v2 = 145                                                                                              ⟨327670⟩
si v11 != 0 :
    charge(asoundfx 76)                                                                               ⟨327693⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨327698⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 76, x=0)                                        ⟨327705⟩
    v296 = word_48F3A                                                                                 ⟨327708⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v2990)                                        ⟨327715⟩
        AIL_set_relative_volume_30C66(canal3.+0→4, v2990, v296, mid34voc 7.+0)                        ⟨327722⟩
si v10 != 0 :
    Scene_Tick(scène=scène7)                                                                          ⟨327736⟩
    charge(mid34voc 8)                                                                                ⟨327744⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 8)                                 ⟨327750⟩
tant que (scène7.compteur < v2) et (scène7.terminée == 0) :
    di = scène7.compteur                                                                              ⟨327758⟩
    si scène7.compteur > 50 :
        si scène7.compteur < 140 :
            v310 = v280                                                                               ⟨327764⟩
            v280_avant = v280                                                                         ⟨327765⟩
            v280 = v280 + 1                                                                           ⟨327765⟩
            c20.image = v310                                                                          ⟨327768⟩
    si scène7.compteur == 110 :
        Scene_SetFps(scène=scène7, cadence=9)                                                         ⟨327777⟩
    si scène7.compteur == 140 :
        retire(parent=scène7, calque=c20)                                                             ⟨327786⟩
        c20.détruit(3)                                                                                ⟨327794⟩
    si mid34voc 0.+0 + 6 == scène7.compteur :
        si v10 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨327809⟩
    si mid34voc 0.+0 + 6 == scène7.compteur :
        si v10 == 0 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[9])                              ⟨327830⟩
    si mid34voc 0.+0 + 5 < scène7.compteur :
        si mid34voc 0.+0 + 10 > scène7.compteur :
            v312 = v276                                                                               ⟨327844⟩
            v276_avant = v276                                                                         ⟨327845⟩
            v276 = v276 + 1                                                                           ⟨327845⟩
            c18.image = v312                                                                          ⟨327848⟩
    si mid34voc 0.+0 + 13 < scène7.compteur :
        si mid34voc 0.+0 + 18 > scène7.compteur :
            v314 = v278                                                                               ⟨327861⟩
            v278_avant = v278                                                                         ⟨327862⟩
            v278 = v278 + 1                                                                           ⟨327862⟩
            c19.image = v314                                                                          ⟨327865⟩
    si midgames 26.+0 + 27 == scène7.compteur :
        si v10 == 0 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[10])                             ⟨327885⟩
    si midgames 26.+0 + 25 < scène7.compteur :
        si midgames 26.+0 + 30 > scène7.compteur :
            v276 = v276 - 1                                                                           ⟨327898⟩
            v316 = v276                                                                               ⟨327900⟩
            c18.image = v316                                                                          ⟨327903⟩
    si midgames 26.+0 + 32 < scène7.compteur :
        si midgames 26.+0 + 41 > scène7.compteur :
            si scène7.compteur & 1 != 0 :
                v278 = v278 - 1                                                                       ⟨327917⟩
                v318 = v278                                                                           ⟨327919⟩
                c19.image = v318                                                                      ⟨327922⟩
    si midgames 26.+0 + 60 == scène7.compteur :
        si v10 == 0 :
            v3004 = 4540                                                                              ⟨327934⟩
            v3004 = 4552                                                                              ⟨327935⟩
            v3004 = 4568                                                                              ⟨327936⟩
            v3004 = 4584                                                                              ⟨327937⟩
            v3004 = 4604                                                                              ⟨327938⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3004, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨327948⟩
    Scene_Tick(scène=scène7)                                                                          ⟨327987⟩
si v10 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨328018⟩
fondu_disparition(palette=pal1, couleur=&v28, pas=2, premier=0, nombre=256)                           ⟨328029⟩
v303 = 0                                                                                              ⟨328048⟩
v302 = 0                                                                                              ⟨328049⟩
canal_arrête(canal=canal3)                                                                            ⟨328052⟩
v2988 = 0                                                                                             ⟨328070⟩
v2983 = 0                                                                                             ⟨328071⟩
v2982 = 0                                                                                             ⟨328072⟩
v289 = 0                                                                                              ⟨328090⟩
Scene_Destruct(scène=scène7, drapeaux=0)                                                              ⟨328095⟩
v240 = 0                                                                                              ⟨328122⟩
v235 = 0                                                                                              ⟨328123⟩
v234 = 0                                                                                              ⟨328124⟩
v225 = 0                                                                                              ⟨328142⟩
v224 = 0                                                                                              ⟨328143⟩
v215 = 0                                                                                              ⟨328161⟩
v214 = 0                                                                                              ⟨328162⟩
v205 = 0                                                                                              ⟨328180⟩
v204 = 0                                                                                              ⟨328181⟩
v195 = 0                                                                                              ⟨328199⟩
v194 = 0                                                                                              ⟨328200⟩
v185 = 0                                                                                              ⟨328218⟩
v184 = 0                                                                                              ⟨328219⟩
v175 = 0                                                                                              ⟨328237⟩
v174 = 0                                                                                              ⟨328238⟩
v165 = 0                                                                                              ⟨328256⟩
v164 = 0                                                                                              ⟨328257⟩
v155 = 0                                                                                              ⟨328275⟩
v154 = 0                                                                                              ⟨328276⟩
v145 = 0                                                                                              ⟨328294⟩
v144 = 0                                                                                              ⟨328295⟩
v129 = 0                                                                                              ⟨328318⟩
v128 = 0                                                                                              ⟨328319⟩
v113 = 0                                                                                              ⟨328342⟩
v112 = 0                                                                                              ⟨328343⟩
v97 = 0                                                                                               ⟨328366⟩
v96 = 0                                                                                               ⟨328367⟩
v81 = 0                                                                                               ⟨328390⟩
v80 = 0                                                                                               ⟨328391⟩
v65 = 0                                                                                               ⟨328414⟩
v64 = 0                                                                                               ⟨328415⟩
v55 = 0                                                                                               ⟨328433⟩
v54 = 0                                                                                               ⟨328434⟩
v45 = 0                                                                                               ⟨328452⟩
v44 = 0                                                                                               ⟨328453⟩
voix_arrête(voix=voix1)                                                                               ⟨328457⟩
v2870 = 0                                                                                             ⟨328475⟩
v2865 = 0                                                                                             ⟨328476⟩
v2864 = 0                                                                                             ⟨328477⟩
canal_arrête(canal=canal2)                                                                            ⟨328480⟩
v796 = 0                                                                                              ⟨328498⟩
v791 = 0                                                                                              ⟨328499⟩
v790 = 0                                                                                              ⟨328500⟩
v33 = 0                                                                                               ⟨328523⟩
v32 = 0                                                                                               ⟨328524⟩
retour                                                                                                ⟨328561⟩
```

## Tableaux du segment de données

