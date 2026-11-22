seg173		segment	para public 'CODE' use16
		assume cs:seg173
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C6h, 6, 3Ah, 69h, 1

loc_56165:
		db 8Bh, 0C6h, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5616A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_56183
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_56187

loc_56183:
		mov	word ptr [si], 0FFFFh

loc_56187:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_5616A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stopwatch_RegisterTickModule_6F750 (sub_6F750 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stopwatch_RegisterTickModule_67611 (sub_67611 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far,
; enregistre un module de comptage de tics (loc_676E7) dans le registre de modules à créneaux
; temporisés (AIL_register_timer_5FF08, seg161) avec une cadence de 60 tics
; (AIL_set_timer_frequency_600DB), avec avertissement d'échec (Runtime_FatalErrorHandler, tag
; 4121h). Référencée par sub_8F47A — confirme que le registre de modules du seg161 est utilisé
; au-delà du seul séquenceur de contre-mesures.
; ==============================================================================================
Stopwatch_RegisterTickModule_5618C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_5E7D2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_561DA
		call	AIL_startup_9752
		push	seg seg173
		push	offset sub_56262
		call	sub_97F9
		add	sp, 4
		mov	[si], ax
		cmp	word ptr [si], 0FFFFh
		jz	short loc_561CC
		push	large 3Ch
		push	word ptr [si]
		call	sub_99CC
		add	sp, 6
		push	word ptr [si]
		call	sub_9909
		jmp	short loc_561D4

loc_561CC:
		push	4AB7h
		call	sub_9D78

loc_561D4:
		pop	cx
		mov	byte_5E7D2, 1

loc_561DA:
		pop	si
		pop	bp
		retf
Stopwatch_RegisterTickModule_5618C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Stopwatch_RegisterTickModuleVariant_6F7A1 (sub_6F7A1 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à Stopwatch_RegisterTickModuleVariant_3EE86 (sub_3EE86
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Stopwatch_RegisterTickModuleVariant_67662 (sub_67662 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, variante de
; Stopwatch_RegisterTickModule_67611 (AIL_register_timer_5FF08, ConfigureAndActivate_600DB,
; AIL_start_timer_60018).
; ==============================================================================================
Stopwatch_RegisterTickModuleVariant_561DD		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, 0FFFFh
		cmp	byte_5E7D2, 0
		jz	short loc_56215
		push	large [bp+arg_2]
		call	sub_97F9
		add	sp, 4
		mov	si, ax
		cmp	si, 0FFFFh
		jz	short loc_56215
		push	large [bp+arg_6]
		push	ax
		call	sub_99CC
		add	sp, 6
		push	si
		call	sub_9909
		pop	cx

loc_56215:
		mov	ax, si
		pop	si
		pop	bp
		retf
Stopwatch_RegisterTickModuleVariant_561DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Stopwatch_UnregisterTickModule_6F7DE (sub_6F7DE de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à Stopwatch_UnregisterTickModule_3EEC3 (sub_3EEC3 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; Stopwatch_UnregisterTickModule_6769F (sub_6769F de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, désenregistre le module de tic
; (AIL_release_timer_handle_5FFBD, seg161) si actif. Référencée par sub_27F0E et le
; destructeur ConfigOption (seg201).
; ==============================================================================================
Stopwatch_UnregisterTickModule_5621A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5E7D2, 0
		jz	short loc_56230
		push	[bp+arg_2]
		call	sub_98AE
		pop	cx

loc_56230:
		pop	bp
		retf
Stopwatch_UnregisterTickModule_5621A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Stopwatch_UnregisterTickModule_6F7DE (sub_6F7DE de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à Stopwatch_UnregisterTickModule_3EEC3 (sub_3EEC3 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; Stopwatch_UnregisterTickModule_6769F (sub_6769F de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, désenregistre le module de tic
; (AIL_release_timer_handle_5FFBD, seg161) si actif. Référencée par sub_27F0E et le
; destructeur ConfigOption (seg201).
; ==============================================================================================
Stopwatch_UnregisterTickModule_56232		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5E7D2, 0
		jz	short loc_56248
		push	[bp+arg_2]
		call	sub_9943
		pop	cx

loc_56248:
		pop	bp
		retf
Stopwatch_UnregisterTickModule_56232		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Stopwatch_UnregisterTickModule_6F7DE (sub_6F7DE de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à Stopwatch_UnregisterTickModule_3EEC3 (sub_3EEC3 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; Stopwatch_UnregisterTickModule_6769F (sub_6769F de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, désenregistre le module de tic
; (AIL_release_timer_handle_5FFBD, seg161) si actif. Référencée par sub_27F0E et le
; destructeur ConfigOption (seg201).
; ==============================================================================================
Stopwatch_UnregisterTickModule_5624A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5E7D2, 0
		jz	short loc_56260
		push	[bp+arg_2]
		call	sub_9909
		pop	cx

loc_56260:
		pop	bp
		retf
Stopwatch_UnregisterTickModule_5624A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56262		proc far
		push	bp
		mov	bp, sp
		inc	dword_5E7D3
		pop	bp
		retf
sub_56262		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Stopwatch_StartOrStop_6F830 (sub_6F830 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Stopwatch_StartOrStop_3EF15 (sub_3EF15 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Stopwatch_StartOrStop_676F1 (sub_676F1 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 138 lignes, NON DÉTAILLÉE — combine AIL_shutdown_5FE9F et sub_338 — démarre ou arrête le
; chronomètre (enregistrement/désenregistrement complet).
; ==============================================================================================
Stopwatch_StartOrStop_5626C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_5627E
		jmp	loc_56314

loc_5627E:
		cmp	byte_5E7D2, 0
		jnz	short loc_56288
		jmp	loc_56307

loc_56288:
		push	ds
		push	offset aBye_1
		call	sub_9790
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

loc_56307:
		test	di, 1
		jz	short loc_56314
		push	si
		call	sub_33B
		pop	cx

loc_56314:
		pop	di
		pop	si
		pop	bp
		retf
Stopwatch_StartOrStop_5626C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56318		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jz	short loc_56333
		mov	eax, dword_5E7D3
		sub	eax, [si+1]
		add	[si+5], eax
		mov	byte ptr [si], 0

loc_56333:
		pop	si
		pop	bp
		retf
sub_56318		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Stopwatch_Elapsed_6F8FA (sub_6F8FA de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par
; instruction à Stopwatch_Elapsed_3EFDF (sub_3EFDF de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. Temps écoulé d'un
; chronomètre, en tics de 60 Hz : en marche ([si] ≠ 0) = cumul [si+5] + dword_47ABB (compteur
; de tics) − départ [si+1] ; arrêté = cumul [si+5].
; ==============================================================================================
Stopwatch_Elapsed_56336		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jz	short loc_56351
		mov	eax, [si+5]
		add	eax, dword_5E7D3
		sub	eax, [si+1]
		jmp	short loc_56355

loc_56351:
		mov	eax, [si+5]

loc_56355:
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
Stopwatch_Elapsed_56336		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5635D		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_56364:
		mov	eax, [bp+arg_2]
		add	eax, [si+1]
		sub	eax, dword_5E7D3
		cmp	eax, 0
		ja	short loc_56364
		pop	si
		pop	bp
		retf
sub_5635D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Stopwatch_WaitElapsed_6F93E (sub_6F93E de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Stopwatch_WaitElapsed_3F023 (sub_3F023 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Attente active :
; boucle tant que début (+0) + durée (+4) >= dword_47ABB (tics à 60 Hz,
; Stopwatch_TickISR_3EF0B). Le nom « Stopwatch_Reset » repris de STRIKE.EXE (même code,
; sub_677FF) ne correspond pas : la fonction ne remet rien à zéro, elle attend la fin de la
; durée.
; ==============================================================================================
Stopwatch_WaitElapsed_5637A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_56381:
		mov	eax, [si]
		add	eax, [si+4]
		cmp	eax, dword_5E7D3
		jnb	short loc_56381
		pop	si
		pop	bp
		retf
Stopwatch_WaitElapsed_5637A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56392		proc far
		push	bp
		mov	bp, sp
		push	693Ch
		push	cs
		call	near ptr sub_5616A
		pop	cx
		pop	bp
		retf
sub_56392		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5639F		proc far
		push	bp
		mov	bp, sp
		push	2
		push	693Ch
		push	cs
		call	near ptr Stopwatch_StartOrStop_5626C
		add	sp, 4
		pop	bp
		retf
sub_5639F		endp
seg173		ends
