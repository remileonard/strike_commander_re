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
        flux1.ouvre(chemin1, 1)                                                                       ⟨228752⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨228758⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨228764⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨228768⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨228770⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨228778⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨228782⟩
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
        flux1.ouvre(chemin1, 1)                                                                       ⟨228888⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨228894⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨228900⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨228904⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨228906⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨228914⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨228918⟩
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
    tant que si < 2 :
        charge(asoundfx v210[si])                                                                     ⟨229369⟩
        canal_enregistre(canal=canal7, ressource=asoundfx v210[si], x=0)                              ⟨229376⟩
        canal_arrête(canal=canal7)                                                                    ⟨229380⟩
    canal_arrête(canal=canal7)                                                                        ⟨229412⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal6)                                                                        ⟨229443⟩
    canal_arrête(canal=canal5)                                                                        ⟨229466⟩
    canal_arrête(canal=canal4)                                                                        ⟨229489⟩
    canal_arrête(canal=canal3)                                                                        ⟨229512⟩
    canal_arrête(canal=canal2)                                                                        ⟨229535⟩
    canal_arrête(canal=canal1)                                                                        ⟨229845⟩
    retour                                                                                            ⟨229931⟩
si v1 != 0 :
    v212 = word_48F76                                                                                 ⟨229938⟩
    si canal1.+0 != 0 :
        AIL_start_sequence(pilote=canal1.+0→4, séquence=v1234)                                        ⟨229945⟩
        sub_30C66(canal1.+0→4, v1234, v212, 0)                                                        ⟨229952⟩

──── scène1 ────
scène1 = Scene_Create(cadence=15, palette=255, surface=&v608)                                         ⟨229964⟩
charge(mid3 25)                                                                                       ⟨229976⟩
c1 = OverlayImageLayer(ressource=mid3 25, x=0, y=0, image=0)                                          ⟨229984⟩
palette_copie(destination=pal1, source=pal3(mid3 26))                                                 ⟨229994⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨230006⟩
ajoute c1 à scène1                                                                                    ⟨230011⟩
si v2 != 0 :
    canal_enregistre(canal=canal3, ressource=asoundfx 59, x=0)                                        ⟨230021⟩
    v230 = word_48F18                                                                                 ⟨230024⟩
    v232 = 0                                                                                          ⟨230025⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v1262)                                        ⟨230031⟩
        sub_30C66(canal3.+0→4, v1262, v230, v232)                                                     ⟨230038⟩
tant que (scène1.compteur < 30) et (scène1.terminée == 0) :
    v234 = si                                                                                         ⟨230048⟩
    c1.image = v234                                                                                   ⟨230051⟩
    Scene_Tick(scène=scène1)                                                                          ⟨230054⟩
si v2 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨230089⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨230115⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal6)                                                                        ⟨230125⟩
    canal_arrête(canal=canal5)                                                                        ⟨230148⟩
    canal_arrête(canal=canal4)                                                                        ⟨230171⟩
    canal_arrête(canal=canal3)                                                                        ⟨230194⟩
    canal_arrête(canal=canal2)                                                                        ⟨230217⟩
    canal_arrête(canal=canal1)                                                                        ⟨230527⟩
    retour                                                                                            ⟨230613⟩
si v2 != 0 :
    canal_enregistre(canal=canal4, ressource=asoundfx 60, x=0)                                        ⟨230628⟩
    canal_enregistre(canal=canal5, ressource=asoundfx 100, x=0)                                       ⟨230635⟩
    canal_enregistre(canal=canal6, ressource=asoundfx 101, x=0)                                       ⟨230642⟩
    v216 = word_48F1A                                                                                 ⟨230645⟩
    si canal4.+0 != 0 :
        AIL_start_sequence(pilote=canal4.+0→4, séquence=v1276)                                        ⟨230652⟩
        sub_30C66(canal4.+0→4, v1276, v216, 0)                                                        ⟨230659⟩

──── scène2 ────
scène2 = Scene_Create(cadence=20, palette=255, surface=&v608)                                         ⟨230671⟩
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
tant que (scène2.compteur < 75) et (scène2.terminée == 0) :
    si scène2.compteur < 29 :
        v256 = si                                                                                     ⟨230773⟩
        c3.image = v256                                                                               ⟨230777⟩
    sinon :
        si scène2.compteur == 29 :
            retire(parent=scène2, calque=c3)                                                          ⟨230787⟩
            c3.détruit(3)                                                                             ⟨230795⟩
            ajoute c4 à scène2                                                                        ⟨230803⟩
            Scene_SetFps(scène=scène2, cadence=15)                                                    ⟨230808⟩
            v258 = 0                                                                                  ⟨230811⟩
            c4.image = v258                                                                           ⟨230815⟩
        sinon :
            v260 = si                                                                                 ⟨230820⟩
            c4.image = v260                                                                           ⟨230824⟩
    si scène2.compteur == 50 :
        si v2 != 0 :
            canal_enregistre(canal=canal5, ressource=asoundfx 100, x=0)                               ⟨230837⟩
            v262 = word_48F6A                                                                         ⟨230840⟩
            v264 = 0                                                                                  ⟨230841⟩
            si canal5.+0 != 0 :
                AIL_start_sequence(pilote=canal5.+0→4, séquence=v1290)                                ⟨230847⟩
                sub_30C66(canal5.+0→4, v1290, v262, v264)                                             ⟨230854⟩
    si scène2.compteur == 52 :
        si v2 != 0 :
            canal_enregistre(canal=canal6, ressource=asoundfx 101, x=0)                               ⟨230869⟩
            v266 = word_48F6C                                                                         ⟨230872⟩
            v268 = 0                                                                                  ⟨230873⟩
            si canal6.+0 != 0 :
                AIL_start_sequence(pilote=canal6.+0→4, séquence=v1304)                                ⟨230879⟩
                sub_30C66(canal6.+0→4, v1304, v266, v268)                                             ⟨230886⟩
    si scène2.compteur == 59 :
        si v2 != 0 :
            v270 = word_48F6C                                                                         ⟨230897⟩
            v272 = 0                                                                                  ⟨230898⟩
            si canal6.+0 != 0 :
                AIL_start_sequence(pilote=canal6.+0→4, séquence=v1304)                                ⟨230904⟩
                sub_30C66(canal6.+0→4, v1304, v270, v272)                                             ⟨230911⟩
    si ('field', 42, 29) == 0 :
        v274 = ('field', 42, 29)                                                                      ⟨230927⟩
        c2.image = v274                                                                               ⟨230930⟩
    Scene_Tick(scène=scène2)                                                                          ⟨230945⟩
si v2 != 0 :
    canal_arrête(canal=canal5)                                                                        ⟨230975⟩
    canal_arrête(canal=canal6)                                                                        ⟨230979⟩
    canal_arrête(canal=canal4)                                                                        ⟨230983⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨231047⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal6)                                                                        ⟨231057⟩
    canal_arrête(canal=canal5)                                                                        ⟨231080⟩
    canal_arrête(canal=canal4)                                                                        ⟨231103⟩
    canal_arrête(canal=canal3)                                                                        ⟨231126⟩
    canal_arrête(canal=canal2)                                                                        ⟨231149⟩
    canal_arrête(canal=canal1)                                                                        ⟨231459⟩
    retour                                                                                            ⟨231545⟩
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
    si canal7.+0 != 0 :
        AIL_start_sequence(pilote=canal7.+0→4, séquence=v1318)                                        ⟨231623⟩
        sub_30C66(canal7.+0→4, v1318, v240, v242)                                                     ⟨231630⟩
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
CRT_MemFamily_Extra1(v354, données(mid3 23.+0), 256)                                                  ⟨231797⟩

──── scène3 ────
scène3 = Scene_Create(cadence=20, palette=255, surface=&v608)                                         ⟨231824⟩
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
sub_A837(0, mid3 8, 573, 0, -6, 0, 0)                                                                 ⟨232338⟩
v450 = sub_A837(0, mid3 8, 573, 0, -6, 0, 0)                                                          ⟨232340⟩
sub_B995(0, mid3 12, -30, -53, v366, 0, 0)                                                            ⟨232349⟩
v452 = sub_B995(0, mid3 12, -30, -53, v366, 0, 0)                                                     ⟨232351⟩
sub_A837(0, mid3 3, -30, -30, v366, 0, 0)                                                             ⟨232360⟩
v454 = sub_A837(0, mid3 3, -30, -30, v366, 0, 0)                                                      ⟨232362⟩
sub_BA1C(v452, v354)                                                                                  ⟨232365⟩
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
ajoute v450 à scène3                                                                                  ⟨232441⟩
ajoute c17 à scène3                                                                                   ⟨232446⟩
ajoute c16 à scène3                                                                                   ⟨232451⟩
ajoute v452 à scène3                                                                                  ⟨232456⟩
ajoute v454 à scène3                                                                                  ⟨232461⟩
tant que (scène3.compteur < 189) et (scène3.terminée == 0) :
    si scène3.compteur == 9 :
        v368 = 0                                                                                      ⟨232470⟩
    si scène3.compteur > 10 :
        si scène3.compteur < 17 :
            v366 = v366 - 1                                                                           ⟨232477⟩
            v456 = v366                                                                               ⟨232479⟩
            v452→29 = v456                                                                            ⟨232482⟩
            v452→31 = 0                                                                               ⟨232484⟩
            v458 = v366                                                                               ⟨232486⟩
            v454→29 = v458                                                                            ⟨232489⟩
            v454→31 = 0                                                                               ⟨232491⟩
    si c8.x_absolu() < -319 :
        sub_2E29E(c8, 640, 0)                                                                         ⟨232505⟩
    si c10.x_absolu() < -319 :
        sub_2E29E(c10, 640, 0)                                                                        ⟨232519⟩
    si c12.x_absolu() < -319 :
        sub_2E29E(c12, 640, 0)                                                                        ⟨232533⟩
    si c14.x_absolu() < -319 :
        sub_2E29E(c14, 640, 0)                                                                        ⟨232547⟩
    si c13.x_absolu() < -319 :
        sub_2E29E(c13, 640, 0)                                                                        ⟨232561⟩
    si c15.x_absolu() < -319 :
        sub_2E29E(c15, 640, 0)                                                                        ⟨232575⟩
    si scène3.compteur > 68 :
        si di != 0 :
            v370 = v370 + 1                                                                           ⟨232591⟩
            si v370 == 5 :
                v370 = 0                                                                              ⟨232596⟩
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
            v450→29 = v484                                                                            ⟨232725⟩
            v450→31 = 0                                                                               ⟨232727⟩
    si scène3.compteur == 37 :
        v368 = 0                                                                                      ⟨232733⟩
    si scène3.compteur > 38 :
        si scène3.compteur < 55 :
            v368 = v368 + 1                                                                           ⟨232740⟩
            si v368 == 5 :
                v366 = v366 - 1                                                                       ⟨232744⟩
                v486 = v366                                                                           ⟨232746⟩
                v452→29 = v486                                                                        ⟨232749⟩
                v452→31 = 0                                                                           ⟨232751⟩
                v488 = v366                                                                           ⟨232753⟩
                v454→29 = v488                                                                        ⟨232756⟩
                v454→31 = 0                                                                           ⟨232758⟩
                v368 = 0                                                                              ⟨232759⟩
    si scène3.compteur == 55 :
        v368 = 0                                                                                      ⟨232765⟩
    si scène3.compteur > 54 :
        si scène3.compteur < 132 :
            v368 = v368 + 1                                                                           ⟨232772⟩
            si v368 == 4 :
                v366 = v366 + 1                                                                       ⟨232776⟩
                v490 = v366                                                                           ⟨232778⟩
                v452→29 = v490                                                                        ⟨232781⟩
                v452→31 = 0                                                                           ⟨232783⟩
                v492 = v366                                                                           ⟨232785⟩
                v454→29 = v492                                                                        ⟨232788⟩
                v454→31 = 0                                                                           ⟨232790⟩
                v368 = 0                                                                              ⟨232791⟩
    si scène3.compteur == 132 :
        v368 = 0                                                                                      ⟨232797⟩
    si scène3.compteur > 131 :
        v368 = v368 + 1                                                                               ⟨232802⟩
        si v368 == 3 :
            si v366 > 0 :
                v366 = v366 - 1                                                                       ⟨232808⟩
                v494 = v366                                                                           ⟨232810⟩
                v452→29 = v494                                                                        ⟨232813⟩
                v452→31 = 0                                                                           ⟨232815⟩
                v496 = v366                                                                           ⟨232817⟩
                v454→29 = v496                                                                        ⟨232820⟩
                v454→31 = 0                                                                           ⟨232822⟩
            v368 = 0                                                                                  ⟨232825⟩
    si scène3.compteur < 50 ou v366 != 0 :
        CRT_Rand()                                                                                    ⟨232835⟩
        v498 = ((CRT_Rand()·3) / -32768) + 1                                                          ⟨232842⟩
        v452→27 = v498                                                                                ⟨232845⟩
    si scène3.compteur & 1 != 0 :
        v500 = ('field', 61, 29)                                                                      ⟨232854⟩
        v450→27 = v500                                                                                ⟨232857⟩
    si scène3.compteur < 21 :
        v502 = ('field', 61, 29) + 1                                                                  ⟨232867⟩
        v454→27 = v502                                                                                ⟨232870⟩
    sinon :
        si v366 != 0 :
            si scène3.compteur & 1 != 0 :
                v504 = ('local', -374) + 1                                                            ⟨232884⟩
                v374 = v374 + 1                                                                       ⟨232885⟩
                v454→27 = v504                                                                        ⟨232888⟩
    si scène3.compteur == 160 :
        si canal7.+0 != 0 :
            AIL_stop_sequence(pilote=canal7.+0→4, séquence=v1318)                                     ⟨232899⟩
    si scène3.compteur == 161 :
        si v2 != 0 :
            v506 = word_48ECA                                                                         ⟨232910⟩
            si canal8.+0 != 0 :
                AIL_start_sequence(pilote=canal8.+0→4, séquence=v1332)                                ⟨232917⟩
                sub_30C66(canal8.+0→4, v1332, v506, 0)                                                ⟨232924⟩
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
                sub_30C66(canal2.+0→4, v1248, v512, 0)                                                ⟨232982⟩
    Scene_Tick(scène=scène3)                                                                          ⟨233000⟩
Heap_FreeAndCoalesce_2C3FC(v354)                                                                      ⟨233027⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨233032⟩
canal_arrête(canal=canal8)                                                                            ⟨233264⟩
canal_arrête(canal=canal7)                                                                            ⟨233287⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal6)                                                                        ⟨233354⟩
    canal_arrête(canal=canal5)                                                                        ⟨233377⟩
    canal_arrête(canal=canal4)                                                                        ⟨233400⟩
    canal_arrête(canal=canal3)                                                                        ⟨233423⟩
    canal_arrête(canal=canal2)                                                                        ⟨233446⟩
    canal_arrête(canal=canal1)                                                                        ⟨233756⟩
    retour                                                                                            ⟨233842⟩
charge(optshps 116)                                                                                   ⟨233856⟩
charge(mid3 24)                                                                                       ⟨233868⟩
charge(mid3 13)                                                                                       ⟨233880⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨233890⟩
c18 = Layer(ressource=optshps 116, x=0, y=-40)                                                        ⟨233897⟩
c19 = Layer(ressource=mid3 24, x=0, y=0)                                                              ⟨233905⟩
c20 = Layer(ressource=mid3 13, x=0, y=0)                                                              ⟨233913⟩
c21 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=128)                               ⟨233921⟩

──── scène4 ────
scène4 = Scene_Create(cadence=10, palette=255, surface=&v608)                                         ⟨233930⟩
palette_copie(destination=pal1, source=pal2(optpals 21))                                              ⟨233943⟩
palette_copie(destination=pal1, source=pal7(mid3 21))                                                 ⟨233952⟩
palette_copie(destination=pal1, source=pal9(convdata type 2 "normal"))                                ⟨233961⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨233969⟩
ajoute c18 à scène4                                                                                   ⟨233974⟩
ajoute c19 à scène4                                                                                   ⟨233979⟩
ajoute c20 à scène4                                                                                   ⟨233984⟩
ajoute c21 à scène4                                                                                   ⟨233989⟩
tête_image_de_base(tête=c21, image=14)                                                                ⟨233993⟩
charge(midgames 0)                                                                                    ⟨234005⟩
c22 = ToggleLayer(ressource=midgames 0, x=160, y=128, sens=1)                                         ⟨234013⟩
ajoute c22 à scène4                                                                                   ⟨234019⟩
si v2 != 0 :
    canal_enregistre(canal=canal2, ressource=asoundfx 40, x=0)                                        ⟨234028⟩
    v278 = word_48EF2                                                                                 ⟨234031⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v1248)                                        ⟨234038⟩
        sub_30C66(canal2.+0→4, v1248, v278, v280)                                                     ⟨234045⟩
tant que (scène4.compteur < 45) et (scène4.terminée == 0) :
    si scène4.compteur == 10 :
        tête_image_de_base(tête=c21, image=14)                                                        ⟨234060⟩
    si scène4.compteur == 19 :
        tête_image_de_base(tête=c21, image=12)                                                        ⟨234068⟩
    si scène4.compteur == 20 :
        tête_image_de_base(tête=c21, image=14)                                                        ⟨234076⟩
    si scène4.compteur == 32 :
        tête_image_de_base(tête=c21, image=12)                                                        ⟨234084⟩
    si scène4.compteur == 33 :
        tête_image_de_base(tête=c21, image=14)                                                        ⟨234092⟩
    Scene_Tick(scène=scène4)                                                                          ⟨234108⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨234156⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal6)                                                                        ⟨234242⟩
    canal_arrête(canal=canal5)                                                                        ⟨234265⟩
    canal_arrête(canal=canal4)                                                                        ⟨234288⟩
    canal_arrête(canal=canal3)                                                                        ⟨234311⟩
    canal_arrête(canal=canal2)                                                                        ⟨234334⟩
    canal_arrête(canal=canal1)                                                                        ⟨234644⟩
    retour                                                                                            ⟨234730⟩
charge(mid3 1)                                                                                        ⟨234744⟩

──── scène5 ────
scène5 = Scene_Create(cadence=15, palette=255, surface=&v608)                                         ⟨234752⟩
c23 = OverlayImageLayer(ressource=mid3 1, x=0, y=0, image=0)                                          ⟨234760⟩
palette_copie(destination=pal1, source=pal8(mid3 18))                                                 ⟨234774⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨234782⟩
ajoute c23 à scène5                                                                                   ⟨234787⟩
si v2 != 0 :
    canal_enregistre(canal=canal2, ressource=asoundfx 40, x=0)                                        ⟨234796⟩
    v230 = word_48EF2 - 20                                                                            ⟨234800⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v1248)                                        ⟨234807⟩
        sub_30C66(canal2.+0→4, v1248, v230, v232)                                                     ⟨234814⟩
tant que (scène5.compteur < 45) et (scène5.terminée == 0) :
    si scène5.compteur & 1 != 0 :
        v234 = ('field', 83, 29)                                                                      ⟨234831⟩
        c23.image = v234                                                                              ⟨234833⟩
    Scene_Tick(scène=scène5)                                                                          ⟨234848⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨234874⟩
fondu_disparition(palette=pal1, couleur=&v18, pas=2, premier=0, nombre=256)                           ⟨234902⟩
canal_arrête(canal=canal6)                                                                            ⟨234906⟩
canal_arrête(canal=canal5)                                                                            ⟨234929⟩
canal_arrête(canal=canal4)                                                                            ⟨234952⟩
canal_arrête(canal=canal3)                                                                            ⟨234975⟩
canal_arrête(canal=canal2)                                                                            ⟨234998⟩
canal_arrête(canal=canal1)                                                                            ⟨235308⟩
retour                                                                                                ⟨235394⟩
```

## Tableaux du segment de données

