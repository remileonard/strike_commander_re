seg162		segment	byte public 'CODE' use16
		assume cs:seg162
		;org 9
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_ReadAndScaleAxes_67835 (sub_67835 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 117 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise les paramètres de calibration
; (Joystick_InitCalibrationDefaults_67B92) et lit les axes (Joystick_ReadAxesAndButtons_6638B,
; seg199).
; ==============================================================================================
Joystick_ReadAndScaleAxes_3F059	proc far		; CODE XREF: seg155:023BP
					; sub_5E851+70P

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3F079
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_3F079
		jmp	loc_3F108
; ���������������������������������������������������������������������������

loc_3F079:				; CODE XREF: Joystick_ReadAndScaleAxes_3F059+Dj
					; Joystick_ReadAndScaleAxes_3F059+1Bj
		mov	al, byte_47AE8
		mov	ah, 0
		or	ax, ax
		jz	short loc_3F085
		jmp	loc_3F108
; ���������������������������������������������������������������������������

loc_3F085:				; CODE XREF: Joystick_ReadAndScaleAxes_3F059+27j
		push	large 0C0000h
		push	67A4h
		call	CRT_Memset_Public
		add	sp, 6
		nop
		push	cs
		call	near ptr Joystick_InitCalibrationDefaults_3F3B6
		push	67A4h
		push	word_497F4
		call	Joystick_ReadAxesAndButtons_3DBFB
		xor	di, di
		jmp	short loc_3F0FE
; ���������������������������������������������������������������������������

loc_3F0AB:				; CODE XREF: Joystick_ReadAndScaleAxes_3F059+A8j
		mov	bx, di
		imul	bx, 6
		cmp	word ptr [bx+67A4h], 0
		jnz	short loc_3F0C8
		mov	bx, di
		imul	bx, 6
		cmp	word ptr [bx+67A6h], 0
		jnz	short loc_3F0C8
		mov	ax, 1
		jmp	short loc_3F0CA
; ���������������������������������������������������������������������������

loc_3F0C8:				; CODE XREF: Joystick_ReadAndScaleAxes_3F059+5Cj
					; Joystick_ReadAndScaleAxes_3F059+68j
		xor	ax, ax

loc_3F0CA:				; CODE XREF: Joystick_ReadAndScaleAxes_3F059+6Dj
		mov	[bp+var_1], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3F0F8
		mov	bx, di
		imul	bx, 6
		mov	ax, [bx+67A4h]
		cmp	ax, word_497F4
		jnb	short loc_3F0F8
		mov	bx, di
		imul	bx, 6
		mov	ax, [bx+67A6h]
		cmp	ax, word_497F4
		jnb	short loc_3F0F8
		mov	byte ptr [di+67B0h], 1
		jmp	short loc_3F0FD
; ���������������������������������������������������������������������������

loc_3F0F8:				; CODE XREF: Joystick_ReadAndScaleAxes_3F059+78j
					; Joystick_ReadAndScaleAxes_3F059+87j ...
		mov	byte ptr [di+67B0h], 0

loc_3F0FD:				; CODE XREF: Joystick_ReadAndScaleAxes_3F059+9Dj
		inc	di

loc_3F0FE:				; CODE XREF: Joystick_ReadAndScaleAxes_3F059+50j
		cmp	di, 2
		jl	short loc_3F0AB
		mov	byte_47AE8, 1

loc_3F108:				; CODE XREF: Joystick_ReadAndScaleAxes_3F059+1Dj
					; Joystick_ReadAndScaleAxes_3F059+29j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Joystick_ReadAndScaleAxes_3F059	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3F10E	proc far		; CODE XREF: sub_5E9CD+6EP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_3F128
		test	dx, 1
		jz	short loc_3F128
		push	ax
		call	sub_308
		pop	cx

loc_3F128:				; CODE XREF: sub_3F10E+Bj
					; sub_3F10E+11j
		pop	bp
		retf
sub_3F10E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Joystick_ReadButtonsWrapper_67906 (sub_67906 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, enveloppe appelant
; Joystick_ReadButtonsOnly_663BD (seg199). Référencée depuis seg201.
; ==============================================================================================
Joystick_ReadButtonsWrapper_3F12A	proc far		; CODE XREF: seg155:00E4P
		push	bp
		mov	bp, sp
		call	Joystick_ReadButtonsOnly_3DC2D
		pop	bp
		retf
Joystick_ReadButtonsWrapper_3F12A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_SampleAxesToTable_67910 (sub_67910 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; échantillonne les 2 axes du joystick (Joystick_ReadAxesAndButtons_6638B) et stocke les
; valeurs min/max courantes dans des tables indexées (0x5DC4/5DC6 → 0x5DF6/5DFA).
; ==============================================================================================
Joystick_SampleAxesToTable_3F134	proc far		; CODE XREF: seg063:loc_29594P
					; seg063:loc_295ADP ...
		push	bp
		mov	bp, sp
		push	67A4h
		push	word_497F4
		call	Joystick_ReadAxesAndButtons_3DBFB
		xor	dx, dx
		jmp	short loc_3F16A
; ���������������������������������������������������������������������������

loc_3F147:				; CODE XREF: Joystick_SampleAxesToTable_3F134+39j
		mov	bx, dx
		imul	bx, 6
		mov	ax, [bx+67A4h]
		mov	bx, dx
		shl	bx, 1
		mov	[bx+67D6h], ax
		mov	bx, dx
		imul	bx, 6
		mov	ax, [bx+67A6h]
		mov	bx, dx
		shl	bx, 1
		mov	[bx+67DAh], ax
		inc	dx

loc_3F16A:				; CODE XREF: Joystick_SampleAxesToTable_3F134+11j
		cmp	dx, 2
		jl	short loc_3F147
		pop	bp
		retf
Joystick_SampleAxesToTable_3F134	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3F171	proc far		; CODE XREF: Joystick_ComputeCalibratedAxes_3F29B+11p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		cmp	bx, word_497F0
		jge	short loc_3F1AB
		mov	cx, bx
		sub	cx, word_497F0
		mov	ax, cx
		cwd
		idiv	word_497E6
		mov	bx, ax
		imul	word_497E6
		cmp	ax, cx
		jle	short loc_3F195
		dec	bx

loc_3F195:				; CODE XREF: sub_3F171+21j
		mov	ax, word_497E0
		neg	ax
		cmp	ax, bx
		jle	short loc_3F1A5
		mov	ax, word_497E0
		neg	ax
		jmp	short loc_3F1A7
; ���������������������������������������������������������������������������

loc_3F1A5:				; CODE XREF: sub_3F171+2Bj
					; sub_3F171+5Cj ...
		mov	ax, bx

loc_3F1A7:				; CODE XREF: sub_3F171+32j
					; sub_3F171+61j ...
		mov	bx, ax
		jmp	short loc_3F202
; ���������������������������������������������������������������������������

loc_3F1AB:				; CODE XREF: sub_3F171+Aj
		cmp	bx, word_497EC
		jle	short loc_3F1D6
		mov	cx, bx
		sub	cx, word_497EC
		mov	ax, cx
		cwd
		idiv	word_497E4
		mov	bx, ax
		imul	word_497E6
		cmp	ax, cx
		jge	short loc_3F1C9
		inc	bx

loc_3F1C9:				; CODE XREF: sub_3F171+55j
		cmp	word_497E0, bx
		jge	short loc_3F1A5
		mov	ax, word_497E0
		jmp	short loc_3F1A7
; ���������������������������������������������������������������������������
		jmp	short loc_3F1A5
; ���������������������������������������������������������������������������

loc_3F1D6:				; CODE XREF: sub_3F171+3Ej
		cmp	word_497F0, 0
		jnz	short loc_3F200
		mov	ax, bx
		sub	ax, word_497D4
		cwd
		idiv	word_497E4
		cmp	ax, word_497E0
		jle	short loc_3F1F3
		mov	ax, word_497E0
		jmp	short loc_3F1A7
; ���������������������������������������������������������������������������

loc_3F1F3:				; CODE XREF: sub_3F171+7Bj
		mov	ax, bx
		sub	ax, word_497D4
		cwd
		idiv	word_497E4
		jmp	short loc_3F1A7
; ���������������������������������������������������������������������������

loc_3F200:				; CODE XREF: sub_3F171+6Aj
		xor	bx, bx

loc_3F202:				; CODE XREF: sub_3F171+38j
		mov	ax, bx
		pop	bp
		retf
sub_3F171	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3F206	proc far		; CODE XREF: Joystick_ComputeCalibratedAxes_3F29B+28p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		cmp	bx, word_497F2
		jge	short loc_3F240
		mov	cx, bx
		sub	cx, word_497F2
		mov	ax, cx
		cwd
		idiv	word_497EA
		mov	bx, ax
		imul	word_497EA
		cmp	ax, cx
		jle	short loc_3F22A
		dec	bx

loc_3F22A:				; CODE XREF: sub_3F206+21j
		mov	ax, word_497E2
		neg	ax
		cmp	ax, bx
		jle	short loc_3F23A
		mov	ax, word_497E2
		neg	ax
		jmp	short loc_3F23C
; ���������������������������������������������������������������������������

loc_3F23A:				; CODE XREF: sub_3F206+2Bj
					; sub_3F206+5Cj ...
		mov	ax, bx

loc_3F23C:				; CODE XREF: sub_3F206+32j
					; sub_3F206+61j ...
		mov	bx, ax
		jmp	short loc_3F297
; ���������������������������������������������������������������������������

loc_3F240:				; CODE XREF: sub_3F206+Aj
		cmp	bx, word_497EE
		jle	short loc_3F26B
		mov	cx, bx
		sub	cx, word_497EE
		mov	ax, cx
		cwd
		idiv	word_497E8
		mov	bx, ax
		imul	word_497EA
		cmp	ax, cx
		jge	short loc_3F25E
		inc	bx

loc_3F25E:				; CODE XREF: sub_3F206+55j
		cmp	word_497E2, bx
		jge	short loc_3F23A
		mov	ax, word_497E2
		jmp	short loc_3F23C
; ���������������������������������������������������������������������������
		jmp	short loc_3F23A
; ���������������������������������������������������������������������������

loc_3F26B:				; CODE XREF: sub_3F206+3Ej
		cmp	word_497F2, 0
		jnz	short loc_3F295
		mov	ax, bx
		sub	ax, word_497D6
		cwd
		idiv	word_497E8
		cmp	ax, word_497E2
		jle	short loc_3F288
		mov	ax, word_497E2
		jmp	short loc_3F23C
; ���������������������������������������������������������������������������

loc_3F288:				; CODE XREF: sub_3F206+7Bj
		mov	ax, bx
		sub	ax, word_497D6
		cwd
		idiv	word_497E8
		jmp	short loc_3F23C
; ���������������������������������������������������������������������������

loc_3F295:				; CODE XREF: sub_3F206+6Aj
		xor	bx, bx

loc_3F297:				; CODE XREF: sub_3F206+38j
		mov	ax, bx
		pop	bp
		retf
sub_3F206	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_ComputeCalibratedAxes_67A77 (sub_67A77 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Joystick_ApplyDeadzoneAndScale_6794D et Joystick_ApplyDeadzoneAndScaleB_679E2 —
; calcule les deux axes calibrés finaux.
; ==============================================================================================
Joystick_ComputeCalibratedAxes_3F29B	proc far		; CODE XREF: Joystick_UpdateCalibration_3F331+15p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, si
		imul	bx, 6
		push	word ptr [bx+67A4h]
		push	cs
		call	near ptr sub_3F171
		pop	cx
		mov	bx, si
		imul	bx, 6
		mov	[bx+67A4h], ax
		mov	bx, si
		imul	bx, 6
		push	word ptr [bx+67A6h]
		push	cs
		call	near ptr sub_3F206
		pop	cx
		mov	bx, si
		imul	bx, 6
		mov	[bx+67A6h], ax
		pop	si
		pop	bp
		retf
Joystick_ComputeCalibratedAxes_3F29B	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	al, [bp+6]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+67B0h], 0
		jz	short loc_3F2FE
		mov	al, [bp+6]
		push	ax
		nop
		push	cs
		call	near ptr Joystick_UpdateCalibration_3F331
		pop	cx
		mov	al, [bp+6]
		mov	ah, 0
		imul	ax, 6
		mov	bx, ax
		mov	ax, [bx+67A4h]
		jmp	short loc_3F300
; ���������������������������������������������������������������������������

loc_3F2FE:				; CODE XREF: seg162:0292j
		xor	ax, ax

loc_3F300:				; CODE XREF: seg162:02ACj
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	al, [bp+6]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+67B0h], 0
		jz	short loc_3F32D
		mov	al, [bp+6]
		push	ax
		nop
		push	cs
		call	near ptr Joystick_UpdateCalibration_3F331
		pop	cx
		mov	al, [bp+6]
		mov	ah, 0
		imul	ax, 6
		mov	bx, ax
		mov	ax, [bx+67A4h]
		jmp	short loc_3F32F
; ���������������������������������������������������������������������������

loc_3F32D:				; CODE XREF: seg162:02C1j
		xor	ax, ax

loc_3F32F:				; CODE XREF: seg162:02DBj
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_UpdateCalibration_67B0D (sub_67B0D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Joystick_SampleAxesToTable_67910 et Joystick_ComputeCalibratedAxes_67A77 — cycle de
; mise à jour de calibration.
; ==============================================================================================
Joystick_UpdateCalibration_3F331	proc far		; CODE XREF: sub_69E7+9P seg008:016CP	...

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	cs
		call	near ptr Joystick_SampleAxesToTable_3F134
		xor	si, si
		jmp	short loc_3F34B
; ���������������������������������������������������������������������������

loc_3F33D:				; CODE XREF: Joystick_UpdateCalibration_3F331+1Dj
		cmp	byte ptr [si+67B0h], 0
		jz	short loc_3F34A
		push	si
		push	cs
		call	near ptr Joystick_ComputeCalibratedAxes_3F29B
		pop	cx

loc_3F34A:				; CODE XREF: Joystick_UpdateCalibration_3F331+11j
		inc	si

loc_3F34B:				; CODE XREF: Joystick_UpdateCalibration_3F331+Aj
		cmp	si, 2
		jl	short loc_3F33D
		mov	al, [bp+arg_0]
		mov	ah, 0
		imul	ax, 6
		add	ax, 67A4h
		pop	si
		pop	bp
		retf
Joystick_UpdateCalibration_3F331	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Joystick_FormatCalibrationDisplay_67B3A (sub_67B3A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Joystick_UpdateCalibration_67B0D et sub_3FD (formatage) ×2. Référencée par les clusters
; ConfigOption (seg201) et TextScroll (seg204).
; ==============================================================================================
Joystick_FormatCalibrationDisplay_3F35E	proc far		; CODE XREF: seg155:0117P ConfigOption_ApplyAndDisplayB_3E1B3+AP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	cs
		call	near ptr Joystick_UpdateCalibration_3F331
		pop	cx
		push	ds
		push	si
		push	ds
		push	offset unk_497C4
		mov	cx, 6
		call	CRT_Fmemcpy
		mov	ax, si
		add	ax, 6
		push	ds
		push	ax
		push	ds
		push	offset unk_497CA
		mov	cx, 6
		call	CRT_Fmemcpy
		pop	si
		pop	bp
		retf
Joystick_FormatCalibrationDisplay_3F35E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_TestButtonMasked_67B6C (sub_67B6C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far,
; teste un bit de bouton (table 0x5DC8, indexée par arg_0, masquée par arg_2). Référencée
; directement par Player_MainUpdate (sub_13100).
; ==============================================================================================
Joystick_TestButtonMasked_3F390	proc far		; CODE XREF: seg008:0178P seg008:0189P ...

arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		imul	ax, 6
		mov	bx, ax
		mov	al, [bx+67A8h]
		and	al, [bp+arg_2]
		pop	bp
		retf
Joystick_TestButtonMasked_3F390	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3F3A6	proc far		; CODE XREF: seg008:00B4P seg008:012CP ...

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+67B0h]
		pop	bp
		retf
sub_3F3A6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Joystick_InitCalibrationDefaults_67B92 (sub_67B92 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, initialise les paramètres de
; calibration par défaut (centre à 0x3FFF, min/max par défaut, échelles à 1). Appelée par
; Joystick_ReadAndScaleAxes_67835.
; ==============================================================================================
Joystick_InitCalibrationDefaults_3F3B6	proc far		; CODE XREF: seg063:0361P
					; Joystick_ReadAndScaleAxes_3F059+3Fp ...
		push	bp
		mov	bp, sp
		mov	word_497D4, 0
		mov	word_497D6, 0
		mov	word_497F4, 3FFFh
		mov	ax, word_497F4
		mov	word_497DC, ax
		mov	ax, word_497F4
		mov	word_497DE, ax
		xor	ax, ax
		mov	word_497F2, ax
		mov	word_497F0, ax
		mov	word_497E4, 1
		mov	word_497E8, 1
		pop	bp
		retf
Joystick_InitCalibrationDefaults_3F3B6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3F3ED	proc far		; CODE XREF: seg008:01AEP
					; sub_6DBF+106P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		imul	bx, 6
		mov	ax, [bx+67A4h]
		pop	bp
		retf
sub_3F3ED	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3F3FC	proc far		; CODE XREF: seg008:01BBP
					; sub_6DBF+113P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		imul	bx, 6
		mov	ax, [bx+67A6h]
		pop	bp
		retf
sub_3F3FC	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	bx, [bp+6]
		shl	bx, 1
		mov	ax, [bx+67D6h]
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	bx, [bp+6]
		shl	bx, 1
		mov	ax, [bx+67DAh]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3F427	proc far		; CODE XREF: seg063:03D9P
					; sub_5E1A1+359P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+67D6h]
		mov	word_497D4, ax
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+67DAh]
		mov	word_497D6, ax
		pop	bp
		retf
sub_3F427	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3F445	proc far		; CODE XREF: seg063:04CFP
					; sub_5E1A1+49BP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+67D6h]
		mov	word_497D8, ax
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+67DAh]
		mov	word_497DA, ax
		pop	bp
		retf
sub_3F445	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_ComputeCalibrationRatio_67C3F (sub_67C3F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 57 lignes, NON DÉTAILLÉE — calcul de ratio/interpolation de calibration.
; ==============================================================================================
Joystick_ComputeCalibrationRatio_3F463	proc far		; CODE XREF: seg063:0454P
					; sub_5E1A1+3FAP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+67D6h]
		mov	word_497DC, ax
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+67DAh]
		mov	word_497DE, ax
		mov	ax, word_497DC
		cmp	ax, word_497DE
		jle	short loc_3F48A
		jmp	short loc_3F48D
; ���������������������������������������������������������������������������

loc_3F48A:				; CODE XREF: Joystick_ComputeCalibrationRatio_3F463+23j
		mov	ax, word_497DE

loc_3F48D:				; CODE XREF: Joystick_ComputeCalibrationRatio_3F463+25j
		movsx	eax, ax
		imul	eax, 0Bh
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	word_497F4, ax
		pop	bp
		retf
Joystick_ComputeCalibrationRatio_3F463	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	bx, [bp+6]
		mov	cx, [bp+8]
		mov	word_497E0, bx
		mov	word_497E2, cx
		xor	ax, ax
		mov	word_497F2, ax
		mov	word_497F0, ax
		mov	ax, word_497DC
		sub	ax, word_497D4
		xor	dx, dx
		div	bx
		mov	word_497E4, ax
		mov	ax, word_497DE
		sub	ax, word_497D6
		xor	dx, dx
		div	cx
		mov	word_497E8, ax
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Joystick_InterpolateCalibrationPercent_67CB8 (sub_67CB8 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 138 lignes, NON DÉTAILLÉE —
; interpole une valeur d'axe calibrée en pourcentage (division par 100, arithmétique 32 bits)
; entre les bornes min/max. Référencée par sub_8EEBC et sub_8FDC0.
; ==============================================================================================
Joystick_InterpolateCalibrationPercent_3F4DC	proc far		; CODE XREF: seg063:04F6P
					; sub_5E1A1+4C2P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	word_497E0, si
		mov	word_497E2, di
		movsx	eax, cx
		mov	dx, word_497DC
		sub	dx, word_497D8
		movsx	edx, dx
		imul	eax, edx
		mov	ebx, 64h ; 'd'
		cdq
		idiv	ebx
		mov	word_497EC, ax
		mov	ax, word_497D8
		add	ax, word_497EC
		mov	word_497EC, ax
		movsx	eax, cx
		mov	dx, word_497DE
		sub	dx, word_497DA
		movsx	edx, dx
		imul	eax, edx
		cdq
		idiv	ebx
		mov	word_497EE, ax
		mov	ax, word_497DA
		add	ax, word_497EE
		mov	word_497EE, ax
		mov	ax, word_497DC
		sub	ax, word_497EC
		cwd
		idiv	si
		mov	word_497E4, ax
		mov	ax, word_497DE
		sub	ax, word_497EE
		cwd
		idiv	di
		mov	word_497E8, ax
		movsx	eax, cx
		mov	dx, word_497D8
		sub	dx, word_497D4
		movsx	edx, dx
		imul	eax, edx
		cdq
		idiv	ebx
		mov	word_497F0, ax
		mov	ax, word_497D8
		sub	ax, word_497F0
		mov	word_497F0, ax
		movsx	eax, cx
		mov	dx, word_497DA
		sub	dx, word_497D6
		movsx	edx, dx
		imul	eax, edx
		cdq
		idiv	ebx
		mov	word_497F2, ax
		mov	ax, word_497DA
		sub	ax, word_497F2
		mov	word_497F2, ax
		mov	ax, word_497F0
		sub	ax, word_497D4
		cwd
		idiv	si
		mov	word_497E6, ax
		mov	ax, word_497F2
		sub	ax, word_497D6
		cwd
		idiv	di
		mov	word_497EA, ax
		pop	di
		pop	si
		pop	bp
		retf
Joystick_InterpolateCalibrationPercent_3F4DC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; OptionCounter_Construct_67DA4 (sub_67DA4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, alloue (sub_658, 1 octet) et réinitialise un
; compteur d'options (word_72E82). Référencée depuis seg201.
; ==============================================================================================
OptionCounter_Construct_3F5C8	proc far		; CODE XREF: seg155:001BP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_3F5E0
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_3F5E6

loc_3F5E0:				; CODE XREF: OptionCounter_Construct_3F5C8+8j
		mov	word_497D2, 0

loc_3F5E6:				; CODE XREF: OptionCounter_Construct_3F5C8+16j
		mov	ax, dx
		pop	bp
		retf
OptionCounter_Construct_3F5C8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3F5EA	proc far		; CODE XREF: seg155:00C4P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_3F604
		test	dx, 1
		jz	short loc_3F604
		push	ax
		call	sub_308
		pop	cx

loc_3F604:				; CODE XREF: sub_3F5EA+Bj
					; sub_3F5EA+11j
		pop	bp
		retf
sub_3F5EA	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, word_497D2
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à OptionCounter_Set_67DEA
; (sub_67DEA de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, écrit le compteur d'options (word_72E82). Référencée par
; ConfigOption_ConstructFull_66762 (seg201).
; ==============================================================================================
OptionCounter_Set_3F60E	proc far		; CODE XREF: ConfigOption_ConstructFull_3DF86+26P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_497D2, ax
		pop	bp
		retf
OptionCounter_Set_3F60E	endp

seg162		ends
