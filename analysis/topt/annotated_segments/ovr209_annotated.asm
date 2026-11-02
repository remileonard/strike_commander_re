ovr209		segment	para public 'OVERLAY' use16
		assume cs:ovr209
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, cinématique mid17 de Tactical Operations (2026-11-02) : script extrait par
; tools/midgame_extract.py dans analysis/topt/midgames/mid17.md et .json, fichier
; analysis/topt/midgames/iff. Fonction entière lue par exécution symbolique, pas commentée
; ligne à ligne.
; ==============================================================================================
Midgame17_Play_91BB0		proc far

var_DCA		= word ptr -0DCAh
var_DC8		= word ptr -0DC8h
var_DC6		= word ptr -0DC6h
var_DC4		= word ptr -0DC4h
var_DBA		= word ptr -0DBAh
var_D8A		= word ptr -0D8Ah
var_D5D		= dword ptr -0D5Dh
var_D59		= dword ptr -0D59h
var_D55		= dword ptr -0D55h
var_D50		= word ptr -0D50h
var_D48		= word ptr -0D48h
var_D44		= dword ptr -0D44h
var_D34		= word ptr -0D34h
var_D33		= word ptr -0D33h
var_D31		= byte ptr -0D31h
var_D2E		= word ptr -0D2Eh
var_D2C		= word ptr -0D2Ch
var_D2A		= word ptr -0D2Ah
var_D28		= word ptr -0D28h
var_D26		= dword ptr -0D26h
var_D22		= byte ptr -0D22h
var_D20		= word ptr -0D20h
var_D1E		= word ptr -0D1Eh
var_D1C		= word ptr -0D1Ch
var_D1A		= word ptr -0D1Ah
var_D18		= dword ptr -0D18h
var_D14		= byte ptr -0D14h
var_D12		= word ptr -0D12h
var_D10		= word ptr -0D10h
var_CFE		= word ptr -0CFEh
var_CF0		= word ptr -0CF0h
var_CD8		= word ptr -0CD8h
var_CD6		= word ptr -0CD6h
var_CC8		= dword ptr -0CC8h
var_CC4		= byte ptr -0CC4h
var_CC3		= byte ptr -0CC3h
var_CC2		= dword ptr -0CC2h
var_4BB		= dword ptr -4BBh
var_4B7		= dword ptr -4B7h
var_4B2		= word ptr -4B2h
var_4B0		= word ptr -4B0h
var_4AE		= word ptr -4AEh
var_4AC		= word ptr -4ACh
var_4AA		= dword ptr -4AAh
var_4A6		= byte ptr -4A6h
var_4A4		= word ptr -4A4h
var_42C		= word ptr -42Ch
var_3B4		= word ptr -3B4h
var_33C		= word ptr -33Ch
var_2C4		= word ptr -2C4h
var_24C		= word ptr -24Ch
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
var_168		= word ptr -168h
var_166		= word ptr -166h
var_164		= word ptr -164h
var_162		= word ptr -162h
var_160		= word ptr -160h
var_15E		= word ptr -15Eh
var_15C		= word ptr -15Ch
var_15A		= word ptr -15Ah
var_158		= word ptr -158h
var_156		= word ptr -156h
var_154		= word ptr -154h
var_152		= word ptr -152h
var_150		= word ptr -150h
var_14E		= word ptr -14Eh
var_14C		= word ptr -14Ch
var_14A		= word ptr -14Ah
var_148		= dword ptr -148h
var_144		= byte ptr -144h
var_143		= byte ptr -143h
var_142		= dword ptr -142h
var_140		= dword ptr -140h
var_13E		= dword ptr -13Eh
var_13A		= dword ptr -13Ah
var_138		= dword ptr -138h
var_134		= dword ptr -134h
var_130		= word ptr -130h
var_12E		= dword ptr -12Eh
var_12C		= dword ptr -12Ch
var_12A		= dword ptr -12Ah
var_126		= dword ptr -126h
var_124		= dword ptr -124h
var_120		= word ptr -120h
var_11E		= word ptr -11Eh
var_11C		= word ptr -11Ch
var_11A		= word ptr -11Ah
var_119		= word ptr -119h
var_118		= dword ptr -118h
var_116		= dword ptr -116h
var_112		= dword ptr -112h
var_110		= dword ptr -110h
var_10E		= dword ptr -10Eh
var_10A		= word ptr -10Ah
var_109		= word ptr -109h
var_108		= dword ptr -108h
var_106		= dword ptr -106h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FE		= dword ptr -0FEh
var_FC		= dword ptr -0FCh
var_FA		= dword ptr -0FAh
var_F8		= dword ptr -0F8h
var_F6		= dword ptr -0F6h
var_F4		= dword ptr -0F4h
var_F2		= dword ptr -0F2h
var_F0		= dword ptr -0F0h
var_EE		= dword ptr -0EEh
var_EC		= dword ptr -0ECh
var_EA		= dword ptr -0EAh
var_E8		= dword ptr -0E8h
var_E6		= dword ptr -0E6h
var_E4		= dword ptr -0E4h
var_E2		= dword ptr -0E2h
var_E0		= dword ptr -0E0h
var_DE		= dword ptr -0DEh
var_DC		= dword ptr -0DCh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D4		= dword ptr -0D4h
var_D0		= word ptr -0D0h
var_CE		= word ptr -0CEh
var_CC		= word ptr -0CCh
var_CA		= byte ptr -0CAh
var_C9		= word ptr -0C9h
var_C6		= dword ptr -0C6h
var_C2		= byte ptr -0C2h
var_C1		= byte ptr -0C1h
var_C0		= dword ptr -0C0h
var_BC		= word ptr -0BCh
var_BA		= byte ptr -0BAh
var_B9		= word ptr -0B9h
var_B6		= dword ptr -0B6h
var_B2		= byte ptr -0B2h
var_B1		= byte ptr -0B1h
var_B0		= dword ptr -0B0h
var_AC		= word ptr -0ACh
var_AA		= byte ptr -0AAh
var_A9		= word ptr -0A9h
var_A6		= dword ptr -0A6h
var_A2		= byte ptr -0A2h
var_A1		= byte ptr -0A1h
var_A0		= dword ptr -0A0h
var_9C		= word ptr -9Ch
var_9A		= byte ptr -9Ah
var_99		= word ptr -99h
var_96		= dword ptr -96h
var_92		= byte ptr -92h
var_91		= byte ptr -91h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= byte ptr -88h
var_87		= byte ptr -87h
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= byte ptr -7Eh
var_7D		= byte ptr -7Dh
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= byte ptr -74h
var_73		= byte ptr -73h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= byte ptr -66h
var_65		= byte ptr -65h
var_64		= dword ptr -64h
var_60		= word ptr -60h
var_5E		= byte ptr -5Eh
var_5D		= word ptr -5Dh
var_5A		= dword ptr -5Ah
var_56		= byte ptr -56h
var_55		= byte ptr -55h
var_54		= dword ptr -54h
var_50		= word ptr -50h
var_4E		= byte ptr -4Eh
var_4D		= word ptr -4Dh
var_4A		= dword ptr -4Ah
var_46		= byte ptr -46h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= byte ptr -3Eh
var_3D		= word ptr -3Dh
var_3A		= dword ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= byte ptr -2Ch
var_2A		= byte ptr -2Ah
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
		sub	sp, 0DBAh
		push	si
		push	di
		mov	[bp+var_2], 2B7Bh
		mov	byte_4F55C, 0
		mov	[bp+var_8], 0
		push	0C8h
		push	0Ah
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		mov	[bp+var_B], 0
		mov	[bp+var_C], 0
		mov	[bp+var_D], 0
		cmp	word_4CA5B, 0
		jz	short loc_91BF0
		mov	[bp+var_C], 1

loc_91BF0:
		mov	ax, word_4D36E
		mov	[bp+var_10], ax
		mov	[bp+var_1C6], 0
		mov	[bp+var_1C4], 0
		push	[bp+var_10]
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_1D4], 0
		mov	[bp+var_1D2], 0
		mov	[bp+var_1D0], 0
		mov	[bp+var_1CE], 0
		mov	[bp+var_1CC], 13Fh
		mov	[bp+var_1CA], 9Dh
		push	0
		lea	ax, [bp+var_1D4]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_1D4]
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
		mov	[bp+var_1C2], 0
		mov	[bp+var_1C0], 18h
		mov	[bp+var_1BE], 13Fh
		mov	[bp+var_1BC], 97h
		mov	byte ptr [bp+var_1E], 0
		mov	byte ptr [bp+var_1E+1], 0
		mov	[bp+var_1C], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid17
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1B8]
		push	ax
		lea	ax, [bp+var_24C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_24C]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgames_24
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1B8]
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
		push	offset aOptshps_6
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1B8]
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
		push	offset aOptpals_5
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1B8]
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
		push	offset aMid17voc
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_42C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		cmp	[bp+var_C], 0
		jz	short loc_91DD6
		push	ds
		lea	ax, [bp+var_1B8]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_91DD6
		push	1
		lea	ax, [bp+var_1B8]
		push	ax
		lea	ax, [bp+var_42C]
		push	ax
		mov	bx, [bp+var_42C]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_42C]
		push	ax
		call	sub_435F1
		add	sp, 2
		jmp	short loc_91DDA

loc_91DD6:
		mov	[bp+var_C], 0

loc_91DDA:
		mov	[bp+var_28], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		mov	al, byte_4CA58
		mov	[bp+var_2A], al
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_2A]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_91E15
		jmp	loc_92138

loc_91E15:
		shl	bx, 1
		jmp	cs:off_974BB[bx]	; switch jump

loc_91E1C:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1B8]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_91E4A
		jmp	loc_91F54

loc_91E4A:
		push	1
		lea	ax, [bp+var_1B8]
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
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_25
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_DBA]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_DBA], 480h
		mov	[bp+var_D59], 100h
		mov	[bp+var_D5D], 0
		mov	[bp+var_DBA], 498h
		push	1
		lea	ax, [bp+var_1B8]
		push	ax
		lea	ax, [bp+var_DBA]
		push	ax
		mov	bx, [bp+var_DBA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_91F1C

loc_91F06:
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_91F1C:
		cmp	si, 6Ah
		jle	short loc_91F06
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_DBA], 498h
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_DBA]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_91F54:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1B8]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_91F92
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_91F92
		mov	word_4F048, 5Ah

loc_91F92:
		jmp	loc_92138

loc_91F95:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1B8]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_91FC3
		jmp	loc_920D7

loc_91FC3:
		cmp	word_4CA5D, 0
		jnz	short loc_91FCD
		jmp	loc_920D7

loc_91FCD:
		push	1
		lea	ax, [bp+var_1B8]
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
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_26
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_DBA]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_DBA], 480h
		mov	[bp+var_D59], 100h
		mov	[bp+var_D5D], 0
		mov	[bp+var_DBA], 498h
		push	1
		lea	ax, [bp+var_1B8]
		push	ax
		lea	ax, [bp+var_DBA]
		push	ax
		mov	bx, [bp+var_DBA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_9209F

loc_92089:
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_9209F:
		cmp	si, 6Ah
		jle	short loc_92089
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_DBA], 498h
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_DBA]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_920D7:
		cmp	[bp+var_2A], 3
		jnz	short loc_920F8
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_92111

loc_920F8:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_92111:
		push	ds
		lea	ax, [bp+var_1B8]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_92136
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_92136
		mov	word_4F048, 0FFh

loc_92136:
		jmp	short loc_92138

loc_92138:
		mov	ax, word_4B556
		mov	[bp+var_30], ax
		mov	ax, word_4B558
		mov	[bp+var_2E], ax
		mov	al, byte_4B55A
		mov	[bp+var_2C], al
		cmp	[bp+var_D], 0
		jnz	short loc_92153
		jmp	loc_92258

loc_92153:
		mov	[bp+var_D1C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D1A], ax
		lea	ax, [bp+var_D1C]
		mov	word_4D392, ax
		mov	[bp+var_D1C], 1BCh
		mov	[bp+var_D18], 0
		mov	[bp+var_D14], 0
		mov	[bp+var_D20], 0
		mov	[bp+var_D1E], 0FFFFh
		push	word_4CA5D
		lea	ax, [bp+var_D20]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		xor	si, si
		jmp	loc_92234

loc_9219D:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		push	3
		lea	ax, word ptr [bp+var_DA]
		push	ax
		mov	al, byte ptr [bp+si+var_30]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_4A4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		lea	ax, word ptr [bp+var_DA]
		push	ax
		lea	ax, [bp+var_D20]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_D20]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_9221C
		cmp	[bp+var_DA], 0
		jz	short loc_9221C
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9221C

loc_9221C:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		inc	si

loc_92234:
		cmp	si, 5
		jge	short loc_9223C
		jmp	loc_9219D

loc_9223C:
		lea	ax, [bp+var_D20]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D1C]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_92258:
		mov	[bp+var_4AE], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_4AC], ax
		lea	ax, [bp+var_4AE]
		mov	word_4D392, ax
		mov	[bp+var_4AE], 1BCh
		mov	[bp+var_4AA], 0
		mov	[bp+var_4A6], 0
		mov	[bp+var_4B2], 0
		mov	[bp+var_4B0], 0FFFFh
		cmp	[bp+var_B], 0
		jnz	short loc_92295
		jmp	loc_92315

loc_92295:
		push	1
		lea	ax, [bp+var_1B8]
		push	ax
		lea	ax, [bp+var_D8A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_D8A]
		push	ax
		call	sub_435F1
		add	sp, 2
		cmp	[bp+var_C], 0
		jz	short loc_922C3
		mov	byte ptr [bp+var_D4+3], 0Eh
		jmp	short loc_922C8

loc_922C3:
		mov	byte ptr [bp+var_D4+3], 0Dh

loc_922C8:
		push	3
		lea	ax, word ptr [bp+var_28]
		push	ax
		mov	al, byte ptr [bp+var_D4+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_D8A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_4B2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_28]
		push	ax
		lea	ax, [bp+var_4B2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, [bp+var_D8A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_92315:
		mov	[bp+var_CD8], 129Fh
		mov	[bp+var_CC8], 0
		mov	[bp+var_CC4], 2
		mov	[bp+var_CC3], 0
		mov	[bp+var_CC2], 0
		mov	[bp+var_CD6], 0
		mov	[bp+var_CD8], 1FA5h
		xor	eax, eax
		mov	[bp+var_4BB], eax
		mov	[bp+var_4B7], eax
		cmp	[bp+var_C], 0
		jz	short loc_9236A
		push	word_4CA5B
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		jmp	loc_9265E

loc_9236A:
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_27
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_DBA]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_DBA], 480h
		mov	[bp+var_D59], 100h
		mov	[bp+var_D5D], 0
		mov	[bp+var_DBA], 498h
		push	1
		lea	ax, [bp+var_1B8]
		push	ax
		lea	ax, [bp+var_DBA]
		push	ax
		mov	bx, [bp+var_DBA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3731474Dh
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		xor	si, si
		jmp	short loc_9243B

loc_923F2:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	ax, [bp+var_D48]
		mov	word ptr [bp+var_D4+2], ax
		movsx	eax, word ptr [bp+var_D4+2]
		push	eax
		push	ds
		mov	ax, [bp+var_A]
		imul	si
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_D44]
		mov	[bp+var_D55], eax
		inc	si

loc_9243B:
		cmp	si, 0Ah
		jl	short loc_923F2
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9248E
		push	[bp+arg_4]
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_92545

loc_9248E:
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_924CE
		push	[bp+arg_2]
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_92545

loc_924CE:
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9250E
		push	[bp+arg_0]
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_92545

loc_9250E:
		mov	ax, [bp+var_A]
		shl	ax, 1
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_92545:
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_92585
		push	[bp+arg_0]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_9263C

loc_92585:
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_925C4
		push	[bp+arg_2]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_9263C

loc_925C4:
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_92603
		push	[bp+arg_4]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_9263C

loc_92603:
		mov	ax, [bp+var_A]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_9263C:
		mov	[bp+var_DBA], 498h
		lea	ax, [bp+var_DBA]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_DBA]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_9265E:
		mov	[bp+var_3A], 0
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		push	2
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	15h
		lea	ax, [bp+var_3B4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_3D], 0
		lea	ax, word ptr [bp+var_3A]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_4A], 0
		mov	[bp+var_46], 2
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	2
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_4D], 0
		lea	ax, word ptr [bp+var_4A]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_5A], 0
		mov	[bp+var_56], 2
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	0
		push	2
		lea	ax, word ptr [bp+var_5A]
		push	ax
		call	ConvData_LoadNormalOrNight_10C9F
		add	sp, 6
		mov	[bp+var_5D], 0
		lea	ax, word ptr [bp+var_5A]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_6A], 0
		mov	[bp+var_66], 2
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	ds
		push	offset unk_4B5AD
		push	ds
		push	offset aConvfontShp_6
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_1B8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_1B8]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_6E+2], dx
		mov	word ptr [bp+var_6E], ax
		mov	eax, [bp+var_6E]
		mov	[bp+var_6A], eax
		mov	[bp+var_66], 2
		mov	[bp+var_65], 1
		mov	[bp+var_64], 0
		lea	ax, word ptr [bp+var_6A]
		push	ax
		lea	ax, [bp+var_CF0]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		lea	ax, [bp+var_CF0]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC8], 98h
		mov	[bp+var_DC6], 13Fh
		mov	[bp+var_DC4], 0C7h
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0C8h
		lea	ax, [bp+var_D12]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_78], 0
		mov	[bp+var_74], 2
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		push	3
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	3
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_82], 0
		mov	[bp+var_7E], 2
		mov	[bp+var_7D], 0
		mov	[bp+var_7C], 0
		push	3
		lea	ax, word ptr [bp+var_82]
		push	ax
		push	32h
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_8C], 0
		mov	[bp+var_88], 2
		mov	[bp+var_87], 0
		mov	[bp+var_86], 0
		push	3
		lea	ax, word ptr [bp+var_8C]
		push	ax
		push	4
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_96], 0
		mov	[bp+var_92], 2
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	9
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_99], 0
		lea	ax, word ptr [bp+var_96]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_A6], 0
		mov	[bp+var_A2], 2
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		push	2
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	0Ah
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_A9], 0
		lea	ax, word ptr [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_B6], 0
		mov	[bp+var_B2], 2
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		push	2
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	0Bh
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_B9], 0
		lea	ax, word ptr [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_C6], 0
		mov	[bp+var_C2], 2
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		push	0
		push	2
		lea	ax, word ptr [bp+var_C6]
		push	ax
		call	ConvData_LoadNormalOrNight_10C9F
		add	sp, 6
		mov	[bp+var_C9], 0
		lea	ax, word ptr [bp+var_C6]
		push	ax
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_92999
		jmp	loc_92DDF

loc_92999:
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C1], 0
		jz	short loc_929CE
		cmp	[bp+var_C6], 0
		jz	short loc_929CE
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_929CE

loc_929CE:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_B1], 0
		jz	short loc_92A1A
		cmp	[bp+var_B6], 0
		jz	short loc_92A1A
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92A1A

loc_92A1A:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_92A66
		cmp	[bp+var_A6], 0
		jz	short loc_92A66
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92A66

loc_92A66:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_92AB2
		cmp	[bp+var_96], 0
		jz	short loc_92AB2
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92AB2

loc_92AB2:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		cmp	[bp+var_87], 0
		jz	short loc_92AF1
		cmp	[bp+var_8C], 0
		jz	short loc_92AF1
		push	0
		mov	al, [bp+var_88]
		push	ax
		lea	ax, word ptr [bp+var_8C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92AF1

loc_92AF1:
		mov	[bp+var_8C], 0
		mov	[bp+var_87], 0
		mov	[bp+var_86], 0
		cmp	[bp+var_7D], 0
		jz	short loc_92B2E
		cmp	[bp+var_82], 0
		jz	short loc_92B2E
		push	0
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, word ptr [bp+var_82]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92B2E

loc_92B2E:
		mov	[bp+var_82], 0
		mov	[bp+var_7D], 0
		mov	[bp+var_7C], 0
		cmp	[bp+var_73], 0
		jz	short loc_92B67
		cmp	[bp+var_78], 0
		jz	short loc_92B67
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92B67

loc_92B67:
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		lea	ax, [bp+var_D10]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_CF0]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_92BBB
		cmp	[bp+var_6A], 0
		jz	short loc_92BBB
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92BBB

loc_92BBB:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_55], 0
		jz	short loc_92BFF
		cmp	[bp+var_5A], 0
		jz	short loc_92BFF
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92BFF

loc_92BFF:
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_45], 0
		jz	short loc_92C43
		cmp	[bp+var_4A], 0
		jz	short loc_92C43
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92C43

loc_92C43:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_35], 0
		jz	short loc_92C87
		cmp	[bp+var_3A], 0
		jz	short loc_92C87
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92C87

loc_92C87:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CD8], 129Fh
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_CC3], 0
		jz	short loc_92CD6
		cmp	[bp+var_CC8], 0
		jz	short loc_92CD6
		push	0
		mov	al, [bp+var_CC4]
		push	ax
		lea	ax, word ptr [bp+var_CC8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92CD6

loc_92CD6:
		mov	[bp+var_CC8], 0
		mov	[bp+var_CC3], 0
		mov	[bp+var_CC2], 0
		lea	ax, [bp+var_4B2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_92D3C
		cmp	[bp+var_28], 0
		jz	short loc_92D3C
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_92D3C

loc_92D3C:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
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
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
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
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_92DDF:
		cmp	[bp+var_B], 0
		jz	short loc_92E29
		mov	ax, word_4F048
		mov	[bp+var_CE], ax
		mov	[bp+var_D0], 0
		cmp	[bp+var_4B2], 0
		jz	short loc_92E29
		push	[bp+var_4B0]
		mov	bx, [bp+var_4B2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_D0]
		push	[bp+var_CE]
		push	[bp+var_4B0]
		mov	bx, [bp+var_4B2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_92E29

loc_92E29:
		mov	byte ptr [bp+var_D4+3], 0
		mov	[bp+var_DC], 0
		mov	byte ptr [bp+var_DA+2], 2
		mov	byte ptr [bp+var_DA+3], 0
		mov	[bp+var_D6], 0
		mov	[bp+var_D1C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D1A], ax
		lea	ax, [bp+var_D1C]
		mov	word_4D392, ax
		mov	[bp+var_D1C], 1BCh
		mov	[bp+var_D18], 0
		mov	[bp+var_D14], 0
		mov	[bp+var_D20], 0
		mov	[bp+var_D1E], 0FFFFh
		cmp	[bp+var_D], 0
		jz	short loc_92EBF
		push	3
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	16h
		lea	ax, [bp+var_4A4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D20]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_DC]
		push	ax
		lea	ax, [bp+var_D20]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_92EBF:
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2], 2
		mov	byte ptr [bp+var_E2+1], 0
		mov	[bp+var_E0], 0
		push	3
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	0Ch
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_F0], 0
		mov	byte ptr [bp+var_EC], 2
		mov	byte ptr [bp+var_EC+1], 0
		mov	[bp+var_EA], 0
		push	3
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	0Dh
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_FA], 0
		mov	byte ptr [bp+var_F6], 2
		mov	byte ptr [bp+var_F6+1], 0
		mov	[bp+var_F4], 0
		push	3
		lea	ax, word ptr [bp+var_FA]
		push	ax
		push	0Eh
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_104], 0
		mov	byte ptr [bp+var_100], 2
		mov	byte ptr [bp+var_100+1], 0
		mov	[bp+var_FE], 0
		push	3
		lea	ax, word ptr [bp+var_104]
		push	ax
		push	0Fh
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_10E], 0
		mov	byte ptr [bp+var_10A], 2
		mov	byte ptr [bp+var_109], 0
		mov	[bp+var_108], 0
		push	3
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	10h
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_118], 0
		mov	byte ptr [bp+var_116+2], 2
		mov	byte ptr [bp+var_116+3], 0
		mov	[bp+var_112], 0
		push	3
		lea	ax, word ptr [bp+var_118]
		push	ax
		push	11h
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	9
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_11A], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	si, ax
		push	0FFE9h
		push	0
		lea	ax, word ptr [bp+var_FA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_11C], ax
		push	0FFE9h
		push	0
		lea	ax, word ptr [bp+var_104]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_11E], ax
		push	0FFE9h
		push	0
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_120], ax
		push	0FFE9h
		push	0
		lea	ax, word ptr [bp+var_118]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_124+2], ax
		push	[bp+var_11A]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_11C]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_11E]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	[bp+var_AC]
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_9C]
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9C]
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
		mov	word ptr [si+1Bh], 0
		jmp	loc_932CB

loc_9312A:
		mov	ax, word ptr [bp+var_D26+1]
		mov	word ptr [bp+var_124], ax
		cmp	word ptr [bp+var_124], 6
		jnz	short loc_93188
		mov	word ptr [si+1Bh], 1
		cmp	[bp+var_D], 0
		jz	short loc_93188
		mov	ax, word_4EFA0
		mov	word ptr [bp+var_126], ax
		mov	word ptr [bp+var_12A+2], 0
		cmp	[bp+var_D20], 0
		jz	short loc_93188
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_12A+2]
		push	word ptr [bp+var_126]
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_93188

loc_93188:
		cmp	word ptr [bp+var_124], 8
		jnz	short loc_931B6
		mov	word ptr [si+1Bh], 0
		cmp	[bp+var_D], 0
		jz	short loc_931B6
		cmp	[bp+var_D20], 0
		jz	short loc_931B6
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_931B6

loc_931B6:
		cmp	word ptr [bp+var_124], 0Ah
		jnz	short loc_9320C
		mov	word ptr [si+1Bh], 1
		cmp	[bp+var_D], 0
		jz	short loc_9320C
		mov	ax, word_4EFA0
		mov	word ptr [bp+var_12A], ax
		mov	word ptr [bp+var_12C], 0
		cmp	[bp+var_D20], 0
		jz	short loc_9320C
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_12C]
		push	word ptr [bp+var_12A]
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_9320C

loc_9320C:
		cmp	word ptr [bp+var_124], 0Bh
		jnz	short loc_9323A
		mov	word ptr [si+1Bh], 0
		cmp	[bp+var_D], 0
		jz	short loc_9323A
		cmp	[bp+var_D20], 0
		jz	short loc_9323A
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_9323A

loc_9323A:
		cmp	word ptr [bp+var_124], 0Dh
		jnz	short loc_93290
		mov	word ptr [si+1Bh], 1
		cmp	[bp+var_D], 0
		jz	short loc_93290
		mov	ax, word_4EFA0
		mov	word ptr [bp+var_12E], ax
		mov	[bp+var_130], 0
		cmp	[bp+var_D20], 0
		jz	short loc_93290
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_130]
		push	word ptr [bp+var_12E]
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_93290

loc_93290:
		cmp	word ptr [bp+var_124], 0Fh
		jnz	short loc_932BE
		mov	word ptr [si+1Bh], 0
		cmp	[bp+var_D], 0
		jz	short loc_932BE
		cmp	[bp+var_D20], 0
		jz	short loc_932BE
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_932BE

loc_932BE:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_932CB:
		cmp	word ptr [bp+var_D26+1], 10h
		jnb	short loc_932D9
		cmp	byte ptr [bp+var_D26+3], 0
		jz	short loc_932DE

loc_932D9:
		mov	ax, 1
		jmp	short loc_932E0

loc_932DE:
		xor	ax, ax

loc_932E0:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_932E9
		jmp	loc_9312A

loc_932E9:
		mov	word ptr [bp+var_D26+1], 0
		cmp	[bp+var_C], 0
		jnz	short loc_932F8
		jmp	loc_9366A

loc_932F8:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_12C], 0
		mov	byte ptr [bp+var_12A+2], 2
		mov	byte ptr [bp+var_12A+3], 0
		mov	[bp+var_126], 0
		push	2
		lea	ax, word ptr [bp+var_12C]
		push	ax
		push	2
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_12C]
		push	ax
		lea	ax, [bp+var_CD8]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		mov	word ptr [bp+var_12E], 0
		jmp	short loc_93384

loc_93351:
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_130], ax
		mov	ax, [bp+var_130]
		mov	[si+1Bh], ax
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_12E]

loc_93384:
		cmp	word ptr [bp+var_12E], 4
		jl	short loc_93351
		push	0FFFFh
		lea	ax, [bp+var_CD8]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		mov	word ptr [bp+var_12E], 0
		jmp	loc_9349A

loc_933A3:
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_134+2], ax
		mov	ax, word ptr [bp+var_134+2]
		mov	[si+1Bh], ax
		cmp	word ptr [bp+var_12E], 2
		jnz	short loc_93416
		cmp	[bp+var_D], 0
		jz	short loc_93416
		mov	ax, word_4EFA0
		mov	word ptr [bp+var_134], ax
		mov	word ptr [bp+var_138+2], 0
		cmp	[bp+var_D20], 0
		jz	short loc_93416
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_138+2]
		push	word ptr [bp+var_134]
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_93416

loc_93416:
		cmp	word ptr [bp+var_12E], 13h
		jnz	short loc_93461
		push	[bp+var_11C]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	[bp+var_11E]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	[bp+var_120]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_124+2]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_93461:
		mov	ax, word ptr [bp+var_12E]
		inc	word ptr [bp+var_12E]
		cmp	ax, 0Ah
		jnz	short loc_93480
		mov	bx, [bp+var_120]
		mov	word ptr [bx+1Bh], 1
		mov	bx, word ptr [bp+var_124+2]
		mov	word ptr [bx+1Bh], 1

loc_93480:
		jmp	short loc_9348D
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9348D
		jmp	short loc_934AE

loc_9348D:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9349A:
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jz	short loc_934AE
		jmp	loc_933A3

loc_934AE:
		cmp	[bp+var_D], 0
		jz	short loc_934D0
		cmp	[bp+var_D20], 0
		jz	short loc_934D0
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_934D0

loc_934D0:
		mov	word ptr [si+1Bh], 0
		mov	word ptr [bp+var_12E], 0
		jmp	short loc_934EE

loc_934DD:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_12E]

loc_934EE:
		cmp	word ptr [bp+var_12E], 4
		jl	short loc_934DD
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13E+2], 2
		mov	byte ptr [bp+var_13E+3], 0
		mov	[bp+var_13A], 0
		push	2
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	0
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_140]
		push	ax
		lea	ax, [bp+var_CD8]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		mov	word ptr [bp+var_12E], 0
		jmp	short loc_93552

loc_93541:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_12E]

loc_93552:
		cmp	word ptr [bp+var_12E], 4
		jl	short loc_93541
		push	0FFFFh
		lea	ax, [bp+var_CD8]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_935AB

loc_9356A:
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_142], ax
		mov	bx, word ptr [bp+var_124+2]
		mov	ax, word ptr [bp+var_142]
		mov	[bx+1Bh], ax
		jmp	short loc_9359E
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9359E
		jmp	short loc_935BC

loc_9359E:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_935AB:
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_9356A

loc_935BC:
		mov	word ptr [bp+var_12E], 0
		jmp	short loc_935D5

loc_935C4:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_12E]

loc_935D5:
		cmp	word ptr [bp+var_12E], 4
		jl	short loc_935C4
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_13E+3], 0
		jz	short loc_93611
		cmp	[bp+var_140], 0
		jz	short loc_93611
		push	0
		mov	al, byte ptr [bp+var_13E+2]
		push	ax
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93611

loc_93611:
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13E+3], 0
		mov	[bp+var_13A], 0
		cmp	byte ptr [bp+var_12A+3], 0
		jz	short loc_93650
		cmp	[bp+var_12C], 0
		jz	short loc_93650
		push	0
		mov	al, byte ptr [bp+var_12A+2]
		push	ax
		lea	ax, word ptr [bp+var_12C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93650

loc_93650:
		mov	[bp+var_12C], 0
		mov	byte ptr [bp+var_12A+3], 0
		mov	[bp+var_126], 0
		jmp	loc_93B90

loc_9366A:
		push	23h
		push	[bp+var_CFE]
		mov	bx, [bp+var_CFE]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], 3Eh
		mov	ax, word ptr [bp+var_D26+1]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_937FD

loc_936A0:
		mov	ax, word ptr [bp+var_D26+1]
		mov	word ptr [bp+var_124], ax
		mov	ax, [bp+var_4]
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_93713
		cmp	[bp+var_D], 0
		jz	short loc_936FE
		mov	ax, word_4EFA0
		mov	word ptr [bp+var_126], ax
		mov	word ptr [bp+var_12A+2], 0
		cmp	[bp+var_D20], 0
		jz	short loc_936FE
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_12A+2]
		push	word ptr [bp+var_126]
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_936FE

loc_936FE:
		push	[bp+var_8]
		lea	ax, [bp+var_D12]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		mov	word ptr [si+1Bh], 1

loc_93713:
		mov	ax, [bp+var_4]
		add	ax, 0Eh
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_93763
		push	[bp+var_11C]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	[bp+var_11E]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	[bp+var_120]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_124+2]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_93763:
		mov	ax, [bp+var_4]
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_93781
		mov	bx, [bp+var_120]
		mov	word ptr [bx+1Bh], 1
		mov	bx, word ptr [bp+var_124+2]
		mov	word ptr [bx+1Bh], 1

loc_93781:
		mov	ax, di
		add	ax, 0FFFDh
		cmp	ax, word ptr [bp+var_124]
		jge	short loc_93791
		mov	word ptr [si+1Bh], 0

loc_93791:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_937BC
		cmp	[bp+var_D], 0
		jz	short loc_937BC
		cmp	[bp+var_D20], 0
		jz	short loc_937BC
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_937BC

loc_937BC:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_937D4
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_937D4:
		jmp	short loc_937F0
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_937F0
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_9381A

loc_937F0:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_937FD:
		cmp	word ptr [bp+var_D26+1], di
		jnb	short loc_9380A
		cmp	byte ptr [bp+var_D26+3], 0
		jz	short loc_9380F

loc_9380A:
		mov	ax, 1
		jmp	short loc_93811

loc_9380F:
		xor	ax, ax

loc_93811:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9381A
		jmp	loc_936A0

loc_9381A:
		cmp	[bp+var_11C], 0
		jz	short loc_93834
		push	3
		push	[bp+var_11C]
		mov	bx, [bp+var_11C]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_93834

loc_93834:
		cmp	[bp+var_11E], 0
		jz	short loc_9384E
		push	3
		push	[bp+var_11E]
		mov	bx, [bp+var_11E]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_9384E

loc_9384E:
		mov	word ptr [si+1Bh], 1
		mov	[bp+var_6], 42h
		mov	ax, word ptr [bp+var_D26+1]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_93971

loc_93877:
		mov	ax, word ptr [bp+var_D26+1]
		mov	word ptr [bp+var_124], ax
		mov	ax, [bp+var_4]
		inc	ax
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_938D3
		cmp	[bp+var_D], 0
		jz	short loc_938D3
		mov	ax, word_4EFA0
		mov	word ptr [bp+var_126], ax
		mov	word ptr [bp+var_12A+2], 0
		cmp	[bp+var_D20], 0
		jz	short loc_938D3
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_12A+2]
		push	word ptr [bp+var_126]
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_938D3

loc_938D3:
		mov	ax, [bp+var_4]
		add	ax, 2
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_938F3
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_D12]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_938F3:
		mov	ax, di
		add	ax, 0FFFDh
		cmp	ax, word ptr [bp+var_124]
		jge	short loc_93903
		mov	word ptr [si+1Bh], 0

loc_93903:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_9391D
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9391D:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_93948
		cmp	[bp+var_D], 0
		jz	short loc_93948
		cmp	[bp+var_D20], 0
		jz	short loc_93948
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_93948

loc_93948:
		jmp	short loc_93964
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_93964
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_9398E

loc_93964:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_93971:
		cmp	word ptr [bp+var_D26+1], di
		jnb	short loc_9397E
		cmp	byte ptr [bp+var_D26+3], 0
		jz	short loc_93983

loc_9397E:
		mov	ax, 1
		jmp	short loc_93985

loc_93983:
		xor	ax, ax

loc_93985:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9398E
		jmp	loc_93877

loc_9398E:
		push	0Fh
		push	[bp+var_CFE]
		mov	bx, [bp+var_CFE]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], 23h
		mov	ax, word ptr [bp+var_D26+1]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_93A79

loc_939C4:
		mov	ax, word ptr [bp+var_D26+1]
		mov	word ptr [bp+var_124], ax
		mov	ax, [bp+var_4]
		add	ax, 6
		cmp	ax, word ptr [bp+var_124]
		jge	short loc_939FF
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_126], ax
		mov	bx, word ptr [bp+var_124+2]
		mov	ax, word ptr [bp+var_126]
		mov	[bx+1Bh], ax

loc_939FF:
		mov	ax, [bp+var_4]
		add	ax, 6
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_93A24
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D12]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_93A24:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_93A3C
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_93A3C:
		mov	ax, di
		add	ax, 0FFFAh
		cmp	ax, word ptr [bp+var_124]
		jge	short loc_93A50
		mov	bx, word ptr [bp+var_124+2]
		mov	word ptr [bx+1Bh], 1

loc_93A50:
		jmp	short loc_93A6C
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_93A6C
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_93A96

loc_93A6C:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_93A79:
		cmp	word ptr [bp+var_D26+1], di
		jnb	short loc_93A86
		cmp	byte ptr [bp+var_D26+3], 0
		jz	short loc_93A8B

loc_93A86:
		mov	ax, 1
		jmp	short loc_93A8D

loc_93A8B:
		xor	ax, ax

loc_93A8D:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_93A96
		jmp	loc_939C4

loc_93A96:
		mov	[bp+var_6], 26h
		mov	ax, word ptr [bp+var_D26+1]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_93B73

loc_93ABA:
		mov	ax, word ptr [bp+var_D26+1]
		mov	word ptr [bp+var_124], ax
		mov	ax, [bp+var_4]
		add	ax, 6
		cmp	ax, word ptr [bp+var_124]
		jge	short loc_93AF5
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_126], ax
		mov	bx, word ptr [bp+var_124+2]
		mov	ax, word ptr [bp+var_126]
		mov	[bx+1Bh], ax

loc_93AF5:
		mov	ax, [bp+var_4]
		add	ax, 6
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_93B1C
		mov	ax, [bp+var_A]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D12]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_93B1C:
		mov	ax, di
		add	ax, 0FFFAh
		cmp	ax, word ptr [bp+var_124]
		jge	short loc_93B30
		mov	bx, word ptr [bp+var_124+2]
		mov	word ptr [bx+1Bh], 1

loc_93B30:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_124]
		jnz	short loc_93B4A
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_93B4A:
		jmp	short loc_93B66
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_93B66
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_93B90

loc_93B66:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_93B73:
		cmp	word ptr [bp+var_D26+1], di
		jnb	short loc_93B80
		cmp	byte ptr [bp+var_D26+3], 0
		jz	short loc_93B85

loc_93B80:
		mov	ax, 1
		jmp	short loc_93B87

loc_93B85:
		xor	ax, ax

loc_93B87:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_93B90
		jmp	loc_93ABA

loc_93B90:
		push	0
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_116+3], 0
		jz	short loc_93BC7
		cmp	[bp+var_118], 0
		jz	short loc_93BC7
		push	0
		mov	al, byte ptr [bp+var_116+2]
		push	ax
		lea	ax, word ptr [bp+var_118]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93BC7

loc_93BC7:
		mov	[bp+var_118], 0
		mov	byte ptr [bp+var_116+3], 0
		mov	[bp+var_112], 0
		cmp	byte ptr [bp+var_109], 0
		jz	short loc_93C06
		cmp	[bp+var_10E], 0
		jz	short loc_93C06
		push	0
		mov	al, byte ptr [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93C06

loc_93C06:
		mov	[bp+var_10E], 0
		mov	byte ptr [bp+var_109], 0
		mov	[bp+var_108], 0
		cmp	byte ptr [bp+var_100+1], 0
		jz	short loc_93C45
		cmp	[bp+var_104], 0
		jz	short loc_93C45
		push	0
		mov	al, byte ptr [bp+var_100]
		push	ax
		lea	ax, word ptr [bp+var_104]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93C45

loc_93C45:
		mov	[bp+var_104], 0
		mov	byte ptr [bp+var_100+1], 0
		mov	[bp+var_FE], 0
		cmp	byte ptr [bp+var_F6+1], 0
		jz	short loc_93C84
		cmp	[bp+var_FA], 0
		jz	short loc_93C84
		push	0
		mov	al, byte ptr [bp+var_F6]
		push	ax
		lea	ax, word ptr [bp+var_FA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93C84

loc_93C84:
		mov	[bp+var_FA], 0
		mov	byte ptr [bp+var_F6+1], 0
		mov	[bp+var_F4], 0
		cmp	byte ptr [bp+var_EC+1], 0
		jz	short loc_93CC3
		cmp	[bp+var_F0], 0
		jz	short loc_93CC3
		push	0
		mov	al, byte ptr [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93CC3

loc_93CC3:
		mov	[bp+var_F0], 0
		mov	byte ptr [bp+var_EC+1], 0
		mov	[bp+var_EA], 0
		cmp	byte ptr [bp+var_E2+1], 0
		jz	short loc_93D02
		cmp	[bp+var_E6], 0
		jz	short loc_93D02
		push	0
		mov	al, byte ptr [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93D02

loc_93D02:
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2+1], 0
		mov	[bp+var_E0], 0
		lea	ax, [bp+var_D20]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D1C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_DA+3], 0
		jz	short loc_93D5D
		cmp	[bp+var_DC], 0
		jz	short loc_93D5D
		push	0
		mov	al, byte ptr [bp+var_DA+2]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93D5D

loc_93D5D:
		mov	[bp+var_DC], 0
		mov	byte ptr [bp+var_DA+3], 0
		mov	[bp+var_D6], 0
		cmp	byte_4F55C, 0
		jnz	short loc_93D7E
		jmp	loc_941C4

loc_93D7E:
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C1], 0
		jz	short loc_93DB3
		cmp	[bp+var_C6], 0
		jz	short loc_93DB3
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93DB3

loc_93DB3:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_B1], 0
		jz	short loc_93DFF
		cmp	[bp+var_B6], 0
		jz	short loc_93DFF
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93DFF

loc_93DFF:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_93E4B
		cmp	[bp+var_A6], 0
		jz	short loc_93E4B
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93E4B

loc_93E4B:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_93E97
		cmp	[bp+var_96], 0
		jz	short loc_93E97
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93E97

loc_93E97:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		cmp	[bp+var_87], 0
		jz	short loc_93ED6
		cmp	[bp+var_8C], 0
		jz	short loc_93ED6
		push	0
		mov	al, [bp+var_88]
		push	ax
		lea	ax, word ptr [bp+var_8C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93ED6

loc_93ED6:
		mov	[bp+var_8C], 0
		mov	[bp+var_87], 0
		mov	[bp+var_86], 0
		cmp	[bp+var_7D], 0
		jz	short loc_93F13
		cmp	[bp+var_82], 0
		jz	short loc_93F13
		push	0
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, word ptr [bp+var_82]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93F13

loc_93F13:
		mov	[bp+var_82], 0
		mov	[bp+var_7D], 0
		mov	[bp+var_7C], 0
		cmp	[bp+var_73], 0
		jz	short loc_93F4C
		cmp	[bp+var_78], 0
		jz	short loc_93F4C
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93F4C

loc_93F4C:
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		lea	ax, [bp+var_D10]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_CF0]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_93FA0
		cmp	[bp+var_6A], 0
		jz	short loc_93FA0
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93FA0

loc_93FA0:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_55], 0
		jz	short loc_93FE4
		cmp	[bp+var_5A], 0
		jz	short loc_93FE4
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_93FE4

loc_93FE4:
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_45], 0
		jz	short loc_94028
		cmp	[bp+var_4A], 0
		jz	short loc_94028
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94028

loc_94028:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_35], 0
		jz	short loc_9406C
		cmp	[bp+var_3A], 0
		jz	short loc_9406C
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9406C

loc_9406C:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CD8], 129Fh
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_CC3], 0
		jz	short loc_940BB
		cmp	[bp+var_CC8], 0
		jz	short loc_940BB
		push	0
		mov	al, [bp+var_CC4]
		push	ax
		lea	ax, word ptr [bp+var_CC8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_940BB

loc_940BB:
		mov	[bp+var_CC8], 0
		mov	[bp+var_CC3], 0
		mov	[bp+var_CC2], 0
		lea	ax, [bp+var_4B2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_94121
		cmp	[bp+var_28], 0
		jz	short loc_94121
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94121

loc_94121:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
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
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
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
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_941C4:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		mov	[bp+var_D1C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D1A], ax
		lea	ax, [bp+var_D1C]
		mov	word_4D392, ax
		mov	[bp+var_D1C], 1BCh
		mov	[bp+var_D18], 0
		mov	[bp+var_D14], 0
		mov	[bp+var_D20], 0
		mov	[bp+var_D1E], 0FFFFh
		cmp	[bp+var_D], 0
		jz	short loc_94255
		push	3
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	16h
		lea	ax, [bp+var_4A4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D20]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_DA]
		push	ax
		lea	ax, [bp+var_D20]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_94255:
		mov	[bp+var_E4], 0
		mov	byte ptr [bp+var_E0], 2
		mov	byte ptr [bp+var_E0+1], 0
		mov	[bp+var_DE], 0
		push	3
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	12h
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	14h
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	si, ax
		push	si
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	[bp+var_BC]
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_CC]
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CC]
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
		push	0E0h
		push	[bp+var_CFE]
		mov	bx, [bp+var_CFE]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	word ptr [si+1Bh], 0
		mov	word ptr [bp+var_E6], 0
		push	0
		call	CRT_Time_F92
		add	sp, 2
		push	ax
		call	CRT_Srand_7E5
		add	sp, 2
		mov	word ptr [bp+var_E8], 4
		cmp	[bp+var_C], 0
		jnz	short loc_9435A
		jmp	loc_9454E

loc_9435A:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_F2], 0
		mov	byte ptr [bp+var_EE], 2
		mov	byte ptr [bp+var_EE+1], 0
		mov	[bp+var_EC], 0
		push	2
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	3
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_F2]
		push	ax
		lea	ax, [bp+var_CD8]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		mov	word ptr [bp+var_F4], 0
		jmp	short loc_943EA

loc_943B3:
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_F6], ax
		mov	ax, word ptr [bp+var_F6]
		mov	[si+1Bh], ax
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_F4]

loc_943EA:
		cmp	word ptr [bp+var_F4], 4
		jl	short loc_943B3
		cmp	[bp+var_D], 0
		jz	short loc_9443B
		mov	ax, word_4EF94
		mov	word ptr [bp+var_F8], ax
		mov	word ptr [bp+var_FA], 0
		cmp	[bp+var_D20], 0
		jz	short loc_9443B
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_FA]
		push	word ptr [bp+var_F8]
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_9443B

loc_9443B:
		push	0FFFFh
		lea	ax, [bp+var_CD8]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_9448C

loc_9444C:
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_FC], ax
		mov	ax, word ptr [bp+var_FC]
		mov	[si+1Bh], ax
		jmp	short loc_9447F
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9447F
		jmp	short loc_9449D

loc_9447F:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9448C:
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_9444C

loc_9449D:
		cmp	[bp+var_D], 0
		jz	short loc_944BF
		cmp	[bp+var_D20], 0
		jz	short loc_944BF
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_944BF

loc_944BF:
		mov	word ptr [bp+var_F4], 0
		jmp	short loc_944F8

loc_944C7:
		cmp	word ptr [bp+var_E8], 1
		jge	short loc_944D4
		mov	word ptr [bp+var_E8], 1

loc_944D4:
		mov	ax, word ptr [bp+var_E8]
		mov	word ptr [bp+var_FE], ax
		dec	word ptr [bp+var_E8]
		mov	ax, word ptr [bp+var_FE]
		mov	[si+1Bh], ax
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_F4]

loc_944F8:
		cmp	word ptr [bp+var_F4], 5
		jl	short loc_944C7
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_EE+1], 0
		jz	short loc_94534
		cmp	[bp+var_F2], 0
		jz	short loc_94534
		push	0
		mov	al, byte ptr [bp+var_EE]
		push	ax
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94534

loc_94534:
		mov	[bp+var_F2], 0
		mov	byte ptr [bp+var_EE+1], 0
		mov	[bp+var_EC], 0
		jmp	loc_9486A

loc_9454E:
		mov	[bp+var_6], 46h
		mov	ax, word ptr [bp+var_D26+1]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_946C0

loc_94572:
		mov	ax, word ptr [bp+var_D26+1]
		mov	word ptr [bp+var_EA], ax
		mov	ax, di
		add	ax, 0FFF6h
		cmp	ax, word ptr [bp+var_EA]
		jle	short loc_945B5
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_E6], ax
		mov	ax, word ptr [bp+var_E6]
		mov	word ptr [bp+var_EC], ax
		mov	ax, word ptr [bp+var_EC]
		mov	[si+1Bh], ax
		jmp	short loc_945D7

loc_945B5:
		dec	word ptr [bp+var_E6]
		mov	ax, word ptr [bp+var_E6]
		cmp	ax, 1
		jge	short loc_945C8
		mov	word ptr [bp+var_E6], 1

loc_945C8:
		mov	ax, word ptr [bp+var_E6]
		mov	word ptr [bp+var_EE], ax
		mov	ax, word ptr [bp+var_EE]
		mov	[si+1Bh], ax

loc_945D7:
		mov	ax, [bp+var_4]
		inc	ax
		cmp	ax, word ptr [bp+var_EA]
		jnz	short loc_9462B
		cmp	[bp+var_D], 0
		jz	short loc_9462B
		mov	ax, word_4EFA0
		mov	word ptr [bp+var_F0], ax
		mov	word ptr [bp+var_F2], 0
		cmp	[bp+var_D20], 0
		jz	short loc_9462B
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_F2]
		push	word ptr [bp+var_F0]
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_9462B

loc_9462B:
		mov	ax, [bp+var_4]
		add	ax, 2
		cmp	ax, word ptr [bp+var_EA]
		jnz	short loc_94652
		mov	ax, [bp+var_A]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D12]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_94652:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_EA]
		jnz	short loc_9466C
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9466C:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_EA]
		jnz	short loc_94697
		cmp	[bp+var_D], 0
		jz	short loc_94697
		cmp	[bp+var_D20], 0
		jz	short loc_94697
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_94697

loc_94697:
		jmp	short loc_946B3
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_946B3
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_946DD

loc_946B3:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_946C0:
		cmp	word ptr [bp+var_D26+1], di
		jnb	short loc_946CD
		cmp	byte ptr [bp+var_D26+3], 0
		jz	short loc_946D2

loc_946CD:
		mov	ax, 1
		jmp	short loc_946D4

loc_946D2:
		xor	ax, ax

loc_946D4:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_946DD
		jmp	loc_94572

loc_946DD:
		mov	[bp+var_6], 52h
		mov	ax, word ptr [bp+var_D26+1]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_9484D

loc_94701:
		mov	ax, word ptr [bp+var_D26+1]
		mov	word ptr [bp+var_EA], ax
		mov	ax, di
		add	ax, 0FFF6h
		cmp	ax, word ptr [bp+var_EA]
		jle	short loc_94744
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_E6], ax
		mov	ax, word ptr [bp+var_E6]
		mov	word ptr [bp+var_EC], ax
		mov	ax, word ptr [bp+var_EC]
		mov	[si+1Bh], ax
		jmp	short loc_94766

loc_94744:
		dec	word ptr [bp+var_E6]
		mov	ax, word ptr [bp+var_E6]
		cmp	ax, 1
		jge	short loc_94757
		mov	word ptr [bp+var_E6], 1

loc_94757:
		mov	ax, word ptr [bp+var_E6]
		mov	word ptr [bp+var_EE], ax
		mov	ax, word ptr [bp+var_EE]
		mov	[si+1Bh], ax

loc_94766:
		mov	ax, [bp+var_4]
		inc	ax
		cmp	ax, word ptr [bp+var_EA]
		jnz	short loc_947BA
		cmp	[bp+var_D], 0
		jz	short loc_947BA
		mov	ax, word_4EFA0
		mov	word ptr [bp+var_F0], ax
		mov	word ptr [bp+var_F2], 0
		cmp	[bp+var_D20], 0
		jz	short loc_947BA
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_F2]
		push	word ptr [bp+var_F0]
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_947BA

loc_947BA:
		mov	ax, [bp+var_4]
		add	ax, 2
		cmp	ax, word ptr [bp+var_EA]
		jnz	short loc_947DF
		mov	ax, [bp+var_A]
		shl	ax, 3
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D12]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_947DF:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_EA]
		jnz	short loc_947F9
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_947F9:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_EA]
		jnz	short loc_94824
		cmp	[bp+var_D], 0
		jz	short loc_94824
		cmp	[bp+var_D20], 0
		jz	short loc_94824
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_94824

loc_94824:
		jmp	short loc_94840
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_94840
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_9486A

loc_94840:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9484D:
		cmp	word ptr [bp+var_D26+1], di
		jnb	short loc_9485A
		cmp	byte ptr [bp+var_D26+3], 0
		jz	short loc_9485F

loc_9485A:
		mov	ax, 1
		jmp	short loc_94861

loc_9485F:
		xor	ax, ax

loc_94861:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9486A
		jmp	loc_94701

loc_9486A:
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	0
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_E0+1], 0
		jz	short loc_948B8
		cmp	[bp+var_E4], 0
		jz	short loc_948B8
		push	0
		mov	al, byte ptr [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_948B8

loc_948B8:
		mov	[bp+var_E4], 0
		mov	byte ptr [bp+var_E0+1], 0
		mov	[bp+var_DE], 0
		lea	ax, [bp+var_D20]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D1C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_94913
		cmp	[bp+var_DA], 0
		jz	short loc_94913
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94913

loc_94913:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		cmp	byte_4F55C, 0
		jnz	short loc_94934
		jmp	loc_94D7A

loc_94934:
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C1], 0
		jz	short loc_94969
		cmp	[bp+var_C6], 0
		jz	short loc_94969
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94969

loc_94969:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_B1], 0
		jz	short loc_949B5
		cmp	[bp+var_B6], 0
		jz	short loc_949B5
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_949B5

loc_949B5:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_94A01
		cmp	[bp+var_A6], 0
		jz	short loc_94A01
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94A01

loc_94A01:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_94A4D
		cmp	[bp+var_96], 0
		jz	short loc_94A4D
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94A4D

loc_94A4D:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		cmp	[bp+var_87], 0
		jz	short loc_94A8C
		cmp	[bp+var_8C], 0
		jz	short loc_94A8C
		push	0
		mov	al, [bp+var_88]
		push	ax
		lea	ax, word ptr [bp+var_8C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94A8C

loc_94A8C:
		mov	[bp+var_8C], 0
		mov	[bp+var_87], 0
		mov	[bp+var_86], 0
		cmp	[bp+var_7D], 0
		jz	short loc_94AC9
		cmp	[bp+var_82], 0
		jz	short loc_94AC9
		push	0
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, word ptr [bp+var_82]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94AC9

loc_94AC9:
		mov	[bp+var_82], 0
		mov	[bp+var_7D], 0
		mov	[bp+var_7C], 0
		cmp	[bp+var_73], 0
		jz	short loc_94B02
		cmp	[bp+var_78], 0
		jz	short loc_94B02
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94B02

loc_94B02:
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		lea	ax, [bp+var_D10]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_CF0]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_94B56
		cmp	[bp+var_6A], 0
		jz	short loc_94B56
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94B56

loc_94B56:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_55], 0
		jz	short loc_94B9A
		cmp	[bp+var_5A], 0
		jz	short loc_94B9A
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94B9A

loc_94B9A:
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_45], 0
		jz	short loc_94BDE
		cmp	[bp+var_4A], 0
		jz	short loc_94BDE
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94BDE

loc_94BDE:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_35], 0
		jz	short loc_94C22
		cmp	[bp+var_3A], 0
		jz	short loc_94C22
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94C22

loc_94C22:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CD8], 129Fh
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_CC3], 0
		jz	short loc_94C71
		cmp	[bp+var_CC8], 0
		jz	short loc_94C71
		push	0
		mov	al, [bp+var_CC4]
		push	ax
		lea	ax, word ptr [bp+var_CC8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94C71

loc_94C71:
		mov	[bp+var_CC8], 0
		mov	[bp+var_CC3], 0
		mov	[bp+var_CC2], 0
		lea	ax, [bp+var_4B2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_94CD7
		cmp	[bp+var_28], 0
		jz	short loc_94CD7
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_94CD7

loc_94CD7:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
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
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
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
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_94D7A:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		mov	[bp+var_D1C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D1A], ax
		lea	ax, [bp+var_D1C]
		mov	word_4D392, ax
		mov	[bp+var_D1C], 1BCh
		mov	[bp+var_D18], 0
		mov	[bp+var_D14], 0
		mov	[bp+var_D20], 0
		mov	[bp+var_D1E], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_94DD3
		jmp	loc_94E52

loc_94DD3:
		push	3
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	7
		lea	ax, [bp+var_4A4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D20]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_DA]
		push	ax
		lea	ax, [bp+var_D20]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF82
		mov	word ptr [bp+var_DC], ax
		mov	word ptr [bp+var_DE], 0
		cmp	[bp+var_D20], 0
		jz	short loc_94E52
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_DE]
		push	word ptr [bp+var_DC]
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_94E52

loc_94E52:
		mov	[bp+var_E8], 0
		mov	byte ptr [bp+var_E4], 2
		mov	byte ptr [bp+var_E4+1], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, word ptr [bp+var_E8]
		push	ax
		push	0Ah
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_EC+1], 0
		lea	ax, word ptr [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EE]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_F8], 0
		mov	byte ptr [bp+var_F4], 2
		mov	byte ptr [bp+var_F4+1], 0
		mov	[bp+var_F2], 0
		push	2
		lea	ax, word ptr [bp+var_F8]
		push	ax
		push	0Bh
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_FC+1], 0
		lea	ax, word ptr [bp+var_F8]
		push	ax
		lea	ax, word ptr [bp+var_FE]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_100], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_82]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_104+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_8C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_104], ax
		push	word ptr [bp+var_EE]
		mov	al, byte ptr [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_EE]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_FE]
		mov	al, byte ptr [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_FE]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_100]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_104+2]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_104]
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
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
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0F8h
		lea	ax, [bp+var_D12]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	word ptr [bp+var_106], 0
		mov	si, 3
		jmp	short loc_95057

loc_94FF5:
		mov	ax, word ptr [bp+var_D26+1]
		mov	word ptr [bp+var_108], ax
		cmp	word ptr [bp+var_108], 33h
		jge	short loc_95016
		mov	[bp+var_10A], si
		inc	si
		mov	bx, word ptr [bp+var_104]
		mov	ax, [bp+var_10A]
		mov	[bx+1Bh], ax
		jmp	short loc_9503D

loc_95016:
		mov	ax, word ptr [bp+var_106]
		mov	word ptr [bp+var_10E+2], ax
		inc	word ptr [bp+var_106]
		mov	bx, word ptr [bp+var_104+2]
		mov	ax, word ptr [bp+var_10E+2]
		mov	[bx+1Bh], ax
		mov	word ptr [bp+var_10E], si
		inc	si
		mov	bx, word ptr [bp+var_104]
		mov	ax, word ptr [bp+var_10E]
		mov	[bx+1Bh], ax

loc_9503D:
		jmp	short loc_9504A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9504A
		jmp	short loc_95072

loc_9504A:
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_95057:
		cmp	word ptr [bp+var_D26+1], 49h
		jnb	short loc_95065
		cmp	byte ptr [bp+var_D26+3], 0
		jz	short loc_9506A

loc_95065:
		mov	ax, 1
		jmp	short loc_9506C

loc_9506A:
		xor	ax, ax

loc_9506C:
		mov	ah, 0
		or	ax, ax
		jz	short loc_94FF5

loc_95072:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_D44+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_FE]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_F4+1], 0
		jz	short loc_950C4
		cmp	[bp+var_F8], 0
		jz	short loc_950C4
		push	0
		mov	al, byte ptr [bp+var_F4]
		push	ax
		lea	ax, word ptr [bp+var_F8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_950C4

loc_950C4:
		mov	[bp+var_F8], 0
		mov	byte ptr [bp+var_F4+1], 0
		mov	[bp+var_F2], 0
		lea	ax, word ptr [bp+var_EE]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_E4+1], 0
		jz	short loc_95110
		cmp	[bp+var_E8], 0
		jz	short loc_95110
		push	0
		mov	al, byte ptr [bp+var_E4]
		push	ax
		lea	ax, word ptr [bp+var_E8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95110

loc_95110:
		mov	[bp+var_E8], 0
		mov	byte ptr [bp+var_E4+1], 0
		mov	[bp+var_E2], 0
		lea	ax, [bp+var_D20]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D1C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_9516B
		cmp	[bp+var_DA], 0
		jz	short loc_9516B
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9516B

loc_9516B:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		cmp	byte_4F55C, 0
		jnz	short loc_9518C
		jmp	loc_955D2

loc_9518C:
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C1], 0
		jz	short loc_951C1
		cmp	[bp+var_C6], 0
		jz	short loc_951C1
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_951C1

loc_951C1:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_B1], 0
		jz	short loc_9520D
		cmp	[bp+var_B6], 0
		jz	short loc_9520D
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9520D

loc_9520D:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_95259
		cmp	[bp+var_A6], 0
		jz	short loc_95259
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95259

loc_95259:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_952A5
		cmp	[bp+var_96], 0
		jz	short loc_952A5
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_952A5

loc_952A5:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		cmp	[bp+var_87], 0
		jz	short loc_952E4
		cmp	[bp+var_8C], 0
		jz	short loc_952E4
		push	0
		mov	al, [bp+var_88]
		push	ax
		lea	ax, word ptr [bp+var_8C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_952E4

loc_952E4:
		mov	[bp+var_8C], 0
		mov	[bp+var_87], 0
		mov	[bp+var_86], 0
		cmp	[bp+var_7D], 0
		jz	short loc_95321
		cmp	[bp+var_82], 0
		jz	short loc_95321
		push	0
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, word ptr [bp+var_82]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95321

loc_95321:
		mov	[bp+var_82], 0
		mov	[bp+var_7D], 0
		mov	[bp+var_7C], 0
		cmp	[bp+var_73], 0
		jz	short loc_9535A
		cmp	[bp+var_78], 0
		jz	short loc_9535A
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9535A

loc_9535A:
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		lea	ax, [bp+var_D10]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_CF0]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_953AE
		cmp	[bp+var_6A], 0
		jz	short loc_953AE
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_953AE

loc_953AE:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_55], 0
		jz	short loc_953F2
		cmp	[bp+var_5A], 0
		jz	short loc_953F2
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_953F2

loc_953F2:
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_45], 0
		jz	short loc_95436
		cmp	[bp+var_4A], 0
		jz	short loc_95436
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95436

loc_95436:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_35], 0
		jz	short loc_9547A
		cmp	[bp+var_3A], 0
		jz	short loc_9547A
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9547A

loc_9547A:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CD8], 129Fh
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_CC3], 0
		jz	short loc_954C9
		cmp	[bp+var_CC8], 0
		jz	short loc_954C9
		push	0
		mov	al, [bp+var_CC4]
		push	ax
		lea	ax, word ptr [bp+var_CC8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_954C9

loc_954C9:
		mov	[bp+var_CC8], 0
		mov	[bp+var_CC3], 0
		mov	[bp+var_CC2], 0
		lea	ax, [bp+var_4B2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9552F
		cmp	[bp+var_28], 0
		jz	short loc_9552F
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9552F

loc_9552F:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
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
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
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
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_955D2:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		mov	[bp+var_E4], 0
		mov	byte ptr [bp+var_E0], 2
		mov	byte ptr [bp+var_E0+1], 0
		mov	[bp+var_DE], 0
		mov	[bp+var_D1C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D1A], ax
		lea	ax, [bp+var_D1C]
		mov	word_4D392, ax
		mov	[bp+var_D1C], 1BCh
		mov	[bp+var_D18], 0
		mov	[bp+var_D14], 0
		mov	[bp+var_D20], 0
		mov	[bp+var_D1E], 0FFFFh
		mov	[bp+var_D2A], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_D28], ax
		lea	ax, [bp+var_D2A]
		mov	word_4D392, ax
		mov	[bp+var_D2A], 1BCh
		mov	[bp+var_D26], 0
		mov	[bp+var_D22], 0
		mov	[bp+var_D2E], 0
		mov	[bp+var_D2C], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_9567B
		jmp	loc_956FA

loc_9567B:
		push	3
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	5Dh
		lea	ax, [bp+var_4A4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D20]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_DA]
		push	ax
		lea	ax, [bp+var_D20]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4F02E
		mov	word ptr [bp+var_E6], ax
		mov	word ptr [bp+var_E8], 0
		cmp	[bp+var_D20], 0
		jz	short loc_956FA
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_E8]
		push	word ptr [bp+var_E6]
		push	[bp+var_D1E]
		mov	bx, [bp+var_D20]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_956FA

loc_956FA:
		mov	[bp+var_F2], 0
		mov	byte ptr [bp+var_EE], 2
		mov	byte ptr [bp+var_EE+1], 0
		mov	[bp+var_EC], 0
		push	3
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	1
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_FC], 0
		mov	byte ptr [bp+var_F8], 2
		mov	byte ptr [bp+var_F8+1], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, word ptr [bp+var_FC]
		push	ax
		push	5
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_104+2], 2
		mov	byte ptr [bp+var_104+3], 0
		mov	[bp+var_100], 0
		push	2
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	2Fh
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_109], 0
		lea	ax, word ptr [bp+var_106]
		push	ax
		lea	ax, word ptr [bp+var_10E+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112], 2
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_110], 0
		push	2
		lea	ax, word ptr [bp+var_116]
		push	ax
		push	8
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_119], 0
		lea	ax, word ptr [bp+var_116]
		push	ax
		lea	ax, [bp+var_11C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_D50]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_11E], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_FC]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_120], ax
		push	[bp+var_11C]
		mov	al, byte ptr [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_10E+2]
		mov	al, byte ptr [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E+2]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_11E]
		lea	ax, [bp+var_D50]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_120]
		lea	ax, [bp+var_D50]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
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
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		lea	ax, [bp+var_D50]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_12A], 0
		mov	byte ptr [bp+var_126], 2
		mov	byte ptr [bp+var_126+1], 0
		mov	[bp+var_124], 0
		push	3
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	30h
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_134], 0
		mov	byte ptr [bp+var_130], 2
		mov	byte ptr [bp+var_130+1], 0
		mov	[bp+var_12E], 0
		push	3
		lea	ax, word ptr [bp+var_134]
		push	ax
		push	31h
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_13E], 0
		mov	byte ptr [bp+var_13A], 2
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_138], 0
		push	3
		lea	ax, word ptr [bp+var_13E]
		push	ax
		push	7
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_148], 0
		mov	[bp+var_144], 2
		mov	[bp+var_143], 0
		mov	[bp+var_142], 0
		push	3
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	6
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_14A], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_134]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_14C], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_13E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_14E], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_150], ax
		push	[bp+var_120]
		lea	ax, [bp+var_D50]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	[bp+var_14A]
		lea	ax, [bp+var_D50]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_14E]
		lea	ax, [bp+var_D50]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_120]
		lea	ax, [bp+var_D50]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	si, si
		mov	[bp+var_152], 0
		mov	[bp+var_D33], 0
		jmp	loc_95CB0

loc_95A54:
		mov	ax, [bp+var_D33]
		mov	[bp+var_154], ax
		cmp	[bp+var_154], 14h
		jnz	short loc_95A72
		push	0Dh
		lea	ax, [bp+var_D50]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_95A72:
		cmp	[bp+var_154], 1Eh
		jnz	short loc_95A88
		push	0Bh
		lea	ax, [bp+var_D50]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_95A88:
		cmp	[bp+var_154], 28h
		jnz	short loc_95A9E
		push	9
		lea	ax, [bp+var_D50]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_95A9E:
		cmp	[bp+var_154], 32h
		jnz	short loc_95AB4
		push	7
		lea	ax, [bp+var_D50]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_95AB4:
		cmp	[bp+var_154], 1Eh
		jge	short loc_95AE5
		mov	[bp+var_156], si
		inc	si
		mov	bx, [bp+var_14A]
		mov	ax, [bp+var_156]
		mov	[bx+1Bh], ax
		mov	ax, [bp+var_152]
		mov	[bp+var_158], ax
		inc	[bp+var_152]
		mov	bx, [bp+var_14E]
		mov	ax, [bp+var_158]
		mov	[bx+1Bh], ax
		jmp	loc_95C96

loc_95AE5:
		cmp	[bp+var_154], 1Eh
		jz	short loc_95AEF
		jmp	loc_95B79

loc_95AEF:
		xor	si, si
		push	[bp+var_14A]
		lea	ax, [bp+var_D50]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	[bp+var_14A], 0
		jz	short loc_95B1C
		push	3
		push	[bp+var_14A]
		mov	bx, [bp+var_14A]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_95B1C

loc_95B1C:
		push	[bp+var_120]
		lea	ax, [bp+var_D50]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	[bp+var_14C]
		lea	ax, [bp+var_D50]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_120]
		lea	ax, [bp+var_D50]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_15A], si
		inc	si
		mov	bx, [bp+var_14C]
		mov	ax, [bp+var_15A]
		mov	[bx+1Bh], ax
		mov	ax, [bp+var_152]
		mov	[bp+var_15C], ax
		inc	[bp+var_152]
		mov	bx, [bp+var_14E]
		mov	ax, [bp+var_15C]
		mov	[bx+1Bh], ax
		jmp	loc_95C96

loc_95B79:
		cmp	[bp+var_154], 1Eh
		jle	short loc_95BB1
		cmp	[bp+var_154], 32h
		jge	short loc_95BB1
		mov	[bp+var_15E], si
		inc	si
		mov	bx, [bp+var_14C]
		mov	ax, [bp+var_15E]
		mov	[bx+1Bh], ax
		mov	ax, [bp+var_152]
		mov	[bp+var_160], ax
		inc	[bp+var_152]
		mov	bx, [bp+var_14E]
		mov	ax, [bp+var_160]
		mov	[bx+1Bh], ax
		jmp	loc_95C96

loc_95BB1:
		cmp	[bp+var_154], 32h
		jz	short loc_95BBB
		jmp	loc_95C77

loc_95BBB:
		cmp	[bp+var_D], 0
		jnz	short loc_95BC4
		jmp	loc_95C43

loc_95BC4:
		push	3
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	14h
		lea	ax, [bp+var_4A4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_D2E]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_E4]
		push	ax
		lea	ax, [bp+var_D2E]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF9C
		mov	[bp+var_162], ax
		mov	[bp+var_164], 0
		cmp	[bp+var_D2E], 0
		jz	short loc_95C43
		push	[bp+var_D2C]
		mov	bx, [bp+var_D2E]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_164]
		push	[bp+var_162]
		push	[bp+var_D2C]
		mov	bx, [bp+var_D2E]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_95C43

loc_95C43:
		xor	si, si
		push	0Fh
		lea	ax, [bp+var_D50]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D50]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_166], si
		inc	si
		mov	bx, [bp+var_150]
		mov	ax, [bp+var_166]
		mov	[bx+1Bh], ax
		jmp	short loc_95C96

loc_95C77:
		cmp	[bp+var_154], 42h
		jge	short loc_95C96
		test	[bp+var_154], 1
		jz	short loc_95C96
		mov	[bp+var_168], si
		inc	si
		mov	bx, [bp+var_150]
		mov	ax, [bp+var_168]
		mov	[bx+1Bh], ax

loc_95C96:
		jmp	short loc_95CA3
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_95CA3
		jmp	short loc_95CCE

loc_95CA3:
		lea	ax, [bp+var_D50]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_95CB0:
		cmp	[bp+var_D33], 53h
		jnb	short loc_95CBE
		cmp	[bp+var_D31], 0
		jz	short loc_95CC3

loc_95CBE:
		mov	ax, 1
		jmp	short loc_95CC5

loc_95CC3:
		xor	ax, ax

loc_95CC5:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_95CCE
		jmp	loc_95A54

loc_95CCE:
		cmp	[bp+var_143], 0
		jz	short loc_95CF6
		cmp	[bp+var_148], 0
		jz	short loc_95CF6
		push	0
		mov	al, [bp+var_144]
		push	ax
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95CF6

loc_95CF6:
		mov	[bp+var_148], 0
		mov	[bp+var_143], 0
		mov	[bp+var_142], 0
		cmp	byte ptr [bp+var_13A+1], 0
		jz	short loc_95D35
		cmp	[bp+var_13E], 0
		jz	short loc_95D35
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, word ptr [bp+var_13E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95D35

loc_95D35:
		mov	[bp+var_13E], 0
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_138], 0
		cmp	byte ptr [bp+var_130+1], 0
		jz	short loc_95D74
		cmp	[bp+var_134], 0
		jz	short loc_95D74
		push	0
		mov	al, byte ptr [bp+var_130]
		push	ax
		lea	ax, word ptr [bp+var_134]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95D74

loc_95D74:
		mov	[bp+var_134], 0
		mov	byte ptr [bp+var_130+1], 0
		mov	[bp+var_12E], 0
		cmp	byte ptr [bp+var_126+1], 0
		jz	short loc_95DB3
		cmp	[bp+var_12A], 0
		jz	short loc_95DB3
		push	0
		mov	al, byte ptr [bp+var_126]
		push	ax
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95DB3

loc_95DB3:
		mov	[bp+var_12A], 0
		mov	byte ptr [bp+var_126+1], 0
		mov	[bp+var_124], 0
		push	0
		lea	ax, [bp+var_D50]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_11C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_112+1], 0
		jz	short loc_95E0E
		cmp	[bp+var_116], 0
		jz	short loc_95E0E
		push	0
		mov	al, byte ptr [bp+var_112]
		push	ax
		lea	ax, word ptr [bp+var_116]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95E0E

loc_95E0E:
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_110], 0
		lea	ax, word ptr [bp+var_10E+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_104+3], 0
		jz	short loc_95E5A
		cmp	[bp+var_106], 0
		jz	short loc_95E5A
		push	0
		mov	al, byte ptr [bp+var_104+2]
		push	ax
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95E5A

loc_95E5A:
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_104+3], 0
		mov	[bp+var_100], 0
		cmp	byte ptr [bp+var_F8+1], 0
		jz	short loc_95E99
		cmp	[bp+var_FC], 0
		jz	short loc_95E99
		push	0
		mov	al, byte ptr [bp+var_F8]
		push	ax
		lea	ax, word ptr [bp+var_FC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95E99

loc_95E99:
		mov	[bp+var_FC], 0
		mov	byte ptr [bp+var_F8+1], 0
		mov	[bp+var_F6], 0
		cmp	byte ptr [bp+var_EE+1], 0
		jz	short loc_95ED8
		cmp	[bp+var_F2], 0
		jz	short loc_95ED8
		push	0
		mov	al, byte ptr [bp+var_EE]
		push	ax
		lea	ax, word ptr [bp+var_F2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95ED8

loc_95ED8:
		mov	[bp+var_F2], 0
		mov	byte ptr [bp+var_EE+1], 0
		mov	[bp+var_EC], 0
		lea	ax, [bp+var_D2E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D2A]
		push	ax
		call	sub_5C1C
		add	sp, 4
		lea	ax, [bp+var_D20]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_D1C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_E0+1], 0
		jz	short loc_95F4F
		cmp	[bp+var_E4], 0
		jz	short loc_95F4F
		push	0
		mov	al, byte ptr [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95F4F

loc_95F4F:
		mov	[bp+var_E4], 0
		mov	byte ptr [bp+var_E0+1], 0
		mov	[bp+var_DE], 0
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_95F8E
		cmp	[bp+var_DA], 0
		jz	short loc_95F8E
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95F8E

loc_95F8E:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		cmp	byte_4F55C, 0
		jnz	short loc_95FAF
		jmp	loc_963F5

loc_95FAF:
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C1], 0
		jz	short loc_95FE4
		cmp	[bp+var_C6], 0
		jz	short loc_95FE4
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_95FE4

loc_95FE4:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_B1], 0
		jz	short loc_96030
		cmp	[bp+var_B6], 0
		jz	short loc_96030
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96030

loc_96030:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_9607C
		cmp	[bp+var_A6], 0
		jz	short loc_9607C
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9607C

loc_9607C:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_960C8
		cmp	[bp+var_96], 0
		jz	short loc_960C8
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_960C8

loc_960C8:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		cmp	[bp+var_87], 0
		jz	short loc_96107
		cmp	[bp+var_8C], 0
		jz	short loc_96107
		push	0
		mov	al, [bp+var_88]
		push	ax
		lea	ax, word ptr [bp+var_8C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96107

loc_96107:
		mov	[bp+var_8C], 0
		mov	[bp+var_87], 0
		mov	[bp+var_86], 0
		cmp	[bp+var_7D], 0
		jz	short loc_96144
		cmp	[bp+var_82], 0
		jz	short loc_96144
		push	0
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, word ptr [bp+var_82]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96144

loc_96144:
		mov	[bp+var_82], 0
		mov	[bp+var_7D], 0
		mov	[bp+var_7C], 0
		cmp	[bp+var_73], 0
		jz	short loc_9617D
		cmp	[bp+var_78], 0
		jz	short loc_9617D
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9617D

loc_9617D:
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		lea	ax, [bp+var_D10]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_CF0]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_961D1
		cmp	[bp+var_6A], 0
		jz	short loc_961D1
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_961D1

loc_961D1:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_55], 0
		jz	short loc_96215
		cmp	[bp+var_5A], 0
		jz	short loc_96215
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96215

loc_96215:
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_45], 0
		jz	short loc_96259
		cmp	[bp+var_4A], 0
		jz	short loc_96259
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96259

loc_96259:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_35], 0
		jz	short loc_9629D
		cmp	[bp+var_3A], 0
		jz	short loc_9629D
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9629D

loc_9629D:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CD8], 129Fh
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_CC3], 0
		jz	short loc_962EC
		cmp	[bp+var_CC8], 0
		jz	short loc_962EC
		push	0
		mov	al, [bp+var_CC4]
		push	ax
		lea	ax, word ptr [bp+var_CC8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_962EC

loc_962EC:
		mov	[bp+var_CC8], 0
		mov	[bp+var_CC3], 0
		mov	[bp+var_CC2], 0
		lea	ax, [bp+var_4B2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_96352
		cmp	[bp+var_28], 0
		jz	short loc_96352
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96352

loc_96352:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
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
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
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
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_963F5:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		push	3
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	74h
		lea	ax, [bp+var_33C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E4], 0
		mov	byte ptr [bp+var_E0], 2
		mov	byte ptr [bp+var_E0+1], 0
		mov	[bp+var_DE], 0
		push	3
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	4
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_D34]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_EE], 0
		mov	byte ptr [bp+var_EA], 2
		mov	byte ptr [bp+var_EA+1], 0
		mov	[bp+var_E8], 0
		push	3
		lea	ax, word ptr [bp+var_EE]
		push	ax
		push	2BCEh
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F0], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_EE]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	si, ax
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_EE]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_F2], ax
		push	0FFC0h
		push	0
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F4], ax
		push	[bp+var_40]
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_50]
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_60]
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_60]
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
		push	word ptr [bp+var_F4]
		lea	ax, [bp+var_D34]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_F0]
		lea	ax, [bp+var_D34]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_D34]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_F2]
		lea	ax, [bp+var_D34]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_D12]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		push	0FFFFh
		push	si
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	[bp+var_FE], 0
		mov	byte ptr [bp+var_FA], 2
		mov	byte ptr [bp+var_FA+1], 0
		mov	[bp+var_F8], 0
		push	3
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	0
		lea	ax, [bp+var_2C4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	1
		push	80h
		push	0A0h
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	0
		call	ToggleLayer_Construct_FDCC
		add	sp, 0Ah
		mov	word ptr [bp+var_100], ax
		push	word ptr [bp+var_100]
		lea	ax, [bp+var_D34]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_96664

loc_96630:
		mov	ax, word ptr [bp+var_D18+1]
		mov	word ptr [bp+var_104+2], ax
		cmp	word ptr [bp+var_104+2], 0Ch
		jnz	short loc_9664A
		push	12h
		push	si
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_9664A:
		jmp	short loc_96657
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_96657
		jmp	short loc_9667F

loc_96657:
		lea	ax, [bp+var_D34]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_96664:
		cmp	word ptr [bp+var_D18+1], 0Fh
		jnb	short loc_96672
		cmp	byte ptr [bp+var_D18+3], 0
		jz	short loc_96677

loc_96672:
		mov	ax, 1
		jmp	short loc_96679

loc_96677:
		xor	ax, ax

loc_96679:
		mov	ah, 0
		or	ax, ax
		jz	short loc_96630

loc_9667F:
		cmp	byte ptr [bp+var_FA+1], 0
		jz	short loc_966A7
		cmp	[bp+var_FE], 0
		jz	short loc_966A7
		push	0
		mov	al, byte ptr [bp+var_FA]
		push	ax
		lea	ax, word ptr [bp+var_FE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_966A7

loc_966A7:
		mov	[bp+var_FE], 0
		mov	byte ptr [bp+var_FA+1], 0
		mov	[bp+var_F8], 0
		cmp	byte ptr [bp+var_EA+1], 0
		jz	short loc_966E6
		cmp	[bp+var_EE], 0
		jz	short loc_966E6
		push	0
		mov	al, byte ptr [bp+var_EA]
		push	ax
		lea	ax, word ptr [bp+var_EE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_966E6

loc_966E6:
		mov	[bp+var_EE], 0
		mov	byte ptr [bp+var_EA+1], 0
		mov	[bp+var_E8], 0
		push	0
		lea	ax, [bp+var_D34]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_E0+1], 0
		jz	short loc_96734
		cmp	[bp+var_E4], 0
		jz	short loc_96734
		push	0
		mov	al, byte ptr [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96734

loc_96734:
		mov	[bp+var_E4], 0
		mov	byte ptr [bp+var_E0+1], 0
		mov	[bp+var_DE], 0
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_96773
		cmp	[bp+var_DA], 0
		jz	short loc_96773
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96773

loc_96773:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		cmp	byte_4F55C, 0
		jnz	short loc_96794
		jmp	loc_96BDA

loc_96794:
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C1], 0
		jz	short loc_967C9
		cmp	[bp+var_C6], 0
		jz	short loc_967C9
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_967C9

loc_967C9:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_B1], 0
		jz	short loc_96815
		cmp	[bp+var_B6], 0
		jz	short loc_96815
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96815

loc_96815:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_96861
		cmp	[bp+var_A6], 0
		jz	short loc_96861
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96861

loc_96861:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_968AD
		cmp	[bp+var_96], 0
		jz	short loc_968AD
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_968AD

loc_968AD:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		cmp	[bp+var_87], 0
		jz	short loc_968EC
		cmp	[bp+var_8C], 0
		jz	short loc_968EC
		push	0
		mov	al, [bp+var_88]
		push	ax
		lea	ax, word ptr [bp+var_8C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_968EC

loc_968EC:
		mov	[bp+var_8C], 0
		mov	[bp+var_87], 0
		mov	[bp+var_86], 0
		cmp	[bp+var_7D], 0
		jz	short loc_96929
		cmp	[bp+var_82], 0
		jz	short loc_96929
		push	0
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, word ptr [bp+var_82]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96929

loc_96929:
		mov	[bp+var_82], 0
		mov	[bp+var_7D], 0
		mov	[bp+var_7C], 0
		cmp	[bp+var_73], 0
		jz	short loc_96962
		cmp	[bp+var_78], 0
		jz	short loc_96962
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96962

loc_96962:
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		lea	ax, [bp+var_D10]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_CF0]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_969B6
		cmp	[bp+var_6A], 0
		jz	short loc_969B6
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_969B6

loc_969B6:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_55], 0
		jz	short loc_969FA
		cmp	[bp+var_5A], 0
		jz	short loc_969FA
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_969FA

loc_969FA:
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_45], 0
		jz	short loc_96A3E
		cmp	[bp+var_4A], 0
		jz	short loc_96A3E
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96A3E

loc_96A3E:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_35], 0
		jz	short loc_96A82
		cmp	[bp+var_3A], 0
		jz	short loc_96A82
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96A82

loc_96A82:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CD8], 129Fh
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_CC3], 0
		jz	short loc_96AD1
		cmp	[bp+var_CC8], 0
		jz	short loc_96AD1
		push	0
		mov	al, [bp+var_CC4]
		push	ax
		lea	ax, word ptr [bp+var_CC8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96AD1

loc_96AD1:
		mov	[bp+var_CC8], 0
		mov	[bp+var_CC3], 0
		mov	[bp+var_CC2], 0
		lea	ax, [bp+var_4B2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_96B37
		cmp	[bp+var_28], 0
		jz	short loc_96B37
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96B37

loc_96B37:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
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
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
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
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_96BDA:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		push	3
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E4], 0
		mov	byte ptr [bp+var_E0], 2
		mov	byte ptr [bp+var_E0+1], 0
		mov	[bp+var_DE], 0
		push	3
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	0
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_EE], 0
		mov	byte ptr [bp+var_EA], 2
		mov	byte ptr [bp+var_EA+1], 0
		mov	[bp+var_E8], 0
		push	2
		lea	ax, word ptr [bp+var_EE]
		push	ax
		push	9
		lea	ax, [bp+var_24C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_F2+1], 0
		lea	ax, word ptr [bp+var_EE]
		push	ax
		lea	ax, word ptr [bp+var_F4]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_D34]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		push	5
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_F6], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F8], ax
		push	word ptr [bp+var_F4]
		mov	al, byte ptr [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F4]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_F8]
		lea	ax, [bp+var_D34]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_F6]
		lea	ax, [bp+var_D34]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
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
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	80h
		lea	ax, [bp+var_D12]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	word ptr [bp+var_FA], 1
		mov	ax, word ptr [bp+var_FA]
		mov	word ptr [bp+var_FC], ax
		mov	bx, word ptr [bp+var_F6]
		mov	ax, word ptr [bp+var_FC]
		mov	[bx+1Bh], ax
		cmp	[bp+var_C], 0
		jnz	short loc_96D6F
		jmp	loc_96EB1

loc_96D6F:
		lea	ax, [bp+var_D34]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		xor	si, si
		jmp	short loc_96D8E

loc_96D80:
		lea	ax, [bp+var_D34]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	si

loc_96D8E:
		cmp	si, 4
		jl	short loc_96D80
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_104+2], 2
		mov	byte ptr [bp+var_104+3], 0
		mov	[bp+var_100], 0
		push	2
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	1
		lea	ax, [bp+var_42C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_106]
		push	ax
		lea	ax, [bp+var_CD8]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	si, si
		jmp	short loc_96DE9

loc_96DDB:
		lea	ax, [bp+var_D34]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	si

loc_96DE9:
		cmp	si, 4
		jl	short loc_96DDB
		push	0FFFFh
		lea	ax, [bp+var_CD8]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_96E19

loc_96DFF:
		jmp	short loc_96E0C
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_96E0C
		jmp	short loc_96E2A

loc_96E0C:
		lea	ax, [bp+var_D34]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_96E19:
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_96DFF

loc_96E2A:
		xor	si, si
		jmp	short loc_96E5D

loc_96E2E:
		cmp	si, 4
		jle	short loc_96E4F
		cmp	si, 0Dh
		jge	short loc_96E4F
		mov	ax, word ptr [bp+var_FA]
		mov	word ptr [bp+var_108], ax
		inc	word ptr [bp+var_FA]
		mov	bx, word ptr [bp+var_F6]
		mov	ax, word ptr [bp+var_108]
		mov	[bx+1Bh], ax

loc_96E4F:
		lea	ax, [bp+var_D34]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	si

loc_96E5D:
		cmp	si, 11h
		jl	short loc_96E2E
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_104+3], 0
		jz	short loc_96E97
		cmp	[bp+var_106], 0
		jz	short loc_96E97
		push	0
		mov	al, byte ptr [bp+var_104+2]
		push	ax
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96E97

loc_96E97:
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_104+3], 0
		mov	[bp+var_100], 0
		jmp	loc_96F85

loc_96EB1:
		mov	[bp+var_6], 4Bh
		mov	ax, word ptr [bp+var_D18+1]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_96F68

loc_96ED5:
		mov	si, word ptr [bp+var_D18+1]
		mov	ax, [bp+var_4]
		add	ax, 8
		cmp	ax, si
		jnz	short loc_96EFE
		mov	ax, [bp+var_A]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D12]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_96EFE:
		mov	ax, [bp+var_4]
		add	ax, 18h
		cmp	ax, si
		jge	short loc_96F29
		mov	ax, [bp+var_4]
		add	ax, 21h
		cmp	ax, si
		jle	short loc_96F29
		mov	ax, word ptr [bp+var_FA]
		mov	word ptr [bp+var_FE], ax
		inc	word ptr [bp+var_FA]
		mov	bx, word ptr [bp+var_F6]
		mov	ax, word ptr [bp+var_FE]
		mov	[bx+1Bh], ax

loc_96F29:
		mov	ax, di
		dec	ax
		cmp	ax, si
		jnz	short loc_96F3F
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_96F3F:
		jmp	short loc_96F5B
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_96F5B
		push	0
		lea	ax, [bp+var_D12]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_96F85

loc_96F5B:
		lea	ax, [bp+var_D34]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_96F68:
		cmp	word ptr [bp+var_D18+1], di
		jnb	short loc_96F75
		cmp	byte ptr [bp+var_D18+3], 0
		jz	short loc_96F7A

loc_96F75:
		mov	ax, 1
		jmp	short loc_96F7C

loc_96F7A:
		xor	ax, ax

loc_96F7C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_96F85
		jmp	loc_96ED5

loc_96F85:
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	0
		lea	ax, [bp+var_D34]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_F4]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_EA+1], 0
		jz	short loc_96FE0
		cmp	[bp+var_EE], 0
		jz	short loc_96FE0
		push	0
		mov	al, byte ptr [bp+var_EA]
		push	ax
		lea	ax, word ptr [bp+var_EE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_96FE0

loc_96FE0:
		mov	[bp+var_EE], 0
		mov	byte ptr [bp+var_EA+1], 0
		mov	[bp+var_E8], 0
		cmp	byte ptr [bp+var_E0+1], 0
		jz	short loc_9701F
		cmp	[bp+var_E4], 0
		jz	short loc_9701F
		push	0
		mov	al, byte ptr [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9701F

loc_9701F:
		mov	[bp+var_E4], 0
		mov	byte ptr [bp+var_E0+1], 0
		mov	[bp+var_DE], 0
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_9705E
		cmp	[bp+var_DA], 0
		jz	short loc_9705E
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9705E

loc_9705E:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C1], 0
		jz	short loc_970AA
		cmp	[bp+var_C6], 0
		jz	short loc_970AA
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_970AA

loc_970AA:
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_B1], 0
		jz	short loc_970F6
		cmp	[bp+var_B6], 0
		jz	short loc_970F6
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_970F6

loc_970F6:
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_97142
		cmp	[bp+var_A6], 0
		jz	short loc_97142
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_97142

loc_97142:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_9718E
		cmp	[bp+var_96], 0
		jz	short loc_9718E
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9718E

loc_9718E:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		cmp	[bp+var_87], 0
		jz	short loc_971CD
		cmp	[bp+var_8C], 0
		jz	short loc_971CD
		push	0
		mov	al, [bp+var_88]
		push	ax
		lea	ax, word ptr [bp+var_8C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_971CD

loc_971CD:
		mov	[bp+var_8C], 0
		mov	[bp+var_87], 0
		mov	[bp+var_86], 0
		cmp	[bp+var_7D], 0
		jz	short loc_9720A
		cmp	[bp+var_82], 0
		jz	short loc_9720A
		push	0
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, word ptr [bp+var_82]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9720A

loc_9720A:
		mov	[bp+var_82], 0
		mov	[bp+var_7D], 0
		mov	[bp+var_7C], 0
		cmp	[bp+var_73], 0
		jz	short loc_97243
		cmp	[bp+var_78], 0
		jz	short loc_97243
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_97243

loc_97243:
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		lea	ax, [bp+var_D10]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_CF0]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_97297
		cmp	[bp+var_6A], 0
		jz	short loc_97297
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_97297

loc_97297:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_55], 0
		jz	short loc_972DB
		cmp	[bp+var_5A], 0
		jz	short loc_972DB
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_972DB

loc_972DB:
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_45], 0
		jz	short loc_9731F
		cmp	[bp+var_4A], 0
		jz	short loc_9731F
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9731F

loc_9731F:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_35], 0
		jz	short loc_97363
		cmp	[bp+var_3A], 0
		jz	short loc_97363
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_97363

loc_97363:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CD8], 129Fh
		lea	ax, [bp+var_CD8]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_CC3], 0
		jz	short loc_973B2
		cmp	[bp+var_CC8], 0
		jz	short loc_973B2
		push	0
		mov	al, [bp+var_CC4]
		push	ax
		lea	ax, word ptr [bp+var_CC8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_973B2

loc_973B2:
		mov	[bp+var_CC8], 0
		mov	[bp+var_CC3], 0
		mov	[bp+var_CC2], 0
		lea	ax, [bp+var_4B2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_4A4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_97418
		cmp	[bp+var_28], 0
		jz	short loc_97418
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_97418

loc_97418:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
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
		push	2
		lea	ax, [bp+var_24C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
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
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Midgame17_Play_91BB0		endp

; START OF FUNCTION CHUNK FOR Midgame17_Play_91BB0
off_974BB	dw offset loc_91E1C
		dw offset loc_91F95
		dw offset loc_91F95
		dw offset loc_91F95
		dw offset loc_91F95
; END OF FUNCTION CHUNK FOR Midgame17_Play_91BB0
ovr209		ends
