#!/usr/bin/env python3
"""
build_function_index.py — (re)construit analysis/function_index.json.

À relancer si strike.asm est modifié, ou si known_functions.json a été
mis à jour et qu'on veut regénérer un index enrichi à jour.

Ce script :
  1. Repère les bornes de tous les segments (seg/stub/ovr) de strike.asm.
  2. Extrait les 3449 fonctions `proc far/near ... endp`, avec pour
     chacune : segment, plage de lignes, taille, liste des appels sortants.
  3. Ajoute le point d'entrée spécial `start` (seg000), qui n'a pas de nom
     `sub_XXXXX` — c'est le seul cas de ce type dans tout le fichier.
  4. Enrichit chaque entrée avec le nom attribué (new_name) et le résumé
     (summary) depuis analysis/known_functions.json, si disponible.

Usage (depuis la racine de l'archive) :
    python3 tools/build_function_index.py

Sortie : analysis/function_index.json, analysis/segment_boundaries.json
"""
import re
import json
import os

ROOT = os.path.join(os.path.dirname(__file__), '..')
STRIKE_ASM = os.path.join(ROOT, 'source', 'strike.asm')
KNOWN_FUNCTIONS = os.path.join(ROOT, 'analysis', 'known_functions.json')
OUT_INDEX = os.path.join(ROOT, 'analysis', 'function_index.json')
OUT_SEGS = os.path.join(ROOT, 'analysis', 'segment_boundaries.json')


def main():
    lines = open(STRIKE_ASM, encoding='utf-8', errors='replace').readlines()

    # 1. Bornes de segments
    segs = {}
    cur, start = None, None
    for i, l in enumerate(lines):
        m = re.match(r'^((?:seg|stub|ovr)\d+)\s+segment\b', l)
        if m:
            if cur is not None:
                # Segment precedent jamais ferme par son propre 'ends' avant
                # que celui-ci ne commence (anomalie reelle du desassemblage,
                # confirmee pour seg212) - on le cloture implicitement ici
                # plutot que de le perdre silencieusement.
                segs[cur] = (start, i - 1)
            cur, start = m.group(1), i
        m2 = re.match(r'^((?:seg|stub|ovr)\d+)\s+ends\b', l)
        if m2 and cur == m2.group(1):
            segs[cur] = (start, i)
            cur = None
    if cur is not None:
        segs[cur] = (start, len(lines) - 1)

    seg_ranges = sorted(segs.items(), key=lambda kv: kv[1][0])

    def find_segment_for_line(line_idx):
        for name, (lo, hi) in seg_ranges:
            if lo <= line_idx <= hi:
                return name
        return None

    # 2. Fonctions proc far/near
    index = {}
    cur_name = cur_start = cur_type = None
    for i, l in enumerate(lines):
        mp = re.match(r'^(sub_[0-9A-Fa-f]+)\s+proc\s+(far|near)', l)
        me = re.match(r'^(\S+)\s+endp', l)
        if mp:
            cur_name, cur_start, cur_type = mp.group(1), i, mp.group(2)
        if me and cur_name and me.group(1) == cur_name:
            calls = []
            for j in range(cur_start, i + 1):
                mc = re.search(r'call\s+(?:near ptr\s+|far ptr\s+)?(\S+)', lines[j])
                if mc and not re.match(r'^(dword|word|byte)', mc.group(1)):
                    calls.append(mc.group(1))
            index[cur_name] = {
                'segment': find_segment_for_line(cur_start),
                'start_line': cur_start + 1,
                'end_line': i + 1,
                'lines': i - cur_start + 1,
                'type': cur_type,
                'calls': calls,
            }
            cur_name = None

    # 3. Point d'entrée spécial "start" (seg000, pas de préfixe sub_)
    start_line = None
    for i, l in enumerate(lines):
        if re.match(r'^start\s+proc\s+near', l):
            start_line = i
            break
    if start_line is not None:
        end_line = None
        for i in range(start_line, len(lines)):
            if re.match(r'^start\s+endp', lines[i]):
                end_line = i
                break
        calls = []
        for j in range(start_line, end_line + 1):
            mc = re.search(r'call\s+(?:near ptr\s+|far ptr\s+)?(\S+)', lines[j])
            if mc and not re.match(r'^(dword|word|byte)', mc.group(1)):
                calls.append(mc.group(1))
        index['start'] = {
            'segment': find_segment_for_line(start_line),
            'start_line': start_line + 1,
            'end_line': end_line + 1,
            'lines': end_line - start_line + 1,
            'type': 'near',
            'calls': calls,
        }

    # 4. Enrichissement avec known_functions.json
    known = {}
    if os.path.exists(KNOWN_FUNCTIONS):
        known = json.load(open(KNOWN_FUNCTIONS, encoding='utf-8'))

    for addr, info in index.items():
        if addr in known:
            info['new_name'] = known[addr].get('new_name', addr)
            info['summary'] = known[addr].get('summary', '')
        else:
            info['new_name'] = addr
            info['summary'] = ''

    # 5. Entrees de known_functions.json absentes de l'index proc (labels
    # loc_XXXXX de style methode de vtable, sans bloc proc/endp explicite) :
    # localisees par recherche de leur ligne de definition ("KEY:") pour
    # rester consultables via lookup.py, meme si elles ne sont pas des
    # 'fonctions' proc au sens strict. Etendue reelle (end_line) tiree de
    # LABEL_KNOWN_EXTENTS quand elle a ete verifiee manuellement pendant
    # une session (lecture ligne a ligne) ; a defaut, bornee a 1 ligne
    # (start_line uniquement fiable) plutot que de deviner.
    LABEL_KNOWN_EXTENTS = {
        'loc_5ACC': 14329,   # AIEntity_MasterTick_5ACC, lue en integralite
        'loc_12E47': 37442,  # PilotProfile_LoadATRB_12E47, lue en integralite
        'loc_878F': 19662,   # Goal_ActiveWingmanEngagement_878F, lue en integralite
        'loc_1642C': 43953,  # Radio_EvaluateOptionAvailability_1642C, lue en integralite
        'loc_683D7': 221703,  # VROOMM_RestoreIntAndDispatch_683D7, lue en integralite
        'loc_68B2F': 223230,  # VROOMM_MainEntry_68B2F, lue en integralite (fin du segment)
        'loc_A002': 22382,   # AI_ProximityRadioCalloutTrigger_A002, lue en integralite
        'loc_A1DF': 22441,   # AI_PropagateAircraftFlagsAndFollowGate_A1DF, lue en integralite
        'loc_A2F9': 22522,   # AI_ResetThreatScoreGlobal_A2F9, lue en integralite
        'loc_A307': 22938,   # Goal_SetObjective_A307, lue en integralite (405 lignes, switch 31 cas)
        'loc_3FCB': 10770,   # MVRS_ID3_ScoreGeneric_3FCB, lue en integralite
        'loc_41DD': 11074,   # MVRS_ID5_ScoreGeneric_41DD, lue en integralite
        'loc_434E': 11404,   # MVRS_ID6_ScoreGeneric_434E, lue en integralite
        'loc_47D4': 11900,   # MVRS_ID8_ScoreManeuverSkillGated_47D4, lue en integralite
        'loc_49DA': 11925,   # MVRS_ID9_ScorePlaceholder_49DA, lue en integralite
        'loc_4A02': 11950,   # MVRS_ID10_ScorePlaceholder_4A02, lue en integralite
        'loc_4A2A': 11964,   # MVRS_ID11_ScorePlaceholder_4A2A, lue en integralite
        'loc_4A49': 11989,   # MVRS_ID12_ScorePlaceholder_4A49, lue en integralite
        'loc_4A71': 12014,   # MVRS_ID13_ScorePlaceholder_4A71, lue en integralite
        'loc_11369': 34529,  # MVRS_ID13_ApplyTrivialDelegate_11369, lue en integralite
        'loc_1011F': 33049,  # MVRS_ID6_TimerTickAndSubmodeSwitch_1011F, lue en integralite (switch 8 phases)
        'loc_1138F': 34584,  # MVRS_ID14b_ApplySetTimer_1138F, lue en integralite
        'loc_113FD': 34911,  # MVRS_ID14b_TickManeuverSequence_113FD, lue en integralite (switch 5 phases)
        'loc_11763': 34946,  # MVRS_ID15b_ApplyPersistence_11763, lue en integralite
        'loc_11809': 35021,  # MVRS_ID16_ApplyPersistence_11809, lue en integralite
        'loc_118C3': 35091,  # MVRS_ID19_ApplyReturnToBase_118C3, lue en integralite
        'loc_1195A': 35180,  # MVRS_ID21_ApplyStoreNavCommand_1195A, lue en integralite
        'loc_11A04': 35245,  # MVRS_ID21_TickApplyGuidance_11A04, lue en integralite
        'loc_1137E': 34539,  # MVRS_ID13_TickTrivialDelegate_1137E, lue en integralite
        'loc_F2C8': 31356,   # MVRS_ID3_ApplyBreakDirection_F2C8, lue en integralite
        'loc_FCE1': 32360,   # MVRS_ID5_ApplySetAspectBit_FCE1, lue partiellement (debut complet)
        'loc_100B6': 32680,  # MVRS_ID6_ApplySetTimer_100B6, lue en integralite
        'loc_1060A': 33232,  # MVRS_ID7_ApplySetTimer_1060A, lue en integralite
        'loc_10AF2': 33770,  # MVRS_ID8_ApplyFuelGatedManeuver_10AF2, lue partiellement (debut complet)
    }
    missing = [k for k in known if k not in index and not k.startswith('unnamed_')]
    for addr in missing:
        pattern = re.compile(rf'^{re.escape(addr)}:')
        for i, l in enumerate(lines):
            if pattern.match(l):
                start_line = i + 1
                end_line = LABEL_KNOWN_EXTENTS.get(addr, start_line)
                index[addr] = {
                    'segment': find_segment_for_line(i),
                    'start_line': start_line,
                    'end_line': end_line,
                    'lines': end_line - start_line + 1,
                    'type': 'label',
                    'calls': [],
                    'new_name': known[addr].get('new_name', addr),
                    'summary': known[addr].get('summary', ''),
                }
                break

    os.makedirs(os.path.dirname(OUT_INDEX), exist_ok=True)
    json.dump(index, open(OUT_INDEX, 'w', encoding='utf-8'), ensure_ascii=False, indent=0)
    json.dump({k: [v[0] + 1, v[1] + 1] for k, v in segs.items()},
              open(OUT_SEGS, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)

    print(f"Index reconstruit : {len(index)} fonctions, {len(segs)} segments.")
    undocumented = [k for k, v in index.items() if not v['summary']]
    if undocumented:
        print(f"⚠️  {len(undocumented)} fonctions sans entrée dans known_functions.json : "
              f"{undocumented[:10]}{'...' if len(undocumented) > 10 else ''}")
    else:
        print("Toutes les fonctions ont une entrée dans known_functions.json.")


if __name__ == '__main__':
    main()
