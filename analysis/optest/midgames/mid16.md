# Script extrait de `sub_94A30` (optest)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/optest.asm`.
Lignes « asm: » = instructions non traduites.

## sub_94A30

```
bp = sp                                                                                               ⟨279980⟩
tableau_textes(tableau=textes1, nombre=11, longueur=200)                                              ⟨279989⟩
byte_495FC = 0                                                                                        ⟨279991⟩
v11 = 0                                                                                               ⟨279992⟩
v12 = 0                                                                                               ⟨279993⟩
v13 = 0                                                                                               ⟨279994⟩
si word_4684B != 0 :
    v12 = 1                                                                                           ⟨279997⟩
v16 = word_46F46                                                                                      ⟨280001⟩
v340 = 0                                                                                              ⟨280002⟩
TextFormat_ApplyStyleAttribute_2E9A4(&v340, v16)                                                      ⟨280007⟩
v354 = 0                                                                                              ⟨280009⟩
TextRenderer_ApplyFormatChange_2EA21(&v354, 0)                                                        ⟨280018⟩
SmallObject_RegisterInList_2CB40(&v20, &v354)                                                         ⟨280024⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨280030⟩
v30 = 0                                                                                               ⟨280036⟩
si v12 != 0 :
    si sub_6734(chemin1) != 0 :
        pak mid16voc.ouvre(chemin1, 1)                                                                ⟨280102⟩
    sinon :
        v12 = 0                                                                                       ⟨280109⟩
sinon :
    v12 = 0                                                                                           ⟨280109⟩
v40 = 0                                                                                               ⟨280112⟩
v35 = 0                                                                                               ⟨280114⟩
v34 = 0                                                                                               ⟨280115⟩
v42 = byte_46848                                                                                      ⟨280117⟩
si v42 != 1 :
    si v42 == 2 : aller à loc_94D66                                                                   ⟨280127⟩
sinon :
    si sub_6734(chemin1) != 0 :
        pak rsoundfx.ouvre(chemin1, 1)                                                                ⟨280163⟩
        flux_iff(flux=flux1)                                                                          ⟨280177⟩
        v3063 = 256                                                                                   ⟨280180⟩
        v3067 = 0                                                                                     ⟨280181⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨280189⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨280195⟩
        iff_chunk(flux=flux1, balise='MT32', x=1)                                                     ⟨280201⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨280205⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨280207⟩
        si = 1                                                                                        ⟨280208⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨280215⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨280219⟩
            si = si + 1                                                                               ⟨280220⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨280227⟩
        v13 = 1                                                                                       ⟨280229⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨280233⟩
    si sub_6734(chemin1) != 0 :
        v11 = 1                                                                                       ⟨280259⟩
        si v13 == 0 :
            word_48F76 = 90                                                                           ⟨280264⟩
    aller à loc_94ED1                                                                                 ⟨280268⟩
    loc_94D66:                                                                                        ⟨280271⟩
    si sub_6734(chemin1) != 0 :
        pak asoundfx.ouvre(chemin1, 1)                                                                ⟨280299⟩
        flux_iff(flux=flux1)                                                                          ⟨280313⟩
        v3063 = 256                                                                                   ⟨280316⟩
        v3067 = 0                                                                                     ⟨280317⟩
        flux1.ouvre(chemin1, 1)                                                                       ⟨280325⟩
        iff_form(flux=flux1, balise='VOLU', x=0)                                                      ⟨280331⟩
        iff_chunk(flux=flux1, balise='ADLB', x=1)                                                     ⟨280337⟩
        iff_lit_mot(flux=flux1)                                                                       ⟨280341⟩
        word_48F76 = iff_lit_mot(flux=flux1)                                                          ⟨280343⟩
        si = 1                                                                                        ⟨280344⟩
        tant que si <= 106 :
            iff_lit_mot(flux=flux1)                                                                   ⟨280351⟩
            ds:24192[si·2] = iff_lit_mot(flux=flux1)                                                  ⟨280355⟩
            si = si + 1                                                                               ⟨280356⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨280363⟩
        v13 = 1                                                                                       ⟨280365⟩
        iff_ferme_form(flux=flux1)                                                                    ⟨280369⟩
    si sub_6734(chemin1) != 0 :
        v11 = 1                                                                                       ⟨280395⟩
        si v13 == 0 :
            word_48F76 = 255                                                                          ⟨280400⟩
loc_94ED1:                                                                                            ⟨280406⟩
si v13 != 0 :
    canal_init(canal=canal1, pilote=word_46849)                                                       ⟨280423⟩
    charge(asoundfx 29)                                                                               ⟨280435⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 29, x=0)                                        ⟨280442⟩
    canal_arrête(canal=canal1)                                                                        ⟨280446⟩
    v168 = 0                                                                                          ⟨280466⟩
    canal_arrête(canal=canal1)                                                                        ⟨280469⟩
    v3002 = 0                                                                                         ⟨280487⟩
v844 = 0                                                                                              ⟨280492⟩
v839 = 0                                                                                              ⟨280494⟩
v838 = 0                                                                                              ⟨280495⟩
v848 = 0                                                                                              ⟨280496⟩
si v11 != 0 :
    si v12 != 0 :
        v165 = 12                                                                                     ⟨280513⟩
    sinon :
        v165 = 11                                                                                     ⟨280518⟩
    charge(amusic v165)                                                                               ⟨280529⟩
    canal_init(canal=canal2, pilote=word_46849)                                                       ⟨280534⟩
    canal_enregistre(canal=canal2, ressource=amusic v165, x=0)                                        ⟨280541⟩
    v168 = word_48F76                                                                                 ⟨280544⟩
    v170 = 0                                                                                          ⟨280545⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v846)                                         ⟨280551⟩
        AIL_set_relative_volume_30C66(canal2.+0→4, v846, v168, v170)                                  ⟨280558⟩
v857 = booléen                                                                                        ⟨280578⟩
v853 = booléen                                                                                        ⟨280579⟩
si v12 != 0 :
    voix_pilote(voix=voix1, pilote=word_4684B)                                                        ⟨280585⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨280603⟩
    v3063 = 256                                                                                       ⟨280606⟩
    v3067 = 0                                                                                         ⟨280607⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨280615⟩
    iff_form(flux=flux1, balise='MG16', x=0)                                                          ⟨280621⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨280627⟩
    si = 0                                                                                            ⟨280629⟩
    tant que si < 11 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨280638⟩
        di = v3046                                                                                    ⟨280640⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·si), taille=v3046)                   ⟨280651⟩
        v3059 = v3042                                                                                 ⟨280654⟩
        si = si + 1                                                                                   ⟨280655⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨280662⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨280667⟩
charge(mid16 5)                                                                                       ⟨280686⟩
charge(mid16 4)                                                                                       ⟨280698⟩
charge(mid16 3)                                                                                       ⟨280710⟩
charge(mid16 1)                                                                                       ⟨280722⟩
charge(mid16 0)                                                                                       ⟨280734⟩
charge(mid16 2)                                                                                       ⟨280746⟩
charge(mid16 6)                                                                                       ⟨280758⟩
palette_depuis(pal2(mid16 6))                                                                         ⟨280765⟩
charge(mid16 7)                                                                                       ⟨280777⟩
palette_depuis(pal3(mid16 7))                                                                         ⟨280784⟩
v144 = 0                                                                                              ⟨280786⟩
v140 = 2                                                                                              ⟨280787⟩
v139 = 0                                                                                              ⟨280788⟩
v138 = 0                                                                                              ⟨280789⟩
TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                       ⟨280803⟩
v146 = ?                                                                                              ⟨280805⟩
v148 = TextRenderer_LoadResourceFile_3DA1F(chemin1, 2)                                                ⟨280806⟩
v144 = v148                                                                                           ⟨280808⟩
v140 = 2                                                                                              ⟨280809⟩
v139 = 1                                                                                              ⟨280810⟩
v138 = 0                                                                                              ⟨280811⟩
GlyphObject_ConstructWithBuffer_311CF(&v2958, &v144)                                                  ⟨280816⟩
v158 = word_46F46                                                                                     ⟨280823⟩
zone_texte(zone=zone1, police=&v2958)                                                                 ⟨280829⟩
v160 = 152                                                                                            ⟨280833⟩
v162 = 319                                                                                            ⟨280835⟩
v164 = 199                                                                                            ⟨280837⟩
v2967 = 0                                                                                             ⟨280839⟩
v2965 = v160                                                                                          ⟨280841⟩
v2963 = v162                                                                                          ⟨280843⟩
v2961 = v164                                                                                          ⟨280845⟩
Widget_Method_DispatchC_314CB(zone1, 0)                                                               ⟨280849⟩
Widget_Method_Dispatch8_314A9(zone1, 200)                                                             ⟨280854⟩
si byte_495FC != 0 :
    v144 = 0                                                                                          ⟨280887⟩
    v139 = 0                                                                                          ⟨280888⟩
    v138 = 0                                                                                          ⟨280889⟩
    v123 = 0                                                                                          ⟨280912⟩
    v122 = 0                                                                                          ⟨280913⟩
    v107 = 0                                                                                          ⟨280936⟩
    v106 = 0                                                                                          ⟨280937⟩
    v97 = 0                                                                                           ⟨280955⟩
    v96 = 0                                                                                           ⟨280956⟩
    v87 = 0                                                                                           ⟨280974⟩
    v86 = 0                                                                                           ⟨280975⟩
    v77 = 0                                                                                           ⟨280993⟩
    v76 = 0                                                                                           ⟨280994⟩
    v67 = 0                                                                                           ⟨281012⟩
    v66 = 0                                                                                           ⟨281013⟩
    v57 = 0                                                                                           ⟨281031⟩
    v56 = 0                                                                                           ⟨281032⟩
    v47 = 0                                                                                           ⟨281050⟩
    v46 = 0                                                                                           ⟨281051⟩
    voix_arrête(voix=voix1)                                                                           ⟨281055⟩
    v2918 = 0                                                                                         ⟨281073⟩
    v2913 = 0                                                                                         ⟨281074⟩
    v2912 = 0                                                                                         ⟨281075⟩
    canal_arrête(canal=canal2)                                                                        ⟨281078⟩
    v844 = 0                                                                                          ⟨281096⟩
    v839 = 0                                                                                          ⟨281097⟩
    v838 = 0                                                                                          ⟨281098⟩
    v35 = 0                                                                                           ⟨281121⟩
    v34 = 0                                                                                           ⟨281122⟩
    retour                                                                                            ⟨281164⟩
v168 = 0                                                                                              ⟨281171⟩
charge(midgames 1)                                                                                    ⟨281178⟩
charge(midgames 2)                                                                                    ⟨281190⟩
palette_depuis(pal4(midgames 2))                                                                      ⟨281197⟩

──── scène1 ────
scène1 = Scene_Create(cadence=10, palette=255, surface=&v340)                                         ⟨281205⟩
c1 = ImageLayer(ressource=midgames 1, x=0, y=0, image=0)                                              ⟨281213⟩
c2 = ImageLayer(ressource=midgames 1, x=0, y=0, image=1)                                              ⟨281222⟩
palette_copie(destination=pal1, source=pal3(mid16 7))                                                 ⟨281232⟩
palette_copie(destination=pal1, source=pal4(midgames 2))                                              ⟨281241⟩
ajoute c1 à scène1                                                                                    ⟨281246⟩
ajoute c2 à scène1                                                                                    ⟨281251⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=0, premier=0, nombre=256)                           ⟨281264⟩
palette_copie(destination=pal1, source=pal3(mid16 7))                                                 ⟨281273⟩
palette_copie(destination=pal1, source=pal4(midgames 2))                                              ⟨281282⟩
Scene_Tick(scène=scène1)                                                                              ⟨281286⟩
fondu_apparition(palette=pal1, couleur=&v30, pas=2, premier=0, nombre=256)                            ⟨281295⟩
v6 = 25                                                                                               ⟨281297⟩
v2 = scène1.compteur                                                                                  ⟨281299⟩
v4 = v2 + ((v6·70) / 100)                                                                             ⟨281308⟩
tant que (scène1.compteur < v4) et (scène1.terminée == 0) :
    Scene_Tick(scène=scène1)                                                                          ⟨281325⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=1, premier=0, nombre=256)                           ⟨281356⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨281361⟩
v179 = 0                                                                                              ⟨281385⟩
v178 = 0                                                                                              ⟨281386⟩
v168 = 0                                                                                              ⟨281405⟩
si byte_495FC != 0 :
    v144 = 0                                                                                          ⟨281437⟩
    v139 = 0                                                                                          ⟨281438⟩
    v138 = 0                                                                                          ⟨281439⟩
    v123 = 0                                                                                          ⟨281462⟩
    v122 = 0                                                                                          ⟨281463⟩
    v107 = 0                                                                                          ⟨281486⟩
    v106 = 0                                                                                          ⟨281487⟩
    v97 = 0                                                                                           ⟨281505⟩
    v96 = 0                                                                                           ⟨281506⟩
    v87 = 0                                                                                           ⟨281524⟩
    v86 = 0                                                                                           ⟨281525⟩
    v77 = 0                                                                                           ⟨281543⟩
    v76 = 0                                                                                           ⟨281544⟩
    v67 = 0                                                                                           ⟨281562⟩
    v66 = 0                                                                                           ⟨281563⟩
    v57 = 0                                                                                           ⟨281581⟩
    v56 = 0                                                                                           ⟨281582⟩
    v47 = 0                                                                                           ⟨281600⟩
    v46 = 0                                                                                           ⟨281601⟩
    voix_arrête(voix=voix1)                                                                           ⟨281605⟩
    v2918 = 0                                                                                         ⟨281623⟩
    v2913 = 0                                                                                         ⟨281624⟩
    v2912 = 0                                                                                         ⟨281625⟩
    canal_arrête(canal=canal2)                                                                        ⟨281628⟩
    v844 = 0                                                                                          ⟨281646⟩
    v839 = 0                                                                                          ⟨281647⟩
    v838 = 0                                                                                          ⟨281648⟩
    v35 = 0                                                                                           ⟨281671⟩
    v34 = 0                                                                                           ⟨281672⟩
    retour                                                                                            ⟨281714⟩

──── scène2 ────
scène2 = Scene_Create(cadence=7, palette=255, surface=&v340)                                          ⟨281724⟩
c3 = OverlayImageLayer(ressource=mid16 5, x=0, y=-1, image=2)                                         ⟨281732⟩
si = c3                                                                                               ⟨281734⟩
c4 = OverlayImageLayer(ressource=mid16 4, x=0, y=-1, image=1)                                         ⟨281741⟩
c5 = OverlayImageLayer(ressource=mid16 3, x=0, y=-1, image=0)                                         ⟨281750⟩
c6 = Layer(ressource=mid16 1, x=0, y=0)                                                               ⟨281758⟩
palette_copie(destination=pal1, source=pal3(mid16 7))                                                 ⟨281768⟩
ajoute c6 à scène2                                                                                    ⟨281773⟩
ajoute c3 à scène2                                                                                    ⟨281778⟩
ajoute c5 à scène2                                                                                    ⟨281783⟩
ajoute c4 à scène2                                                                                    ⟨281788⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨281800⟩
v172 = 1                                                                                              ⟨281802⟩
si v12 != 0 :
    Scene_Tick(scène=scène2)                                                                          ⟨281811⟩
    charge(mid16voc 0)                                                                                ⟨281823⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 0)                                 ⟨281829⟩
    di = 0                                                                                            ⟨281831⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨281838⟩
        di = di + 1                                                                                   ⟨281840⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨281848⟩
    di = 0                                                                                            ⟨281850⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 4 :
            c3.image = 1                                                                              ⟨281857⟩
        si di == 10 :
            c3.image = 2                                                                              ⟨281862⟩
        si di == 11 :
            c3.image = 1                                                                              ⟨281867⟩
        si di == 12 :
            c3.image = 2                                                                              ⟨281872⟩
        di = di + 1                                                                                   ⟨281876⟩
        si di == 16 :
            c3.image = 1                                                                              ⟨281879⟩
        Scene_Tick(scène=scène2)                                                                      ⟨281894⟩
    charge(mid16voc 1)                                                                                ⟨281916⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 1)                                 ⟨281922⟩
    di = 0                                                                                            ⟨281924⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨281931⟩
        di = di + 1                                                                                   ⟨281933⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨281941⟩
    di = 0                                                                                            ⟨281943⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 4 :
            c3.image = 2                                                                              ⟨281950⟩
        si di == 16 :
            c3.image = 1                                                                              ⟨281955⟩
        si di == 18 :
            c3.image = 2                                                                              ⟨281960⟩
        di = di + 1                                                                                   ⟨281964⟩
        si di == 22 :
            c3.image = 1                                                                              ⟨281967⟩
        Scene_Tick(scène=scène2)                                                                      ⟨281982⟩
    charge(mid16voc 2)                                                                                ⟨282004⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 2)                                 ⟨282010⟩
    di = 0                                                                                            ⟨282012⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨282019⟩
        di = di + 1                                                                                   ⟨282021⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨282029⟩
    di = 0                                                                                            ⟨282031⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 8 :
            c3.image = 2                                                                              ⟨282038⟩
        di = di + 1                                                                                   ⟨282042⟩
        si di == 16 :
            c4.image = 2                                                                              ⟨282046⟩
        Scene_Tick(scène=scène2)                                                                      ⟨282061⟩
    charge(mid16voc 3)                                                                                ⟨282083⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 3)                                 ⟨282089⟩
    di = 0                                                                                            ⟨282091⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨282098⟩
        di = di + 1                                                                                   ⟨282100⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨282108⟩
    di = 0                                                                                            ⟨282110⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 4 :
            c3.image = 1                                                                              ⟨282117⟩
        si di == 23 :
            c3.image = 2                                                                              ⟨282122⟩
        si di == 24 :
            c3.image = 1                                                                              ⟨282127⟩
        di = di + 1                                                                                   ⟨282131⟩
        si di == 25 :
            c3.image = 2                                                                              ⟨282134⟩
        Scene_Tick(scène=scène2)                                                                      ⟨282149⟩
    charge(mid16voc 4)                                                                                ⟨282171⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 4)                                 ⟨282177⟩
    di = 0                                                                                            ⟨282179⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨282186⟩
        di = di + 1                                                                                   ⟨282188⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨282196⟩
    di = 0                                                                                            ⟨282198⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 4 :
            c3.image = 1                                                                              ⟨282205⟩
        si di == 14 :
            c3.image = 2                                                                              ⟨282210⟩
        si di == 24 :
            c4.image = 1                                                                              ⟨282216⟩
        di = di + 1                                                                                   ⟨282220⟩
        si di == 26 :
            c3.image = 1                                                                              ⟨282223⟩
        Scene_Tick(scène=scène2)                                                                      ⟨282238⟩
    charge(mid16voc 5)                                                                                ⟨282260⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 5)                                 ⟨282266⟩
    di = 0                                                                                            ⟨282268⟩
    tant que di < 6 :
        Scene_Tick(scène=scène2)                                                                      ⟨282275⟩
        di = di + 1                                                                                   ⟨282277⟩
    c4.image = 2                                                                                      ⟨282283⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨282287⟩
    di = 0                                                                                            ⟨282289⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di > 6 :
            si di < 12 :
                si di & 1 != 0 :
                    v234 = v172                                                                       ⟨282301⟩
                    c5.image = v234                                                                   ⟨282304⟩
                    si v172 < 3 :
                        v172 = v172 + 1                                                               ⟨282307⟩
        si di > 14 :
            si di < 18 :
                si v172 > 1 :
                    v172 = v172 - 1                                                                   ⟨282317⟩
                v236 = v172                                                                           ⟨282321⟩
                c5.image = v236                                                                       ⟨282324⟩
        di = di + 1                                                                                   ⟨282328⟩
        Scene_Tick(scène=scène2)                                                                      ⟨282341⟩
    c4.image = 1                                                                                      ⟨282357⟩
    di = 0                                                                                            ⟨282358⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨282365⟩
        di = di + 1                                                                                   ⟨282367⟩
    charge(mid16voc 6)                                                                                ⟨282382⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 6)                                 ⟨282388⟩
    di = 0                                                                                            ⟨282390⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨282397⟩
        di = di + 1                                                                                   ⟨282399⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨282407⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène2)                                                                      ⟨282425⟩
    di = 0                                                                                            ⟨282437⟩
    tant que di < 8 :
        Scene_Tick(scène=scène2)                                                                      ⟨282444⟩
        di = di + 1                                                                                   ⟨282446⟩
    c3.image = 2                                                                                      ⟨282451⟩
    di = 0                                                                                            ⟨282452⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨282459⟩
        di = di + 1                                                                                   ⟨282461⟩
    voix_arrête(voix=voix1)                                                                           ⟨282468⟩
    v241 = 0                                                                                          ⟨282487⟩
    v240 = 0                                                                                          ⟨282488⟩
    v227 = 0                                                                                          ⟨282506⟩
    v226 = 0                                                                                          ⟨282507⟩
    v217 = 0                                                                                          ⟨282525⟩
    v216 = 0                                                                                          ⟨282526⟩
    v207 = 0                                                                                          ⟨282544⟩
    v206 = 0                                                                                          ⟨282545⟩
    v197 = 0                                                                                          ⟨282563⟩
    v186 = 0                                                                                          ⟨282583⟩
    v176 = 0                                                                                          ⟨282602⟩
sinon :
    Widget_Method_DispatchC_314CB(zone1, 0)                                                           ⟨282610⟩
    Widget_Method_Dispatch8_314A9(zone1, 1)                                                           ⟨282615⟩
    v6 = 48                                                                                           ⟨282617⟩
    v2 = scène2.compteur                                                                              ⟨282619⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨282628⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨282633⟩
        si v2 + 8 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[0])                              ⟨282641⟩
        si v2 + 4 == scène2.compteur :
            c3.image = 1                                                                              ⟨282649⟩
        si v2 + 12 == scène2.compteur :
            c3.image = 2                                                                              ⟨282656⟩
        si v2 + 16 == scène2.compteur :
            c3.image = 1                                                                              ⟨282663⟩
        si v4 - 1 == scène2.compteur :
            v3038 = 4540                                                                              ⟨282670⟩
            v3038 = 4552                                                                              ⟨282671⟩
            v3038 = 4568                                                                              ⟨282672⟩
            v3038 = 4584                                                                              ⟨282673⟩
            v3038 = 4604                                                                              ⟨282674⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3038, v2967, v2965, v2963, v2961, 0, &v2990)        ⟨282684⟩
        Scene_Tick(scène=scène2)                                                                      ⟨282716⟩
    v6 = 32                                                                                           ⟨282743⟩
    v2 = scène2.compteur                                                                              ⟨282745⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨282754⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨282759⟩
        si v2 + 2 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[1])                              ⟨282769⟩
        si v2 + 4 == scène2.compteur :
            c3.image = 2                                                                              ⟨282777⟩
        si v2 + 16 == scène2.compteur :
            c3.image = 1                                                                              ⟨282784⟩
        si v2 + 18 == scène2.compteur :
            c3.image = 2                                                                              ⟨282791⟩
        si v2 + 22 == scène2.compteur :
            c3.image = 1                                                                              ⟨282798⟩
        si v4 - 1 == scène2.compteur :
            v3038 = 4540                                                                              ⟨282805⟩
            v3038 = 4552                                                                              ⟨282806⟩
            v3038 = 4568                                                                              ⟨282807⟩
            v3038 = 4584                                                                              ⟨282808⟩
            v3038 = 4604                                                                              ⟨282809⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3038, v2967, v2965, v2963, v2961, 0, &v2990)        ⟨282819⟩
        Scene_Tick(scène=scène2)                                                                      ⟨282851⟩
    v6 = 30                                                                                           ⟨282878⟩
    v2 = scène2.compteur                                                                              ⟨282880⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨282889⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨282894⟩
        si v2 + 2 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[2])                              ⟨282906⟩
        si v2 + 8 == scène2.compteur :
            c3.image = 2                                                                              ⟨282914⟩
        si v2 + 16 == scène2.compteur :
            c4.image = 2                                                                              ⟨282922⟩
        si v4 - 1 == scène2.compteur :
            v3038 = 4540                                                                              ⟨282929⟩
            v3038 = 4552                                                                              ⟨282930⟩
            v3038 = 4568                                                                              ⟨282931⟩
            v3038 = 4584                                                                              ⟨282932⟩
            v3038 = 4604                                                                              ⟨282933⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3038, v2967, v2965, v2963, v2961, 0, &v2990)        ⟨282943⟩
        Scene_Tick(scène=scène2)                                                                      ⟨282975⟩
    v6 = 78                                                                                           ⟨283002⟩
    v2 = scène2.compteur                                                                              ⟨283004⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨283013⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨283018⟩
        si v2 + 2 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[3])                              ⟨283031⟩
        si v2 + 4 == scène2.compteur :
            c3.image = 1                                                                              ⟨283039⟩
        si v2 + 24 == scène2.compteur :
            c3.image = 2                                                                              ⟨283046⟩
        si v2 + 36 == scène2.compteur :
            c3.image = 1                                                                              ⟨283053⟩
        si v2 + 38 == scène2.compteur :
            c3.image = 2                                                                              ⟨283060⟩
        si v2 + 44 == scène2.compteur :
            c3.image = 1                                                                              ⟨283067⟩
        si v4 - 1 == scène2.compteur :
            v3038 = 4540                                                                              ⟨283074⟩
            v3038 = 4552                                                                              ⟨283075⟩
            v3038 = 4568                                                                              ⟨283076⟩
            v3038 = 4584                                                                              ⟨283077⟩
            v3038 = 4604                                                                              ⟨283078⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3038, v2967, v2965, v2963, v2961, 0, &v2990)        ⟨283088⟩
        Scene_Tick(scène=scène2)                                                                      ⟨283120⟩
    v6 = 89                                                                                           ⟨283147⟩
    v2 = scène2.compteur                                                                              ⟨283149⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨283158⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨283163⟩
        si v2 + 2 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[4])                              ⟨283175⟩
        si v2 + 4 == scène2.compteur :
            c3.image = 1                                                                              ⟨283183⟩
        si v2 + 14 == scène2.compteur :
            c3.image = 2                                                                              ⟨283190⟩
        si v2 + 26 == scène2.compteur :
            c3.image = 1                                                                              ⟨283197⟩
        si v2 + 28 == scène2.compteur :
            c3.image = 2                                                                              ⟨283204⟩
        si v2 + 44 == scène2.compteur :
            c3.image = 1                                                                              ⟨283211⟩
        si v4 - 9 == scène2.compteur :
            c4.image = 1                                                                              ⟨283219⟩
        si v4 - 8 == scène2.compteur :
            c3.image = 2                                                                              ⟨283226⟩
        si v4 - 1 == scène2.compteur :
            v3038 = 4540                                                                              ⟨283233⟩
            v3038 = 4552                                                                              ⟨283234⟩
            v3038 = 4568                                                                              ⟨283235⟩
            v3038 = 4584                                                                              ⟨283236⟩
            v3038 = 4604                                                                              ⟨283237⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3038, v2967, v2965, v2963, v2961, 0, &v2990)        ⟨283247⟩
        Scene_Tick(scène=scène2)                                                                      ⟨283279⟩
    v6 = 58                                                                                           ⟨283306⟩
    v2 = scène2.compteur                                                                              ⟨283308⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨283317⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨283322⟩
        si v2 + 8 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[5])                              ⟨283335⟩
        si v2 + 6 == scène2.compteur :
            c3.image = 1                                                                              ⟨283343⟩
        si v4 - 3 == scène2.compteur :
            v3038 = 4540                                                                              ⟨283350⟩
            v3038 = 4552                                                                              ⟨283351⟩
            v3038 = 4568                                                                              ⟨283352⟩
            v3038 = 4584                                                                              ⟨283353⟩
            v3038 = 4604                                                                              ⟨283354⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3038, v2967, v2965, v2963, v2961, 0, &v2990)        ⟨283364⟩
        Scene_Tick(scène=scène2)                                                                      ⟨283396⟩
    Widget_Method_Dispatch8_314A9(zone1, 2)                                                           ⟨283426⟩
    v6 = 54                                                                                           ⟨283428⟩
    v2 = scène2.compteur                                                                              ⟨283430⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨283439⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨283444⟩
        si v2 + 6 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[6])                              ⟨283457⟩
        si v2 + 10 == scène2.compteur :
            c4.image = 2                                                                              ⟨283466⟩
        si v2 + 26 == scène2.compteur :
            c4.image = 1                                                                              ⟨283474⟩
        si v2 + 12 < scène2.compteur :
            si v2 + 18 > scène2.compteur :
                si scène2.compteur & 1 != 0 :
                    c5.image = v172                                                                   ⟨283491⟩
                    si v172 < 3 :
                        v172_avant = v172                                                             ⟨283494⟩
                        v172_avant = v172                                                             ⟨283494⟩
                        v172 = v172 + 1                                                               ⟨283494⟩
        si v2 + 24 < scène2.compteur :
            si scène2.compteur & 1 != 0 :
                v176 = v172                                                                           ⟨283505⟩
                c5.image = v176                                                                       ⟨283508⟩
                si v172 > 1 :
                    v172 = v172 - 1                                                                   ⟨283511⟩
        si v4 - 10 == scène2.compteur :
            c4.image = 2                                                                              ⟨283520⟩
        si v4 - 1 == scène2.compteur :
            v3038 = 4540                                                                              ⟨283527⟩
            v3038 = 4552                                                                              ⟨283528⟩
            v3038 = 4568                                                                              ⟨283529⟩
            v3038 = 4584                                                                              ⟨283530⟩
            v3038 = 4604                                                                              ⟨283531⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3038, v2967, v2965, v2963, v2961, 0, &v2990)        ⟨283541⟩
        Scene_Tick(scène=scène2)                                                                      ⟨283573⟩
    v6 = 43                                                                                           ⟨283600⟩
    v2 = scène2.compteur                                                                              ⟨283602⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨283611⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨283616⟩
        si v2 + 2 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[7])                              ⟨283629⟩
        si v4 - 8 == scène2.compteur :
            c3.image = 2                                                                              ⟨283637⟩
        si v4 - 12 == scène2.compteur :
            c4.image = 1                                                                              ⟨283645⟩
        si v4 - 1 == scène2.compteur :
            v3038 = 4540                                                                              ⟨283652⟩
            v3038 = 4552                                                                              ⟨283653⟩
            v3038 = 4568                                                                              ⟨283654⟩
            v3038 = 4584                                                                              ⟨283655⟩
            v3038 = 4604                                                                              ⟨283656⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3038, v2967, v2965, v2963, v2961, 0, &v2990)        ⟨283666⟩
        Scene_Tick(scène=scène2)                                                                      ⟨283698⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=1, premier=0, nombre=256)                           ⟨283732⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨283737⟩
si byte_495FC != 0 :
    v144 = 0                                                                                          ⟨283770⟩
    v139 = 0                                                                                          ⟨283771⟩
    v138 = 0                                                                                          ⟨283772⟩
    v123 = 0                                                                                          ⟨283795⟩
    v122 = 0                                                                                          ⟨283796⟩
    v107 = 0                                                                                          ⟨283819⟩
    v106 = 0                                                                                          ⟨283820⟩
    v97 = 0                                                                                           ⟨283838⟩
    v96 = 0                                                                                           ⟨283839⟩
    v87 = 0                                                                                           ⟨283857⟩
    v86 = 0                                                                                           ⟨283858⟩
    v77 = 0                                                                                           ⟨283876⟩
    v76 = 0                                                                                           ⟨283877⟩
    v67 = 0                                                                                           ⟨283895⟩
    v66 = 0                                                                                           ⟨283896⟩
    v57 = 0                                                                                           ⟨283914⟩
    v56 = 0                                                                                           ⟨283915⟩
    v47 = 0                                                                                           ⟨283933⟩
    v46 = 0                                                                                           ⟨283934⟩
    voix_arrête(voix=voix1)                                                                           ⟨283938⟩
    v2918 = 0                                                                                         ⟨283956⟩
    v2913 = 0                                                                                         ⟨283957⟩
    v2912 = 0                                                                                         ⟨283958⟩
    canal_arrête(canal=canal2)                                                                        ⟨283961⟩
    v844 = 0                                                                                          ⟨283979⟩
    v839 = 0                                                                                          ⟨283980⟩
    v838 = 0                                                                                          ⟨283981⟩
    v35 = 0                                                                                           ⟨284004⟩
    v34 = 0                                                                                           ⟨284005⟩
    retour                                                                                            ⟨284047⟩

──── scène3 ────
scène3 = Scene_Create(cadence=10, palette=255, surface=&v340)                                         ⟨284057⟩
c7 = Layer(ressource=mid16 0, x=0, y=0)                                                               ⟨284064⟩
c8 = Layer(ressource=mid16 2, x=0, y=0)                                                               ⟨284072⟩
si = c8                                                                                               ⟨284074⟩
palette_copie(destination=pal1, source=pal2(mid16 6))                                                 ⟨284082⟩
ajoute c7 à scène3                                                                                    ⟨284087⟩
ajoute c8 à scène3                                                                                    ⟨284092⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨284104⟩
si v13 != 0 :
    charge(asoundfx 29)                                                                               ⟨284128⟩
    canal_init(canal=canal3, pilote=word_46849)                                                       ⟨284133⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 29, x=0)                                        ⟨284140⟩
    v178 = word_48EDC                                                                                 ⟨284143⟩
    v180 = 0                                                                                          ⟨284144⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3038)                                        ⟨284150⟩
        AIL_set_relative_volume_30C66(canal3.+0→4, v3038, v178, v180)                                 ⟨284157⟩
si v12 != 0 :
    Scene_Tick(scène=scène3)                                                                          ⟨284171⟩
    charge(mid16voc 7)                                                                                ⟨284183⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 7)                                 ⟨284189⟩
    di = 0                                                                                            ⟨284191⟩
    tant que di < 8 :
        Scene_Tick(scène=scène3)                                                                      ⟨284198⟩
        di = di + 1                                                                                   ⟨284200⟩
    c8.image = 1                                                                                      ⟨284205⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨284209⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        CRT_Rand()                                                                                    ⟨284215⟩
        c8.image = ((CRT_Rand()·3) / 32768) + 1                                                       ⟨284224⟩
        Scene_Tick(scène=scène3)                                                                      ⟨284237⟩
    c8.image = 0                                                                                      ⟨284249⟩
    v198 = 2                                                                                          ⟨284251⟩
    v197 = 0                                                                                          ⟨284252⟩
    charge(mid16voc 8)                                                                                ⟨284260⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 8)                                 ⟨284266⟩
    di = 0                                                                                            ⟨284268⟩
    tant que di < 10 :
        Scene_Tick(scène=scène3)                                                                      ⟨284275⟩
        di = di + 1                                                                                   ⟨284277⟩
    c8.image = 1                                                                                      ⟨284282⟩
    di = 0                                                                                            ⟨284283⟩
    tant que di < 2 :
        Scene_Tick(scène=scène3)                                                                      ⟨284290⟩
        di = di + 1                                                                                   ⟨284292⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨284300⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        CRT_Rand()                                                                                    ⟨284306⟩
        v204 = ((CRT_Rand()·3) / 32768) + 1                                                           ⟨284313⟩
        c8.image = v204                                                                               ⟨284315⟩
        Scene_Tick(scène=scène3)                                                                      ⟨284328⟩
    c8.image = 1                                                                                      ⟨284340⟩
    di = 0                                                                                            ⟨284341⟩
    tant que di < 12 :
        Scene_Tick(scène=scène3)                                                                      ⟨284348⟩
        di = di + 1                                                                                   ⟨284350⟩
    voix_arrête(voix=voix1)                                                                           ⟨284357⟩
    v197 = 0                                                                                          ⟨284376⟩
sinon :
    Widget_Method_DispatchC_314CB(zone1, 0)                                                           ⟨284404⟩
    Widget_Method_Dispatch8_314A9(zone1, 203)                                                         ⟨284409⟩
    v6 = 45                                                                                           ⟨284411⟩
    v2 = scène3.compteur                                                                              ⟨284413⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨284422⟩
    tant que (scène3.compteur < v4) et (scène3.terminée == 0) :
        di = scène3.compteur                                                                          ⟨284427⟩
        si v2 + 6 == scène3.compteur :
            c8.image = 1                                                                              ⟨284432⟩
        si v2 + 12 == scène3.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[8])                              ⟨284446⟩
        si v2 + 12 < scène3.compteur :
            si v2 + 20 > scène3.compteur :
                CRT_Rand()                                                                            ⟨284458⟩
                c8.image = ((CRT_Rand()·3) / 32768) + 1                                               ⟨284467⟩
        si v4 - 5 < scène3.compteur :
            c8.image = 1                                                                              ⟨284475⟩
        si v4 - 1 == scène3.compteur :
            v3052 = 4540                                                                              ⟨284482⟩
            v3052 = 4552                                                                              ⟨284483⟩
            v3052 = 4568                                                                              ⟨284484⟩
            v3052 = 4584                                                                              ⟨284485⟩
            v3052 = 4604                                                                              ⟨284486⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3052, v2967, v2965, v2963, v2961, 0, &v2990)        ⟨284496⟩
        Scene_Tick(scène=scène3)                                                                      ⟨284528⟩
    v6 = 105                                                                                          ⟨284555⟩
    v2 = scène3.compteur                                                                              ⟨284557⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨284566⟩
    tant que (scène3.compteur < v4) et (scène3.terminée == 0) :
        di = scène3.compteur                                                                          ⟨284571⟩
        si v2 + 2 == scène3.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[9])                              ⟨284584⟩
        si v2 + 2 < scène3.compteur :
            si v2 + 65 > scène3.compteur :
                CRT_Rand()                                                                            ⟨284596⟩
                c8.image = ((CRT_Rand()·3) / 32768) + 1                                               ⟨284605⟩
        si v4 - 25 < scène3.compteur :
            c8.image = 0                                                                              ⟨284613⟩
        si v4 - 1 == scène3.compteur :
            v3052 = 4540                                                                              ⟨284620⟩
            v3052 = 4552                                                                              ⟨284621⟩
            v3052 = 4568                                                                              ⟨284622⟩
            v3052 = 4584                                                                              ⟨284623⟩
            v3052 = 4604                                                                              ⟨284624⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3052, v2967, v2965, v2963, v2961, 0, &v2990)        ⟨284634⟩
        Scene_Tick(scène=scène3)                                                                      ⟨284666⟩
    v6 = 50                                                                                           ⟨284693⟩
    v2 = scène3.compteur                                                                              ⟨284695⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨284704⟩
    tant que (scène3.compteur < v4) et (scène3.terminée == 0) :
        di = scène3.compteur                                                                          ⟨284709⟩
        si v2 + 2 == scène3.compteur :
            sous_titre (sub_C8F5, non lue)(zone=zone1, texte=textes1[10])                             ⟨284722⟩
        si v2 + 6 < scène3.compteur :
            si v2 + 25 > scène3.compteur :
                CRT_Rand()                                                                            ⟨284734⟩
                c8.image = ((CRT_Rand()·3) / 32768) + 1                                               ⟨284743⟩
        si v4 - 10 < scène3.compteur :
            c8.image = 1                                                                              ⟨284751⟩
        si v4 - 1 == scène3.compteur :
            v3052 = 4540                                                                              ⟨284758⟩
            v3052 = 4552                                                                              ⟨284759⟩
            v3052 = 4568                                                                              ⟨284760⟩
            v3052 = 4584                                                                              ⟨284761⟩
            v3052 = 4604                                                                              ⟨284762⟩
            Primitive_SetRectColorAndDraw_2CBE5(&v3052, v2967, v2965, v2963, v2961, 0, &v2990)        ⟨284772⟩
        Scene_Tick(scène=scène3)                                                                      ⟨284804⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=2, premier=0, nombre=256)                           ⟨284838⟩
canal_arrête(canal=canal3)                                                                            ⟨284842⟩
v3036 = 0                                                                                             ⟨284860⟩
v3031 = 0                                                                                             ⟨284861⟩
v3030 = 0                                                                                             ⟨284862⟩
v170 = 0                                                                                              ⟨284881⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨284885⟩
v144 = 0                                                                                              ⟨284912⟩
v139 = 0                                                                                              ⟨284913⟩
v138 = 0                                                                                              ⟨284914⟩
v123 = 0                                                                                              ⟨284937⟩
v122 = 0                                                                                              ⟨284938⟩
v107 = 0                                                                                              ⟨284961⟩
v106 = 0                                                                                              ⟨284962⟩
v97 = 0                                                                                               ⟨284980⟩
v96 = 0                                                                                               ⟨284981⟩
v87 = 0                                                                                               ⟨284999⟩
v86 = 0                                                                                               ⟨285000⟩
v77 = 0                                                                                               ⟨285018⟩
v76 = 0                                                                                               ⟨285019⟩
v67 = 0                                                                                               ⟨285037⟩
v66 = 0                                                                                               ⟨285038⟩
v57 = 0                                                                                               ⟨285056⟩
v56 = 0                                                                                               ⟨285057⟩
v47 = 0                                                                                               ⟨285075⟩
v46 = 0                                                                                               ⟨285076⟩
voix_arrête(voix=voix1)                                                                               ⟨285080⟩
v2918 = 0                                                                                             ⟨285098⟩
v2913 = 0                                                                                             ⟨285099⟩
v2912 = 0                                                                                             ⟨285100⟩
canal_arrête(canal=canal2)                                                                            ⟨285103⟩
v844 = 0                                                                                              ⟨285121⟩
v839 = 0                                                                                              ⟨285122⟩
v838 = 0                                                                                              ⟨285123⟩
v35 = 0                                                                                               ⟨285146⟩
v34 = 0                                                                                               ⟨285147⟩
retour                                                                                                ⟨285189⟩
```

## Tableaux du segment de données

