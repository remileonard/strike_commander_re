# Script extrait de `Midgame16_Play_8E910` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## Midgame16_Play_8E910

```
bp = sp                                                                                               ⟨257394⟩
tableau_textes(tableau=textes1, nombre=11, longueur=200)                                              ⟨257403⟩
byte_4F55C = 0                                                                                        ⟨257405⟩
v11 = 0                                                                                               ⟨257406⟩
v12 = 0                                                                                               ⟨257407⟩
v13 = 0                                                                                               ⟨257408⟩
si word_4CA5B != 0 :
    v12 = 1                                                                                           ⟨257411⟩
v16 = word_4D36E                                                                                      ⟨257415⟩
v324 = 0                                                                                              ⟨257416⟩
TextFormat_ApplyStyleAttribute_357D1(&v324, v16)                                                      ⟨257421⟩
v338 = 0                                                                                              ⟨257423⟩
TextRenderer_ApplyFormatChange_3584E(&v338, 0)                                                        ⟨257432⟩
sub_3499B(&v20, &v338)                                                                                ⟨257438⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨257444⟩
v30 = 0                                                                                               ⟨257450⟩
sub_435F1(pak mid16)                                                                                  ⟨257472⟩
sub_435F1(pak midgames)                                                                               ⟨257493⟩
si v12 != 0 :
    si sub_993C(chemin1) != 0 :
        pak mid16voc.ouvre(chemin1, 1)                                                                ⟨257524⟩
        sub_435F1(pak mid16voc)                                                                       ⟨257528⟩
    sinon :
        v12 = 0                                                                                       ⟨257533⟩
sinon :
    v12 = 0                                                                                           ⟨257533⟩
v40 = 0                                                                                               ⟨257536⟩
v35 = 0                                                                                               ⟨257538⟩
v34 = 0                                                                                               ⟨257539⟩
v42 = byte_4CA58                                                                                      ⟨257541⟩
si v42 - 1 <= 4 :
    si (v42 - 1)·2 == 0 ou ((v42 - 1)·2 != 2) et (((v42 - 1)·2 != 4) et (((v42 - 1)·2 != 6) et ((v42 - 1)·2 != 8))) :
        si sub_993C(chemin1) != 0 :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨257585⟩
            sub_435F1(pak rsoundfx)                                                                   ⟨257589⟩
            flux_iff(flux=flux1)                                                                      ⟨257603⟩
            v3047 = 256                                                                               ⟨257606⟩
            v3051 = 0                                                                                 ⟨257607⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨257615⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨257621⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨257627⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨257631⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨257633⟩
            si = 1                                                                                    ⟨257634⟩
            tant que si <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨257640⟩
                ds:26002[si·2] = iff_lit_mot(flux=flux1)                                              ⟨257644⟩
                si = si + 1                                                                           ⟨257645⟩
            iff_ferme_form(flux=flux1)                                                                ⟨257652⟩
            v13 = 1                                                                                   ⟨257654⟩
            iff_ferme_form(flux=flux1)                                                                ⟨257658⟩
        si sub_993C(chemin1) != 0 :
            v11 = 1                                                                                   ⟨257684⟩
            si v13 == 0 :
                word_4F048 = 90                                                                       ⟨257689⟩
    sinon :
        si sub_993C(chemin1) != 0 :
            si word_4CA5D != 0 :
                pak asoundfx.ouvre(chemin1, 1)                                                        ⟨257726⟩
                sub_435F1(pak asoundfx)                                                               ⟨257730⟩
                flux_iff(flux=flux1)                                                                  ⟨257744⟩
                v3047 = 256                                                                           ⟨257747⟩
                v3051 = 0                                                                             ⟨257748⟩
                flux1.ouvre(chemin1, 1)                                                               ⟨257756⟩
                iff_form(flux=flux1, balise='VOLU', x=0)                                              ⟨257762⟩
                iff_chunk(flux=flux1, balise='ADLB', x=1)                                             ⟨257768⟩
                iff_lit_mot(flux=flux1)                                                               ⟨257772⟩
                word_4F048 = iff_lit_mot(flux=flux1)                                                  ⟨257774⟩
                si = 1                                                                                ⟨257775⟩
                tant que si <= 106 :
                    iff_lit_mot(flux=flux1)                                                           ⟨257781⟩
                    ds:26002[si·2] = iff_lit_mot(flux=flux1)                                          ⟨257785⟩
                    si = si + 1                                                                       ⟨257786⟩
                iff_ferme_form(flux=flux1)                                                            ⟨257793⟩
                v13 = 1                                                                               ⟨257795⟩
                iff_ferme_form(flux=flux1)                                                            ⟨257799⟩
        si sub_993C(chemin1) != 0 :
            v11 = 1                                                                                   ⟨257842⟩
            si v13 == 0 :
                word_4F048 = 255                                                                      ⟨257847⟩
si v13 != 0 :
    v2984 = word_4D392                                                                                ⟨257860⟩
    word_4D392 = &v2986                                                                               ⟨257862⟩
    canal_init(canal=canal1, pilote=word_4CA5D)                                                       ⟨257871⟩
    charge(asoundfx 29)                                                                               ⟨257883⟩
    canal_enregistre(canal=canal1, ressource=asoundfx 29, x=0)                                        ⟨257890⟩
    canal_arrête(canal=canal1)                                                                        ⟨257894⟩
    v152 = 0                                                                                          ⟨257913⟩
    canal_arrête(canal=canal1)                                                                        ⟨257916⟩
    sub_5C1C(&v2986, 2)                                                                               ⟨257921⟩
v828 = 436                                                                                            ⟨257925⟩
v826 = word_4D392                                                                                     ⟨257927⟩
word_4D392 = &v828                                                                                    ⟨257929⟩
v828 = 444                                                                                            ⟨257930⟩
v832 = 0                                                                                              ⟨257933⟩
si v11 != 0 :
    sub_435F1(pak mmusic)                                                                             ⟨257949⟩
    si v12 != 0 :
        v149 = 12                                                                                     ⟨257953⟩
    sinon :
        v149 = 11                                                                                     ⟨257957⟩
    charge(mmusic v149)                                                                               ⟨257968⟩
    canal_init(canal=canal2, pilote=word_4CA59)                                                       ⟨257973⟩
    canal_enregistre(canal=canal2, ressource=mmusic v149, x=0)                                        ⟨257980⟩
    v152 = word_4F048                                                                                 ⟨257983⟩
    v154 = 0                                                                                          ⟨257984⟩
    si canal2.+0 != 0 :
        AIL_start_sequence(pilote=canal2.+0→4, séquence=v830)                                         ⟨257990⟩
        sub_50F5(canal2.+0→4, v830, v152, v154)                                                       ⟨257997⟩
v841 = booléen                                                                                        ⟨258017⟩
v837 = booléen                                                                                        ⟨258018⟩
si v12 != 0 :
    voix_pilote(voix=voix1, pilote=word_4CA5B)                                                        ⟨258024⟩
sinon :
    flux_iff(flux=flux1)                                                                              ⟨258041⟩
    v3047 = 256                                                                                       ⟨258044⟩
    v3051 = 0                                                                                         ⟨258045⟩
    flux1.ouvre(chemin1, 1)                                                                           ⟨258053⟩
    iff_form(flux=flux1, balise='MG16', x=0)                                                          ⟨258059⟩
    iff_form(flux=flux1, balise='DATA', x=0)                                                          ⟨258065⟩
    si = 0                                                                                            ⟨258067⟩
    tant que si < 11 :
        iff_chunk(flux=flux1, balise='TEXT', x=1)                                                     ⟨258075⟩
        di = v3030                                                                                    ⟨258077⟩
        iff_lit(flux=flux1, destination=textes1[0] + (textes1.+0·si), taille=v3030)                   ⟨258088⟩
        v3043 = v3026                                                                                 ⟨258091⟩
        si = si + 1                                                                                   ⟨258092⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨258099⟩
    iff_ferme_form(flux=flux1)                                                                        ⟨258104⟩
charge(mid16 5)                                                                                       ⟨258123⟩
charge(mid16 4)                                                                                       ⟨258135⟩
charge(mid16 3)                                                                                       ⟨258147⟩
charge(mid16 1)                                                                                       ⟨258159⟩
charge(mid16 0)                                                                                       ⟨258171⟩
charge(mid16 2)                                                                                       ⟨258183⟩
charge(mid16 6)                                                                                       ⟨258195⟩
palette_depuis(pal2(mid16 6))                                                                         ⟨258202⟩
charge(mid16 7)                                                                                       ⟨258214⟩
palette_depuis(pal3(mid16 7))                                                                         ⟨258221⟩
v144 = 0                                                                                              ⟨258223⟩
v140 = 2                                                                                              ⟨258224⟩
v139 = 0                                                                                              ⟨258225⟩
v138 = 0                                                                                              ⟨258226⟩
TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                       ⟨258240⟩
v146 = ?                                                                                              ⟨258242⟩
v148 = TextRenderer_LoadResourceFile_437A9(chemin1, 2)                                                ⟨258243⟩
v144 = v148                                                                                           ⟨258245⟩
v140 = 2                                                                                              ⟨258246⟩
v139 = 1                                                                                              ⟨258247⟩
v138 = 0                                                                                              ⟨258248⟩
GlyphObject_ConstructWithBuffer_36D56(&v2942, &v144)                                                  ⟨258253⟩
sub_30A1D(&v2976, word_4D36E, &v2942)                                                                 ⟨258265⟩
Widget_Method_DispatchC_37052(&v2976, 0)                                                              ⟨258270⟩
Widget_Method_Dispatch8_37030(&v2976, 200)                                                            ⟨258275⟩
si byte_4F55C != 0 :
    v144 = 0                                                                                          ⟨258306⟩
    v139 = 0                                                                                          ⟨258307⟩
    v138 = 0                                                                                          ⟨258308⟩
    v123 = 0                                                                                          ⟨258329⟩
    v122 = 0                                                                                          ⟨258330⟩
    v107 = 0                                                                                          ⟨258351⟩
    v106 = 0                                                                                          ⟨258352⟩
    v97 = 0                                                                                           ⟨258369⟩
    v96 = 0                                                                                           ⟨258370⟩
    v87 = 0                                                                                           ⟨258387⟩
    v86 = 0                                                                                           ⟨258388⟩
    v77 = 0                                                                                           ⟨258405⟩
    v76 = 0                                                                                           ⟨258406⟩
    v67 = 0                                                                                           ⟨258423⟩
    v66 = 0                                                                                           ⟨258424⟩
    v57 = 0                                                                                           ⟨258441⟩
    v56 = 0                                                                                           ⟨258442⟩
    v47 = 0                                                                                           ⟨258459⟩
    v46 = 0                                                                                           ⟨258460⟩
    voix_arrête(voix=voix1)                                                                           ⟨258464⟩
    v2902 = 0                                                                                         ⟨258481⟩
    v2897 = 0                                                                                         ⟨258482⟩
    v2896 = 0                                                                                         ⟨258483⟩
    canal_arrête(canal=canal2)                                                                        ⟨258486⟩
    sub_5C1C(&v828, 2)                                                                                ⟨258491⟩
    v35 = 0                                                                                           ⟨258514⟩
    v34 = 0                                                                                           ⟨258515⟩
    retour                                                                                            ⟨258555⟩
v152 = 0                                                                                              ⟨258561⟩
charge(midgames 1)                                                                                    ⟨258568⟩
charge(midgames 2)                                                                                    ⟨258580⟩
palette_depuis(pal4(midgames 2))                                                                      ⟨258587⟩

──── scène1 ────
scène1 = Scene_Create(cadence=10, palette=255, surface=&v324)                                         ⟨258595⟩
c1 = ImageLayer(ressource=midgames 1, x=0, y=0, image=0)                                              ⟨258603⟩
c2 = ImageLayer(ressource=midgames 1, x=0, y=0, image=1)                                              ⟨258612⟩
palette_copie(destination=pal1, source=pal3(mid16 7))                                                 ⟨258622⟩
palette_copie(destination=pal1, source=pal4(midgames 2))                                              ⟨258631⟩
ajoute c1 à scène1                                                                                    ⟨258636⟩
ajoute c2 à scène1                                                                                    ⟨258641⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=0, premier=0, nombre=256)                           ⟨258654⟩
palette_copie(destination=pal1, source=pal3(mid16 7))                                                 ⟨258663⟩
palette_copie(destination=pal1, source=pal4(midgames 2))                                              ⟨258672⟩
Scene_Tick(scène=scène1)                                                                              ⟨258676⟩
fondu_apparition(palette=pal1, couleur=&v30, pas=2, premier=0, nombre=256)                            ⟨258685⟩
v6 = 25                                                                                               ⟨258687⟩
v2 = scène1.compteur                                                                                  ⟨258689⟩
v4 = v2 + ((v6·70) / 100)                                                                             ⟨258698⟩
tant que (scène1.compteur < v4) et (scène1.terminée == 0) :
    Scene_Tick(scène=scène1)                                                                          ⟨258711⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=1, premier=0, nombre=256)                           ⟨258741⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨258746⟩
v162 = 0                                                                                              ⟨258769⟩
v152 = 0                                                                                              ⟨258787⟩
si byte_4F55C != 0 :
    v144 = 0                                                                                          ⟨258817⟩
    v139 = 0                                                                                          ⟨258818⟩
    v138 = 0                                                                                          ⟨258819⟩
    v123 = 0                                                                                          ⟨258840⟩
    v122 = 0                                                                                          ⟨258841⟩
    v107 = 0                                                                                          ⟨258862⟩
    v106 = 0                                                                                          ⟨258863⟩
    v97 = 0                                                                                           ⟨258880⟩
    v96 = 0                                                                                           ⟨258881⟩
    v87 = 0                                                                                           ⟨258898⟩
    v86 = 0                                                                                           ⟨258899⟩
    v77 = 0                                                                                           ⟨258916⟩
    v76 = 0                                                                                           ⟨258917⟩
    v67 = 0                                                                                           ⟨258934⟩
    v66 = 0                                                                                           ⟨258935⟩
    v57 = 0                                                                                           ⟨258952⟩
    v56 = 0                                                                                           ⟨258953⟩
    v47 = 0                                                                                           ⟨258970⟩
    v46 = 0                                                                                           ⟨258971⟩
    voix_arrête(voix=voix1)                                                                           ⟨258975⟩
    v2902 = 0                                                                                         ⟨258992⟩
    v2897 = 0                                                                                         ⟨258993⟩
    v2896 = 0                                                                                         ⟨258994⟩
    canal_arrête(canal=canal2)                                                                        ⟨258997⟩
    sub_5C1C(&v828, 2)                                                                                ⟨259002⟩
    v35 = 0                                                                                           ⟨259025⟩
    v34 = 0                                                                                           ⟨259026⟩
    retour                                                                                            ⟨259066⟩

──── scène2 ────
scène2 = Scene_Create(cadence=7, palette=255, surface=&v324)                                          ⟨259075⟩
c3 = OverlayImageLayer(ressource=mid16 5, x=0, y=-1, image=2)                                         ⟨259083⟩
si = c3                                                                                               ⟨259085⟩
c4 = OverlayImageLayer(ressource=mid16 4, x=0, y=-1, image=1)                                         ⟨259092⟩
c5 = OverlayImageLayer(ressource=mid16 3, x=0, y=-1, image=0)                                         ⟨259101⟩
c6 = Layer(ressource=mid16 1, x=0, y=0)                                                               ⟨259109⟩
palette_copie(destination=pal1, source=pal3(mid16 7))                                                 ⟨259119⟩
ajoute c6 à scène2                                                                                    ⟨259124⟩
ajoute c3 à scène2                                                                                    ⟨259129⟩
ajoute c5 à scène2                                                                                    ⟨259134⟩
ajoute c4 à scène2                                                                                    ⟨259139⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨259151⟩
v156 = 1                                                                                              ⟨259153⟩
si v12 != 0 :
    Scene_Tick(scène=scène2)                                                                          ⟨259161⟩
    charge(mid16voc 0)                                                                                ⟨259173⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 0)                                 ⟨259179⟩
    di = 0                                                                                            ⟨259181⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨259187⟩
        di = di + 1                                                                                   ⟨259189⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨259197⟩
    di = 0                                                                                            ⟨259199⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 4 :
            c3.image = 1                                                                              ⟨259205⟩
        si di == 10 :
            c3.image = 2                                                                              ⟨259210⟩
        si di == 11 :
            c3.image = 1                                                                              ⟨259215⟩
        si di == 12 :
            c3.image = 2                                                                              ⟨259220⟩
        di = di + 1                                                                                   ⟨259224⟩
        si di == 16 :
            c3.image = 1                                                                              ⟨259227⟩
        Scene_Tick(scène=scène2)                                                                      ⟨259239⟩
    charge(mid16voc 1)                                                                                ⟨259261⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 1)                                 ⟨259267⟩
    di = 0                                                                                            ⟨259269⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨259275⟩
        di = di + 1                                                                                   ⟨259277⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨259285⟩
    di = 0                                                                                            ⟨259287⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 4 :
            c3.image = 2                                                                              ⟨259293⟩
        si di == 16 :
            c3.image = 1                                                                              ⟨259298⟩
        si di == 18 :
            c3.image = 2                                                                              ⟨259303⟩
        di = di + 1                                                                                   ⟨259307⟩
        si di == 22 :
            c3.image = 1                                                                              ⟨259310⟩
        Scene_Tick(scène=scène2)                                                                      ⟨259322⟩
    charge(mid16voc 2)                                                                                ⟨259344⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 2)                                 ⟨259350⟩
    di = 0                                                                                            ⟨259352⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨259358⟩
        di = di + 1                                                                                   ⟨259360⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨259368⟩
    di = 0                                                                                            ⟨259370⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 8 :
            c3.image = 2                                                                              ⟨259376⟩
        di = di + 1                                                                                   ⟨259380⟩
        si di == 16 :
            c4.image = 2                                                                              ⟨259384⟩
        Scene_Tick(scène=scène2)                                                                      ⟨259396⟩
    charge(mid16voc 3)                                                                                ⟨259418⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 3)                                 ⟨259424⟩
    di = 0                                                                                            ⟨259426⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨259432⟩
        di = di + 1                                                                                   ⟨259434⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨259442⟩
    di = 0                                                                                            ⟨259444⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 4 :
            c3.image = 1                                                                              ⟨259450⟩
        si di == 23 :
            c3.image = 2                                                                              ⟨259455⟩
        si di == 24 :
            c3.image = 1                                                                              ⟨259460⟩
        di = di + 1                                                                                   ⟨259464⟩
        si di == 25 :
            c3.image = 2                                                                              ⟨259467⟩
        Scene_Tick(scène=scène2)                                                                      ⟨259479⟩
    charge(mid16voc 4)                                                                                ⟨259501⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 4)                                 ⟨259507⟩
    di = 0                                                                                            ⟨259509⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨259515⟩
        di = di + 1                                                                                   ⟨259517⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨259525⟩
    di = 0                                                                                            ⟨259527⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di == 4 :
            c3.image = 1                                                                              ⟨259533⟩
        si di == 14 :
            c3.image = 2                                                                              ⟨259538⟩
        si di == 24 :
            c4.image = 1                                                                              ⟨259544⟩
        di = di + 1                                                                                   ⟨259548⟩
        si di == 26 :
            c3.image = 1                                                                              ⟨259551⟩
        Scene_Tick(scène=scène2)                                                                      ⟨259563⟩
    charge(mid16voc 5)                                                                                ⟨259585⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 5)                                 ⟨259591⟩
    di = 0                                                                                            ⟨259593⟩
    tant que di < 6 :
        Scene_Tick(scène=scène2)                                                                      ⟨259599⟩
        di = di + 1                                                                                   ⟨259601⟩
    c4.image = 2                                                                                      ⟨259607⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨259611⟩
    di = 0                                                                                            ⟨259613⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        si di > 6 :
            si di < 12 :
                si di & 1 != 0 :
                    v218 = v156                                                                       ⟨259624⟩
                    c5.image = v218                                                                   ⟨259627⟩
                    si v156 < 3 :
                        v156 = v156 + 1                                                               ⟨259630⟩
        si di > 14 :
            si di < 18 :
                si v156 > 1 :
                    v156 = v156 - 1                                                                   ⟨259639⟩
                v220 = v156                                                                           ⟨259643⟩
                c5.image = v220                                                                       ⟨259646⟩
        di = di + 1                                                                                   ⟨259649⟩
        Scene_Tick(scène=scène2)                                                                      ⟨259659⟩
    c4.image = 1                                                                                      ⟨259673⟩
    di = 0                                                                                            ⟨259674⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨259680⟩
        di = di + 1                                                                                   ⟨259682⟩
    charge(mid16voc 6)                                                                                ⟨259697⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 6)                                 ⟨259703⟩
    di = 0                                                                                            ⟨259705⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨259711⟩
        di = di + 1                                                                                   ⟨259713⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨259721⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        Scene_Tick(scène=scène2)                                                                      ⟨259735⟩
    di = 0                                                                                            ⟨259747⟩
    tant que di < 8 :
        Scene_Tick(scène=scène2)                                                                      ⟨259753⟩
        di = di + 1                                                                                   ⟨259755⟩
    c3.image = 2                                                                                      ⟨259760⟩
    di = 0                                                                                            ⟨259761⟩
    tant que di < 4 :
        Scene_Tick(scène=scène2)                                                                      ⟨259767⟩
        di = di + 1                                                                                   ⟨259769⟩
    voix_arrête(voix=voix1)                                                                           ⟨259776⟩
    v225 = 0                                                                                          ⟨259794⟩
    v224 = 0                                                                                          ⟨259795⟩
    v211 = 0                                                                                          ⟨259812⟩
    v210 = 0                                                                                          ⟨259813⟩
    v201 = 0                                                                                          ⟨259830⟩
    v200 = 0                                                                                          ⟨259831⟩
    v191 = 0                                                                                          ⟨259848⟩
    v190 = 0                                                                                          ⟨259849⟩
    v181 = 0                                                                                          ⟨259866⟩
    v180 = 0                                                                                          ⟨259867⟩
    v170 = 0                                                                                          ⟨259885⟩
    v160 = 0                                                                                          ⟨259903⟩
sinon :
    Widget_Method_DispatchC_37052(&v2976, 0)                                                          ⟨259910⟩
    Widget_Method_Dispatch8_37030(&v2976, 1)                                                          ⟨259915⟩
    v6 = 48                                                                                           ⟨259917⟩
    v2 = scène2.compteur                                                                              ⟨259919⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨259928⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨259932⟩
        si v2 + 8 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[0])                             ⟨259940⟩
        si v2 + 4 == scène2.compteur :
            c3.image = 1                                                                              ⟨259948⟩
        si v2 + 12 == scène2.compteur :
            c3.image = 2                                                                              ⟨259955⟩
        si v2 + 16 == scène2.compteur :
            c3.image = 1                                                                              ⟨259962⟩
        si v4 - 1 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨259972⟩
        Scene_Tick(scène=scène2)                                                                      ⟨259990⟩
    v6 = 32                                                                                           ⟨260014⟩
    v2 = scène2.compteur                                                                              ⟨260016⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨260025⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨260029⟩
        si v2 + 2 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[1])                             ⟨260039⟩
        si v2 + 4 == scène2.compteur :
            c3.image = 2                                                                              ⟨260047⟩
        si v2 + 16 == scène2.compteur :
            c3.image = 1                                                                              ⟨260054⟩
        si v2 + 18 == scène2.compteur :
            c3.image = 2                                                                              ⟨260061⟩
        si v2 + 22 == scène2.compteur :
            c3.image = 1                                                                              ⟨260068⟩
        si v4 - 1 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨260078⟩
        Scene_Tick(scène=scène2)                                                                      ⟨260096⟩
    v6 = 30                                                                                           ⟨260120⟩
    v2 = scène2.compteur                                                                              ⟨260122⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨260131⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨260135⟩
        si v2 + 2 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[2])                             ⟨260147⟩
        si v2 + 8 == scène2.compteur :
            c3.image = 2                                                                              ⟨260155⟩
        si v2 + 16 == scène2.compteur :
            c4.image = 2                                                                              ⟨260163⟩
        si v4 - 1 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨260173⟩
        Scene_Tick(scène=scène2)                                                                      ⟨260191⟩
    v6 = 78                                                                                           ⟨260215⟩
    v2 = scène2.compteur                                                                              ⟨260217⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨260226⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨260230⟩
        si v2 + 2 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[3])                             ⟨260243⟩
        si v2 + 4 == scène2.compteur :
            c3.image = 1                                                                              ⟨260251⟩
        si v2 + 24 == scène2.compteur :
            c3.image = 2                                                                              ⟨260258⟩
        si v2 + 36 == scène2.compteur :
            c3.image = 1                                                                              ⟨260265⟩
        si v2 + 38 == scène2.compteur :
            c3.image = 2                                                                              ⟨260272⟩
        si v2 + 44 == scène2.compteur :
            c3.image = 1                                                                              ⟨260279⟩
        si v4 - 1 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨260289⟩
        Scene_Tick(scène=scène2)                                                                      ⟨260307⟩
    v6 = 89                                                                                           ⟨260331⟩
    v2 = scène2.compteur                                                                              ⟨260333⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨260342⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨260346⟩
        si v2 + 2 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[4])                             ⟨260358⟩
        si v2 + 4 == scène2.compteur :
            c3.image = 1                                                                              ⟨260366⟩
        si v2 + 14 == scène2.compteur :
            c3.image = 2                                                                              ⟨260373⟩
        si v2 + 26 == scène2.compteur :
            c3.image = 1                                                                              ⟨260380⟩
        si v2 + 28 == scène2.compteur :
            c3.image = 2                                                                              ⟨260387⟩
        si v2 + 44 == scène2.compteur :
            c3.image = 1                                                                              ⟨260394⟩
        si v4 - 9 == scène2.compteur :
            c4.image = 1                                                                              ⟨260402⟩
        si v4 - 8 == scène2.compteur :
            c3.image = 2                                                                              ⟨260409⟩
        si v4 - 1 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨260419⟩
        Scene_Tick(scène=scène2)                                                                      ⟨260437⟩
    v6 = 58                                                                                           ⟨260461⟩
    v2 = scène2.compteur                                                                              ⟨260463⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨260472⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨260476⟩
        si v2 + 8 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[5])                             ⟨260489⟩
        si v2 + 6 == scène2.compteur :
            c3.image = 1                                                                              ⟨260497⟩
        si v4 - 3 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨260507⟩
        Scene_Tick(scène=scène2)                                                                      ⟨260525⟩
    Widget_Method_Dispatch8_37030(objet1, 2)                                                          ⟨260552⟩
    v6 = 54                                                                                           ⟨260554⟩
    v2 = scène2.compteur                                                                              ⟨260556⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨260565⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨260569⟩
        si v2 + 6 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[6])                             ⟨260582⟩
        si v2 + 10 == scène2.compteur :
            c4.image = 2                                                                              ⟨260591⟩
        si v2 + 26 == scène2.compteur :
            c4.image = 1                                                                              ⟨260599⟩
        si v2 + 12 < scène2.compteur :
            si v2 + 18 > scène2.compteur :
                si scène2.compteur & 1 != 0 :
                    c5.image = v156                                                                   ⟨260616⟩
                    si v156 < 3 :
                        v156_avant = v156                                                             ⟨260619⟩
                        v156_avant = v156                                                             ⟨260619⟩
                        v156 = v156 + 1                                                               ⟨260619⟩
        si v2 + 24 < scène2.compteur :
            si scène2.compteur & 1 != 0 :
                v160 = v156                                                                           ⟨260629⟩
                c5.image = v160                                                                       ⟨260632⟩
                si v156 > 1 :
                    v156 = v156 - 1                                                                   ⟨260635⟩
        si v4 - 10 == scène2.compteur :
            c4.image = 2                                                                              ⟨260643⟩
        si v4 - 1 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨260653⟩
        Scene_Tick(scène=scène2)                                                                      ⟨260671⟩
    v6 = 43                                                                                           ⟨260695⟩
    v2 = scène2.compteur                                                                              ⟨260697⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨260706⟩
    tant que (scène2.compteur < v4) et (scène2.terminée == 0) :
        di = scène2.compteur                                                                          ⟨260710⟩
        si v2 + 2 == scène2.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[7])                             ⟨260723⟩
        si v4 - 8 == scène2.compteur :
            c3.image = 2                                                                              ⟨260731⟩
        si v4 - 12 == scène2.compteur :
            c4.image = 1                                                                              ⟨260739⟩
        si v4 - 1 == scène2.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨260749⟩
        Scene_Tick(scène=scène2)                                                                      ⟨260767⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=1, premier=0, nombre=256)                           ⟨260798⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨260803⟩
si byte_4F55C != 0 :
    v144 = 0                                                                                          ⟨260834⟩
    v139 = 0                                                                                          ⟨260835⟩
    v138 = 0                                                                                          ⟨260836⟩
    v123 = 0                                                                                          ⟨260857⟩
    v122 = 0                                                                                          ⟨260858⟩
    v107 = 0                                                                                          ⟨260879⟩
    v106 = 0                                                                                          ⟨260880⟩
    v97 = 0                                                                                           ⟨260897⟩
    v96 = 0                                                                                           ⟨260898⟩
    v87 = 0                                                                                           ⟨260915⟩
    v86 = 0                                                                                           ⟨260916⟩
    v77 = 0                                                                                           ⟨260933⟩
    v76 = 0                                                                                           ⟨260934⟩
    v67 = 0                                                                                           ⟨260951⟩
    v66 = 0                                                                                           ⟨260952⟩
    v57 = 0                                                                                           ⟨260969⟩
    v56 = 0                                                                                           ⟨260970⟩
    v47 = 0                                                                                           ⟨260987⟩
    v46 = 0                                                                                           ⟨260988⟩
    voix_arrête(voix=voix1)                                                                           ⟨260992⟩
    v2902 = 0                                                                                         ⟨261009⟩
    v2897 = 0                                                                                         ⟨261010⟩
    v2896 = 0                                                                                         ⟨261011⟩
    canal_arrête(canal=canal2)                                                                        ⟨261014⟩
    sub_5C1C(&v828, 2)                                                                                ⟨261019⟩
    v35 = 0                                                                                           ⟨261042⟩
    v34 = 0                                                                                           ⟨261043⟩
    retour                                                                                            ⟨261083⟩

──── scène3 ────
scène3 = Scene_Create(cadence=10, palette=255, surface=&v324)                                         ⟨261092⟩
c7 = Layer(ressource=mid16 0, x=0, y=0)                                                               ⟨261099⟩
c8 = Layer(ressource=mid16 2, x=0, y=0)                                                               ⟨261107⟩
si = c8                                                                                               ⟨261109⟩
palette_copie(destination=pal1, source=pal2(mid16 6))                                                 ⟨261117⟩
ajoute c7 à scène3                                                                                    ⟨261122⟩
ajoute c8 à scène3                                                                                    ⟨261127⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨261139⟩
v3020 = 436                                                                                           ⟨261145⟩
v3018 = word_4D392                                                                                    ⟨261147⟩
word_4D392 = &v3020                                                                                   ⟨261149⟩
si v13 != 0 :
    charge(asoundfx 29)                                                                               ⟨261166⟩
    canal_init(canal=canal3, pilote=word_4CA5D)                                                       ⟨261171⟩
    canal_enregistre(canal=canal3, ressource=asoundfx 29, x=0)                                        ⟨261178⟩
    v162 = word_4EFAE                                                                                 ⟨261181⟩
    v164 = 0                                                                                          ⟨261182⟩
    si canal3.+0 != 0 :
        AIL_start_sequence(pilote=canal3.+0→4, séquence=v3022)                                        ⟨261188⟩
        sub_50F5(canal3.+0→4, v3022, v162, v164)                                                      ⟨261195⟩
si v12 != 0 :
    Scene_Tick(scène=scène3)                                                                          ⟨261207⟩
    charge(mid16voc 7)                                                                                ⟨261219⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 7)                                 ⟨261225⟩
    di = 0                                                                                            ⟨261227⟩
    tant que di < 8 :
        Scene_Tick(scène=scène3)                                                                      ⟨261233⟩
        di = di + 1                                                                                   ⟨261235⟩
    c8.image = 1                                                                                      ⟨261240⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨261244⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        CRT_Rand()                                                                                    ⟨261249⟩
        c8.image = ((CRT_Rand()·3) / 32768) + 1                                                       ⟨261258⟩
        Scene_Tick(scène=scène3)                                                                      ⟨261268⟩
    c8.image = 0                                                                                      ⟨261280⟩
    v182 = 2                                                                                          ⟨261282⟩
    v181 = 0                                                                                          ⟨261283⟩
    v180 = 0                                                                                          ⟨261284⟩
    charge(mid16voc 8)                                                                                ⟨261291⟩
    voix_charge (sub_7D11, non lue)(voix=voix1, ressource=mid16voc 8)                                 ⟨261297⟩
    di = 0                                                                                            ⟨261299⟩
    tant que di < 10 :
        Scene_Tick(scène=scène3)                                                                      ⟨261305⟩
        di = di + 1                                                                                   ⟨261307⟩
    c8.image = 1                                                                                      ⟨261312⟩
    di = 0                                                                                            ⟨261313⟩
    tant que di < 2 :
        Scene_Tick(scène=scène3)                                                                      ⟨261319⟩
        di = di + 1                                                                                   ⟨261321⟩
    voix_joue (sub_83FE, non lue)(voix=voix1, x=-1)                                                   ⟨261329⟩
    tant que voix_en_cours(voix=voix1) != 0 :
        CRT_Rand()                                                                                    ⟨261334⟩
        v188 = ((CRT_Rand()·3) / 32768) + 1                                                           ⟨261341⟩
        c8.image = v188                                                                               ⟨261343⟩
        Scene_Tick(scène=scène3)                                                                      ⟨261353⟩
    c8.image = 1                                                                                      ⟨261365⟩
    di = 0                                                                                            ⟨261366⟩
    tant que di < 12 :
        Scene_Tick(scène=scène3)                                                                      ⟨261372⟩
        di = di + 1                                                                                   ⟨261374⟩
    voix_arrête(voix=voix1)                                                                           ⟨261381⟩
    v181 = 0                                                                                          ⟨261399⟩
    v180 = 0                                                                                          ⟨261400⟩
sinon :
    Widget_Method_DispatchC_37052(objet1, 0)                                                          ⟨261425⟩
    Widget_Method_Dispatch8_37030(objet1, 203)                                                        ⟨261430⟩
    v6 = 45                                                                                           ⟨261432⟩
    v2 = scène3.compteur                                                                              ⟨261434⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨261443⟩
    tant que (scène3.compteur < v4) et (scène3.terminée == 0) :
        di = scène3.compteur                                                                          ⟨261447⟩
        si v2 + 6 == scène3.compteur :
            c8.image = 1                                                                              ⟨261452⟩
        si v2 + 12 == scène3.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[8])                             ⟨261466⟩
        si v2 + 12 < scène3.compteur :
            si v2 + 20 > scène3.compteur :
                CRT_Rand()                                                                            ⟨261478⟩
                c8.image = ((CRT_Rand()·3) / 32768) + 1                                               ⟨261487⟩
        si v4 - 5 < scène3.compteur :
            c8.image = 1                                                                              ⟨261494⟩
        si v4 - 1 == scène3.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨261504⟩
        Scene_Tick(scène=scène3)                                                                      ⟨261522⟩
    v6 = 105                                                                                          ⟨261546⟩
    v2 = scène3.compteur                                                                              ⟨261548⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨261557⟩
    tant que (scène3.compteur < v4) et (scène3.terminée == 0) :
        di = scène3.compteur                                                                          ⟨261561⟩
        si v2 + 2 == scène3.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[9])                             ⟨261574⟩
        si v2 + 2 < scène3.compteur :
            si v2 + 65 > scène3.compteur :
                CRT_Rand()                                                                            ⟨261586⟩
                c8.image = ((CRT_Rand()·3) / 32768) + 1                                               ⟨261595⟩
        si v4 - 25 < scène3.compteur :
            c8.image = 0                                                                              ⟨261602⟩
        si v4 - 1 == scène3.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨261612⟩
        Scene_Tick(scène=scène3)                                                                      ⟨261630⟩
    v6 = 50                                                                                           ⟨261654⟩
    v2 = scène3.compteur                                                                              ⟨261656⟩
    v4 = v2 + ((v6·70) / 100)                                                                         ⟨261665⟩
    tant que (scène3.compteur < v4) et (scène3.terminée == 0) :
        di = scène3.compteur                                                                          ⟨261669⟩
        si v2 + 2 == scène3.compteur :
            sous_titre (sub_C8F5, non lue)(zone=objet1, texte=textes1[10])                            ⟨261682⟩
        si v2 + 6 < scène3.compteur :
            si v2 + 25 > scène3.compteur :
                CRT_Rand()                                                                            ⟨261694⟩
                c8.image = ((CRT_Rand()·3) / 32768) + 1                                               ⟨261703⟩
        si v4 - 10 < scène3.compteur :
            c8.image = 1                                                                              ⟨261710⟩
        si v4 - 1 == scène3.compteur :
            sub_30AD0(objet1, 0)                                                                      ⟨261720⟩
        Scene_Tick(scène=scène3)                                                                      ⟨261738⟩
fondu_disparition(palette=pal1, couleur=&v30, pas=2, premier=0, nombre=256)                           ⟨261769⟩
canal_arrête(canal=canal3)                                                                            ⟨261773⟩
sub_5C1C(&v3020, 2)                                                                                   ⟨261778⟩
v154 = 0                                                                                              ⟨261797⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨261801⟩
v144 = 0                                                                                              ⟨261827⟩
v139 = 0                                                                                              ⟨261828⟩
v138 = 0                                                                                              ⟨261829⟩
v123 = 0                                                                                              ⟨261850⟩
v122 = 0                                                                                              ⟨261851⟩
v107 = 0                                                                                              ⟨261872⟩
v106 = 0                                                                                              ⟨261873⟩
v97 = 0                                                                                               ⟨261890⟩
v96 = 0                                                                                               ⟨261891⟩
v87 = 0                                                                                               ⟨261908⟩
v86 = 0                                                                                               ⟨261909⟩
v77 = 0                                                                                               ⟨261926⟩
v76 = 0                                                                                               ⟨261927⟩
v67 = 0                                                                                               ⟨261944⟩
v66 = 0                                                                                               ⟨261945⟩
v57 = 0                                                                                               ⟨261962⟩
v56 = 0                                                                                               ⟨261963⟩
v47 = 0                                                                                               ⟨261980⟩
v46 = 0                                                                                               ⟨261981⟩
voix_arrête(voix=voix1)                                                                               ⟨261985⟩
v2902 = 0                                                                                             ⟨262002⟩
v2897 = 0                                                                                             ⟨262003⟩
v2896 = 0                                                                                             ⟨262004⟩
canal_arrête(canal=canal2)                                                                            ⟨262007⟩
sub_5C1C(&v828, 2)                                                                                    ⟨262012⟩
v35 = 0                                                                                               ⟨262035⟩
v34 = 0                                                                                               ⟨262036⟩
retour                                                                                                ⟨262076⟩
```

## Tableaux du segment de données

