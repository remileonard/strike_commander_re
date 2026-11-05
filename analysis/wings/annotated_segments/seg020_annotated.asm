seg020		segment	para public 'CODE' use16
		assume cs:seg020
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B990		proc far

var_9E		= word ptr -9Eh
var_80		= word ptr -80h
var_72		= word ptr -72h
var_22		= word ptr -22h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 9Eh
		push	si
		push	di
		xor	si, si
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B9B2
		push	ds
		push	offset aSAV
		push	ds
		push	offset a__3
		push	ds
		push	offset aSaved_2
		jmp	short loc_B9BE

loc_B9B2:
		push	ds
		push	offset aTAP
		push	ds
		push	offset a__4
		push	ds
		push	offset aTapes_2

loc_B9BE:
		lea	ax, [bp+var_72]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_9E]
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		call	sub_23CA
		add	sp, 6
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_B9E9
		jmp	loc_BA78

loc_B9E9:
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BA01
		push	ds
		push	offset unk_5A868
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		push	ds
		push	offset aSaved_2
		jmp	short loc_BA0E

loc_BA01:
		push	ds
		push	offset unk_5A869
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		push	ds
		push	offset aTapes_2

loc_BA0E:
		lea	ax, [bp+var_72]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_72]
		push	ax
		call	sub_58AE0
		pop	cx
		or	al, al
		jz	short loc_BA61
		inc	si
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	2Eh
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_BA50
		mov	byte ptr [di], 0

loc_BA50:
		push	1
		lea	ax, [bp+var_22]
		push	ax
		push	[bp+arg_0]
		call	sub_23428
		add	sp, 6

loc_BA61:
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_23FD
		pop	cx
		or	ax, ax
		jnz	short loc_BA78
		cmp	si, 64h
		jge	short loc_BA78
		jmp	loc_B9E9

loc_BA78:
		mov	[bp+var_4], si
		mov	ax, [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_B990		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA82		proc far

var_DE		= word ptr -0DEh
var_D0		= word ptr -0D0h
var_6C		= word ptr -6Ch
var_6A		= byte ptr -6Ah
var_69		= byte ptr -69h
var_68		= byte ptr -68h
var_67		= byte ptr -67h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= byte ptr -5Eh
var_44		= word ptr -44h
var_42		= word ptr -42h
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_23		= byte ptr -23h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_15		= byte ptr -15h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0DEh
		mov	ax, [bp+arg_0]
		mov	[bp+var_2], 0
		push	large 740099h
		push	large 34004Eh
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_D0], 0B8Ah
		mov	[bp+var_3A], 0
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_30], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		mov	[bp+var_20], 0
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		mov	[bp+var_12], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6C], 0
		lea	ax, [bp+var_DE]
		mov	word_59FD8, ax
		mov	[bp+var_6A], 0
		mov	[bp+var_69], 0
		mov	[bp+var_68], 1
		mov	[bp+var_67], 0
		xor	ax, ax
		mov	[bp+var_62], ax
		mov	[bp+var_64], ax
		mov	[bp+var_60], 0
		mov	[bp+var_5E], 0
		mov	[bp+var_3C], 0
		mov	[bp+var_66], 0
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_44], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_42], ax
		mov	bx, [bp+var_42]
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_DE]
		push	ax
		call	sub_5B83
		pop	cx
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		lea	ax, [bp+var_DE]
		push	ax
		call	sub_67A3
		pop	cx
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_571DE
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_22]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_30]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		cmp	[bp+var_35], 0
		jz	short loc_BBBA
		cmp	[bp+var_3A], 0
		jz	short loc_BBBA
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_BBBA

loc_BBBA:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		push	0
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		leave
		retf
sub_BA82		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBDF		proc far

var_6A		= word ptr -6Ah
var_D		= dword ptr -0Dh
var_9		= dword ptr -9
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [di], 0
		jnz	short loc_BBF5
		jmp	loc_BE6A

loc_BBF5:
		push	0
		call	sub_47DF
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 186A0h
		jge	short loc_BC38
		push	ds
		push	di
		call	Config_LoadOrCreate
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BC38
		push	large 4B0h
		lea	ax, [bp+var_4]
		push	ax
		push	0B4Ah
		call	sub_1F3DF
		add	sp, 8
		mov	byte_5A567, 0
		mov	al, 0
		jmp	loc_BE6C

loc_BC38:
		mov	[bp+var_2], di
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_6A], 9B5h
		mov	[bp+var_9], 100h
		mov	[bp+var_D], 0
		mov	[bp+var_6A], 0B2Ch
		push	0
		push	[bp+var_2]
		lea	ax, [bp+var_6A]
		push	ax
		mov	bx, [bp+var_6A]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 7
		push	ds
		push	offset aWWI100
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		mov	al, [si+10Ch]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C8A
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+10Dh]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C8A
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+10Eh]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C8A
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+10Fh]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C8A
		add	sp, 8
		xor	di, di
		jmp	short loc_BCF2

loc_BCDB:
		push	large 0FFFFFFFFh
		mov	bx, di
		mov	al, [bx+si+11Ch]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C8A
		add	sp, 8
		inc	di

loc_BCF2:
		cmp	di, 100h
		jl	short loc_BCDB
		xor	di, di
		jmp	short loc_BD13

loc_BCFC:
		push	large 0FFFFFFFFh
		mov	bx, di
		mov	al, [bx+si+21Ch]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C8A
		add	sp, 8
		inc	di

loc_BD13:
		cmp	di, 64h
		jl	short loc_BCFC
		xor	di, di
		jmp	short loc_BD34

loc_BD1C:
		push	large 0FFFFFFFFh
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si+280h]
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C6D
		add	sp, 8
		inc	di

loc_BD34:
		cmp	di, 9
		jl	short loc_BD1C
		xor	di, di
		jmp	short loc_BD86

loc_BD3D:
		push	large 0FFFFFFFFh
		mov	bx, di
		imul	bx, bx, 1Ah
		push	word ptr [bx+si+2AEh]
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C6D
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	bx, di
		imul	bx, bx, 1Ah
		push	word ptr [bx+si+2B0h]
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C6D
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	bx, di
		imul	bx, bx, 1Ah
		push	word ptr [bx+si+2B2h]
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C6D
		add	sp, 8
		inc	di

loc_BD86:
		cmp	di, 8
		jl	short loc_BD3D
		push	large 0FFFFFFFFh
		push	large 0Fh
		push	ds
		mov	ax, si
		add	ax, 3A7h
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 0Fh
		push	ds
		mov	ax, si
		add	ax, 3B6h
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 0Fh
		push	ds
		mov	ax, si
		add	ax, 3C5h
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	word ptr [si+3D4h]
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C6D
		add	sp, 8
		push	large 0FFFFFFFFh
		push	large 3Dh
		push	ds
		mov	ax, si
		add	ax, 36Ah
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		xor	di, di
		jmp	short loc_BE1B

loc_BE06:
		push	large 0FFFFFFFFh
		mov	al, [di+1278h]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C8A
		add	sp, 8
		inc	di

loc_BE1B:
		cmp	di, 7
		jl	short loc_BE06
		push	large 0FFFFFFFFh
		mov	al, [si+3D6h]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C8A
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+3D7h]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_51C8A
		add	sp, 8
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_A690
		pop	cx
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_527AA
		pop	cx
		push	0
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4

loc_BE6A:
		mov	al, 1

loc_BE6C:
		pop	di
		pop	si
		leave
		retf
sub_BBDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE70		proc far

var_DE		= word ptr -0DEh
var_D0		= word ptr -0D0h
var_6C		= word ptr -6Ch
var_6A		= byte ptr -6Ah
var_69		= byte ptr -69h
var_68		= byte ptr -68h
var_67		= byte ptr -67h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= byte ptr -5Eh
var_44		= word ptr -44h
var_42		= word ptr -42h
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_23		= byte ptr -23h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_15		= byte ptr -15h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0DEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, 0Fh
		or	dx, dx
		jz	short loc_BE89
		mov	di, 19h

loc_BE89:
		mov	byte ptr [si+0A7h], 0
		mov	[bp+var_2], dx
		push	large 740099h
		push	large 34004Eh
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_D0], 0B8Ah
		mov	[bp+var_3A], 0
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_30], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		mov	[bp+var_20], 0
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		mov	[bp+var_12], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6C], 1
		lea	ax, [bp+var_DE]
		mov	word_59FD8, ax
		mov	[bp+var_6A], 0
		mov	[bp+var_69], 0
		mov	[bp+var_68], 1
		mov	[bp+var_67], 0
		xor	ax, ax
		mov	[bp+var_62], ax
		mov	[bp+var_64], ax
		mov	[bp+var_60], 0
		mov	[bp+var_5E], 0
		mov	[bp+var_3C], 0
		mov	ax, [bp+var_2]
		mov	[bp+var_66], ax
		mov	[bp+var_4], di
		mov	ax, si
		add	ax, 0A7h
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_44], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_42], ax
		mov	bx, [bp+var_42]
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_DE]
		push	ax
		call	sub_5B83
		pop	cx
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		lea	ax, [bp+var_DE]
		push	ax
		call	sub_67A3
		pop	cx
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_571DE
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_22]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_30]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		cmp	[bp+var_35], 0
		jz	short loc_BFBA
		cmp	[bp+var_3A], 0
		jz	short loc_BFBA
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_BFBA

loc_BFBA:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		push	0
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_BE70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFE1		proc far

var_68		= word ptr -68h
var_B		= dword ptr -0Bh
var_7		= dword ptr -7
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [di], 0
		jnz	short loc_BFF7
		jmp	loc_C230

loc_BFF7:
		mov	[bp+var_2], di
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_68], 9B5h
		mov	[bp+var_7], 100h
		mov	[bp+var_B], 0
		mov	[bp+var_68], 0B2Ch
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_68]
		push	ax
		mov	bx, [bp+var_68]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_68]
		push	ax
		call	sub_58AD6
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C04E
		push	34EBh
		push	0B5Eh
		call	sub_9D78
		add	sp, 4

loc_C04E:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	[si+10Ch], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	[si+10Dh], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	[si+10Eh], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	[si+10Fh], al
		xor	di, di
		jmp	short loc_C0B4

loc_C09E:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	bx, di
		mov	[bx+si+11Ch], al
		inc	di

loc_C0B4:
		cmp	di, 100h
		jl	short loc_C09E
		xor	di, di
		jmp	short loc_C0D4

loc_C0BE:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	bx, di
		mov	[bx+si+21Ch], al
		inc	di

loc_C0D4:
		cmp	di, 64h
		jl	short loc_C0BE
		xor	di, di
		jmp	short loc_C0F5

loc_C0DD:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_51CC4
		add	sp, 6
		mov	bx, di
		shl	bx, 1
		mov	[bx+si+280h], ax
		inc	di

loc_C0F5:
		cmp	di, 9
		jl	short loc_C0DD
		xor	di, di
		jmp	short loc_C147

loc_C0FE:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_51CC4
		add	sp, 6
		mov	bx, di
		imul	bx, bx, 1Ah
		mov	[bx+si+2AEh], ax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_51CC4
		add	sp, 6
		mov	bx, di
		imul	bx, bx, 1Ah
		mov	[bx+si+2B0h], ax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_51CC4
		add	sp, 6
		mov	bx, di
		imul	bx, bx, 1Ah
		mov	[bx+si+2B2h], ax
		inc	di

loc_C147:
		cmp	di, 8
		jl	short loc_C0FE
		push	large 0FFFFFFFFh
		push	large 0Fh
		push	ds
		mov	ax, si
		add	ax, 3A7h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 0Fh
		push	ds
		mov	ax, si
		add	ax, 3B6h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 0Fh
		push	ds
		mov	ax, si
		add	ax, 3C5h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_51CC4
		add	sp, 6
		mov	[si+3D4h], ax
		push	large 0FFFFFFFFh
		push	large 3Dh
		push	ds
		mov	ax, si
		add	ax, 36Ah
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		xor	di, di
		jmp	short loc_C1DB

loc_C1C7:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	[di+1278h], al
		inc	di

loc_C1DB:
		cmp	di, 7
		jl	short loc_C1C7
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	[si+3D6h], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	ah, 0
		push	ax
		push	si
		call	sub_58AD1
		add	sp, 4
		lea	ax, [bp+var_68]
		push	ax
		call	sub_A6C8
		pop	cx
		lea	ax, [bp+var_68]
		push	ax
		call	sub_527AA
		pop	cx
		push	0
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4

loc_C230:
		pop	di
		pop	si
		leave
		retf
sub_BFE1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C234		proc far

var_DE		= word ptr -0DEh
var_D0		= word ptr -0D0h
var_6C		= word ptr -6Ch
var_6A		= byte ptr -6Ah
var_69		= byte ptr -69h
var_68		= byte ptr -68h
var_67		= byte ptr -67h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= byte ptr -5Eh
var_44		= word ptr -44h
var_42		= word ptr -42h
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_23		= byte ptr -23h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_15		= byte ptr -15h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0DEh
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0Fh
		push	large 740099h
		push	large 34004Eh
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_D0], 0B8Ah
		mov	[bp+var_3A], 0
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_30], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		mov	[bp+var_20], 0
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		mov	[bp+var_12], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6C], 2
		lea	ax, [bp+var_DE]
		mov	word_59FD8, ax
		mov	[bp+var_6A], 0
		mov	[bp+var_69], 0
		mov	[bp+var_68], 1
		mov	[bp+var_67], 0
		xor	ax, ax
		mov	[bp+var_62], ax
		mov	[bp+var_64], ax
		mov	[bp+var_60], 0
		mov	[bp+var_5E], 0
		mov	[bp+var_3C], 0
		mov	[bp+var_66], 0
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		mov	ax, si
		add	ax, 0A7h
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_44], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_42], ax
		mov	bx, [bp+var_42]
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_DE]
		push	ax
		call	sub_5B83
		pop	cx
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		lea	ax, [bp+var_DE]
		push	ax
		call	sub_67A3
		pop	cx
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_571DE
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_22]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_30]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		cmp	[bp+var_35], 0
		jz	short loc_C36F
		cmp	[bp+var_3A], 0
		jz	short loc_C36F
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_C36F

loc_C36F:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		push	0
		lea	ax, [bp+var_DE]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		pop	si
		leave
		retf
sub_C234		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C395		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C422
		mov	ax, si
		add	ax, 0CAh
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		mov	ax, si
		add	ax, 0BCh
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		mov	ax, si
		add	ax, 0AEh
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		cmp	byte ptr [si+0A9h], 0
		jz	short loc_C3F1
		cmp	dword ptr [si+0A4h], 0
		jz	short loc_C3F1
		push	0
		mov	al, [si+0A8h]
		push	ax
		mov	ax, si
		add	ax, 0A4h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_C3F1

loc_C3F1:
		mov	dword ptr [si+0A4h], 0
		mov	byte ptr [si+0A9h], 0
		mov	dword ptr [si+0AAh], 0
		push	0
		push	si
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		test	di, 1
		jz	short loc_C422
		push	si
		call	sub_33B
		pop	cx
sub_C395		endp
seg020		ends
