ovr260		segment	para public 'OVERLAY' use16
		assume cs:ovr260
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B670		proc far
		push	bp
		mov	bp, sp
		push	6343h
		call	Input_NotifyModeChange
		pop	cx
		mov	al, byte_7CAC3
		mov	ah, 0
		mov	dx, ax
		cmp	dx, 1
		jz	short loc_9B68D
		cmp	dx, 39h
		jnz	short loc_9B691

loc_9B68D:
		mov	al, 1
		jmp	short loc_9B693

loc_9B691:
		mov	al, 0

loc_9B693:
		pop	bp
		retf
sub_9B670		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B695		proc far

var_52		= word ptr -52h
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	[bp+var_1], 0
		jmp	loc_9B736

loc_9B6A4:
		push	cs
		call	near ptr sub_9B670
		or	al, al
		jz	short loc_9B6B3
		mov	[bp+var_1], 1
		jmp	loc_9B7DE

loc_9B6B3:
		call	sub_22DDB
		push	0
		call	sub_52B0
		pop	cx
		mov	si, ax
		push	0
		call	sub_52BE
		pop	cx
		mov	di, ax
		push	0
		push	large 6400BEh
		push	large 5A005Bh
		push	word_7AF7C
		call	sub_69728
		add	sp, 0Ch
		push	si
		push	0ED3h
		lea	ax, [bp+var_52]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_52]
		push	ax
		push	large 5A005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	di
		push	0ED7h
		lea	ax, [bp+var_52]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_52]
		push	ax
		push	large 5A0083h
		call	sub_74BA9
		add	sp, 0Ah

loc_9B736:
		push	3
		push	0
		call	sub_5235
		add	sp, 4
		or	al, al
		jz	short loc_9B749
		jmp	loc_9B6A4

loc_9B749:
		jmp	loc_9B7DE

loc_9B74C:
		push	cs
		call	near ptr sub_9B670
		or	al, al
		jz	short loc_9B75B
		mov	[bp+var_1], 1
		jmp	loc_9B7F3

loc_9B75B:
		call	sub_22DDB
		push	0
		call	sub_52B0
		pop	cx
		mov	si, ax
		push	0
		call	sub_52BE
		pop	cx
		mov	di, ax
		push	0
		push	large 6400BEh
		push	large 5A005Bh
		push	word_7AF7C
		call	sub_69728
		add	sp, 0Ch
		push	si
		push	0EDDh
		lea	ax, [bp+var_52]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_52]
		push	ax
		push	large 5A005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	di
		push	0EE1h
		lea	ax, [bp+var_52]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_52]
		push	ax
		push	large 5A0083h
		call	sub_74BA9
		add	sp, 0Ah

loc_9B7DE:
		push	3
		push	0
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9B7F3
		jmp	loc_9B74C

loc_9B7F3:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_9B695		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B7FA		proc far

var_1EA		= word ptr -1EAh
var_18D		= dword ptr -18Dh
var_189		= dword ptr -189h
var_184		= word ptr -184h
var_134		= word ptr -134h
var_124		= word ptr -124h
var_122		= word ptr -122h
var_120		= word ptr -120h
var_11C		= word ptr -11Ch
var_119		= byte ptr -119h
var_CC		= word ptr -0CCh
var_AA		= word ptr -0AAh
var_4D		= dword ptr -4Dh
var_49		= dword ptr -49h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_33		= byte ptr -33h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1EAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_AA], 508h
		mov	[bp+var_49], 100h
		mov	[bp+var_4D], 0
		mov	[bp+var_AA], 0E61h
		xor	di, di
		cmp	byte_775FC, 0
		jz	short loc_9B839
		jmp	loc_9C489

loc_9B839:
		cmp	[bp+arg_2], 1
		jz	short loc_9B842
		jmp	loc_9B960

loc_9B842:
		push	seg seg008
		push	offset loc_590A
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9B8CC
		push	ss
		lea	ax, [bp+var_11C]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_9B8CC
		push	1
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		mov	bx, [bp+var_AA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_AA]
		push	ax
		call	Handle_ReadWordField_6B4D0
		add	sp, 6
		mov	word_775F8, ax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_AA]
		push	ax
		call	Handle_ReadWordField_6B4D0
		add	sp, 6
		mov	word_775F6, ax
		cmp	word_775F8, 0FFFFh
		jz	short loc_9B8BA
		mov	byte_775F5, 1
		jmp	short loc_9B8BF

loc_9B8BA:
		mov	byte_775F5, 0

loc_9B8BF:
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_6C2A4
		pop	cx
		jmp	short loc_9B8D8

loc_9B8CC:
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_9CE68
		add	sp, 4

loc_9B8D8:
		push	seg seg008
		push	offset loc_58FF
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9B951
		push	ss
		lea	ax, [bp+var_11C]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_9B951
		push	1
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		mov	bx, [bp+var_AA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_AA]
		push	ax
		call	Handle_ReadWordField_6B4D0
		add	sp, 6
		mov	word_775EB, ax
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_6C2A4
		pop	cx
		cmp	word_775EB, 0FFFFh
		jz	short loc_9B949
		mov	byte_7CB0C, 1
		jmp	loc_9C489

loc_9B949:
		mov	byte_7CB0C, 0
		jmp	loc_9C489

loc_9B951:
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_9C49C
		add	sp, 4
		jmp	loc_9C489

loc_9B960:
		push	seg seg008
		push	offset loc_58F6
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	al, byte ptr [bp+arg_2]
		add	al, 41h
		mov	[bp+var_119], al
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_9B988
		jmp	loc_9BA08

loc_9B988:
		push	ss
		lea	ax, [bp+var_11C]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_9BA08
		push	1
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		mov	bx, [bp+var_AA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h
		push	ss
		lea	ax, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	ds
		push	offset word_7C408
		lea	ax, [bp+var_CC]
		push	ss
		push	ax
		mov	cx, 22h
		call	CRT_Fmemcpy
		cmp	word_7C408, 0FFFFh
		jz	short loc_9B9E5
		jmp	loc_9C489

loc_9B9E5:
		mov	al, byte_7C404
		mov	byte_7CAC8, al
		mov	al, byte_7C405
		mov	byte_7CAC9, al
		mov	byte_7C404, 0
		mov	byte_7C405, 0
		mov	byte_7CAC6, 0
		mov	byte_7CAC7, 0
		jmp	loc_9C489

loc_9BA08:
		call	sub_5ED63
		cmp	byte_7C9F0, 2
		jnz	short loc_9BA19
		mov	ax, 1
		jmp	short loc_9BA1B

loc_9BA19:
		xor	ax, ax

loc_9BA1B:
		or	ax, ax
		jz	short loc_9BA35
		cmp	byte_7C9F0, 2
		jnz	short loc_9BA35
		push	0
		push	62B0h
		call	sub_1E034
		add	sp, 4
		jmp	short loc_9BA35

loc_9BA35:
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	[bp+var_14], 0
		mov	[bp+var_10], 2
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		lea	ax, [bp+var_134]
		push	ax
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		push	ds
		push	offset aShp
		push	ds
		push	offset aCsmlgp
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_184]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_1EA]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_1EA], 508h
		mov	[bp+var_189], 100h
		mov	[bp+var_18D], 0
		mov	[bp+var_1EA], 0E61h
		push	1
		lea	ax, [bp+var_184]
		push	ax
		lea	ax, [bp+var_1EA]
		push	ax
		mov	bx, [bp+var_1EA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_1EA]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_44+2], dx
		mov	word ptr [bp+var_44], ax
		mov	eax, [bp+var_44]
		mov	[bp+var_14], eax
		mov	[bp+var_10], 3
		mov	[bp+var_F], 1
		mov	[bp+var_E], 0
		mov	eax, [bp+var_40]
		mov	[bp+var_E], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_3C]
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	large [bp+var_14]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_1EA]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_1EA]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_1EA]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		lea	ax, word ptr [bp+var_14]
		push	ax
		lea	ax, [bp+var_134]
		push	ax
		call	sub_690A8
		add	sp, 4
		mov	[bp+var_124], 1
		mov	[bp+var_122], 0
		mov	[bp+var_120], 3
		mov	bx, word_79260
		mov	ax, [bx+14h]
		mov	[bp+var_16], ax
		lea	ax, [bp+var_134]
		mov	[bx+14h], ax
		push	0FFh
		push	bx
		call	sub_75D09
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	[bp+var_24], 0
		mov	[bp+var_22], 0
		mov	[bp+var_20], 13Fh
		mov	[bp+var_1E], 0C7h
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 2
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		cmp	byte_76D40, 0
		jnz	short loc_9BBE4
		jmp	loc_9BC77

loc_9BBE4:
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_7625E
		pop	cx
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_32+2], dx
		mov	word ptr [bp+var_32], ax
		mov	eax, [bp+var_32]
		mov	[bp+var_2E], eax
		mov	[bp+var_2A], 3
		mov	[bp+var_29], 1
		mov	[bp+var_28], 0
		mov	[bp+var_28], 0FA00h
		lea	ax, [bp+var_24]
		push	ax
		push	0
		mov	al, [bp+var_2A]
		push	ax
		push	large [bp+var_2E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6AEF8
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0EF3h
		push	64DEh
		call	sub_73E71
		add	sp, 4
		push	64DEh
		call	VGA_LoadPalette
		pop	cx

loc_9BC77:
		push	ds
		push	offset aShp_1
		push	ds
		push	offset aBlkbrd
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_184]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_1EA]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_1EA], 508h
		mov	[bp+var_189], 100h
		mov	[bp+var_18D], 0
		mov	[bp+var_1EA], 0E61h
		push	1
		lea	ax, [bp+var_184]
		push	ax
		lea	ax, [bp+var_1EA]
		push	ax
		mov	bx, [bp+var_1EA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_1EA]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_44+2], dx
		mov	word ptr [bp+var_44], ax
		mov	eax, [bp+var_44]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 3
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_40]
		mov	[bp+var_4], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_3C]
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_1EA]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_1EA]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_1EA]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	[bp+var_33], 1
		jmp	loc_9C0B3

loc_9BD6B:
		call	Joystick_InitCalibrationDefaults_525B
		push	large 0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5A06
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 3A005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5A19
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 44005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5A28
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 4E005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	cs
		call	near ptr sub_9B695
		mov	dl, al
		or	dl, dl
		jz	short loc_9BE2B
		jmp	loc_9C0C9

loc_9BE2B:
		push	[bp+arg_2]
		call	sub_52CC
		pop	cx
		push	large 0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5A06
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 3A005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5A39
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 44005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5A28
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 4E005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	cs
		call	near ptr sub_9B695
		mov	dl, al
		or	dl, dl
		jz	short loc_9BEEF
		jmp	loc_9C0C9

loc_9BEEF:
		push	[bp+arg_2]
		call	Joystick_ComputeCalibrationRatio_5308
		pop	cx
		push	large 0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5A06
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 3A005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5A49
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 44005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5A28
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 4E005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	cs
		call	near ptr sub_9B695
		mov	dl, al
		or	dl, dl
		jz	short loc_9BFB3
		jmp	loc_9C0C9

loc_9BFB3:
		push	[bp+arg_2]
		call	sub_52EA
		pop	cx
		push	large 1E0020h
		push	20h
		call	Joystick_InterpolateCalibrationPercent_5381
		add	sp, 6
		cmp	word_7C418, 0
		jz	short loc_9BFEC
		cmp	word_7C41C, 0
		jz	short loc_9BFEC
		cmp	word_7C41A, 0
		jz	short loc_9BFEC
		cmp	word_7C41E, 0
		jz	short loc_9BFEC
		mov	[bp+var_33], 0

loc_9BFEC:
		mov	al, [bp+var_33]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9C065
		push	seg seg008
		push	offset loc_58F6
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	al, byte ptr [bp+arg_2]
		add	al, 41h
		mov	[bp+var_119], al
		push	0
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		mov	bx, [bp+var_AA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h
		push	ds
		push	offset word_7C408
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_6C2A4
		pop	cx
		mov	byte_7C404, 1
		mov	word_7CB03, 2
		mov	word_7CB05, 2
		push	63B4h
		call	sub_73978
		pop	cx
		jmp	short loc_9C0B3

loc_9C065:
		push	large 0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	word_79260
		push	0FFFFh
		push	0F07h
		push	large 300051h
		call	sub_74BA9
		add	sp, 0Ah
		push	7
		call	PIT_DelayLoop
		pop	cx
		push	cs
		call	near ptr sub_9B695
		inc	di

loc_9C0B3:
		cmp	[bp+var_33], 0
		jz	short loc_9C0C1
		cmp	di, 3
		jge	short loc_9C0C1
		jmp	loc_9BD6B

loc_9C0C1:
		cmp	di, 3
		jge	short loc_9C0C9
		jmp	loc_9C29E

loc_9C0C9:
		push	large 0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5A54
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 300051h
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5A6A
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 3A005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5A7D
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 44005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5A91
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 58005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5AA4
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_11C]
		push	ax
		push	large 62005Bh
		call	sub_74BA9
		add	sp, 0Ah

loc_9C1CF:
		push	cs
		call	near ptr sub_9B670
		mov	ah, 0
		or	ax, ax
		jz	short loc_9C1CF
		mov	al, byte_7CAC3
		mov	ah, 0
		mov	word ptr [bp+var_3C+2], ax
		cmp	word ptr [bp+var_3C+2], 1
		jnz	short loc_9C1EF
		mov	byte_77537, 1
		jmp	loc_9C299

loc_9C1EF:
		push	seg seg008
		push	offset loc_58F6
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	al, byte ptr [bp+arg_2]
		add	al, 41h
		mov	[bp+var_119], al
		push	0
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		mov	bx, [bp+var_AA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	0FFFFh
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_6B479
		add	sp, 8
		push	large 0
		push	large 20h
		push	ds
		push	offset word_7C408
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_6C2A4
		pop	cx
		mov	al, byte_7C404
		mov	byte_7CAC8, al
		mov	al, byte_7C405
		mov	byte_7CAC9, al
		mov	byte_7C404, 0
		mov	byte_7C405, 0
		mov	byte_7CAC6, 0
		mov	byte_7CAC7, 0
		cmp	word_7CB03, 2
		jz	short loc_9C28A
		cmp	word_7CB03, 3
		jz	short loc_9C28A
		cmp	word_7CB03, 4
		jnz	short loc_9C290

loc_9C28A:
		mov	word_7CB03, 0

loc_9C290:
		push	63B4h
		call	sub_73978
		pop	cx

loc_9C299:
		mov	byte_775FC, 1

loc_9C29E:
		mov	ax, [bp+var_16]
		mov	[bp+var_36], ax
		mov	bx, word_79260
		mov	[bx+14h], ax
		mov	al, byte_7752A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9C2C2
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4

loc_9C2C2:
		cmp	byte_76D40, 0
		jnz	short loc_9C2CC
		jmp	loc_9C361

loc_9C2CC:
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_76259
		add	sp, 8
		lea	ax, [bp+var_24]
		push	ax
		push	0
		mov	al, [bp+var_2A]
		push	ax
		push	large [bp+var_2E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6ACDA
		add	sp, 8
		push	64DEh
		call	sub_73E7B
		pop	cx
		cmp	[bp+var_29], 0
		jz	short loc_9C343
		cmp	[bp+var_2E], 0
		jz	short loc_9C343
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9C343

loc_9C343:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_7627C
		pop	cx

loc_9C361:
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		cmp	byte_7C9F0, 2
		jnz	short loc_9C372
		mov	ax, 1
		jmp	short loc_9C374

loc_9C372:
		xor	ax, ax

loc_9C374:
		or	ax, ax
		jz	short loc_9C3C3
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9C3C3
		cmp	byte_7C9F0, 2
		jnz	short loc_9C3C3
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_38], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_38], 0
		jnz	short loc_9C3C3
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	short loc_9C3C3

loc_9C3C3:
		call	sub_5ED79
		cmp	[bp+var_29], 0
		jz	short loc_9C3EC
		cmp	[bp+var_2E], 0
		jz	short loc_9C3EC
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9C3EC

loc_9C3EC:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_7627C
		pop	cx
		push	2
		lea	ax, [bp+var_134]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_9C43D
		cmp	[bp+var_14], 0
		jz	short loc_9C43D
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9C43D

loc_9C43D:
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		cmp	[bp+var_5], 0
		jz	short loc_9C475
		cmp	[bp+var_A], 0
		jz	short loc_9C475
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9C475

loc_9C475:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0

loc_9C489:
		push	0
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_9B7FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9C49C		proc far

var_1FA		= word ptr -1FAh
var_19D		= dword ptr -19Dh
var_199		= dword ptr -199h
var_194		= word ptr -194h
var_14A		= word ptr -14Ah
var_120		= word ptr -120h
var_F9		= word ptr -0F9h
var_ED		= dword ptr -0EDh
var_E9		= dword ptr -0E9h
var_E4		= word ptr -0E4h
var_AC		= word ptr -0ACh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_94		= word ptr -94h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_30		= byte ptr -30h
var_2F		= byte ptr -2Fh
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1FAh
		push	si
		mov	ax, [bp+arg_0]
		call	sub_22DDB
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		push	1
		call	sub_52B0
		pop	cx
		or	ax, ax
		jnz	short loc_9C4C5
		jmp	loc_9CE65

loc_9C4C5:
		push	1
		call	sub_52B0
		pop	cx
		cmp	ax, word_7C428
		jb	short loc_9C4D6
		jmp	loc_9CE65

loc_9C4D6:
		mov	word_775EB, 0FFFFh
		cmp	byte_7C9F0, 2
		jnz	short loc_9C4E8
		mov	ax, 1
		jmp	short loc_9C4EA

loc_9C4E8:
		xor	ax, ax

loc_9C4EA:
		or	ax, ax
		jz	short loc_9C517
		cmp	byte_7C9F0, 2
		jnz	short loc_9C504
		push	0
		push	62B0h
		call	sub_1E034
		add	sp, 4
		jmp	short loc_9C504

loc_9C504:
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		jmp	short loc_9C526

loc_9C517:
		push	6324h
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4

loc_9C526:
		push	100h
		push	0
		lea	ax, [bp+var_A]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	[bp+var_14], 0
		mov	[bp+var_10], 2
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		mov	[bp+var_1C], 0
		mov	[bp+var_1A], 0
		mov	[bp+var_18], 13Fh
		mov	[bp+var_16], 0C7h
		cmp	byte_76D40, 0
		jnz	short loc_9C56D
		jmp	loc_9C600

loc_9C56D:
		lea	ax, [bp+var_A]
		push	ax
		call	sub_7625E
		pop	cx
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2], dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[bp+var_14], eax
		mov	[bp+var_10], 3
		mov	[bp+var_F], 1
		mov	[bp+var_E], 0
		mov	[bp+var_E], 0FA00h
		lea	ax, [bp+var_1C]
		push	ax
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	large [bp+var_14]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6AEF8
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0F1Bh
		push	64DEh
		call	sub_73E71
		add	sp, 4
		push	64DEh
		call	VGA_LoadPalette
		pop	cx

loc_9C600:
		push	large dword_7CC11
		push	0
		call	sub_74A87
		add	sp, 6
		mov	[bp+var_2A], 0
		mov	[bp+var_26], 2
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		mov	[bp+var_34], 0
		mov	[bp+var_30], 2
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		push	ds
		push	offset aShp_2
		push	ds
		push	offset aBlkbrd_1
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_14A]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_14A], 508h
		mov	[bp+var_E9], 100h
		mov	[bp+var_ED], 0
		mov	[bp+var_14A], 0E61h
		push	1
		lea	ax, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_14A]
		push	ax
		mov	bx, [bp+var_14A]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_14A]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_44+2], dx
		mov	word ptr [bp+var_44], ax
		mov	eax, [bp+var_44]
		mov	[bp+var_2A], eax
		mov	[bp+var_26], 3
		mov	[bp+var_25], 1
		mov	[bp+var_24], 0
		mov	eax, [bp+var_40]
		mov	[bp+var_24], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_3C]
		push	0
		mov	al, [bp+var_26]
		push	ax
		push	large [bp+var_2A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_14A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_14A]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_14A]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	ds
		push	offset aShp_3
		push	ds
		push	offset aCsmlgp_1
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_14A]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_14A], 508h
		mov	[bp+var_E9], 100h
		mov	[bp+var_ED], 0
		mov	[bp+var_14A], 0E61h
		push	1
		lea	ax, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_14A]
		push	ax
		mov	bx, [bp+var_14A]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_14A]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_44+2], dx
		mov	word ptr [bp+var_44], ax
		mov	eax, [bp+var_44]
		mov	[bp+var_34], eax
		mov	[bp+var_30], 3
		mov	[bp+var_2F], 1
		mov	[bp+var_2E], 0
		mov	eax, [bp+var_40]
		mov	[bp+var_2E], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_3C]
		push	0
		mov	al, [bp+var_30]
		push	ax
		push	large [bp+var_34]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_14A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_14A]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_14A]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		lea	ax, [bp+var_AC]
		push	ax
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		lea	ax, word ptr [bp+var_34]
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		call	sub_690A8
		add	sp, 4
		mov	[bp+var_9C], 1
		mov	[bp+var_9A], 0
		mov	[bp+var_98], 3
		mov	bx, word_79260
		mov	ax, [bx+14h]
		mov	[bp+var_36], ax
		lea	ax, [bp+var_AC]
		mov	[bx+14h], ax
		push	0FFh
		push	bx
		call	sub_75D09
		add	sp, 4
		push	large 0ED00A6h
		push	large 250042h
		lea	ax, [bp+var_120]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		push	large 8900A6h
		push	large 250042h
		lea	ax, [bp+var_194]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		lea	ax, [bp+var_1FA]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_1FA], 508h
		mov	[bp+var_199], 100h
		mov	[bp+var_19D], 0
		mov	[bp+var_1FA], 0E61h
		push	large 0
		mov	al, [bp+var_26]
		push	ax
		push	large [bp+var_2A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5917
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9C96B
		lea	ax, [bp+var_94]
		mov	word ptr [bp+var_3C+2], ds
		mov	word ptr [bp+var_3C], ax
		push	large 0B001Eh
		push	large 380038h
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 0C9Ah
		mov	dword ptr [si+24h], 0
		push	large [bp+var_3C]
		push	si
		call	sub_74B18
		add	sp, 6
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	ax, word_7921A
		mov	[si+2Ah], ax
		mov	[si+28h], ax
		mov	word ptr [si+22h], 0FFFFh
		mov	word ptr [si+0Eh], 0E2Dh
		lea	ax, [bp+var_4]
		mov	[si+2Ch], ax
		mov	ax, si
		jmp	short loc_9C96D

loc_9C96B:
		mov	ax, si

loc_9C96D:
		push	ax
		lea	ax, [bp+var_120]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_F9]
		mov	word ptr [bx+18h], 0
		mov	word ptr [bx+22h], 0
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	bx
		push	15h
		lea	ax, [bp+var_120]
		push	ax
		call	sub_74C76
		add	sp, 6
		push	seg seg008
		push	offset loc_591B
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9CA25
		lea	ax, [bp+var_94]
		mov	word ptr [bp+var_40+2], ds
		mov	word ptr [bp+var_40], ax
		push	large 0B001Eh
		push	large 380060h
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 0C9Ah
		mov	dword ptr [si+24h], 0
		push	large [bp+var_40]
		push	si
		call	sub_74B18
		add	sp, 6
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	ax, word_7921A
		mov	[si+2Ah], ax
		mov	[si+28h], ax
		mov	word ptr [si+22h], 0FFFFh
		mov	word ptr [si+0Eh], 0E2Dh
		lea	ax, [bp+var_2]
		mov	[si+2Ch], ax
		mov	ax, si
		jmp	short loc_9CA27

loc_9CA25:
		mov	ax, si

loc_9CA27:
		push	ax
		lea	ax, [bp+var_120]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_F9]
		mov	word ptr [bx+18h], 0
		mov	word ptr [bx+22h], 0
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	bx
		push	31h
		lea	ax, [bp+var_120]
		push	ax
		call	sub_74C76
		add	sp, 6
		lea	ax, [bp+var_120]
		push	ax
		call	sub_74CC6
		pop	cx
		lea	ax, [bp+var_120]
		push	ax
		call	sub_74AD7
		pop	cx
		push	seg seg008
		push	offset loc_591E
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_94]
		push	ax
		push	large 36005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5930
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_94]
		push	ax
		push	large 480077h
		call	sub_74BA9
		add	sp, 0Ah
		lea	ax, [bp+var_120]
		push	ax
		call	sub_74ADC
		pop	cx
		jmp	short loc_9CAE7

loc_9CAD8:
		push	0
		lea	ax, [bp+var_120]
		push	ax
		call	sub_74CE4
		add	sp, 4

loc_9CAE7:
		cmp	[bp+var_2], 0
		jnz	short loc_9CAF3
		cmp	[bp+var_4], 0
		jz	short loc_9CAD8

loc_9CAF3:
		lea	ax, [bp+var_120]
		push	ax
		call	sub_74CEE
		pop	cx
		cmp	[bp+var_2], 0
		jz	short loc_9CB07
		jmp	loc_9CC21

loc_9CB07:
		lea	ax, [bp+var_194]
		push	ax
		call	sub_74CC6
		pop	cx
		lea	ax, [bp+var_194]
		push	ax
		call	sub_74AD7
		pop	cx
		push	large 0
		mov	al, [bp+var_26]
		push	ax
		push	large [bp+var_2A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_593A
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_94]
		push	ax
		push	large 360055h
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_594D
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_94]
		push	ax
		push	large 400055h
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_595F
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_94]
		push	ax
		push	large 4A005Ah
		call	sub_74BA9
		add	sp, 0Ah
		lea	ax, [bp+var_194]
		push	ax
		call	sub_74ADC
		pop	cx
		jmp	short loc_9CBDD

loc_9CBD8:
		call	sub_22DDB

loc_9CBDD:
		push	3
		push	0
		call	sub_5235
		add	sp, 4
		or	al, al
		jnz	short loc_9CBD8
		jmp	short loc_9CBF4

loc_9CBEF:
		call	sub_22DDB

loc_9CBF4:
		push	3
		push	0
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_9CBEF
		push	1
		call	sub_52B0
		pop	cx
		mov	word_775EB, ax
		mov	byte_7CB0C, 1
		lea	ax, [bp+var_194]
		push	ax
		call	sub_74CEE
		pop	cx

loc_9CC21:
		push	seg seg008
		push	offset loc_58FF
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_1FA]
		push	ax
		mov	bx, [bp+var_1FA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	word_775EB
		lea	ax, [bp+var_1FA]
		push	ax
		call	sub_6B479
		add	sp, 8
		lea	ax, [bp+var_1FA]
		push	ax
		call	sub_6C2A4
		pop	cx
		mov	ax, [bp+var_36]
		mov	word ptr [bp+var_44+2], ax
		mov	bx, word_79260
		mov	[bx+14h], ax
		cmp	byte_76D40, 0
		jnz	short loc_9CC80
		jmp	loc_9CD15

loc_9CC80:
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+var_A]
		mov	al, [bp+var_8]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	sub_76259
		add	sp, 8
		lea	ax, [bp+var_1C]
		push	ax
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	large [bp+var_14]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6ACDA
		add	sp, 8
		push	64DEh
		call	sub_73E7B
		pop	cx
		cmp	[bp+var_F], 0
		jz	short loc_9CCF7
		cmp	[bp+var_14], 0
		jz	short loc_9CCF7
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9CCF7

loc_9CCF7:
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		lea	ax, [bp+var_A]
		push	ax
		call	sub_7627C
		pop	cx

loc_9CD15:
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	0
		lea	ax, [bp+var_1FA]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	2
		lea	ax, [bp+var_194]
		push	ax
		call	sub_74CA8
		add	sp, 4
		push	2
		lea	ax, [bp+var_120]
		push	ax
		call	sub_74CA8
		add	sp, 4
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	byte_7C9F0, 2
		jnz	short loc_9CD62
		mov	ax, 1
		jmp	short loc_9CD64

loc_9CD62:
		xor	ax, ax

loc_9CD64:
		or	ax, ax
		jz	short loc_9CDB3
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9CDB3
		cmp	byte_7C9F0, 2
		jnz	short loc_9CDB3
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_38], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_38], 0
		jnz	short loc_9CDB3
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	short loc_9CDB3

loc_9CDB3:
		cmp	[bp+var_2F], 0
		jz	short loc_9CDD7
		cmp	[bp+var_34], 0
		jz	short loc_9CDD7
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9CDD7

loc_9CDD7:
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		cmp	[bp+var_25], 0
		jz	short loc_9CE0F
		cmp	[bp+var_2A], 0
		jz	short loc_9CE0F
		push	0
		mov	al, [bp+var_26]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9CE0F

loc_9CE0F:
		mov	[bp+var_2A], 0
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		cmp	[bp+var_F], 0
		jz	short loc_9CE47
		cmp	[bp+var_14], 0
		jz	short loc_9CE47
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9CE47

loc_9CE47:
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		lea	ax, [bp+var_A]
		push	ax
		call	sub_7627C
		pop	cx

loc_9CE65:
		pop	si
		leave
		retf
sub_9C49C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9CE68		proc far

var_1FC		= word ptr -1FCh
var_1B2		= word ptr -1B2h
var_188		= word ptr -188h
var_161		= word ptr -161h
var_155		= dword ptr -155h
var_151		= dword ptr -151h
var_14C		= word ptr -14Ch
var_114		= word ptr -114h
var_104		= word ptr -104h
var_102		= word ptr -102h
var_100		= word ptr -100h
var_FC		= word ptr -0FCh
var_9F		= dword ptr -9Fh
var_9B		= dword ptr -9Bh
var_96		= word ptr -96h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_30		= byte ptr -30h
var_2F		= byte ptr -2Fh
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= byte ptr -12h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1FCh
		push	si
		mov	ax, [bp+arg_0]
		call	sub_22DDB
		push	1
		call	sub_52BE
		pop	cx
		or	ax, ax
		jnz	short loc_9CE87
		jmp	loc_9D979

loc_9CE87:
		push	1
		call	sub_52BE
		pop	cx
		cmp	ax, word_7C428
		jbe	short loc_9CE98
		jmp	loc_9D979

loc_9CE98:
		mov	ax, 0FFFFh
		mov	word_775F6, ax
		mov	word_775F8, ax
		cmp	byte_7C9F0, 2
		jnz	short loc_9CEAD
		mov	ax, 1
		jmp	short loc_9CEAF

loc_9CEAD:
		xor	ax, ax

loc_9CEAF:
		or	ax, ax
		jz	short loc_9CEDC
		cmp	byte_7C9F0, 2
		jnz	short loc_9CEC9
		push	0
		push	62B0h
		call	sub_1E034
		add	sp, 4
		jmp	short loc_9CEC9

loc_9CEC9:
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		jmp	short loc_9CEEB

loc_9CEDC:
		push	6324h
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4

loc_9CEEB:
		push	large dword_7CC11
		push	0
		call	sub_74A87
		add	sp, 6
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	100h
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	[bp+var_1C], 0
		mov	[bp+var_1A], 0
		mov	[bp+var_18], 13Fh
		mov	[bp+var_16], 0C7h
		cmp	byte_76D40, 0
		jnz	short loc_9CF4B
		jmp	loc_9CFDE

loc_9CF4B:
		lea	ax, [bp+var_14]
		push	ax
		call	sub_7625E
		pop	cx
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2], dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[bp+var_E], eax
		mov	[bp+var_A], 3
		mov	[bp+var_9], 1
		mov	[bp+var_8], 0
		mov	[bp+var_8], 0FA00h
		lea	ax, [bp+var_1C]
		push	ax
		push	0
		mov	al, [bp+var_A]
		push	ax
		push	large [bp+var_E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6AEF8
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0F3Bh
		push	64DEh
		call	sub_73E71
		add	sp, 4
		push	64DEh
		call	VGA_LoadPalette
		pop	cx

loc_9CFDE:
		push	large dword_7CC11
		push	0
		call	sub_74A87
		add	sp, 6
		mov	[bp+var_2A], 0
		mov	[bp+var_26], 2
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		mov	[bp+var_34], 0
		mov	[bp+var_30], 2
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		push	ds
		push	offset aShp_4
		push	ds
		push	offset aBlkbrd_2
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_14C]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_1B2]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_1B2], 508h
		mov	[bp+var_151], 100h
		mov	[bp+var_155], 0
		mov	[bp+var_1B2], 0E61h
		push	1
		lea	ax, [bp+var_14C]
		push	ax
		lea	ax, [bp+var_1B2]
		push	ax
		mov	bx, [bp+var_1B2]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_1B2]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_46+2], dx
		mov	word ptr [bp+var_46], ax
		mov	eax, [bp+var_46]
		mov	[bp+var_2A], eax
		mov	[bp+var_26], 3
		mov	[bp+var_25], 1
		mov	[bp+var_24], 0
		mov	eax, [bp+var_42]
		mov	[bp+var_24], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_3E]
		push	0
		mov	al, [bp+var_26]
		push	ax
		push	large [bp+var_2A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_1B2]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_1B2]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_1B2]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	ds
		push	offset aShp_5
		push	ds
		push	offset aCsmlgp_2
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_14C]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_1B2]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_1B2], 508h
		mov	[bp+var_151], 100h
		mov	[bp+var_155], 0
		mov	[bp+var_1B2], 0E61h
		push	1
		lea	ax, [bp+var_14C]
		push	ax
		lea	ax, [bp+var_1B2]
		push	ax
		mov	bx, [bp+var_1B2]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_1B2]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_46+2], dx
		mov	word ptr [bp+var_46], ax
		mov	eax, [bp+var_46]
		mov	[bp+var_34], eax
		mov	[bp+var_30], 3
		mov	[bp+var_2F], 1
		mov	[bp+var_2E], 0
		mov	eax, [bp+var_42]
		mov	[bp+var_2E], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_3E]
		push	0
		mov	al, [bp+var_30]
		push	ax
		push	large [bp+var_34]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_1B2]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_1B2]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_1B2]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		lea	ax, [bp+var_114]
		push	ax
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		lea	ax, word ptr [bp+var_34]
		push	ax
		lea	ax, [bp+var_114]
		push	ax
		call	sub_690A8
		add	sp, 4
		mov	[bp+var_104], 1
		mov	[bp+var_102], 0
		mov	[bp+var_100], 3
		mov	bx, word_79260
		mov	ax, [bx+14h]
		mov	[bp+var_36], ax
		lea	ax, [bp+var_114]
		mov	[bx+14h], ax
		push	0FFh
		push	bx
		call	sub_75D09
		add	sp, 4
		push	large 320082h
		push	large 250042h
		lea	ax, [bp+var_188]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		push	large 320096h
		push	large 250042h
		lea	ax, [bp+var_1FC]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		push	large 0
		mov	al, [bp+var_26]
		push	ax
		push	large [bp+var_2A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5917
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9D320
		lea	ax, [bp+var_96]
		mov	word ptr [bp+var_3E+2], ds
		mov	word ptr [bp+var_3E], ax
		push	large 0B001Eh
		push	large 380038h
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 0C9Ah
		mov	dword ptr [si+24h], 0
		push	large [bp+var_3E]
		push	si
		call	sub_74B18
		add	sp, 6
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	ax, word_7921A
		mov	[si+2Ah], ax
		mov	[si+28h], ax
		mov	word ptr [si+22h], 0FFFFh
		mov	word ptr [si+0Eh], 0E2Dh
		lea	ax, [bp+var_4]
		mov	[si+2Ch], ax
		mov	ax, si
		jmp	short loc_9D322

loc_9D320:
		mov	ax, si

loc_9D322:
		push	ax
		lea	ax, [bp+var_188]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_161]
		mov	word ptr [bx+18h], 0
		mov	word ptr [bx+22h], 0
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	bx
		push	15h
		lea	ax, [bp+var_188]
		push	ax
		call	sub_74C76
		add	sp, 6
		push	seg seg008
		push	offset loc_591B
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9D3DA
		lea	ax, [bp+var_96]
		mov	word ptr [bp+var_42+2], ds
		mov	word ptr [bp+var_42], ax
		push	large 0B001Eh
		push	large 380060h
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 0C9Ah
		mov	dword ptr [si+24h], 0
		push	large [bp+var_42]
		push	si
		call	sub_74B18
		add	sp, 6
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	ax, word_7921A
		mov	[si+2Ah], ax
		mov	[si+28h], ax
		mov	word ptr [si+22h], 0FFFFh
		mov	word ptr [si+0Eh], 0E2Dh
		lea	ax, [bp+var_2]
		mov	[si+2Ch], ax
		mov	ax, si
		jmp	short loc_9D3DC

loc_9D3DA:
		mov	ax, si

loc_9D3DC:
		push	ax
		lea	ax, [bp+var_188]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_161]
		mov	word ptr [bx+18h], 0
		mov	word ptr [bx+22h], 0
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	bx
		push	31h
		lea	ax, [bp+var_188]
		push	ax
		call	sub_74C76
		add	sp, 6
		lea	ax, [bp+var_188]
		push	ax
		call	sub_74CC6
		pop	cx
		lea	ax, [bp+var_188]
		push	ax
		call	sub_74AD7
		pop	cx
		push	seg seg008
		push	offset loc_5970
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_96]
		push	ax
		push	large 310058h
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5982
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_96]
		push	ax
		push	large 3C0075h
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5993
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_96]
		push	ax
		push	large 4B0083h
		call	sub_74BA9
		add	sp, 0Ah
		lea	ax, [bp+var_188]
		push	ax
		call	sub_74ADC
		pop	cx
		jmp	short loc_9D4C8

loc_9D4B9:
		push	0
		lea	ax, [bp+var_188]
		push	ax
		call	sub_74CE4
		add	sp, 4

loc_9D4C8:
		cmp	[bp+var_2], 0
		jnz	short loc_9D4D4
		cmp	[bp+var_4], 0
		jz	short loc_9D4B9

loc_9D4D4:
		lea	ax, [bp+var_188]
		push	ax
		call	sub_74CEE
		pop	cx
		cmp	[bp+var_2], 0
		jz	short loc_9D4E8
		jmp	loc_9D70C

loc_9D4E8:
		push	large 0
		mov	al, [bp+var_26]
		push	ax
		push	large [bp+var_2A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		lea	ax, [bp+var_1FC]
		push	ax
		call	sub_74CC6
		pop	cx
		lea	ax, [bp+var_1FC]
		push	ax
		call	sub_74AD7
		pop	cx
		push	seg seg008
		push	offset loc_599B
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_96]
		push	ax
		push	large 3A005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_59AD
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_96]
		push	ax
		push	large 44004Fh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_59C1
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_96]
		push	ax
		push	large 4E005Ch
		call	sub_74BA9
		add	sp, 0Ah
		lea	ax, [bp+var_1FC]
		push	ax
		call	sub_74ADC
		pop	cx
		jmp	short loc_9D5BE

loc_9D5B9:
		call	sub_22DDB

loc_9D5BE:
		push	3
		push	0
		call	sub_5235
		add	sp, 4
		or	al, al
		jnz	short loc_9D5B9
		jmp	short loc_9D5D5

loc_9D5D0:
		call	sub_22DDB

loc_9D5D5:
		push	3
		push	0
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_9D5D0
		push	1
		call	sub_52BE
		pop	cx
		mov	word_775F8, ax
		lea	ax, [bp+var_1FC]
		push	ax
		call	sub_74CD5
		pop	cx
		lea	ax, [bp+var_1FC]
		push	ax
		call	sub_74AD7
		pop	cx
		push	large 0
		mov	al, [bp+var_26]
		push	ax
		push	large [bp+var_2A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_59D2
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_96]
		push	ax
		push	large 3A005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_59E4
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_96]
		push	ax
		push	large 44005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_59F5
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_96]
		push	ax
		push	large 4E005Ch
		call	sub_74BA9
		add	sp, 0Ah
		lea	ax, [bp+var_1FC]
		push	ax
		call	sub_74ADC
		pop	cx
		jmp	short loc_9D6C8

loc_9D6C3:
		call	sub_22DDB

loc_9D6C8:
		push	3
		push	0
		call	sub_5235
		add	sp, 4
		or	al, al
		jnz	short loc_9D6C3
		jmp	short loc_9D6DF

loc_9D6DA:
		call	sub_22DDB

loc_9D6DF:
		push	3
		push	0
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_9D6DA
		push	1
		call	sub_52BE
		pop	cx
		mov	word_775F6, ax
		mov	byte_775F5, 1
		lea	ax, [bp+var_1FC]
		push	ax
		call	sub_74CEE
		pop	cx

loc_9D70C:
		push	2
		lea	ax, [bp+var_1FC]
		push	ax
		call	sub_74CA8
		add	sp, 4
		push	2
		lea	ax, [bp+var_188]
		push	ax
		call	sub_74CA8
		add	sp, 4
		push	2
		lea	ax, [bp+var_114]
		push	ax
		call	sub_69368
		add	sp, 4
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_FC], 508h
		mov	[bp+var_9B], 100h
		mov	[bp+var_9F], 0
		mov	[bp+var_FC], 0E61h
		push	seg seg008
		push	offset loc_590A
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	0
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		mov	bx, [bp+var_FC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	word_775F8
		lea	ax, [bp+var_FC]
		push	ax
		call	sub_6B479
		add	sp, 8
		push	large 0FFFFFFFFh
		push	word_775F6
		lea	ax, [bp+var_FC]
		push	ax
		call	sub_6B479
		add	sp, 8
		lea	ax, [bp+var_FC]
		push	ax
		call	sub_6C2A4
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	ax, [bp+var_36]
		mov	[bp+var_38], ax
		mov	bx, word_79260
		mov	[bx+14h], ax
		cmp	byte_76D40, 0
		jnz	short loc_9D7DA
		jmp	loc_9D86F

loc_9D7DA:
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_76259
		add	sp, 8
		lea	ax, [bp+var_1C]
		push	ax
		push	0
		mov	al, [bp+var_A]
		push	ax
		push	large [bp+var_E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6ACDA
		add	sp, 8
		push	64DEh
		call	sub_73E7B
		pop	cx
		cmp	[bp+var_9], 0
		jz	short loc_9D851
		cmp	[bp+var_E], 0
		jz	short loc_9D851
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9D851

loc_9D851:
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		lea	ax, [bp+var_14]
		push	ax
		call	sub_7627C
		pop	cx

loc_9D86F:
		cmp	byte_7C9F0, 2
		jnz	short loc_9D87B
		mov	ax, 1
		jmp	short loc_9D87D

loc_9D87B:
		xor	ax, ax

loc_9D87D:
		or	ax, ax
		jz	short loc_9D8CC
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9D8CC
		cmp	byte_7C9F0, 2
		jnz	short loc_9D8CC
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_3A], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_3A], 0
		jnz	short loc_9D8CC
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	short loc_9D8CC

loc_9D8CC:
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		cmp	[bp+var_2F], 0
		jz	short loc_9D8FF
		cmp	[bp+var_34], 0
		jz	short loc_9D8FF
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9D8FF

loc_9D8FF:
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		cmp	[bp+var_25], 0
		jz	short loc_9D937
		cmp	[bp+var_2A], 0
		jz	short loc_9D937
		push	0
		mov	al, [bp+var_26]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9D937

loc_9D937:
		mov	[bp+var_2A], 0
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		lea	ax, [bp+var_14]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_9], 0
		jz	short loc_9D979
		cmp	[bp+var_E], 0
		jz	short loc_9D979
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9D979

loc_9D979:
		pop	si
		leave
		retf
sub_9CE68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Joystick_GetAxisMaxWrapper_8EEA0 (sub_8EEA0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle Joystick_GetAxisMax_67BD8 (seg208, 18
; lignes).
; ==============================================================================================
Joystick_GetAxisMaxWrapper_9D97C		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	1
		call	sub_52A1
		pop	cx
		mov	[bp+var_2], ax
		mov	bx, 5
		cwd
		idiv	bx
		mov	word_775E9, ax
		leave
		retf
Joystick_GetAxisMaxWrapper_9D97C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9D998		proc far

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
		mov	al, byte_775E2
		mov	ah, 0
		or	ax, ax
		jz	short loc_9D9B0
		jmp	loc_9DC2D

loc_9D9B0:
		push	6C8Eh
		call	Stopwatch_RegisterTickModule_6F750
		pop	cx
		mov	byte_7CAC3, 0
		mov	byte_7CAC2, 0
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9D9DC
		push	ax
		call	sub_6EF71
		pop	cx
		mov	ax, di
		jmp	short loc_9D9DE

loc_9D9DC:
		mov	ax, di

loc_9D9DE:
		mov	[si+14h], ax
		push	50h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+16h], ax
		push	14h
		push	ds
		push	word ptr [si+16h]
		push	0
		call	Keyboard_RegisterOrInitHandlerTable_6ED71
		add	sp, 8
		mov	[si+18h], ax
		push	0
		call	sub_4EB1
		pop	cx
		mov	[si+1Ah], ax
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9DA23
		push	ax
		call	TextScrollDisplay_Construct_6F3A6
		pop	cx
		mov	ax, di
		jmp	short loc_9DA25

loc_9DA23:
		mov	ax, di

loc_9DA25:
		mov	[si+20h], ax
		push	seg stub260
		push	offset sub_738B0
		push	large 10014h
		push	large 70000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+1Ch], ax
		push	14h
		push	word ptr [si+1Ch]
		push	0
		call	TextScroll_Construct_6F0FE
		add	sp, 6
		mov	[si+1Eh], ax
		push	ds
		push	offset aShp_6
		push	ds
		push	offset aMouse
		push	large 0
		lea	ax, [bp+var_72]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_D8]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_D8], 508h
		mov	[bp+var_77], 100h
		mov	[bp+var_7B], 0
		mov	[bp+var_D8], 0E61h
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
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		push	1
		push	8
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		push	large 0FFFFFFFFh
		push	large [bp+var_8]
		push	dx
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		mov	[si], eax
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		cmp	[bp+var_4], 0
		jnz	short loc_9DB11
		jmp	loc_9DBA6

loc_9DB11:
		xor	ax, ax
		mov	[bp+var_10], ax
		mov	[bp+var_E], ax
		push	large [bp+var_4]
		call	sub_6AB8C
		mov	[bp+var_1A], ax
		xor	di, di
		jmp	short loc_9DB5A

loc_9DB29:
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	large 0
		push	large [bp+var_4]
		push	di
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	dx, [bp+var_14]
		sub	dx, [bp+var_18]
		inc	dx
		cmp	dx, [bp+var_E]
		jle	short loc_9DB4A
		mov	[bp+var_E], dx

loc_9DB4A:
		mov	dx, [bp+var_12]
		sub	dx, [bp+var_16]
		inc	dx
		cmp	dx, [bp+var_10]
		jle	short loc_9DB59
		mov	[bp+var_10], dx

loc_9DB59:
		inc	di

loc_9DB5A:
		cmp	di, [bp+var_1A]
		jl	short loc_9DB29
		mov	ax, [bp+var_E]
		imul	[bp+var_10]
		movsx	eax, ax
		mov	[bp+var_1E], eax
		push	1
		push	8
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
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

loc_9DBA6:
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	si
		call	UIScreen_SetWidgetValue_6FAA5
		add	sp, 4
		push	0
		lea	ax, [bp+var_D8]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	6390h
		call	TextScrollDisplayB_InitAndRegister_6F9B3
		pop	cx
		push	0
		push	word_7AF7E
		call	TextScrollDisplayB_ApplyHelperA_6FA1B
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_6FABB
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	word ptr [bp+var_4+2], 0
		jmp	short loc_9DC19

loc_9DBEC:
		mov	al, byte ptr [bp+var_4+2]
		push	ax
		call	sub_524B
		pop	cx
		or	al, al
		jz	short loc_9DC09
		mov	bx, word ptr [bp+var_4+2]
		mov	byte ptr [bx+6398h], 1
		mov	byte ptr [bx+6396h], 1
		jmp	short loc_9DC16

loc_9DC09:
		mov	bx, word ptr [bp+var_4+2]
		mov	byte ptr [bx+6398h], 0
		mov	byte ptr [bx+6396h], 0

loc_9DC16:
		inc	word ptr [bp+var_4+2]

loc_9DC19:
		cmp	word ptr [bp+var_4+2], 2
		jl	short loc_9DBEC
		push	cs
		call	near ptr Joystick_GetAxisMaxWrapper_9D97C
		mov	byte_775E2, 1
		call	Mouse_InitAndRead

loc_9DC2D:
		pop	di
		pop	si
		leave
		retf
sub_9D998		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 23 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InputSystem_ReleaseAll_8F5E0 (sub_8F5E0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine ResourceHandle_IsValid_6755B (seg205), TextScrollDisplay_Destruct_6728A (seg206) —
; nettoyage symétrique de InputSystem_InitAll_8F47A.
; ==============================================================================================
InputSystem_ReleaseAll_9DC31		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_775E2, 0
		jnz	short loc_9DC42
		jmp	loc_9DCEC

loc_9DC42:
		push	word ptr [si+1Ch]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+1Ch], 0
		cmp	word ptr [si+1Eh], 0
		jz	short loc_9DC6A
		push	word ptr [si+1Eh]
		call	sub_6F69A
		pop	cx
		push	word ptr [si+1Eh]
		call	sub_3B2
		pop	cx
		jmp	short loc_9DC6A

loc_9DC6A:
		mov	word ptr [si+1Eh], 0
		cmp	word ptr [si+20h], 0
		jz	short loc_9DC8D
		push	0
		push	word ptr [si+20h]
		call	TextScrollDisplay_Destruct_6F3C9
		add	sp, 4
		push	word ptr [si+20h]
		call	sub_3B2
		pop	cx
		jmp	short loc_9DC8D

loc_9DC8D:
		mov	word ptr [si+20h], 0
		push	3
		push	word ptr [si+1Ah]
		call	sub_4FEF
		add	sp, 4
		mov	word ptr [si+1Ah], 0
		push	3
		push	word ptr [si+18h]
		call	Keyboard_UnregisterHandlerTable_6EE19
		add	sp, 4
		mov	word ptr [si+18h], 0
		push	word ptr [si+16h]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+16h], 0
		cmp	word ptr [si+14h], 0
		jz	short loc_9DCE2
		push	0
		push	word ptr [si+14h]
		call	InputBinding_Destruct_6EF94
		add	sp, 4
		push	word ptr [si+14h]
		call	sub_3B2
		pop	cx
		jmp	short loc_9DCE2

loc_9DCE2:
		mov	word ptr [si+14h], 0
		mov	byte_775E2, 0

loc_9DCEC:
		pop	si
		pop	bp
		retf
InputSystem_ReleaseAll_9DC31		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9DCEF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_9DD01
		jmp	loc_9DD81

loc_9DD01:
		push	si
		push	cs
		call	near ptr InputSystem_ReleaseAll_9DC31
		pop	cx
		cmp	byte ptr [si+0Fh], 0
		jz	short loc_9DD2D
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_9DD2D
		push	0
		mov	al, [si+0Eh]
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9DD2D

loc_9DD2D:
		mov	dword ptr [si+0Ah], 0
		mov	byte ptr [si+0Fh], 0
		mov	dword ptr [si+10h], 0
		cmp	byte ptr [si+5], 0
		jz	short loc_9DD61
		cmp	dword ptr [si], 0
		jz	short loc_9DD61
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9DD61

loc_9DD61:
		mov	dword ptr [si], 0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_9DD81
		push	si
		call	sub_3B2
		pop	cx

loc_9DD81:
		pop	di
		pop	si
		pop	bp
		retf
sub_9DCEF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InputSystem_Allocate_8F6F7 (sub_8F6F7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, alloue (CRT_Malloc16_Retry, 28 lignes).
; ==============================================================================================
InputSystem_Allocate_9DD85		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9DD9E
		push	7
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9DDA6

loc_9DD9E:
		mov	ax, si
		add	ax, 6
		mov	byte ptr [si], 0

loc_9DDA6:
		mov	ax, si
		pop	si
		pop	bp
		retf
InputSystem_Allocate_9DD85		endp
ovr260		ends
