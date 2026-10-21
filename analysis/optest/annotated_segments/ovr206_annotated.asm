ovr206		segment	para public 'OVERLAY' use16
		assume cs:ovr206
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_9E080	proc far		; CODE XREF: sub_42590J

var_E08		= word ptr -0E08h
var_DD8		= word ptr -0DD8h
var_DAB		= dword	ptr -0DABh
var_DA7		= dword	ptr -0DA7h
var_DA3		= dword	ptr -0DA3h
var_D9E		= word ptr -0D9Eh
var_D9C		= word ptr -0D9Ch
var_D9A		= dword	ptr -0D9Ah
var_D96		= word ptr -0D96h
var_D92		= dword	ptr -0D92h
var_D8E		= word ptr -0D8Eh
var_D8C		= dword	ptr -0D8Ch
var_D88		= byte ptr -0D88h
var_D87		= byte ptr -0D87h
var_D86		= dword	ptr -0D86h
var_D82		= word ptr -0D82h
var_D6E		= word ptr -0D6Eh
var_D6C		= word ptr -0D6Ch
var_D6A		= dword	ptr -0D6Ah
var_D66		= byte ptr -0D66h
var_D65		= word ptr -0D65h
var_D63		= byte ptr -0D63h
var_D60		= word ptr -0D60h
var_D5E		= word ptr -0D5Eh
var_D50		= dword	ptr -0D50h
var_D4C		= byte ptr -0D4Ch
var_D4B		= byte ptr -0D4Bh
var_D4A		= dword	ptr -0D4Ah
var_543		= dword	ptr -543h
var_53F		= dword	ptr -53Fh
var_53A		= word ptr -53Ah
var_538		= word ptr -538h
var_536		= dword	ptr -536h
var_532		= byte ptr -532h
var_531		= byte ptr -531h
var_530		= dword	ptr -530h
var_52C		= word ptr -52Ch
var_4B4		= word ptr -4B4h
var_43C		= word ptr -43Ch
var_3C4		= word ptr -3C4h
var_34C		= word ptr -34Ch
var_2D4		= word ptr -2D4h
var_25C		= word ptr -25Ch
var_25A		= word ptr -25Ah
var_243		= word ptr -243h
var_241		= word ptr -241h
var_23F		= word ptr -23Fh
var_23D		= word ptr -23Dh
var_23A		= word ptr -23Ah
var_222		= word ptr -222h
var_220		= word ptr -220h
var_21E		= word ptr -21Eh
var_21C		= word ptr -21Ch
var_21A		= word ptr -21Ah
var_218		= word ptr -218h
var_214		= word ptr -214h
var_212		= word ptr -212h
var_210		= word ptr -210h
var_20E		= word ptr -20Eh
var_20C		= word ptr -20Ch
var_20A		= word ptr -20Ah
var_206		= word ptr -206h
var_1B6		= word ptr -1B6h
var_1B4		= word ptr -1B4h
var_1B2		= word ptr -1B2h
var_1B0		= word ptr -1B0h
var_1AE		= word ptr -1AEh
var_1AC		= word ptr -1ACh
var_1AA		= word ptr -1AAh
var_1A8		= word ptr -1A8h
var_1A6		= word ptr -1A6h
var_1A4		= word ptr -1A4h
var_1A2		= word ptr -1A2h
var_1A0		= word ptr -1A0h
var_19E		= word ptr -19Eh
var_19C		= word ptr -19Ch
var_19A		= word ptr -19Ah
var_198		= word ptr -198h
var_196		= word ptr -196h
var_194		= dword	ptr -194h
var_190		= byte ptr -190h
var_18F		= byte ptr -18Fh
var_18E		= dword	ptr -18Eh
var_18A		= dword	ptr -18Ah
var_186		= word ptr -186h
var_184		= dword	ptr -184h
var_180		= word ptr -180h
var_17E		= word ptr -17Eh
var_17C		= word ptr -17Ch
var_17A		= word ptr -17Ah
var_178		= dword	ptr -178h
var_174		= byte ptr -174h
var_173		= byte ptr -173h
var_172		= dword	ptr -172h
var_16E		= dword	ptr -16Eh
var_16A		= dword	ptr -16Ah
var_166		= byte ptr -166h
var_165		= byte ptr -165h
var_164		= dword	ptr -164h
var_160		= dword	ptr -160h
var_15C		= word ptr -15Ch
var_15A		= dword	ptr -15Ah
var_156		= word ptr -156h
var_154		= dword	ptr -154h
var_150		= dword	ptr -150h
var_14C		= word ptr -14Ch
var_14A		= dword	ptr -14Ah
var_146		= word ptr -146h
var_144		= dword	ptr -144h
var_140		= dword	ptr -140h
var_13C		= byte ptr -13Ch
var_13B		= byte ptr -13Bh
var_13A		= dword	ptr -13Ah
var_136		= dword	ptr -136h
var_132		= byte ptr -132h
var_131		= byte ptr -131h
var_130		= dword	ptr -130h
var_12C		= dword	ptr -12Ch
var_128		= byte ptr -128h
var_127		= byte ptr -127h
var_126		= dword	ptr -126h
var_122		= word ptr -122h
var_120		= byte ptr -120h
var_11F		= word ptr -11Fh
var_11C		= dword	ptr -11Ch
var_118		= byte ptr -118h
var_117		= byte ptr -117h
var_116		= dword	ptr -116h
var_112		= word ptr -112h
var_110		= byte ptr -110h
var_10F		= word ptr -10Fh
var_10C		= dword	ptr -10Ch
var_108		= byte ptr -108h
var_107		= byte ptr -107h
var_106		= dword	ptr -106h
var_102		= dword	ptr -102h
var_FE		= byte ptr -0FEh
var_FD		= byte ptr -0FDh
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= byte ptr -0F4h
var_F3		= byte ptr -0F3h
var_F2		= dword	ptr -0F2h
var_EE		= dword	ptr -0EEh
var_EA		= byte ptr -0EAh
var_E9		= byte ptr -0E9h
var_E8		= dword	ptr -0E8h
var_E4		= word ptr -0E4h
var_E2		= byte ptr -0E2h
var_E1		= word ptr -0E1h
var_DE		= dword	ptr -0DEh
var_DA		= byte ptr -0DAh
var_D9		= byte ptr -0D9h
var_D8		= dword	ptr -0D8h
var_D4		= word ptr -0D4h
var_D2		= byte ptr -0D2h
var_D1		= word ptr -0D1h
var_CE		= dword	ptr -0CEh
var_CA		= byte ptr -0CAh
var_C9		= byte ptr -0C9h
var_C8		= dword	ptr -0C8h
var_C4		= word ptr -0C4h
var_C2		= byte ptr -0C2h
var_C1		= word ptr -0C1h
var_BE		= dword	ptr -0BEh
var_BA		= byte ptr -0BAh
var_B9		= byte ptr -0B9h
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= byte ptr -0B0h
var_AF		= byte ptr -0AFh
var_AE		= dword	ptr -0AEh
var_AA		= word ptr -0AAh
var_A8		= word ptr -0A8h
var_A6		= dword	ptr -0A6h
var_A2		= byte ptr -0A2h
var_A0		= dword	ptr -0A0h
var_9C		= byte ptr -9Ch
var_9B		= byte ptr -9Bh
var_9A		= dword	ptr -9Ah
var_96		= word ptr -96h
var_94		= byte ptr -94h
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
var_7E		= word ptr -7Eh
var_7C		= byte ptr -7Ch
var_7B		= word ptr -7Bh
var_78		= dword	ptr -78h
var_74		= byte ptr -74h
var_73		= byte ptr -73h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= byte ptr -6Ah
var_69		= byte ptr -69h
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= byte ptr -60h
var_5F		= byte ptr -5Fh
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= byte ptr -56h
var_55		= byte ptr -55h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= byte ptr -4Ch
var_4B		= byte ptr -4Bh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= byte ptr -42h
var_41		= byte ptr -41h
var_40		= dword	ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= byte ptr -24h
var_23		= byte ptr -23h
var_22		= dword	ptr -22h
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
		sub	sp, 0E08h
		push	si
		push	di
		mov	[bp+var_8], 0
		push	0C8h ; '�'
		push	9
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	[bp+var_B], 0
		mov	[bp+var_C], 0
		mov	[bp+var_D], 0
		cmp	word_4684B, 0
		jz	short loc_9E0B6
		mov	[bp+var_C], 1

loc_9E0B6:				; CODE XREF: sub_9E080+30j
		mov	ax, word_46F46
		mov	[bp+var_10], ax
		mov	[bp+var_214], 0
		mov	[bp+var_212], 0
		push	[bp+var_10]
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_222], 0
		mov	[bp+var_220], 0
		mov	[bp+var_21E], 0
		mov	[bp+var_21C], 0
		mov	[bp+var_21A], 13Fh
		mov	[bp+var_218], 0C7h ; '�'
		push	0
		lea	ax, [bp+var_222]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_222]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	byte ptr [bp+var_1E], 0
		mov	byte ptr [bp+var_1E+1],	0
		mov	[bp+var_1C], 0
		mov	[bp+var_210], 0
		mov	[bp+var_20E], 18h
		mov	[bp+var_20C], 13Fh
		mov	[bp+var_20A], 97h ; '�'
		mov	[bp+var_28], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	ds
		push	offset unk_455DB
		push	ds
		push	offset aConvfont_shp_6 ; "convfont.shp"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_206]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_2C+2],	dx
		mov	word ptr [bp+var_2C], ax
		mov	eax, [bp+var_2C]
		mov	[bp+var_28], eax
		mov	[bp+var_24], 2
		mov	[bp+var_23], 1
		mov	[bp+var_22], 0
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_23A]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_34], 0
		mov	[bp+var_32], 98h ; '�'
		mov	[bp+var_30], 13Fh
		mov	[bp+var_2E], 0C7h ; '�'
		mov	ax, word_46F46
		mov	[bp+var_36], ax
		lea	ax, [bp+var_23A]
		push	ax
		push	[bp+var_36]
		lea	ax, [bp+var_25C]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_25C], 1218h
		mov	ax, [bp+var_32]
		mov	[bp+var_38], ax
		mov	ax, [bp+var_30]
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_2E]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_34]
		mov	[bp+var_243], ax
		mov	ax, [bp+var_38]
		mov	[bp+var_241], ax
		mov	ax, [bp+var_3A]
		mov	[bp+var_23F], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_23D], ax
		push	0
		lea	ax, [bp+var_25C]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_0 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_206]
		push	ax
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_0 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_206]
		push	ax
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid20	; "mid20"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_206]
		push	ax
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_34 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_206]
		push	ax
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		mov	[bp+var_46], 0
		mov	[bp+var_42], 2
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	3
		lea	ax, [bp+var_46]
		push	ax
		push	13h
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_50], 0
		mov	[bp+var_4C], 2
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	3
		lea	ax, [bp+var_50]
		push	ax
		push	14h
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_5A], 0
		mov	[bp+var_56], 2
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	3
		lea	ax, [bp+var_5A]
		push	ax
		push	15h
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_64], 0
		mov	[bp+var_60], 2
		mov	[bp+var_5F], 0
		mov	[bp+var_5E], 0
		mov	[bp+var_6E], 0
		mov	[bp+var_6A], 2
		mov	[bp+var_69], 0
		mov	[bp+var_68], 0
		push	3
		lea	ax, [bp+var_64]
		push	ax
		push	74h ; 't'
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	3
		lea	ax, [bp+var_6E]
		push	ax
		push	2Ch ; ','
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_78], 0
		mov	[bp+var_74], 2
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, [bp+var_78]
		push	ax
		push	6
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_7B], 0
		lea	ax, [bp+var_78]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_84], 0
		mov	[bp+var_81], 0
		mov	[bp+var_8A], 0
		mov	[bp+var_87], 0
		mov	[bp+var_90], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_96], 0
		mov	[bp+var_93], 0
		mov	[bp+var_140], 0
		mov	[bp+var_13C], 2
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		push	2
		lea	ax, [bp+var_140]
		push	ax
		push	15h
		lea	ax, [bp+var_34C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_140]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146], 2
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		push	2
		lea	ax, [bp+var_14A]
		push	ax
		push	18h
		lea	ax, [bp+var_34C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_14A]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150], 2
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_150+2],	0
		push	2
		lea	ax, [bp+var_154]
		push	ax
		push	16h
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_154]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15A], 2
		mov	byte ptr [bp+var_15A+1], 0
		mov	[bp+var_15A+2],	0
		push	0
		push	2
		lea	ax, [bp+var_160+2]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
		lea	ax, [bp+var_160+2]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		cmp	byte ptr [bp+var_15A+1], 0
		jz	short loc_9E56C
		cmp	[bp+var_160+2],	0
		jz	short loc_9E56C
		push	0
		mov	al, byte ptr [bp+var_15A]
		push	ax
		lea	ax, [bp+var_160+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9E56C:				; CODE XREF: sub_9E080+4C9j
					; sub_9E080+4D1j
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15A+1], 0
		mov	[bp+var_15A+2],	0
		cmp	byte ptr [bp+var_150+1], 0
		jz	short loc_9E5AB
		cmp	[bp+var_154], 0
		jz	short loc_9E5AB
		push	0
		mov	al, byte ptr [bp+var_150]
		push	ax
		lea	ax, [bp+var_154]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9E5AB:				; CODE XREF: sub_9E080+508j
					; sub_9E080+510j
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_150+2],	0
		cmp	byte ptr [bp+var_146+1], 0
		jz	short loc_9E5EA
		cmp	[bp+var_14A], 0
		jz	short loc_9E5EA
		push	0
		mov	al, byte ptr [bp+var_146]
		push	ax
		lea	ax, [bp+var_14A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9E5EA:				; CODE XREF: sub_9E080+547j
					; sub_9E080+54Fj
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		cmp	[bp+var_13B], 0
		jz	short loc_9E629
		cmp	[bp+var_140], 0
		jz	short loc_9E629
		push	0
		mov	al, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9E629:				; CODE XREF: sub_9E080+586j
					; sub_9E080+58Ej
		mov	[bp+var_140], 0
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid20voc ; "mid20voc"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	[bp+var_C], 0
		jz	short loc_9E696
		push	ds
		lea	ax, [bp+var_206]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_9E696
		push	1
		lea	ax, [bp+var_206]
		push	ax
		lea	ax, [bp+var_4B4]
		push	ax
		mov	bx, [bp+var_4B4]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_9E69A
; ���������������������������������������������������������������������������

loc_9E696:				; CODE XREF: sub_9E080+5EAj
					; sub_9E080+5FCj
		mov	[bp+var_C], 0

loc_9E69A:				; CODE XREF: sub_9E080+614j
		mov	[bp+var_A0], 0
		mov	[bp+var_9C], 2
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		mov	al, byte_46848
		mov	[bp+var_A2], al
		lea	ax, [bp+var_52C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_A2]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_9E6E0
		cmp	ax, 2
		jnz	short loc_9E6DD
		jmp	loc_9E84C
; ���������������������������������������������������������������������������

loc_9E6DD:				; CODE XREF: sub_9E080+658j
		jmp	loc_9E9B7
; ���������������������������������������������������������������������������

loc_9E6E0:				; CODE XREF: sub_9E080+653j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_206]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_9E70E
		jmp	loc_9E80B
; ���������������������������������������������������������������������������

loc_9E70E:				; CODE XREF: sub_9E080+689j
		push	1
		lea	ax, [bp+var_206]
		push	ax
		lea	ax, [bp+var_52C]
		push	ax
		mov	bx, [bp+var_52C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_35 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_E08]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_E08], 556h
		mov	[bp+var_DA7], 100h
		mov	[bp+var_DAB], 0
		mov	[bp+var_E08], 56Eh
		push	1
		lea	ax, [bp+var_206]
		push	ax
		lea	ax, [bp+var_E08]
		push	ax
		mov	bx, [bp+var_E08]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_9E7D3
; ���������������������������������������������������������������������������

loc_9E7BD:				; CODE XREF: sub_9E080+756j
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_9E7D3:				; CODE XREF: sub_9E080+73Bj
		cmp	si, 6Ah	; 'j'
		jle	short loc_9E7BD
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_E08], 56Eh
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_E08]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_9E80B:				; CODE XREF: sub_9E080+68Bj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_206]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_9E849
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E849
		mov	word_48F76, 5Ah	; 'Z'

loc_9E849:				; CODE XREF: sub_9E080+7B4j
					; sub_9E080+7C1j
		jmp	loc_9E9B7
; ���������������������������������������������������������������������������

loc_9E84C:				; CODE XREF: sub_9E080+65Aj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_206]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_9E87A
		jmp	loc_9E977
; ���������������������������������������������������������������������������

loc_9E87A:				; CODE XREF: sub_9E080+7F5j
		push	1
		lea	ax, [bp+var_206]
		push	ax
		lea	ax, [bp+var_52C]
		push	ax
		mov	bx, [bp+var_52C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_36 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_E08]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_E08], 556h
		mov	[bp+var_DA7], 100h
		mov	[bp+var_DAB], 0
		mov	[bp+var_E08], 56Eh
		push	1
		lea	ax, [bp+var_206]
		push	ax
		lea	ax, [bp+var_E08]
		push	ax
		mov	bx, [bp+var_E08]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_9E93F
; ���������������������������������������������������������������������������

loc_9E929:				; CODE XREF: sub_9E080+8C2j
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_9E93F:				; CODE XREF: sub_9E080+8A7j
		cmp	si, 6Ah	; 'j'
		jle	short loc_9E929
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_E08], 56Eh
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_E08]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_9E977:				; CODE XREF: sub_9E080+7F7j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_206]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_9E9B5
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E9B5
		mov	word_48F76, 0FFh

loc_9E9B5:				; CODE XREF: sub_9E080+920j
					; sub_9E080+92Dj
		jmp	short $+2

loc_9E9B7:				; CODE XREF: sub_9E080:loc_9E6DDj
					; sub_9E080:loc_9E849j
		mov	eax, dword_455CA
		mov	[bp+var_A6], eax
		cmp	[bp+var_D], 0
		jnz	short loc_9E9C9
		jmp	loc_9EAF3
; ���������������������������������������������������������������������������

loc_9E9C9:				; CODE XREF: sub_9E080+944j
		mov	[bp+var_D6A], 0
		mov	[bp+var_D66], 2
		mov	byte ptr [bp+var_D65], 0
		mov	dword ptr [bp+var_D65+1], 0
		mov	[bp+var_D6E], 0
		mov	[bp+var_D6C], 0FFFFh
		push	word_46849
		lea	ax, [bp+var_D6E]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		xor	si, si
		jmp	loc_9EA9F
; ���������������������������������������������������������������������������

loc_9EA07:				; CODE XREF: sub_9E080+A24j
		mov	[bp+var_140], 0
		mov	[bp+var_13C], 2
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		push	3
		lea	ax, [bp+var_140]
		push	ax
		mov	al, byte ptr [bp+si+var_A6]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_52C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		lea	ax, [bp+var_140]
		push	ax
		lea	ax, [bp+var_D6E]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_D6E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_13B], 0
		jz	short loc_9EA87
		cmp	[bp+var_140], 0
		jz	short loc_9EA87
		push	0
		mov	al, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9EA87:				; CODE XREF: sub_9E080+9E4j
					; sub_9E080+9ECj
		mov	[bp+var_140], 0
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		inc	si

loc_9EA9F:				; CODE XREF: sub_9E080+984j
		cmp	si, 4
		jge	short loc_9EAA7
		jmp	loc_9EA07
; ���������������������������������������������������������������������������

loc_9EAA7:				; CODE XREF: sub_9E080+A22j
		lea	ax, [bp+var_D6E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_D65], 0
		jz	short loc_9EADC
		cmp	[bp+var_D6A], 0
		jz	short loc_9EADC
		push	0
		mov	al, [bp+var_D66]
		push	ax
		lea	ax, [bp+var_D6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9EADC:				; CODE XREF: sub_9E080+A39j
					; sub_9E080+A41j
		mov	[bp+var_D6A], 0
		mov	byte ptr [bp+var_D65], 0
		mov	dword ptr [bp+var_D65+1], 0

loc_9EAF3:				; CODE XREF: sub_9E080+946j
		mov	[bp+var_536], 0
		mov	[bp+var_532], 2
		mov	[bp+var_531], 0
		mov	[bp+var_530], 0
		mov	[bp+var_53A], 0
		mov	[bp+var_538], 0FFFFh
		cmp	[bp+var_B], 0
		jz	short loc_9EB96
		push	1
		lea	ax, [bp+var_206]
		push	ax
		lea	ax, [bp+var_DD8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	[bp+var_C], 0
		jz	short loc_9EB42
		mov	byte ptr [bp+var_13A+3], 10h
		jmp	short loc_9EB47
; ���������������������������������������������������������������������������

loc_9EB42:				; CODE XREF: sub_9E080+AB9j
		mov	byte ptr [bp+var_13A+3], 0Fh

loc_9EB47:				; CODE XREF: sub_9E080+AC0j
		push	3
		lea	ax, [bp+var_A0]
		push	ax
		mov	al, byte ptr [bp+var_13A+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_DD8]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_53A]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_53A]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_DD8]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_9EB96:				; CODE XREF: sub_9E080+A9Fj
		mov	[bp+var_D60], 185Fh
		mov	[bp+var_D50], 0
		mov	[bp+var_D4C], 2
		mov	[bp+var_D4B], 0
		mov	[bp+var_D4A], 0
		mov	[bp+var_D5E], 0
		mov	[bp+var_D60], 186Fh
		xor	eax, eax
		mov	[bp+var_543], eax
		mov	[bp+var_53F], eax
		cmp	[bp+var_C], 0
		jz	short loc_9EBEB
		push	word_4684B
		lea	ax, [bp+var_D60]
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		jmp	loc_9EDB2
; ���������������������������������������������������������������������������

loc_9EBEB:				; CODE XREF: sub_9E080+B55j
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_37 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_E08]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_E08], 556h
		mov	[bp+var_DA7], 100h
		mov	[bp+var_DAB], 0
		mov	[bp+var_E08], 56Eh
		push	1
		lea	ax, [bp+var_206]
		push	ax
		lea	ax, [bp+var_E08]
		push	ax
		mov	bx, [bp+var_E08]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3032474Dh
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		xor	si, si
		jmp	short loc_9ECB6
; ���������������������������������������������������������������������������

loc_9EC73:				; CODE XREF: sub_9E080+C39j
		push	1
		push	large 54584554h
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	di, [bp+var_D96]
		movsx	eax, di
		push	eax
		push	ds
		mov	ax, [bp+var_A]
		imul	si
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_D92]
		mov	[bp+var_DA3], eax
		inc	si

loc_9ECB6:				; CODE XREF: sub_9E080+BF1j
		cmp	si, 9
		jl	short loc_9EC73
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9ECFE
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
		jmp	loc_9ED90
; ���������������������������������������������������������������������������

loc_9ECFE:				; CODE XREF: sub_9E080+C55j
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9ED33
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
		jmp	short loc_9ED90
; ���������������������������������������������������������������������������

loc_9ED33:				; CODE XREF: sub_9E080+C8Bj
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9ED68
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
		jmp	short loc_9ED90
; ���������������������������������������������������������������������������

loc_9ED68:				; CODE XREF: sub_9E080+CC0j
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

loc_9ED90:				; CODE XREF: sub_9E080+C7Bj
					; sub_9E080+CB1j ...
		mov	[bp+var_E08], 56Eh
		lea	ax, [bp+var_E08]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_E08]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_9EDB2:				; CODE XREF: sub_9E080+B68j
		cmp	byte_495FC, 0
		jnz	short loc_9EDBC
		jmp	loc_9F129
; ���������������������������������������������������������������������������

loc_9EDBC:				; CODE XREF: sub_9E080+D37j
		mov	[bp+var_D60], 185Fh
		lea	ax, [bp+var_D60]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_D4B], 0
		jz	short loc_9EDF7
		cmp	[bp+var_D50], 0
		jz	short loc_9EDF7
		push	0
		mov	al, [bp+var_D4C]
		push	ax
		lea	ax, [bp+var_D50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9EDF7:				; CODE XREF: sub_9E080+D54j
					; sub_9E080+D5Cj
		mov	[bp+var_D50], 0
		mov	[bp+var_D4B], 0
		mov	[bp+var_D4A], 0
		lea	ax, [bp+var_53A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_531], 0
		jz	short loc_9EE43
		cmp	[bp+var_536], 0
		jz	short loc_9EE43
		push	0
		mov	al, [bp+var_532]
		push	ax
		lea	ax, [bp+var_536]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9EE43:				; CODE XREF: sub_9E080+DA0j
					; sub_9E080+DA8j
		mov	[bp+var_536], 0
		mov	[bp+var_531], 0
		mov	[bp+var_530], 0
		push	2
		lea	ax, [bp+var_52C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_9EE91
		cmp	[bp+var_A0], 0
		jz	short loc_9EE91
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9EE91:				; CODE XREF: sub_9E080+DEEj
					; sub_9E080+DF6j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_9EF25
		cmp	[bp+var_78], 0
		jz	short loc_9EF25
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9EF25:				; CODE XREF: sub_9E080+E85j
					; sub_9E080+E8Cj
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		cmp	[bp+var_69], 0
		jz	short loc_9EF5D
		cmp	[bp+var_6E], 0
		jz	short loc_9EF5D
		push	0
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9EF5D:				; CODE XREF: sub_9E080+EBDj
					; sub_9E080+EC4j
		mov	[bp+var_6E], 0
		mov	[bp+var_69], 0
		mov	[bp+var_68], 0
		cmp	[bp+var_5F], 0
		jz	short loc_9EF95
		cmp	[bp+var_64], 0
		jz	short loc_9EF95
		push	0
		mov	al, [bp+var_60]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9EF95:				; CODE XREF: sub_9E080+EF5j
					; sub_9E080+EFCj
		mov	[bp+var_64], 0
		mov	[bp+var_5F], 0
		mov	[bp+var_5E], 0
		cmp	[bp+var_55], 0
		jz	short loc_9EFCD
		cmp	[bp+var_5A], 0
		jz	short loc_9EFCD
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9EFCD:				; CODE XREF: sub_9E080+F2Dj
					; sub_9E080+F34j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_9F005
		cmp	[bp+var_50], 0
		jz	short loc_9F005
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F005:				; CODE XREF: sub_9E080+F65j
					; sub_9E080+F6Cj
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_9F03D
		cmp	[bp+var_46], 0
		jz	short loc_9F03D
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F03D:				; CODE XREF: sub_9E080+F9Dj
					; sub_9E080+FA4j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_25A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_23A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9F0CD
		cmp	[bp+var_28], 0
		jz	short loc_9F0CD
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F0CD:				; CODE XREF: sub_9E080+102Dj
					; sub_9E080+1034j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_222]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_9F129:				; CODE XREF: sub_9E080+D39j
		cmp	[bp+var_B], 0
		jz	short loc_9F173
		mov	ax, word_48F76
		mov	[bp+var_A8], ax
		mov	[bp+var_AA], 0
		cmp	[bp+var_53A], 0
		jz	short loc_9F173
		push	[bp+var_538]
		mov	bx, [bp+var_53A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_AA]
		push	[bp+var_A8]
		push	[bp+var_538]
		mov	bx, [bp+var_53A]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_9F173:				; CODE XREF: sub_9E080+10ADj
					; sub_9E080+10C1j
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		call	Input_Flush_CDDC
		mov	[bp+var_140], 0
		mov	[bp+var_13C], 2
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		push	3
		lea	ax, [bp+var_140]
		push	ax
		push	7
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146], 2
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14A]
		push	ax
		push	6
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150], 2
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_150+2],	0
		push	2
		lea	ax, [bp+var_154]
		push	ax
		push	10h
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_15A+3], 0
		lea	ax, [bp+var_154]
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160], 2
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_160+2],	0
		push	3
		lea	ax, [bp+var_164]
		push	ax
		push	0Ah
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_16E], 0
		mov	byte ptr [bp+var_16A], 2
		mov	byte ptr [bp+var_16A+1], 0
		mov	[bp+var_16A+2],	0
		push	3
		lea	ax, [bp+var_16E]
		push	ax
		push	0Bh
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_178], 0
		mov	[bp+var_174], 2
		mov	[bp+var_173], 0
		mov	[bp+var_172], 0
		push	3
		lea	ax, [bp+var_178]
		push	ax
		push	0Ch
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0FFFEh
		push	0
		lea	ax, [bp+var_164]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	di, ax
		push	0FFFEh
		push	0
		lea	ax, [bp+var_16E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_17A], ax
		push	0FFFEh
		push	0
		lea	ax, [bp+var_178]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_17C], ax
		lea	ax, [bp+var_214]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	[bp+var_84]
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_8A]
		mov	al, [bp+var_88]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_15A]
		mov	al, byte ptr [bp+var_15A+2]
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_64]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_17E], ax
		push	5
		push	0
		lea	ax, [bp+var_50]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_180], ax
		push	[bp+var_17E]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_180]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_18A], 0
		mov	byte ptr [bp+var_186], 2
		mov	byte ptr [bp+var_186+1], 0
		mov	[bp+var_184], 0
		mov	[bp+var_D8C], 0
		mov	[bp+var_D88], 2
		mov	[bp+var_D87], 0
		mov	[bp+var_D86], 0
		mov	word ptr [bp+var_D92+2], 0
		mov	[bp+var_D8E], 0FFFFh
		mov	[bp+var_194], 0
		mov	[bp+var_190], 2
		mov	[bp+var_18F], 0
		mov	[bp+var_18E], 0
		mov	[bp+var_D9A], 0
		mov	byte ptr [bp+var_D96], 2
		mov	byte ptr [bp+var_D96+1], 0
		mov	dword ptr [bp-0D94h], 0
		mov	[bp+var_D9E], 0
		mov	[bp+var_D9C], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_9F466
		jmp	loc_9F520
; ���������������������������������������������������������������������������

loc_9F466:				; CODE XREF: sub_9E080+13E1j
		push	3
		lea	ax, [bp+var_18A]
		push	ax
		push	2Ah ; '*'
		lea	ax, [bp+var_52C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D92+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_18A]
		push	ax
		lea	ax, [bp+var_D92+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EF6
		mov	[bp+var_196], ax
		mov	[bp+var_198], 0
		cmp	word ptr [bp+var_D92+2], 0
		jz	short loc_9F4E5
		push	[bp+var_D8E]
		mov	bx, word ptr [bp+var_D92+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_198]
		push	[bp+var_196]
		push	[bp+var_D8E]
		mov	bx, word ptr [bp+var_D92+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_9F4E5:				; CODE XREF: sub_9E080+1433j
		push	3
		lea	ax, [bp+var_194]
		push	ax
		push	3Ah ; ':'
		lea	ax, [bp+var_52C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D9E]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_194]
		push	ax
		lea	ax, [bp+var_D9E]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_9F520:				; CODE XREF: sub_9E080+13E3j
		cmp	byte_495FC, 0
		jnz	short loc_9F52A
		jmp	loc_9FB45
; ���������������������������������������������������������������������������

loc_9F52A:				; CODE XREF: sub_9E080+14A5j
		lea	ax, [bp+var_D9E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_D96+1], 0
		jz	short loc_9F55F
		cmp	[bp+var_D9A], 0
		jz	short loc_9F55F
		push	0
		mov	al, byte ptr [bp+var_D96]
		push	ax
		lea	ax, [bp+var_D9A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F55F:				; CODE XREF: sub_9E080+14BCj
					; sub_9E080+14C4j
		mov	[bp+var_D9A], 0
		mov	byte ptr [bp+var_D96+1], 0
		mov	dword ptr [bp-0D94h], 0
		cmp	[bp+var_18F], 0
		jz	short loc_9F59E
		cmp	[bp+var_194], 0
		jz	short loc_9F59E
		push	0
		mov	al, [bp+var_190]
		push	ax
		lea	ax, [bp+var_194]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F59E:				; CODE XREF: sub_9E080+14FBj
					; sub_9E080+1503j
		mov	[bp+var_194], 0
		mov	[bp+var_18F], 0
		mov	[bp+var_18E], 0
		lea	ax, [bp+var_D92+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_D87], 0
		jz	short loc_9F5EA
		cmp	[bp+var_D8C], 0
		jz	short loc_9F5EA
		push	0
		mov	al, [bp+var_D88]
		push	ax
		lea	ax, [bp+var_D8C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F5EA:				; CODE XREF: sub_9E080+1547j
					; sub_9E080+154Fj
		mov	[bp+var_D8C], 0
		mov	[bp+var_D87], 0
		mov	[bp+var_D86], 0
		cmp	byte ptr [bp+var_186+1], 0
		jz	short loc_9F629
		cmp	[bp+var_18A], 0
		jz	short loc_9F629
		push	0
		mov	al, byte ptr [bp+var_186]
		push	ax
		lea	ax, [bp+var_18A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F629:				; CODE XREF: sub_9E080+1586j
					; sub_9E080+158Ej
		mov	[bp+var_18A], 0
		mov	byte ptr [bp+var_186+1], 0
		mov	[bp+var_184], 0
		push	0
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_173], 0
		jz	short loc_9F677
		cmp	[bp+var_178], 0
		jz	short loc_9F677
		push	0
		mov	al, [bp+var_174]
		push	ax
		lea	ax, [bp+var_178]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F677:				; CODE XREF: sub_9E080+15D4j
					; sub_9E080+15DCj
		mov	[bp+var_178], 0
		mov	[bp+var_173], 0
		mov	[bp+var_172], 0
		cmp	byte ptr [bp+var_16A+1], 0
		jz	short loc_9F6B6
		cmp	[bp+var_16E], 0
		jz	short loc_9F6B6
		push	0
		mov	al, byte ptr [bp+var_16A]
		push	ax
		lea	ax, [bp+var_16E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F6B6:				; CODE XREF: sub_9E080+1613j
					; sub_9E080+161Bj
		mov	[bp+var_16E], 0
		mov	byte ptr [bp+var_16A+1], 0
		mov	[bp+var_16A+2],	0
		cmp	byte ptr [bp+var_160+1], 0
		jz	short loc_9F6F5
		cmp	[bp+var_164], 0
		jz	short loc_9F6F5
		push	0
		mov	al, byte ptr [bp+var_160]
		push	ax
		lea	ax, [bp+var_164]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F6F5:				; CODE XREF: sub_9E080+1652j
					; sub_9E080+165Aj
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_160+2],	0
		push	2
		lea	ax, [bp+var_15A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_150+1], 0
		jz	short loc_9F743
		cmp	[bp+var_154], 0
		jz	short loc_9F743
		push	0
		mov	al, byte ptr [bp+var_150]
		push	ax
		lea	ax, [bp+var_154]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F743:				; CODE XREF: sub_9E080+16A0j
					; sub_9E080+16A8j
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_150+2],	0
		cmp	byte ptr [bp+var_146+1], 0
		jz	short loc_9F782
		cmp	[bp+var_14A], 0
		jz	short loc_9F782
		push	0
		mov	al, byte ptr [bp+var_146]
		push	ax
		lea	ax, [bp+var_14A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F782:				; CODE XREF: sub_9E080+16DFj
					; sub_9E080+16E7j
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		cmp	[bp+var_13B], 0
		jz	short loc_9F7C1
		cmp	[bp+var_140], 0
		jz	short loc_9F7C1
		push	0
		mov	al, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F7C1:				; CODE XREF: sub_9E080+171Ej
					; sub_9E080+1726j
		mov	[bp+var_140], 0
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		mov	[bp+var_D60], 185Fh
		lea	ax, [bp+var_D60]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_D4B], 0
		jz	short loc_9F813
		cmp	[bp+var_D50], 0
		jz	short loc_9F813
		push	0
		mov	al, [bp+var_D4C]
		push	ax
		lea	ax, [bp+var_D50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F813:				; CODE XREF: sub_9E080+1770j
					; sub_9E080+1778j
		mov	[bp+var_D50], 0
		mov	[bp+var_D4B], 0
		mov	[bp+var_D4A], 0
		lea	ax, [bp+var_53A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_531], 0
		jz	short loc_9F85F
		cmp	[bp+var_536], 0
		jz	short loc_9F85F
		push	0
		mov	al, [bp+var_532]
		push	ax
		lea	ax, [bp+var_536]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F85F:				; CODE XREF: sub_9E080+17BCj
					; sub_9E080+17C4j
		mov	[bp+var_536], 0
		mov	[bp+var_531], 0
		mov	[bp+var_530], 0
		push	2
		lea	ax, [bp+var_52C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_9F8AD
		cmp	[bp+var_A0], 0
		jz	short loc_9F8AD
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F8AD:				; CODE XREF: sub_9E080+180Aj
					; sub_9E080+1812j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_9F941
		cmp	[bp+var_78], 0
		jz	short loc_9F941
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F941:				; CODE XREF: sub_9E080+18A1j
					; sub_9E080+18A8j
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		cmp	[bp+var_69], 0
		jz	short loc_9F979
		cmp	[bp+var_6E], 0
		jz	short loc_9F979
		push	0
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F979:				; CODE XREF: sub_9E080+18D9j
					; sub_9E080+18E0j
		mov	[bp+var_6E], 0
		mov	[bp+var_69], 0
		mov	[bp+var_68], 0
		cmp	[bp+var_5F], 0
		jz	short loc_9F9B1
		cmp	[bp+var_64], 0
		jz	short loc_9F9B1
		push	0
		mov	al, [bp+var_60]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F9B1:				; CODE XREF: sub_9E080+1911j
					; sub_9E080+1918j
		mov	[bp+var_64], 0
		mov	[bp+var_5F], 0
		mov	[bp+var_5E], 0
		cmp	[bp+var_55], 0
		jz	short loc_9F9E9
		cmp	[bp+var_5A], 0
		jz	short loc_9F9E9
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9F9E9:				; CODE XREF: sub_9E080+1949j
					; sub_9E080+1950j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_9FA21
		cmp	[bp+var_50], 0
		jz	short loc_9FA21
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9FA21:				; CODE XREF: sub_9E080+1981j
					; sub_9E080+1988j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_9FA59
		cmp	[bp+var_46], 0
		jz	short loc_9FA59
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9FA59:				; CODE XREF: sub_9E080+19B9j
					; sub_9E080+19C0j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_25A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_23A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9FAE9
		cmp	[bp+var_28], 0
		jz	short loc_9FAE9
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9FAE9:				; CODE XREF: sub_9E080+1A49j
					; sub_9E080+1A50j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_222]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_9FB45:				; CODE XREF: sub_9E080+14A7j
		call	Input_Flush_CDDC
		mov	[bp+var_D63], 0
		call	Input_Flush_CDDC
		push	0FFFEh
		push	1
		lea	ax, [bp+var_140]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_19A], ax
		push	0
		push	0
		lea	ax, [bp+var_14A]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_19C], ax
		push	di
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_19A]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1A0], ax
		or	ax, ax
		jz	short loc_9FC05
		push	1
		push	0ADh ; '�'
		push	0
		lea	ax, [bp+var_46]
		push	ax
		push	[bp+var_1A0]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_1A0]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_1A0]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_1A0]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_1A0]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_1A0]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_1A0]
		mov	word ptr [bx+1Fh], 0FFFEh
		mov	ax, [bp+var_1A0]
		jmp	short loc_9FC09
; ���������������������������������������������������������������������������

loc_9FC05:				; CODE XREF: sub_9E080+1B31j
		mov	ax, [bp+var_1A0]

loc_9FC09:				; CODE XREF: sub_9E080+1B83j
		mov	[bp+var_19E], ax
		push	[bp+var_19E]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1A4], ax
		or	ax, ax
		jz	short loc_9FC82
		push	2
		push	0FAh ; '�'
		push	0
		lea	ax, [bp+var_46]
		push	ax
		push	[bp+var_1A4]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_1A4]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_1A4]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_1A4]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_1A4]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_1A4]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_1A4]
		mov	word ptr [bx+1Fh], 0FFFCh
		mov	ax, [bp+var_1A4]
		jmp	short loc_9FC86
; ���������������������������������������������������������������������������

loc_9FC82:				; CODE XREF: sub_9E080+1BAEj
		mov	ax, [bp+var_1A4]

loc_9FC86:				; CODE XREF: sub_9E080+1C00j
		mov	[bp+var_1A2], ax
		push	[bp+var_1A2]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_1A6], 0
		mov	[bp+var_1A8], 0
		jmp	loc_9FED8
; ���������������������������������������������������������������������������

loc_9FCAA:				; CODE XREF: sub_9E080+1E73j
		mov	si, [bp+var_D65]
		cmp	si, 1Eh
		jnz	short loc_9FCC4
		push	[bp+var_19C]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_9FCC4:				; CODE XREF: sub_9E080+1C31j
		cmp	si, 2Bh	; '+'
		jge	short loc_9FCD8
		mov	[bp+var_1AA], si
		mov	bx, [bp+var_19A]
		mov	ax, [bp+var_1AA]
		mov	[bx+1Bh], ax

loc_9FCD8:				; CODE XREF: sub_9E080+1C47j
		cmp	si, 0Ah
		jle	short loc_9FCFC
		cmp	si, 32h	; '2'
		jge	short loc_9FCFC
		test	si, 1
		jz	short loc_9FCFC
		push	0FFFFh
		push	0
		push	[bp+var_17E]
		mov	bx, [bp+var_17E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_9FCFC:				; CODE XREF: sub_9E080+1C5Bj
					; sub_9E080+1C60j ...
		cmp	si, 32h	; '2'
		jge	short loc_9FD1B
		test	si, 1
		jz	short loc_9FD1B
		push	0FFFFh
		push	0
		push	[bp+var_180]
		mov	bx, [bp+var_180]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_9FD1B:				; CODE XREF: sub_9E080+1C7Fj
					; sub_9E080+1C85j
		cmp	si, 36h	; '6'
		jz	short loc_9FD23
		jmp	loc_9FDA7
; ���������������������������������������������������������������������������

loc_9FD23:				; CODE XREF: sub_9E080+1C9Ej
		push	di
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		or	di, di
		jz	short loc_9FD41
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_9FD41:				; CODE XREF: sub_9E080+1CB3j
		push	[bp+var_19E]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	[bp+var_1A2]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	[bp+var_17A]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_17C]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_19E]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_1A2]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_9FDA7:				; CODE XREF: sub_9E080+1CA0j
		cmp	si, 10h
		jle	short loc_9FDC4
		cmp	si, 36h	; '6'
		jge	short loc_9FDC4
		mov	ax, [bp+var_1A8]
		mov	[bp+var_1AC], ax
		inc	[bp+var_1A8]
		mov	ax, [bp+var_1AC]
		mov	[di+1Bh], ax

loc_9FDC4:				; CODE XREF: sub_9E080+1D2Aj
					; sub_9E080+1D2Fj
		cmp	si, 36h	; '6'
		jle	short loc_9FE28
		cmp	[bp+var_1A6], 4
		jle	short loc_9FDFE
		mov	[bp+var_1A6], 0
		push	0
		push	0FFFFh
		push	[bp+var_17A]
		mov	bx, [bp+var_17A]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	0
		push	1
		push	[bp+var_17C]
		mov	bx, [bp+var_17C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_9FDFE:				; CODE XREF: sub_9E080+1D4Ej
		mov	ax, [bp+var_1A6]
		mov	[bp+var_1AE], ax
		mov	bx, [bp+var_17A]
		mov	ax, [bp+var_1AE]
		mov	[bx+1Bh], ax
		mov	ax, [bp+var_1A6]
		mov	[bp+var_1B0], ax
		inc	[bp+var_1A6]
		mov	bx, [bp+var_17C]
		mov	ax, [bp+var_1B0]
		mov	[bx+1Bh], ax

loc_9FE28:				; CODE XREF: sub_9E080+1D47j
		cmp	si, 29h	; ')'
		jle	short loc_9FE46
		cmp	si, 63h	; 'c'
		jge	short loc_9FE46
		mov	ax, si
		add	ax, 0FFD6h
		mov	[bp+var_1B2], ax
		mov	bx, [bp+var_19C]
		mov	ax, [bp+var_1B2]
		mov	[bx+1Bh], ax

loc_9FE46:				; CODE XREF: sub_9E080+1DABj
					; sub_9E080+1DB0j
		cmp	si, 31h	; '1'
		jnz	short loc_9FE95
		cmp	[bp+var_D], 0
		jz	short loc_9FE95
		mov	ax, word_48F16
		mov	[bp+var_1B4], ax
		mov	[bp+var_1B6], 0
		cmp	[bp+var_D9E], 0
		jz	short loc_9FE95
		push	[bp+var_D9C]
		mov	bx, [bp+var_D9E]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_1B6]
		push	[bp+var_1B4]
		push	[bp+var_D9C]
		mov	bx, [bp+var_D9E]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_9FE95:				; CODE XREF: sub_9E080+1DC9j
					; sub_9E080+1DCFj ...
		cmp	si, 32h	; '2'
		jnz	short loc_9FEBE
		mov	bx, [bp+var_19E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_19E]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_1A2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_1A2]
		mov	word ptr [bx+1Fh], 0

loc_9FEBE:				; CODE XREF: sub_9E080+1E18j
		jmp	short loc_9FECB
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9FECB
		jmp	short loc_9FEF6
; ���������������������������������������������������������������������������

loc_9FECB:				; CODE XREF: sub_9E080:loc_9FEBEj
					; sub_9E080+1E47j
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9FED8:				; CODE XREF: sub_9E080+1C27j
		cmp	[bp+var_D65], 62h ; 'b'
		jnb	short loc_9FEE6
		cmp	[bp+var_D63], 0
		jz	short loc_9FEEB

loc_9FEE6:				; CODE XREF: sub_9E080+1E5Dj
		mov	ax, 1
		jmp	short loc_9FEED
; ���������������������������������������������������������������������������

loc_9FEEB:				; CODE XREF: sub_9E080+1E64j
		xor	ax, ax

loc_9FEED:				; CODE XREF: sub_9E080+1E69j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9FEF6
		jmp	loc_9FCAA
; ���������������������������������������������������������������������������

loc_9FEF6:				; CODE XREF: sub_9E080+1E49j
					; sub_9E080+1E71j
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		lea	ax, [bp+var_D9E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_D96+1], 0
		jz	short loc_9FF39
		cmp	[bp+var_D9A], 0
		jz	short loc_9FF39
		push	0
		mov	al, byte ptr [bp+var_D96]
		push	ax
		lea	ax, [bp+var_D9A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9FF39:				; CODE XREF: sub_9E080+1E96j
					; sub_9E080+1E9Ej
		mov	[bp+var_D9A], 0
		mov	byte ptr [bp+var_D96+1], 0
		mov	dword ptr [bp-0D94h], 0
		cmp	[bp+var_18F], 0
		jz	short loc_9FF78
		cmp	[bp+var_194], 0
		jz	short loc_9FF78
		push	0
		mov	al, [bp+var_190]
		push	ax
		lea	ax, [bp+var_194]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9FF78:				; CODE XREF: sub_9E080+1ED5j
					; sub_9E080+1EDDj
		mov	[bp+var_194], 0
		mov	[bp+var_18F], 0
		mov	[bp+var_18E], 0
		lea	ax, [bp+var_D92+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_D87], 0
		jz	short loc_9FFC4
		cmp	[bp+var_D8C], 0
		jz	short loc_9FFC4
		push	0
		mov	al, [bp+var_D88]
		push	ax
		lea	ax, [bp+var_D8C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9FFC4:				; CODE XREF: sub_9E080+1F21j
					; sub_9E080+1F29j
		mov	[bp+var_D8C], 0
		mov	[bp+var_D87], 0
		mov	[bp+var_D86], 0
		cmp	byte ptr [bp+var_186+1], 0
		jz	short loc_A0003
		cmp	[bp+var_18A], 0
		jz	short loc_A0003
		push	0
		mov	al, byte ptr [bp+var_186]
		push	ax
		lea	ax, [bp+var_18A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0003:				; CODE XREF: sub_9E080+1F60j
					; sub_9E080+1F68j
		mov	[bp+var_18A], 0
		mov	byte ptr [bp+var_186+1], 0
		mov	[bp+var_184], 0
		push	0
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_173], 0
		jz	short loc_A0051
		cmp	[bp+var_178], 0
		jz	short loc_A0051
		push	0
		mov	al, [bp+var_174]
		push	ax
		lea	ax, [bp+var_178]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0051:				; CODE XREF: sub_9E080+1FAEj
					; sub_9E080+1FB6j
		mov	[bp+var_178], 0
		mov	[bp+var_173], 0
		mov	[bp+var_172], 0
		cmp	byte ptr [bp+var_16A+1], 0
		jz	short loc_A0090
		cmp	[bp+var_16E], 0
		jz	short loc_A0090
		push	0
		mov	al, byte ptr [bp+var_16A]
		push	ax
		lea	ax, [bp+var_16E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0090:				; CODE XREF: sub_9E080+1FEDj
					; sub_9E080+1FF5j
		mov	[bp+var_16E], 0
		mov	byte ptr [bp+var_16A+1], 0
		mov	[bp+var_16A+2],	0
		cmp	byte ptr [bp+var_160+1], 0
		jz	short loc_A00CF
		cmp	[bp+var_164], 0
		jz	short loc_A00CF
		push	0
		mov	al, byte ptr [bp+var_160]
		push	ax
		lea	ax, [bp+var_164]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A00CF:				; CODE XREF: sub_9E080+202Cj
					; sub_9E080+2034j
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_160+2],	0
		push	2
		lea	ax, [bp+var_15A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_150+1], 0
		jz	short loc_A011D
		cmp	[bp+var_154], 0
		jz	short loc_A011D
		push	0
		mov	al, byte ptr [bp+var_150]
		push	ax
		lea	ax, [bp+var_154]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A011D:				; CODE XREF: sub_9E080+207Aj
					; sub_9E080+2082j
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_150+2],	0
		cmp	byte ptr [bp+var_146+1], 0
		jz	short loc_A015C
		cmp	[bp+var_14A], 0
		jz	short loc_A015C
		push	0
		mov	al, byte ptr [bp+var_146]
		push	ax
		lea	ax, [bp+var_14A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A015C:				; CODE XREF: sub_9E080+20B9j
					; sub_9E080+20C1j
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		cmp	[bp+var_13B], 0
		jz	short loc_A019B
		cmp	[bp+var_140], 0
		jz	short loc_A019B
		push	0
		mov	al, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A019B:				; CODE XREF: sub_9E080+20F8j
					; sub_9E080+2100j
		mov	[bp+var_140], 0
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		call	Input_Flush_CDDC
		cmp	byte_495FC, 0
		jnz	short loc_A01C1
		jmp	loc_A052E
; ���������������������������������������������������������������������������

loc_A01C1:				; CODE XREF: sub_9E080+213Cj
		mov	[bp+var_D60], 185Fh
		lea	ax, [bp+var_D60]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_D4B], 0
		jz	short loc_A01FC
		cmp	[bp+var_D50], 0
		jz	short loc_A01FC
		push	0
		mov	al, [bp+var_D4C]
		push	ax
		lea	ax, [bp+var_D50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A01FC:				; CODE XREF: sub_9E080+2159j
					; sub_9E080+2161j
		mov	[bp+var_D50], 0
		mov	[bp+var_D4B], 0
		mov	[bp+var_D4A], 0
		lea	ax, [bp+var_53A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_531], 0
		jz	short loc_A0248
		cmp	[bp+var_536], 0
		jz	short loc_A0248
		push	0
		mov	al, [bp+var_532]
		push	ax
		lea	ax, [bp+var_536]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0248:				; CODE XREF: sub_9E080+21A5j
					; sub_9E080+21ADj
		mov	[bp+var_536], 0
		mov	[bp+var_531], 0
		mov	[bp+var_530], 0
		push	2
		lea	ax, [bp+var_52C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A0296
		cmp	[bp+var_A0], 0
		jz	short loc_A0296
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0296:				; CODE XREF: sub_9E080+21F3j
					; sub_9E080+21FBj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_A032A
		cmp	[bp+var_78], 0
		jz	short loc_A032A
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A032A:				; CODE XREF: sub_9E080+228Aj
					; sub_9E080+2291j
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		cmp	[bp+var_69], 0
		jz	short loc_A0362
		cmp	[bp+var_6E], 0
		jz	short loc_A0362
		push	0
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0362:				; CODE XREF: sub_9E080+22C2j
					; sub_9E080+22C9j
		mov	[bp+var_6E], 0
		mov	[bp+var_69], 0
		mov	[bp+var_68], 0
		cmp	[bp+var_5F], 0
		jz	short loc_A039A
		cmp	[bp+var_64], 0
		jz	short loc_A039A
		push	0
		mov	al, [bp+var_60]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A039A:				; CODE XREF: sub_9E080+22FAj
					; sub_9E080+2301j
		mov	[bp+var_64], 0
		mov	[bp+var_5F], 0
		mov	[bp+var_5E], 0
		cmp	[bp+var_55], 0
		jz	short loc_A03D2
		cmp	[bp+var_5A], 0
		jz	short loc_A03D2
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A03D2:				; CODE XREF: sub_9E080+2332j
					; sub_9E080+2339j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_A040A
		cmp	[bp+var_50], 0
		jz	short loc_A040A
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A040A:				; CODE XREF: sub_9E080+236Aj
					; sub_9E080+2371j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A0442
		cmp	[bp+var_46], 0
		jz	short loc_A0442
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0442:				; CODE XREF: sub_9E080+23A2j
					; sub_9E080+23A9j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_25A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_23A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_A04D2
		cmp	[bp+var_28], 0
		jz	short loc_A04D2
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A04D2:				; CODE XREF: sub_9E080+2432j
					; sub_9E080+2439j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_222]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A052E:				; CODE XREF: sub_9E080+213Ej
		mov	[bp+var_B4], 0
		mov	[bp+var_B0], 2
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		push	3
		lea	ax, [bp+var_B4]
		push	ax
		push	4
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_214]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_140], 0
		mov	[bp+var_13C], 2
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		push	3
		lea	ax, [bp+var_140]
		push	ax
		push	25EFh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	[bp+var_84]
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_7E]
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0FFC1h
		push	0
		lea	ax, [bp+var_64]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144+2], ax
		push	word ptr [bp+var_144+2]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	0
		lea	ax, [bp+var_B4]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144], ax
		push	word ptr [bp+var_144]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_140]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	di, ax
		push	di
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Bh
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	[bp+var_150+2],	0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_14A+2],	0
		push	3
		lea	ax, [bp+var_150+2]
		push	ax
		push	0
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	1
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_150+2]
		push	ax
		push	0
		call	ToggleLayer_Construct_B57B
		add	sp, 0Ah
		mov	word ptr [bp+var_150], ax
		push	word ptr [bp+var_150]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_156], 2
		mov	byte ptr [bp+var_156+1], 0
		mov	[bp+var_154], 0
		mov	[bp+var_D8C], 0
		mov	[bp+var_D88], 2
		mov	[bp+var_D87], 0
		mov	[bp+var_D86], 0
		mov	word ptr [bp+var_D92+2], 0
		mov	[bp+var_D8E], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_A072F
		jmp	loc_A07AE
; ���������������������������������������������������������������������������

loc_A072F:				; CODE XREF: sub_9E080+26AAj
		push	3
		lea	ax, [bp+var_15A]
		push	ax
		push	5
		lea	ax, [bp+var_52C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D92+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_15A]
		push	ax
		lea	ax, [bp+var_D92+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EAC
		mov	[bp+var_15C], ax
		mov	word ptr [bp+var_160+2], 0
		cmp	word ptr [bp+var_D92+2], 0
		jz	short loc_A07AE
		push	[bp+var_D8E]
		mov	bx, word ptr [bp+var_D92+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_160+2]
		push	[bp+var_15C]
		push	[bp+var_D8E]
		mov	bx, word ptr [bp+var_D92+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_A07AE:				; CODE XREF: sub_9E080+26ACj
					; sub_9E080+26FCj
		xor	si, si
		mov	word ptr [bp+var_160], 1
		jmp	loc_A083F
; ���������������������������������������������������������������������������

loc_A07B9:				; CODE XREF: sub_9E080+27DAj
		or	si, si
		jnz	short loc_A07DE
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_A07DE
		mov	si, 0FFFFh
		jmp	short loc_A07EF
; ���������������������������������������������������������������������������

loc_A07DE:				; CODE XREF: sub_9E080+273Bj
					; sub_9E080+2757j
		cmp	si, 0FFFFh
		jnz	short loc_A07E8
		mov	si, 1
		jmp	short loc_A07EF
; ���������������������������������������������������������������������������

loc_A07E8:				; CODE XREF: sub_9E080+2761j
		cmp	si, 1
		jnz	short loc_A07EF
		xor	si, si

loc_A07EF:				; CODE XREF: sub_9E080+275Cj
					; sub_9E080+2766j ...
		push	si
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
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
		push	word ptr [bp+var_150]
		mov	bx, word ptr [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		add	word ptr [bp+var_160], si
		jmp	short loc_A0832
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A0832
		jmp	short loc_A085D
; ���������������������������������������������������������������������������

loc_A0832:				; CODE XREF: sub_9E080+27A5j
					; sub_9E080+27AEj
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A083F:				; CODE XREF: sub_9E080+2736j
		cmp	[bp+var_D65], 19h
		jnb	short loc_A084D
		cmp	[bp+var_D63], 0
		jz	short loc_A0852

loc_A084D:				; CODE XREF: sub_9E080+27C4j
		mov	ax, 1
		jmp	short loc_A0854
; ���������������������������������������������������������������������������

loc_A0852:				; CODE XREF: sub_9E080+27CBj
		xor	ax, ax

loc_A0854:				; CODE XREF: sub_9E080+27D0j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A085D
		jmp	loc_A07B9
; ���������������������������������������������������������������������������

loc_A085D:				; CODE XREF: sub_9E080+27B0j
					; sub_9E080+27D8j
		lea	ax, [bp+var_D92+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_D87], 0
		jz	short loc_A0892
		cmp	[bp+var_D8C], 0
		jz	short loc_A0892
		push	0
		mov	al, [bp+var_D88]
		push	ax
		lea	ax, [bp+var_D8C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0892:				; CODE XREF: sub_9E080+27EFj
					; sub_9E080+27F7j
		mov	[bp+var_D8C], 0
		mov	[bp+var_D87], 0
		mov	[bp+var_D86], 0
		cmp	byte ptr [bp+var_156+1], 0
		jz	short loc_A08D1
		cmp	[bp+var_15A], 0
		jz	short loc_A08D1
		push	0
		mov	al, byte ptr [bp+var_156]
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A08D1:				; CODE XREF: sub_9E080+282Ej
					; sub_9E080+2836j
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_156+1], 0
		mov	[bp+var_154], 0
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_A0910
		cmp	[bp+var_150+2],	0
		jz	short loc_A0910
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, [bp+var_150+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0910:				; CODE XREF: sub_9E080+286Dj
					; sub_9E080+2875j
		mov	[bp+var_150+2],	0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_14A+2],	0
		cmp	[bp+var_13B], 0
		jz	short loc_A094F
		cmp	[bp+var_140], 0
		jz	short loc_A094F
		push	0
		mov	al, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A094F:				; CODE XREF: sub_9E080+28ACj
					; sub_9E080+28B4j
		mov	[bp+var_140], 0
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		push	0
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_A097F
		jmp	loc_A0D2B
; ���������������������������������������������������������������������������

loc_A097F:				; CODE XREF: sub_9E080+28FAj
		cmp	[bp+var_AF], 0
		jz	short loc_A09A7
		cmp	[bp+var_B4], 0
		jz	short loc_A09A7
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A09A7:				; CODE XREF: sub_9E080+2904j
					; sub_9E080+290Cj
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		mov	[bp+var_D60], 185Fh
		lea	ax, [bp+var_D60]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_D4B], 0
		jz	short loc_A09F9
		cmp	[bp+var_D50], 0
		jz	short loc_A09F9
		push	0
		mov	al, [bp+var_D4C]
		push	ax
		lea	ax, [bp+var_D50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A09F9:				; CODE XREF: sub_9E080+2956j
					; sub_9E080+295Ej
		mov	[bp+var_D50], 0
		mov	[bp+var_D4B], 0
		mov	[bp+var_D4A], 0
		lea	ax, [bp+var_53A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_531], 0
		jz	short loc_A0A45
		cmp	[bp+var_536], 0
		jz	short loc_A0A45
		push	0
		mov	al, [bp+var_532]
		push	ax
		lea	ax, [bp+var_536]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0A45:				; CODE XREF: sub_9E080+29A2j
					; sub_9E080+29AAj
		mov	[bp+var_536], 0
		mov	[bp+var_531], 0
		mov	[bp+var_530], 0
		push	2
		lea	ax, [bp+var_52C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A0A93
		cmp	[bp+var_A0], 0
		jz	short loc_A0A93
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0A93:				; CODE XREF: sub_9E080+29F0j
					; sub_9E080+29F8j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_A0B27
		cmp	[bp+var_78], 0
		jz	short loc_A0B27
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0B27:				; CODE XREF: sub_9E080+2A87j
					; sub_9E080+2A8Ej
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		cmp	[bp+var_69], 0
		jz	short loc_A0B5F
		cmp	[bp+var_6E], 0
		jz	short loc_A0B5F
		push	0
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0B5F:				; CODE XREF: sub_9E080+2ABFj
					; sub_9E080+2AC6j
		mov	[bp+var_6E], 0
		mov	[bp+var_69], 0
		mov	[bp+var_68], 0
		cmp	[bp+var_5F], 0
		jz	short loc_A0B97
		cmp	[bp+var_64], 0
		jz	short loc_A0B97
		push	0
		mov	al, [bp+var_60]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0B97:				; CODE XREF: sub_9E080+2AF7j
					; sub_9E080+2AFEj
		mov	[bp+var_64], 0
		mov	[bp+var_5F], 0
		mov	[bp+var_5E], 0
		cmp	[bp+var_55], 0
		jz	short loc_A0BCF
		cmp	[bp+var_5A], 0
		jz	short loc_A0BCF
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0BCF:				; CODE XREF: sub_9E080+2B2Fj
					; sub_9E080+2B36j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_A0C07
		cmp	[bp+var_50], 0
		jz	short loc_A0C07
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0C07:				; CODE XREF: sub_9E080+2B67j
					; sub_9E080+2B6Ej
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A0C3F
		cmp	[bp+var_46], 0
		jz	short loc_A0C3F
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0C3F:				; CODE XREF: sub_9E080+2B9Fj
					; sub_9E080+2BA6j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_25A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_23A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_A0CCF
		cmp	[bp+var_28], 0
		jz	short loc_A0CCF
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A0CCF:				; CODE XREF: sub_9E080+2C2Fj
					; sub_9E080+2C36j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_222]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A0D2B:				; CODE XREF: sub_9E080+28FCj
		lea	ax, [bp+var_214]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_140], 0
		mov	[bp+var_13C], 2
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		push	3
		lea	ax, [bp+var_140]
		push	ax
		push	1
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146], 2
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14A]
		push	ax
		push	5
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150], 2
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_150+2],	0
		push	2
		lea	ax, [bp+var_154]
		push	ax
		push	0Eh
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_15A+3], 0
		lea	ax, [bp+var_154]
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+var_8A]
		mov	al, [bp+var_88]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_15A]
		mov	al, byte ptr [bp+var_15A+2]
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0FFD0h
		push	0
		lea	ax, [bp+var_64]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_15C], ax
		push	0
		push	0
		lea	ax, [bp+var_50]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_160+2], ax
		push	word ptr [bp+var_160+2]
		push	[bp+var_15C]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_15C]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	0
		lea	ax, [bp+var_6E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_160], ax
		push	word ptr [bp+var_160]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1
		push	5Ah ; 'Z'
		push	0
		lea	ax, [bp+var_46]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_164+2], ax
		push	word ptr [bp+var_164+2]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	2
		push	32h ; '2'
		push	0
		lea	ax, [bp+var_46]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_164], ax
		push	word ptr [bp+var_164]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	0
		lea	ax, [bp+var_14A]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_166], ax
		push	word ptr [bp+var_166]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	0
		push	0
		lea	ax, [bp+var_140]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	di, ax
		push	di
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [di+1Bh], 1
		xor	si, si
		jmp	short loc_A0FD2
; ���������������������������������������������������������������������������

loc_A0F7D:				; CODE XREF: sub_9E080+2F6Bj
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_16A+2], ax
		mov	ax, word ptr [bp+var_16A+2]
		mov	[di+1Bh], ax
		mov	word ptr [bp+var_16A], si
		inc	si
		mov	bx, word ptr [bp+var_166]
		mov	ax, word ptr [bp+var_16A]
		mov	[bx+1Bh], ax
		cmp	si, 5
		jle	short loc_A0FB8
		xor	si, si

loc_A0FB8:				; CODE XREF: sub_9E080+2F34j
		jmp	short loc_A0FC5
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A0FC5
		jmp	short loc_A0FED
; ���������������������������������������������������������������������������

loc_A0FC5:				; CODE XREF: sub_9E080:loc_A0FB8j
					; sub_9E080+2F41j
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A0FD2:				; CODE XREF: sub_9E080+2EFBj
		cmp	[bp+var_D65], 10h
		jnb	short loc_A0FE0
		cmp	[bp+var_D63], 0
		jz	short loc_A0FE5

loc_A0FE0:				; CODE XREF: sub_9E080+2F57j
		mov	ax, 1
		jmp	short loc_A0FE7
; ���������������������������������������������������������������������������

loc_A0FE5:				; CODE XREF: sub_9E080+2F5Ej
		xor	ax, ax

loc_A0FE7:				; CODE XREF: sub_9E080+2F63j
		mov	ah, 0
		or	ax, ax
		jz	short loc_A0F7D

loc_A0FED:				; CODE XREF: sub_9E080+2F43j
		push	2
		lea	ax, [bp+var_15A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_150+1], 0
		jz	short loc_A1024
		cmp	[bp+var_154], 0
		jz	short loc_A1024
		push	0
		mov	al, byte ptr [bp+var_150]
		push	ax
		lea	ax, [bp+var_154]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1024:				; CODE XREF: sub_9E080+2F81j
					; sub_9E080+2F89j
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_150+2],	0
		cmp	byte ptr [bp+var_146+1], 0
		jz	short loc_A1063
		cmp	[bp+var_14A], 0
		jz	short loc_A1063
		push	0
		mov	al, byte ptr [bp+var_146]
		push	ax
		lea	ax, [bp+var_14A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1063:				; CODE XREF: sub_9E080+2FC0j
					; sub_9E080+2FC8j
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		cmp	[bp+var_13B], 0
		jz	short loc_A10A2
		cmp	[bp+var_140], 0
		jz	short loc_A10A2
		push	0
		mov	al, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A10A2:				; CODE XREF: sub_9E080+2FFFj
					; sub_9E080+3007j
		mov	[bp+var_140], 0
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		push	0
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_A10D2
		jmp	loc_A147E
; ���������������������������������������������������������������������������

loc_A10D2:				; CODE XREF: sub_9E080+304Dj
		cmp	[bp+var_AF], 0
		jz	short loc_A10FA
		cmp	[bp+var_B4], 0
		jz	short loc_A10FA
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A10FA:				; CODE XREF: sub_9E080+3057j
					; sub_9E080+305Fj
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		mov	[bp+var_D60], 185Fh
		lea	ax, [bp+var_D60]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_D4B], 0
		jz	short loc_A114C
		cmp	[bp+var_D50], 0
		jz	short loc_A114C
		push	0
		mov	al, [bp+var_D4C]
		push	ax
		lea	ax, [bp+var_D50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A114C:				; CODE XREF: sub_9E080+30A9j
					; sub_9E080+30B1j
		mov	[bp+var_D50], 0
		mov	[bp+var_D4B], 0
		mov	[bp+var_D4A], 0
		lea	ax, [bp+var_53A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_531], 0
		jz	short loc_A1198
		cmp	[bp+var_536], 0
		jz	short loc_A1198
		push	0
		mov	al, [bp+var_532]
		push	ax
		lea	ax, [bp+var_536]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1198:				; CODE XREF: sub_9E080+30F5j
					; sub_9E080+30FDj
		mov	[bp+var_536], 0
		mov	[bp+var_531], 0
		mov	[bp+var_530], 0
		push	2
		lea	ax, [bp+var_52C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A11E6
		cmp	[bp+var_A0], 0
		jz	short loc_A11E6
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A11E6:				; CODE XREF: sub_9E080+3143j
					; sub_9E080+314Bj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_A127A
		cmp	[bp+var_78], 0
		jz	short loc_A127A
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A127A:				; CODE XREF: sub_9E080+31DAj
					; sub_9E080+31E1j
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		cmp	[bp+var_69], 0
		jz	short loc_A12B2
		cmp	[bp+var_6E], 0
		jz	short loc_A12B2
		push	0
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A12B2:				; CODE XREF: sub_9E080+3212j
					; sub_9E080+3219j
		mov	[bp+var_6E], 0
		mov	[bp+var_69], 0
		mov	[bp+var_68], 0
		cmp	[bp+var_5F], 0
		jz	short loc_A12EA
		cmp	[bp+var_64], 0
		jz	short loc_A12EA
		push	0
		mov	al, [bp+var_60]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A12EA:				; CODE XREF: sub_9E080+324Aj
					; sub_9E080+3251j
		mov	[bp+var_64], 0
		mov	[bp+var_5F], 0
		mov	[bp+var_5E], 0
		cmp	[bp+var_55], 0
		jz	short loc_A1322
		cmp	[bp+var_5A], 0
		jz	short loc_A1322
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1322:				; CODE XREF: sub_9E080+3282j
					; sub_9E080+3289j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_A135A
		cmp	[bp+var_50], 0
		jz	short loc_A135A
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A135A:				; CODE XREF: sub_9E080+32BAj
					; sub_9E080+32C1j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A1392
		cmp	[bp+var_46], 0
		jz	short loc_A1392
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1392:				; CODE XREF: sub_9E080+32F2j
					; sub_9E080+32F9j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_25A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_23A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_A1422
		cmp	[bp+var_28], 0
		jz	short loc_A1422
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1422:				; CODE XREF: sub_9E080+3382j
					; sub_9E080+3389j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_222]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A147E:				; CODE XREF: sub_9E080+304Fj
		mov	[bp+var_BE], 0
		mov	[bp+var_BA], 2
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		push	17h
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_C1], 0
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_CE], 0
		mov	[bp+var_CA], 2
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		push	11h
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_D1], 0
		lea	ax, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D4]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_DE], 0
		mov	[bp+var_DA], 2
		mov	[bp+var_D9], 0
		mov	[bp+var_D8], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		push	0Dh
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_E1], 0
		lea	ax, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_EE], 0
		mov	[bp+var_EA], 2
		mov	[bp+var_E9], 0
		mov	[bp+var_E8], 0
		push	3
		lea	ax, [bp+var_EE]
		push	ax
		push	18h
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_F8], 0
		mov	[bp+var_F4], 2
		mov	[bp+var_F3], 0
		mov	[bp+var_F2], 0
		push	3
		lea	ax, [bp+var_F8]
		push	ax
		push	0
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_102], 0
		mov	[bp+var_FE], 2
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		push	3
		lea	ax, [bp+var_102]
		push	ax
		push	8
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_140], 0
		mov	[bp+var_13C], 2
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		lea	ax, [bp+var_214]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFE7h
		push	0
		lea	ax, [bp+var_64]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144+2], ax
		push	1
		push	0
		lea	ax, [bp+var_50]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144], ax
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_144+2]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_144+2]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0FFECh
		push	0
		lea	ax, [bp+var_EE]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_146], ax
		push	[bp+var_146]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	5
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_14A+2], ax
		push	word ptr [bp+var_14A+2]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0FFF8h
		push	0
		lea	ax, [bp+var_102]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14A], ax
		push	word ptr [bp+var_14A]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_C4]
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_E4]
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_D4]
		mov	al, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_14C], 3
		mov	di, 0FFFFh
		mov	word ptr [bp+var_150+2], 1
		jmp	loc_A183D
; ���������������������������������������������������������������������������

loc_A176F:				; CODE XREF: sub_9E080+37D8j
		mov	si, [bp+var_D65]
		cmp	si, 1
		jnz	short loc_A178F
		mov	ax, word ptr [bp+var_150+2]
		mov	word ptr [bp+var_150], ax
		inc	word ptr [bp+var_150+2]
		mov	bx, word ptr [bp+var_14A]
		mov	ax, word ptr [bp+var_150]
		mov	[bx+1Bh], ax

loc_A178F:				; CODE XREF: sub_9E080+36F6j
		cmp	si, 0Ah
		jle	short loc_A17B1
		test	si, 1
		jz	short loc_A17B1
		mov	ax, word ptr [bp+var_150+2]
		mov	word ptr [bp+var_154+2], ax
		inc	word ptr [bp+var_150+2]
		mov	bx, word ptr [bp+var_14A]
		mov	ax, word ptr [bp+var_154+2]
		mov	[bx+1Bh], ax

loc_A17B1:				; CODE XREF: sub_9E080+3712j
					; sub_9E080+3718j
		add	[bp+var_14C], di
		cmp	[bp+var_14C], 0
		jge	short loc_A17C2
		mov	[bp+var_14C], 0

loc_A17C2:				; CODE XREF: sub_9E080+373Aj
		mov	ax, [bp+var_14C]
		mov	word ptr [bp+var_154], ax
		mov	bx, word ptr [bp+var_14A+2]
		mov	ax, word ptr [bp+var_154]
		mov	[bx+1Bh], ax
		cmp	si, 2
		jnz	short loc_A17DD
		mov	di, 1

loc_A17DD:				; CODE XREF: sub_9E080+3758j
		cmp	si, 3
		jnz	short loc_A17E5
		mov	di, 0FFFFh

loc_A17E5:				; CODE XREF: sub_9E080+3760j
		cmp	si, 4
		jnz	short loc_A17ED
		mov	di, 1

loc_A17ED:				; CODE XREF: sub_9E080+3768j
		cmp	si, 5
		jnz	short loc_A17F5
		mov	di, 0FFFFh

loc_A17F5:				; CODE XREF: sub_9E080+3770j
		cmp	si, 7
		jnz	short loc_A17FD
		mov	di, 1

loc_A17FD:				; CODE XREF: sub_9E080+3778j
		cmp	si, 9
		jnz	short loc_A1805
		mov	di, 0FFFFh

loc_A1805:				; CODE XREF: sub_9E080+3780j
		cmp	si, 0Ah
		jnz	short loc_A180D
		mov	di, 1

loc_A180D:				; CODE XREF: sub_9E080+3788j
		cmp	si, 0Ch
		jnz	short loc_A1814
		xor	di, di

loc_A1814:				; CODE XREF: sub_9E080+3790j
		cmp	si, 10h
		jnz	short loc_A181C
		mov	di, 1

loc_A181C:				; CODE XREF: sub_9E080+3797j
		cmp	si, 14h
		jnz	short loc_A1823
		xor	di, di

loc_A1823:				; CODE XREF: sub_9E080+379Fj
		jmp	short loc_A1830
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A1830
		jmp	short loc_A185B
; ���������������������������������������������������������������������������

loc_A1830:				; CODE XREF: sub_9E080:loc_A1823j
					; sub_9E080+37ACj
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A183D:				; CODE XREF: sub_9E080+36ECj
		cmp	[bp+var_D65], 28h ; '('
		jnb	short loc_A184B
		cmp	[bp+var_D63], 0
		jz	short loc_A1850

loc_A184B:				; CODE XREF: sub_9E080+37C2j
		mov	ax, 1
		jmp	short loc_A1852
; ���������������������������������������������������������������������������

loc_A1850:				; CODE XREF: sub_9E080+37C9j
		xor	ax, ax

loc_A1852:				; CODE XREF: sub_9E080+37CEj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A185B
		jmp	loc_A176F
; ���������������������������������������������������������������������������

loc_A185B:				; CODE XREF: sub_9E080+37AEj
					; sub_9E080+37D6j
		mov	[bp+var_14C], 6
		mov	[bp+var_6], 16h
		mov	ax, [bp+var_D65]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	di, dx
		jmp	loc_A1978
; ���������������������������������������������������������������������������

loc_A1885:				; CODE XREF: sub_9E080+3912j
		mov	si, [bp+var_D65]
		test	si, 1
		jz	short loc_A18AD
		cmp	word ptr [bp+var_150+2], 21h ; '!'
		jge	short loc_A18AD
		mov	ax, word ptr [bp+var_150+2]
		mov	word ptr [bp+var_150], ax
		inc	word ptr [bp+var_150+2]
		mov	bx, word ptr [bp+var_14A]
		mov	ax, word ptr [bp+var_150]
		mov	[bx+1Bh], ax

loc_A18AD:				; CODE XREF: sub_9E080+380Dj
					; sub_9E080+3814j
		mov	ax, [bp+var_14C]
		mov	word ptr [bp+var_154+2], ax
		inc	[bp+var_14C]
		mov	bx, word ptr [bp+var_14A+2]
		mov	ax, word ptr [bp+var_154+2]
		mov	[bx+1Bh], ax
		cmp	[bp+var_14C], 0Dh
		jle	short loc_A18D1
		mov	[bp+var_14C], 0Dh

loc_A18D1:				; CODE XREF: sub_9E080+3849j
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, si
		jnz	short loc_A191C
		mov	[bp+var_D8E], 11BCh
		mov	[bp+var_D8E], 11C8h
		mov	[bp+var_D8E], 11D8h
		mov	[bp+var_D8E], 11E8h
		mov	[bp+var_D8E], 11FCh
		lea	ax, [bp+var_25A]
		push	ax
		push	0
		push	[bp+var_23D]
		push	[bp+var_23F]
		push	[bp+var_241]
		push	[bp+var_243]
		lea	ax, [bp+var_D8E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A191C:				; CODE XREF: sub_9E080+3858j
		jmp	short loc_A196B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A196B
		mov	word ptr [bp-0D9Ah], 11BCh
		mov	word ptr [bp-0D9Ah], 11C8h
		mov	word ptr [bp-0D9Ah], 11D8h
		mov	word ptr [bp-0D9Ah], 11E8h
		mov	word ptr [bp-0D9Ah], 11FCh
		lea	ax, [bp-25Ah]
		push	ax
		push	0
		push	word ptr [bp-23Dh]
		push	word ptr [bp-23Fh]
		push	word ptr [bp-241h]
		push	word ptr [bp-243h]
		lea	ax, [bp-0D9Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_A1995
; ���������������������������������������������������������������������������

loc_A196B:				; CODE XREF: sub_9E080:loc_A191Cj
					; sub_9E080+38A5j
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A1978:				; CODE XREF: sub_9E080+3802j
		cmp	[bp+var_D65], di
		jnb	short loc_A1985
		cmp	[bp+var_D63], 0
		jz	short loc_A198A

loc_A1985:				; CODE XREF: sub_9E080+38FCj
		mov	ax, 1
		jmp	short loc_A198C
; ���������������������������������������������������������������������������

loc_A198A:				; CODE XREF: sub_9E080+3903j
		xor	ax, ax

loc_A198C:				; CODE XREF: sub_9E080+3908j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A1995
		jmp	loc_A1885
; ���������������������������������������������������������������������������

loc_A1995:				; CODE XREF: sub_9E080+38E9j
					; sub_9E080+3910j
		cmp	[bp+var_C], 0
		jz	short loc_A19A8
		lea	ax, [bp+var_D60]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_A19A8:				; CODE XREF: sub_9E080+3919j
		push	0
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_13B], 0
		jz	short loc_A19DF
		cmp	[bp+var_140], 0
		jz	short loc_A19DF
		push	0
		mov	al, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A19DF:				; CODE XREF: sub_9E080+393Cj
					; sub_9E080+3944j
		mov	[bp+var_140], 0
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		cmp	byte_495FC, 0
		jnz	short loc_A1A00
		jmp	loc_A1F53
; ���������������������������������������������������������������������������

loc_A1A00:				; CODE XREF: sub_9E080+397Bj
		cmp	[bp+var_FD], 0
		jz	short loc_A1A28
		cmp	[bp+var_102], 0
		jz	short loc_A1A28
		push	0
		mov	al, [bp+var_FE]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1A28:				; CODE XREF: sub_9E080+3985j
					; sub_9E080+398Dj
		mov	[bp+var_102], 0
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		cmp	[bp+var_F3], 0
		jz	short loc_A1A67
		cmp	[bp+var_F8], 0
		jz	short loc_A1A67
		push	0
		mov	al, [bp+var_F4]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1A67:				; CODE XREF: sub_9E080+39C4j
					; sub_9E080+39CCj
		mov	[bp+var_F8], 0
		mov	[bp+var_F3], 0
		mov	[bp+var_F2], 0
		cmp	[bp+var_E9], 0
		jz	short loc_A1AA6
		cmp	[bp+var_EE], 0
		jz	short loc_A1AA6
		push	0
		mov	al, [bp+var_EA]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1AA6:				; CODE XREF: sub_9E080+3A03j
					; sub_9E080+3A0Bj
		mov	[bp+var_EE], 0
		mov	[bp+var_E9], 0
		mov	[bp+var_E8], 0
		push	2
		lea	ax, [bp+var_E4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D9], 0
		jz	short loc_A1AF4
		cmp	[bp+var_DE], 0
		jz	short loc_A1AF4
		push	0
		mov	al, [bp+var_DA]
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1AF4:				; CODE XREF: sub_9E080+3A51j
					; sub_9E080+3A59j
		mov	[bp+var_DE], 0
		mov	[bp+var_D9], 0
		mov	[bp+var_D8], 0
		push	2
		lea	ax, [bp+var_D4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C9], 0
		jz	short loc_A1B42
		cmp	[bp+var_CE], 0
		jz	short loc_A1B42
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1B42:				; CODE XREF: sub_9E080+3A9Fj
					; sub_9E080+3AA7j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		push	2
		lea	ax, [bp+var_C4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B9], 0
		jz	short loc_A1B90
		cmp	[bp+var_BE], 0
		jz	short loc_A1B90
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1B90:				; CODE XREF: sub_9E080+3AEDj
					; sub_9E080+3AF5j
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_A1BCF
		cmp	[bp+var_B4], 0
		jz	short loc_A1BCF
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1BCF:				; CODE XREF: sub_9E080+3B2Cj
					; sub_9E080+3B34j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		mov	[bp+var_D60], 185Fh
		lea	ax, [bp+var_D60]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_D4B], 0
		jz	short loc_A1C21
		cmp	[bp+var_D50], 0
		jz	short loc_A1C21
		push	0
		mov	al, [bp+var_D4C]
		push	ax
		lea	ax, [bp+var_D50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1C21:				; CODE XREF: sub_9E080+3B7Ej
					; sub_9E080+3B86j
		mov	[bp+var_D50], 0
		mov	[bp+var_D4B], 0
		mov	[bp+var_D4A], 0
		lea	ax, [bp+var_53A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_531], 0
		jz	short loc_A1C6D
		cmp	[bp+var_536], 0
		jz	short loc_A1C6D
		push	0
		mov	al, [bp+var_532]
		push	ax
		lea	ax, [bp+var_536]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1C6D:				; CODE XREF: sub_9E080+3BCAj
					; sub_9E080+3BD2j
		mov	[bp+var_536], 0
		mov	[bp+var_531], 0
		mov	[bp+var_530], 0
		push	2
		lea	ax, [bp+var_52C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A1CBB
		cmp	[bp+var_A0], 0
		jz	short loc_A1CBB
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1CBB:				; CODE XREF: sub_9E080+3C18j
					; sub_9E080+3C20j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_A1D4F
		cmp	[bp+var_78], 0
		jz	short loc_A1D4F
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1D4F:				; CODE XREF: sub_9E080+3CAFj
					; sub_9E080+3CB6j
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		cmp	[bp+var_69], 0
		jz	short loc_A1D87
		cmp	[bp+var_6E], 0
		jz	short loc_A1D87
		push	0
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1D87:				; CODE XREF: sub_9E080+3CE7j
					; sub_9E080+3CEEj
		mov	[bp+var_6E], 0
		mov	[bp+var_69], 0
		mov	[bp+var_68], 0
		cmp	[bp+var_5F], 0
		jz	short loc_A1DBF
		cmp	[bp+var_64], 0
		jz	short loc_A1DBF
		push	0
		mov	al, [bp+var_60]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1DBF:				; CODE XREF: sub_9E080+3D1Fj
					; sub_9E080+3D26j
		mov	[bp+var_64], 0
		mov	[bp+var_5F], 0
		mov	[bp+var_5E], 0
		cmp	[bp+var_55], 0
		jz	short loc_A1DF7
		cmp	[bp+var_5A], 0
		jz	short loc_A1DF7
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1DF7:				; CODE XREF: sub_9E080+3D57j
					; sub_9E080+3D5Ej
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_A1E2F
		cmp	[bp+var_50], 0
		jz	short loc_A1E2F
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1E2F:				; CODE XREF: sub_9E080+3D8Fj
					; sub_9E080+3D96j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A1E67
		cmp	[bp+var_46], 0
		jz	short loc_A1E67
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1E67:				; CODE XREF: sub_9E080+3DC7j
					; sub_9E080+3DCEj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_25A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_23A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_A1EF7
		cmp	[bp+var_28], 0
		jz	short loc_A1EF7
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A1EF7:				; CODE XREF: sub_9E080+3E57j
					; sub_9E080+3E5Ej
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_222]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A1F53:				; CODE XREF: sub_9E080+397Dj
		lea	ax, [bp+var_214]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_140], 0
		mov	[bp+var_13C], 2
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		push	3
		lea	ax, [bp+var_140]
		push	ax
		push	25F3h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	[bp+var_84]
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_7E]
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0FFC1h
		push	0
		lea	ax, [bp+var_64]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144+2], ax
		push	word ptr [bp+var_144+2]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	0
		lea	ax, [bp+var_B4]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144], ax
		push	word ptr [bp+var_144]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_140]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	di, ax
		push	di
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	19h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	0
		lea	ax, [bp+var_25C]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp+var_25C]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_140]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_146], ax
		push	[bp+var_146]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14C], 2
		mov	byte ptr [bp+var_14C+1], 0
		mov	[bp+var_14A], 0
		mov	[bp+var_D8C], 0
		mov	[bp+var_D88], 2
		mov	[bp+var_D87], 0
		mov	[bp+var_D86], 0
		mov	word ptr [bp+var_D92+2], 0
		mov	[bp+var_D8E], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_A211C
		jmp	loc_A219B
; ���������������������������������������������������������������������������

loc_A211C:				; CODE XREF: sub_9E080+4097j
		push	3
		lea	ax, [bp+var_150]
		push	ax
		push	5
		lea	ax, [bp+var_52C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D92+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_150]
		push	ax
		lea	ax, [bp+var_D92+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EAC
		mov	word ptr [bp+var_154+2], ax
		mov	word ptr [bp+var_154], 0
		cmp	word ptr [bp+var_D92+2], 0
		jz	short loc_A219B
		push	[bp+var_D8E]
		mov	bx, word ptr [bp+var_D92+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_154+2]
		push	[bp+var_D8E]
		mov	bx, word ptr [bp+var_D92+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_A219B:				; CODE XREF: sub_9E080+4099j
					; sub_9E080+40E9j
		xor	si, si
		mov	[bp+var_156], 1
		cmp	[bp+var_C], 0
		jnz	short loc_A21AC
		jmp	loc_A238B
; ���������������������������������������������������������������������������

loc_A21AC:				; CODE XREF: sub_9E080+4127j
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_160], 0
		mov	byte ptr [bp+var_15C], 2
		mov	byte ptr [bp+var_15C+1], 0
		mov	[bp+var_15A], 0
		push	2
		lea	ax, [bp+var_160]
		push	ax
		push	0
		lea	ax, [bp+var_4B4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_160]
		push	ax
		push	di
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_164+2], 0
		jmp	short loc_A2214
; ���������������������������������������������������������������������������

loc_A2203:				; CODE XREF: sub_9E080+4199j
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_164+2]

loc_A2214:				; CODE XREF: sub_9E080+4181j
		cmp	word ptr [bp+var_164+2], 3
		jl	short loc_A2203
		jmp	loc_A22A0
; ���������������������������������������������������������������������������

loc_A221E:				; CODE XREF: sub_9E080+422Dj
		or	si, si
		jnz	short loc_A2243
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_A2243
		mov	si, 0FFFFh
		jmp	short loc_A2254
; ���������������������������������������������������������������������������

loc_A2243:				; CODE XREF: sub_9E080+41A0j
					; sub_9E080+41BCj
		cmp	si, 0FFFFh
		jnz	short loc_A224D
		mov	si, 1
		jmp	short loc_A2254
; ���������������������������������������������������������������������������

loc_A224D:				; CODE XREF: sub_9E080+41C6j
		cmp	si, 1
		jnz	short loc_A2254
		xor	si, si

loc_A2254:				; CODE XREF: sub_9E080+41C1j
					; sub_9E080+41CBj ...
		push	si
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
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
		push	[bp+var_146]
		mov	bx, [bp+var_146]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_A2293
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A2293
		jmp	short loc_A22B0
; ���������������������������������������������������������������������������

loc_A2293:				; CODE XREF: sub_9E080+4206j
					; sub_9E080+420Fj
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A22A0:				; CODE XREF: sub_9E080+419Bj
		push	di
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_A22B0
		jmp	loc_A221E
; ���������������������������������������������������������������������������

loc_A22B0:				; CODE XREF: sub_9E080+4211j
					; sub_9E080+422Bj
		mov	word ptr [bp+var_164+2], 0
		jmp	loc_A233F
; ���������������������������������������������������������������������������

loc_A22B9:				; CODE XREF: sub_9E080+42C6j
		or	si, si
		jnz	short loc_A22DE
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_A22DE
		mov	si, 0FFFFh
		jmp	short loc_A22EF
; ���������������������������������������������������������������������������

loc_A22DE:				; CODE XREF: sub_9E080+423Bj
					; sub_9E080+4257j
		cmp	si, 0FFFFh
		jnz	short loc_A22E8
		mov	si, 1
		jmp	short loc_A22EF
; ���������������������������������������������������������������������������

loc_A22E8:				; CODE XREF: sub_9E080+4261j
		cmp	si, 1
		jnz	short loc_A22EF
		xor	si, si

loc_A22EF:				; CODE XREF: sub_9E080+425Cj
					; sub_9E080+4266j ...
		push	si
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
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
		push	[bp+var_146]
		mov	bx, [bp+var_146]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_A232E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A232E
		jmp	short loc_A2349
; ���������������������������������������������������������������������������

loc_A232E:				; CODE XREF: sub_9E080+42A1j
					; sub_9E080+42AAj
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_164+2]

loc_A233F:				; CODE XREF: sub_9E080+4236j
		cmp	word ptr [bp+var_164+2], 0Ah
		jge	short loc_A2349
		jmp	loc_A22B9
; ���������������������������������������������������������������������������

loc_A2349:				; CODE XREF: sub_9E080+42ACj
					; sub_9E080+42C4j
		cmp	byte ptr [bp+var_15C+1], 0
		jz	short loc_A2371
		cmp	[bp+var_160], 0
		jz	short loc_A2371
		push	0
		mov	al, byte ptr [bp+var_15C]
		push	ax
		lea	ax, [bp+var_160]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2371:				; CODE XREF: sub_9E080+42CEj
					; sub_9E080+42D6j
		mov	[bp+var_160], 0
		mov	byte ptr [bp+var_15C+1], 0
		mov	[bp+var_15A], 0
		jmp	loc_A26E2
; ���������������������������������������������������������������������������

loc_A238B:				; CODE XREF: sub_9E080+4129j
		mov	[bp+var_6], 3Ah	; ':'
		mov	ax, [bp+var_D65]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_A250B
; ���������������������������������������������������������������������������

loc_A23B0:				; CODE XREF: sub_9E080+44A8j
		mov	ax, [bp+var_D65]
		mov	word ptr [bp+var_15A+2], ax
		or	si, si
		jnz	short loc_A23DD
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_A23DD
		mov	si, 0FFFFh
		jmp	short loc_A23EE
; ���������������������������������������������������������������������������

loc_A23DD:				; CODE XREF: sub_9E080+433Aj
					; sub_9E080+4356j
		cmp	si, 0FFFFh
		jnz	short loc_A23E7
		mov	si, 1
		jmp	short loc_A23EE
; ���������������������������������������������������������������������������

loc_A23E7:				; CODE XREF: sub_9E080+4360j
		cmp	si, 1
		jnz	short loc_A23EE
		xor	si, si

loc_A23EE:				; CODE XREF: sub_9E080+435Bj
					; sub_9E080+4365j ...
		push	si
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
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
		push	[bp+var_146]
		mov	bx, [bp+var_146]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		add	[bp+var_156], si
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, word ptr [bp+var_15A+2]
		jnz	short loc_A244B
		mov	ax, [bp+var_A]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_25C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_A244B:				; CODE XREF: sub_9E080+43AEj
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, word ptr [bp+var_15A+2]
		jnz	short loc_A2463
		push	25F7h
		push	di
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_A2463:				; CODE XREF: sub_9E080+43D5j
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, word ptr [bp+var_15A+2]
		jnz	short loc_A24AF
		mov	[bp+var_D9C], 11BCh
		mov	[bp+var_D9C], 11C8h
		mov	[bp+var_D9C], 11D8h
		mov	[bp+var_D9C], 11E8h
		mov	[bp+var_D9C], 11FCh
		lea	ax, [bp+var_25A]
		push	ax
		push	0
		push	[bp+var_23D]
		push	[bp+var_23F]
		push	[bp+var_241]
		push	[bp+var_243]
		lea	ax, [bp+var_D9C]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A24AF:				; CODE XREF: sub_9E080+43EBj
		jmp	short loc_A24FE
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A24FE
		mov	word ptr [bp-0DA8h], 11BCh
		mov	word ptr [bp-0DA8h], 11C8h
		mov	word ptr [bp-0DA8h], 11D8h
		mov	word ptr [bp-0DA8h], 11E8h
		mov	word ptr [bp-0DA8h], 11FCh
		lea	ax, [bp-25Ah]
		push	ax
		push	0
		push	word ptr [bp-23Dh]
		push	word ptr [bp-23Fh]
		push	word ptr [bp-241h]
		push	word ptr [bp-243h]
		lea	ax, [bp-0DA8h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_A252B
; ���������������������������������������������������������������������������

loc_A24FE:				; CODE XREF: sub_9E080:loc_A24AFj
					; sub_9E080+4438j
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A250B:				; CODE XREF: sub_9E080+432Dj
		mov	ax, [bp+var_D65]
		cmp	ax, [bp+var_4]
		jnb	short loc_A251B
		cmp	[bp+var_D63], 0
		jz	short loc_A2520

loc_A251B:				; CODE XREF: sub_9E080+4492j
		mov	ax, 1
		jmp	short loc_A2522
; ���������������������������������������������������������������������������

loc_A2520:				; CODE XREF: sub_9E080+4499j
		xor	ax, ax

loc_A2522:				; CODE XREF: sub_9E080+449Ej
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A252B
		jmp	loc_A23B0
; ���������������������������������������������������������������������������

loc_A252B:				; CODE XREF: sub_9E080+447Cj
					; sub_9E080+44A6j
		mov	[bp+var_6], 37h	; '7'
		mov	ax, [bp+var_D65]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_A26C2
; ���������������������������������������������������������������������������

loc_A2550:				; CODE XREF: sub_9E080+465Fj
		mov	ax, [bp+var_D65]
		mov	word ptr [bp+var_15A+2], ax
		or	si, si
		jnz	short loc_A257D
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_A257D
		mov	si, 0FFFFh
		jmp	short loc_A258E
; ���������������������������������������������������������������������������

loc_A257D:				; CODE XREF: sub_9E080+44DAj
					; sub_9E080+44F6j
		cmp	si, 0FFFFh
		jnz	short loc_A2587
		mov	si, 1
		jmp	short loc_A258E
; ���������������������������������������������������������������������������

loc_A2587:				; CODE XREF: sub_9E080+4500j
		cmp	si, 1
		jnz	short loc_A258E
		xor	si, si

loc_A258E:				; CODE XREF: sub_9E080+44FBj
					; sub_9E080+4505j ...
		push	si
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
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
		push	[bp+var_146]
		mov	bx, [bp+var_146]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		add	[bp+var_156], si
		mov	ax, [bp+var_2]
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_15A+2]
		jnz	short loc_A25EB
		mov	ax, [bp+var_A]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_25C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_A25EB:				; CODE XREF: sub_9E080+454Ej
		mov	ax, [bp+var_2]
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_15A+2]
		jnz	short loc_A2603
		push	2610h
		push	di
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_A2603:				; CODE XREF: sub_9E080+4575j
		mov	ax, [bp+var_2]
		add	ax, 8
		cmp	ax, word ptr [bp+var_15A+2]
		jnz	short loc_A261A
		push	0Eh
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A261A:				; CODE XREF: sub_9E080+458Dj
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, word ptr [bp+var_15A+2]
		jnz	short loc_A2666
		mov	[bp+var_D9C], 11BCh
		mov	[bp+var_D9C], 11C8h
		mov	[bp+var_D9C], 11D8h
		mov	[bp+var_D9C], 11E8h
		mov	[bp+var_D9C], 11FCh
		lea	ax, [bp+var_25A]
		push	ax
		push	0
		push	[bp+var_23D]
		push	[bp+var_23F]
		push	[bp+var_241]
		push	[bp+var_243]
		lea	ax, [bp+var_D9C]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A2666:				; CODE XREF: sub_9E080+45A2j
		jmp	short loc_A26B5
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A26B5
		mov	word ptr [bp-0DA8h], 11BCh
		mov	word ptr [bp-0DA8h], 11C8h
		mov	word ptr [bp-0DA8h], 11D8h
		mov	word ptr [bp-0DA8h], 11E8h
		mov	word ptr [bp-0DA8h], 11FCh
		lea	ax, [bp-25Ah]
		push	ax
		push	0
		push	word ptr [bp-23Dh]
		push	word ptr [bp-23Fh]
		push	word ptr [bp-241h]
		push	word ptr [bp-243h]
		lea	ax, [bp-0DA8h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_A26E2
; ���������������������������������������������������������������������������

loc_A26B5:				; CODE XREF: sub_9E080:loc_A2666j
					; sub_9E080+45EFj
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A26C2:				; CODE XREF: sub_9E080+44CDj
		mov	ax, [bp+var_D65]
		cmp	ax, [bp+var_4]
		jnb	short loc_A26D2
		cmp	[bp+var_D63], 0
		jz	short loc_A26D7

loc_A26D2:				; CODE XREF: sub_9E080+4649j
		mov	ax, 1
		jmp	short loc_A26D9
; ���������������������������������������������������������������������������

loc_A26D7:				; CODE XREF: sub_9E080+4650j
		xor	ax, ax

loc_A26D9:				; CODE XREF: sub_9E080+4655j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A26E2
		jmp	loc_A2550
; ���������������������������������������������������������������������������

loc_A26E2:				; CODE XREF: sub_9E080+4308j
					; sub_9E080+4633j ...
		lea	ax, [bp+var_D92+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_D87], 0
		jz	short loc_A2717
		cmp	[bp+var_D8C], 0
		jz	short loc_A2717
		push	0
		mov	al, [bp+var_D88]
		push	ax
		lea	ax, [bp+var_D8C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2717:				; CODE XREF: sub_9E080+4674j
					; sub_9E080+467Cj
		mov	[bp+var_D8C], 0
		mov	[bp+var_D87], 0
		mov	[bp+var_D86], 0
		cmp	byte ptr [bp+var_14C+1], 0
		jz	short loc_A2756
		cmp	[bp+var_150], 0
		jz	short loc_A2756
		push	0
		mov	al, byte ptr [bp+var_14C]
		push	ax
		lea	ax, [bp+var_150]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2756:				; CODE XREF: sub_9E080+46B3j
					; sub_9E080+46BBj
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14C+1], 0
		mov	[bp+var_14A], 0
		cmp	[bp+var_13B], 0
		jz	short loc_A2795
		cmp	[bp+var_140], 0
		jz	short loc_A2795
		push	0
		mov	al, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2795:				; CODE XREF: sub_9E080+46F2j
					; sub_9E080+46FAj
		mov	[bp+var_140], 0
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		push	0
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_A27C5
		jmp	loc_A2D18
; ���������������������������������������������������������������������������

loc_A27C5:				; CODE XREF: sub_9E080+4740j
		cmp	[bp+var_FD], 0
		jz	short loc_A27ED
		cmp	[bp+var_102], 0
		jz	short loc_A27ED
		push	0
		mov	al, [bp+var_FE]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A27ED:				; CODE XREF: sub_9E080+474Aj
					; sub_9E080+4752j
		mov	[bp+var_102], 0
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		cmp	[bp+var_F3], 0
		jz	short loc_A282C
		cmp	[bp+var_F8], 0
		jz	short loc_A282C
		push	0
		mov	al, [bp+var_F4]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A282C:				; CODE XREF: sub_9E080+4789j
					; sub_9E080+4791j
		mov	[bp+var_F8], 0
		mov	[bp+var_F3], 0
		mov	[bp+var_F2], 0
		cmp	[bp+var_E9], 0
		jz	short loc_A286B
		cmp	[bp+var_EE], 0
		jz	short loc_A286B
		push	0
		mov	al, [bp+var_EA]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A286B:				; CODE XREF: sub_9E080+47C8j
					; sub_9E080+47D0j
		mov	[bp+var_EE], 0
		mov	[bp+var_E9], 0
		mov	[bp+var_E8], 0
		push	2
		lea	ax, [bp+var_E4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D9], 0
		jz	short loc_A28B9
		cmp	[bp+var_DE], 0
		jz	short loc_A28B9
		push	0
		mov	al, [bp+var_DA]
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A28B9:				; CODE XREF: sub_9E080+4816j
					; sub_9E080+481Ej
		mov	[bp+var_DE], 0
		mov	[bp+var_D9], 0
		mov	[bp+var_D8], 0
		push	2
		lea	ax, [bp+var_D4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C9], 0
		jz	short loc_A2907
		cmp	[bp+var_CE], 0
		jz	short loc_A2907
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2907:				; CODE XREF: sub_9E080+4864j
					; sub_9E080+486Cj
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		push	2
		lea	ax, [bp+var_C4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B9], 0
		jz	short loc_A2955
		cmp	[bp+var_BE], 0
		jz	short loc_A2955
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2955:				; CODE XREF: sub_9E080+48B2j
					; sub_9E080+48BAj
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_A2994
		cmp	[bp+var_B4], 0
		jz	short loc_A2994
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2994:				; CODE XREF: sub_9E080+48F1j
					; sub_9E080+48F9j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		mov	[bp+var_D60], 185Fh
		lea	ax, [bp+var_D60]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_D4B], 0
		jz	short loc_A29E6
		cmp	[bp+var_D50], 0
		jz	short loc_A29E6
		push	0
		mov	al, [bp+var_D4C]
		push	ax
		lea	ax, [bp+var_D50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A29E6:				; CODE XREF: sub_9E080+4943j
					; sub_9E080+494Bj
		mov	[bp+var_D50], 0
		mov	[bp+var_D4B], 0
		mov	[bp+var_D4A], 0
		lea	ax, [bp+var_53A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_531], 0
		jz	short loc_A2A32
		cmp	[bp+var_536], 0
		jz	short loc_A2A32
		push	0
		mov	al, [bp+var_532]
		push	ax
		lea	ax, [bp+var_536]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2A32:				; CODE XREF: sub_9E080+498Fj
					; sub_9E080+4997j
		mov	[bp+var_536], 0
		mov	[bp+var_531], 0
		mov	[bp+var_530], 0
		push	2
		lea	ax, [bp+var_52C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A2A80
		cmp	[bp+var_A0], 0
		jz	short loc_A2A80
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2A80:				; CODE XREF: sub_9E080+49DDj
					; sub_9E080+49E5j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_A2B14
		cmp	[bp+var_78], 0
		jz	short loc_A2B14
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2B14:				; CODE XREF: sub_9E080+4A74j
					; sub_9E080+4A7Bj
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		cmp	[bp+var_69], 0
		jz	short loc_A2B4C
		cmp	[bp+var_6E], 0
		jz	short loc_A2B4C
		push	0
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2B4C:				; CODE XREF: sub_9E080+4AACj
					; sub_9E080+4AB3j
		mov	[bp+var_6E], 0
		mov	[bp+var_69], 0
		mov	[bp+var_68], 0
		cmp	[bp+var_5F], 0
		jz	short loc_A2B84
		cmp	[bp+var_64], 0
		jz	short loc_A2B84
		push	0
		mov	al, [bp+var_60]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2B84:				; CODE XREF: sub_9E080+4AE4j
					; sub_9E080+4AEBj
		mov	[bp+var_64], 0
		mov	[bp+var_5F], 0
		mov	[bp+var_5E], 0
		cmp	[bp+var_55], 0
		jz	short loc_A2BBC
		cmp	[bp+var_5A], 0
		jz	short loc_A2BBC
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2BBC:				; CODE XREF: sub_9E080+4B1Cj
					; sub_9E080+4B23j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_A2BF4
		cmp	[bp+var_50], 0
		jz	short loc_A2BF4
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2BF4:				; CODE XREF: sub_9E080+4B54j
					; sub_9E080+4B5Bj
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A2C2C
		cmp	[bp+var_46], 0
		jz	short loc_A2C2C
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2C2C:				; CODE XREF: sub_9E080+4B8Cj
					; sub_9E080+4B93j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_25A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_23A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_A2CBC
		cmp	[bp+var_28], 0
		jz	short loc_A2CBC
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A2CBC:				; CODE XREF: sub_9E080+4C1Cj
					; sub_9E080+4C23j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_222]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A2D18:				; CODE XREF: sub_9E080+4742j
		push	ds
		push	offset a_voc	; ".voc"
		push	ds
		push	offset aExplode2 ; "explode2"
		push	ds
		push	offset a____DataMidg_0 ; "..\\..\\data\\midgames\\mid1\\"
		lea	ax, [bp+var_206]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		mov	[bp+var_10C], 0
		mov	[bp+var_108], 2
		mov	[bp+var_107], 0
		mov	[bp+var_106], 0
		push	2
		lea	ax, [bp+var_10C]
		push	ax
		push	12h
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_10F], 0
		lea	ax, [bp+var_10C]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_11C], 0
		mov	[bp+var_118], 2
		mov	[bp+var_117], 0
		mov	[bp+var_116], 0
		push	2
		lea	ax, [bp+var_11C]
		push	ax
		push	0Fh
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_11F], 0
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_12C], 0
		mov	[bp+var_128], 2
		mov	[bp+var_127], 0
		mov	[bp+var_126], 0
		push	3
		lea	ax, [bp+var_12C]
		push	ax
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_136], 0
		mov	[bp+var_132], 2
		mov	[bp+var_131], 0
		mov	[bp+var_130], 0
		push	3
		lea	ax, [bp+var_136]
		push	ax
		push	3
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_140], 0
		mov	[bp+var_13C], 2
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		push	3
		lea	ax, [bp+var_140]
		push	ax
		push	4
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_214]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	[bp+var_8A]
		mov	al, [bp+var_88]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_122]
		mov	al, [bp+var_120]
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_112]
		mov	al, [bp+var_110]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0FFDDh
		push	0
		lea	ax, [bp+var_64]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144+2], ax
		push	word ptr [bp+var_144+2]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0FFDDh
		push	0
		lea	ax, [bp+var_50]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144], ax
		push	word ptr [bp+var_144]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0FFB5h
		push	0
		lea	ax, [bp+var_6E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_146], ax
		push	[bp+var_146]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	2
		push	38h ; '8'
		push	0
		lea	ax, [bp+var_46]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_14A+2], ax
		push	word ptr [bp+var_14A+2]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	6
		push	0
		lea	ax, [bp+var_140]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14A], ax
		push	word ptr [bp+var_14A]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0FFFEh
		push	0FFECh
		lea	ax, [bp+var_12C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_14C], ax
		push	[bp+var_14C]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0FFFEh
		push	0FFECh
		lea	ax, [bp+var_136]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_150+2], ax
		push	word ptr [bp+var_150+2]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_15A+2],	0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_154+2],	0
		push	2
		lea	ax, [bp+var_15A+2]
		push	ax
		push	9
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0FFBAh
		push	0
		lea	ax, [bp+var_15A+2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_15A], ax
		push	word ptr [bp+var_15A]
		lea	ax, [bp+var_D82]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	bx, word ptr [bp+var_15A]
		mov	word ptr [bx+1Bh], 0
		mov	bx, word ptr [bp+var_150+2]
		mov	word ptr [bx+1Bh], 0
		xor	di, di
		mov	[bp+var_15C], 0
		mov	word ptr [bp+var_160+2], 0
		mov	word ptr [bp+var_160], 0
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_16A], 0
		mov	[bp+var_166], 2
		mov	[bp+var_165], 0
		mov	[bp+var_164], 0
		mov	[bp+var_D8C], 0
		mov	[bp+var_D88], 2
		mov	[bp+var_D87], 0
		mov	[bp+var_D86], 0
		mov	word ptr [bp+var_D92+2], 0
		mov	[bp+var_D8E], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_A30ED
		jmp	loc_A316C
; ���������������������������������������������������������������������������

loc_A30ED:				; CODE XREF: sub_9E080+5068j
		push	3
		lea	ax, [bp+var_16A]
		push	ax
		push	69h ; 'i'
		lea	ax, [bp+var_52C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D92+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_16A]
		push	ax
		lea	ax, [bp+var_D92+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F74
		mov	word ptr [bp+var_16E+2], ax
		mov	word ptr [bp+var_16E], 0
		cmp	word ptr [bp+var_D92+2], 0
		jz	short loc_A316C
		push	[bp+var_D8E]
		mov	bx, word ptr [bp+var_D92+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_16E]
		push	word ptr [bp+var_16E+2]
		push	[bp+var_D8E]
		mov	bx, word ptr [bp+var_D92+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_A316C:				; CODE XREF: sub_9E080+506Aj
					; sub_9E080+50BAj
		mov	[bp+var_178], 0
		mov	[bp+var_174], 2
		mov	[bp+var_173], 0
		mov	[bp+var_172], 0
		cmp	[bp+var_C], 0
		jz	short loc_A31B6
		push	2
		lea	ax, [bp+var_178]
		push	ax
		push	1
		lea	ax, [bp+var_4B4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_178]
		push	ax
		lea	ax, [bp+var_D60]
		push	ax
		call	sub_7D11
		add	sp, 4

loc_A31B6:				; CODE XREF: sub_9E080+510Cj
		push	0
		lea	ax, [bp+var_25C]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0D4h ; '�'
		lea	ax, [bp+var_25C]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		jmp	loc_A3414
; ���������������������������������������������������������������������������

loc_A31D8:				; CODE XREF: sub_9E080+53B0j
		mov	si, [bp+var_D65]
		mov	ax, [bp+var_15C]
		mov	[bp+var_17A], ax
		inc	[bp+var_15C]
		mov	bx, word ptr [bp+var_15A]
		mov	ax, [bp+var_17A]
		mov	[bx+1Bh], ax
		cmp	si, 28h	; '('
		jge	short loc_A320C
		push	1
		push	0
		push	word ptr [bp+var_15A]
		mov	bx, word ptr [bp+var_15A]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_A320C:				; CODE XREF: sub_9E080+5176j
		cmp	si, 28h	; '('
		jle	short loc_A3230
		cmp	si, 3Ch	; '<'
		jge	short loc_A3230
		test	si, 1
		jz	short loc_A3230
		push	1
		push	0
		push	word ptr [bp+var_15A]
		mov	bx, word ptr [bp+var_15A]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_A3230:				; CODE XREF: sub_9E080+518Fj
					; sub_9E080+5194j ...
		cmp	si, 14h
		jnz	short loc_A324A
		cmp	[bp+var_C], 0
		jz	short loc_A324A
		push	0FFFFh
		lea	ax, [bp+var_D60]
		push	ax
		call	sub_83FE
		add	sp, 4

loc_A324A:				; CODE XREF: sub_9E080+51B3j
					; sub_9E080+51B9j
		cmp	si, 14h
		jnz	short loc_A3271
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A3271
		mov	ax, [bp+var_A]
		shl	ax, 3
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_25C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_A3271:				; CODE XREF: sub_9E080+51CDj
					; sub_9E080+51D6j
		cmp	si, 3Ch	; '<'
		jnz	short loc_A32C1
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A32C1
		mov	[bp+var_D9C], 11BCh
		mov	[bp+var_D9C], 11C8h
		mov	[bp+var_D9C], 11D8h
		mov	[bp+var_D9C], 11E8h
		mov	[bp+var_D9C], 11FCh
		lea	ax, [bp+var_25A]
		push	ax
		push	0
		push	[bp+var_23D]
		push	[bp+var_23F]
		push	[bp+var_241]
		push	[bp+var_243]
		lea	ax, [bp+var_D9C]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A32C1:				; CODE XREF: sub_9E080+51F4j
					; sub_9E080+51FDj
		or	si, si
		jle	short loc_A32DA
		cmp	si, 5
		jge	short loc_A32DA
		mov	[bp+var_17C], di
		inc	di
		mov	bx, word ptr [bp+var_150+2]
		mov	ax, [bp+var_17C]
		mov	[bx+1Bh], ax

loc_A32DA:				; CODE XREF: sub_9E080+5243j
					; sub_9E080+5248j
		cmp	si, 5
		jle	short loc_A32FB
		cmp	si, 0Fh
		jge	short loc_A32FB
		mov	ax, word ptr [bp+var_160+2]
		mov	[bp+var_17E], ax
		inc	word ptr [bp+var_160+2]
		mov	bx, [bp+var_14C]
		mov	ax, [bp+var_17E]
		mov	[bx+1Bh], ax

loc_A32FB:				; CODE XREF: sub_9E080+525Dj
					; sub_9E080+5262j
		cmp	si, 13h
		jle	short loc_A331B
		cmp	si, 33h	; '3'
		jge	short loc_A331B
		test	si, 1
		jz	short loc_A331B
		mov	[bp+var_180], di
		inc	di
		mov	bx, word ptr [bp+var_150+2]
		mov	ax, [bp+var_180]
		mov	[bx+1Bh], ax

loc_A331B:				; CODE XREF: sub_9E080+527Ej
					; sub_9E080+5283j ...
		cmp	si, 33h	; '3'
		jle	short loc_A333B
		cmp	si, 3Dh	; '='
		jge	short loc_A333B
		test	si, 1
		jz	short loc_A333B
		mov	word ptr [bp+var_184+2], di
		dec	di
		mov	bx, word ptr [bp+var_150+2]
		mov	ax, word ptr [bp+var_184+2]
		mov	[bx+1Bh], ax

loc_A333B:				; CODE XREF: sub_9E080+529Ej
					; sub_9E080+52A3j ...
		cmp	si, 3Dh	; '='
		jle	short loc_A335B
		cmp	si, 47h	; 'G'
		jge	short loc_A335B
		test	si, 1
		jz	short loc_A335B
		mov	word ptr [bp+var_184], di
		inc	di
		mov	bx, word ptr [bp+var_150+2]
		mov	ax, word ptr [bp+var_184]
		mov	[bx+1Bh], ax

loc_A335B:				; CODE XREF: sub_9E080+52BEj
					; sub_9E080+52C3j ...
		cmp	si, 2Dh	; '-'
		jle	short loc_A337C
		cmp	si, 37h	; '7'
		jge	short loc_A337C
		mov	ax, word ptr [bp+var_160]
		mov	[bp+var_186], ax
		inc	word ptr [bp+var_160]
		mov	bx, [bp+var_14C]
		mov	ax, [bp+var_186]
		mov	[bx+1Bh], ax

loc_A337C:				; CODE XREF: sub_9E080+52DEj
					; sub_9E080+52E3j
		cmp	si, 57h	; 'W'
		jnz	short loc_A3384
		sub	di, 2

loc_A3384:				; CODE XREF: sub_9E080+52FFj
		cmp	si, 6Eh	; 'n'
		jnz	short loc_A3399
		mov	word ptr [bp+var_18A+2], di
		inc	di
		mov	bx, word ptr [bp+var_150+2]
		mov	ax, word ptr [bp+var_18A+2]
		mov	[bx+1Bh], ax

loc_A3399:				; CODE XREF: sub_9E080+5307j
		cmp	si, 8Dh	; '�'
		jnz	short loc_A33AF
		mov	word ptr [bp+var_18A], di
		dec	di
		mov	bx, word ptr [bp+var_150+2]
		mov	ax, word ptr [bp+var_18A]
		mov	[bx+1Bh], ax

loc_A33AF:				; CODE XREF: sub_9E080+531Dj
		jmp	short loc_A3407
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A3407
		mov	al, [bp-0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A3405
		mov	word ptr [bp-0DA8h], 11BCh
		mov	word ptr [bp-0DA8h], 11C8h
		mov	word ptr [bp-0DA8h], 11D8h
		mov	word ptr [bp-0DA8h], 11E8h
		mov	word ptr [bp-0DA8h], 11FCh
		lea	ax, [bp-25Ah]
		push	ax
		push	0
		push	word ptr [bp-23Dh]
		push	word ptr [bp-23Fh]
		push	word ptr [bp-241h]
		push	word ptr [bp-243h]
		lea	ax, [bp-0DA8h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A3405:				; CODE XREF: sub_9E080+5341j
		jmp	short loc_A3433
; ���������������������������������������������������������������������������

loc_A3407:				; CODE XREF: sub_9E080:loc_A33AFj
					; sub_9E080+5338j
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A3414:				; CODE XREF: sub_9E080+5155j
		cmp	[bp+var_D65], 0BAh ; '�'
		jnb	short loc_A3423
		cmp	[bp+var_D63], 0
		jz	short loc_A3428

loc_A3423:				; CODE XREF: sub_9E080+539Aj
		mov	ax, 1
		jmp	short loc_A342A
; ���������������������������������������������������������������������������

loc_A3428:				; CODE XREF: sub_9E080+53A1j
		xor	ax, ax

loc_A342A:				; CODE XREF: sub_9E080+53A6j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A3433
		jmp	loc_A31D8
; ���������������������������������������������������������������������������

loc_A3433:				; CODE XREF: sub_9E080:loc_A3405j
					; sub_9E080+53AEj
		cmp	[bp+var_C], 0
		jz	short loc_A3446
		lea	ax, [bp+var_D60]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_A3446:				; CODE XREF: sub_9E080+53B7j
		mov	[bp+var_D65], 0
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		cmp	[bp+var_173], 0
		jz	short loc_A348B
		cmp	[bp+var_178], 0
		jz	short loc_A348B
		push	0
		mov	al, [bp+var_174]
		push	ax
		lea	ax, [bp+var_178]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A348B:				; CODE XREF: sub_9E080+53E8j
					; sub_9E080+53F0j
		mov	[bp+var_178], 0
		mov	[bp+var_173], 0
		mov	[bp+var_172], 0
		lea	ax, [bp+var_D92+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_D87], 0
		jz	short loc_A34D7
		cmp	[bp+var_D8C], 0
		jz	short loc_A34D7
		push	0
		mov	al, [bp+var_D88]
		push	ax
		lea	ax, [bp+var_D8C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A34D7:				; CODE XREF: sub_9E080+5434j
					; sub_9E080+543Cj
		mov	[bp+var_D8C], 0
		mov	[bp+var_D87], 0
		mov	[bp+var_D86], 0
		cmp	[bp+var_165], 0
		jz	short loc_A3516
		cmp	[bp+var_16A], 0
		jz	short loc_A3516
		push	0
		mov	al, [bp+var_166]
		push	ax
		lea	ax, [bp+var_16A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3516:				; CODE XREF: sub_9E080+5473j
					; sub_9E080+547Bj
		mov	[bp+var_16A], 0
		mov	[bp+var_165], 0
		mov	[bp+var_164], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_A3555
		cmp	[bp+var_15A+2],	0
		jz	short loc_A3555
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, [bp+var_15A+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3555:				; CODE XREF: sub_9E080+54B2j
					; sub_9E080+54BAj
		mov	[bp+var_15A+2],	0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_154+2],	0
		push	0
		lea	ax, [bp+var_D82]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_13B], 0
		jz	short loc_A35A3
		cmp	[bp+var_140], 0
		jz	short loc_A35A3
		push	0
		mov	al, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A35A3:				; CODE XREF: sub_9E080+5500j
					; sub_9E080+5508j
		mov	[bp+var_140], 0
		mov	[bp+var_13B], 0
		mov	[bp+var_13A], 0
		cmp	[bp+var_131], 0
		jz	short loc_A35E2
		cmp	[bp+var_136], 0
		jz	short loc_A35E2
		push	0
		mov	al, [bp+var_132]
		push	ax
		lea	ax, [bp+var_136]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A35E2:				; CODE XREF: sub_9E080+553Fj
					; sub_9E080+5547j
		mov	[bp+var_136], 0
		mov	[bp+var_131], 0
		mov	[bp+var_130], 0
		cmp	[bp+var_127], 0
		jz	short loc_A3621
		cmp	[bp+var_12C], 0
		jz	short loc_A3621
		push	0
		mov	al, [bp+var_128]
		push	ax
		lea	ax, [bp+var_12C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3621:				; CODE XREF: sub_9E080+557Ej
					; sub_9E080+5586j
		mov	[bp+var_12C], 0
		mov	[bp+var_127], 0
		mov	[bp+var_126], 0
		push	2
		lea	ax, [bp+var_122]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_117], 0
		jz	short loc_A366F
		cmp	[bp+var_11C], 0
		jz	short loc_A366F
		push	0
		mov	al, [bp+var_118]
		push	ax
		lea	ax, [bp+var_11C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A366F:				; CODE XREF: sub_9E080+55CCj
					; sub_9E080+55D4j
		mov	[bp+var_11C], 0
		mov	[bp+var_117], 0
		mov	[bp+var_116], 0
		push	2
		lea	ax, [bp+var_112]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_107], 0
		jz	short loc_A36BD
		cmp	[bp+var_10C], 0
		jz	short loc_A36BD
		push	0
		mov	al, [bp+var_108]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A36BD:				; CODE XREF: sub_9E080+561Aj
					; sub_9E080+5622j
		mov	[bp+var_10C], 0
		mov	[bp+var_107], 0
		mov	[bp+var_106], 0
		cmp	[bp+var_FD], 0
		jz	short loc_A36FC
		cmp	[bp+var_102], 0
		jz	short loc_A36FC
		push	0
		mov	al, [bp+var_FE]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A36FC:				; CODE XREF: sub_9E080+5659j
					; sub_9E080+5661j
		mov	[bp+var_102], 0
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		cmp	[bp+var_F3], 0
		jz	short loc_A373B
		cmp	[bp+var_F8], 0
		jz	short loc_A373B
		push	0
		mov	al, [bp+var_F4]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A373B:				; CODE XREF: sub_9E080+5698j
					; sub_9E080+56A0j
		mov	[bp+var_F8], 0
		mov	[bp+var_F3], 0
		mov	[bp+var_F2], 0
		cmp	[bp+var_E9], 0
		jz	short loc_A377A
		cmp	[bp+var_EE], 0
		jz	short loc_A377A
		push	0
		mov	al, [bp+var_EA]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A377A:				; CODE XREF: sub_9E080+56D7j
					; sub_9E080+56DFj
		mov	[bp+var_EE], 0
		mov	[bp+var_E9], 0
		mov	[bp+var_E8], 0
		push	2
		lea	ax, [bp+var_E4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D9], 0
		jz	short loc_A37C8
		cmp	[bp+var_DE], 0
		jz	short loc_A37C8
		push	0
		mov	al, [bp+var_DA]
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A37C8:				; CODE XREF: sub_9E080+5725j
					; sub_9E080+572Dj
		mov	[bp+var_DE], 0
		mov	[bp+var_D9], 0
		mov	[bp+var_D8], 0
		push	2
		lea	ax, [bp+var_D4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C9], 0
		jz	short loc_A3816
		cmp	[bp+var_CE], 0
		jz	short loc_A3816
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3816:				; CODE XREF: sub_9E080+5773j
					; sub_9E080+577Bj
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		push	2
		lea	ax, [bp+var_C4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B9], 0
		jz	short loc_A3864
		cmp	[bp+var_BE], 0
		jz	short loc_A3864
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3864:				; CODE XREF: sub_9E080+57C1j
					; sub_9E080+57C9j
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_A38A3
		cmp	[bp+var_B4], 0
		jz	short loc_A38A3
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A38A3:				; CODE XREF: sub_9E080+5800j
					; sub_9E080+5808j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		mov	[bp+var_D60], 185Fh
		lea	ax, [bp+var_D60]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_D4B], 0
		jz	short loc_A38F5
		cmp	[bp+var_D50], 0
		jz	short loc_A38F5
		push	0
		mov	al, [bp+var_D4C]
		push	ax
		lea	ax, [bp+var_D50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A38F5:				; CODE XREF: sub_9E080+5852j
					; sub_9E080+585Aj
		mov	[bp+var_D50], 0
		mov	[bp+var_D4B], 0
		mov	[bp+var_D4A], 0
		lea	ax, [bp+var_53A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_531], 0
		jz	short loc_A3941
		cmp	[bp+var_536], 0
		jz	short loc_A3941
		push	0
		mov	al, [bp+var_532]
		push	ax
		lea	ax, [bp+var_536]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3941:				; CODE XREF: sub_9E080+589Ej
					; sub_9E080+58A6j
		mov	[bp+var_536], 0
		mov	[bp+var_531], 0
		mov	[bp+var_530], 0
		push	2
		lea	ax, [bp+var_52C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A398F
		cmp	[bp+var_A0], 0
		jz	short loc_A398F
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A398F:				; CODE XREF: sub_9E080+58ECj
					; sub_9E080+58F4j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_A3A23
		cmp	[bp+var_78], 0
		jz	short loc_A3A23
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3A23:				; CODE XREF: sub_9E080+5983j
					; sub_9E080+598Aj
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		cmp	[bp+var_69], 0
		jz	short loc_A3A5B
		cmp	[bp+var_6E], 0
		jz	short loc_A3A5B
		push	0
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3A5B:				; CODE XREF: sub_9E080+59BBj
					; sub_9E080+59C2j
		mov	[bp+var_6E], 0
		mov	[bp+var_69], 0
		mov	[bp+var_68], 0
		cmp	[bp+var_5F], 0
		jz	short loc_A3A93
		cmp	[bp+var_64], 0
		jz	short loc_A3A93
		push	0
		mov	al, [bp+var_60]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3A93:				; CODE XREF: sub_9E080+59F3j
					; sub_9E080+59FAj
		mov	[bp+var_64], 0
		mov	[bp+var_5F], 0
		mov	[bp+var_5E], 0
		cmp	[bp+var_55], 0
		jz	short loc_A3ACB
		cmp	[bp+var_5A], 0
		jz	short loc_A3ACB
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3ACB:				; CODE XREF: sub_9E080+5A2Bj
					; sub_9E080+5A32j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_A3B03
		cmp	[bp+var_50], 0
		jz	short loc_A3B03
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3B03:				; CODE XREF: sub_9E080+5A63j
					; sub_9E080+5A6Aj
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A3B3B
		cmp	[bp+var_46], 0
		jz	short loc_A3B3B
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3B3B:				; CODE XREF: sub_9E080+5A9Bj
					; sub_9E080+5AA2j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_25A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_23A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_A3BCB
		cmp	[bp+var_28], 0
		jz	short loc_A3BCB
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A3BCB:				; CODE XREF: sub_9E080+5B2Bj
					; sub_9E080+5B32j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_222]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_9E080	endp

ovr206		ends
