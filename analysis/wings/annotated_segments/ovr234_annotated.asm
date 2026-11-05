ovr234		segment	para public 'OVERLAY' use16
		assume cs:ovr234
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_82F50		proc far

var_5D8		= word ptr -5D8h
var_562		= word ptr -562h
var_54D		= byte ptr -54Dh
var_539		= byte ptr -539h
var_524		= word ptr -524h
var_51E		= byte ptr -51Eh
var_516		= word ptr -516h
var_4F4		= word ptr -4F4h
var_4F0		= word ptr -4F0h
var_4EF		= word ptr -4EFh
var_4EE		= word ptr -4EEh
var_490		= word ptr -490h
var_48C		= word ptr -48Ch
var_48B		= word ptr -48Bh
var_48A		= word ptr -48Ah
var_45E		= word ptr -45Eh
var_45A		= word ptr -45Ah
var_459		= word ptr -459h
var_458		= word ptr -458h
var_3F0		= word ptr -3F0h
var_3EC		= word ptr -3ECh
var_3EB		= word ptr -3EBh
var_3EA		= word ptr -3EAh
var_3C8		= word ptr -3C8h
var_3C4		= word ptr -3C4h
var_3C3		= word ptr -3C3h
var_3C2		= word ptr -3C2h
var_35A		= word ptr -35Ah
var_356		= word ptr -356h
var_355		= word ptr -355h
var_354		= word ptr -354h
var_2F6		= word ptr -2F6h
var_2F2		= word ptr -2F2h
var_2F1		= word ptr -2F1h
var_2F0		= word ptr -2F0h
var_2CE		= word ptr -2CEh
var_2CA		= word ptr -2CAh
var_2C9		= word ptr -2C9h
var_2C8		= word ptr -2C8h
var_2BA		= word ptr -2BAh
var_2B6		= word ptr -2B6h
var_2B5		= word ptr -2B5h
var_2B4		= word ptr -2B4h
var_24C		= word ptr -24Ch
var_234		= word ptr -234h
var_1BC		= word ptr -1BCh
var_15B		= dword ptr -15Bh
var_157		= dword ptr -157h
var_14F		= word ptr -14Fh
var_14B		= dword ptr -14Bh
var_144		= word ptr -144h
var_CC		= word ptr -0CCh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_60		= word ptr -60h
var_5E		= dword ptr -5Eh
var_5C		= dword ptr -5Ch
var_5A		= dword ptr -5Ah
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= word ptr -4Ch
var_4A		= byte ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= byte ptr -44h
var_43		= word ptr -43h
var_40		= word ptr -40h
var_3E		= byte ptr -3Eh
var_3D		= word ptr -3Dh
var_3A		= word ptr -3Ah
var_38		= byte ptr -38h
var_37		= word ptr -37h
var_34		= word ptr -34h
var_31		= word ptr -31h
var_2E		= word ptr -2Eh
var_2C		= byte ptr -2Ch
var_2B		= word ptr -2Bh
var_28		= word ptr -28h
var_26		= byte ptr -26h
var_25		= word ptr -25h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= byte ptr -1Ah
var_19		= byte ptr -19h
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= byte ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 5D8h
		push	si
		push	di
		mov	[bp+var_1], 0
		cmp	word_5CF9F, 0
		jz	short loc_82F68
		mov	[bp+var_1], 1

loc_82F68:
		mov	ax, word_5DD44
		mov	[bp+var_4], ax
		mov	[bp+var_6E], 0
		mov	[bp+var_6C], 0
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_7C], 0
		mov	[bp+var_7A], 0
		mov	[bp+var_78], 0
		mov	[bp+var_76], 0
		mov	[bp+var_74], 13Fh
		mov	[bp+var_72], 0C7h
		push	0
		lea	ax, [bp+var_7C]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469A5
		add	sp, 4
		mov	[bp+var_6A], 0
		mov	[bp+var_68], 18h
		mov	[bp+var_66], 13Fh
		mov	[bp+var_64], 97h
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgam10
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_CC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidnoise
		push	ds
		push	offset aDataNoise
		lea	ax, [bp+var_CC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_1BC]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		lea	ax, [bp+var_234]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		cmp	[bp+var_1], 0
		jnz	short loc_8303A
		jmp	loc_830C1

loc_8303A:
		push	ds
		lea	ax, [bp+var_CC]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_830C1
		push	1
		lea	ax, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_1BC]
		push	ax
		mov	bx, [bp+var_1BC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	9
		lea	ax, [bp+var_1BC]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_157]
		mov	[bp+var_58], eax
		mov	ax, [bp+var_14F]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_8308D
		mov	eax, [bp+var_15B]
		jmp	short loc_83092

loc_8308D:
		mov	eax, [bp+var_14B]

loc_83092:
		mov	edx, [bp+var_58]
		add	edx, eax
		mov	[bp+var_5C], edx
		mov	eax, [bp+var_58]
		cmp	eax, [bp+var_5C]
		jz	short loc_830C1
		push	0
		push	edx
		push	eax
		lea	ax, [bp+var_1BC]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		jmp	short loc_830C5

loc_830C1:
		mov	[bp+var_1], 0

loc_830C5:
		cmp	[bp+var_1], 0
		jz	short loc_830CF
		mov	di, word_5CF9F

loc_830CF:
		mov	[bp+var_A], 0
		cmp	[bp+var_1], 0
		jz	short loc_8310C
		push	0
		lea	ax, [bp+var_234]
		push	ax
		push	0
		push	di
		call	sub_412F9
		add	sp, 8
		mov	si, 1
		jmp	short loc_83107

loc_830F1:
		push	si
		lea	ax, [bp+var_234]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	di
		call	sub_412F9
		add	sp, 8
		inc	si

loc_83107:
		cmp	si, 4
		jl	short loc_830F1

loc_8310C:
		push	100h
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		push	ds
		push	offset unk_5CF40
		push	ds
		push	offset aConvfontShp_6
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_CC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_CC]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_22+2], dx
		mov	word ptr [bp+var_22], ax
		mov	eax, [bp+var_22]
		mov	[bp+var_1E], eax
		mov	[bp+var_1A], 3
		mov	[bp+var_19], 1
		mov	[bp+var_18], 0
		lea	ax, word ptr [bp+var_1E]
		push	ax
		lea	ax, [bp+var_24C]
		push	ax
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	[bp+var_28], 0
		mov	[bp+var_25], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_34], 0
		mov	[bp+var_31], 0
		mov	[bp+var_3A], 0
		mov	[bp+var_37], 0
		mov	[bp+var_40], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_46], 0
		mov	[bp+var_43], 0
		mov	[bp+var_5E], 0
		mov	byte ptr [bp+var_5A], 2
		mov	byte ptr [bp+var_5A+1], 0
		mov	[bp+var_58], 0
		push	2
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	0
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_5E]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_5A+1], 0
		jz	short loc_83211
		cmp	[bp+var_5E], 0
		jz	short loc_83211
		push	0
		mov	al, byte ptr [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_83211

loc_83211:
		mov	[bp+var_5E], 0
		mov	byte ptr [bp+var_5A+1], 0
		mov	[bp+var_58], 0
		push	2
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	0Ch
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_5E]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_5A+1], 0
		jz	short loc_8326E
		cmp	[bp+var_5E], 0
		jz	short loc_8326E
		push	0
		mov	al, byte ptr [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8326E

loc_8326E:
		mov	[bp+var_5E], 0
		mov	byte ptr [bp+var_5A+1], 0
		mov	[bp+var_58], 0
		push	2
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	0Fh
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_5E]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_5A+1], 0
		jz	short loc_832CB
		cmp	[bp+var_5E], 0
		jz	short loc_832CB
		push	0
		mov	al, byte ptr [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_832CB

loc_832CB:
		mov	[bp+var_5E], 0
		mov	byte ptr [bp+var_5A+1], 0
		mov	[bp+var_58], 0
		push	2
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	10h
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_5E]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_5A+1], 0
		jz	short loc_83328
		cmp	[bp+var_5E], 0
		jz	short loc_83328
		push	0
		mov	al, byte ptr [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_83328

loc_83328:
		mov	[bp+var_5E], 0
		mov	byte ptr [bp+var_5A+1], 0
		mov	[bp+var_58], 0
		push	2
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	15h
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_5E]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_5A+1], 0
		jz	short loc_83385
		cmp	[bp+var_5E], 0
		jz	short loc_83385
		push	0
		mov	al, byte ptr [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_83385

loc_83385:
		mov	[bp+var_5E], 0
		mov	byte ptr [bp+var_5A+1], 0
		mov	[bp+var_58], 0
		push	2
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	20h
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_5E]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46A98
		add	sp, 4
		cmp	byte ptr [bp+var_5A+1], 0
		jz	short loc_833E2
		cmp	[bp+var_5E], 0
		jz	short loc_833E2
		push	0
		mov	al, byte ptr [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_833E2

loc_833E2:
		mov	[bp+var_5E], 0
		mov	byte ptr [bp+var_5A+1], 0
		mov	[bp+var_58], 0
		cmp	byte ptr [bp+var_5A+1], 0
		jz	short loc_8341A
		cmp	[bp+var_5E], 0
		jz	short loc_8341A
		push	0
		mov	al, byte ptr [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8341A

loc_8341A:
		mov	[bp+var_5E], 0
		mov	byte ptr [bp+var_5A+1], 0
		mov	[bp+var_58], 0
		lea	ax, [bp+var_48]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	3
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AF4
		add	sp, 4
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	byte ptr [bp+var_4C], 0
		mov	byte ptr [bp+var_4C+1], 0
		mov	[bp+var_4A], 0
		push	100h
		push	0
		lea	ax, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_FillRange_46CC8
		add	sp, 8
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		call	sub_1F377
		xor	eax, eax
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13BB6
		pop	cx
		lea	ax, [bp+var_6E]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_516]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		mov	word ptr [bp+var_58+2], 5
		xor	eax, eax
		mov	[bp+var_5A], eax
		mov	[bp+var_5E], eax
		xor	si, si
		jmp	short loc_835E1

loc_835C1:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2BA]
		add	ax, dx
		push	ax
		mov	ax, si
		inc	ax
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_835E1:
		cmp	si, 0Bh
		jl	short loc_835C1
		push	[bp+var_28]
		mov	al, [bp+var_26]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		cmp	[bp+var_1], 0
		jz	short loc_83647
		push	large 0FFh
		push	0
		push	[bp+var_A]
		push	di
		call	sub_4163D
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_E], eax
		mov	[bp+var_5A], 3Dh
		mov	eax, dword_5E7D3
		mov	[bp+var_5E], eax
		dec	word ptr [bp+var_58+2]

loc_83647:
		xor	si, si
		jmp	loc_8379F

loc_8364C:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2BA]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	[bp+var_60], ax
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_836E9

loc_83678:
		lea	ax, [bp+var_516]
		push	ax
		call	sub_1EED1
		pop	cx
		cmp	[bp+var_1], 0
		jz	short loc_836E9
		cmp	word ptr [bp+var_58+2], 0
		jz	short loc_836E9
		push	large [bp+var_E]
		push	di
		call	sub_41729
		add	sp, 6
		or	al, al
		jz	short loc_836E9
		mov	eax, [bp+var_5E]
		add	eax, [bp+var_5A]
		cmp	eax, dword_5E7D3
		ja	short loc_836B4
		mov	ax, 1
		jmp	short loc_836B6

loc_836B4:
		xor	ax, ax

loc_836B6:
		or	al, al
		jz	short loc_836E9
		push	large 0FFh
		push	0
		push	[bp+var_A]
		push	di
		call	sub_4163D
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_E], eax
		mov	[bp+var_5A], 3Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_5E], eax
		dec	word ptr [bp+var_58+2]

loc_836E9:
		push	[bp+var_60]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_83678
		push	[bp+var_60]
		lea	ax, [bp+var_516]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	[bp+var_60], 0
		jz	short loc_8371F
		push	3
		push	[bp+var_60]
		mov	bx, [bp+var_60]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_8371F

loc_8371F:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2B5]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_8376A
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2BA]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_8376A
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2B6]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2BA]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8376A

loc_8376A:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2BA]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2B5]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2B4]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_8379F:
		cmp	si, 0Bh
		jge	short loc_837A7
		jmp	loc_8364C

loc_837A7:
		cmp	[bp+var_1], 0
		jz	short loc_837BD
		push	[bp+var_A]
		push	di
		call	sub_41495
		add	sp, 4
		add	[bp+var_A], 7

loc_837BD:
		cmp	[bp+var_1], 0
		jz	short loc_837D6
		mov	[bp+var_50], 50h

loc_837CB:
		mov	eax, dword_5E7D3
		mov	[bp+var_54], eax
		jmp	loc_839BB

loc_837D6:
		mov	[bp+var_50], 14h
		jmp	short loc_837CB

loc_837E0:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_837F2
		jmp	loc_839BB

loc_837F2:
		cmp	[bp+var_1], 0
		jz	short loc_83824
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_83824:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_83996
		jmp	loc_8607C

loc_83996:
		cmp	[bp+var_1E], 0
		jnz	short loc_839A0
		jmp	loc_8607C

loc_839A0:
		push	0
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, word ptr [bp+var_1E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	loc_8607C
		jmp	loc_8607C

loc_839BB:
		mov	eax, [bp+var_54]
		add	eax, [bp+var_50]
		cmp	eax, dword_5E7D3
		ja	short loc_839CF
		mov	ax, 1
		jmp	short loc_839D1

loc_839CF:
		xor	ax, ax

loc_839D1:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_839DA
		jmp	loc_837E0

loc_839DA:
		cmp	byte_603DE, 0
		jnz	short loc_839E4
		jmp	loc_83B98

loc_839E4:
		cmp	[bp+var_1], 0
		jz	short loc_83A16
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_83A16:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_83B88
		jmp	loc_8607C

loc_83B88:
		cmp	[bp+var_1E], 0
		jnz	short loc_83B92
		jmp	loc_8607C

loc_83B92:
		jmp	loc_839A0
		jmp	loc_8607C

loc_83B98:
		mov	byte ptr [bp+var_58+3], 0BEh
		mov	byte ptr [bp+var_562], 0
		mov	byte ptr [bp+var_562+1], 0
		mov	[bp+var_54D], 0
		mov	[bp+var_539], 0
		mov	[bp+var_51E], 1
		lea	ax, [bp+var_562]
		push	ax
		lea	ax, [bp+var_524]
		push	ax
		mov	al, byte ptr [bp+var_58+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_14085
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_14F62
		pop	cx
		push	2
		lea	ax, [bp+var_5D8]
		push	ax
		call	sub_141F1
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_83C0A
		mov	[bp+var_50], 50h
		jmp	short loc_83C12

loc_83C0A:
		mov	[bp+var_50], 14h

loc_83C12:
		mov	eax, dword_5E7D3
		mov	[bp+var_54], eax
		xor	si, si
		jmp	short loc_83C40

loc_83C1E:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2CE]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 0Dh
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_83C40:
		cmp	si, 2
		jl	short loc_83C1E
		xor	si, si
		jmp	short loc_83C6B

loc_83C49:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2F6]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_83C6B:
		cmp	si, 4
		jl	short loc_83C49
		jmp	loc_83E39

loc_83C73:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_83C85
		jmp	loc_83E39

loc_83C85:
		cmp	[bp+var_1], 0
		jz	short loc_83CB7
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_83CB7:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_83E29
		jmp	loc_8607C

loc_83E29:
		cmp	[bp+var_1E], 0
		jnz	short loc_83E33
		jmp	loc_8607C

loc_83E33:
		jmp	loc_839A0
		jmp	loc_8607C

loc_83E39:
		mov	eax, [bp+var_54]
		add	eax, [bp+var_50]
		cmp	eax, dword_5E7D3
		ja	short loc_83E4D
		mov	ax, 1
		jmp	short loc_83E4F

loc_83E4D:
		xor	ax, ax

loc_83E4F:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_83E58
		jmp	loc_83C73

loc_83E58:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_2E]
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		xor	si, si
		jmp	loc_83F6D

loc_83E80:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2CE]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_58+2], ax
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_83EB7

loc_83EAC:
		lea	ax, [bp+var_516]
		push	ax
		call	sub_1EED1
		pop	cx

loc_83EB7:
		push	word ptr [bp+var_58+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_83EAC
		push	word ptr [bp+var_58+2]
		lea	ax, [bp+var_516]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_58+2], 0
		jz	short loc_83EED
		push	3
		push	word ptr [bp+var_58+2]
		mov	bx, word ptr [bp+var_58+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_83EED

loc_83EED:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2C9]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_83F38
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2CE]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_83F38
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2CA]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2CE]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_83F38

loc_83F38:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2CE]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2C9]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2C8]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_83F6D:
		cmp	si, 2
		jge	short loc_83F75
		jmp	loc_83E80

loc_83F75:
		cmp	byte_603DE, 0
		jnz	short loc_83F7F
		jmp	loc_84133

loc_83F7F:
		cmp	[bp+var_1], 0
		jz	short loc_83FB1
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_83FB1:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_84123
		jmp	loc_8607C

loc_84123:
		cmp	[bp+var_1E], 0
		jnz	short loc_8412D
		jmp	loc_8607C

loc_8412D:
		jmp	loc_839A0
		jmp	loc_8607C

loc_84133:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_3A]
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	0Ch
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_SetFps_45DE3
		add	sp, 4
		xor	si, si
		jmp	loc_84257

loc_8416A:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2F6]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_58+2], ax
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_841A1

loc_84196:
		lea	ax, [bp+var_516]
		push	ax
		call	sub_1EED1
		pop	cx

loc_841A1:
		push	word ptr [bp+var_58+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_84196
		push	word ptr [bp+var_58+2]
		lea	ax, [bp+var_516]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_58+2], 0
		jz	short loc_841D7
		push	3
		push	word ptr [bp+var_58+2]
		mov	bx, word ptr [bp+var_58+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_841D7

loc_841D7:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2F1]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_84222
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2F6]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_84222
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2F2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2F6]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_84222

loc_84222:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2F6]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2F1]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_2F0]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_84257:
		cmp	si, 4
		jge	short loc_8425F
		jmp	loc_8416A

loc_8425F:
		jmp	loc_8446F

loc_84262:
		mov	[bp+var_50], 5
		mov	eax, dword_5E7D3
		mov	[bp+var_54], eax
		jmp	loc_8443B

loc_84275:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_84287
		jmp	loc_8443B

loc_84287:
		cmp	[bp+var_1], 0
		jz	short loc_842B9
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_842B9:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_8442B
		jmp	loc_8607C

loc_8442B:
		cmp	[bp+var_1E], 0
		jnz	short loc_84435
		jmp	loc_8607C

loc_84435:
		jmp	loc_839A0
		jmp	loc_8607C

loc_8443B:
		mov	eax, [bp+var_54]
		add	eax, [bp+var_50]
		cmp	eax, dword_5E7D3
		ja	short loc_8444F
		mov	ax, 1
		jmp	short loc_84451

loc_8444F:
		xor	ax, ax

loc_84451:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8445A
		jmp	loc_84275

loc_8445A:
		push	0
		push	[bp+var_3A]
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8

loc_8446F:
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_FadeStep_46DD3
		add	sp, 4
		or	al, al
		jz	short loc_84486
		jmp	loc_84262

loc_84486:
		cmp	byte_603DE, 0
		jnz	short loc_84490
		jmp	loc_84644

loc_84490:
		cmp	[bp+var_1], 0
		jz	short loc_844C2
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_844C2:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_84634
		jmp	loc_8607C

loc_84634:
		cmp	[bp+var_1E], 0
		jnz	short loc_8463E
		jmp	loc_8607C

loc_8463E:
		jmp	loc_839A0
		jmp	loc_8607C

loc_84644:
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_84663
		mov	[bp+var_50], 50h
		jmp	short loc_8466B

loc_84663:
		mov	[bp+var_50], 14h

loc_8466B:
		mov	eax, dword_5E7D3
		mov	[bp+var_54], eax
		xor	si, si
		jmp	short loc_84699

loc_84677:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_35A]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 16h
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_84699:
		cmp	si, 0Ah
		jl	short loc_84677
		jmp	loc_84858

loc_846A1:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_846B3
		jmp	loc_84858

loc_846B3:
		cmp	[bp+var_1], 0
		jz	short loc_846E5
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_846E5:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_84848
		jmp	loc_8607C

loc_84848:
		cmp	[bp+var_1E], 0
		jnz	short loc_84852
		jmp	loc_8607C

loc_84852:
		jmp	loc_839A0
		jmp	loc_8607C

loc_84858:
		mov	eax, [bp+var_54]
		add	eax, [bp+var_50]
		cmp	eax, dword_5E7D3
		ja	short loc_8486C
		mov	ax, 1
		jmp	short loc_8486E

loc_8486C:
		xor	ax, ax

loc_8486E:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_84877
		jmp	loc_846A1

loc_84877:
		lea	ax, [bp+var_6E]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_516]
		push	ax
		call	sub_1EE2D
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_40]
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		xor	si, si
		jmp	loc_849A2

loc_848B5:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_35A]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_58+2], ax
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_848EC

loc_848E1:
		lea	ax, [bp+var_516]
		push	ax
		call	sub_1EED1
		pop	cx

loc_848EC:
		push	word ptr [bp+var_58+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_848E1
		push	word ptr [bp+var_58+2]
		lea	ax, [bp+var_516]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_58+2], 0
		jz	short loc_84922
		push	3
		push	word ptr [bp+var_58+2]
		mov	bx, word ptr [bp+var_58+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_84922

loc_84922:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_355]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_8496D
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_35A]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_8496D
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_356]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_35A]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8496D

loc_8496D:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_35A]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_355]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_354]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_849A2:
		cmp	si, 0Ah
		jge	short loc_849AA
		jmp	loc_848B5

loc_849AA:
		cmp	byte_603DE, 0
		jnz	short loc_849B4
		jmp	loc_84B68

loc_849B4:
		cmp	[bp+var_1], 0
		jz	short loc_849E6
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_849E6:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_84B58
		jmp	loc_8607C

loc_84B58:
		cmp	[bp+var_1E], 0
		jnz	short loc_84B62
		jmp	loc_8607C

loc_84B62:
		jmp	loc_839A0
		jmp	loc_8607C

loc_84B68:
		xor	eax, eax
		mov	[bp+var_58], eax
		mov	[bp+var_5C], eax
		mov	[bp+var_58], 64h
		mov	eax, dword_5E7D3
		mov	[bp+var_5C], eax
		xor	si, si
		jmp	short loc_84BA9

loc_84B87:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3C8]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 21h
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_84BA9:
		cmp	si, 0Bh
		jl	short loc_84B87
		xor	si, si
		jmp	short loc_84BD4

loc_84BB2:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3F0]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_84BD4:
		cmp	si, 4
		jl	short loc_84BB2
		jmp	loc_84DA2

loc_84BDC:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_84BEE
		jmp	loc_84DA2

loc_84BEE:
		cmp	[bp+var_1], 0
		jz	short loc_84C20
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_84C20:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_84D92
		jmp	loc_8607C

loc_84D92:
		cmp	[bp+var_1E], 0
		jnz	short loc_84D9C
		jmp	loc_8607C

loc_84D9C:
		jmp	loc_839A0
		jmp	loc_8607C

loc_84DA2:
		mov	eax, [bp+var_5C]
		add	eax, [bp+var_58]
		cmp	eax, dword_5E7D3
		ja	short loc_84DB6
		mov	ax, 1
		jmp	short loc_84DB8

loc_84DB6:
		xor	ax, ax

loc_84DB8:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_84DC1
		jmp	loc_84BDC

loc_84DC1:
		push	8
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_SetFps_45DE3
		add	sp, 4
		push	0
		push	[bp+var_46]
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		cmp	[bp+var_1], 0
		jz	short loc_84DFF
		push	large 0FFh
		push	0
		push	[bp+var_A]
		push	di
		call	sub_4163D
		add	sp, 0Ah

loc_84DFF:
		xor	si, si
		jmp	loc_84EF1

loc_84E04:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3C8]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_58+2], ax
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_84E3B

loc_84E30:
		lea	ax, [bp+var_516]
		push	ax
		call	sub_1EED1
		pop	cx

loc_84E3B:
		push	word ptr [bp+var_58+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_84E30
		push	word ptr [bp+var_58+2]
		lea	ax, [bp+var_516]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_58+2], 0
		jz	short loc_84E71
		push	3
		push	word ptr [bp+var_58+2]
		mov	bx, word ptr [bp+var_58+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_84E71

loc_84E71:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3C3]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_84EBC
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3C8]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_84EBC
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3C4]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3C8]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_84EBC

loc_84EBC:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3C8]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3C3]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3C2]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_84EF1:
		cmp	si, 0Bh
		jge	short loc_84EF9
		jmp	loc_84E04

loc_84EF9:
		cmp	byte_603DE, 0
		jnz	short loc_84F03
		jmp	loc_850B7

loc_84F03:
		cmp	[bp+var_1], 0
		jz	short loc_84F35
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_84F35:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_850A7
		jmp	loc_8607C

loc_850A7:
		cmp	[bp+var_1E], 0
		jnz	short loc_850B1
		jmp	loc_8607C

loc_850B1:
		jmp	loc_839A0
		jmp	loc_8607C

loc_850B7:
		cmp	[bp+var_1], 0
		jz	short loc_850E0
		push	[bp+var_A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_A]
		push	large 0FFh
		push	0
		push	[bp+var_A]
		push	di
		call	sub_4163D
		add	sp, 0Ah

loc_850E0:
		xor	si, si
		jmp	loc_851D2

loc_850E5:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3F0]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_58+2], ax
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_8511C

loc_85111:
		lea	ax, [bp+var_516]
		push	ax
		call	sub_1EED1
		pop	cx

loc_8511C:
		push	word ptr [bp+var_58+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_85111
		push	word ptr [bp+var_58+2]
		lea	ax, [bp+var_516]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_58+2], 0
		jz	short loc_85152
		push	3
		push	word ptr [bp+var_58+2]
		mov	bx, word ptr [bp+var_58+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_85152

loc_85152:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3EB]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_8519D
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3F0]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_8519D
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3EC]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_3F0]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8519D

loc_8519D:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3F0]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3EB]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_3EA]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_851D2:
		cmp	si, 4
		jge	short loc_851DA
		jmp	loc_850E5

loc_851DA:
		cmp	byte_603DE, 0
		jnz	short loc_851E4
		jmp	loc_85398

loc_851E4:
		cmp	[bp+var_1], 0
		jz	short loc_85216
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_85216:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_85388
		jmp	loc_8607C

loc_85388:
		cmp	[bp+var_1E], 0
		jnz	short loc_85392
		jmp	loc_8607C

loc_85392:
		jmp	loc_839A0
		jmp	loc_8607C

loc_85398:
		xor	si, si
		jmp	short loc_853BE

loc_8539C:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_45E]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 34h
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_853BE:
		cmp	si, 0Bh
		jl	short loc_8539C
		cmp	[bp+var_1], 0
		jz	short loc_853EC
		push	[bp+var_A]
		push	di
		call	sub_41495
		add	sp, 4
		inc	[bp+var_A]
		push	large 0FFh
		push	0
		push	[bp+var_A]
		push	di
		call	sub_4180F
		add	sp, 0Ah

loc_853EC:
		xor	si, si
		jmp	loc_854DE

loc_853F1:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_45E]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_58+2], ax
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_85428

loc_8541D:
		lea	ax, [bp+var_516]
		push	ax
		call	sub_1EED1
		pop	cx

loc_85428:
		push	word ptr [bp+var_58+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_8541D
		push	word ptr [bp+var_58+2]
		lea	ax, [bp+var_516]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_58+2], 0
		jz	short loc_8545E
		push	3
		push	word ptr [bp+var_58+2]
		mov	bx, word ptr [bp+var_58+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_8545E

loc_8545E:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_459]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_854A9
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_45E]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_854A9
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_45A]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_45E]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_854A9

loc_854A9:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_45E]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_459]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_458]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_854DE:
		cmp	si, 0Bh
		jge	short loc_854E6
		jmp	loc_853F1

loc_854E6:
		cmp	byte_603DE, 0
		jnz	short loc_854F0
		jmp	loc_856A4

loc_854F0:
		cmp	[bp+var_1], 0
		jz	short loc_85522
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_85522:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_85694
		jmp	loc_8607C

loc_85694:
		cmp	[bp+var_1E], 0
		jnz	short loc_8569E
		jmp	loc_8607C

loc_8569E:
		jmp	loc_839A0
		jmp	loc_8607C

loc_856A4:
		xor	si, si
		jmp	short loc_856CA

loc_856A8:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_490]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 40h
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_856CA:
		cmp	si, 5
		jl	short loc_856A8
		mov	word ptr [bp+var_58+2], 0
		jmp	loc_857DD

loc_856D7:
		xor	si, si
		jmp	loc_857D2

loc_856DC:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_490]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_58], ax
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_85713

loc_85708:
		lea	ax, [bp+var_516]
		push	ax
		call	sub_1EED1
		pop	cx

loc_85713:
		push	word ptr [bp+var_58]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_85708
		push	word ptr [bp+var_58]
		lea	ax, [bp+var_516]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_58], 0
		jz	short loc_85749
		push	3
		push	word ptr [bp+var_58]
		mov	bx, word ptr [bp+var_58]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_85749

loc_85749:
		cmp	word ptr [bp+var_58+2], 2
		jz	short loc_85752
		jmp	loc_857D1

loc_85752:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_48B]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_8579D
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_490]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_8579D
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_48C]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_490]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_8579D

loc_8579D:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_490]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_48B]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_48A]
		add	bx, ax
		mov	dword ptr [bx], 0

loc_857D1:
		inc	si

loc_857D2:
		cmp	si, 5
		jge	short loc_857DA
		jmp	loc_856DC

loc_857DA:
		inc	word ptr [bp+var_58+2]

loc_857DD:
		cmp	word ptr [bp+var_58+2], 3
		jge	short loc_857E6
		jmp	loc_856D7

loc_857E6:
		cmp	byte_603DE, 0
		jnz	short loc_857F0
		jmp	loc_859A4

loc_857F0:
		cmp	[bp+var_1], 0
		jz	short loc_85822
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_85822:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_85994
		jmp	loc_8607C

loc_85994:
		cmp	[bp+var_1E], 0
		jnz	short loc_8599E
		jmp	loc_8607C

loc_8599E:
		jmp	loc_839A0
		jmp	loc_8607C

loc_859A4:
		xor	si, si
		jmp	short loc_859CA

loc_859A8:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_4F4]
		add	ax, dx
		push	ax
		mov	ax, si
		add	ax, 46h
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		inc	si

loc_859CA:
		cmp	si, 0Ah
		jl	short loc_859A8
		xor	si, si
		jmp	loc_85AC1

loc_859D4:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_4F4]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_46599
		add	sp, 8
		mov	word ptr [bp+var_58+2], ax
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		jmp	short loc_85A0B

loc_85A00:
		lea	ax, [bp+var_516]
		push	ax
		call	sub_1EED1
		pop	cx

loc_85A0B:
		push	word ptr [bp+var_58+2]
		call	sub_4663A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_85A00
		push	word ptr [bp+var_58+2]
		lea	ax, [bp+var_516]
		push	ax
		call	sub_45B7D
		add	sp, 4
		cmp	word ptr [bp+var_58+2], 0
		jz	short loc_85A41
		push	3
		push	word ptr [bp+var_58+2]
		mov	bx, word ptr [bp+var_58+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_85A41

loc_85A41:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4EF]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_85A8C
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4F4]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_85A8C
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4F0]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_4F4]
		add	ax, dx
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_85A8C

loc_85A8C:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4F4]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4EF]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4EE]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_85AC1:
		cmp	si, 0Ah
		jge	short loc_85AC9
		jmp	loc_859D4

loc_85AC9:
		cmp	byte_603DE, 0
		jnz	short loc_85AD3
		jmp	loc_85C87

loc_85AD3:
		cmp	[bp+var_1], 0
		jz	short loc_85B05
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_85B05:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_85C77
		jmp	loc_8607C

loc_85C77:
		cmp	[bp+var_1E], 0
		jnz	short loc_85C81
		jmp	loc_8607C

loc_85C81:
		jmp	loc_839A0
		jmp	loc_8607C

loc_85C87:
		mov	[bp+var_50], 0C8h
		mov	eax, dword_5E7D3
		mov	[bp+var_54], eax
		mov	byte ptr [bp+var_58], 0
		mov	byte ptr [bp+var_58+1], 0
		mov	byte ptr [bp+var_58+2], 0
		push	100h
		push	0
		lea	ax, word ptr [bp+var_5E]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, word ptr [bp+var_5E]
		push	ax
		call	sub_46B83
		pop	cx
		jmp	loc_85E91

loc_85CC1:
		push	0
		call	sub_1FA51
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_85CD3
		jmp	loc_85E91

loc_85CD3:
		cmp	[bp+var_1], 0
		jz	short loc_85D05
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_85D05:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		lea	ax, word ptr [bp+var_5E]
		push	ax
		call	sub_46E08
		pop	cx
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jnz	short loc_85E81
		jmp	loc_8607C

loc_85E81:
		cmp	[bp+var_1E], 0
		jnz	short loc_85E8B
		jmp	loc_8607C

loc_85E8B:
		jmp	loc_839A0
		jmp	loc_8607C

loc_85E91:
		mov	eax, [bp+var_54]
		add	eax, [bp+var_50]
		cmp	eax, dword_5E7D3
		ja	short loc_85EA5
		mov	ax, 1
		jmp	short loc_85EA7

loc_85EA5:
		xor	ax, ax

loc_85EA7:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_85EB0
		jmp	loc_85CC1

loc_85EB0:
		push	100h
		push	0
		push	3
		lea	ax, word ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		lea	ax, word ptr [bp+var_5E]
		push	ax
		call	sub_46E08
		pop	cx
		push	0
		lea	ax, [bp+var_516]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_85F12
		push	0
		push	di
		call	sub_41495
		add	sp, 4
		push	7
		push	di
		call	sub_41495
		add	sp, 4
		push	8
		push	di
		call	sub_41495
		add	sp, 4
		push	9
		push	di
		call	sub_41495
		add	sp, 4

loc_85F12:
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13C38
		add	sp, 4
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_4F4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_490]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_45E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_3F0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_3C8]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_35A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10004h
		push	0Ah
		lea	ax, [bp+var_2F6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 10002h
		push	0Ah
		lea	ax, [bp+var_2CE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 1000Bh
		push	0Ah
		lea	ax, [bp+var_2BA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_48]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_28]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_19], 0
		jz	short loc_8607C
		cmp	[bp+var_1E], 0
		jz	short loc_8607C
		jmp	loc_839A0

loc_8607C:
		mov	[bp+var_1E], 0
		mov	[bp+var_19], 0
		mov	[bp+var_18], 0
		lea	ax, [bp+var_14]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_234]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_1BC]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_144]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_7C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_6E]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_82F50		endp
ovr234		ends
