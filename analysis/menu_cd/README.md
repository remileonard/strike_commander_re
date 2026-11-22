# MENU.EXE (version CD-ROM) : intro et choix du jeu

Exécutable fourni par Rémi le 2026-11-03 (non inclus dans le dépôt), lu sans IDA avec
`tools/exe_disasm.py`. Adresses **en décimal**, décalages dans l'image chargée de **cet** exécutable
(`exe_disasm.py` les écrit en hexadécimal). Borland C++ 1991, un seul bloc : pas d'overlays VROOMM
(aucune donnée après l'image MZ de 165 728 octets).

Format de l'animation : `FLX_FORMAT.md`. Proposition pour libRealSpace : `analysis/IMPL_FLIC_INTRO.md`.

## 1. Ce qu'il fait

Boucle de présentation de la version CD qui contient Strike Commander et Tactical Operations :

1. **Joue l'animation d'introduction** `..\..\data\flic\theflic.flx` (`DATA\FLIC\THEFLIC.FLX` de
   `BIGTRE.TRE`, § 2). Le lecteur vient de l'outil « PLAYFLIC version 1.0b (PJS) » : son message
   d'usage est resté (`playflic <filename>{.flx} -f -rn`, `-s`, `-d`) et la ligne de commande est
   analysée de la même façon (nom de fichier complété par `.flx`).
2. **Lance la musique du menu** : `amusic`, `rmusic` ou `mmusic.pak` selon la carte son (octet
   DGROUP:8096, valeurs 1 à 5, aiguillage en 15079), morceau 23 (`push 17h` en 15149) :

   | Carte (DGROUP:8096) | PAK |
   |---|---|
   | 1 | `rmusic` (Roland) |
   | 3 | `amusic` (AdLib) |
   | 2, 4, 5 | `mmusic` |

3. **Affiche le menu** (fonction en 18340) : palettes `OPTPALS` 21 et 24, `MID1` 59, `TOMENU` 2 ;
   fond `OPTSHPS` 44 (montagnes, y 133 à 199) ; panneau `TOMENU` 0 (249 × 82) dans une fenêtre
   (45, 24)-(293, 105) ; deux boutons, images de `TOMENU` 1 :

   | Bouton | Position dans le panneau | Taille | Valeur rendue | Code de sortie |
   |---|---|---|---|---|
   | « PLAY STRIKE COMMANDER » | (44, 9) | 166 × 26 | 1 | **10** |
   | « PLAY TACTICAL OPERATIONS » | (45, 47) | 165 × 26 | 2 | **11** |

   `TOMENU` 1 a 4 images ; les boutons prennent les images 0 et 1 (`mov word ptr [si+28h], 0` / `1`),
   rôle des images 2 et 3 non établi.
4. **Sans choix**, le menu rend 3 : sans musique, après 120 000 unités d'horloge (environ 20 s, § 2.1 ;
   `add edx, 1D4C0h`) ; avec musique, quand la fonction 51347 rend 0 (fin du morceau, d'après l'usage).
   Le programme **rejoue alors l'introduction** et le menu (boucle 15005 à 15224).
5. **Sortie** : valeur 1 → 10, valeur 2 → 11 (15241 à 15260), puis `exit` du C (104457 → 951 →
   `int 21h`, `ah = 4Ch`) : le code de sortie DOS (ERRORLEVEL) dit quel jeu lancer. Le programme qui
   lit ce code (fichier de commandes ou `SC.EXE` du CD) n'a pas été vu.

![Menu](menu.png)

Image composée avec les données de `BIGTRE.TRE` : `GAMEFLOW\TOMENU.PAK` (3 entrées : panneau, boutons,
palette), `GAMEFLOW\OPTSHPS.PAK` 44. L'ordre d'application des palettes est celui du code ; la palette
de `TOMENU` couvre les 256 couleurs.

## 2. Lecture de l'animation (fonction en 61691)

### 2.1 Cadence

- **Horloge** (72633) : compteur du minuteur programmé à 9 943 périodes par interruption ; une unité =
  198 périodes du compteur à 1 193 182 Hz, soit environ **6 026 unités par seconde**.
- **Durée d'une image** : donnée par la ligne de commande (`-r n`, `-d` = 500, `-s` = 750 ; table des
  options lue en 14702), sinon
  choisie après une mesure de la vitesse de la machine (62497) : **475 unités** (78,8 ms, 12,7 images
  par seconde) sur une machine rapide, 600 (99,6 ms, 10 images par seconde) sur une machine lente.
- Boucle (62722) : heure de départ, traitement de l'enregistrement, attente active jusqu'à départ +
  durée d'une image.

### 2.2 Enregistrements

- **Annonce de palette** (type 0) : l'enregistrement suivant est lu et appliqué comme palette ; les
  bandes du haut et du bas (lignes 0 à 23 et 176 à 199) sont remplies avec la couleur que rend la
  recherche de couleur 33267 pour (0, 0, 0) (62966 à 63031). L'écran est **éteint** (bit 5 du registre
  1 du séquenceur VGA, 59795) jusqu'au dessin de l'image suivante, puis rallumé après le retour de
  trame (59777, en 61074) : le changement de palette ne se voit pas.
- **Image** (type 1, 60188) : décodée selon `FLX_FORMAT.md` § 2.2, puis le compteur d'images
  (DGROUP:2690) augmente de 1 (61173).

### 2.3 Sons numérisés

Après chaque enregistrement (63347), si une carte de son numérisé est présente, le compteur d'images
est cherché dans une table (65299, 16 valeurs) ; une valeur trouvée joue une entrée de `FLIC.PAK`
(cibles 63400 à 64290) :

| Images dessinées | Entrée | Images dessinées | Entrée |
|---|---|---|---|
| 1 | 0 | 360 | 5 |
| 128 | 10 | 385 | 11 |
| 151 | 1 | 415 | 11 |
| 165 | 2 | 550 | 6 |
| 215 | 3 | 680 | 7 |
| 230 | 12 | 705 | 8 |
| 265 | 11 | 760 | 9 |
| 305 | 4 | 830 | 13 |

Un seul lecteur de son numérisé : chaque son remplace le précédent. Après les images 128 et 151, la
palette qui suit refait le test et relance le même son au même instant. L'entrée 14 de `FLIC.PAK`
n'est pas dans la table.

### 2.4 Musique

Démarrée avant la première image (62523), une entrée de `FLIC.PAK` selon la carte son et la durée
d'une image :

| Carte (DGROUP:8096) | Image de 500 unités ou moins | Image de plus de 500 unités |
|---|---|---|
| 3 (AdLib) | 15 | 18 |
| 1 (Roland) | 16 | 19 |
| 2, 4, 5 | 17 | 20 |

### 2.5 Fin

À la fin des enregistrements, ou sur une touche (lecture du clavier 133326, testée avant chaque
enregistrement).

## 3. Autres chaînes

Gestion d'erreurs, mémoire, son, clavier, souris et manette communes aux autres exécutables
(`errors.txt`, « Game Paused », « Exit to DOS? (Y/N) », `JOYCALIB.SHP`, `MOUSE.SHP`,
`crackthe.nut`, `sc.cfg`) ; chaîne `d:theflic2.flx` présente, emploi non trouvé.
