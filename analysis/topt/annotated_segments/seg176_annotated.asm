seg176		segment	para public 'CODE' use16
		assume cs:seg176
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44C11		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_44C2A
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_44C2E

loc_44C2A:
		mov	word ptr [si], 0FFFFh

loc_44C2E:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_44C11		endp

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
Stopwatch_RegisterTickModule_44C33		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_4DE14
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44C81
		call	AIL_startup_4B66
		push	seg seg176
		push	offset sub_44D09
		call	sub_4C0D
		add	sp, 4
		mov	[si], ax
		cmp	word ptr [si], 0FFFFh
		jz	short loc_44C73
		push	large 3Ch
		push	word ptr [si]
		call	sub_4DE0
		add	sp, 6
		push	word ptr [si]
		call	sub_4D1D
		jmp	short loc_44C7B

loc_44C73:
		push	5439h
		call	Runtime_FatalErrorHandler_36797

loc_44C7B:
		pop	cx
		mov	byte_4DE14, 1

loc_44C81:
		pop	si
		pop	bp
		retf
Stopwatch_RegisterTickModule_44C33		endp

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
Stopwatch_RegisterTickModuleVariant_44C84		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, 0FFFFh
		cmp	byte_4DE14, 0
		jz	short loc_44CBC
		push	large [bp+arg_2]
		call	sub_4C0D
		add	sp, 4
		mov	si, ax
		cmp	si, 0FFFFh
		jz	short loc_44CBC
		push	large [bp+arg_6]
		push	ax
		call	sub_4DE0
		add	sp, 6
		push	si
		call	sub_4D1D
		pop	cx

loc_44CBC:
		mov	ax, si
		pop	si
		pop	bp
		retf
Stopwatch_RegisterTickModuleVariant_44C84		endp

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
Stopwatch_UnregisterTickModule_44CC1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_4DE14, 0
		jz	short loc_44CD7
		push	[bp+arg_2]
		call	sub_4CC2
		pop	cx

loc_44CD7:
		pop	bp
		retf
Stopwatch_UnregisterTickModule_44CC1		endp

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
Stopwatch_UnregisterTickModule_44CD9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_4DE14, 0
		jz	short loc_44CEF
		push	[bp+arg_2]
		call	sub_4D57
		pop	cx

loc_44CEF:
		pop	bp
		retf
Stopwatch_UnregisterTickModule_44CD9		endp

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
Stopwatch_UnregisterTickModule_44CF1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_4DE14, 0
		jz	short loc_44D07
		push	[bp+arg_2]
		call	sub_4D1D
		pop	cx

loc_44D07:
		pop	bp
		retf
Stopwatch_UnregisterTickModule_44CF1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44D09		proc far
		push	bp
		mov	bp, sp
		inc	dword_4DE15
		pop	bp
		retf
sub_44D09		endp

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
Stopwatch_StartOrStop_44D13		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_44D25
		jmp	loc_44DBB

loc_44D25:
		cmp	byte_4DE14, 0
		jnz	short loc_44D2F
		jmp	loc_44DAE

loc_44D2F:
		push	ds
		push	offset aBye
		call	sub_4BA4
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

loc_44DAE:
		test	di, 1
		jz	short loc_44DBB
		push	si
		call	sub_39C
		pop	cx

loc_44DBB:
		pop	di
		pop	si
		pop	bp
		retf
Stopwatch_StartOrStop_44D13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44DBF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jz	short loc_44DDA
		mov	eax, dword_4DE15
		sub	eax, [si+1]
		add	[si+5], eax
		mov	byte ptr [si], 0

loc_44DDA:
		pop	si
		pop	bp
		retf
sub_44DBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Stopwatch_Elapsed_3EFDF
; (sub_3EFDF de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-21. Temps écoulé d'un chronomètre, en tics de 60 Hz : en marche
; ([si] ≠ 0) = cumul [si+5] + dword_47ABB (compteur de tics) − départ [si+1] ; arrêté = cumul
; [si+5].
; ==============================================================================================
Stopwatch_Elapsed_44DDD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jz	short loc_44DF8
		mov	eax, [si+5]
		add	eax, dword_4DE15
		sub	eax, [si+1]
		jmp	short loc_44DFC

loc_44DF8:
		mov	eax, [si+5]

loc_44DFC:
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
Stopwatch_Elapsed_44DDD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44E04		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_44E0B:
		mov	eax, [bp+arg_2]
		add	eax, [si+1]
		sub	eax, dword_4DE15
		cmp	eax, 0
		ja	short loc_44E0B
		pop	si
		pop	bp
		retf
sub_44E04		endp

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
Stopwatch_WaitElapsed_44E21		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_44E28:
		mov	eax, [si]
		add	eax, [si+4]
		cmp	eax, dword_4DE15
		jnb	short loc_44E28
		pop	si
		pop	bp
		retf
Stopwatch_WaitElapsed_44E21		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44E39		proc far
		push	bp
		mov	bp, sp
		push	6D9Ch
		push	cs
		call	near ptr sub_44C11
		pop	cx
		pop	bp
		retf
sub_44E39		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44E46		proc far
		push	bp
		mov	bp, sp
		push	2
		push	6D9Ch
		push	cs
sub_44E46		endp

; START OF FUNCTION CHUNK FOR sub_44E46
		db 0E8h
; END OF FUNCTION CHUNK FOR sub_44E46
seg176		ends
