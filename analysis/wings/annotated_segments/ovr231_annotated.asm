ovr231		segment	para public 'OVERLAY' use16
		assume cs:ovr231
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_819A0		proc far

var_282		= word ptr -282h
var_260		= dword ptr -260h
var_25E		= dword ptr -25Eh
var_25B		= word ptr -25Bh
var_25A		= word ptr -25Ah
var_242		= word ptr -242h
var_22A		= word ptr -22Ah
var_1B2		= word ptr -1B2h
var_151		= dword ptr -151h
var_14D		= dword ptr -14Dh
var_145		= word ptr -145h
var_141		= dword ptr -141h
var_13A		= word ptr -13Ah
var_C2		= word ptr -0C2h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_56		= word ptr -56h
var_54		= dword ptr -54h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_46		= word ptr -46h
var_45		= word ptr -45h
var_44		= word ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= byte ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_2C		= word ptr -2Ch
var_2A		= byte ptr -2Ah
var_29		= word ptr -29h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= byte ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 282h
		push	si
		push	di
		mov	[bp+var_1], 0
		cmp	word_5CF9F, 0
		jz	short loc_819B8
		mov	[bp+var_1], 1

loc_819B8:
		mov	ax, word_5DD44
		mov	[bp+var_4], ax
		mov	[bp+var_64], 0
		mov	[bp+var_62], 0
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_72], 0
		mov	[bp+var_70], 0
		mov	[bp+var_6E], 0
		mov	[bp+var_6C], 0
		mov	[bp+var_6A], 13Fh
		mov	[bp+var_68], 0C7h
		push	0
		lea	ax, [bp+var_72]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_72]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469A5
		add	sp, 4
		mov	[bp+var_60], 0
		mov	[bp+var_5E], 18h
		mov	[bp+var_5C], 13Fh
		mov	[bp+var_5A], 97h
		push	ds
		push	offset aPak
		push	ds
		push	offset aMIDGAM07
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_C2]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_13A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidnoise
		push	ds
		push	offset aDataNoise
		lea	ax, [bp+var_C2]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_1B2]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		lea	ax, [bp+var_22A]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		cmp	[bp+var_1], 0
		jnz	short loc_81A8A
		jmp	loc_81B11

loc_81A8A:
		push	ds
		lea	ax, [bp+var_C2]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_81B11
		push	1
		lea	ax, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_1B2]
		push	ax
		mov	bx, [bp+var_1B2]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	6
		lea	ax, [bp+var_1B2]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_14D]
		mov	[bp+var_4E], eax
		mov	ax, [bp+var_145]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_81ADD
		mov	eax, [bp+var_151]
		jmp	short loc_81AE2

loc_81ADD:
		mov	eax, [bp+var_141]

loc_81AE2:
		mov	edx, [bp+var_4E]
		add	edx, eax
		mov	[bp+var_52], edx
		mov	eax, [bp+var_4E]
		cmp	eax, [bp+var_52]
		jz	short loc_81B11
		push	0
		push	edx
		push	eax
		lea	ax, [bp+var_1B2]
		push	ax
		lea	ax, [bp+var_22A]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		jmp	short loc_81B15

loc_81B11:
		mov	[bp+var_1], 0

loc_81B15:
		cmp	[bp+var_1], 0
		jz	short loc_81B21
		mov	ax, word_5CF9F
		mov	[bp+var_A], ax

loc_81B21:
		xor	di, di
		cmp	[bp+var_1], 0
		jz	short loc_81B45
		xor	si, si
		jmp	short loc_81B40

loc_81B2D:
		push	si
		lea	ax, [bp+var_22A]
		push	ax
		push	si
		push	[bp+var_A]
		call	sub_412F9
		add	sp, 8
		inc	si

loc_81B40:
		cmp	si, 2
		jl	short loc_81B2D

loc_81B45:
		push	100h
		push	0
		lea	ax, [bp+var_10]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		push	ds
		push	offset unk_5CEF8
		push	ds
		push	offset aConvfontShp_5
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_C2]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_C2]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_1E+2], dx
		mov	word ptr [bp+var_1E], ax
		mov	eax, [bp+var_1E]
		mov	[bp+var_1A], eax
		mov	[bp+var_16], 3
		mov	[bp+var_15], 1
		mov	[bp+var_14], 0
		lea	ax, word ptr [bp+var_1A]
		push	ax
		lea	ax, [bp+var_242]
		push	ax
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	[bp+var_26], 0
		mov	[bp+var_24], 98h
		mov	[bp+var_22], 13Fh
		mov	[bp+var_20], 0C7h
		mov	[bp+var_2C], 0
		mov	[bp+var_29], 0
		push	100h
		push	0
		lea	ax, [bp+var_32]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_54], 0
		mov	byte ptr [bp+var_52+2], 2
		mov	byte ptr [bp+var_52+3], 0
		mov	[bp+var_4E], 0
		push	2
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_54]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_52+3], 0
		jz	short loc_81C3D
		cmp	[bp+var_54], 0
		jz	short loc_81C3D
		push	0
		mov	al, byte ptr [bp+var_52+2]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_81C3D

loc_81C3D:
		mov	[bp+var_54], 0
		mov	byte ptr [bp+var_52+3], 0
		mov	[bp+var_4E], 0
		push	2
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	2
		lea	ax, [bp+var_13A]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_54]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		call	Palette_LoadAndUpload_46E20
		add	sp, 4
		cmp	byte ptr [bp+var_52+3], 0
		jz	short loc_81C9A
		cmp	[bp+var_54], 0
		jz	short loc_81C9A
		push	0
		mov	al, byte ptr [bp+var_52+2]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_81C9A

loc_81C9A:
		mov	[bp+var_54], 0
		mov	byte ptr [bp+var_52+3], 0
		mov	[bp+var_4E], 0
		cmp	byte ptr [bp+var_52+3], 0
		jz	short loc_81CD2
		cmp	[bp+var_54], 0
		jz	short loc_81CD2
		push	0
		mov	al, byte ptr [bp+var_52+2]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_81CD2

loc_81CD2:
		mov	[bp+var_54], 0
		mov	byte ptr [bp+var_52+3], 0
		mov	[bp+var_4E], 0
		lea	ax, [bp+var_34]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	0Eh
		lea	ax, [bp+var_34]
		push	ax
		call	sub_13AF4
		add	sp, 4
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	byte ptr [bp+var_38], 0
		mov	byte ptr [bp+var_38+1], 0
		mov	[bp+var_36], 0
		push	100h
		push	0
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	Palette_FillRange_46CC8
		add	sp, 8
		push	0
		push	[bp+var_10]
		mov	al, [bp+var_E]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		call	sub_1F377
		xor	eax, eax
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_4A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10003h
		push	0Ah
		lea	ax, word ptr [bp+var_260]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		xor	si, si
		jmp	short loc_81DAA

loc_81D8B:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_4A]
		add	ax, dx
		push	ax
		mov	ax, si
		inc	ax
		push	ax
		lea	ax, [bp+var_13A]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_81DAA:
		cmp	si, 1
		jl	short loc_81D8B
		xor	si, si
		jmp	short loc_81DD5

loc_81DB3:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_260]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 3
		push	ax
		lea	ax, [bp+var_13A]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_81DD5:
		cmp	si, 3
		jl	short loc_81DB3
		lea	ax, [bp+var_34]
		push	ax
		call	sub_13BB6
		pop	cx
		lea	ax, [bp+var_64]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_282]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		cmp	[bp+var_1], 0
		jz	short loc_81E37
		push	large 0FFh
		push	0
		push	di
		push	[bp+var_A]
		call	sub_4163D
		add	sp, 0Ah

loc_81E37:
		xor	si, si
		jmp	loc_81F21

loc_81E3C:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_4A]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_4E+2], ax
		push	ax
		lea	ax, [bp+var_282]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_81E72

loc_81E67:
		lea	ax, [bp+var_282]
		push	ax
		call	sub_1EED1
		pop	cx

loc_81E72:
		push	word ptr [bp+var_4E+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_81E67
		push	word ptr [bp+var_4E+2]
		lea	ax, [bp+var_282]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_4E+2], 0
		jz	short loc_81EA8
		push	3
		push	word ptr [bp+var_4E+2]
		mov	bx, word ptr [bp+var_4E+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_81EA8

loc_81EA8:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_45]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_81EEF
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4A]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_81EEF
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_46]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_4A]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_81EEF

loc_81EEF:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4A]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_45]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_44]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_81F21:
		cmp	si, 1
		jge	short loc_81F29
		jmp	loc_81E3C

loc_81F29:
		cmp	byte_603DE, 0
		jnz	short loc_81F33
		jmp	loc_81FFE

loc_81F33:
		cmp	[bp+var_1], 0
		jz	short loc_81F4D
		jmp	short loc_81F48

loc_81F3B:
		push	di
		push	[bp+var_A]
		call	sub_41495
		add	sp, 4
		inc	di

loc_81F48:
		cmp	di, 2
		jb	short loc_81F3B

loc_81F4D:
		push	0
		lea	ax, [bp+var_34]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_282]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10003h
		push	0Ah
		lea	ax, word ptr [bp+var_260]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_4A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_34]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_32]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2C]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_242]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_15], 0
		jnz	short loc_81FD9
		jmp	loc_8241C

loc_81FD9:
		cmp	[bp+var_1A], 0
		jnz	short loc_81FE3
		jmp	loc_8241C

loc_81FE3:
		push	0
		mov	al, [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	loc_8241C
		jmp	loc_8241C

loc_81FFE:
		mov	byte ptr [bp+var_4E], 0
		mov	byte ptr [bp+var_4E+1], 0
		mov	byte ptr [bp+var_4E+2], 0
		push	100h
		push	0
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	sub_46B83
		pop	cx
		push	100h
		push	0
		push	2
		lea	ax, word ptr [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		push	0
		cmp	byte ptr [bp+var_25E+2], 3
		jnz	short loc_8205E
		push	0
		mov	al, byte ptr [bp+var_25E+2]
		push	ax
		push	large [bp+var_260]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_82067

loc_8205E:
		mov	edx, [bp+var_25E]
		mov	ax, word ptr [bp+var_260]

loc_82067:
		push	dx
		push	ax
		push	large 180000h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	100h
		push	0
		push	2
		lea	ax, word ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		call	sub_46F0A
		add	sp, 0Ah
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	sub_46E08
		pop	cx
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_820AE
		jmp	loc_82164

loc_820AE:
		cmp	[bp+var_1], 0
		jz	short loc_820C8
		jmp	short loc_820C3

loc_820B6:
		push	di
		push	[bp+var_A]
		call	sub_41495
		add	sp, 4
		inc	di

loc_820C3:
		cmp	di, 2
		jb	short loc_820B6

loc_820C8:
		push	0
		lea	ax, [bp+var_34]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_282]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10003h
		push	0Ah
		lea	ax, word ptr [bp+var_260]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_4A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_34]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_32]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2C]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_242]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_15], 0
		jnz	short loc_82154
		jmp	loc_8241C

loc_82154:
		cmp	[bp+var_1A], 0
		jnz	short loc_8215E
		jmp	loc_8241C

loc_8215E:
		jmp	loc_81FE3
		jmp	loc_8241C

loc_82164:
		mov	byte ptr [bp+var_4E], 0
		mov	byte ptr [bp+var_4E+1], 0
		mov	byte ptr [bp+var_4E+2], 0
		push	100h
		push	0
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	sub_46B83
		pop	cx
		cmp	[bp+var_1], 0
		jz	short loc_821B2
		push	di
		push	[bp+var_A]
		call	sub_41495
		add	sp, 4
		inc	di
		push	large 0FFh
		push	0
		push	di
		push	[bp+var_A]
		call	sub_4163D
		add	sp, 0Ah

loc_821B2:
		xor	si, si
		jmp	loc_822A4

loc_821B7:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_260]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	[bp+var_56], ax
		push	ax
		lea	ax, [bp+var_282]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_821EE

loc_821E3:
		lea	ax, [bp+var_282]
		push	ax
		call	sub_1EED1
		pop	cx

loc_821EE:
		push	[bp+var_56]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_821E3
		push	[bp+var_56]
		lea	ax, [bp+var_282]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	[bp+var_56], 0
		jz	short loc_82224
		push	3
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_82224

loc_82224:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_25B]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_8226F
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_260]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_8226F
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_25E+2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_260]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8226F

loc_8226F:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_260]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_25B]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_25A]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_822A4:
		cmp	si, 3
		jge	short loc_822AC
		jmp	loc_821B7

loc_822AC:
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	[bp+var_1], 0
		jz	short loc_822C9
		push	di
		push	[bp+var_A]
		call	sub_41495
		add	sp, 4
		inc	di

loc_822C9:
		cmp	byte_603DE, 0
		jnz	short loc_822D3
		jmp	loc_82389

loc_822D3:
		cmp	[bp+var_1], 0
		jz	short loc_822ED
		jmp	short loc_822E8

loc_822DB:
		push	di
		push	[bp+var_A]
		call	sub_41495
		add	sp, 4
		inc	di

loc_822E8:
		cmp	di, 2
		jb	short loc_822DB

loc_822ED:
		push	0
		lea	ax, [bp+var_34]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_282]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10003h
		push	0Ah
		lea	ax, word ptr [bp+var_260]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_4A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_34]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_32]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2C]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_242]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_15], 0
		jnz	short loc_82379
		jmp	loc_8241C

loc_82379:
		cmp	[bp+var_1A], 0
		jnz	short loc_82383
		jmp	loc_8241C

loc_82383:
		jmp	loc_81FE3
		jmp	loc_8241C

loc_82389:
		push	0
		lea	ax, [bp+var_282]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	0
		lea	ax, [bp+var_34]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10003h
		push	0Ah
		lea	ax, word ptr [bp+var_260]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_4A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_34]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_32]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2C]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_242]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_15], 0
		jz	short loc_8241C
		cmp	[bp+var_1A], 0
		jz	short loc_8241C
		jmp	loc_81FE3

loc_8241C:
		mov	[bp+var_1A], 0
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		lea	ax, [bp+var_10]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_22A]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1B2]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_13A]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_72]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_64]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_819A0		endp
ovr231		ends
