seg210		segment	para public 'CODE' use16
		assume cs:seg210
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 36h, 83h, 47h, 4, 0FAh, 90h, 90h, 0E9h, 9Dh, 0FFh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E8DA		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6E8F3
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6E90A

loc_6E8F3:
		push	si
		call	OptionCounter_Construct_546D
		pop	cx
		push	[bp+arg_6]
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr ConfigOption_ConstructFull_6E90F
		add	sp, 8

loc_6E90A:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6E8DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_ConstructFull_66762 (sub_66762 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_67DEA, sub_67662 et Runtime_FatalErrorHandlerWithTag (sub_5F700, seg160) —
; finalise la construction d'une option de configuration.
; ==============================================================================================
ConfigOption_ConstructFull_6E90F		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_7B206
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E967
		cmp	[bp+arg_2], 0
		jz	short loc_6E962
		mov	eax, [bp+arg_2]
		mov	dword_7B207, eax
		mov	ax, [bp+arg_6]
		mov	word_7B20B, ax
		push	0FFFFh
		call	sub_54B3
		pop	cx
		push	large 14h
		push	seg seg210
		push	offset sub_6E9B6
		push	6C8Eh
		call	Stopwatch_RegisterTickModuleVariant_6F7A1
		add	sp, 0Ah
		mov	word_7B210, ax
		cmp	word_7B210, 0FFFFh
		jnz	short loc_6E962
		push	4AE5h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_6E962:
		mov	byte_7B206, 1

loc_6E967:
		pop	bp
		retf
ConfigOption_ConstructFull_6E90F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E969		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6E9B2
		cmp	byte_7B206, 0
		jz	short loc_6E99A
		cmp	word_7B210, 0FFFFh
		jz	short loc_6E995
		push	word_7B210
		push	6C8Eh
		call	Stopwatch_UnregisterTickModule_6F7DE
		add	sp, 4

loc_6E995:
		mov	byte_7B206, 0

loc_6E99A:
		push	0
		push	si
		call	sub_548F
		add	sp, 4
		test	di, 1
		jz	short loc_6E9B2
		push	si
		call	sub_3B2
		pop	cx

loc_6E9B2:
		pop	di
		pop	si
		pop	bp
		retf
sub_6E969		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E9B6		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		call	Joystick_ReadButtonsWrapper_500B
		mov	si, ax
		cmp	si, word_7B212
		jz	short loc_6EA48
		mov	ax, word_7B212
		xor	ax, si
		mov	[bp+var_2], ax
		cmp	byte_7B214, 0
		jnz	short loc_6E9ED
		inc	byte_7B214
		mov	word_7D2FC, 0
		mov	byte_7D2FE, 0
		mov	byte_7D2FF, 0

loc_6E9ED:
		push	6BD0h
		call	Joystick_FormatCalibrationDisplay_5203
		pop	cx
		mov	dl, 0
		mov	bl, 1
		jmp	short loc_6EA31

loc_6E9FC:
		mov	al, bl
		mov	ah, 0
		test	[bp+var_2], ax
		jz	short loc_6EA2D
		mov	word_7D2FC, 1
		mov	al, bl
		mov	ah, 0
		test	word_7B212, ax
		jz	short loc_6EA1B
		mov	word_7D2FC, 2

loc_6EA1B:
		mov	al, dl
		mov	ah, 0
		sar	ax, 1
		mov	byte_7D2FE, al
		mov	al, dl
		and	al, 1
		mov	byte_7D2FF, al
		jmp	short loc_6EA36

loc_6EA2D:
		inc	dl
		shl	bl, 1

loc_6EA31:
		cmp	dl, 4
		jb	short loc_6E9FC

loc_6EA36:
		mov	ax, word_7C406
		test	word_7D2FC, ax
		jz	short loc_6EA48
		push	6BCCh
		nop
		push	cs
		call	near ptr sub_6EA4F
		pop	cx

loc_6EA48:
		mov	word_7B212, si
		pop	si
		leave
		retf
sub_6E9B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EA4F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_7B20F
		mov	ah, 0
		cmp	ax, word_7B20B
		jnb	short loc_6EAA7
		mov	ax, word_7C406
		test	[si], ax
		jz	short loc_6EAA7
		mov	al, byte_7B20F
		inc	al
		mov	byte_7B20F, al
		mov	al, byte_7B20E
		mov	ah, 0
		imul	ax, ax, 14h
		mov	dx, word_7B209
		push	ax
		mov	ax, word ptr dword_7B207
		pop	bx
		add	ax, bx
		push	dx
		push	ax
		push	ds
		push	si
		mov	cx, 14h
		call	CRT_Fmemcpy
		inc	byte_7B20E
		mov	al, byte_7B20E
		mov	ah, 0
		cmp	ax, word_7B20B
		jb	short loc_6EAA3
		mov	byte_7B20E, 0

loc_6EAA3:
		mov	al, 1
		jmp	short loc_6EAA9

loc_6EAA7:
		mov	al, 0

loc_6EAA9:
		pop	si
		pop	bp
		retf
sub_6EA4F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EAAC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		cmp	byte_7B20F, 0
		jz	short loc_6EAF6
		mov	al, byte_7B20F
		add	al, 0FFh
		mov	byte_7B20F, al
		push	ds
		push	bx
		mov	al, byte_7B20D
		mov	ah, 0
		imul	ax, ax, 14h
		mov	dx, word ptr dword_7B207
		add	dx, ax
		push	word_7B209
		push	dx
		mov	cx, 14h
		call	CRT_Fmemcpy
		inc	byte_7B20D
		mov	al, byte_7B20D
		mov	ah, 0
		cmp	ax, word_7B20B
		jb	short loc_6EAF2
		mov	byte_7B20D, 0

loc_6EAF2:
		mov	al, 1
		jmp	short loc_6EAF8

loc_6EAF6:
		mov	al, 0

loc_6EAF8:
		pop	bp
		retf
sub_6EAAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainTile_ConstructDescriptor_9B451 (sub_9B451 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue et construit un descripteur de tuile (TerrainTile_DescriptorConstruct).
; ==============================================================================================
TerrainTile_ConstructDescriptor_6EAFA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6EB13
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6EB20

loc_6EB13:
		push	si
		call	sub_4EB1
		pop	cx
		mov	word_7D2FA, 0Ah

loc_6EB20:
		mov	ax, si
		pop	si
		pop	bp
		retf
TerrainTile_ConstructDescriptor_6EAFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EB25		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jge	short loc_6EB38
		mov	ax, dx
		neg	ax
		jmp	short loc_6EB3A

loc_6EB38:
		mov	ax, dx

loc_6EB3A:
		pop	bp
		retf
sub_6EB25		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EB3C		proc far

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
		call	Joystick_FormatCalibrationDisplay_5203
		pop	cx
		mov	[bp+var_2], 0
		jmp	loc_6EBE3

loc_6EB54:
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		shl	ax, 3
		mov	bx, [bp+var_2]
		shl	bx, 3
		lea	dx, [bp+var_16]
		add	bx, dx
		mov	dx, [bx]
		mov	bx, ax
		sub	dx, [bx+6BBAh]
		push	dx
		call	CRT_Abs16_377
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
		sub	dx, [bx+6BBCh]
		push	dx
		call	CRT_Abs16_377
		pop	cx
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		cmp	ax, word_7D2FA
		ja	short loc_6EBB0
		mov	ax, [bp+var_6]
		cmp	ax, word_7D2FA
		jbe	short loc_6EBE0

loc_6EBB0:
		mov	word_7D2E6, 4
		mov	al, byte ptr [bp+var_2]
		mov	byte_7D2E8, al
		push	ds
		push	offset unk_7D2EA
		lea	ax, [bp+var_16]
		push	ss
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy
		push	ds
		push	offset unk_7D2F2
		lea	ax, [bp+var_E]
		push	ss
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy
		jmp	short loc_6EBEC

loc_6EBE0:
		inc	[bp+var_2]

loc_6EBE3:
		cmp	[bp+var_2], 2
		jge	short loc_6EBEC
		jmp	loc_6EB54

loc_6EBEC:
		cmp	word_7D2E6, 4
		jnz	short loc_6EBF8
		mov	ax, 1
		jmp	short loc_6EBFA

loc_6EBF8:
		xor	ax, ax

loc_6EBFA:
		leave
		retf
sub_6EB3C		endp

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
ConfigOption_Dispatch_6EBFC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word_7D2E6, 0

loc_6EC09:
		push	6BB6h
		push	cs
		call	near ptr sub_6EAAC
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6EC23
		test	si, 4
		jz	short loc_6EC29
		push	cs
		call	near ptr sub_6EB3C
		jmp	short loc_6EC29

loc_6EC23:
		test	word_7D2E6, si
		jz	short loc_6EC09

loc_6EC29:
		mov	ax, 6BB6h
		pop	si
		pop	bp
		retf
ConfigOption_Dispatch_6EBFC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EC2F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	cs
		call	near ptr ConfigOption_Dispatch_6EBFC
		pop	cx
		push	ds
		push	si
		push	ds
		push	offset word_7D2E6
		mov	cx, 14h
		call	CRT_Fmemcpy
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6EC2F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EC51		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 6BB6h
		pop	bp
		retf
sub_6EC51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EC5C		proc far
		push	bp
		mov	bp, sp
		mov	word_7D2E6, 0
		mov	byte_7D2E8, 0
		mov	byte_7D2E9, 0
		pop	bp
sub_6EC5C		endp
seg210		ends
