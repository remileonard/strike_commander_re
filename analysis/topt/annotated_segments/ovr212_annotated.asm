ovr212		segment	para public 'OVERLAY' use16
		assume cs:ovr212
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, cinématique mid34 de Tactical Operations (2026-11-02) : script extrait par
; tools/midgame_extract.py dans analysis/topt/midgames/mid34.md et .json, fichier
; analysis/topt/midgames/iff. Fonction entière lue par exécution symbolique, pas commentée
; ligne à ligne.
; ==============================================================================================
Midgame34_Play_A8070		proc far

var_C28		= word ptr -0C28h
var_C26		= word ptr -0C26h
var_C24		= word ptr -0C24h
var_C22		= word ptr -0C22h
var_C18		= word ptr -0C18h
var_BE8		= word ptr -0BE8h
var_BBB		= dword ptr -0BBBh
var_BB7		= dword ptr -0BB7h
var_BB3		= dword ptr -0BB3h
var_BA6		= word ptr -0BA6h
var_BA2		= dword ptr -0BA2h
var_B9E		= word ptr -0B9Eh
var_B9C		= word ptr -0B9Ch
var_B9A		= word ptr -0B9Ah
var_B98		= dword ptr -0B98h
var_B94		= byte ptr -0B94h
var_B92		= word ptr -0B92h
var_B7E		= word ptr -0B7Eh
var_B7C		= word ptr -0B7Ch
var_B7A		= word ptr -0B7Ah
var_B78		= word ptr -0B78h
var_B76		= dword ptr -0B76h
var_B72		= byte ptr -0B72h
var_B70		= word ptr -0B70h
var_B6E		= word ptr -0B6Eh
var_B5C		= word ptr -0B5Ch
var_B4E		= word ptr -0B4Eh
var_B36		= word ptr -0B36h
var_B34		= word ptr -0B34h
var_B26		= dword ptr -0B26h
var_B22		= byte ptr -0B22h
var_B21		= byte ptr -0B21h
var_B20		= dword ptr -0B20h
var_319		= dword ptr -319h
var_315		= dword ptr -315h
var_310		= word ptr -310h
var_30E		= word ptr -30Eh
var_30C		= word ptr -30Ch
var_30A		= word ptr -30Ah
var_308		= dword ptr -308h
var_304		= byte ptr -304h
var_302		= word ptr -302h
var_28A		= word ptr -28Ah
var_212		= word ptr -212h
var_19A		= word ptr -19Ah
var_198		= word ptr -198h
var_196		= word ptr -196h
var_194		= word ptr -194h
var_192		= word ptr -192h
var_190		= word ptr -190h
var_18C		= word ptr -18Ch
var_18A		= word ptr -18Ah
var_188		= word ptr -188h
var_186		= word ptr -186h
var_184		= word ptr -184h
var_182		= word ptr -182h
var_17E		= word ptr -17Eh
var_12E		= word ptr -12Eh
var_12C		= word ptr -12Ch
var_12A		= word ptr -12Ah
var_128		= word ptr -128h
var_126		= word ptr -126h
var_124		= dword ptr -124h
var_120		= byte ptr -120h
var_11F		= byte ptr -11Fh
var_11E		= dword ptr -11Eh
var_11A		= dword ptr -11Ah
var_116		= dword ptr -116h
var_114		= dword ptr -114h
var_110		= dword ptr -110h
var_10E		= dword ptr -10Eh
var_10C		= dword ptr -10Ch
var_10A		= dword ptr -10Ah
var_108		= dword ptr -108h
var_106		= dword ptr -106h
var_104		= dword ptr -104h
var_102		= dword ptr -102h
var_100		= dword ptr -100h
var_FC		= dword ptr -0FCh
var_F8		= word ptr -0F8h
var_F6		= word ptr -0F6h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= byte ptr -0ECh
var_EB		= byte ptr -0EBh
var_EA		= dword ptr -0EAh
var_E6		= dword ptr -0E6h
var_E2		= byte ptr -0E2h
var_E1		= byte ptr -0E1h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= byte ptr -0D8h
var_D7		= byte ptr -0D7h
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= byte ptr -0CEh
var_CD		= byte ptr -0CDh
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= byte ptr -0C4h
var_C3		= byte ptr -0C3h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= byte ptr -0BAh
var_B9		= byte ptr -0B9h
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= byte ptr -0B0h
var_AF		= byte ptr -0AFh
var_AE		= dword ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= byte ptr -0A6h
var_A5		= byte ptr -0A5h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= byte ptr -9Ch
var_9B		= byte ptr -9Bh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= byte ptr -92h
var_91		= byte ptr -91h
var_90		= dword ptr -90h
var_8C		= word ptr -8Ch
var_8A		= byte ptr -8Ah
var_89		= word ptr -89h
var_86		= dword ptr -86h
var_82		= byte ptr -82h
var_81		= byte ptr -81h
var_80		= dword ptr -80h
var_7C		= word ptr -7Ch
var_7A		= byte ptr -7Ah
var_79		= word ptr -79h
var_76		= dword ptr -76h
var_72		= byte ptr -72h
var_71		= byte ptr -71h
var_70		= dword ptr -70h
var_6C		= word ptr -6Ch
var_6A		= byte ptr -6Ah
var_69		= word ptr -69h
var_66		= dword ptr -66h
var_62		= byte ptr -62h
var_61		= byte ptr -61h
var_60		= dword ptr -60h
var_5C		= word ptr -5Ch
var_5A		= byte ptr -5Ah
var_59		= word ptr -59h
var_56		= dword ptr -56h
var_52		= byte ptr -52h
var_51		= byte ptr -51h
var_50		= dword ptr -50h
var_4C		= word ptr -4Ch
var_4A		= byte ptr -4Ah
var_49		= word ptr -49h
var_46		= dword ptr -46h
var_42		= byte ptr -42h
var_41		= byte ptr -41h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= byte ptr -38h
var_37		= byte ptr -37h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= byte ptr -2Eh
var_2D		= byte ptr -2Dh
var_2C		= dword ptr -2Ch
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

		push	bp
		mov	bp, sp
		sub	sp, 0C18h
		push	si
		push	di
		mov	[bp+var_6], 0
		push	0C8h
		push	0Bh
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Init_114D6
		add	sp, 6
		mov	byte_4F55C, 0
		mov	[bp+var_9], 0
		mov	[bp+var_A], 0
		mov	[bp+var_B], 0
		cmp	word_4CA5B, 0
		jz	short loc_A80AB
		mov	[bp+var_A], 1

loc_A80AB:
		mov	ax, word_4D36E
		mov	[bp+var_E], ax
		mov	[bp+var_18C], 0
		mov	[bp+var_18A], 0
		push	[bp+var_E]
		lea	ax, [bp+var_18C]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_19A], 0
		mov	[bp+var_198], 0
		mov	[bp+var_196], 0
		mov	[bp+var_194], 0
		mov	[bp+var_192], 13Fh
		mov	[bp+var_190], 9Dh
		push	0
		lea	ax, [bp+var_19A]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_19A]
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
		mov	[bp+var_188], 0
		mov	[bp+var_186], 18h
		mov	[bp+var_184], 13Fh
		mov	[bp+var_182], 97h
		mov	byte ptr [bp+var_1C], 0
		mov	byte ptr [bp+var_1C+1], 0
		mov	[bp+var_1A], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgames_36
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_17E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_17E]
		push	ax
		lea	ax, [bp+var_212]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_212]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid34voc
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_17E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		cmp	[bp+var_A], 0
		jz	short loc_A81E3
		push	ds
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_A81E3
		push	1
		lea	ax, [bp+var_17E]
		push	ax
		lea	ax, [bp+var_28A]
		push	ax
		mov	bx, [bp+var_28A]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_28A]
		push	ax
		call	sub_435F1
		add	sp, 2
		jmp	short loc_A81E7

loc_A81E3:
		mov	[bp+var_A], 0

loc_A81E7:
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		mov	al, byte_4CA58
		mov	[bp+var_28], al
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_28]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_A8222
		jmp	loc_A8545

loc_A8222:
		shl	bx, 1
		jmp	cs:off_AEDD4[bx]	; switch jump

loc_A8229:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_17E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_A8257
		jmp	loc_A8361

loc_A8257:
		push	1
		lea	ax, [bp+var_17E]
		push	ax
		lea	ax, [bp+var_302]
		push	ax
		mov	bx, [bp+var_302]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_302]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_37
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_17E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_C18]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_C18], 480h
		mov	[bp+var_BB7], 100h
		mov	[bp+var_BBB], 0
		mov	[bp+var_C18], 498h
		push	1
		lea	ax, [bp+var_17E]
		push	ax
		lea	ax, [bp+var_C18]
		push	ax
		mov	bx, [bp+var_C18]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	di, 1
		jmp	short loc_A8329

loc_A8313:
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	di

loc_A8329:
		cmp	di, 6Ah
		jle	short loc_A8313
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_B], 1
		mov	[bp+var_C18], 498h
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_C18]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_A8361:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_17E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_A839F
		mov	[bp+var_9], 1
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A839F
		mov	word_4F048, 5Ah

loc_A839F:
		jmp	loc_A8545

loc_A83A2:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_17E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_A83D0
		jmp	loc_A84E4

loc_A83D0:
		cmp	word_4CA5D, 0
		jnz	short loc_A83DA
		jmp	loc_A84E4

loc_A83DA:
		push	1
		lea	ax, [bp+var_17E]
		push	ax
		lea	ax, [bp+var_302]
		push	ax
		mov	bx, [bp+var_302]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_302]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_38
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_17E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_C18]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_C18], 480h
		mov	[bp+var_BB7], 100h
		mov	[bp+var_BBB], 0
		mov	[bp+var_C18], 498h
		push	1
		lea	ax, [bp+var_17E]
		push	ax
		lea	ax, [bp+var_C18]
		push	ax
		mov	bx, [bp+var_C18]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	di, 1
		jmp	short loc_A84AC

loc_A8496:
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	di

loc_A84AC:
		cmp	di, 6Ah
		jle	short loc_A8496
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_B], 1
		mov	[bp+var_C18], 498h
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_C18]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_A84E4:
		cmp	[bp+var_28], 3
		jnz	short loc_A8505
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_17E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_A851E

loc_A8505:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_17E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_A851E:
		push	ds
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_A8543
		mov	[bp+var_9], 1
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A8543
		mov	word_4F048, 0FFh

loc_A8543:
		jmp	short loc_A8545

loc_A8545:
		cmp	[bp+var_B], 0
		jnz	short loc_A854E
		jmp	loc_A8641

loc_A854E:
		mov	[bp+var_B7A], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_B78], ax
		lea	ax, [bp+var_B7A]
		mov	word_4D392, ax
		mov	[bp+var_B7A], 1BCh
		mov	[bp+var_B76], 0
		mov	[bp+var_B72], 0
		mov	[bp+var_B7E], 0
		mov	[bp+var_B7C], 0FFFFh
		push	word_4CA5D
		lea	ax, [bp+var_B7E]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		mov	[bp+var_102], 0
		mov	byte ptr [bp+var_100+2], 2
		mov	byte ptr [bp+var_100+3], 0
		mov	[bp+var_FC], 0
		push	3
		lea	ax, word ptr [bp+var_102]
		push	ax
		push	4Ch
		lea	ax, [bp+var_302]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		lea	ax, word ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_B7E]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_B7E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		cmp	byte ptr [bp+var_100+3], 0
		jz	short loc_A860E
		cmp	[bp+var_102], 0
		jz	short loc_A860E
		push	0
		mov	al, byte ptr [bp+var_100+2]
		push	ax
		lea	ax, word ptr [bp+var_102]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A860E

loc_A860E:
		mov	[bp+var_102], 0
		mov	byte ptr [bp+var_100+3], 0
		mov	[bp+var_FC], 0
		lea	ax, [bp+var_B7E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_B7A]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_A8641:
		mov	[bp+var_30C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_30A], ax
		lea	ax, [bp+var_30C]
		mov	word_4D392, ax
		mov	[bp+var_30C], 1BCh
		mov	[bp+var_308], 0
		mov	[bp+var_304], 0
		mov	[bp+var_310], 0
		mov	[bp+var_30E], 0FFFFh
		cmp	[bp+var_9], 0
		jnz	short loc_A867E
		jmp	loc_A86FE

loc_A867E:
		push	1
		lea	ax, [bp+var_17E]
		push	ax
		lea	ax, [bp+var_BE8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_BE8]
		push	ax
		call	sub_435F1
		add	sp, 2
		cmp	[bp+var_A], 0
		jz	short loc_A86AC
		mov	byte ptr [bp+var_FC+3], 14h
		jmp	short loc_A86B1

loc_A86AC:
		mov	byte ptr [bp+var_FC+3], 13h

loc_A86B1:
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		mov	al, byte ptr [bp+var_FC+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_BE8]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_310]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_310]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, [bp+var_BE8]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_A86FE:
		mov	[bp+var_B36], 129Fh
		mov	[bp+var_B26], 0
		mov	[bp+var_B22], 2
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		mov	[bp+var_B34], 0
		mov	[bp+var_B36], 1FA5h
		xor	eax, eax
		mov	[bp+var_319], eax
		mov	[bp+var_315], eax
		cmp	[bp+var_A], 0
		jz	short loc_A8753
		push	word_4CA5B
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		jmp	loc_A8858

loc_A8753:
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_39
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_17E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_C18]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_C18], 480h
		mov	[bp+var_BB7], 100h
		mov	[bp+var_BBB], 0
		mov	[bp+var_C18], 498h
		push	1
		lea	ax, [bp+var_17E]
		push	ax
		lea	ax, [bp+var_C18]
		push	ax
		mov	bx, [bp+var_C18]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3433474Dh
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		xor	di, di
		jmp	short loc_A8824

loc_A87DB:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	ax, [bp+var_BA6]
		mov	word ptr [bp+var_FC+2], ax
		movsx	eax, word ptr [bp+var_FC+2]
		push	eax
		push	ds
		mov	ax, [bp+var_8]
		imul	di
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_BA2]
		mov	[bp+var_BB3], eax
		inc	di

loc_A8824:
		cmp	di, 0Bh
		jl	short loc_A87DB
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_C18], 498h
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_C18]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_A8858:
		mov	[bp+var_32], 0
		mov	[bp+var_2E], 2
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		push	3
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	2Ah
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_3C], 0
		mov	[bp+var_38], 2
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		push	3
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	2Ch
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_46], 0
		mov	[bp+var_42], 2
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	0
		push	2
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	ConvData_LoadNormalOrNight_10C9F
		add	sp, 6
		mov	[bp+var_49], 0
		lea	ax, word ptr [bp+var_46]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_56], 0
		mov	[bp+var_52], 2
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	25h
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_59], 0
		lea	ax, word ptr [bp+var_56]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_66], 0
		mov	[bp+var_62], 2
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	2Bh
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_69], 0
		lea	ax, word ptr [bp+var_66]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_76], 0
		mov	[bp+var_72], 2
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	2Dh
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_79], 0
		lea	ax, word ptr [bp+var_76]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_86], 0
		mov	[bp+var_82], 2
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	29h
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_89], 0
		lea	ax, word ptr [bp+var_86]
		push	ax
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_96], 0
		mov	[bp+var_92], 2
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	3
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	1Dh
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_A0], 0
		mov	[bp+var_9C], 2
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	3
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	21h
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_AA], 0
		mov	[bp+var_A6], 2
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		push	3
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	22h
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_B4], 0
		mov	[bp+var_B0], 2
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		push	3
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	23h
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_BE], 0
		mov	[bp+var_BA], 2
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		push	3
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	2D75h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_C8], 0
		mov	[bp+var_C4], 2
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	3
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	2D79h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_D2], 0
		mov	[bp+var_CE], 2
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		push	3
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	2D7Eh
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_DC], 0
		mov	[bp+var_D8], 2
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		push	3
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	2D82h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_E6], 0
		mov	[bp+var_E2], 2
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		push	3
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	2D87h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		mov	[bp+var_F0], 0
		mov	[bp+var_EC], 2
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		push	ds
		push	offset aShp
		push	ds
		push	offset aConvfont_2
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_17E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_17E]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_F4+2], dx
		mov	word ptr [bp+var_F4], ax
		mov	eax, [bp+var_F4]
		mov	[bp+var_F0], eax
		mov	[bp+var_EC], 2
		mov	[bp+var_EB], 1
		mov	[bp+var_EA], 0
		lea	ax, word ptr [bp+var_F0]
		push	ax
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		lea	ax, [bp+var_B4E]
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	[bp+var_C28], 0
		mov	[bp+var_C26], 98h
		mov	[bp+var_C24], 13Fh
		mov	[bp+var_C22], 0C7h
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0C8h
		lea	ax, [bp+var_B70]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_A8C81
		jmp	loc_A91F5

loc_A8C81:
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_A8CC5
		cmp	[bp+var_F0], 0
		jz	short loc_A8CC5
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8CC5

loc_A8CC5:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_A8D04
		cmp	[bp+var_E6], 0
		jz	short loc_A8D04
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8D04

loc_A8D04:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_A8D43
		cmp	[bp+var_DC], 0
		jz	short loc_A8D43
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8D43

loc_A8D43:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_A8D82
		cmp	[bp+var_D2], 0
		jz	short loc_A8D82
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8D82

loc_A8D82:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_A8DC1
		cmp	[bp+var_C8], 0
		jz	short loc_A8DC1
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8DC1

loc_A8DC1:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_A8E00
		cmp	[bp+var_BE], 0
		jz	short loc_A8E00
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8E00

loc_A8E00:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_A8E3F
		cmp	[bp+var_B4], 0
		jz	short loc_A8E3F
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8E3F

loc_A8E3F:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_A8E7E
		cmp	[bp+var_AA], 0
		jz	short loc_A8E7E
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8E7E

loc_A8E7E:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_A8EBD
		cmp	[bp+var_A0], 0
		jz	short loc_A8EBD
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8EBD

loc_A8EBD:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_A8EFC
		cmp	[bp+var_96], 0
		jz	short loc_A8EFC
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8EFC

loc_A8EFC:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_A8F48
		cmp	[bp+var_86], 0
		jz	short loc_A8F48
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8F48

loc_A8F48:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_A8F8E
		cmp	[bp+var_76], 0
		jz	short loc_A8F8E
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8F8E

loc_A8F8E:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_A8FD2
		cmp	[bp+var_66], 0
		jz	short loc_A8FD2
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A8FD2

loc_A8FD2:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_A9016
		cmp	[bp+var_56], 0
		jz	short loc_A9016
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9016

loc_A9016:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_A905A
		cmp	[bp+var_46], 0
		jz	short loc_A905A
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A905A

loc_A905A:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A9092
		cmp	[bp+var_3C], 0
		jz	short loc_A9092
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9092

loc_A9092:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_A90CA
		cmp	[bp+var_32], 0
		jz	short loc_A90CA
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A90CA

loc_A90CA:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_A9119
		cmp	[bp+var_B26], 0
		jz	short loc_A9119
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9119

loc_A9119:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_A917F
		cmp	[bp+var_26], 0
		jz	short loc_A917F
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A917F

loc_A917F:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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

loc_A91F5:
		cmp	[bp+var_9], 0
		jz	short loc_A923F
		mov	ax, word_4F048
		mov	[bp+var_F6], ax
		mov	[bp+var_F8], 0
		cmp	[bp+var_310], 0
		jz	short loc_A923F
		push	[bp+var_30E]
		mov	bx, [bp+var_310]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_F8]
		push	[bp+var_F6]
		push	[bp+var_30E]
		mov	bx, [bp+var_310]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_A923F

loc_A923F:
		lea	ax, [bp+var_18C]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_FC+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_FC], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_100+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_100], ax
		push	[bp+var_5C]
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_FC+2]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_FC]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_100+2]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_100]
		lea	ax, [bp+var_B92]
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
		push	[bp+var_5C]
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		lea	ax, [bp+var_B92]
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
		cmp	[bp+var_A], 0
		jnz	short loc_A93A3
		jmp	loc_A9583

loc_A93A3:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_10A], 0
		mov	byte ptr [bp+var_106], 2
		mov	byte ptr [bp+var_106+1], 0
		mov	[bp+var_104], 0
		push	2
		lea	ax, word ptr [bp+var_10A]
		push	ax
		push	0
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_10A]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_A9406

loc_A93F8:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_A9406:
		cmp	di, 4
		jl	short loc_A93F8
		push	0FFFFh
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_A9436

loc_A941C:
		jmp	short loc_A9429
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A9429
		jmp	short loc_A9447

loc_A9429:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A9436:
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_A941C

loc_A9447:
		xor	di, di
		jmp	short loc_A9459

loc_A944B:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_A9459:
		cmp	di, 8
		jl	short loc_A944B
		mov	[bp+var_114], 0
		mov	byte ptr [bp+var_110], 2
		mov	byte ptr [bp+var_110+1], 0
		mov	[bp+var_10E], 0
		push	2
		lea	ax, word ptr [bp+var_114]
		push	ax
		push	1
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_114]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_A94CD

loc_A94B3:
		jmp	short loc_A94C0
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A94C0
		jmp	short loc_A94DE

loc_A94C0:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A94CD:
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_A94B3

loc_A94DE:
		xor	di, di
		jmp	short loc_A94F0

loc_A94E2:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_A94F0:
		cmp	di, 4
		jl	short loc_A94E2
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_110+1], 0
		jz	short loc_A952A
		cmp	[bp+var_114], 0
		jz	short loc_A952A
		push	0
		mov	al, byte ptr [bp+var_110]
		push	ax
		lea	ax, word ptr [bp+var_114]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A952A

loc_A952A:
		mov	[bp+var_114], 0
		mov	byte ptr [bp+var_110+1], 0
		mov	[bp+var_10E], 0
		cmp	byte ptr [bp+var_106+1], 0
		jz	short loc_A9569
		cmp	[bp+var_10A], 0
		jz	short loc_A9569
		push	0
		mov	al, byte ptr [bp+var_106]
		push	ax
		lea	ax, word ptr [bp+var_10A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9569

loc_A9569:
		mov	[bp+var_10A], 0
		mov	byte ptr [bp+var_106+1], 0
		mov	[bp+var_104], 0
		jmp	loc_A9C65

loc_A9583:
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0E9h
		lea	ax, [bp+var_B70]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+var_4], 32h
		mov	si, word ptr [bp+var_B76+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	short loc_A961F

loc_A95C2:
		mov	di, word ptr [bp+var_B76+1]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_A95DF
		push	[bp+var_6]
		lea	ax, [bp+var_B70]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A95DF:
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_A95F6
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A95F6:
		jmp	short loc_A9612
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A9612
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_A963C

loc_A9612:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A961F:
		mov	ax, word ptr [bp+var_B76+1]
		cmp	ax, [bp+var_2]
		jnb	short loc_A962F
		cmp	byte ptr [bp+var_B76+3], 0
		jz	short loc_A9634

loc_A962F:
		mov	ax, 1
		jmp	short loc_A9636

loc_A9634:
		xor	ax, ax

loc_A9636:
		mov	ah, 0
		or	ax, ax
		jz	short loc_A95C2

loc_A963C:
		cmp	byte_4F55C, 0
		jnz	short loc_A9646
		jmp	loc_A9BC9

loc_A9646:
		push	0
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_A9699
		cmp	[bp+var_F0], 0
		jz	short loc_A9699
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9699

loc_A9699:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_A96D8
		cmp	[bp+var_E6], 0
		jz	short loc_A96D8
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A96D8

loc_A96D8:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_A9717
		cmp	[bp+var_DC], 0
		jz	short loc_A9717
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9717

loc_A9717:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_A9756
		cmp	[bp+var_D2], 0
		jz	short loc_A9756
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9756

loc_A9756:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_A9795
		cmp	[bp+var_C8], 0
		jz	short loc_A9795
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9795

loc_A9795:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_A97D4
		cmp	[bp+var_BE], 0
		jz	short loc_A97D4
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A97D4

loc_A97D4:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_A9813
		cmp	[bp+var_B4], 0
		jz	short loc_A9813
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9813

loc_A9813:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_A9852
		cmp	[bp+var_AA], 0
		jz	short loc_A9852
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9852

loc_A9852:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_A9891
		cmp	[bp+var_A0], 0
		jz	short loc_A9891
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9891

loc_A9891:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_A98D0
		cmp	[bp+var_96], 0
		jz	short loc_A98D0
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A98D0

loc_A98D0:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_A991C
		cmp	[bp+var_86], 0
		jz	short loc_A991C
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A991C

loc_A991C:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_A9962
		cmp	[bp+var_76], 0
		jz	short loc_A9962
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9962

loc_A9962:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_A99A6
		cmp	[bp+var_66], 0
		jz	short loc_A99A6
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A99A6

loc_A99A6:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_A99EA
		cmp	[bp+var_56], 0
		jz	short loc_A99EA
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A99EA

loc_A99EA:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_A9A2E
		cmp	[bp+var_46], 0
		jz	short loc_A9A2E
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9A2E

loc_A9A2E:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A9A66
		cmp	[bp+var_3C], 0
		jz	short loc_A9A66
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9A66

loc_A9A66:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_A9A9E
		cmp	[bp+var_32], 0
		jz	short loc_A9A9E
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9A9E

loc_A9A9E:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_A9AED
		cmp	[bp+var_B26], 0
		jz	short loc_A9AED
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9AED

loc_A9AED:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_A9B53
		cmp	[bp+var_26], 0
		jz	short loc_A9B53
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9B53

loc_A9B53:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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

loc_A9BC9:
		mov	[bp+var_4], 26h
		mov	si, word ptr [bp+var_B76+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	short loc_A9C48

loc_A9BE9:
		mov	di, word ptr [bp+var_B76+1]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_A9C08
		mov	ax, [bp+var_6]
		add	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_B70]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_A9C08:
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_A9C1F
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_A9C1F:
		jmp	short loc_A9C3B
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_A9C3B
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_A9C65

loc_A9C3B:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_A9C48:
		mov	ax, word ptr [bp+var_B76+1]
		cmp	ax, [bp+var_2]
		jnb	short loc_A9C58
		cmp	byte ptr [bp+var_B76+3], 0
		jz	short loc_A9C5D

loc_A9C58:
		mov	ax, 1
		jmp	short loc_A9C5F

loc_A9C5D:
		xor	ax, ax

loc_A9C5F:
		mov	ah, 0
		or	ax, ax
		jz	short loc_A9BE9

loc_A9C65:
		push	0
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_A9C7E
		jmp	loc_AA1F2

loc_A9C7E:
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_A9CC2
		cmp	[bp+var_F0], 0
		jz	short loc_A9CC2
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9CC2

loc_A9CC2:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_A9D01
		cmp	[bp+var_E6], 0
		jz	short loc_A9D01
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9D01

loc_A9D01:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_A9D40
		cmp	[bp+var_DC], 0
		jz	short loc_A9D40
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9D40

loc_A9D40:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_A9D7F
		cmp	[bp+var_D2], 0
		jz	short loc_A9D7F
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9D7F

loc_A9D7F:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_A9DBE
		cmp	[bp+var_C8], 0
		jz	short loc_A9DBE
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9DBE

loc_A9DBE:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_A9DFD
		cmp	[bp+var_BE], 0
		jz	short loc_A9DFD
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9DFD

loc_A9DFD:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_A9E3C
		cmp	[bp+var_B4], 0
		jz	short loc_A9E3C
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9E3C

loc_A9E3C:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_A9E7B
		cmp	[bp+var_AA], 0
		jz	short loc_A9E7B
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9E7B

loc_A9E7B:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_A9EBA
		cmp	[bp+var_A0], 0
		jz	short loc_A9EBA
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9EBA

loc_A9EBA:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_A9EF9
		cmp	[bp+var_96], 0
		jz	short loc_A9EF9
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9EF9

loc_A9EF9:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_A9F45
		cmp	[bp+var_86], 0
		jz	short loc_A9F45
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9F45

loc_A9F45:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_A9F8B
		cmp	[bp+var_76], 0
		jz	short loc_A9F8B
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9F8B

loc_A9F8B:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_A9FCF
		cmp	[bp+var_66], 0
		jz	short loc_A9FCF
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_A9FCF

loc_A9FCF:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_AA013
		cmp	[bp+var_56], 0
		jz	short loc_AA013
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA013

loc_AA013:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_AA057
		cmp	[bp+var_46], 0
		jz	short loc_AA057
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA057

loc_AA057:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AA08F
		cmp	[bp+var_3C], 0
		jz	short loc_AA08F
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA08F

loc_AA08F:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_AA0C7
		cmp	[bp+var_32], 0
		jz	short loc_AA0C7
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA0C7

loc_AA0C7:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_AA116
		cmp	[bp+var_B26], 0
		jz	short loc_AA116
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA116

loc_AA116:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_AA17C
		cmp	[bp+var_26], 0
		jz	short loc_AA17C
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA17C

loc_AA17C:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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

loc_AA1F2:
		lea	ax, [bp+var_18C]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_FC+2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_FC], ax
		push	13h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	word ptr [bp+var_FC+2]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_FC]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_7C]
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_4C]
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4C]
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
		jnz	short loc_AA2DB
		jmp	loc_AAAFE

loc_AA2DB:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	2
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	word ptr [bp+var_FC]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		xor	di, di
		jmp	short loc_AA33F

loc_AA331:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_AA33F:
		cmp	di, 3
		jl	short loc_AA331
		xor	di, di
		jmp	short loc_AA3B1

loc_AA348:
		cmp	di, 5
		jnz	short loc_AA35B
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AA35B:
		cmp	di, 6
		jnz	short loc_AA36E
		push	0FFFFh
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AA36E:
		cmp	di, 9
		jnz	short loc_AA381
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AA381:
		mov	ax, di
		inc	di
		cmp	ax, 0Ah
		jnz	short loc_AA397
		push	13h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AA397:
		jmp	short loc_AA3A4
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_AA3A4
		jmp	short loc_AA3C1

loc_AA3A4:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_AA3B1:
		push	word ptr [bp+var_FC]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_AA348

loc_AA3C1:
		cmp	byte_4F55C, 0
		jnz	short loc_AA3CB
		jmp	loc_AA98D

loc_AA3CB:
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_AA3F3
		cmp	[bp+var_106], 0
		jz	short loc_AA3F3
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA3F3

loc_AA3F3:
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	0
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_AA45D
		cmp	[bp+var_F0], 0
		jz	short loc_AA45D
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA45D

loc_AA45D:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_AA49C
		cmp	[bp+var_E6], 0
		jz	short loc_AA49C
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA49C

loc_AA49C:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_AA4DB
		cmp	[bp+var_DC], 0
		jz	short loc_AA4DB
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA4DB

loc_AA4DB:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_AA51A
		cmp	[bp+var_D2], 0
		jz	short loc_AA51A
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA51A

loc_AA51A:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_AA559
		cmp	[bp+var_C8], 0
		jz	short loc_AA559
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA559

loc_AA559:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_AA598
		cmp	[bp+var_BE], 0
		jz	short loc_AA598
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA598

loc_AA598:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_AA5D7
		cmp	[bp+var_B4], 0
		jz	short loc_AA5D7
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA5D7

loc_AA5D7:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_AA616
		cmp	[bp+var_AA], 0
		jz	short loc_AA616
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA616

loc_AA616:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_AA655
		cmp	[bp+var_A0], 0
		jz	short loc_AA655
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA655

loc_AA655:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_AA694
		cmp	[bp+var_96], 0
		jz	short loc_AA694
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA694

loc_AA694:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_AA6E0
		cmp	[bp+var_86], 0
		jz	short loc_AA6E0
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA6E0

loc_AA6E0:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_AA726
		cmp	[bp+var_76], 0
		jz	short loc_AA726
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA726

loc_AA726:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_AA76A
		cmp	[bp+var_66], 0
		jz	short loc_AA76A
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA76A

loc_AA76A:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_AA7AE
		cmp	[bp+var_56], 0
		jz	short loc_AA7AE
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA7AE

loc_AA7AE:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_AA7F2
		cmp	[bp+var_46], 0
		jz	short loc_AA7F2
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA7F2

loc_AA7F2:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AA82A
		cmp	[bp+var_3C], 0
		jz	short loc_AA82A
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA82A

loc_AA82A:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_AA862
		cmp	[bp+var_32], 0
		jz	short loc_AA862
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA862

loc_AA862:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_AA8B1
		cmp	[bp+var_B26], 0
		jz	short loc_AA8B1
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA8B1

loc_AA8B1:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_AA917
		cmp	[bp+var_26], 0
		jz	short loc_AA917
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AA917

loc_AA917:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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

loc_AA98D:
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C], 2
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		push	2
		lea	ax, word ptr [bp+var_110]
		push	ax
		push	3
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	9
		lea	ax, word ptr [bp+var_110]
		push	ax
		push	word ptr [bp+var_FC]
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		xor	di, di
		jmp	short loc_AA9E4

loc_AA9D6:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_AA9E4:
		cmp	di, 0Eh
		jl	short loc_AA9D6
		xor	di, di
		jmp	short loc_AAA56

loc_AA9ED:
		cmp	di, 5
		jnz	short loc_AAA00
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AAA00:
		cmp	di, 6
		jnz	short loc_AAA13
		push	0FFFFh
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AAA13:
		cmp	di, 9
		jnz	short loc_AAA26
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AAA26:
		mov	ax, di
		inc	di
		cmp	ax, 0Ah
		jnz	short loc_AAA3C
		push	13h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AAA3C:
		jmp	short loc_AAA49
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_AAA49
		jmp	short loc_AAA66

loc_AAA49:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_AAA56:
		push	word ptr [bp+var_FC]
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_AA9ED

loc_AAA66:
		xor	di, di
		jmp	short loc_AAA78

loc_AAA6A:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_AAA78:
		cmp	di, 4
		jl	short loc_AAA6A
		cmp	byte ptr [bp+var_10C+1], 0
		jz	short loc_AAAA5
		cmp	[bp+var_110], 0
		jz	short loc_AAAA5
		push	0
		mov	al, byte ptr [bp+var_10C]
		push	ax
		lea	ax, word ptr [bp+var_110]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAAA5

loc_AAAA5:
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_AAAE4
		cmp	[bp+var_106], 0
		jz	short loc_AAAE4
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAAE4

loc_AAAE4:
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		jmp	loc_AB2D5

loc_AAAFE:
		push	0E0h
		push	[bp+var_B5C]
		mov	bx, [bp+var_B5C]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 56h
		mov	si, word ptr [bp+var_B76+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_AAC0B

loc_AAB32:
		mov	di, word ptr [bp+var_B76+1]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_AAB57
		mov	ax, [bp+var_8]
		shl	ax, 1
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B70]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_AAB57:
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_AAB6F
		push	2D97h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_AAB6F:
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, di
		jnz	short loc_AAB86
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AAB86:
		mov	ax, si
		add	ax, 10h
		cmp	ax, di
		jnz	short loc_AAB9D
		push	0FFFFh
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AAB9D:
		mov	ax, si
		add	ax, 13h
		cmp	ax, di
		jnz	short loc_AABB4
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AABB4:
		mov	ax, si
		add	ax, 14h
		cmp	ax, di
		jnz	short loc_AABCB
		push	13h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AABCB:
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_AABE2
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_AABE2:
		jmp	short loc_AABFE
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_AABFE
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_AAC2B

loc_AABFE:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_AAC0B:
		mov	ax, word ptr [bp+var_B76+1]
		cmp	ax, [bp+var_2]
		jnb	short loc_AAC1B
		cmp	byte ptr [bp+var_B76+3], 0
		jz	short loc_AAC20

loc_AAC1B:
		mov	ax, 1
		jmp	short loc_AAC22

loc_AAC20:
		xor	ax, ax

loc_AAC22:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AAC2B
		jmp	loc_AAB32

loc_AAC2B:
		cmp	byte_4F55C, 0
		jnz	short loc_AAC35
		jmp	loc_AB1B8

loc_AAC35:
		push	0
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_AAC88
		cmp	[bp+var_F0], 0
		jz	short loc_AAC88
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAC88

loc_AAC88:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_AACC7
		cmp	[bp+var_E6], 0
		jz	short loc_AACC7
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AACC7

loc_AACC7:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_AAD06
		cmp	[bp+var_DC], 0
		jz	short loc_AAD06
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAD06

loc_AAD06:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_AAD45
		cmp	[bp+var_D2], 0
		jz	short loc_AAD45
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAD45

loc_AAD45:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_AAD84
		cmp	[bp+var_C8], 0
		jz	short loc_AAD84
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAD84

loc_AAD84:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_AADC3
		cmp	[bp+var_BE], 0
		jz	short loc_AADC3
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AADC3

loc_AADC3:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_AAE02
		cmp	[bp+var_B4], 0
		jz	short loc_AAE02
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAE02

loc_AAE02:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_AAE41
		cmp	[bp+var_AA], 0
		jz	short loc_AAE41
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAE41

loc_AAE41:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_AAE80
		cmp	[bp+var_A0], 0
		jz	short loc_AAE80
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAE80

loc_AAE80:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_AAEBF
		cmp	[bp+var_96], 0
		jz	short loc_AAEBF
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAEBF

loc_AAEBF:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_AAF0B
		cmp	[bp+var_86], 0
		jz	short loc_AAF0B
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAF0B

loc_AAF0B:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_AAF51
		cmp	[bp+var_76], 0
		jz	short loc_AAF51
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAF51

loc_AAF51:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_AAF95
		cmp	[bp+var_66], 0
		jz	short loc_AAF95
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAF95

loc_AAF95:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_AAFD9
		cmp	[bp+var_56], 0
		jz	short loc_AAFD9
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AAFD9

loc_AAFD9:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_AB01D
		cmp	[bp+var_46], 0
		jz	short loc_AB01D
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB01D

loc_AB01D:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AB055
		cmp	[bp+var_3C], 0
		jz	short loc_AB055
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB055

loc_AB055:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_AB08D
		cmp	[bp+var_32], 0
		jz	short loc_AB08D
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB08D

loc_AB08D:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_AB0DC
		cmp	[bp+var_B26], 0
		jz	short loc_AB0DC
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB0DC

loc_AB0DC:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_AB142
		cmp	[bp+var_26], 0
		jz	short loc_AB142
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB142

loc_AB142:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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

loc_AB1B8:
		mov	[bp+var_4], 3Ch
		mov	si, word ptr [bp+var_B76+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_AB2B5

loc_AB1D9:
		mov	di, word ptr [bp+var_B76+1]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_AB201
		mov	ax, [bp+var_8]
		shl	ax, 1
		add	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B70]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_AB201:
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_AB219
		push	2DBEh
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_AB219:
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, di
		jnz	short loc_AB230
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AB230:
		mov	ax, si
		add	ax, 10h
		cmp	ax, di
		jnz	short loc_AB247
		push	0FFFFh
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AB247:
		mov	ax, si
		add	ax, 13h
		cmp	ax, di
		jnz	short loc_AB25E
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AB25E:
		mov	ax, si
		add	ax, 14h
		cmp	ax, di
		jnz	short loc_AB275
		push	13h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AB275:
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_AB28C
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_AB28C:
		jmp	short loc_AB2A8
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_AB2A8
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_AB2D5

loc_AB2A8:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_AB2B5:
		mov	ax, word ptr [bp+var_B76+1]
		cmp	ax, [bp+var_2]
		jnb	short loc_AB2C5
		cmp	byte ptr [bp+var_B76+3], 0
		jz	short loc_AB2CA

loc_AB2C5:
		mov	ax, 1
		jmp	short loc_AB2CC

loc_AB2CA:
		xor	ax, ax

loc_AB2CC:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AB2D5
		jmp	loc_AB1D9

loc_AB2D5:
		push	0
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_AB2EE
		jmp	loc_AB862

loc_AB2EE:
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_AB332
		cmp	[bp+var_F0], 0
		jz	short loc_AB332
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB332

loc_AB332:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_AB371
		cmp	[bp+var_E6], 0
		jz	short loc_AB371
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB371

loc_AB371:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_AB3B0
		cmp	[bp+var_DC], 0
		jz	short loc_AB3B0
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB3B0

loc_AB3B0:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_AB3EF
		cmp	[bp+var_D2], 0
		jz	short loc_AB3EF
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB3EF

loc_AB3EF:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_AB42E
		cmp	[bp+var_C8], 0
		jz	short loc_AB42E
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB42E

loc_AB42E:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_AB46D
		cmp	[bp+var_BE], 0
		jz	short loc_AB46D
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB46D

loc_AB46D:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_AB4AC
		cmp	[bp+var_B4], 0
		jz	short loc_AB4AC
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB4AC

loc_AB4AC:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_AB4EB
		cmp	[bp+var_AA], 0
		jz	short loc_AB4EB
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB4EB

loc_AB4EB:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_AB52A
		cmp	[bp+var_A0], 0
		jz	short loc_AB52A
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB52A

loc_AB52A:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_AB569
		cmp	[bp+var_96], 0
		jz	short loc_AB569
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB569

loc_AB569:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_AB5B5
		cmp	[bp+var_86], 0
		jz	short loc_AB5B5
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB5B5

loc_AB5B5:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_AB5FB
		cmp	[bp+var_76], 0
		jz	short loc_AB5FB
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB5FB

loc_AB5FB:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_AB63F
		cmp	[bp+var_66], 0
		jz	short loc_AB63F
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB63F

loc_AB63F:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_AB683
		cmp	[bp+var_56], 0
		jz	short loc_AB683
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB683

loc_AB683:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_AB6C7
		cmp	[bp+var_46], 0
		jz	short loc_AB6C7
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB6C7

loc_AB6C7:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AB6FF
		cmp	[bp+var_3C], 0
		jz	short loc_AB6FF
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB6FF

loc_AB6FF:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_AB737
		cmp	[bp+var_32], 0
		jz	short loc_AB737
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB737

loc_AB737:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_AB786
		cmp	[bp+var_B26], 0
		jz	short loc_AB786
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB786

loc_AB786:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_AB7EC
		cmp	[bp+var_26], 0
		jz	short loc_AB7EC
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AB7EC

loc_AB7EC:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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

loc_AB862:
		lea	ax, [bp+var_18C]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_FC+2], ax
		push	80h
		push	0A4h
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_FC], ax
		push	1Fh
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	word ptr [bp+var_FC+2]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_FC]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_4C]
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4C]
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
		jnz	short loc_AB932
		jmp	loc_ABA7A

loc_AB932:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	2
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	4
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_106]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_AB995

loc_AB987:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_AB995:
		cmp	di, 4
		jl	short loc_AB987
		push	0FFFFh
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		xor	di, di
		jmp	short loc_ABA03

loc_AB9AD:
		cmp	di, 7
		jnz	short loc_AB9C0
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AB9C0:
		cmp	di, 8
		jnz	short loc_AB9D3
		push	15h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AB9D3:
		mov	ax, di
		inc	di
		cmp	ax, 11h
		jnz	short loc_AB9E9
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AB9E9:
		jmp	short loc_AB9F6
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_AB9F6
		jmp	short loc_ABA14

loc_AB9F6:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_ABA03:
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_AB9AD

loc_ABA14:
		xor	di, di
		jmp	short loc_ABA26

loc_ABA18:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_ABA26:
		cmp	di, 8
		jl	short loc_ABA18
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_ABA60
		cmp	[bp+var_106], 0
		jz	short loc_ABA60
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABA60

loc_ABA60:
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		jmp	loc_ABB79

loc_ABA7A:
		push	0E0h
		push	[bp+var_B5C]
		mov	bx, [bp+var_B5C]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 5Bh
		mov	si, word ptr [bp+var_B76+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_ABB59

loc_ABAAE:
		mov	di, word ptr [bp+var_B76+1]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_ABAD4
		mov	ax, [bp+var_8]
		shl	ax, 2
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B70]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_ABAD4:
		mov	ax, si
		add	ax, 11h
		cmp	ax, di
		jnz	short loc_ABAEB
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_ABAEB:
		mov	ax, si
		add	ax, 12h
		cmp	ax, di
		jnz	short loc_ABB02
		push	15h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_ABB02:
		mov	ax, si
		add	ax, 1Bh
		cmp	ax, di
		jnz	short loc_ABB19
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_ABB19:
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_ABB30
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_ABB30:
		jmp	short loc_ABB4C
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_ABB4C
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_ABB79

loc_ABB4C:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_ABB59:
		mov	ax, word ptr [bp+var_B76+1]
		cmp	ax, [bp+var_2]
		jnb	short loc_ABB69
		cmp	byte ptr [bp+var_B76+3], 0
		jz	short loc_ABB6E

loc_ABB69:
		mov	ax, 1
		jmp	short loc_ABB70

loc_ABB6E:
		xor	ax, ax

loc_ABB70:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_ABB79
		jmp	loc_ABAAE

loc_ABB79:
		push	0
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_ABB92
		jmp	loc_AC106

loc_ABB92:
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_ABBD6
		cmp	[bp+var_F0], 0
		jz	short loc_ABBD6
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABBD6

loc_ABBD6:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_ABC15
		cmp	[bp+var_E6], 0
		jz	short loc_ABC15
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABC15

loc_ABC15:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_ABC54
		cmp	[bp+var_DC], 0
		jz	short loc_ABC54
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABC54

loc_ABC54:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_ABC93
		cmp	[bp+var_D2], 0
		jz	short loc_ABC93
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABC93

loc_ABC93:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_ABCD2
		cmp	[bp+var_C8], 0
		jz	short loc_ABCD2
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABCD2

loc_ABCD2:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_ABD11
		cmp	[bp+var_BE], 0
		jz	short loc_ABD11
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABD11

loc_ABD11:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_ABD50
		cmp	[bp+var_B4], 0
		jz	short loc_ABD50
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABD50

loc_ABD50:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_ABD8F
		cmp	[bp+var_AA], 0
		jz	short loc_ABD8F
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABD8F

loc_ABD8F:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_ABDCE
		cmp	[bp+var_A0], 0
		jz	short loc_ABDCE
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABDCE

loc_ABDCE:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_ABE0D
		cmp	[bp+var_96], 0
		jz	short loc_ABE0D
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABE0D

loc_ABE0D:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_ABE59
		cmp	[bp+var_86], 0
		jz	short loc_ABE59
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABE59

loc_ABE59:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_ABE9F
		cmp	[bp+var_76], 0
		jz	short loc_ABE9F
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABE9F

loc_ABE9F:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_ABEE3
		cmp	[bp+var_66], 0
		jz	short loc_ABEE3
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABEE3

loc_ABEE3:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_ABF27
		cmp	[bp+var_56], 0
		jz	short loc_ABF27
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABF27

loc_ABF27:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_ABF6B
		cmp	[bp+var_46], 0
		jz	short loc_ABF6B
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABF6B

loc_ABF6B:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_ABFA3
		cmp	[bp+var_3C], 0
		jz	short loc_ABFA3
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABFA3

loc_ABFA3:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_ABFDB
		cmp	[bp+var_32], 0
		jz	short loc_ABFDB
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ABFDB

loc_ABFDB:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_AC02A
		cmp	[bp+var_B26], 0
		jz	short loc_AC02A
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC02A

loc_AC02A:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_AC090
		cmp	[bp+var_26], 0
		jz	short loc_AC090
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC090

loc_AC090:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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

loc_AC106:
		lea	ax, [bp+var_18C]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_FC+2], ax
		push	80h
		push	0FFh
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_FC], ax
		push	80h
		push	5Fh
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_100+2], ax
		push	13h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	13h
		push	word ptr [bp+var_100+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	word ptr [bp+var_FC+2]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_FC]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_100+2]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_7C]
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_4C]
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4C]
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
		jnz	short loc_AC20D
		jmp	loc_AC3B8

loc_AC20D:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_108], 0
		mov	byte ptr [bp+var_104], 2
		mov	byte ptr [bp+var_104+1], 0
		mov	[bp+var_102], 0
		push	2
		lea	ax, word ptr [bp+var_108]
		push	ax
		push	5
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_108]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_AC270

loc_AC262:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_AC270:
		cmp	di, 4
		jl	short loc_AC262
		push	0FFFFh
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		xor	di, di
		jmp	loc_AC33E

loc_AC289:
		cmp	di, 7
		jnz	short loc_AC29C
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC29C:
		cmp	di, 8
		jnz	short loc_AC2AF
		push	15h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC2AF:
		cmp	di, 9
		jnz	short loc_AC2C2
		push	0FFFFh
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC2C2:
		cmp	di, 10h
		jnz	short loc_AC2D5
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC2D5:
		cmp	di, 12h
		jnz	short loc_AC2E8
		push	15h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC2E8:
		cmp	di, 2
		jnz	short loc_AC2FB
		push	0Ch
		push	word ptr [bp+var_100+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC2FB:
		cmp	di, 3
		jnz	short loc_AC30E
		push	15h
		push	word ptr [bp+var_100+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC30E:
		mov	ax, di
		inc	di
		cmp	ax, 16h
		jnz	short loc_AC324
		push	0Ch
		push	word ptr [bp+var_100+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC324:
		jmp	short loc_AC331
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_AC331
		jmp	short loc_AC352

loc_AC331:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_AC33E:
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jz	short loc_AC352
		jmp	loc_AC289

loc_AC352:
		xor	di, di
		jmp	short loc_AC364

loc_AC356:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_AC364:
		cmp	di, 8
		jl	short loc_AC356
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_104+1], 0
		jz	short loc_AC39E
		cmp	[bp+var_108], 0
		jz	short loc_AC39E
		push	0
		mov	al, byte ptr [bp+var_104]
		push	ax
		lea	ax, word ptr [bp+var_108]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC39E

loc_AC39E:
		mov	[bp+var_108], 0
		mov	byte ptr [bp+var_104+1], 0
		mov	[bp+var_102], 0
		jmp	loc_AC52C

loc_AC3B8:
		push	0E0h
		push	[bp+var_B5C]
		mov	bx, [bp+var_B5C]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 5Bh
		mov	si, word ptr [bp+var_B76+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_AC50C

loc_AC3EC:
		mov	di, word ptr [bp+var_B76+1]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_AC414
		mov	ax, [bp+var_8]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B70]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_AC414:
		mov	ax, si
		add	ax, 11h
		cmp	ax, di
		jnz	short loc_AC42B
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC42B:
		mov	ax, si
		add	ax, 12h
		cmp	ax, di
		jnz	short loc_AC442
		push	15h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC442:
		mov	ax, si
		add	ax, 13h
		cmp	ax, di
		jnz	short loc_AC459
		push	0FFFFh
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC459:
		mov	ax, si
		add	ax, 1Ah
		cmp	ax, di
		jnz	short loc_AC470
		push	0Ch
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC470:
		mov	ax, si
		add	ax, 1Ch
		cmp	ax, di
		jnz	short loc_AC487
		push	15h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC487:
		mov	ax, si
		add	ax, 7
		cmp	ax, di
		jnz	short loc_AC49E
		push	0Ch
		push	word ptr [bp+var_100+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC49E:
		mov	ax, si
		add	ax, 8
		cmp	ax, di
		jnz	short loc_AC4B5
		push	15h
		push	word ptr [bp+var_100+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC4B5:
		mov	ax, si
		add	ax, 20h
		cmp	ax, di
		jnz	short loc_AC4CC
		push	0Ch
		push	word ptr [bp+var_100+2]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4

loc_AC4CC:
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_AC4E3
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_AC4E3:
		jmp	short loc_AC4FF
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_AC4FF
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_AC52C

loc_AC4FF:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_AC50C:
		mov	ax, word ptr [bp+var_B76+1]
		cmp	ax, [bp+var_2]
		jnb	short loc_AC51C
		cmp	byte ptr [bp+var_B76+3], 0
		jz	short loc_AC521

loc_AC51C:
		mov	ax, 1
		jmp	short loc_AC523

loc_AC521:
		xor	ax, ax

loc_AC523:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AC52C
		jmp	loc_AC3EC

loc_AC52C:
		push	0
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_AC545
		jmp	loc_ACAB9

loc_AC545:
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_AC589
		cmp	[bp+var_F0], 0
		jz	short loc_AC589
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC589

loc_AC589:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_AC5C8
		cmp	[bp+var_E6], 0
		jz	short loc_AC5C8
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC5C8

loc_AC5C8:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_AC607
		cmp	[bp+var_DC], 0
		jz	short loc_AC607
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC607

loc_AC607:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_AC646
		cmp	[bp+var_D2], 0
		jz	short loc_AC646
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC646

loc_AC646:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_AC685
		cmp	[bp+var_C8], 0
		jz	short loc_AC685
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC685

loc_AC685:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_AC6C4
		cmp	[bp+var_BE], 0
		jz	short loc_AC6C4
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC6C4

loc_AC6C4:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_AC703
		cmp	[bp+var_B4], 0
		jz	short loc_AC703
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC703

loc_AC703:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_AC742
		cmp	[bp+var_AA], 0
		jz	short loc_AC742
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC742

loc_AC742:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_AC781
		cmp	[bp+var_A0], 0
		jz	short loc_AC781
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC781

loc_AC781:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_AC7C0
		cmp	[bp+var_96], 0
		jz	short loc_AC7C0
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC7C0

loc_AC7C0:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_AC80C
		cmp	[bp+var_86], 0
		jz	short loc_AC80C
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC80C

loc_AC80C:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_AC852
		cmp	[bp+var_76], 0
		jz	short loc_AC852
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC852

loc_AC852:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_AC896
		cmp	[bp+var_66], 0
		jz	short loc_AC896
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC896

loc_AC896:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_AC8DA
		cmp	[bp+var_56], 0
		jz	short loc_AC8DA
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC8DA

loc_AC8DA:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_AC91E
		cmp	[bp+var_46], 0
		jz	short loc_AC91E
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC91E

loc_AC91E:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AC956
		cmp	[bp+var_3C], 0
		jz	short loc_AC956
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC956

loc_AC956:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_AC98E
		cmp	[bp+var_32], 0
		jz	short loc_AC98E
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC98E

loc_AC98E:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_AC9DD
		cmp	[bp+var_B26], 0
		jz	short loc_AC9DD
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AC9DD

loc_AC9DD:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_ACA43
		cmp	[bp+var_26], 0
		jz	short loc_ACA43
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACA43

loc_ACA43:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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

loc_ACAB9:
		lea	ax, [bp+var_18C]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFE2h
		push	0
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_FC+2], ax
		push	80h
		push	0A3h
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [bp+var_FC], ax
		push	19h
		push	word ptr [bp+var_FC]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	word ptr [bp+var_FC+2]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_FC]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_4C]
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4C]
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
		jnz	short loc_ACB89
		jmp	loc_ACC93

loc_ACB89:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	2
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	6
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_106]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_ACBEC

loc_ACBDE:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_ACBEC:
		cmp	di, 4
		jl	short loc_ACBDE
		push	0FFFFh
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_ACC1C

loc_ACC02:
		jmp	short loc_ACC0F
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_ACC0F
		jmp	short loc_ACC2D

loc_ACC0F:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_ACC1C:
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_ACC02

loc_ACC2D:
		xor	di, di
		jmp	short loc_ACC3F

loc_ACC31:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_ACC3F:
		cmp	di, 8
		jl	short loc_ACC31
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_ACC79
		cmp	[bp+var_106], 0
		jz	short loc_ACC79
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, word ptr [bp+var_106]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACC79

loc_ACC79:
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		jmp	loc_ACD4E

loc_ACC93:
		push	0E0h
		push	[bp+var_B5C]
		mov	bx, [bp+var_B5C]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 50h
		mov	si, word ptr [bp+var_B76+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	short loc_ACD2E

loc_ACCC6:
		mov	di, word ptr [bp+var_B76+1]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_ACCEE
		mov	ax, [bp+var_8]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B70]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_ACCEE:
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_ACD05
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_ACD05:
		jmp	short loc_ACD21
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_ACD21
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_ACD4E

loc_ACD21:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_ACD2E:
		mov	ax, word ptr [bp+var_B76+1]
		cmp	ax, [bp+var_2]
		jnb	short loc_ACD3E
		cmp	byte ptr [bp+var_B76+3], 0
		jz	short loc_ACD43

loc_ACD3E:
		mov	ax, 1
		jmp	short loc_ACD45

loc_ACD43:
		xor	ax, ax

loc_ACD45:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_ACD4E
		jmp	loc_ACCC6

loc_ACD4E:
		push	0
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_ACD67
		jmp	loc_AD2DB

loc_ACD67:
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_ACDAB
		cmp	[bp+var_F0], 0
		jz	short loc_ACDAB
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACDAB

loc_ACDAB:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_ACDEA
		cmp	[bp+var_E6], 0
		jz	short loc_ACDEA
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACDEA

loc_ACDEA:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_ACE29
		cmp	[bp+var_DC], 0
		jz	short loc_ACE29
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACE29

loc_ACE29:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_ACE68
		cmp	[bp+var_D2], 0
		jz	short loc_ACE68
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACE68

loc_ACE68:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_ACEA7
		cmp	[bp+var_C8], 0
		jz	short loc_ACEA7
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACEA7

loc_ACEA7:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_ACEE6
		cmp	[bp+var_BE], 0
		jz	short loc_ACEE6
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACEE6

loc_ACEE6:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_ACF25
		cmp	[bp+var_B4], 0
		jz	short loc_ACF25
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACF25

loc_ACF25:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_ACF64
		cmp	[bp+var_AA], 0
		jz	short loc_ACF64
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACF64

loc_ACF64:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_ACFA3
		cmp	[bp+var_A0], 0
		jz	short loc_ACFA3
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACFA3

loc_ACFA3:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_ACFE2
		cmp	[bp+var_96], 0
		jz	short loc_ACFE2
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ACFE2

loc_ACFE2:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_AD02E
		cmp	[bp+var_86], 0
		jz	short loc_AD02E
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD02E

loc_AD02E:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_AD074
		cmp	[bp+var_76], 0
		jz	short loc_AD074
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD074

loc_AD074:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_AD0B8
		cmp	[bp+var_66], 0
		jz	short loc_AD0B8
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD0B8

loc_AD0B8:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_AD0FC
		cmp	[bp+var_56], 0
		jz	short loc_AD0FC
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD0FC

loc_AD0FC:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_AD140
		cmp	[bp+var_46], 0
		jz	short loc_AD140
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD140

loc_AD140:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AD178
		cmp	[bp+var_3C], 0
		jz	short loc_AD178
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD178

loc_AD178:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_AD1B0
		cmp	[bp+var_32], 0
		jz	short loc_AD1B0
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD1B0

loc_AD1B0:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_AD1FF
		cmp	[bp+var_B26], 0
		jz	short loc_AD1FF
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD1FF

loc_AD1FF:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_AD265
		cmp	[bp+var_26], 0
		jz	short loc_AD265
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD265

loc_AD265:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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

loc_AD2DB:
		mov	[bp+var_102], 0
		mov	byte ptr [bp+var_100+2], 2
		mov	byte ptr [bp+var_100+3], 0
		mov	[bp+var_FC], 0
		push	3
		lea	ax, word ptr [bp+var_102]
		push	ax
		push	20h
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_10C], 0
		mov	byte ptr [bp+var_108], 2
		mov	byte ptr [bp+var_108+1], 0
		mov	[bp+var_106], 0
		push	3
		lea	ax, word ptr [bp+var_10C]
		push	ax
		push	1Ah
		lea	ax, [bp+var_212]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_18C]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_102]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_10E], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_10C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_110], ax
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0FDh
		lea	ax, [bp+var_B70]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		push	word ptr [bp+var_10E]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_110]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_8C]
		mov	al, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_8C]
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
		jnz	short loc_AD40B
		jmp	loc_AD570

loc_AD40B:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116], 2
		mov	byte ptr [bp+var_116+1], 0
		mov	[bp+var_114], 0
		push	2
		lea	ax, word ptr [bp+var_11A]
		push	ax
		push	7
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_11A]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		xor	di, di
		jmp	short loc_AD46E

loc_AD460:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_AD46E:
		cmp	di, 8
		jl	short loc_AD460
		push	0FFFFh
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4
		jmp	short loc_AD49E

loc_AD484:
		jmp	short loc_AD491
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_AD491
		jmp	short loc_AD4AF

loc_AD491:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_AD49E:
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_IsPlaying_C83C
		add	sp, 2
		or	al, al
		jnz	short loc_AD484

loc_AD4AF:
		mov	[bp+var_124], 0
		mov	[bp+var_120], 2
		mov	[bp+var_11F], 0
		mov	[bp+var_11E], 0
		xor	di, di
		jmp	short loc_AD4DD

loc_AD4CF:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	di

loc_AD4DD:
		cmp	di, 8
		jl	short loc_AD4CF
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_11F], 0
		jz	short loc_AD517
		cmp	[bp+var_124], 0
		jz	short loc_AD517
		push	0
		mov	al, [bp+var_120]
		push	ax
		lea	ax, word ptr [bp+var_124]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD517

loc_AD517:
		mov	[bp+var_124], 0
		mov	[bp+var_11F], 0
		mov	[bp+var_11E], 0
		cmp	byte ptr [bp+var_116+1], 0
		jz	short loc_AD556
		cmp	[bp+var_11A], 0
		jz	short loc_AD556
		push	0
		mov	al, byte ptr [bp+var_116]
		push	ax
		lea	ax, word ptr [bp+var_11A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD556

loc_AD556:
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116+1], 0
		mov	[bp+var_114], 0
		jmp	loc_ADCC7

loc_AD570:
		mov	[bp+var_4], 28h
		mov	si, word ptr [bp+var_B76+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	short loc_AD5F8

loc_AD590:
		mov	di, word ptr [bp+var_B76+1]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_AD5B8
		mov	ax, [bp+var_8]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B70]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_AD5B8:
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_AD5CF
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_AD5CF:
		jmp	short loc_AD5EB
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_AD5EB
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_AD618

loc_AD5EB:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_AD5F8:
		mov	ax, word ptr [bp+var_B76+1]
		cmp	ax, [bp+var_2]
		jnb	short loc_AD608
		cmp	byte ptr [bp+var_B76+3], 0
		jz	short loc_AD60D

loc_AD608:
		mov	ax, 1
		jmp	short loc_AD60F

loc_AD60D:
		xor	ax, ax

loc_AD60F:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AD618
		jmp	loc_AD590

loc_AD618:
		cmp	byte_4F55C, 0
		jnz	short loc_AD622
		jmp	loc_ADC23

loc_AD622:
		push	0
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_108+1], 0
		jz	short loc_AD659
		cmp	[bp+var_10C], 0
		jz	short loc_AD659
		push	0
		mov	al, byte ptr [bp+var_108]
		push	ax
		lea	ax, word ptr [bp+var_10C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD659

loc_AD659:
		mov	[bp+var_10C], 0
		mov	byte ptr [bp+var_108+1], 0
		mov	[bp+var_106], 0
		cmp	byte ptr [bp+var_100+3], 0
		jz	short loc_AD698
		cmp	[bp+var_102], 0
		jz	short loc_AD698
		push	0
		mov	al, byte ptr [bp+var_100+2]
		push	ax
		lea	ax, word ptr [bp+var_102]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD698

loc_AD698:
		mov	[bp+var_102], 0
		mov	byte ptr [bp+var_100+3], 0
		mov	[bp+var_FC], 0
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_AD6F3
		cmp	[bp+var_F0], 0
		jz	short loc_AD6F3
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD6F3

loc_AD6F3:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_AD732
		cmp	[bp+var_E6], 0
		jz	short loc_AD732
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD732

loc_AD732:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_AD771
		cmp	[bp+var_DC], 0
		jz	short loc_AD771
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD771

loc_AD771:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_AD7B0
		cmp	[bp+var_D2], 0
		jz	short loc_AD7B0
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD7B0

loc_AD7B0:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_AD7EF
		cmp	[bp+var_C8], 0
		jz	short loc_AD7EF
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD7EF

loc_AD7EF:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_AD82E
		cmp	[bp+var_BE], 0
		jz	short loc_AD82E
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD82E

loc_AD82E:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_AD86D
		cmp	[bp+var_B4], 0
		jz	short loc_AD86D
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD86D

loc_AD86D:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_AD8AC
		cmp	[bp+var_AA], 0
		jz	short loc_AD8AC
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD8AC

loc_AD8AC:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_AD8EB
		cmp	[bp+var_A0], 0
		jz	short loc_AD8EB
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD8EB

loc_AD8EB:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_AD92A
		cmp	[bp+var_96], 0
		jz	short loc_AD92A
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD92A

loc_AD92A:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_AD976
		cmp	[bp+var_86], 0
		jz	short loc_AD976
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD976

loc_AD976:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_AD9BC
		cmp	[bp+var_76], 0
		jz	short loc_AD9BC
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AD9BC

loc_AD9BC:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_ADA00
		cmp	[bp+var_66], 0
		jz	short loc_ADA00
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADA00

loc_ADA00:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_ADA44
		cmp	[bp+var_56], 0
		jz	short loc_ADA44
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADA44

loc_ADA44:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_ADA88
		cmp	[bp+var_46], 0
		jz	short loc_ADA88
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADA88

loc_ADA88:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_ADAC0
		cmp	[bp+var_3C], 0
		jz	short loc_ADAC0
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADAC0

loc_ADAC0:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_ADAF8
		cmp	[bp+var_32], 0
		jz	short loc_ADAF8
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADAF8

loc_ADAF8:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_ADB47
		cmp	[bp+var_B26], 0
		jz	short loc_ADB47
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADB47

loc_ADB47:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_ADBAD
		cmp	[bp+var_26], 0
		jz	short loc_ADBAD
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADBAD

loc_ADBAD:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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

loc_ADC23:
		mov	[bp+var_4], 52h
		mov	si, word ptr [bp+var_B76+1]
		mov	ax, [bp+var_4]
		mov	dx, 46h
		imul	dx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	short loc_ADCA7

loc_ADC43:
		mov	di, word ptr [bp+var_B76+1]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_ADC67
		mov	ax, [bp+var_8]
		shl	ax, 3
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B70]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_ADC67:
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_ADC7E
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_ADC7E:
		jmp	short loc_ADC9A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_ADC9A
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4
		jmp	short loc_ADCC7

loc_ADC9A:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_ADCA7:
		mov	ax, word ptr [bp+var_B76+1]
		cmp	ax, [bp+var_2]
		jnb	short loc_ADCB7
		cmp	byte ptr [bp+var_B76+3], 0
		jz	short loc_ADCBC

loc_ADCB7:
		mov	ax, 1
		jmp	short loc_ADCBE

loc_ADCBC:
		xor	ax, ax

loc_ADCBE:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_ADCC7
		jmp	loc_ADC43

loc_ADCC7:
		push	0
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_108+1], 0
		jz	short loc_ADCFE
		cmp	[bp+var_10C], 0
		jz	short loc_ADCFE
		push	0
		mov	al, byte ptr [bp+var_108]
		push	ax
		lea	ax, word ptr [bp+var_10C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADCFE

loc_ADCFE:
		mov	[bp+var_10C], 0
		mov	byte ptr [bp+var_108+1], 0
		mov	[bp+var_106], 0
		cmp	byte ptr [bp+var_100+3], 0
		jz	short loc_ADD3D
		cmp	[bp+var_102], 0
		jz	short loc_ADD3D
		push	0
		mov	al, byte ptr [bp+var_100+2]
		push	ax
		lea	ax, word ptr [bp+var_102]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADD3D

loc_ADD3D:
		mov	[bp+var_102], 0
		mov	byte ptr [bp+var_100+3], 0
		mov	[bp+var_FC], 0
		cmp	byte_4F55C, 0
		jnz	short loc_ADD5E
		jmp	loc_AE2D2

loc_ADD5E:
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_ADDA2
		cmp	[bp+var_F0], 0
		jz	short loc_ADDA2
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADDA2

loc_ADDA2:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_ADDE1
		cmp	[bp+var_E6], 0
		jz	short loc_ADDE1
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADDE1

loc_ADDE1:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_ADE20
		cmp	[bp+var_DC], 0
		jz	short loc_ADE20
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADE20

loc_ADE20:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_ADE5F
		cmp	[bp+var_D2], 0
		jz	short loc_ADE5F
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADE5F

loc_ADE5F:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_ADE9E
		cmp	[bp+var_C8], 0
		jz	short loc_ADE9E
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADE9E

loc_ADE9E:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_ADEDD
		cmp	[bp+var_BE], 0
		jz	short loc_ADEDD
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADEDD

loc_ADEDD:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_ADF1C
		cmp	[bp+var_B4], 0
		jz	short loc_ADF1C
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADF1C

loc_ADF1C:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_ADF5B
		cmp	[bp+var_AA], 0
		jz	short loc_ADF5B
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADF5B

loc_ADF5B:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_ADF9A
		cmp	[bp+var_A0], 0
		jz	short loc_ADF9A
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADF9A

loc_ADF9A:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_ADFD9
		cmp	[bp+var_96], 0
		jz	short loc_ADFD9
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_ADFD9

loc_ADFD9:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_AE025
		cmp	[bp+var_86], 0
		jz	short loc_AE025
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE025

loc_AE025:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_AE06B
		cmp	[bp+var_76], 0
		jz	short loc_AE06B
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE06B

loc_AE06B:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_AE0AF
		cmp	[bp+var_66], 0
		jz	short loc_AE0AF
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE0AF

loc_AE0AF:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_AE0F3
		cmp	[bp+var_56], 0
		jz	short loc_AE0F3
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE0F3

loc_AE0F3:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_AE137
		cmp	[bp+var_46], 0
		jz	short loc_AE137
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE137

loc_AE137:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AE16F
		cmp	[bp+var_3C], 0
		jz	short loc_AE16F
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE16F

loc_AE16F:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_AE1A7
		cmp	[bp+var_32], 0
		jz	short loc_AE1A7
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE1A7

loc_AE1A7:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_AE1F6
		cmp	[bp+var_B26], 0
		jz	short loc_AE1F6
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE1F6

loc_AE1F6:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_AE25C
		cmp	[bp+var_26], 0
		jz	short loc_AE25C
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE25C

loc_AE25C:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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

loc_AE2D2:
		lea	ax, [bp+var_18C]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_FC+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_FC], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_100+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_100], ax
		push	0FFE8h
		push	0
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_102], ax
		push	[bp+var_5C]
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_FC+2]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_102]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_FC]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_100+2]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_100]
		lea	ax, [bp+var_B92]
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
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	Widget_Method_DispatchC_37052
		add	sp, 4
		push	0E9h
		lea	ax, [bp+var_B70]
		push	ax
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	word ptr [bp+var_104], 0
		mov	word ptr [bp+var_106], 0
		mov	word ptr [bp+var_108], 1
		mov	word ptr [bp+var_10A], 0
		mov	word ptr [bp+var_10C], 0
		mov	[bp+var_2], 91h
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_114+2], 2
		mov	byte ptr [bp+var_114+3], 0
		mov	[bp+var_110], 0
		mov	[bp+var_B9C], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_B9A], ax
		lea	ax, [bp+var_B9C]
		mov	word_4D392, ax
		mov	[bp+var_B9C], 1BCh
		mov	[bp+var_B98], 0
		mov	[bp+var_B94], 0
		mov	word ptr [bp+var_BA2+2], 0
		mov	[bp+var_B9E], 0FFFFh
		cmp	[bp+var_B], 0
		jnz	short loc_AE49C
		jmp	loc_AE51B

loc_AE49C:
		push	3
		lea	ax, word ptr [bp+var_116]
		push	ax
		push	4Ch
		lea	ax, [bp+var_302]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, word ptr [bp+var_BA2+2]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_116]
		push	ax
		lea	ax, word ptr [bp+var_BA2+2]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4F00C
		mov	word ptr [bp+var_11A+2], ax
		mov	word ptr [bp+var_11A], 0
		cmp	word ptr [bp+var_BA2+2], 0
		jz	short loc_AE51B
		push	[bp+var_B9E]
		mov	bx, word ptr [bp+var_BA2+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_11A]
		push	word ptr [bp+var_11A+2]
		push	[bp+var_B9E]
		mov	bx, word ptr [bp+var_BA2+2]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_AE51B

loc_AE51B:
		mov	[bp+var_124], 0
		mov	[bp+var_120], 2
		mov	[bp+var_11F], 0
		mov	[bp+var_11E], 0
		cmp	[bp+var_A], 0
		jz	short loc_AE572
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		push	2
		lea	ax, word ptr [bp+var_124]
		push	ax
		push	8
		lea	ax, [bp+var_28A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_124]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_7D11_BC88
		add	sp, 4

loc_AE572:
		jmp	loc_AE76D

loc_AE575:
		mov	di, word ptr [bp+var_B76+1]
		cmp	di, 32h
		jle	short loc_AE59B
		cmp	di, 8Ch
		jge	short loc_AE59B
		mov	ax, word ptr [bp+var_108]
		mov	[bp+var_126], ax
		inc	word ptr [bp+var_108]
		mov	bx, word ptr [bp+var_102]
		mov	ax, [bp+var_126]
		mov	[bx+1Bh], ax

loc_AE59B:
		cmp	di, 6Eh
		jnz	short loc_AE5AF
		push	9
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_AE5AF:
		cmp	di, 8Ch
		jnz	short loc_AE5E0
		push	word ptr [bp+var_102]
		lea	ax, [bp+var_B92]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	word ptr [bp+var_102], 0
		jz	short loc_AE5E0
		push	3
		push	word ptr [bp+var_102]
		mov	bx, word ptr [bp+var_102]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_AE5E0

loc_AE5E0:
		mov	ax, word ptr [bp+var_10A]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_AE600
		cmp	[bp+var_A], 0
		jz	short loc_AE600
		push	0FFFFh
		lea	ax, [bp+var_B36]
		push	ax
		call	MidgameEngine_83FE_C4B5
		add	sp, 4

loc_AE600:
		mov	ax, word ptr [bp+var_10A]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_AE62F
		mov	al, [bp+var_A]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AE62F
		mov	ax, [bp+var_8]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B70]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_AE62F:
		mov	ax, word ptr [bp+var_10A]
		add	ax, 5
		cmp	ax, di
		jge	short loc_AE65C
		mov	ax, word ptr [bp+var_10A]
		add	ax, 0Ah
		cmp	ax, di
		jle	short loc_AE65C
		mov	ax, word ptr [bp+var_104]
		mov	[bp+var_128], ax
		inc	word ptr [bp+var_104]
		mov	bx, word ptr [bp+var_100+2]
		mov	ax, [bp+var_128]
		mov	[bx+1Bh], ax

loc_AE65C:
		mov	ax, word ptr [bp+var_10A]
		add	ax, 0Dh
		cmp	ax, di
		jge	short loc_AE689
		mov	ax, word ptr [bp+var_10A]
		add	ax, 12h
		cmp	ax, di
		jle	short loc_AE689
		mov	ax, word ptr [bp+var_106]
		mov	[bp+var_12A], ax
		inc	word ptr [bp+var_106]
		mov	bx, word ptr [bp+var_100]
		mov	ax, [bp+var_12A]
		mov	[bx+1Bh], ax

loc_AE689:
		mov	ax, word ptr [bp+var_10C]
		add	ax, 1Bh
		cmp	ax, di
		jnz	short loc_AE6B8
		mov	al, [bp+var_A]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AE6B8
		mov	ax, [bp+var_8]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B70]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4

loc_AE6B8:
		mov	ax, word ptr [bp+var_10C]
		add	ax, 19h
		cmp	ax, di
		jge	short loc_AE6E5
		mov	ax, word ptr [bp+var_10C]
		add	ax, 1Eh
		cmp	ax, di
		jle	short loc_AE6E5
		dec	word ptr [bp+var_104]
		mov	ax, word ptr [bp+var_104]
		mov	[bp+var_12C], ax
		mov	bx, word ptr [bp+var_100+2]
		mov	ax, [bp+var_12C]
		mov	[bx+1Bh], ax

loc_AE6E5:
		mov	ax, word ptr [bp+var_10C]
		add	ax, 20h
		cmp	ax, di
		jge	short loc_AE718
		mov	ax, word ptr [bp+var_10C]
		add	ax, 29h
		cmp	ax, di
		jle	short loc_AE718
		test	di, 1
		jz	short loc_AE718
		dec	word ptr [bp+var_106]
		mov	ax, word ptr [bp+var_106]
		mov	[bp+var_12E], ax
		mov	bx, word ptr [bp+var_100]
		mov	ax, [bp+var_12E]
		mov	[bx+1Bh], ax

loc_AE718:
		mov	ax, word ptr [bp+var_10C]
		add	ax, 3Ch
		cmp	ax, di
		jnz	short loc_AE73B
		mov	al, [bp+var_A]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AE73B
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_AE73B:
		jmp	short loc_AE760
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_AE760
		mov	al, [bp+var_A]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AE75E
		push	0
		lea	ax, [bp+var_B70]
		push	ax
		call	sub_30AD0
		add	sp, 4

loc_AE75E:
		jmp	short loc_AE78D

loc_AE760:
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_AE76D:
		mov	ax, word ptr [bp+var_B76+1]
		cmp	ax, [bp+var_2]
		jnb	short loc_AE77D
		cmp	byte ptr [bp+var_B76+3], 0
		jz	short loc_AE782

loc_AE77D:
		mov	ax, 1
		jmp	short loc_AE784

loc_AE782:
		xor	ax, ax

loc_AE784:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AE78D
		jmp	loc_AE575

loc_AE78D:
		cmp	[bp+var_A], 0
		jz	short loc_AE7A0
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_AE7A0:
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		cmp	[bp+var_11F], 0
		jz	short loc_AE7DF
		cmp	[bp+var_124], 0
		jz	short loc_AE7DF
		push	0
		mov	al, [bp+var_120]
		push	ax
		lea	ax, word ptr [bp+var_124]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE7DF

loc_AE7DF:
		mov	[bp+var_124], 0
		mov	[bp+var_11F], 0
		mov	[bp+var_11E], 0
		lea	ax, word ptr [bp+var_BA2+2]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_B9C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_114+3], 0
		jz	short loc_AE83A
		cmp	[bp+var_116], 0
		jz	short loc_AE83A
		push	0
		mov	al, byte ptr [bp+var_114+2]
		push	ax
		lea	ax, word ptr [bp+var_116]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE83A

loc_AE83A:
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_114+3], 0
		mov	[bp+var_110], 0
		push	0
		lea	ax, [bp+var_B92]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_B6E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_B4E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_AE8A4
		cmp	[bp+var_F0], 0
		jz	short loc_AE8A4
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, word ptr [bp+var_F0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE8A4

loc_AE8A4:
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_AE8E3
		cmp	[bp+var_E6], 0
		jz	short loc_AE8E3
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, word ptr [bp+var_E6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE8E3

loc_AE8E3:
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_AE922
		cmp	[bp+var_DC], 0
		jz	short loc_AE922
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE922

loc_AE922:
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_AE961
		cmp	[bp+var_D2], 0
		jz	short loc_AE961
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE961

loc_AE961:
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_AE9A0
		cmp	[bp+var_C8], 0
		jz	short loc_AE9A0
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE9A0

loc_AE9A0:
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_AE9DF
		cmp	[bp+var_BE], 0
		jz	short loc_AE9DF
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, word ptr [bp+var_BE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AE9DF

loc_AE9DF:
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_AEA1E
		cmp	[bp+var_B4], 0
		jz	short loc_AEA1E
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AEA1E

loc_AEA1E:
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_AEA5D
		cmp	[bp+var_AA], 0
		jz	short loc_AEA5D
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AEA5D

loc_AEA5D:
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_AEA9C
		cmp	[bp+var_A0], 0
		jz	short loc_AEA9C
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AEA9C

loc_AEA9C:
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_AEADB
		cmp	[bp+var_96], 0
		jz	short loc_AEADB
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AEADB

loc_AEADB:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_AEB27
		cmp	[bp+var_86], 0
		jz	short loc_AEB27
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AEB27

loc_AEB27:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_AEB6D
		cmp	[bp+var_76], 0
		jz	short loc_AEB6D
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AEB6D

loc_AEB6D:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_AEBB1
		cmp	[bp+var_66], 0
		jz	short loc_AEBB1
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AEBB1

loc_AEBB1:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_AEBF5
		cmp	[bp+var_56], 0
		jz	short loc_AEBF5
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AEBF5

loc_AEBF5:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_41], 0
		jz	short loc_AEC39
		cmp	[bp+var_46], 0
		jz	short loc_AEC39
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AEC39

loc_AEC39:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AEC71
		cmp	[bp+var_3C], 0
		jz	short loc_AEC71
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AEC71

loc_AEC71:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_AECA9
		cmp	[bp+var_32], 0
		jz	short loc_AECA9
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AECA9

loc_AECA9:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B36], 129Fh
		lea	ax, [bp+var_B36]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_B21], 0
		jz	short loc_AECF8
		cmp	[bp+var_B26], 0
		jz	short loc_AECF8
		push	0
		mov	al, [bp+var_B22]
		push	ax
		lea	ax, word ptr [bp+var_B26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AECF8

loc_AECF8:
		mov	[bp+var_B26], 0
		mov	[bp+var_B21], 0
		mov	[bp+var_B20], 0
		lea	ax, [bp+var_310]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_30C]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_302]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_AED5E
		cmp	[bp+var_26], 0
		jz	short loc_AED5E
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_AED5E

loc_AED5E:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_28A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_212]
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
		lea	ax, [bp+var_19A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_18C]
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
Midgame34_Play_A8070		endp

; START OF FUNCTION CHUNK FOR Midgame34_Play_A8070
off_AEDD4	dw offset loc_A8229
		dw offset loc_A83A2
		dw offset loc_A83A2
		dw offset loc_A83A2
		dw offset loc_A83A2
; END OF FUNCTION CHUNK FOR Midgame34_Play_A8070
ovr212		ends
