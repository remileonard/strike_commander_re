# Script extrait de `MidgameTO2_Play_7ACD0` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## MidgameTO2_Play_7ACD0

```
bp = sp                                                                                               ⟨227708⟩
v2 = word_4D36E                                                                                       ⟨227713⟩
v116 = 0                                                                                              ⟨227714⟩
TextFormat_ApplyStyleAttribute_357D1(&v116, v2)                                                       ⟨227719⟩
v130 = 0                                                                                              ⟨227721⟩
TextRenderer_ApplyFormatChange_3584E(&v130, 0)                                                        ⟨227730⟩
sub_3499B(&v6, &v130)                                                                                 ⟨227736⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨227742⟩
v16 = 0                                                                                               ⟨227748⟩
charge(to1mid2 0)                                                                                     ⟨227778⟩
charge(to1mid2 1)                                                                                     ⟨227790⟩
palette_depuis(pal2(to1mid2 1))                                                                       ⟨227797⟩

──── scène1 ────
scène1 = Scene_Create(cadence=20, palette=255, surface=&v116)                                         ⟨227805⟩
c1 = ImageLayer(ressource=to1mid2 0, x=0, y=0, image=0)                                               ⟨227813⟩
di = c1                                                                                               ⟨227815⟩
palette_copie(destination=pal1, source=pal2(to1mid2 1))                                               ⟨227823⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨227835⟩
ajoute c1 à scène1                                                                                    ⟨227840⟩
si = 0                                                                                                ⟨227842⟩
tant que (scène1.compteur < 62) et (scène1.terminée == 0) :
    v44 = si                                                                                          ⟨227846⟩
    c1.image = v44                                                                                    ⟨227848⟩
    si = si + 1                                                                                       ⟨227849⟩
    Scene_Tick(scène=scène1)                                                                          ⟨227852⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨227875⟩
v30 = 0                                                                                               ⟨227898⟩
v20 = 0                                                                                               ⟨227916⟩
v20 = 0                                                                                               ⟨227920⟩
charge(to1mid2 2)                                                                                     ⟨227927⟩
v30 = 0                                                                                               ⟨227932⟩
charge(to1mid2 5)                                                                                     ⟨227939⟩
v39 = 0                                                                                               ⟨227941⟩
palette_depuis(pal2(to1mid2 5))                                                                       ⟨227946⟩

──── scène2 ────
scène2 = Scene_Create(cadence=20, palette=255, surface=&v116)                                         ⟨227954⟩
c2 = ImageLayer(ressource=to1mid2 2, x=0, y=0, image=0)                                               ⟨227962⟩
di = c2                                                                                               ⟨227964⟩
palette_copie(destination=pal1, source=pal2(to1mid2 5))                                               ⟨227972⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨227980⟩
ajoute c2 à scène2                                                                                    ⟨227985⟩
si = 0                                                                                                ⟨227987⟩
tant que (scène2.compteur < 15) et (scène2.terminée == 0) :
    v44 = si                                                                                          ⟨227991⟩
    c2.image = v44                                                                                    ⟨227993⟩
    si = si + 1                                                                                       ⟨227994⟩
    Scene_Tick(scène=scène2)                                                                          ⟨227997⟩
Scene_Destruct(scène=scène2, drapeaux=0)                                                              ⟨228020⟩
v30 = 0                                                                                               ⟨228043⟩
v20 = 0                                                                                               ⟨228061⟩
v20 = 0                                                                                               ⟨228065⟩
charge(to1mid2 6)                                                                                     ⟨228072⟩
v30 = 0                                                                                               ⟨228077⟩
charge(to1mid2 8)                                                                                     ⟨228084⟩
v39 = 0                                                                                               ⟨228086⟩
palette_depuis(pal2(to1mid2 8))                                                                       ⟨228091⟩
palette_copie(destination=pal1, source=pal2(to1mid2 8))                                               ⟨228100⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨228108⟩
dessine_image(surface=surface1, x=0, y=27, données=données(to1mid2 6.+0), image=0)                    ⟨228125⟩
Path_BuildWithFolder_11166(h1, "OBJECTS", "EJECT", ".PAK")                                            ⟨228152⟩
pak_vide()→0.méthode20(h1, 1)                                                                         ⟨228159⟩
tableau_objets(objets1 : 3 objets de 10 octets)                                                       ⟨228168⟩
v58 = 0                                                                                               ⟨228170⟩
v54 = 2                                                                                               ⟨228171⟩
v53 = 0                                                                                               ⟨228172⟩
v52 = 0                                                                                               ⟨228173⟩
v59 = 1                                                                                               ⟨228174⟩
di = 0                                                                                                ⟨228175⟩
tant que di < 3 :
    IndexedRecordReader_AdvanceIndex_436B6(pak_vide(), di + 5)                                        ⟨228183⟩
    v64 = ax                                                                                          ⟨228199⟩
    Memory_TypedFreeWrapper_32871(27668, v64, 3, 0, 0)                                                ⟨228205⟩
    v66 = ?                                                                                           ⟨228207⟩
    v68 = Memory_TypedFreeWrapper_32871(27668, v64, 3, 0, 0)                                          ⟨228208⟩
    si = objets1[di]                                                                                  ⟨228216⟩
    objets1[di]→2 = v66                                                                               ⟨228217⟩
    objets1[di]→0 = v68                                                                               ⟨228218⟩
    ((di·10) + &objets1+4)→0 = 3                                                                      ⟨228225⟩
    ((di·10) + &objets1+5)→0 = 1                                                                      ⟨228232⟩
    ((di·10) + &objets1+6)→0 = 0                                                                      ⟨228239⟩
    ((di·10) + &objets1+6)→0 = v64                                                                    ⟨228247⟩
    si pak_vide()→109 & 192 == 192 :
        v59 = 0                                                                                       ⟨228257⟩
        aller à loc_7B345                                                                             ⟨228258⟩
    IndexedRecordReader_ReadEntryInto_43519(pak_vide(), di + 5, données(objets1[di]→0))               ⟨228287⟩
    di = di + 1                                                                                       ⟨228289⟩
loc_7B345:                                                                                            ⟨228296⟩

──── scène3 ────
scène3 = Scene_Create(cadence=20, palette=255, surface=surface1)                                      ⟨228303⟩
c3 = ImageLayer(ressource=objets1, x=0, y=0, image=0)                                                 ⟨228311⟩
ajoute c3 à scène3                                                                                    ⟨228317⟩
v80 = 0                                                                                               ⟨228320⟩
v74 = 175                                                                                             ⟨228323⟩
v90 = 0                                                                                               ⟨228324⟩
v86 = 2                                                                                               ⟨228325⟩
v85 = 0                                                                                               ⟨228326⟩
v84 = 0                                                                                               ⟨228327⟩
v94 = booléen                                                                                         ⟨228329⟩
v98 = booléen                                                                                         ⟨228330⟩
Memory_TypedFreeWrapper_32871(27668, 64000, 3, 0, 1)                                                  ⟨228336⟩
v100 = ?                                                                                              ⟨228338⟩
v102 = Memory_TypedFreeWrapper_32871(27668, 64000, 3, 0, 1)                                           ⟨228339⟩
v90 = v102                                                                                            ⟨228341⟩
v86 = 3                                                                                               ⟨228342⟩
v85 = 1                                                                                               ⟨228343⟩
v84 = 0                                                                                               ⟨228344⟩
v84 = -1536                                                                                           ⟨228345⟩
Surface_SaveRect_392F6(word_4D36E, données(v90), &v80)                                                ⟨228359⟩
dessine_image(surface=surface1, x=0, y=0, données=données(objets1.+0), image=0)                       ⟨228376⟩
v94 = 8                                                                                               ⟨228378⟩
attend(chronomètre=objet1)                                                                            ⟨228383⟩
Surface_RestoreRect_38CDA(word_4D36E, données(v90), &v80)                                             ⟨228398⟩
dessine_image(surface=surface1, x=0, y=0, données=données(objets1.+10), image=0)                      ⟨228415⟩
v94 = 8                                                                                               ⟨228417⟩
attend(chronomètre=objet1)                                                                            ⟨228422⟩
Surface_RestoreRect_38CDA(word_4D36E, données(v90), &v80)                                             ⟨228437⟩
dessine_image(surface=surface1, x=0, y=0, données=données(objets1.+20), image=0)                      ⟨228454⟩
v94 = 45                                                                                              ⟨228456⟩
attend(chronomètre=objet1)                                                                            ⟨228461⟩
v90 = 0                                                                                               ⟨228478⟩
v85 = 0                                                                                               ⟨228479⟩
v84 = 0                                                                                               ⟨228480⟩
Scene_Destruct(scène=scène3, drapeaux=0)                                                              ⟨228484⟩
v58 = 0                                                                                               ⟨228501⟩
v53 = 0                                                                                               ⟨228502⟩
v52 = 0                                                                                               ⟨228503⟩
CRT_Doprnt_Core(objets1, 10, 3, 1, sub_479E0)                                                         ⟨228511⟩
v30 = 0                                                                                               ⟨228534⟩
v20 = 0                                                                                               ⟨228552⟩
Path_BuildWithFolder_11166(h2, "OBJECTS", "EJECT", ".PAK")                                            ⟨228582⟩
pak_vide()→0.méthode20(h2, 1)                                                                         ⟨228589⟩
Path_BuildWithFolder_11166(h3, "OBJECTS", "EJECT", ".PAK")                                            ⟨228612⟩
pak_vide()→0.méthode20(h3, 1)                                                                         ⟨228619⟩
charge(to1mid2 7)                                                                                     ⟨228631⟩
v48 = 0                                                                                               ⟨228633⟩
v44 = 2                                                                                               ⟨228634⟩
v43 = 0                                                                                               ⟨228635⟩
pal2(to1mid2 8).+0 = 0                                                                                ⟨228636⟩
IndexedRecordReader_AdvanceIndex_436B6(pak_vide(), 2)                                                 ⟨228639⟩
v52 = ax                                                                                              ⟨228655⟩
Memory_TypedFreeWrapper_32871(27668, v52, 3, 0, 0)                                                    ⟨228661⟩
v54 = ?                                                                                               ⟨228663⟩
v56 = Memory_TypedFreeWrapper_32871(27668, v52, 3, 0, 0)                                              ⟨228664⟩
v48 = v56                                                                                             ⟨228666⟩
v44 = 3                                                                                               ⟨228667⟩
v43 = 1                                                                                               ⟨228668⟩
pal2(to1mid2 8).+0 = 0                                                                                ⟨228669⟩
si v48 != 0 :
    IndexedRecordReader_ReadEntryInto_43519(pak_vide(), 2, données(v48))                              ⟨228686⟩
si v48 != 0 :
    v57 = 1                                                                                           ⟨228692⟩
sinon :
    v57 = 0                                                                                           ⟨228696⟩
tableau_objets(objets2 : 5 objets de 10 octets)                                                       ⟨228706⟩
di = 0                                                                                                ⟨228708⟩
tant que di < 5 :
    IndexedRecordReader_AdvanceIndex_436B6(pak_vide(), di)                                            ⟨228714⟩
    v62 = ax                                                                                          ⟨228730⟩
    Memory_TypedFreeWrapper_32871(27668, v62, 3, 0, 0)                                                ⟨228736⟩
    v64 = ?                                                                                           ⟨228738⟩
    v66 = Memory_TypedFreeWrapper_32871(27668, v62, 3, 0, 0)                                          ⟨228739⟩
    si = objets2[di]                                                                                  ⟨228747⟩
    objets2[di]→2 = v64                                                                               ⟨228748⟩
    objets2[di]→0 = v66                                                                               ⟨228749⟩
    ((di·10) + &objets2+4)→0 = 3                                                                      ⟨228756⟩
    ((di·10) + &objets2+5)→0 = 1                                                                      ⟨228763⟩
    ((di·10) + &objets2+6)→0 = 0                                                                      ⟨228770⟩
    ((di·10) + &objets2+6)→0 = v62                                                                    ⟨228778⟩
    si pak_vide()→109 & 192 == 192 :
        v57 = 0                                                                                       ⟨228788⟩
        aller à loc_7B933                                                                             ⟨228789⟩
    IndexedRecordReader_ReadEntryInto_43519(pak_vide(), di, données(objets2[di]→0))                   ⟨228816⟩
    di = di + 1                                                                                       ⟨228818⟩
loc_7B933:                                                                                            ⟨228825⟩
v70 = booléen                                                                                         ⟨228827⟩
v74 = booléen                                                                                         ⟨228828⟩
dessine_image(surface=surface1, x=0, y=27, données=données(to1mid2 7.+0), image=0)                    ⟨228844⟩
dessine_image(surface=surface1, x=0, y=0, données=données(v48), image=0)                              ⟨228861⟩
v70 = 6                                                                                               ⟨228863⟩
attend(chronomètre=objet2)                                                                            ⟨228868⟩
dessine_image(surface=surface1, x=0, y=0, données=données(objets2.+0), image=0)                       ⟨228885⟩
v70 = 6                                                                                               ⟨228887⟩
attend(chronomètre=objet2)                                                                            ⟨228892⟩
dessine_image(surface=surface1, x=0, y=0, données=données(objets2.+10), image=0)                      ⟨228909⟩
v70 = 6                                                                                               ⟨228911⟩
attend(chronomètre=objet2)                                                                            ⟨228916⟩
dessine_image(surface=surface1, x=0, y=0, données=données(objets2.+20), image=0)                      ⟨228933⟩
v70 = 6                                                                                               ⟨228935⟩
attend(chronomètre=objet2)                                                                            ⟨228940⟩
dessine_image(surface=surface1, x=0, y=0, données=données(objets2.+30), image=0)                      ⟨228957⟩
v70 = 6                                                                                               ⟨228959⟩
attend(chronomètre=objet2)                                                                            ⟨228964⟩
dessine_image(surface=surface1, x=0, y=0, données=données(objets2.+40), image=0)                      ⟨228981⟩
v70 = 35                                                                                              ⟨228983⟩
attend(chronomètre=objet2)                                                                            ⟨228988⟩
CRT_Doprnt_Core(objets2, 10, 5, 1, sub_479E0)                                                         ⟨228997⟩
v48 = 0                                                                                               ⟨229014⟩
v43 = 0                                                                                               ⟨229015⟩
pal2(to1mid2 8).+0 = 0                                                                                ⟨229016⟩
v20 = 0                                                                                               ⟨229038⟩
charge(to1mid2 4)                                                                                     ⟨229045⟩
charge(to1mid2 5)                                                                                     ⟨229057⟩
v39 = 0                                                                                               ⟨229059⟩
palette_depuis(pal2(to1mid2 5))                                                                       ⟨229064⟩

──── scène4 ────
scène4 = Scene_Create(cadence=20, palette=255, surface=surface1)                                      ⟨229072⟩
c4 = OverlayImageLayer(ressource=to1mid2 4, x=0, y=-27, image=0)                                      ⟨229080⟩
di = c4                                                                                               ⟨229082⟩
palette_copie(destination=pal1, source=pal2(to1mid2 5))                                               ⟨229090⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨229098⟩
ajoute c4 à scène4                                                                                    ⟨229103⟩
si = 0                                                                                                ⟨229105⟩
tant que (scène4.compteur < 28) et (scène4.terminée == 0) :
    v44 = si                                                                                          ⟨229109⟩
    c4.image = v44                                                                                    ⟨229111⟩
    si = si + 1                                                                                       ⟨229112⟩
    Scene_Tick(scène=scène4)                                                                          ⟨229115⟩
fondu_disparition(palette=pal1, couleur=&v16, pas=3, premier=0, nombre=256)                           ⟨229142⟩
Scene_Destruct(scène=scène4, drapeaux=0)                                                              ⟨229147⟩
v30 = 0                                                                                               ⟨229170⟩
v20 = 0                                                                                               ⟨229188⟩
v20 = 0                                                                                               ⟨229192⟩
v30 = 0                                                                                               ⟨229196⟩
flux_iff(flux=flux1)                                                                                  ⟨229209⟩
flux1.ouvre(chemin1, 1)                                                                               ⟨229221⟩
iff_form(flux=flux1, balise=dword_4B119, x=0)                                                         ⟨229227⟩
iff_form(flux=flux1, balise=dword_4B11E, x=0)                                                         ⟨229233⟩
iff_chunk(flux=flux1, balise=dword_4B123, x=0)                                                        ⟨229239⟩
v52 = v434                                                                                            ⟨229242⟩
Memory_TypedFreeWrapper_32871(27668, v52, 2, 0, 1)                                                    ⟨229248⟩
v54 = ?                                                                                               ⟨229250⟩
v56 = Memory_TypedFreeWrapper_32871(27668, v52, 2, 0, 1)                                              ⟨229251⟩
v31 = 1                                                                                               ⟨229255⟩
v30 = 0                                                                                               ⟨229256⟩
v30 = v52                                                                                             ⟨229258⟩
ResourceRecord_ReadDwordFieldB_42B12(flux1, données(v56))                                             ⟨229271⟩
v447 = v430                                                                                           ⟨229274⟩
iff_ferme(flux=flux1)                                                                                 ⟨229277⟩
iff_form(flux=flux1, balise=dword_4B128, x=0)                                                         ⟨229283⟩
iff_chunk(flux=flux1, balise=dword_4B12D, x=0)                                                        ⟨229289⟩
v60 = v434                                                                                            ⟨229292⟩
Memory_TypedFreeWrapper_32871(27668, v60, 2, 0, 1)                                                    ⟨229298⟩
v62 = ?                                                                                               ⟨229300⟩
v64 = Memory_TypedFreeWrapper_32871(27668, v60, 2, 0, 1)                                              ⟨229301⟩
v21 = 1                                                                                               ⟨229305⟩
v20 = 0                                                                                               ⟨229306⟩
v20 = v60                                                                                             ⟨229308⟩
ResourceRecord_ReadDwordFieldB_42B12(flux1, données(v64))                                             ⟨229321⟩
iff_ferme_form(flux=flux1)                                                                            ⟨229325⟩
iff_ferme_form(flux=flux1)                                                                            ⟨229330⟩
palette_depuis(pal3(to1mid2 5))                                                                       ⟨229345⟩
palette_copie(destination=pal1, source=pal3(to1mid2 5))                                               ⟨229354⟩
palette_alloue(palette=pal4, premier=0, nombre=256)                                                   ⟨229360⟩
palette_remplit(palette=pal4, couleur=&v40, premier=v52, nombre=pal4.+0)                              ⟨229369⟩
palette_envoie(palette=pal4, pas=0)                                                                   ⟨229381⟩
GlyphObject_ConstructWithBuffer_36D56(&scène4+10, to1mid2 4)                                          ⟨229391⟩
zone_texte(zone=zone1, police=0)                                                                      ⟨229397⟩
v48 = word_4D36E                                                                                      ⟨229400⟩
TextFormat_ApplyStyleAttribute_357D1(&objets2+2, v48)                                                 ⟨229404⟩
Widget_ComputeBoundsExtent_372DC(zone1, 160, 97)                                                      ⟨229413⟩
texte_formaté(zone=zone1, format=10066)                                                               ⟨229418⟩
fondu_apparition(palette=pal1, couleur=&v40, pas=2, premier=0, nombre=256)                            ⟨229427⟩
vide_entrées()                                                                                        ⟨229429⟩
v52 = booléen                                                                                         ⟨229431⟩
v56_avant = v56                                                                                       ⟨229432⟩
v56 = booléen                                                                                         ⟨229432⟩
v52 = 300                                                                                             ⟨229433⟩
v57 = 0                                                                                               ⟨229436⟩
tant que booléen == 0 :
    v57 = 0                                                                                           ⟨229440⟩
    si touche_passer() != 0 : aller à loc_7C0C6                                                       ⟨229443⟩
si v57 != 0 : aller à loc_7C095                                                                       ⟨229462⟩
loc_7C0C6:                                                                                            ⟨229464⟩
fondu_disparition(palette=pal1, couleur=&v40, pas=2, premier=0, nombre=256)                           ⟨229472⟩
v30 = 0                                                                                               ⟨229508⟩
v20 = 0                                                                                               ⟨229526⟩
retour                                                                                                ⟨229551⟩
```

## Tableaux du segment de données

