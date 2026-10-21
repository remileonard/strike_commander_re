ovr202		segment	para public 'OVERLAY' use16
		assume cs:ovr202
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_87DD0	proc far		; CODE XREF: sub_424D0J

var_482		= word ptr -482h
var_452		= word ptr -452h
var_425		= dword	ptr -425h
var_421		= dword	ptr -421h
var_41D		= byte ptr -41Dh
var_41C		= dword	ptr -41Ch
var_418		= word ptr -418h
var_416		= word ptr -416h
var_414		= dword	ptr -414h
var_410		= byte ptr -410h
var_40F		= byte ptr -40Fh
var_40E		= dword	ptr -40Eh
var_40A		= word ptr -40Ah
var_408		= word ptr -408h
var_406		= dword	ptr -406h
var_402		= byte ptr -402h
var_401		= byte ptr -401h
var_400		= dword	ptr -400h
var_3FC		= word ptr -3FCh
var_3E8		= word ptr -3E8h
var_3E6		= word ptr -3E6h
var_3E4		= dword	ptr -3E4h
var_3E0		= byte ptr -3E0h
var_3DF		= word ptr -3DFh
var_3DD		= byte ptr -3DDh
var_3DA		= word ptr -3DAh
var_3D8		= word ptr -3D8h
var_3D6		= dword	ptr -3D6h
var_3D2		= byte ptr -3D2h
var_3D1		= byte ptr -3D1h
var_3D0		= dword	ptr -3D0h
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
var_DC		= dword	ptr -0DCh
var_D8		= byte ptr -0D8h
var_D7		= byte ptr -0D7h
var_D6		= dword	ptr -0D6h
var_D2		= dword	ptr -0D2h
var_CE		= byte ptr -0CEh
var_CD		= byte ptr -0CDh
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C3		= byte ptr -0C3h
var_C2		= dword	ptr -0C2h
var_BC		= word ptr -0BCh
var_BA		= dword	ptr -0BAh
var_B6		= byte ptr -0B6h
var_B5		= byte ptr -0B5h
var_B4		= dword	ptr -0B4h
var_B0		= word ptr -0B0h
var_AE		= word ptr -0AEh
var_AC		= word ptr -0ACh
var_AA		= byte ptr -0AAh
var_A9		= word ptr -0A9h
var_A6		= dword	ptr -0A6h
var_A2		= byte ptr -0A2h
var_A1		= byte ptr -0A1h
var_A0		= dword	ptr -0A0h
var_9C		= word ptr -9Ch
var_9A		= byte ptr -9Ah
var_99		= word ptr -99h
var_96		= dword	ptr -96h
var_92		= byte ptr -92h
var_91		= byte ptr -91h
var_90		= dword	ptr -90h
var_8C		= word ptr -8Ch
var_8A		= byte ptr -8Ah
var_89		= word ptr -89h
var_86		= dword	ptr -86h
var_82		= byte ptr -82h
var_81		= byte ptr -81h
var_80		= dword	ptr -80h
var_7C		= word ptr -7Ch
var_7A		= byte ptr -7Ah
var_79		= word ptr -79h
var_76		= dword	ptr -76h
var_72		= byte ptr -72h
var_71		= byte ptr -71h
var_70		= dword	ptr -70h
var_6C		= word ptr -6Ch
var_6A		= byte ptr -6Ah
var_69		= word ptr -69h
var_66		= dword	ptr -66h
var_62		= byte ptr -62h
var_61		= byte ptr -61h
var_60		= dword	ptr -60h
var_5C		= word ptr -5Ch
var_5A		= byte ptr -5Ah
var_59		= word ptr -59h
var_56		= dword	ptr -56h
var_52		= byte ptr -52h
var_51		= byte ptr -51h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= byte ptr -48h
var_47		= byte ptr -47h
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= byte ptr -3Eh
var_3D		= byte ptr -3Dh
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= byte ptr -34h
var_33		= byte ptr -33h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= byte ptr -1Eh
var_1C		= dword	ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword	ptr -16h
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
		mov	byte_495FC, 0
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	ax, word_46F46
		mov	[bp+var_4], ax
		mov	[bp+var_166], 0
		mov	[bp+var_164], 0
		push	[bp+var_4]
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_174], 0
		mov	[bp+var_172], 0
		mov	[bp+var_170], 0
		mov	[bp+var_16E], 0
		mov	[bp+var_16C], 13Fh
		mov	[bp+var_16A], 9Dh ; '�'
		push	0
		lea	ax, [bp+var_174]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_174]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_162], 0
		mov	[bp+var_160], 18h
		mov	[bp+var_15E], 13Fh
		mov	[bp+var_15C], 97h ; '�'
		mov	byte ptr [bp+var_12], 0
		mov	byte ptr [bp+var_12+1],	0
		mov	[bp+var_10], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid14	; "mid14"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_19 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_3 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_3 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 2
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		mov	al, byte_46848
		mov	[bp+var_1E], al
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_1E]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_87F75
		cmp	ax, 2
		jnz	short loc_87F72
		jmp	loc_880E1
; ���������������������������������������������������������������������������

loc_87F72:				; CODE XREF: sub_87DD0+19Dj
		jmp	loc_8824C
; ���������������������������������������������������������������������������

loc_87F75:				; CODE XREF: sub_87DD0+198j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_158]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_87FA3
		jmp	loc_880A0
; ���������������������������������������������������������������������������

loc_87FA3:				; CODE XREF: sub_87DD0+1CEj
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_3CC]
		push	ax
		mov	bx, [bp+var_3CC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_20 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_482]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_482], 556h
		mov	[bp+var_421], 100h
		mov	[bp+var_425], 0
		mov	[bp+var_482], 56Eh
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
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_88068
; ���������������������������������������������������������������������������

loc_88052:				; CODE XREF: sub_87DD0+29Bj
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_88068:				; CODE XREF: sub_87DD0+280j
		cmp	si, 6Ah	; 'j'
		jle	short loc_88052
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_2], 1
		mov	[bp+var_482], 56Eh
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_482]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_880A0:				; CODE XREF: sub_87DD0+1D0j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_158]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_880DE
		mov	[bp+var_1], 1
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_880DE
		mov	word_48F76, 5Ah	; 'Z'

loc_880DE:				; CODE XREF: sub_87DD0+2F9j
					; sub_87DD0+306j
		jmp	loc_8824C
; ���������������������������������������������������������������������������

loc_880E1:				; CODE XREF: sub_87DD0+19Fj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_158]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_8810F
		jmp	loc_8820C
; ���������������������������������������������������������������������������

loc_8810F:				; CODE XREF: sub_87DD0+33Aj
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_3CC]
		push	ax
		mov	bx, [bp+var_3CC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_21 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_482]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_482], 556h
		mov	[bp+var_421], 100h
		mov	[bp+var_425], 0
		mov	[bp+var_482], 56Eh
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
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_881D4
; ���������������������������������������������������������������������������

loc_881BE:				; CODE XREF: sub_87DD0+407j
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_881D4:				; CODE XREF: sub_87DD0+3ECj
		cmp	si, 6Ah	; 'j'
		jle	short loc_881BE
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_2], 1
		mov	[bp+var_482], 56Eh
		lea	ax, [bp+var_482]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_482]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_8820C:				; CODE XREF: sub_87DD0+33Cj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_158]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_8824A
		mov	[bp+var_1], 1
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8824A
		mov	word_48F76, 0FFh

loc_8824A:				; CODE XREF: sub_87DD0+465j
					; sub_87DD0+472j
		jmp	short $+2

loc_8824C:				; CODE XREF: sub_87DD0:loc_87F72j
					; sub_87DD0:loc_880DEj
		mov	ax, word_452DC
		mov	[bp+var_24], ax
		mov	ax, word_452DE
		mov	[bp+var_22], ax
		mov	ax, word_452E0
		mov	[bp+var_20], ax
		cmp	[bp+var_2], 0
		jnz	short loc_88267
		jmp	loc_88390
; ���������������������������������������������������������������������������

loc_88267:				; CODE XREF: sub_87DD0+492j
		mov	[bp+var_3E4], 0
		mov	[bp+var_3E0], 2
		mov	byte ptr [bp+var_3DF], 0
		mov	dword ptr [bp+var_3DF+1], 0
		mov	[bp+var_3E8], 0
		mov	[bp+var_3E6], 0FFFFh
		push	word_46849
		lea	ax, [bp+var_3E8]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		xor	si, si
		jmp	loc_8833C
; ���������������������������������������������������������������������������

loc_882A5:				; CODE XREF: sub_87DD0+571j
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, [bp+var_BA]
		push	ax
		mov	al, byte ptr [bp+si+var_24]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_3E8]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_3E8]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_B5], 0
		jz	short loc_88324
		cmp	[bp+var_BA], 0
		jz	short loc_88324
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88324:				; CODE XREF: sub_87DD0+531j
					; sub_87DD0+539j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		inc	si

loc_8833C:				; CODE XREF: sub_87DD0+4D2j
		cmp	si, 6
		jge	short loc_88344
		jmp	loc_882A5
; ���������������������������������������������������������������������������

loc_88344:				; CODE XREF: sub_87DD0+56Fj
		lea	ax, [bp+var_3E8]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_3DF], 0
		jz	short loc_88379
		cmp	[bp+var_3E4], 0
		jz	short loc_88379
		push	0
		mov	al, [bp+var_3E0]
		push	ax
		lea	ax, [bp+var_3E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88379:				; CODE XREF: sub_87DD0+586j
					; sub_87DD0+58Ej
		mov	[bp+var_3E4], 0
		mov	byte ptr [bp+var_3DF], 0
		mov	dword ptr [bp+var_3DF+1], 0

loc_88390:				; CODE XREF: sub_87DD0+494j
		mov	[bp+var_3D6], 0
		mov	[bp+var_3D2], 2
		mov	[bp+var_3D1], 0
		mov	[bp+var_3D0], 0
		mov	[bp+var_3DA], 0
		mov	[bp+var_3D8], 0FFFFh
		cmp	[bp+var_1], 0
		jz	short loc_8841A
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_452]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	3
		lea	ax, [bp+var_1C]
		push	ax
		push	8
		lea	ax, [bp+var_452]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_3DA]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_3DA]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_452]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_8841A:				; CODE XREF: sub_87DD0+5ECj
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 2
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		push	3
		lea	ax, [bp+var_2E]
		push	ax
		push	74h ; 't'
		lea	ax, [bp+var_2DC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_38], 0
		mov	[bp+var_34], 2
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	3
		lea	ax, [bp+var_38]
		push	ax
		push	1
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_42], 0
		mov	[bp+var_3E], 2
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		push	3
		lea	ax, [bp+var_42]
		push	ax
		push	4
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_4C], 0
		mov	[bp+var_48], 2
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		push	3
		lea	ax, [bp+var_4C]
		push	ax
		push	7
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_56], 0
		mov	[bp+var_52], 2
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		push	15h
		lea	ax, [bp+var_354]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_59], 0
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_66], 0
		mov	[bp+var_62], 2
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		push	0
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_69], 0
		lea	ax, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_76], 0
		mov	[bp+var_72], 2
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		push	0Dh
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_79], 0
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_86], 0
		mov	[bp+var_82], 2
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		push	0Ah
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_89], 0
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_96], 0
		mov	[bp+var_92], 2
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		push	3
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_99], 0
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_A6], 0
		mov	[bp+var_A2], 2
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		push	6
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_A9], 0
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_8867B
		jmp	loc_88A1F
; ���������������������������������������������������������������������������

loc_8867B:				; CODE XREF: sub_87DD0+8A6j
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_886B2
		cmp	[bp+var_A6], 0
		jz	short loc_886B2
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_886B2:				; CODE XREF: sub_87DD0+8BFj
					; sub_87DD0+8C7j
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_91], 0
		jz	short loc_88700
		cmp	[bp+var_96], 0
		jz	short loc_88700
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88700:				; CODE XREF: sub_87DD0+90Dj
					; sub_87DD0+915j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_8874E
		cmp	[bp+var_86], 0
		jz	short loc_8874E
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8874E:				; CODE XREF: sub_87DD0+95Bj
					; sub_87DD0+963j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_88796
		cmp	[bp+var_76], 0
		jz	short loc_88796
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88796:				; CODE XREF: sub_87DD0+9A6j
					; sub_87DD0+9ADj
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_887DC
		cmp	[bp+var_66], 0
		jz	short loc_887DC
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_887DC:				; CODE XREF: sub_87DD0+9ECj
					; sub_87DD0+9F3j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_88822
		cmp	[bp+var_56], 0
		jz	short loc_88822
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88822:				; CODE XREF: sub_87DD0+A32j
					; sub_87DD0+A39j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_8885A
		cmp	[bp+var_4C], 0
		jz	short loc_8885A
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8885A:				; CODE XREF: sub_87DD0+A6Aj
					; sub_87DD0+A71j
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_88892
		cmp	[bp+var_42], 0
		jz	short loc_88892
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88892:				; CODE XREF: sub_87DD0+AA2j
					; sub_87DD0+AA9j
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_888CA
		cmp	[bp+var_38], 0
		jz	short loc_888CA
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_888CA:				; CODE XREF: sub_87DD0+ADAj
					; sub_87DD0+AE1j
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_88902
		cmp	[bp+var_2E], 0
		jz	short loc_88902
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88902:				; CODE XREF: sub_87DD0+B12j
					; sub_87DD0+B19j
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3D1], 0
		jz	short loc_8894B
		cmp	[bp+var_3D6], 0
		jz	short loc_8894B
		push	0
		mov	al, [bp+var_3D2]
		push	ax
		lea	ax, [bp+var_3D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8894B:				; CODE XREF: sub_87DD0+B58j
					; sub_87DD0+B60j
		mov	[bp+var_3D6], 0
		mov	[bp+var_3D1], 0
		mov	[bp+var_3D0], 0
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_88995
		cmp	[bp+var_1C], 0
		jz	short loc_88995
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88995:				; CODE XREF: sub_87DD0+BA5j
					; sub_87DD0+BACj
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_88A1F:				; CODE XREF: sub_87DD0+8A8j
		cmp	[bp+var_1], 0
		jz	short loc_88A69
		mov	ax, word_48F76
		mov	[bp+var_AE], ax
		mov	[bp+var_B0], 0
		cmp	[bp+var_3DA], 0
		jz	short loc_88A69
		push	[bp+var_3D8]
		mov	bx, [bp+var_3DA]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_B0]
		push	[bp+var_AE]
		push	[bp+var_3D8]
		mov	bx, [bp+var_3DA]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_88A69:				; CODE XREF: sub_87DD0+C53j
					; sub_87DD0+C67j
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, [bp+var_BA]
		push	ax
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_166]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFA0h
		push	0
		lea	ax, [bp+var_2E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_BC], ax
		push	0
		push	0
		lea	ax, [bp+var_38]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-0BEh], ax
		push	0
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	si, ax
		push	[bp+var_5C]
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_BC]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-0BEh]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	si
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_C8], 0
		mov	byte ptr [bp-0C4h], 2
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		mov	[bp+var_406], 0
		mov	[bp+var_402], 2
		mov	[bp+var_401], 0
		mov	[bp+var_400], 0
		mov	[bp+var_40A], 0
		mov	[bp+var_408], 0FFFFh
		cmp	[bp+var_2], 0
		jnz	short loc_88BC1
		jmp	loc_88C40
; ���������������������������������������������������������������������������

loc_88BC1:				; CODE XREF: sub_87DD0+DECj
		push	3
		lea	ax, [bp+var_C8]
		push	ax
		push	51h ; 'Q'
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_C8]
		push	ax
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F44
		mov	word ptr [bp+var_CC+2],	ax
		mov	word ptr [bp+var_CC], 0
		cmp	[bp+var_40A], 0
		jz	short loc_88C40
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_CC]
		push	word ptr [bp+var_CC+2]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_88C40:				; CODE XREF: sub_87DD0+DEEj
					; sub_87DD0+E3Ej
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	word ptr [bp+var_CE], 0Ch
		jmp	loc_88D49
; ���������������������������������������������������������������������������

loc_88C56:				; CODE XREF: sub_87DD0+F94j
		mov	di, [bp+var_3DF]
		cmp	di, 1Dh
		jge	short loc_88C6A
		mov	word ptr [bp+var_D2+2],	di
		mov	ax, word ptr [bp+var_D2+2]
		mov	[si+1Bh], ax

loc_88C6A:				; CODE XREF: sub_87DD0+E8Dj
		cmp	di, 16h
		jnz	short loc_88C85
		dec	word ptr [bp+var_CE]
		mov	ax, word ptr [bp+var_CE]
		push	ax
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_88C85:				; CODE XREF: sub_87DD0+E9Dj
		cmp	di, 18h
		jnz	short loc_88CA0
		dec	word ptr [bp+var_CE]
		mov	ax, word ptr [bp+var_CE]
		push	ax
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_88CA0:				; CODE XREF: sub_87DD0+EB8j
		cmp	di, 1Ah
		jnz	short loc_88CBB
		dec	word ptr [bp+var_CE]
		mov	ax, word ptr [bp+var_CE]
		push	ax
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_88CBB:				; CODE XREF: sub_87DD0+ED3j
		cmp	di, 1Ch
		jnz	short loc_88CD6
		dec	word ptr [bp+var_CE]
		mov	ax, word ptr [bp+var_CE]
		push	ax
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_88CD6:				; CODE XREF: sub_87DD0+EEEj
		cmp	di, 1Dh
		jnz	short loc_88CE8
		push	1
		push	1Ch
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_88CE8:				; CODE XREF: sub_87DD0+F09j
		cmp	di, 1Eh
		jnz	short loc_88CFA
		push	2
		push	23h ; '#'
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_88CFA:				; CODE XREF: sub_87DD0+F1Bj
		cmp	di, 1Fh
		jnz	short loc_88D0C
		push	3
		push	2Dh ; '-'
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_88D0C:				; CODE XREF: sub_87DD0+F2Dj
		cmp	di, 20h	; ' '
		jnz	short loc_88D2F
		push	si
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		or	si, si
		jz	short loc_88D2F
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_88D2F:				; CODE XREF: sub_87DD0+F3Fj
					; sub_87DD0+F51j
		jmp	short loc_88D3C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_88D3C
		jmp	short loc_88D67
; ���������������������������������������������������������������������������

loc_88D3C:				; CODE XREF: sub_87DD0:loc_88D2Fj
					; sub_87DD0+F68j
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_88D49:				; CODE XREF: sub_87DD0+E83j
		cmp	[bp+var_3DF], 21h ; '!'
		jnb	short loc_88D57
		cmp	[bp+var_3DD], 0
		jz	short loc_88D5C

loc_88D57:				; CODE XREF: sub_87DD0+F7Ej
		mov	ax, 1
		jmp	short loc_88D5E
; ���������������������������������������������������������������������������

loc_88D5C:				; CODE XREF: sub_87DD0+F85j
		xor	ax, ax

loc_88D5E:				; CODE XREF: sub_87DD0+F8Aj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_88D67
		jmp	loc_88C56
; ���������������������������������������������������������������������������

loc_88D67:				; CODE XREF: sub_87DD0+F6Aj
					; sub_87DD0+F92j
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_401], 0
		jz	short loc_88D9C
		cmp	[bp+var_406], 0
		jz	short loc_88D9C
		push	0
		mov	al, [bp+var_402]
		push	ax
		lea	ax, [bp+var_406]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88D9C:				; CODE XREF: sub_87DD0+FA9j
					; sub_87DD0+FB1j
		mov	[bp+var_406], 0
		mov	[bp+var_401], 0
		mov	[bp+var_400], 0
		cmp	[bp+var_C3], 0
		jz	short loc_88DDB
		cmp	[bp+var_C8], 0
		jz	short loc_88DDB
		push	0
		mov	al, [bp-0C4h]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88DDB:				; CODE XREF: sub_87DD0+FE8j
					; sub_87DD0+FF0j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	0
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_B5], 0
		jz	short loc_88E29
		cmp	[bp+var_BA], 0
		jz	short loc_88E29
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88E29:				; CODE XREF: sub_87DD0+1036j
					; sub_87DD0+103Ej
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	byte_495FC, 0
		jnz	short loc_88E4A
		jmp	loc_891EE
; ���������������������������������������������������������������������������

loc_88E4A:				; CODE XREF: sub_87DD0+1075j
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_88E81
		cmp	[bp+var_A6], 0
		jz	short loc_88E81
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88E81:				; CODE XREF: sub_87DD0+108Ej
					; sub_87DD0+1096j
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_91], 0
		jz	short loc_88ECF
		cmp	[bp+var_96], 0
		jz	short loc_88ECF
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88ECF:				; CODE XREF: sub_87DD0+10DCj
					; sub_87DD0+10E4j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_88F1D
		cmp	[bp+var_86], 0
		jz	short loc_88F1D
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88F1D:				; CODE XREF: sub_87DD0+112Aj
					; sub_87DD0+1132j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_88F65
		cmp	[bp+var_76], 0
		jz	short loc_88F65
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88F65:				; CODE XREF: sub_87DD0+1175j
					; sub_87DD0+117Cj
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_88FAB
		cmp	[bp+var_66], 0
		jz	short loc_88FAB
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88FAB:				; CODE XREF: sub_87DD0+11BBj
					; sub_87DD0+11C2j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_88FF1
		cmp	[bp+var_56], 0
		jz	short loc_88FF1
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_88FF1:				; CODE XREF: sub_87DD0+1201j
					; sub_87DD0+1208j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_89029
		cmp	[bp+var_4C], 0
		jz	short loc_89029
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89029:				; CODE XREF: sub_87DD0+1239j
					; sub_87DD0+1240j
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_89061
		cmp	[bp+var_42], 0
		jz	short loc_89061
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89061:				; CODE XREF: sub_87DD0+1271j
					; sub_87DD0+1278j
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_89099
		cmp	[bp+var_38], 0
		jz	short loc_89099
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89099:				; CODE XREF: sub_87DD0+12A9j
					; sub_87DD0+12B0j
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_890D1
		cmp	[bp+var_2E], 0
		jz	short loc_890D1
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_890D1:				; CODE XREF: sub_87DD0+12E1j
					; sub_87DD0+12E8j
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3D1], 0
		jz	short loc_8911A
		cmp	[bp+var_3D6], 0
		jz	short loc_8911A
		push	0
		mov	al, [bp+var_3D2]
		push	ax
		lea	ax, [bp+var_3D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8911A:				; CODE XREF: sub_87DD0+1327j
					; sub_87DD0+132Fj
		mov	[bp+var_3D6], 0
		mov	[bp+var_3D1], 0
		mov	[bp+var_3D0], 0
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_89164
		cmp	[bp+var_1C], 0
		jz	short loc_89164
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89164:				; CODE XREF: sub_87DD0+1374j
					; sub_87DD0+137Bj
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_891EE:				; CODE XREF: sub_87DD0+1077j
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, [bp+var_BA]
		push	ax
		push	0Ch
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-0C4h], 0
		mov	byte ptr [bp+var_C2+2],	2
		mov	byte ptr [bp+var_C2+3],	0
		mov	dword ptr [bp-0BEh], 0
		push	3
		lea	ax, [bp-0C4h]
		push	ax
		push	0Bh
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_166]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_C8+2],	ax
		push	0
		push	0
		lea	ax, [bp-0C4h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	di, ax
		push	[bp+var_7C]
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_C8+2]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_D2+2], 0
		mov	byte ptr [bp+var_CC], 2
		mov	byte ptr [bp+var_CC+1],	0
		mov	[bp+var_CC+2], 0
		mov	[bp+var_406], 0
		mov	[bp+var_402], 2
		mov	[bp+var_401], 0
		mov	[bp+var_400], 0
		mov	[bp+var_40A], 0
		mov	[bp+var_408], 0FFFFh
		cmp	[bp+var_2], 0
		jz	short loc_89373
		push	3
		lea	ax, [bp+var_D2+2]
		push	ax
		push	2Dh ; '-'
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_D2+2]
		push	ax
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_89373:				; CODE XREF: sub_87DD0+1566j
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		jmp	loc_8944F
; ���������������������������������������������������������������������������

loc_89383:				; CODE XREF: sub_87DD0+169Aj
		mov	si, [bp+var_3DF]
		cmp	si, 0Dh
		jnz	short loc_893D6
		cmp	[bp+var_2], 0
		jz	short loc_893D6
		mov	ax, word_48EFC
		mov	word ptr [bp+var_D2], ax
		mov	word ptr [bp+var_D6+2],	0
		cmp	[bp+var_40A], 0
		jz	short loc_893D6
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_D6+2]
		push	word ptr [bp+var_D2]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_893D6:				; CODE XREF: sub_87DD0+15BAj
					; sub_87DD0+15C0j ...
		cmp	si, 12h
		jnz	short loc_89425
		cmp	[bp+var_2], 0
		jz	short loc_89425
		mov	ax, word_48EFC
		mov	word ptr [bp+var_D6], ax
		mov	word ptr [bp+var_D8], 0
		cmp	[bp+var_40A], 0
		jz	short loc_89425
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_D8]
		push	word ptr [bp+var_D6]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_89425:				; CODE XREF: sub_87DD0+1609j
					; sub_87DD0+160Fj ...
		cmp	si, 1Dh
		jge	short loc_89435
		mov	word ptr [bp+var_DC+2],	si
		mov	ax, word ptr [bp+var_DC+2]
		mov	[di+1Bh], ax

loc_89435:				; CODE XREF: sub_87DD0+1658j
		jmp	short loc_89442
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_89442
		jmp	short loc_8946D
; ���������������������������������������������������������������������������

loc_89442:				; CODE XREF: sub_87DD0:loc_89435j
					; sub_87DD0+166Ej
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8944F:				; CODE XREF: sub_87DD0+15B0j
		cmp	[bp+var_3DF], 20h ; ' '
		jnb	short loc_8945D
		cmp	[bp+var_3DD], 0
		jz	short loc_89462

loc_8945D:				; CODE XREF: sub_87DD0+1684j
		mov	ax, 1
		jmp	short loc_89464
; ���������������������������������������������������������������������������

loc_89462:				; CODE XREF: sub_87DD0+168Bj
		xor	ax, ax

loc_89464:				; CODE XREF: sub_87DD0+1690j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8946D
		jmp	loc_89383
; ���������������������������������������������������������������������������

loc_8946D:				; CODE XREF: sub_87DD0+1670j
					; sub_87DD0+1698j
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_401], 0
		jz	short loc_894A2
		cmp	[bp+var_406], 0
		jz	short loc_894A2
		push	0
		mov	al, [bp+var_402]
		push	ax
		lea	ax, [bp+var_406]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_894A2:				; CODE XREF: sub_87DD0+16AFj
					; sub_87DD0+16B7j
		mov	[bp+var_406], 0
		mov	[bp+var_401], 0
		mov	[bp+var_400], 0
		cmp	byte ptr [bp+var_CC+1],	0
		jz	short loc_894E1
		cmp	[bp+var_D2+2], 0
		jz	short loc_894E1
		push	0
		mov	al, byte ptr [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D2+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_894E1:				; CODE XREF: sub_87DD0+16EEj
					; sub_87DD0+16F6j
		mov	[bp+var_D2+2], 0
		mov	byte ptr [bp+var_CC+1],	0
		mov	[bp+var_CC+2], 0
		push	0
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_C2+3],	0
		jz	short loc_8952F
		cmp	dword ptr [bp-0C4h], 0
		jz	short loc_8952F
		push	0
		mov	al, byte ptr [bp+var_C2+2]
		push	ax
		lea	ax, [bp-0C4h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8952F:				; CODE XREF: sub_87DD0+173Cj
					; sub_87DD0+1744j
		mov	dword ptr [bp-0C4h], 0
		mov	byte ptr [bp+var_C2+3],	0
		mov	dword ptr [bp-0BEh], 0
		cmp	[bp+var_B5], 0
		jz	short loc_8956E
		cmp	[bp+var_BA], 0
		jz	short loc_8956E
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8956E:				; CODE XREF: sub_87DD0+177Bj
					; sub_87DD0+1783j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	byte_495FC, 0
		jnz	short loc_8958F
		jmp	loc_89933
; ���������������������������������������������������������������������������

loc_8958F:				; CODE XREF: sub_87DD0+17BAj
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_895C6
		cmp	[bp+var_A6], 0
		jz	short loc_895C6
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_895C6:				; CODE XREF: sub_87DD0+17D3j
					; sub_87DD0+17DBj
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_91], 0
		jz	short loc_89614
		cmp	[bp+var_96], 0
		jz	short loc_89614
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89614:				; CODE XREF: sub_87DD0+1821j
					; sub_87DD0+1829j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_89662
		cmp	[bp+var_86], 0
		jz	short loc_89662
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89662:				; CODE XREF: sub_87DD0+186Fj
					; sub_87DD0+1877j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_896AA
		cmp	[bp+var_76], 0
		jz	short loc_896AA
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_896AA:				; CODE XREF: sub_87DD0+18BAj
					; sub_87DD0+18C1j
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_896F0
		cmp	[bp+var_66], 0
		jz	short loc_896F0
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_896F0:				; CODE XREF: sub_87DD0+1900j
					; sub_87DD0+1907j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_89736
		cmp	[bp+var_56], 0
		jz	short loc_89736
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89736:				; CODE XREF: sub_87DD0+1946j
					; sub_87DD0+194Dj
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_8976E
		cmp	[bp+var_4C], 0
		jz	short loc_8976E
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8976E:				; CODE XREF: sub_87DD0+197Ej
					; sub_87DD0+1985j
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_897A6
		cmp	[bp+var_42], 0
		jz	short loc_897A6
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_897A6:				; CODE XREF: sub_87DD0+19B6j
					; sub_87DD0+19BDj
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_897DE
		cmp	[bp+var_38], 0
		jz	short loc_897DE
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_897DE:				; CODE XREF: sub_87DD0+19EEj
					; sub_87DD0+19F5j
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_89816
		cmp	[bp+var_2E], 0
		jz	short loc_89816
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89816:				; CODE XREF: sub_87DD0+1A26j
					; sub_87DD0+1A2Dj
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3D1], 0
		jz	short loc_8985F
		cmp	[bp+var_3D6], 0
		jz	short loc_8985F
		push	0
		mov	al, [bp+var_3D2]
		push	ax
		lea	ax, [bp+var_3D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8985F:				; CODE XREF: sub_87DD0+1A6Cj
					; sub_87DD0+1A74j
		mov	[bp+var_3D6], 0
		mov	[bp+var_3D1], 0
		mov	[bp+var_3D0], 0
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_898A9
		cmp	[bp+var_1C], 0
		jz	short loc_898A9
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_898A9:				; CODE XREF: sub_87DD0+1AB9j
					; sub_87DD0+1AC0j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_89933:				; CODE XREF: sub_87DD0+17BCj
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, [bp+var_BA]
		push	ax
		push	9
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_166]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	di, ax
		push	[bp+var_8C]
		mov	al, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	di
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	dword ptr [bp-0C4h], 0
		mov	byte ptr [bp+var_C2+2],	2
		mov	byte ptr [bp+var_C2+3],	0
		mov	dword ptr [bp-0BEh], 0
		mov	dword ptr [bp+var_CE], 0
		mov	byte ptr [bp+var_CC+2],	2
		mov	byte ptr [bp+var_CC+3],	0
		mov	[bp+var_C8], 0
		mov	[bp+var_406], 0
		mov	[bp+var_402], 2
		mov	[bp+var_401], 0
		mov	[bp+var_400], 0
		mov	[bp+var_40A], 0
		mov	[bp+var_408], 0FFFFh
		mov	[bp+var_414], 0
		mov	[bp+var_410], 2
		mov	[bp+var_40F], 0
		mov	[bp+var_40E], 0
		mov	[bp+var_418], 0
		mov	[bp+var_416], 0FFFFh
		cmp	[bp+var_2], 0
		jz	short loc_89AE2
		push	3
		lea	ax, [bp+var_CE]
		push	ax
		push	34h ; '4'
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	3
		lea	ax, [bp-0C4h]
		push	ax
		push	2Eh ; '.'
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp-0C4h]
		push	ax
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_89AE2:				; CODE XREF: sub_87DD0+1C9Aj
		jmp	short loc_89AF1
; ���������������������������������������������������������������������������

loc_89AE4:				; CODE XREF: sub_87DD0+1D3Aj
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_89AF1:				; CODE XREF: sub_87DD0:loc_89AE2j
		cmp	[bp+var_3DF], 0Ah
		jnb	short loc_89AFF
		cmp	[bp+var_3DD], 0
		jz	short loc_89B04

loc_89AFF:				; CODE XREF: sub_87DD0+1D26j
		mov	ax, 1
		jmp	short loc_89B06
; ���������������������������������������������������������������������������

loc_89B04:				; CODE XREF: sub_87DD0+1D2Dj
		xor	ax, ax

loc_89B06:				; CODE XREF: sub_87DD0+1D32j
		mov	ah, 0
		or	ax, ax
		jz	short loc_89AE4
		xor	si, si
		mov	word ptr [bp+var_D2+2],	si
		inc	si
		mov	ax, word ptr [bp+var_D2+2]
		mov	[di+1Bh], ax
		jmp	loc_89DC1
; ���������������������������������������������������������������������������

loc_89B1D:				; CODE XREF: sub_87DD0+200Cj
		mov	ax, [bp+var_3DF]
		mov	word ptr [bp+var_D2], ax
		cmp	word ptr [bp+var_D2], 9
		jnz	short loc_89B38
		mov	word ptr [bp+var_D6+2],	si
		inc	si
		mov	ax, word ptr [bp+var_D6+2]
		mov	[di+1Bh], ax

loc_89B38:				; CODE XREF: sub_87DD0+1D5Aj
		cmp	word ptr [bp+var_D2], 0Ah
		jnz	short loc_89B89
		cmp	[bp+var_2], 0
		jz	short loc_89B89
		mov	ax, word_48EFE
		mov	word ptr [bp+var_D6], ax
		mov	word ptr [bp+var_D8], 0
		cmp	[bp+var_40A], 0
		jz	short loc_89B89
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_D8]
		push	word ptr [bp+var_D6]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_89B89:				; CODE XREF: sub_87DD0+1D6Dj
					; sub_87DD0+1D73j ...
		cmp	word ptr [bp+var_D2], 0Ah
		jnz	short loc_89B9C
		mov	word ptr [bp+var_DC+2],	si
		inc	si
		mov	ax, word ptr [bp+var_DC+2]
		mov	[di+1Bh], ax

loc_89B9C:				; CODE XREF: sub_87DD0+1DBEj
		cmp	word ptr [bp+var_D2], 0Ch
		jnz	short loc_89BAF
		mov	word ptr [bp+var_DC], si
		inc	si
		mov	ax, word ptr [bp+var_DC]
		mov	[di+1Bh], ax

loc_89BAF:				; CODE XREF: sub_87DD0+1DD1j
		cmp	word ptr [bp+var_D2], 0Eh
		jnz	short loc_89C00
		cmp	[bp+var_2], 0
		jz	short loc_89C00
		mov	ax, word_48EFE
		mov	[bp+var_DE], ax
		mov	[bp+var_E0], 0
		cmp	[bp+var_40A], 0
		jz	short loc_89C00
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_E0]
		push	[bp+var_DE]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_89C00:				; CODE XREF: sub_87DD0+1DE4j
					; sub_87DD0+1DEAj ...
		cmp	word ptr [bp+var_D2], 0Dh
		jnz	short loc_89C13
		mov	[bp+var_E2], si
		inc	si
		mov	ax, [bp+var_E2]
		mov	[di+1Bh], ax

loc_89C13:				; CODE XREF: sub_87DD0+1E35j
		cmp	word ptr [bp+var_D2], 0Eh
		jnz	short loc_89C26
		mov	[bp+var_E4], si
		inc	si
		mov	ax, [bp+var_E4]
		mov	[di+1Bh], ax

loc_89C26:				; CODE XREF: sub_87DD0+1E48j
		cmp	word ptr [bp+var_D2], 12h
		jnz	short loc_89C39
		mov	[bp+var_E6], si
		inc	si
		mov	ax, [bp+var_E6]
		mov	[di+1Bh], ax

loc_89C39:				; CODE XREF: sub_87DD0+1E5Bj
		cmp	word ptr [bp+var_D2], 13h
		jnz	short loc_89C4C
		mov	[bp+var_E8], si
		inc	si
		mov	ax, [bp+var_E8]
		mov	[di+1Bh], ax

loc_89C4C:				; CODE XREF: sub_87DD0+1E6Ej
		cmp	word ptr [bp+var_D2], 14h
		jnz	short loc_89C5F
		mov	[bp+var_EA], si
		inc	si
		mov	ax, [bp+var_EA]
		mov	[di+1Bh], ax

loc_89C5F:				; CODE XREF: sub_87DD0+1E81j
		cmp	word ptr [bp+var_D2], 15h
		jnz	short loc_89C72
		mov	[bp+var_EC], si
		inc	si
		mov	ax, [bp+var_EC]
		mov	[di+1Bh], ax

loc_89C72:				; CODE XREF: sub_87DD0+1E94j
		cmp	word ptr [bp+var_D2], 16h
		jnz	short loc_89C85
		mov	[bp+var_EE], si
		inc	si
		mov	ax, [bp+var_EE]
		mov	[di+1Bh], ax

loc_89C85:				; CODE XREF: sub_87DD0+1EA7j
		cmp	word ptr [bp+var_D2], 17h
		jnz	short loc_89C98
		mov	[bp+var_F0], si
		inc	si
		mov	ax, [bp+var_F0]
		mov	[di+1Bh], ax

loc_89C98:				; CODE XREF: sub_87DD0+1EBAj
		cmp	word ptr [bp+var_D2], 18h
		jnz	short loc_89CAB
		mov	[bp+var_F2], si
		inc	si
		mov	ax, [bp+var_F2]
		mov	[di+1Bh], ax

loc_89CAB:				; CODE XREF: sub_87DD0+1ECDj
		cmp	word ptr [bp+var_D2], 19h
		jnz	short loc_89CBE
		mov	[bp+var_F4], si
		inc	si
		mov	ax, [bp+var_F4]
		mov	[di+1Bh], ax

loc_89CBE:				; CODE XREF: sub_87DD0+1EE0j
		cmp	word ptr [bp+var_D2], 19h
		jnz	short loc_89D0F
		cmp	[bp+var_2], 0
		jz	short loc_89D0F
		mov	ax, word_48F0A
		mov	[bp+var_F6], ax
		mov	[bp+var_F8], 0
		cmp	[bp+var_418], 0
		jz	short loc_89D0F
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_F8]
		push	[bp+var_F6]
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_89D0F:				; CODE XREF: sub_87DD0+1EF3j
					; sub_87DD0+1EF9j ...
		cmp	word ptr [bp+var_D2], 1Ah
		jnz	short loc_89D22
		mov	[bp+var_FA], si
		dec	si
		mov	ax, [bp+var_FA]
		mov	[di+1Bh], ax

loc_89D22:				; CODE XREF: sub_87DD0+1F44j
		cmp	word ptr [bp+var_D2], 1Dh
		jnz	short loc_89D35
		mov	[bp+var_FC], si
		inc	si
		mov	ax, [bp+var_FC]
		mov	[di+1Bh], ax

loc_89D35:				; CODE XREF: sub_87DD0+1F57j
		cmp	word ptr [bp+var_D2], 20h ; ' '
		jnz	short loc_89D48
		mov	[bp+var_FE], si
		dec	si
		mov	ax, [bp+var_FE]
		mov	[di+1Bh], ax

loc_89D48:				; CODE XREF: sub_87DD0+1F6Aj
		cmp	word ptr [bp+var_D2], 23h ; '#'
		jnz	short loc_89D5B
		mov	[bp+var_100], si
		inc	si
		mov	ax, [bp+var_100]
		mov	[di+1Bh], ax

loc_89D5B:				; CODE XREF: sub_87DD0+1F7Dj
		cmp	word ptr [bp+var_D2], 26h ; '&'
		jnz	short loc_89D6E
		mov	[bp+var_102], si
		dec	si
		mov	ax, [bp+var_102]
		mov	[di+1Bh], ax

loc_89D6E:				; CODE XREF: sub_87DD0+1F90j
		cmp	word ptr [bp+var_D2], 29h ; ')'
		jnz	short loc_89D81
		mov	[bp+var_104], si
		inc	si
		mov	ax, [bp+var_104]
		mov	[di+1Bh], ax

loc_89D81:				; CODE XREF: sub_87DD0+1FA3j
		cmp	word ptr [bp+var_D2], 2Ch ; ','
		jnz	short loc_89D94
		mov	[bp+var_106], si
		dec	si
		mov	ax, [bp+var_106]
		mov	[di+1Bh], ax

loc_89D94:				; CODE XREF: sub_87DD0+1FB6j
		cmp	word ptr [bp+var_D2], 2Fh ; '/'
		jnz	short loc_89DA7
		mov	[bp+var_108], si
		inc	si
		mov	ax, [bp+var_108]
		mov	[di+1Bh], ax

loc_89DA7:				; CODE XREF: sub_87DD0+1FC9j
		jmp	short loc_89DB4
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_89DB4
		jmp	short loc_89DDF
; ���������������������������������������������������������������������������

loc_89DB4:				; CODE XREF: sub_87DD0:loc_89DA7j
					; sub_87DD0+1FE0j
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_89DC1:				; CODE XREF: sub_87DD0+1D4Aj
		cmp	[bp+var_3DF], 31h ; '1'
		jnb	short loc_89DCF
		cmp	[bp+var_3DD], 0
		jz	short loc_89DD4

loc_89DCF:				; CODE XREF: sub_87DD0+1FF6j
		mov	ax, 1
		jmp	short loc_89DD6
; ���������������������������������������������������������������������������

loc_89DD4:				; CODE XREF: sub_87DD0+1FFDj
		xor	ax, ax

loc_89DD6:				; CODE XREF: sub_87DD0+2002j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_89DDF
		jmp	loc_89B1D
; ���������������������������������������������������������������������������

loc_89DDF:				; CODE XREF: sub_87DD0+1FE2j
					; sub_87DD0+200Aj
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		lea	ax, [bp+var_418]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		lea	ax, [bp+var_418]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_40F], 0
		jz	short loc_89E2E
		cmp	[bp+var_414], 0
		jz	short loc_89E2E
		push	0
		mov	al, [bp+var_410]
		push	ax
		lea	ax, [bp+var_414]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89E2E:				; CODE XREF: sub_87DD0+203Bj
					; sub_87DD0+2043j
		mov	[bp+var_414], 0
		mov	[bp+var_40F], 0
		mov	[bp+var_40E], 0
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_401], 0
		jz	short loc_89E7A
		cmp	[bp+var_406], 0
		jz	short loc_89E7A
		push	0
		mov	al, [bp+var_402]
		push	ax
		lea	ax, [bp+var_406]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89E7A:				; CODE XREF: sub_87DD0+2087j
					; sub_87DD0+208Fj
		mov	[bp+var_406], 0
		mov	[bp+var_401], 0
		mov	[bp+var_400], 0
		cmp	byte ptr [bp+var_CC+3],	0
		jz	short loc_89EB9
		cmp	dword ptr [bp+var_CE], 0
		jz	short loc_89EB9
		push	0
		mov	al, byte ptr [bp+var_CC+2]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89EB9:				; CODE XREF: sub_87DD0+20C6j
					; sub_87DD0+20CEj
		mov	dword ptr [bp+var_CE], 0
		mov	byte ptr [bp+var_CC+3],	0
		mov	[bp+var_C8], 0
		cmp	byte ptr [bp+var_C2+3],	0
		jz	short loc_89EF8
		cmp	dword ptr [bp-0C4h], 0
		jz	short loc_89EF8
		push	0
		mov	al, byte ptr [bp+var_C2+2]
		push	ax
		lea	ax, [bp-0C4h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89EF8:				; CODE XREF: sub_87DD0+2105j
					; sub_87DD0+210Dj
		mov	dword ptr [bp-0C4h], 0
		mov	byte ptr [bp+var_C2+3],	0
		mov	dword ptr [bp-0BEh], 0
		push	0
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_B5], 0
		jz	short loc_89F46
		cmp	[bp+var_BA], 0
		jz	short loc_89F46
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89F46:				; CODE XREF: sub_87DD0+2153j
					; sub_87DD0+215Bj
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	byte_495FC, 0
		jnz	short loc_89F67
		jmp	loc_8A30B
; ���������������������������������������������������������������������������

loc_89F67:				; CODE XREF: sub_87DD0+2192j
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_89F9E
		cmp	[bp+var_A6], 0
		jz	short loc_89F9E
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89F9E:				; CODE XREF: sub_87DD0+21ABj
					; sub_87DD0+21B3j
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_91], 0
		jz	short loc_89FEC
		cmp	[bp+var_96], 0
		jz	short loc_89FEC
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_89FEC:				; CODE XREF: sub_87DD0+21F9j
					; sub_87DD0+2201j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_8A03A
		cmp	[bp+var_86], 0
		jz	short loc_8A03A
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A03A:				; CODE XREF: sub_87DD0+2247j
					; sub_87DD0+224Fj
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_8A082
		cmp	[bp+var_76], 0
		jz	short loc_8A082
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A082:				; CODE XREF: sub_87DD0+2292j
					; sub_87DD0+2299j
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_8A0C8
		cmp	[bp+var_66], 0
		jz	short loc_8A0C8
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A0C8:				; CODE XREF: sub_87DD0+22D8j
					; sub_87DD0+22DFj
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_8A10E
		cmp	[bp+var_56], 0
		jz	short loc_8A10E
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A10E:				; CODE XREF: sub_87DD0+231Ej
					; sub_87DD0+2325j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_8A146
		cmp	[bp+var_4C], 0
		jz	short loc_8A146
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A146:				; CODE XREF: sub_87DD0+2356j
					; sub_87DD0+235Dj
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_8A17E
		cmp	[bp+var_42], 0
		jz	short loc_8A17E
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A17E:				; CODE XREF: sub_87DD0+238Ej
					; sub_87DD0+2395j
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_8A1B6
		cmp	[bp+var_38], 0
		jz	short loc_8A1B6
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A1B6:				; CODE XREF: sub_87DD0+23C6j
					; sub_87DD0+23CDj
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_8A1EE
		cmp	[bp+var_2E], 0
		jz	short loc_8A1EE
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A1EE:				; CODE XREF: sub_87DD0+23FEj
					; sub_87DD0+2405j
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3D1], 0
		jz	short loc_8A237
		cmp	[bp+var_3D6], 0
		jz	short loc_8A237
		push	0
		mov	al, [bp+var_3D2]
		push	ax
		lea	ax, [bp+var_3D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A237:				; CODE XREF: sub_87DD0+2444j
					; sub_87DD0+244Cj
		mov	[bp+var_3D6], 0
		mov	[bp+var_3D1], 0
		mov	[bp+var_3D0], 0
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_8A281
		cmp	[bp+var_1C], 0
		jz	short loc_8A281
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A281:				; CODE XREF: sub_87DD0+2491j
					; sub_87DD0+2498j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_8A30B:				; CODE XREF: sub_87DD0+2194j
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, [bp+var_BA]
		push	ax
		push	5
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_166]
		push	ax
		push	0FFh
		push	8
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_42]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_BC], ax
		push	0
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	di, ax
		push	[bp+var_9C]
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_BC]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	dword ptr [bp-0C6h], 0
		mov	byte ptr [bp+var_C2], 2
		mov	byte ptr [bp+var_C2+1],	0
		mov	[bp+var_C2+2], 0
		mov	[bp+var_D2+2], 0
		mov	byte ptr [bp+var_CC], 2
		mov	byte ptr [bp+var_CC+1],	0
		mov	[bp+var_CC+2], 0
		mov	[bp+var_DC+2], 0
		mov	byte ptr [bp+var_D6], 2
		mov	byte ptr [bp+var_D6+1],	0
		mov	[bp+var_D6+2], 0
		mov	[bp+var_406], 0
		mov	[bp+var_402], 2
		mov	[bp+var_401], 0
		mov	[bp+var_400], 0
		mov	[bp+var_40A], 0
		mov	[bp+var_408], 0FFFFh
		mov	[bp+var_414], 0
		mov	[bp+var_410], 2
		mov	[bp+var_40F], 0
		mov	[bp+var_40E], 0
		mov	[bp+var_418], 0
		mov	[bp+var_416], 0FFFFh
		mov	[bp+var_425+3],	0
		mov	byte ptr [bp+var_421+3], 2
		mov	[bp+var_41D], 0
		mov	[bp+var_41C], 0
		mov	word ptr [bp-426h], 0
		mov	word ptr [bp+var_425+1], 0FFFFh
		cmp	[bp+var_2], 0
		jnz	short loc_8A4B0
		jmp	loc_8A532
; ���������������������������������������������������������������������������

loc_8A4B0:				; CODE XREF: sub_87DD0+26DBj
		push	3
		lea	ax, [bp+var_D2+2]
		push	ax
		push	34h ; '4'
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_D2+2]
		push	ax
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F0A
		add	ax, 0FF88h
		mov	word ptr [bp+var_DC], ax
		mov	[bp+var_DE], 0
		cmp	[bp+var_418], 0
		jz	short loc_8A532
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_DE]
		push	word ptr [bp+var_DC]
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8A532:				; CODE XREF: sub_87DD0+26DDj
					; sub_87DD0+2730j
		jmp	short loc_8A541
; ���������������������������������������������������������������������������

loc_8A534:				; CODE XREF: sub_87DD0+278Aj
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8A541:				; CODE XREF: sub_87DD0:loc_8A532j
		cmp	[bp+var_3DF], 0Ah
		jnb	short loc_8A54F
		cmp	[bp+var_3DD], 0
		jz	short loc_8A554

loc_8A54F:				; CODE XREF: sub_87DD0+2776j
		mov	ax, 1
		jmp	short loc_8A556
; ���������������������������������������������������������������������������

loc_8A554:				; CODE XREF: sub_87DD0+277Dj
		xor	ax, ax

loc_8A556:				; CODE XREF: sub_87DD0+2782j
		mov	ah, 0
		or	ax, ax
		jz	short loc_8A534
		mov	byte ptr [bp+var_E0+1],	0
		cmp	[bp+var_2], 0
		jnz	short loc_8A56A
		jmp	loc_8A5E9
; ���������������������������������������������������������������������������

loc_8A56A:				; CODE XREF: sub_87DD0+2795j
		push	3
		lea	ax, [bp+var_C8+2]
		push	ax
		push	31h ; '1'
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_C8+2]
		push	ax
		lea	ax, [bp+var_40A]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F04
		mov	[bp+var_E2], ax
		mov	[bp+var_E4], 0
		cmp	[bp+var_40A], 0
		jz	short loc_8A5E9
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_E4]
		push	[bp+var_E2]
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8A5E9:				; CODE XREF: sub_87DD0+2797j
					; sub_87DD0+27E7j
		mov	[bp+var_3DF], 0
		jmp	loc_8A762
; ���������������������������������������������������������������������������

loc_8A5F2:				; CODE XREF: sub_87DD0+29ADj
		mov	si, [bp+var_3DF]
		mov	[bp+var_E6], si
		mov	ax, [bp+var_E6]
		mov	[di+1Bh], ax
		cmp	si, 5
		jnz	short loc_8A636
		cmp	[bp+var_2], 0
		jz	short loc_8A636
		mov	ax, word_48F0A
		mov	[bp+var_E8], ax
		cmp	[bp+var_418], 0
		jz	short loc_8A636
		push	0FA0h
		push	[bp+var_E8]
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8A636:				; CODE XREF: sub_87DD0+2834j
					; sub_87DD0+283Aj ...
		mov	al, byte ptr [bp+var_E0+1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_8A643
		jmp	loc_8A713
; ���������������������������������������������������������������������������

loc_8A643:				; CODE XREF: sub_87DD0+286Ej
		cmp	[bp+var_2], 0
		jnz	short loc_8A64C
		jmp	loc_8A713
; ���������������������������������������������������������������������������

loc_8A64C:				; CODE XREF: sub_87DD0+2877j
		cmp	[bp+var_40A], 0
		jz	short loc_8A674
		push	[bp+var_408]
		mov	bx, [bp+var_40A]
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_8A670
		mov	ax, 1
		jmp	short loc_8A672
; ���������������������������������������������������������������������������

loc_8A670:				; CODE XREF: sub_87DD0+2899j
		xor	ax, ax

loc_8A672:				; CODE XREF: sub_87DD0+289Ej
		jmp	short loc_8A676
; ���������������������������������������������������������������������������

loc_8A674:				; CODE XREF: sub_87DD0+2881j
		mov	al, 0

loc_8A676:				; CODE XREF: sub_87DD0:loc_8A672j
		mov	ah, 0
		or	ax, ax
		jz	short loc_8A67F
		jmp	loc_8A713
; ���������������������������������������������������������������������������

loc_8A67F:				; CODE XREF: sub_87DD0+28AAj
		mov	byte ptr [bp+var_E0+1],	1
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	3
		lea	ax, [bp+var_DC+2]
		push	ax
		push	52h ; 'R'
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-426h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_DC+2]
		push	ax
		lea	ax, [bp-426h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F46
		add	ax, 0FFE2h
		mov	[bp+var_EA], ax
		mov	[bp+var_EC], 0
		cmp	word ptr [bp-426h], 0
		jz	short loc_8A713
		push	word ptr [bp+var_425+1]
		mov	bx, [bp-426h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_EC]
		push	[bp+var_EA]
		push	word ptr [bp+var_425+1]
		mov	bx, [bp-426h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8A713:				; CODE XREF: sub_87DD0+2870j
					; sub_87DD0+2879j ...
		cmp	si, 0Eh
		jnz	short loc_8A748
		cmp	[bp+var_2], 0
		jz	short loc_8A748
		mov	ax, word_48F46
		mov	[bp+var_EE], ax
		cmp	word ptr [bp-426h], 0
		jz	short loc_8A748
		push	7D0h
		push	[bp+var_EE]
		push	word ptr [bp+var_425+1]
		mov	bx, [bp-426h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8A748:				; CODE XREF: sub_87DD0+2946j
					; sub_87DD0+294Cj ...
		jmp	short loc_8A755
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8A755
		jmp	short loc_8A780
; ���������������������������������������������������������������������������

loc_8A755:				; CODE XREF: sub_87DD0:loc_8A748j
					; sub_87DD0+2981j
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8A762:				; CODE XREF: sub_87DD0+281Fj
		cmp	[bp+var_3DF], 29h ; ')'
		jnb	short loc_8A770
		cmp	[bp+var_3DD], 0
		jz	short loc_8A775

loc_8A770:				; CODE XREF: sub_87DD0+2997j
		mov	ax, 1
		jmp	short loc_8A777
; ���������������������������������������������������������������������������

loc_8A775:				; CODE XREF: sub_87DD0+299Ej
		xor	ax, ax

loc_8A777:				; CODE XREF: sub_87DD0+29A3j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A780
		jmp	loc_8A5F2
; ���������������������������������������������������������������������������

loc_8A780:				; CODE XREF: sub_87DD0+2983j
					; sub_87DD0+29ABj
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		lea	ax, [bp-426h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_41D], 0
		jz	short loc_8A7CC
		cmp	[bp+var_425+3],	0
		jz	short loc_8A7CC
		push	0
		mov	al, byte ptr [bp+var_421+3]
		push	ax
		lea	ax, [bp+var_425+3]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A7CC:				; CODE XREF: sub_87DD0+29D9j
					; sub_87DD0+29E1j
		mov	[bp+var_425+3],	0
		mov	[bp+var_41D], 0
		mov	[bp+var_41C], 0
		lea	ax, [bp+var_418]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_40F], 0
		jz	short loc_8A818
		cmp	[bp+var_414], 0
		jz	short loc_8A818
		push	0
		mov	al, [bp+var_410]
		push	ax
		lea	ax, [bp+var_414]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A818:				; CODE XREF: sub_87DD0+2A25j
					; sub_87DD0+2A2Dj
		mov	[bp+var_414], 0
		mov	[bp+var_40F], 0
		mov	[bp+var_40E], 0
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_401], 0
		jz	short loc_8A864
		cmp	[bp+var_406], 0
		jz	short loc_8A864
		push	0
		mov	al, [bp+var_402]
		push	ax
		lea	ax, [bp+var_406]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A864:				; CODE XREF: sub_87DD0+2A71j
					; sub_87DD0+2A79j
		mov	[bp+var_406], 0
		mov	[bp+var_401], 0
		mov	[bp+var_400], 0
		cmp	byte ptr [bp+var_D6+1],	0
		jz	short loc_8A8A3
		cmp	[bp+var_DC+2], 0
		jz	short loc_8A8A3
		push	0
		mov	al, byte ptr [bp+var_D6]
		push	ax
		lea	ax, [bp+var_DC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A8A3:				; CODE XREF: sub_87DD0+2AB0j
					; sub_87DD0+2AB8j
		mov	[bp+var_DC+2], 0
		mov	byte ptr [bp+var_D6+1],	0
		mov	[bp+var_D6+2], 0
		cmp	byte ptr [bp+var_CC+1],	0
		jz	short loc_8A8E2
		cmp	[bp+var_D2+2], 0
		jz	short loc_8A8E2
		push	0
		mov	al, byte ptr [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D2+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A8E2:				; CODE XREF: sub_87DD0+2AEFj
					; sub_87DD0+2AF7j
		mov	[bp+var_D2+2], 0
		mov	byte ptr [bp+var_CC+1],	0
		mov	[bp+var_CC+2], 0
		cmp	byte ptr [bp+var_C2+1],	0
		jz	short loc_8A921
		cmp	[bp+var_C8+2], 0
		jz	short loc_8A921
		push	0
		mov	al, byte ptr [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C8+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A921:				; CODE XREF: sub_87DD0+2B2Ej
					; sub_87DD0+2B36j
		mov	[bp+var_C8+2], 0
		mov	byte ptr [bp+var_C2+1],	0
		mov	[bp+var_C2+2], 0
		push	0
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_B5], 0
		jz	short loc_8A96F
		cmp	[bp+var_BA], 0
		jz	short loc_8A96F
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A96F:				; CODE XREF: sub_87DD0+2B7Cj
					; sub_87DD0+2B84j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	byte_495FC, 0
		jnz	short loc_8A990
		jmp	loc_8AD34
; ���������������������������������������������������������������������������

loc_8A990:				; CODE XREF: sub_87DD0+2BBBj
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_8A9C7
		cmp	[bp+var_A6], 0
		jz	short loc_8A9C7
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8A9C7:				; CODE XREF: sub_87DD0+2BD4j
					; sub_87DD0+2BDCj
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_91], 0
		jz	short loc_8AA15
		cmp	[bp+var_96], 0
		jz	short loc_8AA15
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8AA15:				; CODE XREF: sub_87DD0+2C22j
					; sub_87DD0+2C2Aj
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_8AA63
		cmp	[bp+var_86], 0
		jz	short loc_8AA63
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8AA63:				; CODE XREF: sub_87DD0+2C70j
					; sub_87DD0+2C78j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_8AAAB
		cmp	[bp+var_76], 0
		jz	short loc_8AAAB
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8AAAB:				; CODE XREF: sub_87DD0+2CBBj
					; sub_87DD0+2CC2j
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_8AAF1
		cmp	[bp+var_66], 0
		jz	short loc_8AAF1
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8AAF1:				; CODE XREF: sub_87DD0+2D01j
					; sub_87DD0+2D08j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_8AB37
		cmp	[bp+var_56], 0
		jz	short loc_8AB37
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8AB37:				; CODE XREF: sub_87DD0+2D47j
					; sub_87DD0+2D4Ej
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_8AB6F
		cmp	[bp+var_4C], 0
		jz	short loc_8AB6F
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8AB6F:				; CODE XREF: sub_87DD0+2D7Fj
					; sub_87DD0+2D86j
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_8ABA7
		cmp	[bp+var_42], 0
		jz	short loc_8ABA7
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8ABA7:				; CODE XREF: sub_87DD0+2DB7j
					; sub_87DD0+2DBEj
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_8ABDF
		cmp	[bp+var_38], 0
		jz	short loc_8ABDF
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8ABDF:				; CODE XREF: sub_87DD0+2DEFj
					; sub_87DD0+2DF6j
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_8AC17
		cmp	[bp+var_2E], 0
		jz	short loc_8AC17
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8AC17:				; CODE XREF: sub_87DD0+2E27j
					; sub_87DD0+2E2Ej
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3D1], 0
		jz	short loc_8AC60
		cmp	[bp+var_3D6], 0
		jz	short loc_8AC60
		push	0
		mov	al, [bp+var_3D2]
		push	ax
		lea	ax, [bp+var_3D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8AC60:				; CODE XREF: sub_87DD0+2E6Dj
					; sub_87DD0+2E75j
		mov	[bp+var_3D6], 0
		mov	[bp+var_3D1], 0
		mov	[bp+var_3D0], 0
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_8ACAA
		cmp	[bp+var_1C], 0
		jz	short loc_8ACAA
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8ACAA:				; CODE XREF: sub_87DD0+2EBAj
					; sub_87DD0+2EC1j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_8AD34:				; CODE XREF: sub_87DD0+2BBDj
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, [bp+var_BA]
		push	ax
		push	8
		lea	ax, [bp+var_1EC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_166]
		push	ax
		push	0FFh
		push	0Dh
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFD7h
		push	0
		lea	ax, [bp+var_2E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_BC], ax
		push	0
		push	0
		lea	ax, [bp+var_4C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-0BEh], ax
		push	0
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	di, ax
		push	[bp+var_AC]
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_5C]
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_BC]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-0BEh]
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		lea	ax, [bp+var_3FC]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_C8], 0
		mov	byte ptr [bp-0C4h], 2
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		mov	[bp+var_D2], 0
		mov	[bp+var_CE], 2
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		mov	[bp+var_DC], 0
		mov	[bp+var_D8], 2
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		mov	[bp+var_406], 0
		mov	[bp+var_402], 2
		mov	[bp+var_401], 0
		mov	[bp+var_400], 0
		mov	[bp+var_40A], 0
		mov	[bp+var_408], 0FFFFh
		mov	[bp+var_414], 0
		mov	[bp+var_410], 2
		mov	[bp+var_40F], 0
		mov	[bp+var_40E], 0
		mov	[bp+var_418], 0
		mov	[bp+var_416], 0FFFFh
		mov	[bp+var_425+3],	0
		mov	byte ptr [bp+var_421+3], 2
		mov	[bp+var_41D], 0
		mov	[bp+var_41C], 0
		mov	word ptr [bp-426h], 0
		mov	word ptr [bp+var_425+1], 0FFFFh
		cmp	[bp+var_2], 0
		jnz	short loc_8AF17
		jmp	loc_8B018
; ���������������������������������������������������������������������������

loc_8AF17:				; CODE XREF: sub_87DD0+3142j
		push	3
		lea	ax, [bp+var_D2]
		push	ax
		push	34h ; '4'
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_418]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F0A
		add	ax, 0FF9Ch
		mov	[bp+var_DE], ax
		mov	[bp+var_E0], 0
		cmp	[bp+var_418], 0
		jz	short loc_8AF99
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_E0]
		push	[bp+var_DE]
		push	[bp+var_416]
		mov	bx, [bp+var_418]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8AF99:				; CODE XREF: sub_87DD0+3197j
		push	3
		lea	ax, [bp+var_DC]
		push	ax
		push	52h ; 'R'
		lea	ax, [bp+var_3CC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-426h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_DC]
		push	ax
		lea	ax, [bp-426h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F46
		mov	[bp+var_E2], ax
		mov	[bp+var_E4], 0
		cmp	word ptr [bp-426h], 0
		jz	short loc_8B018
		push	word ptr [bp+var_425+1]
		mov	bx, [bp-426h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_E4]
		push	[bp+var_E2]
		push	word ptr [bp+var_425+1]
		mov	bx, [bp-426h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8B018:				; CODE XREF: sub_87DD0+3144j
					; sub_87DD0+3216j
		mov	[bp+var_E6], 0Dh
		jmp	short loc_8B069
; ���������������������������������������������������������������������������

loc_8B020:				; CODE XREF: sub_87DD0+32B2j
		mov	si, [bp+var_3DF]
		cmp	si, 28h	; '('
		jge	short loc_8B034
		mov	[bp+var_E8], si
		mov	ax, [bp+var_E8]
		mov	[di+1Bh], ax

loc_8B034:				; CODE XREF: sub_87DD0+3257j
		cmp	si, 23h	; '#'
		jle	short loc_8B04F
		dec	[bp+var_E6]
		mov	ax, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_8B04F:				; CODE XREF: sub_87DD0+3267j
		jmp	short loc_8B05C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8B05C
		jmp	short loc_8B084
; ���������������������������������������������������������������������������

loc_8B05C:				; CODE XREF: sub_87DD0:loc_8B04Fj
					; sub_87DD0+3288j
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8B069:				; CODE XREF: sub_87DD0+324Ej
		cmp	[bp+var_3DF], 2Eh ; '.'
		jnb	short loc_8B077
		cmp	[bp+var_3DD], 0
		jz	short loc_8B07C

loc_8B077:				; CODE XREF: sub_87DD0+329Ej
		mov	ax, 1
		jmp	short loc_8B07E
; ���������������������������������������������������������������������������

loc_8B07C:				; CODE XREF: sub_87DD0+32A5j
		xor	ax, ax

loc_8B07E:				; CODE XREF: sub_87DD0+32AAj
		mov	ah, 0
		or	ax, ax
		jz	short loc_8B020

loc_8B084:				; CODE XREF: sub_87DD0+328Aj
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		lea	ax, [bp-426h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_41D], 0
		jz	short loc_8B0D0
		cmp	[bp+var_425+3],	0
		jz	short loc_8B0D0
		push	0
		mov	al, byte ptr [bp+var_421+3]
		push	ax
		lea	ax, [bp+var_425+3]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B0D0:				; CODE XREF: sub_87DD0+32DDj
					; sub_87DD0+32E5j
		mov	[bp+var_425+3],	0
		mov	[bp+var_41D], 0
		mov	[bp+var_41C], 0
		lea	ax, [bp+var_418]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_40F], 0
		jz	short loc_8B11C
		cmp	[bp+var_414], 0
		jz	short loc_8B11C
		push	0
		mov	al, [bp+var_410]
		push	ax
		lea	ax, [bp+var_414]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B11C:				; CODE XREF: sub_87DD0+3329j
					; sub_87DD0+3331j
		mov	[bp+var_414], 0
		mov	[bp+var_40F], 0
		mov	[bp+var_40E], 0
		lea	ax, [bp+var_40A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_401], 0
		jz	short loc_8B168
		cmp	[bp+var_406], 0
		jz	short loc_8B168
		push	0
		mov	al, [bp+var_402]
		push	ax
		lea	ax, [bp+var_406]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B168:				; CODE XREF: sub_87DD0+3375j
					; sub_87DD0+337Dj
		mov	[bp+var_406], 0
		mov	[bp+var_401], 0
		mov	[bp+var_400], 0
		cmp	[bp+var_D7], 0
		jz	short loc_8B1A7
		cmp	[bp+var_DC], 0
		jz	short loc_8B1A7
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B1A7:				; CODE XREF: sub_87DD0+33B4j
					; sub_87DD0+33BCj
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_8B1E6
		cmp	[bp+var_D2], 0
		jz	short loc_8B1E6
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B1E6:				; CODE XREF: sub_87DD0+33F3j
					; sub_87DD0+33FBj
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_8B225
		cmp	dword ptr [bp-0C8h], 0
		jz	short loc_8B225
		push	0
		mov	al, [bp-0C4h]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B225:				; CODE XREF: sub_87DD0+3432j
					; sub_87DD0+343Aj
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	0
		lea	ax, [bp+var_3FC]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_B5], 0
		jz	short loc_8B273
		cmp	[bp+var_BA], 0
		jz	short loc_8B273
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B273:				; CODE XREF: sub_87DD0+3480j
					; sub_87DD0+3488j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_8B2C1
		cmp	[bp+var_A6], 0
		jz	short loc_8B2C1
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B2C1:				; CODE XREF: sub_87DD0+34CEj
					; sub_87DD0+34D6j
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_91], 0
		jz	short loc_8B30F
		cmp	[bp+var_96], 0
		jz	short loc_8B30F
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B30F:				; CODE XREF: sub_87DD0+351Cj
					; sub_87DD0+3524j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_8B35D
		cmp	[bp+var_86], 0
		jz	short loc_8B35D
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B35D:				; CODE XREF: sub_87DD0+356Aj
					; sub_87DD0+3572j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_8B3A5
		cmp	[bp+var_76], 0
		jz	short loc_8B3A5
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B3A5:				; CODE XREF: sub_87DD0+35B5j
					; sub_87DD0+35BCj
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_8B3EB
		cmp	[bp+var_66], 0
		jz	short loc_8B3EB
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B3EB:				; CODE XREF: sub_87DD0+35FBj
					; sub_87DD0+3602j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_8B431
		cmp	[bp+var_56], 0
		jz	short loc_8B431
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B431:				; CODE XREF: sub_87DD0+3641j
					; sub_87DD0+3648j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_8B469
		cmp	[bp+var_4C], 0
		jz	short loc_8B469
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B469:				; CODE XREF: sub_87DD0+3679j
					; sub_87DD0+3680j
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_8B4A1
		cmp	[bp+var_42], 0
		jz	short loc_8B4A1
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B4A1:				; CODE XREF: sub_87DD0+36B1j
					; sub_87DD0+36B8j
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_8B4D9
		cmp	[bp+var_38], 0
		jz	short loc_8B4D9
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B4D9:				; CODE XREF: sub_87DD0+36E9j
					; sub_87DD0+36F0j
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_8B511
		cmp	[bp+var_2E], 0
		jz	short loc_8B511
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B511:				; CODE XREF: sub_87DD0+3721j
					; sub_87DD0+3728j
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_3DA]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3D1], 0
		jz	short loc_8B55A
		cmp	[bp+var_3D6], 0
		jz	short loc_8B55A
		push	0
		mov	al, [bp+var_3D2]
		push	ax
		lea	ax, [bp+var_3D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B55A:				; CODE XREF: sub_87DD0+3767j
					; sub_87DD0+376Fj
		mov	[bp+var_3D6], 0
		mov	[bp+var_3D1], 0
		mov	[bp+var_3D0], 0
		push	2
		lea	ax, [bp+var_3CC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_8B5A4
		cmp	[bp+var_1C], 0
		jz	short loc_8B5A4
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8B5A4:				; CODE XREF: sub_87DD0+37B4j
					; sub_87DD0+37BBj
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_354]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2DC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_264]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_174]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_87DD0	endp

ovr202		ends
