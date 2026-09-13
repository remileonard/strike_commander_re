#!/usr/bin/env python3
"""
character_portrait.py — génère un « portrait-robot » lisible d'un pilote
IA à partir de son fichier PROF, en combinant :
  - le manuel officiel du jeu (signification et échelle des 9 stats ATRB)
  - les données réelles du fichier (GOAL, MVRS, ATRB, OPTS, RADI/INFO)
  - notre compréhension du code (ce que chaque identifiant MVRS calcule
    réellement, confirmé par lecture des 8 fonctions de score — voir
    analysis/AI_SYSTEM.md §3.7)

Usage :
    python3 tools/character_portrait.py <fichier.iff>
    python3 tools/character_portrait.py analysis/sample_prof_files/BILLY.IFF
"""
import struct
import sys


# ─────────────────────────────────────────────────────────────────────────
# ATRB — noms et échelles confirmés par le manuel officiel du jeu
# ─────────────────────────────────────────────────────────────────────────

# ─────────────────────────────────────────────────────────────────────────
# ATRB — noms et échelles confirmés par le manuel officiel du jeu
# Chaque stat a 4 paliers explicites (0-3, 4-8, 9-12, 13-16) pour éviter
# toute génération automatique d'intensificateurs qui se chevauchent.
# ─────────────────────────────────────────────────────────────────────────

ATRB_STATS = [
    # (code, nom, [description tres bas, bas, haut, tres haut])
    ('TH', 'Trigger Happy', [
        "économise ses munitions au maximum", "plutôt économe en munitions",
        "tire assez facilement", "tire sans compter, gaspille ses munitions"]),
    ('CN', 'Confidence', [
        "s'effraie au moindre danger", "assez facilement inquiet",
        "difficile à effrayer", "quasi impossible à effrayer"]),
    ('VB', 'Verbosity', [
        "ne parle jamais à la radio", "peu bavard à la radio",
        "assez bavard à la radio", "très bavard à la radio"]),
    ('LY', 'Loyalty', [
        "ignore quasi systématiquement les ordres", "suit les ordres de façon inégale",
        "suit généralement les ordres", "suit toujours les ordres à la lettre"]),
    ('FL', 'Flying', [
        "pilotage très médiocre", "pilotage moyen",
        "bon pilote", "excellent pilote"]),
    ('AG', 'Air-to-Ground', [
        "très faible en attaque au sol", "attaque au sol moyenne",
        "bon en attaque au sol", "expert en attaque au sol"]),
    ('AA', 'Air-to-Air', [
        "très faible en combat aérien", "combat aérien moyen",
        "bon en combat aérien", "expert en combat aérien"]),
    ('SM', 'Showmanship', [
        "ne fait jamais de démonstration", "peu démonstratif",
        "assez démonstratif", "très démonstratif, tape-à-l'œil"]),
    ('AR', 'Aggressiveness', [
        "très prudent, évite l'engagement", "plutôt prudent",
        "assez agressif", "très agressif, cherche le combat"]),
]


def describe_stat(value, tiers):
    """Traduit une valeur 0-16 en l'une des 4 descriptions explicites."""
    if value <= 3:
        return tiers[0]
    elif value <= 8:
        return tiers[1]
    elif value <= 12:
        return tiers[2]
    else:
        return tiers[3]


# ─────────────────────────────────────────────────────────────────────────
# MVRS — signification confirmée de chaque identifiant (lecture complète
# des fonctions de score, analysis/AI_SYSTEM.md §3.7)
# ─────────────────────────────────────────────────────────────────────────

MVRS_MEANINGS = {
    0x1:  ("(vestige — score indéterminé)",
           "⚠️ pointe vers une fonction utilitaire générique sans rapport (libération de "
           "buffer) qui ne borne jamais son résultat — probablement un emplacement jamais "
           "réellement implémenté"),
    0x2:  ("(comportement de repli fixe)",
           "aucune logique de score propre — retourne toujours 10, un score elevé fixe "
           "qui sert de comportement par défaut"),
    0x3:  ("Manœuvre de poursuite (variante)",
           "ajuste selon l'angle de poursuite (suis-je dans l'axe de la cible) et la "
           "distance, avec les seuils du fichier NUMS"),
    0x4:  ("Manœuvre de poursuite (base)",
           "instinct de manœuvre offensive — s'ajuste selon l'angle de poursuite "
           "(Targeting_ComputeBearingElevation) et la distance à la cible"),
    0x5:  ("Manœuvre de poursuite (variante)",
           "comme le type de base, avec une garde supplémentaire sur deux drapeaux "
           "d'état"),
    0x6:  ("Manœuvre de poursuite (variante)",
           "comme le type de base, enregistre en plus un sous-mode sur le nœud"),
    0x7:  ("Manœuvre de poursuite (vigilance capteur)",
           "comme le type de base, mais gardé par la portée du capteur de menace — ne "
           "s'active que si une cible est effectivement détectée à portée"),
    0x8:  ("Manœuvre de poursuite (carburant)",
           "comme le type de base, mais gardé par le niveau de carburant/ressource "
           "(même champ que ID=0x13) et par le drapeau de menace — évite les manœuvres "
           "coûteuses à court de carburant"),
    0x9:  ("(désactivé)", "type placeholder — toujours un score de 0"),
    0xA:  ("(désactivé)", "type placeholder — toujours un score de 0"),
    0xB:  ("(désactivé)", "type placeholder — toujours un score de 0"),
    0xC:  ("(désactivé)", "type placeholder — toujours un score de 0"),
    0xD:  ("(désactivé)", "type placeholder — toujours un score de 0"),
    0xE:  ("Manœuvre de poursuite (compétence)",
           "comme le type de base, mais pondéré par la compétence de pilotage du "
           "personnage (statistique FL)"),
    0xF:  ("Interception/anticipation de trajectoire",
           "calcule si une trajectoire d'interception est réalisable — score "
           "élevé uniquement si le pilote peut réellement couper la route de la "
           "cible"),
    0x10: ("Détection de menace",
           "réagit à une menace détectée par les capteurs (missile ou chasseur "
           "ennemi) — score élevé déclenche une réaction défensive/évasive"),
    0x13: ("Ressource critique (probable carburant)",
           "⚠️ ÉCHELLE DIFFÉRENTE des autres (0-2304 au lieu de 0-10), dérivée du même "
           "champ que la garde de ID=0x8 — domine systématiquement le tournoi de "
           "sélection dès qu'actif, donc vraisemblablement un signal d'urgence (retour "
           "à la base, etc.)"),
    0x14: ("Sélection d'arme",
           "prépare/sélectionne une arme contre la cible — actif seulement si un "
           "poste d'arme compatible est libre et qu'aucune autre tâche n'occupe "
           "le pilote"),
    0x15: ("(désactivé)",
           "type placeholder — toujours un score de 0, jamais sélectionné quelle "
           "que soit la valeur du fichier"),
}

GOAL_MEANINGS = {
    2: ("Exécution d'objectif de mission",
        "peut recevoir et exécuter des ordres de mission classiques (décoller, "
        "atterrir, détruire une cible, défendre une zone...)"),
    3: ("Patrouille/vagabondage",
        "peut patrouiller ou errer sans ordre précis"),
    4: ("Sélection tactique pondérée",
        "utilise le tournoi de score MVRS pour choisir dynamiquement son "
        "comportement tactique instant par instant"),
    5: ("Escorte active du joueur",
        "peut devenir coéquipier actif du joueur — le suit en formation, "
        "réagit aux ordres radio de commandement"),
}


def read_chunk_header(data, pos):
    tag = data[pos:pos + 4]
    length = struct.unpack('>I', data[pos + 4:pos + 8])[0]
    return tag, length, pos + 8


def parse_prof(path):
    data = open(path, 'rb').read()
    tag, length, pos = read_chunk_header(data, 0)
    if tag != b'FORM':
        raise ValueError("Pas un fichier FORM PROF valide")
    form_type = data[pos:pos + 4]
    pos += 4
    end = 8 + length

    result = {
        'id': None, 'name': None, 'callsign': None, 'spch': None,
        'msgs': {}, 'opts': '', 'mvrs': [], 'goal': [], 'atrb': [],
    }

    def walk(data, pos, end, in_ai=False):
        while pos < end:
            tag, sub_length, data_start = read_chunk_header(data, pos)
            content_end = data_start + sub_length
            if tag == b'FORM':
                sub_type = data[data_start:data_start + 4]
                walk(data, data_start + 4, content_end, in_ai=(sub_type == b'_AI_'))
            elif tag == b'SPCH':
                result['spch'] = data[data_start]
            elif tag == b'INFO':
                p = data_start
                result['id'] = struct.unpack('>H', data[p:p + 2])[0]
                p += 2
                end_name = data.index(b'\x00', p)
                result['name'] = data[p:end_name].decode('latin-1')
                p = end_name + 1
                end_cs = data.index(b'\x00', p)
                result['callsign'] = data[p:end_cs].decode('latin-1')
            elif tag == b'OPTS':
                result['opts'] = data[data_start:content_end].decode('latin-1', 'replace')
            elif tag == b'MSGS':
                p = data_start
                while p < content_end:
                    idx = data[p]
                    p += 1
                    end_s = data.index(b'\x00', p)
                    result['msgs'][idx] = data[p:end_s].decode('latin-1')
                    p = end_s + 1
            elif tag == b'MVRS':
                raw = data[data_start:content_end]
                for i in range(0, len(raw) - 1, 2):
                    mid, val = raw[i], raw[i + 1]
                    if val >= 128:
                        val -= 256
                    result['mvrs'].append((mid, val))
            elif tag == b'GOAL':
                result['goal'] = list(data[data_start:content_end])
            elif tag == b'ATRB':
                result['atrb'] = list(data[data_start:content_end])
            pos = data_start + sub_length
            if pos % 2:
                pos += 1

    walk(data, pos, end)
    return result


def render_portrait(prof, path):
    lines = []
    name = prof['name'] or '(nom inconnu)'
    callsign = prof['callsign'] or '?'
    lines.append("=" * 64)
    lines.append(f"  {name}  —  « {callsign} »")
    lines.append("=" * 64)
    lines.append(f"  (source : {path})")
    lines.append("")

    # ── Personnalité et compétences (ATRB) ──────────────────────────────
    lines.append("PERSONNALITÉ ET COMPÉTENCES")
    lines.append("-" * 64)
    atrb = prof['atrb']
    if not atrb:
        lines.append("  (aucune donnée ATRB — valeurs par défaut du moteur appliquées)")
    else:
        for i, (code, name_stat, tiers) in enumerate(ATRB_STATS):
            if i < len(atrb):
                v = atrb[i]
                desc = describe_stat(v, tiers)
                bar = '█' * v + '░' * (16 - v)
                lines.append(f"  {name_stat:16s} [{bar}] {v:2d}/16  — {desc}")
        if len(atrb) > 9:
            lines.append(f"  (10e octet, sans nom connu : {atrb[9]})")
    lines.append("")

    # ── Répertoire comportemental (GOAL) ────────────────────────────────
    lines.append("RÉPERTOIRE COMPORTEMENTAL (GOAL)")
    lines.append("-" * 64)
    goal = prof['goal']
    if not goal:
        lines.append("  (aucune donnée GOAL)")
    else:
        for slot in goal:
            if slot in GOAL_MEANINGS:
                title, desc = GOAL_MEANINGS[slot]
                lines.append(f"  • {title}")
                lines.append(f"      {desc}")
        if 5 not in goal:
            lines.append("  ⚠ N'a PAS le comportement d'escorte active (sélecteur 5)")
            lines.append("    → ne peut pas devenir coéquipier actif du joueur")
    lines.append("")

    # ── Instincts tactiques (MVRS) ───────────────────────────────────────
    lines.append("INSTINCTS TACTIQUES (MVRS)")
    lines.append("-" * 64)
    mvrs = prof['mvrs']
    if not mvrs:
        lines.append("  (aucune donnée MVRS — comportement tactique par défaut)")
    else:
        known = [(m, v) for m, v in mvrs if m in MVRS_MEANINGS]
        unknown = [(m, v) for m, v in mvrs if m not in MVRS_MEANINGS]
        for mid, val in known:
            title, desc = MVRS_MEANINGS[mid]
            if val > 0:
                tuning = f"BONUS +{val}  (favorisé par rapport à la normale)"
            elif val < 0:
                tuning = f"MALUS {val}  (défavorisé — moins susceptible d'être choisi)"
            else:
                tuning = "coefficient neutre (aucun ajustement du fichier — le comportement s'applique normalement s'il gagne)"
            lines.append(f"  • [0x{mid:02X}] {title}")
            lines.append(f"      {desc}")
            lines.append(f"      Réglage fichier : {tuning}")
        if unknown:
            neutral_unknown = [(m, v) for m, v in unknown if v == 0]
            tuned_unknown = [(m, v) for m, v in unknown if v != 0]
            if tuned_unknown:
                lines.append("  Identifiants non décodés mais AVEC UN RÉGLAGE NON-NEUTRE")
                lines.append("  (rôle tactique précis inconnu, mais le fichier les ajuste")
                lines.append("   délibérément — probablement significatif) :")
                for mid, val in tuned_unknown:
                    sign = f"+{val}" if val > 0 else str(val)
                    lines.append(f"    • [0x{mid:X}] réglage = {sign}")
            if neutral_unknown:
                ids = ', '.join(f"0x{m:X}" for m, v in neutral_unknown)
                lines.append(f"  ({len(neutral_unknown)} autre(s) identifiant(s) non décodé(s), "
                              f"réglage neutre : {ids})")
    lines.append("")

    # ── Interaction radio (OPTS) ─────────────────────────────────────────
    lines.append("COMMANDES RADIO DISPONIBLES (OPTS)")
    lines.append("-" * 64)
    opts = prof['opts']
    if not opts:
        lines.append("  (aucune — ce personnage ne peut recevoir aucune commande radio")
        lines.append("   du joueur, cohérent avec un PNJ non-interactif ou un transport)")
    else:
        lines.append(f"  {len(opts)} commande(s) disponible(s) : {opts}")
        if opts == 'd':
            lines.append("  → seule la lettre 'd' est présente, une option qui tombe hors de")
            lines.append("    la plage 'e'-'m' gérée par le vérificateur de disponibilité")
            lines.append("    contextuelle — probablement une option \"toujours disponible\"")
            lines.append("    (accusé de réception/salutation) plutôt qu'une vraie commande")
            lines.append("    de coordination tactique")
    lines.append("")

    # ── Résumé narratif ───────────────────────────────────────────────────
    lines.append("SYNTHÈSE")
    lines.append("-" * 64)
    narrative = []
    if atrb:
        ar = atrb[8] if len(atrb) > 8 else 8
        aa = atrb[6] if len(atrb) > 6 else 8
        ly = atrb[3] if len(atrb) > 3 else 8
        if ar >= 12 and aa >= 12:
            narrative.append("Pilote de combat aguerri et agressif.")
        elif ar <= 4:
            narrative.append("Pilote prudent, évite l'engagement direct.")
        if ly <= 4:
            narrative.append("Peu fiable sur le respect des ordres.")
        elif ly >= 13:
            narrative.append("Discipliné, suit les ordres à la lettre.")
    if 5 in goal:
        narrative.append("Peut voler aux côtés du joueur en tant qu'ailier actif.")
    elif not goal or goal == [2]:
        narrative.append("Rôle de fond (transport/PNJ), sans autonomie tactique développée.")
    if not narrative:
        narrative.append("Profil standard, sans trait dominant identifié.")
    lines.append("  " + " ".join(narrative))
    lines.append("")
    lines.append("=" * 64)

    return "\n".join(lines)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print(__doc__)
        sys.exit(1)
    prof = parse_prof(sys.argv[1])
    print(render_portrait(prof, sys.argv[1]))
