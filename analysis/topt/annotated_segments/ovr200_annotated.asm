ovr200		segment	para public 'OVERLAY' use16
		assume cs:ovr200
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_69270		proc far

var_EEC		= word ptr -0EECh
var_EEA		= word ptr -0EEAh
var_EE8		= word ptr -0EE8h
var_EE6		= word ptr -0EE6h
var_EDC		= word ptr -0EDCh
var_E8A		= word ptr -0E8Ah
var_E88		= word ptr -0E88h
var_E6C		= word ptr -0E6Ch
var_E3C		= word ptr -0E3Ch
var_E0F		= dword ptr -0E0Fh
var_E0B		= dword ptr -0E0Bh
var_E08		= word ptr -0E08h
var_E07		= dword ptr -0E07h
var_DFA		= word ptr -0DFAh
var_DF6		= dword ptr -0DF6h
var_DEB		= word ptr -0DEBh
var_DE9		= byte ptr -0DE9h
var_DE6		= word ptr -0DE6h
var_DE4		= word ptr -0DE4h
var_DD2		= word ptr -0DD2h
var_DD0		= word ptr -0DD0h
var_DCE		= word ptr -0DCEh
var_DCC		= word ptr -0DCCh
var_DCA		= dword ptr -0DCAh
var_DC6		= byte ptr -0DC6h
var_DC4		= word ptr -0DC4h
var_DC2		= word ptr -0DC2h
var_DC0		= word ptr -0DC0h
var_DBE		= word ptr -0DBEh
var_DBC		= dword ptr -0DBCh
var_DB8		= byte ptr -0DB8h
var_DB6		= word ptr -0DB6h
var_DB4		= word ptr -0DB4h
var_DA6		= dword ptr -0DA6h
var_DA2		= byte ptr -0DA2h
var_DA1		= byte ptr -0DA1h
var_DA0		= dword ptr -0DA0h
var_599		= dword ptr -599h
var_595		= dword ptr -595h
var_590		= word ptr -590h
var_58E		= word ptr -58Eh
var_58C		= word ptr -58Ch
var_58A		= word ptr -58Ah
var_588		= dword ptr -588h
var_584		= byte ptr -584h
var_582		= word ptr -582h
var_578		= word ptr -578h
var_56E		= word ptr -56Eh
var_546		= word ptr -546h
var_4CE		= word ptr -4CEh
var_456		= word ptr -456h
var_3DE		= word ptr -3DEh
var_3DC		= word ptr -3DCh
var_3C4		= word ptr -3C4h
var_3AC		= word ptr -3ACh
var_39C		= word ptr -39Ch
var_39A		= word ptr -39Ah
var_398		= word ptr -398h
var_395		= dword ptr -395h
var_391		= word ptr -391h
var_38F		= word ptr -38Fh
var_38C		= word ptr -38Ch
var_314		= word ptr -314h
var_29C		= word ptr -29Ch
var_224		= word ptr -224h
var_1D4		= word ptr -1D4h
var_1D2		= word ptr -1D2h
var_1D0		= word ptr -1D0h
var_1CE		= word ptr -1CEh
var_1CC		= word ptr -1CCh
var_1CA		= word ptr -1CAh
var_1C6		= word ptr -1C6h
var_1C4		= word ptr -1C4h
var_1C2		= word ptr -1C2h
var_1C0		= word ptr -1C0h
var_1BE		= word ptr -1BEh
var_1BC		= word ptr -1BCh
var_1B8		= word ptr -1B8h
var_1B6		= dword ptr -1B6h
var_1B2		= dword ptr -1B2h
var_1AE		= dword ptr -1AEh
var_1AC		= dword ptr -1ACh
var_1A8		= dword ptr -1A8h
var_1A6		= dword ptr -1A6h
var_1A4		= dword ptr -1A4h
var_1A2		= dword ptr -1A2h
var_1A0		= dword ptr -1A0h
var_19C		= dword ptr -19Ch
var_19A		= dword ptr -19Ah
var_198		= dword ptr -198h
var_194		= dword ptr -194h
var_192		= dword ptr -192h
var_190		= dword ptr -190h
var_18C		= dword ptr -18Ch
var_188		= word ptr -188h
var_186		= dword ptr -186h
var_182		= word ptr -182h
var_180		= word ptr -180h
var_17E		= word ptr -17Eh
var_17C		= word ptr -17Ch
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_176		= dword ptr -176h
var_174		= dword ptr -174h
var_170		= dword ptr -170h
var_16E		= dword ptr -16Eh
var_16C		= dword ptr -16Ch
var_16A		= dword ptr -16Ah
var_166		= dword ptr -166h
var_164		= dword ptr -164h
var_162		= dword ptr -162h
var_160		= dword ptr -160h
var_15C		= dword ptr -15Ch
var_15A		= dword ptr -15Ah
var_158		= dword ptr -158h
var_154		= word ptr -154h
var_152		= dword ptr -152h
var_14E		= word ptr -14Eh
var_14C		= byte ptr -14Ch
var_14B		= word ptr -14Bh
var_148		= dword ptr -148h
var_144		= byte ptr -144h
var_143		= byte ptr -143h
var_142		= dword ptr -142h
var_13E		= word ptr -13Eh
var_13C		= byte ptr -13Ch
var_13B		= word ptr -13Bh
var_138		= dword ptr -138h
var_134		= byte ptr -134h
var_133		= byte ptr -133h
var_132		= dword ptr -132h
var_12E		= dword ptr -12Eh
var_12A		= byte ptr -12Ah
var_129		= byte ptr -129h
var_128		= dword ptr -128h
var_124		= word ptr -124h
var_122		= byte ptr -122h
var_121		= word ptr -121h
var_11E		= dword ptr -11Eh
var_11A		= byte ptr -11Ah
var_119		= byte ptr -119h
var_118		= dword ptr -118h
var_114		= word ptr -114h
var_112		= byte ptr -112h
var_111		= word ptr -111h
var_10E		= dword ptr -10Eh
var_10A		= byte ptr -10Ah
var_109		= byte ptr -109h
var_108		= dword ptr -108h
var_104		= word ptr -104h
var_102		= byte ptr -102h
var_101		= word ptr -101h
var_FE		= dword ptr -0FEh
var_FA		= byte ptr -0FAh
var_F9		= byte ptr -0F9h
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= byte ptr -0F0h
var_EF		= byte ptr -0EFh
var_EE		= dword ptr -0EEh
var_EA		= word ptr -0EAh
var_E8		= byte ptr -0E8h
var_E7		= word ptr -0E7h
var_E4		= dword ptr -0E4h
var_E0		= byte ptr -0E0h
var_DF		= byte ptr -0DFh
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= byte ptr -0D6h
var_D5		= byte ptr -0D5h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= byte ptr -0CCh
var_CB		= byte ptr -0CBh
var_CA		= dword ptr -0CAh
var_C6		= dword ptr -0C6h
var_C2		= byte ptr -0C2h
var_C1		= byte ptr -0C1h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= byte ptr -0B8h
var_B7		= byte ptr -0B7h
var_B6		= dword ptr -0B6h
var_B2		= word ptr -0B2h
var_B0		= byte ptr -0B0h
var_AE		= dword ptr -0AEh
var_AA		= byte ptr -0AAh
var_A9		= byte ptr -0A9h
var_A8		= dword ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9E		= byte ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= byte ptr -9Ah
var_99		= word ptr -99h
var_96		= word ptr -96h
var_93		= word ptr -93h
var_90		= word ptr -90h
var_8E		= byte ptr -8Eh
var_8D		= word ptr -8Dh
var_8A		= word ptr -8Ah
var_88		= byte ptr -88h
var_87		= word ptr -87h
var_84		= word ptr -84h
var_82		= byte ptr -82h
var_81		= word ptr -81h
var_7E		= dword ptr -7Eh
var_7A		= byte ptr -7Ah
var_79		= byte ptr -79h
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= byte ptr -70h
var_6F		= byte ptr -6Fh
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= byte ptr -66h
var_65		= byte ptr -65h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= byte ptr -5Ch
var_5B		= byte ptr -5Bh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= byte ptr -52h
var_51		= byte ptr -51h
var_50		= dword ptr -50h
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= byte ptr -3Ch
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= byte ptr -32h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= byte ptr -2Ah
var_26		= word ptr -26h
var_22		= word ptr -22h
var_1F		= byte ptr -1Fh
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 0EDCh
		push	si
		push	di
		mov	[bp+var_2], 0
		push	12Ch
		push	8
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		mov	[bp+var_6], 0
		push	3Ch
		push	4
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		mov	[bp+var_A], 0
		push	3Ch
		push	3
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		mov	[bp+var_E], 0FFFBh
		mov	[bp+var_10], 0
		mov	[bp+var_12], 6
		mov	[bp+var_14], 0
		mov	[bp+var_16], 0FFF9h
		mov	[bp+var_18], 0
		mov	[bp+var_1A], 7
		mov	[bp+var_1C], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_1F], 0
		cmp	word_4CA5B, 0
		jz	short loc_692F8
		mov	[bp+var_1D], 1

loc_692F8:
		mov	ax, word_4D36E
		mov	[bp+var_22], ax
		mov	[bp+var_1C6], 0
		mov	[bp+var_1C4], 0
		push	[bp+var_22]
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_1D4], 0
		mov	[bp+var_1D2], 0
		mov	[bp+var_1D0], 0
		mov	[bp+var_1CE], 0
		mov	[bp+var_1CC], 13Fh
		mov	[bp+var_1CA], 0C7h
		push	0
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		call	sub_3499B
		add	sp, 4
		mov	[bp+var_1C2], 0
		mov	[bp+var_1C0], 18h
		mov	[bp+var_1BE], 13Fh
		mov	[bp+var_1BC], 97h
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid1_1
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_224]
		push	ax
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_29C]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgames_1
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_224]
		push	ax
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_314]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid1voc
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		cmp	[bp+var_1D], 0
		jz	short loc_6944D
		push	ds
		lea	ax, [bp+var_224]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_6944D
		push	1
		lea	ax, [bp+var_224]
		push	ax
		lea	ax, [bp+var_38C]
		push	ax
		mov	bx, [bp+var_38C]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_38C]
		push	ax
		call	sub_435F1
		add	sp, 2
		jmp	short loc_69451

loc_6944D:
		mov	[bp+var_1D], 0

loc_69451:
		push	100h
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_36], 0
		mov	[bp+var_32], 2
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	1Bh
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_36]
		push	ax
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		mov	[bp+var_3AC], 250Fh
		mov	[bp+var_395], 0
		mov	[bp+var_39C], 3
		mov	[bp+var_39A], 0
		mov	[bp+var_398], 7
		push	ds
		push	offset unk_4AE53
		push	ds
		push	large offset aConvfontShp_1
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_224]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_44+2], dx
		mov	word ptr [bp+var_44], ax
		mov	eax, [bp+var_44]
		mov	[bp+var_40], eax
		mov	[bp+var_3C], 3
		mov	[bp+var_3B], 1
		mov	[bp+var_3A], 0
		lea	ax, word ptr [bp+var_40]
		push	ax
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		lea	ax, [bp+var_3AC]
		push	ax
		push	word_4D36C
		lea	ax, [bp+var_3DE]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	[bp+var_4C], 0
		mov	[bp+var_4A], 98h
		mov	[bp+var_48], 13Fh
		mov	[bp+var_46], 0C7h
		mov	[bp+var_56], 0
		mov	[bp+var_52], 2
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	3
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	13h
		lea	ax, [bp+var_314]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_60], 0
		mov	[bp+var_5C], 2
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	3
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	14h
		lea	ax, [bp+var_314]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_6A], 0
		mov	[bp+var_66], 2
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	3
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	15h
		lea	ax, [bp+var_314]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_74], 0
		mov	[bp+var_70], 2
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		mov	[bp+var_7E], 0
		mov	[bp+var_7A], 2
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps_2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_224]
		push	ax
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_456]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals_2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_224]
		push	ax
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_4CE]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	3
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	74h
		lea	ax, [bp+var_456]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	2Ch
		lea	ax, [bp+var_456]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_84], 0
		mov	[bp+var_81], 0
		mov	[bp+var_8A], 0
		mov	[bp+var_87], 0
		mov	[bp+var_90], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_96], 0
		mov	[bp+var_93], 0
		mov	[bp+var_9C], 0
		mov	[bp+var_99], 0
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	2
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	15h
		lea	ax, [bp+var_4CE]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_158]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_162], 0
		mov	byte ptr [bp+var_160+2], 2
		mov	byte ptr [bp+var_160+3], 0
		mov	[bp+var_15C], 0
		push	2
		lea	ax, word ptr [bp+var_162]
		push	ax
		push	18h
		lea	ax, [bp+var_4CE]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_162]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_16C], 0
		mov	byte ptr [bp+var_16A+2], 2
		mov	byte ptr [bp+var_16A+3], 0
		mov	[bp+var_166], 0
		push	2
		lea	ax, word ptr [bp+var_16C]
		push	ax
		push	16h
		lea	ax, [bp+var_314]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_16C]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_176], 0
		mov	byte ptr [bp+var_174+2], 2
		mov	byte ptr [bp+var_174+3], 0
		mov	[bp+var_170], 0
		push	2
		lea	ax, word ptr [bp+var_176]
		push	ax
		push	3Bh
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_176]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		cmp	byte ptr [bp+var_174+3], 0
		jz	short loc_6980B
		cmp	[bp+var_176], 0
		jz	short loc_6980B
		push	0
		mov	al, byte ptr [bp+var_174+2]
		push	ax
		lea	ax, word ptr [bp+var_176]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6980B

loc_6980B:
		mov	[bp+var_176], 0
		mov	byte ptr [bp+var_174+3], 0
		mov	[bp+var_170], 0
		cmp	byte ptr [bp+var_16A+3], 0
		jz	short loc_6984A
		cmp	[bp+var_16C], 0
		jz	short loc_6984A
		push	0
		mov	al, byte ptr [bp+var_16A+2]
		push	ax
		lea	ax, word ptr [bp+var_16C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6984A

loc_6984A:
		mov	[bp+var_16C], 0
		mov	byte ptr [bp+var_16A+3], 0
		mov	[bp+var_166], 0
		cmp	byte ptr [bp+var_160+3], 0
		jz	short loc_69889
		cmp	[bp+var_162], 0
		jz	short loc_69889
		push	0
		mov	al, byte ptr [bp+var_160+2]
		push	ax
		lea	ax, word ptr [bp+var_162]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_69889

loc_69889:
		mov	[bp+var_162], 0
		mov	byte ptr [bp+var_160+3], 0
		mov	[bp+var_15C], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_698C8
		cmp	[bp+var_158], 0
		jz	short loc_698C8
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_698C8

loc_698C8:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	0
		push	2
		lea	ax, word ptr [bp+var_158]
		push	ax
		call	ConvData_LoadNormalOrNight_10C9F
		add	sp, 6
		lea	ax, word ptr [bp+var_158]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_69946
		cmp	[bp+var_158], 0
		jz	short loc_69946
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_69946

loc_69946:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		mov	al, byte_4CA58
		mov	[bp+var_9E], al
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_1D]
		mov	ah, 0
		or	ax, ax
		jz	short loc_6997D
		jmp	loc_69C18

loc_6997D:
		mov	al, [bp+var_9E]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_6998E
		jmp	loc_69C18

loc_6998E:
		shl	bx, 1
		jmp	cs:off_7024A[bx]	; switch jump

loc_69995:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_224]
		push	ax
		lea	ax, [bp+var_546]
		push	ax
		mov	bx, [bp+var_546]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_546]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_2
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_E6C]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_E6C], 480h
		mov	[bp+var_E0B], 100h
		mov	[bp+var_E0F], 0
		mov	[bp+var_E6C], 498h
		push	1
		lea	ax, [bp+var_224]
		push	ax
		lea	ax, [bp+var_E6C]
		push	ax
		mov	bx, [bp+var_E6C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_69A80

loc_69A6A:
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_69A80:
		cmp	si, 6Ah
		jle	short loc_69A6A
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_1F], 1
		mov	[bp+var_E6C], 498h
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_E6C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		jmp	loc_69C18

loc_69ABB:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_224]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_69AE9
		jmp	loc_69C16

loc_69AE9:
		cmp	word_4CA5D, 0
		jnz	short loc_69AF3
		jmp	loc_69C16

loc_69AF3:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_224]
		push	ax
		lea	ax, [bp+var_546]
		push	ax
		mov	bx, [bp+var_546]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_546]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_3
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_E6C]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_E6C], 480h
		mov	[bp+var_E0B], 100h
		mov	[bp+var_E0F], 0
		mov	[bp+var_E6C], 498h
		push	1
		lea	ax, [bp+var_224]
		push	ax
		lea	ax, [bp+var_E6C]
		push	ax
		mov	bx, [bp+var_E6C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_69BDE

loc_69BC8:
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_69BDE:
		cmp	si, 6Ah
		jle	short loc_69BC8
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_1F], 1
		mov	[bp+var_E6C], 498h
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_E6C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_69C16:
		jmp	short loc_69C18

loc_69C18:
		push	seg stub192
		push	offset sub_479E5
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	ax, word_4AC1E
		mov	[bp+var_A4], ax
		mov	ax, word_4AC20
		mov	[bp+var_A2], ax
		mov	ax, word_4AC22
		mov	[bp+var_A0], ax
		cmp	[bp+var_1F], 0
		jnz	short loc_69C4F
		jmp	loc_69D08

loc_69C4F:
		mov	[bp+var_DCE], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_DCC], ax
		lea	ax, [bp+var_DCE]
		mov	word_4D392, ax
		mov	[bp+var_DCE], 1BCh
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 0
		mov	[bp+var_DD2], 0
		mov	[bp+var_DD0], 0FFFFh
		push	word_4CA5D
		lea	ax, [bp+var_DD2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		xor	si, si
		jmp	short loc_69CE7

loc_69C98:
		push	3
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_582]
		add	ax, dx
		push	ax
		mov	al, byte ptr [bp+si+var_A4]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_546]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_582]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_DD2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_DD2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		inc	si

loc_69CE7:
		cmp	si, 6
		jl	short loc_69C98
		lea	ax, [bp+var_DD2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DCE]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_69D08:
		mov	[bp+var_AE], 0
		mov	[bp+var_AA], 2
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		mov	[bp+var_58C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_58A], ax
		lea	ax, [bp+var_58C]
		mov	word_4D392, ax
		mov	[bp+var_58C], 1BCh
		mov	[bp+var_588], 0
		mov	[bp+var_584], 0
		mov	[bp+var_590], 0
		mov	[bp+var_58E], 0FFFFh
		mov	al, [bp+var_9E]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_69DCA
		shl	bx, 1
		jmp	cs:off_70240[bx]	; switch jump

loc_69D6D:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_1E], 1
		jmp	short loc_69DCA

loc_69D8C:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_1E], 1
		jmp	short loc_69DCA

loc_69DAB:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_1E], 1
		jmp	short loc_69DCA

loc_69DCA:
		cmp	[bp+var_1E], 0
		jz	short loc_69E3B
		push	1
		lea	ax, [bp+var_224]
		push	ax
		lea	ax, [bp+var_E3C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_E3C]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	3
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	0
		lea	ax, [bp+var_E3C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_590]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_AE]
		push	ax
		lea	ax, [bp+var_590]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, [bp+var_E3C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_69E3B:
		mov	[bp+var_DB6], 129Fh
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA2], 2
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		mov	[bp+var_DB4], 0
		mov	[bp+var_DB6], 1FA5h
		xor	eax, eax
		mov	[bp+var_599], eax
		mov	[bp+var_595], eax
		mov	[bp+var_DC0], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_DBE], ax
		lea	ax, [bp+var_DC0]
		mov	word_4D392, ax
		mov	[bp+var_DC0], 1BCh
		mov	[bp+var_DBC], 0
		mov	[bp+var_DB8], 0
		mov	[bp+var_DC4], 0
		mov	[bp+var_DC2], 0FFFFh
		cmp	[bp+var_1F], 0
		jz	short loc_69EC1
		push	word_4CA5D
		lea	ax, [bp+var_DC4]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4

loc_69EC1:
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_4
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_E6C]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_E6C], 480h
		mov	[bp+var_E0B], 100h
		mov	[bp+var_E0F], 0
		mov	[bp+var_E6C], 498h
		push	1
		lea	ax, [bp+var_224]
		push	ax
		lea	ax, [bp+var_E6C]
		push	ax
		mov	bx, [bp+var_E6C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3130474Dh
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		xor	si, si
		jmp	short loc_69F9C

loc_69F49:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	di, [bp+var_DFA]
		cmp	di, 3Ch
		jle	short loc_69F72
		push	249Fh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_69F72:
		movsx	eax, di
		push	eax
		push	ds
		mov	ax, [bp+var_8]
		imul	si
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_DF6]
		mov	[bp+var_E07], eax
		inc	si

loc_69F9C:
		cmp	si, 4
		jl	short loc_69F49
		xor	si, si
		jmp	short loc_69FF8

loc_69FA5:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	di, [bp+var_DFA]
		cmp	di, 3Ch
		jle	short loc_69FCE
		push	24C0h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_69FCE:
		movsx	eax, di
		push	eax
		push	ds
		mov	ax, [bp+var_C]
		imul	si
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_DF6]
		mov	[bp+var_E07], eax
		inc	si

loc_69FF8:
		cmp	si, 3
		jl	short loc_69FA5
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		cmp	[bp+var_1D], 0
		jz	short loc_6A023
		push	word_4CA5B
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		jmp	short loc_6A09D

loc_6A023:
		push	0
		push	large 4B4F5053h
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		xor	di, di
		jmp	short loc_6A098

loc_6A03C:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	ax, [bp+var_DFA]
		mov	word ptr [bp+var_152+2], ax
		cmp	word ptr [bp+var_152+2], 12Ch
		jle	short loc_6A06C
		push	24E1h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_6A06C:
		movsx	eax, word ptr [bp+var_152+2]
		push	eax
		push	ds
		mov	ax, [bp+var_4]
		imul	di
		mov	dx, [bp+var_2]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_DF6]
		mov	[bp+var_E07], eax
		inc	di

loc_6A098:
		cmp	di, 8
		jl	short loc_6A03C

loc_6A09D:
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_E6C], 498h
		lea	ax, [bp+var_E6C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_E6C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	byte ptr [bp+var_B2], 0
		mov	byte ptr [bp+var_B2+1], 0
		mov	[bp+var_B0], 0
		push	100h
		push	0
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_FillRange_34CAC
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	0
		mov	al, [bp+var_70]
		push	ax
		push	word ptr [bp+var_74+2]
		push	word ptr [bp+var_74]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	18h
		push	0
		lea	ax, [bp+var_1C6]
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_5C]
		push	ax
		push	word ptr [bp+var_60+2]
		push	word ptr [bp+var_60]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	18h
		push	0
		lea	ax, [bp+var_1C6]
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		call	Input_Flush_116D1
		lea	ax, [bp+var_3C4]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_4C]
		mov	[bp+var_EEC], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_EEA], ax
		mov	ax, [bp+var_48]
		mov	[bp+var_EE8], ax
		mov	ax, [bp+var_46]
		mov	[bp+var_EE6], ax
		lea	ax, [bp+var_DE6]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	2
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	3Ch
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_162], 0
		mov	byte ptr [bp+var_160+2], 2
		mov	byte ptr [bp+var_160+3], 0
		mov	[bp+var_15C], 0
		push	2
		lea	ax, word ptr [bp+var_162]
		push	ax
		push	30h
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_166+1], 0
		lea	ax, word ptr [bp+var_162]
		push	ax
		lea	ax, word ptr [bp+var_16A+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		cmp	[bp+var_1E], 0
		jz	short loc_6A25B
		cmp	[bp+var_590], 0
		jz	short loc_6A25B
		push	[bp+var_58E]
		mov	bx, [bp+var_590]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_6A25B

loc_6A25B:
		push	[bp+var_84]
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_8A]
		mov	al, [bp+var_88]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_FadeFromColor_34EEE
		add	sp, 0Ah
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_16C], ax
		or	ax, ax
		jz	short loc_6A310
		push	0
		push	0
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	word ptr [bp+var_16C]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_16C]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_16C]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_16C]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_16C]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_16C]
		jmp	short loc_6A314

loc_6A310:
		mov	ax, word ptr [bp+var_16C]

loc_6A314:
		mov	word ptr [bp+var_16A], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_170], ax
		or	ax, ax
		jz	short loc_6A367
		push	0
		push	0
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	word ptr [bp+var_170]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_170]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_170]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_170]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_170]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_170]
		jmp	short loc_6A36B

loc_6A367:
		mov	ax, word ptr [bp+var_170]

loc_6A36B:
		mov	word ptr [bp+var_16E], ax
		push	word ptr [bp+var_16A]
		lea	ax, [bp+var_E08]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_16E]
		lea	ax, [bp+var_E08]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_1A2], 0
		mov	byte ptr [bp+var_1A0+2], 2
		mov	byte ptr [bp+var_1A0+3], 0
		mov	[bp+var_19C], 0
		push	3
		lea	ax, word ptr [bp+var_1A2]
		push	ax
		push	3
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_1A2]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	si, ax
		mov	[bp+var_1AC], 0
		mov	byte ptr [bp+var_1A8], 2
		mov	byte ptr [bp+var_1A8+1], 0
		mov	[bp+var_1A6], 0
		cmp	[bp+var_1D], 0
		jz	short loc_6A424
		push	2
		lea	ax, word ptr [bp+var_1AC]
		push	ax
		push	7
		lea	ax, [bp+var_38C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_1AC]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		jmp	short loc_6A44B

loc_6A424:
		cmp	[bp+var_1F], 0
		jz	short loc_6A44B
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	0
		lea	ax, [bp+var_582]
		push	ax
		lea	ax, [bp+var_DC4]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_6A44B:
		jmp	short loc_6A45A

loc_6A44D:
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_6A45A:
		cmp	[bp+var_DEB], 14h
		jnb	short loc_6A468
		cmp	[bp+var_DE9], 0
		jz	short loc_6A46D

loc_6A468:
		mov	ax, 1
		jmp	short loc_6A46F

loc_6A46D:
		xor	ax, ax

loc_6A46F:
		mov	ah, 0
		or	ax, ax
		jz	short loc_6A44D
		push	si
		lea	ax, [bp+var_E08]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	al, byte_4F55C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6A4C5
		cmp	[bp+var_1D], 0
		jz	short loc_6A4A3
		push	0FFFFh
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_6A4C5

loc_6A4A3:
		cmp	[bp+var_1F], 0
		jz	short loc_6A4C5
		cmp	[bp+var_DC4], 0
		jz	short loc_6A4C5
		push	[bp+var_DC2]
		mov	bx, [bp+var_DC4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_6A4C5

loc_6A4C5:
		jmp	short loc_6A514

loc_6A4C7:
		cmp	[bp+var_DEB], 23h
		jnz	short loc_6A507
		cmp	[bp+var_1D], 0
		jz	short loc_6A4E5
		push	0FFFFh
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_6A507

loc_6A4E5:
		cmp	[bp+var_1F], 0
		jz	short loc_6A507
		cmp	[bp+var_DC4], 0
		jz	short loc_6A507
		push	[bp+var_DC2]
		mov	bx, [bp+var_DC4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_6A507

loc_6A507:
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_6A514:
		push	si
		call	AnimLayer_IsFinished_346A0
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_6A4C7
		push	si
		lea	ax, [bp+var_E08]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		or	si, si
		jz	short loc_6A541
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_6A541

loc_6A541:
		cmp	[bp+var_1D], 0
		jz	short loc_6A554
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_6A554:
		cmp	byte ptr [bp+var_1A8+1], 0
		jz	short loc_6A57C
		cmp	[bp+var_1AC], 0
		jz	short loc_6A57C
		push	0
		mov	al, byte ptr [bp+var_1A8]
		push	ax
		lea	ax, word ptr [bp+var_1AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A57C

loc_6A57C:
		mov	[bp+var_1AC], 0
		mov	byte ptr [bp+var_1A8+1], 0
		mov	[bp+var_1A6], 0
		cmp	byte ptr [bp+var_1A0+3], 0
		jz	short loc_6A5BB
		cmp	[bp+var_1A2], 0
		jz	short loc_6A5BB
		push	0
		mov	al, byte ptr [bp+var_1A0+2]
		push	ax
		lea	ax, word ptr [bp+var_1A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A5BB

loc_6A5BB:
		mov	[bp+var_1A2], 0
		mov	byte ptr [bp+var_1A0+3], 0
		mov	[bp+var_19C], 0
		push	14h
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_6A5EB
		jmp	loc_6AA22

loc_6A5EB:
		push	0
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_16A+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_160+3], 0
		jz	short loc_6A62F
		cmp	[bp+var_162], 0
		jz	short loc_6A62F
		push	0
		mov	al, byte ptr [bp+var_160+2]
		push	ax
		lea	ax, word ptr [bp+var_162]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A62F

loc_6A62F:
		mov	[bp+var_162], 0
		mov	byte ptr [bp+var_160+3], 0
		mov	[bp+var_15C], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_6A66E
		cmp	[bp+var_158], 0
		jz	short loc_6A66E
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A66E

loc_6A66E:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		lea	ax, [bp+var_DE4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DC0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		mov	[bp+var_DB6], 129Fh
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_DA1], 0
		jz	short loc_6A6E9
		cmp	[bp+var_DA6], 0
		jz	short loc_6A6E9
		push	0
		mov	al, [bp+var_DA2]
		push	ax
		lea	ax, word ptr [bp+var_DA6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A6E9

loc_6A6E9:
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		lea	ax, [bp+var_590]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_58C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_A9], 0
		jz	short loc_6A744
		cmp	[bp+var_AE], 0
		jz	short loc_6A744
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A744

loc_6A744:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6A806
		cmp	[bp+var_7E], 0
		jz	short loc_6A806
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A806

loc_6A806:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_6A83E
		cmp	[bp+var_74], 0
		jz	short loc_6A83E
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A83E

loc_6A83E:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_6A876
		cmp	[bp+var_6A], 0
		jz	short loc_6A876
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A876

loc_6A876:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_6A8AE
		cmp	[bp+var_60], 0
		jz	short loc_6A8AE
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A8AE

loc_6A8AE:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6A8E6
		cmp	[bp+var_56], 0
		jz	short loc_6A8E6
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A8E6

loc_6A8E6:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3DC]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_6A93A
		cmp	[bp+var_40], 0
		jz	short loc_6A93A
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A93A

loc_6A93A:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6A981
		cmp	[bp+var_36], 0
		jz	short loc_6A981
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6A981

loc_6A981:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_6AA22:
		call	Input_Flush_116D1
		mov	byte ptr [bp+var_174+3], 0
		push	[bp+var_9C]
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		xor	di, di
		jmp	loc_6B642

loc_6AA60:
		push	0FFh
		lea	ax, word ptr [bp+var_19C]
		push	ax
		call	Keyboard_QueryAndDispatch_443C0
		add	sp, 4
		cmp	byte ptr [bp+var_19C+1], 1
		jz	short loc_6AA7A
		jmp	loc_6AEB6

loc_6AA7A:
		mov	byte_4F55C, 1
		push	0
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_16A+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_160+3], 0
		jz	short loc_6AAC3
		cmp	[bp+var_162], 0
		jz	short loc_6AAC3
		push	0
		mov	al, byte ptr [bp+var_160+2]
		push	ax
		lea	ax, word ptr [bp+var_162]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6AAC3

loc_6AAC3:
		mov	[bp+var_162], 0
		mov	byte ptr [bp+var_160+3], 0
		mov	[bp+var_15C], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_6AB02
		cmp	[bp+var_158], 0
		jz	short loc_6AB02
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6AB02

loc_6AB02:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		lea	ax, [bp+var_DE4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DC0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		mov	[bp+var_DB6], 129Fh
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_DA1], 0
		jz	short loc_6AB7D
		cmp	[bp+var_DA6], 0
		jz	short loc_6AB7D
		push	0
		mov	al, [bp+var_DA2]
		push	ax
		lea	ax, word ptr [bp+var_DA6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6AB7D

loc_6AB7D:
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		lea	ax, [bp+var_590]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_58C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_A9], 0
		jz	short loc_6ABD8
		cmp	[bp+var_AE], 0
		jz	short loc_6ABD8
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6ABD8

loc_6ABD8:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6AC9A
		cmp	[bp+var_7E], 0
		jz	short loc_6AC9A
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6AC9A

loc_6AC9A:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_6ACD2
		cmp	[bp+var_74], 0
		jz	short loc_6ACD2
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6ACD2

loc_6ACD2:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_6AD0A
		cmp	[bp+var_6A], 0
		jz	short loc_6AD0A
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6AD0A

loc_6AD0A:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_6AD42
		cmp	[bp+var_60], 0
		jz	short loc_6AD42
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6AD42

loc_6AD42:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6AD7A
		cmp	[bp+var_56], 0
		jz	short loc_6AD7A
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6AD7A

loc_6AD7A:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3DC]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_6ADCE
		cmp	[bp+var_40], 0
		jz	short loc_6ADCE
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6ADCE

loc_6ADCE:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6AE15
		cmp	[bp+var_36], 0
		jz	short loc_6AE15
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6AE15

loc_6AE15:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_6AEB6:
		cmp	byte ptr [bp+var_174+3], 0
		jz	short loc_6AEC0
		jmp	loc_6B64A

loc_6AEC0:
		xor	eax, eax
		mov	[bp+var_1A0], eax
		mov	[bp+var_1A4], eax
		xor	si, si
		jmp	loc_6AFDE

loc_6AED2:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_6AEE3
		mov	byte ptr [bp+var_174+3], 1
		jmp	loc_6AFE6

loc_6AEE3:
		mov	[bp+var_1A0], 3
		mov	eax, dword_4DE15
		mov	[bp+var_1A4], eax
		push	0
		push	0
		mov	al, [bp+var_70]
		push	ax
		push	word ptr [bp+var_74+2]
		push	word ptr [bp+var_74]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1D4]
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_5C]
		push	ax
		push	word ptr [bp+var_60+2]
		push	word ptr [bp+var_60]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1D4]
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		push	word ptr [bp+var_158+2]
		push	word ptr [bp+var_158]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 0Ch
		add	ax, bx
		mov	word ptr [bp+var_1A6], dx
		mov	word ptr [bp+var_1A8], ax
		mov	eax, [bp+var_1A8]
		mov	[bp+var_395], eax
		mov	[bp+var_391], 0EFh
		mov	[bp+var_38F], 10h
		cmp	di, 1
		jnz	short loc_6AF96
		mov	ax, 23h
		jmp	short loc_6AF99

loc_6AF96:
		mov	ax, 32h

loc_6AF99:
		mov	[bp+var_1B8], ax
		mov	ax, [bp+var_8]
		imul	di
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		push	[bp+var_1B8]
		push	2
		push	24FBh
		lea	ax, [bp+var_3DE]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		lea	ax, [bp+var_1C6]
		push	ax
		lea	ax, [bp+var_1D4]
		push	ax
		call	UI_ApplyEncodingHelper_35A77
		add	sp, 4
		lea	ax, word ptr [bp+var_1A4]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		inc	si

loc_6AFDE:
		cmp	si, 10h
		jge	short loc_6AFE6
		jmp	loc_6AED2

loc_6AFE6:
		push	0FFh
		lea	ax, word ptr [bp+var_19C]
		push	ax
		call	Keyboard_QueryAndDispatch_443C0
		add	sp, 4
		cmp	byte ptr [bp+var_19C+1], 1
		jz	short loc_6B000
		jmp	loc_6B43C

loc_6B000:
		mov	byte_4F55C, 1
		push	0
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_16A+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_160+3], 0
		jz	short loc_6B049
		cmp	[bp+var_162], 0
		jz	short loc_6B049
		push	0
		mov	al, byte ptr [bp+var_160+2]
		push	ax
		lea	ax, word ptr [bp+var_162]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B049

loc_6B049:
		mov	[bp+var_162], 0
		mov	byte ptr [bp+var_160+3], 0
		mov	[bp+var_15C], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_6B088
		cmp	[bp+var_158], 0
		jz	short loc_6B088
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B088

loc_6B088:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		lea	ax, [bp+var_DE4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DC0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		mov	[bp+var_DB6], 129Fh
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_DA1], 0
		jz	short loc_6B103
		cmp	[bp+var_DA6], 0
		jz	short loc_6B103
		push	0
		mov	al, [bp+var_DA2]
		push	ax
		lea	ax, word ptr [bp+var_DA6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B103

loc_6B103:
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		lea	ax, [bp+var_590]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_58C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_A9], 0
		jz	short loc_6B15E
		cmp	[bp+var_AE], 0
		jz	short loc_6B15E
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B15E

loc_6B15E:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6B220
		cmp	[bp+var_7E], 0
		jz	short loc_6B220
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B220

loc_6B220:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_6B258
		cmp	[bp+var_74], 0
		jz	short loc_6B258
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B258

loc_6B258:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_6B290
		cmp	[bp+var_6A], 0
		jz	short loc_6B290
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B290

loc_6B290:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_6B2C8
		cmp	[bp+var_60], 0
		jz	short loc_6B2C8
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B2C8

loc_6B2C8:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6B300
		cmp	[bp+var_56], 0
		jz	short loc_6B300
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B300

loc_6B300:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3DC]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_6B354
		cmp	[bp+var_40], 0
		jz	short loc_6B354
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B354

loc_6B354:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6B39B
		cmp	[bp+var_36], 0
		jz	short loc_6B39B
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B39B

loc_6B39B:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_6B43C:
		cmp	byte ptr [bp+var_174+3], 0
		jz	short loc_6B446
		jmp	loc_6B64A

loc_6B446:
		mov	word ptr [bp+var_1AC+2], 64h
		movsx	eax, word ptr [bp+var_1AC+2]
		mov	[bp+var_1AE], eax
		mov	eax, [bp+var_1AE]
		mov	[bp+var_1A0], eax
		mov	eax, dword_4DE15
		mov	[bp+var_1A4], eax
		lea	ax, word ptr [bp+var_1A4]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		mov	si, 0Fh
		jmp	loc_6B589

loc_6B47D:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_6B48E
		mov	byte ptr [bp+var_174+3], 1
		jmp	loc_6B591

loc_6B48E:
		mov	[bp+var_1A0], 3
		mov	eax, dword_4DE15
		mov	[bp+var_1A4], eax
		push	0
		push	0
		mov	al, [bp+var_70]
		push	ax
		push	word ptr [bp+var_74+2]
		push	word ptr [bp+var_74]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1D4]
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_5C]
		push	ax
		push	word ptr [bp+var_60+2]
		push	word ptr [bp+var_60]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1D4]
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		push	word ptr [bp+var_158+2]
		push	word ptr [bp+var_158]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 0Ch
		add	ax, bx
		mov	word ptr [bp+var_1B2+2], dx
		mov	word ptr [bp+var_1B2], ax
		mov	eax, [bp+var_1B2]
		mov	[bp+var_395], eax
		mov	[bp+var_391], 0EFh
		mov	[bp+var_38F], 10h
		cmp	di, 1
		jnz	short loc_6B541
		mov	ax, 23h
		jmp	short loc_6B544

loc_6B541:
		mov	ax, 32h

loc_6B544:
		mov	[bp+var_1B8], ax
		mov	ax, [bp+var_8]
		imul	di
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		push	[bp+var_1B8]
		push	2
		push	2502h
		lea	ax, [bp+var_3DE]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		lea	ax, [bp+var_1C6]
		push	ax
		lea	ax, [bp+var_1D4]
		push	ax
		call	UI_ApplyEncodingHelper_35A77
		add	sp, 4
		lea	ax, word ptr [bp+var_1A4]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		dec	si

loc_6B589:
		cmp	si, 0FFFFh
		jle	short loc_6B591
		jmp	loc_6B47D

loc_6B591:
		cmp	byte ptr [bp+var_174+3], 0
		jz	short loc_6B59B
		jmp	loc_6B64A

loc_6B59B:
		push	0
		push	0
		mov	al, [bp+var_70]
		push	ax
		push	word ptr [bp+var_74+2]
		push	word ptr [bp+var_74]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1D4]
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_5C]
		push	ax
		push	word ptr [bp+var_60+2]
		push	word ptr [bp+var_60]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1D4]
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		lea	ax, [bp+var_1C6]
		push	ax
		lea	ax, [bp+var_1D4]
		push	ax
		call	UI_ApplyEncodingHelper_35A77
		add	sp, 4
		mov	word ptr [bp+var_1AC+2], 64h
		cmp	di, 1
		jnz	short loc_6B616
		mov	word ptr [bp+var_1AC+2], 0FAh

loc_6B616:
		movsx	eax, word ptr [bp+var_1AC+2]
		mov	[bp+var_1B6], eax
		mov	eax, [bp+var_1B6]
		mov	[bp+var_1A0], eax
		mov	eax, dword_4DE15
		mov	[bp+var_1A4], eax
		lea	ax, word ptr [bp+var_1A4]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		inc	di

loc_6B642:
		cmp	di, 4
		jge	short loc_6B64A
		jmp	loc_6AA60

loc_6B64A:
		cmp	byte_4F55C, 0
		jnz	short loc_6B654
		jmp	loc_6BA8B

loc_6B654:
		push	0
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_16A+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_160+3], 0
		jz	short loc_6B698
		cmp	[bp+var_162], 0
		jz	short loc_6B698
		push	0
		mov	al, byte ptr [bp+var_160+2]
		push	ax
		lea	ax, word ptr [bp+var_162]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B698

loc_6B698:
		mov	[bp+var_162], 0
		mov	byte ptr [bp+var_160+3], 0
		mov	[bp+var_15C], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_6B6D7
		cmp	[bp+var_158], 0
		jz	short loc_6B6D7
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B6D7

loc_6B6D7:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		lea	ax, [bp+var_DE4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DC0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		mov	[bp+var_DB6], 129Fh
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_DA1], 0
		jz	short loc_6B752
		cmp	[bp+var_DA6], 0
		jz	short loc_6B752
		push	0
		mov	al, [bp+var_DA2]
		push	ax
		lea	ax, word ptr [bp+var_DA6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B752

loc_6B752:
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		lea	ax, [bp+var_590]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_58C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_A9], 0
		jz	short loc_6B7AD
		cmp	[bp+var_AE], 0
		jz	short loc_6B7AD
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B7AD

loc_6B7AD:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6B86F
		cmp	[bp+var_7E], 0
		jz	short loc_6B86F
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B86F

loc_6B86F:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_6B8A7
		cmp	[bp+var_74], 0
		jz	short loc_6B8A7
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B8A7

loc_6B8A7:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_6B8DF
		cmp	[bp+var_6A], 0
		jz	short loc_6B8DF
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B8DF

loc_6B8DF:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_6B917
		cmp	[bp+var_60], 0
		jz	short loc_6B917
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B917

loc_6B917:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6B94F
		cmp	[bp+var_56], 0
		jz	short loc_6B94F
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B94F

loc_6B94F:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3DC]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_6B9A3
		cmp	[bp+var_40], 0
		jz	short loc_6B9A3
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B9A3

loc_6B9A3:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6B9EA
		cmp	[bp+var_36], 0
		jz	short loc_6B9EA
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6B9EA

loc_6B9EA:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_6BA8B:
		mov	[bp+var_DE9], 0
		call	Input_Flush_116D1
		mov	bx, word ptr [bp+var_16A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_16A]
		mov	word ptr [bx+1Fh], 0FFFFh
		mov	bx, word ptr [bp+var_16E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_16E]
		mov	word ptr [bx+1Fh], 0FFFFh
		push	word ptr [bp+var_16A+2]
		mov	al, byte ptr [bp+var_166]
		push	ax
		lea	ax, word ptr [bp+var_16A+2]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_176], ax
		or	ax, ax
		jz	short loc_6BB4C
		push	0
		push	96h
		push	0
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	word ptr [bp+var_176]
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_176]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_176]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_176]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_176]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_176]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_176]
		mov	word ptr [bx+1Fh], 0FFFFh
		mov	ax, word ptr [bp+var_176]
		jmp	short loc_6BB50

loc_6BB4C:
		mov	ax, word ptr [bp+var_176]

loc_6BB50:
		mov	word ptr [bp+var_174], ax
		push	word ptr [bp+var_174]
		lea	ax, [bp+var_E08]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_17A], ax
		or	ax, ax
		jz	short loc_6BBC8
		push	0
		push	11h
		push	0
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	[bp+var_17A]
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	bx, [bp+var_17A]
		mov	word ptr [bx], 20D9h
		mov	bx, [bp+var_17A]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, [bp+var_17A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_17A]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_17A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_17A]
		mov	word ptr [bx+1Fh], 0FFFFh
		mov	ax, [bp+var_17A]
		jmp	short loc_6BBCC

loc_6BBC8:
		mov	ax, [bp+var_17A]

loc_6BBCC:
		mov	[bp+var_178], ax
		push	[bp+var_178]
		lea	ax, [bp+var_E08]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_17E], ax
		or	ax, ax
		jz	short loc_6BC45
		push	1
		push	0C8h
		push	0
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	[bp+var_17E]
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	bx, [bp+var_17E]
		mov	word ptr [bx], 20D9h
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Fh], 0FFFFh
		mov	ax, [bp+var_17E]
		jmp	short loc_6BC49

loc_6BC45:
		mov	ax, [bp+var_17E]

loc_6BC49:
		mov	[bp+var_17C], ax
		push	[bp+var_17C]
		push	[bp+var_178]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_182], ax
		or	ax, ax
		jz	short loc_6BCC0
		push	2
		push	2Bh
		push	0
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	[bp+var_182]
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	bx, [bp+var_182]
		mov	word ptr [bx], 20D9h
		mov	bx, [bp+var_182]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, [bp+var_182]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_182]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_182]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_182]
		mov	word ptr [bx+1Fh], 0FFFFh
		mov	ax, [bp+var_182]
		jmp	short loc_6BCC4

loc_6BCC0:
		mov	ax, [bp+var_182]

loc_6BCC4:
		mov	[bp+var_180], ax
		push	[bp+var_180]
		push	[bp+var_17C]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_6BCE7

loc_6BCDA:
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_6BCE7:
		push	[bp+var_180]
		mov	bx, [bp+var_180]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		cmp	ax, 3Ch
		jg	short loc_6BCDA
		mov	bx, word ptr [bp+var_16A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_16A]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_16E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_16E]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_174]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_174]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_178]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_178]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_180]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_180]
		mov	word ptr [bx+1Fh], 0
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_18C], 0
		mov	byte ptr [bp+var_188], 2
		mov	byte ptr [bp+var_188+1], 0
		mov	[bp+var_186], 0
		push	2
		lea	ax, word ptr [bp+var_18C]
		push	ax
		push	0Dh
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0FFBAh
		push	0
		lea	ax, word ptr [bp+var_18C]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	word ptr [bp+var_190+2], ax
		push	word ptr [bp+var_190+2]
		lea	ax, [bp+var_E08]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_198], 0
		mov	byte ptr [bp+var_194], 2
		mov	byte ptr [bp+var_194+1], 0
		mov	[bp+var_192], 0
		cmp	[bp+var_1D], 0
		jz	short loc_6BE28
		push	2
		lea	ax, word ptr [bp+var_198]
		push	ax
		push	8
		lea	ax, [bp+var_38C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		lea	ax, word ptr [bp+var_198]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		jmp	short loc_6BE4F

loc_6BE28:
		cmp	[bp+var_1F], 0
		jz	short loc_6BE4F
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	0
		lea	ax, [bp+var_578]
		push	ax
		lea	ax, [bp+var_DC4]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_6BE4F:
		mov	[bp+var_DEB], 0
		jmp	short loc_6BEA4

loc_6BE57:
		cmp	[bp+var_DEB], 41h
		jnz	short loc_6BE97
		cmp	[bp+var_1D], 0
		jz	short loc_6BE75
		push	0FFFFh
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_6BE97

loc_6BE75:
		cmp	[bp+var_1F], 0
		jz	short loc_6BE97
		cmp	[bp+var_DC4], 0
		jz	short loc_6BE97
		push	[bp+var_DC2]
		mov	bx, [bp+var_DC4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_6BE97

loc_6BE97:
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_6BEA4:
		push	word ptr [bp+var_190+2]
		call	AnimLayer_IsFinished_346A0
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_6BE57
		cmp	[bp+var_1D], 0
		jz	short loc_6BEC9
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_6BEC9:
		cmp	[bp+var_1F], 0
		jz	short loc_6BEDC
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_6BEDC:
		cmp	byte ptr [bp+var_194+1], 0
		jz	short loc_6BF04
		cmp	[bp+var_198], 0
		jz	short loc_6BF04
		push	0
		mov	al, byte ptr [bp+var_194]
		push	ax
		lea	ax, word ptr [bp+var_198]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6BF04

loc_6BF04:
		mov	[bp+var_198], 0
		mov	byte ptr [bp+var_194+1], 0
		mov	[bp+var_192], 0
		cmp	byte ptr [bp+var_188+1], 0
		jz	short loc_6BF43
		cmp	[bp+var_18C], 0
		jz	short loc_6BF43
		push	0
		mov	al, byte ptr [bp+var_188]
		push	ax
		lea	ax, word ptr [bp+var_18C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6BF43

loc_6BF43:
		mov	[bp+var_18C], 0
		mov	byte ptr [bp+var_188+1], 0
		mov	[bp+var_186], 0
		push	0
		lea	ax, [bp+var_E08]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_16A+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_160+3], 0
		jz	short loc_6BF9E
		cmp	[bp+var_162], 0
		jz	short loc_6BF9E
		push	0
		mov	al, byte ptr [bp+var_160+2]
		push	ax
		lea	ax, word ptr [bp+var_162]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6BF9E

loc_6BF9E:
		mov	[bp+var_162], 0
		mov	byte ptr [bp+var_160+3], 0
		mov	[bp+var_15C], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_6BFDD
		cmp	[bp+var_158], 0
		jz	short loc_6BFDD
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6BFDD

loc_6BFDD:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		lea	ax, [bp+var_DE4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		call	Input_Flush_116D1
		cmp	byte_4F55C, 0
		jnz	short loc_6C010
		jmp	loc_6C3A0

loc_6C010:
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DC0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		mov	[bp+var_DB6], 129Fh
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_DA1], 0
		jz	short loc_6C067
		cmp	[bp+var_DA6], 0
		jz	short loc_6C067
		push	0
		mov	al, [bp+var_DA2]
		push	ax
		lea	ax, word ptr [bp+var_DA6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6C067

loc_6C067:
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		lea	ax, [bp+var_590]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_58C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_A9], 0
		jz	short loc_6C0C2
		cmp	[bp+var_AE], 0
		jz	short loc_6C0C2
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6C0C2

loc_6C0C2:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6C184
		cmp	[bp+var_7E], 0
		jz	short loc_6C184
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6C184

loc_6C184:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_6C1BC
		cmp	[bp+var_74], 0
		jz	short loc_6C1BC
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6C1BC

loc_6C1BC:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_6C1F4
		cmp	[bp+var_6A], 0
		jz	short loc_6C1F4
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6C1F4

loc_6C1F4:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_6C22C
		cmp	[bp+var_60], 0
		jz	short loc_6C22C
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6C22C

loc_6C22C:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6C264
		cmp	[bp+var_56], 0
		jz	short loc_6C264
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6C264

loc_6C264:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3DC]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_6C2B8
		cmp	[bp+var_40], 0
		jz	short loc_6C2B8
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6C2B8

loc_6C2B8:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6C2FF
		cmp	[bp+var_36], 0
		jz	short loc_6C2FF
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6C2FF

loc_6C2FF:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_6C3A0:
		mov	[bp+var_BC], 0
		mov	[bp+var_B8], 2
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		push	3
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	6
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_C6], 0
		mov	[bp+var_C2], 2
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		push	3
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	1Ah
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_D0], 0
		mov	[bp+var_CC], 2
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		push	3
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0Bh
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_DA], 0
		mov	[bp+var_D6], 2
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		push	3
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0Ch
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E4], 0
		mov	[bp+var_E0], 2
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		push	2
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	2Ah
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E7], 0
		lea	ax, word ptr [bp+var_E4]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	ds
		push	offset aVoc_5
		push	ds
		push	offset aBeep1
		push	ds
		push	offset aDataMidgamesMid1
		lea	ax, [bp+var_224]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	2
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	36h
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_15C+1], 0
		lea	ax, word ptr [bp+var_158]
		push	ax
		lea	ax, word ptr [bp+var_160+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_160], ax
		push	word ptr [bp+var_160]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166], 2
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		push	3
		lea	ax, word ptr [bp+var_16A]
		push	ax
		push	14h
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_16E], ax
		or	ax, ax
		jz	short loc_6C5CB
		push	0FFD8h
		push	0
		lea	ax, word ptr [bp+var_16A]
		push	ax
		push	word ptr [bp+var_16E]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_16E]
		mov	word ptr [bx], 13DCh
		mov	bx, word ptr [bp+var_16E]
		mov	word ptr [bx+0Ah], 13FCh
		mov	bx, word ptr [bp+var_16E]
		mov	byte ptr [bx+1Dh], 0
		mov	ax, word ptr [bp+var_16E]
		jmp	short loc_6C5CF

loc_6C5CB:
		mov	ax, word ptr [bp+var_16E]

loc_6C5CF:
		mov	word ptr [bp+var_16C], ax
		push	word ptr [bp+var_16C]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_170], ax
		push	word ptr [bp+var_170]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	28h
		push	9Fh
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingLayer_Construct_FC49
		add	sp, 8
		mov	word ptr [bp+var_174+2], ax
		mov	bx, word ptr [bp+var_174+2]
		mov	word ptr [bx+21h], 83h
		mov	bx, word ptr [bp+var_174+2]
		mov	word ptr [bx+23h], 9
		mov	bx, word ptr [bp+var_174+2]
		mov	word ptr [bx+25h], 0BEh
		mov	bx, word ptr [bp+var_174+2]
		mov	word ptr [bx+27h], 43h
		push	word ptr [bp+var_174+2]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	6Ch
		push	63h
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_174], ax
		push	word ptr [bp+var_174]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	6Bh
		push	0C3h
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_176], ax
		push	word ptr [bp+var_176]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	7
		push	16h
		push	87h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_178], ax
		push	[bp+var_178]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	10h
		push	16h
		push	0B9h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_17A], ax
		push	[bp+var_17A]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	15h
		push	26h
		push	0A0h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_17C], ax
		push	[bp+var_17C]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	16h
		push	6Dh
		push	0A9h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingImageLayer_Construct_FCAF
		add	sp, 0Ah
		mov	[bp+var_17E], ax
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+21h], 83h
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+23h], 9
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+25h], 0BEh
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+27h], 43h
		push	[bp+var_17E]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	17h
		push	6Dh
		push	0A9h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingImageLayer_Construct_FCAF
		add	sp, 0Ah
		mov	[bp+var_180], ax
		mov	bx, [bp+var_180]
		mov	word ptr [bx+21h], 83h
		mov	bx, [bp+var_180]
		mov	word ptr [bx+23h], 9
		mov	bx, [bp+var_180]
		mov	word ptr [bx+25h], 0BEh
		mov	bx, [bp+var_180]
		mov	word ptr [bx+27h], 43h
		push	[bp+var_180]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	18h
		push	28h
		push	9Fh
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_182], ax
		push	[bp+var_182]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1Ah
		push	11h
		push	8Ah
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_186+2], ax
		push	word ptr [bp+var_186+2]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1Bh
		push	3Fh
		push	8Ch
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_186], ax
		push	word ptr [bp+var_186]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1Ch
		push	3Fh
		push	0B2h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_188], ax
		push	[bp+var_188]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	word ptr [bp+var_160+2]
		mov	al, byte ptr [bp+var_15C]
		push	ax
		lea	ax, word ptr [bp+var_160+2]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_EA]
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	word ptr [bp+var_18C+2], 10h
		mov	word ptr [bp+var_18C], 7
		lea	ax, [bp+var_E8A]
		push	ss
		push	ax
		push	ds
		push	offset unk_4AC24
		mov	cx, 0A4h
		call	CRT_Fmemcpy
		mov	eax, dword_4ACC8
		mov	[bp+var_190], eax
		mov	si, 22ECh
		lea	di, [bp+var_EDC]
		push	ss
		pop	es
		mov	cx, 29h
		rep movsw
		mov	[bp+var_19A], 0
		mov	byte ptr [bp+var_198+2], 2
		mov	byte ptr [bp+var_198+3], 0
		mov	[bp+var_194], 0
		cmp	[bp+var_1D], 0
		jz	short loc_6C95E
		push	2
		lea	ax, word ptr [bp+var_19A]
		push	ax
		push	9
		lea	ax, [bp+var_38C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_19A]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_6C9A1

loc_6C95E:
		cmp	[bp+var_1F], 0
		jz	short loc_6C9A1
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	0
		lea	ax, [bp+var_56E]
		push	ax
		lea	ax, [bp+var_DC4]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		cmp	[bp+var_DC4], 0
		jz	short loc_6C9A1
		push	[bp+var_DC2]
		mov	bx, [bp+var_DC4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_6C9A1

loc_6C9A1:
		jmp	loc_6CB31

loc_6C9A4:
		test	word ptr [bp+var_DCA+1], 1
		jz	short loc_6C9F8
		inc	word ptr [bp+var_18C+2]
		mov	ax, word ptr [bp+var_18C+2]
		cmp	ax, 15h
		jnz	short loc_6C9BF
		mov	word ptr [bp+var_18C+2], 10h

loc_6C9BF:
		mov	ax, word ptr [bp+var_18C+2]
		mov	word ptr [bp+var_19C], ax
		mov	bx, [bp+var_17A]
		mov	ax, word ptr [bp+var_19C]
		mov	[bx+1Bh], ax
		dec	word ptr [bp+var_18C]
		mov	ax, word ptr [bp+var_18C]
		cmp	ax, 6
		jnz	short loc_6C9E5
		mov	word ptr [bp+var_18C], 0Fh

loc_6C9E5:
		mov	ax, word ptr [bp+var_18C]
		mov	word ptr [bp+var_1A0+2], ax
		mov	bx, [bp+var_178]
		mov	ax, word ptr [bp+var_1A0+2]
		mov	[bx+1Bh], ax

loc_6C9F8:
		mov	bx, word ptr [bp+var_DCA+1]
		shl	bx, 2
		lea	ax, [bp+var_E8A]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_190]
		mov	word ptr [bp+var_1A0], ax
		mov	bx, word ptr [bp+var_DCA+1]
		shl	bx, 2
		lea	ax, [bp+var_E88]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_190+2]
		mov	word ptr [bp+var_1A2], ax
		mov	bx, [bp+var_17E]
		mov	ax, word ptr [bp+var_1A0]
		mov	[bx+0Ch], ax
		mov	bx, [bp+var_17E]
		mov	ax, word ptr [bp+var_1A2]
		mov	[bx+0Eh], ax
		mov	ax, word_4AD22
		add	word_4AD1E, ax
		mov	ax, word_4AD24
		add	word_4AD20, ax
		cmp	word_4AD1E, 0B9h
		jge	short loc_6CA5A
		cmp	word_4AD1E, 88h
		jg	short loc_6CA65

loc_6CA5A:
		mov	dx, 0FFFFh
		mov	ax, word_4AD22
		imul	dx
		mov	word_4AD22, ax

loc_6CA65:
		cmp	word_4AD20, 3Eh
		jge	short loc_6CA73
		cmp	word_4AD20, 0Eh
		jg	short loc_6CA7E

loc_6CA73:
		mov	dx, 0FFFFh
		mov	ax, word_4AD24
		imul	dx
		mov	word_4AD24, ax

loc_6CA7E:
		mov	si, word_4AD1E
		mov	di, word_4AD20
		mov	bx, [bp+var_180]
		mov	[bx+0Ch], si
		mov	bx, [bp+var_180]
		mov	[bx+0Eh], di
		mov	bx, word ptr [bp+var_DCA+1]
		shl	bx, 1
		lea	ax, [bp+var_EDC]
		add	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_1A4], ax
		mov	bx, word ptr [bp+var_174+2]
		mov	ax, word ptr [bp+var_1A4]
		mov	[bx+1Bh], ax
		mov	bx, word ptr [bp+var_DCA+1]
		shl	bx, 1
		lea	ax, [bp+var_EDC]
		add	bx, ax
		cmp	word ptr [bx], 3
		jle	short loc_6CACD
		mov	bx, word ptr [bp+var_174]
		mov	word ptr [bx+1Bh], 1
		jmp	short loc_6CAF2

loc_6CACD:
		mov	bx, word ptr [bp+var_DCA+1]
		shl	bx, 1
		lea	ax, [bp+var_EDC]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_6CAE9
		mov	bx, word ptr [bp+var_174]
		mov	word ptr [bx+1Bh], 2
		jmp	short loc_6CAF2

loc_6CAE9:
		mov	bx, word ptr [bp+var_174]
		mov	word ptr [bx+1Bh], 0

loc_6CAF2:
		mov	ax, word_4AD26
		add	word_4AD28, ax
		cmp	word_4AD28, 5
		jge	short loc_6CB07
		cmp	word_4AD28, 3
		jg	short loc_6CB12

loc_6CB07:
		mov	dx, 0FFFFh
		mov	ax, word_4AD26
		imul	dx
		mov	word_4AD26, ax

loc_6CB12:
		mov	ax, word_4AD28
		mov	word ptr [bp+var_1A6], ax
		mov	bx, word ptr [bp+var_176]
		mov	ax, word ptr [bp+var_1A6]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_6CB31:
		cmp	word ptr [bp+var_DCA+1], 28h
		jnb	short loc_6CB3F
		cmp	byte ptr [bp+var_DCA+3], 0
		jz	short loc_6CB44

loc_6CB3F:
		mov	ax, 1
		jmp	short loc_6CB46

loc_6CB44:
		xor	ax, ax

loc_6CB46:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6CB4F
		jmp	loc_6C9A4

loc_6CB4F:
		cmp	[bp+var_1D], 0
		jz	short loc_6CB62
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_6CB62:
		cmp	[bp+var_1F], 0
		jz	short loc_6CB75
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_6CB75:
		cmp	byte ptr [bp+var_198+3], 0
		jz	short loc_6CB9D
		cmp	[bp+var_19A], 0
		jz	short loc_6CB9D
		push	0
		mov	al, byte ptr [bp+var_198+2]
		push	ax
		lea	ax, word ptr [bp+var_19A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CB9D

loc_6CB9D:
		mov	[bp+var_19A], 0
		mov	byte ptr [bp+var_198+3], 0
		mov	[bp+var_194], 0
		cmp	byte ptr [bp+var_166+1], 0
		jz	short loc_6CBDC
		cmp	[bp+var_16A], 0
		jz	short loc_6CBDC
		push	0
		mov	al, byte ptr [bp+var_166]
		push	ax
		lea	ax, word ptr [bp+var_16A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CBDC

loc_6CBDC:
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		lea	ax, word ptr [bp+var_160+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_6CC28
		cmp	[bp+var_158], 0
		jz	short loc_6CC28
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CC28

loc_6CC28:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	0
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_6CC58
		jmp	loc_6D130

loc_6CC58:
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_DF], 0
		jz	short loc_6CC8D
		cmp	[bp+var_E4], 0
		jz	short loc_6CC8D
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CC8D

loc_6CC8D:
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_6CCCC
		cmp	[bp+var_DA], 0
		jz	short loc_6CCCC
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CCCC

loc_6CCCC:
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_6CD0B
		cmp	[bp+var_D0], 0
		jz	short loc_6CD0B
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CD0B

loc_6CD0B:
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_6CD4A
		cmp	[bp+var_C6], 0
		jz	short loc_6CD4A
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CD4A

loc_6CD4A:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_6CD89
		cmp	[bp+var_BC], 0
		jz	short loc_6CD89
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CD89

loc_6CD89:
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DC0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		mov	[bp+var_DB6], 129Fh
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_DA1], 0
		jz	short loc_6CDF7
		cmp	[bp+var_DA6], 0
		jz	short loc_6CDF7
		push	0
		mov	al, [bp+var_DA2]
		push	ax
		lea	ax, word ptr [bp+var_DA6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CDF7

loc_6CDF7:
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		lea	ax, [bp+var_590]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_58C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_A9], 0
		jz	short loc_6CE52
		cmp	[bp+var_AE], 0
		jz	short loc_6CE52
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CE52

loc_6CE52:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6CF14
		cmp	[bp+var_7E], 0
		jz	short loc_6CF14
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CF14

loc_6CF14:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_6CF4C
		cmp	[bp+var_74], 0
		jz	short loc_6CF4C
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CF4C

loc_6CF4C:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_6CF84
		cmp	[bp+var_6A], 0
		jz	short loc_6CF84
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CF84

loc_6CF84:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_6CFBC
		cmp	[bp+var_60], 0
		jz	short loc_6CFBC
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CFBC

loc_6CFBC:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6CFF4
		cmp	[bp+var_56], 0
		jz	short loc_6CFF4
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6CFF4

loc_6CFF4:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3DC]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_6D048
		cmp	[bp+var_40], 0
		jz	short loc_6D048
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D048

loc_6D048:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6D08F
		cmp	[bp+var_36], 0
		jz	short loc_6D08F
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D08F

loc_6D08F:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_6D130:
		mov	[bp+var_F4], 0
		mov	[bp+var_F0], 2
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		push	3
		lea	ax, word ptr [bp+var_F4]
		push	ax
		push	1
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_FE], 0
		mov	[bp+var_FA], 2
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		push	2
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	2Ch
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_101], 0
		lea	ax, word ptr [bp+var_FE]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_10E], 0
		mov	[bp+var_10A], 2
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		push	2
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	26h
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_111], 0
		lea	ax, word ptr [bp+var_10E]
		push	ax
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	[bp+var_104]
		mov	al, [bp+var_102]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_114]
		mov	al, [bp+var_112]
		push	ax
		lea	ax, [bp+var_114]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_152+2], ax
		push	word ptr [bp+var_152+2]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	2
		push	0FFD8h
		push	0
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	si, ax
		push	2
		push	[bp+var_10]
		push	[bp+var_E]
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_152], ax
		push	3
		push	[bp+var_14]
		push	[bp+var_12]
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_154], ax
		push	word ptr [bp+var_152]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_154]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	18h
		push	0
		lea	ax, word ptr [bp+var_F4]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_158+2], ax
		push	word ptr [bp+var_158+2]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_6D335

loc_6D328:
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_6D335:
		cmp	word ptr [bp+var_DCA+1], 14h
		jnb	short loc_6D343
		cmp	byte ptr [bp+var_DCA+3], 0
		jz	short loc_6D348

loc_6D343:
		mov	ax, 1
		jmp	short loc_6D34A

loc_6D348:
		xor	ax, ax

loc_6D34A:
		mov	ah, 0
		or	ax, ax
		jz	short loc_6D328
		push	0
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_6D369
		jmp	loc_6D918

loc_6D369:
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_109], 0
		jz	short loc_6D39E
		cmp	[bp+var_10E], 0
		jz	short loc_6D39E
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D39E

loc_6D39E:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_F9], 0
		jz	short loc_6D3EA
		cmp	[bp+var_FE], 0
		jz	short loc_6D3EA
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D3EA

loc_6D3EA:
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		cmp	[bp+var_EF], 0
		jz	short loc_6D429
		cmp	[bp+var_F4], 0
		jz	short loc_6D429
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, word ptr [bp+var_F4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D429

loc_6D429:
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_DF], 0
		jz	short loc_6D475
		cmp	[bp+var_E4], 0
		jz	short loc_6D475
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D475

loc_6D475:
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_6D4B4
		cmp	[bp+var_DA], 0
		jz	short loc_6D4B4
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D4B4

loc_6D4B4:
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_6D4F3
		cmp	[bp+var_D0], 0
		jz	short loc_6D4F3
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D4F3

loc_6D4F3:
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_6D532
		cmp	[bp+var_C6], 0
		jz	short loc_6D532
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D532

loc_6D532:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_6D571
		cmp	[bp+var_BC], 0
		jz	short loc_6D571
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D571

loc_6D571:
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DC0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		mov	[bp+var_DB6], 129Fh
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_DA1], 0
		jz	short loc_6D5DF
		cmp	[bp+var_DA6], 0
		jz	short loc_6D5DF
		push	0
		mov	al, [bp+var_DA2]
		push	ax
		lea	ax, word ptr [bp+var_DA6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D5DF

loc_6D5DF:
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		lea	ax, [bp+var_590]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_58C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_A9], 0
		jz	short loc_6D63A
		cmp	[bp+var_AE], 0
		jz	short loc_6D63A
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D63A

loc_6D63A:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6D6FC
		cmp	[bp+var_7E], 0
		jz	short loc_6D6FC
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D6FC

loc_6D6FC:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_6D734
		cmp	[bp+var_74], 0
		jz	short loc_6D734
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D734

loc_6D734:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_6D76C
		cmp	[bp+var_6A], 0
		jz	short loc_6D76C
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D76C

loc_6D76C:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_6D7A4
		cmp	[bp+var_60], 0
		jz	short loc_6D7A4
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D7A4

loc_6D7A4:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6D7DC
		cmp	[bp+var_56], 0
		jz	short loc_6D7DC
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D7DC

loc_6D7DC:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3DC]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_6D830
		cmp	[bp+var_40], 0
		jz	short loc_6D830
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D830

loc_6D830:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6D877
		cmp	[bp+var_36], 0
		jz	short loc_6D877
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6D877

loc_6D877:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_6D918:
		mov	[bp+var_11E], 0
		mov	[bp+var_11A], 2
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		push	2
		lea	ax, word ptr [bp+var_11E]
		push	ax
		push	38h
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_121], 0
		lea	ax, word ptr [bp+var_11E]
		push	ax
		lea	ax, [bp+var_124]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		cmp	[bp+var_1D], 0
		jz	short loc_6D9D4
		push	2
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	8
		lea	ax, [bp+var_38C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_158]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_6DA17

loc_6D9D4:
		cmp	[bp+var_1F], 0
		jz	short loc_6DA17
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	0
		lea	ax, [bp+var_578]
		push	ax
		lea	ax, [bp+var_DC4]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		cmp	[bp+var_DC4], 0
		jz	short loc_6DA17
		push	[bp+var_DC2]
		mov	bx, [bp+var_DC4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_6DA17

loc_6DA17:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	[bp+var_124]
		mov	al, [bp+var_122]
		push	ax
		lea	ax, [bp+var_124]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_8A]
		mov	al, [bp+var_88]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	si, ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_15A], ax
		push	word ptr [bp+var_15A]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0FFD8h
		push	0
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_15C], ax
		push	word ptr [bp+var_15C]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1
		push	5Ah
		push	0
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_160+2], ax
		push	word ptr [bp+var_160+2]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	2
		push	46h
		push	0
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_160], ax
		push	word ptr [bp+var_160]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166], 2
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		push	3
		lea	ax, word ptr [bp+var_16A]
		push	ax
		push	16h
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_16A]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	di, ax
		push	di
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_6DBC5

loc_6DB9D:
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	ax, word ptr [bp+var_DCA+1]
		cmp	ax, 1
		jz	short loc_6DBBF
		cmp	ax, 0Ch
		jz	short loc_6DBC1
		cmp	ax, 12h
		jz	short loc_6DBC3
		jmp	short loc_6DBC5

loc_6DBBF:
		jmp	short loc_6DBC5

loc_6DBC1:
		jmp	short loc_6DBC5

loc_6DBC3:
		jmp	short loc_6DBC5

loc_6DBC5:
		push	di
		call	AnimLayer_IsFinished_346A0
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_6DB9D
		cmp	[bp+var_1D], 0
		jz	short loc_6DBE7
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_6DBE7:
		cmp	[bp+var_1F], 0
		jz	short loc_6DBFA
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_6DBFA:
		cmp	byte ptr [bp+var_166+1], 0
		jz	short loc_6DC22
		cmp	[bp+var_16A], 0
		jz	short loc_6DC22
		push	0
		mov	al, byte ptr [bp+var_166]
		push	ax
		lea	ax, word ptr [bp+var_16A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DC22

loc_6DC22:
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_6DC61
		cmp	[bp+var_158], 0
		jz	short loc_6DC61
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DC61

loc_6DC61:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	0
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_6DC91
		jmp	loc_6E28C

loc_6DC91:
		lea	ax, [bp+var_124]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_119], 0
		jz	short loc_6DCC6
		cmp	[bp+var_11E], 0
		jz	short loc_6DCC6
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, word ptr [bp+var_11E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DCC6

loc_6DCC6:
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_109], 0
		jz	short loc_6DD12
		cmp	[bp+var_10E], 0
		jz	short loc_6DD12
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DD12

loc_6DD12:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_F9], 0
		jz	short loc_6DD5E
		cmp	[bp+var_FE], 0
		jz	short loc_6DD5E
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DD5E

loc_6DD5E:
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		cmp	[bp+var_EF], 0
		jz	short loc_6DD9D
		cmp	[bp+var_F4], 0
		jz	short loc_6DD9D
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, word ptr [bp+var_F4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DD9D

loc_6DD9D:
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_DF], 0
		jz	short loc_6DDE9
		cmp	[bp+var_E4], 0
		jz	short loc_6DDE9
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DDE9

loc_6DDE9:
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_6DE28
		cmp	[bp+var_DA], 0
		jz	short loc_6DE28
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DE28

loc_6DE28:
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_6DE67
		cmp	[bp+var_D0], 0
		jz	short loc_6DE67
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DE67

loc_6DE67:
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_6DEA6
		cmp	[bp+var_C6], 0
		jz	short loc_6DEA6
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DEA6

loc_6DEA6:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_6DEE5
		cmp	[bp+var_BC], 0
		jz	short loc_6DEE5
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DEE5

loc_6DEE5:
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DC0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		mov	[bp+var_DB6], 129Fh
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_DA1], 0
		jz	short loc_6DF53
		cmp	[bp+var_DA6], 0
		jz	short loc_6DF53
		push	0
		mov	al, [bp+var_DA2]
		push	ax
		lea	ax, word ptr [bp+var_DA6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DF53

loc_6DF53:
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		lea	ax, [bp+var_590]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_58C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_A9], 0
		jz	short loc_6DFAE
		cmp	[bp+var_AE], 0
		jz	short loc_6DFAE
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6DFAE

loc_6DFAE:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6E070
		cmp	[bp+var_7E], 0
		jz	short loc_6E070
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6E070

loc_6E070:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_6E0A8
		cmp	[bp+var_74], 0
		jz	short loc_6E0A8
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6E0A8

loc_6E0A8:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_6E0E0
		cmp	[bp+var_6A], 0
		jz	short loc_6E0E0
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6E0E0

loc_6E0E0:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_6E118
		cmp	[bp+var_60], 0
		jz	short loc_6E118
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6E118

loc_6E118:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6E150
		cmp	[bp+var_56], 0
		jz	short loc_6E150
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6E150

loc_6E150:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3DC]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_6E1A4
		cmp	[bp+var_40], 0
		jz	short loc_6E1A4
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6E1A4

loc_6E1A4:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6E1EB
		cmp	[bp+var_36], 0
		jz	short loc_6E1EB
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6E1EB

loc_6E1EB:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_6E28C:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		cmp	[bp+var_1D], 0
		jz	short loc_6E2D8
		push	2
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	9
		lea	ax, [bp+var_38C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_158]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		jmp	short loc_6E2FF

loc_6E2D8:
		cmp	[bp+var_1F], 0
		jz	short loc_6E2FF
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	0
		lea	ax, [bp+var_56E]
		push	ax
		lea	ax, [bp+var_DC4]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_6E2FF:
		mov	[bp+var_162], 0
		mov	byte ptr [bp+var_160+2], 2
		mov	byte ptr [bp+var_160+3], 0
		mov	[bp+var_15C], 0
		push	2
		lea	ax, word ptr [bp+var_162]
		push	ax
		push	39h
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_166+1], 0
		lea	ax, word ptr [bp+var_162]
		push	ax
		lea	ax, word ptr [bp+var_16A+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	word ptr [bp+var_16A+2]
		mov	al, byte ptr [bp+var_166]
		push	ax
		lea	ax, word ptr [bp+var_16A+2]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_EA]
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_16A], ax
		push	word ptr [bp+var_16A]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_174], 0
		mov	byte ptr [bp+var_170], 2
		mov	byte ptr [bp+var_170+1], 0
		mov	[bp+var_16E], 0
		push	3
		lea	ax, word ptr [bp+var_174]
		push	ax
		push	17h
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_178], ax
		or	ax, ax
		jz	short loc_6E456
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_174]
		push	ax
		push	[bp+var_178]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, [bp+var_178]
		mov	word ptr [bx], 13DCh
		mov	bx, [bp+var_178]
		mov	word ptr [bx+0Ah], 13FCh
		mov	bx, [bp+var_178]
		mov	byte ptr [bx+1Dh], 0
		mov	ax, [bp+var_178]
		jmp	short loc_6E45A

loc_6E456:
		mov	ax, [bp+var_178]

loc_6E45A:
		mov	word ptr [bp+var_176], ax
		push	word ptr [bp+var_176]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_17A], ax
		push	[bp+var_17A]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	28h
		push	9Fh
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingLayer_Construct_FC49
		add	sp, 8
		mov	[bp+var_17C], ax
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+21h], 83h
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+23h], 9
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+25h], 0BEh
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+27h], 43h
		push	[bp+var_17C]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	6Ch
		push	63h
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_17E], ax
		push	[bp+var_17E]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	6Bh
		push	0C3h
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_180], ax
		push	[bp+var_180]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	7
		push	16h
		push	87h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_182], ax
		push	[bp+var_182]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	10h
		push	16h
		push	0B9h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_186+2], ax
		push	word ptr [bp+var_186+2]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	15h
		push	26h
		push	0A0h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_186], ax
		push	word ptr [bp+var_186]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	16h
		push	6Dh
		push	0A9h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingImageLayer_Construct_FCAF
		add	sp, 0Ah
		mov	[bp+var_188], ax
		mov	bx, [bp+var_188]
		mov	word ptr [bx+21h], 83h
		mov	bx, [bp+var_188]
		mov	word ptr [bx+23h], 9
		mov	bx, [bp+var_188]
		mov	word ptr [bx+25h], 0BEh
		mov	bx, [bp+var_188]
		mov	word ptr [bx+27h], 43h
		push	[bp+var_188]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	17h
		push	6Dh
		push	0A9h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingImageLayer_Construct_FCAF
		add	sp, 0Ah
		mov	word ptr [bp+var_18C+2], ax
		mov	bx, word ptr [bp+var_18C+2]
		mov	word ptr [bx+21h], 83h
		mov	bx, word ptr [bp+var_18C+2]
		mov	word ptr [bx+23h], 9
		mov	bx, word ptr [bp+var_18C+2]
		mov	word ptr [bx+25h], 0BEh
		mov	bx, word ptr [bp+var_18C+2]
		mov	word ptr [bx+27h], 43h
		push	word ptr [bp+var_18C+2]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	18h
		push	28h
		push	9Fh
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_18C], ax
		push	word ptr [bp+var_18C]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1Ah
		push	11h
		push	8Ah
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_190+2], ax
		push	word ptr [bp+var_190+2]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1Bh
		push	3Fh
		push	8Ch
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_190], ax
		push	word ptr [bp+var_190]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1Ch
		push	3Fh
		push	0B2h
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_192], ax
		push	word ptr [bp+var_192]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	word ptr [bp+var_194], 10h
		mov	word ptr [bp+var_198+2], 7
		lea	ax, [bp+var_E8A]
		push	ss
		push	ax
		push	ds
		push	offset unk_4AD2A
		mov	cx, 0A4h
		call	CRT_Fmemcpy
		mov	eax, dword_4ADCE
		mov	[bp+var_19A], eax
		mov	si, 23F2h
		lea	di, [bp+var_EDC]
		push	ss
		pop	es
		mov	cx, 29h
		rep movsw
		cmp	[bp+var_1D], 0
		jz	short loc_6E74C
		push	0FFFFh
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4

loc_6E74C:
		cmp	[bp+var_1F], 0
		jz	short loc_6E76E
		cmp	[bp+var_DC4], 0
		jz	short loc_6E76E
		push	[bp+var_DC2]
		mov	bx, [bp+var_DC4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_6E76E

loc_6E76E:
		jmp	loc_6E8F6

loc_6E771:
		dec	word ptr [bp+var_194]
		mov	ax, word ptr [bp+var_194]
		cmp	ax, 0Fh
		jnz	short loc_6E784
		mov	word ptr [bp+var_194], 14h

loc_6E784:
		mov	ax, word ptr [bp+var_194]
		mov	word ptr [bp+var_19C], ax
		mov	bx, word ptr [bp+var_186+2]
		mov	ax, word ptr [bp+var_19C]
		mov	[bx+1Bh], ax
		inc	word ptr [bp+var_198+2]
		mov	ax, word ptr [bp+var_198+2]
		cmp	ax, 10h
		jnz	short loc_6E7AA
		mov	word ptr [bp+var_198+2], 7

loc_6E7AA:
		mov	ax, word ptr [bp+var_198+2]
		mov	word ptr [bp+var_1A0+2], ax
		mov	bx, [bp+var_182]
		mov	ax, word ptr [bp+var_1A0+2]
		mov	[bx+1Bh], ax
		mov	bx, word ptr [bp+var_DCA+1]
		shl	bx, 2
		lea	ax, [bp+var_E8A]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_19A]
		mov	word ptr [bp+var_1A0], ax
		mov	bx, word ptr [bp+var_DCA+1]
		shl	bx, 2
		lea	ax, [bp+var_E88]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_198]
		mov	word ptr [bp+var_1A2], ax
		mov	bx, [bp+var_188]
		mov	ax, word ptr [bp+var_1A0]
		mov	[bx+0Ch], ax
		mov	bx, [bp+var_188]
		mov	ax, word ptr [bp+var_1A2]
		mov	[bx+0Eh], ax
		mov	ax, word_4AE28
		add	word_4AE24, ax
		mov	ax, word_4AE2A
		add	word_4AE26, ax
		cmp	word_4AE24, 0B9h
		jge	short loc_6E81F
		cmp	word_4AE24, 88h
		jg	short loc_6E82A

loc_6E81F:
		mov	dx, 0FFFFh
		mov	ax, word_4AE28
		imul	dx
		mov	word_4AE28, ax

loc_6E82A:
		cmp	word_4AE26, 3Eh
		jge	short loc_6E838
		cmp	word_4AE26, 0Eh
		jg	short loc_6E843

loc_6E838:
		mov	dx, 0FFFFh
		mov	ax, word_4AE2A
		imul	dx
		mov	word_4AE2A, ax

loc_6E843:
		mov	si, word_4AE24
		mov	di, word_4AE26
		mov	bx, word ptr [bp+var_18C+2]
		mov	[bx+0Ch], si
		mov	bx, word ptr [bp+var_18C+2]
		mov	[bx+0Eh], di
		mov	bx, word ptr [bp+var_DCA+1]
		shl	bx, 1
		lea	ax, [bp+var_EDC]
		add	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_1A4], ax
		mov	bx, [bp+var_17C]
		mov	ax, word ptr [bp+var_1A4]
		mov	[bx+1Bh], ax
		mov	bx, word ptr [bp+var_DCA+1]
		shl	bx, 1
		lea	ax, [bp+var_EDC]
		add	bx, ax
		cmp	word ptr [bx], 3
		jle	short loc_6E892
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Bh], 1
		jmp	short loc_6E8B7

loc_6E892:
		mov	bx, word ptr [bp+var_DCA+1]
		shl	bx, 1
		lea	ax, [bp+var_EDC]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_6E8AE
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Bh], 2
		jmp	short loc_6E8B7

loc_6E8AE:
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Bh], 0

loc_6E8B7:
		mov	ax, word_4AE2C
		add	word_4AE2E, ax
		cmp	word_4AE2E, 5
		jge	short loc_6E8CC
		cmp	word_4AE2E, 3
		jg	short loc_6E8D7

loc_6E8CC:
		mov	dx, 0FFFFh
		mov	ax, word_4AE2C
		imul	dx
		mov	word_4AE2C, ax

loc_6E8D7:
		mov	ax, word_4AE2E
		mov	word ptr [bp+var_1A6], ax
		mov	bx, [bp+var_180]
		mov	ax, word ptr [bp+var_1A6]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_6E8F6:
		cmp	word ptr [bp+var_DCA+1], 28h
		jnb	short loc_6E904
		cmp	byte ptr [bp+var_DCA+3], 0
		jz	short loc_6E909

loc_6E904:
		mov	ax, 1
		jmp	short loc_6E90B

loc_6E909:
		xor	ax, ax

loc_6E90B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E914
		jmp	loc_6E771

loc_6E914:
		cmp	[bp+var_1D], 0
		jz	short loc_6E927
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_6E927:
		cmp	[bp+var_1F], 0
		jz	short loc_6E93A
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_6E93A:
		cmp	byte ptr [bp+var_170+1], 0
		jz	short loc_6E962
		cmp	[bp+var_174], 0
		jz	short loc_6E962
		push	0
		mov	al, byte ptr [bp+var_170]
		push	ax
		lea	ax, word ptr [bp+var_174]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6E962

loc_6E962:
		mov	[bp+var_174], 0
		mov	byte ptr [bp+var_170+1], 0
		mov	[bp+var_16E], 0
		push	0
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_16A+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_160+3], 0
		jz	short loc_6E9BD
		cmp	[bp+var_162], 0
		jz	short loc_6E9BD
		push	0
		mov	al, byte ptr [bp+var_160+2]
		push	ax
		lea	ax, word ptr [bp+var_162]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6E9BD

loc_6E9BD:
		mov	[bp+var_162], 0
		mov	byte ptr [bp+var_160+3], 0
		mov	[bp+var_15C], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_6E9FC
		cmp	[bp+var_158], 0
		jz	short loc_6E9FC
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6E9FC

loc_6E9FC:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		cmp	byte_4F55C, 0
		jnz	short loc_6EA1D
		jmp	loc_6F018

loc_6EA1D:
		lea	ax, [bp+var_124]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_119], 0
		jz	short loc_6EA52
		cmp	[bp+var_11E], 0
		jz	short loc_6EA52
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, word ptr [bp+var_11E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EA52

loc_6EA52:
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_109], 0
		jz	short loc_6EA9E
		cmp	[bp+var_10E], 0
		jz	short loc_6EA9E
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EA9E

loc_6EA9E:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_F9], 0
		jz	short loc_6EAEA
		cmp	[bp+var_FE], 0
		jz	short loc_6EAEA
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EAEA

loc_6EAEA:
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		cmp	[bp+var_EF], 0
		jz	short loc_6EB29
		cmp	[bp+var_F4], 0
		jz	short loc_6EB29
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, word ptr [bp+var_F4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EB29

loc_6EB29:
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_DF], 0
		jz	short loc_6EB75
		cmp	[bp+var_E4], 0
		jz	short loc_6EB75
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EB75

loc_6EB75:
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_6EBB4
		cmp	[bp+var_DA], 0
		jz	short loc_6EBB4
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EBB4

loc_6EBB4:
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_6EBF3
		cmp	[bp+var_D0], 0
		jz	short loc_6EBF3
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EBF3

loc_6EBF3:
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_6EC32
		cmp	[bp+var_C6], 0
		jz	short loc_6EC32
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EC32

loc_6EC32:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_6EC71
		cmp	[bp+var_BC], 0
		jz	short loc_6EC71
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EC71

loc_6EC71:
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DC0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		mov	[bp+var_DB6], 129Fh
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_DA1], 0
		jz	short loc_6ECDF
		cmp	[bp+var_DA6], 0
		jz	short loc_6ECDF
		push	0
		mov	al, [bp+var_DA2]
		push	ax
		lea	ax, word ptr [bp+var_DA6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6ECDF

loc_6ECDF:
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		lea	ax, [bp+var_590]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_58C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_A9], 0
		jz	short loc_6ED3A
		cmp	[bp+var_AE], 0
		jz	short loc_6ED3A
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6ED3A

loc_6ED3A:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6EDFC
		cmp	[bp+var_7E], 0
		jz	short loc_6EDFC
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EDFC

loc_6EDFC:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_6EE34
		cmp	[bp+var_74], 0
		jz	short loc_6EE34
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EE34

loc_6EE34:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_6EE6C
		cmp	[bp+var_6A], 0
		jz	short loc_6EE6C
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EE6C

loc_6EE6C:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_6EEA4
		cmp	[bp+var_60], 0
		jz	short loc_6EEA4
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EEA4

loc_6EEA4:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6EEDC
		cmp	[bp+var_56], 0
		jz	short loc_6EEDC
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EEDC

loc_6EEDC:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3DC]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_6EF30
		cmp	[bp+var_40], 0
		jz	short loc_6EF30
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EF30

loc_6EF30:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6EF77
		cmp	[bp+var_36], 0
		jz	short loc_6EF77
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6EF77

loc_6EF77:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_6F018:
		mov	[bp+var_12E], 0
		mov	[bp+var_12A], 2
		mov	[bp+var_129], 0
		mov	[bp+var_128], 0
		push	3
		lea	ax, word ptr [bp+var_12E]
		push	ax
		push	0
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_138], 0
		mov	[bp+var_134], 2
		mov	[bp+var_133], 0
		mov	[bp+var_132], 0
		push	2
		lea	ax, word ptr [bp+var_138]
		push	ax
		push	2Dh
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_13B], 0
		lea	ax, word ptr [bp+var_138]
		push	ax
		lea	ax, [bp+var_13E]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_148], 0
		mov	[bp+var_144], 2
		mov	[bp+var_143], 0
		mov	[bp+var_142], 0
		push	2
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	27h
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_14B], 0
		lea	ax, word ptr [bp+var_148]
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, [bp+var_3C4]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_4C]
		mov	[bp+var_EEC], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_EEA], ax
		mov	ax, [bp+var_48]
		mov	[bp+var_EE8], ax
		mov	ax, [bp+var_46]
		mov	[bp+var_EE6], ax
		lea	ax, [bp+var_E08]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	[bp+var_13E]
		mov	al, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_13E]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_14E]
		mov	al, [bp+var_14C]
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_152+2], ax
		push	word ptr [bp+var_152+2]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	0FFD8h
		push	1
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	word ptr [bp+var_152], ax
		push	0
		push	[bp+var_18]
		push	[bp+var_16]
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_154], ax
		push	1
		push	[bp+var_1C]
		push	[bp+var_1A]
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_158+2], ax
		push	[bp+var_154]
		push	word ptr [bp+var_152]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_158+2]
		push	word ptr [bp+var_152]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_152]
		lea	ax, [bp+var_DE6]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0Eh
		push	0
		lea	ax, word ptr [bp+var_12E]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	si, ax
		push	si
		push	word ptr [bp+var_152]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+var_1D], 0
		jnz	short loc_6F255
		jmp	loc_6F330

loc_6F255:
		mov	[bp+var_160], 0
		mov	byte ptr [bp+var_15C], 2
		mov	byte ptr [bp+var_15C+1], 0
		mov	[bp+var_15A], 0
		push	3
		lea	ax, word ptr [bp+var_160]
		push	ax
		push	0
		lea	ax, [bp+var_38C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_160]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_DB6]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_6F2C9

loc_6F2AA:
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	ax, word ptr [bp+var_DCA+1]
		and	ax, 1
		mov	word ptr [bp+var_162], ax
		mov	ax, word ptr [bp+var_162]
		mov	[si+1Bh], ax

loc_6F2C9:
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_IsDone_C808
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_6F2AA
		cmp	[bp+var_1D], 0
		jz	short loc_6F2EF
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_6F2EF:
		cmp	byte ptr [bp+var_15C+1], 0
		jz	short loc_6F317
		cmp	[bp+var_160], 0
		jz	short loc_6F317
		push	0
		mov	al, byte ptr [bp+var_15C]
		push	ax
		lea	ax, word ptr [bp+var_160]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F317

loc_6F317:
		mov	[bp+var_160], 0
		mov	byte ptr [bp+var_15C+1], 0
		mov	[bp+var_15A], 0
		jmp	short loc_6F385

loc_6F330:
		push	4
		lea	ax, [bp+var_3C4]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		push	[bp+var_2]
		lea	ax, [bp+var_E08]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_6F36A

loc_6F351:
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	ax, word ptr [bp+var_DCA+1]
		and	ax, 1
		mov	di, ax
		mov	[si+1Bh], di

loc_6F36A:
		cmp	word ptr [bp+var_DCA+1], 1Eh
		jnb	short loc_6F378
		cmp	byte ptr [bp+var_DCA+3], 0
		jz	short loc_6F37D

loc_6F378:
		mov	ax, 1
		jmp	short loc_6F37F

loc_6F37D:
		xor	ax, ax

loc_6F37F:
		mov	ah, 0
		or	ax, ax
		jz	short loc_6F351

loc_6F385:
		mov	word ptr [si+1Bh], 0
		mov	word ptr [bp+var_DCA+1], 0
		jmp	short loc_6F39F

loc_6F392:
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_6F39F:
		cmp	word ptr [bp+var_DCA+1], 5
		jnb	short loc_6F3AD
		cmp	byte ptr [bp+var_DCA+3], 0
		jz	short loc_6F3B2

loc_6F3AD:
		mov	ax, 1
		jmp	short loc_6F3B4

loc_6F3B2:
		xor	ax, ax

loc_6F3B4:
		mov	ah, 0
		or	ax, ax
		jz	short loc_6F392
		lea	ax, word ptr [bp+var_E07+1]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_DE6]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_6F3E0
		jmp	loc_6FAB2

loc_6F3E0:
		lea	ax, [bp+var_14E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_143], 0
		jz	short loc_6F415
		cmp	[bp+var_148], 0
		jz	short loc_6F415
		push	0
		mov	al, [bp+var_144]
		push	ax
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F415

loc_6F415:
		mov	[bp+var_148], 0
		mov	[bp+var_143], 0
		mov	[bp+var_142], 0
		lea	ax, [bp+var_13E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_133], 0
		jz	short loc_6F461
		cmp	[bp+var_138], 0
		jz	short loc_6F461
		push	0
		mov	al, [bp+var_134]
		push	ax
		lea	ax, word ptr [bp+var_138]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F461

loc_6F461:
		mov	[bp+var_138], 0
		mov	[bp+var_133], 0
		mov	[bp+var_132], 0
		cmp	[bp+var_129], 0
		jz	short loc_6F4A0
		cmp	[bp+var_12E], 0
		jz	short loc_6F4A0
		push	0
		mov	al, [bp+var_12A]
		push	ax
		lea	ax, word ptr [bp+var_12E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F4A0

loc_6F4A0:
		mov	[bp+var_12E], 0
		mov	[bp+var_129], 0
		mov	[bp+var_128], 0
		lea	ax, [bp+var_124]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_119], 0
		jz	short loc_6F4EC
		cmp	[bp+var_11E], 0
		jz	short loc_6F4EC
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, word ptr [bp+var_11E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F4EC

loc_6F4EC:
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_109], 0
		jz	short loc_6F538
		cmp	[bp+var_10E], 0
		jz	short loc_6F538
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F538

loc_6F538:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_F9], 0
		jz	short loc_6F584
		cmp	[bp+var_FE], 0
		jz	short loc_6F584
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F584

loc_6F584:
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		cmp	[bp+var_EF], 0
		jz	short loc_6F5C3
		cmp	[bp+var_F4], 0
		jz	short loc_6F5C3
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, word ptr [bp+var_F4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F5C3

loc_6F5C3:
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_DF], 0
		jz	short loc_6F60F
		cmp	[bp+var_E4], 0
		jz	short loc_6F60F
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F60F

loc_6F60F:
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_6F64E
		cmp	[bp+var_DA], 0
		jz	short loc_6F64E
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F64E

loc_6F64E:
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_6F68D
		cmp	[bp+var_D0], 0
		jz	short loc_6F68D
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F68D

loc_6F68D:
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_6F6CC
		cmp	[bp+var_C6], 0
		jz	short loc_6F6CC
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F6CC

loc_6F6CC:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_6F70B
		cmp	[bp+var_BC], 0
		jz	short loc_6F70B
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F70B

loc_6F70B:
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DC0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		mov	[bp+var_DB6], 129Fh
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_DA1], 0
		jz	short loc_6F779
		cmp	[bp+var_DA6], 0
		jz	short loc_6F779
		push	0
		mov	al, [bp+var_DA2]
		push	ax
		lea	ax, word ptr [bp+var_DA6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F779

loc_6F779:
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		lea	ax, [bp+var_590]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_58C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_A9], 0
		jz	short loc_6F7D4
		cmp	[bp+var_AE], 0
		jz	short loc_6F7D4
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F7D4

loc_6F7D4:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6F896
		cmp	[bp+var_7E], 0
		jz	short loc_6F896
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F896

loc_6F896:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_6F8CE
		cmp	[bp+var_74], 0
		jz	short loc_6F8CE
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F8CE

loc_6F8CE:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_6F906
		cmp	[bp+var_6A], 0
		jz	short loc_6F906
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F906

loc_6F906:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_6F93E
		cmp	[bp+var_60], 0
		jz	short loc_6F93E
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F93E

loc_6F93E:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6F976
		cmp	[bp+var_56], 0
		jz	short loc_6F976
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F976

loc_6F976:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3DC]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_6F9CA
		cmp	[bp+var_40], 0
		jz	short loc_6F9CA
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6F9CA

loc_6F9CA:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6FA11
		cmp	[bp+var_36], 0
		jz	short loc_6FA11
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FA11

loc_6FA11:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_6FAB2:
		lea	ax, [bp+var_590]
		push	ax
		lea	ax, [bp+var_DC4]
		push	ax
		mov	al, [bp+var_1F]
		push	ax
		lea	ax, [bp+var_582]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		lea	ax, [bp+var_38C]
		push	ax
		lea	ax, [bp+var_314]
		push	ax
		lea	ax, [bp+var_29C]
		push	ax
		lea	ax, word ptr [bp+var_12E]
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		lea	ax, [bp+var_13E]
		push	ax
		lea	ax, [bp+var_3DE]
		push	ax
		lea	ax, [bp+var_3AC]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, word ptr [bp+var_F4]
		push	ax
		lea	ax, [bp+var_114]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		lea	ax, word ptr [bp+var_D0]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		mov	al, [bp+var_1D]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		lea	ax, word ptr [bp+var_BC]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		lea	ax, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_1C6]
		push	ax
		call	Stub_Midgame1_PlayPart2_47D10
		add	sp, 4Ch
		lea	ax, [bp+var_14E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_143], 0
		jz	short loc_6FBA3
		cmp	[bp+var_148], 0
		jz	short loc_6FBA3
		push	0
		mov	al, [bp+var_144]
		push	ax
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FBA3

loc_6FBA3:
		mov	[bp+var_148], 0
		mov	[bp+var_143], 0
		mov	[bp+var_142], 0
		lea	ax, [bp+var_13E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_133], 0
		jz	short loc_6FBEF
		cmp	[bp+var_138], 0
		jz	short loc_6FBEF
		push	0
		mov	al, [bp+var_134]
		push	ax
		lea	ax, word ptr [bp+var_138]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FBEF

loc_6FBEF:
		mov	[bp+var_138], 0
		mov	[bp+var_133], 0
		mov	[bp+var_132], 0
		cmp	[bp+var_129], 0
		jz	short loc_6FC2E
		cmp	[bp+var_12E], 0
		jz	short loc_6FC2E
		push	0
		mov	al, [bp+var_12A]
		push	ax
		lea	ax, word ptr [bp+var_12E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FC2E

loc_6FC2E:
		mov	[bp+var_12E], 0
		mov	[bp+var_129], 0
		mov	[bp+var_128], 0
		lea	ax, [bp+var_124]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_119], 0
		jz	short loc_6FC7A
		cmp	[bp+var_11E], 0
		jz	short loc_6FC7A
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, word ptr [bp+var_11E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FC7A

loc_6FC7A:
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_109], 0
		jz	short loc_6FCC6
		cmp	[bp+var_10E], 0
		jz	short loc_6FCC6
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FCC6

loc_6FCC6:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_F9], 0
		jz	short loc_6FD12
		cmp	[bp+var_FE], 0
		jz	short loc_6FD12
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FD12

loc_6FD12:
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		cmp	[bp+var_EF], 0
		jz	short loc_6FD51
		cmp	[bp+var_F4], 0
		jz	short loc_6FD51
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, word ptr [bp+var_F4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FD51

loc_6FD51:
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_DF], 0
		jz	short loc_6FD9D
		cmp	[bp+var_E4], 0
		jz	short loc_6FD9D
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FD9D

loc_6FD9D:
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_6FDDC
		cmp	[bp+var_DA], 0
		jz	short loc_6FDDC
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FDDC

loc_6FDDC:
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_6FE1B
		cmp	[bp+var_D0], 0
		jz	short loc_6FE1B
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FE1B

loc_6FE1B:
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_6FE5A
		cmp	[bp+var_C6], 0
		jz	short loc_6FE5A
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FE5A

loc_6FE5A:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_6FE99
		cmp	[bp+var_BC], 0
		jz	short loc_6FE99
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FE99

loc_6FE99:
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DC4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_DC0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		mov	[bp+var_DB6], 129Fh
		lea	ax, [bp+var_DB6]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_DA1], 0
		jz	short loc_6FF07
		cmp	[bp+var_DA6], 0
		jz	short loc_6FF07
		push	0
		mov	al, [bp+var_DA2]
		push	ax
		lea	ax, word ptr [bp+var_DA6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FF07

loc_6FF07:
		mov	[bp+var_DA6], 0
		mov	[bp+var_DA1], 0
		mov	[bp+var_DA0], 0
		lea	ax, [bp+var_590]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_58C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_A9], 0
		jz	short loc_6FF62
		cmp	[bp+var_AE], 0
		jz	short loc_6FF62
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6FF62

loc_6FF62:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_582]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_546]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_4CE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_70024
		cmp	[bp+var_7E], 0
		jz	short loc_70024
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_70024

loc_70024:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_7005C
		cmp	[bp+var_74], 0
		jz	short loc_7005C
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7005C

loc_7005C:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_70094
		cmp	[bp+var_6A], 0
		jz	short loc_70094
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_70094

loc_70094:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_700CC
		cmp	[bp+var_60], 0
		jz	short loc_700CC
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_700CC

loc_700CC:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_70104
		cmp	[bp+var_56], 0
		jz	short loc_70104
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_70104

loc_70104:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3DC]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_70158
		cmp	[bp+var_40], 0
		jz	short loc_70158
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_70158

loc_70158:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_7019F
		cmp	[bp+var_36], 0
		jz	short loc_7019F
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7019F

loc_7019F:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_69270		endp

; START OF FUNCTION CHUNK FOR sub_69270
off_70240	dw offset loc_69D6D
		dw offset loc_69DAB
		dw offset loc_69D8C
		dw offset loc_69DAB
		dw offset loc_69DAB
off_7024A	dw offset loc_69995
		dw offset loc_69ABB
		dw offset loc_69ABB
		dw offset loc_69ABB
		dw offset loc_69ABB
; END OF FUNCTION CHUNK FOR sub_69270

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TranslucentFont_Destruct_67184 (sub_67184 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. Destructeur (entrée 0 de la table de méthodes dseg 1DADh) de la police à
; pixels translucides des titres de mid1 : remet la table de méthodes (mov word ptr [si],
; 1DADh), appelle GlyphObject_ScalarDeletingDtorA_313D6, libère l'objet si le bit 0 de arg_2
; est mis.
; ==============================================================================================
TranslucentFont_Destruct_70254		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_70281
		mov	word ptr [si], 250Fh
		push	0
		push	si
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		test	di, 1
		jz	short loc_70281
		push	si
		call	sub_39C
		add	sp, 2

loc_70281:
		pop	di
		pop	si
		pop	bp
		retf
TranslucentFont_Destruct_70254		endp
ovr200		ends
