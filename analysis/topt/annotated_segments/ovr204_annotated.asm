ovr204		segment	para public 'OVERLAY' use16
		assume cs:ovr204
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, cinématique to1mid3 de Tactical Operations (2026-11-02) : script extrait par
; tools/midgame_extract.py dans analysis/topt/midgames/to1mid3.md et .json, fichier
; analysis/topt/midgames/iff. Fonction entière lue par exécution symbolique, pas commentée
; ligne à ligne.
; ==============================================================================================
MidgameTO3_Play_7C1D0		proc far

var_2F8		= word ptr -2F8h
var_2C8		= word ptr -2C8h
var_29B		= dword ptr -29Bh
var_297		= dword ptr -297h
var_272		= word ptr -272h
var_255		= word ptr -255h
var_253		= byte ptr -253h
var_250		= word ptr -250h
var_1D8		= word ptr -1D8h
var_160		= word ptr -160h
var_15E		= word ptr -15Eh
var_15C		= word ptr -15Ch
var_15A		= word ptr -15Ah
var_158		= word ptr -158h
var_156		= word ptr -156h
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
var_13C		= dword ptr -13Ch
var_138		= byte ptr -138h
var_136		= word ptr -136h
var_BE		= word ptr -0BEh
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= byte ptr -56h
var_55		= word ptr -55h
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
var_2A		= dword ptr -2Ah
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= byte ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_16		= word ptr -16h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2F8h
		push	si
		push	di
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	[bp+var_3], 0
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		mov	al, byte_4CA58
		mov	[bp+var_10], al
		lea	ax, [bp+var_136]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_10]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_7C220
		jmp	loc_7C529

loc_7C220:
		shl	bx, 1
		jmp	cs:off_7CCC5[bx]	; switch jump

loc_7C227:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_BE]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_7C255
		jmp	loc_7C352

loc_7C255:
		push	1
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_136]
		push	ax
		mov	bx, [bp+var_136]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_7
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_2F8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_2F8], 480h
		mov	[bp+var_297], 100h
		mov	[bp+var_29B], 0
		mov	[bp+var_2F8], 498h
		push	1
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_2F8]
		push	ax
		mov	bx, [bp+var_2F8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_7C31A

loc_7C304:
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_7C31A:
		cmp	si, 6Ah
		jle	short loc_7C304
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_3], 1
		mov	[bp+var_2F8], 498h
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_2F8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_7C352:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_BE]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_7C390
		mov	[bp+var_1], 1
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7C390
		mov	word_4F048, 5Ah

loc_7C390:
		jmp	loc_7C529

loc_7C393:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_BE]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_7C3C1
		jmp	loc_7C4C8

loc_7C3C1:
		cmp	word_4CA5D, 0
		jnz	short loc_7C3CB
		jmp	loc_7C4C8

loc_7C3CB:
		push	1
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_136]
		push	ax
		mov	bx, [bp+var_136]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_8
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_2F8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_2F8], 480h
		mov	[bp+var_297], 100h
		mov	[bp+var_29B], 0
		mov	[bp+var_2F8], 498h
		push	1
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_2F8]
		push	ax
		mov	bx, [bp+var_2F8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_7C490

loc_7C47A:
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_7C490:
		cmp	si, 6Ah
		jle	short loc_7C47A
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_3], 1
		mov	[bp+var_2F8], 498h
		lea	ax, [bp+var_2F8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_2F8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_7C4C8:
		cmp	[bp+var_10], 3
		jnz	short loc_7C4E9
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_7C502

loc_7C4E9:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_7C502:
		push	ds
		lea	ax, [bp+var_BE]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_7C527
		mov	[bp+var_1], 1
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7C527
		mov	word_4F048, 0FFh

loc_7C527:
		jmp	short loc_7C529

loc_7C529:
		mov	[bp+var_140], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_13E], ax
		lea	ax, [bp+var_140]
		mov	word_4D392, ax
		mov	[bp+var_140], 1BCh
		mov	[bp+var_13C], 0
		mov	[bp+var_138], 0
		mov	[bp+var_144], 0
		mov	[bp+var_142], 0FFFFh
		cmp	[bp+var_1], 0
		jz	short loc_7C5D3
		push	1
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_2C8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		cmp	[bp+var_2], 0
		jz	short loc_7C583
		mov	byte ptr [bp+var_5A+1], 6
		jmp	short loc_7C587

loc_7C583:
		mov	byte ptr [bp+var_5A+1], 6

loc_7C587:
		push	3
		lea	ax, word ptr [bp+var_E]
		push	ax
		mov	al, byte ptr [bp+var_5A+1]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_2C8]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_144]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_E]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, [bp+var_2C8]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_7C5D3:
		mov	word_4F048, 0FFh
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		cmp	byte_4CA58, 3
		jnz	short loc_7C612
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_7C612:
		push	0Ch
		lea	ax, [bp+var_BE]
		push	ax
		call	Speech_LoadBank_2DA0B
		add	sp, 4
		mov	ax, word_4D36E
		mov	[bp+var_12], ax
		mov	[bp+var_152], 0
		mov	[bp+var_150], 0
		push	[bp+var_12]
		lea	ax, [bp+var_152]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_160], 0
		mov	[bp+var_15E], 0
		mov	[bp+var_15C], 0
		mov	[bp+var_15A], 0
		mov	[bp+var_158], 13Fh
		mov	[bp+var_156], 0C7h
		push	0
		lea	ax, [bp+var_160]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_14E], 0
		mov	[bp+var_14C], 0
		mov	[bp+var_14A], 13Fh
		mov	[bp+var_148], 0C7h
		mov	[bp+var_20], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aTo1mid3
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_1D8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps_3
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_BE]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_250]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		mov	[bp+var_2A], 0
		mov	[bp+var_26], 2
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		push	3
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	0
		lea	ax, [bp+var_1D8]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_34], 0
		mov	[bp+var_30], 2
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		push	3
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	1
		lea	ax, [bp+var_1D8]
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
		push	2
		lea	ax, [bp+var_1D8]
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
		push	2Bh
		lea	ax, [bp+var_250]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_52], 0
		mov	[bp+var_4E], 2
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		push	2
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	3
		lea	ax, [bp+var_1D8]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_55], 0
		lea	ax, word ptr [bp+var_52]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		lea	ax, [bp+var_152]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_5A], ax
		or	ax, ax
		jz	short loc_7C86B
		push	0
		push	0
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	[bp+var_5A]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, [bp+var_5A]
		mov	word ptr [bx], 20D9h
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_5A]
		jmp	short loc_7C86E

loc_7C86B:
		mov	ax, [bp+var_5A]

loc_7C86E:
		mov	di, ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_5E], ax
		or	ax, ax
		jz	short loc_7C8B8
		push	0
		push	0
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	[bp+var_5E]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, [bp+var_5E]
		mov	word ptr [bx], 20D9h
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_5E]
		jmp	short loc_7C8BB

loc_7C8B8:
		mov	ax, [bp+var_5E]

loc_7C8BB:
		mov	[bp+var_5C], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_62], ax
		or	ax, ax
		jz	short loc_7C906
		push	0
		push	0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	[bp+var_62]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, [bp+var_62]
		mov	word ptr [bx], 20D9h
		mov	bx, [bp+var_62]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, [bp+var_62]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_62]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_62]
		jmp	short loc_7C909

loc_7C906:
		mov	ax, [bp+var_62]

loc_7C909:
		mov	[bp+var_60], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_64], ax
		push	[bp+var_58]
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	[bp+var_64]
		lea	ax, [bp+var_272]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		xor	si, si
		jmp	short loc_7C98A

loc_7C97C:
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	si

loc_7C98A:
		cmp	si, 7
		jl	short loc_7C97C
		push	di
		lea	ax, [bp+var_272]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	si, si
		jmp	short loc_7C9B8

loc_7C9A1:
		mov	[bp+var_66], si
		mov	ax, [bp+var_66]
		mov	[di+1Bh], ax
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	si

loc_7C9B8:
		cmp	si, 0Bh
		jl	short loc_7C9A1
		mov	word ptr [di+1Bh], 0Ah
		xor	si, si
		jmp	short loc_7C9D4

loc_7C9C6:
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	si

loc_7C9D4:
		cmp	si, 3Ch
		jl	short loc_7C9C6
		mov	si, 0Ah
		jmp	short loc_7C9F5

loc_7C9DE:
		mov	[bp+var_68], si
		mov	ax, [bp+var_68]
		mov	[di+1Bh], ax
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		dec	si

loc_7C9F5:
		cmp	si, 0FFECh
		jg	short loc_7C9DE
		mov	[bp+var_255], 0
		push	[bp+var_5C]
		lea	ax, [bp+var_272]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	si, si
		jmp	short loc_7CA2E

loc_7CA14:
		mov	[bp+var_6A], si
		mov	bx, [bp+var_5C]
		mov	ax, [bp+var_6A]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	si

loc_7CA2E:
		cmp	si, 0Ah
		jl	short loc_7CA14
		mov	bx, [bp+var_5C]
		mov	word ptr [bx+1Bh], 9
		xor	si, si
		jmp	short loc_7CA4D

loc_7CA3F:
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	si

loc_7CA4D:
		cmp	si, 3Ch
		jl	short loc_7CA3F
		mov	si, 9
		jmp	short loc_7CA71

loc_7CA57:
		mov	[bp+var_6C], si
		mov	bx, [bp+var_5C]
		mov	ax, [bp+var_6C]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		dec	si

loc_7CA71:
		cmp	si, 0FFFBh
		jg	short loc_7CA57
		mov	[bp+var_255], 0
		push	[bp+var_60]
		lea	ax, [bp+var_272]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_7CABB

loc_7CA8E:
		mov	[bp+var_6E], si
		mov	bx, [bp+var_60]
		mov	ax, [bp+var_6E]
		mov	[bx+1Bh], ax
		inc	si
		cmp	word_4F048, 1
		jge	short loc_7CAAA
		mov	word_4F048, 0
		jmp	short loc_7CAAE

loc_7CAAA:
		sub	word_4F048, si

loc_7CAAE:
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7CABB:
		cmp	[bp+var_255], 4Bh
		jnb	short loc_7CAC9
		cmp	[bp+var_253], 0
		jz	short loc_7CACE

loc_7CAC9:
		mov	ax, 1
		jmp	short loc_7CAD0

loc_7CACE:
		xor	ax, ax

loc_7CAD0:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7CA8E
		push	0
		lea	ax, [bp+var_272]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		call	sub_2DA30
		lea	ax, [bp+var_58]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_4D], 0
		jz	short loc_7CB1A
		cmp	[bp+var_52], 0
		jz	short loc_7CB1A
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7CB1A

loc_7CB1A:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_7CB52
		cmp	[bp+var_48], 0
		jz	short loc_7CB52
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7CB52

loc_7CB52:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_7CB8A
		cmp	[bp+var_3E], 0
		jz	short loc_7CB8A
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7CB8A

loc_7CB8A:
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_7CBC2
		cmp	[bp+var_34], 0
		jz	short loc_7CBC2
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7CBC2

loc_7CBC2:
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		cmp	[bp+var_25], 0
		jz	short loc_7CBFA
		cmp	[bp+var_2A], 0
		jz	short loc_7CBFA
		push	0
		mov	al, [bp+var_26]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7CBFA

loc_7CBFA:
		mov	[bp+var_2A], 0
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		push	2
		lea	ax, [bp+var_250]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1D8]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_16]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_160]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_152]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_140]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_136]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_9], 0
		jz	short loc_7CCAD
		cmp	[bp+var_E], 0
		jz	short loc_7CCAD
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7CCAD

loc_7CCAD:
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		pop	di
		pop	si
		leave
		retf
MidgameTO3_Play_7C1D0		endp

; START OF FUNCTION CHUNK FOR MidgameTO3_Play_7C1D0
off_7CCC5	dw offset loc_7C227
		dw offset loc_7C393
		dw offset loc_7C393
		dw offset loc_7C393
		dw offset loc_7C393
; END OF FUNCTION CHUNK FOR MidgameTO3_Play_7C1D0
ovr204		ends
