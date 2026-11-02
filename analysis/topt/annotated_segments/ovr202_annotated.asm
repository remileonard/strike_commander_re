ovr202		segment	para public 'OVERLAY' use16
		assume cs:ovr202
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, cinématique to1mid1 de Tactical Operations (2026-11-02) : script extrait par
; tools/midgame_extract.py dans analysis/topt/midgames/to1mid1.md et .json, fichier
; analysis/topt/midgames/iff. Fonction entière lue par exécution symbolique, pas commentée
; ligne à ligne.
; ==============================================================================================
MidgameTO1_Play_74C00		proc far

var_402		= word ptr -402h
var_400		= word ptr -400h
var_3FE		= word ptr -3FEh
var_3FC		= word ptr -3FCh
var_3F2		= word ptr -3F2h
var_3C2		= word ptr -3C2h
var_395		= dword ptr -395h
var_391		= dword ptr -391h
var_38E		= word ptr -38Eh
var_38D		= dword ptr -38Dh
var_380		= word ptr -380h
var_37C		= dword ptr -37Ch
var_36C		= word ptr -36Ch
var_35D		= word ptr -35Dh
var_35B		= byte ptr -35Bh
var_358		= word ptr -358h
var_356		= word ptr -356h
var_354		= word ptr -354h
var_352		= word ptr -352h
var_350		= dword ptr -350h
var_34C		= byte ptr -34Ch
var_34A		= word ptr -34Ah
var_348		= word ptr -348h
var_346		= word ptr -346h
var_344		= word ptr -344h
var_342		= dword ptr -342h
var_33E		= byte ptr -33Eh
var_33C		= word ptr -33Ch
var_2C4		= word ptr -2C4h
var_2C2		= word ptr -2C2h
var_2A2		= word ptr -2A2h
var_28A		= word ptr -28Ah
var_212		= word ptr -212h
var_1C2		= word ptr -1C2h
var_1B8		= word ptr -1B8h
var_1AE		= word ptr -1AEh
var_1A4		= word ptr -1A4h
var_19A		= word ptr -19Ah
var_190		= word ptr -190h
var_186		= word ptr -186h
var_17C		= word ptr -17Ch
var_172		= word ptr -172h
var_168		= word ptr -168h
var_15E		= word ptr -15Eh
var_15C		= word ptr -15Ch
var_14E		= dword ptr -14Eh
var_14A		= byte ptr -14Ah
var_149		= byte ptr -149h
var_148		= dword ptr -148h
var_144		= word ptr -144h
var_142		= word ptr -142h
var_140		= word ptr -140h
var_13E		= word ptr -13Eh
var_13C		= word ptr -13Ch
var_13A		= word ptr -13Ah
var_136		= word ptr -136h
var_134		= word ptr -134h
var_132		= word ptr -132h
var_130		= word ptr -130h
var_12E		= word ptr -12Eh
var_12C		= word ptr -12Ch
var_128		= word ptr -128h
var_126		= word ptr -126h
var_124		= word ptr -124h
var_122		= word ptr -122h
var_120		= byte ptr -120h
var_11F		= word ptr -11Fh
var_11E		= word ptr -11Eh
var_11C		= dword ptr -11Ch
var_118		= dword ptr -118h
var_116		= dword ptr -116h
var_112		= dword ptr -112h
var_10E		= dword ptr -10Eh
var_10C		= dword ptr -10Ch
var_108		= dword ptr -108h
var_104		= word ptr -104h
var_102		= dword ptr -102h
var_FE		= dword ptr -0FEh
var_FA		= word ptr -0FAh
var_F8		= dword ptr -0F8h
var_F4		= word ptr -0F4h
var_F2		= word ptr -0F2h
var_F0		= word ptr -0F0h
var_EE		= word ptr -0EEh
var_EC		= dword ptr -0ECh
var_E8		= byte ptr -0E8h
var_E7		= byte ptr -0E7h
var_E6		= dword ptr -0E6h
var_E2		= dword ptr -0E2h
var_DE		= byte ptr -0DEh
var_DD		= byte ptr -0DDh
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= byte ptr -0D4h
var_D3		= byte ptr -0D3h
var_D2		= dword ptr -0D2h
var_CE		= word ptr -0CEh
var_CC		= byte ptr -0CCh
var_CB		= word ptr -0CBh
var_C8		= dword ptr -0C8h
var_C4		= byte ptr -0C4h
var_C3		= byte ptr -0C3h
var_C2		= dword ptr -0C2h
var_BE		= word ptr -0BEh
var_BC		= word ptr -0BCh
var_BA		= word ptr -0BAh
var_B8		= word ptr -0B8h
var_B6		= dword ptr -0B6h
var_B2		= byte ptr -0B2h
var_B1		= byte ptr -0B1h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= byte ptr -0A8h
var_A7		= byte ptr -0A7h
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= byte ptr -9Eh
var_9D		= byte ptr -9Dh
var_9C		= dword ptr -9Ch
var_98		= word ptr -98h
var_96		= byte ptr -96h
var_95		= word ptr -95h
var_92		= dword ptr -92h
var_8E		= byte ptr -8Eh
var_8D		= byte ptr -8Dh
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= byte ptr -84h
var_83		= byte ptr -83h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= byte ptr -7Ah
var_79		= byte ptr -79h
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= byte ptr -70h
var_6F		= byte ptr -6Fh
var_6E		= dword ptr -6Eh
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= dword ptr -62h
var_5E		= byte ptr -5Eh
var_5D		= byte ptr -5Dh
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= byte ptr -54h
var_53		= byte ptr -53h
var_52		= dword ptr -52h
var_4E		= word ptr -4Eh
var_4C		= byte ptr -4Ch
var_4B		= word ptr -4Bh
var_48		= dword ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword ptr -42h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= byte ptr -3Ah
var_38		= dword ptr -38h
var_34		= byte ptr -34h
var_33		= byte ptr -33h
var_32		= dword ptr -32h
var_2E		= byte ptr -2Eh
var_2D		= byte ptr -2Dh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= byte ptr -0Eh
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_6		= word ptr -6
var_2		= word ptr -2
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 3F2h
		push	si
		push	di
		mov	ax, word_4D36E
		mov	[bp+var_2], ax
		mov	[bp+var_136], 0
		mov	[bp+var_134], 0
		push	[bp+var_2]
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_144], 0
		mov	[bp+var_142], 0
		mov	[bp+var_140], 0
		mov	[bp+var_13E], 0
		mov	[bp+var_13C], 13Fh
		mov	[bp+var_13A], 0C7h
		push	0
		lea	ax, [bp+var_144]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_144]
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
		mov	[bp+var_132], 0
		mov	[bp+var_130], 18h
		mov	[bp+var_12E], 13Fh
		mov	[bp+var_12C], 97h
		mov	byte ptr [bp+var_10], 0
		mov	byte ptr [bp+var_10+1], 0
		mov	[bp+var_E], 0
		mov	[bp+var_11], 0
		mov	[bp+var_15E], 129Fh
		mov	[bp+var_14E], 0
		mov	[bp+var_14A], 2
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		mov	[bp+var_15C], 0
		mov	[bp+var_15E], 12AFh
		push	seg stub192
		push	offset sub_479E5
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	ds
		push	offset aPak
		push	ds
		push	offset aTo1mid1
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		cmp	word_4CA5B, 0
		jz	short loc_74D27
		mov	[bp+var_11], 1

loc_74D27:
		cmp	[bp+var_11], 0
		jz	short loc_74DA2
		push	ds
		push	offset aPak
		push	ds
		push	offset aTomidvoc
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_3C2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		xor	si, si
		jmp	short loc_74D7D

loc_74D5E:
		push	3
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_1C2]
		add	ax, dx
		push	ax
		push	si
		lea	ax, [bp+var_3C2]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		inc	si

loc_74D7D:
		cmp	si, 0Ah
		jl	short loc_74D5E
		push	word_4CA5B
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C2]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_74DA2:
		push	ds
		push	offset unk_4B094
		push	ds
		push	offset aConvfontShp_2
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_212]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_20+2], dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[bp+var_1C], eax
		mov	[bp+var_18], 3
		mov	[bp+var_17], 1
		mov	[bp+var_16], 0
		lea	ax, word ptr [bp+var_1C]
		push	ax
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		mov	[bp+var_28], 0
		mov	[bp+var_26], 98h
		mov	[bp+var_24], 13Fh
		mov	[bp+var_22], 0C7h
		lea	ax, [bp+var_2A2]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_28]
		mov	[bp+var_402], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_400], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_3FE], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_3FC], ax
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		mov	[bp+var_2A], 0
		push	12Ch
		push	10h
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgams2
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_3F2]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_3F2], 480h
		mov	[bp+var_391], 100h
		mov	[bp+var_395], 0
		mov	[bp+var_3F2], 498h
		push	1
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_3F2]
		push	ax
		mov	bx, [bp+var_3F2]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3130474Dh
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 4B4F5053h
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		xor	si, si
		jmp	short loc_74F34

loc_74EE0:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	di, [bp+var_380]
		cmp	di, 12Ch
		jle	short loc_74F0A
		push	26BEh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_74F0A:
		movsx	eax, di
		push	eax
		push	ds
		mov	ax, [bp+var_2C]
		imul	si
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_37C]
		mov	[bp+var_38D], eax
		inc	si

loc_74F34:
		cmp	si, 10h
		jl	short loc_74EE0
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_3F2], 498h
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_3F2]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	[bp+var_2D], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_38], 0
		mov	[bp+var_34], 2
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		mov	al, byte_4CA58
		mov	[bp+var_3A], al
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_3A]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_74FAB
		jmp	loc_752B4

loc_74FAB:
		shl	bx, 1
		jmp	cs:off_7ACB7[bx]	; switch jump

loc_74FB2:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_212]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_74FE0
		jmp	loc_750DD

loc_74FE0:
		push	1
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_33C]
		push	ax
		mov	bx, [bp+var_33C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_5
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_3F2]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_3F2], 480h
		mov	[bp+var_391], 100h
		mov	[bp+var_395], 0
		mov	[bp+var_3F2], 498h
		push	1
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_3F2]
		push	ax
		mov	bx, [bp+var_3F2]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_750A5

loc_7508F:
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_750A5:
		cmp	si, 6Ah
		jle	short loc_7508F
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_2E], 1
		mov	[bp+var_3F2], 498h
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_3F2]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_750DD:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_212]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_7511B
		mov	[bp+var_2D], 1
		mov	al, [bp+var_2E]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7511B
		mov	word_4F048, 5Ah

loc_7511B:
		jmp	loc_752B4

loc_7511E:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_212]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_7514C
		jmp	loc_75253

loc_7514C:
		cmp	word_4CA5D, 0
		jnz	short loc_75156
		jmp	loc_75253

loc_75156:
		push	1
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_33C]
		push	ax
		mov	bx, [bp+var_33C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_6
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_3F2]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_3F2], 480h
		mov	[bp+var_391], 100h
		mov	[bp+var_395], 0
		mov	[bp+var_3F2], 498h
		push	1
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_3F2]
		push	ax
		mov	bx, [bp+var_3F2]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_7521B

loc_75205:
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_7521B:
		cmp	si, 6Ah
		jle	short loc_75205
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_2E], 1
		mov	[bp+var_3F2], 498h
		lea	ax, [bp+var_3F2]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_3F2]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_75253:
		cmp	[bp+var_3A], 3
		jnz	short loc_75274
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_7528D

loc_75274:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_7528D:
		push	ds
		lea	ax, [bp+var_212]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_752B2
		mov	[bp+var_2D], 1
		mov	al, [bp+var_2E]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_752B2
		mov	word_4F048, 0FFh

loc_752B2:
		jmp	short loc_752B4

loc_752B4:
		mov	[bp+var_346], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_344], ax
		lea	ax, [bp+var_346]
		mov	word_4D392, ax
		mov	[bp+var_346], 1BCh
		mov	[bp+var_342], 0
		mov	[bp+var_33E], 0
		mov	[bp+var_34A], 0
		mov	[bp+var_348], 0FFFFh
		cmp	[bp+var_2D], 0
		jz	short loc_75361
		push	1
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_3C2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		cmp	[bp+var_11], 0
		jz	short loc_7530F
		mov	byte ptr [bp+var_F8+3], 16h
		jmp	short loc_75314

loc_7530F:
		mov	byte ptr [bp+var_F8+3], 15h

loc_75314:
		push	3
		lea	ax, word ptr [bp+var_38]
		push	ax
		mov	al, byte ptr [bp+var_F8+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_3C2]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_34A]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_38]
		push	ax
		lea	ax, [bp+var_34A]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, [bp+var_3C2]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_75361:
		cmp	[bp+var_2D], 0
		jz	short loc_753A7
		mov	ax, word_4F048
		mov	[bp+var_3C], ax
		mov	[bp+var_3E], 0
		cmp	[bp+var_34A], 0
		jz	short loc_753A7
		push	[bp+var_348]
		mov	bx, [bp+var_34A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_3E]
		push	[bp+var_3C]
		push	[bp+var_348]
		mov	bx, [bp+var_34A]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_753A7

loc_753A7:
		mov	[bp+var_FE], 0
		mov	byte ptr [bp+var_FA], 2
		mov	byte ptr [bp+var_FA+1], 0
		mov	[bp+var_F8], 0
		mov	[bp+var_354], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_352], ax
		lea	ax, [bp+var_354]
		mov	word_4D392, ax
		mov	[bp+var_354], 1BCh
		mov	[bp+var_350], 0
		mov	[bp+var_34C], 0
		mov	[bp+var_358], 0
		mov	[bp+var_356], 0FFFFh
		cmp	[bp+var_2E], 0
		jz	short loc_75438
		push	3
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	3Eh
		lea	ax, [bp+var_33C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_358]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_FE]
		push	ax
		lea	ax, [bp+var_358]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_75438:
		mov	[bp+var_108], 0
		mov	byte ptr [bp+var_104], 2
		mov	byte ptr [bp+var_104+1], 0
		mov	[bp+var_102], 0
		push	3
		lea	ax, word ptr [bp+var_108]
		push	ax
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_112], 0
		mov	byte ptr [bp+var_10E], 2
		mov	byte ptr [bp+var_10E+1], 0
		mov	[bp+var_10C], 0
		push	2
		lea	ax, word ptr [bp+var_112]
		push	ax
		push	3
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_116+1], 0
		lea	ax, word ptr [bp+var_112]
		push	ax
		lea	ax, word ptr [bp+var_118]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	14h
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFDDh
		push	0
		lea	ax, word ptr [bp+var_108]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	di, ax
		push	word ptr [bp+var_118]
		mov	al, byte ptr [bp+var_116]
		push	ax
		lea	ax, word ptr [bp+var_118]
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
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	si, si
		jmp	short loc_75597

loc_7552F:
		cmp	[bp+var_2E], 0
		jz	short loc_7557E
		cmp	si, 0Dh
		jnz	short loc_7557E
		mov	ax, word_4EFF0
		mov	word ptr [bp+var_11C+2], ax
		mov	word ptr [bp+var_11C], 0
		cmp	[bp+var_358], 0
		jz	short loc_7557E
		push	[bp+var_356]
		mov	bx, [bp+var_358]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_11C]
		push	word ptr [bp+var_11C+2]
		push	[bp+var_356]
		mov	bx, [bp+var_358]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_7557E

loc_7557E:
		mov	[bp+var_11E], si
		mov	ax, [bp+var_11E]
		mov	[di+1Bh], ax
		inc	si
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_75597:
		cmp	[bp+var_35D], 3Eh
		jnb	short loc_755A5
		cmp	[bp+var_35B], 0
		jz	short loc_755AA

loc_755A5:
		mov	ax, 1
		jmp	short loc_755AC

loc_755AA:
		xor	ax, ax

loc_755AC:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_755B5
		jmp	loc_7552F

loc_755B5:
		push	0
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_118]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_10E+1], 0
		jz	short loc_755F9
		cmp	[bp+var_112], 0
		jz	short loc_755F9
		push	0
		mov	al, byte ptr [bp+var_10E]
		push	ax
		lea	ax, word ptr [bp+var_112]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_755F9

loc_755F9:
		mov	[bp+var_112], 0
		mov	byte ptr [bp+var_10E+1], 0
		mov	[bp+var_10C], 0
		cmp	byte ptr [bp+var_104+1], 0
		jz	short loc_75638
		cmp	[bp+var_108], 0
		jz	short loc_75638
		push	0
		mov	al, byte ptr [bp+var_104]
		push	ax
		lea	ax, word ptr [bp+var_108]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75638

loc_75638:
		mov	[bp+var_108], 0
		mov	byte ptr [bp+var_104+1], 0
		mov	[bp+var_102], 0
		lea	ax, [bp+var_358]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_FA+1], 0
		jz	short loc_75693
		cmp	[bp+var_FE], 0
		jz	short loc_75693
		push	0
		mov	al, byte ptr [bp+var_FA]
		push	ax
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75693

loc_75693:
		mov	[bp+var_FE], 0
		mov	byte ptr [bp+var_FA+1], 0
		mov	[bp+var_F8], 0
		cmp	byte_4F55C, 0
		jnz	short loc_756B4
		jmp	loc_75829

loc_756B4:
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_75703
		cmp	[bp+var_38], 0
		jz	short loc_75703
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75703

loc_75703:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_75765
		cmp	[bp+var_1C], 0
		jz	short loc_75765
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75765

loc_75765:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_757DC
		cmp	[bp+var_14E], 0
		jz	short loc_757DC
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_757DC

loc_757DC:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_75829:
		mov	[bp+var_48], 0
		mov	[bp+var_44], 2
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	5
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_4B], 0
		lea	ax, word ptr [bp+var_48]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_58], 0
		mov	[bp+var_54], 2
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		push	3
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_62], 0
		mov	[bp+var_5E], 2
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		push	3
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	11h
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_64], 0FFAAh
		mov	[bp+var_66], 1
		mov	[bp+var_68], 15h
		mov	[bp+var_6A], 0
		mov	[bp+var_74], 0
		mov	[bp+var_70], 2
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		push	3
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	4
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_7E], 0
		mov	[bp+var_7A], 2
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		push	3
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	0Bh
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_88], 0
		mov	[bp+var_84], 2
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		push	3
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	0Ch
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_132], 0
		mov	[bp+var_130], 18h
		mov	[bp+var_12E], 13Fh
		mov	[bp+var_12C], 97h
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, [bp+var_2A2]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_28]
		mov	[bp+var_402], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_400], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_3FE], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_3FC], ax
		lea	ax, [bp+var_38E]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	[bp+var_4E]
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_4E]
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
		push	0
		push	0
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F8+2], ax
		push	word ptr [bp+var_F8+2]
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0FFD1h
		push	0
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	si, ax
		push	0
		push	[bp+var_66]
		push	[bp+var_64]
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_F8], ax
		push	0
		push	[bp+var_6A]
		push	[bp+var_68]
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_FA], ax
		push	word ptr [bp+var_F8]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_FA]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_75B0B
		lea	ax, [bp+var_1C2]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_C8D7
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_CB9D
		add	sp, 4
		jmp	short loc_75AF8

loc_75AC6:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		jmp	short loc_75AF8
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_75AF8
		cmp	[bp+var_15C], 0
		jz	short loc_75AF6
		mov	bx, [bp+var_15C]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_75AF6

loc_75AF6:
		jmp	short loc_75B09

loc_75AF8:
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_75AC6

loc_75B09:
		jmp	short loc_75B55

loc_75B0B:
		push	0A1h
		lea	ax, [bp+var_2A2]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		push	[bp+var_2A]
		lea	ax, [bp+var_38E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_75B3A

loc_75B2D:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_75B3A:
		cmp	word ptr [bp+var_350+1], 1Eh
		jnb	short loc_75B48
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_75B4D

loc_75B48:
		mov	ax, 1
		jmp	short loc_75B4F

loc_75B4D:
		xor	ax, ax

loc_75B4F:
		mov	ah, 0
		or	ax, ax
		jz	short loc_75B2D

loc_75B55:
		cmp	[bp+var_11], 0
		jz	short loc_75B8B
		mov	word ptr [bp+var_350+1], 0
		jmp	short loc_75B70

loc_75B63:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_75B70:
		cmp	word ptr [bp+var_350+1], 0Ah
		jnb	short loc_75B7E
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_75B83

loc_75B7E:
		mov	ax, 1
		jmp	short loc_75B85

loc_75B83:
		xor	ax, ax

loc_75B85:
		mov	ah, 0
		or	ax, ax
		jz	short loc_75B63

loc_75B8B:
		lea	ax, word ptr [bp+var_38D+1]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_75BB1
		jmp	loc_75E89

loc_75BB1:
		cmp	[bp+var_83], 0
		jz	short loc_75BD9
		cmp	[bp+var_88], 0
		jz	short loc_75BD9
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75BD9

loc_75BD9:
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		cmp	[bp+var_79], 0
		jz	short loc_75C14
		cmp	[bp+var_7E], 0
		jz	short loc_75C14
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75C14

loc_75C14:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_75C4C
		cmp	[bp+var_74], 0
		jz	short loc_75C4C
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75C4C

loc_75C4C:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_5D], 0
		jz	short loc_75C84
		cmp	[bp+var_62], 0
		jz	short loc_75C84
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75C84

loc_75C84:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_75CBC
		cmp	[bp+var_58], 0
		jz	short loc_75CBC
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75CBC

loc_75CBC:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_43], 0
		jz	short loc_75D00
		cmp	[bp+var_48], 0
		jz	short loc_75D00
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75D00

loc_75D00:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_75D63
		cmp	[bp+var_38], 0
		jz	short loc_75D63
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75D63

loc_75D63:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_75DC5
		cmp	[bp+var_1C], 0
		jz	short loc_75DC5
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75DC5

loc_75DC5:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_75E3C
		cmp	[bp+var_14E], 0
		jz	short loc_75E3C
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_75E3C

loc_75E3C:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_75E89:
		mov	[bp+var_92], 0
		mov	[bp+var_8E], 2
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		push	2
		lea	ax, word ptr [bp+var_92]
		push	ax
		push	5
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_95], 0
		lea	ax, word ptr [bp+var_92]
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_A2], 0
		mov	[bp+var_9E], 2
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		push	3
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	7
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_AC], 0
		mov	[bp+var_A8], 2
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		push	3
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	9
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_B6], 0
		mov	[bp+var_B2], 2
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		push	3
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	0Ah
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_B8], 56h
		mov	[bp+var_BA], 0
		mov	[bp+var_BC], 0FFECh
		mov	[bp+var_BE], 0
		mov	word ptr [bp+var_F8+2], 26EAh
		mov	word ptr [bp+var_F8], 26ECh
		mov	[bp+var_FA], 26EEh
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, [bp+var_2A2]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_28]
		mov	[bp+var_402], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_400], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_3FE], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_3FC], ax
		lea	ax, [bp+var_38E]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	[bp+var_98]
		mov	al, [bp+var_96]
		push	ax
		lea	ax, [bp+var_98]
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
		push	0
		push	0
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_FE+2], ax
		push	word ptr [bp+var_FE+2]
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0FFD1h
		push	0
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	si, ax
		push	0
		push	[bp+var_BA]
		push	[bp+var_B8]
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_FE], ax
		push	0
		push	[bp+var_BE]
		push	[bp+var_BC]
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_102+2], ax
		push	word ptr [bp+var_FE]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_102+2]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_76116
		push	word ptr [bp+var_F8]
		mov	ax, [bp+var_2A]
		add	ax, [bp+var_2C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	word ptr [bp+var_F8+2]
		mov	ax, [bp+var_2A]
		add	ax, [bp+var_2C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_4]
		mov	ax, [bp+var_2A]
		add	ax, [bp+var_2C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_FA]
		mov	ax, [bp+var_2A]
		add	ax, [bp+var_2C]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_76116:
		cmp	[bp+var_11], 0
		jz	short loc_76191
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		lea	ax, [bp+var_1B8]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_C8D7
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_CB9D
		add	sp, 4
		jmp	short loc_7617E

loc_7614C:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		jmp	short loc_7617E
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7617E
		cmp	[bp+var_15C], 0
		jz	short loc_7617C
		mov	bx, [bp+var_15C]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_7617C

loc_7617C:
		jmp	short loc_7618F

loc_7617E:
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_7614C

loc_7618F:
		jmp	short loc_761DE

loc_76191:
		push	65h
		lea	ax, [bp+var_2A2]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		mov	ax, [bp+var_2A]
		add	ax, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_38E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_761C3

loc_761B6:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_761C3:
		cmp	word ptr [bp+var_350+1], 1Eh
		jnb	short loc_761D1
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_761D6

loc_761D1:
		mov	ax, 1
		jmp	short loc_761D8

loc_761D6:
		xor	ax, ax

loc_761D8:
		mov	ah, 0
		or	ax, ax
		jz	short loc_761B6

loc_761DE:
		cmp	[bp+var_11], 0
		jz	short loc_76214
		mov	word ptr [bp+var_350+1], 0
		jmp	short loc_761F9

loc_761EC:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_761F9:
		cmp	word ptr [bp+var_350+1], 0Ah
		jnb	short loc_76207
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_7620C

loc_76207:
		mov	ax, 1
		jmp	short loc_7620E

loc_7620C:
		xor	ax, ax

loc_7620E:
		mov	ah, 0
		or	ax, ax
		jz	short loc_761EC

loc_76214:
		lea	ax, word ptr [bp+var_38D+1]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_7623A
		jmp	loc_7661B

loc_7623A:
		cmp	[bp+var_B1], 0
		jz	short loc_76262
		cmp	[bp+var_B6], 0
		jz	short loc_76262
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76262

loc_76262:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		cmp	[bp+var_A7], 0
		jz	short loc_762A1
		cmp	[bp+var_AC], 0
		jz	short loc_762A1
		push	0
		mov	al, [bp+var_A8]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_762A1

loc_762A1:
		mov	[bp+var_AC], 0
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		cmp	[bp+var_9D], 0
		jz	short loc_762E0
		cmp	[bp+var_A2], 0
		jz	short loc_762E0
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_762E0

loc_762E0:
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		lea	ax, [bp+var_98]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8D], 0
		jz	short loc_7632C
		cmp	[bp+var_92], 0
		jz	short loc_7632C
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, word ptr [bp+var_92]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7632C

loc_7632C:
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_7636B
		cmp	[bp+var_88], 0
		jz	short loc_7636B
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7636B

loc_7636B:
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		cmp	[bp+var_79], 0
		jz	short loc_763A6
		cmp	[bp+var_7E], 0
		jz	short loc_763A6
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_763A6

loc_763A6:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_763DE
		cmp	[bp+var_74], 0
		jz	short loc_763DE
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_763DE

loc_763DE:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_5D], 0
		jz	short loc_76416
		cmp	[bp+var_62], 0
		jz	short loc_76416
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76416

loc_76416:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_7644E
		cmp	[bp+var_58], 0
		jz	short loc_7644E
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7644E

loc_7644E:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_43], 0
		jz	short loc_76492
		cmp	[bp+var_48], 0
		jz	short loc_76492
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76492

loc_76492:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_764F5
		cmp	[bp+var_38], 0
		jz	short loc_764F5
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_764F5

loc_764F5:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_76557
		cmp	[bp+var_1C], 0
		jz	short loc_76557
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76557

loc_76557:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_765CE
		cmp	[bp+var_14E], 0
		jz	short loc_765CE
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_765CE

loc_765CE:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_7661B:
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, [bp+var_2A2]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_28]
		mov	[bp+var_402], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_400], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_3FE], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_3FC], ax
		lea	ax, [bp+var_38E]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	[bp+var_4E]
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_4E]
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
		push	0
		push	0
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F8+2], ax
		push	word ptr [bp+var_F8+2]
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0FFD1h
		push	0
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	si, ax
		push	0
		push	[bp+var_66]
		push	[bp+var_64]
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_F8], ax
		push	0
		push	[bp+var_6A]
		push	[bp+var_68]
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_FA], ax
		push	word ptr [bp+var_F8]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_FA]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_767B6
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		lea	ax, [bp+var_1AE]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_C8D7
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_CB9D
		add	sp, 4
		jmp	short loc_767A3

loc_76771:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		jmp	short loc_767A3
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_767A3
		cmp	[bp+var_15C], 0
		jz	short loc_767A1
		mov	bx, [bp+var_15C]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_767A1

loc_767A1:
		jmp	short loc_767B4

loc_767A3:
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_76771

loc_767B4:
		jmp	short loc_76808

loc_767B6:
		push	0A1h
		lea	ax, [bp+var_2A2]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		mov	ax, [bp+var_2C]
		shl	ax, 1
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_38E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_767ED

loc_767E0:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_767ED:
		cmp	word ptr [bp+var_350+1], 1Eh
		jnb	short loc_767FB
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_76800

loc_767FB:
		mov	ax, 1
		jmp	short loc_76802

loc_76800:
		xor	ax, ax

loc_76802:
		mov	ah, 0
		or	ax, ax
		jz	short loc_767E0

loc_76808:
		cmp	[bp+var_11], 0
		jz	short loc_7683E
		mov	word ptr [bp+var_350+1], 0
		jmp	short loc_76823

loc_76816:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_76823:
		cmp	word ptr [bp+var_350+1], 0Ah
		jnb	short loc_76831
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_76836

loc_76831:
		mov	ax, 1
		jmp	short loc_76838

loc_76836:
		xor	ax, ax

loc_76838:
		mov	ah, 0
		or	ax, ax
		jz	short loc_76816

loc_7683E:
		lea	ax, word ptr [bp+var_38D+1]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_76864
		jmp	loc_76C45

loc_76864:
		cmp	[bp+var_B1], 0
		jz	short loc_7688C
		cmp	[bp+var_B6], 0
		jz	short loc_7688C
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7688C

loc_7688C:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		cmp	[bp+var_A7], 0
		jz	short loc_768CB
		cmp	[bp+var_AC], 0
		jz	short loc_768CB
		push	0
		mov	al, [bp+var_A8]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_768CB

loc_768CB:
		mov	[bp+var_AC], 0
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		cmp	[bp+var_9D], 0
		jz	short loc_7690A
		cmp	[bp+var_A2], 0
		jz	short loc_7690A
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7690A

loc_7690A:
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		lea	ax, [bp+var_98]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8D], 0
		jz	short loc_76956
		cmp	[bp+var_92], 0
		jz	short loc_76956
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, word ptr [bp+var_92]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76956

loc_76956:
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_76995
		cmp	[bp+var_88], 0
		jz	short loc_76995
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76995

loc_76995:
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		cmp	[bp+var_79], 0
		jz	short loc_769D0
		cmp	[bp+var_7E], 0
		jz	short loc_769D0
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_769D0

loc_769D0:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_76A08
		cmp	[bp+var_74], 0
		jz	short loc_76A08
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76A08

loc_76A08:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_5D], 0
		jz	short loc_76A40
		cmp	[bp+var_62], 0
		jz	short loc_76A40
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76A40

loc_76A40:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_76A78
		cmp	[bp+var_58], 0
		jz	short loc_76A78
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76A78

loc_76A78:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_43], 0
		jz	short loc_76ABC
		cmp	[bp+var_48], 0
		jz	short loc_76ABC
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76ABC

loc_76ABC:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_76B1F
		cmp	[bp+var_38], 0
		jz	short loc_76B1F
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76B1F

loc_76B1F:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_76B81
		cmp	[bp+var_1C], 0
		jz	short loc_76B81
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76B81

loc_76B81:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_76BF8
		cmp	[bp+var_14E], 0
		jz	short loc_76BF8
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76BF8

loc_76BF8:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_76C45:
		mov	[bp+var_C8], 0
		mov	[bp+var_C4], 2
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	5
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_CB], 0
		lea	ax, word ptr [bp+var_C8]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_D8], 0
		mov	[bp+var_D4], 2
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	3
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	8
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E2], 0
		mov	[bp+var_DE], 2
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		push	3
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	0Dh
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_EC], 0
		mov	[bp+var_E8], 2
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		push	3
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	0Eh
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_EE], 0FFEEh
		mov	[bp+var_F0], 0
		mov	[bp+var_F2], 19h
		mov	[bp+var_F4], 0
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, [bp+var_2A2]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_28]
		mov	[bp+var_402], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_400], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_3FE], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_3FC], ax
		lea	ax, [bp+var_38E]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	[bp+var_CE]
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_CE]
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
		push	0
		push	0
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F8+2], ax
		push	word ptr [bp+var_F8+2]
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0FFC9h
		push	0
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	si, ax
		push	0
		push	[bp+var_F0]
		push	[bp+var_EE]
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_F8], ax
		push	0
		push	[bp+var_F4]
		push	[bp+var_F2]
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_FA], ax
		push	word ptr [bp+var_F8]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_FA]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_76EE1
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		lea	ax, [bp+var_1A4]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_C8D7
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_CB9D
		add	sp, 4
		jmp	short loc_76ECE

loc_76E9C:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		jmp	short loc_76ECE
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_76ECE
		cmp	[bp+var_15C], 0
		jz	short loc_76ECC
		mov	bx, [bp+var_15C]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_76ECC

loc_76ECC:
		jmp	short loc_76EDF

loc_76ECE:
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_76E9C

loc_76EDF:
		jmp	short loc_76F36

loc_76EE1:
		push	0E3h
		lea	ax, [bp+var_2A2]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		mov	ax, [bp+var_2C]
		shl	ax, 1
		add	ax, [bp+var_2C]
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_38E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_76F1B

loc_76F0E:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_76F1B:
		cmp	word ptr [bp+var_350+1], 1Eh
		jnb	short loc_76F29
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_76F2E

loc_76F29:
		mov	ax, 1
		jmp	short loc_76F30

loc_76F2E:
		xor	ax, ax

loc_76F30:
		mov	ah, 0
		or	ax, ax
		jz	short loc_76F0E

loc_76F36:
		cmp	[bp+var_11], 0
		jz	short loc_76F6C
		mov	word ptr [bp+var_350+1], 0
		jmp	short loc_76F51

loc_76F44:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_76F51:
		cmp	word ptr [bp+var_350+1], 0Ah
		jnb	short loc_76F5F
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_76F64

loc_76F5F:
		mov	ax, 1
		jmp	short loc_76F66

loc_76F64:
		xor	ax, ax

loc_76F66:
		mov	ah, 0
		or	ax, ax
		jz	short loc_76F44

loc_76F6C:
		lea	ax, word ptr [bp+var_38D+1]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_76F92
		jmp	loc_7747C

loc_76F92:
		cmp	[bp+var_E7], 0
		jz	short loc_76FBA
		cmp	[bp+var_EC], 0
		jz	short loc_76FBA
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76FBA

loc_76FBA:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_76FF9
		cmp	[bp+var_E2], 0
		jz	short loc_76FF9
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_76FF9

loc_76FF9:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_77038
		cmp	[bp+var_D8], 0
		jz	short loc_77038
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77038

loc_77038:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C3], 0
		jz	short loc_77084
		cmp	[bp+var_C8], 0
		jz	short loc_77084
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77084

loc_77084:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B1], 0
		jz	short loc_770C3
		cmp	[bp+var_B6], 0
		jz	short loc_770C3
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_770C3

loc_770C3:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		cmp	[bp+var_A7], 0
		jz	short loc_77102
		cmp	[bp+var_AC], 0
		jz	short loc_77102
		push	0
		mov	al, [bp+var_A8]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77102

loc_77102:
		mov	[bp+var_AC], 0
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		cmp	[bp+var_9D], 0
		jz	short loc_77141
		cmp	[bp+var_A2], 0
		jz	short loc_77141
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77141

loc_77141:
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		lea	ax, [bp+var_98]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8D], 0
		jz	short loc_7718D
		cmp	[bp+var_92], 0
		jz	short loc_7718D
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, word ptr [bp+var_92]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7718D

loc_7718D:
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_771CC
		cmp	[bp+var_88], 0
		jz	short loc_771CC
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_771CC

loc_771CC:
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		cmp	[bp+var_79], 0
		jz	short loc_77207
		cmp	[bp+var_7E], 0
		jz	short loc_77207
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77207

loc_77207:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_7723F
		cmp	[bp+var_74], 0
		jz	short loc_7723F
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7723F

loc_7723F:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_5D], 0
		jz	short loc_77277
		cmp	[bp+var_62], 0
		jz	short loc_77277
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77277

loc_77277:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_772AF
		cmp	[bp+var_58], 0
		jz	short loc_772AF
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_772AF

loc_772AF:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_43], 0
		jz	short loc_772F3
		cmp	[bp+var_48], 0
		jz	short loc_772F3
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_772F3

loc_772F3:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_77356
		cmp	[bp+var_38], 0
		jz	short loc_77356
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77356

loc_77356:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_773B8
		cmp	[bp+var_1C], 0
		jz	short loc_773B8
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_773B8

loc_773B8:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_7742F
		cmp	[bp+var_14E], 0
		jz	short loc_7742F
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7742F

loc_7742F:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_7747C:
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, [bp+var_2A2]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_28]
		mov	[bp+var_402], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_400], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_3FE], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_3FC], ax
		lea	ax, [bp+var_38E]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	[bp+var_4E]
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_4E]
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
		push	0
		push	0
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F8+2], ax
		push	word ptr [bp+var_F8+2]
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0FFD1h
		push	0
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	si, ax
		push	0
		push	[bp+var_66]
		push	[bp+var_64]
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_F8], ax
		push	0
		push	[bp+var_6A]
		push	[bp+var_68]
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_FA], ax
		push	word ptr [bp+var_F8]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_FA]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_77617
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		lea	ax, [bp+var_19A]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_C8D7
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_CB9D
		add	sp, 4
		jmp	short loc_77604

loc_775D2:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		jmp	short loc_77604
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_77604
		cmp	[bp+var_15C], 0
		jz	short loc_77602
		mov	bx, [bp+var_15C]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_77602

loc_77602:
		jmp	short loc_77615

loc_77604:
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_775D2

loc_77615:
		jmp	short loc_7766A

loc_77617:
		push	0A1h
		lea	ax, [bp+var_2A2]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		mov	ax, [bp+var_2C]
		shl	ax, 2
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_38E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_7764F

loc_77642:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7764F:
		cmp	word ptr [bp+var_350+1], 1Eh
		jnb	short loc_7765D
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_77662

loc_7765D:
		mov	ax, 1
		jmp	short loc_77664

loc_77662:
		xor	ax, ax

loc_77664:
		mov	ah, 0
		or	ax, ax
		jz	short loc_77642

loc_7766A:
		cmp	[bp+var_11], 0
		jz	short loc_776A0
		mov	word ptr [bp+var_350+1], 0
		jmp	short loc_77685

loc_77678:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_77685:
		cmp	word ptr [bp+var_350+1], 0Ah
		jnb	short loc_77693
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_77698

loc_77693:
		mov	ax, 1
		jmp	short loc_7769A

loc_77698:
		xor	ax, ax

loc_7769A:
		mov	ah, 0
		or	ax, ax
		jz	short loc_77678

loc_776A0:
		lea	ax, word ptr [bp+var_38D+1]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_776C6
		jmp	loc_77BB0

loc_776C6:
		cmp	[bp+var_E7], 0
		jz	short loc_776EE
		cmp	[bp+var_EC], 0
		jz	short loc_776EE
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_776EE

loc_776EE:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_7772D
		cmp	[bp+var_E2], 0
		jz	short loc_7772D
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7772D

loc_7772D:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_7776C
		cmp	[bp+var_D8], 0
		jz	short loc_7776C
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7776C

loc_7776C:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C3], 0
		jz	short loc_777B8
		cmp	[bp+var_C8], 0
		jz	short loc_777B8
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_777B8

loc_777B8:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B1], 0
		jz	short loc_777F7
		cmp	[bp+var_B6], 0
		jz	short loc_777F7
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_777F7

loc_777F7:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		cmp	[bp+var_A7], 0
		jz	short loc_77836
		cmp	[bp+var_AC], 0
		jz	short loc_77836
		push	0
		mov	al, [bp+var_A8]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77836

loc_77836:
		mov	[bp+var_AC], 0
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		cmp	[bp+var_9D], 0
		jz	short loc_77875
		cmp	[bp+var_A2], 0
		jz	short loc_77875
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77875

loc_77875:
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		lea	ax, [bp+var_98]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8D], 0
		jz	short loc_778C1
		cmp	[bp+var_92], 0
		jz	short loc_778C1
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, word ptr [bp+var_92]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_778C1

loc_778C1:
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_77900
		cmp	[bp+var_88], 0
		jz	short loc_77900
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77900

loc_77900:
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		cmp	[bp+var_79], 0
		jz	short loc_7793B
		cmp	[bp+var_7E], 0
		jz	short loc_7793B
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7793B

loc_7793B:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_77973
		cmp	[bp+var_74], 0
		jz	short loc_77973
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77973

loc_77973:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_5D], 0
		jz	short loc_779AB
		cmp	[bp+var_62], 0
		jz	short loc_779AB
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_779AB

loc_779AB:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_779E3
		cmp	[bp+var_58], 0
		jz	short loc_779E3
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_779E3

loc_779E3:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_43], 0
		jz	short loc_77A27
		cmp	[bp+var_48], 0
		jz	short loc_77A27
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77A27

loc_77A27:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_77A8A
		cmp	[bp+var_38], 0
		jz	short loc_77A8A
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77A8A

loc_77A8A:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_77AEC
		cmp	[bp+var_1C], 0
		jz	short loc_77AEC
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77AEC

loc_77AEC:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_77B63
		cmp	[bp+var_14E], 0
		jz	short loc_77B63
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77B63

loc_77B63:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_77BB0:
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, [bp+var_2A2]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_28]
		mov	[bp+var_402], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_400], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_3FE], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_3FC], ax
		lea	ax, [bp+var_38E]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	[bp+var_CE]
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_CE]
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
		push	0
		push	0
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F8+2], ax
		push	word ptr [bp+var_F8+2]
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0FFC9h
		push	0
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	si, ax
		push	0
		push	[bp+var_F0]
		push	[bp+var_EE]
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_F8], ax
		push	0
		push	[bp+var_F4]
		push	[bp+var_F2]
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_FA], ax
		push	word ptr [bp+var_F8]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_FA]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_77D54
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		lea	ax, [bp+var_190]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_C8D7
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_CB9D
		add	sp, 4
		jmp	short loc_77D41

loc_77D0F:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		jmp	short loc_77D41
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_77D41
		cmp	[bp+var_15C], 0
		jz	short loc_77D3F
		mov	bx, [bp+var_15C]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_77D3F

loc_77D3F:
		jmp	short loc_77D52

loc_77D41:
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_77D0F

loc_77D52:
		jmp	short loc_77DA9

loc_77D54:
		push	0E3h
		lea	ax, [bp+var_2A2]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		mov	ax, [bp+var_2C]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_38E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_77D8E

loc_77D81:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_77D8E:
		cmp	word ptr [bp+var_350+1], 1Eh
		jnb	short loc_77D9C
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_77DA1

loc_77D9C:
		mov	ax, 1
		jmp	short loc_77DA3

loc_77DA1:
		xor	ax, ax

loc_77DA3:
		mov	ah, 0
		or	ax, ax
		jz	short loc_77D81

loc_77DA9:
		mov	word ptr [bp+var_350+1], 0
		cmp	[bp+var_11], 0
		jz	short loc_77DE5
		jmp	short loc_77DC4

loc_77DB7:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_77DC4:
		cmp	word ptr [bp+var_350+1], 0Ah
		jnb	short loc_77DD2
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_77DD7

loc_77DD2:
		mov	ax, 1
		jmp	short loc_77DD9

loc_77DD7:
		xor	ax, ax

loc_77DD9:
		mov	ah, 0
		or	ax, ax
		jz	short loc_77DB7
		mov	word ptr [bp+var_350+1], 0

loc_77DE5:
		cmp	[bp+var_11], 0
		jz	short loc_77E60
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		lea	ax, [bp+var_186]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_C8D7
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_CB9D
		add	sp, 4
		jmp	short loc_77E4D

loc_77E1B:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		jmp	short loc_77E4D
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_77E4D
		cmp	[bp+var_15C], 0
		jz	short loc_77E4B
		mov	bx, [bp+var_15C]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_77E4B

loc_77E4B:
		jmp	short loc_77E5E

loc_77E4D:
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_77E1B

loc_77E5E:
		jmp	short loc_77EB4

loc_77E60:
		push	0
		lea	ax, [bp+var_38E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	ax, [bp+var_2C]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_38E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_77E99

loc_77E8C:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_77E99:
		cmp	word ptr [bp+var_350+1], 1Eh
		jnb	short loc_77EA7
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_77EAC

loc_77EA7:
		mov	ax, 1
		jmp	short loc_77EAE

loc_77EAC:
		xor	ax, ax

loc_77EAE:
		mov	ah, 0
		or	ax, ax
		jz	short loc_77E8C

loc_77EB4:
		cmp	[bp+var_11], 0
		jz	short loc_77EEA
		mov	word ptr [bp+var_350+1], 0
		jmp	short loc_77ECF

loc_77EC2:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_77ECF:
		cmp	word ptr [bp+var_350+1], 0Ah
		jnb	short loc_77EDD
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_77EE2

loc_77EDD:
		mov	ax, 1
		jmp	short loc_77EE4

loc_77EE2:
		xor	ax, ax

loc_77EE4:
		mov	ah, 0
		or	ax, ax
		jz	short loc_77EC2

loc_77EEA:
		lea	ax, word ptr [bp+var_38D+1]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_77F10
		jmp	loc_783FA

loc_77F10:
		cmp	[bp+var_E7], 0
		jz	short loc_77F38
		cmp	[bp+var_EC], 0
		jz	short loc_77F38
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77F38

loc_77F38:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_77F77
		cmp	[bp+var_E2], 0
		jz	short loc_77F77
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77F77

loc_77F77:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_77FB6
		cmp	[bp+var_D8], 0
		jz	short loc_77FB6
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_77FB6

loc_77FB6:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C3], 0
		jz	short loc_78002
		cmp	[bp+var_C8], 0
		jz	short loc_78002
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78002

loc_78002:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B1], 0
		jz	short loc_78041
		cmp	[bp+var_B6], 0
		jz	short loc_78041
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78041

loc_78041:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		cmp	[bp+var_A7], 0
		jz	short loc_78080
		cmp	[bp+var_AC], 0
		jz	short loc_78080
		push	0
		mov	al, [bp+var_A8]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78080

loc_78080:
		mov	[bp+var_AC], 0
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		cmp	[bp+var_9D], 0
		jz	short loc_780BF
		cmp	[bp+var_A2], 0
		jz	short loc_780BF
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_780BF

loc_780BF:
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		lea	ax, [bp+var_98]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8D], 0
		jz	short loc_7810B
		cmp	[bp+var_92], 0
		jz	short loc_7810B
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, word ptr [bp+var_92]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7810B

loc_7810B:
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_7814A
		cmp	[bp+var_88], 0
		jz	short loc_7814A
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7814A

loc_7814A:
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		cmp	[bp+var_79], 0
		jz	short loc_78185
		cmp	[bp+var_7E], 0
		jz	short loc_78185
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78185

loc_78185:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_781BD
		cmp	[bp+var_74], 0
		jz	short loc_781BD
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_781BD

loc_781BD:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_5D], 0
		jz	short loc_781F5
		cmp	[bp+var_62], 0
		jz	short loc_781F5
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_781F5

loc_781F5:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_7822D
		cmp	[bp+var_58], 0
		jz	short loc_7822D
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7822D

loc_7822D:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_43], 0
		jz	short loc_78271
		cmp	[bp+var_48], 0
		jz	short loc_78271
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78271

loc_78271:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_782D4
		cmp	[bp+var_38], 0
		jz	short loc_782D4
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_782D4

loc_782D4:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_78336
		cmp	[bp+var_1C], 0
		jz	short loc_78336
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78336

loc_78336:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_783AD
		cmp	[bp+var_14E], 0
		jz	short loc_783AD
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_783AD

loc_783AD:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_783FA:
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, [bp+var_2A2]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_28]
		mov	[bp+var_402], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_400], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_3FE], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_3FC], ax
		lea	ax, [bp+var_38E]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	[bp+var_98]
		mov	al, [bp+var_96]
		push	ax
		lea	ax, [bp+var_98]
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
		push	0
		push	0
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F8+2], ax
		push	word ptr [bp+var_F8+2]
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0FFD1h
		push	0
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	si, ax
		push	0
		push	[bp+var_BA]
		push	[bp+var_B8]
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_F8], ax
		push	0
		push	[bp+var_BE]
		push	[bp+var_BC]
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_FA], ax
		push	word ptr [bp+var_F8]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_FA]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_7859E
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		lea	ax, [bp+var_17C]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_C8D7
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_CB9D
		add	sp, 4
		jmp	short loc_7858B

loc_78559:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		jmp	short loc_7858B
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7858B
		cmp	[bp+var_15C], 0
		jz	short loc_78589
		mov	bx, [bp+var_15C]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_78589

loc_78589:
		jmp	short loc_7859C

loc_7858B:
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_78559

loc_7859C:
		jmp	short loc_785F2

loc_7859E:
		push	65h
		lea	ax, [bp+var_2A2]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		mov	ax, [bp+var_2C]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_38E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_785D7

loc_785CA:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_785D7:
		cmp	word ptr [bp+var_350+1], 1Eh
		jnb	short loc_785E5
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_785EA

loc_785E5:
		mov	ax, 1
		jmp	short loc_785EC

loc_785EA:
		xor	ax, ax

loc_785EC:
		mov	ah, 0
		or	ax, ax
		jz	short loc_785CA

loc_785F2:
		cmp	[bp+var_11], 0
		jz	short loc_78628
		mov	word ptr [bp+var_350+1], 0
		jmp	short loc_7860D

loc_78600:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7860D:
		cmp	word ptr [bp+var_350+1], 0Ah
		jnb	short loc_7861B
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_78620

loc_7861B:
		mov	ax, 1
		jmp	short loc_78622

loc_78620:
		xor	ax, ax

loc_78622:
		mov	ah, 0
		or	ax, ax
		jz	short loc_78600

loc_78628:
		lea	ax, word ptr [bp+var_38D+1]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_7864E
		jmp	loc_78B38

loc_7864E:
		cmp	[bp+var_E7], 0
		jz	short loc_78676
		cmp	[bp+var_EC], 0
		jz	short loc_78676
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78676

loc_78676:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_786B5
		cmp	[bp+var_E2], 0
		jz	short loc_786B5
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_786B5

loc_786B5:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_786F4
		cmp	[bp+var_D8], 0
		jz	short loc_786F4
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_786F4

loc_786F4:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C3], 0
		jz	short loc_78740
		cmp	[bp+var_C8], 0
		jz	short loc_78740
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78740

loc_78740:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B1], 0
		jz	short loc_7877F
		cmp	[bp+var_B6], 0
		jz	short loc_7877F
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7877F

loc_7877F:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		cmp	[bp+var_A7], 0
		jz	short loc_787BE
		cmp	[bp+var_AC], 0
		jz	short loc_787BE
		push	0
		mov	al, [bp+var_A8]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_787BE

loc_787BE:
		mov	[bp+var_AC], 0
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		cmp	[bp+var_9D], 0
		jz	short loc_787FD
		cmp	[bp+var_A2], 0
		jz	short loc_787FD
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_787FD

loc_787FD:
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		lea	ax, [bp+var_98]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8D], 0
		jz	short loc_78849
		cmp	[bp+var_92], 0
		jz	short loc_78849
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, word ptr [bp+var_92]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78849

loc_78849:
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_78888
		cmp	[bp+var_88], 0
		jz	short loc_78888
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78888

loc_78888:
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		cmp	[bp+var_79], 0
		jz	short loc_788C3
		cmp	[bp+var_7E], 0
		jz	short loc_788C3
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_788C3

loc_788C3:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_788FB
		cmp	[bp+var_74], 0
		jz	short loc_788FB
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_788FB

loc_788FB:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_5D], 0
		jz	short loc_78933
		cmp	[bp+var_62], 0
		jz	short loc_78933
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78933

loc_78933:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_7896B
		cmp	[bp+var_58], 0
		jz	short loc_7896B
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7896B

loc_7896B:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_43], 0
		jz	short loc_789AF
		cmp	[bp+var_48], 0
		jz	short loc_789AF
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_789AF

loc_789AF:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_78A12
		cmp	[bp+var_38], 0
		jz	short loc_78A12
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78A12

loc_78A12:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_78A74
		cmp	[bp+var_1C], 0
		jz	short loc_78A74
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78A74

loc_78A74:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_78AEB
		cmp	[bp+var_14E], 0
		jz	short loc_78AEB
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78AEB

loc_78AEB:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_78B38:
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, [bp+var_2A2]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_28]
		mov	[bp+var_402], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_400], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_3FE], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_3FC], ax
		lea	ax, [bp+var_38E]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	[bp+var_4E]
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_4E]
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
		push	0
		push	0
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F8+2], ax
		push	word ptr [bp+var_F8+2]
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0FFD1h
		push	0
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	si, ax
		push	0
		push	[bp+var_66]
		push	[bp+var_64]
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_F8], ax
		push	0
		push	[bp+var_6A]
		push	[bp+var_68]
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_FA], ax
		push	word ptr [bp+var_F8]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_FA]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_78CD3
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		lea	ax, [bp+var_172]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_C8D7
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_CB9D
		add	sp, 4
		jmp	short loc_78CC0

loc_78C8E:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		jmp	short loc_78CC0
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_78CC0
		cmp	[bp+var_15C], 0
		jz	short loc_78CBE
		mov	bx, [bp+var_15C]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_78CBE

loc_78CBE:
		jmp	short loc_78CD1

loc_78CC0:
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_78C8E

loc_78CD1:
		jmp	short loc_78D26

loc_78CD3:
		push	0A1h
		lea	ax, [bp+var_2A2]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		mov	ax, [bp+var_2C]
		shl	ax, 3
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_38E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_78D0B

loc_78CFE:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_78D0B:
		cmp	word ptr [bp+var_350+1], 1Eh
		jnb	short loc_78D19
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_78D1E

loc_78D19:
		mov	ax, 1
		jmp	short loc_78D20

loc_78D1E:
		xor	ax, ax

loc_78D20:
		mov	ah, 0
		or	ax, ax
		jz	short loc_78CFE

loc_78D26:
		cmp	[bp+var_11], 0
		jz	short loc_78D5C
		mov	word ptr [bp+var_350+1], 0
		jmp	short loc_78D41

loc_78D34:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_78D41:
		cmp	word ptr [bp+var_350+1], 0Ah
		jnb	short loc_78D4F
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_78D54

loc_78D4F:
		mov	ax, 1
		jmp	short loc_78D56

loc_78D54:
		xor	ax, ax

loc_78D56:
		mov	ah, 0
		or	ax, ax
		jz	short loc_78D34

loc_78D5C:
		lea	ax, word ptr [bp+var_38D+1]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_78D82
		jmp	loc_7926C

loc_78D82:
		cmp	[bp+var_E7], 0
		jz	short loc_78DAA
		cmp	[bp+var_EC], 0
		jz	short loc_78DAA
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78DAA

loc_78DAA:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_78DE9
		cmp	[bp+var_E2], 0
		jz	short loc_78DE9
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78DE9

loc_78DE9:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_78E28
		cmp	[bp+var_D8], 0
		jz	short loc_78E28
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78E28

loc_78E28:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C3], 0
		jz	short loc_78E74
		cmp	[bp+var_C8], 0
		jz	short loc_78E74
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78E74

loc_78E74:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B1], 0
		jz	short loc_78EB3
		cmp	[bp+var_B6], 0
		jz	short loc_78EB3
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78EB3

loc_78EB3:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		cmp	[bp+var_A7], 0
		jz	short loc_78EF2
		cmp	[bp+var_AC], 0
		jz	short loc_78EF2
		push	0
		mov	al, [bp+var_A8]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78EF2

loc_78EF2:
		mov	[bp+var_AC], 0
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		cmp	[bp+var_9D], 0
		jz	short loc_78F31
		cmp	[bp+var_A2], 0
		jz	short loc_78F31
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78F31

loc_78F31:
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		lea	ax, [bp+var_98]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8D], 0
		jz	short loc_78F7D
		cmp	[bp+var_92], 0
		jz	short loc_78F7D
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, word ptr [bp+var_92]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78F7D

loc_78F7D:
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_78FBC
		cmp	[bp+var_88], 0
		jz	short loc_78FBC
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78FBC

loc_78FBC:
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		cmp	[bp+var_79], 0
		jz	short loc_78FF7
		cmp	[bp+var_7E], 0
		jz	short loc_78FF7
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_78FF7

loc_78FF7:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_7902F
		cmp	[bp+var_74], 0
		jz	short loc_7902F
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7902F

loc_7902F:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_5D], 0
		jz	short loc_79067
		cmp	[bp+var_62], 0
		jz	short loc_79067
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_79067

loc_79067:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_7909F
		cmp	[bp+var_58], 0
		jz	short loc_7909F
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7909F

loc_7909F:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_43], 0
		jz	short loc_790E3
		cmp	[bp+var_48], 0
		jz	short loc_790E3
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_790E3

loc_790E3:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_79146
		cmp	[bp+var_38], 0
		jz	short loc_79146
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_79146

loc_79146:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_791A8
		cmp	[bp+var_1C], 0
		jz	short loc_791A8
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_791A8

loc_791A8:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_7921F
		cmp	[bp+var_14E], 0
		jz	short loc_7921F
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7921F

loc_7921F:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_7926C:
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, [bp+var_2A2]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_28]
		mov	[bp+var_402], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_400], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_3FE], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_3FC], ax
		lea	ax, [bp+var_38E]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	[bp+var_CE]
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_CE]
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
		push	0
		push	0
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F8+2], ax
		push	word ptr [bp+var_F8+2]
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0FFC9h
		push	0
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	si, ax
		push	0
		push	[bp+var_F0]
		push	[bp+var_EE]
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_F8], ax
		push	0
		push	[bp+var_F4]
		push	[bp+var_F2]
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_FA], ax
		push	word ptr [bp+var_F8]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_FA]
		push	si
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_36C]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_79410
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		lea	ax, [bp+var_168]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_C8D7
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_15E]
		push	ax
		call	sub_CB9D
		add	sp, 4
		jmp	short loc_793FD

loc_793CB:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		jmp	short loc_793FD
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_793FD
		cmp	[bp+var_15C], 0
		jz	short loc_793FB
		mov	bx, [bp+var_15C]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_793FB

loc_793FB:
		jmp	short loc_7940E

loc_793FD:
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_793CB

loc_7940E:
		jmp	short loc_79465

loc_79410:
		push	0E3h
		lea	ax, [bp+var_2A2]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		mov	ax, [bp+var_2C]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_38E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_7944A

loc_7943D:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7944A:
		cmp	word ptr [bp+var_350+1], 1Eh
		jnb	short loc_79458
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_7945D

loc_79458:
		mov	ax, 1
		jmp	short loc_7945F

loc_7945D:
		xor	ax, ax

loc_7945F:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7943D

loc_79465:
		cmp	[bp+var_11], 0
		jz	short loc_794A8
		mov	word ptr [bp+var_350+1], 0
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		jmp	short loc_7948D

loc_79480:
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7948D:
		cmp	word ptr [bp+var_350+1], 0Ah
		jnb	short loc_7949B
		cmp	byte ptr [bp+var_350+3], 0
		jz	short loc_794A0

loc_7949B:
		mov	ax, 1
		jmp	short loc_794A2

loc_794A0:
		xor	ax, ax

loc_794A2:
		mov	ah, 0
		or	ax, ax
		jz	short loc_79480

loc_794A8:
		lea	ax, word ptr [bp+var_38D+1]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_36C]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_794CE
		jmp	loc_799B8

loc_794CE:
		cmp	[bp+var_E7], 0
		jz	short loc_794F6
		cmp	[bp+var_EC], 0
		jz	short loc_794F6
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_794F6

loc_794F6:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_79535
		cmp	[bp+var_E2], 0
		jz	short loc_79535
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_79535

loc_79535:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_79574
		cmp	[bp+var_D8], 0
		jz	short loc_79574
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_79574

loc_79574:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C3], 0
		jz	short loc_795C0
		cmp	[bp+var_C8], 0
		jz	short loc_795C0
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_795C0

loc_795C0:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B1], 0
		jz	short loc_795FF
		cmp	[bp+var_B6], 0
		jz	short loc_795FF
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_795FF

loc_795FF:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		cmp	[bp+var_A7], 0
		jz	short loc_7963E
		cmp	[bp+var_AC], 0
		jz	short loc_7963E
		push	0
		mov	al, [bp+var_A8]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7963E

loc_7963E:
		mov	[bp+var_AC], 0
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		cmp	[bp+var_9D], 0
		jz	short loc_7967D
		cmp	[bp+var_A2], 0
		jz	short loc_7967D
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7967D

loc_7967D:
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		lea	ax, [bp+var_98]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8D], 0
		jz	short loc_796C9
		cmp	[bp+var_92], 0
		jz	short loc_796C9
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, word ptr [bp+var_92]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_796C9

loc_796C9:
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_79708
		cmp	[bp+var_88], 0
		jz	short loc_79708
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_79708

loc_79708:
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		cmp	[bp+var_79], 0
		jz	short loc_79743
		cmp	[bp+var_7E], 0
		jz	short loc_79743
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_79743

loc_79743:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_7977B
		cmp	[bp+var_74], 0
		jz	short loc_7977B
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7977B

loc_7977B:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_5D], 0
		jz	short loc_797B3
		cmp	[bp+var_62], 0
		jz	short loc_797B3
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_797B3

loc_797B3:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_797EB
		cmp	[bp+var_58], 0
		jz	short loc_797EB
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_797EB

loc_797EB:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_43], 0
		jz	short loc_7982F
		cmp	[bp+var_48], 0
		jz	short loc_7982F
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7982F

loc_7982F:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_79892
		cmp	[bp+var_38], 0
		jz	short loc_79892
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_79892

loc_79892:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_798F4
		cmp	[bp+var_1C], 0
		jz	short loc_798F4
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_798F4

loc_798F4:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_7996B
		cmp	[bp+var_14E], 0
		jz	short loc_7996B
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7996B

loc_7996B:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_799B8:
		mov	[bp+var_FE], 0
		mov	byte ptr [bp+var_FA], 2
		mov	byte ptr [bp+var_FA+1], 0
		mov	[bp+var_F8], 0
		push	2
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	1
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_102+1], 0
		lea	ax, word ptr [bp+var_FE]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_10E], 0
		mov	byte ptr [bp+var_10C+2], 2
		mov	byte ptr [bp+var_10C+3], 0
		mov	[bp+var_108], 0
		mov	[bp+var_354], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_352], ax
		lea	ax, [bp+var_354]
		mov	word_4D392, ax
		mov	[bp+var_354], 1BCh
		mov	[bp+var_350], 0
		mov	[bp+var_34C], 0
		mov	[bp+var_358], 0
		mov	[bp+var_356], 0FFFFh
		cmp	[bp+var_2E], 0
		jz	short loc_79A93
		push	3
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	65h
		lea	ax, [bp+var_33C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_358]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_10E]
		push	ax
		lea	ax, [bp+var_358]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_79A93:
		mov	[bp+var_118], 0
		mov	byte ptr [bp+var_116+2], 2
		mov	byte ptr [bp+var_116+3], 0
		mov	[bp+var_112], 0
		push	3
		lea	ax, word ptr [bp+var_118]
		push	ax
		push	0
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	14h
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_118]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	di, ax
		push	[bp+var_104]
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_104]
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
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	si, si
		jmp	short loc_79BB4

loc_79B42:
		cmp	[bp+var_2E], 0
		jz	short loc_79B9B
		cmp	si, 12h
		jz	short loc_79B57
		cmp	si, 17h
		jz	short loc_79B57
		cmp	si, 1Bh
		jnz	short loc_79B9B

loc_79B57:
		mov	ax, word_4F03E
		mov	word ptr [bp+var_11C+2], ax
		mov	word ptr [bp+var_11C], 0
		cmp	[bp+var_358], 0
		jz	short loc_79B9B
		push	[bp+var_356]
		mov	bx, [bp+var_358]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_11C]
		push	word ptr [bp+var_11C+2]
		push	[bp+var_356]
		mov	bx, [bp+var_358]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_79B9B

loc_79B9B:
		mov	[bp+var_11E], si
		mov	ax, [bp+var_11E]
		mov	[di+1Bh], ax
		inc	si
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_79BB4:
		cmp	[bp+var_35D], 2Ch
		jnb	short loc_79BC2
		cmp	[bp+var_35B], 0
		jz	short loc_79BC7

loc_79BC2:
		mov	ax, 1
		jmp	short loc_79BC9

loc_79BC7:
		xor	ax, ax

loc_79BC9:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_79BD2
		jmp	loc_79B42

loc_79BD2:
		push	0
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_116+3], 0
		jz	short loc_79C09
		cmp	[bp+var_118], 0
		jz	short loc_79C09
		push	0
		mov	al, byte ptr [bp+var_116+2]
		push	ax
		lea	ax, word ptr [bp+var_118]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_79C09

loc_79C09:
		mov	[bp+var_118], 0
		mov	byte ptr [bp+var_116+3], 0
		mov	[bp+var_112], 0
		lea	ax, [bp+var_358]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_10C+3], 0
		jz	short loc_79C64
		cmp	[bp+var_10E], 0
		jz	short loc_79C64
		push	0
		mov	al, byte ptr [bp+var_10C+2]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_79C64

loc_79C64:
		mov	[bp+var_10E], 0
		mov	byte ptr [bp+var_10C+3], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_FA+1], 0
		jz	short loc_79CB0
		cmp	[bp+var_FE], 0
		jz	short loc_79CB0
		push	0
		mov	al, byte ptr [bp+var_FA]
		push	ax
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_79CB0

loc_79CB0:
		mov	[bp+var_FE], 0
		mov	byte ptr [bp+var_FA+1], 0
		mov	[bp+var_F8], 0
		mov	[bp+var_FE], 0
		mov	byte ptr [bp+var_FA], 2
		mov	byte ptr [bp+var_FA+1], 0
		mov	[bp+var_F8], 0
		mov	[bp+var_354], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_352], ax
		lea	ax, [bp+var_354]
		mov	word_4D392, ax
		mov	[bp+var_354], 1BCh
		mov	[bp+var_350], 0
		mov	[bp+var_34C], 0
		mov	[bp+var_358], 0
		mov	[bp+var_356], 0FFFFh
		cmp	[bp+var_2E], 0
		jz	short loc_79D58
		push	3
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	65h
		lea	ax, [bp+var_33C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_358]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_FE]
		push	ax
		lea	ax, [bp+var_358]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_79D58:
		mov	[bp+var_108], 0
		mov	byte ptr [bp+var_104], 2
		mov	byte ptr [bp+var_104+1], 0
		mov	[bp+var_102], 0
		push	3
		lea	ax, word ptr [bp+var_108]
		push	ax
		push	0Fh
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_112], 0
		mov	byte ptr [bp+var_10E], 2
		mov	byte ptr [bp+var_10E+1], 0
		mov	[bp+var_10C], 0
		push	3
		lea	ax, word ptr [bp+var_112]
		push	ax
		push	10h
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_11C], 0
		mov	byte ptr [bp+var_118], 2
		mov	byte ptr [bp+var_118+1], 0
		mov	[bp+var_116], 0
		push	2
		lea	ax, word ptr [bp+var_11C]
		push	ax
		push	1
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_11F], 0
		lea	ax, word ptr [bp+var_11C]
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_136]
		push	ax
		push	0FFh
		push	14h
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_79E63
		push	0
		push	0FF50h
		push	0
		lea	ax, word ptr [bp+var_112]
		push	ax
		push	si
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, si
		jmp	short loc_79E65

loc_79E63:
		mov	ax, si

loc_79E65:
		mov	[bp+var_124], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_79EAE
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_108]
		push	ax
		push	di
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [di], 20D9h
		mov	word ptr [di+0Ah], 20F9h
		mov	word ptr [di+1Dh], 0
		mov	word ptr [di+1Fh], 0
		mov	word ptr [di+1Dh], 0
		mov	word ptr [di+1Fh], 0
		mov	ax, di
		jmp	short loc_79EB0

loc_79EAE:
		mov	ax, di

loc_79EB0:
		mov	[bp+var_126], ax
		push	[bp+var_122]
		mov	al, [bp+var_120]
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_124]
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_128], 0
		push	[bp+var_126]
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	bx, [bp+var_126]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_126]
		mov	word ptr [bx+1Fh], 1
		mov	bx, [bp+var_124]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_124]
		mov	word ptr [bx+1Fh], 1
		jmp	short loc_79F29

loc_79F1C:
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_79F29:
		push	[bp+var_126]
		mov	bx, [bp+var_126]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		cmp	ax, 61h
		jl	short loc_79F1C
		mov	bx, [bp+var_126]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_126]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_124]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_124]
		mov	word ptr [bx+1Fh], 0
		mov	[bp+var_35D], 0
		push	0Ah
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4
		push	0E3h
		lea	ax, [bp+var_2A2]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		mov	ax, [bp+var_2C]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_2C4]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_79FB1

loc_79FA4:
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_79FB1:
		cmp	[bp+var_35D], 1Eh
		jnb	short loc_79FBF
		cmp	[bp+var_35B], 0
		jz	short loc_79FC4

loc_79FBF:
		mov	ax, 1
		jmp	short loc_79FC6

loc_79FC4:
		xor	ax, ax

loc_79FC6:
		mov	ah, 0
		or	ax, ax
		jz	short loc_79FA4
		mov	[bp+var_35D], 0
		push	0
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	ax, [bp+var_2C]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_2C4]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_7A00B

loc_79FFE:
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7A00B:
		cmp	[bp+var_35D], 1Eh
		jnb	short loc_7A019
		cmp	[bp+var_35B], 0
		jz	short loc_7A01E

loc_7A019:
		mov	ax, 1
		jmp	short loc_7A020

loc_7A01E:
		xor	ax, ax

loc_7A020:
		mov	ah, 0
		or	ax, ax
		jz	short loc_79FFE
		mov	[bp+var_35D], 0
		push	0
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	ax, [bp+var_2C]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_2C4]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_7A065

loc_7A058:
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7A065:
		cmp	[bp+var_35D], 1Eh
		jnb	short loc_7A073
		cmp	[bp+var_35B], 0
		jz	short loc_7A078

loc_7A073:
		mov	ax, 1
		jmp	short loc_7A07A

loc_7A078:
		xor	ax, ax

loc_7A07A:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7A058
		mov	[bp+var_35D], 0
		push	0
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	ax, [bp+var_2C]
		mov	dx, 0Dh
		imul	dx
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_2C4]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_7A0BF

loc_7A0B2:
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7A0BF:
		cmp	[bp+var_35D], 1Eh
		jnb	short loc_7A0CD
		cmp	[bp+var_35B], 0
		jz	short loc_7A0D2

loc_7A0CD:
		mov	ax, 1
		jmp	short loc_7A0D4

loc_7A0D2:
		xor	ax, ax

loc_7A0D4:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7A0B2
		mov	[bp+var_35D], 0
		push	0
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	ax, [bp+var_2C]
		mov	dx, 0Eh
		imul	dx
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_2C4]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_7A119

loc_7A10C:
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7A119:
		cmp	[bp+var_35D], 1Eh
		jnb	short loc_7A127
		cmp	[bp+var_35B], 0
		jz	short loc_7A12C

loc_7A127:
		mov	ax, 1
		jmp	short loc_7A12E

loc_7A12C:
		xor	ax, ax

loc_7A12E:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7A10C
		mov	[bp+var_35D], 0
		push	0
		lea	ax, [bp+var_2C4]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	ax, [bp+var_2C]
		mov	dx, 0Fh
		imul	dx
		mov	dx, [bp+var_2A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_2C4]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_7A173

loc_7A166:
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7A173:
		cmp	[bp+var_35D], 1Eh
		jnb	short loc_7A181
		cmp	[bp+var_35B], 0
		jz	short loc_7A186

loc_7A181:
		mov	ax, 1
		jmp	short loc_7A188

loc_7A186:
		xor	ax, ax

loc_7A188:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7A166
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	0
		lea	ax, word ptr [bp+var_37C+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_122]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_118+1], 0
		jz	short loc_7A1E9
		cmp	[bp+var_11C], 0
		jz	short loc_7A1E9
		push	0
		mov	al, byte ptr [bp+var_118]
		push	ax
		lea	ax, word ptr [bp+var_11C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A1E9

loc_7A1E9:
		mov	[bp+var_11C], 0
		mov	byte ptr [bp+var_118+1], 0
		mov	[bp+var_116], 0
		cmp	byte ptr [bp+var_10E+1], 0
		jz	short loc_7A228
		cmp	[bp+var_112], 0
		jz	short loc_7A228
		push	0
		mov	al, byte ptr [bp+var_10E]
		push	ax
		lea	ax, word ptr [bp+var_112]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A228

loc_7A228:
		mov	[bp+var_112], 0
		mov	byte ptr [bp+var_10E+1], 0
		mov	[bp+var_10C], 0
		cmp	byte ptr [bp+var_104+1], 0
		jz	short loc_7A267
		cmp	[bp+var_108], 0
		jz	short loc_7A267
		push	0
		mov	al, byte ptr [bp+var_104]
		push	ax
		lea	ax, word ptr [bp+var_108]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A267

loc_7A267:
		mov	[bp+var_108], 0
		mov	byte ptr [bp+var_104+1], 0
		mov	[bp+var_102], 0
		lea	ax, [bp+var_358]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_FA+1], 0
		jz	short loc_7A2C2
		cmp	[bp+var_FE], 0
		jz	short loc_7A2C2
		push	0
		mov	al, byte ptr [bp+var_FA]
		push	ax
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A2C2

loc_7A2C2:
		mov	[bp+var_FE], 0
		mov	byte ptr [bp+var_FA+1], 0
		mov	[bp+var_F8], 0
		cmp	byte_4F55C, 0
		jnz	short loc_7A2E3
		jmp	loc_7A7CD

loc_7A2E3:
		cmp	[bp+var_E7], 0
		jz	short loc_7A30B
		cmp	[bp+var_EC], 0
		jz	short loc_7A30B
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A30B

loc_7A30B:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_7A34A
		cmp	[bp+var_E2], 0
		jz	short loc_7A34A
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A34A

loc_7A34A:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_7A389
		cmp	[bp+var_D8], 0
		jz	short loc_7A389
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A389

loc_7A389:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C3], 0
		jz	short loc_7A3D5
		cmp	[bp+var_C8], 0
		jz	short loc_7A3D5
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A3D5

loc_7A3D5:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B1], 0
		jz	short loc_7A414
		cmp	[bp+var_B6], 0
		jz	short loc_7A414
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A414

loc_7A414:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		cmp	[bp+var_A7], 0
		jz	short loc_7A453
		cmp	[bp+var_AC], 0
		jz	short loc_7A453
		push	0
		mov	al, [bp+var_A8]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A453

loc_7A453:
		mov	[bp+var_AC], 0
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		cmp	[bp+var_9D], 0
		jz	short loc_7A492
		cmp	[bp+var_A2], 0
		jz	short loc_7A492
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A492

loc_7A492:
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		lea	ax, [bp+var_98]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8D], 0
		jz	short loc_7A4DE
		cmp	[bp+var_92], 0
		jz	short loc_7A4DE
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, word ptr [bp+var_92]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A4DE

loc_7A4DE:
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_7A51D
		cmp	[bp+var_88], 0
		jz	short loc_7A51D
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A51D

loc_7A51D:
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		cmp	[bp+var_79], 0
		jz	short loc_7A558
		cmp	[bp+var_7E], 0
		jz	short loc_7A558
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A558

loc_7A558:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_7A590
		cmp	[bp+var_74], 0
		jz	short loc_7A590
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A590

loc_7A590:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_5D], 0
		jz	short loc_7A5C8
		cmp	[bp+var_62], 0
		jz	short loc_7A5C8
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A5C8

loc_7A5C8:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_7A600
		cmp	[bp+var_58], 0
		jz	short loc_7A600
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A600

loc_7A600:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_43], 0
		jz	short loc_7A644
		cmp	[bp+var_48], 0
		jz	short loc_7A644
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A644

loc_7A644:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_7A6A7
		cmp	[bp+var_38], 0
		jz	short loc_7A6A7
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A6A7

loc_7A6A7:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_7A709
		cmp	[bp+var_1C], 0
		jz	short loc_7A709
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A709

loc_7A709:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_7A780
		cmp	[bp+var_14E], 0
		jz	short loc_7A780
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A780

loc_7A780:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_7A7CD:
		cmp	[bp+var_E7], 0
		jz	short loc_7A7F5
		cmp	[bp+var_EC], 0
		jz	short loc_7A7F5
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A7F5

loc_7A7F5:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_7A834
		cmp	[bp+var_E2], 0
		jz	short loc_7A834
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A834

loc_7A834:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_7A873
		cmp	[bp+var_D8], 0
		jz	short loc_7A873
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A873

loc_7A873:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C3], 0
		jz	short loc_7A8BF
		cmp	[bp+var_C8], 0
		jz	short loc_7A8BF
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A8BF

loc_7A8BF:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B1], 0
		jz	short loc_7A8FE
		cmp	[bp+var_B6], 0
		jz	short loc_7A8FE
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A8FE

loc_7A8FE:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		cmp	[bp+var_A7], 0
		jz	short loc_7A93D
		cmp	[bp+var_AC], 0
		jz	short loc_7A93D
		push	0
		mov	al, [bp+var_A8]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A93D

loc_7A93D:
		mov	[bp+var_AC], 0
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		cmp	[bp+var_9D], 0
		jz	short loc_7A97C
		cmp	[bp+var_A2], 0
		jz	short loc_7A97C
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A97C

loc_7A97C:
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		lea	ax, [bp+var_98]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8D], 0
		jz	short loc_7A9C8
		cmp	[bp+var_92], 0
		jz	short loc_7A9C8
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, word ptr [bp+var_92]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7A9C8

loc_7A9C8:
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_7AA07
		cmp	[bp+var_88], 0
		jz	short loc_7AA07
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7AA07

loc_7AA07:
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		cmp	[bp+var_79], 0
		jz	short loc_7AA42
		cmp	[bp+var_7E], 0
		jz	short loc_7AA42
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7AA42

loc_7AA42:
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_7AA7A
		cmp	[bp+var_74], 0
		jz	short loc_7AA7A
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7AA7A

loc_7AA7A:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_5D], 0
		jz	short loc_7AAB2
		cmp	[bp+var_62], 0
		jz	short loc_7AAB2
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7AAB2

loc_7AAB2:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_7AAEA
		cmp	[bp+var_58], 0
		jz	short loc_7AAEA
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7AAEA

loc_7AAEA:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_43], 0
		jz	short loc_7AB2E
		cmp	[bp+var_48], 0
		jz	short loc_7AB2E
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7AB2E

loc_7AB2E:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		lea	ax, [bp+var_34A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_7AB91
		cmp	[bp+var_38], 0
		jz	short loc_7AB91
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7AB91

loc_7AB91:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2C]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		lea	ax, [bp+var_2C2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2A2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_7ABF3
		cmp	[bp+var_1C], 0
		jz	short loc_7ABF3
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7ABF3

loc_7ABF3:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_1C2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	[bp+var_15E], 129Fh
		lea	ax, [bp+var_15E]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_149], 0
		jz	short loc_7AC6A
		cmp	[bp+var_14E], 0
		jz	short loc_7AC6A
		push	0
		mov	al, [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7AC6A

loc_7AC6A:
		mov	[bp+var_14E], 0
		mov	[bp+var_149], 0
		mov	[bp+var_148], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_136]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
MidgameTO1_Play_74C00		endp

; START OF FUNCTION CHUNK FOR MidgameTO1_Play_74C00
off_7ACB7	dw offset loc_74FB2
		dw offset loc_7511E
		dw offset loc_7511E
		dw offset loc_7511E
		dw offset loc_7511E
; END OF FUNCTION CHUNK FOR MidgameTO1_Play_74C00
ovr202		ends
