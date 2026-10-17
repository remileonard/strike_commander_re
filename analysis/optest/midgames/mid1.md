# Script extrait de `Midgame1_PlayPart1_5FCF0` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## Midgame1_PlayPart1_5FCF0

```
bp = sp                                                                                               ⟨203021⟩
tableau_textes(tableau=textes1, nombre=8, longueur=300)                                               ⟨203030⟩
tableau_textes(tableau=textes2, nombre=4, longueur=60)                                                ⟨203037⟩
tableau_textes(tableau=textes3, nombre=3, longueur=60)                                                ⟨203044⟩
v29 = 0                                                                                               ⟨203054⟩
v30 = 0                                                                                               ⟨203055⟩
v31 = 0                                                                                               ⟨203056⟩
si word_4684B != 0 :
    v29 = 1                                                                                           ⟨203059⟩
v34 = word_46F46                                                                                      ⟨203063⟩
v470 = 0                                                                                              ⟨203064⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v470, v34)                                                      ⟨203069⟩
v484 = 0                                                                                              ⟨203071⟩
TextRenderer_ApplyFormatChange_2EA21(&v484, 0)                                                        ⟨203080⟩
SmallObject_RegisterInList_2CB40(&v38, &v484)                                                         ⟨203086⟩
si v29 != 0 :
    si sub_6734(chemin1) == 0 : aller à loc_5FEA6                                                     ⟨203148⟩
    pak mid1voc.ouvre(chemin1, 1)                                                                     ⟨203155⟩
sinon :
    v29 = 0                                                                                           ⟨203162⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨203169⟩
charge(mid1 27)                                                                                       ⟨203181⟩
GlyphObject_ConstructWithBuffer_311CF(&v956, mid1 27)                                                 ⟨203187⟩
v956 = 7597                                                                                           ⟨203189⟩
v933 = 0                                                                                              ⟨203190⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 3)                                                       ⟨203207⟩
v66 = ?                                                                                               ⟨203209⟩
v68 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 3)                                                 ⟨203210⟩
v64 = v68                                                                                             ⟨203212⟩
v59 = 1                                                                                               ⟨203214⟩
v58 = 0                                                                                               ⟨203215⟩
GlyphObject_ConstructWithBuffer_311CF(&v980, &v64)                                                    ⟨203220⟩
zone_texte(zone=zone1, police=&v956)                                                                  ⟨203227⟩
v76 = 0                                                                                               ⟨203229⟩
charge(midgames 19)                                                                                   ⟨203243⟩
charge(midgames 20)                                                                                   ⟨203255⟩
charge(midgames 21)                                                                                   ⟨203267⟩
v116 = 0                                                                                              ⟨203269⟩
v111 = 0                                                                                              ⟨203271⟩
v110 = 0                                                                                              ⟨203272⟩
v126 = 0                                                                                              ⟨203273⟩
v121 = 0                                                                                              ⟨203275⟩
v120 = 0                                                                                              ⟨203276⟩
charge(optshps 116)                                                                                   ⟨203317⟩
charge(optshps 44)                                                                                    ⟨203325⟩
v132 = 0                                                                                              ⟨203327⟩
v138 = 0                                                                                              ⟨203329⟩
v144 = 0                                                                                              ⟨203331⟩
v150 = 0                                                                                              ⟨203333⟩
v156 = 0                                                                                              ⟨203335⟩
charge(optpals 21)                                                                                    ⟨203347⟩
palette_depuis(pal2(optpals 21))                                                                      ⟨203353⟩
charge(optpals 24)                                                                                    ⟨203365⟩
palette_depuis(pal3(optpals 24))                                                                      ⟨203371⟩
charge(midgames 22)                                                                                   ⟨203383⟩
palette_depuis(pal4(midgames 22))                                                                     ⟨203389⟩
charge(mid1 59)                                                                                       ⟨203401⟩
palette_depuis(pal5(mid1 59))                                                                         ⟨203407⟩
charge_convdata_type2("normal")                                                                       ⟨203493⟩
palette_depuis(pal6(convdata type 2 "normal"))                                                        ⟨203499⟩
v158 = byte_46848                                                                                     ⟨203521⟩
si v29 == 0 :
    si v158 != 1 :
        si v158 == 2 : aller à loc_604EB                                                              ⟨203539⟩
    sinon :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨203564⟩
        flux_iff(flux=flux1)                                                                          ⟨203578⟩
        v3611 = 256                                                                                   ⟨203581⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨203590⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨203596⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨203602⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨203606⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨203608⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨203616⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨203620⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨203628⟩
        v31 = 1                                                                                       ⟨203630⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨203634⟩
        aller à loc_60603                                                                             ⟨203641⟩
        loc_604EB:                                                                                    ⟨203644⟩
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨203661⟩
        flux_iff(flux=flux1)                                                                          ⟨203675⟩
        v3611 = 256                                                                                   ⟨203678⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨203687⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨203693⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨203699⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨203703⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨203705⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨203713⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨203717⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨203725⟩
        v31 = 1                                                                                       ⟨203727⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨203731⟩
loc_60603:                                                                                            ⟨203740⟩
tableau_objets(objets1 : 6 objets de 10 octets)                                                       ⟨203749⟩
v164 = word_44AFC                                                                                     ⟨203752⟩
v162 = word_44AFE                                                                                     ⟨203754⟩
v160 = word_44B00                                                                                     ⟨203756⟩
si v31 != 0 :
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨203772⟩
    tant que si < 6 :
        charge(asoundfx v164[si])                                                                     ⟨203791⟩
        canal_enregistre(canal=canal1, ressource=objets1[si], x=0)                                    ⟨203802⟩
        canal_arrête(canal=canal1)                                                                    ⟨203806⟩
    canal_arrête(canal=canal1)                                                                        ⟨203815⟩
v174 = 0                                                                                              ⟨203838⟩
v169 = 0                                                                                              ⟨203840⟩
v168 = 0                                                                                              ⟨203841⟩
v1436 = 0                                                                                             ⟨203842⟩
v1431 = 0                                                                                             ⟨203844⟩
v1430 = 0                                                                                             ⟨203845⟩
v1440 = 0                                                                                             ⟨203846⟩
si v158 != 1 :
    si v158 == 2 : aller à loc_6078C                                                                  ⟨203853⟩
sinon :
    v30 = 1                                                                                           ⟨203868⟩
    aller à loc_607AB                                                                                 ⟨203869⟩
    loc_6078C:                                                                                        ⟨203872⟩
    v30 = 1                                                                                           ⟨203883⟩
loc_607AB:                                                                                            ⟨203886⟩
si v30 != 0 :
    charge(amusic 0)                                                                                  ⟨203903⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨203908⟩
    canal_enregistre(canal=canal2, ressource=amusic 0, x=0)                                           ⟨203915⟩
v3526 = 6239                                                                                          ⟨203924⟩
v3510 = 0                                                                                             ⟨203925⟩
v3505 = 0                                                                                             ⟨203927⟩
v3504 = 0                                                                                             ⟨203928⟩
v3526 = 6255                                                                                          ⟨203930⟩
v1449 = booléen                                                                                       ⟨203932⟩
v1445 = booléen                                                                                       ⟨203933⟩
si v31 != 0 :
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨203945⟩
flux_iff(flux=flux1)                                                                                  ⟨203961⟩
v3611 = 256                                                                                           ⟨203964⟩
flux1.ouvre(chemin1, 1)                                                                               ⟨203973⟩
iff_form(flux=flux1, balise='MG01', x=0)                                                              ⟨203979⟩
iff_form(flux=flux1, balise='DATA', x=0)                                                              ⟨203985⟩
tant que si < 4 :
    iff_chunk(flux=flux1, balise='TEXT', x=1)                                                         ⟨203996⟩
    si v3594 > 60 :
        sub_310B(7485)                                                                                ⟨204002⟩
    iff_lit(flux=flux1, destination=textes2[0] + (textes2.+0·si), taille=v3594)                       ⟨204016⟩
    v3607 = v3590                                                                                     ⟨204019⟩
tant que si < 3 :
    iff_chunk(flux=flux1, balise='TEXT', x=1)                                                         ⟨204034⟩
    si v3594 > 60 :
        sub_310B(7518)                                                                                ⟨204040⟩
    iff_lit(flux=flux1, destination=textes3[0] + (textes3.+0·si), taille=v3594)                       ⟨204054⟩
    v3607 = v3590                                                                                     ⟨204057⟩
iff_ferme(flux=flux1)                                                                                 ⟨204065⟩
si v29 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨204072⟩
sinon :
    iff_form(flux=flux1, balise='SPOK', x=0)                                                          ⟨204082⟩
    tant que di < 8 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨204093⟩
        v336 = v3594                                                                                  ⟨204096⟩
        si v336 > 300 :
            sub_310B(7551)                                                                            ⟨204100⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·di), taille=v336)                    ⟨204114⟩
        v3607 = v3590                                                                                 ⟨204117⟩
iff_ferme_form(flux=flux1)                                                                            ⟨204127⟩
iff_ferme_form(flux=flux1)                                                                            ⟨204132⟩
v178 = 0                                                                                              ⟨204143⟩
palette_remplit(palette=pal1, couleur=&v178, premier=0, nombre=256)                                   ⟨204152⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨204160⟩
dessine_image(surface=surface1, x=0, y=24, données=données(optshps 116.+0), image=0)                  ⟨204177⟩
dessine_image(surface=surface1, x=0, y=24, données=données(midgames 20.+0), image=0)                  ⟨204194⟩
vide_entrées()                                                                                        ⟨204196⟩
v342 = v76                                                                                            ⟨204198⟩
v340 = 152                                                                                            ⟨204200⟩
v338 = 319                                                                                            ⟨204202⟩
v336 = 199                                                                                            ⟨204204⟩
zone_texte(zone=zone2, police=&v980)                                                                  ⟨204212⟩
v346 = v340                                                                                           ⟨204216⟩
v348 = v338                                                                                           ⟨204218⟩
v350 = v336                                                                                           ⟨204220⟩
v3549 = v342                                                                                          ⟨204222⟩
v3547 = v346                                                                                          ⟨204224⟩
v3545 = v348                                                                                          ⟨204226⟩
v3543 = v350                                                                                          ⟨204228⟩
charge(mid1 60)                                                                                       ⟨204239⟩
charge(mid1 48)                                                                                       ⟨204251⟩
palette_depuis(pal7(mid1 48))                                                                         ⟨204258⟩

──── scène1 ────
scène1 = Scene_Create(cadence=10, palette=255, surface=surface1)                                      ⟨204266⟩
si v30 != 0 :
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v1438)                                        ⟨204275⟩
palette_copie(destination=pal1, source=pal2(optpals 21))                                              ⟨204288⟩
palette_copie(destination=pal1, source=pal4(midgames 22))                                             ⟨204297⟩
palette_copie(destination=pal1, source=pal3(optpals 24))                                              ⟨204306⟩
fondu_apparition(palette=pal1, couleur=&v178, pas=2, premier=0, nombre=256)                           ⟨204315⟩
c1 = MovingLayer(ressource=optshps 116, x=0, y=0)                                                     ⟨204328⟩
c1.vx = 0                                                                                             ⟨204335⟩
c1.vy = 0                                                                                             ⟨204337⟩
c2 = MovingLayer(ressource=midgames 20, x=0, y=0)                                                     ⟨204358⟩
c2.vx = 0                                                                                             ⟨204365⟩
c2.vy = 0                                                                                             ⟨204367⟩
ajoute c1 à scène1                                                                                    ⟨204380⟩
ajoute c2 à scène1                                                                                    ⟨204385⟩
charge(mid1 3)                                                                                        ⟨204397⟩
c3 = AnimLayer(ressource=mid1 3, x=0, y=0)                                                            ⟨204404⟩
si v29 != 0 :
    charge(mid1voc 7)                                                                                 ⟨204419⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 7)                                  ⟨204425⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨204435⟩
        canal_enregistre(canal=canal3, ressource=objets1, x=0)                                        ⟨204442⟩
tant que (scène1.compteur < 20) et (scène1.terminée == 0) :
    Scene_Tick(scène=scène1)                                                                          ⟨204453⟩
ajoute c3 à scène1                                                                                    ⟨204477⟩
si byte_495FC == 0 :
    si v29 != 0 :
        voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                               ⟨204488⟩
    sinon :
        si v31 != 0 :
            si canal3.+0 != 0 :
                AIL_start_sequence(pilote=canal3.+0→4, séquence=v3538)                                ⟨204501⟩
tant que animation_finie(calque=c3) == 0 :
    si scène1.compteur == 35 :
        si v29 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨204518⟩
        sinon :
            si v31 != 0 :
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3538)                            ⟨204531⟩
    Scene_Tick(scène=scène1)                                                                          ⟨204539⟩
retire(parent=scène1, calque=c3)                                                                      ⟨204552⟩
c3.détruit(3)                                                                                         ⟨204559⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨204568⟩
Scene_SetFps(scène=scène1, cadence=20)                                                                ⟨204613⟩
si byte_495FC != 0 :
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨204624⟩
    canal_arrête(canal=canal3)                                                                        ⟨204675⟩
    voix_arrête(voix=voix1)                                                                           ⟨204699⟩
    canal_arrête(canal=canal2)                                                                        ⟨204722⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, Stub_ResourceHandle_Destruct_42090)                            ⟨204769⟩
    v64 = 0                                                                                           ⟨204931⟩
    v59 = 0                                                                                           ⟨204932⟩
    v58 = 0                                                                                           ⟨204933⟩
    retour                                                                                            ⟨205009⟩
vide_entrées()                                                                                        ⟨205013⟩
v385 = 0                                                                                              ⟨205014⟩
palette_copie(destination=pal1, source=pal5(mid1 59))                                                 ⟨205022⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨205030⟩
tant que di < 4 :
    lit_touche(événement=objet1, x=255)                                                               ⟨205040⟩
    si v427 == 1 :
        byte_495FC = 1                                                                                ⟨205048⟩
        Scene_Destruct(scène=scène1, drapeaux=0)                                                      ⟨205052⟩
        canal_arrête(canal=canal3)                                                                    ⟨205103⟩
        voix_arrête(voix=voix1)                                                                       ⟨205127⟩
        canal_arrête(canal=canal2)                                                                    ⟨205150⟩
        CRT_Doprnt_Core(objets1, 10, 6, 1, Stub_ResourceHandle_Destruct_42090)                        ⟨205197⟩
        v64 = 0                                                                                       ⟨205359⟩
        v59 = 0                                                                                       ⟨205360⟩
        v58 = 0                                                                                       ⟨205361⟩
        retour                                                                                        ⟨205437⟩
    si v385 != 0 : aller à loc_621A4                                                                  ⟨205442⟩
    v432 = booléen                                                                                    ⟨205448⟩
    v436 = booléen                                                                                    ⟨205449⟩
    tant que si < 16 :
        si touche_passer() != 0 :
            v385 = 1                                                                                  ⟨205458⟩
            aller à loc_61AD0                                                                         ⟨205459⟩
        v432 = 3                                                                                      ⟨205463⟩
        dessine_image(surface=surface2, x=0, y=0, données=données(optshps 116.+0), image=0)           ⟨205481⟩
        dessine_image(surface=surface2, x=0, y=0, données=données(midgames 20.+0), image=0)           ⟨205498⟩
        v440 = données(mid1 60.+0) + (si·4096)                                                        ⟨205512⟩
        v933 = v440                                                                                   ⟨205514⟩
        v929 = 239                                                                                    ⟨205515⟩
        v927 = 16                                                                                     ⟨205516⟩
        v456 = ax                                                                                     ⟨205527⟩
        Widget_RenderComplexLayoutWrapper_31A3B(zone1, 7577, 2, v456, textes2[0] + (textes2.+0·di))   ⟨205538⟩
        UI_ApplyEncodingHelper_2EC4A(surface2, surface1)                                              ⟨205544⟩
        attend(chronomètre=objet2)                                                                    ⟨205548⟩
    loc_61AD0:                                                                                        ⟨205558⟩
    lit_touche(événement=objet1, x=255)                                                               ⟨205563⟩
    si v427 == 1 :
        byte_495FC = 1                                                                                ⟨205571⟩
        Scene_Destruct(scène=scène1, drapeaux=0)                                                      ⟨205575⟩
        canal_arrête(canal=canal3)                                                                    ⟨205626⟩
        voix_arrête(voix=voix1)                                                                       ⟨205650⟩
        canal_arrête(canal=canal2)                                                                    ⟨205673⟩
        CRT_Doprnt_Core(objets1, 10, 6, 1, Stub_ResourceHandle_Destruct_42090)                        ⟨205720⟩
        v64 = 0                                                                                       ⟨205882⟩
        v59 = 0                                                                                       ⟨205883⟩
        v58 = 0                                                                                       ⟨205884⟩
        retour                                                                                        ⟨205960⟩
    si v385 != 0 : aller à loc_621A4                                                                  ⟨205965⟩
    v442 = 100                                                                                        ⟨205970⟩
    v446 = v442                                                                                       ⟨205972⟩
    v432 = v446                                                                                       ⟨205974⟩
    attend(chronomètre=objet2)                                                                        ⟨205979⟩
    tant que si > -1 :
        si touche_passer() != 0 :
            v385 = 1                                                                                  ⟨205989⟩
            aller à loc_620EB                                                                         ⟨205990⟩
        v432 = 3                                                                                      ⟨205994⟩
        dessine_image(surface=surface2, x=0, y=0, données=données(optshps 116.+0), image=0)           ⟨206012⟩
        dessine_image(surface=surface2, x=0, y=0, données=données(midgames 20.+0), image=0)           ⟨206029⟩
        v450 = données(mid1 60.+0) + (si·4096)                                                        ⟨206043⟩
        v933 = v450                                                                                   ⟨206045⟩
        v929 = 239                                                                                    ⟨206046⟩
        v927 = 16                                                                                     ⟨206047⟩
        v456 = ax                                                                                     ⟨206058⟩
        Widget_RenderComplexLayoutWrapper_31A3B(zone1, 7584, 2, v456, textes2[0] + (textes2.+0·di))   ⟨206069⟩
        UI_ApplyEncodingHelper_2EC4A(surface2, surface1)                                              ⟨206075⟩
        attend(chronomètre=objet2)                                                                    ⟨206079⟩
    loc_620EB:                                                                                        ⟨206089⟩
    si v385 != 0 : aller à loc_621A4                                                                  ⟨206092⟩
    dessine_image(surface=surface2, x=0, y=0, données=données(optshps 116.+0), image=0)               ⟨206112⟩
    dessine_image(surface=surface2, x=0, y=0, données=données(midgames 20.+0), image=0)               ⟨206129⟩
    UI_ApplyEncodingHelper_2EC4A(surface2, surface1)                                                  ⟨206135⟩
    v442 = 100                                                                                        ⟨206137⟩
    si di == 1 :
        v442 = 250                                                                                    ⟨206140⟩
    v454 = v442                                                                                       ⟨206144⟩
    v432 = v454                                                                                       ⟨206146⟩
    attend(chronomètre=objet2)                                                                        ⟨206151⟩
loc_621A4:                                                                                            ⟨206161⟩
si byte_495FC != 0 :
    Scene_Destruct(scène=scène1, drapeaux=0)                                                          ⟨206172⟩
    canal_arrête(canal=canal3)                                                                        ⟨206223⟩
    voix_arrête(voix=voix1)                                                                           ⟨206247⟩
    canal_arrête(canal=canal2)                                                                        ⟨206270⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, Stub_ResourceHandle_Destruct_42090)                            ⟨206317⟩
    v64 = 0                                                                                           ⟨206479⟩
    v59 = 0                                                                                           ⟨206480⟩
    v58 = 0                                                                                           ⟨206481⟩
    retour                                                                                            ⟨206557⟩
scène1.terminée = 0                                                                                   ⟨206561⟩
vide_entrées()                                                                                        ⟨206562⟩
c1.vx = 0                                                                                             ⟨206564⟩
c1.vy = -1                                                                                            ⟨206566⟩
c2.vx = 0                                                                                             ⟨206568⟩
c2.vy = -1                                                                                            ⟨206570⟩
palette_copie(destination=pal1, source=pal7(mid1 48))                                                 ⟨206578⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨206586⟩
c4 = MovingLayer(ressource=midgames 19, x=0, y=150, image=0)                                          ⟨206600⟩
c4.vx = 0                                                                                             ⟨206607⟩
c4.vy = 0                                                                                             ⟨206609⟩
c4.vx = 0                                                                                             ⟨206611⟩
c4.vy = -1                                                                                            ⟨206613⟩
ajoute c4 à scène1                                                                                    ⟨206626⟩
c5 = MovingLayer(ressource=optshps 44, x=0, y=17, image=0)                                            ⟨206640⟩
c5.vx = 0                                                                                             ⟨206647⟩
c5.vy = 0                                                                                             ⟨206649⟩
c5.vx = 0                                                                                             ⟨206651⟩
c5.vy = -1                                                                                            ⟨206653⟩
ajoute c5 à scène1                                                                                    ⟨206666⟩
c6 = MovingLayer(ressource=midgames 19, x=0, y=200, image=1)                                          ⟨206680⟩
c6.vx = 0                                                                                             ⟨206687⟩
c6.vy = 0                                                                                             ⟨206689⟩
c6.vx = 0                                                                                             ⟨206691⟩
c6.vy = -1                                                                                            ⟨206693⟩
ajoute c6 à c5                                                                                        ⟨206705⟩
c7 = MovingLayer(ressource=midgames 19, x=0, y=43, image=2)                                           ⟨206719⟩
c7.vx = 0                                                                                             ⟨206726⟩
c7.vy = 0                                                                                             ⟨206728⟩
c7.vx = 0                                                                                             ⟨206730⟩
c7.vy = -1                                                                                            ⟨206732⟩
ajoute c7 à c6                                                                                        ⟨206744⟩
tant que c7.y_absolu() > 60 :
    Scene_Tick(scène=scène1)                                                                          ⟨206752⟩
c1.vx = 0                                                                                             ⟨206764⟩
c1.vy = 0                                                                                             ⟨206766⟩
c2.vx = 0                                                                                             ⟨206768⟩
c2.vy = 0                                                                                             ⟨206770⟩
c4.vx = 0                                                                                             ⟨206772⟩
c4.vy = 0                                                                                             ⟨206774⟩
c5.vx = 0                                                                                             ⟨206776⟩
c5.vy = 0                                                                                             ⟨206778⟩
c6.vx = 0                                                                                             ⟨206780⟩
c6.vy = 0                                                                                             ⟨206782⟩
c7.vx = 0                                                                                             ⟨206784⟩
c7.vy = 0                                                                                             ⟨206786⟩
Scene_Tick(scène=scène1)                                                                              ⟨206789⟩
charge(mid1 13)                                                                                       ⟨206801⟩
c8 = AnimLayer(ressource=mid1 13, x=0, y=-70)                                                         ⟨206808⟩
ajoute c8 à scène1                                                                                    ⟨206814⟩
si v29 != 0 :
    charge(mid1voc 8)                                                                                 ⟨206828⟩
    voix_arrête(voix=voix1)                                                                           ⟨206832⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 8)                                  ⟨206838⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨206848⟩
        canal_enregistre(canal=canal3, ressource=objets1[1], x=0)                                     ⟨206855⟩
scène1.compteur = 0                                                                                   ⟨206860⟩
tant que animation_finie(calque=c8) == 0 :
    si scène1.compteur == 65 :
        si v29 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨206872⟩
        sinon :
            si v31 != 0 :
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=v3538)                            ⟨206885⟩
    Scene_Tick(scène=scène1)                                                                          ⟨206893⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨206907⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨206915⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨206960⟩
vide_entrées()                                                                                        ⟨207009⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨207018⟩
    voix_arrête(voix=voix1)                                                                           ⟨207042⟩
    canal_arrête(canal=canal2)                                                                        ⟨207065⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, Stub_ResourceHandle_Destruct_42090)                            ⟨207112⟩
    v64 = 0                                                                                           ⟨207274⟩
    v59 = 0                                                                                           ⟨207275⟩
    v58 = 0                                                                                           ⟨207276⟩
    retour                                                                                            ⟨207352⟩
charge(mid1 6)                                                                                        ⟨207366⟩
charge(mid1 26)                                                                                       ⟨207378⟩
charge(mid1 11)                                                                                       ⟨207390⟩
charge(mid1 12)                                                                                       ⟨207402⟩
charge(mid1 42)                                                                                       ⟨207414⟩
palette_depuis(pal8(mid1 42))                                                                         ⟨207421⟩

──── scène2 ────
scène2 = Scene_Create(cadence=20, palette=255, surface=surface1)                                      ⟨207439⟩
charge(mid1 54)                                                                                       ⟨207451⟩
palette_depuis(pal9(mid1 54))                                                                         ⟨207458⟩
c9 = Layer(ressource=optshps 116, x=0, y=-24)                                                         ⟨207465⟩
ajoute c9 à scène2                                                                                    ⟨207471⟩
charge(mid1 20)                                                                                       ⟨207483⟩
c10 = LoopAnimLayer(ressource=mid1 20, x=0, y=-40)                                                    ⟨207496⟩
c10.mode = 0                                                                                          ⟨207503⟩
ajoute c10 à scène2                                                                                   ⟨207516⟩
c11 = Layer(ressource=mid1 6, x=0, y=-24)                                                             ⟨207523⟩
ajoute c11 à scène2                                                                                   ⟨207529⟩
c12 = ClippedMovingLayer(ressource=mid1 11, x=159, y=40)                                              ⟨207536⟩
c12.découpe_gauche = 131                                                                              ⟨207540⟩
c12.découpe_haut = 9                                                                                  ⟨207542⟩
c12.découpe_droite = 190                                                                              ⟨207544⟩
c12.découpe_bas = 67                                                                                  ⟨207546⟩
ajoute c12 à scène2                                                                                   ⟨207550⟩
c13 = Layer(ressource=mid1 12, x=99, y=108)                                                           ⟨207557⟩
ajoute c13 à scène2                                                                                   ⟨207563⟩
c14 = ImageLayer(ressource=mid1 12, x=195, y=107, image=3)                                            ⟨207571⟩
ajoute c14 à scène2                                                                                   ⟨207577⟩
c15 = ImageLayer(ressource=mid1 11, x=135, y=22, image=7)                                             ⟨207585⟩
ajoute c15 à scène2                                                                                   ⟨207591⟩
c16 = ImageLayer(ressource=mid1 11, x=185, y=22, image=16)                                            ⟨207599⟩
ajoute c16 à scène2                                                                                   ⟨207605⟩
c17 = ImageLayer(ressource=mid1 11, x=160, y=38, image=21)                                            ⟨207613⟩
ajoute c17 à scène2                                                                                   ⟨207619⟩
c18 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=22)                              ⟨207627⟩
c18.découpe_gauche = 131                                                                              ⟨207631⟩
c18.découpe_haut = 9                                                                                  ⟨207633⟩
c18.découpe_droite = 190                                                                              ⟨207635⟩
c18.découpe_bas = 67                                                                                  ⟨207637⟩
ajoute c18 à scène2                                                                                   ⟨207641⟩
c19 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=23)                              ⟨207649⟩
c19.découpe_gauche = 131                                                                              ⟨207653⟩
c19.découpe_haut = 9                                                                                  ⟨207655⟩
c19.découpe_droite = 190                                                                              ⟨207657⟩
c19.découpe_bas = 67                                                                                  ⟨207659⟩
ajoute c19 à scène2                                                                                   ⟨207663⟩
c20 = ImageLayer(ressource=mid1 11, x=159, y=40, image=24)                                            ⟨207671⟩
ajoute c20 à scène2                                                                                   ⟨207677⟩
c21 = ImageLayer(ressource=mid1 11, x=138, y=17, image=26)                                            ⟨207685⟩
ajoute c21 à scène2                                                                                   ⟨207691⟩
c22 = ImageLayer(ressource=mid1 11, x=140, y=63, image=27)                                            ⟨207699⟩
ajoute c22 à scène2                                                                                   ⟨207705⟩
c23 = ImageLayer(ressource=mid1 11, x=178, y=63, image=28)                                            ⟨207713⟩
ajoute c23 à scène2                                                                                   ⟨207719⟩
palette_copie(destination=pal1, source=pal9(mid1 54))                                                 ⟨207732⟩
palette_copie(destination=pal1, source=pal8(mid1 42))                                                 ⟨207741⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨207749⟩
v394 = 16                                                                                             ⟨207751⟩
v396 = 7                                                                                              ⟨207752⟩
T1 = tableau de 164 octets copié depuis unk_44B02                                                     ⟨207759⟩
T2 = tableau de 82 octets copié depuis ds:7050                                                        ⟨207767⟩
si v29 != 0 :
    charge(mid1voc 9)                                                                                 ⟨207780⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 9)                                  ⟨207786⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨207791⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨207801⟩
        canal_enregistre(canal=canal3, ressource=objets1[2], x=0)                                     ⟨207808⟩
        si canal3.+0 != 0 :
            AIL_start_sequence(pilote=canal3.+0→4, séquence=v3538)                                    ⟨207815⟩
tant que (scène2.compteur < 40) et (scène2.terminée == 0) :
    si scène2.compteur & 1 != 0 :
        v394 = v394 + 1                                                                               ⟨207827⟩
        si v394 == 21 :
            v394 = 16                                                                                 ⟨207831⟩
        c16.image = v394                                                                              ⟨207838⟩
        v396 = v396 - 1                                                                               ⟨207839⟩
        si v396 == 6 :
            v396 = 15                                                                                 ⟨207843⟩
        v414 = v396                                                                                   ⟨207847⟩
        c15.image = v414                                                                              ⟨207850⟩
    v416 = T1.mot[scène2.compteur·2] + dword_44BA6                                                    ⟨207859⟩
    v418 = T1.mot[(scène2.compteur·2) + 1] + dword_44BA6+2                                            ⟨207866⟩
    c18.x = v416                                                                                      ⟨207869⟩
    c18.y = v418                                                                                      ⟨207872⟩
    word_44BFC = word_44BFC + word_44C00                                                              ⟨207874⟩
    word_44BFE = word_44BFE + word_44C02                                                              ⟨207876⟩
    si word_44BFC >= 185 ou word_44BFC <= 136 :
        word_44C00 = -word_44C00                                                                      ⟨207886⟩
    si word_44BFE >= 62 ou word_44BFE <= 14 :
        word_44C02 = -word_44C02                                                                      ⟨207898⟩
    c19.x = word_44BFC                                                                                ⟨207904⟩
    c19.y = word_44BFE                                                                                ⟨207906⟩
    v420 = T2.mot[scène2.compteur]                                                                    ⟨207912⟩
    c12.image = v420                                                                                  ⟨207915⟩
    si T2.mot[scène2.compteur] > 3 :
        c13.image = 1                                                                                 ⟨207923⟩
    sinon :
        si T2.mot[scène2.compteur] != 0 :
            c13.image = 2                                                                             ⟨207935⟩
        sinon :
            c13.image = 0                                                                             ⟨207941⟩
    word_44C06 = word_44C06 + word_44C04                                                              ⟨207946⟩
    si word_44C06 >= 5 ou word_44C06 <= 3 :
        word_44C04 = -word_44C04                                                                      ⟨207956⟩
    v422 = word_44C06                                                                                 ⟨207960⟩
    c14.image = v422                                                                                  ⟨207963⟩
    Scene_Tick(scène=scène2)                                                                          ⟨207966⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨207995⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨208003⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨208072⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨208182⟩
    voix_arrête(voix=voix1)                                                                           ⟨208206⟩
    canal_arrête(canal=canal2)                                                                        ⟨208229⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, Stub_ResourceHandle_Destruct_42090)                            ⟨208276⟩
    v64 = 0                                                                                           ⟨208438⟩
    v59 = 0                                                                                           ⟨208439⟩
    v58 = 0                                                                                           ⟨208440⟩
    retour                                                                                            ⟨208516⟩
charge(mid1 1)                                                                                        ⟨208530⟩
charge(mid1 44)                                                                                       ⟨208542⟩
palette_depuis(pal10(mid1 44))                                                                        ⟨208549⟩
charge(mid1 38)                                                                                       ⟨208561⟩
palette_depuis(pal11(mid1 38))                                                                        ⟨208568⟩

──── scène3 ────
scène3 = Scene_Create(cadence=20, palette=255, surface=surface1)                                      ⟨208576⟩
palette_copie(destination=pal1, source=pal10(mid1 44))                                                ⟨208585⟩
palette_copie(destination=pal1, source=pal11(mid1 38))                                                ⟨208594⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨208606⟩
c24 = Layer(ressource=optshps 116, x=0, y=-24)                                                        ⟨208613⟩
ajoute c24 à scène3                                                                                   ⟨208619⟩
c25 = JitterImageLayer(ressource=mid1 6, x=0, y=-40, image=2)                                         ⟨208627⟩
c26 = ImageLayer(ressource=mid1 26, x=-5, y=0, image=2)                                               ⟨208636⟩
c27 = ImageLayer(ressource=mid1 26, x=6, y=0, image=3)                                                ⟨208645⟩
ajoute c26 à c25                                                                                      ⟨208650⟩
ajoute c27 à c25                                                                                      ⟨208654⟩
ajoute c25 à scène3                                                                                   ⟨208659⟩
c28 = OverlayImageLayer(ressource=mid1 1, x=0, y=24, image=3)                                         ⟨208667⟩
ajoute c28 à c25                                                                                      ⟨208672⟩
tant que (scène3.compteur < 20) et (scène3.terminée == 0) :
    Scene_Tick(scène=scène3)                                                                          ⟨208680⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨208704⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨208881⟩
    voix_arrête(voix=voix1)                                                                           ⟨208905⟩
    canal_arrête(canal=canal2)                                                                        ⟨208928⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, Stub_ResourceHandle_Destruct_42090)                            ⟨208975⟩
    v64 = 0                                                                                           ⟨209137⟩
    v59 = 0                                                                                           ⟨209138⟩
    v58 = 0                                                                                           ⟨209139⟩
    retour                                                                                            ⟨209215⟩
charge(mid1 56)                                                                                       ⟨209229⟩
palette_depuis(pal12(mid1 56))                                                                        ⟨209236⟩

──── scène4 ────
scène4 = Scene_Create(cadence=20, palette=255, surface=surface1)                                      ⟨209244⟩
si v29 != 0 :
    charge(mid1voc 8)                                                                                 ⟨209258⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 8)                                  ⟨209264⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨209269⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨209279⟩
        canal_enregistre(canal=canal3, ressource=objets1[1], x=0)                                     ⟨209286⟩
        si canal3.+0 != 0 :
            AIL_start_sequence(pilote=canal3.+0→4, séquence=v3538)                                    ⟨209293⟩
palette_copie(destination=pal1, source=pal12(mid1 56))                                                ⟨209310⟩
palette_copie(destination=pal1, source=pal3(optpals 24))                                              ⟨209319⟩
palette_copie(destination=pal1, source=pal4(midgames 22))                                             ⟨209328⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨209336⟩
c29 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨209343⟩
c30 = Layer(ressource=midgames 21, x=0, y=0)                                                          ⟨209351⟩
ajoute c30 à c29                                                                                      ⟨209356⟩
ajoute c29 à scène4                                                                                   ⟨209361⟩
c31 = Layer(ressource=optshps 44, x=0, y=-40)                                                         ⟨209368⟩
ajoute c31 à scène4                                                                                   ⟨209374⟩
c32 = ImageLayer(ressource=midgames 19, x=0, y=90, image=1)                                           ⟨209382⟩
ajoute c32 à scène4                                                                                   ⟨209388⟩
c33 = ImageLayer(ressource=midgames 19, x=0, y=70, image=2)                                           ⟨209396⟩
ajoute c33 à scène4                                                                                   ⟨209402⟩
charge(mid1 22)                                                                                       ⟨209414⟩
c34 = AnimLayer(ressource=mid1 22, x=0, y=0)                                                          ⟨209421⟩
ajoute c34 à scène4                                                                                   ⟨209427⟩
tant que animation_finie(calque=c34) == 0 :
    Scene_Tick(scène=scène4)                                                                          ⟨209435⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨209470⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨209478⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨209523⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨209724⟩
    voix_arrête(voix=voix1)                                                                           ⟨209748⟩
    canal_arrête(canal=canal2)                                                                        ⟨209771⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, Stub_ResourceHandle_Destruct_42090)                            ⟨209818⟩
    v64 = 0                                                                                           ⟨209980⟩
    v59 = 0                                                                                           ⟨209981⟩
    v58 = 0                                                                                           ⟨209982⟩
    retour                                                                                            ⟨210058⟩
si v29 != 0 :
    charge(mid1voc 9)                                                                                 ⟨210074⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 9)                                  ⟨210080⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨210090⟩
        canal_enregistre(canal=canal3, ressource=objets1[2], x=0)                                     ⟨210097⟩
charge(mid1 57)                                                                                       ⟨210112⟩
palette_depuis(pal13(mid1 57))                                                                        ⟨210119⟩

──── scène5 ────
scène5 = Scene_Create(cadence=20, palette=255, surface=surface1)                                      ⟨210127⟩
palette_copie(destination=pal1, source=pal13(mid1 57))                                                ⟨210140⟩
palette_copie(destination=pal1, source=pal8(mid1 42))                                                 ⟨210149⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨210157⟩
c35 = Layer(ressource=optshps 116, x=0, y=-24)                                                        ⟨210164⟩
ajoute c35 à scène5                                                                                   ⟨210170⟩
charge(mid1 23)                                                                                       ⟨210182⟩
c36 = LoopAnimLayer(ressource=mid1 23, x=0, y=-24)                                                    ⟨210195⟩
c36.mode = 0                                                                                          ⟨210202⟩
ajoute c36 à scène5                                                                                   ⟨210215⟩
c37 = Layer(ressource=mid1 6, x=0, y=-24)                                                             ⟨210222⟩
ajoute c37 à scène5                                                                                   ⟨210228⟩
c38 = ClippedMovingLayer(ressource=mid1 11, x=159, y=40)                                              ⟨210235⟩
c38.découpe_gauche = 131                                                                              ⟨210239⟩
c38.découpe_haut = 9                                                                                  ⟨210241⟩
c38.découpe_droite = 190                                                                              ⟨210243⟩
c38.découpe_bas = 67                                                                                  ⟨210245⟩
ajoute c38 à scène5                                                                                   ⟨210249⟩
c39 = Layer(ressource=mid1 12, x=99, y=108)                                                           ⟨210256⟩
ajoute c39 à scène5                                                                                   ⟨210262⟩
c40 = ImageLayer(ressource=mid1 12, x=195, y=107, image=3)                                            ⟨210270⟩
ajoute c40 à scène5                                                                                   ⟨210276⟩
c41 = ImageLayer(ressource=mid1 11, x=135, y=22, image=7)                                             ⟨210284⟩
ajoute c41 à scène5                                                                                   ⟨210290⟩
c42 = ImageLayer(ressource=mid1 11, x=185, y=22, image=16)                                            ⟨210298⟩
ajoute c42 à scène5                                                                                   ⟨210304⟩
c43 = ImageLayer(ressource=mid1 11, x=160, y=38, image=21)                                            ⟨210312⟩
ajoute c43 à scène5                                                                                   ⟨210318⟩
c44 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=22)                              ⟨210326⟩
c44.découpe_gauche = 131                                                                              ⟨210330⟩
c44.découpe_haut = 9                                                                                  ⟨210332⟩
c44.découpe_droite = 190                                                                              ⟨210334⟩
c44.découpe_bas = 67                                                                                  ⟨210336⟩
ajoute c44 à scène5                                                                                   ⟨210340⟩
c45 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=23)                              ⟨210348⟩
c45.découpe_gauche = 131                                                                              ⟨210352⟩
c45.découpe_haut = 9                                                                                  ⟨210354⟩
c45.découpe_droite = 190                                                                              ⟨210356⟩
c45.découpe_bas = 67                                                                                  ⟨210358⟩
ajoute c45 à scène5                                                                                   ⟨210362⟩
c46 = ImageLayer(ressource=mid1 11, x=159, y=40, image=24)                                            ⟨210370⟩
ajoute c46 à scène5                                                                                   ⟨210376⟩
c47 = ImageLayer(ressource=mid1 11, x=138, y=17, image=26)                                            ⟨210384⟩
ajoute c47 à scène5                                                                                   ⟨210390⟩
c48 = ImageLayer(ressource=mid1 11, x=140, y=63, image=27)                                            ⟨210398⟩
ajoute c48 à scène5                                                                                   ⟨210404⟩
c49 = ImageLayer(ressource=mid1 11, x=178, y=63, image=28)                                            ⟨210412⟩
ajoute c49 à scène5                                                                                   ⟨210418⟩
v404 = 16                                                                                             ⟨210420⟩
v406 = 7                                                                                              ⟨210421⟩
T1 = tableau de 164 octets copié depuis aImmjFDA_YWVTSn                                               ⟨210428⟩
T2 = tableau de 82 octets copié depuis ds:7312                                                        ⟨210436⟩
si v29 != 0 :
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨210442⟩
si v31 != 0 :
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3538)                                        ⟨210453⟩
tant que (scène5.compteur < 40) et (scène5.terminée == 0) :
    v404 = v404 - 1                                                                                   ⟨210463⟩
    si v404 == 15 :
        v404 = 20                                                                                     ⟨210467⟩
    c42.image = v404                                                                                  ⟨210474⟩
    v406 = v406 + 1                                                                                   ⟨210475⟩
    si v406 == 16 :
        v406 = 7                                                                                      ⟨210479⟩
    v414 = v406                                                                                       ⟨210483⟩
    c41.image = v414                                                                                  ⟨210486⟩
    v416 = ((scène5.compteur·4) + &v3738)→0 + dword_44CAC                                             ⟨210493⟩
    v418 = ((scène5.compteur·4) + &v3736)→0 + dword_44CAC+2                                           ⟨210500⟩
    c44.x = v416                                                                                      ⟨210503⟩
    c44.y = v418                                                                                      ⟨210506⟩
    word_44D02 = word_44D02 + word_44D06                                                              ⟨210508⟩
    word_44D04 = word_44D04 + word_44D08                                                              ⟨210510⟩
    si word_44D02 >= 185 ou word_44D02 <= 136 :
        word_44D06 = -word_44D06                                                                      ⟨210520⟩
    si word_44D04 >= 62 ou word_44D04 <= 14 :
        word_44D08 = -word_44D08                                                                      ⟨210532⟩
    c45.x = word_44D02                                                                                ⟨210538⟩
    c45.y = word_44D04                                                                                ⟨210540⟩
    v420 = ((scène5.compteur·2) + &v3820)→0                                                           ⟨210546⟩
    c38.image = v420                                                                                  ⟨210549⟩
    si ((scène5.compteur·2) + &v3820)→0 > 3 :
        c39.image = 1                                                                                 ⟨210557⟩
    sinon :
        si ((scène5.compteur·2) + &v3820)→0 != 0 :
            c39.image = 2                                                                             ⟨210569⟩
        sinon :
            c39.image = 0                                                                             ⟨210575⟩
    word_44D0C = word_44D0C + word_44D0A                                                              ⟨210580⟩
    si word_44D0C >= 5 ou word_44D0C <= 3 :
        word_44D0A = -word_44D0A                                                                      ⟨210590⟩
    v422 = word_44D0C                                                                                 ⟨210594⟩
    c40.image = v422                                                                                  ⟨210597⟩
    Scene_Tick(scène=scène5)                                                                          ⟨210600⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨210629⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨210637⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨210663⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨210907⟩
    voix_arrête(voix=voix1)                                                                           ⟨210931⟩
    canal_arrête(canal=canal2)                                                                        ⟨210954⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, Stub_ResourceHandle_Destruct_42090)                            ⟨211001⟩
    v64 = 0                                                                                           ⟨211163⟩
    v59 = 0                                                                                           ⟨211164⟩
    v58 = 0                                                                                           ⟨211165⟩
    retour                                                                                            ⟨211241⟩
charge(mid1 0)                                                                                        ⟨211255⟩
charge(mid1 45)                                                                                       ⟨211267⟩
palette_depuis(pal14(mid1 45))                                                                        ⟨211274⟩
charge(mid1 39)                                                                                       ⟨211286⟩
palette_depuis(pal15(mid1 39))                                                                        ⟨211293⟩

──── scène6 ────
scène6 = Scene_Create(cadence=10, palette=255, surface=surface1)                                      ⟨211301⟩
v342 = v76                                                                                            ⟨211304⟩
v340 = 152                                                                                            ⟨211306⟩
v338 = 319                                                                                            ⟨211308⟩
v336 = 199                                                                                            ⟨211310⟩
zone_texte(zone=zone3, police=&v980)                                                                  ⟨211318⟩
v346 = v340                                                                                           ⟨211322⟩
v348 = v338                                                                                           ⟨211324⟩
v3583 = v342                                                                                          ⟨211328⟩
v3581 = v346                                                                                          ⟨211330⟩
v3579 = v348                                                                                          ⟨211332⟩
v3577 = v336                                                                                          ⟨211334⟩
palette_copie(destination=pal1, source=pal14(mid1 45))                                                ⟨211342⟩
palette_copie(destination=pal1, source=pal15(mid1 39))                                                ⟨211351⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨211363⟩
c50 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨211370⟩
ajoute c50 à scène6                                                                                   ⟨211376⟩
c51 = JitterImageLayer(ressource=mid1 6, x=1, y=-40, image=3)                                         ⟨211384⟩
c52 = ImageLayer(ressource=mid1 26, x=-7, y=0, image=0)                                               ⟨211393⟩
c53 = ImageLayer(ressource=mid1 26, x=7, y=0, image=1)                                                ⟨211402⟩
ajoute c52 à c51                                                                                      ⟨211407⟩
ajoute c53 à c51                                                                                      ⟨211411⟩
ajoute c51 à scène6                                                                                   ⟨211416⟩
c54 = OverlayImageLayer(ressource=mid1 0, x=0, y=14, image=0)                                         ⟨211424⟩
ajoute c54 à c51                                                                                      ⟨211429⟩
si v29 != 0 :
    charge(mid1voc 0)                                                                                 ⟨211447⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 0)                                  ⟨211453⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨211458⟩
    tant que voix_finie (sub_84CC, non lue)(voix=voix1) == 0 :
        Scene_Tick(scène=scène6)                                                                      ⟨211466⟩
        c54.image = scène6.compteur & 1                                                               ⟨211472⟩
    si v29 != 0 :
        voix_arrête(voix=voix1)                                                                       ⟨211486⟩
sinon :
    police_couleur (sub_3139A, non lue)(police=police1, couleur=4)                                    ⟨211516⟩
    sous_titre (sub_C8F5, non lue)(zone=zone3, texte=textes1[0])                                      ⟨211521⟩
    tant que (scène6.compteur < 30) et (scène6.terminée == 0) :
        Scene_Tick(scène=scène6)                                                                      ⟨211529⟩
        c54.image = scène6.compteur & 1                                                               ⟨211534⟩
c54.image = 0                                                                                         ⟨211556⟩
scène6.compteur = 0                                                                                   ⟨211557⟩
tant que (scène6.compteur < 5) et (scène6.terminée == 0) :
    Scene_Tick(scène=scène6)                                                                          ⟨211564⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨211592⟩
si byte_495FC != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨211860⟩
    voix_arrête(voix=voix1)                                                                           ⟨211884⟩
    canal_arrête(canal=canal2)                                                                        ⟨211907⟩
    CRT_Doprnt_Core(objets1, 10, 6, 1, Stub_ResourceHandle_Destruct_42090)                            ⟨211954⟩
    v64 = 0                                                                                           ⟨212116⟩
    v59 = 0                                                                                           ⟨212117⟩
    v58 = 0                                                                                           ⟨212118⟩
    retour                                                                                            ⟨212194⟩
appel de Midgame1_PlayPart2_671C0 (voir plus bas)                                                     ⟨212274⟩
canal_arrête(canal=canal3)                                                                            ⟨212536⟩
voix_arrête(voix=voix1)                                                                               ⟨212560⟩
canal_arrête(canal=canal2)                                                                            ⟨212583⟩
CRT_Doprnt_Core(objets1, 10, 6, 1, Stub_ResourceHandle_Destruct_42090)                                ⟨212630⟩
v64 = 0                                                                                               ⟨212792⟩
v59 = 0                                                                                               ⟨212793⟩
v58 = 0                                                                                               ⟨212794⟩
retour                                                                                                ⟨212870⟩
```

## Midgame1_PlayPart2_671C0

```
bp = sp                                                                                               ⟨213062⟩
v2 = byte_46848                                                                                       ⟨213067⟩
charge(mid1 43)                                                                                       ⟨213085⟩
palette_depuis(pal16(mid1 43))                                                                        ⟨213092⟩

──── scène7 ────
scène7 = Scene_Create(cadence=10, palette=255, surface=surface1)                                      ⟨213099⟩
v80 = objet39.+0                                                                                      ⟨213103⟩
v78 = objet39.+2                                                                                      ⟨213105⟩
v76 = objet39.+4                                                                                      ⟨213107⟩
v74 = objet39.+6                                                                                      ⟨213109⟩
v82 = word_46F46                                                                                      ⟨213111⟩
zone_texte(zone=zone4, police=police1)                                                                ⟨213118⟩
v86 = v78                                                                                             ⟨213122⟩
v88 = v76                                                                                             ⟨213124⟩
v90 = v74                                                                                             ⟨213126⟩
v319 = v80                                                                                            ⟨213128⟩
v317 = v86                                                                                            ⟨213130⟩
v315 = v88                                                                                            ⟨213132⟩
v313 = v90                                                                                            ⟨213134⟩
charge_convdata_type0("pri", drapeau=3)                                                               ⟨213143⟩
palette_copie(destination=pal1, source=pal16(mid1 43))                                                ⟨213151⟩
palette_copie(destination=pal1, source=pal6(convdata type 2 "normal"))                                ⟨213162⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨213175⟩
c55 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨213181⟩
ajoute c55 à scène7                                                                                   ⟨213187⟩
c56 = ImageLayer(ressource=mid1 6, x=0, y=0, image=1)                                                 ⟨213194⟩
ajoute c56 à scène7                                                                                   ⟨213200⟩
c57 = TalkingHeadOverlay(ressource=convdata type 0 "pri", x=160, y=128)                               ⟨213207⟩
c58 = ImageLayer(ressource=convdata type 0 "pri", x=160, y=127, image=39)                             ⟨213216⟩
tête_image_de_base(tête=c57, image=31)                                                                ⟨213221⟩
ajoute c57 à scène7                                                                                   ⟨213226⟩
ajoute c58 à scène7                                                                                   ⟨213231⟩
si v29 != 0 :
    charge(mid1voc 4)                                                                                 ⟨213248⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 4)                                  ⟨213253⟩
    voix1.joue(-1)                                                                                    ⟨213259⟩
    tête_texte_de_lèvres(tête=c57, texte="Back off, almost got tone. Blah blah blah")                 ⟨213263⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène7)                                                                      ⟨213271⟩
    voix_arrête(voix=voix1)                                                                           ⟨213284⟩
sinon :
    police1.couleur(224)                                                                              ⟨213313⟩
    sous_titre (sub_C8F5, non lue)(zone=zone4, texte=textes1[1])                                      ⟨213322⟩
    tête_texte_de_lèvres(tête=c57, texte="Back off, almost got tone. Blah blah blah")                 ⟨213326⟩
    tant que (scène7.compteur < 30) et (scène7.terminée == 0) :
        Scene_Tick(scène=scène7)                                                                      ⟨213334⟩
Scene_Destruct(scène=scène7, drapeaux=0)                                                              ⟨213383⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨213414⟩
si v29 != 0 :
    charge(mid1voc 10)                                                                                ⟨213429⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 10)                                 ⟨213434⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨213443⟩
        canal_enregistre(canal=canal3, ressource=objets1 + 30, x=0)                                   ⟨213450⟩

──── scène8 ────
scène8 = Scene_Create(cadence=20, palette=255, surface=surface1)                                      ⟨213460⟩
charge(mid1 54)                                                                                       ⟨213471⟩
palette_depuis(pal17(mid1 54))                                                                        ⟨213478⟩
palette_copie(destination=pal1, source=pal17(mid1 54))                                                ⟨213486⟩
palette_copie(destination=pal1, source=pal8(mid1 42))                                                 ⟨213497⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨213510⟩
c59 = Layer(ressource=optshps 116, x=0, y=-24)                                                        ⟨213516⟩
ajoute c59 à scène8                                                                                   ⟨213522⟩
charge(mid1 20)                                                                                       ⟨213533⟩
c60 = LoopAnimLayer(ressource=mid1 20, x=0, y=-40)                                                    ⟨213546⟩
c60.mode = 0                                                                                          ⟨213553⟩
ajoute c60 à scène8                                                                                   ⟨213566⟩
c61 = Layer(ressource=mid1 6, x=0, y=-24)                                                             ⟨213572⟩
ajoute c61 à scène8                                                                                   ⟨213578⟩
c62 = Layer(ressource=mid1 11, x=159, y=40)                                                           ⟨213584⟩
ajoute c62 à scène8                                                                                   ⟨213590⟩
c63 = Layer(ressource=mid1 12, x=99, y=108)                                                           ⟨213596⟩
ajoute c63 à scène8                                                                                   ⟨213602⟩
c64 = ImageLayer(ressource=mid1 12, x=195, y=107, image=3)                                            ⟨213609⟩
ajoute c64 à scène8                                                                                   ⟨213615⟩
c65 = ImageLayer(ressource=mid1 11, x=135, y=22, image=7)                                             ⟨213622⟩
ajoute c65 à scène8                                                                                   ⟨213628⟩
c66 = ImageLayer(ressource=mid1 11, x=185, y=22, image=16)                                            ⟨213635⟩
ajoute c66 à scène8                                                                                   ⟨213641⟩
c67 = ImageLayer(ressource=mid1 11, x=160, y=38, image=21)                                            ⟨213648⟩
ajoute c67 à scène8                                                                                   ⟨213654⟩
c68 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=22)                              ⟨213661⟩
c68.découpe_gauche = 131                                                                              ⟨213665⟩
c68.découpe_haut = 9                                                                                  ⟨213667⟩
c68.découpe_droite = 190                                                                              ⟨213669⟩
c68.découpe_bas = 67                                                                                  ⟨213671⟩
ajoute c68 à scène8                                                                                   ⟨213675⟩
c69 = ClippedMovingImageLayer(ressource=mid1 11, x=169, y=109, image=23)                              ⟨213682⟩
c69.découpe_gauche = 131                                                                              ⟨213686⟩
c69.découpe_haut = 9                                                                                  ⟨213688⟩
c69.découpe_droite = 190                                                                              ⟨213690⟩
c69.découpe_bas = 67                                                                                  ⟨213692⟩
ajoute c69 à scène8                                                                                   ⟨213696⟩
c70 = ImageLayer(ressource=mid1 11, x=159, y=40, image=24)                                            ⟨213703⟩
ajoute c70 à scène8                                                                                   ⟨213709⟩
c71 = ImageLayer(ressource=mid1 11, x=138, y=17, image=26)                                            ⟨213716⟩
ajoute c71 à scène8                                                                                   ⟨213722⟩
c72 = ImageLayer(ressource=mid1 11, x=140, y=63, image=27)                                            ⟨213729⟩
ajoute c72 à scène8                                                                                   ⟨213735⟩
c73 = ImageLayer(ressource=mid1 11, x=178, y=63, image=28)                                            ⟨213742⟩
ajoute c73 à scène8                                                                                   ⟨213748⟩
palette_envoie(palette=pal8(mid1 42), pas=0)                                                          ⟨213761⟩
v144 = 16                                                                                             ⟨213763⟩
v146 = 7                                                                                              ⟨213764⟩
T3 = tableau de 164 octets copié depuis unk_44DF6                                                     ⟨213771⟩
T4 = tableau de 82 octets copié depuis ds:7806                                                        ⟨213779⟩
si v29 != 0 :
    voix1.joue(-1)                                                                                    ⟨213786⟩
si v31 != 0 :
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=canal3.+2)                                    ⟨213800⟩
tant que (scène8.compteur < 40) et (scène8.terminée == 0) :
    si scène8.compteur & 1 != 0 :
        v144 = v144 + 1                                                                               ⟨213812⟩
        si v144 == 21 :
            v144 = 16                                                                                 ⟨213816⟩
        v152 = v144                                                                                   ⟨213820⟩
        c66.image = v152                                                                              ⟨213823⟩
        v146 = v146 + 1                                                                               ⟨213824⟩
        si v146 == 16 :
            v146 = 7                                                                                  ⟨213828⟩
        v154 = v146                                                                                   ⟨213832⟩
        c65.image = v154                                                                              ⟨213835⟩
    v156 = T3.mot[scène8.compteur·2] + dword_44E9A                                                    ⟨213844⟩
    v158 = T3.mot[(scène8.compteur·2) + 1] + dword_44E9A+2                                            ⟨213851⟩
    c68.x = v156                                                                                      ⟨213854⟩
    c68.y = v158                                                                                      ⟨213857⟩
    si scène8.compteur < 8 :
        si word_44EF0 >= 185 ou word_44EF0 <= 136 :
            word_44EF4 = -word_44EF4                                                                  ⟨213869⟩
        si word_44EF2 >= 62 ou word_44EF2 <= 14 :
            word_44EF6 = -word_44EF6                                                                  ⟨213881⟩
    sinon :
        word_44EF4 = (T3.mot[scène8.compteur·2] + dword_44E9A) - word_44EF0                           ⟨213895⟩
        word_44EF6 = (T3.mot[(scène8.compteur·2) + 1] + dword_44E9A+2) - word_44EF2                   ⟨213903⟩
        si scène8.compteur < 18 :
            word_44EF4 = word_44EF4 / 2                                                               ⟨213910⟩
            word_44EF6 = word_44EF6 / 2                                                               ⟨213915⟩
        sinon :
            si scène8.compteur & 1 != 0 :
                c69.image = 23                                                                        ⟨213923⟩
                c68.image = 22                                                                        ⟨213925⟩
                c67.image = 21                                                                        ⟨213927⟩
            sinon :
                c69.image = 25                                                                        ⟨213933⟩
                c68.image = 25                                                                        ⟨213935⟩
                c67.image = 25                                                                        ⟨213937⟩
    word_44EF0 = word_44EF0 + word_44EF4                                                              ⟨213942⟩
    word_44EF2 = word_44EF2 + word_44EF6                                                              ⟨213944⟩
    c69.x = word_44EF0                                                                                ⟨213948⟩
    c69.y = word_44EF2                                                                                ⟨213950⟩
    v160 = T4.mot[scène8.compteur]                                                                    ⟨213956⟩
    c62.image = v160                                                                                  ⟨213959⟩
    si T4.mot[scène8.compteur] > 3 :
        c63.image = 1                                                                                 ⟨213967⟩
    sinon :
        si T4.mot[scène8.compteur] != 0 :
            c63.image = 2                                                                             ⟨213979⟩
        sinon :
            c63.image = 0                                                                             ⟨213985⟩
    word_44EFA = word_44EFA + word_44EF8                                                              ⟨213990⟩
    si word_44EFA >= 5 ou word_44EFA <= 3 :
        word_44EF8 = -word_44EF8                                                                      ⟨214000⟩
    v162 = word_44EFA                                                                                 ⟨214004⟩
    c64.image = v162                                                                                  ⟨214007⟩
    Scene_Tick(scène=scène8)                                                                          ⟨214010⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨214038⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨214045⟩
Scene_Destruct(scène=scène8, drapeaux=0)                                                              ⟨214095⟩

──── scène9 ────
scène9 = Scene_Create(cadence=15, palette=255, surface=surface1)                                      ⟨214121⟩
charge(mid1 24)                                                                                       ⟨214132⟩
c74 = AnimLayer(ressource=mid1 24, x=0, y=0)                                                          ⟨214139⟩
ajoute c74 à scène9                                                                                   ⟨214145⟩
charge(mid1 58)                                                                                       ⟨214156⟩
palette_depuis(pal17(mid1 58))                                                                        ⟨214163⟩
palette_copie(destination=pal1, source=pal17(mid1 58))                                                ⟨214171⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨214184⟩
tant que animation_finie(calque=c74) == 0 :
    Scene_Tick(scène=scène9)                                                                          ⟨214192⟩
Scene_Destruct(scène=scène9, drapeaux=0)                                                              ⟨214248⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨214279⟩
si v29 != 0 :
    charge(mid1voc 11)                                                                                ⟨214294⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 11)                                 ⟨214299⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨214308⟩
        canal_enregistre(canal=canal3, ressource=objets1 + 40, x=0)                                   ⟨214315⟩

──── scène10 ────
scène10 = Scene_Create(cadence=20, palette=255, surface=surface1)                                     ⟨214325⟩
charge(mid1 49)                                                                                       ⟨214336⟩
palette_depuis(pal17(mid1 49))                                                                        ⟨214343⟩
palette_copie(destination=pal1, source=pal2(optpals 21))                                              ⟨214351⟩
palette_copie(destination=pal1, source=pal4(midgames 22))                                             ⟨214362⟩
palette_copie(destination=pal1, source=pal17(mid1 49))                                                ⟨214370⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨214383⟩
c75 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨214389⟩
ajoute c75 à scène10                                                                                  ⟨214395⟩
charge(mid1 16)                                                                                       ⟨214406⟩
charge(mid1 18)                                                                                       ⟨214417⟩
c76 = AnimLayer(ressource=mid1 16, x=0, y=0)                                                          ⟨214424⟩
c77 = AnimLayer(ressource=mid1 18, x=0, y=0)                                                          ⟨214432⟩
ajoute c76 à scène10                                                                                  ⟨214438⟩
tant que (scène10.compteur < 41) et (scène10.terminée == 0) :
    si scène10.compteur == 20 :
        retire(parent=scène10, calque=c76)                                                            ⟨214449⟩
        c76.détruit(3)                                                                                ⟨214456⟩
        ajoute c77 à scène10                                                                          ⟨214464⟩
    si scène10.compteur == 15 :
        si v29 != 0 :
            voix1.joue(-1)                                                                            ⟨214476⟩
        sinon :
            si v31 != 0 :
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=canal3.+2)                        ⟨214492⟩
    Scene_Tick(scène=scène10)                                                                         ⟨214500⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨214528⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨214535⟩
Scene_Destruct(scène=scène10, drapeaux=0)                                                             ⟨214604⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨214654⟩
si v29 != 0 :
    charge(mid1voc 12)                                                                                ⟨214669⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 12)                                 ⟨214674⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨214683⟩
        canal_enregistre(canal=canal3, ressource=objets1 + 50, x=0)                                   ⟨214690⟩

──── scène11 ────
scène11 = Scene_Create(cadence=20, palette=255, surface=surface1)                                     ⟨214700⟩
c78 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨214706⟩
ajoute c78 à scène11                                                                                  ⟨214712⟩
charge(mid1 15)                                                                                       ⟨214723⟩
c79 = AnimLayer(ressource=mid1 15, x=0, y=0)                                                          ⟨214730⟩
ajoute c79 à scène11                                                                                  ⟨214736⟩
tant que animation_finie(calque=c79) == 0 :
    si scène11.compteur == 22 :
        si v29 != 0 :
            voix1.joue(-1)                                                                            ⟨214750⟩
        sinon :
            si v31 != 0 :
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=canal3.+2)                        ⟨214766⟩
    Scene_Tick(scène=scène11)                                                                         ⟨214774⟩
Scene_Destruct(scène=scène11, drapeaux=0)                                                             ⟨214806⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨214860⟩

──── scène12 ────
scène12 = Scene_Create(cadence=20, palette=255, surface=surface1)                                     ⟨214869⟩
charge(mid1 51)                                                                                       ⟨214880⟩
palette_depuis(pal17(mid1 51))                                                                        ⟨214887⟩
charge(mid1 7)                                                                                        ⟨214898⟩
charge(midgames 21)                                                                                   ⟨214909⟩
c80 = MovingLayer(ressource=optshps 116, x=0, y=-40)                                                  ⟨214923⟩
c80.vx = 0                                                                                            ⟨214930⟩
c80.vy = 0                                                                                            ⟨214932⟩
c80.vx = 1                                                                                            ⟨214934⟩
c80.vy = 0                                                                                            ⟨214936⟩
ajoute c80 à scène12                                                                                  ⟨214949⟩
c81 = MovingLayer(ressource=optshps 116, x=-320, y=-40)                                               ⟨214963⟩
c81.vx = 0                                                                                            ⟨214970⟩
c81.vy = 0                                                                                            ⟨214972⟩
c81.vx = 1                                                                                            ⟨214974⟩
c81.vy = 0                                                                                            ⟨214976⟩
ajoute c81 à scène12                                                                                  ⟨214989⟩
c82 = MovingLayer(ressource=midgames 21, x=0, y=-40)                                                  ⟨215002⟩
c82.vx = 0                                                                                            ⟨215009⟩
c82.vy = 0                                                                                            ⟨215011⟩
c82.vx = 1                                                                                            ⟨215013⟩
c82.vy = 0                                                                                            ⟨215015⟩
ajoute c82 à scène12                                                                                  ⟨215028⟩
c83 = MovingLayer(ressource=midgames 21, x=-320, y=-40)                                               ⟨215041⟩
c83.vx = 0                                                                                            ⟨215048⟩
c83.vy = 0                                                                                            ⟨215050⟩
c83.vx = 1                                                                                            ⟨215052⟩
c83.vy = 0                                                                                            ⟨215054⟩
ajoute c83 à scène12                                                                                  ⟨215067⟩
c84 = MovingLayer(ressource=mid1 7, x=0, y=40)                                                        ⟨215080⟩
c84.vx = 0                                                                                            ⟨215087⟩
c84.vy = 0                                                                                            ⟨215089⟩
c84.vx = 2                                                                                            ⟨215091⟩
c84.vy = 0                                                                                            ⟨215093⟩
ajoute c84 à scène12                                                                                  ⟨215106⟩
c85 = MovingLayer(ressource=mid1 7, x=-320, y=40)                                                     ⟨215119⟩
c85.vx = 0                                                                                            ⟨215126⟩
c85.vy = 0                                                                                            ⟨215128⟩
c85.vx = 2                                                                                            ⟨215130⟩
c85.vy = 0                                                                                            ⟨215132⟩
ajoute c85 à scène12                                                                                  ⟨215145⟩
charge(mid1 21)                                                                                       ⟨215156⟩
charge(mid1 29)                                                                                       ⟨215167⟩
charge(mid1 35)                                                                                       ⟨215178⟩
c86 = AnimLayer(ressource=mid1 21, x=0, y=0)                                                          ⟨215185⟩
c87 = AnimLayer(ressource=mid1 29, x=0, y=0)                                                          ⟨215193⟩
c88 = AnimLayer(ressource=mid1 35, x=0, y=0)                                                          ⟨215201⟩
ajoute c86 à scène12                                                                                  ⟨215207⟩
tant que (scène12.compteur < 41) et (scène12.terminée == 0) :
    v180 = scène12.compteur                                                                           ⟨215214⟩
    si v180 == 14 :
        retire(parent=scène12, calque=c86)                                                            ⟨215220⟩
        c86.détruit(3)                                                                                ⟨215227⟩
        ajoute c87 à scène12                                                                          ⟨215235⟩
    si v180 == 27 :
        retire(parent=scène12, calque=c87)                                                            ⟨215244⟩
        c87.détruit(3)                                                                                ⟨215251⟩
        ajoute c88 à scène12                                                                          ⟨215259⟩
    Scene_Tick(scène=scène12)                                                                         ⟨215265⟩
Scene_Destruct(scène=scène12, drapeaux=0)                                                             ⟨215412⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨215417⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨215424⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨215476⟩

──── scène13 ────
scène13 = Scene_Create(cadence=20, palette=255, surface=surface1)                                     ⟨215485⟩
si v29 != 0 :
    charge(mid1voc 13)                                                                                ⟨215498⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 13)                                 ⟨215503⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨215512⟩
        canal_enregistre(canal=canal3, ressource=objets1 + 50, x=0)                                   ⟨215519⟩
c89 = Layer(ressource=optshps 116, x=0, y=-10)                                                        ⟨215528⟩
c90 = Layer(ressource=midgames 20, x=0, y=0)                                                          ⟨215535⟩
ajoute c90 à c89                                                                                      ⟨215540⟩
ajoute c89 à scène13                                                                                  ⟨215545⟩
charge(mid1 17)                                                                                       ⟨215556⟩
charge(mid1 30)                                                                                       ⟨215567⟩
charge(mid1 31)                                                                                       ⟨215578⟩
charge(mid1 32)                                                                                       ⟨215589⟩
c91 = AnimLayer(ressource=mid1 17, x=0, y=0)                                                          ⟨215596⟩
c92 = AnimLayer(ressource=mid1 30, x=0, y=0)                                                          ⟨215604⟩
c93 = AnimLayer(ressource=mid1 31, x=0, y=0)                                                          ⟨215612⟩
c94 = AnimLayer(ressource=mid1 32, x=0, y=0)                                                          ⟨215620⟩
ajoute c91 à scène13                                                                                  ⟨215626⟩
ajoute c92 à c91                                                                                      ⟨215630⟩
c95 = ImageLayer(ressource=midgames 19, x=0, y=85, image=1)                                           ⟨215637⟩
ajoute c95 à scène13                                                                                  ⟨215643⟩
c96 = ImageLayer(ressource=midgames 19, x=0, y=55, image=2)                                           ⟨215650⟩
ajoute c96 à scène13                                                                                  ⟨215656⟩
tant que (scène13.compteur < 81) et (scène13.terminée == 0) :
    v136 = scène13.compteur                                                                           ⟨215663⟩
    si v136 == 50 :
        retire(parent=c91, calque=c92)                                                                ⟨215668⟩
        c92.détruit(3)                                                                                ⟨215675⟩
        ajoute c93 à c91                                                                              ⟨215682⟩
    si v136 == 65 :
        retire(parent=c91, calque=c93)                                                                ⟨215690⟩
        c93.détruit(3)                                                                                ⟨215697⟩
        ajoute c94 à c91                                                                              ⟨215704⟩
    si v136 == 48 :
        si v29 != 0 :
            voix1.joue(-1)                                                                            ⟨215716⟩
        sinon :
            si v31 != 0 :
                si canal3.+0 != 0 :
                    AIL_start_sequence(pilote=canal3.+0→4, séquence=canal3.+2)                        ⟨215732⟩
    Scene_Tick(scène=scène13)                                                                         ⟨215740⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨215768⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨215775⟩
Scene_Destruct(scène=scène13, drapeaux=0)                                                             ⟨215877⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨215908⟩

──── scène14 ────
scène14 = Scene_Create(cadence=10, palette=255, surface=surface1)                                     ⟨215921⟩
v80 = objet39.+0                                                                                      ⟨215925⟩
v78 = objet39.+2                                                                                      ⟨215927⟩
v76 = objet39.+4                                                                                      ⟨215929⟩
v74 = objet39.+6                                                                                      ⟨215931⟩
zone_texte(zone=zone4, police=police1)                                                                ⟨215940⟩
v86 = v78                                                                                             ⟨215944⟩
v88 = v76                                                                                             ⟨215946⟩
v90 = v74                                                                                             ⟨215948⟩
v319 = v80                                                                                            ⟨215950⟩
v317 = v86                                                                                            ⟨215952⟩
v315 = v88                                                                                            ⟨215954⟩
v313 = v90                                                                                            ⟨215956⟩
palette_copie(destination=pal1, source=pal14(mid1 45))                                                ⟨215963⟩
palette_copie(destination=pal1, source=pal15(mid1 39))                                                ⟨215974⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨215987⟩
c97 = Layer(ressource=optshps 116, x=0, y=0)                                                          ⟨215993⟩
ajoute c97 à scène14                                                                                  ⟨215999⟩
c98 = JitterImageLayer(ressource=mid1 6, x=1, y=-35, image=3)                                         ⟨216006⟩
c99 = ImageLayer(ressource=mid1 26, x=-7, y=0, image=0)                                               ⟨216014⟩
c100 = ImageLayer(ressource=mid1 26, x=7, y=0, image=1)                                               ⟨216022⟩
ajoute c99 à c98                                                                                      ⟨216027⟩
ajoute c100 à c98                                                                                     ⟨216031⟩
ajoute c98 à scène14                                                                                  ⟨216036⟩
c101 = OverlayAnimLayer(ressource=mid1 0, x=0, y=14)                                                  ⟨216042⟩
ajoute c101 à c98                                                                                     ⟨216047⟩
si v29 != 0 :
    charge(mid1voc 1)                                                                                 ⟨216064⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 1)                                  ⟨216069⟩
    voix1.joue(-1)                                                                                    ⟨216075⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène14)                                                                     ⟨216083⟩
    voix_arrête(voix=voix1)                                                                           ⟨216096⟩
sinon :
    police1.couleur(4)                                                                                ⟨216125⟩
    sous_titre (sub_C8F5, non lue)(zone=zone4, texte=textes1[2])                                      ⟨216136⟩
    tant que (scène14.compteur < 20) et (scène14.terminée == 0) :
        Scene_Tick(scène=scène14)                                                                     ⟨216144⟩
scène14.compteur = 0                                                                                  ⟨216167⟩
tant que (scène14.compteur < 10) et (scène14.terminée == 0) :
    Scene_Tick(scène=scène14)                                                                         ⟨216174⟩
Scene_Destruct(scène=scène14, drapeaux=0)                                                             ⟨216202⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨216233⟩

──── scène15 ────
scène15 = Scene_Create(cadence=20, palette=255, surface=surface1)                                     ⟨216242⟩
palette_copie(destination=pal1, source=pal10(mid1 44))                                                ⟨216250⟩
palette_copie(destination=pal1, source=pal11(mid1 38))                                                ⟨216258⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨216271⟩
c102 = Layer(ressource=optshps 116, x=0, y=-24)                                                       ⟨216277⟩
ajoute c102 à scène15                                                                                 ⟨216283⟩
c103 = JitterImageLayer(ressource=mid1 6, x=0, y=-40, image=2)                                        ⟨216290⟩
c104 = ImageLayer(ressource=mid1 26, x=-5, y=0, image=2)                                              ⟨216298⟩
c105 = ImageLayer(ressource=mid1 26, x=6, y=0, image=3)                                               ⟨216306⟩
ajoute c104 à c103                                                                                    ⟨216311⟩
ajoute c105 à c103                                                                                    ⟨216315⟩
ajoute c103 à scène15                                                                                 ⟨216320⟩
c106 = OverlayImageLayer(ressource=mid1 1, x=0, y=24, image=3)                                        ⟨216327⟩
ajoute c106 à c103                                                                                    ⟨216332⟩
tant que (scène15.compteur < 20) et (scène15.terminée == 0) :
    Scene_Tick(scène=scène15)                                                                         ⟨216340⟩
Scene_Destruct(scène=scène15, drapeaux=0)                                                             ⟨216364⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨216395⟩

──── scène16 ────
scène16 = Scene_Create(cadence=10, palette=255, surface=surface1)                                     ⟨216404⟩
charge_convdata_type0("pri", drapeau=3)                                                               ⟨216414⟩
palette_copie(destination=pal1, source=pal16(mid1 43))                                                ⟨216422⟩
palette_copie(destination=pal1, source=pal6(convdata type 2 "normal"))                                ⟨216430⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨216443⟩
c107 = Layer(ressource=optshps 116, x=0, y=0)                                                         ⟨216449⟩
ajoute c107 à scène16                                                                                 ⟨216455⟩
c108 = ImageLayer(ressource=mid1 6, x=0, y=0, image=1)                                                ⟨216462⟩
ajoute c108 à scène16                                                                                 ⟨216468⟩
c109 = TalkingHeadOverlay(ressource=convdata type 0 "pri", x=160, y=128)                              ⟨216475⟩
ajoute c109 à scène16                                                                                 ⟨216481⟩
tête_image_de_base(tête=c109, image=27)                                                               ⟨216485⟩
charge(midgames 0)                                                                                    ⟨216496⟩
c110 = ToggleLayer(ressource=midgames 0, x=160, y=128, sens=1)                                        ⟨216504⟩
ajoute c110 à scène16                                                                                 ⟨216510⟩
tant que (scène16.compteur < 20) et (scène16.terminée == 0) :
    Scene_Tick(scène=scène16)                                                                         ⟨216518⟩
Scene_Destruct(scène=scène16, drapeaux=0)                                                             ⟨216580⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨216611⟩
charge(mid1 25)                                                                                       ⟨216624⟩

──── scène17 ────
scène17 = Scene_Create(cadence=10, palette=255, surface=surface1)                                     ⟨216631⟩
charge(mid1 47)                                                                                       ⟨216642⟩
palette_depuis(pal18(mid1 47))                                                                        ⟨216649⟩
palette_copie(destination=pal1, source=pal4(midgames 22))                                             ⟨216657⟩
palette_copie(destination=pal1, source=pal3(optpals 24))                                              ⟨216668⟩
palette_copie(destination=pal1, source=pal18(mid1 47))                                                ⟨216676⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨216689⟩
charge(mid1 10)                                                                                       ⟨216700⟩
c111 = Layer(ressource=optshps 116, x=0, y=-64)                                                       ⟨216706⟩
c112 = Layer(ressource=midgames 20, x=0, y=0)                                                         ⟨216713⟩
ajoute c112 à c111                                                                                    ⟨216718⟩
ajoute c111 à scène17                                                                                 ⟨216723⟩
c113 = Layer(ressource=optshps 44, x=0, y=0)                                                          ⟨216729⟩
ajoute c113 à scène17                                                                                 ⟨216735⟩
c114 = ImageLayer(ressource=midgames 19, x=0, y=90, image=1)                                          ⟨216742⟩
ajoute c114 à scène17                                                                                 ⟨216748⟩
c115 = ImageLayer(ressource=midgames 19, x=0, y=50, image=2)                                          ⟨216755⟩
ajoute c115 à scène17                                                                                 ⟨216761⟩
c116 = OverlayAnimLayer(ressource=mid1 10, x=0, y=10)                                                 ⟨216768⟩
ajoute c116 à scène17                                                                                 ⟨216774⟩
c116.image = 1                                                                                        ⟨216776⟩
tant que (scène17.compteur < 20) et (scène17.terminée == 0) :
    si scène17.compteur > 8 :
        c116.image = 9                                                                                ⟨216783⟩
    Scene_Tick(scène=scène17)                                                                         ⟨216788⟩
Scene_Destruct(scène=scène17, drapeaux=0)                                                             ⟨216855⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨216909⟩
charge(midgames 23)                                                                                   ⟨216922⟩
palette_depuis(pal19(midgames 23))                                                                    ⟨216929⟩
v80 = objet39.+0                                                                                      ⟨216933⟩
v78 = objet39.+2                                                                                      ⟨216935⟩
v76 = objet39.+4                                                                                      ⟨216937⟩
v74 = objet39.+6                                                                                      ⟨216939⟩
zone_texte(zone=zone5, police=police1)                                                                ⟨216948⟩
v86 = v78                                                                                             ⟨216952⟩
v90 = v74                                                                                             ⟨216956⟩
v285 = v80                                                                                            ⟨216958⟩
v283 = v86                                                                                            ⟨216960⟩
v281 = v76                                                                                            ⟨216962⟩
v279 = v90                                                                                            ⟨216964⟩

──── scène18 ────
scène18 = Scene_Create(cadence=20, palette=255, surface=surface1)                                     ⟨216970⟩
c117 = Layer(ressource=optshps 116, x=0, y=0)                                                         ⟨216976⟩
c118 = Layer(ressource=midgames 20, x=0, y=0)                                                         ⟨216983⟩
ajoute c118 à c117                                                                                    ⟨216988⟩
ajoute c117 à scène18                                                                                 ⟨216993⟩
charge(midgames 24)                                                                                   ⟨217004⟩
c119 = Layer(ressource=midgames 24, x=0, y=-20)                                                       ⟨217011⟩
ajoute c119 à scène18                                                                                 ⟨217017⟩
charge(mid1 2)                                                                                        ⟨217028⟩
c120 = OverlayImageLayer(ressource=mid1 2, x=0, y=-25, image=1)                                       ⟨217036⟩
ajoute c120 à scène18                                                                                 ⟨217042⟩
charge(mid1 19)                                                                                       ⟨217053⟩
c121 = AnimLayer(ressource=mid1 19, x=0, y=-40)                                                       ⟨217060⟩
ajoute c121 à scène18                                                                                 ⟨217066⟩
palette_copie(destination=pal1, source=pal19(midgames 23))                                            ⟨217074⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨217087⟩
tant que (scène18.compteur < 30) et (scène18.terminée == 0) :
    Scene_Tick(scène=scène18)                                                                         ⟨217095⟩
Scene_Destruct(scène=scène18, drapeaux=0)                                                             ⟨217176⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨217258⟩

──── scène19 ────
scène19 = Scene_Create(cadence=10, palette=255, surface=surface1)                                     ⟨217267⟩
v80 = objet39.+0                                                                                      ⟨217271⟩
v78 = objet39.+2                                                                                      ⟨217273⟩
v76 = objet39.+4                                                                                      ⟨217275⟩
v74 = objet39.+6                                                                                      ⟨217277⟩
zone_texte(zone=zone6, police=police1)                                                                ⟨217286⟩
v86 = v78                                                                                             ⟨217290⟩
v90 = v74                                                                                             ⟨217294⟩
v319 = v80                                                                                            ⟨217296⟩
v317 = v86                                                                                            ⟨217298⟩
v315 = v76                                                                                            ⟨217300⟩
v313 = v90                                                                                            ⟨217302⟩
palette_copie(destination=pal1, source=pal14(mid1 45))                                                ⟨217312⟩
palette_copie(destination=pal1, source=pal15(mid1 39))                                                ⟨217323⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨217336⟩
c122 = Layer(ressource=optshps 116, x=0, y=0)                                                         ⟨217342⟩
ajoute c122 à scène19                                                                                 ⟨217348⟩
c123 = JitterImageLayer(ressource=mid1 6, x=1, y=-40, image=3)                                        ⟨217355⟩
c124 = ImageLayer(ressource=mid1 26, x=-7, y=0, image=0)                                              ⟨217363⟩
c125 = ImageLayer(ressource=mid1 26, x=7, y=0, image=1)                                               ⟨217371⟩
ajoute c124 à c123                                                                                    ⟨217376⟩
ajoute c125 à c123                                                                                    ⟨217380⟩
ajoute c123 à scène19                                                                                 ⟨217385⟩
c126 = OverlayImageLayer(ressource=mid1 0, x=0, y=14, image=0)                                        ⟨217392⟩
ajoute c126 à c123                                                                                    ⟨217397⟩
c126.image = 13                                                                                       ⟨217399⟩
si v29 != 0 :
    charge(mid1voc 2)                                                                                 ⟨217415⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 2)                                  ⟨217420⟩
    voix1.joue(-1)                                                                                    ⟨217426⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène19)                                                                     ⟨217434⟩
        c126.image = (scène19.compteur & 1) + 13                                                      ⟨217441⟩
    voix_arrête(voix=voix1)                                                                           ⟨217453⟩
sinon :
    police1.couleur(4)                                                                                ⟨217482⟩
    sous_titre (sub_C8F5, non lue)(zone=zone6, texte=textes1[3])                                      ⟨217494⟩
    tant que (scène19.compteur < 30) et (scène19.terminée == 0) :
        Scene_Tick(scène=scène19)                                                                     ⟨217502⟩
        v104 = (scène19.compteur & 1) + 13                                                            ⟨217507⟩
        c126.image = v104                                                                             ⟨217509⟩
Scene_Destruct(scène=scène19, drapeaux=0)                                                             ⟨217538⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨217616⟩

──── scène20 ────
scène20 = Scene_Create(cadence=20, palette=255, surface=surface1)                                     ⟨217625⟩
v80 = objet39.+0                                                                                      ⟨217629⟩
v78 = objet39.+2                                                                                      ⟨217631⟩
v76 = objet39.+4                                                                                      ⟨217633⟩
v74 = objet39.+6                                                                                      ⟨217635⟩
zone_texte(zone=zone6, police=police1)                                                                ⟨217644⟩
v86 = v78                                                                                             ⟨217648⟩
v90 = v74                                                                                             ⟨217652⟩
v319 = v80                                                                                            ⟨217654⟩
v317 = v86                                                                                            ⟨217656⟩
v315 = v76                                                                                            ⟨217658⟩
v313 = v90                                                                                            ⟨217660⟩
palette_copie(destination=pal1, source=pal10(mid1 44))                                                ⟨217670⟩
palette_copie(destination=pal1, source=pal11(mid1 38))                                                ⟨217681⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨217694⟩
c127 = Layer(ressource=optshps 116, x=0, y=-24)                                                       ⟨217700⟩
ajoute c127 à scène20                                                                                 ⟨217706⟩
c128 = JitterImageLayer(ressource=mid1 6, x=0, y=-35, image=2)                                        ⟨217713⟩
c129 = ImageLayer(ressource=mid1 26, x=-5, y=0, image=2)                                              ⟨217721⟩
c130 = ImageLayer(ressource=mid1 26, x=6, y=0, image=3)                                               ⟨217729⟩
ajoute c129 à c128                                                                                    ⟨217734⟩
ajoute c130 à c128                                                                                    ⟨217738⟩
ajoute c128 à scène20                                                                                 ⟨217743⟩
c131 = OverlayImageLayer(ressource=mid1 1, x=0, y=24, image=3)                                        ⟨217750⟩
ajoute c131 à c128                                                                                    ⟨217755⟩
c131.image = 0                                                                                        ⟨217757⟩
tant que (scène20.compteur < 5) et (scène20.terminée == 0) :
    Scene_Tick(scène=scène20)                                                                         ⟨217764⟩
si v29 != 0 :
    charge(mid1voc 5)                                                                                 ⟨217800⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 5)                                  ⟨217805⟩
    voix1.joue(-1)                                                                                    ⟨217811⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène20)                                                                     ⟨217819⟩
        c131.image = scène20.compteur & 1                                                             ⟨217825⟩
    voix_arrête(voix=voix1)                                                                           ⟨217837⟩
sinon :
    police1.couleur(114)                                                                              ⟨217866⟩
    sous_titre (sub_C8F5, non lue)(zone=zone6, texte=textes1[4])                                      ⟨217877⟩
    tant que (scène20.compteur < 40) et (scène20.terminée == 0) :
        Scene_Tick(scène=scène20)                                                                     ⟨217885⟩
        v104 = scène20.compteur & 1                                                                   ⟨217889⟩
        c131.image = v104                                                                             ⟨217891⟩
Scene_Destruct(scène=scène20, drapeaux=0)                                                             ⟨217920⟩

──── scène21 ────
scène21 = Scene_Create(cadence=10, palette=255, surface=surface1)                                     ⟨217927⟩
v80 = objet39.+0                                                                                      ⟨217931⟩
v78 = objet39.+2                                                                                      ⟨217933⟩
v76 = objet39.+4                                                                                      ⟨217935⟩
v74 = objet39.+6                                                                                      ⟨217937⟩
zone_texte(zone=zone6, police=police1)                                                                ⟨217946⟩
v86 = v78                                                                                             ⟨217950⟩
v90 = v74                                                                                             ⟨217954⟩
v319 = v80                                                                                            ⟨217956⟩
v317 = v86                                                                                            ⟨217958⟩
v315 = v76                                                                                            ⟨217960⟩
v313 = v90                                                                                            ⟨217962⟩
palette_copie(destination=pal1, source=pal14(mid1 45))                                                ⟨217972⟩
palette_copie(destination=pal1, source=pal15(mid1 39))                                                ⟨217983⟩
v356 = 4540                                                                                           ⟨217989⟩
v356 = 4552                                                                                           ⟨217990⟩
v356 = 4568                                                                                           ⟨217991⟩
v356 = 4584                                                                                           ⟨217992⟩
v356 = 4604                                                                                           ⟨217993⟩
Primitive_SetRectColorAndDraw_2CBE5(&v356, v319, v317, v315, v313, 0, &v342)                          ⟨218003⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨218012⟩
c132 = Layer(ressource=optshps 116, x=0, y=0)                                                         ⟨218018⟩
ajoute c132 à scène21                                                                                 ⟨218024⟩
c133 = JitterImageLayer(ressource=mid1 6, x=1, y=-40, image=3)                                        ⟨218031⟩
c134 = ImageLayer(ressource=mid1 26, x=-7, y=0, image=0)                                              ⟨218039⟩
c135 = ImageLayer(ressource=mid1 26, x=7, y=0, image=1)                                               ⟨218047⟩
ajoute c134 à c133                                                                                    ⟨218052⟩
ajoute c135 à c133                                                                                    ⟨218056⟩
ajoute c133 à scène21                                                                                 ⟨218061⟩
c136 = OverlayImageLayer(ressource=mid1 0, x=0, y=14, image=0)                                        ⟨218068⟩
ajoute c136 à c133                                                                                    ⟨218073⟩
c136.image = 13                                                                                       ⟨218075⟩
si v29 != 0 :
    charge(mid1voc 3)                                                                                 ⟨218091⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 3)                                  ⟨218096⟩
    voix1.joue(-1)                                                                                    ⟨218102⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène21)                                                                     ⟨218110⟩
        c136.image = (scène21.compteur & 1) + 13                                                      ⟨218117⟩
    voix_arrête(voix=voix1)                                                                           ⟨218129⟩
sinon :
    police1.couleur(4)                                                                                ⟨218158⟩
    sous_titre (sub_C8F5, non lue)(zone=zone6, texte=textes1[5])                                      ⟨218170⟩
    tant que (scène21.compteur < 30) et (scène21.terminée == 0) :
        Scene_Tick(scène=scène21)                                                                     ⟨218178⟩
        v104 = (scène21.compteur & 1) + 13                                                            ⟨218183⟩
        c136.image = v104                                                                             ⟨218185⟩
c136.image = 13                                                                                       ⟨218207⟩
scène21.compteur = 0                                                                                  ⟨218208⟩
tant que (scène21.compteur < 5) et (scène21.terminée == 0) :
    Scene_Tick(scène=scène21)                                                                         ⟨218215⟩
Scene_Destruct(scène=scène21, drapeaux=0)                                                             ⟨218243⟩

──── scène22 ────
scène22 = Scene_Create(cadence=20, palette=255, surface=surface1)                                     ⟨218250⟩
v80 = objet39.+0                                                                                      ⟨218254⟩
v78 = objet39.+2                                                                                      ⟨218256⟩
v76 = objet39.+4                                                                                      ⟨218258⟩
v74 = objet39.+6                                                                                      ⟨218260⟩
zone_texte(zone=zone6, police=police1)                                                                ⟨218269⟩
v86 = v78                                                                                             ⟨218273⟩
v90 = v74                                                                                             ⟨218277⟩
v319 = v80                                                                                            ⟨218279⟩
v317 = v86                                                                                            ⟨218281⟩
v315 = v76                                                                                            ⟨218283⟩
v313 = v90                                                                                            ⟨218285⟩
palette_copie(destination=pal1, source=pal10(mid1 44))                                                ⟨218295⟩
palette_copie(destination=pal1, source=pal11(mid1 38))                                                ⟨218306⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨218319⟩
c137 = Layer(ressource=optshps 116, x=0, y=-24)                                                       ⟨218325⟩
ajoute c137 à scène22                                                                                 ⟨218331⟩
c138 = JitterImageLayer(ressource=mid1 6, x=0, y=-36, image=2)                                        ⟨218338⟩
c139 = ImageLayer(ressource=mid1 26, x=-5, y=0, image=2)                                              ⟨218346⟩
c140 = ImageLayer(ressource=mid1 26, x=6, y=0, image=3)                                               ⟨218354⟩
ajoute c139 à c138                                                                                    ⟨218359⟩
ajoute c140 à c138                                                                                    ⟨218363⟩
ajoute c138 à scène22                                                                                 ⟨218368⟩
c141 = OverlayImageLayer(ressource=mid1 1, x=0, y=24, image=3)                                        ⟨218375⟩
ajoute c141 à c138                                                                                    ⟨218380⟩
c141.image = 0                                                                                        ⟨218382⟩
tant que (scène22.compteur < 5) et (scène22.terminée == 0) :
    Scene_Tick(scène=scène22)                                                                         ⟨218389⟩
si v29 != 0 :
    charge(mid1voc 6)                                                                                 ⟨218425⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 6)                                  ⟨218430⟩
    voix1.joue(-1)                                                                                    ⟨218436⟩
    tant que voix1.finie() == 0 :
        Scene_Tick(scène=scène22)                                                                     ⟨218444⟩
        c141.image = scène22.compteur & 1                                                             ⟨218450⟩
    voix_arrête(voix=voix1)                                                                           ⟨218462⟩
sinon :
    police1.couleur(114)                                                                              ⟨218491⟩
    sous_titre (sub_C8F5, non lue)(zone=zone6, texte=textes1[6])                                      ⟨218503⟩
    tant que (scène22.compteur < 50) et (scène22.terminée == 0) :
        Scene_Tick(scène=scène22)                                                                     ⟨218511⟩
        v104 = scène22.compteur & 1                                                                   ⟨218515⟩
        c141.image = v104                                                                             ⟨218517⟩
Scene_Destruct(scène=scène22, drapeaux=0)                                                             ⟨218546⟩
si byte_495FC != 0 :
    retour                                                                                            ⟨218624⟩
v61 = 0                                                                                               ⟨218628⟩
si byte_46848 == 1 ou byte_46848 == 2 :
    v61 = 1                                                                                           ⟨218640⟩
si v29 != 0 :
    charge(mid1voc 13)                                                                                ⟨218655⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid1voc 13)                                 ⟨218660⟩
sinon :
    si v31 != 0 :
        canal_arrête(canal=canal3)                                                                    ⟨218669⟩
        canal_enregistre(canal=canal3, ressource=objets1 + 50, x=0)                                   ⟨218676⟩
charge(mid1 60)                                                                                       ⟨218690⟩
charge(mid1 46)                                                                                       ⟨218701⟩
palette_depuis(pal17(mid1 46))                                                                        ⟨218708⟩

──── scène23 ────
scène23 = Scene_Create(cadence=20, palette=255, surface=surface1)                                     ⟨218715⟩
palette_copie(destination=pal1, source=pal4(midgames 22))                                             ⟨218727⟩
palette_copie(destination=pal1, source=pal3(optpals 24))                                              ⟨218738⟩
palette_copie(destination=pal1, source=pal19(midgames 23))                                            ⟨218746⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨218759⟩
c142 = MovingLayer(ressource=optshps 116, x=0, y=0)                                                   ⟨218773⟩
c142.vx = 0                                                                                           ⟨218780⟩
c142.vy = 0                                                                                           ⟨218782⟩
c142.vx = 0                                                                                           ⟨218784⟩
c142.vy = 0                                                                                           ⟨218786⟩
c143 = Layer(ressource=midgames 20, x=0, y=0)                                                         ⟨218800⟩
ajoute c143 à c142                                                                                    ⟨218805⟩
ajoute c142 à scène23                                                                                 ⟨218810⟩
c144 = MovingLayer(ressource=optshps 44, x=0, y=0)                                                    ⟨218824⟩
c144.vx = 0                                                                                           ⟨218831⟩
c144.vy = 0                                                                                           ⟨218833⟩
c144.vx = 0                                                                                           ⟨218835⟩
c144.vy = 0                                                                                           ⟨218837⟩
ajoute c144 à c142                                                                                    ⟨218849⟩
c145 = MovingLayer(ressource=midgames 19, x=0, y=130, image=1)                                        ⟨218864⟩
c145.vx = 0                                                                                           ⟨218871⟩
c145.vy = 0                                                                                           ⟨218873⟩
c145.vx = 0                                                                                           ⟨218875⟩
c145.vy = 0                                                                                           ⟨218877⟩
ajoute c145 à c144                                                                                    ⟨218889⟩
c146 = MovingLayer(ressource=midgames 19, x=0, y=-4, image=2)                                         ⟨218904⟩
c146.vx = 0                                                                                           ⟨218911⟩
c146.vy = 0                                                                                           ⟨218913⟩
c146.vx = 0                                                                                           ⟨218915⟩
c146.vy = 0                                                                                           ⟨218917⟩
ajoute c146 à c145                                                                                    ⟨218929⟩
c147 = TriggeredAnimLayer(ressource=mid1 25, x=0, y=-79, image=0)                                     ⟨218937⟩
ajoute c147 à c146                                                                                    ⟨218942⟩
c147.lecture = 1                                                                                      ⟨218945⟩
charge(mid1 33)                                                                                       ⟨218955⟩
charge(mid1 34)                                                                                       ⟨218966⟩
c148 = AnimLayer(ressource=mid1 33, x=0, y=10)                                                        ⟨218973⟩
c149 = AnimLayer(ressource=mid1 34, x=0, y=10)                                                        ⟨218981⟩
c148.image = 0                                                                                        ⟨218985⟩
c149.image = 0                                                                                        ⟨218987⟩
ajoute c148 à c142                                                                                    ⟨218990⟩
tant que (scène23.compteur < 20) et (scène23.terminée == 0) :
    Scene_Tick(scène=scène23)                                                                         ⟨218998⟩
scène23.compteur = 0                                                                                  ⟨219019⟩
c145.vx = 0                                                                                           ⟨219021⟩
c145.vy = 1                                                                                           ⟨219023⟩
tant que scène23.y < -24 :
    si scène23.compteur == 10 :
        retire(parent=c142, calque=c148)                                                              ⟨219032⟩
        c148.détruit(3)                                                                               ⟨219040⟩
        ajoute c149 à c142                                                                            ⟨219047⟩
    Scene_Tick(scène=scène23)                                                                         ⟨219053⟩
    scène23.y = scène23.y + 1                                                                         ⟨219055⟩
c145.vx = 0                                                                                           ⟨219061⟩
c145.vy = 0                                                                                           ⟨219063⟩
tant que animation_finie(calque=c149) == 0 :
    Scene_Tick(scène=scène23)                                                                         ⟨219070⟩
retire(parent=c142, calque=c149)                                                                      ⟨219082⟩
c149.détruit(3)                                                                                       ⟨219090⟩
Scene_Tick(scène=scène23)                                                                             ⟨219097⟩
scène23.compteur = 0                                                                                  ⟨219099⟩
charge(mid1 9)                                                                                        ⟨219109⟩
charge(mid1 14)                                                                                       ⟨219120⟩
c150 = AnimLayer(ressource=mid1 9, x=0, y=0)                                                          ⟨219127⟩
c151 = AnimLayer(ressource=mid1 14, x=0, y=0)                                                         ⟨219135⟩
ajoute c150 à c142                                                                                    ⟨219140⟩
palette_copie(destination=pal1, source=pal17(mid1 46))                                                ⟨219148⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨219157⟩
si v61 != 0 :
    si canal2.+0 != 0 :
        AIL_stop_sequence(pilote=canal2.+0→4, séquence=canal2.+2)                                     ⟨219169⟩
si v29 != 0 :
    voix1.joue(-1)                                                                                    ⟨219181⟩
sinon :
    si v31 != 0 :
        si canal3.+0 != 0 :
            AIL_start_sequence(pilote=canal3.+0→4, séquence=canal3.+2)                                ⟨219197⟩
tant que (scène23.compteur < 31) et (scène23.terminée == 0) :
    si scène23.compteur == 20 :
        retire(parent=c142, calque=c150)                                                              ⟨219211⟩
        c150.détruit(3)                                                                               ⟨219219⟩
        ajoute c151 à c142                                                                            ⟨219226⟩
    Scene_Tick(scène=scène23)                                                                         ⟨219232⟩
si v61 != 0 :
    Speech_LoadBank_28D24(chemin2, 23)                                                                ⟨219296⟩
si byte_495FC == 0 :
    v192 = booléen                                                                                    ⟨219305⟩
    v192 = 120                                                                                        ⟨219307⟩
    attend(chronomètre=objet41)                                                                       ⟨219312⟩
surface1.gauche = 0                                                                                   ⟨219317⟩
surface1.haut = 0                                                                                     ⟨219319⟩
surface1.droite = 319                                                                                 ⟨219321⟩
surface1.bas = 199                                                                                    ⟨219323⟩
dessine_image(surface=surface2, x=0, y=0, données=données(optshps 116.+0), image=0)                   ⟨219340⟩
dessine_image(surface=surface2, x=0, y=0, données=données(midgames 20.+0), image=0)                   ⟨219358⟩
dessine_image(surface=surface2, x=0, y=0, données=données(optshps 44.+0), image=0)                    ⟨219376⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v324, surface2)                                                 ⟨219385⟩
v180 = word_46F46                                                                                     ⟨219388⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v338, v180)                                                     ⟨219394⟩
tant que si < 25 :
    v182 = 24 - si                                                                                    ⟨219403⟩
    v184 = (si·2) + 151                                                                               ⟨219407⟩
    v318 = v182                                                                                       ⟨219410⟩
    v314 = v184                                                                                       ⟨219413⟩
    v186 = 24 - si                                                                                    ⟨219416⟩
    v188 = (si·2) + 151                                                                               ⟨219420⟩
    v332 = v186                                                                                       ⟨219423⟩
    v328 = v188                                                                                       ⟨219426⟩
    UI_ApplyEncodingHelper_2EC65(&v338, &v324)                                                        ⟨219431⟩
Scene_Destruct(scène=scène23, drapeaux=0)                                                             ⟨219525⟩
si v29 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨219573⟩
si v31 != 0 :
    canal_arrête(canal=canal3)                                                                        ⟨219580⟩
retour                                                                                                ⟨219673⟩
```

## Tableaux du segment de données

- **T1** : 164 octets depuis `unk_44B02` ⟨207759⟩
  `169 109 172 106 176 102 178 100 180 97 183 95 185 93 186 91 187 89 186 87`
  `185 86 182 84 178 83 173 80 169 79 165 78 161 77 159 78 160 81 162 84`
  `165 90 167 92 171 97 173 101 175 106 174 107 169 108 161 106 152 104 141 101`
  `134 97 128 94 125 92 123 93 127 94 130 95 135 97 141 99 148 101 155 103`
  `162 106`
- **T2** : 82 octets depuis `ds:7050` ⟨207767⟩
  `0 0 4 4 5 5 5 6 6 6 6 5 5 4 4 0 0 1 1 1`
  `0 0 4 5 5 6 6 5 4 0 1 1 2 3 3 3 2 2 2 1`
  `1`
- **T3** : 164 octets depuis `unk_44DF6` ⟨213771⟩
  `169 109 172 106 176 102 178 100 180 97 183 95 185 93 186 91 187 89 186 87`
  `185 86 182 84 178 83 173 80 169 79 165 78 161 77 159 78 160 81 162 84`
  `165 90 167 92 171 97 173 101 175 106 174 107 169 108 161 106 152 104 141 101`
  `134 97 128 94 125 92 123 93 127 94 130 95 135 97 141 99 148 101 155 103`
  `162 106`
- **T4** : 82 octets depuis `ds:7806` ⟨213779⟩
  `0 0 1 1 2 2 2 3 3 3 3 2 2 1 1 0 0 4 4 4`
  `0 0 1 2 2 3 3 2 1 0 4 4 5 6 6 6 5 5 5 4`
  `4`
