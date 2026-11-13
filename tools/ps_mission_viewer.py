#!/usr/bin/env python3
"""Visionneuse des missions de Pacific Strike (application Tkinter autonome).

Ouvre PACIFIC.DAT (rien n'est écrit) et affiche, pour la mission choisie :
- la carte : relief du terrain, pistes, zones AREA, points SPOT, objets PART (couleur = camp, forme = classe de
  l'objet), objets jamais activés par la mission en contour seul ;
- l'objet choisi (clic sur la carte ou dans la liste) : une vue 3D de son modèle (tools/ps_object_render.py), ses
  champs, son profil INTEL (messages radio, et GOAL, MVRS, ATRB pour une IA), ce qui l'active, ses 4 scripts, et sur
  la carte les liens tirés de ses scripts (points SPOT de navigation, objets visés) ;
- les scènes (clic : zone et objets surlignés), les zones et points, les programmes (avec qui les lance), les
  variables (programmes qui les écrivent et qui les lisent), la mission (messages, LOAD, TEAM).
Dans les scripts, un objet, un point, un programme ou une variable se clique. Les scripts s'affichent en
pseudo-code (if / else / goto, blocs indentés ; ps_mission_data.pseudo_code) ou en désassemblage (une instruction
par ligne, avec son octet de départ) : choix « Scripts » de la barre du haut.

Carte : molette = zoom autour du pointeur, glisser = déplacer, clic = choisir, double-clic = recentrer sur la
mission. Barre du bas : position sous le pointeur (x, z, altitude du sol) en repère libRealSpace, en mètres
(x = c0, y = c2 altitude, z = −c1 ; nord en haut = −Z).

Usage : python3 tools/ps_mission_viewer.py [PACIFIC.DAT] [--mission PRLH-M1]
Dépendances : tkinter, numpy, PIL (avec ImageTk). Documentation : analysis/pacific/OUTILS_MISSION.md § 4.
"""
import argparse
import functools
import math
import os
import sys
import tkinter as tk
from tkinter import filedialog
from tkinter import messagebox
from tkinter import ttk

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from PIL import Image  # noqa: E402
from PIL import ImageTk  # noqa: E402

import ps_mission_data as data  # noqa: E402
import ps_mission_dump as pmd  # noqa: E402

JAPAN = "#c81e1e"
US = "#1946be"
OTHER = "#6b6b6b"
ZONE_COLOURS = [
    "#ffc828",
    "#ff78c8",
    "#78e6ff",
    "#b4ff78",
    "#ffa050",
    "#c8a0ff",
]
SELECT = "#ffe600"
LINK_SPOT = "#ffffff"
LINK_OBJECT = "#ff8c00"
SHIP_FORMS = {
    "SHIP",
    "CARR",
}
PLANE_FORMS = {
    "JETP",
}
LAYERS = [
    ("relief", "Relief"),
    ("pistes", "Pistes"),
    ("zones", "Zones"),
    ("points", "Points SPOT"),
    ("objets", "Objets"),
    ("etiquettes", "Étiquettes"),
    ("liens", "Liens des scripts"),
    ("inactifs", "Objets jamais activés"),
]


def camp_colour(camp):
    if camp == 255:
        return JAPAN
    if camp == 1:
        return US
    return OTHER


class Viewer:
    def __init__(self, root, archive_path, mission):
        self.root = root
        self.archive = None
        self.mission = None
        self.terrain = None
        self.terrain_rgb = None
        self.selected = None
        self.selected_scene = None
        self.photo = None
        self.cx = 0.0
        self.cz = 0.0
        self.scale = 0.02
        self.drag_start = None
        self.drag_moved = False
        self.redraw_pending = None
        self.objects_by_number = {}
        self.layer_vars = {}
        root.title("Pacific Strike — missions")
        root.geometry("1500x900")
        self.build()
        if archive_path:
            self.open_archive(archive_path, mission)

    # ------------------------------------------------------------------ interface

    def build(self):
        menu = tk.Menu(self.root)
        files = tk.Menu(menu, tearoff=0)
        files.add_command(label="Ouvrir PACIFIC.DAT…", command=self.ask_archive)
        files.add_separator()
        files.add_command(label="Quitter", command=self.root.destroy)
        menu.add_cascade(label="Fichier", menu=files)
        self.root.config(menu=menu)

        top = ttk.Frame(self.root, padding=4)
        top.pack(side=tk.TOP, fill=tk.X)
        ttk.Label(top, text="Mission :").pack(side=tk.LEFT)
        self.code_mode = tk.StringVar(value="pseudo")
        self.render_yaw = 35
        self.render_cache = {}
        self.render_photo = None
        self.current_owner_program = None
        self.current_program = None
        self.mission_box = ttk.Combobox(top, state="readonly", width=34)
        self.mission_box.pack(side=tk.LEFT, padx=4)
        self.mission_box.bind("<<ComboboxSelected>>", self.on_mission_chosen)
        ttk.Label(top, text="   Scripts :").pack(side=tk.LEFT)
        ttk.Radiobutton(top, text="pseudo-code", value="pseudo", variable=self.code_mode, command=self.refresh_code).pack(side=tk.LEFT)
        ttk.Radiobutton(top, text="désassemblage", value="brut", variable=self.code_mode, command=self.refresh_code).pack(side=tk.LEFT)
        ttk.Label(top, text="   ").pack(side=tk.LEFT)
        for key, text in LAYERS:
            var = tk.BooleanVar(value=key != "etiquettes")
            self.layer_vars[key] = var
            ttk.Checkbutton(top, text=text, variable=var, command=self.schedule_redraw).pack(side=tk.LEFT, padx=3)

        self.status = ttk.Label(self.root, text="Ouvrir PACIFIC.DAT (menu Fichier).", anchor=tk.W, padding=(6, 2))
        self.status.pack(side=tk.BOTTOM, fill=tk.X)

        panes = ttk.PanedWindow(self.root, orient=tk.HORIZONTAL)
        panes.pack(fill=tk.BOTH, expand=True)
        self.panes = panes

        left = ttk.Frame(panes)
        columns = ("n", "objet", "cast", "camp")
        self.object_list = ttk.Treeview(left, columns=columns, show="headings", selectmode="browse")
        for col, text, width in (("n", "N°", 40), ("objet", "Objet", 80), ("cast", "CAST", 80), ("camp", "Camp", 45)):
            self.object_list.heading(col, text=text)
            self.object_list.column(col, width=width, stretch=col == "objet")
        scroll = ttk.Scrollbar(left, orient=tk.VERTICAL, command=self.object_list.yview)
        self.object_list.configure(yscrollcommand=scroll.set)
        self.object_list.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
        scroll.pack(side=tk.RIGHT, fill=tk.Y)
        self.object_list.bind("<<TreeviewSelect>>", self.on_list_select)
        panes.add(left, weight=1)

        self.canvas = tk.Canvas(panes, background="#2a5a9a", highlightthickness=0, cursor="crosshair")
        panes.add(self.canvas, weight=5)
        self.canvas.bind("<Configure>", self.on_resize)
        self.canvas.bind("<ButtonPress-1>", self.on_press)
        self.canvas.bind("<B1-Motion>", self.on_drag)
        self.canvas.bind("<ButtonRelease-1>", self.on_release)
        self.canvas.bind("<Double-Button-1>", self.on_double)
        self.canvas.bind("<Motion>", self.on_motion)
        self.canvas.bind("<MouseWheel>", self.on_wheel)
        self.canvas.bind("<Button-4>", self.on_wheel)
        self.canvas.bind("<Button-5>", self.on_wheel)

        right = ttk.Notebook(panes)
        self.tabs = right
        self.text_object = self.make_text(right, "Objet")
        self.scene_tab = ttk.Frame(right)
        right.add(self.scene_tab, text="Scènes")
        self.scene_list = ttk.Treeview(self.scene_tab, columns=("rang", "zone", "act", "maj", "sortie", "n"), show="headings", height=6, selectmode="browse")
        for col, text, width in (("rang", "Scène", 50), ("zone", "Zone", 120), ("act", "Activation", 70), ("maj", "Mise à jour", 75), ("sortie", "Sortie", 55), ("n", "Objets", 50)):
            self.scene_list.heading(col, text=text)
            self.scene_list.column(col, width=width)
        self.scene_list.pack(side=tk.TOP, fill=tk.X)
        self.scene_list.bind("<<TreeviewSelect>>", self.on_scene_select)
        self.text_scene = self.make_text(self.scene_tab, None)
        self.text_zones = self.make_text(right, "Zones et points")
        prog_tab = ttk.Frame(right)
        right.add(prog_tab, text="Programmes")
        self.prog_list = tk.Listbox(prog_tab, width=8, exportselection=False)
        self.prog_list.pack(side=tk.LEFT, fill=tk.Y)
        self.prog_list.bind("<<ListboxSelect>>", self.on_prog_select)
        self.text_prog = self.make_text(prog_tab, None)
        self.text_vars = self.make_text(right, "Variables")
        self.text_mission = self.make_text(right, "Mission")
        panes.add(right, weight=3)
        self.root.after(50, self.place_sashes)

    def place_sashes(self):
        width = self.root.winfo_width()
        if width < 400:
            self.root.after(50, self.place_sashes)
            return
        self.panes.sashpos(0, 280)
        self.panes.sashpos(1, max(700, width - 560))

    def make_text(self, parent, tab_name):
        frame = ttk.Frame(parent)
        if tab_name is not None:
            parent.add(frame, text=tab_name)
        else:
            frame.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
        text = tk.Text(frame, wrap=tk.NONE, font=("TkFixedFont", 10), padx=6, pady=4, cursor="arrow")
        ys = ttk.Scrollbar(frame, orient=tk.VERTICAL, command=text.yview)
        xs = ttk.Scrollbar(frame, orient=tk.HORIZONTAL, command=text.xview)
        text.configure(yscrollcommand=ys.set, xscrollcommand=xs.set)
        ys.pack(side=tk.RIGHT, fill=tk.Y)
        xs.pack(side=tk.BOTTOM, fill=tk.X)
        text.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
        text.tag_configure("titre", font=("TkDefaultFont", 11, "bold"))
        text.tag_configure("gris", foreground="#707070")
        text.tag_configure("lien", foreground="#0a6b70", underline=True)
        text.configure(state=tk.DISABLED)
        text.link_count = 0
        return text

    # ------------------------------------------------------------------ texte avec liens

    def text_begin(self, text):
        text.configure(state=tk.NORMAL)
        text.delete("1.0", tk.END)
        for tag in text.tag_names():
            if tag.startswith("lien_"):
                text.tag_delete(tag)
        text.link_count = 0

    def text_end(self, text):
        text.configure(state=tk.DISABLED)

    def put(self, text, value, *tags):
        text.insert(tk.END, value, tags)

    def put_link(self, text, value, action, *args):
        text.link_count += 1
        tag = "lien_%d" % text.link_count
        text.insert(tk.END, value, ("lien", tag))
        text.tag_bind(tag, "<Button-1>", functools.partial(self.follow, action, args))
        text.tag_bind(tag, "<Enter>", functools.partial(self.set_cursor, text, "hand2"))
        text.tag_bind(tag, "<Leave>", functools.partial(self.set_cursor, text, "arrow"))

    def set_cursor(self, text, cursor, event):
        text.configure(cursor=cursor)

    def follow(self, action, args, event):
        if action == "objet":
            self.select_object(args[0], True)
        elif action == "programme":
            self.show_program(args[0])
        elif action == "variable":
            self.show_variable(args[0])
        elif action == "point":
            self.center_on_spot(args[0])
        elif action == "scène":
            self.select_scene(args[0])

    def object_label(self, number):
        obj = self.objects_by_number.get(number)
        if obj is None:
            return "n°%d" % number
        return "n°%d %s" % (number, obj["nom"])

    def put_instruction(self, text, instruction, owner):
        start, op, name, args = instruction
        self.put(text, "  %5d  " % start, "gris")
        self.put(text, name)
        spot_args = data.SPOT_ARGS.get(op, []) + data.LOCAL_SPOT_ARGS.get(op, []) + data.TARGET_SPOT_ARGS.get(op, [])
        object_args = data.OBJECT_ARGS.get(op, [])
        if op in (153, 154, 157):
            object_args = [0]
        if op == 157:
            object_args = [0, 1]
        for rank, value in enumerate(args):
            self.put(text, " " if rank == 0 else ", ")
            if op in pmd.FLAG_OPS and rank == 0:
                self.put_link(text, str(value), "variable", value)
            elif op == 2 and rank == 0 and value < len(self.mission["programmes"]):
                self.put_link(text, str(value), "programme", value)
            elif rank in object_args:
                if value == 255:
                    self.put(text, "255")
                    if owner is not None:
                        self.put(text, " (soi : %s)" % self.object_label(owner), "gris")
                else:
                    self.put_link(text, str(value), "objet", value)
                    self.put(text, " (%s)" % self.object_label(value), "gris")
            elif rank in spot_args and value < len(self.mission["points"]):
                self.put_link(text, str(value), "point", value)
                self.put(text, " (SPOT)", "gris")
            else:
                self.put(text, str(value))
        if op == 171 and args and self.current_owner_program is not None:
            for value, kind, target in data.message_comment(self.mission, args[0], owner, self.current_owner_program):
                self.put(text, value, "gris")
        self.put(text, "\n")

    def put_program(self, text, number, owner):
        programs = self.mission["programmes"]
        if number >= len(programs):
            self.put(text, "  (aucun)\n", "gris")
            return
        self.current_owner_program = number
        if self.code_mode.get() == "pseudo":
            for depth, segs in data.pseudo_code(self.mission, number, owner):
                self.put(text, "    " * depth)
                for value, kind, target in segs:
                    if kind is None:
                        self.put(text, value)
                    elif kind == "commentaire":
                        self.put(text, value, "gris")
                    else:
                        self.put_link(text, value, kind, target)
                self.put(text, "\n")
            return
        for instruction in programs[number]:
            self.put_instruction(text, instruction, owner)

    def refresh_code(self):
        """Réécrit les textes ouverts dans le mode choisi (pseudo-code ou désassemblage)."""
        if self.mission is None:
            return
        tab = self.tabs.index(self.tabs.select())
        if self.selected is not None:
            self.show_object(self.objects_by_number[self.selected])
        if self.selected_scene is not None:
            self.select_scene(self.selected_scene, False)
        if self.current_program is not None:
            self.show_program(self.current_program)
        self.tabs.select(tab)

    # ------------------------------------------------------------------ archive et mission

    def ask_archive(self):
        path = filedialog.askopenfilename(title="PACIFIC.DAT", filetypes=[("Archive de Pacific Strike", "*.DAT *.dat"), ("Tous les fichiers", "*")])
        if path:
            self.open_archive(path, None)

    def open_archive(self, path, mission):
        self.status.configure(text="Lecture de %s…" % path)
        self.root.update_idletasks()
        try:
            self.archive = data.Archive(path)
        except (OSError, KeyError, ValueError) as error:
            messagebox.showerror("PACIFIC.DAT", "Lecture impossible : %s" % error)
            return
        self.missions = self.archive.missions()
        self.mission_box["values"] = ["%s — %s" % (m["nom"], m["titre"]) for m in self.missions]
        names = [m["nom"] for m in self.missions]
        index = names.index(mission.upper()) if mission and mission.upper() in names else 0
        self.mission_box.current(index)
        self.load_mission(names[index])

    def on_mission_chosen(self, event):
        self.load_mission(self.missions[self.mission_box.current()]["nom"])

    def load_mission(self, name):
        self.status.configure(text="Chargement de %s…" % name)
        self.root.update_idletasks()
        self.mission = data.describe(self.archive, name)
        self.terrain = self.archive.terrain(self.mission["terrain"])
        self.terrain_rgb = Image.fromarray(self.terrain.rgb())
        self.objects_by_number = {}
        for obj in self.mission["objets"]:
            self.objects_by_number[obj["numéro"]] = obj
        self.selected = None
        self.selected_scene = None
        self.current_program = None
        self.fill_object_list()
        self.fill_scenes()
        self.fill_zones()
        self.fill_programs()
        self.fill_variables()
        self.fill_mission()
        self.text_begin(self.text_object)
        self.put(self.text_object, "Cliquer un objet sur la carte ou dans la liste.\n", "gris")
        self.text_end(self.text_object)
        self.fit_view()
        self.status.configure(text="%s « %s », monde %s, terrain %s" % (name, self.mission["nom"], self.mission["monde"], self.mission["terrain"]))

    def fill_object_list(self):
        self.object_list.delete(*self.object_list.get_children())
        for obj in sorted(self.mission["objets"], key=lambda o: o["numéro"]):
            self.object_list.insert("", tk.END, iid=str(obj["numéro"]), values=(obj["numéro"], obj["nom"], obj["cast"], obj["camp"]))

    def fill_scenes(self):
        self.scene_list.delete(*self.scene_list.get_children())
        zones = self.mission["zones"]
        for scene in self.mission["scènes"]:
            zone = scene["zone"]
            zone_text = "%d %s" % (zone, zones[zone]["nom"]) if zone < len(zones) else "aucune (globale)"
            scripts = ["—" if s == 65535 else str(s) for s in scene["scripts"]]
            self.scene_list.insert("", tk.END, iid=str(scene["rang"]), values=(scene["rang"], zone_text, scripts[0], scripts[1], scripts[2], len(scene["objets"])))
        self.text_begin(self.text_scene)
        self.put(self.text_scene, "Choisir une scène dans la liste.\n", "gris")
        self.text_end(self.text_scene)

    def fill_zones(self):
        t = self.text_zones
        self.text_begin(t)
        self.put(t, "Zones (AREA)\n", "titre")
        for zone in self.mission["zones"]:
            ref = zone["ref"]
            values = ", ".join("%g" % v for v in zone["valeurs"])
            self.put(t, "  zone %d  %s  « %s »  centre (%.0f, %.0f, %.0f)  valeurs %s\n" % (zone["rang"], zone["forme"], zone["nom"], ref[0], ref[1], ref[2], values))
        self.put(t, "  (C : hauteur, rayon ; S : rayon ; B : est, ouest, nord, sud, hauteur)\n\n", "gris")
        self.put(t, "Points (SPOT)\n", "titre")
        for spot in self.mission["points"]:
            w = spot["monde"]
            zone = "—" if spot["zone"] == 65535 else str(spot["zone"])
            self.put(t, "  ")
            self.put_link(t, "SPOT %d" % spot["rang"], "point", spot["rang"])
            self.put(t, "  zone %s  monde (%.0f, %.0f, %.0f)\n" % (zone, w[0], w[1], w[2]))
            for use in spot["emplois"]:
                self.put(t, "        %s, " % use["instruction"], "gris")
                self.put_link(t, "programme %d" % use["programme"], "programme", use["programme"])
                self.put(t, " (%s)\n" % use["rôle"], "gris")
        self.text_end(t)

    def fill_programs(self):
        self.prog_list.delete(0, tk.END)
        for k in range(len(self.mission["programmes"])):
            self.prog_list.insert(tk.END, "  %d" % k)
        self.text_begin(self.text_prog)
        self.put(self.text_prog, "Choisir un programme.\n", "gris")
        self.text_end(self.text_prog)

    def fill_variables(self):
        t = self.text_vars
        self.text_begin(t)
        self.put(t, "Variables (en dessous de 256 : mot ; à partir de 256 : bit)\n\n", "titre")
        for var in self.mission["variables"]:
            self.put(t, "  variable %5d\n" % var["numéro"])
            for role, key in (("écrite par", "écrit"), ("lue par   ", "lu")):
                self.put(t, "        %s " % role, "gris")
                for k, number in enumerate(var[key]):
                    if k:
                        self.put(t, ", ")
                    self.put_link(t, "programme %d" % number, "programme", number)
                self.put(t, "\n")
        self.text_end(t)

    def fill_mission(self):
        t = self.text_mission
        m = self.mission
        self.text_begin(t)
        self.put(t, "%s\n" % m["nom"], "titre")
        self.put(t, "  monde %s, terrain %s, musique %s\n\n" % (m["monde"], m["terrain"], m["musique"]))
        self.put(t, "Messages (MSGS)\n", "titre")
        for k, msg in enumerate(m["messages"]):
            self.put(t, "  %d  %s\n" % (k, msg.replace("\n", " ")))
        self.put(t, "\nObjets de LOAD\n", "titre")
        for k, name in enumerate(m["load"]):
            self.put(t, "  %d  %s\n" % (k, name))
        self.put(t, "\nÉquipe (TEAM, rangs dans PART)\n", "titre")
        for rank in m["team"]:
            if rank < len(m["objets"]):
                obj = m["objets"][rank]
                self.put(t, "  rang %d  " % rank)
                self.put_link(t, self.object_label(obj["numéro"]), "objet", obj["numéro"])
                self.put(t, "  %s\n" % obj["cast"])
        self.text_end(t)

    # ------------------------------------------------------------------ sélection

    def on_list_select(self, event):
        chosen = self.object_list.selection()
        if chosen and (self.selected is None or str(self.selected) != chosen[0]):
            self.select_object(int(chosen[0]), True)

    def select_object(self, number, center):
        obj = self.objects_by_number.get(number)
        if obj is None:
            return
        self.selected = number
        if self.object_list.exists(str(number)):
            self.object_list.selection_set(str(number))
            self.object_list.see(str(number))
        if center:
            self.cx = obj["monde"][0]
            self.cz = obj["monde"][2]
        self.show_object(obj)
        self.tabs.select(0)
        self.schedule_redraw()

    def show_object(self, obj):
        t = self.text_object
        self.text_begin(t)
        self.put(t, "%s  (rang %d dans PART)\n" % (self.object_label(obj["numéro"]), obj["rang"]), "titre")
        self.put_render(t, obj)
        rows = [
            ("CAST", obj["cast"]),
            ("objet", obj["nom"]),
            ("classe", obj["classe"] or "(fichier absent)"),
            ("KIND", "—" if obj["kind"] < 0 else str(obj["kind"])),
            ("objet détruit", obj["détruit"] or "—"),
            ("emport", obj["emport"] or "—"),
            ("zone", "—" if obj["zone"] == 65535 else str(obj["zone"])),
            ("placement", str(obj["placement"])),
            ("décalage", "(%.0f, %.0f, %.0f)" % tuple(obj["décalage"])),
            ("monde", "(%.0f, %.0f, %.0f)" % tuple(obj["monde"])),
            ("sol au point", "%.0f" % self.terrain.ground(obj["monde"][0], obj["monde"][2])),
            ("cap", str(obj["cap"])),
            ("vitesse", str(obj["vitesse"])),
            ("camp", str(obj["camp"])),
            ("allié", "—" if obj["allié"] == 255 else self.object_label(obj["allié"])),
            ("formation", ", ".join(str(v) for v in obj["formation"])),
        ]
        for key, value in rows:
            self.put(t, "  %-14s " % key, "gris")
            self.put(t, "%s\n" % value)
        self.put(t, "  %-14s " % "activé par", "gris")
        if obj["activé_par"]:
            for k, who in enumerate(obj["activé_par"]):
                if k:
                    self.put(t, ", ")
                if who.startswith("programme "):
                    number = int(who.split()[1])
                    self.put_link(t, who, "programme", number)
                elif who.startswith("scène "):
                    number = int(who.split()[1])
                    self.put_link(t, who, "scène", number)
                else:
                    self.put(t, who)
            self.put(t, "\n")
        else:
            self.put(t, "aucune scène ni instruction de la mission\n")
        profile = obj.get("profil")
        self.put(t, "\nprofil : ", "titre")
        if profile is None:
            self.put(t, "INTEL\\%s.IFF absent\n" % obj["cast"], "gris")
        else:
            self.put(t, "%s  (%s, indicatif %s)\n" % (profile["fichier"], profile["nom"], profile["indicatif"]))
            if obj["cast"] == "PLAYER":
                self.put(t, "  OP_SET_MESSAGE du joueur : chunk MSGS de la mission (onglet Mission)\n", "gris")
            for key in sorted(profile["messages"]):
                self.put(t, "  message %3d  " % key, "gris")
                self.put(t, "%s\n" % profile["messages"][key])
            self.put_ai(t, profile)
        for slot, number in enumerate(obj["scripts"]):
            self.put(t, "\n%s : " % data.SCRIPT_SLOTS[slot], "titre")
            if number == 65535:
                self.put(t, "aucun\n", "gris")
                continue
            self.put_link(t, "programme %d" % number, "programme", number)
            self.put(t, "\n")
            self.put_program(t, number, obj["numéro"])
        self.text_end(t)

    def put_render(self, t, obj):
        """Vue de l'objet (niveau de détail 0) et deux boutons pour tourner autour de 45°."""
        key = (obj["nom"], self.render_yaw)
        if key not in self.render_cache:
            image = self.archive.render_object(obj["nom"], self.render_yaw, 20.0)
            if image is not None:
                image = image.resize((480, 300), Image.NEAREST)
            self.render_cache[key] = image
        image = self.render_cache[key]
        if image is None:
            self.put(t, "  (pas de modèle 3D dans OBJECTS\\%s.IFF)\n" % obj["nom"], "gris")
            return
        self.render_photo = ImageTk.PhotoImage(image)
        t.image_create(tk.END, image=self.render_photo, padx=4, pady=4)
        self.put(t, "\n  ")
        t.window_create(tk.END, window=ttk.Button(t, text="◀ 45°", width=6, command=self.turn_left))
        self.put(t, "  vue du cap %d, 20° au-dessus  " % (self.render_yaw % 360), "gris")
        t.window_create(tk.END, window=ttk.Button(t, text="45° ▶", width=6, command=self.turn_right))
        self.put(t, "\n")

    def turn_left(self):
        self.turn(-45)

    def turn_right(self):
        self.turn(45)

    def turn(self, step):
        self.render_yaw = (self.render_yaw + step) % 360
        if self.selected is not None:
            self.show_object(self.objects_by_number[self.selected])

    def put_ai(self, t, profile):
        """Chunks _AI_ du profil : GOAL (rôle de chaque valeur dans PACIFIC.EXE), MVRS (paires telles quelles), ATRB."""
        ai = profile.get("ia")
        if not ai:
            self.put(t, "  pas de FORM _AI_ dans le profil\n", "gris")
            return
        if "GOAL" in ai:
            self.put(t, "\n  GOAL", "titre")
            self.put(t, "  (dans l'ordre du fichier)\n", "gris")
            for rank, value in enumerate(ai["GOAL"]):
                self.put(t, "    %d. %3d\n" % (rank + 1, value))
        if "MVRS" in ai:
            self.put(t, "\n  MVRS", "titre")
            self.put(t, "  (numéro de manœuvre, valeur signée ; sens relu dans STRIKE.EXE seulement, AI_SYSTEM.md § 3)\n", "gris")
            for ident, value in ai["MVRS"]:
                self.put(t, "    manœuvre %3d   valeur %3d\n" % (ident, value))
        if "ATRB" in ai:
            self.put(t, "\n  ATRB", "titre")
            self.put(t, "  (octets du fichier)\n", "gris")
            for rank, value in enumerate(ai["ATRB"]):
                self.put(t, "    octet %2d   %3d\n" % (rank, value))

    def on_scene_select(self, event):
        chosen = self.scene_list.selection()
        if chosen:
            self.select_scene(int(chosen[0]))

    def select_scene(self, rank, center=True):
        scene = self.mission["scènes"][rank]
        self.selected_scene = rank
        if self.scene_list.exists(str(rank)) and self.scene_list.selection() != (str(rank),):
            self.scene_list.selection_set(str(rank))
        self.tabs.select(1)
        t = self.text_scene
        self.text_begin(t)
        self.put(t, "Scène %d\n" % rank, "titre")
        self.put(t, "  actif (octet 0) %d, arrivée %d, cap %d, point (%.0f, %.0f, %.0f)\n" % (scene["actif"], scene["arrivée"], scene["cap_arrivée"], *scene["point_arrivée"]))
        self.put(t, "\nObjets (rang → numéro)\n", "titre")
        for obj_rank in scene["objets"]:
            if obj_rank < len(self.mission["objets"]):
                obj = self.mission["objets"][obj_rank]
                self.put(t, "  rang %3d  " % obj_rank)
                self.put_link(t, self.object_label(obj["numéro"]), "objet", obj["numéro"])
                self.put(t, "  %s\n" % obj["cast"])
            else:
                self.put(t, "  rang %3d  (hors de PART)\n" % obj_rank, "gris")
        for slot, number in enumerate(scene["scripts"]):
            self.put(t, "\n%s : " % data.SCENE_SLOTS[slot], "titre")
            if number == 65535:
                self.put(t, "aucun\n", "gris")
                continue
            self.put_link(t, "programme %d" % number, "programme", number)
            self.put(t, "\n")
            self.put_program(t, number, None)
        self.text_end(t)
        zone = scene["zone"]
        if center and zone < len(self.mission["zones"]):
            ref = self.mission["zones"][zone]["ref"]
            self.cx = ref[0]
            self.cz = ref[2]
        self.schedule_redraw()

    def on_prog_select(self, event):
        chosen = self.prog_list.curselection()
        if chosen:
            self.show_program(chosen[0])

    def show_program(self, number):
        if number >= len(self.mission["programmes"]):
            return
        self.current_program = number
        self.tabs.select(3)
        self.prog_list.selection_clear(0, tk.END)
        self.prog_list.selection_set(number)
        self.prog_list.see(number)
        t = self.text_prog
        self.text_begin(t)
        self.put(t, "Programme %d\n" % number, "titre")
        self.put(t, "  lancé par : ", "gris")
        callers = self.mission["lancé_par"].get(number, self.mission["lancé_par"].get(str(number), []))
        if not callers:
            self.put(t, "aucun objet, aucune scène ni aucun programme de la mission\n")
        for k, who in enumerate(callers):
            if k:
                self.put(t, "             ", "gris")
            if who["type"] == "objet":
                self.put_link(t, self.object_label(who["numéro"]), "objet", who["numéro"])
            elif who["type"] == "scène":
                self.put_link(t, "scène %d" % who["rang"], "scène", who["rang"])
            else:
                self.put_link(t, "programme %d" % who["numéro"], "programme", who["numéro"])
            self.put(t, " (%s)\n" % who["rôle"], "gris")
        self.put(t, "\n")
        self.put_program(t, number, None)
        self.text_end(t)

    def show_variable(self, number):
        self.tabs.select(4)
        t = self.text_vars
        index = t.search("variable %5d\n" % number, "1.0", tk.END)
        if index:
            t.see(index)
            t.tag_remove("sel", "1.0", tk.END)
            t.tag_add("sel", index, "%s lineend" % index)

    def center_on_spot(self, rank):
        spot = self.mission["points"][rank]
        self.cx = spot["monde"][0]
        self.cz = spot["monde"][2]
        self.schedule_redraw()

    # ------------------------------------------------------------------ vue

    def to_screen(self, x, z):
        w = self.canvas.winfo_width()
        h = self.canvas.winfo_height()
        return (w / 2 + (x - self.cx) * self.scale, h / 2 + (z - self.cz) * self.scale)

    def to_world(self, sx, sy):
        w = self.canvas.winfo_width()
        h = self.canvas.winfo_height()
        return (self.cx + (sx - w / 2) / self.scale, self.cz + (sy - h / 2) / self.scale)

    def fit_view(self):
        xs = []
        zs = []
        for zone in self.mission["zones"]:
            radius = zone["valeurs"][-1] if zone["forme"] in ("C", "S") else max(zone["valeurs"][:4])
            xs += [zone["ref"][0] - radius, zone["ref"][0] + radius]
            zs += [zone["ref"][2] - radius, zone["ref"][2] + radius]
        for obj in self.mission["objets"]:
            if obj["placement"] == 0:
                xs.append(obj["monde"][0])
                zs.append(obj["monde"][2])
        for spot in self.mission["points"]:
            if any(u["rôle"] == "navigation" for u in spot["emplois"]):
                xs.append(spot["monde"][0])
                zs.append(spot["monde"][2])
        if not xs:
            xs = [-self.terrain.half, self.terrain.half]
            zs = [-self.terrain.half, self.terrain.half]
        self.cx = (min(xs) + max(xs)) / 2
        self.cz = (min(zs) + max(zs)) / 2
        span_x = max(max(xs) - min(xs), 2000) * 1.1
        span_z = max(max(zs) - min(zs), 2000) * 1.1
        w = max(self.canvas.winfo_width(), 200)
        h = max(self.canvas.winfo_height(), 200)
        self.scale = min(w / span_x, h / span_z)
        self.schedule_redraw()

    def schedule_redraw(self, *args):
        if self.redraw_pending is None:
            self.redraw_pending = self.root.after(15, self.redraw)

    def on_resize(self, event):
        self.schedule_redraw()

    def on_wheel(self, event):
        if self.mission is None:
            return
        if event.num == 4 or getattr(event, "delta", 0) > 0:
            factor = 1.25
        else:
            factor = 0.8
        wx, wz = self.to_world(event.x, event.y)
        self.scale = min(max(self.scale * factor, 0.0005), 2.0)
        sx, sz = self.to_screen(wx, wz)
        self.cx += (sx - event.x) / self.scale
        self.cz += (sz - event.y) / self.scale
        self.schedule_redraw()

    def on_press(self, event):
        self.drag_start = (event.x, event.y, self.cx, self.cz)
        self.drag_moved = False

    def on_drag(self, event):
        if self.drag_start is None:
            return
        x0, y0, cx, cz = self.drag_start
        if abs(event.x - x0) + abs(event.y - y0) > 3:
            self.drag_moved = True
        self.cx = cx - (event.x - x0) / self.scale
        self.cz = cz - (event.y - y0) / self.scale
        self.schedule_redraw()

    def on_release(self, event):
        if self.mission is not None and not self.drag_moved:
            self.pick(event.x, event.y)
        self.drag_start = None

    def on_double(self, event):
        if self.mission is not None:
            self.fit_view()

    def on_motion(self, event):
        if self.mission is None:
            return
        x, z = self.to_world(event.x, event.y)
        self.status.configure(text="x %.0f   z %.0f   sol %.0f m   (%.1f pixels par km)   %s « %s »" % (
            x, z, self.terrain.ground(x, z), self.scale * 1000, self.mission_box.get().split(" — ")[0], self.mission["nom"]))

    def pick(self, sx, sy):
        best = None
        best_d = 14.0
        for obj in self.mission["objets"]:
            if not self.drawn(obj):
                continue
            px, py = self.to_screen(obj["monde"][0], obj["monde"][2])
            d = math.hypot(px - sx, py - sy)
            if d < best_d:
                best = obj
                best_d = d
        if best is not None:
            self.select_object(best["numéro"], False)

    def drawn(self, obj):
        if not self.layer_vars["objets"].get():
            return False
        if obj["placement"] != 0:
            return False
        if not obj["activé_par"] and not self.layer_vars["inactifs"].get():
            return False
        return True

    # ------------------------------------------------------------------ dessin

    def redraw(self):
        self.redraw_pending = None
        c = self.canvas
        c.delete("all")
        if self.mission is None:
            return
        w = c.winfo_width()
        h = c.winfo_height()
        if self.layer_vars["relief"].get():
            self.draw_terrain(w, h)
        if self.layer_vars["pistes"].get():
            for r in self.terrain.runways:
                a = self.to_screen(r["x0"], r["z0"])
                b = self.to_screen(r["x1"], r["z1"])
                c.create_rectangle(a[0], a[1], max(b[0], a[0] + 2), max(b[1], a[1] + 2), fill="#5a5a5a", outline="#202020")
        if self.layer_vars["zones"].get():
            self.draw_zones()
        if self.layer_vars["points"].get():
            self.draw_spots()
        if self.layer_vars["liens"].get() and self.selected is not None:
            self.draw_links()
        self.draw_objects()
        self.draw_scale(w, h)

    def draw_terrain(self, w, h):
        side = self.terrain_rgb.size[0]
        per_metre = side / (2 * self.terrain.half)
        x0, z0 = self.to_world(0, 0)
        x1, z1 = self.to_world(w, h)
        left = (x0 + self.terrain.half) * per_metre
        top = (z0 + self.terrain.half) * per_metre
        right = (x1 + self.terrain.half) * per_metre
        bottom = (z1 + self.terrain.half) * per_metre
        cl = max(0, int(math.floor(left)))
        ct = max(0, int(math.floor(top)))
        cr = min(side, int(math.ceil(right)))
        cb = min(side, int(math.ceil(bottom)))
        if cr <= cl or cb <= ct:
            return
        crop = self.terrain_rgb.crop((cl, ct, cr, cb))
        sx0, sy0 = self.to_screen(cl / per_metre - self.terrain.half, ct / per_metre - self.terrain.half)
        sx1, sy1 = self.to_screen(cr / per_metre - self.terrain.half, cb / per_metre - self.terrain.half)
        width = max(1, int(round(sx1 - sx0)))
        height = max(1, int(round(sy1 - sy0)))
        if width * height > 25000000:
            return
        image = crop.resize((width, height), Image.BILINEAR)
        self.photo = ImageTk.PhotoImage(image)
        self.canvas.create_image(int(round(sx0)), int(round(sy0)), image=self.photo, anchor=tk.NW)

    def draw_zones(self):
        c = self.canvas
        scene_of_zone = {}
        for scene in self.mission["scènes"]:
            scene_of_zone.setdefault(scene["zone"], scene["rang"])
        chosen_zone = None
        if self.selected_scene is not None:
            chosen_zone = self.mission["scènes"][self.selected_scene]["zone"]
        for zone in self.mission["zones"]:
            colour = ZONE_COLOURS[zone["rang"] % len(ZONE_COLOURS)]
            width = 4 if zone["rang"] == chosen_zone else 2
            x, _, z = zone["ref"]
            v = zone["valeurs"]
            if zone["forme"] in ("C", "S"):
                radius = v[-1] if zone["forme"] == "C" else v[0]
                a = self.to_screen(x - radius, z - radius)
                b = self.to_screen(x + radius, z + radius)
                c.create_oval(a[0], a[1], b[0], b[1], outline=colour, width=width, dash=(8, 5))
                top = self.to_screen(x, z - radius)
            elif zone["forme"] == "B" and len(v) >= 4:
                a = self.to_screen(x - v[1], z - v[2])
                b = self.to_screen(x + v[0], z + v[3])
                c.create_rectangle(a[0], a[1], b[0], b[1], outline=colour, width=width, dash=(8, 5))
                top = self.to_screen(x, z - v[2])
            else:
                top = self.to_screen(x, z)
            scene = scene_of_zone.get(zone["rang"])
            text = "zone %d « %s »" % (zone["rang"], zone["nom"])
            if scene is not None:
                text += " — scène %d" % scene
            self.shadow_text(top[0], top[1] - 4, text, colour, ("TkDefaultFont", 10, "bold"), tk.S, "black")

    def draw_spots(self):
        c = self.canvas
        for spot in self.mission["points"]:
            uses = spot["emplois"]
            if uses and all(u["rôle"] == "repère d'un objet" for u in uses):
                continue
            x, y = self.to_screen(spot["monde"][0], spot["monde"][2])
            s = 6
            c.create_polygon(x, y - s, x + s, y, x, y + s, x - s, y, fill="white", outline="black")
            if self.layer_vars["etiquettes"].get():
                self.shadow_text(x + 8, y, "SPOT %d" % spot["rang"], "black", ("TkDefaultFont", 9, "bold"), tk.W)

    def draw_links(self):
        obj = self.objects_by_number.get(self.selected)
        if obj is None or obj["placement"] != 0:
            return
        c = self.canvas
        start = self.to_screen(obj["monde"][0], obj["monde"][2])
        previous = start
        for link in obj["liens"]["points"]:
            if link["point"] >= len(self.mission["points"]):
                continue
            spot = self.mission["points"][link["point"]]
            end = self.to_screen(spot["monde"][0], spot["monde"][2])
            c.create_line(previous[0], previous[1], end[0], end[1], fill=LINK_SPOT, width=2, dash=(6, 4), arrow=tk.LAST)
            previous = end
        for link in obj["liens"]["objets"]:
            target = self.objects_by_number.get(link["numéro"])
            if target is None or target["placement"] != 0:
                continue
            end = self.to_screen(target["monde"][0], target["monde"][2])
            c.create_line(start[0], start[1], end[0], end[1], fill=LINK_OBJECT, width=2, arrow=tk.LAST)

    def draw_objects(self):
        c = self.canvas
        chosen_ranks = set()
        if self.selected_scene is not None:
            chosen_ranks = set(self.mission["scènes"][self.selected_scene]["objets"])
        labels = self.layer_vars["etiquettes"].get()
        for obj in self.mission["objets"]:
            if not self.drawn(obj):
                continue
            x, y = self.to_screen(obj["monde"][0], obj["monde"][2])
            colour = camp_colour(obj["camp"])
            fill = colour if obj["activé_par"] else ""
            outline = "white" if obj["activé_par"] else colour
            s = 7
            if obj["classe"] in PLANE_FORMS:
                a = math.radians(obj["cap"])
                dx = math.sin(a)
                dy = -math.cos(a)
                points = [
                    x + dx * s * 1.6, y + dy * s * 1.6,
                    x - dx * s + dy * s, y - dy * s - dx * s,
                    x - dx * s - dy * s, y - dy * s + dx * s,
                ]
                c.create_polygon(points, fill=fill, outline=outline, width=1 if fill else 2)
            elif obj["classe"] in SHIP_FORMS:
                a = math.radians(obj["cap"])
                dx = math.sin(a)
                dy = -math.cos(a)
                length = s * 2.0
                wide = s * 0.7
                points = [
                    x + dx * length, y + dy * length,
                    x + dy * wide, y - dx * wide,
                    x - dx * length + dy * wide, y - dy * length - dx * wide,
                    x - dx * length - dy * wide, y - dy * length + dx * wide,
                    x - dy * wide, y + dx * wide,
                ]
                c.create_polygon(points, fill=fill, outline=outline, width=1 if fill else 2)
            elif obj["classe"] == "":
                c.create_line(x - 6, y, x + 6, y, fill=outline, width=2)
            else:
                c.create_rectangle(x - s * 0.7, y - s * 0.7, x + s * 0.7, y + s * 0.7, fill=fill, outline=outline, width=1 if fill else 2)
            if obj["cast"] == "PLAYER":
                c.create_oval(x - 13, y - 13, x + 13, y + 13, outline=SELECT, width=2)
            if obj["rang"] in chosen_ranks:
                c.create_oval(x - 11, y - 11, x + 11, y + 11, outline=ZONE_COLOURS[0], width=2, dash=(3, 2))
            if obj["numéro"] == self.selected:
                c.create_oval(x - 15, y - 15, x + 15, y + 15, outline=SELECT, width=3)
                self.shadow_text(x + 14, y - 8, self.object_label(obj["numéro"]), colour, ("TkDefaultFont", 10, "bold"), tk.W)
            elif labels:
                self.shadow_text(x + 10, y, "n°%d %s" % (obj["numéro"], obj["nom"]), colour, ("TkDefaultFont", 9), tk.W)

    def shadow_text(self, x, y, text, colour, font, anchor, shadow="white"):
        for ox, oy in ((-1, 0), (1, 0), (0, -1), (0, 1)):
            self.canvas.create_text(x + ox, y + oy, text=text, fill=shadow, font=font, anchor=anchor)
        self.canvas.create_text(x, y, text=text, fill=colour, font=font, anchor=anchor)

    def draw_scale(self, w, h):
        c = self.canvas
        target = 120 / self.scale
        steps = [100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000]
        metres = steps[0]
        for step in steps:
            if step <= target:
                metres = step
        length = metres * self.scale
        c.create_rectangle(16, h - 22, 16 + length, h - 16, fill="black", outline="white")
        text = "%d km" % (metres // 1000) if metres >= 1000 else "%d m" % metres
        self.shadow_text(16, h - 26, text, "black", ("TkDefaultFont", 9, "bold"), tk.SW)
        c.create_line(w - 30, 60, w - 30, 24, fill="black", width=3, arrow=tk.LAST)
        self.shadow_text(w - 30, 20, "N (−Z)", "black", ("TkDefaultFont", 10, "bold"), tk.S)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("archive", nargs="?", help="PACIFIC.DAT (sinon : menu Fichier)")
    ap.add_argument("--mission", default="PRLH-M1")
    args = ap.parse_args()
    root = tk.Tk()
    Viewer(root, args.archive, args.mission)
    root.mainloop()


if __name__ == "__main__":
    main()
