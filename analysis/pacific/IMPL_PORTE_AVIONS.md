# Porte-avions : départ et posé sur le pont (proposition pour libRealSpace)

Rédigé le 2026-11-13 à la demande de Rémi : dans `PRLH-M2` (« Raid on Taroa »), le joueur part du pont de l'USS
Enterprise ; libRealSpace le fait partir en l'air, sans vitesse, et l'avion tombe. **Proposition retenue par Rémi
(2026-11-13), notée seulement : le code n'est pas écrit ici.** Restent ouverts : le seuil de décollage (10 m au-dessus
du pont comme le jeu, ou 1 m comme `SCJetpPlane::checkStatus`) et la boîte du pont (boîte du modèle proposée).

Repère et unités : Y-up, mètres (libRealSpace). Valeurs de fichier en 24.8 : ÷ 256.

## 1. Les données

### 1.1 Le départ dans les missions

Dans 44 missions (toutes celles qui ont un porte-avions, sauf les missions d'entraînement `INST-*`), le joueur part **à l'arrêt** (vitesse 0 dans le `PART`), à
une altitude de 31 à 33 m, posé sur le pont d'un objet de classe `CARR`. `PRLH-M2` :

| Objet | Rôle | Position (x, y, z) | Cap | Vitesse |
|---|---|---|---|---|
| n°0 `CV-ENT` (`CARRIER`) | porte-avions | (155 000, 0, −155 000) | 180 | 0 |
| n°50 `PLAYER` (`F4F3`) | joueur | (155 000, 31, −155 205) | 180 | 0 |

Le porte-avions de `PRLH-M2` n'a pas d'ordre de déplacement (sa vitesse reste 0).

`PRLH-M1` est la seule mission qui part d'un aérodrome à terre (joueur à 123 m).

### 1.2 Le chunk `CARD` des objets `CARR`

`FORM REAL / OBJT / CARR / CARD`, 32 octets = 8 int32 en 24.8. Les quatre fichiers de `PACIFIC.DAT` qui l'ont
(`CARRIER`, `JEEPCV`, `SHOHO`, `SHOKAKU`) ont les mêmes valeurs :

| Rang | Valeur (÷ 256) | Lecture libRealSpace | Rôle constaté |
|---|---|---|---|
| 1 | 33 | `deck_height` = 33 m | hauteur de l'avion posé sur le pont (§ 2.2, § 2.3) |
| 2 | 5 | 5 | rangé en mémoire par le chargeur ; rôle non établi |
| 3 | 0 | point A : `x` = 0 | avec 4 et 5 : point lu par l'atterrissage de l'IA (`sub_B169C`, ovr321 ; non détaillé) |
| 4 | −60 | point A : `z` = +60 (`libRS.z = −c1`) | idem |
| 5 | 33 | point A : `y` = 33 | idem |
| 6 | 0 | point B : `x` = 0 | rangé en mémoire ; rôle non établi |
| 7 | −80 | point B : `z` = +80 | idem |
| 8 | 33 | point B : `y` = 33 | idem |

Les points A et B sont dans le repère du navire : (0, 33, 60) et (0, 33, 80).

### 1.3 Le modèle `CARRIER.IFF`

Le pont est à 30 m dans le modèle : 81 sommets à cette hauteur, de −50 à +52 m en largeur (`x`) et de −258 à +241 m
en longueur (`z`). L'avion posé est à 33 m, ce qui laisse 3 m pour le train. Le joueur de `PRLH-M2` est à 205 m de
l'origine du navire, dans l'axe : il est donc sur le pont.

## 2. Ce que fait le jeu (PACIFIC.EXE)

### 2.1 Lecture

`CarrierDeck_LoadCARD_B0E70` (ovr320) lit les 8 valeurs dans des **variables globales** (`dword_7CDE6` à
`dword_7CE02`), et non dans l'objet. Le dernier porte-avions chargé l'emporte ; comme les quatre fichiers ont les
mêmes valeurs, cela ne change rien dans les données.

### 2.2 Le pont, par contact avec le navire

Le pont **n'est pas une hauteur de sol**. Quand un avion touche un objet de type 23 (le porte-avions),
`Aircraft_ContactWithObject_3CA69` (seg097) le pose :
```
hauteur = 33 m                                  ; dword_7CDE6 (le calcul avec la garde au sol est écrasé par 2100h)
si c'est le joueur : le navire est noté (SetReference16 6646h)
si altitude de l'avion < hauteur :
    altitude = sol sous l'avion (la mer : 0) + 33 m
avion « au sol »                                ; [dynamique+32] = 1
pas d'écrasement                                ; la fonction rend 0
```
Le contact ne regarde ni la vitesse ni l'attitude : sur le pont, l'avion ne s'écrase pas.

`Ground_HeightUnderPoint_3664D` (la hauteur du sol sous un point) ne connaît pas le pont : sur la mer, elle rend 0.
Ce que nos documents disaient d'elle le 2026-11-05 (« surfaces d'atterrissage, le pont ») était faux ; c'est corrigé.

### 2.3 Le tick de l'avion (`PhysicsTicks_4A8F4`)

- **1re image** : tous les avions sont mis au sol (`cmp word_7977C, 0` / `mov byte ptr [bx+20h], 1`).
- **4 images après la construction du monde** (`word_77C4D`, posé par `sub_367B1`) : le sol est pris à 5 m sous
  l'avion (`add eax, 0FFFFFB00h`), pour que l'avion garde l'altitude du fichier en attendant le contact.
- **Décollage** : l'avion quitte le sol quand son altitude dépasse
  `sol + garde au sol + 33 m + 10 m` (`add [bp+var_20], 0A00h`).
  Les 33 m du pont ne sont pas ajoutés quand la variable 667 est posée (aérodrome à terre, `PRLH-M1`).

### 2.4 Non lu

- l'appelant de `Aircraft_ContactWithObject_3CA69`, et la boîte de contact utilisée (modèle entier ou pont) ;
- un navire qui se déplace avec un avion posé dessus (aucune mission lue ici ne le demande au départ) ;
- l'atterrissage et le décollage de l'IA sur le pont (ovr321, ovr322, chunks `LSOD` et `CHLD`) ;
- les brins d'arrêt et la catapulte : rien de tel n'a été vu.

## 3. Ce que fait libRealSpace aujourd'hui

| Endroit | Ce qu'il fait | Effet au départ de `PRLH-M2` |
|---|---|---|
| `PSMission::loadMission`, branche du joueur (`cast->actor == "PLAYER"`) | crée le `PSPlane` à la position du fichier ; ne pose pas `on_ground` et ne recale pas l'altitude | joueur à 31 m, pas au sol, vitesse 0 |
| `PSMission::createAiPlane` (avions de l'IA) | `on_ground = (vitesse == 0)` ; recale sur le terrain si l'écart est ≤ 10 m (`area->getY`) | ailiers à l'arrêt sur le pont : au sol, mais la mer est à 0 |
| `SCJetpPlane::Simulate` (2 endroits) | `groundlevel = area->getY(x, z)` | sol = 0 (la mer) |
| `SCJetpPlane::checkStatus` | `y > groundlevel + 1` → `on_ground = FALSE` | l'avion à 31 m n'est plus au sol et tombe |
| `SCPlane::isOnRunWay` | piste = boîtes des pistes du terrain | le pont n'est pas une piste : un posé dessus est un écrasement |
| `PSEntity::parseREAL_OBJT_CARR` | « Les chunks CHLD, CARD et LSOD ne sont pas lus. » | hauteur du pont inconnue |

## 4. Proposition

Le jeu pose l'avion par contact. Dans libRealSpace, la façon la plus simple d'obtenir le même résultat est de faire du
pont **un sol** pour l'avion, dans les classes qui existent déjà. Pour un navire immobile, le résultat est le même.

| Classe | Changement |
|---|---|
| `PSEntity` | lire `CARD` dans `parseREAL_OBJT_CARR` : `deck_height` et les deux points, tels que lus |
| `SCPlane` | nouvelle méthode virtuelle `groundLevelAt(x, z)`, qui rend `area->getY(x, z)` ; les deux `groundlevel = area->getY(...)` de `SCJetpPlane::Simulate` l'appellent ; `isOnRunWay` devient virtuelle |
| `PSPlane` | `groundLevelAt` : si (x, z) est sur le pont d'un porte-avions de la mission, hauteur du navire + `deck_height` ; sinon le terrain. `isOnRunWay` : vrai sur un pont, sinon celle de `SCPlane` |
| `PSMission::loadMission` (branche du joueur) et `PSMission::createAiPlane` | même départ pour les deux : recalage de 10 m sur `plane->groundLevelAt` au lieu de `area->getY` (le joueur passe de 31 à 33 m), `on_ground = (vitesse == 0)`, train sorti et manette à 0 au sol |

**Le pont.** Pour chaque acteur actif et non détruit de la mission dont l'entité est un `CARR` (`EntityType::carr`)
et qui a lu `CARD` : le point (x, z) est ramené dans le repère du navire (position et cap du `PART`), puis comparé à la
boîte du modèle (`RSEntity::bb`) en largeur et en longueur. Le jeu se sert du contact avec l'objet, dont la boîte
n'est pas encore lue (§ 2.4) : la boîte du modèle est l'approximation proposée.

**Le décollage.** Avec le pont comme sol, `SCJetpPlane::checkStatus` fait déjà le reste : au-dessus de
`groundlevel + 1`, l'avion est en vol. Le seuil du jeu (10 m au-dessus du pont) n'est pas repris ; dis-moi si tu le
veux.

**En bout de pont.** L'avion qui sort de la boîte retrouve la mer comme sol : il est en vol, comme dans le jeu.

**Pas dans cette proposition** : navire en mouvement (l'avion posé devrait suivre le pont), IA qui se pose ou décolle
du pont, `LSOD` et `CHLD`.

Esquisse de `PSPlane::groundLevelAt`, pour illustrer la proposition (non compilée) :
```cpp
float PSPlane::groundLevelAt(float x, float z) {
    float ground = this->area->getY(x, z);
    if (this->pilot == nullptr) {
        return ground;
    }
    if (this->pilot->mission == nullptr) {
        return ground;
    }
    for (auto actor : this->pilot->mission->actors) {
        if (!actor->is_active) {
            continue;
        }
        if (actor->is_destroyed) {
            continue;
        }
        PSEntity *entity = dynamic_cast<PSEntity *>(actor->object->entity);
        if (entity == nullptr) {
            continue;
        }
        if (!entity->has_carrier_deck) {
            continue;
        }
        float heading = tenthOfDegreeToRad((360.0f - (float)actor->object->azymuth) * 10.0f);
        float dx = x - actor->object->position.x;
        float dz = z - actor->object->position.z;
        float local_x = dx * cosf(heading) - dz * sinf(heading);
        float local_z = dx * sinf(heading) + dz * cosf(heading);
        BoudingBox *box = entity->GetBoudingBpx();
        if (local_x < box->min.x) {
            continue;
        }
        if (local_x > box->max.x) {
            continue;
        }
        if (local_z < box->min.z) {
            continue;
        }
        if (local_z > box->max.z) {
            continue;
        }
        float deck = actor->object->position.y + entity->carrier_deck.deck_height;
        if (deck > ground) {
            ground = deck;
        }
    }
    return ground;
}
```
Le sens de la rotation (cap → repère du navire) est à vérifier sur le modèle au moment d'écrire le code, comme les noms
exacts des champs de l'acteur (`is_active`, `is_destroyed`).
