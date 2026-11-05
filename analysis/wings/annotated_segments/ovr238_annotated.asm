ovr238		segment	para public 'OVERLAY' use16
		assume cs:ovr238
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_87290		proc far

var_386		= word ptr -386h
var_310		= word ptr -310h
var_2FB		= byte ptr -2FBh
var_2E7		= byte ptr -2E7h
var_2D2		= word ptr -2D2h
var_2D0		= word ptr -2D0h
var_2CE		= word ptr -2CEh
var_2CC		= byte ptr -2CCh
var_2C4		= word ptr -2C4h
var_2A2		= dword ptr -2A2h
var_2A0		= dword ptr -2A0h
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
var_38		= byte ptr -38h
var_37		= byte ptr -37h
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
		jz	short loc_872A8
		mov	[bp+var_1], 1

loc_872A8:
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
		push	offset aMIDGAM03_1
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_BuildComposite
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
		call	Path_BuildComposite
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
		jnz	short loc_8737A
		jmp	loc_87401

loc_8737A:
		push	ds
		lea	ax, [bp+var_BE]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_87401
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
		jnz	short loc_873CD
		mov	eax, [bp+var_14D]
		jmp	short loc_873D2

loc_873CD:
		mov	eax, [bp+var_13D]

loc_873D2:
		mov	edx, [bp+var_40]
		add	edx, eax
		mov	[bp+var_44], edx
		mov	eax, [bp+var_40]
		cmp	eax, [bp+var_44]
		jz	short loc_87401
		push	0
		push	edx
		push	eax
		lea	ax, [bp+var_1AE]
		push	ax
		lea	ax, [bp+var_226]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		jmp	short loc_87405

loc_87401:
		mov	[bp+var_1], 0

loc_87405:
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		push	ds
		push	offset unk_5CF9A
		push	ds
		push	offset aConvfontShp_7
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_BuildComposite
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
		jz	short loc_874D8
		cmp	[bp+var_46], 0
		jz	short loc_874D8
		push	0
		mov	al, byte ptr [bp+var_44+2]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_874D8

loc_874D8:
		mov	[bp+var_46], 0
		mov	byte ptr [bp+var_44+3], 0
		mov	[bp+var_40], 0
		cmp	byte ptr [bp+var_44+3], 0
		jz	short loc_87510
		cmp	[bp+var_46], 0
		jz	short loc_87510
		push	0
		mov	al, byte ptr [bp+var_44+2]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_87510

loc_87510:
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
		call	sub_13AF4
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_87548
		mov	ax, word_5CF9F
		mov	[bp+var_26], ax

loc_87548:
		mov	di, 0Bh
		cmp	[bp+var_1], 0
		jz	short loc_87571
		xor	si, si
		jmp	short loc_8756C

loc_87555:
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

loc_8756C:
		cmp	si, 2
		jl	short loc_87555

loc_87571:
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
		mov	[bp+var_38], 2
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Ah
		push	0Ah
		lea	ax, word ptr [bp+var_2A2]
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
		jmp	short loc_87633

loc_87611:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_2A2]
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

loc_87633:
		cmp	si, 0Ah
		jl	short loc_87611
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
		mov	si, 113h
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_8766B
		mov	si, 112h

loc_8766B:
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
		push	si
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
		call	sub_14F62
		pop	cx
		push	2
		lea	ax, [bp+var_386]
		push	ax
		call	sub_141F1
		add	sp, 4
		cmp	byte_603DE, 0
		jnz	short loc_876E3
		jmp	loc_877C2

loc_876E3:
		cmp	[bp+var_1], 0
		jz	short loc_876FD
		jmp	short loc_876F8

loc_876EB:
		push	di
		push	[bp+var_26]
		call	sub_41495
		add	sp, 4
		inc	di

loc_876F8:
		cmp	di, 0Dh
		jb	short loc_876EB

loc_876FD:
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
		lea	ax, word ptr [bp+var_2A2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	[bp+var_37], 0
		jz	short loc_87759
		cmp	[bp+var_3C], 0
		jz	short loc_87759
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_87759

loc_87759:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
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
		jnz	short loc_8779D
		jmp	loc_87D1C

loc_8779D:
		cmp	[bp+var_18], 0
		jnz	short loc_877A7
		jmp	loc_87D1C

loc_877A7:
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	loc_87D1C
		jmp	loc_87D1C

loc_877C2:
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
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_4E+2]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
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
		cmp	byte ptr [bp+var_2A0+2], 3
		jnz	short loc_87858
		push	0
		mov	al, byte ptr [bp+var_2A0+2]
		push	ax
		push	large [bp+var_2A2]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_87861

loc_87858:
		mov	edx, [bp+var_2A0]
		mov	ax, word ptr [bp+var_2A2]

loc_87861:
		push	dx
		push	ax
		push	large 180000h
		lea	ax, [bp+var_60]
		push	ax
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
		jmp	loc_879CE

loc_878E1:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_2A2]
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
		jmp	short loc_87918

loc_8790D:
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_1EED1
		pop	cx

loc_87918:
		push	[bp+var_52]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_8790D
		push	[bp+var_52]
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	[bp+var_52], 0
		jz	short loc_8794E
		push	3
		push	[bp+var_52]
		mov	bx, [bp+var_52]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_8794E

loc_8794E:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_29D]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_87999
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_2A2]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_87999
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_2A0+2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_2A2]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_87999

loc_87999:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_2A2]
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

loc_879CE:
		cmp	si, 8
		jge	short loc_879D6
		jmp	loc_878E1

loc_879D6:
		xor	eax, eax
		mov	[bp+var_4A], eax
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], 3Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_4E], eax
		cmp	[bp+var_1], 0
		jz	short loc_87A0B
		push	large 0FFh
		push	large 0Bh
		push	[bp+var_26]
		call	sub_4163D
		add	sp, 0Ah

loc_87A0B:
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
		jmp	loc_87B50

loc_87A2E:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_2A2]
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
		jmp	short loc_87A9A

loc_87A5A:
		cmp	[bp+var_1], 0
		jz	short loc_87A8F
		mov	al, [bp+var_4F]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_87A8F
		cmp	si, 9
		jnz	short loc_87A8F
		mov	bx, [bp+var_52]
		cmp	word ptr [bx+1Bh], 1
		jnz	short loc_87A8F
		push	large 0FFh
		push	large 0Ch
		push	[bp+var_26]
		call	sub_4163D
		add	sp, 0Ah
		mov	[bp+var_4F], 1

loc_87A8F:
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_1EED1
		pop	cx

loc_87A9A:
		push	[bp+var_52]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_87A5A
		push	[bp+var_52]
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	[bp+var_52], 0
		jz	short loc_87AD0
		push	3
		push	[bp+var_52]
		mov	bx, [bp+var_52]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_87AD0

loc_87AD0:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_29D]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_87B1B
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_2A2]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_87B1B
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_2A0+2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_2A2]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_87B1B

loc_87B1B:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_2A2]
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

loc_87B50:
		cmp	si, 0Ah
		jge	short loc_87B58
		jmp	loc_87A2E

loc_87B58:
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
		jnz	short loc_87B83
		jmp	loc_87C4D

loc_87B83:
		cmp	[bp+var_1], 0
		jz	short loc_87B9D
		jmp	short loc_87B98

loc_87B8B:
		push	di
		push	[bp+var_26]
		call	sub_41495
		add	sp, 4
		inc	di

loc_87B98:
		cmp	di, 0Dh
		jb	short loc_87B8B

loc_87B9D:
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
		lea	ax, word ptr [bp+var_2A2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	[bp+var_37], 0
		jz	short loc_87BF9
		cmp	[bp+var_3C], 0
		jz	short loc_87BF9
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_87BF9

loc_87BF9:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
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
		jnz	short loc_87C3D
		jmp	loc_87D1C

loc_87C3D:
		cmp	[bp+var_18], 0
		jnz	short loc_87C47
		jmp	loc_87D1C

loc_87C47:
		jmp	loc_877A7
		jmp	loc_87D1C

loc_87C4D:
		push	0
		lea	ax, [bp+var_2C4]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_87C76
		jmp	short loc_87C71

loc_87C64:
		push	di
		push	[bp+var_26]
		call	sub_41495
		add	sp, 4
		inc	di

loc_87C71:
		cmp	di, 0Dh
		jb	short loc_87C64

loc_87C76:
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
		lea	ax, word ptr [bp+var_2A2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	[bp+var_37], 0
		jz	short loc_87CD1
		cmp	[bp+var_3C], 0
		jz	short loc_87CD1
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_87CD1

loc_87CD1:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
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
		jz	short loc_87D1C
		cmp	[bp+var_18], 0
		jz	short loc_87D1C
		jmp	loc_877A7

loc_87D1C:
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
sub_87290		endp
ovr238		ends
