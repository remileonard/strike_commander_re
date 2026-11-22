ovr227		segment	para public 'OVERLAY' use16
		assume cs:ovr227
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7D730		proc far

var_386		= word ptr -386h
var_310		= word ptr -310h
var_2FB		= byte ptr -2FBh
var_2E7		= byte ptr -2E7h
var_2D2		= word ptr -2D2h
var_2D0		= word ptr -2D0h
var_2CE		= word ptr -2CEh
var_2CC		= byte ptr -2CCh
var_2C4		= word ptr -2C4h
var_2A2		= word ptr -2A2h
var_29E		= word ptr -29Eh
var_29D		= word ptr -29Dh
var_29C		= word ptr -29Ch
var_23E		= word ptr -23Eh
var_226		= word ptr -226h
var_1AE		= word ptr -1AEh
var_14D		= dword ptr -14Dh
var_149		= dword ptr -149h
var_141		= word ptr -141h
var_13D		= dword ptr -13Dh
var_136		= word ptr -136h
var_BE		= word ptr -0BEh
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_52		= word ptr -52h
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= byte ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= byte ptr -20h
var_1F		= word ptr -1Fh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 386h
		push	si
		push	di
		mov	[bp+var_1], 0
		cmp	word_5CF9F, 0
		jz	short loc_7D748
		mov	[bp+var_1], 1

loc_7D748:
		mov	ax, word_5DD44
		mov	[bp+var_4], ax
		mov	[bp+var_60], 0
		mov	[bp+var_5E], 0
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_6E], 0
		mov	[bp+var_6C], 0
		mov	[bp+var_6A], 0
		mov	[bp+var_68], 0
		mov	[bp+var_66], 13Fh
		mov	[bp+var_64], 0C7h
		push	0
		lea	ax, [bp+var_6E]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469A5
		add	sp, 4
		mov	[bp+var_5C], 0
		mov	[bp+var_5A], 18h
		mov	[bp+var_58], 13Fh
		mov	[bp+var_56], 97h
		push	ds
		push	offset aPak
		push	ds
		push	offset aMIDGAM03
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_136]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidnoise
		push	ds
		push	offset aDataNoise
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_1AE]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		lea	ax, [bp+var_226]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		cmp	[bp+var_1], 0
		jnz	short loc_7D81A
		jmp	loc_7D8A1

loc_7D81A:
		push	ds
		lea	ax, [bp+var_BE]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_7D8A1
		push	1
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_1AE]
		push	ax
		mov	bx, [bp+var_1AE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	2
		lea	ax, [bp+var_1AE]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_149]
		mov	[bp+var_40], eax
		mov	ax, [bp+var_141]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_7D86D
		mov	eax, [bp+var_14D]
		jmp	short loc_7D872

loc_7D86D:
		mov	eax, [bp+var_13D]

loc_7D872:
		mov	edx, [bp+var_40]
		add	edx, eax
		mov	[bp+var_44], edx
		mov	eax, [bp+var_40]
		cmp	eax, [bp+var_44]
		jz	short loc_7D8A1
		push	0
		push	edx
		push	eax
		lea	ax, [bp+var_1AE]
		push	ax
		lea	ax, [bp+var_226]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		jmp	short loc_7D8A5

loc_7D8A1:
		mov	[bp+var_1], 0

loc_7D8A5:
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		push	ds
		push	offset unk_5CE7A
		push	ds
		push	offset aConvfontShp_2
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_BE]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_1C+2], dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[bp+var_18], eax
		mov	[bp+var_14], 3
		mov	[bp+var_13], 1
		mov	[bp+var_12], 0
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, [bp+var_23E]
		push	ax
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	[bp+var_22], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_46], 0
		mov	byte ptr [bp+var_44+2], 2
		mov	byte ptr [bp+var_44+3], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	1
		lea	ax, [bp+var_136]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_46]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_44+3], 0
		jz	short loc_7D978
		cmp	[bp+var_46], 0
		jz	short loc_7D978
		push	0
		mov	al, byte ptr [bp+var_44+2]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7D978

loc_7D978:
		mov	[bp+var_46], 0
		mov	byte ptr [bp+var_44+3], 0
		mov	[bp+var_40], 0
		cmp	byte ptr [bp+var_44+3], 0
		jz	short loc_7D9B0
		cmp	[bp+var_46], 0
		jz	short loc_7D9B0
		push	0
		mov	al, byte ptr [bp+var_44+2]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7D9B0

loc_7D9B0:
		mov	[bp+var_46], 0
		mov	byte ptr [bp+var_44+3], 0
		mov	[bp+var_40], 0
		lea	ax, [bp+var_24]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	0Dh
		lea	ax, [bp+var_24]
		push	ax
		call	Music_LoadTune_13AF4
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_7D9E8
		mov	ax, word_5CF9F
		mov	[bp+var_26], ax

loc_7D9E8:
		mov	di, 0Bh
		cmp	[bp+var_1], 0
		jz	short loc_7DA11
		xor	si, si
		jmp	short loc_7DA0C

loc_7D9F5:
		push	si
		lea	ax, [bp+var_226]
		push	ax
		mov	ax, si
		add	ax, di
		push	ax
		push	[bp+var_26]
		call	sub_412F9
		add	sp, 8
		inc	si

loc_7DA0C:
		cmp	si, 2
		jl	short loc_7D9F5

loc_7DA11:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	byte ptr [bp+var_2A], 0
		mov	byte ptr [bp+var_2A+1], 0
		mov	[bp+var_28], 0
		push	100h
		push	0
		lea	ax, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_FillRange_46CC8
		add	sp, 8
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		call	sub_1F377
		xor	eax, eax
		mov	[bp+var_2E], eax
		mov	[bp+var_32], eax
		mov	[bp+var_3C], 0
		mov	byte ptr [bp+var_3A+2], 2
		mov	byte ptr [bp+var_3A+3], 0
		mov	[bp+var_36], 0
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_2A2]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	3
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		xor	si, si
		jmp	short loc_7DAD3

loc_7DAB1:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2A2]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		lea	ax, [bp+var_136]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7DAD3:
		cmp	si, 0Ah
		jl	short loc_7DAB1
		lea	ax, [bp+var_60]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13BB6
		pop	cx
		mov	word ptr [bp+var_40+2], 52h
		mov	byte ptr [bp+var_310], 0
		mov	byte ptr [bp+var_310+1], 0
		mov	[bp+var_2FB], 0
		mov	[bp+var_2E7], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_2D2], ax
		mov	ax, [bp+arg_0]
		mov	[bp+var_2D0], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_2CE], ax
		mov	[bp+var_2CC], 1
		lea	ax, [bp+var_310]
		push	ax
		lea	ax, [bp+var_2D2]
		push	ax
		push	word ptr [bp+var_40+2]
		lea	ax, [bp+var_386]
		push	ax
		call	sub_14085
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_386]
		push	ax
		call	Conv_PlayScript_14F62
		pop	cx
		push	2
		lea	ax, [bp+var_386]
		push	ax
		call	sub_141F1
		add	sp, 4
		cmp	byte_603DE, 0
		jnz	short loc_7DB77
		jmp	loc_7DC56

loc_7DB77:
		cmp	[bp+var_1], 0
		jz	short loc_7DB91
		jmp	short loc_7DB8C

loc_7DB7F:
		push	di
		push	[bp+var_26]
		call	sub_41495
		add	sp, 4
		inc	di

loc_7DB8C:
		cmp	di, 2
		jb	short loc_7DB7F

loc_7DB91:
		push	0
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_2C4]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_2A2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	byte ptr [bp+var_3A+3], 0
		jz	short loc_7DBED
		cmp	[bp+var_3C], 0
		jz	short loc_7DBED
		push	0
		mov	al, byte ptr [bp+var_3A+2]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7DBED

loc_7DBED:
		mov	[bp+var_3C], 0
		mov	byte ptr [bp+var_3A+3], 0
		mov	[bp+var_36], 0
		push	2
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_23E]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jnz	short loc_7DC31
		jmp	loc_7E34D

loc_7DC31:
		cmp	[bp+var_18], 0
		jnz	short loc_7DC3B
		jmp	loc_7E34D

loc_7DC3B:
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	loc_7E34D
		jmp	loc_7E34D

loc_7DC56:
		mov	byte ptr [bp+var_40], 0
		mov	byte ptr [bp+var_40+1], 0
		mov	byte ptr [bp+var_40+2], 0
		push	100h
		push	0
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	sub_46B83
		pop	cx
		push	100h
		push	0
		lea	ax, word ptr [bp+var_4E+2]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, word ptr [bp+var_4E+2]
		push	ax
		call	sub_46B83
		pop	cx
		push	100h
		push	0
		push	1
		lea	ax, word ptr [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		cmp	byte ptr [bp+var_3A+2], 3
		jnz	short loc_7DCDC
		push	0
		mov	al, byte ptr [bp+var_3A+2]
		push	ax
		push	large [bp+var_3C]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7DCE3

loc_7DCDC:
		mov	edx, [bp+var_3A]
		mov	ax, word ptr [bp+var_3C]

loc_7DCE3:
		push	dx
		push	ax
		push	large 0
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	100h
		push	0
		push	1
		lea	ax, word ptr [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_4E+2]
		push	ax
		call	sub_46F0A
		add	sp, 0Ah
		lea	ax, word ptr [bp+var_4E+2]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		mov	word ptr [bp+var_40+2], 0BAh
		mov	byte ptr [bp+var_310], 0
		mov	byte ptr [bp+var_310+1], 0
		mov	[bp+var_2FB], 0
		mov	[bp+var_2E7], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_2D2], ax
		mov	ax, [bp+arg_0]
		mov	[bp+var_2D0], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_2CE], ax
		mov	[bp+var_2CC], 3
		lea	ax, [bp+var_310]
		push	ax
		lea	ax, [bp+var_2D2]
		push	ax
		push	word ptr [bp+var_40+2]
		lea	ax, [bp+var_386]
		push	ax
		call	sub_14085
		add	sp, 8
		lea	ax, [bp+var_386]
		push	ax
		call	Conv_PlayScript_14F62
		pop	cx
		push	2
		lea	ax, [bp+var_386]
		push	ax
		call	sub_141F1
		add	sp, 4
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		mov	byte ptr [bp+var_40], 0
		mov	byte ptr [bp+var_40+1], 0
		mov	byte ptr [bp+var_40+2], 0
		push	100h
		push	0
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	sub_46B83
		pop	cx
		xor	si, si
		jmp	loc_7DEC2

loc_7DDD5:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2A2]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	[bp+var_52], ax
		push	ax
		lea	ax, [bp+var_2C4]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_7DE0C

loc_7DE01:
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7DE0C:
		push	[bp+var_52]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_7DE01
		push	[bp+var_52]
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	[bp+var_52], 0
		jz	short loc_7DE42
		push	3
		push	[bp+var_52]
		mov	bx, [bp+var_52]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7DE42

loc_7DE42:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_29D]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7DE8D
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2A2]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7DE8D
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_29E]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2A2]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7DE8D

loc_7DE8D:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2A2]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_29D]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_29C]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7DEC2:
		cmp	si, 8
		jge	short loc_7DECA
		jmp	loc_7DDD5

loc_7DECA:
		xor	eax, eax
		mov	[bp+var_4A], eax
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], 3Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_4E], eax
		cmp	[bp+var_1], 0
		jz	short loc_7DEFF
		push	large 0FFh
		push	large 0Bh
		push	[bp+var_26]
		call	sub_4163D
		add	sp, 0Ah

loc_7DEFF:
		lea	ax, word ptr [bp+var_4E]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		push	14h
		lea	ax, [bp+var_2C4]
		push	ax
		call	Scene_SetFps_45DE3
		add	sp, 4
		mov	[bp+var_4F], 0
		mov	si, 8
		jmp	loc_7E044

loc_7DF22:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2A2]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	[bp+var_52], ax
		push	ax
		lea	ax, [bp+var_2C4]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_7DF8E

loc_7DF4E:
		cmp	[bp+var_1], 0
		jz	short loc_7DF83
		mov	al, [bp+var_4F]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7DF83
		cmp	si, 9
		jnz	short loc_7DF83
		mov	bx, [bp+var_52]
		cmp	word ptr [bx+1Bh], 1
		jnz	short loc_7DF83
		push	large 0FFh
		push	large 0Ch
		push	[bp+var_26]
		call	sub_4163D
		add	sp, 0Ah
		mov	[bp+var_4F], 1

loc_7DF83:
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7DF8E:
		push	[bp+var_52]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_7DF4E
		push	[bp+var_52]
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	[bp+var_52], 0
		jz	short loc_7DFC4
		push	3
		push	[bp+var_52]
		mov	bx, [bp+var_52]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7DFC4

loc_7DFC4:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_29D]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7E00F
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2A2]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7E00F
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_29E]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2A2]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7E00F

loc_7E00F:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2A2]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_29D]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_29C]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7E044:
		cmp	si, 0Ah
		jge	short loc_7E04C
		jmp	loc_7DF22

loc_7E04C:
		push	100h
		push	0
		push	2
		lea	ax, word ptr [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_7E077
		jmp	loc_7E141

loc_7E077:
		cmp	[bp+var_1], 0
		jz	short loc_7E091
		jmp	short loc_7E08C

loc_7E07F:
		push	di
		push	[bp+var_26]
		call	sub_41495
		add	sp, 4
		inc	di

loc_7E08C:
		cmp	di, 2
		jb	short loc_7E07F

loc_7E091:
		push	0
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_2C4]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_2A2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	byte ptr [bp+var_3A+3], 0
		jz	short loc_7E0ED
		cmp	[bp+var_3C], 0
		jz	short loc_7E0ED
		push	0
		mov	al, byte ptr [bp+var_3A+2]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7E0ED

loc_7E0ED:
		mov	[bp+var_3C], 0
		mov	byte ptr [bp+var_3A+3], 0
		mov	[bp+var_36], 0
		push	2
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_23E]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jnz	short loc_7E131
		jmp	loc_7E34D

loc_7E131:
		cmp	[bp+var_18], 0
		jnz	short loc_7E13B
		jmp	loc_7E34D

loc_7E13B:
		jmp	loc_7DC3B
		jmp	loc_7E34D

loc_7E141:
		mov	byte ptr [bp+var_40+3], 0BBh
		mov	byte ptr [bp+var_310], 0
		mov	byte ptr [bp+var_310+1], 0
		mov	[bp+var_2FB], 0
		mov	[bp+var_2E7], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_2D2], ax
		mov	ax, [bp+arg_0]
		mov	[bp+var_2D0], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_2CE], ax
		mov	[bp+var_2CC], 1
		lea	ax, [bp+var_310]
		push	ax
		lea	ax, [bp+var_2D2]
		push	ax
		mov	al, byte ptr [bp+var_40+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_386]
		push	ax
		call	sub_14085
		add	sp, 8
		lea	ax, [bp+var_386]
		push	ax
		call	Conv_PlayScript_14F62
		pop	cx
		push	2
		lea	ax, [bp+var_386]
		push	ax
		call	sub_141F1
		add	sp, 4
		cmp	byte_603DE, 0
		jnz	short loc_7E1B4
		jmp	loc_7E27E

loc_7E1B4:
		cmp	[bp+var_1], 0
		jz	short loc_7E1CE
		jmp	short loc_7E1C9

loc_7E1BC:
		push	di
		push	[bp+var_26]
		call	sub_41495
		add	sp, 4
		inc	di

loc_7E1C9:
		cmp	di, 2
		jb	short loc_7E1BC

loc_7E1CE:
		push	0
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_2C4]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_2A2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	byte ptr [bp+var_3A+3], 0
		jz	short loc_7E22A
		cmp	[bp+var_3C], 0
		jz	short loc_7E22A
		push	0
		mov	al, byte ptr [bp+var_3A+2]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7E22A

loc_7E22A:
		mov	[bp+var_3C], 0
		mov	byte ptr [bp+var_3A+3], 0
		mov	[bp+var_36], 0
		push	2
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_23E]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jnz	short loc_7E26E
		jmp	loc_7E34D

loc_7E26E:
		cmp	[bp+var_18], 0
		jnz	short loc_7E278
		jmp	loc_7E34D

loc_7E278:
		jmp	loc_7DC3B
		jmp	loc_7E34D

loc_7E27E:
		push	0
		lea	ax, [bp+var_2C4]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_7E2A7
		jmp	short loc_7E2A2

loc_7E295:
		push	di
		push	[bp+var_26]
		call	sub_41495
		add	sp, 4
		inc	di

loc_7E2A2:
		cmp	di, 2
		jb	short loc_7E295

loc_7E2A7:
		push	0
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_2A2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	byte ptr [bp+var_3A+3], 0
		jz	short loc_7E302
		cmp	[bp+var_3C], 0
		jz	short loc_7E302
		push	0
		mov	al, byte ptr [bp+var_3A+2]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7E302

loc_7E302:
		mov	[bp+var_3C], 0
		mov	byte ptr [bp+var_3A+3], 0
		mov	[bp+var_36], 0
		push	2
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_23E]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7E34D
		cmp	[bp+var_18], 0
		jz	short loc_7E34D
		jmp	loc_7DC3B

loc_7E34D:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_226]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1AE]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_136]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_6E]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_60]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_7D730		endp
ovr227		ends
