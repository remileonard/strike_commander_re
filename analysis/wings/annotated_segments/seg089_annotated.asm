seg089		segment	para public 'CODE' use16
		assume cs:seg089
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3, 0, 0, 59h

loc_3D124:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D127		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3D127		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à SoundFX_StopAll_5EE28
; (sub_5EE28 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; SoundFX_StopAll_5AA95 (sub_5AA95 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — Ex-'Widget_Helper_5AA95'. far. LUE 2026-10-06. Arrete tous les
; canaux d'effets (SoundFX_StopAllChannels_AB770).
; ==============================================================================================
SoundFX_StopAll_3D12F		proc far
		push	bp
		mov	bp, sp
		cmp	byte_603B1, 0
		jz	short loc_3D14A
		cmp	word_5CFA3, 0
		jz	short loc_3D14A
		push	word_5CFA3
		call	sub_58C5E
		pop	cx

loc_3D14A:
		pop	bp
		retf
SoundFX_StopAll_3D12F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D14C		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3D14C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D151		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3D151		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D156		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3D156		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D15B		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3D15B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D160		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3D160		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D165		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3D165		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D16A		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3D16A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D16F		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3D16F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Music_RequestTune_5A984 (sub_5A984 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'TextObject_AllocateVariantA_5A984' (nom de notre base) ; renommee par la session musique
; (archive handoff 2026-10-06). ★ far — SÉLECTEUR DE PISTE MUSICALE (moteur XMIDI/AIL).
; Anciennement mal étiquetée Music_RequestTune_5A984. Signature (tune_id: word) : borne
; tune_id contre word_7084C (nb de pistes max) ; si valide, écrit dans word_70859 (piste
; couramment jouée, init 0xFFFF) ; si invalide (sauf sentinelle 0xFF, probablement 'aucune
; piste'/stop) → log "Invalid tune requested: %d" (aInvalidTuneReq, seg339) via sub_5F700.
; Appelée depuis au moins 10 sites dans des segments très divers (seg114 UI,
; ovr230/239/240/243/316 logique mission) avec des tune_id différents selon le contexte (0x08
; à 0x15 identifiés) — voir MUSIC_SYSTEM.md pour la table complète des déclencheurs. Piste de
; mission de base : lue depuis le chunk IFF TUNE (MissionScenario_LoadMainRecord_A8331) dans
; byte_706A2, jouée à l'ouverture d'écran par sub_53896 (UIScreen_Construct).
; ==============================================================================================
Music_RequestTune_3D174		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	byte_603B1, 0
		jz	short loc_3D1A8
		cmp	word_5CFA3, 0
		jz	short loc_3D1A8
		mov	dx, [bp+arg_0]
		cmp	dx, word_5B776
		jge	short loc_3D194
		mov	word_5B781, dx
		jmp	short loc_3D1A8

loc_3D194:
		cmp	dx, 0FFh
		jz	short loc_3D1A8
		push	dx
		push	3286h
		call	sub_9D78
		add	sp, 4
		jmp	short loc_3D1A8

loc_3D1A8:
		pop	bp
		retf
Music_RequestTune_3D174		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_ReportErrorIfActive_6F02E (sub_6F02E de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_ReportErrorIfActive_66EF4 (sub_66EF4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, si
; le sous-système clavier est actif (word_7160A), signale une erreur
; (Runtime_FatalErrorHandler, tag 40D2h). Appelée avant certaines opérations du cluster
; clavier (seg202).
; ==============================================================================================
Keyboard_ReportErrorIfActive_3D1AA		proc far
		push	bp
		mov	bp, sp
		cmp	word_5CFA3, 0
		jz	short loc_3D1BE
		push	word_5CFA3
		call	sub_58C72
		pop	cx

loc_3D1BE:
		pop	bp
		retf
Keyboard_ReportErrorIfActive_3D1AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_ReportErrorIfActive_6F02E (sub_6F02E de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_ReportErrorIfActive_66EF4 (sub_66EF4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, si
; le sous-système clavier est actif (word_7160A), signale une erreur
; (Runtime_FatalErrorHandler, tag 40D2h). Appelée avant certaines opérations du cluster
; clavier (seg202).
; ==============================================================================================
Keyboard_ReportErrorIfActive_3D1C0		proc far
		push	bp
		mov	bp, sp
		cmp	word_5CFA3, 0
		jz	short loc_3D1D4
		push	word_5CFA3
		call	sub_58C77
		pop	cx

loc_3D1D4:
		pop	bp
		retf
Keyboard_ReportErrorIfActive_3D1C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Music_Stop_5ED8F
; (sub_5ED8F de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; Music_Stop_28CDB (sub_28CDB de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Music_Stop_5A9E6 (sub_5A9E6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'Widget_Helper_5A9E6'. far. LUE 2026-10-06.
; Facade (appelee par STRIKE_EXE_MAIN_LOOP) : Music_StopWithFade_AB1EF(fondu = argument).
; ==============================================================================================
Music_Stop_3D1D6		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		cmp	word_5CFA3, 0
		jz	short loc_3D1F0
		mov	al, [bp+arg_0]
		push	ax
		push	word_5CFA3
		call	sub_58C7C
		add	sp, 4

loc_3D1F0:
		pop	bp
		retf
Music_Stop_3D1D6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D1F2		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3D1F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Music_PlayGameflowTune_28CFC (sub_28CFC de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-22. Si la musique est active : joue le morceau arg de SOUND\gameflow.dat
; (sub_42363 → sub_5EEE6). Commande 26h.
; ==============================================================================================
Music_PlayGameflowTune_3D1F7		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		cmp	byte_603B1, 0
		jz	short loc_3D21D
		cmp	word_5CFA3, 0
		jz	short loc_3D21D
		mov	al, [bp+arg_0]
		mov	ah, 0
		push	ax
		push	32A2h
		push	word_5CFA3
		call	sub_58C63
		add	sp, 6

loc_3D21D:
		pop	bp
		retf
Music_PlayGameflowTune_3D1F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Speech_LoadBank_5EE03
; (sub_5EE03 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; Speech_LoadBank_28D24 (sub_28D24 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Speech_LoadBank_5AAB2 (sub_5AAB2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'Widget_Helper_5AAB2'. far. LUE 2026-10-06.
; Facade voix (byte_7236D, objet word_7099F) appelee par PilotProfile_LoadRADI_8DF49 :
; AudioQueue_LoadFromMultipleReaders_AB9D7.
; ==============================================================================================
Speech_LoadBank_3D21F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	byte_603B1, 0
		jz	short loc_3D242
		cmp	word_5CFA3, 0
		jz	short loc_3D242
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_5CFA3
		call	sub_1BA78
		add	sp, 6

loc_3D242:
		pop	bp
		retf
Speech_LoadBank_3D21F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à SoundFX_StopAll_5EE28
; (sub_5EE28 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; SoundFX_StopAll_5AA95 (sub_5AA95 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — Ex-'Widget_Helper_5AA95'. far. LUE 2026-10-06. Arrete tous les
; canaux d'effets (SoundFX_StopAllChannels_AB770).
; ==============================================================================================
SoundFX_StopAll_3D244		proc far
		push	bp
		mov	bp, sp
		cmp	byte_603B1, 0
		jz	short loc_3D25F
		cmp	word_5CFA3, 0
		jz	short loc_3D25F
		push	word_5CFA3
		call	sub_1BD09
		pop	cx

loc_3D25F:
		pop	bp
		retf
SoundFX_StopAll_3D244		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D261		proc far
		push	bp
		mov	bp, sp
		mov	dl, 0
		cmp	byte_603B1, 0
		jz	short loc_3D280
		cmp	word_5CFA3, 0
		jz	short loc_3D280
		push	word_5CFA3
		call	sub_1BDF6
		pop	cx
		mov	dl, al

loc_3D280:
		mov	al, dl
		pop	bp
		retf
sub_3D261		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à SoundFX_Disable_5EE92
; (sub_5EE92 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; SoundFX_Disable_5AA73 (sub_5AA73 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — Ex-'Widget_Helper_5AA73'. far. LUE 2026-10-06. Desactive les
; effets (byte_7236C = 0) apres avoir arrete tous les canaux.
; ==============================================================================================
SoundFX_Disable_3D284		proc far
		push	bp
		mov	bp, sp
		cmp	byte_603B2, 0
		jz	short loc_3D2A4
		cmp	word_5CF9F, 0
		jz	short loc_3D2A4
		mov	byte_603B2, 0
		push	word_5CF9F
		call	sub_41A3C
		pop	cx

loc_3D2A4:
		pop	bp
		retf
SoundFX_Disable_3D284		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D2A6		proc far
		push	bp
		mov	bp, sp
		cmp	word_5CF9F, 0
		jz	short loc_3D2B5
		mov	byte_603B2, 1

loc_3D2B5:
		pop	bp
		retf
sub_3D2A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à SoundFX_StopAll_5EE28
; (sub_5EE28 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; SoundFX_StopAll_5AA95 (sub_5AA95 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — Ex-'Widget_Helper_5AA95'. far. LUE 2026-10-06. Arrete tous les
; canaux d'effets (SoundFX_StopAllChannels_AB770).
; ==============================================================================================
SoundFX_StopAll_3D2B7		proc far
		push	bp
		mov	bp, sp
		cmp	byte_603B2, 0
		jz	short loc_3D2D2
		cmp	word_5CF9F, 0
		jz	short loc_3D2D2
		push	word_5CF9F
		call	sub_41A3C
		pop	cx

loc_3D2D2:
		pop	bp
		retf
SoundFX_StopAll_3D2B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D2D4		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3D2D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D2D9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5B774, 0
		jz	short loc_3D2F7
		mov	al, byte_5B774
		mov	ah, 0
		mov	dx, 0D100h
		or	dx, ax
		push	dx
		call	sub_9D47
		pop	cx

loc_3D2F7:
		pop	bp
		retf
sub_3D2D9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D2F9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_5CFA3, 0
		jz	short loc_3D319
		push	3
		push	word_5CFA3
		mov	bx, word_5CFA3
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_3D319

loc_3D319:
		mov	word_5CFA3, 0
		cmp	word_5CF9D, 0
		jz	short loc_3D339
		push	3
		push	word_5CF9D
		mov	bx, word_5CF9D
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_3D339

loc_3D339:
		mov	word_5CF9D, 0
		pop	bp
		retf
sub_3D2F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D341		proc far
		push	bp
		mov	bp, sp
		mov	word_5CF9D, 0
		mov	byte_5CF9C, 0
		pop	bp
sub_3D341		endp
seg089		ends
