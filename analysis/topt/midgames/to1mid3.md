# Script extrait de `sub_7C1D0` (topt)

Généré par `tools/midgame_extract.py` : pseudo-code obtenu par exécution symbolique de la fonction.
Valeurs de l'exécutable, sans correction. ⟨n⟩ = ligne de `source/topttst1.asm`.
Lignes « asm: » = instructions non traduites.

## sub_7C1D0

```
bp = sp                                                                                               ⟨229648⟩
v1 = 0                                                                                                ⟨229652⟩
v3 = 0                                                                                                ⟨229654⟩
v14 = 0                                                                                               ⟨229655⟩
v9 = 0                                                                                                ⟨229657⟩
v8 = 0                                                                                                ⟨229658⟩
v16 = byte_4CA58                                                                                      ⟨229660⟩
si v16 - 1 <= 4 :
    si (v16 - 1)·2 == 0 ou ((v16 - 1)·2 != 2) et (((v16 - 1)·2 != 4) et (((v16 - 1)·2 != 6) et ((v16 - 1)·2 != 8))) :
        si sub_993C(chemin1) != 0 :
            pak rsoundfx.ouvre(chemin1, 1)                                                            ⟨229704⟩
            flux_iff(flux=flux1)                                                                      ⟨229718⟩
            v663 = 256                                                                                ⟨229721⟩
            v667 = 0                                                                                  ⟨229722⟩
            flux1.ouvre(chemin1, 1)                                                                   ⟨229730⟩
            iff_form(flux=flux1, balise='VOLU', x=0)                                                  ⟨229736⟩
            iff_chunk(flux=flux1, balise='MT32', x=1)                                                 ⟨229742⟩
            iff_lit_mot(flux=flux1)                                                                   ⟨229746⟩
            word_4F048 = iff_lit_mot(flux=flux1)                                                      ⟨229748⟩
            si = 1                                                                                    ⟨229749⟩
            tant que si <= 106 :
                iff_lit_mot(flux=flux1)                                                               ⟨229755⟩
                ds:26002[si·2] = iff_lit_mot(flux=flux1)                                              ⟨229759⟩
                si = si + 1                                                                           ⟨229760⟩
            iff_ferme_form(flux=flux1)                                                                ⟨229767⟩
            v3 = 1                                                                                    ⟨229769⟩
            iff_ferme_form(flux=flux1)                                                                ⟨229773⟩
        si sub_993C(chemin1) != 0 :
            v1 = 1                                                                                    ⟨229799⟩
            si v3 == 0 :
                word_4F048 = 90                                                                       ⟨229804⟩
    sinon :
        si sub_993C(chemin1) != 0 :
            si word_4CA5D != 0 :
                pak asoundfx.ouvre(chemin1, 1)                                                        ⟨229841⟩
                flux_iff(flux=flux1)                                                                  ⟨229855⟩
                v663 = 256                                                                            ⟨229858⟩
                v667 = 0                                                                              ⟨229859⟩
                flux1.ouvre(chemin1, 1)                                                               ⟨229867⟩
                iff_form(flux=flux1, balise='VOLU', x=0)                                              ⟨229873⟩
                iff_chunk(flux=flux1, balise='ADLB', x=1)                                             ⟨229879⟩
                iff_lit_mot(flux=flux1)                                                               ⟨229883⟩
                word_4F048 = iff_lit_mot(flux=flux1)                                                  ⟨229885⟩
                si = 1                                                                                ⟨229886⟩
                tant que si <= 106 :
                    iff_lit_mot(flux=flux1)                                                           ⟨229892⟩
                    ds:26002[si·2] = iff_lit_mot(flux=flux1)                                          ⟨229896⟩
                    si = si + 1                                                                       ⟨229897⟩
                iff_ferme_form(flux=flux1)                                                            ⟨229904⟩
                v3 = 1                                                                                ⟨229906⟩
                iff_ferme_form(flux=flux1)                                                            ⟨229910⟩
        si sub_993C(chemin1) != 0 :
            v1 = 1                                                                                    ⟨229953⟩
            si v3 == 0 :
                word_4F048 = 255                                                                      ⟨229958⟩
v320 = 436                                                                                            ⟨229964⟩
v318 = word_4D392                                                                                     ⟨229966⟩
word_4D392 = &v320                                                                                    ⟨229968⟩
v320 = 444                                                                                            ⟨229969⟩
v324 = 0                                                                                              ⟨229972⟩
si v1 != 0 :
    si 0 != 0 :
        v89 = 6                                                                                       ⟨229985⟩
    sinon :
        v89 = 6                                                                                       ⟨229989⟩
    charge(mmusic v89)                                                                                ⟨230000⟩
    canal_init(canal=canal1, pilote=word_4CA59)                                                       ⟨230005⟩
    canal_enregistre(canal=canal1, ressource=mmusic v89, x=0)                                         ⟨230012⟩
word_4F048 = 255                                                                                      ⟨230021⟩
Speech_LoadBank_2DA0B(chemin1, 12)                                                                    ⟨230049⟩
v18 = word_4D36E                                                                                      ⟨230052⟩
v338 = 0                                                                                              ⟨230053⟩
TextFormat_ApplyStyleAttribute_357D1(&v338, v18)                                                      ⟨230058⟩
v352 = 0                                                                                              ⟨230060⟩
TextRenderer_ApplyFormatChange_3584E(&v352, 0)                                                        ⟨230069⟩
sub_3499B(&v22, &v352)                                                                                ⟨230075⟩
palette_alloue(palette=pal1, premier=0, nombre=256)                                                   ⟨230081⟩
charge(to1mid3 0)                                                                                     ⟨230134⟩
charge(to1mid3 1)                                                                                     ⟨230146⟩
charge(to1mid3 2)                                                                                     ⟨230158⟩
charge(optshps 43)                                                                                    ⟨230170⟩
charge(to1mid3 3)                                                                                     ⟨230182⟩
palette_depuis(pal2(to1mid3 3))                                                                       ⟨230189⟩

──── scène1 ────
scène1 = Scene_Create(cadence=15, palette=255, surface=&v338)                                         ⟨230197⟩
c1 = MovingLayer(ressource=to1mid3 0, x=0, y=0)                                                       ⟨230210⟩
c1.vx = 0                                                                                             ⟨230217⟩
c1.vy = 0                                                                                             ⟨230219⟩
c2 = MovingLayer(ressource=to1mid3 1, x=0, y=0)                                                       ⟨230239⟩
c2.vx = 0                                                                                             ⟨230246⟩
c2.vy = 0                                                                                             ⟨230248⟩
c3 = MovingLayer(ressource=to1mid3 2, x=0, y=0)                                                       ⟨230268⟩
c3.vx = 0                                                                                             ⟨230275⟩
c3.vy = 0                                                                                             ⟨230277⟩
c4 = Layer(ressource=optshps 43, x=0, y=0)                                                            ⟨230291⟩
palette_copie(destination=pal1, source=pal2(to1mid3 3))                                               ⟨230301⟩
palette_envoie(palette=pal1, pas=0)                                                                   ⟨230313⟩
ajoute c4 à scène1                                                                                    ⟨230318⟩
Scene_Tick(scène=scène1)                                                                              ⟨230322⟩
si = 0                                                                                                ⟨230324⟩
tant que si < 7 :
    Scene_Tick(scène=scène1)                                                                          ⟨230330⟩
    si = si + 1                                                                                       ⟨230332⟩
ajoute c1 à scène1                                                                                    ⟨230340⟩
si = 0                                                                                                ⟨230342⟩
tant que si < 11 :
    v102 = si                                                                                         ⟨230346⟩
    c1.image = v102                                                                                   ⟨230348⟩
    Scene_Tick(scène=scène1)                                                                          ⟨230351⟩
    si = si + 1                                                                                       ⟨230353⟩
c1.image = 10                                                                                         ⟨230358⟩
si = 0                                                                                                ⟨230359⟩
tant que si < 60 :
    Scene_Tick(scène=scène1)                                                                          ⟨230365⟩
    si = si + 1                                                                                       ⟨230367⟩
si = 10                                                                                               ⟨230372⟩
tant que si > -20 :
    v104 = si                                                                                         ⟨230376⟩
    c1.image = v104                                                                                   ⟨230378⟩
    Scene_Tick(scène=scène1)                                                                          ⟨230381⟩
    si = si - 1                                                                                       ⟨230383⟩
scène1.compteur = 0                                                                                   ⟨230388⟩
ajoute c2 à scène1                                                                                    ⟨230392⟩
si = 0                                                                                                ⟨230394⟩
tant que si < 10 :
    v106 = si                                                                                         ⟨230398⟩
    c2.image = v106                                                                                   ⟨230401⟩
    Scene_Tick(scène=scène1)                                                                          ⟨230404⟩
    si = si + 1                                                                                       ⟨230406⟩
c2.image = 9                                                                                          ⟨230412⟩
si = 0                                                                                                ⟨230413⟩
tant que si < 60 :
    Scene_Tick(scène=scène1)                                                                          ⟨230419⟩
    si = si + 1                                                                                       ⟨230421⟩
si = 9                                                                                                ⟨230426⟩
tant que si > -5 :
    v108 = si                                                                                         ⟨230430⟩
    c2.image = v108                                                                                   ⟨230433⟩
    Scene_Tick(scène=scène1)                                                                          ⟨230436⟩
    si = si - 1                                                                                       ⟨230438⟩
scène1.compteur = 0                                                                                   ⟨230443⟩
ajoute c3 à scène1                                                                                    ⟨230447⟩
tant que (scène1.compteur < 75) et (scène1.terminée == 0) :
    v110 = si                                                                                         ⟨230452⟩
    c3.image = v110                                                                                   ⟨230455⟩
    si = si + 1                                                                                       ⟨230456⟩
    si word_4F048 < 1 :
        word_4F048 = 0                                                                                ⟨230459⟩
    sinon :
        word_4F048 = word_4F048 - (si + 1)                                                            ⟨230463⟩
    Scene_Tick(scène=scène1)                                                                          ⟨230468⟩
Scene_Destruct(scène=scène1, drapeaux=0)                                                              ⟨230491⟩
sub_2DA30()                                                                                           ⟨230493⟩
v77 = 0                                                                                               ⟨230514⟩
v76 = 0                                                                                               ⟨230515⟩
v67 = 0                                                                                               ⟨230532⟩
v66 = 0                                                                                               ⟨230533⟩
v57 = 0                                                                                               ⟨230550⟩
v56 = 0                                                                                               ⟨230551⟩
v47 = 0                                                                                               ⟨230568⟩
v46 = 0                                                                                               ⟨230569⟩
v37 = 0                                                                                               ⟨230586⟩
v36 = 0                                                                                               ⟨230587⟩
canal_arrête(canal=canal1)                                                                            ⟨230616⟩
sub_5C1C(&v320, 2)                                                                                    ⟨230621⟩
v9 = 0                                                                                                ⟨230644⟩
v8 = 0                                                                                                ⟨230645⟩
retour                                                                                                ⟨230649⟩
```

## Tableaux du segment de données

