# Script extrait de `sub_768F0` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## sub_768F0

```
bp = sp                                                                                               ⟨235618⟩
tableau_textes(tableau=textes1, nombre=19, longueur=200)                                              ⟨235628⟩
v9 = 0                                                                                                ⟨235630⟩
v10 = 0                                                                                               ⟨235631⟩
v11 = 0                                                                                               ⟨235632⟩
si word_4684B != 0 :
    v10 = 1                                                                                           ⟨235635⟩
byte_495FC = 0                                                                                        ⟨235638⟩
v14 = word_46F46                                                                                      ⟨235640⟩
v440 = 0                                                                                              ⟨235641⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v440, v14)                                                      ⟨235646⟩
v454 = 0                                                                                              ⟨235648⟩
TextRenderer_ApplyFormatChange_2EA21(&v454, 0)                                                        ⟨235657⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨235667⟩
v24 = 0                                                                                               ⟨235669⟩
v34 = 0                                                                                               ⟨235672⟩
v30 = 2                                                                                               ⟨235673⟩
v29 = 0                                                                                               ⟨235674⟩
v28 = 0                                                                                               ⟨235675⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨235689⟩
v36 = ?                                                                                               ⟨235691⟩
v38 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                 ⟨235692⟩
v34 = v38                                                                                             ⟨235694⟩
v30 = 2                                                                                               ⟨235695⟩
v29 = 1                                                                                               ⟨235696⟩
v28 = 0                                                                                               ⟨235697⟩
GlyphObject_ConstructWithBuffer_311CF(&v478, &v34)                                                    ⟨235702⟩
v48 = word_46F46                                                                                      ⟨235709⟩
zone_texte(zone=zone1, police=&v478)                                                                  ⟨235715⟩
v50 = 152                                                                                             ⟨235719⟩
v52 = 319                                                                                             ⟨235721⟩
v54 = 199                                                                                             ⟨235723⟩
v487 = 0                                                                                              ⟨235725⟩
v485 = v50                                                                                            ⟨235727⟩
v483 = v52                                                                                            ⟨235729⟩
v481 = v54                                                                                            ⟨235731⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨235735⟩
Widget_Method_Dispatch8_314A9(zone1, 200)                                                             ⟨235740⟩
si v10 != 0 :
    si sub_6734(chemin1) == 0 : aller à loc_76B5B                                                     ⟨235798⟩
    pak mid5voc.ouvre(chemin1, 1)                                                                     ⟨235805⟩
sinon :
    v10 = 0                                                                                           ⟨235812⟩
v64 = 0                                                                                               ⟨235815⟩
v59 = 0                                                                                               ⟨235817⟩
v58 = 0                                                                                               ⟨235818⟩
v66 = byte_46848                                                                                      ⟨235820⟩
si v66 != 1 :
    si v66 == 2 : aller à loc_76D15                                                                   ⟨235830⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨235866⟩
        flux_iff(flux=flux1)                                                                          ⟨235880⟩
        v3163 = 256                                                                                   ⟨235883⟩
        v3167 = 0                                                                                     ⟨235884⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨235892⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨235898⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨235904⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨235908⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨235910⟩
        v244 = 1                                                                                      ⟨235911⟩
        tant que v244 <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨235918⟩
            ds:24192[v244·2] = iff_lit_mot(flux=flux1)                                                ⟨235922⟩
            v244_avant = v244·2                                                                       ⟨235923⟩
            v244 = v244 + 1                                                                           ⟨235923⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨235930⟩
        v11 = 1                                                                                       ⟨235932⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨235936⟩
    si sub_6734(chemin1) != 0 :
        v9 = 1                                                                                        ⟨235962⟩
        si v11 == 0 :
            word_48F76 = 90                                                                           ⟨235967⟩
    aller à loc_76E8A                                                                                 ⟨235971⟩
    loc_76D15:                                                                                        ⟨235974⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨236002⟩
        flux_iff(flux=flux1)                                                                          ⟨236016⟩
        v3163 = 256                                                                                   ⟨236019⟩
        v3167 = 0                                                                                     ⟨236020⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨236028⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨236034⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨236040⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨236044⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨236046⟩
        v244 = 1                                                                                      ⟨236047⟩
        tant que v244 <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨236054⟩
            ds:24192[v244·2] = iff_lit_mot(flux=flux1)                                                ⟨236058⟩
            v244_avant = v244·2                                                                       ⟨236059⟩
            v244 = v244 + 1                                                                           ⟨236059⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨236066⟩
        v11 = 1                                                                                       ⟨236068⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨236072⟩
    si sub_6734(chemin1) != 0 :
        v9 = 1                                                                                        ⟨236098⟩
        si v11 == 0 :
            word_48F76 = 255                                                                          ⟨236103⟩
loc_76E8A:                                                                                            ⟨236109⟩
v1002 = 0                                                                                             ⟨236111⟩
v997 = 0                                                                                              ⟨236113⟩
v996 = 0                                                                                              ⟨236114⟩
v1006 = 0                                                                                             ⟨236115⟩
si v9 != 0 :
    si v10 != 0 :
        v243 = 5                                                                                      ⟨236128⟩
    sinon :
        v243 = 4                                                                                      ⟨236133⟩
    charge(amusic v243)                                                                               ⟨236144⟩
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨236149⟩
    canal_enregistre(canal=canal1, ressource=amusic v243, x=0)                                        ⟨236156⟩
v1015 = booléen                                                                                       ⟨236173⟩
v1011 = booléen                                                                                       ⟨236174⟩
si v10 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨236180⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨236198⟩
    v3163 = 256                                                                                       ⟨236201⟩
    v3167 = 0                                                                                         ⟨236202⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨236210⟩
    iff_form(flux=flux1, balise='MG05', x=0)                                                          ⟨236216⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨236222⟩
    v244 = 0                                                                                          ⟨236224⟩
    tant que v244 < 19 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨236233⟩
        v246 = v3146                                                                                  ⟨236236⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·v244), taille=v246)                  ⟨236247⟩
        v3159 = v3142                                                                                 ⟨236250⟩
        v244 = v244 + 1                                                                               ⟨236251⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨236258⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[12], arg_6)                                                                ⟨236272⟩
        CRT_Strcat(textes1[12], 8194)                                                                 ⟨236281⟩
    sinon :
        si CRT_Strlen(arg_8) != 0 :
            CRT_Strcat(textes1[12], arg_8)                                                            ⟨236299⟩
            CRT_Strcat(textes1[12], 8194)                                                             ⟨236308⟩
        sinon :
            si CRT_Strlen(arg_10) != 0 :
                CRT_Strcat(textes1[12], arg_10)                                                       ⟨236326⟩
                CRT_Strcat(textes1[12], 8194)                                                         ⟨236335⟩
            sinon :
                CRT_Strcat(textes1[12], textes1[13])                                                  ⟨236353⟩
                CRT_Strcat(textes1[12], 8194)                                                         ⟨236362⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨236370⟩
SmallObject_RegisterInList_2CB40(&v70, &v454)                                                         ⟨236383⟩
charge(midgames 1)                                                                                    ⟨236395⟩
charge(midgames 2)                                                                                    ⟨236407⟩
palette_depuis(pal2(midgames 2))                                                                      ⟨236414⟩
charge(mid5 17)                                                                                       ⟨236426⟩
palette_depuis(pal3(mid5 17))                                                                         ⟨236433⟩
charge(mid5 1)                                                                                        ⟨236445⟩
charge(mid5 18)                                                                                       ⟨236457⟩
palette_depuis(pal4(mid5 18))                                                                         ⟨236464⟩
charge(mid5 11)                                                                                       ⟨236476⟩
charge(mid5 22)                                                                                       ⟨236488⟩
palette_depuis(pal5(mid5 22))                                                                         ⟨236495⟩
charge(mid5 9)                                                                                        ⟨236507⟩
charge(mid5 20)                                                                                       ⟨236519⟩
palette_depuis(pal6(mid5 20))                                                                         ⟨236526⟩
charge(mid5 23)                                                                                       ⟨236538⟩
palette_depuis(pal7(mid5 23))                                                                         ⟨236545⟩
charge(mid5 14)                                                                                       ⟨236557⟩
palette_depuis(pal8(mid5 14))                                                                         ⟨236564⟩
charge_convdata_type2("night")                                                                        ⟨236574⟩
palette_depuis(pal9(convdata type 2 "night"))                                                         ⟨236581⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨236611⟩
    v226 = 0                                                                                          ⟨236612⟩
    v211 = 0                                                                                          ⟨236635⟩
    v210 = 0                                                                                          ⟨236636⟩
    v195 = 0                                                                                          ⟨236659⟩
    v194 = 0                                                                                          ⟨236660⟩
    v179 = 0                                                                                          ⟨236683⟩
    v178 = 0                                                                                          ⟨236684⟩
    v169 = 0                                                                                          ⟨236702⟩
    v168 = 0                                                                                          ⟨236703⟩
    v153 = 0                                                                                          ⟨236726⟩
    v152 = 0                                                                                          ⟨236727⟩
    v143 = 0                                                                                          ⟨236745⟩
    v142 = 0                                                                                          ⟨236746⟩
    v127 = 0                                                                                          ⟨236769⟩
    v126 = 0                                                                                          ⟨236770⟩
    v117 = 0                                                                                          ⟨236788⟩
    v116 = 0                                                                                          ⟨236789⟩
    v101 = 0                                                                                          ⟨236812⟩
    v100 = 0                                                                                          ⟨236813⟩
    v85 = 0                                                                                           ⟨236836⟩
    v84 = 0                                                                                           ⟨236837⟩
    v75 = 0                                                                                           ⟨236855⟩
    v74 = 0                                                                                           ⟨236856⟩
    voix_arrête(voix=voix1)                                                                           ⟨236865⟩
    v3076 = 0                                                                                         ⟨236883⟩
    v3071 = 0                                                                                         ⟨236884⟩
    v3070 = 0                                                                                         ⟨236885⟩
    canal_arrête(canal=canal1)                                                                        ⟨236888⟩
    v1002 = 0                                                                                         ⟨236906⟩
    v997 = 0                                                                                          ⟨236907⟩
    v996 = 0                                                                                          ⟨236908⟩
    v59 = 0                                                                                           ⟨236931⟩
    v58 = 0                                                                                           ⟨236932⟩
    v34 = 0                                                                                           ⟨236973⟩
    v29 = 0                                                                                           ⟨236974⟩
    v28 = 0                                                                                           ⟨236975⟩
    retour                                                                                            ⟨236997⟩
si v9 != 0 :
    v240 = word_48F76                                                                                 ⟨237004⟩
    si canal1.+0 != 0 :
        AIL_start_sequence(pilote=canal1.+0→4, séquence=v1004)                                        ⟨237011⟩
        AIL_set_relative_volume_30C66(canal1.+0→4, v1004, v240, 0)                                    ⟨237018⟩
charge(mid5 8)                                                                                        ⟨237034⟩
charge(mid5 16)                                                                                       ⟨237046⟩
palette_depuis(pal10(mid5 16))                                                                        ⟨237053⟩

──── scène1 ────
scène1 = Scene_Create(cadence=7, palette=255, surface=&v440)                                          ⟨237061⟩
c1 = ImageLayer(ressource=midgames 1, x=0, y=0, image=0)                                              ⟨237069⟩
c2 = ImageLayer(ressource=midgames 1, x=0, y=0, image=1)                                              ⟨237078⟩
c3 = Layer(ressource=mid5 8, x=0, y=8)                                                                ⟨237086⟩
palette_copie(destination=pal1, source=pal2(midgames 2))                                              ⟨237096⟩
palette_copie(destination=pal1, source=pal10(mid5 16))                                                ⟨237105⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨237117⟩
ajoute c2 à scène1                                                                                    ⟨237122⟩
ajoute c1 à scène1                                                                                    ⟨237127⟩
ajoute c3 à scène1                                                                                    ⟨237132⟩
v284 = 0                                                                                              ⟨237134⟩
v280 = 2                                                                                              ⟨237135⟩
v279 = 0                                                                                              ⟨237136⟩
v278 = 0                                                                                              ⟨237137⟩
v294 = 0                                                                                              ⟨237138⟩
v290 = 2                                                                                              ⟨237139⟩
v289 = 0                                                                                              ⟨237140⟩
v288 = 0                                                                                              ⟨237141⟩
v3136 = 0                                                                                             ⟨237142⟩
v3132 = 2                                                                                             ⟨237143⟩
v3131 = 0                                                                                             ⟨237144⟩
v3130 = 0                                                                                             ⟨237145⟩
v3140 = 0                                                                                             ⟨237146⟩
v3138 = -1                                                                                            ⟨237147⟩
v3150 = 0                                                                                             ⟨237148⟩
v3146 = 2                                                                                             ⟨237149⟩
v3145 = 0                                                                                             ⟨237150⟩
v3144 = 0                                                                                             ⟨237151⟩
v3154 = 0                                                                                             ⟨237152⟩
v3152 = -1                                                                                            ⟨237153⟩
v300 = word_4501C                                                                                     ⟨237155⟩
v298 = word_4501E                                                                                     ⟨237157⟩
v296 = word_45020                                                                                     ⟨237159⟩
si v11 != 0 :
    charge(asoundfx 85)                                                                               ⟨237172⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨237177⟩
    canal_enregistre(canal=canal2, ressource=asoundfx 85, x=0)                                        ⟨237184⟩
    charge(asoundfx 64)                                                                               ⟨237192⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨237197⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 64, x=0)                                        ⟨237204⟩
    canal_init(canal=canal4, pilote=word_46849)                                                       ⟨237215⟩
    v302 = 0                                                                                          ⟨237217⟩
    tant que v302 < 6 :
        charge(asoundfx (v302 + &v300)→0)                                                             ⟨237237⟩
        canal_enregistre(canal=canal4, ressource=asoundfx (v302 + &v300)→0, x=0)                      ⟨237244⟩
        canal_arrête(canal=canal4)                                                                    ⟨237248⟩
        r18(asoundfx (v302 + &v300)→0).+0 = 0                                                         ⟨237266⟩
        v306 = 0                                                                                      ⟨237268⟩
        v302 = v302 + 1                                                                               ⟨237269⟩
    canal_arrête(canal=canal4)                                                                        ⟨237280⟩
    v3164 = 0                                                                                         ⟨237298⟩
    v3158 = 0                                                                                         ⟨237300⟩
si v10 != 0 :
    Scene_Tick(scène=scène1)                                                                          ⟨237311⟩
    charge(mid5voc 7)                                                                                 ⟨237323⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid5voc 7)                                  ⟨237329⟩
    tant que (scène1.compteur < 30) et (scène1.terminée == 0) :
        r18(asoundfx (v302 + &v300)→0).+0 = scène1.compteur                                           ⟨237336⟩
        si asoundfx (v302 + &v300)→0.+0 < 27 :
            v314 = asoundfx (v302 + &v300)→0.+0                                                       ⟨237344⟩
            c3.image = v314                                                                           ⟨237347⟩
            si v11 != 0 :
                si asoundfx (v302 + &v300)→0.+0 < 27 :
                    si asoundfx (v302 + &v300)→0.+0 % 8 == 0 :
                        v316 = word_48F4C                                                             ⟨237367⟩
                        v318 = 0                                                                      ⟨237368⟩
                        si canal2.+0 != 0 :
                            AIL_start_sequence(pilote=canal2.+0→4, séquence=v3138)                    ⟨237374⟩
                            AIL_set_relative_volume_30C66(canal2.+0→4, v3138, v316, v318)             ⟨237381⟩
                    sinon :
                        si asoundfx (v302 + &v300)→0.+0 % 8 == 4 :
                            v320 = word_48F22                                                         ⟨237397⟩
                            v322 = 0                                                                  ⟨237398⟩
                            si canal3.+0 != 0 :
                                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3152)                ⟨237404⟩
                                AIL_set_relative_volume_30C66(canal3.+0→4, v3152, v320, v322)         ⟨237411⟩
        si asoundfx (v302 + &v300)→0.+0 == 20 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨237422⟩
        Scene_Tick(scène=scène1)                                                                      ⟨237438⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène1)                                                                      ⟨237480⟩
    voix_arrête(voix=voix1)                                                                           ⟨237494⟩
    v304 = 0                                                                                          ⟨237514⟩
sinon :
    v492→0.méthode8(128)                                                                              ⟨237523⟩
    tant que (scène1.compteur < 30) et (scène1.terminée == 0) :
        v302 = scène1.compteur                                                                        ⟨237530⟩
        si v302 < 27 :
            v304 = v302                                                                               ⟨237538⟩
            c3.image = v304                                                                           ⟨237541⟩
            si ? != 0 :
                si v302 % 8 == 0 :
                    v306 = word_48F4C                                                                 ⟨237569⟩
                    v308 = 0                                                                          ⟨237570⟩
                    si canal2.+0 != 0 :
                        AIL_start_sequence(pilote=canal2.+0→4, séquence=v3138)                        ⟨237576⟩
                        AIL_set_relative_volume_30C66(canal2.+0→4, v3138, v306, v308)                 ⟨237583⟩
                sinon :
                    si v302 % 8 == 4 :
                        r18(asoundfx (v302 + &v300)→0).+0 = 0                                         ⟨237600⟩
                        si canal3.+0 != 0 :
                            AIL_start_sequence(pilote=canal3.+0→4, séquence=v3152)                    ⟨237606⟩
                            AIL_set_relative_volume_30C66(canal3.+0→4, v3152, word_48F22, asoundfx (v302 + &v300)→0.+0)  ⟨237613⟩
        si v302 == 20 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[0])                              ⟨237624⟩
        Scene_Tick(scène=scène1)                                                                      ⟨237656⟩
canal_arrête(canal=canal3)                                                                            ⟨237684⟩
v3150 = 0                                                                                             ⟨237702⟩
canal_arrête(canal=canal2)                                                                            ⟨237707⟩
v3136 = 0                                                                                             ⟨237725⟩
v3131 = 0                                                                                             ⟨237726⟩
v3130 = 0                                                                                             ⟨237727⟩
v288 = 0                                                                                              ⟨237746⟩
v278 = 0                                                                                              ⟨237765⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨237769⟩
v256 = 0                                                                                              ⟨237794⟩
v247 = 0                                                                                              ⟨237812⟩
v246 = 0                                                                                              ⟨237813⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨237842⟩
    v226 = 0                                                                                          ⟨237843⟩
    v211 = 0                                                                                          ⟨237866⟩
    v210 = 0                                                                                          ⟨237867⟩
    v195 = 0                                                                                          ⟨237890⟩
    v194 = 0                                                                                          ⟨237891⟩
    v179 = 0                                                                                          ⟨237914⟩
    v178 = 0                                                                                          ⟨237915⟩
    v169 = 0                                                                                          ⟨237933⟩
    v168 = 0                                                                                          ⟨237934⟩
    v153 = 0                                                                                          ⟨237957⟩
    v152 = 0                                                                                          ⟨237958⟩
    v143 = 0                                                                                          ⟨237976⟩
    v142 = 0                                                                                          ⟨237977⟩
    v127 = 0                                                                                          ⟨238000⟩
    v126 = 0                                                                                          ⟨238001⟩
    v117 = 0                                                                                          ⟨238019⟩
    v116 = 0                                                                                          ⟨238020⟩
    v101 = 0                                                                                          ⟨238043⟩
    v100 = 0                                                                                          ⟨238044⟩
    v85 = 0                                                                                           ⟨238067⟩
    v84 = 0                                                                                           ⟨238068⟩
    v75 = 0                                                                                           ⟨238086⟩
    v74 = 0                                                                                           ⟨238087⟩
    voix_arrête(voix=voix1)                                                                           ⟨238096⟩
    v3076 = 0                                                                                         ⟨238114⟩
    v3071 = 0                                                                                         ⟨238115⟩
    v3070 = 0                                                                                         ⟨238116⟩
    canal_arrête(canal=canal1)                                                                        ⟨238119⟩
    v1002 = 0                                                                                         ⟨238137⟩
    v997 = 0                                                                                          ⟨238138⟩
    v996 = 0                                                                                          ⟨238139⟩
    v59 = 0                                                                                           ⟨238162⟩
    v58 = 0                                                                                           ⟨238163⟩
    v34 = 0                                                                                           ⟨238204⟩
    v29 = 0                                                                                           ⟨238205⟩
    v28 = 0                                                                                           ⟨238206⟩
    retour                                                                                            ⟨238228⟩
v248 = 2                                                                                              ⟨238233⟩
v247 = 0                                                                                              ⟨238234⟩
v246 = 0                                                                                              ⟨238235⟩
charge(mid5 2)                                                                                        ⟨238242⟩
v256 = 0                                                                                              ⟨238247⟩
charge(mid5 6)                                                                                        ⟨238254⟩
charge(mid5 7)                                                                                        ⟨238266⟩
charge(mid5 15)                                                                                       ⟨238278⟩
palette_depuis(pal11(mid5 15))                                                                        ⟨238285⟩

──── scène2 ────
scène2 = Scene_Create(cadence=6, palette=255, surface=&v440)                                          ⟨238293⟩
c4 = Layer(ressource=mid5 2, x=0, y=0)                                                                ⟨238300⟩
c5 = Layer(ressource=mid5 7, x=40, y=0)                                                               ⟨238308⟩
c6 = Layer(ressource=mid5 6, x=0, y=0)                                                                ⟨238316⟩
palette_copie(destination=pal1, source=pal3(mid5 17))                                                 ⟨238326⟩
palette_copie(destination=pal1, source=pal11(mid5 15))                                                ⟨238335⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨238347⟩
v304 = 0                                                                                              ⟨238349⟩
v300 = 2                                                                                              ⟨238350⟩
v299 = 0                                                                                              ⟨238351⟩
v298 = 0                                                                                              ⟨238352⟩
v314 = 0                                                                                              ⟨238353⟩
v308 = 0                                                                                              ⟨238356⟩
v3136 = 0                                                                                             ⟨238357⟩
v3132 = 2                                                                                             ⟨238358⟩
v3131 = 0                                                                                             ⟨238359⟩
v3130 = 0                                                                                             ⟨238360⟩
v3138 = -1                                                                                            ⟨238362⟩
v3150 = 0                                                                                             ⟨238363⟩
v3152 = -1                                                                                            ⟨238368⟩
si v11 != 0 :
    charge(asoundfx 85)                                                                               ⟨238377⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨238382⟩
    canal_enregistre(canal=canal2, ressource=asoundfx 85, x=0)                                        ⟨238389⟩
    charge(asoundfx 64)                                                                               ⟨238397⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨238402⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 64, x=0)                                        ⟨238409⟩
ajoute c4 à scène2                                                                                    ⟨238416⟩
ajoute c5 à scène2                                                                                    ⟨238421⟩
ajoute c6 à scène2                                                                                    ⟨238426⟩
si v10 != 0 :
    Scene_Tick(scène=scène2)                                                                          ⟨238436⟩
    charge(mid5voc 2)                                                                                 ⟨238448⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid5voc 2)                                  ⟨238454⟩
    tant que (scène2.compteur < 10) et (scène2.terminée == 0) :
        v336 = scène2.compteur                                                                        ⟨238461⟩
        si v336 == 2 :
            si v11 != 0 :
                v338 = word_48F4C + 50                                                                ⟨238468⟩
                si canal2.+0 != 0 :
                    AIL_start_sequence(pilote=canal2.+0→4, séquence=v3138)                            ⟨238475⟩
                    AIL_set_relative_volume_30C66(canal2.+0→4, v3138, v338, 0)                        ⟨238482⟩
        si v336 == 5 :
            si v11 != 0 :
                v342 = word_48F22 + 50                                                                ⟨238494⟩
                v344 = 0                                                                              ⟨238495⟩
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3152)                            ⟨238501⟩
                    AIL_set_relative_volume_30C66(canal3.+0→4, v3152, v342, v344)                     ⟨238508⟩
        si v336 < 8 :
            v346 = v336                                                                               ⟨238517⟩
            c5.image = v346                                                                           ⟨238520⟩
        si v336 == 5 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨238528⟩
        Scene_Tick(scène=scène2)                                                                      ⟨238544⟩
    voix_arrête(voix=voix1)                                                                           ⟨238572⟩
    charge(mid5voc 8)                                                                                 ⟨238584⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid5voc 8)                                  ⟨238590⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨238595⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène2)                                                                      ⟨238613⟩
    voix_arrête(voix=voix1)                                                                           ⟨238627⟩
    v328 = 0                                                                                          ⟨238647⟩
    v318 = 0                                                                                          ⟨238666⟩
sinon :
    v492→0.méthode8(129)                                                                              ⟨238675⟩
    tant que (scène2.compteur < 10) et (scène2.terminée == 0) :
        v316 = scène2.compteur                                                                        ⟨238682⟩
        si v316 == 2 :
            si v11 != 0 :
                v318 = word_48F4C + 50                                                                ⟨238689⟩
                v320 = 0                                                                              ⟨238690⟩
                si canal2.+0 != 0 :
                    AIL_start_sequence(pilote=canal2.+0→4, séquence=v3138)                            ⟨238696⟩
                    AIL_set_relative_volume_30C66(canal2.+0→4, v3138, v318, v320)                     ⟨238703⟩
        si v316 == 5 :
            si v11 != 0 :
                v322 = word_48F22 + 50                                                                ⟨238715⟩
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3152)                            ⟨238722⟩
                    AIL_set_relative_volume_30C66(canal3.+0→4, v3152, v322, mid5voc 2.+0)             ⟨238729⟩
        si v316 < 8 :
            v326 = v316                                                                               ⟨238738⟩
            c5.image = v326                                                                           ⟨238741⟩
        si v316 == 5 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[1])                              ⟨238751⟩
        Scene_Tick(scène=scène2)                                                                      ⟨238783⟩
    tant que (scène2.compteur < 14) et (scène2.terminée == 0) :
        v316 = scène2.compteur                                                                        ⟨238814⟩
        si v316 == 11 :
            v3166 = 4540                                                                              ⟨238817⟩
            v3166 = 4552                                                                              ⟨238818⟩
            v3166 = 4568                                                                              ⟨238819⟩
            v3166 = 4584                                                                              ⟨238820⟩
            v3166 = 4604                                                                              ⟨238821⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3166, v487, v485, v483, v481, 0, &v510)             ⟨238831⟩
        Scene_Tick(scène=scène2)                                                                      ⟨238863⟩
    v492→0.méthode8(128)                                                                              ⟨238893⟩
    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[2])                                      ⟨238902⟩
    tant que (scène2.compteur < 30) et (scène2.terminée == 0) :
        v316 = scène2.compteur                                                                        ⟨238909⟩
        si v316 == 25 :
            v3166 = 4540                                                                              ⟨238912⟩
            v3166 = 4552                                                                              ⟨238913⟩
            v3166 = 4568                                                                              ⟨238914⟩
            v3166 = 4584                                                                              ⟨238915⟩
            v3166 = 4604                                                                              ⟨238916⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3166, v487, v485, v483, v481, 0, &v510)             ⟨238926⟩
        Scene_Tick(scène=scène2)                                                                      ⟨238958⟩
canal_arrête(canal=canal3)                                                                            ⟨238986⟩
v3150 = 0                                                                                             ⟨239004⟩
canal_arrête(canal=canal2)                                                                            ⟨239009⟩
v3136 = 0                                                                                             ⟨239027⟩
v3131 = 0                                                                                             ⟨239028⟩
v3130 = 0                                                                                             ⟨239029⟩
v308 = 0                                                                                              ⟨239048⟩
v298 = 0                                                                                              ⟨239067⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨239071⟩
v276 = 0                                                                                              ⟨239096⟩
v266 = 0                                                                                              ⟨239115⟩
v256 = 0                                                                                              ⟨239134⟩
v247 = 0                                                                                              ⟨239152⟩
v246 = 0                                                                                              ⟨239153⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨239182⟩
    v226 = 0                                                                                          ⟨239183⟩
    v211 = 0                                                                                          ⟨239206⟩
    v210 = 0                                                                                          ⟨239207⟩
    v195 = 0                                                                                          ⟨239230⟩
    v194 = 0                                                                                          ⟨239231⟩
    v179 = 0                                                                                          ⟨239254⟩
    v178 = 0                                                                                          ⟨239255⟩
    v169 = 0                                                                                          ⟨239273⟩
    v168 = 0                                                                                          ⟨239274⟩
    v153 = 0                                                                                          ⟨239297⟩
    v152 = 0                                                                                          ⟨239298⟩
    v143 = 0                                                                                          ⟨239316⟩
    v142 = 0                                                                                          ⟨239317⟩
    v127 = 0                                                                                          ⟨239340⟩
    v126 = 0                                                                                          ⟨239341⟩
    v117 = 0                                                                                          ⟨239359⟩
    v116 = 0                                                                                          ⟨239360⟩
    v101 = 0                                                                                          ⟨239383⟩
    v100 = 0                                                                                          ⟨239384⟩
    v85 = 0                                                                                           ⟨239407⟩
    v84 = 0                                                                                           ⟨239408⟩
    v75 = 0                                                                                           ⟨239426⟩
    v74 = 0                                                                                           ⟨239427⟩
    voix_arrête(voix=voix1)                                                                           ⟨239436⟩
    v3076 = 0                                                                                         ⟨239454⟩
    v3071 = 0                                                                                         ⟨239455⟩
    v3070 = 0                                                                                         ⟨239456⟩
    canal_arrête(canal=canal1)                                                                        ⟨239459⟩
    v1002 = 0                                                                                         ⟨239477⟩
    v997 = 0                                                                                          ⟨239478⟩
    v996 = 0                                                                                          ⟨239479⟩
    v59 = 0                                                                                           ⟨239502⟩
    v58 = 0                                                                                           ⟨239503⟩
    v34 = 0                                                                                           ⟨239544⟩
    v29 = 0                                                                                           ⟨239545⟩
    v28 = 0                                                                                           ⟨239546⟩
    retour                                                                                            ⟨239568⟩
v248 = 2                                                                                              ⟨239573⟩
v247 = 0                                                                                              ⟨239574⟩
v246 = 0                                                                                              ⟨239575⟩
charge_convdata_type0("goon", drapeau=3)                                                              ⟨239580⟩
v256 = 0                                                                                              ⟨239585⟩
charge(mid5 4)                                                                                        ⟨239592⟩

──── scène3 ────
scène3 = Scene_Create(cadence=9, palette=255, surface=&v440)                                          ⟨239600⟩
c7 = Layer(ressource=mid5 1, x=0, y=0)                                                                ⟨239607⟩
c8 = Layer(ressource=mid5 4, x=0, y=-11)                                                              ⟨239615⟩
c9 = TalkingHead(ressource=convdata type 0 "goon", x=160, y=128)                                      ⟨239623⟩
palette_copie(destination=pal1, source=pal4(mid5 18))                                                 ⟨239633⟩
palette_copie(destination=pal1, source=pal9(convdata type 2 "night"))                                 ⟨239642⟩
v3136 = 0                                                                                             ⟨239652⟩
v3132 = 2                                                                                             ⟨239653⟩
v3131 = 0                                                                                             ⟨239654⟩
v3130 = 0                                                                                             ⟨239655⟩
v3138 = -1                                                                                            ⟨239657⟩
si v11 != 0 :
    charge(asoundfx 63)                                                                               ⟨239666⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨239671⟩
    canal_enregistre(canal=canal2, ressource=asoundfx 63, x=0)                                        ⟨239678⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨239688⟩
ajoute c7 à scène3                                                                                    ⟨239693⟩
ajoute c9 à scène3                                                                                    ⟨239698⟩
v280 = 0                                                                                              ⟨239700⟩
tête_image_de_base(tête=c9, image=27)                                                                 ⟨239703⟩
si v10 != 0 :
    Scene_Tick(scène=scène3)                                                                          ⟨239713⟩
    charge(mid5voc 9)                                                                                 ⟨239725⟩
    tête_voix(tête=c9, ressource=mid5voc 9, cadence=9)                                                ⟨239731⟩
    v292 = 0                                                                                          ⟨239733⟩
    tant que v292 < 3 :
        Scene_Tick(scène=scène3)                                                                      ⟨239740⟩
        v292 = v292 + 1                                                                               ⟨239742⟩
    tant que tête_parle(tête=c9) != 0 :
        Scene_Tick(scène=scène3)                                                                      ⟨239763⟩
    scène3.compteur = 0                                                                               ⟨239774⟩
    tant que (scène3.compteur < 12) et (scène3.terminée == 0) :
        si scène3.compteur == 0 :
            ajoute c8 à scène3                                                                        ⟨239786⟩
        si scène3.compteur < 4 :
            v306 = v280                                                                               ⟨239793⟩
            v280_avant = v280                                                                         ⟨239794⟩
            v280 = v280 + 1                                                                           ⟨239794⟩
            c8.image = v306                                                                           ⟨239797⟩
        si scène3.compteur == 8 :
            si v11 != 0 :
                v308 = word_48F20                                                                     ⟨239805⟩
                si canal2.+0 != 0 :
                    AIL_start_sequence(pilote=canal2.+0→4, séquence=v3138)                            ⟨239812⟩
                    AIL_set_relative_volume_30C66(canal2.+0→4, v3138, v308, mid5voc 7.+0)             ⟨239819⟩
        si scène3.compteur > 7 :
            si si + 11 > scène3.compteur :
                r18(asoundfx (v302 + &v300)→0).+0 = v280                                              ⟨239832⟩
                v280_avant = v280                                                                     ⟨239833⟩
                v280 = v280 + 1                                                                       ⟨239833⟩
                c8.image = asoundfx (v302 + &v300)→0.+0                                               ⟨239836⟩
        si scène3.compteur == 11 :
            c8.image = 5                                                                              ⟨239843⟩
        Scene_Tick(scène=scène3)                                                                      ⟨239858⟩
    charge(mid5voc 10)                                                                                ⟨239894⟩
    tête_voix(tête=c9, ressource=mid5voc 10, cadence=9)                                               ⟨239900⟩
    v292 = 0                                                                                          ⟨239902⟩
    tant que v292 < 3 :
        Scene_Tick(scène=scène3)                                                                      ⟨239909⟩
        v292 = v292 + 1                                                                               ⟨239911⟩
    tant que tête_parle(tête=c9) != 0 :
        Scene_Tick(scène=scène3)                                                                      ⟨239932⟩
    v292 = 0                                                                                          ⟨239943⟩
    tant que v292 < 2 :
        Scene_Tick(scène=scène3)                                                                      ⟨239950⟩
        v292 = v292 + 1                                                                               ⟨239952⟩
sinon :
    v492→0.méthode8(125)                                                                              ⟨240003⟩
    v4 = 35                                                                                           ⟨240005⟩
    si = scène3.compteur                                                                              ⟨240006⟩
    tant que (scène3.compteur < si + ((v4·70) / 100)) et (scène3.terminée == 0) :
        si si + 2 == scène3.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[3])                              ⟨240034⟩
        si si + 2 == scène3.compteur :
            tête_texte_de_lèvres(tête=c9, texte="Jtfrkovtadrkz")                                      ⟨240044⟩
        si (si + ((v4·70) / 100)) - 1 == scène3.compteur :
            v3152 = 4540                                                                              ⟨240052⟩
            v3152 = 4552                                                                              ⟨240053⟩
            v3152 = 4568                                                                              ⟨240054⟩
            v3152 = 4584                                                                              ⟨240055⟩
            v3152 = 4604                                                                              ⟨240056⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3152, v487, v485, v483, v481, 0, &v510)             ⟨240066⟩
        Scene_Tick(scène=scène3)                                                                      ⟨240098⟩
    v4_avant = si + ((v4·70) / 100)                                                                   ⟨240124⟩
    v4 = 76                                                                                           ⟨240124⟩
    si = scène3.compteur                                                                              ⟨240125⟩
    tant que (scène3.compteur < si + ((v4·70) / 100)) et (scène3.terminée == 0) :
        si scène3.compteur == si :
            ajoute c8 à scène3                                                                        ⟨240146⟩
        si si + 4 > scène3.compteur :
            v280_avant = v280                                                                         ⟨240156⟩
            v280_avant = v280                                                                         ⟨240156⟩
            v280 = v280 + 1                                                                           ⟨240156⟩
            c8.image = v280_avant                                                                     ⟨240159⟩
        si si + 8 == scène3.compteur :
            si v11 != 0 :
                v286 = word_48F20                                                                     ⟨240169⟩
                pal11(mid5 15).+0 = 0                                                                 ⟨240170⟩
                si canal2.+0 != 0 :
                    AIL_start_sequence(pilote=canal2.+0→4, séquence=v3138)                            ⟨240176⟩
                    AIL_set_relative_volume_30C66(canal2.+0→4, v3138, v286, pal11(mid5 15).+0)        ⟨240183⟩
        si si + 7 < scène3.compteur :
            si si + 11 > scène3.compteur :
                v280_avant = v280                                                                     ⟨240199⟩
                v280_avant = v280                                                                     ⟨240199⟩
                v280 = v280 + 1                                                                       ⟨240199⟩
                c8.image = v280_avant                                                                 ⟨240202⟩
        si si + 11 == scène3.compteur :
            c8.image = 5                                                                              ⟨240211⟩
        si si + 18 == scène3.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[4])                              ⟨240225⟩
        si si + 18 == scène3.compteur :
            tête_texte_de_lèvres(tête=c9, texte="mabewtchakpwvyerz")                                  ⟨240235⟩
        si (si + ((v4·70) / 100)) - 1 == scène3.compteur :
            v3152 = 4540                                                                              ⟨240243⟩
            v3152 = 4552                                                                              ⟨240244⟩
            v3152 = 4568                                                                              ⟨240245⟩
            v3152 = 4584                                                                              ⟨240246⟩
            v3152 = 4604                                                                              ⟨240247⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3152, v487, v485, v483, v481, 0, &v510)             ⟨240257⟩
        Scene_Tick(scène=scène3)                                                                      ⟨240289⟩
canal_arrête(canal=canal2)                                                                            ⟨240317⟩
v3136 = 0                                                                                             ⟨240335⟩
v3131 = 0                                                                                             ⟨240336⟩
v3130 = 0                                                                                             ⟨240337⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨240360⟩
v256 = 0                                                                                              ⟨240380⟩
v247 = 0                                                                                              ⟨240398⟩
v246 = 0                                                                                              ⟨240399⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨240428⟩
    v226 = 0                                                                                          ⟨240429⟩
    v211 = 0                                                                                          ⟨240452⟩
    v210 = 0                                                                                          ⟨240453⟩
    v195 = 0                                                                                          ⟨240476⟩
    v194 = 0                                                                                          ⟨240477⟩
    v179 = 0                                                                                          ⟨240500⟩
    v178 = 0                                                                                          ⟨240501⟩
    v169 = 0                                                                                          ⟨240519⟩
    v168 = 0                                                                                          ⟨240520⟩
    v153 = 0                                                                                          ⟨240543⟩
    v152 = 0                                                                                          ⟨240544⟩
    v143 = 0                                                                                          ⟨240562⟩
    v142 = 0                                                                                          ⟨240563⟩
    v127 = 0                                                                                          ⟨240586⟩
    v126 = 0                                                                                          ⟨240587⟩
    v117 = 0                                                                                          ⟨240605⟩
    v116 = 0                                                                                          ⟨240606⟩
    v101 = 0                                                                                          ⟨240629⟩
    v100 = 0                                                                                          ⟨240630⟩
    v85 = 0                                                                                           ⟨240653⟩
    v84 = 0                                                                                           ⟨240654⟩
    v75 = 0                                                                                           ⟨240672⟩
    v74 = 0                                                                                           ⟨240673⟩
    voix_arrête(voix=voix1)                                                                           ⟨240682⟩
    v3076 = 0                                                                                         ⟨240700⟩
    v3071 = 0                                                                                         ⟨240701⟩
    v3070 = 0                                                                                         ⟨240702⟩
    canal_arrête(canal=canal1)                                                                        ⟨240705⟩
    v1002 = 0                                                                                         ⟨240723⟩
    v997 = 0                                                                                          ⟨240724⟩
    v996 = 0                                                                                          ⟨240725⟩
    v59 = 0                                                                                           ⟨240748⟩
    v58 = 0                                                                                           ⟨240749⟩
    v34 = 0                                                                                           ⟨240790⟩
    v29 = 0                                                                                           ⟨240791⟩
    v28 = 0                                                                                           ⟨240792⟩
    retour                                                                                            ⟨240814⟩
v248 = 2                                                                                              ⟨240819⟩
v247 = 0                                                                                              ⟨240820⟩
v246 = 0                                                                                              ⟨240821⟩
charge_convdata_type0("air", drapeau=2)                                                               ⟨240826⟩

──── scène4 ────
scène4 = Scene_Create(cadence=9, palette=255, surface=&v440)                                          ⟨240834⟩
c10 = Layer(ressource=mid5 11, x=0, y=0)                                                              ⟨240841⟩
c11 = TalkingHead(ressource=convdata type 0 "air", x=160, y=128)                                      ⟨240849⟩
palette_copie(destination=pal1, source=pal5(mid5 22))                                                 ⟨240859⟩
palette_copie(destination=pal1, source=pal9(convdata type 2 "night"))                                 ⟨240868⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨240880⟩
ajoute c10 à scène4                                                                                   ⟨240885⟩
ajoute c11 à scène4                                                                                   ⟨240890⟩
tête_image_de_base(tête=c11, image=33)                                                                ⟨240894⟩
si v10 != 0 :
    Scene_Tick(scène=scène4)                                                                          ⟨240904⟩
    charge(mid5voc 3)                                                                                 ⟨240916⟩
    tête_voix(tête=c11, ressource=mid5voc 3, cadence=9)                                               ⟨240922⟩
    pal10(mid5 16).+0 = 0                                                                             ⟨240924⟩
    tant que pal10(mid5 32).+0 < 3 :
        Scene_Tick(scène=scène4)                                                                      ⟨240931⟩
        pal10(mid5 16).+0 = pal10(mid5 32).+0 + 1                                                     ⟨240933⟩
    tant que tête_parle(tête=c11) != 0 :
        Scene_Tick(scène=scène4)                                                                      ⟨240954⟩
    tête_image_de_base(tête=c11, image=14)                                                            ⟨240967⟩
    Scene_Tick(scène=scène4)                                                                          ⟨240971⟩
    charge(mid5voc 4)                                                                                 ⟨240983⟩
    tête_voix(tête=c11, ressource=mid5voc 4, cadence=9)                                               ⟨240989⟩
    pal10(mid5 16).+0 = 0                                                                             ⟨240991⟩
    tant que pal10(mid5 32).+0 < 3 :
        Scene_Tick(scène=scène4)                                                                      ⟨240998⟩
        pal10(mid5 16).+0 = pal10(mid5 32).+0 + 1                                                     ⟨241000⟩
    tant que tête_parle(tête=c11) != 0 :
        Scene_Tick(scène=scène4)                                                                      ⟨241021⟩
    pal10(mid5 16).+0 = 0                                                                             ⟨241032⟩
    tant que pal10(mid5 32).+0 < 2 :
        Scene_Tick(scène=scène4)                                                                      ⟨241039⟩
        pal10(mid5 16).+0 = pal10(mid5 32).+0 + 1                                                     ⟨241041⟩
    v260 = 0                                                                                          ⟨241083⟩
sinon :
    v492→0.méthode8(125)                                                                              ⟨241092⟩
    v4 = 40                                                                                           ⟨241094⟩
    si = scène4.compteur                                                                              ⟨241095⟩
    tant que (scène4.compteur < si + ((v4·70) / 100)) et (scène4.terminée == 0) :
        v258 = scène4.compteur                                                                        ⟨241110⟩
        si si + 2 == v258 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[5])                              ⟨241123⟩
        si si + 2 == v258 :
            tête_texte_de_lèvres(tête=c11, texte="hwabtakntrofer")                                    ⟨241133⟩
        si (si + ((v4·70) / 100)) - 1 == v258 :
            v3138 = 4540                                                                              ⟨241141⟩
            v3138 = 4552                                                                              ⟨241142⟩
            v3138 = 4568                                                                              ⟨241143⟩
            v3138 = 4584                                                                              ⟨241144⟩
            v3138 = 4604                                                                              ⟨241145⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3138, v487, v485, v483, v481, 0, &v510)             ⟨241155⟩
        Scene_Tick(scène=scène4)                                                                      ⟨241187⟩
    tête_image_de_base(tête=c11, image=14)                                                            ⟨241215⟩
    v4_avant = si + ((v4·70) / 100)                                                                   ⟨241217⟩
    v4 = 30                                                                                           ⟨241217⟩
    si = scène4.compteur                                                                              ⟨241218⟩
    tant que (scène4.compteur < si + ((v4·70) / 100)) et (scène4.terminée == 0) :
        v258 = scène4.compteur                                                                        ⟨241233⟩
        si si + 1 == v258 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])                              ⟨241246⟩
        si si + 2 == v258 :
            tête_texte_de_lèvres(tête=c11, texte="ilkpmimne")                                         ⟨241256⟩
        si (si + ((v4·70) / 100)) - 2 == v258 :
            tête_image_de_base(tête=c11, image=25)                                                    ⟨241266⟩
        si (si + ((v4·70) / 100)) - 1 == v258 :
            v3138 = 4540                                                                              ⟨241274⟩
            v3138 = 4552                                                                              ⟨241275⟩
            v3138 = 4568                                                                              ⟨241276⟩
            v3138 = 4584                                                                              ⟨241277⟩
            v3138 = 4604                                                                              ⟨241278⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3138, v487, v485, v483, v481, 0, &v510)             ⟨241288⟩
        Scene_Tick(scène=scène4)                                                                      ⟨241320⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨241349⟩
v247 = 0                                                                                              ⟨241368⟩
v246 = 0                                                                                              ⟨241369⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨241398⟩
    v226 = 0                                                                                          ⟨241399⟩
    v211 = 0                                                                                          ⟨241422⟩
    v210 = 0                                                                                          ⟨241423⟩
    v195 = 0                                                                                          ⟨241446⟩
    v194 = 0                                                                                          ⟨241447⟩
    v179 = 0                                                                                          ⟨241470⟩
    v178 = 0                                                                                          ⟨241471⟩
    v169 = 0                                                                                          ⟨241489⟩
    v168 = 0                                                                                          ⟨241490⟩
    v153 = 0                                                                                          ⟨241513⟩
    v152 = 0                                                                                          ⟨241514⟩
    v143 = 0                                                                                          ⟨241532⟩
    v142 = 0                                                                                          ⟨241533⟩
    v127 = 0                                                                                          ⟨241556⟩
    v126 = 0                                                                                          ⟨241557⟩
    v117 = 0                                                                                          ⟨241575⟩
    v116 = 0                                                                                          ⟨241576⟩
    v101 = 0                                                                                          ⟨241599⟩
    v100 = 0                                                                                          ⟨241600⟩
    v85 = 0                                                                                           ⟨241623⟩
    v84 = 0                                                                                           ⟨241624⟩
    v75 = 0                                                                                           ⟨241642⟩
    v74 = 0                                                                                           ⟨241643⟩
    voix_arrête(voix=voix1)                                                                           ⟨241652⟩
    v3076 = 0                                                                                         ⟨241670⟩
    v3071 = 0                                                                                         ⟨241671⟩
    v3070 = 0                                                                                         ⟨241672⟩
    canal_arrête(canal=canal1)                                                                        ⟨241675⟩
    v1002 = 0                                                                                         ⟨241693⟩
    v997 = 0                                                                                          ⟨241694⟩
    v996 = 0                                                                                          ⟨241695⟩
    v59 = 0                                                                                           ⟨241718⟩
    v58 = 0                                                                                           ⟨241719⟩
    v34 = 0                                                                                           ⟨241760⟩
    v29 = 0                                                                                           ⟨241761⟩
    v28 = 0                                                                                           ⟨241762⟩
    retour                                                                                            ⟨241784⟩
v248 = 2                                                                                              ⟨241789⟩
v247 = 0                                                                                              ⟨241790⟩
v246 = 0                                                                                              ⟨241791⟩
charge(mid5 0)                                                                                        ⟨241798⟩
charge(mid5 19)                                                                                       ⟨241810⟩
palette_depuis(pal10(mid5 19))                                                                        ⟨241817⟩

──── scène5 ────
scène5 = Scene_Create(cadence=8, palette=255, surface=&v440)                                          ⟨241825⟩
c12 = Layer(ressource=mid5 9, x=0, y=0)                                                               ⟨241832⟩
c13 = Layer(ressource=mid5 0, x=0, y=0)                                                               ⟨241840⟩
palette_copie(destination=pal1, source=pal6(mid5 20))                                                 ⟨241850⟩
palette_copie(destination=pal1, source=pal10(mid5 19))                                                ⟨241859⟩
v3136 = 0                                                                                             ⟨241869⟩
v3132 = 2                                                                                             ⟨241870⟩
v3131 = 0                                                                                             ⟨241871⟩
v3130 = 0                                                                                             ⟨241872⟩
v3138 = -1                                                                                            ⟨241874⟩
si v11 != 0 :
    charge(asoundfx 80)                                                                               ⟨241883⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨241888⟩
    canal_enregistre(canal=canal2, ressource=asoundfx 80, x=0)                                        ⟨241895⟩
v3150 = 0                                                                                             ⟨241903⟩
v3152 = -1                                                                                            ⟨241908⟩
si v11 != 0 :
    charge(asoundfx 85)                                                                               ⟨241917⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨241922⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 85, x=0)                                        ⟨241929⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨241939⟩
ajoute c12 à scène5                                                                                   ⟨241944⟩
ajoute c13 à scène5                                                                                   ⟨241949⟩
tant que (scène5.compteur < 13) et (scène5.terminée == 0) :
    v296 = scène5.compteur                                                                            ⟨241958⟩
    c13.image = v296                                                                                  ⟨241961⟩
    si scène5.compteur == 2 :
        si v11 != 0 :
            v298 = word_48F42                                                                         ⟨241967⟩
            v300 = 0                                                                                  ⟨241968⟩
            si canal2.+0 != 0 :
                AIL_start_sequence(pilote=canal2.+0→4, séquence=v3138)                                ⟨241974⟩
                AIL_set_relative_volume_30C66(canal2.+0→4, v3138, v298, v300)                         ⟨241981⟩
    si scène5.compteur == 3 :
        si v11 != 0 :
            r28(mid5voc 10).+0 = word_48F4C + 40                                                      ⟨241993⟩
            si canal3.+0 != 0 :
                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3152)                                ⟨242000⟩
                AIL_set_relative_volume_30C66(canal3.+0→4, v3152, mid5voc 10.+0, asoundfx 85.+0)      ⟨242007⟩
    Scene_Tick(scène=scène5)                                                                          ⟨242015⟩
canal_arrête(canal=canal3)                                                                            ⟨242042⟩
v3150 = 0                                                                                             ⟨242060⟩
r30(asoundfx 85).+0 = 0                                                                               ⟨242079⟩
v286 = 0                                                                                              ⟨242081⟩
canal_arrête(canal=canal2)                                                                            ⟨242084⟩
v3136 = 0                                                                                             ⟨242102⟩
v3131 = 0                                                                                             ⟨242103⟩
v3130 = 0                                                                                             ⟨242104⟩
v276 = 0                                                                                              ⟨242123⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨242127⟩
v256 = 0                                                                                              ⟨242152⟩
v247 = 0                                                                                              ⟨242170⟩
v246 = 0                                                                                              ⟨242171⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨242200⟩
    v226 = 0                                                                                          ⟨242201⟩
    v211 = 0                                                                                          ⟨242224⟩
    v210 = 0                                                                                          ⟨242225⟩
    v195 = 0                                                                                          ⟨242248⟩
    v194 = 0                                                                                          ⟨242249⟩
    v179 = 0                                                                                          ⟨242272⟩
    v178 = 0                                                                                          ⟨242273⟩
    v169 = 0                                                                                          ⟨242291⟩
    v168 = 0                                                                                          ⟨242292⟩
    v153 = 0                                                                                          ⟨242315⟩
    v152 = 0                                                                                          ⟨242316⟩
    v143 = 0                                                                                          ⟨242334⟩
    v142 = 0                                                                                          ⟨242335⟩
    v127 = 0                                                                                          ⟨242358⟩
    v126 = 0                                                                                          ⟨242359⟩
    v117 = 0                                                                                          ⟨242377⟩
    v116 = 0                                                                                          ⟨242378⟩
    v101 = 0                                                                                          ⟨242401⟩
    v100 = 0                                                                                          ⟨242402⟩
    v85 = 0                                                                                           ⟨242425⟩
    v84 = 0                                                                                           ⟨242426⟩
    v75 = 0                                                                                           ⟨242444⟩
    v74 = 0                                                                                           ⟨242445⟩
    voix_arrête(voix=voix1)                                                                           ⟨242454⟩
    v3076 = 0                                                                                         ⟨242472⟩
    v3071 = 0                                                                                         ⟨242473⟩
    v3070 = 0                                                                                         ⟨242474⟩
    canal_arrête(canal=canal1)                                                                        ⟨242477⟩
    v1002 = 0                                                                                         ⟨242495⟩
    v997 = 0                                                                                          ⟨242496⟩
    v996 = 0                                                                                          ⟨242497⟩
    v59 = 0                                                                                           ⟨242520⟩
    v58 = 0                                                                                           ⟨242521⟩
    v34 = 0                                                                                           ⟨242562⟩
    v29 = 0                                                                                           ⟨242563⟩
    v28 = 0                                                                                           ⟨242564⟩
    retour                                                                                            ⟨242586⟩
v248 = 2                                                                                              ⟨242591⟩
v247 = 0                                                                                              ⟨242592⟩
v246 = 0                                                                                              ⟨242593⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨242598⟩

──── scène6 ────
scène6 = Scene_Create(cadence=9, palette=255, surface=&v440)                                          ⟨242606⟩
c14 = Layer(ressource=mid5 11, x=0, y=0)                                                              ⟨242613⟩
c15 = TalkingHead(ressource=convdata type 0 "air", x=160, y=128)                                      ⟨242621⟩
palette_copie(destination=pal1, source=pal5(mid5 22))                                                 ⟨242631⟩
palette_copie(destination=pal1, source=pal9(convdata type 2 "night"))                                 ⟨242640⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨242652⟩
ajoute c14 à scène6                                                                                   ⟨242657⟩
ajoute c15 à scène6                                                                                   ⟨242662⟩
tête_image_de_base(tête=c15, image=14)                                                                ⟨242666⟩
si v10 != 0 :
    Scene_Tick(scène=scène6)                                                                          ⟨242676⟩
    charge(mid5voc 5)                                                                                 ⟨242688⟩
    tête_voix(tête=c15, ressource=mid5voc 5, cadence=9)                                               ⟨242694⟩
    pal10(mid5 19).+0 = 0                                                                             ⟨242696⟩
    tant que pal10(mid5 32).+0 < 3 :
        Scene_Tick(scène=scène6)                                                                      ⟨242703⟩
        pal10(mid5 19).+0 = pal10(mid5 32).+0 + 1                                                     ⟨242705⟩
    tant que tête_parle(tête=c15) != 0 :
        Scene_Tick(scène=scène6)                                                                      ⟨242726⟩
    pal10(mid5 19).+0 = 0                                                                             ⟨242737⟩
    tant que pal10(mid5 32).+0 < 2 :
        Scene_Tick(scène=scène6)                                                                      ⟨242744⟩
        pal10(mid5 19).+0 = pal10(mid5 32).+0 + 1                                                     ⟨242746⟩
    v260 = 0                                                                                          ⟨242769⟩
sinon :
    v492→0.méthode8(125)                                                                              ⟨242778⟩
    v4 = 44                                                                                           ⟨242780⟩
    si = scène6.compteur                                                                              ⟨242781⟩
    tant que (scène6.compteur < si + ((v4·70) / 100)) et (scène6.terminée == 0) :
        v258 = scène6.compteur                                                                        ⟨242796⟩
        si si + 1 == v258 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[7])                              ⟨242809⟩
        si si + 2 == v258 :
            tête_texte_de_lèvres(tête=c15, texte="ndyulozafwth")                                      ⟨242819⟩
        si (si + ((v4·70) / 100)) - 1 == v258 :
            v3138 = 4540                                                                              ⟨242827⟩
            v3138 = 4552                                                                              ⟨242828⟩
            v3138 = 4568                                                                              ⟨242829⟩
            v3138 = 4584                                                                              ⟨242830⟩
            v3138 = 4604                                                                              ⟨242831⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3138, v487, v485, v483, v481, 0, &v510)             ⟨242841⟩
        Scene_Tick(scène=scène6)                                                                      ⟨242873⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨242902⟩
v247 = 0                                                                                              ⟨242921⟩
v246 = 0                                                                                              ⟨242922⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨242951⟩
    v226 = 0                                                                                          ⟨242952⟩
    v211 = 0                                                                                          ⟨242975⟩
    v210 = 0                                                                                          ⟨242976⟩
    v195 = 0                                                                                          ⟨242999⟩
    v194 = 0                                                                                          ⟨243000⟩
    v179 = 0                                                                                          ⟨243023⟩
    v178 = 0                                                                                          ⟨243024⟩
    v169 = 0                                                                                          ⟨243042⟩
    v168 = 0                                                                                          ⟨243043⟩
    v153 = 0                                                                                          ⟨243066⟩
    v152 = 0                                                                                          ⟨243067⟩
    v143 = 0                                                                                          ⟨243085⟩
    v142 = 0                                                                                          ⟨243086⟩
    v127 = 0                                                                                          ⟨243109⟩
    v126 = 0                                                                                          ⟨243110⟩
    v117 = 0                                                                                          ⟨243128⟩
    v116 = 0                                                                                          ⟨243129⟩
    v101 = 0                                                                                          ⟨243152⟩
    v100 = 0                                                                                          ⟨243153⟩
    v85 = 0                                                                                           ⟨243176⟩
    v84 = 0                                                                                           ⟨243177⟩
    v75 = 0                                                                                           ⟨243195⟩
    v74 = 0                                                                                           ⟨243196⟩
    voix_arrête(voix=voix1)                                                                           ⟨243205⟩
    v3076 = 0                                                                                         ⟨243223⟩
    v3071 = 0                                                                                         ⟨243224⟩
    v3070 = 0                                                                                         ⟨243225⟩
    canal_arrête(canal=canal1)                                                                        ⟨243228⟩
    v1002 = 0                                                                                         ⟨243246⟩
    v997 = 0                                                                                          ⟨243247⟩
    v996 = 0                                                                                          ⟨243248⟩
    v59 = 0                                                                                           ⟨243271⟩
    v58 = 0                                                                                           ⟨243272⟩
    v34 = 0                                                                                           ⟨243313⟩
    v29 = 0                                                                                           ⟨243314⟩
    v28 = 0                                                                                           ⟨243315⟩
    retour                                                                                            ⟨243337⟩
v248 = 2                                                                                              ⟨243342⟩
v247 = 0                                                                                              ⟨243343⟩
v246 = 0                                                                                              ⟨243344⟩
charge(mid5 27)                                                                                       ⟨243351⟩
charge(mid5 28)                                                                                       ⟨243363⟩
charge(mid5 19)                                                                                       ⟨243375⟩
palette_depuis(pal12(mid5 19))                                                                        ⟨243382⟩

──── scène7 ────
scène7 = Scene_Create(cadence=8, palette=255, surface=&v440)                                          ⟨243390⟩
c16 = Layer(ressource=mid5 9, x=0, y=0)                                                               ⟨243397⟩
c17 = Layer(ressource=mid5 27, x=0, y=0)                                                              ⟨243405⟩
c18 = Layer(ressource=mid5 28, x=0, y=0)                                                              ⟨243413⟩
palette_copie(destination=pal1, source=pal6(mid5 20))                                                 ⟨243423⟩
palette_copie(destination=pal1, source=pal12(mid5 19))                                                ⟨243432⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨243444⟩
ajoute c16 à scène7                                                                                   ⟨243449⟩
ajoute c17 à scène7                                                                                   ⟨243454⟩
ajoute c18 à scène7                                                                                   ⟨243459⟩
tant que (scène7.compteur < 21) et (scène7.terminée == 0) :
    v286 = scène7.compteur                                                                            ⟨243466⟩
    pal11(mid5 15).+0 = v286                                                                          ⟨243468⟩
    c17.image = pal11(mid5 30).+0                                                                     ⟨243471⟩
    si v286 == 12 :
        Scene_SetFps(scène=scène7, cadence=7)                                                         ⟨243477⟩
    si v286 == 14 :
        Scene_SetFps(scène=scène7, cadence=6)                                                         ⟨243486⟩
    si v286 == 16 :
        Scene_SetFps(scène=scène7, cadence=5)                                                         ⟨243495⟩
    si v286 == 18 :
        Scene_SetFps(scène=scène7, cadence=4)                                                         ⟨243504⟩
    Scene_Tick(scène=scène7)                                                                          ⟨243510⟩
Scene_Destruct(scène=scène7, drapeaux=0)                                                              ⟨243538⟩
v256 = 0                                                                                              ⟨243582⟩
v247 = 0                                                                                              ⟨243600⟩
v246 = 0                                                                                              ⟨243601⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨243630⟩
    v226 = 0                                                                                          ⟨243631⟩
    v211 = 0                                                                                          ⟨243654⟩
    v210 = 0                                                                                          ⟨243655⟩
    v195 = 0                                                                                          ⟨243678⟩
    v194 = 0                                                                                          ⟨243679⟩
    v179 = 0                                                                                          ⟨243702⟩
    v178 = 0                                                                                          ⟨243703⟩
    v169 = 0                                                                                          ⟨243721⟩
    v168 = 0                                                                                          ⟨243722⟩
    v153 = 0                                                                                          ⟨243745⟩
    v152 = 0                                                                                          ⟨243746⟩
    v143 = 0                                                                                          ⟨243764⟩
    v142 = 0                                                                                          ⟨243765⟩
    v127 = 0                                                                                          ⟨243788⟩
    v126 = 0                                                                                          ⟨243789⟩
    v117 = 0                                                                                          ⟨243807⟩
    v116 = 0                                                                                          ⟨243808⟩
    v101 = 0                                                                                          ⟨243831⟩
    v100 = 0                                                                                          ⟨243832⟩
    v85 = 0                                                                                           ⟨243855⟩
    v84 = 0                                                                                           ⟨243856⟩
    v75 = 0                                                                                           ⟨243874⟩
    v74 = 0                                                                                           ⟨243875⟩
    voix_arrête(voix=voix1)                                                                           ⟨243884⟩
    v3076 = 0                                                                                         ⟨243902⟩
    v3071 = 0                                                                                         ⟨243903⟩
    v3070 = 0                                                                                         ⟨243904⟩
    canal_arrête(canal=canal1)                                                                        ⟨243907⟩
    v1002 = 0                                                                                         ⟨243925⟩
    v997 = 0                                                                                          ⟨243926⟩
    v996 = 0                                                                                          ⟨243927⟩
    v59 = 0                                                                                           ⟨243950⟩
    v58 = 0                                                                                           ⟨243951⟩
    v34 = 0                                                                                           ⟨243992⟩
    v29 = 0                                                                                           ⟨243993⟩
    v28 = 0                                                                                           ⟨243994⟩
    retour                                                                                            ⟨244016⟩
v248 = 2                                                                                              ⟨244021⟩
v247 = 0                                                                                              ⟨244022⟩
v246 = 0                                                                                              ⟨244023⟩
charge(mid5 10)                                                                                       ⟨244030⟩
v256 = 0                                                                                              ⟨244035⟩
charge(mid5 24)                                                                                       ⟨244042⟩
charge(mid5 25)                                                                                       ⟨244054⟩
v276 = 0                                                                                              ⟨244059⟩
charge(mid5 26)                                                                                       ⟨244066⟩
r30(asoundfx 85).+0 = 0                                                                               ⟨244068⟩
v286 = 0                                                                                              ⟨244071⟩
charge(mid5 21)                                                                                       ⟨244078⟩
palette_depuis(pal13(mid5 21))                                                                        ⟨244085⟩

──── scène8 ────
scène8 = Scene_Create(cadence=12, palette=255, surface=&v440)                                         ⟨244093⟩
c19 = Layer(ressource=mid5 11, x=0, y=0)                                                              ⟨244100⟩
c20 = ImageLayer(ressource=mid5 10, x=0, y=0, image=0)                                                ⟨244109⟩
c21 = ImageLayer(ressource=mid5 10, x=10, y=0, image=1)                                               ⟨244118⟩
c22 = ImageLayer(ressource=mid5 24, x=0, y=0, image=0)                                                ⟨244127⟩
c23 = OverlayImageLayer(ressource=mid5 25, x=0, y=0, image=1)                                         ⟨244136⟩
c24 = Layer(ressource=mid5 26, x=0, y=0)                                                              ⟨244144⟩
palette_copie(destination=pal1, source=pal5(mid5 22))                                                 ⟨244154⟩
palette_copie(destination=pal1, source=pal13(mid5 21))                                                ⟨244163⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨244175⟩
ajoute c19 à scène8                                                                                   ⟨244180⟩
ajoute c20 à scène8                                                                                   ⟨244185⟩
ajoute c21 à scène8                                                                                   ⟨244190⟩
ajoute c22 à scène8                                                                                   ⟨244195⟩
ajoute c23 à scène8                                                                                   ⟨244200⟩
r18(asoundfx (v302 + &v300)→0).+0 = 1                                                                 ⟨244202⟩
tant que (scène8.compteur < 38) et (scène8.terminée == 0) :
    v316 = scène8.compteur                                                                            ⟨244209⟩
    si v316 > 1 :
        si v316 < 5 :
            v318 = asoundfx (v302 + &v300)→0.+0                                                       ⟨244215⟩
            r18(asoundfx (v302 + &v300)→0).+0 = asoundfx (v302 + &v300)→0.+0 + 1                      ⟨244216⟩
            c23.image = v318                                                                          ⟨244219⟩
    si v316 > 13 :
        si v316 < 18 :
            v320 = asoundfx (v302 + &v300)→0.+0                                                       ⟨244228⟩
            r18(asoundfx (v302 + &v300)→0).+0 = asoundfx (v302 + &v300)→0.+0 + 1                      ⟨244229⟩
            c23.image = v320                                                                          ⟨244232⟩
    si v316 == 18 :
        retire(parent=scène8, calque=c23)                                                             ⟨244241⟩
        ajoute c24 à scène8                                                                           ⟨244246⟩
    si v316 == 28 :
        v322 = asoundfx 84.+0                                                                         ⟨244253⟩
        c24.image = v322                                                                              ⟨244256⟩
    si v316 == 29 :
        retire(parent=scène8, calque=c24)                                                             ⟨244264⟩
        c24.détruit(3)                                                                                ⟨244272⟩
        ajoute c23 à scène8                                                                           ⟨244280⟩
        c23.image = asoundfx (v302 + &v300)→0.+0                                                      ⟨244286⟩
    si v316 > 29 :
        si v316 < 31 :
            v326 = asoundfx (v302 + &v300)→0.+0                                                       ⟨244294⟩
            r18(asoundfx (v302 + &v300)→0).+0 = asoundfx (v302 + &v300)→0.+0 + 1                      ⟨244295⟩
            c23.image = v326                                                                          ⟨244298⟩
    si v316 == 31 :
        c23.image = 1                                                                                 ⟨244305⟩
    Scene_Tick(scène=scène8)                                                                          ⟨244320⟩
Scene_Destruct(scène=scène8, drapeaux=0)                                                              ⟨244349⟩
r30(mid5 21).+0 = 0                                                                                   ⟨244372⟩
v286 = 0                                                                                              ⟨244374⟩
v276 = 0                                                                                              ⟨244393⟩
v256 = 0                                                                                              ⟨244431⟩
v247 = 0                                                                                              ⟨244449⟩
v246 = 0                                                                                              ⟨244450⟩
v248 = 2                                                                                              ⟨244452⟩
v247 = 0                                                                                              ⟨244453⟩
v246 = 0                                                                                              ⟨244454⟩
charge_convdata_type0("goon", drapeau=3)                                                              ⟨244459⟩
v256 = 0                                                                                              ⟨244464⟩
charge(mid5 4)                                                                                        ⟨244471⟩
charge(mid5 29)                                                                                       ⟨244483⟩
v276 = 0                                                                                              ⟨244488⟩
charge(mid5 30)                                                                                       ⟨244495⟩
palette_depuis(pal11(mid5 30))                                                                        ⟨244502⟩

──── scène9 ────
scène9 = Scene_Create(cadence=9, palette=255, surface=&v440)                                          ⟨244510⟩
c25 = Layer(ressource=mid5 1, x=0, y=0)                                                               ⟨244517⟩
c26 = TalkingHead(ressource=convdata type 0 "goon", x=160, y=128)                                     ⟨244525⟩
c27 = Layer(ressource=mid5 4, x=0, y=-11)                                                             ⟨244533⟩
c28 = TalkingHead(ressource=mid5 29, x=160, y=128)                                                    ⟨244541⟩
palette_copie(destination=pal1, source=pal4(mid5 18))                                                 ⟨244551⟩
palette_copie(destination=pal1, source=pal9(convdata type 2 "night"))                                 ⟨244560⟩
v3136 = 0                                                                                             ⟨244570⟩
v3132 = 2                                                                                             ⟨244571⟩
v3131 = 0                                                                                             ⟨244572⟩
v3130 = 0                                                                                             ⟨244573⟩
v3138 = -1                                                                                            ⟨244575⟩
si v11 != 0 :
    charge(asoundfx 43)                                                                               ⟨244584⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨244589⟩
    canal_enregistre(canal=canal2, ressource=asoundfx 43, x=0)                                        ⟨244596⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨244606⟩
ajoute c25 à scène9                                                                                   ⟨244611⟩
ajoute c26 à scène9                                                                                   ⟨244616⟩
ajoute c27 à scène9                                                                                   ⟨244621⟩
ajoute c28 à scène9                                                                                   ⟨244626⟩
tête_image_de_base(tête=c26, image=27)                                                                ⟨244630⟩
c27.image = 5                                                                                         ⟨244633⟩
si v10 != 0 :
    Scene_Tick(scène=scène9)                                                                          ⟨244642⟩
    charge(mid5voc 11)                                                                                ⟨244654⟩
    tête_voix(tête=c26, ressource=mid5voc 11, cadence=9)                                              ⟨244660⟩
    v318 = 0                                                                                          ⟨244662⟩
    tant que v318 < 3 :
        Scene_Tick(scène=scène9)                                                                      ⟨244669⟩
        v318 = v318 + 1                                                                               ⟨244671⟩
    tant que tête_parle(tête=c26) != 0 :
        Scene_Tick(scène=scène9)                                                                      ⟨244692⟩
    scène9.compteur = 0                                                                               ⟨244703⟩
    tant que (scène9.compteur < 8) et (scène9.terminée == 0) :
        v344 = scène9.compteur                                                                        ⟨244709⟩
        si v344 == si :
            c27.image = 6                                                                             ⟨244713⟩
        si si + 5 == v344 :
            c27.image = 5                                                                             ⟨244721⟩
        si si + 8 == v344 :
            c27.image = 6                                                                             ⟨244729⟩
        Scene_Tick(scène=scène9)                                                                      ⟨244744⟩
    charge(mid5voc 12)                                                                                ⟨244777⟩
    tête_voix(tête=c26, ressource=mid5voc 12, cadence=9)                                              ⟨244783⟩
    v318 = 0                                                                                          ⟨244785⟩
    tant que v318 < 3 :
        Scene_Tick(scène=scène9)                                                                      ⟨244792⟩
        v318 = v318 + 1                                                                               ⟨244794⟩
    tant que tête_parle(tête=c26) != 0 :
        Scene_Tick(scène=scène9)                                                                      ⟨244815⟩
    v318 = 0                                                                                          ⟨244826⟩
    tant que v318 < 4 :
        Scene_Tick(scène=scène9)                                                                      ⟨244833⟩
        v318 = v318 + 1                                                                               ⟨244835⟩
    tête_image_de_base(tête=c26, image=28)                                                            ⟨244842⟩
    v318 = 0                                                                                          ⟨244844⟩
    tant que v318 < 12 :
        si v318 == 6 :
            si v11 != 0 :
                v330 = word_48EF8                                                                     ⟨244854⟩
                v332 = 0                                                                              ⟨244855⟩
                si canal2.+0 != 0 :
                    AIL_start_sequence(pilote=canal2.+0→4, séquence=v3138)                            ⟨244861⟩
                    AIL_set_relative_volume_30C66(canal2.+0→4, v3138, v330, v332)                     ⟨244868⟩
        Scene_Tick(scène=scène9)                                                                      ⟨244876⟩
        v318 = v318 + 1                                                                               ⟨244878⟩
    charge(mid5voc 0)                                                                                 ⟨244893⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid5voc 0)                                  ⟨244899⟩
    v318 = 0                                                                                          ⟨244901⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨244905⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        v318_avant = v318                                                                             ⟨244912⟩
        v318 = v318 + 1                                                                               ⟨244912⟩
        si v318_avant == 5 :
            tête_image_de_base(tête=c26, image=25)                                                    ⟨244917⟩
        Scene_Tick(scène=scène9)                                                                      ⟨244933⟩
    voix_arrête(voix=voix1)                                                                           ⟨244947⟩
    v336 = 0                                                                                          ⟨244967⟩
    v322 = 0                                                                                          ⟨244986⟩
    r32(mid5voc 11).+0 = 0                                                                            ⟨245003⟩
sinon :
    v492→0.méthode8(125)                                                                              ⟨245014⟩
    v4 = 39                                                                                           ⟨245016⟩
    si = scène9.compteur                                                                              ⟨245017⟩
    tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
        v308 = scène9.compteur                                                                        ⟨245032⟩
        si si + 2 == v308 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])                              ⟨245044⟩
        si si + 2 == v308 :
            tête_texte_de_lèvres(tête=c26, texte="Mrkzralalik")                                       ⟨245054⟩
        si si + 2 == v308 :
            tête_texte_de_lèvres(tête=c28, texte="Mrkzralalik")                                       ⟨245064⟩
        si si + 6 == v308 :
            c27.image = 6                                                                             ⟨245073⟩
        si si + 11 == v308 :
            c27.image = 5                                                                             ⟨245081⟩
        si si + 14 == v308 :
            c27.image = 6                                                                             ⟨245089⟩
        si (si + ((v4·70) / 100)) - 1 == v308 :
            v3152 = 4540                                                                              ⟨245096⟩
            v3152 = 4552                                                                              ⟨245097⟩
            v3152 = 4568                                                                              ⟨245098⟩
            v3152 = 4584                                                                              ⟨245099⟩
            v3152 = 4604                                                                              ⟨245100⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3152, v487, v485, v483, v481, 0, &v510)             ⟨245110⟩
        Scene_Tick(scène=scène9)                                                                      ⟨245142⟩
    v4_avant = si + ((v4·70) / 100)                                                                   ⟨245168⟩
    v4 = 64                                                                                           ⟨245168⟩
    si = scène9.compteur                                                                              ⟨245169⟩
    tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
        v308 = scène9.compteur                                                                        ⟨245184⟩
        si si + 1 == v308 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[9])                              ⟨245197⟩
        si si + 1 == v308 :
            tête_texte_de_lèvres(tête=c26, texte="alwzwngtdothnsdrdwa")                               ⟨245207⟩
        si si + 1 == v308 :
            tête_texte_de_lèvres(tête=c28, texte="alwzwngtdothnsdrdwa")                               ⟨245217⟩
        si si + 13 == v308 :
            c27.image = 6                                                                             ⟨245226⟩
        si si + 16 == v308 :
            c27.image = 5                                                                             ⟨245234⟩
        si (si + ((v4·70) / 100)) - 1 == v308 :
            v3152 = 4540                                                                              ⟨245241⟩
            v3152 = 4552                                                                              ⟨245242⟩
            v3152 = 4568                                                                              ⟨245243⟩
            v3152 = 4584                                                                              ⟨245244⟩
            v3152 = 4604                                                                              ⟨245245⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3152, v487, v485, v483, v481, 0, &v510)             ⟨245255⟩
        Scene_Tick(scène=scène9)                                                                      ⟨245287⟩
    v4_avant = si + ((v4·70) / 100)                                                                   ⟨245313⟩
    v4 = 64                                                                                           ⟨245313⟩
    si = scène9.compteur                                                                              ⟨245314⟩
    tant que (scène9.compteur < si + ((v4·70) / 100)) et (scène9.terminée == 0) :
        v308 = scène9.compteur                                                                        ⟨245329⟩
        si si + 2 == v308 :
            tête_image_de_base(tête=c26, image=-1)                                                    ⟨245336⟩
        si si + 2 == v308 :
            tête_texte_de_lèvres(tête=c26, texte="ilikmrkz")                                          ⟨245346⟩
        si si + 2 == v308 :
            tête_texte_de_lèvres(tête=c28, texte="ilikmrkz")                                          ⟨245356⟩
        si si + 3 == v308 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[10])                             ⟨245372⟩
        si si + 6 == v308 :
            c27.image = 5                                                                             ⟨245381⟩
        si si + 11 == v308 :
            c27.image = 6                                                                             ⟨245389⟩
        si si + 14 == v308 :
            c27.image = 5                                                                             ⟨245397⟩
        si si + 14 == v308 :
            tête_image_de_base(tête=c26, image=28)                                                    ⟨245406⟩
        si (si + ((v4·70) / 100)) - 10 == v308 :
            si v11 != 0 :
                r18(asoundfx (v302 + &v300)→0).+0 = 0                                                 ⟨245418⟩
                si canal2.+0 != 0 :
                    AIL_start_sequence(pilote=canal2.+0→4, séquence=v3138)                            ⟨245424⟩
                    AIL_set_relative_volume_30C66(canal2.+0→4, v3138, word_48EF8, asoundfx (v302 + &v300)→0.+0)  ⟨245431⟩
        si (si + ((v4·70) / 100)) - 2 == v308 :
            tête_image_de_base(tête=c26, image=25)                                                    ⟨245443⟩
        si (si + ((v4·70) / 100)) - 10 == v308 :
            v3152 = 4540                                                                              ⟨245451⟩
            v3152 = 4552                                                                              ⟨245452⟩
            v3152 = 4568                                                                              ⟨245453⟩
            v3152 = 4584                                                                              ⟨245454⟩
            v3152 = 4604                                                                              ⟨245455⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3152, v487, v485, v483, v481, 0, &v510)             ⟨245465⟩
        Scene_Tick(scène=scène9)                                                                      ⟨245497⟩
canal_arrête(canal=canal2)                                                                            ⟨245525⟩
v3136 = 0                                                                                             ⟨245543⟩
v3131 = 0                                                                                             ⟨245544⟩
v3130 = 0                                                                                             ⟨245545⟩
v301 = 0                                                                                              ⟨245563⟩
v300 = 0                                                                                              ⟨245564⟩
Scene_Destruct(scène=scène9, drapeaux=0)                                                              ⟨245568⟩
v276 = 0                                                                                              ⟨245593⟩
v256 = 0                                                                                              ⟨245631⟩
v247 = 0                                                                                              ⟨245649⟩
v246 = 0                                                                                              ⟨245650⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨245679⟩
    v226 = 0                                                                                          ⟨245680⟩
    v211 = 0                                                                                          ⟨245703⟩
    v210 = 0                                                                                          ⟨245704⟩
    v195 = 0                                                                                          ⟨245727⟩
    v194 = 0                                                                                          ⟨245728⟩
    v179 = 0                                                                                          ⟨245751⟩
    v178 = 0                                                                                          ⟨245752⟩
    v169 = 0                                                                                          ⟨245770⟩
    v168 = 0                                                                                          ⟨245771⟩
    v153 = 0                                                                                          ⟨245794⟩
    v152 = 0                                                                                          ⟨245795⟩
    v143 = 0                                                                                          ⟨245813⟩
    v142 = 0                                                                                          ⟨245814⟩
    v127 = 0                                                                                          ⟨245837⟩
    v126 = 0                                                                                          ⟨245838⟩
    v117 = 0                                                                                          ⟨245856⟩
    v116 = 0                                                                                          ⟨245857⟩
    v101 = 0                                                                                          ⟨245880⟩
    v100 = 0                                                                                          ⟨245881⟩
    v85 = 0                                                                                           ⟨245904⟩
    v84 = 0                                                                                           ⟨245905⟩
    v75 = 0                                                                                           ⟨245923⟩
    v74 = 0                                                                                           ⟨245924⟩
    voix_arrête(voix=voix1)                                                                           ⟨245933⟩
    v3076 = 0                                                                                         ⟨245951⟩
    v3071 = 0                                                                                         ⟨245952⟩
    v3070 = 0                                                                                         ⟨245953⟩
    canal_arrête(canal=canal1)                                                                        ⟨245956⟩
    v1002 = 0                                                                                         ⟨245974⟩
    v997 = 0                                                                                          ⟨245975⟩
    v996 = 0                                                                                          ⟨245976⟩
    v59 = 0                                                                                           ⟨245999⟩
    v58 = 0                                                                                           ⟨246000⟩
    v34 = 0                                                                                           ⟨246041⟩
    v29 = 0                                                                                           ⟨246042⟩
    v28 = 0                                                                                           ⟨246043⟩
    retour                                                                                            ⟨246065⟩
v248 = 2                                                                                              ⟨246070⟩
v247 = 0                                                                                              ⟨246071⟩
v246 = 0                                                                                              ⟨246072⟩
charge(mid5 3)                                                                                        ⟨246079⟩
v256 = 0                                                                                              ⟨246084⟩
charge(mid5 12)                                                                                       ⟨246091⟩

──── scène10 ────
scène10 = Scene_Create(cadence=9, palette=255, surface=&v440)                                         ⟨246099⟩
c29 = Layer(ressource=mid5 12, x=0, y=0)                                                              ⟨246106⟩
c30 = OverlayImageLayer(ressource=mid5 3, x=0, y=-24, image=0)                                        ⟨246115⟩
palette_copie(destination=pal1, source=pal7(mid5 23))                                                 ⟨246125⟩
palette_copie(destination=pal1, source=pal8(mid5 14))                                                 ⟨246134⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨246146⟩
ajoute c29 à scène10                                                                                  ⟨246151⟩
ajoute c30 à scène10                                                                                  ⟨246156⟩
si v10 != 0 :
    tant que (scène10.compteur < 16) et (scène10.terminée == 0) :
        Scene_Tick(scène=scène10)                                                                     ⟨246176⟩
sinon :
    v492→0.méthode8(128)                                                                              ⟨246207⟩
    v4 = 50                                                                                           ⟨246209⟩
    si = scène10.compteur                                                                             ⟨246210⟩
    tant que (scène10.compteur < si + ((v4·70) / 100)) et (scène10.terminée == 0) :
        pal10(mid5 19).+0 = scène10.compteur                                                          ⟨246225⟩
        si si + 3 == pal10(mid5 32).+0 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[11])                             ⟨246238⟩
        si si + 18 > pal10(mid5 32).+0 :
            CRT_Rand()                                                                                ⟨246246⟩
            v270 = ((CRT_Rand()·4) / 32768) + 1                                                       ⟨246253⟩
            c30.image = v270                                                                          ⟨246256⟩
        si si + 18 == pal10(mid5 32).+0 :
            c30.image = 1                                                                             ⟨246264⟩
        si (si + ((v4·70) / 100)) - 1 == pal10(mid5 32).+0 :
            v3138 = 4540                                                                              ⟨246271⟩
            v3138 = 4552                                                                              ⟨246272⟩
            v3138 = 4568                                                                              ⟨246273⟩
            v3138 = 4584                                                                              ⟨246274⟩
            v3138 = 4604                                                                              ⟨246275⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3138, v487, v485, v483, v481, 0, &v510)             ⟨246285⟩
        Scene_Tick(scène=scène10)                                                                     ⟨246317⟩
Scene_Destruct(scène=scène10, drapeaux=0)                                                             ⟨246346⟩
v256 = 0                                                                                              ⟨246366⟩
v247 = 0                                                                                              ⟨246384⟩
v246 = 0                                                                                              ⟨246385⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨246414⟩
    v226 = 0                                                                                          ⟨246415⟩
    v211 = 0                                                                                          ⟨246438⟩
    v210 = 0                                                                                          ⟨246439⟩
    v195 = 0                                                                                          ⟨246462⟩
    v194 = 0                                                                                          ⟨246463⟩
    v179 = 0                                                                                          ⟨246486⟩
    v178 = 0                                                                                          ⟨246487⟩
    v169 = 0                                                                                          ⟨246505⟩
    v168 = 0                                                                                          ⟨246506⟩
    v153 = 0                                                                                          ⟨246529⟩
    v152 = 0                                                                                          ⟨246530⟩
    v143 = 0                                                                                          ⟨246548⟩
    v142 = 0                                                                                          ⟨246549⟩
    v127 = 0                                                                                          ⟨246572⟩
    v126 = 0                                                                                          ⟨246573⟩
    v117 = 0                                                                                          ⟨246591⟩
    v116 = 0                                                                                          ⟨246592⟩
    v101 = 0                                                                                          ⟨246615⟩
    v100 = 0                                                                                          ⟨246616⟩
    v85 = 0                                                                                           ⟨246639⟩
    v84 = 0                                                                                           ⟨246640⟩
    v75 = 0                                                                                           ⟨246658⟩
    v74 = 0                                                                                           ⟨246659⟩
    voix_arrête(voix=voix1)                                                                           ⟨246668⟩
    v3076 = 0                                                                                         ⟨246686⟩
    v3071 = 0                                                                                         ⟨246687⟩
    v3070 = 0                                                                                         ⟨246688⟩
    canal_arrête(canal=canal1)                                                                        ⟨246691⟩
    v1002 = 0                                                                                         ⟨246709⟩
    v997 = 0                                                                                          ⟨246710⟩
    v996 = 0                                                                                          ⟨246711⟩
    v59 = 0                                                                                           ⟨246734⟩
    v58 = 0                                                                                           ⟨246735⟩
    v34 = 0                                                                                           ⟨246776⟩
    v29 = 0                                                                                           ⟨246777⟩
    v28 = 0                                                                                           ⟨246778⟩
    retour                                                                                            ⟨246800⟩
v248 = 2                                                                                              ⟨246805⟩
v247 = 0                                                                                              ⟨246806⟩
v246 = 0                                                                                              ⟨246807⟩
charge(mid5 13)                                                                                       ⟨246814⟩
v256 = 0                                                                                              ⟨246819⟩
charge(mid5 5)                                                                                        ⟨246826⟩

──── scène11 ────
scène11 = Scene_Create(cadence=15, palette=255, surface=&v440)                                        ⟨246834⟩
c31 = TriggeredAnimLayer(ressource=mid5 13, x=0, y=0, image=0)                                        ⟨246842⟩
c32 = ImageLayer(ressource=midgames 1, x=0, y=0, image=0)                                             ⟨246851⟩
c33 = ImageLayer(ressource=midgames 1, x=0, y=0, image=1)                                             ⟨246860⟩
c34 = ScaledMovingLayer(ressource=mid5 5, x=115, y=70, échelle_x=300, échelle_y=300, vx=7, vy=0, image=0)  ⟨246873⟩
c35 = ScaledMovingLayer(ressource=mid5 5, x=80, y=70, échelle_x=300, échelle_y=300, vx=8, vy=0, image=2)  ⟨246886⟩
c36 = ScaledMovingLayer(ressource=mid5 5, x=60, y=70, échelle_x=300, échelle_y=300, vx=7, vy=0, image=3)  ⟨246899⟩
palette_copie(destination=pal1, source=pal2(midgames 2))                                              ⟨246909⟩
pal12(mid5 19).+0 = 0                                                                                 ⟨246918⟩
pal11(mid5 30).+0 = 0                                                                                 ⟨246922⟩
pal13(mid5 21).+0 = 0                                                                                 ⟨246926⟩
v308 = 0                                                                                              ⟨246930⟩
v3136 = 0                                                                                             ⟨246931⟩
v3132 = 2                                                                                             ⟨246932⟩
v3131 = 0                                                                                             ⟨246933⟩
v3130 = 0                                                                                             ⟨246934⟩
v3138 = -1                                                                                            ⟨246936⟩
v3150 = 0                                                                                             ⟨246937⟩
v3152 = -1                                                                                            ⟨246942⟩
v3164 = 0                                                                                             ⟨246943⟩
v3158 = 0                                                                                             ⟨246946⟩
v3166 = -1                                                                                            ⟨246948⟩
v3178 = 0                                                                                             ⟨246949⟩
v3173 = 0                                                                                             ⟨246951⟩
v3172 = 0                                                                                             ⟨246952⟩
v3182 = 0                                                                                             ⟨246953⟩
si v11 != 0 :
    charge(asoundfx 47)                                                                               ⟨246967⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨246972⟩
    canal_enregistre(canal=canal2, ressource=asoundfx 47, x=0)                                        ⟨246979⟩
    charge(asoundfx 48)                                                                               ⟨246987⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨246992⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 48, x=0)                                        ⟨246999⟩
    charge(asoundfx 84)                                                                               ⟨247007⟩
    canal_init(canal=canal4, pilote=word_46849)                                                       ⟨247012⟩
    canal_enregistre(canal=canal4, ressource=asoundfx 84, x=0)                                        ⟨247019⟩
    charge(asoundfx 84)                                                                               ⟨247027⟩
    canal_init(canal=canal5, pilote=word_46849)                                                       ⟨247032⟩
    canal_enregistre(canal=canal5, ressource=asoundfx 84, x=0)                                        ⟨247039⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨247049⟩
ajoute c33 à scène11                                                                                  ⟨247054⟩
ajoute c31 à scène11                                                                                  ⟨247059⟩
ajoute c34 à scène11                                                                                  ⟨247064⟩
ajoute c35 à scène11                                                                                  ⟨247069⟩
ajoute c36 à scène11                                                                                  ⟨247074⟩
ajoute c32 à scène11                                                                                  ⟨247079⟩
r32(mid5voc 11).+0 = 0                                                                                ⟨247081⟩
tant que (scène11.compteur < 60) et (scène11.terminée == 0) :
    r32(mid5voc 11).+0 = mid5voc 11.+0 + 1                                                            ⟨247086⟩
    si mid5voc 11.+0 == 13 :
        c31.image = 1                                                                                 ⟨247090⟩
        si v11 != 0 :
            v318 = word_48F00                                                                         ⟨247094⟩
            v320 = 0                                                                                  ⟨247095⟩
            si canal2.+0 != 0 :
                AIL_start_sequence(pilote=canal2.+0→4, séquence=v3138)                                ⟨247101⟩
                AIL_set_relative_volume_30C66(canal2.+0→4, v3138, v318, v320)                         ⟨247108⟩
    si mid5voc 11.+0 == 14 :
        c31.image = 2                                                                                 ⟨247117⟩
    si mid5voc 11.+0 == 15 :
        c31.image = 1                                                                                 ⟨247123⟩
    si mid5voc 11.+0 == 16 :
        c31.image = 3                                                                                 ⟨247129⟩
    si mid5voc 11.+0 == 17 :
        c31.image = 0                                                                                 ⟨247135⟩
    si mid5voc 11.+0 == 19 :
        si v11 != 0 :
            v322 = word_48F4A                                                                         ⟨247143⟩
            si canal4.+0 != 0 :
                AIL_start_sequence(pilote=canal4.+0→4, séquence=v3166)                                ⟨247150⟩
                AIL_set_relative_volume_30C66(canal4.+0→4, v3166, v322, mid5voc 2.+0)                 ⟨247157⟩
    si mid5voc 11.+0 == 26 :
        c31.image = 1                                                                                 ⟨247166⟩
        si v11 != 0 :
            v326 = word_48F02                                                                         ⟨247170⟩
            si canal3.+0 != 0 :
                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3152)                                ⟨247177⟩
                AIL_set_relative_volume_30C66(canal3.+0→4, v3152, v326, mid5voc 12.+0)                ⟨247184⟩
    si mid5voc 11.+0 == 27 :
        c31.image = 2                                                                                 ⟨247193⟩
    si mid5voc 11.+0 == 28 :
        c31.image = 1                                                                                 ⟨247199⟩
    si mid5voc 11.+0 == 29 :
        c31.image = 4                                                                                 ⟨247205⟩
    si mid5voc 11.+0 == 30 :
        c31.image = 1                                                                                 ⟨247211⟩
    si mid5voc 11.+0 == 31 :
        c31.image = 5                                                                                 ⟨247217⟩
    si mid5voc 11.+0 == 32 :
        c31.image = 0                                                                                 ⟨247223⟩
    si mid5voc 11.+0 == 34 :
        si v11 != 0 :
            v330 = word_48F4A                                                                         ⟨247231⟩
            v332 = 0                                                                                  ⟨247232⟩
            si canal4.+0 != 0 :
                AIL_start_sequence(pilote=canal4.+0→4, séquence=v3166)                                ⟨247238⟩
                AIL_set_relative_volume_30C66(canal4.+0→4, v3166, v330, v332)                         ⟨247245⟩
    c34.image = mid5voc 11.+0 % 5                                                                     ⟨247258⟩
    v336 = (mid5voc 11.+0 + 3) % 5                                                                    ⟨247264⟩
    c35.image = v336                                                                                  ⟨247267⟩
    v338 = (mid5voc 11.+0 + 4) % 5                                                                    ⟨247273⟩
    c36.image = v338                                                                                  ⟨247276⟩
    Scene_Tick(scène=scène11)                                                                         ⟨247279⟩
canal_arrête(canal=canal5)                                                                            ⟨247306⟩
v3178 = 0                                                                                             ⟨247324⟩
v3173 = 0                                                                                             ⟨247325⟩
v3172 = 0                                                                                             ⟨247326⟩
canal_arrête(canal=canal4)                                                                            ⟨247329⟩
v3164 = 0                                                                                             ⟨247347⟩
v3158 = 0                                                                                             ⟨247349⟩
canal_arrête(canal=canal3)                                                                            ⟨247352⟩
v3150 = 0                                                                                             ⟨247370⟩
canal_arrête(canal=canal2)                                                                            ⟨247375⟩
v3136 = 0                                                                                             ⟨247393⟩
v3131 = 0                                                                                             ⟨247394⟩
v3130 = 0                                                                                             ⟨247395⟩
v308 = 0                                                                                              ⟨247414⟩
pal13(mid5 21).+0 = 0                                                                                 ⟨247433⟩
pal11(mid5 30).+0 = 0                                                                                 ⟨247452⟩
pal12(mid5 19).+0 = 0                                                                                 ⟨247471⟩
Scene_Destruct(scène=scène11, drapeaux=0)                                                             ⟨247475⟩
v256 = 0                                                                                              ⟨247495⟩
v247 = 0                                                                                              ⟨247513⟩
v246 = 0                                                                                              ⟨247514⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨247543⟩
    v226 = 0                                                                                          ⟨247544⟩
    v211 = 0                                                                                          ⟨247567⟩
    v210 = 0                                                                                          ⟨247568⟩
    v195 = 0                                                                                          ⟨247591⟩
    v194 = 0                                                                                          ⟨247592⟩
    v179 = 0                                                                                          ⟨247615⟩
    v178 = 0                                                                                          ⟨247616⟩
    v169 = 0                                                                                          ⟨247634⟩
    v168 = 0                                                                                          ⟨247635⟩
    v153 = 0                                                                                          ⟨247658⟩
    v152 = 0                                                                                          ⟨247659⟩
    v143 = 0                                                                                          ⟨247677⟩
    v142 = 0                                                                                          ⟨247678⟩
    v127 = 0                                                                                          ⟨247701⟩
    v126 = 0                                                                                          ⟨247702⟩
    v117 = 0                                                                                          ⟨247720⟩
    v116 = 0                                                                                          ⟨247721⟩
    v101 = 0                                                                                          ⟨247744⟩
    v100 = 0                                                                                          ⟨247745⟩
    v85 = 0                                                                                           ⟨247768⟩
    v84 = 0                                                                                           ⟨247769⟩
    v75 = 0                                                                                           ⟨247787⟩
    v74 = 0                                                                                           ⟨247788⟩
    voix_arrête(voix=voix1)                                                                           ⟨247797⟩
    v3076 = 0                                                                                         ⟨247815⟩
    v3071 = 0                                                                                         ⟨247816⟩
    v3070 = 0                                                                                         ⟨247817⟩
    canal_arrête(canal=canal1)                                                                        ⟨247820⟩
    v1002 = 0                                                                                         ⟨247838⟩
    v997 = 0                                                                                          ⟨247839⟩
    v996 = 0                                                                                          ⟨247840⟩
    v59 = 0                                                                                           ⟨247863⟩
    v58 = 0                                                                                           ⟨247864⟩
    v34 = 0                                                                                           ⟨247905⟩
    v29 = 0                                                                                           ⟨247906⟩
    v28 = 0                                                                                           ⟨247907⟩
    retour                                                                                            ⟨247929⟩
v248 = 2                                                                                              ⟨247934⟩
v247 = 0                                                                                              ⟨247935⟩
v246 = 0                                                                                              ⟨247936⟩
charge_convdata_type0("janet", drapeau=3)                                                             ⟨247941⟩

──── scène12 ────
scène12 = Scene_Create(cadence=9, palette=255, surface=&v440)                                         ⟨247949⟩
c37 = Layer(ressource=mid5 1, x=0, y=0)                                                               ⟨247956⟩
c38 = TalkingHead(ressource=convdata type 0 "janet", x=160, y=128)                                    ⟨247964⟩
palette_copie(destination=pal1, source=pal4(mid5 18))                                                 ⟨247974⟩
palette_copie(destination=pal1, source=pal9(convdata type 2 "night"))                                 ⟨247983⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨247995⟩
ajoute c37 à scène12                                                                                  ⟨248000⟩
ajoute c38 à scène12                                                                                  ⟨248005⟩
tête_image_de_base(tête=c38, image=27)                                                                ⟨248009⟩
si v10 != 0 :
    Scene_Tick(scène=scène12)                                                                         ⟨248019⟩
    charge(mid5voc 1)                                                                                 ⟨248031⟩
    tête_voix(tête=c38, ressource=mid5voc 1, cadence=9)                                               ⟨248037⟩
    pal10(mid5 19).+0 = 0                                                                             ⟨248039⟩
    tant que pal10(mid5 32).+0 < 3 :
        Scene_Tick(scène=scène12)                                                                     ⟨248046⟩
        pal10(mid5 19).+0 = pal10(mid5 32).+0 + 1                                                     ⟨248048⟩
    tant que tête_parle(tête=c38) != 0 :
        Scene_Tick(scène=scène12)                                                                     ⟨248069⟩
    pal10(mid5 19).+0 = 0                                                                             ⟨248080⟩
    tant que pal10(mid5 32).+0 < 2 :
        Scene_Tick(scène=scène12)                                                                     ⟨248087⟩
        pal10(mid5 19).+0 = pal10(mid5 32).+0 + 1                                                     ⟨248089⟩
    v260 = 0                                                                                          ⟨248112⟩
sinon :
    v492→0.méthode8(183)                                                                              ⟨248121⟩
    v4 = 35                                                                                           ⟨248123⟩
    si = scène12.compteur                                                                             ⟨248124⟩
    tant que (scène12.compteur < si + ((v4·70) / 100)) et (scène12.terminée == 0) :
        v258 = scène12.compteur                                                                       ⟨248139⟩
        si si + 7 == v258 :
            tête_image_de_base(tête=c38, image=-1)                                                    ⟨248146⟩
        si si + 8 == v258 :
            tête_texte_de_lèvres(tête=c38, texte="zocamndr")                                          ⟨248156⟩
        si si + 9 == v258 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[12])                             ⟨248172⟩
        si (si + ((v4·70) / 100)) - 1 == v258 :
            v3138 = 4540                                                                              ⟨248180⟩
            v3138 = 4552                                                                              ⟨248181⟩
            v3138 = 4568                                                                              ⟨248182⟩
            v3138 = 4584                                                                              ⟨248183⟩
            v3138 = 4604                                                                              ⟨248184⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3138, v487, v485, v483, v481, 0, &v510)             ⟨248194⟩
        Scene_Tick(scène=scène12)                                                                     ⟨248226⟩
    tête_image_de_base(tête=c38, image=33)                                                            ⟨248254⟩
    v4_avant = si + ((v4·70) / 100)                                                                   ⟨248256⟩
    v4 = 50                                                                                           ⟨248256⟩
    si = scène12.compteur                                                                             ⟨248257⟩
    tant que (scène12.compteur < si + ((v4·70) / 100)) et (scène12.terminée == 0) :
        v258 = scène12.compteur                                                                       ⟨248272⟩
        si si + 2 == v258 :
            tête_texte_de_lèvres(tête=c38, texte="wewrtknbotislvsnz")                                 ⟨248279⟩
        si si + 2 == v258 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[14])                             ⟨248295⟩
        si (si + ((v4·70) / 100)) - 1 == v258 :
            v3138 = 4540                                                                              ⟨248303⟩
            v3138 = 4552                                                                              ⟨248304⟩
            v3138 = 4568                                                                              ⟨248305⟩
            v3138 = 4584                                                                              ⟨248306⟩
            v3138 = 4604                                                                              ⟨248307⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3138, v487, v485, v483, v481, 0, &v510)             ⟨248317⟩
        Scene_Tick(scène=scène12)                                                                     ⟨248349⟩
Scene_Destruct(scène=scène12, drapeaux=0)                                                             ⟨248378⟩
v247 = 0                                                                                              ⟨248397⟩
v246 = 0                                                                                              ⟨248398⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨248427⟩
    v226 = 0                                                                                          ⟨248428⟩
    v211 = 0                                                                                          ⟨248451⟩
    v210 = 0                                                                                          ⟨248452⟩
    v195 = 0                                                                                          ⟨248475⟩
    v194 = 0                                                                                          ⟨248476⟩
    v179 = 0                                                                                          ⟨248499⟩
    v178 = 0                                                                                          ⟨248500⟩
    v169 = 0                                                                                          ⟨248518⟩
    v168 = 0                                                                                          ⟨248519⟩
    v153 = 0                                                                                          ⟨248542⟩
    v152 = 0                                                                                          ⟨248543⟩
    v143 = 0                                                                                          ⟨248561⟩
    v142 = 0                                                                                          ⟨248562⟩
    v127 = 0                                                                                          ⟨248585⟩
    v126 = 0                                                                                          ⟨248586⟩
    v117 = 0                                                                                          ⟨248604⟩
    v116 = 0                                                                                          ⟨248605⟩
    v101 = 0                                                                                          ⟨248628⟩
    v100 = 0                                                                                          ⟨248629⟩
    v85 = 0                                                                                           ⟨248652⟩
    v84 = 0                                                                                           ⟨248653⟩
    v75 = 0                                                                                           ⟨248671⟩
    v74 = 0                                                                                           ⟨248672⟩
    voix_arrête(voix=voix1)                                                                           ⟨248681⟩
    v3076 = 0                                                                                         ⟨248699⟩
    v3071 = 0                                                                                         ⟨248700⟩
    v3070 = 0                                                                                         ⟨248701⟩
    canal_arrête(canal=canal1)                                                                        ⟨248704⟩
    v1002 = 0                                                                                         ⟨248722⟩
    v997 = 0                                                                                          ⟨248723⟩
    v996 = 0                                                                                          ⟨248724⟩
    v59 = 0                                                                                           ⟨248747⟩
    v58 = 0                                                                                           ⟨248748⟩
    v34 = 0                                                                                           ⟨248789⟩
    v29 = 0                                                                                           ⟨248790⟩
    v28 = 0                                                                                           ⟨248791⟩
    retour                                                                                            ⟨248813⟩
v248 = 2                                                                                              ⟨248818⟩
v247 = 0                                                                                              ⟨248819⟩
v246 = 0                                                                                              ⟨248820⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨248825⟩

──── scène13 ────
scène13 = Scene_Create(cadence=9, palette=255, surface=&v440)                                         ⟨248833⟩
c39 = Layer(ressource=mid5 11, x=0, y=0)                                                              ⟨248840⟩
c40 = TalkingHead(ressource=convdata type 0 "air", x=160, y=128)                                      ⟨248848⟩
palette_copie(destination=pal1, source=pal5(mid5 22))                                                 ⟨248858⟩
palette_copie(destination=pal1, source=pal9(convdata type 2 "night"))                                 ⟨248867⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨248879⟩
ajoute c39 à scène13                                                                                  ⟨248884⟩
ajoute c40 à scène13                                                                                  ⟨248889⟩
tête_image_de_base(tête=c40, image=27)                                                                ⟨248893⟩
si v10 != 0 :
    Scene_Tick(scène=scène13)                                                                         ⟨248903⟩
    v260 = 0                                                                                          ⟨248908⟩
    charge(mid5voc 6)                                                                                 ⟨248915⟩
    tête_voix(tête=c40, ressource=mid5voc 6, cadence=9)                                               ⟨248921⟩
    pal10(mid5 19).+0 = 0                                                                             ⟨248923⟩
    tant que pal10(mid5 32).+0 < 3 :
        Scene_Tick(scène=scène13)                                                                     ⟨248930⟩
        pal10(mid5 19).+0 = pal10(mid5 32).+0 + 1                                                     ⟨248932⟩
    tant que tête_parle(tête=c40) != 0 :
        Scene_Tick(scène=scène13)                                                                     ⟨248953⟩
    pal10(mid5 19).+0 = 0                                                                             ⟨248964⟩
    tant que pal10(mid5 32).+0 < 2 :
        Scene_Tick(scène=scène13)                                                                     ⟨248971⟩
        pal10(mid5 19).+0 = pal10(mid5 32).+0 + 1                                                     ⟨248973⟩
    v260 = 0                                                                                          ⟨248996⟩
sinon :
    v492→0.méthode8(125)                                                                              ⟨249005⟩
    v4 = 45                                                                                           ⟨249007⟩
    si = scène13.compteur                                                                             ⟨249008⟩
    tant que (scène13.compteur < si + ((v4·70) / 100)) et (scène13.terminée == 0) :
        v258 = scène13.compteur                                                                       ⟨249023⟩
        si si + 2 == v258 :
            tête_texte_de_lèvres(tête=c40, texte="Wewrtknbutvkasns")                                  ⟨249030⟩
        si si + 3 == v258 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[15])                             ⟨249046⟩
        si (si + ((v4·70) / 100)) - 1 == v258 :
            v3138 = 4540                                                                              ⟨249054⟩
            v3138 = 4552                                                                              ⟨249055⟩
            v3138 = 4568                                                                              ⟨249056⟩
            v3138 = 4584                                                                              ⟨249057⟩
            v3138 = 4604                                                                              ⟨249058⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3138, v487, v485, v483, v481, 0, &v510)             ⟨249068⟩
        Scene_Tick(scène=scène13)                                                                     ⟨249100⟩
    v4_avant = si + ((v4·70) / 100)                                                                   ⟨249126⟩
    v4 = 75                                                                                           ⟨249126⟩
    si = scène13.compteur                                                                             ⟨249127⟩
    tant que (scène13.compteur < si + ((v4·70) / 100)) et (scène13.terminée == 0) :
        v258 = scène13.compteur                                                                       ⟨249142⟩
        si si + 2 == v258 :
            tête_texte_de_lèvres(tête=c40, texte="nfyrstlntrsd inoagrplswecngo")                      ⟨249149⟩
        si si + 2 == v258 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[16])                             ⟨249164⟩
        si (si + ((v4·70) / 100)) - 1 == v258 :
            v3138 = 4540                                                                              ⟨249172⟩
            v3138 = 4552                                                                              ⟨249173⟩
            v3138 = 4568                                                                              ⟨249174⟩
            v3138 = 4584                                                                              ⟨249175⟩
            v3138 = 4604                                                                              ⟨249176⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3138, v487, v485, v483, v481, 0, &v510)             ⟨249186⟩
        Scene_Tick(scène=scène13)                                                                     ⟨249218⟩
fondu_disparition(palette=pal1, couleur=&v24, pas=2, premier=0, nombre=256)                           ⟨249251⟩
Scene_Destruct(scène=scène13, drapeaux=0)                                                             ⟨249256⟩
v247 = 0                                                                                              ⟨249275⟩
v246 = 0                                                                                              ⟨249276⟩
si byte_495FC != 0 :
    v227 = 0                                                                                          ⟨249305⟩
    v226 = 0                                                                                          ⟨249306⟩
    v211 = 0                                                                                          ⟨249329⟩
    v210 = 0                                                                                          ⟨249330⟩
    v195 = 0                                                                                          ⟨249353⟩
    v194 = 0                                                                                          ⟨249354⟩
    v179 = 0                                                                                          ⟨249377⟩
    v178 = 0                                                                                          ⟨249378⟩
    v169 = 0                                                                                          ⟨249396⟩
    v168 = 0                                                                                          ⟨249397⟩
    v153 = 0                                                                                          ⟨249420⟩
    v152 = 0                                                                                          ⟨249421⟩
    v143 = 0                                                                                          ⟨249439⟩
    v142 = 0                                                                                          ⟨249440⟩
    v127 = 0                                                                                          ⟨249463⟩
    v126 = 0                                                                                          ⟨249464⟩
    v117 = 0                                                                                          ⟨249482⟩
    v116 = 0                                                                                          ⟨249483⟩
    v101 = 0                                                                                          ⟨249506⟩
    v100 = 0                                                                                          ⟨249507⟩
    v85 = 0                                                                                           ⟨249530⟩
    v84 = 0                                                                                           ⟨249531⟩
    v75 = 0                                                                                           ⟨249549⟩
    v74 = 0                                                                                           ⟨249550⟩
    voix_arrête(voix=voix1)                                                                           ⟨249559⟩
    v3076 = 0                                                                                         ⟨249577⟩
    v3071 = 0                                                                                         ⟨249578⟩
    v3070 = 0                                                                                         ⟨249579⟩
    canal_arrête(canal=canal1)                                                                        ⟨249582⟩
    v1002 = 0                                                                                         ⟨249600⟩
    v997 = 0                                                                                          ⟨249601⟩
    v996 = 0                                                                                          ⟨249602⟩
    v59 = 0                                                                                           ⟨249625⟩
    v58 = 0                                                                                           ⟨249626⟩
    v34 = 0                                                                                           ⟨249667⟩
    v29 = 0                                                                                           ⟨249668⟩
    v28 = 0                                                                                           ⟨249669⟩
    retour                                                                                            ⟨249691⟩
v248 = 2                                                                                              ⟨249696⟩
v247 = 0                                                                                              ⟨249697⟩
v246 = 0                                                                                              ⟨249698⟩
charge(mid5 31)                                                                                       ⟨249705⟩
charge(mid5 32)                                                                                       ⟨249717⟩
palette_depuis(pal10(mid5 32))                                                                        ⟨249724⟩

──── scène14 ────
scène14 = Scene_Create(cadence=9, palette=255, surface=&v440)                                         ⟨249732⟩
c41 = OverlayImageLayer(ressource=mid5 31, x=0, y=0, image=1)                                         ⟨249740⟩
ajoute c41 à scène14                                                                                  ⟨249746⟩
c41.image = 1                                                                                         ⟨249749⟩
fondu_disparition(palette=pal1, couleur=&v24, pas=0, premier=0, nombre=256)                           ⟨249761⟩
palette_copie(destination=pal1, source=pal10(mid5 32))                                                ⟨249770⟩
v492→0.méthode8(174)                                                                                  ⟨249776⟩
sous_titre (sub_C8F5, non lue)(zone=zone1, texte="Later that evening...")                             ⟨249781⟩
Scene_Tick(scène=scène14)                                                                             ⟨249785⟩
fondu_apparition(palette=pal1, couleur=&v24, pas=2, premier=0, nombre=256)                            ⟨249794⟩
tant que (scène14.compteur < 15) et (scène14.terminée == 0) :
    Scene_Tick(scène=scène14)                                                                         ⟨249812⟩
v3138 = 4540                                                                                          ⟨249835⟩
v3138 = 4552                                                                                          ⟨249836⟩
v3138 = 4568                                                                                          ⟨249837⟩
v3138 = 4584                                                                                          ⟨249838⟩
v3138 = 4604                                                                                          ⟨249839⟩
Primitive_SetRectColorAndDraw_2CBE5(&v3138, v487, v485, v483, v481, 0, &v510)                         ⟨249849⟩
scène14.compteur = 0                                                                                  ⟨249851⟩
tant que (scène14.compteur < 38) et (scène14.terminée == 0) :
    v274 = scène14.compteur + 1                                                                       ⟨249860⟩
    c41.image = v274                                                                                  ⟨249863⟩
    Scene_Tick(scène=scène14)                                                                         ⟨249876⟩
scène14.compteur = 0                                                                                  ⟨249899⟩
tant que (scène14.compteur < 8) et (scène14.terminée == 0) :
    Scene_Tick(scène=scène14)                                                                         ⟨249916⟩
Scene_Destruct(scène=scène14, drapeaux=0)                                                             ⟨249942⟩
v256 = 0                                                                                              ⟨249967⟩
v247 = 0                                                                                              ⟨249985⟩
v246 = 0                                                                                              ⟨249986⟩
fondu_disparition(palette=pal1, couleur=&v24, pas=2, premier=0, nombre=256)                           ⟨249994⟩
v227 = 0                                                                                              ⟨250018⟩
v226 = 0                                                                                              ⟨250019⟩
v211 = 0                                                                                              ⟨250042⟩
v210 = 0                                                                                              ⟨250043⟩
v195 = 0                                                                                              ⟨250066⟩
v194 = 0                                                                                              ⟨250067⟩
v179 = 0                                                                                              ⟨250090⟩
v178 = 0                                                                                              ⟨250091⟩
v169 = 0                                                                                              ⟨250109⟩
v168 = 0                                                                                              ⟨250110⟩
v153 = 0                                                                                              ⟨250133⟩
v152 = 0                                                                                              ⟨250134⟩
v143 = 0                                                                                              ⟨250152⟩
v142 = 0                                                                                              ⟨250153⟩
v127 = 0                                                                                              ⟨250176⟩
v126 = 0                                                                                              ⟨250177⟩
v117 = 0                                                                                              ⟨250195⟩
v116 = 0                                                                                              ⟨250196⟩
v101 = 0                                                                                              ⟨250219⟩
v100 = 0                                                                                              ⟨250220⟩
v85 = 0                                                                                               ⟨250243⟩
v84 = 0                                                                                               ⟨250244⟩
v75 = 0                                                                                               ⟨250262⟩
v74 = 0                                                                                               ⟨250263⟩
voix_arrête(voix=voix1)                                                                               ⟨250272⟩
v3076 = 0                                                                                             ⟨250290⟩
v3071 = 0                                                                                             ⟨250291⟩
v3070 = 0                                                                                             ⟨250292⟩
canal_arrête(canal=canal1)                                                                            ⟨250295⟩
v1002 = 0                                                                                             ⟨250313⟩
v997 = 0                                                                                              ⟨250314⟩
v996 = 0                                                                                              ⟨250315⟩
v59 = 0                                                                                               ⟨250338⟩
v58 = 0                                                                                               ⟨250339⟩
v34 = 0                                                                                               ⟨250380⟩
v29 = 0                                                                                               ⟨250381⟩
v28 = 0                                                                                               ⟨250382⟩
retour                                                                                                ⟨250404⟩
```

## Tableaux du segment de données

