ovr213		segment	para public 'OVERLAY' use16
		assume cs:ovr213
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AEDE0		proc far

var_D1A		= word ptr -0D1Ah
var_D18		= word ptr -0D18h
var_D16		= word ptr -0D16h
var_D14		= word ptr -0D14h
var_D0A		= word ptr -0D0Ah
var_CDA		= word ptr -0CDAh
var_CAD		= dword ptr -0CADh
var_CA9		= dword ptr -0CA9h
var_CA5		= dword ptr -0CA5h
var_CA0		= word ptr -0CA0h
var_C98		= word ptr -0C98h
var_C94		= dword ptr -0C94h
var_C84		= word ptr -0C84h
var_C83		= word ptr -0C83h
var_C81		= byte ptr -0C81h
var_C7E		= word ptr -0C7Eh
var_C7C		= word ptr -0C7Ch
var_C7A		= word ptr -0C7Ah
var_C78		= word ptr -0C78h
var_C76		= dword ptr -0C76h
var_C72		= byte ptr -0C72h
var_C70		= word ptr -0C70h
var_C6E		= word ptr -0C6Eh
var_C6C		= word ptr -0C6Ch
var_C6A		= word ptr -0C6Ah
var_C68		= dword ptr -0C68h
var_C64		= byte ptr -0C64h
var_C62		= word ptr -0C62h
var_C60		= word ptr -0C60h
var_C40		= word ptr -0C40h
var_C28		= word ptr -0C28h
var_C26		= word ptr -0C26h
var_C18		= dword ptr -0C18h
var_C14		= byte ptr -0C14h
var_C13		= byte ptr -0C13h
var_C12		= dword ptr -0C12h
var_40B		= dword ptr -40Bh
var_407		= dword ptr -407h
var_402		= word ptr -402h
var_400		= word ptr -400h
var_3FE		= word ptr -3FEh
var_3FC		= word ptr -3FCh
var_3FA		= dword ptr -3FAh
var_3F6		= byte ptr -3F6h
var_3F4		= word ptr -3F4h
var_37C		= word ptr -37Ch
var_304		= word ptr -304h
var_28C		= word ptr -28Ch
var_214		= word ptr -214h
var_212		= word ptr -212h
var_210		= word ptr -210h
var_20E		= word ptr -20Eh
var_20C		= word ptr -20Ch
var_20A		= word ptr -20Ah
var_206		= word ptr -206h
var_204		= word ptr -204h
var_202		= word ptr -202h
var_200		= word ptr -200h
var_1FE		= word ptr -1FEh
var_1FC		= word ptr -1FCh
var_1F8		= word ptr -1F8h
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
var_194		= word ptr -194h
var_192		= word ptr -192h
var_190		= word ptr -190h
var_18E		= word ptr -18Eh
var_18C		= word ptr -18Ch
var_18A		= word ptr -18Ah
var_188		= word ptr -188h
var_186		= word ptr -186h
var_184		= word ptr -184h
var_182		= word ptr -182h
var_181		= word ptr -181h
var_180		= word ptr -180h
var_17E		= dword ptr -17Eh
var_17A		= dword ptr -17Ah
var_178		= dword ptr -178h
var_174		= dword ptr -174h
var_172		= dword ptr -172h
var_170		= dword ptr -170h
var_16E		= dword ptr -16Eh
var_16A		= dword ptr -16Ah
var_168		= dword ptr -168h
var_166		= dword ptr -166h
var_164		= dword ptr -164h
var_161		= word ptr -161h
var_160		= dword ptr -160h
var_15E		= dword ptr -15Eh
var_15C		= dword ptr -15Ch
var_15A		= dword ptr -15Ah
var_158		= dword ptr -158h
var_156		= dword ptr -156h
var_154		= dword ptr -154h
var_150		= dword ptr -150h
var_14E		= dword ptr -14Eh
var_14A		= dword ptr -14Ah
var_148		= dword ptr -148h
var_146		= dword ptr -146h
var_144		= dword ptr -144h
var_142		= dword ptr -142h
var_140		= dword ptr -140h
var_13C		= dword ptr -13Ch
var_13A		= dword ptr -13Ah
var_136		= dword ptr -136h
var_134		= dword ptr -134h
var_132		= dword ptr -132h
var_12E		= dword ptr -12Eh
var_12C		= dword ptr -12Ch
var_128		= word ptr -128h
var_126		= word ptr -126h
var_124		= dword ptr -124h
var_120		= dword ptr -120h
var_11C		= byte ptr -11Ch
var_11B		= byte ptr -11Bh
var_11A		= dword ptr -11Ah
var_116		= dword ptr -116h
var_112		= byte ptr -112h
var_111		= byte ptr -111h
var_110		= dword ptr -110h
var_10C		= dword ptr -10Ch
var_108		= byte ptr -108h
var_107		= byte ptr -107h
var_106		= dword ptr -106h
var_102		= dword ptr -102h
var_FE		= byte ptr -0FEh
var_FD		= byte ptr -0FDh
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= byte ptr -0F4h
var_F3		= byte ptr -0F3h
var_F2		= dword ptr -0F2h
var_EE		= dword ptr -0EEh
var_EA		= byte ptr -0EAh
var_E9		= byte ptr -0E9h
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= byte ptr -0E0h
var_DF		= byte ptr -0DFh
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= byte ptr -0D6h
var_D5		= byte ptr -0D5h
var_D4		= dword ptr -0D4h
var_D0		= word ptr -0D0h
var_CE		= byte ptr -0CEh
var_CD		= word ptr -0CDh
var_CA		= dword ptr -0CAh
var_C6		= byte ptr -0C6h
var_C5		= byte ptr -0C5h
var_C4		= dword ptr -0C4h
var_C0		= word ptr -0C0h
var_BE		= byte ptr -0BEh
var_BD		= word ptr -0BDh
var_BA		= dword ptr -0BAh
var_B6		= byte ptr -0B6h
var_B5		= byte ptr -0B5h
var_B4		= dword ptr -0B4h
var_B0		= word ptr -0B0h
var_AE		= byte ptr -0AEh
var_AD		= word ptr -0ADh
var_AA		= dword ptr -0AAh
var_A6		= byte ptr -0A6h
var_A5		= byte ptr -0A5h
var_A4		= dword ptr -0A4h
var_A0		= word ptr -0A0h
var_9E		= byte ptr -9Eh
var_9D		= word ptr -9Dh
var_9A		= dword ptr -9Ah
var_96		= byte ptr -96h
var_95		= byte ptr -95h
var_94		= dword ptr -94h
var_90		= word ptr -90h
var_8E		= byte ptr -8Eh
var_8D		= word ptr -8Dh
var_8A		= dword ptr -8Ah
var_86		= byte ptr -86h
var_85		= byte ptr -85h
var_84		= dword ptr -84h
var_80		= word ptr -80h
var_7E		= byte ptr -7Eh
var_7D		= word ptr -7Dh
var_7A		= dword ptr -7Ah
var_76		= byte ptr -76h
var_75		= byte ptr -75h
var_74		= dword ptr -74h
var_70		= word ptr -70h
var_6E		= byte ptr -6Eh
var_6D		= word ptr -6Dh
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
var_4C		= dword ptr -4Ch
var_48		= byte ptr -48h
var_47		= byte ptr -47h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= byte ptr -3Eh
var_3D		= byte ptr -3Dh
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= byte ptr -34h
var_33		= byte ptr -33h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= byte ptr -28h
var_26		= byte ptr -26h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= byte ptr -18h
var_16		= word ptr -16h
var_14		= byte ptr -14h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0D0Ah
		push	si
		push	di
		mov	[bp+var_4], 0
		push	0C8h
		push	0Ch
		lea	ax, [bp+var_6]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		mov	byte_4F55C, 0
		mov	[bp+var_7], 0
		mov	[bp+var_8], 0
		mov	[bp+var_9], 0
		cmp	word_4CA5B, 0
		jz	short loc_AEE1B
		mov	[bp+var_8], 1

loc_AEE1B:
		mov	ax, word_4D36E
		mov	[bp+var_C], ax
		mov	[bp+var_206], 0
		mov	[bp+var_204], 0
		push	[bp+var_C]
		lea	ax, [bp+var_206]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_214], 0
		mov	[bp+var_212], 0
		mov	[bp+var_210], 0
		mov	[bp+var_20E], 0
		mov	[bp+var_20C], 13Fh
		mov	[bp+var_20A], 9Dh
		push	0
		lea	ax, [bp+var_214]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_214]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_202], 0
		mov	[bp+var_200], 18h
		mov	[bp+var_1FE], 13Fh
		mov	[bp+var_1FC], 97h
		mov	byte ptr [bp+var_1A], 0
		mov	byte ptr [bp+var_1A+1], 0
		mov	[bp+var_18], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid36
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1F8]
		push	ax
		lea	ax, [bp+var_28C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_28C]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgames_40
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1F8]
		push	ax
		lea	ax, [bp+var_304]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_304]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid36voc
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_37C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		cmp	[bp+var_8], 0
		jz	short loc_AEF8D
		push	ds
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_AEF8D
		push	1
		lea	ax, [bp+var_1F8]
		push	ax
		lea	ax, [bp+var_37C]
		push	ax
		mov	bx, [bp+var_37C]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_37C]
		push	ax
		call	sub_435F1
		add	sp, 2
		jmp	short loc_AEF91

loc_AEF8D:
		mov	[bp+var_8], 0

loc_AEF91:
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		mov	al, byte_4CA58
		mov	[bp+var_26], al
		lea	ax, [bp+var_3F4]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_26]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_AEFCC
		jmp	loc_AF303

loc_AEFCC:
		shl	bx, 1
		jmp	cs:off_B56ED[bx]	; switch jump

loc_AEFD3:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_AF001
		jmp	loc_AF115

loc_AF001:
		push	1
		lea	ax, [bp+var_1F8]
		push	ax
		lea	ax, [bp+var_3F4]
		push	ax
		mov	bx, [bp+var_3F4]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_3F4]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_41
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_D0A]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_D0A], 480h
		mov	[bp+var_CA9], 100h
		mov	[bp+var_CAD], 0
		mov	[bp+var_D0A], 498h
		push	1
		lea	ax, [bp+var_1F8]
		push	ax
		lea	ax, [bp+var_D0A]
		push	ax
		mov	bx, [bp+var_D0A]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	word ptr [bp+var_12C+2], 1
		jmp	short loc_AF0DB

loc_AF0C0:
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, word ptr [bp+var_12C+2]
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	word ptr [bp+var_12C+2]

loc_AF0DB:
		cmp	word ptr [bp+var_12C+2], 6Ah
		jle	short loc_AF0C0
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_9], 1
		mov	[bp+var_D0A], 498h
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_D0A]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_AF115:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_AF153
		mov	[bp+var_7], 1
		mov	al, [bp+var_9]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AF153
		mov	word_4F048, 5Ah

loc_AF153:
		jmp	loc_AF303

loc_AF156:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_AF184
		jmp	loc_AF2A2

loc_AF184:
		cmp	word_4CA5D, 0
		jnz	short loc_AF18E
		jmp	loc_AF2A2

loc_AF18E:
		push	1
		lea	ax, [bp+var_1F8]
		push	ax
		lea	ax, [bp+var_3F4]
		push	ax
		mov	bx, [bp+var_3F4]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_3F4]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_42
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_D0A]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_D0A], 480h
		mov	[bp+var_CA9], 100h
		mov	[bp+var_CAD], 0
		mov	[bp+var_D0A], 498h
		push	1
		lea	ax, [bp+var_1F8]
		push	ax
		lea	ax, [bp+var_D0A]
		push	ax
		mov	bx, [bp+var_D0A]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	word ptr [bp+var_12C+2], 1
		jmp	short loc_AF268

loc_AF24D:
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, word ptr [bp+var_12C+2]
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	word ptr [bp+var_12C+2]

loc_AF268:
		cmp	word ptr [bp+var_12C+2], 6Ah
		jle	short loc_AF24D
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_9], 1
		mov	[bp+var_D0A], 498h
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_D0A]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_AF2A2:
		cmp	[bp+var_26], 3
		jnz	short loc_AF2C3
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_AF2DC

loc_AF2C3:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_AF2DC:
		push	ds
		lea	ax, [bp+var_1F8]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_AF301
		mov	[bp+var_7], 1
		mov	al, [bp+var_9]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AF301
		mov	word_4F048, 0FFh

loc_AF301:
		jmp	short loc_AF303

loc_AF303:
		mov	ax, word_4B7BE
		mov	[bp+var_2E], ax
		mov	ax, word_4B7C0
		mov	[bp+var_2C], ax
		mov	ax, word_4B7C2
		mov	[bp+var_2A], ax
		mov	al, byte_4B7C4
		mov	[bp+var_28], al
		cmp	[bp+var_9], 0
		jnz	short loc_AF324
		jmp	loc_AF43A

loc_AF324:
		mov	[bp+var_C6C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_C6A], ax
		lea	ax, [bp+var_C6C]
		mov	word_4D392, ax
		mov	[bp+var_C6C], 1BCh
		mov	[bp+var_C68], 0
		mov	[bp+var_C64], 0
		mov	[bp+var_C70], 0
		mov	[bp+var_C6E], 0FFFFh
		push	word_4CA5D
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		mov	word ptr [bp+var_12C+2], 0
		jmp	loc_AF414

loc_AF372:
		mov	[bp+var_134], 0
		mov	byte ptr [bp+var_132+2], 2
		mov	byte ptr [bp+var_132+3], 0
		mov	[bp+var_12E], 0
		push	3
		lea	ax, word ptr [bp+var_134]
		push	ax
		lea	ax, [bp+var_2E]
		mov	bx, word ptr [bp+var_12C+2]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_3F4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		lea	ax, word ptr [bp+var_134]
		push	ax
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_C70]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		cmp	byte ptr [bp+var_132+3], 0
		jz	short loc_AF3F9
		cmp	[bp+var_134], 0
		jz	short loc_AF3F9
		push	0
		mov	al, byte ptr [bp+var_132+2]
		push	ax
		lea	ax, word ptr [bp+var_134]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AF3F9

loc_AF3F9:
		mov	[bp+var_134], 0
		mov	byte ptr [bp+var_132+3], 0
		mov	[bp+var_12E], 0
		inc	word ptr [bp+var_12C+2]

loc_AF414:
		cmp	word ptr [bp+var_12C+2], 7
		jge	short loc_AF41E
		jmp	loc_AF372

loc_AF41E:
		lea	ax, [bp+var_C70]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_C6C]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_AF43A:
		mov	[bp+var_3FE], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_3FC], ax
		lea	ax, [bp+var_3FE]
		mov	word_4D392, ax
		mov	[bp+var_3FE], 1BCh
		mov	[bp+var_3FA], 0
		mov	[bp+var_3F6], 0
		mov	[bp+var_402], 0
		mov	[bp+var_400], 0FFFFh
		cmp	[bp+var_7], 0
		jnz	short loc_AF477
		jmp	loc_AF4F7

loc_AF477:
		push	1
		lea	ax, [bp+var_1F8]
		push	ax
		lea	ax, [bp+var_CDA]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_CDA]
		push	ax
		call	sub_435F1
		add	sp, 2
		cmp	[bp+var_8], 0
		jz	short loc_AF4A5
		mov	byte ptr [bp+var_12C+3], 16h
		jmp	short loc_AF4AA

loc_AF4A5:
		mov	byte ptr [bp+var_12C+3], 15h

loc_AF4AA:
		push	3
		lea	ax, word ptr [bp+var_24]
		push	ax
		mov	al, byte ptr [bp+var_12C+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_CDA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_402]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, [bp+var_402]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, [bp+var_CDA]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_AF4F7:
		mov	[bp+var_C28], 129Fh
		mov	[bp+var_C18], 0
		mov	[bp+var_C14], 2
		mov	[bp+var_C13], 0
		mov	[bp+var_C12], 0
		mov	[bp+var_C26], 0
		mov	[bp+var_C28], 1FA5h
		xor	eax, eax
		mov	[bp+var_40B], eax
		mov	[bp+var_407], eax
		cmp	[bp+var_8], 0
		jz	short loc_AF54C
		push	word_4CA5B
		lea	ax, [bp+var_C28]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		jmp	loc_AF8A4

loc_AF54C:
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_43
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_D0A]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_D0A], 480h
		mov	[bp+var_CA9], 100h
		mov	[bp+var_CAD], 0
		mov	[bp+var_D0A], 498h
		push	1
		lea	ax, [bp+var_1F8]
		push	ax
		lea	ax, [bp+var_D0A]
		push	ax
		mov	bx, [bp+var_D0A]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3633474Dh
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		mov	word ptr [bp+var_12C+2], 0
		jmp	short loc_AF626

loc_AF5D8:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	ax, [bp+var_C98]
		mov	word ptr [bp+var_12C], ax
		movsx	eax, word ptr [bp+var_12C]
		push	eax
		push	ds
		mov	ax, [bp+var_6]
		imul	word ptr [bp+var_12C+2]
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_C94]
		mov	[bp+var_CA5], eax
		inc	word ptr [bp+var_12C+2]

loc_AF626:
		cmp	word ptr [bp+var_12C+2], 0Ch
		jl	short loc_AF5D8
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_AF681
		push	[bp+arg_2]
		mov	ax, [bp+var_6]
		shl	ax, 1
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_6]
		shl	ax, 2
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_6]
		shl	ax, 1
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_AF74E

loc_AF681:
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_AF6C8
		push	[bp+arg_0]
		mov	ax, [bp+var_6]
		shl	ax, 1
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_6]
		shl	ax, 2
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_6]
		shl	ax, 1
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_AF74E

loc_AF6C8:
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_AF70E
		push	[bp+arg_4]
		mov	ax, [bp+var_6]
		shl	ax, 1
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_6]
		shl	ax, 2
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_6]
		shl	ax, 1
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_AF74E

loc_AF70E:
		mov	ax, [bp+var_6]
		shl	ax, 1
		add	ax, [bp+var_6]
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_6]
		shl	ax, 1
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_6]
		shl	ax, 2
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_6]
		shl	ax, 1
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_AF74E:
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_AF79D
		push	[bp+arg_0]
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_6]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_AF882

loc_AF79D:
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_AF7EC
		push	[bp+arg_4]
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_6]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_AF882

loc_AF7EC:
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_AF83A
		push	[bp+arg_2]
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_6]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_AF882

loc_AF83A:
		mov	ax, [bp+var_6]
		shl	ax, 1
		add	ax, [bp+var_6]
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_6]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_AF882:
		mov	[bp+var_D0A], 498h
		lea	ax, [bp+var_D0A]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_D0A]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_AF8A4:
		mov	[bp+var_38], 0
		mov	[bp+var_34], 2
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	3
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	2Ah
		lea	ax, [bp+var_304]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_42], 0
		mov	[bp+var_3E], 2
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		push	3
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	2Ch
		lea	ax, [bp+var_304]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_4C], 0
		mov	[bp+var_48], 2
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		push	3
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	12h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_56], 0
		mov	[bp+var_52], 2
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	3
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	0
		lea	ax, [bp+var_28C]
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
		push	3
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_6A], 0
		mov	[bp+var_66], 2
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	2Bh
		lea	ax, [bp+var_304]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_6D], 0
		lea	ax, word ptr [bp+var_6A]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_7A], 0
		mov	[bp+var_76], 2
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, word ptr [bp+var_7A]
		push	ax
		push	2Dh
		lea	ax, [bp+var_304]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_7D], 0
		lea	ax, word ptr [bp+var_7A]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_8A], 0
		mov	[bp+var_86], 2
		mov	[bp+var_85], 0
		mov	[bp+var_84], 0
		push	2
		lea	ax, word ptr [bp+var_8A]
		push	ax
		push	24h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_8D], 0
		lea	ax, word ptr [bp+var_8A]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_9A], 0
		mov	[bp+var_96], 2
		mov	[bp+var_95], 0
		mov	[bp+var_94], 0
		push	2
		lea	ax, word ptr [bp+var_9A]
		push	ax
		push	25h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_9D], 0
		lea	ax, word ptr [bp+var_9A]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_AA], 0
		mov	[bp+var_A6], 2
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		push	2
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	1Eh
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_AD], 0
		lea	ax, word ptr [bp+var_AA]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	2
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	2Fh
		lea	ax, [bp+var_304]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_BD], 0
		lea	ax, word ptr [bp+var_BA]
		push	ax
		lea	ax, [bp+var_C0]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_CA], 0
		mov	[bp+var_C6], 2
		mov	[bp+var_C5], 0
		mov	[bp+var_C4], 0
		push	0
		push	2
		lea	ax, word ptr [bp+var_CA]
		push	ax
		call	ConvData_LoadNormalOrNight_10C9F
		add	sp, 6
		mov	[bp+var_CD], 0
		lea	ax, word ptr [bp+var_CA]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_DA], 0
		mov	[bp+var_D6], 2
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		push	3
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	2E18h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_E4], 0
		mov	[bp+var_E0], 2
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		push	3
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	2E1Ch
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_EE], 0
		mov	[bp+var_EA], 2
		mov	[bp+var_E9], 0
		mov	[bp+var_E8], 0
		push	3
		lea	ax, word ptr [bp+var_EE]
		push	ax
		push	2E22h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_F8], 0
		mov	[bp+var_F4], 2
		mov	[bp+var_F3], 0
		mov	[bp+var_F2], 0
		push	3
		lea	ax, word ptr [bp+var_F8]
		push	ax
		push	2E29h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_102], 0
		mov	[bp+var_FE], 2
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		push	3
		lea	ax, word ptr [bp+var_102]
		push	ax
		push	2E2Eh
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_10C], 0
		mov	[bp+var_108], 2
		mov	[bp+var_107], 0
		mov	[bp+var_106], 0
		push	3
		lea	ax, word ptr [bp+var_10C]
		push	ax
		push	2E32h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_116], 0
		mov	[bp+var_112], 2
		mov	[bp+var_111], 0
		mov	[bp+var_110], 0
		push	3
		lea	ax, word ptr [bp+var_116]
		push	ax
		push	2E39h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_120], 0
		mov	[bp+var_11C], 2
		mov	[bp+var_11B], 0
		mov	[bp+var_11A], 0
		push	ds
		push	offset aShp
		push	ds
		push	offset aConvfont_3
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_1F8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_1F8]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_124+2], dx
		mov	word ptr [bp+var_124], ax
		mov	eax, [bp+var_124]
		mov	[bp+var_120], eax
		mov	[bp+var_11C], 2
		mov	[bp+var_11B], 1
		mov	[bp+var_11A], 0
		lea	ax, word ptr [bp+var_120]
		push	ax
		lea	ax, [bp+var_C40]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		lea	ax, [bp+var_C40]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	[bp+var_D1A], 0
		mov	[bp+var_D18], 98h
		mov	[bp+var_D16], 13Fh
		mov	[bp+var_D14], 0C7h
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0C8h
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_AFD8D
		jmp	loc_B5097

loc_AFD8D:
		cmp	[bp+var_7], 0
		jz	short loc_AFDD7
		mov	ax, word_4F048
		mov	[bp+var_126], ax
		mov	[bp+var_128], 0
		cmp	[bp+var_402], 0
		jz	short loc_AFDD7
		push	[bp+var_400]
		mov	bx, [bp+var_402]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_128]
		push	[bp+var_126]
		push	[bp+var_400]
		mov	bx, [bp+var_402]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_AFDD7

loc_AFDD7:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E], 2
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		mov	[bp+var_C6C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_C6A], ax
		lea	ax, [bp+var_C6C]
		mov	word_4D392, ax
		mov	[bp+var_C6C], 1BCh
		mov	[bp+var_C68], 0
		mov	[bp+var_C64], 0
		mov	[bp+var_C70], 0
		mov	[bp+var_C6E], 0FFFFh
		cmp	[bp+var_9], 0
		jnz	short loc_AFE30
		jmp	loc_AFEAF

loc_AFE30:
		push	3
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	3Eh
		lea	ax, [bp+var_3F4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_132]
		push	ax
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFF0
		mov	word ptr [bp+var_134], ax
		mov	word ptr [bp+var_136], 0
		cmp	[bp+var_C70], 0
		jz	short loc_AFEAF
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_136]
		push	word ptr [bp+var_134]
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_AFEAF

loc_AFEAF:
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13C], 2
		mov	byte ptr [bp+var_13C+1], 0
		mov	[bp+var_13A], 0
		push	3
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	4
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146], 2
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	5
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150], 2
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_14E], 0
		push	2
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	20h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_158+1], 0
		lea	ax, word ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_15C], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_15E], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_160], ax
		push	0A0h
		push	0A0h
		lea	ax, [bp+var_C62]
		push	ax
		push	0
		call	TextLayer_Construct_F542
		add	sp, 8
		mov	word ptr [bp+var_164+2], ax
		push	word ptr [bp+var_15A]
		mov	al, byte ptr [bp+var_158]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_15C]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_160]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_15E]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_164+2]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	word ptr [bp+var_164], 0
		jmp	short loc_B008B

loc_B005A:
		mov	ax, word ptr [bp+var_164]
		mov	word ptr [bp+var_166], ax
		inc	word ptr [bp+var_164]
		mov	bx, word ptr [bp+var_15E]
		mov	ax, word ptr [bp+var_166]
		mov	[bx+1Bh], ax
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B007E
		jmp	short loc_B007E
		jmp	short loc_B00A6

loc_B007E:
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B008B:
		cmp	word ptr [bp+var_C76+1], 1Fh
		jnb	short loc_B0099
		cmp	byte ptr [bp+var_C76+3], 0
		jz	short loc_B009E

loc_B0099:
		mov	ax, 1
		jmp	short loc_B00A0

loc_B009E:
		xor	ax, ax

loc_B00A0:
		mov	ah, 0
		or	ax, ax
		jz	short loc_B005A

loc_B00A6:
		push	0
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_15A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_150+1], 0
		jz	short loc_B00EA
		cmp	[bp+var_154], 0
		jz	short loc_B00EA
		push	0
		mov	al, byte ptr [bp+var_150]
		push	ax
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B00EA

loc_B00EA:
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_14E], 0
		cmp	byte ptr [bp+var_146+1], 0
		jz	short loc_B0129
		cmp	[bp+var_14A], 0
		jz	short loc_B0129
		push	0
		mov	al, byte ptr [bp+var_146]
		push	ax
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B0129

loc_B0129:
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		cmp	byte ptr [bp+var_13C+1], 0
		jz	short loc_B0168
		cmp	[bp+var_140], 0
		jz	short loc_B0168
		push	0
		mov	al, byte ptr [bp+var_13C]
		push	ax
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B0168

loc_B0168:
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13C+1], 0
		mov	[bp+var_13A], 0
		lea	ax, [bp+var_C70]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_C6C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_12E+1], 0
		jz	short loc_B01C3
		cmp	[bp+var_132], 0
		jz	short loc_B01C3
		push	0
		mov	al, byte ptr [bp+var_12E]
		push	ax
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B01C3

loc_B01C3:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		cmp	byte_4F55C, 0
		jz	short loc_B01E4
		jmp	loc_B5097

loc_B01E4:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E], 2
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		push	3
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	0Bh
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+2], 2
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		push	3
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	0Ch
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_146], 0
		mov	byte ptr [bp+var_142], 2
		mov	byte ptr [bp+var_142+1], 0
		mov	[bp+var_140], 0
		push	3
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	0Eh
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14E+2], 2
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		push	3
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	0Dh
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_156], 2
		mov	byte ptr [bp+var_156+1], 0
		mov	[bp+var_154], 0
		push	3
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	0Fh
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160], 2
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_15E], 0
		push	3
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	10h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_16E], 0
		mov	byte ptr [bp+var_16A], 2
		mov	byte ptr [bp+var_16A+1], 0
		mov	[bp+var_168], 0
		push	2
		lea	ax, word ptr [bp+var_16E]
		push	ax
		push	23h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_172+1], 0
		lea	ax, word ptr [bp+var_16E]
		push	ax
		lea	ax, word ptr [bp+var_174]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_17E], 0
		mov	byte ptr [bp+var_17A], 2
		mov	byte ptr [bp+var_17A+1], 0
		mov	[bp+var_178], 0
		push	2
		lea	ax, word ptr [bp+var_17E]
		push	ax
		push	22h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_181], 0
		lea	ax, word ptr [bp+var_17E]
		push	ax
		lea	ax, [bp+var_184]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_186], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_188], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_18A], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_18C], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_18E], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_190], ax
		push	word ptr [bp+var_174]
		mov	al, byte ptr [bp+var_172]
		push	ax
		lea	ax, word ptr [bp+var_174]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_184]
		mov	al, byte ptr [bp+var_182]
		push	ax
		lea	ax, [bp+var_184]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_186]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_188]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_18A]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_18C]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_18E]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_190]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_192], 0
		jmp	short loc_B0587

loc_B050A:
		mov	ax, word ptr [bp+var_C68+1]
		mov	[bp+var_194], ax
		cmp	[bp+var_194], 8
		jnz	short loc_B0522
		mov	bx, [bp+var_18C]
		mov	word ptr [bx+1Bh], 1

loc_B0522:
		cmp	[bp+var_194], 9
		jnz	short loc_B0532
		mov	bx, [bp+var_190]
		mov	word ptr [bx+1Bh], 1

loc_B0532:
		cmp	[bp+var_194], 0Ah
		jnz	short loc_B0542
		mov	bx, [bp+var_190]
		mov	word ptr [bx+1Bh], 2

loc_B0542:
		cmp	[bp+var_194], 7
		jge	short loc_B056D
		mov	ax, [bp+var_192]
		mov	[bp+var_196], ax
		inc	[bp+var_192]
		mov	bx, [bp+var_18E]
		mov	ax, [bp+var_196]
		mov	[bx+1Bh], ax
		cmp	[bp+var_192], 1
		jle	short loc_B056D
		mov	[bp+var_192], 0

loc_B056D:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B057A
		jmp	short loc_B057A
		jmp	short loc_B05A5

loc_B057A:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B0587:
		cmp	word ptr [bp+var_C68+1], 0Ch
		jnb	short loc_B0595
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B059A

loc_B0595:
		mov	ax, 1
		jmp	short loc_B059C

loc_B059A:
		xor	ax, ax

loc_B059C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B05A5
		jmp	loc_B050A

loc_B05A5:
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_184]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_17A+1], 0
		jz	short loc_B05E9
		cmp	[bp+var_17E], 0
		jz	short loc_B05E9
		push	0
		mov	al, byte ptr [bp+var_17A]
		push	ax
		lea	ax, word ptr [bp+var_17E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B05E9

loc_B05E9:
		mov	[bp+var_17E], 0
		mov	byte ptr [bp+var_17A+1], 0
		mov	[bp+var_178], 0
		lea	ax, word ptr [bp+var_174]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_16A+1], 0
		jz	short loc_B0635
		cmp	[bp+var_16E], 0
		jz	short loc_B0635
		push	0
		mov	al, byte ptr [bp+var_16A]
		push	ax
		lea	ax, word ptr [bp+var_16E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B0635

loc_B0635:
		mov	[bp+var_16E], 0
		mov	byte ptr [bp+var_16A+1], 0
		mov	[bp+var_168], 0
		cmp	byte ptr [bp+var_160+1], 0
		jz	short loc_B0674
		cmp	[bp+var_164], 0
		jz	short loc_B0674
		push	0
		mov	al, byte ptr [bp+var_160]
		push	ax
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B0674

loc_B0674:
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_15E], 0
		cmp	byte ptr [bp+var_156+1], 0
		jz	short loc_B06B3
		cmp	[bp+var_15A], 0
		jz	short loc_B06B3
		push	0
		mov	al, byte ptr [bp+var_156]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B06B3

loc_B06B3:
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_156+1], 0
		mov	[bp+var_154], 0
		cmp	byte ptr [bp+var_14E+3], 0
		jz	short loc_B06F2
		cmp	[bp+var_150], 0
		jz	short loc_B06F2
		push	0
		mov	al, byte ptr [bp+var_14E+2]
		push	ax
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B06F2

loc_B06F2:
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		cmp	byte ptr [bp+var_142+1], 0
		jz	short loc_B0731
		cmp	[bp+var_146], 0
		jz	short loc_B0731
		push	0
		mov	al, byte ptr [bp+var_142]
		push	ax
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B0731

loc_B0731:
		mov	[bp+var_146], 0
		mov	byte ptr [bp+var_142+1], 0
		mov	[bp+var_140], 0
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_B0770
		cmp	[bp+var_13C], 0
		jz	short loc_B0770
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B0770

loc_B0770:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		cmp	byte ptr [bp+var_12E+1], 0
		jz	short loc_B07AF
		cmp	[bp+var_132], 0
		jz	short loc_B07AF
		push	0
		mov	al, byte ptr [bp+var_12E]
		push	ax
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B07AF

loc_B07AF:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		cmp	byte_4F55C, 0
		jz	short loc_B07D0
		jmp	loc_B5097

loc_B07D0:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E], 2
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		mov	[bp+var_C6C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_C6A], ax
		lea	ax, [bp+var_C6C]
		mov	word_4D392, ax
		mov	[bp+var_C6C], 1BCh
		mov	[bp+var_C68], 0
		mov	[bp+var_C64], 0
		mov	[bp+var_C70], 0
		mov	[bp+var_C6E], 0FFFFh
		cmp	[bp+var_9], 0
		jnz	short loc_B0829
		jmp	loc_B08A8

loc_B0829:
		push	3
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	3Eh
		lea	ax, [bp+var_3F4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_132]
		push	ax
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFF0
		mov	word ptr [bp+var_134], ax
		mov	word ptr [bp+var_136], 0
		cmp	[bp+var_C70], 0
		jz	short loc_B08A8
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_136]
		push	word ptr [bp+var_134]
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_B08A8

loc_B08A8:
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13C], 2
		mov	byte ptr [bp+var_13C+1], 0
		mov	[bp+var_13A], 0
		push	3
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	7
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146], 2
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	6
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150], 2
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_14E], 0
		push	2
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	21h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_158+1], 0
		lea	ax, word ptr [bp+var_154]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_15C], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_15E], ax
		push	word ptr [bp+var_15A]
		mov	al, byte ptr [bp+var_158]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_15C]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_15E]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	word ptr [bp+var_160], 8
		jmp	short loc_B0A65

loc_B0A02:
		mov	ax, word ptr [bp+var_160]
		mov	word ptr [bp+var_164+2], ax
		inc	word ptr [bp+var_160]
		mov	bx, word ptr [bp+var_15E]
		mov	ax, word ptr [bp+var_164+2]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_160], 29h
		jnz	short loc_B0A4B
		push	word ptr [bp+var_15E]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	word ptr [bp+var_15E], 0
		jz	short loc_B0A4B
		push	3
		push	word ptr [bp+var_15E]
		mov	bx, word ptr [bp+var_15E]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_B0A4B

loc_B0A4B:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B0A58
		jmp	short loc_B0A58
		jmp	short loc_B0A80

loc_B0A58:
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B0A65:
		cmp	word ptr [bp+var_C76+1], 23h
		jnb	short loc_B0A73
		cmp	byte ptr [bp+var_C76+3], 0
		jz	short loc_B0A78

loc_B0A73:
		mov	ax, 1
		jmp	short loc_B0A7A

loc_B0A78:
		xor	ax, ax

loc_B0A7A:
		mov	ah, 0
		or	ax, ax
		jz	short loc_B0A02

loc_B0A80:
		push	0
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_15A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_150+1], 0
		jz	short loc_B0AC4
		cmp	[bp+var_154], 0
		jz	short loc_B0AC4
		push	0
		mov	al, byte ptr [bp+var_150]
		push	ax
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B0AC4

loc_B0AC4:
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_14E], 0
		cmp	byte ptr [bp+var_146+1], 0
		jz	short loc_B0B03
		cmp	[bp+var_14A], 0
		jz	short loc_B0B03
		push	0
		mov	al, byte ptr [bp+var_146]
		push	ax
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B0B03

loc_B0B03:
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		cmp	byte ptr [bp+var_13C+1], 0
		jz	short loc_B0B42
		cmp	[bp+var_140], 0
		jz	short loc_B0B42
		push	0
		mov	al, byte ptr [bp+var_13C]
		push	ax
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B0B42

loc_B0B42:
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13C+1], 0
		mov	[bp+var_13A], 0
		lea	ax, [bp+var_C70]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_C6C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_12E+1], 0
		jz	short loc_B0B9D
		cmp	[bp+var_132], 0
		jz	short loc_B0B9D
		push	0
		mov	al, byte ptr [bp+var_12E]
		push	ax
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B0B9D

loc_B0B9D:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		cmp	byte_4F55C, 0
		jz	short loc_B0BBE
		jmp	loc_B5097

loc_B0BBE:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E], 2
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		mov	[bp+var_C6C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_C6A], ax
		lea	ax, [bp+var_C6C]
		mov	word_4D392, ax
		mov	[bp+var_C6C], 1BCh
		mov	[bp+var_C68], 0
		mov	[bp+var_C64], 0
		mov	[bp+var_C70], 0
		mov	[bp+var_C6E], 0FFFFh
		cmp	[bp+var_9], 0
		jnz	short loc_B0C17
		jmp	loc_B0C96

loc_B0C17:
		push	3
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	7
		lea	ax, [bp+var_3F4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_132]
		push	ax
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF82
		mov	word ptr [bp+var_134], ax
		mov	word ptr [bp+var_136], 0
		cmp	[bp+var_C70], 0
		jz	short loc_B0C96
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_136]
		push	word ptr [bp+var_134]
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_B0C96

loc_B0C96:
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13C], 2
		mov	byte ptr [bp+var_13C+1], 0
		mov	[bp+var_13A], 0
		push	3
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	2
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146], 2
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	32h
		lea	ax, [bp+var_304]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150], 2
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_14E], 0
		push	3
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	1
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_15E], 0
		mov	byte ptr [bp+var_15A], 2
		mov	byte ptr [bp+var_15A+1], 0
		mov	[bp+var_158], 0
		push	2
		lea	ax, word ptr [bp+var_15E]
		push	ax
		push	1Fh
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_161], 0
		lea	ax, word ptr [bp+var_15E]
		push	ax
		lea	ax, word ptr [bp+var_164]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_166], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_168], ax
		push	0Ch
		push	0
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_16A], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_16E+2], ax
		push	0FFF5h
		push	2Ch
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_16E], ax
		push	word ptr [bp+var_164]
		mov	al, byte ptr [bp+var_164+2]
		push	ax
		lea	ax, word ptr [bp+var_164]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_166]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_168]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_16A]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_16E]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	bx, word ptr [bp+var_16E]
		mov	word ptr [bx+1Bh], 3
		jmp	short loc_B0ED7

loc_B0EA9:
		push	1
		push	0FFFCh
		push	word ptr [bp+var_16E]
		mov	bx, word ptr [bp+var_16E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B0ECA
		jmp	short loc_B0ECA
		jmp	short loc_B0EF2

loc_B0ECA:
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B0ED7:
		cmp	word ptr [bp+var_C76+1], 0Ah
		jnb	short loc_B0EE5
		cmp	byte ptr [bp+var_C76+3], 0
		jz	short loc_B0EEA

loc_B0EE5:
		mov	ax, 1
		jmp	short loc_B0EEC

loc_B0EEA:
		xor	ax, ax

loc_B0EEC:
		mov	ah, 0
		or	ax, ax
		jz	short loc_B0EA9

loc_B0EF2:
		push	word ptr [bp+var_16E]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	word ptr [bp+var_16E], 0
		jz	short loc_B0F1D
		push	3
		push	word ptr [bp+var_16E]
		mov	bx, word ptr [bp+var_16E]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_B0F1D

loc_B0F1D:
		push	word ptr [bp+var_16E+2]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	word ptr [bp+var_C76+1], 0
		mov	word ptr [bp+var_170], 0
		mov	word ptr [bp+var_172], 3
		jmp	short loc_B0FB2

loc_B0F42:
		mov	ax, word ptr [bp+var_C76+1]
		mov	word ptr [bp+var_174], ax
		cmp	word ptr [bp+var_174], 33h
		jge	short loc_B0F6A
		mov	ax, word ptr [bp+var_172]
		mov	word ptr [bp+var_178+2], ax
		inc	word ptr [bp+var_172]
		mov	bx, word ptr [bp+var_16E+2]
		mov	ax, word ptr [bp+var_178+2]
		mov	[bx+1Bh], ax
		jmp	short loc_B0F98

loc_B0F6A:
		mov	ax, word ptr [bp+var_170]
		mov	word ptr [bp+var_178], ax
		inc	word ptr [bp+var_170]
		mov	bx, word ptr [bp+var_16A]
		mov	ax, word ptr [bp+var_178]
		mov	[bx+1Bh], ax
		mov	ax, word ptr [bp+var_172]
		mov	word ptr [bp+var_17A], ax
		inc	word ptr [bp+var_172]
		mov	bx, word ptr [bp+var_16E+2]
		mov	ax, word ptr [bp+var_17A]
		mov	[bx+1Bh], ax

loc_B0F98:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B0FA5
		jmp	short loc_B0FA5
		jmp	short loc_B0FD0

loc_B0FA5:
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B0FB2:
		cmp	word ptr [bp+var_C76+1], 49h
		jnb	short loc_B0FC0
		cmp	byte ptr [bp+var_C76+3], 0
		jz	short loc_B0FC5

loc_B0FC0:
		mov	ax, 1
		jmp	short loc_B0FC7

loc_B0FC5:
		xor	ax, ax

loc_B0FC7:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B0FD0
		jmp	loc_B0F42

loc_B0FD0:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_164]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_15A+1], 0
		jz	short loc_B1022
		cmp	[bp+var_15E], 0
		jz	short loc_B1022
		push	0
		mov	al, byte ptr [bp+var_15A]
		push	ax
		lea	ax, word ptr [bp+var_15E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B1022

loc_B1022:
		mov	[bp+var_15E], 0
		mov	byte ptr [bp+var_15A+1], 0
		mov	[bp+var_158], 0
		cmp	byte ptr [bp+var_150+1], 0
		jz	short loc_B1061
		cmp	[bp+var_154], 0
		jz	short loc_B1061
		push	0
		mov	al, byte ptr [bp+var_150]
		push	ax
		lea	ax, word ptr [bp+var_154]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B1061

loc_B1061:
		mov	[bp+var_154], 0
		mov	byte ptr [bp+var_150+1], 0
		mov	[bp+var_14E], 0
		cmp	byte ptr [bp+var_146+1], 0
		jz	short loc_B10A0
		cmp	[bp+var_14A], 0
		jz	short loc_B10A0
		push	0
		mov	al, byte ptr [bp+var_146]
		push	ax
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B10A0

loc_B10A0:
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		cmp	byte ptr [bp+var_13C+1], 0
		jz	short loc_B10DF
		cmp	[bp+var_140], 0
		jz	short loc_B10DF
		push	0
		mov	al, byte ptr [bp+var_13C]
		push	ax
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B10DF

loc_B10DF:
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13C+1], 0
		mov	[bp+var_13A], 0
		lea	ax, [bp+var_C70]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_C6C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_12E+1], 0
		jz	short loc_B113A
		cmp	[bp+var_132], 0
		jz	short loc_B113A
		push	0
		mov	al, byte ptr [bp+var_12E]
		push	ax
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B113A

loc_B113A:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		cmp	byte_4F55C, 0
		jz	short loc_B115B
		jmp	loc_B5097

loc_B115B:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E], 2
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+2], 2
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		mov	[bp+var_C6C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_C6A], ax
		lea	ax, [bp+var_C6C]
		mov	word_4D392, ax
		mov	[bp+var_C6C], 1BCh
		mov	[bp+var_C68], 0
		mov	[bp+var_C64], 0
		mov	[bp+var_C70], 0
		mov	[bp+var_C6E], 0FFFFh
		mov	[bp+var_C7A], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_C78], ax
		lea	ax, [bp+var_C7A]
		mov	word_4D392, ax
		mov	[bp+var_C7A], 1BCh
		mov	[bp+var_C76], 0
		mov	[bp+var_C72], 0
		mov	[bp+var_C7E], 0
		mov	[bp+var_C7C], 0FFFFh
		cmp	[bp+var_9], 0
		jnz	short loc_B1204
		jmp	loc_B12BE

loc_B1204:
		push	3
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	5Dh
		lea	ax, [bp+var_3F4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_132]
		push	ax
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4F02E
		mov	word ptr [bp+var_140+2], ax
		mov	word ptr [bp+var_140], 0
		cmp	[bp+var_C70], 0
		jz	short loc_B1283
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_140]
		push	word ptr [bp+var_140+2]
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_B1283

loc_B1283:
		push	3
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	14h
		lea	ax, [bp+var_3F4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_C7E]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_13C]
		push	ax
		lea	ax, [bp+var_C7E]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_B12BE:
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146], 2
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	0Ah
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_CA0]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_14E+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_14E], ax
		push	1
		push	0
		push	0
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_150], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_154+2], ax
		push	[bp+var_70]
		mov	al, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_B0]
		mov	al, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_C0]
		mov	al, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_14E+2]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_14E]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_150]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_154+2]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, [bp+var_CA0]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_15C], 0
		mov	byte ptr [bp+var_158], 2
		mov	byte ptr [bp+var_158+1], 0
		mov	[bp+var_156], 0
		push	2
		lea	ax, word ptr [bp+var_15C]
		push	ax
		push	30h
		lea	ax, [bp+var_304]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_166], 0
		mov	byte ptr [bp+var_164+2], 2
		mov	byte ptr [bp+var_161], 0
		mov	[bp+var_160], 0
		push	2
		lea	ax, word ptr [bp+var_166]
		push	ax
		push	31h
		lea	ax, [bp+var_304]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_170], 0
		mov	byte ptr [bp+var_16E+2], 2
		mov	byte ptr [bp+var_16E+3], 0
		mov	[bp+var_16A], 0
		push	2
		lea	ax, word ptr [bp+var_170]
		push	ax
		push	8
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_17A], 0
		mov	byte ptr [bp+var_178+2], 2
		mov	byte ptr [bp+var_178+3], 0
		mov	[bp+var_174], 0
		push	2
		lea	ax, word ptr [bp+var_17A]
		push	ax
		push	1Bh
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_15C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_17E+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_166]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_17E], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_170]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_180], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_17A]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_182], ax
		mov	[bp+var_C83], 0
		push	word ptr [bp+var_150]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	word ptr [bp+var_154+2]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	word ptr [bp+var_17E+2]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_180]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_150]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_154+2]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_184], 0
		mov	[bp+var_186], 0
		jmp	loc_B1870

loc_B15C0:
		mov	ax, [bp+var_C83]
		mov	[bp+var_188], ax
		cmp	[bp+var_188], 14h
		jnz	short loc_B15DE
		push	0Dh
		lea	ax, [bp+var_CA0]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_B15DE:
		cmp	[bp+var_188], 1Eh
		jnz	short loc_B15F4
		push	0Bh
		lea	ax, [bp+var_CA0]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_B15F4:
		cmp	[bp+var_188], 28h
		jnz	short loc_B160A
		push	9
		lea	ax, [bp+var_CA0]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_B160A:
		cmp	[bp+var_188], 32h
		jnz	short loc_B1620
		push	7
		lea	ax, [bp+var_CA0]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_B1620:
		cmp	[bp+var_188], 1Eh
		jge	short loc_B1658
		mov	ax, [bp+var_184]
		mov	[bp+var_18A], ax
		inc	[bp+var_184]
		mov	bx, word ptr [bp+var_17E+2]
		mov	ax, [bp+var_18A]
		mov	[bx+1Bh], ax
		mov	ax, [bp+var_186]
		mov	[bp+var_18C], ax
		inc	[bp+var_186]
		mov	bx, [bp+var_180]
		mov	ax, [bp+var_18C]
		mov	[bx+1Bh], ax
		jmp	loc_B1856

loc_B1658:
		cmp	[bp+var_188], 1Eh
		jz	short loc_B1662
		jmp	loc_B1719

loc_B1662:
		mov	[bp+var_184], 0
		push	word ptr [bp+var_17E+2]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	word ptr [bp+var_17E+2], 0
		jz	short loc_B1693
		push	3
		push	word ptr [bp+var_17E+2]
		mov	bx, word ptr [bp+var_17E+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_B1693

loc_B1693:
		push	word ptr [bp+var_150]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	word ptr [bp+var_154+2]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	word ptr [bp+var_17E]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_150]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_154+2]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	ax, [bp+var_184]
		mov	[bp+var_18E], ax
		inc	[bp+var_184]
		mov	bx, word ptr [bp+var_17E]
		mov	ax, [bp+var_18E]
		mov	[bx+1Bh], ax
		mov	ax, [bp+var_186]
		mov	[bp+var_190], ax
		inc	[bp+var_186]
		mov	bx, [bp+var_180]
		mov	ax, [bp+var_190]
		mov	[bx+1Bh], ax
		jmp	loc_B1856

loc_B1719:
		cmp	[bp+var_188], 1Eh
		jle	short loc_B1758
		cmp	[bp+var_188], 32h
		jge	short loc_B1758
		mov	ax, [bp+var_184]
		mov	[bp+var_192], ax
		inc	[bp+var_184]
		mov	bx, word ptr [bp+var_17E]
		mov	ax, [bp+var_192]
		mov	[bx+1Bh], ax
		mov	ax, [bp+var_186]
		mov	[bp+var_194], ax
		inc	[bp+var_186]
		mov	bx, [bp+var_180]
		mov	ax, [bp+var_194]
		mov	[bx+1Bh], ax
		jmp	loc_B1856

loc_B1758:
		cmp	[bp+var_188], 3Ch
		jz	short loc_B1762
		jmp	loc_B1829

loc_B1762:
		cmp	[bp+var_9], 0
		jnz	short loc_B176B
		jmp	loc_B17EA

loc_B176B:
		push	3
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	14h
		lea	ax, [bp+var_3F4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_C7E]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_13C]
		push	ax
		lea	ax, [bp+var_C7E]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EF9C
		mov	[bp+var_196], ax
		mov	[bp+var_198], 0
		cmp	[bp+var_C7E], 0
		jz	short loc_B17EA
		push	[bp+var_C7C]
		mov	bx, [bp+var_C7E]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_198]
		push	[bp+var_196]
		push	[bp+var_C7C]
		mov	bx, [bp+var_C7E]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_B17EA

loc_B17EA:
		mov	[bp+var_184], 0
		push	0Fh
		lea	ax, [bp+var_CA0]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4
		push	[bp+var_182]
		lea	ax, [bp+var_CA0]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	ax, [bp+var_184]
		mov	[bp+var_19A], ax
		inc	[bp+var_184]
		mov	bx, [bp+var_182]
		mov	ax, [bp+var_19A]
		mov	[bx+1Bh], ax
		jmp	short loc_B1856

loc_B1829:
		cmp	[bp+var_188], 3Ch
		jle	short loc_B1856
		cmp	[bp+var_188], 4Eh
		jge	short loc_B1856
		test	[bp+var_188], 1
		jz	short loc_B1856
		mov	ax, [bp+var_184]
		mov	[bp+var_19C], ax
		inc	[bp+var_184]
		mov	bx, [bp+var_182]
		mov	ax, [bp+var_19C]
		mov	[bx+1Bh], ax

loc_B1856:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B1863
		jmp	short loc_B1863
		jmp	short loc_B188E

loc_B1863:
		lea	ax, [bp+var_CA0]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B1870:
		cmp	[bp+var_C83], 58h
		jnb	short loc_B187E
		cmp	[bp+var_C81], 0
		jz	short loc_B1883

loc_B187E:
		mov	ax, 1
		jmp	short loc_B1885

loc_B1883:
		xor	ax, ax

loc_B1885:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B188E
		jmp	loc_B15C0

loc_B188E:
		cmp	byte ptr [bp+var_178+3], 0
		jz	short loc_B18B6
		cmp	[bp+var_17A], 0
		jz	short loc_B18B6
		push	0
		mov	al, byte ptr [bp+var_178+2]
		push	ax
		lea	ax, word ptr [bp+var_17A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B18B6

loc_B18B6:
		mov	[bp+var_17A], 0
		mov	byte ptr [bp+var_178+3], 0
		mov	[bp+var_174], 0
		cmp	byte ptr [bp+var_16E+3], 0
		jz	short loc_B18F5
		cmp	[bp+var_170], 0
		jz	short loc_B18F5
		push	0
		mov	al, byte ptr [bp+var_16E+2]
		push	ax
		lea	ax, word ptr [bp+var_170]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B18F5

loc_B18F5:
		mov	[bp+var_170], 0
		mov	byte ptr [bp+var_16E+3], 0
		mov	[bp+var_16A], 0
		cmp	byte ptr [bp+var_161], 0
		jz	short loc_B1934
		cmp	[bp+var_166], 0
		jz	short loc_B1934
		push	0
		mov	al, byte ptr [bp+var_164+2]
		push	ax
		lea	ax, word ptr [bp+var_166]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B1934

loc_B1934:
		mov	[bp+var_166], 0
		mov	byte ptr [bp+var_161], 0
		mov	[bp+var_160], 0
		cmp	byte ptr [bp+var_158+1], 0
		jz	short loc_B1973
		cmp	[bp+var_15C], 0
		jz	short loc_B1973
		push	0
		mov	al, byte ptr [bp+var_158]
		push	ax
		lea	ax, word ptr [bp+var_15C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B1973

loc_B1973:
		mov	[bp+var_15C], 0
		mov	byte ptr [bp+var_158+1], 0
		mov	[bp+var_156], 0
		push	0
		lea	ax, [bp+var_CA0]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_146+1], 0
		jz	short loc_B19C1
		cmp	[bp+var_14A], 0
		jz	short loc_B19C1
		push	0
		mov	al, byte ptr [bp+var_146]
		push	ax
		lea	ax, word ptr [bp+var_14A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B19C1

loc_B19C1:
		mov	[bp+var_14A], 0
		mov	byte ptr [bp+var_146+1], 0
		mov	[bp+var_144], 0
		lea	ax, [bp+var_C7E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_C7A]
		push	ax
		call	sub_5C1C
		add	sp, 4
		lea	ax, [bp+var_C70]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_C6C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_B1A38
		cmp	[bp+var_13C], 0
		jz	short loc_B1A38
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B1A38

loc_B1A38:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		cmp	byte ptr [bp+var_12E+1], 0
		jz	short loc_B1A77
		cmp	[bp+var_132], 0
		jz	short loc_B1A77
		push	0
		mov	al, byte ptr [bp+var_12E]
		push	ax
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B1A77

loc_B1A77:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		cmp	byte_4F55C, 0
		jz	short loc_B1A98
		jmp	loc_B5097

loc_B1A98:
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E], 2
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		push	2
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	6
		lea	ax, [bp+var_304]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_136+1], 0
		lea	ax, word ptr [bp+var_132]
		push	ax
		lea	ax, word ptr [bp+var_13A+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_142], 0
		mov	byte ptr [bp+var_140+2], 2
		mov	byte ptr [bp+var_140+3], 0
		mov	[bp+var_13C], 0
		push	3
		lea	ax, word ptr [bp+var_142]
		push	ax
		push	4
		lea	ax, [bp+var_304]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_144], ax
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		push	2
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	2E47h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	0
		push	0
		lea	ax, word ptr [bp+var_142]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_150], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_154+2], ax
		push	33h
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_154], ax
		push	[bp+var_70]
		mov	al, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_B0]
		mov	al, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_13A+2]
		mov	al, byte ptr [bp+var_136]
		push	ax
		lea	ax, word ptr [bp+var_13A+2]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_D0]
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	word ptr [bp+var_144]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_150]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_154+2]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_154]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	7Fh
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_15E], 0
		mov	byte ptr [bp+var_15A], 2
		mov	byte ptr [bp+var_15A+1], 0
		mov	[bp+var_158], 0
		push	3
		lea	ax, word ptr [bp+var_15E]
		push	ax
		push	0
		lea	ax, [bp+var_304]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	1
		push	80h
		push	0A0h
		lea	ax, word ptr [bp+var_15E]
		push	ax
		push	0
		call	ToggleLayer_Construct_FDCC
		add	sp, 0Ah
		mov	word ptr [bp+var_160], ax
		push	word ptr [bp+var_160]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_B1D11

loc_B1D04:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B1D11:
		cmp	word ptr [bp+var_C68+1], 0Fh
		jnb	short loc_B1D1F
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B1D24

loc_B1D1F:
		mov	ax, 1
		jmp	short loc_B1D26

loc_B1D24:
		xor	ax, ax

loc_B1D26:
		mov	ah, 0
		or	ax, ax
		jz	short loc_B1D04
		mov	word ptr [bp+var_C68+1], 0
		push	1Bh
		push	word ptr [bp+var_154+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		jmp	short loc_B1D4F

loc_B1D42:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B1D4F:
		cmp	word ptr [bp+var_C68+1], 2
		jnb	short loc_B1D5D
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B1D62

loc_B1D5D:
		mov	ax, 1
		jmp	short loc_B1D64

loc_B1D62:
		xor	ax, ax

loc_B1D64:
		mov	ah, 0
		or	ax, ax
		jz	short loc_B1D42
		push	1Ch
		push	word ptr [bp+var_154+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		jmp	short loc_B1D87

loc_B1D7A:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B1D87:
		cmp	word ptr [bp+var_C68+1], 0Ah
		jnb	short loc_B1D95
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B1D9A

loc_B1D95:
		mov	ax, 1
		jmp	short loc_B1D9C

loc_B1D9A:
		xor	ax, ax

loc_B1D9C:
		mov	ah, 0
		or	ax, ax
		jz	short loc_B1D7A
		cmp	byte ptr [bp+var_15A+1], 0
		jz	short loc_B1DCA
		cmp	[bp+var_15E], 0
		jz	short loc_B1DCA
		push	0
		mov	al, byte ptr [bp+var_15A]
		push	ax
		lea	ax, word ptr [bp+var_15E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B1DCA

loc_B1DCA:
		mov	[bp+var_15E], 0
		mov	byte ptr [bp+var_15A+1], 0
		mov	[bp+var_158], 0
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_B1E09
		cmp	[bp+var_14E], 0
		jz	short loc_B1E09
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, word ptr [bp+var_14E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B1E09

loc_B1E09:
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		cmp	byte ptr [bp+var_140+3], 0
		jz	short loc_B1E48
		cmp	[bp+var_142], 0
		jz	short loc_B1E48
		push	0
		mov	al, byte ptr [bp+var_140+2]
		push	ax
		lea	ax, word ptr [bp+var_142]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B1E48

loc_B1E48:
		mov	[bp+var_142], 0
		mov	byte ptr [bp+var_140+3], 0
		mov	[bp+var_13C], 0
		lea	ax, word ptr [bp+var_13A+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_12E+1], 0
		jz	short loc_B1E94
		cmp	[bp+var_132], 0
		jz	short loc_B1E94
		push	0
		mov	al, byte ptr [bp+var_12E]
		push	ax
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B1E94

loc_B1E94:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_B1EC4
		jmp	loc_B5097

loc_B1EC4:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E], 2
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		push	3
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	17h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+2], 2
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		push	3
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	16h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_146], 0
		mov	byte ptr [bp+var_142], 2
		mov	byte ptr [bp+var_142+1], 0
		mov	[bp+var_140], 0
		push	3
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	14h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14E+2], 2
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		push	3
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	1Ah
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_156], 2
		mov	byte ptr [bp+var_156+1], 0
		mov	[bp+var_154], 0
		push	3
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	19h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160], 2
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_15E], 0
		push	3
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	15h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_16E], 0
		mov	byte ptr [bp+var_16A], 2
		mov	byte ptr [bp+var_16A+1], 0
		mov	[bp+var_168], 0
		push	3
		lea	ax, word ptr [bp+var_16E]
		push	ax
		push	18h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_170], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_172], ax
		push	3
		push	0
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_174], ax
		push	0
		push	3
		push	71h
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_178+2], ax
		push	0
		push	3
		push	0
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_178], ax
		push	0
		push	3
		push	0
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_17A], ax
		push	0
		push	3
		push	28h
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_17E+2], ax
		push	0
		push	3
		push	0
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_17E], ax
		push	0
		push	3
		push	0FF74h
		lea	ax, word ptr [bp+var_16E]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	[bp+var_180], ax
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_80]
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_A0]
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_170]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_172]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_174]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_180]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_17A]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_178]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_17E]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_17E+2]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_178+2]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	bx, word ptr [bp+var_178+2]
		mov	word ptr [bx+1Bh], 2
		mov	bx, word ptr [bp+var_178]
		mov	word ptr [bx+1Bh], 2
		mov	bx, word ptr [bp+var_17A]
		mov	word ptr [bx+1Bh], 1
		mov	bx, word ptr [bp+var_17E]
		mov	word ptr [bx+1Bh], 9
		mov	bx, word ptr [bp+var_17E+2]
		mov	word ptr [bx+1Bh], 1
		mov	bx, [bp+var_180]
		mov	word ptr [bx+1Bh], 1
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_182], 1
		mov	[bp+var_184], 1
		mov	word ptr [bp+var_C68+1], 0
		jmp	loc_B2359

loc_B2265:
		mov	ax, word ptr [bp+var_C68+1]
		mov	[bp+var_186], ax
		cmp	[bp+var_186], 2
		jnz	short loc_B228B
		mov	ax, [bp+var_182]
		mov	[bp+var_188], ax
		inc	[bp+var_182]
		mov	bx, word ptr [bp+var_178]
		mov	ax, [bp+var_188]
		mov	[bx+1Bh], ax

loc_B228B:
		cmp	[bp+var_186], 1
		jle	short loc_B22B0
		cmp	[bp+var_186], 7
		jge	short loc_B22B0
		mov	ax, [bp+var_184]
		mov	[bp+var_18A], ax
		inc	[bp+var_184]
		mov	bx, word ptr [bp+var_17E]
		mov	ax, [bp+var_18A]
		mov	[bx+1Bh], ax

loc_B22B0:
		cmp	[bp+var_186], 0Dh
		jle	short loc_B22D5
		cmp	[bp+var_186], 10h
		jge	short loc_B22D5
		mov	ax, [bp+var_184]
		mov	[bp+var_18C], ax
		inc	[bp+var_184]
		mov	bx, word ptr [bp+var_17E]
		mov	ax, [bp+var_18C]
		mov	[bx+1Bh], ax

loc_B22D5:
		cmp	[bp+var_186], 11h
		jnz	short loc_B22EF
		mov	ax, [bp+var_182]
		mov	[bp+var_18E], ax
		mov	bx, word ptr [bp+var_178]
		mov	ax, [bp+var_18E]
		mov	[bx+1Bh], ax

loc_B22EF:
		cmp	[bp+var_186], 11h
		jnz	short loc_B22FF
		mov	bx, word ptr [bp+var_17E]
		mov	word ptr [bx+1Bh], 2

loc_B22FF:
		cmp	[bp+var_186], 12h
		jnz	short loc_B230F
		mov	bx, word ptr [bp+var_17E]
		mov	word ptr [bx+1Bh], 1

loc_B230F:
		cmp	[bp+var_186], 13h
		jnz	short loc_B231F
		mov	bx, word ptr [bp+var_17E]
		mov	word ptr [bx+1Bh], 9

loc_B231F:
		cmp	[bp+var_186], 3
		jnz	short loc_B232F
		mov	bx, word ptr [bp+var_17E+2]
		mov	word ptr [bx+1Bh], 2

loc_B232F:
		cmp	[bp+var_186], 14h
		jnz	short loc_B233F
		mov	bx, word ptr [bp+var_17A]
		mov	word ptr [bx+1Bh], 2

loc_B233F:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B234C
		jmp	short loc_B234C
		jmp	short loc_B2377

loc_B234C:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B2359:
		cmp	word ptr [bp+var_C68+1], 1Eh
		jnb	short loc_B2367
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B236C

loc_B2367:
		mov	ax, 1
		jmp	short loc_B236E

loc_B236C:
		xor	ax, ax

loc_B236E:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B2377
		jmp	loc_B2265

loc_B2377:
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_16A+1], 0
		jz	short loc_B23AE
		cmp	[bp+var_16E], 0
		jz	short loc_B23AE
		push	0
		mov	al, byte ptr [bp+var_16A]
		push	ax
		lea	ax, word ptr [bp+var_16E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B23AE

loc_B23AE:
		mov	[bp+var_16E], 0
		mov	byte ptr [bp+var_16A+1], 0
		mov	[bp+var_168], 0
		cmp	byte ptr [bp+var_160+1], 0
		jz	short loc_B23ED
		cmp	[bp+var_164], 0
		jz	short loc_B23ED
		push	0
		mov	al, byte ptr [bp+var_160]
		push	ax
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B23ED

loc_B23ED:
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_15E], 0
		cmp	byte ptr [bp+var_156+1], 0
		jz	short loc_B242C
		cmp	[bp+var_15A], 0
		jz	short loc_B242C
		push	0
		mov	al, byte ptr [bp+var_156]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B242C

loc_B242C:
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_156+1], 0
		mov	[bp+var_154], 0
		cmp	byte ptr [bp+var_14E+3], 0
		jz	short loc_B246B
		cmp	[bp+var_150], 0
		jz	short loc_B246B
		push	0
		mov	al, byte ptr [bp+var_14E+2]
		push	ax
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B246B

loc_B246B:
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		cmp	byte ptr [bp+var_142+1], 0
		jz	short loc_B24AA
		cmp	[bp+var_146], 0
		jz	short loc_B24AA
		push	0
		mov	al, byte ptr [bp+var_142]
		push	ax
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B24AA

loc_B24AA:
		mov	[bp+var_146], 0
		mov	byte ptr [bp+var_142+1], 0
		mov	[bp+var_140], 0
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_B24E9
		cmp	[bp+var_13C], 0
		jz	short loc_B24E9
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B24E9

loc_B24E9:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		cmp	byte ptr [bp+var_12E+1], 0
		jz	short loc_B2528
		cmp	[bp+var_132], 0
		jz	short loc_B2528
		push	0
		mov	al, byte ptr [bp+var_12E]
		push	ax
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B2528

loc_B2528:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		cmp	byte_4F55C, 0
		jz	short loc_B2549
		jmp	loc_B5097

loc_B2549:
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_12C+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_12C], ax
		push	81h
		push	69h
		lea	ax, word ptr [bp+var_10C]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_12E], ax
		push	81h
		push	109h
		lea	ax, word ptr [bp+var_116]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		push	81h
		push	0FFD3h
		lea	ax, word ptr [bp+var_EE]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_132], ax
		push	[bp+var_D0]
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_80]
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_12C+2]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_12C]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_12E]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	21h
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	1Bh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		cmp	[bp+var_8], 0
		jnz	short loc_B26BD
		jmp	loc_B2800

loc_B26BD:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+2], 2
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		push	2
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	0
		lea	ax, [bp+var_37C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	word ptr [bp+var_12E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B2728

loc_B2717:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_140+2]

loc_B2728:
		cmp	word ptr [bp+var_140+2], 3
		jl	short loc_B2717
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B27AB

loc_B2737:
		cmp	word ptr [bp+var_140+2], 5
		jnz	short loc_B274C
		push	0FFFFh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B274C:
		cmp	word ptr [bp+var_140+2], 6
		jnz	short loc_B2761
		push	19h
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2761:
		cmp	word ptr [bp+var_140+2], 8
		jnz	short loc_B2776
		push	1Fh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2776:
		mov	ax, word ptr [bp+var_140+2]
		inc	word ptr [bp+var_140+2]
		cmp	ax, 0Ch
		jnz	short loc_B2791
		push	12h
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2791:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B279E
		jmp	short loc_B279E
		jmp	short loc_B27BE

loc_B279E:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B27AB:
		push	word ptr [bp+var_12E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_B27BE
		jmp	loc_B2737

loc_B27BE:
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_B27E6
		cmp	[bp+var_13C], 0
		jz	short loc_B27E6
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B27E6

loc_B27E6:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		jmp	loc_B2925

loc_B2800:
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0E3h
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_2], 3Ch
		mov	si, word ptr [bp+var_C68+1]
		mov	ax, [bp+var_2]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_B2908

loc_B283F:
		mov	ax, word ptr [bp+var_C68+1]
		mov	word ptr [bp+var_134], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2862
		push	[bp+var_4]
		lea	ax, [bp+var_C62]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_B2862:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B287C
		push	2E4Bh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_B287C:
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2895
		push	0FFFFh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2895:
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B28AE
		push	19h
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B28AE:
		mov	ax, si
		add	ax, 0Dh
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B28C7
		push	1Fh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B28C7:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B28DF
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_B28DF:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B28FB
		jmp	short loc_B28FB
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_B2925

loc_B28FB:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B2908:
		cmp	word ptr [bp+var_C68+1], di
		jnb	short loc_B2915
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B291A

loc_B2915:
		mov	ax, 1
		jmp	short loc_B291C

loc_B291A:
		xor	ax, ax

loc_B291C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B2925
		jmp	loc_B283F

loc_B2925:
		cmp	byte_4F55C, 0
		jz	short loc_B293E
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		jmp	loc_B5097

loc_B293E:
		cmp	[bp+var_8], 0
		jnz	short loc_B2947
		jmp	loc_B2A48

loc_B2947:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+2], 2
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		push	2
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	1
		lea	ax, [bp+var_37C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	word ptr [bp+var_132+2]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B29B2

loc_B29A1:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_140+2]

loc_B29B2:
		cmp	word ptr [bp+var_140+2], 3
		jl	short loc_B29A1
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B29F6

loc_B29C1:
		mov	ax, word ptr [bp+var_140+2]
		inc	word ptr [bp+var_140+2]
		cmp	ax, 4
		jnz	short loc_B29DC
		push	11h
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B29DC:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B29E9
		jmp	short loc_B29E9
		jmp	short loc_B2A06

loc_B29E9:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B29F6:
		push	word ptr [bp+var_132+2]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_B29C1

loc_B2A06:
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_B2A2E
		cmp	[bp+var_13C], 0
		jz	short loc_B2A2E
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B2A2E

loc_B2A2E:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		jmp	loc_B2B43

loc_B2A48:
		push	0EBh
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_2], 1Eh
		mov	si, word ptr [bp+var_C68+1]
		mov	ax, [bp+var_2]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_B2B26

loc_B2A78:
		mov	ax, word ptr [bp+var_C68+1]
		mov	word ptr [bp+var_134], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2A97
		push	12h
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2A97:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2AB4
		mov	ax, [bp+var_4]
		add	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_C62]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_B2AB4:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2ACC
		push	large 2E66h
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_B2ACC:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2AE5
		push	11h
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2AE5:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2AFD
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_B2AFD:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B2B19
		jmp	short loc_B2B19
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_B2B43

loc_B2B19:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B2B26:
		cmp	word ptr [bp+var_C68+1], di
		jnb	short loc_B2B33
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B2B38

loc_B2B33:
		mov	ax, 1
		jmp	short loc_B2B3A

loc_B2B38:
		xor	ax, ax

loc_B2B3A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B2B43
		jmp	loc_B2A78

loc_B2B43:
		cmp	byte_4F55C, 0
		jz	short loc_B2B5C
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		jmp	loc_B5097

loc_B2B5C:
		cmp	[bp+var_8], 0
		jnz	short loc_B2B65
		jmp	loc_B2CBE

loc_B2B65:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+2], 2
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		push	2
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	2
		lea	ax, [bp+var_37C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	word ptr [bp+var_12E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B2BD0

loc_B2BBF:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_140+2]

loc_B2BD0:
		cmp	word ptr [bp+var_140+2], 3
		jl	short loc_B2BBF
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B2C3E

loc_B2BDF:
		cmp	word ptr [bp+var_140+2], 5
		jnz	short loc_B2BF4
		push	0FFFFh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2BF4:
		cmp	word ptr [bp+var_140+2], 0Ah
		jnz	short loc_B2C09
		push	0FFFFh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2C09:
		mov	ax, word ptr [bp+var_140+2]
		inc	word ptr [bp+var_140+2]
		cmp	ax, 0Ah
		jnz	short loc_B2C24
		push	1Bh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2C24:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B2C31
		jmp	short loc_B2C31
		jmp	short loc_B2C4E

loc_B2C31:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B2C3E:
		push	word ptr [bp+var_12E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_B2BDF

loc_B2C4E:
		push	1Bh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B2C75

loc_B2C64:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_140+2]

loc_B2C75:
		cmp	word ptr [bp+var_140+2], 6
		jl	short loc_B2C64
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_B2CA4
		cmp	[bp+var_13C], 0
		jz	short loc_B2CA4
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B2CA4

loc_B2CA4:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		jmp	loc_B2EE7

loc_B2CBE:
		push	0E3h
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_2], 60h
		mov	si, word ptr [bp+var_C68+1]
		mov	ax, [bp+var_2]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_B2DBF

loc_B2CEE:
		mov	ax, word ptr [bp+var_C68+1]
		mov	word ptr [bp+var_134], ax
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2D19
		mov	ax, [bp+var_6]
		shl	ax, 1
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C62]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_B2D19:
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2D33
		push	2E70h
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_B2D33:
		mov	ax, si
		add	ax, 14h
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2D4C
		push	0FFFFh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2D4C:
		mov	ax, di
		add	ax, 0FFFBh
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2D65
		push	0FFFFh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2D65:
		mov	ax, di
		add	ax, 0FFFBh
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2D7E
		push	1Bh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2D7E:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2D96
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_B2D96:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B2DB2
		jmp	short loc_B2DB2
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_B2DDC

loc_B2DB2:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B2DBF:
		cmp	word ptr [bp+var_C68+1], di
		jnb	short loc_B2DCC
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B2DD1

loc_B2DCC:
		mov	ax, 1
		jmp	short loc_B2DD3

loc_B2DD1:
		xor	ax, ax

loc_B2DD3:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B2DDC
		jmp	loc_B2CEE

loc_B2DDC:
		cmp	byte_4F55C, 0
		jz	short loc_B2DF5
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		jmp	loc_B5097

loc_B2DF5:
		mov	[bp+var_2], 46h
		mov	si, word ptr [bp+var_C68+1]
		mov	ax, [bp+var_2]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_B2ECA

loc_B2E15:
		mov	ax, word ptr [bp+var_C68+1]
		mov	word ptr [bp+var_134], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2E34
		push	0FFFFh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2E34:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2E58
		mov	ax, [bp+var_6]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C62]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_B2E58:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2E70
		push	2E8Fh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_B2E70:
		mov	ax, di
		add	ax, 0FFFCh
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2E89
		push	1Bh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B2E89:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B2EA1
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_B2EA1:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B2EBD
		jmp	short loc_B2EBD
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_B2EE7

loc_B2EBD:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B2ECA:
		cmp	word ptr [bp+var_C68+1], di
		jnb	short loc_B2ED7
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B2EDC

loc_B2ED7:
		mov	ax, 1
		jmp	short loc_B2EDE

loc_B2EDC:
		xor	ax, ax

loc_B2EDE:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B2EE7
		jmp	loc_B2E15

loc_B2EE7:
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_B2F00
		jmp	loc_B5097

loc_B2F00:
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_12C+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_12C], ax
		push	81h
		push	0A0h
		lea	ax, word ptr [bp+var_F8]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_12E], ax
		push	81h
		push	0FFE2h
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		push	81h
		push	15Eh
		lea	ax, word ptr [bp+var_102]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_132], ax
		push	[bp+var_D0]
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_80]
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_12C+2]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_12C]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_12E]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_8], 0
		jnz	short loc_B3059
		jmp	loc_B3167

loc_B3059:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+2], 2
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		push	2
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	3
		lea	ax, [bp+var_37C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	word ptr [bp+var_12E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B30C4

loc_B30B3:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_140+2]

loc_B30C4:
		cmp	word ptr [bp+var_140+2], 3
		jl	short loc_B30B3
		jmp	short loc_B30E7

loc_B30CD:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B30DA
		jmp	short loc_B30DA
		jmp	short loc_B30F7

loc_B30DA:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B30E7:
		push	word ptr [bp+var_12E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_B30CD

loc_B30F7:
		push	1Bh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B311E

loc_B310D:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_140+2]

loc_B311E:
		cmp	word ptr [bp+var_140+2], 6
		jl	short loc_B310D
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_B314D
		cmp	[bp+var_13C], 0
		jz	short loc_B314D
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B314D

loc_B314D:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		jmp	loc_B3252

loc_B3167:
		push	0E3h
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_2], 40h
		mov	si, word ptr [bp+var_C68+1]
		mov	ax, [bp+var_2]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_B3235

loc_B3197:
		mov	ax, word ptr [bp+var_C68+1]
		mov	word ptr [bp+var_134], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B31C3
		mov	ax, [bp+var_6]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C62]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_B31C3:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B31DB
		push	2EA5h
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_B31DB:
		mov	ax, di
		add	ax, 0FFFAh
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B31F4
		push	1Bh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B31F4:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B320C
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_B320C:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B3228
		jmp	short loc_B3228
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_B3252

loc_B3228:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B3235:
		cmp	word ptr [bp+var_C68+1], di
		jnb	short loc_B3242
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B3247

loc_B3242:
		mov	ax, 1
		jmp	short loc_B3249

loc_B3247:
		xor	ax, ax

loc_B3249:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B3252
		jmp	loc_B3197

loc_B3252:
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_B326B
		jmp	loc_B5097

loc_B326B:
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_12C+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_12C], ax
		push	81h
		push	0C8h
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_12E], ax
		push	81h
		push	0FFE2h
		lea	ax, word ptr [bp+var_102]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		push	[bp+var_D0]
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_80]
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_12C+2]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_12C]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_12E]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	19h
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	1Fh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		cmp	[bp+var_8], 0
		jnz	short loc_B33B6
		jmp	loc_B34CC

loc_B33B6:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_136], 2
		mov	byte ptr [bp+var_136+1], 0
		mov	[bp+var_134], 0
		push	2
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	4
		lea	ax, [bp+var_37C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	word ptr [bp+var_12E]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_13C], 0
		jmp	short loc_B345A

loc_B3410:
		cmp	word ptr [bp+var_13C], 0Dh
		jnz	short loc_B3425
		push	0FFFFh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3425:
		mov	ax, word ptr [bp+var_13C]
		inc	word ptr [bp+var_13C]
		cmp	ax, 0Eh
		jnz	short loc_B3440
		push	1Bh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3440:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B344D
		jmp	short loc_B344D
		jmp	short loc_B346A

loc_B344D:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B345A:
		push	word ptr [bp+var_12E]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_B3410

loc_B346A:
		mov	word ptr [bp+var_13C], 0
		jmp	short loc_B3483

loc_B3472:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_13C]

loc_B3483:
		cmp	word ptr [bp+var_13C], 0Ah
		jl	short loc_B3472
		cmp	byte ptr [bp+var_136+1], 0
		jz	short loc_B34B2
		cmp	[bp+var_13A], 0
		jz	short loc_B34B2
		push	0
		mov	al, byte ptr [bp+var_136]
		push	ax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B34B2

loc_B34B2:
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_136+1], 0
		mov	[bp+var_134], 0
		jmp	loc_B36C3

loc_B34CC:
		push	0FEh
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_2], 38h
		mov	si, word ptr [bp+var_C68+1]
		mov	ax, [bp+var_2]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_B3581

loc_B34FC:
		mov	ax, word ptr [bp+var_C68+1]
		mov	word ptr [bp+var_132], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_132]
		jnz	short loc_B3528
		mov	ax, [bp+var_6]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C62]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_B3528:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_132]
		jnz	short loc_B3540
		push	2EC0h
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_B3540:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_132]
		jnz	short loc_B3558
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_B3558:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B3574
		jmp	short loc_B3574
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_B359E

loc_B3574:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B3581:
		cmp	word ptr [bp+var_C68+1], di
		jnb	short loc_B358E
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B3593

loc_B358E:
		mov	ax, 1
		jmp	short loc_B3595

loc_B3593:
		xor	ax, ax

loc_B3595:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B359E
		jmp	loc_B34FC

loc_B359E:
		cmp	byte_4F55C, 0
		jz	short loc_B35B7
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		jmp	loc_B5097

loc_B35B7:
		mov	[bp+var_2], 50h
		mov	si, word ptr [bp+var_C68+1]
		mov	ax, [bp+var_2]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_B36A6

loc_B35D7:
		mov	ax, word ptr [bp+var_C68+1]
		mov	word ptr [bp+var_132], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_132]
		jnz	short loc_B3601
		mov	ax, [bp+var_6]
		shl	ax, 3
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C62]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_B3601:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_132]
		jnz	short loc_B3619
		push	2ED5h
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_B3619:
		mov	ax, si
		add	ax, 0Dh
		cmp	ax, word ptr [bp+var_132]
		jnz	short loc_B3632
		push	0FFFFh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3632:
		mov	ax, si
		add	ax, 0Eh
		cmp	ax, word ptr [bp+var_132]
		jnz	short loc_B364B
		push	1Bh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B364B:
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_132]
		jnz	short loc_B3665
		push	2EE1h
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_B3665:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_132]
		jnz	short loc_B367D
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_B367D:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B3699
		jmp	short loc_B3699
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_B36C3

loc_B3699:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B36A6:
		cmp	word ptr [bp+var_C68+1], di
		jnb	short loc_B36B3
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B36B8

loc_B36B3:
		mov	ax, 1
		jmp	short loc_B36BA

loc_B36B8:
		xor	ax, ax

loc_B36BA:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B36C3
		jmp	loc_B35D7

loc_B36C3:
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_B36DC
		jmp	loc_B5097

loc_B36DC:
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_12C+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_12C], ax
		push	81h
		push	0FFD3h
		lea	ax, word ptr [bp+var_10C]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_12E], ax
		push	81h
		push	91h
		lea	ax, word ptr [bp+var_116]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_132+2], ax
		push	81h
		push	136h
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_132], ax
		push	[bp+var_D0]
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_80]
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_12C+2]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_12C]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_12E]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_C84]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	1Bh
		push	word ptr [bp+var_12E]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	1Bh
		push	word ptr [bp+var_132]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	bx, word ptr [bp+var_132+2]
		mov	byte ptr [bx+2Fh], 0
		cmp	[bp+var_8], 0
		jnz	short loc_B3859
		jmp	loc_B3ABC

loc_B3859:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+2], 2
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		push	2
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	5
		lea	ax, [bp+var_37C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	word ptr [bp+var_132+2]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B38C4

loc_B38B3:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_140+2]

loc_B38C4:
		cmp	word ptr [bp+var_140+2], 3
		jl	short loc_B38B3
		jmp	short loc_B38E7

loc_B38CD:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B38DA
		jmp	short loc_B38DA
		jmp	short loc_B38F7

loc_B38DA:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B38E7:
		push	word ptr [bp+var_132+2]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_B38CD

loc_B38F7:
		cmp	byte_4F55C, 0
		jz	short loc_B391A
		cmp	byte ptr [bp+var_13A+3], 0
		jnz	short loc_B3908
		jmp	loc_AEEDF

loc_B3908:
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		jmp	loc_B5097

loc_B391A:
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B3972

loc_B3922:
		cmp	word ptr [bp+var_140+2], 2
		jnz	short loc_B3937
		push	1Bh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3937:
		cmp	word ptr [bp+var_140+2], 4
		jnz	short loc_B394C
		push	0Fh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B394C:
		cmp	word ptr [bp+var_140+2], 6
		jnz	short loc_B3961
		push	0FFFFh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3961:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_140+2]

loc_B3972:
		cmp	word ptr [bp+var_140+2], 0Ch
		jl	short loc_B3922
		cmp	byte_4F55C, 0
		jz	short loc_B399C
		cmp	byte ptr [bp+var_13A+3], 0
		jnz	short loc_B398A
		jmp	loc_AEEDF

loc_B398A:
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		jmp	loc_B5097

loc_B399C:
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144], 2
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_142], 0
		push	2
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	6
		lea	ax, [bp+var_37C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	word ptr [bp+var_132+2]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		jmp	short loc_B39FD

loc_B39E3:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B39F0
		jmp	short loc_B39F0
		jmp	short loc_B3A0D

loc_B39F0:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B39FD:
		push	word ptr [bp+var_132+2]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_B39E3

loc_B3A0D:
		push	1Bh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	word ptr [bp+var_140+2], 0
		jmp	short loc_B3A34

loc_B3A23:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_140+2]

loc_B3A34:
		cmp	word ptr [bp+var_140+2], 0Ah
		jl	short loc_B3A23
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_B3A63
		cmp	[bp+var_148], 0
		jz	short loc_B3A63
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		lea	ax, word ptr [bp+var_148]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B3A63

loc_B3A63:
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_142], 0
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_B3AA2
		cmp	[bp+var_13C], 0
		jz	short loc_B3AA2
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B3AA2

loc_B3AA2:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		jmp	loc_B3D40

loc_B3ABC:
		push	0EBh
		lea	ax, [bp+var_C62]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_2], 1Eh
		mov	si, word ptr [bp+var_C68+1]
		mov	ax, [bp+var_2]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_B3BB3

loc_B3AEC:
		mov	ax, word ptr [bp+var_C68+1]
		mov	word ptr [bp+var_134], ax
		cmp	word ptr [bp+var_134], si
		jnz	short loc_B3B08
		push	13h
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3B08:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3B2C
		mov	ax, [bp+var_6]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C62]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_B3B2C:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3B44
		push	2EF3h
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_B3B44:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3B5B
		push	0FFFFh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3B5B:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3B72
		push	1Bh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3B72:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3B8A
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_B3B8A:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B3BA6
		jmp	short loc_B3BA6
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_B3BD0

loc_B3BA6:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B3BB3:
		cmp	word ptr [bp+var_C68+1], di
		jnb	short loc_B3BC0
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B3BC5

loc_B3BC0:
		mov	ax, 1
		jmp	short loc_B3BC7

loc_B3BC5:
		xor	ax, ax

loc_B3BC7:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B3BD0
		jmp	loc_B3AEC

loc_B3BD0:
		cmp	byte_4F55C, 0
		jz	short loc_B3BE9
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		jmp	loc_B5097

loc_B3BE9:
		mov	[bp+var_2], 32h
		mov	si, word ptr [bp+var_C68+1]
		mov	ax, [bp+var_2]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_B3D23

loc_B3C09:
		mov	ax, word ptr [bp+var_C68+1]
		mov	word ptr [bp+var_134], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3C28
		push	0FFFFh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3C28:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3C4C
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C62]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_B3C4C:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3C64
		push	2F01h
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_B3C64:
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3C7D
		push	1Bh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3C7D:
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3C96
		push	0Fh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3C96:
		mov	ax, si
		add	ax, 0Eh
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3CAF
		push	0FFFFh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3CAF:
		mov	ax, si
		add	ax, 0Eh
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3CC9
		push	2F09h
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_B3CC9:
		mov	ax, di
		add	ax, 0FFFBh
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3CE2
		push	1Bh
		push	word ptr [bp+var_132+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_B3CE2:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_134]
		jnz	short loc_B3CFA
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_B3CFA:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B3D16
		jmp	short loc_B3D16
		push	0
		lea	ax, [bp+var_C62]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_B3D40

loc_B3D16:
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B3D23:
		cmp	word ptr [bp+var_C68+1], di
		jnb	short loc_B3D30
		cmp	byte ptr [bp+var_C68+3], 0
		jz	short loc_B3D35

loc_B3D30:
		mov	ax, 1
		jmp	short loc_B3D37

loc_B3D35:
		xor	ax, ax

loc_B3D37:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B3D40
		jmp	loc_B3C09

loc_B3D40:
		push	0
		lea	ax, [bp+var_C84]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_B3D59
		jmp	loc_B5097

loc_B3D59:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E], 2
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		mov	[bp+var_C6C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_C6A], ax
		lea	ax, [bp+var_C6C]
		mov	word_4D392, ax
		mov	[bp+var_C6C], 1BCh
		mov	[bp+var_C68], 0
		mov	[bp+var_C64], 0
		mov	[bp+var_C70], 0
		mov	[bp+var_C6E], 0FFFFh
		cmp	[bp+var_9], 0
		jz	short loc_B3DEA
		push	3
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	19h
		lea	ax, [bp+var_3F4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_132]
		push	ax
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_B3DEA:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+2], 2
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		push	3
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	17h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_146], 0
		mov	byte ptr [bp+var_142], 2
		mov	byte ptr [bp+var_142+1], 0
		mov	[bp+var_140], 0
		push	3
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	16h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14E+2], 2
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		push	3
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	14h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_156], 2
		mov	byte ptr [bp+var_156+1], 0
		mov	[bp+var_154], 0
		push	3
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	1Ah
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160], 2
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_15E], 0
		push	3
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	19h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_16E], 0
		mov	byte ptr [bp+var_16A], 2
		mov	byte ptr [bp+var_16A+1], 0
		mov	[bp+var_168], 0
		push	3
		lea	ax, word ptr [bp+var_16E]
		push	ax
		push	15h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_178], 0
		mov	byte ptr [bp+var_174], 2
		mov	byte ptr [bp+var_174+1], 0
		mov	[bp+var_172], 0
		push	3
		lea	ax, word ptr [bp+var_178]
		push	ax
		push	18h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_17A], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_17E+2], ax
		push	3
		push	0
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_17E], ax
		push	0
		push	3
		push	71h
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	[bp+var_180], ax
		push	0
		push	3
		push	0
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	[bp+var_182], ax
		push	0
		push	3
		push	0
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	[bp+var_184], ax
		push	0
		push	3
		push	28h
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	[bp+var_186], ax
		push	0
		push	3
		push	0
		lea	ax, word ptr [bp+var_16E]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	[bp+var_188], ax
		push	0
		push	3
		push	0FF74h
		lea	ax, word ptr [bp+var_178]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	[bp+var_18A], ax
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_80]
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_A0]
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_17A]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_17E+2]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_17E]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_18A]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_184]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_182]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_188]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_186]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_180]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	bx, [bp+var_180]
		mov	word ptr [bx+1Bh], 2
		mov	bx, [bp+var_182]
		mov	word ptr [bx+1Bh], 2
		mov	bx, [bp+var_184]
		mov	word ptr [bx+1Bh], 1
		mov	bx, [bp+var_188]
		mov	word ptr [bx+1Bh], 9
		mov	bx, [bp+var_186]
		mov	word ptr [bx+1Bh], 1
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+1Bh], 1
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_18C], 3
		mov	[bp+var_18E], 0Ah
		mov	[bp+var_190], 8
		mov	[bp+var_192], 3
		mov	[bp+var_194], 3
		mov	[bp+var_196], 0Ah
		mov	word ptr [bp+var_C76+1], 0
		jmp	loc_B4365

loc_B41A3:
		mov	ax, word ptr [bp+var_C76+1]
		mov	[bp+var_198], ax
		cmp	[bp+var_198], 0Eh
		jnz	short loc_B41BB
		mov	bx, [bp+var_186]
		mov	word ptr [bx+1Bh], 2

loc_B41BB:
		cmp	[bp+var_198], 10h
		jnz	short loc_B41CB
		mov	bx, [bp+var_184]
		mov	word ptr [bx+1Bh], 2

loc_B41CB:
		cmp	[bp+var_198], 1
		jle	short loc_B4203
		mov	ax, [bp+var_198]
		cmp	ax, [bp+var_196]
		jge	short loc_B4203
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	[bp+var_19A], ax
		mov	bx, [bp+var_180]
		mov	ax, [bp+var_19A]
		mov	[bx+1Bh], ax

loc_B4203:
		mov	ax, [bp+var_196]
		inc	ax
		cmp	ax, [bp+var_198]
		jnz	short loc_B4258
		cmp	[bp+var_9], 0
		jz	short loc_B4258
		mov	ax, word_4EFA6
		mov	[bp+var_19C], ax
		mov	[bp+var_19E], 0
		cmp	[bp+var_C70], 0
		jz	short loc_B4258
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_19E]
		push	[bp+var_19C]
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_B4258

loc_B4258:
		mov	ax, [bp+var_196]
		dec	ax
		cmp	ax, [bp+var_198]
		jge	short loc_B4287
		mov	ax, [bp+var_196]
		add	ax, 7
		cmp	ax, [bp+var_198]
		jle	short loc_B4287
		mov	ax, [bp+var_194]
		mov	[bp+var_1A0], ax
		inc	[bp+var_194]
		mov	bx, [bp+var_180]
		mov	ax, [bp+var_1A0]
		mov	[bx+1Bh], ax

loc_B4287:
		mov	ax, [bp+var_196]
		add	ax, 0Ah
		cmp	ax, [bp+var_198]
		jge	short loc_B42B8
		mov	ax, [bp+var_196]
		add	ax, 0Dh
		cmp	ax, [bp+var_198]
		jle	short loc_B42B8
		mov	ax, [bp+var_18C]
		mov	[bp+var_1A2], ax
		inc	[bp+var_18C]
		mov	bx, [bp+var_182]
		mov	ax, [bp+var_1A2]
		mov	[bx+1Bh], ax

loc_B42B8:
		mov	ax, [bp+var_196]
		add	ax, 0Ch
		cmp	ax, [bp+var_198]
		jge	short loc_B42E9
		mov	ax, [bp+var_196]
		add	ax, 0Fh
		cmp	ax, [bp+var_198]
		jle	short loc_B42E9
		mov	ax, [bp+var_18E]
		mov	[bp+var_1A4], ax
		inc	[bp+var_18E]
		mov	bx, [bp+var_188]
		mov	ax, [bp+var_1A4]
		mov	[bx+1Bh], ax

loc_B42E9:
		mov	ax, [bp+var_196]
		add	ax, 0Ah
		cmp	ax, [bp+var_198]
		jge	short loc_B431A
		mov	ax, [bp+var_196]
		add	ax, 0Eh
		cmp	ax, [bp+var_198]
		jle	short loc_B431A
		mov	ax, [bp+var_190]
		mov	[bp+var_1A6], ax
		inc	[bp+var_190]
		mov	bx, [bp+var_18A]
		mov	ax, [bp+var_1A6]
		mov	[bx+1Bh], ax

loc_B431A:
		mov	ax, [bp+var_196]
		add	ax, 9
		cmp	ax, [bp+var_198]
		jge	short loc_B434B
		mov	ax, [bp+var_196]
		add	ax, 0Dh
		cmp	ax, [bp+var_198]
		jle	short loc_B434B
		mov	ax, [bp+var_192]
		mov	[bp+var_1A8], ax
		inc	[bp+var_192]
		mov	bx, [bp+var_186]
		mov	ax, [bp+var_1A8]
		mov	[bx+1Bh], ax

loc_B434B:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B4358
		jmp	short loc_B4358
		jmp	short loc_B4389

loc_B4358:
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B4365:
		mov	ax, [bp+var_196]
		add	ax, 19h
		cmp	ax, word ptr [bp+var_C76+1]
		jbe	short loc_B4379
		cmp	byte ptr [bp+var_C76+3], 0
		jz	short loc_B437E

loc_B4379:
		mov	ax, 1
		jmp	short loc_B4380

loc_B437E:
		xor	ax, ax

loc_B4380:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B4389
		jmp	loc_B41A3

loc_B4389:
		push	0
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_174+1], 0
		jz	short loc_B43C0
		cmp	[bp+var_178], 0
		jz	short loc_B43C0
		push	0
		mov	al, byte ptr [bp+var_174]
		push	ax
		lea	ax, word ptr [bp+var_178]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B43C0

loc_B43C0:
		mov	[bp+var_178], 0
		mov	byte ptr [bp+var_174+1], 0
		mov	[bp+var_172], 0
		cmp	byte ptr [bp+var_16A+1], 0
		jz	short loc_B43FF
		cmp	[bp+var_16E], 0
		jz	short loc_B43FF
		push	0
		mov	al, byte ptr [bp+var_16A]
		push	ax
		lea	ax, word ptr [bp+var_16E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B43FF

loc_B43FF:
		mov	[bp+var_16E], 0
		mov	byte ptr [bp+var_16A+1], 0
		mov	[bp+var_168], 0
		cmp	byte ptr [bp+var_160+1], 0
		jz	short loc_B443E
		cmp	[bp+var_164], 0
		jz	short loc_B443E
		push	0
		mov	al, byte ptr [bp+var_160]
		push	ax
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B443E

loc_B443E:
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_15E], 0
		cmp	byte ptr [bp+var_156+1], 0
		jz	short loc_B447D
		cmp	[bp+var_15A], 0
		jz	short loc_B447D
		push	0
		mov	al, byte ptr [bp+var_156]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B447D

loc_B447D:
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_156+1], 0
		mov	[bp+var_154], 0
		cmp	byte ptr [bp+var_14E+3], 0
		jz	short loc_B44BC
		cmp	[bp+var_150], 0
		jz	short loc_B44BC
		push	0
		mov	al, byte ptr [bp+var_14E+2]
		push	ax
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B44BC

loc_B44BC:
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		cmp	byte ptr [bp+var_142+1], 0
		jz	short loc_B44FB
		cmp	[bp+var_146], 0
		jz	short loc_B44FB
		push	0
		mov	al, byte ptr [bp+var_142]
		push	ax
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B44FB

loc_B44FB:
		mov	[bp+var_146], 0
		mov	byte ptr [bp+var_142+1], 0
		mov	[bp+var_140], 0
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_B453A
		cmp	[bp+var_13C], 0
		jz	short loc_B453A
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B453A

loc_B453A:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		lea	ax, [bp+var_C70]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_C6C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_12E+1], 0
		jz	short loc_B4595
		cmp	[bp+var_132], 0
		jz	short loc_B4595
		push	0
		mov	al, byte ptr [bp+var_12E]
		push	ax
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B4595

loc_B4595:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		cmp	byte_4F55C, 0
		jz	short loc_B45B6
		jmp	loc_B5097

loc_B45B6:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E], 2
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		mov	[bp+var_C6C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_C6A], ax
		lea	ax, [bp+var_C6C]
		mov	word_4D392, ax
		mov	[bp+var_C6C], 1BCh
		mov	[bp+var_C68], 0
		mov	[bp+var_C64], 0
		mov	[bp+var_C70], 0
		mov	[bp+var_C6E], 0FFFFh
		cmp	[bp+var_9], 0
		jz	short loc_B4647
		push	3
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	21h
		lea	ax, [bp+var_3F4]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_132]
		push	ax
		lea	ax, [bp+var_C70]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_B4647:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+2], 2
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		push	3
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	11h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_146], 0
		mov	byte ptr [bp+var_142], 2
		mov	byte ptr [bp+var_142+1], 0
		mov	[bp+var_140], 0
		push	3
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	1Dh
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14E+2], 2
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		push	3
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	13h
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_156], 2
		mov	byte ptr [bp+var_156+1], 0
		mov	[bp+var_154], 0
		push	3
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	1Ch
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160], 2
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_15E], 0
		push	3
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	0Ah
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_16E], 0
		mov	byte ptr [bp+var_16A], 2
		mov	byte ptr [bp+var_16A+1], 0
		mov	[bp+var_168], 0
		push	3
		lea	ax, word ptr [bp+var_16E]
		push	ax
		push	9
		lea	ax, [bp+var_28C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_206]
		push	ax
		push	0FFh
		push	9
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_172], ax
		or	ax, ax
		jz	short loc_B47EB
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	word ptr [bp+var_172]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_172]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_172]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_172]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_172]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_172]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_172]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_172]
		jmp	short loc_B47EF

loc_B47EB:
		mov	ax, word ptr [bp+var_172]

loc_B47EF:
		mov	word ptr [bp+var_170], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_178+2], ax
		or	ax, ax
		jz	short loc_B4855
		push	0
		push	0
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	word ptr [bp+var_178+2]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_178+2]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_178+2]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_178+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_178+2]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_178+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_178+2]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_178+2]
		jmp	short loc_B4859

loc_B4855:
		mov	ax, word ptr [bp+var_178+2]

loc_B4859:
		mov	word ptr [bp+var_174], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_17A], ax
		or	ax, ax
		jz	short loc_B48BF
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	word ptr [bp+var_17A]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_17A]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_17A]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_17A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_17A]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_17A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_17A]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_17A]
		jmp	short loc_B48C3

loc_B48BF:
		mov	ax, word ptr [bp+var_17A]

loc_B48C3:
		mov	word ptr [bp+var_178], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_17E], ax
		or	ax, ax
		jz	short loc_B4929
		push	0
		push	0
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	word ptr [bp+var_17E]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_17E]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_17E]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_17E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_17E]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_17E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_17E]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_17E]
		jmp	short loc_B492D

loc_B4929:
		mov	ax, word ptr [bp+var_17E]

loc_B492D:
		mov	word ptr [bp+var_17E+2], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_182], ax
		or	ax, ax
		jz	short loc_B4993
		push	0
		push	0
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	[bp+var_182]
		call	Layer_Construct_33FE7
		add	sp, 8
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
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_182]
		jmp	short loc_B4997

loc_B4993:
		mov	ax, [bp+var_182]

loc_B4997:
		mov	[bp+var_180], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_186], ax
		or	ax, ax
		jz	short loc_B49FD
		push	0
		push	0
		lea	ax, word ptr [bp+var_16E]
		push	ax
		push	[bp+var_186]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, [bp+var_186]
		mov	word ptr [bx], 20D9h
		mov	bx, [bp+var_186]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, [bp+var_186]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_186]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_186]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_186]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_186]
		jmp	short loc_B4A01

loc_B49FD:
		mov	ax, [bp+var_186]

loc_B4A01:
		mov	[bp+var_184], ax
		push	2
		push	0
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	0
		call	sub_F088
		add	sp, 0Eh
		mov	[bp+var_188], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_18C], ax
		or	ax, ax
		jz	short loc_B4A83
		push	0
		push	0
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	[bp+var_18C]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, [bp+var_18C]
		mov	word ptr [bx], 20D9h
		mov	bx, [bp+var_18C]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, [bp+var_18C]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_18C]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_18C]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_18C]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_18C]
		jmp	short loc_B4A87

loc_B4A83:
		mov	ax, [bp+var_18C]

loc_B4A87:
		mov	[bp+var_18A], ax
		push	[bp+var_70]
		mov	al, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_B0]
		mov	al, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_C0]
		mov	al, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_170]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_174]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_17E+2]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_180]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_184]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_188]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_18A]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_178]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_18E], 0
		mov	[bp+var_190], 0
		jmp	loc_B4E7D

loc_B4B90:
		mov	ax, word ptr [bp+var_C76+1]
		mov	[bp+var_192], ax
		cmp	[bp+var_192], 8
		jle	short loc_B4BBD
		cmp	[bp+var_192], 0Eh
		jge	short loc_B4BBD
		mov	ax, [bp+var_190]
		mov	[bp+var_194], ax
		inc	[bp+var_190]
		mov	bx, [bp+var_184]
		mov	ax, [bp+var_194]
		mov	[bx+1Bh], ax

loc_B4BBD:
		cmp	[bp+var_192], 14h
		jz	short loc_B4BC7
		jmp	loc_B4C57

loc_B4BC7:
		mov	bx, word ptr [bp+var_170]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_170]
		mov	word ptr [bx+1Fh], 1
		mov	bx, word ptr [bp+var_174]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_174]
		mov	word ptr [bx+1Fh], 1
		mov	bx, word ptr [bp+var_178]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_178]
		mov	word ptr [bx+1Fh], 1
		mov	bx, word ptr [bp+var_17E+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_17E+2]
		mov	word ptr [bx+1Fh], 2
		mov	bx, [bp+var_180]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_180]
		mov	word ptr [bx+1Fh], 3
		mov	bx, [bp+var_184]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_184]
		mov	word ptr [bx+1Fh], 3
		mov	bx, [bp+var_188]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_188]
		mov	word ptr [bx+1Fh], 3
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+1Fh], 4

loc_B4C57:
		cmp	[bp+var_192], 64h
		jnz	short loc_B4CA6
		mov	bx, word ptr [bp+var_170]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_170]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_174]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_174]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_178]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_178]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_17E+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_17E+2]
		mov	word ptr [bx+1Fh], 0

loc_B4CA6:
		cmp	[bp+var_192], 50h
		jnz	short loc_B4CD1
		mov	bx, [bp+var_180]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_180]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_184]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_184]
		mov	word ptr [bx+1Fh], 0

loc_B4CD1:
		cmp	[bp+var_192], 3Ch
		jnz	short loc_B4CFC
		mov	bx, [bp+var_188]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_188]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+1Fh], 0

loc_B4CFC:
		cmp	[bp+var_18E], 52h
		jnz	short loc_B4D32
		inc	[bp+var_18E]
		push	word ptr [bp+var_178]
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	word ptr [bp+var_178], 0
		jz	short loc_B4D32
		push	3
		push	word ptr [bp+var_178]
		mov	bx, word ptr [bp+var_178]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_B4D32

loc_B4D32:
		cmp	[bp+var_192], 63h
		jnz	short loc_B4D48
		push	0Ch
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_B4D48:
		cmp	[bp+var_192], 63h
		jle	short loc_B4D6D
		cmp	[bp+var_18E], 52h
		jge	short loc_B4D6D
		mov	ax, [bp+var_18E]
		mov	[bp+var_196], ax
		inc	[bp+var_18E]
		mov	bx, word ptr [bp+var_178]
		mov	ax, [bp+var_196]
		mov	[bx+1Bh], ax

loc_B4D6D:
		cmp	[bp+var_192], 6Ch
		jnz	short loc_B4DBE
		cmp	[bp+var_9], 0
		jz	short loc_B4DBE
		mov	ax, word_4EFB6
		mov	[bp+var_198], ax
		mov	[bp+var_19A], 0
		cmp	[bp+var_C70], 0
		jz	short loc_B4DBE
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_19A]
		push	[bp+var_198]
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_B4DBE

loc_B4DBE:
		cmp	[bp+var_192], 76h
		jnz	short loc_B4E0F
		cmp	[bp+var_9], 0
		jz	short loc_B4E0F
		mov	ax, word_4EFB6
		mov	[bp+var_19C], ax
		mov	[bp+var_19E], 0
		cmp	[bp+var_C70], 0
		jz	short loc_B4E0F
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_19E]
		push	[bp+var_19C]
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_B4E0F

loc_B4E0F:
		cmp	[bp+var_18E], 4Bh
		jnz	short loc_B4E63
		cmp	[bp+var_9], 0
		jz	short loc_B4E63
		mov	ax, word_4EFB6
		add	ax, 0FFC4h
		mov	[bp+var_1A0], ax
		mov	[bp+var_1A2], 0
		cmp	[bp+var_C70], 0
		jz	short loc_B4E63
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_1A2]
		push	[bp+var_1A0]
		push	[bp+var_C6E]
		mov	bx, [bp+var_C70]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_B4E63

loc_B4E63:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B4E70
		jmp	short loc_B4E70
		jmp	short loc_B4E9C

loc_B4E70:
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_B4E7D:
		cmp	word ptr [bp+var_C76+1], 0B9h
		jnb	short loc_B4E8C
		cmp	byte ptr [bp+var_C76+3], 0
		jz	short loc_B4E91

loc_B4E8C:
		mov	ax, 1
		jmp	short loc_B4E93

loc_B4E91:
		xor	ax, ax

loc_B4E93:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B4E9C
		jmp	loc_B4B90

loc_B4E9C:
		push	0
		lea	ax, word ptr [bp+var_C94+2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_16A+1], 0
		jz	short loc_B4ED3
		cmp	[bp+var_16E], 0
		jz	short loc_B4ED3
		push	0
		mov	al, byte ptr [bp+var_16A]
		push	ax
		lea	ax, word ptr [bp+var_16E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B4ED3

loc_B4ED3:
		mov	[bp+var_16E], 0
		mov	byte ptr [bp+var_16A+1], 0
		mov	[bp+var_168], 0
		cmp	byte ptr [bp+var_160+1], 0
		jz	short loc_B4F12
		cmp	[bp+var_164], 0
		jz	short loc_B4F12
		push	0
		mov	al, byte ptr [bp+var_160]
		push	ax
		lea	ax, word ptr [bp+var_164]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B4F12

loc_B4F12:
		mov	[bp+var_164], 0
		mov	byte ptr [bp+var_160+1], 0
		mov	[bp+var_15E], 0
		cmp	byte ptr [bp+var_156+1], 0
		jz	short loc_B4F51
		cmp	[bp+var_15A], 0
		jz	short loc_B4F51
		push	0
		mov	al, byte ptr [bp+var_156]
		push	ax
		lea	ax, word ptr [bp+var_15A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B4F51

loc_B4F51:
		mov	[bp+var_15A], 0
		mov	byte ptr [bp+var_156+1], 0
		mov	[bp+var_154], 0
		cmp	byte ptr [bp+var_14E+3], 0
		jz	short loc_B4F90
		cmp	[bp+var_150], 0
		jz	short loc_B4F90
		push	0
		mov	al, byte ptr [bp+var_14E+2]
		push	ax
		lea	ax, word ptr [bp+var_150]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B4F90

loc_B4F90:
		mov	[bp+var_150], 0
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		cmp	byte ptr [bp+var_142+1], 0
		jz	short loc_B4FCF
		cmp	[bp+var_146], 0
		jz	short loc_B4FCF
		push	0
		mov	al, byte ptr [bp+var_142]
		push	ax
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B4FCF

loc_B4FCF:
		mov	[bp+var_146], 0
		mov	byte ptr [bp+var_142+1], 0
		mov	[bp+var_140], 0
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_B500E
		cmp	[bp+var_13C], 0
		jz	short loc_B500E
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B500E

loc_B500E:
		mov	[bp+var_13C], 0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		lea	ax, [bp+var_C70]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_C6C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_12E+1], 0
		jz	short loc_B5069
		cmp	[bp+var_132], 0
		jz	short loc_B5069
		push	0
		mov	al, byte ptr [bp+var_12E]
		push	ax
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5069

loc_B5069:
		mov	[bp+var_132], 0
		mov	byte ptr [bp+var_12E+1], 0
		mov	[bp+var_12C], 0
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah

loc_B5097:
		lea	ax, [bp+var_C60]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C40]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_11B], 0
		jz	short loc_B50DB
		cmp	[bp+var_120], 0
		jz	short loc_B50DB
		push	0
		mov	al, [bp+var_11C]
		push	ax
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B50DB

loc_B50DB:
		mov	[bp+var_120], 0
		mov	[bp+var_11B], 0
		mov	[bp+var_11A], 0
		cmp	[bp+var_111], 0
		jz	short loc_B511A
		cmp	[bp+var_116], 0
		jz	short loc_B511A
		push	0
		mov	al, [bp+var_112]
		push	ax
		lea	ax, word ptr [bp+var_116]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B511A

loc_B511A:
		mov	[bp+var_116], 0
		mov	[bp+var_111], 0
		mov	[bp+var_110], 0
		cmp	[bp+var_107], 0
		jz	short loc_B5159
		cmp	[bp+var_10C], 0
		jz	short loc_B5159
		push	0
		mov	al, [bp+var_108]
		push	ax
		lea	ax, word ptr [bp+var_10C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5159

loc_B5159:
		mov	[bp+var_10C], 0
		mov	[bp+var_107], 0
		mov	[bp+var_106], 0
		cmp	[bp+var_FD], 0
		jz	short loc_B5198
		cmp	[bp+var_102], 0
		jz	short loc_B5198
		push	0
		mov	al, [bp+var_FE]
		push	ax
		lea	ax, word ptr [bp+var_102]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5198

loc_B5198:
		mov	[bp+var_102], 0
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		cmp	[bp+var_F3], 0
		jz	short loc_B51D7
		cmp	[bp+var_F8], 0
		jz	short loc_B51D7
		push	0
		mov	al, [bp+var_F4]
		push	ax
		lea	ax, word ptr [bp+var_F8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B51D7

loc_B51D7:
		mov	[bp+var_F8], 0
		mov	[bp+var_F3], 0
		mov	[bp+var_F2], 0
		cmp	[bp+var_E9], 0
		jz	short loc_B5216
		cmp	[bp+var_EE], 0
		jz	short loc_B5216
		push	0
		mov	al, [bp+var_EA]
		push	ax
		lea	ax, word ptr [bp+var_EE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5216

loc_B5216:
		mov	[bp+var_EE], 0
		mov	[bp+var_E9], 0
		mov	[bp+var_E8], 0
		cmp	[bp+var_DF], 0
		jz	short loc_B5255
		cmp	[bp+var_E4], 0
		jz	short loc_B5255
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5255

loc_B5255:
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_B5294
		cmp	[bp+var_DA], 0
		jz	short loc_B5294
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5294

loc_B5294:
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		lea	ax, [bp+var_D0]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_C5], 0
		jz	short loc_B52E0
		cmp	[bp+var_CA], 0
		jz	short loc_B52E0
		push	0
		mov	al, [bp+var_C6]
		push	ax
		lea	ax, word ptr [bp+var_CA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B52E0

loc_B52E0:
		mov	[bp+var_CA], 0
		mov	[bp+var_C5], 0
		mov	[bp+var_C4], 0
		lea	ax, [bp+var_C0]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_B5], 0
		jz	short loc_B532C
		cmp	[bp+var_BA], 0
		jz	short loc_B532C
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B532C

loc_B532C:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		lea	ax, [bp+var_B0]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A5], 0
		jz	short loc_B5378
		cmp	[bp+var_AA], 0
		jz	short loc_B5378
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5378

loc_B5378:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		lea	ax, [bp+var_A0]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_95], 0
		jz	short loc_B53C4
		cmp	[bp+var_9A], 0
		jz	short loc_B53C4
		push	0
		mov	al, [bp+var_96]
		push	ax
		lea	ax, word ptr [bp+var_9A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B53C4

loc_B53C4:
		mov	[bp+var_9A], 0
		mov	[bp+var_95], 0
		mov	[bp+var_94], 0
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_85], 0
		jz	short loc_B5410
		cmp	[bp+var_8A], 0
		jz	short loc_B5410
		push	0
		mov	al, [bp+var_86]
		push	ax
		lea	ax, word ptr [bp+var_8A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5410

loc_B5410:
		mov	[bp+var_8A], 0
		mov	[bp+var_85], 0
		mov	[bp+var_84], 0
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_75], 0
		jz	short loc_B5457
		cmp	[bp+var_7A], 0
		jz	short loc_B5457
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, word ptr [bp+var_7A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5457

loc_B5457:
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_65], 0
		jz	short loc_B549B
		cmp	[bp+var_6A], 0
		jz	short loc_B549B
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B549B

loc_B549B:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_B54D3
		cmp	[bp+var_60], 0
		jz	short loc_B54D3
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B54D3

loc_B54D3:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_B550B
		cmp	[bp+var_56], 0
		jz	short loc_B550B
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B550B

loc_B550B:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_B5543
		cmp	[bp+var_4C], 0
		jz	short loc_B5543
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5543

loc_B5543:
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_B557B
		cmp	[bp+var_42], 0
		jz	short loc_B557B
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B557B

loc_B557B:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_B55B3
		cmp	[bp+var_38], 0
		jz	short loc_B55B3
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B55B3

loc_B55B3:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		mov	[bp+var_C28], 129Fh
		lea	ax, [bp+var_C28]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_C13], 0
		jz	short loc_B5602
		cmp	[bp+var_C18], 0
		jz	short loc_B5602
		push	0
		mov	al, [bp+var_C14]
		push	ax
		lea	ax, word ptr [bp+var_C18]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5602

loc_B5602:
		mov	[bp+var_C18], 0
		mov	[bp+var_C13], 0
		mov	[bp+var_C12], 0
		lea	ax, [bp+var_402]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3FE]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3F4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_1F], 0
		jz	short loc_B5668
		cmp	[bp+var_24], 0
		jz	short loc_B5668
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5668

loc_B5668:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	2
		lea	ax, [bp+var_37C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_304]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_28C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_16]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_10]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_214]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_206]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_6]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_AEDE0		endp

; START OF FUNCTION CHUNK FOR sub_AEDE0
off_B56ED	dw offset loc_AEFD3
		dw offset loc_AF156
		dw offset loc_AF156
		dw offset loc_AF156
		dw offset loc_AF156
; END OF FUNCTION CHUNK FOR sub_AEDE0
ovr213		ends
