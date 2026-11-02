seg170		segment	para public 'CODE' use16
		assume cs:seg170
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 36h, 83h, 47h, 4, 0FAh, 90h, 90h, 0E9h, 9Dh, 0FFh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43D4A		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_43D63
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_43D7A

loc_43D63:
		push	si
		call	OptionCounter_Construct_4538A
		pop	cx
		push	[bp+arg_6]
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr ConfigOption_ConstructFull_43D7F
		add	sp, 8

loc_43D7A:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_43D4A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_ConstructFull_66762 (sub_66762 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_67DEA, sub_67662 et Runtime_FatalErrorHandlerWithTag (sub_5F700, seg160) —
; finalise la construction d'une option de configuration.
; ==============================================================================================
ConfigOption_ConstructFull_43D7F		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_4DD7E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_43DD7
		cmp	[bp+arg_2], 0
		jz	short loc_43DD2
		mov	eax, [bp+arg_2]
		mov	dword_4DD7F, eax
		mov	ax, [bp+arg_6]
		mov	word_4DD83, ax
		push	0FFFFh
		call	OptionCounter_Set_453D0
		pop	cx
		push	large 14h
		push	seg seg170
		push	offset sub_43E26
		push	6D9Ch
		call	Stopwatch_RegisterTickModuleVariant_44C84
		add	sp, 0Ah
		mov	word_4DD88, ax
		cmp	word_4DD88, 0FFFFh
		jnz	short loc_43DD2
		push	53ADh
		call	Runtime_FatalErrorHandler_36797
		pop	cx

loc_43DD2:
		mov	byte_4DD7E, 1

loc_43DD7:
		pop	bp
		retf
ConfigOption_ConstructFull_43D7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43DD9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_43E22
		cmp	byte_4DD7E, 0
		jz	short loc_43E0A
		cmp	word_4DD88, 0FFFFh
		jz	short loc_43E05
		push	word_4DD88
		push	6D9Ch
		call	Stopwatch_UnregisterTickModule_44CC1
		add	sp, 4

loc_43E05:
		mov	byte_4DD7E, 0

loc_43E0A:
		push	0
		push	si
		call	sub_453AC
		add	sp, 4
		test	di, 1
		jz	short loc_43E22
		push	si
		call	sub_39C
		pop	cx

loc_43E22:
		pop	di
		pop	si
		pop	bp
		retf
sub_43DD9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43E26		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		call	Joystick_ReadButtonsWrapper_44F28
		mov	si, ax
		cmp	si, word_4DD8A
		jz	short loc_43EB8
		mov	ax, word_4DD8A
		xor	ax, si
		mov	[bp+var_2], ax
		cmp	byte_4DD8C, 0
		jnz	short loc_43E5D
		inc	byte_4DD8C
		mov	word_4F6BE, 0
		mov	byte_4F6C0, 0
		mov	byte_4F6C1, 0

loc_43E5D:
		push	6CE2h
		call	Joystick_FormatCalibrationDisplay_45120
		pop	cx
		mov	dl, 0
		mov	bl, 1
		jmp	short loc_43EA1

loc_43E6C:
		mov	al, bl
		mov	ah, 0
		test	[bp+var_2], ax
		jz	short loc_43E9D
		mov	word_4F6BE, 1
		mov	al, bl
		mov	ah, 0
		test	word_4DD8A, ax
		jz	short loc_43E8B
		mov	word_4F6BE, 2

loc_43E8B:
		mov	al, dl
		mov	ah, 0
		sar	ax, 1
		mov	byte_4F6C0, al
		mov	al, dl
		and	al, 1
		mov	byte_4F6C1, al
		jmp	short loc_43EA6

loc_43E9D:
		inc	dl
		shl	bl, 1

loc_43EA1:
		cmp	dl, 4
		jb	short loc_43E6C

loc_43EA6:
		mov	ax, word_4F790
		test	word_4F6BE, ax
		jz	short loc_43EB8
		push	6CDEh
		nop
		push	cs
		call	near ptr sub_43EBF
		pop	cx

loc_43EB8:
		mov	word_4DD8A, si
		pop	si
		leave
		retf
sub_43E26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43EBF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_4DD87
		mov	ah, 0
		cmp	ax, word_4DD83
		jnb	short loc_43F17
		mov	ax, word_4F790
		test	[si], ax
		jz	short loc_43F17
		mov	al, byte_4DD87
		inc	al
		mov	byte_4DD87, al
		mov	al, byte_4DD86
		mov	ah, 0
		imul	ax, ax, 14h
		mov	dx, word_4DD81
		push	ax
		mov	ax, word ptr dword_4DD7F
		pop	bx
		add	ax, bx
		push	dx
		push	ax
		push	ds
		push	si
		mov	cx, 14h
		call	CRT_Fmemcpy
		inc	byte_4DD86
		mov	al, byte_4DD86
		mov	ah, 0
		cmp	ax, word_4DD83
		jb	short loc_43F13
		mov	byte_4DD86, 0

loc_43F13:
		mov	al, 1
		jmp	short loc_43F19

loc_43F17:
		mov	al, 0

loc_43F19:
		pop	si
		pop	bp
		retf
sub_43EBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43F1C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		cmp	byte_4DD87, 0
		jz	short loc_43F66
		mov	al, byte_4DD87
		add	al, 0FFh
		mov	byte_4DD87, al
		push	ds
		push	bx
		mov	al, byte_4DD85
		mov	ah, 0
		imul	ax, ax, 14h
		mov	dx, word ptr dword_4DD7F
		add	dx, ax
		push	word_4DD81
		push	dx
		mov	cx, 14h
		call	CRT_Fmemcpy
		inc	byte_4DD85
		mov	al, byte_4DD85
		mov	ah, 0
		cmp	ax, word_4DD83
		jb	short loc_43F62
		mov	byte_4DD85, 0

loc_43F62:
		mov	al, 1
		jmp	short loc_43F68

loc_43F66:
		mov	al, 0

loc_43F68:
		pop	bp
		retf
sub_43F1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainTile_ConstructDescriptor_9B451 (sub_9B451 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue et construit un descripteur de tuile (TerrainTile_DescriptorConstruct).
; ==============================================================================================
TerrainTile_ConstructDescriptor_43F6A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_43F83
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_43F90

loc_43F83:
		push	si
		call	sub_44E57
		pop	cx
		mov	word_4F6BC, 0Ah

loc_43F90:
		mov	ax, si
		pop	si
		pop	bp
		retf
TerrainTile_ConstructDescriptor_43F6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43F95		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jge	short loc_43FA8
		mov	ax, dx
		neg	ax
		jmp	short loc_43FAA

loc_43FA8:
		mov	ax, dx

loc_43FAA:
		pop	bp
		retf
sub_43F95		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43FAC		proc far

var_16		= word ptr -16h
var_14		= word ptr -14h
var_E		= word ptr -0Eh
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 16h
		lea	ax, [bp+var_16]
		push	ax
		call	Joystick_FormatCalibrationDisplay_45120
		pop	cx
		mov	[bp+var_2], 0
		jmp	loc_44053

loc_43FC4:
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		shl	ax, 3
		mov	bx, [bp+var_2]
		shl	bx, 3
		lea	dx, [bp+var_16]
		add	bx, dx
		mov	dx, [bx]
		mov	bx, ax
		sub	dx, [bx+6CCCh]
		push	dx
		call	CRT_Abs16_361
		pop	cx
		mov	[bp+var_4], ax
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		shl	ax, 3
		mov	bx, [bp+var_2]
		shl	bx, 3
		lea	dx, [bp+var_14]
		add	bx, dx
		mov	dx, [bx]
		mov	bx, ax
		sub	dx, [bx+6CCEh]
		push	dx
		call	CRT_Abs16_361
		pop	cx
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		cmp	ax, word_4F6BC
		ja	short loc_44020
		mov	ax, [bp+var_6]
		cmp	ax, word_4F6BC
		jbe	short loc_44050

loc_44020:
		mov	word_4F6A8, 4
		mov	al, byte ptr [bp+var_2]
		mov	byte_4F6AA, al
		push	ds
		push	offset unk_4F6AC
		lea	ax, [bp+var_16]
		push	ss
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy
		push	ds
		push	offset unk_4F6B4
		lea	ax, [bp+var_E]
		push	ss
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy
		jmp	short loc_4405C

loc_44050:
		inc	[bp+var_2]

loc_44053:
		cmp	[bp+var_2], 2
		jge	short loc_4405C
		jmp	loc_43FC4

loc_4405C:
		cmp	word_4F6A8, 4
		jnz	short loc_44068
		mov	ax, 1
		jmp	short loc_4406A

loc_44068:
		xor	ax, ax

loc_4406A:
		leave
		retf
sub_43FAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_Dispatch_3E273 (sub_3E273 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à ConfigOption_Dispatch_66A4F (sub_66A4F de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; ConfigOption_FormatValueB_668FF et ConfigOption_ApplyAndDisplayB_6698F. Appelée par le thunk
; suivant.
; ==============================================================================================
ConfigOption_Dispatch_4406C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word_4F6A8, 0

loc_44079:
		push	6CC8h
		push	cs
		call	near ptr sub_43F1C
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44093
		test	si, 4
		jz	short loc_44099
		push	cs
		call	near ptr sub_43FAC
		jmp	short loc_44099

loc_44093:
		test	word_4F6A8, si
		jz	short loc_44079

loc_44099:
		mov	ax, 6CC8h
		pop	si
		pop	bp
		retf
ConfigOption_Dispatch_4406C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4409F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	cs
		call	near ptr ConfigOption_Dispatch_4406C
		pop	cx
		push	ds
		push	si
		push	ds
		push	offset word_4F6A8
		mov	cx, 14h
		call	CRT_Fmemcpy
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_4409F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_440C1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 6CC8h
		pop	bp
		retf
sub_440C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_440CC		proc far
		push	bp
		mov	bp, sp
		mov	word_4F6A8, 0
		mov	byte_4F6AA, 0
		mov	byte_4F6AB, 0
		pop	bp
sub_440CC		endp
seg170		ends
