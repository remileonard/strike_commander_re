seg006		segment	para public 'CODE' use16
		assume cs:seg006
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4EB1		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_4ED1
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_4ED1
		jmp	loc_4F6E

loc_4ED1:
		mov	al, byte_7691B
		mov	ah, 0
		or	ax, ax
		jz	short loc_4EDD
		jmp	loc_4F6E

loc_4EDD:
		push	large 100000h
		push	5CC4h
		call	CRT_Memset_Public
		add	sp, 6
		nop
		push	cs
		call	near ptr Joystick_InitCalibrationDefaults_525B
		push	5CC4h
		push	word_7C428
		call	Joystick_ReadAxesAndButtons_6E515
		xor	dx, dx
		xor	di, di
		jmp	short loc_4F59

loc_4F05:
		mov	bx, di
		shl	bx, 3
		cmp	word ptr [bx+5CC4h], 0
		jnz	short loc_4F22
		mov	bx, di
		shl	bx, 3
		cmp	word ptr [bx+5CC6h], 0
		jnz	short loc_4F22
		mov	ax, 1
		jmp	short loc_4F24

loc_4F22:
		xor	ax, ax

loc_4F24:
		mov	[bp+var_1], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4F3C
		mov	bx, di
		shl	bx, 3
		mov	ax, [bx+5CC4h]
		cmp	ax, word_7C428
		jb	short loc_4F4B

loc_4F3C:
		mov	bx, di
		shl	bx, 3
		mov	ax, [bx+5CC6h]
		cmp	ax, word_7C428
		jnb	short loc_4F53

loc_4F4B:
		mov	byte ptr [di+5CD4h], 1
		inc	dx
		jmp	short loc_4F58

loc_4F53:
		mov	byte ptr [di+5CD4h], 0

loc_4F58:
		inc	di

loc_4F59:
		cmp	di, 2
		jl	short loc_4F05
		or	dx, dx
		jnz	short loc_4F69
		push	si
		nop
		push	cs
		call	near ptr sub_4F74
		pop	cx

loc_4F69:
		mov	byte_7691B, 1

loc_4F6E:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_4EB1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F74		proc far

var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	cx, [bp+arg_0]
		mov	[bp+var_3], 0
		mov	ah, 84h
		mov	dx, 0F0h
		int	15h
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 5347h
		jnz	short loc_4F98
		mov	byte_76918, 1

loc_4F98:
		mov	al, byte_76918
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4FA5
		mov	al, 0
		jmp	short loc_4FEC

loc_4FA5:
		mov	word_76919, bx
		call	sub_22DDB
		xor	si, si
		jmp	short loc_4FE7

loc_4FB2:
		mov	bx, si
		shl	bx, 3
		cmp	word ptr [bx+5CC4h], 0
		jnz	short loc_4FCF
		mov	bx, si
		shl	bx, 3
		cmp	word ptr [bx+5CC6h], 0
		jnz	short loc_4FCF
		mov	ax, 1
		jmp	short loc_4FD1

loc_4FCF:
		xor	ax, ax

loc_4FD1:
		mov	[bp+var_4], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4FE1
		mov	byte ptr [si+5CD4h], 1
		jmp	short loc_4FE6

loc_4FE1:
		mov	byte ptr [si+5CD4h], 0

loc_4FE6:
		inc	si

loc_4FE7:
		cmp	si, 2
		jl	short loc_4FB2

loc_4FEC:
		pop	si
		leave
		retf
sub_4F74		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4FEF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_5009
		test	dx, 1
		jz	short loc_5009
		push	ax
		call	sub_3B2
		pop	cx

loc_5009:
		pop	bp
		retf
sub_4FEF		endp

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
Joystick_ReadButtonsWrapper_500B		proc far
		push	bp
		mov	bp, sp
		call	Joystick_ReadButtonsOnly_6E547
		pop	bp
		retf
Joystick_ReadButtonsWrapper_500B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5015		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		cmp	bx, word_7C424
		jge	short loc_504F
		mov	cx, bx
		sub	cx, word_7C424
		mov	ax, cx
		cwd
		idiv	word_7C41A
		mov	bx, ax
		imul	word_7C41A
		cmp	ax, cx
		jle	short loc_5039
		dec	bx

loc_5039:
		mov	ax, word_7C414
		neg	ax
		cmp	ax, bx
		jle	short loc_5049
		mov	ax, word_7C414
		neg	ax
		jmp	short loc_504B

loc_5049:
		mov	ax, bx

loc_504B:
		mov	bx, ax
		jmp	short loc_50A6

loc_504F:
		cmp	bx, word_7C420
		jle	short loc_507A
		mov	cx, bx
		sub	cx, word_7C420
		mov	ax, cx
		cwd
		idiv	word_7C418
		mov	bx, ax
		imul	word_7C41A
		cmp	ax, cx
		jge	short loc_506D
		inc	bx

loc_506D:
		cmp	word_7C414, bx
		jge	short loc_5049
		mov	ax, word_7C414
		jmp	short loc_504B
		jmp	short loc_5049

loc_507A:
		cmp	word_7C424, 0
		jnz	short loc_50A4
		mov	ax, bx
		sub	ax, word_7C408
		cwd
		idiv	word_7C418
		cmp	ax, word_7C414
		jle	short loc_5097
		mov	ax, word_7C414
		jmp	short loc_504B

loc_5097:
		mov	ax, bx
		sub	ax, word_7C408
		cwd
		idiv	word_7C418
		jmp	short loc_504B

loc_50A4:
		xor	bx, bx

loc_50A6:
		mov	ax, bx
		pop	bp
		retf
sub_5015		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50AA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		cmp	bx, word_7C426
		jge	short loc_50E4
		mov	cx, bx
		sub	cx, word_7C426
		mov	ax, cx
		cwd
		idiv	word_7C41E
		mov	bx, ax
		imul	word_7C41E
		cmp	ax, cx
		jle	short loc_50CE
		dec	bx

loc_50CE:
		mov	ax, word_7C416
		neg	ax
		cmp	ax, bx
		jle	short loc_50DE
		mov	ax, word_7C416
		neg	ax
		jmp	short loc_50E0

loc_50DE:
		mov	ax, bx

loc_50E0:
		mov	bx, ax
		jmp	short loc_513B

loc_50E4:
		cmp	bx, word_7C422
		jle	short loc_510F
		mov	cx, bx
		sub	cx, word_7C422
		mov	ax, cx
		cwd
		idiv	word_7C41C
		mov	bx, ax
		imul	word_7C41E
		cmp	ax, cx
		jge	short loc_5102
		inc	bx

loc_5102:
		cmp	word_7C416, bx
		jge	short loc_50DE
		mov	ax, word_7C416
		jmp	short loc_50E0
		jmp	short loc_50DE

loc_510F:
		cmp	word_7C426, 0
		jnz	short loc_5139
		mov	ax, bx
		sub	ax, word_7C40A
		cwd
		idiv	word_7C41C
		cmp	ax, word_7C416
		jle	short loc_512C
		mov	ax, word_7C416
		jmp	short loc_50E0

loc_512C:
		mov	ax, bx
		sub	ax, word_7C40A
		cwd
		idiv	word_7C41C
		jmp	short loc_50E0

loc_5139:
		xor	bx, bx

loc_513B:
		mov	ax, bx
		pop	bp
		retf
sub_50AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_513F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, si
		shl	bx, 3
		push	word ptr [bx+5CC4h]
		push	cs
		call	near ptr sub_5015
		pop	cx
		mov	bx, si
		shl	bx, 3
		mov	[bx+5CC4h], ax
		mov	bx, si
		shl	bx, 3
		push	word ptr [bx+5CC6h]
		push	cs
		call	near ptr sub_50AA
		pop	cx
		mov	bx, si
		shl	bx, 3
		mov	[bx+5CC6h], ax
		pop	si
		pop	bp
		retf
sub_513F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5177		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+5CD4h], 0
		jz	short loc_51A2
		mov	al, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr sub_51D5
		pop	cx
		mov	al, [bp+arg_0]
		mov	ah, 0
		shl	ax, 3
		mov	bx, ax
		mov	ax, [bx+5CC4h]
		jmp	short loc_51A4

loc_51A2:
		xor	ax, ax

loc_51A4:
		pop	bp
		retf
sub_5177		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51A6		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+5CD4h], 0
		jz	short loc_51D1
		mov	al, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr sub_51D5
		pop	cx
		mov	al, [bp+arg_0]
		mov	ah, 0
		shl	ax, 3
		mov	bx, ax
		mov	ax, [bx+5CC4h]
		jmp	short loc_51D3

loc_51D1:
		xor	ax, ax

loc_51D3:
		pop	bp
		retf
sub_51A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51D5		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		push	si
		call	sub_22DDB
		xor	si, si
		jmp	short loc_51F0

loc_51E2:
		cmp	byte ptr [si+5CD4h], 0
		jz	short loc_51EF
		push	si
		push	cs
		call	near ptr sub_513F
		pop	cx

loc_51EF:
		inc	si

loc_51F0:
		cmp	si, 2
		jl	short loc_51E2
		mov	al, [bp+arg_0]
		mov	ah, 0
		shl	ax, 3
		add	ax, 5CC4h
		pop	si
		pop	bp
		retf
sub_51D5		endp

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
Joystick_FormatCalibrationDisplay_5203		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	cs
		call	near ptr sub_51D5
		pop	cx
		push	ds
		push	si
		push	ds
		push	offset word_7C3F4
		mov	cx, 8
		call	CRT_Fmemcpy
		mov	ax, si
		add	ax, 8
		push	ds
		push	ax
		push	ds
		push	offset word_7C3FC
		mov	cx, 8
		call	CRT_Fmemcpy
		pop	si
		pop	bp
		retf
Joystick_FormatCalibrationDisplay_5203		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5235		proc far

arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		shl	ax, 3
		mov	bx, ax
		mov	al, [bx+5CC8h]
		and	al, [bp+arg_2]
		pop	bp
		retf
sub_5235		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_524B		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+5CD4h]
		pop	bp
		retf
sub_524B		endp

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
Joystick_InitCalibrationDefaults_525B		proc far
		push	bp
		mov	bp, sp
		mov	word_7C408, 0
		mov	word_7C40A, 0
		mov	word_7C428, 3FFFh
		mov	ax, word_7C428
		mov	word_7C410, ax
		mov	ax, word_7C428
		mov	word_7C412, ax
		xor	ax, ax
		mov	word_7C426, ax
		mov	word_7C424, ax
		mov	word_7C418, 1
		mov	word_7C41C, 1
		pop	bp
		retf
Joystick_InitCalibrationDefaults_525B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5292		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 3
		mov	ax, [bx+5CC4h]
		pop	bp
		retf
sub_5292		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52A1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 3
		mov	ax, [bx+5CC6h]
		pop	bp
		retf
sub_52A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52B0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	ax, [bx+5CFAh]
		pop	bp
		retf
sub_52B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52BE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	ax, [bx+5CFEh]
		pop	bp
		retf
sub_52BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52CC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+5CFAh]
		mov	word_7C408, ax
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+5CFEh]
		mov	word_7C40A, ax
		pop	bp
		retf
sub_52CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52EA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+5CFAh]
		mov	word_7C40C, ax
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+5CFEh]
		mov	word_7C40E, ax
		pop	bp
		retf
sub_52EA		endp

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
Joystick_ComputeCalibrationRatio_5308		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+5CFAh]
		mov	word_7C410, ax
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+5CFEh]
		mov	word_7C412, ax
		mov	ax, word_7C410
		cmp	ax, word_7C412
		jle	short loc_532F
		jmp	short loc_5332

loc_532F:
		mov	ax, word_7C412

loc_5332:
		movsx	eax, ax
		imul	eax, eax, 0Bh
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	word_7C428, ax
		pop	bp
		retf
Joystick_ComputeCalibrationRatio_5308		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_534A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	word_7C414, bx
		mov	word_7C416, cx
		xor	ax, ax
		mov	word_7C426, ax
		mov	word_7C424, ax
		mov	ax, word_7C410
		sub	ax, word_7C408
		xor	dx, dx
		div	bx
		mov	word_7C418, ax
		mov	ax, word_7C412
		sub	ax, word_7C40A
		xor	dx, dx
		div	cx
		mov	word_7C41C, ax
		pop	bp
		retf
sub_534A		endp

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
Joystick_InterpolateCalibrationPercent_5381		proc far

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
		mov	word_7C414, si
		mov	word_7C416, di
		movsx	eax, cx
		mov	dx, word_7C410
		sub	dx, word_7C40C
		movsx	edx, dx
		imul	eax, edx
		mov	ebx, 64h
		cdq
		idiv	ebx
		mov	word_7C420, ax
		mov	ax, word_7C40C
		add	ax, word_7C420
		mov	word_7C420, ax
		movsx	eax, cx
		mov	dx, word_7C412
		sub	dx, word_7C40E
		movsx	edx, dx
		imul	eax, edx
		cdq
		idiv	ebx
		mov	word_7C422, ax
		mov	ax, word_7C40E
		add	ax, word_7C422
		mov	word_7C422, ax
		mov	ax, word_7C410
		sub	ax, word_7C420
		cwd
		idiv	si
		mov	word_7C418, ax
		mov	ax, word_7C412
		sub	ax, word_7C422
		cwd
		idiv	di
		mov	word_7C41C, ax
		movsx	eax, cx
		mov	dx, word_7C40C
		sub	dx, word_7C408
		movsx	edx, dx
		imul	eax, edx
		cdq
		idiv	ebx
		mov	word_7C424, ax
		mov	ax, word_7C40C
		sub	ax, word_7C424
		mov	word_7C424, ax
		movsx	eax, cx
		mov	dx, word_7C40E
		sub	dx, word_7C40A
		movsx	edx, dx
		imul	eax, edx
		cdq
		idiv	ebx
		mov	word_7C426, ax
		mov	ax, word_7C40E
		sub	ax, word_7C426
		mov	word_7C426, ax
		mov	ax, word_7C424
		sub	ax, word_7C408
		cwd
		idiv	si
		mov	word_7C41A, ax
		mov	ax, word_7C426
		sub	ax, word_7C40A
		cwd
		idiv	di
		mov	word_7C41E, ax
		pop	di
		pop	si
		pop	bp
		retf
Joystick_InterpolateCalibrationPercent_5381		endp

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
OptionCounter_Construct_546D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_5485
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_548B

loc_5485:
		mov	word_7C406, 0

loc_548B:
		mov	ax, dx
		pop	bp
		retf
OptionCounter_Construct_546D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_548F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_54A9
		test	dx, 1
		jz	short loc_54A9
		push	ax
		call	sub_3B2
		pop	cx

loc_54A9:
		pop	bp
		retf
sub_548F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54AB		proc far
		push	bp
		mov	bp, sp
sub_54AB		endp

; START OF FUNCTION CHUNK FOR sub_54AB
		db 0A1h
		salc
; END OF FUNCTION CHUNK FOR sub_54AB
seg006		ends
