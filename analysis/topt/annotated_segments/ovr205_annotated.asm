ovr205		segment	para public 'OVERLAY' use16
		assume cs:ovr205
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, cinématique mid12 de Tactical Operations (2026-11-02) : script extrait par
; tools/midgame_extract.py dans analysis/topt/midgames/mid12.md et .json, fichier
; analysis/topt/midgames/iff. Fonction entière lue par exécution symbolique, pas commentée
; ligne à ligne.
; ==============================================================================================
Midgame12_Play_7CCD0		proc far

var_BFC		= word ptr -0BFCh
var_BFA		= word ptr -0BFAh
var_BF8		= word ptr -0BF8h
var_BF6		= word ptr -0BF6h
var_BEC		= word ptr -0BECh
var_BBC		= word ptr -0BBCh
var_B8F		= dword ptr -0B8Fh
var_B8B		= dword ptr -0B8Bh
var_B87		= dword ptr -0B87h
var_B7A		= word ptr -0B7Ah
var_B76		= dword ptr -0B76h
var_B72		= word ptr -0B72h
var_B70		= word ptr -0B70h
var_B6E		= word ptr -0B6Eh
var_B6C		= dword ptr -0B6Ch
var_B68		= byte ptr -0B68h
var_B66		= word ptr -0B66h
var_B52		= word ptr -0B52h
var_B50		= word ptr -0B50h
var_B4E		= word ptr -0B4Eh
var_B4C		= word ptr -0B4Ch
var_B4A		= dword ptr -0B4Ah
var_B46		= byte ptr -0B46h
var_B44		= word ptr -0B44h
var_B42		= word ptr -0B42h
var_B30		= word ptr -0B30h
var_B22		= word ptr -0B22h
var_B0A		= word ptr -0B0Ah
var_B08		= word ptr -0B08h
var_AFA		= dword ptr -0AFAh
var_AF6		= byte ptr -0AF6h
var_AF5		= byte ptr -0AF5h
var_AF4		= dword ptr -0AF4h
var_2ED		= dword ptr -2EDh
var_2E9		= dword ptr -2E9h
var_2E4		= word ptr -2E4h
var_2E2		= word ptr -2E2h
var_2E0		= word ptr -2E0h
var_2DE		= word ptr -2DEh
var_2DC		= dword ptr -2DCh
var_2D8		= byte ptr -2D8h
var_2D6		= word ptr -2D6h
var_25E		= word ptr -25Eh
var_1E6		= word ptr -1E6h
var_16E		= word ptr -16Eh
var_16C		= word ptr -16Ch
var_16A		= word ptr -16Ah
var_168		= word ptr -168h
var_166		= word ptr -166h
var_164		= word ptr -164h
var_160		= word ptr -160h
var_15E		= word ptr -15Eh
var_15C		= word ptr -15Ch
var_15A		= word ptr -15Ah
var_158		= word ptr -158h
var_156		= word ptr -156h
var_152		= word ptr -152h
var_102		= word ptr -102h
var_100		= dword ptr -100h
var_FC		= word ptr -0FCh
var_FA		= dword ptr -0FAh
var_F7		= word ptr -0F7h
var_F6		= dword ptr -0F6h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EE		= dword ptr -0EEh
var_EA		= dword ptr -0EAh
var_E6		= dword ptr -0E6h
var_E4		= dword ptr -0E4h
var_E2		= dword ptr -0E2h
var_E0		= dword ptr -0E0h
var_DE		= dword ptr -0DEh
var_DC		= dword ptr -0DCh
var_DA		= dword ptr -0DAh
var_D8		= dword ptr -0D8h
var_D6		= dword ptr -0D6h
var_D4		= dword ptr -0D4h
var_D2		= dword ptr -0D2h
var_D0		= dword ptr -0D0h
var_CC		= word ptr -0CCh
var_CA		= word ptr -0CAh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= byte ptr -0C0h
var_BF		= byte ptr -0BFh
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= byte ptr -0B6h
var_B5		= byte ptr -0B5h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= byte ptr -0ACh
var_AB		= byte ptr -0ABh
var_AA		= dword ptr -0AAh
var_A6		= word ptr -0A6h
var_A4		= byte ptr -0A4h
var_A3		= word ptr -0A3h
var_A0		= dword ptr -0A0h
var_9C		= byte ptr -9Ch
var_9B		= byte ptr -9Bh
var_9A		= dword ptr -9Ah
var_96		= word ptr -96h
var_94		= byte ptr -94h
var_93		= word ptr -93h
var_90		= dword ptr -90h
var_8C		= byte ptr -8Ch
var_8B		= byte ptr -8Bh
var_8A		= dword ptr -8Ah
var_86		= word ptr -86h
var_84		= byte ptr -84h
var_83		= word ptr -83h
var_80		= dword ptr -80h
var_7C		= byte ptr -7Ch
var_7B		= byte ptr -7Bh
var_7A		= dword ptr -7Ah
var_76		= word ptr -76h
var_74		= byte ptr -74h
var_73		= word ptr -73h
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
var_34		= dword ptr -34h
var_30		= byte ptr -30h
var_2F		= byte ptr -2Fh
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= byte ptr -28h
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_12		= word ptr -12h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0BECh
		push	si
		push	di
		mov	[bp+var_2], 277Eh
		mov	[bp+var_6], 0
		push	0C8h
		push	1Dh
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		mov	byte_4F55C, 0
		mov	[bp+var_9], 0
		mov	[bp+var_A], 0
		mov	[bp+var_B], 0
		cmp	word_4CA5B, 0
		jz	short loc_7CD10
		mov	[bp+var_A], 1

loc_7CD10:
		mov	ax, word_4D36E
		mov	[bp+var_E], ax
		mov	[bp+var_160], 0
		mov	[bp+var_15E], 0
		push	[bp+var_E]
		lea	ax, [bp+var_160]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_16E], 0
		mov	[bp+var_16C], 0
		mov	[bp+var_16A], 0
		mov	[bp+var_168], 0
		mov	[bp+var_166], 13Fh
		mov	[bp+var_164], 9Dh
		push	0
		lea	ax, [bp+var_16E]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_16E]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_15C], 0
		mov	[bp+var_15A], 18h
		mov	[bp+var_158], 13Fh
		mov	[bp+var_156], 97h
		mov	byte ptr [bp+var_1C], 0
		mov	byte ptr [bp+var_1C+1], 0
		mov	[bp+var_1A], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid12
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_152]
		push	ax
		lea	ax, [bp+var_1E6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_1E6]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid12voc
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_25E]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		cmp	[bp+var_A], 0
		jz	short loc_7CE48
		push	ds
		lea	ax, [bp+var_152]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_7CE48
		push	1
		lea	ax, [bp+var_152]
		push	ax
		lea	ax, [bp+var_25E]
		push	ax
		mov	bx, [bp+var_25E]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_25E]
		push	ax
		call	sub_435F1
		add	sp, 2
		jmp	short loc_7CE4C

loc_7CE48:
		mov	[bp+var_A], 0

loc_7CE4C:
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		mov	al, byte_4CA58
		mov	[bp+var_28], al
		lea	ax, [bp+var_2D6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_28]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_7CE87
		jmp	loc_7D1BE

loc_7CE87:
		shl	bx, 1
		jmp	cs:off_829DB[bx]	; switch jump

loc_7CE8E:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_152]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_7CEBC
		jmp	loc_7CFD0

loc_7CEBC:
		push	1
		lea	ax, [bp+var_152]
		push	ax
		lea	ax, [bp+var_2D6]
		push	ax
		mov	bx, [bp+var_2D6]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_2D6]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_9
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_BEC]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_BEC], 480h
		mov	[bp+var_B8B], 100h
		mov	[bp+var_B8F], 0
		mov	[bp+var_BEC], 498h
		push	1
		lea	ax, [bp+var_152]
		push	ax
		lea	ax, [bp+var_BEC]
		push	ax
		mov	bx, [bp+var_BEC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	word ptr [bp+var_D0+2], 1
		jmp	short loc_7CF96

loc_7CF7B:
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, word ptr [bp+var_D0+2]
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	word ptr [bp+var_D0+2]

loc_7CF96:
		cmp	word ptr [bp+var_D0+2], 6Ah
		jle	short loc_7CF7B
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_B], 1
		mov	[bp+var_BEC], 498h
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_BEC]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_7CFD0:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_152]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_7D00E
		mov	[bp+var_9], 1
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7D00E
		mov	word_4F048, 5Ah

loc_7D00E:
		jmp	loc_7D1BE

loc_7D011:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_152]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_7D03F
		jmp	loc_7D15D

loc_7D03F:
		cmp	word_4CA5D, 0
		jnz	short loc_7D049
		jmp	loc_7D15D

loc_7D049:
		push	1
		lea	ax, [bp+var_152]
		push	ax
		lea	ax, [bp+var_2D6]
		push	ax
		mov	bx, [bp+var_2D6]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_2D6]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_10
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_BEC]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_BEC], 480h
		mov	[bp+var_B8B], 100h
		mov	[bp+var_B8F], 0
		mov	[bp+var_BEC], 498h
		push	1
		lea	ax, [bp+var_152]
		push	ax
		lea	ax, [bp+var_BEC]
		push	ax
		mov	bx, [bp+var_BEC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	word ptr [bp+var_D0+2], 1
		jmp	short loc_7D123

loc_7D108:
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, word ptr [bp+var_D0+2]
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	word ptr [bp+var_D0+2]

loc_7D123:
		cmp	word ptr [bp+var_D0+2], 6Ah
		jle	short loc_7D108
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_B], 1
		mov	[bp+var_BEC], 498h
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_BEC]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_7D15D:
		cmp	[bp+var_28], 3
		jnz	short loc_7D17E
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_7D197

loc_7D17E:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_7D197:
		push	ds
		lea	ax, [bp+var_152]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_7D1BC
		mov	[bp+var_9], 1
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7D1BC
		mov	word_4F048, 0FFh

loc_7D1BC:
		jmp	short loc_7D1BE

loc_7D1BE:
		mov	ax, word_4B15C
		mov	[bp+var_2A], ax
		cmp	[bp+var_B], 0
		jnz	short loc_7D1CD
		jmp	loc_7D2E3

loc_7D1CD:
		mov	[bp+var_B4E], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_B4C], ax
		lea	ax, [bp+var_B4E]
		mov	word_4D392, ax
		mov	[bp+var_B4E], 1BCh
		mov	[bp+var_B4A], 0
		mov	[bp+var_B46], 0
		mov	[bp+var_B52], 0
		mov	[bp+var_B50], 0FFFFh
		push	word_4CA5D
		lea	ax, [bp+var_B52]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		mov	word ptr [bp+var_D0+2], 0
		jmp	loc_7D2BD

loc_7D21B:
		mov	[bp+var_D8], 0
		mov	byte ptr [bp+var_D4], 2
		mov	byte ptr [bp+var_D4+1], 0
		mov	[bp+var_D2], 0
		push	3
		lea	ax, word ptr [bp+var_D8]
		push	ax
		lea	ax, [bp+var_2A]
		mov	bx, word ptr [bp+var_D0+2]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_2D6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		lea	ax, word ptr [bp+var_D8]
		push	ax
		lea	ax, [bp+var_B52]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_B52]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		cmp	byte ptr [bp+var_D4+1], 0
		jz	short loc_7D2A2
		cmp	[bp+var_D8], 0
		jz	short loc_7D2A2
		push	0
		mov	al, byte ptr [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7D2A2

loc_7D2A2:
		mov	[bp+var_D8], 0
		mov	byte ptr [bp+var_D4+1], 0
		mov	[bp+var_D2], 0
		inc	word ptr [bp+var_D0+2]

loc_7D2BD:
		cmp	word ptr [bp+var_D0+2], 2
		jge	short loc_7D2C7
		jmp	loc_7D21B

loc_7D2C7:
		lea	ax, [bp+var_B52]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_7D2E3:
		mov	[bp+var_2E0], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_2DE], ax
		lea	ax, [bp+var_2E0]
		mov	word_4D392, ax
		mov	[bp+var_2E0], 1BCh
		mov	[bp+var_2DC], 0
		mov	[bp+var_2D8], 0
		mov	[bp+var_2E4], 0
		mov	[bp+var_2E2], 0FFFFh
		cmp	[bp+var_9], 0
		jnz	short loc_7D320
		jmp	loc_7D3A0

loc_7D320:
		push	1
		lea	ax, [bp+var_152]
		push	ax
		lea	ax, [bp+var_BBC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_BBC]
		push	ax
		call	sub_435F1
		add	sp, 2
		cmp	[bp+var_A], 0
		jz	short loc_7D34E
		mov	byte ptr [bp+var_D0+3], 7
		jmp	short loc_7D353

loc_7D34E:
		mov	byte ptr [bp+var_D0+3], 6

loc_7D353:
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		mov	al, byte ptr [bp+var_D0+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_BBC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_2E4]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_2E4]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, [bp+var_BBC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_7D3A0:
		mov	[bp+var_B0A], 129Fh
		mov	[bp+var_AFA], 0
		mov	[bp+var_AF6], 2
		mov	[bp+var_AF5], 0
		mov	[bp+var_AF4], 0
		mov	[bp+var_B08], 0
		mov	[bp+var_B0A], 1FA5h
		xor	eax, eax
		mov	[bp+var_2ED], eax
		mov	[bp+var_2E9], eax
		cmp	[bp+var_A], 0
		jnz	short loc_7D3E4
		jmp	loc_7D508

loc_7D3E4:
		push	word_4CA5B
		lea	ax, [bp+var_B0A]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_11
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_BEC]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_BEC], 480h
		mov	[bp+var_B8B], 100h
		mov	[bp+var_B8F], 0
		mov	[bp+var_BEC], 498h
		push	1
		lea	ax, [bp+var_152]
		push	ax
		lea	ax, [bp+var_BEC]
		push	ax
		mov	bx, [bp+var_BEC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3231474Dh
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		mov	word ptr [bp+var_D0+2], 0
		jmp	short loc_7D4CF

loc_7D481:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	ax, [bp+var_B7A]
		mov	word ptr [bp+var_D0], ax
		movsx	eax, word ptr [bp+var_D0]
		push	eax
		push	ds
		mov	ax, [bp+var_8]
		imul	word ptr [bp+var_D0+2]
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_B76]
		mov	[bp+var_B87], eax
		inc	word ptr [bp+var_D0+2]

loc_7D4CF:
		cmp	word ptr [bp+var_D0+2], 2
		jl	short loc_7D481
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_BEC], 498h
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_BEC]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		jmp	loc_7D773

loc_7D508:
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_12
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_BEC]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_BEC], 480h
		mov	[bp+var_B8B], 100h
		mov	[bp+var_B8F], 0
		mov	[bp+var_BEC], 498h
		push	1
		lea	ax, [bp+var_152]
		push	ax
		lea	ax, [bp+var_BEC]
		push	ax
		mov	bx, [bp+var_BEC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3231474Dh
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		mov	word ptr [bp+var_D0+2], 0
		jmp	short loc_7D5E2

loc_7D594:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	ax, [bp+var_B7A]
		mov	word ptr [bp+var_D0], ax
		movsx	eax, word ptr [bp+var_D0]
		push	eax
		push	ds
		mov	ax, [bp+var_8]
		imul	word ptr [bp+var_D0+2]
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_B76]
		mov	[bp+var_B87], eax
		inc	word ptr [bp+var_D0+2]

loc_7D5E2:
		cmp	word ptr [bp+var_D0+2], 1Dh
		jl	short loc_7D594
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_7D65E
		push	[bp+arg_0]
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_8]
		mov	dx, 17h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_7D751

loc_7D65E:
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_7D6C6
		push	[bp+arg_2]
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_8]
		mov	dx, 17h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_7D751

loc_7D6C6:
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_7D72D
		push	[bp+arg_4]
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_8]
		mov	dx, 17h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_7D751

loc_7D72D:
		mov	ax, [bp+var_8]
		mov	dx, 17h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_7D751:
		mov	[bp+var_BEC], 498h
		lea	ax, [bp+var_BEC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_BEC]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_7D773:
		mov	[bp+var_34], 0
		mov	[bp+var_30], 2
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		push	3
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	4
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_3E], 0
		mov	[bp+var_3A], 2
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		push	3
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	3
		lea	ax, [bp+var_1E6]
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
		lea	ax, [bp+var_1E6]
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
		push	8
		lea	ax, [bp+var_1E6]
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
		push	9
		lea	ax, [bp+var_1E6]
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
		push	6
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_70], 0
		mov	[bp+var_6C], 2
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	0
		push	2
		lea	ax, word ptr [bp+var_70]
		push	ax
		call	ConvData_LoadNormalOrNight_10C9F
		add	sp, 6
		mov	[bp+var_73], 0
		lea	ax, word ptr [bp+var_70]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_80], 0
		mov	[bp+var_7C], 2
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	15h
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_83], 0
		lea	ax, word ptr [bp+var_80]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_90], 0
		mov	[bp+var_8C], 2
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	14h
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_93], 0
		lea	ax, word ptr [bp+var_90]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_A0], 0
		mov	[bp+var_9C], 2
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	16h
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_A3], 0
		lea	ax, word ptr [bp+var_A0]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_B0], 0
		mov	[bp+var_AC], 2
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	3
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	27B4h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	27B8h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_C4], 0
		mov	[bp+var_C0], 2
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		push	ds
		push	offset unk_4B1AA
		push	ds
		push	offset aConvfontShp_3
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_152]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_152]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_C8+2], dx
		mov	word ptr [bp+var_C8], ax
		mov	eax, [bp+var_C8]
		mov	[bp+var_C4], eax
		mov	[bp+var_C0], 2
		mov	[bp+var_BF], 1
		mov	[bp+var_BE], 0
		lea	ax, word ptr [bp+var_C4]
		push	ax
		lea	ax, [bp+var_B22]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		lea	ax, [bp+var_B22]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	[bp+var_BFC], 0
		mov	[bp+var_BFA], 98h
		mov	[bp+var_BF8], 13Fh
		mov	[bp+var_BF6], 0C7h
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0C8h
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_7DAC7
		jmp	loc_8257A

loc_7DAC7:
		cmp	[bp+var_9], 0
		jz	short loc_7DB11
		mov	ax, word_4F048
		mov	[bp+var_CA], ax
		mov	[bp+var_CC], 0
		cmp	[bp+var_2E4], 0
		jz	short loc_7DB11
		push	[bp+var_2E2]
		mov	bx, [bp+var_2E4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_CC]
		push	[bp+var_CA]
		push	[bp+var_2E2]
		mov	bx, [bp+var_2E4]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_7DB11

loc_7DB11:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2], 2
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		push	3
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	1
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E0], 0
		mov	byte ptr [bp+var_DC], 2
		mov	byte ptr [bp+var_DC+1], 0
		mov	[bp+var_DA], 0
		push	2
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	12h
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_E4+1], 0
		lea	ax, word ptr [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0
		call	Layer_ConstructAtOrigin_33EE1
		add	sp, 4
		mov	word ptr [bp+var_EA+2], ax
		push	word ptr [bp+var_E6]
		mov	al, byte ptr [bp+var_E4]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_EA+2]
		lea	ax, [bp+var_B66]
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
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	word ptr [bp+var_E6]
		mov	al, byte ptr [bp+var_E4]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeFromColor_34EEE
		add	sp, 0Ah
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0EFh
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		jmp	short loc_7DCC4

loc_7DC66:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_EA], ax
		cmp	word ptr [bp+var_EA], 8
		jnz	short loc_7DC85
		push	[bp+var_6]
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7DC85:
		cmp	word ptr [bp+var_EA], 1Ch
		jnz	short loc_7DC9B
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7DC9B:
		jmp	short loc_7DCB7
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7DCB7
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7DCDF

loc_7DCB7:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7DCC4:
		cmp	word ptr [bp+var_B4A+1], 1Dh
		jnb	short loc_7DCD2
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7DCD7

loc_7DCD2:
		mov	ax, 1
		jmp	short loc_7DCD9

loc_7DCD7:
		xor	ax, ax

loc_7DCD9:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7DC66

loc_7DCDF:
		jmp	short loc_7DD43

loc_7DCE1:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_EA], ax
		cmp	word ptr [bp+var_EA], 20h
		jnz	short loc_7DD04
		mov	ax, [bp+var_6]
		add	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7DD04:
		cmp	word ptr [bp+var_EA], 35h
		jnz	short loc_7DD1A
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7DD1A:
		jmp	short loc_7DD36
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7DD36
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7DD5E

loc_7DD36:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7DD43:
		cmp	word ptr [bp+var_B4A+1], 37h
		jnb	short loc_7DD51
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7DD56

loc_7DD51:
		mov	ax, 1
		jmp	short loc_7DD58

loc_7DD56:
		xor	ax, ax

loc_7DD58:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7DCE1

loc_7DD5E:
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_E6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_DC+1], 0
		jz	short loc_7DDB9
		cmp	[bp+var_E0], 0
		jz	short loc_7DDB9
		push	0
		mov	al, byte ptr [bp+var_DC]
		push	ax
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7DDB9

loc_7DDB9:
		mov	[bp+var_E0], 0
		mov	byte ptr [bp+var_DC+1], 0
		mov	[bp+var_DA], 0
		cmp	byte ptr [bp+var_D2+1], 0
		jz	short loc_7DDF8
		cmp	[bp+var_D6], 0
		jz	short loc_7DDF8
		push	0
		mov	al, byte ptr [bp+var_D2]
		push	ax
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7DDF8

loc_7DDF8:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		cmp	byte_4F55C, 0
		jz	short loc_7DE19
		jmp	loc_8257A

loc_7DE19:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2], 2
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		push	3
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	7
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D8], ax
		push	0
		push	0
		push	0C8h
		push	0
		push	11h
		push	2Ch
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_DBA8
		add	sp, 10h
		mov	word ptr [bp+var_DA], ax
		push	0
		push	0
		push	0C8h
		push	0
		push	11h
		push	2Ch
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_DBA8
		add	sp, 10h
		mov	word ptr [bp+var_DC], ax
		push	[bp+var_A6]
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_D8]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_DA]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_DC]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	word ptr [bp+var_DE], 0
		jmp	loc_7DFC9

loc_7DF30:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_E0], ax
		cmp	word ptr [bp+var_E0], 7
		jle	short loc_7DF5D
		cmp	word ptr [bp+var_E0], 0Dh
		jge	short loc_7DF5D
		mov	ax, word ptr [bp+var_DE]
		mov	word ptr [bp+var_E2], ax
		inc	word ptr [bp+var_DE]
		mov	bx, word ptr [bp+var_DC]
		mov	ax, word ptr [bp+var_E2]
		mov	[bx+1Bh], ax

loc_7DF5D:
		cmp	word ptr [bp+var_E0], 18h
		jle	short loc_7DF82
		cmp	word ptr [bp+var_E0], 1Ch
		jge	short loc_7DF82
		dec	word ptr [bp+var_DE]
		mov	ax, word ptr [bp+var_DE]
		mov	word ptr [bp+var_E4], ax
		mov	bx, word ptr [bp+var_DC]
		mov	ax, word ptr [bp+var_E4]
		mov	[bx+1Bh], ax

loc_7DF82:
		cmp	word ptr [bp+var_E0], 1Ch
		jle	short loc_7DFAF
		cmp	word ptr [bp+var_E0], 20h
		jge	short loc_7DFAF
		test	word ptr [bp+var_E0], 1
		jz	short loc_7DFAF
		dec	word ptr [bp+var_DE]
		mov	ax, word ptr [bp+var_DE]
		mov	word ptr [bp+var_E6], ax
		mov	bx, word ptr [bp+var_DC]
		mov	ax, word ptr [bp+var_E6]
		mov	[bx+1Bh], ax

loc_7DFAF:
		jmp	short loc_7DFBC
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7DFBC
		jmp	short loc_7DFE7

loc_7DFBC:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7DFC9:
		cmp	word ptr [bp+var_B4A+1], 2Ah
		jnb	short loc_7DFD7
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7DFDC

loc_7DFD7:
		mov	ax, 1
		jmp	short loc_7DFDE

loc_7DFDC:
		xor	ax, ax

loc_7DFDE:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7DFE7
		jmp	loc_7DF30

loc_7DFE7:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_D2+1], 0
		jz	short loc_7E01E
		cmp	[bp+var_D6], 0
		jz	short loc_7E01E
		push	0
		mov	al, byte ptr [bp+var_D2]
		push	ax
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7E01E

loc_7E01E:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		cmp	byte_4F55C, 0
		jz	short loc_7E03F
		jmp	loc_8257A

loc_7E03F:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2], 2
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		push	3
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0Fh
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E0], 0
		mov	byte ptr [bp+var_DC], 2
		mov	byte ptr [bp+var_DC+1], 0
		mov	[bp+var_DA], 0
		push	3
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	0Eh
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_EA], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1], 0
		mov	[bp+var_E4], 0
		push	2
		lea	ax, word ptr [bp+var_EA]
		push	ax
		push	18h
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_EE+1], 0
		lea	ax, word ptr [bp+var_EA]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F4+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_F4], ax
		push	0
		push	0Ah
		push	0D7h
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_F6], ax
		push	word ptr [bp+var_F4+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_F4]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_F6]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_F0]
		mov	al, byte ptr [bp+var_EE]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_7E1DE
		jmp	loc_7E302

loc_7E1DE:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_100], 0
		mov	byte ptr [bp+var_FC], 2
		mov	byte ptr [bp+var_FC+1], 0
		mov	[bp+var_FA], 0
		push	2
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	5
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_100]
		push	ax
		lea	ax, [bp+var_B0A]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		mov	[bp+var_102], 0
		jmp	short loc_7E270

loc_7E237:
		cmp	[bp+var_102], 1
		jle	short loc_7E25F
		cmp	[bp+var_102], 7
		jge	short loc_7E25F
		push	0
		mov	ax, [bp+var_102]
		add	ax, 0FFF3h
		push	ax
		push	word ptr [bp+var_F6]
		mov	bx, word ptr [bp+var_F6]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_7E25F:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	[bp+var_102]

loc_7E270:
		cmp	[bp+var_102], 8
		jl	short loc_7E237
		push	0FFFFh
		lea	ax, [bp+var_B0A]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_7E2A2

loc_7E288:
		jmp	short loc_7E295
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7E295
		jmp	short loc_7E2B3

loc_7E295:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7E2A2:
		lea	ax, [bp+var_B0A]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_7E288

loc_7E2B3:
		lea	ax, [bp+var_B0A]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_FC+1], 0
		jz	short loc_7E2E8
		cmp	[bp+var_100], 0
		jz	short loc_7E2E8
		push	0
		mov	al, byte ptr [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7E2E8

loc_7E2E8:
		mov	[bp+var_100], 0
		mov	byte ptr [bp+var_FC+1], 0
		mov	[bp+var_FA], 0
		jmp	loc_7E3EE

loc_7E302:
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0FEh
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_4], 20h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7E3D1

loc_7E341:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_FA+2], ax
		cmp	word ptr [bp+var_FA+2], 1
		jle	short loc_7E371
		cmp	word ptr [bp+var_FA+2], 7
		jge	short loc_7E371
		push	0
		mov	ax, word ptr [bp+var_FA+2]
		add	ax, 0FFF3h
		push	ax
		push	word ptr [bp+var_F6]
		mov	bx, word ptr [bp+var_F6]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_7E371:
		cmp	word ptr [bp+var_FA+2], 8
		jnz	short loc_7E390
		mov	ax, [bp+var_8]
		shl	ax, 1
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7E390:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_FA+2]
		jnz	short loc_7E3A8
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7E3A8:
		jmp	short loc_7E3C4
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7E3C4
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7E3EE

loc_7E3C4:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7E3D1:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7E3DE
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7E3E3

loc_7E3DE:
		mov	ax, 1
		jmp	short loc_7E3E5

loc_7E3E3:
		xor	ax, ax

loc_7E3E5:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7E3EE
		jmp	loc_7E341

loc_7E3EE:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_F0]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_E6+1], 0
		jz	short loc_7E432
		cmp	[bp+var_EA], 0
		jz	short loc_7E432
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, word ptr [bp+var_EA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7E432

loc_7E432:
		mov	[bp+var_EA], 0
		mov	byte ptr [bp+var_E6+1], 0
		mov	[bp+var_E4], 0
		cmp	byte ptr [bp+var_DC+1], 0
		jz	short loc_7E471
		cmp	[bp+var_E0], 0
		jz	short loc_7E471
		push	0
		mov	al, byte ptr [bp+var_DC]
		push	ax
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7E471

loc_7E471:
		mov	[bp+var_E0], 0
		mov	byte ptr [bp+var_DC+1], 0
		mov	[bp+var_DA], 0
		cmp	byte ptr [bp+var_D2+1], 0
		jz	short loc_7E4B0
		cmp	[bp+var_D6], 0
		jz	short loc_7E4B0
		push	0
		mov	al, byte ptr [bp+var_D2]
		push	ax
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7E4B0

loc_7E4B0:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		cmp	byte_4F55C, 0
		jz	short loc_7E4D1
		jmp	loc_8257A

loc_7E4D1:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2], 2
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		push	3
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	2
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E0], 0
		mov	byte ptr [bp+var_DC], 2
		mov	byte ptr [bp+var_DC+1], 0
		mov	[bp+var_DA], 0
		push	2
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	13h
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_E4+1], 0
		lea	ax, word ptr [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_EA+2], ax
		push	0
		push	0FFF6h
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_EA], ax
		push	word ptr [bp+var_EA+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_EA]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_E6]
		mov	al, byte ptr [bp+var_E4]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jz	short loc_7E640
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	word ptr [bp+var_EE+2], 0
		jmp	short loc_7E636

loc_7E625:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_EE+2]

loc_7E636:
		cmp	word ptr [bp+var_EE+2], 14h
		jl	short loc_7E625
		jmp	loc_7E70A

loc_7E640:
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	80h
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_4], 1Ah
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	short loc_7E6ED

loc_7E67E:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_EE+2], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_EE+2]
		jnz	short loc_7E6AC
		mov	ax, [bp+var_8]
		shl	ax, 1
		add	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7E6AC:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_EE+2]
		jnz	short loc_7E6C4
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7E6C4:
		jmp	short loc_7E6E0
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7E6E0
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7E70A

loc_7E6E0:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7E6ED:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7E6FA
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7E6FF

loc_7E6FA:
		mov	ax, 1
		jmp	short loc_7E701

loc_7E6FF:
		xor	ax, ax

loc_7E701:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7E70A
		jmp	loc_7E67E

loc_7E70A:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_E6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_DC+1], 0
		jz	short loc_7E74E
		cmp	[bp+var_E0], 0
		jz	short loc_7E74E
		push	0
		mov	al, byte ptr [bp+var_DC]
		push	ax
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7E74E

loc_7E74E:
		mov	[bp+var_E0], 0
		mov	byte ptr [bp+var_DC+1], 0
		mov	[bp+var_DA], 0
		cmp	byte ptr [bp+var_D2+1], 0
		jz	short loc_7E78D
		cmp	[bp+var_D6], 0
		jz	short loc_7E78D
		push	0
		mov	al, byte ptr [bp+var_D2]
		push	ax
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7E78D

loc_7E78D:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		cmp	byte_4F55C, 0
		jz	short loc_7E7AE
		jmp	loc_8257A

loc_7E7AE:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D0+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_D0], ax
		push	word ptr [bp+var_D0+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D0]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_7E88C
		jmp	loc_7EB68

loc_7E88C:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		push	2
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	word ptr [bp+var_D0]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_7E8F7

loc_7E8E6:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_7E8F7:
		cmp	word ptr [bp+var_DC], 3
		jl	short loc_7E8E6
		jmp	short loc_7E91A

loc_7E900:
		jmp	short loc_7E90D
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7E90D
		jmp	short loc_7E92A

loc_7E90D:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7E91A:
		push	word ptr [bp+var_D0]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_7E900

loc_7E92A:
		push	16h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2], 2
		mov	byte ptr [bp+var_E2+1], 0
		mov	[bp+var_E0], 0
		push	2
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	7
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	word ptr [bp+var_D0]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_7E996

loc_7E985:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_7E996:
		cmp	word ptr [bp+var_DC], 2
		jl	short loc_7E985
		jmp	short loc_7E9B9

loc_7E99F:
		jmp	short loc_7E9AC
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7E9AC
		jmp	short loc_7E9C9

loc_7E9AC:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7E9B9:
		push	word ptr [bp+var_D0]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_7E99F

loc_7E9C9:
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_7E9E2

loc_7E9D1:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_7E9E2:
		cmp	word ptr [bp+var_DC], 2
		jl	short loc_7E9D1
		push	19h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	[bp+var_F0], 0
		mov	byte ptr [bp+var_EE+2], 2
		mov	byte ptr [bp+var_EE+3], 0
		mov	[bp+var_EA], 0
		push	2
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	8
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	word ptr [bp+var_D0]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_7EA55

loc_7EA44:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_7EA55:
		cmp	word ptr [bp+var_DC], 2
		jl	short loc_7EA44
		jmp	short loc_7EA78

loc_7EA5E:
		jmp	short loc_7EA6B
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7EA6B
		jmp	short loc_7EA88

loc_7EA6B:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7EA78:
		push	word ptr [bp+var_D0]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_7EA5E

loc_7EA88:
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_7EAA1

loc_7EA90:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_7EAA1:
		cmp	word ptr [bp+var_DC], 4
		jl	short loc_7EA90
		cmp	byte ptr [bp+var_EE+3], 0
		jz	short loc_7EAD0
		cmp	[bp+var_F0], 0
		jz	short loc_7EAD0
		push	0
		mov	al, byte ptr [bp+var_EE+2]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7EAD0

loc_7EAD0:
		mov	[bp+var_F0], 0
		mov	byte ptr [bp+var_EE+3], 0
		mov	[bp+var_EA], 0
		cmp	byte ptr [bp+var_E2+1], 0
		jz	short loc_7EB0F
		cmp	[bp+var_E6], 0
		jz	short loc_7EB0F
		push	0
		mov	al, byte ptr [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7EB0F

loc_7EB0F:
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2+1], 0
		mov	[bp+var_E0], 0
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_7EB4E
		cmp	[bp+var_DA], 0
		jz	short loc_7EB4E
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7EB4E

loc_7EB4E:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		jmp	loc_7EDF9

loc_7EB68:
		push	0E0h
		push	[bp+var_B30]
		mov	bx, [bp+var_B30]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 23h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7EC22

loc_7EB9B:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7EBC7
		mov	ax, [bp+var_8]
		shl	ax, 2
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7EBC7:
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7EBE1
		push	27CBh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_7EBE1:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7EBF9
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7EBF9:
		jmp	short loc_7EC15
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7EC15
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7EC3F

loc_7EC15:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7EC22:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7EC2F
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7EC34

loc_7EC2F:
		mov	ax, 1
		jmp	short loc_7EC36

loc_7EC34:
		xor	ax, ax

loc_7EC36:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7EC3F
		jmp	loc_7EB9B

loc_7EC3F:
		mov	[bp+var_4], 2Eh
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7ED01

loc_7EC5F:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7EC8D
		mov	ax, [bp+var_8]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7EC8D:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7ECA7
		push	27D4h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_7ECA7:
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7ECC0
		push	16h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7ECC0:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7ECD8
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7ECD8:
		jmp	short loc_7ECF4
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7ECF4
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7ED1E

loc_7ECF4:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7ED01:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7ED0E
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7ED13

loc_7ED0E:
		mov	ax, 1
		jmp	short loc_7ED15

loc_7ED13:
		xor	ax, ax

loc_7ED15:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7ED1E
		jmp	loc_7EC5F

loc_7ED1E:
		mov	[bp+var_4], 3Ch
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7EDDC

loc_7ED3E:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7ED6A
		mov	ax, [bp+var_8]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7ED6A:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7ED82
		push	27ECh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_7ED82:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7ED9A
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7ED9A:
		mov	ax, di
		add	ax, 0FFF1h
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7EDB3
		push	19h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7EDB3:
		jmp	short loc_7EDCF
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7EDCF
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7EDF9

loc_7EDCF:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7EDDC:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7EDE9
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7EDEE

loc_7EDE9:
		mov	ax, 1
		jmp	short loc_7EDF0

loc_7EDEE:
		xor	ax, ax

loc_7EDF0:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7EDF9
		jmp	loc_7ED3E

loc_7EDF9:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_7EE12
		jmp	loc_8257A

loc_7EE12:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D0+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_D0], ax
		push	word ptr [bp+var_D0+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D0]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_7EEF0
		jmp	loc_7F061

loc_7EEF0:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		push	2
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	word ptr [bp+var_D0]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_7EF5B

loc_7EF4A:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_7EF5B:
		cmp	word ptr [bp+var_DC], 3
		jl	short loc_7EF4A
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_7EFDE

loc_7EF6A:
		cmp	word ptr [bp+var_DC], 0Ah
		jnz	short loc_7EF7F
		push	10h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7EF7F:
		cmp	word ptr [bp+var_DC], 0Dh
		jnz	short loc_7EF94
		push	0FFFFh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7EF94:
		cmp	word ptr [bp+var_DC], 17h
		jnz	short loc_7EFA9
		push	15h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7EFA9:
		mov	ax, word ptr [bp+var_DC]
		inc	word ptr [bp+var_DC]
		cmp	ax, 1Ah
		jnz	short loc_7EFC4
		push	0FFFFh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7EFC4:
		jmp	short loc_7EFD1
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7EFD1
		jmp	short loc_7EFF1

loc_7EFD1:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7EFDE:
		push	word ptr [bp+var_D0]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_7EFF1
		jmp	loc_7EF6A

loc_7EFF1:
		push	1Bh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_7F018

loc_7F007:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_7F018:
		cmp	word ptr [bp+var_DC], 6
		jl	short loc_7F007
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_7F047
		cmp	[bp+var_DA], 0
		jz	short loc_7F047
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7F047

loc_7F047:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		jmp	loc_7F33B

loc_7F061:
		push	0B7h
		push	[bp+var_B30]
		mov	bx, [bp+var_B30]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 28h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7F151

loc_7F094:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F0C2
		mov	ax, [bp+var_8]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7F0C2:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F0DC
		push	2808h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_7F0DC:
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F0F5
		push	10h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7F0F5:
		mov	ax, si
		add	ax, 0Dh
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F10E
		push	0FFFFh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7F10E:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F128
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7F128:
		jmp	short loc_7F144
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7F144
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7F16E

loc_7F144:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7F151:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7F15E
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7F163

loc_7F15E:
		mov	ax, 1
		jmp	short loc_7F165

loc_7F163:
		xor	ax, ax

loc_7F165:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7F16E
		jmp	loc_7F094

loc_7F16E:
		mov	[bp+var_4], 1Eh
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7F243

loc_7F18E:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F1B8
		mov	ax, [bp+var_8]
		shl	ax, 3
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7F1B8:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F1D0
		push	2814h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_7F1D0:
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F1E9
		push	15h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7F1E9:
		mov	ax, si
		add	ax, 0Dh
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F202
		push	0FFFFh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7F202:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F21A
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7F21A:
		jmp	short loc_7F236
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7F236
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7F260

loc_7F236:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7F243:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7F250
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7F255

loc_7F250:
		mov	ax, 1
		jmp	short loc_7F257

loc_7F255:
		xor	ax, ax

loc_7F257:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7F260
		jmp	loc_7F18E

loc_7F260:
		mov	[bp+var_4], 32h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7F31E

loc_7F280:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F2AC
		mov	ax, [bp+var_8]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7F2AC:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F2C4
		push	281Eh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_7F2C4:
		mov	ax, di
		add	ax, 0FFFAh
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F2DD
		push	1Bh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7F2DD:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7F2F5
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7F2F5:
		jmp	short loc_7F311
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7F311
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7F33B

loc_7F311:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7F31E:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7F32B
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7F330

loc_7F32B:
		mov	ax, 1
		jmp	short loc_7F332

loc_7F330:
		xor	ax, ax

loc_7F332:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7F33B
		jmp	loc_7F280

loc_7F33B:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_7F354
		jmp	loc_8257A

loc_7F354:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2], 2
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		push	3
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E0], 0
		mov	byte ptr [bp+var_DC], 2
		mov	byte ptr [bp+var_DC+1], 0
		mov	[bp+var_DA], 0
		push	2
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	11h
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_E4+1], 0
		lea	ax, word ptr [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0
		call	Layer_ConstructAtOrigin_33EE1
		add	sp, 4
		mov	word ptr [bp+var_EA+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_EA], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_EE+2], ax
		push	word ptr [bp+var_EA]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_EE+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	17h
		push	word ptr [bp+var_EE+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_7F4CF
		jmp	loc_7F668

loc_7F4CF:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_F6], 0
		mov	byte ptr [bp+var_F4+2], 2
		mov	byte ptr [bp+var_F4+3], 0
		mov	[bp+var_F0], 0
		push	2
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	9
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	word ptr [bp+var_EE+2]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_FA+2], 0
		jmp	short loc_7F53A

loc_7F529:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_FA+2]

loc_7F53A:
		cmp	word ptr [bp+var_FA+2], 3
		jl	short loc_7F529
		jmp	short loc_7F55D

loc_7F543:
		jmp	short loc_7F550
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7F550
		jmp	short loc_7F56D

loc_7F550:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7F55D:
		push	word ptr [bp+var_EE+2]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_7F543

loc_7F56D:
		push	13h
		push	word ptr [bp+var_EE+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	word ptr [bp+var_FA+2], 0
		jmp	short loc_7F594

loc_7F583:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_FA+2]

loc_7F594:
		cmp	word ptr [bp+var_FA+2], 6
		jl	short loc_7F583
		push	word ptr [bp+var_EA+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_E6]
		mov	al, byte ptr [bp+var_E4]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	word ptr [bp+var_B4A+1], 0
		jmp	short loc_7F60B

loc_7F5F1:
		jmp	short loc_7F5FE
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7F5FE
		jmp	short loc_7F626

loc_7F5FE:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7F60B:
		cmp	word ptr [bp+var_B4A+1], 0Ch
		jnb	short loc_7F619
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7F61E

loc_7F619:
		mov	ax, 1
		jmp	short loc_7F620

loc_7F61E:
		xor	ax, ax

loc_7F620:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7F5F1

loc_7F626:
		cmp	byte ptr [bp+var_F4+3], 0
		jz	short loc_7F64E
		cmp	[bp+var_F6], 0
		jz	short loc_7F64E
		push	0
		mov	al, byte ptr [bp+var_F4+2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7F64E

loc_7F64E:
		mov	[bp+var_F6], 0
		mov	byte ptr [bp+var_F4+3], 0
		mov	[bp+var_F0], 0
		jmp	loc_7F844

loc_7F668:
		push	0E0h
		push	[bp+var_B30]
		mov	bx, [bp+var_B30]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 17h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	short loc_7F715

loc_7F69A:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_EE], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_EE]
		jnz	short loc_7F6C8
		mov	ax, [bp+var_8]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7F6C8:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_EE]
		jnz	short loc_7F6E2
		push	282Fh
		push	word ptr [bp+var_EE+2]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_7F6E2:
		mov	ax, si
		add	ax, 7
		cmp	ax, word ptr [bp+var_EE]
		jnz	short loc_7F6FB
		push	13h
		push	word ptr [bp+var_EE+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7F6FB:
		jmp	short loc_7F708
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7F708
		jmp	short loc_7F732

loc_7F708:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7F715:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7F722
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7F727

loc_7F722:
		mov	ax, 1
		jmp	short loc_7F729

loc_7F727:
		xor	ax, ax

loc_7F729:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7F732
		jmp	loc_7F69A

loc_7F732:
		push	word ptr [bp+var_EA+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_E6]
		mov	al, byte ptr [bp+var_E4]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	50h
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_4], 14h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	short loc_7F827

loc_7F7BD:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_EE], ax
		cmp	word ptr [bp+var_EE], si
		jnz	short loc_7F7E6
		mov	ax, [bp+var_8]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7F7E6:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_EE]
		jnz	short loc_7F7FE
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7F7FE:
		jmp	short loc_7F81A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7F81A
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7F844

loc_7F81A:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7F827:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7F834
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7F839

loc_7F834:
		mov	ax, 1
		jmp	short loc_7F83B

loc_7F839:
		xor	ax, ax

loc_7F83B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7F844
		jmp	loc_7F7BD

loc_7F844:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_E6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_DC+1], 0
		jz	short loc_7F888
		cmp	[bp+var_E0], 0
		jz	short loc_7F888
		push	0
		mov	al, byte ptr [bp+var_DC]
		push	ax
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7F888

loc_7F888:
		mov	[bp+var_E0], 0
		mov	byte ptr [bp+var_DC+1], 0
		mov	[bp+var_DA], 0
		cmp	byte ptr [bp+var_D2+1], 0
		jz	short loc_7F8C7
		cmp	[bp+var_D6], 0
		jz	short loc_7F8C7
		push	0
		mov	al, byte ptr [bp+var_D2]
		push	ax
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7F8C7

loc_7F8C7:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		cmp	byte_4F55C, 0
		jz	short loc_7F8E8
		jmp	loc_8257A

loc_7F8E8:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D0+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_D0], ax
		push	1Bh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	word ptr [bp+var_D0+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D0]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_7F9D4
		jmp	loc_7FB38

loc_7F9D4:
		mov	word ptr [bp+var_B4A+1], 0
		jmp	short loc_7FA1B

loc_7F9DC:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		cmp	word ptr [bp+var_D2], 2
		jnz	short loc_7F9F9
		push	15h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7F9F9:
		cmp	word ptr [bp+var_D2], 0Bh
		jnz	short loc_7FA0E
		push	0FFFFh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7FA0E:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7FA1B:
		cmp	word ptr [bp+var_B4A+1], 0Ch
		jnb	short loc_7FA29
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7FA2E

loc_7FA29:
		mov	ax, 1
		jmp	short loc_7FA30

loc_7FA2E:
		xor	ax, ax

loc_7FA30:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7F9DC
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		push	2
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	1
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	word ptr [bp+var_D0]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_7FA94

loc_7FA83:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_7FA94:
		cmp	word ptr [bp+var_DC], 3
		jl	short loc_7FA83
		jmp	short loc_7FAC6

loc_7FA9D:
		jmp	short loc_7FAB9
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7FAB9
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7FAD6

loc_7FAB9:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7FAC6:
		push	word ptr [bp+var_D0]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_7FA9D

loc_7FAD6:
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_7FAEF

loc_7FADE:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_7FAEF:
		cmp	word ptr [bp+var_DC], 6
		jl	short loc_7FADE
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_7FB1E
		cmp	[bp+var_DA], 0
		jz	short loc_7FB1E
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7FB1E

loc_7FB1E:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		jmp	loc_7FE17

loc_7FB38:
		push	0B7h
		push	[bp+var_B30]
		mov	bx, [bp+var_B30]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_7FB8C

loc_7FB4D:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		cmp	word ptr [bp+var_D2], 2
		jnz	short loc_7FB6A
		push	15h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7FB6A:
		cmp	word ptr [bp+var_D2], 0Bh
		jnz	short loc_7FB7F
		push	0FFFFh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_7FB7F:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7FB8C:
		cmp	word ptr [bp+var_B4A+1], 0Ch
		jnb	short loc_7FB9A
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7FB9F

loc_7FB9A:
		mov	ax, 1
		jmp	short loc_7FBA1

loc_7FB9F:
		xor	ax, ax

loc_7FBA1:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7FB4D
		mov	[bp+var_4], 2Ch
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7FC4C

loc_7FBC7:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7FBF3
		mov	ax, [bp+var_8]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7FBF3:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7FC0B
		push	2839h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_7FC0B:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7FC23
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7FC23:
		jmp	short loc_7FC3F
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7FC3F
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7FC69

loc_7FC3F:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7FC4C:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7FC59
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7FC5E

loc_7FC59:
		mov	ax, 1
		jmp	short loc_7FC60

loc_7FC5E:
		xor	ax, ax

loc_7FC60:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7FC69
		jmp	loc_7FBC7

loc_7FC69:
		mov	[bp+var_4], 19h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7FD0E

loc_7FC89:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7FCB5
		mov	ax, [bp+var_8]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7FCB5:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7FCCD
		push	2848h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_7FCCD:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7FCE5
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7FCE5:
		jmp	short loc_7FD01
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7FD01
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7FD2B

loc_7FD01:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7FD0E:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7FD1B
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7FD20

loc_7FD1B:
		mov	ax, 1
		jmp	short loc_7FD22

loc_7FD20:
		xor	ax, ax

loc_7FD22:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7FD2B
		jmp	loc_7FC89

loc_7FD2B:
		mov	[bp+var_4], 14h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7FDD0

loc_7FD4B:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7FD77
		mov	ax, [bp+var_8]
		mov	dx, 0Dh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_7FD77:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7FD8F
		push	2854h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_7FD8F:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_7FDA7
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_7FDA7:
		jmp	short loc_7FDC3
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7FDC3
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_7FDED

loc_7FDC3:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7FDD0:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_7FDDD
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7FDE2

loc_7FDDD:
		mov	ax, 1
		jmp	short loc_7FDE4

loc_7FDE2:
		xor	ax, ax

loc_7FDE4:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7FDED
		jmp	loc_7FD4B

loc_7FDED:
		jmp	short loc_7FDFC

loc_7FDEF:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7FDFC:
		cmp	word ptr [bp+var_B4A+1], 8
		jnb	short loc_7FE0A
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_7FE0F

loc_7FE0A:
		mov	ax, 1
		jmp	short loc_7FE11

loc_7FE0F:
		xor	ax, ax

loc_7FE11:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7FDEF

loc_7FE17:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_7FE30
		jmp	loc_8257A

loc_7FE30:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D0+2], ax
		push	0
		push	0
		push	0C8h
		push	0
		push	11h
		push	2Ch
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_DBA8
		add	sp, 10h
		mov	word ptr [bp+var_D0], ax
		push	0
		push	0
		push	0A0h
		push	0
		push	23h
		push	32h
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_DBA8
		add	sp, 10h
		mov	word ptr [bp+var_D2], ax
		push	2
		push	0
		push	0A0h
		push	0
		push	23h
		push	32h
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_DBA8
		add	sp, 10h
		mov	word ptr [bp+var_D4], ax
		push	word ptr [bp+var_D0+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D0]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D4]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_A6]
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_7FF44
		jmp	loc_8016B

loc_7FF44:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_DE], 0
		mov	byte ptr [bp+var_DA], 2
		mov	byte ptr [bp+var_DA+1], 0
		mov	[bp+var_D8], 0
		push	2
		lea	ax, word ptr [bp+var_DE]
		push	ax
		push	2
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_DE]
		push	ax
		lea	ax, [bp+var_B0A]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		mov	word ptr [bp+var_E0], 0
		jmp	short loc_7FFAE

loc_7FF9D:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_E0]

loc_7FFAE:
		cmp	word ptr [bp+var_E0], 4
		jl	short loc_7FF9D
		push	0FFFFh
		lea	ax, [bp+var_B0A]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		mov	word ptr [bp+var_E0], 0
		jmp	short loc_8000C

loc_7FFCC:
		cmp	word ptr [bp+var_E0], 8
		jnz	short loc_7FFDC
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 2

loc_7FFDC:
		mov	ax, word ptr [bp+var_E0]
		inc	word ptr [bp+var_E0]
		cmp	ax, 0Ch
		jnz	short loc_7FFF2
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 3

loc_7FFF2:
		jmp	short loc_7FFFF
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_7FFFF
		jmp	short loc_8001D

loc_7FFFF:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8000C:
		lea	ax, [bp+var_B0A]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_7FFCC

loc_8001D:
		mov	word ptr [bp+var_E0], 0
		jmp	short loc_80036

loc_80025:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_E0]

loc_80036:
		cmp	word ptr [bp+var_E0], 4
		jl	short loc_80025
		mov	[bp+var_EA], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1], 0
		mov	[bp+var_E4], 0
		push	2
		lea	ax, word ptr [bp+var_EA]
		push	ax
		push	0Ah
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_EA]
		push	ax
		lea	ax, [bp+var_B0A]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_B0A]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_800AC

loc_80092:
		jmp	short loc_8009F
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8009F
		jmp	short loc_800BD

loc_8009F:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_800AC:
		lea	ax, [bp+var_B0A]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_80092

loc_800BD:
		mov	word ptr [bp+var_E0], 0
		jmp	short loc_800D6

loc_800C5:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_E0]

loc_800D6:
		cmp	word ptr [bp+var_E0], 2
		jl	short loc_800C5
		lea	ax, [bp+var_B0A]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_E6+1], 0
		jz	short loc_80112
		cmp	[bp+var_EA], 0
		jz	short loc_80112
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, word ptr [bp+var_EA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_80112

loc_80112:
		mov	[bp+var_EA], 0
		mov	byte ptr [bp+var_E6+1], 0
		mov	[bp+var_E4], 0
		cmp	byte ptr [bp+var_DA+1], 0
		jz	short loc_80151
		cmp	[bp+var_DE], 0
		jz	short loc_80151
		push	0
		mov	al, byte ptr [bp+var_DA]
		push	ax
		lea	ax, word ptr [bp+var_DE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_80151

loc_80151:
		mov	[bp+var_DE], 0
		mov	byte ptr [bp+var_DA+1], 0
		mov	[bp+var_D8], 0
		jmp	loc_80784

loc_8016B:
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	27h
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_4], 2Ch
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_80242

loc_801A9:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D6], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_801D7
		mov	ax, [bp+var_8]
		mov	dx, 0Eh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_801D7:
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_801EB
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 2

loc_801EB:
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_801FF
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 3

loc_801FF:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_80219
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_80219:
		jmp	short loc_80235
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_80235
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8025F

loc_80235:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_80242:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_8024F
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_80254

loc_8024F:
		mov	ax, 1
		jmp	short loc_80256

loc_80254:
		xor	ax, ax

loc_80256:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8025F
		jmp	loc_801A9

loc_8025F:
		mov	[bp+var_4], 1Eh
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_80316

loc_8027F:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D6], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_802AB
		mov	ax, [bp+var_8]
		mov	dx, 0Fh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_802AB:
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_802BF
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 2

loc_802BF:
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_802D3
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 3

loc_802D3:
		mov	ax, di
		add	ax, 0FFFBh
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_802ED
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_802ED:
		jmp	short loc_80309
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_80309
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_80333

loc_80309:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_80316:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_80323
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_80328

loc_80323:
		mov	ax, 1
		jmp	short loc_8032A

loc_80328:
		xor	ax, ax

loc_8032A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_80333
		jmp	loc_8027F

loc_80333:
		mov	[bp+var_4], 39h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_80410

loc_80353:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D6], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_8037D
		mov	ax, [bp+var_8]
		shl	ax, 4
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8037D:
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_80391
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 4

loc_80391:
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_803A5
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 3

loc_803A5:
		mov	ax, si
		add	ax, 1Ch
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_803B9
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 2

loc_803B9:
		mov	ax, si
		add	ax, 22h
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_803CD
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 4

loc_803CD:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_803E7
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_803E7:
		jmp	short loc_80403
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_80403
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8042D

loc_80403:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_80410:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_8041D
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_80422

loc_8041D:
		mov	ax, 1
		jmp	short loc_80424

loc_80422:
		xor	ax, ax

loc_80424:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8042D
		jmp	loc_80353

loc_8042D:
		mov	[bp+var_4], 28h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_804E4

loc_8044D:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D6], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_80479
		mov	ax, [bp+var_8]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_80479:
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_8048D
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 2

loc_8048D:
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_804A1
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 3

loc_804A1:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_804BB
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_804BB:
		jmp	short loc_804D7
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_804D7
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_80501

loc_804D7:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_804E4:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_804F1
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_804F6

loc_804F1:
		mov	ax, 1
		jmp	short loc_804F8

loc_804F6:
		xor	ax, ax

loc_804F8:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_80501
		jmp	loc_8044D

loc_80501:
		mov	[bp+var_4], 19h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_805B8

loc_80521:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D6], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_8054D
		mov	ax, [bp+var_8]
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8054D:
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_80561
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 4

loc_80561:
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_80575
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 2

loc_80575:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_8058F
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8058F:
		jmp	short loc_805AB
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_805AB
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_805D5

loc_805AB:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_805B8:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_805C5
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_805CA

loc_805C5:
		mov	ax, 1
		jmp	short loc_805CC

loc_805CA:
		xor	ax, ax

loc_805CC:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_805D5
		jmp	loc_80521

loc_805D5:
		mov	[bp+var_4], 12h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	short loc_80601

loc_805F4:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_80601:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_8060E
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_80613

loc_8060E:
		mov	ax, 1
		jmp	short loc_80615

loc_80613:
		xor	ax, ax

loc_80615:
		mov	ah, 0
		or	ax, ax
		jz	short loc_805F4
		push	0Eh
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_4], 41h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	short loc_806BA

loc_80649:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D6], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_80677
		mov	ax, [bp+var_8]
		mov	dx, 13h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_80677:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_80691
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_80691:
		jmp	short loc_806AD
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_806AD
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_806D7

loc_806AD:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_806BA:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_806C7
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_806CC

loc_806C7:
		mov	ax, 1
		jmp	short loc_806CE

loc_806CC:
		xor	ax, ax

loc_806CE:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_806D7
		jmp	loc_80649

loc_806D7:
		mov	[bp+var_4], 2Dh
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	short loc_80767

loc_806F6:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D6], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_80724
		mov	ax, [bp+var_8]
		mov	dx, 14h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_80724:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_D6]
		jnz	short loc_8073E
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8073E:
		jmp	short loc_8075A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8075A
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_80784

loc_8075A:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_80767:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_80774
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_80779

loc_80774:
		mov	ax, 1
		jmp	short loc_8077B

loc_80779:
		xor	ax, ax

loc_8077B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_80784
		jmp	loc_806F6

loc_80784:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8079D
		jmp	loc_8257A

loc_8079D:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D0+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_D0], ax
		push	word ptr [bp+var_D0+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D0]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_8087B
		jmp	loc_8097B

loc_8087B:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		push	2
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0Bh
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	word ptr [bp+var_D0]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_808E6

loc_808D5:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_808E6:
		cmp	word ptr [bp+var_DC], 2
		jl	short loc_808D5
		jmp	short loc_80909

loc_808EF:
		jmp	short loc_808FC
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_808FC
		jmp	short loc_80919

loc_808FC:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_80909:
		push	word ptr [bp+var_D0]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_808EF

loc_80919:
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_80932

loc_80921:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_80932:
		cmp	word ptr [bp+var_DC], 3
		jl	short loc_80921
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_80961
		cmp	[bp+var_DA], 0
		jz	short loc_80961
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_80961

loc_80961:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		jmp	loc_80A54

loc_8097B:
		push	0E0h
		push	[bp+var_B30]
		mov	bx, [bp+var_B30]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 55h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_80A37

loc_809AE:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_809DC
		mov	ax, [bp+var_8]
		mov	dx, 15h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_809DC:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_809F6
		push	285Bh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_809F6:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_80A0E
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_80A0E:
		jmp	short loc_80A2A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_80A2A
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_80A54

loc_80A2A:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_80A37:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_80A44
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_80A49

loc_80A44:
		mov	ax, 1
		jmp	short loc_80A4B

loc_80A49:
		xor	ax, ax

loc_80A4B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_80A54
		jmp	loc_809AE

loc_80A54:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_80A6D
		jmp	loc_8257A

loc_80A6D:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D0+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_D0], ax
		push	word ptr [bp+var_D0+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D0]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_80B4B
		jmp	loc_80C8B

loc_80B4B:
		mov	word ptr [bp+var_B4A+1], 0
		jmp	short loc_80B60

loc_80B53:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_80B60:
		cmp	word ptr [bp+var_B4A+1], 4
		jnb	short loc_80B6E
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_80B73

loc_80B6E:
		mov	ax, 1
		jmp	short loc_80B75

loc_80B73:
		xor	ax, ax

loc_80B75:
		mov	ah, 0
		or	ax, ax
		jz	short loc_80B53
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		push	2
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	3
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	word ptr [bp+var_D0]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_80BD9

loc_80BC8:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_80BD9:
		cmp	word ptr [bp+var_DC], 3
		jl	short loc_80BC8
		jmp	short loc_80C0B

loc_80BE2:
		jmp	short loc_80BFE
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_80BFE
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_80C1B

loc_80BFE:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_80C0B:
		push	word ptr [bp+var_D0]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_80BE2

loc_80C1B:
		push	1Bh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_80C42

loc_80C31:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_80C42:
		cmp	word ptr [bp+var_DC], 6
		jl	short loc_80C31
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_80C71
		cmp	[bp+var_DA], 0
		jz	short loc_80C71
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_80C71

loc_80C71:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		jmp	loc_80D98

loc_80C8B:
		push	0B7h
		push	[bp+var_B30]
		mov	bx, [bp+var_B30]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 54h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_80D7B

loc_80CBE:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_80CEC
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_80CEC:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_80D06
		push	2880h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_80D06:
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_80D1F
		push	0FFFFh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_80D1F:
		mov	ax, di
		add	ax, 0FFF8h
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_80D38
		push	1Bh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_80D38:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_80D52
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_80D52:
		jmp	short loc_80D6E
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_80D6E
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_80D98

loc_80D6E:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_80D7B:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_80D88
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_80D8D

loc_80D88:
		mov	ax, 1
		jmp	short loc_80D8F

loc_80D8D:
		xor	ax, ax

loc_80D8F:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_80D98
		jmp	loc_80CBE

loc_80D98:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_80DB1
		jmp	loc_8257A

loc_80DB1:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D0+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_D0], ax
		push	word ptr [bp+var_D0+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D0]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_80E8F
		jmp	loc_80F8F

loc_80E8F:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		push	2
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0Ch
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	word ptr [bp+var_D0]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_80EFA

loc_80EE9:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_80EFA:
		cmp	word ptr [bp+var_DC], 2
		jl	short loc_80EE9
		jmp	short loc_80F1D

loc_80F03:
		jmp	short loc_80F10
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_80F10
		jmp	short loc_80F2D

loc_80F10:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_80F1D:
		push	word ptr [bp+var_D0]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_80F03

loc_80F2D:
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_80F46

loc_80F35:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_80F46:
		cmp	word ptr [bp+var_DC], 3
		jl	short loc_80F35
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_80F75
		cmp	[bp+var_DA], 0
		jz	short loc_80F75
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_80F75

loc_80F75:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		jmp	loc_8106A

loc_80F8F:
		push	0E0h
		push	[bp+var_B30]
		mov	bx, [bp+var_B30]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 42h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_8104D

loc_80FC2:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_80FF0
		mov	ax, [bp+var_8]
		mov	dx, 18h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_80FF0:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_8100A
		push	289Dh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_8100A:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_81024
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_81024:
		jmp	short loc_81040
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_81040
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8106A

loc_81040:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8104D:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_8105A
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_8105F

loc_8105A:
		mov	ax, 1
		jmp	short loc_81061

loc_8105F:
		xor	ax, ax

loc_81061:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8106A
		jmp	loc_80FC2

loc_8106A:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_81083
		jmp	loc_8257A

loc_81083:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D0+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_D0], ax
		push	word ptr [bp+var_D0+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D0]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_81161
		jmp	loc_8127E

loc_81161:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		push	2
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	4
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	word ptr [bp+var_D0]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_811CC

loc_811BB:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_811CC:
		cmp	word ptr [bp+var_DC], 3
		jl	short loc_811BB
		jmp	short loc_811FE

loc_811D5:
		jmp	short loc_811F1
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_811F1
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_8120E

loc_811F1:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_811FE:
		push	word ptr [bp+var_D0]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_811D5

loc_8120E:
		push	1Ch
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_81235

loc_81224:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_81235:
		cmp	word ptr [bp+var_DC], 6
		jl	short loc_81224
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_81264
		cmp	[bp+var_DA], 0
		jz	short loc_81264
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_81264

loc_81264:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		jmp	loc_81434

loc_8127E:
		push	0B7h
		push	[bp+var_B30]
		mov	bx, [bp+var_B30]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 35h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_8133A

loc_812B1:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_812DF
		mov	ax, [bp+var_8]
		mov	dx, 19h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_812DF:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_812F9
		push	28BDh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_812F9:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_81311
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_81311:
		jmp	short loc_8132D
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8132D
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_81357

loc_8132D:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8133A:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_81347
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_8134C

loc_81347:
		mov	ax, 1
		jmp	short loc_8134E

loc_8134C:
		xor	ax, ax

loc_8134E:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_81357
		jmp	loc_812B1

loc_81357:
		mov	[bp+var_4], 2Ah
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_81417

loc_81377:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_813A3
		mov	ax, [bp+var_8]
		mov	dx, 1Ah
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_813A3:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_813BB
		push	28CFh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_813BB:
		mov	ax, di
		add	ax, 0FFF8h
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_813D4
		push	1Ch
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_813D4:
		mov	ax, di
		add	ax, 0FFF8h
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_813EE
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_813EE:
		jmp	short loc_8140A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8140A
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_81434

loc_8140A:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_81417:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_81424
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_81429

loc_81424:
		mov	ax, 1
		jmp	short loc_8142B

loc_81429:
		xor	ax, ax

loc_8142B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_81434
		jmp	loc_81377

loc_81434:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8144D
		jmp	loc_8257A

loc_8144D:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D0+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_D0], ax
		push	word ptr [bp+var_D0+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D0]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_8152B
		jmp	loc_81639

loc_8152B:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		push	2
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	0Dh
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	word ptr [bp+var_D0]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_81596

loc_81585:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_81596:
		cmp	word ptr [bp+var_DC], 2
		jl	short loc_81585
		jmp	short loc_815B9

loc_8159F:
		jmp	short loc_815AC
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_815AC
		jmp	short loc_815C9

loc_815AC:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_815B9:
		push	word ptr [bp+var_D0]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_8159F

loc_815C9:
		push	21h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	word ptr [bp+var_DC], 0
		jmp	short loc_815F0

loc_815DF:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_DC]

loc_815F0:
		cmp	word ptr [bp+var_DC], 3
		jl	short loc_815DF
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_8161F
		cmp	[bp+var_DA], 0
		jz	short loc_8161F
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8161F

loc_8161F:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		jmp	loc_817E4

loc_81639:
		push	0E0h
		push	[bp+var_B30]
		mov	bx, [bp+var_B30]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 13h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_816F5

loc_8166C:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_8169A
		mov	ax, [bp+var_8]
		mov	dx, 1Bh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8169A:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_816B4
		push	28DAh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_816B4:
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_816CC
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_816CC:
		jmp	short loc_816E8
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_816E8
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_81712

loc_816E8:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_816F5:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_81702
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_81707

loc_81702:
		mov	ax, 1
		jmp	short loc_81709

loc_81707:
		xor	ax, ax

loc_81709:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_81712
		jmp	loc_8166C

loc_81712:
		push	21h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	[bp+var_4], 15h
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_817C7

loc_81740:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_8176C
		mov	ax, [bp+var_8]
		mov	dx, 1Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B44]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_8176C:
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_81784
		push	28DFh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_81784:
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_D2]
		jnz	short loc_8179E
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_8179E:
		jmp	short loc_817BA
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_817BA
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_817E4

loc_817BA:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_817C7:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_817D4
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_817D9

loc_817D4:
		mov	ax, 1
		jmp	short loc_817DB

loc_817D9:
		xor	ax, ax

loc_817DB:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_817E4
		jmp	loc_81740

loc_817E4:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_817FD
		jmp	loc_8257A

loc_817FD:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2], 2
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		push	3
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0Ch
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_E0], 0
		mov	byte ptr [bp+var_DC], 2
		mov	byte ptr [bp+var_DC+1], 0
		mov	[bp+var_DA], 0
		push	3
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	0Ah
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_EA], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1], 0
		mov	[bp+var_E4], 0
		push	3
		lea	ax, word ptr [bp+var_EA]
		push	ax
		push	0Bh
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_F4], 0
		mov	byte ptr [bp+var_F0], 2
		mov	byte ptr [bp+var_F0+1], 0
		mov	[bp+var_EE], 0
		push	2
		lea	ax, word ptr [bp+var_F4]
		push	ax
		push	17h
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_F7], 0
		lea	ax, word ptr [bp+var_F4]
		push	ax
		lea	ax, word ptr [bp+var_FA]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	0
		push	0
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_FC], ax
		push	0
		push	0FFE2h
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_100+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_EA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_100], ax
		push	[bp+var_FC]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_100+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_100]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_FA]
		mov	al, byte ptr [bp+var_FA+2]
		push	ax
		lea	ax, word ptr [bp+var_FA]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0Ah
		push	0
		push	word ptr [bp+var_100+2]
		mov	bx, word ptr [bp+var_100+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_81A2D

loc_819BF:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	[bp+var_102], ax
		cmp	[bp+var_102], 3
		jge	short loc_819E2
		push	1
		push	0Ah
		push	word ptr [bp+var_100+2]
		mov	bx, word ptr [bp+var_100+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_819E2:
		cmp	[bp+var_102], 4
		jnz	short loc_819F8
		push	14h
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_819F8:
		cmp	[bp+var_102], 8
		jle	short loc_81A13
		push	0FFFFh
		push	0FFF4h
		push	word ptr [bp+var_100+2]
		mov	bx, word ptr [bp+var_100+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_81A13:
		jmp	short loc_81A20
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_81A20
		jmp	short loc_81A4B

loc_81A20:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_81A2D:
		cmp	word ptr [bp+var_B4A+1], 12h
		jnb	short loc_81A3B
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_81A40

loc_81A3B:
		mov	ax, 1
		jmp	short loc_81A42

loc_81A40:
		xor	ax, ax

loc_81A42:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_81A4B
		jmp	loc_819BF

loc_81A4B:
		lea	ax, word ptr [bp+var_FA]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_F0+1], 0
		jz	short loc_81A80
		cmp	[bp+var_F4], 0
		jz	short loc_81A80
		push	0
		mov	al, byte ptr [bp+var_F0]
		push	ax
		lea	ax, word ptr [bp+var_F4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_81A80

loc_81A80:
		mov	[bp+var_F4], 0
		mov	byte ptr [bp+var_F0+1], 0
		mov	[bp+var_EE], 0
		cmp	byte ptr [bp+var_E6+1], 0
		jz	short loc_81ABF
		cmp	[bp+var_EA], 0
		jz	short loc_81ABF
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, word ptr [bp+var_EA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_81ABF

loc_81ABF:
		mov	[bp+var_EA], 0
		mov	byte ptr [bp+var_E6+1], 0
		mov	[bp+var_E4], 0
		cmp	byte ptr [bp+var_DC+1], 0
		jz	short loc_81AFE
		cmp	[bp+var_E0], 0
		jz	short loc_81AFE
		push	0
		mov	al, byte ptr [bp+var_DC]
		push	ax
		lea	ax, word ptr [bp+var_E0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_81AFE

loc_81AFE:
		mov	[bp+var_E0], 0
		mov	byte ptr [bp+var_DC+1], 0
		mov	[bp+var_DA], 0
		cmp	byte ptr [bp+var_D2+1], 0
		jz	short loc_81B3D
		cmp	[bp+var_D6], 0
		jz	short loc_81B3D
		push	0
		mov	al, byte ptr [bp+var_D2]
		push	ax
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_81B3D

loc_81B3D:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_81B6D
		jmp	loc_8257A

loc_81B6D:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2], 2
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		push	3
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0Dh
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0FFFEh
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D8], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_DA], ax
		push	80h
		push	0A0h
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_DC], ax
		push	word ptr [bp+var_DA]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_DC]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D8]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2], 2
		mov	byte ptr [bp+var_E2+1], 0
		mov	[bp+var_E0], 0
		mov	[bp+var_B70], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_B6E], ax
		lea	ax, [bp+var_B70]
		mov	word_4D392, ax
		mov	[bp+var_B70], 1BCh
		mov	[bp+var_B6C], 0
		mov	[bp+var_B68], 0
		mov	word ptr [bp+var_B76+2], 0
		mov	[bp+var_B72], 0FFFFh
		cmp	[bp+var_B], 0
		jz	short loc_81D14
		push	3
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	2Dh
		lea	ax, [bp+var_2D6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, word ptr [bp+var_B76+2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_E6]
		push	ax
		lea	ax, word ptr [bp+var_B76+2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_81D14:
		push	0Eh
		push	word ptr [bp+var_DC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		jmp	loc_81DF7

loc_81D25:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_EA+2], ax
		cmp	word ptr [bp+var_EA+2], 4
		jnz	short loc_81D7E
		cmp	[bp+var_B], 0
		jz	short loc_81D7E
		mov	ax, word_4EFCE
		mov	word ptr [bp+var_EA], ax
		mov	word ptr [bp+var_EE+2], 0
		cmp	word ptr [bp+var_B76+2], 0
		jz	short loc_81D7E
		push	[bp+var_B72]
		mov	bx, word ptr [bp+var_B76+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_EE+2]
		push	word ptr [bp+var_EA]
		push	[bp+var_B72]
		mov	bx, word ptr [bp+var_B76+2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_81D7E

loc_81D7E:
		cmp	word ptr [bp+var_EA+2], 5
		jnz	short loc_81D8E
		mov	bx, word ptr [bp+var_D8]
		mov	word ptr [bx+1Bh], 1

loc_81D8E:
		cmp	word ptr [bp+var_EA+2], 6
		jnz	short loc_81D9E
		mov	bx, word ptr [bp+var_D8]
		mov	word ptr [bx+1Bh], 0

loc_81D9E:
		cmp	word ptr [bp+var_EA+2], 6
		jnz	short loc_81DB3
		push	0Ch
		push	word ptr [bp+var_DC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_81DB3:
		cmp	word ptr [bp+var_EA+2], 7
		jnz	short loc_81DC8
		push	0FFFFh
		push	word ptr [bp+var_DC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_81DC8:
		cmp	word ptr [bp+var_EA+2], 7
		jnz	short loc_81DDD
		push	0Eh
		push	word ptr [bp+var_DC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_81DDD:
		jmp	short loc_81DEA
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_81DEA
		jmp	short loc_81E15

loc_81DEA:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_81DF7:
		cmp	word ptr [bp+var_B4A+1], 9
		jnb	short loc_81E05
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_81E0A

loc_81E05:
		mov	ax, 1
		jmp	short loc_81E0C

loc_81E0A:
		xor	ax, ax

loc_81E0C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_81E15
		jmp	loc_81D25

loc_81E15:
		lea	ax, word ptr [bp+var_B76+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_E2+1], 0
		jz	short loc_81E59
		cmp	[bp+var_E6], 0
		jz	short loc_81E59
		push	0
		mov	al, byte ptr [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_81E59

loc_81E59:
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2+1], 0
		mov	[bp+var_E0], 0
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_D2+1], 0
		jz	short loc_81EA7
		cmp	[bp+var_D6], 0
		jz	short loc_81EA7
		push	0
		mov	al, byte ptr [bp+var_D2]
		push	ax
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_81EA7

loc_81EA7:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		cmp	byte_4F55C, 0
		jz	short loc_81EC8
		jmp	loc_8257A

loc_81EC8:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D0+2], ax
		push	0
		push	0
		push	0C8h
		push	0
		push	11h
		push	2Ch
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_DBA8
		add	sp, 10h
		mov	word ptr [bp+var_D0], ax
		push	0
		push	0
		push	0A0h
		push	0
		push	23h
		push	32h
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_DBA8
		add	sp, 10h
		mov	word ptr [bp+var_D2], ax
		push	0Dh
		push	0
		push	0A0h
		push	0
		push	23h
		push	32h
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_DBA8
		add	sp, 10h
		mov	word ptr [bp+var_D4], ax
		push	word ptr [bp+var_D0+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D0]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D4]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_A6]
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_DE], 0
		mov	byte ptr [bp+var_DA], 2
		mov	byte ptr [bp+var_DA+1], 0
		mov	[bp+var_D8], 0
		mov	[bp+var_B70], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_B6E], ax
		lea	ax, [bp+var_B70]
		mov	word_4D392, ax
		mov	[bp+var_B70], 1BCh
		mov	[bp+var_B6C], 0
		mov	[bp+var_B68], 0
		mov	word ptr [bp+var_B76+2], 0
		mov	[bp+var_B72], 0FFFFh
		cmp	[bp+var_B], 0
		jz	short loc_82064
		push	3
		lea	ax, word ptr [bp+var_DE]
		push	ax
		push	5Ah
		lea	ax, [bp+var_2D6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, word ptr [bp+var_B76+2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_B76+2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_82064:
		push	0
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	27h
		lea	ax, [bp+var_B44]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	word ptr [bp+var_E0], 0Dh
		mov	bx, word ptr [bp+var_D4]
		mov	word ptr [bx+1Bh], 0
		jmp	loc_8214C

loc_82094:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_E2], ax
		cmp	word ptr [bp+var_E2], 1Dh
		jnz	short loc_820ED
		cmp	[bp+var_B], 0
		jz	short loc_820ED
		mov	ax, word_4F028
		mov	word ptr [bp+var_E4], ax
		mov	word ptr [bp+var_E6], 0
		cmp	word ptr [bp+var_B76+2], 0
		jz	short loc_820ED
		push	[bp+var_B72]
		mov	bx, word ptr [bp+var_B76+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_E6]
		push	word ptr [bp+var_E4]
		push	[bp+var_B72]
		mov	bx, word ptr [bp+var_B76+2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_820ED

loc_820ED:
		cmp	word ptr [bp+var_E2], 0
		jle	short loc_82112
		cmp	word ptr [bp+var_E2], 2Ch
		jge	short loc_82112
		mov	ax, word ptr [bp+var_E0]
		mov	word ptr [bp+var_EA+2], ax
		inc	word ptr [bp+var_E0]
		mov	bx, word ptr [bp+var_D4]
		mov	ax, word ptr [bp+var_EA+2]
		mov	[bx+1Bh], ax

loc_82112:
		cmp	word ptr [bp+var_E2], 20h
		jnz	short loc_82122
		mov	bx, word ptr [bp+var_D0]
		mov	word ptr [bx+1Bh], 1

loc_82122:
		cmp	word ptr [bp+var_E2], 22h
		jnz	short loc_82132
		mov	bx, word ptr [bp+var_D0]
		mov	word ptr [bx+1Bh], 2

loc_82132:
		jmp	short loc_8213F
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8213F
		jmp	short loc_8216A

loc_8213F:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8214C:
		cmp	word ptr [bp+var_B4A+1], 39h
		jnb	short loc_8215A
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_8215F

loc_8215A:
		mov	ax, 1
		jmp	short loc_82161

loc_8215F:
		xor	ax, ax

loc_82161:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8216A
		jmp	loc_82094

loc_8216A:
		lea	ax, word ptr [bp+var_B76+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_DA+1], 0
		jz	short loc_821AE
		cmp	[bp+var_DE], 0
		jz	short loc_821AE
		push	0
		mov	al, byte ptr [bp+var_DA]
		push	ax
		lea	ax, word ptr [bp+var_DE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_821AE

loc_821AE:
		mov	[bp+var_DE], 0
		mov	byte ptr [bp+var_DA+1], 0
		mov	[bp+var_D8], 0
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_821DE
		jmp	loc_8257A

loc_821DE:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D0+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_D0], ax
		push	word ptr [bp+var_D0+2]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_D0]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	1Fh
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	13h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		jmp	short loc_82347

loc_822D1:
		mov	ax, word ptr [bp+var_B4A+1]
		mov	word ptr [bp+var_D2], ax
		cmp	word ptr [bp+var_D2], 2
		jnz	short loc_822EE
		push	0Ch
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_822EE:
		cmp	word ptr [bp+var_D2], 3
		jnz	short loc_82303
		push	13h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_82303:
		cmp	word ptr [bp+var_D2], 0Ch
		jnz	short loc_82318
		push	0Ch
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_82318:
		cmp	word ptr [bp+var_D2], 0Dh
		jnz	short loc_8232D
		push	13h
		push	word ptr [bp+var_D0]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_8232D:
		jmp	short loc_8233A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8233A
		jmp	short loc_82365

loc_8233A:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_82347:
		cmp	word ptr [bp+var_B4A+1], 14h
		jnb	short loc_82355
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_8235A

loc_82355:
		mov	ax, 1
		jmp	short loc_8235C

loc_8235A:
		xor	ax, ax

loc_8235C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_82365
		jmp	loc_822D1

loc_82365:
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jz	short loc_8237E
		jmp	loc_8257A

loc_8237E:
		lea	ax, [bp+var_160]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2], 2
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		push	3
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	10h
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_D8], ax
		mov	[bp+var_E2], 0
		mov	byte ptr [bp+var_DE], 2
		mov	byte ptr [bp+var_DE+1], 0
		mov	[bp+var_DC], 0
		push	2
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	19h
		lea	ax, [bp+var_1E6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_E6+1], 0
		lea	ax, word ptr [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_EA+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_D8]
		lea	ax, [bp+var_B66]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_EA+2]
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, word ptr [bp+var_EA+2]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_4], 1Eh
		mov	si, word ptr [bp+var_B4A+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	short loc_824AF

loc_82495:
		jmp	short loc_824A2
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_824A2
		jmp	short loc_824C9

loc_824A2:
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_824AF:
		cmp	word ptr [bp+var_B4A+1], di
		jnb	short loc_824BC
		cmp	byte ptr [bp+var_B4A+3], 0
		jz	short loc_824C1

loc_824BC:
		mov	ax, 1
		jmp	short loc_824C3

loc_824C1:
		xor	ax, ax

loc_824C3:
		mov	ah, 0
		or	ax, ax
		jz	short loc_82495

loc_824C9:
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		lea	ax, word ptr [bp+var_EA+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_DE+1], 0
		jz	short loc_82515
		cmp	[bp+var_E2], 0
		jz	short loc_82515
		push	0
		mov	al, byte ptr [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_82515

loc_82515:
		mov	[bp+var_E2], 0
		mov	byte ptr [bp+var_DE+1], 0
		mov	[bp+var_DC], 0
		cmp	byte ptr [bp+var_D2+1], 0
		jz	short loc_82554
		cmp	[bp+var_D6], 0
		jz	short loc_82554
		push	0
		mov	al, byte ptr [bp+var_D2]
		push	ax
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_82554

loc_82554:
		mov	[bp+var_D6], 0
		mov	byte ptr [bp+var_D2+1], 0
		mov	[bp+var_D0], 0
		push	0
		lea	ax, [bp+var_B66]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4

loc_8257A:
		lea	ax, [bp+var_B42]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B22]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_BF], 0
		jz	short loc_825BE
		cmp	[bp+var_C4], 0
		jz	short loc_825BE
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_825BE

loc_825BE:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_825FD
		cmp	[bp+var_BA], 0
		jz	short loc_825FD
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_825FD

loc_825FD:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_8263C
		cmp	[bp+var_B0], 0
		jz	short loc_8263C
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8263C

loc_8263C:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_82688
		cmp	[bp+var_A0], 0
		jz	short loc_82688
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_82688

loc_82688:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_826D4
		cmp	[bp+var_90], 0
		jz	short loc_826D4
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_826D4

loc_826D4:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_8271C
		cmp	[bp+var_80], 0
		jz	short loc_8271C
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8271C

loc_8271C:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_82760
		cmp	[bp+var_70], 0
		jz	short loc_82760
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_82760

loc_82760:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_82798
		cmp	[bp+var_66], 0
		jz	short loc_82798
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_82798

loc_82798:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_827D0
		cmp	[bp+var_5C], 0
		jz	short loc_827D0
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_827D0

loc_827D0:
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_82808
		cmp	[bp+var_52], 0
		jz	short loc_82808
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_82808

loc_82808:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_82840
		cmp	[bp+var_48], 0
		jz	short loc_82840
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_82840

loc_82840:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_82878
		cmp	[bp+var_3E], 0
		jz	short loc_82878
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_82878

loc_82878:
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_828B0
		cmp	[bp+var_34], 0
		jz	short loc_828B0
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_828B0

loc_828B0:
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_B0A], 129Fh
		lea	ax, [bp+var_B0A]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_AF5], 0
		jz	short loc_828FF
		cmp	[bp+var_AFA], 0
		jz	short loc_828FF
		push	0
		mov	al, [bp+var_AF6]
		push	ax
		lea	ax, word ptr [bp+var_AFA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_828FF

loc_828FF:
		mov	[bp+var_AFA], 0
		mov	[bp+var_AF5], 0
		mov	[bp+var_AF4], 0
		lea	ax, [bp+var_2E4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_2E0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D6]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_82965
		cmp	[bp+var_26], 0
		jz	short loc_82965
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_82965

loc_82965:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_25E]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E6]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_12]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_16E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_160]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Midgame12_Play_7CCD0		endp

; START OF FUNCTION CHUNK FOR Midgame12_Play_7CCD0
off_829DB	dw offset loc_7CE8E
		dw offset loc_7D011
		dw offset loc_7D011
		dw offset loc_7D011
		dw offset loc_7D011
; END OF FUNCTION CHUNK FOR Midgame12_Play_7CCD0
ovr205		ends
