ovr207		segment	para public 'OVERLAY' use16
		assume cs:ovr207
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, cinématique mid15 de Tactical Operations (2026-11-02) : script extrait par
; tools/midgame_extract.py dans analysis/topt/midgames/mid15.md et .json, fichier
; analysis/topt/midgames/iff. Fonction entière lue par exécution symbolique, pas commentée
; ligne à ligne.
; ==============================================================================================
Midgame15_Play_85FE0		proc far

var_DE8		= word ptr -0DE8h
var_DE6		= word ptr -0DE6h
var_DE4		= word ptr -0DE4h
var_DE2		= word ptr -0DE2h
var_DD8		= word ptr -0DD8h
var_DA8		= word ptr -0DA8h
var_D7B		= dword ptr -0D7Bh
var_D77		= dword ptr -0D77h
var_D73		= dword ptr -0D73h
var_D66		= word ptr -0D66h
var_D62		= dword ptr -0D62h
var_D5E		= word ptr -0D5Eh
var_D5C		= word ptr -0D5Ch
var_D5A		= word ptr -0D5Ah
var_D58		= dword ptr -0D58h
var_D54		= byte ptr -0D54h
var_D52		= word ptr -0D52h
var_D43		= word ptr -0D43h
var_D41		= byte ptr -0D41h
var_D3E		= word ptr -0D3Eh
var_D3C		= word ptr -0D3Ch
var_D3A		= word ptr -0D3Ah
var_D38		= word ptr -0D38h
var_D36		= dword ptr -0D36h
var_D32		= byte ptr -0D32h
var_D30		= word ptr -0D30h
var_D2E		= word ptr -0D2Eh
var_D2C		= word ptr -0D2Ch
var_D2A		= word ptr -0D2Ah
var_D28		= dword ptr -0D28h
var_D24		= byte ptr -0D24h
var_D22		= word ptr -0D22h
var_D20		= word ptr -0D20h
var_D1E		= word ptr -0D1Eh
var_D1C		= word ptr -0D1Ch
var_D1A		= dword ptr -0D1Ah
var_D16		= byte ptr -0D16h
var_D14		= word ptr -0D14h
var_D12		= word ptr -0D12h
var_CF2		= word ptr -0CF2h
var_CDA		= word ptr -0CDAh
var_CD8		= word ptr -0CD8h
var_CCA		= dword ptr -0CCAh
var_CC6		= byte ptr -0CC6h
var_CC5		= byte ptr -0CC5h
var_CC4		= dword ptr -0CC4h
var_4BD		= dword ptr -4BDh
var_4B9		= dword ptr -4B9h
var_4B4		= word ptr -4B4h
var_4B2		= word ptr -4B2h
var_4B0		= word ptr -4B0h
var_4AE		= word ptr -4AEh
var_4AC		= dword ptr -4ACh
var_4A8		= byte ptr -4A8h
var_4A6		= word ptr -4A6h
var_42E		= word ptr -42Eh
var_3B6		= word ptr -3B6h
var_33E		= word ptr -33Eh
var_2C6		= word ptr -2C6h
var_24E		= word ptr -24Eh
var_1D6		= word ptr -1D6h
var_1D4		= word ptr -1D4h
var_1D2		= word ptr -1D2h
var_1D0		= word ptr -1D0h
var_1CE		= word ptr -1CEh
var_1CC		= word ptr -1CCh
var_1C8		= word ptr -1C8h
var_1C6		= word ptr -1C6h
var_1C4		= word ptr -1C4h
var_1C2		= word ptr -1C2h
var_1C0		= word ptr -1C0h
var_1BE		= word ptr -1BEh
var_1BA		= word ptr -1BAh
var_16A		= word ptr -16Ah
var_168		= word ptr -168h
var_166		= dword ptr -166h
var_164		= dword ptr -164h
var_160		= dword ptr -160h
var_15E		= dword ptr -15Eh
var_15A		= dword ptr -15Ah
var_158		= dword ptr -158h
var_154		= dword ptr -154h
var_152		= dword ptr -152h
var_150		= dword ptr -150h
var_14E		= dword ptr -14Eh
var_14C		= dword ptr -14Ch
var_14A		= dword ptr -14Ah
var_148		= dword ptr -148h
var_146		= dword ptr -146h
var_144		= dword ptr -144h
var_142		= dword ptr -142h
var_140		= dword ptr -140h
var_13E		= dword ptr -13Eh
var_13C		= dword ptr -13Ch
var_13A		= dword ptr -13Ah
var_138		= dword ptr -138h
var_134		= dword ptr -134h
var_132		= dword ptr -132h
var_12E		= word ptr -12Eh
var_12C		= word ptr -12Ch
var_12A		= dword ptr -12Ah
var_126		= byte ptr -126h
var_125		= byte ptr -125h
var_124		= dword ptr -124h
var_120		= dword ptr -120h
var_11C		= byte ptr -11Ch
var_11B		= byte ptr -11Bh
var_11A		= dword ptr -11Ah
var_116		= dword ptr -116h
var_112		= dword ptr -112h
var_10E		= byte ptr -10Eh
var_10D		= byte ptr -10Dh
var_10C		= dword ptr -10Ch
var_108		= word ptr -108h
var_106		= byte ptr -106h
var_105		= word ptr -105h
var_102		= dword ptr -102h
var_FE		= byte ptr -0FEh
var_FD		= byte ptr -0FDh
var_FC		= dword ptr -0FCh
var_F8		= word ptr -0F8h
var_F6		= byte ptr -0F6h
var_F5		= word ptr -0F5h
var_F2		= dword ptr -0F2h
var_EE		= byte ptr -0EEh
var_ED		= byte ptr -0EDh
var_EC		= dword ptr -0ECh
var_E8		= word ptr -0E8h
var_E6		= byte ptr -0E6h
var_E5		= word ptr -0E5h
var_E2		= dword ptr -0E2h
var_DE		= byte ptr -0DEh
var_DD		= byte ptr -0DDh
var_DC		= dword ptr -0DCh
var_D8		= word ptr -0D8h
var_D5		= word ptr -0D5h
var_D2		= dword ptr -0D2h
var_CE		= byte ptr -0CEh
var_CD		= byte ptr -0CDh
var_CC		= dword ptr -0CCh
var_C8		= word ptr -0C8h
var_C6		= byte ptr -0C6h
var_C5		= word ptr -0C5h
var_C2		= dword ptr -0C2h
var_BE		= byte ptr -0BEh
var_BD		= byte ptr -0BDh
var_BC		= dword ptr -0BCh
var_B8		= word ptr -0B8h
var_B6		= byte ptr -0B6h
var_B5		= word ptr -0B5h
var_B2		= dword ptr -0B2h
var_AE		= byte ptr -0AEh
var_AD		= byte ptr -0ADh
var_AC		= dword ptr -0ACh
var_A8		= word ptr -0A8h
var_A6		= byte ptr -0A6h
var_A5		= word ptr -0A5h
var_A2		= dword ptr -0A2h
var_9E		= byte ptr -9Eh
var_9D		= byte ptr -9Dh
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= byte ptr -94h
var_93		= byte ptr -93h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= byte ptr -8Ah
var_89		= byte ptr -89h
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= byte ptr -80h
var_7F		= byte ptr -7Fh
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= byte ptr -76h
var_75		= byte ptr -75h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= byte ptr -6Ch
var_6B		= byte ptr -6Bh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= byte ptr -62h
var_61		= byte ptr -61h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= byte ptr -4Eh
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= byte ptr -3Ah
var_39		= byte ptr -39h
var_38		= dword ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= byte ptr -30h
var_2E		= byte ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= byte ptr -28h
var_27		= byte ptr -27h
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= byte ptr -20h
var_1E		= word ptr -1Eh
var_1C		= byte ptr -1Ch
var_18		= word ptr -18h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
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
		sub	sp, 0DD8h
		push	si
		push	di
		mov	[bp+var_2], 2921h
		mov	[bp+var_4], 2924h
		mov	[bp+var_6], 2928h
		mov	[bp+var_C], 0
		push	0C8h
		push	1Ah
		lea	ax, [bp+var_E]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		mov	[bp+var_F], 0
		mov	[bp+var_10], 0
		mov	[bp+var_11], 0
		cmp	word_4CA5B, 0
		jz	short loc_86025
		mov	[bp+var_10], 1

loc_86025:
		mov	ax, word_4D36E
		mov	[bp+var_14], ax
		mov	[bp+var_1C8], 0
		mov	[bp+var_1C6], 0
		push	[bp+var_14]
		lea	ax, [bp+var_1C8]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_1D6], 0
		mov	[bp+var_1D4], 0
		mov	[bp+var_1D2], 0
		mov	[bp+var_1D0], 0
		mov	[bp+var_1CE], 13Fh
		mov	[bp+var_1CC], 9Dh
		push	0
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_1D6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_1C4], 0
		mov	[bp+var_1C2], 18h
		mov	[bp+var_1C0], 13Fh
		mov	[bp+var_1BE], 97h
		mov	byte ptr [bp+var_22], 0
		mov	byte ptr [bp+var_22+1], 0
		mov	[bp+var_20], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid15
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_24E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_24E]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgames_16
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_2C6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_2C6]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps_5
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_33E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_33E]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals_4
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_3B6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_3B6]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid15voc
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_42E]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		cmp	[bp+var_10], 0
		jz	short loc_8620B
		push	ds
		lea	ax, [bp+var_1BA]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_8620B
		push	1
		lea	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_42E]
		push	ax
		mov	bx, [bp+var_42E]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_42E]
		push	ax
		call	sub_435F1
		add	sp, 2
		jmp	short loc_8620F

loc_8620B:
		mov	[bp+var_10], 0

loc_8620F:
		mov	[bp+var_2C], 0
		mov	[bp+var_28], 2
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		mov	al, byte_4CA58
		mov	[bp+var_2E], al
		lea	ax, [bp+var_4A6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_2E]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_8624A
		jmp	loc_8656D

loc_8624A:
		shl	bx, 1
		jmp	cs:off_8E8FA[bx]	; switch jump

loc_86251:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1BA]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_8627F
		jmp	loc_86389

loc_8627F:
		push	1
		lea	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_4A6]
		push	ax
		mov	bx, [bp+var_4A6]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_4A6]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_17
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_DD8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_DD8], 480h
		mov	[bp+var_D77], 100h
		mov	[bp+var_D7B], 0
		mov	[bp+var_DD8], 498h
		push	1
		lea	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_DD8]
		push	ax
		mov	bx, [bp+var_DD8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	di, 1
		jmp	short loc_86351

loc_8633B:
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	di

loc_86351:
		cmp	di, 6Ah
		jle	short loc_8633B
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_11], 1
		mov	[bp+var_DD8], 498h
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_DD8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_86389:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1BA]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_863C7
		mov	[bp+var_F], 1
		mov	al, [bp+var_11]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_863C7
		mov	word_4F048, 5Ah

loc_863C7:
		jmp	loc_8656D

loc_863CA:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1BA]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_863F8
		jmp	loc_8650C

loc_863F8:
		cmp	word_4CA5D, 0
		jnz	short loc_86402
		jmp	loc_8650C

loc_86402:
		push	1
		lea	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_4A6]
		push	ax
		mov	bx, [bp+var_4A6]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_4A6]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_18
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_DD8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_DD8], 480h
		mov	[bp+var_D77], 100h
		mov	[bp+var_D7B], 0
		mov	[bp+var_DD8], 498h
		push	1
		lea	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_DD8]
		push	ax
		mov	bx, [bp+var_DD8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	di, 1
		jmp	short loc_864D4

loc_864BE:
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	di

loc_864D4:
		cmp	di, 6Ah
		jle	short loc_864BE
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_11], 1
		mov	[bp+var_DD8], 498h
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_DD8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_8650C:
		cmp	[bp+var_2E], 3
		jnz	short loc_8652D
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_86546

loc_8652D:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_86546:
		push	ds
		lea	ax, [bp+var_1BA]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_8656B
		mov	[bp+var_F], 1
		mov	al, [bp+var_11]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8656B
		mov	word_4F048, 0FFh

loc_8656B:
		jmp	short loc_8656D

loc_8656D:
		mov	ax, word_4B2FC
		mov	[bp+var_34], ax
		mov	ax, word_4B2FE
		mov	[bp+var_32], ax
		mov	al, byte_4B300
		mov	[bp+var_30], al
		cmp	[bp+var_11], 0
		jnz	short loc_86588
		jmp	loc_8668D

loc_86588:
		mov	[bp+var_D3A], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D38], ax
		lea	ax, [bp+var_D3A]
		mov	word_4D392, ax
		mov	[bp+var_D3A], 1BCh
		mov	[bp+var_D36], 0
		mov	[bp+var_D32], 0
		mov	[bp+var_D3E], 0
		mov	[bp+var_D3C], 0FFFFh
		push	word_4CA5D
		lea	ax, [bp+var_D3E]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		xor	di, di
		jmp	loc_86669

loc_865D2:
		mov	[bp+var_138], 0
		mov	byte ptr [bp+var_134], 2
		mov	byte ptr [bp+var_134+1], 0
		mov	[bp+var_132], 0
		push	3
		lea	ax, word ptr [bp+var_138]
		push	ax
		mov	al, byte ptr [bp+di+var_34]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		lea	ax, word ptr [bp+var_138]
		push	ax
		lea	ax, [bp+var_D3E]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_D3E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		cmp	byte ptr [bp+var_134+1], 0
		jz	short loc_86651
		cmp	[bp+var_138], 0
		jz	short loc_86651
		push	0
		mov	al, byte ptr [bp+var_134]
		push	ax
		lea	ax, word ptr [bp+var_138]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_86651

loc_86651:
		mov	[bp+var_138], 0
		mov	byte ptr [bp+var_134+1], 0
		mov	[bp+var_132], 0
		inc	di

loc_86669:
		cmp	di, 5
		jge	short loc_86671
		jmp	loc_865D2

loc_86671:
		lea	ax, [bp+var_D3E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D3A]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_8668D:
		mov	[bp+var_4B0], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_4AE], ax
		lea	ax, [bp+var_4B0]
		mov	word_4D392, ax
		mov	[bp+var_4B0], 1BCh
		mov	[bp+var_4AC], 0
		mov	[bp+var_4A8], 0
		mov	[bp+var_4B4], 0
		mov	[bp+var_4B2], 0FFFFh
		cmp	[bp+var_F], 0
		jnz	short loc_866CA
		jmp	loc_8674A

loc_866CA:
		push	1
		lea	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_DA8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_DA8]
		push	ax
		call	sub_435F1
		add	sp, 2
		cmp	[bp+var_10], 0
		jz	short loc_866F8
		mov	byte ptr [bp+var_132+3], 0Ah
		jmp	short loc_866FD

loc_866F8:
		mov	byte ptr [bp+var_132+3], 9

loc_866FD:
		push	3
		lea	ax, word ptr [bp+var_2C]
		push	ax
		mov	al, byte ptr [bp+var_132+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_DA8]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_4B4]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_2C]
		push	ax
		lea	ax, [bp+var_4B4]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, [bp+var_DA8]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_8674A:
		mov	[bp+var_CDA], 129Fh
		mov	[bp+var_CCA], 0
		mov	[bp+var_CC6], 2
		mov	[bp+var_CC5], 0
		mov	[bp+var_CC4], 0
		mov	[bp+var_CD8], 0
		mov	[bp+var_CDA], 1FA5h
		xor	eax, eax
		mov	[bp+var_4BD], eax
		mov	[bp+var_4B9], eax
		cmp	[bp+var_10], 0
		jz	short loc_8679F
		push	word_4CA5B
		lea	ax, [bp+var_CDA]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		jmp	loc_86A92

loc_8679F:
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_19
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_DD8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_DD8], 480h
		mov	[bp+var_D77], 100h
		mov	[bp+var_D7B], 0
		mov	[bp+var_DD8], 498h
		push	1
		lea	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_DD8]
		push	ax
		mov	bx, [bp+var_DD8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3531474Dh
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		xor	di, di
		jmp	short loc_86870

loc_86827:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	ax, [bp+var_D66]
		mov	word ptr [bp+var_132+2], ax
		movsx	eax, word ptr [bp+var_132+2]
		push	eax
		push	ds
		mov	ax, [bp+var_E]
		imul	di
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_D62]
		mov	[bp+var_D73], eax
		inc	di

loc_86870:
		cmp	di, 1Ah
		jl	short loc_86827
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_868BE
		push	[bp+var_2]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_2]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_86942

loc_868BE:
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_868F9
		push	[bp+var_2]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_4]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_86942

loc_868F9:
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_86934
		push	[bp+var_2]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_0]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_86942

loc_86934:
		push	[bp+var_6]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4

loc_86942:
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_8699F
		push	[bp+var_2]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_0]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_4]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_86A70

loc_8699F:
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_869FB
		push	[bp+var_2]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_4]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_4]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_86A70

loc_869FB:
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_86A57
		push	[bp+var_2]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_2]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_4]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_86A70

loc_86A57:
		push	[bp+var_4]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_86A70:
		mov	[bp+var_DD8], 498h
		lea	ax, [bp+var_DD8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_DD8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_86A92:
		mov	[bp+var_3E], 0
		mov	[bp+var_3A], 2
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		push	3
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	74h
		lea	ax, [bp+var_33E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_48], 0
		mov	[bp+var_44], 2
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	3
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	5
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_52], 0
		mov	[bp+var_4E], 2
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		push	3
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	1
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_5C], 0
		mov	[bp+var_58], 2
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	3
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	4
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_66], 0
		mov	[bp+var_62], 2
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	3
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	0
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_70], 0
		mov	[bp+var_6C], 2
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	3
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	8
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_7A], 0
		mov	[bp+var_76], 2
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	3
		lea	ax, word ptr [bp+var_7A]
		push	ax
		push	9
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_84], 0
		mov	[bp+var_80], 2
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		push	3
		lea	ax, word ptr [bp+var_84]
		push	ax
		push	3
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_8E], 0
		mov	[bp+var_8A], 2
		mov	[bp+var_89], 0
		mov	[bp+var_88], 0
		push	3
		lea	ax, word ptr [bp+var_8E]
		push	ax
		push	7
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_98], 0
		mov	[bp+var_94], 2
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		push	3
		lea	ax, word ptr [bp+var_98]
		push	ax
		push	4
		lea	ax, [bp+var_2C6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_A2], 0
		mov	[bp+var_9E], 2
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		push	2
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	15h
		lea	ax, [bp+var_3B6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_A5], 0
		lea	ax, word ptr [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_B2], 0
		mov	[bp+var_AE], 2
		mov	[bp+var_AD], 0
		mov	[bp+var_AC], 0
		push	2
		lea	ax, word ptr [bp+var_B2]
		push	ax
		push	0Fh
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_B5], 0
		lea	ax, word ptr [bp+var_B2]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_C2], 0
		mov	[bp+var_BE], 2
		mov	[bp+var_BD], 0
		mov	[bp+var_BC], 0
		push	2
		lea	ax, word ptr [bp+var_C2]
		push	ax
		push	0Bh
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_C5], 0
		lea	ax, word ptr [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_D2], 0
		mov	[bp+var_CE], 2
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		push	2
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	0Dh
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_D5], 0
		lea	ax, word ptr [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_E2], 0
		mov	[bp+var_DE], 2
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		push	2
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	0Eh
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E5], 0
		lea	ax, word ptr [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_F2], 0
		mov	[bp+var_EE], 2
		mov	[bp+var_ED], 0
		mov	[bp+var_EC], 0
		push	2
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	6
		lea	ax, [bp+var_2C6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_F5], 0
		lea	ax, word ptr [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_102], 0
		mov	[bp+var_FE], 2
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		push	0
		push	2
		lea	ax, word ptr [bp+var_102]
		push	ax
		call	ConvData_LoadNormalOrNight_10C9F
		add	sp, 6
		mov	[bp+var_105], 0
		lea	ax, word ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_112], 0
		mov	[bp+var_10E], 2
		mov	[bp+var_10D], 0
		mov	[bp+var_10C], 0
		push	ds
		push	offset unk_4B35A
		push	ds
		push	offset aConvfontShp_4
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_1BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_1BA]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_116+2], dx
		mov	word ptr [bp+var_116], ax
		mov	eax, [bp+var_116]
		mov	[bp+var_112], eax
		mov	[bp+var_10E], 2
		mov	[bp+var_10D], 1
		mov	[bp+var_10C], 0
		lea	ax, word ptr [bp+var_112]
		push	ax
		lea	ax, [bp+var_CF2]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		lea	ax, [bp+var_CF2]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	[bp+var_DE8], 0
		mov	[bp+var_DE6], 98h
		mov	[bp+var_DE4], 13Fh
		mov	[bp+var_DE2], 0C7h
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0C8h
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_120], 0
		mov	[bp+var_11C], 2
		mov	[bp+var_11B], 0
		mov	[bp+var_11A], 0
		mov	[bp+var_12A], 0
		mov	[bp+var_126], 2
		mov	[bp+var_125], 0
		mov	[bp+var_124], 0
		mov	[bp+var_D1E], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D1C], ax
		lea	ax, [bp+var_D1E]
		mov	word_4D392, ax
		mov	[bp+var_D1E], 1BCh
		mov	[bp+var_D1A], 0
		mov	[bp+var_D16], 0
		mov	[bp+var_D22], 0
		mov	[bp+var_D20], 0FFFFh
		mov	[bp+var_D2C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D2A], ax
		lea	ax, [bp+var_D2C]
		mov	word_4D392, ax
		mov	[bp+var_D2C], 1BCh
		mov	[bp+var_D28], 0
		mov	[bp+var_D24], 0
		mov	[bp+var_D30], 0
		mov	[bp+var_D2E], 0FFFFh
		cmp	byte_4F55C, 0
		jz	short loc_86FD6
		jmp	loc_8E250

loc_86FD6:
		cmp	[bp+var_F], 0
		jz	short loc_87020
		mov	ax, word_4F048
		mov	[bp+var_12C], ax
		mov	[bp+var_12E], 0
		cmp	[bp+var_4B4], 0
		jz	short loc_87020
		push	[bp+var_4B2]
		mov	bx, [bp+var_4B4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_12E]
		push	[bp+var_12C]
		push	[bp+var_4B2]
		mov	bx, [bp+var_4B4]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_87020

loc_87020:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		push	0
		push	0
		push	20h
		push	0
		push	5Eh
		push	120h
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_DBA8
		add	sp, 10h
		mov	word ptr [bp+var_132], ax
		push	0
		push	0
		push	20h
		push	0
		push	5Eh
		push	120h
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_DBA8
		add	sp, 10h
		mov	word ptr [bp+var_134], ax
		push	[bp+var_C8]
		mov	al, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	[bp+var_C8]
		mov	al, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	[bp+var_13E], 0
		mov	byte ptr [bp+var_13A], 2
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_138], 0
		mov	[bp+var_D5C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D5A], ax
		lea	ax, [bp+var_D5C]
		mov	word_4D392, ax
		mov	[bp+var_D5C], 1BCh
		mov	[bp+var_D58], 0
		mov	[bp+var_D54], 0
		mov	word ptr [bp+var_D62+2], 0
		mov	[bp+var_D5E], 0FFFFh
		cmp	[bp+var_11], 0
		jnz	short loc_87182
		jmp	loc_87201

loc_87182:
		push	3
		lea	ax, word ptr [bp+var_13E]
		push	ax
		push	3Dh
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_13E]
		push	ax
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFEE
		mov	word ptr [bp+var_140], ax
		mov	word ptr [bp+var_142], 0
		cmp	word ptr [bp+var_D62+2], 0
		jz	short loc_87201
		push	[bp+var_D5E]
		mov	bx, word ptr [bp+var_D62+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_142]
		push	word ptr [bp+var_140]
		push	[bp+var_D5E]
		mov	bx, word ptr [bp+var_D62+2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_87201

loc_87201:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_FadeFromColor_34EEE
		add	sp, 0Ah
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	word ptr [bp+var_144], 20h
		mov	word ptr [bp+var_146], 6
		mov	word ptr [bp+var_148], 20h
		mov	word ptr [bp+var_14A], 6
		mov	word ptr [bp+var_14C], 0
		mov	word ptr [bp+var_14E], 0
		mov	word ptr [bp+var_150], 0FFF8h
		mov	word ptr [bp+var_152], 0FFFCh
		mov	word ptr [bp+var_154], 0FFF8h
		mov	word ptr [bp+var_158+2], 0FFFCh
		push	word ptr [bp+var_134]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	loc_873FA

loc_8729B:
		mov	di, word ptr [bp+var_D36+1]
		mov	ax, word ptr [bp+var_14C]
		mov	word ptr [bp+var_158], ax
		mov	bx, word ptr [bp+var_134]
		mov	ax, word ptr [bp+var_158]
		mov	[bx+1Bh], ax
		or	di, di
		jle	short loc_8732C
		cmp	di, 26h
		jge	short loc_8732C
		cmp	di, 1Eh
		jnz	short loc_872D2
		mov	word ptr [bp+var_146], 5
		mov	word ptr [bp+var_150], 0FFF9h
		mov	word ptr [bp+var_152], 0FFFDh

loc_872D2:
		cmp	di, 24h
		jnz	short loc_872E9
		mov	word ptr [bp+var_146], 4
		mov	word ptr [bp+var_150], 0FFFAh
		mov	word ptr [bp+var_152], 0FFFEh

loc_872E9:
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_134]
		call	ScaledImageLayer_SetScale_DD0B
		add	sp, 4
		cmp	di, 33h
		jge	short loc_87316
		push	word ptr [bp+var_152]
		push	word ptr [bp+var_150]
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_87316:
		mov	ax, word ptr [bp+var_146]
		add	word ptr [bp+var_144], ax
		cmp	word ptr [bp+var_144], 0FFh
		jle	short loc_8732C
		mov	word ptr [bp+var_144], 0FFh

loc_8732C:
		inc	word ptr [bp+var_14C]
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, 1Eh
		jle	short loc_8733F
		mov	word ptr [bp+var_14C], 0

loc_8733F:
		mov	ax, word ptr [bp+var_14E]
		mov	word ptr [bp+var_15A], ax
		mov	bx, word ptr [bp+var_132]
		mov	ax, word ptr [bp+var_15A]
		mov	[bx+1Bh], ax
		cmp	di, 0FFFFh
		jle	short loc_873CD
		cmp	di, 25h
		jge	short loc_873CD
		cmp	di, 1Ch
		jnz	short loc_87373
		mov	word ptr [bp+var_14A], 5
		mov	word ptr [bp+var_154], 0FFF9h
		mov	word ptr [bp+var_158+2], 0FFFDh

loc_87373:
		cmp	di, 22h
		jnz	short loc_8738A
		mov	word ptr [bp+var_14A], 4
		mov	word ptr [bp+var_154], 0FFFAh
		mov	word ptr [bp+var_158+2], 0FFFEh

loc_8738A:
		push	word ptr [bp+var_148]
		push	word ptr [bp+var_132]
		call	ScaledImageLayer_SetScale_DD0B
		add	sp, 4
		cmp	di, 33h
		jge	short loc_873B7
		push	word ptr [bp+var_158+2]
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_132]
		mov	bx, word ptr [bp+var_132]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_873B7:
		mov	ax, word ptr [bp+var_14A]
		add	word ptr [bp+var_148], ax
		cmp	word ptr [bp+var_148], 0FFh
		jle	short loc_873CD
		mov	word ptr [bp+var_148], 0FFh

loc_873CD:
		inc	word ptr [bp+var_14E]
		mov	ax, word ptr [bp+var_14E]
		cmp	ax, 1Ah
		jle	short loc_873E0
		mov	word ptr [bp+var_14E], 0

loc_873E0:
		jmp	short loc_873ED
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_873ED
		jmp	short loc_87418

loc_873ED:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_873FA:
		cmp	word ptr [bp+var_D36+1], 3Eh
		jnb	short loc_87408
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8740D

loc_87408:
		mov	ax, 1
		jmp	short loc_8740F

loc_8740D:
		xor	ax, ax

loc_8740F:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_87418
		jmp	loc_8729B

loc_87418:
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D5C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_13A+1], 0
		jz	short loc_8745C
		cmp	[bp+var_13E], 0
		jz	short loc_8745C
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, word ptr [bp+var_13E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8745C

loc_8745C:
		mov	[bp+var_13E], 0
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_138], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8748C
		jmp	loc_8E250

loc_8748C:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	297Bh
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_8E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13C], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_13E], ax
		push	33h
		push	80h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_140], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_E8]
		mov	al, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13E]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_875F2
		jmp	loc_87671

loc_875F2:
		push	3
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	18h
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_120]
		push	ax
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFA4
		mov	word ptr [bp+var_142], ax
		mov	word ptr [bp+var_144], 0
		cmp	[bp+var_D22], 0
		jz	short loc_87671
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_142]
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_87671

loc_87671:
		cmp	[bp+var_10], 0
		jnz	short loc_8767A
		jmp	loc_8786D

loc_8767A:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		push	2
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	0
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_150], 0
		jmp	short loc_876E5

loc_876D4:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_876E5:
		cmp	word ptr [bp+var_150], 3
		jl	short loc_876D4
		jmp	loc_87778

loc_876EF:
		or	di, di
		jnz	short loc_87714
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_87714
		mov	di, 0FFFFh
		jmp	short loc_87725

loc_87714:
		cmp	di, 0FFFFh
		jnz	short loc_8771E
		mov	di, 1
		jmp	short loc_87725

loc_8771E:
		cmp	di, 1
		jnz	short loc_87725
		xor	di, di

loc_87725:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8776B
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8776B
		jmp	short loc_8778B

loc_8776B:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_87778:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_8778B
		jmp	loc_876EF

loc_8778B:
		mov	word ptr [bp+var_150], 0
		jmp	loc_87821

loc_87794:
		or	di, di
		jnz	short loc_877B9
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_877B9
		mov	di, 0FFFFh
		jmp	short loc_877CA

loc_877B9:
		cmp	di, 0FFFFh
		jnz	short loc_877C3
		mov	di, 1
		jmp	short loc_877CA

loc_877C3:
		cmp	di, 1
		jnz	short loc_877CA
		xor	di, di

loc_877CA:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_87810
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_87810
		jmp	short loc_8782B

loc_87810:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_87821:
		cmp	word ptr [bp+var_150], 8
		jge	short loc_8782B
		jmp	loc_87794

loc_8782B:
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_87853
		cmp	[bp+var_14E], 0
		jz	short loc_87853
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_87853

loc_87853:
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		jmp	loc_87981

loc_8786D:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 1Fh
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_87961

loc_878AC:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_878D9
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_878D9
		mov	di, 0FFFFh
		jmp	short loc_878EA

loc_878D9:
		cmp	di, 0FFFFh
		jnz	short loc_878E3
		mov	di, 1
		jmp	short loc_878EA

loc_878E3:
		cmp	di, 1
		jnz	short loc_878EA
		xor	di, di

loc_878EA:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_87905
		push	[bp+var_C]
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_87905:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8791F
		push	2981h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8791F:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_87938
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_87938:
		jmp	short loc_87954
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_87954
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_87981

loc_87954:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_87961:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_87971
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_87976

loc_87971:
		mov	ax, 1
		jmp	short loc_87978

loc_87976:
		xor	ax, ax

loc_87978:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_87981
		jmp	loc_878AC

loc_87981:
		cmp	[bp+var_11], 0
		jz	short loc_87994
		lea	ax, [bp+var_D22]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_87994:
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_879BC
		cmp	[bp+var_13A], 0
		jz	short loc_879BC
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_879BC

loc_879BC:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_879EC
		jmp	loc_8E250

loc_879EC:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	298Bh
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_98]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13C], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_13E], ax
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_140], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_F8]
		mov	al, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13E]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_87B52
		jmp	loc_87BD1

loc_87B52:
		push	3
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	5
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_12A]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF7E
		mov	word ptr [bp+var_142], ax
		mov	word ptr [bp+var_144], 0
		cmp	[bp+var_D30], 0
		jz	short loc_87BD1
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_142]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_87BD1

loc_87BD1:
		cmp	[bp+var_10], 0
		jnz	short loc_87BDA
		jmp	loc_88253

loc_87BDA:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		push	2
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	8
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_150], 0
		jmp	short loc_87C45

loc_87C34:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_87C45:
		cmp	word ptr [bp+var_150], 3
		jl	short loc_87C34
		mov	word ptr [bp+var_150], 0
		jmp	loc_87CF9

loc_87C55:
		mov	ax, word ptr [bp+var_150]
		inc	word ptr [bp+var_150]
		cmp	ax, 7
		jnz	short loc_87C70
		push	21h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_87C70:
		or	di, di
		jnz	short loc_87C95
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_87C95
		mov	di, 0FFFFh
		jmp	short loc_87CA6

loc_87C95:
		cmp	di, 0FFFFh
		jnz	short loc_87C9F
		mov	di, 1
		jmp	short loc_87CA6

loc_87C9F:
		cmp	di, 1
		jnz	short loc_87CA6
		xor	di, di

loc_87CA6:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_87CEC
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_87CEC
		jmp	short loc_87D0C

loc_87CEC:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_87CF9:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_87D0C
		jmp	loc_87C55

loc_87D0C:
		mov	word ptr [bp+var_150], 0
		jmp	loc_87DF6

loc_87D15:
		cmp	word ptr [bp+var_150], 0
		jnz	short loc_87D2A
		push	1Bh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_87D2A:
		cmp	word ptr [bp+var_150], 6
		jnz	short loc_87D3F
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_87D3F:
		cmp	word ptr [bp+var_150], 7
		jnz	short loc_87D54
		push	1Fh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_87D54:
		cmp	word ptr [bp+var_150], 8
		jnz	short loc_87D69
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_87D69:
		or	di, di
		jnz	short loc_87D8E
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_87D8E
		mov	di, 0FFFFh
		jmp	short loc_87D9F

loc_87D8E:
		cmp	di, 0FFFFh
		jnz	short loc_87D98
		mov	di, 1
		jmp	short loc_87D9F

loc_87D98:
		cmp	di, 1
		jnz	short loc_87D9F
		xor	di, di

loc_87D9F:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_87DE5
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_87DE5
		jmp	short loc_87E00

loc_87DE5:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_87DF6:
		cmp	word ptr [bp+var_150], 8
		jge	short loc_87E00
		jmp	loc_87D15

loc_87E00:
		mov	word ptr [bp+var_150], 0
		jmp	short loc_87E19

loc_87E08:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_87E19:
		cmp	word ptr [bp+var_150], 6
		jl	short loc_87E08
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_158+2], 2
		mov	byte ptr [bp+var_158+3], 0
		mov	[bp+var_154], 0
		push	2
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	9
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		jmp	loc_87EF1

loc_87E68:
		or	di, di
		jnz	short loc_87E8D
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_87E8D
		mov	di, 0FFFFh
		jmp	short loc_87E9E

loc_87E8D:
		cmp	di, 0FFFFh
		jnz	short loc_87E97
		mov	di, 1
		jmp	short loc_87E9E

loc_87E97:
		cmp	di, 1
		jnz	short loc_87E9E
		xor	di, di

loc_87E9E:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_87EE4
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_87EE4
		jmp	short loc_87F04

loc_87EE4:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_87EF1:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_87F04
		jmp	loc_87E68

loc_87F04:
		mov	word ptr [bp+var_150], 0
		jmp	loc_87FDA

loc_87F0D:
		cmp	word ptr [bp+var_150], 6
		jnz	short loc_87F22
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_87F22:
		cmp	word ptr [bp+var_150], 8
		jnz	short loc_87F38
		push	80h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_87F38:
		cmp	word ptr [bp+var_150], 9
		jnz	short loc_87F4D
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_87F4D:
		or	di, di
		jnz	short loc_87F72
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_87F72
		mov	di, 0FFFFh
		jmp	short loc_87F83

loc_87F72:
		cmp	di, 0FFFFh
		jnz	short loc_87F7C
		mov	di, 1
		jmp	short loc_87F83

loc_87F7C:
		cmp	di, 1
		jnz	short loc_87F83
		xor	di, di

loc_87F83:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_87FC9
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_87FC9
		jmp	short loc_87FE4

loc_87FC9:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_87FDA:
		cmp	word ptr [bp+var_150], 0Ah
		jge	short loc_87FE4
		jmp	loc_87F0D

loc_87FE4:
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160], 2
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_15E], 0
		push	2
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	0Ah
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		jmp	loc_880B5

loc_8802C:
		or	di, di
		jnz	short loc_88051
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_88051
		mov	di, 0FFFFh
		jmp	short loc_88062

loc_88051:
		cmp	di, 0FFFFh
		jnz	short loc_8805B
		mov	di, 1
		jmp	short loc_88062

loc_8805B:
		cmp	di, 1
		jnz	short loc_88062
		xor	di, di

loc_88062:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_880A8
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_880A8
		jmp	short loc_880C8

loc_880A8:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_880B5:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_880C8
		jmp	loc_8802C

loc_880C8:
		mov	word ptr [bp+var_150], 0
		jmp	loc_88189

loc_880D1:
		cmp	word ptr [bp+var_150], 5
		jnz	short loc_880E7
		push	80h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_880E7:
		cmp	word ptr [bp+var_150], 6
		jnz	short loc_880FC
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_880FC:
		or	di, di
		jnz	short loc_88121
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_88121
		mov	di, 0FFFFh
		jmp	short loc_88132

loc_88121:
		cmp	di, 0FFFFh
		jnz	short loc_8812B
		mov	di, 1
		jmp	short loc_88132

loc_8812B:
		cmp	di, 1
		jnz	short loc_88132
		xor	di, di

loc_88132:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_88178
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_88178
		jmp	short loc_88193

loc_88178:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_88189:
		cmp	word ptr [bp+var_150], 8
		jge	short loc_88193
		jmp	loc_880D1

loc_88193:
		cmp	byte ptr [bp+var_160+1], 0
		jz	short loc_881BB
		cmp	[bp+var_164], 0
		jz	short loc_881BB
		push	0
		mov	al, byte ptr [bp+var_160]
		push	ax
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_881BB

loc_881BB:
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_15E], 0
		cmp	byte ptr [bp+var_158+3], 0
		jz	short loc_881FA
		cmp	[bp+var_15A], 0
		jz	short loc_881FA
		push	0
		mov	al, byte ptr [bp+var_158+2]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_881FA

loc_881FA:
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_158+3], 0
		mov	[bp+var_154], 0
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_88239
		cmp	[bp+var_14E], 0
		jz	short loc_88239
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_88239

loc_88239:
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		jmp	loc_88754

loc_88253:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 4Dh
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_88443

loc_88292:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_882BF
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_882BF
		mov	di, 0FFFFh
		jmp	short loc_882D0

loc_882BF:
		cmp	di, 0FFFFh
		jnz	short loc_882C9
		mov	di, 1
		jmp	short loc_882D0

loc_882C9:
		cmp	di, 1
		jnz	short loc_882D0
		xor	di, di

loc_882D0:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_88328
		mov	ax, [bp+var_C]
		add	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_88328:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_88342
		push	298Fh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_88342:
		mov	ax, si
		add	ax, 7
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8835B
		push	21h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8835B:
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8837E
		mov	ax, [bp+var_E]
		shl	ax, 1
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8837E:
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_88398
		push	2995h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_88398:
		mov	ax, si
		add	ax, 1Ch
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_883B1
		push	1Bh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_883B1:
		mov	ax, [bp+var_8]
		add	ax, 0FFFCh
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_883CC
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_883CC:
		mov	ax, [bp+var_8]
		add	ax, 0FFF8h
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_883E6
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_883E6:
		mov	ax, [bp+var_8]
		add	ax, 0FFF9h
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_88400
		push	1Fh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_88400:
		mov	ax, [bp+var_8]
		add	ax, 0FFFAh
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8841A
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8841A:
		jmp	short loc_88436
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_88436
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_88463

loc_88436:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_88443:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_88453
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_88458

loc_88453:
		mov	ax, 1
		jmp	short loc_8845A

loc_88458:
		xor	ax, ax

loc_8845A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_88463
		jmp	loc_88292

loc_88463:
		mov	[bp+var_A], 16h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_885C9

loc_88484:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_884B1
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_884B1
		mov	di, 0FFFFh
		jmp	short loc_884C2

loc_884B1:
		cmp	di, 0FFFFh
		jnz	short loc_884BB
		mov	di, 1
		jmp	short loc_884C2

loc_884BB:
		cmp	di, 1
		jnz	short loc_884C2
		xor	di, di

loc_884C2:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_88514
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_88514:
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8852E
		push	80h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8852E:
		mov	ax, si
		add	ax, 9
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_88547
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_88547:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8856D
		mov	ax, [bp+var_E]
		shl	ax, 1
		add	ax, [bp+var_E]
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8856D:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_88587
		push	29A1h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_88587:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_885A0
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_885A0:
		jmp	short loc_885BC
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_885BC
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_885E9

loc_885BC:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_885C9:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_885D9
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_885DE

loc_885D9:
		mov	ax, 1
		jmp	short loc_885E0

loc_885DE:
		xor	ax, ax

loc_885E0:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_885E9
		jmp	loc_88484

loc_885E9:
		mov	[bp+var_A], 2Dh
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_88734

loc_8860A:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_88637
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_88637
		mov	di, 0FFFFh
		jmp	short loc_88648

loc_88637:
		cmp	di, 0FFFFh
		jnz	short loc_88641
		mov	di, 1
		jmp	short loc_88648

loc_88641:
		cmp	di, 1
		jnz	short loc_88648
		xor	di, di

loc_88648:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8869B
		push	80h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8869B:
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_886B4
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_886B4:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_886D8
		mov	ax, [bp+var_E]
		shl	ax, 2
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_886D8:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_886F2
		push	29ABh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_886F2:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8870B
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8870B:
		jmp	short loc_88727
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_88727
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_88754

loc_88727:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_88734:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_88744
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_88749

loc_88744:
		mov	ax, 1
		jmp	short loc_8874B

loc_88749:
		xor	ax, ax

loc_8874B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_88754
		jmp	loc_8860A

loc_88754:
		cmp	[bp+var_11], 0
		jz	short loc_88767
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_88767:
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_8878F
		cmp	[bp+var_13A], 0
		jz	short loc_8878F
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8878F

loc_8878F:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_887BF
		jmp	loc_8E250

loc_887BF:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	di, ax
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_84]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132], ax
		push	1
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_134], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_B8]
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_134]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0C4h
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	word ptr [bp+var_138+2], 0
		mov	word ptr [bp+var_138], 3
		mov	word ptr [bp+var_13A], 2
		mov	word ptr [bp+var_13C], 2
		mov	word ptr [bp+var_13E], 0
		cmp	[bp+var_11], 0
		jnz	short loc_8890D
		jmp	loc_8898F

loc_8890D:
		push	3
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	5
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_12A]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF7E
		add	ax, 0FFCEh
		mov	word ptr [bp+var_140], ax
		mov	word ptr [bp+var_142], 0
		cmp	[bp+var_D30], 0
		jz	short loc_8898F
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_142]
		push	word ptr [bp+var_140]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8898F

loc_8898F:
		cmp	[bp+var_10], 0
		jnz	short loc_88998
		jmp	loc_88BC8

loc_88998:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_14C], 0
		mov	byte ptr [bp+var_148], 2
		mov	byte ptr [bp+var_148+1], 0
		mov	[bp+var_146], 0
		push	2
		lea	ax, word ptr [bp+var_14C]
		push	ax
		push	0Bh
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_14C]
		push	ax
		lea	ax, [bp+var_CDA]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		mov	word ptr [bp+var_14E], 0
		jmp	short loc_88A02

loc_889F1:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_14E]

loc_88A02:
		cmp	word ptr [bp+var_14E], 4
		jl	short loc_889F1
		push	0FFFFh
		lea	ax, [bp+var_CDA]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		mov	word ptr [bp+var_14E], 0
		jmp	loc_88B3C

loc_88A21:
		mov	ax, word ptr [bp+var_13A]
		cmp	ax, word ptr [bp+var_13C]
		jnz	short loc_88A8C
		mov	ax, word ptr [bp+var_14E]
		inc	word ptr [bp+var_14E]
		test	ax, 1
		jz	short loc_88A62
		mov	ax, word ptr [bp+var_138]
		mov	word ptr [bp+var_150], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_150]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_13C], ax

loc_88A62:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jge	short loc_88A74
		mov	word ptr [bp+var_138+2], 0FFFFh
		jmp	short loc_88A8C

loc_88A74:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jnz	short loc_88A86
		mov	word ptr [bp+var_138+2], 0
		jmp	short loc_88A8C

loc_88A86:
		mov	word ptr [bp+var_138+2], 1

loc_88A8C:
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_132]
		mov	bx, word ptr [bp+var_132]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, word ptr [bp+var_13E]
		inc	word ptr [bp+var_13E]
		cmp	ax, 1
		jnz	short loc_88AD2
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_88AD2:
		cmp	word ptr [bp+var_13E], 5
		jnz	short loc_88AE6
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_88AE6:
		cmp	word ptr [bp+var_13E], 8
		jnz	short loc_88AF3
		mov	word ptr [bp+var_13E], 0

loc_88AF3:
		mov	ax, word ptr [bp+var_138+2]
		add	word ptr [bp+var_13A], ax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_152], ax
		mov	bx, word ptr [bp+var_134]
		mov	ax, word ptr [bp+var_152]
		mov	[bx+1Bh], ax
		jmp	short loc_88B2F
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_88B2F
		jmp	short loc_88B50

loc_88B2F:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_88B3C:
		lea	ax, [bp+var_CDA]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jz	short loc_88B50
		jmp	loc_88A21

loc_88B50:
		mov	bx, word ptr [bp+var_134]
		mov	word ptr [bx+1Bh], 0
		mov	word ptr [bp+var_14E], 0
		jmp	short loc_88B72

loc_88B61:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_14E]

loc_88B72:
		cmp	word ptr [bp+var_14E], 4
		jl	short loc_88B61
		lea	ax, [bp+var_CDA]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_148+1], 0
		jz	short loc_88BAE
		cmp	[bp+var_14C], 0
		jz	short loc_88BAE
		push	0
		mov	al, byte ptr [bp+var_148]
		push	ax
		lea	ax, word ptr [bp+var_14C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_88BAE

loc_88BAE:
		mov	[bp+var_14C], 0
		mov	byte ptr [bp+var_148+1], 0
		mov	[bp+var_146], 0
		jmp	loc_88D7F

loc_88BC8:
		mov	[bp+var_A], 28h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_88D5F

loc_88BE9:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_144], ax
		mov	ax, word ptr [bp+var_13A]
		cmp	ax, word ptr [bp+var_13C]
		jnz	short loc_88C57
		test	word ptr [bp+var_144], 1
		jz	short loc_88C2D
		mov	ax, word ptr [bp+var_138]
		mov	word ptr [bp+var_146], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_146]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_13C], ax

loc_88C2D:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jge	short loc_88C3F
		mov	word ptr [bp+var_138+2], 0FFFFh
		jmp	short loc_88C57

loc_88C3F:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jnz	short loc_88C51
		mov	word ptr [bp+var_138+2], 0
		jmp	short loc_88C57

loc_88C51:
		mov	word ptr [bp+var_138+2], 1

loc_88C57:
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_132]
		mov	bx, word ptr [bp+var_132]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, word ptr [bp+var_13E]
		inc	word ptr [bp+var_13E]
		cmp	ax, 1
		jnz	short loc_88C9D
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_88C9D:
		cmp	word ptr [bp+var_13E], 5
		jnz	short loc_88CB1
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_88CB1:
		cmp	word ptr [bp+var_13E], 8
		jnz	short loc_88CBE
		mov	word ptr [bp+var_13E], 0

loc_88CBE:
		mov	ax, word ptr [bp+var_138+2]
		add	word ptr [bp+var_13A], ax
		cmp	word ptr [bp+var_144], 2
		jnz	short loc_88CE8
		mov	ax, [bp+var_E]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_88CE8:
		cmp	word ptr [bp+var_144], 2
		jle	short loc_88D1D
		cmp	word ptr [bp+var_144], 14h
		jge	short loc_88D1D
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_148], ax
		mov	bx, word ptr [bp+var_134]
		mov	ax, word ptr [bp+var_148]
		mov	[bx+1Bh], ax

loc_88D1D:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_144]
		jnz	short loc_88D36
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_88D36:
		jmp	short loc_88D52
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_88D52
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_88D7F

loc_88D52:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_88D5F:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_88D6F
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_88D74

loc_88D6F:
		mov	ax, 1
		jmp	short loc_88D76

loc_88D74:
		xor	ax, ax

loc_88D76:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_88D7F
		jmp	loc_88BE9

loc_88D7F:
		cmp	[bp+var_11], 0
		jz	short loc_88D92
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_88D92:
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_88DAB
		jmp	loc_8E250

loc_88DAB:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	29D1h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_8E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13C], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_13E], ax
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_140], ax
		mov	bx, word ptr [bp+var_13E]
		mov	byte ptr [bx+2Fh], 0
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_E8]
		mov	al, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13E]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	21h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_88F27
		jmp	loc_88FA6

loc_88F27:
		push	3
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	18h
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_120]
		push	ax
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFA4
		mov	word ptr [bp+var_142], ax
		mov	word ptr [bp+var_144], 0
		cmp	[bp+var_D22], 0
		jz	short loc_88FA6
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_142]
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_88FA6

loc_88FA6:
		cmp	[bp+var_10], 0
		jnz	short loc_88FAF
		jmp	loc_891A2

loc_88FAF:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		push	2
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	1
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_150], 0
		jmp	short loc_8901A

loc_89009:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_8901A:
		cmp	word ptr [bp+var_150], 3
		jl	short loc_89009
		jmp	loc_890AD

loc_89024:
		or	di, di
		jnz	short loc_89049
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_89049
		mov	di, 0FFFFh
		jmp	short loc_8905A

loc_89049:
		cmp	di, 0FFFFh
		jnz	short loc_89053
		mov	di, 1
		jmp	short loc_8905A

loc_89053:
		cmp	di, 1
		jnz	short loc_8905A
		xor	di, di

loc_8905A:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_890A0
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_890A0
		jmp	short loc_890C0

loc_890A0:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_890AD:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_890C0
		jmp	loc_89024

loc_890C0:
		mov	word ptr [bp+var_150], 0
		jmp	loc_89156

loc_890C9:
		or	di, di
		jnz	short loc_890EE
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_890EE
		mov	di, 0FFFFh
		jmp	short loc_890FF

loc_890EE:
		cmp	di, 0FFFFh
		jnz	short loc_890F8
		mov	di, 1
		jmp	short loc_890FF

loc_890F8:
		cmp	di, 1
		jnz	short loc_890FF
		xor	di, di

loc_890FF:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_89145
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_89145
		jmp	short loc_89160

loc_89145:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_89156:
		cmp	word ptr [bp+var_150], 4
		jge	short loc_89160
		jmp	loc_890C9

loc_89160:
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_89188
		cmp	[bp+var_14E], 0
		jz	short loc_89188
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_89188

loc_89188:
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		jmp	loc_892FA

loc_891A2:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 46h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_892DA

loc_891E1:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8920E
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8920E
		mov	di, 0FFFFh
		jmp	short loc_8921F

loc_8920E:
		cmp	di, 0FFFFh
		jnz	short loc_89218
		mov	di, 1
		jmp	short loc_8921F

loc_89218:
		cmp	di, 1
		jnz	short loc_8921F
		xor	di, di

loc_8921F:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 4
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8927E
		mov	ax, [bp+var_E]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8927E:
		mov	ax, si
		add	ax, 4
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_89298
		push	29D7h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_89298:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_892B1
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_892B1:
		jmp	short loc_892CD
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_892CD
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_892FA

loc_892CD:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_892DA:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_892EA
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_892EF

loc_892EA:
		mov	ax, 1
		jmp	short loc_892F1

loc_892EF:
		xor	ax, ax

loc_892F1:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_892FA
		jmp	loc_891E1

loc_892FA:
		cmp	[bp+var_11], 0
		jz	short loc_8930D
		lea	ax, [bp+var_D22]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_8930D:
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_89335
		cmp	[bp+var_13A], 0
		jz	short loc_89335
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_89335

loc_89335:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_89365
		jmp	loc_8E250

loc_89365:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	29F3h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_98]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13C], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_13E], ax
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_140], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_F8]
		mov	al, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13E]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_894CB
		jmp	loc_8954A

loc_894CB:
		push	3
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	5
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_12A]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF7E
		mov	word ptr [bp+var_142], ax
		mov	word ptr [bp+var_144], 0
		cmp	[bp+var_D30], 0
		jz	short loc_8954A
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_142]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8954A

loc_8954A:
		mov	[bp+var_A], 20h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_89647

loc_8956B:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_89598
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_89598
		mov	di, 0FFFFh
		jmp	short loc_895A9

loc_89598:
		cmp	di, 0FFFFh
		jnz	short loc_895A2
		mov	di, 1
		jmp	short loc_895A9

loc_895A2:
		cmp	di, 1
		jnz	short loc_895A9
		xor	di, di

loc_895A9:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_895FB
		push	12h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_895FB:
		mov	ax, si
		add	ax, 9
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_89614
		push	19h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_89614:
		mov	ax, si
		add	ax, 0Bh
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8962D
		push	1Fh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8962D:
		jmp	short loc_8963A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8963A
		jmp	short loc_89667

loc_8963A:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_89647:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_89657
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8965C

loc_89657:
		mov	ax, 1
		jmp	short loc_8965E

loc_8965C:
		xor	ax, ax

loc_8965E:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_89667
		jmp	loc_8956B

loc_89667:
		cmp	[bp+var_11], 0
		jz	short loc_8967A
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_8967A:
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_896A2
		cmp	[bp+var_13A], 0
		jz	short loc_896A2
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_896A2

loc_896A2:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_896D2
		jmp	loc_8E250

loc_896D2:
		mov	[bp+var_138], 0
		mov	byte ptr [bp+var_134], 2
		mov	byte ptr [bp+var_134+1], 0
		mov	[bp+var_132], 0
		mov	[bp+var_D3A], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D38], ax
		lea	ax, [bp+var_D3A]
		mov	word_4D392, ax
		mov	[bp+var_D3A], 1BCh
		mov	[bp+var_D36], 0
		mov	[bp+var_D32], 0
		mov	[bp+var_D3E], 0
		mov	[bp+var_D3C], 0FFFFh
		cmp	[bp+var_11], 0
		jnz	short loc_8972B
		jmp	loc_897AA

loc_8972B:
		push	3
		lea	ax, word ptr [bp+var_138]
		push	ax
		push	61h
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D3E]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_138]
		push	ax
		lea	ax, [bp+var_D3E]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4F036
		mov	word ptr [bp+var_13A], ax
		mov	word ptr [bp+var_13C], 0
		cmp	[bp+var_D3E], 0
		jz	short loc_897AA
		push	[bp+var_D3C]
		mov	bx, [bp+var_D3E]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_13C]
		push	word ptr [bp+var_13A]
		push	[bp+var_D3C]
		mov	bx, [bp+var_D3E]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_897AA

loc_897AA:
		mov	[bp+var_146], 0
		mov	byte ptr [bp+var_142], 2
		mov	byte ptr [bp+var_142+1], 0
		mov	[bp+var_140], 0
		push	3
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	6
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14C], 2
		mov	byte ptr [bp+var_14C+1], 0
		mov	[bp+var_14A], 0
		push	3
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	0Ah
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_152], ax
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_154], ax
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_158+2], ax
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	di, ax
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_158], ax
		push	[bp+var_C8]
		mov	al, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_152]
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_158+2]
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_154]
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_158]
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0FEh
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	word ptr [bp+var_15A], 0
		mov	word ptr [bp+var_15E+2], 0
		mov	word ptr [bp+var_15E], 0
		mov	word ptr [bp+var_160], 0
		mov	[bp+var_A], 34h
		mov	si, [bp+var_D43]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_89AB3

loc_89994:
		mov	ax, [bp+var_D43]
		mov	word ptr [bp+var_164+2], ax
		mov	ax, word ptr [bp+var_15A]
		mov	word ptr [bp+var_164], ax
		mov	bx, word ptr [bp+var_158+2]
		mov	ax, word ptr [bp+var_164]
		mov	[bx+1Bh], ax
		inc	word ptr [bp+var_15A]
		mov	ax, word ptr [bp+var_15A]
		cmp	ax, 1Eh
		jle	short loc_899C2
		mov	word ptr [bp+var_15A], 0

loc_899C2:
		mov	ax, word ptr [bp+var_15E+2]
		mov	word ptr [bp+var_166], ax
		mov	bx, word ptr [bp+var_154]
		mov	ax, word ptr [bp+var_166]
		mov	[bx+1Bh], ax
		inc	word ptr [bp+var_15E+2]
		mov	ax, word ptr [bp+var_15E+2]
		cmp	ax, 1Ah
		jle	short loc_899E8
		mov	word ptr [bp+var_15E+2], 0

loc_899E8:
		mov	ax, [bp+var_8]
		add	ax, 0FFDDh
		cmp	ax, word ptr [bp+var_164+2]
		jge	short loc_89A23
		inc	word ptr [bp+var_15E]
		mov	ax, word ptr [bp+var_15E]
		cmp	ax, 1Bh
		jle	short loc_89A14
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	word ptr [bp+var_15E], 1Bh

loc_89A14:
		mov	ax, word ptr [bp+var_15E]
		mov	[bp+var_168], ax
		mov	ax, [bp+var_168]
		mov	[di+1Bh], ax

loc_89A23:
		mov	ax, [bp+var_8]
		add	ax, 0FFE9h
		cmp	ax, word ptr [bp+var_164+2]
		jge	short loc_89A71
		inc	word ptr [bp+var_160]
		mov	ax, word ptr [bp+var_160]
		cmp	ax, 0Fh
		jle	short loc_89A5E
		test	word ptr [bp+var_164+2], 1
		jz	short loc_89A58
		push	0
		push	1
		push	word ptr [bp+var_158]
		mov	bx, word ptr [bp+var_158]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_89A58:
		mov	word ptr [bp+var_160], 0Fh

loc_89A5E:
		mov	ax, word ptr [bp+var_160]
		mov	[bp+var_16A], ax
		mov	bx, word ptr [bp+var_158]
		mov	ax, [bp+var_16A]
		mov	[bx+1Bh], ax

loc_89A71:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_164+2]
		jnz	short loc_89A8A
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_89A8A:
		jmp	short loc_89AA6
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_89AA6
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_89AD3

loc_89AA6:
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_89AB3:
		mov	ax, [bp+var_D43]
		cmp	ax, [bp+var_8]
		jnb	short loc_89AC3
		cmp	[bp+var_D41], 0
		jz	short loc_89AC8

loc_89AC3:
		mov	ax, 1
		jmp	short loc_89ACA

loc_89AC8:
		xor	ax, ax

loc_89ACA:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_89AD3
		jmp	loc_89994

loc_89AD3:
		push	0
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_14C+1], 0
		jz	short loc_89B0A
		cmp	[bp+var_150], 0
		jz	short loc_89B0A
		push	0
		mov	al, byte ptr [bp+var_14C]
		push	ax
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_89B0A

loc_89B0A:
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14C+1], 0
		mov	[bp+var_14A], 0
		cmp	byte ptr [bp+var_142+1], 0
		jz	short loc_89B49
		cmp	[bp+var_146], 0
		jz	short loc_89B49
		push	0
		mov	al, byte ptr [bp+var_142]
		push	ax
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_89B49

loc_89B49:
		mov	[bp+var_146], 0
		mov	byte ptr [bp+var_142+1], 0
		mov	[bp+var_140], 0
		lea	ax, [bp+var_D3E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D3A]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_134+1], 0
		jz	short loc_89BA4
		cmp	[bp+var_138], 0
		jz	short loc_89BA4
		push	0
		mov	al, byte ptr [bp+var_134]
		push	ax
		lea	ax, word ptr [bp+var_138]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_89BA4

loc_89BA4:
		mov	[bp+var_138], 0
		mov	byte ptr [bp+var_134+1], 0
		mov	[bp+var_132], 0
		cmp	byte_4F55C, 0
		jz	short loc_89BC5
		jmp	loc_8E250

loc_89BC5:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	29F7h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_8E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13C], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_13E], ax
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_140], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_E8]
		mov	al, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13E]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0Eh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_89D39
		jmp	loc_89DB8

loc_89D39:
		push	3
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	18h
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_120]
		push	ax
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFA4
		mov	word ptr [bp+var_142], ax
		mov	word ptr [bp+var_144], 0
		cmp	[bp+var_D22], 0
		jz	short loc_89DB8
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_142]
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_89DB8

loc_89DB8:
		cmp	[bp+var_10], 0
		jnz	short loc_89DC1
		jmp	loc_89FB4

loc_89DC1:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		push	2
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	2
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_150], 0
		jmp	short loc_89E2C

loc_89E1B:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_89E2C:
		cmp	word ptr [bp+var_150], 3
		jl	short loc_89E1B
		jmp	loc_89EBF

loc_89E36:
		or	di, di
		jnz	short loc_89E5B
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_89E5B
		mov	di, 0FFFFh
		jmp	short loc_89E6C

loc_89E5B:
		cmp	di, 0FFFFh
		jnz	short loc_89E65
		mov	di, 1
		jmp	short loc_89E6C

loc_89E65:
		cmp	di, 1
		jnz	short loc_89E6C
		xor	di, di

loc_89E6C:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_89EB2
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_89EB2
		jmp	short loc_89ED2

loc_89EB2:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_89EBF:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_89ED2
		jmp	loc_89E36

loc_89ED2:
		mov	word ptr [bp+var_150], 0
		jmp	loc_89F68

loc_89EDB:
		or	di, di
		jnz	short loc_89F00
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_89F00
		mov	di, 0FFFFh
		jmp	short loc_89F11

loc_89F00:
		cmp	di, 0FFFFh
		jnz	short loc_89F0A
		mov	di, 1
		jmp	short loc_89F11

loc_89F0A:
		cmp	di, 1
		jnz	short loc_89F11
		xor	di, di

loc_89F11:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_89F57
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_89F57
		jmp	short loc_89F72

loc_89F57:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_89F68:
		cmp	word ptr [bp+var_150], 8
		jge	short loc_89F72
		jmp	loc_89EDB

loc_89F72:
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_89F9A
		cmp	[bp+var_14E], 0
		jz	short loc_89F9A
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_89F9A

loc_89F9A:
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		jmp	loc_8A345

loc_89FB4:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 2Fh
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8A0EC

loc_89FF3:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8A020
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8A020
		mov	di, 0FFFFh
		jmp	short loc_8A031

loc_8A020:
		cmp	di, 0FFFFh
		jnz	short loc_8A02A
		mov	di, 1
		jmp	short loc_8A031

loc_8A02A:
		cmp	di, 1
		jnz	short loc_8A031
		xor	di, di

loc_8A031:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A090
		mov	ax, [bp+var_E]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8A090:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A0AA
		push	29FDh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8A0AA:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A0C3
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8A0C3:
		jmp	short loc_8A0DF
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8A0DF
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8A10C

loc_8A0DF:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8A0EC:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8A0FC
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8A101

loc_8A0FC:
		mov	ax, 1
		jmp	short loc_8A103

loc_8A101:
		xor	ax, ax

loc_8A103:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A10C
		jmp	loc_89FF3

loc_8A10C:
		mov	[bp+var_A], 37h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8A224

loc_8A12D:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8A15A
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8A15A
		mov	di, 0FFFFh
		jmp	short loc_8A16B

loc_8A15A:
		cmp	di, 0FFFFh
		jnz	short loc_8A164
		mov	di, 1
		jmp	short loc_8A16B

loc_8A164:
		cmp	di, 1
		jnz	short loc_8A16B
		xor	di, di

loc_8A16B:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A1C8
		mov	ax, [bp+var_E]
		shl	ax, 3
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8A1C8:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A1E2
		push	2A09h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8A1E2:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A1FB
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8A1FB:
		jmp	short loc_8A217
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8A217
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8A244

loc_8A217:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8A224:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8A234
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8A239

loc_8A234:
		mov	ax, 1
		jmp	short loc_8A23B

loc_8A239:
		xor	ax, ax

loc_8A23B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A244
		jmp	loc_8A12D

loc_8A244:
		mov	[bp+var_A], 32h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8A325

loc_8A265:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8A292
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8A292
		mov	di, 0FFFFh
		jmp	short loc_8A2A3

loc_8A292:
		cmp	di, 0FFFFh
		jnz	short loc_8A29C
		mov	di, 1
		jmp	short loc_8A2A3

loc_8A29C:
		cmp	di, 1
		jnz	short loc_8A2A3
		xor	di, di

loc_8A2A3:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A2C9
		mov	ax, [bp+var_E]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8A2C9:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A2E3
		push	2A24h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8A2E3:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A2FC
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8A2FC:
		jmp	short loc_8A318
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8A318
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8A345

loc_8A318:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8A325:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8A335
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8A33A

loc_8A335:
		mov	ax, 1
		jmp	short loc_8A33C

loc_8A33A:
		xor	ax, ax

loc_8A33C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A345
		jmp	loc_8A265

loc_8A345:
		cmp	[bp+var_11], 0
		jz	short loc_8A358
		lea	ax, [bp+var_D22]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_8A358:
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_8A380
		cmp	[bp+var_13A], 0
		jz	short loc_8A380
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8A380

loc_8A380:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8A3B0
		jmp	loc_8E250

loc_8A3B0:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFBDh
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	2A36h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_98]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13C], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_13E], ax
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_140], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_F8]
		mov	al, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13E]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	19h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_8A524
		jmp	loc_8A5A3

loc_8A524:
		push	3
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	5
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_12A]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF7E
		mov	word ptr [bp+var_142], ax
		mov	word ptr [bp+var_144], 0
		cmp	[bp+var_D30], 0
		jz	short loc_8A5A3
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_142]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8A5A3

loc_8A5A3:
		cmp	[bp+var_10], 0
		jnz	short loc_8A5AC
		jmp	loc_8A79F

loc_8A5AC:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		push	2
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	0Ch
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_150], 0
		jmp	short loc_8A617

loc_8A606:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_8A617:
		cmp	word ptr [bp+var_150], 3
		jl	short loc_8A606
		jmp	loc_8A6AA

loc_8A621:
		or	di, di
		jnz	short loc_8A646
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8A646
		mov	di, 0FFFFh
		jmp	short loc_8A657

loc_8A646:
		cmp	di, 0FFFFh
		jnz	short loc_8A650
		mov	di, 1
		jmp	short loc_8A657

loc_8A650:
		cmp	di, 1
		jnz	short loc_8A657
		xor	di, di

loc_8A657:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8A69D
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8A69D
		jmp	short loc_8A6BD

loc_8A69D:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8A6AA:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_8A6BD
		jmp	loc_8A621

loc_8A6BD:
		mov	word ptr [bp+var_150], 0
		jmp	loc_8A753

loc_8A6C6:
		or	di, di
		jnz	short loc_8A6EB
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8A6EB
		mov	di, 0FFFFh
		jmp	short loc_8A6FC

loc_8A6EB:
		cmp	di, 0FFFFh
		jnz	short loc_8A6F5
		mov	di, 1
		jmp	short loc_8A6FC

loc_8A6F5:
		cmp	di, 1
		jnz	short loc_8A6FC
		xor	di, di

loc_8A6FC:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8A742
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8A742
		jmp	short loc_8A75D

loc_8A742:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_8A753:
		cmp	word ptr [bp+var_150], 8
		jge	short loc_8A75D
		jmp	loc_8A6C6

loc_8A75D:
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_8A785
		cmp	[bp+var_14E], 0
		jz	short loc_8A785
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8A785

loc_8A785:
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		jmp	loc_8A8F7

loc_8A79F:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 2Dh
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8A8D7

loc_8A7DE:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8A80B
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8A80B
		mov	di, 0FFFFh
		jmp	short loc_8A81C

loc_8A80B:
		cmp	di, 0FFFFh
		jnz	short loc_8A815
		mov	di, 1
		jmp	short loc_8A81C

loc_8A815:
		cmp	di, 1
		jnz	short loc_8A81C
		xor	di, di

loc_8A81C:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A87B
		mov	ax, [bp+var_E]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8A87B:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A895
		push	2A3Ah
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8A895:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8A8AE
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8A8AE:
		jmp	short loc_8A8CA
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8A8CA
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8A8F7

loc_8A8CA:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8A8D7:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8A8E7
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8A8EC

loc_8A8E7:
		mov	ax, 1
		jmp	short loc_8A8EE

loc_8A8EC:
		xor	ax, ax

loc_8A8EE:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A8F7
		jmp	loc_8A7DE

loc_8A8F7:
		cmp	[bp+var_11], 0
		jz	short loc_8A90A
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_8A90A:
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_8A932
		cmp	[bp+var_13A], 0
		jz	short loc_8A932
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8A932

loc_8A932:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8A962
		jmp	loc_8E250

loc_8A962:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	2A4Ch
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_8E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13C], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_13E], ax
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_140], ax
		mov	bx, word ptr [bp+var_13E]
		mov	byte ptr [bx+2Fh], 0
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_E8]
		mov	al, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13E]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_8AAD0
		jmp	loc_8AB4F

loc_8AAD0:
		push	3
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	18h
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_120]
		push	ax
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFA4
		mov	word ptr [bp+var_142], ax
		mov	word ptr [bp+var_144], 0
		cmp	[bp+var_D22], 0
		jz	short loc_8AB4F
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_142]
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8AB4F

loc_8AB4F:
		cmp	[bp+var_10], 0
		jnz	short loc_8AB58
		jmp	loc_8AD4B

loc_8AB58:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		push	2
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	3
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_150], 0
		jmp	short loc_8ABC3

loc_8ABB2:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_8ABC3:
		cmp	word ptr [bp+var_150], 3
		jl	short loc_8ABB2
		jmp	loc_8AC56

loc_8ABCD:
		or	di, di
		jnz	short loc_8ABF2
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8ABF2
		mov	di, 0FFFFh
		jmp	short loc_8AC03

loc_8ABF2:
		cmp	di, 0FFFFh
		jnz	short loc_8ABFC
		mov	di, 1
		jmp	short loc_8AC03

loc_8ABFC:
		cmp	di, 1
		jnz	short loc_8AC03
		xor	di, di

loc_8AC03:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8AC49
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8AC49
		jmp	short loc_8AC69

loc_8AC49:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8AC56:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_8AC69
		jmp	loc_8ABCD

loc_8AC69:
		mov	word ptr [bp+var_150], 0
		jmp	loc_8ACFF

loc_8AC72:
		or	di, di
		jnz	short loc_8AC97
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8AC97
		mov	di, 0FFFFh
		jmp	short loc_8ACA8

loc_8AC97:
		cmp	di, 0FFFFh
		jnz	short loc_8ACA1
		mov	di, 1
		jmp	short loc_8ACA8

loc_8ACA1:
		cmp	di, 1
		jnz	short loc_8ACA8
		xor	di, di

loc_8ACA8:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8ACEE
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8ACEE
		jmp	short loc_8AD09

loc_8ACEE:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_8ACFF:
		cmp	word ptr [bp+var_150], 3
		jge	short loc_8AD09
		jmp	loc_8AC72

loc_8AD09:
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_8AD31
		cmp	[bp+var_14E], 0
		jz	short loc_8AD31
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8AD31

loc_8AD31:
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		jmp	loc_8B117

loc_8AD4B:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 3Ch
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8AE83

loc_8AD8A:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8ADB7
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8ADB7
		mov	di, 0FFFFh
		jmp	short loc_8ADC8

loc_8ADB7:
		cmp	di, 0FFFFh
		jnz	short loc_8ADC1
		mov	di, 1
		jmp	short loc_8ADC8

loc_8ADC1:
		cmp	di, 1
		jnz	short loc_8ADC8
		xor	di, di

loc_8ADC8:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8AE27
		mov	ax, [bp+var_E]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8AE27:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8AE41
		push	2A52h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8AE41:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8AE5A
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8AE5A:
		jmp	short loc_8AE76
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8AE76
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8AEA3

loc_8AE76:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8AE83:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8AE93
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8AE98

loc_8AE93:
		mov	ax, 1
		jmp	short loc_8AE9A

loc_8AE98:
		xor	ax, ax

loc_8AE9A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8AEA3
		jmp	loc_8AD8A

loc_8AEA3:
		mov	[bp+var_A], 3Ah
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8AFBD

loc_8AEC4:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8AEF1
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8AEF1
		mov	di, 0FFFFh
		jmp	short loc_8AF02

loc_8AEF1:
		cmp	di, 0FFFFh
		jnz	short loc_8AEFB
		mov	di, 1
		jmp	short loc_8AF02

loc_8AEFB:
		cmp	di, 1
		jnz	short loc_8AF02
		xor	di, di

loc_8AF02:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8AF61
		mov	ax, [bp+var_E]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8AF61:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8AF7B
		push	2A6Ah
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8AF7B:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8AF94
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8AF94:
		jmp	short loc_8AFB0
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8AFB0
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8AFDD

loc_8AFB0:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8AFBD:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8AFCD
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8AFD2

loc_8AFCD:
		mov	ax, 1
		jmp	short loc_8AFD4

loc_8AFD2:
		xor	ax, ax

loc_8AFD4:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8AFDD
		jmp	loc_8AEC4

loc_8AFDD:
		mov	[bp+var_A], 5Ah
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8B0F7

loc_8AFFE:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8B02B
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8B02B
		mov	di, 0FFFFh
		jmp	short loc_8B03C

loc_8B02B:
		cmp	di, 0FFFFh
		jnz	short loc_8B035
		mov	di, 1
		jmp	short loc_8B03C

loc_8B035:
		cmp	di, 1
		jnz	short loc_8B03C
		xor	di, di

loc_8B03C:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8B09B
		mov	ax, [bp+var_E]
		mov	dx, 0Dh
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8B09B:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8B0B5
		push	2A87h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8B0B5:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8B0CE
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8B0CE:
		jmp	short loc_8B0EA
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8B0EA
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8B117

loc_8B0EA:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8B0F7:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8B107
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8B10C

loc_8B107:
		mov	ax, 1
		jmp	short loc_8B10E

loc_8B10C:
		xor	ax, ax

loc_8B10E:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8B117
		jmp	loc_8AFFE

loc_8B117:
		cmp	[bp+var_11], 0
		jz	short loc_8B12A
		lea	ax, [bp+var_D22]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_8B12A:
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_8B152
		cmp	[bp+var_13A], 0
		jz	short loc_8B152
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8B152

loc_8B152:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8B182
		jmp	loc_8E250

loc_8B182:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFD1h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	di, ax
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_84]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132], ax
		push	1
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_134], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_B8]
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_134]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	word ptr [bp+var_138+2], 0
		mov	word ptr [bp+var_138], 3
		mov	word ptr [bp+var_13A], 2
		mov	word ptr [bp+var_13C], 2
		mov	word ptr [bp+var_13E], 0
		cmp	[bp+var_11], 0
		jnz	short loc_8B2B1
		jmp	loc_8B333

loc_8B2B1:
		push	3
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	5
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_12A]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF7E
		add	ax, 0FFCEh
		mov	word ptr [bp+var_140], ax
		mov	word ptr [bp+var_142], 0
		cmp	[bp+var_D30], 0
		jz	short loc_8B333
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_142]
		push	word ptr [bp+var_140]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8B333

loc_8B333:
		cmp	[bp+var_10], 0
		jnz	short loc_8B33C
		jmp	loc_8B53C

loc_8B33C:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_14C], 0
		mov	byte ptr [bp+var_148], 2
		mov	byte ptr [bp+var_148+1], 0
		mov	[bp+var_146], 0
		push	2
		lea	ax, word ptr [bp+var_14C]
		push	ax
		push	4
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_14C]
		push	ax
		lea	ax, [bp+var_CDA]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		mov	word ptr [bp+var_14E], 0
		jmp	short loc_8B3A6

loc_8B395:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_14E]

loc_8B3A6:
		cmp	word ptr [bp+var_14E], 4
		jl	short loc_8B395
		push	0FFFFh
		lea	ax, [bp+var_CDA]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		mov	word ptr [bp+var_14E], 0
		jmp	loc_8B4B9

loc_8B3C5:
		mov	ax, word ptr [bp+var_13A]
		cmp	ax, word ptr [bp+var_13C]
		jnz	short loc_8B430
		mov	ax, word ptr [bp+var_14E]
		inc	word ptr [bp+var_14E]
		test	ax, 1
		jz	short loc_8B406
		mov	ax, word ptr [bp+var_138]
		mov	word ptr [bp+var_150], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_150]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_13C], ax

loc_8B406:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jge	short loc_8B418
		mov	word ptr [bp+var_138+2], 0FFFFh
		jmp	short loc_8B430

loc_8B418:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jnz	short loc_8B42A
		mov	word ptr [bp+var_138+2], 0
		jmp	short loc_8B430

loc_8B42A:
		mov	word ptr [bp+var_138+2], 1

loc_8B430:
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_132]
		mov	bx, word ptr [bp+var_132]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, word ptr [bp+var_13E]
		inc	word ptr [bp+var_13E]
		cmp	ax, 1
		jnz	short loc_8B476
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8B476:
		cmp	word ptr [bp+var_13E], 5
		jnz	short loc_8B48A
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8B48A:
		cmp	word ptr [bp+var_13E], 8
		jnz	short loc_8B497
		mov	word ptr [bp+var_13E], 0

loc_8B497:
		mov	ax, word ptr [bp+var_138+2]
		add	word ptr [bp+var_13A], ax
		jmp	short loc_8B4AC
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8B4AC
		jmp	short loc_8B4CD

loc_8B4AC:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8B4B9:
		lea	ax, [bp+var_CDA]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jz	short loc_8B4CD
		jmp	loc_8B3C5

loc_8B4CD:
		mov	word ptr [bp+var_14E], 0
		jmp	short loc_8B4E6

loc_8B4D5:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_14E]

loc_8B4E6:
		cmp	word ptr [bp+var_14E], 4
		jl	short loc_8B4D5
		lea	ax, [bp+var_CDA]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_148+1], 0
		jz	short loc_8B522
		cmp	[bp+var_14C], 0
		jz	short loc_8B522
		push	0
		mov	al, byte ptr [bp+var_148]
		push	ax
		lea	ax, word ptr [bp+var_14C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8B522

loc_8B522:
		mov	[bp+var_14C], 0
		mov	byte ptr [bp+var_148+1], 0
		mov	[bp+var_146], 0
		jmp	loc_8B6E1

loc_8B53C:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0C5h
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 3Ch
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8B6C1

loc_8B57C:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_144], ax
		mov	ax, word ptr [bp+var_13A]
		cmp	ax, word ptr [bp+var_13C]
		jnz	short loc_8B5EA
		test	word ptr [bp+var_144], 1
		jz	short loc_8B5C0
		mov	ax, word ptr [bp+var_138]
		mov	word ptr [bp+var_146], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_146]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_13C], ax

loc_8B5C0:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jge	short loc_8B5D2
		mov	word ptr [bp+var_138+2], 0FFFFh
		jmp	short loc_8B5EA

loc_8B5D2:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jnz	short loc_8B5E4
		mov	word ptr [bp+var_138+2], 0
		jmp	short loc_8B5EA

loc_8B5E4:
		mov	word ptr [bp+var_138+2], 1

loc_8B5EA:
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_132]
		mov	bx, word ptr [bp+var_132]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, word ptr [bp+var_13E]
		inc	word ptr [bp+var_13E]
		cmp	ax, 1
		jnz	short loc_8B630
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8B630:
		cmp	word ptr [bp+var_13E], 5
		jnz	short loc_8B644
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8B644:
		cmp	word ptr [bp+var_13E], 8
		jnz	short loc_8B651
		mov	word ptr [bp+var_13E], 0

loc_8B651:
		mov	ax, word ptr [bp+var_138+2]
		add	word ptr [bp+var_13A], ax
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_144]
		jnz	short loc_8B67F
		mov	ax, [bp+var_E]
		mov	dx, 0Eh
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8B67F:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_144]
		jnz	short loc_8B698
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8B698:
		jmp	short loc_8B6B4
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8B6B4
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8B6E1

loc_8B6B4:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8B6C1:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8B6D1
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8B6D6

loc_8B6D1:
		mov	ax, 1
		jmp	short loc_8B6D8

loc_8B6D6:
		xor	ax, ax

loc_8B6D8:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8B6E1
		jmp	loc_8B57C

loc_8B6E1:
		cmp	[bp+var_11], 0
		jz	short loc_8B6F4
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_8B6F4:
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8B70D
		jmp	loc_8E250

loc_8B70D:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFBDh
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	2AA8h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_98]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13C], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_13E], ax
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_140], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_F8]
		mov	al, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13E]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	21h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_8B881
		jmp	loc_8B900

loc_8B881:
		push	3
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	5
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_12A]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF7E
		mov	word ptr [bp+var_142], ax
		mov	word ptr [bp+var_144], 0
		cmp	[bp+var_D30], 0
		jz	short loc_8B900
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_142]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8B900

loc_8B900:
		cmp	[bp+var_10], 0
		jnz	short loc_8B909
		jmp	loc_8BAFC

loc_8B909:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		push	2
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	0Dh
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_150], 0
		jmp	short loc_8B974

loc_8B963:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_8B974:
		cmp	word ptr [bp+var_150], 3
		jl	short loc_8B963
		jmp	loc_8BA07

loc_8B97E:
		or	di, di
		jnz	short loc_8B9A3
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8B9A3
		mov	di, 0FFFFh
		jmp	short loc_8B9B4

loc_8B9A3:
		cmp	di, 0FFFFh
		jnz	short loc_8B9AD
		mov	di, 1
		jmp	short loc_8B9B4

loc_8B9AD:
		cmp	di, 1
		jnz	short loc_8B9B4
		xor	di, di

loc_8B9B4:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8B9FA
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8B9FA
		jmp	short loc_8BA1A

loc_8B9FA:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8BA07:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_8BA1A
		jmp	loc_8B97E

loc_8BA1A:
		mov	word ptr [bp+var_150], 0
		jmp	loc_8BAB0

loc_8BA23:
		or	di, di
		jnz	short loc_8BA48
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8BA48
		mov	di, 0FFFFh
		jmp	short loc_8BA59

loc_8BA48:
		cmp	di, 0FFFFh
		jnz	short loc_8BA52
		mov	di, 1
		jmp	short loc_8BA59

loc_8BA52:
		cmp	di, 1
		jnz	short loc_8BA59
		xor	di, di

loc_8BA59:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8BA9F
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8BA9F
		jmp	short loc_8BABA

loc_8BA9F:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_8BAB0:
		cmp	word ptr [bp+var_150], 8
		jge	short loc_8BABA
		jmp	loc_8BA23

loc_8BABA:
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_8BAE2
		cmp	[bp+var_14E], 0
		jz	short loc_8BAE2
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8BAE2

loc_8BAE2:
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		jmp	loc_8BC54

loc_8BAFC:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 39h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8BC34

loc_8BB3B:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8BB68
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8BB68
		mov	di, 0FFFFh
		jmp	short loc_8BB79

loc_8BB68:
		cmp	di, 0FFFFh
		jnz	short loc_8BB72
		mov	di, 1
		jmp	short loc_8BB79

loc_8BB72:
		cmp	di, 1
		jnz	short loc_8BB79
		xor	di, di

loc_8BB79:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8BBD8
		mov	ax, [bp+var_E]
		mov	dx, 0Fh
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8BBD8:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8BBF2
		push	2AACh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8BBF2:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8BC0B
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8BC0B:
		jmp	short loc_8BC27
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8BC27
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8BC54

loc_8BC27:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8BC34:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8BC44
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8BC49

loc_8BC44:
		mov	ax, 1
		jmp	short loc_8BC4B

loc_8BC49:
		xor	ax, ax

loc_8BC4B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8BC54
		jmp	loc_8BB3B

loc_8BC54:
		cmp	[bp+var_11], 0
		jz	short loc_8BC67
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_8BC67:
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_8BC8F
		cmp	[bp+var_13A], 0
		jz	short loc_8BC8F
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8BC8F

loc_8BC8F:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8BCBF
		jmp	loc_8E250

loc_8BCBF:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	2ABFh
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_8E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13C], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_13E], ax
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_140], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_E8]
		mov	al, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13E]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_8BE25
		jmp	loc_8BEA4

loc_8BE25:
		push	3
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	18h
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_120]
		push	ax
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFA4
		mov	word ptr [bp+var_142], ax
		mov	word ptr [bp+var_144], 0
		cmp	[bp+var_D22], 0
		jz	short loc_8BEA4
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_142]
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8BEA4

loc_8BEA4:
		cmp	[bp+var_10], 0
		jnz	short loc_8BEAD
		jmp	loc_8C246

loc_8BEAD:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		push	2
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	5
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_150], 0
		jmp	short loc_8BF18

loc_8BF07:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_8BF18:
		cmp	word ptr [bp+var_150], 3
		jl	short loc_8BF07
		jmp	loc_8BFAB

loc_8BF22:
		or	di, di
		jnz	short loc_8BF47
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8BF47
		mov	di, 0FFFFh
		jmp	short loc_8BF58

loc_8BF47:
		cmp	di, 0FFFFh
		jnz	short loc_8BF51
		mov	di, 1
		jmp	short loc_8BF58

loc_8BF51:
		cmp	di, 1
		jnz	short loc_8BF58
		xor	di, di

loc_8BF58:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8BF9E
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8BF9E
		jmp	short loc_8BFBE

loc_8BF9E:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8BFAB:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_8BFBE
		jmp	loc_8BF22

loc_8BFBE:
		mov	word ptr [bp+var_150], 0
		jmp	short loc_8C01A

loc_8BFC6:
		or	di, di
		jnz	short loc_8BFEB
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8BFEB
		mov	di, 0FFFFh
		jmp	short loc_8BFFC

loc_8BFEB:
		cmp	di, 0FFFFh
		jnz	short loc_8BFF5
		mov	di, 1
		jmp	short loc_8BFFC

loc_8BFF5:
		cmp	di, 1
		jnz	short loc_8BFFC
		xor	di, di

loc_8BFFC:
		jmp	short loc_8C009
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8C009
		jmp	short loc_8C021

loc_8C009:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_8C01A:
		cmp	word ptr [bp+var_150], 8
		jl	short loc_8BFC6

loc_8C021:
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_158+2], 2
		mov	byte ptr [bp+var_158+3], 0
		mov	[bp+var_154], 0
		push	2
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	6
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_150], 0
		jmp	short loc_8C07F

loc_8C06E:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_8C07F:
		cmp	word ptr [bp+var_150], 3
		jl	short loc_8C06E
		jmp	loc_8C112

loc_8C089:
		or	di, di
		jnz	short loc_8C0AE
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8C0AE
		mov	di, 0FFFFh
		jmp	short loc_8C0BF

loc_8C0AE:
		cmp	di, 0FFFFh
		jnz	short loc_8C0B8
		mov	di, 1
		jmp	short loc_8C0BF

loc_8C0B8:
		cmp	di, 1
		jnz	short loc_8C0BF
		xor	di, di

loc_8C0BF:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8C105
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8C105
		jmp	short loc_8C125

loc_8C105:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8C112:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_8C125
		jmp	loc_8C089

loc_8C125:
		mov	word ptr [bp+var_150], 0
		jmp	loc_8C1BB

loc_8C12E:
		or	di, di
		jnz	short loc_8C153
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8C153
		mov	di, 0FFFFh
		jmp	short loc_8C164

loc_8C153:
		cmp	di, 0FFFFh
		jnz	short loc_8C15D
		mov	di, 1
		jmp	short loc_8C164

loc_8C15D:
		cmp	di, 1
		jnz	short loc_8C164
		xor	di, di

loc_8C164:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8C1AA
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8C1AA
		jmp	short loc_8C1C5

loc_8C1AA:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_150]

loc_8C1BB:
		cmp	word ptr [bp+var_150], 4
		jge	short loc_8C1C5
		jmp	loc_8C12E

loc_8C1C5:
		cmp	byte ptr [bp+var_158+3], 0
		jz	short loc_8C1ED
		cmp	[bp+var_15A], 0
		jz	short loc_8C1ED
		push	0
		mov	al, byte ptr [bp+var_158+2]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8C1ED

loc_8C1ED:
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_158+3], 0
		mov	[bp+var_154], 0
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_8C22C
		cmp	[bp+var_14E], 0
		jz	short loc_8C22C
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8C22C

loc_8C22C:
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		jmp	loc_8C7F9

loc_8C246:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 44h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8C3E0

loc_8C285:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8C2B2
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8C2B2
		mov	di, 0FFFFh
		jmp	short loc_8C2C3

loc_8C2B2:
		cmp	di, 0FFFFh
		jnz	short loc_8C2BC
		mov	di, 1
		jmp	short loc_8C2C3

loc_8C2BC:
		cmp	di, 1
		jnz	short loc_8C2C3
		xor	di, di

loc_8C2C3:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C320
		mov	ax, [bp+var_E]
		shl	ax, 4
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8C320:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C33A
		push	2AC5h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8C33A:
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C353
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8C353:
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C36C
		push	0FFFFh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8C36C:
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C385
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8C385:
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C39E
		push	0FFFFh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8C39E:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C3B7
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8C3B7:
		jmp	short loc_8C3D3
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8C3D3
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8C400

loc_8C3D3:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8C3E0:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8C3F0
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8C3F5

loc_8C3F0:
		mov	ax, 1
		jmp	short loc_8C3F7

loc_8C3F5:
		xor	ax, ax

loc_8C3F7:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8C400
		jmp	loc_8C285

loc_8C400:
		mov	[bp+var_A], 21h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8C533

loc_8C421:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8C44E
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8C44E
		mov	di, 0FFFFh
		jmp	short loc_8C45F

loc_8C44E:
		cmp	di, 0FFFFh
		jnz	short loc_8C458
		mov	di, 1
		jmp	short loc_8C45F

loc_8C458:
		cmp	di, 1
		jnz	short loc_8C45F
		xor	di, di

loc_8C45F:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C4BE
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8C4BE:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C4D8
		push	2AE8h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8C4D8:
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C4F1
		push	13h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8C4F1:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C50A
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8C50A:
		jmp	short loc_8C526
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8C526
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8C553

loc_8C526:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8C533:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8C543
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8C548

loc_8C543:
		mov	ax, 1
		jmp	short loc_8C54A

loc_8C548:
		xor	ax, ax

loc_8C54A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8C553
		jmp	loc_8C421

loc_8C553:
		mov	[bp+var_A], 1Bh
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8C686

loc_8C574:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8C5A1
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8C5A1
		mov	di, 0FFFFh
		jmp	short loc_8C5B2

loc_8C5A1:
		cmp	di, 0FFFFh
		jnz	short loc_8C5AB
		mov	di, 1
		jmp	short loc_8C5B2

loc_8C5AB:
		cmp	di, 1
		jnz	short loc_8C5B2
		xor	di, di

loc_8C5B2:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C611
		mov	ax, [bp+var_E]
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8C611:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C62B
		push	2AF7h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8C62B:
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C644
		push	0FFFFh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8C644:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C65D
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8C65D:
		jmp	short loc_8C679
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8C679
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8C6A6

loc_8C679:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8C686:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8C696
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8C69B

loc_8C696:
		mov	ax, 1
		jmp	short loc_8C69D

loc_8C69B:
		xor	ax, ax

loc_8C69D:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8C6A6
		jmp	loc_8C574

loc_8C6A6:
		mov	[bp+var_A], 38h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8C7D9

loc_8C6C7:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_146], ax
		or	di, di
		jnz	short loc_8C6F4
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8C6F4
		mov	di, 0FFFFh
		jmp	short loc_8C705

loc_8C6F4:
		cmp	di, 0FFFFh
		jnz	short loc_8C6FE
		mov	di, 1
		jmp	short loc_8C705

loc_8C6FE:
		cmp	di, 1
		jnz	short loc_8C705
		xor	di, di

loc_8C705:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C764
		mov	ax, [bp+var_E]
		mov	dx, 13h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8C764:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C77E
		push	2AFEh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8C77E:
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C797
		push	19h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8C797:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_146]
		jnz	short loc_8C7B0
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8C7B0:
		jmp	short loc_8C7CC
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8C7CC
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8C7F9

loc_8C7CC:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8C7D9:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8C7E9
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8C7EE

loc_8C7E9:
		mov	ax, 1
		jmp	short loc_8C7F0

loc_8C7EE:
		xor	ax, ax

loc_8C7F0:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8C7F9
		jmp	loc_8C6C7

loc_8C7F9:
		cmp	[bp+var_11], 0
		jz	short loc_8C80C
		lea	ax, [bp+var_D22]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_8C80C:
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_8C834
		cmp	[bp+var_13A], 0
		jz	short loc_8C834
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8C834

loc_8C834:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8C864
		jmp	loc_8E250

loc_8C864:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFDEh
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		push	1
		push	3
		lea	ax, word ptr [bp+var_7A]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132], ax
		push	1
		push	1
		push	3
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_134], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_B8]
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_134]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		xor	di, di
		mov	word ptr [bp+var_138+2], 3
		mov	word ptr [bp+var_138], 2
		mov	word ptr [bp+var_13A], 2
		cmp	[bp+var_11], 0
		jnz	short loc_8C966
		jmp	loc_8C9E8

loc_8C966:
		push	3
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	18h
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_120]
		push	ax
		lea	ax, [bp+var_D22]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFA4
		add	ax, 0FFCEh
		mov	word ptr [bp+var_13C], ax
		mov	word ptr [bp+var_13E], 0
		cmp	[bp+var_D22], 0
		jz	short loc_8C9E8
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_13E]
		push	word ptr [bp+var_13C]
		push	[bp+var_D20]
		mov	bx, [bp+var_D22]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8C9E8

loc_8C9E8:
		cmp	[bp+var_10], 0
		jnz	short loc_8C9F1
		jmp	loc_8CBD2

loc_8C9F1:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144], 2
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_142], 0
		push	2
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	7
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_148]
		push	ax
		lea	ax, [bp+var_CDA]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		mov	word ptr [bp+var_14A], 0
		jmp	short loc_8CA5B

loc_8CA4A:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_14A]

loc_8CA5B:
		cmp	word ptr [bp+var_14A], 4
		jl	short loc_8CA4A
		push	0FFFFh
		lea	ax, [bp+var_CDA]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		mov	word ptr [bp+var_14A], 0
		jmp	loc_8CB46

loc_8CA7A:
		mov	ax, word ptr [bp+var_138]
		cmp	ax, word ptr [bp+var_13A]
		jnz	short loc_8CADB
		mov	ax, word ptr [bp+var_14A]
		inc	word ptr [bp+var_14A]
		test	ax, 1
		jz	short loc_8CABB
		mov	ax, word ptr [bp+var_138+2]
		mov	word ptr [bp+var_14C], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_14C]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_13A], ax

loc_8CABB:
		mov	ax, word ptr [bp+var_13A]
		cmp	ax, word ptr [bp+var_138]
		jge	short loc_8CACA
		mov	di, 0FFFFh
		jmp	short loc_8CADB

loc_8CACA:
		mov	ax, word ptr [bp+var_13A]
		cmp	ax, word ptr [bp+var_138]
		jnz	short loc_8CAD8
		xor	di, di
		jmp	short loc_8CADB

loc_8CAD8:
		mov	di, 1

loc_8CADB:
		push	di
		push	0
		push	word ptr [bp+var_132]
		mov	bx, word ptr [bp+var_132]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		add	word ptr [bp+var_138], di
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_14E], ax
		mov	bx, word ptr [bp+var_134]
		mov	ax, word ptr [bp+var_14E]
		mov	[bx+1Bh], ax
		jmp	short loc_8CB39
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8CB39
		jmp	short loc_8CB5A

loc_8CB39:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8CB46:
		lea	ax, [bp+var_CDA]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jz	short loc_8CB5A
		jmp	loc_8CA7A

loc_8CB5A:
		mov	bx, word ptr [bp+var_134]
		mov	word ptr [bx+1Bh], 0
		mov	word ptr [bp+var_14A], 0
		jmp	short loc_8CB7C

loc_8CB6B:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_14A]

loc_8CB7C:
		cmp	word ptr [bp+var_14A], 4
		jl	short loc_8CB6B
		lea	ax, [bp+var_CDA]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_8CBB8
		cmp	[bp+var_148], 0
		jz	short loc_8CBB8
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8CBB8

loc_8CBB8:
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_142], 0
		jmp	loc_8CD65

loc_8CBD2:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0C5h
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 49h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8CD45

loc_8CC12:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_140], ax
		mov	ax, word ptr [bp+var_138]
		cmp	ax, word ptr [bp+var_13A]
		jnz	short loc_8CC76
		test	word ptr [bp+var_140], 1
		jz	short loc_8CC56
		mov	ax, word ptr [bp+var_138+2]
		mov	word ptr [bp+var_142], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_142]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_13A], ax

loc_8CC56:
		mov	ax, word ptr [bp+var_13A]
		cmp	ax, word ptr [bp+var_138]
		jge	short loc_8CC65
		mov	di, 0FFFFh
		jmp	short loc_8CC76

loc_8CC65:
		mov	ax, word ptr [bp+var_13A]
		cmp	ax, word ptr [bp+var_138]
		jnz	short loc_8CC73
		xor	di, di
		jmp	short loc_8CC76

loc_8CC73:
		mov	di, 1

loc_8CC76:
		push	di
		push	0
		push	word ptr [bp+var_132]
		mov	bx, word ptr [bp+var_132]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		add	word ptr [bp+var_138], di
		mov	ax, si
		add	ax, 4
		cmp	ax, word ptr [bp+var_140]
		jnz	short loc_8CCC6
		mov	ax, [bp+var_E]
		mov	dx, 14h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8CCC6:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_140]
		jge	short loc_8CD03
		mov	ax, si
		add	ax, 1Ah
		cmp	ax, word ptr [bp+var_140]
		jle	short loc_8CD03
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_144], ax
		mov	bx, word ptr [bp+var_134]
		mov	ax, word ptr [bp+var_144]
		mov	[bx+1Bh], ax

loc_8CD03:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_140]
		jnz	short loc_8CD1C
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8CD1C:
		jmp	short loc_8CD38
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8CD38
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8CD65

loc_8CD38:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8CD45:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8CD55
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8CD5A

loc_8CD55:
		mov	ax, 1
		jmp	short loc_8CD5C

loc_8CD5A:
		xor	ax, ax

loc_8CD5C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8CD65
		jmp	loc_8CC12

loc_8CD65:
		cmp	[bp+var_11], 0
		jz	short loc_8CD78
		lea	ax, [bp+var_D22]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_8CD78:
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8CD91
		jmp	loc_8E250

loc_8CD91:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFD1h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	di, ax
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_84]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132], ax
		push	1
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_134], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_B8]
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_134]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	word ptr [bp+var_138+2], 0
		mov	word ptr [bp+var_138], 3
		mov	word ptr [bp+var_13A], 2
		mov	word ptr [bp+var_13C], 2
		mov	word ptr [bp+var_13E], 0
		cmp	[bp+var_11], 0
		jnz	short loc_8CEC0
		jmp	loc_8CF42

loc_8CEC0:
		push	3
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	5
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_12A]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF7E
		add	ax, 0FFCEh
		mov	word ptr [bp+var_140], ax
		mov	word ptr [bp+var_142], 0
		cmp	[bp+var_D30], 0
		jz	short loc_8CF42
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_142]
		push	word ptr [bp+var_140]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8CF42

loc_8CF42:
		cmp	[bp+var_10], 0
		jnz	short loc_8CF4B
		jmp	loc_8D17B

loc_8CF4B:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_14C], 0
		mov	byte ptr [bp+var_148], 2
		mov	byte ptr [bp+var_148+1], 0
		mov	[bp+var_146], 0
		push	2
		lea	ax, word ptr [bp+var_14C]
		push	ax
		push	0Eh
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_14C]
		push	ax
		lea	ax, [bp+var_CDA]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		mov	word ptr [bp+var_14E], 0
		jmp	short loc_8CFB5

loc_8CFA4:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_14E]

loc_8CFB5:
		cmp	word ptr [bp+var_14E], 4
		jl	short loc_8CFA4
		push	0FFFFh
		lea	ax, [bp+var_CDA]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		mov	word ptr [bp+var_14E], 0
		jmp	loc_8D0EF

loc_8CFD4:
		mov	ax, word ptr [bp+var_13A]
		cmp	ax, word ptr [bp+var_13C]
		jnz	short loc_8D03F
		mov	ax, word ptr [bp+var_14E]
		inc	word ptr [bp+var_14E]
		test	ax, 1
		jz	short loc_8D015
		mov	ax, word ptr [bp+var_138]
		mov	word ptr [bp+var_150], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_150]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_13C], ax

loc_8D015:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jge	short loc_8D027
		mov	word ptr [bp+var_138+2], 0FFFFh
		jmp	short loc_8D03F

loc_8D027:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jnz	short loc_8D039
		mov	word ptr [bp+var_138+2], 0
		jmp	short loc_8D03F

loc_8D039:
		mov	word ptr [bp+var_138+2], 1

loc_8D03F:
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_132]
		mov	bx, word ptr [bp+var_132]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, word ptr [bp+var_13E]
		inc	word ptr [bp+var_13E]
		cmp	ax, 1
		jnz	short loc_8D085
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8D085:
		cmp	word ptr [bp+var_13E], 5
		jnz	short loc_8D099
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8D099:
		cmp	word ptr [bp+var_13E], 8
		jnz	short loc_8D0A6
		mov	word ptr [bp+var_13E], 0

loc_8D0A6:
		mov	ax, word ptr [bp+var_138+2]
		add	word ptr [bp+var_13A], ax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_152], ax
		mov	bx, word ptr [bp+var_134]
		mov	ax, word ptr [bp+var_152]
		mov	[bx+1Bh], ax
		jmp	short loc_8D0E2
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8D0E2
		jmp	short loc_8D103

loc_8D0E2:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8D0EF:
		lea	ax, [bp+var_CDA]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jz	short loc_8D103
		jmp	loc_8CFD4

loc_8D103:
		mov	bx, word ptr [bp+var_134]
		mov	word ptr [bx+1Bh], 0
		mov	word ptr [bp+var_14E], 0
		jmp	short loc_8D125

loc_8D114:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_14E]

loc_8D125:
		cmp	word ptr [bp+var_14E], 4
		jl	short loc_8D114
		lea	ax, [bp+var_CDA]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_148+1], 0
		jz	short loc_8D161
		cmp	[bp+var_14C], 0
		jz	short loc_8D161
		push	0
		mov	al, byte ptr [bp+var_148]
		push	ax
		lea	ax, word ptr [bp+var_14C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8D161

loc_8D161:
		mov	[bp+var_14C], 0
		mov	byte ptr [bp+var_148+1], 0
		mov	[bp+var_146], 0
		jmp	loc_8D520

loc_8D17B:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0C4h
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 20h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8D33D

loc_8D1BB:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_144], ax
		mov	ax, word ptr [bp+var_13A]
		cmp	ax, word ptr [bp+var_13C]
		jnz	short loc_8D229
		test	word ptr [bp+var_144], 1
		jz	short loc_8D1FF
		mov	ax, word ptr [bp+var_138]
		mov	word ptr [bp+var_146], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_146]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_13C], ax

loc_8D1FF:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jge	short loc_8D211
		mov	word ptr [bp+var_138+2], 0FFFFh
		jmp	short loc_8D229

loc_8D211:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jnz	short loc_8D223
		mov	word ptr [bp+var_138+2], 0
		jmp	short loc_8D229

loc_8D223:
		mov	word ptr [bp+var_138+2], 1

loc_8D229:
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_132]
		mov	bx, word ptr [bp+var_132]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, word ptr [bp+var_13E]
		inc	word ptr [bp+var_13E]
		cmp	ax, 1
		jnz	short loc_8D26F
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8D26F:
		cmp	word ptr [bp+var_13E], 5
		jnz	short loc_8D283
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8D283:
		cmp	word ptr [bp+var_13E], 8
		jnz	short loc_8D290
		mov	word ptr [bp+var_13E], 0

loc_8D290:
		mov	ax, word ptr [bp+var_138+2]
		add	word ptr [bp+var_13A], ax
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_144]
		jnz	short loc_8D2BE
		mov	ax, [bp+var_E]
		mov	dx, 15h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8D2BE:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_144]
		jge	short loc_8D2FB
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_144]
		jle	short loc_8D2FB
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_148], ax
		mov	bx, word ptr [bp+var_134]
		mov	ax, word ptr [bp+var_148]
		mov	[bx+1Bh], ax

loc_8D2FB:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_144]
		jnz	short loc_8D314
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8D314:
		jmp	short loc_8D330
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8D330
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8D35D

loc_8D330:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8D33D:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8D34D
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8D352

loc_8D34D:
		mov	ax, 1
		jmp	short loc_8D354

loc_8D352:
		xor	ax, ax

loc_8D354:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8D35D
		jmp	loc_8D1BB

loc_8D35D:
		mov	[bp+var_A], 2Fh
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8D500

loc_8D37E:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_144], ax
		mov	ax, word ptr [bp+var_13A]
		cmp	ax, word ptr [bp+var_13C]
		jnz	short loc_8D3EC
		test	word ptr [bp+var_144], 1
		jz	short loc_8D3C2
		mov	ax, word ptr [bp+var_138]
		mov	word ptr [bp+var_146], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_146]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_13C], ax

loc_8D3C2:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jge	short loc_8D3D4
		mov	word ptr [bp+var_138+2], 0FFFFh
		jmp	short loc_8D3EC

loc_8D3D4:
		mov	ax, word ptr [bp+var_13C]
		cmp	ax, word ptr [bp+var_13A]
		jnz	short loc_8D3E6
		mov	word ptr [bp+var_138+2], 0
		jmp	short loc_8D3EC

loc_8D3E6:
		mov	word ptr [bp+var_138+2], 1

loc_8D3EC:
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_132]
		mov	bx, word ptr [bp+var_132]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_138+2]
		push	0
		push	word ptr [bp+var_134]
		mov	bx, word ptr [bp+var_134]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, word ptr [bp+var_13E]
		inc	word ptr [bp+var_13E]
		cmp	ax, 1
		jnz	short loc_8D432
		push	0
		push	1
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8D432:
		cmp	word ptr [bp+var_13E], 5
		jnz	short loc_8D446
		push	0FFFFh
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8D446:
		cmp	word ptr [bp+var_13E], 8
		jnz	short loc_8D453
		mov	word ptr [bp+var_13E], 0

loc_8D453:
		mov	ax, word ptr [bp+var_138+2]
		add	word ptr [bp+var_13A], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_144]
		jnz	short loc_8D481
		mov	ax, [bp+var_E]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8D481:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_144]
		jge	short loc_8D4BE
		mov	ax, si
		add	ax, 1Ah
		cmp	ax, word ptr [bp+var_144]
		jle	short loc_8D4BE
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_148], ax
		mov	bx, word ptr [bp+var_134]
		mov	ax, word ptr [bp+var_148]
		mov	[bx+1Bh], ax

loc_8D4BE:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_144]
		jnz	short loc_8D4D7
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8D4D7:
		jmp	short loc_8D4F3
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8D4F3
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8D520

loc_8D4F3:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8D500:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8D510
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8D515

loc_8D510:
		mov	ax, 1
		jmp	short loc_8D517

loc_8D515:
		xor	ax, ax

loc_8D517:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8D520
		jmp	loc_8D37E

loc_8D520:
		cmp	[bp+var_11], 0
		jz	short loc_8D533
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_8D533:
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8D54C
		jmp	loc_8E250

loc_8D54C:
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFBDh
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+2], 2
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	3
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	2B11h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_98]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_13C], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_13E], ax
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_140], ax
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146], 2
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	0
		lea	ax, [bp+var_2C6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	0
		call	ToggleLayer_Construct_FDCC
		add	sp, 0Ah
		mov	word ptr [bp+var_14C], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_F8]
		mov	al, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13E]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0Eh
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_8D70D
		jmp	loc_8D78C

loc_8D70D:
		push	3
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	5
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_12A]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF7E
		mov	word ptr [bp+var_14E], ax
		mov	word ptr [bp+var_150], 0
		cmp	[bp+var_D30], 0
		jz	short loc_8D78C
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_150]
		push	word ptr [bp+var_14E]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8D78C

loc_8D78C:
		cmp	[bp+var_10], 0
		jnz	short loc_8D795
		jmp	loc_8D988

loc_8D795:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_158+2], 2
		mov	byte ptr [bp+var_158+3], 0
		mov	[bp+var_154], 0
		push	2
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	0Fh
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	word ptr [bp+var_13E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_15E+2], 0
		jmp	short loc_8D800

loc_8D7EF:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_15E+2]

loc_8D800:
		cmp	word ptr [bp+var_15E+2], 3
		jl	short loc_8D7EF
		jmp	loc_8D893

loc_8D80A:
		or	di, di
		jnz	short loc_8D82F
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8D82F
		mov	di, 0FFFFh
		jmp	short loc_8D840

loc_8D82F:
		cmp	di, 0FFFFh
		jnz	short loc_8D839
		mov	di, 1
		jmp	short loc_8D840

loc_8D839:
		cmp	di, 1
		jnz	short loc_8D840
		xor	di, di

loc_8D840:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8D886
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8D886
		jmp	short loc_8D8A6

loc_8D886:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8D893:
		push	word ptr [bp+var_13E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_8D8A6
		jmp	loc_8D80A

loc_8D8A6:
		mov	word ptr [bp+var_15E+2], 0
		jmp	loc_8D93C

loc_8D8AF:
		or	di, di
		jnz	short loc_8D8D4
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8D8D4
		mov	di, 0FFFFh
		jmp	short loc_8D8E5

loc_8D8D4:
		cmp	di, 0FFFFh
		jnz	short loc_8D8DE
		mov	di, 1
		jmp	short loc_8D8E5

loc_8D8DE:
		cmp	di, 1
		jnz	short loc_8D8E5
		xor	di, di

loc_8D8E5:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8D92B
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8D92B
		jmp	short loc_8D946

loc_8D92B:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_15E+2]

loc_8D93C:
		cmp	word ptr [bp+var_15E+2], 4
		jge	short loc_8D946
		jmp	loc_8D8AF

loc_8D946:
		cmp	byte ptr [bp+var_158+3], 0
		jz	short loc_8D96E
		cmp	[bp+var_15A], 0
		jz	short loc_8D96E
		push	0
		mov	al, byte ptr [bp+var_158+2]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8D96E

loc_8D96E:
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_158+3], 0
		mov	[bp+var_154], 0
		jmp	loc_8DC01

loc_8D988:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_A], 2Ch
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8DAC0

loc_8D9C7:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_152], ax
		or	di, di
		jnz	short loc_8D9F4
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8D9F4
		mov	di, 0FFFFh
		jmp	short loc_8DA05

loc_8D9F4:
		cmp	di, 0FFFFh
		jnz	short loc_8D9FE
		mov	di, 1
		jmp	short loc_8DA05

loc_8D9FE:
		cmp	di, 1
		jnz	short loc_8DA05
		xor	di, di

loc_8DA05:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_152]
		jnz	short loc_8DA64
		mov	ax, [bp+var_E]
		mov	dx, 17h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8DA64:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_152]
		jnz	short loc_8DA7E
		push	2B15h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8DA7E:
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_152]
		jnz	short loc_8DA97
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8DA97:
		jmp	short loc_8DAB3
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8DAB3
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8DAE0

loc_8DAB3:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8DAC0:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8DAD0
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8DAD5

loc_8DAD0:
		mov	ax, 1
		jmp	short loc_8DAD7

loc_8DAD5:
		xor	ax, ax

loc_8DAD7:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8DAE0
		jmp	loc_8D9C7

loc_8DAE0:
		mov	[bp+var_A], 18h
		mov	si, word ptr [bp+var_D36+1]
		mov	ax, [bp+var_A]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8DBE1

loc_8DB01:
		mov	ax, word ptr [bp+var_D36+1]
		mov	word ptr [bp+var_152], ax
		or	di, di
		jnz	short loc_8DB2E
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8DB2E
		mov	di, 0FFFFh
		jmp	short loc_8DB3F

loc_8DB2E:
		cmp	di, 0FFFFh
		jnz	short loc_8DB38
		mov	di, 1
		jmp	short loc_8DB3F

loc_8DB38:
		cmp	di, 1
		jnz	short loc_8DB3F
		xor	di, di

loc_8DB3F:
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_152]
		jnz	short loc_8DB9E
		mov	ax, [bp+var_E]
		mov	dx, 18h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8DB9E:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_152]
		jnz	short loc_8DBB8
		push	2B21h
		push	word ptr [bp+var_13E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8DBB8:
		jmp	short loc_8DBD4
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8DBD4
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8DC01

loc_8DBD4:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8DBE1:
		mov	ax, word ptr [bp+var_D36+1]
		cmp	ax, [bp+var_8]
		jnb	short loc_8DBF1
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8DBF6

loc_8DBF1:
		mov	ax, 1
		jmp	short loc_8DBF8

loc_8DBF6:
		xor	ax, ax

loc_8DBF8:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8DC01
		jmp	loc_8DB01

loc_8DC01:
		mov	di, 0FFFFh
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	word ptr [bp+var_D36+1], 0
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	word ptr [bp+var_140], 0
		jz	short loc_8DC7F
		push	3
		push	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_140]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_8DC7F

loc_8DC7F:
		jmp	short loc_8DCD1

loc_8DC81:
		cmp	word ptr [bp+var_D36+1], 1
		jnz	short loc_8DCC4
		mov	di, 1
		push	di
		push	0
		push	word ptr [bp+var_13C]
		mov	bx, word ptr [bp+var_13C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_13E]
		mov	bx, word ptr [bp+var_13E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8DCC4:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8DCD1:
		cmp	word ptr [bp+var_D36+1], 0Fh
		jnb	short loc_8DCDF
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8DCE4

loc_8DCDF:
		mov	ax, 1
		jmp	short loc_8DCE6

loc_8DCE4:
		xor	ax, ax

loc_8DCE6:
		mov	ah, 0
		or	ax, ax
		jz	short loc_8DC81
		cmp	[bp+var_11], 0
		jz	short loc_8DCFF
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_8DCFF:
		cmp	byte ptr [bp+var_146+1], 0
		jz	short loc_8DD27
		cmp	[bp+var_14A], 0
		jz	short loc_8DD27
		push	0
		mov	al, byte ptr [bp+var_146]
		push	ax
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8DD27

loc_8DD27:
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		cmp	byte ptr [bp+var_138+3], 0
		jz	short loc_8DD66
		cmp	[bp+var_13A], 0
		jz	short loc_8DD66
		push	0
		mov	al, byte ptr [bp+var_138+2]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8DD66

loc_8DD66:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_138+3], 0
		mov	[bp+var_134], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8DD96
		jmp	loc_8E250

loc_8DD96:
		mov	[bp+var_138], 0
		mov	byte ptr [bp+var_134], 2
		mov	byte ptr [bp+var_134+1], 0
		mov	[bp+var_132], 0
		push	3
		lea	ax, word ptr [bp+var_138]
		push	ax
		push	2
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_142], 0
		mov	byte ptr [bp+var_13E], 2
		mov	byte ptr [bp+var_13E+1], 0
		mov	[bp+var_13C], 0
		push	2
		lea	ax, word ptr [bp+var_142]
		push	ax
		push	0Ch
		lea	ax, [bp+var_24E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_146+1], 0
		lea	ax, word ptr [bp+var_142]
		push	ax
		lea	ax, word ptr [bp+var_148]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_1C8]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_14A], ax
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_138]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_14C], ax
		push	word ptr [bp+var_148]
		mov	al, byte ptr [bp+var_146]
		push	ax
		lea	ax, word ptr [bp+var_148]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_14A]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D52]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	di, 2
		mov	word ptr [bp+var_14E], 1
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		mov	[bp+var_D5C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D5A], ax
		lea	ax, [bp+var_D5C]
		mov	word_4D392, ax
		mov	[bp+var_D5C], 1BCh
		mov	[bp+var_D58], 0
		mov	[bp+var_D54], 0
		mov	word ptr [bp+var_D62+2], 0
		mov	[bp+var_D5E], 0FFFFh
		cmp	[bp+var_11], 0
		jnz	short loc_8DF31
		jmp	loc_8DFB0

loc_8DF31:
		push	3
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	26h
		lea	ax, [bp+var_4A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_158]
		push	ax
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFC0
		mov	word ptr [bp+var_15A], ax
		mov	word ptr [bp+var_15E+2], 0
		cmp	word ptr [bp+var_D62+2], 0
		jz	short loc_8DFB0
		push	[bp+var_D5E]
		mov	bx, word ptr [bp+var_D62+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_15E+2]
		push	word ptr [bp+var_15A]
		push	[bp+var_D5E]
		mov	bx, word ptr [bp+var_D62+2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8DFB0

loc_8DFB0:
		mov	[bp+var_166], 0
		mov	byte ptr [bp+var_164+2], 2
		mov	byte ptr [bp+var_164+3], 0
		mov	[bp+var_160], 0
		cmp	[bp+var_10], 0
		jz	short loc_8E018
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		push	2
		lea	ax, word ptr [bp+var_166]
		push	ax
		push	10h
		lea	ax, [bp+var_42E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_166]
		push	ax
		lea	ax, [bp+var_CDA]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_CDA]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_8E037

loc_8E018:
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0F8h
		lea	ax, [bp+var_D14]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4

loc_8E037:
		jmp	loc_8E0F1

loc_8E03A:
		mov	ax, word ptr [bp+var_D36+1]
		mov	[bp+var_168], ax
		mov	[bp+var_16A], di
		mov	bx, word ptr [bp+var_14C]
		mov	ax, [bp+var_16A]
		mov	[bx+1Bh], ax
		cmp	[bp+var_168], 12h
		jnz	short loc_8E07C
		mov	al, [bp+var_10]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8E07C
		mov	ax, [bp+var_E]
		mov	dx, 19h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D14]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8E07C:
		cmp	[bp+var_168], 2Ah
		jnz	short loc_8E09B
		mov	al, [bp+var_10]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8E09B
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8E09B:
		cmp	di, 1Ah
		jg	short loc_8E0A6
		add	di, word ptr [bp+var_14E]
		jmp	short loc_8E0C8

loc_8E0A6:
		cmp	di, 1Dh
		jnz	short loc_8E0B1
		mov	word ptr [bp+var_14E], 0FFFFh

loc_8E0B1:
		cmp	di, 1Bh
		jnz	short loc_8E0BC
		mov	word ptr [bp+var_14E], 1

loc_8E0BC:
		test	[bp+var_168], 1
		jz	short loc_8E0C8
		add	di, word ptr [bp+var_14E]

loc_8E0C8:
		jmp	short loc_8E0E4
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8E0E4
		push	0
		lea	ax, [bp+var_D14]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8E10F

loc_8E0E4:
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8E0F1:
		cmp	word ptr [bp+var_D36+1], 2Dh
		jnb	short loc_8E0FF
		cmp	byte ptr [bp+var_D36+3], 0
		jz	short loc_8E104

loc_8E0FF:
		mov	ax, 1
		jmp	short loc_8E106

loc_8E104:
		xor	ax, ax

loc_8E106:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8E10F
		jmp	loc_8E03A

loc_8E10F:
		lea	ax, [bp+var_CDA]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_164+3], 0
		jz	short loc_8E144
		cmp	[bp+var_166], 0
		jz	short loc_8E144
		push	0
		mov	al, byte ptr [bp+var_164+2]
		push	ax
		lea	ax, word ptr [bp+var_166]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E144

loc_8E144:
		mov	[bp+var_166], 0
		mov	byte ptr [bp+var_164+3], 0
		mov	[bp+var_160], 0
		lea	ax, word ptr [bp+var_D62+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D5C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_8E19F
		cmp	[bp+var_158], 0
		jz	short loc_8E19F
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_158]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E19F

loc_8E19F:
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_148]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_13E+1], 0
		jz	short loc_8E1FA
		cmp	[bp+var_142], 0
		jz	short loc_8E1FA
		push	0
		mov	al, byte ptr [bp+var_13E]
		push	ax
		lea	ax, word ptr [bp+var_142]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E1FA

loc_8E1FA:
		mov	[bp+var_142], 0
		mov	byte ptr [bp+var_13E+1], 0
		mov	[bp+var_13C], 0
		cmp	byte ptr [bp+var_134+1], 0
		jz	short loc_8E239
		cmp	[bp+var_138], 0
		jz	short loc_8E239
		push	0
		mov	al, byte ptr [bp+var_134]
		push	ax
		lea	ax, word ptr [bp+var_138]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E239

loc_8E239:
		mov	[bp+var_138], 0
		mov	byte ptr [bp+var_134+1], 0
		mov	[bp+var_132], 0

loc_8E250:
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D2C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		lea	ax, [bp+var_D22]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D1E]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_125], 0
		jz	short loc_8E2B0
		cmp	[bp+var_12A], 0
		jz	short loc_8E2B0
		push	0
		mov	al, [bp+var_126]
		push	ax
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E2B0

loc_8E2B0:
		mov	[bp+var_12A], 0
		mov	[bp+var_125], 0
		mov	[bp+var_124], 0
		cmp	[bp+var_11B], 0
		jz	short loc_8E2EF
		cmp	[bp+var_120], 0
		jz	short loc_8E2EF
		push	0
		mov	al, [bp+var_11C]
		push	ax
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E2EF

loc_8E2EF:
		mov	[bp+var_120], 0
		mov	[bp+var_11B], 0
		mov	[bp+var_11A], 0
		lea	ax, [bp+var_D12]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_CF2]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_10D], 0
		jz	short loc_8E34A
		cmp	[bp+var_112], 0
		jz	short loc_8E34A
		push	0
		mov	al, [bp+var_10E]
		push	ax
		lea	ax, word ptr [bp+var_112]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E34A

loc_8E34A:
		mov	[bp+var_112], 0
		mov	[bp+var_10D], 0
		mov	[bp+var_10C], 0
		lea	ax, [bp+var_108]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_FD], 0
		jz	short loc_8E396
		cmp	[bp+var_102], 0
		jz	short loc_8E396
		push	0
		mov	al, [bp+var_FE]
		push	ax
		lea	ax, word ptr [bp+var_102]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E396

loc_8E396:
		mov	[bp+var_102], 0
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		lea	ax, [bp+var_F8]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_ED], 0
		jz	short loc_8E3E2
		cmp	[bp+var_F2], 0
		jz	short loc_8E3E2
		push	0
		mov	al, [bp+var_EE]
		push	ax
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E3E2

loc_8E3E2:
		mov	[bp+var_F2], 0
		mov	[bp+var_ED], 0
		mov	[bp+var_EC], 0
		lea	ax, [bp+var_E8]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_DD], 0
		jz	short loc_8E42E
		cmp	[bp+var_E2], 0
		jz	short loc_8E42E
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E42E

loc_8E42E:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		lea	ax, [bp+var_D8]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_CD], 0
		jz	short loc_8E47A
		cmp	[bp+var_D2], 0
		jz	short loc_8E47A
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E47A

loc_8E47A:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		lea	ax, [bp+var_C8]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_BD], 0
		jz	short loc_8E4C6
		cmp	[bp+var_C2], 0
		jz	short loc_8E4C6
		push	0
		mov	al, [bp+var_BE]
		push	ax
		lea	ax, word ptr [bp+var_C2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E4C6

loc_8E4C6:
		mov	[bp+var_C2], 0
		mov	[bp+var_BD], 0
		mov	[bp+var_BC], 0
		lea	ax, [bp+var_B8]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_AD], 0
		jz	short loc_8E512
		cmp	[bp+var_B2], 0
		jz	short loc_8E512
		push	0
		mov	al, [bp+var_AE]
		push	ax
		lea	ax, word ptr [bp+var_B2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E512

loc_8E512:
		mov	[bp+var_B2], 0
		mov	[bp+var_AD], 0
		mov	[bp+var_AC], 0
		lea	ax, [bp+var_A8]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9D], 0
		jz	short loc_8E55E
		cmp	[bp+var_A2], 0
		jz	short loc_8E55E
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E55E

loc_8E55E:
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		cmp	[bp+var_93], 0
		jz	short loc_8E59D
		cmp	[bp+var_98], 0
		jz	short loc_8E59D
		push	0
		mov	al, [bp+var_94]
		push	ax
		lea	ax, word ptr [bp+var_98]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E59D

loc_8E59D:
		mov	[bp+var_98], 0
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		cmp	[bp+var_89], 0
		jz	short loc_8E5DC
		cmp	[bp+var_8E], 0
		jz	short loc_8E5DC
		push	0
		mov	al, [bp+var_8A]
		push	ax
		lea	ax, word ptr [bp+var_8E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E5DC

loc_8E5DC:
		mov	[bp+var_8E], 0
		mov	[bp+var_89], 0
		mov	[bp+var_88], 0
		cmp	[bp+var_7F], 0
		jz	short loc_8E619
		cmp	[bp+var_84], 0
		jz	short loc_8E619
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, word ptr [bp+var_84]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E619

loc_8E619:
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_8E652
		cmp	[bp+var_7A], 0
		jz	short loc_8E652
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, word ptr [bp+var_7A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E652

loc_8E652:
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		cmp	[bp+var_6B], 0
		jz	short loc_8E68A
		cmp	[bp+var_70], 0
		jz	short loc_8E68A
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E68A

loc_8E68A:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_8E6C2
		cmp	[bp+var_66], 0
		jz	short loc_8E6C2
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E6C2

loc_8E6C2:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_8E6FA
		cmp	[bp+var_5C], 0
		jz	short loc_8E6FA
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E6FA

loc_8E6FA:
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_8E732
		cmp	[bp+var_52], 0
		jz	short loc_8E732
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E732

loc_8E732:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_8E76A
		cmp	[bp+var_48], 0
		jz	short loc_8E76A
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E76A

loc_8E76A:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_8E7A2
		cmp	[bp+var_3E], 0
		jz	short loc_8E7A2
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E7A2

loc_8E7A2:
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		mov	[bp+var_CDA], 129Fh
		lea	ax, [bp+var_CDA]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_CC5], 0
		jz	short loc_8E7F1
		cmp	[bp+var_CCA], 0
		jz	short loc_8E7F1
		push	0
		mov	al, [bp+var_CC6]
		push	ax
		lea	ax, word ptr [bp+var_CCA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E7F1

loc_8E7F1:
		mov	[bp+var_CCA], 0
		mov	[bp+var_CC5], 0
		mov	[bp+var_CC4], 0
		lea	ax, [bp+var_4B4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_4B0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_4A6]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_27], 0
		jz	short loc_8E857
		cmp	[bp+var_2C], 0
		jz	short loc_8E857
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8E857

loc_8E857:
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		push	2
		lea	ax, [bp+var_42E]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_3B6]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_33E]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2C6]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_24E]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_18]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C8]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_E]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Midgame15_Play_85FE0		endp

; START OF FUNCTION CHUNK FOR Midgame15_Play_85FE0
off_8E8FA	dw offset loc_86251
		dw offset loc_863CA
		dw offset loc_863CA
		dw offset loc_863CA
		dw offset loc_863CA
; END OF FUNCTION CHUNK FOR Midgame15_Play_85FE0
ovr207		ends
