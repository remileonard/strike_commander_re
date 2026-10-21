ovr203		segment	para public 'OVERLAY' use16
		assume cs:ovr203
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_8B630	proc far		; CODE XREF: sub_42500J

var_DE8		= word ptr -0DE8h
var_DB8		= word ptr -0DB8h
var_D8B		= dword	ptr -0D8Bh
var_D87		= dword	ptr -0D87h
var_D83		= dword	ptr -0D83h
var_D7C		= word ptr -0D7Ch
var_D76		= word ptr -0D76h
var_D72		= dword	ptr -0D72h
var_D6E		= word ptr -0D6Eh
var_D6C		= dword	ptr -0D6Ch
var_D68		= byte ptr -0D68h
var_D67		= byte ptr -0D67h
var_D66		= dword	ptr -0D66h
var_D62		= word ptr -0D62h
var_D53		= word ptr -0D53h
var_D51		= byte ptr -0D51h
var_D4E		= word ptr -0D4Eh
var_D4C		= word ptr -0D4Ch
var_D4A		= dword	ptr -0D4Ah
var_D46		= byte ptr -0D46h
var_D45		= dword	ptr -0D45h
var_D40		= word ptr -0D40h
var_D3E		= word ptr -0D3Eh
var_D3C		= dword	ptr -0D3Ch
var_D38		= byte ptr -0D38h
var_D37		= byte ptr -0D37h
var_D36		= dword	ptr -0D36h
var_D32		= word ptr -0D32h
var_D30		= word ptr -0D30h
var_D2E		= dword	ptr -0D2Eh
var_D2A		= byte ptr -0D2Ah
var_D29		= byte ptr -0D29h
var_D28		= dword	ptr -0D28h
var_D24		= word ptr -0D24h
var_D22		= word ptr -0D22h
var_D0B		= word ptr -0D0Bh
var_D09		= word ptr -0D09h
var_D07		= word ptr -0D07h
var_D05		= word ptr -0D05h
var_D02		= word ptr -0D02h
var_CEA		= word ptr -0CEAh
var_CE8		= word ptr -0CE8h
var_CDA		= dword	ptr -0CDAh
var_CD6		= byte ptr -0CD6h
var_CD5		= byte ptr -0CD5h
var_CD4		= dword	ptr -0CD4h
var_4CD		= dword	ptr -4CDh
var_4C9		= dword	ptr -4C9h
var_4C4		= word ptr -4C4h
var_4C2		= word ptr -4C2h
var_4C0		= dword	ptr -4C0h
var_4BC		= byte ptr -4BCh
var_4BB		= byte ptr -4BBh
var_4BA		= dword	ptr -4BAh
var_4B6		= word ptr -4B6h
var_43E		= word ptr -43Eh
var_3C6		= word ptr -3C6h
var_34E		= word ptr -34Eh
var_2D6		= word ptr -2D6h
var_25E		= word ptr -25Eh
var_1E6		= word ptr -1E6h
var_1E4		= word ptr -1E4h
var_1E2		= word ptr -1E2h
var_1E0		= word ptr -1E0h
var_1DE		= word ptr -1DEh
var_1DC		= word ptr -1DCh
var_1D8		= word ptr -1D8h
var_1D6		= word ptr -1D6h
var_1D4		= word ptr -1D4h
var_1D2		= word ptr -1D2h
var_1D0		= word ptr -1D0h
var_1CE		= word ptr -1CEh
var_1CA		= word ptr -1CAh
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_176		= dword	ptr -176h
var_172		= byte ptr -172h
var_171		= byte ptr -171h
var_170		= dword	ptr -170h
var_16A		= dword	ptr -16Ah
var_166		= word ptr -166h
var_164		= dword	ptr -164h
var_160		= dword	ptr -160h
var_15C		= dword	ptr -15Ch
var_158		= dword	ptr -158h
var_154		= dword	ptr -154h
var_150		= word ptr -150h
var_14E		= word ptr -14Eh
var_14C		= dword	ptr -14Ch
var_148		= dword	ptr -148h
var_144		= dword	ptr -144h
var_140		= word ptr -140h
var_13E		= word ptr -13Eh
var_13C		= word ptr -13Ch
var_13A		= dword	ptr -13Ah
var_136		= byte ptr -136h
var_135		= byte ptr -135h
var_134		= dword	ptr -134h
var_130		= dword	ptr -130h
var_12C		= byte ptr -12Ch
var_12B		= byte ptr -12Bh
var_12A		= dword	ptr -12Ah
var_126		= word ptr -126h
var_124		= word ptr -124h
var_122		= word ptr -122h
var_120		= word ptr -120h
var_11E		= word ptr -11Eh
var_11C		= word ptr -11Ch
var_11A		= word ptr -11Ah
var_118		= word ptr -118h
var_116		= dword	ptr -116h
var_112		= dword	ptr -112h
var_10E		= byte ptr -10Eh
var_10D		= byte ptr -10Dh
var_10C		= dword	ptr -10Ch
var_108		= word ptr -108h
var_106		= byte ptr -106h
var_105		= word ptr -105h
var_102		= dword	ptr -102h
var_FE		= byte ptr -0FEh
var_FD		= byte ptr -0FDh
var_FC		= dword	ptr -0FCh
var_F8		= word ptr -0F8h
var_F6		= byte ptr -0F6h
var_F5		= word ptr -0F5h
var_F2		= dword	ptr -0F2h
var_EE		= byte ptr -0EEh
var_ED		= byte ptr -0EDh
var_EC		= dword	ptr -0ECh
var_E8		= word ptr -0E8h
var_E6		= byte ptr -0E6h
var_E5		= word ptr -0E5h
var_E2		= dword	ptr -0E2h
var_DE		= byte ptr -0DEh
var_DD		= byte ptr -0DDh
var_DC		= dword	ptr -0DCh
var_D8		= word ptr -0D8h
var_D5		= word ptr -0D5h
var_D2		= dword	ptr -0D2h
var_CE		= byte ptr -0CEh
var_CD		= byte ptr -0CDh
var_CC		= dword	ptr -0CCh
var_C8		= word ptr -0C8h
var_C6		= byte ptr -0C6h
var_C5		= word ptr -0C5h
var_C2		= dword	ptr -0C2h
var_BE		= byte ptr -0BEh
var_BD		= byte ptr -0BDh
var_BC		= dword	ptr -0BCh
var_B8		= word ptr -0B8h
var_B6		= byte ptr -0B6h
var_B5		= word ptr -0B5h
var_B2		= dword	ptr -0B2h
var_AE		= byte ptr -0AEh
var_AD		= byte ptr -0ADh
var_AC		= dword	ptr -0ACh
var_A8		= word ptr -0A8h
var_A6		= byte ptr -0A6h
var_A5		= word ptr -0A5h
var_A2		= dword	ptr -0A2h
var_9E		= byte ptr -9Eh
var_9D		= byte ptr -9Dh
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= byte ptr -94h
var_93		= byte ptr -93h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= byte ptr -8Ah
var_89		= byte ptr -89h
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= byte ptr -80h
var_7F		= byte ptr -7Fh
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= byte ptr -76h
var_75		= byte ptr -75h
var_74		= dword	ptr -74h
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
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= byte ptr -30h
var_2E		= byte ptr -2Eh
var_2C		= dword	ptr -2Ch
var_28		= byte ptr -28h
var_27		= byte ptr -27h
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= byte ptr -20h
var_1E		= word ptr -1Eh
var_1C		= byte ptr -1Ch
var_18		= word ptr -18h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0DE8h
		push	si
		push	di
		mov	[bp+var_2], 22F9h
		mov	[bp+var_4], 22FCh
		mov	[bp+var_6], 2300h
		mov	[bp+var_C], 0
		push	0C8h ; '�'
		push	1Ah
		lea	ax, [bp+var_E]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	[bp+var_F], 0
		mov	[bp+var_10], 0
		mov	[bp+var_11], 0
		cmp	word_4684B, 0
		jz	short loc_8B675
		mov	[bp+var_10], 1

loc_8B675:				; CODE XREF: sub_8B630+3Fj
		mov	ax, word_46F46
		mov	[bp+var_14], ax
		mov	[bp+var_1D8], 0
		mov	[bp+var_1D6], 0
		push	[bp+var_14]
		lea	ax, [bp+var_1D8]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_1E6], 0
		mov	[bp+var_1E4], 0
		mov	[bp+var_1E2], 0
		mov	[bp+var_1E0], 0
		mov	[bp+var_1DE], 13Fh
		mov	[bp+var_1DC], 9Dh ; '�'
		push	0
		lea	ax, [bp+var_1E6]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_1E6]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_1D4], 0
		mov	[bp+var_1D2], 18h
		mov	[bp+var_1D0], 13Fh
		mov	[bp+var_1CE], 97h ; '�'
		mov	byte ptr [bp+var_22], 0
		mov	byte ptr [bp+var_22+1],	0
		mov	[bp+var_20], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid15	; "mid15"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		lea	ax, [bp+var_25E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_22 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		lea	ax, [bp+var_2D6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_4 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		lea	ax, [bp+var_34E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_4 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		lea	ax, [bp+var_3C6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid15voc ; "mid15voc"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_43E]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	[bp+var_10], 0
		jz	short loc_8B81A
		push	ds
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_8B81A
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		lea	ax, [bp+var_43E]
		push	ax
		mov	bx, [bp+var_43E]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_8B81E
; ���������������������������������������������������������������������������

loc_8B81A:				; CODE XREF: sub_8B630+1BEj
					; sub_8B630+1D0j
		mov	[bp+var_10], 0

loc_8B81E:				; CODE XREF: sub_8B630+1E8j
		mov	[bp+var_2C], 0
		mov	[bp+var_28], 2
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		mov	al, byte_46848
		mov	[bp+var_2E], al
		lea	ax, [bp+var_4B6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_2E]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_8B85E
		cmp	ax, 2
		jnz	short loc_8B85B
		jmp	loc_8B9CA
; ���������������������������������������������������������������������������

loc_8B85B:				; CODE XREF: sub_8B630+226j
		jmp	loc_8BB35
; ���������������������������������������������������������������������������

loc_8B85E:				; CODE XREF: sub_8B630+221j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_8B88C
		jmp	loc_8B989
; ���������������������������������������������������������������������������

loc_8B88C:				; CODE XREF: sub_8B630+257j
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		lea	ax, [bp+var_4B6]
		push	ax
		mov	bx, [bp+var_4B6]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_23 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_DE8]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_DE8], 556h
		mov	[bp+var_D87], 100h
		mov	[bp+var_D8B], 0
		mov	[bp+var_DE8], 56Eh
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		lea	ax, [bp+var_DE8]
		push	ax
		mov	bx, [bp+var_DE8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	di, 1
		jmp	short loc_8B951
; ���������������������������������������������������������������������������

loc_8B93B:				; CODE XREF: sub_8B630+324j
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	di

loc_8B951:				; CODE XREF: sub_8B630+309j
		cmp	di, 6Ah	; 'j'
		jle	short loc_8B93B
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_11], 1
		mov	[bp+var_DE8], 56Eh
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_DE8]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_8B989:				; CODE XREF: sub_8B630+259j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_8B9C7
		mov	[bp+var_F], 1
		mov	al, [bp+var_11]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8B9C7
		mov	word_48F76, 5Ah	; 'Z'

loc_8B9C7:				; CODE XREF: sub_8B630+382j
					; sub_8B630+38Fj
		jmp	loc_8BB35
; ���������������������������������������������������������������������������

loc_8B9CA:				; CODE XREF: sub_8B630+228j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_8B9F8
		jmp	loc_8BAF5
; ���������������������������������������������������������������������������

loc_8B9F8:				; CODE XREF: sub_8B630+3C3j
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		lea	ax, [bp+var_4B6]
		push	ax
		mov	bx, [bp+var_4B6]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_24 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_DE8]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_DE8], 556h
		mov	[bp+var_D87], 100h
		mov	[bp+var_D8B], 0
		mov	[bp+var_DE8], 56Eh
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		lea	ax, [bp+var_DE8]
		push	ax
		mov	bx, [bp+var_DE8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	di, 1
		jmp	short loc_8BABD
; ���������������������������������������������������������������������������

loc_8BAA7:				; CODE XREF: sub_8B630+490j
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	di

loc_8BABD:				; CODE XREF: sub_8B630+475j
		cmp	di, 6Ah	; 'j'
		jle	short loc_8BAA7
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_11], 1
		mov	[bp+var_DE8], 56Eh
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_DE8]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_8BAF5:				; CODE XREF: sub_8B630+3C5j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_8BB33
		mov	[bp+var_F], 1
		mov	al, [bp+var_11]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8BB33
		mov	word_48F76, 0FFh

loc_8BB33:				; CODE XREF: sub_8B630+4EEj
					; sub_8B630+4FBj
		jmp	short $+2

loc_8BB35:				; CODE XREF: sub_8B630:loc_8B85Bj
					; sub_8B630:loc_8B9C7j
		mov	ax, word_45314
		mov	[bp+var_34], ax
		mov	ax, word_45316
		mov	[bp+var_32], ax
		mov	al, byte_45318
		mov	[bp+var_30], al
		cmp	[bp+var_11], 0
		jnz	short loc_8BB50
		jmp	loc_8BC79
; ���������������������������������������������������������������������������

loc_8BB50:				; CODE XREF: sub_8B630+51Bj
		mov	[bp+var_D4A], 0
		mov	[bp+var_D46], 2
		mov	byte ptr [bp+var_D45], 0
		mov	[bp+var_D45+1],	0
		mov	[bp+var_D4E], 0
		mov	[bp+var_D4C], 0FFFFh
		push	word_46849
		lea	ax, [bp+var_D4E]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		xor	di, di
		jmp	loc_8BC25
; ���������������������������������������������������������������������������

loc_8BB8E:				; CODE XREF: sub_8B630+5FAj
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144], 2
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		push	3
		lea	ax, [bp+var_148]
		push	ax
		mov	al, byte ptr [bp+di+var_34]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		lea	ax, [bp+var_148]
		push	ax
		lea	ax, [bp+var_D4E]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_D4E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_8BC0D
		cmp	[bp+var_148], 0
		jz	short loc_8BC0D
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8BC0D:				; CODE XREF: sub_8B630+5BAj
					; sub_8B630+5C2j
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		inc	di

loc_8BC25:				; CODE XREF: sub_8B630+55Bj
		cmp	di, 5
		jge	short loc_8BC2D
		jmp	loc_8BB8E
; ���������������������������������������������������������������������������

loc_8BC2D:				; CODE XREF: sub_8B630+5F8j
		lea	ax, [bp+var_D4E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_D45], 0
		jz	short loc_8BC62
		cmp	[bp+var_D4A], 0
		jz	short loc_8BC62
		push	0
		mov	al, [bp+var_D46]
		push	ax
		lea	ax, [bp+var_D4A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8BC62:				; CODE XREF: sub_8B630+60Fj
					; sub_8B630+617j
		mov	[bp+var_D4A], 0
		mov	byte ptr [bp+var_D45], 0
		mov	[bp+var_D45+1],	0

loc_8BC79:				; CODE XREF: sub_8B630+51Dj
		mov	[bp+var_4C0], 0
		mov	[bp+var_4BC], 2
		mov	[bp+var_4BB], 0
		mov	[bp+var_4BA], 0
		mov	[bp+var_4C4], 0
		mov	[bp+var_4C2], 0FFFFh
		cmp	[bp+var_F], 0
		jz	short loc_8BD1A
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		lea	ax, [bp+var_DB8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	[bp+var_10], 0
		jz	short loc_8BCC8
		mov	byte ptr [bp+var_140+1], 0Ah
		jmp	short loc_8BCCD
; ���������������������������������������������������������������������������

loc_8BCC8:				; CODE XREF: sub_8B630+68Fj
		mov	byte ptr [bp+var_140+1], 9

loc_8BCCD:				; CODE XREF: sub_8B630+696j
		push	3
		lea	ax, [bp+var_2C]
		push	ax
		mov	al, byte ptr [bp+var_140+1]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_DB8]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_4C4]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_4C4]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_DB8]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_8BD1A:				; CODE XREF: sub_8B630+675j
		mov	[bp+var_CEA], 185Fh
		mov	[bp+var_CDA], 0
		mov	[bp+var_CD6], 2
		mov	[bp+var_CD5], 0
		mov	[bp+var_CD4], 0
		mov	[bp+var_CE8], 0
		mov	[bp+var_CEA], 186Fh
		xor	eax, eax
		mov	[bp+var_4CD], eax
		mov	[bp+var_4C9], eax
		cmp	[bp+var_10], 0
		jz	short loc_8BD6F
		push	word_4684B
		lea	ax, [bp+var_CEA]
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		jmp	loc_8C062
; ���������������������������������������������������������������������������

loc_8BD6F:				; CODE XREF: sub_8B630+729j
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_25 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_DE8]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_DE8], 556h
		mov	[bp+var_D87], 100h
		mov	[bp+var_D8B], 0
		mov	[bp+var_DE8], 56Eh
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		lea	ax, [bp+var_DE8]
		push	ax
		mov	bx, [bp+var_DE8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3531474Dh
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		xor	di, di
		jmp	short loc_8BE40
; ���������������������������������������������������������������������������

loc_8BDF7:				; CODE XREF: sub_8B630+813j
		push	1
		push	large 54584554h
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	ax, [bp+var_D76]
		mov	[bp+var_140], ax
		movsx	eax, [bp+var_140]
		push	eax
		push	ds
		mov	ax, [bp+var_E]
		imul	di
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_D72]
		mov	[bp+var_D83], eax
		inc	di

loc_8BE40:				; CODE XREF: sub_8B630+7C5j
		cmp	di, 1Ah
		jl	short loc_8BDF7
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_8BE8E
		push	[bp+var_2]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_2]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_8BF12
; ���������������������������������������������������������������������������

loc_8BE8E:				; CODE XREF: sub_8B630+82Fj
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_8BEC9
		push	[bp+var_2]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_4]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_8BF12
; ���������������������������������������������������������������������������

loc_8BEC9:				; CODE XREF: sub_8B630+86Bj
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_8BF04
		push	[bp+var_2]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_0]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_8BF12
; ���������������������������������������������������������������������������

loc_8BF04:				; CODE XREF: sub_8B630+8A6j
		push	[bp+var_6]
		push	[bp+var_C]
		call	CRT_Strcat
		add	sp, 4

loc_8BF12:				; CODE XREF: sub_8B630+85Bj
					; sub_8B630+897j ...
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_8BF6F
		push	[bp+var_2]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_0]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_4]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_8C040
; ���������������������������������������������������������������������������

loc_8BF6F:				; CODE XREF: sub_8B630+8EFj
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_8BFCB
		push	[bp+var_2]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_4]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_4]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_8C040
; ���������������������������������������������������������������������������

loc_8BFCB:				; CODE XREF: sub_8B630+94Cj
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_8C027
		push	[bp+var_2]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_2]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_4]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_8C040
; ���������������������������������������������������������������������������

loc_8C027:				; CODE XREF: sub_8B630+9A8j
		push	[bp+var_4]
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_8C040:				; CODE XREF: sub_8B630+93Cj
					; sub_8B630+999j ...
		mov	[bp+var_DE8], 56Eh
		lea	ax, [bp+var_DE8]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_DE8]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_8C062:				; CODE XREF: sub_8B630+73Cj
		mov	[bp+var_3E], 0
		mov	[bp+var_3A], 2
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		push	3
		lea	ax, [bp+var_3E]
		push	ax
		push	74h ; 't'
		lea	ax, [bp+var_34E]
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
		lea	ax, [bp+var_25E]
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
		lea	ax, [bp+var_25E]
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
		push	4
		lea	ax, [bp+var_25E]
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
		push	0
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_70], 0
		mov	[bp+var_6C], 2
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	3
		lea	ax, [bp+var_70]
		push	ax
		push	8
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_7A], 0
		mov	[bp+var_76], 2
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	3
		lea	ax, [bp+var_7A]
		push	ax
		push	9
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_84], 0
		mov	[bp+var_80], 2
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		push	3
		lea	ax, [bp+var_84]
		push	ax
		push	3
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_8E], 0
		mov	[bp+var_8A], 2
		mov	[bp+var_89], 0
		mov	[bp+var_88], 0
		push	3
		lea	ax, [bp+var_8E]
		push	ax
		push	7
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_98], 0
		mov	[bp+var_94], 2
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		push	3
		lea	ax, [bp+var_98]
		push	ax
		push	4
		lea	ax, [bp+var_2D6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_A2], 0
		mov	[bp+var_9E], 2
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		push	2
		lea	ax, [bp+var_A2]
		push	ax
		push	15h
		lea	ax, [bp+var_3C6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_A5], 0
		lea	ax, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_B2], 0
		mov	[bp+var_AE], 2
		mov	[bp+var_AD], 0
		mov	[bp+var_AC], 0
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		push	0Fh
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_B5], 0
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_C2], 0
		mov	[bp+var_BE], 2
		mov	[bp+var_BD], 0
		mov	[bp+var_BC], 0
		push	2
		lea	ax, [bp+var_C2]
		push	ax
		push	0Bh
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_C5], 0
		lea	ax, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_D2], 0
		mov	[bp+var_CE], 2
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		push	2
		lea	ax, [bp+var_D2]
		push	ax
		push	0Dh
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_D5], 0
		lea	ax, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_E2], 0
		mov	[bp+var_DE], 2
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		push	2
		lea	ax, [bp+var_E2]
		push	ax
		push	0Eh
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_E5], 0
		lea	ax, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_F2], 0
		mov	[bp+var_EE], 2
		mov	[bp+var_ED], 0
		mov	[bp+var_EC], 0
		push	2
		lea	ax, [bp+var_F2]
		push	ax
		push	6
		lea	ax, [bp+var_2D6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_F5], 0
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_102], 0
		mov	[bp+var_FE], 2
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		push	0
		push	2
		lea	ax, [bp+var_102]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
		mov	[bp+var_105], 0
		lea	ax, [bp+var_102]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_112], 0
		mov	[bp+var_10E], 2
		mov	[bp+var_10D], 0
		mov	[bp+var_10C], 0
		push	ds
		push	offset unk_45372
		push	ds
		push	offset aConvfont_shp_3 ; "convfont.shp"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_1CA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_1CA]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_116+2], dx
		mov	word ptr [bp+var_116], ax
		mov	eax, [bp+var_116]
		mov	[bp+var_112], eax
		mov	[bp+var_10E], 2
		mov	[bp+var_10D], 1
		mov	[bp+var_10C], 0
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_D02]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_11E], 0
		mov	[bp+var_11C], 98h ; '�'
		mov	[bp+var_11A], 13Fh
		mov	[bp+var_118], 0C7h ; '�'
		mov	ax, word_46F46
		mov	[bp+var_120], ax
		lea	ax, [bp+var_D02]
		push	ax
		push	[bp+var_120]
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_D24], 1218h
		mov	ax, [bp+var_11C]
		mov	[bp+var_122], ax
		mov	ax, [bp+var_11A]
		mov	[bp+var_124], ax
		mov	ax, [bp+var_118]
		mov	[bp+var_126], ax
		mov	ax, [bp+var_11E]
		mov	[bp+var_D0B], ax
		mov	ax, [bp+var_122]
		mov	[bp+var_D09], ax
		mov	ax, [bp+var_124]
		mov	[bp+var_D07], ax
		mov	ax, [bp+var_126]
		mov	[bp+var_D05], ax
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C8h ; '�'
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_130], 0
		mov	[bp+var_12C], 2
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		mov	[bp+var_13A], 0
		mov	[bp+var_136], 2
		mov	[bp+var_135], 0
		mov	[bp+var_134], 0
		mov	[bp+var_D2E], 0
		mov	[bp+var_D2A], 2
		mov	[bp+var_D29], 0
		mov	[bp+var_D28], 0
		mov	[bp+var_D32], 0
		mov	[bp+var_D30], 0FFFFh
		mov	[bp+var_D3C], 0
		mov	[bp+var_D38], 2
		mov	[bp+var_D37], 0
		mov	[bp+var_D36], 0
		mov	[bp+var_D40], 0
		mov	[bp+var_D3E], 0FFFFh
		cmp	byte_495FC, 0
		jz	short loc_8C5D0
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_8C5D0:				; CODE XREF: sub_8B630+F9Bj
		cmp	[bp+var_F], 0
		jz	short loc_8C61A
		mov	ax, word_48F76
		mov	[bp+var_13C], ax
		mov	[bp+var_13E], 0
		cmp	[bp+var_4C4], 0
		jz	short loc_8C61A
		push	[bp+var_4C2]
		mov	bx, [bp+var_4C4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_13E]
		push	[bp+var_13C]
		push	[bp+var_4C2]
		mov	bx, [bp+var_4C4]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8C61A:				; CODE XREF: sub_8B630+FA4j
					; sub_8B630+FB8j
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFE8h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		push	0
		push	0
		push	20h ; ' '
		push	0
		push	5Eh ; '^'
		push	120h
		lea	ax, [bp+var_52]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_9391
		add	sp, 10h
		mov	word ptr [bp+var_144+2], ax
		push	0
		push	0
		push	20h ; ' '
		push	0
		push	5Eh ; '^'
		push	120h
		lea	ax, [bp+var_48]
		push	ax
		push	0
		call	ScaledImageLayer_Construct_9391
		add	sp, 10h
		mov	word ptr [bp+var_144], ax
		push	[bp+var_C8]
		mov	al, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
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
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	[bp+var_C8]
		mov	al, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	dword ptr [bp+var_14E],	0
		mov	byte ptr [bp+var_14C+2], 2
		mov	byte ptr [bp+var_14C+3], 0
		mov	[bp+var_148], 0
		mov	[bp+var_D6C], 0
		mov	[bp+var_D68], 2
		mov	[bp+var_D67], 0
		mov	[bp+var_D66], 0
		mov	word ptr [bp+var_D72+2], 0
		mov	[bp+var_D6E], 0FFFFh
		cmp	[bp+var_11], 0
		jnz	short loc_8C770
		jmp	loc_8C7EF
; ���������������������������������������������������������������������������

loc_8C770:				; CODE XREF: sub_8B630+113Bj
		push	3
		lea	ax, [bp+var_14E]
		push	ax
		push	3Dh ; '='
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D72+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_14E]
		push	ax
		lea	ax, [bp+var_D72+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F1C
		mov	[bp+var_150], ax
		mov	word ptr [bp+var_154+2], 0
		cmp	word ptr [bp+var_D72+2], 0
		jz	short loc_8C7EF
		push	[bp+var_D6E]
		mov	bx, word ptr [bp+var_D72+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154+2]
		push	[bp+var_150]
		push	[bp+var_D6E]
		mov	bx, word ptr [bp+var_D72+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8C7EF:				; CODE XREF: sub_8B630+113Dj
					; sub_8B630+118Dj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_FadeFromColor_2D165
		add	sp, 0Ah
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [bp+var_154], 20h ; ' '
		mov	word ptr [bp+var_158+2], 6
		mov	word ptr [bp+var_158], 20h ; ' '
		mov	word ptr [bp+var_15C+2], 6
		mov	word ptr [bp+var_15C], 0
		mov	word ptr [bp+var_160+2], 0
		mov	word ptr [bp+var_160], 0FFF8h
		mov	word ptr [bp+var_164+2], 0FFFCh
		mov	word ptr [bp+var_164], 0FFF8h
		mov	[bp+var_166], 0FFFCh
		push	word ptr [bp+var_144]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_144+2]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	loc_8C9E8
; ���������������������������������������������������������������������������

loc_8C889:				; CODE XREF: sub_8B630+13D3j
		mov	di, word ptr [bp+var_D45]
		mov	ax, word ptr [bp+var_15C]
		mov	word ptr [bp+var_16A+2], ax
		mov	bx, word ptr [bp+var_144]
		mov	ax, word ptr [bp+var_16A+2]
		mov	[bx+1Bh], ax
		or	di, di
		jle	short loc_8C91A
		cmp	di, 26h	; '&'
		jge	short loc_8C91A
		cmp	di, 1Eh
		jnz	short loc_8C8C0
		mov	word ptr [bp+var_158+2], 5
		mov	word ptr [bp+var_160], 0FFF9h
		mov	word ptr [bp+var_164+2], 0FFFDh

loc_8C8C0:				; CODE XREF: sub_8B630+127Cj
		cmp	di, 24h	; '$'
		jnz	short loc_8C8D7
		mov	word ptr [bp+var_158+2], 4
		mov	word ptr [bp+var_160], 0FFFAh
		mov	word ptr [bp+var_164+2], 0FFFEh

loc_8C8D7:				; CODE XREF: sub_8B630+1293j
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_144]
		call	sub_94F4
		add	sp, 4
		cmp	di, 33h	; '3'
		jge	short loc_8C904
		push	word ptr [bp+var_164+2]
		push	word ptr [bp+var_160]
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8C904:				; CODE XREF: sub_8B630+12BAj
		mov	ax, word ptr [bp+var_158+2]
		add	word ptr [bp+var_154], ax
		cmp	word ptr [bp+var_154], 0FFh
		jle	short loc_8C91A
		mov	word ptr [bp+var_154], 0FFh

loc_8C91A:				; CODE XREF: sub_8B630+1272j
					; sub_8B630+1277j ...
		inc	word ptr [bp+var_15C]
		mov	ax, word ptr [bp+var_15C]
		cmp	ax, 1Eh
		jle	short loc_8C92D
		mov	word ptr [bp+var_15C], 0

loc_8C92D:				; CODE XREF: sub_8B630+12F5j
		mov	ax, word ptr [bp+var_160+2]
		mov	word ptr [bp+var_16A], ax
		mov	bx, word ptr [bp+var_144+2]
		mov	ax, word ptr [bp+var_16A]
		mov	[bx+1Bh], ax
		cmp	di, 0FFFFh
		jle	short loc_8C9BB
		cmp	di, 25h	; '%'
		jge	short loc_8C9BB
		cmp	di, 1Ch
		jnz	short loc_8C961
		mov	word ptr [bp+var_15C+2], 5
		mov	word ptr [bp+var_164], 0FFF9h
		mov	[bp+var_166], 0FFFDh

loc_8C961:				; CODE XREF: sub_8B630+131Dj
		cmp	di, 22h	; '"'
		jnz	short loc_8C978
		mov	word ptr [bp+var_15C+2], 4
		mov	word ptr [bp+var_164], 0FFFAh
		mov	[bp+var_166], 0FFFEh

loc_8C978:				; CODE XREF: sub_8B630+1334j
		push	word ptr [bp+var_158]
		push	word ptr [bp+var_144+2]
		call	sub_94F4
		add	sp, 4
		cmp	di, 33h	; '3'
		jge	short loc_8C9A5
		push	[bp+var_166]
		push	word ptr [bp+var_164]
		push	word ptr [bp+var_144+2]
		mov	bx, word ptr [bp+var_144+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8C9A5:				; CODE XREF: sub_8B630+135Bj
		mov	ax, word ptr [bp+var_15C+2]
		add	word ptr [bp+var_158], ax
		cmp	word ptr [bp+var_158], 0FFh
		jle	short loc_8C9BB
		mov	word ptr [bp+var_158], 0FFh

loc_8C9BB:				; CODE XREF: sub_8B630+1313j
					; sub_8B630+1318j ...
		inc	word ptr [bp+var_160+2]
		mov	ax, word ptr [bp+var_160+2]
		cmp	ax, 1Ah
		jle	short loc_8C9CE
		mov	word ptr [bp+var_160+2], 0

loc_8C9CE:				; CODE XREF: sub_8B630+1396j
		jmp	short loc_8C9DB
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8C9DB
		jmp	short loc_8CA06
; ���������������������������������������������������������������������������

loc_8C9DB:				; CODE XREF: sub_8B630:loc_8C9CEj
					; sub_8B630+13A7j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8C9E8:				; CODE XREF: sub_8B630+1256j
		cmp	word ptr [bp+var_D45], 3Eh ; '>'
		jnb	short loc_8C9F6
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_8C9FB

loc_8C9F6:				; CODE XREF: sub_8B630+13BDj
		mov	ax, 1
		jmp	short loc_8C9FD
; ���������������������������������������������������������������������������

loc_8C9FB:				; CODE XREF: sub_8B630+13C4j
		xor	ax, ax

loc_8C9FD:				; CODE XREF: sub_8B630+13C9j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8CA06
		jmp	loc_8C889
; ���������������������������������������������������������������������������

loc_8CA06:				; CODE XREF: sub_8B630+13A9j
					; sub_8B630+13D1j
		lea	ax, [bp+var_D72+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_D67], 0
		jz	short loc_8CA3B
		cmp	[bp+var_D6C], 0
		jz	short loc_8CA3B
		push	0
		mov	al, [bp+var_D68]
		push	ax
		lea	ax, [bp+var_D6C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8CA3B:				; CODE XREF: sub_8B630+13E8j
					; sub_8B630+13F0j
		mov	[bp+var_D6C], 0
		mov	[bp+var_D67], 0
		mov	[bp+var_D66], 0
		cmp	byte ptr [bp+var_14C+3], 0
		jz	short loc_8CA7A
		cmp	dword ptr [bp+var_14E],	0
		jz	short loc_8CA7A
		push	0
		mov	al, byte ptr [bp+var_14C+2]
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8CA7A:				; CODE XREF: sub_8B630+1427j
					; sub_8B630+142Fj
		mov	dword ptr [bp+var_14E],	0
		mov	byte ptr [bp+var_14C+3], 0
		mov	[bp+var_148], 0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_8CAAA
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_8CAAA:				; CODE XREF: sub_8B630+1475j
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14C+2]
		push	ax
		push	2353h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp+var_8E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14C], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	[bp+var_14E], ax
		push	33h ; '3'
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_150], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_E8]
		mov	al, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_14E]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_8CC10
		jmp	loc_8CC8F
; ���������������������������������������������������������������������������

loc_8CC10:				; CODE XREF: sub_8B630+15DBj
		push	3
		lea	ax, [bp+var_130]
		push	ax
		push	18h
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_130]
		push	ax
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48ED2
		mov	word ptr [bp+var_154+2], ax
		mov	word ptr [bp+var_154], 0
		cmp	[bp+var_D32], 0
		jz	short loc_8CC8F
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_154+2]
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8CC8F:				; CODE XREF: sub_8B630+15DDj
					; sub_8B630+162Dj
		cmp	[bp+var_10], 0
		jnz	short loc_8CC98
		jmp	loc_8CE8B
; ���������������������������������������������������������������������������

loc_8CC98:				; CODE XREF: sub_8B630+1663j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+2], 2
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		push	2
		lea	ax, [bp+var_160+2]
		push	ax
		push	0
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_160+2]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_160], 0
		jmp	short loc_8CD03
; ���������������������������������������������������������������������������

loc_8CCF2:				; CODE XREF: sub_8B630+16D8j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_8CD03:				; CODE XREF: sub_8B630+16C0j
		cmp	word ptr [bp+var_160], 3
		jl	short loc_8CCF2
		jmp	loc_8CD96
; ���������������������������������������������������������������������������

loc_8CD0D:				; CODE XREF: sub_8B630+1776j
		or	di, di
		jnz	short loc_8CD32
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8CD32
		mov	di, 0FFFFh
		jmp	short loc_8CD43
; ���������������������������������������������������������������������������

loc_8CD32:				; CODE XREF: sub_8B630+16DFj
					; sub_8B630+16FBj
		cmp	di, 0FFFFh
		jnz	short loc_8CD3C
		mov	di, 1
		jmp	short loc_8CD43
; ���������������������������������������������������������������������������

loc_8CD3C:				; CODE XREF: sub_8B630+1705j
		cmp	di, 1
		jnz	short loc_8CD43
		xor	di, di

loc_8CD43:				; CODE XREF: sub_8B630+1700j
					; sub_8B630+170Aj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8CD89
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8CD89
		jmp	short loc_8CDA9
; ���������������������������������������������������������������������������

loc_8CD89:				; CODE XREF: sub_8B630+174Cj
					; sub_8B630+1755j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8CD96:				; CODE XREF: sub_8B630+16DAj
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_8CDA9
		jmp	loc_8CD0D
; ���������������������������������������������������������������������������

loc_8CDA9:				; CODE XREF: sub_8B630+1757j
					; sub_8B630+1774j
		mov	word ptr [bp+var_160], 0
		jmp	loc_8CE3F
; ���������������������������������������������������������������������������

loc_8CDB2:				; CODE XREF: sub_8B630+1816j
		or	di, di
		jnz	short loc_8CDD7
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8CDD7
		mov	di, 0FFFFh
		jmp	short loc_8CDE8
; ���������������������������������������������������������������������������

loc_8CDD7:				; CODE XREF: sub_8B630+1784j
					; sub_8B630+17A0j
		cmp	di, 0FFFFh
		jnz	short loc_8CDE1
		mov	di, 1
		jmp	short loc_8CDE8
; ���������������������������������������������������������������������������

loc_8CDE1:				; CODE XREF: sub_8B630+17AAj
		cmp	di, 1
		jnz	short loc_8CDE8
		xor	di, di

loc_8CDE8:				; CODE XREF: sub_8B630+17A5j
					; sub_8B630+17AFj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8CE2E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8CE2E
		jmp	short loc_8CE49
; ���������������������������������������������������������������������������

loc_8CE2E:				; CODE XREF: sub_8B630+17F1j
					; sub_8B630+17FAj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_8CE3F:				; CODE XREF: sub_8B630+177Fj
		cmp	word ptr [bp+var_160], 8
		jge	short loc_8CE49
		jmp	loc_8CDB2
; ���������������������������������������������������������������������������

loc_8CE49:				; CODE XREF: sub_8B630+17FCj
					; sub_8B630+1814j
		cmp	byte ptr [bp+var_15C+3], 0
		jz	short loc_8CE71
		cmp	[bp+var_160+2],	0
		jz	short loc_8CE71
		push	0
		mov	al, byte ptr [bp+var_15C+2]
		push	ax
		lea	ax, [bp+var_160+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8CE71:				; CODE XREF: sub_8B630+181Ej
					; sub_8B630+1826j
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		jmp	loc_8D005
; ���������������������������������������������������������������������������

loc_8CE8B:				; CODE XREF: sub_8B630+1665j
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 1Fh
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8CFE5
; ���������������������������������������������������������������������������

loc_8CECA:				; CODE XREF: sub_8B630+19D2j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_8CEF7
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8CEF7
		mov	di, 0FFFFh
		jmp	short loc_8CF08
; ���������������������������������������������������������������������������

loc_8CEF7:				; CODE XREF: sub_8B630+18A4j
					; sub_8B630+18C0j
		cmp	di, 0FFFFh
		jnz	short loc_8CF01
		mov	di, 1
		jmp	short loc_8CF08
; ���������������������������������������������������������������������������

loc_8CF01:				; CODE XREF: sub_8B630+18CAj
		cmp	di, 1
		jnz	short loc_8CF08
		xor	di, di

loc_8CF08:				; CODE XREF: sub_8B630+18C5j
					; sub_8B630+18CFj ...
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8CF23
		push	[bp+var_C]
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8CF23:				; CODE XREF: sub_8B630+18E1j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8CF3D
		push	2359h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8CF3D:				; CODE XREF: sub_8B630+18FCj
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8CF89
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8CF89:				; CODE XREF: sub_8B630+1915j
		jmp	short loc_8CFD8
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8CFD8
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8D005
; ���������������������������������������������������������������������������

loc_8CFD8:				; CODE XREF: sub_8B630:loc_8CF89j
					; sub_8B630+1962j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8CFE5:				; CODE XREF: sub_8B630+1897j
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_8CFF5
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_8CFFA

loc_8CFF5:				; CODE XREF: sub_8B630+19BCj
		mov	ax, 1
		jmp	short loc_8CFFC
; ���������������������������������������������������������������������������

loc_8CFFA:				; CODE XREF: sub_8B630+19C3j
		xor	ax, ax

loc_8CFFC:				; CODE XREF: sub_8B630+19C8j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8D005
		jmp	loc_8CECA
; ���������������������������������������������������������������������������

loc_8D005:				; CODE XREF: sub_8B630+1858j
					; sub_8B630+19A6j ...
		cmp	[bp+var_11], 0
		jz	short loc_8D018
		lea	ax, [bp+var_D32]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_8D018:				; CODE XREF: sub_8B630+19D9j
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_8D040
		cmp	[bp+var_14C+2],	0
		jz	short loc_8D040
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8D040:				; CODE XREF: sub_8B630+19EDj
					; sub_8B630+19F5j
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_8D070
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_8D070:				; CODE XREF: sub_8B630+1A3Bj
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14C+2]
		push	ax
		push	2363h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp+var_98]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14C], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	[bp+var_14E], ax
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_150], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_F8]
		mov	al, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_14E]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_8D1D6
		jmp	loc_8D255
; ���������������������������������������������������������������������������

loc_8D1D6:				; CODE XREF: sub_8B630+1BA1j
		push	3
		lea	ax, [bp+var_13A]
		push	ax
		push	5
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EAC
		mov	word ptr [bp+var_154+2], ax
		mov	word ptr [bp+var_154], 0
		cmp	[bp+var_D40], 0
		jz	short loc_8D255
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_154+2]
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8D255:				; CODE XREF: sub_8B630+1BA3j
					; sub_8B630+1BF3j
		cmp	[bp+var_10], 0
		jnz	short loc_8D25E
		jmp	loc_8D8D7
; ���������������������������������������������������������������������������

loc_8D25E:				; CODE XREF: sub_8B630+1C29j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+2], 2
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		push	2
		lea	ax, [bp+var_160+2]
		push	ax
		push	8
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_160+2]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_160], 0
		jmp	short loc_8D2C9
; ���������������������������������������������������������������������������

loc_8D2B8:				; CODE XREF: sub_8B630+1C9Ej
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_8D2C9:				; CODE XREF: sub_8B630+1C86j
		cmp	word ptr [bp+var_160], 3
		jl	short loc_8D2B8
		mov	word ptr [bp+var_160], 0
		jmp	loc_8D37D
; ���������������������������������������������������������������������������

loc_8D2D9:				; CODE XREF: sub_8B630+1D5Dj
		mov	ax, word ptr [bp+var_160]
		inc	word ptr [bp+var_160]
		cmp	ax, 7
		jnz	short loc_8D2F4
		push	21h ; '!'
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8D2F4:				; CODE XREF: sub_8B630+1CB4j
		or	di, di
		jnz	short loc_8D319
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8D319
		mov	di, 0FFFFh
		jmp	short loc_8D32A
; ���������������������������������������������������������������������������

loc_8D319:				; CODE XREF: sub_8B630+1CC6j
					; sub_8B630+1CE2j
		cmp	di, 0FFFFh
		jnz	short loc_8D323
		mov	di, 1
		jmp	short loc_8D32A
; ���������������������������������������������������������������������������

loc_8D323:				; CODE XREF: sub_8B630+1CECj
		cmp	di, 1
		jnz	short loc_8D32A
		xor	di, di

loc_8D32A:				; CODE XREF: sub_8B630+1CE7j
					; sub_8B630+1CF1j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8D370
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8D370
		jmp	short loc_8D390
; ���������������������������������������������������������������������������

loc_8D370:				; CODE XREF: sub_8B630+1D33j
					; sub_8B630+1D3Cj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8D37D:				; CODE XREF: sub_8B630+1CA6j
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_8D390
		jmp	loc_8D2D9
; ���������������������������������������������������������������������������

loc_8D390:				; CODE XREF: sub_8B630+1D3Ej
					; sub_8B630+1D5Bj
		mov	word ptr [bp+var_160], 0
		jmp	loc_8D47A
; ���������������������������������������������������������������������������

loc_8D399:				; CODE XREF: sub_8B630+1E51j
		cmp	word ptr [bp+var_160], 0
		jnz	short loc_8D3AE
		push	1Bh
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8D3AE:				; CODE XREF: sub_8B630+1D6Ej
		cmp	word ptr [bp+var_160], 6
		jnz	short loc_8D3C3
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8D3C3:				; CODE XREF: sub_8B630+1D83j
		cmp	word ptr [bp+var_160], 7
		jnz	short loc_8D3D8
		push	1Fh
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8D3D8:				; CODE XREF: sub_8B630+1D98j
		cmp	word ptr [bp+var_160], 8
		jnz	short loc_8D3ED
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8D3ED:				; CODE XREF: sub_8B630+1DADj
		or	di, di
		jnz	short loc_8D412
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8D412
		mov	di, 0FFFFh
		jmp	short loc_8D423
; ���������������������������������������������������������������������������

loc_8D412:				; CODE XREF: sub_8B630+1DBFj
					; sub_8B630+1DDBj
		cmp	di, 0FFFFh
		jnz	short loc_8D41C
		mov	di, 1
		jmp	short loc_8D423
; ���������������������������������������������������������������������������

loc_8D41C:				; CODE XREF: sub_8B630+1DE5j
		cmp	di, 1
		jnz	short loc_8D423
		xor	di, di

loc_8D423:				; CODE XREF: sub_8B630+1DE0j
					; sub_8B630+1DEAj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8D469
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8D469
		jmp	short loc_8D484
; ���������������������������������������������������������������������������

loc_8D469:				; CODE XREF: sub_8B630+1E2Cj
					; sub_8B630+1E35j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_8D47A:				; CODE XREF: sub_8B630+1D66j
		cmp	word ptr [bp+var_160], 8
		jge	short loc_8D484
		jmp	loc_8D399
; ���������������������������������������������������������������������������

loc_8D484:				; CODE XREF: sub_8B630+1E37j
					; sub_8B630+1E4Fj
		mov	word ptr [bp+var_160], 0
		jmp	short loc_8D49D
; ���������������������������������������������������������������������������

loc_8D48C:				; CODE XREF: sub_8B630+1E72j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_8D49D:				; CODE XREF: sub_8B630+1E5Aj
		cmp	word ptr [bp+var_160], 6
		jl	short loc_8D48C
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166], 2
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		push	2
		lea	ax, [bp+var_16A]
		push	ax
		push	9
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_16A]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		jmp	loc_8D575
; ���������������������������������������������������������������������������

loc_8D4EC:				; CODE XREF: sub_8B630+1F55j
		or	di, di
		jnz	short loc_8D511
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8D511
		mov	di, 0FFFFh
		jmp	short loc_8D522
; ���������������������������������������������������������������������������

loc_8D511:				; CODE XREF: sub_8B630+1EBEj
					; sub_8B630+1EDAj
		cmp	di, 0FFFFh
		jnz	short loc_8D51B
		mov	di, 1
		jmp	short loc_8D522
; ���������������������������������������������������������������������������

loc_8D51B:				; CODE XREF: sub_8B630+1EE4j
		cmp	di, 1
		jnz	short loc_8D522
		xor	di, di

loc_8D522:				; CODE XREF: sub_8B630+1EDFj
					; sub_8B630+1EE9j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8D568
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8D568
		jmp	short loc_8D588
; ���������������������������������������������������������������������������

loc_8D568:				; CODE XREF: sub_8B630+1F2Bj
					; sub_8B630+1F34j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8D575:				; CODE XREF: sub_8B630+1EB9j
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_8D588
		jmp	loc_8D4EC
; ���������������������������������������������������������������������������

loc_8D588:				; CODE XREF: sub_8B630+1F36j
					; sub_8B630+1F53j
		mov	word ptr [bp+var_160], 0
		jmp	loc_8D65E
; ���������������������������������������������������������������������������

loc_8D591:				; CODE XREF: sub_8B630+2035j
		cmp	word ptr [bp+var_160], 6
		jnz	short loc_8D5A6
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8D5A6:				; CODE XREF: sub_8B630+1F66j
		cmp	word ptr [bp+var_160], 8
		jnz	short loc_8D5BC
		push	80h ; '�'
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8D5BC:				; CODE XREF: sub_8B630+1F7Bj
		cmp	word ptr [bp+var_160], 9
		jnz	short loc_8D5D1
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8D5D1:				; CODE XREF: sub_8B630+1F91j
		or	di, di
		jnz	short loc_8D5F6
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8D5F6
		mov	di, 0FFFFh
		jmp	short loc_8D607
; ���������������������������������������������������������������������������

loc_8D5F6:				; CODE XREF: sub_8B630+1FA3j
					; sub_8B630+1FBFj
		cmp	di, 0FFFFh
		jnz	short loc_8D600
		mov	di, 1
		jmp	short loc_8D607
; ���������������������������������������������������������������������������

loc_8D600:				; CODE XREF: sub_8B630+1FC9j
		cmp	di, 1
		jnz	short loc_8D607
		xor	di, di

loc_8D607:				; CODE XREF: sub_8B630+1FC4j
					; sub_8B630+1FCEj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8D64D
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8D64D
		jmp	short loc_8D668
; ���������������������������������������������������������������������������

loc_8D64D:				; CODE XREF: sub_8B630+2010j
					; sub_8B630+2019j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_8D65E:				; CODE XREF: sub_8B630+1F5Ej
		cmp	word ptr [bp+var_160], 0Ah
		jge	short loc_8D668
		jmp	loc_8D591
; ���������������������������������������������������������������������������

loc_8D668:				; CODE XREF: sub_8B630+201Bj
					; sub_8B630+2033j
		mov	[bp+var_176+2],	0
		mov	byte ptr [bp+var_170], 2
		mov	byte ptr [bp+var_170+1], 0
		mov	[bp+var_170+2],	0
		push	2
		lea	ax, [bp+var_176+2]
		push	ax
		push	0Ah
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_176+2]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		jmp	loc_8D739
; ���������������������������������������������������������������������������

loc_8D6B0:				; CODE XREF: sub_8B630+2119j
		or	di, di
		jnz	short loc_8D6D5
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8D6D5
		mov	di, 0FFFFh
		jmp	short loc_8D6E6
; ���������������������������������������������������������������������������

loc_8D6D5:				; CODE XREF: sub_8B630+2082j
					; sub_8B630+209Ej
		cmp	di, 0FFFFh
		jnz	short loc_8D6DF
		mov	di, 1
		jmp	short loc_8D6E6
; ���������������������������������������������������������������������������

loc_8D6DF:				; CODE XREF: sub_8B630+20A8j
		cmp	di, 1
		jnz	short loc_8D6E6
		xor	di, di

loc_8D6E6:				; CODE XREF: sub_8B630+20A3j
					; sub_8B630+20ADj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8D72C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8D72C
		jmp	short loc_8D74C
; ���������������������������������������������������������������������������

loc_8D72C:				; CODE XREF: sub_8B630+20EFj
					; sub_8B630+20F8j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8D739:				; CODE XREF: sub_8B630+207Dj
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_8D74C
		jmp	loc_8D6B0
; ���������������������������������������������������������������������������

loc_8D74C:				; CODE XREF: sub_8B630+20FAj
					; sub_8B630+2117j
		mov	word ptr [bp+var_160], 0
		jmp	loc_8D80D
; ���������������������������������������������������������������������������

loc_8D755:				; CODE XREF: sub_8B630+21E4j
		cmp	word ptr [bp+var_160], 5
		jnz	short loc_8D76B
		push	80h ; '�'
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8D76B:				; CODE XREF: sub_8B630+212Aj
		cmp	word ptr [bp+var_160], 6
		jnz	short loc_8D780
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8D780:				; CODE XREF: sub_8B630+2140j
		or	di, di
		jnz	short loc_8D7A5
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8D7A5
		mov	di, 0FFFFh
		jmp	short loc_8D7B6
; ���������������������������������������������������������������������������

loc_8D7A5:				; CODE XREF: sub_8B630+2152j
					; sub_8B630+216Ej
		cmp	di, 0FFFFh
		jnz	short loc_8D7AF
		mov	di, 1
		jmp	short loc_8D7B6
; ���������������������������������������������������������������������������

loc_8D7AF:				; CODE XREF: sub_8B630+2178j
		cmp	di, 1
		jnz	short loc_8D7B6
		xor	di, di

loc_8D7B6:				; CODE XREF: sub_8B630+2173j
					; sub_8B630+217Dj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8D7FC
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8D7FC
		jmp	short loc_8D817
; ���������������������������������������������������������������������������

loc_8D7FC:				; CODE XREF: sub_8B630+21BFj
					; sub_8B630+21C8j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_8D80D:				; CODE XREF: sub_8B630+2122j
		cmp	word ptr [bp+var_160], 8
		jge	short loc_8D817
		jmp	loc_8D755
; ���������������������������������������������������������������������������

loc_8D817:				; CODE XREF: sub_8B630+21CAj
					; sub_8B630+21E2j
		cmp	byte ptr [bp+var_170+1], 0
		jz	short loc_8D83F
		cmp	[bp+var_176+2],	0
		jz	short loc_8D83F
		push	0
		mov	al, byte ptr [bp+var_170]
		push	ax
		lea	ax, [bp+var_176+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8D83F:				; CODE XREF: sub_8B630+21ECj
					; sub_8B630+21F4j
		mov	[bp+var_176+2],	0
		mov	byte ptr [bp+var_170+1], 0
		mov	[bp+var_170+2],	0
		cmp	byte ptr [bp+var_166+1], 0
		jz	short loc_8D87E
		cmp	[bp+var_16A], 0
		jz	short loc_8D87E
		push	0
		mov	al, byte ptr [bp+var_166]
		push	ax
		lea	ax, [bp+var_16A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8D87E:				; CODE XREF: sub_8B630+222Bj
					; sub_8B630+2233j
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		cmp	byte ptr [bp+var_15C+3], 0
		jz	short loc_8D8BD
		cmp	[bp+var_160+2],	0
		jz	short loc_8D8BD
		push	0
		mov	al, byte ptr [bp+var_15C+2]
		push	ax
		lea	ax, [bp+var_160+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8D8BD:				; CODE XREF: sub_8B630+226Aj
					; sub_8B630+2272j
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		jmp	loc_8DF0A
; ���������������������������������������������������������������������������

loc_8D8D7:				; CODE XREF: sub_8B630+1C2Bj
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 4Dh	; 'M'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8DB2D
; ���������������������������������������������������������������������������

loc_8D916:				; CODE XREF: sub_8B630+251Aj
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_8D943
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8D943
		mov	di, 0FFFFh
		jmp	short loc_8D954
; ���������������������������������������������������������������������������

loc_8D943:				; CODE XREF: sub_8B630+22F0j
					; sub_8B630+230Cj
		cmp	di, 0FFFFh
		jnz	short loc_8D94D
		mov	di, 1
		jmp	short loc_8D954
; ���������������������������������������������������������������������������

loc_8D94D:				; CODE XREF: sub_8B630+2316j
		cmp	di, 1
		jnz	short loc_8D954
		xor	di, di

loc_8D954:				; CODE XREF: sub_8B630+2311j
					; sub_8B630+231Bj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8D9AC
		mov	ax, [bp+var_C]
		add	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8D9AC:				; CODE XREF: sub_8B630+2366j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8D9C6
		push	2367h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8D9C6:				; CODE XREF: sub_8B630+2385j
		mov	ax, si
		add	ax, 7
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8D9DF
		push	21h ; '!'
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8D9DF:				; CODE XREF: sub_8B630+239Fj
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DA02
		mov	ax, [bp+var_E]
		shl	ax, 1
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8DA02:				; CODE XREF: sub_8B630+23B8j
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DA1C
		push	236Dh
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8DA1C:				; CODE XREF: sub_8B630+23DBj
		mov	ax, si
		add	ax, 1Ch
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DA35
		push	1Bh
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8DA35:				; CODE XREF: sub_8B630+23F5j
		mov	ax, [bp+var_8]
		add	ax, 0FFFCh
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DA83
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8DA83:				; CODE XREF: sub_8B630+240Fj
		mov	ax, [bp+var_8]
		add	ax, 0FFF8h
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DA9D
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8DA9D:				; CODE XREF: sub_8B630+245Dj
		mov	ax, [bp+var_8]
		add	ax, 0FFF9h
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DAB7
		push	1Fh
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8DAB7:				; CODE XREF: sub_8B630+2477j
		mov	ax, [bp+var_8]
		add	ax, 0FFFAh
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DAD1
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8DAD1:				; CODE XREF: sub_8B630+2491j
		jmp	short loc_8DB20
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8DB20
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8DB4D
; ���������������������������������������������������������������������������

loc_8DB20:				; CODE XREF: sub_8B630:loc_8DAD1j
					; sub_8B630+24AAj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8DB2D:				; CODE XREF: sub_8B630+22E3j
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_8DB3D
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_8DB42

loc_8DB3D:				; CODE XREF: sub_8B630+2504j
		mov	ax, 1
		jmp	short loc_8DB44
; ���������������������������������������������������������������������������

loc_8DB42:				; CODE XREF: sub_8B630+250Bj
		xor	ax, ax

loc_8DB44:				; CODE XREF: sub_8B630+2510j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8DB4D
		jmp	loc_8D916
; ���������������������������������������������������������������������������

loc_8DB4D:				; CODE XREF: sub_8B630+24EEj
					; sub_8B630+2518j
		mov	[bp+var_A], 16h
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8DD19
; ���������������������������������������������������������������������������

loc_8DB6E:				; CODE XREF: sub_8B630+2706j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_8DB9B
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8DB9B
		mov	di, 0FFFFh
		jmp	short loc_8DBAC
; ���������������������������������������������������������������������������

loc_8DB9B:				; CODE XREF: sub_8B630+2548j
					; sub_8B630+2564j
		cmp	di, 0FFFFh
		jnz	short loc_8DBA5
		mov	di, 1
		jmp	short loc_8DBAC
; ���������������������������������������������������������������������������

loc_8DBA5:				; CODE XREF: sub_8B630+256Ej
		cmp	di, 1
		jnz	short loc_8DBAC
		xor	di, di

loc_8DBAC:				; CODE XREF: sub_8B630+2569j
					; sub_8B630+2573j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DBFE
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8DBFE:				; CODE XREF: sub_8B630+25BEj
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DC18
		push	80h ; '�'
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8DC18:				; CODE XREF: sub_8B630+25D7j
		mov	ax, si
		add	ax, 9
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DC31
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8DC31:				; CODE XREF: sub_8B630+25F1j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DC57
		mov	ax, [bp+var_E]
		shl	ax, 1
		add	ax, [bp+var_E]
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8DC57:				; CODE XREF: sub_8B630+260Aj
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DC71
		push	2379h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8DC71:				; CODE XREF: sub_8B630+2630j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DCBD
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8DCBD:				; CODE XREF: sub_8B630+2649j
		jmp	short loc_8DD0C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8DD0C
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8DD39
; ���������������������������������������������������������������������������

loc_8DD0C:				; CODE XREF: sub_8B630:loc_8DCBDj
					; sub_8B630+2696j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8DD19:				; CODE XREF: sub_8B630+253Bj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_8DD29
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_8DD2E

loc_8DD29:				; CODE XREF: sub_8B630+26F0j
		mov	ax, 1
		jmp	short loc_8DD30
; ���������������������������������������������������������������������������

loc_8DD2E:				; CODE XREF: sub_8B630+26F7j
		xor	ax, ax

loc_8DD30:				; CODE XREF: sub_8B630+26FCj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8DD39
		jmp	loc_8DB6E
; ���������������������������������������������������������������������������

loc_8DD39:				; CODE XREF: sub_8B630+26DAj
					; sub_8B630+2704j
		mov	[bp+var_A], 2Dh	; '-'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8DEEA
; ���������������������������������������������������������������������������

loc_8DD5A:				; CODE XREF: sub_8B630+28D7j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_8DD87
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8DD87
		mov	di, 0FFFFh
		jmp	short loc_8DD98
; ���������������������������������������������������������������������������

loc_8DD87:				; CODE XREF: sub_8B630+2734j
					; sub_8B630+2750j
		cmp	di, 0FFFFh
		jnz	short loc_8DD91
		mov	di, 1
		jmp	short loc_8DD98
; ���������������������������������������������������������������������������

loc_8DD91:				; CODE XREF: sub_8B630+275Aj
		cmp	di, 1
		jnz	short loc_8DD98
		xor	di, di

loc_8DD98:				; CODE XREF: sub_8B630+2755j
					; sub_8B630+275Fj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DDEB
		push	80h ; '�'
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8DDEB:				; CODE XREF: sub_8B630+27AAj
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DE04
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8DE04:				; CODE XREF: sub_8B630+27C4j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DE28
		mov	ax, [bp+var_E]
		shl	ax, 2
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8DE28:				; CODE XREF: sub_8B630+27DDj
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DE42
		push	2383h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8DE42:				; CODE XREF: sub_8B630+2801j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8DE8E
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8DE8E:				; CODE XREF: sub_8B630+281Aj
		jmp	short loc_8DEDD
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8DEDD
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8DF0A
; ���������������������������������������������������������������������������

loc_8DEDD:				; CODE XREF: sub_8B630:loc_8DE8Ej
					; sub_8B630+2867j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8DEEA:				; CODE XREF: sub_8B630+2727j
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_8DEFA
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_8DEFF

loc_8DEFA:				; CODE XREF: sub_8B630+28C1j
		mov	ax, 1
		jmp	short loc_8DF01
; ���������������������������������������������������������������������������

loc_8DEFF:				; CODE XREF: sub_8B630+28C8j
		xor	ax, ax

loc_8DF01:				; CODE XREF: sub_8B630+28CDj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8DF0A
		jmp	loc_8DD5A
; ���������������������������������������������������������������������������

loc_8DF0A:				; CODE XREF: sub_8B630+22A4j
					; sub_8B630+28ABj ...
		cmp	[bp+var_11], 0
		jz	short loc_8DF1D
		lea	ax, [bp+var_D40]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_8DF1D:				; CODE XREF: sub_8B630+28DEj
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_8DF45
		cmp	[bp+var_14C+2],	0
		jz	short loc_8DF45
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8DF45:				; CODE XREF: sub_8B630+28F2j
					; sub_8B630+28FAj
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_8DF75
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_8DF75:				; CODE XREF: sub_8B630+2940j
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		push	0FFFFh
		push	0
		lea	ax, [bp+var_70]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	di, ax
		push	0FFFFh
		push	0
		lea	ax, [bp+var_84]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144+2], ax
		push	1
		push	0FFFFh
		push	0
		lea	ax, [bp+var_66]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_144], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_B8]
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_144+2]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_144]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C4h ; '�'
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp+var_148+2], 0
		mov	word ptr [bp+var_148], 3
		mov	word ptr [bp+var_14C+2], 2
		mov	word ptr [bp+var_14C], 2
		mov	[bp+var_14E], 0
		cmp	[bp+var_11], 0
		jnz	short loc_8E0C3
		jmp	loc_8E145
; ���������������������������������������������������������������������������

loc_8E0C3:				; CODE XREF: sub_8B630+2A8Ej
		push	3
		lea	ax, [bp+var_13A]
		push	ax
		push	5
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EAC
		add	ax, 0FFCEh
		mov	[bp+var_150], ax
		mov	word ptr [bp+var_154+2], 0
		cmp	[bp+var_D40], 0
		jz	short loc_8E145
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154+2]
		push	[bp+var_150]
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8E145:				; CODE XREF: sub_8B630+2A90j
					; sub_8B630+2AE3j
		cmp	[bp+var_10], 0
		jnz	short loc_8E14E
		jmp	loc_8E37E
; ���������������������������������������������������������������������������

loc_8E14E:				; CODE XREF: sub_8B630+2B19j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_15C], 0
		mov	byte ptr [bp+var_158], 2
		mov	byte ptr [bp+var_158+1], 0
		mov	[bp+var_158+2],	0
		push	2
		lea	ax, [bp+var_15C]
		push	ax
		push	0Bh
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_15C]
		push	ax
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	word ptr [bp+var_160+2], 0
		jmp	short loc_8E1B8
; ���������������������������������������������������������������������������

loc_8E1A7:				; CODE XREF: sub_8B630+2B8Dj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160+2]

loc_8E1B8:				; CODE XREF: sub_8B630+2B75j
		cmp	word ptr [bp+var_160+2], 4
		jl	short loc_8E1A7
		push	0FFFFh
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_83FE
		add	sp, 4
		mov	word ptr [bp+var_160+2], 0
		jmp	loc_8E2F2
; ���������������������������������������������������������������������������

loc_8E1D7:				; CODE XREF: sub_8B630+2CD3j
		mov	ax, word ptr [bp+var_14C+2]
		cmp	ax, word ptr [bp+var_14C]
		jnz	short loc_8E242
		mov	ax, word ptr [bp+var_160+2]
		inc	word ptr [bp+var_160+2]
		test	ax, 1
		jz	short loc_8E218
		mov	ax, word ptr [bp+var_148]
		mov	word ptr [bp+var_160], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_160]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_14C], ax

loc_8E218:				; CODE XREF: sub_8B630+2BBCj
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jge	short loc_8E22A
		mov	word ptr [bp+var_148+2], 0FFFFh
		jmp	short loc_8E242
; ���������������������������������������������������������������������������

loc_8E22A:				; CODE XREF: sub_8B630+2BF0j
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jnz	short loc_8E23C
		mov	word ptr [bp+var_148+2], 0
		jmp	short loc_8E242
; ���������������������������������������������������������������������������

loc_8E23C:				; CODE XREF: sub_8B630+2C02j
		mov	word ptr [bp+var_148+2], 1

loc_8E242:				; CODE XREF: sub_8B630+2BAFj
					; sub_8B630+2BF8j ...
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144+2]
		mov	bx, word ptr [bp+var_144+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+var_14E]
		inc	[bp+var_14E]
		cmp	ax, 1
		jnz	short loc_8E288
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8E288:				; CODE XREF: sub_8B630+2C49j
		cmp	[bp+var_14E], 5
		jnz	short loc_8E29C
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8E29C:				; CODE XREF: sub_8B630+2C5Dj
		cmp	[bp+var_14E], 8
		jnz	short loc_8E2A9
		mov	[bp+var_14E], 0

loc_8E2A9:				; CODE XREF: sub_8B630+2C71j
		mov	ax, word ptr [bp+var_148+2]
		add	word ptr [bp+var_14C+2], ax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_164+2], ax
		mov	bx, word ptr [bp+var_144]
		mov	ax, word ptr [bp+var_164+2]
		mov	[bx+1Bh], ax
		jmp	short loc_8E2E5
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8E2E5
		jmp	short loc_8E306
; ���������������������������������������������������������������������������

loc_8E2E5:				; CODE XREF: sub_8B630+2CA8j
					; sub_8B630+2CB1j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8E2F2:				; CODE XREF: sub_8B630+2BA4j
		lea	ax, [bp+var_CEA]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jz	short loc_8E306
		jmp	loc_8E1D7
; ���������������������������������������������������������������������������

loc_8E306:				; CODE XREF: sub_8B630+2CB3j
					; sub_8B630+2CD1j
		mov	bx, word ptr [bp+var_144]
		mov	word ptr [bx+1Bh], 0
		mov	word ptr [bp+var_160+2], 0
		jmp	short loc_8E328
; ���������������������������������������������������������������������������

loc_8E317:				; CODE XREF: sub_8B630+2CFDj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160+2]

loc_8E328:				; CODE XREF: sub_8B630+2CE5j
		cmp	word ptr [bp+var_160+2], 4
		jl	short loc_8E317
		lea	ax, [bp+var_CEA]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_158+1], 0
		jz	short loc_8E364
		cmp	[bp+var_15C], 0
		jz	short loc_8E364
		push	0
		mov	al, byte ptr [bp+var_158]
		push	ax
		lea	ax, [bp+var_15C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8E364:				; CODE XREF: sub_8B630+2D11j
					; sub_8B630+2D19j
		mov	[bp+var_15C], 0
		mov	byte ptr [bp+var_158+1], 0
		mov	[bp+var_158+2],	0
		jmp	loc_8E59B
; ���������������������������������������������������������������������������

loc_8E37E:				; CODE XREF: sub_8B630+2B1Bj
		mov	[bp+var_A], 28h	; '('
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8E57B
; ���������������������������������������������������������������������������

loc_8E39F:				; CODE XREF: sub_8B630+2F68j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_154], ax
		mov	ax, word ptr [bp+var_14C+2]
		cmp	ax, word ptr [bp+var_14C]
		jnz	short loc_8E40D
		test	word ptr [bp+var_154], 1
		jz	short loc_8E3E3
		mov	ax, word ptr [bp+var_148]
		mov	word ptr [bp+var_158+2], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_158+2]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_14C], ax

loc_8E3E3:				; CODE XREF: sub_8B630+2D87j
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jge	short loc_8E3F5
		mov	word ptr [bp+var_148+2], 0FFFFh
		jmp	short loc_8E40D
; ���������������������������������������������������������������������������

loc_8E3F5:				; CODE XREF: sub_8B630+2DBBj
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jnz	short loc_8E407
		mov	word ptr [bp+var_148+2], 0
		jmp	short loc_8E40D
; ���������������������������������������������������������������������������

loc_8E407:				; CODE XREF: sub_8B630+2DCDj
		mov	word ptr [bp+var_148+2], 1

loc_8E40D:				; CODE XREF: sub_8B630+2D7Fj
					; sub_8B630+2DC3j ...
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144+2]
		mov	bx, word ptr [bp+var_144+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+var_14E]
		inc	[bp+var_14E]
		cmp	ax, 1
		jnz	short loc_8E453
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8E453:				; CODE XREF: sub_8B630+2E14j
		cmp	[bp+var_14E], 5
		jnz	short loc_8E467
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8E467:				; CODE XREF: sub_8B630+2E28j
		cmp	[bp+var_14E], 8
		jnz	short loc_8E474
		mov	[bp+var_14E], 0

loc_8E474:				; CODE XREF: sub_8B630+2E3Cj
		mov	ax, word ptr [bp+var_148+2]
		add	word ptr [bp+var_14C+2], ax
		cmp	word ptr [bp+var_154], 2
		jnz	short loc_8E49E
		mov	ax, [bp+var_E]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8E49E:				; CODE XREF: sub_8B630+2E51j
		cmp	word ptr [bp+var_154], 2
		jle	short loc_8E4D3
		cmp	word ptr [bp+var_154], 14h
		jge	short loc_8E4D3
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_158], ax
		mov	bx, word ptr [bp+var_144]
		mov	ax, word ptr [bp+var_158]
		mov	[bx+1Bh], ax

loc_8E4D3:				; CODE XREF: sub_8B630+2E73j
					; sub_8B630+2E7Aj
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_154]
		jnz	short loc_8E51F
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8E51F:				; CODE XREF: sub_8B630+2EABj
		jmp	short loc_8E56E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8E56E
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8E59B
; ���������������������������������������������������������������������������

loc_8E56E:				; CODE XREF: sub_8B630:loc_8E51Fj
					; sub_8B630+2EF8j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8E57B:				; CODE XREF: sub_8B630+2D6Cj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_8E58B
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_8E590

loc_8E58B:				; CODE XREF: sub_8B630+2F52j
		mov	ax, 1
		jmp	short loc_8E592
; ���������������������������������������������������������������������������

loc_8E590:				; CODE XREF: sub_8B630+2F59j
		xor	ax, ax

loc_8E592:				; CODE XREF: sub_8B630+2F5Ej
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8E59B
		jmp	loc_8E39F
; ���������������������������������������������������������������������������

loc_8E59B:				; CODE XREF: sub_8B630+2D4Bj
					; sub_8B630+2F3Cj ...
		cmp	[bp+var_11], 0
		jz	short loc_8E5AE
		lea	ax, [bp+var_D40]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_8E5AE:				; CODE XREF: sub_8B630+2F6Fj
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_8E5C7
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_8E5C7:				; CODE XREF: sub_8B630+2F92j
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14C+2]
		push	ax
		push	23A9h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp+var_8E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14C], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	[bp+var_14E], ax
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_150], ax
		mov	bx, [bp+var_14E]
		mov	byte ptr [bx+852h], 0
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_E8]
		mov	al, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_14E]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_8E744
		jmp	loc_8E7C3
; ���������������������������������������������������������������������������

loc_8E744:				; CODE XREF: sub_8B630+310Fj
		push	3
		lea	ax, [bp+var_130]
		push	ax
		push	18h
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_130]
		push	ax
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48ED2
		mov	word ptr [bp+var_154+2], ax
		mov	word ptr [bp+var_154], 0
		cmp	[bp+var_D32], 0
		jz	short loc_8E7C3
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_154+2]
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8E7C3:				; CODE XREF: sub_8B630+3111j
					; sub_8B630+3161j
		cmp	[bp+var_10], 0
		jnz	short loc_8E7CC
		jmp	loc_8E9BF
; ���������������������������������������������������������������������������

loc_8E7CC:				; CODE XREF: sub_8B630+3197j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+2], 2
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		push	2
		lea	ax, [bp+var_160+2]
		push	ax
		push	1
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_160+2]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_160], 0
		jmp	short loc_8E837
; ���������������������������������������������������������������������������

loc_8E826:				; CODE XREF: sub_8B630+320Cj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_8E837:				; CODE XREF: sub_8B630+31F4j
		cmp	word ptr [bp+var_160], 3
		jl	short loc_8E826
		jmp	loc_8E8CA
; ���������������������������������������������������������������������������

loc_8E841:				; CODE XREF: sub_8B630+32AAj
		or	di, di
		jnz	short loc_8E866
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8E866
		mov	di, 0FFFFh
		jmp	short loc_8E877
; ���������������������������������������������������������������������������

loc_8E866:				; CODE XREF: sub_8B630+3213j
					; sub_8B630+322Fj
		cmp	di, 0FFFFh
		jnz	short loc_8E870
		mov	di, 1
		jmp	short loc_8E877
; ���������������������������������������������������������������������������

loc_8E870:				; CODE XREF: sub_8B630+3239j
		cmp	di, 1
		jnz	short loc_8E877
		xor	di, di

loc_8E877:				; CODE XREF: sub_8B630+3234j
					; sub_8B630+323Ej ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8E8BD
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8E8BD
		jmp	short loc_8E8DD
; ���������������������������������������������������������������������������

loc_8E8BD:				; CODE XREF: sub_8B630+3280j
					; sub_8B630+3289j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8E8CA:				; CODE XREF: sub_8B630+320Ej
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_8E8DD
		jmp	loc_8E841
; ���������������������������������������������������������������������������

loc_8E8DD:				; CODE XREF: sub_8B630+328Bj
					; sub_8B630+32A8j
		mov	word ptr [bp+var_160], 0
		jmp	loc_8E973
; ���������������������������������������������������������������������������

loc_8E8E6:				; CODE XREF: sub_8B630+334Aj
		or	di, di
		jnz	short loc_8E90B
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8E90B
		mov	di, 0FFFFh
		jmp	short loc_8E91C
; ���������������������������������������������������������������������������

loc_8E90B:				; CODE XREF: sub_8B630+32B8j
					; sub_8B630+32D4j
		cmp	di, 0FFFFh
		jnz	short loc_8E915
		mov	di, 1
		jmp	short loc_8E91C
; ���������������������������������������������������������������������������

loc_8E915:				; CODE XREF: sub_8B630+32DEj
		cmp	di, 1
		jnz	short loc_8E91C
		xor	di, di

loc_8E91C:				; CODE XREF: sub_8B630+32D9j
					; sub_8B630+32E3j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8E962
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8E962
		jmp	short loc_8E97D
; ���������������������������������������������������������������������������

loc_8E962:				; CODE XREF: sub_8B630+3325j
					; sub_8B630+332Ej
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_8E973:				; CODE XREF: sub_8B630+32B3j
		cmp	word ptr [bp+var_160], 4
		jge	short loc_8E97D
		jmp	loc_8E8E6
; ���������������������������������������������������������������������������

loc_8E97D:				; CODE XREF: sub_8B630+3330j
					; sub_8B630+3348j
		cmp	byte ptr [bp+var_15C+3], 0
		jz	short loc_8E9A5
		cmp	[bp+var_160+2],	0
		jz	short loc_8E9A5
		push	0
		mov	al, byte ptr [bp+var_15C+2]
		push	ax
		lea	ax, [bp+var_160+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8E9A5:				; CODE XREF: sub_8B630+3352j
					; sub_8B630+335Aj
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		jmp	loc_8EB7D
; ���������������������������������������������������������������������������

loc_8E9BF:				; CODE XREF: sub_8B630+3199j
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 46h	; 'F'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8EB5D
; ���������������������������������������������������������������������������

loc_8E9FE:				; CODE XREF: sub_8B630+354Aj
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_8EA2B
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8EA2B
		mov	di, 0FFFFh
		jmp	short loc_8EA3C
; ���������������������������������������������������������������������������

loc_8EA2B:				; CODE XREF: sub_8B630+33D8j
					; sub_8B630+33F4j
		cmp	di, 0FFFFh
		jnz	short loc_8EA35
		mov	di, 1
		jmp	short loc_8EA3C
; ���������������������������������������������������������������������������

loc_8EA35:				; CODE XREF: sub_8B630+33FEj
		cmp	di, 1
		jnz	short loc_8EA3C
		xor	di, di

loc_8EA3C:				; CODE XREF: sub_8B630+33F9j
					; sub_8B630+3403j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 4
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8EA9B
		mov	ax, [bp+var_E]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8EA9B:				; CODE XREF: sub_8B630+344Ej
		mov	ax, si
		add	ax, 4
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8EAB5
		push	23AFh
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8EAB5:				; CODE XREF: sub_8B630+3474j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8EB01
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8EB01:				; CODE XREF: sub_8B630+348Dj
		jmp	short loc_8EB50
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8EB50
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8EB7D
; ���������������������������������������������������������������������������

loc_8EB50:				; CODE XREF: sub_8B630:loc_8EB01j
					; sub_8B630+34DAj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8EB5D:				; CODE XREF: sub_8B630+33CBj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_8EB6D
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_8EB72

loc_8EB6D:				; CODE XREF: sub_8B630+3534j
		mov	ax, 1
		jmp	short loc_8EB74
; ���������������������������������������������������������������������������

loc_8EB72:				; CODE XREF: sub_8B630+353Bj
		xor	ax, ax

loc_8EB74:				; CODE XREF: sub_8B630+3540j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8EB7D
		jmp	loc_8E9FE
; ���������������������������������������������������������������������������

loc_8EB7D:				; CODE XREF: sub_8B630+338Cj
					; sub_8B630+351Ej ...
		cmp	[bp+var_11], 0
		jz	short loc_8EB90
		lea	ax, [bp+var_D32]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_8EB90:				; CODE XREF: sub_8B630+3551j
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_8EBB8
		cmp	[bp+var_14C+2],	0
		jz	short loc_8EBB8
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8EBB8:				; CODE XREF: sub_8B630+3565j
					; sub_8B630+356Dj
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_8EBE8
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_8EBE8:				; CODE XREF: sub_8B630+35B3j
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14C+2]
		push	ax
		push	23CBh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp+var_98]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14C], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	[bp+var_14E], ax
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_150], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_F8]
		mov	al, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_14E]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_8ED4E
		jmp	loc_8EDCD
; ���������������������������������������������������������������������������

loc_8ED4E:				; CODE XREF: sub_8B630+3719j
		push	3
		lea	ax, [bp+var_13A]
		push	ax
		push	5
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EAC
		mov	word ptr [bp+var_154+2], ax
		mov	word ptr [bp+var_154], 0
		cmp	[bp+var_D40], 0
		jz	short loc_8EDCD
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_154+2]
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8EDCD:				; CODE XREF: sub_8B630+371Bj
					; sub_8B630+376Bj
		mov	[bp+var_A], 20h	; ' '
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8EECA
; ���������������������������������������������������������������������������

loc_8EDEE:				; CODE XREF: sub_8B630+38B7j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_8EE1B
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8EE1B
		mov	di, 0FFFFh
		jmp	short loc_8EE2C
; ���������������������������������������������������������������������������

loc_8EE1B:				; CODE XREF: sub_8B630+37C8j
					; sub_8B630+37E4j
		cmp	di, 0FFFFh
		jnz	short loc_8EE25
		mov	di, 1
		jmp	short loc_8EE2C
; ���������������������������������������������������������������������������

loc_8EE25:				; CODE XREF: sub_8B630+37EEj
		cmp	di, 1
		jnz	short loc_8EE2C
		xor	di, di

loc_8EE2C:				; CODE XREF: sub_8B630+37E9j
					; sub_8B630+37F3j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8EE7E
		push	12h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8EE7E:				; CODE XREF: sub_8B630+383Ej
		mov	ax, si
		add	ax, 9
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8EE97
		push	19h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8EE97:				; CODE XREF: sub_8B630+3857j
		mov	ax, si
		add	ax, 0Bh
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8EEB0
		push	1Fh
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_8EEB0:				; CODE XREF: sub_8B630+3870j
		jmp	short loc_8EEBD
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8EEBD
		jmp	short loc_8EEEA
; ���������������������������������������������������������������������������

loc_8EEBD:				; CODE XREF: sub_8B630:loc_8EEB0j
					; sub_8B630+3889j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8EECA:				; CODE XREF: sub_8B630+37BBj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_8EEDA
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_8EEDF

loc_8EEDA:				; CODE XREF: sub_8B630+38A1j
		mov	ax, 1
		jmp	short loc_8EEE1
; ���������������������������������������������������������������������������

loc_8EEDF:				; CODE XREF: sub_8B630+38A8j
		xor	ax, ax

loc_8EEE1:				; CODE XREF: sub_8B630+38ADj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8EEEA
		jmp	loc_8EDEE
; ���������������������������������������������������������������������������

loc_8EEEA:				; CODE XREF: sub_8B630+388Bj
					; sub_8B630+38B5j
		cmp	[bp+var_11], 0
		jz	short loc_8EEFD
		lea	ax, [bp+var_D40]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_8EEFD:				; CODE XREF: sub_8B630+38BEj
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_8EF25
		cmp	[bp+var_14C+2],	0
		jz	short loc_8EF25
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8EF25:				; CODE XREF: sub_8B630+38D2j
					; sub_8B630+38DAj
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_8EF55
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_8EF55:				; CODE XREF: sub_8B630+3920j
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144], 2
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		mov	[bp+var_D4A], 0
		mov	[bp+var_D46], 2
		mov	byte ptr [bp+var_D45], 0
		mov	[bp+var_D45+1],	0
		mov	[bp+var_D4E], 0
		mov	[bp+var_D4C], 0FFFFh
		cmp	[bp+var_11], 0
		jnz	short loc_8EFA2
		jmp	loc_8F021
; ���������������������������������������������������������������������������

loc_8EFA2:				; CODE XREF: sub_8B630+396Dj
		push	3
		lea	ax, [bp+var_148]
		push	ax
		push	61h ; 'a'
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D4E]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_148]
		push	ax
		lea	ax, [bp+var_D4E]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F64
		mov	word ptr [bp+var_14C+2], ax
		mov	word ptr [bp+var_14C], 0
		cmp	[bp+var_D4E], 0
		jz	short loc_8F021
		push	[bp+var_D4C]
		mov	bx, [bp+var_D4E]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_14C]
		push	word ptr [bp+var_14C+2]
		push	[bp+var_D4C]
		mov	bx, [bp+var_D4E]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8F021:				; CODE XREF: sub_8B630+396Fj
					; sub_8B630+39BFj
		mov	[bp+var_158+2],	0
		mov	byte ptr [bp+var_154+2], 2
		mov	byte ptr [bp+var_154+3], 0
		mov	dword ptr [bp+var_150],	0
		push	3
		lea	ax, [bp+var_158+2]
		push	ax
		push	6
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_160], 0
		mov	byte ptr [bp+var_15C], 2
		mov	byte ptr [bp+var_15C+1], 0
		mov	[bp+var_15C+2],	0
		push	3
		lea	ax, [bp+var_160]
		push	ax
		push	0Ah
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D72+2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFE8h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_164+2], ax
		push	0FFE8h
		push	0
		lea	ax, [bp+var_52]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_164], ax
		push	0FFE8h
		push	0
		lea	ax, [bp+var_48]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_166], ax
		push	0FFE8h
		push	0
		lea	ax, [bp+var_158+2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	di, ax
		push	0FFE8h
		push	0
		lea	ax, [bp+var_160]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_16A+2], ax
		push	[bp+var_C8]
		mov	al, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_164+2]
		lea	ax, [bp+var_D72+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_166]
		lea	ax, [bp+var_D72+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_164]
		lea	ax, [bp+var_D72+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		lea	ax, [bp+var_D72+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_16A+2]
		lea	ax, [bp+var_D72+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0FEh ; '�'
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp+var_16A], 0
		mov	word ptr [bp-16Ch], 0
		mov	word ptr [bp+var_170+2], 0
		mov	word ptr [bp+var_170], 0
		mov	[bp+var_A], 34h	; '4'
		mov	si, [bp+var_D53]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8F390
; ���������������������������������������������������������������������������

loc_8F20B:				; CODE XREF: sub_8B630+3D7Dj
		mov	ax, [bp+var_D53]
		mov	word ptr [bp+var_172], ax
		mov	ax, word ptr [bp+var_16A]
		mov	word ptr [bp+var_176+2], ax
		mov	bx, [bp+var_166]
		mov	ax, word ptr [bp+var_176+2]
		mov	[bx+1Bh], ax
		inc	word ptr [bp+var_16A]
		mov	ax, word ptr [bp+var_16A]
		cmp	ax, 1Eh
		jle	short loc_8F239
		mov	word ptr [bp+var_16A], 0

loc_8F239:				; CODE XREF: sub_8B630+3C01j
		mov	ax, [bp-16Ch]
		mov	word ptr [bp+var_176], ax
		mov	bx, word ptr [bp+var_164]
		mov	ax, word ptr [bp+var_176]
		mov	[bx+1Bh], ax
		inc	word ptr [bp-16Ch]
		mov	ax, [bp-16Ch]
		cmp	ax, 1Ah
		jle	short loc_8F25F
		mov	word ptr [bp-16Ch], 0

loc_8F25F:				; CODE XREF: sub_8B630+3C27j
		mov	ax, [bp+var_8]
		add	ax, 0FFDDh
		cmp	ax, word ptr [bp+var_172]
		jge	short loc_8F29A
		inc	word ptr [bp+var_170+2]
		mov	ax, word ptr [bp+var_170+2]
		cmp	ax, 1Bh
		jle	short loc_8F28B
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	word ptr [bp+var_170+2], 1Bh

loc_8F28B:				; CODE XREF: sub_8B630+3C46j
		mov	ax, word ptr [bp+var_170+2]
		mov	[bp+var_178], ax
		mov	ax, [bp+var_178]
		mov	[di+1Bh], ax

loc_8F29A:				; CODE XREF: sub_8B630+3C39j
		mov	ax, [bp+var_8]
		add	ax, 0FFE9h
		cmp	ax, word ptr [bp+var_172]
		jge	short loc_8F2E8
		inc	word ptr [bp+var_170]
		mov	ax, word ptr [bp+var_170]
		cmp	ax, 0Fh
		jle	short loc_8F2D5
		test	word ptr [bp+var_172], 1
		jz	short loc_8F2CF
		push	0
		push	1
		push	word ptr [bp+var_16A+2]
		mov	bx, word ptr [bp+var_16A+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_8F2CF:				; CODE XREF: sub_8B630+3C89j
		mov	word ptr [bp+var_170], 0Fh

loc_8F2D5:				; CODE XREF: sub_8B630+3C81j
		mov	ax, word ptr [bp+var_170]
		mov	[bp+var_17A], ax
		mov	bx, word ptr [bp+var_16A+2]
		mov	ax, [bp+var_17A]
		mov	[bx+1Bh], ax

loc_8F2E8:				; CODE XREF: sub_8B630+3C74j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_172]
		jnz	short loc_8F334
		mov	[bp+var_D7C], 11BCh
		mov	[bp+var_D7C], 11C8h
		mov	[bp+var_D7C], 11D8h
		mov	[bp+var_D7C], 11E8h
		mov	[bp+var_D7C], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D7C]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8F334:				; CODE XREF: sub_8B630+3CC0j
		jmp	short loc_8F383
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8F383
		mov	word ptr [bp-0D88h], 11BCh
		mov	word ptr [bp-0D88h], 11C8h
		mov	word ptr [bp-0D88h], 11D8h
		mov	word ptr [bp-0D88h], 11E8h
		mov	word ptr [bp-0D88h], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D88h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8F3B0
; ���������������������������������������������������������������������������

loc_8F383:				; CODE XREF: sub_8B630:loc_8F334j
					; sub_8B630+3D0Dj
		lea	ax, [bp+var_D72+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8F390:				; CODE XREF: sub_8B630+3BD8j
		mov	ax, [bp+var_D53]
		cmp	ax, [bp+var_8]
		jnb	short loc_8F3A0
		cmp	[bp+var_D51], 0
		jz	short loc_8F3A5

loc_8F3A0:				; CODE XREF: sub_8B630+3D67j
		mov	ax, 1
		jmp	short loc_8F3A7
; ���������������������������������������������������������������������������

loc_8F3A5:				; CODE XREF: sub_8B630+3D6Ej
		xor	ax, ax

loc_8F3A7:				; CODE XREF: sub_8B630+3D73j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8F3B0
		jmp	loc_8F20B
; ���������������������������������������������������������������������������

loc_8F3B0:				; CODE XREF: sub_8B630+3D51j
					; sub_8B630+3D7Bj
		push	0
		lea	ax, [bp+var_D72+2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_15C+1], 0
		jz	short loc_8F3E7
		cmp	[bp+var_160], 0
		jz	short loc_8F3E7
		push	0
		mov	al, byte ptr [bp+var_15C]
		push	ax
		lea	ax, [bp+var_160]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8F3E7:				; CODE XREF: sub_8B630+3D94j
					; sub_8B630+3D9Cj
		mov	[bp+var_160], 0
		mov	byte ptr [bp+var_15C+1], 0
		mov	[bp+var_15C+2],	0
		cmp	byte ptr [bp+var_154+3], 0
		jz	short loc_8F426
		cmp	[bp+var_158+2],	0
		jz	short loc_8F426
		push	0
		mov	al, byte ptr [bp+var_154+2]
		push	ax
		lea	ax, [bp+var_158+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8F426:				; CODE XREF: sub_8B630+3DD3j
					; sub_8B630+3DDBj
		mov	[bp+var_158+2],	0
		mov	byte ptr [bp+var_154+3], 0
		mov	dword ptr [bp+var_150],	0
		lea	ax, [bp+var_D4E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_D45], 0
		jz	short loc_8F472
		cmp	[bp+var_D4A], 0
		jz	short loc_8F472
		push	0
		mov	al, [bp+var_D46]
		push	ax
		lea	ax, [bp+var_D4A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8F472:				; CODE XREF: sub_8B630+3E1Fj
					; sub_8B630+3E27j
		mov	[bp+var_D4A], 0
		mov	byte ptr [bp+var_D45], 0
		mov	[bp+var_D45+1],	0
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_8F4B1
		cmp	[bp+var_148], 0
		jz	short loc_8F4B1
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8F4B1:				; CODE XREF: sub_8B630+3E5Ej
					; sub_8B630+3E66j
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		cmp	byte_495FC, 0
		jz	short loc_8F4D2
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_8F4D2:				; CODE XREF: sub_8B630+3E9Dj
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14C+2]
		push	ax
		push	23CFh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp+var_8E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14C], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	[bp+var_14E], ax
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_150], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_E8]
		mov	al, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_14E]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0Eh
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_8F646
		jmp	loc_8F6C5
; ���������������������������������������������������������������������������

loc_8F646:				; CODE XREF: sub_8B630+4011j
		push	3
		lea	ax, [bp+var_130]
		push	ax
		push	18h
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_130]
		push	ax
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48ED2
		mov	word ptr [bp+var_154+2], ax
		mov	word ptr [bp+var_154], 0
		cmp	[bp+var_D32], 0
		jz	short loc_8F6C5
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_154+2]
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8F6C5:				; CODE XREF: sub_8B630+4013j
					; sub_8B630+4063j
		cmp	[bp+var_10], 0
		jnz	short loc_8F6CE
		jmp	loc_8F8C1
; ���������������������������������������������������������������������������

loc_8F6CE:				; CODE XREF: sub_8B630+4099j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+2], 2
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		push	2
		lea	ax, [bp+var_160+2]
		push	ax
		push	2
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_160+2]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_160], 0
		jmp	short loc_8F739
; ���������������������������������������������������������������������������

loc_8F728:				; CODE XREF: sub_8B630+410Ej
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_8F739:				; CODE XREF: sub_8B630+40F6j
		cmp	word ptr [bp+var_160], 3
		jl	short loc_8F728
		jmp	loc_8F7CC
; ���������������������������������������������������������������������������

loc_8F743:				; CODE XREF: sub_8B630+41ACj
		or	di, di
		jnz	short loc_8F768
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8F768
		mov	di, 0FFFFh
		jmp	short loc_8F779
; ���������������������������������������������������������������������������

loc_8F768:				; CODE XREF: sub_8B630+4115j
					; sub_8B630+4131j
		cmp	di, 0FFFFh
		jnz	short loc_8F772
		mov	di, 1
		jmp	short loc_8F779
; ���������������������������������������������������������������������������

loc_8F772:				; CODE XREF: sub_8B630+413Bj
		cmp	di, 1
		jnz	short loc_8F779
		xor	di, di

loc_8F779:				; CODE XREF: sub_8B630+4136j
					; sub_8B630+4140j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8F7BF
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8F7BF
		jmp	short loc_8F7DF
; ���������������������������������������������������������������������������

loc_8F7BF:				; CODE XREF: sub_8B630+4182j
					; sub_8B630+418Bj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8F7CC:				; CODE XREF: sub_8B630+4110j
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_8F7DF
		jmp	loc_8F743
; ���������������������������������������������������������������������������

loc_8F7DF:				; CODE XREF: sub_8B630+418Dj
					; sub_8B630+41AAj
		mov	word ptr [bp+var_160], 0
		jmp	loc_8F875
; ���������������������������������������������������������������������������

loc_8F7E8:				; CODE XREF: sub_8B630+424Cj
		or	di, di
		jnz	short loc_8F80D
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8F80D
		mov	di, 0FFFFh
		jmp	short loc_8F81E
; ���������������������������������������������������������������������������

loc_8F80D:				; CODE XREF: sub_8B630+41BAj
					; sub_8B630+41D6j
		cmp	di, 0FFFFh
		jnz	short loc_8F817
		mov	di, 1
		jmp	short loc_8F81E
; ���������������������������������������������������������������������������

loc_8F817:				; CODE XREF: sub_8B630+41E0j
		cmp	di, 1
		jnz	short loc_8F81E
		xor	di, di

loc_8F81E:				; CODE XREF: sub_8B630+41DBj
					; sub_8B630+41E5j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_8F864
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8F864
		jmp	short loc_8F87F
; ���������������������������������������������������������������������������

loc_8F864:				; CODE XREF: sub_8B630+4227j
					; sub_8B630+4230j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_8F875:				; CODE XREF: sub_8B630+41B5j
		cmp	word ptr [bp+var_160], 8
		jge	short loc_8F87F
		jmp	loc_8F7E8
; ���������������������������������������������������������������������������

loc_8F87F:				; CODE XREF: sub_8B630+4232j
					; sub_8B630+424Aj
		cmp	byte ptr [bp+var_15C+3], 0
		jz	short loc_8F8A7
		cmp	[bp+var_160+2],	0
		jz	short loc_8F8A7
		push	0
		mov	al, byte ptr [bp+var_15C+2]
		push	ax
		lea	ax, [bp+var_160+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8F8A7:				; CODE XREF: sub_8B630+4254j
					; sub_8B630+425Cj
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		jmp	loc_8FD84
; ���������������������������������������������������������������������������

loc_8F8C1:				; CODE XREF: sub_8B630+409Bj
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 2Fh	; '/'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8FA5F
; ���������������������������������������������������������������������������

loc_8F900:				; CODE XREF: sub_8B630+444Cj
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_8F92D
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8F92D
		mov	di, 0FFFFh
		jmp	short loc_8F93E
; ���������������������������������������������������������������������������

loc_8F92D:				; CODE XREF: sub_8B630+42DAj
					; sub_8B630+42F6j
		cmp	di, 0FFFFh
		jnz	short loc_8F937
		mov	di, 1
		jmp	short loc_8F93E
; ���������������������������������������������������������������������������

loc_8F937:				; CODE XREF: sub_8B630+4300j
		cmp	di, 1
		jnz	short loc_8F93E
		xor	di, di

loc_8F93E:				; CODE XREF: sub_8B630+42FBj
					; sub_8B630+4305j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8F99D
		mov	ax, [bp+var_E]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8F99D:				; CODE XREF: sub_8B630+4350j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8F9B7
		push	23D5h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8F9B7:				; CODE XREF: sub_8B630+4376j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8FA03
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8FA03:				; CODE XREF: sub_8B630+438Fj
		jmp	short loc_8FA52
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8FA52
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8FA7F
; ���������������������������������������������������������������������������

loc_8FA52:				; CODE XREF: sub_8B630:loc_8FA03j
					; sub_8B630+43DCj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8FA5F:				; CODE XREF: sub_8B630+42CDj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_8FA6F
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_8FA74

loc_8FA6F:				; CODE XREF: sub_8B630+4436j
		mov	ax, 1
		jmp	short loc_8FA76
; ���������������������������������������������������������������������������

loc_8FA74:				; CODE XREF: sub_8B630+443Dj
		xor	ax, ax

loc_8FA76:				; CODE XREF: sub_8B630+4442j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8FA7F
		jmp	loc_8F900
; ���������������������������������������������������������������������������

loc_8FA7F:				; CODE XREF: sub_8B630+4420j
					; sub_8B630+444Aj
		mov	[bp+var_A], 37h	; '7'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8FBFD
; ���������������������������������������������������������������������������

loc_8FAA0:				; CODE XREF: sub_8B630+45EAj
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_8FACD
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8FACD
		mov	di, 0FFFFh
		jmp	short loc_8FADE
; ���������������������������������������������������������������������������

loc_8FACD:				; CODE XREF: sub_8B630+447Aj
					; sub_8B630+4496j
		cmp	di, 0FFFFh
		jnz	short loc_8FAD7
		mov	di, 1
		jmp	short loc_8FADE
; ���������������������������������������������������������������������������

loc_8FAD7:				; CODE XREF: sub_8B630+44A0j
		cmp	di, 1
		jnz	short loc_8FADE
		xor	di, di

loc_8FADE:				; CODE XREF: sub_8B630+449Bj
					; sub_8B630+44A5j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8FB3B
		mov	ax, [bp+var_E]
		shl	ax, 3
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8FB3B:				; CODE XREF: sub_8B630+44F0j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8FB55
		push	23E1h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8FB55:				; CODE XREF: sub_8B630+4514j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8FBA1
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8FBA1:				; CODE XREF: sub_8B630+452Dj
		jmp	short loc_8FBF0
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8FBF0
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8FC1D
; ���������������������������������������������������������������������������

loc_8FBF0:				; CODE XREF: sub_8B630:loc_8FBA1j
					; sub_8B630+457Aj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8FBFD:				; CODE XREF: sub_8B630+446Dj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_8FC0D
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_8FC12

loc_8FC0D:				; CODE XREF: sub_8B630+45D4j
		mov	ax, 1
		jmp	short loc_8FC14
; ���������������������������������������������������������������������������

loc_8FC12:				; CODE XREF: sub_8B630+45DBj
		xor	ax, ax

loc_8FC14:				; CODE XREF: sub_8B630+45E0j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8FC1D
		jmp	loc_8FAA0
; ���������������������������������������������������������������������������

loc_8FC1D:				; CODE XREF: sub_8B630+45BEj
					; sub_8B630+45E8j
		mov	[bp+var_A], 32h	; '2'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_8FD64
; ���������������������������������������������������������������������������

loc_8FC3E:				; CODE XREF: sub_8B630+4751j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_8FC6B
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_8FC6B
		mov	di, 0FFFFh
		jmp	short loc_8FC7C
; ���������������������������������������������������������������������������

loc_8FC6B:				; CODE XREF: sub_8B630+4618j
					; sub_8B630+4634j
		cmp	di, 0FFFFh
		jnz	short loc_8FC75
		mov	di, 1
		jmp	short loc_8FC7C
; ���������������������������������������������������������������������������

loc_8FC75:				; CODE XREF: sub_8B630+463Ej
		cmp	di, 1
		jnz	short loc_8FC7C
		xor	di, di

loc_8FC7C:				; CODE XREF: sub_8B630+4639j
					; sub_8B630+4643j ...
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8FCA2
		mov	ax, [bp+var_E]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8FCA2:				; CODE XREF: sub_8B630+4655j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8FCBC
		push	23FCh
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_8FCBC:				; CODE XREF: sub_8B630+467Bj
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_8FD08
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8FD08:				; CODE XREF: sub_8B630+4694j
		jmp	short loc_8FD57
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_8FD57
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_8FD84
; ���������������������������������������������������������������������������

loc_8FD57:				; CODE XREF: sub_8B630:loc_8FD08j
					; sub_8B630+46E1j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_8FD64:				; CODE XREF: sub_8B630+460Bj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_8FD74
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_8FD79

loc_8FD74:				; CODE XREF: sub_8B630+473Bj
		mov	ax, 1
		jmp	short loc_8FD7B
; ���������������������������������������������������������������������������

loc_8FD79:				; CODE XREF: sub_8B630+4742j
		xor	ax, ax

loc_8FD7B:				; CODE XREF: sub_8B630+4747j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8FD84
		jmp	loc_8FC3E
; ���������������������������������������������������������������������������

loc_8FD84:				; CODE XREF: sub_8B630+428Ej
					; sub_8B630+4725j ...
		cmp	[bp+var_11], 0
		jz	short loc_8FD97
		lea	ax, [bp+var_D32]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_8FD97:				; CODE XREF: sub_8B630+4758j
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_8FDBF
		cmp	[bp+var_14C+2],	0
		jz	short loc_8FDBF
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8FDBF:				; CODE XREF: sub_8B630+476Cj
					; sub_8B630+4774j
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_8FDEF
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_8FDEF:				; CODE XREF: sub_8B630+47BAj
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFBDh
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14C+2]
		push	ax
		push	240Eh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp+var_98]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14C], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	[bp+var_14E], ax
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_150], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_F8]
		mov	al, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_14E]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	19h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_8FF63
		jmp	loc_8FFE2
; ���������������������������������������������������������������������������

loc_8FF63:				; CODE XREF: sub_8B630+492Ej
		push	3
		lea	ax, [bp+var_13A]
		push	ax
		push	5
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EAC
		mov	word ptr [bp+var_154+2], ax
		mov	word ptr [bp+var_154], 0
		cmp	[bp+var_D40], 0
		jz	short loc_8FFE2
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_154+2]
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_8FFE2:				; CODE XREF: sub_8B630+4930j
					; sub_8B630+4980j
		cmp	[bp+var_10], 0
		jnz	short loc_8FFEB
		jmp	loc_901DE
; ���������������������������������������������������������������������������

loc_8FFEB:				; CODE XREF: sub_8B630+49B6j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+2], 2
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		push	2
		lea	ax, [bp+var_160+2]
		push	ax
		push	0Ch
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_160+2]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_160], 0
		jmp	short loc_90056
; ���������������������������������������������������������������������������

loc_90045:				; CODE XREF: sub_8B630+4A2Bj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_90056:				; CODE XREF: sub_8B630+4A13j
		cmp	word ptr [bp+var_160], 3
		jl	short loc_90045
		jmp	loc_900E9
; ���������������������������������������������������������������������������

loc_90060:				; CODE XREF: sub_8B630+4AC9j
		or	di, di
		jnz	short loc_90085
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_90085
		mov	di, 0FFFFh
		jmp	short loc_90096
; ���������������������������������������������������������������������������

loc_90085:				; CODE XREF: sub_8B630+4A32j
					; sub_8B630+4A4Ej
		cmp	di, 0FFFFh
		jnz	short loc_9008F
		mov	di, 1
		jmp	short loc_90096
; ���������������������������������������������������������������������������

loc_9008F:				; CODE XREF: sub_8B630+4A58j
		cmp	di, 1
		jnz	short loc_90096
		xor	di, di

loc_90096:				; CODE XREF: sub_8B630+4A53j
					; sub_8B630+4A5Dj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_900DC
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_900DC
		jmp	short loc_900FC
; ���������������������������������������������������������������������������

loc_900DC:				; CODE XREF: sub_8B630+4A9Fj
					; sub_8B630+4AA8j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_900E9:				; CODE XREF: sub_8B630+4A2Dj
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_900FC
		jmp	loc_90060
; ���������������������������������������������������������������������������

loc_900FC:				; CODE XREF: sub_8B630+4AAAj
					; sub_8B630+4AC7j
		mov	word ptr [bp+var_160], 0
		jmp	loc_90192
; ���������������������������������������������������������������������������

loc_90105:				; CODE XREF: sub_8B630+4B69j
		or	di, di
		jnz	short loc_9012A
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_9012A
		mov	di, 0FFFFh
		jmp	short loc_9013B
; ���������������������������������������������������������������������������

loc_9012A:				; CODE XREF: sub_8B630+4AD7j
					; sub_8B630+4AF3j
		cmp	di, 0FFFFh
		jnz	short loc_90134
		mov	di, 1
		jmp	short loc_9013B
; ���������������������������������������������������������������������������

loc_90134:				; CODE XREF: sub_8B630+4AFDj
		cmp	di, 1
		jnz	short loc_9013B
		xor	di, di

loc_9013B:				; CODE XREF: sub_8B630+4AF8j
					; sub_8B630+4B02j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_90181
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_90181
		jmp	short loc_9019C
; ���������������������������������������������������������������������������

loc_90181:				; CODE XREF: sub_8B630+4B44j
					; sub_8B630+4B4Dj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_90192:				; CODE XREF: sub_8B630+4AD2j
		cmp	word ptr [bp+var_160], 8
		jge	short loc_9019C
		jmp	loc_90105
; ���������������������������������������������������������������������������

loc_9019C:				; CODE XREF: sub_8B630+4B4Fj
					; sub_8B630+4B67j
		cmp	byte ptr [bp+var_15C+3], 0
		jz	short loc_901C4
		cmp	[bp+var_160+2],	0
		jz	short loc_901C4
		push	0
		mov	al, byte ptr [bp+var_15C+2]
		push	ax
		lea	ax, [bp+var_160+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_901C4:				; CODE XREF: sub_8B630+4B71j
					; sub_8B630+4B79j
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		jmp	loc_9039C
; ���������������������������������������������������������������������������

loc_901DE:				; CODE XREF: sub_8B630+49B8j
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 2Dh	; '-'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_9037C
; ���������������������������������������������������������������������������

loc_9021D:				; CODE XREF: sub_8B630+4D69j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_9024A
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_9024A
		mov	di, 0FFFFh
		jmp	short loc_9025B
; ���������������������������������������������������������������������������

loc_9024A:				; CODE XREF: sub_8B630+4BF7j
					; sub_8B630+4C13j
		cmp	di, 0FFFFh
		jnz	short loc_90254
		mov	di, 1
		jmp	short loc_9025B
; ���������������������������������������������������������������������������

loc_90254:				; CODE XREF: sub_8B630+4C1Dj
		cmp	di, 1
		jnz	short loc_9025B
		xor	di, di

loc_9025B:				; CODE XREF: sub_8B630+4C18j
					; sub_8B630+4C22j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_902BA
		mov	ax, [bp+var_E]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_902BA:				; CODE XREF: sub_8B630+4C6Dj
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_902D4
		push	2412h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_902D4:				; CODE XREF: sub_8B630+4C93j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_90320
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_90320:				; CODE XREF: sub_8B630+4CACj
		jmp	short loc_9036F
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9036F
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9039C
; ���������������������������������������������������������������������������

loc_9036F:				; CODE XREF: sub_8B630:loc_90320j
					; sub_8B630+4CF9j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9037C:				; CODE XREF: sub_8B630+4BEAj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_9038C
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_90391

loc_9038C:				; CODE XREF: sub_8B630+4D53j
		mov	ax, 1
		jmp	short loc_90393
; ���������������������������������������������������������������������������

loc_90391:				; CODE XREF: sub_8B630+4D5Aj
		xor	ax, ax

loc_90393:				; CODE XREF: sub_8B630+4D5Fj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9039C
		jmp	loc_9021D
; ���������������������������������������������������������������������������

loc_9039C:				; CODE XREF: sub_8B630+4BABj
					; sub_8B630+4D3Dj ...
		cmp	[bp+var_11], 0
		jz	short loc_903AF
		lea	ax, [bp+var_D40]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_903AF:				; CODE XREF: sub_8B630+4D70j
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_903D7
		cmp	[bp+var_14C+2],	0
		jz	short loc_903D7
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_903D7:				; CODE XREF: sub_8B630+4D84j
					; sub_8B630+4D8Cj
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_90407
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_90407:				; CODE XREF: sub_8B630+4DD2j
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14C+2]
		push	ax
		push	2424h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp+var_8E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14C], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	[bp+var_14E], ax
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_150], ax
		mov	bx, [bp+var_14E]
		mov	byte ptr [bx+852h], 0
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_E8]
		mov	al, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_14E]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_90576
		jmp	loc_905F5
; ���������������������������������������������������������������������������

loc_90576:				; CODE XREF: sub_8B630+4F41j
		push	3
		lea	ax, [bp+var_130]
		push	ax
		push	18h
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_130]
		push	ax
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48ED2
		mov	word ptr [bp+var_154+2], ax
		mov	word ptr [bp+var_154], 0
		cmp	[bp+var_D32], 0
		jz	short loc_905F5
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_154+2]
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_905F5:				; CODE XREF: sub_8B630+4F43j
					; sub_8B630+4F93j
		cmp	[bp+var_10], 0
		jnz	short loc_905FE
		jmp	loc_907F1
; ���������������������������������������������������������������������������

loc_905FE:				; CODE XREF: sub_8B630+4FC9j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+2], 2
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		push	2
		lea	ax, [bp+var_160+2]
		push	ax
		push	3
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_160+2]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_160], 0
		jmp	short loc_90669
; ���������������������������������������������������������������������������

loc_90658:				; CODE XREF: sub_8B630+503Ej
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_90669:				; CODE XREF: sub_8B630+5026j
		cmp	word ptr [bp+var_160], 3
		jl	short loc_90658
		jmp	loc_906FC
; ���������������������������������������������������������������������������

loc_90673:				; CODE XREF: sub_8B630+50DCj
		or	di, di
		jnz	short loc_90698
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_90698
		mov	di, 0FFFFh
		jmp	short loc_906A9
; ���������������������������������������������������������������������������

loc_90698:				; CODE XREF: sub_8B630+5045j
					; sub_8B630+5061j
		cmp	di, 0FFFFh
		jnz	short loc_906A2
		mov	di, 1
		jmp	short loc_906A9
; ���������������������������������������������������������������������������

loc_906A2:				; CODE XREF: sub_8B630+506Bj
		cmp	di, 1
		jnz	short loc_906A9
		xor	di, di

loc_906A9:				; CODE XREF: sub_8B630+5066j
					; sub_8B630+5070j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_906EF
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_906EF
		jmp	short loc_9070F
; ���������������������������������������������������������������������������

loc_906EF:				; CODE XREF: sub_8B630+50B2j
					; sub_8B630+50BBj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_906FC:				; CODE XREF: sub_8B630+5040j
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_9070F
		jmp	loc_90673
; ���������������������������������������������������������������������������

loc_9070F:				; CODE XREF: sub_8B630+50BDj
					; sub_8B630+50DAj
		mov	word ptr [bp+var_160], 0
		jmp	loc_907A5
; ���������������������������������������������������������������������������

loc_90718:				; CODE XREF: sub_8B630+517Cj
		or	di, di
		jnz	short loc_9073D
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_9073D
		mov	di, 0FFFFh
		jmp	short loc_9074E
; ���������������������������������������������������������������������������

loc_9073D:				; CODE XREF: sub_8B630+50EAj
					; sub_8B630+5106j
		cmp	di, 0FFFFh
		jnz	short loc_90747
		mov	di, 1
		jmp	short loc_9074E
; ���������������������������������������������������������������������������

loc_90747:				; CODE XREF: sub_8B630+5110j
		cmp	di, 1
		jnz	short loc_9074E
		xor	di, di

loc_9074E:				; CODE XREF: sub_8B630+510Bj
					; sub_8B630+5115j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_90794
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_90794
		jmp	short loc_907AF
; ���������������������������������������������������������������������������

loc_90794:				; CODE XREF: sub_8B630+5157j
					; sub_8B630+5160j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_907A5:				; CODE XREF: sub_8B630+50E5j
		cmp	word ptr [bp+var_160], 3
		jge	short loc_907AF
		jmp	loc_90718
; ���������������������������������������������������������������������������

loc_907AF:				; CODE XREF: sub_8B630+5162j
					; sub_8B630+517Aj
		cmp	byte ptr [bp+var_15C+3], 0
		jz	short loc_907D7
		cmp	[bp+var_160+2],	0
		jz	short loc_907D7
		push	0
		mov	al, byte ptr [bp+var_15C+2]
		push	ax
		lea	ax, [bp+var_160+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_907D7:				; CODE XREF: sub_8B630+5184j
					; sub_8B630+518Cj
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		jmp	loc_90CEF
; ���������������������������������������������������������������������������

loc_907F1:				; CODE XREF: sub_8B630+4FCBj
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 3Ch	; '<'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_9098F
; ���������������������������������������������������������������������������

loc_90830:				; CODE XREF: sub_8B630+537Cj
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_9085D
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_9085D
		mov	di, 0FFFFh
		jmp	short loc_9086E
; ���������������������������������������������������������������������������

loc_9085D:				; CODE XREF: sub_8B630+520Aj
					; sub_8B630+5226j
		cmp	di, 0FFFFh
		jnz	short loc_90867
		mov	di, 1
		jmp	short loc_9086E
; ���������������������������������������������������������������������������

loc_90867:				; CODE XREF: sub_8B630+5230j
		cmp	di, 1
		jnz	short loc_9086E
		xor	di, di

loc_9086E:				; CODE XREF: sub_8B630+522Bj
					; sub_8B630+5235j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_908CD
		mov	ax, [bp+var_E]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_908CD:				; CODE XREF: sub_8B630+5280j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_908E7
		push	242Ah
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_908E7:				; CODE XREF: sub_8B630+52A6j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_90933
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_90933:				; CODE XREF: sub_8B630+52BFj
		jmp	short loc_90982
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_90982
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_909AF
; ���������������������������������������������������������������������������

loc_90982:				; CODE XREF: sub_8B630:loc_90933j
					; sub_8B630+530Cj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9098F:				; CODE XREF: sub_8B630+51FDj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_9099F
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_909A4

loc_9099F:				; CODE XREF: sub_8B630+5366j
		mov	ax, 1
		jmp	short loc_909A6
; ���������������������������������������������������������������������������

loc_909A4:				; CODE XREF: sub_8B630+536Dj
		xor	ax, ax

loc_909A6:				; CODE XREF: sub_8B630+5372j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_909AF
		jmp	loc_90830
; ���������������������������������������������������������������������������

loc_909AF:				; CODE XREF: sub_8B630+5350j
					; sub_8B630+537Aj
		mov	[bp+var_A], 3Ah	; ':'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_90B2F
; ���������������������������������������������������������������������������

loc_909D0:				; CODE XREF: sub_8B630+551Cj
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_909FD
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_909FD
		mov	di, 0FFFFh
		jmp	short loc_90A0E
; ���������������������������������������������������������������������������

loc_909FD:				; CODE XREF: sub_8B630+53AAj
					; sub_8B630+53C6j
		cmp	di, 0FFFFh
		jnz	short loc_90A07
		mov	di, 1
		jmp	short loc_90A0E
; ���������������������������������������������������������������������������

loc_90A07:				; CODE XREF: sub_8B630+53D0j
		cmp	di, 1
		jnz	short loc_90A0E
		xor	di, di

loc_90A0E:				; CODE XREF: sub_8B630+53CBj
					; sub_8B630+53D5j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_90A6D
		mov	ax, [bp+var_E]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_90A6D:				; CODE XREF: sub_8B630+5420j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_90A87
		push	2442h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_90A87:				; CODE XREF: sub_8B630+5446j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_90AD3
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_90AD3:				; CODE XREF: sub_8B630+545Fj
		jmp	short loc_90B22
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_90B22
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_90B4F
; ���������������������������������������������������������������������������

loc_90B22:				; CODE XREF: sub_8B630:loc_90AD3j
					; sub_8B630+54ACj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_90B2F:				; CODE XREF: sub_8B630+539Dj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_90B3F
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_90B44

loc_90B3F:				; CODE XREF: sub_8B630+5506j
		mov	ax, 1
		jmp	short loc_90B46
; ���������������������������������������������������������������������������

loc_90B44:				; CODE XREF: sub_8B630+550Dj
		xor	ax, ax

loc_90B46:				; CODE XREF: sub_8B630+5512j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90B4F
		jmp	loc_909D0
; ���������������������������������������������������������������������������

loc_90B4F:				; CODE XREF: sub_8B630+54F0j
					; sub_8B630+551Aj
		mov	[bp+var_A], 5Ah	; 'Z'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_90CCF
; ���������������������������������������������������������������������������

loc_90B70:				; CODE XREF: sub_8B630+56BCj
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_90B9D
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_90B9D
		mov	di, 0FFFFh
		jmp	short loc_90BAE
; ���������������������������������������������������������������������������

loc_90B9D:				; CODE XREF: sub_8B630+554Aj
					; sub_8B630+5566j
		cmp	di, 0FFFFh
		jnz	short loc_90BA7
		mov	di, 1
		jmp	short loc_90BAE
; ���������������������������������������������������������������������������

loc_90BA7:				; CODE XREF: sub_8B630+5570j
		cmp	di, 1
		jnz	short loc_90BAE
		xor	di, di

loc_90BAE:				; CODE XREF: sub_8B630+556Bj
					; sub_8B630+5575j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_90C0D
		mov	ax, [bp+var_E]
		mov	dx, 0Dh
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_90C0D:				; CODE XREF: sub_8B630+55C0j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_90C27
		push	245Fh
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_90C27:				; CODE XREF: sub_8B630+55E6j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_90C73
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_90C73:				; CODE XREF: sub_8B630+55FFj
		jmp	short loc_90CC2
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_90CC2
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_90CEF
; ���������������������������������������������������������������������������

loc_90CC2:				; CODE XREF: sub_8B630:loc_90C73j
					; sub_8B630+564Cj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_90CCF:				; CODE XREF: sub_8B630+553Dj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_90CDF
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_90CE4

loc_90CDF:				; CODE XREF: sub_8B630+56A6j
		mov	ax, 1
		jmp	short loc_90CE6
; ���������������������������������������������������������������������������

loc_90CE4:				; CODE XREF: sub_8B630+56ADj
		xor	ax, ax

loc_90CE6:				; CODE XREF: sub_8B630+56B2j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90CEF
		jmp	loc_90B70
; ���������������������������������������������������������������������������

loc_90CEF:				; CODE XREF: sub_8B630+51BEj
					; sub_8B630+5690j ...
		cmp	[bp+var_11], 0
		jz	short loc_90D02
		lea	ax, [bp+var_D32]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_90D02:				; CODE XREF: sub_8B630+56C3j
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_90D2A
		cmp	[bp+var_14C+2],	0
		jz	short loc_90D2A
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_90D2A:				; CODE XREF: sub_8B630+56D7j
					; sub_8B630+56DFj
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_90D5A
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_90D5A:				; CODE XREF: sub_8B630+5725j
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFD1h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		push	0FFFFh
		push	0
		lea	ax, [bp+var_70]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	di, ax
		push	0FFFFh
		push	0
		lea	ax, [bp+var_84]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144+2], ax
		push	1
		push	0FFFFh
		push	0
		lea	ax, [bp+var_66]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_144], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_B8]
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_144+2]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_144]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [bp+var_148+2], 0
		mov	word ptr [bp+var_148], 3
		mov	word ptr [bp+var_14C+2], 2
		mov	word ptr [bp+var_14C], 2
		mov	[bp+var_14E], 0
		cmp	[bp+var_11], 0
		jnz	short loc_90E89
		jmp	loc_90F0B
; ���������������������������������������������������������������������������

loc_90E89:				; CODE XREF: sub_8B630+5854j
		push	3
		lea	ax, [bp+var_13A]
		push	ax
		push	5
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EAC
		add	ax, 0FFCEh
		mov	[bp+var_150], ax
		mov	word ptr [bp+var_154+2], 0
		cmp	[bp+var_D40], 0
		jz	short loc_90F0B
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154+2]
		push	[bp+var_150]
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_90F0B:				; CODE XREF: sub_8B630+5856j
					; sub_8B630+58A9j
		cmp	[bp+var_10], 0
		jnz	short loc_90F14
		jmp	loc_91114
; ���������������������������������������������������������������������������

loc_90F14:				; CODE XREF: sub_8B630+58DFj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_15C], 0
		mov	byte ptr [bp+var_158], 2
		mov	byte ptr [bp+var_158+1], 0
		mov	[bp+var_158+2],	0
		push	2
		lea	ax, [bp+var_15C]
		push	ax
		push	4
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_15C]
		push	ax
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	word ptr [bp+var_160+2], 0
		jmp	short loc_90F7E
; ���������������������������������������������������������������������������

loc_90F6D:				; CODE XREF: sub_8B630+5953j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160+2]

loc_90F7E:				; CODE XREF: sub_8B630+593Bj
		cmp	word ptr [bp+var_160+2], 4
		jl	short loc_90F6D
		push	0FFFFh
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_83FE
		add	sp, 4
		mov	word ptr [bp+var_160+2], 0
		jmp	loc_91091
; ���������������������������������������������������������������������������

loc_90F9D:				; CODE XREF: sub_8B630+5A72j
		mov	ax, word ptr [bp+var_14C+2]
		cmp	ax, word ptr [bp+var_14C]
		jnz	short loc_91008
		mov	ax, word ptr [bp+var_160+2]
		inc	word ptr [bp+var_160+2]
		test	ax, 1
		jz	short loc_90FDE
		mov	ax, word ptr [bp+var_148]
		mov	word ptr [bp+var_160], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_160]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_14C], ax

loc_90FDE:				; CODE XREF: sub_8B630+5982j
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jge	short loc_90FF0
		mov	word ptr [bp+var_148+2], 0FFFFh
		jmp	short loc_91008
; ���������������������������������������������������������������������������

loc_90FF0:				; CODE XREF: sub_8B630+59B6j
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jnz	short loc_91002
		mov	word ptr [bp+var_148+2], 0
		jmp	short loc_91008
; ���������������������������������������������������������������������������

loc_91002:				; CODE XREF: sub_8B630+59C8j
		mov	word ptr [bp+var_148+2], 1

loc_91008:				; CODE XREF: sub_8B630+5975j
					; sub_8B630+59BEj ...
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144+2]
		mov	bx, word ptr [bp+var_144+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+var_14E]
		inc	[bp+var_14E]
		cmp	ax, 1
		jnz	short loc_9104E
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_9104E:				; CODE XREF: sub_8B630+5A0Fj
		cmp	[bp+var_14E], 5
		jnz	short loc_91062
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_91062:				; CODE XREF: sub_8B630+5A23j
		cmp	[bp+var_14E], 8
		jnz	short loc_9106F
		mov	[bp+var_14E], 0

loc_9106F:				; CODE XREF: sub_8B630+5A37j
		mov	ax, word ptr [bp+var_148+2]
		add	word ptr [bp+var_14C+2], ax
		jmp	short loc_91084
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_91084
		jmp	short loc_910A5
; ���������������������������������������������������������������������������

loc_91084:				; CODE XREF: sub_8B630+5A47j
					; sub_8B630+5A50j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_91091:				; CODE XREF: sub_8B630+596Aj
		lea	ax, [bp+var_CEA]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jz	short loc_910A5
		jmp	loc_90F9D
; ���������������������������������������������������������������������������

loc_910A5:				; CODE XREF: sub_8B630+5A52j
					; sub_8B630+5A70j
		mov	word ptr [bp+var_160+2], 0
		jmp	short loc_910BE
; ���������������������������������������������������������������������������

loc_910AD:				; CODE XREF: sub_8B630+5A93j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160+2]

loc_910BE:				; CODE XREF: sub_8B630+5A7Bj
		cmp	word ptr [bp+var_160+2], 4
		jl	short loc_910AD
		lea	ax, [bp+var_CEA]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_158+1], 0
		jz	short loc_910FA
		cmp	[bp+var_15C], 0
		jz	short loc_910FA
		push	0
		mov	al, byte ptr [bp+var_158]
		push	ax
		lea	ax, [bp+var_15C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_910FA:				; CODE XREF: sub_8B630+5AA7j
					; sub_8B630+5AAFj
		mov	[bp+var_15C], 0
		mov	byte ptr [bp+var_158+1], 0
		mov	[bp+var_158+2],	0
		jmp	loc_9131F
; ���������������������������������������������������������������������������

loc_91114:				; CODE XREF: sub_8B630+58E1j
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C5h ; '�'
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 3Ch	; '<'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_912FF
; ���������������������������������������������������������������������������

loc_91154:				; CODE XREF: sub_8B630+5CECj
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_154], ax
		mov	ax, word ptr [bp+var_14C+2]
		cmp	ax, word ptr [bp+var_14C]
		jnz	short loc_911C2
		test	word ptr [bp+var_154], 1
		jz	short loc_91198
		mov	ax, word ptr [bp+var_148]
		mov	word ptr [bp+var_158+2], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_158+2]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_14C], ax

loc_91198:				; CODE XREF: sub_8B630+5B3Cj
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jge	short loc_911AA
		mov	word ptr [bp+var_148+2], 0FFFFh
		jmp	short loc_911C2
; ���������������������������������������������������������������������������

loc_911AA:				; CODE XREF: sub_8B630+5B70j
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jnz	short loc_911BC
		mov	word ptr [bp+var_148+2], 0
		jmp	short loc_911C2
; ���������������������������������������������������������������������������

loc_911BC:				; CODE XREF: sub_8B630+5B82j
		mov	word ptr [bp+var_148+2], 1

loc_911C2:				; CODE XREF: sub_8B630+5B34j
					; sub_8B630+5B78j ...
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144+2]
		mov	bx, word ptr [bp+var_144+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+var_14E]
		inc	[bp+var_14E]
		cmp	ax, 1
		jnz	short loc_91208
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_91208:				; CODE XREF: sub_8B630+5BC9j
		cmp	[bp+var_14E], 5
		jnz	short loc_9121C
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_9121C:				; CODE XREF: sub_8B630+5BDDj
		cmp	[bp+var_14E], 8
		jnz	short loc_91229
		mov	[bp+var_14E], 0

loc_91229:				; CODE XREF: sub_8B630+5BF1j
		mov	ax, word ptr [bp+var_148+2]
		add	word ptr [bp+var_14C+2], ax
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_154]
		jnz	short loc_91257
		mov	ax, [bp+var_E]
		mov	dx, 0Eh
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_91257:				; CODE XREF: sub_8B630+5C0Aj
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_154]
		jnz	short loc_912A3
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_912A3:				; CODE XREF: sub_8B630+5C2Fj
		jmp	short loc_912F2
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_912F2
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9131F
; ���������������������������������������������������������������������������

loc_912F2:				; CODE XREF: sub_8B630:loc_912A3j
					; sub_8B630+5C7Cj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_912FF:				; CODE XREF: sub_8B630+5B21j
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_9130F
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_91314

loc_9130F:				; CODE XREF: sub_8B630+5CD6j
		mov	ax, 1
		jmp	short loc_91316
; ���������������������������������������������������������������������������

loc_91314:				; CODE XREF: sub_8B630+5CDDj
		xor	ax, ax

loc_91316:				; CODE XREF: sub_8B630+5CE2j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9131F
		jmp	loc_91154
; ���������������������������������������������������������������������������

loc_9131F:				; CODE XREF: sub_8B630+5AE1j
					; sub_8B630+5CC0j ...
		cmp	[bp+var_11], 0
		jz	short loc_91332
		lea	ax, [bp+var_D40]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_91332:				; CODE XREF: sub_8B630+5CF3j
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_9134B
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_9134B:				; CODE XREF: sub_8B630+5D16j
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFBDh
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14C+2]
		push	ax
		push	2480h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp+var_98]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14C], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	[bp+var_14E], ax
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_150], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_F8]
		mov	al, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_14E]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_914BF
		jmp	loc_9153E
; ���������������������������������������������������������������������������

loc_914BF:				; CODE XREF: sub_8B630+5E8Aj
		push	3
		lea	ax, [bp+var_13A]
		push	ax
		push	5
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EAC
		mov	word ptr [bp+var_154+2], ax
		mov	word ptr [bp+var_154], 0
		cmp	[bp+var_D40], 0
		jz	short loc_9153E
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_154+2]
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_9153E:				; CODE XREF: sub_8B630+5E8Cj
					; sub_8B630+5EDCj
		cmp	[bp+var_10], 0
		jnz	short loc_91547
		jmp	loc_9173A
; ���������������������������������������������������������������������������

loc_91547:				; CODE XREF: sub_8B630+5F12j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+2], 2
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		push	2
		lea	ax, [bp+var_160+2]
		push	ax
		push	0Dh
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_160+2]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_160], 0
		jmp	short loc_915B2
; ���������������������������������������������������������������������������

loc_915A1:				; CODE XREF: sub_8B630+5F87j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_915B2:				; CODE XREF: sub_8B630+5F6Fj
		cmp	word ptr [bp+var_160], 3
		jl	short loc_915A1
		jmp	loc_91645
; ���������������������������������������������������������������������������

loc_915BC:				; CODE XREF: sub_8B630+6025j
		or	di, di
		jnz	short loc_915E1
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_915E1
		mov	di, 0FFFFh
		jmp	short loc_915F2
; ���������������������������������������������������������������������������

loc_915E1:				; CODE XREF: sub_8B630+5F8Ej
					; sub_8B630+5FAAj
		cmp	di, 0FFFFh
		jnz	short loc_915EB
		mov	di, 1
		jmp	short loc_915F2
; ���������������������������������������������������������������������������

loc_915EB:				; CODE XREF: sub_8B630+5FB4j
		cmp	di, 1
		jnz	short loc_915F2
		xor	di, di

loc_915F2:				; CODE XREF: sub_8B630+5FAFj
					; sub_8B630+5FB9j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_91638
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_91638
		jmp	short loc_91658
; ���������������������������������������������������������������������������

loc_91638:				; CODE XREF: sub_8B630+5FFBj
					; sub_8B630+6004j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_91645:				; CODE XREF: sub_8B630+5F89j
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_91658
		jmp	loc_915BC
; ���������������������������������������������������������������������������

loc_91658:				; CODE XREF: sub_8B630+6006j
					; sub_8B630+6023j
		mov	word ptr [bp+var_160], 0
		jmp	loc_916EE
; ���������������������������������������������������������������������������

loc_91661:				; CODE XREF: sub_8B630+60C5j
		or	di, di
		jnz	short loc_91686
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_91686
		mov	di, 0FFFFh
		jmp	short loc_91697
; ���������������������������������������������������������������������������

loc_91686:				; CODE XREF: sub_8B630+6033j
					; sub_8B630+604Fj
		cmp	di, 0FFFFh
		jnz	short loc_91690
		mov	di, 1
		jmp	short loc_91697
; ���������������������������������������������������������������������������

loc_91690:				; CODE XREF: sub_8B630+6059j
		cmp	di, 1
		jnz	short loc_91697
		xor	di, di

loc_91697:				; CODE XREF: sub_8B630+6054j
					; sub_8B630+605Ej ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_916DD
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_916DD
		jmp	short loc_916F8
; ���������������������������������������������������������������������������

loc_916DD:				; CODE XREF: sub_8B630+60A0j
					; sub_8B630+60A9j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_916EE:				; CODE XREF: sub_8B630+602Ej
		cmp	word ptr [bp+var_160], 8
		jge	short loc_916F8
		jmp	loc_91661
; ���������������������������������������������������������������������������

loc_916F8:				; CODE XREF: sub_8B630+60ABj
					; sub_8B630+60C3j
		cmp	byte ptr [bp+var_15C+3], 0
		jz	short loc_91720
		cmp	[bp+var_160+2],	0
		jz	short loc_91720
		push	0
		mov	al, byte ptr [bp+var_15C+2]
		push	ax
		lea	ax, [bp+var_160+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_91720:				; CODE XREF: sub_8B630+60CDj
					; sub_8B630+60D5j
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		jmp	loc_918F8
; ���������������������������������������������������������������������������

loc_9173A:				; CODE XREF: sub_8B630+5F14j
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 39h	; '9'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_918D8
; ���������������������������������������������������������������������������

loc_91779:				; CODE XREF: sub_8B630+62C5j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_917A6
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_917A6
		mov	di, 0FFFFh
		jmp	short loc_917B7
; ���������������������������������������������������������������������������

loc_917A6:				; CODE XREF: sub_8B630+6153j
					; sub_8B630+616Fj
		cmp	di, 0FFFFh
		jnz	short loc_917B0
		mov	di, 1
		jmp	short loc_917B7
; ���������������������������������������������������������������������������

loc_917B0:				; CODE XREF: sub_8B630+6179j
		cmp	di, 1
		jnz	short loc_917B7
		xor	di, di

loc_917B7:				; CODE XREF: sub_8B630+6174j
					; sub_8B630+617Ej ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_91816
		mov	ax, [bp+var_E]
		mov	dx, 0Fh
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_91816:				; CODE XREF: sub_8B630+61C9j
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_91830
		push	2484h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_91830:				; CODE XREF: sub_8B630+61EFj
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_9187C
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_9187C:				; CODE XREF: sub_8B630+6208j
		jmp	short loc_918CB
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_918CB
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_918F8
; ���������������������������������������������������������������������������

loc_918CB:				; CODE XREF: sub_8B630:loc_9187Cj
					; sub_8B630+6255j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_918D8:				; CODE XREF: sub_8B630+6146j
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_918E8
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_918ED

loc_918E8:				; CODE XREF: sub_8B630+62AFj
		mov	ax, 1
		jmp	short loc_918EF
; ���������������������������������������������������������������������������

loc_918ED:				; CODE XREF: sub_8B630+62B6j
		xor	ax, ax

loc_918EF:				; CODE XREF: sub_8B630+62BBj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_918F8
		jmp	loc_91779
; ���������������������������������������������������������������������������

loc_918F8:				; CODE XREF: sub_8B630+6107j
					; sub_8B630+6299j ...
		cmp	[bp+var_11], 0
		jz	short loc_9190B
		lea	ax, [bp+var_D40]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_9190B:				; CODE XREF: sub_8B630+62CCj
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_91933
		cmp	[bp+var_14C+2],	0
		jz	short loc_91933
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_91933:				; CODE XREF: sub_8B630+62E0j
					; sub_8B630+62E8j
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_91963
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_91963:				; CODE XREF: sub_8B630+632Ej
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFC7h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14C+2]
		push	ax
		push	2497h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp+var_8E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14C], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	[bp+var_14E], ax
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_150], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_E8]
		mov	al, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_14E]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_91AC9
		jmp	loc_91B48
; ���������������������������������������������������������������������������

loc_91AC9:				; CODE XREF: sub_8B630+6494j
		push	3
		lea	ax, [bp+var_130]
		push	ax
		push	18h
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_130]
		push	ax
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48ED2
		mov	word ptr [bp+var_154+2], ax
		mov	word ptr [bp+var_154], 0
		cmp	[bp+var_D32], 0
		jz	short loc_91B48
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154]
		push	word ptr [bp+var_154+2]
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_91B48:				; CODE XREF: sub_8B630+6496j
					; sub_8B630+64E6j
		cmp	[bp+var_10], 0
		jnz	short loc_91B51
		jmp	loc_91EEA
; ���������������������������������������������������������������������������

loc_91B51:				; CODE XREF: sub_8B630+651Cj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+2], 2
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		push	2
		lea	ax, [bp+var_160+2]
		push	ax
		push	5
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_160+2]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_160], 0
		jmp	short loc_91BBC
; ���������������������������������������������������������������������������

loc_91BAB:				; CODE XREF: sub_8B630+6591j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_91BBC:				; CODE XREF: sub_8B630+6579j
		cmp	word ptr [bp+var_160], 3
		jl	short loc_91BAB
		jmp	loc_91C4F
; ���������������������������������������������������������������������������

loc_91BC6:				; CODE XREF: sub_8B630+662Fj
		or	di, di
		jnz	short loc_91BEB
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_91BEB
		mov	di, 0FFFFh
		jmp	short loc_91BFC
; ���������������������������������������������������������������������������

loc_91BEB:				; CODE XREF: sub_8B630+6598j
					; sub_8B630+65B4j
		cmp	di, 0FFFFh
		jnz	short loc_91BF5
		mov	di, 1
		jmp	short loc_91BFC
; ���������������������������������������������������������������������������

loc_91BF5:				; CODE XREF: sub_8B630+65BEj
		cmp	di, 1
		jnz	short loc_91BFC
		xor	di, di

loc_91BFC:				; CODE XREF: sub_8B630+65B9j
					; sub_8B630+65C3j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_91C42
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_91C42
		jmp	short loc_91C62
; ���������������������������������������������������������������������������

loc_91C42:				; CODE XREF: sub_8B630+6605j
					; sub_8B630+660Ej
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_91C4F:				; CODE XREF: sub_8B630+6593j
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_91C62
		jmp	loc_91BC6
; ���������������������������������������������������������������������������

loc_91C62:				; CODE XREF: sub_8B630+6610j
					; sub_8B630+662Dj
		mov	word ptr [bp+var_160], 0
		jmp	short loc_91CBE
; ���������������������������������������������������������������������������

loc_91C6A:				; CODE XREF: sub_8B630+6693j
		or	di, di
		jnz	short loc_91C8F
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_91C8F
		mov	di, 0FFFFh
		jmp	short loc_91CA0
; ���������������������������������������������������������������������������

loc_91C8F:				; CODE XREF: sub_8B630+663Cj
					; sub_8B630+6658j
		cmp	di, 0FFFFh
		jnz	short loc_91C99
		mov	di, 1
		jmp	short loc_91CA0
; ���������������������������������������������������������������������������

loc_91C99:				; CODE XREF: sub_8B630+6662j
		cmp	di, 1
		jnz	short loc_91CA0
		xor	di, di

loc_91CA0:				; CODE XREF: sub_8B630+665Dj
					; sub_8B630+6667j ...
		jmp	short loc_91CAD
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_91CAD
		jmp	short loc_91CC5
; ���������������������������������������������������������������������������

loc_91CAD:				; CODE XREF: sub_8B630:loc_91CA0j
					; sub_8B630+6679j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_91CBE:				; CODE XREF: sub_8B630+6638j
		cmp	word ptr [bp+var_160], 8
		jl	short loc_91C6A

loc_91CC5:				; CODE XREF: sub_8B630+667Bj
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166], 2
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		push	2
		lea	ax, [bp+var_16A]
		push	ax
		push	6
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_16A]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_160], 0
		jmp	short loc_91D23
; ���������������������������������������������������������������������������

loc_91D12:				; CODE XREF: sub_8B630+66F8j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_91D23:				; CODE XREF: sub_8B630+66E0j
		cmp	word ptr [bp+var_160], 3
		jl	short loc_91D12
		jmp	loc_91DB6
; ���������������������������������������������������������������������������

loc_91D2D:				; CODE XREF: sub_8B630+6796j
		or	di, di
		jnz	short loc_91D52
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_91D52
		mov	di, 0FFFFh
		jmp	short loc_91D63
; ���������������������������������������������������������������������������

loc_91D52:				; CODE XREF: sub_8B630+66FFj
					; sub_8B630+671Bj
		cmp	di, 0FFFFh
		jnz	short loc_91D5C
		mov	di, 1
		jmp	short loc_91D63
; ���������������������������������������������������������������������������

loc_91D5C:				; CODE XREF: sub_8B630+6725j
		cmp	di, 1
		jnz	short loc_91D63
		xor	di, di

loc_91D63:				; CODE XREF: sub_8B630+6720j
					; sub_8B630+672Aj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_91DA9
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_91DA9
		jmp	short loc_91DC9
; ���������������������������������������������������������������������������

loc_91DA9:				; CODE XREF: sub_8B630+676Cj
					; sub_8B630+6775j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_91DB6:				; CODE XREF: sub_8B630+66FAj
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_91DC9
		jmp	loc_91D2D
; ���������������������������������������������������������������������������

loc_91DC9:				; CODE XREF: sub_8B630+6777j
					; sub_8B630+6794j
		mov	word ptr [bp+var_160], 0
		jmp	loc_91E5F
; ���������������������������������������������������������������������������

loc_91DD2:				; CODE XREF: sub_8B630+6836j
		or	di, di
		jnz	short loc_91DF7
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_91DF7
		mov	di, 0FFFFh
		jmp	short loc_91E08
; ���������������������������������������������������������������������������

loc_91DF7:				; CODE XREF: sub_8B630+67A4j
					; sub_8B630+67C0j
		cmp	di, 0FFFFh
		jnz	short loc_91E01
		mov	di, 1
		jmp	short loc_91E08
; ���������������������������������������������������������������������������

loc_91E01:				; CODE XREF: sub_8B630+67CAj
		cmp	di, 1
		jnz	short loc_91E08
		xor	di, di

loc_91E08:				; CODE XREF: sub_8B630+67C5j
					; sub_8B630+67CFj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_91E4E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_91E4E
		jmp	short loc_91E69
; ���������������������������������������������������������������������������

loc_91E4E:				; CODE XREF: sub_8B630+6811j
					; sub_8B630+681Aj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160]

loc_91E5F:				; CODE XREF: sub_8B630+679Fj
		cmp	word ptr [bp+var_160], 4
		jge	short loc_91E69
		jmp	loc_91DD2
; ���������������������������������������������������������������������������

loc_91E69:				; CODE XREF: sub_8B630+681Cj
					; sub_8B630+6834j
		cmp	byte ptr [bp+var_166+1], 0
		jz	short loc_91E91
		cmp	[bp+var_16A], 0
		jz	short loc_91E91
		push	0
		mov	al, byte ptr [bp+var_166]
		push	ax
		lea	ax, [bp+var_16A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_91E91:				; CODE XREF: sub_8B630+683Ej
					; sub_8B630+6846j
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		cmp	byte ptr [bp+var_15C+3], 0
		jz	short loc_91ED0
		cmp	[bp+var_160+2],	0
		jz	short loc_91ED0
		push	0
		mov	al, byte ptr [bp+var_15C+2]
		push	ax
		lea	ax, [bp+var_160+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_91ED0:				; CODE XREF: sub_8B630+687Dj
					; sub_8B630+6885j
		mov	[bp+var_160+2],	0
		mov	byte ptr [bp+var_15C+3], 0
		mov	[bp+var_158], 0
		jmp	loc_92635
; ���������������������������������������������������������������������������

loc_91EEA:				; CODE XREF: sub_8B630+651Ej
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 44h	; 'D'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_920EA
; ���������������������������������������������������������������������������

loc_91F29:				; CODE XREF: sub_8B630+6AD7j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_91F56
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_91F56
		mov	di, 0FFFFh
		jmp	short loc_91F67
; ���������������������������������������������������������������������������

loc_91F56:				; CODE XREF: sub_8B630+6903j
					; sub_8B630+691Fj
		cmp	di, 0FFFFh
		jnz	short loc_91F60
		mov	di, 1
		jmp	short loc_91F67
; ���������������������������������������������������������������������������

loc_91F60:				; CODE XREF: sub_8B630+6929j
		cmp	di, 1
		jnz	short loc_91F67
		xor	di, di

loc_91F67:				; CODE XREF: sub_8B630+6924j
					; sub_8B630+692Ej ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_91FC4
		mov	ax, [bp+var_E]
		shl	ax, 4
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_91FC4:				; CODE XREF: sub_8B630+6979j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_91FDE
		push	249Dh
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_91FDE:				; CODE XREF: sub_8B630+699Dj
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_91FF7
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_91FF7:				; CODE XREF: sub_8B630+69B7j
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_92010
		push	0FFFFh
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_92010:				; CODE XREF: sub_8B630+69D0j
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_92029
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_92029:				; CODE XREF: sub_8B630+69E9j
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_92042
		push	0FFFFh
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_92042:				; CODE XREF: sub_8B630+6A02j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_9208E
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_9208E:				; CODE XREF: sub_8B630+6A1Aj
		jmp	short loc_920DD
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_920DD
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9210A
; ���������������������������������������������������������������������������

loc_920DD:				; CODE XREF: sub_8B630:loc_9208Ej
					; sub_8B630+6A67j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_920EA:				; CODE XREF: sub_8B630+68F6j
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_920FA
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_920FF

loc_920FA:				; CODE XREF: sub_8B630+6AC1j
		mov	ax, 1
		jmp	short loc_92101
; ���������������������������������������������������������������������������

loc_920FF:				; CODE XREF: sub_8B630+6AC8j
		xor	ax, ax

loc_92101:				; CODE XREF: sub_8B630+6ACDj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9210A
		jmp	loc_91F29
; ���������������������������������������������������������������������������

loc_9210A:				; CODE XREF: sub_8B630+6AABj
					; sub_8B630+6AD5j
		mov	[bp+var_A], 21h	; '!'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_922A3
; ���������������������������������������������������������������������������

loc_9212B:				; CODE XREF: sub_8B630+6C90j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_92158
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_92158
		mov	di, 0FFFFh
		jmp	short loc_92169
; ���������������������������������������������������������������������������

loc_92158:				; CODE XREF: sub_8B630+6B05j
					; sub_8B630+6B21j
		cmp	di, 0FFFFh
		jnz	short loc_92162
		mov	di, 1
		jmp	short loc_92169
; ���������������������������������������������������������������������������

loc_92162:				; CODE XREF: sub_8B630+6B2Bj
		cmp	di, 1
		jnz	short loc_92169
		xor	di, di

loc_92169:				; CODE XREF: sub_8B630+6B26j
					; sub_8B630+6B30j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_921C8
		mov	ax, [bp+var_E]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_921C8:				; CODE XREF: sub_8B630+6B7Bj
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_921E2
		push	24C0h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_921E2:				; CODE XREF: sub_8B630+6BA1j
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_921FB
		push	13h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_921FB:				; CODE XREF: sub_8B630+6BBBj
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_92247
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_92247:				; CODE XREF: sub_8B630+6BD3j
		jmp	short loc_92296
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_92296
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_922C3
; ���������������������������������������������������������������������������

loc_92296:				; CODE XREF: sub_8B630:loc_92247j
					; sub_8B630+6C20j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_922A3:				; CODE XREF: sub_8B630+6AF8j
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_922B3
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_922B8

loc_922B3:				; CODE XREF: sub_8B630+6C7Aj
		mov	ax, 1
		jmp	short loc_922BA
; ���������������������������������������������������������������������������

loc_922B8:				; CODE XREF: sub_8B630+6C81j
		xor	ax, ax

loc_922BA:				; CODE XREF: sub_8B630+6C86j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_922C3
		jmp	loc_9212B
; ���������������������������������������������������������������������������

loc_922C3:				; CODE XREF: sub_8B630+6C64j
					; sub_8B630+6C8Ej
		mov	[bp+var_A], 1Bh
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_9245C
; ���������������������������������������������������������������������������

loc_922E4:				; CODE XREF: sub_8B630+6E49j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_92311
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_92311
		mov	di, 0FFFFh
		jmp	short loc_92322
; ���������������������������������������������������������������������������

loc_92311:				; CODE XREF: sub_8B630+6CBEj
					; sub_8B630+6CDAj
		cmp	di, 0FFFFh
		jnz	short loc_9231B
		mov	di, 1
		jmp	short loc_92322
; ���������������������������������������������������������������������������

loc_9231B:				; CODE XREF: sub_8B630+6CE4j
		cmp	di, 1
		jnz	short loc_92322
		xor	di, di

loc_92322:				; CODE XREF: sub_8B630+6CDFj
					; sub_8B630+6CE9j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_92381
		mov	ax, [bp+var_E]
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_92381:				; CODE XREF: sub_8B630+6D34j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_9239B
		push	24CFh
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_9239B:				; CODE XREF: sub_8B630+6D5Aj
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_923B4
		push	0FFFFh
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_923B4:				; CODE XREF: sub_8B630+6D74j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_92400
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_92400:				; CODE XREF: sub_8B630+6D8Cj
		jmp	short loc_9244F
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9244F
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9247C
; ���������������������������������������������������������������������������

loc_9244F:				; CODE XREF: sub_8B630:loc_92400j
					; sub_8B630+6DD9j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9245C:				; CODE XREF: sub_8B630+6CB1j
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_9246C
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_92471

loc_9246C:				; CODE XREF: sub_8B630+6E33j
		mov	ax, 1
		jmp	short loc_92473
; ���������������������������������������������������������������������������

loc_92471:				; CODE XREF: sub_8B630+6E3Aj
		xor	ax, ax

loc_92473:				; CODE XREF: sub_8B630+6E3Fj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9247C
		jmp	loc_922E4
; ���������������������������������������������������������������������������

loc_9247C:				; CODE XREF: sub_8B630+6E1Dj
					; sub_8B630+6E47j
		mov	[bp+var_A], 38h	; '8'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_92615
; ���������������������������������������������������������������������������

loc_9249D:				; CODE XREF: sub_8B630+7002j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_158+2], ax
		or	di, di
		jnz	short loc_924CA
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_924CA
		mov	di, 0FFFFh
		jmp	short loc_924DB
; ���������������������������������������������������������������������������

loc_924CA:				; CODE XREF: sub_8B630+6E77j
					; sub_8B630+6E93j
		cmp	di, 0FFFFh
		jnz	short loc_924D4
		mov	di, 1
		jmp	short loc_924DB
; ���������������������������������������������������������������������������

loc_924D4:				; CODE XREF: sub_8B630+6E9Dj
		cmp	di, 1
		jnz	short loc_924DB
		xor	di, di

loc_924DB:				; CODE XREF: sub_8B630+6E98j
					; sub_8B630+6EA2j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_9253A
		mov	ax, [bp+var_E]
		mov	dx, 13h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_9253A:				; CODE XREF: sub_8B630+6EEDj
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_92554
		push	24D6h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_92554:				; CODE XREF: sub_8B630+6F13j
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_9256D
		push	19h
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_9256D:				; CODE XREF: sub_8B630+6F2Dj
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_158+2]
		jnz	short loc_925B9
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_925B9:				; CODE XREF: sub_8B630+6F45j
		jmp	short loc_92608
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_92608
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_92635
; ���������������������������������������������������������������������������

loc_92608:				; CODE XREF: sub_8B630:loc_925B9j
					; sub_8B630+6F92j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_92615:				; CODE XREF: sub_8B630+6E6Aj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_92625
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_9262A

loc_92625:				; CODE XREF: sub_8B630+6FECj
		mov	ax, 1
		jmp	short loc_9262C
; ���������������������������������������������������������������������������

loc_9262A:				; CODE XREF: sub_8B630+6FF3j
		xor	ax, ax

loc_9262C:				; CODE XREF: sub_8B630+6FF8j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_92635
		jmp	loc_9249D
; ���������������������������������������������������������������������������

loc_92635:				; CODE XREF: sub_8B630+68B7j
					; sub_8B630+6FD6j ...
		cmp	[bp+var_11], 0
		jz	short loc_92648
		lea	ax, [bp+var_D32]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_92648:				; CODE XREF: sub_8B630+7009j
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_92670
		cmp	[bp+var_14C+2],	0
		jz	short loc_92670
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_92670:				; CODE XREF: sub_8B630+701Dj
					; sub_8B630+7025j
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_926A0
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_926A0:				; CODE XREF: sub_8B630+706Bj
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFDEh
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		push	1
		push	3
		lea	ax, [bp+var_7A]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144+2], ax
		push	1
		push	1
		push	3
		lea	ax, [bp+var_5C]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_144], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_B8]
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_144+2]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_144]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		xor	di, di
		mov	word ptr [bp+var_148+2], 3
		mov	word ptr [bp+var_148], 2
		mov	word ptr [bp+var_14C+2], 2
		cmp	[bp+var_11], 0
		jnz	short loc_927A2
		jmp	loc_92824
; ���������������������������������������������������������������������������

loc_927A2:				; CODE XREF: sub_8B630+716Dj
		push	3
		lea	ax, [bp+var_130]
		push	ax
		push	18h
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_130]
		push	ax
		lea	ax, [bp+var_D32]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48ED2
		add	ax, 0FFCEh
		mov	word ptr [bp+var_14C], ax
		mov	[bp+var_14E], 0
		cmp	[bp+var_D32], 0
		jz	short loc_92824
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_14E]
		push	word ptr [bp+var_14C]
		push	[bp+var_D30]
		mov	bx, [bp+var_D32]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_92824:				; CODE XREF: sub_8B630+716Fj
					; sub_8B630+71C2j
		cmp	[bp+var_10], 0
		jnz	short loc_9282D
		jmp	loc_92A0E
; ���������������������������������������������������������������������������

loc_9282D:				; CODE XREF: sub_8B630+71F8j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_154+2],	0
		push	2
		lea	ax, [bp+var_158]
		push	ax
		push	7
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	word ptr [bp+var_15C+2], 0
		jmp	short loc_92897
; ���������������������������������������������������������������������������

loc_92886:				; CODE XREF: sub_8B630+726Cj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_15C+2]

loc_92897:				; CODE XREF: sub_8B630+7254j
		cmp	word ptr [bp+var_15C+2], 4
		jl	short loc_92886
		push	0FFFFh
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_83FE
		add	sp, 4
		mov	word ptr [bp+var_15C+2], 0
		jmp	loc_92982
; ���������������������������������������������������������������������������

loc_928B6:				; CODE XREF: sub_8B630+7363j
		mov	ax, word ptr [bp+var_148]
		cmp	ax, word ptr [bp+var_14C+2]
		jnz	short loc_92917
		mov	ax, word ptr [bp+var_15C+2]
		inc	word ptr [bp+var_15C+2]
		test	ax, 1
		jz	short loc_928F7
		mov	ax, word ptr [bp+var_148+2]
		mov	word ptr [bp+var_15C], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_15C]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_14C+2], ax

loc_928F7:				; CODE XREF: sub_8B630+729Bj
		mov	ax, word ptr [bp+var_14C+2]
		cmp	ax, word ptr [bp+var_148]
		jge	short loc_92906
		mov	di, 0FFFFh
		jmp	short loc_92917
; ���������������������������������������������������������������������������

loc_92906:				; CODE XREF: sub_8B630+72CFj
		mov	ax, word ptr [bp+var_14C+2]
		cmp	ax, word ptr [bp+var_148]
		jnz	short loc_92914
		xor	di, di
		jmp	short loc_92917
; ���������������������������������������������������������������������������

loc_92914:				; CODE XREF: sub_8B630+72DEj
		mov	di, 1

loc_92917:				; CODE XREF: sub_8B630+728Ej
					; sub_8B630+72D4j ...
		push	di
		push	0
		push	word ptr [bp+var_144+2]
		mov	bx, word ptr [bp+var_144+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		add	word ptr [bp+var_148], di
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_160+2], ax
		mov	bx, word ptr [bp+var_144]
		mov	ax, word ptr [bp+var_160+2]
		mov	[bx+1Bh], ax
		jmp	short loc_92975
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_92975
		jmp	short loc_92996
; ���������������������������������������������������������������������������

loc_92975:				; CODE XREF: sub_8B630+7338j
					; sub_8B630+7341j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_92982:				; CODE XREF: sub_8B630+7283j
		lea	ax, [bp+var_CEA]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jz	short loc_92996
		jmp	loc_928B6
; ���������������������������������������������������������������������������

loc_92996:				; CODE XREF: sub_8B630+7343j
					; sub_8B630+7361j
		mov	bx, word ptr [bp+var_144]
		mov	word ptr [bx+1Bh], 0
		mov	word ptr [bp+var_15C+2], 0
		jmp	short loc_929B8
; ���������������������������������������������������������������������������

loc_929A7:				; CODE XREF: sub_8B630+738Dj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_15C+2]

loc_929B8:				; CODE XREF: sub_8B630+7375j
		cmp	word ptr [bp+var_15C+2], 4
		jl	short loc_929A7
		lea	ax, [bp+var_CEA]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_929F4
		cmp	[bp+var_158], 0
		jz	short loc_929F4
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_929F4:				; CODE XREF: sub_8B630+73A1j
					; sub_8B630+73A9j
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_154+2],	0
		jmp	loc_92C07
; ���������������������������������������������������������������������������

loc_92A0E:				; CODE XREF: sub_8B630+71FAj
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C5h ; '�'
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 49h	; 'I'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_92BE7
; ���������������������������������������������������������������������������

loc_92A4E:				; CODE XREF: sub_8B630+75D4j
		mov	ax, word ptr [bp+var_D45]
		mov	[bp+var_150], ax
		mov	ax, word ptr [bp+var_148]
		cmp	ax, word ptr [bp+var_14C+2]
		jnz	short loc_92AB2
		test	[bp+var_150], 1
		jz	short loc_92A92
		mov	ax, word ptr [bp+var_148+2]
		mov	word ptr [bp+var_154+2], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_154+2]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_14C+2], ax

loc_92A92:				; CODE XREF: sub_8B630+7436j
		mov	ax, word ptr [bp+var_14C+2]
		cmp	ax, word ptr [bp+var_148]
		jge	short loc_92AA1
		mov	di, 0FFFFh
		jmp	short loc_92AB2
; ���������������������������������������������������������������������������

loc_92AA1:				; CODE XREF: sub_8B630+746Aj
		mov	ax, word ptr [bp+var_14C+2]
		cmp	ax, word ptr [bp+var_148]
		jnz	short loc_92AAF
		xor	di, di
		jmp	short loc_92AB2
; ���������������������������������������������������������������������������

loc_92AAF:				; CODE XREF: sub_8B630+7479j
		mov	di, 1

loc_92AB2:				; CODE XREF: sub_8B630+742Ej
					; sub_8B630+746Fj ...
		push	di
		push	0
		push	word ptr [bp+var_144+2]
		mov	bx, word ptr [bp+var_144+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		add	word ptr [bp+var_148], di
		mov	ax, si
		add	ax, 4
		cmp	ax, [bp+var_150]
		jnz	short loc_92B02
		mov	ax, [bp+var_E]
		mov	dx, 14h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_92B02:				; CODE XREF: sub_8B630+74B5j
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_150]
		jge	short loc_92B3F
		mov	ax, si
		add	ax, 1Ah
		cmp	ax, [bp+var_150]
		jle	short loc_92B3F
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_154], ax
		mov	bx, word ptr [bp+var_144]
		mov	ax, word ptr [bp+var_154]
		mov	[bx+1Bh], ax

loc_92B3F:				; CODE XREF: sub_8B630+74DBj
					; sub_8B630+74E6j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, [bp+var_150]
		jnz	short loc_92B8B
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_92B8B:				; CODE XREF: sub_8B630+7517j
		jmp	short loc_92BDA
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_92BDA
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_92C07
; ���������������������������������������������������������������������������

loc_92BDA:				; CODE XREF: sub_8B630:loc_92B8Bj
					; sub_8B630+7564j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_92BE7:				; CODE XREF: sub_8B630+741Bj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_92BF7
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_92BFC

loc_92BF7:				; CODE XREF: sub_8B630+75BEj
		mov	ax, 1
		jmp	short loc_92BFE
; ���������������������������������������������������������������������������

loc_92BFC:				; CODE XREF: sub_8B630+75C5j
		xor	ax, ax

loc_92BFE:				; CODE XREF: sub_8B630+75CAj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_92C07
		jmp	loc_92A4E
; ���������������������������������������������������������������������������

loc_92C07:				; CODE XREF: sub_8B630+73DBj
					; sub_8B630+75A8j ...
		cmp	[bp+var_11], 0
		jz	short loc_92C1A
		lea	ax, [bp+var_D32]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_92C1A:				; CODE XREF: sub_8B630+75DBj
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_92C33
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_92C33:				; CODE XREF: sub_8B630+75FEj
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFD1h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		push	0FFFFh
		push	0
		lea	ax, [bp+var_70]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	di, ax
		push	0FFFFh
		push	0
		lea	ax, [bp+var_84]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_144+2], ax
		push	1
		push	0FFFFh
		push	0
		lea	ax, [bp+var_66]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_144], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_B8]
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_144+2]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_144]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [bp+var_148+2], 0
		mov	word ptr [bp+var_148], 3
		mov	word ptr [bp+var_14C+2], 2
		mov	word ptr [bp+var_14C], 2
		mov	[bp+var_14E], 0
		cmp	[bp+var_11], 0
		jnz	short loc_92D62
		jmp	loc_92DE4
; ���������������������������������������������������������������������������

loc_92D62:				; CODE XREF: sub_8B630+772Dj
		push	3
		lea	ax, [bp+var_13A]
		push	ax
		push	5
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EAC
		add	ax, 0FFCEh
		mov	[bp+var_150], ax
		mov	word ptr [bp+var_154+2], 0
		cmp	[bp+var_D40], 0
		jz	short loc_92DE4
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_154+2]
		push	[bp+var_150]
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_92DE4:				; CODE XREF: sub_8B630+772Fj
					; sub_8B630+7782j
		cmp	[bp+var_10], 0
		jnz	short loc_92DED
		jmp	loc_9301D
; ���������������������������������������������������������������������������

loc_92DED:				; CODE XREF: sub_8B630+77B8j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_15C], 0
		mov	byte ptr [bp+var_158], 2
		mov	byte ptr [bp+var_158+1], 0
		mov	[bp+var_158+2],	0
		push	2
		lea	ax, [bp+var_15C]
		push	ax
		push	0Eh
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_15C]
		push	ax
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	word ptr [bp+var_160+2], 0
		jmp	short loc_92E57
; ���������������������������������������������������������������������������

loc_92E46:				; CODE XREF: sub_8B630+782Cj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160+2]

loc_92E57:				; CODE XREF: sub_8B630+7814j
		cmp	word ptr [bp+var_160+2], 4
		jl	short loc_92E46
		push	0FFFFh
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_83FE
		add	sp, 4
		mov	word ptr [bp+var_160+2], 0
		jmp	loc_92F91
; ���������������������������������������������������������������������������

loc_92E76:				; CODE XREF: sub_8B630+7972j
		mov	ax, word ptr [bp+var_14C+2]
		cmp	ax, word ptr [bp+var_14C]
		jnz	short loc_92EE1
		mov	ax, word ptr [bp+var_160+2]
		inc	word ptr [bp+var_160+2]
		test	ax, 1
		jz	short loc_92EB7
		mov	ax, word ptr [bp+var_148]
		mov	word ptr [bp+var_160], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_160]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_14C], ax

loc_92EB7:				; CODE XREF: sub_8B630+785Bj
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jge	short loc_92EC9
		mov	word ptr [bp+var_148+2], 0FFFFh
		jmp	short loc_92EE1
; ���������������������������������������������������������������������������

loc_92EC9:				; CODE XREF: sub_8B630+788Fj
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jnz	short loc_92EDB
		mov	word ptr [bp+var_148+2], 0
		jmp	short loc_92EE1
; ���������������������������������������������������������������������������

loc_92EDB:				; CODE XREF: sub_8B630+78A1j
		mov	word ptr [bp+var_148+2], 1

loc_92EE1:				; CODE XREF: sub_8B630+784Ej
					; sub_8B630+7897j ...
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144+2]
		mov	bx, word ptr [bp+var_144+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+var_14E]
		inc	[bp+var_14E]
		cmp	ax, 1
		jnz	short loc_92F27
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_92F27:				; CODE XREF: sub_8B630+78E8j
		cmp	[bp+var_14E], 5
		jnz	short loc_92F3B
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_92F3B:				; CODE XREF: sub_8B630+78FCj
		cmp	[bp+var_14E], 8
		jnz	short loc_92F48
		mov	[bp+var_14E], 0

loc_92F48:				; CODE XREF: sub_8B630+7910j
		mov	ax, word ptr [bp+var_148+2]
		add	word ptr [bp+var_14C+2], ax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_164+2], ax
		mov	bx, word ptr [bp+var_144]
		mov	ax, word ptr [bp+var_164+2]
		mov	[bx+1Bh], ax
		jmp	short loc_92F84
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_92F84
		jmp	short loc_92FA5
; ���������������������������������������������������������������������������

loc_92F84:				; CODE XREF: sub_8B630+7947j
					; sub_8B630+7950j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_92F91:				; CODE XREF: sub_8B630+7843j
		lea	ax, [bp+var_CEA]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jz	short loc_92FA5
		jmp	loc_92E76
; ���������������������������������������������������������������������������

loc_92FA5:				; CODE XREF: sub_8B630+7952j
					; sub_8B630+7970j
		mov	bx, word ptr [bp+var_144]
		mov	word ptr [bx+1Bh], 0
		mov	word ptr [bp+var_160+2], 0
		jmp	short loc_92FC7
; ���������������������������������������������������������������������������

loc_92FB6:				; CODE XREF: sub_8B630+799Cj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_160+2]

loc_92FC7:				; CODE XREF: sub_8B630+7984j
		cmp	word ptr [bp+var_160+2], 4
		jl	short loc_92FB6
		lea	ax, [bp+var_CEA]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_158+1], 0
		jz	short loc_93003
		cmp	[bp+var_15C], 0
		jz	short loc_93003
		push	0
		mov	al, byte ptr [bp+var_158]
		push	ax
		lea	ax, [bp+var_15C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_93003:				; CODE XREF: sub_8B630+79B0j
					; sub_8B630+79B8j
		mov	[bp+var_15C], 0
		mov	byte ptr [bp+var_158+1], 0
		mov	[bp+var_158+2],	0
		jmp	loc_9348E
; ���������������������������������������������������������������������������

loc_9301D:				; CODE XREF: sub_8B630+77BAj
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C4h ; '�'
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 20h	; ' '
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_93245
; ���������������������������������������������������������������������������

loc_9305D:				; CODE XREF: sub_8B630+7C32j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_154], ax
		mov	ax, word ptr [bp+var_14C+2]
		cmp	ax, word ptr [bp+var_14C]
		jnz	short loc_930CB
		test	word ptr [bp+var_154], 1
		jz	short loc_930A1
		mov	ax, word ptr [bp+var_148]
		mov	word ptr [bp+var_158+2], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_158+2]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_14C], ax

loc_930A1:				; CODE XREF: sub_8B630+7A45j
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jge	short loc_930B3
		mov	word ptr [bp+var_148+2], 0FFFFh
		jmp	short loc_930CB
; ���������������������������������������������������������������������������

loc_930B3:				; CODE XREF: sub_8B630+7A79j
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jnz	short loc_930C5
		mov	word ptr [bp+var_148+2], 0
		jmp	short loc_930CB
; ���������������������������������������������������������������������������

loc_930C5:				; CODE XREF: sub_8B630+7A8Bj
		mov	word ptr [bp+var_148+2], 1

loc_930CB:				; CODE XREF: sub_8B630+7A3Dj
					; sub_8B630+7A81j ...
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144+2]
		mov	bx, word ptr [bp+var_144+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+var_14E]
		inc	[bp+var_14E]
		cmp	ax, 1
		jnz	short loc_93111
		push	0
		push	0FFFFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_93111:				; CODE XREF: sub_8B630+7AD2j
		cmp	[bp+var_14E], 5
		jnz	short loc_93125
		push	1
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_93125:				; CODE XREF: sub_8B630+7AE6j
		cmp	[bp+var_14E], 8
		jnz	short loc_93132
		mov	[bp+var_14E], 0

loc_93132:				; CODE XREF: sub_8B630+7AFAj
		mov	ax, word ptr [bp+var_148+2]
		add	word ptr [bp+var_14C+2], ax
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_154]
		jnz	short loc_93160
		mov	ax, [bp+var_E]
		mov	dx, 15h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_93160:				; CODE XREF: sub_8B630+7B13j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_154]
		jge	short loc_9319D
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_154]
		jle	short loc_9319D
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_158], ax
		mov	bx, word ptr [bp+var_144]
		mov	ax, word ptr [bp+var_158]
		mov	[bx+1Bh], ax

loc_9319D:				; CODE XREF: sub_8B630+7B39j
					; sub_8B630+7B44j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_154]
		jnz	short loc_931E9
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_931E9:				; CODE XREF: sub_8B630+7B75j
		jmp	short loc_93238
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_93238
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_93265
; ���������������������������������������������������������������������������

loc_93238:				; CODE XREF: sub_8B630:loc_931E9j
					; sub_8B630+7BC2j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_93245:				; CODE XREF: sub_8B630+7A2Aj
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_93255
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_9325A

loc_93255:				; CODE XREF: sub_8B630+7C1Cj
		mov	ax, 1
		jmp	short loc_9325C
; ���������������������������������������������������������������������������

loc_9325A:				; CODE XREF: sub_8B630+7C23j
		xor	ax, ax

loc_9325C:				; CODE XREF: sub_8B630+7C28j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_93265
		jmp	loc_9305D
; ���������������������������������������������������������������������������

loc_93265:				; CODE XREF: sub_8B630+7C06j
					; sub_8B630+7C30j
		mov	[bp+var_A], 2Fh	; '/'
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_9346E
; ���������������������������������������������������������������������������

loc_93286:				; CODE XREF: sub_8B630+7E5Bj
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_154], ax
		mov	ax, word ptr [bp+var_14C+2]
		cmp	ax, word ptr [bp+var_14C]
		jnz	short loc_932F4
		test	word ptr [bp+var_154], 1
		jz	short loc_932CA
		mov	ax, word ptr [bp+var_148]
		mov	word ptr [bp+var_158+2], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp+var_158+2]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_14C], ax

loc_932CA:				; CODE XREF: sub_8B630+7C6Ej
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jge	short loc_932DC
		mov	word ptr [bp+var_148+2], 0FFFFh
		jmp	short loc_932F4
; ���������������������������������������������������������������������������

loc_932DC:				; CODE XREF: sub_8B630+7CA2j
		mov	ax, word ptr [bp+var_14C]
		cmp	ax, word ptr [bp+var_14C+2]
		jnz	short loc_932EE
		mov	word ptr [bp+var_148+2], 0
		jmp	short loc_932F4
; ���������������������������������������������������������������������������

loc_932EE:				; CODE XREF: sub_8B630+7CB4j
		mov	word ptr [bp+var_148+2], 1

loc_932F4:				; CODE XREF: sub_8B630+7C66j
					; sub_8B630+7CAAj ...
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144+2]
		mov	bx, word ptr [bp+var_144+2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	word ptr [bp+var_148+2]
		push	0
		push	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_144]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+var_14E]
		inc	[bp+var_14E]
		cmp	ax, 1
		jnz	short loc_9333A
		push	0
		push	1
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_9333A:				; CODE XREF: sub_8B630+7CFBj
		cmp	[bp+var_14E], 5
		jnz	short loc_9334E
		push	0FFFFh
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_9334E:				; CODE XREF: sub_8B630+7D0Fj
		cmp	[bp+var_14E], 8
		jnz	short loc_9335B
		mov	[bp+var_14E], 0

loc_9335B:				; CODE XREF: sub_8B630+7D23j
		mov	ax, word ptr [bp+var_148+2]
		add	word ptr [bp+var_14C+2], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_154]
		jnz	short loc_93389
		mov	ax, [bp+var_E]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_93389:				; CODE XREF: sub_8B630+7D3Cj
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_154]
		jge	short loc_933C6
		mov	ax, si
		add	ax, 1Ah
		cmp	ax, word ptr [bp+var_154]
		jle	short loc_933C6
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_158], ax
		mov	bx, word ptr [bp+var_144]
		mov	ax, word ptr [bp+var_158]
		mov	[bx+1Bh], ax

loc_933C6:				; CODE XREF: sub_8B630+7D62j
					; sub_8B630+7D6Dj
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_154]
		jnz	short loc_93412
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_93412:				; CODE XREF: sub_8B630+7D9Ej
		jmp	short loc_93461
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_93461
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9348E
; ���������������������������������������������������������������������������

loc_93461:				; CODE XREF: sub_8B630:loc_93412j
					; sub_8B630+7DEBj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9346E:				; CODE XREF: sub_8B630+7C53j
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_9347E
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_93483

loc_9347E:				; CODE XREF: sub_8B630+7E45j
		mov	ax, 1
		jmp	short loc_93485
; ���������������������������������������������������������������������������

loc_93483:				; CODE XREF: sub_8B630+7E4Cj
		xor	ax, ax

loc_93485:				; CODE XREF: sub_8B630+7E51j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9348E
		jmp	loc_93286
; ���������������������������������������������������������������������������

loc_9348E:				; CODE XREF: sub_8B630+79EAj
					; sub_8B630+7E2Fj ...
		cmp	[bp+var_11], 0
		jz	short loc_934A1
		lea	ax, [bp+var_D40]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_934A1:				; CODE XREF: sub_8B630+7E62j
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_934BA
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_934BA:				; CODE XREF: sub_8B630+7E85j
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFBDh
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_140], ax
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	3
		lea	ax, [bp+var_14C+2]
		push	ax
		push	24E9h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp+var_98]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14C], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	[bp+var_14E], ax
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_14C+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_150], ax
		mov	[bp+var_15C+2],	0
		mov	byte ptr [bp+var_158+2], 2
		mov	byte ptr [bp+var_158+3], 0
		mov	[bp+var_154], 0
		push	3
		lea	ax, [bp+var_15C+2]
		push	ax
		push	0
		lea	ax, [bp+var_2D6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_15C+2]
		push	ax
		push	0
		call	ToggleLayer_Construct_B57B
		add	sp, 0Ah
		mov	word ptr [bp+var_15C], ax
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_F8]
		mov	al, [bp+var_F6]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_108]
		mov	al, [bp+var_106]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_140]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_14C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_14E]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0Eh
		push	[bp+var_14E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		xor	di, di
		cmp	[bp+var_11], 0
		jnz	short loc_9367B
		jmp	loc_936FA
; ���������������������������������������������������������������������������

loc_9367B:				; CODE XREF: sub_8B630+8046j
		push	3
		lea	ax, [bp+var_13A]
		push	ax
		push	5
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_D40]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EAC
		mov	word ptr [bp+var_160+2], ax
		mov	word ptr [bp+var_160], 0
		cmp	[bp+var_D40], 0
		jz	short loc_936FA
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_160]
		push	word ptr [bp+var_160+2]
		push	[bp+var_D3E]
		mov	bx, [bp+var_D40]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_936FA:				; CODE XREF: sub_8B630+8048j
					; sub_8B630+8098j
		cmp	[bp+var_10], 0
		jnz	short loc_93703
		jmp	loc_938F6
; ���������������������������������������������������������������������������

loc_93703:				; CODE XREF: sub_8B630+80CEj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166], 2
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		push	2
		lea	ax, [bp+var_16A]
		push	ax
		push	0Fh
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_16A]
		push	ax
		push	[bp+var_14E]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp-16Ch], 0
		jmp	short loc_9376E
; ���������������������������������������������������������������������������

loc_9375D:				; CODE XREF: sub_8B630+8143j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-16Ch]

loc_9376E:				; CODE XREF: sub_8B630+812Bj
		cmp	word ptr [bp-16Ch], 3
		jl	short loc_9375D
		jmp	loc_93801
; ���������������������������������������������������������������������������

loc_93778:				; CODE XREF: sub_8B630+81E1j
		or	di, di
		jnz	short loc_9379D
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_9379D
		mov	di, 0FFFFh
		jmp	short loc_937AE
; ���������������������������������������������������������������������������

loc_9379D:				; CODE XREF: sub_8B630+814Aj
					; sub_8B630+8166j
		cmp	di, 0FFFFh
		jnz	short loc_937A7
		mov	di, 1
		jmp	short loc_937AE
; ���������������������������������������������������������������������������

loc_937A7:				; CODE XREF: sub_8B630+8170j
		cmp	di, 1
		jnz	short loc_937AE
		xor	di, di

loc_937AE:				; CODE XREF: sub_8B630+816Bj
					; sub_8B630+8175j ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_937F4
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_937F4
		jmp	short loc_93814
; ���������������������������������������������������������������������������

loc_937F4:				; CODE XREF: sub_8B630+81B7j
					; sub_8B630+81C0j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_93801:				; CODE XREF: sub_8B630+8145j
		push	[bp+var_14E]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_93814
		jmp	loc_93778
; ���������������������������������������������������������������������������

loc_93814:				; CODE XREF: sub_8B630+81C2j
					; sub_8B630+81DFj
		mov	word ptr [bp-16Ch], 0
		jmp	loc_938AA
; ���������������������������������������������������������������������������

loc_9381D:				; CODE XREF: sub_8B630+8281j
		or	di, di
		jnz	short loc_93842
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_93842
		mov	di, 0FFFFh
		jmp	short loc_93853
; ���������������������������������������������������������������������������

loc_93842:				; CODE XREF: sub_8B630+81EFj
					; sub_8B630+820Bj
		cmp	di, 0FFFFh
		jnz	short loc_9384C
		mov	di, 1
		jmp	short loc_93853
; ���������������������������������������������������������������������������

loc_9384C:				; CODE XREF: sub_8B630+8215j
		cmp	di, 1
		jnz	short loc_93853
		xor	di, di

loc_93853:				; CODE XREF: sub_8B630+8210j
					; sub_8B630+821Aj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		jmp	short loc_93899
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_93899
		jmp	short loc_938B4
; ���������������������������������������������������������������������������

loc_93899:				; CODE XREF: sub_8B630+825Cj
					; sub_8B630+8265j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-16Ch]

loc_938AA:				; CODE XREF: sub_8B630+81EAj
		cmp	word ptr [bp-16Ch], 4
		jge	short loc_938B4
		jmp	loc_9381D
; ���������������������������������������������������������������������������

loc_938B4:				; CODE XREF: sub_8B630+8267j
					; sub_8B630+827Fj
		cmp	byte ptr [bp+var_166+1], 0
		jz	short loc_938DC
		cmp	[bp+var_16A], 0
		jz	short loc_938DC
		push	0
		mov	al, byte ptr [bp+var_166]
		push	ax
		lea	ax, [bp+var_16A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_938DC:				; CODE XREF: sub_8B630+8289j
					; sub_8B630+8291j
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		jmp	loc_93C08
; ���������������������������������������������������������������������������

loc_938F6:				; CODE XREF: sub_8B630+80D0j
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_A], 2Ch	; ','
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_93A94
; ���������������������������������������������������������������������������

loc_93935:				; CODE XREF: sub_8B630+8481j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_164+2], ax
		or	di, di
		jnz	short loc_93962
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_93962
		mov	di, 0FFFFh
		jmp	short loc_93973
; ���������������������������������������������������������������������������

loc_93962:				; CODE XREF: sub_8B630+830Fj
					; sub_8B630+832Bj
		cmp	di, 0FFFFh
		jnz	short loc_9396C
		mov	di, 1
		jmp	short loc_93973
; ���������������������������������������������������������������������������

loc_9396C:				; CODE XREF: sub_8B630+8335j
		cmp	di, 1
		jnz	short loc_93973
		xor	di, di

loc_93973:				; CODE XREF: sub_8B630+8330j
					; sub_8B630+833Aj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_164+2]
		jnz	short loc_939D2
		mov	ax, [bp+var_E]
		mov	dx, 17h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_939D2:				; CODE XREF: sub_8B630+8385j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_164+2]
		jnz	short loc_939EC
		push	24EDh
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_939EC:				; CODE XREF: sub_8B630+83ABj
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, word ptr [bp+var_164+2]
		jnz	short loc_93A38
		mov	[bp+var_D6E], 11BCh
		mov	[bp+var_D6E], 11C8h
		mov	[bp+var_D6E], 11D8h
		mov	[bp+var_D6E], 11E8h
		mov	[bp+var_D6E], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D6E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_93A38:				; CODE XREF: sub_8B630+83C4j
		jmp	short loc_93A87
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_93A87
		mov	word ptr [bp-0D7Ah], 11BCh
		mov	word ptr [bp-0D7Ah], 11C8h
		mov	word ptr [bp-0D7Ah], 11D8h
		mov	word ptr [bp-0D7Ah], 11E8h
		mov	word ptr [bp-0D7Ah], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D7Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_93AB4
; ���������������������������������������������������������������������������

loc_93A87:				; CODE XREF: sub_8B630:loc_93A38j
					; sub_8B630+8411j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_93A94:				; CODE XREF: sub_8B630+8302j
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_93AA4
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_93AA9

loc_93AA4:				; CODE XREF: sub_8B630+846Bj
		mov	ax, 1
		jmp	short loc_93AAB
; ���������������������������������������������������������������������������

loc_93AA9:				; CODE XREF: sub_8B630+8472j
		xor	ax, ax

loc_93AAB:				; CODE XREF: sub_8B630+8477j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_93AB4
		jmp	loc_93935
; ���������������������������������������������������������������������������

loc_93AB4:				; CODE XREF: sub_8B630+8455j
					; sub_8B630+847Fj
		mov	[bp+var_A], 18h
		mov	si, word ptr [bp+var_D45]
		mov	ax, [bp+var_A]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_8], dx
		jmp	loc_93BE8
; ���������������������������������������������������������������������������

loc_93AD5:				; CODE XREF: sub_8B630+85D5j
		mov	ax, word ptr [bp+var_D45]
		mov	word ptr [bp+var_164+2], ax
		or	di, di
		jnz	short loc_93B02
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_93B02
		mov	di, 0FFFFh
		jmp	short loc_93B13
; ���������������������������������������������������������������������������

loc_93B02:				; CODE XREF: sub_8B630+84AFj
					; sub_8B630+84CBj
		cmp	di, 0FFFFh
		jnz	short loc_93B0C
		mov	di, 1
		jmp	short loc_93B13
; ���������������������������������������������������������������������������

loc_93B0C:				; CODE XREF: sub_8B630+84D5j
		cmp	di, 1
		jnz	short loc_93B13
		xor	di, di

loc_93B13:				; CODE XREF: sub_8B630+84D0j
					; sub_8B630+84DAj ...
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_164+2]
		jnz	short loc_93B72
		mov	ax, [bp+var_E]
		mov	dx, 18h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_93B72:				; CODE XREF: sub_8B630+8525j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_164+2]
		jnz	short loc_93B8C
		push	24F9h
		push	[bp+var_14E]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_93B8C:				; CODE XREF: sub_8B630+854Bj
		jmp	short loc_93BDB
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_93BDB
		mov	word ptr [bp-0D6Eh], 11BCh
		mov	word ptr [bp-0D6Eh], 11C8h
		mov	word ptr [bp-0D6Eh], 11D8h
		mov	word ptr [bp-0D6Eh], 11E8h
		mov	word ptr [bp-0D6Eh], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D6Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_93C08
; ���������������������������������������������������������������������������

loc_93BDB:				; CODE XREF: sub_8B630:loc_93B8Cj
					; sub_8B630+8565j
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_93BE8:				; CODE XREF: sub_8B630+84A2j
		mov	ax, word ptr [bp+var_D45]
		cmp	ax, [bp+var_8]
		jnb	short loc_93BF8
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_93BFD

loc_93BF8:				; CODE XREF: sub_8B630+85BFj
		mov	ax, 1
		jmp	short loc_93BFF
; ���������������������������������������������������������������������������

loc_93BFD:				; CODE XREF: sub_8B630+85C6j
		xor	ax, ax

loc_93BFF:				; CODE XREF: sub_8B630+85CBj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_93C08
		jmp	loc_93AD5
; ���������������������������������������������������������������������������

loc_93C08:				; CODE XREF: sub_8B630+82C3j
					; sub_8B630+85A9j ...
		mov	di, 0FFFFh
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_15C]
		mov	bx, word ptr [bp+var_15C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	word ptr [bp+var_D45], 0
		push	word ptr [bp+var_15C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_150]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	[bp+var_150], 0
		jz	short loc_93C86
		push	3
		push	[bp+var_150]
		mov	bx, [bp+var_150]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_93C86:				; CODE XREF: sub_8B630+8641j
		jmp	short loc_93CD8
; ���������������������������������������������������������������������������

loc_93C88:				; CODE XREF: sub_8B630+86C1j
		cmp	word ptr [bp+var_D45], 1
		jnz	short loc_93CCB
		mov	di, 1
		push	di
		push	0
		push	word ptr [bp+var_14C]
		mov	bx, word ptr [bp+var_14C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	[bp+var_14E]
		mov	bx, [bp+var_14E]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	di
		push	0
		push	word ptr [bp+var_15C]
		mov	bx, word ptr [bp+var_15C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6

loc_93CCB:				; CODE XREF: sub_8B630+865Dj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_93CD8:				; CODE XREF: sub_8B630:loc_93C86j
		cmp	word ptr [bp+var_D45], 0Fh
		jnb	short loc_93CE6
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_93CEB

loc_93CE6:				; CODE XREF: sub_8B630+86ADj
		mov	ax, 1
		jmp	short loc_93CED
; ���������������������������������������������������������������������������

loc_93CEB:				; CODE XREF: sub_8B630+86B4j
		xor	ax, ax

loc_93CED:				; CODE XREF: sub_8B630+86B9j
		mov	ah, 0
		or	ax, ax
		jz	short loc_93C88
		cmp	[bp+var_11], 0
		jz	short loc_93D06
		lea	ax, [bp+var_D40]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_93D06:				; CODE XREF: sub_8B630+86C7j
		cmp	byte ptr [bp+var_158+3], 0
		jz	short loc_93D2E
		cmp	[bp+var_15C+2],	0
		jz	short loc_93D2E
		push	0
		mov	al, byte ptr [bp+var_158+2]
		push	ax
		lea	ax, [bp+var_15C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_93D2E:				; CODE XREF: sub_8B630+86DBj
					; sub_8B630+86E3j
		mov	[bp+var_15C+2],	0
		mov	byte ptr [bp+var_158+3], 0
		mov	[bp+var_154], 0
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_93D6D
		cmp	[bp+var_14C+2],	0
		jz	short loc_93D6D
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_93D6D:				; CODE XREF: sub_8B630+871Aj
					; sub_8B630+8722j
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_93D9D
		jmp	loc_942E3
; ���������������������������������������������������������������������������

loc_93D9D:				; CODE XREF: sub_8B630+8768j
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144], 2
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		push	3
		lea	ax, [bp+var_148]
		push	ax
		push	2
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_154+2],	0
		mov	byte ptr [bp+var_14E], 2
		mov	byte ptr [bp+var_14E+1], 0
		mov	[bp+var_14C], 0
		push	2
		lea	ax, [bp+var_154+2]
		push	ax
		push	0Ch
		lea	ax, [bp+var_25E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_158+3], 0
		lea	ax, [bp+var_154+2]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1D8]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFE8h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_15C+2], ax
		push	0FFE8h
		push	0
		lea	ax, [bp+var_148]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_15C], ax
		push	word ptr [bp+var_158]
		mov	al, byte ptr [bp+var_158+2]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_A8]
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_15C+2]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_15C]
		lea	ax, [bp+var_D62]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	di, 2
		mov	word ptr [bp+var_160+2], 1
		mov	[bp+var_16A+2],	0
		mov	byte ptr [bp+var_164], 2
		mov	byte ptr [bp+var_164+1], 0
		mov	[bp+var_164+2],	0
		mov	[bp+var_D6C], 0
		mov	[bp+var_D68], 2
		mov	[bp+var_D67], 0
		mov	[bp+var_D66], 0
		mov	word ptr [bp+var_D72+2], 0
		mov	[bp+var_D6E], 0FFFFh
		cmp	[bp+var_11], 0
		jnz	short loc_93F2C
		jmp	loc_93FAB
; ���������������������������������������������������������������������������

loc_93F2C:				; CODE XREF: sub_8B630+88F7j
		push	3
		lea	ax, [bp+var_16A+2]
		push	ax
		push	26h ; '&'
		lea	ax, [bp+var_4B6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D72+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_16A+2]
		push	ax
		lea	ax, [bp+var_D72+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EEE
		mov	word ptr [bp+var_16A], ax
		mov	word ptr [bp-16Ch], 0
		cmp	word ptr [bp+var_D72+2], 0
		jz	short loc_93FAB
		push	[bp+var_D6E]
		mov	bx, word ptr [bp+var_D72+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-16Ch]
		push	word ptr [bp+var_16A]
		push	[bp+var_D6E]
		mov	bx, word ptr [bp+var_D72+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_93FAB:				; CODE XREF: sub_8B630+88F9j
					; sub_8B630+8949j
		mov	[bp+var_176], 0
		mov	[bp+var_172], 2
		mov	[bp+var_171], 0
		mov	[bp+var_170], 0
		cmp	[bp+var_10], 0
		jz	short loc_94013
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		push	2
		lea	ax, [bp+var_176]
		push	ax
		push	10h
		lea	ax, [bp+var_43E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_176]
		push	ax
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_94032
; ���������������������������������������������������������������������������

loc_94013:				; CODE XREF: sub_8B630+899Bj
		push	0
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0F8h ; '�'
		lea	ax, [bp+var_D24]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4

loc_94032:				; CODE XREF: sub_8B630+89E1j
		jmp	loc_94152
; ���������������������������������������������������������������������������

loc_94035:				; CODE XREF: sub_8B630+8B3Dj
		mov	ax, word ptr [bp+var_D45]
		mov	[bp+var_178], ax
		mov	[bp+var_17A], di
		mov	bx, word ptr [bp+var_15C]
		mov	ax, [bp+var_17A]
		mov	[bx+1Bh], ax
		cmp	[bp+var_178], 12h
		jnz	short loc_94077
		mov	al, [bp+var_10]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_94077
		mov	ax, [bp+var_E]
		mov	dx, 19h
		imul	dx
		mov	dx, [bp+var_C]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D24]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_94077:				; CODE XREF: sub_8B630+8A21j
					; sub_8B630+8A2Aj
		cmp	[bp+var_178], 2Ah ; '*'
		jnz	short loc_940C9
		mov	al, [bp+var_10]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_940C9
		mov	[bp+var_D7C], 11BCh
		mov	[bp+var_D7C], 11C8h
		mov	[bp+var_D7C], 11D8h
		mov	[bp+var_D7C], 11E8h
		mov	[bp+var_D7C], 11FCh
		lea	ax, [bp+var_D22]
		push	ax
		push	0
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		push	[bp+var_D0B]
		lea	ax, [bp+var_D7C]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_940C9:				; CODE XREF: sub_8B630+8A4Cj
					; sub_8B630+8A55j
		cmp	di, 1Ah
		jg	short loc_940D4
		add	di, word ptr [bp+var_160+2]
		jmp	short loc_940F6
; ���������������������������������������������������������������������������

loc_940D4:				; CODE XREF: sub_8B630+8A9Cj
		cmp	di, 1Dh
		jnz	short loc_940DF
		mov	word ptr [bp+var_160+2], 0FFFFh

loc_940DF:				; CODE XREF: sub_8B630+8AA7j
		cmp	di, 1Bh
		jnz	short loc_940EA
		mov	word ptr [bp+var_160+2], 1

loc_940EA:				; CODE XREF: sub_8B630+8AB2j
		test	[bp+var_178], 1
		jz	short loc_940F6
		add	di, word ptr [bp+var_160+2]

loc_940F6:				; CODE XREF: sub_8B630+8AA2j
					; sub_8B630+8AC0j
		jmp	short loc_94145
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_94145
		mov	word ptr [bp-0D88h], 11BCh
		mov	word ptr [bp-0D88h], 11C8h
		mov	word ptr [bp-0D88h], 11D8h
		mov	word ptr [bp-0D88h], 11E8h
		mov	word ptr [bp-0D88h], 11FCh
		lea	ax, [bp-0D22h]
		push	ax
		push	0
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		push	word ptr [bp-0D0Bh]
		lea	ax, [bp-0D88h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_94170
; ���������������������������������������������������������������������������

loc_94145:				; CODE XREF: sub_8B630:loc_940F6j
					; sub_8B630+8ACFj
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_94152:				; CODE XREF: sub_8B630:loc_94032j
		cmp	word ptr [bp+var_D45], 2Dh ; '-'
		jnb	short loc_94160
		cmp	byte ptr [bp+var_D45+2], 0
		jz	short loc_94165

loc_94160:				; CODE XREF: sub_8B630+8B27j
		mov	ax, 1
		jmp	short loc_94167
; ���������������������������������������������������������������������������

loc_94165:				; CODE XREF: sub_8B630+8B2Ej
		xor	ax, ax

loc_94167:				; CODE XREF: sub_8B630+8B33j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_94170
		jmp	loc_94035
; ���������������������������������������������������������������������������

loc_94170:				; CODE XREF: sub_8B630+8B13j
					; sub_8B630+8B3Bj
		lea	ax, [bp+var_CEA]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_171], 0
		jz	short loc_941A5
		cmp	[bp+var_176], 0
		jz	short loc_941A5
		push	0
		mov	al, [bp+var_172]
		push	ax
		lea	ax, [bp+var_176]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_941A5:				; CODE XREF: sub_8B630+8B52j
					; sub_8B630+8B5Aj
		mov	[bp+var_176], 0
		mov	[bp+var_171], 0
		mov	[bp+var_170], 0
		lea	ax, [bp+var_D72+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_D67], 0
		jz	short loc_941F1
		cmp	[bp+var_D6C], 0
		jz	short loc_941F1
		push	0
		mov	al, [bp+var_D68]
		push	ax
		lea	ax, [bp+var_D6C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_941F1:				; CODE XREF: sub_8B630+8B9Ej
					; sub_8B630+8BA6j
		mov	[bp+var_D6C], 0
		mov	[bp+var_D67], 0
		mov	[bp+var_D66], 0
		cmp	byte ptr [bp+var_164+1], 0
		jz	short loc_94230
		cmp	[bp+var_16A+2],	0
		jz	short loc_94230
		push	0
		mov	al, byte ptr [bp+var_164]
		push	ax
		lea	ax, [bp+var_16A+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_94230:				; CODE XREF: sub_8B630+8BDDj
					; sub_8B630+8BE5j
		mov	[bp+var_16A+2],	0
		mov	byte ptr [bp+var_164+1], 0
		mov	[bp+var_164+2],	0
		push	0
		lea	ax, [bp+var_D62]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_158]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_14E+1], 0
		jz	short loc_9428D
		cmp	[bp+var_154+2],	0
		jz	short loc_9428D
		push	0
		mov	al, byte ptr [bp+var_14E]
		push	ax
		lea	ax, [bp+var_154+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9428D:				; CODE XREF: sub_8B630+8C3Aj
					; sub_8B630+8C42j
		mov	[bp+var_154+2],	0
		mov	byte ptr [bp+var_14E+1], 0
		mov	[bp+var_14C], 0
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_942CC
		cmp	[bp+var_148], 0
		jz	short loc_942CC
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_942CC:				; CODE XREF: sub_8B630+8C79j
					; sub_8B630+8C81j
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0

loc_942E3:				; CODE XREF: sub_8B630+F9Dj
					; sub_8B630+1477j ...
		lea	ax, [bp+var_D40]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_D37], 0
		jz	short loc_94318
		cmp	[bp+var_D3C], 0
		jz	short loc_94318
		push	0
		mov	al, [bp+var_D38]
		push	ax
		lea	ax, [bp+var_D3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_94318:				; CODE XREF: sub_8B630+8CC5j
					; sub_8B630+8CCDj
		mov	[bp+var_D3C], 0
		mov	[bp+var_D37], 0
		mov	[bp+var_D36], 0
		lea	ax, [bp+var_D32]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_D29], 0
		jz	short loc_94364
		cmp	[bp+var_D2E], 0
		jz	short loc_94364
		push	0
		mov	al, [bp+var_D2A]
		push	ax
		lea	ax, [bp+var_D2E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_94364:				; CODE XREF: sub_8B630+8D11j
					; sub_8B630+8D19j
		mov	[bp+var_D2E], 0
		mov	[bp+var_D29], 0
		mov	[bp+var_D28], 0
		cmp	[bp+var_135], 0
		jz	short loc_943A3
		cmp	[bp+var_13A], 0
		jz	short loc_943A3
		push	0
		mov	al, [bp+var_136]
		push	ax
		lea	ax, [bp+var_13A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_943A3:				; CODE XREF: sub_8B630+8D50j
					; sub_8B630+8D58j
		mov	[bp+var_13A], 0
		mov	[bp+var_135], 0
		mov	[bp+var_134], 0
		cmp	[bp+var_12B], 0
		jz	short loc_943E2
		cmp	[bp+var_130], 0
		jz	short loc_943E2
		push	0
		mov	al, [bp+var_12C]
		push	ax
		lea	ax, [bp+var_130]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_943E2:				; CODE XREF: sub_8B630+8D8Fj
					; sub_8B630+8D97j
		mov	[bp+var_130], 0
		mov	[bp+var_12B], 0
		mov	[bp+var_12A], 0
		lea	ax, [bp+var_D22]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_D02]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_10D], 0
		jz	short loc_9443D
		cmp	[bp+var_112], 0
		jz	short loc_9443D
		push	0
		mov	al, [bp+var_10E]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9443D:				; CODE XREF: sub_8B630+8DEAj
					; sub_8B630+8DF2j
		mov	[bp+var_112], 0
		mov	[bp+var_10D], 0
		mov	[bp+var_10C], 0
		push	2
		lea	ax, [bp+var_108]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_FD], 0
		jz	short loc_9448B
		cmp	[bp+var_102], 0
		jz	short loc_9448B
		push	0
		mov	al, [bp+var_FE]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9448B:				; CODE XREF: sub_8B630+8E38j
					; sub_8B630+8E40j
		mov	[bp+var_102], 0
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		push	2
		lea	ax, [bp+var_F8]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_ED], 0
		jz	short loc_944D9
		cmp	[bp+var_F2], 0
		jz	short loc_944D9
		push	0
		mov	al, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_944D9:				; CODE XREF: sub_8B630+8E86j
					; sub_8B630+8E8Ej
		mov	[bp+var_F2], 0
		mov	[bp+var_ED], 0
		mov	[bp+var_EC], 0
		push	2
		lea	ax, [bp+var_E8]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_DD], 0
		jz	short loc_94527
		cmp	[bp+var_E2], 0
		jz	short loc_94527
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_94527:				; CODE XREF: sub_8B630+8ED4j
					; sub_8B630+8EDCj
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		push	2
		lea	ax, [bp+var_D8]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_CD], 0
		jz	short loc_94575
		cmp	[bp+var_D2], 0
		jz	short loc_94575
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_94575:				; CODE XREF: sub_8B630+8F22j
					; sub_8B630+8F2Aj
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		push	2
		lea	ax, [bp+var_C8]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_BD], 0
		jz	short loc_945C3
		cmp	[bp+var_C2], 0
		jz	short loc_945C3
		push	0
		mov	al, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_C2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_945C3:				; CODE XREF: sub_8B630+8F70j
					; sub_8B630+8F78j
		mov	[bp+var_C2], 0
		mov	[bp+var_BD], 0
		mov	[bp+var_BC], 0
		push	2
		lea	ax, [bp+var_B8]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_AD], 0
		jz	short loc_94611
		cmp	[bp+var_B2], 0
		jz	short loc_94611
		push	0
		mov	al, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_94611:				; CODE XREF: sub_8B630+8FBEj
					; sub_8B630+8FC6j
		mov	[bp+var_B2], 0
		mov	[bp+var_AD], 0
		mov	[bp+var_AC], 0
		push	2
		lea	ax, [bp+var_A8]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9D], 0
		jz	short loc_9465F
		cmp	[bp+var_A2], 0
		jz	short loc_9465F
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9465F:				; CODE XREF: sub_8B630+900Cj
					; sub_8B630+9014j
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		cmp	[bp+var_93], 0
		jz	short loc_9469E
		cmp	[bp+var_98], 0
		jz	short loc_9469E
		push	0
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9469E:				; CODE XREF: sub_8B630+904Bj
					; sub_8B630+9053j
		mov	[bp+var_98], 0
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		cmp	[bp+var_89], 0
		jz	short loc_946DD
		cmp	[bp+var_8E], 0
		jz	short loc_946DD
		push	0
		mov	al, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_8E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_946DD:				; CODE XREF: sub_8B630+908Aj
					; sub_8B630+9092j
		mov	[bp+var_8E], 0
		mov	[bp+var_89], 0
		mov	[bp+var_88], 0
		cmp	[bp+var_7F], 0
		jz	short loc_9471A
		cmp	[bp+var_84], 0
		jz	short loc_9471A
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9471A:				; CODE XREF: sub_8B630+90C8j
					; sub_8B630+90D0j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_94753
		cmp	[bp+var_7A], 0
		jz	short loc_94753
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_94753:				; CODE XREF: sub_8B630+9103j
					; sub_8B630+910Aj
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		cmp	[bp+var_6B], 0
		jz	short loc_9478B
		cmp	[bp+var_70], 0
		jz	short loc_9478B
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9478B:				; CODE XREF: sub_8B630+913Bj
					; sub_8B630+9142j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_947C3
		cmp	[bp+var_66], 0
		jz	short loc_947C3
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_947C3:				; CODE XREF: sub_8B630+9173j
					; sub_8B630+917Aj
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		cmp	[bp+var_57], 0
		jz	short loc_947FB
		cmp	[bp+var_5C], 0
		jz	short loc_947FB
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_947FB:				; CODE XREF: sub_8B630+91ABj
					; sub_8B630+91B2j
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_94833
		cmp	[bp+var_52], 0
		jz	short loc_94833
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_94833:				; CODE XREF: sub_8B630+91E3j
					; sub_8B630+91EAj
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_9486B
		cmp	[bp+var_48], 0
		jz	short loc_9486B
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9486B:				; CODE XREF: sub_8B630+921Bj
					; sub_8B630+9222j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_948A3
		cmp	[bp+var_3E], 0
		jz	short loc_948A3
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_948A3:				; CODE XREF: sub_8B630+9253j
					; sub_8B630+925Aj
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		mov	[bp+var_CEA], 185Fh
		lea	ax, [bp+var_CEA]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_CD5], 0
		jz	short loc_948F2
		cmp	[bp+var_CDA], 0
		jz	short loc_948F2
		push	0
		mov	al, [bp+var_CD6]
		push	ax
		lea	ax, [bp+var_CDA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_948F2:				; CODE XREF: sub_8B630+929Fj
					; sub_8B630+92A7j
		mov	[bp+var_CDA], 0
		mov	[bp+var_CD5], 0
		mov	[bp+var_CD4], 0
		lea	ax, [bp+var_4C4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4BB], 0
		jz	short loc_9493E
		cmp	[bp+var_4C0], 0
		jz	short loc_9493E
		push	0
		mov	al, [bp+var_4BC]
		push	ax
		lea	ax, [bp+var_4C0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9493E:				; CODE XREF: sub_8B630+92EBj
					; sub_8B630+92F3j
		mov	[bp+var_4C0], 0
		mov	[bp+var_4BB], 0
		mov	[bp+var_4BA], 0
		push	2
		lea	ax, [bp+var_4B6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_27], 0
		jz	short loc_94988
		cmp	[bp+var_2C], 0
		jz	short loc_94988
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_94988:				; CODE XREF: sub_8B630+9338j
					; sub_8B630+933Fj
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		push	2
		lea	ax, [bp+var_43E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_25E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_1E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_18]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D8]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_E]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_8B630	endp

ovr203		ends
