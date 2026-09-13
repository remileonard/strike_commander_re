#!/usr/bin/env python3
"""
character_automaton.py — génère la documentation ET le schéma Mermaid de
l'automate de décision d'un pilote IA précis, à partir de son fichier PROF.

Contrairement à character_portrait.py (résumé texte lisible), cet outil
produit un document Markdown avec un diagramme Mermaid représentant :
  - la chaîne de priorité GOAL réelle de CE personnage (dans l'ordre
    exact du fichier)
  - le tournoi MVRS qui se déploie à l'intérieur du sélecteur GOAL 4,
    avec pour chaque entrée : la fonction de score concernée (quand
    elle est décodée, voir analysis/AI_SYSTEM.md §3.7), sa formule de
    base, et le coefficient précis lu dans CE fichier

Usage :
    python3 tools/character_automaton.py <fichier.iff> [sortie.md]
    python3 tools/character_automaton.py analysis/sample_prof_files/BILLY.IFF
"""
import struct
import sys


# ─────────────────────────────────────────────────────────────────────────
# Connaissances confirmées (analysis/AI_SYSTEM.md §3.7, §4)
# ─────────────────────────────────────────────────────────────────────────

GOAL_INFO = {
    2: ("Goal_ExecuteAction", "Exécution d'objectif de mission",
        "traite les codes 0xA1-0xAC (décoller, atterrir, détruire cible...)"),
    3: ("Goal_WanderRandom", "Patrouille/vagabondage",
        "comportement de repli sans ordre précis"),
    4: ("AI_BehaviorStateMachine_9D05", "Tournoi de sélection pondérée (MVRS)",
        "argmax sur toutes les entrées MVRS du fichier — voir détail ci-dessous"),
    5: ("Goal_ActiveWingmanEngagement_878F", "Escorte active du joueur",
        "suivi de formation, callouts radio, délègue aussi au tournoi MVRS"),
}

# (nom_fonction, formule_base_resumee, plage, adresse_fonction_application)
MVRS_INFO = {
    0x1:  ("StreamReader_ReleaseBuffer_65643 (réutilisée)", "⚠ fonction utilitaire générique "
           "réutilisée par erreur/vestige — ne borne jamais son résultat, score indéterminé",
           "indéterminé", "loc_6403C (non lue)"),
    0x2:  ("MVRS_SharedContextSyncAndID2Score_EC22", "aucune logique de score — retourne "
           "toujours la valeur fixe 10", "10 fixe", "NotifiableRef_SwapTarget_756A4 (lue, générique)"),
    0x3:  ("MVRS_ID3_ScoreGeneric_3FCB", "base=5, ±ajustements d'angle de poursuite "
           "(Targeting_ComputeBearingElevation) + seuils NUMS (dword_7201C)", "0-9",
           "MVRS_ID3_ApplyBreakDirection_F2C8 (lue — décision virage G/D, pile ou face si ambigu)"),
    0x4:  ("MVRS_ID4_ScoreGeneric_4128", "base=5, ±ajustements d'angle de poursuite "
           "(word_72093/95) + seuils NUMS (dword_7201C)", "0-9", "MVRS_ID4_ApplyGeneric_F6C2 (lue)"),
    0x5:  ("MVRS_ID5_ScoreGeneric_41DD", "base=5, ±angle de poursuite + garde drapeaux "
           "(byte_720DF/720E0)", "0-9",
           "MVRS_ID5_ApplySetAspectBit_FCE1 (lue — pose entité+0x32 bit0)"),
    0x6:  ("MVRS_ID6_ScoreGeneric_434E", "base=3, ±angle de poursuite, écrit un sous-mode "
           "(node+0x26)", "0-9",
           "MVRS_ID6_ApplySetTimer_100B6 → MVRS_ID6_TimerTickAndSubmodeSwitch_1011F (lues)"),
    0x7:  ("MVRS_ID7_ScoreGeneric_45BE", "base=3, ±angle de poursuite + garde portée capteur "
           "(dword_7203D)", "0-9", "MVRS_ID7_ApplySetTimer_1060A (lue, même motif que ID=6)"),
    0x8:  ("MVRS_ID8_ScoreManeuverFuelGated_47D4", "base=5, gardée par flags_75 bit6 (menace) "
           "+ seuil sur entité+0xB0 (même champ que ID=0x13, probable carburant/ressource, "
           "PAS une compétence pilote), appelle AI_ManeuverSolution_91DF", "0-9",
           "MVRS_ID8_ApplyFuelGatedManeuver_10AF2 (lue — lit entité+0x32 posé par ID=5)"),
    0x9:  ("MVRS_ID9_ScorePlaceholder_49DA", "toujours 0 — type désactivé", "0 fixe", "loc_1115D (non lue, jamais atteignable)"),
    0xA:  ("MVRS_ID10_ScorePlaceholder_4A02", "toujours 0 — type désactivé", "0 fixe", "loc_112F7 (non lue, jamais atteignable)"),
    0xB:  ("MVRS_ID11_ScorePlaceholder_4A2A", "toujours 0 — type désactivé", "0 fixe", "loc_1131D (non lue, jamais atteignable)"),
    0xC:  ("MVRS_ID12_ScorePlaceholder_4A49", "toujours 0 — type désactivé", "0 fixe", "loc_11343 (non lue, jamais atteignable)"),
    0xD:  ("MVRS_ID13_ScorePlaceholder_4A71", "toujours 0 — type désactivé", "0 fixe",
           "MVRS_ID13_ApplyTrivialDelegate_11369 (lue — 9 lignes, délégué trivial vers vtable+0xC)"),
    0xE:  ("MVRS_ID14b_ScoreGeneric_4A99", "base=1, ±angle de poursuite + bonus compétence "
           "pilote (FL, formule quadratique)", "0-9", "loc_1138F (non lue)"),
    0xF:  ("MVRS_ID15b_ScoreIntercept_4CD1", "calcul d'interception de trajectoire "
           "(cosinus pondéré + portée capteur)", "0 ou 10", "loc_11763 (non lue)"),
    0x10: ("MVRS_ID16_ScoreThreatSensor_4E2A", "détection de menace via "
           "AI_Sensor_SecondaryAngle_59A5", "0 ou 10", "loc_11809 (non lue)"),
    0x13: ("MVRS_ID19_ScoreFuelOrResource_4ECD", "valeur continue dérivée d'entité+0xB0 "
           "(même champ que la garde de ID=0x8, probable carburant)", "0x100-0x900 (domine "
           "le tournoi)", "loc_118C3 (non lue)"),
    0x14: ("MVRS_ID14_ScoreWeaponReadiness_77000", "poste d'arme libre ET cible "
           "valide ET aucune tâche en cours", "0 ou 5", "MVRS_ID14_ApplyWeaponTracking_7709A (lue)"),
    0x15: ("MVRS_ID21_ScorePlaceholder_4F54", "toujours 0 — type désactivé", "0 fixe", "loc_1195A (non lue, jamais atteignable)"),
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
    pos += 4
    end = 8 + length
    result = {'name': None, 'callsign': None, 'goal': [], 'mvrs': []}

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
            elif tag == b'MVRS':
                raw = data[data_start:content_end]
                for i in range(0, len(raw) - 1, 2):
                    mid, val = raw[i], raw[i + 1]
                    if val >= 128:
                        val -= 256
                    result['mvrs'].append((mid, val))
            elif tag == b'GOAL':
                result['goal'] = list(data[data_start:content_end])
            pos = data_start + sub_length
            if pos % 2:
                pos += 1

    walk(data, pos, end)
    return result


def mermaid_id(prefix, *parts):
    """Identifiant de nœud Mermaid sûr (alphanumérique uniquement)."""
    return prefix + '_' + '_'.join(str(p).replace('-', 'm').replace('.', '') for p in parts)


def build_diagram(prof):
    name = prof['name'] or '?'
    callsign = prof['callsign'] or '?'
    goal = prof['goal']
    mvrs = prof['mvrs']

    lines = ["flowchart TD"]
    lines.append(f'    Start(["Tick IA — {name} « {callsign} »"])')

    prev_no = "Start"
    has_mvrs_slot = False

    for i, sel in enumerate(goal):
        info = GOAL_INFO.get(sel)
        node = mermaid_id("G", i)
        if info is None:
            lines.append(f'    {node}["Sélecteur GOAL inconnu ({sel})"]')
        else:
            fname, title, desc = info
            label = f"Emplacement {i+1} — sélecteur {sel}<br/>{title}"
            lines.append(f'    {node}{{"{label}"}}')
        edge_label = "non agi" if i > 0 else ""
        if edge_label:
            lines.append(f'    {prev_no} -->|{edge_label}| {node}')
        else:
            lines.append(f'    {prev_no} --> {node}')

        end_node = mermaid_id("End_ok", i)
        lines.append(f'    {end_node}(["a agi — tick terminé"])')
        lines.append(f'    {node} -->|agi| {end_node}')

        if sel == 4:
            has_mvrs_slot = True
            tournament_entry = node

        prev_no = node

    fallback = mermaid_id("End_none")
    lines.append(f'    {prev_no} -->|non agi| {fallback}(["aucun emplacement n\'a agi"])')

    # ── Détail du tournoi MVRS, si le sélecteur 4 est présent ───────────
    if has_mvrs_slot and mvrs:
        lines.append("")
        lines.append(f'    {tournament_entry} -.->|"déploie le tournoi"| Tourney{{"Tournoi MVRS (argmax)"}}')
        best_node = "TourneyResult"
        lines.append(f'    {best_node}{{"meilleur score retenu"}}')

        decoded = [(m, v) for m, v in mvrs if m in MVRS_INFO]
        undecoded_tuned = [(m, v) for m, v in mvrs if m not in MVRS_INFO and v != 0]
        undecoded_neutral = [(m, v) for m, v in mvrs if m not in MVRS_INFO and v == 0]

        for mid, val in decoded:
            node = mermaid_id("M", mid)
            fname, formule, plage, apply_addr = MVRS_INFO[mid]
            coef = f"+{val}" if val > 0 else str(val)
            label = f"ID 0x{mid:X} — {fname}<br/>{formule}<br/>plage: {plage} · coefficient fichier: {coef}<br/>si retenu → {apply_addr}"
            lines.append(f'    Tourney --> {node}["{label}"]')
            lines.append(f'    {node} --> {best_node}')

        for mid, val in undecoded_tuned:
            node = mermaid_id("M", mid)
            coef = f"+{val}" if val > 0 else str(val)
            label = f"ID 0x{mid:X} (non décodée)<br/>⚠ coefficient non-neutre : {coef}"
            lines.append(f'    Tourney --> {node}["{label}"]')
            lines.append(f'    {node} --> {best_node}')

        if undecoded_neutral:
            ids = ', '.join(f"0x{m:X}" for m, v in undecoded_neutral)
            node = mermaid_id("M", "rest")
            label = f"{len(undecoded_neutral)} autres identifiants non décodés<br/>({ids})<br/>coefficient neutre (0) — fonctions inconnues"
            lines.append(f'    Tourney --> {node}["{label}"]')
            lines.append(f'    {node} --> {best_node}')

        lines.append(f'    {best_node} --> {mermaid_id("End_ok", "mvrs")}(["exécute l\'option gagnante"])')

    return "\n".join(lines)


def build_markdown(prof, path, diagram):
    name = prof['name'] or '?'
    callsign = prof['callsign'] or '?'
    goal = prof['goal']
    mvrs = prof['mvrs']

    md = []
    md.append(f"# Automate de décision — {name} « {callsign} »")
    md.append("")
    md.append(f"*Généré depuis `{path}` — voir `analysis/AI_SYSTEM.md` pour la "
               "documentation complète du mécanisme.*")
    md.append("")
    md.append("```mermaid")
    md.append(diagram)
    md.append("```")
    md.append("")
    md.append("## Détail des entrées MVRS de ce fichier")
    md.append("")
    md.append("| ID | Fonction (score) | Formule de base | Coefficient fichier | Effet du coefficient | Application (si gagnant) |")
    md.append("|---|---|---|---|---|---|")
    for mid, val in mvrs:
        info = MVRS_INFO.get(mid)
        if val > 0:
            effet = f"**bonus +{val}** — plus susceptible d'être choisi que la moyenne"
        elif val < 0:
            effet = f"**malus {val}** — moins susceptible d'être choisi que la moyenne"
        else:
            effet = "coefficient neutre — ni favorisé ni défavorisé par le fichier"
        if info:
            fname, formule, plage, apply_addr = info
            md.append(f"| `0x{mid:X}` | `{fname}` | {formule} | `{val:+d}` | {effet} | `{apply_addr}` |")
        else:
            md.append(f"| `0x{mid:X}` | *(non décodé)* | — | `{val:+d}` | {effet} | *(inconnue)* |")
    md.append("")
    md.append("*Attention : « coefficient neutre » signifie que le fichier n'ajuste pas ce "
               "type par rapport à la ligne de base — pas que ce comportement « ne fait "
               "rien » s'il gagne le tournoi. Chaque type, une fois retenu, déclenche sa "
               "propre fonction d'application (`vtable+8`, colonne « application ») qui "
               "produit une action concrète (manœuvre, tir, retour en formation, message "
               "radio...). Voir `analysis/AI_SYSTEM.md` §3.7-3.8 pour le détail des "
               "fonctions d'application déjà lues.*")
    md.append("")
    if 4 not in goal:
        md.append("*Ce personnage n'a pas le sélecteur GOAL 4 — les entrées MVRS "
                   "ci-dessus sont présentes dans le fichier mais **ne sont jamais "
                   "consultées en jeu** pour ce personnage.*")
        md.append("")

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
