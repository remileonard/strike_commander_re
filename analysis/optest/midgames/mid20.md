# Script extrait de `sub_9E080` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## sub_9E080

```
bp = sp                                                                                               ⟨293751⟩
tableau_textes(tableau=textes1, nombre=9, longueur=200)                                               ⟨293760⟩
v11 = 0                                                                                               ⟨293762⟩
v12 = 0                                                                                               ⟨293763⟩
v13 = 0                                                                                               ⟨293764⟩
si word_4684B != 0 :
    v12 = 1                                                                                           ⟨293767⟩
v16 = word_46F46                                                                                      ⟨293771⟩
v532 = 0                                                                                              ⟨293772⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v532, v16)                                                      ⟨293777⟩
v546 = 0                                                                                              ⟨293779⟩
TextRenderer_ApplyFormatChange_2EA21(&v546, 0)                                                        ⟨293788⟩
SmallObject_RegisterInList_2CB40(&v20, &v546)                                                         ⟨293794⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨293800⟩
v30 = 0                                                                                               ⟨293802⟩
v40 = 0                                                                                               ⟨293809⟩
v36 = 2                                                                                               ⟨293810⟩
v35 = 0                                                                                               ⟨293811⟩
v34 = 0                                                                                               ⟨293812⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨293826⟩
v42 = ?                                                                                               ⟨293828⟩
v44 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                 ⟨293829⟩
v40 = v44                                                                                             ⟨293831⟩
v36 = 2                                                                                               ⟨293832⟩
v35 = 1                                                                                               ⟨293833⟩
v34 = 0                                                                                               ⟨293834⟩
GlyphObject_ConstructWithBuffer_311CF(&v570, &v40)                                                    ⟨293839⟩
v54 = word_46F46                                                                                      ⟨293846⟩
zone_texte(zone=zone1, police=&v570)                                                                  ⟨293852⟩
v56 = 152                                                                                             ⟨293856⟩
v58 = 319                                                                                             ⟨293858⟩
v60 = 199                                                                                             ⟨293860⟩
v577 = v56                                                                                            ⟨293864⟩
v575 = v58                                                                                            ⟨293866⟩
v573 = v60                                                                                            ⟨293868⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨293872⟩
charge(midgames 19)                                                                                   ⟨293952⟩
charge(midgames 20)                                                                                   ⟨293964⟩
charge(midgames 21)                                                                                   ⟨293976⟩
charge(optshps 116)                                                                                   ⟨293992⟩
charge(optshps 44)                                                                                    ⟨294000⟩
charge(midgames 6)                                                                                    ⟨294012⟩
palette_depuis(pal2(midgames 6))                                                                      ⟨294019⟩
v138 = 0                                                                                              ⟨294023⟩
v144 = 0                                                                                              ⟨294025⟩
v150 = 0                                                                                              ⟨294027⟩
charge(optpals 21)                                                                                    ⟨294039⟩
palette_depuis(pal3(optpals 21))                                                                      ⟨294045⟩
charge(optpals 24)                                                                                    ⟨294057⟩
palette_depuis(pal4(optpals 24))                                                                      ⟨294063⟩
charge(midgames 22)                                                                                   ⟨294075⟩
palette_depuis(pal5(midgames 22))                                                                     ⟨294081⟩
charge_convdata_type2("normal")                                                                       ⟨294091⟩
palette_depuis(pal6(convdata type 2 "normal"))                                                        ⟨294097⟩
si v12 != 0 :
    si sub_6734(chemin1) == 0 : aller à loc_9E696                                                     ⟨294197⟩
    pak mid20voc.ouvre(chemin1, 1)                                                                    ⟨294204⟩
sinon :
    v12 = 0                                                                                           ⟨294211⟩
v160 = 0                                                                                              ⟨294214⟩
v155 = 0                                                                                              ⟨294216⟩
v154 = 0                                                                                              ⟨294217⟩
v162 = byte_46848                                                                                     ⟨294219⟩
si v162 != 1 :
    si v162 == 2 : aller à loc_9E84C                                                                  ⟨294229⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨294265⟩
        flux_iff(flux=flux1)                                                                          ⟨294279⟩
        v3495 = 256                                                                                   ⟨294282⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨294291⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨294297⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨294303⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨294307⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨294309⟩
        si = 1                                                                                        ⟨294310⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨294317⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨294321⟩
            si = si + 1                                                                               ⟨294322⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨294329⟩
        v13 = 1                                                                                       ⟨294331⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨294335⟩
    si sub_6734(chemin1) != 0 :
        v11 = 1                                                                                       ⟨294361⟩
        si v13 == 0 :
            word_48F76 = 90                                                                           ⟨294366⟩
    aller à loc_9E9B7                                                                                 ⟨294370⟩
    loc_9E84C:                                                                                        ⟨294373⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨294401⟩
        flux_iff(flux=flux1)                                                                          ⟨294415⟩
        v3495 = 256                                                                                   ⟨294418⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨294427⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨294433⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨294439⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨294443⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨294445⟩
        si = 1                                                                                        ⟨294446⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨294453⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨294457⟩
            si = si + 1                                                                               ⟨294458⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨294465⟩
        v13 = 1                                                                                       ⟨294467⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨294471⟩
    si sub_6734(chemin1) != 0 :
        v11 = 1                                                                                       ⟨294497⟩
        si v13 == 0 :
            word_48F76 = 255                                                                          ⟨294502⟩
loc_9E9B7:                                                                                            ⟨294508⟩
si v13 != 0 :
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨294527⟩
    si = 0                                                                                            ⟨294529⟩
    tant que si < 4 :
        charge(asoundfx v166[si])                                                                     ⟨294546⟩
        canal_enregistre(canal=canal1, ressource=asoundfx v166[si], x=0)                              ⟨294553⟩
        canal_arrête(canal=canal1)                                                                    ⟨294557⟩
        si = si + 1                                                                                   ⟨294578⟩
    canal_arrête(canal=canal1)                                                                        ⟨294589⟩
v1334 = 0                                                                                             ⟨294612⟩
v1329 = 0                                                                                             ⟨294614⟩
v1328 = 0                                                                                             ⟨294615⟩
v1338 = 0                                                                                             ⟨294616⟩
si v11 != 0 :
    si v12 != 0 :
        v311 = 16                                                                                     ⟨294629⟩
    sinon :
        v311 = 15                                                                                     ⟨294634⟩
    charge(amusic v311)                                                                               ⟨294645⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨294650⟩
    canal_enregistre(canal=canal2, ressource=amusic v311, x=0)                                        ⟨294657⟩
v1347 = booléen                                                                                       ⟨294674⟩
v1343 = booléen                                                                                       ⟨294675⟩
si v12 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨294681⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨294699⟩
    v3495 = 256                                                                                       ⟨294702⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨294711⟩
    iff_form(flux=flux1, balise='MG20', x=0)                                                          ⟨294717⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨294723⟩
    si = 0                                                                                            ⟨294725⟩
    tant que si < 9 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨294734⟩
        di = 2                                                                                        ⟨294736⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·si), taille=2)                       ⟨294747⟩
        v3491 = v3474                                                                                 ⟨294750⟩
        si = si + 1                                                                                   ⟨294751⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨294758⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[0], arg_6)                                                                 ⟨294767⟩
        CRT_Strcat(textes1[0], textes1[2])                                                            ⟨294775⟩
    sinon :
        si CRT_Strlen(arg_10) != 0 :
            CRT_Strcat(textes1[0], arg_10)                                                            ⟨294788⟩
            CRT_Strcat(textes1[0], textes1[2])                                                        ⟨294796⟩
        sinon :
            si CRT_Strlen(arg_8) != 0 :
                CRT_Strcat(textes1[0], arg_8)                                                         ⟨294809⟩
                CRT_Strcat(textes1[0], textes1[2])                                                    ⟨294817⟩
            sinon :
                CRT_Strcat(textes1[0], textes1[1])                                                    ⟨294827⟩
                CRT_Strcat(textes1[0], textes1[2])                                                    ⟨294835⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨294843⟩
si byte_495FC != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨294861⟩
    canal_arrête(canal=canal2)                                                                        ⟨294884⟩
    v40 = 0                                                                                           ⟨295118⟩
    v35 = 0                                                                                           ⟨295119⟩
    v34 = 0                                                                                           ⟨295120⟩
    retour                                                                                            ⟨295147⟩
si v11 != 0 :
    v168 = word_48F76                                                                                 ⟨295154⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v1336)                                        ⟨295161⟩
        sub_30C66(canal2.+0→4, v1336, v168, 0)                                                        ⟨295168⟩
vide_entrées()                                                                                        ⟨295178⟩
charge(mid20 7)                                                                                       ⟨295189⟩
charge(mid20 6)                                                                                       ⟨295201⟩
charge(mid20 16)                                                                                      ⟨295213⟩
palette_depuis(pal7(mid20 16))                                                                        ⟨295220⟩
charge(mid20 10)                                                                                      ⟨295232⟩
charge(mid20 11)                                                                                      ⟨295244⟩
charge(mid20 12)                                                                                      ⟨295256⟩
c1 = Layer(ressource=mid20 10, x=0, y=-2)                                                             ⟨295263⟩
di = c1                                                                                               ⟨295265⟩
c2 = Layer(ressource=mid20 11, x=0, y=-2)                                                             ⟨295271⟩
c3 = Layer(ressource=mid20 12, x=0, y=-2)                                                             ⟨295279⟩

──── scène1 ────
scène1 = Scene_Create(cadence=12, palette=255, surface=&v532)                                         ⟨295288⟩
palette_copie(destination=pal1, source=pal3(optpals 21))                                              ⟨295297⟩
palette_copie(destination=pal1, source=pal5(midgames 22))                                             ⟨295306⟩
palette_copie(destination=pal1, source=pal7(mid20 16))                                                ⟨295315⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨295323⟩
c4 = Layer(ressource=optshps 116, x=0, y=0)                                                           ⟨295330⟩
c5 = Layer(ressource=midgames 20, x=0, y=5)                                                           ⟨295338⟩
ajoute c4 à scène1                                                                                    ⟨295344⟩
ajoute c5 à scène1                                                                                    ⟨295349⟩
v394 = 0                                                                                              ⟨295351⟩
v390 = 2                                                                                              ⟨295352⟩
v389 = 0                                                                                              ⟨295353⟩
v388 = 0                                                                                              ⟨295354⟩
v3468 = 0                                                                                             ⟨295355⟩
v3464 = 2                                                                                             ⟨295356⟩
v3463 = 0                                                                                             ⟨295357⟩
v3462 = 0                                                                                             ⟨295358⟩
v3472 = 0                                                                                             ⟨295359⟩
v3470 = -1                                                                                            ⟨295360⟩
v404 = 0                                                                                              ⟨295361⟩
v399 = 0                                                                                              ⟨295363⟩
v398 = 0                                                                                              ⟨295364⟩
v3477 = 0                                                                                             ⟨295367⟩
v3476 = 0                                                                                             ⟨295368⟩
v3484 = -1                                                                                            ⟨295370⟩
si v13 != 0 :
    charge(asoundfx 42)                                                                               ⟨295383⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨295388⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 42, x=0)                                        ⟨295395⟩
    v406 = word_48EF6                                                                                 ⟨295398⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3470)                                        ⟨295405⟩
        sub_30C66(canal3.+0→4, v3470, v406, 0)                                                        ⟨295412⟩
    charge(asoundfx 58)                                                                               ⟨295423⟩
    canal_init(canal=canal4, pilote=word_46849)                                                       ⟨295428⟩
    canal_enregistre(canal=canal4, ressource=asoundfx 58, x=0)                                        ⟨295435⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal4)                                                                        ⟨295447⟩
    canal_arrête(canal=canal3)                                                                        ⟨295489⟩
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨295532⟩
    voix_arrête(voix=voix1)                                                                           ⟨295656⟩
    canal_arrête(canal=canal2)                                                                        ⟨295679⟩
    v40 = 0                                                                                           ⟨295913⟩
    v35 = 0                                                                                           ⟨295914⟩
    v34 = 0                                                                                           ⟨295915⟩
    retour                                                                                            ⟨295942⟩
vide_entrées()                                                                                        ⟨295946⟩
scène1.terminée = 0                                                                                   ⟨295947⟩
vide_entrées()                                                                                        ⟨295948⟩
c6 = Layer(ressource=mid20 7, x=1, y=-2)                                                              ⟨295954⟩
c7 = Layer(ressource=mid20 6, x=0, y=0)                                                               ⟨295962⟩
ajoute c1 à scène1                                                                                    ⟨295968⟩
ajoute c6 à scène1                                                                                    ⟨295973⟩
c8 = MovingLayer(ressource=midgames 19, x=0, y=173, image=1)                                          ⟨295987⟩
c8.vx = 0                                                                                             ⟨295994⟩
c8.vy = 0                                                                                             ⟨295996⟩
c8.vx = 0                                                                                             ⟨295998⟩
c8.vy = -2                                                                                            ⟨296000⟩
ajoute c8 à scène1                                                                                    ⟨296013⟩
c9 = MovingLayer(ressource=midgames 19, x=0, y=250, image=2)                                          ⟨296027⟩
c9.vx = 0                                                                                             ⟨296034⟩
c9.vy = 0                                                                                             ⟨296036⟩
c9.vx = 0                                                                                             ⟨296038⟩
c9.vy = -4                                                                                            ⟨296040⟩
ajoute c9 à scène1                                                                                    ⟨296053⟩
v422 = 0                                                                                              ⟨296055⟩
v424 = 0                                                                                              ⟨296056⟩
tant que (scène1.compteur < 98) et (scène1.terminée == 0) :
    si = scène1.compteur                                                                              ⟨296061⟩
    si scène1.compteur == 30 :
        ajoute c7 à scène1                                                                            ⟨296067⟩
    si scène1.compteur < 43 :
        v426 = scène1.compteur                                                                        ⟨296073⟩
        c6.image = v426                                                                               ⟨296076⟩
    si scène1.compteur > 10 :
        si scène1.compteur < 50 :
            si scène1.compteur & 1 != 0 :
                c4.méthode24(0, -1)                                                                   ⟨296090⟩
    si scène1.compteur < 50 :
        si scène1.compteur & 1 != 0 :
            c5.méthode24(0, -1)                                                                       ⟨296104⟩
    si scène1.compteur == 54 :
        retire(parent=scène1, calque=c1)                                                              ⟨296118⟩
        c1.détruit(3)                                                                                 ⟨296125⟩
        retire(parent=scène1, calque=c8)                                                              ⟨296133⟩
        retire(parent=scène1, calque=c9)                                                              ⟨296138⟩
        ajoute c2 à scène1                                                                            ⟨296143⟩
        ajoute c3 à scène1                                                                            ⟨296148⟩
        ajoute c8 à scène1                                                                            ⟨296153⟩
        ajoute c9 à scène1                                                                            ⟨296158⟩
    si scène1.compteur > 16 :
        si scène1.compteur < 54 :
            v428 = v424                                                                               ⟨296167⟩
            v424 = v424 + 1                                                                           ⟨296168⟩
            c1.image = v428                                                                           ⟨296170⟩
    si scène1.compteur > 54 :
        si v422 > 4 :
            v422 = 0                                                                                  ⟨296178⟩
            c2.méthode24(-1, 0)                                                                       ⟨296184⟩
            c3.méthode24(1, 0)                                                                        ⟨296191⟩
        v430 = v422                                                                                   ⟨296196⟩
        c2.image = v430                                                                               ⟨296199⟩
        v432 = v422                                                                                   ⟨296201⟩
        v422 = v422 + 1                                                                               ⟨296202⟩
        c3.image = v432                                                                               ⟨296205⟩
    si scène1.compteur > 41 :
        si scène1.compteur < 99 :
            v434 = scène1.compteur - 42                                                               ⟨296214⟩
            c7.image = v434                                                                           ⟨296217⟩
    si scène1.compteur == 49 :
        si v13 != 0 :
            v436 = word_48F16                                                                         ⟨296226⟩
            si canal4.+0 != 0 :
                AIL_start_sequence(pilote=canal4.+0→4, séquence=v3484)                                ⟨296233⟩
                sub_30C66(canal4.+0→4, v3484, v436, 0)                                                ⟨296240⟩
    si scène1.compteur == 50 :
        c8.vx = 0                                                                                     ⟨296249⟩
        c8.vy = 0                                                                                     ⟨296251⟩
        c9.vx = 0                                                                                     ⟨296253⟩
        c9.vy = 0                                                                                     ⟨296255⟩
    Scene_Tick(scène=scène1)                                                                          ⟨296270⟩
canal_arrête(canal=canal4)                                                                            ⟨296302⟩
canal_arrête(canal=canal3)                                                                            ⟨296344⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨296387⟩
vide_entrées()                                                                                        ⟨296508⟩
si byte_495FC != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨296518⟩
    canal_arrête(canal=canal2)                                                                        ⟨296541⟩
    v40 = 0                                                                                           ⟨296775⟩
    v35 = 0                                                                                           ⟨296776⟩
    v34 = 0                                                                                           ⟨296777⟩
    retour                                                                                            ⟨296804⟩
charge(midgames 4)                                                                                    ⟨296818⟩

──── scène2 ────
scène2 = Scene_Create(cadence=9, palette=255, surface=&v532)                                          ⟨296826⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨296836⟩
palette_copie(destination=pal1, source=pal3(optpals 21))                                              ⟨296845⟩
palette_copie(destination=pal1, source=pal2(midgames 6))                                              ⟨296854⟩
palette_copie(destination=pal1, source=pal6(convdata type 2 "normal"))                                ⟨296863⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨296871⟩
c10 = Layer(ressource=optshps 116, x=0, y=-63)                                                        ⟨296878⟩
ajoute c10 à scène2                                                                                   ⟨296884⟩
c11 = Layer(ressource=midgames 4, x=0, y=0)                                                           ⟨296891⟩
ajoute c11 à scène2                                                                                   ⟨296897⟩
c12 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)                               ⟨296904⟩
di = c12                                                                                              ⟨296906⟩
ajoute c12 à scène2                                                                                   ⟨296910⟩
tête_image_de_base(tête=c12, image=27)                                                                ⟨296914⟩
charge(midgames 0)                                                                                    ⟨296926⟩
c13 = ToggleLayer(ressource=midgames 0, x=160, y=129, sens=1)                                         ⟨296934⟩
ajoute c13 à scène2                                                                                   ⟨296940⟩
v3470 = -1                                                                                            ⟨296951⟩
si v13 != 0 :
    charge(asoundfx 5)                                                                                ⟨296964⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨296969⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 5, x=0)                                         ⟨296976⟩
    v348 = word_48EAC                                                                                 ⟨296979⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3470)                                        ⟨296986⟩
        sub_30C66(canal3.+0→4, v3470, v348, convdata type 2 "normal".+0)                              ⟨296993⟩
si = 0                                                                                                ⟨296999⟩
v352 = 1                                                                                              ⟨297000⟩
tant que (scène2.compteur < 25) et (scène2.terminée == 0) :
    si si == 0 :
        CRT_Rand()                                                                                    ⟨297007⟩
        si (CRT_Rand()·7) / -32768 != 0 : aller à loc_A07DE                                           ⟨297014⟩
        si = -1                                                                                       ⟨297015⟩
    sinon :
        si si == -1 :
            si = 1                                                                                    ⟨297023⟩
        sinon :
            si si == 1 :
                si = 0                                                                                ⟨297030⟩
    c11.méthode24(0, si)                                                                              ⟨297039⟩
    c12.méthode24(0, si)                                                                              ⟨297045⟩
    c13.méthode24(0, si)                                                                              ⟨297052⟩
    v352 = v352 + si                                                                                  ⟨297054⟩
    Scene_Tick(scène=scène2)                                                                          ⟨297067⟩
canal_arrête(canal=canal3)                                                                            ⟨297095⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨297176⟩
si byte_495FC != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨297206⟩
    canal_arrête(canal=canal2)                                                                        ⟨297229⟩
    v40 = 0                                                                                           ⟨297463⟩
    v35 = 0                                                                                           ⟨297464⟩
    v34 = 0                                                                                           ⟨297465⟩
    retour                                                                                            ⟨297492⟩

──── scène3 ────
scène3 = Scene_Create(cadence=15, palette=255, surface=&v532)                                         ⟨297502⟩
charge(mid20 1)                                                                                       ⟨297514⟩
charge(mid20 5)                                                                                       ⟨297526⟩
charge(mid20 14)                                                                                      ⟨297538⟩
palette_depuis(pal8(mid20 14))                                                                        ⟨297545⟩
palette_copie(destination=pal1, source=pal5(midgames 22))                                             ⟨297554⟩
palette_copie(destination=pal1, source=pal4(optpals 24))                                              ⟨297563⟩
palette_copie(destination=pal1, source=pal8(mid20 14))                                                ⟨297572⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨297584⟩
c14 = Layer(ressource=optshps 116, x=0, y=-48)                                                        ⟨297591⟩
c15 = Layer(ressource=midgames 20, x=0, y=0)                                                          ⟨297599⟩
ajoute c15 à c14                                                                                      ⟨297604⟩
ajoute c14 à scène3                                                                                   ⟨297609⟩
c16 = Layer(ressource=optshps 44, x=0, y=0)                                                           ⟨297616⟩
ajoute c16 à scène3                                                                                   ⟨297622⟩
c17 = ImageLayer(ressource=midgames 19, x=0, y=90, image=1)                                           ⟨297630⟩
ajoute c17 à scène3                                                                                   ⟨297636⟩
c18 = ImageLayer(ressource=midgames 19, x=0, y=50, image=2)                                           ⟨297644⟩
ajoute c18 à scène3                                                                                   ⟨297650⟩
c19 = Layer(ressource=mid20 5, x=0, y=0)                                                              ⟨297657⟩
ajoute c19 à scène3                                                                                   ⟨297663⟩
c20 = OverlayImageLayer(ressource=mid20 1, x=0, y=0, image=0)                                         ⟨297671⟩
di = c20                                                                                              ⟨297673⟩
ajoute c20 à scène3                                                                                   ⟨297677⟩
c20.image = 1                                                                                         ⟨297679⟩
si = 0                                                                                                ⟨297680⟩
tant que (scène3.compteur < 16) et (scène3.terminée == 0) :
    CRT_Rand()                                                                                        ⟨297685⟩
    v360 = ((CRT_Rand()·3) / -32768) + 1                                                              ⟨297692⟩
    c20.image = v360                                                                                  ⟨297694⟩
    v362 = si                                                                                         ⟨297695⟩
    si = si + 1                                                                                       ⟨297696⟩
    c19.image = v362                                                                                  ⟨297699⟩
    si si + 1 > 5 :
        si = 0                                                                                        ⟨297702⟩
    Scene_Tick(scène=scène3)                                                                          ⟨297717⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨297805⟩
si byte_495FC != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨297835⟩
    canal_arrête(canal=canal2)                                                                        ⟨297858⟩
    v40 = 0                                                                                           ⟨298092⟩
    v35 = 0                                                                                           ⟨298093⟩
    v34 = 0                                                                                           ⟨298094⟩
    retour                                                                                            ⟨298121⟩
charge(midgames 23)                                                                                   ⟨298135⟩
palette_depuis(pal9(midgames 23))                                                                     ⟨298142⟩
charge(mid20 17)                                                                                      ⟨298154⟩
palette_depuis(pal10(mid20 17))                                                                       ⟨298161⟩
charge(mid20 13)                                                                                      ⟨298173⟩
palette_depuis(pal11(mid20 13))                                                                       ⟨298180⟩
charge(midgames 24)                                                                                   ⟨298192⟩
charge(mid20 0)                                                                                       ⟨298204⟩
charge(mid20 8)                                                                                       ⟨298216⟩

──── scène4 ────
scène4 = Scene_Create(cadence=9, palette=255, surface=&v532)                                          ⟨298228⟩
c21 = Layer(ressource=optshps 116, x=0, y=-25)                                                        ⟨298235⟩
c22 = Layer(ressource=midgames 20, x=0, y=1)                                                          ⟨298243⟩
ajoute c22 à c21                                                                                      ⟨298248⟩
ajoute c21 à scène4                                                                                   ⟨298253⟩
c23 = Layer(ressource=midgames 24, x=0, y=-20)                                                        ⟨298260⟩
ajoute c23 à scène4                                                                                   ⟨298266⟩
c24 = ImageLayer(ressource=mid20 0, x=0, y=5, image=3)                                                ⟨298274⟩
ajoute c24 à scène4                                                                                   ⟨298280⟩
c25 = Layer(ressource=mid20 8, x=0, y=-8)                                                             ⟨298287⟩
ajoute c25 à scène4                                                                                   ⟨298293⟩
palette_copie(destination=pal1, source=pal9(midgames 23))                                             ⟨298302⟩
palette_copie(destination=pal1, source=pal11(mid20 13))                                               ⟨298311⟩
palette_copie(destination=pal1, source=pal10(mid20 17))                                               ⟨298320⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨298332⟩
v332 = 3                                                                                              ⟨298334⟩
di = -1                                                                                               ⟨298335⟩
tant que (scène4.compteur < 40) et (scène4.terminée == 0) :
    si = scène4.compteur                                                                              ⟨298341⟩
    si scène4.compteur == 1 :
        v336 = midgames 0.+0                                                                          ⟨298345⟩
        c25.image = v336                                                                              ⟨298349⟩
    si scène4.compteur > 10 :
        si scène4.compteur & 1 != 0 :
            v338 = midgames 0.+0                                                                      ⟨298357⟩
            c25.image = v338                                                                          ⟨298361⟩
    v332 = v332 + di                                                                                  ⟨298365⟩
    c24.image = v332                                                                                  ⟨298375⟩
    si scène4.compteur == 2 :
        di = 1                                                                                        ⟨298378⟩
    si scène4.compteur == 3 :
        di = -1                                                                                       ⟨298383⟩
    si scène4.compteur == 4 :
        di = 1                                                                                        ⟨298388⟩
    si scène4.compteur == 5 :
        di = -1                                                                                       ⟨298393⟩
    si scène4.compteur == 7 :
        di = 1                                                                                        ⟨298398⟩
    si scène4.compteur == 9 :
        di = -1                                                                                       ⟨298403⟩
    si scène4.compteur == 10 :
        di = 1                                                                                        ⟨298408⟩
    si scène4.compteur == 12 :
        di = 0                                                                                        ⟨298413⟩
    si scène4.compteur == 16 :
        di = 1                                                                                        ⟨298418⟩
    si scène4.compteur == 20 :
        di = 0                                                                                        ⟨298423⟩
    Scene_Tick(scène=scène4)                                                                          ⟨298438⟩
v332 = 6                                                                                              ⟨298464⟩
v6 = 22                                                                                               ⟨298465⟩
v2 = scène4.compteur                                                                                  ⟨298467⟩
di = v2 + ((v6·70) / 100)                                                                             ⟨298476⟩
tant que (scène4.compteur < v2 + ((v6·70) / 100)) et (scène4.terminée == 0) :
    si = scène4.compteur                                                                              ⟨298481⟩
    si scène4.compteur & 1 != 0 :
        si midgames 0.+0 < 33 :
            v336 = midgames 0.+0                                                                      ⟨298487⟩
            c25.image = v336                                                                          ⟨298491⟩
    v338 = v332                                                                                       ⟨298496⟩
    v332 = v332 + 1                                                                                   ⟨298497⟩
    c24.image = v338                                                                                  ⟨298500⟩
    si v332 > 13 :
        v332 = 13                                                                                     ⟨298503⟩
    si (v2 + ((v6·70) / 100)) - 2 == scène4.compteur :
        v3470 = 4540                                                                                  ⟨298510⟩
        v3470 = 4552                                                                                  ⟨298511⟩
        v3470 = 4568                                                                                  ⟨298512⟩
        v3470 = 4584                                                                                  ⟨298513⟩
        v3470 = 4604                                                                                  ⟨298514⟩
        Primitive_SetRectColorAndDraw_2CBE5(&v3470, v579, v577, v575, v573, 0, &v602)                 ⟨298524⟩
    Scene_Tick(scène=scène4)                                                                          ⟨298556⟩
si v12 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨298586⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨298593⟩
si byte_495FC != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨298771⟩
    canal_arrête(canal=canal2)                                                                        ⟨298794⟩
    v40 = 0                                                                                           ⟨299028⟩
    v35 = 0                                                                                           ⟨299029⟩
    v34 = 0                                                                                           ⟨299030⟩
    retour                                                                                            ⟨299057⟩

──── scène5 ────
scène5 = Scene_Create(cadence=9, palette=255, surface=&v532)                                          ⟨299067⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨299077⟩
palette_copie(destination=pal1, source=pal3(optpals 21))                                              ⟨299086⟩
palette_copie(destination=pal1, source=pal2(midgames 6))                                              ⟨299095⟩
palette_copie(destination=pal1, source=pal6(convdata type 2 "normal"))                                ⟨299104⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨299116⟩
c26 = Layer(ressource=optshps 116, x=0, y=-63)                                                        ⟨299123⟩
ajoute c26 à scène5                                                                                   ⟨299129⟩
c27 = Layer(ressource=midgames 4, x=0, y=0)                                                           ⟨299136⟩
ajoute c27 à scène5                                                                                   ⟨299142⟩
c28 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)                               ⟨299149⟩
di = c28                                                                                              ⟨299151⟩
ajoute c28 à scène5                                                                                   ⟨299155⟩
tête_image_de_base(tête=c28, image=25)                                                                ⟨299159⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨299164⟩
Widget_Method_Dispatch8_314A9(zone1, 127)                                                             ⟨299169⟩
c29 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)                             ⟨299177⟩
ajoute c29 à scène5                                                                                   ⟨299183⟩
v3470 = -1                                                                                            ⟨299194⟩
si v13 != 0 :
    charge(asoundfx 5)                                                                                ⟨299207⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨299212⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 5, x=0)                                         ⟨299219⟩
    v338 = word_48EAC                                                                                 ⟨299222⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3470)                                        ⟨299229⟩
        sub_30C66(canal3.+0→4, v3470, v338, mid20 14.+0)                                              ⟨299236⟩
si = 0                                                                                                ⟨299242⟩
v342 = 1                                                                                              ⟨299243⟩
si v12 != 0 :
    Scene_Tick(scène=scène5)                                                                          ⟨299252⟩
    charge(mid20voc 0)                                                                                ⟨299264⟩
    sub_9CF7(c28, mid20voc 0, 9)                                                                      ⟨299270⟩
    tant que v354 < 3 :
        Scene_Tick(scène=scène5)                                                                      ⟨299279⟩
        v354 = v354 + 1                                                                               ⟨299281⟩
    tant que sub_9C64(c28) != 0 :
        si si == 0 :
            CRT_Rand()                                                                                ⟨299292⟩
            si (CRT_Rand()·7) / -32768 != 0 : aller à loc_A2243                                       ⟨299299⟩
            si = -1                                                                                   ⟨299300⟩
        sinon :
            si si == -1 :
                si = 1                                                                                ⟨299308⟩
            sinon :
                si si == 1 :
                    si = 0                                                                            ⟨299315⟩
        c27.méthode24(0, si)                                                                          ⟨299324⟩
        c28.méthode24(0, si)                                                                          ⟨299330⟩
        c29.méthode24(0, si)                                                                          ⟨299337⟩
        Scene_Tick(scène=scène5)                                                                      ⟨299351⟩
    tant que v354 < 10 :
        si si == 0 :
            CRT_Rand()                                                                                ⟨299372⟩
            si (CRT_Rand()·7) / -32768 != 0 : aller à loc_A22DE                                       ⟨299379⟩
            si = -1                                                                                   ⟨299380⟩
        sinon :
            si si == -1 :
                si = 1                                                                                ⟨299388⟩
            sinon :
                si si == 1 :
                    si = 0                                                                            ⟨299395⟩
        c27.méthode24(0, si)                                                                          ⟨299404⟩
        c28.méthode24(0, si)                                                                          ⟨299410⟩
        c29.méthode24(0, si)                                                                          ⟨299417⟩
        Scene_Tick(scène=scène5)                                                                      ⟨299431⟩
        v354 = v354 + 1                                                                               ⟨299433⟩
sinon :
    v6 = 58                                                                                           ⟨299466⟩
    v2 = scène5.compteur                                                                              ⟨299468⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨299477⟩
    tant que (scène5.compteur < v4) et (scène5.terminée == 0) :
        v344 = scène5.compteur                                                                        ⟨299483⟩
        si si == 0 :
            CRT_Rand()                                                                                ⟨299486⟩
            si (CRT_Rand()·7) / -32768 != 0 : aller à loc_A23DD                                       ⟨299493⟩
            si = -1                                                                                   ⟨299494⟩
        sinon :
            si si == -1 :
                si = 1                                                                                ⟨299502⟩
            sinon :
                si si == 1 :
                    si = 0                                                                            ⟨299509⟩
        c27.méthode24(0, si)                                                                          ⟨299518⟩
        c28.méthode24(0, si)                                                                          ⟨299524⟩
        c29.méthode24(0, si)                                                                          ⟨299531⟩
        v342 = v342 + si                                                                              ⟨299533⟩
        si v2 + 6 == v344 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[5])                              ⟨299546⟩
        si v2 + 6 == v344 :
            tête_texte_de_lèvres(tête=c28, texte="Yualwzwndmetokelmymzjakl")                          ⟨299556⟩
        si v4 - 1 == v344 :
            v3484 = 4540                                                                              ⟨299564⟩
            v3484 = 4552                                                                              ⟨299565⟩
            v3484 = 4568                                                                              ⟨299566⟩
            v3484 = 4584                                                                              ⟨299567⟩
            v3484 = 4604                                                                              ⟨299568⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3484, v579, v577, v575, v573, 0, &v602)             ⟨299578⟩
        Scene_Tick(scène=scène5)                                                                      ⟨299610⟩
    v6 = 55                                                                                           ⟨299637⟩
    v2 = scène5.compteur                                                                              ⟨299639⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨299648⟩
    tant que (scène5.compteur < v4) et (scène5.terminée == 0) :
        v344 = scène5.compteur                                                                        ⟨299654⟩
        si si == 0 :
            CRT_Rand()                                                                                ⟨299657⟩
            si (CRT_Rand()·7) / -32768 != 0 : aller à loc_A257D                                       ⟨299664⟩
            si = -1                                                                                   ⟨299665⟩
        sinon :
            si si == -1 :
                si = 1                                                                                ⟨299673⟩
            sinon :
                si si == 1 :
                    si = 0                                                                            ⟨299680⟩
        c27.méthode24(0, si)                                                                          ⟨299689⟩
        c28.méthode24(0, si)                                                                          ⟨299695⟩
        c29.méthode24(0, si)                                                                          ⟨299702⟩
        v342 = v342 + si                                                                              ⟨299704⟩
        si v2 + 10 == v344 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])                              ⟨299717⟩
        si v2 + 10 == v344 :
            tête_texte_de_lèvres(tête=c28, texte="Yralkyimntjorkdofklhr")                             ⟨299727⟩
        si v2 + 8 == v344 :
            tête_image_de_base(tête=c28, image=14)                                                    ⟨299737⟩
        si v4 - 1 == v344 :
            v3484 = 4540                                                                              ⟨299745⟩
            v3484 = 4552                                                                              ⟨299746⟩
            v3484 = 4568                                                                              ⟨299747⟩
            v3484 = 4584                                                                              ⟨299748⟩
            v3484 = 4604                                                                              ⟨299749⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3484, v579, v577, v575, v573, 0, &v602)             ⟨299759⟩
        Scene_Tick(scène=scène5)                                                                      ⟨299791⟩
canal_arrête(canal=canal3)                                                                            ⟨299820⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨299882⟩
si byte_495FC != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨300041⟩
    canal_arrête(canal=canal2)                                                                        ⟨300064⟩
    v40 = 0                                                                                           ⟨300298⟩
    v35 = 0                                                                                           ⟨300299⟩
    v34 = 0                                                                                           ⟨300300⟩
    retour                                                                                            ⟨300327⟩
charge(mid20 18)                                                                                      ⟨300351⟩
palette_depuis(pal12(mid20 18))                                                                       ⟨300358⟩
charge(mid20 15)                                                                                      ⟨300370⟩
palette_depuis(pal13(mid20 15))                                                                       ⟨300377⟩
charge(mid20 2)                                                                                       ⟨300389⟩
charge(mid20 3)                                                                                       ⟨300401⟩
charge(mid20 4)                                                                                       ⟨300413⟩

──── scène6 ────
scène6 = Scene_Create(cadence=20, palette=255, surface=&v532)                                         ⟨300421⟩
palette_copie(destination=pal1, source=pal5(midgames 22))                                             ⟨300430⟩
palette_copie(destination=pal1, source=pal4(optpals 24))                                              ⟨300439⟩
palette_copie(destination=pal1, source=pal13(mid20 15))                                               ⟨300448⟩
palette_copie(destination=pal1, source=pal12(mid20 18))                                               ⟨300457⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨300469⟩
c30 = Layer(ressource=optshps 116, x=0, y=-35)                                                        ⟨300476⟩
ajoute c30 à scène6                                                                                   ⟨300482⟩
c31 = Layer(ressource=midgames 20, x=0, y=-35)                                                        ⟨300489⟩
ajoute c31 à scène6                                                                                   ⟨300495⟩
c32 = Layer(ressource=optshps 44, x=0, y=-75)                                                         ⟨300502⟩
ajoute c32 à scène6                                                                                   ⟨300508⟩
c33 = ImageLayer(ressource=midgames 19, x=0, y=56, image=2)                                           ⟨300516⟩
ajoute c33 à scène6                                                                                   ⟨300522⟩
c34 = Layer(ressource=mid20 4, x=0, y=6)                                                              ⟨300529⟩
ajoute c34 à scène6                                                                                   ⟨300535⟩
c35 = Layer(ressource=mid20 2, x=-20, y=-2)                                                           ⟨300542⟩
ajoute c35 à scène6                                                                                   ⟨300548⟩
c36 = Layer(ressource=mid20 3, x=-20, y=-2)                                                           ⟨300555⟩
ajoute c36 à scène6                                                                                   ⟨300561⟩
charge(mid20 9)                                                                                       ⟨300573⟩
c37 = Layer(ressource=mid20 9, x=0, y=-70)                                                            ⟨300580⟩
ajoute c37 à scène6                                                                                   ⟨300586⟩
c37.image = 0                                                                                         ⟨300589⟩
c36.image = 0                                                                                         ⟨300591⟩
di = 0                                                                                                ⟨300592⟩
Scene_Tick(scène=scène6)                                                                              ⟨300598⟩
v3470 = -1                                                                                            ⟨300609⟩
si v13 != 0 :
    charge(asoundfx 105)                                                                              ⟨300622⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨300627⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 105, x=0)                                       ⟨300634⟩
    v364 = word_48F74                                                                                 ⟨300637⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3470)                                        ⟨300644⟩
        sub_30C66(canal3.+0→4, v3470, v364, mid20 11.+0)                                              ⟨300651⟩
si v12 != 0 :
    charge(mid20voc 1)                                                                                ⟨300669⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid20voc 1)                                 ⟨300675⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨300682⟩
Widget_Method_Dispatch8_314A9(zone1, 212)                                                             ⟨300687⟩
tant que (scène6.compteur < 186) et (scène6.terminée == 0) :
    si = scène6.compteur                                                                              ⟨300693⟩
    v378 = v348                                                                                       ⟨300695⟩
    v348 = v348 + 1                                                                                   ⟨300696⟩
    c37.image = v378                                                                                  ⟨300699⟩
    si scène6.compteur < 40 :
        c37.méthode24(0, 1)                                                                           ⟨300707⟩
    si scène6.compteur > 40 :
        si scène6.compteur < 60 :
            si scène6.compteur & 1 != 0 :
                c37.méthode24(0, 1)                                                                   ⟨300722⟩
    si scène6.compteur == 20 :
        si v12 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨300734⟩
    si scène6.compteur == 20 :
        si v12 == 0 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])                              ⟨300752⟩
    si scène6.compteur == 60 :
        si v12 == 0 :
            v3484 = 4540                                                                              ⟨300763⟩
            v3484 = 4552                                                                              ⟨300764⟩
            v3484 = 4568                                                                              ⟨300765⟩
            v3484 = 4584                                                                              ⟨300766⟩
            v3484 = 4604                                                                              ⟨300767⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3484, v579, v577, v575, v573, 0, &v602)             ⟨300777⟩
    si scène6.compteur > 0 :
        si scène6.compteur < 5 :
            v380 = di                                                                                 ⟨300786⟩
            di = di + 1                                                                               ⟨300787⟩
            c36.image = v380                                                                          ⟨300790⟩
    si scène6.compteur > 5 :
        si scène6.compteur < 15 :
            v382 = convdata type 2 "normal".+0                                                        ⟨300799⟩
            c35.image = v382                                                                          ⟨300803⟩
    si scène6.compteur > 19 :
        si scène6.compteur < 51 :
            si scène6.compteur & 1 != 0 :
                v384 = di                                                                             ⟨300813⟩
                di = di + 1                                                                           ⟨300814⟩
                c36.image = v384                                                                      ⟨300817⟩
    si scène6.compteur > 51 :
        si scène6.compteur < 61 :
            si scène6.compteur & 1 != 0 :
                v386 = di                                                                             ⟨300827⟩
                di = di - 1                                                                           ⟨300828⟩
                c36.image = v386                                                                      ⟨300831⟩
    si scène6.compteur > 61 :
        si scène6.compteur < 71 :
            si scène6.compteur & 1 != 0 :
                v388 = di                                                                             ⟨300841⟩
                di = di + 1                                                                           ⟨300842⟩
                c36.image = v388                                                                      ⟨300845⟩
    si scène6.compteur > 45 :
        si scène6.compteur < 55 :
            v390 = mid20voc 0.+0                                                                      ⟨300854⟩
            c35.image = v390                                                                          ⟨300858⟩
    si scène6.compteur == 87 :
        di = di - 2                                                                                   ⟨300864⟩
    si scène6.compteur == 110 :
        v392 = di                                                                                     ⟨300869⟩
        di = di + 1                                                                                   ⟨300870⟩
        c36.image = v392                                                                              ⟨300873⟩
    si scène6.compteur == 141 :
        di = di - 1                                                                                   ⟨300879⟩
        c36.image = di                                                                                ⟨300882⟩
    aller à loc_A3407                                                                                 ⟨300885⟩
    aller à loc_A3433                                                                                 ⟨300912⟩
    loc_A3407:                                                                                        ⟨300915⟩
    Scene_Tick(scène=scène6)                                                                          ⟨300919⟩
loc_A3433:                                                                                            ⟨300943⟩
si v12 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨300949⟩
scène6.compteur = 0                                                                                   ⟨300953⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=2, premier=0, nombre=256)                           ⟨300961⟩
canal_arrête(canal=canal3)                                                                            ⟨300984⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨301046⟩
voix_arrête(voix=voix1)                                                                               ⟨301304⟩
canal_arrête(canal=canal2)                                                                            ⟨301327⟩
v40 = 0                                                                                               ⟨301561⟩
v35 = 0                                                                                               ⟨301562⟩
v34 = 0                                                                                               ⟨301563⟩
retour                                                                                                ⟨301590⟩
```

## Tableaux du segment de données

