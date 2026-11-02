ovr210		segment	para public 'OVERLAY' use16
		assume cs:ovr210
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_974D0		proc far

var_E08		= word ptr -0E08h
var_E06		= word ptr -0E06h
var_E04		= word ptr -0E04h
var_E02		= word ptr -0E02h
var_DF8		= word ptr -0DF8h
var_DC8		= word ptr -0DC8h
var_D9B		= dword ptr -0D9Bh
var_D97		= dword ptr -0D97h
var_D93		= dword ptr -0D93h
var_D8E		= word ptr -0D8Eh
var_D8C		= word ptr -0D8Ch
var_D8A		= word ptr -0D8Ah
var_D88		= word ptr -0D88h
var_D86		= dword ptr -0D86h
var_D82		= dword ptr -0D82h
var_D7E		= word ptr -0D7Eh
var_D7C		= word ptr -0D7Ch
var_D7A		= word ptr -0D7Ah
var_D78		= dword ptr -0D78h
var_D74		= byte ptr -0D74h
var_D72		= word ptr -0D72h
var_D5E		= word ptr -0D5Eh
var_D5C		= word ptr -0D5Ch
var_D5A		= word ptr -0D5Ah
var_D58		= word ptr -0D58h
var_D56		= dword ptr -0D56h
var_D52		= byte ptr -0D52h
var_D50		= word ptr -0D50h
var_D4E		= word ptr -0D4Eh
var_D40		= dword ptr -0D40h
var_D3C		= byte ptr -0D3Ch
var_D3B		= byte ptr -0D3Bh
var_D3A		= dword ptr -0D3Ah
var_533		= dword ptr -533h
var_52F		= dword ptr -52Fh
var_52A		= word ptr -52Ah
var_528		= word ptr -528h
var_526		= word ptr -526h
var_524		= word ptr -524h
var_522		= dword ptr -522h
var_51E		= byte ptr -51Eh
var_51C		= word ptr -51Ch
var_4A4		= word ptr -4A4h
var_42C		= word ptr -42Ch
var_3B4		= word ptr -3B4h
var_33C		= word ptr -33Ch
var_2C4		= word ptr -2C4h
var_24C		= word ptr -24Ch
var_24A		= word ptr -24Ah
var_22A		= word ptr -22Ah
var_212		= word ptr -212h
var_210		= word ptr -210h
var_20E		= word ptr -20Eh
var_20C		= word ptr -20Ch
var_20A		= word ptr -20Ah
var_208		= word ptr -208h
var_204		= word ptr -204h
var_202		= word ptr -202h
var_200		= word ptr -200h
var_1FE		= word ptr -1FEh
var_1FC		= word ptr -1FCh
var_1FA		= word ptr -1FAh
var_1F6		= word ptr -1F6h
var_1A6		= word ptr -1A6h
var_1A4		= word ptr -1A4h
var_1A2		= word ptr -1A2h
var_1A0		= word ptr -1A0h
var_19E		= word ptr -19Eh
var_19C		= word ptr -19Ch
var_19A		= word ptr -19Ah
var_198		= word ptr -198h
var_196		= word ptr -196h
var_194		= word ptr -194h
var_192		= word ptr -192h
var_190		= word ptr -190h
var_18E		= word ptr -18Eh
var_18C		= word ptr -18Ch
var_18A		= word ptr -18Ah
var_188		= word ptr -188h
var_186		= word ptr -186h
var_184		= dword ptr -184h
var_180		= byte ptr -180h
var_17F		= byte ptr -17Fh
var_17E		= dword ptr -17Eh
var_17A		= dword ptr -17Ah
var_176		= word ptr -176h
var_174		= dword ptr -174h
var_170		= word ptr -170h
var_16E		= word ptr -16Eh
var_16C		= word ptr -16Ch
var_16A		= word ptr -16Ah
var_168		= dword ptr -168h
var_164		= byte ptr -164h
var_163		= byte ptr -163h
var_162		= dword ptr -162h
var_15E		= dword ptr -15Eh
var_15A		= dword ptr -15Ah
var_158		= dword ptr -158h
var_154		= dword ptr -154h
var_150		= dword ptr -150h
var_14E		= dword ptr -14Eh
var_14A		= dword ptr -14Ah
var_148		= dword ptr -148h
var_144		= dword ptr -144h
var_142		= dword ptr -142h
var_140		= dword ptr -140h
var_13E		= dword ptr -13Eh
var_13A		= dword ptr -13Ah
var_138		= dword ptr -138h
var_134		= dword ptr -134h
var_130		= dword ptr -130h
var_12C		= byte ptr -12Ch
var_12B		= byte ptr -12Bh
var_12A		= dword ptr -12Ah
var_126		= dword ptr -126h
var_122		= byte ptr -122h
var_121		= byte ptr -121h
var_120		= dword ptr -120h
var_11C		= dword ptr -11Ch
var_118		= byte ptr -118h
var_117		= byte ptr -117h
var_116		= dword ptr -116h
var_112		= word ptr -112h
var_110		= byte ptr -110h
var_10F		= word ptr -10Fh
var_10C		= dword ptr -10Ch
var_108		= byte ptr -108h
var_107		= byte ptr -107h
var_106		= dword ptr -106h
var_102		= word ptr -102h
var_100		= byte ptr -100h
var_FF		= word ptr -0FFh
var_FC		= dword ptr -0FCh
var_F8		= byte ptr -0F8h
var_F7		= byte ptr -0F7h
var_F6		= dword ptr -0F6h
var_F2		= dword ptr -0F2h
var_EE		= byte ptr -0EEh
var_ED		= byte ptr -0EDh
var_EC		= dword ptr -0ECh
var_E8		= dword ptr -0E8h
var_E4		= byte ptr -0E4h
var_E3		= byte ptr -0E3h
var_E2		= dword ptr -0E2h
var_DE		= dword ptr -0DEh
var_DA		= byte ptr -0DAh
var_D9		= byte ptr -0D9h
var_D8		= dword ptr -0D8h
var_D4		= word ptr -0D4h
var_D2		= byte ptr -0D2h
var_D1		= word ptr -0D1h
var_CE		= dword ptr -0CEh
var_CA		= byte ptr -0CAh
var_C9		= byte ptr -0C9h
var_C8		= dword ptr -0C8h
var_C4		= word ptr -0C4h
var_C2		= byte ptr -0C2h
var_C1		= word ptr -0C1h
var_BE		= dword ptr -0BEh
var_BA		= byte ptr -0BAh
var_B9		= byte ptr -0B9h
var_B8		= dword ptr -0B8h
var_B4		= word ptr -0B4h
var_B2		= byte ptr -0B2h
var_B1		= word ptr -0B1h
var_AE		= dword ptr -0AEh
var_AA		= byte ptr -0AAh
var_A9		= byte ptr -0A9h
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= byte ptr -0A0h
var_9F		= byte ptr -9Fh
var_9E		= dword ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= dword ptr -96h
var_92		= byte ptr -92h
var_90		= dword ptr -90h
var_8C		= byte ptr -8Ch
var_8B		= byte ptr -8Bh
var_8A		= dword ptr -8Ah
var_86		= word ptr -86h
var_84		= byte ptr -84h
var_83		= word ptr -83h
var_80		= word ptr -80h
var_7E		= byte ptr -7Eh
var_7D		= word ptr -7Dh
var_7A		= word ptr -7Ah
var_78		= byte ptr -78h
var_77		= word ptr -77h
var_74		= word ptr -74h
var_72		= byte ptr -72h
var_71		= word ptr -71h
var_6E		= word ptr -6Eh
var_6C		= byte ptr -6Ch
var_6B		= word ptr -6Bh
var_68		= dword ptr -68h
var_64		= byte ptr -64h
var_63		= byte ptr -63h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= byte ptr -5Ah
var_59		= byte ptr -59h
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= byte ptr -50h
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= byte ptr -46h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= byte ptr -3Ch
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= byte ptr -32h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= byte ptr -24h
var_23		= byte ptr -23h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= byte ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= byte ptr -18h
var_14		= word ptr -14h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= byte ptr -0Ch
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0DF8h
		push	si
		push	di
		mov	[bp+var_8], 0
		push	0C8h
		push	9
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		mov	[bp+var_B], 0
		mov	[bp+var_C], 0
		mov	[bp+var_D], 0
		cmp	word_4CA5B, 0
		jz	short loc_97506
		mov	[bp+var_C], 1

loc_97506:
		mov	ax, word_4D36E
		mov	[bp+var_10], ax
		mov	[bp+var_204], 0
		mov	[bp+var_202], 0
		push	[bp+var_10]
		lea	ax, [bp+var_204]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_212], 0
		mov	[bp+var_210], 0
		mov	[bp+var_20E], 0
		mov	[bp+var_20C], 0
		mov	[bp+var_20A], 13Fh
		mov	[bp+var_208], 0C7h
		push	0
		lea	ax, [bp+var_212]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	byte ptr [bp+var_1E], 0
		mov	byte ptr [bp+var_1E+1], 0
		mov	[bp+var_1C], 0
		mov	[bp+var_200], 0
		mov	[bp+var_1FE], 18h
		mov	[bp+var_1FC], 13Fh
		mov	[bp+var_1FA], 97h
		mov	[bp+var_28], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	ds
		push	offset unk_4B5C3
		push	ds
		push	offset aConvfontShp_7
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_1F6]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_2C+2], dx
		mov	word ptr [bp+var_2C], ax
		mov	eax, [bp+var_2C]
		mov	[bp+var_28], eax
		mov	[bp+var_24], 2
		mov	[bp+var_23], 1
		mov	[bp+var_22], 0
		lea	ax, word ptr [bp+var_28]
		push	ax
		lea	ax, [bp+var_22A]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		lea	ax, [bp+var_22A]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	[bp+var_E08], 0
		mov	[bp+var_E06], 98h
		mov	[bp+var_E04], 13Fh
		mov	[bp+var_E02], 0C7h
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_2C4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_33C]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid20
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_3B4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_3B4]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgames_28
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_42C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_42C]
		push	ax
		call	sub_435F1
		add	sp, 2
		mov	[bp+var_36], 0
		mov	[bp+var_32], 2
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	3
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	13h
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_40], 0
		mov	[bp+var_3C], 2
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	3
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	14h
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_4A], 0
		mov	[bp+var_46], 2
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	3
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	15h
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_54], 0
		mov	[bp+var_50], 2
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		mov	[bp+var_5E], 0
		mov	[bp+var_5A], 2
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		push	3
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	74h
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	2Ch
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_68], 0
		mov	[bp+var_64], 2
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		push	2
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_6B], 0
		lea	ax, word ptr [bp+var_68]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_74], 0
		mov	[bp+var_71], 0
		mov	[bp+var_7A], 0
		mov	[bp+var_77], 0
		mov	[bp+var_80], 0
		mov	[bp+var_7D], 0
		mov	[bp+var_86], 0
		mov	[bp+var_83], 0
		mov	[bp+var_130], 0
		mov	[bp+var_12C], 2
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		push	2
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	15h
		lea	ax, [bp+var_33C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_130]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	2
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	18h
		lea	ax, [bp+var_33C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_13A]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140], 2
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_13E], 0
		push	2
		lea	ax, word ptr [bp+var_144]
		push	ax
		push	16h
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_144]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		push	0
		push	2
		lea	ax, word ptr [bp+var_14E]
		push	ax
		call	ConvData_LoadNormalOrNight_10C9F
		add	sp, 6
		lea	ax, word ptr [bp+var_14E]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_979B5
		cmp	[bp+var_14E], 0
		jz	short loc_979B5
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_979B5

loc_979B5:
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		cmp	byte ptr [bp+var_140+1], 0
		jz	short loc_979F4
		cmp	[bp+var_144], 0
		jz	short loc_979F4
		push	0
		mov	al, byte ptr [bp+var_140]
		push	ax
		lea	ax, word ptr [bp+var_144]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_979F4

loc_979F4:
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_13E], 0
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_97A33
		cmp	[bp+var_13A], 0
		jz	short loc_97A33
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_97A33

loc_97A33:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		cmp	[bp+var_12B], 0
		jz	short loc_97A72
		cmp	[bp+var_130], 0
		jz	short loc_97A72
		push	0
		mov	al, [bp+var_12C]
		push	ax
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_97A72

loc_97A72:
		mov	[bp+var_130], 0
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid20voc
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		cmp	[bp+var_C], 0
		jz	short loc_97AEC
		push	ds
		lea	ax, [bp+var_1F6]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_97AEC
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_4A4]
		push	ax
		mov	bx, [bp+var_4A4]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_4A4]
		push	ax
		call	sub_435F1
		add	sp, 2
		jmp	short loc_97AF0

loc_97AEC:
		mov	[bp+var_C], 0

loc_97AF0:
		mov	[bp+var_90], 0
		mov	[bp+var_8C], 2
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		mov	al, byte_4CA58
		mov	[bp+var_92], al
		lea	ax, [bp+var_51C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_92]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_97B31
		jmp	loc_97E55

loc_97B31:
		shl	bx, 1
		jmp	cs:off_9CBD5[bx]	; switch jump

loc_97B38:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1F6]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_97B66
		jmp	loc_97C70

loc_97B66:
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_51C]
		push	ax
		mov	bx, [bp+var_51C]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_51C]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_29
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_DF8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_DF8], 480h
		mov	[bp+var_D97], 100h
		mov	[bp+var_D9B], 0
		mov	[bp+var_DF8], 498h
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_DF8]
		push	ax
		mov	bx, [bp+var_DF8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_97C38

loc_97C22:
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_97C38:
		cmp	si, 6Ah
		jle	short loc_97C22
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_DF8], 498h
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_DF8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_97C70:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1F6]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_97CAE
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_97CAE
		mov	word_4F048, 5Ah

loc_97CAE:
		jmp	loc_97E55

loc_97CB1:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1F6]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_97CDF
		jmp	loc_97DF3

loc_97CDF:
		cmp	word_4CA5D, 0
		jnz	short loc_97CE9
		jmp	loc_97DF3

loc_97CE9:
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_51C]
		push	ax
		mov	bx, [bp+var_51C]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_51C]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_30
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_DF8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_DF8], 480h
		mov	[bp+var_D97], 100h
		mov	[bp+var_D9B], 0
		mov	[bp+var_DF8], 498h
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_DF8]
		push	ax
		mov	bx, [bp+var_DF8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_97DBB

loc_97DA5:
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_97DBB:
		cmp	si, 6Ah
		jle	short loc_97DA5
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_DF8], 498h
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_DF8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_97DF3:
		cmp	[bp+var_92], 3
		jnz	short loc_97E15
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_97E2E

loc_97E15:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_97E2E:
		push	ds
		lea	ax, [bp+var_1F6]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_97E53
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_97E53
		mov	word_4F048, 0FFh

loc_97E53:
		jmp	short loc_97E55

loc_97E55:
		mov	eax, dword_4B5B2
		mov	[bp+var_96], eax
		cmp	[bp+var_D], 0
		jnz	short loc_97E67
		jmp	loc_97F6D

loc_97E67:
		mov	[bp+var_D5A], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D58], ax
		lea	ax, [bp+var_D5A]
		mov	word_4D392, ax
		mov	[bp+var_D5A], 1BCh
		mov	[bp+var_D56], 0
		mov	[bp+var_D52], 0
		mov	[bp+var_D5E], 0
		mov	[bp+var_D5C], 0FFFFh
		push	word_4CA5D
		lea	ax, [bp+var_D5E]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		xor	si, si
		jmp	loc_97F49

loc_97EB1:
		mov	[bp+var_130], 0
		mov	[bp+var_12C], 2
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		push	3
		lea	ax, word ptr [bp+var_130]
		push	ax
		mov	al, byte ptr [bp+si+var_96]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_51C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		lea	ax, word ptr [bp+var_130]
		push	ax
		lea	ax, [bp+var_D5E]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_D5E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		cmp	[bp+var_12B], 0
		jz	short loc_97F31
		cmp	[bp+var_130], 0
		jz	short loc_97F31
		push	0
		mov	al, [bp+var_12C]
		push	ax
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_97F31

loc_97F31:
		mov	[bp+var_130], 0
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		inc	si

loc_97F49:
		cmp	si, 4
		jge	short loc_97F51
		jmp	loc_97EB1

loc_97F51:
		lea	ax, [bp+var_D5E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D5A]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_97F6D:
		mov	[bp+var_526], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_524], ax
		lea	ax, [bp+var_526]
		mov	word_4D392, ax
		mov	[bp+var_526], 1BCh
		mov	[bp+var_522], 0
		mov	[bp+var_51E], 0
		mov	[bp+var_52A], 0
		mov	[bp+var_528], 0FFFFh
		cmp	[bp+var_B], 0
		jnz	short loc_97FAA
		jmp	loc_9802C

loc_97FAA:
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_DC8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_DC8]
		push	ax
		call	sub_435F1
		add	sp, 2
		cmp	[bp+var_C], 0
		jz	short loc_97FD8
		mov	byte ptr [bp+var_12A+3], 10h
		jmp	short loc_97FDD

loc_97FD8:
		mov	byte ptr [bp+var_12A+3], 0Fh

loc_97FDD:
		push	3
		lea	ax, word ptr [bp+var_90]
		push	ax
		mov	al, byte ptr [bp+var_12A+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_DC8]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_52A]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_90]
		push	ax
		lea	ax, [bp+var_52A]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, [bp+var_DC8]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_9802C:
		mov	[bp+var_D50], 129Fh
		mov	[bp+var_D40], 0
		mov	[bp+var_D3C], 2
		mov	[bp+var_D3B], 0
		mov	[bp+var_D3A], 0
		mov	[bp+var_D4E], 0
		mov	[bp+var_D50], 1FA5h
		xor	eax, eax
		mov	[bp+var_533], eax
		mov	[bp+var_52F], eax
		cmp	[bp+var_C], 0
		jz	short loc_98081
		push	word_4CA5B
		lea	ax, [bp+var_D50]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		jmp	loc_98248

loc_98081:
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_31
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_DF8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_DF8], 480h
		mov	[bp+var_D97], 100h
		mov	[bp+var_D9B], 0
		mov	[bp+var_DF8], 498h
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_DF8]
		push	ax
		mov	bx, [bp+var_DF8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3032474Dh
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		xor	si, si
		jmp	short loc_9814C

loc_98109:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	di, word ptr [bp+var_D86]
		movsx	eax, di
		push	eax
		push	ds
		mov	ax, [bp+var_A]
		imul	si
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_D82]
		mov	[bp+var_D93], eax
		inc	si

loc_9814C:
		cmp	si, 9
		jl	short loc_98109
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_98194
		push	[bp+arg_0]
		push	[bp+var_8]
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		push	[bp+var_8]
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_98226

loc_98194:
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_981C9
		push	[bp+arg_4]
		push	[bp+var_8]
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		push	[bp+var_8]
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_98226

loc_981C9:
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_981FE
		push	[bp+arg_2]
		push	[bp+var_8]
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		push	[bp+var_8]
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_98226

loc_981FE:
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		push	[bp+var_8]
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		push	[bp+var_8]
		call	CRT_Strcat
		add	sp, 4

loc_98226:
		mov	[bp+var_DF8], 498h
		lea	ax, [bp+var_DF8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_DF8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_98248:
		cmp	byte_4F55C, 0
		jnz	short loc_98252
		jmp	loc_9857E

loc_98252:
		mov	[bp+var_D50], 129Fh
		lea	ax, [bp+var_D50]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_D3B], 0
		jz	short loc_9828D
		cmp	[bp+var_D40], 0
		jz	short loc_9828D
		push	0
		mov	al, [bp+var_D3C]
		push	ax
		lea	ax, word ptr [bp+var_D40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9828D

loc_9828D:
		mov	[bp+var_D40], 0
		mov	[bp+var_D3B], 0
		mov	[bp+var_D3A], 0
		lea	ax, [bp+var_52A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_526]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_51C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_982F7
		cmp	[bp+var_90], 0
		jz	short loc_982F7
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_982F7

loc_982F7:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_7A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_74]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_63], 0
		jz	short loc_9837E
		cmp	[bp+var_68], 0
		jz	short loc_9837E
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9837E

loc_9837E:
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		cmp	[bp+var_59], 0
		jz	short loc_983B6
		cmp	[bp+var_5E], 0
		jz	short loc_983B6
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_983B6

loc_983B6:
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		cmp	[bp+var_4F], 0
		jz	short loc_983EE
		cmp	[bp+var_54], 0
		jz	short loc_983EE
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_983EE

loc_983EE:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_98426
		cmp	[bp+var_4A], 0
		jz	short loc_98426
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98426

loc_98426:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		cmp	[bp+var_3B], 0
		jz	short loc_9845E
		cmp	[bp+var_40], 0
		jz	short loc_9845E
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9845E

loc_9845E:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_98496
		cmp	[bp+var_36], 0
		jz	short loc_98496
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98496

loc_98496:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_42C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_3B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2C4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_24A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_22A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_98526
		cmp	[bp+var_28], 0
		jz	short loc_98526
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98526

loc_98526:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_212]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_204]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_9857E:
		cmp	[bp+var_B], 0
		jz	short loc_985C8
		mov	ax, word_4F048
		mov	[bp+var_98], ax
		mov	[bp+var_9A], 0
		cmp	[bp+var_52A], 0
		jz	short loc_985C8
		push	[bp+var_528]
		mov	bx, [bp+var_52A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_9A]
		push	[bp+var_98]
		push	[bp+var_528]
		mov	bx, [bp+var_52A]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_985C8

loc_985C8:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		call	Input_Flush_116D1
		mov	[bp+var_130], 0
		mov	[bp+var_12C], 2
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		push	3
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	7
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140], 2
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_13E], 0
		push	2
		lea	ax, word ptr [bp+var_144]
		push	ax
		push	10h
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_148+1], 0
		lea	ax, word ptr [bp+var_144]
		push	ax
		lea	ax, word ptr [bp+var_14A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150], 2
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_14E], 0
		push	3
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	0Ah
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_15E], 0
		mov	byte ptr [bp+var_15A], 2
		mov	byte ptr [bp+var_15A+1], 0
		mov	[bp+var_158], 0
		push	3
		lea	ax, word ptr [bp+var_15E]
		push	ax
		push	0Bh
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_168], 0
		mov	[bp+var_164], 2
		mov	[bp+var_163], 0
		mov	[bp+var_162], 0
		push	3
		lea	ax, word ptr [bp+var_168]
		push	ax
		push	0Ch
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0FFFEh
		push	0
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	di, ax
		push	0FFFEh
		push	0
		lea	ax, word ptr [bp+var_15E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_16A], ax
		push	0FFFEh
		push	0
		lea	ax, word ptr [bp+var_168]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_16C], ax
		lea	ax, [bp+var_204]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	[bp+var_74]
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_7A]
		mov	al, [bp+var_78]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_14A]
		mov	al, byte ptr [bp+var_148]
		push	ax
		lea	ax, word ptr [bp+var_14A]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_16E], ax
		push	5
		push	0
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_170], ax
		push	[bp+var_16E]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_170]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_17A], 0
		mov	byte ptr [bp+var_176], 2
		mov	byte ptr [bp+var_176+1], 0
		mov	[bp+var_174], 0
		mov	[bp+var_D7C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D7A], ax
		lea	ax, [bp+var_D7C]
		mov	word_4D392, ax
		mov	[bp+var_D7C], 1BCh
		mov	[bp+var_D78], 0
		mov	[bp+var_D74], 0
		mov	word ptr [bp+var_D82+2], 0
		mov	[bp+var_D7E], 0FFFFh
		mov	[bp+var_184], 0
		mov	[bp+var_180], 2
		mov	[bp+var_17F], 0
		mov	[bp+var_17E], 0
		mov	[bp+var_D8A], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D88], ax
		lea	ax, [bp+var_D8A]
		mov	word_4D392, ax
		mov	[bp+var_D8A], 1BCh
		mov	[bp+var_D86], 0
		mov	byte ptr [bp+var_D82], 0
		mov	[bp+var_D8E], 0
		mov	[bp+var_D8C], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_988CD
		jmp	loc_98987

loc_988CD:
		push	3
		lea	ax, word ptr [bp+var_17A]
		push	ax
		push	2Ah
		lea	ax, [bp+var_51C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_17A]
		push	ax
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFC8
		mov	[bp+var_186], ax
		mov	[bp+var_188], 0
		cmp	word ptr [bp+var_D82+2], 0
		jz	short loc_9894C
		push	[bp+var_D7E]
		mov	bx, word ptr [bp+var_D82+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_188]
		push	[bp+var_186]
		push	[bp+var_D7E]
		mov	bx, word ptr [bp+var_D82+2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_9894C

loc_9894C:
		push	3
		lea	ax, word ptr [bp+var_184]
		push	ax
		push	3Ah
		lea	ax, [bp+var_51C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D8E]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_184]
		push	ax
		lea	ax, [bp+var_D8E]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_98987:
		cmp	byte_4F55C, 0
		jnz	short loc_98991
		jmp	loc_98F09

loc_98991:
		lea	ax, [bp+var_D8E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D8A]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_17F], 0
		jz	short loc_989D5
		cmp	[bp+var_184], 0
		jz	short loc_989D5
		push	0
		mov	al, [bp+var_180]
		push	ax
		lea	ax, word ptr [bp+var_184]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_989D5

loc_989D5:
		mov	[bp+var_184], 0
		mov	[bp+var_17F], 0
		mov	[bp+var_17E], 0
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D7C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_176+1], 0
		jz	short loc_98A30
		cmp	[bp+var_17A], 0
		jz	short loc_98A30
		push	0
		mov	al, byte ptr [bp+var_176]
		push	ax
		lea	ax, word ptr [bp+var_17A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98A30

loc_98A30:
		mov	[bp+var_17A], 0
		mov	byte ptr [bp+var_176+1], 0
		mov	[bp+var_174], 0
		push	0
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	[bp+var_163], 0
		jz	short loc_98A7E
		cmp	[bp+var_168], 0
		jz	short loc_98A7E
		push	0
		mov	al, [bp+var_164]
		push	ax
		lea	ax, word ptr [bp+var_168]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98A7E

loc_98A7E:
		mov	[bp+var_168], 0
		mov	[bp+var_163], 0
		mov	[bp+var_162], 0
		cmp	byte ptr [bp+var_15A+1], 0
		jz	short loc_98ABD
		cmp	[bp+var_15E], 0
		jz	short loc_98ABD
		push	0
		mov	al, byte ptr [bp+var_15A]
		push	ax
		lea	ax, word ptr [bp+var_15E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98ABD

loc_98ABD:
		mov	[bp+var_15E], 0
		mov	byte ptr [bp+var_15A+1], 0
		mov	[bp+var_158], 0
		cmp	byte ptr [bp+var_150+1], 0
		jz	short loc_98AFC
		cmp	[bp+var_154], 0
		jz	short loc_98AFC
		push	0
		mov	al, byte ptr [bp+var_150]
		push	ax
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98AFC

loc_98AFC:
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_14E], 0
		lea	ax, word ptr [bp+var_14A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_140+1], 0
		jz	short loc_98B48
		cmp	[bp+var_144], 0
		jz	short loc_98B48
		push	0
		mov	al, byte ptr [bp+var_140]
		push	ax
		lea	ax, word ptr [bp+var_144]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98B48

loc_98B48:
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_13E], 0
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_98B87
		cmp	[bp+var_13A], 0
		jz	short loc_98B87
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98B87

loc_98B87:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		cmp	[bp+var_12B], 0
		jz	short loc_98BC6
		cmp	[bp+var_130], 0
		jz	short loc_98BC6
		push	0
		mov	al, [bp+var_12C]
		push	ax
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98BC6

loc_98BC6:
		mov	[bp+var_130], 0
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		mov	[bp+var_D50], 129Fh
		lea	ax, [bp+var_D50]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_D3B], 0
		jz	short loc_98C18
		cmp	[bp+var_D40], 0
		jz	short loc_98C18
		push	0
		mov	al, [bp+var_D3C]
		push	ax
		lea	ax, word ptr [bp+var_D40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98C18

loc_98C18:
		mov	[bp+var_D40], 0
		mov	[bp+var_D3B], 0
		mov	[bp+var_D3A], 0
		lea	ax, [bp+var_52A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_526]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_51C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_98C82
		cmp	[bp+var_90], 0
		jz	short loc_98C82
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98C82

loc_98C82:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_7A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_74]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_63], 0
		jz	short loc_98D09
		cmp	[bp+var_68], 0
		jz	short loc_98D09
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98D09

loc_98D09:
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		cmp	[bp+var_59], 0
		jz	short loc_98D41
		cmp	[bp+var_5E], 0
		jz	short loc_98D41
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98D41

loc_98D41:
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		cmp	[bp+var_4F], 0
		jz	short loc_98D79
		cmp	[bp+var_54], 0
		jz	short loc_98D79
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98D79

loc_98D79:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_98DB1
		cmp	[bp+var_4A], 0
		jz	short loc_98DB1
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98DB1

loc_98DB1:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		cmp	[bp+var_3B], 0
		jz	short loc_98DE9
		cmp	[bp+var_40], 0
		jz	short loc_98DE9
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98DE9

loc_98DE9:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_98E21
		cmp	[bp+var_36], 0
		jz	short loc_98E21
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98E21

loc_98E21:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_42C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_3B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2C4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_24A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_22A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_98EB1
		cmp	[bp+var_28], 0
		jz	short loc_98EB1
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_98EB1

loc_98EB1:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_212]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_204]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_98F09:
		call	Input_Flush_116D1
		mov	byte ptr [bp+var_D56+3], 0
		call	Input_Flush_116D1
		push	0FFFEh
		push	1
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_18A], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_18C], ax
		push	di
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_18A]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_190], ax
		or	ax, ax
		jz	short loc_98FC9
		push	1
		push	0ADh
		push	0
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	[bp+var_190]
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	bx, [bp+var_190]
		mov	word ptr [bx], 20D9h
		mov	bx, [bp+var_190]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, [bp+var_190]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_190]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_190]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_190]
		mov	word ptr [bx+1Fh], 0FFFEh
		mov	ax, [bp+var_190]
		jmp	short loc_98FCD

loc_98FC9:
		mov	ax, [bp+var_190]

loc_98FCD:
		mov	[bp+var_18E], ax
		push	[bp+var_18E]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_194], ax
		or	ax, ax
		jz	short loc_99046
		push	2
		push	0FAh
		push	0
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	[bp+var_194]
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	bx, [bp+var_194]
		mov	word ptr [bx], 20D9h
		mov	bx, [bp+var_194]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, [bp+var_194]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_194]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_194]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_194]
		mov	word ptr [bx+1Fh], 0FFFCh
		mov	ax, [bp+var_194]
		jmp	short loc_9904A

loc_99046:
		mov	ax, [bp+var_194]

loc_9904A:
		mov	[bp+var_192], ax
		push	[bp+var_192]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_196], 0
		mov	[bp+var_198], 0
		jmp	loc_9929C

loc_9906E:
		mov	si, word ptr [bp+var_D56+1]
		cmp	si, 1Eh
		jnz	short loc_99088
		push	[bp+var_18C]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_99088:
		cmp	si, 2Bh
		jge	short loc_9909C
		mov	[bp+var_19A], si
		mov	bx, [bp+var_18A]
		mov	ax, [bp+var_19A]
		mov	[bx+1Bh], ax

loc_9909C:
		cmp	si, 0Ah
		jle	short loc_990C0
		cmp	si, 32h
		jge	short loc_990C0
		test	si, 1
		jz	short loc_990C0
		push	0FFFFh
		push	0
		push	[bp+var_16E]
		mov	bx, [bp+var_16E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_990C0:
		cmp	si, 32h
		jge	short loc_990DF
		test	si, 1
		jz	short loc_990DF
		push	0FFFFh
		push	0
		push	[bp+var_170]
		mov	bx, [bp+var_170]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_990DF:
		cmp	si, 36h
		jz	short loc_990E7
		jmp	loc_9916B

loc_990E7:
		push	di
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		or	di, di
		jz	short loc_99105
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_99105

loc_99105:
		push	[bp+var_18E]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	[bp+var_192]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	[bp+var_16A]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_16C]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_18E]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_192]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_9916B:
		cmp	si, 10h
		jle	short loc_99188
		cmp	si, 36h
		jge	short loc_99188
		mov	ax, [bp+var_198]
		mov	[bp+var_19C], ax
		inc	[bp+var_198]
		mov	ax, [bp+var_19C]
		mov	[di+1Bh], ax

loc_99188:
		cmp	si, 36h
		jle	short loc_991EC
		cmp	[bp+var_196], 4
		jle	short loc_991C2
		mov	[bp+var_196], 0
		push	0
		push	0FFFFh
		push	[bp+var_16A]
		mov	bx, [bp+var_16A]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	0
		push	1
		push	[bp+var_16C]
		mov	bx, [bp+var_16C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_991C2:
		mov	ax, [bp+var_196]
		mov	[bp+var_19E], ax
		mov	bx, [bp+var_16A]
		mov	ax, [bp+var_19E]
		mov	[bx+1Bh], ax
		mov	ax, [bp+var_196]
		mov	[bp+var_1A0], ax
		inc	[bp+var_196]
		mov	bx, [bp+var_16C]
		mov	ax, [bp+var_1A0]
		mov	[bx+1Bh], ax

loc_991EC:
		cmp	si, 29h
		jle	short loc_9920A
		cmp	si, 63h
		jge	short loc_9920A
		mov	ax, si
		add	ax, 0FFD6h
		mov	[bp+var_1A2], ax
		mov	bx, [bp+var_18C]
		mov	ax, [bp+var_1A2]
		mov	[bx+1Bh], ax

loc_9920A:
		cmp	si, 31h
		jnz	short loc_99259
		cmp	[bp+var_D], 0
		jz	short loc_99259
		mov	ax, word_4EFE8
		mov	[bp+var_1A4], ax
		mov	[bp+var_1A6], 0
		cmp	[bp+var_D8E], 0
		jz	short loc_99259
		push	[bp+var_D8C]
		mov	bx, [bp+var_D8E]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_1A6]
		push	[bp+var_1A4]
		push	[bp+var_D8C]
		mov	bx, [bp+var_D8E]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_99259

loc_99259:
		cmp	si, 32h
		jnz	short loc_99282
		mov	bx, [bp+var_18E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_18E]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_192]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_192]
		mov	word ptr [bx+1Fh], 0

loc_99282:
		jmp	short loc_9928F
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9928F
		jmp	short loc_992BA

loc_9928F:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9929C:
		cmp	word ptr [bp+var_D56+1], 62h
		jnb	short loc_992AA
		cmp	byte ptr [bp+var_D56+3], 0
		jz	short loc_992AF

loc_992AA:
		mov	ax, 1
		jmp	short loc_992B1

loc_992AF:
		xor	ax, ax

loc_992B1:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_992BA
		jmp	loc_9906E

loc_992BA:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		lea	ax, [bp+var_D8E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D8A]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_17F], 0
		jz	short loc_9930C
		cmp	[bp+var_184], 0
		jz	short loc_9930C
		push	0
		mov	al, [bp+var_180]
		push	ax
		lea	ax, word ptr [bp+var_184]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9930C

loc_9930C:
		mov	[bp+var_184], 0
		mov	[bp+var_17F], 0
		mov	[bp+var_17E], 0
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D7C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_176+1], 0
		jz	short loc_99367
		cmp	[bp+var_17A], 0
		jz	short loc_99367
		push	0
		mov	al, byte ptr [bp+var_176]
		push	ax
		lea	ax, word ptr [bp+var_17A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99367

loc_99367:
		mov	[bp+var_17A], 0
		mov	byte ptr [bp+var_176+1], 0
		mov	[bp+var_174], 0
		push	0
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	[bp+var_163], 0
		jz	short loc_993B5
		cmp	[bp+var_168], 0
		jz	short loc_993B5
		push	0
		mov	al, [bp+var_164]
		push	ax
		lea	ax, word ptr [bp+var_168]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_993B5

loc_993B5:
		mov	[bp+var_168], 0
		mov	[bp+var_163], 0
		mov	[bp+var_162], 0
		cmp	byte ptr [bp+var_15A+1], 0
		jz	short loc_993F4
		cmp	[bp+var_15E], 0
		jz	short loc_993F4
		push	0
		mov	al, byte ptr [bp+var_15A]
		push	ax
		lea	ax, word ptr [bp+var_15E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_993F4

loc_993F4:
		mov	[bp+var_15E], 0
		mov	byte ptr [bp+var_15A+1], 0
		mov	[bp+var_158], 0
		cmp	byte ptr [bp+var_150+1], 0
		jz	short loc_99433
		cmp	[bp+var_154], 0
		jz	short loc_99433
		push	0
		mov	al, byte ptr [bp+var_150]
		push	ax
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99433

loc_99433:
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_14E], 0
		lea	ax, word ptr [bp+var_14A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_140+1], 0
		jz	short loc_9947F
		cmp	[bp+var_144], 0
		jz	short loc_9947F
		push	0
		mov	al, byte ptr [bp+var_140]
		push	ax
		lea	ax, word ptr [bp+var_144]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9947F

loc_9947F:
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_13E], 0
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_994BE
		cmp	[bp+var_13A], 0
		jz	short loc_994BE
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_994BE

loc_994BE:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		cmp	[bp+var_12B], 0
		jz	short loc_994FD
		cmp	[bp+var_130], 0
		jz	short loc_994FD
		push	0
		mov	al, [bp+var_12C]
		push	ax
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_994FD

loc_994FD:
		mov	[bp+var_130], 0
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		call	Input_Flush_116D1
		cmp	byte_4F55C, 0
		jnz	short loc_99523
		jmp	loc_9984F

loc_99523:
		mov	[bp+var_D50], 129Fh
		lea	ax, [bp+var_D50]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_D3B], 0
		jz	short loc_9955E
		cmp	[bp+var_D40], 0
		jz	short loc_9955E
		push	0
		mov	al, [bp+var_D3C]
		push	ax
		lea	ax, word ptr [bp+var_D40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9955E

loc_9955E:
		mov	[bp+var_D40], 0
		mov	[bp+var_D3B], 0
		mov	[bp+var_D3A], 0
		lea	ax, [bp+var_52A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_526]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_51C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_995C8
		cmp	[bp+var_90], 0
		jz	short loc_995C8
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_995C8

loc_995C8:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_7A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_74]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_63], 0
		jz	short loc_9964F
		cmp	[bp+var_68], 0
		jz	short loc_9964F
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9964F

loc_9964F:
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		cmp	[bp+var_59], 0
		jz	short loc_99687
		cmp	[bp+var_5E], 0
		jz	short loc_99687
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99687

loc_99687:
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		cmp	[bp+var_4F], 0
		jz	short loc_996BF
		cmp	[bp+var_54], 0
		jz	short loc_996BF
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_996BF

loc_996BF:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_996F7
		cmp	[bp+var_4A], 0
		jz	short loc_996F7
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_996F7

loc_996F7:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		cmp	[bp+var_3B], 0
		jz	short loc_9972F
		cmp	[bp+var_40], 0
		jz	short loc_9972F
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9972F

loc_9972F:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_99767
		cmp	[bp+var_36], 0
		jz	short loc_99767
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99767

loc_99767:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_42C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_3B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2C4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_24A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_22A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_997F7
		cmp	[bp+var_28], 0
		jz	short loc_997F7
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_997F7

loc_997F7:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_212]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_204]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_9984F:
		mov	[bp+var_A4], 0
		mov	[bp+var_A0], 2
		mov	[bp+var_9F], 0
		mov	[bp+var_9E], 0
		push	3
		lea	ax, word ptr [bp+var_A4]
		push	ax
		push	4
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_204]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_130], 0
		mov	[bp+var_12C], 2
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		push	3
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	2C17h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	[bp+var_74]
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_6E]
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0FFC1h
		push	0
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_134+2], ax
		push	word ptr [bp+var_134+2]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0
		lea	ax, word ptr [bp+var_A4]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_134], ax
		push	word ptr [bp+var_134]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	di, ax
		push	di
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1Bh
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	[bp+var_13E], 0
		mov	byte ptr [bp+var_13A], 2
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_138], 0
		push	3
		lea	ax, word ptr [bp+var_13E]
		push	ax
		push	0
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	1
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13E]
		push	ax
		push	0
		call	ToggleLayer_Construct_FDCC
		add	sp, 0Ah
		mov	word ptr [bp+var_140], ax
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		mov	[bp+var_D7C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D7A], ax
		lea	ax, [bp+var_D7C]
		mov	word_4D392, ax
		mov	[bp+var_D7C], 1BCh
		mov	[bp+var_D78], 0
		mov	[bp+var_D74], 0
		mov	word ptr [bp+var_D82+2], 0
		mov	[bp+var_D7E], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_99A59
		jmp	loc_99AD8

loc_99A59:
		push	3
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	5
		lea	ax, [bp+var_51C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF7E
		mov	word ptr [bp+var_14E+2], ax
		mov	word ptr [bp+var_14E], 0
		cmp	word ptr [bp+var_D82+2], 0
		jz	short loc_99AD8
		push	[bp+var_D7E]
		mov	bx, word ptr [bp+var_D82+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_14E]
		push	word ptr [bp+var_14E+2]
		push	[bp+var_D7E]
		mov	bx, word ptr [bp+var_D82+2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_99AD8

loc_99AD8:
		xor	si, si
		mov	word ptr [bp+var_150], 1
		jmp	loc_99B69

loc_99AE3:
		or	si, si
		jnz	short loc_99B08
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_99B08
		mov	si, 0FFFFh
		jmp	short loc_99B19

loc_99B08:
		cmp	si, 0FFFFh
		jnz	short loc_99B12
		mov	si, 1
		jmp	short loc_99B19

loc_99B12:
		cmp	si, 1
		jnz	short loc_99B19
		xor	si, si

loc_99B19:
		push	si
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	si
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	si
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		add	word ptr [bp+var_150], si
		jmp	short loc_99B5C
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_99B5C
		jmp	short loc_99B87

loc_99B5C:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_99B69:
		cmp	word ptr [bp+var_D56+1], 19h
		jnb	short loc_99B77
		cmp	byte ptr [bp+var_D56+3], 0
		jz	short loc_99B7C

loc_99B77:
		mov	ax, 1
		jmp	short loc_99B7E

loc_99B7C:
		xor	ax, ax

loc_99B7E:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_99B87
		jmp	loc_99AE3

loc_99B87:
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D7C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_99BCB
		cmp	[bp+var_14A], 0
		jz	short loc_99BCB
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99BCB

loc_99BCB:
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		cmp	byte ptr [bp+var_13A+1], 0
		jz	short loc_99C0A
		cmp	[bp+var_13E], 0
		jz	short loc_99C0A
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, word ptr [bp+var_13E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99C0A

loc_99C0A:
		mov	[bp+var_13E], 0
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_138], 0
		cmp	[bp+var_12B], 0
		jz	short loc_99C49
		cmp	[bp+var_130], 0
		jz	short loc_99C49
		push	0
		mov	al, [bp+var_12C]
		push	ax
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99C49

loc_99C49:
		mov	[bp+var_130], 0
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		push	0
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_99C79
		jmp	loc_99FE4

loc_99C79:
		cmp	[bp+var_9F], 0
		jz	short loc_99CA1
		cmp	[bp+var_A4], 0
		jz	short loc_99CA1
		push	0
		mov	al, [bp+var_A0]
		push	ax
		lea	ax, word ptr [bp+var_A4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99CA1

loc_99CA1:
		mov	[bp+var_A4], 0
		mov	[bp+var_9F], 0
		mov	[bp+var_9E], 0
		mov	[bp+var_D50], 129Fh
		lea	ax, [bp+var_D50]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_D3B], 0
		jz	short loc_99CF3
		cmp	[bp+var_D40], 0
		jz	short loc_99CF3
		push	0
		mov	al, [bp+var_D3C]
		push	ax
		lea	ax, word ptr [bp+var_D40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99CF3

loc_99CF3:
		mov	[bp+var_D40], 0
		mov	[bp+var_D3B], 0
		mov	[bp+var_D3A], 0
		lea	ax, [bp+var_52A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_526]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_51C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_99D5D
		cmp	[bp+var_90], 0
		jz	short loc_99D5D
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99D5D

loc_99D5D:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_7A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_74]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_63], 0
		jz	short loc_99DE4
		cmp	[bp+var_68], 0
		jz	short loc_99DE4
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99DE4

loc_99DE4:
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		cmp	[bp+var_59], 0
		jz	short loc_99E1C
		cmp	[bp+var_5E], 0
		jz	short loc_99E1C
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99E1C

loc_99E1C:
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		cmp	[bp+var_4F], 0
		jz	short loc_99E54
		cmp	[bp+var_54], 0
		jz	short loc_99E54
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99E54

loc_99E54:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_99E8C
		cmp	[bp+var_4A], 0
		jz	short loc_99E8C
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99E8C

loc_99E8C:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		cmp	[bp+var_3B], 0
		jz	short loc_99EC4
		cmp	[bp+var_40], 0
		jz	short loc_99EC4
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99EC4

loc_99EC4:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_99EFC
		cmp	[bp+var_36], 0
		jz	short loc_99EFC
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99EFC

loc_99EFC:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_42C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_3B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2C4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_24A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_22A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_99F8C
		cmp	[bp+var_28], 0
		jz	short loc_99F8C
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_99F8C

loc_99F8C:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_212]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_204]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_99FE4:
		lea	ax, [bp+var_204]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_130], 0
		mov	[bp+var_12C], 2
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		push	3
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	1
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	5
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140], 2
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_13E], 0
		push	2
		lea	ax, word ptr [bp+var_144]
		push	ax
		push	0Eh
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_148+1], 0
		lea	ax, word ptr [bp+var_144]
		push	ax
		lea	ax, word ptr [bp+var_14A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	[bp+var_7A]
		mov	al, [bp+var_78]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_80]
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_14A]
		mov	al, byte ptr [bp+var_148]
		push	ax
		lea	ax, word ptr [bp+var_14A]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0FFD0h
		push	0
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_14E+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_14E], ax
		push	word ptr [bp+var_14E]
		push	word ptr [bp+var_14E+2]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_14E+2]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_150], ax
		push	word ptr [bp+var_150]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1
		push	5Ah
		push	0
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_154+2], ax
		push	word ptr [bp+var_154+2]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	2
		push	32h
		push	0
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_154], ax
		push	word ptr [bp+var_154]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_158+2], ax
		push	word ptr [bp+var_158+2]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	di, ax
		push	di
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	word ptr [di+1Bh], 1
		xor	si, si
		jmp	short loc_9A285

loc_9A230:
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_158], ax
		mov	ax, word ptr [bp+var_158]
		mov	[di+1Bh], ax
		mov	word ptr [bp+var_15A], si
		inc	si
		mov	bx, word ptr [bp+var_158+2]
		mov	ax, word ptr [bp+var_15A]
		mov	[bx+1Bh], ax
		cmp	si, 5
		jle	short loc_9A26B
		xor	si, si

loc_9A26B:
		jmp	short loc_9A278
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9A278
		jmp	short loc_9A2A0

loc_9A278:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9A285:
		cmp	word ptr [bp+var_D56+1], 10h
		jnb	short loc_9A293
		cmp	byte ptr [bp+var_D56+3], 0
		jz	short loc_9A298

loc_9A293:
		mov	ax, 1
		jmp	short loc_9A29A

loc_9A298:
		xor	ax, ax

loc_9A29A:
		mov	ah, 0
		or	ax, ax
		jz	short loc_9A230

loc_9A2A0:
		lea	ax, word ptr [bp+var_14A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_140+1], 0
		jz	short loc_9A2D5
		cmp	[bp+var_144], 0
		jz	short loc_9A2D5
		push	0
		mov	al, byte ptr [bp+var_140]
		push	ax
		lea	ax, word ptr [bp+var_144]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A2D5

loc_9A2D5:
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_13E], 0
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_9A314
		cmp	[bp+var_13A], 0
		jz	short loc_9A314
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A314

loc_9A314:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		cmp	[bp+var_12B], 0
		jz	short loc_9A353
		cmp	[bp+var_130], 0
		jz	short loc_9A353
		push	0
		mov	al, [bp+var_12C]
		push	ax
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A353

loc_9A353:
		mov	[bp+var_130], 0
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		push	0
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_9A383
		jmp	loc_9A6EE

loc_9A383:
		cmp	[bp+var_9F], 0
		jz	short loc_9A3AB
		cmp	[bp+var_A4], 0
		jz	short loc_9A3AB
		push	0
		mov	al, [bp+var_A0]
		push	ax
		lea	ax, word ptr [bp+var_A4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A3AB

loc_9A3AB:
		mov	[bp+var_A4], 0
		mov	[bp+var_9F], 0
		mov	[bp+var_9E], 0
		mov	[bp+var_D50], 129Fh
		lea	ax, [bp+var_D50]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_D3B], 0
		jz	short loc_9A3FD
		cmp	[bp+var_D40], 0
		jz	short loc_9A3FD
		push	0
		mov	al, [bp+var_D3C]
		push	ax
		lea	ax, word ptr [bp+var_D40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A3FD

loc_9A3FD:
		mov	[bp+var_D40], 0
		mov	[bp+var_D3B], 0
		mov	[bp+var_D3A], 0
		lea	ax, [bp+var_52A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_526]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_51C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_9A467
		cmp	[bp+var_90], 0
		jz	short loc_9A467
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A467

loc_9A467:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_7A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_74]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_63], 0
		jz	short loc_9A4EE
		cmp	[bp+var_68], 0
		jz	short loc_9A4EE
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A4EE

loc_9A4EE:
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		cmp	[bp+var_59], 0
		jz	short loc_9A526
		cmp	[bp+var_5E], 0
		jz	short loc_9A526
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A526

loc_9A526:
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		cmp	[bp+var_4F], 0
		jz	short loc_9A55E
		cmp	[bp+var_54], 0
		jz	short loc_9A55E
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A55E

loc_9A55E:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_9A596
		cmp	[bp+var_4A], 0
		jz	short loc_9A596
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A596

loc_9A596:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		cmp	[bp+var_3B], 0
		jz	short loc_9A5CE
		cmp	[bp+var_40], 0
		jz	short loc_9A5CE
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A5CE

loc_9A5CE:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_9A606
		cmp	[bp+var_36], 0
		jz	short loc_9A606
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A606

loc_9A606:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_42C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_3B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2C4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_24A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_22A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9A696
		cmp	[bp+var_28], 0
		jz	short loc_9A696
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9A696

loc_9A696:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_212]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_204]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_9A6EE:
		mov	[bp+var_AE], 0
		mov	[bp+var_AA], 2
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	17h
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_B1], 0
		lea	ax, word ptr [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_BE], 0
		mov	[bp+var_BA], 2
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		push	2
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	11h
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_C1], 0
		lea	ax, word ptr [bp+var_BE]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_CE], 0
		mov	[bp+var_CA], 2
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		push	2
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	0Dh
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_D1], 0
		lea	ax, word ptr [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D4]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_DE], 0
		mov	[bp+var_DA], 2
		mov	[bp+var_D9], 0
		mov	[bp+var_D8], 0
		push	3
		lea	ax, word ptr [bp+var_DE]
		push	ax
		push	18h
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E8], 0
		mov	[bp+var_E4], 2
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	3
		lea	ax, word ptr [bp+var_E8]
		push	ax
		push	0
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_F2], 0
		mov	[bp+var_EE], 2
		mov	[bp+var_ED], 0
		mov	[bp+var_EC], 0
		push	3
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	8
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_130], 0
		mov	[bp+var_12C], 2
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		lea	ax, [bp+var_204]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFE7h
		push	0
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_134+2], ax
		push	1
		push	0
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_134], ax
		push	word ptr [bp+var_134]
		push	word ptr [bp+var_134+2]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_134+2]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0FFECh
		push	0
		lea	ax, word ptr [bp+var_DE]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_138+2], ax
		push	word ptr [bp+var_138+2]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	5
		push	0
		lea	ax, word ptr [bp+var_E8]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_138], ax
		push	word ptr [bp+var_138]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0FFF8h
		push	0
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13A], ax
		push	word ptr [bp+var_13A]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_B4]
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_D4]
		mov	al, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_C4]
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	word ptr [bp+var_13E+2], 3
		mov	di, 0FFFFh
		mov	word ptr [bp+var_13E], 1
		jmp	loc_9AAAD

loc_9A9DF:
		mov	si, word ptr [bp+var_D56+1]
		cmp	si, 1
		jnz	short loc_9A9FF
		mov	ax, word ptr [bp+var_13E]
		mov	word ptr [bp+var_140], ax
		inc	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13A]
		mov	ax, word ptr [bp+var_140]
		mov	[bx+1Bh], ax

loc_9A9FF:
		cmp	si, 0Ah
		jle	short loc_9AA21
		test	si, 1
		jz	short loc_9AA21
		mov	ax, word ptr [bp+var_13E]
		mov	word ptr [bp+var_142], ax
		inc	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13A]
		mov	ax, word ptr [bp+var_142]
		mov	[bx+1Bh], ax

loc_9AA21:
		add	word ptr [bp+var_13E+2], di
		cmp	word ptr [bp+var_13E+2], 0
		jge	short loc_9AA32
		mov	word ptr [bp+var_13E+2], 0

loc_9AA32:
		mov	ax, word ptr [bp+var_13E+2]
		mov	word ptr [bp+var_144], ax
		mov	bx, word ptr [bp+var_138]
		mov	ax, word ptr [bp+var_144]
		mov	[bx+1Bh], ax
		cmp	si, 2
		jnz	short loc_9AA4D
		mov	di, 1

loc_9AA4D:
		cmp	si, 3
		jnz	short loc_9AA55
		mov	di, 0FFFFh

loc_9AA55:
		cmp	si, 4
		jnz	short loc_9AA5D
		mov	di, 1

loc_9AA5D:
		cmp	si, 5
		jnz	short loc_9AA65
		mov	di, 0FFFFh

loc_9AA65:
		cmp	si, 7
		jnz	short loc_9AA6D
		mov	di, 1

loc_9AA6D:
		cmp	si, 9
		jnz	short loc_9AA75
		mov	di, 0FFFFh

loc_9AA75:
		cmp	si, 0Ah
		jnz	short loc_9AA7D
		mov	di, 1

loc_9AA7D:
		cmp	si, 0Ch
		jnz	short loc_9AA84
		xor	di, di

loc_9AA84:
		cmp	si, 10h
		jnz	short loc_9AA8C
		mov	di, 1

loc_9AA8C:
		cmp	si, 14h
		jnz	short loc_9AA93
		xor	di, di

loc_9AA93:
		jmp	short loc_9AAA0
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9AAA0
		jmp	short loc_9AACB

loc_9AAA0:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9AAAD:
		cmp	word ptr [bp+var_D56+1], 28h
		jnb	short loc_9AABB
		cmp	byte ptr [bp+var_D56+3], 0
		jz	short loc_9AAC0

loc_9AABB:
		mov	ax, 1
		jmp	short loc_9AAC2

loc_9AAC0:
		xor	ax, ax

loc_9AAC2:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9AACB
		jmp	loc_9A9DF

loc_9AACB:
		mov	word ptr [bp+var_13E+2], 6
		mov	[bp+var_6], 16h
		mov	ax, word ptr [bp+var_D56+1]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	di, dx
		jmp	loc_9AB82

loc_9AAF5:
		mov	si, word ptr [bp+var_D56+1]
		test	si, 1
		jz	short loc_9AB1D
		cmp	word ptr [bp+var_13E], 21h
		jge	short loc_9AB1D
		mov	ax, word ptr [bp+var_13E]
		mov	word ptr [bp+var_140], ax
		inc	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13A]
		mov	ax, word ptr [bp+var_140]
		mov	[bx+1Bh], ax

loc_9AB1D:
		mov	ax, word ptr [bp+var_13E+2]
		mov	word ptr [bp+var_142], ax
		inc	word ptr [bp+var_13E+2]
		mov	bx, word ptr [bp+var_138]
		mov	ax, word ptr [bp+var_142]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_13E+2], 0Dh
		jle	short loc_9AB41
		mov	word ptr [bp+var_13E+2], 0Dh

loc_9AB41:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, si
		jnz	short loc_9AB59
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9AB59:
		jmp	short loc_9AB75
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9AB75
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_9AB9F

loc_9AB75:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9AB82:
		cmp	word ptr [bp+var_D56+1], di
		jnb	short loc_9AB8F
		cmp	byte ptr [bp+var_D56+3], 0
		jz	short loc_9AB94

loc_9AB8F:
		mov	ax, 1
		jmp	short loc_9AB96

loc_9AB94:
		xor	ax, ax

loc_9AB96:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9AB9F
		jmp	loc_9AAF5

loc_9AB9F:
		cmp	[bp+var_C], 0
		jz	short loc_9ABB2
		lea	ax, [bp+var_D50]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_9ABB2:
		push	0
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	[bp+var_12B], 0
		jz	short loc_9ABE9
		cmp	[bp+var_130], 0
		jz	short loc_9ABE9
		push	0
		mov	al, [bp+var_12C]
		push	ax
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9ABE9

loc_9ABE9:
		mov	[bp+var_130], 0
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		cmp	byte_4F55C, 0
		jnz	short loc_9AC0A
		jmp	loc_9B116

loc_9AC0A:
		cmp	[bp+var_ED], 0
		jz	short loc_9AC32
		cmp	[bp+var_F2], 0
		jz	short loc_9AC32
		push	0
		mov	al, [bp+var_EE]
		push	ax
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9AC32

loc_9AC32:
		mov	[bp+var_F2], 0
		mov	[bp+var_ED], 0
		mov	[bp+var_EC], 0
		cmp	[bp+var_E3], 0
		jz	short loc_9AC71
		cmp	[bp+var_E8], 0
		jz	short loc_9AC71
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, word ptr [bp+var_E8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9AC71

loc_9AC71:
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		cmp	[bp+var_D9], 0
		jz	short loc_9ACB0
		cmp	[bp+var_DE], 0
		jz	short loc_9ACB0
		push	0
		mov	al, [bp+var_DA]
		push	ax
		lea	ax, word ptr [bp+var_DE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9ACB0

loc_9ACB0:
		mov	[bp+var_DE], 0
		mov	[bp+var_D9], 0
		mov	[bp+var_D8], 0
		lea	ax, [bp+var_D4]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C9], 0
		jz	short loc_9ACFC
		cmp	[bp+var_CE], 0
		jz	short loc_9ACFC
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9ACFC

loc_9ACFC:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		lea	ax, [bp+var_C4]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_B9], 0
		jz	short loc_9AD48
		cmp	[bp+var_BE], 0
		jz	short loc_9AD48
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9AD48

loc_9AD48:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		lea	ax, [bp+var_B4]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A9], 0
		jz	short loc_9AD94
		cmp	[bp+var_AE], 0
		jz	short loc_9AD94
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9AD94

loc_9AD94:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		cmp	[bp+var_9F], 0
		jz	short loc_9ADD3
		cmp	[bp+var_A4], 0
		jz	short loc_9ADD3
		push	0
		mov	al, [bp+var_A0]
		push	ax
		lea	ax, word ptr [bp+var_A4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9ADD3

loc_9ADD3:
		mov	[bp+var_A4], 0
		mov	[bp+var_9F], 0
		mov	[bp+var_9E], 0
		mov	[bp+var_D50], 129Fh
		lea	ax, [bp+var_D50]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_D3B], 0
		jz	short loc_9AE25
		cmp	[bp+var_D40], 0
		jz	short loc_9AE25
		push	0
		mov	al, [bp+var_D3C]
		push	ax
		lea	ax, word ptr [bp+var_D40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9AE25

loc_9AE25:
		mov	[bp+var_D40], 0
		mov	[bp+var_D3B], 0
		mov	[bp+var_D3A], 0
		lea	ax, [bp+var_52A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_526]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_51C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_9AE8F
		cmp	[bp+var_90], 0
		jz	short loc_9AE8F
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9AE8F

loc_9AE8F:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_7A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_74]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_63], 0
		jz	short loc_9AF16
		cmp	[bp+var_68], 0
		jz	short loc_9AF16
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9AF16

loc_9AF16:
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		cmp	[bp+var_59], 0
		jz	short loc_9AF4E
		cmp	[bp+var_5E], 0
		jz	short loc_9AF4E
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9AF4E

loc_9AF4E:
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		cmp	[bp+var_4F], 0
		jz	short loc_9AF86
		cmp	[bp+var_54], 0
		jz	short loc_9AF86
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9AF86

loc_9AF86:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_9AFBE
		cmp	[bp+var_4A], 0
		jz	short loc_9AFBE
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9AFBE

loc_9AFBE:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		cmp	[bp+var_3B], 0
		jz	short loc_9AFF6
		cmp	[bp+var_40], 0
		jz	short loc_9AFF6
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9AFF6

loc_9AFF6:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_9B02E
		cmp	[bp+var_36], 0
		jz	short loc_9B02E
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9B02E

loc_9B02E:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_42C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_3B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2C4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_24A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_22A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9B0BE
		cmp	[bp+var_28], 0
		jz	short loc_9B0BE
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9B0BE

loc_9B0BE:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_212]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_204]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_9B116:
		lea	ax, [bp+var_204]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_130], 0
		mov	[bp+var_12C], 2
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		push	3
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	2C1Bh
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	[bp+var_74]
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_6E]
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0FFC1h
		push	0
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_134+2], ax
		push	word ptr [bp+var_134+2]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0
		lea	ax, word ptr [bp+var_A4]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_134], ax
		push	word ptr [bp+var_134]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	di, ax
		push	di
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	19h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_24C]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_138+2], ax
		push	word ptr [bp+var_138+2]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13E+2], 2
		mov	byte ptr [bp+var_13E+3], 0
		mov	[bp+var_13A], 0
		mov	[bp+var_D7C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D7A], ax
		lea	ax, [bp+var_D7C]
		mov	word_4D392, ax
		mov	[bp+var_D7C], 1BCh
		mov	[bp+var_D78], 0
		mov	[bp+var_D74], 0
		mov	word ptr [bp+var_D82+2], 0
		mov	[bp+var_D7E], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_9B2E8
		jmp	loc_9B367

loc_9B2E8:
		push	3
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	5
		lea	ax, [bp+var_51C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_140]
		push	ax
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF7E
		mov	word ptr [bp+var_142], ax
		mov	word ptr [bp+var_144], 0
		cmp	word ptr [bp+var_D82+2], 0
		jz	short loc_9B367
		push	[bp+var_D7E]
		mov	bx, word ptr [bp+var_D82+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_142]
		push	[bp+var_D7E]
		mov	bx, word ptr [bp+var_D82+2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_9B367

loc_9B367:
		xor	si, si
		mov	word ptr [bp+var_148+2], 1
		cmp	[bp+var_C], 0
		jnz	short loc_9B378
		jmp	loc_9B557

loc_9B378:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14E+2], 2
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		push	2
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	0
		lea	ax, [bp+var_4A4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	di
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_154+2], 0
		jmp	short loc_9B3E0

loc_9B3CF:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_154+2]

loc_9B3E0:
		cmp	word ptr [bp+var_154+2], 3
		jl	short loc_9B3CF
		jmp	loc_9B46C

loc_9B3EA:
		or	si, si
		jnz	short loc_9B40F
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_9B40F
		mov	si, 0FFFFh
		jmp	short loc_9B420

loc_9B40F:
		cmp	si, 0FFFFh
		jnz	short loc_9B419
		mov	si, 1
		jmp	short loc_9B420

loc_9B419:
		cmp	si, 1
		jnz	short loc_9B420
		xor	si, si

loc_9B420:
		push	si
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	si
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	si
		push	0
		push	word ptr [bp+var_138+2]
		mov	bx, word ptr [bp+var_138+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_9B45F
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9B45F
		jmp	short loc_9B47C

loc_9B45F:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9B46C:
		push	di
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_9B47C
		jmp	loc_9B3EA

loc_9B47C:
		mov	word ptr [bp+var_154+2], 0
		jmp	loc_9B50B

loc_9B485:
		or	si, si
		jnz	short loc_9B4AA
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_9B4AA
		mov	si, 0FFFFh
		jmp	short loc_9B4BB

loc_9B4AA:
		cmp	si, 0FFFFh
		jnz	short loc_9B4B4
		mov	si, 1
		jmp	short loc_9B4BB

loc_9B4B4:
		cmp	si, 1
		jnz	short loc_9B4BB
		xor	si, si

loc_9B4BB:
		push	si
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	si
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	si
		push	0
		push	word ptr [bp+var_138+2]
		mov	bx, word ptr [bp+var_138+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_9B4FA
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9B4FA
		jmp	short loc_9B515

loc_9B4FA:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_154+2]

loc_9B50B:
		cmp	word ptr [bp+var_154+2], 0Ah
		jge	short loc_9B515
		jmp	loc_9B485

loc_9B515:
		cmp	byte ptr [bp+var_14E+3], 0
		jz	short loc_9B53D
		cmp	[bp+var_150], 0
		jz	short loc_9B53D
		push	0
		mov	al, byte ptr [bp+var_14E+2]
		push	ax
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9B53D

loc_9B53D:
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		jmp	loc_9B7E2

loc_9B557:
		mov	[bp+var_6], 3Ah
		mov	ax, word ptr [bp+var_D56+1]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_9B671

loc_9B57C:
		mov	ax, word ptr [bp+var_D56+1]
		mov	word ptr [bp+var_148], ax
		or	si, si
		jnz	short loc_9B5A9
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_9B5A9
		mov	si, 0FFFFh
		jmp	short loc_9B5BA

loc_9B5A9:
		cmp	si, 0FFFFh
		jnz	short loc_9B5B3
		mov	si, 1
		jmp	short loc_9B5BA

loc_9B5B3:
		cmp	si, 1
		jnz	short loc_9B5BA
		xor	si, si

loc_9B5BA:
		push	si
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	si
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	si
		push	0
		push	word ptr [bp+var_138+2]
		mov	bx, word ptr [bp+var_138+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		add	word ptr [bp+var_148+2], si
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, word ptr [bp+var_148]
		jnz	short loc_9B617
		mov	ax, [bp+var_A]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_24C]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_9B617:
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, word ptr [bp+var_148]
		jnz	short loc_9B62F
		push	2C1Fh
		push	di
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_9B62F:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, word ptr [bp+var_148]
		jnz	short loc_9B648
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9B648:
		jmp	short loc_9B664
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9B664
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_9B691

loc_9B664:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9B671:
		mov	ax, word ptr [bp+var_D56+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_9B681
		cmp	byte ptr [bp+var_D56+3], 0
		jz	short loc_9B686

loc_9B681:
		mov	ax, 1
		jmp	short loc_9B688

loc_9B686:
		xor	ax, ax

loc_9B688:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9B691
		jmp	loc_9B57C

loc_9B691:
		mov	[bp+var_6], 37h
		mov	ax, word ptr [bp+var_D56+1]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_9B7C2

loc_9B6B6:
		mov	ax, word ptr [bp+var_D56+1]
		mov	word ptr [bp+var_148], ax
		or	si, si
		jnz	short loc_9B6E3
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_9B6E3
		mov	si, 0FFFFh
		jmp	short loc_9B6F4

loc_9B6E3:
		cmp	si, 0FFFFh
		jnz	short loc_9B6ED
		mov	si, 1
		jmp	short loc_9B6F4

loc_9B6ED:
		cmp	si, 1
		jnz	short loc_9B6F4
		xor	si, si

loc_9B6F4:
		push	si
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	si
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	si
		push	0
		push	word ptr [bp+var_138+2]
		mov	bx, word ptr [bp+var_138+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		add	word ptr [bp+var_148+2], si
		mov	ax, [bp+var_2]
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_148]
		jnz	short loc_9B751
		mov	ax, [bp+var_A]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_24C]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_9B751:
		mov	ax, [bp+var_2]
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_148]
		jnz	short loc_9B769
		push	2C38h
		push	di
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_9B769:
		mov	ax, [bp+var_2]
		add	ax, 8
		cmp	ax, word ptr [bp+var_148]
		jnz	short loc_9B780
		push	0Eh
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_9B780:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, word ptr [bp+var_148]
		jnz	short loc_9B799
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9B799:
		jmp	short loc_9B7B5
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9B7B5
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_9B7E2

loc_9B7B5:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9B7C2:
		mov	ax, word ptr [bp+var_D56+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_9B7D2
		cmp	byte ptr [bp+var_D56+3], 0
		jz	short loc_9B7D7

loc_9B7D2:
		mov	ax, 1
		jmp	short loc_9B7D9

loc_9B7D7:
		xor	ax, ax

loc_9B7D9:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9B7E2
		jmp	loc_9B6B6

loc_9B7E2:
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D7C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_13E+3], 0
		jz	short loc_9B826
		cmp	[bp+var_140], 0
		jz	short loc_9B826
		push	0
		mov	al, byte ptr [bp+var_13E+2]
		push	ax
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9B826

loc_9B826:
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13E+3], 0
		mov	[bp+var_13A], 0
		cmp	[bp+var_12B], 0
		jz	short loc_9B865
		cmp	[bp+var_130], 0
		jz	short loc_9B865
		push	0
		mov	al, [bp+var_12C]
		push	ax
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9B865

loc_9B865:
		mov	[bp+var_130], 0
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		push	0
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_9B895
		jmp	loc_9BDA1

loc_9B895:
		cmp	[bp+var_ED], 0
		jz	short loc_9B8BD
		cmp	[bp+var_F2], 0
		jz	short loc_9B8BD
		push	0
		mov	al, [bp+var_EE]
		push	ax
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9B8BD

loc_9B8BD:
		mov	[bp+var_F2], 0
		mov	[bp+var_ED], 0
		mov	[bp+var_EC], 0
		cmp	[bp+var_E3], 0
		jz	short loc_9B8FC
		cmp	[bp+var_E8], 0
		jz	short loc_9B8FC
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, word ptr [bp+var_E8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9B8FC

loc_9B8FC:
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		cmp	[bp+var_D9], 0
		jz	short loc_9B93B
		cmp	[bp+var_DE], 0
		jz	short loc_9B93B
		push	0
		mov	al, [bp+var_DA]
		push	ax
		lea	ax, word ptr [bp+var_DE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9B93B

loc_9B93B:
		mov	[bp+var_DE], 0
		mov	[bp+var_D9], 0
		mov	[bp+var_D8], 0
		lea	ax, [bp+var_D4]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C9], 0
		jz	short loc_9B987
		cmp	[bp+var_CE], 0
		jz	short loc_9B987
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9B987

loc_9B987:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		lea	ax, [bp+var_C4]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_B9], 0
		jz	short loc_9B9D3
		cmp	[bp+var_BE], 0
		jz	short loc_9B9D3
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9B9D3

loc_9B9D3:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		lea	ax, [bp+var_B4]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A9], 0
		jz	short loc_9BA1F
		cmp	[bp+var_AE], 0
		jz	short loc_9BA1F
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9BA1F

loc_9BA1F:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		cmp	[bp+var_9F], 0
		jz	short loc_9BA5E
		cmp	[bp+var_A4], 0
		jz	short loc_9BA5E
		push	0
		mov	al, [bp+var_A0]
		push	ax
		lea	ax, word ptr [bp+var_A4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9BA5E

loc_9BA5E:
		mov	[bp+var_A4], 0
		mov	[bp+var_9F], 0
		mov	[bp+var_9E], 0
		mov	[bp+var_D50], 129Fh
		lea	ax, [bp+var_D50]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_D3B], 0
		jz	short loc_9BAB0
		cmp	[bp+var_D40], 0
		jz	short loc_9BAB0
		push	0
		mov	al, [bp+var_D3C]
		push	ax
		lea	ax, word ptr [bp+var_D40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9BAB0

loc_9BAB0:
		mov	[bp+var_D40], 0
		mov	[bp+var_D3B], 0
		mov	[bp+var_D3A], 0
		lea	ax, [bp+var_52A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_526]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_51C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_9BB1A
		cmp	[bp+var_90], 0
		jz	short loc_9BB1A
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9BB1A

loc_9BB1A:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_7A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_74]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_63], 0
		jz	short loc_9BBA1
		cmp	[bp+var_68], 0
		jz	short loc_9BBA1
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9BBA1

loc_9BBA1:
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		cmp	[bp+var_59], 0
		jz	short loc_9BBD9
		cmp	[bp+var_5E], 0
		jz	short loc_9BBD9
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9BBD9

loc_9BBD9:
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		cmp	[bp+var_4F], 0
		jz	short loc_9BC11
		cmp	[bp+var_54], 0
		jz	short loc_9BC11
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9BC11

loc_9BC11:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_9BC49
		cmp	[bp+var_4A], 0
		jz	short loc_9BC49
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9BC49

loc_9BC49:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		cmp	[bp+var_3B], 0
		jz	short loc_9BC81
		cmp	[bp+var_40], 0
		jz	short loc_9BC81
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9BC81

loc_9BC81:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_9BCB9
		cmp	[bp+var_36], 0
		jz	short loc_9BCB9
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9BCB9

loc_9BCB9:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_42C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_3B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2C4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_24A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_22A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9BD49
		cmp	[bp+var_28], 0
		jz	short loc_9BD49
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9BD49

loc_9BD49:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_212]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_204]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_9BDA1:
		push	ds
		push	offset aVoc_5
		push	ds
		push	offset aExplode2
		push	ds
		push	offset aDataMidgamesMid1
		lea	ax, [bp+var_1F6]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	2
		lea	ax, word ptr [bp+var_FC]
		push	ax
		push	12h
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_FF], 0
		lea	ax, word ptr [bp+var_FC]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_10C], 0
		mov	[bp+var_108], 2
		mov	[bp+var_107], 0
		mov	[bp+var_106], 0
		push	2
		lea	ax, word ptr [bp+var_10C]
		push	ax
		push	0Fh
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_10F], 0
		lea	ax, word ptr [bp+var_10C]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_11C], 0
		mov	[bp+var_118], 2
		mov	[bp+var_117], 0
		mov	[bp+var_116], 0
		push	3
		lea	ax, word ptr [bp+var_11C]
		push	ax
		push	2
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_126], 0
		mov	[bp+var_122], 2
		mov	[bp+var_121], 0
		mov	[bp+var_120], 0
		push	3
		lea	ax, word ptr [bp+var_126]
		push	ax
		push	3
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_130], 0
		mov	[bp+var_12C], 2
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		push	3
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	4
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_204]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	[bp+var_7A]
		mov	al, [bp+var_78]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_80]
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_112]
		mov	al, [bp+var_110]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_102]
		mov	al, [bp+var_100]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0FFDDh
		push	0
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_134+2], ax
		push	word ptr [bp+var_134+2]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0FFDDh
		push	0
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_134], ax
		push	word ptr [bp+var_134]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0FFB5h
		push	0
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_138+2], ax
		push	word ptr [bp+var_138+2]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	2
		push	38h
		push	0
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_138], ax
		push	word ptr [bp+var_138]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	6
		push	0
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13A], ax
		push	word ptr [bp+var_13A]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0FFFEh
		push	0FFECh
		lea	ax, word ptr [bp+var_11C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13E+2], ax
		push	word ptr [bp+var_13E+2]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0FFFEh
		push	0FFECh
		lea	ax, word ptr [bp+var_126]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13E], ax
		push	word ptr [bp+var_13E]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144], 2
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_142], 0
		push	2
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	9
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0FFBAh
		push	0
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_14A], ax
		push	word ptr [bp+var_14A]
		lea	ax, [bp+var_D72]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	bx, word ptr [bp+var_14A]
		mov	word ptr [bx+1Bh], 0
		mov	bx, word ptr [bp+var_13E]
		mov	word ptr [bx+1Bh], 0
		xor	di, di
		mov	word ptr [bp+var_14E+2], 0
		mov	word ptr [bp+var_14E], 0
		mov	word ptr [bp+var_150], 0
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_158+2], 2
		mov	byte ptr [bp+var_158+3], 0
		mov	[bp+var_154], 0
		mov	[bp+var_D7C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D7A], ax
		lea	ax, [bp+var_D7C]
		mov	word_4D392, ax
		mov	[bp+var_D7C], 1BCh
		mov	[bp+var_D78], 0
		mov	[bp+var_D74], 0
		mov	word ptr [bp+var_D82+2], 0
		mov	[bp+var_D7E], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_9C17C
		jmp	loc_9C1FB

loc_9C17C:
		push	3
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	69h
		lea	ax, [bp+var_51C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_15A]
		push	ax
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4F046
		mov	word ptr [bp+var_15E+2], ax
		mov	word ptr [bp+var_15E], 0
		cmp	word ptr [bp+var_D82+2], 0
		jz	short loc_9C1FB
		push	[bp+var_D7E]
		mov	bx, word ptr [bp+var_D82+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_15E]
		push	word ptr [bp+var_15E+2]
		push	[bp+var_D7E]
		mov	bx, word ptr [bp+var_D82+2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_9C1FB

loc_9C1FB:
		mov	[bp+var_168], 0
		mov	[bp+var_164], 2
		mov	[bp+var_163], 0
		mov	[bp+var_162], 0
		cmp	[bp+var_C], 0
		jz	short loc_9C245
		push	2
		lea	ax, word ptr [bp+var_168]
		push	ax
		push	1
		lea	ax, [bp+var_4A4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_168]
		push	ax
		lea	ax, [bp+var_D50]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4

loc_9C245:
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0D4h
		lea	ax, [bp+var_24C]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		jmp	loc_9C43D

loc_9C267:
		mov	si, word ptr [bp+var_D56+1]
		mov	ax, word ptr [bp+var_14E+2]
		mov	[bp+var_16A], ax
		inc	word ptr [bp+var_14E+2]
		mov	bx, word ptr [bp+var_14A]
		mov	ax, [bp+var_16A]
		mov	[bx+1Bh], ax
		cmp	si, 28h
		jge	short loc_9C29B
		push	1
		push	0
		push	word ptr [bp+var_14A]
		mov	bx, word ptr [bp+var_14A]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_9C29B:
		cmp	si, 28h
		jle	short loc_9C2BF
		cmp	si, 3Ch
		jge	short loc_9C2BF
		test	si, 1
		jz	short loc_9C2BF
		push	1
		push	0
		push	word ptr [bp+var_14A]
		mov	bx, word ptr [bp+var_14A]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_9C2BF:
		cmp	si, 14h
		jnz	short loc_9C2D9
		cmp	[bp+var_C], 0
		jz	short loc_9C2D9
		push	0FFFFh
		lea	ax, [bp+var_D50]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4

loc_9C2D9:
		cmp	si, 14h
		jnz	short loc_9C300
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9C300
		mov	ax, [bp+var_A]
		shl	ax, 3
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_24C]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_9C300:
		cmp	si, 3Ch
		jnz	short loc_9C31D
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9C31D
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9C31D:
		or	si, si
		jle	short loc_9C336
		cmp	si, 5
		jge	short loc_9C336
		mov	[bp+var_16C], di
		inc	di
		mov	bx, word ptr [bp+var_13E]
		mov	ax, [bp+var_16C]
		mov	[bx+1Bh], ax

loc_9C336:
		cmp	si, 5
		jle	short loc_9C357
		cmp	si, 0Fh
		jge	short loc_9C357
		mov	ax, word ptr [bp+var_14E]
		mov	[bp+var_16E], ax
		inc	word ptr [bp+var_14E]
		mov	bx, word ptr [bp+var_13E+2]
		mov	ax, [bp+var_16E]
		mov	[bx+1Bh], ax

loc_9C357:
		cmp	si, 13h
		jle	short loc_9C377
		cmp	si, 33h
		jge	short loc_9C377
		test	si, 1
		jz	short loc_9C377
		mov	[bp+var_170], di
		inc	di
		mov	bx, word ptr [bp+var_13E]
		mov	ax, [bp+var_170]
		mov	[bx+1Bh], ax

loc_9C377:
		cmp	si, 33h
		jle	short loc_9C397
		cmp	si, 3Dh
		jge	short loc_9C397
		test	si, 1
		jz	short loc_9C397
		mov	word ptr [bp+var_174+2], di
		dec	di
		mov	bx, word ptr [bp+var_13E]
		mov	ax, word ptr [bp+var_174+2]
		mov	[bx+1Bh], ax

loc_9C397:
		cmp	si, 3Dh
		jle	short loc_9C3B7
		cmp	si, 47h
		jge	short loc_9C3B7
		test	si, 1
		jz	short loc_9C3B7
		mov	word ptr [bp+var_174], di
		inc	di
		mov	bx, word ptr [bp+var_13E]
		mov	ax, word ptr [bp+var_174]
		mov	[bx+1Bh], ax

loc_9C3B7:
		cmp	si, 2Dh
		jle	short loc_9C3D8
		cmp	si, 37h
		jge	short loc_9C3D8
		mov	ax, word ptr [bp+var_150]
		mov	[bp+var_176], ax
		inc	word ptr [bp+var_150]
		mov	bx, word ptr [bp+var_13E+2]
		mov	ax, [bp+var_176]
		mov	[bx+1Bh], ax

loc_9C3D8:
		cmp	si, 57h
		jnz	short loc_9C3E0
		sub	di, 2

loc_9C3E0:
		cmp	si, 6Eh
		jnz	short loc_9C3F5
		mov	word ptr [bp+var_17A+2], di
		inc	di
		mov	bx, word ptr [bp+var_13E]
		mov	ax, word ptr [bp+var_17A+2]
		mov	[bx+1Bh], ax

loc_9C3F5:
		cmp	si, 8Dh
		jnz	short loc_9C40B
		mov	word ptr [bp+var_17A], di
		dec	di
		mov	bx, word ptr [bp+var_13E]
		mov	ax, word ptr [bp+var_17A]
		mov	[bx+1Bh], ax

loc_9C40B:
		jmp	short loc_9C430
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9C430
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9C42E
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9C42E:
		jmp	short loc_9C45C

loc_9C430:
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9C43D:
		cmp	word ptr [bp+var_D56+1], 0BAh
		jnb	short loc_9C44C
		cmp	byte ptr [bp+var_D56+3], 0
		jz	short loc_9C451

loc_9C44C:
		mov	ax, 1
		jmp	short loc_9C453

loc_9C451:
		xor	ax, ax

loc_9C453:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9C45C
		jmp	loc_9C267

loc_9C45C:
		cmp	[bp+var_C], 0
		jz	short loc_9C46F
		lea	ax, [bp+var_D50]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_9C46F:
		mov	word ptr [bp+var_D56+1], 0
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		cmp	[bp+var_163], 0
		jz	short loc_9C4B4
		cmp	[bp+var_168], 0
		jz	short loc_9C4B4
		push	0
		mov	al, [bp+var_164]
		push	ax
		lea	ax, word ptr [bp+var_168]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C4B4

loc_9C4B4:
		mov	[bp+var_168], 0
		mov	[bp+var_163], 0
		mov	[bp+var_162], 0
		lea	ax, word ptr [bp+var_D82+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D7C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_158+3], 0
		jz	short loc_9C50F
		cmp	[bp+var_15A], 0
		jz	short loc_9C50F
		push	0
		mov	al, byte ptr [bp+var_158+2]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C50F

loc_9C50F:
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_158+3], 0
		mov	[bp+var_154], 0
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_9C54E
		cmp	[bp+var_148], 0
		jz	short loc_9C54E
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C54E

loc_9C54E:
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_142], 0
		push	0
		lea	ax, [bp+var_D72]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	[bp+var_12B], 0
		jz	short loc_9C59C
		cmp	[bp+var_130], 0
		jz	short loc_9C59C
		push	0
		mov	al, [bp+var_12C]
		push	ax
		lea	ax, word ptr [bp+var_130]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C59C

loc_9C59C:
		mov	[bp+var_130], 0
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		cmp	[bp+var_121], 0
		jz	short loc_9C5DB
		cmp	[bp+var_126], 0
		jz	short loc_9C5DB
		push	0
		mov	al, [bp+var_122]
		push	ax
		lea	ax, word ptr [bp+var_126]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C5DB

loc_9C5DB:
		mov	[bp+var_126], 0
		mov	[bp+var_121], 0
		mov	[bp+var_120], 0
		cmp	[bp+var_117], 0
		jz	short loc_9C61A
		cmp	[bp+var_11C], 0
		jz	short loc_9C61A
		push	0
		mov	al, [bp+var_118]
		push	ax
		lea	ax, word ptr [bp+var_11C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C61A

loc_9C61A:
		mov	[bp+var_11C], 0
		mov	[bp+var_117], 0
		mov	[bp+var_116], 0
		lea	ax, [bp+var_112]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_107], 0
		jz	short loc_9C666
		cmp	[bp+var_10C], 0
		jz	short loc_9C666
		push	0
		mov	al, [bp+var_108]
		push	ax
		lea	ax, word ptr [bp+var_10C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C666

loc_9C666:
		mov	[bp+var_10C], 0
		mov	[bp+var_107], 0
		mov	[bp+var_106], 0
		lea	ax, [bp+var_102]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_F7], 0
		jz	short loc_9C6B2
		cmp	[bp+var_FC], 0
		jz	short loc_9C6B2
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, word ptr [bp+var_FC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C6B2

loc_9C6B2:
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	[bp+var_ED], 0
		jz	short loc_9C6F1
		cmp	[bp+var_F2], 0
		jz	short loc_9C6F1
		push	0
		mov	al, [bp+var_EE]
		push	ax
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C6F1

loc_9C6F1:
		mov	[bp+var_F2], 0
		mov	[bp+var_ED], 0
		mov	[bp+var_EC], 0
		cmp	[bp+var_E3], 0
		jz	short loc_9C730
		cmp	[bp+var_E8], 0
		jz	short loc_9C730
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, word ptr [bp+var_E8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C730

loc_9C730:
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		cmp	[bp+var_D9], 0
		jz	short loc_9C76F
		cmp	[bp+var_DE], 0
		jz	short loc_9C76F
		push	0
		mov	al, [bp+var_DA]
		push	ax
		lea	ax, word ptr [bp+var_DE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C76F

loc_9C76F:
		mov	[bp+var_DE], 0
		mov	[bp+var_D9], 0
		mov	[bp+var_D8], 0
		lea	ax, [bp+var_D4]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C9], 0
		jz	short loc_9C7BB
		cmp	[bp+var_CE], 0
		jz	short loc_9C7BB
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C7BB

loc_9C7BB:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		lea	ax, [bp+var_C4]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_B9], 0
		jz	short loc_9C807
		cmp	[bp+var_BE], 0
		jz	short loc_9C807
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C807

loc_9C807:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		lea	ax, [bp+var_B4]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A9], 0
		jz	short loc_9C853
		cmp	[bp+var_AE], 0
		jz	short loc_9C853
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C853

loc_9C853:
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		cmp	[bp+var_9F], 0
		jz	short loc_9C892
		cmp	[bp+var_A4], 0
		jz	short loc_9C892
		push	0
		mov	al, [bp+var_A0]
		push	ax
		lea	ax, word ptr [bp+var_A4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C892

loc_9C892:
		mov	[bp+var_A4], 0
		mov	[bp+var_9F], 0
		mov	[bp+var_9E], 0
		mov	[bp+var_D50], 129Fh
		lea	ax, [bp+var_D50]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_D3B], 0
		jz	short loc_9C8E4
		cmp	[bp+var_D40], 0
		jz	short loc_9C8E4
		push	0
		mov	al, [bp+var_D3C]
		push	ax
		lea	ax, word ptr [bp+var_D40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C8E4

loc_9C8E4:
		mov	[bp+var_D40], 0
		mov	[bp+var_D3B], 0
		mov	[bp+var_D3A], 0
		lea	ax, [bp+var_52A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_526]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_51C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_9C94E
		cmp	[bp+var_90], 0
		jz	short loc_9C94E
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C94E

loc_9C94E:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_7A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_74]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_63], 0
		jz	short loc_9C9D5
		cmp	[bp+var_68], 0
		jz	short loc_9C9D5
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9C9D5

loc_9C9D5:
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		cmp	[bp+var_59], 0
		jz	short loc_9CA0D
		cmp	[bp+var_5E], 0
		jz	short loc_9CA0D
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9CA0D

loc_9CA0D:
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		cmp	[bp+var_4F], 0
		jz	short loc_9CA45
		cmp	[bp+var_54], 0
		jz	short loc_9CA45
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9CA45

loc_9CA45:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_9CA7D
		cmp	[bp+var_4A], 0
		jz	short loc_9CA7D
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9CA7D

loc_9CA7D:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		cmp	[bp+var_3B], 0
		jz	short loc_9CAB5
		cmp	[bp+var_40], 0
		jz	short loc_9CAB5
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9CAB5

loc_9CAB5:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_9CAED
		cmp	[bp+var_36], 0
		jz	short loc_9CAED
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9CAED

loc_9CAED:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_42C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_3B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2C4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_24A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_22A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9CB7D
		cmp	[bp+var_28], 0
		jz	short loc_9CB7D
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9CB7D

loc_9CB7D:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_212]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_204]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_974D0		endp

; START OF FUNCTION CHUNK FOR sub_974D0
off_9CBD5	dw offset loc_97B38
		dw offset loc_97CB1
		dw offset loc_97CB1
		dw offset loc_97CB1
		dw offset loc_97CB1
; END OF FUNCTION CHUNK FOR sub_974D0
ovr210		ends
