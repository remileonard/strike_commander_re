#!/usr/bin/env python3
"""Figures du modèle de vol de Pacific Strike (analysis/pacific/README.md § 9), avec les valeurs d'un avion.

Les formules sont celles lues dans PACIFIC.EXE le 2026-11-05 :
  - poussée : Aero_PropellerThrust_4710B ;
  - consigne d'incidence : Aero_ComputeAoACommand_48964 ;
  - incidence comptée dans la traînée : Aero_ComputeDragWithFeedback_481AB ;
  - seuils de vitesse : PhysicsTicks_4A8F4, Aero_ComputeLiftAndSideForce_47E1E.
Les champs sont lus dans le fichier de l'avion (THRS, JDYN) comme JDYN_ReadChunkFields_B8DE8 et
AircraftDynamics_ReadThrustChunk_B81AC.

Usage : python3 tools/ps_physics_figures.py <OBJECTS/CORSAIR.IFF> <dossier de sortie>
"""

import os
import struct
import sys

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt  # noqa: E402
from matplotlib.patches import Rectangle  # noqa: E402

# Constantes de la poussée (virgule fixe 24.8 du code, ici en flottants).
FT_LBF_PER_HP = 0x22600 / 256.0
NEWTON_PER_LBF = 0x472 / 256.0
FEET_PER_METRE = 0x347 / 256.0
PROPELLER_EFFICIENCY = 0xD9 / 256.0
LOW_SPEED_RATIO = 0xA8 / 256.0
PLAYER_POWER_FACTOR = [
    0x10C / 256.0,
    0x113 / 256.0,
    0x119 / 256.0,
]
DRAG_FACTOR_NEGATIVE = [
    1.0,
    0xCC / 256.0,
    0x80 / 256.0,
]
DRAG_FACTOR_POSITIVE = [
    1.0,
    0xA8 / 256.0,
    0x54 / 256.0,
]
COLOURS = [
    "#1f5f8b",
    "#c8701e",
    "#3c8c4a",
    "#8b2f5f",
]


def number(value):
    """Nombre en décimal à la française : virgule, une décimale au plus, espace des milliers."""
    text = f"{value:,.1f}".replace(",", " ").replace(".", ",")
    if text.endswith(",0"):
        text = text[:-2]
    return text


def chunk(data, tag):
    at = data.index(tag)
    size = struct.unpack(">I", data[at + 4:at + 8])[0]
    return data[at + 8:at + 8 + size]


class Aircraft:
    """Champs utiles de THRS et JDYN (positions dans le chunk, voir README § 9)."""

    def __init__(self, path):
        data = open(path, "rb").read()
        thrs = chunk(data, b"THRS")
        jdyn = chunk(data, b"JDYN")
        self.name = chunk(data, b"HNME").split(b"\0")[0].decode("latin-1")
        self.thrs = thrs
        self.thrust_max = struct.unpack_from("<i", thrs, 0)[0] / 256.0
        self.power = struct.unpack_from("<i", thrs, 4)[0] / 256.0
        self.thrs_bytes = (thrs[8], thrs[9], thrs[10])
        self.ceiling = thrs[10] * 100.0
        self.thrs_6 = struct.unpack_from("<i", thrs, 11)[0] / 256.0
        self.thrs_7 = struct.unpack_from("<i", thrs, 15)[0] / 256.0
        self.stall_speed = float(struct.unpack_from("<i", thrs, 15)[0] >> 8)
        self.stall_alpha = jdyn[32]
        self.wing_incidence = jdyn[33]
        self.alpha_max = jdyn[58]
        self.v_ref = float(struct.unpack_from("<h", jdyn, 61)[0])
        self.engine_altitude = float(struct.unpack_from("<i", jdyn, 67)[0])

    def thrust(self, speed, altitude, notch=10, option=1):
        """Poussée du joueur (N) : Aero_PropellerThrust_4710B."""
        power = self.power
        if speed < LOW_SPEED_RATIO * self.v_ref:
            power = power * PLAYER_POWER_FACTOR[option]
        elif speed > self.v_ref:
            power = power / 2.0
        if altitude > self.engine_altitude:
            power = power - power * (altitude - self.engine_altitude) / (self.ceiling - self.engine_altitude)
        v = max(speed, self.thrs_7 / 2.0)
        thrust = PROPELLER_EFFICIENCY * FT_LBF_PER_HP * power / (v * FEET_PER_METRE) * NEWTON_PER_LBF
        return max(0.0, thrust * notch / 10.0)


def figure_thrs(plane, out):
    fig, ax = plt.subplots(figsize=(10, 3.4))
    ax.set_xlim(0, 19)
    ax.set_ylim(-0.4, 3.2)
    ax.axis("off")
    rows = [
        ("Strike Commander (7 octets)", 2.2, [(4, "poussée max\nu32", None), (1, "u8", None), (1, "u8", None),
                                            (1, "u8", None)]),
        ("Pacific Strike (19 octets)", 0.6, [(4, "poussée max\nu32", f"{plane.thrust_max:g}"),
                                           (4, "puissance (ch)\nu32", f"{plane.power:g}"),
                                           (1, "u8", str(plane.thrs_bytes[0])),
                                           (1, "u8", str(plane.thrs_bytes[1])),
                                           (1, "plafond\n×100 m", str(plane.thrs_bytes[2])),
                                           (4, "u32", f"{plane.thrs_6:g}"),
                                           (4, "vitesse de\ndécrochage u32", f"{plane.thrs_7:g}")]),
    ]
    for title, y, fields in rows:
        ax.text(0, y + 1.0, title, fontsize=11, weight="bold")
        x = 0.0
        for width, label, value in fields:
            new = "puissance" in label or "décrochage" in label or (label == "u32" and y < 1)
            colour = "#f2c08a" if new else "#a9c7e4"
            ax.add_patch(Rectangle((x, y), width, 0.8, facecolor=colour, edgecolor="#333333"))
            ax.text(x + width / 2, y + 0.4, label, ha="center", va="center", fontsize=8)
            if value is not None:
                ax.text(x + width / 2, y - 0.25, value, ha="center", va="center", fontsize=9, color="#7a3b00")
            x += width
    ax.text(19, 2.6, "orange : nouveau dans Pacific Strike\nsous les cases : " + plane.name, ha="right", fontsize=8)
    fig.tight_layout()
    fig.savefig(os.path.join(out, "ps_thrs_format.png"), dpi=110)
    plt.close(fig)


def figure_thrust(plane, out):
    fig, ax = plt.subplots(figsize=(8, 4.6))
    speeds = [s * 0.5 for s in range(0, 2 * int(2 * plane.v_ref) + 1)]
    curves = [
        (0.0, f"altitude 0 à {number(plane.engine_altitude)} m (identiques)"),
        (8000.0, "altitude 8 000 m"),
        (10000.0, "altitude 10 000 m"),
    ]
    for k, (altitude, label) in enumerate(curves):
        ax.plot(speeds, [plane.thrust(v, altitude) / 1000.0 for v in speeds], color=COLOURS[k], label=label)
    for x, text in ((plane.thrs_7 / 2.0, "plancher"), (LOW_SPEED_RATIO * plane.v_ref, "0,656 × Vref"),
                    (plane.v_ref, "Vref"), (2 * plane.v_ref, "2 × Vref\n(vitesse max)")):
        ax.axvline(x, color="#999999", linestyle=":", linewidth=1)
        ax.text(x, ax.get_ylim()[1] * 0.97, text, rotation=90, va="top", ha="right", fontsize=8, color="#555555")
    ax.set_xlabel("vitesse (m/s)")
    ax.set_ylabel("poussée (kN), plein gaz (cran 10)")
    ax.set_title(f"{plane.name} : poussée de l'hélice (joueur, option de difficulté à 1)")
    ax.legend(fontsize=8)
    ax.grid(alpha=0.3)
    fig.tight_layout()
    fig.savefig(os.path.join(out, "ps_prop_thrust.png"), dpi=110)
    plt.close(fig)


def figure_aoa(plane, out):
    fig, ax = plt.subplots(figsize=(7, 4))
    sticks = [k / 100.0 for k in range(-100, 101)]
    command = [plane.alpha_max * (m / 2.0 if m < 0 else m) for m in sticks]
    ax.plot(sticks, command, color=COLOURS[0], label="consigne d'incidence = α_max × manche")
    ax.axhline(plane.stall_alpha, color=COLOURS[3], linestyle="--", linewidth=1,
               label=f"incidence de décrochage ({plane.stall_alpha}°)")
    ax.axhline(0, color="#333333", linewidth=0.6)
    ax.set_xlabel("manche longitudinal (−1 poussé … 1 tiré)")
    ax.set_ylabel("incidence voulue (°)")
    ax.set_title(f"{plane.name} : consigne d'incidence (α_max = {plane.alpha_max}°, gouverne intacte)")
    ax.legend(fontsize=8)
    ax.grid(alpha=0.3)
    fig.tight_layout()
    fig.savefig(os.path.join(out, "ps_aoa_command.png"), dpi=110)
    plt.close(fig)


def figure_drag(plane, out):
    fig, ax = plt.subplots(figsize=(7, 4))
    limit = plane.wing_incidence + 1.0
    alphas = [a * 0.25 for a in range(-120, 161)]
    for option in (0, 1, 2):
        values = []
        for a in alphas:
            if a > limit:
                values.append(limit + (a - limit) * DRAG_FACTOR_POSITIVE[option])
            elif a < -limit:
                values.append(-limit + (a + limit) * DRAG_FACTOR_NEGATIVE[option])
            else:
                values.append(a)
        ax.plot(alphas, values, color=COLOURS[option], label=f"option de difficulté {option}")
    ax.axvline(limit, color="#999999", linestyle=":", linewidth=1)
    ax.axvline(-limit, color="#999999", linestyle=":", linewidth=1)
    ax.text(limit, -25, " calage + 1", fontsize=8, color="#555555")
    ax.set_xlabel("incidence (°)")
    ax.set_ylabel("incidence comptée dans la traînée (°)")
    ax.set_title(f"{plane.name} : traînée à forte incidence selon l'option")
    ax.legend(fontsize=8)
    ax.grid(alpha=0.3)
    fig.tight_layout()
    fig.savefig(os.path.join(out, "ps_drag_alpha.png"), dpi=110)
    plt.close(fig)


def figure_speeds(plane, out):
    marks = [
        (0.0, "à l'arrêt au sol : nez remis à 10°"),
        (20.0, "au sol : nez mené vers 10° en dessous"),
        (plane.thrs_7 / 2.0, "plancher de vitesse de la poussée"),
        (25.0, "au sol : roulage au manche en dessous"),
        (plane.stall_speed * 7 / 8, "décrochage, bit 1 posé (7/8)"),
        (plane.stall_speed, "décrochage (dernier champ de THRS)"),
        (LOW_SPEED_RATIO * plane.v_ref, "puissance × option en dessous"),
        (plane.v_ref, "Vref (JDYN champ 23) : puissance ÷ 2 au-dessus"),
        (2 * plane.v_ref, "vitesse maximale (2 × Vref)"),
    ]
    marks.sort()
    fig, ax = plt.subplots(figsize=(10, 4.2))
    ax.set_xlim(-10, 2 * plane.v_ref + 20)
    ax.set_ylim(0, len(marks) + 1)
    ax.axhline(0.5, color="#333333")
    for k, (v, text) in enumerate(marks):
        y = k + 1
        ax.plot([v, v], [0.5, y], color=COLOURS[k % 4], linewidth=1)
        ax.plot(v, 0.5, "o", color=COLOURS[k % 4])
        ax.text(v + 3, y, f"{number(v)} m/s : {text}", va="center", fontsize=8,
                bbox=dict(facecolor="white", edgecolor="none", pad=1))
    ax.set_yticks([])
    ax.set_xlabel("vitesse (m/s)")
    ax.set_title(f"{plane.name} : seuils de vitesse du modèle de vol")
    for side in ("left", "right", "top"):
        ax.spines[side].set_visible(False)
    fig.tight_layout()
    fig.savefig(os.path.join(out, "ps_speed_marks.png"), dpi=110)
    plt.close(fig)


def main():
    plane = Aircraft(sys.argv[1])
    out = sys.argv[2]
    os.makedirs(out, exist_ok=True)
    figure_thrs(plane, out)
    figure_thrust(plane, out)
    figure_aoa(plane, out)
    figure_drag(plane, out)
    figure_speeds(plane, out)
    print(f"{plane.name} : puissance {plane.power:g} ch, Vref {plane.v_ref:g} m/s, hc {plane.engine_altitude:g} m, "
          f"plafond {plane.ceiling:g} m, décrochage {plane.stall_speed:g} m/s / {plane.stall_alpha}°, "
          f"α_max {plane.alpha_max}°, calage {plane.wing_incidence}")


if __name__ == "__main__":
    main()
