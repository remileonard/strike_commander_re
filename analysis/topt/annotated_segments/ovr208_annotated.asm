ovr208		segment	para public 'OVERLAY' use16
		assume cs:ovr208
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, cinématique mid16 de Tactical Operations (2026-11-02) : script extrait par
; tools/midgame_extract.py dans analysis/topt/midgames/mid16.md et .json, fichier
; analysis/topt/midgames/iff. Fonction entière lue par exécution symbolique, pas commentée
; ligne à ligne.
; ==============================================================================================
Midgame16_Play_8E910		proc far

var_C58		= word ptr -0C58h
var_C56		= word ptr -0C56h
var_C54		= word ptr -0C54h
var_C52		= word ptr -0C52h
var_C48		= word ptr -0C48h
var_C18		= word ptr -0C18h
var_BEB		= dword ptr -0BEBh
var_BE7		= dword ptr -0BE7h
var_BE3		= dword ptr -0BE3h
var_BD6		= word ptr -0BD6h
var_BD2		= dword ptr -0BD2h
var_BCE		= word ptr -0BCEh
var_BCC		= word ptr -0BCCh
var_BCA		= word ptr -0BCAh
var_BC8		= dword ptr -0BC8h
var_BC4		= byte ptr -0BC4h
var_BC2		= word ptr -0BC2h
var_BAE		= word ptr -0BAEh
var_BAC		= word ptr -0BACh
var_BAA		= word ptr -0BAAh
var_BA8		= word ptr -0BA8h
var_BA6		= dword ptr -0BA6h
var_BA2		= byte ptr -0BA2h
var_BA0		= word ptr -0BA0h
var_B9E		= word ptr -0B9Eh
var_B7E		= word ptr -0B7Eh
var_B66		= word ptr -0B66h
var_B64		= word ptr -0B64h
var_B56		= dword ptr -0B56h
var_B52		= byte ptr -0B52h
var_B51		= byte ptr -0B51h
var_B50		= dword ptr -0B50h
var_349		= dword ptr -349h
var_345		= dword ptr -345h
var_340		= word ptr -340h
var_33E		= word ptr -33Eh
var_33C		= word ptr -33Ch
var_33A		= word ptr -33Ah
var_338		= dword ptr -338h
var_334		= byte ptr -334h
var_332		= word ptr -332h
var_2BA		= word ptr -2BAh
var_242		= word ptr -242h
var_1CA		= word ptr -1CAh
var_152		= word ptr -152h
var_150		= word ptr -150h
var_14E		= word ptr -14Eh
var_14C		= word ptr -14Ch
var_14A		= word ptr -14Ah
var_148		= word ptr -148h
var_144		= word ptr -144h
var_142		= word ptr -142h
var_140		= word ptr -140h
var_13E		= word ptr -13Eh
var_13C		= word ptr -13Ch
var_13A		= word ptr -13Ah
var_136		= word ptr -136h
var_E6		= dword ptr -0E6h
var_E2		= byte ptr -0E2h
var_E1		= byte ptr -0E1h
var_E0		= dword ptr -0E0h
var_DC		= word ptr -0DCh
var_DA		= word ptr -0DAh
var_D8		= dword ptr -0D8h
var_D4		= byte ptr -0D4h
var_D3		= byte ptr -0D3h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= byte ptr -0CAh
var_C9		= byte ptr -0C9h
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
var_AE		= dword ptr -0AEh
var_AB		= word ptr -0ABh
var_AA		= dword ptr -0AAh
var_A8		= dword ptr -0A8h
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_A0		= dword ptr -0A0h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_98		= dword ptr -98h
var_94		= dword ptr -94h
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

		push	bp
		mov	bp, sp
		sub	sp, 0C48h
		push	si
		push	di
		mov	[bp+var_8], 0
		push	0C8h
		push	0Bh
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		mov	byte_4F55C, 0
		mov	[bp+var_B], 0
		mov	[bp+var_C], 0
		mov	[bp+var_D], 0
		cmp	word_4CA5B, 0
		jz	short loc_8E94B
		mov	[bp+var_C], 1

loc_8E94B:
		mov	ax, word_4D36E
		mov	[bp+var_10], ax
		mov	[bp+var_144], 0
		mov	[bp+var_142], 0
		push	[bp+var_10]
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_152], 0
		mov	[bp+var_150], 0
		mov	[bp+var_14E], 0
		mov	[bp+var_14C], 0
		mov	[bp+var_14A], 13Fh
		mov	[bp+var_148], 9Dh
		push	0
		lea	ax, [bp+var_152]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_152]
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
		mov	[bp+var_140], 0
		mov	[bp+var_13E], 18h
		mov	[bp+var_13C], 13Fh
		mov	[bp+var_13A], 97h
		mov	byte ptr [bp+var_1E], 0
		mov	byte ptr [bp+var_1E+1], 0
		mov	[bp+var_1C], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid16
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_136]
		push	ax
		lea	ax, [bp+var_1CA]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgames_20
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_136]
		push	ax
		lea	ax, [bp+var_242]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_242]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid16voc
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_2BA]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		cmp	[bp+var_C], 0
		jz	short loc_8EABD
		push	ds
		lea	ax, [bp+var_136]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_8EABD
		push	1
		lea	ax, [bp+var_136]
		push	ax
		lea	ax, [bp+var_2BA]
		push	ax
		mov	bx, [bp+var_2BA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_2BA]
		push	ax
		call	sub_435F1
		add	sp, 2
		jmp	short loc_8EAC1

loc_8EABD:
		mov	[bp+var_C], 0

loc_8EAC1:
		mov	[bp+var_28], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		mov	al, byte_4CA58
		mov	[bp+var_2A], al
		lea	ax, [bp+var_332]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_2A]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_8EAFC
		jmp	loc_8EE1F

loc_8EAFC:
		shl	bx, 1
		jmp	cs:off_91BA1[bx]	; switch jump

loc_8EB03:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_136]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_8EB31
		jmp	loc_8EC3B

loc_8EB31:
		push	1
		lea	ax, [bp+var_136]
		push	ax
		lea	ax, [bp+var_332]
		push	ax
		mov	bx, [bp+var_332]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_332]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_21
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_C48]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_C48], 480h
		mov	[bp+var_BE7], 100h
		mov	[bp+var_BEB], 0
		mov	[bp+var_C48], 498h
		push	1
		lea	ax, [bp+var_136]
		push	ax
		lea	ax, [bp+var_C48]
		push	ax
		mov	bx, [bp+var_C48]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_8EC03

loc_8EBED:
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_8EC03:
		cmp	si, 6Ah
		jle	short loc_8EBED
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_C48], 498h
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_C48]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_8EC3B:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_136]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_8EC79
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8EC79
		mov	word_4F048, 5Ah

loc_8EC79:
		jmp	loc_8EE1F

loc_8EC7C:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_136]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_8ECAA
		jmp	loc_8EDBE

loc_8ECAA:
		cmp	word_4CA5D, 0
		jnz	short loc_8ECB4
		jmp	loc_8EDBE

loc_8ECB4:
		push	1
		lea	ax, [bp+var_136]
		push	ax
		lea	ax, [bp+var_332]
		push	ax
		mov	bx, [bp+var_332]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_332]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_22
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_C48]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_C48], 480h
		mov	[bp+var_BE7], 100h
		mov	[bp+var_BEB], 0
		mov	[bp+var_C48], 498h
		push	1
		lea	ax, [bp+var_136]
		push	ax
		lea	ax, [bp+var_C48]
		push	ax
		mov	bx, [bp+var_C48]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_8ED86

loc_8ED70:
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_8ED86:
		cmp	si, 6Ah
		jle	short loc_8ED70
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_C48], 498h
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_C48]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_8EDBE:
		cmp	[bp+var_2A], 3
		jnz	short loc_8EDDF
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_8EDF8

loc_8EDDF:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_8EDF8:
		push	ds
		lea	ax, [bp+var_136]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_8EE1D
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8EE1D
		mov	word_4F048, 0FFh

loc_8EE1D:
		jmp	short loc_8EE1F

loc_8EE1F:
		cmp	[bp+var_D], 0
		jnz	short loc_8EE28
		jmp	loc_8EF1B

loc_8EE28:
		mov	[bp+var_BAA], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_BA8], ax
		lea	ax, [bp+var_BAA]
		mov	word_4D392, ax
		mov	[bp+var_BAA], 1BCh
		mov	[bp+var_BA6], 0
		mov	[bp+var_BA2], 0
		mov	[bp+var_BAE], 0
		mov	[bp+var_BAC], 0FFFFh
		push	word_4CA5D
		lea	ax, [bp+var_BAE]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		mov	[bp+var_9E], 0
		mov	byte ptr [bp+var_9A], 2
		mov	byte ptr [bp+var_9A+1], 0
		mov	[bp+var_98], 0
		push	3
		lea	ax, word ptr [bp+var_9E]
		push	ax
		push	1Dh
		lea	ax, [bp+var_332]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		lea	ax, word ptr [bp+var_9E]
		push	ax
		lea	ax, [bp+var_BAE]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_BAE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		cmp	byte ptr [bp+var_9A+1], 0
		jz	short loc_8EEE8
		cmp	[bp+var_9E], 0
		jz	short loc_8EEE8
		push	0
		mov	al, byte ptr [bp+var_9A]
		push	ax
		lea	ax, word ptr [bp+var_9E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8EEE8

loc_8EEE8:
		mov	[bp+var_9E], 0
		mov	byte ptr [bp+var_9A+1], 0
		mov	[bp+var_98], 0
		lea	ax, [bp+var_BAE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_BAA]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_8EF1B:
		mov	[bp+var_33C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_33A], ax
		lea	ax, [bp+var_33C]
		mov	word_4D392, ax
		mov	[bp+var_33C], 1BCh
		mov	[bp+var_338], 0
		mov	[bp+var_334], 0
		mov	[bp+var_340], 0
		mov	[bp+var_33E], 0FFFFh
		cmp	[bp+var_B], 0
		jnz	short loc_8EF58
		jmp	loc_8F01C

loc_8EF58:
		push	1
		lea	ax, [bp+var_136]
		push	ax
		lea	ax, [bp+var_C18]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_C18]
		push	ax
		call	sub_435F1
		add	sp, 2
		cmp	[bp+var_C], 0
		jz	short loc_8EF86
		mov	byte ptr [bp+var_98+3], 0Ch
		jmp	short loc_8EF8B

loc_8EF86:
		mov	byte ptr [bp+var_98+3], 0Bh

loc_8EF8B:
		push	3
		lea	ax, word ptr [bp+var_28]
		push	ax
		mov	al, byte ptr [bp+var_98+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_C18]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_340]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_28]
		push	ax
		lea	ax, [bp+var_340]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4F048
		mov	word ptr [bp+var_98], ax
		mov	word ptr [bp+var_9A], 0
		cmp	[bp+var_340], 0
		jz	short loc_8F00D
		push	[bp+var_33E]
		mov	bx, [bp+var_340]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_9A]
		push	word ptr [bp+var_98]
		push	[bp+var_33E]
		mov	bx, [bp+var_340]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8F00D

loc_8F00D:
		push	2
		lea	ax, [bp+var_C18]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_8F01C:
		mov	[bp+var_B66], 129Fh
		mov	[bp+var_B56], 0
		mov	[bp+var_B52], 2
		mov	[bp+var_B51], 0
		mov	[bp+var_B50], 0
		mov	[bp+var_B64], 0
		mov	[bp+var_B66], 1FA5h
		xor	eax, eax
		mov	[bp+var_349], eax
		mov	[bp+var_345], eax
		cmp	[bp+var_C], 0
		jz	short loc_8F071
		push	word_4CA5B
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		jmp	loc_8F170

loc_8F071:
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_23
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_C48]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_C48], 480h
		mov	[bp+var_BE7], 100h
		mov	[bp+var_BEB], 0
		mov	[bp+var_C48], 498h
		push	1
		lea	ax, [bp+var_136]
		push	ax
		lea	ax, [bp+var_C48]
		push	ax
		mov	bx, [bp+var_C48]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3631474Dh
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		xor	si, si
		jmp	short loc_8F13C

loc_8F0F9:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	di, [bp+var_BD6]
		movsx	eax, di
		push	eax
		push	ds
		mov	ax, [bp+var_A]
		imul	si
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_BD2]
		mov	[bp+var_BE3], eax
		inc	si

loc_8F13C:
		cmp	si, 0Bh
		jl	short loc_8F0F9
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_C48], 498h
		lea	ax, [bp+var_C48]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_C48]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_8F170:
		mov	[bp+var_34], 0
		mov	[bp+var_30], 2
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		push	3
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	5
		lea	ax, [bp+var_1CA]
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
		push	4
		lea	ax, [bp+var_1CA]
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
		push	3
		lea	ax, [bp+var_1CA]
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
		lea	ax, [bp+var_1CA]
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
		push	0
		lea	ax, [bp+var_1CA]
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
		push	2
		lea	ax, [bp+var_1CA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_70], 0
		mov	[bp+var_6C], 2
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6
		lea	ax, [bp+var_1CA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
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
		push	7
		lea	ax, [bp+var_1CA]
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
		push	ds
		push	offset unk_4B554
		push	ds
		push	offset aConvfontShp_5
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_136]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_136]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_94+2], dx
		mov	word ptr [bp+var_94], ax
		mov	eax, [bp+var_94]
		mov	[bp+var_90], eax
		mov	[bp+var_8C], 2
		mov	[bp+var_8B], 1
		mov	[bp+var_8A], 0
		lea	ax, word ptr [bp+var_90]
		push	ax
		lea	ax, [bp+var_B7E]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		lea	ax, [bp+var_B7E]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	[bp+var_C58], 0
		mov	[bp+var_C56], 98h
		mov	[bp+var_C54], 13Fh
		mov	[bp+var_C52], 0C7h
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0C8h
		lea	ax, [bp+var_BA0]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_8F3D9
		jmp	loc_8F733

loc_8F3D9:
		lea	ax, [bp+var_B9E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B7E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_8F41D
		cmp	[bp+var_90], 0
		jz	short loc_8F41D
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F41D

loc_8F41D:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_8F465
		cmp	[bp+var_80], 0
		jz	short loc_8F465
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F465

loc_8F465:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_8F4A9
		cmp	[bp+var_70], 0
		jz	short loc_8F4A9
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F4A9

loc_8F4A9:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_8F4E1
		cmp	[bp+var_66], 0
		jz	short loc_8F4E1
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F4E1

loc_8F4E1:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_8F519
		cmp	[bp+var_5C], 0
		jz	short loc_8F519
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F519

loc_8F519:
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_8F551
		cmp	[bp+var_52], 0
		jz	short loc_8F551
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F551

loc_8F551:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_8F589
		cmp	[bp+var_48], 0
		jz	short loc_8F589
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F589

loc_8F589:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_8F5C1
		cmp	[bp+var_3E], 0
		jz	short loc_8F5C1
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F5C1

loc_8F5C1:
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_8F5F9
		cmp	[bp+var_34], 0
		jz	short loc_8F5F9
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F5F9

loc_8F5F9:
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_B66], 129Fh
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B51], 0
		jz	short loc_8F648
		cmp	[bp+var_B56], 0
		jz	short loc_8F648
		push	0
		mov	al, [bp+var_B52]
		push	ax
		lea	ax, word ptr [bp+var_B56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F648

loc_8F648:
		mov	[bp+var_B56], 0
		mov	[bp+var_B51], 0
		mov	[bp+var_B50], 0
		lea	ax, [bp+var_340]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_332]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_8F6AE
		cmp	[bp+var_28], 0
		jz	short loc_8F6AE
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F6AE

loc_8F6AE:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_2BA]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_242]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1CA]
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
		lea	ax, [bp+var_152]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_144]
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

loc_8F733:
		mov	[bp+var_9E], 0
		mov	byte ptr [bp+var_9A], 2
		mov	byte ptr [bp+var_9A+1], 0
		mov	[bp+var_98], 0
		push	3
		lea	ax, word ptr [bp+var_9E]
		push	ax
		push	1
		lea	ax, [bp+var_242]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_A8], 0
		mov	byte ptr [bp+var_A6+2], 2
		mov	byte ptr [bp+var_A6+3], 0
		mov	[bp+var_A2], 0
		push	2
		lea	ax, word ptr [bp+var_A8]
		push	ax
		push	2
		lea	ax, [bp+var_242]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_AB], 0
		lea	ax, word ptr [bp+var_A8]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_144]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_9E]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_B0], ax
		push	1
		push	0
		push	0
		lea	ax, word ptr [bp+var_9E]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_B4+2], ax
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_AE]
		mov	al, byte ptr [bp+var_AE+2]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_B0]
		lea	ax, [bp+var_BC2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_B4+2]
		lea	ax, [bp+var_BC2]
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
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_AE]
		mov	al, byte ptr [bp+var_AE+2]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeFromColor_34EEE
		add	sp, 0Ah
		mov	[bp+var_6], 19h
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	short loc_8F909

loc_8F8EF:
		jmp	short loc_8F8FC
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8F8FC
		jmp	short loc_8F926

loc_8F8FC:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8F909:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_8F919
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_8F91E

loc_8F919:
		mov	ax, 1
		jmp	short loc_8F920

loc_8F91E:
		xor	ax, ax

loc_8F920:
		mov	ah, 0
		or	ax, ax
		jz	short loc_8F8EF

loc_8F926:
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
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_AE]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_A6+3], 0
		jz	short loc_8F981
		cmp	[bp+var_A8], 0
		jz	short loc_8F981
		push	0
		mov	al, byte ptr [bp+var_A6+2]
		push	ax
		lea	ax, word ptr [bp+var_A8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F981

loc_8F981:
		mov	[bp+var_A8], 0
		mov	byte ptr [bp+var_A6+3], 0
		mov	[bp+var_A2], 0
		cmp	byte ptr [bp+var_9A+1], 0
		jz	short loc_8F9C0
		cmp	[bp+var_9E], 0
		jz	short loc_8F9C0
		push	0
		mov	al, byte ptr [bp+var_9A]
		push	ax
		lea	ax, word ptr [bp+var_9E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8F9C0

loc_8F9C0:
		mov	[bp+var_9E], 0
		mov	byte ptr [bp+var_9A+1], 0
		mov	[bp+var_98], 0
		cmp	byte_4F55C, 0
		jnz	short loc_8F9E1
		jmp	loc_8FD3B

loc_8F9E1:
		lea	ax, [bp+var_B9E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B7E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_8FA25
		cmp	[bp+var_90], 0
		jz	short loc_8FA25
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8FA25

loc_8FA25:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_8FA6D
		cmp	[bp+var_80], 0
		jz	short loc_8FA6D
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8FA6D

loc_8FA6D:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_8FAB1
		cmp	[bp+var_70], 0
		jz	short loc_8FAB1
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8FAB1

loc_8FAB1:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_8FAE9
		cmp	[bp+var_66], 0
		jz	short loc_8FAE9
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8FAE9

loc_8FAE9:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_8FB21
		cmp	[bp+var_5C], 0
		jz	short loc_8FB21
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8FB21

loc_8FB21:
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_8FB59
		cmp	[bp+var_52], 0
		jz	short loc_8FB59
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8FB59

loc_8FB59:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_8FB91
		cmp	[bp+var_48], 0
		jz	short loc_8FB91
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8FB91

loc_8FB91:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_8FBC9
		cmp	[bp+var_3E], 0
		jz	short loc_8FBC9
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8FBC9

loc_8FBC9:
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_8FC01
		cmp	[bp+var_34], 0
		jz	short loc_8FC01
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8FC01

loc_8FC01:
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_B66], 129Fh
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B51], 0
		jz	short loc_8FC50
		cmp	[bp+var_B56], 0
		jz	short loc_8FC50
		push	0
		mov	al, [bp+var_B52]
		push	ax
		lea	ax, word ptr [bp+var_B56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8FC50

loc_8FC50:
		mov	[bp+var_B56], 0
		mov	[bp+var_B51], 0
		mov	[bp+var_B50], 0
		lea	ax, [bp+var_340]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_332]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_8FCB6
		cmp	[bp+var_28], 0
		jz	short loc_8FCB6
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8FCB6

loc_8FCB6:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_2BA]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_242]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1CA]
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
		lea	ax, [bp+var_152]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_144]
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

loc_8FD3B:
		lea	ax, [bp+var_144]
		push	ax
		push	0FFh
		push	7
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	2
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	si, ax
		push	1
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_98+2], ax
		push	0
		push	0FFFFh
		push	0
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_98], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_9A], ax
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_9A]
		lea	ax, [bp+var_BC2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_BC2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_98]
		lea	ax, [bp+var_BC2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_98+2]
		lea	ax, [bp+var_BC2]
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
		mov	word ptr [bp+var_9E+2], 1
		cmp	[bp+var_C], 0
		jnz	short loc_8FE3B
		jmp	loc_905C9

loc_8FE3B:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_A6], 0
		mov	byte ptr [bp+var_A2], 2
		mov	byte ptr [bp+var_A2+1], 0
		mov	[bp+var_A0], 0
		push	2
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	0
		lea	ax, [bp+var_2BA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_A6]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_8FE9E

loc_8FE90:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_8FE9E:
		cmp	di, 4
		jl	short loc_8FE90
		push	0FFFFh
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		xor	di, di
		jmp	short loc_8FF05

loc_8FEB6:
		cmp	di, 4
		jnz	short loc_8FEC0
		mov	word ptr [si+1Bh], 1

loc_8FEC0:
		cmp	di, 0Ah
		jnz	short loc_8FECA
		mov	word ptr [si+1Bh], 2

loc_8FECA:
		cmp	di, 0Bh
		jnz	short loc_8FED4
		mov	word ptr [si+1Bh], 1

loc_8FED4:
		cmp	di, 0Ch
		jnz	short loc_8FEDE
		mov	word ptr [si+1Bh], 2

loc_8FEDE:
		mov	ax, di
		inc	di
		cmp	ax, 10h
		jnz	short loc_8FEEB
		mov	word ptr [si+1Bh], 1

loc_8FEEB:
		jmp	short loc_8FEF8
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8FEF8
		jmp	short loc_8FF16

loc_8FEF8:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8FF05:
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_8FEB6

loc_8FF16:
		mov	[bp+var_B0], 0
		mov	byte ptr [bp+var_AE+2], 2
		mov	byte ptr [bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	1
		lea	ax, [bp+var_2BA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_8FF6C

loc_8FF5E:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_8FF6C:
		cmp	di, 4
		jl	short loc_8FF5E
		push	0FFFFh
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		xor	di, di
		jmp	short loc_8FFC9

loc_8FF84:
		cmp	di, 4
		jnz	short loc_8FF8E
		mov	word ptr [si+1Bh], 2

loc_8FF8E:
		cmp	di, 10h
		jnz	short loc_8FF98
		mov	word ptr [si+1Bh], 1

loc_8FF98:
		cmp	di, 12h
		jnz	short loc_8FFA2
		mov	word ptr [si+1Bh], 2

loc_8FFA2:
		mov	ax, di
		inc	di
		cmp	ax, 16h
		jnz	short loc_8FFAF
		mov	word ptr [si+1Bh], 1

loc_8FFAF:
		jmp	short loc_8FFBC
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8FFBC
		jmp	short loc_8FFDA

loc_8FFBC:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_8FFC9:
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_8FF84

loc_8FFDA:
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	2
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	2
		lea	ax, [bp+var_2BA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_BA]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_90030

loc_90022:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_90030:
		cmp	di, 4
		jl	short loc_90022
		push	0FFFFh
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		xor	di, di
		jmp	short loc_9007D

loc_90048:
		cmp	di, 8
		jnz	short loc_90052
		mov	word ptr [si+1Bh], 2

loc_90052:
		mov	ax, di
		inc	di
		cmp	ax, 10h
		jnz	short loc_90063
		mov	bx, word ptr [bp+var_98+2]
		mov	word ptr [bx+1Bh], 2

loc_90063:
		jmp	short loc_90070
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_90070
		jmp	short loc_9008E

loc_90070:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9007D:
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_90048

loc_9008E:
		mov	[bp+var_C4], 0
		mov	[bp+var_C0], 2
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		push	2
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	3
		lea	ax, [bp+var_2BA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_C4]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_900E4

loc_900D6:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_900E4:
		cmp	di, 4
		jl	short loc_900D6
		push	0FFFFh
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		xor	di, di
		jmp	short loc_90141

loc_900FC:
		cmp	di, 4
		jnz	short loc_90106
		mov	word ptr [si+1Bh], 1

loc_90106:
		cmp	di, 17h
		jnz	short loc_90110
		mov	word ptr [si+1Bh], 2

loc_90110:
		cmp	di, 18h
		jnz	short loc_9011A
		mov	word ptr [si+1Bh], 1

loc_9011A:
		mov	ax, di
		inc	di
		cmp	ax, 19h
		jnz	short loc_90127
		mov	word ptr [si+1Bh], 2

loc_90127:
		jmp	short loc_90134
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_90134
		jmp	short loc_90152

loc_90134:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_90141:
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_900FC

loc_90152:
		mov	[bp+var_CE], 0
		mov	[bp+var_CA], 2
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		push	2
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	4
		lea	ax, [bp+var_2BA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_CE]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_901A8

loc_9019A:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_901A8:
		cmp	di, 4
		jl	short loc_9019A
		push	0FFFFh
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		xor	di, di
		jmp	short loc_90209

loc_901C0:
		cmp	di, 4
		jnz	short loc_901CA
		mov	word ptr [si+1Bh], 1

loc_901CA:
		cmp	di, 0Eh
		jnz	short loc_901D4
		mov	word ptr [si+1Bh], 2

loc_901D4:
		cmp	di, 18h
		jnz	short loc_901E2
		mov	bx, word ptr [bp+var_98+2]
		mov	word ptr [bx+1Bh], 1

loc_901E2:
		mov	ax, di
		inc	di
		cmp	ax, 1Ah
		jnz	short loc_901EF
		mov	word ptr [si+1Bh], 1

loc_901EF:
		jmp	short loc_901FC
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_901FC
		jmp	short loc_9021A

loc_901FC:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_90209:
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_901C0

loc_9021A:
		mov	[bp+var_D8], 0
		mov	[bp+var_D4], 2
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	5
		lea	ax, [bp+var_2BA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_D8]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_90270

loc_90262:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_90270:
		cmp	di, 6
		jl	short loc_90262
		mov	bx, word ptr [bp+var_98+2]
		mov	word ptr [bx+1Bh], 2
		push	0FFFFh
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		xor	di, di
		jmp	short loc_90302

loc_90291:
		cmp	di, 6
		jle	short loc_902BF
		cmp	di, 0Ch
		jge	short loc_902BF
		test	di, 1
		jz	short loc_902BF
		mov	ax, word ptr [bp+var_9E+2]
		mov	[bp+var_DA], ax
		mov	bx, word ptr [bp+var_98]
		mov	ax, [bp+var_DA]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_9E+2], 3
		jge	short loc_902BF
		inc	word ptr [bp+var_9E+2]

loc_902BF:
		cmp	di, 0Eh
		jle	short loc_902E7
		cmp	di, 12h
		jge	short loc_902E7
		cmp	word ptr [bp+var_9E+2], 1
		jle	short loc_902D4
		dec	word ptr [bp+var_9E+2]

loc_902D4:
		mov	ax, word ptr [bp+var_9E+2]
		mov	[bp+var_DC], ax
		mov	bx, word ptr [bp+var_98]
		mov	ax, [bp+var_DC]
		mov	[bx+1Bh], ax

loc_902E7:
		inc	di
		jmp	short loc_902F5
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_902F5
		jmp	short loc_90316

loc_902F5:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_90302:
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jz	short loc_90316
		jmp	loc_90291

loc_90316:
		mov	bx, word ptr [bp+var_98+2]
		mov	word ptr [bx+1Bh], 1
		xor	di, di
		jmp	short loc_90331

loc_90323:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_90331:
		cmp	di, 4
		jl	short loc_90323
		mov	[bp+var_E6], 0
		mov	[bp+var_E2], 2
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		push	2
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6
		lea	ax, [bp+var_2BA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_9038C

loc_9037E:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_9038C:
		cmp	di, 4
		jl	short loc_9037E
		push	0FFFFh
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_903BC

loc_903A2:
		jmp	short loc_903AF
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_903AF
		jmp	short loc_903CD

loc_903AF:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_903BC:
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_903A2

loc_903CD:
		xor	di, di
		jmp	short loc_903DF

loc_903D1:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_903DF:
		cmp	di, 8
		jl	short loc_903D1
		mov	word ptr [si+1Bh], 2
		xor	di, di
		jmp	short loc_903FB

loc_903ED:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_903FB:
		cmp	di, 4
		jl	short loc_903ED
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_E1], 0
		jz	short loc_90435
		cmp	[bp+var_E6], 0
		jz	short loc_90435
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90435

loc_90435:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D3], 0
		jz	short loc_90474
		cmp	[bp+var_D8], 0
		jz	short loc_90474
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90474

loc_90474:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_904B3
		cmp	[bp+var_CE], 0
		jz	short loc_904B3
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_904B3

loc_904B3:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_904F2
		cmp	[bp+var_C4], 0
		jz	short loc_904F2
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_904F2

loc_904F2:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_90531
		cmp	[bp+var_BA], 0
		jz	short loc_90531
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90531

loc_90531:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	byte ptr [bp+var_AB], 0
		jz	short loc_90570
		cmp	[bp+var_B0], 0
		jz	short loc_90570
		push	0
		mov	al, byte ptr [bp+var_AE+2]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90570

loc_90570:
		mov	[bp+var_B0], 0
		mov	byte ptr [bp+var_AB], 0
		mov	[bp+var_AA], 0
		cmp	byte ptr [bp+var_A2+1], 0
		jz	short loc_905AF
		cmp	[bp+var_A6], 0
		jz	short loc_905AF
		push	0
		mov	al, byte ptr [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_905AF

loc_905AF:
		mov	[bp+var_A6], 0
		mov	byte ptr [bp+var_A2+1], 0
		mov	[bp+var_A0], 0
		jmp	loc_90D63

loc_905C9:
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	1
		lea	ax, [bp+var_BA0]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_6], 30h
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	loc_90697

loc_9060C:
		mov	di, word ptr [bp+var_BA6+1]
		mov	ax, [bp+var_2]
		add	ax, 8
		cmp	ax, di
		jnz	short loc_9062A
		push	[bp+var_8]
		lea	ax, [bp+var_BA0]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_9062A:
		mov	ax, [bp+var_2]
		add	ax, 4
		cmp	ax, di
		jnz	short loc_90639
		mov	word ptr [si+1Bh], 1

loc_90639:
		mov	ax, [bp+var_2]
		add	ax, 0Ch
		cmp	ax, di
		jnz	short loc_90648
		mov	word ptr [si+1Bh], 2

loc_90648:
		mov	ax, [bp+var_2]
		add	ax, 10h
		cmp	ax, di
		jnz	short loc_90657
		mov	word ptr [si+1Bh], 1

loc_90657:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_9066E
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9066E:
		jmp	short loc_9068A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9068A
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_906B7

loc_9068A:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_90697:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_906A7
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_906AC

loc_906A7:
		mov	ax, 1
		jmp	short loc_906AE

loc_906AC:
		xor	ax, ax

loc_906AE:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_906B7
		jmp	loc_9060C

loc_906B7:
		mov	[bp+var_6], 20h
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	loc_9077A

loc_906DC:
		mov	di, word ptr [bp+var_BA6+1]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_906FE
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_BA0]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_906FE:
		mov	ax, [bp+var_2]
		add	ax, 4
		cmp	ax, di
		jnz	short loc_9070D
		mov	word ptr [si+1Bh], 2

loc_9070D:
		mov	ax, [bp+var_2]
		add	ax, 10h
		cmp	ax, di
		jnz	short loc_9071C
		mov	word ptr [si+1Bh], 1

loc_9071C:
		mov	ax, [bp+var_2]
		add	ax, 12h
		cmp	ax, di
		jnz	short loc_9072B
		mov	word ptr [si+1Bh], 2

loc_9072B:
		mov	ax, [bp+var_2]
		add	ax, 16h
		cmp	ax, di
		jnz	short loc_9073A
		mov	word ptr [si+1Bh], 1

loc_9073A:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_90751
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_90751:
		jmp	short loc_9076D
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9076D
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_9079A

loc_9076D:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9077A:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_9078A
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_9078F

loc_9078A:
		mov	ax, 1
		jmp	short loc_90791

loc_9078F:
		xor	ax, ax

loc_90791:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9079A
		jmp	loc_906DC

loc_9079A:
		mov	[bp+var_6], 1Eh
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	loc_90847

loc_907BF:
		mov	di, word ptr [bp+var_BA6+1]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_907E5
		mov	ax, [bp+var_A]
		shl	ax, 1
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BA0]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_907E5:
		mov	ax, [bp+var_2]
		add	ax, 8
		cmp	ax, di
		jnz	short loc_907F4
		mov	word ptr [si+1Bh], 2

loc_907F4:
		mov	ax, [bp+var_2]
		add	ax, 10h
		cmp	ax, di
		jnz	short loc_90807
		mov	bx, word ptr [bp+var_98+2]
		mov	word ptr [bx+1Bh], 2

loc_90807:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_9081E
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9081E:
		jmp	short loc_9083A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9083A
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_90867

loc_9083A:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_90847:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_90857
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_9085C

loc_90857:
		mov	ax, 1
		jmp	short loc_9085E

loc_9085C:
		xor	ax, ax

loc_9085E:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90867
		jmp	loc_907BF

loc_90867:
		mov	[bp+var_6], 4Eh
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	loc_90940

loc_9088C:
		mov	di, word ptr [bp+var_BA6+1]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_908B5
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BA0]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_908B5:
		mov	ax, [bp+var_2]
		add	ax, 4
		cmp	ax, di
		jnz	short loc_908C4
		mov	word ptr [si+1Bh], 1

loc_908C4:
		mov	ax, [bp+var_2]
		add	ax, 18h
		cmp	ax, di
		jnz	short loc_908D3
		mov	word ptr [si+1Bh], 2

loc_908D3:
		mov	ax, [bp+var_2]
		add	ax, 24h
		cmp	ax, di
		jnz	short loc_908E2
		mov	word ptr [si+1Bh], 1

loc_908E2:
		mov	ax, [bp+var_2]
		add	ax, 26h
		cmp	ax, di
		jnz	short loc_908F1
		mov	word ptr [si+1Bh], 2

loc_908F1:
		mov	ax, [bp+var_2]
		add	ax, 2Ch
		cmp	ax, di
		jnz	short loc_90900
		mov	word ptr [si+1Bh], 1

loc_90900:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_90917
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_90917:
		jmp	short loc_90933
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_90933
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_90960

loc_90933:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_90940:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_90950
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_90955

loc_90950:
		mov	ax, 1
		jmp	short loc_90957

loc_90955:
		xor	ax, ax

loc_90957:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90960
		jmp	loc_9088C

loc_90960:
		mov	[bp+var_6], 59h
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	loc_90A59

loc_90985:
		mov	di, word ptr [bp+var_BA6+1]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_909AC
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BA0]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_909AC:
		mov	ax, [bp+var_2]
		add	ax, 4
		cmp	ax, di
		jnz	short loc_909BB
		mov	word ptr [si+1Bh], 1

loc_909BB:
		mov	ax, [bp+var_2]
		add	ax, 0Eh
		cmp	ax, di
		jnz	short loc_909CA
		mov	word ptr [si+1Bh], 2

loc_909CA:
		mov	ax, [bp+var_2]
		add	ax, 1Ah
		cmp	ax, di
		jnz	short loc_909D9
		mov	word ptr [si+1Bh], 1

loc_909D9:
		mov	ax, [bp+var_2]
		add	ax, 1Ch
		cmp	ax, di
		jnz	short loc_909E8
		mov	word ptr [si+1Bh], 2

loc_909E8:
		mov	ax, [bp+var_2]
		add	ax, 2Ch
		cmp	ax, di
		jnz	short loc_909F7
		mov	word ptr [si+1Bh], 1

loc_909F7:
		mov	ax, [bp+var_4]
		add	ax, 0FFF7h
		cmp	ax, di
		jnz	short loc_90A0A
		mov	bx, word ptr [bp+var_98+2]
		mov	word ptr [bx+1Bh], 1

loc_90A0A:
		mov	ax, [bp+var_4]
		add	ax, 0FFF8h
		cmp	ax, di
		jnz	short loc_90A19
		mov	word ptr [si+1Bh], 2

loc_90A19:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_90A30
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_90A30:
		jmp	short loc_90A4C
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_90A4C
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_90A79

loc_90A4C:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_90A59:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_90A69
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_90A6E

loc_90A69:
		mov	ax, 1
		jmp	short loc_90A70

loc_90A6E:
		xor	ax, ax

loc_90A70:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90A79
		jmp	loc_90985

loc_90A79:
		mov	[bp+var_6], 3Ah
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	short loc_90B17

loc_90A9D:
		mov	di, word ptr [bp+var_BA6+1]
		mov	ax, [bp+var_2]
		add	ax, 8
		cmp	ax, di
		jnz	short loc_90AC6
		mov	ax, [bp+var_A]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BA0]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_90AC6:
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_90AD5
		mov	word ptr [si+1Bh], 1

loc_90AD5:
		mov	ax, [bp+var_4]
		add	ax, 0FFFDh
		cmp	ax, di
		jnz	short loc_90AEE
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_90AEE:
		jmp	short loc_90B0A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_90B0A
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_90B37

loc_90B0A:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_90B17:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_90B27
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_90B2C

loc_90B27:
		mov	ax, 1
		jmp	short loc_90B2E

loc_90B2C:
		xor	ax, ax

loc_90B2E:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90B37
		jmp	loc_90A9D

loc_90B37:
		push	2
		lea	ax, [bp+var_BA0]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_6], 36h
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	loc_90C73

loc_90B6B:
		mov	di, word ptr [bp+var_BA6+1]
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_90B94
		mov	ax, [bp+var_A]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BA0]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_90B94:
		mov	ax, [bp+var_2]
		add	ax, 0Ah
		cmp	ax, di
		jnz	short loc_90BA7
		mov	bx, word ptr [bp+var_98+2]
		mov	word ptr [bx+1Bh], 2

loc_90BA7:
		mov	ax, [bp+var_2]
		add	ax, 1Ah
		cmp	ax, di
		jnz	short loc_90BBA
		mov	bx, word ptr [bp+var_98+2]
		mov	word ptr [bx+1Bh], 1

loc_90BBA:
		mov	ax, [bp+var_2]
		add	ax, 0Ch
		cmp	ax, di
		jge	short loc_90BF2
		mov	ax, [bp+var_2]
		add	ax, 12h
		cmp	ax, di
		jle	short loc_90BF2
		test	di, 1
		jz	short loc_90BF2
		mov	ax, word ptr [bp+var_9E+2]
		mov	word ptr [bp+var_9E], ax
		mov	bx, word ptr [bp+var_98]
		mov	ax, word ptr [bp+var_9E]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_9E+2], 3
		jge	short loc_90BF2
		inc	word ptr [bp+var_9E+2]

loc_90BF2:
		mov	ax, [bp+var_2]
		add	ax, 18h
		cmp	ax, di
		jge	short loc_90C20
		test	di, 1
		jz	short loc_90C20
		mov	ax, word ptr [bp+var_9E+2]
		mov	word ptr [bp+var_A0], ax
		mov	bx, word ptr [bp+var_98]
		mov	ax, word ptr [bp+var_A0]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_9E+2], 1
		jle	short loc_90C20
		dec	word ptr [bp+var_9E+2]

loc_90C20:
		mov	ax, [bp+var_4]
		add	ax, 0FFF6h
		cmp	ax, di
		jnz	short loc_90C33
		mov	bx, word ptr [bp+var_98+2]
		mov	word ptr [bx+1Bh], 2

loc_90C33:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_90C4A
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_90C4A:
		jmp	short loc_90C66
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_90C66
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_90C93

loc_90C66:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_90C73:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_90C83
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_90C88

loc_90C83:
		mov	ax, 1
		jmp	short loc_90C8A

loc_90C88:
		xor	ax, ax

loc_90C8A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90C93
		jmp	loc_90B6B

loc_90C93:
		mov	[bp+var_6], 2Bh
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	loc_90D43

loc_90CB8:
		mov	di, word ptr [bp+var_BA6+1]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_90CE1
		mov	ax, [bp+var_A]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BA0]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_90CE1:
		mov	ax, [bp+var_4]
		add	ax, 0FFF8h
		cmp	ax, di
		jnz	short loc_90CF0
		mov	word ptr [si+1Bh], 2

loc_90CF0:
		mov	ax, [bp+var_4]
		add	ax, 0FFF4h
		cmp	ax, di
		jnz	short loc_90D03
		mov	bx, word ptr [bp+var_98+2]
		mov	word ptr [bx+1Bh], 1

loc_90D03:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_90D1A
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_90D1A:
		jmp	short loc_90D36
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_90D36
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_90D63

loc_90D36:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_90D43:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_90D53
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_90D58

loc_90D53:
		mov	ax, 1
		jmp	short loc_90D5A

loc_90D58:
		xor	ax, ax

loc_90D5A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90D63
		jmp	loc_90CB8

loc_90D63:
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
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_90D93
		jmp	loc_910ED

loc_90D93:
		lea	ax, [bp+var_B9E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B7E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_90DD7
		cmp	[bp+var_90], 0
		jz	short loc_90DD7
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90DD7

loc_90DD7:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_90E1F
		cmp	[bp+var_80], 0
		jz	short loc_90E1F
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90E1F

loc_90E1F:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_90E63
		cmp	[bp+var_70], 0
		jz	short loc_90E63
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90E63

loc_90E63:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_90E9B
		cmp	[bp+var_66], 0
		jz	short loc_90E9B
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90E9B

loc_90E9B:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_90ED3
		cmp	[bp+var_5C], 0
		jz	short loc_90ED3
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90ED3

loc_90ED3:
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_90F0B
		cmp	[bp+var_52], 0
		jz	short loc_90F0B
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90F0B

loc_90F0B:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_90F43
		cmp	[bp+var_48], 0
		jz	short loc_90F43
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90F43

loc_90F43:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_90F7B
		cmp	[bp+var_3E], 0
		jz	short loc_90F7B
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90F7B

loc_90F7B:
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_90FB3
		cmp	[bp+var_34], 0
		jz	short loc_90FB3
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_90FB3

loc_90FB3:
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_B66], 129Fh
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B51], 0
		jz	short loc_91002
		cmp	[bp+var_B56], 0
		jz	short loc_91002
		push	0
		mov	al, [bp+var_B52]
		push	ax
		lea	ax, word ptr [bp+var_B56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_91002

loc_91002:
		mov	[bp+var_B56], 0
		mov	[bp+var_B51], 0
		mov	[bp+var_B50], 0
		lea	ax, [bp+var_340]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_332]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_91068
		cmp	[bp+var_28], 0
		jz	short loc_91068
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_91068

loc_91068:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_2BA]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_242]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1CA]
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
		lea	ax, [bp+var_152]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_144]
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

loc_910ED:
		lea	ax, [bp+var_144]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_98+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	si, ax
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_98+2]
		lea	ax, [bp+var_BC2]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_BC2]
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
		mov	[bp+var_A0], 0
		mov	byte ptr [bp+var_9E+2], 2
		mov	byte ptr [bp+var_9E+3], 0
		mov	[bp+var_9A], 0
		mov	[bp+var_BCC], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_BCA], ax
		lea	ax, [bp+var_BCC]
		mov	word_4D392, ax
		mov	[bp+var_BCC], 1BCh
		mov	[bp+var_BC8], 0
		mov	[bp+var_BC4], 0
		mov	word ptr [bp+var_BD2+2], 0
		mov	[bp+var_BCE], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_911E0
		jmp	loc_9125F

loc_911E0:
		push	3
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	1Dh
		lea	ax, [bp+var_332]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, word ptr [bp+var_BD2+2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_A0]
		push	ax
		lea	ax, word ptr [bp+var_BD2+2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFAE
		mov	word ptr [bp+var_A2], ax
		mov	word ptr [bp+var_A6+2], 0
		cmp	word ptr [bp+var_BD2+2], 0
		jz	short loc_9125F
		push	[bp+var_BCE]
		mov	bx, word ptr [bp+var_BD2+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_A6+2]
		push	word ptr [bp+var_A2]
		push	[bp+var_BCE]
		mov	bx, word ptr [bp+var_BD2+2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_9125F

loc_9125F:
		cmp	[bp+var_C], 0
		jnz	short loc_91268
		jmp	loc_914BB

loc_91268:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_AE], 0
		mov	byte ptr [bp+var_AA], 2
		mov	byte ptr [bp+var_AA+1], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	7
		lea	ax, [bp+var_2BA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_912CB

loc_912BD:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_912CB:
		cmp	di, 8
		jl	short loc_912BD
		mov	word ptr [si+1Bh], 1
		push	0FFFFh
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_91324

loc_912E6:
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_B0], ax
		mov	ax, word ptr [bp+var_B0]
		mov	[si+1Bh], ax
		jmp	short loc_91317
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_91317
		jmp	short loc_91335

loc_91317:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_91324:
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_912E6

loc_91335:
		mov	word ptr [si+1Bh], 0
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	2
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	8
		lea	ax, [bp+var_2BA]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_BA]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_91390

loc_91382:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_91390:
		cmp	di, 0Ah
		jl	short loc_91382
		mov	word ptr [si+1Bh], 1
		xor	di, di
		jmp	short loc_913AC

loc_9139E:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_913AC:
		cmp	di, 2
		jl	short loc_9139E
		push	0FFFFh
		lea	ax, [bp+var_B66]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_91400

loc_913C2:
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_BE+2], ax
		mov	ax, word ptr [bp+var_BE+2]
		mov	[si+1Bh], ax
		jmp	short loc_913F3
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_913F3
		jmp	short loc_91411

loc_913F3:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_91400:
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_913C2

loc_91411:
		mov	word ptr [si+1Bh], 1
		xor	di, di
		jmp	short loc_91428

loc_9141A:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_91428:
		cmp	di, 0Ch
		jl	short loc_9141A
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B5], 0
		jz	short loc_91462
		cmp	[bp+var_BA], 0
		jz	short loc_91462
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_91462

loc_91462:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	byte ptr [bp+var_AA+1], 0
		jz	short loc_914A1
		cmp	[bp+var_AE], 0
		jz	short loc_914A1
		push	0
		mov	al, byte ptr [bp+var_AA]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_914A1

loc_914A1:
		mov	[bp+var_AE], 0
		mov	byte ptr [bp+var_AA+1], 0
		mov	[bp+var_A8], 0
		jmp	loc_917C6

loc_914BB:
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0CBh
		lea	ax, [bp+var_BA0]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_6], 2Dh
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	loc_915BC

loc_914FF:
		mov	di, word ptr [bp+var_BA6+1]
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_91512
		mov	word ptr [si+1Bh], 1

loc_91512:
		mov	ax, [bp+var_2]
		add	ax, 0Ch
		cmp	ax, di
		jnz	short loc_91535
		mov	ax, [bp+var_A]
		shl	ax, 3
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BA0]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_91535:
		mov	ax, [bp+var_2]
		add	ax, 0Ch
		cmp	ax, di
		jge	short loc_9156D
		mov	ax, [bp+var_2]
		add	ax, 14h
		cmp	ax, di
		jle	short loc_9156D
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_A6], ax
		mov	ax, word ptr [bp+var_A6]
		mov	[si+1Bh], ax

loc_9156D:
		mov	ax, [bp+var_4]
		add	ax, 0FFFBh
		cmp	ax, di
		jge	short loc_9157C
		mov	word ptr [si+1Bh], 1

loc_9157C:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_91593
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_91593:
		jmp	short loc_915AF
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_915AF
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_915DC

loc_915AF:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_915BC:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_915CC
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_915D1

loc_915CC:
		mov	ax, 1
		jmp	short loc_915D3

loc_915D1:
		xor	ax, ax

loc_915D3:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_915DC
		jmp	loc_914FF

loc_915DC:
		mov	[bp+var_6], 69h
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	loc_916B1

loc_91601:
		mov	di, word ptr [bp+var_BA6+1]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_9162A
		mov	ax, [bp+var_A]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BA0]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_9162A:
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jge	short loc_91662
		mov	ax, [bp+var_2]
		add	ax, 41h
		cmp	ax, di
		jle	short loc_91662
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_A6], ax
		mov	ax, word ptr [bp+var_A6]
		mov	[si+1Bh], ax

loc_91662:
		mov	ax, [bp+var_4]
		add	ax, 0FFE7h
		cmp	ax, di
		jge	short loc_91671
		mov	word ptr [si+1Bh], 0

loc_91671:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_91688
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_91688:
		jmp	short loc_916A4
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_916A4
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_916D1

loc_916A4:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_916B1:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_916C1
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_916C6

loc_916C1:
		mov	ax, 1
		jmp	short loc_916C8

loc_916C6:
		xor	ax, ax

loc_916C8:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_916D1
		jmp	loc_91601

loc_916D1:
		mov	[bp+var_6], 32h
		mov	ax, word ptr [bp+var_BA6+1]
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
		jmp	loc_917A6

loc_916F6:
		mov	di, word ptr [bp+var_BA6+1]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_9171F
		mov	ax, [bp+var_A]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BA0]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_9171F:
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, di
		jge	short loc_91757
		mov	ax, [bp+var_2]
		add	ax, 19h
		cmp	ax, di
		jle	short loc_91757
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_A6], ax
		mov	ax, word ptr [bp+var_A6]
		mov	[si+1Bh], ax

loc_91757:
		mov	ax, [bp+var_4]
		add	ax, 0FFF6h
		cmp	ax, di
		jge	short loc_91766
		mov	word ptr [si+1Bh], 1

loc_91766:
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_9177D
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9177D:
		jmp	short loc_91799
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_91799
		push	0
		lea	ax, [bp+var_BA0]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_917C6

loc_91799:
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_917A6:
		mov	ax, word ptr [bp+var_BA6+1]
		cmp	ax, [bp+var_4]
		jnb	short loc_917B6
		cmp	byte ptr [bp+var_BA6+3], 0
		jz	short loc_917BB

loc_917B6:
		mov	ax, 1
		jmp	short loc_917BD

loc_917BB:
		xor	ax, ax

loc_917BD:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_917C6
		jmp	loc_916F6

loc_917C6:
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		lea	ax, word ptr [bp+var_BD2+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_BCC]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_9E+3], 0
		jz	short loc_91821
		cmp	[bp+var_A0], 0
		jz	short loc_91821
		push	0
		mov	al, byte ptr [bp+var_9E+2]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_91821

loc_91821:
		mov	[bp+var_A0], 0
		mov	byte ptr [bp+var_9E+3], 0
		mov	[bp+var_9A], 0
		push	0
		lea	ax, [bp+var_BC2]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_B9E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B7E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_9188B
		cmp	[bp+var_90], 0
		jz	short loc_9188B
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9188B

loc_9188B:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_918D3
		cmp	[bp+var_80], 0
		jz	short loc_918D3
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_918D3

loc_918D3:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_91917
		cmp	[bp+var_70], 0
		jz	short loc_91917
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_91917

loc_91917:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_9194F
		cmp	[bp+var_66], 0
		jz	short loc_9194F
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9194F

loc_9194F:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_91987
		cmp	[bp+var_5C], 0
		jz	short loc_91987
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_91987

loc_91987:
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_919BF
		cmp	[bp+var_52], 0
		jz	short loc_919BF
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_919BF

loc_919BF:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_919F7
		cmp	[bp+var_48], 0
		jz	short loc_919F7
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_919F7

loc_919F7:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_91A2F
		cmp	[bp+var_3E], 0
		jz	short loc_91A2F
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_91A2F

loc_91A2F:
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_91A67
		cmp	[bp+var_34], 0
		jz	short loc_91A67
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_91A67

loc_91A67:
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_B66], 129Fh
		lea	ax, [bp+var_B66]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B51], 0
		jz	short loc_91AB6
		cmp	[bp+var_B56], 0
		jz	short loc_91AB6
		push	0
		mov	al, [bp+var_B52]
		push	ax
		lea	ax, word ptr [bp+var_B56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_91AB6

loc_91AB6:
		mov	[bp+var_B56], 0
		mov	[bp+var_B51], 0
		mov	[bp+var_B50], 0
		lea	ax, [bp+var_340]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_33C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_332]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_91B1C
		cmp	[bp+var_28], 0
		jz	short loc_91B1C
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_91B1C

loc_91B1C:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_2BA]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_242]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1CA]
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
		lea	ax, [bp+var_152]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_144]
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
Midgame16_Play_8E910		endp

; START OF FUNCTION CHUNK FOR Midgame16_Play_8E910
off_91BA1	dw offset loc_8EB03
		dw offset loc_8EC7C
		dw offset loc_8EC7C
		dw offset loc_8EC7C
		dw offset loc_8EC7C
; END OF FUNCTION CHUNK FOR Midgame16_Play_8E910
ovr208		ends
