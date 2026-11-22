seg216		segment	para public 'CODE' use16
		assume cs:seg216
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 68h, 4Bh, 0, 0, 0C6h, 6, 8Ch, 6Ch, 1

loc_6F729:
		db 8Bh, 0C6h, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F72E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6F747
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6F74B

loc_6F747:
		mov	word ptr [si], 0FFFFh

loc_6F74B:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6F72E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stopwatch_RegisterTickModule_67611 (sub_67611 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far,
; enregistre un module de comptage de tics (loc_676E7) dans le registre de modules à créneaux
; temporisés (AIL_register_timer_5FF08, seg161) avec une cadence de 60 tics
; (AIL_set_timer_frequency_600DB), avec avertissement d'échec (Runtime_FatalErrorHandler, tag
; 4121h). Référencée par sub_8F47A — confirme que le registre de modules du seg161 est utilisé
; au-delà du seul séquenceur de contre-mesures.
; ==============================================================================================
Stopwatch_RegisterTickModule_6F750		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_7B29C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6F79E
		call	AIL_startup_1D68A
		push	seg seg216
		push	offset sub_6F826
		call	sub_1D731
		add	sp, 4
		mov	[si], ax
		cmp	word ptr [si], 0FFFFh
		jz	short loc_6F790
		push	large 3Ch
		push	word ptr [si]
		call	sub_1D904
		add	sp, 6
		push	word ptr [si]
		call	sub_1D841
		jmp	short loc_6F798

loc_6F790:
		push	4B71h
		call	Runtime_FatalErrorHandler_68BA2

loc_6F798:
		pop	cx
		mov	byte_7B29C, 1

loc_6F79E:
		pop	si
		pop	bp
		retf
Stopwatch_RegisterTickModule_6F750		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Stopwatch_RegisterTickModuleVariant_3EE86 (sub_3EE86 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Stopwatch_RegisterTickModuleVariant_67662 (sub_67662
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; variante de Stopwatch_RegisterTickModule_67611 (AIL_register_timer_5FF08,
; ConfigureAndActivate_600DB, AIL_start_timer_60018).
; ==============================================================================================
Stopwatch_RegisterTickModuleVariant_6F7A1		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, 0FFFFh
		cmp	byte_7B29C, 0
		jz	short loc_6F7D9
		push	large [bp+arg_2]
		call	sub_1D731
		add	sp, 4
		mov	si, ax
		cmp	si, 0FFFFh
		jz	short loc_6F7D9
		push	large [bp+arg_6]
		push	ax
		call	sub_1D904
		add	sp, 6
		push	si
		call	sub_1D841
		pop	cx

loc_6F7D9:
		mov	ax, si
		pop	si
		pop	bp
		retf
Stopwatch_RegisterTickModuleVariant_6F7A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Stopwatch_UnregisterTickModule_3EEC3 (sub_3EEC3 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à Stopwatch_UnregisterTickModule_6769F (sub_6769F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; désenregistre le module de tic (AIL_release_timer_handle_5FFBD, seg161) si actif. Référencée
; par sub_27F0E et le destructeur ConfigOption (seg201).
; ==============================================================================================
Stopwatch_UnregisterTickModule_6F7DE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_7B29C, 0
		jz	short loc_6F7F4
		push	[bp+arg_2]
		call	sub_1D7E6
		pop	cx

loc_6F7F4:
		pop	bp
		retf
Stopwatch_UnregisterTickModule_6F7DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Stopwatch_UnregisterTickModule_3EEC3 (sub_3EEC3 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à Stopwatch_UnregisterTickModule_6769F (sub_6769F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; désenregistre le module de tic (AIL_release_timer_handle_5FFBD, seg161) si actif. Référencée
; par sub_27F0E et le destructeur ConfigOption (seg201).
; ==============================================================================================
Stopwatch_UnregisterTickModule_6F7F6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_7B29C, 0
		jz	short loc_6F80C
		push	[bp+arg_2]
		call	sub_1D87B
		pop	cx

loc_6F80C:
		pop	bp
		retf
Stopwatch_UnregisterTickModule_6F7F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Stopwatch_UnregisterTickModule_3EEC3 (sub_3EEC3 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à Stopwatch_UnregisterTickModule_6769F (sub_6769F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; désenregistre le module de tic (AIL_release_timer_handle_5FFBD, seg161) si actif. Référencée
; par sub_27F0E et le destructeur ConfigOption (seg201).
; ==============================================================================================
Stopwatch_UnregisterTickModule_6F80E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_7B29C, 0
		jz	short loc_6F824
		push	[bp+arg_2]
		call	sub_1D841
		pop	cx

loc_6F824:
		pop	bp
		retf
Stopwatch_UnregisterTickModule_6F80E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F826		proc far
		push	bp
		mov	bp, sp
		inc	dword_7B29D
		pop	bp
		retf
sub_6F826		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Stopwatch_StartOrStop_3EF15 (sub_3EF15 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Stopwatch_StartOrStop_676F1 (sub_676F1 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 138 lignes, NON DÉTAILLÉE —
; combine AIL_shutdown_5FE9F et sub_338 — démarre ou arrête le chronomètre
; (enregistrement/désenregistrement complet).
; ==============================================================================================
Stopwatch_StartOrStop_6F830		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_6F842
		jmp	loc_6F8D8

loc_6F842:
		cmp	byte_7B29C, 0
		jnz	short loc_6F84C
		jmp	loc_6F8CB

loc_6F84C:
		push	ds
		push	offset aBye
		call	sub_1D6C8
		add	sp, 4
		mov	ah, 2
		int	1Ah
		mov	al, ch
		shr	al, 4
		mov	dl, 0Ah
		mul	dl
		and	ch, 0Fh
		add	ch, al
		mov	al, cl
		shr	al, 4
		mov	dl, 0Ah
		mul	dl
		and	cl, 0Fh
		add	cl, al
		mov	al, dh
		shr	al, 4
		mov	dl, 0Ah
		mul	dl
		and	dh, 0Fh
		add	dh, al
		mov	ah, 2Dh
		int	21h
		mov	ah, 4
		int	1Ah
		push	dx
		mov	ax, cx
		and	ax, 0F0F0h
		sub	cx, ax
		shr	ax, 4
		mov	bx, 0Ah
		mul	bx
		add	cx, ax
		mov	al, ch
		xor	ch, ch
		mov	ah, 64h
		mul	ah
		add	cx, ax
		pop	dx
		mov	al, dh
		shr	al, 4
		mov	ah, 0Ah
		mul	ah
		and	dh, 0Fh
		add	dh, al
		mov	al, dl
		shr	al, 4
		mov	ah, 0Ah
		mul	ah
		and	dl, 0Fh
		add	dl, al
		mov	ah, 2Bh
		int	21h

loc_6F8CB:
		test	di, 1
		jz	short loc_6F8D8
		push	si
		call	sub_3B2
		pop	cx

loc_6F8D8:
		pop	di
		pop	si
		pop	bp
		retf
Stopwatch_StartOrStop_6F830		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F8DC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jz	short loc_6F8F7
		mov	eax, dword_7B29D
		sub	eax, [si+1]
		add	[si+5], eax
		mov	byte ptr [si], 0

loc_6F8F7:
		pop	si
		pop	bp
		retf
sub_6F8DC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Stopwatch_Elapsed_3EFDF
; (sub_3EFDF de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-21. Temps écoulé d'un chronomètre, en tics de 60 Hz : en marche
; ([si] ≠ 0) = cumul [si+5] + dword_47ABB (compteur de tics) − départ [si+1] ; arrêté = cumul
; [si+5].
; ==============================================================================================
Stopwatch_Elapsed_6F8FA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jz	short loc_6F915
		mov	eax, [si+5]
		add	eax, dword_7B29D
		sub	eax, [si+1]
		jmp	short loc_6F919

loc_6F915:
		mov	eax, [si+5]

loc_6F919:
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
Stopwatch_Elapsed_6F8FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F921		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_6F928:
		mov	eax, [bp+arg_2]
		add	eax, [si+1]
		sub	eax, dword_7B29D
		cmp	eax, 0
		ja	short loc_6F928
		pop	si
		pop	bp
		retf
sub_6F921		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Stopwatch_WaitElapsed_3F023 (sub_3F023 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Attente active : boucle tant
; que début (+0) + durée (+4) >= dword_47ABB (tics à 60 Hz, Stopwatch_TickISR_3EF0B). Le nom «
; Stopwatch_Reset » repris de STRIKE.EXE (même code, sub_677FF) ne correspond pas : la
; fonction ne remet rien à zéro, elle attend la fin de la durée.
; ==============================================================================================
Stopwatch_WaitElapsed_6F93E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_6F945:
		mov	eax, [si]
		add	eax, [si+4]
		cmp	eax, dword_7B29D
		jnb	short loc_6F945
		pop	si
		pop	bp
		retf
Stopwatch_WaitElapsed_6F93E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F956		proc far
		push	bp
		mov	bp, sp
		push	6C8Eh
		push	cs
		call	near ptr sub_6F72E
		pop	cx
		pop	bp
		retf
sub_6F956		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F963		proc far
		push	bp
		mov	bp, sp
		push	2
		push	6C8Eh
		push	cs
		call	near ptr Stopwatch_StartOrStop_6F830
sub_6F963		endp

; START OF FUNCTION CHUNK FOR sub_6F963
		db 83h
; END OF FUNCTION CHUNK FOR sub_6F963
seg216		ends
