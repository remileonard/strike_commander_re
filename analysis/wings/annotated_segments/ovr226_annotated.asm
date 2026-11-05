ovr226		segment	para public 'OVERLAY' use16
		assume cs:ovr226
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7CEC0		proc far

var_120		= word ptr -120h
var_A8		= word ptr -0A8h
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_3C		= dword ptr -3Ch
var_38		= byte ptr -38h
var_37		= byte ptr -37h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= byte ptr -14h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_F		= word ptr -0Fh
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_6		= word ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 120h
		mov	ax, word_5DD44
		mov	[bp+var_2], ax
		mov	[bp+var_4A], 0
		mov	[bp+var_48], 0
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_58], 0
		mov	[bp+var_56], 0
		mov	[bp+var_54], 0
		mov	[bp+var_52], 0
		mov	[bp+var_50], 13Fh
		mov	[bp+var_4E], 0C7h
		push	0
		lea	ax, [bp+var_58]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_469A5
		add	sp, 4
		push	ds
		push	offset aPak
		push	ds
		push	offset aOrigin
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_A8]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_120]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_12], 0
		mov	[bp+var_F], 0
		mov	byte ptr [bp+var_16], 0
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		mov	[bp+var_3C], 0
		mov	[bp+var_38], 2
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		push	2
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	0
		lea	ax, [bp+var_120]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_3C]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	[bp+var_37], 0
		jz	short loc_7CFD5
		cmp	[bp+var_3C], 0
		jz	short loc_7CFD5
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7CFD5

loc_7CFD5:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_FillRange_46CC8
		add	sp, 8
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		mov	[bp+var_20], 0
		mov	byte ptr [bp+var_1E+2], 2
		mov	byte ptr [bp+var_1E+3], 0
		mov	[bp+var_1A], 0
		push	2
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	1
		lea	ax, [bp+var_120]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	0
		cmp	byte ptr [bp+var_1E+2], 3
		jnz	short loc_7D06D
		push	0
		mov	al, byte ptr [bp+var_1E+2]
		push	ax
		push	large [bp+var_20]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7D074

loc_7D06D:
		mov	edx, [bp+var_1E]
		mov	ax, word ptr [bp+var_20]

loc_7D074:
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		mov	[bp+var_2A], 0
		mov	byte ptr [bp+var_28+2], 2
		mov	byte ptr [bp+var_28+3], 0
		mov	[bp+var_24], 0
		push	2
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	2
		lea	ax, [bp+var_120]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	[bp+var_12]
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		push	100h
		push	0
		push	3
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_46F0A
		add	sp, 0Ah
		xor	eax, eax
		mov	[bp+var_2E], eax
		mov	[bp+var_32], eax
		mov	[bp+var_2E], 32h
		mov	eax, dword_5E7D3
		mov	[bp+var_32], eax
		jmp	short loc_7D179

loc_7D0FD:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_7D179
		cmp	byte_603DE, 0
		jnz	short loc_7D113
		jmp	loc_7D198

loc_7D113:
		cmp	byte ptr [bp+var_28+3], 0
		jz	short loc_7D137
		cmp	[bp+var_2A], 0
		jz	short loc_7D137
		push	0
		mov	al, byte ptr [bp+var_28+2]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7D137

loc_7D137:
		mov	[bp+var_2A], 0
		mov	byte ptr [bp+var_28+3], 0
		mov	[bp+var_24], 0
		cmp	byte ptr [bp+var_1E+3], 0
		jnz	short loc_7D154
		jmp	loc_7D313

loc_7D154:
		cmp	[bp+var_20], 0
		jnz	short loc_7D15E
		jmp	loc_7D313

loc_7D15E:
		push	0
		mov	al, byte ptr [bp+var_1E+2]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	loc_7D313
		jmp	loc_7D313

loc_7D179:
		mov	eax, [bp+var_32]
		add	eax, [bp+var_2E]
		cmp	eax, dword_5E7D3
		ja	short loc_7D18D
		mov	ax, 1
		jmp	short loc_7D18F

loc_7D18D:
		xor	ax, ax

loc_7D18F:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7D198
		jmp	loc_7D0FD

loc_7D198:
		push	100h
		push	0
		push	3
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		push	0
		cmp	byte ptr [bp+var_28+2], 3
		jnz	short loc_7D1CE
		push	0
		mov	al, byte ptr [bp+var_28+2]
		push	ax
		push	large [bp+var_2A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7D1D5

loc_7D1CE:
		mov	edx, [bp+var_28]
		mov	ax, word ptr [bp+var_2A]

loc_7D1D5:
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		push	[bp+var_12]
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		push	100h
		push	0
		push	3
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_46F0A
		add	sp, 0Ah
		mov	[bp+var_2E], 32h
		mov	eax, dword_5E7D3
		mov	[bp+var_32], eax
		jmp	short loc_7D28A

loc_7D226:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_7D28A
		cmp	byte_603DE, 0
		jz	short loc_7D2A6
		cmp	byte ptr [bp+var_28+3], 0
		jz	short loc_7D25D
		cmp	[bp+var_2A], 0
		jz	short loc_7D25D
		push	0
		mov	al, byte ptr [bp+var_28+2]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7D25D

loc_7D25D:
		mov	[bp+var_2A], 0
		mov	byte ptr [bp+var_28+3], 0
		mov	[bp+var_24], 0
		cmp	byte ptr [bp+var_1E+3], 0
		jnz	short loc_7D27A
		jmp	loc_7D313

loc_7D27A:
		cmp	[bp+var_20], 0
		jnz	short loc_7D284
		jmp	loc_7D313

loc_7D284:
		jmp	loc_7D15E
		jmp	loc_7D313

loc_7D28A:
		mov	eax, [bp+var_32]
		add	eax, [bp+var_2E]
		cmp	eax, dword_5E7D3
		ja	short loc_7D29E
		mov	ax, 1
		jmp	short loc_7D2A0

loc_7D29E:
		xor	ax, ax

loc_7D2A0:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7D226

loc_7D2A6:
		push	100h
		push	0
		push	3
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		cmp	byte ptr [bp+var_28+3], 0
		jz	short loc_7D2EF
		cmp	[bp+var_2A], 0
		jz	short loc_7D2EF
		push	0
		mov	al, byte ptr [bp+var_28+2]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7D2EF

loc_7D2EF:
		mov	[bp+var_2A], 0
		mov	byte ptr [bp+var_28+3], 0
		mov	[bp+var_24], 0
		cmp	byte ptr [bp+var_1E+3], 0
		jz	short loc_7D313
		cmp	[bp+var_20], 0
		jz	short loc_7D313
		jmp	loc_7D15E

loc_7D313:
		mov	[bp+var_20], 0
		mov	byte ptr [bp+var_1E+3], 0
		mov	[bp+var_1A], 0
		lea	ax, [bp+var_12]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_C]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_120]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_6]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_58]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_4A]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		leave
		retf
sub_7CEC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7D36A		proc far

var_156		= word ptr -156h
var_152		= word ptr -152h
var_151		= word ptr -151h
var_150		= word ptr -150h
var_124		= word ptr -124h
var_102		= word ptr -102h
var_8A		= word ptr -8Ah
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_1E		= dword ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_F		= word ptr -0Fh
var_C		= word ptr -0Ch
var_6		= word ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 156h
		push	si
		push	di
		mov	ax, word_5DD44
		mov	[bp+var_2], ax
		mov	[bp+var_2C], 0
		mov	[bp+var_2A], 0
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_3A], 0
		mov	[bp+var_38], 0
		mov	[bp+var_36], 0
		mov	[bp+var_34], 0
		mov	[bp+var_32], 13Fh
		mov	[bp+var_30], 0C7h
		push	0
		lea	ax, [bp+var_3A]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_469A5
		add	sp, 4
		mov	[bp+var_28], 0
		mov	[bp+var_26], 0
		mov	[bp+var_24], 13Fh
		mov	[bp+var_22], 0C7h
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgam02
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_8A]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_12], 0
		mov	[bp+var_F], 0
		mov	[bp+var_1E], 0
		mov	byte ptr [bp+var_1C+2], 2
		mov	byte ptr [bp+var_1C+3], 0
		mov	[bp+var_18], 0
		push	2
		lea	ax, word ptr [bp+var_1E]
		push	ax
		push	0
		lea	ax, [bp+var_102]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_1E]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_1C+3], 0
		jz	short loc_7D489
		cmp	[bp+var_1E], 0
		jz	short loc_7D489
		push	0
		mov	al, byte ptr [bp+var_1C+2]
		push	ax
		lea	ax, word ptr [bp+var_1E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7D489

loc_7D489:
		mov	[bp+var_1E], 0
		mov	byte ptr [bp+var_1C+3], 0
		mov	[bp+var_18], 0
		lea	ax, [bp+var_14]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	0Ch
		lea	ax, [bp+var_14]
		push	ax
		call	Music_LoadTune_13AF4
		add	sp, 4
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		call	sub_1F377
		lea	ax, [bp+var_2C]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_124]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		push	0
		push	[bp+var_12]
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_156]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		xor	si, si
		jmp	short loc_7D532

loc_7D512:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_156]
		add	ax, dx
		push	ax
		mov	ax, si
		inc	ax
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7D532:
		cmp	si, 5
		jl	short loc_7D512
		lea	ax, [bp+var_14]
		push	ax
		call	sub_13BB6
		pop	cx
		xor	si, si
		jmp	loc_7D627

loc_7D546:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_156]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	di, ax
		push	ax
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_7D57C

loc_7D571:
		lea	ax, [bp+var_124]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7D57C:
		push	di
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_7D571
		push	di
		lea	ax, [bp+var_124]
		push	ax
		call	sub_45B7D
		add	sp, 4
		or	di, di
		jz	short loc_7D5A7
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7D5A7

loc_7D5A7:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_151]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7D5F2
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_156]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7D5F2
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_152]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_156]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7D5F2

loc_7D5F2:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_156]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_151]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_150]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7D627:
		cmp	si, 5
		jge	short loc_7D62F
		jmp	loc_7D546

loc_7D62F:
		xor	eax, eax
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	[bp+var_18], 0C8h
		mov	eax, dword_5E7D3
		mov	[bp+var_1C], eax
		jmp	short loc_7D684

loc_7D64C:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jz	short loc_7D684
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_156]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	0
		lea	ax, [bp+var_124]
		push	ax
		call	Scene_Destruct_45CB8
		jmp	short loc_7D6D5

loc_7D684:
		mov	eax, [bp+var_1C]
		add	eax, [bp+var_18]
		cmp	eax, dword_5E7D3
		ja	short loc_7D698
		mov	ax, 1
		jmp	short loc_7D69A

loc_7D698:
		xor	ax, ax

loc_7D69A:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7D64C
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_156]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	0
		lea	ax, [bp+var_124]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	sub_13C38

loc_7D6D5:
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_12]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_C]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_102]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_6]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_2C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_7D36A		endp
ovr226		ends
