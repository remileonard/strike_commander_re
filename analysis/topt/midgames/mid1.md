# Script extrait de `Midgame1_PlayPart1_69270` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## Midgame1_PlayPart1_69270

```
bp = sp                                                                                               ⟨203221⟩
tableau_textes(tableau=textes1, nombre=8, longueur=300)                                               ⟨203230⟩
tableau_textes(tableau=textes2, nombre=4, longueur=60)                                                ⟨203237⟩
tableau_textes(tableau=textes3, nombre=3, longueur=60)                                                ⟨203244⟩
v29 = 0                                                                                               ⟨203254⟩
v30 = 0                                                                                               ⟨203255⟩
v31 = 0                                                                                               ⟨203256⟩
si word_4CA5B != 0 :
    v29 = 1                                                                                           ⟨203259⟩
v34 = word_4D36E                                                                                      ⟨203263⟩
v454 = 0                                                                                              ⟨203264⟩
TextFormat_ApplyStyleAttribute_357D1(&v454, v34)                                                      ⟨203269⟩
v468 = 0                                                                                              ⟨203271⟩
TextRenderer_ApplyFormatChange_3584E(&v468, 0)                                                        ⟨203280⟩
sub_3499B(&v38, &v468)                                                                                ⟨203286⟩
sub_435F1(pak mid1)                                                                                   ⟨203311⟩
sub_435F1(pak midgames)                                                                               ⟨203332⟩
si v29 != 0 :
    si sub_993C(chemin1) != 0 :
        pak mid1voc.ouvre(chemin1, 1)                                                                 ⟨203363⟩
        sub_435F1(pak mid1voc)                                                                        ⟨203367⟩
    sinon :
        v29 = 0                                                                                       ⟨203372⟩
sinon :
    v29 = 0                                                                                           ⟨203372⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨203379⟩
charge(mid1 27)                                                                                       ⟨203391⟩
GlyphObject_ConstructWithBuffer_36D56(&v940, mid1 27)                                                 ⟨203397⟩
v940 = 9487                                                                                           ⟨203399⟩
v917 = 0                                                                                              ⟨203400⟩
TextRenderer_LoadResourceFile_437A9(chemin1, 3)                                                       ⟨203417⟩
v66 = ?                                                                                               ⟨203419⟩
v68 = TextRenderer_LoadResourceFile_437A9(chemin1, 3)                                                 ⟨203420⟩
v64 = v68                                                                                             ⟨203422⟩
v59 = 1                                                                                               ⟨203424⟩
v58 = 0                                                                                               ⟨203425⟩
GlyphObject_ConstructWithBuffer_36D56(&v964, &v64)                                                    ⟨203430⟩
zone_texte(zone=zone1, police=&v940)                                                                  ⟨203437⟩
v76 = 0                                                                                               ⟨203439⟩
charge(midgames 19)                                                                                   ⟨203453⟩
charge(midgames 20)                                                                                   ⟨203465⟩
charge(midgames 21)                                                                                   ⟨203477⟩
v116 = 0                                                                                              ⟨203479⟩
v111 = 0                                                                                              ⟨203481⟩
v110 = 0                                                                                              ⟨203482⟩
v126 = 0                                                                                              ⟨203483⟩
v121 = 0                                                                                              ⟨203485⟩
v120 = 0                                                                                              ⟨203486⟩
sub_435F1(pak optshps)                                                                                ⟨203506⟩
sub_435F1(pak optpals)                                                                                ⟨203527⟩
charge(optshps 116)                                                                                   ⟨203535⟩
charge(optshps 44)                                                                                    ⟨203543⟩
v132 = 0                                                                                              ⟨203545⟩
v138 = 0                                                                                              ⟨203547⟩
v144 = 0                                                                                              ⟨203549⟩
v150 = 0                                                                                              ⟨203551⟩
v156 = 0                                                                                              ⟨203553⟩
charge(optpals 21)                                                                                    ⟨203565⟩
palette_depuis(pal2(optpals 21))                                                                      ⟨203571⟩
charge(optpals 24)                                                                                    ⟨203583⟩
palette_depuis(pal3(optpals 24))                                                                      ⟨203589⟩
charge(midgames 22)                                                                                   ⟨203601⟩
palette_depuis(pal4(midgames 22))                                                                     ⟨203607⟩
charge(mid1 59)                                                                                       ⟨203619⟩
palette_depuis(pal5(mid1 59))                                                                         ⟨203625⟩
v368 = 0                                                                                              ⟨203644⟩
v358 = 0                                                                                              ⟨203662⟩
v348 = 0                                                                                              ⟨203680⟩
v338 = 0                                                                                              ⟨203698⟩
v338 = 0                                                                                              ⟨203702⟩
charge_convdata_type2("normal")                                                                       ⟨203707⟩
palette_depuis(pal6(convdata type 2 "normal"))                                                        ⟨203713⟩
v338 = 0                                                                                              ⟨203732⟩
v158 = byte_4CA58                                                                                     ⟨203734⟩
si v29 == 0 :
    si v158 - 1 <= 4 :
        si (v158 - 1)·2 == 0 ou ((v158 - 1)·2 != 2) et (((v158 - 1)·2 != 4) et (((v158 - 1)·2 != 6) et ((v158 - 1)·2 != 8))) :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨203775⟩
            sub_435F1(pak rsoundfx)                                                                   ⟨203779⟩
            flux_iff(flux=flux1)                                                                      ⟨203793⟩
            v3595 = 256                                                                               ⟨203796⟩
            v3599 = 0                                                                                 ⟨203797⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨203805⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨203811⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨203817⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨203821⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨203823⟩
            si = 1                                                                                    ⟨203824⟩
            tant que si <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨203830⟩
                ds:26002[si·2] = iff_lit_mot(flux=flux1)                                              ⟨203834⟩
                si = si + 1                                                                           ⟨203835⟩
            iff_ferme_form(flux=flux1)                                                                ⟨203842⟩
            v31 = 1                                                                                   ⟨203844⟩
            iff_ferme_form(flux=flux1)                                                                ⟨203848⟩
        sinon :
            si sub_993C(chemin1) != 0 :
                si word_4CA5D != 0 :
                    pak asoundfx.ouvre(chemin1, 1)                                                    ⟨203899⟩
                    sub_435F1(pak asoundfx)                                                           ⟨203903⟩
                    flux_iff(flux=flux1)                                                              ⟨203917⟩
                    v3595 = 256                                                                       ⟨203920⟩
                    v3599 = 0                                                                         ⟨203921⟩
                    flux1.ouvre(chemin1, 1)                                                           ⟨203929⟩
                    iff_form(flux=flux1, balise='VOLU', x=0)                                          ⟨203935⟩
                    iff_chunk(flux=flux1, balise='ADLB', x=1)                                         ⟨203941⟩
                    iff_lit_mot(flux=flux1)                                                           ⟨203945⟩
                    word_4F048 = iff_lit_mot(flux=flux1)                                              ⟨203947⟩
                    si = 1                                                                            ⟨203948⟩
                    tant que si <= 106 :
                        iff_lit_mot(flux=flux1)                                                       ⟨203954⟩
                        ds:26002[si·2] = iff_lit_mot(flux=flux1)                                      ⟨203958⟩
                        si = si + 1                                                                   ⟨203959⟩
                    iff_ferme_form(flux=flux1)                                                        ⟨203966⟩
                    v31 = 1                                                                           ⟨203968⟩
                    iff_ferme_form(flux=flux1)                                                        ⟨203972⟩
tableau_objets(objets1 : 6 objets de 10 octets)                                                       ⟨203991⟩
v164 = word_4AC1E                                                                                     ⟨203994⟩
v162 = word_4AC20                                                                                     ⟨203996⟩
v160 = word_4AC22                                                                                     ⟨203998⟩
si v31 != 0 :
    v3532 = word_4D392                                                                                ⟨204006⟩
    word_4D392 = &v3534                                                                               ⟨204008⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨204017⟩
    si = 0                                                                                            ⟨204019⟩
    tant que si < 6 :
        charge(asoundfx v164[si])                                                                     ⟨204035⟩
        canal_enregistre(canal=canal1, ressource=objets1[si], x=0)                                    ⟨204046⟩
        canal_arrête(canal=canal1)                                                                    ⟨204050⟩
        si = si + 1                                                                                   ⟨204052⟩
    canal_arrête(canal=canal1)                                                                        ⟨204059⟩
    sub_5C1C(&v3534, 2)                                                                               ⟨204064⟩
v174 = 0                                                                                              ⟨204068⟩
v169 = 0                                                                                              ⟨204070⟩
v168 = 0                                                                                              ⟨204071⟩
v1420 = 436                                                                                           ⟨204072⟩
v1418 = word_4D392                                                                                    ⟨204074⟩
word_4D392 = &v1420                                                                                   ⟨204076⟩
v1420 = 444                                                                                           ⟨204077⟩
v1424 = 0                                                                                             ⟨204080⟩
si v158 - 1 <= 4 :
    si (v158 - 1)·2 != 0 :
        si (v158 - 1)·2 == 2 : aller à loc_69DAB                                                      ⟨204089⟩
        si (v158 - 1)·2 == 4 : aller à loc_69D8C                                                      ⟨204089⟩
        si (v158 - 1)·2 == 6 : aller à loc_69DAB                                                      ⟨204089⟩
        si (v158 - 1)·2 == 8 : aller à loc_69DAB                                                      ⟨204089⟩
    v30 = 1                                                                                           ⟨204102⟩
    aller à loc_69DCA                                                                                 ⟨204103⟩
    loc_69D8C:                                                                                        ⟨204105⟩
    v30 = 1                                                                                           ⟨204116⟩
    aller à loc_69DCA                                                                                 ⟨204117⟩
    loc_69DAB:                                                                                        ⟨204119⟩
    v30 = 1                                                                                           ⟨204130⟩
loc_69DCA:                                                                                            ⟨204133⟩
si v30 != 0 :
    sub_435F1(pak mmusic)                                                                             ⟨204145⟩
    charge(mmusic 0)                                                                                  ⟨204153⟩
    canal_init(canal=canal2, pilote=word_4CA59)                                                       ⟨204158⟩
    canal_enregistre(canal=canal2, ressource=mmusic 0, x=0)                                           ⟨204165⟩
v3510 = 4767                                                                                          ⟨204174⟩
v3494 = 0                                                                                             ⟨204175⟩
v3489 = 0                                                                                             ⟨204177⟩
v3488 = 0                                                                                             ⟨204178⟩
v3510 = 8101                                                                                          ⟨204180⟩
v1433 = booléen                                                                                       ⟨204182⟩
v1429 = booléen                                                                                       ⟨204183⟩
v3518 = word_4D392                                                                                    ⟨204186⟩
word_4D392 = &v3520                                                                                   ⟨204188⟩
si v31 != 0 :
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨204199⟩
flux_iff(flux=flux1)                                                                                  ⟨204215⟩
v3595 = 256                                                                                           ⟨204218⟩
v3599 = 0                                                                                             ⟨204219⟩
flux1.ouvre(chemin1, 1)                                                                               ⟨204227⟩
iff_form(flux=flux1, balise='MG01', x=0)                                                              ⟨204233⟩
iff_form(flux=flux1, balise='DATA', x=0)                                                              ⟨204239⟩
si = 0                                                                                                ⟨204241⟩
tant que si < 4 :
    iff_chunk(flux=flux1, balise='TEXT', x=1)                                                         ⟨204249⟩
    di = v3578                                                                                        ⟨204251⟩
    si v3578 > 60 :
        Runtime_FatalErrorHandler_36797(9375)                                                         ⟨204255⟩
    iff_lit(flux=flux1, destination=textes2[0] + (textes2.+0·si), taille=v3578)                       ⟨204269⟩
    v3591 = v3574                                                                                     ⟨204272⟩
    si = si + 1                                                                                       ⟨204273⟩
si = 0                                                                                                ⟨204278⟩
tant que si < 3 :
    iff_chunk(flux=flux1, balise='TEXT', x=1)                                                         ⟨204286⟩
    di = v3578                                                                                        ⟨204288⟩
    si v3578 > 60 :
        Runtime_FatalErrorHandler_36797(9408)                                                         ⟨204292⟩
    iff_lit(flux=flux1, destination=textes3[0] + (textes3.+0·si), taille=v3578)                       ⟨204306⟩
    v3591 = v3574                                                                                     ⟨204309⟩
    si = si + 1                                                                                       ⟨204310⟩
iff_ferme(flux=flux1)                                                                                 ⟨204317⟩
si v29 != 0 :
    voix_pilote(voix=voix1, pilote=word_4CA5B)                                                        ⟨204324⟩
sinon :
    iff_form(flux=flux1, balise='SPOK', x=0)                                                          ⟨204333⟩
    di = 0                                                                                            ⟨204335⟩
    tant que di < 8 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨204343⟩
        v336 = v3578                                                                                  ⟨204346⟩
        si v336 > 300 :
            Runtime_FatalErrorHandler_36797(9441)                                                     ⟨204350⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·di), taille=v336)                    ⟨204364⟩
        v3591 = v3574                                                                                 ⟨204367⟩
        di = di + 1                                                                                   ⟨204368⟩
iff_ferme_form(flux=flux1)                                                                            ⟨204377⟩
iff_ferme_form(flux=flux1)                                                                            ⟨204382⟩
v178 = 0                                                                                              ⟨204393⟩
palette_remplit(palette=pal1, couleur=&v178, premier=0, nombre=256)                                   ⟨204402⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨204410⟩
dessine_image(surface=surface1, x=0, y=24, données=données(optshps 116.+0), image=0)                  ⟨204427⟩
dessine_image(surface=surface1, x=0, y=24, données=données(midgames 20.+0), image=0)                  ⟨204444⟩
vide_entrées()                                                                                        ⟨204446⟩
v3820 = v76                                                                                           ⟨204452⟩
v3818 = 152                                                                                           ⟨204454⟩
v3816 = 319                                                                                           ⟨204456⟩
v3814 = 199                                                                                           ⟨204458⟩
sub_30A1D(&v3558, word_4D36E, &v964)                                                                  ⟨204461⟩
v338 = 0                                                                                              ⟨204466⟩
charge(mid1 60)                                                                                       ⟨204473⟩
v348 = 0                                                                                              ⟨204478⟩
charge(mid1 48)                                                                                       ⟨204485⟩
palette_depuis(pal7(mid1 48))                                                                         ⟨204492⟩

──── scène1 ────
scène1 = Scene_Create(cadence=10, palette=255, surface=surface1)                                      ⟨204500⟩
si v30 != 0 :
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v1422)                                        ⟨204509⟩
palette_copie(destination=pal1, source=pal2(optpals 21))                                              ⟨204521⟩
palette_copie(destination=pal1, source=pal4(midgames 22))                                             ⟨204530⟩
palette_copie(destination=pal1, source=pal3(optpals 24))                                              ⟨204539⟩
fondu_apparition(palette=pal1, couleur=&v178, pas=2, premier=0, nombre=256)                           ⟨204548⟩
c1 = MovingLayer(ressource=optshps 116, x=0, y=0)                                                     ⟨204561⟩
c1.vx = 0                                                                                             ⟨204568⟩
c1.vy = 0                                                                                             ⟨204570⟩
c2 = MovingLayer(ressource=midgames 20, x=0, y=0)                                                     ⟨204590⟩
c2.vx = 0                                                                                             ⟨204597⟩
c2.vy = 0                                                                                             ⟨204599⟩
ajoute c1 à scène1                                                                                    ⟨204611⟩
ajoute c2 à scène1                                                                                    ⟨204616⟩
charge(mid1 3)                                                                                        ⟨204628⟩
c3 = AnimLayer(ressource=mid1 3, x=0, y=0)                                                            ⟨204635⟩
si = c3                                                                                               ⟨204637⟩
si v29 != 0 :
    charge(mid1voc 7)                                                                                 ⟨204650⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 7)                                  ⟨204656⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨204665⟩
        canal_enregistre(canal=canal3, ressource=objets1, x=0)                                        ⟨204672⟩
tant que (scène1.compteur < 20) et (scène1.terminée == 0) :
    Scene_Tick(scène=scène1)                                                                          ⟨204681⟩
ajoute c3 à scène1                                                                                    ⟨204704⟩
si byte_4F55C == 0 :
    si v29 != 0 :
        voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                               ⟨204715⟩
    sinon :
        si v31 != 0 :
            si canal3.+0 != 0 :
                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3522)                                ⟨204727⟩
tant que animation_finie(calque=c3) == 0 :
    si scène1.compteur == 35 :
        si v29 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨204742⟩
        sinon :
            si v31 != 0 :
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3522)                            ⟨204754⟩
    Scene_Tick(scène=scène1)                                                                          ⟨204761⟩
retire(parent=scène1, calque=c3)                                                                      ⟨204774⟩
c3.détruit(3)                                                                                         ⟨204781⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨204790⟩
v422 = 0                                                                                              ⟨204811⟩
v412 = 0                                                                                              ⟨204829⟩
Scene_SetFps(scène=scène1, cadence=20)                                                                ⟨204833⟩
si byte_4F55C != 0 :
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨204843⟩
    v348 = 0                                                                                          ⟨204866⟩
    v338 = 0                                                                                          ⟨204884⟩
    canal_arrête(canal=canal3)                                                                        ⟨204891⟩
    sub_5C1C(&v3520, 2)                                                                               ⟨204896⟩
    voix_arrête(voix=voix1)                                                                           ⟨204901⟩
    v3494 = 0                                                                                         ⟨204918⟩
    v3489 = 0                                                                                         ⟨204919⟩
    v3488 = 0                                                                                         ⟨204920⟩
    canal_arrête(canal=canal2)                                                                        ⟨204923⟩
    sub_5C1C(&v1420, 2)                                                                               ⟨204928⟩
    v169 = 0                                                                                          ⟨204946⟩
    v168 = 0                                                                                          ⟨204947⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, sub_479E0)                                                     ⟨204955⟩
    v121 = 0                                                                                          ⟨205008⟩
    v120 = 0                                                                                          ⟨205009⟩
    v111 = 0                                                                                          ⟨205026⟩
    v110 = 0                                                                                          ⟨205027⟩
    v101 = 0                                                                                          ⟨205044⟩
    v100 = 0                                                                                          ⟨205045⟩
    v91 = 0                                                                                           ⟨205062⟩
    v90 = 0                                                                                           ⟨205063⟩
    v81 = 0                                                                                           ⟨205080⟩
    v80 = 0                                                                                           ⟨205081⟩
    v64 = 0                                                                                           ⟨205106⟩
    v59 = 0                                                                                           ⟨205107⟩
    v58 = 0                                                                                           ⟨205108⟩
    v49 = 0                                                                                           ⟨205130⟩
    v48 = 0                                                                                           ⟨205131⟩
    retour                                                                                            ⟨205181⟩
vide_entrées()                                                                                        ⟨205184⟩
palette_copie(destination=pal1, source=pal5(mid1 59))                                                 ⟨205193⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨205201⟩
di = 0                                                                                                ⟨205203⟩
tant que di < 4 :
    lit_touche(événement=objet1, x=255)                                                               ⟨205210⟩
    si v411 == 1 :
        byte_4F55C = 1                                                                                ⟨205217⟩
        Scene_Destruct(scène=scène1, drapeaux=0)                                                      ⟨205221⟩
        v348 = 0                                                                                      ⟨205244⟩
        v338 = 0                                                                                      ⟨205262⟩
        canal_arrête(canal=canal3)                                                                    ⟨205269⟩
        sub_5C1C(&v3520, 2)                                                                           ⟨205274⟩
        voix_arrête(voix=voix1)                                                                       ⟨205279⟩
        v3494 = 0                                                                                     ⟨205296⟩
        v3489 = 0                                                                                     ⟨205297⟩
        v3488 = 0                                                                                     ⟨205298⟩
        canal_arrête(canal=canal2)                                                                    ⟨205301⟩
        sub_5C1C(&v1420, 2)                                                                           ⟨205306⟩
        v169 = 0                                                                                      ⟨205324⟩
        v168 = 0                                                                                      ⟨205325⟩
        CRT_Doprnt_Core(objets1, 10, 6, 1, sub_479E0)                                                 ⟨205333⟩
        v121 = 0                                                                                      ⟨205386⟩
        v120 = 0                                                                                      ⟨205387⟩
        v111 = 0                                                                                      ⟨205404⟩
        v110 = 0                                                                                      ⟨205405⟩
        v101 = 0                                                                                      ⟨205422⟩
        v100 = 0                                                                                      ⟨205423⟩
        v91 = 0                                                                                       ⟨205440⟩
        v90 = 0                                                                                       ⟨205441⟩
        v81 = 0                                                                                       ⟨205458⟩
        v80 = 0                                                                                       ⟨205459⟩
        v64 = 0                                                                                       ⟨205484⟩
        v59 = 0                                                                                       ⟨205485⟩
        v58 = 0                                                                                       ⟨205486⟩
        v49 = 0                                                                                       ⟨205508⟩
        v48 = 0                                                                                       ⟨205509⟩
        retour                                                                                        ⟨205559⟩
    si v369 != 0 : aller à loc_6B64A                                                                  ⟨205563⟩
    v416 = booléen                                                                                    ⟨205568⟩
    v420 = booléen                                                                                    ⟨205569⟩
    si = 0                                                                                            ⟨205570⟩
    tant que si < 16 :
        si touche_passer() != 0 :
            v369 = 1                                                                                  ⟨205577⟩
            aller à loc_6AFE6                                                                         ⟨205578⟩
        v416 = 3                                                                                      ⟨205581⟩
        dessine_image(surface=surface2, x=0, y=0, données=données(optshps 116.+0), image=0)           ⟨205599⟩
        dessine_image(surface=surface2, x=0, y=0, données=données(midgames 20.+0), image=0)           ⟨205616⟩
        v424 = données(mid1voc 9.+0) + (si·4096)                                                      ⟨205630⟩
        v917 = v424                                                                                   ⟨205632⟩
        v913 = 239                                                                                    ⟨205633⟩
        v911 = 16                                                                                     ⟨205634⟩
        si di == 1 :
            ax = 35                                                                                   ⟨205637⟩
        sinon :
            ax = 50                                                                                   ⟨205641⟩
        v440 = ax                                                                                     ⟨205644⟩
        texte_formaté(zone=zone1, format=9467, a=2, b=v440, c=textes2[0] + (textes2.+0·di))           ⟨205655⟩
        présente(source=pal8, destination=pal9)                                                       ⟨205661⟩
        attend(chronomètre=objet2)                                                                    ⟨205665⟩
        si = si + 1                                                                                   ⟨205667⟩
    loc_6AFE6:                                                                                        ⟨205674⟩
    lit_touche(événement=objet1, x=255)                                                               ⟨205678⟩
    si v411 == 1 :
        byte_4F55C = 1                                                                                ⟨205685⟩
        Scene_Destruct(scène=scène1, drapeaux=0)                                                      ⟨205689⟩
        v348 = 0                                                                                      ⟨205712⟩
        v338 = 0                                                                                      ⟨205730⟩
        canal_arrête(canal=canal3)                                                                    ⟨205737⟩
        sub_5C1C(&v3520, 2)                                                                           ⟨205742⟩
        voix_arrête(voix=voix1)                                                                       ⟨205747⟩
        v3494 = 0                                                                                     ⟨205764⟩
        v3489 = 0                                                                                     ⟨205765⟩
        v3488 = 0                                                                                     ⟨205766⟩
        canal_arrête(canal=canal2)                                                                    ⟨205769⟩
        sub_5C1C(&v1420, 2)                                                                           ⟨205774⟩
        v169 = 0                                                                                      ⟨205792⟩
        v168 = 0                                                                                      ⟨205793⟩
        CRT_Doprnt_Core(objets1, 10, 6, 1, sub_479E0)                                                 ⟨205801⟩
        v121 = 0                                                                                      ⟨205854⟩
        v120 = 0                                                                                      ⟨205855⟩
        v111 = 0                                                                                      ⟨205872⟩
        v110 = 0                                                                                      ⟨205873⟩
        v101 = 0                                                                                      ⟨205890⟩
        v100 = 0                                                                                      ⟨205891⟩
        v91 = 0                                                                                       ⟨205908⟩
        v90 = 0                                                                                       ⟨205909⟩
        v81 = 0                                                                                       ⟨205926⟩
        v80 = 0                                                                                       ⟨205927⟩
        v64 = 0                                                                                       ⟨205952⟩
        v59 = 0                                                                                       ⟨205953⟩
        v58 = 0                                                                                       ⟨205954⟩
        v49 = 0                                                                                       ⟨205976⟩
        v48 = 0                                                                                       ⟨205977⟩
        retour                                                                                        ⟨206027⟩
    si v369 != 0 : aller à loc_6B64A                                                                  ⟨206031⟩
    v426 = 100                                                                                        ⟨206035⟩
    v430 = v426                                                                                       ⟨206037⟩
    v416 = v430                                                                                       ⟨206039⟩
    attend(chronomètre=objet2)                                                                        ⟨206044⟩
    si = 15                                                                                           ⟨206046⟩
    tant que si > -1 :
        si touche_passer() != 0 :
            v369 = 1                                                                                  ⟨206053⟩
            aller à loc_6B591                                                                         ⟨206054⟩
        v416 = 3                                                                                      ⟨206057⟩
        dessine_image(surface=surface3, x=0, y=0, données=données(optshps 116.+0), image=0)           ⟨206075⟩
        dessine_image(surface=surface3, x=0, y=0, données=données(midgames 20.+0), image=0)           ⟨206092⟩
        v434 = données(mid1voc 9.+0) + (si·4096)                                                      ⟨206106⟩
        v917 = v434                                                                                   ⟨206108⟩
        v913 = 239                                                                                    ⟨206109⟩
        v911 = 16                                                                                     ⟨206110⟩
        si di == 1 :
            ax = 35                                                                                   ⟨206113⟩
        sinon :
            ax = 50                                                                                   ⟨206117⟩
        v440 = ax                                                                                     ⟨206120⟩
        texte_formaté(zone=zone1, format=9474, a=2, b=v440, c=textes2[0] + (textes2.+0·di))           ⟨206131⟩
        présente(source=pal10, destination=pal9)                                                      ⟨206137⟩
        attend(chronomètre=objet2)                                                                    ⟨206141⟩
        si = si - 1                                                                                   ⟨206143⟩
    loc_6B591:                                                                                        ⟨206150⟩
    si v369 != 0 : aller à loc_6B64A                                                                  ⟨206152⟩
    dessine_image(surface=surface4, x=0, y=0, données=données(optshps 116.+0), image=0)               ⟨206171⟩
    dessine_image(surface=pal11, x=0, y=0, données=données(midgames 20.+0), image=0)                  ⟨206188⟩
    présente(source=pal11, destination=pal9)                                                          ⟨206194⟩
    v426 = 100                                                                                        ⟨206196⟩
    si di == 1 :
        v426 = 250                                                                                    ⟨206199⟩
    v438 = v426                                                                                       ⟨206203⟩
    v416 = v438                                                                                       ⟨206205⟩
    attend(chronomètre=objet2)                                                                        ⟨206210⟩
    di = di + 1                                                                                       ⟨206212⟩
loc_6B64A:                                                                                            ⟨206219⟩
si byte_4F55C != 0 :
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨206228⟩
    v348 = 0                                                                                          ⟨206251⟩
    v338 = 0                                                                                          ⟨206269⟩
    canal_arrête(canal=canal3)                                                                        ⟨206276⟩
    sub_5C1C(&v3520, 2)                                                                               ⟨206281⟩
    voix_arrête(voix=voix1)                                                                           ⟨206286⟩
    v3494 = 0                                                                                         ⟨206303⟩
    v3489 = 0                                                                                         ⟨206304⟩
    v3488 = 0                                                                                         ⟨206305⟩
    canal_arrête(canal=canal2)                                                                        ⟨206308⟩
    sub_5C1C(&v1420, 2)                                                                               ⟨206313⟩
    v169 = 0                                                                                          ⟨206331⟩
    v168 = 0                                                                                          ⟨206332⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, sub_479E0)                                                     ⟨206340⟩
    v121 = 0                                                                                          ⟨206393⟩
    v120 = 0                                                                                          ⟨206394⟩
    v111 = 0                                                                                          ⟨206411⟩
    v110 = 0                                                                                          ⟨206412⟩
    v101 = 0                                                                                          ⟨206429⟩
    v100 = 0                                                                                          ⟨206430⟩
    v91 = 0                                                                                           ⟨206447⟩
    v90 = 0                                                                                           ⟨206448⟩
    v81 = 0                                                                                           ⟨206465⟩
    v80 = 0                                                                                           ⟨206466⟩
    v64 = 0                                                                                           ⟨206491⟩
    v59 = 0                                                                                           ⟨206492⟩
    v58 = 0                                                                                           ⟨206493⟩
    v49 = 0                                                                                           ⟨206515⟩
    v48 = 0                                                                                           ⟨206516⟩
    retour                                                                                            ⟨206566⟩
scène1.terminée = 0                                                                                   ⟨206569⟩
vide_entrées()                                                                                        ⟨206570⟩
c1.vx = 0                                                                                             ⟨206572⟩
c1.vy = -1                                                                                            ⟨206574⟩
c2.vx = 0                                                                                             ⟨206576⟩
c2.vy = -1                                                                                            ⟨206578⟩
palette_copie(destination=pal1, source=pal7(mid1 48))                                                 ⟨206586⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨206594⟩
c4 = MovingLayer(ressource=midgames 19, x=0, y=150, image=0)                                          ⟨206608⟩
c4.vx = 0                                                                                             ⟨206615⟩
c4.vy = 0                                                                                             ⟨206617⟩
c4.vx = 0                                                                                             ⟨206619⟩
c4.vy = -1                                                                                            ⟨206621⟩
ajoute c4 à scène1                                                                                    ⟨206633⟩
c5 = MovingLayer(ressource=optshps 44, x=0, y=17, image=0)                                            ⟨206647⟩
c5.vx = 0                                                                                             ⟨206654⟩
c5.vy = 0                                                                                             ⟨206656⟩
c5.vx = 0                                                                                             ⟨206658⟩
c5.vy = -1                                                                                            ⟨206660⟩
ajoute c5 à scène1                                                                                    ⟨206672⟩
c6 = MovingLayer(ressource=midgames 19, x=0, y=200, image=1)                                          ⟨206686⟩
c6.vx = 0                                                                                             ⟨206693⟩
c6.vy = 0                                                                                             ⟨206695⟩
c6.vx = 0                                                                                             ⟨206697⟩
c6.vy = -1                                                                                            ⟨206699⟩
ajoute c6 à c5                                                                                        ⟨206710⟩
c7 = MovingLayer(ressource=midgames 19, x=0, y=43, image=2)                                           ⟨206724⟩
c7.vx = 0                                                                                             ⟨206731⟩
c7.vy = 0                                                                                             ⟨206733⟩
c7.vx = 0                                                                                             ⟨206735⟩
c7.vy = -1                                                                                            ⟨206737⟩
ajoute c7 à c6                                                                                        ⟨206748⟩
tant que c7.y_absolu() > 60 :
    Scene_Tick(scène=scène1)                                                                          ⟨206755⟩
c1.vx = 0                                                                                             ⟨206767⟩
c1.vy = 0                                                                                             ⟨206769⟩
c2.vx = 0                                                                                             ⟨206771⟩
c2.vy = 0                                                                                             ⟨206773⟩
c4.vx = 0                                                                                             ⟨206775⟩
c4.vy = 0                                                                                             ⟨206777⟩
c5.vx = 0                                                                                             ⟨206779⟩
c5.vy = 0                                                                                             ⟨206781⟩
c6.vx = 0                                                                                             ⟨206783⟩
c6.vy = 0                                                                                             ⟨206785⟩
c7.vx = 0                                                                                             ⟨206787⟩
c7.vy = 0                                                                                             ⟨206789⟩
Scene_Tick(scène=scène1)                                                                              ⟨206792⟩
charge(mid1 13)                                                                                       ⟨206804⟩
c8 = AnimLayer(ressource=mid1 13, x=0, y=-70)                                                         ⟨206811⟩
ajoute c8 à scène1                                                                                    ⟨206817⟩
si v29 != 0 :
    charge(mid1voc 8)                                                                                 ⟨206831⟩
    voix_arrête(voix=voix1)                                                                           ⟨206835⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 8)                                  ⟨206841⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨206850⟩
        canal_enregistre(canal=canal3, ressource=objets1[1], x=0)                                     ⟨206857⟩
scène1.compteur = 0                                                                                   ⟨206861⟩
tant que animation_finie(calque=c8) == 0 :
    si scène1.compteur == 65 :
        si v29 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨206872⟩
        sinon :
            si v31 != 0 :
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3522)                            ⟨206884⟩
    Scene_Tick(scène=scène1)                                                                          ⟨206891⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨206905⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨206913⟩
v402 = 0                                                                                              ⟨206934⟩
v396 = 0                                                                                              ⟨206950⟩
v390 = 0                                                                                              ⟨206952⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨206956⟩
v348 = 0                                                                                              ⟨206979⟩
v338 = 0                                                                                              ⟨206997⟩
vide_entrées()                                                                                        ⟨207002⟩
si byte_4F55C != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨207010⟩
    sub_5C1C(&v3520, 2)                                                                               ⟨207015⟩
    voix_arrête(voix=voix1)                                                                           ⟨207020⟩
    v3494 = 0                                                                                         ⟨207037⟩
    v3489 = 0                                                                                         ⟨207038⟩
    v3488 = 0                                                                                         ⟨207039⟩
    canal_arrête(canal=canal2)                                                                        ⟨207042⟩
    sub_5C1C(&v1420, 2)                                                                               ⟨207047⟩
    v169 = 0                                                                                          ⟨207065⟩
    v168 = 0                                                                                          ⟨207066⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, sub_479E0)                                                     ⟨207074⟩
    v121 = 0                                                                                          ⟨207127⟩
    v120 = 0                                                                                          ⟨207128⟩
    v111 = 0                                                                                          ⟨207145⟩
    v110 = 0                                                                                          ⟨207146⟩
    v101 = 0                                                                                          ⟨207163⟩
    v100 = 0                                                                                          ⟨207164⟩
    v91 = 0                                                                                           ⟨207181⟩
    v90 = 0                                                                                           ⟨207182⟩
    v81 = 0                                                                                           ⟨207199⟩
    v80 = 0                                                                                           ⟨207200⟩
    v64 = 0                                                                                           ⟨207225⟩
    v59 = 0                                                                                           ⟨207226⟩
    v58 = 0                                                                                           ⟨207227⟩
    v49 = 0                                                                                           ⟨207249⟩
    v48 = 0                                                                                           ⟨207250⟩
    retour                                                                                            ⟨207300⟩
charge(mid1 6)                                                                                        ⟨207313⟩
charge(mid1 26)                                                                                       ⟨207325⟩
charge(mid1 11)                                                                                       ⟨207337⟩
charge(mid1 12)                                                                                       ⟨207349⟩
charge(mid1 42)                                                                                       ⟨207361⟩
palette_depuis(pal12(mid1 42))                                                                        ⟨207368⟩

──── scène2 ────
scène2 = Scene_Create(cadence=20, palette=255, surface=pal9)                                          ⟨207386⟩
v338 = 0                                                                                              ⟨207391⟩
charge(mid1 54)                                                                                       ⟨207398⟩
palette_depuis(pal13(mid1 54))                                                                        ⟨207405⟩
c9 = Layer(ressource=optshps 116, x=0, y=-24)                                                         ⟨207412⟩
ajoute c9 à scène2                                                                                    ⟨207418⟩
charge(mid1 20)                                                                                       ⟨207430⟩
c10 = LoopAnimLayer(ressource=mid1 20, x=0, y=-40)                                                    ⟨207443⟩
c10.mode = 0                                                                                          ⟨207450⟩
ajoute c10 à scène2                                                                                   ⟨207462⟩
c11 = Layer(ressource=mid1 6, x=0, y=-24)                                                             ⟨207469⟩
ajoute c11 à scène2                                                                                   ⟨207475⟩
c12 = ClippedMovingLayer(ressource=mid1 11, x=159, y=40)                                              ⟨207482⟩
c12.découpe_gauche = 131                                                                              ⟨207486⟩
c12.découpe_haut = 9                                                                                  ⟨207488⟩
c12.découpe_droite = 190                                                                              ⟨207490⟩
c12.découpe_bas = 67                                                                                  ⟨207492⟩
ajoute c12 à scène2                                                                                   ⟨207496⟩
c13 = Layer(ressource=mid1 12, x=99, y=108)                                                           ⟨207503⟩
ajoute c13 à scène2                                                                                   ⟨207509⟩
c14 = ImageLayer(ressource=mid1 12, x=195, y=107, image=3)                                            ⟨207517⟩
ajoute c14 à scène2                                                                                   ⟨207523⟩
c15 = ImageLayer(ressource=mid1 11, x=135, y=22, image=7)                                             ⟨207531⟩
ajoute c15 à scène2                                                                                   ⟨207537⟩
c16 = ImageLayer(ressource=mid1 11, x=185, y=22, image=16)                                            ⟨207545⟩
ajoute c16 à scène2                                                                                   ⟨207551⟩
c17 = ImageLayer(ressource=mid1 11, x=160, y=38, image=21)                                            ⟨207559⟩
ajoute c17 à scène2                                                                                   ⟨207565⟩
c18 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=22)                              ⟨207573⟩
c18.découpe_gauche = 131                                                                              ⟨207577⟩
c18.découpe_haut = 9                                                                                  ⟨207579⟩
c18.découpe_droite = 190                                                                              ⟨207581⟩
c18.découpe_bas = 67                                                                                  ⟨207583⟩
ajoute c18 à scène2                                                                                   ⟨207587⟩
c19 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=23)                              ⟨207595⟩
c19.découpe_gauche = 131                                                                              ⟨207599⟩
c19.découpe_haut = 9                                                                                  ⟨207601⟩
c19.découpe_droite = 190                                                                              ⟨207603⟩
c19.découpe_bas = 67                                                                                  ⟨207605⟩
ajoute c19 à scène2                                                                                   ⟨207609⟩
c20 = ImageLayer(ressource=mid1 11, x=159, y=40, image=24)                                            ⟨207617⟩
ajoute c20 à scène2                                                                                   ⟨207623⟩
c21 = ImageLayer(ressource=mid1 11, x=138, y=17, image=26)                                            ⟨207631⟩
ajoute c21 à scène2                                                                                   ⟨207637⟩
c22 = ImageLayer(ressource=mid1 11, x=140, y=63, image=27)                                            ⟨207645⟩
ajoute c22 à scène2                                                                                   ⟨207651⟩
c23 = ImageLayer(ressource=mid1 11, x=178, y=63, image=28)                                            ⟨207659⟩
ajoute c23 à scène2                                                                                   ⟨207665⟩
palette_copie(destination=pal1, source=pal13(mid1 54))                                                ⟨207678⟩
palette_copie(destination=pal1, source=pal12(mid1 42))                                                ⟨207687⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨207695⟩
v394 = 16                                                                                             ⟨207697⟩
v396 = 7                                                                                              ⟨207698⟩
T1 = tableau de 164 octets copié depuis unk_4AC24                                                     ⟨207705⟩
si = 8940                                                                                             ⟨207708⟩
T2 = tableau de 82 octets copié depuis ds:8940                                                        ⟨207713⟩
si v29 != 0 :
    charge(mid1voc 9)                                                                                 ⟨207726⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 9)                                  ⟨207732⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨207737⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨207746⟩
        canal_enregistre(canal=canal3, ressource=objets1[2], x=0)                                     ⟨207753⟩
        si canal3.+0 != 0 :
            AIL_start_sequence(pilote=canal3.+0→4, séquence=v3522)                                    ⟨207760⟩
tant que (scène2.compteur < 40) et (scène2.terminée == 0) :
    si scène2.compteur & 1 != 0 :
        v394 = v394 + 1                                                                               ⟨207770⟩
        si v394 == 21 :
            v394_avant = v394                                                                         ⟨207774⟩
            v394 = 16                                                                                 ⟨207774⟩
        c16.image = v394                                                                              ⟨207781⟩
        v396 = v396 - 1                                                                               ⟨207782⟩
        si v396 == 6 :
            v396_avant = v396                                                                         ⟨207786⟩
            v396 = 15                                                                                 ⟨207786⟩
        v414 = v396                                                                                   ⟨207790⟩
        c15.image = v414                                                                              ⟨207793⟩
    v416 = T1.mot[scène2.compteur·2] + dword_4ACC8                                                    ⟨207802⟩
    c18.x = v416                                                                                      ⟨207812⟩
    c18.y = T1.mot[(scène2.compteur·2) + 1] + dword_4ACC8+2                                           ⟨207815⟩
    word_4AD1E = word_4AD1E + word_4AD22                                                              ⟨207817⟩
    word_4AD20 = word_4AD20 + word_4AD24                                                              ⟨207819⟩
    si word_4AD1E >= 185 ou word_4AD1E <= 136 :
        word_4AD22 = -word_4AD22                                                                      ⟨207829⟩
    si word_4AD20 >= 62 ou word_4AD20 <= 14 :
        word_4AD24 = -word_4AD24                                                                      ⟨207841⟩
    si = word_4AD1E                                                                                   ⟨207844⟩
    di = word_4AD20                                                                                   ⟨207845⟩
    c19.x = word_4AD1E                                                                                ⟨207847⟩
    c19.y = word_4AD20                                                                                ⟨207849⟩
    c12.image = T2.mot[scène2.compteur]                                                               ⟨207858⟩
    si T2.mot[scène2.compteur] > 3 :
        c13.image = 1                                                                                 ⟨207866⟩
    sinon :
        si T2.mot[scène2.compteur] != 0 :
            c13.image = 2                                                                             ⟨207877⟩
        sinon :
            c13.image = 0                                                                             ⟨207882⟩
    word_4AD28 = word_4AD28 + word_4AD26                                                              ⟨207886⟩
    si word_4AD28 >= 5 ou word_4AD28 <= 3 :
        word_4AD26 = -word_4AD26                                                                      ⟨207896⟩
    v422 = word_4AD28                                                                                 ⟨207900⟩
    c14.image = v422                                                                                  ⟨207903⟩
    Scene_Tick(scène=scène2)                                                                          ⟨207906⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨207933⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨207941⟩
v404 = 0                                                                                              ⟨207962⟩
v356 = 0                                                                                              ⟨207980⟩
v338 = 0                                                                                              ⟨208002⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨208006⟩
si byte_4F55C != 0 :
    v223 = 0                                                                                          ⟨208033⟩
    v222 = 0                                                                                          ⟨208034⟩
    v213 = 0                                                                                          ⟨208051⟩
    v212 = 0                                                                                          ⟨208052⟩
    v203 = 0                                                                                          ⟨208069⟩
    v202 = 0                                                                                          ⟨208070⟩
    v193 = 0                                                                                          ⟨208087⟩
    v192 = 0                                                                                          ⟨208088⟩
    v183 = 0                                                                                          ⟨208105⟩
    v182 = 0                                                                                          ⟨208106⟩
    canal_arrête(canal=canal3)                                                                        ⟨208109⟩
    sub_5C1C(&v3520, 2)                                                                               ⟨208114⟩
    voix_arrête(voix=voix1)                                                                           ⟨208119⟩
    v3494 = 0                                                                                         ⟨208136⟩
    v3489 = 0                                                                                         ⟨208137⟩
    v3488 = 0                                                                                         ⟨208138⟩
    canal_arrête(canal=canal2)                                                                        ⟨208141⟩
    sub_5C1C(&v1420, 2)                                                                               ⟨208146⟩
    v169 = 0                                                                                          ⟨208164⟩
    v168 = 0                                                                                          ⟨208165⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, sub_479E0)                                                     ⟨208173⟩
    v121 = 0                                                                                          ⟨208226⟩
    v120 = 0                                                                                          ⟨208227⟩
    v111 = 0                                                                                          ⟨208244⟩
    v110 = 0                                                                                          ⟨208245⟩
    v101 = 0                                                                                          ⟨208262⟩
    v100 = 0                                                                                          ⟨208263⟩
    v91 = 0                                                                                           ⟨208280⟩
    v90 = 0                                                                                           ⟨208281⟩
    v81 = 0                                                                                           ⟨208298⟩
    v80 = 0                                                                                           ⟨208299⟩
    v64 = 0                                                                                           ⟨208324⟩
    v59 = 0                                                                                           ⟨208325⟩
    v58 = 0                                                                                           ⟨208326⟩
    v49 = 0                                                                                           ⟨208348⟩
    v48 = 0                                                                                           ⟨208349⟩
    retour                                                                                            ⟨208399⟩
charge(mid1 1)                                                                                        ⟨208412⟩
charge(mid1 44)                                                                                       ⟨208424⟩
palette_depuis(pal14(mid1 44))                                                                        ⟨208431⟩
charge(mid1 38)                                                                                       ⟨208443⟩
palette_depuis(pal15(mid1 38))                                                                        ⟨208450⟩

──── scène3 ────
scène3 = Scene_Create(cadence=20, palette=255, surface=pal9)                                          ⟨208458⟩
palette_copie(destination=pal1, source=pal14(mid1 44))                                                ⟨208467⟩
palette_copie(destination=pal1, source=pal15(mid1 38))                                                ⟨208476⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨208488⟩
c24 = Layer(ressource=optshps 116, x=0, y=-24)                                                        ⟨208495⟩
ajoute c24 à scène3                                                                                   ⟨208501⟩
c25 = JitterImageLayer(ressource=mid1 6, x=0, y=-40, image=2)                                         ⟨208509⟩
si = c25                                                                                              ⟨208511⟩
c26 = ImageLayer(ressource=mid1 26, x=-5, y=0, image=2)                                               ⟨208518⟩
c27 = ImageLayer(ressource=mid1 26, x=6, y=0, image=3)                                                ⟨208527⟩
ajoute c26 à c25                                                                                      ⟨208532⟩
ajoute c27 à c25                                                                                      ⟨208536⟩
ajoute c25 à scène3                                                                                   ⟨208541⟩
c28 = OverlayImageLayer(ressource=mid1 1, x=0, y=24, image=3)                                         ⟨208549⟩
ajoute c28 à c25                                                                                      ⟨208554⟩
tant que (scène3.compteur < 20) et (scène3.terminée == 0) :
    Scene_Tick(scène=scène3)                                                                          ⟨208561⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨208584⟩
si byte_4F55C != 0 :
    v265 = 0                                                                                          ⟨208611⟩
    v264 = 0                                                                                          ⟨208612⟩
    v249 = 0                                                                                          ⟨208633⟩
    v248 = 0                                                                                          ⟨208634⟩
    v239 = 0                                                                                          ⟨208651⟩
    v238 = 0                                                                                          ⟨208652⟩
    v223 = 0                                                                                          ⟨208673⟩
    v222 = 0                                                                                          ⟨208674⟩
    v213 = 0                                                                                          ⟨208691⟩
    v212 = 0                                                                                          ⟨208692⟩
    v203 = 0                                                                                          ⟨208709⟩
    v202 = 0                                                                                          ⟨208710⟩
    v193 = 0                                                                                          ⟨208727⟩
    v192 = 0                                                                                          ⟨208728⟩
    v183 = 0                                                                                          ⟨208745⟩
    v182 = 0                                                                                          ⟨208746⟩
    canal_arrête(canal=canal3)                                                                        ⟨208749⟩
    sub_5C1C(&v3520, 2)                                                                               ⟨208754⟩
    voix_arrête(voix=voix1)                                                                           ⟨208759⟩
    v3494 = 0                                                                                         ⟨208776⟩
    v3489 = 0                                                                                         ⟨208777⟩
    v3488 = 0                                                                                         ⟨208778⟩
    canal_arrête(canal=canal2)                                                                        ⟨208781⟩
    sub_5C1C(&v1420, 2)                                                                               ⟨208786⟩
    v169 = 0                                                                                          ⟨208804⟩
    v168 = 0                                                                                          ⟨208805⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, sub_479E0)                                                     ⟨208813⟩
    v121 = 0                                                                                          ⟨208866⟩
    v120 = 0                                                                                          ⟨208867⟩
    v111 = 0                                                                                          ⟨208884⟩
    v110 = 0                                                                                          ⟨208885⟩
    v101 = 0                                                                                          ⟨208902⟩
    v100 = 0                                                                                          ⟨208903⟩
    v91 = 0                                                                                           ⟨208920⟩
    v90 = 0                                                                                           ⟨208921⟩
    v81 = 0                                                                                           ⟨208938⟩
    v80 = 0                                                                                           ⟨208939⟩
    v64 = 0                                                                                           ⟨208964⟩
    v59 = 0                                                                                           ⟨208965⟩
    v58 = 0                                                                                           ⟨208966⟩
    v49 = 0                                                                                           ⟨208988⟩
    v48 = 0                                                                                           ⟨208989⟩
    retour                                                                                            ⟨209039⟩
charge(mid1 56)                                                                                       ⟨209052⟩
palette_depuis(pal16(mid1 56))                                                                        ⟨209059⟩

──── scène4 ────
scène4 = Scene_Create(cadence=20, palette=255, surface=pal9)                                          ⟨209067⟩
v338 = 0                                                                                              ⟨209072⟩
si v29 != 0 :
    charge(mid1voc 8)                                                                                 ⟨209081⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 8)                                  ⟨209087⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨209092⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨209101⟩
        canal_enregistre(canal=canal3, ressource=objets1[1], x=0)                                     ⟨209108⟩
        si canal3.+0 != 0 :
            AIL_start_sequence(pilote=canal3.+0→4, séquence=v3522)                                    ⟨209115⟩
palette_copie(destination=pal1, source=pal16(mid1 56))                                                ⟨209131⟩
palette_copie(destination=pal1, source=pal3(optpals 24))                                              ⟨209140⟩
palette_copie(destination=pal1, source=pal4(midgames 22))                                             ⟨209149⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨209157⟩
c29 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨209164⟩
si = c29                                                                                              ⟨209166⟩
c30 = Layer(ressource=midgames 21, x=0, y=0)                                                          ⟨209172⟩
ajoute c30 à c29                                                                                      ⟨209177⟩
ajoute c29 à scène4                                                                                   ⟨209182⟩
c31 = Layer(ressource=optshps 44, x=0, y=-40)                                                         ⟨209189⟩
ajoute c31 à scène4                                                                                   ⟨209195⟩
c32 = ImageLayer(ressource=midgames 19, x=0, y=90, image=1)                                           ⟨209203⟩
ajoute c32 à scène4                                                                                   ⟨209209⟩
c33 = ImageLayer(ressource=midgames 19, x=0, y=70, image=2)                                           ⟨209217⟩
ajoute c33 à scène4                                                                                   ⟨209223⟩
v356 = 0                                                                                              ⟨209228⟩
charge(mid1 22)                                                                                       ⟨209235⟩
c34 = AnimLayer(ressource=mid1 22, x=0, y=0)                                                          ⟨209242⟩
di = c34                                                                                              ⟨209244⟩
ajoute c34 à scène4                                                                                   ⟨209248⟩
tant que animation_finie(calque=c34) == 0 :
    Scene_Tick(scène=scène4)                                                                          ⟨209255⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨209286⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨209294⟩
v356 = 0                                                                                              ⟨209315⟩
v338 = 0                                                                                              ⟨209333⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨209337⟩
si byte_4F55C != 0 :
    v281 = 0                                                                                          ⟨209364⟩
    v280 = 0                                                                                          ⟨209365⟩
    v265 = 0                                                                                          ⟨209386⟩
    v264 = 0                                                                                          ⟨209387⟩
    v249 = 0                                                                                          ⟨209408⟩
    v248 = 0                                                                                          ⟨209409⟩
    v239 = 0                                                                                          ⟨209426⟩
    v238 = 0                                                                                          ⟨209427⟩
    v223 = 0                                                                                          ⟨209448⟩
    v222 = 0                                                                                          ⟨209449⟩
    v213 = 0                                                                                          ⟨209466⟩
    v212 = 0                                                                                          ⟨209467⟩
    v203 = 0                                                                                          ⟨209484⟩
    v202 = 0                                                                                          ⟨209485⟩
    v193 = 0                                                                                          ⟨209502⟩
    v192 = 0                                                                                          ⟨209503⟩
    v183 = 0                                                                                          ⟨209520⟩
    v182 = 0                                                                                          ⟨209521⟩
    canal_arrête(canal=canal3)                                                                        ⟨209524⟩
    sub_5C1C(&v3520, 2)                                                                               ⟨209529⟩
    voix_arrête(voix=voix1)                                                                           ⟨209534⟩
    v3494 = 0                                                                                         ⟨209551⟩
    v3489 = 0                                                                                         ⟨209552⟩
    v3488 = 0                                                                                         ⟨209553⟩
    canal_arrête(canal=canal2)                                                                        ⟨209556⟩
    sub_5C1C(&v1420, 2)                                                                               ⟨209561⟩
    v169 = 0                                                                                          ⟨209579⟩
    v168 = 0                                                                                          ⟨209580⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, sub_479E0)                                                     ⟨209588⟩
    v121 = 0                                                                                          ⟨209641⟩
    v120 = 0                                                                                          ⟨209642⟩
    v111 = 0                                                                                          ⟨209659⟩
    v110 = 0                                                                                          ⟨209660⟩
    v101 = 0                                                                                          ⟨209677⟩
    v100 = 0                                                                                          ⟨209678⟩
    v91 = 0                                                                                           ⟨209695⟩
    v90 = 0                                                                                           ⟨209696⟩
    v81 = 0                                                                                           ⟨209713⟩
    v80 = 0                                                                                           ⟨209714⟩
    v64 = 0                                                                                           ⟨209739⟩
    v59 = 0                                                                                           ⟨209740⟩
    v58 = 0                                                                                           ⟨209741⟩
    v49 = 0                                                                                           ⟨209763⟩
    v48 = 0                                                                                           ⟨209764⟩
    retour                                                                                            ⟨209814⟩
v338 = 0                                                                                              ⟨209820⟩
si v29 != 0 :
    charge(mid1voc 9)                                                                                 ⟨209829⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 9)                                  ⟨209835⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨209844⟩
        canal_enregistre(canal=canal3, ressource=objets1[2], x=0)                                     ⟨209851⟩
charge(mid1 57)                                                                                       ⟨209865⟩
palette_depuis(pal7(mid1 57))                                                                         ⟨209872⟩

──── scène5 ────
scène5 = Scene_Create(cadence=20, palette=255, surface=pal9)                                          ⟨209880⟩
palette_copie(destination=pal1, source=pal7(mid1 57))                                                 ⟨209893⟩
palette_copie(destination=pal1, source=pal12(mid1 42))                                                ⟨209902⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨209910⟩
c35 = Layer(ressource=optshps 116, x=0, y=-24)                                                        ⟨209917⟩
ajoute c35 à scène5                                                                                   ⟨209923⟩
charge(mid1 23)                                                                                       ⟨209935⟩
c36 = LoopAnimLayer(ressource=mid1 23, x=0, y=-24)                                                    ⟨209948⟩
c36.mode = 0                                                                                          ⟨209955⟩
ajoute c36 à scène5                                                                                   ⟨209967⟩
c37 = Layer(ressource=mid1 6, x=0, y=-24)                                                             ⟨209974⟩
ajoute c37 à scène5                                                                                   ⟨209980⟩
c38 = ClippedMovingLayer(ressource=mid1 11, x=159, y=40)                                              ⟨209987⟩
c38.découpe_gauche = 131                                                                              ⟨209991⟩
c38.découpe_haut = 9                                                                                  ⟨209993⟩
c38.découpe_droite = 190                                                                              ⟨209995⟩
c38.découpe_bas = 67                                                                                  ⟨209997⟩
ajoute c38 à scène5                                                                                   ⟨210001⟩
c39 = Layer(ressource=mid1 12, x=99, y=108)                                                           ⟨210008⟩
ajoute c39 à scène5                                                                                   ⟨210014⟩
c40 = ImageLayer(ressource=mid1 12, x=195, y=107, image=3)                                            ⟨210022⟩
ajoute c40 à scène5                                                                                   ⟨210028⟩
c41 = ImageLayer(ressource=mid1 11, x=135, y=22, image=7)                                             ⟨210036⟩
ajoute c41 à scène5                                                                                   ⟨210042⟩
c42 = ImageLayer(ressource=mid1 11, x=185, y=22, image=16)                                            ⟨210050⟩
ajoute c42 à scène5                                                                                   ⟨210056⟩
c43 = ImageLayer(ressource=mid1 11, x=160, y=38, image=21)                                            ⟨210064⟩
ajoute c43 à scène5                                                                                   ⟨210070⟩
c44 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=22)                              ⟨210078⟩
c44.découpe_gauche = 131                                                                              ⟨210082⟩
c44.découpe_haut = 9                                                                                  ⟨210084⟩
c44.découpe_droite = 190                                                                              ⟨210086⟩
c44.découpe_bas = 67                                                                                  ⟨210088⟩
ajoute c44 à scène5                                                                                   ⟨210092⟩
c45 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=23)                              ⟨210100⟩
c45.découpe_gauche = 131                                                                              ⟨210104⟩
c45.découpe_haut = 9                                                                                  ⟨210106⟩
c45.découpe_droite = 190                                                                              ⟨210108⟩
c45.découpe_bas = 67                                                                                  ⟨210110⟩
ajoute c45 à scène5                                                                                   ⟨210114⟩
c46 = ImageLayer(ressource=mid1 11, x=159, y=40, image=24)                                            ⟨210122⟩
ajoute c46 à scène5                                                                                   ⟨210128⟩
c47 = ImageLayer(ressource=mid1 11, x=138, y=17, image=26)                                            ⟨210136⟩
ajoute c47 à scène5                                                                                   ⟨210142⟩
c48 = ImageLayer(ressource=mid1 11, x=140, y=63, image=27)                                            ⟨210150⟩
ajoute c48 à scène5                                                                                   ⟨210156⟩
c49 = ImageLayer(ressource=mid1 11, x=178, y=63, image=28)                                            ⟨210164⟩
ajoute c49 à scène5                                                                                   ⟨210170⟩
v404 = 16                                                                                             ⟨210172⟩
v406 = 7                                                                                              ⟨210173⟩
T1 = tableau de 164 octets copié depuis unk_4AD2A                                                     ⟨210180⟩
si = 9202                                                                                             ⟨210183⟩
T2 = tableau de 82 octets copié depuis ds:9202                                                        ⟨210188⟩
si v29 != 0 :
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨210194⟩
si v31 != 0 :
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3522)                                        ⟨210205⟩
tant que (scène5.compteur < 40) et (scène5.terminée == 0) :
    v404 = v404 - 1                                                                                   ⟨210213⟩
    si v404 == 15 :
        v404_avant = v404                                                                             ⟨210217⟩
        v404 = 20                                                                                     ⟨210217⟩
    c42.image = v404                                                                                  ⟨210224⟩
    v406 = v406 + 1                                                                                   ⟨210225⟩
    si v406 == 16 :
        v406_avant = v406                                                                             ⟨210229⟩
        v406 = 7                                                                                      ⟨210229⟩
    v414 = v406                                                                                       ⟨210233⟩
    c41.image = v414                                                                                  ⟨210236⟩
    v416 = ((scène5.compteur·4) + &v3722)→0 + dword_4ADCE                                             ⟨210243⟩
    c44.x = v416                                                                                      ⟨210253⟩
    c44.y = ((scène5.compteur·4) + &v3720)→0 + dword_4ADCE+2                                          ⟨210256⟩
    word_4AE24 = word_4AE24 + word_4AE28                                                              ⟨210258⟩
    word_4AE26 = word_4AE26 + word_4AE2A                                                              ⟨210260⟩
    si word_4AE24 >= 185 ou word_4AE24 <= 136 :
        word_4AE28 = -word_4AE28                                                                      ⟨210270⟩
    si word_4AE26 >= 62 ou word_4AE26 <= 14 :
        word_4AE2A = -word_4AE2A                                                                      ⟨210282⟩
    si = word_4AE24                                                                                   ⟨210285⟩
    di = word_4AE26                                                                                   ⟨210286⟩
    c45.x = word_4AE24                                                                                ⟨210288⟩
    c45.y = word_4AE26                                                                                ⟨210290⟩
    c38.image = ((scène5.compteur·2) + &v3804)→0                                                      ⟨210299⟩
    si ((scène5.compteur·2) + &v3804)→0 > 3 :
        c39.image = 1                                                                                 ⟨210307⟩
    sinon :
        si ((scène5.compteur·2) + &v3804)→0 != 0 :
            c39.image = 2                                                                             ⟨210318⟩
        sinon :
            c39.image = 0                                                                             ⟨210323⟩
    word_4AE2E = word_4AE2E + word_4AE2C                                                              ⟨210327⟩
    si word_4AE2E >= 5 ou word_4AE2E <= 3 :
        word_4AE2C = -word_4AE2C                                                                      ⟨210337⟩
    v422 = word_4AE2E                                                                                 ⟨210341⟩
    c40.image = v422                                                                                  ⟨210344⟩
    Scene_Tick(scène=scène5)                                                                          ⟨210347⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨210374⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨210382⟩
v366 = 0                                                                                              ⟨210403⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨210407⟩
v348 = 0                                                                                              ⟨210430⟩
v338 = 0                                                                                              ⟨210448⟩
si byte_4F55C != 0 :
    v281 = 0                                                                                          ⟨210474⟩
    v280 = 0                                                                                          ⟨210475⟩
    v265 = 0                                                                                          ⟨210496⟩
    v264 = 0                                                                                          ⟨210497⟩
    v249 = 0                                                                                          ⟨210518⟩
    v248 = 0                                                                                          ⟨210519⟩
    v239 = 0                                                                                          ⟨210536⟩
    v238 = 0                                                                                          ⟨210537⟩
    v223 = 0                                                                                          ⟨210558⟩
    v222 = 0                                                                                          ⟨210559⟩
    v213 = 0                                                                                          ⟨210576⟩
    v212 = 0                                                                                          ⟨210577⟩
    v203 = 0                                                                                          ⟨210594⟩
    v202 = 0                                                                                          ⟨210595⟩
    v193 = 0                                                                                          ⟨210612⟩
    v192 = 0                                                                                          ⟨210613⟩
    v183 = 0                                                                                          ⟨210630⟩
    v182 = 0                                                                                          ⟨210631⟩
    canal_arrête(canal=canal3)                                                                        ⟨210634⟩
    sub_5C1C(&v3520, 2)                                                                               ⟨210639⟩
    voix_arrête(voix=voix1)                                                                           ⟨210644⟩
    v3494 = 0                                                                                         ⟨210661⟩
    v3489 = 0                                                                                         ⟨210662⟩
    v3488 = 0                                                                                         ⟨210663⟩
    canal_arrête(canal=canal2)                                                                        ⟨210666⟩
    sub_5C1C(&v1420, 2)                                                                               ⟨210671⟩
    v169 = 0                                                                                          ⟨210689⟩
    v168 = 0                                                                                          ⟨210690⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, sub_479E0)                                                     ⟨210698⟩
    v121 = 0                                                                                          ⟨210751⟩
    v120 = 0                                                                                          ⟨210752⟩
    v111 = 0                                                                                          ⟨210769⟩
    v110 = 0                                                                                          ⟨210770⟩
    v101 = 0                                                                                          ⟨210787⟩
    v100 = 0                                                                                          ⟨210788⟩
    v91 = 0                                                                                           ⟨210805⟩
    v90 = 0                                                                                           ⟨210806⟩
    v81 = 0                                                                                           ⟨210823⟩
    v80 = 0                                                                                           ⟨210824⟩
    v64 = 0                                                                                           ⟨210849⟩
    v59 = 0                                                                                           ⟨210850⟩
    v58 = 0                                                                                           ⟨210851⟩
    v49 = 0                                                                                           ⟨210873⟩
    v48 = 0                                                                                           ⟨210874⟩
    retour                                                                                            ⟨210924⟩
charge(mid1 0)                                                                                        ⟨210937⟩
charge(mid1 45)                                                                                       ⟨210949⟩
palette_depuis(pal17(mid1 45))                                                                        ⟨210956⟩
charge(mid1 39)                                                                                       ⟨210968⟩
palette_depuis(pal18(mid1 39))                                                                        ⟨210975⟩

──── scène6 ────
scène6 = Scene_Create(cadence=10, palette=255, surface=pal9)                                          ⟨210983⟩
v3820 = v76                                                                                           ⟨210990⟩
v3818 = 152                                                                                           ⟨210992⟩
v3816 = 319                                                                                           ⟨210994⟩
v3814 = 199                                                                                           ⟨210996⟩
sub_30A1D(&v3592, word_4D36E, &v964)                                                                  ⟨210999⟩
palette_copie(destination=pal1, source=pal17(mid1 45))                                                ⟨211008⟩
palette_copie(destination=pal1, source=pal18(mid1 39))                                                ⟨211017⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨211029⟩
c50 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨211036⟩
ajoute c50 à scène6                                                                                   ⟨211042⟩
c51 = JitterImageLayer(ressource=mid1 6, x=1, y=-40, image=3)                                         ⟨211050⟩
c52 = ImageLayer(ressource=mid1 26, x=-7, y=0, image=0)                                               ⟨211059⟩
c53 = ImageLayer(ressource=mid1 26, x=7, y=0, image=1)                                                ⟨211068⟩
ajoute c52 à c51                                                                                      ⟨211073⟩
ajoute c53 à c51                                                                                      ⟨211077⟩
ajoute c51 à scène6                                                                                   ⟨211082⟩
c54 = OverlayImageLayer(ressource=mid1 0, x=0, y=14, image=0)                                         ⟨211090⟩
si = c54                                                                                              ⟨211092⟩
ajoute c54 à c51                                                                                      ⟨211095⟩
si v29 != 0 :
    charge(mid1voc 0)                                                                                 ⟨211112⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 0)                                  ⟨211118⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨211123⟩
    tant que voix_finie(voix=voix1) == 0 :
        Scene_Tick(scène=scène6)                                                                      ⟨211130⟩
        c54.image = scène6.compteur & 1                                                               ⟨211136⟩
    si v29 != 0 :
        voix_arrête(voix=voix1)                                                                       ⟨211150⟩
    v346 = 0                                                                                          ⟨211171⟩
sinon :
    police_couleur (sub_3139A, non lue)(police=police1, couleur=4)                                    ⟨211178⟩
    sous_titre (sub_C8F5, non lue)(zone=scène1, texte=textes1[0])                                     ⟨211183⟩
    tant que (scène6.compteur < 30) et (scène6.terminée == 0) :
        Scene_Tick(scène=scène6)                                                                      ⟨211190⟩
        di = scène6.compteur & 1                                                                      ⟨211194⟩
        c54.image = scène6.compteur & 1                                                               ⟨211195⟩
c54.image = 0                                                                                         ⟨211216⟩
scène6.compteur = 0                                                                                   ⟨211217⟩
tant que (scène6.compteur < 5) et (scène6.terminée == 0) :
    Scene_Tick(scène=scène6)                                                                          ⟨211223⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨211250⟩
si byte_4F55C != 0 :
    v323 = 0                                                                                          ⟨211277⟩
    v322 = 0                                                                                          ⟨211278⟩
    v307 = 0                                                                                          ⟨211299⟩
    v306 = 0                                                                                          ⟨211300⟩
    v297 = 0                                                                                          ⟨211317⟩
    v296 = 0                                                                                          ⟨211318⟩
    v281 = 0                                                                                          ⟨211339⟩
    v280 = 0                                                                                          ⟨211340⟩
    v265 = 0                                                                                          ⟨211361⟩
    v264 = 0                                                                                          ⟨211362⟩
    v249 = 0                                                                                          ⟨211383⟩
    v248 = 0                                                                                          ⟨211384⟩
    v239 = 0                                                                                          ⟨211401⟩
    v238 = 0                                                                                          ⟨211402⟩
    v223 = 0                                                                                          ⟨211423⟩
    v222 = 0                                                                                          ⟨211424⟩
    v213 = 0                                                                                          ⟨211441⟩
    v212 = 0                                                                                          ⟨211442⟩
    v203 = 0                                                                                          ⟨211459⟩
    v202 = 0                                                                                          ⟨211460⟩
    v193 = 0                                                                                          ⟨211477⟩
    v192 = 0                                                                                          ⟨211478⟩
    v183 = 0                                                                                          ⟨211495⟩
    v182 = 0                                                                                          ⟨211496⟩
    canal_arrête(canal=canal3)                                                                        ⟨211499⟩
    sub_5C1C(&v3520, 2)                                                                               ⟨211504⟩
    voix_arrête(voix=voix1)                                                                           ⟨211509⟩
    v3494 = 0                                                                                         ⟨211526⟩
    v3489 = 0                                                                                         ⟨211527⟩
    v3488 = 0                                                                                         ⟨211528⟩
    canal_arrête(canal=canal2)                                                                        ⟨211531⟩
    sub_5C1C(&v1420, 2)                                                                               ⟨211536⟩
    v169 = 0                                                                                          ⟨211554⟩
    v168 = 0                                                                                          ⟨211555⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, sub_479E0)                                                     ⟨211563⟩
    v121 = 0                                                                                          ⟨211616⟩
    v120 = 0                                                                                          ⟨211617⟩
    v111 = 0                                                                                          ⟨211634⟩
    v110 = 0                                                                                          ⟨211635⟩
    v101 = 0                                                                                          ⟨211652⟩
    v100 = 0                                                                                          ⟨211653⟩
    v91 = 0                                                                                           ⟨211670⟩
    v90 = 0                                                                                           ⟨211671⟩
    v81 = 0                                                                                           ⟨211688⟩
    v80 = 0                                                                                           ⟨211689⟩
    v64 = 0                                                                                           ⟨211714⟩
    v59 = 0                                                                                           ⟨211715⟩
    v58 = 0                                                                                           ⟨211716⟩
    v49 = 0                                                                                           ⟨211738⟩
    v48 = 0                                                                                           ⟨211739⟩
    retour                                                                                            ⟨211789⟩
appel de Midgame1_PlayPart2_70290 (voir plus bas)                                                     ⟨211868⟩
v323 = 0                                                                                              ⟨211890⟩
v322 = 0                                                                                              ⟨211891⟩
v307 = 0                                                                                              ⟨211912⟩
v306 = 0                                                                                              ⟨211913⟩
v297 = 0                                                                                              ⟨211930⟩
v296 = 0                                                                                              ⟨211931⟩
v281 = 0                                                                                              ⟨211952⟩
v280 = 0                                                                                              ⟨211953⟩
v265 = 0                                                                                              ⟨211974⟩
v264 = 0                                                                                              ⟨211975⟩
v249 = 0                                                                                              ⟨211996⟩
v248 = 0                                                                                              ⟨211997⟩
v239 = 0                                                                                              ⟨212014⟩
v238 = 0                                                                                              ⟨212015⟩
v223 = 0                                                                                              ⟨212036⟩
v222 = 0                                                                                              ⟨212037⟩
v213 = 0                                                                                              ⟨212054⟩
v212 = 0                                                                                              ⟨212055⟩
v203 = 0                                                                                              ⟨212072⟩
v202 = 0                                                                                              ⟨212073⟩
v193 = 0                                                                                              ⟨212090⟩
v192 = 0                                                                                              ⟨212091⟩
v183 = 0                                                                                              ⟨212108⟩
v182 = 0                                                                                              ⟨212109⟩
canal_arrête(canal=canal3)                                                                            ⟨212112⟩
sub_5C1C(&v3520, 2)                                                                                   ⟨212117⟩
voix_arrête(voix=voix1)                                                                               ⟨212122⟩
v3494 = 0                                                                                             ⟨212139⟩
v3489 = 0                                                                                             ⟨212140⟩
v3488 = 0                                                                                             ⟨212141⟩
canal_arrête(canal=canal2)                                                                            ⟨212144⟩
sub_5C1C(&v1420, 2)                                                                                   ⟨212149⟩
v169 = 0                                                                                              ⟨212167⟩
v168 = 0                                                                                              ⟨212168⟩
CRT_Doprnt_Core(objets1, 10, 6, 1, sub_479E0)                                                         ⟨212176⟩
v121 = 0                                                                                              ⟨212229⟩
v120 = 0                                                                                              ⟨212230⟩
v111 = 0                                                                                              ⟨212247⟩
v110 = 0                                                                                              ⟨212248⟩
v101 = 0                                                                                              ⟨212265⟩
v100 = 0                                                                                              ⟨212266⟩
v91 = 0                                                                                               ⟨212283⟩
v90 = 0                                                                                               ⟨212284⟩
v81 = 0                                                                                               ⟨212301⟩
v80 = 0                                                                                               ⟨212302⟩
v64 = 0                                                                                               ⟨212327⟩
v59 = 0                                                                                               ⟨212328⟩
v58 = 0                                                                                               ⟨212329⟩
v49 = 0                                                                                               ⟨212351⟩
v48 = 0                                                                                               ⟨212352⟩
retour                                                                                                ⟨212402⟩
```

## Midgame1_PlayPart2_70290

```
bp = sp                                                                                               ⟨212613⟩
v10 = 0                                                                                               ⟨212617⟩
v5 = 0                                                                                                ⟨212619⟩
v4 = 0                                                                                                ⟨212620⟩
v12 = byte_4CA58                                                                                      ⟨212622⟩
charge(mid1 43)                                                                                       ⟨212640⟩
palette_depuis(pal19(mid1 43))                                                                        ⟨212647⟩

──── scène7 ────
scène7 = Scene_Create(cadence=10, palette=255, surface=pal9)                                          ⟨212654⟩
di = objet39                                                                                          ⟨212659⟩
v582 = objet39.+0                                                                                     ⟨212661⟩
v580 = objet39.+2                                                                                     ⟨212663⟩
v578 = objet39.+4                                                                                     ⟨212665⟩
v576 = objet39.+6                                                                                     ⟨212667⟩
sub_30A1D(&v354, word_4D36E, police1, di, si, bp)                                                     ⟨212670⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨212676⟩
palette_copie(destination=pal1, source=pal19(mid1 43))                                                ⟨212684⟩
palette_copie(destination=pal1, source=pal6(convdata type 2 "normal"))                                ⟨212695⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨212708⟩
c55 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨212714⟩
ajoute c55 à scène7                                                                                   ⟨212720⟩
c56 = ImageLayer(ressource=mid1 6, x=0, y=0, image=1)                                                 ⟨212727⟩
ajoute c56 à scène7                                                                                   ⟨212733⟩
c57 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=128)                               ⟨212740⟩
c58 = ImageLayer(ressource=convdata type 0 "air", x=160, y=127, image=39)                             ⟨212749⟩
tête_image_de_base(tête=c57, image=31)                                                                ⟨212754⟩
ajoute c57 à scène7                                                                                   ⟨212759⟩
ajoute c58 à scène7                                                                                   ⟨212764⟩
si v29 != 0 :
    charge(mid1voc 4)                                                                                 ⟨212780⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 4)                                  ⟨212785⟩
    voix1.joue(-1)                                                                                    ⟨212791⟩
    tête_texte_de_lèvres(tête=c57, texte="Back off, almost got tone. Blah blah blah")                 ⟨212795⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène7)                                                                      ⟨212802⟩
    voix_arrête(voix=voix1)                                                                           ⟨212815⟩
    v96 = 0                                                                                           ⟨212834⟩
sinon :
    police1.couleur(224)                                                                              ⟨212842⟩
    si = textes1                                                                                      ⟨212845⟩
    sous_titre (sub_C8F5, non lue)(zone=objet41, texte=textes1[1])                                    ⟨212851⟩
    tête_texte_de_lèvres(tête=c57, texte="Back off, almost got tone. Blah blah blah")                 ⟨212855⟩
    tant que (scène7.compteur < 30) et (scène7.terminée == 0) :
        Scene_Tick(scène=scène7)                                                                      ⟨212862⟩
Scene_Destruct(scène=scène7, drapeaux=0)                                                              ⟨212891⟩
si byte_4F55C != 0 :
    v33 = 0                                                                                           ⟨212918⟩
    v32 = 0                                                                                           ⟨212919⟩
    v5 = 0                                                                                            ⟨212936⟩
    v4 = 0                                                                                            ⟨212937⟩
    retour                                                                                            ⟨212941⟩
si v29 != 0 :
    charge(mid1voc 10)                                                                                ⟨212955⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 10)                                 ⟨212960⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨212968⟩
        canal_enregistre(canal=canal3, ressource=objets1 + 30, x=0)                                   ⟨212975⟩

──── scène8 ────
scène8 = Scene_Create(cadence=20, palette=255, surface=pal9)                                          ⟨212984⟩
v96 = 0                                                                                               ⟨212989⟩
charge(mid1 54)                                                                                       ⟨212995⟩
palette_depuis(pal20(mid1 54))                                                                        ⟨213002⟩
palette_copie(destination=pal1, source=pal20(mid1 54))                                                ⟨213010⟩
palette_copie(destination=pal1, source=pal12(mid1 42))                                                ⟨213021⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨213034⟩
c59 = Layer(ressource=optshps 116, x=0, y=-24)                                                        ⟨213040⟩
ajoute c59 à scène8                                                                                   ⟨213046⟩
charge(mid1 20)                                                                                       ⟨213057⟩
c60 = LoopAnimLayer(ressource=mid1 20, x=0, y=-40)                                                    ⟨213070⟩
c60.mode = 0                                                                                          ⟨213077⟩
ajoute c60 à scène8                                                                                   ⟨213089⟩
c61 = Layer(ressource=mid1 6, x=0, y=-24)                                                             ⟨213095⟩
ajoute c61 à scène8                                                                                   ⟨213101⟩
c62 = Layer(ressource=mid1 11, x=159, y=40)                                                           ⟨213107⟩
ajoute c62 à scène8                                                                                   ⟨213113⟩
c63 = Layer(ressource=mid1 12, x=99, y=108)                                                           ⟨213119⟩
ajoute c63 à scène8                                                                                   ⟨213125⟩
c64 = ImageLayer(ressource=mid1 12, x=195, y=107, image=3)                                            ⟨213132⟩
ajoute c64 à scène8                                                                                   ⟨213138⟩
c65 = ImageLayer(ressource=mid1 11, x=135, y=22, image=7)                                             ⟨213145⟩
ajoute c65 à scène8                                                                                   ⟨213151⟩
c66 = ImageLayer(ressource=mid1 11, x=185, y=22, image=16)                                            ⟨213158⟩
ajoute c66 à scène8                                                                                   ⟨213164⟩
c67 = ImageLayer(ressource=mid1 11, x=160, y=38, image=21)                                            ⟨213171⟩
ajoute c67 à scène8                                                                                   ⟨213177⟩
c68 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=22)                              ⟨213184⟩
c68.découpe_gauche = 131                                                                              ⟨213188⟩
c68.découpe_haut = 9                                                                                  ⟨213190⟩
c68.découpe_droite = 190                                                                              ⟨213192⟩
c68.découpe_bas = 67                                                                                  ⟨213194⟩
ajoute c68 à scène8                                                                                   ⟨213198⟩
c69 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=23)                              ⟨213205⟩
c69.découpe_gauche = 131                                                                              ⟨213209⟩
c69.découpe_haut = 9                                                                                  ⟨213211⟩
c69.découpe_droite = 190                                                                              ⟨213213⟩
c69.découpe_bas = 67                                                                                  ⟨213215⟩
ajoute c69 à scène8                                                                                   ⟨213219⟩
c70 = ImageLayer(ressource=mid1 11, x=159, y=40, image=24)                                            ⟨213226⟩
ajoute c70 à scène8                                                                                   ⟨213232⟩
c71 = ImageLayer(ressource=mid1 11, x=138, y=17, image=26)                                            ⟨213239⟩
ajoute c71 à scène8                                                                                   ⟨213245⟩
c72 = ImageLayer(ressource=mid1 11, x=140, y=63, image=27)                                            ⟨213252⟩
ajoute c72 à scène8                                                                                   ⟨213258⟩
c73 = ImageLayer(ressource=mid1 11, x=178, y=63, image=28)                                            ⟨213265⟩
ajoute c73 à scène8                                                                                   ⟨213271⟩
palette_envoie(palette=pal12(mid1 42), pas=0)                                                         ⟨213284⟩
v154 = 16                                                                                             ⟨213286⟩
v156 = 7                                                                                              ⟨213287⟩
T3 = tableau de 164 octets copié depuis unk_4AF18                                                     ⟨213294⟩
si = 9696                                                                                             ⟨213297⟩
T4 = tableau de 82 octets copié depuis ds:9696                                                        ⟨213302⟩
si v29 != 0 :
    voix1.joue(-1)                                                                                    ⟨213309⟩
si v31 != 0 :
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=canal3.+2)                                    ⟨213323⟩
tant que (scène8.compteur < 40) et (scène8.terminée == 0) :
    si scène8.compteur & 1 != 0 :
        v154 = v154 + 1                                                                               ⟨213333⟩
        si v154 == 21 :
            v154_avant = v154                                                                         ⟨213337⟩
            v154 = 16                                                                                 ⟨213337⟩
        v162 = v154                                                                                   ⟨213341⟩
        c66.image = v162                                                                              ⟨213344⟩
        v156 = v156 + 1                                                                               ⟨213345⟩
        si v156 == 16 :
            v156_avant = v156                                                                         ⟨213349⟩
            v156 = 7                                                                                  ⟨213349⟩
        v164 = v156                                                                                   ⟨213353⟩
        c65.image = v164                                                                              ⟨213356⟩
    v166 = T3.mot[scène8.compteur·2] + dword_4AFBC                                                    ⟨213365⟩
    v168 = T3.mot[(scène8.compteur·2) + 1] + dword_4AFBC+2                                            ⟨213372⟩
    c68.x = v166                                                                                      ⟨213375⟩
    c68.y = v168                                                                                      ⟨213378⟩
    si scène8.compteur < 8 :
        si word_4B012 >= 185 ou word_4B012 <= 136 :
            word_4B016 = -word_4B016                                                                  ⟨213390⟩
        si word_4B014 >= 62 ou word_4B014 <= 14 :
            word_4B018 = -word_4B018                                                                  ⟨213402⟩
    sinon :
        word_4B016 = (T3.mot[scène8.compteur·2] + dword_4AFBC) - word_4B012                           ⟨213415⟩
        word_4B018 = (T3.mot[(scène8.compteur·2) + 1] + dword_4AFBC+2) - word_4B014                   ⟨213423⟩
        si scène8.compteur < 18 :
            word_4B016 = word_4B016 / 2                                                               ⟨213430⟩
            word_4B018 = word_4B018 / 2                                                               ⟨213435⟩
        sinon :
            si scène8.compteur & 1 != 0 :
                c69.image = 23                                                                        ⟨213442⟩
                c68.image = 22                                                                        ⟨213444⟩
                c67.image = 21                                                                        ⟨213446⟩
            sinon :
                c69.image = 25                                                                        ⟨213451⟩
                c68.image = 25                                                                        ⟨213453⟩
                c67.image = 25                                                                        ⟨213455⟩
    word_4B012 = word_4B012 + word_4B016                                                              ⟨213459⟩
    word_4B014 = word_4B014 + word_4B018                                                              ⟨213461⟩
    si = word_4B012                                                                                   ⟨213462⟩
    di = word_4B014                                                                                   ⟨213463⟩
    c69.x = word_4B012                                                                                ⟨213465⟩
    c69.y = word_4B014                                                                                ⟨213467⟩
    v170 = T4.mot[scène8.compteur]                                                                    ⟨213473⟩
    c62.image = v170                                                                                  ⟨213476⟩
    si T4.mot[scène8.compteur] > 3 :
        c63.image = 1                                                                                 ⟨213484⟩
    sinon :
        si T4.mot[scène8.compteur] != 0 :
            c63.image = 2                                                                             ⟨213495⟩
        sinon :
            c63.image = 0                                                                             ⟨213500⟩
    word_4B01C = word_4B01C + word_4B01A                                                              ⟨213504⟩
    si word_4B01C >= 5 ou word_4B01C <= 3 :
        word_4B01A = -word_4B01A                                                                      ⟨213514⟩
    v172 = word_4B01C                                                                                 ⟨213518⟩
    c64.image = v172                                                                                  ⟨213521⟩
    Scene_Tick(scène=scène8)                                                                          ⟨213524⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨213550⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨213557⟩
v116 = 0                                                                                              ⟨213578⟩
v96 = 0                                                                                               ⟨213600⟩
Scene_Destruct(scène=scène8, drapeaux=0)                                                              ⟨213604⟩
v86 = 0                                                                                               ⟨213623⟩

──── scène9 ────
scène9 = Scene_Create(cadence=15, palette=255, surface=pal9)                                          ⟨213629⟩
v86 = 0                                                                                               ⟨213634⟩
charge(mid1 24)                                                                                       ⟨213640⟩
c74 = AnimLayer(ressource=mid1 24, x=0, y=0)                                                          ⟨213647⟩
si = c74                                                                                              ⟨213649⟩
ajoute c74 à scène9                                                                                   ⟨213653⟩
v96 = 0                                                                                               ⟨213658⟩
charge(mid1 58)                                                                                       ⟨213664⟩
v105 = 0                                                                                              ⟨213666⟩
palette_depuis(pal20(mid1 58))                                                                        ⟨213671⟩
palette_copie(destination=pal1, source=pal20(mid1 58))                                                ⟨213679⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨213692⟩
tant que animation_finie(calque=c74) == 0 :
    Scene_Tick(scène=scène9)                                                                          ⟨213699⟩
v96 = 0                                                                                               ⟨213730⟩
v86 = 0                                                                                               ⟨213748⟩
Scene_Destruct(scène=scène9, drapeaux=0)                                                              ⟨213752⟩
si byte_4F55C != 0 :
    v33 = 0                                                                                           ⟨213779⟩
    v32 = 0                                                                                           ⟨213780⟩
    v5 = 0                                                                                            ⟨213797⟩
    v4 = 0                                                                                            ⟨213798⟩
    retour                                                                                            ⟨213802⟩
v86 = 0                                                                                               ⟨213808⟩
si v29 != 0 :
    charge(mid1voc 11)                                                                                ⟨213816⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 11)                                 ⟨213821⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨213829⟩
        canal_enregistre(canal=canal3, ressource=objets1 + 40, x=0)                                   ⟨213836⟩

──── scène10 ────
scène10 = Scene_Create(cadence=20, palette=255, surface=pal9)                                         ⟨213845⟩
v96 = 0                                                                                               ⟨213850⟩
charge(mid1 49)                                                                                       ⟨213856⟩
v105 = 0                                                                                              ⟨213858⟩
palette_depuis(pal20(mid1 49))                                                                        ⟨213863⟩
di = pal2(optpals 21)                                                                                 ⟨213865⟩
palette_copie(destination=pal1, source=pal2(optpals 21))                                              ⟨213871⟩
palette_copie(destination=pal1, source=pal4(midgames 22))                                             ⟨213882⟩
palette_copie(destination=pal1, source=pal20(mid1 49))                                                ⟨213890⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨213903⟩
c75 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨213909⟩
ajoute c75 à scène10                                                                                  ⟨213915⟩
v116 = 0                                                                                              ⟨213920⟩
charge(mid1 16)                                                                                       ⟨213926⟩
charge(mid1 18)                                                                                       ⟨213937⟩
c76 = AnimLayer(ressource=mid1 16, x=0, y=0)                                                          ⟨213944⟩
si = c76                                                                                              ⟨213946⟩
c77 = AnimLayer(ressource=mid1 18, x=0, y=0)                                                          ⟨213952⟩
ajoute c76 à scène10                                                                                  ⟨213958⟩
tant que (scène10.compteur < 41) et (scène10.terminée == 0) :
    si scène10.compteur == 20 :
        retire(parent=scène10, calque=c76)                                                            ⟨213968⟩
        c76.détruit(3)                                                                                ⟨213975⟩
        ajoute c77 à scène10                                                                          ⟨213983⟩
    si scène10.compteur == 15 :
        si v29 != 0 :
            voix1.joue(-1)                                                                            ⟨213995⟩
        sinon :
            si v31 != 0 :
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=canal3.+2)                        ⟨214010⟩
    Scene_Tick(scène=scène10)                                                                         ⟨214017⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨214043⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨214050⟩
v126 = 0                                                                                              ⟨214071⟩
v116 = 0                                                                                              ⟨214089⟩
v96 = 0                                                                                               ⟨214111⟩
Scene_Destruct(scène=scène10, drapeaux=0)                                                             ⟨214115⟩
v86 = 0                                                                                               ⟨214134⟩
si byte_4F55C != 0 :
    v33 = 0                                                                                           ⟨214160⟩
    v32 = 0                                                                                           ⟨214161⟩
    v5 = 0                                                                                            ⟨214178⟩
    v4 = 0                                                                                            ⟨214179⟩
    retour                                                                                            ⟨214183⟩
v86 = 0                                                                                               ⟨214189⟩
si v29 != 0 :
    charge(mid1voc 12)                                                                                ⟨214197⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 12)                                 ⟨214202⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨214210⟩
        canal_enregistre(canal=canal3, ressource=objets1 + 50, x=0)                                   ⟨214217⟩

──── scène11 ────
scène11 = Scene_Create(cadence=20, palette=255, surface=pal9)                                         ⟨214226⟩
c78 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨214232⟩
ajoute c78 à scène11                                                                                  ⟨214238⟩
charge(mid1 15)                                                                                       ⟨214249⟩
c79 = AnimLayer(ressource=mid1 15, x=0, y=0)                                                          ⟨214256⟩
si = c79                                                                                              ⟨214258⟩
ajoute c79 à scène11                                                                                  ⟨214262⟩
tant que animation_finie(calque=c79) == 0 :
    si scène11.compteur == 22 :
        si v29 != 0 :
            voix1.joue(-1)                                                                            ⟨214275⟩
        sinon :
            si v31 != 0 :
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=canal3.+2)                        ⟨214290⟩
    Scene_Tick(scène=scène11)                                                                         ⟨214297⟩
v98 = 0                                                                                               ⟨214324⟩
Scene_Destruct(scène=scène11, drapeaux=0)                                                             ⟨214328⟩
si byte_4F55C != 0 :
    v86 = 0                                                                                           ⟨214352⟩
    v33 = 0                                                                                           ⟨214373⟩
    v32 = 0                                                                                           ⟨214374⟩
    v5 = 0                                                                                            ⟨214391⟩
    v4 = 0                                                                                            ⟨214392⟩
    retour                                                                                            ⟨214396⟩

──── scène12 ────
scène12 = Scene_Create(cadence=20, palette=255, surface=pal9)                                         ⟨214404⟩
charge(mid1 51)                                                                                       ⟨214415⟩
v105 = 0                                                                                              ⟨214417⟩
palette_depuis(pal20(mid1 51))                                                                        ⟨214422⟩
charge(mid1 7)                                                                                        ⟨214433⟩
charge(midgames 21)                                                                                   ⟨214444⟩
c80 = MovingLayer(ressource=optshps 116, x=0, y=-40)                                                  ⟨214458⟩
c80.vx = 0                                                                                            ⟨214465⟩
c80.vy = 0                                                                                            ⟨214467⟩
c80.vx = 1                                                                                            ⟨214469⟩
c80.vy = 0                                                                                            ⟨214471⟩
ajoute c80 à scène12                                                                                  ⟨214483⟩
c81 = MovingLayer(ressource=optshps 116, x=-320, y=-40)                                               ⟨214497⟩
c81.vx = 0                                                                                            ⟨214504⟩
c81.vy = 0                                                                                            ⟨214506⟩
c81.vx = 1                                                                                            ⟨214508⟩
c81.vy = 0                                                                                            ⟨214510⟩
ajoute c81 à scène12                                                                                  ⟨214522⟩
c82 = MovingLayer(ressource=midgames 21, x=0, y=-40)                                                  ⟨214535⟩
c82.vx = 0                                                                                            ⟨214542⟩
c82.vy = 0                                                                                            ⟨214544⟩
c82.vx = 1                                                                                            ⟨214546⟩
c82.vy = 0                                                                                            ⟨214548⟩
ajoute c82 à scène12                                                                                  ⟨214560⟩
c83 = MovingLayer(ressource=midgames 21, x=-320, y=-40)                                               ⟨214573⟩
c83.vx = 0                                                                                            ⟨214580⟩
c83.vy = 0                                                                                            ⟨214582⟩
c83.vx = 1                                                                                            ⟨214584⟩
c83.vy = 0                                                                                            ⟨214586⟩
ajoute c83 à scène12                                                                                  ⟨214598⟩
c84 = MovingLayer(ressource=mid1 7, x=0, y=40)                                                        ⟨214611⟩
c84.vx = 0                                                                                            ⟨214618⟩
c84.vy = 0                                                                                            ⟨214620⟩
c84.vx = 2                                                                                            ⟨214622⟩
c84.vy = 0                                                                                            ⟨214624⟩
ajoute c84 à scène12                                                                                  ⟨214636⟩
c85 = MovingLayer(ressource=mid1 7, x=-320, y=40)                                                     ⟨214649⟩
c85.vx = 0                                                                                            ⟨214656⟩
c85.vy = 0                                                                                            ⟨214658⟩
c85.vx = 2                                                                                            ⟨214660⟩
c85.vy = 0                                                                                            ⟨214662⟩
ajoute c85 à scène12                                                                                  ⟨214674⟩
charge(mid1 21)                                                                                       ⟨214685⟩
charge(mid1 29)                                                                                       ⟨214696⟩
charge(mid1 35)                                                                                       ⟨214707⟩
c86 = AnimLayer(ressource=mid1 21, x=0, y=0)                                                          ⟨214714⟩
di = c86                                                                                              ⟨214716⟩
c87 = AnimLayer(ressource=mid1 29, x=0, y=0)                                                          ⟨214722⟩
si = c87                                                                                              ⟨214724⟩
c88 = AnimLayer(ressource=mid1 35, x=0, y=0)                                                          ⟨214730⟩
ajoute c86 à scène12                                                                                  ⟨214736⟩
tant que (scène12.compteur < 41) et (scène12.terminée == 0) :
    v190 = scène12.compteur                                                                           ⟨214742⟩
    si v190 == 14 :
        retire(parent=scène12, calque=c86)                                                            ⟨214748⟩
        c86.détruit(3)                                                                                ⟨214755⟩
        ajoute c87 à scène12                                                                          ⟨214763⟩
    si v190 == 27 :
        retire(parent=scène12, calque=c87)                                                            ⟨214772⟩
        c87.détruit(3)                                                                                ⟨214779⟩
        ajoute c88 à scène12                                                                          ⟨214787⟩
    Scene_Tick(scène=scène12)                                                                         ⟨214793⟩
v180 = 0                                                                                              ⟨214833⟩
v170 = 0                                                                                              ⟨214851⟩
v160 = 0                                                                                              ⟨214869⟩
v112 = 0                                                                                              ⟨214905⟩
v96 = 0                                                                                               ⟨214927⟩
Scene_Destruct(scène=scène12, drapeaux=0)                                                             ⟨214931⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨214936⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨214943⟩
v86 = 0                                                                                               ⟨214964⟩
si byte_4F55C != 0 :
    v33 = 0                                                                                           ⟨214990⟩
    v32 = 0                                                                                           ⟨214991⟩
    v5 = 0                                                                                            ⟨215008⟩
    v4 = 0                                                                                            ⟨215009⟩
    retour                                                                                            ⟨215013⟩

──── scène13 ────
scène13 = Scene_Create(cadence=20, palette=255, surface=pal9)                                         ⟨215021⟩
v86 = 0                                                                                               ⟨215026⟩
si v29 != 0 :
    charge(mid1voc 13)                                                                                ⟨215034⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 13)                                 ⟨215039⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨215047⟩
        canal_enregistre(canal=canal3, ressource=objets1 + 50, x=0)                                   ⟨215054⟩
c89 = Layer(ressource=optshps 116, x=0, y=-10)                                                        ⟨215062⟩
c90 = Layer(ressource=midgames 20, x=0, y=0)                                                          ⟨215069⟩
ajoute c90 à c89                                                                                      ⟨215074⟩
ajoute c89 à scène13                                                                                  ⟨215079⟩
charge(mid1 17)                                                                                       ⟨215090⟩
charge(mid1 30)                                                                                       ⟨215101⟩
charge(mid1 31)                                                                                       ⟨215112⟩
charge(mid1 32)                                                                                       ⟨215123⟩
c91 = AnimLayer(ressource=mid1 17, x=0, y=0)                                                          ⟨215130⟩
c92 = AnimLayer(ressource=mid1 30, x=0, y=0)                                                          ⟨215138⟩
di = c92                                                                                              ⟨215140⟩
c93 = AnimLayer(ressource=mid1 31, x=0, y=0)                                                          ⟨215146⟩
si = c93                                                                                              ⟨215148⟩
c94 = AnimLayer(ressource=mid1 32, x=0, y=0)                                                          ⟨215154⟩
ajoute c91 à scène13                                                                                  ⟨215160⟩
ajoute c92 à c91                                                                                      ⟨215164⟩
c95 = ImageLayer(ressource=midgames 19, x=0, y=85, image=1)                                           ⟨215171⟩
ajoute c95 à scène13                                                                                  ⟨215177⟩
c96 = ImageLayer(ressource=midgames 19, x=0, y=55, image=2)                                           ⟨215184⟩
ajoute c96 à scène13                                                                                  ⟨215190⟩
tant que (scène13.compteur < 81) et (scène13.terminée == 0) :
    v146 = scène13.compteur                                                                           ⟨215196⟩
    si v146 == 50 :
        retire(parent=c91, calque=c92)                                                                ⟨215201⟩
        c92.détruit(3)                                                                                ⟨215208⟩
        ajoute c93 à c91                                                                              ⟨215215⟩
    si v146 == 65 :
        retire(parent=c91, calque=c93)                                                                ⟨215223⟩
        c93.détruit(3)                                                                                ⟨215230⟩
        ajoute c94 à c91                                                                              ⟨215237⟩
    si v146 == 48 :
        si v29 != 0 :
            voix1.joue(-1)                                                                            ⟨215249⟩
        sinon :
            si v31 != 0 :
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=canal3.+2)                        ⟨215264⟩
    Scene_Tick(scène=scène13)                                                                         ⟨215271⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨215297⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨215304⟩
v130 = 0                                                                                              ⟨215325⟩
v120 = 0                                                                                              ⟨215343⟩
v110 = 0                                                                                              ⟨215361⟩
v100 = 0                                                                                              ⟨215379⟩
v86 = 0                                                                                               ⟨215397⟩
Scene_Destruct(scène=scène13, drapeaux=0)                                                             ⟨215401⟩
si byte_4F55C != 0 :
    v33 = 0                                                                                           ⟨215428⟩
    v32 = 0                                                                                           ⟨215429⟩
    v5 = 0                                                                                            ⟨215446⟩
    v4 = 0                                                                                            ⟨215447⟩
    retour                                                                                            ⟨215451⟩

──── scène14 ────
scène14 = Scene_Create(cadence=10, palette=255, surface=pal9)                                         ⟨215463⟩
si = objet39                                                                                          ⟨215468⟩
v582 = objet39.+0                                                                                     ⟨215470⟩
v580 = objet39.+2                                                                                     ⟨215472⟩
v578 = objet39.+4                                                                                     ⟨215474⟩
v576 = objet39.+6                                                                                     ⟨215476⟩
sub_30A1D(objet41, word_4D36E, police1)                                                               ⟨215479⟩
di = pal17(mid1 45)                                                                                   ⟨215481⟩
palette_copie(destination=pal1, source=pal17(mid1 45))                                                ⟨215487⟩
palette_copie(destination=pal1, source=pal18(mid1 39))                                                ⟨215498⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨215511⟩
c97 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨215517⟩
ajoute c97 à scène14                                                                                  ⟨215523⟩
c98 = JitterImageLayer(ressource=mid1 6, x=1, y=-35, image=3)                                         ⟨215530⟩
c99 = ImageLayer(ressource=mid1 26, x=-7, y=0, image=0)                                               ⟨215538⟩
c100 = ImageLayer(ressource=mid1 26, x=7, y=0, image=1)                                               ⟨215546⟩
ajoute c99 à c98                                                                                      ⟨215551⟩
ajoute c100 à c98                                                                                     ⟨215555⟩
ajoute c98 à scène14                                                                                  ⟨215560⟩
c101 = OverlayAnimLayer(ressource=mid1 0, x=0, y=14)                                                  ⟨215566⟩
ajoute c101 à c98                                                                                     ⟨215571⟩
si v29 != 0 :
    charge(mid1voc 1)                                                                                 ⟨215587⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 1)                                  ⟨215592⟩
    voix1.joue(-1)                                                                                    ⟨215598⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène14)                                                                     ⟨215605⟩
    voix_arrête(voix=voix1)                                                                           ⟨215618⟩
    v98 = 0                                                                                           ⟨215637⟩
sinon :
    police1.couleur(4)                                                                                ⟨215645⟩
    sous_titre (sub_C8F5, non lue)(zone=objet41, texte=textes1[2])                                    ⟨215656⟩
    tant que (scène14.compteur < 20) et (scène14.terminée == 0) :
        Scene_Tick(scène=scène14)                                                                     ⟨215663⟩
scène14.compteur = 0                                                                                  ⟨215685⟩
tant que (scène14.compteur < 10) et (scène14.terminée == 0) :
    Scene_Tick(scène=scène14)                                                                         ⟨215691⟩
Scene_Destruct(scène=scène14, drapeaux=0)                                                             ⟨215718⟩
si byte_4F55C != 0 :
    v33 = 0                                                                                           ⟨215745⟩
    v32 = 0                                                                                           ⟨215746⟩
    v5 = 0                                                                                            ⟨215763⟩
    v4 = 0                                                                                            ⟨215764⟩
    retour                                                                                            ⟨215768⟩

──── scène15 ────
scène15 = Scene_Create(cadence=20, palette=255, surface=pal9)                                         ⟨215776⟩
si = pal14(mid1 44)                                                                                   ⟨215778⟩
palette_copie(destination=pal1, source=pal14(mid1 44))                                                ⟨215784⟩
di = pal15(mid1 38)                                                                                   ⟨215786⟩
palette_copie(destination=pal1, source=pal15(mid1 38))                                                ⟨215792⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨215805⟩
c102 = Layer(ressource=optshps 116, x=0, y=-24)                                                       ⟨215811⟩
ajoute c102 à scène15                                                                                 ⟨215817⟩
c103 = JitterImageLayer(ressource=mid1 6, x=0, y=-40, image=2)                                        ⟨215824⟩
c104 = ImageLayer(ressource=mid1 26, x=-5, y=0, image=2)                                              ⟨215832⟩
c105 = ImageLayer(ressource=mid1 26, x=6, y=0, image=3)                                               ⟨215840⟩
ajoute c104 à c103                                                                                    ⟨215845⟩
ajoute c105 à c103                                                                                    ⟨215849⟩
ajoute c103 à scène15                                                                                 ⟨215854⟩
c106 = OverlayImageLayer(ressource=mid1 1, x=0, y=24, image=3)                                        ⟨215861⟩
ajoute c106 à c103                                                                                    ⟨215866⟩
tant que (scène15.compteur < 20) et (scène15.terminée == 0) :
    Scene_Tick(scène=scène15)                                                                         ⟨215873⟩
Scene_Destruct(scène=scène15, drapeaux=0)                                                             ⟨215896⟩
si byte_4F55C != 0 :
    v33 = 0                                                                                           ⟨215923⟩
    v32 = 0                                                                                           ⟨215924⟩
    v5 = 0                                                                                            ⟨215941⟩
    v4 = 0                                                                                            ⟨215942⟩
    retour                                                                                            ⟨215946⟩

──── scène16 ────
scène16 = Scene_Create(cadence=10, palette=255, surface=pal9)                                         ⟨215954⟩
palette_copie(destination=pal1, source=pal19(mid1 43))                                                ⟨215962⟩
si = pal6(convdata type 2 "normal")                                                                   ⟨215964⟩
palette_copie(destination=pal1, source=pal6(convdata type 2 "normal"))                                ⟨215970⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨215983⟩
c107 = Layer(ressource=optshps 116, x=0, y=0)                                                         ⟨215989⟩
ajoute c107 à scène16                                                                                 ⟨215995⟩
c108 = ImageLayer(ressource=mid1 6, x=0, y=0, image=1)                                                ⟨216002⟩
ajoute c108 à scène16                                                                                 ⟨216008⟩
c109 = TalkingHeadOverlay(ressource=convdata type 0 "air", x=160, y=128)                              ⟨216015⟩
di = c109                                                                                             ⟨216017⟩
ajoute c109 à scène16                                                                                 ⟨216021⟩
tête_image_de_base(tête=c109, image=27)                                                               ⟨216025⟩
charge(midgames 0)                                                                                    ⟨216036⟩
c110 = ToggleLayer(ressource=midgames 0, x=160, y=128, sens=1)                                        ⟨216044⟩
ajoute c110 à scène16                                                                                 ⟨216050⟩
tant que (scène16.compteur < 20) et (scène16.terminée == 0) :
    Scene_Tick(scène=scène16)                                                                         ⟨216057⟩
v5 = 0                                                                                                ⟨216093⟩
v4 = 0                                                                                                ⟨216094⟩
v90 = 0                                                                                               ⟨216112⟩
Scene_Destruct(scène=scène16, drapeaux=0)                                                             ⟨216116⟩
si byte_4F55C != 0 :
    v33 = 0                                                                                           ⟨216143⟩
    v32 = 0                                                                                           ⟨216144⟩
    v5 = 0                                                                                            ⟨216161⟩
    v4 = 0                                                                                            ⟨216162⟩
    retour                                                                                            ⟨216166⟩
charge(mid1 25)                                                                                       ⟨216178⟩

──── scène17 ────
scène17 = Scene_Create(cadence=10, palette=255, surface=pal9)                                         ⟨216185⟩
charge(mid1 47)                                                                                       ⟨216196⟩
palette_depuis(pal21(mid1 47))                                                                        ⟨216203⟩
di = pal4(midgames 22)                                                                                ⟨216205⟩
palette_copie(destination=pal1, source=pal4(midgames 22))                                             ⟨216211⟩
palette_copie(destination=pal1, source=pal3(optpals 24))                                              ⟨216222⟩
palette_copie(destination=pal1, source=pal21(mid1 47))                                                ⟨216230⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨216243⟩
charge(mid1 10)                                                                                       ⟨216254⟩
c111 = Layer(ressource=optshps 116, x=0, y=-64)                                                       ⟨216260⟩
c112 = Layer(ressource=midgames 20, x=0, y=0)                                                         ⟨216267⟩
ajoute c112 à c111                                                                                    ⟨216272⟩
ajoute c111 à scène17                                                                                 ⟨216277⟩
c113 = Layer(ressource=optshps 44, x=0, y=0)                                                          ⟨216283⟩
ajoute c113 à scène17                                                                                 ⟨216289⟩
c114 = ImageLayer(ressource=midgames 19, x=0, y=90, image=1)                                          ⟨216296⟩
ajoute c114 à scène17                                                                                 ⟨216302⟩
c115 = ImageLayer(ressource=midgames 19, x=0, y=50, image=2)                                          ⟨216309⟩
ajoute c115 à scène17                                                                                 ⟨216315⟩
c116 = OverlayAnimLayer(ressource=mid1 10, x=0, y=10)                                                 ⟨216322⟩
si = c116                                                                                             ⟨216324⟩
ajoute c116 à scène17                                                                                 ⟨216328⟩
c116.image = 1                                                                                        ⟨216330⟩
tant que (scène17.compteur < 20) et (scène17.terminée == 0) :
    si scène17.compteur > 8 :
        c116.image = 9                                                                                ⟨216336⟩
    Scene_Tick(scène=scène17)                                                                         ⟨216341⟩
v86 = 0                                                                                               ⟨216400⟩
Scene_Destruct(scène=scène17, drapeaux=0)                                                             ⟨216404⟩
si byte_4F55C != 0 :
    v49 = 0                                                                                           ⟨216427⟩
    v48 = 0                                                                                           ⟨216428⟩
    v33 = 0                                                                                           ⟨216449⟩
    v32 = 0                                                                                           ⟨216450⟩
    v5 = 0                                                                                            ⟨216467⟩
    v4 = 0                                                                                            ⟨216468⟩
    retour                                                                                            ⟨216472⟩
charge(midgames 23)                                                                                   ⟨216484⟩
palette_depuis(pal22(midgames 23))                                                                    ⟨216491⟩
si = objet39                                                                                          ⟨216496⟩
v582 = objet39.+0                                                                                     ⟨216498⟩
v580 = objet39.+2                                                                                     ⟨216500⟩
v578 = objet39.+4                                                                                     ⟨216502⟩
v576 = objet39.+6                                                                                     ⟨216504⟩
sub_30A1D(&v320, word_4D36E, police1)                                                                 ⟨216507⟩

──── scène18 ────
scène18 = Scene_Create(cadence=20, palette=255, surface=pal9)                                         ⟨216514⟩
c117 = Layer(ressource=optshps 116, x=0, y=0)                                                         ⟨216520⟩
di = c117                                                                                             ⟨216522⟩
c118 = Layer(ressource=midgames 20, x=0, y=0)                                                         ⟨216527⟩
ajoute c118 à c117                                                                                    ⟨216532⟩
ajoute c117 à scène18                                                                                 ⟨216537⟩
charge(midgames 24)                                                                                   ⟨216548⟩
c119 = Layer(ressource=midgames 24, x=0, y=-20)                                                       ⟨216555⟩
ajoute c119 à scène18                                                                                 ⟨216561⟩
charge(mid1 2)                                                                                        ⟨216572⟩
c120 = OverlayImageLayer(ressource=mid1 2, x=0, y=-25, image=1)                                       ⟨216580⟩
ajoute c120 à scène18                                                                                 ⟨216586⟩
charge(mid1 19)                                                                                       ⟨216597⟩
c121 = AnimLayer(ressource=mid1 19, x=0, y=-40)                                                       ⟨216604⟩
ajoute c121 à scène18                                                                                 ⟨216610⟩
palette_copie(destination=pal1, source=pal22(midgames 23))                                            ⟨216618⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨216631⟩
tant que (scène18.compteur < 30) et (scène18.terminée == 0) :
    Scene_Tick(scène=scène18)                                                                         ⟨216638⟩
v112 = 0                                                                                              ⟨216675⟩
v100 = 0                                                                                              ⟨216693⟩
v88 = 0                                                                                               ⟨216711⟩
Scene_Destruct(scène=scène18, drapeaux=0)                                                             ⟨216715⟩
si byte_4F55C != 0 :
    v59 = 0                                                                                           ⟨216746⟩
    v58 = 0                                                                                           ⟨216747⟩
    v49 = 0                                                                                           ⟨216764⟩
    v48 = 0                                                                                           ⟨216765⟩
    v33 = 0                                                                                           ⟨216786⟩
    v32 = 0                                                                                           ⟨216787⟩
    v5 = 0                                                                                            ⟨216804⟩
    v4 = 0                                                                                            ⟨216805⟩
    retour                                                                                            ⟨216809⟩

──── scène19 ────
scène19 = Scene_Create(cadence=10, palette=255, surface=pal9)                                         ⟨216817⟩
di = objet39                                                                                          ⟨216822⟩
v582 = objet39.+0                                                                                     ⟨216824⟩
v580 = objet39.+2                                                                                     ⟨216826⟩
v578 = objet39.+4                                                                                     ⟨216828⟩
v576 = objet39.+6                                                                                     ⟨216830⟩
sub_30A1D(&v354, word_4D36E, police1)                                                                 ⟨216833⟩
palette_copie(destination=pal1, source=pal17(mid1 45))                                                ⟨216844⟩
palette_copie(destination=pal1, source=pal18(mid1 39))                                                ⟨216855⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨216868⟩
c122 = Layer(ressource=optshps 116, x=0, y=0)                                                         ⟨216874⟩
ajoute c122 à scène19                                                                                 ⟨216880⟩
c123 = JitterImageLayer(ressource=mid1 6, x=1, y=-40, image=3)                                        ⟨216887⟩
c124 = ImageLayer(ressource=mid1 26, x=-7, y=0, image=0)                                              ⟨216895⟩
c125 = ImageLayer(ressource=mid1 26, x=7, y=0, image=1)                                               ⟨216903⟩
ajoute c124 à c123                                                                                    ⟨216908⟩
ajoute c125 à c123                                                                                    ⟨216912⟩
ajoute c123 à scène19                                                                                 ⟨216917⟩
c126 = OverlayImageLayer(ressource=mid1 0, x=0, y=14, image=0)                                        ⟨216924⟩
si = c126                                                                                             ⟨216926⟩
ajoute c126 à c123                                                                                    ⟨216929⟩
c126.image = 13                                                                                       ⟨216931⟩
si v29 != 0 :
    v100 = 0                                                                                          ⟨216940⟩
    charge(mid1voc 2)                                                                                 ⟨216946⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 2)                                  ⟨216951⟩
    voix1.joue(-1)                                                                                    ⟨216957⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène19)                                                                     ⟨216964⟩
        pal20(mid1 51).+0 = (scène19.compteur & 1) + 13                                               ⟨216969⟩
        c126.image = pal20(mid1 46).+0                                                                ⟨216971⟩
    voix_arrête(voix=voix1)                                                                           ⟨216983⟩
    v100 = 0                                                                                          ⟨217002⟩
sinon :
    police1.couleur(4)                                                                                ⟨217010⟩
    sous_titre (sub_C8F5, non lue)(zone=&v354, texte=textes1[3])                                      ⟨217022⟩
    tant que (scène19.compteur < 30) et (scène19.terminée == 0) :
        Scene_Tick(scène=scène19)                                                                     ⟨217029⟩
        c126.image = (scène19.compteur & 1) + 13                                                      ⟨217036⟩
Scene_Destruct(scène=scène19, drapeaux=0)                                                             ⟨217064⟩
si byte_4F55C != 0 :
    v59 = 0                                                                                           ⟨217091⟩
    v58 = 0                                                                                           ⟨217092⟩
    v49 = 0                                                                                           ⟨217109⟩
    v48 = 0                                                                                           ⟨217110⟩
    v33 = 0                                                                                           ⟨217131⟩
    v32 = 0                                                                                           ⟨217132⟩
    v5 = 0                                                                                            ⟨217149⟩
    v4 = 0                                                                                            ⟨217150⟩
    retour                                                                                            ⟨217154⟩

──── scène20 ────
scène20 = Scene_Create(cadence=20, palette=255, surface=pal9)                                         ⟨217162⟩
di = objet39                                                                                          ⟨217167⟩
v582 = objet39.+0                                                                                     ⟨217169⟩
v580 = objet39.+2                                                                                     ⟨217171⟩
v578 = objet39.+4                                                                                     ⟨217173⟩
v576 = objet39.+6                                                                                     ⟨217175⟩
sub_30A1D(&v354, word_4D36E, police1)                                                                 ⟨217178⟩
palette_copie(destination=pal1, source=pal14(mid1 44))                                                ⟨217189⟩
palette_copie(destination=pal1, source=pal15(mid1 38))                                                ⟨217200⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨217213⟩
c127 = Layer(ressource=optshps 116, x=0, y=-24)                                                       ⟨217219⟩
ajoute c127 à scène20                                                                                 ⟨217225⟩
c128 = JitterImageLayer(ressource=mid1 6, x=0, y=-35, image=2)                                        ⟨217232⟩
c129 = ImageLayer(ressource=mid1 26, x=-5, y=0, image=2)                                              ⟨217240⟩
c130 = ImageLayer(ressource=mid1 26, x=6, y=0, image=3)                                               ⟨217248⟩
ajoute c129 à c128                                                                                    ⟨217253⟩
ajoute c130 à c128                                                                                    ⟨217257⟩
ajoute c128 à scène20                                                                                 ⟨217262⟩
c131 = OverlayImageLayer(ressource=mid1 1, x=0, y=24, image=3)                                        ⟨217269⟩
si = c131                                                                                             ⟨217271⟩
ajoute c131 à c128                                                                                    ⟨217274⟩
c131.image = 0                                                                                        ⟨217276⟩
tant que (scène20.compteur < 5) et (scène20.terminée == 0) :
    Scene_Tick(scène=scène20)                                                                         ⟨217282⟩
si v29 != 0 :
    v100 = 0                                                                                          ⟨217310⟩
    charge(mid1voc 5)                                                                                 ⟨217316⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 5)                                  ⟨217321⟩
    voix1.joue(-1)                                                                                    ⟨217327⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène20)                                                                     ⟨217334⟩
        pal20(mid1 51).+0 = scène20.compteur & 1                                                      ⟨217338⟩
        c131.image = pal20(mid1 46).+0                                                                ⟨217340⟩
    voix_arrête(voix=voix1)                                                                           ⟨217352⟩
    v100 = 0                                                                                          ⟨217371⟩
sinon :
    police1.couleur(114)                                                                              ⟨217379⟩
    sous_titre (sub_C8F5, non lue)(zone=&v354, texte=textes1[4])                                      ⟨217390⟩
    tant que (scène20.compteur < 40) et (scène20.terminée == 0) :
        Scene_Tick(scène=scène20)                                                                     ⟨217397⟩
        c131.image = scène20.compteur & 1                                                             ⟨217403⟩
Scene_Destruct(scène=scène20, drapeaux=0)                                                             ⟨217431⟩

──── scène21 ────
scène21 = Scene_Create(cadence=10, palette=255, surface=pal9)                                         ⟨217438⟩
di = objet39                                                                                          ⟨217443⟩
v582 = objet39.+0                                                                                     ⟨217445⟩
v580 = objet39.+2                                                                                     ⟨217447⟩
v578 = objet39.+4                                                                                     ⟨217449⟩
v576 = objet39.+6                                                                                     ⟨217451⟩
sub_30A1D(&v354, word_4D36E, police1)                                                                 ⟨217454⟩
palette_copie(destination=pal1, source=pal17(mid1 45))                                                ⟨217465⟩
palette_copie(destination=pal1, source=pal18(mid1 39))                                                ⟨217476⟩
sub_30AD0(&v354, 0)                                                                                   ⟨217485⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨217494⟩
c132 = Layer(ressource=optshps 116, x=0, y=0)                                                         ⟨217500⟩
ajoute c132 à scène21                                                                                 ⟨217506⟩
c133 = JitterImageLayer(ressource=mid1 6, x=1, y=-40, image=3)                                        ⟨217513⟩
c134 = ImageLayer(ressource=mid1 26, x=-7, y=0, image=0)                                              ⟨217521⟩
c135 = ImageLayer(ressource=mid1 26, x=7, y=0, image=1)                                               ⟨217529⟩
ajoute c134 à c133                                                                                    ⟨217534⟩
ajoute c135 à c133                                                                                    ⟨217538⟩
ajoute c133 à scène21                                                                                 ⟨217543⟩
c136 = OverlayImageLayer(ressource=mid1 0, x=0, y=14, image=0)                                        ⟨217550⟩
si = c136                                                                                             ⟨217552⟩
ajoute c136 à c133                                                                                    ⟨217555⟩
c136.image = 13                                                                                       ⟨217557⟩
si v29 != 0 :
    v100 = 0                                                                                          ⟨217566⟩
    charge(mid1voc 3)                                                                                 ⟨217572⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 3)                                  ⟨217577⟩
    voix1.joue(-1)                                                                                    ⟨217583⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène21)                                                                     ⟨217590⟩
        pal20(mid1 51).+0 = (scène21.compteur & 1) + 13                                               ⟨217595⟩
        c136.image = pal20(mid1 46).+0                                                                ⟨217597⟩
    voix_arrête(voix=voix1)                                                                           ⟨217609⟩
    v100 = 0                                                                                          ⟨217628⟩
sinon :
    police1.couleur(4)                                                                                ⟨217636⟩
    sous_titre (sub_C8F5, non lue)(zone=&v354, texte=textes1[5])                                      ⟨217648⟩
    tant que (scène21.compteur < 30) et (scène21.terminée == 0) :
        Scene_Tick(scène=scène21)                                                                     ⟨217655⟩
        c136.image = (scène21.compteur & 1) + 13                                                      ⟨217662⟩
c136.image = 13                                                                                       ⟨217683⟩
scène21.compteur = 0                                                                                  ⟨217684⟩
tant que (scène21.compteur < 5) et (scène21.terminée == 0) :
    Scene_Tick(scène=scène21)                                                                         ⟨217690⟩
Scene_Destruct(scène=scène21, drapeaux=0)                                                             ⟨217717⟩

──── scène22 ────
scène22 = Scene_Create(cadence=20, palette=255, surface=pal9)                                         ⟨217724⟩
di = objet39                                                                                          ⟨217729⟩
v582 = objet39.+0                                                                                     ⟨217731⟩
v580 = objet39.+2                                                                                     ⟨217733⟩
v578 = objet39.+4                                                                                     ⟨217735⟩
v576 = objet39.+6                                                                                     ⟨217737⟩
sub_30A1D(&v354, word_4D36E, police1)                                                                 ⟨217740⟩
palette_copie(destination=pal1, source=pal14(mid1 44))                                                ⟨217751⟩
palette_copie(destination=pal1, source=pal15(mid1 38))                                                ⟨217762⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨217775⟩
c137 = Layer(ressource=optshps 116, x=0, y=-24)                                                       ⟨217781⟩
ajoute c137 à scène22                                                                                 ⟨217787⟩
c138 = JitterImageLayer(ressource=mid1 6, x=0, y=-36, image=2)                                        ⟨217794⟩
c139 = ImageLayer(ressource=mid1 26, x=-5, y=0, image=2)                                              ⟨217802⟩
c140 = ImageLayer(ressource=mid1 26, x=6, y=0, image=3)                                               ⟨217810⟩
ajoute c139 à c138                                                                                    ⟨217815⟩
ajoute c140 à c138                                                                                    ⟨217819⟩
ajoute c138 à scène22                                                                                 ⟨217824⟩
c141 = OverlayImageLayer(ressource=mid1 1, x=0, y=24, image=3)                                        ⟨217831⟩
si = c141                                                                                             ⟨217833⟩
ajoute c141 à c138                                                                                    ⟨217836⟩
c141.image = 0                                                                                        ⟨217838⟩
tant que (scène22.compteur < 5) et (scène22.terminée == 0) :
    Scene_Tick(scène=scène22)                                                                         ⟨217844⟩
si v29 != 0 :
    v100 = 0                                                                                          ⟨217872⟩
    charge(mid1voc 6)                                                                                 ⟨217878⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 6)                                  ⟨217883⟩
    voix1.joue(-1)                                                                                    ⟨217889⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène22)                                                                     ⟨217896⟩
        pal20(mid1 51).+0 = scène22.compteur & 1                                                      ⟨217900⟩
        c141.image = pal20(mid1 46).+0                                                                ⟨217902⟩
    voix_arrête(voix=voix1)                                                                           ⟨217914⟩
    v100 = 0                                                                                          ⟨217933⟩
sinon :
    police1.couleur(114)                                                                              ⟨217941⟩
    sous_titre (sub_C8F5, non lue)(zone=&v354, texte=textes1[6])                                      ⟨217953⟩
    tant que (scène22.compteur < 50) et (scène22.terminée == 0) :
        Scene_Tick(scène=scène22)                                                                     ⟨217960⟩
        c141.image = scène22.compteur & 1                                                             ⟨217966⟩
Scene_Destruct(scène=scène22, drapeaux=0)                                                             ⟨217994⟩
si byte_4F55C != 0 :
    v59 = 0                                                                                           ⟨218021⟩
    v58 = 0                                                                                           ⟨218022⟩
    v49 = 0                                                                                           ⟨218039⟩
    v48 = 0                                                                                           ⟨218040⟩
    v33 = 0                                                                                           ⟨218061⟩
    v32 = 0                                                                                           ⟨218062⟩
    v5 = 0                                                                                            ⟨218079⟩
    v4 = 0                                                                                            ⟨218080⟩
    retour                                                                                            ⟨218084⟩
v71 = 0                                                                                               ⟨218087⟩
si byte_4CA58 - 1 <= 4 :
    v71 = 1                                                                                           ⟨218098⟩
si v29 != 0 :
    charge(mid1voc 13)                                                                                ⟨218113⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 13)                                 ⟨218118⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨218126⟩
        canal_enregistre(canal=canal3, ressource=objets1 + 50, x=0)                                   ⟨218133⟩
charge(mid1 60)                                                                                       ⟨218146⟩
charge(mid1 46)                                                                                       ⟨218157⟩
palette_depuis(pal20(mid1 46))                                                                        ⟨218164⟩

──── scène23 ────
scène23 = Scene_Create(cadence=20, palette=255, surface=pal9)                                         ⟨218171⟩
scène23.y = -50                                                                                       ⟨218173⟩
palette_copie(destination=pal1, source=pal4(midgames 22))                                             ⟨218183⟩
palette_copie(destination=pal1, source=pal3(optpals 24))                                              ⟨218194⟩
palette_copie(destination=pal1, source=pal22(midgames 23))                                            ⟨218202⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨218215⟩
c142 = MovingLayer(ressource=optshps 116, x=0, y=0)                                                   ⟨218229⟩
c142.vx = 0                                                                                           ⟨218236⟩
c142.vy = 0                                                                                           ⟨218238⟩
c142.vx = 0                                                                                           ⟨218240⟩
c142.vy = 0                                                                                           ⟨218242⟩
di = c142                                                                                             ⟨218250⟩
c143 = Layer(ressource=midgames 20, x=0, y=0)                                                         ⟨218255⟩
ajoute c143 à c142                                                                                    ⟨218260⟩
ajoute c142 à scène23                                                                                 ⟨218265⟩
c144 = MovingLayer(ressource=optshps 44, x=0, y=0)                                                    ⟨218279⟩
c144.vx = 0                                                                                           ⟨218286⟩
c144.vy = 0                                                                                           ⟨218288⟩
c144.vx = 0                                                                                           ⟨218290⟩
c144.vy = 0                                                                                           ⟨218292⟩
ajoute c144 à c142                                                                                    ⟨218303⟩
c145 = MovingLayer(ressource=midgames 19, x=0, y=130, image=1)                                        ⟨218318⟩
c145.vx = 0                                                                                           ⟨218325⟩
c145.vy = 0                                                                                           ⟨218327⟩
c145.vx = 0                                                                                           ⟨218329⟩
c145.vy = 0                                                                                           ⟨218331⟩
ajoute c145 à c144                                                                                    ⟨218342⟩
c146 = MovingLayer(ressource=midgames 19, x=0, y=-4, image=2)                                         ⟨218357⟩
c146.vx = 0                                                                                           ⟨218364⟩
c146.vy = 0                                                                                           ⟨218366⟩
c146.vx = 0                                                                                           ⟨218368⟩
c146.vy = 0                                                                                           ⟨218370⟩
ajoute c146 à c145                                                                                    ⟨218381⟩
c147 = TriggeredAnimLayer(ressource=mid1 25, x=0, y=-79, image=0)                                     ⟨218389⟩
ajoute c147 à c146                                                                                    ⟨218394⟩
c147.lecture = 1                                                                                      ⟨218397⟩
charge(mid1 33)                                                                                       ⟨218407⟩
charge(mid1 34)                                                                                       ⟨218418⟩
c148 = AnimLayer(ressource=mid1 33, x=0, y=10)                                                        ⟨218425⟩
c149 = AnimLayer(ressource=mid1 34, x=0, y=10)                                                        ⟨218433⟩
c148.image = 0                                                                                        ⟨218437⟩
c149.image = 0                                                                                        ⟨218439⟩
ajoute c148 à c142                                                                                    ⟨218442⟩
tant que (scène23.compteur < 20) et (scène23.terminée == 0) :
    Scene_Tick(scène=scène23)                                                                         ⟨218449⟩
scène23.compteur = 0                                                                                  ⟨218469⟩
c145.vx = 0                                                                                           ⟨218471⟩
c145.vy = 1                                                                                           ⟨218473⟩
tant que scène23.y < -24 :
    si scène23.compteur == 10 :
        retire(parent=c142, calque=c148)                                                              ⟨218481⟩
        c148.détruit(3)                                                                               ⟨218489⟩
        ajoute c149 à c142                                                                            ⟨218496⟩
    Scene_Tick(scène=scène23)                                                                         ⟨218502⟩
    scène23.y = scène23.y + 1                                                                         ⟨218504⟩
c145.vx = 0                                                                                           ⟨218510⟩
c145.vy = 0                                                                                           ⟨218512⟩
tant que animation_finie(calque=c149) == 0 :
    Scene_Tick(scène=scène23)                                                                         ⟨218518⟩
retire(parent=c142, calque=c149)                                                                      ⟨218530⟩
c149.détruit(3)                                                                                       ⟨218538⟩
Scene_Tick(scène=scène23)                                                                             ⟨218545⟩
scène23.compteur = 0                                                                                  ⟨218547⟩
charge(mid1 9)                                                                                        ⟨218557⟩
charge(mid1 14)                                                                                       ⟨218568⟩
c150 = AnimLayer(ressource=mid1 9, x=0, y=0)                                                          ⟨218575⟩
c151 = AnimLayer(ressource=mid1 14, x=0, y=0)                                                         ⟨218583⟩
ajoute c150 à c142                                                                                    ⟨218588⟩
palette_copie(destination=pal1, source=pal20(mid1 46))                                                ⟨218596⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨218605⟩
si v71 != 0 :
    si canal2.+0 != 0 :
        AIL_stop_sequence(pilote=canal2.+0→4, séquence=canal2.+2)                                     ⟨218617⟩
si v29 != 0 :
    voix1.joue(-1)                                                                                    ⟨218628⟩
sinon :
    si v31 != 0 :
        si canal3.+0 != 0 :
            AIL_start_sequence(pilote=canal3.+0→4, séquence=canal3.+2)                                ⟨218643⟩
tant que (scène23.compteur < 31) et (scène23.terminée == 0) :
    si scène23.compteur == 20 :
        retire(parent=c142, calque=c150)                                                              ⟨218655⟩
        c150.détruit(3)                                                                               ⟨218663⟩
        ajoute c151 à c142                                                                            ⟨218670⟩
    Scene_Tick(scène=scène23)                                                                         ⟨218676⟩
si v71 != 0 :
    si v12 - 1 <= 4 :
        si (v12 - 1)·2 != 0 :
            si (v12 - 1)·2 == 2 : aller à loc_7471E                                                   ⟨218705⟩
            si (v12 - 1)·2 == 4 : aller à loc_74703                                                   ⟨218705⟩
            si (v12 - 1)·2 == 6 : aller à loc_7471E                                                   ⟨218705⟩
            si (v12 - 1)·2 == 8 : aller à loc_7471E                                                   ⟨218705⟩
        aller à loc_7473D                                                                             ⟨218718⟩
        loc_74703:                                                                                    ⟨218720⟩
        aller à loc_7473D                                                                             ⟨218731⟩
        loc_7471E:                                                                                    ⟨218733⟩
        v71 = 1                                                                                       ⟨218744⟩
    loc_7473D:                                                                                        ⟨218747⟩
    Speech_LoadBank_2DA0B(chemin2, 23)                                                                ⟨218751⟩
si byte_4F55C == 0 :
    v202 = booléen                                                                                    ⟨218760⟩
    v202 = 120                                                                                        ⟨218762⟩
    attend(chronomètre=objet42)                                                                       ⟨218767⟩
dessine_image(surface=pal11, x=0, y=0, données=données(optshps 116.+0), image=0)                      ⟨218795⟩
dessine_image(surface=pal11, x=0, y=0, données=données(midgames 20.+0), image=0)                      ⟨218813⟩
dessine_image(surface=pal11, x=0, y=0, données=données(optshps 44.+0), image=0)                       ⟨218831⟩
v334 = 0                                                                                              ⟨218835⟩
TextFormat_ApplyStyleAttribute_357D1(&v334, pal11)                                                    ⟨218840⟩
v190 = word_4D36E                                                                                     ⟨218843⟩
v348 = 0                                                                                              ⟨218844⟩
TextFormat_ApplyStyleAttribute_357D1(&v348, v190)                                                     ⟨218849⟩
si = 0                                                                                                ⟨218851⟩
tant que si < 25 :
    v192 = 24 - si                                                                                    ⟨218857⟩
    v194 = (si·2) + 151                                                                               ⟨218861⟩
    v328 = v192                                                                                       ⟨218864⟩
    v324 = v194                                                                                       ⟨218867⟩
    v196 = 24 - si                                                                                    ⟨218870⟩
    v198 = (si·2) + 151                                                                               ⟨218874⟩
    v342 = v196                                                                                       ⟨218877⟩
    v338 = v198                                                                                       ⟨218880⟩
    UI_ApplyEncodingHelper_35A92(&v348, &v334)                                                        ⟨218885⟩
    si = si + 1                                                                                       ⟨218887⟩
v152 = 0                                                                                              ⟨218953⟩
v142 = 0                                                                                              ⟨218971⟩
Scene_Destruct(scène=scène23, drapeaux=0)                                                             ⟨218975⟩
v86 = 0                                                                                               ⟨219016⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨219020⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨219027⟩
v77 = 0                                                                                               ⟨219047⟩
v76 = 0                                                                                               ⟨219048⟩
v59 = 0                                                                                               ⟨219069⟩
v58 = 0                                                                                               ⟨219070⟩
v49 = 0                                                                                               ⟨219087⟩
v48 = 0                                                                                               ⟨219088⟩
v33 = 0                                                                                               ⟨219109⟩
v32 = 0                                                                                               ⟨219110⟩
v5 = 0                                                                                                ⟨219127⟩
v4 = 0                                                                                                ⟨219128⟩
retour                                                                                                ⟨219132⟩
```

## Tableaux du segment de données

- **T1** : 164 octets depuis `unk_4AC24` ⟨207705⟩
  `169 109 172 106 176 102 178 100 180 97 183 95 185 93 186 91 187 89 186 87`
  `185 86 182 84 178 83 173 80 169 79 165 78 161 77 159 78 160 81 162 84`
  `165 90 167 92 171 97 173 101 175 106 174 107 169 108 161 106 152 104 141 101`
  `134 97 128 94 125 92 123 93 127 94 130 95 135 97 141 99 148 101 155 103`
  `162 106`
- **T2** : 82 octets depuis `ds:8940` ⟨207713⟩
  `0 0 4 4 5 5 5 6 6 6 6 5 5 4 4 0 0 1 1 1`
  `0 0 4 5 5 6 6 5 4 0 1 1 2 3 3 3 2 2 2 1`
  `1`
- **T3** : 164 octets depuis `unk_4AF18` ⟨213294⟩
  `169 109 172 106 176 102 178 100 180 97 183 95 185 93 186 91 187 89 186 87`
  `185 86 182 84 178 83 173 80 169 79 165 78 161 77 159 78 160 81 162 84`
  `165 90 167 92 171 97 173 101 175 106 174 107 169 108 161 106 152 104 141 101`
  `134 97 128 94 125 92 123 93 127 94 130 95 135 97 141 99 148 101 155 103`
  `162 106`
- **T4** : 82 octets depuis `ds:9696` ⟨213302⟩
  `0 0 1 1 2 2 2 3 3 3 3 2 2 1 1 0 0 4 4 4`
  `0 0 1 2 2 3 3 2 1 0 4 4 5 6 6 6 5 5 5 4`
  `4`
