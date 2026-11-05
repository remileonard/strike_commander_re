ovr235		segment	para public 'OVERLAY' use16
		assume cs:ovr235
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_860F0		proc far

var_54		= word ptr -54h
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	ds
		push	offset aShp_3
		push	ds
		push	offset aLdeplak
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_54]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_54]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_86153
		push	[bp+arg_0]
		push	dx
		push	ax
		push	large 0AB0052h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_86153:
		leave
		retf
sub_860F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_86155		proc far

var_29A		= word ptr -29Ah
var_278		= word ptr -278h
var_274		= word ptr -274h
var_273		= word ptr -273h
var_272		= word ptr -272h
var_214		= word ptr -214h
var_19C		= word ptr -19Ch
var_13B		= dword ptr -13Bh
var_137		= dword ptr -137h
var_12F		= word ptr -12Fh
var_12B		= dword ptr -12Bh
var_124		= word ptr -124h
var_AC		= word ptr -0ACh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_40		= dword ptr -40h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= byte ptr -2Eh
var_2D		= byte ptr -2Dh
var_2C		= byte ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= byte ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_8		= word ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 29Ah
		push	si
		push	di
		mov	[bp+var_1], 0
		cmp	word_5CF9F, 0
		jz	short loc_8616D
		mov	[bp+var_1], 1

loc_8616D:
		mov	ax, word_5DD44
		mov	[bp+var_4], ax
		mov	[bp+var_4E], 0
		mov	[bp+var_4C], 0
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_5C], 0
		mov	[bp+var_5A], 0
		mov	[bp+var_58], 0
		mov	[bp+var_56], 0
		mov	[bp+var_54], 13Fh
		mov	[bp+var_52], 0C7h
		push	0
		lea	ax, [bp+var_5C]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469A5
		add	sp, 4
		mov	[bp+var_4A], 0
		mov	[bp+var_48], 0
		mov	[bp+var_46], 13Fh
		mov	[bp+var_44], 0C7h
		push	ds
		push	offset aPak
		push	ds
		push	offset aMIDGAM11
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_AC]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_124]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidnoise
		push	ds
		push	offset aDataNoise
		lea	ax, [bp+var_AC]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_19C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		lea	ax, [bp+var_214]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		cmp	[bp+var_1], 0
		jnz	short loc_8623F
		jmp	loc_862C6

loc_8623F:
		push	ds
		lea	ax, [bp+var_AC]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_862C6
		push	1
		lea	ax, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		mov	bx, [bp+var_19C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0Ah
		lea	ax, [bp+var_19C]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_137]
		mov	[bp+var_3A], eax
		mov	ax, [bp+var_12F]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_86292
		mov	eax, [bp+var_13B]
		jmp	short loc_86297

loc_86292:
		mov	eax, [bp+var_12B]

loc_86297:
		mov	edx, [bp+var_3A]
		add	edx, eax
		mov	[bp+var_3E], edx
		mov	eax, [bp+var_3A]
		cmp	eax, [bp+var_3E]
		jz	short loc_862C6
		push	0
		push	edx
		push	eax
		lea	ax, [bp+var_19C]
		push	ax
		lea	ax, [bp+var_214]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		jmp	short loc_862CA

loc_862C6:
		mov	[bp+var_1], 0

loc_862CA:
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
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_8630E
		mov	[bp+var_18], 1
		mov	[bp+var_1A], 5
		mov	[bp+var_1C], 0
		jmp	loc_863B3

loc_8630E:
		push	2F9h
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_8634A
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_86339
		mov	[bp+var_18], 7
		mov	[bp+var_1A], 6
		mov	[bp+var_1C], 1
		jmp	short loc_863B3

loc_86339:
		mov	[bp+var_18], 1Fh
		mov	[bp+var_1A], 6
		mov	[bp+var_1C], 5
		jmp	short loc_863B3

loc_8634A:
		push	2FAh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_86368
		mov	[bp+var_18], 13h
		mov	[bp+var_1A], 5
		mov	[bp+var_1C], 3
		jmp	short loc_863B3

loc_86368:
		push	2FBh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_86386
		mov	[bp+var_18], 0Eh
		mov	[bp+var_1A], 4
		mov	[bp+var_1C], 2
		jmp	short loc_863B3

loc_86386:
		push	2FCh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_863A4
		mov	[bp+var_18], 19h
		mov	[bp+var_1A], 5
		mov	[bp+var_1C], 4
		jmp	short loc_863B3

loc_863A4:
		mov	[bp+var_18], 1
		mov	[bp+var_1A], 5
		mov	[bp+var_1C], 6

loc_863B3:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_40], 0
		mov	byte ptr [bp+var_3E+2], 2
		mov	byte ptr [bp+var_3E+3], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, word ptr [bp+var_40]
		push	ax
		mov	ax, [bp+var_18]
		dec	ax
		push	ax
		lea	ax, [bp+var_124]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_40]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_LoadAndUpload_46E20
		add	sp, 4
		cmp	byte ptr [bp+var_3E+3], 0
		jz	short loc_86436
		cmp	[bp+var_40], 0
		jz	short loc_86436
		push	0
		mov	al, byte ptr [bp+var_3E+2]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_86436

loc_86436:
		mov	[bp+var_40], 0
		mov	byte ptr [bp+var_3E+3], 0
		mov	[bp+var_3A], 0
		cmp	byte ptr [bp+var_3E+3], 0
		jz	short loc_8646E
		cmp	[bp+var_40], 0
		jz	short loc_8646E
		push	0
		mov	al, byte ptr [bp+var_3E+2]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8646E

loc_8646E:
		mov	[bp+var_40], 0
		mov	byte ptr [bp+var_3E+3], 0
		mov	[bp+var_3A], 0
		lea	ax, [bp+var_24]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	0
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13AF4
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_864A6
		mov	ax, word_5CF9F
		mov	[bp+var_26], ax

loc_864A6:
		xor	di, di
		cmp	[bp+var_1], 0
		jz	short loc_864CA
		xor	si, si
		jmp	short loc_864C5

loc_864B2:
		push	si
		lea	ax, [bp+var_214]
		push	ax
		push	si
		push	[bp+var_26]
		call	sub_412F9
		add	sp, 8
		inc	si

loc_864C5:
		cmp	si, 2
		jl	short loc_864B2

loc_864CA:
		mov	[bp+var_2E], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		call	sub_1F377
		xor	eax, eax
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_278]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		xor	si, si
		jmp	short loc_86527

loc_86505:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_278]
		add	ax, dx
		push	ax
		mov	ax, [bp+var_18]
		add	ax, si
		push	ax
		lea	ax, [bp+var_124]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_86527:
		cmp	si, [bp+var_1A]
		jl	short loc_86505
		lea	ax, [bp+var_4E]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_1EE2D
		add	sp, 8
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
		mov	byte ptr [bp+var_3A+3], 0
		mov	byte ptr [bp+var_3A+2], 0
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13BB6
		pop	cx
		xor	si, si
		jmp	loc_866A6

loc_8657C:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_278]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_3A], ax
		push	ax
		lea	ax, [bp+var_29A]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_865F0

loc_865A8:
		cmp	[bp+var_1], 0
		jz	short loc_865E5
		mov	al, byte ptr [bp+var_3A+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_865E5
		cmp	si, 1
		jnz	short loc_865E5
		mov	bx, word ptr [bp+var_3A]
		cmp	word ptr [bx+1Bh], 6
		jbe	short loc_865E5
		push	large 0FFh
		push	0
		push	di
		push	[bp+var_26]
		call	sub_4163D
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_2A], eax
		mov	byte ptr [bp+var_3A+3], 1

loc_865E5:
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_1EED1
		pop	cx

loc_865F0:
		push	word ptr [bp+var_3A]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_865A8
		push	word ptr [bp+var_3A]
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_3A], 0
		jz	short loc_86626
		push	3
		push	word ptr [bp+var_3A]
		mov	bx, word ptr [bp+var_3A]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_86626

loc_86626:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_273]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_86671
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_278]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_86671
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_274]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_278]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_86671

loc_86671:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_278]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_273]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_272]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_866A6:
		cmp	si, 2
		jge	short loc_866AE
		jmp	loc_8657C

loc_866AE:
		cmp	byte_603DE, 0
		jz	short loc_866B8
		jmp	loc_867FF

loc_866B8:
		mov	si, 2
		jmp	loc_867F2

loc_866BE:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_278]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_3A], ax
		push	ax
		lea	ax, [bp+var_29A]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_8673C

loc_866EA:
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_1EED1
		pop	cx
		cmp	[bp+var_1], 0
		jz	short loc_8673C
		mov	al, byte ptr [bp+var_3A+2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8673C
		push	large [bp+var_2A]
		push	[bp+var_26]
		call	sub_41729
		add	sp, 6
		or	al, al
		jz	short loc_8673C
		push	di
		push	[bp+var_26]
		call	sub_41495
		add	sp, 4
		inc	di
		push	large 0FFh
		push	0
		push	di
		push	[bp+var_26]
		call	sub_4180F
		add	sp, 0Ah
		mov	byte ptr [bp+var_3A+2], 1

loc_8673C:
		push	word ptr [bp+var_3A]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_866EA
		push	word ptr [bp+var_3A]
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_3A], 0
		jz	short loc_86772
		push	3
		push	word ptr [bp+var_3A]
		mov	bx, word ptr [bp+var_3A]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_86772

loc_86772:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_273]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_867BD
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_278]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_867BD
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_274]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_278]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_867BD

loc_867BD:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_278]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_273]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_272]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_867F2:
		cmp	si, [bp+var_1A]
		jge	short loc_867FA
		jmp	loc_866BE

loc_867FA:
		cmp	byte_603DE, 0

loc_867FF:
		push	0
		lea	ax, [bp+var_29A]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	[bp+var_1C]
		push	cs
		call	near ptr sub_860F0
		pop	cx
		cmp	[bp+var_1], 0
		jz	short loc_86830
		jmp	short loc_8682B

loc_8681E:
		push	di
		push	[bp+var_26]
		call	sub_41495
		add	sp, 4
		inc	di

loc_8682B:
		cmp	di, 2
		jb	short loc_8681E

loc_86830:
		push	0
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_278]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_24]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_214]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_19C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_124]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_5C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_4E]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_86155		endp
ovr235		ends
