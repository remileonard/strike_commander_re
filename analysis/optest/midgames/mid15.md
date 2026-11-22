# Script extrait de `sub_8B630` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## sub_8B630

```
bp = sp                                                                                               ⟨265738⟩
tableau_textes(tableau=textes1, nombre=26, longueur=200)                                              ⟨265750⟩
v15 = 0                                                                                               ⟨265752⟩
v16 = 0                                                                                               ⟨265753⟩
v17 = 0                                                                                               ⟨265754⟩
si word_4684B != 0 :
    v16 = 1                                                                                           ⟨265757⟩
v20 = word_46F46                                                                                      ⟨265761⟩
v472 = 0                                                                                              ⟨265762⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v472, v20)                                                      ⟨265767⟩
v486 = 0                                                                                              ⟨265769⟩
TextRenderer_ApplyFormatChange_2EA21(&v486, 0)                                                        ⟨265778⟩
SmallObject_RegisterInList_2CB40(&v24, &v486)                                                         ⟨265784⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨265790⟩
v34 = 0                                                                                               ⟨265796⟩
si v16 != 0 :
    si sub_6734(chemin1) != 0 :
        pak mid15voc.ouvre(chemin1, 1)                                                                ⟨265896⟩
    sinon :
        v16 = 0                                                                                       ⟨265903⟩
sinon :
    v16 = 0                                                                                           ⟨265903⟩
v44 = 0                                                                                               ⟨265906⟩
v39 = 0                                                                                               ⟨265908⟩
v38 = 0                                                                                               ⟨265909⟩
v46 = byte_46848                                                                                      ⟨265911⟩
si v46 != 1 :
    si v46 == 2 : aller à loc_8B9CA                                                                   ⟨265921⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨265957⟩
        flux_iff(flux=flux1)                                                                          ⟨265971⟩
        v3463 = 256                                                                                   ⟨265974⟩
        v3467 = 0                                                                                     ⟨265975⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨265983⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨265989⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨265995⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨265999⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨266001⟩
        di = 1                                                                                        ⟨266002⟩
        tant que di <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨266009⟩
            ds:24192[di·2] = iff_lit_mot(flux=flux1)                                                  ⟨266013⟩
            di = di + 1                                                                               ⟨266014⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨266021⟩
        v17 = 1                                                                                       ⟨266023⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨266027⟩
    si sub_6734(chemin1) != 0 :
        v15 = 1                                                                                       ⟨266053⟩
        si v17 == 0 :
            word_48F76 = 90                                                                           ⟨266058⟩
    aller à loc_8BB35                                                                                 ⟨266062⟩
    loc_8B9CA:                                                                                        ⟨266065⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨266093⟩
        flux_iff(flux=flux1)                                                                          ⟨266107⟩
        v3463 = 256                                                                                   ⟨266110⟩
        v3467 = 0                                                                                     ⟨266111⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨266119⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨266125⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨266131⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨266135⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨266137⟩
        di = 1                                                                                        ⟨266138⟩
        tant que di <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨266145⟩
            ds:24192[di·2] = iff_lit_mot(flux=flux1)                                                  ⟨266149⟩
            di = di + 1                                                                               ⟨266150⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨266157⟩
        v17 = 1                                                                                       ⟨266159⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨266163⟩
    si sub_6734(chemin1) != 0 :
        v15 = 1                                                                                       ⟨266189⟩
        si v17 == 0 :
            word_48F76 = 255                                                                          ⟨266194⟩
loc_8BB35:                                                                                            ⟨266200⟩
v52 = word_45314                                                                                      ⟨266203⟩
v50 = word_45316                                                                                      ⟨266205⟩
v48 = byte_45318                                                                                      ⟨266207⟩
si v17 != 0 :
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨266223⟩
    di = 0                                                                                            ⟨266225⟩
    tant que di < 5 :
        charge(asoundfx v52[di])                                                                      ⟨266242⟩
        canal_enregistre(canal=canal1, ressource=asoundfx v52[di], x=0)                               ⟨266249⟩
        canal_arrête(canal=canal1)                                                                    ⟨266253⟩
        v328 = 0                                                                                      ⟨266271⟩
        v322 = 0                                                                                      ⟨266273⟩
        di = di + 1                                                                                   ⟨266274⟩
    canal_arrête(canal=canal1)                                                                        ⟨266285⟩
    v3402 = 0                                                                                         ⟨266303⟩
    v3396 = 0                                                                                         ⟨266305⟩
v1216 = 0                                                                                             ⟨266308⟩
v1211 = 0                                                                                             ⟨266310⟩
v1210 = 0                                                                                             ⟨266311⟩
v1220 = 0                                                                                             ⟨266312⟩
si v15 != 0 :
    si v16 != 0 :
        v319 = 10                                                                                     ⟨266325⟩
    sinon :
        v319 = 9                                                                                      ⟨266330⟩
    charge(amusic v319)                                                                               ⟨266341⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨266346⟩
    canal_enregistre(canal=canal2, ressource=amusic v319, x=0)                                        ⟨266353⟩
v1229 = booléen                                                                                       ⟨266370⟩
v1225 = booléen                                                                                       ⟨266371⟩
si v16 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨266377⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨266395⟩
    v3463 = 256                                                                                       ⟨266398⟩
    v3467 = 0                                                                                         ⟨266399⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨266407⟩
    iff_form(flux=flux1, balise='MG15', x=0)                                                          ⟨266413⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨266419⟩
    di = 0                                                                                            ⟨266421⟩
    tant que di < 26 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨266430⟩
        v320 = v3446                                                                                  ⟨266433⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·di), taille=v320)                    ⟨266444⟩
        v3459 = v3442                                                                                 ⟨266447⟩
        di = di + 1                                                                                   ⟨266448⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨266455⟩
    si CRT_Strlen(arg_8) != 0 :
        CRT_Strcat(textes1[0], 8953)                                                                  ⟨266464⟩
        CRT_Strcat(textes1[0], arg_8)                                                                 ⟨266468⟩
        CRT_Strcat(textes1[0], 8960)                                                                  ⟨266472⟩
    sinon :
        si CRT_Strlen(arg_10) != 0 :
            CRT_Strcat(textes1[0], 8953)                                                              ⟨266485⟩
            CRT_Strcat(textes1[0], arg_10)                                                            ⟨266489⟩
            CRT_Strcat(textes1[0], 8960)                                                              ⟨266493⟩
        sinon :
            si CRT_Strlen(arg_6) != 0 :
                CRT_Strcat(textes1[0], 8953)                                                          ⟨266506⟩
                CRT_Strcat(textes1[0], arg_6)                                                         ⟨266510⟩
                CRT_Strcat(textes1[0], 8960)                                                          ⟨266514⟩
            sinon :
                CRT_Strcat(textes1[0], 8960)                                                          ⟨266522⟩
    si CRT_Strlen(arg_6) != 0 :
        CRT_Strcat(textes1[17], 8953)                                                                 ⟨266539⟩
        CRT_Strcat(textes1[17], arg_6)                                                                ⟨266548⟩
        CRT_Strcat(textes1[17], 8956)                                                                 ⟨266557⟩
    sinon :
        si CRT_Strlen(arg_10) != 0 :
            CRT_Strcat(textes1[17], 8953)                                                             ⟨266575⟩
            CRT_Strcat(textes1[17], arg_10)                                                           ⟨266584⟩
            CRT_Strcat(textes1[17], 8956)                                                             ⟨266593⟩
        sinon :
            si CRT_Strlen(arg_8) != 0 :
                CRT_Strcat(textes1[17], 8953)                                                         ⟨266611⟩
                CRT_Strcat(textes1[17], arg_8)                                                        ⟨266620⟩
                CRT_Strcat(textes1[17], 8956)                                                         ⟨266629⟩
            sinon :
                CRT_Strcat(textes1[17], 8956)                                                         ⟨266642⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨266650⟩
charge(optshps 116)                                                                                   ⟨266669⟩
charge(mid15 5)                                                                                       ⟨266681⟩
charge(mid15 1)                                                                                       ⟨266693⟩
charge(mid15 4)                                                                                       ⟨266705⟩
charge(mid15 0)                                                                                       ⟨266717⟩
charge(mid15 8)                                                                                       ⟨266729⟩
charge(mid15 9)                                                                                       ⟨266741⟩
charge(mid15 3)                                                                                       ⟨266753⟩
charge(mid15 7)                                                                                       ⟨266765⟩
charge(midgames 4)                                                                                    ⟨266777⟩
charge(optpals 21)                                                                                    ⟨266789⟩
palette_depuis(pal2(optpals 21))                                                                      ⟨266796⟩
charge(mid15 15)                                                                                      ⟨266808⟩
palette_depuis(pal3(mid15 15))                                                                        ⟨266815⟩
charge(mid15 11)                                                                                      ⟨266827⟩
palette_depuis(pal4(mid15 11))                                                                        ⟨266834⟩
charge(mid15 13)                                                                                      ⟨266846⟩
palette_depuis(pal5(mid15 13))                                                                        ⟨266853⟩
charge(mid15 14)                                                                                      ⟨266865⟩
palette_depuis(pal6(mid15 14))                                                                        ⟨266872⟩
charge(midgames 6)                                                                                    ⟨266884⟩
palette_depuis(pal7(midgames 6))                                                                      ⟨266891⟩
charge_convdata_type2("normal")                                                                       ⟨266901⟩
palette_depuis(pal8(convdata type 2 "normal"))                                                        ⟨266908⟩
v274 = 0                                                                                              ⟨266910⟩
v270 = 2                                                                                              ⟨266911⟩
v269 = 0                                                                                              ⟨266912⟩
v268 = 0                                                                                              ⟨266913⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨266927⟩
v276 = ?                                                                                              ⟨266929⟩
v278 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                ⟨266930⟩
v274 = v278                                                                                           ⟨266932⟩
v270 = 2                                                                                              ⟨266933⟩
v269 = 1                                                                                              ⟨266934⟩
v268 = 0                                                                                              ⟨266935⟩
GlyphObject_ConstructWithBuffer_311CF(&v3330, &v274)                                                  ⟨266940⟩
v288 = word_46F46                                                                                     ⟨266947⟩
zone_texte(zone=zone1, police=&v3330)                                                                 ⟨266953⟩
v290 = 152                                                                                            ⟨266957⟩
v292 = 319                                                                                            ⟨266959⟩
v294 = 199                                                                                            ⟨266961⟩
v3339 = 0                                                                                             ⟨266963⟩
v3337 = v290                                                                                          ⟨266965⟩
v3335 = v292                                                                                          ⟨266967⟩
v3333 = v294                                                                                          ⟨266969⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨266973⟩
Widget_Method_Dispatch8_314A9(zone1, 200)                                                             ⟨266978⟩
v304 = 0                                                                                              ⟨266980⟩
v299 = 0                                                                                              ⟨266982⟩
v298 = 0                                                                                              ⟨266983⟩
v314 = 0                                                                                              ⟨266984⟩
v309 = 0                                                                                              ⟨266986⟩
v308 = 0                                                                                              ⟨266987⟩
v3374 = 0                                                                                             ⟨266988⟩
v3369 = 0                                                                                             ⟨266990⟩
v3368 = 0                                                                                             ⟨266991⟩
v3378 = 0                                                                                             ⟨266992⟩
v3388 = 0                                                                                             ⟨266994⟩
v3383 = 0                                                                                             ⟨266996⟩
v3382 = 0                                                                                             ⟨266997⟩
v3392 = 0                                                                                             ⟨266998⟩
si byte_495FC == 0 :
    si v15 != 0 :
        v316 = word_48F76                                                                             ⟨267009⟩
        si canal2.+0 != 0 :
            AIL_start_sequence(pilote=canal2.+0→4, séquence=v1218)                                    ⟨267016⟩
            AIL_set_relative_volume_30C66(canal2.+0→4, v1218, v316, 0)                                ⟨267023⟩

    ──── scène1 ────
    scène1 = Scene_Create(cadence=15, palette=255, surface=&v472)                                     ⟨267035⟩
    c1 = Layer(ressource=optshps 116, x=0, y=-24)                                                     ⟨267042⟩
    c2 = ScaledImageLayer(ressource=mid15 1, x=288, y=94, angle=0, échelle=32, octet=0, image=0)      ⟨267054⟩
    c3 = ScaledImageLayer(ressource=mid15 5, x=288, y=94, angle=0, échelle=32, octet=0, image=0)      ⟨267066⟩
    palette_copie(destination=pal1, source=pal4(mid15 11))                                            ⟨267076⟩
    palette_copie(destination=pal1, source=pal2(optpals 21))                                          ⟨267085⟩
    ajoute c1 à scène1                                                                                ⟨267090⟩
    fondu_disparition(palette=pal1, couleur=&v34, pas=0, premier=0, nombre=256)                       ⟨267103⟩
    palette_copie(destination=pal1, source=pal4(mid15 11))                                            ⟨267112⟩
    palette_copie(destination=pal1, source=pal2(optpals 21))                                          ⟨267121⟩
    si v17 != 0 :
        charge(asoundfx 61)                                                                           ⟨267145⟩
        canal_init(canal=canal3, pilote=word_46849)                                                   ⟨267150⟩
        canal_enregistre(canal=canal3, ressource=asoundfx 61, x=0)                                    ⟨267157⟩
        v336 = word_48F1C                                                                             ⟨267160⟩
        v338 = 0                                                                                      ⟨267161⟩
        si canal3.+0 != 0 :
            AIL_start_sequence(pilote=canal3.+0→4, séquence=v3438)                                    ⟨267167⟩
            AIL_set_relative_volume_30C66(canal3.+0→4, v3438, v336, v338)                             ⟨267174⟩
    Scene_Tick(scène=scène1)                                                                          ⟨267182⟩
    fondu_apparition(palette=pal1, couleur=&v34, pas=2, premier=0, nombre=256)                        ⟨267191⟩
    palette_envoie(palette=pal1, pas=0)                                                               ⟨267199⟩
    v340 = 32                                                                                         ⟨267201⟩
    v342 = 6                                                                                          ⟨267202⟩
    v344 = 32                                                                                         ⟨267203⟩
    v346 = 6                                                                                          ⟨267204⟩
    v348 = 0                                                                                          ⟨267205⟩
    v350 = 0                                                                                          ⟨267206⟩
    v352 = -8                                                                                         ⟨267207⟩
    v354 = -4                                                                                         ⟨267208⟩
    v356 = -8                                                                                         ⟨267209⟩
    v358 = -4                                                                                         ⟨267210⟩
    ajoute c3 à scène1                                                                                ⟨267214⟩
    ajoute c2 à scène1                                                                                ⟨267219⟩
    tant que (scène1.compteur < 62) et (scène1.terminée == 0) :
        di = scène1.compteur                                                                          ⟨267225⟩
        v360 = v348                                                                                   ⟨267227⟩
        c3.image = v360                                                                               ⟨267230⟩
        si scène1.compteur > 0 :
            si scène1.compteur < 38 :
                si scène1.compteur == 30 :
                    v342 = 5                                                                          ⟨267237⟩
                    v352 = -7                                                                         ⟨267238⟩
                    v354 = -3                                                                         ⟨267239⟩
                si scène1.compteur == 36 :
                    v342 = 4                                                                          ⟨267244⟩
                    v352 = -6                                                                         ⟨267245⟩
                    v354 = -2                                                                         ⟨267246⟩
                échelle(calque=c3, échelle=v340)                                                      ⟨267251⟩
                si scène1.compteur < 51 :
                    déplace(calque=c3, dx=v352, dy=v354)                                              ⟨267260⟩
                v340 = v340 + v342                                                                    ⟨267265⟩
                si v340 > 255 :
                    v340 = 255                                                                        ⟨267268⟩
        v348 = v348 + 1                                                                               ⟨267272⟩
        si v348 > 30 :
            v348_avant = v348                                                                         ⟨267276⟩
            v348 = 0                                                                                  ⟨267276⟩
        v362 = v350                                                                                   ⟨267280⟩
        c2.image = v362                                                                               ⟨267283⟩
        si scène1.compteur > -1 :
            si scène1.compteur < 37 :
                si scène1.compteur == 28 :
                    v346 = 5                                                                          ⟨267290⟩
                    v356 = -7                                                                         ⟨267291⟩
                    v358 = -3                                                                         ⟨267292⟩
                si scène1.compteur == 34 :
                    v346 = 4                                                                          ⟨267297⟩
                    v356 = -6                                                                         ⟨267298⟩
                    v358 = -2                                                                         ⟨267299⟩
                échelle(calque=c2, échelle=v344)                                                      ⟨267304⟩
                si scène1.compteur < 51 :
                    déplace(calque=c2, dx=v356, dy=v358)                                              ⟨267313⟩
                v344 = v344 + v346                                                                    ⟨267318⟩
                si v344 > 255 :
                    v344 = 255                                                                        ⟨267321⟩
        v350 = v350 + 1                                                                               ⟨267325⟩
        si v350 > 26 :
            v350_avant = v350                                                                         ⟨267329⟩
            v350 = 0                                                                                  ⟨267329⟩
        Scene_Tick(scène=scène1)                                                                      ⟨267344⟩
    canal_arrête(canal=canal3)                                                                        ⟨267372⟩
    v3436 = 0                                                                                         ⟨267390⟩
    v3431 = 0                                                                                         ⟨267391⟩
    v3430 = 0                                                                                         ⟨267392⟩
    v328 = 0                                                                                          ⟨267411⟩
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨267415⟩
    si byte_495FC == 0 :

        ──── scène2 ────
        scène2 = Scene_Create(cadence=10, palette=255, surface=&v472)                                 ⟨267429⟩
        c4 = Layer(ressource=optshps 116, x=0, y=-57)                                                 ⟨267436⟩
        charge_convdata_type0("janet", drapeau=3)                                                     ⟨267447⟩
        c5 = Layer(ressource=mid15 7, x=0, y=0)                                                       ⟨267454⟩
        c6 = TalkingHeadOverlay(ressource=convdata type 0 "janet", x=160, y=129)                      ⟨267462⟩
        c7 = ImageLayer(ressource=convdata type 0 "janet", x=160, y=128, image=51)                    ⟨267471⟩
        palette_copie(destination=pal1, source=pal2(optpals 21))                                      ⟨267481⟩
        palette_copie(destination=pal1, source=pal6(mid15 14))                                        ⟨267490⟩
        palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))                        ⟨267499⟩
        palette_envoie(palette=pal1, pas=0)                                                           ⟨267511⟩
        ajoute c4 à scène2                                                                            ⟨267516⟩
        ajoute c5 à scène2                                                                            ⟨267521⟩
        ajoute c6 à scène2                                                                            ⟨267526⟩
        ajoute c7 à scène2                                                                            ⟨267531⟩
        di = 0                                                                                        ⟨267533⟩
        si v17 != 0 :
            charge(asoundfx 24)                                                                       ⟨267546⟩
            canal_init(canal=canal4, pilote=word_46849)                                               ⟨267551⟩
            canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)                                ⟨267558⟩
            v338 = word_48ED2                                                                         ⟨267561⟩
            v340 = 0                                                                                  ⟨267562⟩
            si canal4.+0 != 0 :
                AIL_start_sequence(pilote=canal4.+0→4, séquence=v3376)                                ⟨267568⟩
                AIL_set_relative_volume_30C66(canal4.+0→4, v3376, v338, v340)                         ⟨267575⟩
        si v16 != 0 :
            Scene_Tick(scène=scène2)                                                                  ⟨267589⟩
            charge(mid15voc 0)                                                                        ⟨267601⟩
            tête_voix(tête=c6, ressource=mid15voc 0, cadence=9)                                       ⟨267607⟩
            v352 = 0                                                                                  ⟨267609⟩
            tant que v352 < 3 :
                Scene_Tick(scène=scène2)                                                              ⟨267616⟩
                v352 = v352 + 1                                                                       ⟨267618⟩
            tant que tête_parle(tête=c6) != 0 :
                si di == 0 :
                    CRT_Rand()                                                                        ⟨267629⟩
                    si (CRT_Rand()·7) / 32768 == 0 :
                        di = -1                                                                       ⟨267637⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨267645⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨267652⟩
                sinon :
                    si di == -1 :
                        di = 1                                                                        ⟨267645⟩
                    sinon :
                        si di == 1 :
                            di = 0                                                                    ⟨267652⟩
                déplace(calque=c5, dx=0, dy=di)                                                       ⟨267661⟩
                déplace(calque=c6, dx=0, dy=di)                                                       ⟨267668⟩
                déplace(calque=c7, dx=0, dy=di)                                                       ⟨267675⟩
                Scene_Tick(scène=scène2)                                                              ⟨267689⟩
            v352 = 0                                                                                  ⟨267703⟩
            tant que v352 < 8 :
                si di == 0 :
                    CRT_Rand()                                                                        ⟨267710⟩
                    si (CRT_Rand()·7) / 32768 == 0 :
                        di = -1                                                                       ⟨267718⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨267726⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨267733⟩
                sinon :
                    si di == -1 :
                        di = 1                                                                        ⟨267726⟩
                    sinon :
                        si di == 1 :
                            di = 0                                                                    ⟨267733⟩
                déplace(calque=c5, dx=0, dy=di)                                                       ⟨267742⟩
                déplace(calque=c6, dx=0, dy=di)                                                       ⟨267749⟩
                déplace(calque=c7, dx=0, dy=di)                                                       ⟨267756⟩
                Scene_Tick(scène=scène2)                                                              ⟨267770⟩
                v352 = v352 + 1                                                                       ⟨267772⟩
            v350 = 0                                                                                  ⟨267798⟩
            v344 = 0                                                                                  ⟨267800⟩
        sinon :
            Widget_Method_DispatchC_314CB(zone1, 0)                                                   ⟨267808⟩
            Widget_Method_Dispatch8_314A9(zone1, 127)                                                 ⟨267813⟩
            v10 = 31                                                                                  ⟨267815⟩
            si = scène2.compteur                                                                      ⟨267816⟩
            v8 = si + ((v10·70) / 100)                                                                ⟨267825⟩
            tant que (scène2.compteur < v8) et (scène2.terminée == 0) :
                v342 = scène2.compteur                                                                ⟨267831⟩
                si di == 0 :
                    CRT_Rand()                                                                        ⟨267834⟩
                    si (CRT_Rand()·7) / 32768 == 0 :
                        di = -1                                                                       ⟨267842⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨267850⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨267857⟩
                sinon :
                    si di == -1 :
                        di = 1                                                                        ⟨267850⟩
                    sinon :
                        si di == 1 :
                            di = 0                                                                    ⟨267857⟩
                si si + 2 == v342 :
                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[0])                      ⟨267868⟩
                si si + 2 == v342 :
                    tête_texte_de_lèvres(tête=c6, texte="anetrubla")                                  ⟨267878⟩
                si v8 - 1 == v342 :
                    v3438 = 4540                                                                      ⟨267886⟩
                    v3438 = 4552                                                                      ⟨267887⟩
                    v3438 = 4568                                                                      ⟨267888⟩
                    v3438 = 4584                                                                      ⟨267889⟩
                    v3438 = 4604                                                                      ⟨267890⟩
                    Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨267900⟩
                Scene_Tick(scène=scène2)                                                              ⟨267932⟩
        si v17 != 0 :
            canal_arrête(canal=canal4)                                                                ⟨267963⟩
        v330 = 0                                                                                      ⟨267983⟩
        v324 = 0                                                                                      ⟨267985⟩
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨267989⟩
        si byte_495FC == 0 :

            ──── scène3 ────
            scène3 = Scene_Create(cadence=10, palette=255, surface=&v472)                             ⟨268003⟩
            c8 = Layer(ressource=optshps 116, x=0, y=-57)                                             ⟨268010⟩
            v330 = 0                                                                                  ⟨268013⟩
            v324 = 0                                                                                  ⟨268016⟩
            charge_convdata_type0("air", drapeau=3)                                                   ⟨268021⟩
            c9 = Layer(ressource=midgames 4, x=0, y=0)                                                ⟨268028⟩
            c10 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)                   ⟨268036⟩
            c11 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)                 ⟨268045⟩
            palette_copie(destination=pal1, source=pal2(optpals 21))                                  ⟨268055⟩
            palette_copie(destination=pal1, source=pal7(midgames 6))                                  ⟨268064⟩
            palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))                    ⟨268073⟩
            palette_envoie(palette=pal1, pas=0)                                                       ⟨268085⟩
            ajoute c8 à scène3                                                                        ⟨268090⟩
            ajoute c9 à scène3                                                                        ⟨268095⟩
            ajoute c10 à scène3                                                                       ⟨268100⟩
            ajoute c11 à scène3                                                                       ⟨268105⟩
            di = 0                                                                                    ⟨268107⟩
            si v17 != 0 :
                charge(asoundfx 5)                                                                    ⟨268120⟩
                canal_init(canal=canal5, pilote=word_46849)                                           ⟨268125⟩
                canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)                             ⟨268132⟩
                v338 = word_48EAC                                                                     ⟨268135⟩
                v340 = 0                                                                              ⟨268136⟩
                si canal5.+0 != 0 :
                    AIL_start_sequence(pilote=canal5.+0→4, séquence=v3390)                            ⟨268142⟩
                    AIL_set_relative_volume_30C66(canal5.+0→4, v3390, v338, v340)                     ⟨268149⟩
            si v16 != 0 :
                Scene_Tick(scène=scène3)                                                              ⟨268163⟩
                v350 = 0                                                                              ⟨268165⟩
                v344 = 0                                                                              ⟨268168⟩
                charge(mid15voc 8)                                                                    ⟨268175⟩
                tête_voix(tête=c10, ressource=mid15voc 8, cadence=9)                                  ⟨268181⟩
                v352 = 0                                                                              ⟨268183⟩
                tant que v352 < 3 :
                    Scene_Tick(scène=scène3)                                                          ⟨268190⟩
                    v352 = v352 + 1                                                                   ⟨268192⟩
                v352 = 0                                                                              ⟨268197⟩
                tant que tête_parle(tête=c10) != 0 :
                    v352_avant = v352                                                                 ⟨268203⟩
                    v352 = v352 + 1                                                                   ⟨268203⟩
                    si v352_avant == 7 :
                        tête_image_de_base(tête=c10, image=33)                                        ⟨268208⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨268214⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨268222⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨268230⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨268237⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨268230⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨268237⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨268246⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨268253⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨268260⟩
                    Scene_Tick(scène=scène3)                                                          ⟨268274⟩
                v352 = 0                                                                              ⟨268288⟩
                tant que v352 < 8 :
                    si v352 == 0 :
                        tête_image_de_base(tête=c10, image=27)                                        ⟨268297⟩
                    si v352 == 6 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨268305⟩
                    si v352 == 7 :
                        tête_image_de_base(tête=c10, image=31)                                        ⟨268313⟩
                    si v352 == 8 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨268321⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨268327⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨268335⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨268343⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨268350⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨268343⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨268350⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨268359⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨268366⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨268373⟩
                    Scene_Tick(scène=scène3)                                                          ⟨268387⟩
                    v352 = v352 + 1                                                                   ⟨268389⟩
                v352 = 0                                                                              ⟨268399⟩
                tant que v352 < 6 :
                    Scene_Tick(scène=scène3)                                                          ⟨268406⟩
                    v352 = v352 + 1                                                                   ⟨268408⟩
                charge(mid15voc 9)                                                                    ⟨268423⟩
                tête_voix(tête=c10, ressource=mid15voc 9, cadence=9)                                  ⟨268429⟩
                tant que tête_parle(tête=c10) != 0 :
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨268437⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨268445⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨268453⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨268460⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨268453⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨268460⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨268469⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨268476⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨268483⟩
                    Scene_Tick(scène=scène3)                                                          ⟨268497⟩
                v352 = 0                                                                              ⟨268511⟩
                tant que v352 < 10 :
                    si v352 == 6 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨268520⟩
                    si v352 == 8 :
                        tête_image_de_base(tête=c10, image=128)                                       ⟨268528⟩
                    si v352 == 9 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨268536⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨268542⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨268550⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨268558⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨268565⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨268558⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨268565⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨268574⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨268581⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨268588⟩
                    Scene_Tick(scène=scène3)                                                          ⟨268602⟩
                    v352 = v352 + 1                                                                   ⟨268604⟩
                charge(mid15voc 10)                                                                   ⟨268624⟩
                tête_voix(tête=c10, ressource=mid15voc 10, cadence=9)                                 ⟨268630⟩
                tant que tête_parle(tête=c10) != 0 :
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨268638⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨268646⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨268654⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨268661⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨268654⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨268661⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨268670⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨268677⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨268684⟩
                    Scene_Tick(scène=scène3)                                                          ⟨268698⟩
                v352 = 0                                                                              ⟨268712⟩
                tant que v352 < 8 :
                    si v352 == 5 :
                        tête_image_de_base(tête=c10, image=128)                                       ⟨268721⟩
                    si v352 == 6 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨268729⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨268735⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨268743⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨268751⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨268758⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨268751⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨268758⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨268767⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨268774⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨268781⟩
                    Scene_Tick(scène=scène3)                                                          ⟨268795⟩
                    v352 = v352 + 1                                                                   ⟨268797⟩
                v366 = 0                                                                              ⟨268825⟩
                v362 = 0                                                                              ⟨268842⟩
                v356 = 0                                                                              ⟨268844⟩
                v350 = 0                                                                              ⟨268861⟩
                v344 = 0                                                                              ⟨268863⟩
            sinon :
                Widget_Method_DispatchC_314CB(zone1, 0)                                               ⟨268871⟩
                Widget_Method_Dispatch8_314A9(zone1, 127)                                             ⟨268876⟩
                v10 = 77                                                                              ⟨268878⟩
                si = scène3.compteur                                                                  ⟨268879⟩
                v8 = si + ((v10·70) / 100)                                                            ⟨268888⟩
                tant que (scène3.compteur < v8) et (scène3.terminée == 0) :
                    v342 = scène3.compteur                                                            ⟨268894⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨268897⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨268905⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨268913⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨268920⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨268913⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨268920⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨268929⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨268936⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨268943⟩
                    si si + 2 == v342 :
                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[1])                  ⟨268954⟩
                    si si + 2 == v342 :
                        tête_texte_de_lèvres(tête=c10, texte="plnty")                                 ⟨268964⟩
                    si si + 7 == v342 :
                        tête_image_de_base(tête=c10, image=33)                                        ⟨268974⟩
                    si si + 12 == v342 :
                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[2])                  ⟨268989⟩
                    si si + 12 == v342 :
                        tête_texte_de_lèvres(tête=c10, texte="butntforme ")                           ⟨268999⟩
                    si si + 28 == v342 :
                        tête_image_de_base(tête=c10, image=27)                                        ⟨269009⟩
                    si v8 - 4 == v342 :
                        v3438 = 4540                                                                  ⟨269017⟩
                        v3438 = 4552                                                                  ⟨269018⟩
                        v3438 = 4568                                                                  ⟨269019⟩
                        v3438 = 4584                                                                  ⟨269020⟩
                        v3438 = 4604                                                                  ⟨269021⟩
                        Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨269031⟩
                    si v8 - 8 == v342 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨269041⟩
                    si v8 - 7 == v342 :
                        tête_image_de_base(tête=c10, image=31)                                        ⟨269051⟩
                    si v8 - 6 == v342 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨269061⟩
                    Scene_Tick(scène=scène3)                                                          ⟨269093⟩
                v10 = 22                                                                              ⟨269120⟩
                si = scène3.compteur                                                                  ⟨269121⟩
                v8 = si + ((v10·70) / 100)                                                            ⟨269130⟩
                tant que (scène3.compteur < v8) et (scène3.terminée == 0) :
                    v342 = scène3.compteur                                                            ⟨269136⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨269139⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨269147⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨269155⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨269162⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨269155⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨269162⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨269171⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨269178⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨269185⟩
                    si si + 6 == v342 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨269193⟩
                    si si + 8 == v342 :
                        tête_image_de_base(tête=c10, image=128)                                       ⟨269203⟩
                    si si + 9 == v342 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨269213⟩
                    si si + 2 == v342 :
                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[3])                  ⟨269229⟩
                    si si + 2 == v342 :
                        tête_texte_de_lèvres(tête=c10, texte="wataminet")                             ⟨269239⟩
                    si v8 - 1 == v342 :
                        v3438 = 4540                                                                  ⟨269247⟩
                        v3438 = 4552                                                                  ⟨269248⟩
                        v3438 = 4568                                                                  ⟨269249⟩
                        v3438 = 4584                                                                  ⟨269250⟩
                        v3438 = 4604                                                                  ⟨269251⟩
                        Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨269261⟩
                    Scene_Tick(scène=scène3)                                                          ⟨269293⟩
                v10 = 45                                                                              ⟨269320⟩
                si = scène3.compteur                                                                  ⟨269321⟩
                v8 = si + ((v10·70) / 100)                                                            ⟨269330⟩
                tant que (scène3.compteur < v8) et (scène3.terminée == 0) :
                    v342 = scène3.compteur                                                            ⟨269336⟩
                    si di == 0 :
                        CRT_Rand()                                                                    ⟨269339⟩
                        si (CRT_Rand()·7) / 32768 == 0 :
                            di = -1                                                                   ⟨269347⟩
                        sinon :
                            si di == -1 :
                                di = 1                                                                ⟨269355⟩
                            sinon :
                                si di == 1 :
                                    di = 0                                                            ⟨269362⟩
                    sinon :
                        si di == -1 :
                            di = 1                                                                    ⟨269355⟩
                        sinon :
                            si di == 1 :
                                di = 0                                                                ⟨269362⟩
                    déplace(calque=c9, dx=0, dy=di)                                                   ⟨269371⟩
                    déplace(calque=c10, dx=0, dy=di)                                                  ⟨269378⟩
                    déplace(calque=c11, dx=0, dy=di)                                                  ⟨269385⟩
                    si si + 5 == v342 :
                        tête_image_de_base(tête=c10, image=128)                                       ⟨269393⟩
                    si si + 6 == v342 :
                        tête_image_de_base(tête=c10, image=19)                                        ⟨269403⟩
                    si si + 2 == v342 :
                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[4])                  ⟨269418⟩
                    si si + 2 == v342 :
                        tête_texte_de_lèvres(tête=c10, texte="miscndlvdajaklzbtnotobcloznonurpozitn")  ⟨269428⟩
                    si v8 - 1 == v342 :
                        v3438 = 4540                                                                  ⟨269436⟩
                        v3438 = 4552                                                                  ⟨269437⟩
                        v3438 = 4568                                                                  ⟨269438⟩
                        v3438 = 4584                                                                  ⟨269439⟩
                        v3438 = 4604                                                                  ⟨269440⟩
                        Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨269450⟩
                    Scene_Tick(scène=scène3)                                                          ⟨269482⟩
            si v17 != 0 :
                canal_arrête(canal=canal5)                                                            ⟨269513⟩
            v330 = 0                                                                                  ⟨269533⟩
            v324 = 0                                                                                  ⟨269535⟩
            Scene_Destruct(scène=scène3, drapeaux=0)                                                  ⟨269539⟩
            si byte_495FC == 0 :

                ──── scène4 ────
                scène4 = Scene_Create(cadence=10, palette=255, surface=&v472)                         ⟨269553⟩
                c12 = Layer(ressource=optshps 116, x=0, y=-57)                                        ⟨269560⟩
                c13 = Layer(ressource=mid15 8, x=0, y=-1)                                             ⟨269568⟩
                di = c13                                                                              ⟨269570⟩
                c14 = Layer(ressource=mid15 3, x=0, y=-1)                                             ⟨269576⟩
                c15 = OverlayImageLayer(ressource=mid15 0, x=0, y=-1, image=1)                        ⟨269585⟩
                palette_copie(destination=pal1, source=pal2(optpals 21))                              ⟨269595⟩
                palette_copie(destination=pal1, source=pal3(mid15 15))                                ⟨269604⟩
                ajoute c12 à scène4                                                                   ⟨269609⟩
                ajoute c13 à scène4                                                                   ⟨269614⟩
                ajoute c14 à scène4                                                                   ⟨269619⟩
                ajoute c15 à scène4                                                                   ⟨269624⟩
                palette_envoie(palette=pal1, pas=0)                                                   ⟨269636⟩
                Widget_Method_DispatchC_314CB(zone1, 0)                                               ⟨269641⟩
                Widget_Method_Dispatch8_314A9(zone1, 196)                                             ⟨269646⟩
                v326 = 0                                                                              ⟨269648⟩
                v328 = 3                                                                              ⟨269649⟩
                v330 = 2                                                                              ⟨269650⟩
                v332 = 2                                                                              ⟨269651⟩
                v334 = 0                                                                              ⟨269652⟩
                si v17 != 0 :
                    charge(asoundfx 5)                                                                ⟨269665⟩
                    canal_init(canal=canal5, pilote=word_46849)                                       ⟨269670⟩
                    canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)                         ⟨269677⟩
                    v336 = word_48EAC - 50                                                            ⟨269681⟩
                    v338 = 0                                                                          ⟨269682⟩
                    si canal5.+0 != 0 :
                        AIL_start_sequence(pilote=canal5.+0→4, séquence=v3390)                        ⟨269688⟩
                        AIL_set_relative_volume_30C66(canal5.+0→4, v3390, v336, v338)                 ⟨269695⟩
                si v16 != 0 :
                    Scene_Tick(scène=scène4)                                                          ⟨269709⟩
                    charge(mid15voc 11)                                                               ⟨269721⟩
                    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid15voc 11)                ⟨269727⟩
                    v350 = 0                                                                          ⟨269729⟩
                    tant que v350 < 4 :
                        Scene_Tick(scène=scène4)                                                      ⟨269736⟩
                        v350 = v350 + 1                                                               ⟨269738⟩
                    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                   ⟨269746⟩
                    v350 = 0                                                                          ⟨269748⟩
                    tant que voix_en_cours(voix=voix1) != 0 :
                        si v330 == v332 :
                            v350_avant = v350                                                         ⟨269757⟩
                            v350 = v350 + 1                                                           ⟨269757⟩
                            si v350_avant & 1 != 0 :
                                v352 = v328                                                           ⟨269761⟩
                                CRT_Rand()                                                            ⟨269762⟩
                                v332 = (CRT_Rand()·v352) / 32768                                      ⟨269769⟩
                            si v332 < v330 :
                                v326 = -1                                                             ⟨269775⟩
                            sinon :
                                si v332 == v330 :
                                    v326 = 0                                                          ⟨269783⟩
                                sinon :
                                    v326 = 1                                                          ⟨269788⟩
                        déplace(calque=c14, dx=0, dy=v326)                                            ⟨269797⟩
                        déplace(calque=c15, dx=0, dy=v326)                                            ⟨269804⟩
                        v334_avant = v334                                                             ⟨269807⟩
                        v334 = v334 + 1                                                               ⟨269807⟩
                        si v334_avant == 1 :
                            déplace(calque=c13, dx=-1, dy=0)                                          ⟨269814⟩
                        si v334 == 5 :
                            déplace(calque=c13, dx=0, dy=1)                                           ⟨269824⟩
                        si v334 == 8 :
                            v334 = 0                                                                  ⟨269830⟩
                        v330 = v330 + v326                                                            ⟨269834⟩
                        CRT_Rand()                                                                    ⟨269835⟩
                        v354 = (CRT_Rand()·3) / 32768                                                 ⟨269841⟩
                        c15.image = v354                                                              ⟨269844⟩
                        Scene_Tick(scène=scène4)                                                      ⟨269857⟩
                    c15.image = 0                                                                     ⟨269873⟩
                    v350 = 0                                                                          ⟨269874⟩
                    tant que v350 < 4 :
                        Scene_Tick(scène=scène4)                                                      ⟨269881⟩
                        v350 = v350 + 1                                                               ⟨269883⟩
                    voix_arrête(voix=voix1)                                                           ⟨269890⟩
                    v348 = 0                                                                          ⟨269908⟩
                    v342 = 0                                                                          ⟨269910⟩
                sinon :
                    v10 = 40                                                                          ⟨269915⟩
                    si = scène4.compteur                                                              ⟨269916⟩
                    v8 = si + ((v10·70) / 100)                                                        ⟨269925⟩
                    tant que (scène4.compteur < v8) et (scène4.terminée == 0) :
                        v340 = scène4.compteur                                                        ⟨269931⟩
                        si v330 == v332 :
                            si v340 & 1 != 0 :
                                v342 = v328                                                           ⟨269938⟩
                                CRT_Rand()                                                            ⟨269939⟩
                                v332 = (CRT_Rand()·v342) / 32768                                      ⟨269946⟩
                            si v332 < v330 :
                                v326 = -1                                                             ⟨269952⟩
                            sinon :
                                si v332 == v330 :
                                    v326 = 0                                                          ⟨269960⟩
                                sinon :
                                    v326 = 1                                                          ⟨269965⟩
                        déplace(calque=c14, dx=0, dy=v326)                                            ⟨269974⟩
                        déplace(calque=c15, dx=0, dy=v326)                                            ⟨269981⟩
                        v334_avant = v334                                                             ⟨269984⟩
                        v334 = v334 + 1                                                               ⟨269984⟩
                        si v334_avant == 1 :
                            déplace(calque=c13, dx=-1, dy=0)                                          ⟨269991⟩
                        si v334 == 5 :
                            déplace(calque=c13, dx=0, dy=1)                                           ⟨270001⟩
                        si v334 == 8 :
                            v334 = 0                                                                  ⟨270007⟩
                        v330 = v330 + v326                                                            ⟨270011⟩
                        si v340 == 2 :
                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[5])              ⟨270022⟩
                        si v340 > 2 :
                            si v340 < 20 :
                                CRT_Rand()                                                            ⟨270030⟩
                                v344 = (CRT_Rand()·3) / 32768                                         ⟨270036⟩
                                c15.image = v344                                                      ⟨270039⟩
                        si v8 - 1 == v340 :
                            v3438 = 4540                                                              ⟨270047⟩
                            v3438 = 4552                                                              ⟨270048⟩
                            v3438 = 4568                                                              ⟨270049⟩
                            v3438 = 4584                                                              ⟨270050⟩
                            v3438 = 4604                                                              ⟨270051⟩
                            Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨270061⟩
                        Scene_Tick(scène=scène4)                                                      ⟨270093⟩
                si v17 != 0 :
                    canal_arrête(canal=canal5)                                                        ⟨270124⟩
                Scene_Destruct(scène=scène4, drapeaux=0)                                              ⟨270131⟩
                si byte_495FC == 0 :

                    ──── scène5 ────
                    scène5 = Scene_Create(cadence=10, palette=255, surface=&v472)                     ⟨270145⟩
                    c16 = Layer(ressource=optshps 116, x=0, y=-57)                                    ⟨270152⟩
                    v330 = 0                                                                          ⟨270155⟩
                    v324 = 0                                                                          ⟨270158⟩
                    charge_convdata_type0("janet", drapeau=3)                                         ⟨270163⟩
                    c17 = Layer(ressource=mid15 7, x=0, y=0)                                          ⟨270170⟩
                    c18 = TalkingHeadOverlay(ressource=convdata type 0 "janet", x=160, y=129)         ⟨270178⟩
                    c19 = ImageLayer(ressource=convdata type 0 "janet", x=160, y=129, image=51)       ⟨270187⟩
                    c18.+2130 = 0                                                                     ⟨270191⟩
                    palette_copie(destination=pal1, source=pal2(optpals 21))                          ⟨270199⟩
                    palette_copie(destination=pal1, source=pal6(mid15 14))                            ⟨270208⟩
                    palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))            ⟨270217⟩
                    palette_envoie(palette=pal1, pas=0)                                               ⟨270229⟩
                    ajoute c16 à scène5                                                               ⟨270234⟩
                    ajoute c17 à scène5                                                               ⟨270239⟩
                    ajoute c18 à scène5                                                               ⟨270244⟩
                    ajoute c19 à scène5                                                               ⟨270249⟩
                    tête_image_de_base(tête=c18, image=33)                                            ⟨270253⟩
                    di = 0                                                                            ⟨270255⟩
                    si v17 != 0 :
                        charge(asoundfx 24)                                                           ⟨270268⟩
                        canal_init(canal=canal4, pilote=word_46849)                                   ⟨270273⟩
                        canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)                    ⟨270280⟩
                        v338 = word_48ED2                                                             ⟨270283⟩
                        v340 = 0                                                                      ⟨270284⟩
                        si canal4.+0 != 0 :
                            AIL_start_sequence(pilote=canal4.+0→4, séquence=v3376)                    ⟨270290⟩
                            AIL_set_relative_volume_30C66(canal4.+0→4, v3376, v338, v340)             ⟨270297⟩
                    si v16 != 0 :
                        Scene_Tick(scène=scène5)                                                      ⟨270311⟩
                        v350 = 0                                                                      ⟨270313⟩
                        v344 = 0                                                                      ⟨270316⟩
                        charge(mid15voc 1)                                                            ⟨270323⟩
                        tête_voix(tête=c18, ressource=mid15voc 1, cadence=9)                          ⟨270329⟩
                        v352 = 0                                                                      ⟨270331⟩
                        tant que v352 < 3 :
                            Scene_Tick(scène=scène5)                                                  ⟨270338⟩
                            v352 = v352 + 1                                                           ⟨270340⟩
                        tant que tête_parle(tête=c18) != 0 :
                            si di == 0 :
                                CRT_Rand()                                                            ⟨270351⟩
                                si (CRT_Rand()·7) / 32768 == 0 :
                                    di = -1                                                           ⟨270359⟩
                                sinon :
                                    si di == -1 :
                                        di = 1                                                        ⟨270367⟩
                                    sinon :
                                        si di == 1 :
                                            di = 0                                                    ⟨270374⟩
                            sinon :
                                si di == -1 :
                                    di = 1                                                            ⟨270367⟩
                                sinon :
                                    si di == 1 :
                                        di = 0                                                        ⟨270374⟩
                            déplace(calque=c17, dx=0, dy=di)                                          ⟨270383⟩
                            déplace(calque=c18, dx=0, dy=di)                                          ⟨270390⟩
                            déplace(calque=c19, dx=0, dy=di)                                          ⟨270397⟩
                            Scene_Tick(scène=scène5)                                                  ⟨270411⟩
                        v352 = 0                                                                      ⟨270425⟩
                        tant que v352 < 4 :
                            si di == 0 :
                                CRT_Rand()                                                            ⟨270432⟩
                                si (CRT_Rand()·7) / 32768 == 0 :
                                    di = -1                                                           ⟨270440⟩
                                sinon :
                                    si di == -1 :
                                        di = 1                                                        ⟨270448⟩
                                    sinon :
                                        si di == 1 :
                                            di = 0                                                    ⟨270455⟩
                            sinon :
                                si di == -1 :
                                    di = 1                                                            ⟨270448⟩
                                sinon :
                                    si di == 1 :
                                        di = 0                                                        ⟨270455⟩
                            déplace(calque=c17, dx=0, dy=di)                                          ⟨270464⟩
                            déplace(calque=c18, dx=0, dy=di)                                          ⟨270471⟩
                            déplace(calque=c19, dx=0, dy=di)                                          ⟨270478⟩
                            Scene_Tick(scène=scène5)                                                  ⟨270492⟩
                            v352 = v352 + 1                                                           ⟨270494⟩
                        v350 = 0                                                                      ⟨270520⟩
                        v344 = 0                                                                      ⟨270522⟩
                    sinon :
                        Widget_Method_DispatchC_314CB(zone1, 0)                                       ⟨270530⟩
                        Widget_Method_Dispatch8_314A9(zone1, 127)                                     ⟨270535⟩
                        v10 = 70                                                                      ⟨270537⟩
                        si = scène5.compteur                                                          ⟨270538⟩
                        v8 = si + ((v10·70) / 100)                                                    ⟨270547⟩
                        tant que (scène5.compteur < v8) et (scène5.terminée == 0) :
                            v342 = scène5.compteur                                                    ⟨270553⟩
                            si di == 0 :
                                CRT_Rand()                                                            ⟨270556⟩
                                si (CRT_Rand()·7) / 32768 == 0 :
                                    di = -1                                                           ⟨270564⟩
                                sinon :
                                    si di == -1 :
                                        di = 1                                                        ⟨270572⟩
                                    sinon :
                                        si di == 1 :
                                            di = 0                                                    ⟨270579⟩
                            sinon :
                                si di == -1 :
                                    di = 1                                                            ⟨270572⟩
                                sinon :
                                    si di == 1 :
                                        di = 0                                                        ⟨270579⟩
                            déplace(calque=c17, dx=0, dy=di)                                          ⟨270588⟩
                            déplace(calque=c18, dx=0, dy=di)                                          ⟨270595⟩
                            déplace(calque=c19, dx=0, dy=di)                                          ⟨270602⟩
                            si si + 4 == v342 :
                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])          ⟨270616⟩
                            si si + 4 == v342 :
                                tête_texte_de_lèvres(tête=c18, texte="thtdpnshwrsnablyurwlngtbmlv")   ⟨270626⟩
                            si v8 - 1 == v342 :
                                v3438 = 4540                                                          ⟨270634⟩
                                v3438 = 4552                                                          ⟨270635⟩
                                v3438 = 4568                                                          ⟨270636⟩
                                v3438 = 4584                                                          ⟨270637⟩
                                v3438 = 4604                                                          ⟨270638⟩
                                Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨270648⟩
                            Scene_Tick(scène=scène5)                                                  ⟨270680⟩
                    si v17 != 0 :
                        canal_arrête(canal=canal4)                                                    ⟨270711⟩
                    v330 = 0                                                                          ⟨270731⟩
                    v324 = 0                                                                          ⟨270733⟩
                    Scene_Destruct(scène=scène5, drapeaux=0)                                          ⟨270737⟩
                    si byte_495FC == 0 :

                        ──── scène6 ────
                        scène6 = Scene_Create(cadence=10, palette=255, surface=&v472)                 ⟨270751⟩
                        c20 = Layer(ressource=optshps 116, x=0, y=-57)                                ⟨270758⟩
                        v330 = 0                                                                      ⟨270761⟩
                        v324 = 0                                                                      ⟨270764⟩
                        charge_convdata_type0("air", drapeau=3)                                       ⟨270769⟩
                        c21 = Layer(ressource=midgames 4, x=0, y=0)                                   ⟨270776⟩
                        c22 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)       ⟨270784⟩
                        c23 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)     ⟨270793⟩
                        palette_copie(destination=pal1, source=pal2(optpals 21))                      ⟨270803⟩
                        palette_copie(destination=pal1, source=pal7(midgames 6))                      ⟨270812⟩
                        palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))        ⟨270821⟩
                        palette_envoie(palette=pal1, pas=0)                                           ⟨270833⟩
                        ajoute c20 à scène6                                                           ⟨270838⟩
                        ajoute c21 à scène6                                                           ⟨270843⟩
                        ajoute c22 à scène6                                                           ⟨270848⟩
                        ajoute c23 à scène6                                                           ⟨270853⟩
                        di = 0                                                                        ⟨270855⟩
                        si v17 != 0 :
                            charge(asoundfx 5)                                                        ⟨270868⟩
                            canal_init(canal=canal5, pilote=word_46849)                               ⟨270873⟩
                            canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)                 ⟨270880⟩
                            v338 = word_48EAC                                                         ⟨270883⟩
                            v340 = 0                                                                  ⟨270884⟩
                            si canal5.+0 != 0 :
                                AIL_start_sequence(pilote=canal5.+0→4, séquence=v3390)                ⟨270890⟩
                                AIL_set_relative_volume_30C66(canal5.+0→4, v3390, v338, v340)         ⟨270897⟩
                        v10 = 32                                                                      ⟨270903⟩
                        si = scène6.compteur                                                          ⟨270904⟩
                        v8 = si + ((v10·70) / 100)                                                    ⟨270913⟩
                        tant que (scène6.compteur < v8) et (scène6.terminée == 0) :
                            v342 = scène6.compteur                                                    ⟨270919⟩
                            si di == 0 :
                                CRT_Rand()                                                            ⟨270922⟩
                                si (CRT_Rand()·7) / 32768 == 0 :
                                    di = -1                                                           ⟨270930⟩
                                sinon :
                                    si di == -1 :
                                        di = 1                                                        ⟨270938⟩
                                    sinon :
                                        si di == 1 :
                                            di = 0                                                    ⟨270945⟩
                            sinon :
                                si di == -1 :
                                    di = 1                                                            ⟨270938⟩
                                sinon :
                                    si di == 1 :
                                        di = 0                                                        ⟨270945⟩
                            déplace(calque=c21, dx=0, dy=di)                                          ⟨270954⟩
                            déplace(calque=c22, dx=0, dy=di)                                          ⟨270961⟩
                            déplace(calque=c23, dx=0, dy=di)                                          ⟨270968⟩
                            si si + 5 == v342 :
                                tête_image_de_base(tête=c22, image=18)                                ⟨270976⟩
                            si si + 9 == v342 :
                                tête_image_de_base(tête=c22, image=25)                                ⟨270986⟩
                            si si + 11 == v342 :
                                tête_image_de_base(tête=c22, image=31)                                ⟨270996⟩
                            Scene_Tick(scène=scène6)                                                  ⟨271012⟩
                        si v17 != 0 :
                            canal_arrête(canal=canal5)                                                ⟨271043⟩
                        v330 = 0                                                                      ⟨271063⟩
                        v324 = 0                                                                      ⟨271065⟩
                        Scene_Destruct(scène=scène6, drapeaux=0)                                      ⟨271069⟩
                        si byte_495FC == 0 :
                            si v17 != 0 :
                                charge(asoundfx 97)                                                   ⟨271099⟩
                                canal_init(canal=canal1, pilote=word_46849)                           ⟨271104⟩
                                canal_enregistre(canal=canal1, ressource=asoundfx 97, x=0)            ⟨271111⟩
                                v330 = word_48F64                                                     ⟨271114⟩
                                v332 = 0                                                              ⟨271115⟩
                                si canal1.+0 != 0 :
                                    AIL_start_sequence(pilote=canal1.+0→4, séquence=v3404)            ⟨271121⟩
                                    AIL_set_relative_volume_30C66(canal1.+0→4, v3404, v330, v332)     ⟨271128⟩
                            charge(mid15 6)                                                           ⟨271144⟩
                            charge(mid15 10)                                                          ⟨271156⟩

                            ──── scène7 ────
                            scène7 = Scene_Create(cadence=10, palette=255, surface=&v472)             ⟨271164⟩
                            c24 = Layer(ressource=optshps 116, x=0, y=-24)                            ⟨271171⟩
                            c25 = Layer(ressource=mid15 1, x=0, y=-24)                                ⟨271179⟩
                            c26 = Layer(ressource=mid15 5, x=0, y=-24)                                ⟨271187⟩
                            c27 = Layer(ressource=mid15 6, x=0, y=-24)                                ⟨271195⟩
                            di = c27                                                                  ⟨271197⟩
                            c28 = Layer(ressource=mid15 10, x=0, y=-24)                               ⟨271203⟩
                            palette_copie(destination=pal1, source=pal4(mid15 11))                    ⟨271213⟩
                            palette_copie(destination=pal1, source=pal2(optpals 21))                  ⟨271222⟩
                            ajoute c24 à scène7                                                       ⟨271227⟩
                            ajoute c26 à scène7                                                       ⟨271232⟩
                            ajoute c25 à scène7                                                       ⟨271237⟩
                            ajoute c27 à scène7                                                       ⟨271242⟩
                            ajoute c28 à scène7                                                       ⟨271247⟩
                            palette_envoie(palette=pal1, pas=0)                                       ⟨271259⟩
                            Widget_Method_DispatchC_314CB(zone1, 0)                                   ⟨271264⟩
                            Widget_Method_Dispatch8_314A9(zone1, 254)                                 ⟨271269⟩
                            v362 = 0                                                                  ⟨271271⟩
                            v364 = 0                                                                  ⟨271272⟩
                            v366 = 0                                                                  ⟨271273⟩
                            v368 = 0                                                                  ⟨271274⟩
                            v10 = 52                                                                  ⟨271275⟩
                            si = scène7.compteur                                                      ⟨271276⟩
                            v8 = si + ((v10·70) / 100)                                                ⟨271285⟩
                            tant que (scène7.compteur < v8) et (scène7.terminée == 0) :
                                v370 = scène7.compteur                                                ⟨271291⟩
                                c26.image = v362                                                      ⟨271296⟩
                                v362_avant = v362                                                     ⟨271297⟩
                                v362_avant = v362                                                     ⟨271297⟩
                                v362 = v362 + 1                                                       ⟨271297⟩
                                si v362 > 30 :
                                    v362_avant = v362                                                 ⟨271301⟩
                                    v362 = 0                                                          ⟨271301⟩
                                v374 = v364                                                           ⟨271305⟩
                                c25.image = v374                                                      ⟨271308⟩
                                v364 = v364 + 1                                                       ⟨271309⟩
                                si v364 > 26 :
                                    v364_avant = v364                                                 ⟨271313⟩
                                    v364 = 0                                                          ⟨271313⟩
                                si v8 - 35 < v370 :
                                    v366 = v366 + 1                                                   ⟨271320⟩
                                    si v366 > 27 :
                                        déplace(calque=c27, dx=-1, dy=0)                              ⟨271328⟩
                                        v366 = 27                                                     ⟨271330⟩
                                    v376 = v366                                                       ⟨271334⟩
                                    c27.image = v376                                                  ⟨271336⟩
                                si v8 - 23 < v370 :
                                    v368 = v368 + 1                                                   ⟨271343⟩
                                    si v368 > 15 :
                                        si v370 & 1 != 0 :
                                            déplace(calque=c28, dx=1, dy=0)                           ⟨271354⟩
                                        v368 = 15                                                     ⟨271358⟩
                                    v378 = v368                                                       ⟨271362⟩
                                    c28.image = v378                                                  ⟨271365⟩
                                si v8 - 1 == v370 :
                                    v3452 = 4540                                                      ⟨271372⟩
                                    v3452 = 4552                                                      ⟨271373⟩
                                    v3452 = 4568                                                      ⟨271374⟩
                                    v3452 = 4584                                                      ⟨271375⟩
                                    v3452 = 4604                                                      ⟨271376⟩
                                    Primitive_SetRectColorAndDraw_2CBE5(&v3452, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨271386⟩
                                Scene_Tick(scène=scène7)                                              ⟨271418⟩
                            Scene_Destruct(scène=scène7, drapeaux=0)                                  ⟨271448⟩
                            v352 = 0                                                                  ⟨271466⟩
                            v346 = 0                                                                  ⟨271468⟩
                            canal_arrête(canal=canal1)                                                ⟨271490⟩
                            v3402 = 0                                                                 ⟨271508⟩
                            v3396 = 0                                                                 ⟨271510⟩
                            v328 = 0                                                                  ⟨271527⟩
                            v322 = 0                                                                  ⟨271529⟩
                            si byte_495FC == 0 :

                                ──── scène8 ────
                                scène8 = Scene_Create(cadence=10, palette=255, surface=&v472)         ⟨271542⟩
                                c29 = Layer(ressource=optshps 116, x=0, y=-57)                        ⟨271549⟩
                                v330 = 0                                                              ⟨271552⟩
                                v324 = 0                                                              ⟨271555⟩
                                charge_convdata_type0("janet", drapeau=3)                             ⟨271560⟩
                                c30 = Layer(ressource=mid15 7, x=0, y=0)                              ⟨271567⟩
                                c31 = TalkingHeadOverlay(ressource=convdata type 0 "janet", x=160, y=129)  ⟨271575⟩
                                c32 = ImageLayer(ressource=convdata type 0 "janet", x=160, y=129, image=51)  ⟨271584⟩
                                palette_copie(destination=pal1, source=pal2(optpals 21))              ⟨271594⟩
                                palette_copie(destination=pal1, source=pal6(mid15 14))                ⟨271603⟩
                                palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨271612⟩
                                palette_envoie(palette=pal1, pas=0)                                   ⟨271624⟩
                                ajoute c29 à scène8                                                   ⟨271629⟩
                                ajoute c30 à scène8                                                   ⟨271634⟩
                                ajoute c31 à scène8                                                   ⟨271639⟩
                                ajoute c32 à scène8                                                   ⟨271644⟩
                                tête_image_de_base(tête=c31, image=14)                                ⟨271648⟩
                                di = 0                                                                ⟨271650⟩
                                si v17 != 0 :
                                    charge(asoundfx 24)                                               ⟨271663⟩
                                    canal_init(canal=canal4, pilote=word_46849)                       ⟨271668⟩
                                    canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)        ⟨271675⟩
                                    v338 = word_48ED2                                                 ⟨271678⟩
                                    v340 = 0                                                          ⟨271679⟩
                                    si canal4.+0 != 0 :
                                        AIL_start_sequence(pilote=canal4.+0→4, séquence=v3376)        ⟨271685⟩
                                        AIL_set_relative_volume_30C66(canal4.+0→4, v3376, v338, v340)  ⟨271692⟩
                                si v16 != 0 :
                                    Scene_Tick(scène=scène8)                                          ⟨271706⟩
                                    charge(mid15voc 2)                                                ⟨271718⟩
                                    tête_voix(tête=c31, ressource=mid15voc 2, cadence=9)              ⟨271724⟩
                                    v352 = 0                                                          ⟨271726⟩
                                    tant que v352 < 3 :
                                        Scene_Tick(scène=scène8)                                      ⟨271733⟩
                                        v352 = v352 + 1                                               ⟨271735⟩
                                    tant que tête_parle(tête=c31) != 0 :
                                        si di == 0 :
                                            CRT_Rand()                                                ⟨271746⟩
                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                di = -1                                               ⟨271754⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨271762⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨271769⟩
                                        sinon :
                                            si di == -1 :
                                                di = 1                                                ⟨271762⟩
                                            sinon :
                                                si di == 1 :
                                                    di = 0                                            ⟨271769⟩
                                        déplace(calque=c30, dx=0, dy=di)                              ⟨271778⟩
                                        déplace(calque=c31, dx=0, dy=di)                              ⟨271785⟩
                                        déplace(calque=c32, dx=0, dy=di)                              ⟨271792⟩
                                        Scene_Tick(scène=scène8)                                      ⟨271806⟩
                                    v352 = 0                                                          ⟨271820⟩
                                    tant que v352 < 8 :
                                        si di == 0 :
                                            CRT_Rand()                                                ⟨271827⟩
                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                di = -1                                               ⟨271835⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨271843⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨271850⟩
                                        sinon :
                                            si di == -1 :
                                                di = 1                                                ⟨271843⟩
                                            sinon :
                                                si di == 1 :
                                                    di = 0                                            ⟨271850⟩
                                        déplace(calque=c30, dx=0, dy=di)                              ⟨271859⟩
                                        déplace(calque=c31, dx=0, dy=di)                              ⟨271866⟩
                                        déplace(calque=c32, dx=0, dy=di)                              ⟨271873⟩
                                        Scene_Tick(scène=scène8)                                      ⟨271887⟩
                                        v352 = v352 + 1                                               ⟨271889⟩
                                    v350 = 0                                                          ⟨271915⟩
                                    v344 = 0                                                          ⟨271917⟩
                                sinon :
                                    Widget_Method_DispatchC_314CB(zone1, 0)                           ⟨271925⟩
                                    Widget_Method_Dispatch8_314A9(zone1, 127)                         ⟨271930⟩
                                    v10 = 47                                                          ⟨271932⟩
                                    si = scène8.compteur                                              ⟨271933⟩
                                    v8 = si + ((v10·70) / 100)                                        ⟨271942⟩
                                    tant que (scène8.compteur < v8) et (scène8.terminée == 0) :
                                        si di == 0 :
                                            CRT_Rand()                                                ⟨271951⟩
                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                di = -1                                               ⟨271959⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨271967⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨271974⟩
                                        sinon :
                                            si di == -1 :
                                                di = 1                                                ⟨271967⟩
                                            sinon :
                                                si di == 1 :
                                                    di = 0                                            ⟨271974⟩
                                        déplace(calque=c30, dx=0, dy=di)                              ⟨271983⟩
                                        déplace(calque=c31, dx=0, dy=di)                              ⟨271990⟩
                                        déplace(calque=c32, dx=0, dy=di)                              ⟨271997⟩
                                        si si + 6 == scène8.compteur :
                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[7])  ⟨272011⟩
                                        si si + 2 == scène8.compteur :
                                            tête_texte_de_lèvres(tête=c31, texte="thchesisyrs")       ⟨272021⟩
                                        si v8 - 1 == scène8.compteur :
                                            v3438 = 4540                                              ⟨272029⟩
                                            v3438 = 4552                                              ⟨272030⟩
                                            v3438 = 4568                                              ⟨272031⟩
                                            v3438 = 4584                                              ⟨272032⟩
                                            v3438 = 4604                                              ⟨272033⟩
                                            Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨272043⟩
                                        Scene_Tick(scène=scène8)                                      ⟨272075⟩
                                    v10 = 55                                                          ⟨272102⟩
                                    si = scène8.compteur                                              ⟨272103⟩
                                    v8 = si + ((v10·70) / 100)                                        ⟨272112⟩
                                    tant que (scène8.compteur < v8) et (scène8.terminée == 0) :
                                        si di == 0 :
                                            CRT_Rand()                                                ⟨272121⟩
                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                di = -1                                               ⟨272129⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨272137⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨272144⟩
                                        sinon :
                                            si di == -1 :
                                                di = 1                                                ⟨272137⟩
                                            sinon :
                                                si di == 1 :
                                                    di = 0                                            ⟨272144⟩
                                        déplace(calque=c30, dx=0, dy=di)                              ⟨272153⟩
                                        déplace(calque=c31, dx=0, dy=di)                              ⟨272160⟩
                                        déplace(calque=c32, dx=0, dy=di)                              ⟨272167⟩
                                        si si + 2 == scène8.compteur :
                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])  ⟨272180⟩
                                        si si + 2 == scène8.compteur :
                                            tête_texte_de_lèvres(tête=c31, texte="Ethrhdduestndldatourarstip")  ⟨272190⟩
                                        si v8 - 1 == scène8.compteur :
                                            v3438 = 4540                                              ⟨272198⟩
                                            v3438 = 4552                                              ⟨272199⟩
                                            v3438 = 4568                                              ⟨272200⟩
                                            v3438 = 4584                                              ⟨272201⟩
                                            v3438 = 4604                                              ⟨272202⟩
                                            Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨272212⟩
                                        Scene_Tick(scène=scène8)                                      ⟨272244⟩
                                    v10 = 50                                                          ⟨272271⟩
                                    si = scène8.compteur                                              ⟨272272⟩
                                    v8 = si + ((v10·70) / 100)                                        ⟨272281⟩
                                    tant que (scène8.compteur < v8) et (scène8.terminée == 0) :
                                        si di == 0 :
                                            CRT_Rand()                                                ⟨272290⟩
                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                di = -1                                               ⟨272298⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨272306⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨272313⟩
                                        sinon :
                                            si di == -1 :
                                                di = 1                                                ⟨272306⟩
                                            sinon :
                                                si di == 1 :
                                                    di = 0                                            ⟨272313⟩
                                        si si + 2 == scène8.compteur :
                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[9])  ⟨272329⟩
                                        si si + 2 == scène8.compteur :
                                            tête_texte_de_lèvres(tête=c31, texte="orwlblwuotovdasky")  ⟨272339⟩
                                        si v8 - 1 == scène8.compteur :
                                            v3438 = 4540                                              ⟨272347⟩
                                            v3438 = 4552                                              ⟨272348⟩
                                            v3438 = 4568                                              ⟨272349⟩
                                            v3438 = 4584                                              ⟨272350⟩
                                            v3438 = 4604                                              ⟨272351⟩
                                            Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨272361⟩
                                        Scene_Tick(scène=scène8)                                      ⟨272393⟩
                                si v17 != 0 :
                                    canal_arrête(canal=canal4)                                        ⟨272424⟩
                                v330 = 0                                                              ⟨272444⟩
                                v324 = 0                                                              ⟨272446⟩
                                Scene_Destruct(scène=scène8, drapeaux=0)                              ⟨272450⟩
                                si byte_495FC == 0 :

                                    ──── scène9 ────
                                    scène9 = Scene_Create(cadence=10, palette=255, surface=&v472)     ⟨272464⟩
                                    c33 = Layer(ressource=optshps 116, x=0, y=-67)                    ⟨272471⟩
                                    v330 = 0                                                          ⟨272474⟩
                                    v324 = 0                                                          ⟨272477⟩
                                    charge_convdata_type0("air", drapeau=3)                           ⟨272482⟩
                                    c34 = Layer(ressource=midgames 4, x=0, y=0)                       ⟨272489⟩
                                    c35 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)  ⟨272497⟩
                                    c36 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)  ⟨272506⟩
                                    palette_copie(destination=pal1, source=pal2(optpals 21))          ⟨272516⟩
                                    palette_copie(destination=pal1, source=pal7(midgames 6))          ⟨272525⟩
                                    palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨272534⟩
                                    palette_envoie(palette=pal1, pas=0)                               ⟨272546⟩
                                    ajoute c33 à scène9                                               ⟨272551⟩
                                    ajoute c34 à scène9                                               ⟨272556⟩
                                    ajoute c35 à scène9                                               ⟨272561⟩
                                    ajoute c36 à scène9                                               ⟨272566⟩
                                    tête_image_de_base(tête=c35, image=25)                            ⟨272570⟩
                                    di = 0                                                            ⟨272572⟩
                                    si v17 != 0 :
                                        charge(asoundfx 5)                                            ⟨272585⟩
                                        canal_init(canal=canal5, pilote=word_46849)                   ⟨272590⟩
                                        canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)     ⟨272597⟩
                                        v338 = word_48EAC                                             ⟨272600⟩
                                        v340 = 0                                                      ⟨272601⟩
                                        si canal5.+0 != 0 :
                                            AIL_start_sequence(pilote=canal5.+0→4, séquence=v3390)    ⟨272607⟩
                                            AIL_set_relative_volume_30C66(canal5.+0→4, v3390, v338, v340)  ⟨272614⟩
                                    si v16 != 0 :
                                        Scene_Tick(scène=scène9)                                      ⟨272628⟩
                                        v350 = 0                                                      ⟨272630⟩
                                        v344 = 0                                                      ⟨272633⟩
                                        charge(mid15voc 12)                                           ⟨272640⟩
                                        tête_voix(tête=c35, ressource=mid15voc 12, cadence=9)         ⟨272646⟩
                                        v352 = 0                                                      ⟨272648⟩
                                        tant que v352 < 3 :
                                            Scene_Tick(scène=scène9)                                  ⟨272655⟩
                                            v352 = v352 + 1                                           ⟨272657⟩
                                        tant que tête_parle(tête=c35) != 0 :
                                            si di == 0 :
                                                CRT_Rand()                                            ⟨272668⟩
                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                    di = -1                                           ⟨272676⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨272684⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨272691⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨272684⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨272691⟩
                                            déplace(calque=c34, dx=0, dy=di)                          ⟨272700⟩
                                            déplace(calque=c35, dx=0, dy=di)                          ⟨272707⟩
                                            déplace(calque=c36, dx=0, dy=di)                          ⟨272714⟩
                                            Scene_Tick(scène=scène9)                                  ⟨272728⟩
                                        v352 = 0                                                      ⟨272742⟩
                                        tant que v352 < 8 :
                                            si di == 0 :
                                                CRT_Rand()                                            ⟨272749⟩
                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                    di = -1                                           ⟨272757⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨272765⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨272772⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨272765⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨272772⟩
                                            déplace(calque=c34, dx=0, dy=di)                          ⟨272781⟩
                                            déplace(calque=c35, dx=0, dy=di)                          ⟨272788⟩
                                            déplace(calque=c36, dx=0, dy=di)                          ⟨272795⟩
                                            Scene_Tick(scène=scène9)                                  ⟨272809⟩
                                            v352 = v352 + 1                                           ⟨272811⟩
                                        v350 = 0                                                      ⟨272837⟩
                                        v344 = 0                                                      ⟨272839⟩
                                    sinon :
                                        Widget_Method_DispatchC_314CB(zone1, 0)                       ⟨272847⟩
                                        Widget_Method_Dispatch8_314A9(zone1, 127)                     ⟨272852⟩
                                        v10 = 45                                                      ⟨272854⟩
                                        si = scène9.compteur                                          ⟨272855⟩
                                        v8 = si + ((v10·70) / 100)                                    ⟨272864⟩
                                        tant que (scène9.compteur < v8) et (scène9.terminée == 0) :
                                            si di == 0 :
                                                CRT_Rand()                                            ⟨272873⟩
                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                    di = -1                                           ⟨272881⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨272889⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨272896⟩
                                            sinon :
                                                si di == -1 :
                                                    di = 1                                            ⟨272889⟩
                                                sinon :
                                                    si di == 1 :
                                                        di = 0                                        ⟨272896⟩
                                            déplace(calque=c34, dx=0, dy=di)                          ⟨272905⟩
                                            déplace(calque=c35, dx=0, dy=di)                          ⟨272912⟩
                                            déplace(calque=c36, dx=0, dy=di)                          ⟨272919⟩
                                            si si + 2 == scène9.compteur :
                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[10])  ⟨272933⟩
                                            si si + 2 == scène9.compteur :
                                                tête_texte_de_lèvres(tête=c35, texte="watthelzgongonher")  ⟨272943⟩
                                            si v8 - 1 == scène9.compteur :
                                                v3438 = 4540                                          ⟨272951⟩
                                                v3438 = 4552                                          ⟨272952⟩
                                                v3438 = 4568                                          ⟨272953⟩
                                                v3438 = 4584                                          ⟨272954⟩
                                                v3438 = 4604                                          ⟨272955⟩
                                                Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨272965⟩
                                            Scene_Tick(scène=scène9)                                  ⟨272997⟩
                                    si v17 != 0 :
                                        canal_arrête(canal=canal5)                                    ⟨273028⟩
                                    v330 = 0                                                          ⟨273048⟩
                                    v324 = 0                                                          ⟨273050⟩
                                    Scene_Destruct(scène=scène9, drapeaux=0)                          ⟨273054⟩
                                    si byte_495FC == 0 :

                                        ──── scène10 ────
                                        scène10 = Scene_Create(cadence=10, palette=255, surface=&v472)  ⟨273068⟩
                                        c37 = Layer(ressource=optshps 116, x=0, y=-57)                ⟨273075⟩
                                        v330 = 0                                                      ⟨273078⟩
                                        v324 = 0                                                      ⟨273081⟩
                                        charge_convdata_type0("janet", drapeau=3)                     ⟨273086⟩
                                        c38 = Layer(ressource=mid15 7, x=0, y=0)                      ⟨273093⟩
                                        c39 = TalkingHeadOverlay(ressource=convdata type 0 "janet", x=160, y=129)  ⟨273101⟩
                                        c40 = ImageLayer(ressource=convdata type 0 "janet", x=160, y=129, image=51)  ⟨273110⟩
                                        c39.+2130 = 0                                                 ⟨273114⟩
                                        palette_copie(destination=pal1, source=pal2(optpals 21))      ⟨273122⟩
                                        palette_copie(destination=pal1, source=pal6(mid15 14))        ⟨273131⟩
                                        palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨273140⟩
                                        palette_envoie(palette=pal1, pas=0)                           ⟨273152⟩
                                        ajoute c37 à scène10                                          ⟨273157⟩
                                        ajoute c38 à scène10                                          ⟨273162⟩
                                        ajoute c39 à scène10                                          ⟨273167⟩
                                        ajoute c40 à scène10                                          ⟨273172⟩
                                        di = 0                                                        ⟨273174⟩
                                        si v17 != 0 :
                                            charge(asoundfx 24)                                       ⟨273187⟩
                                            canal_init(canal=canal4, pilote=word_46849)               ⟨273192⟩
                                            canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)  ⟨273199⟩
                                            v338 = word_48ED2                                         ⟨273202⟩
                                            v340 = 0                                                  ⟨273203⟩
                                            si canal4.+0 != 0 :
                                                AIL_start_sequence(pilote=canal4.+0→4, séquence=v3376)  ⟨273209⟩
                                                AIL_set_relative_volume_30C66(canal4.+0→4, v3376, v338, v340)  ⟨273216⟩
                                        si v16 != 0 :
                                            Scene_Tick(scène=scène10)                                 ⟨273230⟩
                                            v350 = 0                                                  ⟨273232⟩
                                            v344 = 0                                                  ⟨273235⟩
                                            charge(mid15voc 3)                                        ⟨273242⟩
                                            tête_voix(tête=c39, ressource=mid15voc 3, cadence=9)      ⟨273248⟩
                                            v352 = 0                                                  ⟨273250⟩
                                            tant que v352 < 3 :
                                                Scene_Tick(scène=scène10)                             ⟨273257⟩
                                                v352 = v352 + 1                                       ⟨273259⟩
                                            tant que tête_parle(tête=c39) != 0 :
                                                si di == 0 :
                                                    CRT_Rand()                                        ⟨273270⟩
                                                    si (CRT_Rand()·7) / 32768 == 0 :
                                                        di = -1                                       ⟨273278⟩
                                                    sinon :
                                                        si di == -1 :
                                                            di = 1                                    ⟨273286⟩
                                                        sinon :
                                                            si di == 1 :
                                                                di = 0                                ⟨273293⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨273286⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨273293⟩
                                                déplace(calque=c38, dx=0, dy=di)                      ⟨273302⟩
                                                déplace(calque=c39, dx=0, dy=di)                      ⟨273309⟩
                                                déplace(calque=c40, dx=0, dy=di)                      ⟨273316⟩
                                                Scene_Tick(scène=scène10)                             ⟨273330⟩
                                            v352 = 0                                                  ⟨273344⟩
                                            tant que v352 < 3 :
                                                si di == 0 :
                                                    CRT_Rand()                                        ⟨273351⟩
                                                    si (CRT_Rand()·7) / 32768 == 0 :
                                                        di = -1                                       ⟨273359⟩
                                                    sinon :
                                                        si di == -1 :
                                                            di = 1                                    ⟨273367⟩
                                                        sinon :
                                                            si di == 1 :
                                                                di = 0                                ⟨273374⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨273367⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨273374⟩
                                                déplace(calque=c38, dx=0, dy=di)                      ⟨273383⟩
                                                déplace(calque=c39, dx=0, dy=di)                      ⟨273390⟩
                                                déplace(calque=c40, dx=0, dy=di)                      ⟨273397⟩
                                                Scene_Tick(scène=scène10)                             ⟨273411⟩
                                                v352 = v352 + 1                                       ⟨273413⟩
                                            v350 = 0                                                  ⟨273439⟩
                                            v344 = 0                                                  ⟨273441⟩
                                        sinon :
                                            Widget_Method_DispatchC_314CB(zone1, 0)                   ⟨273449⟩
                                            Widget_Method_Dispatch8_314A9(zone1, 127)                 ⟨273454⟩
                                            v10 = 60                                                  ⟨273456⟩
                                            si = scène10.compteur                                     ⟨273457⟩
                                            v8 = si + ((v10·70) / 100)                                ⟨273466⟩
                                            tant que (scène10.compteur < v8) et (scène10.terminée == 0) :
                                                si di == 0 :
                                                    CRT_Rand()                                        ⟨273475⟩
                                                    si (CRT_Rand()·7) / 32768 == 0 :
                                                        di = -1                                       ⟨273483⟩
                                                    sinon :
                                                        si di == -1 :
                                                            di = 1                                    ⟨273491⟩
                                                        sinon :
                                                            si di == 1 :
                                                                di = 0                                ⟨273498⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨273491⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨273498⟩
                                                déplace(calque=c38, dx=0, dy=di)                      ⟨273507⟩
                                                déplace(calque=c39, dx=0, dy=di)                      ⟨273514⟩
                                                déplace(calque=c40, dx=0, dy=di)                      ⟨273521⟩
                                                si si + 2 == scène10.compteur :
                                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[11])  ⟨273535⟩
                                                si si + 2 == scène10.compteur :
                                                    tête_texte_de_lèvres(tête=c39, texte="Itldjewasmllyerlrdrlngn")  ⟨273545⟩
                                                si v8 - 1 == scène10.compteur :
                                                    v3438 = 4540                                      ⟨273553⟩
                                                    v3438 = 4552                                      ⟨273554⟩
                                                    v3438 = 4568                                      ⟨273555⟩
                                                    v3438 = 4584                                      ⟨273556⟩
                                                    v3438 = 4604                                      ⟨273557⟩
                                                    Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨273567⟩
                                                Scene_Tick(scène=scène10)                             ⟨273599⟩
                                            v10 = 58                                                  ⟨273626⟩
                                            si = scène10.compteur                                     ⟨273627⟩
                                            v8 = si + ((v10·70) / 100)                                ⟨273636⟩
                                            tant que (scène10.compteur < v8) et (scène10.terminée == 0) :
                                                si di == 0 :
                                                    CRT_Rand()                                        ⟨273645⟩
                                                    si (CRT_Rand()·7) / 32768 == 0 :
                                                        di = -1                                       ⟨273653⟩
                                                    sinon :
                                                        si di == -1 :
                                                            di = 1                                    ⟨273661⟩
                                                        sinon :
                                                            si di == 1 :
                                                                di = 0                                ⟨273668⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨273661⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨273668⟩
                                                déplace(calque=c38, dx=0, dy=di)                      ⟨273677⟩
                                                déplace(calque=c39, dx=0, dy=di)                      ⟨273684⟩
                                                déplace(calque=c40, dx=0, dy=di)                      ⟨273691⟩
                                                si si + 2 == scène10.compteur :
                                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[12])  ⟨273705⟩
                                                si si + 2 == scène10.compteur :
                                                    tête_texte_de_lèvres(tête=c39, texte="Idndlvdajaklz btnotobewthjeu")  ⟨273715⟩
                                                si v8 - 1 == scène10.compteur :
                                                    v3438 = 4540                                      ⟨273723⟩
                                                    v3438 = 4552                                      ⟨273724⟩
                                                    v3438 = 4568                                      ⟨273725⟩
                                                    v3438 = 4584                                      ⟨273726⟩
                                                    v3438 = 4604                                      ⟨273727⟩
                                                    Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨273737⟩
                                                Scene_Tick(scène=scène10)                             ⟨273769⟩
                                            v10 = 90                                                  ⟨273796⟩
                                            si = scène10.compteur                                     ⟨273797⟩
                                            v8 = si + ((v10·70) / 100)                                ⟨273806⟩
                                            tant que (scène10.compteur < v8) et (scène10.terminée == 0) :
                                                si di == 0 :
                                                    CRT_Rand()                                        ⟨273815⟩
                                                    si (CRT_Rand()·7) / 32768 == 0 :
                                                        di = -1                                       ⟨273823⟩
                                                    sinon :
                                                        si di == -1 :
                                                            di = 1                                    ⟨273831⟩
                                                        sinon :
                                                            si di == 1 :
                                                                di = 0                                ⟨273838⟩
                                                sinon :
                                                    si di == -1 :
                                                        di = 1                                        ⟨273831⟩
                                                    sinon :
                                                        si di == 1 :
                                                            di = 0                                    ⟨273838⟩
                                                déplace(calque=c38, dx=0, dy=di)                      ⟨273847⟩
                                                déplace(calque=c39, dx=0, dy=di)                      ⟨273854⟩
                                                déplace(calque=c40, dx=0, dy=di)                      ⟨273861⟩
                                                si si + 2 == scène10.compteur :
                                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[13])  ⟨273875⟩
                                                si si + 2 == scène10.compteur :
                                                    tête_texte_de_lèvres(tête=c39, texte="ilftbcsiwntoclctthtbutyagnstmndz")  ⟨273885⟩
                                                si v8 - 1 == scène10.compteur :
                                                    v3438 = 4540                                      ⟨273893⟩
                                                    v3438 = 4552                                      ⟨273894⟩
                                                    v3438 = 4568                                      ⟨273895⟩
                                                    v3438 = 4584                                      ⟨273896⟩
                                                    v3438 = 4604                                      ⟨273897⟩
                                                    Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨273907⟩
                                                Scene_Tick(scène=scène10)                             ⟨273939⟩
                                        si v17 != 0 :
                                            canal_arrête(canal=canal4)                                ⟨273970⟩
                                        v330 = 0                                                      ⟨273990⟩
                                        v324 = 0                                                      ⟨273992⟩
                                        Scene_Destruct(scène=scène10, drapeaux=0)                     ⟨273996⟩
                                        si byte_495FC == 0 :

                                            ──── scène11 ────
                                            scène11 = Scene_Create(cadence=10, palette=255, surface=&v472)  ⟨274010⟩
                                            c41 = Layer(ressource=optshps 116, x=0, y=-47)            ⟨274017⟩
                                            c42 = Layer(ressource=mid15 8, x=0, y=-1)                 ⟨274025⟩
                                            di = c42                                                  ⟨274027⟩
                                            c43 = Layer(ressource=mid15 3, x=0, y=-1)                 ⟨274033⟩
                                            c44 = OverlayImageLayer(ressource=mid15 0, x=0, y=-1, image=1)  ⟨274042⟩
                                            palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨274052⟩
                                            palette_copie(destination=pal1, source=pal3(mid15 15))    ⟨274061⟩
                                            ajoute c41 à scène11                                      ⟨274066⟩
                                            ajoute c42 à scène11                                      ⟨274071⟩
                                            ajoute c43 à scène11                                      ⟨274076⟩
                                            ajoute c44 à scène11                                      ⟨274081⟩
                                            palette_envoie(palette=pal1, pas=0)                       ⟨274093⟩
                                            v326 = 0                                                  ⟨274095⟩
                                            v328 = 3                                                  ⟨274096⟩
                                            v330 = 2                                                  ⟨274097⟩
                                            v332 = 2                                                  ⟨274098⟩
                                            v334 = 0                                                  ⟨274099⟩
                                            si v17 != 0 :
                                                charge(asoundfx 5)                                    ⟨274112⟩
                                                canal_init(canal=canal5, pilote=word_46849)           ⟨274117⟩
                                                canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)  ⟨274124⟩
                                                v336 = word_48EAC - 50                                ⟨274128⟩
                                                v338 = 0                                              ⟨274129⟩
                                                si canal5.+0 != 0 :
                                                    AIL_start_sequence(pilote=canal5.+0→4, séquence=v3390)  ⟨274135⟩
                                                    AIL_set_relative_volume_30C66(canal5.+0→4, v3390, v336, v338)  ⟨274142⟩
                                            si v16 != 0 :
                                                Scene_Tick(scène=scène11)                             ⟨274156⟩
                                                charge(mid15voc 4)                                    ⟨274168⟩
                                                voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid15voc 4)  ⟨274174⟩
                                                v350 = 0                                              ⟨274176⟩
                                                tant que v350 < 4 :
                                                    Scene_Tick(scène=scène11)                         ⟨274183⟩
                                                    v350 = v350 + 1                                   ⟨274185⟩
                                                voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)       ⟨274193⟩
                                                v350 = 0                                              ⟨274195⟩
                                                tant que voix_en_cours(voix=voix1) != 0 :
                                                    si v330 == v332 :
                                                        v350_avant = v350                             ⟨274204⟩
                                                        v350 = v350 + 1                               ⟨274204⟩
                                                        si v350_avant & 1 != 0 :
                                                            v352 = v328                               ⟨274208⟩
                                                            CRT_Rand()                                ⟨274209⟩
                                                            v332 = (CRT_Rand()·v352) / 32768          ⟨274216⟩
                                                        si v332 < v330 :
                                                            v326 = -1                                 ⟨274222⟩
                                                        sinon :
                                                            si v332 == v330 :
                                                                v326 = 0                              ⟨274230⟩
                                                            sinon :
                                                                v326 = 1                              ⟨274235⟩
                                                    déplace(calque=c43, dx=0, dy=v326)                ⟨274244⟩
                                                    déplace(calque=c44, dx=0, dy=v326)                ⟨274251⟩
                                                    v334_avant = v334                                 ⟨274254⟩
                                                    v334 = v334 + 1                                   ⟨274254⟩
                                                    si v334_avant == 1 :
                                                        déplace(calque=c42, dx=-1, dy=0)              ⟨274261⟩
                                                    si v334 == 5 :
                                                        déplace(calque=c42, dx=0, dy=1)               ⟨274271⟩
                                                    si v334 == 8 :
                                                        v334 = 0                                      ⟨274277⟩
                                                    v330 = v330 + v326                                ⟨274281⟩
                                                    Scene_Tick(scène=scène11)                         ⟨274294⟩
                                                v350 = 0                                              ⟨274309⟩
                                                tant que v350 < 4 :
                                                    Scene_Tick(scène=scène11)                         ⟨274316⟩
                                                    v350 = v350 + 1                                   ⟨274318⟩
                                                voix_arrête(voix=voix1)                               ⟨274325⟩
                                                v348 = 0                                              ⟨274343⟩
                                            sinon :
                                                Widget_Method_DispatchC_314CB(zone1, 0)               ⟨274353⟩
                                                Widget_Method_Dispatch8_314A9(zone1, 197)             ⟨274358⟩
                                                v10 = 60                                              ⟨274360⟩
                                                si = scène11.compteur                                 ⟨274361⟩
                                                v8 = si + ((v10·70) / 100)                            ⟨274370⟩
                                                tant que (scène11.compteur < v8) et (scène11.terminée == 0) :
                                                    v340 = scène11.compteur                           ⟨274376⟩
                                                    si v330 == v332 :
                                                        si v340 & 1 != 0 :
                                                            CRT_Rand()                                ⟨274384⟩
                                                            v332 = (CRT_Rand()·v328) / 32768          ⟨274391⟩
                                                        si v332 < v330 :
                                                            v326 = -1                                 ⟨274397⟩
                                                        sinon :
                                                            si v332 == v330 :
                                                                v326 = 0                              ⟨274405⟩
                                                            sinon :
                                                                v326 = 1                              ⟨274410⟩
                                                    déplace(calque=c43, dx=0, dy=v326)                ⟨274419⟩
                                                    déplace(calque=c44, dx=0, dy=v326)                ⟨274426⟩
                                                    v334_avant = v334                                 ⟨274429⟩
                                                    v334 = v334 + 1                                   ⟨274429⟩
                                                    si v334_avant == 1 :
                                                        déplace(calque=c42, dx=-1, dy=0)              ⟨274436⟩
                                                    si v334 == 5 :
                                                        déplace(calque=c42, dx=0, dy=1)               ⟨274446⟩
                                                    si v334 == 8 :
                                                        v334 = 0                                      ⟨274452⟩
                                                    v330 = v330 + v326                                ⟨274456⟩
                                                    si si + 10 == v340 :
                                                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[14])  ⟨274469⟩
                                                    si v8 - 1 == v340 :
                                                        v3438 = 4540                                  ⟨274477⟩
                                                        v3438 = 4552                                  ⟨274478⟩
                                                        v3438 = 4568                                  ⟨274479⟩
                                                        v3438 = 4584                                  ⟨274480⟩
                                                        v3438 = 4604                                  ⟨274481⟩
                                                        Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨274491⟩
                                                    Scene_Tick(scène=scène11)                         ⟨274523⟩
                                            si v17 != 0 :
                                                canal_arrête(canal=canal5)                            ⟨274554⟩
                                            Scene_Destruct(scène=scène11, drapeaux=0)                 ⟨274561⟩
                                            si byte_495FC == 0 :

                                                ──── scène12 ────
                                                scène12 = Scene_Create(cadence=10, palette=255, surface=&v472)  ⟨274575⟩
                                                c45 = Layer(ressource=optshps 116, x=0, y=-67)        ⟨274582⟩
                                                v330 = 0                                              ⟨274585⟩
                                                v324 = 0                                              ⟨274588⟩
                                                charge_convdata_type0("air", drapeau=3)               ⟨274593⟩
                                                c46 = Layer(ressource=midgames 4, x=0, y=0)           ⟨274600⟩
                                                c47 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)  ⟨274608⟩
                                                c48 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)  ⟨274617⟩
                                                palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨274627⟩
                                                palette_copie(destination=pal1, source=pal7(midgames 6))  ⟨274636⟩
                                                palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨274645⟩
                                                palette_envoie(palette=pal1, pas=0)                   ⟨274657⟩
                                                ajoute c45 à scène12                                  ⟨274662⟩
                                                ajoute c46 à scène12                                  ⟨274667⟩
                                                ajoute c47 à scène12                                  ⟨274672⟩
                                                ajoute c48 à scène12                                  ⟨274677⟩
                                                tête_image_de_base(tête=c47, image=33)                ⟨274681⟩
                                                di = 0                                                ⟨274683⟩
                                                si v17 != 0 :
                                                    charge(asoundfx 5)                                ⟨274696⟩
                                                    canal_init(canal=canal5, pilote=word_46849)       ⟨274701⟩
                                                    canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)  ⟨274708⟩
                                                    v338 = word_48EAC                                 ⟨274711⟩
                                                    v340 = 0                                          ⟨274712⟩
                                                    si canal5.+0 != 0 :
                                                        AIL_start_sequence(pilote=canal5.+0→4, séquence=v3390)  ⟨274718⟩
                                                        AIL_set_relative_volume_30C66(canal5.+0→4, v3390, v338, v340)  ⟨274725⟩
                                                si v16 != 0 :
                                                    Scene_Tick(scène=scène12)                         ⟨274739⟩
                                                    v350 = 0                                          ⟨274741⟩
                                                    v344 = 0                                          ⟨274744⟩
                                                    charge(mid15voc 13)                               ⟨274751⟩
                                                    tête_voix(tête=c47, ressource=mid15voc 13, cadence=9)  ⟨274757⟩
                                                    v352 = 0                                          ⟨274759⟩
                                                    tant que v352 < 3 :
                                                        Scene_Tick(scène=scène12)                     ⟨274766⟩
                                                        v352 = v352 + 1                               ⟨274768⟩
                                                    tant que tête_parle(tête=c47) != 0 :
                                                        si di == 0 :
                                                            CRT_Rand()                                ⟨274779⟩
                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                di = -1                               ⟨274787⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨274795⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨274802⟩
                                                        sinon :
                                                            si di == -1 :
                                                                di = 1                                ⟨274795⟩
                                                            sinon :
                                                                si di == 1 :
                                                                    di = 0                            ⟨274802⟩
                                                        déplace(calque=c46, dx=0, dy=di)              ⟨274811⟩
                                                        déplace(calque=c47, dx=0, dy=di)              ⟨274818⟩
                                                        déplace(calque=c48, dx=0, dy=di)              ⟨274825⟩
                                                        Scene_Tick(scène=scène12)                     ⟨274839⟩
                                                    v352 = 0                                          ⟨274853⟩
                                                    tant que v352 < 8 :
                                                        si di == 0 :
                                                            CRT_Rand()                                ⟨274860⟩
                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                di = -1                               ⟨274868⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨274876⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨274883⟩
                                                        sinon :
                                                            si di == -1 :
                                                                di = 1                                ⟨274876⟩
                                                            sinon :
                                                                si di == 1 :
                                                                    di = 0                            ⟨274883⟩
                                                        déplace(calque=c46, dx=0, dy=di)              ⟨274892⟩
                                                        déplace(calque=c47, dx=0, dy=di)              ⟨274899⟩
                                                        déplace(calque=c48, dx=0, dy=di)              ⟨274906⟩
                                                        Scene_Tick(scène=scène12)                     ⟨274920⟩
                                                        v352 = v352 + 1                               ⟨274922⟩
                                                    v350 = 0                                          ⟨274948⟩
                                                    v344 = 0                                          ⟨274950⟩
                                                sinon :
                                                    Widget_Method_DispatchC_314CB(zone1, 0)           ⟨274958⟩
                                                    Widget_Method_Dispatch8_314A9(zone1, 127)         ⟨274963⟩
                                                    v10 = 57                                          ⟨274965⟩
                                                    si = scène12.compteur                             ⟨274966⟩
                                                    v8 = si + ((v10·70) / 100)                        ⟨274975⟩
                                                    tant que (scène12.compteur < v8) et (scène12.terminée == 0) :
                                                        si di == 0 :
                                                            CRT_Rand()                                ⟨274984⟩
                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                di = -1                               ⟨274992⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨275000⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨275007⟩
                                                        sinon :
                                                            si di == -1 :
                                                                di = 1                                ⟨275000⟩
                                                            sinon :
                                                                si di == 1 :
                                                                    di = 0                            ⟨275007⟩
                                                        déplace(calque=c46, dx=0, dy=di)              ⟨275016⟩
                                                        déplace(calque=c47, dx=0, dy=di)              ⟨275023⟩
                                                        déplace(calque=c48, dx=0, dy=di)              ⟨275030⟩
                                                        si si + 3 == scène12.compteur :
                                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[15])  ⟨275044⟩
                                                        si si + 3 == scène12.compteur :
                                                            tête_texte_de_lèvres(tête=c47, texte="thtzhrdlyazmlyJant")  ⟨275054⟩
                                                        si v8 - 1 == scène12.compteur :
                                                            v3438 = 4540                              ⟨275062⟩
                                                            v3438 = 4552                              ⟨275063⟩
                                                            v3438 = 4568                              ⟨275064⟩
                                                            v3438 = 4584                              ⟨275065⟩
                                                            v3438 = 4604                              ⟨275066⟩
                                                            Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨275076⟩
                                                        Scene_Tick(scène=scène12)                     ⟨275108⟩
                                                si v17 != 0 :
                                                    canal_arrête(canal=canal5)                        ⟨275139⟩
                                                v330 = 0                                              ⟨275159⟩
                                                v324 = 0                                              ⟨275161⟩
                                                Scene_Destruct(scène=scène12, drapeaux=0)             ⟨275165⟩
                                                si byte_495FC == 0 :

                                                    ──── scène13 ────
                                                    scène13 = Scene_Create(cadence=10, palette=255, surface=&v472)  ⟨275179⟩
                                                    c49 = Layer(ressource=optshps 116, x=0, y=-57)    ⟨275186⟩
                                                    v330 = 0                                          ⟨275189⟩
                                                    v324 = 0                                          ⟨275192⟩
                                                    charge_convdata_type0("janet", drapeau=3)         ⟨275197⟩
                                                    c50 = Layer(ressource=mid15 7, x=0, y=0)          ⟨275204⟩
                                                    c51 = TalkingHeadOverlay(ressource=convdata type 0 "janet", x=160, y=129)  ⟨275212⟩
                                                    c52 = ImageLayer(ressource=convdata type 0 "janet", x=160, y=129, image=51)  ⟨275221⟩
                                                    palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨275231⟩
                                                    palette_copie(destination=pal1, source=pal6(mid15 14))  ⟨275240⟩
                                                    palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨275249⟩
                                                    palette_envoie(palette=pal1, pas=0)               ⟨275261⟩
                                                    ajoute c49 à scène13                              ⟨275266⟩
                                                    ajoute c50 à scène13                              ⟨275271⟩
                                                    ajoute c51 à scène13                              ⟨275276⟩
                                                    ajoute c52 à scène13                              ⟨275281⟩
                                                    di = 0                                            ⟨275283⟩
                                                    si v17 != 0 :
                                                        charge(asoundfx 24)                           ⟨275296⟩
                                                        canal_init(canal=canal4, pilote=word_46849)   ⟨275301⟩
                                                        canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)  ⟨275308⟩
                                                        v338 = word_48ED2                             ⟨275311⟩
                                                        v340 = 0                                      ⟨275312⟩
                                                        si canal4.+0 != 0 :
                                                            AIL_start_sequence(pilote=canal4.+0→4, séquence=v3376)  ⟨275318⟩
                                                            AIL_set_relative_volume_30C66(canal4.+0→4, v3376, v338, v340)  ⟨275325⟩
                                                    si v16 != 0 :
                                                        Scene_Tick(scène=scène13)                     ⟨275339⟩
                                                        v350 = 0                                      ⟨275341⟩
                                                        v344 = 0                                      ⟨275344⟩
                                                        charge(mid15voc 5)                            ⟨275351⟩
                                                        tête_voix(tête=c51, ressource=mid15voc 5, cadence=9)  ⟨275357⟩
                                                        v352 = 0                                      ⟨275359⟩
                                                        tant que v352 < 3 :
                                                            Scene_Tick(scène=scène13)                 ⟨275366⟩
                                                            v352 = v352 + 1                           ⟨275368⟩
                                                        tant que tête_parle(tête=c51) != 0 :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨275379⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨275387⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨275395⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨275402⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨275395⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨275402⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨275411⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨275418⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨275425⟩
                                                            Scene_Tick(scène=scène13)                 ⟨275439⟩
                                                        v352 = 0                                      ⟨275453⟩
                                                        tant que v352 < 8 :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨275460⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨275468⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨275476⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨275483⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨275476⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨275483⟩
                                                            Scene_Tick(scène=scène13)                 ⟨275499⟩
                                                            v352 = v352 + 1                           ⟨275501⟩
                                                        v362 = 0                                      ⟨275508⟩
                                                        v356 = 0                                      ⟨275511⟩
                                                        charge(mid15voc 6)                            ⟨275518⟩
                                                        tête_voix(tête=c51, ressource=mid15voc 6, cadence=9)  ⟨275524⟩
                                                        v352 = 0                                      ⟨275526⟩
                                                        tant que v352 < 3 :
                                                            Scene_Tick(scène=scène13)                 ⟨275533⟩
                                                            v352 = v352 + 1                           ⟨275535⟩
                                                        tant que tête_parle(tête=c51) != 0 :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨275546⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨275554⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨275562⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨275569⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨275562⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨275569⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨275578⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨275585⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨275592⟩
                                                            Scene_Tick(scène=scène13)                 ⟨275606⟩
                                                        v352 = 0                                      ⟨275620⟩
                                                        tant que v352 < 4 :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨275627⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨275635⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨275643⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨275650⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨275643⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨275650⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨275659⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨275666⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨275673⟩
                                                            Scene_Tick(scène=scène13)                 ⟨275687⟩
                                                            v352 = v352 + 1                           ⟨275689⟩
                                                        v362 = 0                                      ⟨275715⟩
                                                        v356 = 0                                      ⟨275717⟩
                                                        v350 = 0                                      ⟨275734⟩
                                                        v344 = 0                                      ⟨275736⟩
                                                    sinon :
                                                        Widget_Method_DispatchC_314CB(zone1, 0)       ⟨275744⟩
                                                        Widget_Method_Dispatch8_314A9(zone1, 127)     ⟨275749⟩
                                                        v10 = 68                                      ⟨275751⟩
                                                        si = scène13.compteur                         ⟨275752⟩
                                                        v8 = si + ((v10·70) / 100)                    ⟨275761⟩
                                                        tant que (scène13.compteur < v8) et (scène13.terminée == 0) :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨275770⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨275778⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨275786⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨275793⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨275786⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨275793⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨275802⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨275809⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨275816⟩
                                                            si si + 2 == scène13.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[16])  ⟨275829⟩
                                                            si si + 2 == scène13.compteur :
                                                                tête_texte_de_lèvres(tête=c51, texte="adowmylv uilhdduestndldatourarstip")  ⟨275839⟩
                                                            si si + 8 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=19)  ⟨275849⟩
                                                            si si + 12 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=-1)  ⟨275859⟩
                                                            si si + 15 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=19)  ⟨275869⟩
                                                            si si + 12 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=-1)  ⟨275879⟩
                                                            si v8 - 1 == scène13.compteur :
                                                                v3438 = 4540                          ⟨275887⟩
                                                                v3438 = 4552                          ⟨275888⟩
                                                                v3438 = 4568                          ⟨275889⟩
                                                                v3438 = 4584                          ⟨275890⟩
                                                                v3438 = 4604                          ⟨275891⟩
                                                                Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨275901⟩
                                                            Scene_Tick(scène=scène13)                 ⟨275933⟩
                                                        v10 = 33                                      ⟨275960⟩
                                                        si = scène13.compteur                         ⟨275961⟩
                                                        v8 = si + ((v10·70) / 100)                    ⟨275970⟩
                                                        tant que (scène13.compteur < v8) et (scène13.terminée == 0) :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨275979⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨275987⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨275995⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨276002⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨275995⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨276002⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨276011⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨276018⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨276025⟩
                                                            si si + 2 == scène13.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[17])  ⟨276039⟩
                                                            si si + 2 == scène13.compteur :
                                                                tête_texte_de_lèvres(tête=c51, texte="ndidolvyucarzn")  ⟨276049⟩
                                                            si si + 6 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=19)  ⟨276059⟩
                                                            si v8 - 1 == scène13.compteur :
                                                                v3438 = 4540                          ⟨276067⟩
                                                                v3438 = 4552                          ⟨276068⟩
                                                                v3438 = 4568                          ⟨276069⟩
                                                                v3438 = 4584                          ⟨276070⟩
                                                                v3438 = 4604                          ⟨276071⟩
                                                                Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨276081⟩
                                                            Scene_Tick(scène=scène13)                 ⟨276113⟩
                                                        v10 = 27                                      ⟨276140⟩
                                                        si = scène13.compteur                         ⟨276141⟩
                                                        v8 = si + ((v10·70) / 100)                    ⟨276150⟩
                                                        tant que (scène13.compteur < v8) et (scène13.terminée == 0) :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨276159⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨276167⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨276175⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨276182⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨276175⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨276182⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨276191⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨276198⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨276205⟩
                                                            si si + 2 == scène13.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[18])  ⟨276219⟩
                                                            si si + 2 == scène13.compteur :
                                                                tête_texte_de_lèvres(tête=c51, texte="nmyway")  ⟨276229⟩
                                                            si si + 10 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=-1)  ⟨276239⟩
                                                            si v8 - 1 == scène13.compteur :
                                                                v3438 = 4540                          ⟨276247⟩
                                                                v3438 = 4552                          ⟨276248⟩
                                                                v3438 = 4568                          ⟨276249⟩
                                                                v3438 = 4584                          ⟨276250⟩
                                                                v3438 = 4604                          ⟨276251⟩
                                                                Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨276261⟩
                                                            Scene_Tick(scène=scène13)                 ⟨276293⟩
                                                        v10 = 56                                      ⟨276320⟩
                                                        si = scène13.compteur                         ⟨276321⟩
                                                        v8 = si + ((v10·70) / 100)                    ⟨276330⟩
                                                        tant que (scène13.compteur < v8) et (scène13.terminée == 0) :
                                                            si di == 0 :
                                                                CRT_Rand()                            ⟨276339⟩
                                                                si (CRT_Rand()·7) / 32768 == 0 :
                                                                    di = -1                           ⟨276347⟩
                                                                sinon :
                                                                    si di == -1 :
                                                                        di = 1                        ⟨276355⟩
                                                                    sinon :
                                                                        si di == 1 :
                                                                            di = 0                    ⟨276362⟩
                                                            sinon :
                                                                si di == -1 :
                                                                    di = 1                            ⟨276355⟩
                                                                sinon :
                                                                    si di == 1 :
                                                                        di = 0                        ⟨276362⟩
                                                            déplace(calque=c50, dx=0, dy=di)          ⟨276371⟩
                                                            déplace(calque=c51, dx=0, dy=di)          ⟨276378⟩
                                                            déplace(calque=c52, dx=0, dy=di)          ⟨276385⟩
                                                            si si + 2 == scène13.compteur :
                                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[19])  ⟨276399⟩
                                                            si si + 2 == scène13.compteur :
                                                                tête_texte_de_lèvres(tête=c51, texte="btthzazbznsimsorry")  ⟨276409⟩
                                                            si si + 6 == scène13.compteur :
                                                                tête_image_de_base(tête=c51, image=25)  ⟨276419⟩
                                                            si v8 - 1 == scène13.compteur :
                                                                v3438 = 4540                          ⟨276427⟩
                                                                v3438 = 4552                          ⟨276428⟩
                                                                v3438 = 4568                          ⟨276429⟩
                                                                v3438 = 4584                          ⟨276430⟩
                                                                v3438 = 4604                          ⟨276431⟩
                                                                Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨276441⟩
                                                            Scene_Tick(scène=scène13)                 ⟨276473⟩
                                                    si v17 != 0 :
                                                        canal_arrête(canal=canal4)                    ⟨276504⟩
                                                    v330 = 0                                          ⟨276524⟩
                                                    v324 = 0                                          ⟨276526⟩
                                                    Scene_Destruct(scène=scène13, drapeaux=0)         ⟨276530⟩
                                                    si byte_495FC == 0 :

                                                        ──── scène14 ────
                                                        scène14 = Scene_Create(cadence=10, palette=255, surface=&v472)  ⟨276544⟩
                                                        c53 = Layer(ressource=optshps 116, x=0, y=-34)  ⟨276551⟩
                                                        c54 = Layer(ressource=mid15 9, x=3, y=1)      ⟨276559⟩
                                                        c55 = OverlayImageLayer(ressource=mid15 4, x=3, y=1, image=1)  ⟨276568⟩
                                                        palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨276578⟩
                                                        palette_copie(destination=pal1, source=pal3(mid15 15))  ⟨276587⟩
                                                        ajoute c53 à scène14                          ⟨276592⟩
                                                        ajoute c54 à scène14                          ⟨276597⟩
                                                        ajoute c55 à scène14                          ⟨276602⟩
                                                        palette_envoie(palette=pal1, pas=0)           ⟨276614⟩
                                                        di = 0                                        ⟨276616⟩
                                                        v326 = 3                                      ⟨276617⟩
                                                        v328 = 2                                      ⟨276618⟩
                                                        v330 = 2                                      ⟨276619⟩
                                                        si v17 != 0 :
                                                            charge(asoundfx 24)                       ⟨276632⟩
                                                            canal_init(canal=canal4, pilote=word_46849)  ⟨276637⟩
                                                            canal_enregistre(canal=canal4, ressource=asoundfx 24, x=0)  ⟨276644⟩
                                                            v332 = word_48ED2 - 50                    ⟨276648⟩
                                                            v334 = 0                                  ⟨276649⟩
                                                            si canal4.+0 != 0 :
                                                                AIL_start_sequence(pilote=canal4.+0→4, séquence=v3376)  ⟨276655⟩
                                                                AIL_set_relative_volume_30C66(canal4.+0→4, v3376, v332, v334)  ⟨276662⟩
                                                        si v16 != 0 :
                                                            Scene_Tick(scène=scène14)                 ⟨276676⟩
                                                            charge(mid15voc 7)                        ⟨276688⟩
                                                            voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid15voc 7)  ⟨276694⟩
                                                            v346 = 0                                  ⟨276696⟩
                                                            tant que v346 < 4 :
                                                                Scene_Tick(scène=scène14)             ⟨276703⟩
                                                                v346 = v346 + 1                       ⟨276705⟩
                                                            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)  ⟨276713⟩
                                                            v346 = 0                                  ⟨276715⟩
                                                            tant que voix_en_cours(voix=voix1) != 0 :
                                                                si v328 == v330 :
                                                                    v346_avant = v346                 ⟨276724⟩
                                                                    v346 = v346 + 1                   ⟨276724⟩
                                                                    si v346_avant & 1 != 0 :
                                                                        v348 = v326                   ⟨276728⟩
                                                                        CRT_Rand()                    ⟨276729⟩
                                                                        v330 = (CRT_Rand()·v348) / 32768  ⟨276736⟩
                                                                    si v330 < v328 :
                                                                        di = -1                       ⟨276742⟩
                                                                    sinon :
                                                                        si v330 == v328 :
                                                                            di = 0                    ⟨276750⟩
                                                                        sinon :
                                                                            di = 1                    ⟨276755⟩
                                                                déplace(calque=c54, dx=0, dy=di)      ⟨276764⟩
                                                                déplace(calque=c55, dx=0, dy=di)      ⟨276771⟩
                                                                v328 = v328 + di                      ⟨276773⟩
                                                                CRT_Rand()                            ⟨276774⟩
                                                                v350 = (CRT_Rand()·3) / 32768         ⟨276780⟩
                                                                c55.image = v350                      ⟨276783⟩
                                                                Scene_Tick(scène=scène14)             ⟨276796⟩
                                                            c55.image = 0                             ⟨276812⟩
                                                            v346 = 0                                  ⟨276813⟩
                                                            tant que v346 < 4 :
                                                                Scene_Tick(scène=scène14)             ⟨276820⟩
                                                                v346 = v346 + 1                       ⟨276822⟩
                                                            voix_arrête(voix=voix1)                   ⟨276829⟩
                                                            v344 = 0                                  ⟨276847⟩
                                                            v338 = 0                                  ⟨276849⟩
                                                        sinon :
                                                            Widget_Method_DispatchC_314CB(zone1, 0)   ⟨276857⟩
                                                            Widget_Method_Dispatch8_314A9(zone1, 197)  ⟨276862⟩
                                                            v10 = 73                                  ⟨276864⟩
                                                            si = scène14.compteur                     ⟨276865⟩
                                                            v8 = si + ((v10·70) / 100)                ⟨276874⟩
                                                            tant que (scène14.compteur < v8) et (scène14.terminée == 0) :
                                                                v336 = scène14.compteur               ⟨276880⟩
                                                                si v328 == v330 :
                                                                    si v336 & 1 != 0 :
                                                                        v338 = v326                   ⟨276887⟩
                                                                        CRT_Rand()                    ⟨276888⟩
                                                                        v330 = (CRT_Rand()·v338) / 32768  ⟨276895⟩
                                                                    si v330 < v328 :
                                                                        di = -1                       ⟨276901⟩
                                                                    sinon :
                                                                        si v330 == v328 :
                                                                            di = 0                    ⟨276909⟩
                                                                        sinon :
                                                                            di = 1                    ⟨276914⟩
                                                                déplace(calque=c54, dx=0, dy=di)      ⟨276923⟩
                                                                déplace(calque=c55, dx=0, dy=di)      ⟨276930⟩
                                                                v328 = v328 + di                      ⟨276932⟩
                                                                si si + 4 == v336 :
                                                                    sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[20])  ⟨276945⟩
                                                                si si + 2 < v336 :
                                                                    si si + 26 > v336 :
                                                                        CRT_Rand()                    ⟨276957⟩
                                                                        v340 = (CRT_Rand()·3) / 32768  ⟨276963⟩
                                                                        c55.image = v340              ⟨276966⟩
                                                                si v8 - 1 == v336 :
                                                                    v3438 = 4540                      ⟨276974⟩
                                                                    v3438 = 4552                      ⟨276975⟩
                                                                    v3438 = 4568                      ⟨276976⟩
                                                                    v3438 = 4584                      ⟨276977⟩
                                                                    v3438 = 4604                      ⟨276978⟩
                                                                    Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨276988⟩
                                                                Scene_Tick(scène=scène14)             ⟨277020⟩
                                                        si v17 != 0 :
                                                            canal_arrête(canal=canal4)                ⟨277051⟩
                                                        Scene_Destruct(scène=scène14, drapeaux=0)     ⟨277058⟩
                                                        si byte_495FC == 0 :

                                                            ──── scène15 ────
                                                            scène15 = Scene_Create(cadence=10, palette=255, surface=&v472)  ⟨277072⟩
                                                            c56 = Layer(ressource=optshps 116, x=0, y=-47)  ⟨277079⟩
                                                            c57 = Layer(ressource=mid15 8, x=0, y=-1)  ⟨277087⟩
                                                            di = c57                                  ⟨277089⟩
                                                            c58 = Layer(ressource=mid15 3, x=0, y=-1)  ⟨277095⟩
                                                            c59 = OverlayImageLayer(ressource=mid15 0, x=0, y=-1, image=1)  ⟨277104⟩
                                                            palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨277114⟩
                                                            palette_copie(destination=pal1, source=pal3(mid15 15))  ⟨277123⟩
                                                            ajoute c56 à scène15                      ⟨277128⟩
                                                            ajoute c57 à scène15                      ⟨277133⟩
                                                            ajoute c58 à scène15                      ⟨277138⟩
                                                            ajoute c59 à scène15                      ⟨277143⟩
                                                            palette_envoie(palette=pal1, pas=0)       ⟨277155⟩
                                                            v326 = 0                                  ⟨277157⟩
                                                            v328 = 3                                  ⟨277158⟩
                                                            v330 = 2                                  ⟨277159⟩
                                                            v332 = 2                                  ⟨277160⟩
                                                            v334 = 0                                  ⟨277161⟩
                                                            si v17 != 0 :
                                                                charge(asoundfx 5)                    ⟨277174⟩
                                                                canal_init(canal=canal5, pilote=word_46849)  ⟨277179⟩
                                                                canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)  ⟨277186⟩
                                                                v336 = word_48EAC - 50                ⟨277190⟩
                                                                v338 = 0                              ⟨277191⟩
                                                                si canal5.+0 != 0 :
                                                                    AIL_start_sequence(pilote=canal5.+0→4, séquence=v3390)  ⟨277197⟩
                                                                    AIL_set_relative_volume_30C66(canal5.+0→4, v3390, v336, v338)  ⟨277204⟩
                                                            si v16 != 0 :
                                                                Scene_Tick(scène=scène15)             ⟨277218⟩
                                                                v348 = 0                              ⟨277220⟩
                                                                charge(mid15voc 14)                   ⟨277230⟩
                                                                voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid15voc 14)  ⟨277236⟩
                                                                v350 = 0                              ⟨277238⟩
                                                                tant que v350 < 4 :
                                                                    Scene_Tick(scène=scène15)         ⟨277245⟩
                                                                    v350 = v350 + 1                   ⟨277247⟩
                                                                voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)  ⟨277255⟩
                                                                v350 = 0                              ⟨277257⟩
                                                                tant que voix_en_cours(voix=voix1) != 0 :
                                                                    si v330 == v332 :
                                                                        v350_avant = v350             ⟨277266⟩
                                                                        v350 = v350 + 1               ⟨277266⟩
                                                                        si v350_avant & 1 != 0 :
                                                                            v352 = v328               ⟨277270⟩
                                                                            CRT_Rand()                ⟨277271⟩
                                                                            v332 = (CRT_Rand()·v352) / 32768  ⟨277278⟩
                                                                        si v332 < v330 :
                                                                            v326 = -1                 ⟨277284⟩
                                                                        sinon :
                                                                            si v332 == v330 :
                                                                                v326 = 0              ⟨277292⟩
                                                                            sinon :
                                                                                v326 = 1              ⟨277297⟩
                                                                    déplace(calque=c58, dx=0, dy=v326)  ⟨277306⟩
                                                                    déplace(calque=c59, dx=0, dy=v326)  ⟨277313⟩
                                                                    v334_avant = v334                 ⟨277316⟩
                                                                    v334 = v334 + 1                   ⟨277316⟩
                                                                    si v334_avant == 1 :
                                                                        déplace(calque=c57, dx=-1, dy=0)  ⟨277323⟩
                                                                    si v334 == 5 :
                                                                        déplace(calque=c57, dx=0, dy=1)  ⟨277333⟩
                                                                    si v334 == 8 :
                                                                        v334 = 0                      ⟨277339⟩
                                                                    v330 = v330 + v326                ⟨277343⟩
                                                                    CRT_Rand()                        ⟨277344⟩
                                                                    v354 = (CRT_Rand()·3) / 32768     ⟨277350⟩
                                                                    c59.image = v354                  ⟨277353⟩
                                                                    Scene_Tick(scène=scène15)         ⟨277366⟩
                                                                c59.image = 0                         ⟨277382⟩
                                                                v350 = 0                              ⟨277383⟩
                                                                tant que v350 < 4 :
                                                                    Scene_Tick(scène=scène15)         ⟨277390⟩
                                                                    v350 = v350 + 1                   ⟨277392⟩
                                                                voix_arrête(voix=voix1)               ⟨277399⟩
                                                                v348 = 0                              ⟨277417⟩
                                                            sinon :
                                                                Widget_Method_DispatchC_314CB(zone1, 0)  ⟨277427⟩
                                                                Widget_Method_Dispatch8_314A9(zone1, 196)  ⟨277432⟩
                                                                v10 = 32                              ⟨277434⟩
                                                                si = scène15.compteur                 ⟨277435⟩
                                                                v8 = si + ((v10·70) / 100)            ⟨277444⟩
                                                                tant que (scène15.compteur < v8) et (scène15.terminée == 0) :
                                                                    v340 = scène15.compteur           ⟨277450⟩
                                                                    si v330 == v332 :
                                                                        si v340 & 1 != 0 :
                                                                            CRT_Rand()                ⟨277458⟩
                                                                            v332 = (CRT_Rand()·v328) / 32768  ⟨277465⟩
                                                                        si v332 < v330 :
                                                                            v326 = -1                 ⟨277471⟩
                                                                        sinon :
                                                                            si v332 == v330 :
                                                                                v326 = 0              ⟨277479⟩
                                                                            sinon :
                                                                                v326 = 1              ⟨277484⟩
                                                                    déplace(calque=c58, dx=0, dy=v326)  ⟨277493⟩
                                                                    déplace(calque=c59, dx=0, dy=v326)  ⟨277500⟩
                                                                    v334_avant = v334                 ⟨277503⟩
                                                                    v334 = v334 + 1                   ⟨277503⟩
                                                                    si v334_avant == 1 :
                                                                        déplace(calque=c57, dx=-1, dy=0)  ⟨277510⟩
                                                                    si v334 == 5 :
                                                                        déplace(calque=c57, dx=0, dy=1)  ⟨277520⟩
                                                                    si v334 == 8 :
                                                                        v334 = 0                      ⟨277526⟩
                                                                    v330 = v330 + v326                ⟨277530⟩
                                                                    si si + 5 == v340 :
                                                                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[21])  ⟨277543⟩
                                                                    si si + 2 < v340 :
                                                                        si si + 10 > v340 :
                                                                            CRT_Rand()                ⟨277555⟩
                                                                            v344 = (CRT_Rand()·3) / 32768  ⟨277561⟩
                                                                            c59.image = v344          ⟨277564⟩
                                                                    si v8 - 1 == v340 :
                                                                        v3438 = 4540                  ⟨277572⟩
                                                                        v3438 = 4552                  ⟨277573⟩
                                                                        v3438 = 4568                  ⟨277574⟩
                                                                        v3438 = 4584                  ⟨277575⟩
                                                                        v3438 = 4604                  ⟨277576⟩
                                                                        Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨277586⟩
                                                                    Scene_Tick(scène=scène15)         ⟨277618⟩
                                                                v10 = 47                              ⟨277645⟩
                                                                si = scène15.compteur                 ⟨277646⟩
                                                                v8 = si + ((v10·70) / 100)            ⟨277655⟩
                                                                tant que (scène15.compteur < v8) et (scène15.terminée == 0) :
                                                                    v340 = scène15.compteur           ⟨277661⟩
                                                                    si v330 == v332 :
                                                                        si v340 & 1 != 0 :
                                                                            CRT_Rand()                ⟨277669⟩
                                                                            v332 = (CRT_Rand()·v328) / 32768  ⟨277676⟩
                                                                        si v332 < v330 :
                                                                            v326 = -1                 ⟨277682⟩
                                                                        sinon :
                                                                            si v332 == v330 :
                                                                                v326 = 0              ⟨277690⟩
                                                                            sinon :
                                                                                v326 = 1              ⟨277695⟩
                                                                    déplace(calque=c58, dx=0, dy=v326)  ⟨277704⟩
                                                                    déplace(calque=c59, dx=0, dy=v326)  ⟨277711⟩
                                                                    v334_avant = v334                 ⟨277714⟩
                                                                    v334 = v334 + 1                   ⟨277714⟩
                                                                    si v334_avant == 1 :
                                                                        déplace(calque=c57, dx=1, dy=0)  ⟨277721⟩
                                                                    si v334 == 5 :
                                                                        déplace(calque=c57, dx=0, dy=-1)  ⟨277731⟩
                                                                    si v334 == 8 :
                                                                        v334 = 0                      ⟨277737⟩
                                                                    v330 = v330 + v326                ⟨277741⟩
                                                                    si si + 2 == v340 :
                                                                        sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[22])  ⟨277754⟩
                                                                    si si + 2 < v340 :
                                                                        si si + 26 > v340 :
                                                                            CRT_Rand()                ⟨277766⟩
                                                                            v344 = (CRT_Rand()·3) / 32768  ⟨277772⟩
                                                                            c59.image = v344          ⟨277775⟩
                                                                    si v8 - 1 == v340 :
                                                                        v3438 = 4540                  ⟨277783⟩
                                                                        v3438 = 4552                  ⟨277784⟩
                                                                        v3438 = 4568                  ⟨277785⟩
                                                                        v3438 = 4584                  ⟨277786⟩
                                                                        v3438 = 4604                  ⟨277787⟩
                                                                        Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨277797⟩
                                                                    Scene_Tick(scène=scène15)         ⟨277829⟩
                                                            si v17 != 0 :
                                                                canal_arrête(canal=canal5)            ⟨277860⟩
                                                            Scene_Destruct(scène=scène15, drapeaux=0)  ⟨277867⟩
                                                            si byte_495FC == 0 :

                                                                ──── scène16 ────
                                                                scène16 = Scene_Create(cadence=10, palette=255, surface=&v472)  ⟨277881⟩
                                                                c60 = Layer(ressource=optshps 116, x=0, y=-67)  ⟨277888⟩
                                                                v330 = 0                              ⟨277891⟩
                                                                v324 = 0                              ⟨277894⟩
                                                                charge_convdata_type0("air", drapeau=3)  ⟨277899⟩
                                                                c61 = Layer(ressource=midgames 4, x=0, y=0)  ⟨277906⟩
                                                                c62 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=129)  ⟨277914⟩
                                                                c63 = ImageLayer(ressource=convdata type 0 "air", x=160, y=129, image=51)  ⟨277923⟩
                                                                charge(midgames 0)                    ⟨277936⟩
                                                                c64 = ToggleLayer(ressource=midgames 0, x=160, y=129, sens=0)  ⟨277944⟩
                                                                palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨277954⟩
                                                                palette_copie(destination=pal1, source=pal7(midgames 6))  ⟨277963⟩
                                                                palette_copie(destination=pal1, source=pal8(convdata type 2 "normal"))  ⟨277972⟩
                                                                palette_envoie(palette=pal1, pas=0)   ⟨277984⟩
                                                                ajoute c60 à scène16                  ⟨277989⟩
                                                                ajoute c61 à scène16                  ⟨277994⟩
                                                                ajoute c62 à scène16                  ⟨277999⟩
                                                                ajoute c63 à scène16                  ⟨278004⟩
                                                                tête_image_de_base(tête=c62, image=14)  ⟨278008⟩
                                                                di = 0                                ⟨278010⟩
                                                                si v17 != 0 :
                                                                    charge(asoundfx 5)                ⟨278023⟩
                                                                    canal_init(canal=canal5, pilote=word_46849)  ⟨278028⟩
                                                                    canal_enregistre(canal=canal5, ressource=asoundfx 5, x=0)  ⟨278035⟩
                                                                    v350 = word_48EAC                 ⟨278038⟩
                                                                    v352 = 0                          ⟨278039⟩
                                                                    si canal5.+0 != 0 :
                                                                        AIL_start_sequence(pilote=canal5.+0→4, séquence=v3390)  ⟨278045⟩
                                                                        AIL_set_relative_volume_30C66(canal5.+0→4, v3390, v350, v352)  ⟨278052⟩
                                                                si v16 != 0 :
                                                                    Scene_Tick(scène=scène16)         ⟨278066⟩
                                                                    v362 = 0                          ⟨278068⟩
                                                                    v356 = 0                          ⟨278071⟩
                                                                    charge(mid15voc 15)               ⟨278078⟩
                                                                    tête_voix(tête=c62, ressource=mid15voc 15, cadence=9)  ⟨278084⟩
                                                                    v364 = 0                          ⟨278086⟩
                                                                    tant que v364 < 3 :
                                                                        Scene_Tick(scène=scène16)     ⟨278093⟩
                                                                        v364 = v364 + 1               ⟨278095⟩
                                                                    tant que tête_parle(tête=c62) != 0 :
                                                                        si di == 0 :
                                                                            CRT_Rand()                ⟨278106⟩
                                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                                di = -1               ⟨278114⟩
                                                                            sinon :
                                                                                si di == -1 :
                                                                                    di = 1            ⟨278122⟩
                                                                                sinon :
                                                                                    si di == 1 :
                                                                                        di = 0        ⟨278129⟩
                                                                        sinon :
                                                                            si di == -1 :
                                                                                di = 1                ⟨278122⟩
                                                                            sinon :
                                                                                si di == 1 :
                                                                                    di = 0            ⟨278129⟩
                                                                        déplace(calque=c61, dx=0, dy=di)  ⟨278138⟩
                                                                        déplace(calque=c62, dx=0, dy=di)  ⟨278145⟩
                                                                        déplace(calque=c63, dx=0, dy=di)  ⟨278152⟩
                                                                        Scene_Tick(scène=scène16)     ⟨278166⟩
                                                                    v364 = 0                          ⟨278180⟩
                                                                    tant que v364 < 4 :
                                                                        si di == 0 :
                                                                            CRT_Rand()                ⟨278187⟩
                                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                                di = -1               ⟨278195⟩
                                                                            sinon :
                                                                                si di == -1 :
                                                                                    di = 1            ⟨278203⟩
                                                                                sinon :
                                                                                    si di == 1 :
                                                                                        di = 0        ⟨278210⟩
                                                                        sinon :
                                                                            si di == -1 :
                                                                                di = 1                ⟨278203⟩
                                                                            sinon :
                                                                                si di == 1 :
                                                                                    di = 0            ⟨278210⟩
                                                                        déplace(calque=c61, dx=0, dy=di)  ⟨278219⟩
                                                                        déplace(calque=c62, dx=0, dy=di)  ⟨278226⟩
                                                                        déplace(calque=c63, dx=0, dy=di)  ⟨278233⟩
                                                                        Scene_Tick(scène=scène16)     ⟨278247⟩
                                                                        v364 = v364 + 1               ⟨278249⟩
                                                                    v362 = 0                          ⟨278275⟩
                                                                    v356 = 0                          ⟨278277⟩
                                                                sinon :
                                                                    Widget_Method_DispatchC_314CB(zone1, 0)  ⟨278285⟩
                                                                    Widget_Method_Dispatch8_314A9(zone1, 127)  ⟨278290⟩
                                                                    v10 = 44                          ⟨278292⟩
                                                                    si = scène16.compteur             ⟨278293⟩
                                                                    v8 = si + ((v10·70) / 100)        ⟨278302⟩
                                                                    tant que (scène16.compteur < v8) et (scène16.terminée == 0) :
                                                                        v354 = scène16.compteur       ⟨278308⟩
                                                                        si di == 0 :
                                                                            CRT_Rand()                ⟨278311⟩
                                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                                di = -1               ⟨278319⟩
                                                                            sinon :
                                                                                si di == -1 :
                                                                                    di = 1            ⟨278327⟩
                                                                                sinon :
                                                                                    si di == 1 :
                                                                                        di = 0        ⟨278334⟩
                                                                        sinon :
                                                                            si di == -1 :
                                                                                di = 1                ⟨278327⟩
                                                                            sinon :
                                                                                si di == 1 :
                                                                                    di = 0            ⟨278334⟩
                                                                        déplace(calque=c61, dx=0, dy=di)  ⟨278343⟩
                                                                        déplace(calque=c62, dx=0, dy=di)  ⟨278350⟩
                                                                        déplace(calque=c63, dx=0, dy=di)  ⟨278357⟩
                                                                        si si + 2 == v354 :
                                                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[23])  ⟨278371⟩
                                                                        si si + 2 == v354 :
                                                                            tête_texte_de_lèvres(tête=c62, texte="btdevrynnoz")  ⟨278381⟩
                                                                        si v8 - 1 == v354 :
                                                                            v3438 = 4540              ⟨278389⟩
                                                                            v3438 = 4552              ⟨278390⟩
                                                                            v3438 = 4568              ⟨278391⟩
                                                                            v3438 = 4584              ⟨278392⟩
                                                                            v3438 = 4604              ⟨278393⟩
                                                                            Primitive_SetRectColorAndDraw_2CBE5(&v3438, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨278403⟩
                                                                        Scene_Tick(scène=scène16)     ⟨278435⟩
                                                                    v10 = 24                          ⟨278462⟩
                                                                    si = scène16.compteur             ⟨278463⟩
                                                                    v8 = si + ((v10·70) / 100)        ⟨278472⟩
                                                                    tant que (scène16.compteur < v8) et (scène16.terminée == 0) :
                                                                        v354 = scène16.compteur       ⟨278478⟩
                                                                        si di == 0 :
                                                                            CRT_Rand()                ⟨278481⟩
                                                                            si (CRT_Rand()·7) / 32768 == 0 :
                                                                                di = -1               ⟨278489⟩
                                                                            sinon :
                                                                                si di == -1 :
                                                                                    di = 1            ⟨278497⟩
                                                                                sinon :
                                                                                    si di == 1 :
                                                                                        di = 0        ⟨278504⟩
                                                                        sinon :
                                                                            si di == -1 :
                                                                                di = 1                ⟨278497⟩
                                                                            sinon :
                                                                                si di == 1 :
                                                                                    di = 0            ⟨278504⟩
                                                                        déplace(calque=c61, dx=0, dy=di)  ⟨278513⟩
                                                                        déplace(calque=c62, dx=0, dy=di)  ⟨278520⟩
                                                                        déplace(calque=c63, dx=0, dy=di)  ⟨278527⟩
                                                                        si si + 2 == v354 :
                                                                            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[24])  ⟨278541⟩
                                                                        si si + 2 == v354 :
                                                                            tête_texte_de_lèvres(tête=c62, texte="brakngupizardtodo")  ⟨278551⟩
                                                                        Scene_Tick(scène=scène16)     ⟨278583⟩
                                                                di = -1                               ⟨278610⟩
                                                                déplace(calque=c61, dx=0, dy=-1)      ⟨278616⟩
                                                                déplace(calque=c62, dx=0, dy=-1)      ⟨278623⟩
                                                                déplace(calque=c64, dx=0, dy=-1)      ⟨278630⟩
                                                                scène16.compteur = 0                  ⟨278632⟩
                                                                ajoute c64 à scène16                  ⟨278636⟩
                                                                retire(parent=scène16, calque=c63)    ⟨278641⟩
                                                                c63.détruit(3)                        ⟨278649⟩
                                                                tant que (scène16.compteur < 15) et (scène16.terminée == 0) :
                                                                    si scène16.compteur == 1 :
                                                                        di = 1                        ⟨278660⟩
                                                                        déplace(calque=c61, dx=0, dy=1)  ⟨278666⟩
                                                                        déplace(calque=c62, dx=0, dy=1)  ⟨278673⟩
                                                                        déplace(calque=c64, dx=0, dy=1)  ⟨278680⟩
                                                                    Scene_Tick(scène=scène16)         ⟨278686⟩
                                                                si v17 != 0 :
                                                                    canal_arrête(canal=canal5)        ⟨278711⟩
                                                                v346 = 0                              ⟨278731⟩
                                                                v340 = 0                              ⟨278733⟩
                                                                v330 = 0                              ⟨278750⟩
                                                                v324 = 0                              ⟨278752⟩
                                                                Scene_Destruct(scène=scène16, drapeaux=0)  ⟨278756⟩
                                                                si byte_495FC == 0 :
                                                                    v328 = 0                          ⟨278764⟩
                                                                    v322 = 0                          ⟨278767⟩
                                                                    charge(mid15 2)                   ⟨278774⟩
                                                                    charge(mid15 12)                  ⟨278786⟩
                                                                    palette_depuis(pal9(mid15 12))    ⟨278793⟩

                                                                    ──── scène17 ────
                                                                    scène17 = Scene_Create(cadence=15, palette=255, surface=&v472)  ⟨278801⟩
                                                                    c65 = Layer(ressource=optshps 116, x=0, y=-24)  ⟨278808⟩
                                                                    c66 = Layer(ressource=mid15 2, x=0, y=-24)  ⟨278816⟩
                                                                    palette_copie(destination=pal1, source=pal9(mid15 12))  ⟨278826⟩
                                                                    palette_copie(destination=pal1, source=pal2(optpals 21))  ⟨278835⟩
                                                                    ajoute c65 à scène17              ⟨278840⟩
                                                                    ajoute c66 à scène17              ⟨278845⟩
                                                                    palette_envoie(palette=pal1, pas=0)  ⟨278857⟩
                                                                    di = 2                            ⟨278859⟩
                                                                    v350 = 1                          ⟨278860⟩
                                                                    si v17 != 0 :
                                                                        charge(asoundfx 38)           ⟨278883⟩
                                                                        canal_init(canal=canal6, pilote=word_46849)  ⟨278888⟩
                                                                        canal_enregistre(canal=canal6, ressource=asoundfx 38, x=0)  ⟨278895⟩
                                                                        v362 = word_48EEE             ⟨278898⟩
                                                                        v364 = 0                      ⟨278899⟩
                                                                        si canal6.+0 != 0 :
                                                                            AIL_start_sequence(pilote=canal6.+0→4, séquence=v3438)  ⟨278905⟩
                                                                            AIL_set_relative_volume_30C66(canal6.+0→4, v3438, v362, v364)  ⟨278912⟩
                                                                    si v16 != 0 :
                                                                        Scene_Tick(scène=scène17)     ⟨278926⟩
                                                                        charge(mid15voc 16)           ⟨278934⟩
                                                                        voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid15voc 16)  ⟨278940⟩
                                                                        voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)  ⟨278945⟩
                                                                    sinon :
                                                                        Widget_Method_DispatchC_314CB(zone1, 0)  ⟨278954⟩
                                                                        Widget_Method_Dispatch8_314A9(zone1, 248)  ⟨278959⟩
                                                                    tant que (scène17.compteur < 45) et (scène17.terminée == 0) :
                                                                        v376 = scène17.compteur       ⟨278968⟩
                                                                        v378 = di                     ⟨278969⟩
                                                                        c66.image = v378              ⟨278972⟩
                                                                        si v376 == 18 :
                                                                            si v16 == 0 :
                                                                                sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[25])  ⟨278987⟩
                                                                        si v376 == 42 :
                                                                            si v16 == 0 :
                                                                                v3452 = 4540          ⟨278998⟩
                                                                                v3452 = 4552          ⟨278999⟩
                                                                                v3452 = 4568          ⟨279000⟩
                                                                                v3452 = 4584          ⟨279001⟩
                                                                                v3452 = 4604          ⟨279002⟩
                                                                                Primitive_SetRectColorAndDraw_2CBE5(&v3452, v3339, v3337, v3335, v3333, 0, &v3362)  ⟨279012⟩
                                                                        si di <= 26 :
                                                                            di = di + v350            ⟨279019⟩
                                                                        sinon :
                                                                            si di == 29 :
                                                                                v350 = -1             ⟨279026⟩
                                                                            si di == 27 :
                                                                                v350 = 1              ⟨279031⟩
                                                                            si v376 & 1 != 0 :
                                                                                di = di + v350        ⟨279036⟩
                                                                        Scene_Tick(scène=scène17)     ⟨279068⟩
                                                                    voix_arrête(voix=voix1)           ⟨279096⟩
                                                                    v369 = 0                          ⟨279115⟩
                                                                    v368 = 0                          ⟨279116⟩
                                                                    canal_arrête(canal=canal6)        ⟨279119⟩
                                                                    v3436 = 0                         ⟨279137⟩
                                                                    v3431 = 0                         ⟨279138⟩
                                                                    v3430 = 0                         ⟨279139⟩
                                                                    v354 = 0                          ⟨279158⟩
                                                                    Scene_Destruct(scène=scène17, drapeaux=0)  ⟨279162⟩
                                                                    v332 = 0                          ⟨279187⟩
                                                                    v328 = 0                          ⟨279204⟩
                                                                    v322 = 0                          ⟨279206⟩
canal_arrête(canal=canal5)                                                                            ⟨279212⟩
v3388 = 0                                                                                             ⟨279230⟩
v3383 = 0                                                                                             ⟨279231⟩
v3382 = 0                                                                                             ⟨279232⟩
canal_arrête(canal=canal4)                                                                            ⟨279235⟩
v3374 = 0                                                                                             ⟨279253⟩
v3369 = 0                                                                                             ⟨279254⟩
v3368 = 0                                                                                             ⟨279255⟩
v309 = 0                                                                                              ⟨279273⟩
v308 = 0                                                                                              ⟨279274⟩
v299 = 0                                                                                              ⟨279292⟩
v298 = 0                                                                                              ⟨279293⟩
v274 = 0                                                                                              ⟨279319⟩
v269 = 0                                                                                              ⟨279320⟩
v268 = 0                                                                                              ⟨279321⟩
v253 = 0                                                                                              ⟨279344⟩
v252 = 0                                                                                              ⟨279345⟩
v237 = 0                                                                                              ⟨279368⟩
v236 = 0                                                                                              ⟨279369⟩
v221 = 0                                                                                              ⟨279392⟩
v220 = 0                                                                                              ⟨279393⟩
v205 = 0                                                                                              ⟨279416⟩
v204 = 0                                                                                              ⟨279417⟩
v189 = 0                                                                                              ⟨279440⟩
v188 = 0                                                                                              ⟨279441⟩
v173 = 0                                                                                              ⟨279464⟩
v172 = 0                                                                                              ⟨279465⟩
v157 = 0                                                                                              ⟨279488⟩
v156 = 0                                                                                              ⟨279489⟩
v147 = 0                                                                                              ⟨279507⟩
v146 = 0                                                                                              ⟨279508⟩
v137 = 0                                                                                              ⟨279526⟩
v136 = 0                                                                                              ⟨279527⟩
v127 = 0                                                                                              ⟨279545⟩
v126 = 0                                                                                              ⟨279546⟩
v117 = 0                                                                                              ⟨279564⟩
v116 = 0                                                                                              ⟨279565⟩
v107 = 0                                                                                              ⟨279583⟩
v106 = 0                                                                                              ⟨279584⟩
v97 = 0                                                                                               ⟨279602⟩
v96 = 0                                                                                               ⟨279603⟩
v87 = 0                                                                                               ⟨279621⟩
v86 = 0                                                                                               ⟨279622⟩
v77 = 0                                                                                               ⟨279640⟩
v76 = 0                                                                                               ⟨279641⟩
v67 = 0                                                                                               ⟨279659⟩
v66 = 0                                                                                               ⟨279660⟩
v57 = 0                                                                                               ⟨279678⟩
v56 = 0                                                                                               ⟨279679⟩
voix_arrête(voix=voix1)                                                                               ⟨279683⟩
v3290 = 0                                                                                             ⟨279701⟩
v3285 = 0                                                                                             ⟨279702⟩
v3284 = 0                                                                                             ⟨279703⟩
canal_arrête(canal=canal2)                                                                            ⟨279706⟩
v1216 = 0                                                                                             ⟨279724⟩
v1211 = 0                                                                                             ⟨279725⟩
v1210 = 0                                                                                             ⟨279726⟩
v39 = 0                                                                                               ⟨279749⟩
v38 = 0                                                                                               ⟨279750⟩
retour                                                                                                ⟨279802⟩
```

## Tableaux du segment de données

