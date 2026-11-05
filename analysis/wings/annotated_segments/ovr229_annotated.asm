ovr229		segment	para public 'OVERLAY' use16
		assume cs:ovr229
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7EBA0		proc far

var_37C		= word ptr -37Ch
var_37A		= word ptr -37Ah
var_378		= word ptr -378h
var_376		= word ptr -376h
var_36C		= word ptr -36Ch
var_2F6		= word ptr -2F6h
var_2E1		= byte ptr -2E1h
var_2CD		= byte ptr -2CDh
var_2B8		= word ptr -2B8h
var_2B2		= byte ptr -2B2h
var_2AA		= word ptr -2AAh
var_288		= word ptr -288h
var_284		= word ptr -284h
var_283		= word ptr -283h
var_282		= word ptr -282h
var_26A		= word ptr -26Ah
var_266		= word ptr -266h
var_265		= word ptr -265h
var_264		= word ptr -264h
var_224		= word ptr -224h
var_222		= word ptr -222h
var_220		= word ptr -220h
var_21E		= word ptr -21Eh
var_21C		= dword ptr -21Ch
var_218		= byte ptr -218h
var_216		= word ptr -216h
var_214		= word ptr -214h
var_1F4		= word ptr -1F4h
var_1DC		= word ptr -1DCh
var_164		= word ptr -164h
var_EC		= word ptr -0ECh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= word ptr -96h
var_94		= word ptr -94h
var_92		= word ptr -92h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_88		= word ptr -88h
var_86		= word ptr -86h
var_84		= word ptr -84h
var_80		= word ptr -80h
var_7C		= dword ptr -7Ch
var_78		= word ptr -78h
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= word ptr -56h
var_54		= byte ptr -54h
var_52		= dword ptr -52h
var_4E		= byte ptr -4Eh
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword ptr -42h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= byte ptr -3Ah
var_39		= word ptr -39h
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

		push	bp
		mov	bp, sp
		sub	sp, 36Ch
		push	si
		push	di
		mov	[bp+var_1], 0
		cmp	word_5CF9F, 0
		jz	short loc_7EBB8
		mov	[bp+var_1], 1

loc_7EBB8:
		mov	ax, word_5DD44
		mov	[bp+var_4], ax
		mov	[bp+var_8E], 0
		mov	[bp+var_8C], 0
		push	ax
		lea	ax, [bp+var_8E]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_9C], 0
		mov	[bp+var_9A], 0
		mov	[bp+var_98], 0
		mov	[bp+var_96], 0
		mov	[bp+var_94], 13Fh
		mov	[bp+var_92], 0C7h
		push	0
		lea	ax, [bp+var_9C]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469A5
		add	sp, 4
		mov	[bp+var_8A], 0
		mov	[bp+var_88], 18h
		mov	[bp+var_86], 13Fh
		mov	[bp+var_84], 97h
		push	ds
		push	offset aPak
		push	ds
		push	large offset aMidgam05
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_EC]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_164]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aCestalk
		push	ds
		push	offset aDataCestalk
		lea	ax, [bp+var_EC]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_1DC]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		push	ds
		push	offset unk_5CEB8
		push	ds
		push	offset aConvfontShp_3
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_EC]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_EC]
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
		lea	ax, [bp+var_1F4]
		push	ax
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	[bp+var_24], 0
		mov	[bp+var_22], 98h
		mov	[bp+var_20], 13Fh
		mov	[bp+var_1E], 0C7h
		lea	ax, [bp+var_1F4]
		push	ax
		push	word_5DD44
		sub	sp, 8
		mov	ax, [bp+var_24]
		mov	[bp+var_37C], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_37A], ax
		mov	ax, [bp+var_20]
		mov	[bp+var_378], ax
		mov	ax, [bp+var_1E]
		mov	[bp+var_376], ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_59CE5
		add	sp, 0Eh
		mov	[bp+var_2A], 0
		mov	[bp+var_27], 0
		mov	[bp+var_30], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_36], 0
		mov	[bp+var_33], 0
		mov	[bp+var_3C], 0
		mov	[bp+var_39], 0
		mov	[bp+var_7C], 0
		mov	byte ptr [bp+var_78], 2
		mov	byte ptr [bp+var_78+1], 0
		mov	[bp+var_76], 0
		push	2
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	0
		lea	ax, [bp+var_164]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_7C]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_78+1], 0
		jz	short loc_7EDBF
		cmp	[bp+var_7C], 0
		jz	short loc_7EDBF
		push	0
		mov	al, byte ptr [bp+var_78]
		push	ax
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7EDBF

loc_7EDBF:
		mov	[bp+var_7C], 0
		mov	byte ptr [bp+var_78+1], 0
		mov	[bp+var_76], 0
		push	2
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	8
		lea	ax, [bp+var_164]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_7C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_78+1], 0
		jz	short loc_7EE1C
		cmp	[bp+var_7C], 0
		jz	short loc_7EE1C
		push	0
		mov	al, byte ptr [bp+var_78]
		push	ax
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7EE1C

loc_7EE1C:
		mov	[bp+var_7C], 0
		mov	byte ptr [bp+var_78+1], 0
		mov	[bp+var_76], 0
		push	2
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	0Ch
		lea	ax, [bp+var_164]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_7C]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_78+1], 0
		jz	short loc_7EE79
		cmp	[bp+var_7C], 0
		jz	short loc_7EE79
		push	0
		mov	al, byte ptr [bp+var_78]
		push	ax
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7EE79

loc_7EE79:
		mov	[bp+var_7C], 0
		mov	byte ptr [bp+var_78+1], 0
		mov	[bp+var_76], 0
		push	2
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	0Eh
		lea	ax, [bp+var_164]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_7C]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_78+1], 0
		jz	short loc_7EED6
		cmp	[bp+var_7C], 0
		jz	short loc_7EED6
		push	0
		mov	al, byte ptr [bp+var_78]
		push	ax
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7EED6

loc_7EED6:
		mov	[bp+var_7C], 0
		mov	byte ptr [bp+var_78+1], 0
		mov	[bp+var_76], 0
		cmp	byte ptr [bp+var_78+1], 0
		jz	short loc_7EF0E
		cmp	[bp+var_7C], 0
		jz	short loc_7EF0E
		push	0
		mov	al, byte ptr [bp+var_78]
		push	ax
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7EF0E

loc_7EF0E:
		mov	[bp+var_7C], 0
		mov	byte ptr [bp+var_78+1], 0
		mov	[bp+var_76], 0
		lea	ax, [bp+var_3E]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	9
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13AF4
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_7EF44
		mov	di, word_5CF9F

loc_7EF44:
		mov	[bp+var_48], 0
		mov	[bp+var_44], 2
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		mov	[bp+var_52], 0
		mov	[bp+var_4E], 2
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		mov	[bp+var_220], 96Dh
		mov	ax, word_5DD68
		mov	[bp+var_21E], ax
		lea	ax, [bp+var_220]
		mov	word_5DD68, ax
		mov	[bp+var_220], 975h
		mov	[bp+var_21C], 0
		mov	[bp+var_218], 0
		mov	[bp+var_224], 0
		mov	[bp+var_222], 0FFFFh
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	byte ptr [bp+var_56], 0
		mov	byte ptr [bp+var_56+1], 0
		mov	[bp+var_54], 0
		push	100h
		push	0
		lea	ax, [bp+var_56]
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
		mov	[bp+var_5A], eax
		mov	[bp+var_5E], eax
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_26A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10003h
		push	0Ah
		lea	ax, [bp+var_288]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_66+2], 2
		mov	byte ptr [bp+var_66+3], 0
		mov	[bp+var_62], 0
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_70+2], 2
		mov	byte ptr [bp+var_70+3], 0
		mov	[bp+var_6C], 0
		xor	si, si
		jmp	short loc_7F086

loc_7F066:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_26A]
		add	ax, dx
		push	ax
		mov	ax, si
		inc	ax
		push	ax
		lea	ax, [bp+var_164]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7F086:
		cmp	si, 7
		jl	short loc_7F066
		xor	si, si
		jmp	short loc_7F0B1

loc_7F08F:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_288]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		lea	ax, [bp+var_164]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_7F0B1:
		cmp	si, 3
		jl	short loc_7F08F
		push	3
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	0Dh
		lea	ax, [bp+var_164]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	0Fh
		lea	ax, [bp+var_164]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13BB6
		pop	cx
		lea	ax, [bp+var_8E]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_2AA]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		mov	byte ptr [bp+var_78+1], 0BDh
		mov	byte ptr [bp+var_2F6], 0
		mov	byte ptr [bp+var_2F6+1], 0
		mov	[bp+var_2E1], 0
		mov	[bp+var_2CD], 0
		mov	[bp+var_2B2], 1
		lea	ax, [bp+var_2F6]
		push	ax
		lea	ax, [bp+var_2B8]
		push	ax
		mov	al, byte ptr [bp+var_78+1]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_36C]
		push	ax
		call	sub_14085
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_36C]
		push	ax
		call	sub_14F62
		pop	cx
		push	2
		lea	ax, [bp+var_36C]
		push	ax
		call	sub_141F1
		add	sp, 4
		cmp	byte_603DE, 0
		jnz	short loc_7F16D
		jmp	loc_7F39E

loc_7F16D:
		cmp	[bp+var_1], 0
		jz	short loc_7F17E
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_7F17E:
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_2AA]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	byte ptr [bp+var_70+3], 0
		jz	short loc_7F1BF
		cmp	[bp+var_72], 0
		jz	short loc_7F1BF
		push	0
		mov	al, byte ptr [bp+var_70+2]
		push	ax
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F1BF

loc_7F1BF:
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_70+3], 0
		mov	[bp+var_6C], 0
		cmp	byte ptr [bp+var_66+3], 0
		jz	short loc_7F1F7
		cmp	[bp+var_68], 0
		jz	short loc_7F1F7
		push	0
		mov	al, byte ptr [bp+var_66+2]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F1F7

loc_7F1F7:
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_66+3], 0
		mov	[bp+var_62], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10003h
		push	0Ah
		lea	ax, [bp+var_288]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_26A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_224]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_220]
		push	ax
		call	sub_19116
		add	sp, 4
		cmp	[bp+var_4D], 0
		jz	short loc_7F27F
		cmp	[bp+var_52], 0
		jz	short loc_7F27F
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F27F

loc_7F27F:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_7F2B7
		cmp	[bp+var_48], 0
		jz	short loc_7F2B7
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F2B7

loc_7F2B7:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13AAE
		add	sp, 4
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
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_1F4]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7F33F
		cmp	[bp+var_18], 0
		jz	short loc_7F33F
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F33F

loc_7F33F:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_1DC]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_164]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_9C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_8E]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_80379

loc_7F39E:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_3C]
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	0
		cmp	byte ptr [bp+var_70+2], 3
		jnz	short loc_7F3E0
		push	0
		mov	al, byte ptr [bp+var_70+2]
		push	ax
		push	large [bp+var_72]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7F3E7

loc_7F3E0:
		mov	edx, [bp+var_70]
		mov	ax, word ptr [bp+var_72]

loc_7F3E7:
		push	dx
		push	ax
		push	large 180000h
		lea	ax, [bp+var_8E]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		mov	[bp+var_5A], 12Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_5E], eax
		jmp	loc_7F633

loc_7F40F:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_7F421
		jmp	loc_7F633

loc_7F421:
		push	0
		lea	ax, [bp+var_2AA]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	byte ptr [bp+var_70+3], 0
		jz	short loc_7F454
		cmp	[bp+var_72], 0
		jz	short loc_7F454
		push	0
		mov	al, byte ptr [bp+var_70+2]
		push	ax
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F454

loc_7F454:
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_70+3], 0
		mov	[bp+var_6C], 0
		cmp	byte ptr [bp+var_66+3], 0
		jz	short loc_7F48C
		cmp	[bp+var_68], 0
		jz	short loc_7F48C
		push	0
		mov	al, byte ptr [bp+var_66+2]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F48C

loc_7F48C:
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_66+3], 0
		mov	[bp+var_62], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10003h
		push	0Ah
		lea	ax, [bp+var_288]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_26A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_224]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_220]
		push	ax
		call	sub_19116
		add	sp, 4
		cmp	[bp+var_4D], 0
		jz	short loc_7F514
		cmp	[bp+var_52], 0
		jz	short loc_7F514
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F514

loc_7F514:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_7F54C
		cmp	[bp+var_48], 0
		jz	short loc_7F54C
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F54C

loc_7F54C:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13AAE
		add	sp, 4
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
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_1F4]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7F5D4
		cmp	[bp+var_18], 0
		jz	short loc_7F5D4
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F5D4

loc_7F5D4:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_1DC]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_164]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_9C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_8E]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_80379

loc_7F633:
		mov	eax, [bp+var_5E]
		add	eax, [bp+var_5A]
		cmp	eax, dword_5E7D3
		ja	short loc_7F647
		mov	ax, 1
		jmp	short loc_7F649

loc_7F647:
		xor	ax, ax

loc_7F649:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7F652
		jmp	loc_7F40F

loc_7F652:
		cmp	byte ptr [bp+var_70+3], 0
		jz	short loc_7F676
		cmp	[bp+var_72], 0
		jz	short loc_7F676
		push	0
		mov	al, byte ptr [bp+var_70+2]
		push	ax
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F676

loc_7F676:
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_70+3], 0
		mov	[bp+var_6C], 0
		mov	byte ptr [bp+var_78+1], 0BCh
		mov	byte ptr [bp+var_2F6], 0
		mov	byte ptr [bp+var_2F6+1], 0
		mov	[bp+var_2E1], 0
		mov	[bp+var_2CD], 0
		mov	[bp+var_2B2], 1
		lea	ax, [bp+var_2F6]
		push	ax
		lea	ax, [bp+var_2B8]
		push	ax
		mov	al, byte ptr [bp+var_78+1]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_36C]
		push	ax
		call	sub_14085
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_36C]
		push	ax
		call	sub_14F62
		pop	cx
		push	2
		lea	ax, [bp+var_36C]
		push	ax
		call	sub_141F1
		add	sp, 4
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
		cmp	[bp+var_1], 0
		jz	short loc_7F74B
		push	9
		push	di
		call	sub_4137E
		add	sp, 4
		mov	bx, [di+8]
		mov	ax, [bx+4Ch]
		or	ax, [bx+4Eh]
		jnz	short loc_7F731
		mov	[bp+var_1], 0
		jmp	short loc_7F74B

loc_7F731:
		push	large 80h
		push	large 9
		push	di
		call	sub_4180F
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_76], eax

loc_7F74B:
		xor	si, si
		jmp	loc_7F83D

loc_7F750:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_26A]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	[bp+var_78], ax
		push	ax
		lea	ax, [bp+var_2AA]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_7F787

loc_7F77C:
		lea	ax, [bp+var_2AA]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7F787:
		push	[bp+var_78]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_7F77C
		push	[bp+var_78]
		lea	ax, [bp+var_2AA]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	[bp+var_78], 0
		jz	short loc_7F7BD
		push	3
		push	[bp+var_78]
		mov	bx, [bp+var_78]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7F7BD

loc_7F7BD:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_265]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7F808
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_26A]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7F808
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_266]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_26A]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F808

loc_7F808:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_26A]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_265]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_264]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7F83D:
		cmp	si, 7
		jge	short loc_7F845
		jmp	loc_7F750

loc_7F845:
		cmp	byte_603DE, 0
		jnz	short loc_7F84F
		jmp	loc_7FA80

loc_7F84F:
		cmp	[bp+var_1], 0
		jz	short loc_7F860
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_7F860:
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_2AA]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	byte ptr [bp+var_70+3], 0
		jz	short loc_7F8A1
		cmp	[bp+var_72], 0
		jz	short loc_7F8A1
		push	0
		mov	al, byte ptr [bp+var_70+2]
		push	ax
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F8A1

loc_7F8A1:
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_70+3], 0
		mov	[bp+var_6C], 0
		cmp	byte ptr [bp+var_66+3], 0
		jz	short loc_7F8D9
		cmp	[bp+var_68], 0
		jz	short loc_7F8D9
		push	0
		mov	al, byte ptr [bp+var_66+2]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F8D9

loc_7F8D9:
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_66+3], 0
		mov	[bp+var_62], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10003h
		push	0Ah
		lea	ax, [bp+var_288]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_26A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_224]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_220]
		push	ax
		call	sub_19116
		add	sp, 4
		cmp	[bp+var_4D], 0
		jz	short loc_7F961
		cmp	[bp+var_52], 0
		jz	short loc_7F961
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F961

loc_7F961:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_7F999
		cmp	[bp+var_48], 0
		jz	short loc_7F999
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7F999

loc_7F999:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13AAE
		add	sp, 4
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
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_1F4]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7FA21
		cmp	[bp+var_18], 0
		jz	short loc_7FA21
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7FA21

loc_7FA21:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_1DC]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_164]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_9C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_8E]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_80379

loc_7FA80:
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
		cmp	[bp+var_1], 0
		jz	short loc_7FAB9
		push	0FFh
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	di
		call	sub_41B2A
		add	sp, 6

loc_7FAB9:
		xor	si, si
		jmp	loc_7FBC0

loc_7FABE:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_288]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	[bp+var_78], ax
		push	ax
		lea	ax, [bp+var_2AA]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_7FB0A

loc_7FAEA:
		cmp	[bp+var_1], 0
		jz	short loc_7FAFF
		push	0FFD8h
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	di
		call	sub_41C28
		add	sp, 6

loc_7FAFF:
		lea	ax, [bp+var_2AA]
		push	ax
		call	sub_1EED1
		pop	cx

loc_7FB0A:
		push	[bp+var_78]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_7FAEA
		push	[bp+var_78]
		lea	ax, [bp+var_2AA]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	[bp+var_78], 0
		jz	short loc_7FB40
		push	3
		push	[bp+var_78]
		mov	bx, [bp+var_78]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_7FB40

loc_7FB40:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_283]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_7FB8B
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_288]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_7FB8B
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_284]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_288]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7FB8B

loc_7FB8B:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_288]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_283]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_282]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_7FBC0:
		cmp	si, 3
		jge	short loc_7FBC8
		jmp	loc_7FABE

loc_7FBC8:
		cmp	[bp+var_1], 0
		jz	short loc_7FBD9
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_7FBD9:
		cmp	byte_603DE, 0
		jnz	short loc_7FBE3
		jmp	loc_7FE14

loc_7FBE3:
		cmp	[bp+var_1], 0
		jz	short loc_7FBF4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_7FBF4:
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_2AA]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	byte ptr [bp+var_70+3], 0
		jz	short loc_7FC35
		cmp	[bp+var_72], 0
		jz	short loc_7FC35
		push	0
		mov	al, byte ptr [bp+var_70+2]
		push	ax
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7FC35

loc_7FC35:
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_70+3], 0
		mov	[bp+var_6C], 0
		cmp	byte ptr [bp+var_66+3], 0
		jz	short loc_7FC6D
		cmp	[bp+var_68], 0
		jz	short loc_7FC6D
		push	0
		mov	al, byte ptr [bp+var_66+2]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7FC6D

loc_7FC6D:
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_66+3], 0
		mov	[bp+var_62], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10003h
		push	0Ah
		lea	ax, [bp+var_288]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_26A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_224]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_220]
		push	ax
		call	sub_19116
		add	sp, 4
		cmp	[bp+var_4D], 0
		jz	short loc_7FCF5
		cmp	[bp+var_52], 0
		jz	short loc_7FCF5
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7FCF5

loc_7FCF5:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_7FD2D
		cmp	[bp+var_48], 0
		jz	short loc_7FD2D
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7FD2D

loc_7FD2D:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13AAE
		add	sp, 4
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
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_1F4]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_7FDB5
		cmp	[bp+var_18], 0
		jz	short loc_7FDB5
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7FDB5

loc_7FDB5:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_1DC]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_164]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_9C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_8E]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_80379

loc_7FE14:
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
		push	0
		cmp	byte ptr [bp+var_66+2], 3
		jnz	short loc_7FE56
		push	0
		mov	al, byte ptr [bp+var_66+2]
		push	ax
		push	large [bp+var_68]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7FE5D

loc_7FE56:
		mov	edx, [bp+var_66]
		mov	ax, word ptr [bp+var_68]

loc_7FE5D:
		push	dx
		push	ax
		push	large 180000h
		lea	ax, [bp+var_8E]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		mov	[bp+var_5A], 12Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_5E], eax
		mov	byte ptr [bp+var_7C+2], 0
		mov	byte ptr [bp+var_7C+3], 0
		mov	byte ptr [bp+var_78], 0
		push	100h
		push	0
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, [bp+var_80]
		push	ax
		call	sub_46B83
		pop	cx
		jmp	loc_800DA

loc_7FEAC:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_7FEBE
		jmp	loc_800DA

loc_7FEBE:
		lea	ax, [bp+var_80]
		push	ax
		call	sub_46E08
		pop	cx
		push	0
		lea	ax, [bp+var_2AA]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	byte ptr [bp+var_70+3], 0
		jz	short loc_7FEFB
		cmp	[bp+var_72], 0
		jz	short loc_7FEFB
		push	0
		mov	al, byte ptr [bp+var_70+2]
		push	ax
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7FEFB

loc_7FEFB:
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_70+3], 0
		mov	[bp+var_6C], 0
		cmp	byte ptr [bp+var_66+3], 0
		jz	short loc_7FF33
		cmp	[bp+var_68], 0
		jz	short loc_7FF33
		push	0
		mov	al, byte ptr [bp+var_66+2]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7FF33

loc_7FF33:
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_66+3], 0
		mov	[bp+var_62], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10003h
		push	0Ah
		lea	ax, [bp+var_288]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_26A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_224]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_220]
		push	ax
		call	sub_19116
		add	sp, 4
		cmp	[bp+var_4D], 0
		jz	short loc_7FFBB
		cmp	[bp+var_52], 0
		jz	short loc_7FFBB
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7FFBB

loc_7FFBB:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_7FFF3
		cmp	[bp+var_48], 0
		jz	short loc_7FFF3
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7FFF3

loc_7FFF3:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13AAE
		add	sp, 4
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
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_1F4]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_8007B
		cmp	[bp+var_18], 0
		jz	short loc_8007B
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8007B

loc_8007B:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_1DC]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_164]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_9C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_8E]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_80379

loc_800DA:
		mov	eax, [bp+var_5E]
		add	eax, [bp+var_5A]
		cmp	eax, dword_5E7D3
		ja	short loc_800EE
		mov	ax, 1
		jmp	short loc_800F0

loc_800EE:
		xor	ax, ax

loc_800F0:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_800F9
		jmp	loc_7FEAC

loc_800F9:
		push	100h
		push	0
		push	3
		lea	ax, word ptr [bp+var_7C+2]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		cmp	byte ptr [bp+var_66+3], 0
		jz	short loc_80134
		cmp	[bp+var_68], 0
		jz	short loc_80134
		push	0
		mov	al, byte ptr [bp+var_66+2]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_80134

loc_80134:
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_66+3], 0
		mov	[bp+var_62], 0
		lea	ax, [bp+var_80]
		push	ax
		call	sub_46E08
		pop	cx
		push	0
		lea	ax, [bp+var_2AA]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13CEA
		pop	cx
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13C38
		add	sp, 4
		cmp	byte ptr [bp+var_70+3], 0
		jz	short loc_8019D
		cmp	[bp+var_72], 0
		jz	short loc_8019D
		push	0
		mov	al, byte ptr [bp+var_70+2]
		push	ax
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8019D

loc_8019D:
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_70+3], 0
		mov	[bp+var_6C], 0
		cmp	byte ptr [bp+var_66+3], 0
		jz	short loc_801D5
		cmp	[bp+var_68], 0
		jz	short loc_801D5
		push	0
		mov	al, byte ptr [bp+var_66+2]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_801D5

loc_801D5:
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_66+3], 0
		mov	[bp+var_62], 0
		push	seg seg017
		push	offset sub_A168
		push	large 10003h
		push	0Ah
		lea	ax, [bp+var_288]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10007h
		push	0Ah
		lea	ax, [bp+var_26A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_224]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_220]
		push	ax
		call	sub_19116
		add	sp, 4
		cmp	[bp+var_4D], 0
		jz	short loc_8025D
		cmp	[bp+var_52], 0
		jz	short loc_8025D
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8025D

loc_8025D:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_80295
		cmp	[bp+var_48], 0
		jz	short loc_80295
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_80295

loc_80295:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_13AAE
		add	sp, 4
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
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_1F4]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_8031D
		cmp	[bp+var_18], 0
		jz	short loc_8031D
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8031D

loc_8031D:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_1DC]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_164]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_9C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_8E]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx

loc_80379:
		pop	di
		pop	si
		leave
		retf
sub_7EBA0		endp
ovr229		ends
