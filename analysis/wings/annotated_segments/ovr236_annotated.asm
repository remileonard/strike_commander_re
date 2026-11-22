ovr236		segment	para public 'OVERLAY' use16
		assume cs:ovr236
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_868D0		proc far

var_A04		= word ptr -0A04h
var_9E2		= word ptr -9E2h
var_9E0		= word ptr -9E0h
var_9DE		= word ptr -9DEh
var_9DC		= word ptr -9DCh
var_9DA		= dword ptr -9DAh
var_9D6		= byte ptr -9D6h
var_9D4		= word ptr -9D4h
var_9D2		= word ptr -9D2h
var_9C4		= dword ptr -9C4h
var_9C0		= byte ptr -9C0h
var_9BF		= byte ptr -9BFh
var_9BE		= dword ptr -9BEh
var_1B7		= dword ptr -1B7h
var_1B3		= dword ptr -1B3h
var_1AE		= word ptr -1AEh
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
var_52		= dword ptr -52h
var_4E		= byte ptr -4Eh
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= byte ptr -34h
var_32		= dword ptr -32h
var_2E		= byte ptr -2Eh
var_2D		= byte ptr -2Dh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= byte ptr -24h
var_23		= byte ptr -23h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 0A04h
		push	si
		mov	[bp+var_1], 0
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
		mov	[bp+var_5A], 0
		mov	[bp+var_58], 13Fh
		mov	[bp+var_56], 0C7h
		push	ds
		push	offset aPak
		push	ds
		push	offset aMIDGAM12
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
		push	offset aCestalk_2
		push	ds
		push	offset aDataCestalk_2
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_1AE]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_16], 0
		mov	[bp+var_14], 98h
		mov	[bp+var_12], 13Fh
		mov	[bp+var_10], 0C7h
		push	2F8h
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jz	short loc_869D0
		xor	si, si
		jmp	short loc_86A09

loc_869D0:
		push	2F9h
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jz	short loc_869E2
		mov	si, 2
		jmp	short loc_86A09

loc_869E2:
		push	2FAh
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jz	short loc_869F4
		mov	si, 4
		jmp	short loc_86A09

loc_869F4:
		push	2FBh
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jz	short loc_86A06
		mov	si, 6
		jmp	short loc_86A09

loc_86A06:
		mov	si, 8

loc_86A09:
		push	100h
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_52], 0
		mov	[bp+var_4E], 2
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		push	2
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	si
		lea	ax, [bp+var_136]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_52]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_LoadAndUpload_46E20
		add	sp, 4
		cmp	[bp+var_4D], 0
		jz	short loc_86A7A
		cmp	[bp+var_52], 0
		jz	short loc_86A7A
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_86A7A

loc_86A7A:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_4D], 0
		jz	short loc_86AB2
		cmp	[bp+var_52], 0
		jz	short loc_86AB2
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_86AB2

loc_86AB2:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		lea	ax, [bp+var_1E]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	0
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_LoadTune_13AF4
		add	sp, 4
		mov	[bp+var_9D4], 1D6Bh
		mov	[bp+var_9C4], 0
		mov	[bp+var_9C0], 2
		mov	[bp+var_9BF], 0
		mov	[bp+var_9BE], 0
		mov	[bp+var_9D2], 0
		mov	[bp+var_9D4], 1D7Bh
		xor	eax, eax
		mov	[bp+var_1B7], eax
		mov	[bp+var_1B3], eax
		mov	[bp+var_28], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		mov	[bp+var_32], 0
		mov	[bp+var_2E], 2
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_9DE], 96Dh
		mov	ax, word_5DD68
		mov	[bp+var_9DC], ax
		lea	ax, [bp+var_9DE]
		mov	word_5DD68, ax
		mov	[bp+var_9DE], 975h
		mov	[bp+var_9DA], 0
		mov	[bp+var_9D6], 0
		mov	[bp+var_9E2], 0
		mov	[bp+var_9E0], 0FFFFh
		cmp	[bp+var_1], 0
		jz	short loc_86B94
		push	word_5CF9D
		lea	ax, [bp+var_9E2]
		push	ax
		call	sub_1A714
		add	sp, 4

loc_86B94:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	byte ptr [bp+var_36], 0
		mov	byte ptr [bp+var_36+1], 0
		mov	[bp+var_34], 0
		push	100h
		push	0
		lea	ax, [bp+var_36]
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
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		mov	[bp+var_48], 0
		mov	[bp+var_44], 2
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	3
		lea	ax, word ptr [bp+var_48]
		push	ax
		mov	ax, si
		inc	ax
		push	ax
		lea	ax, [bp+var_136]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, [bp+var_60]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_A04]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	large 0
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	si, ax
		push	ax
		lea	ax, [bp+var_A04]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_86C7E

loc_86C73:
		lea	ax, [bp+var_A04]
		push	ax
		call	sub_1EED1
		pop	cx

loc_86C7E:
		push	si
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_86C73
		push	si
		lea	ax, [bp+var_A04]
		push	ax
		call	sub_45B7D
		add	sp, 4
		or	si, si
		jz	short loc_86CA9
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_86CA9

loc_86CA9:
		cmp	[bp+var_43], 0
		jz	short loc_86CCD
		cmp	[bp+var_48], 0
		jz	short loc_86CCD
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_86CCD

loc_86CCD:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	byte_603DE, 0
		jnz	short loc_86CEB
		jmp	loc_86DFF

loc_86CEB:
		push	0
		lea	ax, [bp+var_A04]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	[bp+var_43], 0
		jz	short loc_86D1E
		cmp	[bp+var_48], 0
		jz	short loc_86D1E
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_86D1E

loc_86D1E:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_9E2]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_9DE]
		push	ax
		call	sub_19116
		add	sp, 4
		cmp	[bp+var_2D], 0
		jz	short loc_86D70
		cmp	[bp+var_32], 0
		jz	short loc_86D70
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_86D70

loc_86D70:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		cmp	[bp+var_23], 0
		jz	short loc_86DA8
		cmp	[bp+var_28], 0
		jz	short loc_86DA8
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_86DA8

loc_86DA8:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		mov	[bp+var_9D4], 1D6Bh
		lea	ax, [bp+var_9D4]
		push	ax
		call	sub_1AA79
		pop	cx
		cmp	[bp+var_9BF], 0
		jnz	short loc_86DD7
		jmp	loc_86F01

loc_86DD7:
		cmp	[bp+var_9C4], 0
		jnz	short loc_86DE2
		jmp	loc_86F01

loc_86DE2:
		push	0
		mov	al, [bp+var_9C0]
		push	ax
		lea	ax, word ptr [bp+var_9C4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	loc_86F01
		jmp	loc_86F01

loc_86DFF:
		push	0
		lea	ax, [bp+var_A04]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	0
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_13C38
		add	sp, 4
		cmp	[bp+var_43], 0
		jz	short loc_86E40
		cmp	[bp+var_48], 0
		jz	short loc_86E40
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_86E40

loc_86E40:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_9E2]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_9DE]
		push	ax
		call	sub_19116
		add	sp, 4
		cmp	[bp+var_2D], 0
		jz	short loc_86E92
		cmp	[bp+var_32], 0
		jz	short loc_86E92
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_86E92

loc_86E92:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		cmp	[bp+var_23], 0
		jz	short loc_86ECA
		cmp	[bp+var_28], 0
		jz	short loc_86ECA
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_86ECA

loc_86ECA:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		mov	[bp+var_9D4], 1D6Bh
		lea	ax, [bp+var_9D4]
		push	ax
		call	sub_1AA79
		pop	cx
		cmp	[bp+var_9BF], 0
		jz	short loc_86F01
		cmp	[bp+var_9C4], 0
		jz	short loc_86F01
		jmp	loc_86DE2

loc_86F01:
		mov	[bp+var_9C4], 0
		mov	[bp+var_9BF], 0
		mov	[bp+var_9BE], 0
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
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
		pop	si
		leave
		retf
sub_868D0		endp
ovr236		ends
