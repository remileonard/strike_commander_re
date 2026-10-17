ovr201		segment	para public 'OVERLAY' use16
		assume cs:ovr201
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_81470	proc far		; CODE XREF: sub_424A0J

var_BFC		= word ptr -0BFCh
var_BCC		= word ptr -0BCCh
var_B9F		= dword	ptr -0B9Fh
var_B9B		= dword	ptr -0B9Bh
var_B97		= dword	ptr -0B97h
var_B8A		= word ptr -0B8Ah
var_B86		= dword	ptr -0B86h
var_B82		= word ptr -0B82h
var_B80		= dword	ptr -0B80h
var_B7C		= byte ptr -0B7Ch
var_B7B		= byte ptr -0B7Bh
var_B7A		= dword	ptr -0B7Ah
var_B76		= word ptr -0B76h
var_B62		= word ptr -0B62h
var_B60		= word ptr -0B60h
var_B5E		= dword	ptr -0B5Eh
var_B5A		= byte ptr -0B5Ah
var_B59		= word ptr -0B59h
var_B57		= byte ptr -0B57h
var_B54		= word ptr -0B54h
var_B52		= word ptr -0B52h
var_B40		= word ptr -0B40h
var_B3B		= word ptr -0B3Bh
var_B39		= word ptr -0B39h
var_B37		= word ptr -0B37h
var_B35		= word ptr -0B35h
var_B32		= word ptr -0B32h
var_B1A		= word ptr -0B1Ah
var_B18		= word ptr -0B18h
var_B0A		= dword	ptr -0B0Ah
var_B06		= byte ptr -0B06h
var_B05		= byte ptr -0B05h
var_B04		= dword	ptr -0B04h
var_2FD		= dword	ptr -2FDh
var_2F9		= dword	ptr -2F9h
var_2F4		= word ptr -2F4h
var_2F2		= word ptr -2F2h
var_2F0		= dword	ptr -2F0h
var_2EC		= byte ptr -2ECh
var_2EB		= byte ptr -2EBh
var_2EA		= dword	ptr -2EAh
var_2E6		= word ptr -2E6h
var_26E		= word ptr -26Eh
var_1F6		= word ptr -1F6h
var_17E		= word ptr -17Eh
var_17C		= word ptr -17Ch
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_176		= word ptr -176h
var_174		= word ptr -174h
var_170		= word ptr -170h
var_16E		= word ptr -16Eh
var_16C		= word ptr -16Ch
var_16A		= word ptr -16Ah
var_168		= word ptr -168h
var_166		= word ptr -166h
var_162		= word ptr -162h
var_112		= word ptr -112h
var_110		= dword	ptr -110h
var_10C		= word ptr -10Ch
var_10A		= dword	ptr -10Ah
var_106		= dword	ptr -106h
var_102		= word ptr -102h
var_100		= dword	ptr -100h
var_FC		= word ptr -0FCh
var_FA		= dword	ptr -0FAh
var_F6		= dword	ptr -0F6h
var_F2		= dword	ptr -0F2h
var_EE		= byte ptr -0EEh
var_ED		= byte ptr -0EDh
var_EC		= dword	ptr -0ECh
var_E8		= word ptr -0E8h
var_E6		= dword	ptr -0E6h
var_E2		= dword	ptr -0E2h
var_DE		= word ptr -0DEh
var_DC		= word ptr -0DCh
var_DA		= word ptr -0DAh
var_D8		= word ptr -0D8h
var_D6		= word ptr -0D6h
var_D4		= word ptr -0D4h
var_D2		= word ptr -0D2h
var_D0		= word ptr -0D0h
var_CE		= word ptr -0CEh
var_CC		= word ptr -0CCh
var_CA		= word ptr -0CAh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= byte ptr -0C0h
var_BF		= byte ptr -0BFh
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= byte ptr -0B6h
var_B5		= byte ptr -0B5h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= byte ptr -0ACh
var_AB		= byte ptr -0ABh
var_AA		= dword	ptr -0AAh
var_A6		= word ptr -0A6h
var_A4		= byte ptr -0A4h
var_A3		= word ptr -0A3h
var_A0		= dword	ptr -0A0h
var_9C		= byte ptr -9Ch
var_9B		= byte ptr -9Bh
var_9A		= dword	ptr -9Ah
var_96		= word ptr -96h
var_94		= byte ptr -94h
var_93		= word ptr -93h
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
var_2A		= word ptr -2Ah
var_28		= byte ptr -28h
var_26		= dword	ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
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
		sub	sp, 0BFCh
		push	si
		push	di
		mov	[bp+var_2], 2156h
		mov	[bp+var_6], 0
		push	0C8h ; '�'
		push	1Dh
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	byte_495FC, 0
		mov	[bp+var_9], 0
		mov	[bp+var_A], 0
		mov	[bp+var_B], 0
		cmp	word_4684B, 0
		jz	short loc_814B0
		mov	[bp+var_A], 1

loc_814B0:				; CODE XREF: sub_81470+3Aj
		mov	ax, word_46F46
		mov	[bp+var_E], ax
		mov	[bp+var_170], 0
		mov	[bp+var_16E], 0
		push	[bp+var_E]
		lea	ax, [bp+var_170]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_17E], 0
		mov	[bp+var_17C], 0
		mov	[bp+var_17A], 0
		mov	[bp+var_178], 0
		mov	[bp+var_176], 13Fh
		mov	[bp+var_174], 9Dh ; '�'
		push	0
		lea	ax, [bp+var_17E]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_17E]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_16C], 0
		mov	[bp+var_16A], 18h
		mov	[bp+var_168], 13Fh
		mov	[bp+var_166], 97h ; '�'
		mov	byte ptr [bp+var_1C], 0
		mov	byte ptr [bp+var_1C+1],	0
		mov	[bp+var_1A], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid12	; "mid12"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_162]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_162]
		push	ax
		lea	ax, [bp+var_1F6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid12voc ; "mid12voc"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_162]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_26E]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	[bp+var_A], 0
		jz	short loc_815CE
		push	ds
		lea	ax, [bp+var_162]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_815CE
		push	1
		lea	ax, [bp+var_162]
		push	ax
		lea	ax, [bp+var_26E]
		push	ax
		mov	bx, [bp+var_26E]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_815D2
; ���������������������������������������������������������������������������

loc_815CE:				; CODE XREF: sub_81470+132j
					; sub_81470+144j
		mov	[bp+var_A], 0

loc_815D2:				; CODE XREF: sub_81470+15Cj
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		mov	al, byte_46848
		mov	[bp+var_28], al
		lea	ax, [bp+var_2E6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_28]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_81612
		cmp	ax, 2
		jnz	short loc_8160F
		jmp	loc_81788
; ���������������������������������������������������������������������������

loc_8160F:				; CODE XREF: sub_81470+19Aj
		jmp	loc_818FD
; ���������������������������������������������������������������������������

loc_81612:				; CODE XREF: sub_81470+195j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_162]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_162]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_81640
		jmp	loc_81747
; ���������������������������������������������������������������������������

loc_81640:				; CODE XREF: sub_81470+1CBj
		push	1
		lea	ax, [bp+var_162]
		push	ax
		lea	ax, [bp+var_2E6]
		push	ax
		mov	bx, [bp+var_2E6]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_15 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_162]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_BFC]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_BFC], 556h
		mov	[bp+var_B9B], 100h
		mov	[bp+var_B9F], 0
		mov	[bp+var_BFC], 56Eh
		push	1
		lea	ax, [bp+var_162]
		push	ax
		lea	ax, [bp+var_BFC]
		push	ax
		mov	bx, [bp+var_BFC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	[bp+var_DE], 1
		jmp	short loc_8170D
; ���������������������������������������������������������������������������

loc_816F2:				; CODE XREF: sub_81470+2A2j
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, [bp+var_DE]
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	[bp+var_DE]

loc_8170D:				; CODE XREF: sub_81470+280j
		cmp	[bp+var_DE], 6Ah ; 'j'
		jle	short loc_816F2
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_B], 1
		mov	[bp+var_BFC], 56Eh
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_BFC]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_81747:				; CODE XREF: sub_81470+1CDj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_162]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_162]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_81785
		mov	[bp+var_9], 1
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_81785
		mov	word_48F76, 5Ah	; 'Z'

loc_81785:				; CODE XREF: sub_81470+300j
					; sub_81470+30Dj
		jmp	loc_818FD
; ���������������������������������������������������������������������������

loc_81788:				; CODE XREF: sub_81470+19Cj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_162]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_162]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_817B6
		jmp	loc_818BD
; ���������������������������������������������������������������������������

loc_817B6:				; CODE XREF: sub_81470+341j
		push	1
		lea	ax, [bp+var_162]
		push	ax
		lea	ax, [bp+var_2E6]
		push	ax
		mov	bx, [bp+var_2E6]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_16 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_162]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_BFC]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_BFC], 556h
		mov	[bp+var_B9B], 100h
		mov	[bp+var_B9F], 0
		mov	[bp+var_BFC], 56Eh
		push	1
		lea	ax, [bp+var_162]
		push	ax
		lea	ax, [bp+var_BFC]
		push	ax
		mov	bx, [bp+var_BFC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	[bp+var_DE], 1
		jmp	short loc_81883
; ���������������������������������������������������������������������������

loc_81868:				; CODE XREF: sub_81470+418j
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, [bp+var_DE]
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	[bp+var_DE]

loc_81883:				; CODE XREF: sub_81470+3F6j
		cmp	[bp+var_DE], 6Ah ; 'j'
		jle	short loc_81868
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_B], 1
		mov	[bp+var_BFC], 56Eh
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_BFC]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_818BD:				; CODE XREF: sub_81470+343j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_162]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_162]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_818FB
		mov	[bp+var_9], 1
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_818FB
		mov	word_48F76, 0FFh

loc_818FB:				; CODE XREF: sub_81470+476j
					; sub_81470+483j
		jmp	short $+2

loc_818FD:				; CODE XREF: sub_81470:loc_8160Fj
					; sub_81470:loc_81785j
		mov	ax, word_45174
		mov	[bp+var_2A], ax
		cmp	[bp+var_B], 0
		jnz	short loc_8190C
		jmp	loc_81A46
; ���������������������������������������������������������������������������

loc_8190C:				; CODE XREF: sub_81470+497j
		mov	[bp+var_B5E], 0
		mov	[bp+var_B5A], 2
		mov	byte ptr [bp+var_B59], 0
		mov	dword ptr [bp+var_B59+1], 0
		mov	[bp+var_B62], 0
		mov	[bp+var_B60], 0FFFFh
		push	word_46849
		lea	ax, [bp+var_B62]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		mov	[bp+var_DE], 0
		jmp	loc_819F0
; ���������������������������������������������������������������������������

loc_8194E:				; CODE XREF: sub_81470+587j
		mov	dword ptr [bp+var_E8], 0
		mov	byte ptr [bp+var_E6+2],	2
		mov	byte ptr [bp+var_E6+3],	0
		mov	[bp+var_E2], 0
		push	3
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_2A]
		mov	bx, [bp+var_DE]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_B62]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_B62]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_E6+3],	0
		jz	short loc_819D5
		cmp	dword ptr [bp+var_E8], 0
		jz	short loc_819D5
		push	0
		mov	al, byte ptr [bp+var_E6+2]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_819D5:				; CODE XREF: sub_81470+542j
					; sub_81470+54Aj
		mov	dword ptr [bp+var_E8], 0
		mov	byte ptr [bp+var_E6+3],	0
		mov	[bp+var_E2], 0
		inc	[bp+var_DE]

loc_819F0:				; CODE XREF: sub_81470+4DBj
		cmp	[bp+var_DE], 2
		jge	short loc_819FA
		jmp	loc_8194E
; ���������������������������������������������������������������������������

loc_819FA:				; CODE XREF: sub_81470+585j
		lea	ax, [bp+var_B62]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_B59], 0
		jz	short loc_81A2F
		cmp	[bp+var_B5E], 0
		jz	short loc_81A2F
		push	0
		mov	al, [bp+var_B5A]
		push	ax
		lea	ax, [bp+var_B5E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_81A2F:				; CODE XREF: sub_81470+59Cj
					; sub_81470+5A4j
		mov	[bp+var_B5E], 0
		mov	byte ptr [bp+var_B59], 0
		mov	dword ptr [bp+var_B59+1], 0

loc_81A46:				; CODE XREF: sub_81470+499j
		mov	[bp+var_2F0], 0
		mov	[bp+var_2EC], 2
		mov	[bp+var_2EB], 0
		mov	[bp+var_2EA], 0
		mov	[bp+var_2F4], 0
		mov	[bp+var_2F2], 0FFFFh
		cmp	[bp+var_9], 0
		jz	short loc_81AE7
		push	1
		lea	ax, [bp+var_162]
		push	ax
		lea	ax, [bp+var_BCC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	[bp+var_A], 0
		jz	short loc_81A95
		mov	byte ptr [bp+var_DE+1],	7
		jmp	short loc_81A9A
; ���������������������������������������������������������������������������

loc_81A95:				; CODE XREF: sub_81470+61Cj
		mov	byte ptr [bp+var_DE+1],	6

loc_81A9A:				; CODE XREF: sub_81470+623j
		push	3
		lea	ax, [bp+var_26]
		push	ax
		mov	al, byte ptr [bp+var_DE+1]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_BCC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_2F4]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_2F4]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_BCC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_81AE7:				; CODE XREF: sub_81470+602j
		mov	[bp+var_B1A], 185Fh
		mov	[bp+var_B0A], 0
		mov	[bp+var_B06], 2
		mov	[bp+var_B05], 0
		mov	[bp+var_B04], 0
		mov	[bp+var_B18], 0
		mov	[bp+var_B1A], 186Fh
		xor	eax, eax
		mov	[bp+var_2FD], eax
		mov	[bp+var_2F9], eax
		cmp	[bp+var_A], 0
		jnz	short loc_81B2B
		jmp	loc_81C4F
; ���������������������������������������������������������������������������

loc_81B2B:				; CODE XREF: sub_81470+6B6j
		push	word_4684B
		lea	ax, [bp+var_B1A]
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_17 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_162]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_BFC]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_BFC], 556h
		mov	[bp+var_B9B], 100h
		mov	[bp+var_B9F], 0
		mov	[bp+var_BFC], 56Eh
		push	1
		lea	ax, [bp+var_162]
		push	ax
		lea	ax, [bp+var_BFC]
		push	ax
		mov	bx, [bp+var_BFC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3231474Dh
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		mov	[bp+var_DE], 0
		jmp	short loc_81C16
; ���������������������������������������������������������������������������

loc_81BC8:				; CODE XREF: sub_81470+7ABj
		push	1
		push	large 54584554h
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	ax, [bp+var_B8A]
		mov	word ptr [bp+var_E2+2],	ax
		movsx	eax, word ptr [bp+var_E2+2]
		push	eax
		push	ds
		mov	ax, [bp+var_8]
		imul	[bp+var_DE]
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_B86]
		mov	[bp+var_B97], eax
		inc	[bp+var_DE]

loc_81C16:				; CODE XREF: sub_81470+756j
		cmp	[bp+var_DE], 2
		jl	short loc_81BC8
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_BFC], 56Eh
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_BFC]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		jmp	loc_81EBA
; ���������������������������������������������������������������������������

loc_81C4F:				; CODE XREF: sub_81470+6B8j
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_18 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_162]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_BFC]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_BFC], 556h
		mov	[bp+var_B9B], 100h
		mov	[bp+var_B9F], 0
		mov	[bp+var_BFC], 56Eh
		push	1
		lea	ax, [bp+var_162]
		push	ax
		lea	ax, [bp+var_BFC]
		push	ax
		mov	bx, [bp+var_BFC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3231474Dh
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		mov	[bp+var_DE], 0
		jmp	short loc_81D29
; ���������������������������������������������������������������������������

loc_81CDB:				; CODE XREF: sub_81470+8BEj
		push	1
		push	large 54584554h
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	ax, [bp+var_B8A]
		mov	word ptr [bp+var_E2+2],	ax
		movsx	eax, word ptr [bp+var_E2+2]
		push	eax
		push	ds
		mov	ax, [bp+var_8]
		imul	[bp+var_DE]
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_B86]
		mov	[bp+var_B97], eax
		inc	[bp+var_DE]

loc_81D29:				; CODE XREF: sub_81470+869j
		cmp	[bp+var_DE], 1Dh
		jl	short loc_81CDB
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_81DA5
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
		jmp	loc_81E98
; ���������������������������������������������������������������������������

loc_81DA5:				; CODE XREF: sub_81470+8DAj
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_81E0D
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
		jmp	loc_81E98
; ���������������������������������������������������������������������������

loc_81E0D:				; CODE XREF: sub_81470+942j
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_81E74
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
		jmp	short loc_81E98
; ���������������������������������������������������������������������������

loc_81E74:				; CODE XREF: sub_81470+9AAj
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

loc_81E98:				; CODE XREF: sub_81470+932j
					; sub_81470+99Aj ...
		mov	[bp+var_BFC], 56Eh
		lea	ax, [bp+var_BFC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_BFC]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_81EBA:				; CODE XREF: sub_81470+7DCj
		mov	[bp+var_34], 0
		mov	[bp+var_30], 2
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		push	3
		lea	ax, [bp+var_34]
		push	ax
		push	4
		lea	ax, [bp+var_1F6]
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
		push	3
		lea	ax, [bp+var_1F6]
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
		push	5
		lea	ax, [bp+var_1F6]
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
		push	8
		lea	ax, [bp+var_1F6]
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
		push	9
		lea	ax, [bp+var_1F6]
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
		push	6
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_70], 0
		mov	[bp+var_6C], 2
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
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
		push	15h
		lea	ax, [bp+var_1F6]
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
		push	2
		lea	ax, [bp+var_90]
		push	ax
		push	14h
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_93], 0
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_A0], 0
		mov	[bp+var_9C], 2
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_A0]
		push	ax
		push	16h
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_A3], 0
		lea	ax, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_B0], 0
		mov	[bp+var_AC], 2
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	3
		lea	ax, [bp+var_B0]
		push	ax
		push	218Ch
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, [bp+var_BA]
		push	ax
		push	2190h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_C4], 0
		mov	[bp+var_C0], 2
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		push	ds
		push	offset unk_451C2
		push	ds
		push	offset aConvfont_shp_2 ; "convfont.shp"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_162]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_162]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_C8+2],	dx
		mov	word ptr [bp+var_C8], ax
		mov	eax, [bp+var_C8]
		mov	[bp+var_C4], eax
		mov	[bp+var_C0], 2
		mov	[bp+var_BF], 1
		mov	[bp+var_BE], 0
		lea	ax, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_B32]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_D0], 0
		mov	[bp+var_CE], 98h ; '�'
		mov	[bp+var_CC], 13Fh
		mov	[bp+var_CA], 0C7h ; '�'
		mov	ax, word_46F46
		mov	[bp+var_D2], ax
		lea	ax, [bp+var_B32]
		push	ax
		push	[bp+var_D2]
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_B54], 1218h
		mov	ax, [bp+var_CE]
		mov	[bp+var_D4], ax
		mov	ax, [bp+var_CC]
		mov	[bp+var_D6], ax
		mov	ax, [bp+var_CA]
		mov	[bp+var_D8], ax
		mov	ax, [bp+var_D0]
		mov	[bp+var_B3B], ax
		mov	ax, [bp+var_D4]
		mov	[bp+var_B39], ax
		mov	ax, [bp+var_D6]
		mov	[bp+var_B37], ax
		mov	ax, [bp+var_D8]
		mov	[bp+var_B35], ax
		push	0
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C8h ; '�'
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_82250
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_82250:				; CODE XREF: sub_81470+DDBj
		cmp	[bp+var_9], 0
		jz	short loc_8229A
		mov	ax, word_48F76
		mov	[bp+var_DA], ax
		mov	[bp+var_DC], 0
		cmp	[bp+var_2F4], 0
		jz	short loc_8229A
		push	[bp+var_2F2]
		mov	bx, [bp+var_2F4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_DC]
		push	[bp+var_DA]
		push	[bp+var_2F2]
		mov	bx, [bp+var_2F4]
		push	word ptr [bx+4]
		call	sub_30C66
		add	sp, 8
		jmp	short $+2

loc_8229A:				; CODE XREF: sub_81470+DE4j
					; sub_81470+DF8j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2], 2
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		push	3
		lea	ax, [bp+var_E6]
		push	ax
		push	1
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_F2+2], 0
		mov	byte ptr [bp+var_EC], 2
		mov	byte ptr [bp+var_EC+1],	0
		mov	dword ptr [bp-0EAh], 0
		push	2
		lea	ax, [bp+var_F2+2]
		push	ax
		push	12h
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_F6+3],	0
		lea	ax, [bp+var_F2+2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		lea	ax, [bp+var_E6]
		push	ax
		push	0
		call	sub_2DE95
		add	sp, 4
		mov	word ptr [bp+var_FA+2],	ax
		push	word ptr [bp+var_F6]
		mov	al, byte ptr [bp+var_F6+2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_FA+2]
		lea	ax, [bp+var_B76]
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
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	word ptr [bp+var_F6]
		mov	al, byte ptr [bp+var_F6+2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeFromColor_2D165
		add	sp, 0Ah
		push	0
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0EFh ; '�'
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		jmp	loc_824B4
; ���������������������������������������������������������������������������

loc_823F0:				; CODE XREF: sub_81470+105Fj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_FA], ax
		cmp	word ptr [bp+var_FA], 8
		jnz	short loc_8240F
		push	[bp+var_6]
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8240F:				; CODE XREF: sub_81470+F8Dj
		cmp	word ptr [bp+var_FA], 1Ch
		jnz	short loc_82458
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_82458:				; CODE XREF: sub_81470+FA4j
		jmp	short loc_824A7
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_824A7
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_824D2
; ���������������������������������������������������������������������������

loc_824A7:				; CODE XREF: sub_81470:loc_82458j
					; sub_81470+FF1j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_824B4:				; CODE XREF: sub_81470+F7Dj
		cmp	[bp+var_B59], 1Dh
		jnb	short loc_824C2
		cmp	[bp+var_B57], 0
		jz	short loc_824C7

loc_824C2:				; CODE XREF: sub_81470+1049j
		mov	ax, 1
		jmp	short loc_824C9
; ���������������������������������������������������������������������������

loc_824C7:				; CODE XREF: sub_81470+1050j
		xor	ax, ax

loc_824C9:				; CODE XREF: sub_81470+1055j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_824D2
		jmp	loc_823F0
; ���������������������������������������������������������������������������

loc_824D2:				; CODE XREF: sub_81470+1035j
					; sub_81470+105Dj
		jmp	loc_8259D
; ���������������������������������������������������������������������������

loc_824D5:				; CODE XREF: sub_81470+1148j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_FA], ax
		cmp	word ptr [bp+var_FA], 20h ; ' '
		jnz	short loc_824F8
		mov	ax, [bp+var_6]
		add	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_824F8:				; CODE XREF: sub_81470+1072j
		cmp	word ptr [bp+var_FA], 35h ; '5'
		jnz	short loc_82541
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_82541:				; CODE XREF: sub_81470+108Dj
		jmp	short loc_82590
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_82590
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_825BB
; ���������������������������������������������������������������������������

loc_82590:				; CODE XREF: sub_81470:loc_82541j
					; sub_81470+10DAj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8259D:				; CODE XREF: sub_81470:loc_824D2j
		cmp	[bp+var_B59], 37h ; '7'
		jnb	short loc_825AB
		cmp	[bp+var_B57], 0
		jz	short loc_825B0

loc_825AB:				; CODE XREF: sub_81470+1132j
		mov	ax, 1
		jmp	short loc_825B2
; ���������������������������������������������������������������������������

loc_825B0:				; CODE XREF: sub_81470+1139j
		xor	ax, ax

loc_825B2:				; CODE XREF: sub_81470+113Ej
		mov	ah, 0
		or	ax, ax
		jnz	short loc_825BB
		jmp	loc_824D5
; ���������������������������������������������������������������������������

loc_825BB:				; CODE XREF: sub_81470+111Ej
					; sub_81470+1146j
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_F6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_EC+1],	0
		jz	short loc_82618
		cmp	[bp+var_F2+2], 0
		jz	short loc_82618
		push	0
		mov	al, byte ptr [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F2+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_82618:				; CODE XREF: sub_81470+1185j
					; sub_81470+118Dj
		mov	[bp+var_F2+2], 0
		mov	byte ptr [bp+var_EC+1],	0
		mov	dword ptr [bp-0EAh], 0
		cmp	byte ptr [bp+var_E2+1],	0
		jz	short loc_82657
		cmp	[bp+var_E6], 0
		jz	short loc_82657
		push	0
		mov	al, byte ptr [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_82657:				; CODE XREF: sub_81470+11C4j
					; sub_81470+11CCj
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		cmp	byte_495FC, 0
		jz	short loc_82678
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_82678:				; CODE XREF: sub_81470+1203j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2], 2
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		push	3
		lea	ax, [bp+var_E6]
		push	ax
		push	7
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_48]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_E8], ax
		push	0
		push	0
		push	0C8h ; '�'
		push	0
		push	11h
		push	2Ch ; ','
		lea	ax, [bp+var_66]
		push	ax
		push	0
		call	sub_9391
		add	sp, 10h
		mov	word ptr [bp+var_EC+2],	ax
		push	0
		push	0
		push	0C8h ; '�'
		push	0
		push	11h
		push	2Ch ; ','
		lea	ax, [bp+var_E6]
		push	ax
		push	0
		call	sub_9391
		add	sp, 10h
		mov	word ptr [bp+var_EC], ax
		push	[bp+var_A6]
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_E8]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_EC+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_EC]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [bp+var_EE], 0
		jmp	loc_82828
; ���������������������������������������������������������������������������

loc_8278F:				; CODE XREF: sub_81470+13D3j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_F2+2],	ax
		cmp	word ptr [bp+var_F2+2],	7
		jle	short loc_827BC
		cmp	word ptr [bp+var_F2+2],	0Dh
		jge	short loc_827BC
		mov	ax, word ptr [bp+var_EE]
		mov	word ptr [bp+var_F2], ax
		inc	word ptr [bp+var_EE]
		mov	bx, word ptr [bp+var_EC]
		mov	ax, word ptr [bp+var_F2]
		mov	[bx+1Bh], ax

loc_827BC:				; CODE XREF: sub_81470+132Cj
					; sub_81470+1333j
		cmp	word ptr [bp+var_F2+2],	18h
		jle	short loc_827E1
		cmp	word ptr [bp+var_F2+2],	1Ch
		jge	short loc_827E1
		dec	word ptr [bp+var_EE]
		mov	ax, word ptr [bp+var_EE]
		mov	word ptr [bp+var_F6+2],	ax
		mov	bx, word ptr [bp+var_EC]
		mov	ax, word ptr [bp+var_F6+2]
		mov	[bx+1Bh], ax

loc_827E1:				; CODE XREF: sub_81470+1351j
					; sub_81470+1358j
		cmp	word ptr [bp+var_F2+2],	1Ch
		jle	short loc_8280E
		cmp	word ptr [bp+var_F2+2],	20h ; ' '
		jge	short loc_8280E
		test	word ptr [bp+var_F2+2],	1
		jz	short loc_8280E
		dec	word ptr [bp+var_EE]
		mov	ax, word ptr [bp+var_EE]
		mov	word ptr [bp+var_F6], ax
		mov	bx, word ptr [bp+var_EC]
		mov	ax, word ptr [bp+var_F6]
		mov	[bx+1Bh], ax

loc_8280E:				; CODE XREF: sub_81470+1376j
					; sub_81470+137Dj ...
		jmp	short loc_8281B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8281B
		jmp	short loc_82846
; ���������������������������������������������������������������������������

loc_8281B:				; CODE XREF: sub_81470:loc_8280Ej
					; sub_81470+13A7j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_82828:				; CODE XREF: sub_81470+131Cj
		cmp	[bp+var_B59], 2Ah ; '*'
		jnb	short loc_82836
		cmp	[bp+var_B57], 0
		jz	short loc_8283B

loc_82836:				; CODE XREF: sub_81470+13BDj
		mov	ax, 1
		jmp	short loc_8283D
; ���������������������������������������������������������������������������

loc_8283B:				; CODE XREF: sub_81470+13C4j
		xor	ax, ax

loc_8283D:				; CODE XREF: sub_81470+13C9j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_82846
		jmp	loc_8278F
; ���������������������������������������������������������������������������

loc_82846:				; CODE XREF: sub_81470+13A9j
					; sub_81470+13D1j
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_E2+1],	0
		jz	short loc_8287D
		cmp	[bp+var_E6], 0
		jz	short loc_8287D
		push	0
		mov	al, byte ptr [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8287D:				; CODE XREF: sub_81470+13EAj
					; sub_81470+13F2j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		cmp	byte_495FC, 0
		jz	short loc_8289E
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_8289E:				; CODE XREF: sub_81470+1429j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2], 2
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		push	3
		lea	ax, [bp+var_E6]
		push	ax
		push	0Fh
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_F2+2], 0
		mov	byte ptr [bp+var_EC], 2
		mov	byte ptr [bp+var_EC+1],	0
		mov	[bp+var_EC+2], 0
		push	3
		lea	ax, [bp+var_F2+2]
		push	ax
		push	0Eh
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_FA], 0
		mov	byte ptr [bp+var_F6], 2
		mov	byte ptr [bp+var_F6+1],	0
		mov	[bp+var_F6+2], 0
		push	2
		lea	ax, [bp+var_FA]
		push	ax
		push	18h
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_100+3], 0
		lea	ax, [bp+var_FA]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_102], ax
		push	0
		push	0
		lea	ax, [bp+var_E6]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_106+2], ax
		push	0
		push	0Ah
		push	0D7h ; '�'
		lea	ax, [bp+var_F2+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_106], ax
		push	[bp+var_102]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_106+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_106]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_100]
		mov	al, byte ptr [bp+var_100+2]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_82A3D
		jmp	loc_82B61
; ���������������������������������������������������������������������������

loc_82A3D:				; CODE XREF: sub_81470+15C8j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C], 2
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		push	2
		lea	ax, [bp+var_110]
		push	ax
		push	5
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, [bp+var_B1A]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	[bp+var_112], 0
		jmp	short loc_82ACF
; ���������������������������������������������������������������������������

loc_82A96:				; CODE XREF: sub_81470+1664j
		cmp	[bp+var_112], 1
		jle	short loc_82ABE
		cmp	[bp+var_112], 7
		jge	short loc_82ABE
		push	0
		mov	ax, [bp+var_112]
		add	ax, 0FFF3h
		push	ax
		push	word ptr [bp+var_106]
		mov	bx, word ptr [bp+var_106]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_82ABE:				; CODE XREF: sub_81470+162Bj
					; sub_81470+1632j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_112]

loc_82ACF:				; CODE XREF: sub_81470+1624j
		cmp	[bp+var_112], 8
		jl	short loc_82A96
		push	0FFFFh
		lea	ax, [bp+var_B1A]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_82B01
; ���������������������������������������������������������������������������

loc_82AE7:				; CODE XREF: sub_81470+16A0j
		jmp	short loc_82AF4
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_82AF4
		jmp	short loc_82B12
; ���������������������������������������������������������������������������

loc_82AF4:				; CODE XREF: sub_81470:loc_82AE7j
					; sub_81470+1680j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_82B01:				; CODE XREF: sub_81470+1675j
		lea	ax, [bp+var_B1A]
		push	ax
		call	sub_8500
		add	sp, 2
		or	al, al
		jnz	short loc_82AE7

loc_82B12:				; CODE XREF: sub_81470+1682j
		lea	ax, [bp+var_B1A]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_10C+1], 0
		jz	short loc_82B47
		cmp	[bp+var_110], 0
		jz	short loc_82B47
		push	0
		mov	al, byte ptr [bp+var_10C]
		push	ax
		lea	ax, [bp+var_110]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_82B47:				; CODE XREF: sub_81470+16B4j
					; sub_81470+16BCj
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		jmp	loc_82CB3
; ���������������������������������������������������������������������������

loc_82B61:				; CODE XREF: sub_81470+15CAj
		push	0
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0FEh ; '�'
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_4], 20h	; ' '
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_82C96
; ���������������������������������������������������������������������������

loc_82BA0:				; CODE XREF: sub_81470+1840j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_10A+2], ax
		cmp	word ptr [bp+var_10A+2], 1
		jle	short loc_82BD0
		cmp	word ptr [bp+var_10A+2], 7
		jge	short loc_82BD0
		push	0
		mov	ax, word ptr [bp+var_10A+2]
		add	ax, 0FFF3h
		push	ax
		push	word ptr [bp+var_106]
		mov	bx, word ptr [bp+var_106]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_82BD0:				; CODE XREF: sub_81470+173Dj
					; sub_81470+1744j
		cmp	word ptr [bp+var_10A+2], 8
		jnz	short loc_82BEF
		mov	ax, [bp+var_8]
		shl	ax, 1
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_82BEF:				; CODE XREF: sub_81470+1765j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_10A+2]
		jnz	short loc_82C3A
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_82C3A:				; CODE XREF: sub_81470+1786j
		jmp	short loc_82C89
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_82C89
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_82CB3
; ���������������������������������������������������������������������������

loc_82C89:				; CODE XREF: sub_81470:loc_82C3Aj
					; sub_81470+17D3j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_82C96:				; CODE XREF: sub_81470+172Dj
		cmp	[bp+var_B59], di
		jnb	short loc_82CA3
		cmp	[bp+var_B57], 0
		jz	short loc_82CA8

loc_82CA3:				; CODE XREF: sub_81470+182Aj
		mov	ax, 1
		jmp	short loc_82CAA
; ���������������������������������������������������������������������������

loc_82CA8:				; CODE XREF: sub_81470+1831j
		xor	ax, ax

loc_82CAA:				; CODE XREF: sub_81470+1836j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_82CB3
		jmp	loc_82BA0
; ���������������������������������������������������������������������������

loc_82CB3:				; CODE XREF: sub_81470+16EEj
					; sub_81470+1817j ...
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_100]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_F6+1],	0
		jz	short loc_82CF9
		cmp	[bp+var_FA], 0
		jz	short loc_82CF9
		push	0
		mov	al, byte ptr [bp+var_F6]
		push	ax
		lea	ax, [bp+var_FA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_82CF9:				; CODE XREF: sub_81470+1866j
					; sub_81470+186Ej
		mov	[bp+var_FA], 0
		mov	byte ptr [bp+var_F6+1],	0
		mov	[bp+var_F6+2], 0
		cmp	byte ptr [bp+var_EC+1],	0
		jz	short loc_82D38
		cmp	[bp+var_F2+2], 0
		jz	short loc_82D38
		push	0
		mov	al, byte ptr [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F2+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_82D38:				; CODE XREF: sub_81470+18A5j
					; sub_81470+18ADj
		mov	[bp+var_F2+2], 0
		mov	byte ptr [bp+var_EC+1],	0
		mov	[bp+var_EC+2], 0
		cmp	byte ptr [bp+var_E2+1],	0
		jz	short loc_82D77
		cmp	[bp+var_E6], 0
		jz	short loc_82D77
		push	0
		mov	al, byte ptr [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_82D77:				; CODE XREF: sub_81470+18E4j
					; sub_81470+18ECj
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		cmp	byte_495FC, 0
		jz	short loc_82D98
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_82D98:				; CODE XREF: sub_81470+1923j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2], 2
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		push	3
		lea	ax, [bp+var_E6]
		push	ax
		push	2
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_F2+2], 0
		mov	byte ptr [bp+var_EC], 2
		mov	byte ptr [bp+var_EC+1],	0
		mov	[bp+var_EC+2], 0
		push	2
		lea	ax, [bp+var_F2+2]
		push	ax
		push	13h
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_F6+3],	0
		lea	ax, [bp+var_F2+2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_FA+2],	ax
		push	0
		push	0FFF6h
		lea	ax, [bp+var_E6]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_FA], ax
		push	word ptr [bp+var_FA+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_FA]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_F6]
		mov	al, byte ptr [bp+var_F6+2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jz	short loc_82F07
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_FC], 0
		jmp	short loc_82EFD
; ���������������������������������������������������������������������������

loc_82EEC:				; CODE XREF: sub_81470+1A92j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_FC]

loc_82EFD:				; CODE XREF: sub_81470+1A7Aj
		cmp	[bp+var_FC], 14h
		jl	short loc_82EEC
		jmp	loc_83038
; ���������������������������������������������������������������������������

loc_82F07:				; CODE XREF: sub_81470+1A65j
		push	0
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	80h ; '�'
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_4], 1Ah
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_8301B
; ���������������������������������������������������������������������������

loc_82F46:				; CODE XREF: sub_81470+1BC5j
		mov	ax, [bp+var_B59]
		mov	[bp+var_FC], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_FC]
		jnz	short loc_82F74
		mov	ax, [bp+var_8]
		shl	ax, 1
		add	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_82F74:				; CODE XREF: sub_81470+1AE7j
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_FC]
		jnz	short loc_82FBF
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_82FBF:				; CODE XREF: sub_81470+1B0Bj
		jmp	short loc_8300E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8300E
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_83038
; ���������������������������������������������������������������������������

loc_8300E:				; CODE XREF: sub_81470:loc_82FBFj
					; sub_81470+1B58j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8301B:				; CODE XREF: sub_81470+1AD3j
		cmp	[bp+var_B59], di
		jnb	short loc_83028
		cmp	[bp+var_B57], 0
		jz	short loc_8302D

loc_83028:				; CODE XREF: sub_81470+1BAFj
		mov	ax, 1
		jmp	short loc_8302F
; ���������������������������������������������������������������������������

loc_8302D:				; CODE XREF: sub_81470+1BB6j
		xor	ax, ax

loc_8302F:				; CODE XREF: sub_81470+1BBBj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_83038
		jmp	loc_82F46
; ���������������������������������������������������������������������������

loc_83038:				; CODE XREF: sub_81470+1A94j
					; sub_81470+1B9Cj ...
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_F6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_EC+1],	0
		jz	short loc_8307E
		cmp	[bp+var_F2+2], 0
		jz	short loc_8307E
		push	0
		mov	al, byte ptr [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F2+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8307E:				; CODE XREF: sub_81470+1BEBj
					; sub_81470+1BF3j
		mov	[bp+var_F2+2], 0
		mov	byte ptr [bp+var_EC+1],	0
		mov	[bp+var_EC+2], 0
		cmp	byte ptr [bp+var_E2+1],	0
		jz	short loc_830BD
		cmp	[bp+var_E6], 0
		jz	short loc_830BD
		push	0
		mov	al, byte ptr [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_830BD:				; CODE XREF: sub_81470+1C2Aj
					; sub_81470+1C32j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		cmp	byte_495FC, 0
		jz	short loc_830DE
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_830DE:				; CODE XREF: sub_81470+1C69j
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_DE], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_E2+2],	ax
		push	[bp+var_DE]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_831BC
		jmp	loc_83498
; ���������������������������������������������������������������������������

loc_831BC:				; CODE XREF: sub_81470+1D47j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	2
		lea	ax, [bp+var_EC+2]
		push	ax
		push	6
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_EC+2]
		push	ax
		push	word ptr [bp+var_E2+2]
		call	sub_9CF7
		add	sp, 6
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_83227
; ���������������������������������������������������������������������������

loc_83216:				; CODE XREF: sub_81470+1DBCj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_83227:				; CODE XREF: sub_81470+1DA4j
		cmp	word ptr [bp+var_EC], 3
		jl	short loc_83216
		jmp	short loc_8324A
; ���������������������������������������������������������������������������

loc_83230:				; CODE XREF: sub_81470+1DE8j
		jmp	short loc_8323D
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8323D
		jmp	short loc_8325A
; ���������������������������������������������������������������������������

loc_8323D:				; CODE XREF: sub_81470:loc_83230j
					; sub_81470+1DC9j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8324A:				; CODE XREF: sub_81470+1DBEj
		push	word ptr [bp+var_E2+2]
		call	sub_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_83230

loc_8325A:				; CODE XREF: sub_81470+1DCBj
		push	16h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	[bp+var_F6], 0
		mov	byte ptr [bp+var_F2], 2
		mov	byte ptr [bp+var_F2+1],	0
		mov	[bp+var_F2+2], 0
		push	2
		lea	ax, [bp+var_F6]
		push	ax
		push	7
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_F6]
		push	ax
		push	word ptr [bp+var_E2+2]
		call	sub_9CF7
		add	sp, 6
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_832C6
; ���������������������������������������������������������������������������

loc_832B5:				; CODE XREF: sub_81470+1E5Bj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_832C6:				; CODE XREF: sub_81470+1E43j
		cmp	word ptr [bp+var_EC], 2
		jl	short loc_832B5
		jmp	short loc_832E9
; ���������������������������������������������������������������������������

loc_832CF:				; CODE XREF: sub_81470+1E87j
		jmp	short loc_832DC
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_832DC
		jmp	short loc_832F9
; ���������������������������������������������������������������������������

loc_832DC:				; CODE XREF: sub_81470:loc_832CFj
					; sub_81470+1E68j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_832E9:				; CODE XREF: sub_81470+1E5Dj
		push	word ptr [bp+var_E2+2]
		call	sub_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_832CF

loc_832F9:				; CODE XREF: sub_81470+1E6Aj
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_83312
; ���������������������������������������������������������������������������

loc_83301:				; CODE XREF: sub_81470+1EA7j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_83312:				; CODE XREF: sub_81470+1E8Fj
		cmp	word ptr [bp+var_EC], 2
		jl	short loc_83301
		push	19h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	[bp+var_100], 0
		mov	byte ptr [bp+var_FC], 2
		mov	byte ptr [bp+var_FC+1],	0
		mov	[bp+var_FA], 0
		push	2
		lea	ax, [bp+var_100]
		push	ax
		push	8
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_100]
		push	ax
		push	word ptr [bp+var_E2+2]
		call	sub_9CF7
		add	sp, 6
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_83385
; ���������������������������������������������������������������������������

loc_83374:				; CODE XREF: sub_81470+1F1Aj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_83385:				; CODE XREF: sub_81470+1F02j
		cmp	word ptr [bp+var_EC], 2
		jl	short loc_83374
		jmp	short loc_833A8
; ���������������������������������������������������������������������������

loc_8338E:				; CODE XREF: sub_81470+1F46j
		jmp	short loc_8339B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8339B
		jmp	short loc_833B8
; ���������������������������������������������������������������������������

loc_8339B:				; CODE XREF: sub_81470:loc_8338Ej
					; sub_81470+1F27j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_833A8:				; CODE XREF: sub_81470+1F1Cj
		push	word ptr [bp+var_E2+2]
		call	sub_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_8338E

loc_833B8:				; CODE XREF: sub_81470+1F29j
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_833D1
; ���������������������������������������������������������������������������

loc_833C0:				; CODE XREF: sub_81470+1F66j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_833D1:				; CODE XREF: sub_81470+1F4Ej
		cmp	word ptr [bp+var_EC], 4
		jl	short loc_833C0
		cmp	byte ptr [bp+var_FC+1],	0
		jz	short loc_83400
		cmp	[bp+var_100], 0
		jz	short loc_83400
		push	0
		mov	al, byte ptr [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_83400:				; CODE XREF: sub_81470+1F6Dj
					; sub_81470+1F75j
		mov	[bp+var_100], 0
		mov	byte ptr [bp+var_FC+1],	0
		mov	[bp+var_FA], 0
		cmp	byte ptr [bp+var_F2+1],	0
		jz	short loc_8343F
		cmp	[bp+var_F6], 0
		jz	short loc_8343F
		push	0
		mov	al, byte ptr [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8343F:				; CODE XREF: sub_81470+1FACj
					; sub_81470+1FB4j
		mov	[bp+var_F6], 0
		mov	byte ptr [bp+var_F2+1],	0
		mov	[bp+var_F2+2], 0
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_8347E
		cmp	[bp+var_EC+2], 0
		jz	short loc_8347E
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8347E:				; CODE XREF: sub_81470+1FEBj
					; sub_81470+1FF3j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		jmp	loc_8385B
; ���������������������������������������������������������������������������

loc_83498:				; CODE XREF: sub_81470+1D49j
		push	0E0h ; '�'
		push	[bp+var_B40]
		mov	bx, [bp+var_B40]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 23h	; '#'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_835B8
; ���������������������������������������������������������������������������

loc_834CB:				; CODE XREF: sub_81470+2162j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_834F7
		mov	ax, [bp+var_8]
		shl	ax, 2
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_834F7:				; CODE XREF: sub_81470+206Cj
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83511
		push	21A3h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_83511:				; CODE XREF: sub_81470+2090j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_8355C
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8355C:				; CODE XREF: sub_81470+20A8j
		jmp	short loc_835AB
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_835AB
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_835D5
; ���������������������������������������������������������������������������

loc_835AB:				; CODE XREF: sub_81470:loc_8355Cj
					; sub_81470+20F5j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_835B8:				; CODE XREF: sub_81470+2058j
		cmp	[bp+var_B59], di
		jnb	short loc_835C5
		cmp	[bp+var_B57], 0
		jz	short loc_835CA

loc_835C5:				; CODE XREF: sub_81470+214Cj
		mov	ax, 1
		jmp	short loc_835CC
; ���������������������������������������������������������������������������

loc_835CA:				; CODE XREF: sub_81470+2153j
		xor	ax, ax

loc_835CC:				; CODE XREF: sub_81470+2158j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_835D5
		jmp	loc_834CB
; ���������������������������������������������������������������������������

loc_835D5:				; CODE XREF: sub_81470+2139j
					; sub_81470+2160j
		mov	[bp+var_4], 2Eh	; '.'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_836FD
; ���������������������������������������������������������������������������

loc_835F5:				; CODE XREF: sub_81470+22A7j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83623
		mov	ax, [bp+var_8]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_83623:				; CODE XREF: sub_81470+2196j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_8363D
		push	21ACh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8363D:				; CODE XREF: sub_81470+21BCj
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83656
		push	16h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_83656:				; CODE XREF: sub_81470+21D6j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_836A1
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_836A1:				; CODE XREF: sub_81470+21EDj
		jmp	short loc_836F0
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_836F0
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8371A
; ���������������������������������������������������������������������������

loc_836F0:				; CODE XREF: sub_81470:loc_836A1j
					; sub_81470+223Aj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_836FD:				; CODE XREF: sub_81470+2182j
		cmp	[bp+var_B59], di
		jnb	short loc_8370A
		cmp	[bp+var_B57], 0
		jz	short loc_8370F

loc_8370A:				; CODE XREF: sub_81470+2291j
		mov	ax, 1
		jmp	short loc_83711
; ���������������������������������������������������������������������������

loc_8370F:				; CODE XREF: sub_81470+2298j
		xor	ax, ax

loc_83711:				; CODE XREF: sub_81470+229Dj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8371A
		jmp	loc_835F5
; ���������������������������������������������������������������������������

loc_8371A:				; CODE XREF: sub_81470+227Ej
					; sub_81470+22A5j
		mov	[bp+var_4], 3Ch	; '<'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_8383E
; ���������������������������������������������������������������������������

loc_8373A:				; CODE XREF: sub_81470+23E8j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83766
		mov	ax, [bp+var_8]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_83766:				; CODE XREF: sub_81470+22D9j
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_8377E
		push	21C4h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8377E:				; CODE XREF: sub_81470+22FDj
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_837C9
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_837C9:				; CODE XREF: sub_81470+2315j
		mov	ax, di
		add	ax, 0FFF1h
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_837E2
		push	19h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_837E2:				; CODE XREF: sub_81470+2362j
		jmp	short loc_83831
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_83831
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8385B
; ���������������������������������������������������������������������������

loc_83831:				; CODE XREF: sub_81470:loc_837E2j
					; sub_81470+237Bj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8383E:				; CODE XREF: sub_81470+22C7j
		cmp	[bp+var_B59], di
		jnb	short loc_8384B
		cmp	[bp+var_B57], 0
		jz	short loc_83850

loc_8384B:				; CODE XREF: sub_81470+23D2j
		mov	ax, 1
		jmp	short loc_83852
; ���������������������������������������������������������������������������

loc_83850:				; CODE XREF: sub_81470+23D9j
		xor	ax, ax

loc_83852:				; CODE XREF: sub_81470+23DEj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8385B
		jmp	loc_8373A
; ���������������������������������������������������������������������������

loc_8385B:				; CODE XREF: sub_81470+2025j
					; sub_81470+23BFj ...
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_83874
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_83874:				; CODE XREF: sub_81470+23FFj
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_DE], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_E2+2],	ax
		push	[bp+var_DE]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_83952
		jmp	loc_83AC3
; ���������������������������������������������������������������������������

loc_83952:				; CODE XREF: sub_81470+24DDj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	2
		lea	ax, [bp+var_EC+2]
		push	ax
		push	0
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_EC+2]
		push	ax
		push	word ptr [bp+var_E2+2]
		call	sub_9CF7
		add	sp, 6
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_839BD
; ���������������������������������������������������������������������������

loc_839AC:				; CODE XREF: sub_81470+2552j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_839BD:				; CODE XREF: sub_81470+253Aj
		cmp	word ptr [bp+var_EC], 3
		jl	short loc_839AC
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_83A40
; ���������������������������������������������������������������������������

loc_839CC:				; CODE XREF: sub_81470+25E0j
		cmp	word ptr [bp+var_EC], 0Ah
		jnz	short loc_839E1
		push	10h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_839E1:				; CODE XREF: sub_81470+2561j
		cmp	word ptr [bp+var_EC], 0Dh
		jnz	short loc_839F6
		push	0FFFFh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_839F6:				; CODE XREF: sub_81470+2576j
		cmp	word ptr [bp+var_EC], 17h
		jnz	short loc_83A0B
		push	15h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_83A0B:				; CODE XREF: sub_81470+258Bj
		mov	ax, word ptr [bp+var_EC]
		inc	word ptr [bp+var_EC]
		cmp	ax, 1Ah
		jnz	short loc_83A26
		push	0FFFFh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_83A26:				; CODE XREF: sub_81470+25A6j
		jmp	short loc_83A33
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_83A33
		jmp	short loc_83A53
; ���������������������������������������������������������������������������

loc_83A33:				; CODE XREF: sub_81470:loc_83A26j
					; sub_81470+25BFj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_83A40:				; CODE XREF: sub_81470+255Aj
		push	word ptr [bp+var_E2+2]
		call	sub_9C64
		add	sp, 2
		or	al, al
		jz	short loc_83A53
		jmp	loc_839CC
; ���������������������������������������������������������������������������

loc_83A53:				; CODE XREF: sub_81470+25C1j
					; sub_81470+25DEj
		push	1Bh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_83A7A
; ���������������������������������������������������������������������������

loc_83A69:				; CODE XREF: sub_81470+260Fj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_83A7A:				; CODE XREF: sub_81470+25F7j
		cmp	word ptr [bp+var_EC], 6
		jl	short loc_83A69
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_83AA9
		cmp	[bp+var_EC+2], 0
		jz	short loc_83AA9
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_83AA9:				; CODE XREF: sub_81470+2616j
					; sub_81470+261Ej
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		jmp	loc_83ECF
; ���������������������������������������������������������������������������

loc_83AC3:				; CODE XREF: sub_81470+24DFj
		push	0B7h ; '�'
		push	[bp+var_B40]
		mov	bx, [bp+var_B40]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 28h	; '('
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_83C19
; ���������������������������������������������������������������������������

loc_83AF6:				; CODE XREF: sub_81470+27C3j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83B24
		mov	ax, [bp+var_8]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_83B24:				; CODE XREF: sub_81470+2697j
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83B3E
		push	21E0h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_83B3E:				; CODE XREF: sub_81470+26BDj
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83B57
		push	10h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_83B57:				; CODE XREF: sub_81470+26D7j
		mov	ax, si
		add	ax, 0Dh
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83B70
		push	0FFFFh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_83B70:				; CODE XREF: sub_81470+26F0j
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83BBD
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_83BBD:				; CODE XREF: sub_81470+2709j
		jmp	short loc_83C0C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_83C0C
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_83C36
; ���������������������������������������������������������������������������

loc_83C0C:				; CODE XREF: sub_81470:loc_83BBDj
					; sub_81470+2756j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_83C19:				; CODE XREF: sub_81470+2683j
		cmp	[bp+var_B59], di
		jnb	short loc_83C26
		cmp	[bp+var_B57], 0
		jz	short loc_83C2B

loc_83C26:				; CODE XREF: sub_81470+27ADj
		mov	ax, 1
		jmp	short loc_83C2D
; ���������������������������������������������������������������������������

loc_83C2B:				; CODE XREF: sub_81470+27B4j
		xor	ax, ax

loc_83C2D:				; CODE XREF: sub_81470+27B9j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_83C36
		jmp	loc_83AF6
; ���������������������������������������������������������������������������

loc_83C36:				; CODE XREF: sub_81470+279Aj
					; sub_81470+27C1j
		mov	[bp+var_4], 1Eh
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_83D71
; ���������������������������������������������������������������������������

loc_83C56:				; CODE XREF: sub_81470+291Bj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83C80
		mov	ax, [bp+var_8]
		shl	ax, 3
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_83C80:				; CODE XREF: sub_81470+27F5j
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83C98
		push	21ECh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_83C98:				; CODE XREF: sub_81470+2817j
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83CB1
		push	15h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_83CB1:				; CODE XREF: sub_81470+2831j
		mov	ax, si
		add	ax, 0Dh
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83CCA
		push	0FFFFh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_83CCA:				; CODE XREF: sub_81470+284Aj
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83D15
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_83D15:				; CODE XREF: sub_81470+2861j
		jmp	short loc_83D64
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_83D64
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_83D8E
; ���������������������������������������������������������������������������

loc_83D64:				; CODE XREF: sub_81470:loc_83D15j
					; sub_81470+28AEj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_83D71:				; CODE XREF: sub_81470+27E3j
		cmp	[bp+var_B59], di
		jnb	short loc_83D7E
		cmp	[bp+var_B57], 0
		jz	short loc_83D83

loc_83D7E:				; CODE XREF: sub_81470+2905j
		mov	ax, 1
		jmp	short loc_83D85
; ���������������������������������������������������������������������������

loc_83D83:				; CODE XREF: sub_81470+290Cj
		xor	ax, ax

loc_83D85:				; CODE XREF: sub_81470+2911j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_83D8E
		jmp	loc_83C56
; ���������������������������������������������������������������������������

loc_83D8E:				; CODE XREF: sub_81470+28F2j
					; sub_81470+2919j
		mov	[bp+var_4], 32h	; '2'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_83EB2
; ���������������������������������������������������������������������������

loc_83DAE:				; CODE XREF: sub_81470+2A5Cj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83DDA
		mov	ax, [bp+var_8]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_83DDA:				; CODE XREF: sub_81470+294Dj
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83DF2
		push	21F6h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_83DF2:				; CODE XREF: sub_81470+2971j
		mov	ax, di
		add	ax, 0FFFAh
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83E0B
		push	1Bh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_83E0B:				; CODE XREF: sub_81470+298Bj
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_83E56
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_83E56:				; CODE XREF: sub_81470+29A2j
		jmp	short loc_83EA5
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_83EA5
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_83ECF
; ���������������������������������������������������������������������������

loc_83EA5:				; CODE XREF: sub_81470:loc_83E56j
					; sub_81470+29EFj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_83EB2:				; CODE XREF: sub_81470+293Bj
		cmp	[bp+var_B59], di
		jnb	short loc_83EBF
		cmp	[bp+var_B57], 0
		jz	short loc_83EC4

loc_83EBF:				; CODE XREF: sub_81470+2A46j
		mov	ax, 1
		jmp	short loc_83EC6
; ���������������������������������������������������������������������������

loc_83EC4:				; CODE XREF: sub_81470+2A4Dj
		xor	ax, ax

loc_83EC6:				; CODE XREF: sub_81470+2A52j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_83ECF
		jmp	loc_83DAE
; ���������������������������������������������������������������������������

loc_83ECF:				; CODE XREF: sub_81470+2650j
					; sub_81470+2A33j ...
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_83EE8
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_83EE8:				; CODE XREF: sub_81470+2A73j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2], 2
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		push	3
		lea	ax, [bp+var_E6]
		push	ax
		push	0
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_F2+2], 0
		mov	byte ptr [bp+var_EC], 2
		mov	byte ptr [bp+var_EC+1],	0
		mov	[bp+var_EC+2], 0
		push	2
		lea	ax, [bp+var_F2+2]
		push	ax
		push	11h
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_F6+3],	0
		lea	ax, [bp+var_F2+2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		lea	ax, [bp+var_E6]
		push	ax
		push	0
		call	sub_2DE95
		add	sp, 4
		mov	word ptr [bp+var_FA+2],	ax
		push	0
		push	0
		lea	ax, [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_FA], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp+var_FC], ax
		push	word ptr [bp+var_FA]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_FC]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	17h
		push	[bp+var_FC]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_84063
		jmp	loc_841FC
; ���������������������������������������������������������������������������

loc_84063:				; CODE XREF: sub_81470+2BEEj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	2
		lea	ax, [bp+var_106]
		push	ax
		push	9
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_106]
		push	ax
		push	[bp+var_FC]
		call	sub_9CF7
		add	sp, 6
		mov	word ptr [bp+var_10A+2], 0
		jmp	short loc_840CE
; ���������������������������������������������������������������������������

loc_840BD:				; CODE XREF: sub_81470+2C63j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_10A+2]

loc_840CE:				; CODE XREF: sub_81470+2C4Bj
		cmp	word ptr [bp+var_10A+2], 3
		jl	short loc_840BD
		jmp	short loc_840F1
; ���������������������������������������������������������������������������

loc_840D7:				; CODE XREF: sub_81470+2C8Fj
		jmp	short loc_840E4
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_840E4
		jmp	short loc_84101
; ���������������������������������������������������������������������������

loc_840E4:				; CODE XREF: sub_81470:loc_840D7j
					; sub_81470+2C70j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_840F1:				; CODE XREF: sub_81470+2C65j
		push	[bp+var_FC]
		call	sub_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_840D7

loc_84101:				; CODE XREF: sub_81470+2C72j
		push	13h
		push	[bp+var_FC]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	word ptr [bp+var_10A+2], 0
		jmp	short loc_84128
; ���������������������������������������������������������������������������

loc_84117:				; CODE XREF: sub_81470+2CBDj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_10A+2]

loc_84128:				; CODE XREF: sub_81470+2CA5j
		cmp	word ptr [bp+var_10A+2], 6
		jl	short loc_84117
		push	word ptr [bp+var_FA+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_F6]
		mov	al, byte ptr [bp+var_F6+2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_B59], 0
		jmp	short loc_8419F
; ���������������������������������������������������������������������������

loc_84185:				; CODE XREF: sub_81470+2D48j
		jmp	short loc_84192
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_84192
		jmp	short loc_841BA
; ���������������������������������������������������������������������������

loc_84192:				; CODE XREF: sub_81470:loc_84185j
					; sub_81470+2D1Ej
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8419F:				; CODE XREF: sub_81470+2D13j
		cmp	[bp+var_B59], 0Ch
		jnb	short loc_841AD
		cmp	[bp+var_B57], 0
		jz	short loc_841B2

loc_841AD:				; CODE XREF: sub_81470+2D34j
		mov	ax, 1
		jmp	short loc_841B4
; ���������������������������������������������������������������������������

loc_841B2:				; CODE XREF: sub_81470+2D3Bj
		xor	ax, ax

loc_841B4:				; CODE XREF: sub_81470+2D40j
		mov	ah, 0
		or	ax, ax
		jz	short loc_84185

loc_841BA:				; CODE XREF: sub_81470+2D20j
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_841E2
		cmp	[bp+var_106], 0
		jz	short loc_841E2
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_841E2:				; CODE XREF: sub_81470+2D4Fj
					; sub_81470+2D57j
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		jmp	loc_8443F
; ���������������������������������������������������������������������������

loc_841FC:				; CODE XREF: sub_81470+2BF0j
		push	0E0h ; '�'
		push	[bp+var_B40]
		mov	bx, [bp+var_B40]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 17h
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	short loc_842A9
; ���������������������������������������������������������������������������

loc_8422E:				; CODE XREF: sub_81470+2E53j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_100+2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_100+2]
		jnz	short loc_8425C
		mov	ax, [bp+var_8]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8425C:				; CODE XREF: sub_81470+2DCFj
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_100+2]
		jnz	short loc_84276
		push	2207h
		push	[bp+var_FC]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_84276:				; CODE XREF: sub_81470+2DF5j
		mov	ax, si
		add	ax, 7
		cmp	ax, word ptr [bp+var_100+2]
		jnz	short loc_8428F
		push	13h
		push	[bp+var_FC]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8428F:				; CODE XREF: sub_81470+2E0Fj
		jmp	short loc_8429C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8429C
		jmp	short loc_842C6
; ���������������������������������������������������������������������������

loc_8429C:				; CODE XREF: sub_81470:loc_8428Fj
					; sub_81470+2E28j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_842A9:				; CODE XREF: sub_81470+2DBCj
		cmp	[bp+var_B59], di
		jnb	short loc_842B6
		cmp	[bp+var_B57], 0
		jz	short loc_842BB

loc_842B6:				; CODE XREF: sub_81470+2E3Dj
		mov	ax, 1
		jmp	short loc_842BD
; ���������������������������������������������������������������������������

loc_842BB:				; CODE XREF: sub_81470+2E44j
		xor	ax, ax

loc_842BD:				; CODE XREF: sub_81470+2E49j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_842C6
		jmp	loc_8422E
; ���������������������������������������������������������������������������

loc_842C6:				; CODE XREF: sub_81470+2E2Aj
					; sub_81470+2E51j
		push	word ptr [bp+var_FA+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_F6]
		mov	al, byte ptr [bp+var_F6+2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	50h ; 'P'
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_4], 14h
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_84422
; ���������������������������������������������������������������������������

loc_84352:				; CODE XREF: sub_81470+2FCCj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_100+2], ax
		cmp	word ptr [bp+var_100+2], si
		jnz	short loc_8437B
		mov	ax, [bp+var_8]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8437B:				; CODE XREF: sub_81470+2EEEj
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_100+2]
		jnz	short loc_843C6
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_843C6:				; CODE XREF: sub_81470+2F12j
		jmp	short loc_84415
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_84415
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8443F
; ���������������������������������������������������������������������������

loc_84415:				; CODE XREF: sub_81470:loc_843C6j
					; sub_81470+2F5Fj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_84422:				; CODE XREF: sub_81470+2EDFj
		cmp	[bp+var_B59], di
		jnb	short loc_8442F
		cmp	[bp+var_B57], 0
		jz	short loc_84434

loc_8442F:				; CODE XREF: sub_81470+2FB6j
		mov	ax, 1
		jmp	short loc_84436
; ���������������������������������������������������������������������������

loc_84434:				; CODE XREF: sub_81470+2FBDj
		xor	ax, ax

loc_84436:				; CODE XREF: sub_81470+2FC2j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8443F
		jmp	loc_84352
; ���������������������������������������������������������������������������

loc_8443F:				; CODE XREF: sub_81470+2D89j
					; sub_81470+2FA3j ...
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_F6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_EC+1],	0
		jz	short loc_84485
		cmp	[bp+var_F2+2], 0
		jz	short loc_84485
		push	0
		mov	al, byte ptr [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F2+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_84485:				; CODE XREF: sub_81470+2FF2j
					; sub_81470+2FFAj
		mov	[bp+var_F2+2], 0
		mov	byte ptr [bp+var_EC+1],	0
		mov	[bp+var_EC+2], 0
		cmp	byte ptr [bp+var_E2+1],	0
		jz	short loc_844C4
		cmp	[bp+var_E6], 0
		jz	short loc_844C4
		push	0
		mov	al, byte ptr [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_844C4:				; CODE XREF: sub_81470+3031j
					; sub_81470+3039j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		cmp	byte_495FC, 0
		jz	short loc_844E5
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_844E5:				; CODE XREF: sub_81470+3070j
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_DE], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_E2+2],	ax
		push	1Bh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	[bp+var_DE]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_845D1
		jmp	loc_84768
; ���������������������������������������������������������������������������

loc_845D1:				; CODE XREF: sub_81470+315Cj
		mov	[bp+var_B59], 0
		jmp	short loc_84618
; ���������������������������������������������������������������������������

loc_845D9:				; CODE XREF: sub_81470+31C1j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		cmp	word ptr [bp+var_E2], 2
		jnz	short loc_845F6
		push	15h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_845F6:				; CODE XREF: sub_81470+3176j
		cmp	word ptr [bp+var_E2], 0Bh
		jnz	short loc_8460B
		push	0FFFFh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8460B:				; CODE XREF: sub_81470+318Bj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_84618:				; CODE XREF: sub_81470+3167j
		cmp	[bp+var_B59], 0Ch
		jnb	short loc_84626
		cmp	[bp+var_B57], 0
		jz	short loc_8462B

loc_84626:				; CODE XREF: sub_81470+31ADj
		mov	ax, 1
		jmp	short loc_8462D
; ���������������������������������������������������������������������������

loc_8462B:				; CODE XREF: sub_81470+31B4j
		xor	ax, ax

loc_8462D:				; CODE XREF: sub_81470+31B9j
		mov	ah, 0
		or	ax, ax
		jz	short loc_845D9
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	2
		lea	ax, [bp+var_EC+2]
		push	ax
		push	1
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_EC+2]
		push	ax
		push	word ptr [bp+var_E2+2]
		call	sub_9CF7
		add	sp, 6
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_84691
; ���������������������������������������������������������������������������

loc_84680:				; CODE XREF: sub_81470+3226j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_84691:				; CODE XREF: sub_81470+320Ej
		cmp	word ptr [bp+var_EC], 3
		jl	short loc_84680
		jmp	short loc_846F6
; ���������������������������������������������������������������������������

loc_8469A:				; CODE XREF: sub_81470+3294j
		jmp	short loc_846E9
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_846E9
		mov	word ptr [bp-0B82h], 11BCh
		mov	word ptr [bp-0B82h], 11C8h
		mov	word ptr [bp-0B82h], 11D8h
		mov	word ptr [bp-0B82h], 11E8h
		mov	word ptr [bp-0B82h], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B82h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_84706
; ���������������������������������������������������������������������������

loc_846E9:				; CODE XREF: sub_81470:loc_8469Aj
					; sub_81470+3233j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_846F6:				; CODE XREF: sub_81470+3228j
		push	word ptr [bp+var_E2+2]
		call	sub_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_8469A

loc_84706:				; CODE XREF: sub_81470+3277j
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_8471F
; ���������������������������������������������������������������������������

loc_8470E:				; CODE XREF: sub_81470+32B4j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_8471F:				; CODE XREF: sub_81470+329Cj
		cmp	word ptr [bp+var_EC], 6
		jl	short loc_8470E
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_8474E
		cmp	[bp+var_EC+2], 0
		jz	short loc_8474E
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8474E:				; CODE XREF: sub_81470+32BBj
					; sub_81470+32C3j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		jmp	loc_84B79
; ���������������������������������������������������������������������������

loc_84768:				; CODE XREF: sub_81470+315Ej
		push	0B7h ; '�'
		push	[bp+var_B40]
		mov	bx, [bp+var_B40]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_847BC
; ���������������������������������������������������������������������������

loc_8477D:				; CODE XREF: sub_81470+3365j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		cmp	word ptr [bp+var_E2], 2
		jnz	short loc_8479A
		push	15h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8479A:				; CODE XREF: sub_81470+331Aj
		cmp	word ptr [bp+var_E2], 0Bh
		jnz	short loc_847AF
		push	0FFFFh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_847AF:				; CODE XREF: sub_81470+332Fj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_847BC:				; CODE XREF: sub_81470+330Bj
		cmp	[bp+var_B59], 0Ch
		jnb	short loc_847CA
		cmp	[bp+var_B57], 0
		jz	short loc_847CF

loc_847CA:				; CODE XREF: sub_81470+3351j
		mov	ax, 1
		jmp	short loc_847D1
; ���������������������������������������������������������������������������

loc_847CF:				; CODE XREF: sub_81470+3358j
		xor	ax, ax

loc_847D1:				; CODE XREF: sub_81470+335Dj
		mov	ah, 0
		or	ax, ax
		jz	short loc_8477D
		mov	[bp+var_4], 2Ch	; ','
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_848E2
; ���������������������������������������������������������������������������

loc_847F7:				; CODE XREF: sub_81470+348Cj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_84823
		mov	ax, [bp+var_8]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_84823:				; CODE XREF: sub_81470+3396j
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_8483B
		push	2211h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8483B:				; CODE XREF: sub_81470+33BAj
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_84886
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_84886:				; CODE XREF: sub_81470+33D2j
		jmp	short loc_848D5
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_848D5
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_848FF
; ���������������������������������������������������������������������������

loc_848D5:				; CODE XREF: sub_81470:loc_84886j
					; sub_81470+341Fj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_848E2:				; CODE XREF: sub_81470+3384j
		cmp	[bp+var_B59], di
		jnb	short loc_848EF
		cmp	[bp+var_B57], 0
		jz	short loc_848F4

loc_848EF:				; CODE XREF: sub_81470+3476j
		mov	ax, 1
		jmp	short loc_848F6
; ���������������������������������������������������������������������������

loc_848F4:				; CODE XREF: sub_81470+347Dj
		xor	ax, ax

loc_848F6:				; CODE XREF: sub_81470+3482j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_848FF
		jmp	loc_847F7
; ���������������������������������������������������������������������������

loc_848FF:				; CODE XREF: sub_81470+3463j
					; sub_81470+348Aj
		mov	[bp+var_4], 19h
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_84A0A
; ���������������������������������������������������������������������������

loc_8491F:				; CODE XREF: sub_81470+35B4j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_8494B
		mov	ax, [bp+var_8]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8494B:				; CODE XREF: sub_81470+34BEj
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_84963
		push	2220h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_84963:				; CODE XREF: sub_81470+34E2j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_849AE
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_849AE:				; CODE XREF: sub_81470+34FAj
		jmp	short loc_849FD
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_849FD
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_84A27
; ���������������������������������������������������������������������������

loc_849FD:				; CODE XREF: sub_81470:loc_849AEj
					; sub_81470+3547j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_84A0A:				; CODE XREF: sub_81470+34ACj
		cmp	[bp+var_B59], di
		jnb	short loc_84A17
		cmp	[bp+var_B57], 0
		jz	short loc_84A1C

loc_84A17:				; CODE XREF: sub_81470+359Ej
		mov	ax, 1
		jmp	short loc_84A1E
; ���������������������������������������������������������������������������

loc_84A1C:				; CODE XREF: sub_81470+35A5j
		xor	ax, ax

loc_84A1E:				; CODE XREF: sub_81470+35AAj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_84A27
		jmp	loc_8491F
; ���������������������������������������������������������������������������

loc_84A27:				; CODE XREF: sub_81470+358Bj
					; sub_81470+35B2j
		mov	[bp+var_4], 14h
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_84B32
; ���������������������������������������������������������������������������

loc_84A47:				; CODE XREF: sub_81470+36DCj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_84A73
		mov	ax, [bp+var_8]
		mov	dx, 0Dh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_84A73:				; CODE XREF: sub_81470+35E6j
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_84A8B
		push	222Ch
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_84A8B:				; CODE XREF: sub_81470+360Aj
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_84AD6
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_84AD6:				; CODE XREF: sub_81470+3622j
		jmp	short loc_84B25
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_84B25
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_84B4F
; ���������������������������������������������������������������������������

loc_84B25:				; CODE XREF: sub_81470:loc_84AD6j
					; sub_81470+366Fj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_84B32:				; CODE XREF: sub_81470+35D4j
		cmp	[bp+var_B59], di
		jnb	short loc_84B3F
		cmp	[bp+var_B57], 0
		jz	short loc_84B44

loc_84B3F:				; CODE XREF: sub_81470+36C6j
		mov	ax, 1
		jmp	short loc_84B46
; ���������������������������������������������������������������������������

loc_84B44:				; CODE XREF: sub_81470+36CDj
		xor	ax, ax

loc_84B46:				; CODE XREF: sub_81470+36D2j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_84B4F
		jmp	loc_84A47
; ���������������������������������������������������������������������������

loc_84B4F:				; CODE XREF: sub_81470+36B3j
					; sub_81470+36DAj
		jmp	short loc_84B5E
; ���������������������������������������������������������������������������

loc_84B51:				; CODE XREF: sub_81470+3707j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_84B5E:				; CODE XREF: sub_81470:loc_84B4Fj
		cmp	[bp+var_B59], 8
		jnb	short loc_84B6C
		cmp	[bp+var_B57], 0
		jz	short loc_84B71

loc_84B6C:				; CODE XREF: sub_81470+36F3j
		mov	ax, 1
		jmp	short loc_84B73
; ���������������������������������������������������������������������������

loc_84B71:				; CODE XREF: sub_81470+36FAj
		xor	ax, ax

loc_84B73:				; CODE XREF: sub_81470+36FFj
		mov	ah, 0
		or	ax, ax
		jz	short loc_84B51

loc_84B79:				; CODE XREF: sub_81470+32F5j
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_84B92
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_84B92:				; CODE XREF: sub_81470+371Dj
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_48]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_DE], ax
		push	0
		push	0
		push	0C8h ; '�'
		push	0
		push	11h
		push	2Ch ; ','
		lea	ax, [bp+var_66]
		push	ax
		push	0
		call	sub_9391
		add	sp, 10h
		mov	word ptr [bp+var_E2+2],	ax
		push	0
		push	0
		push	0A0h ; '�'
		push	0
		push	23h ; '#'
		push	32h ; '2'
		lea	ax, [bp+var_5C]
		push	ax
		push	0
		call	sub_9391
		add	sp, 10h
		mov	word ptr [bp+var_E2], ax
		push	2
		push	0
		push	0A0h ; '�'
		push	0
		push	23h ; '#'
		push	32h ; '2'
		lea	ax, [bp+var_52]
		push	ax
		push	0
		call	sub_9391
		add	sp, 10h
		mov	word ptr [bp+var_E6+2],	ax
		push	[bp+var_DE]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E6+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_A6]
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_84CA6
		jmp	loc_84ECD
; ���������������������������������������������������������������������������

loc_84CA6:				; CODE XREF: sub_81470+3831j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp+var_EE], 0
		mov	byte ptr [bp+var_EC+2],	2
		mov	byte ptr [bp+var_EC+3],	0
		mov	dword ptr [bp+var_E8], 0
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		push	2
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_B1A]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	word ptr [bp+var_F2+2],	0
		jmp	short loc_84D10
; ���������������������������������������������������������������������������

loc_84CFF:				; CODE XREF: sub_81470+38A5j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_F2+2]

loc_84D10:				; CODE XREF: sub_81470+388Dj
		cmp	word ptr [bp+var_F2+2],	4
		jl	short loc_84CFF
		push	0FFFFh
		lea	ax, [bp+var_B1A]
		push	ax
		call	sub_83FE
		add	sp, 4
		mov	word ptr [bp+var_F2+2],	0
		jmp	short loc_84D6E
; ���������������������������������������������������������������������������

loc_84D2E:				; CODE XREF: sub_81470+390Dj
		cmp	word ptr [bp+var_F2+2],	8
		jnz	short loc_84D3E
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 2

loc_84D3E:				; CODE XREF: sub_81470+38C3j
		mov	ax, word ptr [bp+var_F2+2]
		inc	word ptr [bp+var_F2+2]
		cmp	ax, 0Ch
		jnz	short loc_84D54
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 3

loc_84D54:				; CODE XREF: sub_81470+38D9j
		jmp	short loc_84D61
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_84D61
		jmp	short loc_84D7F
; ���������������������������������������������������������������������������

loc_84D61:				; CODE XREF: sub_81470:loc_84D54j
					; sub_81470+38EDj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_84D6E:				; CODE XREF: sub_81470+38BCj
		lea	ax, [bp+var_B1A]
		push	ax
		call	sub_8500
		add	sp, 2
		or	al, al
		jnz	short loc_84D2E

loc_84D7F:				; CODE XREF: sub_81470+38EFj
		mov	word ptr [bp+var_F2+2],	0
		jmp	short loc_84D98
; ���������������������������������������������������������������������������

loc_84D87:				; CODE XREF: sub_81470+392Dj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_F2+2]

loc_84D98:				; CODE XREF: sub_81470+3915j
		cmp	word ptr [bp+var_F2+2],	4
		jl	short loc_84D87
		mov	[bp+var_FA], 0
		mov	byte ptr [bp+var_F6], 2
		mov	byte ptr [bp+var_F6+1],	0
		mov	[bp+var_F6+2], 0
		push	2
		lea	ax, [bp+var_FA]
		push	ax
		push	0Ah
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_FA]
		push	ax
		lea	ax, [bp+var_B1A]
		push	ax
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_B1A]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_84E0E
; ���������������������������������������������������������������������������

loc_84DF4:				; CODE XREF: sub_81470+39ADj
		jmp	short loc_84E01
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_84E01
		jmp	short loc_84E1F
; ���������������������������������������������������������������������������

loc_84E01:				; CODE XREF: sub_81470:loc_84DF4j
					; sub_81470+398Dj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_84E0E:				; CODE XREF: sub_81470+3982j
		lea	ax, [bp+var_B1A]
		push	ax
		call	sub_8500
		add	sp, 2
		or	al, al
		jnz	short loc_84DF4

loc_84E1F:				; CODE XREF: sub_81470+398Fj
		mov	word ptr [bp+var_F2+2],	0
		jmp	short loc_84E38
; ���������������������������������������������������������������������������

loc_84E27:				; CODE XREF: sub_81470+39CDj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_F2+2]

loc_84E38:				; CODE XREF: sub_81470+39B5j
		cmp	word ptr [bp+var_F2+2],	2
		jl	short loc_84E27
		lea	ax, [bp+var_B1A]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_F6+1],	0
		jz	short loc_84E74
		cmp	[bp+var_FA], 0
		jz	short loc_84E74
		push	0
		mov	al, byte ptr [bp+var_F6]
		push	ax
		lea	ax, [bp+var_FA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_84E74:				; CODE XREF: sub_81470+39E1j
					; sub_81470+39E9j
		mov	[bp+var_FA], 0
		mov	byte ptr [bp+var_F6+1],	0
		mov	[bp+var_F6+2], 0
		cmp	byte ptr [bp+var_EC+3],	0
		jz	short loc_84EB3
		cmp	dword ptr [bp+var_EE], 0
		jz	short loc_84EB3
		push	0
		mov	al, byte ptr [bp+var_EC+2]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_84EB3:				; CODE XREF: sub_81470+3A20j
					; sub_81470+3A28j
		mov	dword ptr [bp+var_EE], 0
		mov	byte ptr [bp+var_EC+3],	0
		mov	dword ptr [bp+var_E8], 0
		jmp	loc_857B2
; ���������������������������������������������������������������������������

loc_84ECD:				; CODE XREF: sub_81470+3833j
		push	0
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	27h ; '''
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_4], 2Ch	; ','
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_8500A
; ���������������������������������������������������������������������������

loc_84F0B:				; CODE XREF: sub_81470+3BB4j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E6], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_84F39
		mov	ax, [bp+var_8]
		mov	dx, 0Eh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_84F39:				; CODE XREF: sub_81470+3AACj
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_84F4D
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 2

loc_84F4D:				; CODE XREF: sub_81470+3AD2j
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_84F61
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 3

loc_84F61:				; CODE XREF: sub_81470+3AE6j
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_84FAE
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_84FAE:				; CODE XREF: sub_81470+3AFAj
		jmp	short loc_84FFD
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_84FFD
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_85027
; ���������������������������������������������������������������������������

loc_84FFD:				; CODE XREF: sub_81470:loc_84FAEj
					; sub_81470+3B47j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8500A:				; CODE XREF: sub_81470+3A98j
		cmp	[bp+var_B59], di
		jnb	short loc_85017
		cmp	[bp+var_B57], 0
		jz	short loc_8501C

loc_85017:				; CODE XREF: sub_81470+3B9Ej
		mov	ax, 1
		jmp	short loc_8501E
; ���������������������������������������������������������������������������

loc_8501C:				; CODE XREF: sub_81470+3BA5j
		xor	ax, ax

loc_8501E:				; CODE XREF: sub_81470+3BAAj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_85027
		jmp	loc_84F0B
; ���������������������������������������������������������������������������

loc_85027:				; CODE XREF: sub_81470+3B8Bj
					; sub_81470+3BB2j
		mov	[bp+var_4], 1Eh
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_85144
; ���������������������������������������������������������������������������

loc_85047:				; CODE XREF: sub_81470+3CEEj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E6], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_85073
		mov	ax, [bp+var_8]
		mov	dx, 0Fh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_85073:				; CODE XREF: sub_81470+3BE6j
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_85087
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 2

loc_85087:				; CODE XREF: sub_81470+3C0Cj
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_8509B
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 3

loc_8509B:				; CODE XREF: sub_81470+3C20j
		mov	ax, di
		add	ax, 0FFFBh
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_850E8
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_850E8:				; CODE XREF: sub_81470+3C34j
		jmp	short loc_85137
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_85137
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_85161
; ���������������������������������������������������������������������������

loc_85137:				; CODE XREF: sub_81470:loc_850E8j
					; sub_81470+3C81j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_85144:				; CODE XREF: sub_81470+3BD4j
		cmp	[bp+var_B59], di
		jnb	short loc_85151
		cmp	[bp+var_B57], 0
		jz	short loc_85156

loc_85151:				; CODE XREF: sub_81470+3CD8j
		mov	ax, 1
		jmp	short loc_85158
; ���������������������������������������������������������������������������

loc_85156:				; CODE XREF: sub_81470+3CDFj
		xor	ax, ax

loc_85158:				; CODE XREF: sub_81470+3CE4j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_85161
		jmp	loc_85047
; ���������������������������������������������������������������������������

loc_85161:				; CODE XREF: sub_81470+3CC5j
					; sub_81470+3CECj
		mov	[bp+var_4], 39h	; '9'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_852A4
; ���������������������������������������������������������������������������

loc_85181:				; CODE XREF: sub_81470+3E4Ej
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E6], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_851AB
		mov	ax, [bp+var_8]
		shl	ax, 4
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_851AB:				; CODE XREF: sub_81470+3D20j
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_851BF
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 4

loc_851BF:				; CODE XREF: sub_81470+3D44j
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_851D3
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 3

loc_851D3:				; CODE XREF: sub_81470+3D58j
		mov	ax, si
		add	ax, 1Ch
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_851E7
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 2

loc_851E7:				; CODE XREF: sub_81470+3D6Cj
		mov	ax, si
		add	ax, 22h	; '"'
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_851FB
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 4

loc_851FB:				; CODE XREF: sub_81470+3D80j
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_85248
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_85248:				; CODE XREF: sub_81470+3D94j
		jmp	short loc_85297
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_85297
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_852C1
; ���������������������������������������������������������������������������

loc_85297:				; CODE XREF: sub_81470:loc_85248j
					; sub_81470+3DE1j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_852A4:				; CODE XREF: sub_81470+3D0Ej
		cmp	[bp+var_B59], di
		jnb	short loc_852B1
		cmp	[bp+var_B57], 0
		jz	short loc_852B6

loc_852B1:				; CODE XREF: sub_81470+3E38j
		mov	ax, 1
		jmp	short loc_852B8
; ���������������������������������������������������������������������������

loc_852B6:				; CODE XREF: sub_81470+3E3Fj
		xor	ax, ax

loc_852B8:				; CODE XREF: sub_81470+3E44j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_852C1
		jmp	loc_85181
; ���������������������������������������������������������������������������

loc_852C1:				; CODE XREF: sub_81470+3E25j
					; sub_81470+3E4Cj
		mov	[bp+var_4], 28h	; '('
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_853DE
; ���������������������������������������������������������������������������

loc_852E1:				; CODE XREF: sub_81470+3F88j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E6], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_8530D
		mov	ax, [bp+var_8]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8530D:				; CODE XREF: sub_81470+3E80j
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_85321
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 2

loc_85321:				; CODE XREF: sub_81470+3EA6j
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_85335
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 3

loc_85335:				; CODE XREF: sub_81470+3EBAj
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_85382
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_85382:				; CODE XREF: sub_81470+3ECEj
		jmp	short loc_853D1
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_853D1
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_853FB
; ���������������������������������������������������������������������������

loc_853D1:				; CODE XREF: sub_81470:loc_85382j
					; sub_81470+3F1Bj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_853DE:				; CODE XREF: sub_81470+3E6Ej
		cmp	[bp+var_B59], di
		jnb	short loc_853EB
		cmp	[bp+var_B57], 0
		jz	short loc_853F0

loc_853EB:				; CODE XREF: sub_81470+3F72j
		mov	ax, 1
		jmp	short loc_853F2
; ���������������������������������������������������������������������������

loc_853F0:				; CODE XREF: sub_81470+3F79j
		xor	ax, ax

loc_853F2:				; CODE XREF: sub_81470+3F7Ej
		mov	ah, 0
		or	ax, ax
		jnz	short loc_853FB
		jmp	loc_852E1
; ���������������������������������������������������������������������������

loc_853FB:				; CODE XREF: sub_81470+3F5Fj
					; sub_81470+3F86j
		mov	[bp+var_4], 19h
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_85518
; ���������������������������������������������������������������������������

loc_8541B:				; CODE XREF: sub_81470+40C2j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E6], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_85447
		mov	ax, [bp+var_8]
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_85447:				; CODE XREF: sub_81470+3FBAj
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_8545B
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 4

loc_8545B:				; CODE XREF: sub_81470+3FE0j
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_8546F
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 2

loc_8546F:				; CODE XREF: sub_81470+3FF4j
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_854BC
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_854BC:				; CODE XREF: sub_81470+4008j
		jmp	short loc_8550B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8550B
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_85535
; ���������������������������������������������������������������������������

loc_8550B:				; CODE XREF: sub_81470:loc_854BCj
					; sub_81470+4055j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_85518:				; CODE XREF: sub_81470+3FA8j
		cmp	[bp+var_B59], di
		jnb	short loc_85525
		cmp	[bp+var_B57], 0
		jz	short loc_8552A

loc_85525:				; CODE XREF: sub_81470+40ACj
		mov	ax, 1
		jmp	short loc_8552C
; ���������������������������������������������������������������������������

loc_8552A:				; CODE XREF: sub_81470+40B3j
		xor	ax, ax

loc_8552C:				; CODE XREF: sub_81470+40B8j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_85535
		jmp	loc_8541B
; ���������������������������������������������������������������������������

loc_85535:				; CODE XREF: sub_81470+4099j
					; sub_81470+40C0j
		mov	[bp+var_4], 12h
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	short loc_85561
; ���������������������������������������������������������������������������

loc_85554:				; CODE XREF: sub_81470+4109j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_85561:				; CODE XREF: sub_81470+40E2j
		cmp	[bp+var_B59], di
		jnb	short loc_8556E
		cmp	[bp+var_B57], 0
		jz	short loc_85573

loc_8556E:				; CODE XREF: sub_81470+40F5j
		mov	ax, 1
		jmp	short loc_85575
; ���������������������������������������������������������������������������

loc_85573:				; CODE XREF: sub_81470+40FCj
		xor	ax, ax

loc_85575:				; CODE XREF: sub_81470+4101j
		mov	ah, 0
		or	ax, ax
		jz	short loc_85554
		push	0Eh
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_4], 41h	; 'A'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_85681
; ���������������������������������������������������������������������������

loc_855AA:				; CODE XREF: sub_81470+422Bj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E6], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_855D8
		mov	ax, [bp+var_8]
		mov	dx, 13h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_855D8:				; CODE XREF: sub_81470+414Bj
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_85625
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_85625:				; CODE XREF: sub_81470+4171j
		jmp	short loc_85674
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_85674
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8569E
; ���������������������������������������������������������������������������

loc_85674:				; CODE XREF: sub_81470:loc_85625j
					; sub_81470+41BEj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_85681:				; CODE XREF: sub_81470+4137j
		cmp	[bp+var_B59], di
		jnb	short loc_8568E
		cmp	[bp+var_B57], 0
		jz	short loc_85693

loc_8568E:				; CODE XREF: sub_81470+4215j
		mov	ax, 1
		jmp	short loc_85695
; ���������������������������������������������������������������������������

loc_85693:				; CODE XREF: sub_81470+421Cj
		xor	ax, ax

loc_85695:				; CODE XREF: sub_81470+4221j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8569E
		jmp	loc_855AA
; ���������������������������������������������������������������������������

loc_8569E:				; CODE XREF: sub_81470+4202j
					; sub_81470+4229j
		mov	[bp+var_4], 2Dh	; '-'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_85795
; ���������������������������������������������������������������������������

loc_856BE:				; CODE XREF: sub_81470+433Fj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E6], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_856EC
		mov	ax, [bp+var_8]
		mov	dx, 14h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_856EC:				; CODE XREF: sub_81470+425Fj
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_E6]
		jnz	short loc_85739
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_85739:				; CODE XREF: sub_81470+4285j
		jmp	short loc_85788
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_85788
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_857B2
; ���������������������������������������������������������������������������

loc_85788:				; CODE XREF: sub_81470:loc_85739j
					; sub_81470+42D2j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_85795:				; CODE XREF: sub_81470+424Bj
		cmp	[bp+var_B59], di
		jnb	short loc_857A2
		cmp	[bp+var_B57], 0
		jz	short loc_857A7

loc_857A2:				; CODE XREF: sub_81470+4329j
		mov	ax, 1
		jmp	short loc_857A9
; ���������������������������������������������������������������������������

loc_857A7:				; CODE XREF: sub_81470+4330j
		xor	ax, ax

loc_857A9:				; CODE XREF: sub_81470+4335j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_857B2
		jmp	loc_856BE
; ���������������������������������������������������������������������������

loc_857B2:				; CODE XREF: sub_81470+3A5Aj
					; sub_81470+4316j ...
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_857CB
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_857CB:				; CODE XREF: sub_81470+4356j
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_DE], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_E2+2],	ax
		push	[bp+var_DE]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_858A9
		jmp	loc_859A9
; ���������������������������������������������������������������������������

loc_858A9:				; CODE XREF: sub_81470+4434j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	2
		lea	ax, [bp+var_EC+2]
		push	ax
		push	0Bh
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_EC+2]
		push	ax
		push	word ptr [bp+var_E2+2]
		call	sub_9CF7
		add	sp, 6
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_85914
; ���������������������������������������������������������������������������

loc_85903:				; CODE XREF: sub_81470+44A9j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_85914:				; CODE XREF: sub_81470+4491j
		cmp	word ptr [bp+var_EC], 2
		jl	short loc_85903
		jmp	short loc_85937
; ���������������������������������������������������������������������������

loc_8591D:				; CODE XREF: sub_81470+44D5j
		jmp	short loc_8592A
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8592A
		jmp	short loc_85947
; ���������������������������������������������������������������������������

loc_8592A:				; CODE XREF: sub_81470:loc_8591Dj
					; sub_81470+44B6j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_85937:				; CODE XREF: sub_81470+44ABj
		push	word ptr [bp+var_E2+2]
		call	sub_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_8591D

loc_85947:				; CODE XREF: sub_81470+44B8j
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_85960
; ���������������������������������������������������������������������������

loc_8594F:				; CODE XREF: sub_81470+44F5j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_85960:				; CODE XREF: sub_81470+44DDj
		cmp	word ptr [bp+var_EC], 3
		jl	short loc_8594F
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_8598F
		cmp	[bp+var_EC+2], 0
		jz	short loc_8598F
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8598F:				; CODE XREF: sub_81470+44FCj
					; sub_81470+4504j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		jmp	loc_85AE8
; ���������������������������������������������������������������������������

loc_859A9:				; CODE XREF: sub_81470+4436j
		push	0E0h ; '�'
		push	[bp+var_B40]
		mov	bx, [bp+var_B40]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 55h	; 'U'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_85ACB
; ���������������������������������������������������������������������������

loc_859DC:				; CODE XREF: sub_81470+4675j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_85A0A
		mov	ax, [bp+var_8]
		mov	dx, 15h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_85A0A:				; CODE XREF: sub_81470+457Dj
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_85A24
		push	2233h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_85A24:				; CODE XREF: sub_81470+45A3j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_85A6F
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_85A6F:				; CODE XREF: sub_81470+45BBj
		jmp	short loc_85ABE
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_85ABE
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_85AE8
; ���������������������������������������������������������������������������

loc_85ABE:				; CODE XREF: sub_81470:loc_85A6Fj
					; sub_81470+4608j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_85ACB:				; CODE XREF: sub_81470+4569j
		cmp	[bp+var_B59], di
		jnb	short loc_85AD8
		cmp	[bp+var_B57], 0
		jz	short loc_85ADD

loc_85AD8:				; CODE XREF: sub_81470+465Fj
		mov	ax, 1
		jmp	short loc_85ADF
; ���������������������������������������������������������������������������

loc_85ADD:				; CODE XREF: sub_81470+4666j
		xor	ax, ax

loc_85ADF:				; CODE XREF: sub_81470+466Bj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_85AE8
		jmp	loc_859DC
; ���������������������������������������������������������������������������

loc_85AE8:				; CODE XREF: sub_81470+4536j
					; sub_81470+464Cj ...
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_85B01
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_85B01:				; CODE XREF: sub_81470+468Cj
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_DE], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_E2+2],	ax
		push	[bp+var_DE]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_85BDF
		jmp	loc_85D52
; ���������������������������������������������������������������������������

loc_85BDF:				; CODE XREF: sub_81470+476Aj
		mov	[bp+var_B59], 0
		jmp	short loc_85BF4
; ���������������������������������������������������������������������������

loc_85BE7:				; CODE XREF: sub_81470+479Dj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_85BF4:				; CODE XREF: sub_81470+4775j
		cmp	[bp+var_B59], 4
		jnb	short loc_85C02
		cmp	[bp+var_B57], 0
		jz	short loc_85C07

loc_85C02:				; CODE XREF: sub_81470+4789j
		mov	ax, 1
		jmp	short loc_85C09
; ���������������������������������������������������������������������������

loc_85C07:				; CODE XREF: sub_81470+4790j
		xor	ax, ax

loc_85C09:				; CODE XREF: sub_81470+4795j
		mov	ah, 0
		or	ax, ax
		jz	short loc_85BE7
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	2
		lea	ax, [bp+var_EC+2]
		push	ax
		push	3
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_EC+2]
		push	ax
		push	word ptr [bp+var_E2+2]
		call	sub_9CF7
		add	sp, 6
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_85C6D
; ���������������������������������������������������������������������������

loc_85C5C:				; CODE XREF: sub_81470+4802j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_85C6D:				; CODE XREF: sub_81470+47EAj
		cmp	word ptr [bp+var_EC], 3
		jl	short loc_85C5C
		jmp	short loc_85CD2
; ���������������������������������������������������������������������������

loc_85C76:				; CODE XREF: sub_81470+4870j
		jmp	short loc_85CC5
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_85CC5
		mov	word ptr [bp-0B82h], 11BCh
		mov	word ptr [bp-0B82h], 11C8h
		mov	word ptr [bp-0B82h], 11D8h
		mov	word ptr [bp-0B82h], 11E8h
		mov	word ptr [bp-0B82h], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B82h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_85CE2
; ���������������������������������������������������������������������������

loc_85CC5:				; CODE XREF: sub_81470:loc_85C76j
					; sub_81470+480Fj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_85CD2:				; CODE XREF: sub_81470+4804j
		push	word ptr [bp+var_E2+2]
		call	sub_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_85C76

loc_85CE2:				; CODE XREF: sub_81470+4853j
		push	1Bh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_85D09
; ���������������������������������������������������������������������������

loc_85CF8:				; CODE XREF: sub_81470+489Ej
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_85D09:				; CODE XREF: sub_81470+4886j
		cmp	word ptr [bp+var_EC], 6
		jl	short loc_85CF8
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_85D38
		cmp	[bp+var_EC+2], 0
		jz	short loc_85D38
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_85D38:				; CODE XREF: sub_81470+48A5j
					; sub_81470+48ADj
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		jmp	loc_85EC5
; ���������������������������������������������������������������������������

loc_85D52:				; CODE XREF: sub_81470+476Cj
		push	0B7h ; '�'
		push	[bp+var_B40]
		mov	bx, [bp+var_B40]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 54h	; 'T'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_85EA8
; ���������������������������������������������������������������������������

loc_85D85:				; CODE XREF: sub_81470+4A52j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_85DB3
		mov	ax, [bp+var_8]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_85DB3:				; CODE XREF: sub_81470+4926j
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_85DCD
		push	2258h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_85DCD:				; CODE XREF: sub_81470+494Cj
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_85DE6
		push	0FFFFh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_85DE6:				; CODE XREF: sub_81470+4966j
		mov	ax, di
		add	ax, 0FFF8h
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_85DFF
		push	1Bh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_85DFF:				; CODE XREF: sub_81470+497Fj
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_85E4C
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_85E4C:				; CODE XREF: sub_81470+4998j
		jmp	short loc_85E9B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_85E9B
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_85EC5
; ���������������������������������������������������������������������������

loc_85E9B:				; CODE XREF: sub_81470:loc_85E4Cj
					; sub_81470+49E5j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_85EA8:				; CODE XREF: sub_81470+4912j
		cmp	[bp+var_B59], di
		jnb	short loc_85EB5
		cmp	[bp+var_B57], 0
		jz	short loc_85EBA

loc_85EB5:				; CODE XREF: sub_81470+4A3Cj
		mov	ax, 1
		jmp	short loc_85EBC
; ���������������������������������������������������������������������������

loc_85EBA:				; CODE XREF: sub_81470+4A43j
		xor	ax, ax

loc_85EBC:				; CODE XREF: sub_81470+4A48j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_85EC5
		jmp	loc_85D85
; ���������������������������������������������������������������������������

loc_85EC5:				; CODE XREF: sub_81470+48DFj
					; sub_81470+4A29j ...
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_85EDE
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_85EDE:				; CODE XREF: sub_81470+4A69j
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_DE], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_E2+2],	ax
		push	[bp+var_DE]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_85FBC
		jmp	loc_860BC
; ���������������������������������������������������������������������������

loc_85FBC:				; CODE XREF: sub_81470+4B47j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	2
		lea	ax, [bp+var_EC+2]
		push	ax
		push	0Ch
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_EC+2]
		push	ax
		push	word ptr [bp+var_E2+2]
		call	sub_9CF7
		add	sp, 6
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_86027
; ���������������������������������������������������������������������������

loc_86016:				; CODE XREF: sub_81470+4BBCj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_86027:				; CODE XREF: sub_81470+4BA4j
		cmp	word ptr [bp+var_EC], 2
		jl	short loc_86016
		jmp	short loc_8604A
; ���������������������������������������������������������������������������

loc_86030:				; CODE XREF: sub_81470+4BE8j
		jmp	short loc_8603D
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8603D
		jmp	short loc_8605A
; ���������������������������������������������������������������������������

loc_8603D:				; CODE XREF: sub_81470:loc_86030j
					; sub_81470+4BC9j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8604A:				; CODE XREF: sub_81470+4BBEj
		push	word ptr [bp+var_E2+2]
		call	sub_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_86030

loc_8605A:				; CODE XREF: sub_81470+4BCBj
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_86073
; ���������������������������������������������������������������������������

loc_86062:				; CODE XREF: sub_81470+4C08j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_86073:				; CODE XREF: sub_81470+4BF0j
		cmp	word ptr [bp+var_EC], 3
		jl	short loc_86062
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_860A2
		cmp	[bp+var_EC+2], 0
		jz	short loc_860A2
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_860A2:				; CODE XREF: sub_81470+4C0Fj
					; sub_81470+4C17j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		jmp	loc_861FD
; ���������������������������������������������������������������������������

loc_860BC:				; CODE XREF: sub_81470+4B49j
		push	0E0h ; '�'
		push	[bp+var_B40]
		mov	bx, [bp+var_B40]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 42h	; 'B'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_861E0
; ���������������������������������������������������������������������������

loc_860EF:				; CODE XREF: sub_81470+4D8Aj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_8611D
		mov	ax, [bp+var_8]
		mov	dx, 18h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8611D:				; CODE XREF: sub_81470+4C90j
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_86137
		push	2275h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_86137:				; CODE XREF: sub_81470+4CB6j
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_86184
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_86184:				; CODE XREF: sub_81470+4CD0j
		jmp	short loc_861D3
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_861D3
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_861FD
; ���������������������������������������������������������������������������

loc_861D3:				; CODE XREF: sub_81470:loc_86184j
					; sub_81470+4D1Dj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_861E0:				; CODE XREF: sub_81470+4C7Cj
		cmp	[bp+var_B59], di
		jnb	short loc_861ED
		cmp	[bp+var_B57], 0
		jz	short loc_861F2

loc_861ED:				; CODE XREF: sub_81470+4D74j
		mov	ax, 1
		jmp	short loc_861F4
; ���������������������������������������������������������������������������

loc_861F2:				; CODE XREF: sub_81470+4D7Bj
		xor	ax, ax

loc_861F4:				; CODE XREF: sub_81470+4D80j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_861FD
		jmp	loc_860EF
; ���������������������������������������������������������������������������

loc_861FD:				; CODE XREF: sub_81470+4C49j
					; sub_81470+4D61j ...
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_86216
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_86216:				; CODE XREF: sub_81470+4DA1j
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_DE], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_E2+2],	ax
		push	[bp+var_DE]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_862F4
		jmp	loc_86444
; ���������������������������������������������������������������������������

loc_862F4:				; CODE XREF: sub_81470+4E7Fj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	2
		lea	ax, [bp+var_EC+2]
		push	ax
		push	4
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_EC+2]
		push	ax
		push	word ptr [bp+var_E2+2]
		call	sub_9CF7
		add	sp, 6
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_8635F
; ���������������������������������������������������������������������������

loc_8634E:				; CODE XREF: sub_81470+4EF4j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_8635F:				; CODE XREF: sub_81470+4EDCj
		cmp	word ptr [bp+var_EC], 3
		jl	short loc_8634E
		jmp	short loc_863C4
; ���������������������������������������������������������������������������

loc_86368:				; CODE XREF: sub_81470+4F62j
		jmp	short loc_863B7
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_863B7
		mov	word ptr [bp-0B82h], 11BCh
		mov	word ptr [bp-0B82h], 11C8h
		mov	word ptr [bp-0B82h], 11D8h
		mov	word ptr [bp-0B82h], 11E8h
		mov	word ptr [bp-0B82h], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B82h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_863D4
; ���������������������������������������������������������������������������

loc_863B7:				; CODE XREF: sub_81470:loc_86368j
					; sub_81470+4F01j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_863C4:				; CODE XREF: sub_81470+4EF6j
		push	word ptr [bp+var_E2+2]
		call	sub_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_86368

loc_863D4:				; CODE XREF: sub_81470+4F45j
		push	1Ch
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_863FB
; ���������������������������������������������������������������������������

loc_863EA:				; CODE XREF: sub_81470+4F90j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_863FB:				; CODE XREF: sub_81470+4F78j
		cmp	word ptr [bp+var_EC], 6
		jl	short loc_863EA
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_8642A
		cmp	[bp+var_EC+2], 0
		jz	short loc_8642A
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8642A:				; CODE XREF: sub_81470+4F97j
					; sub_81470+4F9Fj
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		jmp	loc_866C6
; ���������������������������������������������������������������������������

loc_86444:				; CODE XREF: sub_81470+4E81j
		push	0B7h ; '�'
		push	[bp+var_B40]
		mov	bx, [bp+var_B40]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 35h	; '5'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_86566
; ���������������������������������������������������������������������������

loc_86477:				; CODE XREF: sub_81470+5110j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_864A5
		mov	ax, [bp+var_8]
		mov	dx, 19h
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_864A5:				; CODE XREF: sub_81470+5018j
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_864BF
		push	2295h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_864BF:				; CODE XREF: sub_81470+503Ej
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_8650A
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8650A:				; CODE XREF: sub_81470+5056j
		jmp	short loc_86559
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_86559
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_86583
; ���������������������������������������������������������������������������

loc_86559:				; CODE XREF: sub_81470:loc_8650Aj
					; sub_81470+50A3j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_86566:				; CODE XREF: sub_81470+5004j
		cmp	[bp+var_B59], di
		jnb	short loc_86573
		cmp	[bp+var_B57], 0
		jz	short loc_86578

loc_86573:				; CODE XREF: sub_81470+50FAj
		mov	ax, 1
		jmp	short loc_8657A
; ���������������������������������������������������������������������������

loc_86578:				; CODE XREF: sub_81470+5101j
		xor	ax, ax

loc_8657A:				; CODE XREF: sub_81470+5106j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_86583
		jmp	loc_86477
; ���������������������������������������������������������������������������

loc_86583:				; CODE XREF: sub_81470+50E7j
					; sub_81470+510Ej
		mov	[bp+var_4], 2Ah	; '*'
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_866A9
; ���������������������������������������������������������������������������

loc_865A3:				; CODE XREF: sub_81470+5253j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_865CF
		mov	ax, [bp+var_8]
		mov	dx, 1Ah
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_865CF:				; CODE XREF: sub_81470+5142j
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_865E7
		push	22A7h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_865E7:				; CODE XREF: sub_81470+5166j
		mov	ax, di
		add	ax, 0FFF8h
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_86600
		push	1Ch
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_86600:				; CODE XREF: sub_81470+5180j
		mov	ax, di
		add	ax, 0FFF8h
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_8664D
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8664D:				; CODE XREF: sub_81470+5199j
		jmp	short loc_8669C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8669C
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_866C6
; ���������������������������������������������������������������������������

loc_8669C:				; CODE XREF: sub_81470:loc_8664Dj
					; sub_81470+51E6j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_866A9:				; CODE XREF: sub_81470+5130j
		cmp	[bp+var_B59], di
		jnb	short loc_866B6
		cmp	[bp+var_B57], 0
		jz	short loc_866BB

loc_866B6:				; CODE XREF: sub_81470+523Dj
		mov	ax, 1
		jmp	short loc_866BD
; ���������������������������������������������������������������������������

loc_866BB:				; CODE XREF: sub_81470+5244j
		xor	ax, ax

loc_866BD:				; CODE XREF: sub_81470+5249j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_866C6
		jmp	loc_865A3
; ���������������������������������������������������������������������������

loc_866C6:				; CODE XREF: sub_81470+4FD1j
					; sub_81470+522Aj ...
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_866DF
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_866DF:				; CODE XREF: sub_81470+526Aj
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_DE], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_E2+2],	ax
		push	[bp+var_DE]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_A], 0
		jnz	short loc_867BD
		jmp	loc_868CB
; ���������������������������������������������������������������������������

loc_867BD:				; CODE XREF: sub_81470+5348j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	2
		lea	ax, [bp+var_EC+2]
		push	ax
		push	0Dh
		lea	ax, [bp+var_26E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_EC+2]
		push	ax
		push	word ptr [bp+var_E2+2]
		call	sub_9CF7
		add	sp, 6
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_86828
; ���������������������������������������������������������������������������

loc_86817:				; CODE XREF: sub_81470+53BDj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_86828:				; CODE XREF: sub_81470+53A5j
		cmp	word ptr [bp+var_EC], 2
		jl	short loc_86817
		jmp	short loc_8684B
; ���������������������������������������������������������������������������

loc_86831:				; CODE XREF: sub_81470+53E9j
		jmp	short loc_8683E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8683E
		jmp	short loc_8685B
; ���������������������������������������������������������������������������

loc_8683E:				; CODE XREF: sub_81470:loc_86831j
					; sub_81470+53CAj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8684B:				; CODE XREF: sub_81470+53BFj
		push	word ptr [bp+var_E2+2]
		call	sub_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_86831

loc_8685B:				; CODE XREF: sub_81470+53CCj
		push	21h ; '!'
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	word ptr [bp+var_EC], 0
		jmp	short loc_86882
; ���������������������������������������������������������������������������

loc_86871:				; CODE XREF: sub_81470+5417j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_EC]

loc_86882:				; CODE XREF: sub_81470+53FFj
		cmp	word ptr [bp+var_EC], 3
		jl	short loc_86871
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_868B1
		cmp	[bp+var_EC+2], 0
		jz	short loc_868B1
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_868B1:				; CODE XREF: sub_81470+541Ej
					; sub_81470+5426j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		jmp	loc_86B42
; ���������������������������������������������������������������������������

loc_868CB:				; CODE XREF: sub_81470+534Aj
		push	0E0h ; '�'
		push	[bp+var_B40]
		mov	bx, [bp+var_B40]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 13h
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_869ED
; ���������������������������������������������������������������������������

loc_868FE:				; CODE XREF: sub_81470+5597j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_8692C
		mov	ax, [bp+var_8]
		mov	dx, 1Bh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8692C:				; CODE XREF: sub_81470+549Fj
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_86946
		push	22B2h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_86946:				; CODE XREF: sub_81470+54C5j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_86991
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_86991:				; CODE XREF: sub_81470+54DDj
		jmp	short loc_869E0
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_869E0
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_86A0A
; ���������������������������������������������������������������������������

loc_869E0:				; CODE XREF: sub_81470:loc_86991j
					; sub_81470+552Aj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_869ED:				; CODE XREF: sub_81470+548Bj
		cmp	[bp+var_B59], di
		jnb	short loc_869FA
		cmp	[bp+var_B57], 0
		jz	short loc_869FF

loc_869FA:				; CODE XREF: sub_81470+5581j
		mov	ax, 1
		jmp	short loc_86A01
; ���������������������������������������������������������������������������

loc_869FF:				; CODE XREF: sub_81470+5588j
		xor	ax, ax

loc_86A01:				; CODE XREF: sub_81470+558Dj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_86A0A
		jmp	loc_868FE
; ���������������������������������������������������������������������������

loc_86A0A:				; CODE XREF: sub_81470+556Ej
					; sub_81470+5595j
		push	21h ; '!'
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	[bp+var_4], 15h
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_86B25
; ���������������������������������������������������������������������������

loc_86A38:				; CODE XREF: sub_81470+56CFj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_86A64
		mov	ax, [bp+var_8]
		mov	dx, 1Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B54]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_86A64:				; CODE XREF: sub_81470+55D7j
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_86A7C
		push	22B7h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_86A7C:				; CODE XREF: sub_81470+55FBj
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_E2]
		jnz	short loc_86AC9
		mov	[bp+var_B82], 11BCh
		mov	[bp+var_B82], 11C8h
		mov	[bp+var_B82], 11D8h
		mov	[bp+var_B82], 11E8h
		mov	[bp+var_B82], 11FCh
		lea	ax, [bp+var_B52]
		push	ax
		push	0
		push	[bp+var_B35]
		push	[bp+var_B37]
		push	[bp+var_B39]
		push	[bp+var_B3B]
		lea	ax, [bp+var_B82]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_86AC9:				; CODE XREF: sub_81470+5615j
		jmp	short loc_86B18
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_86B18
		mov	word ptr [bp-0B8Eh], 11BCh
		mov	word ptr [bp-0B8Eh], 11C8h
		mov	word ptr [bp-0B8Eh], 11D8h
		mov	word ptr [bp-0B8Eh], 11E8h
		mov	word ptr [bp-0B8Eh], 11FCh
		lea	ax, [bp-0B52h]
		push	ax
		push	0
		push	word ptr [bp-0B35h]
		push	word ptr [bp-0B37h]
		push	word ptr [bp-0B39h]
		push	word ptr [bp-0B3Bh]
		lea	ax, [bp-0B8Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_86B42
; ���������������������������������������������������������������������������

loc_86B18:				; CODE XREF: sub_81470:loc_86AC9j
					; sub_81470+5662j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_86B25:				; CODE XREF: sub_81470+55C5j
		cmp	[bp+var_B59], di
		jnb	short loc_86B32
		cmp	[bp+var_B57], 0
		jz	short loc_86B37

loc_86B32:				; CODE XREF: sub_81470+56B9j
		mov	ax, 1
		jmp	short loc_86B39
; ���������������������������������������������������������������������������

loc_86B37:				; CODE XREF: sub_81470+56C0j
		xor	ax, ax

loc_86B39:				; CODE XREF: sub_81470+56C5j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_86B42
		jmp	loc_86A38
; ���������������������������������������������������������������������������

loc_86B42:				; CODE XREF: sub_81470+5458j
					; sub_81470+56A6j ...
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_86B5B
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_86B5B:				; CODE XREF: sub_81470+56E6j
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2], 2
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		push	3
		lea	ax, [bp+var_E6]
		push	ax
		push	0Ch
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_F2+2], 0
		mov	byte ptr [bp+var_EC], 2
		mov	byte ptr [bp+var_EC+1],	0
		mov	[bp+var_EC+2], 0
		push	3
		lea	ax, [bp+var_F2+2]
		push	ax
		push	0Ah
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_FA], 0
		mov	byte ptr [bp+var_F6], 2
		mov	byte ptr [bp+var_F6+1],	0
		mov	[bp+var_F6+2], 0
		push	3
		lea	ax, [bp+var_FA]
		push	ax
		push	0Bh
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_106+2],	0
		mov	byte ptr [bp+var_100], 2
		mov	byte ptr [bp+var_100+1], 0
		mov	[bp+var_100+2],	0
		push	2
		lea	ax, [bp+var_106+2]
		push	ax
		push	17h
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_10A+3], 0
		lea	ax, [bp+var_106+2]
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	0
		push	0
		lea	ax, [bp+var_F2+2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_10C], ax
		push	0
		push	0FFE2h
		lea	ax, [bp+var_E6]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_110+2], ax
		push	0
		push	0
		lea	ax, [bp+var_FA]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_110], ax
		push	[bp+var_10C]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_110+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_110]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_10A]
		mov	al, byte ptr [bp+var_10A+2]
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0Ah
		push	0
		push	word ptr [bp+var_110+2]
		mov	bx, word ptr [bp+var_110+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_86D8B
; ���������������������������������������������������������������������������

loc_86D1D:				; CODE XREF: sub_81470+5936j
		mov	ax, [bp+var_B59]
		mov	[bp+var_112], ax
		cmp	[bp+var_112], 3
		jge	short loc_86D40
		push	1
		push	0Ah
		push	word ptr [bp+var_110+2]
		mov	bx, word ptr [bp+var_110+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_86D40:				; CODE XREF: sub_81470+58BAj
		cmp	[bp+var_112], 4
		jnz	short loc_86D56
		push	14h
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_86D56:				; CODE XREF: sub_81470+58D5j
		cmp	[bp+var_112], 8
		jle	short loc_86D71
		push	0FFFFh
		push	0FFF4h
		push	word ptr [bp+var_110+2]
		mov	bx, word ptr [bp+var_110+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_86D71:				; CODE XREF: sub_81470+58EBj
		jmp	short loc_86D7E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_86D7E
		jmp	short loc_86DA9
; ���������������������������������������������������������������������������

loc_86D7E:				; CODE XREF: sub_81470:loc_86D71j
					; sub_81470+590Aj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_86D8B:				; CODE XREF: sub_81470+58ABj
		cmp	[bp+var_B59], 12h
		jnb	short loc_86D99
		cmp	[bp+var_B57], 0
		jz	short loc_86D9E

loc_86D99:				; CODE XREF: sub_81470+5920j
		mov	ax, 1
		jmp	short loc_86DA0
; ���������������������������������������������������������������������������

loc_86D9E:				; CODE XREF: sub_81470+5927j
		xor	ax, ax

loc_86DA0:				; CODE XREF: sub_81470+592Cj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_86DA9
		jmp	loc_86D1D
; ���������������������������������������������������������������������������

loc_86DA9:				; CODE XREF: sub_81470+590Cj
					; sub_81470+5934j
		push	2
		lea	ax, [bp+var_10A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_100+1], 0
		jz	short loc_86DE0
		cmp	[bp+var_106+2],	0
		jz	short loc_86DE0
		push	0
		mov	al, byte ptr [bp+var_100]
		push	ax
		lea	ax, [bp+var_106+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_86DE0:				; CODE XREF: sub_81470+594Dj
					; sub_81470+5955j
		mov	[bp+var_106+2],	0
		mov	byte ptr [bp+var_100+1], 0
		mov	[bp+var_100+2],	0
		cmp	byte ptr [bp+var_F6+1],	0
		jz	short loc_86E1F
		cmp	[bp+var_FA], 0
		jz	short loc_86E1F
		push	0
		mov	al, byte ptr [bp+var_F6]
		push	ax
		lea	ax, [bp+var_FA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_86E1F:				; CODE XREF: sub_81470+598Cj
					; sub_81470+5994j
		mov	[bp+var_FA], 0
		mov	byte ptr [bp+var_F6+1],	0
		mov	[bp+var_F6+2], 0
		cmp	byte ptr [bp+var_EC+1],	0
		jz	short loc_86E5E
		cmp	[bp+var_F2+2], 0
		jz	short loc_86E5E
		push	0
		mov	al, byte ptr [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F2+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_86E5E:				; CODE XREF: sub_81470+59CBj
					; sub_81470+59D3j
		mov	[bp+var_F2+2], 0
		mov	byte ptr [bp+var_EC+1],	0
		mov	[bp+var_EC+2], 0
		cmp	byte ptr [bp+var_E2+1],	0
		jz	short loc_86E9D
		cmp	[bp+var_E6], 0
		jz	short loc_86E9D
		push	0
		mov	al, byte ptr [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_86E9D:				; CODE XREF: sub_81470+5A0Aj
					; sub_81470+5A12j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_86ECD
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_86ECD:				; CODE XREF: sub_81470+5A58j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2], 2
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		push	3
		lea	ax, [bp+var_E6]
		push	ax
		push	0Dh
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0FFFEh
		lea	ax, [bp+var_E6]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_E8], ax
		push	0
		push	0
		lea	ax, [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_EC+2],	ax
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_EC], ax
		push	word ptr [bp+var_EC+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_EC]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_E8]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_F6], 0
		mov	byte ptr [bp+var_F2], 2
		mov	byte ptr [bp+var_F2+1],	0
		mov	[bp+var_F2+2], 0
		mov	[bp+var_B80], 0
		mov	[bp+var_B7C], 2
		mov	[bp+var_B7B], 0
		mov	[bp+var_B7A], 0
		mov	word ptr [bp+var_B86+2], 0
		mov	[bp+var_B82], 0FFFFh
		cmp	[bp+var_B], 0
		jz	short loc_87068
		push	3
		lea	ax, [bp+var_F6]
		push	ax
		push	2Dh ; '-'
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_B86+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_B86+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_87068:				; CODE XREF: sub_81470+5BBBj
		push	0Eh
		push	word ptr [bp+var_EC]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		jmp	loc_8714B
; ���������������������������������������������������������������������������

loc_87079:				; CODE XREF: sub_81470+5CF6j
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_FA+2],	ax
		cmp	word ptr [bp+var_FA+2],	4
		jnz	short loc_870D2
		cmp	[bp+var_B], 0
		jz	short loc_870D2
		mov	ax, word_48EFC
		mov	word ptr [bp+var_FA], ax
		mov	[bp+var_FC], 0
		cmp	word ptr [bp+var_B86+2], 0
		jz	short loc_870D2
		push	[bp+var_B82]
		mov	bx, word ptr [bp+var_B86+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_FC]
		push	word ptr [bp+var_FA]
		push	[bp+var_B82]
		mov	bx, word ptr [bp+var_B86+2]
		push	word ptr [bx+4]
		call	sub_30C66
		add	sp, 8
		jmp	short $+2

loc_870D2:				; CODE XREF: sub_81470+5C16j
					; sub_81470+5C1Cj ...
		cmp	word ptr [bp+var_FA+2],	5
		jnz	short loc_870E2
		mov	bx, [bp+var_E8]
		mov	word ptr [bx+1Bh], 1

loc_870E2:				; CODE XREF: sub_81470+5C67j
		cmp	word ptr [bp+var_FA+2],	6
		jnz	short loc_870F2
		mov	bx, [bp+var_E8]
		mov	word ptr [bx+1Bh], 0

loc_870F2:				; CODE XREF: sub_81470+5C77j
		cmp	word ptr [bp+var_FA+2],	6
		jnz	short loc_87107
		push	0Ch
		push	word ptr [bp+var_EC]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_87107:				; CODE XREF: sub_81470+5C87j
		cmp	word ptr [bp+var_FA+2],	7
		jnz	short loc_8711C
		push	0FFFFh
		push	word ptr [bp+var_EC]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8711C:				; CODE XREF: sub_81470+5C9Cj
		cmp	word ptr [bp+var_FA+2],	7
		jnz	short loc_87131
		push	0Eh
		push	word ptr [bp+var_EC]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_87131:				; CODE XREF: sub_81470+5CB1j
		jmp	short loc_8713E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8713E
		jmp	short loc_87169
; ���������������������������������������������������������������������������

loc_8713E:				; CODE XREF: sub_81470:loc_87131j
					; sub_81470+5CCAj
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8714B:				; CODE XREF: sub_81470+5C06j
		cmp	[bp+var_B59], 9
		jnb	short loc_87159
		cmp	[bp+var_B57], 0
		jz	short loc_8715E

loc_87159:				; CODE XREF: sub_81470+5CE0j
		mov	ax, 1
		jmp	short loc_87160
; ���������������������������������������������������������������������������

loc_8715E:				; CODE XREF: sub_81470+5CE7j
		xor	ax, ax

loc_87160:				; CODE XREF: sub_81470+5CECj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_87169
		jmp	loc_87079
; ���������������������������������������������������������������������������

loc_87169:				; CODE XREF: sub_81470+5CCCj
					; sub_81470+5CF4j
		lea	ax, [bp+var_B86+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_B7B], 0
		jz	short loc_8719E
		cmp	[bp+var_B80], 0
		jz	short loc_8719E
		push	0
		mov	al, [bp+var_B7C]
		push	ax
		lea	ax, [bp+var_B80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8719E:				; CODE XREF: sub_81470+5D0Bj
					; sub_81470+5D13j
		mov	[bp+var_B80], 0
		mov	[bp+var_B7B], 0
		mov	[bp+var_B7A], 0
		cmp	byte ptr [bp+var_F2+1],	0
		jz	short loc_871DD
		cmp	[bp+var_F6], 0
		jz	short loc_871DD
		push	0
		mov	al, byte ptr [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_871DD:				; CODE XREF: sub_81470+5D4Aj
					; sub_81470+5D52j
		mov	[bp+var_F6], 0
		mov	byte ptr [bp+var_F2+1],	0
		mov	[bp+var_F2+2], 0
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_E2+1],	0
		jz	short loc_8722B
		cmp	[bp+var_E6], 0
		jz	short loc_8722B
		push	0
		mov	al, byte ptr [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8722B:				; CODE XREF: sub_81470+5D98j
					; sub_81470+5DA0j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		cmp	byte_495FC, 0
		jz	short loc_8724C
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_8724C:				; CODE XREF: sub_81470+5DD7j
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_48]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_DE], ax
		push	0
		push	0
		push	0C8h ; '�'
		push	0
		push	11h
		push	2Ch ; ','
		lea	ax, [bp+var_66]
		push	ax
		push	0
		call	sub_9391
		add	sp, 10h
		mov	word ptr [bp+var_E2+2],	ax
		push	0
		push	0
		push	0A0h ; '�'
		push	0
		push	23h ; '#'
		push	32h ; '2'
		lea	ax, [bp+var_5C]
		push	ax
		push	0
		call	sub_9391
		add	sp, 10h
		mov	word ptr [bp+var_E2], ax
		push	0Dh
		push	0
		push	0A0h ; '�'
		push	0
		push	23h ; '#'
		push	32h ; '2'
		lea	ax, [bp+var_52]
		push	ax
		push	0
		call	sub_9391
		add	sp, 10h
		mov	word ptr [bp+var_E6+2],	ax
		push	[bp+var_DE]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E6+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_A6]
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	dword ptr [bp+var_EE], 0
		mov	byte ptr [bp+var_EC+2],	2
		mov	byte ptr [bp+var_EC+3],	0
		mov	dword ptr [bp+var_E8], 0
		mov	[bp+var_B80], 0
		mov	[bp+var_B7C], 2
		mov	[bp+var_B7B], 0
		mov	[bp+var_B7A], 0
		mov	word ptr [bp+var_B86+2], 0
		mov	[bp+var_B82], 0FFFFh
		cmp	[bp+var_B], 0
		jz	short loc_873DC
		push	3
		lea	ax, [bp+var_EE]
		push	ax
		push	5Ah ; 'Z'
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_B86+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_B86+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_873DC:				; CODE XREF: sub_81470+5F2Fj
		push	0
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	27h ; '''
		lea	ax, [bp+var_B54]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp+var_F2+2],	0Dh
		mov	bx, word ptr [bp+var_E6+2]
		mov	word ptr [bx+1Bh], 0
		jmp	loc_874C4
; ���������������������������������������������������������������������������

loc_8740C:				; CODE XREF: sub_81470+606Fj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_F2], ax
		cmp	word ptr [bp+var_F2], 1Dh
		jnz	short loc_87465
		cmp	[bp+var_B], 0
		jz	short loc_87465
		mov	ax, word_48F56
		mov	word ptr [bp+var_F6+2],	ax
		mov	word ptr [bp+var_F6], 0
		cmp	word ptr [bp+var_B86+2], 0
		jz	short loc_87465
		push	[bp+var_B82]
		mov	bx, word ptr [bp+var_B86+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_F6]
		push	word ptr [bp+var_F6+2]
		push	[bp+var_B82]
		mov	bx, word ptr [bp+var_B86+2]
		push	word ptr [bx+4]
		call	sub_30C66
		add	sp, 8
		jmp	short $+2

loc_87465:				; CODE XREF: sub_81470+5FA9j
					; sub_81470+5FAFj ...
		cmp	word ptr [bp+var_F2], 0
		jle	short loc_8748A
		cmp	word ptr [bp+var_F2], 2Ch ; ','
		jge	short loc_8748A
		mov	ax, word ptr [bp+var_F2+2]
		mov	word ptr [bp+var_FA+2],	ax
		inc	word ptr [bp+var_F2+2]
		mov	bx, word ptr [bp+var_E6+2]
		mov	ax, word ptr [bp+var_FA+2]
		mov	[bx+1Bh], ax

loc_8748A:				; CODE XREF: sub_81470+5FFAj
					; sub_81470+6001j
		cmp	word ptr [bp+var_F2], 20h ; ' '
		jnz	short loc_8749A
		mov	bx, word ptr [bp+var_E2+2]
		mov	word ptr [bx+1Bh], 1

loc_8749A:				; CODE XREF: sub_81470+601Fj
		cmp	word ptr [bp+var_F2], 22h ; '"'
		jnz	short loc_874AA
		mov	bx, word ptr [bp+var_E2+2]
		mov	word ptr [bx+1Bh], 2

loc_874AA:				; CODE XREF: sub_81470+602Fj
		jmp	short loc_874B7
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_874B7
		jmp	short loc_874E2
; ���������������������������������������������������������������������������

loc_874B7:				; CODE XREF: sub_81470:loc_874AAj
					; sub_81470+6043j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_874C4:				; CODE XREF: sub_81470+5F99j
		cmp	[bp+var_B59], 39h ; '9'
		jnb	short loc_874D2
		cmp	[bp+var_B57], 0
		jz	short loc_874D7

loc_874D2:				; CODE XREF: sub_81470+6059j
		mov	ax, 1
		jmp	short loc_874D9
; ���������������������������������������������������������������������������

loc_874D7:				; CODE XREF: sub_81470+6060j
		xor	ax, ax

loc_874D9:				; CODE XREF: sub_81470+6065j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_874E2
		jmp	loc_8740C
; ���������������������������������������������������������������������������

loc_874E2:				; CODE XREF: sub_81470+6045j
					; sub_81470+606Dj
		lea	ax, [bp+var_B86+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_B7B], 0
		jz	short loc_87517
		cmp	[bp+var_B80], 0
		jz	short loc_87517
		push	0
		mov	al, [bp+var_B7C]
		push	ax
		lea	ax, [bp+var_B80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87517:				; CODE XREF: sub_81470+6084j
					; sub_81470+608Cj
		mov	[bp+var_B80], 0
		mov	[bp+var_B7B], 0
		mov	[bp+var_B7A], 0
		cmp	byte ptr [bp+var_EC+3],	0
		jz	short loc_87556
		cmp	dword ptr [bp+var_EE], 0
		jz	short loc_87556
		push	0
		mov	al, byte ptr [bp+var_EC+2]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87556:				; CODE XREF: sub_81470+60C3j
					; sub_81470+60CBj
		mov	dword ptr [bp+var_EE], 0
		mov	byte ptr [bp+var_EC+3],	0
		mov	dword ptr [bp+var_E8], 0
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_87586
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_87586:				; CODE XREF: sub_81470+6111j
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_34]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_DE], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_E2+2],	ax
		push	[bp+var_DE]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_E2+2]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	1Fh
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	13h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		jmp	short loc_876EF
; ���������������������������������������������������������������������������

loc_87679:				; CODE XREF: sub_81470+629Aj
		mov	ax, [bp+var_B59]
		mov	word ptr [bp+var_E2], ax
		cmp	word ptr [bp+var_E2], 2
		jnz	short loc_87696
		push	0Ch
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_87696:				; CODE XREF: sub_81470+6216j
		cmp	word ptr [bp+var_E2], 3
		jnz	short loc_876AB
		push	13h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_876AB:				; CODE XREF: sub_81470+622Bj
		cmp	word ptr [bp+var_E2], 0Ch
		jnz	short loc_876C0
		push	0Ch
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_876C0:				; CODE XREF: sub_81470+6240j
		cmp	word ptr [bp+var_E2], 0Dh
		jnz	short loc_876D5
		push	13h
		push	word ptr [bp+var_E2+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_876D5:				; CODE XREF: sub_81470+6255j
		jmp	short loc_876E2
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_876E2
		jmp	short loc_8770D
; ���������������������������������������������������������������������������

loc_876E2:				; CODE XREF: sub_81470:loc_876D5j
					; sub_81470+626Ej
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_876EF:				; CODE XREF: sub_81470+6207j
		cmp	[bp+var_B59], 14h
		jnb	short loc_876FD
		cmp	[bp+var_B57], 0
		jz	short loc_87702

loc_876FD:				; CODE XREF: sub_81470+6284j
		mov	ax, 1
		jmp	short loc_87704
; ���������������������������������������������������������������������������

loc_87702:				; CODE XREF: sub_81470+628Bj
		xor	ax, ax

loc_87704:				; CODE XREF: sub_81470+6290j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8770D
		jmp	loc_87679
; ���������������������������������������������������������������������������

loc_8770D:				; CODE XREF: sub_81470+6270j
					; sub_81470+6298j
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_87726
		jmp	loc_87924
; ���������������������������������������������������������������������������

loc_87726:				; CODE XREF: sub_81470+62B1j
		lea	ax, [bp+var_170]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2], 2
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		push	3
		lea	ax, [bp+var_E6]
		push	ax
		push	10h
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_E6]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_E8], ax
		mov	[bp+var_F2], 0
		mov	[bp+var_EE], 2
		mov	[bp+var_ED], 0
		mov	[bp+var_EC], 0
		push	2
		lea	ax, [bp+var_F2]
		push	ax
		push	19h
		lea	ax, [bp+var_1F6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_F6+1],	0
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_FA+2]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+var_E8]
		lea	ax, [bp+var_B76]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_FA+2]
		mov	al, byte ptr [bp+var_F6]
		push	ax
		lea	ax, [bp+var_FA+2]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_4], 1Eh
		mov	si, [bp+var_B59]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	short loc_87857
; ���������������������������������������������������������������������������

loc_8783D:				; CODE XREF: sub_81470+63FFj
		jmp	short loc_8784A
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8784A
		jmp	short loc_87871
; ���������������������������������������������������������������������������

loc_8784A:				; CODE XREF: sub_81470:loc_8783Dj
					; sub_81470+63D6j
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_87857:				; CODE XREF: sub_81470+63CBj
		cmp	[bp+var_B59], di
		jnb	short loc_87864
		cmp	[bp+var_B57], 0
		jz	short loc_87869

loc_87864:				; CODE XREF: sub_81470+63EBj
		mov	ax, 1
		jmp	short loc_8786B
; ���������������������������������������������������������������������������

loc_87869:				; CODE XREF: sub_81470+63F2j
		xor	ax, ax

loc_8786B:				; CODE XREF: sub_81470+63F7j
		mov	ah, 0
		or	ax, ax
		jz	short loc_8783D

loc_87871:				; CODE XREF: sub_81470+63D8j
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	2
		lea	ax, [bp+var_FA+2]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_ED], 0
		jz	short loc_878BF
		cmp	[bp+var_F2], 0
		jz	short loc_878BF
		push	0
		mov	al, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_878BF:				; CODE XREF: sub_81470+642Cj
					; sub_81470+6434j
		mov	[bp+var_F2], 0
		mov	[bp+var_ED], 0
		mov	[bp+var_EC], 0
		cmp	byte ptr [bp+var_E2+1],	0
		jz	short loc_878FE
		cmp	[bp+var_E6], 0
		jz	short loc_878FE
		push	0
		mov	al, byte ptr [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_878FE:				; CODE XREF: sub_81470+646Bj
					; sub_81470+6473j
		mov	[bp+var_E6], 0
		mov	byte ptr [bp+var_E2+1],	0
		mov	[bp+var_E2+2], 0
		push	0
		lea	ax, [bp+var_B76]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4

loc_87924:				; CODE XREF: sub_81470+DDDj
					; sub_81470+1205j ...
		lea	ax, [bp+var_B52]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B32]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_BF], 0
		jz	short loc_87968
		cmp	[bp+var_C4], 0
		jz	short loc_87968
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87968:				; CODE XREF: sub_81470+64D5j
					; sub_81470+64DDj
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_879A7
		cmp	[bp+var_BA], 0
		jz	short loc_879A7
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_879A7:				; CODE XREF: sub_81470+6514j
					; sub_81470+651Cj
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_879E6
		cmp	[bp+var_B0], 0
		jz	short loc_879E6
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_879E6:				; CODE XREF: sub_81470+6553j
					; sub_81470+655Bj
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_87A34
		cmp	[bp+var_A0], 0
		jz	short loc_87A34
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87A34:				; CODE XREF: sub_81470+65A1j
					; sub_81470+65A9j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_87A82
		cmp	[bp+var_90], 0
		jz	short loc_87A82
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87A82:				; CODE XREF: sub_81470+65EFj
					; sub_81470+65F7j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_87ACC
		cmp	[bp+var_80], 0
		jz	short loc_87ACC
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87ACC:				; CODE XREF: sub_81470+663Cj
					; sub_81470+6643j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_87B12
		cmp	[bp+var_70], 0
		jz	short loc_87B12
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87B12:				; CODE XREF: sub_81470+6682j
					; sub_81470+6689j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_87B4A
		cmp	[bp+var_66], 0
		jz	short loc_87B4A
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87B4A:				; CODE XREF: sub_81470+66BAj
					; sub_81470+66C1j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_87B82
		cmp	[bp+var_5C], 0
		jz	short loc_87B82
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87B82:				; CODE XREF: sub_81470+66F2j
					; sub_81470+66F9j
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_87BBA
		cmp	[bp+var_52], 0
		jz	short loc_87BBA
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87BBA:				; CODE XREF: sub_81470+672Aj
					; sub_81470+6731j
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_87BF2
		cmp	[bp+var_48], 0
		jz	short loc_87BF2
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87BF2:				; CODE XREF: sub_81470+6762j
					; sub_81470+6769j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_87C2A
		cmp	[bp+var_3E], 0
		jz	short loc_87C2A
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87C2A:				; CODE XREF: sub_81470+679Aj
					; sub_81470+67A1j
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_87C62
		cmp	[bp+var_34], 0
		jz	short loc_87C62
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87C62:				; CODE XREF: sub_81470+67D2j
					; sub_81470+67D9j
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_B1A], 185Fh
		lea	ax, [bp+var_B1A]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B05], 0
		jz	short loc_87CB1
		cmp	[bp+var_B0A], 0
		jz	short loc_87CB1
		push	0
		mov	al, [bp+var_B06]
		push	ax
		lea	ax, [bp+var_B0A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87CB1:				; CODE XREF: sub_81470+681Ej
					; sub_81470+6826j
		mov	[bp+var_B0A], 0
		mov	[bp+var_B05], 0
		mov	[bp+var_B04], 0
		lea	ax, [bp+var_2F4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_2EB], 0
		jz	short loc_87CFD
		cmp	[bp+var_2F0], 0
		jz	short loc_87CFD
		push	0
		mov	al, [bp+var_2EC]
		push	ax
		lea	ax, [bp+var_2F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87CFD:				; CODE XREF: sub_81470+686Aj
					; sub_81470+6872j
		mov	[bp+var_2F0], 0
		mov	[bp+var_2EB], 0
		mov	[bp+var_2EA], 0
		push	2
		lea	ax, [bp+var_2E6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_87D47
		cmp	[bp+var_26], 0
		jz	short loc_87D47
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_87D47:				; CODE XREF: sub_81470+68B7j
					; sub_81470+68BEj
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_26E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1F6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_17E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_170]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_81470	endp

ovr201		ends
