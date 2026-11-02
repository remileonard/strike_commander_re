ovr203		segment	para public 'OVERLAY' use16
		assume cs:ovr203
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7ACD0		proc far

var_224		= word ptr -224h
var_1C7		= dword ptr -1C7h
var_1C3		= dword ptr -1C3h
var_1BF		= dword ptr -1BFh
var_1B2		= dword ptr -1B2h
var_1AE		= dword ptr -1AEh
var_18A		= word ptr -18Ah
var_17C		= word ptr -17Ch
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_177		= word ptr -177h
var_176		= word ptr -176h
var_172		= word ptr -172h
var_170		= word ptr -170h
var_16E		= byte ptr -16Eh
var_16C		= word ptr -16Ch
var_168		= word ptr -168h
var_166		= word ptr -166h
var_164		= word ptr -164h
var_163		= word ptr -163h
var_162		= word ptr -162h
var_15E		= word ptr -15Eh
var_15C		= word ptr -15Ch
var_15A		= byte ptr -15Ah
var_154		= word ptr -154h
var_152		= word ptr -152h
var_150		= byte ptr -150h
var_14F		= word ptr -14Fh
var_14D		= byte ptr -14Dh
var_14A		= word ptr -14Ah
var_D2		= word ptr -0D2h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= byte ptr -56h
var_55		= byte ptr -55h
var_54		= dword ptr -54h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= word ptr -42h
var_40		= dword ptr -40h
var_3E		= dword ptr -3Eh
var_3C		= dword ptr -3Ch
var_3A		= dword ptr -3Ah
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2B		= word ptr -2Bh
var_2A		= dword ptr -2Ah
var_27		= word ptr -27h
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= byte ptr -0Eh
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_6		= word ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 224h
		push	si
		push	di
		mov	ax, word_4D36E
		mov	[bp+var_2], ax
		mov	[bp+var_74], 0
		mov	[bp+var_72], 0
		push	[bp+var_2]
		lea	ax, [bp+var_74]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_82], 0
		mov	[bp+var_80], 0
		mov	[bp+var_7E], 0
		mov	[bp+var_7C], 0
		mov	[bp+var_7A], 13Fh
		mov	[bp+var_78], 0C7h
		push	0
		lea	ax, [bp+var_82]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_82]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_70], 0
		mov	[bp+var_6E], 1Bh
		mov	[bp+var_6C], 13Fh
		mov	[bp+var_6A], 0AFh
		mov	byte ptr [bp+var_10], 0
		mov	byte ptr [bp+var_10+1], 0
		mov	[bp+var_E], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aTo1mid2
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_D2]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_14A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16], 2
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		push	3
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	0
		lea	ax, [bp+var_14A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20], 2
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0
		push	2
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	1
		lea	ax, [bp+var_14A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_27], 0
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_74]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_16C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	di, ax
		push	word ptr [bp+var_2A]
		mov	al, byte ptr [bp+var_2A+2]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	di
		lea	ax, [bp+var_16C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	si, si
		jmp	short loc_7AE93

loc_7AE7C:
		mov	[bp+var_2C], si
		mov	ax, [bp+var_2C]
		mov	[di+1Bh], ax
		inc	si
		lea	ax, [bp+var_16C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7AE93:
		cmp	[bp+var_14F], 3Eh
		jnb	short loc_7AEA1
		cmp	[bp+var_14D], 0
		jz	short loc_7AEA6

loc_7AEA1:
		mov	ax, 1
		jmp	short loc_7AEA8

loc_7AEA6:
		xor	ax, ax

loc_7AEA8:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7AE7C
		push	0
		lea	ax, [bp+var_16C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_20+1], 0
		jz	short loc_7AEED
		cmp	[bp+var_24], 0
		jz	short loc_7AEED
		push	0
		mov	al, byte ptr [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7AEED

loc_7AEED:
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0
		cmp	byte ptr [bp+var_16+1], 0
		jz	short loc_7AF25
		cmp	[bp+var_1A], 0
		jz	short loc_7AF25
		push	0
		mov	al, byte ptr [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7AF25

loc_7AF25:
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16], 2
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		push	3
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	2
		lea	ax, [bp+var_14A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20], 2
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0
		push	2
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	5
		lea	ax, [bp+var_14A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_27], 0
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_74]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_16C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	di, ax
		push	word ptr [bp+var_2A]
		mov	al, byte ptr [bp+var_2A+2]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	di
		lea	ax, [bp+var_16C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	si, si
		jmp	short loc_7B029

loc_7B012:
		mov	[bp+var_2C], si
		mov	ax, [bp+var_2C]
		mov	[di+1Bh], ax
		inc	si
		lea	ax, [bp+var_16C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7B029:
		cmp	[bp+var_14F], 0Fh
		jnb	short loc_7B037
		cmp	[bp+var_14D], 0
		jz	short loc_7B03C

loc_7B037:
		mov	ax, 1
		jmp	short loc_7B03E

loc_7B03C:
		xor	ax, ax

loc_7B03E:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7B012
		push	0
		lea	ax, [bp+var_16C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_20+1], 0
		jz	short loc_7B083
		cmp	[bp+var_24], 0
		jz	short loc_7B083
		push	0
		mov	al, byte ptr [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7B083

loc_7B083:
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0
		cmp	byte ptr [bp+var_16+1], 0
		jz	short loc_7B0BB
		cmp	[bp+var_1A], 0
		jz	short loc_7B0BB
		push	0
		mov	al, byte ptr [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7B0BB

loc_7B0BB:
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16], 2
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		push	3
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6
		lea	ax, [bp+var_14A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20], 2
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0
		push	2
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	8
		lea	ax, [bp+var_14A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_27], 0
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_2A]
		mov	al, byte ptr [bp+var_2A+2]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	0
		mov	al, byte ptr [bp+var_16]
		push	ax
		push	word ptr [bp+var_1A+2]
		push	word ptr [bp+var_1A]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Bh
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		push	0
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	[bp+var_2C], ax
		push	50h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_30], ax
		or	ax, ax
		jz	short loc_7B1B8
		mov	ax, word ptr [bp+var_30]
		jmp	short loc_7B1BB

loc_7B1B8:
		mov	ax, word ptr [bp+var_30]

loc_7B1BB:
		mov	word ptr [bp+var_30+2], ax
		push	ds
		push	offset aPAK
		push	ds
		push	offset aEJECT
		push	ds
		push	offset aOBJECTS
		push	word ptr [bp+var_30+2]
		call	sub_11166
		add	sp, 0Eh
		push	1
		push	word ptr [bp+var_30+2]
		push	[bp+var_2C]
		mov	bx, [bp+var_2C]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	seg stub192
		push	offset sub_479E5
		push	1
		push	3
		push	0Ah
		lea	ax, [bp+var_168]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_3A], 0
		mov	byte ptr [bp+var_38+2], 2
		mov	byte ptr [bp+var_38+3], 0
		mov	[bp+var_34], 0
		mov	byte ptr [bp+var_3C+1], 1
		xor	di, di
		jmp	loc_7B33D

loc_7B222:
		mov	ax, di
		add	ax, 5
		push	ax
		push	[bp+var_2C]
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	bx, [bp+var_2C]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_7B24A
		mov	bx, [bp+var_2C]
		mov	eax, [bx+61h]
		jmp	short loc_7B251

loc_7B24A:
		mov	bx, [bp+var_2C]
		mov	eax, [bx+71h]

loc_7B251:
		mov	[bp+var_40], eax
		push	0
		push	0
		push	3
		push	large [bp+var_40]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_42], dx
		mov	word ptr [bp+var_46+2], ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_168]
		add	ax, dx
		mov	dx, [bp+var_42]
		mov	bx, word ptr [bp+var_46+2]
		mov	si, ax
		mov	[si+2], dx
		mov	[si], bx
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_164]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 3
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_163]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 1
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_162]
		add	ax, dx
		mov	bx, ax
		mov	dword ptr [bx], 0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_162]
		add	ax, dx
		mov	edx, [bp+var_40]
		mov	bx, ax
		mov	[bx], edx
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_168]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jnz	short loc_7B2F6
		mov	byte ptr [bp+var_3C+1], 0
		jmp	short loc_7B345

loc_7B2F6:
		push	0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_164]
		add	ax, dx
		mov	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_168]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, di
		add	ax, 5
		push	ax
		push	[bp+var_2C]
		call	sub_43519
		add	sp, 8
		inc	di

loc_7B33D:
		cmp	di, 3
		jge	short loc_7B345
		jmp	loc_7B222

loc_7B345:
		lea	ax, [bp+var_74]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_18A]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, [bp+var_168]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_46], ax
		push	word ptr [bp+var_46]
		lea	ax, [bp+var_18A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	word ptr [bp+var_4A+2], 0
		mov	[bp+var_50], 0
		mov	[bp+var_4E], 1Bh
		mov	[bp+var_4C], 13Fh
		mov	word ptr [bp+var_4A], 0AFh
		mov	[bp+var_5A], 0
		mov	[bp+var_56], 2
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		xor	eax, eax
		mov	[bp+var_5E], eax
		mov	[bp+var_62], eax
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_66+2], dx
		mov	word ptr [bp+var_66], ax
		mov	eax, [bp+var_66]
		mov	[bp+var_5A], eax
		mov	[bp+var_56], 3
		mov	[bp+var_55], 1
		mov	[bp+var_54], 0
		mov	[bp+var_54], 0FA00h
		lea	ax, [bp+var_50]
		push	ax
		push	0
		mov	al, [bp+var_56]
		push	ax
		push	word ptr [bp+var_5A+2]
		push	word ptr [bp+var_5A]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	sub_392F6
		add	sp, 8
		push	0
		push	0
		mov	al, byte ptr [bp+var_164]
		push	ax
		push	[bp+var_166]
		push	[bp+var_168]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		mov	[bp+var_5E], 8
		mov	eax, dword_4DE15
		mov	[bp+var_62], eax
		lea	ax, word ptr [bp+var_62]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		lea	ax, [bp+var_50]
		push	ax
		push	0
		mov	al, [bp+var_56]
		push	ax
		push	word ptr [bp+var_5A+2]
		push	word ptr [bp+var_5A]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	sub_38CDA
		add	sp, 8
		push	0
		push	0
		mov	al, [bp+var_15A]
		push	ax
		push	[bp+var_15C]
		push	[bp+var_15E]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		mov	[bp+var_5E], 8
		mov	eax, dword_4DE15
		mov	[bp+var_62], eax
		lea	ax, word ptr [bp+var_62]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		lea	ax, [bp+var_50]
		push	ax
		push	0
		mov	al, [bp+var_56]
		push	ax
		push	word ptr [bp+var_5A+2]
		push	word ptr [bp+var_5A]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	sub_38CDA
		add	sp, 8
		push	0
		push	0
		mov	al, [bp+var_150]
		push	ax
		push	[bp+var_152]
		push	[bp+var_154]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		mov	[bp+var_5E], 2Dh
		mov	eax, dword_4DE15
		mov	[bp+var_62], eax
		lea	ax, word ptr [bp+var_62]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		cmp	[bp+var_55], 0
		jz	short loc_7B579
		cmp	[bp+var_5A], 0
		jz	short loc_7B579
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7B579

loc_7B579:
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	0
		lea	ax, [bp+var_18A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_38+3], 0
		jz	short loc_7B5C0
		cmp	[bp+var_3A], 0
		jz	short loc_7B5C0
		push	0
		mov	al, byte ptr [bp+var_38+2]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7B5C0

loc_7B5C0:
		mov	[bp+var_3A], 0
		mov	byte ptr [bp+var_38+3], 0
		mov	[bp+var_34], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	3
		push	0Ah
		lea	ax, [bp+var_168]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_20+1], 0
		jz	short loc_7B61D
		cmp	[bp+var_24], 0
		jz	short loc_7B61D
		push	0
		mov	al, byte ptr [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7B61D

loc_7B61D:
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0
		cmp	byte ptr [bp+var_16+1], 0
		jz	short loc_7B655
		cmp	[bp+var_1A], 0
		jz	short loc_7B655
		push	0
		mov	al, byte ptr [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7B655

loc_7B655:
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		push	0
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	word ptr [bp+var_14+2], ax
		push	0
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	word ptr [bp+var_14], ax
		push	50h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_1A+2], ax
		or	ax, ax
		jz	short loc_7B699
		mov	ax, word ptr [bp+var_1A+2]
		jmp	short loc_7B69C

loc_7B699:
		mov	ax, word ptr [bp+var_1A+2]

loc_7B69C:
		mov	[bp+var_16], ax
		push	ds
		push	offset aPAK_1
		push	ds
		push	offset aEJECT_1
		push	ds
		push	offset aOBJECTS_1
		push	[bp+var_16]
		call	sub_11166
		add	sp, 0Eh
		push	1
		push	[bp+var_16]
		push	word ptr [bp+var_14+2]
		mov	bx, word ptr [bp+var_14+2]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	50h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_1E+2], ax
		or	ax, ax
		jz	short loc_7B6DF
		mov	ax, word ptr [bp+var_1E+2]
		jmp	short loc_7B6E2

loc_7B6DF:
		mov	ax, word ptr [bp+var_1E+2]

loc_7B6E2:
		mov	word ptr [bp+var_1A], ax
		push	ds
		push	offset aPAK_2
		push	ds
		push	offset aEJECT_2
		push	ds
		push	offset aOBJECTS_2
		push	word ptr [bp+var_1A]
		call	sub_11166
		add	sp, 0Eh
		push	1
		push	word ptr [bp+var_1A]
		push	word ptr [bp+var_14]
		mov	bx, word ptr [bp+var_14]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+2], 2
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	7
		lea	ax, [bp+var_14A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_30], 0
		mov	byte ptr [bp+var_2C], 2
		mov	byte ptr [bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		push	word ptr [bp+var_14+2]
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	bx, word ptr [bp+var_14+2]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_7B778
		mov	bx, word ptr [bp+var_14+2]
		mov	eax, [bx+61h]
		jmp	short loc_7B77F

loc_7B778:
		mov	bx, word ptr [bp+var_14+2]
		mov	eax, [bx+71h]

loc_7B77F:
		mov	[bp+var_34], eax
		push	0
		push	0
		push	3
		push	large [bp+var_34]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_38+2], dx
		mov	word ptr [bp+var_38], ax
		mov	eax, [bp+var_38]
		mov	[bp+var_30], eax
		mov	byte ptr [bp+var_2C], 3
		mov	byte ptr [bp+var_2B], 1
		mov	[bp+var_2A], 0
		mov	eax, [bp+var_34]
		mov	[bp+var_2A], eax
		cmp	[bp+var_30], 0
		jz	short loc_7B7EB
		push	0
		mov	al, byte ptr [bp+var_2C]
		push	ax
		push	word ptr [bp+var_30+2]
		push	word ptr [bp+var_30]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	2
		push	word ptr [bp+var_14+2]
		call	sub_43519
		add	sp, 8

loc_7B7EB:
		cmp	[bp+var_30], 0
		jz	short loc_7B7F8
		mov	byte ptr [bp+var_3A+1], 1
		jmp	short loc_7B7FC

loc_7B7F8:
		mov	byte ptr [bp+var_3A+1], 0

loc_7B7FC:
		push	seg stub192
		push	offset sub_479E5
		push	1
		push	5
		push	0Ah
		lea	ax, [bp+var_17C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		xor	di, di
		jmp	loc_7B92B

loc_7B81A:
		push	di
		push	word ptr [bp+var_14]
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	bx, word ptr [bp+var_14]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_7B83D
		mov	bx, word ptr [bp+var_14]
		mov	eax, [bx+61h]
		jmp	short loc_7B844

loc_7B83D:
		mov	bx, word ptr [bp+var_14]
		mov	eax, [bx+71h]

loc_7B844:
		mov	[bp+var_3E], eax
		push	0
		push	0
		push	3
		push	large [bp+var_3E]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_40], dx
		mov	[bp+var_42], ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_17C]
		add	ax, dx
		mov	dx, word ptr [bp+var_40]
		mov	bx, [bp+var_42]
		mov	si, ax
		mov	[si+2], dx
		mov	[si], bx
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_178]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 3
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_177]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 1
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_176]
		add	ax, dx
		mov	bx, ax
		mov	dword ptr [bx], 0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_176]
		add	ax, dx
		mov	edx, [bp+var_3E]
		mov	bx, ax
		mov	[bx], edx
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_17C]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jnz	short loc_7B8E9
		mov	byte ptr [bp+var_3A+1], 0
		jmp	short loc_7B933

loc_7B8E9:
		push	0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_178]
		add	ax, dx
		mov	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_17C]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		push	word ptr [bp+var_14]
		call	sub_43519
		add	sp, 8
		inc	di

loc_7B92B:
		cmp	di, 5
		jge	short loc_7B933
		jmp	loc_7B81A

loc_7B933:
		xor	eax, eax
		mov	[bp+var_46], eax
		mov	[bp+var_4A], eax
		push	0
		push	0
		mov	al, byte ptr [bp+var_24+2]
		push	ax
		push	word ptr [bp+var_24]
		push	word ptr [bp+var_26]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Bh
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		push	0
		push	0
		mov	al, byte ptr [bp+var_2C]
		push	ax
		push	word ptr [bp+var_30+2]
		push	word ptr [bp+var_30]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		mov	[bp+var_46], 6
		mov	eax, dword_4DE15
		mov	[bp+var_4A], eax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		push	0
		push	0
		mov	al, byte ptr [bp+var_178]
		push	ax
		push	[bp+var_17A]
		push	[bp+var_17C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		mov	[bp+var_46], 6
		mov	eax, dword_4DE15
		mov	[bp+var_4A], eax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		push	0
		push	0
		mov	al, [bp+var_16E]
		push	ax
		push	[bp+var_170]
		push	[bp+var_172]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		mov	[bp+var_46], 6
		mov	eax, dword_4DE15
		mov	[bp+var_4A], eax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		push	0
		push	0
		mov	al, byte ptr [bp+var_164]
		push	ax
		push	[bp+var_166]
		push	[bp+var_168]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		mov	[bp+var_46], 6
		mov	eax, dword_4DE15
		mov	[bp+var_4A], eax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		push	0
		push	0
		mov	al, [bp+var_15A]
		push	ax
		push	[bp+var_15C]
		push	[bp+var_15E]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		mov	[bp+var_46], 6
		mov	eax, dword_4DE15
		mov	[bp+var_4A], eax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		push	0
		push	0
		mov	al, [bp+var_150]
		push	ax
		push	[bp+var_152]
		push	[bp+var_154]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		mov	[bp+var_46], 23h
		mov	eax, dword_4DE15
		mov	[bp+var_4A], eax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	5
		push	0Ah
		lea	ax, [bp+var_17C]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	byte ptr [bp+var_2B], 0
		jz	short loc_7BB5F
		cmp	[bp+var_30], 0
		jz	short loc_7BB5F
		push	0
		mov	al, byte ptr [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7BB5F

loc_7BB5F:
		mov	[bp+var_30], 0
		mov	byte ptr [bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	byte ptr [bp+var_24+3], 0
		jz	short loc_7BB97
		cmp	[bp+var_26], 0
		jz	short loc_7BB97
		push	0
		mov	al, byte ptr [bp+var_24+2]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7BB97

loc_7BB97:
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16], 2
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		push	3
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	4
		lea	ax, [bp+var_14A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20], 2
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0
		push	2
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	5
		lea	ax, [bp+var_14A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_27], 0
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_74]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_16C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0FFE5h
		push	0
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	di, ax
		push	word ptr [bp+var_2A]
		mov	al, byte ptr [bp+var_2A+2]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	di
		lea	ax, [bp+var_16C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	si, si
		jmp	short loc_7BC9B

loc_7BC84:
		mov	[bp+var_2C], si
		mov	ax, [bp+var_2C]
		mov	[di+1Bh], ax
		inc	si
		lea	ax, [bp+var_16C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7BC9B:
		cmp	[bp+var_14F], 1Ch
		jnb	short loc_7BCA9
		cmp	[bp+var_14D], 0
		jz	short loc_7BCAE

loc_7BCA9:
		mov	ax, 1
		jmp	short loc_7BCB0

loc_7BCAE:
		xor	ax, ax

loc_7BCB0:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7BC84
		push	100h
		push	0
		push	3
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	0
		lea	ax, [bp+var_16C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_20+1], 0
		jz	short loc_7BD0C
		cmp	[bp+var_24], 0
		jz	short loc_7BD0C
		push	0
		mov	al, byte ptr [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7BD0C

loc_7BD0C:
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0
		cmp	byte ptr [bp+var_16+1], 0
		jz	short loc_7BD44
		cmp	[bp+var_1A], 0
		jz	short loc_7BD44
		push	0
		mov	al, byte ptr [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7BD44

loc_7BD44:
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16], 2
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20], 2
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0
		push	ds
		push	offset aIff
		push	ds
		push	offset aCredits
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_D2]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_224]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_224], 480h
		mov	[bp+var_1C3], 100h
		mov	[bp+var_1C7], 0
		mov	[bp+var_224], 498h
		push	1
		lea	ax, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_224]
		push	ax
		mov	bx, [bp+var_224]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large dword_4B119
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large dword_4B11E
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large dword_4B123
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	eax, [bp+var_1B2]
		mov	[bp+var_34], eax
		push	1
		push	0
		push	2
		push	large [bp+var_34]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_38+2], dx
		mov	word ptr [bp+var_38], ax
		mov	eax, [bp+var_38]
		mov	[bp+var_24], eax
		mov	byte ptr [bp+var_20], 2
		mov	byte ptr [bp+var_20+1], 1
		mov	[bp+var_1E], 0
		mov	eax, [bp+var_34]
		mov	[bp+var_1E], eax
		push	0
		mov	al, byte ptr [bp+var_20]
		push	ax
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		mov	eax, [bp+var_1AE]
		mov	[bp+var_1BF], eax
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		push	0
		push	large dword_4B128
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large dword_4B12D
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	eax, [bp+var_1B2]
		mov	[bp+var_3C], eax
		push	1
		push	0
		push	2
		push	large [bp+var_3C]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_3E], dx
		mov	word ptr [bp+var_40], ax
		mov	eax, [bp+var_40]
		mov	[bp+var_1A], eax
		mov	byte ptr [bp+var_16], 2
		mov	byte ptr [bp+var_16+1], 1
		mov	[bp+var_14], 0
		mov	eax, [bp+var_3C]
		mov	[bp+var_14], eax
		push	0
		mov	al, byte ptr [bp+var_16]
		push	ax
		push	word ptr [bp+var_1A+2]
		push	word ptr [bp+var_1A]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_224], 498h
		lea	ax, [bp+var_224]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_224]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	byte ptr [bp+var_2A+2], 0
		mov	byte ptr [bp+var_27], 0
		mov	byte ptr [bp+var_26], 0
		mov	[bp+var_2B], 0
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_30+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_30+2]
		mov	al, byte ptr [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30+2]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	100h
		push	0
		lea	ax, word ptr [bp+var_38+2]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		push	word ptr [bp+var_38+2]
		mov	al, byte ptr [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_2A+2]
		push	ax
		lea	ax, word ptr [bp+var_38+2]
		push	ax
		call	Palette_FillRange_34CAC
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	word ptr [bp+var_38+2]
		mov	al, byte ptr [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38+2]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, word ptr [bp+var_38+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, word ptr [bp+var_1A]
		push	ax
		lea	ax, [bp+var_162]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		push	0
		push	word_4D36C
		lea	ax, [bp+var_17C]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	ax, word_4D36E
		mov	word ptr [bp+var_30], ax
		push	word ptr [bp+var_30]
		lea	ax, [bp+var_17A]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		lea	ax, [bp+var_162]
		mov	[bp+var_168], ax
		mov	byte ptr [bp+var_166], 2
		push	61h
		push	0A0h
		lea	ax, [bp+var_17C]
		push	ax
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		push	2752h
		lea	ax, [bp+var_17C]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		push	100h
		push	0
		push	2
		lea	ax, word ptr [bp+var_2A+2]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_FadeFromColor_34EEE
		add	sp, 0Ah
		call	Input_Flush_116D1
		xor	eax, eax
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	[bp+var_34], 12Ch
		mov	eax, dword_4DE15
		mov	[bp+var_38], eax
		mov	byte ptr [bp+var_3A+1], 0
		jmp	short loc_7C0A4

loc_7C095:
		mov	byte ptr [bp+var_3A+1], 0
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7C0A4
		jmp	short loc_7C0C6

loc_7C0A4:
		mov	eax, [bp+var_38]
		add	eax, [bp+var_34]
		cmp	eax, dword_4DE15
		ja	short loc_7C0B8
		mov	ax, 1
		jmp	short loc_7C0BA

loc_7C0B8:
		xor	ax, ax

loc_7C0BA:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7C095
		cmp	byte ptr [bp+var_3A+1], 0
		jnz	short loc_7C095

loc_7C0C6:
		push	100h
		push	0
		push	2
		lea	ax, word ptr [bp+var_2A+2]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		lea	ax, [bp+var_17A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_162]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		lea	ax, word ptr [bp+var_30+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_20+1], 0
		jz	short loc_7C137
		cmp	[bp+var_24], 0
		jz	short loc_7C137
		push	0
		mov	al, byte ptr [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7C137

loc_7C137:
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0
		cmp	byte ptr [bp+var_16+1], 0
		jz	short loc_7C16F
		cmp	[bp+var_1A], 0
		jz	short loc_7C16F
		push	0
		mov	al, byte ptr [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7C16F

loc_7C16F:
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		push	2
		lea	ax, [bp+var_14A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_82]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_74]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_7ACD0		endp
ovr203		ends
