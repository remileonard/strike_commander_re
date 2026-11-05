ovr225		segment	para public 'OVERLAY' use16
		assume cs:ovr225
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_789C0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si], 0FFFFh
		jz	short loc_789DB
		push	word ptr [si]
		push	di
		call	sub_41495
		add	sp, 4

loc_789DB:
		inc	word ptr [si]
		cmp	byte_603B4, 0
		jz	short loc_789F9
		push	large 0FFh
		push	0
		push	word ptr [si]
		push	di
		call	sub_4163D
		add	sp, 0Ah
		jmp	short loc_78A01

loc_789F9:
		xor	eax, eax
		shld	edx, eax, 10h

loc_78A01:
		pop	di
		pop	si
		pop	bp
		retf
sub_789C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_78A05		proc far

var_604		= word ptr -604h
var_602		= word ptr -602h
var_600		= word ptr -600h
var_5FE		= word ptr -5FEh
var_5F4		= word ptr -5F4h
var_5F2		= word ptr -5F2h
var_5F0		= word ptr -5F0h
var_5EE		= word ptr -5EEh
var_5EC		= word ptr -5ECh
var_5EA		= word ptr -5EAh
var_5E8		= word ptr -5E8h
var_5E6		= word ptr -5E6h
var_5E4		= word ptr -5E4h
var_5E2		= word ptr -5E2h
var_5E0		= word ptr -5E0h
var_5DE		= word ptr -5DEh
var_5DC		= word ptr -5DCh
var_5D8		= word ptr -5D8h
var_5B6		= dword ptr -5B6h
var_5B4		= dword ptr -5B4h
var_5B1		= word ptr -5B1h
var_5B0		= word ptr -5B0h
var_57A		= word ptr -57Ah
var_576		= word ptr -576h
var_575		= word ptr -575h
var_574		= word ptr -574h
var_552		= word ptr -552h
var_54E		= word ptr -54Eh
var_54D		= word ptr -54Dh
var_54C		= word ptr -54Ch
var_430		= word ptr -430h
var_42C		= word ptr -42Ch
var_42B		= word ptr -42Bh
var_42A		= word ptr -42Ah
var_3FE		= word ptr -3FEh
var_3FA		= word ptr -3FAh
var_3F9		= word ptr -3F9h
var_3F8		= word ptr -3F8h
var_3B8		= word ptr -3B8h
var_3B4		= word ptr -3B4h
var_3B3		= word ptr -3B3h
var_3B2		= word ptr -3B2h
var_3A4		= word ptr -3A4h
var_3A0		= word ptr -3A0h
var_39F		= word ptr -39Fh
var_39E		= word ptr -39Eh
var_35E		= dword ptr -35Eh
var_35C		= dword ptr -35Ch
var_359		= word ptr -359h
var_358		= word ptr -358h
var_322		= word ptr -322h
var_31E		= word ptr -31Eh
var_31D		= word ptr -31Dh
var_31C		= word ptr -31Ch
var_2BE		= word ptr -2BEh
var_2BA		= word ptr -2BAh
var_2B9		= word ptr -2B9h
var_2B8		= word ptr -2B8h
var_296		= word ptr -296h
var_294		= word ptr -294h
var_274		= word ptr -274h
var_25C		= word ptr -25Ch
var_1E4		= word ptr -1E4h
var_183		= dword ptr -183h
var_17F		= dword ptr -17Fh
var_177		= word ptr -177h
var_173		= dword ptr -173h
var_16C		= word ptr -16Ch
var_F4		= word ptr -0F4h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_96		= word ptr -96h
var_94		= word ptr -94h
var_92		= word ptr -92h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_88		= word ptr -88h
var_86		= word ptr -86h
var_84		= word ptr -84h
var_82		= dword ptr -82h
var_80		= dword ptr -80h
var_7E		= dword ptr -7Eh
var_7C		= dword ptr -7Ch
var_7A		= dword ptr -7Ah
var_78		= dword ptr -78h
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_64		= word ptr -64h
var_63		= word ptr -63h
var_62		= word ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= word ptr -4Eh
var_4C		= byte ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= byte ptr -46h
var_45		= word ptr -45h
var_42		= word ptr -42h
var_40		= byte ptr -40h
var_3F		= word ptr -3Fh
var_3C		= word ptr -3Ch
var_3A		= byte ptr -3Ah
var_39		= word ptr -39h
var_36		= word ptr -36h
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
var_2		= byte ptr -2
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 5F4h
		push	si
		push	di
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		cmp	word_5CF9F, 0
		jz	short loc_78A21
		mov	[bp+var_1], 1

loc_78A21:
		mov	ax, word_5DD44
		mov	[bp+var_4], ax
		mov	[bp+var_96], 0
		mov	[bp+var_94], 0
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_A4], 0
		mov	[bp+var_A2], 0
		mov	[bp+var_A0], 0
		mov	[bp+var_9E], 0
		mov	[bp+var_9C], 13Fh
		mov	[bp+var_9A], 0C7h
		push	0
		lea	ax, [bp+var_A4]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469A5
		add	sp, 4
		mov	[bp+var_92], 0
		mov	[bp+var_90], 18h
		mov	[bp+var_8E], 13Fh
		mov	[bp+var_8C], 97h
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgam01
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_F4]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_F4]
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidnoise
		push	ds
		push	offset aDataNoise
		lea	ax, [bp+var_F4]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		cmp	[bp+var_1], 0
		jnz	short loc_78B02
		jmp	loc_78B91

loc_78B02:
		push	ds
		lea	ax, [bp+var_F4]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_78B91
		push	1
		lea	ax, [bp+var_F4]
		push	ax
		lea	ax, [bp+var_1E4]
		push	ax
		mov	bx, [bp+var_1E4]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_17F]
		mov	[bp+var_72], eax
		mov	ax, [bp+var_177]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_78B55
		mov	eax, [bp+var_183]
		jmp	short loc_78B5A

loc_78B55:
		mov	eax, [bp+var_173]

loc_78B5A:
		mov	edx, [bp+var_72]
		add	edx, eax
		mov	[bp+var_76], edx
		mov	eax, [bp+var_72]
		cmp	eax, [bp+var_76]
		jz	short loc_78B89
		push	0
		push	edx
		push	eax
		lea	ax, [bp+var_1E4]
		push	ax
		lea	ax, [bp+var_25C]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		jmp	short loc_78B95

loc_78B89:
		mov	[bp+var_1], 0
		jmp	short loc_78B95
		jmp	short loc_78B95

loc_78B91:
		mov	[bp+var_1], 0

loc_78B95:
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		push	ds
		push	offset unk_5CD66
		push	ds
		push	offset aConvfontShp_1
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_F4]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_F4]
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
		lea	ax, [bp+var_274]
		push	ax
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	[bp+var_24], 0
		mov	[bp+var_22], 98h
		mov	[bp+var_20], 13Fh
		mov	[bp+var_1E], 0C7h
		lea	ax, [bp+var_274]
		push	ax
		push	word_5DD44
		sub	sp, 8
		mov	ax, [bp+var_24]
		mov	[bp+var_604], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_602], ax
		mov	ax, [bp+var_20]
		mov	[bp+var_600], ax
		mov	ax, [bp+var_1E]
		mov	[bp+var_5FE], ax
		lea	ax, [bp+var_296]
		push	ax
		call	sub_59CE5
		add	sp, 0Eh
		push	1
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_78C58
		jmp	loc_78D04

loc_78C58:
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_78C96
		cmp	[bp+var_18], 0
		jz	short loc_78C96
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_78C96

loc_78C96:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_78D04:
		mov	[bp+var_2A], 0
		mov	[bp+var_27], 0
		mov	[bp+var_30], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_36], 0
		mov	[bp+var_33], 0
		mov	[bp+var_3C], 0
		mov	[bp+var_39], 0
		mov	[bp+var_42], 0
		mov	[bp+var_3F], 0
		mov	[bp+var_48], 0
		mov	[bp+var_45], 0
		mov	[bp+var_78], 0
		mov	byte ptr [bp+var_76+2], 2
		mov	byte ptr [bp+var_76+3], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	0
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_78]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_76+3], 0
		jz	short loc_78DA1
		cmp	[bp+var_78], 0
		jz	short loc_78DA1
		push	0
		mov	al, byte ptr [bp+var_76+2]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_78DA1

loc_78DA1:
		mov	[bp+var_78], 0
		mov	byte ptr [bp+var_76+3], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	29h
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_78]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_76+3], 0
		jz	short loc_78DFE
		cmp	[bp+var_78], 0
		jz	short loc_78DFE
		push	0
		mov	al, byte ptr [bp+var_76+2]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_78DFE

loc_78DFE:
		mov	[bp+var_78], 0
		mov	byte ptr [bp+var_76+3], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	2Ch
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_78]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_76+3], 0
		jz	short loc_78E5B
		cmp	[bp+var_78], 0
		jz	short loc_78E5B
		push	0
		mov	al, byte ptr [bp+var_76+2]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_78E5B

loc_78E5B:
		mov	[bp+var_78], 0
		mov	byte ptr [bp+var_76+3], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	2Dh
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_78]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_76+3], 0
		jz	short loc_78EB8
		cmp	[bp+var_78], 0
		jz	short loc_78EB8
		push	0
		mov	al, byte ptr [bp+var_76+2]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_78EB8

loc_78EB8:
		mov	[bp+var_78], 0
		mov	byte ptr [bp+var_76+3], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	3Bh
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_78]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_76+3], 0
		jz	short loc_78F15
		cmp	[bp+var_78], 0
		jz	short loc_78F15
		push	0
		mov	al, byte ptr [bp+var_76+2]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_78F15

loc_78F15:
		mov	[bp+var_78], 0
		mov	byte ptr [bp+var_76+3], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	75h
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_78]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_76+3], 0
		jz	short loc_78F72
		cmp	[bp+var_78], 0
		jz	short loc_78F72
		push	0
		mov	al, byte ptr [bp+var_76+2]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_78F72

loc_78F72:
		mov	[bp+var_78], 0
		mov	byte ptr [bp+var_76+3], 0
		mov	[bp+var_72], 0
		lea	ax, [bp+var_4A]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	1
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_78FA2
		jmp	loc_79098

loc_78FA2:
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7902A
		cmp	[bp+var_18], 0
		jz	short loc_7902A
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7902A

loc_7902A:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_79098:
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AF4
		add	sp, 4
		push	1
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_790B8
		jmp	loc_791AE

loc_790B8:
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_79140
		cmp	[bp+var_18], 0
		jz	short loc_79140
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_79140

loc_79140:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_791AE:
		cmp	[bp+var_1], 0
		jz	short loc_791B8
		mov	di, word_5CF9F

loc_791B8:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	byte ptr [bp+var_4E], 0
		mov	byte ptr [bp+var_4E+1], 0
		mov	[bp+var_4C], 0
		push	100h
		push	0
		lea	ax, [bp+var_4E]
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
		xor	eax, eax
		mov	[bp+var_52], eax
		mov	[bp+var_56], eax
		xor	eax, eax
		mov	[bp+var_5A], eax
		mov	[bp+var_5E], eax
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_6A], 0FFFFh
		mov	[bp+var_6E], 0
		cmp	[bp+var_1], 0
		jz	short loc_79367
		xor	si, si
		jmp	short loc_79362

loc_79351:
		push	si
		lea	ax, [bp+var_25C]
		push	ax
		push	si
		push	di
		call	sub_412F9
		add	sp, 8
		inc	si

loc_79362:
		cmp	si, 9
		jl	short loc_79351

loc_79367:
		push	1
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_79379
		jmp	loc_795CD

loc_79379:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_79384
		mov	[bp+var_6A], 0

loc_79384:
		cmp	[bp+var_1], 0
		jz	short loc_793A1
		jmp	short loc_7939B

loc_7938C:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7939B:
		cmp	[bp+var_6A], 9
		jb	short loc_7938C

loc_793A1:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7955F
		cmp	[bp+var_18], 0
		jz	short loc_7955F
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7955F

loc_7955F:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_795CD:
		lea	ax, [bp+var_96]
		push	ax
		push	0FFh
		push	8
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		push	[bp+var_2A]
		mov	al, [bp+var_28]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		xor	si, si
		jmp	short loc_79621

loc_795FF:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2BE]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_79621:
		cmp	si, 4
		jl	short loc_795FF
		xor	si, si
		jmp	short loc_7964C

loc_7962A:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_322]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 8
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7964C:
		cmp	si, 0Ah
		jl	short loc_7962A
		push	1
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_79663
		jmp	loc_798C6

loc_79663:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7966E
		mov	[bp+var_6A], 0

loc_7966E:
		cmp	[bp+var_1], 0
		jz	short loc_7968B
		jmp	short loc_79685

loc_79676:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_79685:
		cmp	[bp+var_6A], 9
		jb	short loc_79676

loc_7968B:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_79858
		cmp	[bp+var_18], 0
		jz	short loc_79858
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_79858

loc_79858:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_798C6:
		mov	[bp+var_78], 0
		mov	byte ptr [bp+var_76+2], 2
		mov	byte ptr [bp+var_76+3], 0
		mov	[bp+var_72], 0
		push	3
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	1
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	0
		cmp	byte ptr [bp+var_76+2], 3
		jnz	short loc_79912
		push	0
		mov	al, byte ptr [bp+var_76+2]
		push	ax
		push	large [bp+var_78]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_79919

loc_79912:
		mov	edx, [bp+var_76]
		mov	ax, word ptr [bp+var_78]

loc_79919:
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_96]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13BB6
		pop	cx
		push	100h
		push	0
		push	3
		lea	ax, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46F0A
		add	sp, 0Ah
		cmp	byte ptr [bp+var_76+3], 0
		jz	short loc_79970
		cmp	[bp+var_78], 0
		jz	short loc_79970
		push	0
		mov	al, byte ptr [bp+var_76+2]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_79970

loc_79970:
		mov	[bp+var_78], 0
		mov	byte ptr [bp+var_76+3], 0
		mov	[bp+var_72], 0
		push	1
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_79996
		jmp	loc_79BF9

loc_79996:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_799A1
		mov	[bp+var_6A], 0

loc_799A1:
		cmp	[bp+var_1], 0
		jz	short loc_799BE
		jmp	short loc_799B8

loc_799A9:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_799B8:
		cmp	[bp+var_6A], 9
		jb	short loc_799A9

loc_799BE:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_79B8B
		cmp	[bp+var_18], 0
		jz	short loc_79B8B
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_79B8B

loc_79B8B:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_79BF9:
		xor	si, si
		jmp	short loc_79C1F

loc_79BFD:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_35E]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 14h
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_79C1F:
		cmp	si, 6
		jl	short loc_79BFD
		xor	si, si
		jmp	short loc_79C4A

loc_79C28:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3A4]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 1Fh
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_79C4A:
		cmp	si, 7
		jl	short loc_79C28
		xor	si, si
		jmp	short loc_79C75

loc_79C53:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3B8]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 2Ah
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_79C75:
		cmp	si, 2
		jl	short loc_79C53
		cmp	byte_603DE, 0
		jnz	short loc_79C84
		jmp	loc_79EE7

loc_79C84:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_79C8F
		mov	[bp+var_6A], 0

loc_79C8F:
		cmp	[bp+var_1], 0
		jz	short loc_79CAC
		jmp	short loc_79CA6

loc_79C97:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_79CA6:
		cmp	[bp+var_6A], 9
		jb	short loc_79C97

loc_79CAC:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_79E79
		cmp	[bp+var_18], 0
		jz	short loc_79E79
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_79E79

loc_79E79:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_79EE7:
		cmp	[bp+var_1], 0
		jz	short loc_79F01
		push	di
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_789C0
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6E], eax

loc_79F01:
		cmp	byte_603B5, 0
		jz	short loc_79F53
		push	0Fh
		lea	ax, [bp+var_296]
		push	ax
		call	Widget_Method_Dispatch8_48CAB
		add	sp, 4
		push	large 2000Ah
		push	3047h
		lea	ax, [bp+var_296]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 8
		push	large 20019h
		push	3067h
		lea	ax, [bp+var_296]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 8
		mov	[bp+var_52], 12Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_56], eax

loc_79F53:
		xor	si, si
		jmp	loc_7A045

loc_79F58:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2BE]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_72+2], ax
		push	ax
		lea	ax, [bp+var_5D8]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_79F8F

loc_79F84:
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EED1
		pop	cx

loc_79F8F:
		push	word ptr [bp+var_72+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_79F84
		push	word ptr [bp+var_72+2]
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_72+2], 0
		jz	short loc_79FC5
		push	3
		push	word ptr [bp+var_72+2]
		mov	bx, word ptr [bp+var_72+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_79FC5

loc_79FC5:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2B9]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7A010
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2BE]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7A010
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2BA]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2BE]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7A010

loc_7A010:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2BE]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2B9]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2B8]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7A045:
		cmp	si, 4
		jge	short loc_7A04D
		jmp	loc_79F58

loc_7A04D:
		cmp	byte_603DE, 0
		jnz	short loc_7A057
		jmp	loc_7A2BA

loc_7A057:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7A062
		mov	[bp+var_6A], 0

loc_7A062:
		cmp	[bp+var_1], 0
		jz	short loc_7A07F
		jmp	short loc_7A079

loc_7A06A:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7A079:
		cmp	[bp+var_6A], 9
		jb	short loc_7A06A

loc_7A07F:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7A24C
		cmp	[bp+var_18], 0
		jz	short loc_7A24C
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7A24C

loc_7A24C:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_7A2BA:
		mov	byte ptr [bp+var_72+1], 1
		mov	byte ptr [bp+var_72], 0
		mov	byte ptr [bp+var_76+3], 0
		mov	word ptr [bp+var_72+2], 0
		jmp	loc_7A4A3

loc_7A2CE:
		push	large 0
		mov	ax, word ptr [bp+var_72+2]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_322]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_76], ax
		push	ax
		lea	ax, [bp+var_5D8]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	loc_7A3E1

loc_7A2FC:
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EED1
		pop	cx
		cmp	[bp+var_1], 0
		jz	short loc_7A37E
		cmp	byte ptr [bp+var_72+1], 0
		jz	short loc_7A343
		cmp	[bp+var_6E], 0
		jz	short loc_7A343
		push	large [bp+var_6E]
		push	di
		call	sub_41729
		add	sp, 6
		or	al, al
		jz	short loc_7A37E
		mov	[bp+var_5A], 32h
		mov	eax, dword_5E7D3
		mov	[bp+var_5E], eax
		mov	byte ptr [bp+var_72+1], 0
		jmp	short loc_7A37E
		jmp	short loc_7A37E

loc_7A343:
		mov	eax, [bp+var_5E]
		add	eax, [bp+var_5A]
		cmp	eax, dword_5E7D3
		ja	short loc_7A357
		mov	ax, 1
		jmp	short loc_7A359

loc_7A357:
		xor	ax, ax

loc_7A359:
		or	al, al
		jz	short loc_7A37E
		mov	al, byte ptr [bp+var_72]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A37E
		push	di
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_789C0
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6E], eax
		mov	byte ptr [bp+var_72], 1

loc_7A37E:
		mov	eax, [bp+var_56]
		add	eax, [bp+var_52]
		cmp	eax, dword_5E7D3
		ja	short loc_7A392
		mov	ax, 1
		jmp	short loc_7A394

loc_7A392:
		xor	ax, ax

loc_7A394:
		or	al, al
		jz	short loc_7A3E1
		mov	al, byte ptr [bp+var_76+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A3E1
		push	0
		lea	ax, [bp+var_296]
		push	ax
		call	sub_59D12
		add	sp, 4
		cmp	byte_603B5, 0
		jz	short loc_7A3CD
		push	large 2000Ah
		push	307Dh
		lea	ax, [bp+var_296]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 8

loc_7A3CD:
		mov	byte ptr [bp+var_76+3], 1
		mov	[bp+var_52], 0C8h
		mov	eax, dword_5E7D3
		mov	[bp+var_56], eax

loc_7A3E1:
		push	word ptr [bp+var_76]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A3F3
		jmp	loc_7A2FC

loc_7A3F3:
		push	word ptr [bp+var_76]
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_76], 0
		jz	short loc_7A41A
		push	3
		push	word ptr [bp+var_76]
		mov	bx, word ptr [bp+var_76]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7A41A

loc_7A41A:
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_31D]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7A469
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_322]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7A469
		push	0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_31E]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, word ptr [bp+var_72+2]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_322]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7A469

loc_7A469:
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_322]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_31D]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_31C]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	word ptr [bp+var_72+2]

loc_7A4A3:
		cmp	word ptr [bp+var_72+2], 0Ah
		jge	short loc_7A4AC
		jmp	loc_7A2CE

loc_7A4AC:
		cmp	byte_603DE, 0
		jnz	short loc_7A4B6
		jmp	loc_7A719

loc_7A4B6:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7A4C1
		mov	[bp+var_6A], 0

loc_7A4C1:
		cmp	[bp+var_1], 0
		jz	short loc_7A4DE
		jmp	short loc_7A4D8

loc_7A4C9:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7A4D8:
		cmp	[bp+var_6A], 9
		jb	short loc_7A4C9

loc_7A4DE:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7A6AB
		cmp	[bp+var_18], 0
		jz	short loc_7A6AB
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7A6AB

loc_7A6AB:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_7A719:
		xor	eax, eax
		mov	[bp+var_76], eax
		mov	[bp+var_7A], eax
		xor	eax, eax
		mov	[bp+var_7E], eax
		mov	[bp+var_82], eax
		mov	byte ptr [bp+var_84+1], 0
		mov	byte ptr [bp+var_84], 0
		cmp	[bp+var_1], 0
		jz	short loc_7A757
		cmp	[bp+var_6E], 0
		jz	short loc_7A757
		mov	[bp+var_5A], 41h
		mov	eax, dword_5E7D3
		mov	[bp+var_5E], eax

loc_7A757:
		mov	word ptr [bp+var_72], 1
		jmp	loc_7A9CB

loc_7A75F:
		mov	[bp+var_86], 0
		mov	[bp+var_7E], 23h
		mov	eax, dword_5E7D3
		mov	[bp+var_82], eax
		jmp	short loc_7A7E5

loc_7A778:
		push	[bp+var_86]
		cmp	byte ptr [bp+var_35C+2], 3
		jnz	short loc_7A79C
		push	0
		mov	al, byte ptr [bp+var_35C+2]
		push	ax
		push	large [bp+var_35E]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7A7A5

loc_7A79C:
		mov	edx, [bp+var_35C]
		mov	ax, word ptr [bp+var_35E]

loc_7A7A5:
		push	dx
		push	ax
		push	large 180000h
		lea	ax, [bp+var_96]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		mov	[bp+var_76], 8
		mov	eax, dword_5E7D3
		mov	[bp+var_7A], eax
		lea	ax, word ptr [bp+var_7A]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		inc	[bp+var_86]
		cmp	[bp+var_86], 2
		jnz	short loc_7A7E5
		mov	[bp+var_86], 0

loc_7A7E5:
		mov	eax, [bp+var_82]
		add	eax, [bp+var_7E]
		cmp	eax, dword_5E7D3
		ja	short loc_7A7FA
		mov	ax, 1
		jmp	short loc_7A7FC

loc_7A7FA:
		xor	ax, ax

loc_7A7FC:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A805
		jmp	loc_7A778

loc_7A805:
		mov	word ptr [bp+var_72+2], 0
		jmp	loc_7A9BF

loc_7A80D:
		push	large 0
		mov	ax, word ptr [bp+var_72+2]
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_35E]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	[bp+var_88], ax
		push	ax
		lea	ax, [bp+var_5D8]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	loc_7A8EF

loc_7A83C:
		cmp	[bp+var_1], 0
		jz	short loc_7A87F
		mov	al, byte ptr [bp+var_84+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A87F
		mov	eax, [bp+var_5E]
		add	eax, [bp+var_5A]
		cmp	eax, dword_5E7D3
		ja	short loc_7A860
		mov	ax, 1
		jmp	short loc_7A862

loc_7A860:
		xor	ax, ax

loc_7A862:
		or	al, al
		jz	short loc_7A87F
		push	di
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_789C0
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6E], eax
		mov	byte ptr [bp+var_84+1], 1

loc_7A87F:
		mov	al, byte ptr [bp+var_84]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A8E4
		mov	eax, [bp+var_56]
		add	eax, [bp+var_52]
		cmp	eax, dword_5E7D3
		ja	short loc_7A89D
		mov	ax, 1
		jmp	short loc_7A89F

loc_7A89D:
		xor	ax, ax

loc_7A89F:
		or	al, al
		jz	short loc_7A8E4
		push	0
		lea	ax, [bp+var_296]
		push	ax
		call	sub_59D12
		add	sp, 4
		cmp	byte_603B5, 0
		jz	short loc_7A8CF
		push	large 2000Ah
		push	3095h
		lea	ax, [bp+var_296]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 8

loc_7A8CF:
		mov	byte ptr [bp+var_84], 1
		mov	[bp+var_52], 0C8h
		mov	eax, dword_5E7D3
		mov	[bp+var_56], eax

loc_7A8E4:
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7A8EF:
		push	[bp+var_88]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A902
		jmp	loc_7A83C

loc_7A902:
		push	[bp+var_88]
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	[bp+var_88], 0
		jz	short loc_7A92D
		push	3
		push	[bp+var_88]
		mov	bx, [bp+var_88]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7A92D

loc_7A92D:
		cmp	word ptr [bp+var_72], 2
		jz	short loc_7A936
		jmp	loc_7A9BC

loc_7A936:
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_359]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7A985
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_35E]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7A985
		push	0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_35C+2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, word ptr [bp+var_72+2]
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_35E]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7A985

loc_7A985:
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_35E]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_359]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_358]
		add	bx, ax
		mov	dword ptr [bx], 0

loc_7A9BC:
		inc	word ptr [bp+var_72+2]

loc_7A9BF:
		cmp	word ptr [bp+var_72+2], 6
		jge	short loc_7A9C8
		jmp	loc_7A80D

loc_7A9C8:
		inc	word ptr [bp+var_72]

loc_7A9CB:
		cmp	word ptr [bp+var_72], 2
		jg	short loc_7A9D4
		jmp	loc_7A75F

loc_7A9D4:
		cmp	byte_603DE, 0
		jnz	short loc_7A9DE
		jmp	loc_7AC41

loc_7A9DE:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7A9E9
		mov	[bp+var_6A], 0

loc_7A9E9:
		cmp	[bp+var_1], 0
		jz	short loc_7AA06
		jmp	short loc_7AA00

loc_7A9F1:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7AA00:
		cmp	[bp+var_6A], 9
		jb	short loc_7A9F1

loc_7AA06:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7ABD3
		cmp	[bp+var_18], 0
		jz	short loc_7ABD3
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7ABD3

loc_7ABD3:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_7AC41:
		xor	si, si
		jmp	short loc_7AC67

loc_7AC45:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3FE]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 2Eh
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7AC67:
		cmp	si, 7
		jl	short loc_7AC45
		xor	si, si
		jmp	short loc_7AC92

loc_7AC70:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_430]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 36h
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7AC92:
		cmp	si, 5
		jl	short loc_7AC70
		mov	byte ptr [bp+var_72+1], 0
		mov	byte ptr [bp+var_72], 0
		cmp	[bp+var_1], 0
		jz	short loc_7ACBC
		cmp	[bp+var_6E], 0
		jz	short loc_7ACBC
		mov	[bp+var_5A], 0Fh
		mov	eax, dword_5E7D3
		mov	[bp+var_5E], eax

loc_7ACBC:
		mov	word ptr [bp+var_72+2], 0
		jmp	loc_7AE63

loc_7ACC4:
		push	large 0
		mov	ax, word ptr [bp+var_72+2]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3A4]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_76+2], ax
		push	ax
		lea	ax, [bp+var_5D8]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	loc_7ADA1

loc_7ACF2:
		cmp	[bp+var_1], 0
		jz	short loc_7AD33
		mov	al, byte ptr [bp+var_72+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7AD33
		mov	eax, [bp+var_5E]
		add	eax, [bp+var_5A]
		cmp	eax, dword_5E7D3
		ja	short loc_7AD15
		mov	ax, 1
		jmp	short loc_7AD17

loc_7AD15:
		xor	ax, ax

loc_7AD17:
		or	al, al
		jz	short loc_7AD33
		push	di
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_789C0
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6E], eax
		mov	byte ptr [bp+var_72+1], 1

loc_7AD33:
		mov	al, byte ptr [bp+var_72]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7AD96
		mov	eax, [bp+var_56]
		add	eax, [bp+var_52]
		cmp	eax, dword_5E7D3
		ja	short loc_7AD50
		mov	ax, 1
		jmp	short loc_7AD52

loc_7AD50:
		xor	ax, ax

loc_7AD52:
		or	al, al
		jz	short loc_7AD96
		push	0
		lea	ax, [bp+var_296]
		push	ax
		call	sub_59D12
		add	sp, 4
		cmp	byte_603B5, 0
		jz	short loc_7AD82
		push	large 2000Ah
		push	30ACh
		lea	ax, [bp+var_296]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 8

loc_7AD82:
		mov	byte ptr [bp+var_72], 1
		mov	[bp+var_52], 96h
		mov	eax, dword_5E7D3
		mov	[bp+var_56], eax

loc_7AD96:
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7ADA1:
		push	word ptr [bp+var_76+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7ADB3
		jmp	loc_7ACF2

loc_7ADB3:
		push	word ptr [bp+var_76+2]
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_76+2], 0
		jz	short loc_7ADDA
		push	3
		push	word ptr [bp+var_76+2]
		mov	bx, word ptr [bp+var_76+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7ADDA

loc_7ADDA:
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_39F]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7AE29
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3A4]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7AE29
		push	0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3A0]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, word ptr [bp+var_72+2]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3A4]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7AE29

loc_7AE29:
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3A4]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_39F]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_39E]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	word ptr [bp+var_72+2]

loc_7AE63:
		cmp	word ptr [bp+var_72+2], 7
		jge	short loc_7AE6C
		jmp	loc_7ACC4

loc_7AE6C:
		cmp	byte_603DE, 0
		jnz	short loc_7AE76
		jmp	loc_7B0D9

loc_7AE76:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7AE81
		mov	[bp+var_6A], 0

loc_7AE81:
		cmp	[bp+var_1], 0
		jz	short loc_7AE9E
		jmp	short loc_7AE98

loc_7AE89:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7AE98:
		cmp	[bp+var_6A], 9
		jb	short loc_7AE89

loc_7AE9E:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7B06B
		cmp	[bp+var_18], 0
		jz	short loc_7B06B
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7B06B

loc_7B06B:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_7B0D9:
		push	0Dh
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_SetFps_45DE3
		add	sp, 4
		mov	byte ptr [bp+var_72+1], 0
		mov	byte ptr [bp+var_72], 0
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
		mov	word ptr [bp+var_72+2], 0
		jmp	loc_7B2A5

loc_7B11B:
		push	large 0
		mov	ax, word ptr [bp+var_72+2]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3B8]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_76+2], ax
		push	ax
		lea	ax, [bp+var_5D8]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	loc_7B1E3

loc_7B149:
		mov	al, byte ptr [bp+var_72+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7B170
		cmp	[bp+var_1], 0
		jz	short loc_7B170
		push	di
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_789C0
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6E], eax
		mov	byte ptr [bp+var_72+1], 1

loc_7B170:
		mov	al, byte ptr [bp+var_72]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7B1D8
		push	0
		lea	ax, [bp+var_296]
		push	ax
		call	sub_59D12
		add	sp, 4
		cmp	byte_603B5, 0
		jz	short loc_7B1C4
		push	0FEh
		lea	ax, [bp+var_296]
		push	ax
		call	Widget_Method_Dispatch8_48CAB
		add	sp, 4
		push	large 2000Ah
		push	30CEh
		lea	ax, [bp+var_296]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 8
		push	0Fh
		lea	ax, [bp+var_296]
		push	ax
		call	Widget_Method_Dispatch8_48CAB
		add	sp, 4

loc_7B1C4:
		mov	byte ptr [bp+var_72], 1
		mov	[bp+var_52], 96h
		mov	eax, dword_5E7D3
		mov	[bp+var_56], eax

loc_7B1D8:
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7B1E3:
		push	word ptr [bp+var_76+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7B1F5
		jmp	loc_7B149

loc_7B1F5:
		push	word ptr [bp+var_76+2]
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_76+2], 0
		jz	short loc_7B21C
		push	3
		push	word ptr [bp+var_76+2]
		mov	bx, word ptr [bp+var_76+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7B21C

loc_7B21C:
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3B3]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7B26B
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3B8]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7B26B
		push	0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3B4]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, word ptr [bp+var_72+2]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3B8]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7B26B

loc_7B26B:
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3B8]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3B3]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, word ptr [bp+var_72+2]
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3B2]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	word ptr [bp+var_72+2]

loc_7B2A5:
		cmp	word ptr [bp+var_72+2], 2
		jge	short loc_7B2AE
		jmp	loc_7B11B

loc_7B2AE:
		cmp	byte_603DE, 0
		jnz	short loc_7B2B8
		jmp	loc_7B51B

loc_7B2B8:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7B2C3
		mov	[bp+var_6A], 0

loc_7B2C3:
		cmp	[bp+var_1], 0
		jz	short loc_7B2E0
		jmp	short loc_7B2DA

loc_7B2CB:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7B2DA:
		cmp	[bp+var_6A], 9
		jb	short loc_7B2CB

loc_7B2E0:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7B4AD
		cmp	[bp+var_18], 0
		jz	short loc_7B4AD
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7B4AD

loc_7B4AD:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_7B51B:
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_72], eax
		mov	[bp+var_76], eax
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_96]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		push	0
		push	[bp+var_3C]
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		mov	byte ptr [bp+var_78+1], 0
		mov	byte ptr [bp+var_78], 0
		xor	eax, eax
		mov	[bp+var_7C], eax
		mov	[bp+var_80], eax
		mov	[bp+var_7C], 32h
		mov	eax, dword_5E7D3
		mov	[bp+var_80], eax
		xor	si, si
		jmp	loc_7B744

loc_7B597:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3FE]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_82], ax
		push	ax
		lea	ax, [bp+var_5D8]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	loc_7B686

loc_7B5C5:
		mov	al, byte ptr [bp+var_78+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7B5EC
		cmp	[bp+var_1], 0
		jz	short loc_7B5EC
		push	di
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_789C0
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6E], eax
		mov	byte ptr [bp+var_78+1], 1

loc_7B5EC:
		mov	al, byte ptr [bp+var_78]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7B638
		push	0
		lea	ax, [bp+var_296]
		push	ax
		call	sub_59D12
		add	sp, 4
		cmp	byte_603B5, 0
		jz	short loc_7B624
		push	large 2000Ah
		push	0A0h
		push	30F8h
		lea	ax, [bp+var_296]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah

loc_7B624:
		mov	byte ptr [bp+var_78], 1
		mov	[bp+var_52], 96h
		mov	eax, dword_5E7D3
		mov	[bp+var_56], eax

loc_7B638:
		mov	eax, [bp+var_80]
		add	eax, [bp+var_7C]
		cmp	eax, dword_5E7D3
		ja	short loc_7B64C
		mov	ax, 1
		jmp	short loc_7B64E

loc_7B64C:
		xor	ax, ax

loc_7B64E:
		or	al, al
		jz	short loc_7B67B
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	Palette_FadeStep_46DD3
		add	sp, 4
		or	al, al
		jz	short loc_7B67B
		push	0
		push	[bp+var_3C]
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8

loc_7B67B:
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7B686:
		push	word ptr [bp+var_82]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7B699
		jmp	loc_7B5C5

loc_7B699:
		push	word ptr [bp+var_82]
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_82], 0
		jz	short loc_7B6C4
		push	3
		push	word ptr [bp+var_82]
		mov	bx, word ptr [bp+var_82]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7B6C4

loc_7B6C4:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3F9]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7B70F
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3FE]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7B70F
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3FA]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3FE]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7B70F

loc_7B70F:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3FE]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3F9]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3F8]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7B744:
		cmp	si, 7
		jge	short loc_7B74C
		jmp	loc_7B597

loc_7B74C:
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	byte_603DE, 0
		jnz	short loc_7B765
		jmp	loc_7B9B9

loc_7B765:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7B770
		mov	[bp+var_6A], 0

loc_7B770:
		cmp	[bp+var_1], 0
		jz	short loc_7B78D
		jmp	short loc_7B787

loc_7B778:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7B787:
		cmp	[bp+var_6A], 9
		jb	short loc_7B778

loc_7B78D:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7B94B
		cmp	[bp+var_18], 0
		jz	short loc_7B94B
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7B94B

loc_7B94B:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_7B9B9:
		lea	ax, [bp+var_96]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		mov	byte ptr [bp+var_78+1], 0
		mov	byte ptr [bp+var_78], 0
		xor	si, si
		jmp	loc_7BB40

loc_7B9DD:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_430]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_7A], ax
		push	ax
		lea	ax, [bp+var_5D8]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_7BA87

loc_7BA09:
		mov	al, byte ptr [bp+var_78+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7BA30
		cmp	[bp+var_1], 0
		jz	short loc_7BA30
		push	di
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_789C0
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6E], eax
		mov	byte ptr [bp+var_78+1], 1

loc_7BA30:
		mov	al, byte ptr [bp+var_78]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7BA7C
		push	0
		lea	ax, [bp+var_296]
		push	ax
		call	sub_59D12
		add	sp, 4
		cmp	byte_603B5, 0
		jz	short loc_7BA68
		push	large 2000Ah
		push	0A0h
		push	3113h
		lea	ax, [bp+var_296]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah

loc_7BA68:
		mov	byte ptr [bp+var_78], 1
		mov	[bp+var_52], 96h
		mov	eax, dword_5E7D3
		mov	[bp+var_56], eax

loc_7BA7C:
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7BA87:
		push	word ptr [bp+var_7A]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7BA99
		jmp	loc_7BA09

loc_7BA99:
		push	word ptr [bp+var_7A]
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_7A], 0
		jz	short loc_7BAC0
		push	3
		push	word ptr [bp+var_7A]
		mov	bx, word ptr [bp+var_7A]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7BAC0

loc_7BAC0:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_42B]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7BB0B
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_430]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7BB0B
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_42C]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_430]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7BB0B

loc_7BB0B:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_430]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_42B]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_42A]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7BB40:
		cmp	si, 5
		jge	short loc_7BB48
		jmp	loc_7B9DD

loc_7BB48:
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	0
		lea	ax, [bp+var_296]
		push	ax
		call	sub_59D12
		add	sp, 4
		cmp	byte_603DE, 0
		jnz	short loc_7BB70
		jmp	loc_7BDC4

loc_7BB70:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7BB7B
		mov	[bp+var_6A], 0

loc_7BB7B:
		cmp	[bp+var_1], 0
		jz	short loc_7BB98
		jmp	short loc_7BB92

loc_7BB83:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7BB92:
		cmp	[bp+var_6A], 9
		jb	short loc_7BB83

loc_7BB98:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7BD56
		cmp	[bp+var_18], 0
		jz	short loc_7BD56
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7BD56

loc_7BD56:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_7BDC4:
		xor	si, si
		jmp	short loc_7BDEA

loc_7BDC8:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_552]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 3Ch
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7BDEA:
		cmp	si, 1Dh
		jl	short loc_7BDC8
		xor	si, si
		jmp	short loc_7BE15

loc_7BDF3:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_57A]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 59h
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7BE15:
		cmp	si, 4
		jl	short loc_7BDF3
		lea	ax, [bp+var_96]
		push	ax
		push	6
		push	0Dh
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_42]
		mov	al, [bp+var_40]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		mov	byte ptr [bp+var_78+1], 0
		xor	si, si
		jmp	loc_7BEF5

loc_7BE5C:
		mov	ax, 4
		call	Math_RandomScale_39596
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_57A]
		add	ax, dx
		mov	word ptr [bp+var_7A], ax
		mov	ax, 164h
		call	Math_RandomScale_39596
		mov	word ptr [bp+var_7C], ax
		mov	ax, 0A8h
		call	Math_RandomScale_39596
		mov	word ptr [bp+var_7E], ax
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_80], ax
		or	ax, ax
		jz	short loc_7BECC
		push	word ptr [bp+var_7E]
		push	word ptr [bp+var_7C]
		push	word ptr [bp+var_7A]
		push	ax
		call	Layer_Construct_45F57
		add	sp, 8
		mov	bx, word ptr [bp+var_80]
		mov	word ptr [bx], 1EAFh
		mov	word ptr [bx+0Ah], 1ECFh
		mov	word ptr [bx+1Dh], 0
		mov	word ptr [bx+1Fh], 0
		mov	word ptr [bx+1Dh], 0FFFFh
		mov	word ptr [bx+1Fh], 0FFFFh
		mov	ax, word ptr [bp+var_80]
		jmp	short loc_7BECF

loc_7BECC:
		mov	ax, word ptr [bp+var_80]

loc_7BECF:
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_5E8]
		add	bx, dx
		mov	[bx], ax
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5E8]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_5D8]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		inc	si

loc_7BEF5:
		cmp	si, 8
		jge	short loc_7BEFD
		jmp	loc_7BE5C

loc_7BEFD:
		mov	al, byte ptr [bp+var_78+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7BF24
		cmp	[bp+var_1], 0
		jz	short loc_7BF24
		push	di
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_789C0
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6E], eax
		mov	byte ptr [bp+var_78+1], 1

loc_7BF24:
		xor	si, si
		jmp	loc_7C01C

loc_7BF29:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_552]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_82], ax
		push	ax
		lea	ax, [bp+var_5D8]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_7BF61

loc_7BF56:
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7BF61:
		push	word ptr [bp+var_82]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_7BF56
		push	word ptr [bp+var_82]
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_82], 0
		jz	short loc_7BF9C
		push	3
		push	word ptr [bp+var_82]
		mov	bx, word ptr [bp+var_82]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7BF9C

loc_7BF9C:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_54D]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7BFE7
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_552]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7BFE7
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_54E]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_552]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7BFE7

loc_7BFE7:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_552]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_54D]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_54C]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7C01C:
		cmp	si, 1Dh
		jge	short loc_7C024
		jmp	loc_7BF29

loc_7C024:
		xor	si, si
		jmp	short loc_7C042

loc_7C028:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5E8]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_45B7D
		add	sp, 4
		inc	si

loc_7C042:
		cmp	si, 8
		jl	short loc_7C028
		xor	si, si
		jmp	loc_7C0CC

loc_7C04C:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_575]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7C097
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_57A]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7C097
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_576]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_57A]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7C097

loc_7C097:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_57A]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_575]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_574]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7C0CC:
		cmp	si, 4
		jge	short loc_7C0D4
		jmp	loc_7C04C

loc_7C0D4:
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	byte_603DE, 0
		jnz	short loc_7C0ED
		jmp	loc_7C341

loc_7C0ED:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7C0F8
		mov	[bp+var_6A], 0

loc_7C0F8:
		cmp	[bp+var_1], 0
		jz	short loc_7C115
		jmp	short loc_7C10F

loc_7C100:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7C10F:
		cmp	[bp+var_6A], 9
		jb	short loc_7C100

loc_7C115:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7C2D3
		cmp	[bp+var_18], 0
		jz	short loc_7C2D3
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7C2D3

loc_7C2D3:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_7C341:
		xor	si, si
		jmp	short loc_7C366

loc_7C345:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_68]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 76h
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7C366:
		cmp	si, 1
		jl	short loc_7C345
		lea	ax, [bp+var_96]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0Bh
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_SetFps_45DE3
		add	sp, 4
		mov	byte ptr [bp+var_78+1], 0
		mov	byte ptr [bp+var_78], 0
		xor	si, si
		jmp	loc_7C4DA

loc_7C3AC:
		mov	al, byte ptr [bp+var_78+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7C3CE
		push	0
		push	[bp+var_48]
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		mov	byte ptr [bp+var_78+1], 1

loc_7C3CE:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_68]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_7A], ax
		push	ax
		lea	ax, [bp+var_5D8]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_7C42B

loc_7C3F9:
		mov	al, byte ptr [bp+var_78]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7C420
		cmp	[bp+var_1], 0
		jz	short loc_7C420
		push	di
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_789C0
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_6E], eax
		mov	byte ptr [bp+var_78], 1

loc_7C420:
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7C42B:
		push	word ptr [bp+var_7A]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_7C3F9
		push	word ptr [bp+var_7A]
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_7A], 0
		jz	short loc_7C461
		push	3
		push	word ptr [bp+var_7A]
		mov	bx, word ptr [bp+var_7A]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7C461

loc_7C461:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_63]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7C4A8
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_68]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7C4A8
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_64]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_68]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7C4A8

loc_7C4A8:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_68]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_63]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7C4DA:
		cmp	si, 1
		jge	short loc_7C4E2
		jmp	loc_7C3AC

loc_7C4E2:
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	byte_603DE, 0
		jnz	short loc_7C4FB
		jmp	loc_7C74F

loc_7C4FB:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7C506
		mov	[bp+var_6A], 0

loc_7C506:
		cmp	[bp+var_1], 0
		jz	short loc_7C523
		jmp	short loc_7C51D

loc_7C50E:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7C51D:
		cmp	[bp+var_6A], 9
		jb	short loc_7C50E

loc_7C523:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7C6E1
		cmp	[bp+var_18], 0
		jz	short loc_7C6E1
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7C6E1

loc_7C6E1:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_7C74F:
		xor	si, si
		jmp	short loc_7C775

loc_7C753:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_5B6]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 77h
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7C775:
		cmp	si, 6
		jl	short loc_7C753
		lea	ax, [bp+var_96]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		mov	byte ptr [bp+var_78+1], 0
		xor	si, si
		jmp	loc_7C9C8

loc_7C79A:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_5B6]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_7A], ax
		push	ax
		lea	ax, [bp+var_5D8]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	loc_7C90F

loc_7C7C7:
		mov	al, byte ptr [bp+var_78+1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_7C7D3
		jmp	loc_7C904

loc_7C7D3:
		mov	[bp+var_92], 0
		mov	[bp+var_90], 0
		mov	[bp+var_8E], 13Fh
		mov	[bp+var_8C], 0C7h
		push	0
		cmp	byte ptr [bp+var_5B4+2], 3
		jnz	short loc_7C80D
		push	0
		mov	al, byte ptr [bp+var_5B4+2]
		push	ax
		push	large [bp+var_5B6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7C816

loc_7C80D:
		mov	edx, [bp+var_5B4]
		mov	ax, word ptr [bp+var_5B6]

loc_7C816:
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		mov	[bp+var_5E6], 0
		mov	[bp+var_5E4], 0
		lea	ax, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_5E6]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	ax, word_5DD44
		mov	word ptr [bp+var_7C], ax
		mov	[bp+var_5F4], 0
		mov	[bp+var_5F2], 0
		push	ax
		lea	ax, [bp+var_5F4]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	word ptr [bp+var_7E], 0
		jmp	short loc_7C8E4

loc_7C86D:
		mov	ax, 18h
		sub	ax, word ptr [bp+var_7E]
		mov	word ptr [bp+var_80], ax
		mov	ax, word ptr [bp+var_7E]
		shl	ax, 1
		add	ax, 97h
		mov	word ptr [bp+var_82], ax
		mov	[bp+var_5E2], 0
		mov	ax, word ptr [bp+var_80]
		mov	[bp+var_5E0], ax
		mov	[bp+var_5DE], 13Fh
		mov	ax, word ptr [bp+var_82]
		mov	[bp+var_5DC], ax
		mov	ax, 18h
		sub	ax, word ptr [bp+var_7E]
		mov	[bp+var_84], ax
		mov	ax, word ptr [bp+var_7E]
		shl	ax, 1
		add	ax, 97h
		mov	[bp+var_86], ax
		mov	[bp+var_5F0], 0
		mov	ax, [bp+var_84]
		mov	[bp+var_5EE], ax
		mov	[bp+var_5EC], 13Fh
		mov	ax, [bp+var_86]
		mov	[bp+var_5EA], ax
		lea	ax, [bp+var_5E6]
		push	ax
		lea	ax, [bp+var_5F4]
		push	ax
		call	UI_ApplyEncodingHelper_47B38
		add	sp, 4
		inc	word ptr [bp+var_7E]

loc_7C8E4:
		cmp	word ptr [bp+var_7E], 18h
		jle	short loc_7C86D
		mov	byte ptr [bp+var_78+1], 1
		lea	ax, [bp+var_5F4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_5E6]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx

loc_7C904:
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7C90F:
		push	word ptr [bp+var_7A]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7C921
		jmp	loc_7C7C7

loc_7C921:
		push	word ptr [bp+var_7A]
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_7A], 0
		jz	short loc_7C948
		push	3
		push	word ptr [bp+var_7A]
		mov	bx, word ptr [bp+var_7A]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7C948

loc_7C948:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_5B1]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7C993
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_5B6]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7C993
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_5B4+2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_5B6]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7C993

loc_7C993:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_5B6]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_5B1]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_5B0]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7C9C8:
		cmp	si, 6
		jge	short loc_7C9D0
		jmp	loc_7C79A

loc_7C9D0:
		mov	[bp+var_72], 64h
		mov	eax, dword_5E7D3
		mov	[bp+var_76], eax
		lea	ax, word ptr [bp+var_76]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		push	0
		lea	ax, [bp+var_5D8]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	byte_603DE, 0
		jnz	short loc_7CA03
		jmp	loc_7CC57

loc_7CA03:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7CA0E
		mov	[bp+var_6A], 0

loc_7CA0E:
		cmp	[bp+var_1], 0
		jz	short loc_7CA2B
		jmp	short loc_7CA25

loc_7CA16:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7CA25:
		cmp	[bp+var_6A], 9
		jb	short loc_7CA16

loc_7CA2B:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7CBE9
		cmp	[bp+var_18], 0
		jz	short loc_7CBE9
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7CBE9

loc_7CBE9:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_7CEB6

loc_7CC57:
		cmp	[bp+var_6A], 0FFFFh
		jnz	short loc_7CC62
		mov	[bp+var_6A], 0

loc_7CC62:
		cmp	[bp+var_1], 0
		jz	short loc_7CC7F
		jmp	short loc_7CC79

loc_7CC6A:
		push	[bp+var_6A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_6A]

loc_7CC79:
		cmp	[bp+var_6A], 9
		jb	short loc_7CC6A

loc_7CC7F:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_5B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10001h
		push	0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1001Dh
		push	0Ah
		lea	ax, [bp+var_552]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_430]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_3B8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_3A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10006h
		push	0Ah
		lea	ax, word ptr [bp+var_35E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_322]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46E08
		pop	cx
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
		lea	ax, [bp+var_294]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7CE4B
		cmp	[bp+var_18], 0
		jz	short loc_7CE4B
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7CE4B

loc_7CE4B:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx

loc_7CEB6:
		pop	di
		pop	si
		leave
		retf
sub_78A05		endp
ovr225		ends
