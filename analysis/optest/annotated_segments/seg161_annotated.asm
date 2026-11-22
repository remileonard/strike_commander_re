seg161		segment	byte public 'CODE' use16
		assume cs:seg161
		;org 3
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3EE13	proc far		; CODE XREF: seg161:0232p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_3EE17:				; DATA XREF: seg170:05DEo
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3EE2C
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3EE30

loc_3EE2C:				; CODE XREF: sub_3EE13+9j
		mov	word ptr [si], 0FFFFh

loc_3EE30:				; CODE XREF: sub_3EE13+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_3EE13	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

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
Stopwatch_RegisterTickModule_3EE35	proc far		; CODE XREF: sub_5E851+1AP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_47ABA
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3EE83
		call	AIL_startup_306D7
		push	seg seg161
		push	offset Stopwatch_TickISR_3EF0B
		call	AIL_register_timer_3077E
		add	sp, 4
		mov	[si], ax
		cmp	word ptr [si], 0FFFFh
		jz	short loc_3EE75
		push	large 3Ch ; '<'
		push	word ptr [si]
		call	AIL_set_timer_frequency_30951
		add	sp, 6
		push	word ptr [si]
		call	sub_3088E
		jmp	short loc_3EE7D
; ���������������������������������������������������������������������������

loc_3EE75:				; CODE XREF: Stopwatch_RegisterTickModule_3EE35+28j
		push	4A9Fh
		call	Fatal_Error_310B

loc_3EE7D:				; CODE XREF: Stopwatch_RegisterTickModule_3EE35+3Ej
		pop	cx
		mov	byte_47ABA, 1

loc_3EE83:				; CODE XREF: Stopwatch_RegisterTickModule_3EE35+Ej
		pop	si
		pop	bp
		retf
Stopwatch_RegisterTickModule_3EE35	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Stopwatch_RegisterTickModuleVariant_67662 (sub_67662 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, variante de
; Stopwatch_RegisterTickModule_67611 (AIL_register_timer_5FF08, ConfigureAndActivate_600DB,
; AIL_start_timer_60018).
; ==============================================================================================
Stopwatch_RegisterTickModuleVariant_3EE86	proc far		; CODE XREF: ConfigOption_ConstructFull_3DF86+38P
					; sub_5D287+8F6P ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, 0FFFFh
		cmp	byte_47ABA, 0
		jz	short loc_3EEBE
		push	large [bp+arg_2]
		call	AIL_register_timer_3077E
		add	sp, 4
		mov	si, ax
		cmp	si, 0FFFFh
		jz	short loc_3EEBE
		push	large [bp+arg_6]
		push	ax
		call	AIL_set_timer_frequency_30951
		add	sp, 6
		push	si
		call	sub_3088E
		pop	cx

loc_3EEBE:				; CODE XREF: Stopwatch_RegisterTickModuleVariant_3EE86+Fj
					; Stopwatch_RegisterTickModuleVariant_3EE86+22j
		mov	ax, si
		pop	si
		pop	bp
		retf
Stopwatch_RegisterTickModuleVariant_3EE86	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Stopwatch_UnregisterTickModule_6769F (sub_6769F de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, désenregistre le module de tic
; (AIL_release_timer_handle_5FFBD, seg161) si actif. Référencée par sub_27F0E et le
; destructeur ConfigOption (seg201).
; ==============================================================================================
Stopwatch_UnregisterTickModule_3EEC3	proc far		; CODE XREF: seg155:00B4P
					; sub_5DC96+65P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_47ABA, 0
		jz	short loc_3EED9
		push	[bp+arg_2]
		call	AIL_release_timer_handle_30833
		pop	cx

loc_3EED9:				; CODE XREF: Stopwatch_UnregisterTickModule_3EEC3+Bj
		pop	bp
		retf
Stopwatch_UnregisterTickModule_3EEC3	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		cmp	byte_47ABA, 0
		jz	short loc_3EEF1
		push	word ptr [bp+8]
		call	sub_308C8
		pop	cx

loc_3EEF1:				; CODE XREF: seg161:00D6j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		cmp	byte_47ABA, 0
		jz	short loc_3EF09
		push	word ptr [bp+8]
		call	sub_3088E
		pop	cx

loc_3EF09:				; CODE XREF: seg161:00EEj
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Routine de minuterie enregistrée par Stopwatch_RegisterTickModule_3EE35
; (AIL_register_timer_3077E, AIL_set_timer_frequency_30951 à 60 Hz) : incrémente dword_47ABB,
; compteur de tics à 60 Hz.
; ==============================================================================================
Stopwatch_TickISR_3EF0B:				; DATA XREF: Stopwatch_RegisterTickModule_3EE35+18o
		push	bp
		mov	bp, sp
		inc	dword_47ABB
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Stopwatch_StartOrStop_676F1 (sub_676F1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 138 lignes, NON DÉTAILLÉE — combine
; AIL_shutdown_5FE9F et sub_338 — démarre ou arrête le chronomètre
; (enregistrement/désenregistrement complet).
; ==============================================================================================
Stopwatch_StartOrStop_3EF15	proc far		; CODE XREF: seg161:0241p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_3EF27
		jmp	loc_3EFBD
; ���������������������������������������������������������������������������

loc_3EF27:				; CODE XREF: Stopwatch_StartOrStop_3EF15+Dj
		cmp	byte_47ABA, 0
		jnz	short loc_3EF31
		jmp	loc_3EFB0
; ���������������������������������������������������������������������������

loc_3EF31:				; CODE XREF: Stopwatch_StartOrStop_3EF15+17j
		push	ds
		push	offset aBye	; "bye!"
		call	AIL_shutdown_30715
		add	sp, 4
		mov	ah, 2
		int	1Ah		; CLOCK	- READ REAL TIME CLOCK (AT,XT286,CONV,PS)
					; Return: CH = hours in	BCD
					; CL = minutes in BCD
					; DH = seconds in BCD
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
		int	21h		; DOS -	SET CURRENT TIME
					; CH = hours, CL = minutes, DH = seconds, DL = hundredths of seconds
					; Return: AL = 00h if no error / = FFh if bad value sent to routine
		mov	ah, 4
		int	1Ah		; CLOCK	- READ DATE FROM REAL TIME CLOCK (AT,XT286,CONV,PS)
					; Return: DL = day in BCD
					; DH = month in	BCD
					; CL = year in BCD
					; CH = century (19h or 20h)
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
		mov	ah, 64h	; 'd'
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
		int	21h		; DOS -	SET CURRENT DATE
					; DL = day, DH = month,	CX = year
					; Return: AL = 00h if no error /= FFh if bad value sent	to routine

loc_3EFB0:				; CODE XREF: Stopwatch_StartOrStop_3EF15+19j
		test	di, 1
		jz	short loc_3EFBD
		push	si
		call	sub_308
		pop	cx

loc_3EFBD:				; CODE XREF: Stopwatch_StartOrStop_3EF15+Fj
					; Stopwatch_StartOrStop_3EF15+9Fj
		pop	di
		pop	si
		pop	bp
		retf
Stopwatch_StartOrStop_3EF15	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si], 0
		jz	short loc_3EFDC
		mov	eax, dword_47ABB
		sub	eax, [si+1]
		add	[si+5],	eax
		mov	byte ptr [si], 0

loc_3EFDC:				; CODE XREF: seg161:01BBj
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Temps écoulé d'un chronomètre, en tics de 60 Hz : en marche ([si] ≠ 0)
; = cumul [si+5] + dword_47ABB (compteur de tics) − départ [si+1] ; arrêté = cumul [si+5].
; ==============================================================================================
Stopwatch_Elapsed_3EFDF	proc far		; CODE XREF: VoicePlayer_GetLipFrame_8466+1AP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jz	short loc_3EFFA
		mov	eax, [si+5]
		add	eax, dword_47ABB
		sub	eax, [si+1]
		jmp	short loc_3EFFE
; ���������������������������������������������������������������������������

loc_3EFFA:				; CODE XREF: Stopwatch_Elapsed_3EFDF+Aj
		mov	eax, [si+5]

loc_3EFFE:				; CODE XREF: Stopwatch_Elapsed_3EFDF+19j
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
Stopwatch_Elapsed_3EFDF	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]

loc_3F00D:				; CODE XREF: seg161:020Ej
		mov	eax, [bp+8]
		add	eax, [si+1]
		sub	eax, dword_47ABB
		cmp	eax, 0
		ja	short loc_3F00D
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Attente active : boucle tant que début (+0) + durée (+4) >= dword_47ABB
; (tics à 60 Hz, Stopwatch_TickISR_3EF0B). Le nom « Stopwatch_Reset » repris de STRIKE.EXE
; (même code, sub_677FF) ne correspond pas : la fonction ne remet rien à zéro, elle attend la
; fin de la durée.
; ==============================================================================================
Stopwatch_WaitElapsed_3F023	proc far		; CODE XREF: Scene_Tick_C652+BEP seg023:0130P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_3F02A:				; CODE XREF: Stopwatch_WaitElapsed_3F023+13j
		mov	eax, [si]
		add	eax, [si+4]
		cmp	eax, dword_47ABB
		jnb	short loc_3F02A
		pop	si
		pop	bp
		retf
Stopwatch_WaitElapsed_3F023	endp

; ���������������������������������������������������������������������������

loc_3F03B:				; DATA XREF: dseg:5964o
		push	bp
		mov	bp, sp
		push	67A2h
		push	cs
		call	near ptr sub_3EE13
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3F048:				; DATA XREF: dseg:59F4o
		push	bp
		mov	bp, sp
		push	2
		push	67A2h
		push	cs
		call	near ptr Stopwatch_StartOrStop_3EF15
		add	sp, 4
		pop	bp
		retf
seg161		ends
