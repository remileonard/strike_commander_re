ovr192		segment	para public 'OVERLAY' use16
		assume cs:ovr192
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DC70		proc far

var_372		= word ptr -372h
var_34A		= word ptr -34Ah
var_2D3		= word ptr -2D3h
var_25C		= word ptr -25Ch
var_1E5		= word ptr -1E5h
var_16E		= word ptr -16Eh
var_111		= dword ptr -111h
var_10D		= dword ptr -10Dh
var_109		= dword ptr -109h
var_FC		= word ptr -0FCh
var_F8		= dword ptr -0F8h
var_F2		= word ptr -0F2h
var_C6		= dword ptr -0C6h
var_C2		= byte ptr -0C2h
var_C1		= byte ptr -0C1h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= byte ptr -0B8h
var_B7		= byte ptr -0B7h
var_B6		= dword ptr -0B6h
var_B2		= word ptr -0B2h
var_B0		= word ptr -0B0h
var_AE		= word ptr -0AEh
var_AC		= word ptr -0ACh
var_AA		= word ptr -0AAh
var_A8		= word ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_96		= word ptr -96h
var_46		= word ptr -46h
var_44		= byte ptr -44h
var_43		= word ptr -43h
var_40		= dword ptr -40h
var_3C		= byte ptr -3Ch
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2E		= dword ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6

		push	bp
		mov	bp, sp
		sub	sp, 372h
		push	si
		push	di
		mov	byte_603DE, 0
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	ax, word_5DD44
		mov	[bp+var_8], ax
		mov	[bp+var_A4], 0
		mov	[bp+var_A2], 0
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_A0], 0
		mov	[bp+var_9E], 0
		mov	[bp+var_9C], 13Fh
		mov	[bp+var_9A], 0C7h
		mov	[bp+var_B2], 0
		mov	[bp+var_B0], 0
		mov	[bp+var_AE], 0
		mov	[bp+var_AC], 0
		mov	[bp+var_AA], 13Fh
		mov	[bp+var_A8], 0C7h
		push	0
		lea	ax, [bp+var_B2]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		push	0
		lea	ax, [bp+var_B2]
		push	ax
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_469A5
		add	sp, 4
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10002h
		push	0Ah
		lea	ax, word ptr [bp+var_C6]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		call	sub_595D5
		cmp	byte_603DE, 0
		jz	short loc_6DD44
		jmp	loc_6E6E0

loc_6DD44:
		lea	ax, [bp+var_E]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	4
		lea	ax, [bp+var_E]
		push	ax
		call	Music_LoadTune_13AF4
		add	sp, 4
		lea	ax, [bp+var_E]
		push	ax
		call	sub_13BB6
		pop	cx
		mov	byte ptr [bp+var_12], 0
		mov	byte ptr [bp+var_12+1], 0
		mov	[bp+var_10], 0
		push	ds
		push	offset aIFF
		push	ds
		push	offset aMycredit
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_96]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_16E]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_16E], 9B5h
		mov	[bp+var_10D], 100h
		mov	[bp+var_111], 0
		mov	[bp+var_16E], 9CDh
		push	1
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_16E]
		push	ax
		mov	bx, [bp+var_16E]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	seg seg163
		push	offset IndexedRecordReader_ConstructVariantA_54888
		push	large 10002h
		push	77h
		lea	ax, [bp+var_25C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvshps
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_96]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_25C]
		push	ax
		mov	bx, [bp+var_25C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwishps
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_96]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_1E5]
		push	ax
		mov	bx, [bp+var_1E5]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	seg seg163
		push	offset IndexedRecordReader_ConstructVariantA_54888
		push	large 10002h
		push	77h
		lea	ax, [bp+var_34A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvpals
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_96]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_34A]
		push	ax
		mov	bx, [bp+var_34A]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwipals
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_96]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_2D3]
		push	ax
		mov	bx, [bp+var_2D3]
		call	dword ptr [bx+14h]
		add	sp, 6
		xor	eax, eax
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		mov	[bp+var_16], 1
		mov	eax, dword_5E7D3
		mov	[bp+var_1A], eax
		push	0
		push	large 44455243h
		lea	ax, [bp+var_16E]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_6DEF3
		jmp	loc_6E56B

loc_6DEF3:
		lea	ax, [bp+var_24]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	0
		push	large 544E4F46h
		lea	ax, [bp+var_16E]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_6DF19
		jmp	loc_6E02F

loc_6DF19:
		push	1
		push	large 4D414E46h
		lea	ax, [bp+var_16E]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_6DF90
		lea	ax, [bp+var_16E]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	ds
		push	offset aShp_3
		push	ds
		lea	ax, [bp+var_24]
		push	ax
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_96]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_28+2], dx
		mov	word ptr [bp+var_28], ax
		mov	eax, [bp+var_28]
		mov	[bp+var_C6], eax
		mov	[bp+var_C2], 2
		mov	[bp+var_C1], 1
		mov	[bp+var_C0], 0
		jmp	short loc_6DF99

loc_6DF90:
		push	20DBh
		call	sub_9D78
		pop	cx

loc_6DF99:
		mov	eax, [bp+var_F8]
		mov	[bp+var_109], eax
		push	1
		push	large 4D414E46h
		lea	ax, [bp+var_16E]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_6E01A
		lea	ax, [bp+var_16E]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	ds
		push	offset aShp_3
		push	ds
		lea	ax, [bp+var_24]
		push	ax
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_96]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_2C+2], dx
		mov	word ptr [bp+var_2C], ax
		mov	eax, [bp+var_2C]
		mov	[bp+var_BC], eax
		mov	[bp+var_B8], 2
		mov	[bp+var_B7], 1
		mov	[bp+var_B6], 0
		jmp	short loc_6E023

loc_6E01A:
		push	20E5h
		call	sub_9D78
		pop	cx

loc_6E023:
		mov	eax, [bp+var_F8]
		mov	[bp+var_109], eax
		jmp	short loc_6E038

loc_6E02F:
		push	20EFh
		call	sub_9D78
		pop	cx

loc_6E038:
		lea	ax, [bp+var_16E]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		mov	[bp+var_1B], 0
		push	0
		push	large 53544341h
		lea	ax, [bp+var_16E]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_6E063
		jmp	loc_6E560

loc_6E063:
		push	1
		push	large 4F464E49h
		lea	ax, [bp+var_16E]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_6E07F
		jmp	loc_6E520

loc_6E07F:
		mov	di, [bp+var_FC]
		push	1
		push	0
		push	2
		movsx	eax, di
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_1E], dx
		mov	[bp+var_20], ax
		push	dx
		push	ax
		lea	ax, [bp+var_16E]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		xor	si, si
		mov	eax, [bp+var_F8]
		mov	[bp+var_109], eax
		jmp	loc_6E4FB

loc_6E0BE:
		les	bx, [bp+var_20]
		add	bx, si
		mov	al, es:[bx]
		mov	[bp+var_1C], al
		inc	si
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jz	short loc_6E0E0
		mov	[bp+var_1B], 1
		jmp	loc_6E50B

loc_6E0E0:
		mov	al, [bp+var_1C]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_6E0EF
		jmp	loc_6E4FB

loc_6E0EF:
		shl	bx, 1
		jmp	cs:off_6E729[bx]	; switch jump

loc_6E0F6:
		mov	ax, [bp+var_1E]
		mov	dx, [bp+var_20]
		add	dx, si
		mov	[bp+var_22], ax
		mov	[bp+var_24], dx
		jmp	short loc_6E11B

loc_6E106:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jz	short loc_6E11B
		mov	[bp+var_1B], 1
		jmp	short loc_6E137

loc_6E11B:
		mov	eax, [bp+var_1A]
		add	eax, [bp+var_16]
		cmp	eax, dword_5E7D3
		ja	short loc_6E12F
		mov	ax, 1
		jmp	short loc_6E131

loc_6E12F:
		xor	ax, ax

loc_6E131:
		mov	ah, 0
		or	ax, ax
		jz	short loc_6E106

loc_6E137:
		push	100h
		push	0
		lea	ax, word ptr [bp+var_2C+2]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, word ptr [bp+var_2C+2]
		push	ax
		call	sub_46B83
		pop	cx
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_2C+2]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		mov	[bp+var_16], 0Ah
		mov	eax, dword_5E7D3
		mov	[bp+var_1A], eax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		push	word_5DD44
		lea	ax, [bp+var_B2]
		push	ax
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		push	0
		lea	ax, [bp+var_B2]
		push	ax
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		les	bx, [bp+var_24]
		mov	eax, es:[bx]
		mov	[bp+var_2E], eax
		mov	[bp+var_16], eax
		mov	eax, dword_5E7D3
		mov	[bp+var_1A], eax
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_46F0A
		add	sp, 0Ah
		add	si, 4
		lea	ax, word ptr [bp+var_2C+2]
		push	ax
		call	sub_46E08
		pop	cx
		jmp	loc_6E4FB

loc_6E1E1:
		mov	ax, [bp+var_1E]
		mov	dx, [bp+var_20]
		add	dx, si
		mov	[bp+var_22], ax
		mov	[bp+var_24], dx
		les	bx, [bp+var_24]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_28+2], ax
		mov	ax, es:[bx+2]
		mov	word ptr [bp+var_28], ax
		mov	ax, es:[bx+4]
		mov	word ptr [bp+var_2C+2], ax
		mov	ax, es:[bx+6]
		mov	word ptr [bp+var_2C], ax
		mov	ax, word ptr [bp+var_28+2]
		mov	[bp+var_AE], ax
		mov	ax, word ptr [bp+var_28]
		mov	[bp+var_AC], ax
		mov	ax, word ptr [bp+var_2C+2]
		mov	[bp+var_AA], ax
		mov	ax, word ptr [bp+var_2C]
		mov	[bp+var_A8], ax
		mov	[bp+var_36], 0
		mov	byte ptr [bp+var_34+2], 2
		mov	byte ptr [bp+var_34+3], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	word ptr es:[bx+0Eh]
		mov	ax, es:[bx+0Ch]
		imul	ax, ax, 77h
		lea	dx, [bp+var_25C]
		add	ax, dx
		push	ax
		call	sub_1ECCB
		add	sp, 8
		les	bx, [bp+var_24]
		cmp	word ptr es:[bx+10h], 0FFFFh
		jnz	short loc_6E26E
		jmp	loc_6E34C

loc_6E26E:
		mov	[bp+var_40], 0
		mov	[bp+var_3C], 2
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	word ptr es:[bx+10h]
		mov	ax, es:[bx+0Ch]
		imul	ax, ax, 77h
		lea	dx, [bp+var_34A]
		add	ax, dx
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_43], 0
		lea	ax, word ptr [bp+var_40]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46A98
		add	sp, 4
		push	[bp+var_46]
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		cmp	[bp+var_3B], 0
		jz	short loc_6E2F6
		cmp	[bp+var_40], 0
		jz	short loc_6E2F6
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6E2F6

loc_6E2F6:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	[bp+var_3B], 0
		jz	short loc_6E338
		cmp	[bp+var_40], 0
		jz	short loc_6E338
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6E338

loc_6E338:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0

loc_6E34C:
		les	bx, [bp+var_24]
		push	word ptr es:[bx+12h]
		cmp	byte ptr [bp+var_34+2], 3
		jnz	short loc_6E370
		push	0
		mov	al, byte ptr [bp+var_34+2]
		push	ax
		push	large [bp+var_36]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6E377

loc_6E370:
		mov	edx, [bp+var_34]
		mov	ax, word ptr [bp+var_36]

loc_6E377:
		push	dx
		push	ax
		les	bx, [bp+var_24]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		add	si, 14h
		mov	[bp+var_AE], 0
		mov	[bp+var_AC], 0
		mov	[bp+var_AA], 13Fh
		mov	[bp+var_A8], 0C7h
		cmp	byte ptr [bp+var_34+3], 0
		jz	short loc_6E3D0
		cmp	[bp+var_36], 0
		jz	short loc_6E3D0
		push	0
		mov	al, byte ptr [bp+var_34+2]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6E3D0

loc_6E3D0:
		mov	[bp+var_36], 0
		mov	byte ptr [bp+var_34+3], 0
		mov	[bp+var_30], 0
		jmp	loc_6E4FB

loc_6E3E7:
		mov	ax, [bp+var_1E]
		mov	dx, [bp+var_20]
		add	dx, si
		mov	[bp+var_22], ax
		mov	[bp+var_24], dx
		mov	ax, [bp+var_24]
		add	ax, 7
		push	[bp+var_22]
		push	ax
		push	ss
		lea	ax, [bp+var_372]
		push	ax
		call	sub_36EC
		add	sp, 8
		lea	ax, [bp+var_B2]
		push	ax
		les	bx, [bp+var_24]
		mov	al, es:[bx]
		mov	ah, 0
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_C6]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_372]
		push	ax
		push	word ptr es:[bx+5]
		push	word ptr es:[bx+3]
		jmp	short loc_6E47C

loc_6E433:
		mov	ax, [bp+var_1E]
		mov	dx, [bp+var_20]
		add	dx, si
		mov	[bp+var_22], ax
		mov	[bp+var_24], dx
		mov	ax, [bp+var_24]
		add	ax, 7
		push	[bp+var_22]
		push	ax
		push	ss
		lea	ax, [bp+var_372]
		push	ax
		call	sub_36EC
		add	sp, 8
		push	word_5DD44
		les	bx, [bp+var_24]
		mov	al, es:[bx]
		mov	ah, 0
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_C6]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_372]
		push	ax
		push	word ptr es:[bx+5]
		push	word ptr es:[bx+3]

loc_6E47C:
		mov	al, es:[bx+1]
		push	ax
		call	sub_1391A
		add	sp, 0Ch
		add	si, 7
		lea	ax, [bp+var_372]
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	dx, si
		add	dx, ax
		mov	si, dx
		inc	si
		jmp	short loc_6E4FB

loc_6E4A0:
		mov	ax, [bp+var_1E]
		mov	dx, [bp+var_20]
		add	dx, si
		mov	[bp+var_22], ax
		mov	[bp+var_24], dx
		jmp	short loc_6E4C5

loc_6E4B0:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jz	short loc_6E4C5
		mov	[bp+var_1B], 1
		jmp	short loc_6E4E1

loc_6E4C5:
		mov	eax, [bp+var_1A]
		add	eax, [bp+var_16]
		cmp	eax, dword_5E7D3
		ja	short loc_6E4D9
		mov	ax, 1
		jmp	short loc_6E4DB

loc_6E4D9:
		xor	ax, ax

loc_6E4DB:
		mov	ah, 0
		or	ax, ax
		jz	short loc_6E4B0

loc_6E4E1:
		les	bx, [bp+var_24]
		mov	eax, es:[bx]
		mov	[bp+var_28], eax
		mov	[bp+var_16], eax
		mov	eax, dword_5E7D3
		mov	[bp+var_1A], eax
		add	si, 4

loc_6E4FB:
		cmp	si, di
		jge	short loc_6E50B
		mov	al, [bp+var_1B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E50B
		jmp	loc_6E0BE

loc_6E50B:
		push	0
		push	2
		lea	ax, [bp+var_20]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6E524

loc_6E520:
		mov	[bp+var_1B], 1

loc_6E524:
		cmp	[bp+var_F2], 0
		jnz	short loc_6E538
		lea	ax, [bp+var_16E]
		push	ax
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_6E54E

loc_6E538:
		mov	bx, [bp+var_F2]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_109]
		jg	short loc_6E54C
		mov	ax, 1
		jmp	short loc_6E54E

loc_6E54C:
		xor	ax, ax

loc_6E54E:
		or	ax, ax
		jnz	short loc_6E57F
		mov	al, [bp+var_1B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E55E
		jmp	loc_6E063

loc_6E55E:
		jmp	short loc_6E57F

loc_6E560:
		push	20F9h

loc_6E563:
		call	sub_9D78
		pop	cx
		jmp	short loc_6E57F

loc_6E56B:
		push	2103h
		jmp	short loc_6E563

loc_6E570:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_6E59B

loc_6E57F:
		mov	eax, [bp+var_1A]
		add	eax, [bp+var_16]
		cmp	eax, dword_5E7D3
		ja	short loc_6E593
		mov	ax, 1
		jmp	short loc_6E595

loc_6E593:
		xor	ax, ax

loc_6E595:
		mov	ah, 0
		or	ax, ax
		jz	short loc_6E570

loc_6E59B:
		push	100h
		push	0
		lea	ax, [bp+var_20]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, [bp+var_20]
		push	ax
		call	sub_46B83
		pop	cx
		push	7D0h
		lea	ax, [bp+var_E]
		push	ax
		call	sub_13CB3
		add	sp, 4
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_20]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		lea	ax, [bp+var_20]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	[bp+var_C1], 0
		jz	short loc_6E60E
		cmp	[bp+var_C6], 0
		jz	short loc_6E60E
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6E60E

loc_6E60E:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_6E64D
		cmp	[bp+var_BC], 0
		jz	short loc_6E64D
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6E64D

loc_6E64D:
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_13D29
		pop	cx
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg163
		push	offset IndexedRecordReader_Destruct_5483E
		push	large 10002h
		push	77h
		lea	ax, [bp+var_34A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg163
		push	offset IndexedRecordReader_Destruct_5483E
		push	large 10002h
		push	77h
		lea	ax, [bp+var_25C]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_16E], 9CDh
		lea	ax, [bp+var_16E]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_16E]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		push	2
		lea	ax, [bp+var_E]
		push	ax
		call	sub_13AAE
		add	sp, 4

loc_6E6E0:
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, word ptr [bp+var_C6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_C]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_B2]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_6]
		push	ax
		call	sub_46E08
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_6DC70		endp

; START OF FUNCTION CHUNK FOR sub_6DC70
off_6E729	dw offset loc_6E0F6
		dw offset loc_6E1E1
		dw offset loc_6E3E7
		dw offset loc_6E433
		dw offset loc_6E4A0
; END OF FUNCTION CHUNK FOR sub_6DC70
ovr192		ends
