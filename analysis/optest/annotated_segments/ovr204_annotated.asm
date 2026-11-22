ovr204		segment	para public 'OVERLAY' use16
		assume cs:ovr204
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_94A30	proc far		; CODE XREF: sub_42530J

var_C58		= word ptr -0C58h
var_C28		= word ptr -0C28h
var_BFB		= dword	ptr -0BFBh
var_BF7		= dword	ptr -0BF7h
var_BF3		= dword	ptr -0BF3h
var_BEC		= word ptr -0BECh
var_BE6		= word ptr -0BE6h
var_BE2		= dword	ptr -0BE2h
var_BDE		= word ptr -0BDEh
var_BDC		= dword	ptr -0BDCh
var_BD8		= byte ptr -0BD8h
var_BD7		= byte ptr -0BD7h
var_BD6		= dword	ptr -0BD6h
var_BD2		= word ptr -0BD2h
var_BBE		= word ptr -0BBEh
var_BBC		= word ptr -0BBCh
var_BBA		= dword	ptr -0BBAh
var_BB6		= byte ptr -0BB6h
var_BB5		= word ptr -0BB5h
var_BB3		= byte ptr -0BB3h
var_BB0		= word ptr -0BB0h
var_BAE		= word ptr -0BAEh
var_B97		= word ptr -0B97h
var_B95		= word ptr -0B95h
var_B93		= word ptr -0B93h
var_B91		= word ptr -0B91h
var_B8E		= word ptr -0B8Eh
var_B76		= word ptr -0B76h
var_B74		= word ptr -0B74h
var_B66		= dword	ptr -0B66h
var_B62		= byte ptr -0B62h
var_B61		= byte ptr -0B61h
var_B60		= dword	ptr -0B60h
var_359		= dword	ptr -359h
var_355		= dword	ptr -355h
var_350		= word ptr -350h
var_34E		= word ptr -34Eh
var_34C		= dword	ptr -34Ch
var_348		= byte ptr -348h
var_347		= byte ptr -347h
var_346		= dword	ptr -346h
var_342		= word ptr -342h
var_2CA		= word ptr -2CAh
var_252		= word ptr -252h
var_1DA		= word ptr -1DAh
var_162		= word ptr -162h
var_160		= word ptr -160h
var_15E		= word ptr -15Eh
var_15C		= word ptr -15Ch
var_15A		= word ptr -15Ah
var_158		= word ptr -158h
var_154		= word ptr -154h
var_152		= word ptr -152h
var_150		= word ptr -150h
var_14E		= word ptr -14Eh
var_14C		= word ptr -14Ch
var_14A		= word ptr -14Ah
var_146		= word ptr -146h
var_F6		= dword	ptr -0F6h
var_F2		= byte ptr -0F2h
var_F1		= byte ptr -0F1h
var_F0		= dword	ptr -0F0h
var_EC		= word ptr -0ECh
var_EA		= word ptr -0EAh
var_E8		= dword	ptr -0E8h
var_E4		= byte ptr -0E4h
var_E3		= byte ptr -0E3h
var_E2		= dword	ptr -0E2h
var_DE		= dword	ptr -0DEh
var_DA		= byte ptr -0DAh
var_D9		= byte ptr -0D9h
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= byte ptr -0D0h
var_CF		= byte ptr -0CFh
var_CE		= dword	ptr -0CEh
var_CA		= dword	ptr -0CAh
var_C6		= byte ptr -0C6h
var_C5		= byte ptr -0C5h
var_C2		= word ptr -0C2h
var_C0		= dword	ptr -0C0h
var_BC		= byte ptr -0BCh
var_BB		= dword	ptr -0BBh
var_B6		= word ptr -0B6h
var_B3		= byte ptr -0B3h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= word ptr -96h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= byte ptr -8Ch
var_8B		= byte ptr -8Bh
var_8A		= dword	ptr -8Ah
var_86		= word ptr -86h
var_84		= byte ptr -84h
var_83		= word ptr -83h
var_80		= dword	ptr -80h
var_7C		= byte ptr -7Ch
var_7B		= byte ptr -7Bh
var_7A		= dword	ptr -7Ah
var_76		= word ptr -76h
var_74		= byte ptr -74h
var_73		= word ptr -73h
var_70		= dword	ptr -70h
var_6C		= byte ptr -6Ch
var_6B		= byte ptr -6Bh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= byte ptr -62h
var_61		= byte ptr -61h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= byte ptr -4Eh
var_4D		= byte ptr -4Dh
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= byte ptr -3Ah
var_39		= byte ptr -39h
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= byte ptr -30h
var_2F		= byte ptr -2Fh
var_2E		= dword	ptr -2Eh
var_2A		= byte ptr -2Ah
var_28		= dword	ptr -28h
var_24		= byte ptr -24h
var_23		= byte ptr -23h
var_22		= dword	ptr -22h
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
		sub	sp, 0C58h
		push	si
		push	di
		mov	[bp+var_8], 0
		push	0C8h ; '�'
		push	0Bh
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	byte_495FC, 0
		mov	[bp+var_B], 0
		mov	[bp+var_C], 0
		mov	[bp+var_D], 0
		cmp	word_4684B, 0
		jz	short loc_94A6B
		mov	[bp+var_C], 1

loc_94A6B:				; CODE XREF: sub_94A30+35j
		mov	ax, word_46F46
		mov	[bp+var_10], ax
		mov	[bp+var_154], 0
		mov	[bp+var_152], 0
		push	[bp+var_10]
		lea	ax, [bp+var_154]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_162], 0
		mov	[bp+var_160], 0
		mov	[bp+var_15E], 0
		mov	[bp+var_15C], 0
		mov	[bp+var_15A], 13Fh
		mov	[bp+var_158], 9Dh ; '�'
		push	0
		lea	ax, [bp+var_162]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_162]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_150], 0
		mov	[bp+var_14E], 18h
		mov	[bp+var_14C], 13Fh
		mov	[bp+var_14A], 97h ; '�'
		mov	byte ptr [bp+var_1E], 0
		mov	byte ptr [bp+var_1E+1],	0
		mov	[bp+var_1C], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid16	; "mid16"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_146]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_146]
		push	ax
		lea	ax, [bp+var_1DA]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_26 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_146]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_146]
		push	ax
		lea	ax, [bp+var_252]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid16voc ; "mid16voc"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_146]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_2CA]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	[bp+var_C], 0
		jz	short loc_94BB6
		push	ds
		lea	ax, [bp+var_146]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_94BB6
		push	1
		lea	ax, [bp+var_146]
		push	ax
		lea	ax, [bp+var_2CA]
		push	ax
		mov	bx, [bp+var_2CA]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_94BBA
; ���������������������������������������������������������������������������

loc_94BB6:				; CODE XREF: sub_94A30+15Aj
					; sub_94A30+16Cj
		mov	[bp+var_C], 0

loc_94BBA:				; CODE XREF: sub_94A30+184j
		mov	[bp+var_28], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		mov	al, byte_46848
		mov	[bp+var_2A], al
		lea	ax, [bp+var_342]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_2A]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_94BFA
		cmp	ax, 2
		jnz	short loc_94BF7
		jmp	loc_94D66
; ���������������������������������������������������������������������������

loc_94BF7:				; CODE XREF: sub_94A30+1C2j
		jmp	loc_94ED1
; ���������������������������������������������������������������������������

loc_94BFA:				; CODE XREF: sub_94A30+1BDj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_146]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_146]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_94C28
		jmp	loc_94D25
; ���������������������������������������������������������������������������

loc_94C28:				; CODE XREF: sub_94A30+1F3j
		push	1
		lea	ax, [bp+var_146]
		push	ax
		lea	ax, [bp+var_342]
		push	ax
		mov	bx, [bp+var_342]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_27 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_146]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_C58]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_C58], 556h
		mov	[bp+var_BF7], 100h
		mov	[bp+var_BFB], 0
		mov	[bp+var_C58], 56Eh
		push	1
		lea	ax, [bp+var_146]
		push	ax
		lea	ax, [bp+var_C58]
		push	ax
		mov	bx, [bp+var_C58]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_94CED
; ���������������������������������������������������������������������������

loc_94CD7:				; CODE XREF: sub_94A30+2C0j
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_94CED:				; CODE XREF: sub_94A30+2A5j
		cmp	si, 6Ah	; 'j'
		jle	short loc_94CD7
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_C58], 56Eh
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_C58]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_94D25:				; CODE XREF: sub_94A30+1F5j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_146]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_146]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_94D63
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_94D63
		mov	word_48F76, 5Ah	; 'Z'

loc_94D63:				; CODE XREF: sub_94A30+31Ej
					; sub_94A30+32Bj
		jmp	loc_94ED1
; ���������������������������������������������������������������������������

loc_94D66:				; CODE XREF: sub_94A30+1C4j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_146]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_146]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_94D94
		jmp	loc_94E91
; ���������������������������������������������������������������������������

loc_94D94:				; CODE XREF: sub_94A30+35Fj
		push	1
		lea	ax, [bp+var_146]
		push	ax
		lea	ax, [bp+var_342]
		push	ax
		mov	bx, [bp+var_342]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_28 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_146]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_C58]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_C58], 556h
		mov	[bp+var_BF7], 100h
		mov	[bp+var_BFB], 0
		mov	[bp+var_C58], 56Eh
		push	1
		lea	ax, [bp+var_146]
		push	ax
		lea	ax, [bp+var_C58]
		push	ax
		mov	bx, [bp+var_C58]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_94E59
; ���������������������������������������������������������������������������

loc_94E43:				; CODE XREF: sub_94A30+42Cj
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_94E59:				; CODE XREF: sub_94A30+411j
		cmp	si, 6Ah	; 'j'
		jle	short loc_94E43
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_C58], 56Eh
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_C58]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_94E91:				; CODE XREF: sub_94A30+361j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_146]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_146]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_94ECF
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_94ECF
		mov	word_48F76, 0FFh

loc_94ECF:				; CODE XREF: sub_94A30+48Aj
					; sub_94A30+497j
		jmp	short $+2

loc_94ED1:				; CODE XREF: sub_94A30:loc_94BF7j
					; sub_94A30:loc_94D63j
		cmp	[bp+var_D], 0
		jnz	short loc_94EDA
		jmp	loc_94FF1
; ���������������������������������������������������������������������������

loc_94EDA:				; CODE XREF: sub_94A30+4A5j
		mov	[bp+var_BBA], 0
		mov	[bp+var_BB6], 2
		mov	byte ptr [bp+var_BB5], 0
		mov	dword ptr [bp+var_BB5+1], 0
		mov	[bp+var_BBE], 0
		mov	[bp+var_BBC], 0FFFFh
		push	word_46849
		lea	ax, [bp+var_BBE]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		mov	[bp+var_AE], 0
		mov	byte ptr [bp+var_AA], 2
		mov	byte ptr [bp+var_AA+1],	0
		mov	[bp+var_AA+2], 0
		push	3
		lea	ax, [bp+var_AE]
		push	ax
		push	1Dh
		lea	ax, [bp+var_342]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_BBE]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_BBE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_AA+1],	0
		jz	short loc_94F8E
		cmp	[bp+var_AE], 0
		jz	short loc_94F8E
		push	0
		mov	al, byte ptr [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_94F8E:				; CODE XREF: sub_94A30+53Bj
					; sub_94A30+543j
		mov	[bp+var_AE], 0
		mov	byte ptr [bp+var_AA+1],	0
		mov	[bp+var_AA+2], 0
		lea	ax, [bp+var_BBE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_BB5], 0
		jz	short loc_94FDA
		cmp	[bp+var_BBA], 0
		jz	short loc_94FDA
		push	0
		mov	al, [bp+var_BB6]
		push	ax
		lea	ax, [bp+var_BBA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_94FDA:				; CODE XREF: sub_94A30+587j
					; sub_94A30+58Fj
		mov	[bp+var_BBA], 0
		mov	byte ptr [bp+var_BB5], 0
		mov	dword ptr [bp+var_BB5+1], 0

loc_94FF1:				; CODE XREF: sub_94A30+4A7j
		mov	[bp+var_34C], 0
		mov	[bp+var_348], 2
		mov	[bp+var_347], 0
		mov	[bp+var_346], 0
		mov	[bp+var_350], 0
		mov	[bp+var_34E], 0FFFFh
		cmp	[bp+var_B], 0
		jnz	short loc_95022
		jmp	loc_950D9
; ���������������������������������������������������������������������������

loc_95022:				; CODE XREF: sub_94A30+5EDj
		push	1
		lea	ax, [bp+var_146]
		push	ax
		lea	ax, [bp+var_C28]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	[bp+var_C], 0
		jz	short loc_95043
		mov	byte ptr [bp-0A5h], 0Ch
		jmp	short loc_95048
; ���������������������������������������������������������������������������

loc_95043:				; CODE XREF: sub_94A30+60Aj
		mov	byte ptr [bp-0A5h], 0Bh

loc_95048:				; CODE XREF: sub_94A30+611j
		push	3
		lea	ax, [bp+var_28]
		push	ax
		mov	al, [bp-0A5h]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_C28]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_350]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_350]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F76
		mov	word ptr [bp+var_AA+2],	ax
		mov	word ptr [bp+var_AA], 0
		cmp	[bp+var_350], 0
		jz	short loc_950CA
		push	[bp+var_34E]
		mov	bx, [bp+var_350]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_AA]
		push	word ptr [bp+var_AA+2]
		push	[bp+var_34E]
		mov	bx, [bp+var_350]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_950CA:				; CODE XREF: sub_94A30+668j
		push	2
		lea	ax, [bp+var_C28]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_950D9:				; CODE XREF: sub_94A30+5EFj
		mov	[bp+var_B76], 185Fh
		mov	[bp+var_B66], 0
		mov	[bp+var_B62], 2
		mov	[bp+var_B61], 0
		mov	[bp+var_B60], 0
		mov	[bp+var_B74], 0
		mov	[bp+var_B76], 186Fh
		xor	eax, eax
		mov	[bp+var_359], eax
		mov	[bp+var_355], eax
		cmp	[bp+var_C], 0
		jz	short loc_9512E
		push	word_4684B
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		jmp	loc_9522D
; ���������������������������������������������������������������������������

loc_9512E:				; CODE XREF: sub_94A30+6E8j
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_29 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_146]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_C58]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_C58], 556h
		mov	[bp+var_BF7], 100h
		mov	[bp+var_BFB], 0
		mov	[bp+var_C58], 56Eh
		push	1
		lea	ax, [bp+var_146]
		push	ax
		lea	ax, [bp+var_C58]
		push	ax
		mov	bx, [bp+var_C58]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3631474Dh
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		xor	si, si
		jmp	short loc_951F9
; ���������������������������������������������������������������������������

loc_951B6:				; CODE XREF: sub_94A30+7CCj
		push	1
		push	large 54584554h
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	di, [bp+var_BE6]
		movsx	eax, di
		push	eax
		push	ds
		mov	ax, [bp+var_A]
		imul	si
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_BE2]
		mov	[bp+var_BF3], eax
		inc	si

loc_951F9:				; CODE XREF: sub_94A30+784j
		cmp	si, 0Bh
		jl	short loc_951B6
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_C58], 56Eh
		lea	ax, [bp+var_C58]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_C58]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_9522D:				; CODE XREF: sub_94A30+6FBj
		mov	[bp+var_34], 0
		mov	[bp+var_30], 2
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		push	3
		lea	ax, [bp+var_34]
		push	ax
		push	5
		lea	ax, [bp+var_1DA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_3E], 0
		mov	[bp+var_3A], 2
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		push	3
		lea	ax, [bp+var_3E]
		push	ax
		push	4
		lea	ax, [bp+var_1DA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_48], 0
		mov	[bp+var_44], 2
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	3
		lea	ax, [bp+var_48]
		push	ax
		push	3
		lea	ax, [bp+var_1DA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_52], 0
		mov	[bp+var_4E], 2
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		push	3
		lea	ax, [bp+var_52]
		push	ax
		push	1
		lea	ax, [bp+var_1DA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_5C], 0
		mov	[bp+var_58], 2
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	3
		lea	ax, [bp+var_5C]
		push	ax
		push	0
		lea	ax, [bp+var_1DA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_66], 0
		mov	[bp+var_62], 2
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	3
		lea	ax, [bp+var_66]
		push	ax
		push	2
		lea	ax, [bp+var_1DA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_70], 0
		mov	[bp+var_6C], 2
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		push	6
		lea	ax, [bp+var_1DA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_73], 0
		lea	ax, [bp+var_70]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_80], 0
		mov	[bp+var_7C], 2
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_80]
		push	ax
		push	7
		lea	ax, [bp+var_1DA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_83], 0
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_90], 0
		mov	[bp+var_8C], 2
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	ds
		push	offset unk_4556C
		push	ds
		push	offset aConvfont_shp_4 ; "convfont.shp"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_146]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_146]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_94+2],	dx
		mov	word ptr [bp+var_94], ax
		mov	eax, [bp+var_94]
		mov	[bp+var_90], eax
		mov	[bp+var_8C], 2
		mov	[bp+var_8B], 1
		mov	[bp+var_8A], 0
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_B8E]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_9C], 0
		mov	[bp+var_9A], 98h ; '�'
		mov	[bp+var_98], 13Fh
		mov	[bp+var_96], 0C7h ; '�'
		mov	ax, word_46F46
		mov	[bp+var_9E], ax
		lea	ax, [bp+var_B8E]
		push	ax
		push	[bp+var_9E]
		lea	ax, [bp+var_BB0]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_BB0], 1218h
		mov	ax, [bp+var_9A]
		mov	[bp+var_A0], ax
		mov	ax, [bp+var_98]
		mov	[bp+var_A2], ax
		mov	ax, [bp+var_96]
		mov	[bp+var_A4], ax
		mov	ax, [bp+var_9C]
		mov	[bp+var_B97], ax
		mov	ax, [bp+var_A0]
		mov	[bp+var_B95], ax
		mov	ax, [bp+var_A2]
		mov	[bp+var_B93], ax
		mov	ax, [bp+var_A4]
		mov	[bp+var_B91], ax
		push	0
		lea	ax, [bp+var_BB0]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C8h ; '�'
		lea	ax, [bp+var_BB0]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_954D8
		jmp	loc_9586A
; ���������������������������������������������������������������������������

loc_954D8:				; CODE XREF: sub_94A30+AA3j
		lea	ax, [bp+var_BAE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B8E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_9551C
		cmp	[bp+var_90], 0
		jz	short loc_9551C
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9551C:				; CODE XREF: sub_94A30+AC9j
					; sub_94A30+AD1j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_95566
		cmp	[bp+var_80], 0
		jz	short loc_95566
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95566:				; CODE XREF: sub_94A30+B16j
					; sub_94A30+B1Dj
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_955AC
		cmp	[bp+var_70], 0
		jz	short loc_955AC
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_955AC:				; CODE XREF: sub_94A30+B5Cj
					; sub_94A30+B63j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_955E4
		cmp	[bp+var_66], 0
		jz	short loc_955E4
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_955E4:				; CODE XREF: sub_94A30+B94j
					; sub_94A30+B9Bj
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_9561C
		cmp	[bp+var_5C], 0
		jz	short loc_9561C
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9561C:				; CODE XREF: sub_94A30+BCCj
					; sub_94A30+BD3j
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_95654
		cmp	[bp+var_52], 0
		jz	short loc_95654
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95654:				; CODE XREF: sub_94A30+C04j
					; sub_94A30+C0Bj
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_9568C
		cmp	[bp+var_48], 0
		jz	short loc_9568C
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9568C:				; CODE XREF: sub_94A30+C3Cj
					; sub_94A30+C43j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_956C4
		cmp	[bp+var_3E], 0
		jz	short loc_956C4
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_956C4:				; CODE XREF: sub_94A30+C74j
					; sub_94A30+C7Bj
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_956FC
		cmp	[bp+var_34], 0
		jz	short loc_956FC
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_956FC:				; CODE XREF: sub_94A30+CACj
					; sub_94A30+CB3j
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_B76], 185Fh
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B61], 0
		jz	short loc_9574B
		cmp	[bp+var_B66], 0
		jz	short loc_9574B
		push	0
		mov	al, [bp+var_B62]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9574B:				; CODE XREF: sub_94A30+CF8j
					; sub_94A30+D00j
		mov	[bp+var_B66], 0
		mov	[bp+var_B61], 0
		mov	[bp+var_B60], 0
		lea	ax, [bp+var_350]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_347], 0
		jz	short loc_95797
		cmp	[bp+var_34C], 0
		jz	short loc_95797
		push	0
		mov	al, [bp+var_348]
		push	ax
		lea	ax, [bp+var_34C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95797:				; CODE XREF: sub_94A30+D44j
					; sub_94A30+D4Cj
		mov	[bp+var_34C], 0
		mov	[bp+var_347], 0
		mov	[bp+var_346], 0
		push	2
		lea	ax, [bp+var_342]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_957E1
		cmp	[bp+var_28], 0
		jz	short loc_957E1
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_957E1:				; CODE XREF: sub_94A30+D91j
					; sub_94A30+D98j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_2CA]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_252]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1DA]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_162]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_154]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_9586A:				; CODE XREF: sub_94A30+AA5j
		mov	[bp+var_AE], 0
		mov	byte ptr [bp+var_AA], 2
		mov	byte ptr [bp+var_AA+1],	0
		mov	[bp+var_AA+2], 0
		push	3
		lea	ax, [bp+var_AE]
		push	ax
		push	1
		lea	ax, [bp+var_252]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_BB+3], 0
		mov	byte ptr [bp-0B4h], 2
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		push	2
		lea	ax, [bp+var_BB+3]
		push	ax
		push	2
		lea	ax, [bp+var_252]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_BB], 0
		lea	ax, [bp+var_BB+3]
		push	ax
		lea	ax, [bp+var_C0+2]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_154]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_C0], ax
		push	1
		push	0
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_C2], ax
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_C0+2]
		mov	al, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_C0+2]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_C0]
		lea	ax, [bp+var_BD2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_C2]
		lea	ax, [bp+var_BD2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_C0+2]
		mov	al, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_C0+2]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeFromColor_2D165
		add	sp, 0Ah
		mov	[bp+var_6], 19h
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	short loc_95A40
; ���������������������������������������������������������������������������

loc_95A26:				; CODE XREF: sub_94A30+102Bj
		jmp	short loc_95A33
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_95A33
		jmp	short loc_95A5D
; ���������������������������������������������������������������������������

loc_95A33:				; CODE XREF: sub_94A30:loc_95A26j
					; sub_94A30+FFFj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_95A40:				; CODE XREF: sub_94A30+FF4j
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_95A50
		cmp	[bp+var_BB3], 0
		jz	short loc_95A55

loc_95A50:				; CODE XREF: sub_94A30+1017j
		mov	ax, 1
		jmp	short loc_95A57
; ���������������������������������������������������������������������������

loc_95A55:				; CODE XREF: sub_94A30+101Ej
		xor	ax, ax

loc_95A57:				; CODE XREF: sub_94A30+1023j
		mov	ah, 0
		or	ax, ax
		jz	short loc_95A26

loc_95A5D:				; CODE XREF: sub_94A30+1001j
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	0
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_C0+2]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_95ABA
		cmp	[bp+var_BB+3], 0
		jz	short loc_95ABA
		push	0
		mov	al, [bp-0B4h]
		push	ax
		lea	ax, [bp+var_BB+3]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95ABA:				; CODE XREF: sub_94A30+1067j
					; sub_94A30+106Fj
		mov	[bp+var_BB+3], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	byte ptr [bp+var_AA+1],	0
		jz	short loc_95AF9
		cmp	[bp+var_AE], 0
		jz	short loc_95AF9
		push	0
		mov	al, byte ptr [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95AF9:				; CODE XREF: sub_94A30+10A6j
					; sub_94A30+10AEj
		mov	[bp+var_AE], 0
		mov	byte ptr [bp+var_AA+1],	0
		mov	[bp+var_AA+2], 0
		cmp	byte_495FC, 0
		jnz	short loc_95B1A
		jmp	loc_95EAC
; ���������������������������������������������������������������������������

loc_95B1A:				; CODE XREF: sub_94A30+10E5j
		lea	ax, [bp+var_BAE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B8E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_95B5E
		cmp	[bp+var_90], 0
		jz	short loc_95B5E
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95B5E:				; CODE XREF: sub_94A30+110Bj
					; sub_94A30+1113j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_95BA8
		cmp	[bp+var_80], 0
		jz	short loc_95BA8
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95BA8:				; CODE XREF: sub_94A30+1158j
					; sub_94A30+115Fj
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_95BEE
		cmp	[bp+var_70], 0
		jz	short loc_95BEE
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95BEE:				; CODE XREF: sub_94A30+119Ej
					; sub_94A30+11A5j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_95C26
		cmp	[bp+var_66], 0
		jz	short loc_95C26
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95C26:				; CODE XREF: sub_94A30+11D6j
					; sub_94A30+11DDj
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_95C5E
		cmp	[bp+var_5C], 0
		jz	short loc_95C5E
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95C5E:				; CODE XREF: sub_94A30+120Ej
					; sub_94A30+1215j
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_95C96
		cmp	[bp+var_52], 0
		jz	short loc_95C96
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95C96:				; CODE XREF: sub_94A30+1246j
					; sub_94A30+124Dj
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_95CCE
		cmp	[bp+var_48], 0
		jz	short loc_95CCE
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95CCE:				; CODE XREF: sub_94A30+127Ej
					; sub_94A30+1285j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_95D06
		cmp	[bp+var_3E], 0
		jz	short loc_95D06
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95D06:				; CODE XREF: sub_94A30+12B6j
					; sub_94A30+12BDj
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_95D3E
		cmp	[bp+var_34], 0
		jz	short loc_95D3E
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95D3E:				; CODE XREF: sub_94A30+12EEj
					; sub_94A30+12F5j
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_B76], 185Fh
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B61], 0
		jz	short loc_95D8D
		cmp	[bp+var_B66], 0
		jz	short loc_95D8D
		push	0
		mov	al, [bp+var_B62]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95D8D:				; CODE XREF: sub_94A30+133Aj
					; sub_94A30+1342j
		mov	[bp+var_B66], 0
		mov	[bp+var_B61], 0
		mov	[bp+var_B60], 0
		lea	ax, [bp+var_350]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_347], 0
		jz	short loc_95DD9
		cmp	[bp+var_34C], 0
		jz	short loc_95DD9
		push	0
		mov	al, [bp+var_348]
		push	ax
		lea	ax, [bp+var_34C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95DD9:				; CODE XREF: sub_94A30+1386j
					; sub_94A30+138Ej
		mov	[bp+var_34C], 0
		mov	[bp+var_347], 0
		mov	[bp+var_346], 0
		push	2
		lea	ax, [bp+var_342]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_95E23
		cmp	[bp+var_28], 0
		jz	short loc_95E23
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_95E23:				; CODE XREF: sub_94A30+13D3j
					; sub_94A30+13DAj
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_2CA]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_252]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1DA]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_162]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_154]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_95EAC:				; CODE XREF: sub_94A30+10E7j
		lea	ax, [bp+var_154]
		push	ax
		push	0FFh
		push	7
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	2
		push	0FFFFh
		push	0
		lea	ax, [bp+var_34]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	si, ax
		push	1
		push	0FFFFh
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-0A6h], ax
		push	0
		push	0FFFFh
		push	0
		lea	ax, [bp+var_48]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_AA+2],	ax
		push	0
		push	0
		lea	ax, [bp+var_52]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_AA], ax
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_AA]
		lea	ax, [bp+var_BD2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	si
		lea	ax, [bp+var_BD2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_AA+2]
		lea	ax, [bp+var_BD2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-0A6h]
		lea	ax, [bp+var_BD2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [bp+var_AE+2],	1
		cmp	[bp+var_C], 0
		jnz	short loc_95FAC
		jmp	loc_9673A
; ���������������������������������������������������������������������������

loc_95FAC:				; CODE XREF: sub_94A30+1577j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp+var_B6], 0
		mov	byte ptr [bp+var_B2], 2
		mov	byte ptr [bp+var_B2+1],	0
		mov	[bp+var_B2+2], 0
		push	2
		lea	ax, [bp+var_B6]
		push	ax
		push	0
		lea	ax, [bp+var_2CA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_9600F
; ���������������������������������������������������������������������������

loc_96001:				; CODE XREF: sub_94A30+15E2j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_9600F:				; CODE XREF: sub_94A30+15CFj
		cmp	di, 4
		jl	short loc_96001
		push	0FFFFh
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_83FE
		add	sp, 4
		xor	di, di
		jmp	short loc_96076
; ���������������������������������������������������������������������������

loc_96027:				; CODE XREF: sub_94A30+1655j
		cmp	di, 4
		jnz	short loc_96031
		mov	word ptr [si+1Bh], 1

loc_96031:				; CODE XREF: sub_94A30+15FAj
		cmp	di, 0Ah
		jnz	short loc_9603B
		mov	word ptr [si+1Bh], 2

loc_9603B:				; CODE XREF: sub_94A30+1604j
		cmp	di, 0Bh
		jnz	short loc_96045
		mov	word ptr [si+1Bh], 1

loc_96045:				; CODE XREF: sub_94A30+160Ej
		cmp	di, 0Ch
		jnz	short loc_9604F
		mov	word ptr [si+1Bh], 2

loc_9604F:				; CODE XREF: sub_94A30+1618j
		mov	ax, di
		inc	di
		cmp	ax, 10h
		jnz	short loc_9605C
		mov	word ptr [si+1Bh], 1

loc_9605C:				; CODE XREF: sub_94A30+1625j
		jmp	short loc_96069
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_96069
		jmp	short loc_96087
; ���������������������������������������������������������������������������

loc_96069:				; CODE XREF: sub_94A30:loc_9605Cj
					; sub_94A30+1635j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_96076:				; CODE XREF: sub_94A30+15F5j
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_96027

loc_96087:				; CODE XREF: sub_94A30+1637j
		mov	[bp+var_C0], 0
		mov	[bp+var_BC], 2
		mov	byte ptr [bp+var_BB], 0
		mov	[bp+var_BB+1], 0
		push	2
		lea	ax, [bp+var_C0]
		push	ax
		push	1
		lea	ax, [bp+var_2CA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_960DD
; ���������������������������������������������������������������������������

loc_960CF:				; CODE XREF: sub_94A30+16B0j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_960DD:				; CODE XREF: sub_94A30+169Dj
		cmp	di, 4
		jl	short loc_960CF
		push	0FFFFh
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_83FE
		add	sp, 4
		xor	di, di
		jmp	short loc_9613A
; ���������������������������������������������������������������������������

loc_960F5:				; CODE XREF: sub_94A30+1719j
		cmp	di, 4
		jnz	short loc_960FF
		mov	word ptr [si+1Bh], 2

loc_960FF:				; CODE XREF: sub_94A30+16C8j
		cmp	di, 10h
		jnz	short loc_96109
		mov	word ptr [si+1Bh], 1

loc_96109:				; CODE XREF: sub_94A30+16D2j
		cmp	di, 12h
		jnz	short loc_96113
		mov	word ptr [si+1Bh], 2

loc_96113:				; CODE XREF: sub_94A30+16DCj
		mov	ax, di
		inc	di
		cmp	ax, 16h
		jnz	short loc_96120
		mov	word ptr [si+1Bh], 1

loc_96120:				; CODE XREF: sub_94A30+16E9j
		jmp	short loc_9612D
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9612D
		jmp	short loc_9614B
; ���������������������������������������������������������������������������

loc_9612D:				; CODE XREF: sub_94A30:loc_96120j
					; sub_94A30+16F9j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9613A:				; CODE XREF: sub_94A30+16C3j
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_960F5

loc_9614B:				; CODE XREF: sub_94A30+16FBj
		mov	[bp+var_CA], 0
		mov	[bp+var_C6], 2
		mov	[bp+var_C5], 0
		mov	dword ptr [bp-0C4h], 0
		push	2
		lea	ax, [bp+var_CA]
		push	ax
		push	2
		lea	ax, [bp+var_2CA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_961A1
; ���������������������������������������������������������������������������

loc_96193:				; CODE XREF: sub_94A30+1774j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_961A1:				; CODE XREF: sub_94A30+1761j
		cmp	di, 4
		jl	short loc_96193
		push	0FFFFh
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_83FE
		add	sp, 4
		xor	di, di
		jmp	short loc_961EE
; ���������������������������������������������������������������������������

loc_961B9:				; CODE XREF: sub_94A30+17CDj
		cmp	di, 8
		jnz	short loc_961C3
		mov	word ptr [si+1Bh], 2

loc_961C3:				; CODE XREF: sub_94A30+178Cj
		mov	ax, di
		inc	di
		cmp	ax, 10h
		jnz	short loc_961D4
		mov	bx, [bp-0A6h]
		mov	word ptr [bx+1Bh], 2

loc_961D4:				; CODE XREF: sub_94A30+1799j
		jmp	short loc_961E1
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_961E1
		jmp	short loc_961FF
; ���������������������������������������������������������������������������

loc_961E1:				; CODE XREF: sub_94A30:loc_961D4j
					; sub_94A30+17ADj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_961EE:				; CODE XREF: sub_94A30+1787j
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_961B9

loc_961FF:				; CODE XREF: sub_94A30+17AFj
		mov	[bp+var_D4], 0
		mov	[bp+var_D0], 2
		mov	[bp+var_CF], 0
		mov	[bp+var_CE], 0
		push	2
		lea	ax, [bp+var_D4]
		push	ax
		push	3
		lea	ax, [bp+var_2CA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_96255
; ���������������������������������������������������������������������������

loc_96247:				; CODE XREF: sub_94A30+1828j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_96255:				; CODE XREF: sub_94A30+1815j
		cmp	di, 4
		jl	short loc_96247
		push	0FFFFh
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_83FE
		add	sp, 4
		xor	di, di
		jmp	short loc_962B2
; ���������������������������������������������������������������������������

loc_9626D:				; CODE XREF: sub_94A30+1891j
		cmp	di, 4
		jnz	short loc_96277
		mov	word ptr [si+1Bh], 1

loc_96277:				; CODE XREF: sub_94A30+1840j
		cmp	di, 17h
		jnz	short loc_96281
		mov	word ptr [si+1Bh], 2

loc_96281:				; CODE XREF: sub_94A30+184Aj
		cmp	di, 18h
		jnz	short loc_9628B
		mov	word ptr [si+1Bh], 1

loc_9628B:				; CODE XREF: sub_94A30+1854j
		mov	ax, di
		inc	di
		cmp	ax, 19h
		jnz	short loc_96298
		mov	word ptr [si+1Bh], 2

loc_96298:				; CODE XREF: sub_94A30+1861j
		jmp	short loc_962A5
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_962A5
		jmp	short loc_962C3
; ���������������������������������������������������������������������������

loc_962A5:				; CODE XREF: sub_94A30:loc_96298j
					; sub_94A30+1871j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_962B2:				; CODE XREF: sub_94A30+183Bj
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_9626D

loc_962C3:				; CODE XREF: sub_94A30+1873j
		mov	[bp+var_DE], 0
		mov	[bp+var_DA], 2
		mov	[bp+var_D9], 0
		mov	[bp+var_D8], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		push	4
		lea	ax, [bp+var_2CA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_96319
; ���������������������������������������������������������������������������

loc_9630B:				; CODE XREF: sub_94A30+18ECj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_96319:				; CODE XREF: sub_94A30+18D9j
		cmp	di, 4
		jl	short loc_9630B
		push	0FFFFh
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_83FE
		add	sp, 4
		xor	di, di
		jmp	short loc_9637A
; ���������������������������������������������������������������������������

loc_96331:				; CODE XREF: sub_94A30+1959j
		cmp	di, 4
		jnz	short loc_9633B
		mov	word ptr [si+1Bh], 1

loc_9633B:				; CODE XREF: sub_94A30+1904j
		cmp	di, 0Eh
		jnz	short loc_96345
		mov	word ptr [si+1Bh], 2

loc_96345:				; CODE XREF: sub_94A30+190Ej
		cmp	di, 18h
		jnz	short loc_96353
		mov	bx, [bp-0A6h]
		mov	word ptr [bx+1Bh], 1

loc_96353:				; CODE XREF: sub_94A30+1918j
		mov	ax, di
		inc	di
		cmp	ax, 1Ah
		jnz	short loc_96360
		mov	word ptr [si+1Bh], 1

loc_96360:				; CODE XREF: sub_94A30+1929j
		jmp	short loc_9636D
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9636D
		jmp	short loc_9638B
; ���������������������������������������������������������������������������

loc_9636D:				; CODE XREF: sub_94A30:loc_96360j
					; sub_94A30+1939j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9637A:				; CODE XREF: sub_94A30+18FFj
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_96331

loc_9638B:				; CODE XREF: sub_94A30+193Bj
		mov	[bp+var_E8], 0
		mov	[bp+var_E4], 2
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_E8]
		push	ax
		push	5
		lea	ax, [bp+var_2CA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_963E1
; ���������������������������������������������������������������������������

loc_963D3:				; CODE XREF: sub_94A30+19B4j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_963E1:				; CODE XREF: sub_94A30+19A1j
		cmp	di, 6
		jl	short loc_963D3
		mov	bx, [bp-0A6h]
		mov	word ptr [bx+1Bh], 2
		push	0FFFFh
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_83FE
		add	sp, 4
		xor	di, di
		jmp	short loc_96473
; ���������������������������������������������������������������������������

loc_96402:				; CODE XREF: sub_94A30+1A54j
		cmp	di, 6
		jle	short loc_96430
		cmp	di, 0Ch
		jge	short loc_96430
		test	di, 1
		jz	short loc_96430
		mov	ax, word ptr [bp+var_AE+2]
		mov	[bp+var_EA], ax
		mov	bx, word ptr [bp+var_AA+2]
		mov	ax, [bp+var_EA]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_AE+2],	3
		jge	short loc_96430
		inc	word ptr [bp+var_AE+2]

loc_96430:				; CODE XREF: sub_94A30+19D5j
					; sub_94A30+19DAj ...
		cmp	di, 0Eh
		jle	short loc_96458
		cmp	di, 12h
		jge	short loc_96458
		cmp	word ptr [bp+var_AE+2],	1
		jle	short loc_96445
		dec	word ptr [bp+var_AE+2]

loc_96445:				; CODE XREF: sub_94A30+1A0Fj
		mov	ax, word ptr [bp+var_AE+2]
		mov	[bp+var_EC], ax
		mov	bx, word ptr [bp+var_AA+2]
		mov	ax, [bp+var_EC]
		mov	[bx+1Bh], ax

loc_96458:				; CODE XREF: sub_94A30+1A03j
					; sub_94A30+1A08j
		inc	di
		jmp	short loc_96466
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_96466
		jmp	short loc_96487
; ���������������������������������������������������������������������������

loc_96466:				; CODE XREF: sub_94A30+1A29j
					; sub_94A30+1A32j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_96473:				; CODE XREF: sub_94A30+19D0j
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jz	short loc_96487
		jmp	loc_96402
; ���������������������������������������������������������������������������

loc_96487:				; CODE XREF: sub_94A30+1A34j
					; sub_94A30+1A52j
		mov	bx, [bp-0A6h]
		mov	word ptr [bx+1Bh], 1
		xor	di, di
		jmp	short loc_964A2
; ���������������������������������������������������������������������������

loc_96494:				; CODE XREF: sub_94A30+1A75j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_964A2:				; CODE XREF: sub_94A30+1A62j
		cmp	di, 4
		jl	short loc_96494
		mov	[bp+var_F6], 0
		mov	[bp+var_F2], 2
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		push	2
		lea	ax, [bp+var_F6]
		push	ax
		push	6
		lea	ax, [bp+var_2CA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_964FD
; ���������������������������������������������������������������������������

loc_964EF:				; CODE XREF: sub_94A30+1AD0j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_964FD:				; CODE XREF: sub_94A30+1ABDj
		cmp	di, 4
		jl	short loc_964EF
		push	0FFFFh
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_9652D
; ���������������������������������������������������������������������������

loc_96513:				; CODE XREF: sub_94A30+1B0Cj
		jmp	short loc_96520
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_96520
		jmp	short loc_9653E
; ���������������������������������������������������������������������������

loc_96520:				; CODE XREF: sub_94A30:loc_96513j
					; sub_94A30+1AECj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9652D:				; CODE XREF: sub_94A30+1AE1j
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_96513

loc_9653E:				; CODE XREF: sub_94A30+1AEEj
		xor	di, di
		jmp	short loc_96550
; ���������������������������������������������������������������������������

loc_96542:				; CODE XREF: sub_94A30+1B23j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_96550:				; CODE XREF: sub_94A30+1B10j
		cmp	di, 8
		jl	short loc_96542
		mov	word ptr [si+1Bh], 2
		xor	di, di
		jmp	short loc_9656C
; ���������������������������������������������������������������������������

loc_9655E:				; CODE XREF: sub_94A30+1B3Fj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_9656C:				; CODE XREF: sub_94A30+1B2Cj
		cmp	di, 4
		jl	short loc_9655E
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_F1], 0
		jz	short loc_965A6
		cmp	[bp+var_F6], 0
		jz	short loc_965A6
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_965A6:				; CODE XREF: sub_94A30+1B53j
					; sub_94A30+1B5Bj
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E3], 0
		jz	short loc_965E5
		cmp	[bp+var_E8], 0
		jz	short loc_965E5
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_965E5:				; CODE XREF: sub_94A30+1B92j
					; sub_94A30+1B9Aj
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		cmp	[bp+var_D9], 0
		jz	short loc_96624
		cmp	[bp+var_DE], 0
		jz	short loc_96624
		push	0
		mov	al, [bp+var_DA]
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_96624:				; CODE XREF: sub_94A30+1BD1j
					; sub_94A30+1BD9j
		mov	[bp+var_DE], 0
		mov	[bp+var_D9], 0
		mov	[bp+var_D8], 0
		cmp	[bp+var_CF], 0
		jz	short loc_96663
		cmp	[bp+var_D4], 0
		jz	short loc_96663
		push	0
		mov	al, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_D4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_96663:				; CODE XREF: sub_94A30+1C10j
					; sub_94A30+1C18j
		mov	[bp+var_D4], 0
		mov	[bp+var_CF], 0
		mov	[bp+var_CE], 0
		cmp	[bp+var_C5], 0
		jz	short loc_966A2
		cmp	[bp+var_CA], 0
		jz	short loc_966A2
		push	0
		mov	al, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_966A2:				; CODE XREF: sub_94A30+1C4Fj
					; sub_94A30+1C57j
		mov	[bp+var_CA], 0
		mov	[bp+var_C5], 0
		mov	dword ptr [bp-0C4h], 0
		cmp	byte ptr [bp+var_BB], 0
		jz	short loc_966E1
		cmp	[bp+var_C0], 0
		jz	short loc_966E1
		push	0
		mov	al, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_C0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_966E1:				; CODE XREF: sub_94A30+1C8Ej
					; sub_94A30+1C96j
		mov	[bp+var_C0], 0
		mov	byte ptr [bp+var_BB], 0
		mov	[bp+var_BB+1], 0
		cmp	byte ptr [bp+var_B2+1],	0
		jz	short loc_96720
		cmp	dword ptr [bp-0B6h], 0
		jz	short loc_96720
		push	0
		mov	al, byte ptr [bp+var_B2]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_96720:				; CODE XREF: sub_94A30+1CCDj
					; sub_94A30+1CD5j
		mov	dword ptr [bp+var_B6], 0
		mov	byte ptr [bp+var_B2+1],	0
		mov	[bp+var_B2+2], 0
		jmp	loc_97205
; ���������������������������������������������������������������������������

loc_9673A:				; CODE XREF: sub_94A30+1579j
		push	0
		lea	ax, [bp+var_BB0]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	1
		lea	ax, [bp+var_BB0]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_6], 30h	; '0'
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_9686E
; ���������������������������������������������������������������������������

loc_9677D:				; CODE XREF: sub_94A30+1E5Bj
		mov	di, [bp+var_BB5]
		mov	ax, [bp+var_2]
		add	ax, 8
		cmp	ax, di
		jnz	short loc_9679B
		push	[bp+var_8]
		lea	ax, [bp+var_BB0]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_9679B:				; CODE XREF: sub_94A30+1D59j
		mov	ax, [bp+var_2]
		add	ax, 4
		cmp	ax, di
		jnz	short loc_967AA
		mov	word ptr [si+1Bh], 1

loc_967AA:				; CODE XREF: sub_94A30+1D73j
		mov	ax, [bp+var_2]
		add	ax, 0Ch
		cmp	ax, di
		jnz	short loc_967B9
		mov	word ptr [si+1Bh], 2

loc_967B9:				; CODE XREF: sub_94A30+1D82j
		mov	ax, [bp+var_2]
		add	ax, 10h
		cmp	ax, di
		jnz	short loc_967C8
		mov	word ptr [si+1Bh], 1

loc_967C8:				; CODE XREF: sub_94A30+1D91j
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_96812
		mov	[bp+var_BDE], 11BCh
		mov	[bp+var_BDE], 11C8h
		mov	[bp+var_BDE], 11D8h
		mov	[bp+var_BDE], 11E8h
		mov	[bp+var_BDE], 11FCh
		lea	ax, [bp+var_BAE]
		push	ax
		push	0
		push	[bp+var_B91]
		push	[bp+var_B93]
		push	[bp+var_B95]
		push	[bp+var_B97]
		lea	ax, [bp+var_BDE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_96812:				; CODE XREF: sub_94A30+1D9Ej
		jmp	short loc_96861
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_96861
		mov	word ptr [bp-0BEAh], 11BCh
		mov	word ptr [bp-0BEAh], 11C8h
		mov	word ptr [bp-0BEAh], 11D8h
		mov	word ptr [bp-0BEAh], 11E8h
		mov	word ptr [bp-0BEAh], 11FCh
		lea	ax, [bp-0BAEh]
		push	ax
		push	0
		push	word ptr [bp-0B91h]
		push	word ptr [bp-0B93h]
		push	word ptr [bp-0B95h]
		push	word ptr [bp-0B97h]
		lea	ax, [bp-0BEAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9688E
; ���������������������������������������������������������������������������

loc_96861:				; CODE XREF: sub_94A30:loc_96812j
					; sub_94A30+1DEBj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9686E:				; CODE XREF: sub_94A30+1D4Aj
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_9687E
		cmp	[bp+var_BB3], 0
		jz	short loc_96883

loc_9687E:				; CODE XREF: sub_94A30+1E45j
		mov	ax, 1
		jmp	short loc_96885
; ���������������������������������������������������������������������������

loc_96883:				; CODE XREF: sub_94A30+1E4Cj
		xor	ax, ax

loc_96885:				; CODE XREF: sub_94A30+1E51j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9688E
		jmp	loc_9677D
; ���������������������������������������������������������������������������

loc_9688E:				; CODE XREF: sub_94A30+1E2Fj
					; sub_94A30+1E59j
		mov	[bp+var_6], 20h	; ' '
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_969B7
; ���������������������������������������������������������������������������

loc_968B3:				; CODE XREF: sub_94A30+1FA4j
		mov	di, [bp+var_BB5]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_968D5
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_BB0]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_968D5:				; CODE XREF: sub_94A30+1E8Fj
		mov	ax, [bp+var_2]
		add	ax, 4
		cmp	ax, di
		jnz	short loc_968E4
		mov	word ptr [si+1Bh], 2

loc_968E4:				; CODE XREF: sub_94A30+1EADj
		mov	ax, [bp+var_2]
		add	ax, 10h
		cmp	ax, di
		jnz	short loc_968F3
		mov	word ptr [si+1Bh], 1

loc_968F3:				; CODE XREF: sub_94A30+1EBCj
		mov	ax, [bp+var_2]
		add	ax, 12h
		cmp	ax, di
		jnz	short loc_96902
		mov	word ptr [si+1Bh], 2

loc_96902:				; CODE XREF: sub_94A30+1ECBj
		mov	ax, [bp+var_2]
		add	ax, 16h
		cmp	ax, di
		jnz	short loc_96911
		mov	word ptr [si+1Bh], 1

loc_96911:				; CODE XREF: sub_94A30+1EDAj
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_9695B
		mov	[bp+var_BDE], 11BCh
		mov	[bp+var_BDE], 11C8h
		mov	[bp+var_BDE], 11D8h
		mov	[bp+var_BDE], 11E8h
		mov	[bp+var_BDE], 11FCh
		lea	ax, [bp+var_BAE]
		push	ax
		push	0
		push	[bp+var_B91]
		push	[bp+var_B93]
		push	[bp+var_B95]
		push	[bp+var_B97]
		lea	ax, [bp+var_BDE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_9695B:				; CODE XREF: sub_94A30+1EE7j
		jmp	short loc_969AA
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_969AA
		mov	word ptr [bp-0BEAh], 11BCh
		mov	word ptr [bp-0BEAh], 11C8h
		mov	word ptr [bp-0BEAh], 11D8h
		mov	word ptr [bp-0BEAh], 11E8h
		mov	word ptr [bp-0BEAh], 11FCh
		lea	ax, [bp-0BAEh]
		push	ax
		push	0
		push	word ptr [bp-0B91h]
		push	word ptr [bp-0B93h]
		push	word ptr [bp-0B95h]
		push	word ptr [bp-0B97h]
		lea	ax, [bp-0BEAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_969D7
; ���������������������������������������������������������������������������

loc_969AA:				; CODE XREF: sub_94A30:loc_9695Bj
					; sub_94A30+1F34j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_969B7:				; CODE XREF: sub_94A30+1E80j
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_969C7
		cmp	[bp+var_BB3], 0
		jz	short loc_969CC

loc_969C7:				; CODE XREF: sub_94A30+1F8Ej
		mov	ax, 1
		jmp	short loc_969CE
; ���������������������������������������������������������������������������

loc_969CC:				; CODE XREF: sub_94A30+1F95j
		xor	ax, ax

loc_969CE:				; CODE XREF: sub_94A30+1F9Aj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_969D7
		jmp	loc_968B3
; ���������������������������������������������������������������������������

loc_969D7:				; CODE XREF: sub_94A30+1F78j
					; sub_94A30+1FA2j
		mov	[bp+var_6], 1Eh
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_96AEA
; ���������������������������������������������������������������������������

loc_969FC:				; CODE XREF: sub_94A30+20D7j
		mov	di, [bp+var_BB5]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_96A22
		mov	ax, [bp+var_A]
		shl	ax, 1
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BB0]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_96A22:				; CODE XREF: sub_94A30+1FD8j
		mov	ax, [bp+var_2]
		add	ax, 8
		cmp	ax, di
		jnz	short loc_96A31
		mov	word ptr [si+1Bh], 2

loc_96A31:				; CODE XREF: sub_94A30+1FFAj
		mov	ax, [bp+var_2]
		add	ax, 10h
		cmp	ax, di
		jnz	short loc_96A44
		mov	bx, [bp-0A6h]
		mov	word ptr [bx+1Bh], 2

loc_96A44:				; CODE XREF: sub_94A30+2009j
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_96A8E
		mov	[bp+var_BDE], 11BCh
		mov	[bp+var_BDE], 11C8h
		mov	[bp+var_BDE], 11D8h
		mov	[bp+var_BDE], 11E8h
		mov	[bp+var_BDE], 11FCh
		lea	ax, [bp+var_BAE]
		push	ax
		push	0
		push	[bp+var_B91]
		push	[bp+var_B93]
		push	[bp+var_B95]
		push	[bp+var_B97]
		lea	ax, [bp+var_BDE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_96A8E:				; CODE XREF: sub_94A30+201Aj
		jmp	short loc_96ADD
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_96ADD
		mov	word ptr [bp-0BEAh], 11BCh
		mov	word ptr [bp-0BEAh], 11C8h
		mov	word ptr [bp-0BEAh], 11D8h
		mov	word ptr [bp-0BEAh], 11E8h
		mov	word ptr [bp-0BEAh], 11FCh
		lea	ax, [bp-0BAEh]
		push	ax
		push	0
		push	word ptr [bp-0B91h]
		push	word ptr [bp-0B93h]
		push	word ptr [bp-0B95h]
		push	word ptr [bp-0B97h]
		lea	ax, [bp-0BEAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_96B0A
; ���������������������������������������������������������������������������

loc_96ADD:				; CODE XREF: sub_94A30:loc_96A8Ej
					; sub_94A30+2067j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_96AEA:				; CODE XREF: sub_94A30+1FC9j
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_96AFA
		cmp	[bp+var_BB3], 0
		jz	short loc_96AFF

loc_96AFA:				; CODE XREF: sub_94A30+20C1j
		mov	ax, 1
		jmp	short loc_96B01
; ���������������������������������������������������������������������������

loc_96AFF:				; CODE XREF: sub_94A30+20C8j
		xor	ax, ax

loc_96B01:				; CODE XREF: sub_94A30+20CDj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_96B0A
		jmp	loc_969FC
; ���������������������������������������������������������������������������

loc_96B0A:				; CODE XREF: sub_94A30+20ABj
					; sub_94A30+20D5j
		mov	[bp+var_6], 4Eh	; 'N'
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_96C49
; ���������������������������������������������������������������������������

loc_96B2F:				; CODE XREF: sub_94A30+2236j
		mov	di, [bp+var_BB5]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_96B58
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BB0]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_96B58:				; CODE XREF: sub_94A30+210Bj
		mov	ax, [bp+var_2]
		add	ax, 4
		cmp	ax, di
		jnz	short loc_96B67
		mov	word ptr [si+1Bh], 1

loc_96B67:				; CODE XREF: sub_94A30+2130j
		mov	ax, [bp+var_2]
		add	ax, 18h
		cmp	ax, di
		jnz	short loc_96B76
		mov	word ptr [si+1Bh], 2

loc_96B76:				; CODE XREF: sub_94A30+213Fj
		mov	ax, [bp+var_2]
		add	ax, 24h	; '$'
		cmp	ax, di
		jnz	short loc_96B85
		mov	word ptr [si+1Bh], 1

loc_96B85:				; CODE XREF: sub_94A30+214Ej
		mov	ax, [bp+var_2]
		add	ax, 26h	; '&'
		cmp	ax, di
		jnz	short loc_96B94
		mov	word ptr [si+1Bh], 2

loc_96B94:				; CODE XREF: sub_94A30+215Dj
		mov	ax, [bp+var_2]
		add	ax, 2Ch	; ','
		cmp	ax, di
		jnz	short loc_96BA3
		mov	word ptr [si+1Bh], 1

loc_96BA3:				; CODE XREF: sub_94A30+216Cj
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_96BED
		mov	[bp+var_BDE], 11BCh
		mov	[bp+var_BDE], 11C8h
		mov	[bp+var_BDE], 11D8h
		mov	[bp+var_BDE], 11E8h
		mov	[bp+var_BDE], 11FCh
		lea	ax, [bp+var_BAE]
		push	ax
		push	0
		push	[bp+var_B91]
		push	[bp+var_B93]
		push	[bp+var_B95]
		push	[bp+var_B97]
		lea	ax, [bp+var_BDE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_96BED:				; CODE XREF: sub_94A30+2179j
		jmp	short loc_96C3C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_96C3C
		mov	word ptr [bp-0BEAh], 11BCh
		mov	word ptr [bp-0BEAh], 11C8h
		mov	word ptr [bp-0BEAh], 11D8h
		mov	word ptr [bp-0BEAh], 11E8h
		mov	word ptr [bp-0BEAh], 11FCh
		lea	ax, [bp-0BAEh]
		push	ax
		push	0
		push	word ptr [bp-0B91h]
		push	word ptr [bp-0B93h]
		push	word ptr [bp-0B95h]
		push	word ptr [bp-0B97h]
		lea	ax, [bp-0BEAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_96C69
; ���������������������������������������������������������������������������

loc_96C3C:				; CODE XREF: sub_94A30:loc_96BEDj
					; sub_94A30+21C6j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_96C49:				; CODE XREF: sub_94A30+20FCj
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_96C59
		cmp	[bp+var_BB3], 0
		jz	short loc_96C5E

loc_96C59:				; CODE XREF: sub_94A30+2220j
		mov	ax, 1
		jmp	short loc_96C60
; ���������������������������������������������������������������������������

loc_96C5E:				; CODE XREF: sub_94A30+2227j
		xor	ax, ax

loc_96C60:				; CODE XREF: sub_94A30+222Cj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_96C69
		jmp	loc_96B2F
; ���������������������������������������������������������������������������

loc_96C69:				; CODE XREF: sub_94A30+220Aj
					; sub_94A30+2234j
		mov	[bp+var_6], 59h	; 'Y'
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_96DC8
; ���������������������������������������������������������������������������

loc_96C8E:				; CODE XREF: sub_94A30+23B5j
		mov	di, [bp+var_BB5]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_96CB5
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BB0]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_96CB5:				; CODE XREF: sub_94A30+226Aj
		mov	ax, [bp+var_2]
		add	ax, 4
		cmp	ax, di
		jnz	short loc_96CC4
		mov	word ptr [si+1Bh], 1

loc_96CC4:				; CODE XREF: sub_94A30+228Dj
		mov	ax, [bp+var_2]
		add	ax, 0Eh
		cmp	ax, di
		jnz	short loc_96CD3
		mov	word ptr [si+1Bh], 2

loc_96CD3:				; CODE XREF: sub_94A30+229Cj
		mov	ax, [bp+var_2]
		add	ax, 1Ah
		cmp	ax, di
		jnz	short loc_96CE2
		mov	word ptr [si+1Bh], 1

loc_96CE2:				; CODE XREF: sub_94A30+22ABj
		mov	ax, [bp+var_2]
		add	ax, 1Ch
		cmp	ax, di
		jnz	short loc_96CF1
		mov	word ptr [si+1Bh], 2

loc_96CF1:				; CODE XREF: sub_94A30+22BAj
		mov	ax, [bp+var_2]
		add	ax, 2Ch	; ','
		cmp	ax, di
		jnz	short loc_96D00
		mov	word ptr [si+1Bh], 1

loc_96D00:				; CODE XREF: sub_94A30+22C9j
		mov	ax, [bp+var_4]
		add	ax, 0FFF7h
		cmp	ax, di
		jnz	short loc_96D13
		mov	bx, [bp-0A6h]
		mov	word ptr [bx+1Bh], 1

loc_96D13:				; CODE XREF: sub_94A30+22D8j
		mov	ax, [bp+var_4]
		add	ax, 0FFF8h
		cmp	ax, di
		jnz	short loc_96D22
		mov	word ptr [si+1Bh], 2

loc_96D22:				; CODE XREF: sub_94A30+22EBj
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_96D6C
		mov	[bp+var_BDE], 11BCh
		mov	[bp+var_BDE], 11C8h
		mov	[bp+var_BDE], 11D8h
		mov	[bp+var_BDE], 11E8h
		mov	[bp+var_BDE], 11FCh
		lea	ax, [bp+var_BAE]
		push	ax
		push	0
		push	[bp+var_B91]
		push	[bp+var_B93]
		push	[bp+var_B95]
		push	[bp+var_B97]
		lea	ax, [bp+var_BDE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_96D6C:				; CODE XREF: sub_94A30+22F8j
		jmp	short loc_96DBB
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_96DBB
		mov	word ptr [bp-0BEAh], 11BCh
		mov	word ptr [bp-0BEAh], 11C8h
		mov	word ptr [bp-0BEAh], 11D8h
		mov	word ptr [bp-0BEAh], 11E8h
		mov	word ptr [bp-0BEAh], 11FCh
		lea	ax, [bp-0BAEh]
		push	ax
		push	0
		push	word ptr [bp-0B91h]
		push	word ptr [bp-0B93h]
		push	word ptr [bp-0B95h]
		push	word ptr [bp-0B97h]
		lea	ax, [bp-0BEAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_96DE8
; ���������������������������������������������������������������������������

loc_96DBB:				; CODE XREF: sub_94A30:loc_96D6Cj
					; sub_94A30+2345j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_96DC8:				; CODE XREF: sub_94A30+225Bj
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_96DD8
		cmp	[bp+var_BB3], 0
		jz	short loc_96DDD

loc_96DD8:				; CODE XREF: sub_94A30+239Fj
		mov	ax, 1
		jmp	short loc_96DDF
; ���������������������������������������������������������������������������

loc_96DDD:				; CODE XREF: sub_94A30+23A6j
		xor	ax, ax

loc_96DDF:				; CODE XREF: sub_94A30+23ABj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_96DE8
		jmp	loc_96C8E
; ���������������������������������������������������������������������������

loc_96DE8:				; CODE XREF: sub_94A30+2389j
					; sub_94A30+23B3j
		mov	[bp+var_6], 3Ah	; ':'
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_96EED
; ���������������������������������������������������������������������������

loc_96E0D:				; CODE XREF: sub_94A30+24DAj
		mov	di, [bp+var_BB5]
		mov	ax, [bp+var_2]
		add	ax, 8
		cmp	ax, di
		jnz	short loc_96E36
		mov	ax, [bp+var_A]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BB0]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_96E36:				; CODE XREF: sub_94A30+23E9j
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_96E45
		mov	word ptr [si+1Bh], 1

loc_96E45:				; CODE XREF: sub_94A30+240Ej
		mov	ax, [bp+var_4]
		add	ax, 0FFFDh
		cmp	ax, di
		jnz	short loc_96E91
		mov	[bp+var_BDE], 11BCh
		mov	[bp+var_BDE], 11C8h
		mov	[bp+var_BDE], 11D8h
		mov	[bp+var_BDE], 11E8h
		mov	[bp+var_BDE], 11FCh
		lea	ax, [bp+var_BAE]
		push	ax
		push	0
		push	[bp+var_B91]
		push	[bp+var_B93]
		push	[bp+var_B95]
		push	[bp+var_B97]
		lea	ax, [bp+var_BDE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_96E91:				; CODE XREF: sub_94A30+241Dj
		jmp	short loc_96EE0
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_96EE0
		mov	word ptr [bp-0BEAh], 11BCh
		mov	word ptr [bp-0BEAh], 11C8h
		mov	word ptr [bp-0BEAh], 11D8h
		mov	word ptr [bp-0BEAh], 11E8h
		mov	word ptr [bp-0BEAh], 11FCh
		lea	ax, [bp-0BAEh]
		push	ax
		push	0
		push	word ptr [bp-0B91h]
		push	word ptr [bp-0B93h]
		push	word ptr [bp-0B95h]
		push	word ptr [bp-0B97h]
		lea	ax, [bp-0BEAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_96F0D
; ���������������������������������������������������������������������������

loc_96EE0:				; CODE XREF: sub_94A30:loc_96E91j
					; sub_94A30+246Aj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_96EED:				; CODE XREF: sub_94A30+23DAj
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_96EFD
		cmp	[bp+var_BB3], 0
		jz	short loc_96F02

loc_96EFD:				; CODE XREF: sub_94A30+24C4j
		mov	ax, 1
		jmp	short loc_96F04
; ���������������������������������������������������������������������������

loc_96F02:				; CODE XREF: sub_94A30+24CBj
		xor	ax, ax

loc_96F04:				; CODE XREF: sub_94A30+24D0j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_96F0D
		jmp	loc_96E0D
; ���������������������������������������������������������������������������

loc_96F0D:				; CODE XREF: sub_94A30+24AEj
					; sub_94A30+24D8j
		push	2
		lea	ax, [bp+var_BB0]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_6], 36h	; '6'
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_970AF
; ���������������������������������������������������������������������������

loc_96F41:				; CODE XREF: sub_94A30+269Cj
		mov	di, [bp+var_BB5]
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_96F6A
		mov	ax, [bp+var_A]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BB0]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_96F6A:				; CODE XREF: sub_94A30+251Dj
		mov	ax, [bp+var_2]
		add	ax, 0Ah
		cmp	ax, di
		jnz	short loc_96F7D
		mov	bx, [bp-0A6h]
		mov	word ptr [bx+1Bh], 2

loc_96F7D:				; CODE XREF: sub_94A30+2542j
		mov	ax, [bp+var_2]
		add	ax, 1Ah
		cmp	ax, di
		jnz	short loc_96F90
		mov	bx, [bp-0A6h]
		mov	word ptr [bx+1Bh], 1

loc_96F90:				; CODE XREF: sub_94A30+2555j
		mov	ax, [bp+var_2]
		add	ax, 0Ch
		cmp	ax, di
		jge	short loc_96FC8
		mov	ax, [bp+var_2]
		add	ax, 12h
		cmp	ax, di
		jle	short loc_96FC8
		test	di, 1
		jz	short loc_96FC8
		mov	ax, word ptr [bp+var_AE+2]
		mov	word ptr [bp+var_AE], ax
		mov	bx, word ptr [bp+var_AA+2]
		mov	ax, word ptr [bp+var_AE]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_AE+2],	3
		jge	short loc_96FC8
		inc	word ptr [bp+var_AE+2]

loc_96FC8:				; CODE XREF: sub_94A30+2568j
					; sub_94A30+2572j ...
		mov	ax, [bp+var_2]
		add	ax, 18h
		cmp	ax, di
		jge	short loc_96FF6
		test	di, 1
		jz	short loc_96FF6
		mov	ax, word ptr [bp+var_AE+2]
		mov	word ptr [bp+var_B2+2],	ax
		mov	bx, word ptr [bp+var_AA+2]
		mov	ax, word ptr [bp+var_B2+2]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_AE+2],	1
		jle	short loc_96FF6
		dec	word ptr [bp+var_AE+2]

loc_96FF6:				; CODE XREF: sub_94A30+25A0j
					; sub_94A30+25A6j ...
		mov	ax, [bp+var_4]
		add	ax, 0FFF6h
		cmp	ax, di
		jnz	short loc_97009
		mov	bx, [bp-0A6h]
		mov	word ptr [bx+1Bh], 2

loc_97009:				; CODE XREF: sub_94A30+25CEj
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_97053
		mov	[bp+var_BDE], 11BCh
		mov	[bp+var_BDE], 11C8h
		mov	[bp+var_BDE], 11D8h
		mov	[bp+var_BDE], 11E8h
		mov	[bp+var_BDE], 11FCh
		lea	ax, [bp+var_BAE]
		push	ax
		push	0
		push	[bp+var_B91]
		push	[bp+var_B93]
		push	[bp+var_B95]
		push	[bp+var_B97]
		lea	ax, [bp+var_BDE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_97053:				; CODE XREF: sub_94A30+25DFj
		jmp	short loc_970A2
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_970A2
		mov	word ptr [bp-0BEAh], 11BCh
		mov	word ptr [bp-0BEAh], 11C8h
		mov	word ptr [bp-0BEAh], 11D8h
		mov	word ptr [bp-0BEAh], 11E8h
		mov	word ptr [bp-0BEAh], 11FCh
		lea	ax, [bp-0BAEh]
		push	ax
		push	0
		push	word ptr [bp-0B91h]
		push	word ptr [bp-0B93h]
		push	word ptr [bp-0B95h]
		push	word ptr [bp-0B97h]
		lea	ax, [bp-0BEAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_970CF
; ���������������������������������������������������������������������������

loc_970A2:				; CODE XREF: sub_94A30:loc_97053j
					; sub_94A30+262Cj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_970AF:				; CODE XREF: sub_94A30+250Ej
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_970BF
		cmp	[bp+var_BB3], 0
		jz	short loc_970C4

loc_970BF:				; CODE XREF: sub_94A30+2686j
		mov	ax, 1
		jmp	short loc_970C6
; ���������������������������������������������������������������������������

loc_970C4:				; CODE XREF: sub_94A30+268Dj
		xor	ax, ax

loc_970C6:				; CODE XREF: sub_94A30+2692j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_970CF
		jmp	loc_96F41
; ���������������������������������������������������������������������������

loc_970CF:				; CODE XREF: sub_94A30+2670j
					; sub_94A30+269Aj
		mov	[bp+var_6], 2Bh	; '+'
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_971E5
; ���������������������������������������������������������������������������

loc_970F4:				; CODE XREF: sub_94A30+27D2j
		mov	di, [bp+var_BB5]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_9711D
		mov	ax, [bp+var_A]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BB0]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_9711D:				; CODE XREF: sub_94A30+26D0j
		mov	ax, [bp+var_4]
		add	ax, 0FFF8h
		cmp	ax, di
		jnz	short loc_9712C
		mov	word ptr [si+1Bh], 2

loc_9712C:				; CODE XREF: sub_94A30+26F5j
		mov	ax, [bp+var_4]
		add	ax, 0FFF4h
		cmp	ax, di
		jnz	short loc_9713F
		mov	bx, [bp-0A6h]
		mov	word ptr [bx+1Bh], 1

loc_9713F:				; CODE XREF: sub_94A30+2704j
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_97189
		mov	[bp+var_BDE], 11BCh
		mov	[bp+var_BDE], 11C8h
		mov	[bp+var_BDE], 11D8h
		mov	[bp+var_BDE], 11E8h
		mov	[bp+var_BDE], 11FCh
		lea	ax, [bp+var_BAE]
		push	ax
		push	0
		push	[bp+var_B91]
		push	[bp+var_B93]
		push	[bp+var_B95]
		push	[bp+var_B97]
		lea	ax, [bp+var_BDE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_97189:				; CODE XREF: sub_94A30+2715j
		jmp	short loc_971D8
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_971D8
		mov	word ptr [bp-0BEAh], 11BCh
		mov	word ptr [bp-0BEAh], 11C8h
		mov	word ptr [bp-0BEAh], 11D8h
		mov	word ptr [bp-0BEAh], 11E8h
		mov	word ptr [bp-0BEAh], 11FCh
		lea	ax, [bp-0BAEh]
		push	ax
		push	0
		push	word ptr [bp-0B91h]
		push	word ptr [bp-0B93h]
		push	word ptr [bp-0B95h]
		push	word ptr [bp-0B97h]
		lea	ax, [bp-0BEAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_97205
; ���������������������������������������������������������������������������

loc_971D8:				; CODE XREF: sub_94A30:loc_97189j
					; sub_94A30+2762j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_971E5:				; CODE XREF: sub_94A30+26C1j
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_971F5
		cmp	[bp+var_BB3], 0
		jz	short loc_971FA

loc_971F5:				; CODE XREF: sub_94A30+27BCj
		mov	ax, 1
		jmp	short loc_971FC
; ���������������������������������������������������������������������������

loc_971FA:				; CODE XREF: sub_94A30+27C3j
		xor	ax, ax

loc_971FC:				; CODE XREF: sub_94A30+27C8j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_97205
		jmp	loc_970F4
; ���������������������������������������������������������������������������

loc_97205:				; CODE XREF: sub_94A30+1D07j
					; sub_94A30+27A6j ...
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	0
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_97235
		jmp	loc_975C7
; ���������������������������������������������������������������������������

loc_97235:				; CODE XREF: sub_94A30+2800j
		lea	ax, [bp+var_BAE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B8E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_97279
		cmp	[bp+var_90], 0
		jz	short loc_97279
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97279:				; CODE XREF: sub_94A30+2826j
					; sub_94A30+282Ej
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_972C3
		cmp	[bp+var_80], 0
		jz	short loc_972C3
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_972C3:				; CODE XREF: sub_94A30+2873j
					; sub_94A30+287Aj
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_97309
		cmp	[bp+var_70], 0
		jz	short loc_97309
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97309:				; CODE XREF: sub_94A30+28B9j
					; sub_94A30+28C0j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_97341
		cmp	[bp+var_66], 0
		jz	short loc_97341
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97341:				; CODE XREF: sub_94A30+28F1j
					; sub_94A30+28F8j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_97379
		cmp	[bp+var_5C], 0
		jz	short loc_97379
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97379:				; CODE XREF: sub_94A30+2929j
					; sub_94A30+2930j
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_973B1
		cmp	[bp+var_52], 0
		jz	short loc_973B1
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_973B1:				; CODE XREF: sub_94A30+2961j
					; sub_94A30+2968j
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_973E9
		cmp	[bp+var_48], 0
		jz	short loc_973E9
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_973E9:				; CODE XREF: sub_94A30+2999j
					; sub_94A30+29A0j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_97421
		cmp	[bp+var_3E], 0
		jz	short loc_97421
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97421:				; CODE XREF: sub_94A30+29D1j
					; sub_94A30+29D8j
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_97459
		cmp	[bp+var_34], 0
		jz	short loc_97459
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97459:				; CODE XREF: sub_94A30+2A09j
					; sub_94A30+2A10j
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_B76], 185Fh
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B61], 0
		jz	short loc_974A8
		cmp	[bp+var_B66], 0
		jz	short loc_974A8
		push	0
		mov	al, [bp+var_B62]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_974A8:				; CODE XREF: sub_94A30+2A55j
					; sub_94A30+2A5Dj
		mov	[bp+var_B66], 0
		mov	[bp+var_B61], 0
		mov	[bp+var_B60], 0
		lea	ax, [bp+var_350]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_347], 0
		jz	short loc_974F4
		cmp	[bp+var_34C], 0
		jz	short loc_974F4
		push	0
		mov	al, [bp+var_348]
		push	ax
		lea	ax, [bp+var_34C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_974F4:				; CODE XREF: sub_94A30+2AA1j
					; sub_94A30+2AA9j
		mov	[bp+var_34C], 0
		mov	[bp+var_347], 0
		mov	[bp+var_346], 0
		push	2
		lea	ax, [bp+var_342]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9753E
		cmp	[bp+var_28], 0
		jz	short loc_9753E
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9753E:				; CODE XREF: sub_94A30+2AEEj
					; sub_94A30+2AF5j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_2CA]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_252]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1DA]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_162]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_154]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_975C7:				; CODE XREF: sub_94A30+2802j
		lea	ax, [bp+var_154]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_5C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-0A6h], ax
		push	0
		push	0
		lea	ax, [bp+var_66]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	si, ax
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-0A6h]
		lea	ax, [bp+var_BD2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	si
		lea	ax, [bp+var_BD2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_B2+2], 0
		mov	byte ptr [bp+var_AE+2],	2
		mov	byte ptr [bp+var_AE+3],	0
		mov	[bp+var_AA], 0
		mov	[bp+var_BDC], 0
		mov	[bp+var_BD8], 2
		mov	[bp+var_BD7], 0
		mov	[bp+var_BD6], 0
		mov	word ptr [bp+var_BE2+2], 0
		mov	[bp+var_BDE], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_976AE
		jmp	loc_9772D
; ���������������������������������������������������������������������������

loc_976AE:				; CODE XREF: sub_94A30+2C79j
		push	3
		lea	ax, [bp+var_B2+2]
		push	ax
		push	1Dh
		lea	ax, [bp+var_342]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_BE2+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_B2+2]
		push	ax
		lea	ax, [bp+var_BE2+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EDC
		mov	word ptr [bp+var_B2], ax
		mov	word ptr [bp-0B4h], 0
		cmp	word ptr [bp+var_BE2+2], 0
		jz	short loc_9772D
		push	[bp+var_BDE]
		mov	bx, word ptr [bp+var_BE2+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-0B4h]
		push	word ptr [bp+var_B2]
		push	[bp+var_BDE]
		mov	bx, word ptr [bp+var_BE2+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_9772D:				; CODE XREF: sub_94A30+2C7Bj
					; sub_94A30+2CCBj
		cmp	[bp+var_C], 0
		jnz	short loc_97736
		jmp	loc_97989
; ���������������������������������������������������������������������������

loc_97736:				; CODE XREF: sub_94A30+2D01j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_C0+2], 0
		mov	byte ptr [bp+var_BB+1],	2
		mov	byte ptr [bp+var_BB+2],	0
		mov	[bp+var_BB+3], 0
		push	2
		lea	ax, [bp+var_C0+2]
		push	ax
		push	7
		lea	ax, [bp+var_2CA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_C0+2]
		push	ax
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_97799
; ���������������������������������������������������������������������������

loc_9778B:				; CODE XREF: sub_94A30+2D6Cj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_97799:				; CODE XREF: sub_94A30+2D59j
		cmp	di, 8
		jl	short loc_9778B
		mov	word ptr [si+1Bh], 1
		push	0FFFFh
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_977F2
; ���������������������������������������������������������������������������

loc_977B4:				; CODE XREF: sub_94A30+2DD1j
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_C0], ax
		mov	ax, word ptr [bp+var_C0]
		mov	[si+1Bh], ax
		jmp	short loc_977E5
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_977E5
		jmp	short loc_97803
; ���������������������������������������������������������������������������

loc_977E5:				; CODE XREF: sub_94A30+2DA8j
					; sub_94A30+2DB1j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_977F2:				; CODE XREF: sub_94A30+2D82j
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_977B4

loc_97803:				; CODE XREF: sub_94A30+2DB3j
		mov	word ptr [si+1Bh], 0
		mov	[bp+var_CA], 0
		mov	[bp+var_C6], 2
		mov	[bp+var_C5], 0
		mov	dword ptr [bp-0C4h], 0
		push	2
		lea	ax, [bp+var_CA]
		push	ax
		push	8
		lea	ax, [bp+var_2CA]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_9785E
; ���������������������������������������������������������������������������

loc_97850:				; CODE XREF: sub_94A30+2E31j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_9785E:				; CODE XREF: sub_94A30+2E1Ej
		cmp	di, 0Ah
		jl	short loc_97850
		mov	word ptr [si+1Bh], 1
		xor	di, di
		jmp	short loc_9787A
; ���������������������������������������������������������������������������

loc_9786C:				; CODE XREF: sub_94A30+2E4Dj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_9787A:				; CODE XREF: sub_94A30+2E3Aj
		cmp	di, 2
		jl	short loc_9786C
		push	0FFFFh
		lea	ax, [bp+var_B76]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_978CE
; ���������������������������������������������������������������������������

loc_97890:				; CODE XREF: sub_94A30+2EADj
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_CE+2],	ax
		mov	ax, word ptr [bp+var_CE+2]
		mov	[si+1Bh], ax
		jmp	short loc_978C1
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_978C1
		jmp	short loc_978DF
; ���������������������������������������������������������������������������

loc_978C1:				; CODE XREF: sub_94A30+2E84j
					; sub_94A30+2E8Dj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_978CE:				; CODE XREF: sub_94A30+2E5Ej
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_97890

loc_978DF:				; CODE XREF: sub_94A30+2E8Fj
		mov	word ptr [si+1Bh], 1
		xor	di, di
		jmp	short loc_978F6
; ���������������������������������������������������������������������������

loc_978E8:				; CODE XREF: sub_94A30+2EC9j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_978F6:				; CODE XREF: sub_94A30+2EB6j
		cmp	di, 0Ch
		jl	short loc_978E8
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_C5], 0
		jz	short loc_97930
		cmp	[bp+var_CA], 0
		jz	short loc_97930
		push	0
		mov	al, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97930:				; CODE XREF: sub_94A30+2EDDj
					; sub_94A30+2EE5j
		mov	[bp+var_CA], 0
		mov	[bp+var_C5], 0
		mov	dword ptr [bp-0C4h], 0
		cmp	byte ptr [bp+var_BB+2],	0
		jz	short loc_9796F
		cmp	[bp+var_C0+2], 0
		jz	short loc_9796F
		push	0
		mov	al, byte ptr [bp+var_BB+1]
		push	ax
		lea	ax, [bp+var_C0+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9796F:				; CODE XREF: sub_94A30+2F1Cj
					; sub_94A30+2F24j
		mov	[bp+var_C0+2], 0
		mov	byte ptr [bp+var_BB+2],	0
		mov	[bp+var_BB+3], 0
		jmp	loc_97DC6
; ���������������������������������������������������������������������������

loc_97989:				; CODE XREF: sub_94A30+2D03j
		push	0
		lea	ax, [bp+var_BB0]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0CBh ; '�'
		lea	ax, [bp+var_BB0]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_6], 2Dh	; '-'
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_97AF0
; ���������������������������������������������������������������������������

loc_979CD:				; CODE XREF: sub_94A30+30DDj
		mov	di, [bp+var_BB5]
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_979E0
		mov	word ptr [si+1Bh], 1

loc_979E0:				; CODE XREF: sub_94A30+2FA9j
		mov	ax, [bp+var_2]
		add	ax, 0Ch
		cmp	ax, di
		jnz	short loc_97A03
		mov	ax, [bp+var_A]
		shl	ax, 3
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BB0]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_97A03:				; CODE XREF: sub_94A30+2FB8j
		mov	ax, [bp+var_2]
		add	ax, 0Ch
		cmp	ax, di
		jge	short loc_97A3B
		mov	ax, [bp+var_2]
		add	ax, 14h
		cmp	ax, di
		jle	short loc_97A3B
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	[bp+var_B6], ax
		mov	ax, [bp+var_B6]
		mov	[si+1Bh], ax

loc_97A3B:				; CODE XREF: sub_94A30+2FDBj
					; sub_94A30+2FE5j
		mov	ax, [bp+var_4]
		add	ax, 0FFFBh
		cmp	ax, di
		jge	short loc_97A4A
		mov	word ptr [si+1Bh], 1

loc_97A4A:				; CODE XREF: sub_94A30+3013j
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_97A94
		mov	[bp+var_BEC], 11BCh
		mov	[bp+var_BEC], 11C8h
		mov	[bp+var_BEC], 11D8h
		mov	[bp+var_BEC], 11E8h
		mov	[bp+var_BEC], 11FCh
		lea	ax, [bp+var_BAE]
		push	ax
		push	0
		push	[bp+var_B91]
		push	[bp+var_B93]
		push	[bp+var_B95]
		push	[bp+var_B97]
		lea	ax, [bp+var_BEC]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_97A94:				; CODE XREF: sub_94A30+3020j
		jmp	short loc_97AE3
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_97AE3
		mov	word ptr [bp-0BF8h], 11BCh
		mov	word ptr [bp-0BF8h], 11C8h
		mov	word ptr [bp-0BF8h], 11D8h
		mov	word ptr [bp-0BF8h], 11E8h
		mov	word ptr [bp-0BF8h], 11FCh
		lea	ax, [bp-0BAEh]
		push	ax
		push	0
		push	word ptr [bp-0B91h]
		push	word ptr [bp-0B93h]
		push	word ptr [bp-0B95h]
		push	word ptr [bp-0B97h]
		lea	ax, [bp-0BF8h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_97B10
; ���������������������������������������������������������������������������

loc_97AE3:				; CODE XREF: sub_94A30:loc_97A94j
					; sub_94A30+306Dj
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_97AF0:				; CODE XREF: sub_94A30+2F9Aj
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_97B00
		cmp	[bp+var_BB3], 0
		jz	short loc_97B05

loc_97B00:				; CODE XREF: sub_94A30+30C7j
		mov	ax, 1
		jmp	short loc_97B07
; ���������������������������������������������������������������������������

loc_97B05:				; CODE XREF: sub_94A30+30CEj
		xor	ax, ax

loc_97B07:				; CODE XREF: sub_94A30+30D3j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_97B10
		jmp	loc_979CD
; ���������������������������������������������������������������������������

loc_97B10:				; CODE XREF: sub_94A30+30B1j
					; sub_94A30+30DBj
		mov	[bp+var_6], 69h	; 'i'
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_97C4B
; ���������������������������������������������������������������������������

loc_97B35:				; CODE XREF: sub_94A30+3238j
		mov	di, [bp+var_BB5]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_97B5E
		mov	ax, [bp+var_A]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BB0]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_97B5E:				; CODE XREF: sub_94A30+3111j
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jge	short loc_97B96
		mov	ax, [bp+var_2]
		add	ax, 41h	; 'A'
		cmp	ax, di
		jle	short loc_97B96
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	[bp+var_B6], ax
		mov	ax, [bp+var_B6]
		mov	[si+1Bh], ax

loc_97B96:				; CODE XREF: sub_94A30+3136j
					; sub_94A30+3140j
		mov	ax, [bp+var_4]
		add	ax, 0FFE7h
		cmp	ax, di
		jge	short loc_97BA5
		mov	word ptr [si+1Bh], 0

loc_97BA5:				; CODE XREF: sub_94A30+316Ej
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_97BEF
		mov	[bp+var_BEC], 11BCh
		mov	[bp+var_BEC], 11C8h
		mov	[bp+var_BEC], 11D8h
		mov	[bp+var_BEC], 11E8h
		mov	[bp+var_BEC], 11FCh
		lea	ax, [bp+var_BAE]
		push	ax
		push	0
		push	[bp+var_B91]
		push	[bp+var_B93]
		push	[bp+var_B95]
		push	[bp+var_B97]
		lea	ax, [bp+var_BEC]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_97BEF:				; CODE XREF: sub_94A30+317Bj
		jmp	short loc_97C3E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_97C3E
		mov	word ptr [bp-0BF8h], 11BCh
		mov	word ptr [bp-0BF8h], 11C8h
		mov	word ptr [bp-0BF8h], 11D8h
		mov	word ptr [bp-0BF8h], 11E8h
		mov	word ptr [bp-0BF8h], 11FCh
		lea	ax, [bp-0BAEh]
		push	ax
		push	0
		push	word ptr [bp-0B91h]
		push	word ptr [bp-0B93h]
		push	word ptr [bp-0B95h]
		push	word ptr [bp-0B97h]
		lea	ax, [bp-0BF8h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_97C6B
; ���������������������������������������������������������������������������

loc_97C3E:				; CODE XREF: sub_94A30:loc_97BEFj
					; sub_94A30+31C8j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_97C4B:				; CODE XREF: sub_94A30+3102j
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_97C5B
		cmp	[bp+var_BB3], 0
		jz	short loc_97C60

loc_97C5B:				; CODE XREF: sub_94A30+3222j
		mov	ax, 1
		jmp	short loc_97C62
; ���������������������������������������������������������������������������

loc_97C60:				; CODE XREF: sub_94A30+3229j
		xor	ax, ax

loc_97C62:				; CODE XREF: sub_94A30+322Ej
		mov	ah, 0
		or	ax, ax
		jnz	short loc_97C6B
		jmp	loc_97B35
; ���������������������������������������������������������������������������

loc_97C6B:				; CODE XREF: sub_94A30+320Cj
					; sub_94A30+3236j
		mov	[bp+var_6], 32h	; '2'
		mov	ax, [bp+var_BB5]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	loc_97DA6
; ���������������������������������������������������������������������������

loc_97C90:				; CODE XREF: sub_94A30+3393j
		mov	di, [bp+var_BB5]
		mov	ax, [bp+var_2]
		add	ax, 2
		cmp	ax, di
		jnz	short loc_97CB9
		mov	ax, [bp+var_A]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BB0]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_97CB9:				; CODE XREF: sub_94A30+326Cj
		mov	ax, [bp+var_2]
		add	ax, 6
		cmp	ax, di
		jge	short loc_97CF1
		mov	ax, [bp+var_2]
		add	ax, 19h
		cmp	ax, di
		jle	short loc_97CF1
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	[bp+var_B6], ax
		mov	ax, [bp+var_B6]
		mov	[si+1Bh], ax

loc_97CF1:				; CODE XREF: sub_94A30+3291j
					; sub_94A30+329Bj
		mov	ax, [bp+var_4]
		add	ax, 0FFF6h
		cmp	ax, di
		jge	short loc_97D00
		mov	word ptr [si+1Bh], 1

loc_97D00:				; CODE XREF: sub_94A30+32C9j
		mov	ax, [bp+var_4]
		dec	ax
		cmp	ax, di
		jnz	short loc_97D4A
		mov	[bp+var_BEC], 11BCh
		mov	[bp+var_BEC], 11C8h
		mov	[bp+var_BEC], 11D8h
		mov	[bp+var_BEC], 11E8h
		mov	[bp+var_BEC], 11FCh
		lea	ax, [bp+var_BAE]
		push	ax
		push	0
		push	[bp+var_B91]
		push	[bp+var_B93]
		push	[bp+var_B95]
		push	[bp+var_B97]
		lea	ax, [bp+var_BEC]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_97D4A:				; CODE XREF: sub_94A30+32D6j
		jmp	short loc_97D99
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_97D99
		mov	word ptr [bp-0BF8h], 11BCh
		mov	word ptr [bp-0BF8h], 11C8h
		mov	word ptr [bp-0BF8h], 11D8h
		mov	word ptr [bp-0BF8h], 11E8h
		mov	word ptr [bp-0BF8h], 11FCh
		lea	ax, [bp-0BAEh]
		push	ax
		push	0
		push	word ptr [bp-0B91h]
		push	word ptr [bp-0B93h]
		push	word ptr [bp-0B95h]
		push	word ptr [bp-0B97h]
		lea	ax, [bp-0BF8h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_97DC6
; ���������������������������������������������������������������������������

loc_97D99:				; CODE XREF: sub_94A30:loc_97D4Aj
					; sub_94A30+3323j
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_97DA6:				; CODE XREF: sub_94A30+325Dj
		mov	ax, [bp+var_BB5]
		cmp	ax, [bp+var_4]
		jnb	short loc_97DB6
		cmp	[bp+var_BB3], 0
		jz	short loc_97DBB

loc_97DB6:				; CODE XREF: sub_94A30+337Dj
		mov	ax, 1
		jmp	short loc_97DBD
; ���������������������������������������������������������������������������

loc_97DBB:				; CODE XREF: sub_94A30+3384j
		xor	ax, ax

loc_97DBD:				; CODE XREF: sub_94A30+3389j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_97DC6
		jmp	loc_97C90
; ���������������������������������������������������������������������������

loc_97DC6:				; CODE XREF: sub_94A30+2F56j
					; sub_94A30+3367j ...
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		lea	ax, [bp+var_BE2+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_BD7], 0
		jz	short loc_97E12
		cmp	[bp+var_BDC], 0
		jz	short loc_97E12
		push	0
		mov	al, [bp+var_BD8]
		push	ax
		lea	ax, [bp+var_BDC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97E12:				; CODE XREF: sub_94A30+33BFj
					; sub_94A30+33C7j
		mov	[bp+var_BDC], 0
		mov	[bp+var_BD7], 0
		mov	[bp+var_BD6], 0
		cmp	byte ptr [bp+var_AE+3],	0
		jz	short loc_97E51
		cmp	[bp+var_B2+2], 0
		jz	short loc_97E51
		push	0
		mov	al, byte ptr [bp+var_AE+2]
		push	ax
		lea	ax, [bp+var_B2+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97E51:				; CODE XREF: sub_94A30+33FEj
					; sub_94A30+3406j
		mov	[bp+var_B2+2], 0
		mov	byte ptr [bp+var_AE+3],	0
		mov	[bp+var_AA], 0
		push	0
		lea	ax, [bp+var_BD2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_BAE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B8E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_97EBB
		cmp	[bp+var_90], 0
		jz	short loc_97EBB
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97EBB:				; CODE XREF: sub_94A30+3468j
					; sub_94A30+3470j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_97F05
		cmp	[bp+var_80], 0
		jz	short loc_97F05
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97F05:				; CODE XREF: sub_94A30+34B5j
					; sub_94A30+34BCj
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_97F4B
		cmp	[bp+var_70], 0
		jz	short loc_97F4B
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97F4B:				; CODE XREF: sub_94A30+34FBj
					; sub_94A30+3502j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_97F83
		cmp	[bp+var_66], 0
		jz	short loc_97F83
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97F83:				; CODE XREF: sub_94A30+3533j
					; sub_94A30+353Aj
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_97FBB
		cmp	[bp+var_5C], 0
		jz	short loc_97FBB
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97FBB:				; CODE XREF: sub_94A30+356Bj
					; sub_94A30+3572j
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_97FF3
		cmp	[bp+var_52], 0
		jz	short loc_97FF3
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_97FF3:				; CODE XREF: sub_94A30+35A3j
					; sub_94A30+35AAj
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_9802B
		cmp	[bp+var_48], 0
		jz	short loc_9802B
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9802B:				; CODE XREF: sub_94A30+35DBj
					; sub_94A30+35E2j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_98063
		cmp	[bp+var_3E], 0
		jz	short loc_98063
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_98063:				; CODE XREF: sub_94A30+3613j
					; sub_94A30+361Aj
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_9809B
		cmp	[bp+var_34], 0
		jz	short loc_9809B
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9809B:				; CODE XREF: sub_94A30+364Bj
					; sub_94A30+3652j
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_B76], 185Fh
		lea	ax, [bp+var_B76]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B61], 0
		jz	short loc_980EA
		cmp	[bp+var_B66], 0
		jz	short loc_980EA
		push	0
		mov	al, [bp+var_B62]
		push	ax
		lea	ax, [bp+var_B66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_980EA:				; CODE XREF: sub_94A30+3697j
					; sub_94A30+369Fj
		mov	[bp+var_B66], 0
		mov	[bp+var_B61], 0
		mov	[bp+var_B60], 0
		lea	ax, [bp+var_350]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_347], 0
		jz	short loc_98136
		cmp	[bp+var_34C], 0
		jz	short loc_98136
		push	0
		mov	al, [bp+var_348]
		push	ax
		lea	ax, [bp+var_34C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_98136:				; CODE XREF: sub_94A30+36E3j
					; sub_94A30+36EBj
		mov	[bp+var_34C], 0
		mov	[bp+var_347], 0
		mov	[bp+var_346], 0
		push	2
		lea	ax, [bp+var_342]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_98180
		cmp	[bp+var_28], 0
		jz	short loc_98180
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_98180:				; CODE XREF: sub_94A30+3730j
					; sub_94A30+3737j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_2CA]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_252]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1DA]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_162]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_154]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_94A30	endp

ovr204		ends
