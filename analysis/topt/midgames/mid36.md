# Script extrait de `sub_AEDE0` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## sub_AEDE0

```
bp = sp                                                                                               ⟨302208⟩
tableau_textes(tableau=textes1, nombre=12, longueur=200)                                              ⟨302217⟩
byte_4F55C = 0                                                                                        ⟨302219⟩
v7 = 0                                                                                                ⟨302220⟩
v8 = 0                                                                                                ⟨302221⟩
v9 = 0                                                                                                ⟨302222⟩
si word_4CA5B != 0 :
    v8 = 1                                                                                            ⟨302225⟩
v12 = word_4D36E                                                                                      ⟨302229⟩
v518 = 0                                                                                              ⟨302230⟩
TextFormat_ApplyStyleAttribute_357D1(&v518, v12)                                                      ⟨302235⟩
v532 = 0                                                                                              ⟨302237⟩
TextRenderer_ApplyFormatChange_3584E(&v532, 0)                                                        ⟨302246⟩
sub_3499B(&v16, &v532)                                                                                ⟨302252⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨302258⟩
v26 = 0                                                                                               ⟨302264⟩
sub_435F1(pak mid36)                                                                                  ⟨302286⟩
sub_435F1(pak midgames)                                                                               ⟨302307⟩
si v8 != 0 :
    si sub_993C(chemin1) != 0 :
        pak mid36voc.ouvre(chemin1, 1)                                                                ⟨302338⟩
        sub_435F1(pak mid36voc)                                                                       ⟨302342⟩
    sinon :
        v8 = 0                                                                                        ⟨302347⟩
sinon :
    v8 = 0                                                                                            ⟨302347⟩
v36 = 0                                                                                               ⟨302350⟩
v31 = 0                                                                                               ⟨302352⟩
v30 = 0                                                                                               ⟨302353⟩
v38 = byte_4CA58                                                                                      ⟨302355⟩
si v38 - 1 <= 4 :
    si (v38 - 1)·2 == 0 ou ((v38 - 1)·2 != 2) et (((v38 - 1)·2 != 4) et (((v38 - 1)·2 != 6) et ((v38 - 1)·2 != 8))) :
        si sub_993C(chemin1) != 0 :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨302399⟩
            sub_435F1(pak rsoundfx)                                                                   ⟨302403⟩
            flux_iff(flux=flux1)                                                                      ⟨302417⟩
            v3241 = 256                                                                               ⟨302420⟩
            v3245 = 0                                                                                 ⟨302421⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨302429⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨302435⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨302441⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨302445⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨302447⟩
            v298 = 1                                                                                  ⟨302448⟩
            tant que v298 <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨302454⟩
                ds:26002[v298·2] = iff_lit_mot(flux=flux1)                                            ⟨302458⟩
                v298_avant = v298·2                                                                   ⟨302459⟩
                v298 = v298 + 1                                                                       ⟨302459⟩
            iff_ferme_form(flux=flux1)                                                                ⟨302466⟩
            v9 = 1                                                                                    ⟨302468⟩
            iff_ferme_form(flux=flux1)                                                                ⟨302472⟩
        si sub_993C(chemin1) != 0 :
            v7 = 1                                                                                    ⟨302498⟩
            si v9 == 0 :
                word_4F048 = 90                                                                       ⟨302503⟩
    sinon :
        si sub_993C(chemin1) != 0 :
            si word_4CA5D != 0 :
                pak asoundfx.ouvre(chemin1, 1)                                                        ⟨302540⟩
                sub_435F1(pak asoundfx)                                                               ⟨302544⟩
                flux_iff(flux=flux1)                                                                  ⟨302558⟩
                v3241 = 256                                                                           ⟨302561⟩
                v3245 = 0                                                                             ⟨302562⟩
                flux1.ouvre(chemin1, 1)                                                               ⟨302570⟩
                iff_form(flux=flux1, balise='VOLU', x=0)                                              ⟨302576⟩
                iff_chunk(flux=flux1, balise='ADLB', x=1)                                             ⟨302582⟩
                iff_lit_mot(flux=flux1)                                                               ⟨302586⟩
                word_4F048 = iff_lit_mot(flux=flux1)                                                  ⟨302588⟩
                v298 = 1                                                                              ⟨302589⟩
                tant que v298 <= 106 :
                    iff_lit_mot(flux=flux1)                                                           ⟨302595⟩
                    ds:26002[v298·2] = iff_lit_mot(flux=flux1)                                        ⟨302599⟩
                    v298_avant = v298·2                                                               ⟨302600⟩
                    v298 = v298 + 1                                                                   ⟨302600⟩
                iff_ferme_form(flux=flux1)                                                            ⟨302607⟩
                v9 = 1                                                                                ⟨302609⟩
                iff_ferme_form(flux=flux1)                                                            ⟨302613⟩
        si sub_993C(chemin1) != 0 :
            v7 = 1                                                                                    ⟨302656⟩
            si v9 == 0 :
                word_4F048 = 255                                                                      ⟨302661⟩
v46 = word_4B7BE                                                                                      ⟨302668⟩
v44 = word_4B7C0                                                                                      ⟨302670⟩
v42 = word_4B7C2                                                                                      ⟨302672⟩
v40 = byte_4B7C4                                                                                      ⟨302674⟩
si v9 != 0 :
    v3178 = word_4D392                                                                                ⟨302682⟩
    word_4D392 = &v3180                                                                               ⟨302684⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨302693⟩
    v298 = 0                                                                                          ⟨302695⟩
    tant que v298 < 7 :
        charge(asoundfx (v298 + &v46)→0)                                                              ⟨302714⟩
        canal_enregistre(canal=canal1, ressource=asoundfx (v298 + &v46)→0, x=0)                       ⟨302721⟩
        canal_arrête(canal=canal1)                                                                    ⟨302725⟩
        v302 = 0                                                                                      ⟨302744⟩
        v298 = v298 + 1                                                                               ⟨302745⟩
    canal_arrête(canal=canal1)                                                                        ⟨302755⟩
    sub_5C1C(&v3180, 2)                                                                               ⟨302760⟩
v1022 = 436                                                                                           ⟨302764⟩
v1020 = word_4D392                                                                                    ⟨302766⟩
word_4D392 = &v1022                                                                                   ⟨302768⟩
v1022 = 444                                                                                           ⟨302769⟩
v1026 = 0                                                                                             ⟨302772⟩
si v7 != 0 :
    sub_435F1(pak mmusic)                                                                             ⟨302788⟩
    si v8 != 0 :
        v297 = 22                                                                                     ⟨302792⟩
    sinon :
        v297 = 21                                                                                     ⟨302796⟩
    charge(mmusic v297)                                                                               ⟨302807⟩
    canal_init(canal=canal2, pilote=word_4CA59)                                                       ⟨302812⟩
    canal_enregistre(canal=canal2, ressource=mmusic v297, x=0)                                        ⟨302819⟩
v1035 = booléen                                                                                       ⟨302836⟩
v1031 = booléen                                                                                       ⟨302837⟩
si v8 != 0 :
    voix_pilote(voix=voix1, pilote=word_4CA5B)                                                        ⟨302843⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨302860⟩
    v3241 = 256                                                                                       ⟨302863⟩
    v3245 = 0                                                                                         ⟨302864⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨302872⟩
    iff_form(flux=flux1, balise='MG36', x=0)                                                          ⟨302878⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨302884⟩
    v298 = 0                                                                                          ⟨302886⟩
    tant que v298 < 12 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨302894⟩
        v300 = v3224                                                                                  ⟨302897⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·v298), taille=v300)                  ⟨302908⟩
        v3237 = v3220                                                                                 ⟨302911⟩
        v298 = v298 + 1                                                                               ⟨302912⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨302919⟩
    si CRT_Strlen(arg_8) != 0 :
        CRT_Strcat(textes1[2], arg_8)                                                                 ⟨302932⟩
        CRT_Strcat(textes1[2], textes1[4])                                                            ⟨302944⟩
    sinon :
        si CRT_Strlen(arg_6) != 0 :
            CRT_Strcat(textes1[2], arg_6)                                                             ⟨302960⟩
            CRT_Strcat(textes1[2], textes1[4])                                                        ⟨302972⟩
        sinon :
            si CRT_Strlen(arg_10) != 0 :
                CRT_Strcat(textes1[2], arg_10)                                                        ⟨302988⟩
                CRT_Strcat(textes1[2], textes1[4])                                                    ⟨303000⟩
            sinon :
                CRT_Strcat(textes1[2], textes1[3])                                                    ⟨303016⟩
                CRT_Strcat(textes1[2], textes1[4])                                                    ⟨303028⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[10], arg_6)                                                                ⟨303044⟩
        CRT_Strcat(textes1[10], textes1[11])                                                          ⟨303058⟩
    sinon :
        si CRT_Strlen(arg_10) != 0 :
            CRT_Strcat(textes1[10], arg_10)                                                           ⟨303075⟩
            CRT_Strcat(textes1[10], textes1[11])                                                      ⟨303089⟩
        sinon :
            si CRT_Strlen(arg_8) != 0 :
                CRT_Strcat(textes1[10], arg_8)                                                        ⟨303106⟩
                CRT_Strcat(textes1[10], textes1[11])                                                  ⟨303120⟩
            sinon :
                CRT_Strcat(textes1[10], textes1[3])                                                   ⟨303137⟩
                CRT_Strcat(textes1[10], textes1[11])                                                  ⟨303151⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨303158⟩
charge(midgames 42)                                                                                   ⟨303177⟩
charge(midgames 44)                                                                                   ⟨303189⟩
charge(mid36 18)                                                                                      ⟨303201⟩
charge(mid36 0)                                                                                       ⟨303213⟩
charge(mid36 3)                                                                                       ⟨303225⟩
charge(midgames 43)                                                                                   ⟨303237⟩
palette_depuis(pal2(midgames 43))                                                                     ⟨303244⟩
charge(midgames 45)                                                                                   ⟨303256⟩
palette_depuis(pal3(midgames 45))                                                                     ⟨303263⟩
charge(mid36 36)                                                                                      ⟨303275⟩
palette_depuis(pal4(mid36 36))                                                                        ⟨303282⟩
charge(mid36 37)                                                                                      ⟨303294⟩
palette_depuis(pal5(mid36 37))                                                                        ⟨303301⟩
charge(mid36 30)                                                                                      ⟨303313⟩
palette_depuis(pal6(mid36 30))                                                                        ⟨303320⟩
charge(midgames 47)                                                                                   ⟨303332⟩
palette_depuis(pal7(midgames 47))                                                                     ⟨303339⟩
charge_convdata_type2("normal")                                                                       ⟨303349⟩
palette_depuis(pal8(convdata type 2 "normal"))                                                        ⟨303356⟩
charge_convdata_type0("tex", drapeau=3)                                                               ⟨303366⟩
charge_convdata_type0("billy", drapeau=3)                                                             ⟨303376⟩
charge_convdata_type0("miguel", drapeau=3)                                                            ⟨303386⟩
charge_convdata_type0("lyle", drapeau=3)                                                              ⟨303396⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨303406⟩
charge_convdata_type0("virgil", drapeau=3)                                                            ⟨303416⟩
charge_convdata_type0("gwen", drapeau=3)                                                              ⟨303426⟩
v288 = 0                                                                                              ⟨303428⟩
v284 = 2                                                                                              ⟨303429⟩
v283 = 0                                                                                              ⟨303430⟩
v282 = 0                                                                                              ⟨303431⟩
TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                       ⟨303445⟩
v290 = ?                                                                                              ⟨303447⟩
v292 = TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                ⟨303448⟩
v288 = v292                                                                                           ⟨303450⟩
v284 = 2                                                                                              ⟨303451⟩
v283 = 1                                                                                              ⟨303452⟩
v282 = 0                                                                                              ⟨303453⟩
GlyphObject_ConstructWithBuffer_36D56(&v3136, &v288)                                                  ⟨303458⟩
sub_30A1D(&v3170, word_4D36E, &v3136)                                                                 ⟨303470⟩
Widget_Method_DispatchC_37052(&v3170, 0)                                                              ⟨303475⟩
Widget_Method_Dispatch8_37030(&v3170, 200)                                                            ⟨303480⟩
si byte_4F55C == 0 :
    si v7 != 0 :
        v294 = word_4F048                                                                             ⟨303490⟩
        si canal2.+0 != 0 :
            AIL_start_sequence(pilote=canal2.+0→4, séquence=v1024)                                    ⟨303497⟩
            sub_50F5(canal2.+0→4, v1024, v294, 0)                                                     ⟨303504⟩
    v3180 = 436                                                                                       ⟨303513⟩
    v3178 = word_4D392                                                                                ⟨303515⟩
    word_4D392 = &v3180                                                                               ⟨303517⟩
    v3180 = 444                                                                                       ⟨303518⟩
    v3176 = 0                                                                                         ⟨303519⟩
    v3172 = 0                                                                                         ⟨303520⟩
    v3182 = -1                                                                                        ⟨303522⟩
    si v9 != 0 :
        charge(asoundfx 62)                                                                           ⟨303534⟩
        canal_init(canal=canal1, pilote=word_4CA5D)                                                   ⟨303539⟩
        canal_enregistre(canal=canal1, ressource=asoundfx 62, x=0)                                    ⟨303546⟩
        v310 = 0                                                                                      ⟨303550⟩
        si canal1.+0 != 0 :
            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3182)                                    ⟨303556⟩
            sub_50F5(canal1.+0→4, v3182, word_4EFF0, v310)                                            ⟨303563⟩
    charge(mid36 4)                                                                                   ⟨303578⟩
    charge(mid36 5)                                                                                   ⟨303590⟩
    charge(mid36 32)                                                                                  ⟨303602⟩
    palette_depuis(pal9(mid36 32))                                                                    ⟨303609⟩

    ──── scène1 ────
    scène1 = Scene_Create(cadence=15, palette=255, surface=&v518)                                     ⟨303617⟩
    c1 = Layer(ressource=midgames 42, x=0, y=-80)                                                     ⟨303624⟩
    c2 = Layer(ressource=mid36 5, x=0, y=0)                                                           ⟨303632⟩
    c3 = Layer(ressource=mid36 4, x=0, y=0)                                                           ⟨303640⟩
    c4 = TextLayer(zone=&v3170, x=160, y=160)                                                         ⟨303648⟩
    palette_copie(destination=pal1, source=pal9(mid36 32))                                            ⟨303658⟩
    ajoute c1 à scène1                                                                                ⟨303663⟩
    ajoute c3 à scène1                                                                                ⟨303668⟩
    ajoute c2 à scène1                                                                                ⟨303673⟩
    ajoute c4 à scène1                                                                                ⟨303678⟩
    palette_envoie(palette=pal1, pas=0)                                                               ⟨303690⟩
    v356 = 0                                                                                          ⟨303692⟩
    tant que (scène1.compteur < 31) et (scène1.terminée == 0) :
        v358 = v356                                                                                   ⟨303697⟩
        v356_avant = v356                                                                             ⟨303698⟩
        v356 = v356 + 1                                                                               ⟨303698⟩
        c2.image = v358                                                                               ⟨303701⟩
        Scene_Tick(scène=scène1)                                                                      ⟨303711⟩
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨303736⟩
    v334 = 0                                                                                          ⟨303759⟩
    v324 = 0                                                                                          ⟨303777⟩
    v314 = 0                                                                                          ⟨303795⟩
    canal_arrête(canal=canal1)                                                                        ⟨303798⟩
    sub_5C1C(&v3180, 2)                                                                               ⟨303803⟩
    v300 = 0                                                                                          ⟨303822⟩
    si byte_4F55C == 0 :
        v300 = 0                                                                                      ⟨303831⟩
        charge(mid36 11)                                                                              ⟨303838⟩
        charge(mid36 12)                                                                              ⟨303850⟩
        charge(mid36 14)                                                                              ⟨303862⟩
        charge(mid36 13)                                                                              ⟨303874⟩
        charge(mid36 15)                                                                              ⟨303886⟩
        charge(mid36 16)                                                                              ⟨303898⟩
        charge(mid36 35)                                                                              ⟨303910⟩
        palette_depuis(pal10(mid36 35))                                                               ⟨303917⟩
        charge(mid36 34)                                                                              ⟨303929⟩
        palette_depuis(pal11(mid36 34))                                                               ⟨303936⟩

        ──── scène2 ────
        scène2 = Scene_Create(cadence=6, palette=255, surface=&v518)                                  ⟨303944⟩
        c5 = Layer(ressource=mid36 16, x=0, y=0)                                                      ⟨303951⟩
        c6 = Layer(ressource=mid36 15, x=0, y=0)                                                      ⟨303959⟩
        c7 = Layer(ressource=mid36 11, x=0, y=0)                                                      ⟨303967⟩
        c8 = Layer(ressource=mid36 12, x=0, y=0)                                                      ⟨303975⟩
        c9 = Layer(ressource=mid36 14, x=0, y=0)                                                      ⟨303983⟩
        c10 = Layer(ressource=mid36 13, x=0, y=0)                                                     ⟨303991⟩
        palette_copie(destination=pal1, source=pal10(mid36 35))                                       ⟨304001⟩
        palette_copie(destination=pal1, source=pal11(mid36 34))                                       ⟨304010⟩
        ajoute c5 à scène2                                                                            ⟨304015⟩
        ajoute c6 à scène2                                                                            ⟨304020⟩
        ajoute c7 à scène2                                                                            ⟨304025⟩
        ajoute c8 à scène2                                                                            ⟨304030⟩
        ajoute c9 à scène2                                                                            ⟨304035⟩
        ajoute c10 à scène2                                                                           ⟨304040⟩
        palette_envoie(palette=pal1, pas=0)                                                           ⟨304052⟩
        v402 = 0                                                                                      ⟨304054⟩
        tant que (scène2.compteur < 12) et (scène2.terminée == 0) :
            v404 = scène2.compteur                                                                    ⟨304059⟩
            si v404 == 8 :
                c8.image = 1                                                                          ⟨304063⟩
            si v404 == 9 :
                c10.image = 1                                                                         ⟨304069⟩
            si v404 == 10 :
                c10.image = 2                                                                         ⟨304075⟩
            si v404 < 7 :
                v406 = v402                                                                           ⟨304081⟩
                v402_avant = v402                                                                     ⟨304082⟩
                v402 = v402 + 1                                                                       ⟨304082⟩
                c9.image = v406                                                                       ⟨304085⟩
                si v402 > 1 :
                    v402 = 0                                                                          ⟨304088⟩
            Scene_Tick(scène=scène2)                                                                  ⟨304100⟩
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨304126⟩
        v376 = 0                                                                                      ⟨304149⟩
        v360 = 0                                                                                      ⟨304171⟩
        v356 = 0                                                                                      ⟨304187⟩
        v350 = 0                                                                                      ⟨304189⟩
        v316 = 0                                                                                      ⟨304259⟩
        v310 = 0                                                                                      ⟨304261⟩
        v300 = 0                                                                                      ⟨304279⟩
        si byte_4F55C == 0 :
            v300 = 0                                                                                  ⟨304288⟩
            v3180 = 436                                                                               ⟨304289⟩
            v3178 = word_4D392                                                                        ⟨304291⟩
            word_4D392 = &v3180                                                                       ⟨304293⟩
            si v9 != 0 :
                charge(asoundfx 62)                                                                   ⟨304310⟩
                canal_init(canal=canal1, pilote=word_4CA5D)                                           ⟨304315⟩
                canal_enregistre(canal=canal1, ressource=asoundfx 62, x=0)                            ⟨304322⟩
                v310 = 0                                                                              ⟨304326⟩
                si canal1.+0 != 0 :
                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3182)                            ⟨304332⟩
                    sub_50F5(canal1.+0→4, v3182, word_4EFF0, v310)                                    ⟨304339⟩
            charge(mid36 7)                                                                           ⟨304354⟩
            charge(mid36 6)                                                                           ⟨304366⟩
            charge(mid36 33)                                                                          ⟨304378⟩
            palette_depuis(pal12(mid36 33))                                                           ⟨304385⟩

            ──── scène3 ────
            scène3 = Scene_Create(cadence=15, palette=255, surface=&v518)                             ⟨304393⟩
            c11 = Layer(ressource=mid36 7, x=0, y=0)                                                  ⟨304400⟩
            c12 = Layer(ressource=mid36 6, x=0, y=0)                                                  ⟨304408⟩
            palette_copie(destination=pal1, source=pal12(mid36 33))                                   ⟨304418⟩
            ajoute c11 à scène3                                                                       ⟨304423⟩
            ajoute c12 à scène3                                                                       ⟨304428⟩
            palette_envoie(palette=pal1, pas=0)                                                       ⟨304440⟩
            v352 = 8                                                                                  ⟨304442⟩
            tant que (scène3.compteur < 35) et (scène3.terminée == 0) :
                v354 = v352                                                                           ⟨304447⟩
                v352_avant = v352                                                                     ⟨304448⟩
                v352 = v352 + 1                                                                       ⟨304448⟩
                c12.image = v354                                                                      ⟨304451⟩
                si v352 == 41 :
                    retire(parent=scène3, calque=c12)                                                 ⟨304457⟩
                    c12.détruit(3)                                                                    ⟨304465⟩
                Scene_Tick(scène=scène3)                                                              ⟨304479⟩
            Scene_Destruct(scène=scène3, drapeaux=0)                                                  ⟨304504⟩
            v334 = 0                                                                                  ⟨304527⟩
            v324 = 0                                                                                  ⟨304545⟩
            v314 = 0                                                                                  ⟨304563⟩
            canal_arrête(canal=canal1)                                                                ⟨304566⟩
            sub_5C1C(&v3180, 2)                                                                       ⟨304571⟩
            v300 = 0                                                                                  ⟨304590⟩
            si byte_4F55C == 0 :
                v300 = 0                                                                              ⟨304599⟩
                v3180 = 436                                                                           ⟨304600⟩
                v3178 = word_4D392                                                                    ⟨304602⟩
                word_4D392 = &v3180                                                                   ⟨304604⟩
                v3180 = 444                                                                           ⟨304605⟩
                v3176 = 0                                                                             ⟨304606⟩
                v3172 = 0                                                                             ⟨304607⟩
                v3182 = -1                                                                            ⟨304609⟩
                si v9 != 0 :
                    charge(asoundfx 7)                                                                ⟨304621⟩
                    canal_init(canal=canal1, pilote=word_4CA5D)                                       ⟨304626⟩
                    canal_enregistre(canal=canal1, ressource=asoundfx 7, x=0)                         ⟨304633⟩
                    v310 = 0                                                                          ⟨304637⟩
                    si canal1.+0 != 0 :
                        AIL_start_sequence(pilote=canal1.+0→4, séquence=v3182)                        ⟨304643⟩
                        sub_50F5(canal1.+0→4, v3182, word_4EF82, v310)                                ⟨304650⟩
                v314 = 0                                                                              ⟨304658⟩
                charge(mid36 2)                                                                       ⟨304665⟩
                v324 = 0                                                                              ⟨304670⟩
                charge(midgames 50)                                                                   ⟨304677⟩
                v334 = 0                                                                              ⟨304682⟩
                charge(mid36 1)                                                                       ⟨304689⟩
                charge(mid36 31)                                                                      ⟨304701⟩
                palette_depuis(pal13(mid36 31))                                                       ⟨304708⟩

                ──── scène4 ────
                scène4 = Scene_Create(cadence=15, palette=255, surface=&v518)                         ⟨304716⟩
                c13 = Layer(ressource=midgames 42, x=0, y=-80)                                        ⟨304723⟩
                c14 = Layer(ressource=mid36 2, x=0, y=0)                                              ⟨304731⟩
                c15 = Layer(ressource=midgames 50, x=0, y=12)                                         ⟨304739⟩
                c16 = Layer(ressource=mid36 1, x=0, y=0)                                              ⟨304747⟩
                c17 = Layer(ressource=mid36 1, x=44, y=-11)                                           ⟨304755⟩
                palette_copie(destination=pal1, source=pal13(mid36 31))                               ⟨304765⟩
                ajoute c13 à scène4                                                                   ⟨304770⟩
                ajoute c14 à scène4                                                                   ⟨304775⟩
                ajoute c15 à scène4                                                                   ⟨304780⟩
                ajoute c17 à scène4                                                                   ⟨304785⟩
                palette_envoie(palette=pal1, pas=0)                                                   ⟨304797⟩
                Widget_Method_DispatchC_37052(&v3170, 0)                                              ⟨304802⟩
                Widget_Method_Dispatch8_37030(&v3170, 0)                                              ⟨304807⟩
                c17.image = 3                                                                         ⟨304810⟩
                tant que (scène4.compteur < 10) et (scène4.terminée == 0) :
                    c17.méthode24(-4, 1)                                                              ⟨304819⟩
                    Scene_Tick(scène=scène4)                                                          ⟨304830⟩
                retire(parent=scène4, calque=c17)                                                     ⟨304855⟩
                c17.détruit(3)                                                                        ⟨304863⟩
                ajoute c16 à scène4                                                                   ⟨304871⟩
                scène4.compteur = 0                                                                   ⟨304873⟩
                v368 = 0                                                                              ⟨304874⟩
                v370 = 3                                                                              ⟨304875⟩
                tant que (scène4.compteur < 73) et (scène4.terminée == 0) :
                    pal10(mid36 35).+0 = scène4.compteur                                              ⟨304880⟩
                    si pal10(mid36 35).+0 < 51 :
                        v374 = v370                                                                   ⟨304884⟩
                        v370_avant = v370                                                             ⟨304885⟩
                        v370 = v370 + 1                                                               ⟨304885⟩
                        c16.image = v374                                                              ⟨304888⟩
                    sinon :
                        v376 = v368                                                                   ⟨304893⟩
                        v368_avant = v368                                                             ⟨304894⟩
                        v368 = v368 + 1                                                               ⟨304894⟩
                        c15.image = v376                                                              ⟨304897⟩
                        v378 = v370                                                                   ⟨304899⟩
                        v370_avant = v370                                                             ⟨304900⟩
                        v370 = v370 + 1                                                               ⟨304900⟩
                        c16.image = v378                                                              ⟨304903⟩
                    Scene_Tick(scène=scène4)                                                          ⟨304915⟩
                Scene_Destruct(scène=scène4, drapeaux=0)                                              ⟨304945⟩
                v344 = 0                                                                              ⟨304968⟩
                v334 = 0                                                                              ⟨304986⟩
                v324 = 0                                                                              ⟨305004⟩
                v314 = 0                                                                              ⟨305022⟩
                canal_arrête(canal=canal1)                                                            ⟨305025⟩
                sub_5C1C(&v3180, 2)                                                                   ⟨305030⟩
                v300 = 0                                                                              ⟨305049⟩
                si byte_4F55C == 0 :
                    v300 = 0                                                                          ⟨305058⟩
                    v316 = 0                                                                          ⟨305059⟩
                    v310 = 0                                                                          ⟨305062⟩
                    v3180 = 436                                                                       ⟨305063⟩
                    v3178 = word_4D392                                                                ⟨305065⟩
                    word_4D392 = &v3180                                                               ⟨305067⟩
                    v3180 = 444                                                                       ⟨305068⟩
                    v3176 = 0                                                                         ⟨305069⟩
                    v3172 = 0                                                                         ⟨305070⟩
                    v3182 = -1                                                                        ⟨305072⟩
                    v3194 = 436                                                                       ⟨305073⟩
                    v3192 = word_4D392                                                                ⟨305075⟩
                    word_4D392 = &v3194                                                               ⟨305077⟩
                    v3194 = 444                                                                       ⟨305078⟩
                    v3198 = 0                                                                         ⟨305081⟩
                    si v9 != 0 :
                        charge(asoundfx 93)                                                           ⟨305094⟩
                        canal_init(canal=canal1, pilote=word_4CA5D)                                   ⟨305099⟩
                        canal_enregistre(canal=canal1, ressource=asoundfx 93, x=0)                    ⟨305106⟩
                        v318 = word_4F02E                                                             ⟨305109⟩
                        si canal1.+0 != 0 :
                            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3182)                    ⟨305116⟩
                            sub_50F5(canal1.+0→4, v3182, v318, mid36 2.+0)                            ⟨305123⟩
                        charge(asoundfx 20)                                                           ⟨305134⟩
                        canal_init(canal=canal3, pilote=word_4CA5D)                                   ⟨305139⟩
                        canal_enregistre(canal=canal3, ressource=asoundfx 20, x=0)                    ⟨305146⟩
                    v324 = 0                                                                          ⟨305153⟩
                    charge(mid36 10)                                                                  ⟨305160⟩

                    ──── scène5 ────
                    scène5 = Scene_Create(cadence=15, palette=255, surface=&v518)                     ⟨305168⟩
                    c18 = Layer(ressource=midgames 42, x=0, y=-80)                                    ⟨305175⟩
                    c19 = Layer(ressource=mid36 0, x=0, y=0)                                          ⟨305183⟩
                    c20 = OverlayImageLayer(ressource=mid36 3, x=0, y=0, image=1)                     ⟨305192⟩
                    c21 = Layer(ressource=mid36 10, x=0, y=0)                                         ⟨305200⟩
                    palette_copie(destination=pal1, source=pal2(midgames 43))                         ⟨305210⟩
                    palette_copie(destination=pal1, source=pal6(mid36 30))                            ⟨305219⟩
                    palette_copie(destination=pal1, source=pal7(midgames 47))                         ⟨305228⟩
                    ajoute c18 à scène5                                                               ⟨305233⟩
                    ajoute c19 à scène5                                                               ⟨305238⟩
                    ajoute c20 à scène5                                                               ⟨305243⟩
                    ajoute c21 à scène5                                                               ⟨305248⟩
                    palette_envoie(palette=pal1, pas=0)                                               ⟨305260⟩
                    Scene_Tick(scène=scène5)                                                          ⟨305264⟩
                    charge(midgames 48)                                                               ⟨305276⟩
                    charge(midgames 49)                                                               ⟨305288⟩
                    charge(mid36 8)                                                                   ⟨305300⟩
                    charge(mid36 27)                                                                  ⟨305312⟩
                    c22 = Layer(ressource=midgames 48, x=0, y=0)                                      ⟨305319⟩
                    c23 = Layer(ressource=midgames 49, x=0, y=0)                                      ⟨305327⟩
                    c24 = Layer(ressource=mid36 8, x=0, y=0)                                          ⟨305335⟩
                    c25 = Layer(ressource=mid36 27, x=0, y=0)                                         ⟨305343⟩
                    scène5.compteur = 0                                                               ⟨305346⟩
                    retire(parent=scène5, calque=c20)                                                 ⟨305350⟩
                    retire(parent=scène5, calque=c21)                                                 ⟨305355⟩
                    ajoute c22 à scène5                                                               ⟨305360⟩
                    ajoute c24 à scène5                                                               ⟨305365⟩
                    ajoute c20 à scène5                                                               ⟨305370⟩
                    ajoute c21 à scène5                                                               ⟨305375⟩
                    v388 = 0                                                                          ⟨305377⟩
                    v390 = 0                                                                          ⟨305378⟩
                    tant que (scène5.compteur < 88) et (scène5.terminée == 0) :
                        v392 = scène5.compteur                                                        ⟨305383⟩
                        si v392 == 20 :
                            Scene_SetFps(scène=scène5, cadence=13)                                    ⟨305389⟩
                        si v392 == 30 :
                            Scene_SetFps(scène=scène5, cadence=11)                                    ⟨305398⟩
                        si v392 == 40 :
                            Scene_SetFps(scène=scène5, cadence=9)                                     ⟨305407⟩
                        si v392 == 50 :
                            Scene_SetFps(scène=scène5, cadence=7)                                     ⟨305416⟩
                        si v392 < 30 :
                            v394 = v388                                                               ⟨305423⟩
                            v388_avant = v388                                                         ⟨305424⟩
                            v388 = v388 + 1                                                           ⟨305424⟩
                            c22.image = v394                                                          ⟨305427⟩
                            v396 = v390                                                               ⟨305429⟩
                            v390_avant = v390                                                         ⟨305430⟩
                            v390 = v390 + 1                                                           ⟨305430⟩
                            c24.image = v396                                                          ⟨305433⟩
                        sinon :
                            si v392 == 30 :
                                v388 = 0                                                              ⟨305442⟩
                                retire(parent=scène5, calque=c22)                                     ⟨305446⟩
                                c22.détruit(3)                                                        ⟨305454⟩
                                retire(parent=scène5, calque=c20)                                     ⟨305462⟩
                                retire(parent=scène5, calque=c21)                                     ⟨305467⟩
                                ajoute c23 à scène5                                                   ⟨305472⟩
                                ajoute c20 à scène5                                                   ⟨305477⟩
                                ajoute c21 à scène5                                                   ⟨305482⟩
                                v398 = v388                                                           ⟨305485⟩
                                v388_avant = v388                                                     ⟨305486⟩
                                v388 = v388 + 1                                                       ⟨305486⟩
                                c23.image = v398                                                      ⟨305489⟩
                                v400 = v390                                                           ⟨305491⟩
                                v390_avant = v390                                                     ⟨305492⟩
                                v390 = v390 + 1                                                       ⟨305492⟩
                                c24.image = v400                                                      ⟨305495⟩
                            sinon :
                                si v392 > 30 :
                                    si v392 < 50 :
                                        v402 = v388                                                   ⟨305504⟩
                                        v388_avant = v388                                             ⟨305505⟩
                                        v388 = v388 + 1                                               ⟨305505⟩
                                        c23.image = v402                                              ⟨305508⟩
                                        v404 = v390                                                   ⟨305510⟩
                                        v390_avant = v390                                             ⟨305511⟩
                                        v390 = v390 + 1                                               ⟨305511⟩
                                        c24.image = v404                                              ⟨305514⟩
                                    sinon :
                                        si v392 == 60 :
                                            si v9 != 0 :
                                                charge(asoundfx 20)                                   ⟨305534⟩
                                                canal_init(canal=canal3, pilote=word_4CA5D)           ⟨305539⟩
                                                canal_enregistre(canal=canal3, ressource=asoundfx 20, x=0)  ⟨305546⟩
                                                v406 = word_4EF9C                                     ⟨305549⟩
                                                v408 = 0                                              ⟨305550⟩
                                                si canal3.+0 != 0 :
                                                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3196)  ⟨305556⟩
                                                    sub_50F5(canal3.+0→4, v3196, v406, v408)          ⟨305563⟩
                                            v388 = 0                                                  ⟨305568⟩
                                            Scene_SetFps(scène=scène5, cadence=15)                    ⟨305572⟩
                                            ajoute c25 à scène5                                       ⟨305577⟩
                                            v410 = v388                                               ⟨305580⟩
                                            v388_avant = v388                                         ⟨305581⟩
                                            v388 = v388 + 1                                           ⟨305581⟩
                                            c25.image = v410                                          ⟨305584⟩
                                        sinon :
                                            si v392 > 60 :
                                                si v392 < 78 :
                                                    si v392 & 1 != 0 :
                                                        v412 = v388                                   ⟨305595⟩
                                                        v388_avant = v388                             ⟨305596⟩
                                                        v388 = v388 + 1                               ⟨305596⟩
                                                        c25.image = v412                              ⟨305599⟩
                                sinon :
                                    si v392 == 60 :
                                        si v9 != 0 :
                                            charge(asoundfx 20)                                       ⟨305534⟩
                                            canal_init(canal=canal3, pilote=word_4CA5D)               ⟨305539⟩
                                            canal_enregistre(canal=canal3, ressource=asoundfx 20, x=0)  ⟨305546⟩
                                            v406 = word_4EF9C                                         ⟨305549⟩
                                            v408 = 0                                                  ⟨305550⟩
                                            si canal3.+0 != 0 :
                                                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3196)  ⟨305556⟩
                                                sub_50F5(canal3.+0→4, v3196, v406, v408)              ⟨305563⟩
                                        v388 = 0                                                      ⟨305568⟩
                                        Scene_SetFps(scène=scène5, cadence=15)                        ⟨305572⟩
                                        ajoute c25 à scène5                                           ⟨305577⟩
                                        v410 = v388                                                   ⟨305580⟩
                                        v388_avant = v388                                             ⟨305581⟩
                                        v388 = v388 + 1                                               ⟨305581⟩
                                        c25.image = v410                                              ⟨305584⟩
                                    sinon :
                                        si v392 > 60 :
                                            si v392 < 78 :
                                                si v392 & 1 != 0 :
                                                    v412 = v388                                       ⟨305595⟩
                                                    v388_avant = v388                                 ⟨305596⟩
                                                    v388 = v388 + 1                                   ⟨305596⟩
                                                    c25.image = v412                                  ⟨305599⟩
                        Scene_Tick(scène=scène5)                                                      ⟨305611⟩
                    pal10(mid36 35).+0 = 0                                                            ⟨305651⟩
                    v368 = 0                                                                          ⟨305667⟩
                    v362 = 0                                                                          ⟨305669⟩
                    v352 = 0                                                                          ⟨305687⟩
                    v342 = 0                                                                          ⟨305705⟩
                    Scene_Destruct(scène=scène5, drapeaux=0)                                          ⟨305709⟩
                    v324 = 0                                                                          ⟨305728⟩
                    canal_arrête(canal=canal3)                                                        ⟨305731⟩
                    sub_5C1C(&v3194, 2)                                                               ⟨305736⟩
                    canal_arrête(canal=canal1)                                                        ⟨305740⟩
                    sub_5C1C(&v3180, 2)                                                               ⟨305745⟩
                    v316 = 0                                                                          ⟨305762⟩
                    v310 = 0                                                                          ⟨305764⟩
                    v300 = 0                                                                          ⟨305782⟩
                    si byte_4F55C == 0 :

                        ──── scène6 ────
                        scène6 = Scene_Create(cadence=10, palette=255, surface=&v518)                 ⟨305794⟩
                        v300 = 0                                                                      ⟨305799⟩
                        charge(midgames 6)                                                            ⟨305806⟩
                        palette_depuis(pal14(midgames 6))                                             ⟨305813⟩
                        charge(midgames 4)                                                            ⟨305825⟩
                        c26 = Layer(ressource=midgames 42, x=0, y=-80)                                ⟨305832⟩
                        charge_convdata_type0("air", drapeau=2)                                       ⟨305843⟩
                        c27 = Layer(ressource=midgames 4, x=0, y=0)                                   ⟨305850⟩
                        c28 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)       ⟨305858⟩
                        c29 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)     ⟨305867⟩
                        palette_copie(destination=pal1, source=pal2(midgames 43))                     ⟨305877⟩
                        palette_copie(destination=pal1, source=pal6(mid36 30))                        ⟨305886⟩
                        palette_copie(destination=pal1, source=pal14(midgames 6))                     ⟨305895⟩
                        palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))        ⟨305904⟩
                        palette_envoie(palette=pal1, pas=0)                                           ⟨305916⟩
                        ajoute c26 à scène6                                                           ⟨305921⟩
                        ajoute c27 à scène6                                                           ⟨305926⟩
                        ajoute c28 à scène6                                                           ⟨305931⟩
                        ajoute c29 à scène6                                                           ⟨305936⟩
                        Widget_Method_DispatchC_37052(&v3170, 0)                                      ⟨305941⟩
                        Widget_Method_Dispatch8_37030(&v3170, 127)                                    ⟨305946⟩
                        charge(midgames 0)                                                            ⟨305958⟩
                        c30 = ToggleLayer(ressource=midgames 0, x=160, y=128, sens=1)                 ⟨305966⟩
                        ajoute c30 à scène6                                                           ⟨305972⟩
                        tant que (scène6.compteur < 15) et (scène6.terminée == 0) :
                            Scene_Tick(scène=scène6)                                                  ⟨305979⟩
                        scène6.compteur = 0                                                           ⟨305999⟩
                        tête_image_de_base(tête=c28, image=27)                                        ⟨306002⟩
                        tant que (scène6.compteur < 2) et (scène6.terminée == 0) :
                            Scene_Tick(scène=scène6)                                                  ⟨306009⟩
                        tête_image_de_base(tête=c28, image=28)                                        ⟨306031⟩
                        tant que (scène6.compteur < 10) et (scène6.terminée == 0) :
                            Scene_Tick(scène=scène6)                                                  ⟨306038⟩
                        v344 = 0                                                                      ⟨306075⟩
                        v328 = 0                                                                      ⟨306093⟩
                        v316 = 0                                                                      ⟨306111⟩
                        v300 = 0                                                                      ⟨306133⟩
                        Scene_Destruct(scène=scène6, drapeaux=0)                                      ⟨306137⟩
                        si byte_4F55C == 0 :
                            v300 = 0                                                                  ⟨306147⟩
                            charge(mid36 23)                                                          ⟨306154⟩
                            charge(mid36 22)                                                          ⟨306166⟩
                            charge(mid36 20)                                                          ⟨306178⟩
                            charge(mid36 26)                                                          ⟨306190⟩
                            charge(mid36 25)                                                          ⟨306202⟩
                            charge(mid36 21)                                                          ⟨306214⟩
                            charge(mid36 24)                                                          ⟨306226⟩

                            ──── scène7 ────
                            scène7 = Scene_Create(cadence=10, palette=255, surface=&v518)             ⟨306234⟩
                            c31 = Layer(ressource=midgames 44, x=0, y=0)                              ⟨306241⟩
                            c32 = Layer(ressource=mid36 18, x=0, y=0)                                 ⟨306249⟩
                            c33 = Layer(ressource=mid36 23, x=0, y=3)                                 ⟨306257⟩
                            c34 = OverlayImageLayer(ressource=mid36 22, x=113, y=3, image=0)          ⟨306266⟩
                            c35 = OverlayImageLayer(ressource=mid36 20, x=0, y=3, image=0)            ⟨306275⟩
                            c36 = OverlayImageLayer(ressource=mid36 25, x=0, y=3, image=0)            ⟨306284⟩
                            c37 = OverlayImageLayer(ressource=mid36 26, x=40, y=3, image=0)           ⟨306293⟩
                            c38 = OverlayImageLayer(ressource=mid36 21, x=0, y=3, image=0)            ⟨306302⟩
                            c39 = OverlayImageLayer(ressource=mid36 24, x=-140, y=3, image=0)         ⟨306311⟩
                            palette_copie(destination=pal1, source=pal4(mid36 36))                    ⟨306321⟩
                            palette_copie(destination=pal1, source=pal3(midgames 45))                 ⟨306330⟩
                            palette_copie(destination=pal1, source=pal5(mid36 37))                    ⟨306339⟩
                            ajoute c31 à scène7                                                       ⟨306344⟩
                            ajoute c32 à scène7                                                       ⟨306349⟩
                            ajoute c33 à scène7                                                       ⟨306354⟩
                            ajoute c39 à scène7                                                       ⟨306359⟩
                            ajoute c36 à scène7                                                       ⟨306364⟩
                            ajoute c35 à scène7                                                       ⟨306369⟩
                            ajoute c38 à scène7                                                       ⟨306374⟩
                            ajoute c37 à scène7                                                       ⟨306379⟩
                            ajoute c34 à scène7                                                       ⟨306384⟩
                            c34.image = 2                                                             ⟨306391⟩
                            c35.image = 2                                                             ⟨306393⟩
                            c36.image = 1                                                             ⟨306395⟩
                            c38.image = 9                                                             ⟨306397⟩
                            c37.image = 1                                                             ⟨306399⟩
                            c39.image = 1                                                             ⟨306401⟩
                            palette_envoie(palette=pal1, pas=0)                                       ⟨306408⟩
                            v386 = 1                                                                  ⟨306410⟩
                            v388 = 1                                                                  ⟨306411⟩
                            scène7.compteur = 0                                                       ⟨306412⟩
                            tant que (scène7.compteur < 30) et (scène7.terminée == 0) :
                                v390 = scène7.compteur                                                ⟨306417⟩
                                si v390 == 2 :
                                    v392 = v386                                                       ⟨306421⟩
                                    v386_avant = v386                                                 ⟨306422⟩
                                    v386 = v386 + 1                                                   ⟨306422⟩
                                    c35.image = v392                                                  ⟨306425⟩
                                si v390 > 1 :
                                    si v390 < 7 :
                                        v394 = v388                                                   ⟨306433⟩
                                        v388_avant = v388                                             ⟨306434⟩
                                        v388 = v388 + 1                                               ⟨306434⟩
                                        c38.image = v394                                              ⟨306437⟩
                                si v390 > 13 :
                                    si v390 < 16 :
                                        v396 = v388                                                   ⟨306445⟩
                                        v388_avant = v388                                             ⟨306446⟩
                                        v388 = v388 + 1                                               ⟨306446⟩
                                        c38.image = v396                                              ⟨306449⟩
                                si v390 == 17 :
                                    v398 = v386                                                       ⟨306455⟩
                                    c35.image = v398                                                  ⟨306458⟩
                                si v390 == 17 :
                                    c38.image = 2                                                     ⟨306464⟩
                                si v390 == 18 :
                                    c38.image = 1                                                     ⟨306470⟩
                                si v390 == 19 :
                                    c38.image = 9                                                     ⟨306476⟩
                                si v390 == 3 :
                                    c37.image = 2                                                     ⟨306482⟩
                                si v390 == 20 :
                                    c36.image = 2                                                     ⟨306488⟩
                                Scene_Tick(scène=scène7)                                              ⟨306500⟩
                            Scene_Destruct(scène=scène7, drapeaux=0)                                  ⟨306526⟩
                            v360 = 0                                                                  ⟨306545⟩
                            v356 = 0                                                                  ⟨306561⟩
                            v316 = 0                                                                  ⟨306633⟩
                            v310 = 0                                                                  ⟨306635⟩
                            v300 = 0                                                                  ⟨306653⟩
                            si byte_4F55C == 0 :

                                ──── scène8 ────
                                scène8 = Scene_Create(cadence=9, palette=255, surface=&v518)          ⟨306665⟩
                                c40 = Layer(ressource=midgames 44, x=0, y=0)                          ⟨306672⟩
                                c41 = Layer(ressource=mid36 18, x=0, y=0)                             ⟨306680⟩
                                c42 = TalkingHead(ressource=convdata type 0 "virgil", x=105, y=129)   ⟨306688⟩
                                c43 = TalkingHead(ressource=convdata type 0 "gwen", x=265, y=129)     ⟨306696⟩
                                c44 = TalkingHead(ressource=convdata type 0 "miguel", x=-45, y=129)   ⟨306704⟩
                                palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨306714⟩
                                palette_copie(destination=pal1, source=pal4(mid36 36))                ⟨306723⟩
                                palette_copie(destination=pal1, source=pal3(midgames 45))             ⟨306732⟩
                                ajoute c40 à scène8                                                   ⟨306737⟩
                                ajoute c41 à scène8                                                   ⟨306742⟩
                                ajoute c44 à scène8                                                   ⟨306747⟩
                                ajoute c42 à scène8                                                   ⟨306752⟩
                                ajoute c43 à scène8                                                   ⟨306757⟩
                                palette_envoie(palette=pal1, pas=0)                                   ⟨306769⟩
                                tête_image_de_base(tête=c42, image=33)                                ⟨306773⟩
                                tête_image_de_base(tête=c43, image=27)                                ⟨306777⟩
                                si v8 != 0 :
                                    Scene_Tick(scène=scène8)                                          ⟨306786⟩
                                    v316 = 0                                                          ⟨306788⟩
                                    v310 = 0                                                          ⟨306791⟩
                                    charge(mid36voc 0)                                                ⟨306798⟩
                                    tête_voix(tête=c42, ressource=mid36voc 0, cadence=9)              ⟨306804⟩
                                    v318 = 0                                                          ⟨306806⟩
                                    tant que v318 < 3 :
                                        Scene_Tick(scène=scène8)                                      ⟨306812⟩
                                        v318 = v318 + 1                                               ⟨306814⟩
                                    v318 = 0                                                          ⟨306819⟩
                                    tant que tête_parle(tête=c42) != 0 :
                                        si v318 == 5 :
                                            tête_image_de_base(tête=c43, image=-1)                    ⟨306827⟩
                                        si v318 == 6 :
                                            tête_image_de_base(tête=c43, image=25)                    ⟨306835⟩
                                        si v318 == 8 :
                                            tête_image_de_base(tête=c43, image=31)                    ⟨306843⟩
                                        v318_avant = v318                                             ⟨306848⟩
                                        v318 = v318 + 1                                               ⟨306848⟩
                                        si v318_avant == 12 :
                                            tête_image_de_base(tête=c43, image=18)                    ⟨306853⟩
                                        Scene_Tick(scène=scène8)                                      ⟨306866⟩
                                    v316 = 0                                                          ⟨306893⟩
                                    v310 = 0                                                          ⟨306895⟩
                                sinon :
                                    Widget_Method_DispatchC_37052(&v3170, 0)                          ⟨306902⟩
                                    Widget_Method_Dispatch8_37030(&v3170, 227)                        ⟨306907⟩
                                    v2 = 60                                                           ⟨306909⟩
                                    si = scène8.compteur                                              ⟨306910⟩
                                    tant que (scène8.compteur < si + ((v2·70) / 100)) et (scène8.terminée == 0) :
                                        si si + 2 == scène8.compteur :
                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[0])  ⟨306932⟩
                                        si si + 2 == scène8.compteur :
                                            tête_texte_de_lèvres(tête=c42, texte="ispslwntmtshlotmyfrmdlnrit")  ⟨306942⟩
                                        si si + 10 == scène8.compteur :
                                            tête_image_de_base(tête=c43, image=-1)                    ⟨306952⟩
                                        si si + 10 == scène8.compteur :
                                            tête_image_de_base(tête=c43, image=25)                    ⟨306962⟩
                                        si si + 13 == scène8.compteur :
                                            tête_image_de_base(tête=c43, image=31)                    ⟨306972⟩
                                        si (si + ((v2·70) / 100)) - 1 == scène8.compteur :
                                            sub_30AD0(objet1, 0)                                      ⟨306983⟩
                                        Scene_Tick(scène=scène8)                                      ⟨307001⟩
                                si byte_4F55C != 0 :
                                    Scene_Destruct(scène=scène8, drapeaux=0)                          ⟨307029⟩
                                sinon :
                                    si v8 != 0 :
                                        Scene_Tick(scène=scène8)                                      ⟨307041⟩
                                        v316 = 0                                                      ⟨307043⟩
                                        v310 = 0                                                      ⟨307046⟩
                                        charge(mid36voc 1)                                            ⟨307053⟩
                                        tête_voix(tête=c43, ressource=mid36voc 1, cadence=9)          ⟨307059⟩
                                        v318 = 0                                                      ⟨307061⟩
                                        tant que v318 < 3 :
                                            Scene_Tick(scène=scène8)                                  ⟨307067⟩
                                            v318 = v318 + 1                                           ⟨307069⟩
                                        v318 = 0                                                      ⟨307074⟩
                                        tant que tête_parle(tête=c43) != 0 :
                                            v318_avant = v318                                         ⟨307079⟩
                                            v318 = v318 + 1                                           ⟨307079⟩
                                            si v318_avant == 4 :
                                                tête_image_de_base(tête=c42, image=17)                ⟨307084⟩
                                            Scene_Tick(scène=scène8)                                  ⟨307097⟩
                                        v316 = 0                                                      ⟨307123⟩
                                        v310 = 0                                                      ⟨307125⟩
                                    sinon :
                                        Widget_Method_Dispatch8_37030(objet1, 235)                    ⟨307132⟩
                                        v2 = 30                                                       ⟨307134⟩
                                        si = scène8.compteur                                          ⟨307135⟩
                                        tant que (scène8.compteur < si + ((v2·70) / 100)) et (scène8.terminée == 0) :
                                            si si + 1 == scène8.compteur :
                                                tête_image_de_base(tête=c43, image=18)                ⟨307156⟩
                                            si si + 1 == scène8.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[1])  ⟨307169⟩
                                            si si + 1 == scène8.compteur :
                                                tête_texte_de_lèvres(tête=c43, texte="Damitvrgl")     ⟨307179⟩
                                            si si + 2 == scène8.compteur :
                                                tête_image_de_base(tête=c42, image=17)                ⟨307189⟩
                                            si (si + ((v2·70) / 100)) - 1 == scène8.compteur :
                                                sub_30AD0(objet1, 0)                                  ⟨307200⟩
                                            Scene_Tick(scène=scène8)                                  ⟨307218⟩
                                    si byte_4F55C != 0 :
                                        Scene_Destruct(scène=scène8, drapeaux=0)                      ⟨307246⟩
                                    sinon :
                                        si v8 != 0 :
                                            Scene_Tick(scène=scène8)                                  ⟨307258⟩
                                            v316 = 0                                                  ⟨307260⟩
                                            v310 = 0                                                  ⟨307263⟩
                                            charge(mid36voc 2)                                        ⟨307270⟩
                                            tête_voix(tête=c42, ressource=mid36voc 2, cadence=9)      ⟨307276⟩
                                            v318 = 0                                                  ⟨307278⟩
                                            tant que v318 < 3 :
                                                Scene_Tick(scène=scène8)                              ⟨307284⟩
                                                v318 = v318 + 1                                       ⟨307286⟩
                                            v318 = 0                                                  ⟨307291⟩
                                            tant que tête_parle(tête=c42) != 0 :
                                                si v318 == 5 :
                                                    tête_image_de_base(tête=c42, image=-1)            ⟨307299⟩
                                                si v318 == 10 :
                                                    tête_image_de_base(tête=c43, image=-1)            ⟨307307⟩
                                                v318_avant = v318                                     ⟨307312⟩
                                                v318 = v318 + 1                                       ⟨307312⟩
                                                si v318_avant == 10 :
                                                    tête_image_de_base(tête=c43, image=27)            ⟨307317⟩
                                                Scene_Tick(scène=scène8)                              ⟨307330⟩
                                            tête_image_de_base(tête=c42, image=27)                    ⟨307343⟩
                                            v318 = 0                                                  ⟨307345⟩
                                            tant que v318 < 6 :
                                                Scene_Tick(scène=scène8)                              ⟨307351⟩
                                                v318 = v318 + 1                                       ⟨307353⟩
                                            v316 = 0                                                  ⟨307373⟩
                                            v310 = 0                                                  ⟨307375⟩
                                        sinon :
                                            Widget_Method_Dispatch8_37030(objet1, 227)                ⟨307382⟩
                                            v2 = 96                                                   ⟨307384⟩
                                            si = scène8.compteur                                      ⟨307385⟩
                                            tant que (scène8.compteur < si + ((v2·70) / 100)) et (scène8.terminée == 0) :
                                                si si + 8 == scène8.compteur :
                                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[2])  ⟨307411⟩
                                                si si + 8 == scène8.compteur :
                                                    tête_texte_de_lèvres(tête=c42, texte="alrtalrtigtohditoyucmdrydagdjb")  ⟨307421⟩
                                                si si + 20 == scène8.compteur :
                                                    tête_image_de_base(tête=c42, image=-1)            ⟨307431⟩
                                                si (si + ((v2·70) / 100)) - 5 == scène8.compteur :
                                                    tête_image_de_base(tête=c43, image=-1)            ⟨307441⟩
                                                si (si + ((v2·70) / 100)) - 5 == scène8.compteur :
                                                    tête_image_de_base(tête=c43, image=27)            ⟨307451⟩
                                                si (si + ((v2·70) / 100)) - 1 == scène8.compteur :
                                                    sub_30AD0(objet1, 0)                              ⟨307462⟩
                                                Scene_Tick(scène=scène8)                              ⟨307480⟩
                                            si byte_4F55C != 0 :
                                                Scene_Destruct(scène=scène8, drapeaux=0)              ⟨307508⟩
                                                aller à loc_B5097                                     ⟨307510⟩
                                            v2_avant = si + ((v2·70) / 100)                           ⟨307513⟩
                                            v2 = 70                                                   ⟨307513⟩
                                            si = scène8.compteur                                      ⟨307514⟩
                                            tant que (scène8.compteur < si + ((v2·70) / 100)) et (scène8.terminée == 0) :
                                                si si + 1 == scène8.compteur :
                                                    tête_image_de_base(tête=c42, image=-1)            ⟨307535⟩
                                                si si + 1 == scène8.compteur :
                                                    sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[5])  ⟨307551⟩
                                                si si + 1 == scène8.compteur :
                                                    tête_texte_de_lèvres(tête=c42, texte="stnwdbeprdrlprdnsorwe")  ⟨307561⟩
                                                si (si + ((v2·70) / 100)) - 4 == scène8.compteur :
                                                    tête_image_de_base(tête=c42, image=27)            ⟨307571⟩
                                                si (si + ((v2·70) / 100)) - 1 == scène8.compteur :
                                                    sub_30AD0(objet1, 0)                              ⟨307582⟩
                                                Scene_Tick(scène=scène8)                              ⟨307600⟩
                                        Scene_Destruct(scène=scène8, drapeaux=0)                      ⟨307626⟩
                                        si byte_4F55C == 0 :

                                            ──── scène9 ────
                                            scène9 = Scene_Create(cadence=10, palette=255, surface=&v518)  ⟨307639⟩
                                            c45 = Layer(ressource=midgames 44, x=0, y=0)              ⟨307646⟩
                                            c46 = Layer(ressource=mid36 18, x=0, y=0)                 ⟨307654⟩
                                            c47 = TalkingHead(ressource=convdata type 0 "lyle", x=160, y=129)  ⟨307662⟩
                                            c48 = TalkingHead(ressource=convdata type 0 "billy", x=-30, y=129)  ⟨307670⟩
                                            c49 = TalkingHead(ressource=convdata type 0 "air", x=350, y=129)  ⟨307678⟩
                                            palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨307688⟩
                                            palette_copie(destination=pal1, source=pal4(mid36 36))    ⟨307697⟩
                                            palette_copie(destination=pal1, source=pal3(midgames 45))  ⟨307706⟩
                                            ajoute c45 à scène9                                       ⟨307711⟩
                                            ajoute c46 à scène9                                       ⟨307716⟩
                                            ajoute c48 à scène9                                       ⟨307721⟩
                                            ajoute c49 à scène9                                       ⟨307726⟩
                                            ajoute c47 à scène9                                       ⟨307731⟩
                                            palette_envoie(palette=pal1, pas=0)                       ⟨307743⟩
                                            si v8 != 0 :
                                                Scene_Tick(scène=scène9)                              ⟨307752⟩
                                                v316 = 0                                              ⟨307754⟩
                                                v310 = 0                                              ⟨307757⟩
                                                charge(mid36voc 3)                                    ⟨307764⟩
                                                tête_voix(tête=c47, ressource=mid36voc 3, cadence=9)  ⟨307770⟩
                                                v318 = 0                                              ⟨307772⟩
                                                tant que v318 < 3 :
                                                    Scene_Tick(scène=scène9)                          ⟨307778⟩
                                                    v318 = v318 + 1                                   ⟨307780⟩
                                                tant que tête_parle(tête=c47) != 0 :
                                                    Scene_Tick(scène=scène9)                          ⟨307797⟩
                                                tête_image_de_base(tête=c47, image=27)                ⟨307810⟩
                                                v318 = 0                                              ⟨307812⟩
                                                tant que v318 < 6 :
                                                    Scene_Tick(scène=scène9)                          ⟨307818⟩
                                                    v318 = v318 + 1                                   ⟨307820⟩
                                                v316 = 0                                              ⟨307840⟩
                                                v310 = 0                                              ⟨307842⟩
                                            sinon :
                                                Widget_Method_Dispatch8_37030(objet1, 227)            ⟨307849⟩
                                                v2 = 64                                               ⟨307851⟩
                                                si = scène9.compteur                                  ⟨307852⟩
                                                tant que (scène9.compteur < si + ((v2·70) / 100)) et (scène9.terminée == 0) :
                                                    si si + 1 == scène9.compteur :
                                                        sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[6])  ⟨307879⟩
                                                    si si + 1 == scène9.compteur :
                                                        tête_texte_de_lèvres(tête=c47, texte="strnwldbeprudrlprudnsoarwe")  ⟨307889⟩
                                                    si (si + ((v2·70) / 100)) - 6 == scène9.compteur :
                                                        tête_image_de_base(tête=c47, image=27)        ⟨307899⟩
                                                    si (si + ((v2·70) / 100)) - 1 == scène9.compteur :
                                                        sub_30AD0(objet1, 0)                          ⟨307910⟩
                                                    Scene_Tick(scène=scène9)                          ⟨307928⟩
                                            Scene_Destruct(scène=scène9, drapeaux=0)                  ⟨307954⟩
                                            si byte_4F55C == 0 :

                                                ──── scène10 ────
                                                scène10 = Scene_Create(cadence=10, palette=255, surface=&v518)  ⟨307967⟩
                                                c50 = Layer(ressource=midgames 44, x=0, y=0)          ⟨307974⟩
                                                c51 = Layer(ressource=mid36 18, x=0, y=0)             ⟨307982⟩
                                                c52 = TalkingHead(ressource=convdata type 0 "tex", x=200, y=129)  ⟨307990⟩
                                                c53 = TalkingHead(ressource=convdata type 0 "air", x=-30, y=129)  ⟨307998⟩
                                                palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨308008⟩
                                                palette_copie(destination=pal1, source=pal4(mid36 36))  ⟨308017⟩
                                                palette_copie(destination=pal1, source=pal3(midgames 45))  ⟨308026⟩
                                                ajoute c50 à scène10                                  ⟨308031⟩
                                                ajoute c51 à scène10                                  ⟨308036⟩
                                                ajoute c52 à scène10                                  ⟨308041⟩
                                                ajoute c53 à scène10                                  ⟨308046⟩
                                                palette_envoie(palette=pal1, pas=0)                   ⟨308058⟩
                                                tête_image_de_base(tête=c52, image=25)                ⟨308062⟩
                                                tête_image_de_base(tête=c52, image=31)                ⟨308066⟩
                                                si v8 != 0 :
                                                    Scene_Tick(scène=scène10)                         ⟨308075⟩
                                                    charge(mid36voc 4)                                ⟨308087⟩
                                                    tête_voix(tête=c52, ressource=mid36voc 4, cadence=9)  ⟨308093⟩
                                                    v316 = 0                                          ⟨308095⟩
                                                    tant que tête_parle(tête=c52) != 0 :
                                                        si v316 == 13 :
                                                            tête_image_de_base(tête=c52, image=-1)    ⟨308103⟩
                                                        v316_avant = v316                             ⟨308108⟩
                                                        v316 = v316 + 1                               ⟨308108⟩
                                                        si v316_avant == 14 :
                                                            tête_image_de_base(tête=c52, image=27)    ⟨308113⟩
                                                        Scene_Tick(scène=scène10)                     ⟨308126⟩
                                                    v316 = 0                                          ⟨308137⟩
                                                    tant que v316 < 10 :
                                                        Scene_Tick(scène=scène10)                     ⟨308143⟩
                                                        v316 = v316 + 1                               ⟨308145⟩
                                                sinon :
                                                    Widget_Method_Dispatch8_37030(objet1, 254)        ⟨308174⟩
                                                    v2 = 56                                           ⟨308176⟩
                                                    si = scène10.compteur                             ⟨308177⟩
                                                    tant que (scène10.compteur < si + ((v2·70) / 100)) et (scène10.terminée == 0) :
                                                        si si + 1 == scène10.compteur :
                                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[7])  ⟨308204⟩
                                                        si si + 1 == scène10.compteur :
                                                            tête_texte_de_lèvres(tête=c52, texte="spkfryrslfvrgliatprd")  ⟨308214⟩
                                                        si (si + ((v2·70) / 100)) - 1 == scène10.compteur :
                                                            sub_30AD0(objet1, 0)                      ⟨308225⟩
                                                        Scene_Tick(scène=scène10)                     ⟨308243⟩
                                                    si byte_4F55C != 0 :
                                                        Scene_Destruct(scène=scène10, drapeaux=0)     ⟨308271⟩
                                                        aller à loc_B5097                             ⟨308273⟩
                                                    v2_avant = si + ((v2·70) / 100)                   ⟨308276⟩
                                                    v2 = 80                                           ⟨308276⟩
                                                    si = scène10.compteur                             ⟨308277⟩
                                                    tant que (scène10.compteur < si + ((v2·70) / 100)) et (scène10.terminée == 0) :
                                                        si si + 1 == scène10.compteur :
                                                            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[8])  ⟨308303⟩
                                                        si si + 1 == scène10.compteur :
                                                            tête_texte_de_lèvres(tête=c52, texte="imjelosashl")  ⟨308313⟩
                                                        si si + 13 == scène10.compteur :
                                                            tête_image_de_base(tête=c52, image=-1)    ⟨308323⟩
                                                        si si + 14 == scène10.compteur :
                                                            tête_image_de_base(tête=c52, image=27)    ⟨308333⟩
                                                        si si + 15 == scène10.compteur :
                                                            tête_texte_de_lèvres(tête=c52, texte="ukdbtthasaliknsay")  ⟨308343⟩
                                                        si (si + ((v2·70) / 100)) - 1 == scène10.compteur :
                                                            sub_30AD0(objet1, 0)                      ⟨308354⟩
                                                        Scene_Tick(scène=scène10)                     ⟨308372⟩
                                                Scene_Destruct(scène=scène10, drapeaux=0)             ⟨308398⟩
                                                si byte_4F55C == 0 :

                                                    ──── scène11 ────
                                                    scène11 = Scene_Create(cadence=9, palette=255, surface=&v518)  ⟨308411⟩
                                                    c54 = Layer(ressource=midgames 44, x=0, y=0)      ⟨308418⟩
                                                    c55 = Layer(ressource=mid36 18, x=0, y=0)         ⟨308426⟩
                                                    c56 = TalkingHead(ressource=convdata type 0 "virgil", x=-45, y=129)  ⟨308434⟩
                                                    c57 = TalkingHead(ressource=convdata type 0 "gwen", x=145, y=129)  ⟨308442⟩
                                                    c58 = TalkingHead(ressource=convdata type 0 "billy", x=310, y=129)  ⟨308450⟩
                                                    palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨308460⟩
                                                    palette_copie(destination=pal1, source=pal4(mid36 36))  ⟨308469⟩
                                                    palette_copie(destination=pal1, source=pal3(midgames 45))  ⟨308478⟩
                                                    ajoute c54 à scène11                              ⟨308483⟩
                                                    ajoute c55 à scène11                              ⟨308488⟩
                                                    ajoute c56 à scène11                              ⟨308493⟩
                                                    ajoute c58 à scène11                              ⟨308498⟩
                                                    ajoute c57 à scène11                              ⟨308503⟩
                                                    palette_envoie(palette=pal1, pas=0)               ⟨308515⟩
                                                    tête_image_de_base(tête=c56, image=27)            ⟨308519⟩
                                                    tête_image_de_base(tête=c58, image=27)            ⟨308523⟩
                                                    c57.+47 = 0                                       ⟨308526⟩
                                                    si v8 != 0 :
                                                        Scene_Tick(scène=scène11)                     ⟨308534⟩
                                                        v316 = 0                                      ⟨308536⟩
                                                        v310 = 0                                      ⟨308539⟩
                                                        charge(mid36voc 5)                            ⟨308546⟩
                                                        tête_voix(tête=c57, ressource=mid36voc 5, cadence=9)  ⟨308552⟩
                                                        v318 = 0                                      ⟨308554⟩
                                                        tant que v318 < 3 :
                                                            Scene_Tick(scène=scène11)                 ⟨308560⟩
                                                            v318 = v318 + 1                           ⟨308562⟩
                                                        tant que tête_parle(tête=c57) != 0 :
                                                            Scene_Tick(scène=scène11)                 ⟨308579⟩
                                                        si byte_4F55C != 0 :
                                                            si v311 == 0 : aller à loc_AEEDF          ⟨308593⟩
                                                            Scene_Destruct(scène=scène11, drapeaux=0)  ⟨308600⟩
                                                            aller à loc_B5097                         ⟨308602⟩
                                                        v318 = 0                                      ⟨308605⟩
                                                        tant que v318 < 12 :
                                                            si v318 == 2 :
                                                                tête_image_de_base(tête=c57, image=27)  ⟨308613⟩
                                                            si v318 == 4 :
                                                                tête_image_de_base(tête=c57, image=15)  ⟨308621⟩
                                                            si v318 == 6 :
                                                                tête_image_de_base(tête=c57, image=-1)  ⟨308629⟩
                                                            Scene_Tick(scène=scène11)                 ⟨308635⟩
                                                            v318 = v318 + 1                           ⟨308637⟩
                                                        si byte_4F55C != 0 :
                                                            si v311 == 0 : aller à loc_AEEDF          ⟨308645⟩
                                                            Scene_Destruct(scène=scène11, drapeaux=0)  ⟨308652⟩
                                                            aller à loc_B5097                         ⟨308654⟩
                                                        charge(mid36voc 6)                            ⟨308667⟩
                                                        tête_voix(tête=c57, ressource=mid36voc 6, cadence=9)  ⟨308673⟩
                                                        tant que tête_parle(tête=c57) != 0 :
                                                            Scene_Tick(scène=scène11)                 ⟨308687⟩
                                                        tête_image_de_base(tête=c57, image=27)        ⟨308700⟩
                                                        v318 = 0                                      ⟨308702⟩
                                                        tant que v318 < 10 :
                                                            Scene_Tick(scène=scène11)                 ⟨308708⟩
                                                            v318 = v318 + 1                           ⟨308710⟩
                                                        v316 = 0                                      ⟨308748⟩
                                                        v310 = 0                                      ⟨308750⟩
                                                    sinon :
                                                        Widget_Method_Dispatch8_37030(objet1, 235)    ⟨308757⟩
                                                        v2 = 30                                       ⟨308759⟩
                                                        si = scène11.compteur                         ⟨308760⟩
                                                        tant que (scène11.compteur < si + ((v2·70) / 100)) et (scène11.terminée == 0) :
                                                            si scène11.compteur == si :
                                                                tête_image_de_base(tête=c57, image=19)  ⟨308779⟩
                                                            si si + 1 == scène11.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[9])  ⟨308795⟩
                                                            si si + 1 == scène11.compteur :
                                                                tête_texte_de_lèvres(tête=c57, texte="ivnrbngdwdwrs")  ⟨308805⟩
                                                            si (si + ((v2·70) / 100)) - 1 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=-1)  ⟨308815⟩
                                                            si (si + ((v2·70) / 100)) - 1 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=27)  ⟨308825⟩
                                                            si (si + ((v2·70) / 100)) - 1 == scène11.compteur :
                                                                sub_30AD0(objet1, 0)                  ⟨308836⟩
                                                            Scene_Tick(scène=scène11)                 ⟨308854⟩
                                                        si byte_4F55C != 0 :
                                                            Scene_Destruct(scène=scène11, drapeaux=0)  ⟨308882⟩
                                                            aller à loc_B5097                         ⟨308884⟩
                                                        v2_avant = si + ((v2·70) / 100)               ⟨308887⟩
                                                        v2 = 50                                       ⟨308887⟩
                                                        si = scène11.compteur                         ⟨308888⟩
                                                        tant que (scène11.compteur < si + ((v2·70) / 100)) et (scène11.terminée == 0) :
                                                            si si + 1 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=-1)  ⟨308909⟩
                                                            si si + 1 == scène11.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[10])  ⟨308925⟩
                                                            si si + 1 == scène11.compteur :
                                                                tête_texte_de_lèvres(tête=c57, texte="btcmadr")  ⟨308935⟩
                                                            si si + 10 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=27)  ⟨308945⟩
                                                            si si + 12 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=15)  ⟨308955⟩
                                                            si si + 14 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=-1)  ⟨308965⟩
                                                            si si + 14 == scène11.compteur :
                                                                tête_texte_de_lèvres(tête=c57, texte="yorthabsta")  ⟨308975⟩
                                                            si (si + ((v2·70) / 100)) - 5 == scène11.compteur :
                                                                tête_image_de_base(tête=c57, image=27)  ⟨308985⟩
                                                            si (si + ((v2·70) / 100)) - 1 == scène11.compteur :
                                                                sub_30AD0(objet1, 0)                  ⟨308996⟩
                                                            Scene_Tick(scène=scène11)                 ⟨309014⟩
                                                    Scene_Destruct(scène=scène11, drapeaux=0)         ⟨309040⟩
                                                    si byte_4F55C == 0 :
                                                        v3178 = word_4D392                            ⟨309053⟩
                                                        word_4D392 = &v3180                           ⟨309055⟩
                                                        si v9 != 0 :
                                                            charge(asoundfx 25)                       ⟨309069⟩
                                                            canal_init(canal=canal1, pilote=word_4CA5D)  ⟨309074⟩
                                                            canal_enregistre(canal=canal1, ressource=asoundfx 25, x=0)  ⟨309081⟩
                                                        v316 = 0                                      ⟨309085⟩
                                                        v310 = 0                                      ⟨309088⟩
                                                        charge(mid36 23)                              ⟨309095⟩
                                                        charge(mid36 22)                              ⟨309107⟩
                                                        charge(mid36 20)                              ⟨309119⟩
                                                        charge(mid36 26)                              ⟨309131⟩
                                                        v356 = 0                                      ⟨309133⟩
                                                        charge(mid36 25)                              ⟨309143⟩
                                                        v360 = 0                                      ⟨309148⟩
                                                        charge(mid36 21)                              ⟨309155⟩
                                                        charge(mid36 24)                              ⟨309167⟩

                                                        ──── scène12 ────
                                                        scène12 = Scene_Create(cadence=10, palette=255, surface=&v518)  ⟨309175⟩
                                                        c59 = Layer(ressource=midgames 44, x=0, y=0)  ⟨309182⟩
                                                        c60 = Layer(ressource=mid36 18, x=0, y=0)     ⟨309190⟩
                                                        c61 = Layer(ressource=mid36 23, x=0, y=3)     ⟨309198⟩
                                                        c62 = OverlayImageLayer(ressource=mid36 22, x=113, y=3, image=0)  ⟨309207⟩
                                                        c63 = OverlayImageLayer(ressource=mid36 20, x=0, y=3, image=0)  ⟨309216⟩
                                                        c64 = OverlayImageLayer(ressource=mid36 25, x=0, y=3, image=0)  ⟨309225⟩
                                                        c65 = OverlayImageLayer(ressource=mid36 26, x=40, y=3, image=0)  ⟨309234⟩
                                                        c66 = OverlayImageLayer(ressource=mid36 21, x=0, y=3, image=0)  ⟨309243⟩
                                                        c67 = OverlayImageLayer(ressource=mid36 24, x=-140, y=3, image=0)  ⟨309252⟩
                                                        palette_copie(destination=pal1, source=pal4(mid36 36))  ⟨309262⟩
                                                        palette_copie(destination=pal1, source=pal3(midgames 45))  ⟨309271⟩
                                                        palette_copie(destination=pal1, source=pal5(mid36 37))  ⟨309280⟩
                                                        ajoute c59 à scène12                          ⟨309285⟩
                                                        ajoute c60 à scène12                          ⟨309290⟩
                                                        ajoute c61 à scène12                          ⟨309295⟩
                                                        ajoute c67 à scène12                          ⟨309300⟩
                                                        ajoute c64 à scène12                          ⟨309305⟩
                                                        ajoute c63 à scène12                          ⟨309310⟩
                                                        ajoute c66 à scène12                          ⟨309315⟩
                                                        ajoute c65 à scène12                          ⟨309320⟩
                                                        ajoute c62 à scène12                          ⟨309325⟩
                                                        c62.image = 2                                 ⟨309332⟩
                                                        c63.image = 2                                 ⟨309334⟩
                                                        c64.image = 1                                 ⟨309336⟩
                                                        c66.image = 9                                 ⟨309338⟩
                                                        c65.image = 1                                 ⟨309340⟩
                                                        c67.image = 1                                 ⟨309342⟩
                                                        palette_envoie(palette=pal1, pas=0)           ⟨309349⟩
                                                        v396 = 3                                      ⟨309351⟩
                                                        v398 = 10                                     ⟨309352⟩
                                                        v400 = 8                                      ⟨309353⟩
                                                        v402 = 3                                      ⟨309354⟩
                                                        v404 = 3                                      ⟨309355⟩
                                                        v406 = 10                                     ⟨309356⟩
                                                        scène12.compteur = 0                          ⟨309357⟩
                                                        tant que (v406 + 25 > scène12.compteur) et (scène12.terminée == 0) :
                                                            v408 = scène12.compteur                   ⟨309362⟩
                                                            si v408 == 14 :
                                                                c65.image = 2                         ⟨309366⟩
                                                            si v408 == 16 :
                                                                c64.image = 2                         ⟨309372⟩
                                                            si v408 > 1 :
                                                                si v408 < v406 :
                                                                    CRT_Rand()                        ⟨309380⟩
                                                                    v410 = ((CRT_Rand()·2) / 32768) + 1  ⟨309387⟩
                                                                    c62.image = v410                  ⟨309390⟩
                                                            si v406 + 1 == v408 :
                                                                si v9 != 0 :
                                                                    v412 = word_4EFA6                 ⟨309400⟩
                                                                    v414 = 0                          ⟨309401⟩
                                                                    si canal1.+0 != 0 :
                                                                        AIL_start_sequence(pilote=canal1.+0→4, séquence=v3182)  ⟨309407⟩
                                                                        sub_50F5(canal1.+0→4, v3182, v412, v414)  ⟨309414⟩
                                                            si v406 - 1 < v408 :
                                                                si v406 + 7 > v408 :
                                                                    v416 = v404                       ⟨309428⟩
                                                                    v404_avant = v404                 ⟨309429⟩
                                                                    v404 = v404 + 1                   ⟨309429⟩
                                                                    c62.image = v416                  ⟨309432⟩
                                                            si v406 + 10 < v408 :
                                                                si v406 + 13 > v408 :
                                                                    v418 = v396                       ⟨309444⟩
                                                                    v396_avant = v396                 ⟨309445⟩
                                                                    v396 = v396 + 1                   ⟨309445⟩
                                                                    c63.image = v418                  ⟨309448⟩
                                                            si v406 + 12 < v408 :
                                                                si v406 + 15 > v408 :
                                                                    v420 = v398                       ⟨309460⟩
                                                                    v398_avant = v398                 ⟨309461⟩
                                                                    v398 = v398 + 1                   ⟨309461⟩
                                                                    c66.image = v420                  ⟨309464⟩
                                                            si v406 + 10 < v408 :
                                                                si v406 + 14 > v408 :
                                                                    v422 = v400                       ⟨309476⟩
                                                                    v400_avant = v400                 ⟨309477⟩
                                                                    v400 = v400 + 1                   ⟨309477⟩
                                                                    c67.image = v422                  ⟨309480⟩
                                                            si v406 + 9 < v408 :
                                                                si v406 + 13 > v408 :
                                                                    v424 = v402                       ⟨309492⟩
                                                                    v402_avant = v402                 ⟨309493⟩
                                                                    v402 = v402 + 1                   ⟨309493⟩
                                                                    c65.image = v424                  ⟨309496⟩
                                                            Scene_Tick(scène=scène12)                 ⟨309508⟩
                                                        Scene_Destruct(scène=scène12, drapeaux=0)     ⟨309536⟩
                                                        v370 = 0                                      ⟨309555⟩
                                                        v360 = 0                                      ⟨309573⟩
                                                        v356 = 0                                      ⟨309589⟩
                                                        v316 = 0                                      ⟨309661⟩
                                                        v310 = 0                                      ⟨309663⟩
                                                        canal_arrête(canal=canal1)                    ⟨309666⟩
                                                        sub_5C1C(&v3180, 2)                           ⟨309671⟩
                                                        v300 = 0                                      ⟨309690⟩
                                                        si byte_4F55C == 0 :
                                                            v300 = 0                                  ⟨309699⟩
                                                            v3180 = 436                               ⟨309700⟩
                                                            v3178 = word_4D392                        ⟨309702⟩
                                                            word_4D392 = &v3180                       ⟨309704⟩
                                                            v3180 = 444                               ⟨309705⟩
                                                            v3176 = 0                                 ⟨309706⟩
                                                            v3172 = 0                                 ⟨309707⟩
                                                            v3182 = -1                                ⟨309709⟩
                                                            si v9 != 0 :
                                                                charge(asoundfx 33)                   ⟨309718⟩
                                                                canal_init(canal=canal1, pilote=word_4CA5D)  ⟨309723⟩
                                                                canal_enregistre(canal=canal1, ressource=asoundfx 33, x=0)  ⟨309730⟩
                                                            v316 = 0                                  ⟨309734⟩
                                                            v310 = 0                                  ⟨309737⟩
                                                            charge(mid36 17)                          ⟨309744⟩
                                                            charge(mid36 29)                          ⟨309756⟩
                                                            charge(mid36 19)                          ⟨309768⟩
                                                            charge(mid36 28)                          ⟨309780⟩
                                                            v356 = 0                                  ⟨309782⟩
                                                            charge(mid36 10)                          ⟨309792⟩
                                                            v360 = 0                                  ⟨309797⟩
                                                            charge(mid36 9)                           ⟨309804⟩

                                                            ──── scène13 ────
                                                            scène13 = Scene_Create(cadence=9, palette=255, surface=&v518)  ⟨309812⟩
                                                            c68 = MovingLayer(ressource=midgames 42, x=0, y=-80)  ⟨309825⟩
                                                            c68.vx = 0                                ⟨309832⟩
                                                            c68.vy = 0                                ⟨309834⟩
                                                            c68.vx = 0                                ⟨309836⟩
                                                            c68.vy = 0                                ⟨309838⟩
                                                            c69 = MovingLayer(ressource=mid36 19, x=0, y=0)  ⟨309858⟩
                                                            c69.vx = 0                                ⟨309865⟩
                                                            c69.vy = 0                                ⟨309867⟩
                                                            c69.vx = 0                                ⟨309869⟩
                                                            c69.vy = 0                                ⟨309871⟩
                                                            c70 = MovingLayer(ressource=mid36 17, x=0, y=-80)  ⟨309891⟩
                                                            c70.vx = 0                                ⟨309898⟩
                                                            c70.vy = 0                                ⟨309900⟩
                                                            c70.vx = 0                                ⟨309902⟩
                                                            c70.vy = 0                                ⟨309904⟩
                                                            c71 = MovingLayer(ressource=mid36 28, x=0, y=0)  ⟨309924⟩
                                                            c71.vx = 0                                ⟨309931⟩
                                                            c71.vy = 0                                ⟨309933⟩
                                                            c71.vx = 0                                ⟨309935⟩
                                                            c71.vy = 0                                ⟨309937⟩
                                                            c72 = MovingLayer(ressource=mid36 29, x=0, y=0)  ⟨309957⟩
                                                            c72.vx = 0                                ⟨309964⟩
                                                            c72.vy = 0                                ⟨309966⟩
                                                            c72.vx = 0                                ⟨309968⟩
                                                            c72.vy = 0                                ⟨309970⟩
                                                            c73 = MovingLayer(ressource=mid36 9, x=0, y=0)  ⟨309990⟩
                                                            c73.vx = 0                                ⟨309997⟩
                                                            c73.vy = 0                                ⟨309999⟩
                                                            c73.vx = 0                                ⟨310001⟩
                                                            c73.vy = 0                                ⟨310003⟩
                                                            sub_F088(0, mid36 3, 0, 0, 0, 0, 2)       ⟨310020⟩
                                                            v392 = sub_F088(0, mid36 3, 0, 0, 0, 0, 2)  ⟨310022⟩
                                                            c74 = MovingLayer(ressource=mid36 10, x=0, y=0)  ⟨310034⟩
                                                            c74.vx = 0                                ⟨310041⟩
                                                            c74.vy = 0                                ⟨310043⟩
                                                            c74.vx = 0                                ⟨310045⟩
                                                            c74.vy = 0                                ⟨310047⟩
                                                            palette_copie(destination=pal1, source=pal2(midgames 43))  ⟨310063⟩
                                                            palette_copie(destination=pal1, source=pal6(mid36 30))  ⟨310072⟩
                                                            palette_copie(destination=pal1, source=pal7(midgames 47))  ⟨310081⟩
                                                            ajoute c68 à scène13                      ⟨310086⟩
                                                            ajoute c69 à scène13                      ⟨310091⟩
                                                            ajoute c71 à scène13                      ⟨310096⟩
                                                            ajoute c72 à scène13                      ⟨310101⟩
                                                            ajoute c73 à scène13                      ⟨310106⟩
                                                            ajoute v392 à scène13                     ⟨310111⟩
                                                            ajoute c74 à scène13                      ⟨310116⟩
                                                            ajoute c70 à scène13                      ⟨310121⟩
                                                            palette_envoie(palette=pal1, pas=0)       ⟨310133⟩
                                                            v398 = 0                                  ⟨310135⟩
                                                            v400 = 0                                  ⟨310136⟩
                                                            tant que (scène13.compteur < 185) et (scène13.terminée == 0) :
                                                                v402 = scène13.compteur               ⟨310141⟩
                                                                si v402 > 8 :
                                                                    si v402 < 14 :
                                                                        v404 = v400                   ⟨310147⟩
                                                                        v400_avant = v400             ⟨310148⟩
                                                                        v400 = v400 + 1               ⟨310148⟩
                                                                        c73.image = v404              ⟨310151⟩
                                                                si v402 == 20 :
                                                                    c68.vx = 0                        ⟨310160⟩
                                                                    c68.vy = 1                        ⟨310162⟩
                                                                    c69.vx = 0                        ⟨310164⟩
                                                                    c69.vy = 1                        ⟨310166⟩
                                                                    c70.vx = 0                        ⟨310168⟩
                                                                    c70.vy = 1                        ⟨310170⟩
                                                                    c71.vx = 0                        ⟨310172⟩
                                                                    c71.vy = 2                        ⟨310174⟩
                                                                    c72.vx = 0                        ⟨310176⟩
                                                                    c72.vy = 3                        ⟨310178⟩
                                                                    c73.vx = 0                        ⟨310180⟩
                                                                    c73.vy = 3                        ⟨310182⟩
                                                                    v392→29 = 0                       ⟨310184⟩
                                                                    v392→31 = 3                       ⟨310186⟩
                                                                    c74.vx = 0                        ⟨310188⟩
                                                                    c74.vy = 4                        ⟨310190⟩
                                                                si v402 == 100 :
                                                                    c68.vx = 0                        ⟨310196⟩
                                                                    c68.vy = 0                        ⟨310198⟩
                                                                    c69.vx = 0                        ⟨310200⟩
                                                                    c69.vy = 0                        ⟨310202⟩
                                                                    c70.vx = 0                        ⟨310204⟩
                                                                    c70.vy = 0                        ⟨310206⟩
                                                                    c71.vx = 0                        ⟨310208⟩
                                                                    c71.vy = 0                        ⟨310210⟩
                                                                si v402 == 80 :
                                                                    c72.vx = 0                        ⟨310216⟩
                                                                    c72.vy = 0                        ⟨310218⟩
                                                                    c73.vx = 0                        ⟨310220⟩
                                                                    c73.vy = 0                        ⟨310222⟩
                                                                si v402 == 60 :
                                                                    v392→29 = 0                       ⟨310228⟩
                                                                    v392→31 = 0                       ⟨310230⟩
                                                                    c74.vx = 0                        ⟨310232⟩
                                                                    c74.vy = 0                        ⟨310234⟩
                                                                si v398 == 82 :
                                                                    v398 = v398 + 1                   ⟨310239⟩
                                                                    retire(parent=scène13, calque=c70)  ⟨310243⟩
                                                                    c70.détruit(3)                    ⟨310251⟩
                                                                si v402 == 99 :
                                                                    Scene_SetFps(scène=scène13, cadence=12)  ⟨310261⟩
                                                                si v402 > 99 :
                                                                    si v398 < 82 :
                                                                        v406 = v398                   ⟨310270⟩
                                                                        v398_avant = v398             ⟨310271⟩
                                                                        v398 = v398 + 1               ⟨310271⟩
                                                                        c70.image = v406              ⟨310274⟩
                                                                si v402 == 108 :
                                                                    si v9 != 0 :
                                                                        v408 = word_4EFB6             ⟨310282⟩
                                                                        v410 = 0                      ⟨310283⟩
                                                                        si canal1.+0 != 0 :
                                                                            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3182)  ⟨310289⟩
                                                                            sub_50F5(canal1.+0→4, v3182, v408, v410)  ⟨310296⟩
                                                                si v402 == 118 :
                                                                    si v9 != 0 :
                                                                        v412 = word_4EFB6             ⟨310306⟩
                                                                        v414 = 0                      ⟨310307⟩
                                                                        si canal1.+0 != 0 :
                                                                            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3182)  ⟨310313⟩
                                                                            sub_50F5(canal1.+0→4, v3182, v412, v414)  ⟨310320⟩
                                                                si v398 == 75 :
                                                                    si v9 != 0 :
                                                                        v416 = word_4EFB6 - 60        ⟨310331⟩
                                                                        v418 = 0                      ⟨310332⟩
                                                                        si canal1.+0 != 0 :
                                                                            AIL_start_sequence(pilote=canal1.+0→4, séquence=v3182)  ⟨310338⟩
                                                                            sub_50F5(canal1.+0→4, v3182, v416, v418)  ⟨310345⟩
                                                                Scene_Tick(scène=scène13)             ⟨310359⟩
                                                            Scene_Destruct(scène=scène13, drapeaux=0)  ⟨310385⟩
                                                            v360 = 0                                  ⟨310404⟩
                                                            v356 = 0                                  ⟨310420⟩
                                                            v316 = 0                                  ⟨310492⟩
                                                            v310 = 0                                  ⟨310494⟩
                                                            canal_arrête(canal=canal1)                ⟨310497⟩
                                                            sub_5C1C(&v3180, 2)                       ⟨310502⟩
                                                            v300 = 0                                  ⟨310521⟩
                                                            fondu_disparition(palette=pal1, couleur=&v26, pas=2, premier=0, nombre=256)  ⟨310529⟩
loc_B5097:                                                                                            ⟨310532⟩
v288 = 0                                                                                              ⟨310557⟩
v283 = 0                                                                                              ⟨310558⟩
v282 = 0                                                                                              ⟨310559⟩
v273 = 0                                                                                              ⟨310576⟩
v272 = 0                                                                                              ⟨310577⟩
v263 = 0                                                                                              ⟨310594⟩
v262 = 0                                                                                              ⟨310595⟩
v253 = 0                                                                                              ⟨310612⟩
v252 = 0                                                                                              ⟨310613⟩
v243 = 0                                                                                              ⟨310630⟩
v242 = 0                                                                                              ⟨310631⟩
v233 = 0                                                                                              ⟨310648⟩
v232 = 0                                                                                              ⟨310649⟩
v223 = 0                                                                                              ⟨310666⟩
v222 = 0                                                                                              ⟨310667⟩
v213 = 0                                                                                              ⟨310684⟩
v212 = 0                                                                                              ⟨310685⟩
v197 = 0                                                                                              ⟨310706⟩
v196 = 0                                                                                              ⟨310707⟩
v181 = 0                                                                                              ⟨310728⟩
v180 = 0                                                                                              ⟨310729⟩
v165 = 0                                                                                              ⟨310750⟩
v164 = 0                                                                                              ⟨310751⟩
v149 = 0                                                                                              ⟨310772⟩
v148 = 0                                                                                              ⟨310773⟩
v133 = 0                                                                                              ⟨310794⟩
v132 = 0                                                                                              ⟨310795⟩
v117 = 0                                                                                              ⟨310816⟩
v116 = 0                                                                                              ⟨310817⟩
v101 = 0                                                                                              ⟨310838⟩
v100 = 0                                                                                              ⟨310839⟩
v91 = 0                                                                                               ⟨310856⟩
v90 = 0                                                                                               ⟨310857⟩
v81 = 0                                                                                               ⟨310874⟩
v80 = 0                                                                                               ⟨310875⟩
v71 = 0                                                                                               ⟨310892⟩
v70 = 0                                                                                               ⟨310893⟩
v61 = 0                                                                                               ⟨310910⟩
v60 = 0                                                                                               ⟨310911⟩
v51 = 0                                                                                               ⟨310928⟩
v50 = 0                                                                                               ⟨310929⟩
voix_arrête(voix=voix1)                                                                               ⟨310933⟩
v3096 = 0                                                                                             ⟨310950⟩
v3091 = 0                                                                                             ⟨310951⟩
v3090 = 0                                                                                             ⟨310952⟩
canal_arrête(canal=canal2)                                                                            ⟨310955⟩
sub_5C1C(&v1022, 2)                                                                                   ⟨310960⟩
v31 = 0                                                                                               ⟨310983⟩
v30 = 0                                                                                               ⟨310984⟩
retour                                                                                                ⟨311024⟩
```

## Tableaux du segment de données

