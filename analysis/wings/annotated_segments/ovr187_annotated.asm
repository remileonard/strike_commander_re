ovr187		segment	para public 'OVERLAY' use16
		assume cs:ovr187
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_685E0		proc far

var_206		= word ptr -206h
var_18E		= word ptr -18Eh
var_12A		= word ptr -12Ah
var_129		= word ptr -129h
var_116		= word ptr -116h
var_114		= word ptr -114h
var_100		= byte ptr -100h
var_FC		= word ptr -0FCh
var_FA		= word ptr -0FAh
var_F8		= word ptr -0F8h
var_F6		= word ptr -0F6h
var_F4		= word ptr -0F4h
var_F2		= word ptr -0F2h
var_EE		= word ptr -0EEh
var_DE		= word ptr -0DEh
var_DC		= word ptr -0DCh
var_DA		= word ptr -0DAh
var_D6		= word ptr -0D6h
var_86		= byte ptr -86h
var_72		= word ptr -72h
var_71		= word ptr -71h
var_5E		= word ptr -5Eh
var_5D		= word ptr -5Dh
var_49		= byte ptr -49h
var_48		= word ptr -48h
var_46		= byte ptr -46h
var_45		= byte ptr -45h
var_44		= word ptr -44h
var_3F		= byte ptr -3Fh
var_3E		= word ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= byte ptr -38h
var_34		= word ptr -34h
var_32		= byte ptr -32h
var_31		= word ptr -31h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 206h
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	sub_1F377
		mov	byte ptr [bp+var_5E], 0
		mov	byte ptr [bp+var_72], 0
		mov	[bp+var_86], 0
		mov	[bp+var_2], 7Fh
		mov	[bp+var_4], 66h
		mov	[bp+var_6], 6Eh
		mov	[bp+var_8], 7Fh
		mov	[bp+var_A], 74h
		mov	[bp+var_C], 6Eh
		push	6
		push	6040h
		call	sub_13AF4
		add	sp, 4
		mov	[bp+var_16], 0
		mov	byte ptr [bp+var_14+2], 2
		mov	byte ptr [bp+var_14+3], 0
		mov	[bp+var_10], 0
		mov	[bp+var_20], 0
		mov	[bp+var_1C], 2
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwishps
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_D6]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_D6]
		push	ax
		lea	ax, [bp+var_18E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwipals
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_D6]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_D6]
		push	ax
		lea	ax, [bp+var_206]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	3
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	46h
		lea	ax, [bp+var_18E]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	0Ah
		lea	ax, [bp+var_206]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, [bp+var_206]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_18E]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	ds
		push	offset aShp_3
		push	ds
		push	offset aFormfont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_D6]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_D6]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_2E+2], dx
		mov	word ptr [bp+var_2E], ax
		mov	eax, [bp+var_2E]
		mov	[bp+var_2A], eax
		mov	[bp+var_26], 2
		mov	[bp+var_25], 1
		mov	[bp+var_24], 0
		lea	ax, word ptr [bp+var_2A]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	[bp+var_DE], 0
		mov	[bp+var_DC], 0
		push	2Dh
		lea	ax, [bp+var_EE]
		push	ax
		mov	bx, [bp+var_EE]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_DA], ax
		mov	[bp+var_31], 0
		lea	ax, word ptr [bp+var_20]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46A98
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		push	[bp+var_34]
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_3A]
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		mov	[bp+var_FC], 0
		mov	[bp+var_FA], 0
		mov	[bp+var_F8], 0
		mov	[bp+var_F6], 0
		mov	[bp+var_F4], 13Fh
		mov	[bp+var_F2], 0C7h
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_469A5
		add	sp, 4
		lea	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		call	Widget_ApplyStyleAndAllocate_48C4D
		add	sp, 6
		mov	[bp+var_100], 4
		xor	di, di
		push	6040h
		call	sub_13BB6
		pop	cx
		jmp	loc_68BC7

loc_68841:
		push	0
		cmp	byte ptr [bp+var_14+2], 3
		jnz	short loc_68860
		push	0
		mov	al, byte ptr [bp+var_14+2]
		push	ax
		push	large [bp+var_16]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_68867

loc_68860:
		mov	edx, [bp+var_14]
		mov	ax, word ptr [bp+var_16]

loc_68867:
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_FC]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		or	di, di
		jnz	short loc_688A6
		lea	ax, [bp+var_5E]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	0BCFh
		lea	ax, [bp+var_116]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		lea	ax, [bp+var_72]
		push	ax
		push	[bp+var_A]
		push	[bp+var_8]
		push	0BD7h
		jmp	short loc_688CD

loc_688A6:
		lea	ax, [bp+var_5E]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	0BDEh
		lea	ax, [bp+var_116]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		lea	ax, [bp+var_72]
		push	ax
		push	[bp+var_A]
		push	[bp+var_8]
		push	0BE5h

loc_688CD:
		lea	ax, [bp+var_116]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		push	word_5DD42
		push	word_5DD44
		call	UI_ApplyEncodingHelper_47B38
		add	sp, 4
		call	Keyboard_DrainBufferBIOS_578C9
		mov	[bp+var_45], 0

loc_688F3:
		push	0
		call	sub_1F7CA
		pop	cx
		push	0FFh
		lea	ax, [bp+var_44]
		push	ax
		call	sub_55996
		add	sp, 4
		cmp	byte ptr [bp+var_44], 0
		jz	short loc_688F3
		cmp	byte_605C0, 1
		jz	short loc_6891E
		cmp	byte_605CC, 1
		jnz	short loc_68922

loc_6891E:
		mov	[bp+var_45], 1

loc_68922:
		cmp	byte_5FDDE, 1
		jnz	short loc_68939
		test	byte_5FDE1, 30h
		jz	short loc_68935
		mov	ax, 1
		jmp	short loc_68937

loc_68935:
		xor	ax, ax

loc_68937:
		jmp	short loc_6894E

loc_68939:
		cmp	byte_605B3, 1
		jz	short loc_68947
		cmp	byte_605EB, 1
		jnz	short loc_6894C

loc_68947:
		mov	ax, 1
		jmp	short loc_6894E

loc_6894C:
		xor	ax, ax

loc_6894E:
		or	al, al
		jnz	short loc_688F3
		cmp	byte_5FDDE, 1
		jnz	short loc_68969
		test	byte_5FDE1, 0C0h
		jz	short loc_68965
		mov	ax, 1
		jmp	short loc_68967

loc_68965:
		xor	ax, ax

loc_68967:
		jmp	short loc_6897E

loc_68969:
		cmp	byte_605CE, 1
		jz	short loc_68977
		cmp	byte_605EF, 1
		jnz	short loc_6897C

loc_68977:
		mov	ax, 1
		jmp	short loc_6897E

loc_6897C:
		xor	ax, ax

loc_6897E:
		or	al, al
		jz	short loc_68985
		jmp	loc_688F3

loc_68985:
		mov	al, byte ptr [bp+var_44+1]
		mov	[bp+var_46], al
		cmp	[bp+var_46], 0Eh
		jnz	short loc_689D7
		cmp	byte ptr [bp+var_44], 1
		jz	short loc_6899D
		cmp	byte ptr [bp+var_44], 4
		jnz	short loc_689D7

loc_6899D:
		or	di, di
		jnz	short loc_689BB
		cmp	byte ptr [bp+var_5E], 0
		jnz	short loc_689AA
		jmp	loc_68BC7

loc_689AA:
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Strlen
		pop	cx
		dec	ax
		lea	dx, [bp+var_5E]
		jmp	loc_68BC0

loc_689BB:
		cmp	byte ptr [bp+var_72], 0
		jz	short loc_689D2
		lea	ax, [bp+var_72]
		push	ax
		call	CRT_Strlen
		pop	cx
		dec	ax
		lea	dx, [bp+var_72]
		jmp	loc_68BC0

loc_689D2:
		xor	di, di
		jmp	loc_68BC7

loc_689D7:
		cmp	[bp+var_46], 1Ch
		jz	short loc_689E3
		cmp	[bp+var_46], 0Fh
		jnz	short loc_68A10

loc_689E3:
		cmp	byte ptr [bp+var_44], 2
		jnz	short loc_68A10
		or	di, di
		jnz	short loc_689F9
		cmp	byte ptr [bp+var_5E], 0
		jz	short loc_689F9
		mov	di, 1
		jmp	loc_68BC7

loc_689F9:
		cmp	di, 1
		jz	short loc_68A01
		jmp	loc_68BC7

loc_68A01:
		cmp	byte ptr [bp+var_72], 0
		jnz	short loc_68A0A
		jmp	loc_68BC7

loc_68A0A:
		mov	di, 2
		jmp	loc_68BC7

loc_68A10:
		cmp	byte ptr [bp+var_44], 1
		jz	short loc_68A1F
		cmp	byte ptr [bp+var_44], 4
		jz	short loc_68A1F
		jmp	loc_68BC7

loc_68A1F:
		cmp	[bp+var_46], 10h
		jb	short loc_68A2B
		cmp	[bp+var_46], 19h
		jbe	short loc_68A4C

loc_68A2B:
		cmp	[bp+var_46], 1Eh
		jb	short loc_68A37
		cmp	[bp+var_46], 26h
		jbe	short loc_68A4C

loc_68A37:
		cmp	[bp+var_46], 2Ch
		jb	short loc_68A43
		cmp	[bp+var_46], 32h
		jbe	short loc_68A4C

loc_68A43:
		cmp	[bp+var_46], 39h
		jz	short loc_68A4C
		jmp	loc_68BC7

loc_68A4C:
		mov	al, [bp+var_46]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+4AEAh]
		cbw
		mov	[bp+var_48], ax
		cmp	[bp+var_48], 61h
		jl	short loc_68A67
		cmp	[bp+var_48], 7Ah
		jle	short loc_68A7C

loc_68A67:
		cmp	[bp+var_48], 41h
		jl	short loc_68A73
		cmp	[bp+var_48], 5Ah
		jle	short loc_68A7C

loc_68A73:
		cmp	[bp+var_48], 20h
		jz	short loc_68A7C
		jmp	loc_68BC7

loc_68A7C:
		cmp	[bp+var_45], 0
		jz	short loc_68A8C
		cmp	[bp+var_48], 20h
		jz	short loc_68A8C
		sub	[bp+var_48], 20h

loc_68A8C:
		or	di, di
		jz	short loc_68A93
		jmp	loc_68B2A

loc_68A93:
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Strlen
		pop	cx
		cmp	ax, 0Eh
		jb	short loc_68AA5
		jmp	loc_68B2A

loc_68AA5:
		cmp	byte ptr [bp+var_5E], 0
		jnz	short loc_68AB4
		cmp	[bp+var_48], 20h
		jnz	short loc_68AB4
		jmp	loc_68BC7

loc_68AB4:
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	[bp+var_49], al
		lea	ax, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_12A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [bp+var_49]
		mov	ah, 0
		lea	dx, [bp+var_12A]
		add	ax, dx
		mov	dl, byte ptr [bp+var_48]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_49]
		mov	ah, 0
		lea	dx, [bp+var_129]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_12A]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		call	sub_4926B
		add	sp, 4
		cmp	ax, [bp+var_6]
		jle	short loc_68B0E
		jmp	loc_68BC7

loc_68B0E:
		mov	al, [bp+var_49]
		mov	ah, 0
		lea	dx, [bp+var_5E]
		add	ax, dx
		mov	dl, byte ptr [bp+var_48]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_49]
		mov	ah, 0
		lea	dx, [bp+var_5D]
		jmp	loc_68BC0

loc_68B2A:
		cmp	di, 1
		jz	short loc_68B32
		jmp	loc_68BC7

loc_68B32:
		lea	ax, [bp+var_72]
		push	ax
		call	CRT_Strlen
		pop	cx
		cmp	ax, 0Eh
		jb	short loc_68B44
		jmp	loc_68BC7

loc_68B44:
		cmp	byte ptr [bp+var_72], 0
		jnz	short loc_68B50
		cmp	[bp+var_48], 20h
		jz	short loc_68BC7

loc_68B50:
		lea	ax, [bp+var_72]
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	[bp+var_49], al
		lea	ax, [bp+var_72]
		push	ax
		lea	ax, [bp+var_12A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [bp+var_49]
		mov	ah, 0
		lea	dx, [bp+var_12A]
		add	ax, dx
		mov	dl, byte ptr [bp+var_48]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_49]
		mov	ah, 0
		lea	dx, [bp+var_129]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_12A]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		call	sub_4926B
		add	sp, 4
		cmp	ax, [bp+var_C]
		jg	short loc_68BC7
		mov	al, [bp+var_49]
		mov	ah, 0
		lea	dx, [bp+var_72]
		add	ax, dx
		mov	dl, byte ptr [bp+var_48]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_49]
		mov	ah, 0
		lea	dx, [bp+var_71]

loc_68BC0:
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_68BC7:
		cmp	di, 2
		jz	short loc_68BCF
		jmp	loc_68841

loc_68BCF:
		mov	[bp+var_3F], 1
		jmp	short loc_68BF2

loc_68BD5:
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Strlen
		pop	cx
		dec	ax
		mov	di, ax
		cmp	byte ptr [bp+di+var_5E], 20h
		jnz	short loc_68BEE
		mov	byte ptr [bp+di+var_5E], 0
		jmp	short loc_68BF2

loc_68BEE:
		mov	[bp+var_3F], 0

loc_68BF2:
		cmp	[bp+var_3F], 0
		jnz	short loc_68BD5
		mov	[bp+var_3F], 1
		jmp	short loc_68C1B

loc_68BFE:
		lea	ax, [bp+var_72]
		push	ax
		call	CRT_Strlen
		pop	cx
		dec	ax
		mov	di, ax
		cmp	byte ptr [bp+di+var_72], 20h
		jnz	short loc_68C17
		mov	byte ptr [bp+di+var_72], 0
		jmp	short loc_68C1B

loc_68C17:
		mov	[bp+var_3F], 0

loc_68C1B:
		cmp	[bp+var_3F], 0
		jnz	short loc_68BFE
		lea	ax, [bp+var_5E]
		push	ax
		mov	ax, si
		add	ax, 3A7h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_72]
		push	ax
		mov	ax, si
		add	ax, 3B6h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	0BEDh
		mov	ax, si
		add	ax, 3C5h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	0
		push	6040h
		call	sub_13C38
		add	sp, 4
		call	sub_1F377
		lea	ax, [bp+var_114]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_FC]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_25], 0
		jz	short loc_68CCF
		cmp	[bp+var_2A], 0
		jz	short loc_68CCF
		push	0
		mov	al, [bp+var_26]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_68CCF

loc_68CCF:
		mov	[bp+var_2A], 0
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		cmp	[bp+var_1B], 0
		jz	short loc_68D07
		cmp	[bp+var_20], 0
		jz	short loc_68D07
		push	0
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_68D07

loc_68D07:
		mov	[bp+var_20], 0
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		cmp	byte ptr [bp+var_14+3], 0
		jz	short loc_68D3F
		cmp	[bp+var_16], 0
		jz	short loc_68D3F
		push	0
		mov	al, byte ptr [bp+var_14+2]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_68D3F

loc_68D3F:
		pop	di
		pop	si
		leave
		retf
sub_685E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68D43		proc far

var_326		= word ptr -326h
var_2D6		= word ptr -2D6h
var_2C9		= dword ptr -2C9h
var_2C5		= dword ptr -2C5h
var_2C0		= word ptr -2C0h
var_279		= dword ptr -279h
var_275		= dword ptr -275h
var_270		= word ptr -270h
var_1F8		= word ptr -1F8h
var_1F4		= word ptr -1F4h
var_1F2		= word ptr -1F2h
var_1A8		= dword ptr -1A8h
var_1A4		= byte ptr -1A4h
var_1A3		= byte ptr -1A3h
var_1A2		= dword ptr -1A2h
var_19E		= word ptr -19Eh
var_192		= word ptr -192h
var_190		= word ptr -190h
var_18E		= dword ptr -18Eh
var_18A		= word ptr -18Ah
var_188		= word ptr -188h
var_186		= word ptr -186h
var_184		= word ptr -184h
var_182		= word ptr -182h
var_180		= word ptr -180h
var_17E		= word ptr -17Eh
var_17C		= word ptr -17Ch
var_178		= word ptr -178h
var_15A		= word ptr -15Ah
var_14C		= word ptr -14Ch
var_FC		= word ptr -0FCh
var_FA		= word ptr -0FAh
var_F9		= dword ptr -0F9h
var_F5		= dword ptr -0F5h
var_F0		= dword ptr -0F0h
var_EE		= dword ptr -0EEh
var_EA		= dword ptr -0EAh
var_E5		= byte ptr -0E5h
var_E4		= dword ptr -0E4h
var_DF		= byte ptr -0DFh
var_DE		= dword ptr -0DEh
var_D9		= byte ptr -0D9h
var_D8		= dword ptr -0D8h
var_D3		= byte ptr -0D3h
var_D2		= dword ptr -0D2h
var_CD		= byte ptr -0CDh
var_CC		= dword ptr -0CCh
var_C7		= byte ptr -0C7h
var_C6		= dword ptr -0C6h
var_C2		= word ptr -0C2h
var_C0		= dword ptr -0C0h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= word ptr -0B6h
var_B4		= byte ptr -0B4h
var_B3		= byte ptr -0B3h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= byte ptr -0AAh
var_A9		= byte ptr -0A9h
var_A8		= byte ptr -0A8h
var_A7		= byte ptr -0A7h
var_A6		= dword ptr -0A6h
var_A1		= byte ptr -0A1h
var_A0		= dword ptr -0A0h
var_9B		= byte ptr -9Bh
var_9A		= dword ptr -9Ah
var_95		= byte ptr -95h
var_94		= dword ptr -94h
var_8F		= byte ptr -8Fh
var_8E		= dword ptr -8Eh
var_89		= byte ptr -89h
var_88		= dword ptr -88h
var_84		= word ptr -84h
var_81		= byte ptr -81h
var_80		= dword ptr -80h
var_7C		= word ptr -7Ch
var_7A		= byte ptr -7Ah
var_79		= word ptr -79h
var_76		= dword ptr -76h
var_72		= byte ptr -72h
var_71		= byte ptr -71h
var_70		= dword ptr -70h
var_6C		= word ptr -6Ch
var_6A		= byte ptr -6Ah
var_69		= word ptr -69h
var_66		= dword ptr -66h
var_62		= byte ptr -62h
var_61		= byte ptr -61h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= byte ptr -4Eh
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= byte ptr -3Ah
var_39		= byte ptr -39h
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= byte ptr -30h
var_2F		= byte ptr -2Fh
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_6		= byte ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 326h
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	sub_1F377
		mov	byte_603DE, 0
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		push	ds
		push	offset aTMP
		push	ds
		push	offset aGensave
		push	ds
		push	offset a__2
		lea	ax, [bp+var_14C]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_178]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	sub_23CA
		add	sp, 6
		mov	dx, ax
		or	dx, dx
		jnz	short loc_68DF5
		lea	ax, [bp+var_2D6]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_2D6], 9B5h
		mov	[bp+var_275], 100h
		mov	[bp+var_279], 0
		mov	[bp+var_2D6], 0B2Ch
		push	1
		lea	ax, [bp+var_14C]
		push	ax
		lea	ax, [bp+var_2D6]
		push	ax
		mov	bx, [bp+var_2D6]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_2D6]
		push	ax
		call	sub_58AD6
		pop	cx
		or	al, al
		jz	short loc_68DE6
		mov	[bp+var_1], 1

loc_68DE6:
		push	0
		lea	ax, [bp+var_2D6]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4

loc_68DF5:
		push	ds
		push	offset aSAV
		push	ds
		push	offset a__8
		push	ds
		push	offset aSaved_2
		lea	ax, [bp+var_14C]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_178]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	sub_23CA
		add	sp, 6
		mov	dx, ax
		or	dx, dx
		jz	short loc_68E2B
		jmp	loc_68ECA

loc_68E2B:
		push	ds
		push	offset unk_5A917
		push	ss
		lea	ax, [bp+var_15A]
		push	ax
		push	ds
		push	offset aSaved_2
		lea	ax, [bp+var_2C0]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_326]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_326], 9B5h
		mov	[bp+var_2C5], 100h
		mov	[bp+var_2C9], 0
		mov	[bp+var_326], 0B2Ch
		push	1
		lea	ax, [bp+var_2C0]
		push	ax
		lea	ax, [bp+var_326]
		push	ax
		mov	bx, [bp+var_326]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_326]
		push	ax
		call	sub_58AD6
		pop	cx
		or	al, al
		jz	short loc_68EA9
		mov	[bp+var_2], 1
		push	0
		lea	ax, [bp+var_326]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		jmp	short loc_68ECA

loc_68EA9:
		push	0
		lea	ax, [bp+var_326]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		lea	ax, [bp+var_178]
		push	ax
		call	sub_23FD
		pop	cx
		or	ax, ax
		jnz	short loc_68ECA
		jmp	loc_68E2B

loc_68ECA:
		push	11h
		push	6040h
		call	sub_13AF4
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_8]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_186], 0
		mov	[bp+var_184], 0
		mov	[bp+var_182], 0
		mov	[bp+var_180], 0
		mov	[bp+var_17E], 13Fh
		mov	[bp+var_17C], 0C7h
		push	0
		lea	ax, [bp+var_186]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_186]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_469A5
		add	sp, 4
		push	large 9D00BDh
		push	large 230042h
		lea	ax, [bp+var_1F8]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_18A], 0
		mov	[bp+var_188], 1
		push	ds
		push	offset aPak
		push	ds
		push	offset aMenus
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_14C]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_14C]
		push	ax
		lea	ax, [bp+var_270]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	7
		lea	ax, [bp+var_270]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_20], 0
		mov	[bp+var_1C], 2
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		mov	[bp+var_2A], 0
		mov	[bp+var_26], 2
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		mov	[bp+var_34], 0
		mov	[bp+var_30], 2
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_3E], 0
		mov	[bp+var_3A], 2
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		mov	[bp+var_48], 0
		mov	[bp+var_44], 2
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		mov	[bp+var_52], 0
		mov	[bp+var_4E], 2
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		push	2
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	0
		lea	ax, [bp+var_270]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	1
		lea	ax, [bp+var_270]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	2
		lea	ax, [bp+var_270]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	3
		lea	ax, [bp+var_270]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	4
		lea	ax, [bp+var_270]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	5
		lea	ax, [bp+var_270]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_5A+2], 2
		mov	byte ptr [bp+var_5A+3], 0
		mov	[bp+var_56], 0
		push	3
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	2Fh
		lea	ax, [bp+var_270]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_66], 0
		mov	[bp+var_62], 2
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	30h
		lea	ax, [bp+var_270]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_69], 0
		lea	ax, word ptr [bp+var_66]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		call	sub_46A98
		add	sp, 4
		mov	[bp+var_76], 0
		mov	[bp+var_72], 2
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6
		lea	ax, [bp+var_270]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_79], 0
		lea	ax, word ptr [bp+var_76]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		call	sub_46A98
		add	sp, 4
		mov	eax, [bp+var_16]
		mov	[bp+var_80], eax
		mov	al, [bp+var_12]
		mov	[bp+var_81], al
		mov	eax, [bp+var_80]
		mov	[bp+var_1A8], eax
		mov	al, [bp+var_81]
		mov	[bp+var_1A4], al
		mov	[bp+var_1A3], 0
		mov	[bp+var_1A2], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_1A2], eax
		mov	[bp+var_19E], 0
		mov	[bp+var_84], 6
		cmp	[bp+var_1], 0
		jnz	short loc_691B6
		jmp	loc_69262

loc_691B6:
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_691C8
		jmp	loc_69252

loc_691C8:
		push	large 0D0073h
		push	large 1A0025h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_88], eax
		mov	al, [bp+var_1C]
		mov	[bp+var_89], al
		mov	eax, [bp+var_88]
		mov	[di+1Eh], eax
		mov	al, [bp+var_89]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_1A]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_84]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0
		mov	ax, di
		jmp	short loc_69254

loc_69252:
		mov	ax, di

loc_69254:
		push	ax
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_208FD
		add	sp, 6

loc_69262:
		cmp	[bp+var_2], 0
		jnz	short loc_6926B
		jmp	loc_69317

loc_6926B:
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_6927D
		jmp	loc_69307

loc_6927D:
		push	large 0D0073h
		push	large 2D0025h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_2A]
		mov	[bp+var_8E], eax
		mov	al, [bp+var_26]
		mov	[bp+var_8F], al
		mov	eax, [bp+var_8E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_8F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_24]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_84]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0
		mov	ax, di
		jmp	short loc_69309

loc_69307:
		mov	ax, di

loc_69309:
		push	ax
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_208FD
		add	sp, 6

loc_69317:
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_69329
		jmp	loc_693B3

loc_69329:
		push	large 0D0073h
		push	large 3F0025h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_34]
		mov	[bp+var_94], eax
		mov	al, [bp+var_30]
		mov	[bp+var_95], al
		mov	eax, [bp+var_94]
		mov	[di+1Eh], eax
		mov	al, [bp+var_95]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_2E]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_84]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0
		mov	ax, di
		jmp	short loc_693B5

loc_693B3:
		mov	ax, di

loc_693B5:
		push	ax
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_693D5
		jmp	loc_6945F

loc_693D5:
		push	large 0D0073h
		push	large 520025h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_3E]
		mov	[bp+var_9A], eax
		mov	al, [bp+var_3A]
		mov	[bp+var_9B], al
		mov	eax, [bp+var_9A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_9B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_38]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_84]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 3
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0
		mov	ax, di
		jmp	short loc_69461

loc_6945F:
		mov	ax, di

loc_69461:
		push	ax
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_69481
		jmp	loc_6950B

loc_69481:
		push	large 0D0073h
		push	large 640025h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_48]
		mov	[bp+var_A0], eax
		mov	al, [bp+var_44]
		mov	[bp+var_A1], al
		mov	eax, [bp+var_A0]
		mov	[di+1Eh], eax
		mov	al, [bp+var_A1]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_42]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_84]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 4
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0
		mov	ax, di
		jmp	short loc_6950D

loc_6950B:
		mov	ax, di

loc_6950D:
		push	ax
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_6952D
		jmp	loc_695B7

loc_6952D:
		push	large 0D0073h
		push	large 750025h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_52]
		mov	[bp+var_A6], eax
		mov	al, [bp+var_4E]
		mov	[bp+var_A7], al
		mov	eax, [bp+var_A6]
		mov	[di+1Eh], eax
		mov	al, [bp+var_A7]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_4C]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_84]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 5
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0
		mov	ax, di
		jmp	short loc_695B9

loc_695B7:
		mov	ax, di

loc_695B9:
		push	ax
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_208FD
		add	sp, 6
		mov	[bp+var_AA], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		cmp	[bp+arg_2], 0
		jnz	short loc_695DF
		jmp	loc_69667

loc_695DF:
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		push	[bp+var_7C]
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		push	0
		push	[bp+var_8]
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	0
		cmp	byte ptr [bp+var_5A+2], 3
		jnz	short loc_69641
		push	0
		mov	al, byte ptr [bp+var_5A+2]
		push	ax
		push	large [bp+var_5C]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_69648

loc_69641:
		mov	edx, [bp+var_5A]
		mov	ax, word ptr [bp+var_5C]

loc_69648:
		push	dx
		push	ax
		push	large 0
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		lea	ax, [bp+var_1F8]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		jmp	loc_696EC

loc_69667:
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		push	[bp+var_7C]
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		push	0
		cmp	byte ptr [bp+var_5A+2], 3
		jnz	short loc_696B4
		push	0
		mov	al, byte ptr [bp+var_5A+2]
		push	ax
		push	large [bp+var_5C]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_696BB

loc_696B4:
		mov	edx, [bp+var_5A]
		mov	ax, word ptr [bp+var_5C]

loc_696BB:
		push	dx
		push	ax
		push	large 0
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		lea	ax, [bp+var_1F8]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		push	0
		push	[bp+var_8]
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8

loc_696EC:
		xor	eax, eax
		mov	[bp+var_AE], eax
		mov	[bp+var_B2], eax
		mov	[bp+var_B3], 0
		mov	al, byte_603B1
		mov	ah, 0
		or	ax, ax
		jz	short loc_69716
		push	6040h
		call	sub_13E26
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_69724

loc_69716:
		mov	[bp+var_B3], 1
		mov	eax, dword_5E7D3
		mov	[bp+var_B2], eax

loc_69724:
		push	6040h
		call	sub_13BB6
		pop	cx
		jmp	loc_697B6

loc_69730:
		push	0
		call	sub_1F7CA
		pop	cx
		cmp	[bp+var_B3], 0
		jz	short loc_6975C
		mov	eax, dword_5E7D3
		sub	eax, [bp+var_B2]
		mov	ebx, 3Ch
		xor	edx, edx
		div	ebx
		cmp	eax, 1Eh
		jbe	short loc_69769
		jmp	short loc_697C0

loc_6975C:
		push	6040h
		call	sub_13D5A
		pop	cx
		or	al, al
		jnz	short loc_697C0

loc_69769:
		push	large 1
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_20A18
		add	sp, 6
		mov	[bp+var_B6], ax
		cmp	[bp+var_B6], 0
		jz	short loc_697B6
		cmp	word ptr [bp+var_18E], 0
		jnz	short loc_69792
		cmp	word ptr [bp+var_18E+2], 0
		jz	short loc_697B6

loc_69792:
		push	large [bp+var_18E]
		mov	ax, [bp+var_190]
		sub	ax, [bp+var_1F2]
		push	ax
		mov	ax, [bp+var_192]
		sub	ax, [bp+var_1F4]
		push	ax
		lea	ax, [bp+var_1F8]
		push	ax
		call	GaugeWidget_RebuildDisplay_209A7
		add	sp, 0Ah

loc_697B6:
		cmp	[bp+var_84], 6
		jnz	short loc_697C0
		jmp	loc_69730

loc_697C0:
		cmp	[bp+var_84], 6
		jnz	short loc_697CA
		jmp	loc_69B2D

loc_697CA:
		mov	[bp+var_C0], 0
		mov	byte ptr [bp+var_BE+2], 2
		mov	byte ptr [bp+var_BE+3], 0
		mov	[bp+var_BA], 0
		mov	[bp+var_C2], 67h
		mov	di, 23h
		mov	bx, [bp+var_84]
		cmp	bx, 5
		jbe	short loc_697FB
		jmp	loc_6999E

loc_697FB:
		shl	bx, 1
		jmp	cs:off_69DFF[bx]	; switch jump

loc_69802:
		mov	[bp+var_B6], 0Ah
		mov	eax, [bp+var_34]
		mov	[bp+var_C6], eax
		mov	al, [bp+var_30]
		mov	[bp+var_C7], al
		mov	eax, [bp+var_C6]
		mov	[bp+var_C0], eax
		mov	al, [bp+var_C7]
		mov	byte ptr [bp+var_BE+2], al
		mov	byte ptr [bp+var_BE+3], 0
		mov	[bp+var_BA], 0
		mov	eax, [bp+var_2E]
		mov	[bp+var_BA], eax
		add	di, 3Fh
		jmp	loc_699A7

loc_69847:
		mov	[bp+var_B6], 8
		mov	eax, [bp+var_20]
		mov	[bp+var_CC], eax
		mov	al, [bp+var_1C]
		mov	[bp+var_CD], al
		mov	eax, [bp+var_CC]
		mov	[bp+var_C0], eax
		mov	al, [bp+var_CD]
		mov	byte ptr [bp+var_BE+2], al
		mov	byte ptr [bp+var_BE+3], 0
		mov	[bp+var_BA], 0
		mov	eax, [bp+var_1A]
		mov	[bp+var_BA], eax
		add	di, 1Ah
		jmp	loc_699A7

loc_6988C:
		mov	[bp+var_B6], 9
		mov	eax, [bp+var_2A]
		mov	[bp+var_D2], eax
		mov	al, [bp+var_26]
		mov	[bp+var_D3], al
		mov	eax, [bp+var_D2]
		mov	[bp+var_C0], eax
		mov	al, [bp+var_D3]
		mov	byte ptr [bp+var_BE+2], al
		mov	byte ptr [bp+var_BE+3], 0
		mov	[bp+var_BA], 0
		mov	eax, [bp+var_24]
		mov	[bp+var_BA], eax
		add	di, 2Dh
		jmp	loc_699A7

loc_698D1:
		mov	[bp+var_B6], 0Bh
		mov	eax, [bp+var_3E]
		mov	[bp+var_D8], eax
		mov	al, [bp+var_3A]
		mov	[bp+var_D9], al
		mov	eax, [bp+var_D8]
		mov	[bp+var_C0], eax
		mov	al, [bp+var_D9]
		mov	byte ptr [bp+var_BE+2], al
		mov	byte ptr [bp+var_BE+3], 0
		mov	[bp+var_BA], 0
		mov	eax, [bp+var_38]
		mov	[bp+var_BA], eax
		add	di, 52h
		jmp	loc_699A7

loc_69916:
		mov	[bp+var_B6], 0Ch
		mov	eax, [bp+var_48]
		mov	[bp+var_DE], eax
		mov	al, [bp+var_44]
		mov	[bp+var_DF], al
		mov	eax, [bp+var_DE]
		mov	[bp+var_C0], eax
		mov	al, [bp+var_DF]
		mov	byte ptr [bp+var_BE+2], al
		mov	byte ptr [bp+var_BE+3], 0
		mov	[bp+var_BA], 0
		mov	eax, [bp+var_42]
		mov	[bp+var_BA], eax
		add	di, 64h
		jmp	short loc_699A7

loc_6995A:
		mov	[bp+var_B6], 0Dh
		mov	eax, [bp+var_52]
		mov	[bp+var_E4], eax
		mov	al, [bp+var_4E]
		mov	[bp+var_E5], al
		mov	eax, [bp+var_E4]
		mov	[bp+var_C0], eax
		mov	al, [bp+var_E5]
		mov	byte ptr [bp+var_BE+2], al
		mov	byte ptr [bp+var_BE+3], 0
		mov	[bp+var_BA], 0
		mov	eax, [bp+var_4C]
		mov	[bp+var_BA], eax
		add	di, 75h
		jmp	short loc_699A7

loc_6999E:
		push	0BF8h
		call	sub_9D78
		pop	cx

loc_699A7:
		mov	[bp+var_F0], 0
		mov	byte ptr [bp+var_EE+2], 2
		mov	byte ptr [bp+var_EE+3], 0
		mov	[bp+var_EA], 0
		push	2
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	[bp+var_B6]
		lea	ax, [bp+var_270]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		call	TextScrollDisplayB_ApplyHelperD_571DE
		xor	eax, eax
		mov	[bp+var_F9], eax
		mov	[bp+var_F5], eax
		mov	eax, dword_5E7D3
		mov	[bp+var_F9], eax
		mov	byte ptr [bp+var_FA], 1
		mov	[bp+var_FC], 0
		jmp	short loc_69A6A

loc_69A03:
		push	[bp+var_FC]
		cmp	byte ptr [bp+var_EE+2], 3
		jnz	short loc_69A27
		push	0
		mov	al, byte ptr [bp+var_EE+2]
		push	ax
		push	large [bp+var_F0]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_69A30

loc_69A27:
		mov	edx, [bp+var_EE]
		mov	ax, word ptr [bp+var_F0]

loc_69A30:
		push	dx
		push	ax
		push	di
		push	[bp+var_C2]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch

loc_69A43:
		lea	ax, [bp+var_FA]
		push	ax
		call	Stopwatch_Elapsed_56336
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 3
		jb	short loc_69A43
		mov	eax, dword_5E7D3
		mov	[bp+var_F9], eax
		mov	byte ptr [bp+var_FA], 1
		inc	[bp+var_FC]

loc_69A6A:
		cmp	[bp+var_FC], 7
		jl	short loc_69A03
		push	0
		cmp	byte ptr [bp+var_BE+2], 3
		jnz	short loc_69A93
		push	0
		mov	al, byte ptr [bp+var_BE+2]
		push	ax
		push	large [bp+var_C0]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_69A9C

loc_69A93:
		mov	edx, [bp+var_BE]
		mov	ax, word ptr [bp+var_C0]

loc_69A9C:
		push	dx
		push	ax
		push	di
		push	[bp+var_C2]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		cmp	byte ptr [bp+var_EE+3], 0
		jz	short loc_69AD7
		cmp	[bp+var_F0], 0
		jz	short loc_69AD7
		push	0
		mov	al, byte ptr [bp+var_EE+2]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69AD7

loc_69AD7:
		mov	[bp+var_F0], 0
		mov	byte ptr [bp+var_EE+3], 0
		mov	[bp+var_EA], 0
		cmp	byte ptr [bp+var_BE+3], 0
		jz	short loc_69B16
		cmp	[bp+var_C0], 0
		jz	short loc_69B16
		push	0
		mov	al, byte ptr [bp+var_BE+2]
		push	ax
		lea	ax, word ptr [bp+var_C0]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69B16

loc_69B16:
		mov	[bp+var_C0], 0
		mov	byte ptr [bp+var_BE+3], 0
		mov	[bp+var_BA], 0

loc_69B2D:
		lea	ax, [bp+var_1F8]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		cmp	[bp+var_84], 2
		jnz	short loc_69B49
		push	1
		push	si
		call	sub_BE70
		jmp	short loc_69B58

loc_69B49:
		cmp	[bp+var_84], 4
		jnz	short loc_69B5B
		push	1
		push	si
		call	sub_C234

loc_69B58:
		add	sp, 4

loc_69B5B:
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	3E8h
		push	6040h
		call	sub_13C38
		add	sp, 4
		mov	al, byte ptr [bp+var_84]
		mov	[bp+var_B4], al
		lea	ax, [bp+var_7C]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	[bp+var_71], 0
		jz	short loc_69BA4
		cmp	[bp+var_76], 0
		jz	short loc_69BA4
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69BA4

loc_69BA4:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	[bp+var_61], 0
		jz	short loc_69BE6
		cmp	[bp+var_66], 0
		jz	short loc_69BE6
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69BE6

loc_69BE6:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	byte ptr [bp+var_5A+3], 0
		jz	short loc_69C1E
		cmp	[bp+var_5C], 0
		jz	short loc_69C1E
		push	0
		mov	al, byte ptr [bp+var_5A+2]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69C1E

loc_69C1E:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_5A+3], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_69C56
		cmp	[bp+var_52], 0
		jz	short loc_69C56
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69C56

loc_69C56:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_69C8E
		cmp	[bp+var_48], 0
		jz	short loc_69C8E
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69C8E

loc_69C8E:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_69CC6
		cmp	[bp+var_3E], 0
		jz	short loc_69CC6
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69CC6

loc_69CC6:
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_69CFE
		cmp	[bp+var_34], 0
		jz	short loc_69CFE
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69CFE

loc_69CFE:
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		cmp	[bp+var_25], 0
		jz	short loc_69D36
		cmp	[bp+var_2A], 0
		jz	short loc_69D36
		push	0
		mov	al, [bp+var_26]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69D36

loc_69D36:
		mov	[bp+var_2A], 0
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		cmp	[bp+var_1B], 0
		jz	short loc_69D6E
		cmp	[bp+var_20], 0
		jz	short loc_69D6E
		push	0
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69D6E

loc_69D6E:
		mov	[bp+var_20], 0
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		cmp	[bp+var_11], 0
		jz	short loc_69DA6
		cmp	[bp+var_16], 0
		jz	short loc_69DA6
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69DA6

loc_69DA6:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, [bp+var_270]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1F8]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		lea	ax, [bp+var_C]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_186]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		call	sub_46E08
		pop	cx
		mov	al, [bp+var_B4]
		pop	di
		pop	si
		leave
		retf
sub_68D43		endp

; START OF FUNCTION CHUNK FOR sub_68D43
off_69DFF	dw offset loc_69802
		dw offset loc_69847
		dw offset loc_6988C
		dw offset loc_698D1
		dw offset loc_69916
		dw offset loc_6995A
; END OF FUNCTION CHUNK FOR sub_68D43
ovr187		ends
