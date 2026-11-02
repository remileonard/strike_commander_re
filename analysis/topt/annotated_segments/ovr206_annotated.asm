ovr206		segment	para public 'OVERLAY' use16
		assume cs:ovr206
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_829F0		proc far

var_482		= word ptr -482h
var_452		= word ptr -452h
var_426		= word ptr -426h
var_425		= dword ptr -425h
var_422		= word ptr -422h
var_421		= dword ptr -421h
var_41E		= dword ptr -41Eh
var_41A		= byte ptr -41Ah
var_418		= word ptr -418h
var_416		= word ptr -416h
var_414		= word ptr -414h
var_412		= word ptr -412h
var_410		= dword ptr -410h
var_40C		= byte ptr -40Ch
var_40A		= word ptr -40Ah
var_408		= word ptr -408h
var_406		= word ptr -406h
var_404		= word ptr -404h
var_402		= dword ptr -402h
var_3FE		= byte ptr -3FEh
var_3FC		= word ptr -3FCh
var_3E8		= word ptr -3E8h
var_3E6		= word ptr -3E6h
var_3E4		= word ptr -3E4h
var_3E2		= word ptr -3E2h
var_3E0		= dword ptr -3E0h
var_3DC		= byte ptr -3DCh
var_3DA		= word ptr -3DAh
var_3D8		= word ptr -3D8h
var_3D6		= word ptr -3D6h
var_3D4		= word ptr -3D4h
var_3D2		= dword ptr -3D2h
var_3CE		= byte ptr -3CEh
var_3CC		= word ptr -3CCh
var_354		= word ptr -354h
var_2DC		= word ptr -2DCh
var_264		= word ptr -264h
var_1EC		= word ptr -1ECh
var_174		= word ptr -174h
var_172		= word ptr -172h
var_170		= word ptr -170h
var_16E		= word ptr -16Eh
var_16C		= word ptr -16Ch
var_16A		= word ptr -16Ah
var_166		= word ptr -166h
var_164		= word ptr -164h
var_162		= word ptr -162h
var_160		= word ptr -160h
var_15E		= word ptr -15Eh
var_15C		= word ptr -15Ch
var_158		= word ptr -158h
var_108		= word ptr -108h
var_106		= word ptr -106h
var_104		= word ptr -104h
var_102		= word ptr -102h
var_100		= word ptr -100h
var_FE		= word ptr -0FEh
var_FC		= word ptr -0FCh
var_FA		= word ptr -0FAh
var_F8		= word ptr -0F8h
var_F6		= word ptr -0F6h
var_F4		= word ptr -0F4h
var_F2		= word ptr -0F2h
var_F0		= word ptr -0F0h
var_EE		= word ptr -0EEh
var_EC		= word ptr -0ECh
var_EA		= word ptr -0EAh
var_E8		= word ptr -0E8h
var_E6		= word ptr -0E6h
var_E4		= word ptr -0E4h
var_E2		= word ptr -0E2h
var_E0		= word ptr -0E0h
var_DE		= word ptr -0DEh
var_DC		= dword ptr -0DCh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D4		= dword ptr -0D4h
var_D2		= dword ptr -0D2h
var_D0		= dword ptr -0D0h
var_CE		= dword ptr -0CEh
var_CC		= dword ptr -0CCh
var_CA		= dword ptr -0CAh
var_C8		= dword ptr -0C8h
var_C6		= dword ptr -0C6h
var_C4		= dword ptr -0C4h
var_C2		= dword ptr -0C2h
var_C0		= dword ptr -0C0h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= byte ptr -0B6h
var_B5		= byte ptr -0B5h
var_B4		= dword ptr -0B4h
var_B0		= word ptr -0B0h
var_AE		= word ptr -0AEh
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
var_2E		= dword ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= byte ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 482h
		push	si
		push	di
		mov	byte_4F55C, 0
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	ax, word_4D36E
		mov	[bp+var_4], ax
		mov	[bp+var_166], 0
		mov	[bp+var_164], 0
		push	[bp+var_4]
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_174], 0
		mov	[bp+var_172], 0
		mov	[bp+var_170], 0
		mov	[bp+var_16E], 0
		mov	[bp+var_16C], 13Fh
		mov	[bp+var_16A], 9Dh
		push	0
		lea	ax, [bp+var_174]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_174]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_162], 0
		mov	[bp+var_160], 18h
		mov	[bp+var_15E], 13Fh
		mov	[bp+var_15C], 97h
		mov	byte ptr [bp+var_12], 0
		mov	byte ptr [bp+var_12+1], 0
		mov	[bp+var_10], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid14
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_1EC]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgames_13
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_264]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps_4
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_2DC]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals_3
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_354]
		push	ax
		call	sub_435F1
		add	sp, 2
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 2
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		mov	al, byte_4CA58
		mov	[bp+var_1E], al
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		mov	al, [bp+var_1E]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_82BC4
		jmp	loc_82EE7

loc_82BC4:
		shl	bx, 1
		jmp	cs:off_85FD6[bx]	; switch jump

loc_82BCB:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_158]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_82BF9
		jmp	loc_82D03

loc_82BF9:
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_3CC]
		push	ax
		mov	bx, [bp+var_3CC]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_3CC]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_14
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_482]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_482], 480h
		mov	[bp+var_421], 100h
		mov	[bp+var_425], 0
		mov	[bp+var_482], 498h
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_482]
		push	ax
		mov	bx, [bp+var_482]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_82CCB

loc_82CB5:
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_82CCB:
		cmp	si, 6Ah
		jle	short loc_82CB5
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_2], 1
		mov	[bp+var_482], 498h
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_482]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_82D03:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_158]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_82D41
		mov	[bp+var_1], 1
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_82D41
		mov	word_4F048, 5Ah

loc_82D41:
		jmp	loc_82EE7

loc_82D44:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_158]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_82D72
		jmp	loc_82E86

loc_82D72:
		cmp	word_4CA5D, 0
		jnz	short loc_82D7C
		jmp	loc_82E86

loc_82D7C:
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_3CC]
		push	ax
		mov	bx, [bp+var_3CC]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_3CC]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	ds
		push	offset aIff
		push	ds
		push	offset aMidgames_15
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_482]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_482], 480h
		mov	[bp+var_421], 100h
		mov	[bp+var_425], 0
		mov	[bp+var_482], 498h
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_482]
		push	ax
		mov	bx, [bp+var_482]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word_4F048, ax
		mov	si, 1
		jmp	short loc_82E4E

loc_82E38:
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+6592h], ax
		inc	si

loc_82E4E:
		cmp	si, 6Ah
		jle	short loc_82E38
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_2], 1
		mov	[bp+var_482], 498h
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_482]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_82E86:
		cmp	[bp+var_1E], 3
		jnz	short loc_82EA7
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_82EC0

loc_82EA7:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_82EC0:
		push	ds
		lea	ax, [bp+var_158]
		push	ax
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_82EE5
		mov	[bp+var_1], 1
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_82EE5
		mov	word_4F048, 0FFh

loc_82EE5:
		jmp	short loc_82EE7

loc_82EE7:
		mov	ax, word_4B2C4
		mov	[bp+var_24], ax
		mov	ax, word_4B2C6
		mov	[bp+var_22], ax
		mov	ax, word_4B2C8
		mov	[bp+var_20], ax
		cmp	[bp+var_2], 0
		jnz	short loc_82F02
		jmp	loc_83007

loc_82F02:
		mov	[bp+var_3E4], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_3E2], ax
		lea	ax, [bp+var_3E4]
		mov	word_4D392, ax
		mov	[bp+var_3E4], 1BCh
		mov	[bp+var_3E0], 0
		mov	[bp+var_3DC], 0
		mov	[bp+var_3E8], 0
		mov	[bp+var_3E6], 0FFFFh
		push	word_4CA5D
		lea	ax, [bp+var_3E8]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		xor	si, si
		jmp	loc_82FE3

loc_82F4C:
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, word ptr [bp+var_BA]
		push	ax
		mov	al, byte ptr [bp+si+var_24]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		lea	ax, word ptr [bp+var_BA]
		push	ax
		lea	ax, [bp+var_3E8]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_3E8]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		cmp	[bp+var_B5], 0
		jz	short loc_82FCB
		cmp	[bp+var_BA], 0
		jz	short loc_82FCB
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_82FCB

loc_82FCB:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		inc	si

loc_82FE3:
		cmp	si, 6
		jge	short loc_82FEB
		jmp	loc_82F4C

loc_82FEB:
		lea	ax, [bp+var_3E8]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3E4]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_83007:
		mov	[bp+var_3D6], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_3D4], ax
		lea	ax, [bp+var_3D6]
		mov	word_4D392, ax
		mov	[bp+var_3D6], 1BCh
		mov	[bp+var_3D2], 0
		mov	[bp+var_3CE], 0
		mov	[bp+var_3DA], 0
		mov	[bp+var_3D8], 0FFFFh
		cmp	[bp+var_1], 0
		jz	short loc_830AA
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_452]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_452]
		push	ax
		call	sub_435F1
		add	sp, 2
		push	3
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	8
		lea	ax, [bp+var_452]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA59
		lea	ax, [bp+var_3DA]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_1C]
		push	ax
		lea	ax, [bp+var_3DA]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, [bp+var_452]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_830AA:
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 2
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		push	3
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	74h
		lea	ax, [bp+var_2DC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_38], 0
		mov	[bp+var_34], 2
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	3
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	1
		lea	ax, [bp+var_1EC]
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
		push	4
		lea	ax, [bp+var_1EC]
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
		push	7
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_56], 0
		mov	[bp+var_52], 2
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	15h
		lea	ax, [bp+var_354]
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
		push	0
		lea	ax, [bp+var_1EC]
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
		push	0Dh
		lea	ax, [bp+var_1EC]
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
		push	0Ah
		lea	ax, [bp+var_1EC]
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
		push	2
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	3
		lea	ax, [bp+var_1EC]
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
		push	6
		lea	ax, [bp+var_1EC]
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
		cmp	byte_4F55C, 0
		jnz	short loc_8330B
		jmp	loc_8366F

loc_8330B:
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_83340
		cmp	[bp+var_A6], 0
		jz	short loc_83340
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83340

loc_83340:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_8338C
		cmp	[bp+var_96], 0
		jz	short loc_8338C
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8338C

loc_8338C:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_833D8
		cmp	[bp+var_86], 0
		jz	short loc_833D8
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_833D8

loc_833D8:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_8341E
		cmp	[bp+var_76], 0
		jz	short loc_8341E
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8341E

loc_8341E:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_83462
		cmp	[bp+var_66], 0
		jz	short loc_83462
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83462

loc_83462:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_834A6
		cmp	[bp+var_56], 0
		jz	short loc_834A6
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_834A6

loc_834A6:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_834DE
		cmp	[bp+var_4C], 0
		jz	short loc_834DE
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_834DE

loc_834DE:
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_83516
		cmp	[bp+var_42], 0
		jz	short loc_83516
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83516

loc_83516:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_8354E
		cmp	[bp+var_38], 0
		jz	short loc_8354E
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8354E

loc_8354E:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_83586
		cmp	[bp+var_2E], 0
		jz	short loc_83586
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83586

loc_83586:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_835E9
		cmp	[bp+var_1C], 0
		jz	short loc_835E9
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_835E9

loc_835E9:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_8366F:
		cmp	[bp+var_1], 0
		jz	short loc_836B9
		mov	ax, word_4F048
		mov	[bp+var_AE], ax
		mov	[bp+var_B0], 0
		cmp	[bp+var_3DA], 0
		jz	short loc_836B9
		push	[bp+var_3D8]
		mov	bx, [bp+var_3DA]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_B0]
		push	[bp+var_AE]
		push	[bp+var_3D8]
		mov	bx, [bp+var_3DA]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_836B9

loc_836B9:
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_166]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFA0h
		push	0
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_BE+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_BE], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	si, ax
		push	[bp+var_5C]
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_BE+2]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_BE]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	si
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_C8], 0
		mov	byte ptr [bp+var_C4], 2
		mov	byte ptr [bp+var_C4+1], 0
		mov	[bp+var_C2], 0
		mov	[bp+var_406], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_404], ax
		lea	ax, [bp+var_406]
		mov	word_4D392, ax
		mov	[bp+var_406], 1BCh
		mov	[bp+var_402], 0
		mov	[bp+var_3FE], 0
		mov	[bp+var_40A], 0
		mov	[bp+var_408], 0FFFFh
		cmp	[bp+var_2], 0
		jnz	short loc_8381D
		jmp	loc_8389C

loc_8381D:
		push	3
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	51h
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_C8]
		push	ax
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4F016
		mov	word ptr [bp+var_CA], ax
		mov	word ptr [bp+var_CC], 0
		cmp	[bp+var_40A], 0
		jz	short loc_8389C
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_CC]
		push	word ptr [bp+var_CA]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8389C

loc_8389C:
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	word ptr [bp+var_CE], 0Ch
		jmp	loc_839A5

loc_838B2:
		mov	di, word ptr [bp+var_3E0+1]
		cmp	di, 1Dh
		jge	short loc_838C6
		mov	word ptr [bp+var_D0], di
		mov	ax, word ptr [bp+var_D0]
		mov	[si+1Bh], ax

loc_838C6:
		cmp	di, 16h
		jnz	short loc_838E1
		dec	word ptr [bp+var_CE]
		mov	ax, word ptr [bp+var_CE]
		push	ax
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_838E1:
		cmp	di, 18h
		jnz	short loc_838FC
		dec	word ptr [bp+var_CE]
		mov	ax, word ptr [bp+var_CE]
		push	ax
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_838FC:
		cmp	di, 1Ah
		jnz	short loc_83917
		dec	word ptr [bp+var_CE]
		mov	ax, word ptr [bp+var_CE]
		push	ax
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_83917:
		cmp	di, 1Ch
		jnz	short loc_83932
		dec	word ptr [bp+var_CE]
		mov	ax, word ptr [bp+var_CE]
		push	ax
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_83932:
		cmp	di, 1Dh
		jnz	short loc_83944
		push	1
		push	1Ch
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_83944:
		cmp	di, 1Eh
		jnz	short loc_83956
		push	2
		push	23h
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_83956:
		cmp	di, 1Fh
		jnz	short loc_83968
		push	3
		push	2Dh
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_83968:
		cmp	di, 20h
		jnz	short loc_8398B
		push	si
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		or	si, si
		jz	short loc_8398B
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_8398B

loc_8398B:
		jmp	short loc_83998
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_83998
		jmp	short loc_839C3

loc_83998:
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_839A5:
		cmp	word ptr [bp+var_3E0+1], 21h
		jnb	short loc_839B3
		cmp	byte ptr [bp+var_3E0+3], 0
		jz	short loc_839B8

loc_839B3:
		mov	ax, 1
		jmp	short loc_839BA

loc_839B8:
		xor	ax, ax

loc_839BA:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_839C3
		jmp	loc_838B2

loc_839C3:
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_406]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_C4+1], 0
		jz	short loc_83A07
		cmp	[bp+var_C8], 0
		jz	short loc_83A07
		push	0
		mov	al, byte ptr [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83A07

loc_83A07:
		mov	[bp+var_C8], 0
		mov	byte ptr [bp+var_C4+1], 0
		mov	[bp+var_C2], 0
		push	0
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	[bp+var_B5], 0
		jz	short loc_83A55
		cmp	[bp+var_BA], 0
		jz	short loc_83A55
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83A55

loc_83A55:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	byte_4F55C, 0
		jnz	short loc_83A76
		jmp	loc_83DDA

loc_83A76:
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_83AAB
		cmp	[bp+var_A6], 0
		jz	short loc_83AAB
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83AAB

loc_83AAB:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_83AF7
		cmp	[bp+var_96], 0
		jz	short loc_83AF7
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83AF7

loc_83AF7:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_83B43
		cmp	[bp+var_86], 0
		jz	short loc_83B43
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83B43

loc_83B43:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_83B89
		cmp	[bp+var_76], 0
		jz	short loc_83B89
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83B89

loc_83B89:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_83BCD
		cmp	[bp+var_66], 0
		jz	short loc_83BCD
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83BCD

loc_83BCD:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_83C11
		cmp	[bp+var_56], 0
		jz	short loc_83C11
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83C11

loc_83C11:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_83C49
		cmp	[bp+var_4C], 0
		jz	short loc_83C49
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83C49

loc_83C49:
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_83C81
		cmp	[bp+var_42], 0
		jz	short loc_83C81
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83C81

loc_83C81:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_83CB9
		cmp	[bp+var_38], 0
		jz	short loc_83CB9
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83CB9

loc_83CB9:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_83CF1
		cmp	[bp+var_2E], 0
		jz	short loc_83CF1
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83CF1

loc_83CF1:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_83D54
		cmp	[bp+var_1C], 0
		jz	short loc_83D54
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_83D54

loc_83D54:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_83DDA:
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0Ch
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_C4], 0
		mov	byte ptr [bp+var_C0], 2
		mov	byte ptr [bp+var_C0+1], 0
		mov	[bp+var_BE], 0
		push	3
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	0Bh
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_166]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_C6], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	di, ax
		push	[bp+var_7C]
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_C6]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_D0], 0
		mov	byte ptr [bp+var_CC], 2
		mov	byte ptr [bp+var_CC+1], 0
		mov	[bp+var_CA], 0
		mov	[bp+var_406], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_404], ax
		lea	ax, [bp+var_406]
		mov	word_4D392, ax
		mov	[bp+var_406], 1BCh
		mov	[bp+var_402], 0
		mov	[bp+var_3FE], 0
		mov	[bp+var_40A], 0
		mov	[bp+var_408], 0FFFFh
		cmp	[bp+var_2], 0
		jz	short loc_83F6B
		push	3
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	2Dh
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_D0]
		push	ax
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_83F6B:
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		jmp	loc_84047

loc_83F7B:
		mov	si, word ptr [bp+var_3E0+1]
		cmp	si, 0Dh
		jnz	short loc_83FCE
		cmp	[bp+var_2], 0
		jz	short loc_83FCE
		mov	ax, word_4EFCE
		mov	word ptr [bp+var_D2], ax
		mov	word ptr [bp+var_D4], 0
		cmp	[bp+var_40A], 0
		jz	short loc_83FCE
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_D4]
		push	word ptr [bp+var_D2]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_83FCE

loc_83FCE:
		cmp	si, 12h
		jnz	short loc_8401D
		cmp	[bp+var_2], 0
		jz	short loc_8401D
		mov	ax, word_4EFCE
		mov	word ptr [bp+var_D6], ax
		mov	word ptr [bp+var_DA+2], 0
		cmp	[bp+var_40A], 0
		jz	short loc_8401D
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_DA+2]
		push	word ptr [bp+var_D6]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8401D

loc_8401D:
		cmp	si, 1Dh
		jge	short loc_8402D
		mov	word ptr [bp+var_DA], si
		mov	ax, word ptr [bp+var_DA]
		mov	[di+1Bh], ax

loc_8402D:
		jmp	short loc_8403A
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_8403A
		jmp	short loc_84065

loc_8403A:
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_84047:
		cmp	word ptr [bp+var_3E0+1], 20h
		jnb	short loc_84055
		cmp	byte ptr [bp+var_3E0+3], 0
		jz	short loc_8405A

loc_84055:
		mov	ax, 1
		jmp	short loc_8405C

loc_8405A:
		xor	ax, ax

loc_8405C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_84065
		jmp	loc_83F7B

loc_84065:
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_406]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_CC+1], 0
		jz	short loc_840A9
		cmp	[bp+var_D0], 0
		jz	short loc_840A9
		push	0
		mov	al, byte ptr [bp+var_CC]
		push	ax
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_840A9

loc_840A9:
		mov	[bp+var_D0], 0
		mov	byte ptr [bp+var_CC+1], 0
		mov	[bp+var_CA], 0
		push	0
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_C0+1], 0
		jz	short loc_840F7
		cmp	[bp+var_C4], 0
		jz	short loc_840F7
		push	0
		mov	al, byte ptr [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_840F7

loc_840F7:
		mov	[bp+var_C4], 0
		mov	byte ptr [bp+var_C0+1], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_84136
		cmp	[bp+var_BA], 0
		jz	short loc_84136
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84136

loc_84136:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	byte_4F55C, 0
		jnz	short loc_84157
		jmp	loc_844BB

loc_84157:
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_8418C
		cmp	[bp+var_A6], 0
		jz	short loc_8418C
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8418C

loc_8418C:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_841D8
		cmp	[bp+var_96], 0
		jz	short loc_841D8
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_841D8

loc_841D8:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_84224
		cmp	[bp+var_86], 0
		jz	short loc_84224
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84224

loc_84224:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_8426A
		cmp	[bp+var_76], 0
		jz	short loc_8426A
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8426A

loc_8426A:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_842AE
		cmp	[bp+var_66], 0
		jz	short loc_842AE
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_842AE

loc_842AE:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_842F2
		cmp	[bp+var_56], 0
		jz	short loc_842F2
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_842F2

loc_842F2:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_8432A
		cmp	[bp+var_4C], 0
		jz	short loc_8432A
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8432A

loc_8432A:
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_84362
		cmp	[bp+var_42], 0
		jz	short loc_84362
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84362

loc_84362:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_8439A
		cmp	[bp+var_38], 0
		jz	short loc_8439A
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8439A

loc_8439A:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_843D2
		cmp	[bp+var_2E], 0
		jz	short loc_843D2
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_843D2

loc_843D2:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_84435
		cmp	[bp+var_1C], 0
		jz	short loc_84435
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84435

loc_84435:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_844BB:
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	9
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_166]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	di, ax
		push	[bp+var_8C]
		mov	al, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	di
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_C4], 0
		mov	byte ptr [bp+var_C0], 2
		mov	byte ptr [bp+var_C0+1], 0
		mov	[bp+var_BE], 0
		mov	[bp+var_CE], 0
		mov	byte ptr [bp+var_CA], 2
		mov	byte ptr [bp+var_CA+1], 0
		mov	[bp+var_C8], 0
		mov	[bp+var_406], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_404], ax
		lea	ax, [bp+var_406]
		mov	word_4D392, ax
		mov	[bp+var_406], 1BCh
		mov	[bp+var_402], 0
		mov	[bp+var_3FE], 0
		mov	[bp+var_40A], 0
		mov	[bp+var_408], 0FFFFh
		mov	[bp+var_414], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_412], ax
		lea	ax, [bp+var_414]
		mov	word_4D392, ax
		mov	[bp+var_414], 1BCh
		mov	[bp+var_410], 0
		mov	[bp+var_40C], 0
		mov	[bp+var_418], 0
		mov	[bp+var_416], 0FFFFh
		cmp	[bp+var_2], 0
		jz	short loc_84682
		push	3
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	34h
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_CE]
		push	ax
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	3
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	2Eh
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_C4]
		push	ax
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_84682:
		jmp	short loc_84691

loc_84684:
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_84691:
		cmp	word ptr [bp+var_3E0+1], 0Ah
		jnb	short loc_8469F
		cmp	byte ptr [bp+var_3E0+3], 0
		jz	short loc_846A4

loc_8469F:
		mov	ax, 1
		jmp	short loc_846A6

loc_846A4:
		xor	ax, ax

loc_846A6:
		mov	ah, 0
		or	ax, ax
		jz	short loc_84684
		xor	si, si
		mov	word ptr [bp+var_D0], si
		inc	si
		mov	ax, word ptr [bp+var_D0]
		mov	[di+1Bh], ax
		jmp	loc_84961

loc_846BD:
		mov	ax, word ptr [bp+var_3E0+1]
		mov	word ptr [bp+var_D2], ax
		cmp	word ptr [bp+var_D2], 9
		jnz	short loc_846D8
		mov	word ptr [bp+var_D4], si
		inc	si
		mov	ax, word ptr [bp+var_D4]
		mov	[di+1Bh], ax

loc_846D8:
		cmp	word ptr [bp+var_D2], 0Ah
		jnz	short loc_84729
		cmp	[bp+var_2], 0
		jz	short loc_84729
		mov	ax, word_4EFD0
		mov	word ptr [bp+var_D6], ax
		mov	word ptr [bp+var_DA+2], 0
		cmp	[bp+var_40A], 0
		jz	short loc_84729
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	word ptr [bp+var_DA+2]
		push	word ptr [bp+var_D6]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_84729

loc_84729:
		cmp	word ptr [bp+var_D2], 0Ah
		jnz	short loc_8473C
		mov	word ptr [bp+var_DA], si
		inc	si
		mov	ax, word ptr [bp+var_DA]
		mov	[di+1Bh], ax

loc_8473C:
		cmp	word ptr [bp+var_D2], 0Ch
		jnz	short loc_8474F
		mov	word ptr [bp+var_DC], si
		inc	si
		mov	ax, word ptr [bp+var_DC]
		mov	[di+1Bh], ax

loc_8474F:
		cmp	word ptr [bp+var_D2], 0Eh
		jnz	short loc_847A0
		cmp	[bp+var_2], 0
		jz	short loc_847A0
		mov	ax, word_4EFD0
		mov	[bp+var_DE], ax
		mov	[bp+var_E0], 0
		cmp	[bp+var_40A], 0
		jz	short loc_847A0
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_E0]
		push	[bp+var_DE]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_847A0

loc_847A0:
		cmp	word ptr [bp+var_D2], 0Dh
		jnz	short loc_847B3
		mov	[bp+var_E2], si
		inc	si
		mov	ax, [bp+var_E2]
		mov	[di+1Bh], ax

loc_847B3:
		cmp	word ptr [bp+var_D2], 0Eh
		jnz	short loc_847C6
		mov	[bp+var_E4], si
		inc	si
		mov	ax, [bp+var_E4]
		mov	[di+1Bh], ax

loc_847C6:
		cmp	word ptr [bp+var_D2], 12h
		jnz	short loc_847D9
		mov	[bp+var_E6], si
		inc	si
		mov	ax, [bp+var_E6]
		mov	[di+1Bh], ax

loc_847D9:
		cmp	word ptr [bp+var_D2], 13h
		jnz	short loc_847EC
		mov	[bp+var_E8], si
		inc	si
		mov	ax, [bp+var_E8]
		mov	[di+1Bh], ax

loc_847EC:
		cmp	word ptr [bp+var_D2], 14h
		jnz	short loc_847FF
		mov	[bp+var_EA], si
		inc	si
		mov	ax, [bp+var_EA]
		mov	[di+1Bh], ax

loc_847FF:
		cmp	word ptr [bp+var_D2], 15h
		jnz	short loc_84812
		mov	[bp+var_EC], si
		inc	si
		mov	ax, [bp+var_EC]
		mov	[di+1Bh], ax

loc_84812:
		cmp	word ptr [bp+var_D2], 16h
		jnz	short loc_84825
		mov	[bp+var_EE], si
		inc	si
		mov	ax, [bp+var_EE]
		mov	[di+1Bh], ax

loc_84825:
		cmp	word ptr [bp+var_D2], 17h
		jnz	short loc_84838
		mov	[bp+var_F0], si
		inc	si
		mov	ax, [bp+var_F0]
		mov	[di+1Bh], ax

loc_84838:
		cmp	word ptr [bp+var_D2], 18h
		jnz	short loc_8484B
		mov	[bp+var_F2], si
		inc	si
		mov	ax, [bp+var_F2]
		mov	[di+1Bh], ax

loc_8484B:
		cmp	word ptr [bp+var_D2], 19h
		jnz	short loc_8485E
		mov	[bp+var_F4], si
		inc	si
		mov	ax, [bp+var_F4]
		mov	[di+1Bh], ax

loc_8485E:
		cmp	word ptr [bp+var_D2], 19h
		jnz	short loc_848AF
		cmp	[bp+var_2], 0
		jz	short loc_848AF
		mov	ax, word_4EFDC
		mov	[bp+var_F6], ax
		mov	[bp+var_F8], 0
		cmp	[bp+var_418], 0
		jz	short loc_848AF
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_F8]
		push	[bp+var_F6]
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_848AF

loc_848AF:
		cmp	word ptr [bp+var_D2], 1Ah
		jnz	short loc_848C2
		mov	[bp+var_FA], si
		dec	si
		mov	ax, [bp+var_FA]
		mov	[di+1Bh], ax

loc_848C2:
		cmp	word ptr [bp+var_D2], 1Dh
		jnz	short loc_848D5
		mov	[bp+var_FC], si
		inc	si
		mov	ax, [bp+var_FC]
		mov	[di+1Bh], ax

loc_848D5:
		cmp	word ptr [bp+var_D2], 20h
		jnz	short loc_848E8
		mov	[bp+var_FE], si
		dec	si
		mov	ax, [bp+var_FE]
		mov	[di+1Bh], ax

loc_848E8:
		cmp	word ptr [bp+var_D2], 23h
		jnz	short loc_848FB
		mov	[bp+var_100], si
		inc	si
		mov	ax, [bp+var_100]
		mov	[di+1Bh], ax

loc_848FB:
		cmp	word ptr [bp+var_D2], 26h
		jnz	short loc_8490E
		mov	[bp+var_102], si
		dec	si
		mov	ax, [bp+var_102]
		mov	[di+1Bh], ax

loc_8490E:
		cmp	word ptr [bp+var_D2], 29h
		jnz	short loc_84921
		mov	[bp+var_104], si
		inc	si
		mov	ax, [bp+var_104]
		mov	[di+1Bh], ax

loc_84921:
		cmp	word ptr [bp+var_D2], 2Ch
		jnz	short loc_84934
		mov	[bp+var_106], si
		dec	si
		mov	ax, [bp+var_106]
		mov	[di+1Bh], ax

loc_84934:
		cmp	word ptr [bp+var_D2], 2Fh
		jnz	short loc_84947
		mov	[bp+var_108], si
		inc	si
		mov	ax, [bp+var_108]
		mov	[di+1Bh], ax

loc_84947:
		jmp	short loc_84954
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_84954
		jmp	short loc_8497F

loc_84954:
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_84961:
		cmp	word ptr [bp+var_3E0+1], 31h
		jnb	short loc_8496F
		cmp	byte ptr [bp+var_3E0+3], 0
		jz	short loc_84974

loc_8496F:
		mov	ax, 1
		jmp	short loc_84976

loc_84974:
		xor	ax, ax

loc_84976:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8497F
		jmp	loc_846BD

loc_8497F:
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		lea	ax, [bp+var_418]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		lea	ax, [bp+var_418]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_414]
		push	ax
		call	sub_5C1C
		add	sp, 4
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_406]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_CA+1], 0
		jz	short loc_849F9
		cmp	[bp+var_CE], 0
		jz	short loc_849F9
		push	0
		mov	al, byte ptr [bp+var_CA]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_849F9

loc_849F9:
		mov	[bp+var_CE], 0
		mov	byte ptr [bp+var_CA+1], 0
		mov	[bp+var_C8], 0
		cmp	byte ptr [bp+var_C0+1], 0
		jz	short loc_84A38
		cmp	[bp+var_C4], 0
		jz	short loc_84A38
		push	0
		mov	al, byte ptr [bp+var_C0]
		push	ax
		lea	ax, word ptr [bp+var_C4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84A38

loc_84A38:
		mov	[bp+var_C4], 0
		mov	byte ptr [bp+var_C0+1], 0
		mov	[bp+var_BE], 0
		push	0
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	[bp+var_B5], 0
		jz	short loc_84A86
		cmp	[bp+var_BA], 0
		jz	short loc_84A86
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84A86

loc_84A86:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	byte_4F55C, 0
		jnz	short loc_84AA7
		jmp	loc_84E0B

loc_84AA7:
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_84ADC
		cmp	[bp+var_A6], 0
		jz	short loc_84ADC
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84ADC

loc_84ADC:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_84B28
		cmp	[bp+var_96], 0
		jz	short loc_84B28
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84B28

loc_84B28:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_84B74
		cmp	[bp+var_86], 0
		jz	short loc_84B74
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84B74

loc_84B74:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_84BBA
		cmp	[bp+var_76], 0
		jz	short loc_84BBA
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84BBA

loc_84BBA:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_84BFE
		cmp	[bp+var_66], 0
		jz	short loc_84BFE
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84BFE

loc_84BFE:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_84C42
		cmp	[bp+var_56], 0
		jz	short loc_84C42
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84C42

loc_84C42:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_84C7A
		cmp	[bp+var_4C], 0
		jz	short loc_84C7A
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84C7A

loc_84C7A:
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_84CB2
		cmp	[bp+var_42], 0
		jz	short loc_84CB2
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84CB2

loc_84CB2:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_84CEA
		cmp	[bp+var_38], 0
		jz	short loc_84CEA
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84CEA

loc_84CEA:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_84D22
		cmp	[bp+var_2E], 0
		jz	short loc_84D22
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84D22

loc_84D22:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_84D85
		cmp	[bp+var_1C], 0
		jz	short loc_84D85
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_84D85

loc_84D85:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_84E0B:
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	5
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_166]
		push	ax
		push	0FFh
		push	8
		lea	ax, [bp+var_3FC]
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
		mov	word ptr [bp+var_BE+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	di, ax
		push	[bp+var_9C]
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_BE+2]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_C6], 0
		mov	byte ptr [bp+var_C2], 2
		mov	byte ptr [bp+var_C2+1], 0
		mov	[bp+var_C0], 0
		mov	[bp+var_D0], 0
		mov	byte ptr [bp+var_CC], 2
		mov	byte ptr [bp+var_CC+1], 0
		mov	[bp+var_CA], 0
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		mov	[bp+var_406], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_404], ax
		lea	ax, [bp+var_406]
		mov	word_4D392, ax
		mov	[bp+var_406], 1BCh
		mov	[bp+var_402], 0
		mov	[bp+var_3FE], 0
		mov	[bp+var_40A], 0
		mov	[bp+var_408], 0FFFFh
		mov	[bp+var_414], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_412], ax
		lea	ax, [bp+var_414]
		mov	word_4D392, ax
		mov	[bp+var_414], 1BCh
		mov	[bp+var_410], 0
		mov	[bp+var_40C], 0
		mov	[bp+var_418], 0
		mov	[bp+var_416], 0FFFFh
		mov	[bp+var_422], 1B4h
		mov	ax, word_4D392
		mov	word ptr [bp+var_421+1], ax
		lea	ax, [bp+var_422]
		mov	word_4D392, ax
		mov	[bp+var_422], 1BCh
		mov	[bp+var_41E], 0
		mov	[bp+var_41A], 0
		mov	[bp+var_426], 0
		mov	word ptr [bp+var_425+1], 0FFFFh
		cmp	[bp+var_2], 0
		jnz	short loc_84FD4
		jmp	loc_85056

loc_84FD4:
		push	3
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	34h
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_D0]
		push	ax
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFDC
		add	ax, 0FF88h
		mov	word ptr [bp+var_DC], ax
		mov	[bp+var_DE], 0
		cmp	[bp+var_418], 0
		jz	short loc_85056
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_DE]
		push	word ptr [bp+var_DC]
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_85056

loc_85056:
		jmp	short loc_85065

loc_85058:
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_85065:
		cmp	word ptr [bp+var_3E0+1], 0Ah
		jnb	short loc_85073
		cmp	byte ptr [bp+var_3E0+3], 0
		jz	short loc_85078

loc_85073:
		mov	ax, 1
		jmp	short loc_8507A

loc_85078:
		xor	ax, ax

loc_8507A:
		mov	ah, 0
		or	ax, ax
		jz	short loc_85058
		mov	byte ptr [bp+var_E0+1], 0
		cmp	[bp+var_2], 0
		jnz	short loc_8508E
		jmp	loc_8510D

loc_8508E:
		push	3
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	31h
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_C6]
		push	ax
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFD6
		mov	[bp+var_E2], ax
		mov	[bp+var_E4], 0
		cmp	[bp+var_40A], 0
		jz	short loc_8510D
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_E4]
		push	[bp+var_E2]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8510D

loc_8510D:
		mov	word ptr [bp+var_3E0+1], 0
		jmp	loc_85286

loc_85116:
		mov	si, word ptr [bp+var_3E0+1]
		mov	[bp+var_E6], si
		mov	ax, [bp+var_E6]
		mov	[di+1Bh], ax
		cmp	si, 5
		jnz	short loc_8515A
		cmp	[bp+var_2], 0
		jz	short loc_8515A
		mov	ax, word_4EFDC
		mov	[bp+var_E8], ax
		cmp	[bp+var_418], 0
		jz	short loc_8515A
		push	0FA0h
		push	[bp+var_E8]
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8515A

loc_8515A:
		mov	al, byte ptr [bp+var_E0+1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_85167
		jmp	loc_85237

loc_85167:
		cmp	[bp+var_2], 0
		jnz	short loc_85170
		jmp	loc_85237

loc_85170:
		cmp	[bp+var_40A], 0
		jz	short loc_85198
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_85194
		mov	ax, 1
		jmp	short loc_85196

loc_85194:
		xor	ax, ax

loc_85196:
		jmp	short loc_8519A

loc_85198:
		mov	al, 0

loc_8519A:
		mov	ah, 0
		or	ax, ax
		jz	short loc_851A3
		jmp	loc_85237

loc_851A3:
		mov	byte ptr [bp+var_E0+1], 1
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	3
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	52h
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_426]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_DA]
		push	ax
		lea	ax, [bp+var_426]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4F018
		add	ax, 0FFE2h
		mov	[bp+var_EA], ax
		mov	[bp+var_EC], 0
		cmp	[bp+var_426], 0
		jz	short loc_85237
		push	word ptr [bp+var_425+1]
		mov	bx, [bp+var_426]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_EC]
		push	[bp+var_EA]
		push	word ptr [bp+var_425+1]
		mov	bx, [bp+var_426]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_85237

loc_85237:
		cmp	si, 0Eh
		jnz	short loc_8526C
		cmp	[bp+var_2], 0
		jz	short loc_8526C
		mov	ax, word_4F018
		mov	[bp+var_EE], ax
		cmp	[bp+var_426], 0
		jz	short loc_8526C
		push	7D0h
		push	[bp+var_EE]
		push	word ptr [bp+var_425+1]
		mov	bx, [bp+var_426]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_8526C

loc_8526C:
		jmp	short loc_85279
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_85279
		jmp	short loc_852A4

loc_85279:
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_85286:
		cmp	word ptr [bp+var_3E0+1], 29h
		jnb	short loc_85294
		cmp	byte ptr [bp+var_3E0+3], 0
		jz	short loc_85299

loc_85294:
		mov	ax, 1
		jmp	short loc_8529B

loc_85299:
		xor	ax, ax

loc_8529B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_852A4
		jmp	loc_85116

loc_852A4:
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		lea	ax, [bp+var_426]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_422]
		push	ax
		call	sub_5C1C
		add	sp, 4
		lea	ax, [bp+var_418]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_414]
		push	ax
		call	sub_5C1C
		add	sp, 4
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_406]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_D6+1], 0
		jz	short loc_85337
		cmp	[bp+var_DA], 0
		jz	short loc_85337
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85337

loc_85337:
		mov	[bp+var_DA], 0
		mov	byte ptr [bp+var_D6+1], 0
		mov	[bp+var_D4], 0
		cmp	byte ptr [bp+var_CC+1], 0
		jz	short loc_85376
		cmp	[bp+var_D0], 0
		jz	short loc_85376
		push	0
		mov	al, byte ptr [bp+var_CC]
		push	ax
		lea	ax, word ptr [bp+var_D0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85376

loc_85376:
		mov	[bp+var_D0], 0
		mov	byte ptr [bp+var_CC+1], 0
		mov	[bp+var_CA], 0
		cmp	byte ptr [bp+var_C2+1], 0
		jz	short loc_853B5
		cmp	[bp+var_C6], 0
		jz	short loc_853B5
		push	0
		mov	al, byte ptr [bp+var_C2]
		push	ax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_853B5

loc_853B5:
		mov	[bp+var_C6], 0
		mov	byte ptr [bp+var_C2+1], 0
		mov	[bp+var_C0], 0
		push	0
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	[bp+var_B5], 0
		jz	short loc_85403
		cmp	[bp+var_BA], 0
		jz	short loc_85403
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85403

loc_85403:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	byte_4F55C, 0
		jnz	short loc_85424
		jmp	loc_85788

loc_85424:
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_85459
		cmp	[bp+var_A6], 0
		jz	short loc_85459
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85459

loc_85459:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_854A5
		cmp	[bp+var_96], 0
		jz	short loc_854A5
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_854A5

loc_854A5:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_854F1
		cmp	[bp+var_86], 0
		jz	short loc_854F1
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_854F1

loc_854F1:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_85537
		cmp	[bp+var_76], 0
		jz	short loc_85537
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85537

loc_85537:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_8557B
		cmp	[bp+var_66], 0
		jz	short loc_8557B
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8557B

loc_8557B:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_855BF
		cmp	[bp+var_56], 0
		jz	short loc_855BF
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_855BF

loc_855BF:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_855F7
		cmp	[bp+var_4C], 0
		jz	short loc_855F7
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_855F7

loc_855F7:
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_8562F
		cmp	[bp+var_42], 0
		jz	short loc_8562F
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8562F

loc_8562F:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_85667
		cmp	[bp+var_38], 0
		jz	short loc_85667
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85667

loc_85667:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_8569F
		cmp	[bp+var_2E], 0
		jz	short loc_8569F
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8569F

loc_8569F:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_85702
		cmp	[bp+var_1C], 0
		jz	short loc_85702
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85702

loc_85702:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_85788:
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	8
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_166]
		push	ax
		push	0FFh
		push	0Dh
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0FFD7h
		push	0
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_BE+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_BE], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	di, ax
		push	[bp+var_AC]
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_5C]
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_BE+2]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_BE]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_C8], 0
		mov	byte ptr [bp+var_C4], 2
		mov	byte ptr [bp+var_C4+1], 0
		mov	[bp+var_C2], 0
		mov	[bp+var_D2], 0
		mov	byte ptr [bp+var_CE], 2
		mov	byte ptr [bp+var_CE+1], 0
		mov	[bp+var_CC], 0
		mov	[bp+var_DC], 0
		mov	byte ptr [bp+var_DA+2], 2
		mov	byte ptr [bp+var_DA+3], 0
		mov	[bp+var_D6], 0
		mov	[bp+var_406], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_404], ax
		lea	ax, [bp+var_406]
		mov	word_4D392, ax
		mov	[bp+var_406], 1BCh
		mov	[bp+var_402], 0
		mov	[bp+var_3FE], 0
		mov	[bp+var_40A], 0
		mov	[bp+var_408], 0FFFFh
		mov	[bp+var_414], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_412], ax
		lea	ax, [bp+var_414]
		mov	word_4D392, ax
		mov	[bp+var_414], 1BCh
		mov	[bp+var_410], 0
		mov	[bp+var_40C], 0
		mov	[bp+var_418], 0
		mov	[bp+var_416], 0FFFFh
		mov	[bp+var_422], 1B4h
		mov	ax, word_4D392
		mov	word ptr [bp+var_421+1], ax
		lea	ax, [bp+var_422]
		mov	word_4D392, ax
		mov	[bp+var_422], 1BCh
		mov	[bp+var_41E], 0
		mov	[bp+var_41A], 0
		mov	[bp+var_426], 0
		mov	word ptr [bp+var_425+1], 0FFFFh
		cmp	[bp+var_2], 0
		jnz	short loc_8598F
		jmp	loc_85A90

loc_8598F:
		push	3
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	34h
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_D2]
		push	ax
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4EFDC
		add	ax, 0FF9Ch
		mov	[bp+var_DE], ax
		mov	[bp+var_E0], 0
		cmp	[bp+var_418], 0
		jz	short loc_85A11
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_E0]
		push	[bp+var_DE]
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_85A11

loc_85A11:
		push	3
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	52h
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_426]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_DC]
		push	ax
		lea	ax, [bp+var_426]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, word_4F018
		mov	[bp+var_E2], ax
		mov	[bp+var_E4], 0
		cmp	[bp+var_426], 0
		jz	short loc_85A90
		push	word ptr [bp+var_425+1]
		mov	bx, [bp+var_426]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		push	[bp+var_E4]
		push	[bp+var_E2]
		push	word ptr [bp+var_425+1]
		mov	bx, [bp+var_426]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_85A90

loc_85A90:
		mov	[bp+var_E6], 0Dh
		jmp	short loc_85AE1

loc_85A98:
		mov	si, word ptr [bp+var_3E0+1]
		cmp	si, 28h
		jge	short loc_85AAC
		mov	[bp+var_E8], si
		mov	ax, [bp+var_E8]
		mov	[di+1Bh], ax

loc_85AAC:
		cmp	si, 23h
		jle	short loc_85AC7
		dec	[bp+var_E6]
		mov	ax, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_SetFps_33E73
		add	sp, 4

loc_85AC7:
		jmp	short loc_85AD4
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_85AD4
		jmp	short loc_85AFC

loc_85AD4:
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_85AE1:
		cmp	word ptr [bp+var_3E0+1], 2Eh
		jnb	short loc_85AEF
		cmp	byte ptr [bp+var_3E0+3], 0
		jz	short loc_85AF4

loc_85AEF:
		mov	ax, 1
		jmp	short loc_85AF6

loc_85AF4:
		xor	ax, ax

loc_85AF6:
		mov	ah, 0
		or	ax, ax
		jz	short loc_85A98

loc_85AFC:
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		lea	ax, [bp+var_426]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_422]
		push	ax
		call	sub_5C1C
		add	sp, 4
		lea	ax, [bp+var_418]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_414]
		push	ax
		call	sub_5C1C
		add	sp, 4
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_406]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	byte ptr [bp+var_DA+3], 0
		jz	short loc_85B8F
		cmp	[bp+var_DC], 0
		jz	short loc_85B8F
		push	0
		mov	al, byte ptr [bp+var_DA+2]
		push	ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85B8F

loc_85B8F:
		mov	[bp+var_DC], 0
		mov	byte ptr [bp+var_DA+3], 0
		mov	[bp+var_D6], 0
		cmp	byte ptr [bp+var_CE+1], 0
		jz	short loc_85BCE
		cmp	[bp+var_D2], 0
		jz	short loc_85BCE
		push	0
		mov	al, byte ptr [bp+var_CE]
		push	ax
		lea	ax, word ptr [bp+var_D2]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85BCE

loc_85BCE:
		mov	[bp+var_D2], 0
		mov	byte ptr [bp+var_CE+1], 0
		mov	[bp+var_CC], 0
		cmp	byte ptr [bp+var_C4+1], 0
		jz	short loc_85C0D
		cmp	[bp+var_C8], 0
		jz	short loc_85C0D
		push	0
		mov	al, byte ptr [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85C0D

loc_85C0D:
		mov	[bp+var_C8], 0
		mov	byte ptr [bp+var_C4+1], 0
		mov	[bp+var_C2], 0
		push	0
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	[bp+var_B5], 0
		jz	short loc_85C5B
		cmp	[bp+var_BA], 0
		jz	short loc_85C5B
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85C5B

loc_85C5B:
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_A1], 0
		jz	short loc_85CA7
		cmp	[bp+var_A6], 0
		jz	short loc_85CA7
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85CA7

loc_85CA7:
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_91], 0
		jz	short loc_85CF3
		cmp	[bp+var_96], 0
		jz	short loc_85CF3
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85CF3

loc_85CF3:
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_81], 0
		jz	short loc_85D3F
		cmp	[bp+var_86], 0
		jz	short loc_85D3F
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85D3F

loc_85D3F:
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_71], 0
		jz	short loc_85D85
		cmp	[bp+var_76], 0
		jz	short loc_85D85
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85D85

loc_85D85:
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_61], 0
		jz	short loc_85DC9
		cmp	[bp+var_66], 0
		jz	short loc_85DC9
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85DC9

loc_85DC9:
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_51], 0
		jz	short loc_85E0D
		cmp	[bp+var_56], 0
		jz	short loc_85E0D
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85E0D

loc_85E0D:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_85E45
		cmp	[bp+var_4C], 0
		jz	short loc_85E45
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85E45

loc_85E45:
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_85E7D
		cmp	[bp+var_42], 0
		jz	short loc_85E7D
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85E7D

loc_85E7D:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_85EB5
		cmp	[bp+var_38], 0
		jz	short loc_85EB5
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85EB5

loc_85EB5:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_85EED
		cmp	[bp+var_2E], 0
		jz	short loc_85EED
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85EED

loc_85EED:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_85F50
		cmp	[bp+var_1C], 0
		jz	short loc_85F50
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_85F50

loc_85F50:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_829F0		endp

; START OF FUNCTION CHUNK FOR sub_829F0
off_85FD6	dw offset loc_82BCB
		dw offset loc_82D44
		dw offset loc_82D44
		dw offset loc_82D44
		dw offset loc_82D44
; END OF FUNCTION CHUNK FOR sub_829F0
ovr206		ends
