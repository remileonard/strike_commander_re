# Script extrait de `sub_71680` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## sub_71680

```
bp = sp                                                                                               ⟨228561⟩
byte_495FC = 0                                                                                        ⟨228565⟩
v1 = 0                                                                                                ⟨228566⟩
v2 = 0                                                                                                ⟨228567⟩
v4 = word_46F46                                                                                       ⟨228569⟩
v608 = 0                                                                                              ⟨228570⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v608, v4)                                                       ⟨228575⟩
v622 = 0                                                                                              ⟨228577⟩
TextRenderer_ApplyFormatChange_2EA21(&v622, 0)                                                        ⟨228586⟩
SmallObject_RegisterInList_2CB40(&v8, &v622)                                                          ⟨228592⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨228598⟩
v18 = 0                                                                                               ⟨228604⟩
v28 = 0                                                                                               ⟨228675⟩
v23 = 0                                                                                               ⟨228677⟩
v22 = 0                                                                                               ⟨228678⟩
v30 = byte_46848                                                                                      ⟨228680⟩
si v30 != 1 :
    si v30 == 2 : aller à loc_71991                                                                   ⟨228690⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨228726⟩
        flux_iff(flux=flux1)                                                                          ⟨228740⟩
        v1377 = 256                                                                                   ⟨228743⟩
        v1381 = 0                                                                                     ⟨228744⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨228752⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨228758⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨228764⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨228768⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨228770⟩
        si = 1                                                                                        ⟨228771⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨228778⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨228782⟩
            si = si + 1                                                                               ⟨228783⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨228790⟩
        v2 = 1                                                                                        ⟨228792⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨228796⟩
    si sub_6734(chemin1) != 0 :
        v1 = 1                                                                                        ⟨228822⟩
        si v2 == 0 :
            word_48F76 = 90                                                                           ⟨228827⟩
    aller à loc_71AFC                                                                                 ⟨228831⟩
    loc_71991:                                                                                        ⟨228834⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨228862⟩
        flux_iff(flux=flux1)                                                                          ⟨228876⟩
        v1377 = 256                                                                                   ⟨228879⟩
        v1381 = 0                                                                                     ⟨228880⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨228888⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨228894⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨228900⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨228904⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨228906⟩
        si = 1                                                                                        ⟨228907⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨228914⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨228918⟩
            si = si + 1                                                                               ⟨228919⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨228926⟩
        v2 = 1                                                                                        ⟨228928⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨228932⟩
    si sub_6734(chemin1) != 0 :
        v1 = 1                                                                                        ⟨228958⟩
        si v2 == 0 :
            word_48F76 = 255                                                                          ⟨228963⟩
loc_71AFC:                                                                                            ⟨228969⟩
v1232 = 0                                                                                             ⟨228971⟩
si v1 != 0 :
    charge(amusic 3)                                                                                  ⟨228992⟩
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨228997⟩
    canal_enregistre(canal=canal1, ressource=amusic 3, x=0)                                           ⟨229004⟩
charge(optpals 21)                                                                                    ⟨229023⟩
palette_depuis(pal2(optpals 21))                                                                      ⟨229030⟩
charge(mid3 26)                                                                                       ⟨229042⟩
palette_depuis(pal3(mid3 26))                                                                         ⟨229049⟩
charge(mid3 17)                                                                                       ⟨229061⟩
palette_depuis(pal4(mid3 17))                                                                         ⟨229068⟩
charge(mid3 19)                                                                                       ⟨229080⟩
palette_depuis(pal5(mid3 19))                                                                         ⟨229087⟩
charge(mid3 20)                                                                                       ⟨229099⟩
palette_depuis(pal6(mid3 20))                                                                         ⟨229106⟩
charge(mid3 21)                                                                                       ⟨229118⟩
palette_depuis(pal7(mid3 21))                                                                         ⟨229125⟩
charge(mid3 18)                                                                                       ⟨229137⟩
palette_depuis(pal8(mid3 18))                                                                         ⟨229144⟩
charge_convdata_type2("normal")                                                                       ⟨229154⟩
palette_depuis(pal9(convdata type 2 "normal"))                                                        ⟨229161⟩
v168 = 0                                                                                              ⟨229163⟩
v163 = 0                                                                                              ⟨229165⟩
v162 = 0                                                                                              ⟨229166⟩
v178 = 0                                                                                              ⟨229167⟩
v173 = 0                                                                                              ⟨229169⟩
v172 = 0                                                                                              ⟨229170⟩
v188 = 0                                                                                              ⟨229171⟩
v183 = 0                                                                                              ⟨229173⟩
v182 = 0                                                                                              ⟨229174⟩
v198 = 0                                                                                              ⟨229175⟩
v193 = 0                                                                                              ⟨229177⟩
v192 = 0                                                                                              ⟨229178⟩
v208 = 0                                                                                              ⟨229179⟩
v203 = 0                                                                                              ⟨229181⟩
v202 = 0                                                                                              ⟨229182⟩
v1246 = 0                                                                                             ⟨229183⟩
v1241 = 0                                                                                             ⟨229185⟩
v1240 = 0                                                                                             ⟨229186⟩
v1250 = 0                                                                                             ⟨229187⟩
v1260 = 0                                                                                             ⟨229189⟩
v1255 = 0                                                                                             ⟨229191⟩
v1254 = 0                                                                                             ⟨229192⟩
v1264 = 0                                                                                             ⟨229193⟩
v1274 = 0                                                                                             ⟨229195⟩
v1269 = 0                                                                                             ⟨229197⟩
v1268 = 0                                                                                             ⟨229198⟩
v1278 = 0                                                                                             ⟨229199⟩
v1288 = 0                                                                                             ⟨229201⟩
v1283 = 0                                                                                             ⟨229203⟩
v1282 = 0                                                                                             ⟨229204⟩
v1292 = 0                                                                                             ⟨229205⟩
v1302 = 0                                                                                             ⟨229207⟩
v1297 = 0                                                                                             ⟨229209⟩
v1296 = 0                                                                                             ⟨229210⟩
v1306 = 0                                                                                             ⟨229211⟩
v210 = word_44FE6                                                                                     ⟨229214⟩
si v2 != 0 :
    charge(asoundfx 40)                                                                               ⟨229227⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨229232⟩
    canal_enregistre(canal=canal2, ressource=asoundfx 40, x=0)                                        ⟨229239⟩
    canal_arrête(canal=canal2)                                                                        ⟨229243⟩
    charge(asoundfx 59)                                                                               ⟨229251⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨229256⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 59, x=0)                                        ⟨229263⟩
    canal_arrête(canal=canal3)                                                                        ⟨229267⟩
    charge(asoundfx 60)                                                                               ⟨229275⟩
    canal_init(canal=canal4, pilote=word_46849)                                                       ⟨229280⟩
    canal_enregistre(canal=canal4, ressource=asoundfx 60, x=0)                                        ⟨229287⟩
    canal_arrête(canal=canal4)                                                                        ⟨229291⟩
    charge(asoundfx 100)                                                                              ⟨229299⟩
    canal_init(canal=canal5, pilote=word_46849)                                                       ⟨229304⟩
    canal_enregistre(canal=canal5, ressource=asoundfx 100, x=0)                                       ⟨229311⟩
    canal_arrête(canal=canal5)                                                                        ⟨229315⟩
    charge(asoundfx 101)                                                                              ⟨229323⟩
    canal_init(canal=canal6, pilote=word_46849)                                                       ⟨229328⟩
    canal_enregistre(canal=canal6, ressource=asoundfx 101, x=0)                                       ⟨229335⟩
    canal_arrête(canal=canal6)                                                                        ⟨229339⟩
    canal_init(canal=canal7, pilote=word_46849)                                                       ⟨229350⟩
    si = 0                                                                                            ⟨229352⟩
    tant que si < 2 :
        charge(asoundfx v210[si])                                                                     ⟨229369⟩
        canal_enregistre(canal=canal7, ressource=asoundfx v210[si], x=0)                              ⟨229376⟩
        canal_arrête(canal=canal7)                                                                    ⟨229380⟩
        v223 = 0                                                                                      ⟨229399⟩
        v222 = 0                                                                                      ⟨229400⟩
        si = si + 1                                                                                   ⟨229401⟩
    canal_arrête(canal=canal7)                                                                        ⟨229412⟩
    v1316 = 0                                                                                         ⟨229430⟩
    v1310 = 0                                                                                         ⟨229432⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal6)                                                                        ⟨229443⟩
    v1302 = 0                                                                                         ⟨229461⟩
    v1297 = 0                                                                                         ⟨229462⟩
    v1296 = 0                                                                                         ⟨229463⟩
    canal_arrête(canal=canal5)                                                                        ⟨229466⟩
    v1288 = 0                                                                                         ⟨229484⟩
    v1283 = 0                                                                                         ⟨229485⟩
    v1282 = 0                                                                                         ⟨229486⟩
    canal_arrête(canal=canal4)                                                                        ⟨229489⟩
    v1274 = 0                                                                                         ⟨229507⟩
    v1269 = 0                                                                                         ⟨229508⟩
    v1268 = 0                                                                                         ⟨229509⟩
    canal_arrête(canal=canal3)                                                                        ⟨229512⟩
    v1260 = 0                                                                                         ⟨229530⟩
    v1255 = 0                                                                                         ⟨229531⟩
    v1254 = 0                                                                                         ⟨229532⟩
    canal_arrête(canal=canal2)                                                                        ⟨229535⟩
    v1246 = 0                                                                                         ⟨229553⟩
    v1241 = 0                                                                                         ⟨229554⟩
    v1240 = 0                                                                                         ⟨229555⟩
    v203 = 0                                                                                          ⟨229573⟩
    v202 = 0                                                                                          ⟨229574⟩
    v193 = 0                                                                                          ⟨229592⟩
    v192 = 0                                                                                          ⟨229593⟩
    v183 = 0                                                                                          ⟨229611⟩
    v182 = 0                                                                                          ⟨229612⟩
    v173 = 0                                                                                          ⟨229630⟩
    v172 = 0                                                                                          ⟨229631⟩
    v163 = 0                                                                                          ⟨229649⟩
    v162 = 0                                                                                          ⟨229650⟩
    v147 = 0                                                                                          ⟨229673⟩
    v146 = 0                                                                                          ⟨229674⟩
    v131 = 0                                                                                          ⟨229697⟩
    v130 = 0                                                                                          ⟨229698⟩
    v115 = 0                                                                                          ⟨229721⟩
    v114 = 0                                                                                          ⟨229722⟩
    v99 = 0                                                                                           ⟨229745⟩
    v98 = 0                                                                                           ⟨229746⟩
    v83 = 0                                                                                           ⟨229769⟩
    v82 = 0                                                                                           ⟨229770⟩
    v67 = 0                                                                                           ⟨229793⟩
    v66 = 0                                                                                           ⟨229794⟩
    v51 = 0                                                                                           ⟨229817⟩
    v50 = 0                                                                                           ⟨229818⟩
    v35 = 0                                                                                           ⟨229841⟩
    v34 = 0                                                                                           ⟨229842⟩
    canal_arrête(canal=canal1)                                                                        ⟨229845⟩
    v1232 = 0                                                                                         ⟨229863⟩
    v1227 = 0                                                                                         ⟨229864⟩
    v1226 = 0                                                                                         ⟨229865⟩
    v23 = 0                                                                                           ⟨229888⟩
    v22 = 0                                                                                           ⟨229889⟩
    retour                                                                                            ⟨229931⟩
si v1 != 0 :
    v212 = word_48F76                                                                                 ⟨229938⟩
    si canal1.+0 != 0 :
        AIL_start_sequence(pilote=canal1.+0→4, séquence=v1234)                                        ⟨229945⟩
        AIL_set_relative_volume_30C66(canal1.+0→4, v1234, v212, 0)                                    ⟨229952⟩

──── scène1 ────
scène1 = Scene_Create(cadence=15, palette=255, surface=&v608)                                         ⟨229964⟩
v224 = 2                                                                                              ⟨229967⟩
v223 = 0                                                                                              ⟨229968⟩
v222 = 0                                                                                              ⟨229969⟩
charge(mid3 25)                                                                                       ⟨229976⟩
c1 = OverlayImageLayer(ressource=mid3 25, x=0, y=0, image=0)                                          ⟨229984⟩
di = c1                                                                                               ⟨229986⟩
palette_copie(destination=pal1, source=pal3(mid3 26))                                                 ⟨229994⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨230006⟩
ajoute c1 à scène1                                                                                    ⟨230011⟩
si = 1                                                                                                ⟨230013⟩
si v2 != 0 :
    canal_enregistre(canal=canal3, ressource=asoundfx 59, x=0)                                        ⟨230021⟩
    v230 = word_48F18                                                                                 ⟨230024⟩
    v232 = 0                                                                                          ⟨230025⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v1262)                                        ⟨230031⟩
        AIL_set_relative_volume_30C66(canal3.+0→4, v1262, v230, v232)                                 ⟨230038⟩
tant que (scène1.compteur < 30) et (scène1.terminée == 0) :
    v234 = si                                                                                         ⟨230048⟩
    si = si + 1                                                                                       ⟨230049⟩
    c1.image = v234                                                                                   ⟨230051⟩
    Scene_Tick(scène=scène1)                                                                          ⟨230054⟩
si v2 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨230089⟩
v223 = 0                                                                                              ⟨230110⟩
v222 = 0                                                                                              ⟨230111⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨230115⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal6)                                                                        ⟨230125⟩
    v1302 = 0                                                                                         ⟨230143⟩
    v1297 = 0                                                                                         ⟨230144⟩
    v1296 = 0                                                                                         ⟨230145⟩
    canal_arrête(canal=canal5)                                                                        ⟨230148⟩
    v1288 = 0                                                                                         ⟨230166⟩
    v1283 = 0                                                                                         ⟨230167⟩
    v1282 = 0                                                                                         ⟨230168⟩
    canal_arrête(canal=canal4)                                                                        ⟨230171⟩
    v1274 = 0                                                                                         ⟨230189⟩
    v1269 = 0                                                                                         ⟨230190⟩
    v1268 = 0                                                                                         ⟨230191⟩
    canal_arrête(canal=canal3)                                                                        ⟨230194⟩
    v1260 = 0                                                                                         ⟨230212⟩
    v1255 = 0                                                                                         ⟨230213⟩
    v1254 = 0                                                                                         ⟨230214⟩
    canal_arrête(canal=canal2)                                                                        ⟨230217⟩
    v1246 = 0                                                                                         ⟨230235⟩
    v1241 = 0                                                                                         ⟨230236⟩
    v1240 = 0                                                                                         ⟨230237⟩
    v203 = 0                                                                                          ⟨230255⟩
    v202 = 0                                                                                          ⟨230256⟩
    v193 = 0                                                                                          ⟨230274⟩
    v192 = 0                                                                                          ⟨230275⟩
    v183 = 0                                                                                          ⟨230293⟩
    v182 = 0                                                                                          ⟨230294⟩
    v173 = 0                                                                                          ⟨230312⟩
    v172 = 0                                                                                          ⟨230313⟩
    v163 = 0                                                                                          ⟨230331⟩
    v162 = 0                                                                                          ⟨230332⟩
    v147 = 0                                                                                          ⟨230355⟩
    v146 = 0                                                                                          ⟨230356⟩
    v131 = 0                                                                                          ⟨230379⟩
    v130 = 0                                                                                          ⟨230380⟩
    v115 = 0                                                                                          ⟨230403⟩
    v114 = 0                                                                                          ⟨230404⟩
    v99 = 0                                                                                           ⟨230427⟩
    v98 = 0                                                                                           ⟨230428⟩
    v83 = 0                                                                                           ⟨230451⟩
    v82 = 0                                                                                           ⟨230452⟩
    v67 = 0                                                                                           ⟨230475⟩
    v66 = 0                                                                                           ⟨230476⟩
    v51 = 0                                                                                           ⟨230499⟩
    v50 = 0                                                                                           ⟨230500⟩
    v35 = 0                                                                                           ⟨230523⟩
    v34 = 0                                                                                           ⟨230524⟩
    canal_arrête(canal=canal1)                                                                        ⟨230527⟩
    v1232 = 0                                                                                         ⟨230545⟩
    v1227 = 0                                                                                         ⟨230546⟩
    v1226 = 0                                                                                         ⟨230547⟩
    v23 = 0                                                                                           ⟨230570⟩
    v22 = 0                                                                                           ⟨230571⟩
    retour                                                                                            ⟨230613⟩
si v2 != 0 :
    canal_enregistre(canal=canal4, ressource=asoundfx 60, x=0)                                        ⟨230628⟩
    canal_enregistre(canal=canal5, ressource=asoundfx 100, x=0)                                       ⟨230635⟩
    canal_enregistre(canal=canal6, ressource=asoundfx 101, x=0)                                       ⟨230642⟩
    v216 = word_48F1A                                                                                 ⟨230645⟩
    si canal4.+0 != 0 :
        AIL_start_sequence(pilote=canal4.+0→4, séquence=v1276)                                        ⟨230652⟩
        AIL_set_relative_volume_30C66(canal4.+0→4, v1276, v216, 0)                                    ⟨230659⟩

──── scène2 ────
scène2 = Scene_Create(cadence=20, palette=255, surface=&v608)                                         ⟨230671⟩
v224 = 2                                                                                              ⟨230674⟩
v223 = 0                                                                                              ⟨230675⟩
v222 = 0                                                                                              ⟨230676⟩
charge(mid3 11)                                                                                       ⟨230683⟩
charge(mid3 15)                                                                                       ⟨230695⟩
charge(mid3 16)                                                                                       ⟨230707⟩
c2 = OverlayImageLayer(ressource=mid3 11, x=0, y=-26, image=0)                                        ⟨230715⟩
c3 = Layer(ressource=mid3 15, x=0, y=-1)                                                              ⟨230723⟩
c4 = Layer(ressource=mid3 16, x=0, y=-1)                                                              ⟨230731⟩
palette_copie(destination=pal1, source=pal4(mid3 17))                                                 ⟨230741⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨230753⟩
ajoute c2 à scène2                                                                                    ⟨230758⟩
ajoute c3 à scène2                                                                                    ⟨230763⟩
si = 0                                                                                                ⟨230765⟩
tant que (scène2.compteur < 75) et (scène2.terminée == 0) :
    di = scène2.compteur                                                                              ⟨230770⟩
    si scène2.compteur < 29 :
        v256 = si                                                                                     ⟨230773⟩
        si = si + 1                                                                                   ⟨230774⟩
        c3.image = v256                                                                               ⟨230777⟩
    sinon :
        si scène2.compteur == 29 :
            retire(parent=scène2, calque=c3)                                                          ⟨230787⟩
            c3.détruit(3)                                                                             ⟨230795⟩
            ajoute c4 à scène2                                                                        ⟨230803⟩
            Scene_SetFps(scène=scène2, cadence=15)                                                    ⟨230808⟩
            si = 0                                                                                    ⟨230810⟩
            v258 = 0                                                                                  ⟨230811⟩
            si = 1                                                                                    ⟨230812⟩
            c4.image = v258                                                                           ⟨230815⟩
        sinon :
            v260 = si                                                                                 ⟨230820⟩
            si = si + 1                                                                               ⟨230821⟩
            c4.image = v260                                                                           ⟨230824⟩
    si scène2.compteur == 50 :
        si v2 != 0 :
            canal_enregistre(canal=canal5, ressource=asoundfx 100, x=0)                               ⟨230837⟩
            v262 = word_48F6A                                                                         ⟨230840⟩
            v264 = 0                                                                                  ⟨230841⟩
            si canal5.+0 != 0 :
                AIL_start_sequence(pilote=canal5.+0→4, séquence=v1290)                                ⟨230847⟩
                AIL_set_relative_volume_30C66(canal5.+0→4, v1290, v262, v264)                         ⟨230854⟩
    si scène2.compteur == 52 :
        si v2 != 0 :
            canal_enregistre(canal=canal6, ressource=asoundfx 101, x=0)                               ⟨230869⟩
            v266 = word_48F6C                                                                         ⟨230872⟩
            v268 = 0                                                                                  ⟨230873⟩
            si canal6.+0 != 0 :
                AIL_start_sequence(pilote=canal6.+0→4, séquence=v1304)                                ⟨230879⟩
                AIL_set_relative_volume_30C66(canal6.+0→4, v1304, v266, v268)                         ⟨230886⟩
    si scène2.compteur == 59 :
        si v2 != 0 :
            v270 = word_48F6C                                                                         ⟨230897⟩
            v272 = 0                                                                                  ⟨230898⟩
            si canal6.+0 != 0 :
                AIL_start_sequence(pilote=canal6.+0→4, séquence=v1304)                                ⟨230904⟩
                AIL_set_relative_volume_30C66(canal6.+0→4, v1304, v270, v272)                         ⟨230911⟩
    si scène2.compteur % 8 == 0 :
        v274 = scène2.compteur % 3                                                                    ⟨230927⟩
        c2.image = v274                                                                               ⟨230930⟩
    Scene_Tick(scène=scène2)                                                                          ⟨230945⟩
si v2 != 0 :
    canal_arrête(canal=canal5)                                                                        ⟨230975⟩
    canal_arrête(canal=canal6)                                                                        ⟨230979⟩
    canal_arrête(canal=canal4)                                                                        ⟨230983⟩
v243 = 0                                                                                              ⟨231004⟩
v242 = 0                                                                                              ⟨231005⟩
v232 = 0                                                                                              ⟨231024⟩
v223 = 0                                                                                              ⟨231042⟩
v222 = 0                                                                                              ⟨231043⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨231047⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal6)                                                                        ⟨231057⟩
    v1302 = 0                                                                                         ⟨231075⟩
    v1297 = 0                                                                                         ⟨231076⟩
    v1296 = 0                                                                                         ⟨231077⟩
    canal_arrête(canal=canal5)                                                                        ⟨231080⟩
    v1288 = 0                                                                                         ⟨231098⟩
    v1283 = 0                                                                                         ⟨231099⟩
    v1282 = 0                                                                                         ⟨231100⟩
    canal_arrête(canal=canal4)                                                                        ⟨231103⟩
    v1274 = 0                                                                                         ⟨231121⟩
    v1269 = 0                                                                                         ⟨231122⟩
    v1268 = 0                                                                                         ⟨231123⟩
    canal_arrête(canal=canal3)                                                                        ⟨231126⟩
    v1260 = 0                                                                                         ⟨231144⟩
    v1255 = 0                                                                                         ⟨231145⟩
    v1254 = 0                                                                                         ⟨231146⟩
    canal_arrête(canal=canal2)                                                                        ⟨231149⟩
    v1246 = 0                                                                                         ⟨231167⟩
    v1241 = 0                                                                                         ⟨231168⟩
    v1240 = 0                                                                                         ⟨231169⟩
    v203 = 0                                                                                          ⟨231187⟩
    v202 = 0                                                                                          ⟨231188⟩
    v193 = 0                                                                                          ⟨231206⟩
    v192 = 0                                                                                          ⟨231207⟩
    v183 = 0                                                                                          ⟨231225⟩
    v182 = 0                                                                                          ⟨231226⟩
    v173 = 0                                                                                          ⟨231244⟩
    v172 = 0                                                                                          ⟨231245⟩
    v163 = 0                                                                                          ⟨231263⟩
    v162 = 0                                                                                          ⟨231264⟩
    v147 = 0                                                                                          ⟨231287⟩
    v146 = 0                                                                                          ⟨231288⟩
    v131 = 0                                                                                          ⟨231311⟩
    v130 = 0                                                                                          ⟨231312⟩
    v115 = 0                                                                                          ⟨231335⟩
    v114 = 0                                                                                          ⟨231336⟩
    v99 = 0                                                                                           ⟨231359⟩
    v98 = 0                                                                                           ⟨231360⟩
    v83 = 0                                                                                           ⟨231383⟩
    v82 = 0                                                                                           ⟨231384⟩
    v67 = 0                                                                                           ⟨231407⟩
    v66 = 0                                                                                           ⟨231408⟩
    v51 = 0                                                                                           ⟨231431⟩
    v50 = 0                                                                                           ⟨231432⟩
    v35 = 0                                                                                           ⟨231455⟩
    v34 = 0                                                                                           ⟨231456⟩
    canal_arrête(canal=canal1)                                                                        ⟨231459⟩
    v1232 = 0                                                                                         ⟨231477⟩
    v1227 = 0                                                                                         ⟨231478⟩
    v1226 = 0                                                                                         ⟨231479⟩
    v23 = 0                                                                                           ⟨231502⟩
    v22 = 0                                                                                           ⟨231503⟩
    retour                                                                                            ⟨231545⟩
v224 = 2                                                                                              ⟨231550⟩
v223 = 0                                                                                              ⟨231551⟩
v222 = 0                                                                                              ⟨231552⟩
v232 = 0                                                                                              ⟨231556⟩
v1316 = 0                                                                                             ⟨231557⟩
v1312 = 2                                                                                             ⟨231558⟩
v1330 = 0                                                                                             ⟨231563⟩
v1325 = 0                                                                                             ⟨231565⟩
v1324 = 0                                                                                             ⟨231566⟩
v1334 = 0                                                                                             ⟨231567⟩
si v2 != 0 :
    charge(asoundfx 78)                                                                               ⟨231581⟩
    canal_init(canal=canal7, pilote=word_46849)                                                       ⟨231586⟩
    canal_enregistre(canal=canal7, ressource=asoundfx 78, x=0)                                        ⟨231593⟩
    charge(asoundfx 20)                                                                               ⟨231601⟩
    canal_init(canal=canal8, pilote=word_46849)                                                       ⟨231606⟩
    canal_enregistre(canal=canal8, ressource=asoundfx 20, x=0)                                        ⟨231613⟩
    v240 = word_48F3E                                                                                 ⟨231616⟩
    v242 = 0                                                                                          ⟨231617⟩
    si canal7.+0 != 0 :
        AIL_start_sequence(pilote=canal7.+0→4, séquence=v1318)                                        ⟨231623⟩
        AIL_set_relative_volume_30C66(canal7.+0→4, v1318, v240, v242)                                 ⟨231630⟩
charge(mid3 9)                                                                                        ⟨231646⟩
charge(mid3 10)                                                                                       ⟨231658⟩
charge(mid3 8)                                                                                        ⟨231670⟩
charge(mid3 12)                                                                                       ⟨231682⟩
charge(mid3 3)                                                                                        ⟨231694⟩
charge(mid3 2)                                                                                        ⟨231706⟩
charge(mid3 4)                                                                                        ⟨231718⟩
charge(mid3 7)                                                                                        ⟨231730⟩
charge(mid3 6)                                                                                        ⟨231742⟩
charge(mid3 5)                                                                                        ⟨231754⟩
charge(mid3 0)                                                                                        ⟨231766⟩
Runtime_StackOverflowCheck_2C319(256)                                                                 ⟨231769⟩
v354 = Runtime_StackOverflowCheck_2C319(256)                                                          ⟨231771⟩
charge(mid3 23)                                                                                       ⟨231782⟩
copie_mémoire(destination=v354, source=données(mid3 23.+0), taille=256)                               ⟨231797⟩
v359 = 0                                                                                              ⟨231816⟩
v358 = 0                                                                                              ⟨231817⟩

──── scène3 ────
scène3 = Scene_Create(cadence=20, palette=255, surface=&v608)                                         ⟨231824⟩
di = -10                                                                                              ⟨231826⟩
v366 = 0                                                                                              ⟨231827⟩
v370 = 0                                                                                              ⟨231828⟩
v372 = 0                                                                                              ⟨231829⟩
v374 = 0                                                                                              ⟨231830⟩
c5 = OverlayImageLayer(ressource=mid3 0, x=-1, y=-51, image=0)                                        ⟨231837⟩
v380 = -1                                                                                             ⟨231844⟩
c6 = MovingLayer(ressource=mid3 2, x=0, y=0, image=0)                                                 ⟨231857⟩
c6.vx = 0                                                                                             ⟨231864⟩
c6.vy = 0                                                                                             ⟨231866⟩
c6.vx = v380                                                                                          ⟨231869⟩
c6.vy = 0                                                                                             ⟨231871⟩
v386 = -1                                                                                             ⟨231885⟩
c7 = MovingLayer(ressource=mid3 2, x=320, y=0, image=0)                                               ⟨231898⟩
c7.vx = 0                                                                                             ⟨231905⟩
c7.vy = 0                                                                                             ⟨231907⟩
c7.vx = v386                                                                                          ⟨231910⟩
c7.vy = 0                                                                                             ⟨231912⟩
v392 = -3                                                                                             ⟨231926⟩
c8 = MovingLayer(ressource=mid3 4, x=0, y=0, image=0)                                                 ⟨231939⟩
c8.vx = 0                                                                                             ⟨231946⟩
c8.vy = 0                                                                                             ⟨231948⟩
c8.vx = v392                                                                                          ⟨231951⟩
c8.vy = 0                                                                                             ⟨231953⟩
v398 = -3                                                                                             ⟨231967⟩
c9 = MovingLayer(ressource=mid3 4, x=320, y=0, image=0)                                               ⟨231980⟩
c9.vx = 0                                                                                             ⟨231987⟩
c9.vy = 0                                                                                             ⟨231989⟩
c9.vx = v398                                                                                          ⟨231992⟩
c9.vy = 0                                                                                             ⟨231994⟩
v404 = -6                                                                                             ⟨232009⟩
c10 = MovingLayer(ressource=mid3 7, x=0, y=0, image=0)                                                ⟨232022⟩
c10.vx = 0                                                                                            ⟨232029⟩
c10.vy = 0                                                                                            ⟨232031⟩
c10.vx = v404                                                                                         ⟨232034⟩
c10.vy = 0                                                                                            ⟨232036⟩
v410 = -6                                                                                             ⟨232051⟩
c11 = MovingLayer(ressource=mid3 7, x=320, y=0, image=0)                                              ⟨232064⟩
c11.vx = 0                                                                                            ⟨232071⟩
c11.vy = 0                                                                                            ⟨232073⟩
c11.vx = v410                                                                                         ⟨232076⟩
c11.vy = 0                                                                                            ⟨232078⟩
v416 = -10                                                                                            ⟨232088⟩
c12 = MovingLayer(ressource=mid3 6, x=0, y=0, image=0)                                                ⟨232101⟩
c12.vx = 0                                                                                            ⟨232108⟩
c12.vy = 0                                                                                            ⟨232110⟩
c12.vx = v416                                                                                         ⟨232113⟩
c12.vy = 0                                                                                            ⟨232115⟩
v422 = -10                                                                                            ⟨232125⟩
c13 = MovingLayer(ressource=mid3 6, x=320, y=0, image=0)                                              ⟨232138⟩
c13.vx = 0                                                                                            ⟨232145⟩
c13.vy = 0                                                                                            ⟨232147⟩
c13.vx = v422                                                                                         ⟨232150⟩
c13.vy = 0                                                                                            ⟨232152⟩
v428 = -13                                                                                            ⟨232167⟩
c14 = MovingLayer(ressource=mid3 5, x=0, y=0, image=0)                                                ⟨232180⟩
c14.vx = 0                                                                                            ⟨232187⟩
c14.vy = 0                                                                                            ⟨232189⟩
c14.vx = v428                                                                                         ⟨232192⟩
c14.vy = 0                                                                                            ⟨232194⟩
v434 = -13                                                                                            ⟨232209⟩
c15 = MovingLayer(ressource=mid3 5, x=320, y=0, image=0)                                              ⟨232222⟩
c15.vx = 0                                                                                            ⟨232229⟩
c15.vy = 0                                                                                            ⟨232231⟩
c15.vx = v434                                                                                         ⟨232234⟩
c15.vy = 0                                                                                            ⟨232236⟩
v440 = -13                                                                                            ⟨232251⟩
c16 = MovingLayer(ressource=mid3 9, x=1233, y=0, image=0)                                             ⟨232264⟩
c16.vx = 0                                                                                            ⟨232271⟩
c16.vy = 0                                                                                            ⟨232273⟩
c16.vx = v440                                                                                         ⟨232276⟩
c16.vy = 0                                                                                            ⟨232278⟩
v446 = -10                                                                                            ⟨232288⟩
c17 = MovingLayer(ressource=mid3 10, x=950, y=0, image=0)                                             ⟨232301⟩
c17.vx = 0                                                                                            ⟨232308⟩
c17.vy = 0                                                                                            ⟨232310⟩
c17.vx = v446                                                                                         ⟨232313⟩
c17.vy = 0                                                                                            ⟨232315⟩
c18 = MovingOverlayLayer(ressource=mid3 8, x=573, y=0, vx=-6, vy=0, image=0)                          ⟨232338⟩
c19 = MovingMaskLayer(ressource=mid3 12, x=-30, y=-53, vx=v366, vy=0, image=0)                        ⟨232349⟩
c20 = MovingOverlayLayer(ressource=mid3 3, x=-30, y=-30, vx=v366, vy=0, image=0)                      ⟨232360⟩
calque_table(calque=c19, table=v354)                                                                  ⟨232365⟩
palette_copie(destination=pal1, source=pal6(mid3 20))                                                 ⟨232378⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨232386⟩
ajoute c6 à scène3                                                                                    ⟨232391⟩
ajoute c7 à scène3                                                                                    ⟨232396⟩
ajoute c8 à scène3                                                                                    ⟨232401⟩
ajoute c9 à scène3                                                                                    ⟨232406⟩
ajoute c10 à scène3                                                                                   ⟨232411⟩
ajoute c11 à scène3                                                                                   ⟨232416⟩
ajoute c12 à scène3                                                                                   ⟨232421⟩
ajoute c13 à scène3                                                                                   ⟨232426⟩
ajoute c14 à scène3                                                                                   ⟨232431⟩
ajoute c15 à scène3                                                                                   ⟨232436⟩
ajoute c18 à scène3                                                                                   ⟨232441⟩
ajoute c17 à scène3                                                                                   ⟨232446⟩
ajoute c16 à scène3                                                                                   ⟨232451⟩
ajoute c19 à scène3                                                                                   ⟨232456⟩
ajoute c20 à scène3                                                                                   ⟨232461⟩
tant que (scène3.compteur < 189) et (scène3.terminée == 0) :
    si = scène3.compteur                                                                              ⟨232467⟩
    si scène3.compteur == 9 :
        v368 = 0                                                                                      ⟨232470⟩
    si scène3.compteur > 10 :
        si scène3.compteur < 17 :
            v366 = v366 - 1                                                                           ⟨232477⟩
            v456 = v366                                                                               ⟨232479⟩
            c19.vx = v456                                                                             ⟨232482⟩
            c19.vy = 0                                                                                ⟨232484⟩
            v458 = v366                                                                               ⟨232486⟩
            c20.vx = v458                                                                             ⟨232489⟩
            c20.vy = 0                                                                                ⟨232491⟩
    si c8.x_absolu() < -319 :
        déplace(calque=c8, dx=640, dy=0)                                                              ⟨232505⟩
    si c10.x_absolu() < -319 :
        déplace(calque=c10, dx=640, dy=0)                                                             ⟨232519⟩
    si c12.x_absolu() < -319 :
        déplace(calque=c12, dx=640, dy=0)                                                             ⟨232533⟩
    si c14.x_absolu() < -319 :
        déplace(calque=c14, dx=640, dy=0)                                                             ⟨232547⟩
    si c13.x_absolu() < -319 :
        déplace(calque=c13, dx=640, dy=0)                                                             ⟨232561⟩
    si c15.x_absolu() < -319 :
        déplace(calque=c15, dx=640, dy=0)                                                             ⟨232575⟩
    si scène3.compteur > 68 :
        si di != 0 :
            v370 = v370 + 1                                                                           ⟨232591⟩
            si v370 == 5 :
                di = di + 1                                                                           ⟨232595⟩
                v370_avant = v370                                                                     ⟨232596⟩
                v370 = 0                                                                              ⟨232596⟩
            si di >= -1 :
                di = 0                                                                                ⟨232601⟩
            v460 = di / 6                                                                             ⟨232608⟩
            c6.vx = v460                                                                              ⟨232611⟩
            c6.vy = 0                                                                                 ⟨232613⟩
            v462 = di / 6                                                                             ⟨232618⟩
            c7.vx = v462                                                                              ⟨232621⟩
            c7.vy = 0                                                                                 ⟨232623⟩
            v464 = di / 3                                                                             ⟨232628⟩
            c8.vx = v464                                                                              ⟨232631⟩
            c8.vy = 0                                                                                 ⟨232633⟩
            v466 = di / 3                                                                             ⟨232638⟩
            c9.vx = v466                                                                              ⟨232641⟩
            c9.vy = 0                                                                                 ⟨232643⟩
            v468 = (di·2) / 3                                                                         ⟨232649⟩
            c10.vx = v468                                                                             ⟨232652⟩
            c10.vy = 0                                                                                ⟨232654⟩
            v470 = (di·2) / 3                                                                         ⟨232660⟩
            c11.vx = v470                                                                             ⟨232663⟩
            c11.vy = 0                                                                                ⟨232665⟩
            v472 = di                                                                                 ⟨232666⟩
            c12.vx = v472                                                                             ⟨232669⟩
            c12.vy = 0                                                                                ⟨232671⟩
            v474 = di                                                                                 ⟨232672⟩
            c13.vx = v474                                                                             ⟨232675⟩
            c13.vy = 0                                                                                ⟨232677⟩
            v476 = (di·4) / 3                                                                         ⟨232683⟩
            c14.vx = v476                                                                             ⟨232686⟩
            c14.vy = 0                                                                                ⟨232688⟩
            v478 = (di·4) / 3                                                                         ⟨232694⟩
            c15.vx = v478                                                                             ⟨232697⟩
            c15.vy = 0                                                                                ⟨232699⟩
            v480 = di                                                                                 ⟨232700⟩
            c17.vx = v480                                                                             ⟨232703⟩
            c17.vy = 0                                                                                ⟨232705⟩
            v482 = (di·4) / 3                                                                         ⟨232711⟩
            c16.vx = v482                                                                             ⟨232714⟩
            c16.vy = 0                                                                                ⟨232716⟩
            v484 = (di·2) / 3                                                                         ⟨232722⟩
            c18.vx = v484                                                                             ⟨232725⟩
            c18.vy = 0                                                                                ⟨232727⟩
    si scène3.compteur == 37 :
        v368 = 0                                                                                      ⟨232733⟩
    si scène3.compteur > 38 :
        si scène3.compteur < 55 :
            v368 = v368 + 1                                                                           ⟨232740⟩
            si v368 == 5 :
                v366 = v366 - 1                                                                       ⟨232744⟩
                v486 = v366                                                                           ⟨232746⟩
                c19.vx = v486                                                                         ⟨232749⟩
                c19.vy = 0                                                                            ⟨232751⟩
                v488 = v366                                                                           ⟨232753⟩
                c20.vx = v488                                                                         ⟨232756⟩
                c20.vy = 0                                                                            ⟨232758⟩
                v368 = 0                                                                              ⟨232759⟩
    si scène3.compteur == 55 :
        v368 = 0                                                                                      ⟨232765⟩
    si scène3.compteur > 54 :
        si scène3.compteur < 132 :
            v368 = v368 + 1                                                                           ⟨232772⟩
            si v368 == 4 :
                v366 = v366 + 1                                                                       ⟨232776⟩
                v490 = v366                                                                           ⟨232778⟩
                c19.vx = v490                                                                         ⟨232781⟩
                c19.vy = 0                                                                            ⟨232783⟩
                v492 = v366                                                                           ⟨232785⟩
                c20.vx = v492                                                                         ⟨232788⟩
                c20.vy = 0                                                                            ⟨232790⟩
                v368 = 0                                                                              ⟨232791⟩
    si scène3.compteur == 132 :
        v368 = 0                                                                                      ⟨232797⟩
    si scène3.compteur > 131 :
        v368 = v368 + 1                                                                               ⟨232802⟩
        si v368 == 3 :
            si v366 > 0 :
                v366 = v366 - 1                                                                       ⟨232808⟩
                v494 = v366                                                                           ⟨232810⟩
                c19.vx = v494                                                                         ⟨232813⟩
                c19.vy = 0                                                                            ⟨232815⟩
                v496 = v366                                                                           ⟨232817⟩
                c20.vx = v496                                                                         ⟨232820⟩
                c20.vy = 0                                                                            ⟨232822⟩
            v368 = 0                                                                                  ⟨232825⟩
    si scène3.compteur < 50 ou v366 != 0 :
        CRT_Rand()                                                                                    ⟨232835⟩
        v498 = ((CRT_Rand()·3) / 32768) + 1                                                           ⟨232842⟩
        c19.image = v498                                                                              ⟨232845⟩
    si scène3.compteur & 1 != 0 :
        v500 = scène3.compteur % 3                                                                    ⟨232854⟩
        c18.image = v500                                                                              ⟨232857⟩
    si scène3.compteur < 21 :
        v502 = (scène3.compteur % 4) + 1                                                              ⟨232867⟩
        c20.image = v502                                                                              ⟨232870⟩
    sinon :
        si v366 != 0 :
            si scène3.compteur & 1 != 0 :
                v504 = (v374 % 4) + 1                                                                 ⟨232884⟩
                v374_avant = v374 / 4                                                                 ⟨232885⟩
                v374_avant = (v374 % 4) + 1                                                           ⟨232885⟩
                v374 = v374 + 1                                                                       ⟨232885⟩
                c20.image = v504                                                                      ⟨232888⟩
    si scène3.compteur == 160 :
        si canal7.+0 != 0 :
            AIL_stop_sequence(pilote=canal7.+0→4, séquence=v1318)                                     ⟨232899⟩
    si scène3.compteur == 161 :
        si v2 != 0 :
            v506 = word_48ECA                                                                         ⟨232910⟩
            si canal8.+0 != 0 :
                AIL_start_sequence(pilote=canal8.+0→4, séquence=v1332)                                ⟨232917⟩
                AIL_set_relative_volume_30C66(canal8.+0→4, v1332, v506, 0)                            ⟨232924⟩
        ajoute c5 à scène3                                                                            ⟨232933⟩
        v372 = 0                                                                                      ⟨232935⟩
    si scène3.compteur > 161 :
        si v372 > 7 :
            v372 = 7                                                                                  ⟨232942⟩
        v510 = v372                                                                                   ⟨232946⟩
        c5.image = v510                                                                               ⟨232949⟩
        si scène3.compteur & 1 != 0 :
            v372 = v372 + 1                                                                           ⟨232952⟩
    si scène3.compteur == 163 :
        si v2 != 0 :
            canal_enregistre(canal=canal2, ressource=asoundfx 40, x=0)                                ⟨232965⟩
            v512 = word_48EF2                                                                         ⟨232968⟩
            si canal2.+0 != 0 :
                AIL_start_sequence(pilote=canal2.+0→4, séquence=v1248)                                ⟨232975⟩
                AIL_set_relative_volume_30C66(canal2.+0→4, v1248, v512, 0)                            ⟨232982⟩
    Scene_Tick(scène=scène3)                                                                          ⟨233000⟩
Heap_FreeAndCoalesce_2C3FC(v354)                                                                      ⟨233027⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨233032⟩
v359 = 0                                                                                              ⟨233051⟩
v358 = 0                                                                                              ⟨233052⟩
v347 = 0                                                                                              ⟨233070⟩
v346 = 0                                                                                              ⟨233071⟩
v337 = 0                                                                                              ⟨233089⟩
v336 = 0                                                                                              ⟨233090⟩
v327 = 0                                                                                              ⟨233108⟩
v326 = 0                                                                                              ⟨233109⟩
v317 = 0                                                                                              ⟨233127⟩
v316 = 0                                                                                              ⟨233128⟩
v307 = 0                                                                                              ⟨233146⟩
v306 = 0                                                                                              ⟨233147⟩
v297 = 0                                                                                              ⟨233165⟩
v296 = 0                                                                                              ⟨233166⟩
v287 = 0                                                                                              ⟨233184⟩
v286 = 0                                                                                              ⟨233185⟩
v266 = 0                                                                                              ⟨233223⟩
v256 = 0                                                                                              ⟨233242⟩
v246 = 0                                                                                              ⟨233261⟩
canal_arrête(canal=canal8)                                                                            ⟨233264⟩
v1330 = 0                                                                                             ⟨233282⟩
v1325 = 0                                                                                             ⟨233283⟩
v1324 = 0                                                                                             ⟨233284⟩
canal_arrête(canal=canal7)                                                                            ⟨233287⟩
v1316 = 0                                                                                             ⟨233305⟩
v1310 = 0                                                                                             ⟨233307⟩
v232 = 0                                                                                              ⟨233326⟩
v223 = 0                                                                                              ⟨233344⟩
v222 = 0                                                                                              ⟨233345⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal6)                                                                        ⟨233354⟩
    v1302 = 0                                                                                         ⟨233372⟩
    v1297 = 0                                                                                         ⟨233373⟩
    v1296 = 0                                                                                         ⟨233374⟩
    canal_arrête(canal=canal5)                                                                        ⟨233377⟩
    v1288 = 0                                                                                         ⟨233395⟩
    v1283 = 0                                                                                         ⟨233396⟩
    v1282 = 0                                                                                         ⟨233397⟩
    canal_arrête(canal=canal4)                                                                        ⟨233400⟩
    v1274 = 0                                                                                         ⟨233418⟩
    v1269 = 0                                                                                         ⟨233419⟩
    v1268 = 0                                                                                         ⟨233420⟩
    canal_arrête(canal=canal3)                                                                        ⟨233423⟩
    v1260 = 0                                                                                         ⟨233441⟩
    v1255 = 0                                                                                         ⟨233442⟩
    v1254 = 0                                                                                         ⟨233443⟩
    canal_arrête(canal=canal2)                                                                        ⟨233446⟩
    v1246 = 0                                                                                         ⟨233464⟩
    v1241 = 0                                                                                         ⟨233465⟩
    v1240 = 0                                                                                         ⟨233466⟩
    v203 = 0                                                                                          ⟨233484⟩
    v202 = 0                                                                                          ⟨233485⟩
    v193 = 0                                                                                          ⟨233503⟩
    v192 = 0                                                                                          ⟨233504⟩
    v183 = 0                                                                                          ⟨233522⟩
    v182 = 0                                                                                          ⟨233523⟩
    v173 = 0                                                                                          ⟨233541⟩
    v172 = 0                                                                                          ⟨233542⟩
    v163 = 0                                                                                          ⟨233560⟩
    v162 = 0                                                                                          ⟨233561⟩
    v147 = 0                                                                                          ⟨233584⟩
    v146 = 0                                                                                          ⟨233585⟩
    v131 = 0                                                                                          ⟨233608⟩
    v130 = 0                                                                                          ⟨233609⟩
    v115 = 0                                                                                          ⟨233632⟩
    v114 = 0                                                                                          ⟨233633⟩
    v99 = 0                                                                                           ⟨233656⟩
    v98 = 0                                                                                           ⟨233657⟩
    v83 = 0                                                                                           ⟨233680⟩
    v82 = 0                                                                                           ⟨233681⟩
    v67 = 0                                                                                           ⟨233704⟩
    v66 = 0                                                                                           ⟨233705⟩
    v51 = 0                                                                                           ⟨233728⟩
    v50 = 0                                                                                           ⟨233729⟩
    v35 = 0                                                                                           ⟨233752⟩
    v34 = 0                                                                                           ⟨233753⟩
    canal_arrête(canal=canal1)                                                                        ⟨233756⟩
    v1232 = 0                                                                                         ⟨233774⟩
    v1227 = 0                                                                                         ⟨233775⟩
    v1226 = 0                                                                                         ⟨233776⟩
    v23 = 0                                                                                           ⟨233799⟩
    v22 = 0                                                                                           ⟨233800⟩
    retour                                                                                            ⟨233842⟩
v224 = 2                                                                                              ⟨233847⟩
v223 = 0                                                                                              ⟨233848⟩
v222 = 0                                                                                              ⟨233849⟩
charge(optshps 116)                                                                                   ⟨233856⟩
v232 = 0                                                                                              ⟨233861⟩
charge(mid3 24)                                                                                       ⟨233868⟩
charge(mid3 13)                                                                                       ⟨233880⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨233890⟩
c21 = Layer(ressource=optshps 116, x=0, y=-40)                                                        ⟨233897⟩
c22 = Layer(ressource=mid3 24, x=0, y=0)                                                              ⟨233905⟩
c23 = Layer(ressource=mid3 13, x=0, y=0)                                                              ⟨233913⟩
c24 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=128)                               ⟨233921⟩
si = c24                                                                                              ⟨233923⟩

──── scène4 ────
scène4 = Scene_Create(cadence=10, palette=255, surface=&v608)                                         ⟨233930⟩
palette_copie(destination=pal1, source=pal2(optpals 21))                                              ⟨233943⟩
palette_copie(destination=pal1, source=pal7(mid3 21))                                                 ⟨233952⟩
palette_copie(destination=pal1, source=pal9(convdata type 2 "normal"))                                ⟨233961⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨233969⟩
ajoute c21 à scène4                                                                                   ⟨233974⟩
ajoute c22 à scène4                                                                                   ⟨233979⟩
ajoute c23 à scène4                                                                                   ⟨233984⟩
ajoute c24 à scène4                                                                                   ⟨233989⟩
tête_image_de_base(tête=c24, image=14)                                                                ⟨233993⟩
charge(midgames 0)                                                                                    ⟨234005⟩
c25 = ToggleLayer(ressource=midgames 0, x=160, y=128, sens=1)                                         ⟨234013⟩
ajoute c25 à scène4                                                                                   ⟨234019⟩
si v2 != 0 :
    canal_enregistre(canal=canal2, ressource=asoundfx 40, x=0)                                        ⟨234028⟩
    v278 = word_48EF2                                                                                 ⟨234031⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v1248)                                        ⟨234038⟩
        AIL_set_relative_volume_30C66(canal2.+0→4, v1248, v278, v280)                                 ⟨234045⟩
tant que (scène4.compteur < 45) et (scène4.terminée == 0) :
    di = scène4.compteur                                                                              ⟨234055⟩
    si scène4.compteur == 10 :
        tête_image_de_base(tête=c24, image=14)                                                        ⟨234060⟩
    si scène4.compteur == 19 :
        tête_image_de_base(tête=c24, image=12)                                                        ⟨234068⟩
    si scène4.compteur == 20 :
        tête_image_de_base(tête=c24, image=14)                                                        ⟨234076⟩
    si scène4.compteur == 32 :
        tête_image_de_base(tête=c24, image=12)                                                        ⟨234084⟩
    si scène4.compteur == 33 :
        tête_image_de_base(tête=c24, image=14)                                                        ⟨234092⟩
    Scene_Tick(scène=scène4)                                                                          ⟨234108⟩
v269 = 0                                                                                              ⟨234151⟩
v268 = 0                                                                                              ⟨234152⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨234156⟩
v253 = 0                                                                                              ⟨234175⟩
v243 = 0                                                                                              ⟨234194⟩
v242 = 0                                                                                              ⟨234195⟩
v232 = 0                                                                                              ⟨234214⟩
v223 = 0                                                                                              ⟨234232⟩
v222 = 0                                                                                              ⟨234233⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal6)                                                                        ⟨234242⟩
    v1302 = 0                                                                                         ⟨234260⟩
    v1297 = 0                                                                                         ⟨234261⟩
    v1296 = 0                                                                                         ⟨234262⟩
    canal_arrête(canal=canal5)                                                                        ⟨234265⟩
    v1288 = 0                                                                                         ⟨234283⟩
    v1283 = 0                                                                                         ⟨234284⟩
    v1282 = 0                                                                                         ⟨234285⟩
    canal_arrête(canal=canal4)                                                                        ⟨234288⟩
    v1274 = 0                                                                                         ⟨234306⟩
    v1269 = 0                                                                                         ⟨234307⟩
    v1268 = 0                                                                                         ⟨234308⟩
    canal_arrête(canal=canal3)                                                                        ⟨234311⟩
    v1260 = 0                                                                                         ⟨234329⟩
    v1255 = 0                                                                                         ⟨234330⟩
    v1254 = 0                                                                                         ⟨234331⟩
    canal_arrête(canal=canal2)                                                                        ⟨234334⟩
    v1246 = 0                                                                                         ⟨234352⟩
    v1241 = 0                                                                                         ⟨234353⟩
    v1240 = 0                                                                                         ⟨234354⟩
    v203 = 0                                                                                          ⟨234372⟩
    v202 = 0                                                                                          ⟨234373⟩
    v193 = 0                                                                                          ⟨234391⟩
    v192 = 0                                                                                          ⟨234392⟩
    v183 = 0                                                                                          ⟨234410⟩
    v182 = 0                                                                                          ⟨234411⟩
    v173 = 0                                                                                          ⟨234429⟩
    v172 = 0                                                                                          ⟨234430⟩
    v163 = 0                                                                                          ⟨234448⟩
    v162 = 0                                                                                          ⟨234449⟩
    v147 = 0                                                                                          ⟨234472⟩
    v146 = 0                                                                                          ⟨234473⟩
    v131 = 0                                                                                          ⟨234496⟩
    v130 = 0                                                                                          ⟨234497⟩
    v115 = 0                                                                                          ⟨234520⟩
    v114 = 0                                                                                          ⟨234521⟩
    v99 = 0                                                                                           ⟨234544⟩
    v98 = 0                                                                                           ⟨234545⟩
    v83 = 0                                                                                           ⟨234568⟩
    v82 = 0                                                                                           ⟨234569⟩
    v67 = 0                                                                                           ⟨234592⟩
    v66 = 0                                                                                           ⟨234593⟩
    v51 = 0                                                                                           ⟨234616⟩
    v50 = 0                                                                                           ⟨234617⟩
    v35 = 0                                                                                           ⟨234640⟩
    v34 = 0                                                                                           ⟨234641⟩
    canal_arrête(canal=canal1)                                                                        ⟨234644⟩
    v1232 = 0                                                                                         ⟨234662⟩
    v1227 = 0                                                                                         ⟨234663⟩
    v1226 = 0                                                                                         ⟨234664⟩
    v23 = 0                                                                                           ⟨234687⟩
    v22 = 0                                                                                           ⟨234688⟩
    retour                                                                                            ⟨234730⟩
v224 = 2                                                                                              ⟨234735⟩
v223 = 0                                                                                              ⟨234736⟩
v222 = 0                                                                                              ⟨234737⟩
charge(mid3 1)                                                                                        ⟨234744⟩

──── scène5 ────
scène5 = Scene_Create(cadence=15, palette=255, surface=&v608)                                         ⟨234752⟩
c26 = OverlayImageLayer(ressource=mid3 1, x=0, y=0, image=0)                                          ⟨234760⟩
di = c26                                                                                              ⟨234762⟩
palette_copie(destination=pal1, source=pal8(mid3 18))                                                 ⟨234774⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨234782⟩
ajoute c26 à scène5                                                                                   ⟨234787⟩
si v2 != 0 :
    canal_enregistre(canal=canal2, ressource=asoundfx 40, x=0)                                        ⟨234796⟩
    v230 = word_48EF2 - 20                                                                            ⟨234800⟩
    v232 = 0                                                                                          ⟨234801⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v1248)                                        ⟨234807⟩
        AIL_set_relative_volume_30C66(canal2.+0→4, v1248, v230, v232)                                 ⟨234814⟩
tant que (scène5.compteur < 45) et (scène5.terminée == 0) :
    si = scène5.compteur                                                                              ⟨234824⟩
    si scène5.compteur & 1 != 0 :
        v234 = scène5.compteur % 3                                                                    ⟨234831⟩
        c26.image = v234                                                                              ⟨234833⟩
    Scene_Tick(scène=scène5)                                                                          ⟨234848⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨234874⟩
v223 = 0                                                                                              ⟨234893⟩
v222 = 0                                                                                              ⟨234894⟩
fondu_disparition(palette=pal1, couleur=&v18, pas=2, premier=0, nombre=256)                           ⟨234902⟩
canal_arrête(canal=canal6)                                                                            ⟨234906⟩
v1302 = 0                                                                                             ⟨234924⟩
v1297 = 0                                                                                             ⟨234925⟩
v1296 = 0                                                                                             ⟨234926⟩
canal_arrête(canal=canal5)                                                                            ⟨234929⟩
v1288 = 0                                                                                             ⟨234947⟩
v1283 = 0                                                                                             ⟨234948⟩
v1282 = 0                                                                                             ⟨234949⟩
canal_arrête(canal=canal4)                                                                            ⟨234952⟩
v1274 = 0                                                                                             ⟨234970⟩
v1269 = 0                                                                                             ⟨234971⟩
v1268 = 0                                                                                             ⟨234972⟩
canal_arrête(canal=canal3)                                                                            ⟨234975⟩
v1260 = 0                                                                                             ⟨234993⟩
v1255 = 0                                                                                             ⟨234994⟩
v1254 = 0                                                                                             ⟨234995⟩
canal_arrête(canal=canal2)                                                                            ⟨234998⟩
v1246 = 0                                                                                             ⟨235016⟩
v1241 = 0                                                                                             ⟨235017⟩
v1240 = 0                                                                                             ⟨235018⟩
v203 = 0                                                                                              ⟨235036⟩
v202 = 0                                                                                              ⟨235037⟩
v193 = 0                                                                                              ⟨235055⟩
v192 = 0                                                                                              ⟨235056⟩
v183 = 0                                                                                              ⟨235074⟩
v182 = 0                                                                                              ⟨235075⟩
v173 = 0                                                                                              ⟨235093⟩
v172 = 0                                                                                              ⟨235094⟩
v163 = 0                                                                                              ⟨235112⟩
v162 = 0                                                                                              ⟨235113⟩
v147 = 0                                                                                              ⟨235136⟩
v146 = 0                                                                                              ⟨235137⟩
v131 = 0                                                                                              ⟨235160⟩
v130 = 0                                                                                              ⟨235161⟩
v115 = 0                                                                                              ⟨235184⟩
v114 = 0                                                                                              ⟨235185⟩
v99 = 0                                                                                               ⟨235208⟩
v98 = 0                                                                                               ⟨235209⟩
v83 = 0                                                                                               ⟨235232⟩
v82 = 0                                                                                               ⟨235233⟩
v67 = 0                                                                                               ⟨235256⟩
v66 = 0                                                                                               ⟨235257⟩
v51 = 0                                                                                               ⟨235280⟩
v50 = 0                                                                                               ⟨235281⟩
v35 = 0                                                                                               ⟨235304⟩
v34 = 0                                                                                               ⟨235305⟩
canal_arrête(canal=canal1)                                                                            ⟨235308⟩
v1232 = 0                                                                                             ⟨235326⟩
v1227 = 0                                                                                             ⟨235327⟩
v1226 = 0                                                                                             ⟨235328⟩
v23 = 0                                                                                               ⟨235351⟩
v22 = 0                                                                                               ⟨235352⟩
retour                                                                                                ⟨235394⟩
```

## Tableaux du segment de données

