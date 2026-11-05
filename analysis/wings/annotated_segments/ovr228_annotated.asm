ovr228		segment	para public 'OVERLAY' use16
		assume cs:ovr228
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7E3C0		proc far

var_334		= word ptr -334h
var_2BE		= word ptr -2BEh
var_2A9		= byte ptr -2A9h
var_295		= byte ptr -295h
var_280		= word ptr -280h
var_27E		= word ptr -27Eh
var_27C		= word ptr -27Ch
var_27A		= byte ptr -27Ah
var_272		= word ptr -272h
var_250		= word ptr -250h
var_24C		= word ptr -24Ch
var_24B		= word ptr -24Bh
var_24A		= word ptr -24Ah
var_228		= word ptr -228h
var_1B0		= word ptr -1B0h
var_138		= word ptr -138h
var_C0		= word ptr -0C0h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_54		= word ptr -54h
var_52		= byte ptr -52h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= byte ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= byte ptr -24h
var_20		= word ptr -20h
var_1E		= byte ptr -1Eh
var_1D		= word ptr -1Dh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 334h
		push	si
		push	di
		mov	ax, word_5DD44
		mov	[bp+var_2], ax
		mov	[bp+var_62], 0
		mov	[bp+var_60], 0
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_70], 0
		mov	[bp+var_6E], 0
		mov	[bp+var_6C], 0
		mov	[bp+var_6A], 0
		mov	[bp+var_68], 13Fh
		mov	[bp+var_66], 0C7h
		push	0
		lea	ax, [bp+var_70]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_70]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_469A5
		add	sp, 4
		mov	[bp+var_5E], 0
		mov	[bp+var_5C], 18h
		mov	[bp+var_5A], 13Fh
		mov	[bp+var_58], 97h
		push	ds
		push	offset aPak
		push	ds
		push	offset aMIDGAM04
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_C0]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_138]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwishps
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_C0]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_1B0]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwipals
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_C0]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_228]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_14], 0
		mov	[bp+var_12], 98h
		mov	[bp+var_10], 13Fh
		mov	[bp+var_E], 0C7h
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_7E505
		xor	si, si
		mov	di, 1
		mov	[bp+var_16], 4
		mov	[bp+var_18], 5
		mov	[bp+var_1A], 5
		jmp	short loc_7E51A

loc_7E505:
		mov	si, 5
		mov	di, 6
		mov	[bp+var_16], 4
		mov	[bp+var_18], 0Dh
		mov	[bp+var_1A], 6

loc_7E51A:
		mov	[bp+var_20], 0
		mov	[bp+var_1D], 0
		push	100h
		push	0
		lea	ax, [bp+var_26]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_3E], 0
		mov	byte ptr [bp+var_3C+2], 2
		mov	byte ptr [bp+var_3C+3], 0
		mov	[bp+var_38], 0
		push	2
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	si
		lea	ax, [bp+var_138]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_3E]
		push	ax
		lea	ax, [bp+var_20]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_3C+3], 0
		jz	short loc_7E595
		cmp	[bp+var_3E], 0
		jz	short loc_7E595
		push	0
		mov	al, byte ptr [bp+var_3C+2]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7E595

loc_7E595:
		mov	[bp+var_3E], 0
		mov	byte ptr [bp+var_3C+3], 0
		mov	[bp+var_38], 0
		push	2
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	[bp+var_18]
		lea	ax, [bp+var_228]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_3E]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		call	Palette_LoadAndUpload_46E20
		add	sp, 4
		cmp	byte ptr [bp+var_3C+3], 0
		jz	short loc_7E5F3
		cmp	[bp+var_3E], 0
		jz	short loc_7E5F3
		push	0
		mov	al, byte ptr [bp+var_3C+2]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7E5F3

loc_7E5F3:
		mov	[bp+var_3E], 0
		mov	byte ptr [bp+var_3C+3], 0
		mov	[bp+var_38], 0
		cmp	byte ptr [bp+var_3C+3], 0
		jz	short loc_7E62B
		cmp	[bp+var_3E], 0
		jz	short loc_7E62B
		push	0
		mov	al, byte ptr [bp+var_3C+2]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7E62B

loc_7E62B:
		mov	[bp+var_3E], 0
		mov	byte ptr [bp+var_3C+3], 0
		mov	[bp+var_38], 0
		lea	ax, [bp+var_28]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	0Bh
		lea	ax, [bp+var_28]
		push	ax
		call	sub_13AF4
		add	sp, 4
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	byte ptr [bp+var_2C], 0
		mov	byte ptr [bp+var_2C+1], 0
		mov	[bp+var_2A], 0
		push	100h
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_FillRange_46CC8
		add	sp, 8
		call	sub_1F377
		xor	eax, eax
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_250]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		xor	si, si
		jmp	short loc_7E6D6

loc_7E6B5:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_250]
		add	ax, dx
		push	ax
		mov	ax, di
		add	ax, si
		push	ax
		lea	ax, [bp+var_138]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7E6D6:
		cmp	si, [bp+var_16]
		jl	short loc_7E6B5
		lea	ax, [bp+var_62]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_272]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		lea	ax, [bp+var_28]
		push	ax
		call	sub_13BB6
		pop	cx
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_7E72B
		cmp	byte_603DE, 0
		jz	short loc_7E72B

loc_7E70E:
		push	0
		lea	ax, [bp+var_28]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Destruct_45CB8
		jmp	loc_7EB06

loc_7E72B:
		mov	ax, [bp+arg_6]
		mov	word ptr [bp+var_38+2], ax
		mov	byte ptr [bp+var_2BE], 0
		mov	byte ptr [bp+var_2BE+1], 0
		mov	[bp+var_2A9], 0
		mov	[bp+var_295], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_280], ax
		mov	ax, [bp+arg_0]
		mov	[bp+var_27E], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_27C], ax
		mov	[bp+var_27A], 1
		lea	ax, [bp+var_2BE]
		push	ax
		lea	ax, [bp+var_280]
		push	ax
		push	word ptr [bp+var_38+2]
		lea	ax, [bp+var_334]
		push	ax
		call	sub_14085
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_334]
		push	ax
		call	sub_14F62
		pop	cx
		push	2
		lea	ax, [bp+var_334]
		push	ax
		call	sub_141F1
		add	sp, 4
		cmp	byte_603DE, 0
		jz	short loc_7E7AB
		jmp	loc_7E70E

loc_7E7AB:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_20]
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_20]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		xor	si, si
		jmp	loc_7E8B4

loc_7E7D3:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_250]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	di, ax
		push	ax
		lea	ax, [bp+var_272]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_7E809

loc_7E7FE:
		lea	ax, [bp+var_272]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7E809:
		push	di
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_7E7FE
		push	di
		lea	ax, [bp+var_272]
		push	ax
		call	sub_45B7D
		add	sp, 4
		or	di, di
		jz	short loc_7E834
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7E834

loc_7E834:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_24B]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7E87F
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_250]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7E87F
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_24C]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_250]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7E87F

loc_7E87F:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_250]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_24B]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_24A]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7E8B4:
		cmp	si, [bp+var_16]
		jge	short loc_7E8BC
		jmp	loc_7E7D3

loc_7E8BC:
		xor	eax, eax
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	[bp+var_38], 32h
		mov	eax, dword_5E7D3
		mov	[bp+var_3C], eax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		cmp	byte_603DE, 0
		jz	short loc_7E8EB
		jmp	loc_7E70E

loc_7E8EB:
		mov	[bp+var_3E], 0
		mov	byte ptr [bp+var_3C+2], 2
		mov	byte ptr [bp+var_3C+3], 0
		mov	[bp+var_38], 0
		mov	[bp+var_48], 0
		mov	byte ptr [bp+var_46+2], 2
		mov	byte ptr [bp+var_46+3], 0
		mov	[bp+var_42], 0
		push	3
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	[bp+var_1A]
		lea	ax, [bp+var_1B0]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	7
		lea	ax, [bp+var_1B0]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_26]
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		xor	eax, eax
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	[bp+var_4C], 96h
		mov	eax, dword_5E7D3
		mov	[bp+var_50], eax
		push	0
		cmp	byte ptr [bp+var_3C+2], 3
		jnz	short loc_7E9A3
		push	0
		mov	al, byte ptr [bp+var_3C+2]
		push	ax
		push	large [bp+var_3E]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7E9AA

loc_7E9A3:
		mov	edx, [bp+var_3C]
		mov	ax, word ptr [bp+var_3E]

loc_7E9AA:
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_70]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		mov	si, 105h
		jmp	short loc_7EA07

loc_7E9C0:
		push	si
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_7EA06
		mov	ax, si
		add	ax, 0FEFBh
		push	ax
		cmp	byte ptr [bp+var_46+2], 3
		jnz	short loc_7E9EE
		push	0
		mov	al, byte ptr [bp+var_46+2]
		push	ax
		push	large [bp+var_48]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7E9F5

loc_7E9EE:
		mov	edx, [bp+var_46]
		mov	ax, word ptr [bp+var_48]

loc_7E9F5:
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_70]
		push	ax
		call	sub_4A194
		add	sp, 0Ch

loc_7EA06:
		inc	si

loc_7EA07:
		cmp	si, 10Eh
		jle	short loc_7E9C0
		lea	ax, [bp+var_70]
		push	ax
		push	word_5DD44
		call	UI_ApplyEncodingHelper_47B38
		add	sp, 4
		jmp	short loc_7EA2E

loc_7EA1F:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_7EA4A

loc_7EA2E:
		mov	eax, [bp+var_50]
		add	eax, [bp+var_4C]
		cmp	eax, dword_5E7D3
		ja	short loc_7EA42
		mov	ax, 1
		jmp	short loc_7EA44

loc_7EA42:
		xor	ax, ax

loc_7EA44:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7EA1F

loc_7EA4A:
		mov	byte ptr [bp+var_54], 0
		mov	byte ptr [bp+var_54+1], 0
		mov	[bp+var_52], 0
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		cmp	byte ptr [bp+var_46+3], 0
		jz	short loc_7EA9F
		cmp	[bp+var_48], 0
		jz	short loc_7EA9F
		push	0
		mov	al, byte ptr [bp+var_46+2]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7EA9F

loc_7EA9F:
		mov	[bp+var_48], 0
		mov	byte ptr [bp+var_46+3], 0
		mov	[bp+var_42], 0
		cmp	byte ptr [bp+var_3C+3], 0
		jz	short loc_7EAD7
		cmp	[bp+var_3E], 0
		jz	short loc_7EAD7
		push	0
		mov	al, byte ptr [bp+var_3C+2]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7EAD7

loc_7EAD7:
		mov	[bp+var_3E], 0
		mov	byte ptr [bp+var_3C+3], 0
		mov	[bp+var_38], 0
		push	0
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	3E8h
		lea	ax, [bp+var_28]
		push	ax
		call	sub_13C38

loc_7EB06:
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_250]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_28]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_20]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_C]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_228]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1B0]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_138]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_6]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_70]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_62]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_7E3C0		endp
ovr228		ends
