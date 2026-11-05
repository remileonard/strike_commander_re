ovr189		segment	para public 'OVERLAY' use16
		assume cs:ovr189
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Joystick_GetAxisMaxWrapper_9D97C (sub_9D97C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Joystick_GetAxisMaxWrapper_8EEA0 (sub_8EEA0 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; Joystick_GetAxisMax_67BD8 (seg208, 18 lignes).
; ==============================================================================================
Joystick_GetAxisMaxWrapper_6B230		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	1
		call	sub_56BEB
		pop	cx
		mov	[bp+var_2], ax
		mov	bx, 5
		cwd
		idiv	bx
		mov	word_5B4E7, ax
		leave
		retf
Joystick_GetAxisMaxWrapper_6B230		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B24C		proc far

var_A6		= word ptr -0A6h
var_49		= dword ptr -49h
var_45		= dword ptr -45h
var_40		= word ptr -40h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0A6h
		push	si
		mov	si, [bp+arg_0]
		push	0
		call	sub_56B3C
		pop	cx
		or	al, al
		jnz	short loc_6B266
		jmp	loc_6B587

loc_6B266:
		cmp	word_603C4, 2
		jge	short loc_6B276
		cmp	[bp+arg_2], 0
		jnz	short loc_6B276
		jmp	loc_6B587

loc_6B276:
		mov	byte_5B4FE, 41h
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_6B287
		jmp	loc_6B30D

loc_6B287:
		push	ds
		push	offset aJoygDat
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_6B30D
		lea	ax, [bp+var_A6]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_A6], 9B5h
		mov	[bp+var_45], 100h
		mov	[bp+var_49], 0
		mov	[bp+var_A6], 0B2Ch
		push	1
		push	17DAh
		lea	ax, [bp+var_A6]
		push	ax
		mov	bx, [bp+var_A6]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h
		push	ss
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		push	ds
		push	offset unk_60672
		lea	ax, [bp+var_40]
		push	ss
		push	ax
		mov	cx, 22h
		call	CRT_Fmemcpy
		push	0
		lea	ax, [bp+var_A6]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		jmp	loc_6B587

loc_6B30D:
		call	Keyboard_ReportErrorIfActive_3D1AA
		cmp	byte_5F552, 2
		jnz	short loc_6B31E
		mov	ax, 1
		jmp	short loc_6B320

loc_6B31E:
		xor	ax, ax

loc_6B320:
		or	ax, ax
		jz	short loc_6B33A
		cmp	byte_5F552, 2
		jnz	short loc_6B33A
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4
		jmp	short loc_6B33A

loc_6B33A:
		mov	ax, 0C00h
		int	21h
		mov	al, byte_5E7D0
		mov	[bp+var_1], al
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, [bp+var_6]
		push	ax
		call	sub_46B83
		pop	cx
		mov	[bp+var_E], 0
		mov	[bp+var_C], 0
		mov	[bp+var_A], 13Fh
		mov	[bp+var_8], 0C7h
		mov	[bp+var_18], 0
		mov	byte ptr [bp+var_16+2], 2
		mov	byte ptr [bp+var_16+3], 0
		mov	[bp+var_12], 0
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2], dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[bp+var_18], eax
		mov	byte ptr [bp+var_16+2], 3
		mov	byte ptr [bp+var_16+3], 1
		mov	[bp+var_12], 0
		mov	[bp+var_12], 0FA00h
		lea	ax, [bp+var_E]
		push	ax
		cmp	byte ptr [bp+var_16+2], 3
		jnz	short loc_6B3FC
		push	0
		mov	al, byte ptr [bp+var_16+2]
		push	ax
		push	large [bp+var_18]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6B403

loc_6B3FC:
		mov	edx, [bp+var_16]
		mov	ax, word ptr [bp+var_18]

loc_6B403:
		push	dx
		push	ax
		push	word_5DD44
		call	sub_4AB4C
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	17E4h
		push	63DEh
		call	sub_58F31
		add	sp, 4
		push	63DEh
		call	VGA_LoadPalette
		pop	cx
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_6B593
		add	sp, 4
		or	ax, ax
		jnz	short loc_6B457
		mov	word_603C4, 0
		mov	word_603CA, 5
		mov	word_60692, 1

loc_6B457:
		mov	al, byte_5B3D8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6B46E
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4

loc_6B46E:
		cmp	byte_5F552, 2
		jnz	short loc_6B47A
		mov	ax, 1
		jmp	short loc_6B47C

loc_6B47A:
		xor	ax, ax

loc_6B47C:
		or	ax, ax
		jz	short loc_6B4C2
		cmp	byte_5F552, 2
		jnz	short loc_6B4C2
		push	5822h
		call	sub_5830
		pop	cx
		mov	[bp+var_1E], ax
		push	1
		push	5822h
		call	sub_595C
		add	sp, 4
		push	large 20000h
		push	5822h
		call	sub_5856
		add	sp, 6
		cmp	[bp+var_1E], 0
		jnz	short loc_6B4C2
		push	5822h
		call	sub_5844
		pop	cx
		jmp	short loc_6B4C2

loc_6B4C2:
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		lea	ax, [bp+var_E]
		push	ax
		cmp	byte ptr [bp+var_16+2], 3
		jnz	short loc_6B513
		push	0
		mov	al, byte ptr [bp+var_16+2]
		push	ax
		push	large [bp+var_18]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6B51A

loc_6B513:
		mov	edx, [bp+var_16]
		mov	ax, word ptr [bp+var_18]

loc_6B51A:
		push	dx
		push	ax
		push	word_5DD44
		call	sub_4A530
		add	sp, 8
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_6B540
		call	TextScrollDisplayB_ApplyHelperC_571A4

loc_6B540:
		call	Keyboard_ReportErrorIfActive_3D1C0
		cmp	byte ptr [bp+var_16+3], 0
		jz	short loc_6B569
		cmp	[bp+var_18], 0
		jz	short loc_6B569
		push	0
		mov	al, byte ptr [bp+var_16+2]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6B569

loc_6B569:
		mov	[bp+var_18], 0
		mov	byte ptr [bp+var_16+3], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_6]
		push	ax
		call	sub_46E08
		pop	cx

loc_6B587:
		push	668Ch
		call	sub_3D35E
		pop	cx
		pop	si
		leave
		retf
sub_6B24C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B593		proc far

var_13C		= word ptr -13Ch
var_DF		= dword ptr -0DFh
var_DB		= dword ptr -0DBh
var_D6		= word ptr -0D6h
var_86		= word ptr -86h
var_29		= dword ptr -29h
var_25		= dword ptr -25h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 13Ch
		push	si
		mov	ax, [bp+arg_0]
		lea	ax, [bp+var_86]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_86], 9B5h
		mov	[bp+var_25], 100h
		mov	[bp+var_29], 0
		mov	[bp+var_86], 0B2Ch
		mov	si, 2
		mov	al, byte ptr [bp+arg_2]
		add	al, 41h
		mov	byte_5B4FE, al
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+2], 2
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	ds
		push	offset aShp_5
		push	ds
		push	offset aJoycalib
		push	ds
		push	offset aFONTS
		lea	ax, [bp+var_D6]
		push	ax
		call	sub_1F0C4
		add	sp, 0Eh
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_13C], 9B5h
		mov	[bp+var_DB], 100h
		mov	[bp+var_DF], 0
		mov	[bp+var_13C], 0B2Ch
		push	1
		lea	ax, [bp+var_D6]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		mov	bx, [bp+var_13C]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2], dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[bp+var_A], eax
		mov	byte ptr [bp+var_8+2], 3
		mov	byte ptr [bp+var_8+3], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_18]
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6B6B4
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6B6BB

loc_6B6B4:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6B6BB:
		push	dx
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_527AA
		pop	cx
		push	0
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	[bp+var_B], 1
		jmp	loc_6BC23

loc_6B6EB:
		push	0
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6B70A
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6B711

loc_6B70A:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6B711:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		mov	ax, [bp+arg_2]
		imul	ax, ax, 3
		inc	ax
		push	ax
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6B74A
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6B751

loc_6B74A:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6B751:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_6B76F

loc_6B767:
		push	0
		call	sub_565FF
		pop	cx

loc_6B76F:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6B78A
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_6B767

loc_6B78A:
		call	sub_1C9E
		or	ax, ax
		jz	short loc_6B7ED
		call	sub_1A30
		cmp	ax, 1Bh
		jnz	short loc_6B7ED
		mov	[bp+var_E], si
		cmp	byte ptr [bp+var_8+3], 0
		jz	short loc_6B7C4
		cmp	[bp+var_A], 0
		jz	short loc_6B7C4
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6B7C4

loc_6B7C4:
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	0
		lea	ax, [bp+var_86]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	ax, [bp+var_E]
		jmp	loc_6BC76

loc_6B7ED:
		xor	si, si
		push	[bp+arg_2]
		call	sub_56B4C
		pop	cx
		push	[bp+arg_2]
		call	sub_56C8F
		pop	cx
		jmp	short loc_6B808

loc_6B803:
		call	sub_1A30

loc_6B808:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6B803
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jz	short loc_6B83B
		jmp	short loc_6B82B

loc_6B823:
		push	0
		call	sub_565FF
		pop	cx

loc_6B82B:
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jnz	short loc_6B823

loc_6B83B:
		mov	ax, [bp+arg_2]
		imul	ax, ax, 3
		add	ax, 2
		push	ax
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6B862
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6B869

loc_6B862:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6B869:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_6B887

loc_6B87F:
		push	0
		call	sub_565FF
		pop	cx

loc_6B887:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6B8A2
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_6B87F

loc_6B8A2:
		call	sub_1C9E
		or	ax, ax
		jz	short loc_6B905
		call	sub_1A30
		cmp	ax, 1Bh
		jnz	short loc_6B905
		mov	[bp+var_10], si
		cmp	byte ptr [bp+var_8+3], 0
		jz	short loc_6B8DC
		cmp	[bp+var_A], 0
		jz	short loc_6B8DC
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6B8DC

loc_6B8DC:
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	0
		lea	ax, [bp+var_86]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	ax, [bp+var_10]
		jmp	loc_6BC76

loc_6B905:
		push	[bp+arg_2]
		call	sub_56CE3
		pop	cx
		jmp	short loc_6B915

loc_6B910:
		call	sub_1A30

loc_6B915:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6B910
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jz	short loc_6B948
		jmp	short loc_6B938

loc_6B930:
		push	0
		call	sub_565FF
		pop	cx

loc_6B938:
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jnz	short loc_6B930

loc_6B948:
		mov	ax, [bp+arg_2]
		imul	ax, ax, 3
		add	ax, 3
		push	ax
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6B96F
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6B976

loc_6B96F:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6B976:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_6B994

loc_6B98C:
		push	0
		call	sub_565FF
		pop	cx

loc_6B994:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6B9AF
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_6B98C

loc_6B9AF:
		call	sub_1C9E
		or	ax, ax
		jz	short loc_6BA12
		call	sub_1A30
		cmp	ax, 1Bh
		jnz	short loc_6BA12
		mov	[bp+var_12], si
		cmp	byte ptr [bp+var_8+3], 0
		jz	short loc_6B9E9
		cmp	[bp+var_A], 0
		jz	short loc_6B9E9
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6B9E9

loc_6B9E9:
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	0
		lea	ax, [bp+var_86]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	ax, [bp+var_12]
		jmp	loc_6BC76

loc_6BA12:
		push	[bp+arg_2]
		call	sub_56CB9
		pop	cx
		jmp	short loc_6BA22

loc_6BA1D:
		call	sub_1A30

loc_6BA22:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6BA1D
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jz	short loc_6BA55
		jmp	short loc_6BA45

loc_6BA3D:
		push	0
		call	sub_565FF
		pop	cx

loc_6BA45:
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jnz	short loc_6BA3D

loc_6BA55:
		cmp	[bp+arg_2], 1
		jnz	short loc_6BA7F
		mov	bx, [bp+arg_2]
		imul	bx, bx, 22h
		mov	word ptr [bx+6954h], 14h
		mov	bx, [bp+arg_2]
		imul	bx, bx, 22h
		mov	word ptr [bx+695Ch], 258h
		mov	bx, [bp+arg_2]
		imul	bx, bx, 22h
		mov	word ptr [bx+6958h], 12Ch

loc_6BA7F:
		push	large 1E0020h
		push	20h
		push	[bp+arg_2]
		call	sub_56E37
		add	sp, 8
		mov	bx, [bp+arg_2]
		imul	bx, bx, 22h
		cmp	word ptr [bx+6962h], 0
		jz	short loc_6BACA
		mov	bx, [bp+arg_2]
		imul	bx, bx, 22h
		cmp	word ptr [bx+6964h], 0
		jz	short loc_6BACA
		mov	bx, [bp+arg_2]
		imul	bx, bx, 22h
		cmp	word ptr [bx+6966h], 0
		jz	short loc_6BACA
		mov	bx, [bp+arg_2]
		imul	bx, bx, 22h
		cmp	word ptr [bx+6968h], 0
		jz	short loc_6BACA
		mov	[bp+var_B], 0

loc_6BACA:
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6BB13
		push	0
		push	17DAh
		lea	ax, [bp+var_86]
		push	ax
		mov	bx, [bp+var_86]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h
		push	ds
		mov	ax, [bp+arg_2]
		imul	ax, ax, 22h
		add	ax, 6952h
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		lea	ax, [bp+var_86]
		push	ax
		call	sub_527AA
		pop	cx
		jmp	loc_6BC23

loc_6BB13:
		push	9
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6BB32
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6BB39

loc_6BB32:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6BB39:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	3E8h
		call	PC_SoundOn
		pop	cx
		push	7
		call	PIT_DelayLoop
		pop	cx
		call	sub_224B
		jmp	short loc_6BB6D

loc_6BB65:
		push	0
		call	sub_565FF
		pop	cx

loc_6BB6D:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6BB88
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_6BB65

loc_6BB88:
		call	sub_1C9E
		or	ax, ax
		jz	short loc_6BBF0
		call	sub_1A30
		cmp	ax, 1Bh
		jnz	short loc_6BBF0
		mov	[bp+var_14], si
		cmp	byte ptr [bp+var_8+3], 0
		jz	short loc_6BBC2
		cmp	[bp+var_A], 0
		jz	short loc_6BBC2
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6BBC2

loc_6BBC2:
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	0
		lea	ax, [bp+var_86]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	ax, [bp+var_14]
		jmp	loc_6BC76

loc_6BBEB:
		call	sub_1A30

loc_6BBF0:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6BBEB
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jz	short loc_6BC23
		jmp	short loc_6BC13

loc_6BC0B:
		push	0
		call	sub_565FF
		pop	cx

loc_6BC13:
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jnz	short loc_6BC0B

loc_6BC23:
		cmp	[bp+var_B], 0
		jz	short loc_6BC2C
		jmp	loc_6B6EB

loc_6BC2C:
		cmp	byte ptr [bp+var_8+3], 0
		jz	short loc_6BC50
		cmp	[bp+var_A], 0
		jz	short loc_6BC50
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6BC50

loc_6BC50:
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	0
		lea	ax, [bp+var_86]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	ax, 1

loc_6BC76:
		pop	si
		leave
		retf
sub_6B593		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6BC79		proc far

var_134		= word ptr -134h
var_D7		= dword ptr -0D7h
var_D3		= dword ptr -0D3h
var_CE		= word ptr -0CEh
var_7E		= word ptr -7Eh
var_21		= dword ptr -21h
var_1D		= dword ptr -1Dh
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 134h
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		lea	ax, [bp+var_7E]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_7E], 9B5h
		mov	[bp+var_1D], 100h
		mov	[bp+var_21], 0
		mov	[bp+var_7E], 0B2Ch
		mov	byte_5B4FD, 52h
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+2], 2
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	ds
		push	offset aShp_6
		push	ds
		push	offset aJoycalib_1
		push	ds
		push	offset aFONTS
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_1F0C4
		add	sp, 0Eh
		lea	ax, [bp+var_134]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_134], 9B5h
		mov	[bp+var_D3], 100h
		mov	[bp+var_D7], 0
		mov	[bp+var_134], 0B2Ch
		push	1
		lea	ax, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_134]
		push	ax
		mov	bx, [bp+var_134]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_134]
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		mov	eax, [bp+var_18]
		mov	[bp+var_A], eax
		mov	byte ptr [bp+var_8+2], 3
		mov	byte ptr [bp+var_8+3], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_10]
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6BD94
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6BD9B

loc_6BD94:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6BD9B:
		push	dx
		push	ax
		lea	ax, [bp+var_134]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		lea	ax, [bp+var_134]
		push	ax
		call	sub_527AA
		pop	cx
		push	0
		lea	ax, [bp+var_134]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	[bp+var_B], 1
		jmp	loc_6C261

loc_6BDCB:
		push	si
		call	sub_56B4C
		pop	cx
		push	0
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6BDF1
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6BDF8

loc_6BDF1:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6BDF8:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		mov	ax, si
		imul	ax, ax, 3
		inc	ax
		push	ax
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6BE30
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6BE37

loc_6BE30:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6BE37:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_6BE55

loc_6BE4D:
		push	0
		call	sub_565FF
		pop	cx

loc_6BE55:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6BE70
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_6BE4D

loc_6BE70:
		call	sub_1C9E
		or	ax, ax
		jz	short loc_6BEBA
		call	sub_1A30
		cmp	ax, 1Bh
		jnz	short loc_6BEBA
		cmp	byte ptr [bp+var_8+3], 0
		jz	short loc_6BE93
		cmp	[bp+var_A], 0
		jz	short loc_6BE93
		jmp	loc_6C20E

loc_6BE93:
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	0
		lea	ax, [bp+var_7E]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		xor	ax, ax
		jmp	loc_6C2B0

loc_6BEBA:
		push	si
		call	sub_56C5D
		pop	cx
		jmp	short loc_6BEC8

loc_6BEC3:
		call	sub_1A30

loc_6BEC8:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6BEC3
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jz	short loc_6BEFB
		jmp	short loc_6BEEB

loc_6BEE3:
		push	0
		call	sub_565FF
		pop	cx

loc_6BEEB:
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jnz	short loc_6BEE3

loc_6BEFB:
		mov	ax, si
		imul	ax, ax, 3
		add	ax, 2
		push	ax
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6BF21
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6BF28

loc_6BF21:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6BF28:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_6BF46

loc_6BF3E:
		push	0
		call	sub_565FF
		pop	cx

loc_6BF46:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6BF61
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_6BF3E

loc_6BF61:
		call	sub_1C9E
		or	ax, ax
		jz	short loc_6BF8D
		call	sub_1A30
		cmp	ax, 1Bh
		jnz	short loc_6BF8D
		cmp	byte ptr [bp+var_8+3], 0
		jnz	short loc_6BF7D
		jmp	loc_6BE93

loc_6BF7D:
		cmp	[bp+var_A], 0
		jnz	short loc_6BF87
		jmp	loc_6BE93

loc_6BF87:
		jmp	loc_6C20E
		jmp	loc_6BE93

loc_6BF8D:
		push	si
		call	sub_56C76
		pop	cx
		jmp	short loc_6BF9B

loc_6BF96:
		call	sub_1A30

loc_6BF9B:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6BF96
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jz	short loc_6BFCE
		jmp	short loc_6BFBE

loc_6BFB6:
		push	0
		call	sub_565FF
		pop	cx

loc_6BFBE:
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jnz	short loc_6BFB6

loc_6BFCE:
		mov	ax, si
		imul	ax, ax, 3
		add	ax, 3
		push	ax
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6BFF4
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6BFFB

loc_6BFF4:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6BFFB:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_6C019

loc_6C011:
		push	0
		call	sub_565FF
		pop	cx

loc_6C019:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6C034
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_6C011

loc_6C034:
		call	sub_1C9E
		or	ax, ax
		jz	short loc_6C060
		call	sub_1A30
		cmp	ax, 1Bh
		jnz	short loc_6C060
		cmp	byte ptr [bp+var_8+3], 0
		jnz	short loc_6C050
		jmp	loc_6BE93

loc_6C050:
		cmp	[bp+var_A], 0
		jnz	short loc_6C05A
		jmp	loc_6BE93

loc_6C05A:
		jmp	loc_6C20E
		jmp	loc_6BE93

loc_6C060:
		push	si
		call	sub_56C44
		pop	cx
		jmp	short loc_6C06E

loc_6C069:
		call	sub_1A30

loc_6C06E:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6C069
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jz	short loc_6C0A1
		jmp	short loc_6C091

loc_6C089:
		push	0
		call	sub_565FF
		pop	cx

loc_6C091:
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jnz	short loc_6C089

loc_6C0A1:
		mov	bx, si
		imul	bx, bx, 22h
		mov	word ptr [bx+6954h], 14h
		mov	bx, si
		imul	bx, bx, 22h
		mov	word ptr [bx+695Ch], 258h
		mov	bx, si
		imul	bx, bx, 22h
		mov	word ptr [bx+6958h], 12Ch
		push	large 1E0020h
		push	20h
		push	si
		call	sub_56E37
		add	sp, 8
		mov	bx, si
		imul	bx, bx, 22h
		cmp	word ptr [bx+6962h], 0
		jz	short loc_6C0EF
		mov	bx, si
		imul	bx, bx, 22h
		cmp	word ptr [bx+6964h], 0
		jz	short loc_6C0EF
		mov	[bp+var_B], 0

loc_6C0EF:
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+695Ah]
		mov	bx, si
		imul	bx, bx, 22h
		cmp	ax, [bx+6952h]
		jle	short loc_6C10A
		mov	bx, si
		imul	bx, bx, 22h
		jmp	short loc_6C113

loc_6C10A:
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+6952h]

loc_6C113:
		movsx	eax, ax
		imul	eax, eax, 0Bh
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	bx, si
		imul	bx, bx, 22h
		mov	[bx+6972h], ax
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6C173
		push	0
		push	17DAh
		lea	ax, [bp+var_7E]
		push	ax
		mov	bx, [bp+var_7E]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h
		push	ds
		mov	ax, si
		imul	ax, ax, 22h
		add	ax, 6952h
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		lea	ax, [bp+var_7E]
		push	ax
		call	sub_527AA
		pop	cx
		jmp	loc_6C261

loc_6C173:
		push	9
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6C192
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6C199

loc_6C192:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6C199:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	3E8h
		call	PC_SoundOn
		pop	cx
		push	7
		call	PIT_DelayLoop
		pop	cx
		call	sub_224B
		jmp	short loc_6C1CD

loc_6C1C5:
		push	0
		call	sub_565FF
		pop	cx

loc_6C1CD:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6C1E8
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_6C1C5

loc_6C1E8:
		call	sub_1C9E
		or	ax, ax
		jz	short loc_6C22E
		call	sub_1A30
		cmp	ax, 1Bh
		jnz	short loc_6C22E
		cmp	byte ptr [bp+var_8+3], 0
		jnz	short loc_6C204
		jmp	loc_6BE93

loc_6C204:
		cmp	[bp+var_A], 0
		jnz	short loc_6C20E
		jmp	loc_6BE93

loc_6C20E:
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	loc_6BE93
		jmp	loc_6BE93

loc_6C229:
		call	sub_1A30

loc_6C22E:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6C229
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jz	short loc_6C261
		jmp	short loc_6C251

loc_6C249:
		push	0
		call	sub_565FF
		pop	cx

loc_6C251:
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jnz	short loc_6C249

loc_6C261:
		cmp	[bp+var_B], 0
		jz	short loc_6C26A
		jmp	loc_6BDCB

loc_6C26A:
		cmp	byte ptr [bp+var_8+3], 0
		jz	short loc_6C28E
		cmp	[bp+var_A], 0
		jz	short loc_6C28E
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6C28E

loc_6C28E:
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	0
		lea	ax, [bp+var_7E]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4

loc_6C2B0:
		pop	si
		leave
		retf
sub_6BC79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C2B3		proc far

var_134		= word ptr -134h
var_D7		= dword ptr -0D7h
var_D3		= dword ptr -0D3h
var_CE		= word ptr -0CEh
var_7E		= word ptr -7Eh
var_21		= dword ptr -21h
var_1D		= dword ptr -1Dh
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 134h
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		lea	ax, [bp+var_7E]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_7E], 9B5h
		mov	[bp+var_1D], 100h
		mov	[bp+var_21], 0
		mov	[bp+var_7E], 0B2Ch
		mov	byte_5B4FD, 54h
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+2], 2
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	ds
		push	offset aShp_7
		push	ds
		push	offset aJoycalib_2
		push	ds
		push	offset aFONTS
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_1F0C4
		add	sp, 0Eh
		lea	ax, [bp+var_134]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_134], 9B5h
		mov	[bp+var_D3], 100h
		mov	[bp+var_D7], 0
		mov	[bp+var_134], 0B2Ch
		push	1
		lea	ax, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_134]
		push	ax
		mov	bx, [bp+var_134]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_134]
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		mov	eax, [bp+var_18]
		mov	[bp+var_A], eax
		mov	byte ptr [bp+var_8+2], 3
		mov	byte ptr [bp+var_8+3], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_10]
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6C3CE
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6C3D5

loc_6C3CE:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6C3D5:
		push	dx
		push	ax
		lea	ax, [bp+var_134]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		lea	ax, [bp+var_134]
		push	ax
		call	sub_527AA
		pop	cx
		push	0
		lea	ax, [bp+var_134]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	[bp+var_B], 1
		jmp	loc_6C7BC

loc_6C405:
		push	si
		call	sub_56B4C
		pop	cx
		push	0
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6C42B
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6C432

loc_6C42B:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6C432:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		mov	ax, si
		imul	ax, ax, 3
		add	ax, 4
		push	ax
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6C46C
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6C473

loc_6C46C:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6C473:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_6C491

loc_6C489:
		push	0
		call	sub_565FF
		pop	cx

loc_6C491:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6C4AC
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_6C489

loc_6C4AC:
		call	sub_1C9E
		or	ax, ax
		jz	short loc_6C4F6
		call	sub_1A30
		cmp	ax, 1Bh
		jnz	short loc_6C4F6
		cmp	byte ptr [bp+var_8+3], 0
		jz	short loc_6C4CF
		cmp	[bp+var_A], 0
		jz	short loc_6C4CF
		jmp	loc_6C769

loc_6C4CF:
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	0
		lea	ax, [bp+var_7E]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		xor	ax, ax
		jmp	loc_6C80E

loc_6C4F6:
		push	si
		call	sub_56BF9
		pop	cx
		jmp	short loc_6C504

loc_6C4FF:
		call	sub_1A30

loc_6C504:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6C4FF
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jz	short loc_6C537
		jmp	short loc_6C527

loc_6C51F:
		push	0
		call	sub_565FF
		pop	cx

loc_6C527:
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jnz	short loc_6C51F

loc_6C537:
		mov	ax, si
		imul	ax, ax, 3
		add	ax, 5
		push	ax
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6C55D
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6C564

loc_6C55D:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6C564:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_6C582

loc_6C57A:
		push	0
		call	sub_565FF
		pop	cx

loc_6C582:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6C59D
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_6C57A

loc_6C59D:
		call	sub_1C9E
		or	ax, ax
		jz	short loc_6C5C9
		call	sub_1A30
		cmp	ax, 1Bh
		jnz	short loc_6C5C9
		cmp	byte ptr [bp+var_8+3], 0
		jnz	short loc_6C5B9
		jmp	loc_6C4CF

loc_6C5B9:
		cmp	[bp+var_A], 0
		jnz	short loc_6C5C3
		jmp	loc_6C4CF

loc_6C5C3:
		jmp	loc_6C769
		jmp	loc_6C4CF

loc_6C5C9:
		push	si
		call	sub_56C12
		pop	cx
		jmp	short loc_6C5D7

loc_6C5D2:
		call	sub_1A30

loc_6C5D7:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6C5D2
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jz	short loc_6C60A
		jmp	short loc_6C5FA

loc_6C5F2:
		push	0
		call	sub_565FF
		pop	cx

loc_6C5FA:
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jnz	short loc_6C5F2

loc_6C60A:
		mov	bx, si
		imul	bx, bx, 22h
		mov	word ptr [bx+6952h], 14h
		mov	bx, si
		imul	bx, bx, 22h
		mov	word ptr [bx+695Ah], 258h
		mov	bx, si
		imul	bx, bx, 22h
		mov	word ptr [bx+6956h], 12Ch
		push	large 200020h
		push	si
		call	sub_56DC1
		add	sp, 6
		mov	bx, si
		imul	bx, bx, 22h
		cmp	word ptr [bx+6966h], 0
		jz	short loc_6C64A
		mov	[bp+var_B], 0

loc_6C64A:
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+695Ch]
		mov	bx, si
		imul	bx, bx, 22h
		cmp	ax, [bx+6954h]
		jle	short loc_6C665
		mov	bx, si
		imul	bx, bx, 22h
		jmp	short loc_6C66E

loc_6C665:
		mov	bx, si
		imul	bx, bx, 22h
		mov	ax, [bx+6954h]

loc_6C66E:
		movsx	eax, ax
		imul	eax, eax, 0Bh
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	bx, si
		imul	bx, bx, 22h
		mov	[bx+6972h], ax
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6C6CE
		push	0
		push	17DAh
		lea	ax, [bp+var_7E]
		push	ax
		mov	bx, [bp+var_7E]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h
		push	ds
		mov	ax, si
		imul	ax, ax, 22h
		add	ax, 6952h
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		lea	ax, [bp+var_7E]
		push	ax
		call	sub_527AA
		pop	cx
		jmp	loc_6C7BC

loc_6C6CE:
		push	9
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_6C6ED
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6C6F4

loc_6C6ED:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_6C6F4:
		push	dx
		push	ax
		push	large 9B0009h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	3E8h
		call	PC_SoundOn
		pop	cx
		push	7
		call	PIT_DelayLoop
		pop	cx
		call	sub_224B
		jmp	short loc_6C728

loc_6C720:
		push	0
		call	sub_565FF
		pop	cx

loc_6C728:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6C743
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_6C720

loc_6C743:
		call	sub_1C9E
		or	ax, ax
		jz	short loc_6C789
		call	sub_1A30
		cmp	ax, 1Bh
		jnz	short loc_6C789
		cmp	byte ptr [bp+var_8+3], 0
		jnz	short loc_6C75F
		jmp	loc_6C4CF

loc_6C75F:
		cmp	[bp+var_A], 0
		jnz	short loc_6C769
		jmp	loc_6C4CF

loc_6C769:
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	loc_6C4CF
		jmp	loc_6C4CF

loc_6C784:
		call	sub_1A30

loc_6C789:
		call	sub_1C9E
		or	ax, ax
		jnz	short loc_6C784
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jz	short loc_6C7BC
		jmp	short loc_6C7AC

loc_6C7A4:
		push	0
		call	sub_565FF
		pop	cx

loc_6C7AC:
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		or	al, al
		jnz	short loc_6C7A4

loc_6C7BC:
		cmp	[bp+var_B], 0
		jz	short loc_6C7C5
		jmp	loc_6C405

loc_6C7C5:
		cmp	byte ptr [bp+var_8+3], 0
		jz	short loc_6C7E9
		cmp	[bp+var_A], 0
		jz	short loc_6C7E9
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6C7E9

loc_6C7E9:
		mov	[bp+var_A], 0
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		push	0
		lea	ax, [bp+var_7E]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	ax, 1

loc_6C80E:
		pop	si
		leave
		retf
sub_6C2B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C811		proc far

var_D8		= word ptr -0D8h
var_7B		= dword ptr -7Bh
var_77		= dword ptr -77h
var_72		= word ptr -72h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0D8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_5B4D8
		mov	ah, 0
		or	ax, ax
		jz	short loc_6C829
		jmp	loc_6CA98

loc_6C829:
		push	693Ch
		call	Stopwatch_RegisterTickModule_5618C
		pop	cx
		mov	byte_5FDDF, 0
		mov	byte_5FDDE, 0
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6C855
		push	ax
		call	TextScrollDisplay_Construct_559AD
		pop	cx
		mov	ax, di
		jmp	short loc_6C857

loc_6C855:
		mov	ax, di

loc_6C857:
		mov	[si+14h], ax
		push	50h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+16h], ax
		push	14h
		push	ds
		push	word ptr [si+16h]
		push	0
		call	Keyboard_RegisterOrInitHandlerTable_557AD
		add	sp, 8
		mov	[si+18h], ax
		push	0
		call	sub_563B0
		pop	cx
		mov	[si+1Ah], ax
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6C89C
		push	ax
		call	TextScrollDisplay_Construct_55DE2
		pop	cx
		mov	ax, di
		jmp	short loc_6C89E

loc_6C89C:
		mov	ax, di

loc_6C89E:
		mov	[si+20h], ax
		push	seg stub189
		push	offset sub_58BB0
		push	large 10014h
		push	large 70000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+1Ch], ax
		push	14h
		push	word ptr [si+1Ch]
		push	0
		call	TextScroll_Construct_55B3A
		add	sp, 6
		mov	[si+1Eh], ax
		push	ds
		push	offset aShp_8
		push	ds
		push	offset aMouse
		push	large 0
		lea	ax, [bp+var_72]
		push	ax
		call	sub_1F0C4
		add	sp, 0Eh
		lea	ax, [bp+var_D8]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_D8], 9B5h
		mov	[bp+var_77], 100h
		mov	[bp+var_7B], 0
		mov	[bp+var_D8], 0B2Ch
		push	1
		lea	ax, [bp+var_72]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		mov	bx, [bp+var_D8]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_D8]
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		push	1
		push	8
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		push	large 0FFFFFFFFh
		push	large [bp+var_8]
		push	dx
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		mov	[si], eax
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		cmp	[bp+var_4], 0
		jnz	short loc_6C98A
		jmp	loc_6CA1F

loc_6C98A:
		xor	ax, ax
		mov	[bp+var_10], ax
		mov	[bp+var_E], ax
		push	large [bp+var_4]
		call	sub_4A3E2
		mov	[bp+var_1A], ax
		xor	di, di
		jmp	short loc_6C9D3

loc_6C9A2:
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	large 0
		push	large [bp+var_4]
		push	di
		call	sub_47C50
		mov	dx, [bp+var_14]
		sub	dx, [bp+var_18]
		inc	dx
		cmp	dx, [bp+var_E]
		jle	short loc_6C9C3
		mov	[bp+var_E], dx

loc_6C9C3:
		mov	dx, [bp+var_12]
		sub	dx, [bp+var_16]
		inc	dx
		cmp	dx, [bp+var_10]
		jle	short loc_6C9D2
		mov	[bp+var_10], dx

loc_6C9D2:
		inc	di

loc_6C9D3:
		cmp	di, [bp+var_1A]
		jl	short loc_6C9A2
		mov	ax, [bp+var_E]
		imul	[bp+var_10]
		movsx	eax, ax
		mov	[bp+var_1E], eax
		push	1
		push	8
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_22+2], dx
		mov	word ptr [bp+var_22], ax
		mov	eax, [bp+var_22]
		mov	[si+0Ah], eax
		mov	byte ptr [si+0Eh], 2
		mov	byte ptr [si+0Fh], 1
		mov	dword ptr [si+10h], 0
		mov	eax, [bp+var_1E]
		mov	[si+10h], eax

loc_6CA1F:
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	si
		call	UIScreen_SetWidgetValue_5718E
		add	sp, 4
		push	0
		lea	ax, [bp+var_D8]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		push	60BCh
		call	TextScrollDisplayB_InitAndRegister_5709C
		pop	cx
		push	0
		push	word_5DD44
		call	TextScrollDisplayB_ApplyHelperA_57104
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_571A4
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	word ptr [bp+var_4+2], 0
		jmp	short loc_6CA88

loc_6CA65:
		mov	al, byte ptr [bp+var_4+2]
		push	ax
		call	sub_56B3C
		pop	cx
		or	al, al
		jz	short loc_6CA7D
		mov	bx, word ptr [bp+var_4+2]
		mov	byte ptr [bx+60C2h], 1
		jmp	short loc_6CA85

loc_6CA7D:
		mov	bx, word ptr [bp+var_4+2]
		mov	byte ptr [bx+60C2h], 0

loc_6CA85:
		inc	word ptr [bp+var_4+2]

loc_6CA88:
		cmp	word ptr [bp+var_4+2], 2
		jl	short loc_6CA65
		mov	byte_5B4D8, 1
		call	Mouse_InitAndRead

loc_6CA98:
		pop	di
		pop	si
		leave
		retf
sub_6C811		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; InputSystem_ReleaseAll_9DC31 (sub_9DC31 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 23 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; InputSystem_ReleaseAll_8F5E0 (sub_8F5E0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine ResourceHandle_IsValid_6755B
; (seg205), TextScrollDisplay_Destruct_6728A (seg206) — nettoyage symétrique de
; InputSystem_InitAll_8F47A.
; ==============================================================================================
InputSystem_ReleaseAll_6CA9C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_5B4D8, 0
		jnz	short loc_6CAAD
		jmp	loc_6CB57

loc_6CAAD:
		push	word ptr [si+1Ch]
		call	sub_33B
		pop	cx
		mov	word ptr [si+1Ch], 0
		cmp	word ptr [si+1Eh], 0
		jz	short loc_6CAD5
		push	word ptr [si+1Eh]
		call	sub_560D6
		pop	cx
		push	word ptr [si+1Eh]
		call	sub_33B
		pop	cx
		jmp	short loc_6CAD5

loc_6CAD5:
		mov	word ptr [si+1Eh], 0
		cmp	word ptr [si+20h], 0
		jz	short loc_6CAF8
		push	0
		push	word ptr [si+20h]
		call	TextScrollDisplay_Destruct_55E05
		add	sp, 4
		push	word ptr [si+20h]
		call	sub_33B
		pop	cx
		jmp	short loc_6CAF8

loc_6CAF8:
		mov	word ptr [si+20h], 0
		push	3
		push	word ptr [si+1Ah]
		call	sub_5649A
		add	sp, 4
		mov	word ptr [si+1Ah], 0
		push	3
		push	word ptr [si+18h]
		call	Keyboard_UnregisterHandlerTable_55855
		add	sp, 4
		mov	word ptr [si+18h], 0
		push	word ptr [si+16h]
		call	sub_33B
		pop	cx
		mov	word ptr [si+16h], 0
		cmp	word ptr [si+14h], 0
		jz	short loc_6CB4D
		push	0
		push	word ptr [si+14h]
		call	InputBinding_Destruct_559D0
		add	sp, 4
		push	word ptr [si+14h]
		call	sub_33B
		pop	cx
		jmp	short loc_6CB4D

loc_6CB4D:
		mov	word ptr [si+14h], 0
		mov	byte_5B4D8, 0

loc_6CB57:
		pop	si
		pop	bp
		retf
InputSystem_ReleaseAll_6CA9C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6CB5A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_6CB6C
		jmp	loc_6CBEC

loc_6CB6C:
		push	si
		push	cs
		call	near ptr InputSystem_ReleaseAll_6CA9C
		pop	cx
		cmp	byte ptr [si+0Fh], 0
		jz	short loc_6CB98
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_6CB98
		push	0
		mov	al, [si+0Eh]
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6CB98

loc_6CB98:
		mov	dword ptr [si+0Ah], 0
		mov	byte ptr [si+0Fh], 0
		mov	dword ptr [si+10h], 0
		cmp	byte ptr [si+5], 0
		jz	short loc_6CBCC
		cmp	dword ptr [si], 0
		jz	short loc_6CBCC
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6CBCC

loc_6CBCC:
		mov	dword ptr [si], 0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_6CBEC
		push	si
		call	sub_33B
		pop	cx

loc_6CBEC:
		pop	di
		pop	si
		pop	bp
		retf
sub_6CB5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; InputSystem_Allocate_9DD85 (sub_9DD85 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à InputSystem_Allocate_8F6F7 (sub_8F6F7 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (CRT_Malloc16_Retry, 28
; lignes).
; ==============================================================================================
InputSystem_Allocate_6CBF0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6CC09
		push	7
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6CC11

loc_6CC09:
		mov	ax, si
		add	ax, 6
		mov	byte ptr [si], 0

loc_6CC11:
		mov	ax, si
		pop	si
		pop	bp
		retf
InputSystem_Allocate_6CBF0		endp
ovr189		ends
