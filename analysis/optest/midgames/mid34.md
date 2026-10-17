# Script extrait de `sub_AFB90` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## sub_AFB90

```
bp = sp                                                                                               ⟨318470⟩
tableau_textes(tableau=textes1, nombre=11, longueur=200)                                              ⟨318479⟩
byte_495FC = 0                                                                                        ⟨318481⟩
v9 = 0                                                                                                ⟨318482⟩
v10 = 0                                                                                               ⟨318483⟩
v11 = 0                                                                                               ⟨318484⟩
si word_4684B != 0 :
    v10 = 1                                                                                           ⟨318487⟩
v14 = word_46F46                                                                                      ⟨318491⟩
v412 = 0                                                                                              ⟨318492⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v412, v14)                                                      ⟨318497⟩
v426 = 0                                                                                              ⟨318499⟩
TextRenderer_ApplyFormatChange_2EA21(&v426, 0)                                                        ⟨318508⟩
SmallObject_RegisterInList_2CB40(&v18, &v426)                                                         ⟨318514⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨318520⟩
v28 = 0                                                                                               ⟨318526⟩
si v10 != 0 :
    si sub_6734(chemin1) == 0 : aller à loc_AFCE9                                                     ⟨318568⟩
    pak mid34voc.ouvre(chemin1, 1)                                                                    ⟨318575⟩
sinon :
    v10 = 0                                                                                           ⟨318582⟩
v38 = 0                                                                                               ⟨318585⟩
v33 = 0                                                                                               ⟨318587⟩
v32 = 0                                                                                               ⟨318588⟩
v40 = byte_46848                                                                                      ⟨318590⟩
si v40 != 1 :
    si v40 == 2 : aller à loc_AFE99                                                                   ⟨318600⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨318636⟩
        flux_iff(flux=flux1)                                                                          ⟨318650⟩
        v3015 = 256                                                                                   ⟨318653⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨318662⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨318668⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨318674⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨318678⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨318680⟩
        tant que di <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨318688⟩
            ds:24192[di·2] = iff_lit_mot(flux=flux1)                                                  ⟨318692⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨318700⟩
        v11 = 1                                                                                       ⟨318702⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨318706⟩
    si sub_6734(chemin1) != 0 :
        v9 = 1                                                                                        ⟨318732⟩
        si v11 == 0 :
            word_48F76 = 90                                                                           ⟨318737⟩
    aller à loc_B0004                                                                                 ⟨318741⟩
    loc_AFE99:                                                                                        ⟨318744⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨318772⟩
        flux_iff(flux=flux1)                                                                          ⟨318786⟩
        v3015 = 256                                                                                   ⟨318789⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨318798⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨318804⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨318810⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨318814⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨318816⟩
        tant que di <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨318824⟩
            ds:24192[di·2] = iff_lit_mot(flux=flux1)                                                  ⟨318828⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨318836⟩
        v11 = 1                                                                                       ⟨318838⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨318842⟩
    si sub_6734(chemin1) != 0 :
        v9 = 1                                                                                        ⟨318868⟩
        si v11 == 0 :
            word_48F76 = 255                                                                          ⟨318873⟩
loc_B0004:                                                                                            ⟨318879⟩
si v11 != 0 :
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨318896⟩
    charge(asoundfx 76)                                                                               ⟨318908⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 76, x=0)                                        ⟨318915⟩
    canal_arrête(canal=canal1)                                                                        ⟨318919⟩
    canal_arrête(canal=canal1)                                                                        ⟨318942⟩
v796 = 0                                                                                              ⟨318965⟩
v791 = 0                                                                                              ⟨318967⟩
v790 = 0                                                                                              ⟨318968⟩
v800 = 0                                                                                              ⟨318969⟩
si v9 != 0 :
    si v10 != 0 :
        v265 = 20                                                                                     ⟨318982⟩
    sinon :
        v265 = 19                                                                                     ⟨318987⟩
    charge(amusic v265)                                                                               ⟨318998⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨319003⟩
    canal_enregistre(canal=canal2, ressource=amusic v265, x=0)                                        ⟨319010⟩
v809 = booléen                                                                                        ⟨319027⟩
v805 = booléen                                                                                        ⟨319028⟩
si v10 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨319034⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨319052⟩
    v3015 = 256                                                                                       ⟨319055⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨319064⟩
    iff_form(flux=flux1, balise='MG34', x=0)                                                          ⟨319070⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨319076⟩
    tant que di < 11 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨319087⟩
        v266 = v2998                                                                                  ⟨319090⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·di), taille=v266)                    ⟨319101⟩
        v3011 = v2994                                                                                 ⟨319104⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨319112⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨319117⟩
charge(midgames 42)                                                                                   ⟨319136⟩
charge(midgames 44)                                                                                   ⟨319148⟩
charge_convdata_type2("normal")                                                                       ⟨319158⟩
palette_depuis(pal2(convdata type 2 "normal"))                                                        ⟨319165⟩
charge(midgames 37)                                                                                   ⟨319177⟩
palette_depuis(pal3(midgames 37))                                                                     ⟨319184⟩
charge(midgames 43)                                                                                   ⟨319196⟩
palette_depuis(pal4(midgames 43))                                                                     ⟨319203⟩
charge(midgames 45)                                                                                   ⟨319215⟩
palette_depuis(pal5(midgames 45))                                                                     ⟨319222⟩
charge(midgames 41)                                                                                   ⟨319234⟩
palette_depuis(pal6(midgames 41))                                                                     ⟨319241⟩
charge(midgames 29)                                                                                   ⟨319253⟩
charge(midgames 33)                                                                                   ⟨319265⟩
charge(midgames 34)                                                                                   ⟨319277⟩
charge(midgames 35)                                                                                   ⟨319289⟩
charge_convdata_type0("air", drapeau=3)                                                               ⟨319299⟩
charge_convdata_type0("lyle", drapeau=3)                                                              ⟨319309⟩
charge_convdata_type0("tex", drapeau=3)                                                               ⟨319319⟩
charge_convdata_type0("gwen", drapeau=3)                                                              ⟨319329⟩
charge_convdata_type0("miguel", drapeau=3)                                                            ⟨319339⟩
v240 = 0                                                                                              ⟨319341⟩
v236 = 2                                                                                              ⟨319342⟩
v235 = 0                                                                                              ⟨319343⟩
v234 = 0                                                                                              ⟨319344⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨319358⟩
v242 = ?                                                                                              ⟨319360⟩
v244 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                ⟨319361⟩
v240 = v244                                                                                           ⟨319363⟩
v236 = 2                                                                                              ⟨319364⟩
v235 = 1                                                                                              ⟨319365⟩
v234 = 0                                                                                              ⟨319366⟩
GlyphObject_ConstructWithBuffer_311CF(&v2910, &v240)                                                  ⟨319371⟩
v254 = word_46F46                                                                                     ⟨319378⟩
zone_texte(zone=zone1, police=&v2910)                                                                 ⟨319384⟩
v256 = 152                                                                                            ⟨319388⟩
v258 = 319                                                                                            ⟨319390⟩
v260 = 199                                                                                            ⟨319392⟩
v2917 = v256                                                                                          ⟨319396⟩
v2915 = v258                                                                                          ⟨319398⟩
v2913 = v260                                                                                          ⟨319400⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨319404⟩
Widget_Method_Dispatch8_314A9(zone1, 200)                                                             ⟨319409⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨319442⟩
    v235 = 0                                                                                          ⟨319443⟩
    v234 = 0                                                                                          ⟨319444⟩
    voix_arrête(voix=voix1)                                                                           ⟨319777⟩
    canal_arrête(canal=canal2)                                                                        ⟨319800⟩
    retour                                                                                            ⟨319881⟩
si v9 != 0 :
    v262 = word_48F76                                                                                 ⟨319888⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v798)                                         ⟨319895⟩
        sub_30C66(canal2.+0→4, v798, v262, 0)                                                         ⟨319902⟩

──── scène1 ────
scène1 = Scene_Create(cadence=6, palette=255, surface=&v412)                                          ⟨319914⟩
c1 = Layer(ressource=midgames 42, x=0, y=-80)                                                         ⟨319921⟩
c2 = Layer(ressource=midgames 33, x=0, y=0)                                                           ⟨319929⟩
c3 = Layer(ressource=midgames 34, x=0, y=0)                                                           ⟨319937⟩
c4 = Layer(ressource=midgames 35, x=0, y=0)                                                           ⟨319945⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨319955⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨319964⟩
ajoute c1 à scène1                                                                                    ⟨319969⟩
ajoute c2 à scène1                                                                                    ⟨319974⟩
ajoute c3 à scène1                                                                                    ⟨319979⟩
ajoute c4 à scène1                                                                                    ⟨319984⟩
fondu_disparition(palette=pal1, couleur=&v28, pas=0, premier=0, nombre=256)                           ⟨319997⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨320006⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨320015⟩
Scene_Tick(scène=scène1)                                                                              ⟨320019⟩
fondu_apparition(palette=pal1, couleur=&v28, pas=2, premier=0, nombre=256)                            ⟨320028⟩
si v10 != 0 :
    Scene_Tick(scène=scène1)                                                                          ⟨320038⟩
    charge(mid34voc 0)                                                                                ⟨320050⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 0)                                 ⟨320056⟩
    tant que di < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨320065⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨320075⟩
    tant que sub_8500(voix1) != 0 :
        Scene_Tick(scène=scène1)                                                                      ⟨320093⟩
    tant que di < 8 :
        Scene_Tick(scène=scène1)                                                                      ⟨320112⟩
    charge(mid34voc 1)                                                                                ⟨320129⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 1)                                 ⟨320135⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨320140⟩
    tant que sub_8500(voix1) != 0 :
        Scene_Tick(scène=scène1)                                                                      ⟨320158⟩
    tant que di < 4 :
        Scene_Tick(scène=scène1)                                                                      ⟨320177⟩
    voix_arrête(voix=voix1)                                                                           ⟨320186⟩
sinon :
    Widget_Method_DispatchC_314CB(zone1, 0)                                                           ⟨320233⟩
    Widget_Method_Dispatch8_314A9(zone1, 233)                                                         ⟨320238⟩
    v4 = 50                                                                                           ⟨320240⟩
    v2 = scène1.compteur + ((v4·70) / 100)                                                            ⟨320250⟩
    tant que (scène1.compteur < v2) et (scène1.terminée == 0) :
        si scène1.compteur + 3 == scène1.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[0])                              ⟨320263⟩
        si v2 - 1 == scène1.compteur :
            v2990 = 4540                                                                              ⟨320271⟩
            v2990 = 4552                                                                              ⟨320272⟩
            v2990 = 4568                                                                              ⟨320273⟩
            v2990 = 4584                                                                              ⟨320274⟩
            v2990 = 4604                                                                              ⟨320275⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨320285⟩
        Scene_Tick(scène=scène1)                                                                      ⟨320317⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène1, drapeaux=0)                                                      ⟨320353⟩
        v240 = 0                                                                                      ⟨320380⟩
        v235 = 0                                                                                      ⟨320381⟩
        v234 = 0                                                                                      ⟨320382⟩
        voix_arrête(voix=voix1)                                                                       ⟨320715⟩
        canal_arrête(canal=canal2)                                                                    ⟨320738⟩
        retour                                                                                        ⟨320819⟩
    v4 = 38                                                                                           ⟨320823⟩
    v2 = scène1.compteur + ((v4·70) / 100)                                                            ⟨320833⟩
    tant que (scène1.compteur < v2) et (scène1.terminée == 0) :
        si scène1.compteur + 1 == scène1.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[1])                              ⟨320848⟩
        si v2 - 1 == scène1.compteur :
            v2990 = 4540                                                                              ⟨320856⟩
            v2990 = 4552                                                                              ⟨320857⟩
            v2990 = 4568                                                                              ⟨320858⟩
            v2990 = 4584                                                                              ⟨320859⟩
            v2990 = 4604                                                                              ⟨320860⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨320870⟩
        Scene_Tick(scène=scène1)                                                                      ⟨320902⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨320932⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨320965⟩
    v235 = 0                                                                                          ⟨320966⟩
    v234 = 0                                                                                          ⟨320967⟩
    voix_arrête(voix=voix1)                                                                           ⟨321300⟩
    canal_arrête(canal=canal2)                                                                        ⟨321323⟩
    retour                                                                                            ⟨321404⟩

──── scène2 ────
scène2 = Scene_Create(cadence=9, palette=255, surface=&v412)                                          ⟨321414⟩
c5 = Layer(ressource=midgames 44, x=0, y=0)                                                           ⟨321421⟩
CRT_Rand()                                                                                            ⟨321425⟩
c6 = TalkingHead(ressource=convdata type 0 "air", x=((CRT_Rand()·5) / -32768) + 158, y=128)           ⟨321436⟩
tête_image_de_base(tête=c6, image=19)                                                                 ⟨321441⟩
ajoute c5 à scène2                                                                                    ⟨321446⟩
ajoute c6 à scène2                                                                                    ⟨321451⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨321460⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨321469⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨321481⟩
si v10 != 0 :
    Scene_Tick(scène=scène2)                                                                          ⟨321491⟩
    charge(mid34voc 2)                                                                                ⟨321503⟩
    sub_9CF7(c6, mid34voc 2, 9)                                                                       ⟨321509⟩
    tant que di < 3 :
        Scene_Tick(scène=scène2)                                                                      ⟨321518⟩
    tant que sub_9C64(c6) != 0 :
        si di == 5 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨321534⟩
        si di == 6 :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨321542⟩
        si di == 9 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨321550⟩
        si di == 10 :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨321560⟩
        Scene_Tick(scène=scène2)                                                                      ⟨321576⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨321615⟩
        v240 = 0                                                                                      ⟨321642⟩
        v235 = 0                                                                                      ⟨321643⟩
        v234 = 0                                                                                      ⟨321644⟩
        voix_arrête(voix=voix1)                                                                       ⟨321977⟩
        canal_arrête(canal=canal2)                                                                    ⟨322000⟩
        retour                                                                                        ⟨322081⟩
    charge(mid34voc 3)                                                                                ⟨322095⟩
    sub_9CF7(c6, mid34voc 3, 9)                                                                       ⟨322101⟩
    tant que di < 14 :
        Scene_Tick(scène=scène2)                                                                      ⟨322110⟩
    tant que sub_9C64(c6) != 0 :
        si di == 5 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322126⟩
        si di == 6 :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨322134⟩
        si di == 9 :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322142⟩
        si di == 10 :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨322152⟩
        Scene_Tick(scène=scène2)                                                                      ⟨322168⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨322186⟩
sinon :
    v2924→0.méthode8(224)                                                                             ⟨322239⟩
    v4 = 86                                                                                           ⟨322241⟩
    v2 = scène2.compteur + ((v4·70) / 100)                                                            ⟨322251⟩
    tant que (scène2.compteur < v2) et (scène2.terminée == 0) :
        si scène2.compteur + 3 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[2])                              ⟨322268⟩
        si scène2.compteur + 3 == scène2.compteur :
            tête_texte_de_lèvres(tête=c6, texte="lthoedptdthaclsinHwkJmstrnwsntavshusmn")             ⟨322278⟩
        si scène2.compteur + 15 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322288⟩
        si scène2.compteur + 16 == scène2.compteur :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨322298⟩
        si scène2.compteur + 19 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322308⟩
        si scène2.compteur + 20 == scène2.compteur :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨322318⟩
        si v2 - 1 == scène2.compteur :
            v2990 = 4540                                                                              ⟨322326⟩
            v2990 = 4552                                                                              ⟨322327⟩
            v2990 = 4568                                                                              ⟨322328⟩
            v2990 = 4584                                                                              ⟨322329⟩
            v2990 = 4604                                                                              ⟨322330⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨322340⟩
        Scene_Tick(scène=scène2)                                                                      ⟨322372⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène2, drapeaux=0)                                                      ⟨322408⟩
        v240 = 0                                                                                      ⟨322435⟩
        v235 = 0                                                                                      ⟨322436⟩
        v234 = 0                                                                                      ⟨322437⟩
        voix_arrête(voix=voix1)                                                                       ⟨322770⟩
        canal_arrête(canal=canal2)                                                                    ⟨322793⟩
        retour                                                                                        ⟨322874⟩
    v4 = 60                                                                                           ⟨322878⟩
    v2 = scène2.compteur + ((v4·70) / 100)                                                            ⟨322888⟩
    tant que (scène2.compteur < v2) et (scène2.terminée == 0) :
        si scène2.compteur + 3 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[3])                              ⟨322906⟩
        si scène2.compteur + 3 == scène2.compteur :
            tête_texte_de_lèvres(tête=c6, texte="dspithadngrsocupshnechosfrimslf")                    ⟨322916⟩
        si scène2.compteur + 15 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322926⟩
        si scène2.compteur + 16 == scène2.compteur :
            tête_image_de_base(tête=c6, image=-1)                                                     ⟨322936⟩
        si scène2.compteur + 19 == scène2.compteur :
            tête_image_de_base(tête=c6, image=12)                                                     ⟨322946⟩
        si scène2.compteur + 20 == scène2.compteur :
            tête_image_de_base(tête=c6, image=19)                                                     ⟨322956⟩
        si v2 - 1 == scène2.compteur :
            v2990 = 4540                                                                              ⟨322964⟩
            v2990 = 4552                                                                              ⟨322965⟩
            v2990 = 4568                                                                              ⟨322966⟩
            v2990 = 4584                                                                              ⟨322967⟩
            v2990 = 4604                                                                              ⟨322968⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨322978⟩
        Scene_Tick(scène=scène2)                                                                      ⟨323010⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨323040⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨323073⟩
    v235 = 0                                                                                          ⟨323074⟩
    v234 = 0                                                                                          ⟨323075⟩
    voix_arrête(voix=voix1)                                                                           ⟨323408⟩
    canal_arrête(canal=canal2)                                                                        ⟨323431⟩
    retour                                                                                            ⟨323512⟩

──── scène3 ────
scène3 = Scene_Create(cadence=9, palette=255, surface=&v412)                                          ⟨323522⟩
c7 = Layer(ressource=midgames 42, x=0, y=-80)                                                         ⟨323529⟩
c8 = TalkingHead(ressource=convdata type 0 "lyle", x=164, y=128)                                      ⟨323537⟩
tête_image_de_base(tête=c8, image=31)                                                                 ⟨323542⟩
ajoute c7 à scène3                                                                                    ⟨323547⟩
ajoute c8 à scène3                                                                                    ⟨323552⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨323561⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨323570⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨323582⟩
si v10 != 0 :
    Scene_Tick(scène=scène3)                                                                          ⟨323592⟩
    charge(mid34voc 4)                                                                                ⟨323604⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 4)                                 ⟨323610⟩
    tant que di < 4 :
        Scene_Tick(scène=scène3)                                                                      ⟨323619⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨323629⟩
    tant que sub_8500(voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨323640⟩
        si di == 8 :
            tête_image_de_base(tête=c8, image=21)                                                     ⟨323648⟩
        si di == 17 :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨323658⟩
        Scene_Tick(scène=scène3)                                                                      ⟨323674⟩
    tant que di < 8 :
        Scene_Tick(scène=scène3)                                                                      ⟨323693⟩
    voix_arrête(voix=voix1)                                                                           ⟨323702⟩
sinon :
    v2924→0.méthode8(224)                                                                             ⟨323731⟩
    v4 = 91                                                                                           ⟨323733⟩
    v2 = scène3.compteur + ((v4·70) / 100)                                                            ⟨323743⟩
    tant que (scène3.compteur < v2) et (scène3.terminée == 0) :
        si scène3.compteur + 3 == scène3.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[4])                              ⟨323760⟩
        si scène3.compteur + 17 == scène3.compteur :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨323770⟩
        si scène3.compteur + 18 == scène3.compteur :
            tête_image_de_base(tête=c8, image=21)                                                     ⟨323780⟩
        si scène3.compteur + 27 == scène3.compteur :
            tête_image_de_base(tête=c8, image=12)                                                     ⟨323790⟩
        si v2 - 1 == scène3.compteur :
            v2990 = 4540                                                                              ⟨323798⟩
            v2990 = 4552                                                                              ⟨323799⟩
            v2990 = 4568                                                                              ⟨323800⟩
            v2990 = 4584                                                                              ⟨323801⟩
            v2990 = 4604                                                                              ⟨323802⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨323812⟩
        Scene_Tick(scène=scène3)                                                                      ⟨323844⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨323874⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨323907⟩
    v235 = 0                                                                                          ⟨323908⟩
    v234 = 0                                                                                          ⟨323909⟩
    voix_arrête(voix=voix1)                                                                           ⟨324242⟩
    canal_arrête(canal=canal2)                                                                        ⟨324265⟩
    retour                                                                                            ⟨324346⟩

──── scène4 ────
scène4 = Scene_Create(cadence=9, palette=255, surface=&v412)                                          ⟨324356⟩
c9 = Layer(ressource=midgames 44, x=0, y=0)                                                           ⟨324363⟩
c10 = TalkingHead(ressource=convdata type 0 "miguel", x=255, y=128)                                   ⟨324371⟩
c11 = TalkingHead(ressource=convdata type 0 "gwen", x=95, y=128)                                      ⟨324379⟩
tête_image_de_base(tête=c10, image=19)                                                                ⟨324384⟩
tête_image_de_base(tête=c11, image=19)                                                                ⟨324388⟩
ajoute c9 à scène4                                                                                    ⟨324393⟩
ajoute c10 à scène4                                                                                   ⟨324398⟩
ajoute c11 à scène4                                                                                   ⟨324403⟩
palette_copie(destination=pal1, source=pal5(midgames 45))                                             ⟨324412⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨324421⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨324433⟩
si v10 != 0 :
    Scene_Tick(scène=scène4)                                                                          ⟨324443⟩
    charge(mid34voc 5)                                                                                ⟨324455⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 5)                                 ⟨324461⟩
    tant que di < 4 :
        Scene_Tick(scène=scène4)                                                                      ⟨324470⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨324480⟩
    tant que sub_8500(voix1) != 0 :
        si di == 7 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨324491⟩
        si di == 8 :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨324499⟩
        si di == 9 :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨324507⟩
        si di == 16 :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨324515⟩
        si di == 18 :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨324523⟩
        si di == 2 :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨324531⟩
        si di == 3 :
            tête_image_de_base(tête=c11, image=21)                                                    ⟨324539⟩
        si di == 22 :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨324549⟩
        Scene_Tick(scène=scène4)                                                                      ⟨324565⟩
    tant que di < 8 :
        Scene_Tick(scène=scène4)                                                                      ⟨324587⟩
    voix_arrête(voix=voix1)                                                                           ⟨324596⟩
sinon :
    v2924→0.méthode8(224)                                                                             ⟨324625⟩
    v4 = 91                                                                                           ⟨324627⟩
    v2 = scène4.compteur + ((v4·70) / 100)                                                            ⟨324637⟩
    tant que (scène4.compteur < v2) et (scène4.terminée == 0) :
        si scène4.compteur + 3 == scène4.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[5])                              ⟨324655⟩
        si scène4.compteur + 17 == scène4.compteur :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨324665⟩
        si scène4.compteur + 18 == scène4.compteur :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨324675⟩
        si scène4.compteur + 19 == scène4.compteur :
            tête_image_de_base(tête=c10, image=-1)                                                    ⟨324685⟩
        si scène4.compteur + 26 == scène4.compteur :
            tête_image_de_base(tête=c10, image=12)                                                    ⟨324695⟩
        si scène4.compteur + 28 == scène4.compteur :
            tête_image_de_base(tête=c10, image=21)                                                    ⟨324705⟩
        si scène4.compteur + 7 == scène4.compteur :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨324715⟩
        si scène4.compteur + 8 == scène4.compteur :
            tête_image_de_base(tête=c11, image=21)                                                    ⟨324725⟩
        si scène4.compteur + 32 == scène4.compteur :
            tête_image_de_base(tête=c11, image=12)                                                    ⟨324735⟩
        si v2 - 1 == scène4.compteur :
            v2990 = 4540                                                                              ⟨324743⟩
            v2990 = 4552                                                                              ⟨324744⟩
            v2990 = 4568                                                                              ⟨324745⟩
            v2990 = 4584                                                                              ⟨324746⟩
            v2990 = 4604                                                                              ⟨324747⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨324757⟩
        Scene_Tick(scène=scène4)                                                                      ⟨324789⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨324819⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨324852⟩
    v235 = 0                                                                                          ⟨324853⟩
    v234 = 0                                                                                          ⟨324854⟩
    voix_arrête(voix=voix1)                                                                           ⟨325187⟩
    canal_arrête(canal=canal2)                                                                        ⟨325210⟩
    retour                                                                                            ⟨325291⟩

──── scène5 ────
scène5 = Scene_Create(cadence=9, palette=255, surface=&v412)                                          ⟨325301⟩
c12 = Layer(ressource=midgames 42, x=0, y=-30)                                                        ⟨325308⟩
c13 = TalkingHead(ressource=convdata type 0 "tex", x=163, y=128)                                      ⟨325316⟩
tête_image_de_base(tête=c13, image=25)                                                                ⟨325321⟩
ajoute c12 à scène5                                                                                   ⟨325326⟩
ajoute c13 à scène5                                                                                   ⟨325331⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨325340⟩
palette_copie(destination=pal1, source=pal2(convdata type 2 "normal"))                                ⟨325349⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨325361⟩
si v10 != 0 :
    Scene_Tick(scène=scène5)                                                                          ⟨325371⟩
    charge(mid34voc 6)                                                                                ⟨325383⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 6)                                 ⟨325389⟩
    tant que di < 4 :
        Scene_Tick(scène=scène5)                                                                      ⟨325398⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨325408⟩
    tant que sub_8500(voix1) != 0 :
        Scene_Tick(scène=scène5)                                                                      ⟨325426⟩
    tant que di < 8 :
        Scene_Tick(scène=scène5)                                                                      ⟨325445⟩
    voix_arrête(voix=voix1)                                                                           ⟨325454⟩
sinon :
    v2924→0.méthode8(224)                                                                             ⟨325483⟩
    v4 = 80                                                                                           ⟨325485⟩
    v2 = scène5.compteur + ((v4·70) / 100)                                                            ⟨325495⟩
    tant que (scène5.compteur < v2) et (scène5.terminée == 0) :
        si scène5.compteur + 3 == scène5.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])                              ⟨325513⟩
        si v2 - 1 == scène5.compteur :
            v2990 = 4540                                                                              ⟨325521⟩
            v2990 = 4552                                                                              ⟨325522⟩
            v2990 = 4568                                                                              ⟨325523⟩
            v2990 = 4584                                                                              ⟨325524⟩
            v2990 = 4604                                                                              ⟨325525⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨325535⟩
        Scene_Tick(scène=scène5)                                                                      ⟨325567⟩
Scene_Destruct(scène=scène5, drapeaux=0)                                                              ⟨325597⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨325630⟩
    v235 = 0                                                                                          ⟨325631⟩
    v234 = 0                                                                                          ⟨325632⟩
    voix_arrête(voix=voix1)                                                                           ⟨325965⟩
    canal_arrête(canal=canal2)                                                                        ⟨325988⟩
    retour                                                                                            ⟨326069⟩
charge(midgames 32)                                                                                   ⟨326083⟩
charge(midgames 26)                                                                                   ⟨326095⟩

──── scène6 ────
scène6 = Scene_Create(cadence=6, palette=255, surface=&v412)                                          ⟨326103⟩
c14 = Layer(ressource=midgames 32, x=0, y=0)                                                          ⟨326110⟩
c15 = Layer(ressource=midgames 26, x=0, y=0)                                                          ⟨326118⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨326124⟩
Widget_Method_Dispatch8_314A9(zone1, 253)                                                             ⟨326129⟩
ajoute c14 à scène6                                                                                   ⟨326134⟩
ajoute c15 à scène6                                                                                   ⟨326139⟩
palette_copie(destination=pal1, source=pal6(midgames 41))                                             ⟨326148⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨326160⟩
si v10 != 0 :
    Scene_Tick(scène=scène6)                                                                          ⟨326170⟩
    charge(mid34voc 7)                                                                                ⟨326182⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 7)                                 ⟨326188⟩
    tant que di < 8 :
        Scene_Tick(scène=scène6)                                                                      ⟨326197⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨326207⟩
    tant que sub_8500(voix1) != 0 :
        Scene_Tick(scène=scène6)                                                                      ⟨326225⟩
    v308 = 0                                                                                          ⟨326237⟩
    v304 = 2                                                                                          ⟨326238⟩
    v303 = 0                                                                                          ⟨326239⟩
    v302 = 0                                                                                          ⟨326240⟩
    tant que di < 8 :
        Scene_Tick(scène=scène6)                                                                      ⟨326248⟩
    voix_arrête(voix=voix1)                                                                           ⟨326257⟩
    v308 = 0                                                                                          ⟨326275⟩
    v303 = 0                                                                                          ⟨326276⟩
    v302 = 0                                                                                          ⟨326277⟩
sinon :
    v4 = 40                                                                                           ⟨326301⟩
    v2 = scène6.compteur + ((v4·70) / 100)                                                            ⟨326311⟩
    tant que (scène6.compteur < v2) et (scène6.terminée == 0) :
        si scène6.compteur + 3 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[7])                              ⟨326329⟩
        si v2 - 1 == scène6.compteur :
            v2990 = 4540                                                                              ⟨326337⟩
            v2990 = 4552                                                                              ⟨326338⟩
            v2990 = 4568                                                                              ⟨326339⟩
            v2990 = 4584                                                                              ⟨326340⟩
            v2990 = 4604                                                                              ⟨326341⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨326351⟩
        Scene_Tick(scène=scène6)                                                                      ⟨326383⟩
    si byte_495FC != 0 :
        Scene_Destruct(scène=scène6, drapeaux=0)                                                      ⟨326419⟩
        v240 = 0                                                                                      ⟨326484⟩
        v235 = 0                                                                                      ⟨326485⟩
        v234 = 0                                                                                      ⟨326486⟩
        voix_arrête(voix=voix1)                                                                       ⟨326819⟩
        canal_arrête(canal=canal2)                                                                    ⟨326842⟩
        retour                                                                                        ⟨326923⟩
    v4 = 82                                                                                           ⟨326927⟩
    v2 = scène6.compteur + ((v4·70) / 100)                                                            ⟨326937⟩
    tant que (scène6.compteur < v2) et (scène6.terminée == 0) :
        si scène6.compteur + 1 == scène6.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])                              ⟨326954⟩
        si v2 - 1 == scène6.compteur :
            v2990 = 4540                                                                              ⟨326962⟩
            v2990 = 4552                                                                              ⟨326963⟩
            v2990 = 4568                                                                              ⟨326964⟩
            v2990 = 4584                                                                              ⟨326965⟩
            v2990 = 4604                                                                              ⟨326966⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v2990, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨326976⟩
        Scene_Tick(scène=scène6)                                                                      ⟨327008⟩
Scene_Destruct(scène=scène6, drapeaux=0)                                                              ⟨327038⟩
si byte_495FC != 0 :
    v240 = 0                                                                                          ⟨327109⟩
    v235 = 0                                                                                          ⟨327110⟩
    v234 = 0                                                                                          ⟨327111⟩
    voix_arrête(voix=voix1)                                                                           ⟨327444⟩
    canal_arrête(canal=canal2)                                                                        ⟨327467⟩
    retour                                                                                            ⟨327548⟩

──── scène7 ────
scène7 = Scene_Create(cadence=15, palette=255, surface=&v412)                                         ⟨327558⟩
c16 = Layer(ressource=midgames 42, x=0, y=-80)                                                        ⟨327565⟩
c17 = Layer(ressource=midgames 33, x=0, y=0)                                                          ⟨327573⟩
c18 = Layer(ressource=midgames 34, x=0, y=0)                                                          ⟨327581⟩
c19 = Layer(ressource=midgames 35, x=0, y=0)                                                          ⟨327589⟩
c20 = Layer(ressource=midgames 29, x=0, y=-24)                                                        ⟨327597⟩
palette_copie(destination=pal1, source=pal3(midgames 37))                                             ⟨327607⟩
palette_copie(destination=pal1, source=pal4(midgames 43))                                             ⟨327616⟩
ajoute c16 à scène7                                                                                   ⟨327621⟩
ajoute c20 à scène7                                                                                   ⟨327626⟩
ajoute c17 à scène7                                                                                   ⟨327631⟩
ajoute c18 à scène7                                                                                   ⟨327636⟩
ajoute c19 à scène7                                                                                   ⟨327641⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨327653⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨327658⟩
Widget_Method_Dispatch8_314A9(zone1, 233)                                                             ⟨327663⟩
v2 = 145                                                                                              ⟨327670⟩
si v11 != 0 :
    charge(asoundfx 76)                                                                               ⟨327693⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨327698⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 76, x=0)                                        ⟨327705⟩
    v296 = word_48F3A                                                                                 ⟨327708⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v2990)                                        ⟨327715⟩
        sub_30C66(canal3.+0→4, v2990, v296, mid34voc 7.+0)                                            ⟨327722⟩
si v10 != 0 :
    Scene_Tick(scène=scène7)                                                                          ⟨327736⟩
    charge(mid34voc 8)                                                                                ⟨327744⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid34voc 8)                                 ⟨327750⟩
tant que (scène7.compteur < v2) et (scène7.terminée == 0) :
    si scène7.compteur > 50 :
        si scène7.compteur < 140 :
            v310 = mid34voc 5.+0                                                                      ⟨327764⟩
            c20.image = v310                                                                          ⟨327768⟩
    si scène7.compteur == 110 :
        Scene_SetFps(scène=scène7, cadence=9)                                                         ⟨327777⟩
    si scène7.compteur == 140 :
        retire(parent=scène7, calque=c20)                                                             ⟨327786⟩
        c20.détruit(3)                                                                                ⟨327794⟩
    si mid34voc 0.+0 + 6 == scène7.compteur :
        si v10 != 0 :
            voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                           ⟨327809⟩
    si mid34voc 0.+0 + 6 == scène7.compteur :
        si v10 == 0 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[9])                              ⟨327830⟩
    si mid34voc 0.+0 + 5 < scène7.compteur :
        si mid34voc 0.+0 + 10 > scène7.compteur :
            v312 = v276                                                                               ⟨327844⟩
            v276 = v276 + 1                                                                           ⟨327845⟩
            c18.image = v312                                                                          ⟨327848⟩
    si mid34voc 0.+0 + 13 < scène7.compteur :
        si mid34voc 0.+0 + 18 > scène7.compteur :
            v314 = mid34voc 6.+0                                                                      ⟨327861⟩
            c19.image = v314                                                                          ⟨327865⟩
    si midgames 26.+0 + 27 == scène7.compteur :
        si v10 == 0 :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[10])                             ⟨327885⟩
    si midgames 26.+0 + 25 < scène7.compteur :
        si midgames 26.+0 + 30 > scène7.compteur :
            v276 = v276 - 1                                                                           ⟨327898⟩
            v316 = v276                                                                               ⟨327900⟩
            c18.image = v316                                                                          ⟨327903⟩
    si midgames 26.+0 + 32 < scène7.compteur :
        si midgames 26.+0 + 41 > scène7.compteur :
            si scène7.compteur & 1 != 0 :
                v318 = mid34voc 6.+0 - 1                                                              ⟨327919⟩
                c19.image = v318                                                                      ⟨327922⟩
    si midgames 26.+0 + 60 == scène7.compteur :
        si v10 == 0 :
            v3004 = 4540                                                                              ⟨327934⟩
            v3004 = 4552                                                                              ⟨327935⟩
            v3004 = 4568                                                                              ⟨327936⟩
            v3004 = 4584                                                                              ⟨327937⟩
            v3004 = 4604                                                                              ⟨327938⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3004, v2919, v2917, v2915, v2913, 0, &v2942)        ⟨327948⟩
    aller à loc_B690E                                                                                 ⟨327953⟩
    aller à loc_B693B                                                                                 ⟨327980⟩
    loc_B690E:                                                                                        ⟨327983⟩
    Scene_Tick(scène=scène7)                                                                          ⟨327987⟩
loc_B693B:                                                                                            ⟨328012⟩
si v10 != 0 :
    voix_arrête(voix=voix1)                                                                           ⟨328018⟩
fondu_disparition(palette=pal1, couleur=&v28, pas=2, premier=0, nombre=256)                           ⟨328029⟩
canal_arrête(canal=canal3)                                                                            ⟨328052⟩
Scene_Destruct(scène=scène7, drapeaux=0)                                                              ⟨328095⟩
v240 = 0                                                                                              ⟨328122⟩
v235 = 0                                                                                              ⟨328123⟩
v234 = 0                                                                                              ⟨328124⟩
voix_arrête(voix=voix1)                                                                               ⟨328457⟩
canal_arrête(canal=canal2)                                                                            ⟨328480⟩
retour                                                                                                ⟨328561⟩
```

## Tableaux du segment de données

