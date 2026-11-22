ovr230		segment	para public 'OVERLAY' use16
		assume cs:ovr230
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_80380		proc far

var_3CA		= word ptr -3CAh
var_354		= word ptr -354h
var_33F		= byte ptr -33Fh
var_32B		= byte ptr -32Bh
var_31C		= word ptr -31Ch
var_316		= word ptr -316h
var_314		= dword ptr -314h
var_310		= dword ptr -310h
var_30C		= dword ptr -30Ch
var_308		= word ptr -308h
var_2E6		= word ptr -2E6h
var_2E2		= word ptr -2E2h
var_2E1		= word ptr -2E1h
var_2E0		= word ptr -2E0h
var_278		= word ptr -278h
var_274		= word ptr -274h
var_273		= word ptr -273h
var_272		= word ptr -272h
var_250		= word ptr -250h
var_238		= word ptr -238h
var_1C0		= word ptr -1C0h
var_15F		= dword ptr -15Fh
var_15B		= dword ptr -15Bh
var_153		= word ptr -153h
var_14F		= dword ptr -14Fh
var_148		= word ptr -148h
var_D0		= word ptr -0D0h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_64		= dword ptr -64h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= byte ptr -4Ch
var_4B		= byte ptr -4Bh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= word ptr -3Eh
var_3C		= byte ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= byte ptr -34h
var_33		= word ptr -33h
var_30		= word ptr -30h
var_2E		= byte ptr -2Eh
var_2D		= word ptr -2Dh
var_2A		= word ptr -2Ah
var_28		= byte ptr -28h
var_27		= word ptr -27h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
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
		sub	sp, 3CAh
		push	si
		push	di
		mov	[bp+var_1], 0
		cmp	word_5CF9F, 0
		jz	short loc_80398
		mov	[bp+var_1], 1

loc_80398:
		mov	ax, word_5DD44
		mov	[bp+var_4], ax
		mov	[bp+var_72], 0
		mov	[bp+var_70], 0
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_80], 0
		mov	[bp+var_7E], 0
		mov	[bp+var_7C], 0
		mov	[bp+var_7A], 0
		mov	[bp+var_78], 13Fh
		mov	[bp+var_76], 0C7h
		push	0
		lea	ax, [bp+var_80]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469A5
		add	sp, 4
		mov	[bp+var_6E], 0
		mov	[bp+var_6C], 18h
		mov	[bp+var_6A], 13Fh
		mov	[bp+var_68], 97h
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgam06
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_D0]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidnoise
		push	ds
		push	offset aDataNoise
		lea	ax, [bp+var_D0]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		cmp	[bp+var_1], 0
		jnz	short loc_8046A
		jmp	loc_804F1

loc_8046A:
		push	ds
		lea	ax, [bp+var_D0]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_804F1
		push	1
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_1C0]
		push	ax
		mov	bx, [bp+var_1C0]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	5
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_15B]
		mov	[bp+var_5E], eax
		mov	ax, [bp+var_153]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_804BD
		mov	eax, [bp+var_15F]
		jmp	short loc_804C2

loc_804BD:
		mov	eax, [bp+var_14F]

loc_804C2:
		mov	edx, [bp+var_5E]
		add	edx, eax
		mov	[bp+var_62], edx
		mov	eax, [bp+var_5E]
		cmp	eax, [bp+var_62]
		jz	short loc_804F1
		push	0
		push	edx
		push	eax
		lea	ax, [bp+var_1C0]
		push	ax
		lea	ax, [bp+var_238]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		jmp	short loc_804F5

loc_804F1:
		mov	[bp+var_1], 0

loc_804F5:
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		push	ds
		push	offset unk_5CED0
		push	ds
		push	offset aConvfontShp_4
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_D0]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_D0]
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
		lea	ax, [bp+var_250]
		push	ax
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	[bp+var_24], 0
		mov	[bp+var_22], 98h
		mov	[bp+var_20], 13Fh
		mov	[bp+var_1E], 0C7h
		mov	[bp+var_2A], 0
		mov	[bp+var_27], 0
		mov	[bp+var_30], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_36], 0
		mov	[bp+var_33], 0
		mov	[bp+var_64], 0
		mov	byte ptr [bp+var_62+2], 2
		mov	byte ptr [bp+var_62+3], 0
		mov	[bp+var_5E], 0
		push	2
		lea	ax, word ptr [bp+var_64]
		push	ax
		push	0
		lea	ax, [bp+var_148]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_64]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_62+3], 0
		jz	short loc_805F0
		cmp	[bp+var_64], 0
		jz	short loc_805F0
		push	0
		mov	al, byte ptr [bp+var_62+2]
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_805F0

loc_805F0:
		mov	[bp+var_64], 0
		mov	byte ptr [bp+var_62+3], 0
		mov	[bp+var_5E], 0
		push	2
		lea	ax, word ptr [bp+var_64]
		push	ax
		push	6
		lea	ax, [bp+var_148]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_64]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_62+3], 0
		jz	short loc_8064D
		cmp	[bp+var_64], 0
		jz	short loc_8064D
		push	0
		mov	al, byte ptr [bp+var_62+2]
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8064D

loc_8064D:
		mov	[bp+var_64], 0
		mov	byte ptr [bp+var_62+3], 0
		mov	[bp+var_5E], 0
		push	2
		lea	ax, word ptr [bp+var_64]
		push	ax
		push	8
		lea	ax, [bp+var_148]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_64]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_62+3], 0
		jz	short loc_806AA
		cmp	[bp+var_64], 0
		jz	short loc_806AA
		push	0
		mov	al, byte ptr [bp+var_62+2]
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_806AA

loc_806AA:
		mov	[bp+var_64], 0
		mov	byte ptr [bp+var_62+3], 0
		mov	[bp+var_5E], 0
		cmp	byte ptr [bp+var_62+3], 0
		jz	short loc_806E2
		cmp	[bp+var_64], 0
		jz	short loc_806E2
		push	0
		mov	al, byte ptr [bp+var_62+2]
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_806E2

loc_806E2:
		mov	[bp+var_64], 0
		mov	byte ptr [bp+var_62+3], 0
		mov	[bp+var_5E], 0
		lea	ax, [bp+var_38]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	0Ah
		lea	ax, [bp+var_38]
		push	ax
		call	Music_LoadTune_13AF4
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_80718
		mov	di, word_5CF9F

loc_80718:
		mov	[bp+var_3A], 6
		cmp	[bp+var_1], 0
		jz	short loc_80742
		xor	si, si
		jmp	short loc_8073D

loc_80727:
		push	si
		lea	ax, [bp+var_238]
		push	ax
		mov	ax, si
		add	ax, [bp+var_3A]
		push	ax
		push	di
		call	sub_412F9
		add	sp, 8
		inc	si

loc_8073D:
		cmp	si, 2
		jl	short loc_80727

loc_80742:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	byte ptr [bp+var_3E], 0
		mov	byte ptr [bp+var_3E+1], 0
		mov	[bp+var_3C], 0
		push	100h
		push	0
		lea	ax, [bp+var_3E]
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
		mov	[bp+var_42], eax
		mov	[bp+var_46], eax
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_278]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_50], 0
		mov	[bp+var_4C], 2
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		mov	[bp+var_5A], 0
		mov	byte ptr [bp+var_58+2], 2
		mov	byte ptr [bp+var_58+3], 0
		mov	[bp+var_54], 0
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2E6]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		xor	si, si
		jmp	short loc_80820

loc_80800:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_278]
		add	ax, dx
		push	ax
		mov	ax, si
		inc	ax
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_80820:
		cmp	si, 4
		jl	short loc_80800
		push	3
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	5
		lea	ax, [bp+var_148]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	7
		lea	ax, [bp+var_148]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		xor	si, si
		jmp	short loc_80875

loc_80853:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_80875:
		cmp	si, 0Bh
		jl	short loc_80853
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13BB6
		pop	cx
		lea	ax, [bp+var_72]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_308]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_2A]
		mov	al, [bp+var_28]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		xor	si, si
		jmp	loc_809AF

loc_808C2:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_278]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_5E+2], ax
		push	ax
		lea	ax, [bp+var_308]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_808F9

loc_808EE:
		lea	ax, [bp+var_308]
		push	ax
		call	sub_1EED1
		pop	cx

loc_808F9:
		push	word ptr [bp+var_5E+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_808EE
		push	word ptr [bp+var_5E+2]
		lea	ax, [bp+var_308]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_5E+2], 0
		jz	short loc_8092F
		push	3
		push	word ptr [bp+var_5E+2]
		mov	bx, word ptr [bp+var_5E+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_8092F

loc_8092F:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_273]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_8097A
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_278]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_8097A
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
		jmp	short loc_8097A

loc_8097A:
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

loc_809AF:
		cmp	si, 4
		jge	short loc_809B7
		jmp	loc_808C2

loc_809B7:
		cmp	byte_603DE, 0
		jnz	short loc_809C1
		jmp	loc_80B0A

loc_809C1:
		cmp	[bp+var_1], 0
		jz	short loc_809DE
		jmp	short loc_809D8

loc_809C9:
		push	[bp+var_3A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_3A]

loc_809D8:
		cmp	[bp+var_3A], 2
		jb	short loc_809C9

loc_809DE:
		push	0
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_308]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2E6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	byte ptr [bp+var_58+3], 0
		jz	short loc_80A3A
		cmp	[bp+var_5A], 0
		jz	short loc_80A3A
		push	0
		mov	al, byte ptr [bp+var_58+2]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_80A3A

loc_80A3A:
		mov	[bp+var_5A], 0
		mov	byte ptr [bp+var_58+3], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_80A72
		cmp	[bp+var_50], 0
		jz	short loc_80A72
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_80A72

loc_80A72:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_278]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_30]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_250]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jnz	short loc_80AE5
		jmp	loc_81928

loc_80AE5:
		cmp	[bp+var_18], 0
		jnz	short loc_80AEF
		jmp	loc_81928

loc_80AEF:
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	loc_81928
		jmp	loc_81928

loc_80B0A:
		push	10Fh
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_80B31
		push	31B1h
		push	[bp+arg_4]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_80B2D
		mov	dl, 0C0h
		jmp	short loc_80B49

loc_80B2D:
		mov	dl, 0BFh
		jmp	short loc_80B49

loc_80B31:
		push	31B9h
		push	[bp+arg_4]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_80B47
		mov	dl, 0C1h
		jmp	short loc_80B49

loc_80B47:
		mov	dl, 0C2h

loc_80B49:
		mov	byte ptr [bp+var_354], 0
		mov	byte ptr [bp+var_354+1], 0
		mov	[bp+var_33F], 0
		mov	[bp+var_32B], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_316], ax
		mov	ax, [bp+arg_0]
		mov	word ptr [bp+var_314], ax
		mov	ax, [bp+arg_4]
		mov	word ptr [bp+var_314+2], ax
		mov	byte ptr [bp+var_310], 1
		lea	ax, [bp+var_354]
		push	ax
		lea	ax, [bp+var_316]
		push	ax
		mov	al, dl
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_3CA]
		push	ax
		call	sub_14085
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_3CA]
		push	ax
		call	Conv_PlayScript_14F62
		pop	cx
		push	2
		lea	ax, [bp+var_3CA]
		push	ax
		call	sub_141F1
		add	sp, 4
		cmp	byte_603DE, 0
		jnz	short loc_80BC5
		jmp	loc_80CF9

loc_80BC5:
		cmp	[bp+var_1], 0
		jz	short loc_80BE2
		jmp	short loc_80BDC

loc_80BCD:
		push	[bp+var_3A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_3A]

loc_80BDC:
		cmp	[bp+var_3A], 2
		jb	short loc_80BCD

loc_80BE2:
		push	0
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_308]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2E6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	byte ptr [bp+var_58+3], 0
		jz	short loc_80C3E
		cmp	[bp+var_5A], 0
		jz	short loc_80C3E
		push	0
		mov	al, byte ptr [bp+var_58+2]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_80C3E

loc_80C3E:
		mov	[bp+var_5A], 0
		mov	byte ptr [bp+var_58+3], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_80C76
		cmp	[bp+var_50], 0
		jz	short loc_80C76
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_80C76

loc_80C76:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_278]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_30]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_250]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jnz	short loc_80CE9
		jmp	loc_81928

loc_80CE9:
		cmp	[bp+var_18], 0
		jnz	short loc_80CF3
		jmp	loc_81928

loc_80CF3:
		jmp	loc_80AEF
		jmp	loc_81928

loc_80CF9:
		push	13h
		push	[bp+arg_2]
		lea	ax, [bp+var_31C]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [bp+var_30C+3], 0
		lea	ax, [bp+var_31C]
		push	ax
		call	CRT_StrUpr_2F35
		pop	cx
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_30]
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	0
		cmp	byte ptr [bp+var_58+2], 3
		jnz	short loc_80D5D
		push	0
		mov	al, byte ptr [bp+var_58+2]
		push	ax
		push	large [bp+var_5A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_80D64

loc_80D5D:
		mov	edx, [bp+var_58]
		mov	ax, word ptr [bp+var_5A]

loc_80D64:
		push	dx
		push	ax
		push	large 180000h
		lea	ax, [bp+var_72]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		push	word_5DD44
		lea	ax, word ptr [bp+var_50]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	large 6100A4h
		push	1
		call	sub_1391A
		add	sp, 0Ch
		mov	[bp+var_42], 12Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_46], eax
		jmp	loc_80EEE

loc_80DA8:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_80DBA
		jmp	loc_80EEE

loc_80DBA:
		cmp	[bp+var_1], 0
		jz	short loc_80DD7
		jmp	short loc_80DD1

loc_80DC2:
		push	[bp+var_3A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_3A]

loc_80DD1:
		cmp	[bp+var_3A], 2
		jb	short loc_80DC2

loc_80DD7:
		push	0
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_308]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2E6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	byte ptr [bp+var_58+3], 0
		jz	short loc_80E33
		cmp	[bp+var_5A], 0
		jz	short loc_80E33
		push	0
		mov	al, byte ptr [bp+var_58+2]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_80E33

loc_80E33:
		mov	[bp+var_5A], 0
		mov	byte ptr [bp+var_58+3], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_80E6B
		cmp	[bp+var_50], 0
		jz	short loc_80E6B
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_80E6B

loc_80E6B:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_278]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_30]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_250]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jnz	short loc_80EDE
		jmp	loc_81928

loc_80EDE:
		cmp	[bp+var_18], 0
		jnz	short loc_80EE8
		jmp	loc_81928

loc_80EE8:
		jmp	loc_80AEF
		jmp	loc_81928

loc_80EEE:
		mov	eax, [bp+var_46]
		add	eax, [bp+var_42]
		cmp	eax, dword_5E7D3
		ja	short loc_80F02
		mov	ax, 1
		jmp	short loc_80F04

loc_80F02:
		xor	ax, ax

loc_80F04:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_80F0D
		jmp	loc_80DA8

loc_80F0D:
		cmp	byte ptr [bp+var_58+3], 0
		jz	short loc_80F31
		cmp	[bp+var_5A], 0
		jz	short loc_80F31
		push	0
		mov	al, byte ptr [bp+var_58+2]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_80F31

loc_80F31:
		mov	[bp+var_5A], 0
		mov	byte ptr [bp+var_58+3], 0
		mov	[bp+var_54], 0
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_36]
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		mov	word ptr [bp+var_5E+2], 80h
		cmp	[bp+var_1], 0
		jnz	short loc_80F76
		jmp	loc_80FFA

loc_80F76:
		push	large 0FFh
		push	large 6
		push	di
		call	sub_4180F
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_314], eax
		push	word ptr [bp+var_5E+2]
		lea	ax, word ptr [bp+var_314]
		push	ax
		push	di
		call	sub_41B2A
		add	sp, 6
		push	large 0FFh
		push	large 6
		push	di
		call	sub_4180F
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_310], eax
		push	word ptr [bp+var_5E+2]
		lea	ax, word ptr [bp+var_310]
		push	ax
		push	di
		call	sub_41B2A
		add	sp, 6
		push	large 0FFh
		push	large 6
		push	di
		call	sub_4180F
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_30C], eax
		push	word ptr [bp+var_5E+2]
		lea	ax, word ptr [bp+var_30C]
		push	ax
		push	di
		call	sub_41B2A
		add	sp, 6

loc_80FFA:
		xor	si, si
		jmp	loc_810EC

loc_80FFF:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_5E], ax
		push	ax
		lea	ax, [bp+var_308]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_81036

loc_8102B:
		lea	ax, [bp+var_308]
		push	ax
		call	sub_1EED1
		pop	cx

loc_81036:
		push	word ptr [bp+var_5E]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_8102B
		push	word ptr [bp+var_5E]
		lea	ax, [bp+var_308]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_5E], 0
		jz	short loc_8106C
		push	3
		push	word ptr [bp+var_5E]
		mov	bx, word ptr [bp+var_5E]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_8106C

loc_8106C:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_810B7
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_810B7
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_810B7

loc_810B7:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E0]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_810EC:
		cmp	si, 5
		jge	short loc_810F4
		jmp	loc_80FFF

loc_810F4:
		mov	byte ptr [bp+var_5E+1], 0
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_62+2], ax
		push	ax
		lea	ax, [bp+var_308]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_8115D

loc_81124:
		cmp	[bp+var_1], 0
		jz	short loc_81152
		mov	al, byte ptr [bp+var_5E+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_81152
		mov	bx, word ptr [bp+var_62+2]
		cmp	word ptr [bx+1Bh], 4
		jnz	short loc_81152
		push	large 0FFh
		push	large 7
		push	di
		call	sub_4163D
		add	sp, 0Ah
		mov	byte ptr [bp+var_5E+1], 1

loc_81152:
		lea	ax, [bp+var_308]
		push	ax
		call	sub_1EED1
		pop	cx

loc_8115D:
		push	word ptr [bp+var_62+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_81124
		push	word ptr [bp+var_62+2]
		lea	ax, [bp+var_308]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_62+2], 0
		jz	short loc_81193
		push	3
		push	word ptr [bp+var_62+2]
		mov	bx, word ptr [bp+var_62+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_81193

loc_81193:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_811DE
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_811DE
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_811DE

loc_811DE:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E0]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_5E], ax
		push	ax
		lea	ax, [bp+var_308]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_8124A

loc_8123F:
		lea	ax, [bp+var_308]
		push	ax
		call	sub_1EED1
		pop	cx

loc_8124A:
		push	word ptr [bp+var_5E]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_8123F
		push	word ptr [bp+var_5E]
		lea	ax, [bp+var_308]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_5E], 0
		jz	short loc_81280
		push	3
		push	word ptr [bp+var_5E]
		mov	bx, word ptr [bp+var_5E]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_81280

loc_81280:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_812CB
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_812CB
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_812CB

loc_812CB:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E0]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si
		mov	byte ptr [bp+var_5E+1], 0
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_62+2], ax
		push	ax
		lea	ax, [bp+var_308]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_81369

loc_81330:
		cmp	[bp+var_1], 0
		jz	short loc_8135E
		mov	al, byte ptr [bp+var_5E+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8135E
		mov	bx, word ptr [bp+var_62+2]
		cmp	word ptr [bx+1Bh], 4
		jnz	short loc_8135E
		push	large 0FFh
		push	large 7
		push	di
		call	sub_4163D
		add	sp, 0Ah
		mov	byte ptr [bp+var_5E+1], 1

loc_8135E:
		lea	ax, [bp+var_308]
		push	ax
		call	sub_1EED1
		pop	cx

loc_81369:
		push	word ptr [bp+var_62+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_81330
		push	word ptr [bp+var_62+2]
		lea	ax, [bp+var_308]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_62+2], 0
		jz	short loc_8139F
		push	3
		push	word ptr [bp+var_62+2]
		mov	bx, word ptr [bp+var_62+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_8139F

loc_8139F:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_813EA
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_813EA
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_813EA

loc_813EA:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E0]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si
		mov	byte ptr [bp+var_5E+1], 0
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_62+2], ax
		push	ax
		lea	ax, [bp+var_308]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_81488

loc_8144F:
		cmp	[bp+var_1], 0
		jz	short loc_8147D
		mov	al, byte ptr [bp+var_5E+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8147D
		mov	bx, word ptr [bp+var_62+2]
		cmp	word ptr [bx+1Bh], 0Ch
		jnz	short loc_8147D
		push	large 0FFh
		push	large 7
		push	di
		call	sub_4163D
		add	sp, 0Ah
		mov	byte ptr [bp+var_5E+1], 1

loc_8147D:
		lea	ax, [bp+var_308]
		push	ax
		call	sub_1EED1
		pop	cx

loc_81488:
		push	word ptr [bp+var_62+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_8144F
		push	word ptr [bp+var_62+2]
		lea	ax, [bp+var_308]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_62+2], 0
		jz	short loc_814BE
		push	3
		push	word ptr [bp+var_62+2]
		mov	bx, word ptr [bp+var_62+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_814BE

loc_814BE:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_81509
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_81509
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_81509

loc_81509:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E0]
		add	bx, ax
		mov	dword ptr [bx], 0
		jmp	loc_8166E

loc_81540:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_5E], ax
		push	ax
		lea	ax, [bp+var_308]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_815B9

loc_8156C:
		lea	ax, [bp+var_308]
		push	ax
		call	sub_1EED1
		pop	cx
		cmp	si, 0Ah
		jnz	short loc_815B9
		cmp	[bp+var_1], 0
		jz	short loc_815B9
		push	word ptr [bp+var_5E+2]
		lea	ax, word ptr [bp+var_314]
		push	ax
		push	di
		call	sub_41B2A
		add	sp, 6
		push	word ptr [bp+var_5E+2]
		lea	ax, word ptr [bp+var_310]
		push	ax
		push	di
		call	sub_41B2A
		add	sp, 6
		push	word ptr [bp+var_5E+2]
		lea	ax, word ptr [bp+var_30C]
		push	ax
		push	di
		call	sub_41B2A
		add	sp, 6
		sub	word ptr [bp+var_5E+2], 1Eh

loc_815B9:
		push	word ptr [bp+var_5E]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_8156C
		push	word ptr [bp+var_5E]
		lea	ax, [bp+var_308]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_5E], 0
		jz	short loc_815EF
		push	3
		push	word ptr [bp+var_5E]
		mov	bx, word ptr [bp+var_5E]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_815EF

loc_815EF:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_8163A
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_8163A
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8163A

loc_8163A:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E6]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E1]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2E0]
		add	bx, ax
		mov	dword ptr [bx], 0

loc_8166E:
		inc	si
		cmp	si, 0Bh
		jge	short loc_81677
		jmp	loc_81540

loc_81677:
		cmp	[bp+var_1], 0
		jz	short loc_816A7
		push	large [bp+var_314]
		push	di
		call	sub_417DC
		add	sp, 6
		push	large [bp+var_310]
		push	di
		call	sub_417DC
		add	sp, 6
		push	large [bp+var_30C]
		push	di
		call	sub_417DC
		add	sp, 6

loc_816A7:
		cmp	byte_603DE, 0
		jnz	short loc_816B1
		jmp	loc_817E5

loc_816B1:
		cmp	[bp+var_1], 0
		jz	short loc_816CE
		jmp	short loc_816C8

loc_816B9:
		push	[bp+var_3A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_3A]

loc_816C8:
		cmp	[bp+var_3A], 2
		jb	short loc_816B9

loc_816CE:
		push	0
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_308]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2E6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	byte ptr [bp+var_58+3], 0
		jz	short loc_8172A
		cmp	[bp+var_5A], 0
		jz	short loc_8172A
		push	0
		mov	al, byte ptr [bp+var_58+2]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8172A

loc_8172A:
		mov	[bp+var_5A], 0
		mov	byte ptr [bp+var_58+3], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_81762
		cmp	[bp+var_50], 0
		jz	short loc_81762
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_81762

loc_81762:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_278]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_30]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_250]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jnz	short loc_817D5
		jmp	loc_81928

loc_817D5:
		cmp	[bp+var_18], 0
		jnz	short loc_817DF
		jmp	loc_81928

loc_817DF:
		jmp	loc_80AEF
		jmp	loc_81928

loc_817E5:
		push	0
		lea	ax, [bp+var_308]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13CEA
		pop	cx
		cmp	[bp+var_1], 0
		jz	short loc_8181B
		jmp	short loc_81815

loc_81806:
		push	[bp+var_3A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_3A]

loc_81815:
		cmp	[bp+var_3A], 2
		jb	short loc_81806

loc_8181B:
		push	0
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2E6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	byte ptr [bp+var_58+3], 0
		jz	short loc_81876
		cmp	[bp+var_5A], 0
		jz	short loc_81876
		push	0
		mov	al, byte ptr [bp+var_58+2]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_81876

loc_81876:
		mov	[bp+var_5A], 0
		mov	byte ptr [bp+var_58+3], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_818AE
		cmp	[bp+var_50], 0
		jz	short loc_818AE
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_818AE

loc_818AE:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_278]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_38]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_30]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_250]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_81928
		cmp	[bp+var_18], 0
		jz	short loc_81928
		jmp	loc_80AEF

loc_81928:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_148]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_80]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_72]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_80380		endp
ovr230		ends
