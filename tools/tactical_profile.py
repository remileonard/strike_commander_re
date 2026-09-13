#!/usr/bin/env python3
"""
tactical_profile.py — applique le glossaire d'intention tactique
(analysis/AI_TACTICAL_GLOSSARY.md) à un fichier PROF précis : produit un
schéma Mermaid ET une analyse de personnalité, entièrement en langage
d'intention (pas de noms de fonction, pas d'adresses mémoire).

Complémentaire de character_automaton.py (référence technique) et
character_portrait.py (résumé texte) — celui-ci est pensé pour être lu
sans connaître le code source.

Usage :
    python3 tools/tactical_profile.py <fichier.iff> [sortie.md]
"""
import struct
import sys


# ─────────────────────────────────────────────────────────────────────────
# Traduction MVRS -> intention (voir analysis/AI_TACTICAL_GLOSSARY.md §3)
# ─────────────────────────────────────────────────────────────────────────

MVRS_INTENT = {
    0x1:  ("(emplacement vestige)", None, None),
    0x2:  ("Comportement de repli", "toujours prêt à s'activer si rien d'autre ne "
           "prend le dessus", None),
    0x3:  ("Manœuvre de poursuite — rupture défensive",
           "engagé sur une cible ; si la position est ambiguë, choisit une "
           "direction de rupture gauche/droite (pile ou face si vraiment "
           "indécidable)", "angle par rapport à la cible"),
    0x4:  ("Manœuvre de poursuite (instinct de base)",
           "engagé sur une cible ; se positionne selon l'angle et la distance",
           "angle par rapport à la cible"),
    0x5:  ("Manœuvre de poursuite (variante)",
           "comme l'instinct de base, note en plus sa position relative pour "
           "que d'autres instincts en tiennent compte", "angle par rapport à la cible"),
    0x6:  ("Manœuvre de poursuite (variante prolongée)",
           "comme l'instinct de base, mais s'engage pour une durée déterminée "
           "avec un choix de sous-manœuvre", "angle par rapport à la cible"),
    0x7:  ("Vigilance capteur",
           "comme l'instinct de base, mais seulement si une menace est "
           "réellement détectée par les capteurs (pas juste présente)",
           "angle par rapport à la cible + portée de détection"),
    0x8:  ("Prudence carburant",
           "comme l'instinct de base, mais désactivé si le carburant est trop "
           "bas pour se permettre une manœuvre coûteuse", "angle + niveau de carburant"),
    0x9:  ("(instinct non implémenté)", None, None),
    0xA:  ("(instinct non implémenté)", None, None),
    0xB:  ("(instinct non implémenté)", None, None),
    0xC:  ("(instinct non implémenté)", None, None),
    0xD:  ("(instinct non implémenté)", None, None),
    0xE:  ("Manœuvre de poursuite (pondérée par compétence)",
           "comme l'instinct de base, mais d'autant plus probable que le "
           "pilote est un bon voltigeur (statistique Flying)", "angle + compétence de vol"),
    0xF:  ("Anticipation / interception",
           "ne se déclenche que si une trajectoire d'interception est "
           "géométriquement réalisable — couper la route plutôt que suivre",
           "faisabilité géométrique d'interception"),
    0x10: ("Alerte menace",
           "réagit à un danger détecté par les capteurs (missile, chasseur "
           "ennemi) par une manœuvre défensive/évasive", "détection de menace active"),
    0x13: ("Urgence carburant",
           "prend systématiquement le dessus sur tout le reste dès qu'actif — "
           "signal de retour à la base", "niveau de carburant critique"),
    0x14: ("Prêt à engager/tirer",
           "prépare et sélectionne une arme contre la cible, verrouille "
           "pendant une durée donnée", "poste d'arme libre + cible valide"),
    0x15: ("(instinct non implémenté)", None, None),
}

GOAL_INTENT = {
    2: "En mission — exécute les ordres assignés (décoller, attaquer, défendre...)",
    3: "Solo / en attente — patrouille sans ordre précis si rien d'autre ne s'impose",
    4: "Instinct de combat — évalue ses instincts tactiques à chaque tick",
    5: "Coéquipier — suit et protège le joueur, réagit à ses ordres radio",
}

ATRB_INTENT = [
    ('Trigger Happy', [
        "économise ses munitions au maximum", "plutôt économe en munitions",
        "tire assez facilement", "tire sans compter, gaspille ses munitions"]),
    ('Confidence', [
        "s'effraie au moindre danger", "assez facilement inquiet",
        "difficile à effrayer", "quasi impossible à effrayer"]),
    ('Verbosity', [
        "ne parle jamais à la radio", "peu bavard à la radio",
        "assez bavard à la radio", "très bavard à la radio"]),
    ('Loyalty', [
        "ignore quasi systématiquement les ordres", "suit les ordres de façon inégale",
        "suit généralement les ordres", "suit toujours les ordres à la lettre"]),
    ('Flying', [
        "pilotage très médiocre", "pilotage moyen",
        "bon pilote", "excellent pilote"]),
    ('Air-to-Ground', [
        "très faible en attaque au sol", "attaque au sol moyenne",
        "bon en attaque au sol", "expert en attaque au sol"]),
    ('Air-to-Air', [
        "très faible en combat aérien", "combat aérien moyen",
        "bon en combat aérien", "expert en combat aérien"]),
    ('Showmanship', [
        "ne fait jamais de démonstration", "peu démonstratif",
        "assez démonstratif", "très démonstratif, tape-à-l'œil"]),
    ('Aggressiveness', [
        "très prudent, évite l'engagement", "plutôt prudent",
        "assez agressif", "très agressif, cherche le combat"]),
]


def describe_stat(value, tiers):
    if value <= 3:
        return tiers[0]
    elif value <= 8:
        return tiers[1]
    elif value <= 12:
        return tiers[2]
    return tiers[3]


def read_chunk_header(data, pos):
    tag = data[pos:pos + 4]
    length = struct.unpack('>I', data[pos + 4:pos + 8])[0]
    return tag, length, pos + 8


def parse_prof(path):
    data = open(path, 'rb').read()
    tag, length, pos = read_chunk_header(data, 0)
    pos += 4
    end = 8 + length
    result = {'name': None, 'callsign': None, 'goal': [], 'mvrs': [],
              'atrb': [], 'opts': ''}

    def walk(data, pos, end):
        while pos < end:
            tag, sub_length, data_start = read_chunk_header(data, pos)
            content_end = data_start + sub_length
            if tag == b'FORM':
                sub_type = data[data_start:data_start + 4]
                walk(data, data_start + 4, content_end)
            elif tag == b'INFO':
                p = data_start + 2
                end_name = data.index(b'\x00', p)
                result['name'] = data[p:end_name].decode('latin-1')
                p = end_name + 1
                end_cs = data.index(b'\x00', p)
                result['callsign'] = data[p:end_cs].decode('latin-1')
            elif tag == b'OPTS':
                result['opts'] = data[data_start:content_end].decode('latin-1', 'replace')
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


def mermaid_id(prefix, *parts):
    return prefix + '_' + '_'.join(str(p).replace('-', 'm') for p in parts)


def build_diagram(prof):
    name = prof['name'] or '?'
    callsign = prof['callsign'] or '?'
    goal = prof['goal']
    mvrs = prof['mvrs']

    lines = ["flowchart TD"]
    lines.append(f'    Start(["{name} « {callsign} » décide de son action"])')
    prev = "Start"
    tourney_slot = None

    for i, sel in enumerate(goal):
        if sel == 1:
            continue  # emplacement vide, rien a representer
        node = mermaid_id("R", i)
        label = GOAL_INTENT.get(sel, f"rôle inconnu ({sel})")
        lines.append(f'    {node}{{"{label}"}}')
        lines.append(f'    {prev} -->|essaie| {node}')
        done = mermaid_id("Done", i)
        lines.append(f'    {done}(["agit"])')
        lines.append(f'    {node} -->|s\'applique| {done}')
        if sel == 4:
            tourney_slot = node
        prev = node

    lines.append(f'    {prev} -->|rien ne s\'applique| Idle(["reste passif ce tick"])')

    if tourney_slot and mvrs:
        lines.append("")
        lines.append(f'    {tourney_slot} -.->|"pèse ses instincts"| T{{"Instinct le plus urgent l\'emporte"}}')
        best = "Winner"
        lines.append(f'    {best}{{"agit"}}')
        for mid, val in mvrs:
            intent = MVRS_INTENT.get(mid)
            node = mermaid_id("I", mid)
            if intent is None or intent[1] is None:
                continue  # on masque les emplacements vestiges/non-implementes du schema
            title, desc, trigger = intent
            if val > 0:
                bias = f"(davantage porté vers ça, +{val})"
            elif val < 0:
                bias = f"(moins porté vers ça, {val})"
            else:
                bias = "(dosage normal)"
            label = f"{title} {bias}<br/>{desc}"
            lines.append(f'    T --> {node}["{label}"]')
            lines.append(f'    {node} --> {best}')
        n_hidden = sum(1 for m, v in mvrs if MVRS_INTENT.get(m, (None, None))[1] is None)
        if n_hidden:
            lines.append(f'    T -.->|"+{n_hidden} instinct(s) prévu(s) mais jamais activé(s)"| Ghost(("aucun"))')

    return "\n".join(lines)


def build_markdown(prof, path, diagram):
    name = prof['name'] or '?'
    callsign = prof['callsign'] or '?'
    atrb = prof['atrb']
    goal = prof['goal']
    mvrs = prof['mvrs']
    opts = prof['opts']

    md = []
    md.append(f"# Profil tactique — {name} « {callsign} »")
    md.append("")
    md.append(f"*Glossaire appliqué à `{path}` — voir "
               "`analysis/AI_TACTICAL_GLOSSARY.md` pour le vocabulaire complet.*")
    md.append("")

    md.append("## Personnalité")
    md.append("")
    if atrb:
        for i, (label, tiers) in enumerate(ATRB_INTENT):
            if i < len(atrb):
                v = atrb[i]
                bar = '█' * v + '░' * (16 - v)
                md.append(f"- **{label}** `[{bar}]` {v}/16 — {describe_stat(v, tiers)}")
    else:
        md.append("*(pas de données de personnalité — valeurs par défaut du moteur)*")
    md.append("")

    md.append("## Rôles accessibles")
    md.append("")
    if not goal:
        md.append("*Aucun — ce personnage ne prend jamais l'initiative.*")
    else:
        for sel in goal:
            if sel == 1:
                continue
            md.append(f"- {GOAL_INTENT.get(sel, f'rôle inconnu ({sel})')}")
        if 4 not in goal:
            md.append("")
            md.append("⚠️ Pas d'accès à l'instinct de combat — ce personnage ne "
                       "prend jamais de décision tactique fine par lui-même.")
    md.append("")

    md.append("## Schéma de décision")
    md.append("")
    md.append("```mermaid")
    md.append(diagram)
    md.append("```")
    md.append("")

    if 4 in goal and mvrs:
        md.append("## Détail des instincts de combat réglés")
        md.append("")
        for mid, val in mvrs:
            intent = MVRS_INTENT.get(mid)
            if intent is None:
                continue
            title, desc, trigger = intent
            if desc is None:
                continue
            if val > 0:
                bias = f"**davantage porté vers cet instinct** (réglage +{val})"
            elif val < 0:
                bias = f"**moins porté vers cet instinct** (réglage {val})"
            else:
                bias = "dosage normal, sans biais particulier"
            md.append(f"- **{title}** — {desc}")
            if trigger:
                md.append(f"  Se déclenche selon : {trigger}. {bias}.")
            else:
                md.append(f"  {bias.capitalize()}.")
        md.append("")

    md.append("## En une phrase")
    md.append("")
    narrative = []
    if atrb and len(atrb) > 8:
        ar, aa, ly = atrb[8], atrb[6], atrb[3]
        if ar >= 12 and aa >= 12:
            narrative.append("Un combattant aguerri qui cherche l'engagement.")
        elif ar <= 4:
            narrative.append("Un pilote prudent qui évite le combat direct.")
        if ly <= 4:
            narrative.append("Peu fiable sur le respect des ordres.")
        elif ly >= 13:
            narrative.append("Discipliné, suit les ordres à la lettre.")
    if 5 in goal:
        narrative.append("Peut voler comme coéquipier direct du joueur.")
    elif 4 not in goal:
        narrative.append("Rôle de fond, sans autonomie tactique.")
    if not narrative:
        narrative.append("Profil standard, sans trait dominant.")
    md.append(" ".join(narrative))

    return "\n".join(md)


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    prof = parse_prof(sys.argv[1])
    diagram = build_diagram(prof)
    markdown = build_markdown(prof, sys.argv[1], diagram)
    if len(sys.argv) > 2:
        with open(sys.argv[2], 'w', encoding='utf-8') as f:
            f.write(markdown)
        print(f"Écrit dans {sys.argv[2]}")
    else:
        print(markdown)
