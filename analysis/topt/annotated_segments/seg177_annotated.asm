seg177		segment	para public 'CODE' use16
		assume cs:seg177
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C1h, 0FEh, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44E57		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_44E77
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_44E77
		jmp	loc_44F06

loc_44E77:
		mov	al, byte_4DE42
		mov	ah, 0
		or	ax, ax
		jz	short loc_44E83
		jmp	loc_44F06

loc_44E83:
		push	large 100000h
		push	6D9Eh
		call	CRT_Memset_Public
		add	sp, 6
		nop
		push	cs
		call	near ptr Joystick_InitCalibrationDefaults_45178
		push	6D9Eh
		push	word_4F7B2
		call	Joystick_ReadAxesAndButtons_43985
		xor	di, di
		jmp	short loc_44EFC

loc_44EA9:
		mov	bx, di
		shl	bx, 3
		cmp	word ptr [bx+6D9Eh], 0
		jnz	short loc_44EC6
		mov	bx, di
		shl	bx, 3
		cmp	word ptr [bx+6DA0h], 0
		jnz	short loc_44EC6
		mov	ax, 1
		jmp	short loc_44EC8

loc_44EC6:
		xor	ax, ax

loc_44EC8:
		mov	[bp+var_1], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44EF6
		mov	bx, di
		shl	bx, 3
		mov	ax, [bx+6D9Eh]
		cmp	ax, word_4F7B2
		jnb	short loc_44EF6
		mov	bx, di
		shl	bx, 3
		mov	ax, [bx+6DA0h]
		cmp	ax, word_4F7B2
		jnb	short loc_44EF6
		mov	byte ptr [di+6DAEh], 1
		jmp	short loc_44EFB

loc_44EF6:
		mov	byte ptr [di+6DAEh], 0

loc_44EFB:
		inc	di

loc_44EFC:
		cmp	di, 2
		jl	short loc_44EA9
		mov	byte_4DE42, 1

loc_44F06:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_44E57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44F0C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_44F26
		test	dx, 1
		jz	short loc_44F26
		push	ax
		call	sub_39C
		pop	cx

loc_44F26:
		pop	bp
		retf
sub_44F0C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Joystick_ReadButtonsWrapper_3F12A (sub_3F12A de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Joystick_ReadButtonsWrapper_67906 (sub_67906 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe appelant
; Joystick_ReadButtonsOnly_663BD (seg199). Référencée depuis seg201.
; ==============================================================================================
Joystick_ReadButtonsWrapper_44F28		proc far
		push	bp
		mov	bp, sp
		call	Joystick_ReadButtonsOnly_439B7
		pop	bp
		retf
Joystick_ReadButtonsWrapper_44F28		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44F32		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		cmp	bx, word_4F7AE
		jge	short loc_44F6C
		mov	cx, bx
		sub	cx, word_4F7AE
		mov	ax, cx
		cwd
		idiv	word_4F7A4
		mov	bx, ax
		imul	word_4F7A4
		cmp	ax, cx
		jle	short loc_44F56
		dec	bx

loc_44F56:
		mov	ax, word_4F79E
		neg	ax
		cmp	ax, bx
		jle	short loc_44F66
		mov	ax, word_4F79E
		neg	ax
		jmp	short loc_44F68

loc_44F66:
		mov	ax, bx

loc_44F68:
		mov	bx, ax
		jmp	short loc_44FC3

loc_44F6C:
		cmp	bx, word_4F7AA
		jle	short loc_44F97
		mov	cx, bx
		sub	cx, word_4F7AA
		mov	ax, cx
		cwd
		idiv	word_4F7A2
		mov	bx, ax
		imul	word_4F7A4
		cmp	ax, cx
		jge	short loc_44F8A
		inc	bx

loc_44F8A:
		cmp	word_4F79E, bx
		jge	short loc_44F66
		mov	ax, word_4F79E
		jmp	short loc_44F68
		jmp	short loc_44F66

loc_44F97:
		cmp	word_4F7AE, 0
		jnz	short loc_44FC1
		mov	ax, bx
		sub	ax, word_4F792
		cwd
		idiv	word_4F7A2
		cmp	ax, word_4F79E
		jle	short loc_44FB4
		mov	ax, word_4F79E
		jmp	short loc_44F68

loc_44FB4:
		mov	ax, bx
		sub	ax, word_4F792
		cwd
		idiv	word_4F7A2
		jmp	short loc_44F68

loc_44FC1:
		xor	bx, bx

loc_44FC3:
		mov	ax, bx
		pop	bp
		retf
sub_44F32		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44FC7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		cmp	bx, word_4F7B0
		jge	short loc_45001
		mov	cx, bx
		sub	cx, word_4F7B0
		mov	ax, cx
		cwd
		idiv	word_4F7A8
		mov	bx, ax
		imul	word_4F7A8
		cmp	ax, cx
		jle	short loc_44FEB
		dec	bx

loc_44FEB:
		mov	ax, word_4F7A0
		neg	ax
		cmp	ax, bx
		jle	short loc_44FFB
		mov	ax, word_4F7A0
		neg	ax
		jmp	short loc_44FFD

loc_44FFB:
		mov	ax, bx

loc_44FFD:
		mov	bx, ax
		jmp	short loc_45058

loc_45001:
		cmp	bx, word_4F7AC
		jle	short loc_4502C
		mov	cx, bx
		sub	cx, word_4F7AC
		mov	ax, cx
		cwd
		idiv	word_4F7A6
		mov	bx, ax
		imul	word_4F7A8
		cmp	ax, cx
		jge	short loc_4501F
		inc	bx

loc_4501F:
		cmp	word_4F7A0, bx
		jge	short loc_44FFB
		mov	ax, word_4F7A0
		jmp	short loc_44FFD
		jmp	short loc_44FFB

loc_4502C:
		cmp	word_4F7B0, 0
		jnz	short loc_45056
		mov	ax, bx
		sub	ax, word_4F794
		cwd
		idiv	word_4F7A6
		cmp	ax, word_4F7A0
		jle	short loc_45049
		mov	ax, word_4F7A0
		jmp	short loc_44FFD

loc_45049:
		mov	ax, bx
		sub	ax, word_4F794
		cwd
		idiv	word_4F7A6
		jmp	short loc_44FFD

loc_45056:
		xor	bx, bx

loc_45058:
		mov	ax, bx
		pop	bp
		retf
sub_44FC7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4505C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, si
		shl	bx, 3
		push	word ptr [bx+6D9Eh]
		push	cs
		call	near ptr sub_44F32
		pop	cx
		mov	bx, si
		shl	bx, 3
		mov	[bx+6D9Eh], ax
		mov	bx, si
		shl	bx, 3
		push	word ptr [bx+6DA0h]
		push	cs
		call	near ptr sub_44FC7
		pop	cx
		mov	bx, si
		shl	bx, 3
		mov	[bx+6DA0h], ax
		pop	si
		pop	bp
		retf
sub_4505C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45094		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+6DAEh], 0
		jz	short loc_450BF
		mov	al, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr sub_450F2
		pop	cx
		mov	al, [bp+arg_0]
		mov	ah, 0
		shl	ax, 3
		mov	bx, ax
		mov	ax, [bx+6D9Eh]
		jmp	short loc_450C1

loc_450BF:
		xor	ax, ax

loc_450C1:
		pop	bp
		retf
sub_45094		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_450C3		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+6DAEh], 0
		jz	short loc_450EE
		mov	al, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr sub_450F2
		pop	cx
		mov	al, [bp+arg_0]
		mov	ah, 0
		shl	ax, 3
		mov	bx, ax
		mov	ax, [bx+6D9Eh]
		jmp	short loc_450F0

loc_450EE:
		xor	ax, ax

loc_450F0:
		pop	bp
		retf
sub_450C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_450F2		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		push	si
		call	sub_998D
		xor	si, si
		jmp	short loc_4510D

loc_450FF:
		cmp	byte ptr [si+6DAEh], 0
		jz	short loc_4510C
		push	si
		push	cs
		call	near ptr sub_4505C
		pop	cx

loc_4510C:
		inc	si

loc_4510D:
		cmp	si, 2
		jl	short loc_450FF
		mov	al, [bp+arg_0]
		mov	ah, 0
		shl	ax, 3
		add	ax, 6D9Eh
		pop	si
		pop	bp
		retf
sub_450F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_FormatCalibrationDisplay_3F35E (sub_3F35E de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; Joystick_FormatCalibrationDisplay_67B3A (sub_67B3A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Joystick_UpdateCalibration_67B0D et sub_3FD (formatage) ×2. Référencée par les clusters
; ConfigOption (seg201) et TextScroll (seg204).
; ==============================================================================================
Joystick_FormatCalibrationDisplay_45120		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	cs
		call	near ptr sub_450F2
		pop	cx
		push	ds
		push	si
		push	ds
		push	offset unk_4F77E
		mov	cx, 8
		call	CRT_Fmemcpy
		mov	ax, si
		add	ax, 8
		push	ds
		push	ax
		push	ds
		push	offset unk_4F786
		mov	cx, 8
		call	CRT_Fmemcpy
		pop	si
		pop	bp
		retf
Joystick_FormatCalibrationDisplay_45120		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45152		proc far

arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		shl	ax, 3
		mov	bx, ax
		mov	al, [bx+6DA2h]
		and	al, [bp+arg_2]
		pop	bp
		retf
sub_45152		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45168		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+6DAEh]
		pop	bp
		retf
sub_45168		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Joystick_InitCalibrationDefaults_3F3B6 (sub_3F3B6 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Joystick_InitCalibrationDefaults_67B92 (sub_67B92 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; initialise les paramètres de calibration par défaut (centre à 0x3FFF, min/max par défaut,
; échelles à 1). Appelée par Joystick_ReadAndScaleAxes_67835.
; ==============================================================================================
Joystick_InitCalibrationDefaults_45178		proc far
		push	bp
		mov	bp, sp
		mov	word_4F792, 0
		mov	word_4F794, 0
		mov	word_4F7B2, 3FFFh
		mov	ax, word_4F7B2
		mov	word_4F79A, ax
		mov	ax, word_4F7B2
		mov	word_4F79C, ax
		xor	ax, ax
		mov	word_4F7B0, ax
		mov	word_4F7AE, ax
		mov	word_4F7A2, 1
		mov	word_4F7A6, 1
		pop	bp
		retf
Joystick_InitCalibrationDefaults_45178		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_451AF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 3
		mov	ax, [bx+6D9Eh]
		pop	bp
		retf
sub_451AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_451BE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 3
		mov	ax, [bx+6DA0h]
		pop	bp
		retf
sub_451BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_451CD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	ax, [bx+6DD4h]
		pop	bp
		retf
sub_451CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_451DB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	ax, [bx+6DD8h]
		pop	bp
		retf
sub_451DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_451E9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6DD4h]
		mov	word_4F792, ax
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6DD8h]
		mov	word_4F794, ax
		pop	bp
		retf
sub_451E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45207		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6DD4h]
		mov	word_4F796, ax
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6DD8h]
		mov	word_4F798, ax
		pop	bp
		retf
sub_45207		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_ComputeCalibrationRatio_3F463 (sub_3F463 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Joystick_ComputeCalibrationRatio_67C3F (sub_67C3F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 57 lignes, NON DÉTAILLÉE — calcul de ratio/interpolation de calibration.
; ==============================================================================================
Joystick_ComputeCalibrationRatio_45225		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6DD4h]
		mov	word_4F79A, ax
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6DD8h]
		mov	word_4F79C, ax
		mov	ax, word_4F79A
		cmp	ax, word_4F79C
		jle	short loc_4524C
		jmp	short loc_4524F

loc_4524C:
		mov	ax, word_4F79C

loc_4524F:
		movsx	eax, ax
		imul	eax, eax, 0Bh
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	word_4F7B2, ax
		pop	bp
		retf
Joystick_ComputeCalibrationRatio_45225		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45267		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	word_4F79E, bx
		mov	word_4F7A0, cx
		xor	ax, ax
		mov	word_4F7B0, ax
		mov	word_4F7AE, ax
		mov	ax, word_4F79A
		sub	ax, word_4F792
		xor	dx, dx
		div	bx
		mov	word_4F7A2, ax
		mov	ax, word_4F79C
		sub	ax, word_4F794
		xor	dx, dx
		div	cx
		mov	word_4F7A6, ax
		pop	bp
		retf
sub_45267		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Joystick_InterpolateCalibrationPercent_3F4DC (sub_3F4DC de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Joystick_InterpolateCalibrationPercent_67CB8
; (sub_67CB8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⚠️ far, 138 lignes, NON DÉTAILLÉE — interpole une valeur d'axe calibrée en
; pourcentage (division par 100, arithmétique 32 bits) entre les bornes min/max. Référencée
; par sub_8EEBC et sub_8FDC0.
; ==============================================================================================
Joystick_InterpolateCalibrationPercent_4529E		proc far

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
		mov	word_4F79E, si
		mov	word_4F7A0, di
		movsx	eax, cx
		mov	dx, word_4F79A
		sub	dx, word_4F796
		movsx	edx, dx
		imul	eax, edx
		mov	ebx, 64h
		cdq
		idiv	ebx
		mov	word_4F7AA, ax
		mov	ax, word_4F796
		add	ax, word_4F7AA
		mov	word_4F7AA, ax
		movsx	eax, cx
		mov	dx, word_4F79C
		sub	dx, word_4F798
		movsx	edx, dx
		imul	eax, edx
		cdq
		idiv	ebx
		mov	word_4F7AC, ax
		mov	ax, word_4F798
		add	ax, word_4F7AC
		mov	word_4F7AC, ax
		mov	ax, word_4F79A
		sub	ax, word_4F7AA
		cwd
		idiv	si
		mov	word_4F7A2, ax
		mov	ax, word_4F79C
		sub	ax, word_4F7AC
		cwd
		idiv	di
		mov	word_4F7A6, ax
		movsx	eax, cx
		mov	dx, word_4F796
		sub	dx, word_4F792
		movsx	edx, dx
		imul	eax, edx
		cdq
		idiv	ebx
		mov	word_4F7AE, ax
		mov	ax, word_4F796
		sub	ax, word_4F7AE
		mov	word_4F7AE, ax
		movsx	eax, cx
		mov	dx, word_4F798
		sub	dx, word_4F794
		movsx	edx, dx
		imul	eax, edx
		cdq
		idiv	ebx
		mov	word_4F7B0, ax
		mov	ax, word_4F798
		sub	ax, word_4F7B0
		mov	word_4F7B0, ax
		mov	ax, word_4F7AE
		sub	ax, word_4F792
		cwd
		idiv	si
		mov	word_4F7A4, ax
		mov	ax, word_4F7B0
		sub	ax, word_4F794
		cwd
		idiv	di
		mov	word_4F7A8, ax
		pop	di
		pop	si
		pop	bp
		retf
Joystick_InterpolateCalibrationPercent_4529E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; OptionCounter_Construct_3F5C8 (sub_3F5C8 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à OptionCounter_Construct_67DA4 (sub_67DA4 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658, 1 octet) et
; réinitialise un compteur d'options (word_72E82). Référencée depuis seg201.
; ==============================================================================================
OptionCounter_Construct_4538A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_453A2
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_453A8

loc_453A2:
		mov	word_4F790, 0

loc_453A8:
		mov	ax, dx
		pop	bp
		retf
OptionCounter_Construct_4538A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_453AC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_453C6
		test	dx, 1
		jz	short loc_453C6
		push	ax
		call	sub_39C
		pop	cx

loc_453C6:
		pop	bp
		retf
sub_453AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_453C8		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_4F790
		pop	bp
		retf
sub_453C8		endp
seg177		ends
