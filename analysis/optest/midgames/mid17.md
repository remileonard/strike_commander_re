# Script extrait de `sub_98210` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## sub_98210

```
bp = sp                                                                                               ⟨285431⟩
byte_495FC = 0                                                                                        ⟨285436⟩
tableau_textes(tableau=textes1, nombre=10, longueur=200)                                              ⟨285442⟩
v11 = 0                                                                                               ⟨285444⟩
v12 = 0                                                                                               ⟨285445⟩
v13 = 0                                                                                               ⟨285446⟩
si word_4684B != 0 :
    v12 = 1                                                                                           ⟨285449⟩
v16 = word_46F46                                                                                      ⟨285453⟩
v470 = 0                                                                                              ⟨285454⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v470, v16)                                                      ⟨285459⟩
v484 = 0                                                                                              ⟨285461⟩
TextRenderer_ApplyFormatChange_2EA21(&v484, 0)                                                        ⟨285470⟩
SmallObject_RegisterInList_2CB40(&v20, &v484)                                                         ⟨285476⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨285482⟩
v30 = 0                                                                                               ⟨285488⟩
si v12 != 0 :
    si sub_6734(chemin1) != 0 :
        pak mid17voc.ouvre(chemin1, 1)                                                                ⟨285588⟩
    sinon :
        v12 = 0                                                                                       ⟨285595⟩
sinon :
    v12 = 0                                                                                           ⟨285595⟩
v40 = 0                                                                                               ⟨285598⟩
v35 = 0                                                                                               ⟨285600⟩
v34 = 0                                                                                               ⟨285601⟩
v42 = byte_46848                                                                                      ⟨285603⟩
si v42 != 1 :
    si v42 == 2 : aller à loc_985A5                                                                   ⟨285613⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨285649⟩
        flux_iff(flux=flux1)                                                                          ⟨285663⟩
        v3433 = 256                                                                                   ⟨285666⟩
        v3437 = 0                                                                                     ⟨285667⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨285675⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨285681⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨285687⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨285691⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨285693⟩
        si = 1                                                                                        ⟨285694⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨285701⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨285705⟩
            si = si + 1                                                                               ⟨285706⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨285713⟩
        v13 = 1                                                                                       ⟨285715⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨285719⟩
    si sub_6734(chemin1) != 0 :
        v11 = 1                                                                                       ⟨285745⟩
        si v13 == 0 :
            word_48F76 = 90                                                                           ⟨285750⟩
    aller à loc_98710                                                                                 ⟨285754⟩
    loc_985A5:                                                                                        ⟨285757⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨285785⟩
        flux_iff(flux=flux1)                                                                          ⟨285799⟩
        v3433 = 256                                                                                   ⟨285802⟩
        v3437 = 0                                                                                     ⟨285803⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨285811⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨285817⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨285823⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨285827⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨285829⟩
        si = 1                                                                                        ⟨285830⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨285837⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨285841⟩
            si = si + 1                                                                               ⟨285842⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨285849⟩
        v13 = 1                                                                                       ⟨285851⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨285855⟩
    si sub_6734(chemin1) != 0 :
        v11 = 1                                                                                       ⟨285881⟩
        si v13 == 0 :
            word_48F76 = 255                                                                          ⟨285886⟩
loc_98710:                                                                                            ⟨285892⟩
v48 = word_4556E                                                                                      ⟨285895⟩
v46 = word_45570                                                                                      ⟨285897⟩
v44 = byte_45572                                                                                      ⟨285899⟩
si v13 != 0 :
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨285915⟩
    si = 0                                                                                            ⟨285917⟩
    tant que si < 5 :
        charge(asoundfx v48[si])                                                                      ⟨285934⟩
        canal_enregistre(canal=canal1, ressource=asoundfx v48[si], x=0)                               ⟨285941⟩
        canal_arrête(canal=canal1)                                                                    ⟨285945⟩
        v228 = 0                                                                                      ⟨285965⟩
        si = si + 1                                                                                   ⟨285966⟩
    canal_arrête(canal=canal1)                                                                        ⟨285977⟩
    v3372 = 0                                                                                         ⟨285995⟩
v1214 = 0                                                                                             ⟨286000⟩
v1209 = 0                                                                                             ⟨286002⟩
v1208 = 0                                                                                             ⟨286003⟩
v1218 = 0                                                                                             ⟨286004⟩
si v11 != 0 :
    si v12 != 0 :
        v225 = 14                                                                                     ⟨286017⟩
    sinon :
        v225 = 13                                                                                     ⟨286022⟩
    charge(amusic v225)                                                                               ⟨286033⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨286038⟩
    canal_enregistre(canal=canal2, ressource=amusic v225, x=0)                                        ⟨286045⟩
v1227 = booléen                                                                                       ⟨286062⟩
v1223 = booléen                                                                                       ⟨286063⟩
si v12 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨286069⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨286087⟩
    v3433 = 256                                                                                       ⟨286090⟩
    v3437 = 0                                                                                         ⟨286091⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨286099⟩
    iff_form(flux=flux1, balise='MG17', x=0)                                                          ⟨286105⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨286111⟩
    si = 0                                                                                            ⟨286113⟩
    tant que si < 10 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨286122⟩
        v226 = v3416                                                                                  ⟨286125⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·si), taille=v226)                    ⟨286136⟩
        v3429 = v3412                                                                                 ⟨286139⟩
        si = si + 1                                                                                   ⟨286140⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨286147⟩
    si CRT_Strlen(arg_10) != 0 :
        CRT_Strcat(textes1[1], arg_10)                                                                ⟨286158⟩
        CRT_Strcat(textes1[1], textes1[3])                                                            ⟨286169⟩
    sinon :
        si CRT_Strlen(arg_8) != 0 :
            CRT_Strcat(textes1[1], arg_8)                                                             ⟨286184⟩
            CRT_Strcat(textes1[1], textes1[3])                                                        ⟨286195⟩
        sinon :
            si CRT_Strlen(arg_6) != 0 :
                CRT_Strcat(textes1[1], arg_6)                                                         ⟨286210⟩
                CRT_Strcat(textes1[1], textes1[3])                                                    ⟨286221⟩
            sinon :
                CRT_Strcat(textes1[1], textes1[2])                                                    ⟨286235⟩
                CRT_Strcat(textes1[1], textes1[3])                                                    ⟨286246⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[4], arg_6)                                                                 ⟨286262⟩
        CRT_Strcat(textes1[4], 9555)                                                                  ⟨286270⟩
    sinon :
        si CRT_Strlen(arg_8) != 0 :
            CRT_Strcat(textes1[4], arg_8)                                                             ⟨286287⟩
            CRT_Strcat(textes1[4], 9555)                                                              ⟨286295⟩
        sinon :
            si CRT_Strlen(arg_10) != 0 :
                CRT_Strcat(textes1[4], arg_10)                                                        ⟨286312⟩
                CRT_Strcat(textes1[4], 9555)                                                          ⟨286320⟩
            sinon :
                CRT_Strcat(textes1[4], textes1[5])                                                    ⟨286337⟩
                CRT_Strcat(textes1[4], 9555)                                                          ⟨286345⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨286353⟩
charge(optpals 21)                                                                                    ⟨286372⟩
palette_depuis(pal2(optpals 21))                                                                      ⟨286379⟩
charge(midgames 6)                                                                                    ⟨286391⟩
palette_depuis(pal3(midgames 6))                                                                      ⟨286398⟩
charge_convdata_type2("normal")                                                                       ⟨286408⟩
palette_depuis(pal4(convdata type 2 "normal"))                                                        ⟨286415⟩
v106 = 0                                                                                              ⟨286417⟩
v102 = 2                                                                                              ⟨286418⟩
v101 = 0                                                                                              ⟨286419⟩
v100 = 0                                                                                              ⟨286420⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨286434⟩
v108 = ?                                                                                              ⟨286436⟩
v110 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                ⟨286437⟩
v106 = v110                                                                                           ⟨286439⟩
v102 = 2                                                                                              ⟨286440⟩
v101 = 1                                                                                              ⟨286441⟩
v100 = 0                                                                                              ⟨286442⟩
GlyphObject_ConstructWithBuffer_311CF(&v3328, &v106)                                                  ⟨286447⟩
v120 = word_46F46                                                                                     ⟨286454⟩
zone_texte(zone=zone1, police=&v3328)                                                                 ⟨286460⟩
v122 = 152                                                                                            ⟨286464⟩
v124 = 319                                                                                            ⟨286466⟩
v126 = 199                                                                                            ⟨286468⟩
v3337 = 0                                                                                             ⟨286470⟩
v3335 = v122                                                                                          ⟨286472⟩
v3333 = v124                                                                                          ⟨286474⟩
v3331 = v126                                                                                          ⟨286476⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨286480⟩
Widget_Method_Dispatch8_314A9(zone1, 200)                                                             ⟨286485⟩
charge(mid17 3)                                                                                       ⟨286497⟩
charge(midgames 50)                                                                                   ⟨286509⟩
charge(mid17 4)                                                                                       ⟨286521⟩
charge(midgames 9)                                                                                    ⟨286533⟩
palette_depuis(pal5(midgames 9))                                                                      ⟨286540⟩
charge(midgames 10)                                                                                   ⟨286552⟩
palette_depuis(pal6(midgames 10))                                                                     ⟨286559⟩
charge(midgames 11)                                                                                   ⟨286571⟩
palette_depuis(pal7(midgames 11))                                                                     ⟨286578⟩
charge_convdata_type2("normal")                                                                       ⟨286588⟩
palette_depuis(pal8(convdata type 2 "normal"))                                                        ⟨286595⟩
si byte_495FC != 0 :
    v209 = 0                                                                                          ⟨286625⟩
    v208 = 0                                                                                          ⟨286626⟩
    v193 = 0                                                                                          ⟨286649⟩
    v192 = 0                                                                                          ⟨286650⟩
    v177 = 0                                                                                          ⟨286673⟩
    v176 = 0                                                                                          ⟨286674⟩
    v161 = 0                                                                                          ⟨286697⟩
    v160 = 0                                                                                          ⟨286698⟩
    v151 = 0                                                                                          ⟨286716⟩
    v150 = 0                                                                                          ⟨286717⟩
    v141 = 0                                                                                          ⟨286735⟩
    v140 = 0                                                                                          ⟨286736⟩
    v131 = 0                                                                                          ⟨286754⟩
    v130 = 0                                                                                          ⟨286755⟩
    v106 = 0                                                                                          ⟨286781⟩
    v101 = 0                                                                                          ⟨286782⟩
    v100 = 0                                                                                          ⟨286783⟩
    v85 = 0                                                                                           ⟨286806⟩
    v84 = 0                                                                                           ⟨286807⟩
    v69 = 0                                                                                           ⟨286830⟩
    v68 = 0                                                                                           ⟨286831⟩
    v53 = 0                                                                                           ⟨286854⟩
    v52 = 0                                                                                           ⟨286855⟩
    voix_arrête(voix=voix1)                                                                           ⟨286859⟩
    v3288 = 0                                                                                         ⟨286877⟩
    v3283 = 0                                                                                         ⟨286878⟩
    v3282 = 0                                                                                         ⟨286879⟩
    canal_arrête(canal=canal2)                                                                        ⟨286882⟩
    v1214 = 0                                                                                         ⟨286900⟩
    v1209 = 0                                                                                         ⟨286901⟩
    v1208 = 0                                                                                         ⟨286902⟩
    v35 = 0                                                                                           ⟨286925⟩
    v34 = 0                                                                                           ⟨286926⟩
    retour                                                                                            ⟨286978⟩
si v11 != 0 :
    v222 = word_48F76                                                                                 ⟨286985⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v1216)                                        ⟨286992⟩
        AIL_set_relative_volume_30C66(canal2.+0→4, v1216, v222, 0)                                    ⟨286999⟩
v3372 = 0                                                                                             ⟨287010⟩
v3368 = 2                                                                                             ⟨287011⟩
v3374 = -1                                                                                            ⟨287015⟩
si v13 != 0 :
    charge(asoundfx 22)                                                                               ⟨287024⟩
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨287029⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 22, x=0)                                        ⟨287036⟩
charge(midgames 12)                                                                                   ⟨287050⟩
charge(midgames 13)                                                                                   ⟨287062⟩
charge(midgames 14)                                                                                   ⟨287074⟩
charge(midgames 15)                                                                                   ⟨287086⟩
charge(midgames 16)                                                                                   ⟨287098⟩
charge(midgames 17)                                                                                   ⟨287110⟩

──── scène1 ────
scène1 = Scene_Create(cadence=9, palette=255, surface=&v470)                                          ⟨287118⟩
c1 = Layer(ressource=midgames 12, x=0, y=0)                                                           ⟨287125⟩
c2 = Layer(ressource=midgames 13, x=0, y=0)                                                           ⟨287133⟩
si = c2                                                                                               ⟨287135⟩
c3 = Layer(ressource=midgames 14, x=0, y=-23)                                                         ⟨287141⟩
c4 = Layer(ressource=midgames 15, x=0, y=-23)                                                         ⟨287149⟩
c5 = Layer(ressource=midgames 16, x=0, y=-23)                                                         ⟨287157⟩
c6 = Layer(ressource=midgames 17, x=0, y=-23)                                                         ⟨287165⟩
ajoute c1 à scène1                                                                                    ⟨287171⟩
ajoute c2 à scène1                                                                                    ⟨287176⟩
ajoute c3 à scène1                                                                                    ⟨287181⟩
ajoute c4 à scène1                                                                                    ⟨287186⟩
palette_copie(destination=pal1, source=pal6(midgames 10))                                             ⟨287199⟩
palette_copie(destination=pal1, source=pal5(midgames 9))                                              ⟨287208⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨287216⟩
c2.image = 0                                                                                          ⟨287218⟩
tant que (scène1.compteur < 16) et (scène1.terminée == 0) :
    v308 = scène1.compteur                                                                            ⟨287224⟩
    si v308 == 6 :
        c2.image = 1                                                                                  ⟨287227⟩
        si v13 != 0 :
            v310 = word_48ECE                                                                         ⟨287231⟩
            v312 = 0                                                                                  ⟨287232⟩
            si canal1.+0 != 0 :
                AIL_start_sequence(pilote=canal1.+0→4, séquence=v3374)                                ⟨287238⟩
                AIL_set_relative_volume_30C66(canal1.+0→4, v3374, v310, v312)                         ⟨287245⟩
    si v308 == 8 :
        c2.image = 0                                                                                  ⟨287253⟩
        si v13 != 0 :
            si canal1.+0 != 0 :
                AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3374)                                 ⟨287261⟩
    si v308 == 10 :
        c2.image = 1                                                                                  ⟨287269⟩
        si v13 != 0 :
            v314 = word_48ECE                                                                         ⟨287273⟩
            v316 = 0                                                                                  ⟨287274⟩
            si canal1.+0 != 0 :
                AIL_start_sequence(pilote=canal1.+0→4, séquence=v3374)                                ⟨287280⟩
                AIL_set_relative_volume_30C66(canal1.+0→4, v3374, v314, v316)                         ⟨287287⟩
    si v308 == 11 :
        c2.image = 0                                                                                  ⟨287295⟩
        si v13 != 0 :
            si canal1.+0 != 0 :
                AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3374)                                 ⟨287303⟩
    si v308 == 13 :
        c2.image = 1                                                                                  ⟨287311⟩
        si v13 != 0 :
            v318 = word_48ECE                                                                         ⟨287315⟩
            v320 = 0                                                                                  ⟨287316⟩
            si canal1.+0 != 0 :
                AIL_start_sequence(pilote=canal1.+0→4, séquence=v3374)                                ⟨287322⟩
                AIL_set_relative_volume_30C66(canal1.+0→4, v3374, v318, v320)                         ⟨287329⟩
    si v308 == 15 :
        c2.image = 0                                                                                  ⟨287337⟩
        si v13 != 0 :
            si canal1.+0 != 0 :
                AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3374)                                 ⟨287345⟩
    Scene_Tick(scène=scène1)                                                                          ⟨287353⟩
scène1.compteur = 0                                                                                   ⟨287378⟩
si v12 != 0 :
    Scene_Tick(scène=scène1)                                                                          ⟨287387⟩
    charge(mid17voc 2)                                                                                ⟨287399⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid17voc 2)                                 ⟨287405⟩
    v318 = 0                                                                                          ⟨287407⟩
    tant que v318 < 4 :
        CRT_Rand()                                                                                    ⟨287412⟩
        v320 = (CRT_Rand()·2) / 32768                                                                 ⟨287418⟩
        c2.image = v320                                                                               ⟨287420⟩
        Scene_Tick(scène=scène1)                                                                      ⟨287423⟩
        v318 = v318 + 1                                                                               ⟨287425⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨287433⟩
    v318 = 0                                                                                          ⟨287435⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        CRT_Rand()                                                                                    ⟨287440⟩
        v322 = (CRT_Rand()·2) / 32768                                                                 ⟨287446⟩
        c2.image = v322                                                                               ⟨287448⟩
        si v318 == 2 :
            si v13 != 0 :
                v324 = word_48ECE                                                                     ⟨287454⟩
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3374)                            ⟨287461⟩
                    AIL_set_relative_volume_30C66(canal1.+0→4, v3374, v324, 0)                        ⟨287468⟩
        si v318 == 19 :
            retire(parent=scène1, calque=c3)                                                          ⟨287479⟩
            retire(parent=scène1, calque=c4)                                                          ⟨287484⟩
            ajoute c5 à scène1                                                                        ⟨287489⟩
            ajoute c6 à scène1                                                                        ⟨287494⟩
        v318_avant = v318                                                                             ⟨287499⟩
        v318 = v318 + 1                                                                               ⟨287499⟩
        si v318_avant == 10 :
            c5.image = 1                                                                              ⟨287503⟩
            c6.image = 1                                                                              ⟨287505⟩
        Scene_Tick(scène=scène1)                                                                      ⟨287520⟩
    si v13 != 0 :
        si canal1.+0 != 0 :
            AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3374)                                     ⟨287542⟩
    c2.image = 0                                                                                      ⟨287548⟩
    v318 = 0                                                                                          ⟨287549⟩
    tant que v318 < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨287556⟩
        v318 = v318 + 1                                                                               ⟨287558⟩
    charge(mid17voc 0)                                                                                ⟨287573⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid17voc 0)                                 ⟨287579⟩
    v318 = 0                                                                                          ⟨287581⟩
    tant que v318 < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨287588⟩
        v318 = v318 + 1                                                                               ⟨287590⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨287598⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        CRT_Rand()                                                                                    ⟨287604⟩
        v338 = ((CRT_Rand()·2) / 32768) + 1                                                           ⟨287611⟩
        c6.image = v338                                                                               ⟨287614⟩
        Scene_Tick(scène=scène1)                                                                      ⟨287627⟩
    v318 = 0                                                                                          ⟨287639⟩
    tant que v318 < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨287646⟩
        v318 = v318 + 1                                                                               ⟨287648⟩
    voix_arrête(voix=voix1)                                                                           ⟨287655⟩
    v330 = 0                                                                                          ⟨287675⟩
    v310 = 0                                                                                          ⟨287694⟩
sinon :
    v3342→0.méthode8(35)                                                                              ⟨287703⟩
    v6 = 62                                                                                           ⟨287705⟩
    v4 = scène1.compteur                                                                              ⟨287707⟩
    tant que (scène1.compteur < v4 + ((v6·70) / 100)) et (scène1.terminée == 0) :
        v308 = scène1.compteur                                                                        ⟨287722⟩
        si v4 + 10 == v308 :
            si v13 != 0 :
                v310 = word_48ECE                                                                     ⟨287730⟩
                v312 = 0                                                                              ⟨287731⟩
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3374)                            ⟨287737⟩
                    AIL_set_relative_volume_30C66(canal1.+0→4, v3374, v310, v312)                     ⟨287744⟩
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[0])                              ⟨287753⟩
            c2.image = 1                                                                              ⟨287755⟩
        si v4 + 14 == v308 :
            retire(parent=scène1, calque=c3)                                                          ⟨287765⟩
            retire(parent=scène1, calque=c4)                                                          ⟨287770⟩
            ajoute c5 à scène1                                                                        ⟨287775⟩
            ajoute c6 à scène1                                                                        ⟨287780⟩
        si v4 + 15 == v308 :
            c5.image = 1                                                                              ⟨287789⟩
            c6.image = 1                                                                              ⟨287791⟩
        si (v4 + ((v6·70) / 100)) - 3 < v308 :
            c2.image = 0                                                                              ⟨287798⟩
        si (v4 + ((v6·70) / 100)) - 1 == v308 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3374)                             ⟨287812⟩
        si (v4 + ((v6·70) / 100)) - 1 == v308 :
            v3422 = 4540                                                                              ⟨287822⟩
            v3422 = 4552                                                                              ⟨287823⟩
            v3422 = 4568                                                                              ⟨287824⟩
            v3422 = 4584                                                                              ⟨287825⟩
            v3422 = 4604                                                                              ⟨287826⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3422, v3337, v3335, v3333, v3331, 0, &v3360)        ⟨287836⟩
        Scene_Tick(scène=scène1)                                                                      ⟨287868⟩
    c3.détruit(3)                                                                                     ⟨287900⟩
    c4.détruit(3)                                                                                     ⟨287911⟩
    c2.image = 1                                                                                      ⟨287916⟩
    v6_avant = v4 + ((v6·70) / 100)                                                                   ⟨287917⟩
    v6 = 66                                                                                           ⟨287917⟩
    v4 = scène1.compteur                                                                              ⟨287919⟩
    tant que (scène1.compteur < v4 + ((v6·70) / 100)) et (scène1.terminée == 0) :
        v308 = scène1.compteur                                                                        ⟨287934⟩
        si v4 + 1 == v308 :
            si v13 != 0 :
                v310 = word_48ECE                                                                     ⟨287942⟩
                v312 = 0                                                                              ⟨287943⟩
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3374)                            ⟨287949⟩
                    AIL_set_relative_volume_30C66(canal1.+0→4, v3374, v310, v312)                     ⟨287956⟩
        si v4 + 2 == v308 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[1])                              ⟨287971⟩
        si (v4 + ((v6·70) / 100)) - 3 < v308 :
            c2.image = 0                                                                              ⟨287979⟩
        si (v4 + ((v6·70) / 100)) - 2 == v308 :
            v3422 = 4540                                                                              ⟨287986⟩
            v3422 = 4552                                                                              ⟨287987⟩
            v3422 = 4568                                                                              ⟨287988⟩
            v3422 = 4584                                                                              ⟨287989⟩
            v3422 = 4604                                                                              ⟨287990⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3422, v3337, v3335, v3333, v3331, 0, &v3360)        ⟨288000⟩
        si (v4 + ((v6·70) / 100)) - 1 == v308 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3374)                             ⟨288015⟩
        Scene_Tick(scène=scène1)                                                                      ⟨288049⟩
    v3342→0.méthode8(15)                                                                              ⟨288079⟩
    v6_avant = v4 + ((v6·70) / 100)                                                                   ⟨288081⟩
    v6 = 35                                                                                           ⟨288081⟩
    v4 = scène1.compteur                                                                              ⟨288083⟩
    tant que (scène1.compteur < v4 + ((v6·70) / 100)) et (scène1.terminée == 0) :
        v308 = scène1.compteur                                                                        ⟨288098⟩
        si v4 + 6 < v308 :
            CRT_Rand()                                                                                ⟨288103⟩
            v310 = ((CRT_Rand()·2) / 32768) + 1                                                       ⟨288110⟩
            c6.image = v310                                                                           ⟨288113⟩
        si v4 + 6 == v308 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[4])                              ⟨288127⟩
        si (v4 + ((v6·70) / 100)) - 1 == v308 :
            v3422 = 4540                                                                              ⟨288135⟩
            v3422 = 4552                                                                              ⟨288136⟩
            v3422 = 4568                                                                              ⟨288137⟩
            v3422 = 4584                                                                              ⟨288138⟩
            v3422 = 4604                                                                              ⟨288139⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3422, v3337, v3335, v3333, v3331, 0, &v3360)        ⟨288149⟩
        si (v4 + ((v6·70) / 100)) - 6 < v308 :
            c6.image = 1                                                                              ⟨288158⟩
        Scene_Tick(scène=scène1)                                                                      ⟨288189⟩
    v6_avant = v4 + ((v6·70) / 100)                                                                   ⟨288215⟩
    v6 = 38                                                                                           ⟨288215⟩
    v4 = scène1.compteur                                                                              ⟨288217⟩
    tant que (scène1.compteur < v4 + ((v6·70) / 100)) et (scène1.terminée == 0) :
        v308 = scène1.compteur                                                                        ⟨288232⟩
        si v4 + 6 < v308 :
            CRT_Rand()                                                                                ⟨288237⟩
            v310 = ((CRT_Rand()·2) / 32768) + 1                                                       ⟨288244⟩
            c6.image = v310                                                                           ⟨288247⟩
        si v4 + 6 == v308 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])                              ⟨288262⟩
        si (v4 + ((v6·70) / 100)) - 6 < v308 :
            c6.image = 1                                                                              ⟨288271⟩
        si (v4 + ((v6·70) / 100)) - 2 == v308 :
            v3422 = 4540                                                                              ⟨288278⟩
            v3422 = 4552                                                                              ⟨288279⟩
            v3422 = 4568                                                                              ⟨288280⟩
            v3422 = 4584                                                                              ⟨288281⟩
            v3422 = 4604                                                                              ⟨288282⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3422, v3337, v3335, v3333, v3331, 0, &v3360)        ⟨288292⟩
        Scene_Tick(scène=scène1)                                                                      ⟨288324⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨288353⟩
v291 = 0                                                                                              ⟨288372⟩
v290 = 0                                                                                              ⟨288373⟩
v280 = 0                                                                                              ⟨288392⟩
v270 = 0                                                                                              ⟨288411⟩
v266 = 0                                                                                              ⟨288428⟩
v246 = 0                                                                                              ⟨288466⟩
canal_arrête(canal=canal1)                                                                            ⟨288471⟩
v3372 = 0                                                                                             ⟨288489⟩
v231 = 0                                                                                              ⟨288509⟩
v230 = 0                                                                                              ⟨288510⟩
si byte_495FC != 0 :
    v209 = 0                                                                                          ⟨288539⟩
    v208 = 0                                                                                          ⟨288540⟩
    v193 = 0                                                                                          ⟨288563⟩
    v192 = 0                                                                                          ⟨288564⟩
    v177 = 0                                                                                          ⟨288587⟩
    v176 = 0                                                                                          ⟨288588⟩
    v161 = 0                                                                                          ⟨288611⟩
    v160 = 0                                                                                          ⟨288612⟩
    v151 = 0                                                                                          ⟨288630⟩
    v150 = 0                                                                                          ⟨288631⟩
    v141 = 0                                                                                          ⟨288649⟩
    v140 = 0                                                                                          ⟨288650⟩
    v131 = 0                                                                                          ⟨288668⟩
    v130 = 0                                                                                          ⟨288669⟩
    v106 = 0                                                                                          ⟨288695⟩
    v101 = 0                                                                                          ⟨288696⟩
    v100 = 0                                                                                          ⟨288697⟩
    v85 = 0                                                                                           ⟨288720⟩
    v84 = 0                                                                                           ⟨288721⟩
    v69 = 0                                                                                           ⟨288744⟩
    v68 = 0                                                                                           ⟨288745⟩
    v53 = 0                                                                                           ⟨288768⟩
    v52 = 0                                                                                           ⟨288769⟩
    voix_arrête(voix=voix1)                                                                           ⟨288773⟩
    v3288 = 0                                                                                         ⟨288791⟩
    v3283 = 0                                                                                         ⟨288792⟩
    v3282 = 0                                                                                         ⟨288793⟩
    canal_arrête(canal=canal2)                                                                        ⟨288796⟩
    v1214 = 0                                                                                         ⟨288814⟩
    v1209 = 0                                                                                         ⟨288815⟩
    v1208 = 0                                                                                         ⟨288816⟩
    v35 = 0                                                                                           ⟨288839⟩
    v34 = 0                                                                                           ⟨288840⟩
    retour                                                                                            ⟨288892⟩
v3372 = 0                                                                                             ⟨288900⟩
v3368 = 2                                                                                             ⟨288901⟩
v3374 = -1                                                                                            ⟨288905⟩
si v13 != 0 :
    charge(asoundfx 22)                                                                               ⟨288914⟩
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨288919⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 22, x=0)                                        ⟨288926⟩
charge(midgames 18)                                                                                   ⟨288940⟩

──── scène2 ────
scène2 = Scene_Create(cadence=20, palette=255, surface=&v470)                                         ⟨288948⟩
c7 = OverlayImageLayer(ressource=midgames 18, x=0, y=0, image=0)                                      ⟨288956⟩
si = c7                                                                                               ⟨288958⟩
ajoute c7 à scène2                                                                                    ⟨288962⟩
palette_copie(destination=pal1, source=pal7(midgames 11))                                             ⟨288975⟩
palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))                                ⟨288984⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨288992⟩
v3342→0.méthode8(224)                                                                                 ⟨288998⟩
c7.image = 0                                                                                          ⟨289000⟩
v246 = 0                                                                                              ⟨289001⟩
CRT_Time_85A(0)                                                                                       ⟨289003⟩
CRT_Srand_6F2(CRT_Time_85A(0))                                                                        ⟨289006⟩
v248 = 4                                                                                              ⟨289008⟩
si v12 != 0 :
    Scene_Tick(scène=scène2)                                                                          ⟨289017⟩
    charge(mid17voc 3)                                                                                ⟨289029⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid17voc 3)                                 ⟨289035⟩
    v260 = 0                                                                                          ⟨289037⟩
    tant que v260 < 4 :
        CRT_Rand()                                                                                    ⟨289042⟩
        v262 = ((CRT_Rand()·6) / 32768) + 3                                                           ⟨289049⟩
        c7.image = v262                                                                               ⟨289051⟩
        Scene_Tick(scène=scène2)                                                                      ⟨289054⟩
        v260 = v260 + 1                                                                               ⟨289056⟩
    si v13 != 0 :
        v264 = word_48EC2                                                                             ⟨289064⟩
        v266 = 0                                                                                      ⟨289065⟩
        si canal1.+0 != 0 :
            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3374)                                    ⟨289071⟩
            AIL_set_relative_volume_30C66(canal1.+0→4, v3374, v264, v266)                             ⟨289078⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨289087⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        CRT_Rand()                                                                                    ⟨289093⟩
        v268 = ((CRT_Rand()·6) / 32768) + 3                                                           ⟨289100⟩
        c7.image = v268                                                                               ⟨289102⟩
        Scene_Tick(scène=scène2)                                                                      ⟨289115⟩
    si v13 != 0 :
        si canal1.+0 != 0 :
            AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3374)                                     ⟨289134⟩
    v260 = 0                                                                                          ⟨289140⟩
    tant que v260 < 5 :
        si v248 < 1 :
            v248 = 1                                                                                  ⟨289147⟩
        v270 = v248                                                                                   ⟨289151⟩
        v248_avant = v248                                                                             ⟨289152⟩
        v248 = v248 - 1                                                                               ⟨289152⟩
        c7.image = v270                                                                               ⟨289154⟩
        Scene_Tick(scène=scène2)                                                                      ⟨289157⟩
        v260 = v260 + 1                                                                               ⟨289159⟩
    voix_arrête(voix=voix1)                                                                           ⟨289166⟩
    v252 = 0                                                                                          ⟨289186⟩
sinon :
    v6 = 70                                                                                           ⟨289191⟩
    v4 = scène2.compteur                                                                              ⟨289193⟩
    tant que (scène2.compteur < v4 + ((v6·70) / 100)) et (scène2.terminée == 0) :
        v250 = scène2.compteur                                                                        ⟨289208⟩
        si (v4 + ((v6·70) / 100)) - 10 > v250 :
            CRT_Rand()                                                                                ⟨289213⟩
            v246 = ((CRT_Rand()·6) / 32768) + 3                                                       ⟨289220⟩
            v252 = v246                                                                               ⟨289222⟩
            c7.image = v252                                                                           ⟨289224⟩
        sinon :
            v246 = v246 - 1                                                                           ⟨289229⟩
            si v246 < 1 :
                v246_avant = v246                                                                     ⟨289233⟩
                v246 = 1                                                                              ⟨289233⟩
            v254 = v246                                                                               ⟨289237⟩
            c7.image = v254                                                                           ⟨289239⟩
        si v4 + 1 == v250 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3374)                            ⟨289256⟩
                    AIL_set_relative_volume_30C66(canal1.+0→4, v3374, word_48ECE, mid17voc 3.+0)      ⟨289263⟩
        si v4 + 2 == v250 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[7])                              ⟨289281⟩
        si (v4 + ((v6·70) / 100)) - 2 == v250 :
            v3422 = 4540                                                                              ⟨289289⟩
            v3422 = 4552                                                                              ⟨289290⟩
            v3422 = 4568                                                                              ⟨289291⟩
            v3422 = 4584                                                                              ⟨289292⟩
            v3422 = 4604                                                                              ⟨289293⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3422, v3337, v3335, v3333, v3331, 0, &v3360)        ⟨289303⟩
        si (v4 + ((v6·70) / 100)) - 1 == v250 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3374)                             ⟨289318⟩
        Scene_Tick(scène=scène2)                                                                      ⟨289352⟩
    v6_avant = v4 + ((v6·70) / 100)                                                                   ⟨289378⟩
    v6 = 82                                                                                           ⟨289378⟩
    v4 = scène2.compteur                                                                              ⟨289380⟩
    tant que (scène2.compteur < v4 + ((v6·70) / 100)) et (scène2.terminée == 0) :
        v250 = scène2.compteur                                                                        ⟨289395⟩
        si (v4 + ((v6·70) / 100)) - 10 > v250 :
            CRT_Rand()                                                                                ⟨289400⟩
            v246 = ((CRT_Rand()·6) / 32768) + 3                                                       ⟨289407⟩
            v252 = v246                                                                               ⟨289409⟩
            c7.image = v252                                                                           ⟨289411⟩
        sinon :
            v246 = v246 - 1                                                                           ⟨289416⟩
            si v246 < 1 :
                v246_avant = v246                                                                     ⟨289420⟩
                v246 = 1                                                                              ⟨289420⟩
            v254 = v246                                                                               ⟨289424⟩
            c7.image = v254                                                                           ⟨289426⟩
        si v4 + 1 == v250 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3374)                            ⟨289443⟩
                    AIL_set_relative_volume_30C66(canal1.+0→4, v3374, word_48ECE, mid17voc 3.+0)      ⟨289450⟩
        si v4 + 2 == v250 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])                              ⟨289467⟩
        si (v4 + ((v6·70) / 100)) - 2 == v250 :
            v3422 = 4540                                                                              ⟨289475⟩
            v3422 = 4552                                                                              ⟨289476⟩
            v3422 = 4568                                                                              ⟨289477⟩
            v3422 = 4584                                                                              ⟨289478⟩
            v3422 = 4604                                                                              ⟨289479⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3422, v3337, v3335, v3333, v3331, 0, &v3360)        ⟨289489⟩
        si (v4 + ((v6·70) / 100)) - 1 == v250 :
            si v13 != 0 :
                si canal1.+0 != 0 :
                    AIL_stop_sequence(pilote=canal1.+0→4, séquence=v3374)                             ⟨289504⟩
        Scene_Tick(scène=scène2)                                                                      ⟨289538⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=1, premier=0, nombre=256)                           ⟨289571⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨289576⟩
v239 = 0                                                                                              ⟨289595⟩
canal_arrête(canal=canal1)                                                                            ⟨289599⟩
v3372 = 0                                                                                             ⟨289617⟩
v228 = 0                                                                                              ⟨289638⟩
si byte_495FC != 0 :
    v209 = 0                                                                                          ⟨289667⟩
    v208 = 0                                                                                          ⟨289668⟩
    v193 = 0                                                                                          ⟨289691⟩
    v192 = 0                                                                                          ⟨289692⟩
    v177 = 0                                                                                          ⟨289715⟩
    v176 = 0                                                                                          ⟨289716⟩
    v161 = 0                                                                                          ⟨289739⟩
    v160 = 0                                                                                          ⟨289740⟩
    v151 = 0                                                                                          ⟨289758⟩
    v150 = 0                                                                                          ⟨289759⟩
    v141 = 0                                                                                          ⟨289777⟩
    v140 = 0                                                                                          ⟨289778⟩
    v131 = 0                                                                                          ⟨289796⟩
    v130 = 0                                                                                          ⟨289797⟩
    v106 = 0                                                                                          ⟨289823⟩
    v101 = 0                                                                                          ⟨289824⟩
    v100 = 0                                                                                          ⟨289825⟩
    v85 = 0                                                                                           ⟨289848⟩
    v84 = 0                                                                                           ⟨289849⟩
    v69 = 0                                                                                           ⟨289872⟩
    v68 = 0                                                                                           ⟨289873⟩
    v53 = 0                                                                                           ⟨289896⟩
    v52 = 0                                                                                           ⟨289897⟩
    voix_arrête(voix=voix1)                                                                           ⟨289901⟩
    v3288 = 0                                                                                         ⟨289919⟩
    v3283 = 0                                                                                         ⟨289920⟩
    v3282 = 0                                                                                         ⟨289921⟩
    canal_arrête(canal=canal2)                                                                        ⟨289924⟩
    v1214 = 0                                                                                         ⟨289942⟩
    v1209 = 0                                                                                         ⟨289943⟩
    v1208 = 0                                                                                         ⟨289944⟩
    v35 = 0                                                                                           ⟨289967⟩
    v34 = 0                                                                                           ⟨289968⟩
    retour                                                                                            ⟨290020⟩
v228 = 0                                                                                              ⟨290027⟩
v3372 = 0                                                                                             ⟨290028⟩
v3368 = 2                                                                                             ⟨290029⟩
v3374 = -1                                                                                            ⟨290033⟩
si v13 != 0 :
    charge(asoundfx 7)                                                                                ⟨290046⟩
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨290051⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 7, x=0)                                         ⟨290058⟩
    v238 = 0                                                                                          ⟨290062⟩
    si canal1.+0 != 0 :
        AIL_start_sequence(pilote=canal1.+0→4, séquence=v3374)                                        ⟨290068⟩
        AIL_set_relative_volume_30C66(canal1.+0→4, v3374, word_48EB0, v238)                           ⟨290075⟩
charge(mid17 10)                                                                                      ⟨290091⟩
palette_depuis(pal9(mid17 10))                                                                        ⟨290098⟩
charge(mid17 11)                                                                                      ⟨290110⟩
palette_depuis(pal10(mid17 11))                                                                       ⟨290117⟩

──── scène3 ────
scène3 = Scene_Create(cadence=15, palette=255, surface=&v470)                                         ⟨290125⟩
c8 = Layer(ressource=mid17 3, x=0, y=0)                                                               ⟨290132⟩
c9 = Layer(ressource=midgames 50, x=0, y=0)                                                           ⟨290140⟩
c10 = Layer(ressource=mid17 4, x=0, y=0)                                                              ⟨290148⟩
palette_copie(destination=pal1, source=pal9(mid17 10))                                                ⟨290158⟩
palette_copie(destination=pal1, source=pal10(mid17 11))                                               ⟨290167⟩
ajoute c8 à scène3                                                                                    ⟨290172⟩
ajoute c9 à scène3                                                                                    ⟨290177⟩
ajoute c10 à scène3                                                                                   ⟨290182⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨290194⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨290199⟩
Widget_Method_Dispatch8_314A9(zone1, 248)                                                             ⟨290204⟩
v278 = 0                                                                                              ⟨290206⟩
si = 3                                                                                                ⟨290207⟩
tant que (scène3.compteur < 73) et (scène3.terminée == 0) :
    v280 = scène3.compteur                                                                            ⟨290213⟩
    si v280 < 51 :
        v282 = si                                                                                     ⟨290216⟩
        si = si + 1                                                                                   ⟨290217⟩
        c10.image = v282                                                                              ⟨290220⟩
    sinon :
        v284 = v278                                                                                   ⟨290226⟩
        v278_avant = v278                                                                             ⟨290227⟩
        v278 = v278 + 1                                                                               ⟨290227⟩
        c9.image = v284                                                                               ⟨290230⟩
        si = si + 1                                                                                   ⟨290232⟩
        c10.image = si                                                                                ⟨290235⟩
    Scene_Tick(scène=scène3)                                                                          ⟨290250⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨290280⟩
v248 = 0                                                                                              ⟨290327⟩
v242 = 0                                                                                              ⟨290329⟩
canal_arrête(canal=canal1)                                                                            ⟨290332⟩
v3372 = 0                                                                                             ⟨290350⟩
v228 = 0                                                                                              ⟨290371⟩
si byte_495FC != 0 :
    v209 = 0                                                                                          ⟨290400⟩
    v208 = 0                                                                                          ⟨290401⟩
    v193 = 0                                                                                          ⟨290424⟩
    v192 = 0                                                                                          ⟨290425⟩
    v177 = 0                                                                                          ⟨290448⟩
    v176 = 0                                                                                          ⟨290449⟩
    v161 = 0                                                                                          ⟨290472⟩
    v160 = 0                                                                                          ⟨290473⟩
    v151 = 0                                                                                          ⟨290491⟩
    v150 = 0                                                                                          ⟨290492⟩
    v141 = 0                                                                                          ⟨290510⟩
    v140 = 0                                                                                          ⟨290511⟩
    v131 = 0                                                                                          ⟨290529⟩
    v130 = 0                                                                                          ⟨290530⟩
    v106 = 0                                                                                          ⟨290556⟩
    v101 = 0                                                                                          ⟨290557⟩
    v100 = 0                                                                                          ⟨290558⟩
    v85 = 0                                                                                           ⟨290581⟩
    v84 = 0                                                                                           ⟨290582⟩
    v69 = 0                                                                                           ⟨290605⟩
    v68 = 0                                                                                           ⟨290606⟩
    v53 = 0                                                                                           ⟨290629⟩
    v52 = 0                                                                                           ⟨290630⟩
    voix_arrête(voix=voix1)                                                                           ⟨290634⟩
    v3288 = 0                                                                                         ⟨290652⟩
    v3283 = 0                                                                                         ⟨290653⟩
    v3282 = 0                                                                                         ⟨290654⟩
    canal_arrête(canal=canal2)                                                                        ⟨290657⟩
    v1214 = 0                                                                                         ⟨290675⟩
    v1209 = 0                                                                                         ⟨290676⟩
    v1208 = 0                                                                                         ⟨290677⟩
    v35 = 0                                                                                           ⟨290700⟩
    v34 = 0                                                                                           ⟨290701⟩
    retour                                                                                            ⟨290753⟩
v228 = 0                                                                                              ⟨290760⟩
v240 = 2                                                                                              ⟨290762⟩
v239 = 0                                                                                              ⟨290763⟩
v3372 = 0                                                                                             ⟨290765⟩
v3368 = 2                                                                                             ⟨290766⟩
v3374 = -1                                                                                            ⟨290770⟩
v3386 = 0                                                                                             ⟨290771⟩
v3381 = 0                                                                                             ⟨290773⟩
v3380 = 0                                                                                             ⟨290774⟩
v3390 = 0                                                                                             ⟨290775⟩
si v13 != 0 :
    charge(asoundfx 93)                                                                               ⟨290789⟩
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨290794⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 93, x=0)                                        ⟨290801⟩
    v246 = word_48F5C                                                                                 ⟨290804⟩
    v248 = 0                                                                                          ⟨290805⟩
    si canal1.+0 != 0 :
        AIL_start_sequence(pilote=canal1.+0→4, séquence=v3374)                                        ⟨290811⟩
        AIL_set_relative_volume_30C66(canal1.+0→4, v3374, v246, v248)                                 ⟨290818⟩
charge(mid17 1)                                                                                       ⟨290834⟩
charge(mid17 5)                                                                                       ⟨290846⟩
charge(midgames 47)                                                                                   ⟨290858⟩
palette_depuis(pal11(midgames 47))                                                                    ⟨290865⟩
charge(mid17 8)                                                                                       ⟨290877⟩
palette_depuis(pal12(mid17 8))                                                                        ⟨290884⟩

──── scène4 ────
scène4 = Scene_Create(cadence=15, palette=255, surface=&v470)                                         ⟨290892⟩
c11 = Layer(ressource=mid17 1, x=0, y=0)                                                              ⟨290899⟩
c12 = Layer(ressource=mid17 5, x=0, y=0)                                                              ⟨290907⟩
palette_copie(destination=pal1, source=pal12(mid17 8))                                                ⟨290917⟩
palette_copie(destination=pal1, source=pal11(midgames 47))                                            ⟨290926⟩
ajoute c11 à scène4                                                                                   ⟨290931⟩
ajoute c12 à scène4                                                                                   ⟨290936⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨290948⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨290953⟩
Widget_Method_Dispatch8_314A9(zone1, 0)                                                               ⟨290958⟩
Scene_Tick(scène=scène4)                                                                              ⟨290962⟩
charge(midgames 48)                                                                                   ⟨290974⟩
charge(midgames 49)                                                                                   ⟨290986⟩
charge(mid17 7)                                                                                       ⟨290998⟩
charge(mid17 6)                                                                                       ⟨291010⟩
c13 = Layer(ressource=midgames 48, x=0, y=0)                                                          ⟨291017⟩
c14 = Layer(ressource=midgames 49, x=0, y=0)                                                          ⟨291025⟩
c15 = Layer(ressource=mid17 7, x=0, y=0)                                                              ⟨291033⟩
c16 = Layer(ressource=mid17 6, x=0, y=0)                                                              ⟨291041⟩
retire(parent=scène4, calque=c12)                                                                     ⟨291047⟩
ajoute c13 à scène4                                                                                   ⟨291052⟩
ajoute c15 à scène4                                                                                   ⟨291057⟩
ajoute c12 à scène4                                                                                   ⟨291062⟩
si = 0                                                                                                ⟨291064⟩
v354 = 0                                                                                              ⟨291065⟩
scène4.compteur = 0                                                                                   ⟨291066⟩
tant que (scène4.compteur < 83) et (scène4.terminée == 0) :
    v356 = scène4.compteur                                                                            ⟨291072⟩
    si v356 == 20 :
        Scene_SetFps(scène=scène4, cadence=13)                                                        ⟨291078⟩
    si v356 == 30 :
        Scene_SetFps(scène=scène4, cadence=11)                                                        ⟨291087⟩
    si v356 == 40 :
        Scene_SetFps(scène=scène4, cadence=9)                                                         ⟨291096⟩
    si v356 == 50 :
        Scene_SetFps(scène=scène4, cadence=7)                                                         ⟨291105⟩
    si v356 < 30 :
        v358 = si                                                                                     ⟨291111⟩
        si = si + 1                                                                                   ⟨291112⟩
        c13.image = v358                                                                              ⟨291115⟩
        v360 = v354                                                                                   ⟨291117⟩
        v354_avant = v354                                                                             ⟨291118⟩
        v354 = v354 + 1                                                                               ⟨291118⟩
        c15.image = v360                                                                              ⟨291121⟩
    sinon :
        si v356 == 30 :
            si = 0                                                                                    ⟨291132⟩
            retire(parent=scène4, calque=c13)                                                         ⟨291136⟩
            c13.détruit(3)                                                                            ⟨291144⟩
            retire(parent=scène4, calque=c12)                                                         ⟨291152⟩
            ajoute c14 à scène4                                                                       ⟨291157⟩
            ajoute c12 à scène4                                                                       ⟨291162⟩
            v362 = 0                                                                                  ⟨291164⟩
            si = 1                                                                                    ⟨291165⟩
            c14.image = v362                                                                          ⟨291168⟩
            v364 = v354                                                                               ⟨291170⟩
            v354_avant = v354                                                                         ⟨291171⟩
            v354 = v354 + 1                                                                           ⟨291171⟩
            c15.image = v364                                                                          ⟨291174⟩
        sinon :
            si v356 > 30 :
                si v356 < 50 :
                    v366 = si                                                                         ⟨291183⟩
                    si = si + 1                                                                       ⟨291184⟩
                    c14.image = v366                                                                  ⟨291187⟩
                    v368 = v354                                                                       ⟨291189⟩
                    v354_avant = v354                                                                 ⟨291190⟩
                    v354 = v354 + 1                                                                   ⟨291190⟩
                    c15.image = v368                                                                  ⟨291193⟩
                sinon :
                    si v356 == 50 :
                        si v13 != 0 :
                            charge(asoundfx 20)                                                       ⟨291217⟩
                            canal_init(canal=canal3, pilote=word_46849)                               ⟨291222⟩
                            canal_enregistre(canal=canal3, ressource=asoundfx 20, x=0)                ⟨291229⟩
                            v370 = word_48ECA                                                         ⟨291232⟩
                            si canal3.+0 != 0 :
                                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3388)                ⟨291239⟩
                                AIL_set_relative_volume_30C66(canal3.+0→4, v3388, v370, 0)            ⟨291246⟩
                        si = 0                                                                        ⟨291252⟩
                        Scene_SetFps(scène=scène4, cadence=15)                                        ⟨291256⟩
                        ajoute c16 à scène4                                                           ⟨291261⟩
                        v374 = 0                                                                      ⟨291263⟩
                        si = 1                                                                        ⟨291264⟩
                        c16.image = v374                                                              ⟨291267⟩
                    sinon :
                        si v356 < 66 :
                            si v356 & 1 != 0 :
                                v376 = si                                                             ⟨291276⟩
                                si = si + 1                                                           ⟨291277⟩
                                c16.image = v376                                                      ⟨291280⟩
            sinon :
                si v356 == 50 :
                    si v13 != 0 :
                        charge(asoundfx 20)                                                           ⟨291217⟩
                        canal_init(canal=canal3, pilote=word_46849)                                   ⟨291222⟩
                        canal_enregistre(canal=canal3, ressource=asoundfx 20, x=0)                    ⟨291229⟩
                        v370 = word_48ECA                                                             ⟨291232⟩
                        si canal3.+0 != 0 :
                            AIL_start_sequence(pilote=canal3.+0→4, séquence=v3388)                    ⟨291239⟩
                            AIL_set_relative_volume_30C66(canal3.+0→4, v3388, v370, 0)                ⟨291246⟩
                    si = 0                                                                            ⟨291252⟩
                    Scene_SetFps(scène=scène4, cadence=15)                                            ⟨291256⟩
                    ajoute c16 à scène4                                                               ⟨291261⟩
                    v374 = 0                                                                          ⟨291263⟩
                    si = 1                                                                            ⟨291264⟩
                    c16.image = v374                                                                  ⟨291267⟩
                sinon :
                    si v356 < 66 :
                        si v356 & 1 != 0 :
                            v376 = si                                                                 ⟨291276⟩
                            si = si + 1                                                               ⟨291277⟩
                            c16.image = v376                                                          ⟨291280⟩
    Scene_Tick(scène=scène4)                                                                          ⟨291296⟩
v339 = 0                                                                                              ⟨291339⟩
v338 = 0                                                                                              ⟨291340⟩
v328 = 0                                                                                              ⟨291359⟩
v318 = 0                                                                                              ⟨291378⟩
v308 = 0                                                                                              ⟨291397⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨291401⟩
v288 = 0                                                                                              ⟨291426⟩
v278 = 0                                                                                              ⟨291448⟩
v272 = 0                                                                                              ⟨291450⟩
v262 = 0                                                                                              ⟨291469⟩
v252 = 0                                                                                              ⟨291488⟩
canal_arrête(canal=canal3)                                                                            ⟨291491⟩
v3386 = 0                                                                                             ⟨291509⟩
v3380 = 0                                                                                             ⟨291511⟩
canal_arrête(canal=canal1)                                                                            ⟨291514⟩
v3372 = 0                                                                                             ⟨291532⟩
v239 = 0                                                                                              ⟨291552⟩
v228 = 0                                                                                              ⟨291572⟩
si byte_495FC != 0 :
    v209 = 0                                                                                          ⟨291601⟩
    v208 = 0                                                                                          ⟨291602⟩
    v193 = 0                                                                                          ⟨291625⟩
    v192 = 0                                                                                          ⟨291626⟩
    v177 = 0                                                                                          ⟨291649⟩
    v176 = 0                                                                                          ⟨291650⟩
    v161 = 0                                                                                          ⟨291673⟩
    v160 = 0                                                                                          ⟨291674⟩
    v151 = 0                                                                                          ⟨291692⟩
    v150 = 0                                                                                          ⟨291693⟩
    v141 = 0                                                                                          ⟨291711⟩
    v140 = 0                                                                                          ⟨291712⟩
    v131 = 0                                                                                          ⟨291730⟩
    v130 = 0                                                                                          ⟨291731⟩
    v106 = 0                                                                                          ⟨291757⟩
    v101 = 0                                                                                          ⟨291758⟩
    v100 = 0                                                                                          ⟨291759⟩
    v85 = 0                                                                                           ⟨291782⟩
    v84 = 0                                                                                           ⟨291783⟩
    v69 = 0                                                                                           ⟨291806⟩
    v68 = 0                                                                                           ⟨291807⟩
    v53 = 0                                                                                           ⟨291830⟩
    v52 = 0                                                                                           ⟨291831⟩
    voix_arrête(voix=voix1)                                                                           ⟨291835⟩
    v3288 = 0                                                                                         ⟨291853⟩
    v3283 = 0                                                                                         ⟨291854⟩
    v3282 = 0                                                                                         ⟨291855⟩
    canal_arrête(canal=canal2)                                                                        ⟨291858⟩
    v1214 = 0                                                                                         ⟨291876⟩
    v1209 = 0                                                                                         ⟨291877⟩
    v1208 = 0                                                                                         ⟨291878⟩
    v35 = 0                                                                                           ⟨291901⟩
    v34 = 0                                                                                           ⟨291902⟩
    retour                                                                                            ⟨291954⟩
v228 = 0                                                                                              ⟨291961⟩
charge(optshps 116)                                                                                   ⟨291968⟩
v240 = 2                                                                                              ⟨291971⟩
v239 = 0                                                                                              ⟨291972⟩
charge(midgames 4)                                                                                    ⟨291980⟩

──── scène5 ────
scène5 = Scene_Create(cadence=9, palette=255, surface=&v470)                                          ⟨291988⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨291998⟩
c17 = Layer(ressource=midgames 4, x=0, y=0)                                                           ⟨292005⟩
c18 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)                               ⟨292013⟩
si = c18                                                                                              ⟨292015⟩
c19 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)                             ⟨292022⟩
c20 = Layer(ressource=optshps 116, x=0, y=-64)                                                        ⟨292030⟩
palette_copie(destination=pal1, source=pal2(optpals 21))                                              ⟨292040⟩
palette_copie(destination=pal1, source=pal3(midgames 6))                                              ⟨292049⟩
palette_copie(destination=pal1, source=pal4(convdata type 2 "normal"))                                ⟨292058⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨292070⟩
ajoute c20 à scène5                                                                                   ⟨292075⟩
ajoute c17 à scène5                                                                                   ⟨292080⟩
ajoute c18 à scène5                                                                                   ⟨292085⟩
ajoute c19 à scène5                                                                                   ⟨292090⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨292095⟩
Widget_Method_Dispatch8_314A9(zone1, 127)                                                             ⟨292100⟩
tête_image_de_base(tête=c18, image=-1)                                                                ⟨292104⟩
charge(midgames 0)                                                                                    ⟨292116⟩
c21 = ToggleLayer(ressource=midgames 0, x=160, y=128, sens=1)                                         ⟨292124⟩
ajoute c21 à scène5                                                                                   ⟨292130⟩
tant que (scène5.compteur < 15) et (scène5.terminée == 0) :
    v274 = scène5.compteur                                                                            ⟨292137⟩
    si v274 == 12 :
        tête_image_de_base(tête=c18, image=18)                                                        ⟨292142⟩
    Scene_Tick(scène=scène5)                                                                          ⟨292158⟩
v249 = 0                                                                                              ⟨292217⟩
v248 = 0                                                                                              ⟨292218⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨292222⟩
v239 = 0                                                                                              ⟨292241⟩
v228 = 0                                                                                              ⟨292261⟩
si byte_495FC != 0 :
    v209 = 0                                                                                          ⟨292290⟩
    v208 = 0                                                                                          ⟨292291⟩
    v193 = 0                                                                                          ⟨292314⟩
    v192 = 0                                                                                          ⟨292315⟩
    v177 = 0                                                                                          ⟨292338⟩
    v176 = 0                                                                                          ⟨292339⟩
    v161 = 0                                                                                          ⟨292362⟩
    v160 = 0                                                                                          ⟨292363⟩
    v151 = 0                                                                                          ⟨292381⟩
    v150 = 0                                                                                          ⟨292382⟩
    v141 = 0                                                                                          ⟨292400⟩
    v140 = 0                                                                                          ⟨292401⟩
    v131 = 0                                                                                          ⟨292419⟩
    v130 = 0                                                                                          ⟨292420⟩
    v106 = 0                                                                                          ⟨292446⟩
    v101 = 0                                                                                          ⟨292447⟩
    v100 = 0                                                                                          ⟨292448⟩
    v85 = 0                                                                                           ⟨292471⟩
    v84 = 0                                                                                           ⟨292472⟩
    v69 = 0                                                                                           ⟨292495⟩
    v68 = 0                                                                                           ⟨292496⟩
    v53 = 0                                                                                           ⟨292519⟩
    v52 = 0                                                                                           ⟨292520⟩
    voix_arrête(voix=voix1)                                                                           ⟨292524⟩
    v3288 = 0                                                                                         ⟨292542⟩
    v3283 = 0                                                                                         ⟨292543⟩
    v3282 = 0                                                                                         ⟨292544⟩
    canal_arrête(canal=canal2)                                                                        ⟨292547⟩
    v1214 = 0                                                                                         ⟨292565⟩
    v1209 = 0                                                                                         ⟨292566⟩
    v1208 = 0                                                                                         ⟨292567⟩
    v35 = 0                                                                                           ⟨292590⟩
    v34 = 0                                                                                           ⟨292591⟩
    retour                                                                                            ⟨292643⟩
v228 = 0                                                                                              ⟨292650⟩
charge(mid17 2)                                                                                       ⟨292657⟩
v240 = 2                                                                                              ⟨292660⟩
v239 = 0                                                                                              ⟨292661⟩
charge(mid17 0)                                                                                       ⟨292669⟩
v250 = 2                                                                                              ⟨292672⟩
v249 = 0                                                                                              ⟨292673⟩
v248 = 0                                                                                              ⟨292674⟩
charge(mid17 9)                                                                                       ⟨292681⟩
palette_depuis(pal13(mid17 9))                                                                        ⟨292688⟩

──── scène6 ────
scène6 = Scene_Create(cadence=9, palette=255, surface=&v470)                                          ⟨292696⟩
c22 = OverlayImageLayer(ressource=mid17 0, x=5, y=0, image=0)                                         ⟨292704⟩
c23 = Layer(ressource=mid17 2, x=0, y=0)                                                              ⟨292712⟩
palette_copie(destination=pal1, source=pal13(mid17 9))                                                ⟨292722⟩
ajoute c23 à scène6                                                                                   ⟨292727⟩
ajoute c22 à scène6                                                                                   ⟨292732⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨292744⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨292749⟩
Widget_Method_Dispatch8_314A9(zone1, 128)                                                             ⟨292754⟩
v266 = 1                                                                                              ⟨292756⟩
c22.image = v266                                                                                      ⟨292761⟩
si v12 != 0 :
    Scene_Tick(scène=scène6)                                                                          ⟨292770⟩
    si = 0                                                                                            ⟨292772⟩
    tant que si < 4 :
        Scene_Tick(scène=scène6)                                                                      ⟨292779⟩
        si = si + 1                                                                                   ⟨292781⟩
    v278 = 0                                                                                          ⟨292786⟩
    v272 = 0                                                                                          ⟨292789⟩
    charge(mid17voc 1)                                                                                ⟨292796⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid17voc 1)                                 ⟨292802⟩
    si = 0                                                                                            ⟨292804⟩
    tant que si < 4 :
        Scene_Tick(scène=scène6)                                                                      ⟨292811⟩
        si = si + 1                                                                                   ⟨292813⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨292821⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène6)                                                                      ⟨292839⟩
    si = 0                                                                                            ⟨292851⟩
    tant que si < 17 :
        si si > 4 :
            si si < 13 :
                v280 = v266                                                                           ⟨292861⟩
                v266_avant = v266                                                                     ⟨292862⟩
                v266_avant = v266                                                                     ⟨292862⟩
                v266 = v266 + 1                                                                       ⟨292862⟩
                c22.image = v280                                                                      ⟨292865⟩
        Scene_Tick(scène=scène6)                                                                      ⟨292871⟩
        si = si + 1                                                                                   ⟨292873⟩
    voix_arrête(voix=voix1)                                                                           ⟨292880⟩
    v278 = 0                                                                                          ⟨292898⟩
    v272 = 0                                                                                          ⟨292900⟩
sinon :
    v6 = 75                                                                                           ⟨292905⟩
    v4 = scène6.compteur                                                                              ⟨292907⟩
    tant que (scène6.compteur < v4 + ((v6·70) / 100)) et (scène6.terminée == 0) :
        si = scène6.compteur                                                                          ⟨292921⟩
        si v4 + 8 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[9])                              ⟨292934⟩
        si v4 + 24 < scène6.compteur :
            si v4 + 33 > scène6.compteur :
                v266_avant = v266                                                                     ⟨292948⟩
                v266_avant = v266                                                                     ⟨292948⟩
                v266_avant = v266                                                                     ⟨292948⟩
                v266 = v266 + 1                                                                       ⟨292948⟩
                c22.image = v266_avant                                                                ⟨292951⟩
        si (v4 + ((v6·70) / 100)) - 1 == scène6.compteur :
            v3408 = 4540                                                                              ⟨292959⟩
            v3408 = 4552                                                                              ⟨292960⟩
            v3408 = 4568                                                                              ⟨292961⟩
            v3408 = 4584                                                                              ⟨292962⟩
            v3408 = 4604                                                                              ⟨292963⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3408, v3337, v3335, v3333, v3331, 0, &v3360)        ⟨292973⟩
        Scene_Tick(scène=scène6)                                                                      ⟨293005⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=2, premier=0, nombre=256)                           ⟨293038⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨293043⟩
v249 = 0                                                                                              ⟨293067⟩
v248 = 0                                                                                              ⟨293068⟩
v239 = 0                                                                                              ⟨293086⟩
v228 = 0                                                                                              ⟨293106⟩
v209 = 0                                                                                              ⟨293129⟩
v208 = 0                                                                                              ⟨293130⟩
v193 = 0                                                                                              ⟨293153⟩
v192 = 0                                                                                              ⟨293154⟩
v177 = 0                                                                                              ⟨293177⟩
v176 = 0                                                                                              ⟨293178⟩
v161 = 0                                                                                              ⟨293201⟩
v160 = 0                                                                                              ⟨293202⟩
v151 = 0                                                                                              ⟨293220⟩
v150 = 0                                                                                              ⟨293221⟩
v141 = 0                                                                                              ⟨293239⟩
v140 = 0                                                                                              ⟨293240⟩
v131 = 0                                                                                              ⟨293258⟩
v130 = 0                                                                                              ⟨293259⟩
v106 = 0                                                                                              ⟨293285⟩
v101 = 0                                                                                              ⟨293286⟩
v100 = 0                                                                                              ⟨293287⟩
v85 = 0                                                                                               ⟨293310⟩
v84 = 0                                                                                               ⟨293311⟩
v69 = 0                                                                                               ⟨293334⟩
v68 = 0                                                                                               ⟨293335⟩
v53 = 0                                                                                               ⟨293358⟩
v52 = 0                                                                                               ⟨293359⟩
voix_arrête(voix=voix1)                                                                               ⟨293363⟩
v3288 = 0                                                                                             ⟨293381⟩
v3283 = 0                                                                                             ⟨293382⟩
v3282 = 0                                                                                             ⟨293383⟩
canal_arrête(canal=canal2)                                                                            ⟨293386⟩
v1214 = 0                                                                                             ⟨293404⟩
v1209 = 0                                                                                             ⟨293405⟩
v1208 = 0                                                                                             ⟨293406⟩
v35 = 0                                                                                               ⟨293429⟩
v34 = 0                                                                                               ⟨293430⟩
retour                                                                                                ⟨293482⟩
```

## Tableaux du segment de données

