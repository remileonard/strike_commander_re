ovr232		segment	para public 'OVERLAY' use16
		assume cs:ovr232
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_82490		proc far

var_A3E		= word ptr -0A3Eh
var_A1C		= word ptr -0A1Ch
var_A18		= word ptr -0A18h
var_A17		= word ptr -0A17h
var_A16		= word ptr -0A16h
var_9E0		= word ptr -9E0h
var_9DE		= word ptr -9DEh
var_9DC		= word ptr -9DCh
var_9DA		= word ptr -9DAh
var_9D8		= dword ptr -9D8h
var_9D4		= byte ptr -9D4h
var_9D2		= word ptr -9D2h
var_9D0		= word ptr -9D0h
var_9C2		= dword ptr -9C2h
var_9BE		= byte ptr -9BEh
var_9BD		= byte ptr -9BDh
var_9BC		= dword ptr -9BCh
var_1B5		= dword ptr -1B5h
var_1B1		= dword ptr -1B1h
var_1AC		= word ptr -1ACh
var_134		= word ptr -134h
var_BC		= word ptr -0BCh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_50		= dword ptr -50h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= word ptr -34h
var_32		= byte ptr -32h
var_30		= dword ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= byte ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0A3Eh
		push	si
		push	di
		mov	ax, word_5DD44
		mov	[bp+var_2], ax
		mov	[bp+var_5E], 0
		mov	[bp+var_5C], 0
		push	ax
		lea	ax, [bp+var_5E]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_6C], 0
		mov	[bp+var_6A], 0
		mov	[bp+var_68], 0
		mov	[bp+var_66], 0
		mov	[bp+var_64], 13Fh
		mov	[bp+var_62], 0C7h
		push	0
		lea	ax, [bp+var_6C]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_469A5
		add	sp, 4
		mov	[bp+var_5A], 0
		mov	[bp+var_58], 0
		mov	[bp+var_56], 13Fh
		mov	[bp+var_54], 0C7h
		push	ds
		push	offset aPak
		push	ds
		push	offset aMIDGAM08
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BC]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_134]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aCestalk_1
		push	ds
		push	offset aDataCestalk_1
		lea	ax, [bp+var_BC]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_1AC]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
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
		push	100h
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_50], 0
		mov	byte ptr [bp+var_4E+2], 2
		mov	byte ptr [bp+var_4E+3], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	0
		lea	ax, [bp+var_134]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_50]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_LoadAndUpload_46E20
		add	sp, 4
		cmp	byte ptr [bp+var_4E+3], 0
		jz	short loc_825EE
		cmp	[bp+var_50], 0
		jz	short loc_825EE
		push	0
		mov	al, byte ptr [bp+var_4E+2]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_825EE

loc_825EE:
		mov	[bp+var_50], 0
		mov	byte ptr [bp+var_4E+3], 0
		mov	[bp+var_4A], 0
		cmp	byte ptr [bp+var_4E+3], 0
		jz	short loc_82626
		cmp	[bp+var_50], 0
		jz	short loc_82626
		push	0
		mov	al, byte ptr [bp+var_4E+2]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_82626

loc_82626:
		mov	[bp+var_50], 0
		mov	byte ptr [bp+var_4E+3], 0
		mov	[bp+var_4A], 0
		lea	ax, [bp+var_1C]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	8
		lea	ax, [bp+var_1C]
		push	ax
		call	Music_LoadTune_13AF4
		add	sp, 4
		mov	[bp+var_9D2], 1D6Bh
		mov	[bp+var_9C2], 0
		mov	[bp+var_9BE], 2
		mov	[bp+var_9BD], 0
		mov	[bp+var_9BC], 0
		mov	[bp+var_9D0], 0
		mov	[bp+var_9D2], 1D7Bh
		xor	eax, eax
		mov	[bp+var_1B5], eax
		mov	[bp+var_1B1], eax
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		mov	[bp+var_30], 0
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		mov	[bp+var_9DC], 96Dh
		mov	ax, word_5DD68
		mov	[bp+var_9DA], ax
		lea	ax, [bp+var_9DC]
		mov	word_5DD68, ax
		mov	[bp+var_9DC], 975h
		mov	[bp+var_9D8], 0
		mov	[bp+var_9D4], 0
		mov	[bp+var_9E0], 0
		mov	[bp+var_9DE], 0FFFFh
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	byte ptr [bp+var_34], 0
		mov	byte ptr [bp+var_34+1], 0
		mov	[bp+var_32], 0
		push	100h
		push	0
		lea	ax, [bp+var_34]
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
		call	sub_1F377
		xor	eax, eax
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10006h
		push	0Ah
		lea	ax, [bp+var_A1C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_46], 0
		mov	byte ptr [bp+var_44+2], 2
		mov	byte ptr [bp+var_44+3], 0
		mov	[bp+var_40], 0
		push	3
		lea	ax, word ptr [bp+var_46]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 7
		push	ax
		lea	ax, [bp+var_134]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		xor	si, si
		jmp	short loc_827B6

loc_82796:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_A1C]
		add	ax, dx
		push	ax
		mov	ax, si
		inc	ax
		push	ax
		lea	ax, [bp+var_134]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_827B6:
		cmp	si, 6
		jl	short loc_82796
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_13BB6
		pop	cx
		lea	ax, [bp+var_5E]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_A3E]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		xor	si, si
		jmp	loc_828E4

loc_82803:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_A1C]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	di, ax
		push	ax
		lea	ax, [bp+var_A3E]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_82839

loc_8282E:
		lea	ax, [bp+var_A3E]
		push	ax
		call	sub_1EED1
		pop	cx

loc_82839:
		push	di
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_8282E
		push	di
		lea	ax, [bp+var_A3E]
		push	ax
		call	sub_45B7D
		add	sp, 4
		or	di, di
		jz	short loc_82864
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_82864

loc_82864:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_A17]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_828AF
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_A1C]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_828AF
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_A18]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_A1C]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_828AF

loc_828AF:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_A1C]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_A17]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_A16]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_828E4:
		cmp	si, 6
		jge	short loc_828EC
		jmp	loc_82803

loc_828EC:
		cmp	byte_603DE, 0
		jnz	short loc_828F6
		jmp	loc_82A25

loc_828F6:
		push	0
		lea	ax, [bp+var_A3E]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	byte ptr [bp+var_44+3], 0
		jz	short loc_82929
		cmp	[bp+var_46], 0
		jz	short loc_82929
		push	0
		mov	al, byte ptr [bp+var_44+2]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_82929

loc_82929:
		mov	[bp+var_46], 0
		mov	byte ptr [bp+var_44+3], 0
		mov	[bp+var_40], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, [bp+var_A1C]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_9E0]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_9DC]
		push	ax
		call	sub_19116
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_82996
		cmp	[bp+var_30], 0
		jz	short loc_82996
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_82996

loc_82996:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	[bp+var_21], 0
		jz	short loc_829CE
		cmp	[bp+var_26], 0
		jz	short loc_829CE
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_829CE

loc_829CE:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		mov	[bp+var_9D2], 1D6Bh
		lea	ax, [bp+var_9D2]
		push	ax
		call	sub_1AA79
		pop	cx
		cmp	[bp+var_9BD], 0
		jnz	short loc_829FD
		jmp	loc_82BBF

loc_829FD:
		cmp	[bp+var_9C2], 0
		jnz	short loc_82A08
		jmp	loc_82BBF

loc_82A08:
		push	0
		mov	al, [bp+var_9BE]
		push	ax
		lea	ax, word ptr [bp+var_9C2]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	loc_82BBF
		jmp	loc_82BBF

loc_82A25:
		push	0
		cmp	byte ptr [bp+var_44+2], 3
		jnz	short loc_82A44
		push	0
		mov	al, byte ptr [bp+var_44+2]
		push	ax
		push	large [bp+var_46]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_82A4B

loc_82A44:
		mov	edx, [bp+var_44]
		mov	ax, word ptr [bp+var_46]

loc_82A4B:
		push	dx
		push	ax
		push	large 0
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		xor	eax, eax
		mov	[bp+var_4A], eax
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], 96h
		mov	eax, dword_5E7D3
		mov	[bp+var_4E], eax
		lea	ax, word ptr [bp+var_4E]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		push	0
		lea	ax, [bp+var_A3E]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_13CEA
		pop	cx
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_13C38
		add	sp, 4
		cmp	byte ptr [bp+var_44+3], 0
		jz	short loc_82AE3
		cmp	[bp+var_46], 0
		jz	short loc_82AE3
		push	0
		mov	al, byte ptr [bp+var_44+2]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_82AE3

loc_82AE3:
		mov	[bp+var_46], 0
		mov	byte ptr [bp+var_44+3], 0
		mov	[bp+var_40], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, [bp+var_A1C]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_9E0]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_9DC]
		push	ax
		call	sub_19116
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_82B50
		cmp	[bp+var_30], 0
		jz	short loc_82B50
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_82B50

loc_82B50:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	[bp+var_21], 0
		jz	short loc_82B88
		cmp	[bp+var_26], 0
		jz	short loc_82B88
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_82B88

loc_82B88:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		mov	[bp+var_9D2], 1D6Bh
		lea	ax, [bp+var_9D2]
		push	ax
		call	sub_1AA79
		pop	cx
		cmp	[bp+var_9BD], 0
		jz	short loc_82BBF
		cmp	[bp+var_9C2], 0
		jz	short loc_82BBF
		jmp	loc_82A08

loc_82BBF:
		mov	[bp+var_9C2], 0
		mov	[bp+var_9BD], 0
		mov	[bp+var_9BC], 0
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_C]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_1AC]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_134]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_6]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_6C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_5E]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_82490		endp
ovr232		ends
