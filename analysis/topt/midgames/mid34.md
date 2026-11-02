# Script extrait de `sub_A8070` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## sub_A8070

```
bp = sp                                                                                               ⟨292731⟩
tableau_textes(tableau=textes1, nombre=11, longueur=200)                                              ⟨292740⟩
byte_4F55C = 0                                                                                        ⟨292742⟩
v9 = 0                                                                                                ⟨292743⟩
v10 = 0                                                                                               ⟨292744⟩
v11 = 0                                                                                               ⟨292745⟩
si word_4CA5B != 0 :
    v10 = 1                                                                                           ⟨292748⟩
v14 = word_4D36E                                                                                      ⟨292752⟩
v396 = 0                                                                                              ⟨292753⟩
TextFormat_ApplyStyleAttribute_357D1(&v396, v14)                                                      ⟨292758⟩
v410 = 0                                                                                              ⟨292760⟩
TextRenderer_ApplyFormatChange_3584E(&v410, 0)                                                        ⟨292769⟩
sub_3499B(&v18, &v410)                                                                                ⟨292775⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨292781⟩
v28 = 0                                                                                               ⟨292787⟩
sub_435F1(pak midgames)                                                                               ⟨292809⟩
si v10 != 0 :
    si sub_993C(chemin1) != 0 :
        pak mid34voc.ouvre(chemin1, 1)                                                                ⟨292840⟩
        sub_435F1(pak mid34voc)                                                                       ⟨292844⟩
    sinon :
        v10 = 0                                                                                       ⟨292849⟩
sinon :
    v10 = 0                                                                                           ⟨292849⟩
v38 = 0                                                                                               ⟨292852⟩
v33 = 0                                                                                               ⟨292854⟩
v32 = 0                                                                                               ⟨292855⟩
v40 = byte_4CA58                                                                                      ⟨292857⟩
si v40 - 1 <= 4 :
    si (v40 - 1)·2 == 0 ou ((v40 - 1)·2 != 2) et (((v40 - 1)·2 != 4) et (((v40 - 1)·2 != 6) et ((v40 - 1)·2 != 8))) :
        si sub_993C(chemin1) != 0 :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨292901⟩
            sub_435F1(pak rsoundfx)                                                                   ⟨292905⟩
            flux_iff(flux=flux1)                                                                      ⟨292919⟩
            v2999 = 256                                                                               ⟨292922⟩
            v3003 = 0                                                                                 ⟨292923⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨292931⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨292937⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨292943⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨292947⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨292949⟩
            di = 1                                                                                    ⟨292950⟩
            tant que di <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨292956⟩
                ds:26002[di·2] = iff_lit_mot(flux=flux1)                                              ⟨292960⟩
                di = di + 1                                                                           ⟨292961⟩
            iff_ferme_form(flux=flux1)                                                                ⟨292968⟩
            v11 = 1                                                                                   ⟨292970⟩
            iff_ferme_form(flux=flux1)                                                                ⟨292974⟩
        si sub_993C(chemin1) != 0 :
            v9 = 1                                                                                    ⟨293000⟩
            si v11 == 0 :
                word_4F048 = 90                                                                       ⟨293005⟩
    sinon :
        si sub_993C(chemin1) != 0 :
            si word_4CA5D != 0 :
                pak asoundfx.ouvre(chemin1, 1)                                                        ⟨293042⟩
                sub_435F1(pak asoundfx)                                                               ⟨293046⟩
                flux_iff(flux=flux1)                                                                  ⟨293060⟩
                v2999 = 256                                                                           ⟨293063⟩
                v3003 = 0                                                                             ⟨293064⟩
                flux1.ouvre(chemin1, 1)                                                               ⟨293072⟩
                iff_form(flux=flux1, balise='VOLU', x=0)                                              ⟨293078⟩
                iff_chunk(flux=flux1, balise='ADLB', x=1)                                             ⟨293084⟩
                iff_lit_mot(flux=flux1)                                                               ⟨293088⟩
                word_4F048 = iff_lit_mot(flux=flux1)                                                  ⟨293090⟩
                di = 1                                                                                ⟨293091⟩
                tant que di <= 106 :
                    iff_lit_mot(flux=flux1)                                                           ⟨293097⟩
                    ds:26002[di·2] = iff_lit_mot(flux=flux1)                                          ⟨293101⟩
                    di = di + 1                                                                       ⟨293102⟩
                iff_ferme_form(flux=flux1)                                                            ⟨293109⟩
                v11 = 1                                                                               ⟨293111⟩
                iff_ferme_form(flux=flux1)                                                            ⟨293115⟩
        si sub_993C(chemin1) != 0 :
            v9 = 1                                                                                    ⟨293158⟩
            si v11 == 0 :
                word_4F048 = 255                                                                      ⟨293163⟩
si v11 != 0 :
    v2936 = word_4D392                                                                                ⟨293176⟩
    word_4D392 = &v2938                                                                               ⟨293178⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨293187⟩
    charge(asoundfx 76)                                                                               ⟨293199⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 76, x=0)                                        ⟨293206⟩
    canal_arrête(canal=canal1)                                                                        ⟨293210⟩
    v252 = 0                                                                                          ⟨293229⟩
    canal_arrête(canal=canal1)                                                                        ⟨293232⟩
    sub_5C1C(&v2938, 2)                                                                               ⟨293237⟩
v780 = 436                                                                                            ⟨293241⟩
v778 = word_4D392                                                                                     ⟨293243⟩
word_4D392 = &v780                                                                                    ⟨293245⟩
v780 = 444                                                                                            ⟨293246⟩
v784 = 0                                                                                              ⟨293249⟩
si v9 != 0 :
    sub_435F1(pak mmusic)                                                                             ⟨293265⟩
    si v10 != 0 :
        v249 = 20                                                                                     ⟨293269⟩
    sinon :
        v249 = 19                                                                                     ⟨293273⟩
    charge(mmusic v249)                                                                               ⟨293284⟩
    canal_init(canal=canal2, pilote=word_4CA59)                                                       ⟨293289⟩
    canal_enregistre(canal=canal2, ressource=mmusic v249, x=0)                                        ⟨293296⟩
v793 = booléen                                                                                        ⟨293313⟩
v789 = booléen                                                                                        ⟨293314⟩
si v10 != 0 :
    voix_pilote(voix=voix1, pilote=word_4CA5B)                                                        ⟨293320⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨293337⟩
    v2999 = 256                                                                                       ⟨293340⟩
    v3003 = 0                                                                                         ⟨293341⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨293349⟩
    iff_form(flux=flux1, balise='MG34', x=0)                                                          ⟨293355⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨293361⟩
    di = 0                                                                                            ⟨293363⟩
    tant que di < 11 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨293371⟩
        v250 = v2982                                                                                  ⟨293374⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·di), taille=v250)                    ⟨293385⟩
        v2995 = v2978                                                                                 ⟨293388⟩
        di = di + 1                                                                                   ⟨293389⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨293396⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨293401⟩
charge(midgames 42)                                                                                   ⟨293420⟩
charge(midgames 44)                                                                                   ⟨293432⟩
charge_convdata_type2("normal")                                                                       ⟨293442⟩
palette_depuis(pal2(convdata type 2 "normal"))                                                        ⟨293449⟩
charge(midgames 37)                                                                                   ⟨293461⟩
palette_depuis(pal3(midgames 37))                                                                     ⟨293468⟩
charge(midgames 43)                                                                                   ⟨293480⟩
palette_depuis(pal4(midgames 43))                                                                     ⟨293487⟩
charge(midgames 45)                                                                                   ⟨293499⟩
palette_depuis(pal5(midgames 45))                                                                     ⟨293506⟩
charge(midgames 41)                                                                                   ⟨293518⟩
palette_depuis(pal6(midgames 41))                                                                     ⟨293525⟩
charge(midgames 29)                                                                                   ⟨293537⟩
charge(midgames 33)                                                                                   ⟨293549⟩
charge(midgames 34)                                                                                   ⟨293561⟩
charge(midgames 35)                                                                                   ⟨293573⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨293583⟩
charge_convdata_type0("lyle", drapeau=3)                                                              ⟨293593⟩
charge_convdata_type0("tex", drapeau=3)                                                               ⟨293603⟩
charge_convdata_type0("gwen", drapeau=3)                                                              ⟨293613⟩
charge_convdata_type0("miguel", drapeau=3)                                                            ⟨293623⟩
v240 = 0                                                                                              ⟨293625⟩
v236 = 2                                                                                              ⟨293626⟩
v235 = 0                                                                                              ⟨293627⟩
v234 = 0                                                                                              ⟨293628⟩
TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                       ⟨293642⟩
v242 = ?                                                                                              ⟨293644⟩
v244 = TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                ⟨293645⟩
v240 = v244                                                                                           ⟨293647⟩
v236 = 2                                                                                              ⟨293648⟩
v235 = 1                                                                                              ⟨293649⟩
v234 = 0                                                                                              ⟨293650⟩
GlyphObject_ConstructWithBuffer_36D56(&v2894, &v240)                                                  ⟨293655⟩
sub_30A1D(&v2928, word_4D36E, &v2894)                                                                 ⟨293667⟩
Widget_Method_DispatchC_37052(&v2928, 0)                                                              ⟨293672⟩
Widget_Method_Dispatch8_37030(&v2928, 200)                                                            ⟨293677⟩
si byte_4F55C != 0 :
    v240 = 0                                                                                          ⟨293708⟩
    v235 = 0                                                                                          ⟨293709⟩
    v234 = 0                                                                                          ⟨293710⟩
    v225 = 0                                                                                          ⟨293727⟩
    v224 = 0                                                                                          ⟨293728⟩
    v215 = 0                                                                                          ⟨293745⟩
    v214 = 0                                                                                          ⟨293746⟩
    v205 = 0                                                                                          ⟨293763⟩
    v204 = 0                                                                                          ⟨293764⟩
    v195 = 0                                                                                          ⟨293781⟩
    v194 = 0                                                                                          ⟨293782⟩
    v185 = 0                                                                                          ⟨293799⟩
    v184 = 0                                                                                          ⟨293800⟩
    v175 = 0                                                                                          ⟨293817⟩
    v174 = 0                                                                                          ⟨293818⟩
    v165 = 0                                                                                          ⟨293835⟩
    v164 = 0                                                                                          ⟨293836⟩
    v155 = 0                                                                                          ⟨293853⟩
    v154 = 0                                                                                          ⟨293854⟩
    v145 = 0                                                                                          ⟨293871⟩
    v144 = 0                                                                                          ⟨293872⟩
    v129 = 0                                                                                          ⟨293893⟩
    v128 = 0                                                                                          ⟨293894⟩
    v113 = 0                                                                                          ⟨293915⟩
    v112 = 0                                                                                          ⟨293916⟩
    v97 = 0                                                                                           ⟨293937⟩
    v96 = 0                                                                                           ⟨293938⟩
    v81 = 0                                                                                           ⟨293959⟩
    v80 = 0                                                                                           ⟨293960⟩
    v65 = 0                                                                                           ⟨293981⟩
    v64 = 0                                                                                           ⟨293982⟩
    v55 = 0                                                                                           ⟨293999⟩
    v54 = 0                                                                                           ⟨294000⟩
    v45 = 0                                                                                           ⟨294017⟩
    v44 = 0                                                                                           ⟨294018⟩
    voix_arrête(voix=voix1)                                                                           ⟨294022⟩
    v2854 = 0                                                                                         ⟨294039⟩
    v2849 = 0                                                                                         ⟨294040⟩
    v2848 = 0                                                                                         ⟨294041⟩
    canal_arrête(canal=canal2)                                                                        ⟨294044⟩
    sub_5C1C(&v780, 2)                                                                                ⟨294049⟩
    v33 = 0                                                                                           ⟨294072⟩
    v32 = 0                                                                                           ⟨294073⟩
    retour                                                                                            ⟨294108⟩
si v9 != 0 :
    v246 = word_4F048                                                                                 ⟨294114⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v782)                                         ⟨294121⟩
        sub_50F5(canal2.+0→4, v782, v246, 0)                                                          ⟨294128⟩

──── scène1 ────
scène1 = Scene_Create(cadence=6, palette=255, surface=&v396)                                          ⟨294139⟩
c1 = Layer(ressource=midgames 42, x=0, y=-80)                                                         ⟨294146⟩
c2 = Layer(ressource=midgames 33, x=0, y=0)                                                           ⟨294154⟩
c3 = Layer(ressource=midgames 34, x=0, y=0)                                                           ⟨294162⟩
c4 = Layer(ressource=midgames 35, x=0, y=0)                                                           ⟨294170⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨294180⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨294189⟩
ajoute c1 à scène1                                                                                    ⟨294194⟩
ajoute c2 à scène1                                                                                    ⟨294199⟩
ajoute c3 à scène1                                                                                    ⟨294204⟩
ajoute c4 à scène1                                                                                    ⟨294209⟩
fondu_disparition(palette=pal1, couleur=&v28, pas=0, premier=0, nombre=256)                           ⟨294222⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨294231⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨294240⟩
Scene_Tick(scène=scène1)                                                                              ⟨294244⟩
fondu_apparition(palette=pal1, couleur=&v28, pas=2, premier=0, nombre=256)                            ⟨294253⟩
si v10 != 0 :
    Scene_Tick(scène=scène1)                                                                          ⟨294262⟩
    charge(mid34voc 0)                                                                                ⟨294274⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 0)                                 ⟨294280⟩
    di = 0                                                                                            ⟨294282⟩
    tant que di < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨294288⟩
        di = di + 1                                                                                   ⟨294290⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨294298⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène1)                                                                      ⟨294312⟩
    di = 0                                                                                            ⟨294324⟩
    tant que di < 8 :
        Scene_Tick(scène=scène1)                                                                      ⟨294330⟩
        di = di + 1                                                                                   ⟨294332⟩
    charge(mid34voc 1)                                                                                ⟨294347⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 1)                                 ⟨294353⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨294358⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène1)                                                                      ⟨294372⟩
    di = 0                                                                                            ⟨294384⟩
    tant que di < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨294390⟩
        di = di + 1                                                                                   ⟨294392⟩
    voix_arrête(voix=voix1)                                                                           ⟨294399⟩
    v270 = 0                                                                                          ⟨294418⟩
    v260 = 0                                                                                          ⟨294436⟩
sinon :
    Widget_Method_DispatchC_37052(&v2928, 0)                                                          ⟨294443⟩
    Widget_Method_Dispatch8_37030(&v2928, 233)                                                        ⟨294448⟩
    v4 = 50                                                                                           ⟨294450⟩
    si = scène1.compteur                                                                              ⟨294451⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨294460⟩
    tant que (scène1.compteur < v2) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨294464⟩
        si si + 3 == scène1.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[0])                             ⟨294472⟩
        si v2 - 1 == scène1.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨294483⟩
        Scene_Tick(scène=scène1)                                                                      ⟨294501⟩
    si byte_4F55C != 0 :
        Scene_Destruct(scène=scène1, drapeaux=0)                                                      ⟨294532⟩
        v240 = 0                                                                                      ⟨294558⟩
        v235 = 0                                                                                      ⟨294559⟩
        v234 = 0                                                                                      ⟨294560⟩
        v225 = 0                                                                                      ⟨294577⟩
        v224 = 0                                                                                      ⟨294578⟩
        v215 = 0                                                                                      ⟨294595⟩
        v214 = 0                                                                                      ⟨294596⟩
        v205 = 0                                                                                      ⟨294613⟩
        v204 = 0                                                                                      ⟨294614⟩
        v195 = 0                                                                                      ⟨294631⟩
        v194 = 0                                                                                      ⟨294632⟩
        v185 = 0                                                                                      ⟨294649⟩
        v184 = 0                                                                                      ⟨294650⟩
        v175 = 0                                                                                      ⟨294667⟩
        v174 = 0                                                                                      ⟨294668⟩
        v165 = 0                                                                                      ⟨294685⟩
        v164 = 0                                                                                      ⟨294686⟩
        v155 = 0                                                                                      ⟨294703⟩
        v154 = 0                                                                                      ⟨294704⟩
        v145 = 0                                                                                      ⟨294721⟩
        v144 = 0                                                                                      ⟨294722⟩
        v129 = 0                                                                                      ⟨294743⟩
        v128 = 0                                                                                      ⟨294744⟩
        v113 = 0                                                                                      ⟨294765⟩
        v112 = 0                                                                                      ⟨294766⟩
        v97 = 0                                                                                       ⟨294787⟩
        v96 = 0                                                                                       ⟨294788⟩
        v81 = 0                                                                                       ⟨294809⟩
        v80 = 0                                                                                       ⟨294810⟩
        v65 = 0                                                                                       ⟨294831⟩
        v64 = 0                                                                                       ⟨294832⟩
        v55 = 0                                                                                       ⟨294849⟩
        v54 = 0                                                                                       ⟨294850⟩
        v45 = 0                                                                                       ⟨294867⟩
        v44 = 0                                                                                       ⟨294868⟩
        voix_arrête(voix=voix1)                                                                       ⟨294872⟩
        v2854 = 0                                                                                     ⟨294889⟩
        v2849 = 0                                                                                     ⟨294890⟩
        v2848 = 0                                                                                     ⟨294891⟩
        canal_arrête(canal=canal2)                                                                    ⟨294894⟩
        sub_5C1C(&v780, 2)                                                                            ⟨294899⟩
        v33 = 0                                                                                       ⟨294922⟩
        v32 = 0                                                                                       ⟨294923⟩
        retour                                                                                        ⟨294958⟩
    v4 = 38                                                                                           ⟨294961⟩
    si = scène1.compteur                                                                              ⟨294962⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨294971⟩
    tant que (scène1.compteur < v2) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨294975⟩
        si si + 1 == scène1.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[1])                             ⟨294985⟩
        si v2 - 1 == scène1.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨294996⟩
        Scene_Tick(scène=scène1)                                                                      ⟨295014⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨295040⟩
si byte_4F55C != 0 :
    v240 = 0                                                                                          ⟨295071⟩
    v235 = 0                                                                                          ⟨295072⟩
    v234 = 0                                                                                          ⟨295073⟩
    v225 = 0                                                                                          ⟨295090⟩
    v224 = 0                                                                                          ⟨295091⟩
    v215 = 0                                                                                          ⟨295108⟩
    v214 = 0                                                                                          ⟨295109⟩
    v205 = 0                                                                                          ⟨295126⟩
    v204 = 0                                                                                          ⟨295127⟩
    v195 = 0                                                                                          ⟨295144⟩
    v194 = 0                                                                                          ⟨295145⟩
    v185 = 0                                                                                          ⟨295162⟩
    v184 = 0                                                                                          ⟨295163⟩
    v175 = 0                                                                                          ⟨295180⟩
    v174 = 0                                                                                          ⟨295181⟩
    v165 = 0                                                                                          ⟨295198⟩
    v164 = 0                                                                                          ⟨295199⟩
    v155 = 0                                                                                          ⟨295216⟩
    v154 = 0                                                                                          ⟨295217⟩
    v145 = 0                                                                                          ⟨295234⟩
    v144 = 0                                                                                          ⟨295235⟩
    v129 = 0                                                                                          ⟨295256⟩
    v128 = 0                                                                                          ⟨295257⟩
    v113 = 0                                                                                          ⟨295278⟩
    v112 = 0                                                                                          ⟨295279⟩
    v97 = 0                                                                                           ⟨295300⟩
    v96 = 0                                                                                           ⟨295301⟩
    v81 = 0                                                                                           ⟨295322⟩
    v80 = 0                                                                                           ⟨295323⟩
    v65 = 0                                                                                           ⟨295344⟩
    v64 = 0                                                                                           ⟨295345⟩
    v55 = 0                                                                                           ⟨295362⟩
    v54 = 0                                                                                           ⟨295363⟩
    v45 = 0                                                                                           ⟨295380⟩
    v44 = 0                                                                                           ⟨295381⟩
    voix_arrête(voix=voix1)                                                                           ⟨295385⟩
    v2854 = 0                                                                                         ⟨295402⟩
    v2849 = 0                                                                                         ⟨295403⟩
    v2848 = 0                                                                                         ⟨295404⟩
    canal_arrête(canal=canal2)                                                                        ⟨295407⟩
    sub_5C1C(&v780, 2)                                                                                ⟨295412⟩
    v33 = 0                                                                                           ⟨295435⟩
    v32 = 0                                                                                           ⟨295436⟩
    retour                                                                                            ⟨295471⟩

──── scène2 ────
scène2 = Scene_Create(cadence=9, palette=255, surface=&v396)                                          ⟨295480⟩
c5 = Layer(ressource=midgames 44, x=0, y=0)                                                           ⟨295487⟩
CRT_Rand()                                                                                            ⟨295491⟩
c6 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / 32768) + 158, y=128)            ⟨295502⟩
tête_image_de_base(tête=c6, image=19)                                                                 ⟨295507⟩
ajoute c5 à scène2                                                                                    ⟨295512⟩
ajoute c6 à scène2                                                                                    ⟨295517⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨295526⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨295535⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨295547⟩
si v10 != 0 :
    Scene_Tick(scène=scène2)                                                                          ⟨295556⟩
    charge(mid34voc 2)                                                                                ⟨295568⟩
    tête_voix(tête=c6, ressource=mid34voc 2, cadence=9)                                               ⟨295574⟩
    di = 0                                                                                            ⟨295576⟩
    tant que di < 3 :
        Scene_Tick(scène=scène2)                                                                      ⟨295582⟩
        di = di + 1                                                                                   ⟨295584⟩
    di = 0                                                                                            ⟨295589⟩
    tant que tête_parle(tête=c6) != 0 :
        si di == 5 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨295597⟩
        si di == 6 :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨295605⟩
        si di == 9 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨295613⟩
        di = di + 1                                                                                   ⟨295618⟩
        si di == 10 :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨295623⟩
        Scene_Tick(scène=scène2)                                                                      ⟨295636⟩
    si byte_4F55C != 0 :
        v262 = 0                                                                                      ⟨295667⟩
        v256 = 0                                                                                      ⟨295669⟩
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨295673⟩
        v240 = 0                                                                                      ⟨295699⟩
        v235 = 0                                                                                      ⟨295700⟩
        v234 = 0                                                                                      ⟨295701⟩
        v225 = 0                                                                                      ⟨295718⟩
        v224 = 0                                                                                      ⟨295719⟩
        v215 = 0                                                                                      ⟨295736⟩
        v214 = 0                                                                                      ⟨295737⟩
        v205 = 0                                                                                      ⟨295754⟩
        v204 = 0                                                                                      ⟨295755⟩
        v195 = 0                                                                                      ⟨295772⟩
        v194 = 0                                                                                      ⟨295773⟩
        v185 = 0                                                                                      ⟨295790⟩
        v184 = 0                                                                                      ⟨295791⟩
        v175 = 0                                                                                      ⟨295808⟩
        v174 = 0                                                                                      ⟨295809⟩
        v165 = 0                                                                                      ⟨295826⟩
        v164 = 0                                                                                      ⟨295827⟩
        v155 = 0                                                                                      ⟨295844⟩
        v154 = 0                                                                                      ⟨295845⟩
        v145 = 0                                                                                      ⟨295862⟩
        v144 = 0                                                                                      ⟨295863⟩
        v129 = 0                                                                                      ⟨295884⟩
        v128 = 0                                                                                      ⟨295885⟩
        v113 = 0                                                                                      ⟨295906⟩
        v112 = 0                                                                                      ⟨295907⟩
        v97 = 0                                                                                       ⟨295928⟩
        v96 = 0                                                                                       ⟨295929⟩
        v81 = 0                                                                                       ⟨295950⟩
        v80 = 0                                                                                       ⟨295951⟩
        v65 = 0                                                                                       ⟨295972⟩
        v64 = 0                                                                                       ⟨295973⟩
        v55 = 0                                                                                       ⟨295990⟩
        v54 = 0                                                                                       ⟨295991⟩
        v45 = 0                                                                                       ⟨296008⟩
        v44 = 0                                                                                       ⟨296009⟩
        voix_arrête(voix=voix1)                                                                       ⟨296013⟩
        v2854 = 0                                                                                     ⟨296030⟩
        v2849 = 0                                                                                     ⟨296031⟩
        v2848 = 0                                                                                     ⟨296032⟩
        canal_arrête(canal=canal2)                                                                    ⟨296035⟩
        sub_5C1C(&v780, 2)                                                                            ⟨296040⟩
        v33 = 0                                                                                       ⟨296063⟩
        v32 = 0                                                                                       ⟨296064⟩
        retour                                                                                        ⟨296099⟩
    charge(mid34voc 3)                                                                                ⟨296112⟩
    tête_voix(tête=c6, ressource=mid34voc 3, cadence=9)                                               ⟨296118⟩
    di = 0                                                                                            ⟨296120⟩
    tant que di < 14 :
        Scene_Tick(scène=scène2)                                                                      ⟨296126⟩
        di = di + 1                                                                                   ⟨296128⟩
    di = 0                                                                                            ⟨296133⟩
    tant que tête_parle(tête=c6) != 0 :
        si di == 5 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨296141⟩
        si di == 6 :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨296149⟩
        si di == 9 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨296157⟩
        di = di + 1                                                                                   ⟨296162⟩
        si di == 10 :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨296167⟩
        Scene_Tick(scène=scène2)                                                                      ⟨296180⟩
    di = 0                                                                                            ⟨296191⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨296197⟩
        di = di + 1                                                                                   ⟨296199⟩
    v262 = 0                                                                                          ⟨296237⟩
    v256 = 0                                                                                          ⟨296239⟩
sinon :
    v2908→0.méthode8(224)                                                                             ⟨296247⟩
    v4 = 86                                                                                           ⟨296249⟩
    si = scène2.compteur                                                                              ⟨296250⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨296259⟩
    tant que (scène2.compteur < v2) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨296263⟩
        si si + 3 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[2])                             ⟨296275⟩
        si si + 3 == scène2.compteur :
            tête_texte_de_lèvres(tête=c6, texte="lthoedptdthaclsinHwkJmstrnwsntavshusmn")             ⟨296285⟩
        si si + 15 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨296295⟩
        si si + 16 == scène2.compteur :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨296305⟩
        si si + 19 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨296315⟩
        si si + 20 == scène2.compteur :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨296325⟩
        si v2 - 1 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨296336⟩
        Scene_Tick(scène=scène2)                                                                      ⟨296354⟩
    si byte_4F55C != 0 :
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨296386⟩
        v240 = 0                                                                                      ⟨296412⟩
        v235 = 0                                                                                      ⟨296413⟩
        v234 = 0                                                                                      ⟨296414⟩
        v225 = 0                                                                                      ⟨296431⟩
        v224 = 0                                                                                      ⟨296432⟩
        v215 = 0                                                                                      ⟨296449⟩
        v214 = 0                                                                                      ⟨296450⟩
        v205 = 0                                                                                      ⟨296467⟩
        v204 = 0                                                                                      ⟨296468⟩
        v195 = 0                                                                                      ⟨296485⟩
        v194 = 0                                                                                      ⟨296486⟩
        v185 = 0                                                                                      ⟨296503⟩
        v184 = 0                                                                                      ⟨296504⟩
        v175 = 0                                                                                      ⟨296521⟩
        v174 = 0                                                                                      ⟨296522⟩
        v165 = 0                                                                                      ⟨296539⟩
        v164 = 0                                                                                      ⟨296540⟩
        v155 = 0                                                                                      ⟨296557⟩
        v154 = 0                                                                                      ⟨296558⟩
        v145 = 0                                                                                      ⟨296575⟩
        v144 = 0                                                                                      ⟨296576⟩
        v129 = 0                                                                                      ⟨296597⟩
        v128 = 0                                                                                      ⟨296598⟩
        v113 = 0                                                                                      ⟨296619⟩
        v112 = 0                                                                                      ⟨296620⟩
        v97 = 0                                                                                       ⟨296641⟩
        v96 = 0                                                                                       ⟨296642⟩
        v81 = 0                                                                                       ⟨296663⟩
        v80 = 0                                                                                       ⟨296664⟩
        v65 = 0                                                                                       ⟨296685⟩
        v64 = 0                                                                                       ⟨296686⟩
        v55 = 0                                                                                       ⟨296703⟩
        v54 = 0                                                                                       ⟨296704⟩
        v45 = 0                                                                                       ⟨296721⟩
        v44 = 0                                                                                       ⟨296722⟩
        voix_arrête(voix=voix1)                                                                       ⟨296726⟩
        v2854 = 0                                                                                     ⟨296743⟩
        v2849 = 0                                                                                     ⟨296744⟩
        v2848 = 0                                                                                     ⟨296745⟩
        canal_arrête(canal=canal2)                                                                    ⟨296748⟩
        sub_5C1C(&v780, 2)                                                                            ⟨296753⟩
        v33 = 0                                                                                       ⟨296776⟩
        v32 = 0                                                                                       ⟨296777⟩
        retour                                                                                        ⟨296812⟩
    v4 = 60                                                                                           ⟨296815⟩
    si = scène2.compteur                                                                              ⟨296816⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨296825⟩
    tant que (scène2.compteur < v2) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨296829⟩
        si si + 3 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[3])                             ⟨296842⟩
        si si + 3 == scène2.compteur :
            tête_texte_de_lèvres(tête=c6, texte="dspithadngrsocupshnechosfrimslf")                    ⟨296852⟩
        si si + 15 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨296862⟩
        si si + 16 == scène2.compteur :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨296872⟩
        si si + 19 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨296882⟩
        si si + 20 == scène2.compteur :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨296892⟩
        si v2 - 1 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨296903⟩
        Scene_Tick(scène=scène2)                                                                      ⟨296921⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨296948⟩
si byte_4F55C != 0 :
    v240 = 0                                                                                          ⟨296979⟩
    v235 = 0                                                                                          ⟨296980⟩
    v234 = 0                                                                                          ⟨296981⟩
    v225 = 0                                                                                          ⟨296998⟩
    v224 = 0                                                                                          ⟨296999⟩
    v215 = 0                                                                                          ⟨297016⟩
    v214 = 0                                                                                          ⟨297017⟩
    v205 = 0                                                                                          ⟨297034⟩
    v204 = 0                                                                                          ⟨297035⟩
    v195 = 0                                                                                          ⟨297052⟩
    v194 = 0                                                                                          ⟨297053⟩
    v185 = 0                                                                                          ⟨297070⟩
    v184 = 0                                                                                          ⟨297071⟩
    v175 = 0                                                                                          ⟨297088⟩
    v174 = 0                                                                                          ⟨297089⟩
    v165 = 0                                                                                          ⟨297106⟩
    v164 = 0                                                                                          ⟨297107⟩
    v155 = 0                                                                                          ⟨297124⟩
    v154 = 0                                                                                          ⟨297125⟩
    v145 = 0                                                                                          ⟨297142⟩
    v144 = 0                                                                                          ⟨297143⟩
    v129 = 0                                                                                          ⟨297164⟩
    v128 = 0                                                                                          ⟨297165⟩
    v113 = 0                                                                                          ⟨297186⟩
    v112 = 0                                                                                          ⟨297187⟩
    v97 = 0                                                                                           ⟨297208⟩
    v96 = 0                                                                                           ⟨297209⟩
    v81 = 0                                                                                           ⟨297230⟩
    v80 = 0                                                                                           ⟨297231⟩
    v65 = 0                                                                                           ⟨297252⟩
    v64 = 0                                                                                           ⟨297253⟩
    v55 = 0                                                                                           ⟨297270⟩
    v54 = 0                                                                                           ⟨297271⟩
    v45 = 0                                                                                           ⟨297288⟩
    v44 = 0                                                                                           ⟨297289⟩
    voix_arrête(voix=voix1)                                                                           ⟨297293⟩
    v2854 = 0                                                                                         ⟨297310⟩
    v2849 = 0                                                                                         ⟨297311⟩
    v2848 = 0                                                                                         ⟨297312⟩
    canal_arrête(canal=canal2)                                                                        ⟨297315⟩
    sub_5C1C(&v780, 2)                                                                                ⟨297320⟩
    v33 = 0                                                                                           ⟨297343⟩
    v32 = 0                                                                                           ⟨297344⟩
    retour                                                                                            ⟨297379⟩

──── scène3 ────
scène3 = Scene_Create(cadence=9, palette=255, surface=&v396)                                          ⟨297388⟩
c7 = Layer(ressource=midgames 42, x=0, y=-80)                                                         ⟨297395⟩
c8 = TalkingHead(ressource=convdata type 0 "lyle", x=164, y=128)                                      ⟨297403⟩
tête_image_de_base(tête=c8, image=31)                                                                 ⟨297408⟩
ajoute c7 à scène3                                                                                    ⟨297413⟩
ajoute c8 à scène3                                                                                    ⟨297418⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨297427⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨297436⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨297448⟩
si v10 != 0 :
    Scene_Tick(scène=scène3)                                                                          ⟨297457⟩
    v262 = 0                                                                                          ⟨297459⟩
    v256 = 0                                                                                          ⟨297462⟩
    charge(mid34voc 4)                                                                                ⟨297469⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 4)                                 ⟨297475⟩
    di = 0                                                                                            ⟨297477⟩
    tant que di < 4 :
        Scene_Tick(scène=scène3)                                                                      ⟨297483⟩
        di = di + 1                                                                                   ⟨297485⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨297493⟩
    di = 0                                                                                            ⟨297495⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨297503⟩
        si di == 8 :
            tête_image_de_base(tête=c8, image=21)                                                     ⟨297511⟩
        di = di + 1                                                                                   ⟨297516⟩
        si di == 17 :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨297521⟩
        Scene_Tick(scène=scène3)                                                                      ⟨297534⟩
    di = 0                                                                                            ⟨297546⟩
    tant que di < 8 :
        Scene_Tick(scène=scène3)                                                                      ⟨297552⟩
        di = di + 1                                                                                   ⟨297554⟩
    voix_arrête(voix=voix1)                                                                           ⟨297561⟩
    v262 = 0                                                                                          ⟨297578⟩
    v256 = 0                                                                                          ⟨297580⟩
sinon :
    v2908→0.méthode8(224)                                                                             ⟨297588⟩
    v4 = 91                                                                                           ⟨297590⟩
    si = scène3.compteur                                                                              ⟨297591⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨297600⟩
    tant que (scène3.compteur < v2) et (scène3.terminée == 0) :
        di = scène3.compteur                                                                          ⟨297604⟩
        si si + 3 == scène3.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[4])                             ⟨297616⟩
        si si + 17 == scène3.compteur :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨297626⟩
        si si + 18 == scène3.compteur :
            tête_image_de_base(tête=c8, image=21)                                                     ⟨297636⟩
        si si + 27 == scène3.compteur :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨297646⟩
        si v2 - 1 == scène3.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨297657⟩
        Scene_Tick(scène=scène3)                                                                      ⟨297675⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨297702⟩
si byte_4F55C != 0 :
    v240 = 0                                                                                          ⟨297733⟩
    v235 = 0                                                                                          ⟨297734⟩
    v234 = 0                                                                                          ⟨297735⟩
    v225 = 0                                                                                          ⟨297752⟩
    v224 = 0                                                                                          ⟨297753⟩
    v215 = 0                                                                                          ⟨297770⟩
    v214 = 0                                                                                          ⟨297771⟩
    v205 = 0                                                                                          ⟨297788⟩
    v204 = 0                                                                                          ⟨297789⟩
    v195 = 0                                                                                          ⟨297806⟩
    v194 = 0                                                                                          ⟨297807⟩
    v185 = 0                                                                                          ⟨297824⟩
    v184 = 0                                                                                          ⟨297825⟩
    v175 = 0                                                                                          ⟨297842⟩
    v174 = 0                                                                                          ⟨297843⟩
    v165 = 0                                                                                          ⟨297860⟩
    v164 = 0                                                                                          ⟨297861⟩
    v155 = 0                                                                                          ⟨297878⟩
    v154 = 0                                                                                          ⟨297879⟩
    v145 = 0                                                                                          ⟨297896⟩
    v144 = 0                                                                                          ⟨297897⟩
    v129 = 0                                                                                          ⟨297918⟩
    v128 = 0                                                                                          ⟨297919⟩
    v113 = 0                                                                                          ⟨297940⟩
    v112 = 0                                                                                          ⟨297941⟩
    v97 = 0                                                                                           ⟨297962⟩
    v96 = 0                                                                                           ⟨297963⟩
    v81 = 0                                                                                           ⟨297984⟩
    v80 = 0                                                                                           ⟨297985⟩
    v65 = 0                                                                                           ⟨298006⟩
    v64 = 0                                                                                           ⟨298007⟩
    v55 = 0                                                                                           ⟨298024⟩
    v54 = 0                                                                                           ⟨298025⟩
    v45 = 0                                                                                           ⟨298042⟩
    v44 = 0                                                                                           ⟨298043⟩
    voix_arrête(voix=voix1)                                                                           ⟨298047⟩
    v2854 = 0                                                                                         ⟨298064⟩
    v2849 = 0                                                                                         ⟨298065⟩
    v2848 = 0                                                                                         ⟨298066⟩
    canal_arrête(canal=canal2)                                                                        ⟨298069⟩
    sub_5C1C(&v780, 2)                                                                                ⟨298074⟩
    v33 = 0                                                                                           ⟨298097⟩
    v32 = 0                                                                                           ⟨298098⟩
    retour                                                                                            ⟨298133⟩

──── scène4 ────
scène4 = Scene_Create(cadence=9, palette=255, surface=&v396)                                          ⟨298142⟩
c9 = Layer(ressource=midgames 44, x=0, y=0)                                                           ⟨298149⟩
c10 = TalkingHead(ressource=convdata type 0 "miguel", x=255, y=128)                                   ⟨298157⟩
c11 = TalkingHead(ressource=convdata type 0 "gwen", x=95, y=128)                                      ⟨298165⟩
tête_image_de_base(tête=c10, image=19)                                                                ⟨298170⟩
tête_image_de_base(tête=c11, image=19)                                                                ⟨298174⟩
ajoute c9 à scène4                                                                                    ⟨298179⟩
ajoute c10 à scène4                                                                                   ⟨298184⟩
ajoute c11 à scène4                                                                                   ⟨298189⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨298198⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨298207⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨298219⟩
si v10 != 0 :
    Scene_Tick(scène=scène4)                                                                          ⟨298228⟩
    charge(mid34voc 5)                                                                                ⟨298240⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 5)                                 ⟨298246⟩
    di = 0                                                                                            ⟨298248⟩
    tant que di < 4 :
        Scene_Tick(scène=scène4)                                                                      ⟨298254⟩
        di = di + 1                                                                                   ⟨298256⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨298264⟩
    di = 0                                                                                            ⟨298266⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨298274⟩
        si di == 8 :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨298282⟩
        si di == 9 :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨298290⟩
        si di == 16 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨298298⟩
        si di == 18 :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨298306⟩
        si di == 2 :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨298314⟩
        si di == 3 :
            tête_image_de_base(tête=c11, image=21)                                                    ⟨298322⟩
        di = di + 1                                                                                   ⟨298327⟩
        si di == 22 :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨298332⟩
        Scene_Tick(scène=scène4)                                                                      ⟨298345⟩
    di = 0                                                                                            ⟨298358⟩
    tant que di < 8 :
        Scene_Tick(scène=scène4)                                                                      ⟨298364⟩
        di = di + 1                                                                                   ⟨298366⟩
    voix_arrête(voix=voix1)                                                                           ⟨298373⟩
    v264 = 0                                                                                          ⟨298390⟩
sinon :
    v2908→0.méthode8(224)                                                                             ⟨298400⟩
    v4 = 91                                                                                           ⟨298402⟩
    si = scène4.compteur                                                                              ⟨298403⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨298412⟩
    tant que (scène4.compteur < v2) et (scène4.terminée == 0) :
        di = scène4.compteur                                                                          ⟨298416⟩
        si si + 3 == scène4.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[5])                             ⟨298429⟩
        si si + 17 == scène4.compteur :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨298439⟩
        si si + 18 == scène4.compteur :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨298449⟩
        si si + 19 == scène4.compteur :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨298459⟩
        si si + 26 == scène4.compteur :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨298469⟩
        si si + 28 == scène4.compteur :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨298479⟩
        si si + 7 == scène4.compteur :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨298489⟩
        si si + 8 == scène4.compteur :
            tête_image_de_base(tête=c11, image=21)                                                    ⟨298499⟩
        si si + 32 == scène4.compteur :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨298509⟩
        si v2 - 1 == scène4.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨298520⟩
        Scene_Tick(scène=scène4)                                                                      ⟨298538⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨298565⟩
si byte_4F55C != 0 :
    v240 = 0                                                                                          ⟨298596⟩
    v235 = 0                                                                                          ⟨298597⟩
    v234 = 0                                                                                          ⟨298598⟩
    v225 = 0                                                                                          ⟨298615⟩
    v224 = 0                                                                                          ⟨298616⟩
    v215 = 0                                                                                          ⟨298633⟩
    v214 = 0                                                                                          ⟨298634⟩
    v205 = 0                                                                                          ⟨298651⟩
    v204 = 0                                                                                          ⟨298652⟩
    v195 = 0                                                                                          ⟨298669⟩
    v194 = 0                                                                                          ⟨298670⟩
    v185 = 0                                                                                          ⟨298687⟩
    v184 = 0                                                                                          ⟨298688⟩
    v175 = 0                                                                                          ⟨298705⟩
    v174 = 0                                                                                          ⟨298706⟩
    v165 = 0                                                                                          ⟨298723⟩
    v164 = 0                                                                                          ⟨298724⟩
    v155 = 0                                                                                          ⟨298741⟩
    v154 = 0                                                                                          ⟨298742⟩
    v145 = 0                                                                                          ⟨298759⟩
    v144 = 0                                                                                          ⟨298760⟩
    v129 = 0                                                                                          ⟨298781⟩
    v128 = 0                                                                                          ⟨298782⟩
    v113 = 0                                                                                          ⟨298803⟩
    v112 = 0                                                                                          ⟨298804⟩
    v97 = 0                                                                                           ⟨298825⟩
    v96 = 0                                                                                           ⟨298826⟩
    v81 = 0                                                                                           ⟨298847⟩
    v80 = 0                                                                                           ⟨298848⟩
    v65 = 0                                                                                           ⟨298869⟩
    v64 = 0                                                                                           ⟨298870⟩
    v55 = 0                                                                                           ⟨298887⟩
    v54 = 0                                                                                           ⟨298888⟩
    v45 = 0                                                                                           ⟨298905⟩
    v44 = 0                                                                                           ⟨298906⟩
    voix_arrête(voix=voix1)                                                                           ⟨298910⟩
    v2854 = 0                                                                                         ⟨298927⟩
    v2849 = 0                                                                                         ⟨298928⟩
    v2848 = 0                                                                                         ⟨298929⟩
    canal_arrête(canal=canal2)                                                                        ⟨298932⟩
    sub_5C1C(&v780, 2)                                                                                ⟨298937⟩
    v33 = 0                                                                                           ⟨298960⟩
    v32 = 0                                                                                           ⟨298961⟩
    retour                                                                                            ⟨298996⟩

──── scène5 ────
scène5 = Scene_Create(cadence=9, palette=255, surface=&v396)                                          ⟨299005⟩
c12 = Layer(ressource=midgames 42, x=0, y=-30)                                                        ⟨299012⟩
c13 = TalkingHead(ressource=convdata type 0 "tex", x=163, y=128)                                      ⟨299020⟩
tête_image_de_base(tête=c13, image=25)                                                                ⟨299025⟩
ajoute c12 à scène5                                                                                   ⟨299030⟩
ajoute c13 à scène5                                                                                   ⟨299035⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨299044⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨299053⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨299065⟩
si v10 != 0 :
    Scene_Tick(scène=scène5)                                                                          ⟨299074⟩
    charge(mid34voc 6)                                                                                ⟨299086⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 6)                                 ⟨299092⟩
    di = 0                                                                                            ⟨299094⟩
    tant que di < 4 :
        Scene_Tick(scène=scène5)                                                                      ⟨299100⟩
        di = di + 1                                                                                   ⟨299102⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨299110⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène5)                                                                      ⟨299124⟩
    di = 0                                                                                            ⟨299136⟩
    tant que di < 8 :
        Scene_Tick(scène=scène5)                                                                      ⟨299142⟩
        di = di + 1                                                                                   ⟨299144⟩
    voix_arrête(voix=voix1)                                                                           ⟨299151⟩
    v262 = 0                                                                                          ⟨299168⟩
    v256 = 0                                                                                          ⟨299170⟩
sinon :
    v2908→0.méthode8(224)                                                                             ⟨299178⟩
    v4 = 80                                                                                           ⟨299180⟩
    si = scène5.compteur                                                                              ⟨299181⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨299190⟩
    tant que (scène5.compteur < v2) et (scène5.terminée == 0) :
        di = scène5.compteur                                                                          ⟨299194⟩
        si si + 3 == scène5.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[6])                             ⟨299207⟩
        si v2 - 1 == scène5.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨299218⟩
        Scene_Tick(scène=scène5)                                                                      ⟨299236⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨299263⟩
si byte_4F55C != 0 :
    v240 = 0                                                                                          ⟨299294⟩
    v235 = 0                                                                                          ⟨299295⟩
    v234 = 0                                                                                          ⟨299296⟩
    v225 = 0                                                                                          ⟨299313⟩
    v224 = 0                                                                                          ⟨299314⟩
    v215 = 0                                                                                          ⟨299331⟩
    v214 = 0                                                                                          ⟨299332⟩
    v205 = 0                                                                                          ⟨299349⟩
    v204 = 0                                                                                          ⟨299350⟩
    v195 = 0                                                                                          ⟨299367⟩
    v194 = 0                                                                                          ⟨299368⟩
    v185 = 0                                                                                          ⟨299385⟩
    v184 = 0                                                                                          ⟨299386⟩
    v175 = 0                                                                                          ⟨299403⟩
    v174 = 0                                                                                          ⟨299404⟩
    v165 = 0                                                                                          ⟨299421⟩
    v164 = 0                                                                                          ⟨299422⟩
    v155 = 0                                                                                          ⟨299439⟩
    v154 = 0                                                                                          ⟨299440⟩
    v145 = 0                                                                                          ⟨299457⟩
    v144 = 0                                                                                          ⟨299458⟩
    v129 = 0                                                                                          ⟨299479⟩
    v128 = 0                                                                                          ⟨299480⟩
    v113 = 0                                                                                          ⟨299501⟩
    v112 = 0                                                                                          ⟨299502⟩
    v97 = 0                                                                                           ⟨299523⟩
    v96 = 0                                                                                           ⟨299524⟩
    v81 = 0                                                                                           ⟨299545⟩
    v80 = 0                                                                                           ⟨299546⟩
    v65 = 0                                                                                           ⟨299567⟩
    v64 = 0                                                                                           ⟨299568⟩
    v55 = 0                                                                                           ⟨299585⟩
    v54 = 0                                                                                           ⟨299586⟩
    v45 = 0                                                                                           ⟨299603⟩
    v44 = 0                                                                                           ⟨299604⟩
    voix_arrête(voix=voix1)                                                                           ⟨299608⟩
    v2854 = 0                                                                                         ⟨299625⟩
    v2849 = 0                                                                                         ⟨299626⟩
    v2848 = 0                                                                                         ⟨299627⟩
    canal_arrête(canal=canal2)                                                                        ⟨299630⟩
    sub_5C1C(&v780, 2)                                                                                ⟨299635⟩
    v33 = 0                                                                                           ⟨299658⟩
    v32 = 0                                                                                           ⟨299659⟩
    retour                                                                                            ⟨299694⟩
charge(midgames 32)                                                                                   ⟨299707⟩
charge(midgames 26)                                                                                   ⟨299719⟩

──── scène6 ────
scène6 = Scene_Create(cadence=6, palette=255, surface=&v396)                                          ⟨299727⟩
c14 = Layer(ressource=midgames 32, x=0, y=0)                                                          ⟨299734⟩
c15 = Layer(ressource=midgames 26, x=0, y=0)                                                          ⟨299742⟩
Widget_Method_DispatchC_37052(objet1, 0)                                                              ⟨299748⟩
Widget_Method_Dispatch8_37030(objet1, 253)                                                            ⟨299753⟩
ajoute c14 à scène6                                                                                   ⟨299758⟩
ajoute c15 à scène6                                                                                   ⟨299763⟩
palette_copie(destination=pal1, source=pal6(midgames 41))                                             ⟨299772⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨299784⟩
si v10 != 0 :
    Scene_Tick(scène=scène6)                                                                          ⟨299793⟩
    charge(mid34voc 7)                                                                                ⟨299805⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 7)                                 ⟨299811⟩
    di = 0                                                                                            ⟨299813⟩
    tant que di < 8 :
        Scene_Tick(scène=scène6)                                                                      ⟨299819⟩
        di = di + 1                                                                                   ⟨299821⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨299829⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène6)                                                                      ⟨299843⟩
    v292 = 0                                                                                          ⟨299855⟩
    v288 = 2                                                                                          ⟨299856⟩
    v287 = 0                                                                                          ⟨299857⟩
    v286 = 0                                                                                          ⟨299858⟩
    di = 0                                                                                            ⟨299859⟩
    tant que di < 8 :
        Scene_Tick(scène=scène6)                                                                      ⟨299865⟩
        di = di + 1                                                                                   ⟨299867⟩
    voix_arrête(voix=voix1)                                                                           ⟨299874⟩
    v292 = 0                                                                                          ⟨299891⟩
    v287 = 0                                                                                          ⟨299892⟩
    v286 = 0                                                                                          ⟨299893⟩
sinon :
    v4 = 40                                                                                           ⟨299915⟩
    si = scène6.compteur                                                                              ⟨299916⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨299925⟩
    tant que (scène6.compteur < v2) et (scène6.terminée == 0) :
        di = scène6.compteur                                                                          ⟨299929⟩
        si si + 3 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[7])                             ⟨299942⟩
        si v2 - 1 == scène6.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨299953⟩
        Scene_Tick(scène=scène6)                                                                      ⟨299971⟩
    si byte_4F55C != 0 :
        Scene_Destruct(scène=scène6, drapeaux=0)                                                      ⟨300003⟩
        v262 = 0                                                                                      ⟨300022⟩
        v252 = 0                                                                                      ⟨300040⟩
        v240 = 0                                                                                      ⟨300065⟩
        v235 = 0                                                                                      ⟨300066⟩
        v234 = 0                                                                                      ⟨300067⟩
        v225 = 0                                                                                      ⟨300084⟩
        v224 = 0                                                                                      ⟨300085⟩
        v215 = 0                                                                                      ⟨300102⟩
        v214 = 0                                                                                      ⟨300103⟩
        v205 = 0                                                                                      ⟨300120⟩
        v204 = 0                                                                                      ⟨300121⟩
        v195 = 0                                                                                      ⟨300138⟩
        v194 = 0                                                                                      ⟨300139⟩
        v185 = 0                                                                                      ⟨300156⟩
        v184 = 0                                                                                      ⟨300157⟩
        v175 = 0                                                                                      ⟨300174⟩
        v174 = 0                                                                                      ⟨300175⟩
        v165 = 0                                                                                      ⟨300192⟩
        v164 = 0                                                                                      ⟨300193⟩
        v155 = 0                                                                                      ⟨300210⟩
        v154 = 0                                                                                      ⟨300211⟩
        v145 = 0                                                                                      ⟨300228⟩
        v144 = 0                                                                                      ⟨300229⟩
        v129 = 0                                                                                      ⟨300250⟩
        v128 = 0                                                                                      ⟨300251⟩
        v113 = 0                                                                                      ⟨300272⟩
        v112 = 0                                                                                      ⟨300273⟩
        v97 = 0                                                                                       ⟨300294⟩
        v96 = 0                                                                                       ⟨300295⟩
        v81 = 0                                                                                       ⟨300316⟩
        v80 = 0                                                                                       ⟨300317⟩
        v65 = 0                                                                                       ⟨300338⟩
        v64 = 0                                                                                       ⟨300339⟩
        v55 = 0                                                                                       ⟨300356⟩
        v54 = 0                                                                                       ⟨300357⟩
        v45 = 0                                                                                       ⟨300374⟩
        v44 = 0                                                                                       ⟨300375⟩
        voix_arrête(voix=voix1)                                                                       ⟨300379⟩
        v2854 = 0                                                                                     ⟨300396⟩
        v2849 = 0                                                                                     ⟨300397⟩
        v2848 = 0                                                                                     ⟨300398⟩
        canal_arrête(canal=canal2)                                                                    ⟨300401⟩
        sub_5C1C(&v780, 2)                                                                            ⟨300406⟩
        v33 = 0                                                                                       ⟨300429⟩
        v32 = 0                                                                                       ⟨300430⟩
        retour                                                                                        ⟨300465⟩
    v4 = 82                                                                                           ⟨300468⟩
    si = scène6.compteur                                                                              ⟨300469⟩
    v2 = si + ((v4·70) / 100)                                                                         ⟨300478⟩
    tant que (scène6.compteur < v2) et (scène6.terminée == 0) :
        di = scène6.compteur                                                                          ⟨300482⟩
        si si + 1 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[8])                             ⟨300494⟩
        si v2 - 1 == scène6.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨300505⟩
        Scene_Tick(scène=scène6)                                                                      ⟨300523⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨300550⟩
v262 = 0                                                                                              ⟨300569⟩
v252 = 0                                                                                              ⟨300587⟩
si byte_4F55C != 0 :
    v240 = 0                                                                                          ⟨300617⟩
    v235 = 0                                                                                          ⟨300618⟩
    v234 = 0                                                                                          ⟨300619⟩
    v225 = 0                                                                                          ⟨300636⟩
    v224 = 0                                                                                          ⟨300637⟩
    v215 = 0                                                                                          ⟨300654⟩
    v214 = 0                                                                                          ⟨300655⟩
    v205 = 0                                                                                          ⟨300672⟩
    v204 = 0                                                                                          ⟨300673⟩
    v195 = 0                                                                                          ⟨300690⟩
    v194 = 0                                                                                          ⟨300691⟩
    v185 = 0                                                                                          ⟨300708⟩
    v184 = 0                                                                                          ⟨300709⟩
    v175 = 0                                                                                          ⟨300726⟩
    v174 = 0                                                                                          ⟨300727⟩
    v165 = 0                                                                                          ⟨300744⟩
    v164 = 0                                                                                          ⟨300745⟩
    v155 = 0                                                                                          ⟨300762⟩
    v154 = 0                                                                                          ⟨300763⟩
    v145 = 0                                                                                          ⟨300780⟩
    v144 = 0                                                                                          ⟨300781⟩
    v129 = 0                                                                                          ⟨300802⟩
    v128 = 0                                                                                          ⟨300803⟩
    v113 = 0                                                                                          ⟨300824⟩
    v112 = 0                                                                                          ⟨300825⟩
    v97 = 0                                                                                           ⟨300846⟩
    v96 = 0                                                                                           ⟨300847⟩
    v81 = 0                                                                                           ⟨300868⟩
    v80 = 0                                                                                           ⟨300869⟩
    v65 = 0                                                                                           ⟨300890⟩
    v64 = 0                                                                                           ⟨300891⟩
    v55 = 0                                                                                           ⟨300908⟩
    v54 = 0                                                                                           ⟨300909⟩
    v45 = 0                                                                                           ⟨300926⟩
    v44 = 0                                                                                           ⟨300927⟩
    voix_arrête(voix=voix1)                                                                           ⟨300931⟩
    v2854 = 0                                                                                         ⟨300948⟩
    v2849 = 0                                                                                         ⟨300949⟩
    v2848 = 0                                                                                         ⟨300950⟩
    canal_arrête(canal=canal2)                                                                        ⟨300953⟩
    sub_5C1C(&v780, 2)                                                                                ⟨300958⟩
    v33 = 0                                                                                           ⟨300981⟩
    v32 = 0                                                                                           ⟨300982⟩
    retour                                                                                            ⟨301017⟩

──── scène7 ────
scène7 = Scene_Create(cadence=15, palette=255, surface=&v396)                                         ⟨301026⟩
c16 = Layer(ressource=midgames 42, x=0, y=-80)                                                        ⟨301033⟩
c17 = Layer(ressource=midgames 33, x=0, y=0)                                                          ⟨301041⟩
c18 = Layer(ressource=midgames 34, x=0, y=0)                                                          ⟨301049⟩
c19 = Layer(ressource=midgames 35, x=0, y=0)                                                          ⟨301057⟩
c20 = Layer(ressource=midgames 29, x=0, y=-24)                                                        ⟨301065⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨301075⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨301084⟩
ajoute c16 à scène7                                                                                   ⟨301089⟩
ajoute c20 à scène7                                                                                   ⟨301094⟩
ajoute c17 à scène7                                                                                   ⟨301099⟩
ajoute c18 à scène7                                                                                   ⟨301104⟩
ajoute c19 à scène7                                                                                   ⟨301109⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨301121⟩
Widget_Method_DispatchC_37052(objet1, 0)                                                              ⟨301126⟩
Widget_Method_Dispatch8_37030(objet1, 233)                                                            ⟨301131⟩
v260 = 0                                                                                              ⟨301133⟩
v262 = 0                                                                                              ⟨301134⟩
v264 = 1                                                                                              ⟨301135⟩
v2 = 145                                                                                              ⟨301138⟩
v2972 = 436                                                                                           ⟨301143⟩
v2970 = word_4D392                                                                                    ⟨301145⟩
word_4D392 = &v2972                                                                                   ⟨301147⟩
si v11 != 0 :
    charge(asoundfx 76)                                                                               ⟨301164⟩
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨301169⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 76, x=0)                                        ⟨301176⟩
    v280 = word_4F00C                                                                                 ⟨301179⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v2974)                                        ⟨301186⟩
        sub_50F5(canal3.+0→4, v2974, v280, mid34voc 7.+0)                                             ⟨301193⟩
si v10 != 0 :
    Scene_Tick(scène=scène7)                                                                          ⟨301206⟩
    charge(mid34voc 8)                                                                                ⟨301214⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 8)                                 ⟨301220⟩
tant que (scène7.compteur < v2) et (scène7.terminée == 0) :
    di = scène7.compteur                                                                              ⟨301227⟩
    si scène7.compteur > 50 :
        si scène7.compteur < 140 :
            v294 = v264                                                                               ⟨301233⟩
            v264_avant = v264                                                                         ⟨301234⟩
            v264 = v264 + 1                                                                           ⟨301234⟩
            c20.image = v294                                                                          ⟨301237⟩
    si scène7.compteur == 110 :
        Scene_SetFps(scène=scène7, cadence=9)                                                         ⟨301245⟩
    si scène7.compteur == 140 :
        retire(parent=scène7, calque=c20)                                                             ⟨301254⟩
        c20.détruit(3)                                                                                ⟨301262⟩
    si mid34voc 0.+0 + 6 == scène7.compteur :
        si v10 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨301276⟩
    si mid34voc 0.+0 + 6 == scène7.compteur :
        si v10 == 0 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[9])                             ⟨301296⟩
    si mid34voc 0.+0 + 5 < scène7.compteur :
        si mid34voc 0.+0 + 10 > scène7.compteur :
            v296 = v260                                                                               ⟨301309⟩
            v260_avant = v260                                                                         ⟨301310⟩
            v260 = v260 + 1                                                                           ⟨301310⟩
            c18.image = v296                                                                          ⟨301313⟩
    si mid34voc 0.+0 + 13 < scène7.compteur :
        si mid34voc 0.+0 + 18 > scène7.compteur :
            v298 = v262                                                                               ⟨301325⟩
            v262_avant = v262                                                                         ⟨301326⟩
            v262 = v262 + 1                                                                           ⟨301326⟩
            c19.image = v298                                                                          ⟨301329⟩
    si midgames 26.+0 + 27 == scène7.compteur :
        si v10 == 0 :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[10])                            ⟨301348⟩
    si midgames 26.+0 + 25 < scène7.compteur :
        si midgames 26.+0 + 30 > scène7.compteur :
            v260 = v260 - 1                                                                           ⟨301360⟩
            v300 = v260                                                                               ⟨301362⟩
            c18.image = v300                                                                          ⟨301365⟩
    si midgames 26.+0 + 32 < scène7.compteur :
        si midgames 26.+0 + 41 > scène7.compteur :
            si scène7.compteur & 1 != 0 :
                v262 = v262 - 1                                                                       ⟨301378⟩
                v302 = v262                                                                           ⟨301380⟩
                c19.image = v302                                                                      ⟨301383⟩
    si midgames 26.+0 + 60 == scène7.compteur :
        si v10 == 0 :
            sub_30AD0(objet1, 0)                                                                      ⟨301397⟩
    Scene_Tick(scène=scène7)                                                                          ⟨301421⟩
si v10 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨301449⟩
fondu_disparition(palette=pal1, couleur=&v28, pas=2, premier=0, nombre=256)                           ⟨301460⟩
v287 = 0                                                                                              ⟨301478⟩
v286 = 0                                                                                              ⟨301479⟩
canal_arrête(canal=canal3)                                                                            ⟨301482⟩
sub_5C1C(&v2972, 2)                                                                                   ⟨301487⟩
Scene_Destruct(scène=scène7, drapeaux=0)                                                              ⟨301510⟩
v240 = 0                                                                                              ⟨301536⟩
v235 = 0                                                                                              ⟨301537⟩
v234 = 0                                                                                              ⟨301538⟩
v225 = 0                                                                                              ⟨301555⟩
v224 = 0                                                                                              ⟨301556⟩
v215 = 0                                                                                              ⟨301573⟩
v214 = 0                                                                                              ⟨301574⟩
v205 = 0                                                                                              ⟨301591⟩
v204 = 0                                                                                              ⟨301592⟩
v195 = 0                                                                                              ⟨301609⟩
v194 = 0                                                                                              ⟨301610⟩
v185 = 0                                                                                              ⟨301627⟩
v184 = 0                                                                                              ⟨301628⟩
v175 = 0                                                                                              ⟨301645⟩
v174 = 0                                                                                              ⟨301646⟩
v165 = 0                                                                                              ⟨301663⟩
v164 = 0                                                                                              ⟨301664⟩
v155 = 0                                                                                              ⟨301681⟩
v154 = 0                                                                                              ⟨301682⟩
v145 = 0                                                                                              ⟨301699⟩
v144 = 0                                                                                              ⟨301700⟩
v129 = 0                                                                                              ⟨301721⟩
v128 = 0                                                                                              ⟨301722⟩
v113 = 0                                                                                              ⟨301743⟩
v112 = 0                                                                                              ⟨301744⟩
v97 = 0                                                                                               ⟨301765⟩
v96 = 0                                                                                               ⟨301766⟩
v81 = 0                                                                                               ⟨301787⟩
v80 = 0                                                                                               ⟨301788⟩
v65 = 0                                                                                               ⟨301809⟩
v64 = 0                                                                                               ⟨301810⟩
v55 = 0                                                                                               ⟨301827⟩
v54 = 0                                                                                               ⟨301828⟩
v45 = 0                                                                                               ⟨301845⟩
v44 = 0                                                                                               ⟨301846⟩
voix_arrête(voix=voix1)                                                                               ⟨301850⟩
v2854 = 0                                                                                             ⟨301867⟩
v2849 = 0                                                                                             ⟨301868⟩
v2848 = 0                                                                                             ⟨301869⟩
canal_arrête(canal=canal2)                                                                            ⟨301872⟩
sub_5C1C(&v780, 2)                                                                                    ⟨301877⟩
v33 = 0                                                                                               ⟨301900⟩
v32 = 0                                                                                               ⟨301901⟩
retour                                                                                                ⟨301936⟩
```

## Tableaux du segment de données

