#!/usr/bin/env python3
"""
prof_editor.py -- GUI editor for Strike Commander pilot profile (PROF)
.IFF files.

Unlike JDYN chunks (fixed-offset fields, edited in place), most PROF
sub-chunks are VARIABLE LENGTH (MVRS/GOAL entry lists, MSGS strings,
OPTS bytes, INFO name/callsign). So this editor fully parses the file
into an editable structure on open, and REBUILDS the whole file (with
correct big-endian IFF chunk/FORM sizes and even-byte padding) on save.
ATRB and VERS are the only truly fixed-size fields.

Format reference: see the Strike Commander RE archive,
analysis/README.md ("Découverte majeure 14/15") and
tools/decode_prof.py, which this editor's parser is based on.

Usage:
    python3 prof_editor.py [file.IFF]

Requires only the standard library (tkinter).
"""
import struct
import sys
import tkinter as tk
from tkinter import ttk, filedialog, messagebox


# ---------------------------------------------------------------------
# IFF chunk read/write helpers
# ---------------------------------------------------------------------

def read_chunk_header(data, pos):
    tag = data[pos:pos + 4]
    length = struct.unpack('>I', data[pos + 4:pos + 8])[0]
    return tag, length, pos + 8


def read_cstring(data, pos):
    end = data.index(b'\x00', pos)
    return data[pos:end].decode('latin-1'), end + 1


def pack_chunk(tag, payload):
    """4-byte tag + big-endian u32 length + payload, padded to even."""
    out = bytearray(tag)
    out += struct.pack('>I', len(payload))
    out += payload
    if len(payload) % 2:
        out += b'\x00'
    return bytes(out)


def pack_cstring(s):
    return s.encode('latin-1', 'replace') + b'\x00'


# ---------------------------------------------------------------------
# PROF parsing -> editable structure
# ---------------------------------------------------------------------

class ProfFile:
    """In-memory editable representation of a PROF .IFF file."""

    def __init__(self):
        self.vers = 2
        self.has_spch = False
        self.spch = 0
        self.info_id = 0
        self.info_name = ""
        self.info_callsign = ""
        self.has_opts = False
        self.opts = b""                    # raw bytes, edited as hex
        self.msgs = []                     # list of (index:int, text:str)
        self.has_mvrs = False               # chunk MVRS present (meme vide) ?
        self.mvrs = []                     # list of (node_id:int, value:int signed)
        self.has_goal = False               # chunk GOAL present (meme vide) ?
        self.goal = []                     # list of int (1-5)
        self.atrb = [0] * 10               # exactly 10 bytes, file order

    # -- parsing ---------------------------------------------------------

    @classmethod
    def load(cls, data):
        self = cls()
        tag, length, pos = read_chunk_header(data, 0)
        if tag != b'FORM':
            raise ValueError(f"Ne commence pas par FORM (trouvé {tag!r})")
        form_type = data[pos:pos + 4]
        if form_type != b'PROF':
            raise ValueError(f"FORM de type {form_type!r}, attendu PROF")
        pos += 4
        end = 8 + length

        while pos < end:
            tag, sub_len, data_start = read_chunk_header(data, pos)
            content_end = data_start + sub_len
            if tag == b'VERS':
                self.vers = struct.unpack('>H', data[data_start:data_start + 2])[0]
            elif tag == b'FORM':
                inner_type = data[data_start:data_start + 4]
                inner_pos = data_start + 4
                if inner_type == b'RADI':
                    self._parse_radi(data, inner_pos, content_end)
                elif inner_type == b'_AI_':
                    self._parse_ai(data, inner_pos, content_end)
            pos = data_start + sub_len
            if pos % 2:
                pos += 1
        return self

    def _parse_radi(self, data, pos, end):
        while pos < end:
            tag, length, data_start = read_chunk_header(data, pos)
            content_end = data_start + length
            if tag == b'SPCH':
                self.has_spch = True
                self.spch = data[data_start]
            elif tag == b'INFO':
                self.info_id = struct.unpack('>H', data[data_start:data_start + 2])[0]
                name, p2 = read_cstring(data, data_start + 2)
                callsign, _ = read_cstring(data, p2)
                self.info_name = name
                self.info_callsign = callsign
            elif tag == b'OPTS':
                self.has_opts = True
                self.opts = data[data_start:content_end]
            elif tag == b'MSGS':
                p = data_start
                while p < content_end:
                    idx = data[p]
                    msg, p = read_cstring(data, p + 1)
                    self.msgs.append((idx, msg))
            pos = data_start + length
            if pos % 2:
                pos += 1

    def _parse_ai(self, data, pos, end):
        while pos < end:
            tag, length, data_start = read_chunk_header(data, pos)
            content_end = data_start + length
            if tag == b'MVRS':
                self.has_mvrs = True
                for i in range(length // 2):
                    p = data_start + i * 2
                    node_id = data[p]
                    raw = data[p + 1]
                    signed = raw - 256 if raw >= 128 else raw
                    self.mvrs.append((node_id, signed))
            elif tag == b'GOAL':
                self.has_goal = True
                self.goal = list(data[data_start:content_end])
            elif tag == b'ATRB':
                self.atrb = list(data[data_start:content_end])
                while len(self.atrb) < 10:
                    self.atrb.append(0)
            pos = data_start + length
            if pos % 2:
                pos += 1

    # -- rebuilding --------------------------------------------------------

    def to_bytes(self):
        radi_payload = b""
        if self.has_spch:
            radi_payload += pack_chunk(b'SPCH', bytes([self.spch & 0xFF]))
        info_payload = struct.pack('>H', self.info_id & 0xFFFF)
        info_payload += pack_cstring(self.info_name)
        info_payload += pack_cstring(self.info_callsign)
        radi_payload += pack_chunk(b'INFO', info_payload)
        if self.has_opts:
            radi_payload += pack_chunk(b'OPTS', self.opts)
        msgs_payload = b""
        for idx, text in self.msgs:
            msgs_payload += bytes([idx & 0xFF]) + pack_cstring(text)
        radi_payload += pack_chunk(b'MSGS', msgs_payload)
        radi_form = b'RADI' + radi_payload
        radi_chunk = pack_chunk(b'FORM', radi_form)

        ai_payload = pack_chunk(b'AI\x00_', b'')
        if self.has_mvrs:
            mvrs_payload = b""
            for node_id, value in self.mvrs:
                raw_val = value & 0xFF  # two's complement wrap for negatives
                mvrs_payload += bytes([node_id & 0xFF, raw_val])
            ai_payload += pack_chunk(b'MVRS', mvrs_payload)
        if self.has_goal:
            goal_payload = bytes([g & 0xFF for g in self.goal])
            ai_payload += pack_chunk(b'GOAL', goal_payload)
        atrb_payload = bytes([b & 0xFF for b in self.atrb[:10]])
        ai_payload += pack_chunk(b'ATRB', atrb_payload)
        ai_form = b'_AI_' + ai_payload
        ai_chunk = pack_chunk(b'FORM', ai_form)

        prof_payload = pack_chunk(b'VERS', struct.pack('>H', self.vers & 0xFFFF))
        prof_payload += radi_chunk
        prof_payload += ai_chunk
        prof_form = b'PROF' + prof_payload
        return pack_chunk(b'FORM', prof_form)


GOAL_LABELS = {
    1: '1 = vide (aucun)',
    2: '2 = Goal_ExecuteAction (générique 0xA1-0xAC)',
    3: '3 = Goal_WanderRandom',
    4: '4 = AI_BehaviorStateMachine',
    5: '5 = loc_878F (engagement, coéquipier actif ?)',
}

ATRB_LABELS = [
    "attrib. 0 (échelle 0-16)", "attrib. 1", "attrib. 2", "attrib. 3",
    "attrib. 4", "attrib. 5", "attrib. 6", "attrib. 7", "attrib. 8",
    "attrib. 9 (écrêté à 3 par le moteur)",
]


# ---------------------------------------------------------------------
# GUI helpers
# ---------------------------------------------------------------------

class ScrollableFrame(ttk.Frame):
    """A vertically scrollable container. Put widgets inside `.inner`
    instead of `self` directly."""

    def __init__(self, parent):
        super().__init__(parent)
        canvas = tk.Canvas(self, borderwidth=0, highlightthickness=0)
        scrollbar = ttk.Scrollbar(self, orient="vertical", command=canvas.yview)
        self.inner = ttk.Frame(canvas)

        self.inner.bind(
            "<Configure>",
            lambda e: canvas.configure(scrollregion=canvas.bbox("all")))

        window_id = canvas.create_window((0, 0), window=self.inner, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)

        def _match_inner_width(event):
            canvas.itemconfig(window_id, width=event.width)
        canvas.bind("<Configure>", _match_inner_width)

        def _on_mousewheel(event):
            if event.num == 4:
                canvas.yview_scroll(-1, "units")
            elif event.num == 5:
                canvas.yview_scroll(1, "units")
            else:
                canvas.yview_scroll(-1 if event.delta > 0 else 1, "units")
        canvas.bind_all("<MouseWheel>", _on_mousewheel)
        canvas.bind_all("<Button-4>", _on_mousewheel)
        canvas.bind_all("<Button-5>", _on_mousewheel)

        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")


class ListEditor(ttk.LabelFrame):
    """Generic editable list of rows, with add/remove buttons. Each row
    is built by `row_factory(parent, initial_values) -> (frame, getter)`
    where getter() returns the current tuple/value for that row."""

    def __init__(self, parent, title, row_factory, add_label="+ ajouter"):
        super().__init__(parent, text=title, padding=8)
        self.row_factory = row_factory
        self.rows = []  # list of (frame, getter)

        self.body = ttk.Frame(self)
        self.body.pack(fill="x")

        ttk.Button(self, text=add_label, command=self.add_row).pack(anchor="w", pady=(6, 0))

    def clear(self):
        for frame, _ in self.rows:
            frame.destroy()
        self.rows = []

    def load(self, values):
        self.clear()
        for v in values:
            self.add_row(v)

    def add_row(self, initial=None):
        row_frame = ttk.Frame(self.body)
        row_frame.pack(fill="x", pady=1)
        getter = self.row_factory(row_frame, initial)

        def remove():
            row_frame.destroy()
            self.rows[:] = [(f, g) for f, g in self.rows if f is not row_frame]

        ttk.Button(row_frame, text="✕", width=3, command=remove).pack(side="right", padx=(4, 0))
        self.rows.append((row_frame, getter))

    def collect(self):
        return [g() for f, g in self.rows]


def make_int_row(parent, initial, field_specs, default_row=()):
    """field_specs: list of (label, width) -> creates one Entry per spec.
    initial: tuple matching field_specs length, or None.
    Returns a getter returning a tuple of ints (raises ValueError)."""
    if initial is None:
        initial = default_row or tuple(0 for _ in field_specs)
    vars_ = []
    for (label, width), val in zip(field_specs, initial):
        ttk.Label(parent, text=label).pack(side="left", padx=(0, 2))
        var = tk.StringVar(value=str(val))
        ttk.Entry(parent, textvariable=var, width=width).pack(side="left", padx=(0, 8))
        vars_.append(var)

    def getter():
        return tuple(int(v.get().strip(), 0) for v in vars_)
    return getter


def make_text_row(parent, initial, idx_default=0):
    """Row for a MSGS entry: (index, text)."""
    if initial is None:
        initial = (idx_default, "")
    idx, text = initial
    ttk.Label(parent, text="idx").pack(side="left", padx=(0, 2))
    idx_var = tk.StringVar(value=f"0x{idx:02X}")
    ttk.Entry(parent, textvariable=idx_var, width=6).pack(side="left", padx=(0, 6))
    text_var = tk.StringVar(value=text)
    ttk.Entry(parent, textvariable=text_var, width=50).pack(side="left", fill="x", expand=True)

    def getter():
        return (int(idx_var.get().strip(), 0), text_var.get())
    return getter


def make_goal_row(parent, initial):
    if initial is None:
        initial = 2
    labels = [f"{k} -> {v}" for k, v in GOAL_LABELS.items()]
    combo = ttk.Combobox(parent, width=45, state="readonly", values=labels)
    for k, v in GOAL_LABELS.items():
        if k == initial:
            combo.set(f"{k} -> {v}")
            break
    else:
        combo.current(0)
    combo.pack(side="left", fill="x", expand=True)

    def getter():
        text = combo.get()
        if not text:
            raise ValueError("aucun comportement sélectionné")
        return int(text.split(' -> ')[0].strip())
    return getter


def make_mvrs_row(parent, initial):
    if initial is None:
        initial = (1, 0)
    node_id, value = initial
    ttk.Label(parent, text="id").pack(side="left", padx=(0, 2))
    id_var = tk.StringVar(value=f"0x{node_id:02X}")
    ttk.Entry(parent, textvariable=id_var, width=6).pack(side="left", padx=(0, 8))
    ttk.Label(parent, text="valeur (signée)").pack(side="left", padx=(0, 2))
    val_var = tk.StringVar(value=str(value))
    ttk.Entry(parent, textvariable=val_var, width=8).pack(side="left", padx=(0, 8))

    def getter():
        nid = int(id_var.get().strip(), 0)
        v = int(val_var.get().strip(), 0)
        if not (-128 <= v <= 127):
            raise ValueError(f"MVRS valeur {v} hors plage [-128, 127]")
        return (nid, v)
    return getter


# ---------------------------------------------------------------------
# Main application
# ---------------------------------------------------------------------

class ProfEditorApp:
    def __init__(self, root, initial_path=None):
        self.root = root
        self.path = None
        self.prof = None

        root.title("PROF Editor — profils pilote Strike Commander")
        root.geometry("700x820")

        self._build_menu()

        container = ttk.Frame(root, padding=8)
        container.pack(fill="both", expand=True)

        toolbar = ttk.Frame(container)
        toolbar.pack(fill="x", pady=(0, 8))
        ttk.Button(toolbar, text="Open...", command=self.open_dialog).pack(side="left", padx=(0, 4))
        ttk.Button(toolbar, text="Save", command=self.save_file).pack(side="left", padx=4)
        ttk.Button(toolbar, text="Save As...", command=self.save_as_dialog).pack(side="left", padx=4)

        self.path_label = ttk.Label(container, text="(no file open)", foreground="#444")
        self.path_label.pack(anchor="w", pady=(0, 8))

        scroll_area = ScrollableFrame(container)
        scroll_area.pack(fill="both", expand=True)
        content = scroll_area.inner

        # --- VERS / SPCH / INFO -----------------------------------------
        info_frame = ttk.LabelFrame(content, text="VERS / RADI — identité & radio", padding=8)
        info_frame.pack(fill="x", pady=(0, 8))

        row = ttk.Frame(info_frame)
        row.pack(fill="x", pady=2)
        ttk.Label(row, text="VERS").pack(side="left", padx=(0, 4))
        self.vers_var = tk.StringVar(value="2")
        ttk.Entry(row, textvariable=self.vers_var, width=6).pack(side="left", padx=(0, 16))
        self.has_spch_var = tk.BooleanVar(value=False)
        ttk.Checkbutton(row, text="SPCH présent", variable=self.has_spch_var).pack(side="left", padx=(0, 4))
        ttk.Label(row, text="valeur").pack(side="left", padx=(0, 4))
        self.spch_var = tk.StringVar(value="0")
        ttk.Entry(row, textvariable=self.spch_var, width=6).pack(side="left")

        row = ttk.Frame(info_frame)
        row.pack(fill="x", pady=2)
        ttk.Label(row, text="INFO id").pack(side="left", padx=(0, 4))
        self.info_id_var = tk.StringVar(value="0")
        ttk.Entry(row, textvariable=self.info_id_var, width=8).pack(side="left", padx=(0, 16))
        ttk.Label(row, text="nom").pack(side="left", padx=(0, 4))
        self.info_name_var = tk.StringVar(value="")
        ttk.Entry(row, textvariable=self.info_name_var, width=20).pack(side="left", padx=(0, 16))
        ttk.Label(row, text="indicatif").pack(side="left", padx=(0, 4))
        self.info_callsign_var = tk.StringVar(value="")
        ttk.Entry(row, textvariable=self.info_callsign_var, width=16).pack(side="left")

        row = ttk.Frame(info_frame)
        row.pack(fill="x", pady=2)
        self.has_opts_var = tk.BooleanVar(value=False)
        ttk.Checkbutton(row, text="OPTS présent", variable=self.has_opts_var).pack(side="left", padx=(0, 4))
        ttk.Label(row, text="lettres (menu radio, ex: dihgjklm)").pack(side="left", padx=(0, 4))
        self.opts_var = tk.StringVar(value="")
        ttk.Entry(row, textvariable=self.opts_var, width=40).pack(side="left", fill="x", expand=True)

        # --- MSGS ----------------------------------------------------------
        self.msgs_editor = ListEditor(content, "MSGS — répliques radio (index, texte)",
                                       make_text_row, add_label="+ ajouter une réplique")
        self.msgs_editor.pack(fill="x", pady=(0, 8))

        # --- MVRS ------------------------------------------------------------
        mvrs_frame = ttk.LabelFrame(
            content, text="_AI_ / MVRS — paramètres de manœuvre (id, valeur signée)", padding=8)
        mvrs_frame.pack(fill="x", pady=(0, 8))
        self.has_mvrs_var = tk.BooleanVar(value=False)
        ttk.Checkbutton(mvrs_frame, text="chunk MVRS présent (décocher = ABSENT du fichier, "
                        "pas juste vide — pour tester la vraie absence)",
                        variable=self.has_mvrs_var).pack(anchor="w", pady=(0, 4))
        ttk.Label(
            mvrs_frame,
            text="Identifiants confirmés dans le désassemblage : 0x4, 0x7, 0xE, 0xF, "
                 "0x10, 0x13, 0x14, 0x15 (8 champs fixes du moteur). Tout autre "
                 "identifiant passe par le mécanisme générique extensible. ATTENTION : "
                 "même en vidant la liste ci-dessous (chunk présent mais 0 entrée), les "
                 "8 nœuds de propriété par défaut sont probablement construits quand "
                 "même par le chargeur AVANT même de lire ce chunk (voir "
                 "PilotProfile_LoadFromPROF_73B4F) — pour tester l'absence réelle des "
                 "nœuds eux-mêmes, décocher la case ci-dessus plutôt que de juste vider "
                 "la liste.",
            foreground="#666", wraplength=640, justify="left",
        ).pack(anchor="w", pady=(0, 6))
        self.mvrs_editor = ListEditor(mvrs_frame, "", make_mvrs_row, add_label="+ ajouter une entrée MVRS")
        self.mvrs_editor.pack(fill="x")

        # --- GOAL ------------------------------------------------------------
        goal_frame = ttk.LabelFrame(content, text="_AI_ / GOAL — comportements armés (jusqu'à 10 slots)", padding=8)
        goal_frame.pack(fill="x", pady=(0, 8))
        self.has_goal_var = tk.BooleanVar(value=False)
        ttk.Checkbutton(goal_frame, text="chunk GOAL présent (ATTENTION : confirmé "
                        "OBLIGATOIRE par le moteur — décocher produira probablement "
                        "une erreur de chargement 0x8002 dans le jeu)",
                        variable=self.has_goal_var).pack(anchor="w", pady=(0, 4))
        self.goal_editor = ListEditor(goal_frame, "", make_goal_row, add_label="+ ajouter un slot GOAL")
        self.goal_editor.pack(fill="x")

        # --- ATRB ------------------------------------------------------------
        atrb_frame = ttk.LabelFrame(content, text="_AI_ / ATRB — attributs pilote (10 octets, ordre fichier)", padding=8)
        atrb_frame.pack(fill="x", pady=(0, 8))
        self.atrb_vars = []
        for i, label in enumerate(ATRB_LABELS):
            row = ttk.Frame(atrb_frame)
            row.pack(fill="x", pady=1)
            ttk.Label(row, text=label, width=32).pack(side="left")
            var = tk.StringVar(value="0")
            ttk.Entry(row, textvariable=var, width=8).pack(side="left")
            self.atrb_vars.append(var)

        self.status = ttk.Label(container, text="Aucun fichier chargé", foreground="#888")
        self.status.pack(anchor="w", pady=(8, 0))

        if initial_path:
            self.open_file(initial_path)

    # -- menu -----------------------------------------------------------

    def _build_menu(self):
        menubar = tk.Menu(self.root)
        filemenu = tk.Menu(menubar, tearoff=0)
        filemenu.add_command(label="Open...", command=self.open_dialog, accelerator="Ctrl+O")
        filemenu.add_command(label="Save", command=self.save_file, accelerator="Ctrl+S")
        filemenu.add_command(label="Save As...", command=self.save_as_dialog)
        filemenu.add_separator()
        filemenu.add_command(label="Quit", command=self.root.quit)
        menubar.add_cascade(label="File", menu=filemenu)
        self.root.config(menu=menubar)

        self.root.bind_all("<Control-o>", lambda e: self.open_dialog())
        self.root.bind_all("<Control-s>", lambda e: self.save_file())
        self.root.bind_all("<Command-o>", lambda e: self.open_dialog())
        self.root.bind_all("<Command-s>", lambda e: self.save_file())

    # -- file operations --------------------------------------------------

    def open_dialog(self):
        path = filedialog.askopenfilename(
            title="Open .IFF pilot profile",
            filetypes=[("PROF files", "*.iff *.IFF"), ("All files", "*.*")])
        if path:
            self.open_file(path)

    def open_file(self, path):
        try:
            with open(path, "rb") as f:
                data = f.read()
            prof = ProfFile.load(data)
        except (OSError, ValueError, struct.error, IndexError) as e:
            messagebox.showerror("Open failed", str(e))
            return

        self.path = path
        self.prof = prof
        self.path_label.config(text=path)
        self._load_into_form(prof)
        self.status.config(text=f"Chargé ({len(data)} octets)")

    def _load_into_form(self, prof):
        self.vers_var.set(str(prof.vers))
        self.has_spch_var.set(prof.has_spch)
        self.spch_var.set(str(prof.spch))
        self.info_id_var.set(str(prof.info_id))
        self.info_name_var.set(prof.info_name)
        self.info_callsign_var.set(prof.info_callsign)
        self.has_opts_var.set(prof.has_opts)
        self.opts_var.set(prof.opts.decode('latin-1'))
        self.msgs_editor.load(prof.msgs)
        self.has_mvrs_var.set(prof.has_mvrs)
        self.mvrs_editor.load(prof.mvrs)
        self.has_goal_var.set(prof.has_goal)
        self.goal_editor.load(prof.goal)
        for i, v in enumerate(prof.atrb):
            self.atrb_vars[i].set(str(v))

    def _collect_from_form(self):
        """Build a fresh ProfFile from the current form state. Raises
        ValueError with a user-facing message on bad input."""
        prof = ProfFile()
        try:
            prof.vers = int(self.vers_var.get().strip(), 0)
            prof.spch = int(self.spch_var.get().strip(), 0)
            prof.info_id = int(self.info_id_var.get().strip(), 0)
        except ValueError:
            raise ValueError("VERS / SPCH / INFO id doivent être des entiers")
        prof.has_spch = self.has_spch_var.get()
        prof.info_name = self.info_name_var.get()
        prof.info_callsign = self.info_callsign_var.get()

        prof.has_opts = self.has_opts_var.get()
        opts_text = self.opts_var.get()
        prof.opts = opts_text.encode('latin-1', 'replace')

        try:
            prof.msgs = self.msgs_editor.collect()
        except ValueError as e:
            raise ValueError(f"MSGS : {e}")
        for idx, _ in prof.msgs:
            if not (0 <= idx <= 255):
                raise ValueError(f"MSGS : index {idx} hors plage [0, 255]")

        prof.has_mvrs = self.has_mvrs_var.get()
        try:
            prof.mvrs = self.mvrs_editor.collect()
        except ValueError as e:
            raise ValueError(f"MVRS : {e}")

        prof.has_goal = self.has_goal_var.get()
        try:
            prof.goal = self.goal_editor.collect()
        except ValueError as e:
            raise ValueError(f"GOAL : {e}")
        if len(prof.goal) > 10:
            raise ValueError("GOAL : maximum 10 slots (limite confirmée dans le désassemblage)")

        atrb = []
        for i, var in enumerate(self.atrb_vars):
            try:
                v = int(var.get().strip(), 0)
            except ValueError:
                raise ValueError(f"ATRB champ {i} : entier attendu")
            if not (0 <= v <= 255):
                raise ValueError(f"ATRB champ {i} : {v} hors plage [0, 255]")
            atrb.append(v)
        prof.atrb = atrb

        return prof

    def save_file(self):
        if self.path is None:
            self.save_as_dialog()
            return
        try:
            prof = self._collect_from_form()
        except ValueError as e:
            messagebox.showerror("Valeur invalide", str(e))
            return
        try:
            with open(self.path, "wb") as f:
                f.write(prof.to_bytes())
        except OSError as e:
            messagebox.showerror("Save failed", str(e))
            return
        self.prof = prof
        messagebox.showinfo("Saved", f"Saved to {self.path}")

    def save_as_dialog(self):
        try:
            prof = self._collect_from_form()
        except ValueError as e:
            messagebox.showerror("Valeur invalide", str(e))
            return
        path = filedialog.asksaveasfilename(
            title="Save .IFF pilot profile as",
            defaultextension=".IFF",
            filetypes=[("PROF files", "*.iff *.IFF"), ("All files", "*.*")])
        if not path:
            return
        try:
            with open(path, "wb") as f:
                f.write(prof.to_bytes())
        except OSError as e:
            messagebox.showerror("Save failed", str(e))
            return
        self.path = path
        self.prof = prof
        self.path_label.config(text=path)
        messagebox.showinfo("Saved", f"Saved to {path}")


def main():
    initial_path = sys.argv[1] if len(sys.argv) > 1 else None
    root = tk.Tk()
    ProfEditorApp(root, initial_path)
    root.mainloop()


if __name__ == "__main__":
    main()
