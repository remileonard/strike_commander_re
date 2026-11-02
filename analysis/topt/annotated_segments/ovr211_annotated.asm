ovr211		segment	para public 'OVERLAY' use16
		assume cs:ovr211
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9CBE0		proc far

var_D32		= word ptr -0D32h
var_D30		= word ptr -0D30h
var_D2E		= word ptr -0D2Eh
var_D2C		= word ptr -0D2Ch
var_D22		= word ptr -0D22h
var_CF0		= word ptr -0CF0h
var_CC5		= dword ptr -0CC5h
var_CC1		= dword ptr -0CC1h
var_CBD		= dword ptr -0CBDh
var_CB0		= dword ptr -0CB0h
var_CAC		= dword ptr -0CACh
var_C93		= dword ptr -0C93h
var_C8F		= dword ptr -0C8Fh
var_C8B		= dword ptr -0C8Bh
var_C7E		= word ptr -0C7Eh
var_C7A		= dword ptr -0C7Ah
var_C76		= word ptr -0C76h
var_C74		= word ptr -0C74h
var_C72		= word ptr -0C72h
var_C70		= dword ptr -0C70h
var_C6C		= byte ptr -0C6Ch
var_C6A		= word ptr -0C6Ah
var_C66		= word ptr -0C66h
var_C64		= byte ptr -0C64h
var_C60		= word ptr -0C60h
var_C56		= word ptr -0C56h
var_C54		= word ptr -0C54h
var_C52		= word ptr -0C52h
var_C50		= word ptr -0C50h
var_C4E		= dword ptr -0C4Eh
var_C4A		= byte ptr -0C4Ah
var_C48		= word ptr -0C48h
var_C46		= word ptr -0C46h
var_C32		= byte ptr -0C32h
var_C26		= word ptr -0C26h
var_C0E		= word ptr -0C0Eh
var_C0C		= word ptr -0C0Ch
var_BFA		= word ptr -0BFAh
var_BEC		= word ptr -0BECh
var_BD4		= word ptr -0BD4h
var_BD2		= word ptr -0BD2h
var_BC4		= dword ptr -0BC4h
var_BC0		= byte ptr -0BC0h
var_BBF		= byte ptr -0BBFh
var_BBE		= dword ptr -0BBEh
var_3B7		= dword ptr -3B7h
var_3B3		= dword ptr -3B3h
var_3AE		= word ptr -3AEh
var_3AC		= word ptr -3ACh
var_3AA		= word ptr -3AAh
var_3A8		= word ptr -3A8h
var_3A6		= dword ptr -3A6h
var_3A2		= byte ptr -3A2h
var_3A0		= word ptr -3A0h
var_328		= word ptr -328h
var_2B0		= word ptr -2B0h
var_238		= word ptr -238h
var_236		= word ptr -236h
var_234		= word ptr -234h
var_232		= word ptr -232h
var_230		= word ptr -230h
var_22E		= word ptr -22Eh
var_22A		= word ptr -22Ah
var_228		= word ptr -228h
var_226		= word ptr -226h
var_224		= word ptr -224h
var_222		= word ptr -222h
var_220		= word ptr -220h
var_21C		= word ptr -21Ch
var_1CC		= word ptr -1CCh
var_1A0		= word ptr -1A0h
var_176		= word ptr -176h
var_14C		= dword ptr -14Ch
var_148		= word ptr -148h
var_146		= dword ptr -146h
var_142		= dword ptr -142h
var_13E		= dword ptr -13Eh
var_13C		= dword ptr -13Ch
var_13A		= dword ptr -13Ah
var_136		= word ptr -136h
var_134		= dword ptr -134h
var_131		= word ptr -131h
var_130		= word ptr -130h
var_12E		= dword ptr -12Eh
var_12C		= dword ptr -12Ch
var_12A		= dword ptr -12Ah
var_128		= dword ptr -128h
var_126		= dword ptr -126h
var_124		= dword ptr -124h
var_122		= dword ptr -122h
var_120		= dword ptr -120h
var_11E		= dword ptr -11Eh
var_11C		= dword ptr -11Ch
var_11A		= dword ptr -11Ah
var_116		= word ptr -116h
var_114		= word ptr -114h
var_112		= dword ptr -112h
var_10E		= dword ptr -10Eh
var_10A		= byte ptr -10Ah
var_109		= byte ptr -109h
var_108		= dword ptr -108h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FC		= byte ptr -0FCh
var_FB		= byte ptr -0FBh
var_FA		= dword ptr -0FAh
var_F6		= dword ptr -0F6h
var_F2		= byte ptr -0F2h
var_F1		= byte ptr -0F1h
var_F0		= dword ptr -0F0h
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
var_66		= word ptr -66h
var_64		= byte ptr -64h
var_63		= word ptr -63h
var_60		= dword ptr -60h
var_5C		= byte ptr -5Ch
var_5B		= byte ptr -5Bh
var_5A		= dword ptr -5Ah
var_56		= word ptr -56h
var_54		= byte ptr -54h
var_53		= word ptr -53h
var_50		= dword ptr -50h
var_4C		= byte ptr -4Ch
var_4B		= byte ptr -4Bh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= byte ptr -42h
var_41		= byte ptr -41h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= byte ptr -38h
var_37		= byte ptr -37h
var_36		= dword ptr -36h
var_32		= byte ptr -32h
var_30		= dword ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= byte ptr -24h
var_22		= word ptr -22h
var_20		= byte ptr -20h
var_1C		= word ptr -1Ch
var_18		= word ptr -18h
var_15		= byte ptr -15h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0D22h
		push	si
		push	di
		mov	[bp+var_1], 0
		push	2C58h
		lea	ax, [bp+var_176]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	2C59h
		lea	ax, [bp+var_1A0]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	2C5Ah
		lea	ax, [bp+var_1CC]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_4], 2C5Bh
		mov	[bp+var_6], 2C5Eh
		mov	[bp+var_8], 2C60h
		mov	[bp+var_A], 2C62h
		mov	[bp+var_10], 0
		push	0C8h
		push	12h
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		mov	byte_4F55C, 0
		mov	[bp+var_13], 0
		mov	[bp+var_14], 0
		mov	[bp+var_15], 0
		cmp	word_4CA5B, 0
		jz	short loc_9CC63
		mov	[bp+var_14], 1

loc_9CC63:
		mov	ax, word_4D36E
		mov	[bp+var_18], ax
		mov	[bp+var_22A], 0
		mov	[bp+var_228], 0
		push	[bp+var_18]
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_238], 0
		mov	[bp+var_236], 0
		mov	[bp+var_234], 0
		mov	[bp+var_232], 0
		mov	[bp+var_230], 13Fh
		mov	[bp+var_22E], 9Dh
		push	0
		lea	ax, [bp+var_238]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_238]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_226], 0
		mov	[bp+var_224], 18h
		mov	[bp+var_222], 13Fh
		mov	[bp+var_220], 97h
		mov	byte ptr [bp+var_26], 0
		mov	byte ptr [bp+var_26+1], 0
		mov	[bp+var_24], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgames_32
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_21C]
		push	ax
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_2B0]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid33voc
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		cmp	[bp+var_14], 0
		jz	short loc_9CD9B
		push	ds
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_9CD9B
		push	1
		lea	ax, [bp+var_21C]
		push	ax
		lea	ax, [bp+var_328]
		push	ax
		mov	bx, [bp+var_328]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_328]
		push	ax
		call	sub_435F1
		add	sp, 2
		jmp	short loc_9CD9F

loc_9CD9B:
		mov	[bp+var_14], 0

loc_9CD9F:
		mov	[bp+var_30], 0
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		mov	al, byte_4CA58
		mov	[bp+var_32], al
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_32]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_9CDDA
		jmp	loc_9D0F0

loc_9CDDA:
		shl	bx, 1
		jmp	cs:off_A8065[bx]	; switch jump

loc_9CDE1:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_9CE0F
		jmp	loc_9CF19

loc_9CE0F:
		push	1
		lea	ax, [bp+var_21C]
		push	ax
		lea	ax, [bp+var_3A0]
		push	ax
		mov	bx, [bp+var_3A0]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_3A0]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_33
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_CF0]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_CF0], 480h
		mov	[bp+var_C8F], 100h
		mov	[bp+var_C93], 0
		mov	[bp+var_CF0], 498h
		push	1
		lea	ax, [bp+var_21C]
		push	ax
		lea	ax, [bp+var_CF0]
		push	ax
		mov	bx, [bp+var_CF0]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	di, 1
		jmp	short loc_9CEE1

loc_9CECB:
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	di

loc_9CEE1:
		cmp	di, 6Ah
		jle	short loc_9CECB
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_15], 1
		mov	[bp+var_CF0], 498h
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_CF0]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_9CF19:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_9CF57
		mov	[bp+var_13], 1
		mov	al, [bp+var_15]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9CF57
		mov	word_4F048, 5Ah

loc_9CF57:
		jmp	loc_9D0F0

loc_9CF5A:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_9CF88
		jmp	loc_9D08F

loc_9CF88:
		cmp	word_4CA5D, 0
		jnz	short loc_9CF92
		jmp	loc_9D08F

loc_9CF92:
		push	1
		lea	ax, [bp+var_21C]
		push	ax
		lea	ax, [bp+var_3A0]
		push	ax
		mov	bx, [bp+var_3A0]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_34
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_CF0]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_CF0], 480h
		mov	[bp+var_C8F], 100h
		mov	[bp+var_C93], 0
		mov	[bp+var_CF0], 498h
		push	1
		lea	ax, [bp+var_21C]
		push	ax
		lea	ax, [bp+var_CF0]
		push	ax
		mov	bx, [bp+var_CF0]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	di, 1
		jmp	short loc_9D057

loc_9D041:
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	di

loc_9D057:
		cmp	di, 6Ah
		jle	short loc_9D041
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_15], 1
		mov	[bp+var_CF0], 498h
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_CF0]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_9D08F:
		cmp	[bp+var_32], 3
		jnz	short loc_9D0B0
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_9D0C9

loc_9D0B0:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_9D0C9:
		push	ds
		lea	ax, [bp+var_21C]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_9D0EE
		mov	[bp+var_13], 1
		mov	al, [bp+var_15]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9D0EE
		mov	word_4F048, 0FFh

loc_9D0EE:
		jmp	short loc_9D0F0

loc_9D0F0:
		cmp	[bp+var_15], 0
		jnz	short loc_9D0F9
		jmp	loc_9D1EC

loc_9D0F9:
		mov	[bp+var_C52], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_C50], ax
		lea	ax, [bp+var_C52]
		mov	word_4D392, ax
		mov	[bp+var_C52], 1BCh
		mov	[bp+var_C4E], 0
		mov	[bp+var_C4A], 0
		mov	[bp+var_C56], 0
		mov	[bp+var_C54], 0FFFFh
		push	word_4CA5D
		lea	ax, [bp+var_C56]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C], 2
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		push	3
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	4Ch
		lea	ax, [bp+var_3A0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		lea	ax, word ptr [bp+var_120]
		push	ax
		lea	ax, [bp+var_C56]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_C56]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		cmp	byte ptr [bp+var_11C+1], 0
		jz	short loc_9D1B9
		cmp	[bp+var_120], 0
		jz	short loc_9D1B9
		push	0
		mov	al, byte ptr [bp+var_11C]
		push	ax
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9D1B9

loc_9D1B9:
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		lea	ax, [bp+var_C56]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_C52]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_9D1EC:
		mov	[bp+var_3AA], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_3A8], ax
		lea	ax, [bp+var_3AA]
		mov	word_4D392, ax
		mov	[bp+var_3AA], 1BCh
		mov	[bp+var_3A6], 0
		mov	[bp+var_3A2], 0
		mov	[bp+var_3AE], 0
		mov	[bp+var_3AC], 0FFFFh
		cmp	[bp+var_13], 0
		jnz	short loc_9D229
		jmp	loc_9D2A9

loc_9D229:
		push	1
		lea	ax, [bp+var_21C]
		push	ax
		lea	ax, word ptr [bp+var_CC1+1]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, word ptr [bp+var_CC1+1]
		push	ax
		call	sub_435F1
		add	sp, 2
		cmp	[bp+var_14], 0
		jz	short loc_9D257
		mov	byte ptr [bp+var_11A+3], 12h
		jmp	short loc_9D25C

loc_9D257:
		mov	byte ptr [bp+var_11A+3], 11h

loc_9D25C:
		push	3
		lea	ax, word ptr [bp+var_30]
		push	ax
		mov	al, byte ptr [bp+var_11A+3]
		mov	ah, 0
		push	ax
		lea	ax, word ptr [bp+var_CC1+1]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_3AE]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_30]
		push	ax
		lea	ax, [bp+var_3AE]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, word ptr [bp+var_CC1+1]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_9D2A9:
		mov	[bp+var_BD4], 129Fh
		mov	[bp+var_BC4], 0
		mov	[bp+var_BC0], 2
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		mov	[bp+var_BD2], 0
		mov	[bp+var_BD4], 1FA5h
		xor	eax, eax
		mov	[bp+var_3B7], eax
		mov	[bp+var_3B3], eax
		cmp	[bp+var_14], 0
		jz	short loc_9D2FE
		push	word_4CA5B
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		jmp	loc_9D6D6

loc_9D2FE:
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_35
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_CF0]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_CF0], 480h
		mov	[bp+var_C8F], 100h
		mov	[bp+var_C93], 0
		mov	[bp+var_CF0], 498h
		push	1
		lea	ax, [bp+var_21C]
		push	ax
		lea	ax, [bp+var_CF0]
		push	ax
		mov	bx, [bp+var_CF0]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3333474Dh
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		xor	di, di
		jmp	short loc_9D3CF

loc_9D386:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	ax, [bp+var_C7E]
		mov	word ptr [bp+var_11A+2], ax
		movsx	eax, word ptr [bp+var_11A+2]
		push	eax
		push	ds
		mov	ax, [bp+var_12]
		imul	di
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_C7A]
		mov	[bp+var_C8B], eax
		inc	di

loc_9D3CF:
		cmp	di, 12h
		jl	short loc_9D386
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9D41F
		push	[bp+arg_4]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_9D4BA

loc_9D41F:
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9D45C
		push	[bp+arg_0]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_9D4BA

loc_9D45C:
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9D499
		push	[bp+arg_2]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_9D4BA

loc_9D499:
		mov	ax, [bp+var_12]
		shl	ax, 1
		add	ax, [bp+var_12]
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_9D4BA:
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9D511
		push	[bp+var_4]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_0]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_9D5D4

loc_9D511:
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9D567
		push	[bp+var_4]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_2]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_9D5D4

loc_9D567:
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9D5BD
		push	[bp+var_4]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_4]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_9D5D4

loc_9D5BD:
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_9D5D4:
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9D614
		push	[bp+arg_4]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_9D6B4

loc_9D614:
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9D653
		push	[bp+arg_0]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_9D6B4

loc_9D653:
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9D692
		push	[bp+arg_2]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_9D6B4

loc_9D692:
		mov	ax, [bp+var_12]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_9D6B4:
		mov	[bp+var_CF0], 498h
		lea	ax, [bp+var_CF0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_CF0]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_9D6D6:
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9D717
		push	[bp+var_A]
		lea	ax, [bp+var_1CC]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_4]
		lea	ax, [bp+var_1CC]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_A]
		lea	ax, [bp+var_1CC]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_9D747

loc_9D717:
		push	[bp+var_A]
		lea	ax, [bp+var_1CC]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	2C91h
		lea	ax, [bp+var_1CC]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_A]
		lea	ax, [bp+var_1CC]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_9D747:
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		push	ax
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		pop	dx
		add	dx, ax
		inc	dx
		cmp	dx, 15h
		jbe	short loc_9D76B
		mov	[bp+var_1], 1

loc_9D76B:
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_9D7D9
		push	[bp+arg_0]
		lea	ax, [bp+var_176]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_9D7B7
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_9D7A5
		mov	[bp+var_1], 0
		jmp	short loc_9D7B5

loc_9D7A5:
		push	[bp+arg_2]
		lea	ax, [bp+var_1A0]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_9D7B5:
		jmp	short loc_9D7D7

loc_9D7B7:
		push	[bp+var_8]
		lea	ax, [bp+var_176]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_2]
		lea	ax, [bp+var_176]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_9D7D7:
		jmp	short loc_9D7ED

loc_9D7D9:
		mov	[bp+var_1], 0
		push	[bp+arg_2]
		lea	ax, [bp+var_176]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_9D7ED:
		lea	ax, [bp+var_176]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_9D80E
		push	2C99h
		lea	ax, [bp+var_176]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_9D80E:
		mov	[bp+var_3C], 0
		mov	[bp+var_38], 2
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		push	3
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	2Ah
		lea	ax, [bp+var_2B0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_46], 0
		mov	[bp+var_42], 2
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	3
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	2Ch
		lea	ax, [bp+var_2B0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_50], 0
		mov	[bp+var_4C], 2
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	0
		push	2
		lea	ax, word ptr [bp+var_50]
		push	ax
		call	ConvData_LoadNormalOrNight_10C9F
		add	sp, 6
		mov	[bp+var_53], 0
		lea	ax, word ptr [bp+var_50]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_60], 0
		mov	[bp+var_5C], 2
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	25h
		lea	ax, [bp+var_2B0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_63], 0
		lea	ax, word ptr [bp+var_60]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_70], 0
		mov	[bp+var_6C], 2
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	2Bh
		lea	ax, [bp+var_2B0]
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
		push	2Dh
		lea	ax, [bp+var_2B0]
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
		push	28h
		lea	ax, [bp+var_2B0]
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
		push	29h
		lea	ax, [bp+var_2B0]
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
		push	1Dh
		lea	ax, [bp+var_2B0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	21h
		lea	ax, [bp+var_2B0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_C4], 0
		mov	[bp+var_C0], 2
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		push	3
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	22h
		lea	ax, [bp+var_2B0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_CE], 0
		mov	[bp+var_CA], 2
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		push	3
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	23h
		lea	ax, [bp+var_2B0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_D8], 0
		mov	[bp+var_D4], 2
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	3
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	2CA7h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_E2], 0
		mov	[bp+var_DE], 2
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		push	3
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	2CADh
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_EC], 0
		mov	[bp+var_E8], 2
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		push	3
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	2CB1h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_F6], 0
		mov	[bp+var_F2], 2
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		push	3
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	2CB6h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_100], 0
		mov	[bp+var_FC], 2
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		push	ds
		push	offset aShp
		push	ds
		push	offset aConvfont_1
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_21C]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_104+2], dx
		mov	word ptr [bp+var_104], ax
		mov	eax, [bp+var_104]
		mov	[bp+var_100], eax
		mov	[bp+var_FC], 2
		mov	[bp+var_FB], 1
		mov	[bp+var_FA], 0
		lea	ax, word ptr [bp+var_100]
		push	ax
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		lea	ax, [bp+var_BEC]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	[bp+var_D32], 0
		mov	[bp+var_D30], 98h
		mov	[bp+var_D2E], 13Fh
		mov	[bp+var_D2C], 0C7h
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0C8h
		lea	ax, [bp+var_C0E]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_10E], 0
		mov	[bp+var_10A], 2
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		push	ds
		push	offset aShp
		push	ds
		push	offset aGravfont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_21C]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_112+2], dx
		mov	word ptr [bp+var_112], ax
		mov	eax, [bp+var_112]
		mov	[bp+var_10E], eax
		mov	[bp+var_10A], 2
		mov	[bp+var_109], 1
		mov	[bp+var_108], 0
		lea	ax, word ptr [bp+var_10E]
		push	ax
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		lea	ax, [bp+var_C26]
		push	ax
		lea	ax, [bp+var_238]
		push	ax
		sub	sp, 8
		mov	[bp+var_D32], 5Eh
		mov	[bp+var_D30], 40h
		mov	[bp+var_D2E], 87h
		mov	[bp+var_D2C], 14h
		lea	ax, [bp+var_C48]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		mov	[bp+var_C32], 2
		cmp	byte_4F55C, 0
		jnz	short loc_9DD08
		jmp	loc_9E2E6

loc_9DD08:
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_9DD4C
		cmp	[bp+var_10E], 0
		jz	short loc_9DD4C
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9DD4C

loc_9DD4C:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_9DDA7
		cmp	[bp+var_100], 0
		jz	short loc_9DDA7
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9DDA7

loc_9DDA7:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_9DDE6
		cmp	[bp+var_F6], 0
		jz	short loc_9DDE6
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9DDE6

loc_9DDE6:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_9DE25
		cmp	[bp+var_EC], 0
		jz	short loc_9DE25
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9DE25

loc_9DE25:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_9DE64
		cmp	[bp+var_E2], 0
		jz	short loc_9DE64
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9DE64

loc_9DE64:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_9DEA3
		cmp	[bp+var_D8], 0
		jz	short loc_9DEA3
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9DEA3

loc_9DEA3:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_9DEE2
		cmp	[bp+var_CE], 0
		jz	short loc_9DEE2
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9DEE2

loc_9DEE2:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_9DF21
		cmp	[bp+var_C4], 0
		jz	short loc_9DF21
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9DF21

loc_9DF21:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_9DF60
		cmp	[bp+var_BA], 0
		jz	short loc_9DF60
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9DF60

loc_9DF60:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_9DF9F
		cmp	[bp+var_B0], 0
		jz	short loc_9DF9F
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9DF9F

loc_9DF9F:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_9DFEB
		cmp	[bp+var_A0], 0
		jz	short loc_9DFEB
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9DFEB

loc_9DFEB:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_9E037
		cmp	[bp+var_90], 0
		jz	short loc_9E037
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E037

loc_9E037:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_9E07F
		cmp	[bp+var_80], 0
		jz	short loc_9E07F
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E07F

loc_9E07F:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_9E0C3
		cmp	[bp+var_70], 0
		jz	short loc_9E0C3
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E0C3

loc_9E0C3:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_9E107
		cmp	[bp+var_60], 0
		jz	short loc_9E107
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E107

loc_9E107:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_9E14B
		cmp	[bp+var_50], 0
		jz	short loc_9E14B
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E14B

loc_9E14B:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_9E183
		cmp	[bp+var_46], 0
		jz	short loc_9E183
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E183

loc_9E183:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_9E1BB
		cmp	[bp+var_3C], 0
		jz	short loc_9E1BB
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E1BB

loc_9E1BB:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_9E20A
		cmp	[bp+var_BC4], 0
		jz	short loc_9E20A
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E20A

loc_9E20A:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_9E270
		cmp	[bp+var_30], 0
		jz	short loc_9E270
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E270

loc_9E270:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_9E2E6:
		cmp	[bp+var_13], 0
		jz	short loc_9E330
		mov	ax, word_4F048
		mov	[bp+var_114], ax
		mov	[bp+var_116], 0
		cmp	[bp+var_3AE], 0
		jz	short loc_9E330
		push	[bp+var_3AC]
		mov	bx, [bp+var_3AE]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_116]
		push	[bp+var_114]
		push	[bp+var_3AC]
		mov	bx, [bp+var_3AE]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_9E330

loc_9E330:
		lea	ax, [bp+var_22A]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11A+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11A], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11C], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11E], ax
		push	[bp+var_66]
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_11A+2]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_11A]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_11C]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_11E]
		lea	ax, [bp+var_C6A]
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
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	[bp+var_66]
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_FadeFromColor_34EEE
		add	sp, 0Ah
		cmp	[bp+var_14], 0
		jnz	short loc_9E494
		jmp	loc_9E59C

loc_9E494:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_128], 0
		mov	byte ptr [bp+var_124], 2
		mov	byte ptr [bp+var_124+1], 0
		mov	[bp+var_122], 0
		push	2
		lea	ax, word ptr [bp+var_128]
		push	ax
		push	0
		lea	ax, [bp+var_328]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_128]
		push	ax
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_9E4F7

loc_9E4E9:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_9E4F7:
		cmp	di, 4
		jl	short loc_9E4E9
		push	0FFFFh
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_9E525

loc_9E50D:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9E518
		jmp	short loc_9E536

loc_9E518:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9E525:
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_9E50D

loc_9E536:
		xor	di, di
		jmp	short loc_9E548

loc_9E53A:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_9E548:
		cmp	di, 4
		jl	short loc_9E53A
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_124+1], 0
		jz	short loc_9E582
		cmp	[bp+var_128], 0
		jz	short loc_9E582
		push	0
		mov	al, byte ptr [bp+var_124]
		push	ax
		lea	ax, word ptr [bp+var_128]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E582

loc_9E582:
		mov	[bp+var_128], 0
		mov	byte ptr [bp+var_124+1], 0
		mov	[bp+var_122], 0
		jmp	loc_9ECE3

loc_9E59C:
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0Ch
		lea	ax, [bp+var_C0E]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_E], 35h
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	short loc_9E635

loc_9E5DA:
		mov	di, word ptr [bp+var_C4E+1]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_9E5F7
		push	[bp+var_10]
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_9E5F7:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_9E60E
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9E60E:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9E628
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_9E652

loc_9E628:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9E635:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_9E645
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_9E64A

loc_9E645:
		mov	ax, 1
		jmp	short loc_9E64C

loc_9E64A:
		xor	ax, ax

loc_9E64C:
		mov	ah, 0
		or	ax, ax
		jz	short loc_9E5DA

loc_9E652:
		cmp	byte_4F55C, 0
		jnz	short loc_9E65C
		jmp	loc_9EC49

loc_9E65C:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_9E6AF
		cmp	[bp+var_10E], 0
		jz	short loc_9E6AF
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E6AF

loc_9E6AF:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_9E70A
		cmp	[bp+var_100], 0
		jz	short loc_9E70A
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E70A

loc_9E70A:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_9E749
		cmp	[bp+var_F6], 0
		jz	short loc_9E749
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E749

loc_9E749:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_9E788
		cmp	[bp+var_EC], 0
		jz	short loc_9E788
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E788

loc_9E788:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_9E7C7
		cmp	[bp+var_E2], 0
		jz	short loc_9E7C7
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E7C7

loc_9E7C7:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_9E806
		cmp	[bp+var_D8], 0
		jz	short loc_9E806
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E806

loc_9E806:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_9E845
		cmp	[bp+var_CE], 0
		jz	short loc_9E845
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E845

loc_9E845:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_9E884
		cmp	[bp+var_C4], 0
		jz	short loc_9E884
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E884

loc_9E884:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_9E8C3
		cmp	[bp+var_BA], 0
		jz	short loc_9E8C3
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E8C3

loc_9E8C3:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_9E902
		cmp	[bp+var_B0], 0
		jz	short loc_9E902
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E902

loc_9E902:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_9E94E
		cmp	[bp+var_A0], 0
		jz	short loc_9E94E
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E94E

loc_9E94E:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_9E99A
		cmp	[bp+var_90], 0
		jz	short loc_9E99A
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E99A

loc_9E99A:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_9E9E2
		cmp	[bp+var_80], 0
		jz	short loc_9E9E2
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9E9E2

loc_9E9E2:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_9EA26
		cmp	[bp+var_70], 0
		jz	short loc_9EA26
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EA26

loc_9EA26:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_9EA6A
		cmp	[bp+var_60], 0
		jz	short loc_9EA6A
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EA6A

loc_9EA6A:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_9EAAE
		cmp	[bp+var_50], 0
		jz	short loc_9EAAE
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EAAE

loc_9EAAE:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_9EAE6
		cmp	[bp+var_46], 0
		jz	short loc_9EAE6
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EAE6

loc_9EAE6:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_9EB1E
		cmp	[bp+var_3C], 0
		jz	short loc_9EB1E
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EB1E

loc_9EB1E:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_9EB6D
		cmp	[bp+var_BC4], 0
		jz	short loc_9EB6D
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EB6D

loc_9EB6D:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_9EBD3
		cmp	[bp+var_30], 0
		jz	short loc_9EBD3
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EBD3

loc_9EBD3:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_9EC49:
		mov	[bp+var_E], 3Dh
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	short loc_9ECC6

loc_9EC69:
		mov	di, word ptr [bp+var_C4E+1]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_9EC88
		mov	ax, [bp+var_10]
		add	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_9EC88:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_9EC9F
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9EC9F:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9ECB9
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_9ECE3

loc_9ECB9:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9ECC6:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_9ECD6
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_9ECDB

loc_9ECD6:
		mov	ax, 1
		jmp	short loc_9ECDD

loc_9ECDB:
		xor	ax, ax

loc_9ECDD:
		mov	ah, 0
		or	ax, ax
		jz	short loc_9EC69

loc_9ECE3:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_9ECFC
		jmp	loc_9F2DA

loc_9ECFC:
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_9ED40
		cmp	[bp+var_10E], 0
		jz	short loc_9ED40
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9ED40

loc_9ED40:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_9ED9B
		cmp	[bp+var_100], 0
		jz	short loc_9ED9B
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9ED9B

loc_9ED9B:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_9EDDA
		cmp	[bp+var_F6], 0
		jz	short loc_9EDDA
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EDDA

loc_9EDDA:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_9EE19
		cmp	[bp+var_EC], 0
		jz	short loc_9EE19
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EE19

loc_9EE19:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_9EE58
		cmp	[bp+var_E2], 0
		jz	short loc_9EE58
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EE58

loc_9EE58:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_9EE97
		cmp	[bp+var_D8], 0
		jz	short loc_9EE97
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EE97

loc_9EE97:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_9EED6
		cmp	[bp+var_CE], 0
		jz	short loc_9EED6
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EED6

loc_9EED6:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_9EF15
		cmp	[bp+var_C4], 0
		jz	short loc_9EF15
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EF15

loc_9EF15:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_9EF54
		cmp	[bp+var_BA], 0
		jz	short loc_9EF54
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EF54

loc_9EF54:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_9EF93
		cmp	[bp+var_B0], 0
		jz	short loc_9EF93
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EF93

loc_9EF93:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_9EFDF
		cmp	[bp+var_A0], 0
		jz	short loc_9EFDF
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9EFDF

loc_9EFDF:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_9F02B
		cmp	[bp+var_90], 0
		jz	short loc_9F02B
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F02B

loc_9F02B:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_9F073
		cmp	[bp+var_80], 0
		jz	short loc_9F073
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F073

loc_9F073:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_9F0B7
		cmp	[bp+var_70], 0
		jz	short loc_9F0B7
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F0B7

loc_9F0B7:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_9F0FB
		cmp	[bp+var_60], 0
		jz	short loc_9F0FB
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F0FB

loc_9F0FB:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_9F13F
		cmp	[bp+var_50], 0
		jz	short loc_9F13F
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F13F

loc_9F13F:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_9F177
		cmp	[bp+var_46], 0
		jz	short loc_9F177
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F177

loc_9F177:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_9F1AF
		cmp	[bp+var_3C], 0
		jz	short loc_9F1AF
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F1AF

loc_9F1AF:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_9F1FE
		cmp	[bp+var_BC4], 0
		jz	short loc_9F1FE
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F1FE

loc_9F1FE:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_9F264
		cmp	[bp+var_30], 0
		jz	short loc_9F264
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F264

loc_9F264:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_9F2DA:
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C], 2
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		push	3
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	20h
		lea	ax, [bp+var_2B0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_12A], 0
		mov	byte ptr [bp+var_126], 2
		mov	byte ptr [bp+var_126+1], 0
		mov	[bp+var_124], 0
		push	3
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	27h
		lea	ax, [bp+var_2B0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_22A]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_12C], ax
		cmp	[bp+var_1], 0
		jz	short loc_9F386
		mov	word ptr [bp+var_12E], 0
		mov	[bp+var_130], 7
		mov	word ptr [bp+var_134+2], 0Eh
		jmp	short loc_9F398

loc_9F386:
		mov	word ptr [bp+var_12E], 4
		mov	[bp+var_130], 0Bh
		mov	word ptr [bp+var_134+2], 0

loc_9F398:
		push	word ptr [bp+var_12E]
		push	0
		lea	ax, [bp+var_C48]
		push	ax
		push	0
		call	TextLayer_Construct_F542
		add	sp, 8
		mov	word ptr [bp+var_134], ax
		push	[bp+var_130]
		push	0
		lea	ax, [bp+var_C48]
		push	ax
		push	0
		call	TextLayer_Construct_F542
		add	sp, 8
		mov	[bp+var_136], ax
		push	word ptr [bp+var_134+2]
		push	0
		lea	ax, [bp+var_C48]
		push	ax
		push	0
		call	TextLayer_Construct_F542
		add	sp, 8
		mov	word ptr [bp+var_13A+2], ax
		push	word ptr [bp+var_12C]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_9F462
		lea	ax, [bp+var_176]
		push	ax
		push	word ptr [bp+var_134]
		call	TextLayer_SetText_F608
		add	sp, 4
		lea	ax, [bp+var_1A0]
		push	ax
		push	[bp+var_136]
		call	TextLayer_SetText_F608
		add	sp, 4
		lea	ax, [bp+var_1CC]
		push	ax
		push	word ptr [bp+var_13A+2]
		call	TextLayer_SetText_F608
		add	sp, 4
		push	word ptr [bp+var_134]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_136]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_13A+2]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_9F4C0

loc_9F462:
		lea	ax, [bp+var_176]
		push	ax
		push	word ptr [bp+var_134]
		call	TextLayer_SetText_F608
		add	sp, 4
		lea	ax, [bp+var_1CC]
		push	ax
		push	[bp+var_136]
		call	TextLayer_SetText_F608
		add	sp, 4
		push	word ptr [bp+var_134]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_136]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	word ptr [bp+var_13A+2], 0
		jz	short loc_9F4C0
		push	3
		push	word ptr [bp+var_13A+2]
		mov	bx, word ptr [bp+var_13A+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_9F4C0

loc_9F4C0:
		push	[bp+var_A6]
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_14], 0
		jnz	short loc_9F506
		jmp	loc_9FDBA

loc_9F506:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_142], 0
		mov	byte ptr [bp+var_13E], 2
		mov	byte ptr [bp+var_13E+1], 0
		mov	[bp+var_13C], 0
		push	2
		lea	ax, word ptr [bp+var_142]
		push	ax
		push	1
		lea	ax, [bp+var_328]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_142]
		push	ax
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_9F569

loc_9F55B:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_9F569:
		cmp	di, 2
		jl	short loc_9F55B
		push	0FFFFh
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_9F597

loc_9F57F:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9F58A
		jmp	short loc_9F5A8

loc_9F58A:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9F597:
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_9F57F

loc_9F5A8:
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte_4F55C, 0
		jnz	short loc_9F5BF
		jmp	loc_9FC69

loc_9F5BF:
		cmp	byte ptr [bp+var_13E+1], 0
		jz	short loc_9F5E7
		cmp	[bp+var_142], 0
		jz	short loc_9F5E7
		push	0
		mov	al, byte ptr [bp+var_13E]
		push	ax
		lea	ax, word ptr [bp+var_142]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F5E7

loc_9F5E7:
		mov	[bp+var_142], 0
		mov	byte ptr [bp+var_13E+1], 0
		mov	[bp+var_13C], 0
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_126+1], 0
		jz	short loc_9F635
		cmp	[bp+var_12A], 0
		jz	short loc_9F635
		push	0
		mov	al, byte ptr [bp+var_126]
		push	ax
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F635

loc_9F635:
		mov	[bp+var_12A], 0
		mov	byte ptr [bp+var_126+1], 0
		mov	[bp+var_124], 0
		cmp	byte ptr [bp+var_11C+1], 0
		jz	short loc_9F674
		cmp	[bp+var_120], 0
		jz	short loc_9F674
		push	0
		mov	al, byte ptr [bp+var_11C]
		push	ax
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F674

loc_9F674:
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_9F6CF
		cmp	[bp+var_10E], 0
		jz	short loc_9F6CF
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F6CF

loc_9F6CF:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_9F72A
		cmp	[bp+var_100], 0
		jz	short loc_9F72A
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F72A

loc_9F72A:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_9F769
		cmp	[bp+var_F6], 0
		jz	short loc_9F769
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F769

loc_9F769:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_9F7A8
		cmp	[bp+var_EC], 0
		jz	short loc_9F7A8
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F7A8

loc_9F7A8:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_9F7E7
		cmp	[bp+var_E2], 0
		jz	short loc_9F7E7
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F7E7

loc_9F7E7:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_9F826
		cmp	[bp+var_D8], 0
		jz	short loc_9F826
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F826

loc_9F826:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_9F865
		cmp	[bp+var_CE], 0
		jz	short loc_9F865
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F865

loc_9F865:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_9F8A4
		cmp	[bp+var_C4], 0
		jz	short loc_9F8A4
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F8A4

loc_9F8A4:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_9F8E3
		cmp	[bp+var_BA], 0
		jz	short loc_9F8E3
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F8E3

loc_9F8E3:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_9F922
		cmp	[bp+var_B0], 0
		jz	short loc_9F922
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F922

loc_9F922:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_9F96E
		cmp	[bp+var_A0], 0
		jz	short loc_9F96E
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F96E

loc_9F96E:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_9F9BA
		cmp	[bp+var_90], 0
		jz	short loc_9F9BA
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9F9BA

loc_9F9BA:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_9FA02
		cmp	[bp+var_80], 0
		jz	short loc_9FA02
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FA02

loc_9FA02:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_9FA46
		cmp	[bp+var_70], 0
		jz	short loc_9FA46
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FA46

loc_9FA46:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_9FA8A
		cmp	[bp+var_60], 0
		jz	short loc_9FA8A
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FA8A

loc_9FA8A:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_9FACE
		cmp	[bp+var_50], 0
		jz	short loc_9FACE
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FACE

loc_9FACE:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_9FB06
		cmp	[bp+var_46], 0
		jz	short loc_9FB06
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FB06

loc_9FB06:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_9FB3E
		cmp	[bp+var_3C], 0
		jz	short loc_9FB3E
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FB3E

loc_9FB3E:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_9FB8D
		cmp	[bp+var_BC4], 0
		jz	short loc_9FB8D
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FB8D

loc_9FB8D:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_9FBF3
		cmp	[bp+var_30], 0
		jz	short loc_9FBF3
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FBF3

loc_9FBF3:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_9FC69:
		xor	di, di
		jmp	short loc_9FC7B

loc_9FC6D:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_9FC7B:
		cmp	di, 4
		jl	short loc_9FC6D
		mov	[bp+var_14C], 0
		mov	byte ptr [bp+var_148], 2
		mov	byte ptr [bp+var_148+1], 0
		mov	[bp+var_146], 0
		push	2
		lea	ax, word ptr [bp+var_14C]
		push	ax
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_14C]
		push	ax
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_9FCD6

loc_9FCC8:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_9FCD6:
		cmp	di, 4
		jl	short loc_9FCC8
		push	0FFFFh
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_9FD04

loc_9FCEC:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9FCF7
		jmp	short loc_9FD15

loc_9FCF7:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9FD04:
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_9FCEC

loc_9FD15:
		xor	di, di
		jmp	short loc_9FD27

loc_9FD19:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_9FD27:
		cmp	di, 4
		jl	short loc_9FD19
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_148+1], 0
		jz	short loc_9FD61
		cmp	[bp+var_14C], 0
		jz	short loc_9FD61
		push	0
		mov	al, byte ptr [bp+var_148]
		push	ax
		lea	ax, word ptr [bp+var_14C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FD61

loc_9FD61:
		mov	[bp+var_14C], 0
		mov	byte ptr [bp+var_148+1], 0
		mov	[bp+var_146], 0
		cmp	byte ptr [bp+var_13E+1], 0
		jz	short loc_9FDA0
		cmp	[bp+var_142], 0
		jz	short loc_9FDA0
		push	0
		mov	al, byte ptr [bp+var_13E]
		push	ax
		lea	ax, word ptr [bp+var_142]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FDA0

loc_9FDA0:
		mov	[bp+var_142], 0
		mov	byte ptr [bp+var_13E+1], 0
		mov	[bp+var_13C], 0
		jmp	loc_A058D

loc_9FDBA:
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0FEh
		lea	ax, [bp+var_C0E]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_E], 42h
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	short loc_9FE5C

loc_9FDF9:
		mov	di, word ptr [bp+var_C4E+1]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_9FE1E
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_9FE1E:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_9FE35
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_9FE35:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_9FE4F
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_9FE79

loc_9FE4F:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_9FE5C:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_9FE6C
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_9FE71

loc_9FE6C:
		mov	ax, 1
		jmp	short loc_9FE73

loc_9FE71:
		xor	ax, ax

loc_9FE73:
		mov	ah, 0
		or	ax, ax
		jz	short loc_9FDF9

loc_9FE79:
		cmp	byte_4F55C, 0
		jnz	short loc_9FE83
		jmp	loc_A04EE

loc_9FE83:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_126+1], 0
		jz	short loc_9FEBA
		cmp	[bp+var_12A], 0
		jz	short loc_9FEBA
		push	0
		mov	al, byte ptr [bp+var_126]
		push	ax
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FEBA

loc_9FEBA:
		mov	[bp+var_12A], 0
		mov	byte ptr [bp+var_126+1], 0
		mov	[bp+var_124], 0
		cmp	byte ptr [bp+var_11C+1], 0
		jz	short loc_9FEF9
		cmp	[bp+var_120], 0
		jz	short loc_9FEF9
		push	0
		mov	al, byte ptr [bp+var_11C]
		push	ax
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FEF9

loc_9FEF9:
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_9FF54
		cmp	[bp+var_10E], 0
		jz	short loc_9FF54
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FF54

loc_9FF54:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_9FFAF
		cmp	[bp+var_100], 0
		jz	short loc_9FFAF
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FFAF

loc_9FFAF:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_9FFEE
		cmp	[bp+var_F6], 0
		jz	short loc_9FFEE
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9FFEE

loc_9FFEE:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A002D
		cmp	[bp+var_EC], 0
		jz	short loc_A002D
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A002D

loc_A002D:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A006C
		cmp	[bp+var_E2], 0
		jz	short loc_A006C
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A006C

loc_A006C:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A00AB
		cmp	[bp+var_D8], 0
		jz	short loc_A00AB
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A00AB

loc_A00AB:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A00EA
		cmp	[bp+var_CE], 0
		jz	short loc_A00EA
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A00EA

loc_A00EA:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A0129
		cmp	[bp+var_C4], 0
		jz	short loc_A0129
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0129

loc_A0129:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A0168
		cmp	[bp+var_BA], 0
		jz	short loc_A0168
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0168

loc_A0168:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A01A7
		cmp	[bp+var_B0], 0
		jz	short loc_A01A7
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A01A7

loc_A01A7:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A01F3
		cmp	[bp+var_A0], 0
		jz	short loc_A01F3
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A01F3

loc_A01F3:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A023F
		cmp	[bp+var_90], 0
		jz	short loc_A023F
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A023F

loc_A023F:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A0287
		cmp	[bp+var_80], 0
		jz	short loc_A0287
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0287

loc_A0287:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A02CB
		cmp	[bp+var_70], 0
		jz	short loc_A02CB
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A02CB

loc_A02CB:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A030F
		cmp	[bp+var_60], 0
		jz	short loc_A030F
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A030F

loc_A030F:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A0353
		cmp	[bp+var_50], 0
		jz	short loc_A0353
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0353

loc_A0353:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A038B
		cmp	[bp+var_46], 0
		jz	short loc_A038B
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A038B

loc_A038B:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A03C3
		cmp	[bp+var_3C], 0
		jz	short loc_A03C3
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A03C3

loc_A03C3:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A0412
		cmp	[bp+var_BC4], 0
		jz	short loc_A0412
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0412

loc_A0412:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A0478
		cmp	[bp+var_30], 0
		jz	short loc_A0478
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0478

loc_A0478:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A04EE:
		mov	[bp+var_E], 46h
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	short loc_A0570

loc_A050E:
		mov	di, word ptr [bp+var_C4E+1]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_A0532
		mov	ax, [bp+var_12]
		shl	ax, 2
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A0532:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_A0549
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A0549:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A0563
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_A058D

loc_A0563:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A0570:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A0580
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A0585

loc_A0580:
		mov	ax, 1
		jmp	short loc_A0587

loc_A0585:
		xor	ax, ax

loc_A0587:
		mov	ah, 0
		or	ax, ax
		jz	short loc_A050E

loc_A058D:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_126+1], 0
		jz	short loc_A05C4
		cmp	[bp+var_12A], 0
		jz	short loc_A05C4
		push	0
		mov	al, byte ptr [bp+var_126]
		push	ax
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A05C4

loc_A05C4:
		mov	[bp+var_12A], 0
		mov	byte ptr [bp+var_126+1], 0
		mov	[bp+var_124], 0
		cmp	byte ptr [bp+var_11C+1], 0
		jz	short loc_A0603
		cmp	[bp+var_120], 0
		jz	short loc_A0603
		push	0
		mov	al, byte ptr [bp+var_11C]
		push	ax
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0603

loc_A0603:
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		cmp	byte_4F55C, 0
		jnz	short loc_A0624
		jmp	loc_A0C02

loc_A0624:
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A0668
		cmp	[bp+var_10E], 0
		jz	short loc_A0668
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0668

loc_A0668:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A06C3
		cmp	[bp+var_100], 0
		jz	short loc_A06C3
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A06C3

loc_A06C3:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A0702
		cmp	[bp+var_F6], 0
		jz	short loc_A0702
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0702

loc_A0702:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A0741
		cmp	[bp+var_EC], 0
		jz	short loc_A0741
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0741

loc_A0741:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A0780
		cmp	[bp+var_E2], 0
		jz	short loc_A0780
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0780

loc_A0780:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A07BF
		cmp	[bp+var_D8], 0
		jz	short loc_A07BF
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A07BF

loc_A07BF:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A07FE
		cmp	[bp+var_CE], 0
		jz	short loc_A07FE
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A07FE

loc_A07FE:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A083D
		cmp	[bp+var_C4], 0
		jz	short loc_A083D
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A083D

loc_A083D:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A087C
		cmp	[bp+var_BA], 0
		jz	short loc_A087C
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A087C

loc_A087C:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A08BB
		cmp	[bp+var_B0], 0
		jz	short loc_A08BB
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A08BB

loc_A08BB:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A0907
		cmp	[bp+var_A0], 0
		jz	short loc_A0907
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0907

loc_A0907:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A0953
		cmp	[bp+var_90], 0
		jz	short loc_A0953
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0953

loc_A0953:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A099B
		cmp	[bp+var_80], 0
		jz	short loc_A099B
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A099B

loc_A099B:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A09DF
		cmp	[bp+var_70], 0
		jz	short loc_A09DF
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A09DF

loc_A09DF:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A0A23
		cmp	[bp+var_60], 0
		jz	short loc_A0A23
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0A23

loc_A0A23:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A0A67
		cmp	[bp+var_50], 0
		jz	short loc_A0A67
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0A67

loc_A0A67:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A0A9F
		cmp	[bp+var_46], 0
		jz	short loc_A0A9F
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0A9F

loc_A0A9F:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A0AD7
		cmp	[bp+var_3C], 0
		jz	short loc_A0AD7
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0AD7

loc_A0AD7:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A0B26
		cmp	[bp+var_BC4], 0
		jz	short loc_A0B26
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0B26

loc_A0B26:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A0B8C
		cmp	[bp+var_30], 0
		jz	short loc_A0B8C
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0B8C

loc_A0B8C:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A0C02:
		lea	ax, [bp+var_22A]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11A+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	di, ax
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	word ptr [bp+var_11A+2]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_56]
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_14], 0
		jnz	short loc_A0CE6
		jmp	loc_A149F

loc_A0CE6:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_122], 0
		mov	byte ptr [bp+var_11E], 2
		mov	byte ptr [bp+var_11E+1], 0
		mov	[bp+var_11C], 0
		push	2
		lea	ax, word ptr [bp+var_122]
		push	ax
		push	3
		lea	ax, [bp+var_328]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_122]
		push	ax
		push	di
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_124], 0
		jmp	loc_A0DEC

loc_A0D3E:
		cmp	word ptr [bp+var_124], 5
		jnz	short loc_A0D50
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A0D50:
		cmp	word ptr [bp+var_124], 6
		jnz	short loc_A0D62
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A0D62:
		cmp	word ptr [bp+var_124], 9
		jnz	short loc_A0D74
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A0D74:
		cmp	word ptr [bp+var_124], 0Ah
		jnz	short loc_A0D86
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A0D86:
		cmp	word ptr [bp+var_124], 0Fh
		jnz	short loc_A0D98
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A0D98:
		cmp	word ptr [bp+var_124], 10h
		jnz	short loc_A0DAA
		push	0FFFFh
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A0DAA:
		cmp	word ptr [bp+var_124], 13h
		jnz	short loc_A0DBC
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A0DBC:
		mov	ax, word ptr [bp+var_124]
		inc	word ptr [bp+var_124]
		cmp	ax, 14h
		jnz	short loc_A0DD4
		push	0FFFFh
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A0DD4:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A0DDF
		jmp	short loc_A0DFC

loc_A0DDF:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A0DEC:
		push	di
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jz	short loc_A0DFC
		jmp	loc_A0D3E

loc_A0DFC:
		cmp	byte_4F55C, 0
		jnz	short loc_A0E06
		jmp	loc_A1432

loc_A0E06:
		cmp	byte ptr [bp+var_11E+1], 0
		jz	short loc_A0E2E
		cmp	[bp+var_122], 0
		jz	short loc_A0E2E
		push	0
		mov	al, byte ptr [bp+var_11E]
		push	ax
		lea	ax, word ptr [bp+var_122]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0E2E

loc_A0E2E:
		mov	[bp+var_122], 0
		mov	byte ptr [bp+var_11E+1], 0
		mov	[bp+var_11C], 0
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A0E98
		cmp	[bp+var_10E], 0
		jz	short loc_A0E98
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0E98

loc_A0E98:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A0EF3
		cmp	[bp+var_100], 0
		jz	short loc_A0EF3
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0EF3

loc_A0EF3:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A0F32
		cmp	[bp+var_F6], 0
		jz	short loc_A0F32
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0F32

loc_A0F32:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A0F71
		cmp	[bp+var_EC], 0
		jz	short loc_A0F71
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0F71

loc_A0F71:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A0FB0
		cmp	[bp+var_E2], 0
		jz	short loc_A0FB0
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0FB0

loc_A0FB0:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A0FEF
		cmp	[bp+var_D8], 0
		jz	short loc_A0FEF
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A0FEF

loc_A0FEF:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A102E
		cmp	[bp+var_CE], 0
		jz	short loc_A102E
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A102E

loc_A102E:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A106D
		cmp	[bp+var_C4], 0
		jz	short loc_A106D
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A106D

loc_A106D:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A10AC
		cmp	[bp+var_BA], 0
		jz	short loc_A10AC
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A10AC

loc_A10AC:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A10EB
		cmp	[bp+var_B0], 0
		jz	short loc_A10EB
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A10EB

loc_A10EB:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A1137
		cmp	[bp+var_A0], 0
		jz	short loc_A1137
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1137

loc_A1137:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A1183
		cmp	[bp+var_90], 0
		jz	short loc_A1183
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1183

loc_A1183:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A11CB
		cmp	[bp+var_80], 0
		jz	short loc_A11CB
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A11CB

loc_A11CB:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A120F
		cmp	[bp+var_70], 0
		jz	short loc_A120F
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A120F

loc_A120F:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A1253
		cmp	[bp+var_60], 0
		jz	short loc_A1253
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1253

loc_A1253:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A1297
		cmp	[bp+var_50], 0
		jz	short loc_A1297
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1297

loc_A1297:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A12CF
		cmp	[bp+var_46], 0
		jz	short loc_A12CF
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A12CF

loc_A12CF:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A1307
		cmp	[bp+var_3C], 0
		jz	short loc_A1307
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1307

loc_A1307:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A1356
		cmp	[bp+var_BC4], 0
		jz	short loc_A1356
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1356

loc_A1356:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A13BC
		cmp	[bp+var_30], 0
		jz	short loc_A13BC
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A13BC

loc_A13BC:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A1432:
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	word ptr [bp+var_124], 0
		jmp	short loc_A1456

loc_A1445:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_124]

loc_A1456:
		cmp	word ptr [bp+var_124], 8
		jl	short loc_A1445
		cmp	byte ptr [bp+var_11E+1], 0
		jz	short loc_A1485
		cmp	[bp+var_122], 0
		jz	short loc_A1485
		push	0
		mov	al, byte ptr [bp+var_11E]
		push	ax
		lea	ax, word ptr [bp+var_122]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1485

loc_A1485:
		mov	[bp+var_122], 0
		mov	byte ptr [bp+var_11E+1], 0
		mov	[bp+var_11C], 0
		jmp	loc_A23FA

loc_A149F:
		push	0FEh
		push	[bp+var_BFA]
		mov	bx, [bp+var_BFA]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_E], 30h
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A15B0

loc_A14D3:
		mov	ax, word ptr [bp+var_C4E+1]
		mov	word ptr [bp+var_11A], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1501
		mov	ax, [bp+var_12]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A1501:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1518
		push	2CCFh
		push	di
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_A1518:
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A152E
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A152E:
		mov	ax, si
		add	ax, 10h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1544
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A1544:
		mov	ax, si
		add	ax, 13h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A155A
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A155A:
		mov	ax, si
		add	ax, 14h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1570
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A1570:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1589
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A1589:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A15A3
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_A15D0

loc_A15A3:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A15B0:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A15C0
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A15C5

loc_A15C0:
		mov	ax, 1
		jmp	short loc_A15C7

loc_A15C5:
		xor	ax, ax

loc_A15C7:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A15D0
		jmp	loc_A14D3

loc_A15D0:
		cmp	byte_4F55C, 0
		jnz	short loc_A15DA
		jmp	loc_A1BC7

loc_A15DA:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A162D
		cmp	[bp+var_10E], 0
		jz	short loc_A162D
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A162D

loc_A162D:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A1688
		cmp	[bp+var_100], 0
		jz	short loc_A1688
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1688

loc_A1688:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A16C7
		cmp	[bp+var_F6], 0
		jz	short loc_A16C7
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A16C7

loc_A16C7:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A1706
		cmp	[bp+var_EC], 0
		jz	short loc_A1706
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1706

loc_A1706:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A1745
		cmp	[bp+var_E2], 0
		jz	short loc_A1745
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1745

loc_A1745:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A1784
		cmp	[bp+var_D8], 0
		jz	short loc_A1784
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1784

loc_A1784:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A17C3
		cmp	[bp+var_CE], 0
		jz	short loc_A17C3
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A17C3

loc_A17C3:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A1802
		cmp	[bp+var_C4], 0
		jz	short loc_A1802
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1802

loc_A1802:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A1841
		cmp	[bp+var_BA], 0
		jz	short loc_A1841
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1841

loc_A1841:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A1880
		cmp	[bp+var_B0], 0
		jz	short loc_A1880
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1880

loc_A1880:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A18CC
		cmp	[bp+var_A0], 0
		jz	short loc_A18CC
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A18CC

loc_A18CC:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A1918
		cmp	[bp+var_90], 0
		jz	short loc_A1918
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1918

loc_A1918:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A1960
		cmp	[bp+var_80], 0
		jz	short loc_A1960
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1960

loc_A1960:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A19A4
		cmp	[bp+var_70], 0
		jz	short loc_A19A4
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A19A4

loc_A19A4:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A19E8
		cmp	[bp+var_60], 0
		jz	short loc_A19E8
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A19E8

loc_A19E8:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A1A2C
		cmp	[bp+var_50], 0
		jz	short loc_A1A2C
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1A2C

loc_A1A2C:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A1A64
		cmp	[bp+var_46], 0
		jz	short loc_A1A64
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1A64

loc_A1A64:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A1A9C
		cmp	[bp+var_3C], 0
		jz	short loc_A1A9C
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1A9C

loc_A1A9C:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A1AEB
		cmp	[bp+var_BC4], 0
		jz	short loc_A1AEB
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1AEB

loc_A1AEB:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A1B51
		cmp	[bp+var_30], 0
		jz	short loc_A1B51
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1B51

loc_A1B51:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A1BC7:
		mov	[bp+var_E], 2Ch
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A1CC5

loc_A1BE8:
		mov	ax, word ptr [bp+var_C4E+1]
		mov	word ptr [bp+var_11A], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1C16
		mov	ax, [bp+var_12]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A1C16:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1C2D
		push	2CE2h
		push	di
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_A1C2D:
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1C43
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A1C43:
		mov	ax, si
		add	ax, 10h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1C59
		push	0FFFFh
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A1C59:
		mov	ax, si
		add	ax, 13h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1C6F
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A1C6F:
		mov	ax, si
		add	ax, 14h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1C85
		push	0FFFFh
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A1C85:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A1C9E
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A1C9E:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A1CB8
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_A1CE5

loc_A1CB8:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A1CC5:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A1CD5
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A1CDA

loc_A1CD5:
		mov	ax, 1
		jmp	short loc_A1CDC

loc_A1CDA:
		xor	ax, ax

loc_A1CDC:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A1CE5
		jmp	loc_A1BE8

loc_A1CE5:
		cmp	byte_4F55C, 0
		jnz	short loc_A1CEF
		jmp	loc_A22DC

loc_A1CEF:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A1D42
		cmp	[bp+var_10E], 0
		jz	short loc_A1D42
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1D42

loc_A1D42:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A1D9D
		cmp	[bp+var_100], 0
		jz	short loc_A1D9D
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1D9D

loc_A1D9D:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A1DDC
		cmp	[bp+var_F6], 0
		jz	short loc_A1DDC
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1DDC

loc_A1DDC:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A1E1B
		cmp	[bp+var_EC], 0
		jz	short loc_A1E1B
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1E1B

loc_A1E1B:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A1E5A
		cmp	[bp+var_E2], 0
		jz	short loc_A1E5A
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1E5A

loc_A1E5A:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A1E99
		cmp	[bp+var_D8], 0
		jz	short loc_A1E99
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1E99

loc_A1E99:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A1ED8
		cmp	[bp+var_CE], 0
		jz	short loc_A1ED8
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1ED8

loc_A1ED8:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A1F17
		cmp	[bp+var_C4], 0
		jz	short loc_A1F17
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1F17

loc_A1F17:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A1F56
		cmp	[bp+var_BA], 0
		jz	short loc_A1F56
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1F56

loc_A1F56:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A1F95
		cmp	[bp+var_B0], 0
		jz	short loc_A1F95
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1F95

loc_A1F95:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A1FE1
		cmp	[bp+var_A0], 0
		jz	short loc_A1FE1
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A1FE1

loc_A1FE1:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A202D
		cmp	[bp+var_90], 0
		jz	short loc_A202D
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A202D

loc_A202D:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A2075
		cmp	[bp+var_80], 0
		jz	short loc_A2075
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2075

loc_A2075:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A20B9
		cmp	[bp+var_70], 0
		jz	short loc_A20B9
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A20B9

loc_A20B9:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A20FD
		cmp	[bp+var_60], 0
		jz	short loc_A20FD
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A20FD

loc_A20FD:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A2141
		cmp	[bp+var_50], 0
		jz	short loc_A2141
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2141

loc_A2141:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A2179
		cmp	[bp+var_46], 0
		jz	short loc_A2179
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2179

loc_A2179:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A21B1
		cmp	[bp+var_3C], 0
		jz	short loc_A21B1
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A21B1

loc_A21B1:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A2200
		cmp	[bp+var_BC4], 0
		jz	short loc_A2200
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2200

loc_A2200:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A2266
		cmp	[bp+var_30], 0
		jz	short loc_A2266
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2266

loc_A2266:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A22DC:
		mov	[bp+var_E], 26h
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A23DA

loc_A22FD:
		mov	ax, word ptr [bp+var_C4E+1]
		mov	word ptr [bp+var_11A], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A232B
		mov	ax, [bp+var_12]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A232B:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A2342
		push	2CF2h
		push	di
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_A2342:
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A2358
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A2358:
		mov	ax, si
		add	ax, 10h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A236E
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A236E:
		mov	ax, si
		add	ax, 13h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A2384
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A2384:
		mov	ax, si
		add	ax, 14h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A239A
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A239A:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A23B3
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A23B3:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A23CD
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_A23FA

loc_A23CD:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A23DA:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A23EA
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A23EF

loc_A23EA:
		mov	ax, 1
		jmp	short loc_A23F1

loc_A23EF:
		xor	ax, ax

loc_A23F1:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A23FA
		jmp	loc_A22FD

loc_A23FA:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_A2413
		jmp	loc_A29F1

loc_A2413:
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A2457
		cmp	[bp+var_10E], 0
		jz	short loc_A2457
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2457

loc_A2457:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A24B2
		cmp	[bp+var_100], 0
		jz	short loc_A24B2
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A24B2

loc_A24B2:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A24F1
		cmp	[bp+var_F6], 0
		jz	short loc_A24F1
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A24F1

loc_A24F1:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A2530
		cmp	[bp+var_EC], 0
		jz	short loc_A2530
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2530

loc_A2530:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A256F
		cmp	[bp+var_E2], 0
		jz	short loc_A256F
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A256F

loc_A256F:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A25AE
		cmp	[bp+var_D8], 0
		jz	short loc_A25AE
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A25AE

loc_A25AE:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A25ED
		cmp	[bp+var_CE], 0
		jz	short loc_A25ED
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A25ED

loc_A25ED:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A262C
		cmp	[bp+var_C4], 0
		jz	short loc_A262C
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A262C

loc_A262C:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A266B
		cmp	[bp+var_BA], 0
		jz	short loc_A266B
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A266B

loc_A266B:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A26AA
		cmp	[bp+var_B0], 0
		jz	short loc_A26AA
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A26AA

loc_A26AA:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A26F6
		cmp	[bp+var_A0], 0
		jz	short loc_A26F6
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A26F6

loc_A26F6:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A2742
		cmp	[bp+var_90], 0
		jz	short loc_A2742
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2742

loc_A2742:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A278A
		cmp	[bp+var_80], 0
		jz	short loc_A278A
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A278A

loc_A278A:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A27CE
		cmp	[bp+var_70], 0
		jz	short loc_A27CE
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A27CE

loc_A27CE:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A2812
		cmp	[bp+var_60], 0
		jz	short loc_A2812
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2812

loc_A2812:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A2856
		cmp	[bp+var_50], 0
		jz	short loc_A2856
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2856

loc_A2856:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A288E
		cmp	[bp+var_46], 0
		jz	short loc_A288E
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A288E

loc_A288E:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A28C6
		cmp	[bp+var_3C], 0
		jz	short loc_A28C6
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A28C6

loc_A28C6:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A2915
		cmp	[bp+var_BC4], 0
		jz	short loc_A2915
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2915

loc_A2915:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A297B
		cmp	[bp+var_30], 0
		jz	short loc_A297B
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A297B

loc_A297B:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A29F1:
		lea	ax, [bp+var_22A]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11A+2], ax
		push	80h
		push	0A4h
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_11A], ax
		push	1Fh
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	word ptr [bp+var_11A+2]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_11A]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_56]
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_14], 0
		jnz	short loc_A2AC1
		jmp	loc_A2C07

loc_A2AC1:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_124], 0
		mov	byte ptr [bp+var_120], 2
		mov	byte ptr [bp+var_120+1], 0
		mov	[bp+var_11E], 0
		push	2
		lea	ax, word ptr [bp+var_124]
		push	ax
		push	4
		lea	ax, [bp+var_328]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_124]
		push	ax
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_A2B24

loc_A2B16:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_A2B24:
		cmp	di, 8
		jl	short loc_A2B16
		push	0FFFFh
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		xor	di, di
		jmp	short loc_A2B90

loc_A2B3C:
		cmp	di, 7
		jnz	short loc_A2B4F
		push	0Ch
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A2B4F:
		cmp	di, 8
		jnz	short loc_A2B62
		push	15h
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A2B62:
		mov	ax, di
		inc	di
		cmp	ax, 11h
		jnz	short loc_A2B78
		push	0Ch
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A2B78:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A2B83
		jmp	short loc_A2BA1

loc_A2B83:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A2B90:
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_A2B3C

loc_A2BA1:
		xor	di, di
		jmp	short loc_A2BB3

loc_A2BA5:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_A2BB3:
		cmp	di, 0Ch
		jl	short loc_A2BA5
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_120+1], 0
		jz	short loc_A2BED
		cmp	[bp+var_124], 0
		jz	short loc_A2BED
		push	0
		mov	al, byte ptr [bp+var_120]
		push	ax
		lea	ax, word ptr [bp+var_124]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2BED

loc_A2BED:
		mov	[bp+var_124], 0
		mov	byte ptr [bp+var_120+1], 0
		mov	[bp+var_11E], 0
		jmp	loc_A2CF3

loc_A2C07:
		push	0FEh
		push	[bp+var_BFA]
		mov	bx, [bp+var_BFA]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_E], 28h
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A2CD3

loc_A2C3B:
		mov	di, word ptr [bp+var_C4E+1]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_A2C5F
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A2C5F:
		mov	ax, si
		add	ax, 11h
		cmp	ax, di
		jnz	short loc_A2C76
		push	0Ch
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A2C76:
		mov	ax, si
		add	ax, 12h
		cmp	ax, di
		jnz	short loc_A2C8D
		push	15h
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A2C8D:
		mov	ax, si
		add	ax, 1Bh
		cmp	ax, di
		jnz	short loc_A2CA4
		push	0Ch
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A2CA4:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_A2CBB
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A2CBB:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A2CC6
		jmp	short loc_A2CF3

loc_A2CC6:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A2CD3:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A2CE3
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A2CE8

loc_A2CE3:
		mov	ax, 1
		jmp	short loc_A2CEA

loc_A2CE8:
		xor	ax, ax

loc_A2CEA:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A2CF3
		jmp	loc_A2C3B

loc_A2CF3:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_A2D0C
		jmp	loc_A32EA

loc_A2D0C:
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A2D50
		cmp	[bp+var_10E], 0
		jz	short loc_A2D50
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2D50

loc_A2D50:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A2DAB
		cmp	[bp+var_100], 0
		jz	short loc_A2DAB
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2DAB

loc_A2DAB:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A2DEA
		cmp	[bp+var_F6], 0
		jz	short loc_A2DEA
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2DEA

loc_A2DEA:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A2E29
		cmp	[bp+var_EC], 0
		jz	short loc_A2E29
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2E29

loc_A2E29:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A2E68
		cmp	[bp+var_E2], 0
		jz	short loc_A2E68
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2E68

loc_A2E68:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A2EA7
		cmp	[bp+var_D8], 0
		jz	short loc_A2EA7
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2EA7

loc_A2EA7:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A2EE6
		cmp	[bp+var_CE], 0
		jz	short loc_A2EE6
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2EE6

loc_A2EE6:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A2F25
		cmp	[bp+var_C4], 0
		jz	short loc_A2F25
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2F25

loc_A2F25:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A2F64
		cmp	[bp+var_BA], 0
		jz	short loc_A2F64
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2F64

loc_A2F64:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A2FA3
		cmp	[bp+var_B0], 0
		jz	short loc_A2FA3
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2FA3

loc_A2FA3:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A2FEF
		cmp	[bp+var_A0], 0
		jz	short loc_A2FEF
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A2FEF

loc_A2FEF:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A303B
		cmp	[bp+var_90], 0
		jz	short loc_A303B
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A303B

loc_A303B:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A3083
		cmp	[bp+var_80], 0
		jz	short loc_A3083
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3083

loc_A3083:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A30C7
		cmp	[bp+var_70], 0
		jz	short loc_A30C7
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A30C7

loc_A30C7:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A310B
		cmp	[bp+var_60], 0
		jz	short loc_A310B
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A310B

loc_A310B:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A314F
		cmp	[bp+var_50], 0
		jz	short loc_A314F
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A314F

loc_A314F:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A3187
		cmp	[bp+var_46], 0
		jz	short loc_A3187
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3187

loc_A3187:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A31BF
		cmp	[bp+var_3C], 0
		jz	short loc_A31BF
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A31BF

loc_A31BF:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A320E
		cmp	[bp+var_BC4], 0
		jz	short loc_A320E
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A320E

loc_A320E:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A3274
		cmp	[bp+var_30], 0
		jz	short loc_A3274
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3274

loc_A3274:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A32EA:
		lea	ax, [bp+var_22A]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11A+2], ax
		push	80h
		push	0FFh
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_11A], ax
		push	80h
		push	5Fh
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_11C], ax
		push	13h
		push	word ptr [bp+var_11C]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	13h
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	word ptr [bp+var_11A+2]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_11A]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_11C]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_56]
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_14], 0
		jnz	short loc_A33F4
		jmp	loc_A3BD3

loc_A33F4:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_126], 0
		mov	byte ptr [bp+var_122], 2
		mov	byte ptr [bp+var_122+1], 0
		mov	[bp+var_120], 0
		push	2
		lea	ax, word ptr [bp+var_126]
		push	ax
		push	5
		lea	ax, [bp+var_328]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_126]
		push	ax
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_A3457

loc_A3449:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_A3457:
		cmp	di, 4
		jl	short loc_A3449
		push	0FFFFh
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		xor	di, di
		jmp	loc_A3523

loc_A3470:
		cmp	di, 7
		jnz	short loc_A3483
		push	0Ch
		push	word ptr [bp+var_11C]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A3483:
		cmp	di, 8
		jnz	short loc_A3496
		push	15h
		push	word ptr [bp+var_11C]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A3496:
		cmp	di, 9
		jnz	short loc_A34A9
		push	0FFFFh
		push	word ptr [bp+var_11C]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A34A9:
		cmp	di, 10h
		jnz	short loc_A34BC
		push	0Ch
		push	word ptr [bp+var_11C]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A34BC:
		cmp	di, 12h
		jnz	short loc_A34CF
		push	15h
		push	word ptr [bp+var_11C]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A34CF:
		cmp	di, 2
		jnz	short loc_A34E2
		push	0Ch
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A34E2:
		cmp	di, 3
		jnz	short loc_A34F5
		push	15h
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A34F5:
		mov	ax, di
		inc	di
		cmp	ax, 16h
		jnz	short loc_A350B
		push	0Ch
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A350B:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A3516
		jmp	short loc_A3537

loc_A3516:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A3523:
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jz	short loc_A3537
		jmp	loc_A3470

loc_A3537:
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte_4F55C, 0
		jnz	short loc_A354E
		jmp	loc_A3B7A

loc_A354E:
		cmp	byte ptr [bp+var_122+1], 0
		jz	short loc_A3576
		cmp	[bp+var_126], 0
		jz	short loc_A3576
		push	0
		mov	al, byte ptr [bp+var_122]
		push	ax
		lea	ax, word ptr [bp+var_126]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3576

loc_A3576:
		mov	[bp+var_126], 0
		mov	byte ptr [bp+var_122+1], 0
		mov	[bp+var_120], 0
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A35E0
		cmp	[bp+var_10E], 0
		jz	short loc_A35E0
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A35E0

loc_A35E0:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A363B
		cmp	[bp+var_100], 0
		jz	short loc_A363B
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A363B

loc_A363B:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A367A
		cmp	[bp+var_F6], 0
		jz	short loc_A367A
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A367A

loc_A367A:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A36B9
		cmp	[bp+var_EC], 0
		jz	short loc_A36B9
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A36B9

loc_A36B9:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A36F8
		cmp	[bp+var_E2], 0
		jz	short loc_A36F8
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A36F8

loc_A36F8:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A3737
		cmp	[bp+var_D8], 0
		jz	short loc_A3737
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3737

loc_A3737:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A3776
		cmp	[bp+var_CE], 0
		jz	short loc_A3776
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3776

loc_A3776:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A37B5
		cmp	[bp+var_C4], 0
		jz	short loc_A37B5
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A37B5

loc_A37B5:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A37F4
		cmp	[bp+var_BA], 0
		jz	short loc_A37F4
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A37F4

loc_A37F4:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A3833
		cmp	[bp+var_B0], 0
		jz	short loc_A3833
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3833

loc_A3833:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A387F
		cmp	[bp+var_A0], 0
		jz	short loc_A387F
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A387F

loc_A387F:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A38CB
		cmp	[bp+var_90], 0
		jz	short loc_A38CB
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A38CB

loc_A38CB:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A3913
		cmp	[bp+var_80], 0
		jz	short loc_A3913
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3913

loc_A3913:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A3957
		cmp	[bp+var_70], 0
		jz	short loc_A3957
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3957

loc_A3957:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A399B
		cmp	[bp+var_60], 0
		jz	short loc_A399B
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A399B

loc_A399B:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A39DF
		cmp	[bp+var_50], 0
		jz	short loc_A39DF
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A39DF

loc_A39DF:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A3A17
		cmp	[bp+var_46], 0
		jz	short loc_A3A17
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3A17

loc_A3A17:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A3A4F
		cmp	[bp+var_3C], 0
		jz	short loc_A3A4F
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3A4F

loc_A3A4F:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A3A9E
		cmp	[bp+var_BC4], 0
		jz	short loc_A3A9E
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3A9E

loc_A3A9E:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A3B04
		cmp	[bp+var_30], 0
		jz	short loc_A3B04
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3B04

loc_A3B04:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A3B7A:
		xor	di, di
		jmp	short loc_A3B8C

loc_A3B7E:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_A3B8C:
		cmp	di, 8
		jl	short loc_A3B7E
		cmp	byte ptr [bp+var_122+1], 0
		jz	short loc_A3BB9
		cmp	[bp+var_126], 0
		jz	short loc_A3BB9
		push	0
		mov	al, byte ptr [bp+var_122]
		push	ax
		lea	ax, word ptr [bp+var_126]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3BB9

loc_A3BB9:
		mov	[bp+var_126], 0
		mov	byte ptr [bp+var_122+1], 0
		mov	[bp+var_120], 0
		jmp	loc_A3D45

loc_A3BD3:
		push	0FEh
		push	[bp+var_BFA]
		mov	bx, [bp+var_BFA]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_E], 47h
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A3D25

loc_A3C07:
		mov	di, word ptr [bp+var_C4E+1]
		mov	ax, si
		add	ax, 2
		cmp	ax, di
		jnz	short loc_A3C2F
		mov	ax, [bp+var_12]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A3C2F:
		mov	ax, si
		add	ax, 11h
		cmp	ax, di
		jnz	short loc_A3C46
		push	0Ch
		push	word ptr [bp+var_11C]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A3C46:
		mov	ax, si
		add	ax, 12h
		cmp	ax, di
		jnz	short loc_A3C5D
		push	15h
		push	word ptr [bp+var_11C]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A3C5D:
		mov	ax, si
		add	ax, 13h
		cmp	ax, di
		jnz	short loc_A3C74
		push	0FFFFh
		push	word ptr [bp+var_11C]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A3C74:
		mov	ax, si
		add	ax, 1Ah
		cmp	ax, di
		jnz	short loc_A3C8B
		push	0Ch
		push	word ptr [bp+var_11C]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A3C8B:
		mov	ax, si
		add	ax, 1Ch
		cmp	ax, di
		jnz	short loc_A3CA2
		push	15h
		push	word ptr [bp+var_11C]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A3CA2:
		mov	ax, si
		add	ax, 7
		cmp	ax, di
		jnz	short loc_A3CB9
		push	0Ch
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A3CB9:
		mov	ax, si
		add	ax, 8
		cmp	ax, di
		jnz	short loc_A3CD0
		push	15h
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A3CD0:
		mov	ax, si
		add	ax, 20h
		cmp	ax, di
		jnz	short loc_A3CE7
		push	0Ch
		push	word ptr [bp+var_11A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A3CE7:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_A3CFE
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A3CFE:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A3D18
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_A3D45

loc_A3D18:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A3D25:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A3D35
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A3D3A

loc_A3D35:
		mov	ax, 1
		jmp	short loc_A3D3C

loc_A3D3A:
		xor	ax, ax

loc_A3D3C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A3D45
		jmp	loc_A3C07

loc_A3D45:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_A3D5E
		jmp	loc_A433C

loc_A3D5E:
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A3DA2
		cmp	[bp+var_10E], 0
		jz	short loc_A3DA2
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3DA2

loc_A3DA2:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A3DFD
		cmp	[bp+var_100], 0
		jz	short loc_A3DFD
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3DFD

loc_A3DFD:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A3E3C
		cmp	[bp+var_F6], 0
		jz	short loc_A3E3C
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3E3C

loc_A3E3C:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A3E7B
		cmp	[bp+var_EC], 0
		jz	short loc_A3E7B
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3E7B

loc_A3E7B:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A3EBA
		cmp	[bp+var_E2], 0
		jz	short loc_A3EBA
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3EBA

loc_A3EBA:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A3EF9
		cmp	[bp+var_D8], 0
		jz	short loc_A3EF9
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3EF9

loc_A3EF9:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A3F38
		cmp	[bp+var_CE], 0
		jz	short loc_A3F38
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3F38

loc_A3F38:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A3F77
		cmp	[bp+var_C4], 0
		jz	short loc_A3F77
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3F77

loc_A3F77:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A3FB6
		cmp	[bp+var_BA], 0
		jz	short loc_A3FB6
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3FB6

loc_A3FB6:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A3FF5
		cmp	[bp+var_B0], 0
		jz	short loc_A3FF5
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A3FF5

loc_A3FF5:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A4041
		cmp	[bp+var_A0], 0
		jz	short loc_A4041
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4041

loc_A4041:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A408D
		cmp	[bp+var_90], 0
		jz	short loc_A408D
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A408D

loc_A408D:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A40D5
		cmp	[bp+var_80], 0
		jz	short loc_A40D5
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A40D5

loc_A40D5:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A4119
		cmp	[bp+var_70], 0
		jz	short loc_A4119
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4119

loc_A4119:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A415D
		cmp	[bp+var_60], 0
		jz	short loc_A415D
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A415D

loc_A415D:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A41A1
		cmp	[bp+var_50], 0
		jz	short loc_A41A1
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A41A1

loc_A41A1:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A41D9
		cmp	[bp+var_46], 0
		jz	short loc_A41D9
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A41D9

loc_A41D9:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A4211
		cmp	[bp+var_3C], 0
		jz	short loc_A4211
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4211

loc_A4211:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A4260
		cmp	[bp+var_BC4], 0
		jz	short loc_A4260
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4260

loc_A4260:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A42C6
		cmp	[bp+var_30], 0
		jz	short loc_A42C6
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A42C6

loc_A42C6:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A433C:
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C], 2
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		push	3
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	1Eh
		lea	ax, [bp+var_2B0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_22A]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_122], ax
		sub	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_D2C]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_D2C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		call	Palette_UploadByValue_114A2
		add	sp, 6
		push	word ptr [bp+var_122]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+var_14], 0
		jnz	short loc_A43EE
		jmp	loc_A4B6B

loc_A43EE:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_12C], 0
		mov	byte ptr [bp+var_128], 2
		mov	byte ptr [bp+var_128+1], 0
		mov	[bp+var_126], 0
		push	2
		lea	ax, word ptr [bp+var_12C]
		push	ax
		push	6
		lea	ax, [bp+var_328]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_12C]
		push	ax
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_A4451

loc_A4443:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_A4451:
		cmp	di, 4
		jl	short loc_A4443
		push	0FFFFh
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_A447F

loc_A4467:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A4472
		jmp	short loc_A4490

loc_A4472:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A447F:
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_A4467

loc_A4490:
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte_4F55C, 0
		jnz	short loc_A44A7
		jmp	loc_A4B12

loc_A44A7:
		cmp	byte ptr [bp+var_128+1], 0
		jz	short loc_A44CF
		cmp	[bp+var_12C], 0
		jz	short loc_A44CF
		push	0
		mov	al, byte ptr [bp+var_128]
		push	ax
		lea	ax, word ptr [bp+var_12C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A44CF

loc_A44CF:
		mov	[bp+var_12C], 0
		mov	byte ptr [bp+var_128+1], 0
		mov	[bp+var_126], 0
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_11C+1], 0
		jz	short loc_A451D
		cmp	[bp+var_120], 0
		jz	short loc_A451D
		push	0
		mov	al, byte ptr [bp+var_11C]
		push	ax
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A451D

loc_A451D:
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A4578
		cmp	[bp+var_10E], 0
		jz	short loc_A4578
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4578

loc_A4578:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A45D3
		cmp	[bp+var_100], 0
		jz	short loc_A45D3
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A45D3

loc_A45D3:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A4612
		cmp	[bp+var_F6], 0
		jz	short loc_A4612
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4612

loc_A4612:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A4651
		cmp	[bp+var_EC], 0
		jz	short loc_A4651
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4651

loc_A4651:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A4690
		cmp	[bp+var_E2], 0
		jz	short loc_A4690
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4690

loc_A4690:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A46CF
		cmp	[bp+var_D8], 0
		jz	short loc_A46CF
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A46CF

loc_A46CF:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A470E
		cmp	[bp+var_CE], 0
		jz	short loc_A470E
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A470E

loc_A470E:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A474D
		cmp	[bp+var_C4], 0
		jz	short loc_A474D
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A474D

loc_A474D:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A478C
		cmp	[bp+var_BA], 0
		jz	short loc_A478C
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A478C

loc_A478C:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A47CB
		cmp	[bp+var_B0], 0
		jz	short loc_A47CB
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A47CB

loc_A47CB:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A4817
		cmp	[bp+var_A0], 0
		jz	short loc_A4817
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4817

loc_A4817:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A4863
		cmp	[bp+var_90], 0
		jz	short loc_A4863
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4863

loc_A4863:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A48AB
		cmp	[bp+var_80], 0
		jz	short loc_A48AB
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A48AB

loc_A48AB:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A48EF
		cmp	[bp+var_70], 0
		jz	short loc_A48EF
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A48EF

loc_A48EF:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A4933
		cmp	[bp+var_60], 0
		jz	short loc_A4933
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4933

loc_A4933:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A4977
		cmp	[bp+var_50], 0
		jz	short loc_A4977
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4977

loc_A4977:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A49AF
		cmp	[bp+var_46], 0
		jz	short loc_A49AF
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A49AF

loc_A49AF:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A49E7
		cmp	[bp+var_3C], 0
		jz	short loc_A49E7
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A49E7

loc_A49E7:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A4A36
		cmp	[bp+var_BC4], 0
		jz	short loc_A4A36
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4A36

loc_A4A36:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A4A9C
		cmp	[bp+var_30], 0
		jz	short loc_A4A9C
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4A9C

loc_A4A9C:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A4B12:
		xor	di, di
		jmp	short loc_A4B24

loc_A4B16:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_A4B24:
		cmp	di, 8
		jl	short loc_A4B16
		cmp	byte ptr [bp+var_128+1], 0
		jz	short loc_A4B51
		cmp	[bp+var_12C], 0
		jz	short loc_A4B51
		push	0
		mov	al, byte ptr [bp+var_128]
		push	ax
		lea	ax, word ptr [bp+var_12C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4B51

loc_A4B51:
		mov	[bp+var_12C], 0
		mov	byte ptr [bp+var_128+1], 0
		mov	[bp+var_126], 0
		jmp	loc_A5309

loc_A4B6B:
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	4Fh
		lea	ax, [bp+var_C0E]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_E], 38h
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	short loc_A4C0F

loc_A4BA9:
		mov	di, word ptr [bp+var_C4E+1]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_A4BD1
		mov	ax, [bp+var_12]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A4BD1:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_A4BE8
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A4BE8:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A4C02
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_A4C2F

loc_A4C02:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A4C0F:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A4C1F
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A4C24

loc_A4C1F:
		mov	ax, 1
		jmp	short loc_A4C26

loc_A4C24:
		xor	ax, ax

loc_A4C26:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A4C2F
		jmp	loc_A4BA9

loc_A4C2F:
		cmp	byte_4F55C, 0
		jnz	short loc_A4C39
		jmp	loc_A5265

loc_A4C39:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_11C+1], 0
		jz	short loc_A4C70
		cmp	[bp+var_120], 0
		jz	short loc_A4C70
		push	0
		mov	al, byte ptr [bp+var_11C]
		push	ax
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4C70

loc_A4C70:
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A4CCB
		cmp	[bp+var_10E], 0
		jz	short loc_A4CCB
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4CCB

loc_A4CCB:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A4D26
		cmp	[bp+var_100], 0
		jz	short loc_A4D26
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4D26

loc_A4D26:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A4D65
		cmp	[bp+var_F6], 0
		jz	short loc_A4D65
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4D65

loc_A4D65:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A4DA4
		cmp	[bp+var_EC], 0
		jz	short loc_A4DA4
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4DA4

loc_A4DA4:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A4DE3
		cmp	[bp+var_E2], 0
		jz	short loc_A4DE3
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4DE3

loc_A4DE3:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A4E22
		cmp	[bp+var_D8], 0
		jz	short loc_A4E22
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4E22

loc_A4E22:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A4E61
		cmp	[bp+var_CE], 0
		jz	short loc_A4E61
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4E61

loc_A4E61:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A4EA0
		cmp	[bp+var_C4], 0
		jz	short loc_A4EA0
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4EA0

loc_A4EA0:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A4EDF
		cmp	[bp+var_BA], 0
		jz	short loc_A4EDF
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4EDF

loc_A4EDF:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A4F1E
		cmp	[bp+var_B0], 0
		jz	short loc_A4F1E
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4F1E

loc_A4F1E:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A4F6A
		cmp	[bp+var_A0], 0
		jz	short loc_A4F6A
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4F6A

loc_A4F6A:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A4FB6
		cmp	[bp+var_90], 0
		jz	short loc_A4FB6
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4FB6

loc_A4FB6:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A4FFE
		cmp	[bp+var_80], 0
		jz	short loc_A4FFE
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A4FFE

loc_A4FFE:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A5042
		cmp	[bp+var_70], 0
		jz	short loc_A5042
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5042

loc_A5042:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A5086
		cmp	[bp+var_60], 0
		jz	short loc_A5086
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5086

loc_A5086:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A50CA
		cmp	[bp+var_50], 0
		jz	short loc_A50CA
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A50CA

loc_A50CA:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A5102
		cmp	[bp+var_46], 0
		jz	short loc_A5102
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5102

loc_A5102:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A513A
		cmp	[bp+var_3C], 0
		jz	short loc_A513A
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A513A

loc_A513A:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A5189
		cmp	[bp+var_BC4], 0
		jz	short loc_A5189
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5189

loc_A5189:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A51EF
		cmp	[bp+var_30], 0
		jz	short loc_A51EF
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A51EF

loc_A51EF:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A5265:
		mov	[bp+var_E], 3Ch
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	short loc_A52E9

loc_A5285:
		mov	di, word ptr [bp+var_C4E+1]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_A52AB
		mov	ax, [bp+var_12]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A52AB:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_A52C2
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A52C2:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A52DC
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_A5309

loc_A52DC:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A52E9:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A52F9
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A52FE

loc_A52F9:
		mov	ax, 1
		jmp	short loc_A5300

loc_A52FE:
		xor	ax, ax

loc_A5300:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A5309
		jmp	loc_A5285

loc_A5309:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_11C+1], 0
		jz	short loc_A5340
		cmp	[bp+var_120], 0
		jz	short loc_A5340
		push	0
		mov	al, byte ptr [bp+var_11C]
		push	ax
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5340

loc_A5340:
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		cmp	byte_4F55C, 0
		jnz	short loc_A5361
		jmp	loc_A593F

loc_A5361:
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A53A5
		cmp	[bp+var_10E], 0
		jz	short loc_A53A5
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A53A5

loc_A53A5:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A5400
		cmp	[bp+var_100], 0
		jz	short loc_A5400
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5400

loc_A5400:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A543F
		cmp	[bp+var_F6], 0
		jz	short loc_A543F
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A543F

loc_A543F:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A547E
		cmp	[bp+var_EC], 0
		jz	short loc_A547E
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A547E

loc_A547E:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A54BD
		cmp	[bp+var_E2], 0
		jz	short loc_A54BD
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A54BD

loc_A54BD:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A54FC
		cmp	[bp+var_D8], 0
		jz	short loc_A54FC
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A54FC

loc_A54FC:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A553B
		cmp	[bp+var_CE], 0
		jz	short loc_A553B
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A553B

loc_A553B:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A557A
		cmp	[bp+var_C4], 0
		jz	short loc_A557A
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A557A

loc_A557A:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A55B9
		cmp	[bp+var_BA], 0
		jz	short loc_A55B9
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A55B9

loc_A55B9:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A55F8
		cmp	[bp+var_B0], 0
		jz	short loc_A55F8
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A55F8

loc_A55F8:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A5644
		cmp	[bp+var_A0], 0
		jz	short loc_A5644
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5644

loc_A5644:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A5690
		cmp	[bp+var_90], 0
		jz	short loc_A5690
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5690

loc_A5690:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A56D8
		cmp	[bp+var_80], 0
		jz	short loc_A56D8
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A56D8

loc_A56D8:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A571C
		cmp	[bp+var_70], 0
		jz	short loc_A571C
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A571C

loc_A571C:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A5760
		cmp	[bp+var_60], 0
		jz	short loc_A5760
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5760

loc_A5760:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A57A4
		cmp	[bp+var_50], 0
		jz	short loc_A57A4
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A57A4

loc_A57A4:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A57DC
		cmp	[bp+var_46], 0
		jz	short loc_A57DC
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A57DC

loc_A57DC:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A5814
		cmp	[bp+var_3C], 0
		jz	short loc_A5814
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5814

loc_A5814:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A5863
		cmp	[bp+var_BC4], 0
		jz	short loc_A5863
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5863

loc_A5863:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A58C9
		cmp	[bp+var_30], 0
		jz	short loc_A58C9
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A58C9

loc_A58C9:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A593F:
		lea	ax, [bp+var_22A]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11A+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	di, ax
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	word ptr [bp+var_11A+2]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_56]
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_14], 0
		jnz	short loc_A5A23
		jmp	loc_A5B6F

loc_A5A23:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_122], 0
		mov	byte ptr [bp+var_11E], 2
		mov	byte ptr [bp+var_11E+1], 0
		mov	[bp+var_11C], 0
		push	2
		lea	ax, word ptr [bp+var_122]
		push	ax
		push	7
		lea	ax, [bp+var_328]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_122]
		push	ax
		push	di
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		mov	word ptr [bp+var_124], 0
		jmp	short loc_A5A8B

loc_A5A7A:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_124]

loc_A5A8B:
		cmp	word ptr [bp+var_124], 3
		jl	short loc_A5A7A
		mov	word ptr [bp+var_124], 0
		jmp	short loc_A5B00

loc_A5A9A:
		cmp	word ptr [bp+var_124], 5
		jnz	short loc_A5AAC
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A5AAC:
		cmp	word ptr [bp+var_124], 6
		jnz	short loc_A5ABE
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A5ABE:
		cmp	word ptr [bp+var_124], 9
		jnz	short loc_A5AD0
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A5AD0:
		mov	ax, word ptr [bp+var_124]
		inc	word ptr [bp+var_124]
		cmp	ax, 0Ah
		jnz	short loc_A5AE8
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A5AE8:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A5AF3
		jmp	short loc_A5B0D

loc_A5AF3:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A5B00:
		push	di
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_A5A9A

loc_A5B0D:
		mov	word ptr [bp+var_124], 0
		jmp	short loc_A5B26

loc_A5B15:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	word ptr [bp+var_124]

loc_A5B26:
		cmp	word ptr [bp+var_124], 2
		jl	short loc_A5B15
		cmp	byte ptr [bp+var_11E+1], 0
		jz	short loc_A5B55
		cmp	[bp+var_122], 0
		jz	short loc_A5B55
		push	0
		mov	al, byte ptr [bp+var_11E]
		push	ax
		lea	ax, word ptr [bp+var_122]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5B55

loc_A5B55:
		mov	[bp+var_122], 0
		mov	byte ptr [bp+var_11E+1], 0
		mov	[bp+var_11C], 0
		jmp	loc_A6A48

loc_A5B6F:
		push	0FEh
		push	[bp+var_BFA]
		mov	bx, [bp+var_BFA]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_E], 2Dh
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A5C6C

loc_A5BA3:
		mov	ax, word ptr [bp+var_C4E+1]
		mov	word ptr [bp+var_11A], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A5BD1
		mov	ax, [bp+var_12]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A5BD1:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A5BE8
		push	2CFDh
		push	di
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_A5BE8:
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A5BFE
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A5BFE:
		mov	ax, si
		add	ax, 10h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A5C14
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A5C14:
		mov	ax, si
		add	ax, 13h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A5C2A
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A5C2A:
		mov	ax, si
		add	ax, 14h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A5C40
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A5C40:
		mov	ax, word ptr [bp+var_11A]
		cmp	ax, [bp+var_C]
		jnz	short loc_A5C54
		push	0FFFFh
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A5C54:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A5C5F
		jmp	short loc_A5C8C

loc_A5C5F:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A5C6C:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A5C7C
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A5C81

loc_A5C7C:
		mov	ax, 1
		jmp	short loc_A5C83

loc_A5C81:
		xor	ax, ax

loc_A5C83:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A5C8C
		jmp	loc_A5BA3

loc_A5C8C:
		cmp	byte_4F55C, 0
		jnz	short loc_A5C96
		jmp	loc_A6283

loc_A5C96:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A5CE9
		cmp	[bp+var_10E], 0
		jz	short loc_A5CE9
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5CE9

loc_A5CE9:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A5D44
		cmp	[bp+var_100], 0
		jz	short loc_A5D44
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5D44

loc_A5D44:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A5D83
		cmp	[bp+var_F6], 0
		jz	short loc_A5D83
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5D83

loc_A5D83:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A5DC2
		cmp	[bp+var_EC], 0
		jz	short loc_A5DC2
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5DC2

loc_A5DC2:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A5E01
		cmp	[bp+var_E2], 0
		jz	short loc_A5E01
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5E01

loc_A5E01:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A5E40
		cmp	[bp+var_D8], 0
		jz	short loc_A5E40
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5E40

loc_A5E40:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A5E7F
		cmp	[bp+var_CE], 0
		jz	short loc_A5E7F
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5E7F

loc_A5E7F:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A5EBE
		cmp	[bp+var_C4], 0
		jz	short loc_A5EBE
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5EBE

loc_A5EBE:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A5EFD
		cmp	[bp+var_BA], 0
		jz	short loc_A5EFD
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5EFD

loc_A5EFD:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A5F3C
		cmp	[bp+var_B0], 0
		jz	short loc_A5F3C
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5F3C

loc_A5F3C:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A5F88
		cmp	[bp+var_A0], 0
		jz	short loc_A5F88
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5F88

loc_A5F88:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A5FD4
		cmp	[bp+var_90], 0
		jz	short loc_A5FD4
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A5FD4

loc_A5FD4:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A601C
		cmp	[bp+var_80], 0
		jz	short loc_A601C
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A601C

loc_A601C:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A6060
		cmp	[bp+var_70], 0
		jz	short loc_A6060
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6060

loc_A6060:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A60A4
		cmp	[bp+var_60], 0
		jz	short loc_A60A4
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A60A4

loc_A60A4:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A60E8
		cmp	[bp+var_50], 0
		jz	short loc_A60E8
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A60E8

loc_A60E8:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A6120
		cmp	[bp+var_46], 0
		jz	short loc_A6120
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6120

loc_A6120:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A6158
		cmp	[bp+var_3C], 0
		jz	short loc_A6158
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6158

loc_A6158:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A61A7
		cmp	[bp+var_BC4], 0
		jz	short loc_A61A7
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A61A7

loc_A61A7:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A620D
		cmp	[bp+var_30], 0
		jz	short loc_A620D
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A620D

loc_A620D:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A6283:
		mov	[bp+var_E], 28h
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A6355

loc_A62A4:
		mov	ax, word ptr [bp+var_C4E+1]
		mov	word ptr [bp+var_11A], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A62D2
		mov	ax, [bp+var_12]
		mov	dx, 0Dh
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A62D2:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A62E9
		push	2D07h
		push	di
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_A62E9:
		mov	ax, si
		add	ax, 13h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A62FF
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A62FF:
		mov	ax, si
		add	ax, 14h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A6315
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A6315:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A632E
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A632E:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A6348
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_A6375

loc_A6348:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A6355:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A6365
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A636A

loc_A6365:
		mov	ax, 1
		jmp	short loc_A636C

loc_A636A:
		xor	ax, ax

loc_A636C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A6375
		jmp	loc_A62A4

loc_A6375:
		cmp	byte_4F55C, 0
		jnz	short loc_A637F
		jmp	loc_A696C

loc_A637F:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A63D2
		cmp	[bp+var_10E], 0
		jz	short loc_A63D2
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A63D2

loc_A63D2:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A642D
		cmp	[bp+var_100], 0
		jz	short loc_A642D
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A642D

loc_A642D:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A646C
		cmp	[bp+var_F6], 0
		jz	short loc_A646C
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A646C

loc_A646C:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A64AB
		cmp	[bp+var_EC], 0
		jz	short loc_A64AB
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A64AB

loc_A64AB:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A64EA
		cmp	[bp+var_E2], 0
		jz	short loc_A64EA
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A64EA

loc_A64EA:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A6529
		cmp	[bp+var_D8], 0
		jz	short loc_A6529
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6529

loc_A6529:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A6568
		cmp	[bp+var_CE], 0
		jz	short loc_A6568
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6568

loc_A6568:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A65A7
		cmp	[bp+var_C4], 0
		jz	short loc_A65A7
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A65A7

loc_A65A7:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A65E6
		cmp	[bp+var_BA], 0
		jz	short loc_A65E6
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A65E6

loc_A65E6:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A6625
		cmp	[bp+var_B0], 0
		jz	short loc_A6625
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6625

loc_A6625:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A6671
		cmp	[bp+var_A0], 0
		jz	short loc_A6671
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6671

loc_A6671:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A66BD
		cmp	[bp+var_90], 0
		jz	short loc_A66BD
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A66BD

loc_A66BD:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A6705
		cmp	[bp+var_80], 0
		jz	short loc_A6705
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6705

loc_A6705:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A6749
		cmp	[bp+var_70], 0
		jz	short loc_A6749
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6749

loc_A6749:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A678D
		cmp	[bp+var_60], 0
		jz	short loc_A678D
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A678D

loc_A678D:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A67D1
		cmp	[bp+var_50], 0
		jz	short loc_A67D1
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A67D1

loc_A67D1:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A6809
		cmp	[bp+var_46], 0
		jz	short loc_A6809
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6809

loc_A6809:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A6841
		cmp	[bp+var_3C], 0
		jz	short loc_A6841
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6841

loc_A6841:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A6890
		cmp	[bp+var_BC4], 0
		jz	short loc_A6890
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6890

loc_A6890:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A68F6
		cmp	[bp+var_30], 0
		jz	short loc_A68F6
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A68F6

loc_A68F6:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A696C:
		mov	[bp+var_E], 2Ch
		mov	si, word ptr [bp+var_C4E+1]
		mov	ax, [bp+var_E]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A6A28

loc_A698D:
		mov	ax, word ptr [bp+var_C4E+1]
		mov	word ptr [bp+var_11A], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A69BB
		mov	ax, [bp+var_12]
		mov	dx, 0Eh
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A69BB:
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A69D2
		push	2D0Dh
		push	di
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_A69D2:
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A69E8
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_A69E8:
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_A6A01
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A6A01:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A6A1B
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_A6A48

loc_A6A1B:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A6A28:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A6A38
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A6A3D

loc_A6A38:
		mov	ax, 1
		jmp	short loc_A6A3F

loc_A6A3D:
		xor	ax, ax

loc_A6A3F:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A6A48
		jmp	loc_A698D

loc_A6A48:
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_A6A61
		jmp	loc_A703F

loc_A6A61:
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A6AA5
		cmp	[bp+var_10E], 0
		jz	short loc_A6AA5
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6AA5

loc_A6AA5:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A6B00
		cmp	[bp+var_100], 0
		jz	short loc_A6B00
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6B00

loc_A6B00:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A6B3F
		cmp	[bp+var_F6], 0
		jz	short loc_A6B3F
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6B3F

loc_A6B3F:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A6B7E
		cmp	[bp+var_EC], 0
		jz	short loc_A6B7E
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6B7E

loc_A6B7E:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A6BBD
		cmp	[bp+var_E2], 0
		jz	short loc_A6BBD
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6BBD

loc_A6BBD:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A6BFC
		cmp	[bp+var_D8], 0
		jz	short loc_A6BFC
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6BFC

loc_A6BFC:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A6C3B
		cmp	[bp+var_CE], 0
		jz	short loc_A6C3B
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6C3B

loc_A6C3B:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A6C7A
		cmp	[bp+var_C4], 0
		jz	short loc_A6C7A
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6C7A

loc_A6C7A:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A6CB9
		cmp	[bp+var_BA], 0
		jz	short loc_A6CB9
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6CB9

loc_A6CB9:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A6CF8
		cmp	[bp+var_B0], 0
		jz	short loc_A6CF8
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6CF8

loc_A6CF8:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A6D44
		cmp	[bp+var_A0], 0
		jz	short loc_A6D44
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6D44

loc_A6D44:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A6D90
		cmp	[bp+var_90], 0
		jz	short loc_A6D90
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6D90

loc_A6D90:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A6DD8
		cmp	[bp+var_80], 0
		jz	short loc_A6DD8
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6DD8

loc_A6DD8:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A6E1C
		cmp	[bp+var_70], 0
		jz	short loc_A6E1C
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6E1C

loc_A6E1C:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A6E60
		cmp	[bp+var_60], 0
		jz	short loc_A6E60
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6E60

loc_A6E60:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A6EA4
		cmp	[bp+var_50], 0
		jz	short loc_A6EA4
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6EA4

loc_A6EA4:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A6EDC
		cmp	[bp+var_46], 0
		jz	short loc_A6EDC
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6EDC

loc_A6EDC:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A6F14
		cmp	[bp+var_3C], 0
		jz	short loc_A6F14
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6F14

loc_A6F14:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A6F63
		cmp	[bp+var_BC4], 0
		jz	short loc_A6F63
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6F63

loc_A6F63:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A6FC9
		cmp	[bp+var_30], 0
		jz	short loc_A6FC9
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A6FC9

loc_A6FC9:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_A703F:
		lea	ax, [bp+var_22A]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11A+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11A], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11C], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_11E], ax
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_120], ax
		push	[bp+var_66]
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_11A+2]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_120]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_11A]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_11C]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_11E]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0Ch
		lea	ax, [bp+var_C0E]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	word ptr [bp+var_122], 0
		mov	word ptr [bp+var_124], 0
		mov	word ptr [bp+var_126], 1
		mov	word ptr [bp+var_128], 0
		mov	word ptr [bp+var_12A], 0
		mov	[bp+var_C], 87h
		mov	[bp+var_134], 0
		mov	byte ptr [bp+var_130], 2
		mov	byte ptr [bp+var_130+1], 0
		mov	[bp+var_12E], 0
		mov	[bp+var_C74], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_C72], ax
		lea	ax, [bp+var_C74]
		mov	word_4D392, ax
		mov	[bp+var_C74], 1BCh
		mov	[bp+var_C70], 0
		mov	[bp+var_C6C], 0
		mov	word ptr [bp+var_C7A+2], 0
		mov	[bp+var_C76], 0FFFFh
		cmp	[bp+var_15], 0
		jnz	short loc_A7208
		jmp	loc_A7287

loc_A7208:
		push	3
		lea	ax, word ptr [bp+var_134]
		push	ax
		push	4Ch
		lea	ax, [bp+var_3A0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, word ptr [bp+var_C7A+2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_134]
		push	ax
		lea	ax, word ptr [bp+var_C7A+2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4F00C
		mov	[bp+var_136], ax
		mov	word ptr [bp+var_13A+2], 0
		cmp	word ptr [bp+var_C7A+2], 0
		jz	short loc_A7287
		push	[bp+var_C76]
		mov	bx, word ptr [bp+var_C7A+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_13A+2]
		push	[bp+var_136]
		push	[bp+var_C76]
		mov	bx, word ptr [bp+var_C7A+2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_A7287

loc_A7287:
		mov	[bp+var_142], 0
		mov	byte ptr [bp+var_13E], 2
		mov	byte ptr [bp+var_13E+1], 0
		mov	[bp+var_13C], 0
		cmp	[bp+var_14], 0
		jz	short loc_A72DE
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		push	2
		lea	ax, word ptr [bp+var_142]
		push	ax
		push	8
		lea	ax, [bp+var_328]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_142]
		push	ax
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4

loc_A72DE:
		jmp	loc_A74DB

loc_A72E1:
		mov	di, word ptr [bp+var_C4E+1]
		cmp	di, 1Eh
		jle	short loc_A7306
		cmp	di, 78h
		jge	short loc_A7306
		mov	ax, word ptr [bp+var_126]
		mov	word ptr [bp+var_146+2], ax
		inc	word ptr [bp+var_126]
		mov	bx, word ptr [bp+var_120]
		mov	ax, word ptr [bp+var_146+2]
		mov	[bx+1Bh], ax

loc_A7306:
		cmp	di, 5Ah
		jnz	short loc_A731A
		push	9
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_A731A:
		cmp	di, 78h
		jnz	short loc_A734A
		push	word ptr [bp+var_120]
		lea	ax, [bp+var_C6A]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	word ptr [bp+var_120], 0
		jz	short loc_A734A
		push	3
		push	word ptr [bp+var_120]
		mov	bx, word ptr [bp+var_120]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_A734A

loc_A734A:
		mov	ax, word ptr [bp+var_128]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_A7379
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A7379
		mov	ax, [bp+var_12]
		mov	dx, 0Fh
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C0E]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A7379:
		mov	ax, word ptr [bp+var_128]
		add	ax, 5
		cmp	ax, di
		jge	short loc_A73A6
		mov	ax, word ptr [bp+var_128]
		add	ax, 0Ah
		cmp	ax, di
		jle	short loc_A73A6
		mov	ax, word ptr [bp+var_122]
		mov	word ptr [bp+var_146], ax
		inc	word ptr [bp+var_122]
		mov	bx, word ptr [bp+var_11C]
		mov	ax, word ptr [bp+var_146]
		mov	[bx+1Bh], ax

loc_A73A6:
		mov	ax, word ptr [bp+var_128]
		add	ax, 0Dh
		cmp	ax, di
		jge	short loc_A73D3
		mov	ax, word ptr [bp+var_128]
		add	ax, 12h
		cmp	ax, di
		jle	short loc_A73D3
		mov	ax, word ptr [bp+var_124]
		mov	[bp+var_148], ax
		inc	word ptr [bp+var_124]
		mov	bx, word ptr [bp+var_11E]
		mov	ax, [bp+var_148]
		mov	[bx+1Bh], ax

loc_A73D3:
		mov	ax, word ptr [bp+var_12A]
		add	ax, 8
		cmp	ax, di
		jnz	short loc_A73F3
		cmp	[bp+var_14], 0
		jz	short loc_A73F3
		push	0FFFFh
		lea	ax, [bp+var_BD4]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4

loc_A73F3:
		mov	ax, word ptr [bp+var_12A]
		add	ax, 1Bh
		cmp	ax, di
		jnz	short loc_A7428
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A7428
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		push	0A0h
		push	4
		push	2D17h
		lea	ax, [bp+var_C0E]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah

loc_A7428:
		mov	ax, word ptr [bp+var_12A]
		add	ax, 19h
		cmp	ax, di
		jge	short loc_A7455
		mov	ax, word ptr [bp+var_12A]
		add	ax, 1Eh
		cmp	ax, di
		jle	short loc_A7455
		dec	word ptr [bp+var_122]
		mov	ax, word ptr [bp+var_122]
		mov	word ptr [bp+var_14C+2], ax
		mov	bx, word ptr [bp+var_11C]
		mov	ax, word ptr [bp+var_14C+2]
		mov	[bx+1Bh], ax

loc_A7455:
		mov	ax, word ptr [bp+var_12A]
		add	ax, 20h
		cmp	ax, di
		jge	short loc_A7488
		mov	ax, word ptr [bp+var_12A]
		add	ax, 29h
		cmp	ax, di
		jle	short loc_A7488
		test	di, 1
		jz	short loc_A7488
		dec	word ptr [bp+var_124]
		mov	ax, word ptr [bp+var_124]
		mov	word ptr [bp+var_14C], ax
		mov	bx, word ptr [bp+var_11E]
		mov	ax, word ptr [bp+var_14C]
		mov	[bx+1Bh], ax

loc_A7488:
		mov	ax, word ptr [bp+var_12A]
		add	ax, 3Ch
		cmp	ax, di
		jnz	short loc_A74AB
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A74AB
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A74AB:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A74CE
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A74CC
		push	0
		lea	ax, [bp+var_C0E]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A74CC:
		jmp	short loc_A74FB

loc_A74CE:
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A74DB:
		mov	ax, word ptr [bp+var_C4E+1]
		cmp	ax, [bp+var_C]
		jnb	short loc_A74EB
		cmp	byte ptr [bp+var_C4E+3], 0
		jz	short loc_A74F0

loc_A74EB:
		mov	ax, 1
		jmp	short loc_A74F2

loc_A74F0:
		xor	ax, ax

loc_A74F2:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A74FB
		jmp	loc_A72E1

loc_A74FB:
		cmp	[bp+var_14], 0
		jz	short loc_A750E
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_A750E:
		cmp	byte ptr [bp+var_13E+1], 0
		jz	short loc_A7536
		cmp	[bp+var_142], 0
		jz	short loc_A7536
		push	0
		mov	al, byte ptr [bp+var_13E]
		push	ax
		lea	ax, word ptr [bp+var_142]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7536

loc_A7536:
		mov	[bp+var_142], 0
		mov	byte ptr [bp+var_13E+1], 0
		mov	[bp+var_13C], 0
		lea	ax, word ptr [bp+var_C7A+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_C74]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_130+1], 0
		jz	short loc_A7591
		cmp	[bp+var_134], 0
		jz	short loc_A7591
		push	0
		mov	al, byte ptr [bp+var_130]
		push	ax
		lea	ax, word ptr [bp+var_134]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7591

loc_A7591:
		mov	[bp+var_134], 0
		mov	byte ptr [bp+var_130+1], 0
		mov	[bp+var_12E], 0
		push	0
		lea	ax, [bp+var_C6A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C], 2
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		mov	[bp+var_12A], 0
		mov	byte ptr [bp+var_126], 2
		mov	byte ptr [bp+var_126+1], 0
		mov	[bp+var_124], 0
		push	ds
		push	offset aIff
		push	ds
		push	offset aCredits_1
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_21C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_D22]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_D22], 480h
		mov	[bp+var_CC1], 100h
		mov	[bp+var_CC5], 0
		mov	[bp+var_D22], 498h
		push	1
		lea	ax, [bp+var_21C]
		push	ax
		lea	ax, [bp+var_D22]
		push	ax
		mov	bx, [bp+var_D22]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large dword_4B706
		lea	ax, [bp+var_D22]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large dword_4B70B
		lea	ax, [bp+var_D22]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large dword_4B710
		lea	ax, [bp+var_D22]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	eax, [bp+var_CB0]
		mov	[bp+var_13A], eax
		push	1
		push	0
		push	2
		push	large [bp+var_13A]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_13C], dx
		mov	word ptr [bp+var_13E], ax
		mov	eax, [bp+var_13E]
		mov	[bp+var_12A], eax
		mov	byte ptr [bp+var_126], 2
		mov	byte ptr [bp+var_126+1], 1
		mov	[bp+var_124], 0
		mov	eax, [bp+var_13A]
		mov	[bp+var_124], eax
		push	0
		mov	al, byte ptr [bp+var_126]
		push	ax
		push	word ptr [bp+var_128]
		push	word ptr [bp+var_12A]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_D22]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		mov	eax, [bp+var_CAC]
		mov	[bp+var_CBD], eax
		lea	ax, [bp+var_D22]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		push	0
		push	large dword_4B715
		lea	ax, [bp+var_D22]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large dword_4B71A
		lea	ax, [bp+var_D22]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	eax, [bp+var_CB0]
		mov	[bp+var_142], eax
		push	1
		push	0
		push	2
		push	large [bp+var_142]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_146+2], dx
		mov	word ptr [bp+var_146], ax
		mov	eax, [bp+var_146]
		mov	[bp+var_120], eax
		mov	byte ptr [bp+var_11C], 2
		mov	byte ptr [bp+var_11C+1], 1
		mov	[bp+var_11A], 0
		mov	eax, [bp+var_142]
		mov	[bp+var_11A], eax
		push	0
		mov	al, byte ptr [bp+var_11C]
		push	ax
		push	word ptr [bp+var_11E]
		push	word ptr [bp+var_120]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_D22]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		lea	ax, [bp+var_D22]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_D22], 498h
		lea	ax, [bp+var_D22]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_D22]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	byte ptr [bp+var_12E], 0
		mov	byte ptr [bp+var_12E+1], 0
		mov	byte ptr [bp+var_12C], 0
		mov	[bp+var_131], 0
		lea	ax, word ptr [bp+var_12A]
		push	ax
		lea	ax, word ptr [bp+var_134]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_134]
		mov	al, byte ptr [bp+var_134+2]
		push	ax
		lea	ax, word ptr [bp+var_134]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	100h
		push	0
		lea	ax, word ptr [bp+var_13C]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		push	word ptr [bp+var_13C]
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, word ptr [bp+var_12E]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		call	Palette_FillRange_34CAC
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	word ptr [bp+var_13C]
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, word ptr [bp+var_13C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, word ptr [bp+var_120]
		push	ax
		lea	ax, [bp+var_C60]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		push	0
		push	word_4D36C
		lea	ax, word ptr [bp+var_C7A]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	ax, word_4D36E
		mov	[bp+var_136], ax
		push	[bp+var_136]
		lea	ax, word ptr [bp+var_C7A+2]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		lea	ax, [bp+var_C60]
		mov	[bp+var_C66], ax
		mov	[bp+var_C64], 2
		push	61h
		push	0A0h
		lea	ax, word ptr [bp+var_C7A]
		push	ax
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		push	2D3Fh
		lea	ax, word ptr [bp+var_C7A]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		push	100h
		push	0
		push	2
		lea	ax, word ptr [bp+var_12E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_FadeFromColor_34EEE
		add	sp, 0Ah
		call	Input_Flush_116D1
		xor	eax, eax
		mov	[bp+var_13A], eax
		mov	[bp+var_13E], eax
		mov	[bp+var_13A], 12Ch
		mov	eax, dword_4DE15
		mov	[bp+var_13E], eax
		mov	byte ptr [bp+var_142+3], 0
		jmp	short loc_A7995

loc_A794A:
		mov	byte ptr [bp+var_142+3], 0
		cmp	[bp+var_13], 0
		jz	short loc_A798A
		cmp	[bp+var_3AE], 0
		jz	short loc_A797D
		push	[bp+var_3AC]
		mov	bx, [bp+var_3AE]
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_A7979
		mov	ax, 1
		jmp	short loc_A797B

loc_A7979:
		xor	ax, ax

loc_A797B:
		jmp	short loc_A797F

loc_A797D:
		mov	al, 1

loc_A797F:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A798A
		mov	byte ptr [bp+var_142+3], 1

loc_A798A:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A7995
		jmp	short loc_A79BA

loc_A7995:
		mov	eax, [bp+var_13E]
		add	eax, [bp+var_13A]
		cmp	eax, dword_4DE15
		ja	short loc_A79AB
		mov	ax, 1
		jmp	short loc_A79AD

loc_A79AB:
		xor	ax, ax

loc_A79AD:
		mov	ah, 0
		or	ax, ax
		jz	short loc_A794A
		cmp	byte ptr [bp+var_142+3], 0
		jnz	short loc_A794A

loc_A79BA:
		push	100h
		push	0
		push	2
		lea	ax, word ptr [bp+var_12E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		lea	ax, word ptr [bp+var_C7A+2]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C60]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		lea	ax, word ptr [bp+var_134]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_126+1], 0
		jz	short loc_A7A31
		cmp	[bp+var_12A], 0
		jz	short loc_A7A31
		push	0
		mov	al, byte ptr [bp+var_126]
		push	ax
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7A31

loc_A7A31:
		mov	[bp+var_12A], 0
		mov	byte ptr [bp+var_126+1], 0
		mov	[bp+var_124], 0
		cmp	byte ptr [bp+var_11C+1], 0
		jz	short loc_A7A70
		cmp	[bp+var_120], 0
		jz	short loc_A7A70
		push	0
		mov	al, byte ptr [bp+var_11C]
		push	ax
		lea	ax, word ptr [bp+var_120]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7A70

loc_A7A70:
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11A], 0
		lea	ax, [bp+var_C46]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_C26]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_A7ACB
		cmp	[bp+var_10E], 0
		jz	short loc_A7ACB
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, word ptr [bp+var_10E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7ACB

loc_A7ACB:
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		lea	ax, [bp+var_C0C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_BEC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A7B26
		cmp	[bp+var_100], 0
		jz	short loc_A7B26
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, word ptr [bp+var_100]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7B26

loc_A7B26:
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A7B65
		cmp	[bp+var_F6], 0
		jz	short loc_A7B65
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, word ptr [bp+var_F6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7B65

loc_A7B65:
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A7BA4
		cmp	[bp+var_EC], 0
		jz	short loc_A7BA4
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_EC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7BA4

loc_A7BA4:
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A7BE3
		cmp	[bp+var_E2], 0
		jz	short loc_A7BE3
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7BE3

loc_A7BE3:
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A7C22
		cmp	[bp+var_D8], 0
		jz	short loc_A7C22
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7C22

loc_A7C22:
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A7C61
		cmp	[bp+var_CE], 0
		jz	short loc_A7C61
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7C61

loc_A7C61:
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A7CA0
		cmp	[bp+var_C4], 0
		jz	short loc_A7CA0
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7CA0

loc_A7CA0:
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A7CDF
		cmp	[bp+var_BA], 0
		jz	short loc_A7CDF
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7CDF

loc_A7CDF:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A7D1E
		cmp	[bp+var_B0], 0
		jz	short loc_A7D1E
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7D1E

loc_A7D1E:
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9B], 0
		jz	short loc_A7D6A
		cmp	[bp+var_A0], 0
		jz	short loc_A7D6A
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7D6A

loc_A7D6A:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_8B], 0
		jz	short loc_A7DB6
		cmp	[bp+var_90], 0
		jz	short loc_A7DB6
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_90]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7DB6

loc_A7DB6:
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7B], 0
		jz	short loc_A7DFE
		cmp	[bp+var_80], 0
		jz	short loc_A7DFE
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7DFE

loc_A7DFE:
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_6B], 0
		jz	short loc_A7E42
		cmp	[bp+var_70], 0
		jz	short loc_A7E42
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7E42

loc_A7E42:
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_5B], 0
		jz	short loc_A7E86
		cmp	[bp+var_60], 0
		jz	short loc_A7E86
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7E86

loc_A7E86:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4B], 0
		jz	short loc_A7ECA
		cmp	[bp+var_50], 0
		jz	short loc_A7ECA
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7ECA

loc_A7ECA:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A7F02
		cmp	[bp+var_46], 0
		jz	short loc_A7F02
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7F02

loc_A7F02:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A7F3A
		cmp	[bp+var_3C], 0
		jz	short loc_A7F3A
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7F3A

loc_A7F3A:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BD4], 129Fh
		lea	ax, [bp+var_BD4]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_BBF], 0
		jz	short loc_A7F89
		cmp	[bp+var_BC4], 0
		jz	short loc_A7F89
		push	0
		mov	al, [bp+var_BC0]
		push	ax
		lea	ax, word ptr [bp+var_BC4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7F89

loc_A7F89:
		mov	[bp+var_BC4], 0
		mov	[bp+var_BBF], 0
		mov	[bp+var_BBE], 0
		lea	ax, [bp+var_3AE]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3AA]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A7FEF
		cmp	[bp+var_30], 0
		jz	short loc_A7FEF
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A7FEF

loc_A7FEF:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_328]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_238]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_22A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_114F8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_9CBE0		endp

; START OF FUNCTION CHUNK FOR sub_9CBE0
off_A8065	dw offset loc_9CDE1
		dw offset loc_9CF5A
		dw offset loc_9CF5A
		dw offset loc_9CF5A
		dw offset loc_9CF5A
; END OF FUNCTION CHUNK FOR sub_9CBE0
ovr211		ends
