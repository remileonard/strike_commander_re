# Note — Attaque au sol de l'IA : l'original et le portage `SCAIBrain` (2026-09-25)

Cette note résume ce que fait l'original pour l'attaque au sol, puis explique pourquoi `SCAIBrain::updateGroundAttack` n'arrive pas à bombarder. Le détail de l'assembleur, avec les citations, est dans `AI_TICK_CALL_GRAPH.md`, section « L'attaque au sol ». Toutes les valeurs sont en unités réelles : mètres, secondes, degrés.

## 1. Symptôme observé (Rémi, en jeu)

L'IA passe les phases 1 et 2 et atteint la phase 3, mais ne lâche pas ses bombes. Ensuite, elle alterne en permanence entre les phases 0 et 1 et tourne autour de l'objectif sans jamais l'atteindre.

## 2. Comment l'original mène une attaque au sol

### Déclenchement

- L'attaque est un **nœud de comportement permanent** du pilote (`entité+0xD9`), créé au chargement du profil.
- Ordre « détruire la cible » avec une cible de mission au sol (`target_type == 2`) : `Goal_ExecuteAction_A8AC` appelle `GroundAttack_CanEngage_77000`, puis `GroundAttack_Start_7709A`.
- **Condition d'engagement** : une arme air-sol est chargée (identifiants 3 à 8 : AGM-65D, LAU-3, MK-20, MK-82, identifiant 7, GBU-15). **Le canon n'en fait pas partie.**
- Une fois démarré, le nœud devient le comportement en cours de l'entité (`Behavior_PushRunning_756A4`). À chaque tick, seule sa machine à états tourne (`GroundAttack_PhaseDispatch_77215`).
- Un minuteur de **2 s** tourne pendant l'approche. À échéance, l'attaque s'arrête (`Behavior_PopFinished_75612`), puis redémarre au tick suivant avec les mêmes règles.

### Point visé

C'est toujours **la position de la cible relevée de 1000 m**.

### Les phases

On note `hd` la distance horizontale au point visé, et `a` l'angle horizontal entre le nez et le vecteur « point visé → moi ». `a` proche de 180° veut dire que le nez pointe vers la cible.

| Phase | Fonction | Comportement |
|---|---|---|
| 0 — s'éloigner | `GroundAttack_Phase01_Approach_77282` | vole en s'éloignant du point visé |
| 1 — revenir | idem | vole vers le point visé |
| 2 — passage au pilote auto | `GroundAttack_Phase2_EngageAutopilot_775B1` | un seul tick : écrit le point visé et active le pilote automatique physique |
| 3 — largage | `GroundAttack_Phase3_WeaponRelease_776FB` | choix de l'arme, puis tir |
| 4 — dégagement | `GroundAttack_Phase4_PullUp_77171` | pilote auto coupé, cabré à +5°, fin quand l'arme larguée a disparu |

**Transitions des phases 0 et 1, dans l'ordre du code :**
1. `a < 170°` et `hd < 5000` → phase 0 ;
2. sinon, `a > 170°` et `hd < 5000` → **mettre les ailes à plat** (roulis 0°, zone morte 5°) ; quand `|roulis| < 5°` → **phase 2** ;
3. sinon, **`hd > 8000` OU `a > 170°`** → phase 1 ;
4. sinon, pas de changement : entre 5000 et 8000 m sans être aligné, l'avion **reste** dans sa phase.

**Pilotage en phases 0 et 1 :**
- vitesse de croisière du profil (`JDYN+0x84`), pas plein gaz ;
- `a > 169°` et `hd > 9000` → palier (tangage 0°) ;
- sinon, en phase 1, si `a > 169°` et que l'avion est **plus de 2000 m au-dessus du point visé** → piqué à **−40°**. Les piqués de plus de 15° se font sur le dos, en tirant (`AI_PitchController_7B20`).

**Phases 2 et 3, le pilote automatique physique :**
- `PhysicsTicks` appelle `Guidance_HomingVelocityUpdate` et **saute toute l'aérodynamique** : pas de forces, pas de moments, pas d'intégration.
- L'orientation du nez et la vitesse sont **écrites directement** : l'avion devient un objet cinématique qui file vers le point visé, **sans zone morte**.
- Si la cible est mobile, le point visé est recalculé à chaque tick.
- Si l'avion passe le point sans tirer, le pilote automatique pose un drapeau, et la phase 3 repart en phase 0 pour une nouvelle passe.

**Choix de l'arme (une seule fois), par ordre de priorité :** AGM-65D, GBU-15, MK-20, MK-82, identifiant 7, LAU-3. Si aucune n'est disponible, l'attaque se termine.

**Règles de tir :**
- **Bombes (MK-20, MK-82)** : tir si `raté ≤ 20 + |vitesse| × dt + (150 si (rand() & 15) > AG)`, où `raté` est la distance **horizontale** entre le point d'impact prédit et la cible. La tolérance fait donc environ 30 m, sauf quand le tirage AG échoue.
- **LAU-3** : tir 3 s après l'entrée en phase 3.
- **GBU-15** : tir si `nez · direction(cible) > cos(vitesse_de_virage × t)`, avec `t = distance / vitesse du lanceur`. La vitesse de virage est le word `+0x61` du chunk `DATA` du modèle. Le cône autorisé grandit avec le temps de vol.
- **AGM-65D** : test non lu.

## 3. Pourquoi le portage échoue

### Cause 1 — la boucle entre les phases 0 et 1 : condition inversée (certaine)

`SCAIBrain.cpp`, ligne 771 :
```cpp
} else if (horizontal_distance > 8000.0f || !aligned) {   // FAUX
    ground_phase = 1;
```
L'original passe en phase 1 quand l'avion est **loin OU aligné** (`cmp [bp+var_4], 1F4000h` puis `cmp [bp+var_16], 0AA00h` dans `GroundAttack_Phase01_Approach_77282`). Avec `!aligned`, l'avion refait demi-tour dès qu'il sort du cercle de 5000 m. Il revient non aligné à cause de son rayon de virage, repasse en phase 0, et ainsi de suite : il reste en orbite vers 5000 m.

**Correction :**
```cpp
} else if (horizontal_distance > 8000.0f || aligned) {
    ground_phase = 1;
}
```

### Cause 2 — pas de largage en phase 3 : l'avion ne passe pas assez près de la cible (probable)

- La tolérance de largage est d'environ **30 m**, en distance horizontale, donc latérale comprise.
- En phase 3, le portage pilote encore par écarts d'attitude, avec une **zone morte de 2°** (`SetAttitudeError(..., 2.0f)`, ligne 788). À 5000 m, 2° de cap donnent environ **175 m** de décalage latéral : l'impact prédit longe la cible sans jamais passer à moins de 30 m.
- L'original aligne le nez exactement sur le point visé à chaque tick (pilote automatique cinématique). Son impact prédit passe donc pratiquement sur la cible.

**À vérifier d'abord** : ajouter au log `ground attack phase=3` la composante **latérale** du raté, perpendiculaire à la route. Si elle reste au-dessus de 30 m pendant tout le passage, la cause est confirmée.

**Corrections possibles :**
- **fidèle** : en phases 2 et 3, imposer directement la direction du nez et la vitesse vers le point visé, sans passer par le pilote ;
- **intermédiaire** : garder le pilote, mais avec une zone morte nulle en phases 2 et 3.

### Écarts mineurs (à corriger ensuite)

| Portage | Original |
|---|---|
| Passage en phase 2 quand l'écart de cap est inférieur à 5° | passage quand les **ailes sont à plat** (`|roulis| < 5°`) |
| — | piqué à −40° en phase 1 quand l'avion est plus de 2000 m au-dessus du point visé |
| Retour de la phase 3 en phase 0 quand l'angle passe sous 90° | retour sur le drapeau « point atteint » du pilote automatique (l'angle reste un substitut acceptable) |
| Vitesse plein gaz (−60) | vitesse de croisière du profil (`JDYN+0x84`) |
| Garde anti-sol (pas de piqué sous 1000 m) | absente de l'original |

## 4. Correction plus générale, qui touche `SCPilot`

Les commandes bas niveau de l'IA ne commandent **pas un cap** :
- `AI_RollToAngleCmd_8104` (ex-`AI_TurnToHeadingCmd`) commande un **angle de roulis**. Son contrôleur `AI_RollController_7E56` écrit l'axe de roulis du manche (`+0x23`).
- `AI_PitchToAngleCmd_7E18` (ex-`AI_TurnToBearingCmd`) commande un **angle de tangage**. Son contrôleur `AI_PitchController_7B20` écrit l'axe de tangage (`+0x1F`).

Le virage vers une direction passe par `AI_GuidanceCmd_FromOwnPos` → `AI_GuidanceSolution_Major`. Cette dernière est **à relire** : sa lecture est antérieure à la découverte de l'inversion des noms sinus / cosinus.

## 5. Questions ouvertes

- **`BombModel_PredictImpact_41311`** (point d'impact des bombes) : la formule balistique est lue, mais la hauteur utilisée vaut, d'après l'appelant, l'altitude de la cible et non la hauteur de chute. Non tranché : ne pas porter cette formule tant que ce n'est pas clarifié. Le portage peut garder sa propre simulation de trajectoire.
- Loi exacte du pilote automatique (`Guidance_HomingVelocityUpdate`) : taux de virage maximum, rampe de vitesse, suivi du relief. On ne sait pas non plus où la position est intégrée dans ce mode.
- Test de verrouillage de l'AGM-65D (fonction pas encore nommée, `loc_42F71`).
- Champ `+0x13` du nœud d'attaque, qui peut bloquer l'engagement.
